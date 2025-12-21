local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#classic
<< Alliance
#name 1-6 北郡圣光之愿 赛季服
#displayname 1-6 北郡 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-20级
#defaultfor Human
#next 6-12 艾尔文森林 赛季服
#season 2


step << !Human
    #completewith next
    +您已选择适用于人类的指南. 请确保选择与您起始区域相同的起始地带
step
    #softcore << Warlock
    #optional
    #completewith Within
    .destroy 6948 >>摧毁: |cRXP_ENEMY_炉石|r, 它在你的背包中. 不再需要它了
step
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 783 >>接任务: |cRXP_LOOT_身边的危机|r
    .target Deputy Willem
step << Warrior/Rogue/Mage/Warlock
    .goto Elwynn Forest,46.4,40.3
    .xp 2 >>击杀|cRXP_ENEMY_幼狼|r, 直到等级达到2级(共4只)
    >>确保你拾取它们, 你需要15c来购买符文+训练 << Rogue/Warrior
    >>确保你拾取它们, 你需要30金币来购买手套和符文 << Mage
    >>确保你拾取它们, 你需要40c来购买护腕和训练和符文 << Warlock
step << Mage/Warlock
    .goto Elwynn Forest,47.57,41.43
    >>|cRXP_WARN_如果你没有30铜币价值的垃圾物品, 就多杀些狼|r << Mage
    >>|cRXP_WARN_如果你没有40铜币价值的垃圾物品, 就再多杀些狼|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德尔莫特·约翰斯|r 对话
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>出售垃圾并购买|T132952:0|t[薄布手套], 你很快就会用到它们来刻印符文 << Mage
    >>出售垃圾并购买|T132602:0|t[薄布护腕], 你很快会需要它们来刻印符文 << Warlock
    .collect 2119,1 << Mage --Thin Cloth Gloves (1)
    .collect 3600,1 << Warlock --Thin Cloth Bracers (1)
    .target Dermot Johns
step << Warrior/Rogue/Mage/Warlock
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_出售垃圾并购买|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r] << Warrior
    .vendor >>|cRXP_BUY_出售垃圾并购买|T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r]|r << Rogue
    .vendor >>|cRXP_BUY_购买所有关键的群体伤害符文|r << Mage
    .vendor >>|cRXP_BUY_购买以下所有符文:|r << Warlock
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 204795,1 << Rogue --Rune of Shadowstrike
    .collect 203746,1 << Mage --Spell Notes: Living Flame
    .collect 208799,1 << Mage --Spell Notes: Living Bomb
    .collect 203748,1 << Mage --Spell Notes: Burnout
    .collect 225690,1 << Mage --Spell Notes: Frozen Orb
    .collect 205215,1 << Warlock --Rune of Tactics
    .collect 210824,1 << Warlock --Rune of the Pact
    .collect 211477,1 << Warlock --Rune of Incinerate
    .collect 205230,1 << Warlock --Rune of Haunting
    .collect 228797,1 << Warlock --Grimoire of Fel Armor
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Warrior/Rogue/Mage
    .train 400105 >>使用 |T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r] 来训练 |T132323:0|t[暗影之击], 你将很快刻印它 << Rogue
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利之纹|r] 来训练 |T132342:0|t[胜利冲刺], 你将很快将其刻印 << Warrior
    .train 401768 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Living Flame|r]来训练|T135820:0|t[Living Flame] << Mage
    .train 415936 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 活体炸弹|r]来训练|T236220:0|t[活体炸弹] << Mage
    .train 401759 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Burnout|r]来训练|T236207:0|t[Burnout] << Mage
    .train 440858 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 冰霜宝珠|r]来训练|T135851:0|t[冰霜宝珠] << Mage
    .train 416009 >>使用|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]来训练|T136150:0|t[恶魔战术] << Warlock
    .train 425476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 契约符文|r] 来训练 |T237562:0|t[恶魔契约] << Warlock
    .train 211477 >>使用 |T134419:0|t[|cRXP_FRIENDLY_灼烧符文|r] 来训练 |T135789:0|t[灼烧] << Warlock
    .train 403919 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 噩梦符文|r]来训练 |T236298:0|t[诅咒之魂] << Warlock
    .train 403619 >>使用 |T133733:0|t[邪恶护甲典籍] 来学习 |T136156:0|t[邪恶护甲]|cRXP_WARN_请将其作为你的主要护甲法术|r << Warlock
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 208799 << Mage --Spell Notes: Living Bomb
    .use 203748 << Mage --Spell Notes: Burnout
    .use 225690 << Mage --Spell Notes: Frozen Orb
    .use 204806 << Warrior --Rune of Victory Rush
    .use 204795 << Rogue --Rune of Shadowstrike
    .use 205215 << Warlock --Rune of Tactics
    .use 210824 << Warlock --Rune of the Pact
    .use 211477 << Warlock --Rune of Incinerate
    .use 205230 << Warlock --Rune of Haunting
    .use 228797 << Warlock --Grimoire of Fel Armor
step << Warlock
    #optional
    #sticky
    .aura 403619 >>|cRXP_WARN_ 请务必记得激活你的|r|T136156:0|t[邪能护甲]
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .accept 77616 >>接受失落的符文
    .turnin 77616 >>交还失落的符文
    .goto Elwynn Forest,50.242,42.287
    .mob Young Wolf
    .target Llane Beshere
step << Warrior/Rogue/Mage/Warlock
    .equip 10 >>装备 |T132952:0|t[薄布手套] << Mage
    .use 2119 << Mage --Thin Cloth Gloves
    .engrave 7 >>在你的裤子上刻上[活火] << Mage
    .engrave 10 >>在你的手套上刻上|T236220:0|t[活体炸弹] << Mage
    .engrave 5 >>在你的胸前刻上|T236207:0|t[燃尽] << Mage
    .equip 10 >>装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .engrave 10 >>在你的手套上刻上[胜利冲刺]|T132342:0|t << Warrior
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .equip 10 >>装备 |T132952:0|t[破损的皮手套] << Rogue
    .engrave 10 >>在你的手套上刻印|T132323:0|t[暗影之击] << Rogue
    .use 2125 << Rogue --Cracked Leather Gloves
    .equip 9 >>装备 |T132602:0|t[薄布护腕] << Warlock
    .use 3600 << Warlock --Thin Cloth Bracers
    .engrave 5 >>在你的胸口刻上|T136150:0|t[恶魔战术] << Warlock
    .engrave 7 >>在你的裤子上刻上|T237562:0|t[恶魔契约] << Warlock
    .engrave 9 >>在你的护腕上刻上[灼烧] |T135789:0|t << Warlock
step
    #label Within
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 783 >>交任务: |cRXP_FRIENDLY_身边的危机|r
    .accept 7 >>接任务: |cRXP_LOOT_剿灭狗头人|r
    .target Marshal McBride
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 5261 >>接任务: |cRXP_LOOT_伊根·派特斯金纳|r
    .accept 18 >>接任务: |cRXP_LOOT_潜行者兄弟会|r << Warlock
    .target Deputy Willem
step << Warlock
    #season 2
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .accept 1598 >>接任务: |cRXP_LOOT_失窃的典籍|r
    .accept 77621 >>接任务: |cRXP_WARN_失窃的力量|r << Human
    .turnin 77621 >>交任务: |cRXP_FRIENDLY_失窃的力量|r << Human
    .train 348 >>训练 |T135817:0|t[献祭]
    .target Drusilla La Salle
step << Human Warlock
    #season 2
    #label GlovesEquip
    #completewith RestandR
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .itemcount 711,1 --Tattered Cloth Gloves (1)
    .train 403919,3
step << Human Warlock
    #season 2
    #requires GlovesEquip
    #completewith RestandR
    .engrave 10 >>|cRXP_WARN_刻印你的|r|T132961:0|t[破布手套] |cRXP_WARN_附魔|r|T236298:0|t[幽魂]
    .train 403919,3
step << Warlock
    #completewith next
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后可拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob Defias Thug
step << Warlock
    .goto Elwynn Forest,56.7,44.0
    >>|cRXP_WARN_进入迪菲亚营地的帐篷|r
    >>打开|cRXP_PICK_被偷走的书|r, 从中获取|cRXP_LOOT_虚空灵能|r
    .complete 1598,1 --Collect Powers of the Void (x1)
step << Warlock
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后可拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob Defias Thug
step << Warlock
    #hardcore
    #completewith next
    .goto Elwynn Forest,56.828,43.734
    .hs >>传送至北郡山谷
step << Warlock
    #softcore
    #completewith next
    .goto 1429,49.527,43.491,0
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
step << Warlock
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 1598 >>交任务: |cRXP_FRIENDLY_失窃的典籍|r
    .target Drusilla La Salle
step << Warlock
    #optional
    #completewith next
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
    .usespell 688
step << Warlock
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r
    .target Deputy Willem
step << Warlock
    #optional
    #completewith next
    .equip 16,2224 >>装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.0
step << Priest/Paladin
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_BUY_向他出售你的|r|T135005:0|t[衬衫], 并从他那里|cRXP_BUY_购买|r|T135975:0|t[被亵渎要塞的友好预言]|r << Priest
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]和 |T132540:0|t[靴子]|cRXP_WARN_(它们无法刻印)|r|cRXP_BUY_并从他处购买 |T133745:0|t[|cRXP_FRIENDLY_殉道者遗志|r]和 |T134916:0|t[|cRXP_FRIENDLY_裁决之书|r]|r << Paladin
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    .collect 226398,1  << Paladin --Testament of Martyrdom
    .collect 205420,1 << Paladin --Libram of Judgement
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step << Priest/Paladin
    #sticky
    #label Libram
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 226398 << Paladin --Testament of martyrdom
    .use 205420 << Paladin --Libram of Judgement
    .train 402852 >>使用 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r] 来训练 |T237570:0|t[人造人] << Priest
    .train 407798 >>使用 |T133745:0|t[|cRXP_FRIENDLY_殉道遗嘱|r] 来训练 |T135961:0|t[殉道之印], |cRXP_WARN_请将其作为您的主要封印|r << Paladin
    .equip 18 >>装备 |T134916:0|t[正义之书], 30秒后可使用它来学习 |T135891:0|t[十字军打击] << Paladin
    .engrave 7 >>在你的裤子上刻上|T237570:0|t[人造人] << Priest
step << Paladin
    #optional
    #completewith Vermin
    .aura 407798 >>请记得使用|T135961:0|t[殉道者之印]作为你的封印
step << Paladin
    #sticky
    #optional
    #requires Libram
    #label LibramLearn
    .train 410002 >>使用|T134916:0|t[圣光审判之书]学习|T135891:0|t[十字军打击]
step << Paladin
    #optional
    #requires LibramLearn
    #completewith PalaQ
    .engrave 10 >>|cRXP_WARN_留意任何|r|T132952:0|t[手套]|cRXP_WARN_掉落. |r|cRXP_WARN_用|r|T135891:0|t[十字军打击]进行铭刻|r
    >>如果你找不到任何东西, 最终会从职业任务中获得它们
step
    #label EaganWolves
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 5261 >>交任务: |cRXP_FRIENDLY_伊根·派特斯金纳|r
    .accept 33 >>接任务: |cRXP_LOOT_林中的群狼|r
    .target Eagan Peltskinner
step << Rogue
    #completewith next
    >>击杀前往训练师路上的|cRXP_ENEMY_狼|r和|cRXP_ENEMY_狗头人歹徒|r
    .complete 33,1 --Tough Wolf Meat (8)
    .complete 7,1 -- Kobold Vermin Slain (10)
    .mob Young Wolf
	.mob Timber Wolf
    .mob Kobold Vermin
step << Rogue
    .goto Elwynn Forest,50.6,40.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .accept 77618 >>接受“三度被盗”
    .turnin 77618 >>上交三度被盗的物品
    .train 1784 >>训练 |T132320:0|t[潜行], 你将需要它来使用 |T135131:0|t[暗影之击]
    .target Jorik Kerridan
step << Mage
    #optional
    #sticky
    .engrave 15 >>留意任何披风掉落. 一旦获得, 用|T135851:0|t[冰霜宝珠]对其进行附魔
    >>|cRXP_WARN_这个法术极其强大|r
step << Mage/Warlock
    #completewith next
    .goto Elwynn Forest,46.2,40.4,40,0
    .goto Elwynn Forest,47.486,41.566
    >>|cRXP_WARN_一旦你收集到价值50铜币的可出售垃圾:|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>出售垃圾
    >>|cRXP_BUY_从他那里购买 10|r|T132794:0|t[清凉的泉水]|r
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Brother Danil
step << Paladin
    #label Vermin
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    .complete 7,1 --Kill Kobold Vermin (x10)
    .mob Kobold Vermin
step
    #sticky
    #label WolfMeatEnd
    .goto 1429,49.052,38.270,0
    .goto 1429,45.708,38.720,0
    .goto 1429,47.976,39.422,0
    .waypoint 1429,49.052,38.270,45,0
    .waypoint 1429,48.362,37.582,45,0
    .waypoint 1429,47.136,37.636,45,0
    .waypoint 1429,46.870,36.906,45,0
    .waypoint 1429,46.476,37.034,45,0
    .waypoint 1429,46.465,38.272,45,0
    .waypoint 1429,45.896,38.013,45,0
    .waypoint 1429,45.708,38.720,45,0
    .waypoint 1429,46.302,39.994,45,0
    .waypoint 1429,45.718,40.733,45,0
    .waypoint 1429,46.399,41.838,45,0
    .waypoint 1429,46.741,40.987,45,0
    .waypoint 1429,47.703,40.299,45,0
    .waypoint 1429,47.976,39.422,45,0
    >>击杀|cRXP_ENEMY_幼狼|r和|cRXP_ENEMY_狂暴的冬狼|r. 击杀后可掠夺其|cRXP_LOOT_硬狼肉|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob Young Wolf
	.mob Timber Wolf
step << !Priest !Paladin
    #loop
    .goto 1429,47.601,36.720,0
    .goto 1429,49.215,37.010,0
    .goto 1429,47.569,34.967,0
    .goto 1429,47.601,36.720,45,0
    .goto 1429,47.381,36.314,45,0
    .goto 1429,47.611,35.863,45,0
    .goto 1429,48.314,36.487,45,0
    .goto 1429,49.070,36.438,45,0
    .goto 1429,49.215,37.010,45,0
    .goto 1429,49.838,36.413,45,0
    .goto 1429,50.105,35.668,45,0
    .goto 1429,49.823,35.161,45,0
    .goto 1429,48.845,35.066,45,0
    .goto 1429,47.569,34.967,45,0
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    .complete 7,1 --Kill Kobold Vermin (x10)
    .mob Kobold Vermin
step << !Priest !Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,45.718,40.733,0
    .xp 3+720 >>升级至720/1400经验值
    .mob Young Wolf
	.mob Timber Wolf
step
    #requires WolfMeatEnd
    .goto Elwynn Forest,48.941,40.166
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根·派特斯金纳|r交谈
    .turnin 33,2 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << Warrior/Paladin/Rogue
    .turnin 33,1 >>交任务: |cRXP_FRIENDLY_林中的群狼|r << !Warrior !Paladin !Rogue
    .target Eagan Peltskinner
step << Paladin
    #optional
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    +|cRXP_WARN_击杀|cRXP_ENEMY_狗头人歹徒|r或|cRXP_ENEMY_狼|r, 出售垃圾物品, 直到你至少拥有 93 铜|r
    .money >0.0093
    .mob Kobold Vermin
    .mob Young Wolf
	.mob Timber Wolf
step << !Priest !Paladin
    #xprate >1.59
    #optional
    #loop
    .goto 1429,45.718,40.733,0
    .goto 1429,47.976,39.422,45,0
    .goto 1429,47.703,40.299,45,0
    .goto 1429,46.741,40.987,45,0
    .goto 1429,46.399,41.838,45,0
    .goto 1429,45.718,40.733,45,0
    .goto 1429,46.302,39.994,45,0
    .goto 1429,45.708,38.720,45,0
    .goto 1429,45.896,38.013,45,0
    .xp 3+1060 >>升级至1060/1400经验值
    .mob Young Wolf
	.mob Timber Wolf
step << Paladin
    .goto Elwynn Forest,47.70,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈德里克·罗斯加尔|r交谈
    >>|cRXP_WARN_由于早期盾牌符文的强大效果, 使用盾牌和单手武器升级会快得多|r
    >>|cRXP_BUY_出售垃圾并购买|r|T134955:0|t[小盾牌]
    .collect 17184,1 --Small Shield (1)
    .target Godrick Rothgar
step << Paladin
    .goto Elwynn Forest,47.25,41.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚努斯·哈默纳克|r交谈
    >>|cRXP_WARN_由于早期盾牌符文的强大效果, 使用盾牌和单手武器升级会快得多|r
    >>|cRXP_BUY_出售垃圾并购买|r|T133485:0|t[短棍]
    .collect 2130,1 --Club (1)
    .target Janos Hammerknuckle
step << Paladin
    .equip 16,2130 >>装备 |T133485:0|t[短棍]
    .equip 17,17184 >>装备 |T134955:0|t[小盾牌]
    .use 2130 --Club
    .use 17184 --Small Shield
step << Warrior
    #xprate >1.59
    #optional
    #completewith CleanupEnd
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    +|cRXP_WARN_刷怪并出售垃圾, 直到你拥有1银|r
    .money >0.01
    .train 100,1 << Warrior --Charge
    .train 20271,1 << Paladin --Judgement
    .isOnQuest 7
step << Priest
    #optional
    #completewith next
    .equip 8,80 >>|cRXP_WARN_装备|r|T132543:0|t[柔软的毛边鞋], 你将用它来刻印符文
step << Priest
    .goto Elwynn Forest,47.57,41.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德尔莫特·约翰斯|r 对话
    >>如果你没有足够的钱购买这两件物品|cRXP_WARN_(60铜)|r, 请击杀更多的|cRXP_ENEMY_狼|r
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>出售垃圾并购买|T132495:0|t[薄布腰带]和|T132952:0|t[薄布手套], 你很快就会用它们来刻印符文
    .collect 3599,1 --Thin Cloth Belt (1)
    .collect 2119,1 --Thin Cloth Gloves (1)
    .target Dermot Johns
step << Priest/Mage/Warlock
    .goto Elwynn Forest,47.486,41.566
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>出售垃圾
    >>|cRXP_BUY_再买10个|r|T132794:0|t[清凉的泉水]|cRXP_BUY_从他处获得|r
    >>|cRXP_WARN_确保你至少存下10铜币, 留着以后用|r << Priest/Mage
    .collect 159,10 --Collect Refreshing Spring Water (x10)
    .target Brother Danil
step << Priest/Paladin
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_购买以下所有符文:|r
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
step << Priest/Paladin
    .train 431663 >>使用|T135791:0|t[心灵顿悟]来训练|T136181:0|t[心灵尖刺] << Priest
    .train 425216 >>使用|T136222:0|t[|cRXP_FRIENDLY_黑暗记忆|r]来训练|T237514:0|t[虚空瘟疫] << Priest
    .train 402862 >>使用|T136222:0|t[|cRXP_FRIENDLY_侍僧的回忆|r]来训练|T237545:0|t[忏悔] << Priest
    .train 402849 >>使用|T135975:0|t[|cRXP_FRIENDLY_国王之死的预言|r]来训练|T136149:0|t[暗影之言:死亡] << Priest
    .train 410014 >>使用|T134419:0|t[|cRXP_FRIENDLY_神圣风暴符文|r]来训练|T236250:0|t[神圣风暴] << Paladin
    .train 410008 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 复仇者之符|r]来训练|T135874:0|t[复仇者之盾] << Paladin
    .train 410013 >>使用|T134419:0|t[|cRXP_FRIENDLY_正义之锤的符文|r]来训练 |T236253:0|t[正义之锤] << Paladin
    .train 440788 >>使用|T134419:0|t[|cRXP_FRIENDLY_正义之盾符文|r]来训练|T236265:0|t[正义之盾] << Paladin
    .use 212552 << Priest --Psychosophic Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 235600 << Paladin --Rune of Divine Storm
    .use 211488 << Paladin --Rune of the Avenger
    .use 235602 << Paladin --Rune of the Hammer of the Righteous
    .use 235604 << Paladin --Rune of the Shield of Righteousness
step << Paladin
    #sticky
    >>|cRXP_WARN_留意任何|r|T132624:0|t[胸甲]|cRXP_WARN_,|r|cRXP_WARN_或|r|T133762:0|t[披风]|cRXP_WARN_你都可以装备|r
    .engrave 5 >>在你的胸前刻上|T236250:0|t[神圣风暴]
    .engrave 15 >>在你的斗篷上刻印|T236265:0|t[正义之盾]
step << Priest/Paladin
    .use 6070 << Paladin --Wolfskin Bracers
    .equip 9 >>装备 |T132604:0|t[狼皮护腕] << Paladin
    .engrave 6 >>在你的腰带上刻上|T136181:0|t[心灵尖刺] << Priest
    .engrave 8 >>在你的靴子上刻上|T237514:0|t[虚空瘟疫] << Priest
    .engrave 10 >>在你的手套上刻印「暗影之言:死」|T136149:0|t << Priest
    .engrave 7 >>在你的裤子上刻上|T135874:0|t[复仇者之盾] << Paladin
    .engrave 9 >>在你的护腕上刻上 |T236253:0|t[正义之锤] << Paladin
step << Priest/Paladin
    #loop
    .goto 1429,47.601,36.720,0
    .goto 1429,49.215,37.010,0
    .goto 1429,47.569,34.967,0
    .goto 1429,47.601,36.720,45,0
    .goto 1429,47.381,36.314,45,0
    .goto 1429,47.611,35.863,45,0
    .goto 1429,48.314,36.487,45,0
    .goto 1429,49.070,36.438,45,0
    .goto 1429,49.215,37.010,45,0
    .goto 1429,49.838,36.413,45,0
    .goto 1429,50.105,35.668,45,0
    .goto 1429,49.823,35.161,45,0
    .goto 1429,48.845,35.066,45,0
    .goto 1429,47.569,34.967,45,0
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    .complete 7,1 --Kill Kobold Vermin (x10)
    .mob Kobold Vermin
step << Priest/Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,45.718,40.733,0
    .xp 3+720 >>升级至720/1400经验值
    .mob Young Wolf
	.mob Timber Wolf
step << !Priest !Mage !Warlock !Rogue !Paladin
    .goto Elwynn Forest,47.691,41.417
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高德瑞克·洛斯迦|r交谈
    .vendor >>出售垃圾
    .target Godric Rothgar
step << Mage
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    >>请确保你已购买 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 寒冰之枪|r], 它将用于交还一个额外任务
    .collect 203745,1 --Spell Notes: Ice Lance
    .target Rune Broker
    .skipgossip
step << Mage
    #sticky
    #optional
    #label IceLance
    .train 401760 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 寒冰之枪|r]来训练|T135844:0|t[寒冰之枪]
step
    #label CleanupEnd
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 7 >>交任务: |cRXP_FRIENDLY_剿灭狗头人|r
    .accept 15 >>接任务: |cRXP_LOOT_回音山调查行动|r
    .accept 3100 >>接任务: |cRXP_LOOT_简要的信件|r << Warrior
    .accept 3101 >>接任务: |cRXP_LOOT_圣洁信件|r << Paladin
    .accept 3102 >>接任务: |cRXP_LOOT_密文信件|r << Rogue
    .accept 3103 >>接任务: |cRXP_LOOT_神圣信件|r << Priest
    .accept 3104 >>接任务: |cRXP_LOOT_雕文信件|r << Mage
    .accept 3105 >>接任务: |cRXP_LOOT_被污染的信件|r << Warlock
    .target Marshal McBride




----Start of 2x level 4 training----




step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>前往凯尔登·布雷门所在的楼上
step << Mage
    #requires IceLance
    #xprate >1.59
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .goto Elwynn Forest,49.661,39.402
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r
    .accept 77620 >>接受法术研究 << Human
    .turnin 77620 >>提交法术研究 << Human
    .trainer >>训练你的职业法术
    .target Khelden Bremen
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >>前往楼下的女牧师安妮塔
step << Priest
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r
    .accept 77619 >>接任务: |cRXP_WARN_圣光之思|r << Human
    .turnin 77619 >>交任务: |cRXP_FRIENDLY_圣光之思|r << Human
    .trainer >>训练你的职业法术, |cRXP_WARN_如果负担不起, 请跳过训练. 反正你主要会使用符文技能|r
    .target Priestess Anetta
step << Warrior/Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下找|cRXP_FRIENDLY_莱尼·拜舍尔|r << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下的萨缪尔修士方向 << Paladin
step << Warrior
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,50.242,42.287
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_莱尼·拜舍尔|r交谈
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r
    .accept 77616 >>接受失落的符文 << Human
    .turnin 77616 >>交还失落的符文 << Human
    .train 100 >>训练 |T132337:0|t[冲锋]
    .target Llane Beshere
step << Paladin
    #xprate >1.59
    #season 2
    #label PalaQ
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r
    .accept 77617 >>接受圣光遗物 << Human
    .turnin 77617 >>交还光明圣物 << Human
    >>|cRXP_WARN_如果你有多余的钱, 可以花在|r|T135906:0|t[力量祝福]和|T135959:0|t[审判]|cRXP_WARN_或|r|T135029:0|t[胸甲]|cRXP_WARN_上, 如果你还没拿到这些物品的话. 我建议优先选择胸甲|r
    .target Brother Sammuel
step << Paladin
    #optional
    #completewith RestandR
    .use 2385 --Tarnished Chain Gloves
    .equip 10 >>如果你尚未找到其他手套, 请装备 |T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r
    .engrave 10 >>|cRXP_WARN_刻印|r|T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r|cRXP_WARN_附带|r|T135891:0|t[十字军打击] << Paladin
step << Priest/Warrior/Paladin
    #xprate >1.59
    #season 2
    #optional
    #completewith RuneWorkers
    .goto 1429,48.198,41.890,12 >>离开北郡修道院
step
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外部的|cRXP_FRIENDLY_维里副队长|r交谈
    .accept 18 >>接任务: |cRXP_LOOT_潜行者兄弟会|r
    .target Deputy Willem
step << !Mage !Priest !Paladin
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
step
    #xprate >1.59
    #season 2
    #label RuneWorkers
    #loop
    .goto 1429,47.468,36.298,0
    .goto 1429,50.224,34.125,0
    .goto 1429,50.835,38.046,0
    .goto 1429,47.468,36.298,45,0
    .goto 1429,47.247,35.164,45,0
    .goto 1429,47.012,33.828,45,0
    .goto 1429,46.774,33.271,45,0
    .goto 1429,46.271,32.489,45,0
    .goto 1429,47.663,32.058,45,0
    .goto 1429,48.038,33.075,45,0
    .goto 1429,48.795,33.815,45,0
    .goto 1429,49.278,34.610,45,0
    .goto 1429,50.224,34.125,45,0
    .goto 1429,50.245,34.884,45,0
    .goto 1429,51.058,35.582,45,0
    .goto 1429,52.062,35.801,45,0
    .goto 1429,51.505,38.064,45,0
    .goto 1429,50.835,38.046,45,0
    >>击杀|cRXP_ENEMY_狗头人劳工|r
    .complete 15,1 --Kill Kobold Worker (x10)
    .mob Kobold Worker
step << Rogue
    #xprate >1.59
    #season 2
    #requires Shadowstrike2
    .goto Elwynn Forest,50.314,39.916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔里克·克里丹|r交谈
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r
    .target Jorik Kerridan
step << !Warlock
    #xprate >1.59
    #season 2
    #loop
    #label EarlyRedBurlapBandana
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r. 击败他们后可拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob Defias Thug
step
    #optional
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << !Warlock
    #xprate >1.59
    #season 2
    #requires Shadowstrike2 << Rogue
    #requires EarlyLibram4 << Paladin
    .goto Elwynn Forest,48.17,42.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 18,1 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Rogue
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Paladin
    .turnin 18,2 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Priest
    .turnin 18,3 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Warrior
    .turnin 18,5 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << Mage
    .turnin 18 >>交任务: |cRXP_FRIENDLY_盗贼兄弟会|r << !Warrior !Priest !Mage !Rogue !Warlock !Paladin
    .target Deputy Willem
step << Rogue
    #xprate >1.59
    #season 2
    #completewith RestandR
    .equip 16,2224 >>装备 |T135641:0|t[民兵匕首]
    .use 2224
    .itemcount 2224,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.01
step << Paladin
    #xprate >1.59
    #season 2
    #completewith RestandR
    .equip 16,5580 >>装备|T133052:0|t[民兵之锤]
    .use 5580
    .itemcount 5580,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.97
step << Warrior
    #completewith RestandR
    .equip 16,1161 >>装备 |T135274:0|t[民兵短剑]
    .use 1161
    .itemcount 1161,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.01
step << Human Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto Elwynn Forest,49.3,40.7,15,0
    .goto Elwynn Forest,49.8,40.2,10 >>前往楼下的女牧师安妮塔
step << Human Priest
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师安妮塔|r交谈
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
    .target Priestess Anetta
    .isOnQuest 77619
    .xp <5,1
step << Human Warrior/Human Paladin
    #xprate >1.59
    #season 2
    #optional
    #completewith next
    .goto Elwynn Forest,48.85,41.76,15,0
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下找|cRXP_FRIENDLY_莱尼·拜舍尔|r << Warrior
    .goto Elwynn Forest,49.6,41.8,15 >>前往楼下的萨缪尔修士方向 << Paladin
step << Human Paladin
    #xprate >1.59
    #season 2
    .goto Elwynn Forest,50.433,42.124
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_萨缪尔修士|r交谈
    .turnin 77617 >>交还光明圣物
    .train >>训练你的职业法术
    .target Brother Sammuel
    .isOnQuest 77617
step << Human Paladin
    #xprate >1.59
    #season 2
    #completewith RestandR
    #label GlovesEquip
    .equip 10,2385 >>|cRXP_WARN_装备|r|T132938:0|t|cRXP_LOOT_[无光泽的链甲手套]|r
    .use 2385
    .itemcount 2385,1
    .train 403470,3 << Warrior
    .train 410002,3 << Paladin
    .itemStat 10,LEVEL,<5
step
    #xprate >1.59
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 15 >>交任务: |cRXP_FRIENDLY_回音山调查行动|r
    .accept 21 >>接任务: |cRXP_LOOT_回音山清剿行动|r
    .target Marshal McBride
step << Human Paladin/Warrior/Priest
    #xprate >1.59
    #season 2
    #optional
    #completewith next
    .goto 1429,48.279,42.171,8 >>离开北郡修道院
    .isQuestTurnedIn 15 << Warrior/Priest
    .isQuestTurnedIn 18 << Paladin
step << Warlock
    #xprate >1.59
    .goto Elwynn Forest,49.873,42.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜希拉·拉萨雷|r交谈
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
    .target Drusilla La Salle



----End of 2x training section----


step << Priest/Paladin
    .goto Elwynn Forest,48.22,41.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_出售垃圾并购买所有你想要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
step
    #optional
    #completewith next
    .goto Elwynn Forest,47.63,32.07,20 >>进入回声岭矿坑
step
    #loop
    .goto 1429,47.784,31.540,0
    .goto 1429,48.659,29.161,0
    .goto 1429,50.491,26.867,0
    .goto 1429,47.784,31.540,30,0
    .goto 1429,47.909,30.850,30,0
    .goto 1429,48.107,30.271,30,0
    .goto 1429,48.428,30.248,30,0
    .goto 1429,48.398,29.842,30,0
    .goto 1429,48.659,29.161,30,0
    .goto 1429,48.245,28.598,30,0
    .goto 1429,48.637,27.354,30,0
    .goto 1429,48.501,26.700,30,0
    .goto 1429,49.979,25.620,30,0
    .goto 1429,50.491,26.867,30,0
    >>击杀回声岭矿井内的狗头人苦力
    .complete 21,1 --Kill Kobold Laborer (x12)
    .mob Kobold Laborer
step
	#softcore
    #completewith next
    .deathskip >>在北郡的灵魂医者处死亡并重生
    .target Spirit Healer
step
    #xprate >1.49
    #optional
    #completewith RestandR
    .abandon 3904 >>放弃米莉的葡萄
step
    #xprate >1.49
    #optional
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
    .xp 5+1205 >>升级至1205/2800经验值 << Paladin/Warrior
    .xp 5+1040 >>升级至1040+/2800经验值 << !Paladin !Warrior !Priest
    .xp 5+875 >>升级至875/2800经验值 << Priest
    .mob Defias Thug
step
    #optional
    #softcore
    #completewith #label RestandR
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .subzoneskip 59,1
step
    #label RestandR
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 21,1 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Rogue
    .turnin 21,2 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << Warrior/Paladin
    .turnin 21,3 >>交任务: |cRXP_FRIENDLY_回音山清剿行动|r << !Warrior !Paladin !Rogue
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .target Marshal McBride
step << Priest
    #optional
    #season 2
    .goto Elwynn Forest,49.808,39.489
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师安妮塔|r 交谈
    .accept 5623 >>接任务: |cRXP_LOOT_圣光的恩赐|r
    .target Priestess Anetta
step
    .goto Elwynn Forest,45.563,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .accept 2158 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
]])


RXPGuides.RegisterGuide([[
#classic
#season 2
#version 1
<< Alliance
#group RestedXP 联盟 1-20级
#name 6-12 艾尔文森林 赛季服
#displayname 6-12 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 12-13 丹莫罗 赛季服
#defaultfor Human

step
    #season 0,1 << Rogue
    #hardcore
    #completewith next
    .subzone 87 >>前往闪金镇
step
    #hardcore
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .target Marshal Dughan
step
    #season 0,1 << Rogue
    #softcore
    #completewith Goldshire
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .subzoneskip 87
step
    #softcore
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马歇尔·杜根|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .target Marshal Dughan
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 可以从她那里购买一个|r|T135321:0|t[步兵剑]|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0536
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith next
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0400
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith GSHS
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_WARN_如果你负担得起, 就从她那里买一个|r|T133053:0|t[木槌棒]|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith next
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Warrior/Rogue/Paladin
    .goto Elwynn Forest,41.706,65.544
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    >>|cRXP_WARN_这将使你制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_, 提升你的近战伤害2点|r << Warrior/Rogue
    >>|cRXP_WARN_这将让你制作|r|T135255:0|t[劣质平衡石]|cRXP_WARN_, 使你的近战伤害提高2点|r << Paladin
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Smith Argus
step << Mage/Priest/Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,41.706,65.786
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德温·克里顿|r交谈
    .vendor >>出售垃圾
    .target Andrew Krighton
--  .money >1.0
step
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
    .target William Pestle
step
    #label GSHS
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .turnin 2158,1 >>交任务: |cRXP_FRIENDLY_休息和放松|r << Rogue/Warrior
    .turnin 2158,2 >>交任务: |cRXP_FRIENDLY_休息和放松|r << !Rogue !Warrior
    .home >>将你的[炉石]设置为闪金镇
    .target Innkeeper Farley
step
    #optional
    .xp 6 >>升级至6级
step << Rogue
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .vendor 151 >>|cRXP_BUY_如果你买得起, 就从他那里买|r |T135641:0|t[破损的平衡飞刀] |r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .disablecheckbox
    .target Brog Hamfist
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
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>下楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r交谈
    .trainer >>训练你的职业法术
    .target Maximillian Crowe
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞琳娜·达克哈特|r交谈
    .vendor 6374 >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T133738:0|t[魔典：血契(等级 1)]|cRXP_BUY_. 如果负担不起, 可以稍后再买|r
    .target Cylina Darkheart
    .money <0.0100
    .itemcount 16321,<1 --Grimoire of Blood Pact (Rank 1)
    .train 20397,1 --Blood Pact (Rank 1)
step << Mage/Rogue/Priest
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
	.target Priestess Josetta
    .goto Elwynn Forest,43.283,65.721
    .turnin 5623 >>交任务: |cRXP_FRIENDLY_圣光的恩赐|r
    .accept 5624 >>接任务: |cRXP_LOOT_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior
    .money <0.01
    .goto Elwynn Forest,43.877,66.546,9,0 << Warrior
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .target Michelle Belle
    .train 3273 >>训练 |T135966:0|t[急救]
step << Warrior/Rogue
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .vendor 295 >>|cRXP_BUY_购买|r|T133995:0|t[达拉然奶酪]|cRXP_BUY_直到你只剩1银|r << Warrior
    .vendor 295 >>|cRXP_BUY_从他那里购买最多 20|r|T133995:0|t[达拉然奶酪]|r << Rogue
    .collect 414,20 --Dalaran Sharp (20)
    .disablecheckbox
    .target Innkeeper Farley
    .itemcount 414,<7 --Dalaran Sharp (<7)
    .money < 0.1
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Paladin
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step
    #requires DeleteOldDaggers << Rogue
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
    .target Remy "Two Times"
step << Priest
    .goto Elwynn Forest,48.148,68.046
    >>|cRXP_WARN_施放|r|T135929:0|t[治疗术(等级2)]|cRXP_WARN_和|r|T135987:0|t[真言术:坚韧], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_卫兵罗伯兹|r
    .complete 5624,1 --Heal and fortify Guard Roberts
    .target Guard Roberts
step
    #sticky
    #label BoarMeatQuest
    #loop
    .goto Elwynn Forest,32.516,85.443,0
    .goto Elwynn Forest,31.081,81.488,0
    .goto Elwynn Forest,36.182,87.799,0
    .goto Elwynn Forest,41.733,86.986,0
    .goto Elwynn Forest,37.741,78.265,0
    .goto Elwynn Forest,41.576,69.499,0
    .waypoint Elwynn Forest,31.15,85.36,40,0
    .waypoint Elwynn Forest,33.08,86.64,40,0
    .waypoint Elwynn Forest,33.51,85.22,40,0
    .waypoint Elwynn Forest,32.17,83.88,40,0
    >>击杀|cRXP_ENEMY_石牙野猪|r. 击杀后从它们身上获取|T133970:0|t|cRXP_LOOT_[野猪肉块]|r
    .collect 769,4,86,1 --Chunk of Boar Meat (4)
    .mob Stonetusk Boar
step << Warrior
    #season 2
    #sticky
    #completewith next
    >>留意|cRXP_FRIENDLY_Wandering Swordsman|r. 如果你找到他, 可以向他挑战决斗, 获胜后将获得符文 |T132334:0|t[|cRXP_FRIENDLY_Blood Frenzy|r]
    >>|cRXP_WARN_他有多个刷新点, 每次只能出现在其中一个|r  
    >>|cRXP_WARN_在这个等级, 你很可能无法单人击败他. 如果没有其他玩家可以帮你, 请跳过这一步, 等你升到10级后再回来查看他是否还在那里|r
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r和|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈 << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈 << !Rogue
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto Elwynn Forest,34.486,84.253
    .target +"Auntie" Bernice Stonefield
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r << Rogue
	.goto Elwynn Forest,34.660,84.482 << Rogue
    .target +Ma Stonefield << Rogue
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone1
    #completewith NecklaceStart
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone1
    #label RoughStoneCraft1
    #completewith NecklaceStart
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft1
    #completewith NecklaceStart
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step
    #optional
    #completewith NecklaceStart
    .goto Elwynn Forest,37.81,85.40,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #label NecklaceStart
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
    .target Billy Maclure
step
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
    .target Maybell Maclure
step
    #optional
    #completewith Lovers
    .goto Elwynn Forest,42.357,89.373
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒·马科伦|r交谈
    .vendor >>|cRXP_BUY_尽可能多地购买|r|T132815:0|t[冰镇牛奶]|cRXP_WARN_你能负担得起|r << Priest/Warlock/Mage
    .vendor >>|cRXP_WARN_出售垃圾|r << !Priest !Warlock !Mage
    .target Joshua Maclure
    .subzoneskip 64,1 --The Maclure Vineyards
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone2
    #completewith Lovers
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone2
    #label RoughStoneCraft2
    #completewith Lovers
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft2
    #completewith Lovers
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step
    #optional
    #completewith Lovers
    .goto Elwynn Forest,37.81,85.40,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    #label Lovers
    .goto Elwynn Forest,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托米·乔·斯通菲尔德|r交谈
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
    .target Tommy Joe Stonefield
step
    #requires BoarMeatQuest
    #label Pie
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 84 >>接任务: |cRXP_LOOT_比利的馅饼|r
    .target "Auntie" Bernice Stonefield
step
    .goto 1429,34.945,83.855
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莱德·斯通菲尔德|r对话, 她在里面
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
    .target Gramma Stonefield
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone3
    #completewith Exchange
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .subzoneskip 87 --Goldshire
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone3
    #label RoughStoneCraft3
    #completewith Exchange
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
    .subzoneskip 87 --Goldshire
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft3
    #completewith Exchange
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
    .subzoneskip 87 --Goldshire
step << Warrior
    #season 2
    #sticky
    #label KoboldRune
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>击杀|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击败他们后搜刮出 |T134168:0|t|cRXP_LOOT_[被斩首的狗头人头颅]|r
    >>|cRXP_WARN_这是你需要解锁的三件物品之一, 用于稍后到达暴风城时使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|r
    .collect 204476,1 -- Severed Kobold Head (1)
    .mob Kobold Tunneler
    .mob Kobold Miner
    .mob Goldtooth
    .train 403475,1
step << Rogue
    #season 2
    #sticky
    #label KoboldRune
    #completewith Exchange
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_狗头人矿工|r和|cRXP_ENEMY_狗头人隧道工|r. 击杀他们以获取|T134327:0|t|cRXP_LOOT_[右上角地图碎片]|r
    >>|cRXP_WARN_你必须|r|T132320:0|t[潜行]|cRXP_WARN_才能使用|r|T133644:0|t[扒窃]
    >>|cRXP_ENEMY_注意:|r|cRXP_WARN_ 所有|r|T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_ 步骤均用于解锁|r|T134536:0|t[快速绘制]|cRXP_WARN_ 符文. |r|cRXP_WARN_ 它虽有用, 但非升级必需, 且在解锁毒药后约22级时将不再适用. 若您不急于获取该符文, 想节省短期时间, 可直接跳过全部步骤|r
    .collect 203784,1 -- Top-Right Map Piece (1)
    .mob Kobold Miner
    .mob Kobold Tunneler
    .train 398196,1
step
    #sticky
    #label KoboldEnd
    #completewith BernicesNecklace
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败后搜刮其掉落的|cRXP_LOOT_狗头人的蜡烛|r和|cRXP_LOOT_金砂|r
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step
    .goto Elwynn Forest,43.131,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利·马科伦|r交谈
    .turnin 84 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 87 >>接任务: |cRXP_LOOT_金牙|r
    .target Billy Maclure
step << Priest
    #sticky
    #label SharedPain
    #completewith BernicesNecklace
    .goto Elwynn Forest,40.6,81.8
    >>击杀|r|cRXP_ENEMY_狗头人矿工|r. 掠夺他们以获取|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    >>|cRXP_WARN_现在不用特意去刷这个符文, 稍后可以再获得|r
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Kobold Miner
    .train 402854,1
step << Priest
    #sticky
    #requires SharedPain
    #completewith BernicesNecklace
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205945
    .itemcount 205945,1
step
    .goto Elwynn Forest,39.01,82.20,15,0
    .goto Elwynn Forest,39.92,80.11
    >>进入法戈迪普矿井中较大的开放区域之一
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #season 2
    #label BernicesNecklace
    .goto 1429,41.732,78.024
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮出|cRXP_LOOT_伯妮丝的项链|r << !Warrior !Priest
    >>击杀|cRXP_ENEMY_金牙|r. 搜刮其尸体获得|cRXP_LOOT_伯妮丝的项链|r 和 |T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r << Warrior
    >>击杀|cRXP_ENEMY_金牙|r. 击败他后搜刮|cRXP_LOOT_伯妮丝的项链|r 和 |T136222:0|t|cRXP_LOOT_[记忆：黑暗目的]|r << Priest
    >>|cRXP_WARN_注意, 他通常会带着旁边的|cRXP_ENEMY_狗头人矿工|r一起拉怪|r
    .complete 87,1 --Bernice's Necklace (1)
    .collect 204809,1 << Warrior -- Rune of Furious Thunder (1)
    .collect 205940,1 << Priest -- Memory of a Dark Purpose (1)
    .mob Goldtooth
    .train 403476,1 << Warrior
    .train 425216,1 << Priest
step
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    >>击杀狗头人隧道工和狗头人矿工. 掠夺他们的狗头人的蜡烛和金砂
    .complete 60,1 --Kobold Candle (8)
    .complete 47,1 --Gold Dust (10)
    .mob Kobold Tunneler
    .mob Kobold Miner
step << Rogue
    #loop
    .goto Elwynn Forest,37.81,85.40,0
    .waypoint Elwynn Forest,39.14,82.87,35,0
    .waypoint Elwynn Forest,39.16,84.79,35,0
    .waypoint Elwynn Forest,37.81,85.40,35,0
    .waypoint Elwynn Forest,36.76,83.19,35,0
    .waypoint Elwynn Forest,38.02,81.70,35,0
    .xp 9+2000 >>刷狗头人直到经验达到2000, 升到9级 
    >>|cRXP_WARN_如果你离得不远, 可以交金牙任务, 但刷怪更高效|r
step << Warrior
    #season 2
    #sticky
    #label GoldtoothRune
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[狂暴雷霆符文]|r|cRXP_WARN_来学习|r|T136048:0|t[狂暴雷霆]
    .use 204809
    .itemcount 204809,1
step << Priest
    #season 2
    #sticky
    #label GoldtoothRune
    >>|cRXP_WARN_你必须在北郡修道院或暴风城大教堂等神圣区域输入 /kneel, 才能获得[冥想]|r|T135934:0|t|T136057:0|t|cRXP_WARN_buff|r
    .train 425216 >>|cRXP_WARN_使用|r|T136222:0|t|cRXP_LOOT_[黑暗目的的记忆]|r|cRXP_WARN_来学习|r|T237514:0|t[虚空瘟疫]
    .use 205940
step << Warrior
    #season 2
    #optional
    #requires KoboldRune
--XXREQ Placeholder invis step
step
	#softcore
    #completewith next
    .deathskip >>在闪金镇的灵魂医者处死亡并重生
    .target Spirit Healer
step << skip --logout skip
    #xprate >1.49
    #hardcore
    #optional
    .goto Elwynn Forest,41.29,79.85,-1
    .goto Elwynn Forest,41.75,78.49,-1
    .goto Elwynn Forest,41.91,77.81,-1
    .goto Elwynn Forest,40.15,80.12,-1
    .goto Elwynn Forest,39.90,81.46,-1
    .goto Elwynn Forest,40.86,81.24,-1
    .goto Elwynn Forest,40.32,79.31,-1
    .goto Elwynn Forest,39.30,60.48,30 >>|cRXP_WARN_跳到洞穴内的碎纸机和漂浮的原木和箱子或矿车灯上. 通过登出再重新登录的方式完成登出跳过|r
    .subzoneskip 57,1 --Fargodeep Mine
    .isOnQuest 47
step
    #hardcore
    #optional
    #completewith Exchange
    .goto Elwynn Forest,42.140,67.254,125 >>返回闪金镇
    .subzoneskip 87 --Goldshire
step
    #softcore
    #completewith Exchange
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #label Exchange
    .goto Elwynn Forest,42.140,67.254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米“两倍”|r交谈
    >>|cRXP_WARN_不要出售|r|T133581:0|t[弹子球]|cRXP_WARN_reward. 这是一个极其珍贵的物品, 一直用到60级都非常有价值|r
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .target Remy "Two Times"
step << Priest
    #season 2
    #optional
    #completewith GoldshireEnd
    +|cRXP_WARN_如果可能的话, 在闪金镇找一位牧师, 他身上带有其他|r|T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_buffs|r
    >>|cRXP_WARN_输入 /kneel, 然后让另一位牧师在你跪下时使用 /pray 指向你, 即可获得他们的|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs, 该增益效果稍后可以使用|r
step
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .target Marshal Dughan
step
    #optional << Warrior/Rogue/Paladin
    #completewith CandlesEnd
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor >>出售垃圾
    .target Corina Steele
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.3 << Rogue
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>3.8 << Warrior
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,>5.0 << Paladin
step << Warrior
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 可以从她那里购买一个|r|T135321:0|t[步兵剑]|r
    .collect 2488,1 --Collect Gladius (1)
    .disablecheckbox
--  .money <0.0536
    .target Corina Steele
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Warrior
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 可以再买一把|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1 --Collect Stiletto (1)
    .disablecheckbox
    .target Corina Steele
--   .money <0.0400
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #optional
    #completewith next
    .engrave 10,399960 >>打开你的角色面板, 在手套上刻印 |T132304:0|t[|cRXP_FRIENDLY_Mutilate|r]. 这是目前对抗怪物最强的符文
step << Paladin
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor 54 >>|cRXP_BUY_如果你负担得起, 就从她那里买一个|r|T133053:0|t[木槌棒]|r
    .collect 2493,1 --Collect Wooden Mallet (1)
    .disablecheckbox
    .target Corina Steele
--  .money <0.0631
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #completewith CandlesEnd
    +|cRXP_WARN_装备|r|T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.0
step << Paladin
    #season 2
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    >>|cRXP_WARN_训练|r|T135949:0|t[净化]|cRXP_WARN_以获得|r|T133815:0|t[刻印胸甲 - 神盾]|cRXP_WARN_即将解锁|r
    .train 1152 >>训练 |T135949:0|t[净化]
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Paladin
    #season 0,1
    #xprate >1.59
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Warrior
    #xprate >1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step
    #label CandlesEnd
    #requires GoldtoothRune << Warrior/Priest --Season 2
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .accept 61 >>接任务: |cRXP_LOOT_送往暴风城的货物|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
    .target William Pestle
step << Warrior
    #xprate <1.59
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往旅店一楼
step << Warlock
    .goto Elwynn Forest,44.392,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r交谈
    .target Maximillian Crowe
    .trainer >>训练你的职业法术
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞琳娜·达克哈特|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 就从她那里购买|r|T133738:0|t[魔典：火焰箭(等级 2)]|cRXP_BUY_. 如果买不起, 可以稍后再买|r
    .target Cylina Darkheart
    .money <0.100
    .itemcount 16302,<1 --Grimoire of Blood Pact (Rank 1)
    .train 20270,1 --Blood Pact (Rank 1)
step << Mage/Priest/Rogue/Warrior/Paladin
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << Priest
    .goto Elwynn Forest,43.283,65.721
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
	.target Priestess Josetta
    .turnin 5624 >>交任务: |cRXP_FRIENDLY_圣光之衣|r
    .trainer >>训练你的职业法术
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    .target Keryn Sylvius
    .goto Elwynn Forest,43.872,65.937
    .trainer >>训练你的职业法术
step << Rogue/Warrior/Paladin
    .money <0.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .target Michelle Belle
    .goto Elwynn Forest,43.392,65.550
    .train 3273 >>训练 |T135966:0|t[急救]
step
    #label GoldshireEnd << Priest --Season 2
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛·哈姆菲斯特|r交谈
    .vendor >>|cRXP_WARN_如果需要, 请购买|r |T133634:0|t[棕色小袋] |r
	.target Brog Hamfist
    .money <0.2
step
    #completewith next
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    .vendor >>|cRXP_BUY_如果你买得起, 最多可从他那里购买20|r|T132815:0|t[冰镇牛奶]|r << !Warrior !Rogue !Paladin
    .vendor >>|cRXP_BUY_如果你负担得起, 最多可从他那里购买 20|r|T133995:0|t[达拉然奶酪]|r << Warrior/Rogue
    .vendor >>|cRXP_BUY_如果你负担得起, 最多可以从他那里购买10|r |T133995:0|t[达拉然奶酪] |cRXP_BUY_和10|r |T132815:0|t[冰镇牛奶] |r << Paladin
    .target Innkeeper Farley
    .money < 0.1
step << Warrior
    #season 2
    #sticky
    #label MurlocRune
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .waypoint 1429,50.833,65.453,50,0
    .waypoint 1429,52.020,65.177,50,0
    .waypoint 1429,54.144,62.468,50,0
    .waypoint 1429,56.332,63.538,50,0
    .waypoint 1429,57.162,62.157,50,0
    .waypoint 1429,57.435,63.662,50,0
    .waypoint 1429,58.237,64.888,50,0
    .waypoint 1429,56.897,67.017,50,0
    .waypoint 1429,55.523,66.707,50,0
    .waypoint 1429,55.203,66.171,50,0
    .waypoint 1429,54.236,66.888,50,0
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 从他们身上搜刮出 |T134169:0|t|cRXP_LOOT_[鱼人的头颅]|r
    >>|cRXP_WARN_这是你需要的三件物品之一, 用于在等级达到10级前往暴风城时解锁|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|r
    .collect 204477,1 -- Severed Murloc Head (1)
    .mob Murloc Streamrunner
	.mob Murloc
    .train 403475,1
step << Rogue
    #season 2
    #sticky
    #label MurlocRune
    #completewith JasperlodeExplore
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .waypoint 1429,50.833,65.453,50,0
    .waypoint 1429,52.020,65.177,50,0
    .waypoint 1429,54.144,62.468,50,0
    .waypoint 1429,56.332,63.538,50,0
    .waypoint 1429,57.162,62.157,50,0
    .waypoint 1429,57.435,63.662,50,0
    .waypoint 1429,58.237,64.888,50,0
    .waypoint 1429,56.897,67.017,50,0
    .waypoint 1429,55.523,66.707,50,0
    .waypoint 1429,55.203,66.171,50,0
    .waypoint 1429,54.236,66.888,50,0
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_鱼人蒸汽跑者|r和|cRXP_ENEMY_鱼人|r. 击杀他们以获取 |T134269:0|t|cRXP_LOOT_[右下角地图碎片]|r
    >>|cRXP_WARN_你必须|r|T132320:0|t[潜行]|cRXP_WARN_才能使用|r|T133644:0|t[扒窃]
    >>|cRXP_ENEMY_注意:|r|cRXP_WARN_ 所有|r|T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_ 步骤均用于解锁|r|T134536:0|t[快速绘制]|cRXP_WARN_ 符文. |r|cRXP_WARN_ 它虽有用, 但非升级必需, 且在解锁毒药后约22级时将不再适用. 若您不急于获取该符文, 想节省短期时间, 可直接跳过全部步骤|r
    .collect 203786,1 -- Bottom-Right Map Piece (1)
    .mob Murloc Streamrunner
    .mob Murloc
--   .mob Murloc Forager
--    .mob Murloc Lurker
    .train 398196,1
step
    #loop
    .goto 1429,50.833,65.453,0
    .goto 1429,57.435,63.662,0
    .goto 1429,54.236,66.888,0
    .goto 1429,50.833,65.453,50,0
    .goto 1429,52.020,65.177,50,0
    .goto 1429,54.144,62.468,50,0
    .goto 1429,56.332,63.538,50,0
    .goto 1429,57.162,62.157,50,0
    .goto 1429,57.435,63.662,50,0
    .goto 1429,58.237,64.888,50,0
    .goto 1429,56.897,67.017,50,0
    .goto 1429,55.523,66.707,50,0
    .goto 1429,55.203,66.171,50,0
    .goto 1429,54.236,66.888,50,0
    >>击杀|cRXP_ENEMY_鱼人|r和|cRXP_ENEMY_鱼人士兵|r. 击杀后可掠夺出|cRXP_LOOT_水晶藻叶|r
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob Murloc
	.mob Murloc Streamrunner
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone4
    #completewith JasperlodeExplore
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 打开|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob Kobold Miner
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone4
    #label RoughStoneCraft4
    #completewith JasperlodeExplore
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft4
    #completewith JasperlodeExplore
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
step << Priest
    #sticky
    #label SharedPainTwo
    #completewith JasperlodeExplore
    .goto Elwynn Forest,40.6,81.8
    >>击杀|r|cRXP_ENEMY_狗头人矿工|r. 掠夺他们以获取|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Kobold Miner
    .train 402854,1
step << Priest
    #sticky
    #requires SharedPainTwo
    #completewith JasperlodeExplore
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205945
    .itemcount 205945,1
step
    #optional
    #requires MurlocRune << Warrior/Rogue --Season 2
    #label Jasperlode
    #completewith JasperlodeExplore
    .goto Elwynn Forest,61.654,53.608,15 >>进入青金石矿洞
step << Mage
    #season 2
    #sticky
    #loop
    #label JasperlodeRune
    .goto 1429,60.599,50.811,0
    .goto 1429,60.789,56.641,0
    .goto 1429,64.528,56.678,0
    .waypoint 1429,62.656,54.266,45,0
    .waypoint 1429,62.121,55.579,45,0
    .waypoint 1429,60.789,56.641,45,0
    .waypoint 1429,62.587,57.974,45,0
    .waypoint 1429,63.724,58.199,45,0
    .waypoint 1429,64.528,56.678,45,0
    .waypoint 1429,62.656,54.266,45,0
    .waypoint 1429,60.599,50.811,45,0
    .waypoint 1429,61.296,51.676,45,0
    >>击杀|cRXP_ENEMY_狗头人地卜师|r. 从他们身上搜取 |T134939:0|t|cRXP_LOOT_[法术笔记:米尔金·瓦尔夫]|r
    .collect 203752,1
    .mob Kobold Geomancer
    .train 401768,1
step
    #label JasperlodeExplore
    .goto Elwynn Forest,61.20,51.46,15,0
    .goto Elwynn Forest,60.72,50.85,15,0
    .goto Elwynn Forest,60.39,50.16
    >>沿着中间的路径前往贾斯珀洛德矿洞探索
    .complete 76,1 --Scout through the Jasperlode Mine
step << Priest
    .goto Elwynn Forest,62.2,57.4
    >>击杀|r|cRXP_ENEMY_狗头人矿工|r. 掠夺他们以获取|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁救世主的记忆|r]
    .collect 205945,1 -- Memory of an Imprisoned Savior (1)
    .mob Kobold Miner
    .train 402854,1
step << Priest
    #optional
    #completewith next
    .train 402854 >>|cRXP_WARN_使用|r|T136222:0|t[|cRXP_FRIENDLY_被囚禁的救世主的记忆|r]|cRXP_WARN_进行训练|r|T136160:0|t[共享痛苦]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buff|r
    .use 205945
    .itemcount 205945,1
step << Warrior/Paladin/Rogue
    #optional
    #label RoughStone5
    #completewith Find
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 打开|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r << Warrior/Rogue
    >>击杀|cRXP_ENEMY_狗头人矿工|r. 开启|cRXP_PICK_破损的箱子|r. 搜刮其中的 |T135232:0|t|cRXP_LOOT_[劣质的石头]|r和 |T132889:0|t|cRXP_LOOT_[亚麻布]|r << Paladin
    .collect 2835,1 --Rough Stone (1+)
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .itemcount 2862,<1 << Rogue/Warrior --Rough Sharpening Stone (<1)
    .itemcount 3239,<1 << Paladin --Rough Weightstone (<1)
    .train 2018,3 --Blacksmithing Trained
    .mob Kobold Miner
    .subzoneskip 54,1
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStone5
    #label RoughStoneCraft5
    #completewith Find
    +|T136241:0|t[铁匠]|cRXP_WARN_the|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_into|r|T135248:0|t[劣质磨刀石] << Warrior/Rogue
    +|T136241:0|t[铁匠]|cRXP_WARN_的|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_和|r|T132889:0|t|cRXP_LOOT_[亚麻布]|r|cRXP_WARN_制成|r|T135255:0|t[劣质平衡石] << Paladin
    .collect 2862,5 << Rogue/Warrior --Rough Sharpening Stone (5)
    .disablecheckbox
    .collect 3239,5 << Paladin --Rough Weightstone (5)
    .disablecheckbox << Paladin
    .collect 2835,5 --Rough Stone (5)
    .disablecheckbox
    .collect 2589,1 << Paladin --Linen Cloth (1+)
    .disablecheckbox << Paladin
    .itemcount 2835,1 --Rough Stone (1+)
    .itemcount 2589,1 << Paladin --Linen Cloth (1+)
    .usespell 2018
    .train 2018,3
    .subzoneskip 54,1
step << Warrior/Paladin/Rogue
    #optional
    #requires RoughStoneCraft5
    #completewith Find
    .cast 2828 >>|cRXP_WARN_在你当前的武器上使用|r|T135248:0|t[劣质磨刀石]|r << Warrior/Rogue
    .cast 3112 >>|cRXP_WARN_在当前武器上使用|r|T135255:0|t[劣质平衡石]|r << Paladin
    .use 2862 << Rogue/Warrior --Rough Sharpening Stone (1)
    .use 3239 << Paladin --Rough Weightstone (1)
    .itemcount 2862,1 << Rogue/Warrior --Rough Sharpening Stone (1)
    .itemcount 3239,1 << Paladin --Rough Weightstone (1)
    .aura 2828 << Warrior/Rogue
    .aura 3112 << Paladin
    .train 2018,3
    .subzoneskip 54,1
step << Paladin
    #season 2
    #completewith next
    .goto Elwynn Forest,61.97,47.31
    .cast 1152 >>|cRXP_WARN_对里面的|cRXP_FRIENDLY_受伤的冒险者|r施放|r|T135949:0|t[净化]|r
    .target Wounded Adventurer
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Paladin
    #season 2
    .goto Elwynn Forest,61.97,47.31
    >>|cRXP_WARN_与|cRXP_FRIENDLY_受伤的冒险者|r交谈, 并对他施放|r|T135949:0|t[净化]|cRXP_WARN_后, 即可获得|r|T134419:0|t[庇护符文]|r
    .collect 205685,1 --Rune of Aegis (1)
    .target Wounded Adventurer
    .skipgossip
    .train 425619,1
    .train 1152,3 --Purify Trained
--XX gossipoption 109556
step << Paladin
    #season 2
    #completewith Find
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[护盾符文]|cRXP_WARN_来学习|r|T133815:0|t[刻印胸甲 - 护盾]
    .use 205685
    .itemcount 205685,1 --Rune of Aegis (1)
    .train 425619,1
    .train 1152,3 --Purify Trained
step << Mage
    #season 2
    #requires JasperlodeRune
    #completewith Find
    .train 401768 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记:MILEGIN VALF]|r|cRXP_WARN_来学习|r|T135820:0|t[活体之焰]
    .use 203752
step << Priest
    #optional
    #label ExitJasperlode
    #completewith Find
    .goto 1429,61.820,53.871,15 >>离开贾斯珀洛德矿井
    .subzoneskip 54,1
step << Priest
    #season 2
    #loop
    .goto 1429,74.015,51.810,0
    .goto 1429,72.561,56.666,55,0
    .goto 1429,72.396,54.428,55,0
    .goto 1429,74.015,51.810,55,0
    .goto 1429,75.155,50.751,55,0
    .goto 1429,76.815,48.877,55,0
    .goto 1429,76.676,53.898,55,0
    >>击杀|cRXP_ENEMY_迪菲亚流浪巫师|r. 掠夺他们以获得|T135975:0|t|cRXP_LOOT_[被亵渎堡垒的预言]|r
    .collect 205947,1 -- Prophecy of a Desecrated Citadel (1)
    .mob Defias Rogue Wizard
    .train 402852,1
step << Priest
    #season 2
    #optional
    #completewith BundleOT
    .train 402852 >>|cRXP_WARN_使用|r|T135975:0|t|cRXP_LOOT_[被亵渎城堡的预言]|r|cRXP_WARN_来学习|r|T237570:0|t[傀儡]
    >>|cRXP_WARN_你必须在神圣区域(例如北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区)输入 /kneel, 才能获得2|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_buffs|r
    .use 205947
    .itemcount 205947,1
step << Rogue
    #season 2
    #label GnollMapPiece
    .goto 1429,68.680,54.635,60,0
    .goto 1429,68.135,48.678,60,0
    .goto 1429,68.102,45.049,60,0
    .goto 1429,66.618,40.849
    >>|T133644:0|t[扒窃] |cRXP_ENEMY_河爪豺狼人前锋|r和 |cRXP_ENEMY_矮小的河爪豺狼人|r. 击败他们以获取 |T134327:0|t[|cRXP_LOOT_左下角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_ENEMY_注意:|r|cRXP_WARN_ 所有|r|T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_ 步骤均用于解锁|r|T134536:0|t[快速绘制]|cRXP_WARN_ 符文. |r|cRXP_WARN_ 它虽有用, 但非升级必需, 且在解锁毒药后约22级时将不再适用. 若您不急于获取该符文, 想节省短期时间, 可直接跳过全部步骤|r
    >>|cRXP_WARN_如果你决定跳过获取符文, 可以暂时不前往红ridge山脉, 直接使用炉石或死亡跳跃返回闪金镇|r
    .collect 203787,1 -- Bottom-Left Map Piece (1)
    .mob Riverpaw Outrunner
    .mob Riverpaw Runt
    .train 398196,1
step << Rogue
    #season 2
    #softcore
    #completewith AcceptBundle
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .train 398196,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #softcore
    #season 2
    #optional
    .goto Elwynn Forest,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉里克·费恩|r交谈
    .vendor >>出售垃圾并修理
    .target Rallic Finn
    .train 398196,1
    .isQuestAvailable 5545
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #season 2
    .goto Elwynn Forest,67.4,78.6,60,0
    .goto Elwynn Forest,70.8,79.8,60,0
    .goto Elwynn Forest,89.2,78.8
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias|r. 击杀后搜刮, 获取 |T134327:0|t[|cRXP_LOOT_左上角地图碎片]|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_注意:这也可能来自艾尔文森林中的任何其他|cRXP_ENEMY_Defias|r成员|r
    .collect 203785,1 -- Top-Left Map Piece (1)
    .mob Defias Bandit
    .train 398196,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #season 2
    .cast 401847 >>|cRXP_WARN_使用任意|r|T134327:0|t[|cRXP_LOOT_地图碎片]|r|cRXP_WARN_将其合成|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]
    .collect 203750,1
    .itemcount 203787,1
    .itemcount 203784,1
    .itemcount 203785,1
    .itemcount 203786,1
    .use 203787
    .use 203784
    .use 203785
    .use 203786
    .train 398196,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #season 2
    #completewith next
    .goto Elwynn Forest,80.365,79.134
    .cast 401617 >>|cRXP_WARN_使用|r|T134269:0|t[|cRXP_LOOT_艾尔文森林藏宝图|r]|cRXP_WARN_在箭头指示的位置. 这将触发一个 |cRXP_PICK_隐藏宝藏|r出现|r
    .use 203750
    .itemcount 203750,1
    .train 398196,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #season 2
    .goto Elwynn Forest,80.365,79.134
    >>打开|cRXP_PICK_Buried Treasure|r. 从中获取 |T134419:0|t[|cRXP_FRIENDLY_迅捷符文|r]
    .collect 203991,1 -- Rune of Quick Draw (1)
    .train 398196,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest
    #softcore
    #label EVDeathskip
    #completewith RedridgeS
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .zoneskip Redridge Mountains
--XX not worth deathskipping as a warlock due to having to resumm pet
step << Priest/Rogue
    #label RedridgeS
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest/Rogue
    #optional
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
    .xp <11,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest/Rogue
    #softcore
    #completewith RRFP
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest/Rogue
    #hardcore
    #optional
    #completewith RRFP
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.590,59.410,15 >>|cRXP_WARN_注意:沿主路前进, 途中避开所有近距怪物|r
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest/Rogue
    #optional
    .goto Redridge Mountains,30.73,59.99
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
    .isOnQuest 244
    .xp <11,1
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step << Priest/Rogue
    #label RRFP
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
    .subzoneskip 87 --Skip the Quick Draw steps if the user went back to goldshire instead
step
    #optional
    #completewith CollectKelp
    .hs >>炉石返回闪金镇
    .subzoneskip 87
step
    #label CollectKelp
    .goto Elwynn Forest,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
    .timer 9,接任务: |cRXP_LOOT_收集海藻|r RP
    .accept 114 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
    .target William Pestle
step << Warrior/Rogue
    #optional
    #completewith next << Warrior
    #completewith RogueOptTrain << Rogue
    .goto Elwynn Forest,43.877,66.546,9 >>前往旅店二楼
step << Warrior/Rogue
    .goto Elwynn Forest,43.392,65.550
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米歇尔·贝利|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Michelle Belle
step << Rogue
    #optional
    #label RogueOptTrain
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双持]|cRXP_WARN_和|r|T132307:0|t[冲刺]|cRXP_WARN_. 不要学习其他技能, 以节省金币留待日后使用|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Keryn Sylvius
    .xp <10,1
step
    .goto Elwynn Forest,42.105,65.927
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    .accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
    .target Marshal Dughan
step
    #sticky
    #label GoldshireVendor
    .goto Elwynn Forest,41.529,65.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞娜·斯蒂利|r交谈
    .vendor >>出售垃圾
    .target Corina Steele
    .money >0.75
step
    .goto Elwynn Forest,41.706,65.544
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .accept 1097 >>接任务: |cRXP_LOOT_艾尔默的任务|r
    .target Smith Argus
step << Warlock/Warrior
    #requires GoldshireVendor
    #optional
    .xp 10 >>升级至10级
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚·杜拉克|r交谈
    >>|cRXP_WARN_不要训练, 因为你要省下钱留着以后用|r
    .accept 1638 >>接任务: |cRXP_LOOT_战士的训练|r
    .target Lyria Du Lac
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
    .xp <10,1
    .xp >12,1
step << Paladin
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威尔海姆修士|r交谈
    .accept 2998 >>接任务: |cRXP_LOOT_圣洁之书|r
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
    .xp <12,1
step << Warlock
    #optional
    #completewith next
    .goto Elwynn Forest,44.1,66.0,10 >>前往旅店一楼
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克西米利安·克洛文|r和|cRXP_FRIENDLY_雷门·玛考特|r交谈
    .trainer >>训练你的职业法术
    .goto Elwynn Forest,44.392,66.240
    .target +Maximillian Crowe
    .accept 1685 >>接任务: |cRXP_LOOT_加科因的召唤|r
    .goto Elwynn Forest,44.485,66.268
    .target +Remen Marcot
step << Mage/Priest
    #optional
    #requires GoldshireVendor
    #completewith next
    .goto Elwynn Forest,43.7,66.4,10 >>上楼
    .xp <10,1
step << Priest
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.283,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .accept 5635 >>接任务: |cRXP_LOOT_绝望祷言|r
    .trainer >>训练你的职业法术
    .target Priestess Josetta
    .xp <10,1
step << Mage
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.25,66.19
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r交谈
    .trainer >>训练你的职业法术
    .target Zaldimar Wefhellt
    .xp <10,1
step << skip --Rogue
    #optional
    #requires GoldshireVendor
    .goto Elwynn Forest,43.872,65.937
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞恩·塞尔留斯|r交谈
    >>|cRXP_WARN_仅训练|r|T132147:0|t[双持]|cRXP_WARN_和|r|T132307:0|t[冲刺]|cRXP_WARN_. 不要学习其他技能, 以节省金币留待日后使用|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Keryn Sylvius
--XX skip quest, not worth going inside for
step
    #completewith PrincessFinish
    #optional
    .abandon 59 >>放弃布甲和皮甲
step << Warrior
    #season 2
    #sticky
    #completewith GoldtoothEnd
    >>奔跑时留意|cRXP_FRIENDLY_Wandering Swordsman|r. 如果你找到他, 可以向他发起决斗, 这将奖励你 |T132334:0|t[|cRXP_FRIENDLY_Blood Frenzy|r] 符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r  
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step
    #optional
    #requires GoldshireVendor
    #completewith next
    .goto Elwynn Forest,43.154,89.625,50 >>前往麦克卢尔酒庄
step
    #label Escape
    #requires GoldshireVendor
    .goto Elwynn Forest,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔·马科伦|r交谈
    .turnin 114 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .target Maybell Maclure
step
    #label GoldtoothEnd
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r交谈
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r << Rogue
    .target "Auntie" Bernice Stonefield
step
    #optional
    #completewith next
    .abandon 88 >>放弃“公主必须死！”任务, 因为你尚未完成该任务
step << Warrior
    #season 2
    .goto Elwynn Forest,30.0,73.4
    >>检查标记位置, 找到|r|cRXP_FRIENDLY_游荡剑客|r. 如果他在那里, 向他发起决斗, 即可获得|r|T132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r  
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step
    #optional
    #completewith Garrison
    .goto Elwynn Forest,24.82,76.25,80 >>前往西泉要塞


----Start of Paladin 1.5x Martyrdom Rune section----


step << Paladin
    #xprate >1.49
    #season 2
    #optional
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .target Deputy Rainer
step << Paladin
    #xprate >1.59
    #season 2
    #loop
    .goto Elwynn Forest,27.0,86.7,0
    .goto Elwynn Forest,26.1,89.9,0
    .goto Elwynn Forest,27.0,93.9,0
    .goto Elwynn Forest,27.0,86.7,70,0
    .goto Elwynn Forest,26.1,89.9,70,0
    .goto Elwynn Forest,25.2,92.7,70,0
    .goto Elwynn Forest,27.0,93.9,70,0
    >>击杀 |cRXP_ENEMY_矮小的河爪豺狼人|r和 |cRXP_ENEMY_河爪豺狼人前锋|r. 击败它们后搜刮出 |T132889:0|t[亚麻布], 你很快就需要 10 个来完成任务
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .isOnQuest 11
    .isQuestAvailable 1644

----Start of Warrior Gnoll Head section----


step << Warrior
    #xprate >1.49
    #season 2
    #label Garrison
    .goto Elwynn Forest,24.234,74.450
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .target Deputy Rainer
step << Warrior
    #season 2
    .goto Elwynn Forest,25.3,70.2
    >>检查标记位置, 找到|r|cRXP_FRIENDLY_游荡剑客|r. 如果他在那里, 向他发起决斗, 即可获得|r|T132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r  
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step << Warrior
    #season 2
    .goto Elwynn Forest,22.3,73.3
    >>检查标记位置, 找到|r|cRXP_FRIENDLY_游荡剑客|r. 如果他在那里, 向他发起决斗, 即可获得|r|T132334:0|t[|cRXP_FRIENDLY_鲜血狂怒|r]符文
    >>|cRXP_WARN_他有多个刷新点, 同一时间只能出现在其中一个. 如果他不在那里, 请跳过此步骤|r  
    .collect 204441,1 --Rune of Blood Frenzy (1)
    .unitscan Wandering Swordsman
    .train 412507,1
step << Warrior
    #xprate >1.49
    #season 2
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
    >>击杀|cRXP_ENEMY_矮小的河爪豺狼人|r 和|cRXP_ENEMY_河爪豺狼人前锋|r. 从它们身上搜刮出 |T134163:0|t[|cRXP_LOOT_severed gnoll head|r ]
    >>|cRXP_WARN_这是你需要的三件物品之一, 用于在等级达到10级前往暴风城时解锁|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|r
    .collect 204478,1 -- Severed Gnoll Head (1)
    .mob Riverpaw Runt
    .mob Riverpaw Outrunner
    .train 403475,1
step
    #label Garrison
    #season 0,1 << Warrior/Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 239 >>交任务: |cRXP_FRIENDLY_西泉要塞|r
    .goto Elwynn Forest,24.234,74.450
    .target +Deputy Rainer
    >>点击|cRXP_PICK_通缉告示|r << Warlock
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r << Warlock
    .goto Elwynn Forest,24.548,74.672 << Warlock
step << Warlock
    #completewith GnollEnd
    >>奔跑时击杀矮小的河爪豺狼人 和 河爪豺狼人前锋 , 击败后拾取他们, 以获得 |T134939:0|t[|cRXP_LOOT_采金日程表|r]
    .use 1307 >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 开始任务|r
    >>|cRXP_WARN_|r |T134939:0|t[|cRXP_LOOT_采金日程表|r] |cRXP_WARN_是一种非常罕见的掉落. 如果你没有获得它, 请忽略此步骤|r
    >>|cRXP_ENEMY_格拉夫·疾齿|r|cRXP_WARN_稀有刷新, 必定掉落|r
    .collect 1307,1,123 --Collect Gold Pickup Schedule (x1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .unitscan Gruff Swiftbite
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
    >>击杀|cRXP_ENEMY_霍格|r. 从他身上搜刮|cRXP_LOOT_爪子|r
    >>|cRXP_ENEMY_霍格|r|cRXP_WARN_可在多个位置出现|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_霍格|r, 并用常规的DOT技能击杀他|r
    >>|cRXP_WARN_使用|r|T136163:0|t[吸取灵魂]|cRXP_WARN_当霍格即将死亡时. 如果他在该效果下死亡, 你将获得|r|T134085:0|t[被污染的灵魂碎片]|cRXP_WARN_用于解锁|r|T136169:0|t[灵魂虹吸]符文
    >>|cRXP_WARN_如果未能获得灵魂碎片或霍格未出现, 请跳过此步骤. 该符文强度一般|r
    .complete 176,1 --Huge Gnoll Claw (1)
    .collect 205019,1 --Tainted Soul shard
    .disablecheckbox
    .unitscan Hogger
step << !Warlock
    #optional
    #completewith WestEntry
    .abandon 123 >>放弃任务：收货人
step
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    #xprate >1.49
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .goto Westfall,59.95,19.35
    .target +Farmer Furlbrow
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
    .isOnQuest 184
step << !Paladin !Warlock
#xprate >1.49
    #label WestEntry
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step << Paladin
    #xprate >1.49
    #season 2
    #optional
    #requires Charred
--XXREQ Placeholder invis step
step
step << !Paladin !Warlock
#xprate >1.49
    .goto Westfall,56.416,30.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    >>|cRXP_WARN_不要接受其他任务|r
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .target Salma Saldean
step << !Paladin !Warlock
    .goto Westfall,56.04,31.23
    .target Farmer Saldean
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
step
    #xprate >1.49 << !Paladin
    #xprate 1.49-1.59 << Paladin
    #optional
    #requires Fields
    .goto Westfall,56.327,47.520
    .xp 9+5410 >>升级至5410+/6500经验值
    .subzoneskip 108
step << Paladin
    #xprate >1.59
    #optional
    .goto 1436,48.249,46.729
    .xp 11+5360 >>升级至5360+/8800经验
--XX 625+210 + 85 + 800 = 1720 × 2 = 3440
step << Paladin/Warlock
    .goto Westfall,62.3,35.4
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    #softcore
    #completewith next
    .deathskip >>在灵魂医者处死亡并重生
    .target Spirit Healer
-- .subzoneskip 108
step
    #xprate >1.49
    .goto Westfall,56.327,47.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .target Gryan Stoutmantle
step
    .goto Westfall,57.002,47.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .accept 6181 >>接任务: |cRXP_LOOT_快递消息|r << Human
    .target Quartermaster Lewis
    .isQuestAvailable 6181 << Human
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_从她那里购买最多 20|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_. 它们是等级 5 的廉价食物|r
    .collect 4592,20,314,1 --Longjaw Mud Snapper (20)
	.target Innkeeper Heather
step
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target Scout Galiaan
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step << Human
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .turnin 6181 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 6281 >>接任务: |cRXP_LOOT_赶赴暴风城|r
    .target Thor
step << skip --Rogue
    #season 2
    #completewith FlySW
    #label RoSS
    .goto Westfall,51.540,55.361,30,0
    .goto Westfall,51.093,54.642,30,0
    .goto Westfall,50.81,47.15,50,0
    .goto Westfall,51.093,54.642
    >>|T133644:0|t[扒窃]|cRXP_ENEMY_Defias Scout|r获取 |T134419:0|t[|cRXP_FRIENDLY_碎裂之刃符文|r]
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|r|T133644:0|t[扒窃]|cRXP_WARN_很可能会失败, 因为你等级不足. 如果失败, 请跳过此步骤并飞往暴风城, 你将在不久后于洛克莫丹完成该任务|r
    >>|cRXP_WARN_切勿激怒|cRXP_ENEMY_Defias Scout|r, 否则它将|r|T132331:0|t[消失]|cRXP_WARN_并消失3-5分钟. 请务必提前进入|r|T132320:0|t[潜行]|cRXP_WARN_状态！|r
    >>|cRXP_WARN_|cRXP_ENEMY_Defias Scout|r可以在山丘上出现|r
    .collect 208772,1 -- Rune of Saber Slash (1)
    .unitscan Defias Scout
    .train 424785,1
--XX Moved/forced to Loch/Darkshore
step << skip --Rogue
    #season 2
    #completewith next
    #requires RoSS
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_剑刃斩符文|r]
    .use 208772 -- Rune of Saber Slash (1)
    .itemcount 208772,1
    .train 424785,1
step
    #label FlySW
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step << skip --Human Paladin
    #season 2
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Stephanie Turner
    .isQuestTurnedIn 1643
    .xp 12,1
step
    #xprate >1.49
    #season 2
    #optional
    .goto StormwindClassic,56.201,64.585
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根·匹斯特|r交谈
    .turnin 61,1 >>交任务: |cRXP_FRIENDLY_送往暴风城的货物|r
    >>|cRXP_WARN_我们选择|r|T132383:0|t[爆破火箭]|cRXP_WARN_作为奖励. 它造成可观的伤害, 可用于“分拉”战术, 非常实用|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处观看“分体拉怪”的视频参考. 这是一个简短的视频, 对学习非常有帮助|r
    .target Morgan Pestle
    .isQuestComplete 61
step << !Rogue
    #optional << Warlock/Warrior
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>训练1小时剑与法杖 << Warlock
    .trainer >>训练法杖 << Priest
    .trainer >>学习两小时剑术 << Warrior/Paladin
    .target Woo Ping
    .money <0.2 << Warlock
    .money <0.3 << Warrior/Paladin
step << Warlock
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .trainer >>训练法杖
    .target Woo Ping
step
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >>将你的[炉石]设置为暴风城
    .target Innkeeper Allison
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 2998 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
    .isOnQuest 2998
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6775
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19834 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <12,1
    .xp >14,1
step << Human Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 647 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <14,1
step << Human Paladin
    #xprate >1.59
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    --.accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Stephanie Turner
----XX if ever in the future, add Level 12 xp grind for 1.5x Tome of Divinity




----Warlock Elwynn Voidwalker Section Start----




step << Warlock
    #optional
    #completewith GakinStart
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .train 705 >>训练你的职业法术
    .target Ursula Deline
    .xp <12,1
    .xp >14,1
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .train 689 >>训练你的职业法术
    .target Ursula Deline
    .xp <14,1
step << Warlock
    #label GakinStart
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1685 >>交任务: |cRXP_FRIENDLY_加科因的召唤|r
    .accept 1688 >>接任务: |cRXP_LOOT_苏伦娜·凯尔东|r
    .target Gakin the Darkbinder
step << Warlock
    #softcore
    .deathskip >>死亡后, 使用 |T136126:0|t[生命分流] 并站在你旁边的篝火上, 于|cRXP_FRIENDLY_灵魂医者|r 处复活
    .target Spirit Healer
--  .subzoneskip 87
step << Warlock
    #hardcore
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << Warlock
    #completewith WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    .subzone 87 >>前往闪金镇
step << Warlock
    #optional
    #completewith LockGoldshireEnd
    >>寻找灵魂治疗师附近游荡的|cRXP_ENEMY_critter|r, 对其施放 |T136163:0|t[吸取灵魂], 以获得 |T134095:0|t[纯净灵魂碎片]
    .collect 205020,1 --Pure Soul Shard (1)
    .itemcount 205019,1 --Skip if no Hogger shard
    .train 403920,1
step << Warlock
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    >>|cRXP_WARN_选择|r|T135145:0|t[平衡长棍]
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .target Marshal Dughan
    .isOnQuest 123
step << Warlock
    #label WLHoggerEnd
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    >>|cRXP_WARN_选择|r|T135145:0|t[平衡长棍]
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .target Marshal Dughan
step << Warlock
    #label SoulSiphon
    .goto Elwynn Forest,44.0,66.2
    >>|cRXP_WARN_前往闪金镇旅店的地下室|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戴米恩·凯恩|r交谈, 完成对话后用灵魂碎片兑换|T134419:0|t[灵魂汲取符文]
    .collect 205022,1
    .train 403920,1
    .itemcount 205020,1 --Pure Soul Shard (1)
    .itemcount 205019,1 --Tainted Soul Shard (1)
step << Warlock
    #optional
    #requires SoulSiphon
    #completewith next
    .train 403920 >>使用 |T134419:0|t[灵魂虹吸符文] 来学习 |T136169:0|t[灵魂虹吸]
    .use 205022
    .train 403920,1
    .itemcount 205022,1
step << Warlock
    #optional
    #completewith WLBandanaEnd
    +|cRXP_WARN_装备|r|T135145:0|t[平衡长棍]
    .use 6215
    .itemcount 6215,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.9
step << Warlock
    #label LockGoldshireEnd
    --Invisible step
step << Warlock
    #optional
    >>|cRXP_WARN_途中磨练. 尝试提升你的|r|T135145:0|t[平衡长棍]|cRXP_WARN_skill|r
    .subzone 62 >>前往布拉克韦尔南瓜田
    .isOnQuest 1688
step << Warlock
    #xprate <1.5
    #optional
    #completewith SChoker
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r. 掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    .use 1972>>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开始任务|r
    >>|cRXP_WARN_|r|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]|cRXP_WARN_是一个非常稀有的掉落物品. 如果你没有获得它, 请跳过此步骤|r
    .collect 1972,1,184 --Collect Westfall Deed (x1)
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step << Warlock
    #label SChoker
    .goto Elwynn Forest,71.10,80.66
    >>击杀|cRXP_ENEMY_苏伦娜·凯尔东|r. 搜刮她的|cRXP_LOOT_项圈|r
    >>|cRXP_WARN_集中精力快速击杀|r苏伦娜·凯尔东|r
    >>|cRXP_WARN_持续施放|r|T136183:0|t[恐惧], |cRXP_WARN_目标: |r|cRXP_ENEMY_收货人莫根|r|r
    .complete 1688,1 --Surena's Choker (1)
    .mob Surena Caledon
step << Warlock
    #optional
    #label WlockRedridge
    #completewith next
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    >>|cRXP_WARN_途中刷怪. 请确保至少拥有2|r|T134075:0|t[灵魂碎片]|cRXP_WARN_通过使用|r|T136163:0|t[吸取灵魂]
    .collect 6265,2 --Soul Shard (2)
step << Warlock
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step << Warlock
    #softcore
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    >>|cRXP_WARN_注意途中刷新的怪物|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step << Warlock
    #hardcore
    .goto Redridge Mountains,18.581,69.208,15,0
    .goto Redridge Mountains,23.325,71.373,25,0
    .goto Redridge Mountains,29.565,67.930,25,0
    .goto Redridge Mountains,30.733,59.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    >>|cRXP_WARN_沿着主路前进, 沿途避开靠近的敌人|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step << Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点
    .target Ariena Stormfeather
step << Warlock
    .hs >>炉石前往暴风城, 如果飞行路径处于冷却状态, 请跳过此步骤并直接使用飞行路径
step << Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
    .zoneskip Stormwind City
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gakin the Darkbinder
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊底部|r
    .cast 7728 >>|cRXP_WARN_使用|r|T133292:0|t[血石颈环]|cRXP_WARN_召唤|r|cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >>击杀召唤的虚空行者
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob Summoned Voidwalker
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r


----Warlock Elwynn Voidwalker Section End----


step << Warrior
    #season 2
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109028 >>与|cRXP_FRIENDLY_|Viktoria Woods|r交谈, 提交你的|T134168:0|t[|cRXP_LOOT_|被斩断的地精头颅|r], 以获得|T134455:0|t[猎魔者初阶符文碎片]
    .collect 204688,1 -- Monster Hunter's First Rune Fragment (1)
    .itemcount 204476,1 -- Severed Kobold Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109027 >>与|cRXP_FRIENDLY_维克托莉亚·伍兹|r交谈, 提交你的|T134169:0|t[|cRXP_LOOT_鱼人的头颅|r], 以获得|T134455:0|t[猎魔者第二符文碎片]
    .collect 204689,1 -- Monster Hunter's Second Rune Fragment (1)
    .itemcount 204477,1 -- Severed Murloc Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #label GnollHead
    #completewith RoDSW
    .goto Stormwind City,69.690,51.023
    .gossipoption 109026 >>与|cRXP_FRIENDLY_维多利亚·伍兹|r交谈, 提交你的|T134163:0|t[断头豺狼头|r], 以获得|T134455:0|t[猎魔者第三符文碎片]
    .collect 204690,1 -- Monster Hunter's Third Rune Fragment (1)
    .itemcount 204478,1 -- Severed Gnoll Head (1)
    .target Viktoria Woods
    .train 403475,1
step << Warrior
    #season 2
    #label RoDSW
    #requires GnollHead
    .cast 406651 >>|cRXP_WARN_使用任意|r|T134455:0|t[猎魔人符文碎片]|cRXP_WARN_来制作|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 -- Rune of Devastate (1)
    .use 204690
    .use 204689
    .use 204688
    .itemcount 204688,1
    .itemcount 204689,1
    .itemcount 204690,1
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]|cRXP_WARN_来训练|r|T135291:0|t[毁灭]
    .use 204703
    .itemcount 204703,1
step << Human
    #xprate >1.49
    #label Continue
    .goto StormwindClassic,74.312,47.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯瑞克·斯图恩|r交谈
    .turnin 6281 >>交任务: |cRXP_FRIENDLY_赶赴暴风城|r
    .accept 6261 >>接任务: |cRXP_LOOT_杜加尔·朗德瑞克|r
    .target Osric Strang
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_请确保训练结束后至少剩下24银. 你需要这笔钱在铁炉堡购买一把枪, 才能使用你的符文|r
    .train 674 >>训练 |T132147:0|t[双武器战斗]
    .train 2983 >>训练 |T132307:0|t[冲刺]
    .target Osborne the Night Man
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate >1.59
    .goto 1453,74.645,52.818
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_请确保训练结束后至少剩下24银. 你需要这笔钱在铁炉堡购买一把枪, 才能使用你的符文|r
    .train 1766 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <12,1
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1638 >>交任务: |cRXP_FRIENDLY_战士的训练|r
    .accept 1639 >>接任务: |cRXP_LOOT_醉鬼巴特莱比|r
    .target Harry Burlguard
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .turnin 1639 >>交任务: |cRXP_FRIENDLY_醉鬼巴特莱比|r
    .accept 1640 >>接任务: |cRXP_LOOT_击败巴特莱比|r
    .target Bartleby
step << Warrior
    .goto StormwindClassic,73.787,36.323
    >>攻击|cRXP_ENEMY_巴特莱比|r. 他将在1%血量时投降
    .complete 1640,1 --Beat Bartleby
    .mob Bartleby
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴特莱比|r交谈
    .target Bartleby
    .goto StormwindClassic,73.787,36.323
    .turnin 1640 >>交任务: |cRXP_FRIENDLY_击败巴特莱比|r
    .accept 1665 >>接任务: |cRXP_LOOT_巴特莱比的酒杯|r
step << Warrior
    .goto StormwindClassic,74.249,37.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里·伯加德|r交谈
    .turnin 1665 >>交任务: |cRXP_FRIENDLY_巴特莱比的酒杯|r
    .target Harry Burlguard
step << Priest
    #optional
    #completewith Prayer
    .goto StormwindClassic,42.51,33.51,20 >>进入暴风城大教堂
step << Priest
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 5635 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
    .train 8092 >>训练你的职业法术
    .target High Priestess Laurena
    .isOnQuest 5635
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .turnin 5634 >>交任务: |cRXP_FRIENDLY_绝望祷言|r
    .train 8092 >>训练你的职业法术
    .target High Priestess Laurena
    .train 13908,1
step << Priest
    #optional
    #label Prayer
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .trainer >>训练你的职业法术
    .target High Priestess Laurena
    .train 13908,3
step << Rogue
    #season 2
    #optional
    #completewith next
    .goto Stormwind City,56.93,29.54,8,0
    .goto Stormwind City,58.65,27.56,10 >>进入暴风城矮人区的割喉小巷
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .goto Stormwind City,63.201,29.491,5,0
    .goto Stormwind City,61.728,29.190
    >>|cRXP_WARN_上楼进入房屋|r
    >>打开|cRXP_PICK_Dusty Chest|r. 将其打开后获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_这样做会刷新两个等级为10的|cRXP_ENEMY_刀疤劫匪|r, 他们会攻击你|r
    .collect 204174,1 -- Rune of Precision (1)
    .mob Cut-throat Mugger
    .train 400081,1
step << Rogue
    #season 2
    #optional
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
step << Paladin
    .goto Stormwind City,74.182,7.465 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈 << Alliance
    >>从他那里购买 |T133745:0|t|cRXP_LOOT_[殉道遗嘱]|r, 用它来训练 |T135961:0|t[殉道印记] << Paladin
    .collect 226398,1 << Paladin
step << Paladin
    .goto Stormwind City,74.182,7.465 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈 << Alliance
    >>如果你有很多闲钱, 可以向米尔顿购买另外两本《圣经》, 以备日后使用 << Paladin
    .collect 216768,1 << Paladin -- Testament of Enhanced Blessings
    .collect 226400,1 << Paladin -- Testament of the Exorcist
    .money <5
step
    .goto StormwindClassic,51.757,12.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞曼德·艾尔默|r交谈
    .turnin 1097 >>交任务: |cRXP_FRIENDLY_艾尔默的任务|r
    .accept 353 >>接任务: |cRXP_LOOT_雷矛的包裹|r
    .target Grimand Elmore
step << Warrior/Paladin/Rogue
    #optional
    .goto StormwindClassic,56.3,17.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯塔·深炉|r交谈
    .collect 2901,1,432,1 >>|cRXP_BUY_从她那里购买 a|r|T134708:0|t[矿工锄]|r
    >>|cRXP_WARN_你将学习|r|T134708:0|t[采矿]|cRXP_WARN_later|r
    .target Kaita Deepforge
    .train 2018,3 --Blacksmithing
--XX 81c, 1s 75c from 6281
step
    #label DeeprunEnter
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
step
    #xprate <1.59
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|cRXP_WARN_如果需要, 可在等待前往铁炉堡的电车时升级你的|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r|T136221:0|t[召唤虚空行者]|cRXP_WARN_和|r|T135230:0|t[制作治疗石]|cRXP_WARN_(如需等待前往铁炉堡的电车时)|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡方向矿道地铁中段站台上的|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
step
    #xprate <1.59
    >>|cRXP_WARN_在矿道地铁内使用|r|T133942:0|t[捕鼠者长笛], |cRXP_WARN_目标: |r |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob Deeprun Rat
step
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的|cRXP_FRIENDLY_蒙提|r交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .target Monty
step
    #xprate >1.59
    #optional
    #label TramEnd
    >>|cRXP_WARN_乘坐矿道地铁前往铁炉堡一侧|r
    >>|cRXP_WARN_如果需要, 可在等待前往铁炉堡的电车时升级你的|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务|r << Rogue !Dwarf
    >>|cRXP_WARN_施放|r|T136221:0|t[召唤虚空行者]|cRXP_WARN_和|r|T135230:0|t[制作治疗石]|cRXP_WARN_(如需等待前往铁炉堡的电车时)|r << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡方向矿道地铁中段站台上的|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >>接任务: |cRXP_LOOT_捕捉矿道老鼠|r
    .target Monty
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|cRXP_WARN_在矿道地铁内使用|r|T133942:0|t[捕鼠者长笛], |cRXP_WARN_目标: |r |cRXP_ENEMY_矿道老鼠|r|r
    .complete 6661,1 --Rats Captured (x5)
    .use 17117
    .mob Deeprun Rat
    .zoneskip Ironforge
step
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与矿道地铁内的|cRXP_FRIENDLY_蒙提|r交谈
    .turnin 6661 >>交任务: |cRXP_FRIENDLY_捕捉矿道老鼠|r
    .target Monty
    .zoneskip Ironforge
step
    #completewith next
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    >>|cRXP_WARN_等待电车时, 如需治疗, 请使用|r|T135966:0|t[急救]|r << Rogue/Warrior/Paladin
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .isQuestAvailable 314
step << Warrior
    #optional
    #completewith WarriorTrain
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >>前往|cRXP_FRIENDLY_比尔班·飞钳|r
step << Warrior
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    >>|cRXP_WARN_确保你为以后存下20先令70铜币|r
    .train 2687 >>训练你的职业法术
    .target Bilban Tosslespanner
    .xp <10,1
    .xp >12,1
step << Warrior
    #xprate >1.59
    #optional
    #label WarriorTrain
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    >>|cRXP_WARN_确保你为以后存下20先令70铜币|r
    .train 5242 >>训练你的职业法术
    .target Bilban Tosslespanner
    .xp <12,1
step << Warrior/Rogue
    #optional
    #completewith next
    .goto 1455,61.552,85.636,10,0
    .goto 1455,61.356,88.398,6 >>进入密林武器店大楼
step << Warrior/Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r和|cRXP_FRIENDLY_布里维夫·石拳|r交谈
    .train 2567 >>投掷训练 << Warrior
    .goto Ironforge,62.237,89.628
    .target +Bixi Wobblebonk
    .train 199 >>学习2小时锤类武器技能 << Warrior
    .train 266 >>训练枪械 << Rogue
    .goto Ironforge,61.177,89.508
    .target +Buliwyf Stonehand
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,200 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
    .xp <10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_萨古斯·雷拳|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135613:0|t[猎人的爆裂枪] 和 |T132384:0|t[重弹丸]|r
    .collect 2511,1 --Collect Hunter's Boomstick (1)
    .collect 2519,200 --Heavy Shot (200)
    .money <0.14
    .target Thalgus Thunderfist
step << Rogue
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_萨古斯·雷拳|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135611:0|t[精制短枪] 和 |T132384:0|t[重弹丸]|r
    .collect 2509,1 --Collect Hunter's Boomstick (1)
    .collect 2519,200 --Heavy Shot (200)
    .money >0.14
    .target Thalgus Thunderfist
    .itemcount 2511,<1
step << Warrior
    #xprate >1.49
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135641:0|t[破损的平衡飞刀]|r
    .collect 2946,200 --Collect Balanced Throwing Dagger (200)
    .target Brenwyn Wintersteel
    .xp >10+7310,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Warrior
    #optional
    #completewith Rudra
    +|cRXP_WARN_装备|r|T135641:0|t[破损的平衡飞刀]
    .use 2946
    .itemcount 2946,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Warrior
    #optional
    #completewith next
    .goto 1455,61.356,88.398,6 >>离开密林武器店大楼
step << Paladin/Warrior
    #season 2
    #optional
    #completewith next
    .goto Ironforge,71.54,73.46,10,0
    .goto Ironforge,72.53,76.94,10 >>前往旅店内部, 找到|cRXP_FRIENDLY_布鲁克·麦须|r
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.53,76.94
    .gossipoption 110791 >>与|cRXP_FRIENDLY_布鲁克·麦须|r对话, 他在里面
    .target Bruuk Barleybeard
    .skipgossip 5570,1,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 110793 "How's business?"
--XX 110791 "Sounds like you need someone to bounce him for you."
step << Paladin/Warrior
    #season 2
    .goto Ironforge,72.40,73.63
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Bruart|r谈话以开启战斗
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r << Paladin
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r << Paladin
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外并视情况施放|r|T135920:0|t[圣光]|cRXP_WARN_如果需要|r << Paladin
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r << Warrior
    >>|cRXP_WARN_ 尝试使用|r|T132316:0|t[|cRXP_FRIENDLY_断筋|r]|cRXP_WARN_ 和|r|T132324:0|t[|cRXP_FRIENDLY_投掷|r] 来风筝他 << Warrior
    .mob Bruart
    .skipgossip 209004,1
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 109084 "Seems you've had a few too many"
--XX Check if another player can skip the "how's business" dialogue for you (paladin, warrior)
step << Paladin/Warrior
    #season 2
    #optional
    .goto Ironforge,72.40,73.63,-1
    .goto Ironforge,72.53,76.94,-1
    >>击败|cRXP_ENEMY_Bruart|r
    >>|cRXP_WARN_小心, 他正在施放|r|T132939:0|t[反手击]|cRXP_WARN_(使你眩晕2秒)|r
    >>|cRXP_WARN_记得预先施放|r|T135924:0|t[十字军印记]|cRXP_WARN_给他|r << Paladin
    >>|cRXP_WARN_切勿意外对他施放|r|T135906:0|t[力量祝福]|r << Paladin
    >>|cRXP_WARN_风筝他到楼上的阳台, 然后跳到旅店外并视情况施放|r|T135920:0|t[圣光]|cRXP_WARN_如果需要|r << Paladin
    >>|cRXP_WARN_把他风筝到楼上的阳台上, 然后跳到旅店外并使用|r|T133688:0|t[绷带]|cRXP_WARN_(如果你有且需要的话)|r << Warrior
    >>|cRXP_WARN_击败布鲁亚特后:|r
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[斥责符文] << Paladin
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[斥责符文]|cRXP_WARN_, 你可能需要再次击败|cRXP_ENEMY_Bruart|r|r << Paladin
    >>与|cRXP_FRIENDLY_布鲁克·麦须|r再次对话, 以获得|T134419:0|t[狂怒冲锋符文] << Warrior
    >>|cRXP_WARN_如果他不给你|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_, 你可能需要再次与|cRXP_ENEMY_Bruart|r战斗|r << Warrior
    >>|cRXP_WARN_注意:此任务单独完成可能较困难, 请寻求帮助, 否则在指南后续内容中将被提示重新完成|r << Warrior
    .collect 205683,1 << Paladin --Rune of Rebuke (1)
    .collect 204716,1 << Warrior --Rune of Frenzied Assault (1)
    .target Bruuk Barleybeard
    .train 425621,1 << Paladin
    .train 425447,1 << Warrior
--XX 109539 "I've taken care of Stuart. He shouldn't be a problem anymore."
step << Paladin
    #season 2
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t[斥责符文]|cRXP_WARN_来学习|r|T134596:0|t[刻印长裤 - 斥责]
    .use 205683
    .itemcount 205683,1 --Rune of Rebuke (1)
    .train 425621,1
step << Paladin
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_雕刻你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[雕刻裤子 - 斥责]
    >>|cRXP_WARN_记得将|r|T134919:0|t[斥责]|cRXP_WARN_放到你的快捷栏上|r
    .train 425621,3
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[狂暴突袭符文]|cRXP_WARN_来学习|r|T134596:0|t[雕刻裤 - 狂暴突袭]
    .use 204716
    .itemcount 204716,1 --Rune of Frenzied Assault (1)
step << Warrior
    #season 2
    #completewith Dirt
    .engrave 7 >>|cRXP_WARN_刻印你的|r|T134596:0|t|cRXP_LOOT_[裤子]|r|cRXP_WARN_带有|r|T134596:0|t[刻印裤子 - 狂暴突击]
    .train 425447,3
step
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
step << Mage/Paladin
    #xprate >1.49
    #optional
    #completewith MageIFTrain << Mage
    #completewith PaladinIFTrain << Paladin
    .goto Ironforge,49.11,56.02,30,0
    .goto Ironforge,44.08,46.60,20,0
    .goto Ironforge,40.84,44.59,20,0
    .goto Ironforge,35.30,32.76,20,0
    .goto Ironforge,27.17,12.58,20,0 << Paladin
    .goto Ironforge,27.60,11.06,20,0 << Mage
    .goto Ironforge,26.8,8.6,12 >>前往|cRXP_FRIENDLY_丁克|r << Mage
    .goto Ironforge,23.131,6.143,12 >>前往|cRXP_FRIENDLY_布兰度尔·铁锤|r << Paladin
step << Mage
    #xprate >1.49
    .goto Ironforge,26.8,8.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 122 >>训练你的职业法术
    .target Dink
    .xp <10,1
    .xp >12,1
step << Mage
    #xprate >1.49
    .goto Ironforge,26.8,8.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 145 >>训练你的职业法术
    .target Dink
    .xp <12,1
    .xp >14,1
step << Mage
    #xprate >1.49
    #label MageIFTrain
    .goto Ironforge,26.8,8.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈, 他在里面
    .train 1460 >>训练你的职业法术
    .target Dink
    .xp <14,1
step << Paladin
    #xprate >1.49
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .train 633 >>训练你的职业法术
    .target Brandur Ironhammer
    .xp <10,1
    .xp >12,1
step << Paladin
    #xprate >1.49
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19834 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <12,1
    .xp >14,1
step << Paladin
    #xprate >1.49
    #optional
    #label PaladinIFTrain
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 647 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <14,1
--XX Alternative paladin train if they didn't get 10 in Goldshire
step
    #ssf
    .goto Ironforge,19.11,52.80
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r|r
step
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
step << skip --logout skip
    #ah
    #optional
    .goto 1455,33.220,64.649
    .zone Dun Morogh >>|cRXP_WARN_前往: |cRXP_PICK_丹莫罗|r, 跳到 |cRXP_PICK_邮箱|r 的顶部，然后通过注销并重新登录执行注销跳过|r
    .isQuestAvailable 314
    ]])