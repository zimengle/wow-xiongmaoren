local _,addon = ...
if addon.GetSeason() ~= 2 then return end
RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs << Warrior
#subgroup Chest << Hunter
#name 卡罗丁符文
#displayname Consumed by Rage - 25 (Wetlands) << Warrior
#displayname Cobra Slayer - 25 (Wetlands) << Hunter
#title Consumed by Rage << Warrior
#title Cobra Slayer << Hunter

step
    #season 2
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    #season 2
    #completewith next
    .goto Wetlands,51.914,62.692,30 >>进入 Thelgen Rock 洞穴
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
step
    #season 2
    .goto Wetlands,47.24,65.34
    >>击杀 |cRXP_ENEMY_Carrodin|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Consuming Rage|r] << Warrior
    >>击杀 |cRXP_ENEMY_Carrodin|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_眼镜蛇杀手符文|r] << Hunter
    .collect 210573,1 << Warrior --Rune of Consuming Rage (1)
    .collect 211205,1 << Hunter --Rune of Aspect of Cobra Slayer (1)
    .mob Carrodin
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
step << Warrior
    #season 2
    .train 425446 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_消耗怒气符文|r] |cRXP_WARN_进行训练|r |T136088:0|t[被怒气吞噬]
    .use 210573
    .itemcount 210573,1
step << Hunter
    #season 2
    .train 410115 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_眼镜蛇杀手符文|r] |cRXP_WARN_进行训练|r |T136040:0|t[眼镜蛇杀手]
    .use 211205
    .itemcount 211205,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 毒化——25（希尔斯布莱德）
#title Envenom


    --Rune of Envenom

step
    #season 2
    #completewith next
	.goto Hillsbrad Foothills,76.72,46.22,60 >>前往敦霍尔德堡
step
    #season 2
    .goto Hillsbrad Foothills,80.2,39.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克瑞斯·李盖斯|r
    >>|cRXP_BUY_购买|r |T133469:0|t[热门提示] |cRXP_BUY_来自她|r
    .collect 210330,1 --Hot Tip (1)
    .target Kris Legace
    .train 400102,1
step
    #season 2
    .use 210330 >>打开|T133469:0|t[热门提示]
    .collect 210323,1 --Safe Combination (1)
    .collect 210329,1 --Hillsbrad Treasure Map (1)
    .train 400102,1
step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    #season 2
    .goto Western Plaguelands,59.4,84.5
    >>打开水中的 |cRXP_PICK_Rusty Safe|r 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Venom|r]
    .collect 210322,1 --Rune of Venom (1)
    .train 400102,1
step
    #season 2
    .train 400102 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Venom|r]
    .use 210322
    .itemcount 210322,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 割喉者 - 25（暮色森林）
#title Cutthroat

step
    #season 2
    .goto Duskwood,81.24,71.86
    >>打开宁静花园公墓的 |cRXP_PICK_Offering Box|r 获得 |T133343:0|t[|cRXP_LOOT_Engraved Silver 戒指|r]
    .collect 210251,1 --Engraved Silver 戒指 (1)
    .train 424988,1
step
    #season 2
    .goto Duskwood,48.5,79.9
    >>使用 |T133644:0|t[扒窃] 对 |cRXP_ENEMY_Defias Night Runners|r 获得 |T133345:0|t[|cRXP_LOOT_雕刻金戒指|r]
    .collect 210250,1 --Engraved Gold 戒指 (1)
    .mob Defias Night Runner
    .train 424988,1
step
    #season 2
    #completewith next
    .goto Duskwood,19.9,44.6,60,0 >>前往乌鸦岭雕像
step
    #season 2
    .goto Duskwood,19.9,44.6
    .use 210250 >>戴上两个戒指并输入/跪在雕像前接收|T134419:0|t[|cRXP_FRIENDLY_Rune of Shiving|r]
    .use 210251
    .collect 210252,1 --Rune of Shiving (1)
    .train 424988,1
step
    #season 2
    .train 424988 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shiving|r] 来训练 |T236280:0|t[Cutthroat]
    .use 210252
    .itemcount 210252,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 狂野打击 - 14（石爪山脉）
#title Wild Strikes

step << Druid
    .goto Stonetalon Mountains,80.2,90.6,60,0
    .goto Stonetalon Mountains,83.2,87.0,60,0
    .goto Stonetalon Mountains,71.6,86.6,60,0
    .goto Stonetalon Mountains,76.6,91.0,60,0
    .goto Stonetalon Mountains,80.2,90.6
    >>击杀 |cRXP_ENEMY_Grimtotems|r。拾取它们以获得 |T134233:0|t[|cRXP_FRIENDLY_Idol of the Wild|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob Grimtotem Mercenary
    .mob Grimtotem Brute
    .mob Grimtotem Sorcerer
    .mob Grimtotem Ruffian
    .train 410021,1
step << Druid
    .equip 18,210534 >>|cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_野性偶像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1
step << Druid
    >>|cRXP_WARN_对 10 种不同的友方野兽施放|r |T136085:0|t[再生] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_on 包括猎人宠物/熊形态的德鲁伊/幽灵狼形态的萨满|r << Horde
    >>|cRXP_WARN_对 10 种不同的友方野兽施放|r |T136085:0|t[再生] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_on ，例如猎人宠物或熊形态的德鲁伊|r << Alliance
    .train 410021 >>|cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_野性偶像|r] |cRXP_WARN_训练|r |T132143:0|t[狂野打击]
    .itemcount 210534,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 星涌-25（湿地）
#title Starsurge

step << Druid
    #completewith next
    +|cRXP_WARN_在 1 级时可以做到这一点，但是你必须为此死很多次|r
    .train 424718,1
step << Druid
    .goto Wetlands,36.941,15.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grugimdern|r
    >>|cRXP_WARN_他会给你一个|r |T134052:0|t[|cRXP_LOOT_Marshroom|r]
    .collect 210499,1 -- Marshroom (1)
    .skipgossip
    .target Grugimdern
    .train 424718,1
step << Druid
    #completewith next
    .goto Wetlands,31.187,18.328
    .cast 426019 >>|cRXP_WARN_使用|r |T134052:0|t[|cRXP_LOOT_Marshroom|r] |cRXP_WARN_吃掉它|r
    .use 210499
    .train 424718,1
step << Druid
    .goto Wetlands,31.187,18.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vodyanoi|r
    .collect 210500,1 -- Rune of the Stars (1)
    .skipgossip
    .target Vodyanoi
    .train 424718,1
step << Druid
    .train 424718 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_星之符文|r] |cRXP_WARN_进行训练|r |T135730:0|t[星涌]
    .use 210500
    .itemcount 210500,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest << Priest/Hunter/Druid/Warrior/Shaman
#subgroup Legs << Warlock/Paladin
#subgroup Gloves << Rogue
#subgroup Bracers << Mage
#name Grizzby Runes
#displayname Serendipity - 25 (The Barrens) << Priest
#displayname Lone Wolf - 25 (The Barrens) << Hunter
#displayname Survival of the Fittest - 25 (The Barrens) << Druid
#displayname Warbringer - 25 (The Barrens) << Warrior
#displayname Dual Wield Specialization - 25 (The Barrens) << Shaman
#displayname Demonic Pact - 25 (The Barrens) << Warlock
#displayname Divine Sacrifice - 25 (The Barrens) << Paladin
#displayname Rewind Time - 25 (The Barrens) << Mage
#displayname Main Gauche - 25 (The Barrens) << Rogue
#next 十字军打击 - 4（艾尔文森林） << Human Paladin
#next 十字军打击 - 4（丹莫罗） << Dwarf Paladin
#next 熔岩爆裂 - 25（希尔斯布莱德丘陵） << Shaman
#title Serendipity << Priest
#title Lone Wolf << Hunter
#title Survival of the Fittest << Druid
#title Warbringer << Warrior
#title Dual Wield Specialization << Shaman
#title Demonic Pact << Warlock
#title Divine Sacrifice << Paladin
#title Rewind Time << Mage
#title Main Gauche << Rogue

<< SoD

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地的棘齿城|r, |cRXP_WARN_你需要 3 金币来购买符文|r
step
    .goto The Barrens,61.8,39.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Grizzby|r in the inn
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_Harmonious Epiphany|r] |cRXP_WARN_训练|r |T237549:0|t[Serendipity] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r] |cRXP_WARN_训练|r |T134596:0|t[雕刻裤子 - 神圣牺牲] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_拼写注释：倒带时间|r] |cRXP_WARN_训练|r |T237538:0|t[倒带时间] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_孤狼符文|r] |cRXP_WARN_训练|r |T132266:0|t[孤狼] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_生存符文|r] |cRXP_WARN_训练|r |T132126:0|t[适者生存] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_战争使者符文|r] |cRXP_WARN_训练|r |T236319:0|t[战争使者] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] |cRXP_WARN_训练|r |T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_Main Gauche 符文|r] |cRXP_WARN_训练|r |T237531:0|t[Main Gauche] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_双持专长符文|r] |cRXP_WARN_训练|r |T132686:0|t[雕刻胸甲 - 双持专长] << Shaman
    .target Grizzby
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
#subgroup Chest << Shaman/Rogue
#subgroup Legs << Mage/Warlock/Hunter
#subgroup Gloves << Paladin/Warrior/Priest/Druid
#name 拦截符文
#displayname Mind Sear - 25 (Reputation) << Priest
#displayname Serpent Spread - 25 (Reputation) << Hunter
#displayname Skull Bash - 25 (Reputation) << Druid
#displayname Single-Minded Fury - 25 (Reputation) << Warrior
#displayname Healing Rain - 25 (Reputation) << Shaman
#displayname Everlasting Affliction - 25 (Reputation) << Warlock
#displayname 光明灯塔 - 25（声望） << Paladin
#displayname Arcane Surge - 25 (Reputation) << Mage
#displayname Just a Flesh Wound - 25 (Reputation) << Rogue
#next 神圣牺牲 - 25（艾泽拉斯） << Paladin
#title Mind Sear << Priest
#title Serpent Spread << Hunter
#title Skull Bash << Druid
#title Single-Minded Fury << Warrior
#title Healing Rain << Shaman
#title Everlasting Affliction << Warlock
#title Beacon of Light << Paladin
#title Arcane Surge << Mage
#title Just a Flesh Wound << Rogue

<< SoD

--VV if (Reputation) name formatting removed, change in Paladin guide too

step
    >>出去寻找 |T132765:0|t[Wallaied Supplies]。然后返回主城并交付它们。如果您想更快地获得声誉，请在 AH 购买所需的物品来升级它们。
    *|cRXP_WARN_You can farm lower level mobs until you hit Friendly. Afterwards you have to farm high level mobs (>=17).|r Chests in the open world have a 90%+ 有机会掉落其中一件物品。
    .reputation 2587,friendly << Horde
    .reputation 2586,friendly << Alliance
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Supply Officer|r in the nearest city
    .goto Orgrimmar,51.6,64.6,-1 << Horde
    .goto Thunder Bluff,39.8,53.4,-1 << Horde
    .goto Undercity,64.6,38.2,-1 << Horde
    .goto Stormwind City,55.0,61.6,-1 << Alliance
    .goto Ironforge,24.6,67.2,-1 << Alliance
    .goto Darnassus,60.0,56.4,-1 << Alliance
    .use 211386 << Mage
    .use 211387 << Paladin
    .use 211392 << Warlock
    .use 211391 << Shaman
    .use 211385 << Hunter
    .use 211393 << Warrior
    .use 206002 << Druid
    .use 211390 << Rogue
    .use 205950 << Priest
    .train 415996 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_Tenebrous Epiphany|r] |cRXP_WARN_训练|r |T237565:0|t[Mind Sear] << Priest
    .train 409999 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_召唤之光符文|r] |cRXP_WARN_训练|r |T236247:0|t[光之信标] << Paladin
    .train 425171 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：奥术涌动|r] |cRXP_WARN_训练|r |T135734:0|t[奥术涌动] << Mage
    .train 425760 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_蛇纹符文|r] |cRXP_WARN_训练|r |T132209:0|t[蛇纹符文] << Hunter
    .train 416046 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_骷髅猛击符文|r] |cRXP_WARN_训练|r |T133732:0|t[骷髅猛击] << Druid
    .train 416003 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_专注之怒符文|r] |cRXP_WARN_训练|r |T134919:0|t[专注之怒] << Warrior
    .train 416008 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_永恒痛苦符文|r] |cRXP_WARN_训练|r |T236296:0|t[永恒痛苦] << Warlock
    .train 400082 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_戏弄符文|r] |cRXP_WARN_训练|r |T132284:0|t[只是一点皮肉伤] << Rogue
    .train 416057 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_治疗之雨符文|r] |cRXP_WARN_训练|r |T136107:0|t[治疗之雨] << Shaman
    .target Elaine Compton << Alliance
    .target Tamelyn Aldridge << Alliance
    .target Macry Baker << Alliance
    .target Jornah << Horde
    .target Dokimi << Horde
    .target Gishah << Horde
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 野性成长 - 25（多个区域）
#title Wild Growth

step << Druid
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step << Druid
    .goto Ashenvale,86.963,43.159
    >>点击 |cRXP_PICK_猫头鹰 Statue|r 开始活动
    >>|cRXP_WARN_你需要同时击败 3 波 2 个怪物，等级从 23 到 25 级|r
    >>|cRXP_WARN_确保 |cRXP_FRIENDLY_Summoned Wisp|r 不会死亡。无法治愈它，但它会在波次之间完全恢复|r
    >>击败所有波次后，拾取地面上的 |cRXP_PICK_Gift of the Wisp|r
    .collect 210044,1 -- Symbol of the First 猫头鹰 (1)
    .train 410028,1
step << Druid
    #completewith next
    .goto Duskwood,46.91,58.76,50,0
    .goto Duskwood,45.13,58.26,25,0
    .goto Duskwood,49.520,33.851
    .subzone 856 >>前往暮色森林的暮光林地
    .train 410028,1
step << Druid
    .goto Duskwood,49.520,33.851
    .aura 424310 >>点击 |cRXP_PICK_猫头鹰雕像|r 获得 |T132150:0|t[猫头鹰之眼] 增益
    .train 410028,1
step << Druid
    .goto Duskwood,45.13,58.26
    #completewith next
    +退出暮光林地
    .subzoneskip 856,1
    .train 410028,1
step << Druid
    .goto Duskwood,65.2,34.8,65,0
    .goto Duskwood,60.6,25.8,65,0
    .goto Duskwood,66.0,23.6,65,0
    .goto Duskwood,68.0,31.6,65,0
    .goto Duskwood,65.2,34.8
    >>杀死 |cRXP_ENEMY_Agon|r。拾取它以获得 |cRXP_LOOT_第二只猫头鹰的符号|r
    >>|cRXP_ENEMY_Agon|r |cRXP_WARN_patrols 稍微四处走动|r
    >>|cRXP_WARN_你必须拥有|r |T132150:0|t[猫头鹰之眼] |cRXP_WARN_buff 才能看到|r |cRXP_ENEMY_Agon|r
    .collect 210043,2 -- Symbol of the Second 猫头鹰 (1)
    .train 410028,1
step << Druid
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,36.914,76.142
    .goto Hillsbrad Foothills,54.424,82.016,0
    +点击 |cRXP_PICK_Twin 猫头鹰 Statue|r 获得 |T237178:0|t[Twin 猫头鹰 Aura] 增益
    >>|cRXP_WARN_你有 1 分 40 秒的时间到达另一个小岛并点击另一个|r |cRXP_PICK_Twin 猫头鹰 Statue|r
    >>|cRXP_WARN_请确保您使用|r |T132112:0|t[水生形态]
    >>|cRXP_WARN_另一个岛屿已在你的地图上标记|r
    .aura 424181
    .aura 424182
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,54.424,82.016
    >>游到另一个岛。在 1 分 40 秒内单击 |cRXP_PICK_Twin 猫头鹰 Statue|r
    >>|cRXP_WARN_请确保您使用|r |T132112:0|t[水生形态]
    >>|cRXP_WARN_如果你失败了并且失去了增益，请点击这个|cRXP_PICK_Twin 猫头鹰 Statue|r并返回你刚刚来自的岛屿|r
    .collect 210026,3 -- Symbol of the Third 猫头鹰 (1)
    .train 410028,1
step << Druid
    #completewith next
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
    .train 410028,1
step << Druid
    #completewith next
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
    .train 410028,1
step << Druid
    .goto Moonglade,52.53,40.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛甘纳尔|r
    .accept 78229 >>接受猫头鹰的试炼
    .turnin 78229 >>参加猫头鹰试炼
    .target Loganaar
    .train 410028,1
step << Druid
    .train 410028 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野性成长符文|r] |cRXP_WARN_进行训练|r |T236153:0|t[野性成长]
    .use 210137
    .itemcount 210137,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Mage SoD
#group RestedXP 符文书指南
#subgroup Chest << Warrior
#subgroup Legs << Mage
#name 暮色森林巫妖符文
#displayname Flagellation - 25 (Duskwood) << Warrior
#displayname Mass Regeneration - 25 (Duskwood) << Mage
#title Flagellation << Warrior
#title Mass Regeneration << Mage

step << Warrior/Mage
    #completewith next
    .goto Duskwood,23.630,34.888,15 >>进入东北墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,26.115,30.863
    >>打开 |cRXP_PICK_Dusty Coffer|r。获取 |T252996:0|t[|cRXP_LOOT_Decrepit Phylactery|r]
    .collect 210568,1 -- Decrepit Phylactery (1)
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,15.602,38.621,15 >>离开这个墓穴，前往西边的墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,18.140,37.940
    .cast 426182 >>点击小王座上的 |cRXP_PICK_Slumbering Bones|r|r
    >>|cRXP_WARN_这将召唤一个 25 级精英|r |cRXP_ENEMY_Awakened Lich|r
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,18.140,37.940
    >>杀死 |cRXP_ENEMY_Awakened Lich|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Flagellation|r] << Warrior
    >>杀死 |cRXP_ENEMY_Awakened Lich|r。拾取它以获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Mass Regeneration|r] << Mage
    >>|cRXP_WARN_如果其他人正在杀死 |cRXP_ENEMY_Awakened Lich|r，你也可以帮助他们，并且你仍然可以掠夺它|r
    .collect 210569,1 << Warrior -- Rune of Flagellation (1)
    .collect 211514,1 << Mage -- Spell Notes: Mass Regeneration (1)
    .mob Awakened Lich
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior
    .train 416050 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_鞭笞符文|r] |cRXP_WARN_进行训练|r |T133495:0|t[鞭笞]
    .use 210569
    .itemcount 210569,1
    .train 403480,1
step << Mage
    .train 416050 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术注释：质量再生|r] |cRXP_WARN_进行训练|r |T132870:0|t[质量再生]
    .use 211514
    .itemcount 211514,1
    .train 415939,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 狂怒一击 - 25（多区域）
#title Raging Blow

step << Warrior
    #completewith next
    .goto Wetlands,49.40,16.98
    .subzone 205 >>前往湿地的丹莫德
    .train 425444,1
step << Warrior
    .goto Wetlands,46.92,17.53,15,0
    .goto Wetlands,46.553,18.369
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑铁企业家|r
    >>|cRXP_WARN_你可能需要多次奔跑才能到达他|r
    >>|cRXP_BUY_购买 a|r |T135130:0|t[屠龙之枪] |cRXP_BUY_it 花费 75 银币|r
    .collect 209874,1,78134,1 -- Dragonslayer's Lance (1)
    .target Dark Iron Entrepreneur
    .train 425444,1
step << Warrior
    #completewith next
    .goto Redridge Mountains,69.928,55.814
    .subzone 2099 >>前往赤脊山的石岗堡
    .train 425444,1
step << Warrior
    .goto Redridge Mountains,69.928,55.814
    >>点击 |cRXP_PICK_Wall-Mounted Shield|r。拾取它以获得 |cRXP_LOOT_Dragonslayer's Shield|r
    >>|cRXP_WARN_这是主城堡楼上，位于 |cRXP_ENEMY_Gath'Ilzogg|r 后面，他是 26 级精英|r
    >>|cRXP_WARN_你需要杀死 |cRXP_ENEMY_Gath'Ilzogg|r 或让他与其他人交战才能抢劫它。确保你在进入之前有一个团队|r
    .collect 209873,1,78133,1 -- Dragonslayer's Shield (1)
    .train 425444,1
step << Warrior
    #completewith next
    .subzone 209,2 >>找到一个队伍并进入影牙城堡
step << Warrior
    >>打开 |cRXP_PICK_Discarded Helm|r。拾取它以获得 |cRXP_LOOT_Dragonslayer's Helm|r
    >>|cRXP_WARN_这是在|r |cRXP_ENEMY_Commander Springvale 后面的长凳上找到的。|r
    .collect 209872,1,78132,1 -- Dragonslayer's Helm (1)
    .train 425444,1
step << Warrior
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .accept 78132 >>接受屠龙者的头盔
    .accept 78134 >>接受屠龙者之枪
    .accept 78133 >>接受屠龙者之盾
    .turnin 78132 >>交出屠龙者的头盔
    .turnin 78134 >>交出屠龙者之枪
    .turnin 78133 >>交出屠龙者之盾
    .target Alonso
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .accept 78144 >>接受屠龙者阿隆索
    .target Alonso
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.029,68.999
    >>杀死 |cRXP_ENEMY_绿龙幼崽|r
    .complete 78144,1 -- Accompany Alonso to slay the dragon.
    .target Alonso
    .mob Green Dragon Whelp
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.053,69.187
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alonso|r
    .turnin 78144 >>交出屠龙者阿隆索
    .target Alonso
    .train 425444,1
step << Warrior
    .train 425444 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_怒击符文|r] |cRXP_WARN_进行训练|r |T132215:0|t[怒击]
    .use 210015
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 灵魂力量-22（灰谷）
#title Strength of Soul

step << Priest
    .goto Ashenvale,32.0,43.0,65,0
    .goto Ashenvale,33.6,38.8,65,0
    .goto Ashenvale,37.6,34.0
    >>杀死 |cRXP_ENEMY_Thistlefur Totemics|r 和 |cRXP_ENEMY_Thistlefur Shaman|r。从他们身上获取 |T135736:0|t[Primal Insight]
    .collect 211534,1 -- Primal Insight (1)
    .mob Thistlefur Totemic
    .mob Thistlefur Shaman
    .train 415997,1
step << Priest
    .goto Ashenvale,38.002,29.528,40,0
    .goto Ashenvale,37.938,27.958,30,0
    .goto Ashenvale,38.819,27.160,30,0
    .goto Ashenvale,38.804,26.558
    >>|cRXP_WARN_跑上洞穴入口旁边的大树。小心地跟着箭头走|r
    .use 211534 >>|cRXP_WARN_当你靠近树上的两个捕梦网时，使用|r |T135736:0|t[原始洞察] |cRXP_WARN_来创造|r |T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r
    .collect 211531,1 -- Prophecy of Seven Visitors (1)
    .train 415997,1
step << Priest
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益 << Alliance
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益 << Horde
    >>你必须在以下任一地方跪下：北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须跪在下列地点之一内：月亮井，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须/在任何墓地跪下 << Undead
    >>你必须跪在任意一个洛阿祭坛前，比如森金村的祭坛或者贫瘠之地十字路口的祭坛 << Troll
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Horde
    .train 415997 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益效果，使用|r |T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r |cRXP_WARN_学习|r |T135911:0|t[灵魂的力量] << Alliance
    .train 415997 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r |cRXP_WARN_学习|r |T135911:0|t[灵魂的力量] << Horde
    .use 211531
    .itemcount 211531,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Bracers
#name 真言术：屏障 - 22（赤脊山）
#title Power Word: Barrier

step << Priest
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .train 425213,1
step << Priest
    .goto Redridge Mountains,67.2,53.6
    .goto Redridge Mountains,68.8,57.4
    >>击杀 |cRXP_ENEMY_黑石暗影法师|r。拾取他们以获得 |T135975:0|t[|cRXP_FRIENDLY_被奴役之城的预言|r]
    >>|cRXP_ENEMY_黑石暗影法师|r |cRXP_WARN_是 22-23 级精英。为此寻找一个团队|r
    .collect 211530,1 -- Prophecy of a City Enthralled (1)
    .mob Blackrock Shadowcaster
    .train 425213,1
step << Priest
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益 << Alliance
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益 << Horde
    >>你必须在以下任一地方跪下：北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须跪在下列地点之一内：月亮井，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须/在任何墓地跪下 << Undead
    >>你必须跪在任意一个洛阿祭坛前，比如森金村的祭坛或者贫瘠之地十字路口的祭坛 << Troll
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Horde
    .train 425213 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益使用|r |T135975:0|t[|cRXP_FRIENDLY_被迷惑之城的预言|r] |cRXP_WARN_学习|r |T253400:0|t[真言术：屏障] << Alliance
    .train 425213 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益使用|r |T135975:0|t[|cRXP_FRIENDLY_被迷惑之城的预言|r] |cRXP_WARN_学习|r |T253400:0|t[真言术：屏障] << Horde
    .use 211530
    .itemcount 211530,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 治疗之环 - 25（暮色森林）
#title Circle of Healing

step << Priest
    .goto Duskwood,50.4,70.8,60,0
    .goto Duskwood,50.2,76.4
    >>杀死 |cRXP_ENEMY_Defias Night Runners|r、|cRXP_ENEMY_Defias Night Blades|r 和 |cRXP_ENEMY_Defias Enchanters|r。拾取他们以获得 |T135736:0|t[|cRXP_LOOT_Dark Insight|r]
    .collect 211528,1 -- Dark Insight (1)
    .mob Defias Night Runner
    .mob Defias Night Blade
    .mob Defias Night Enchanter
    .train 402859,1
step << Priest
    .goto Duskwood,91.11,30.58
    .use 211528 >>|cRXP_WARN_使用|r |T135736:0|t[|cRXP_LOOT_黑暗洞察|r] |cRXP_WARN_在塔后面的僻静坟墓处接收|r |T135975:0|t[|cRXP_FRIENDLY_千灯预言|r]
    .collect 211490,1 -- Prophecy of a Thousand Lights (1)
    .train 402859,1
step << Priest
    >>你现在必须获得两个|T135934:0|t|T136057:0|t[冥想]增益 << Alliance
    >>你现在必须获得两个|T237569:0|t|T136077:0|t[冥想]增益 << Horde
    >>你必须在以下任一地方跪下：北郡修道院、暴风城大教堂、安威玛尔的圣光祭坛、洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须跪在下列地点之一内：月亮井，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须/在任何墓地跪下 << Undead
    >>你必须跪在任意一个洛阿祭坛前，比如森金村的祭坛或者贫瘠之地十字路口的祭坛 << Troll
    >>为了获得你的第二个 |T135934:0|t|T136057:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想] 增益，你需要 /跪在一个与你拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前，并且他们必须 /在瞄准你时祈祷 << Horde
    .train 402859 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_千灯预言]|r |cRXP_WARN_学习|r |T135887:0|t[治疗之环] << Alliance
    .train 402859 >>|cRXP_WARN_一旦你同时拥有|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益，使用|r |T135975:0|t[|cRXP_FRIENDLY_千灯预言]|r |cRXP_WARN_学习|r |T135887:0|t[治疗之环] << Horde
    .use 211490
    .itemcount 211490,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 眼镜蛇袭击 - 25（希尔斯布莱德丘陵）
#title Cobra Strikes


    --Rune of Cobra Strikes

step
    #season 2
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r, 可以从幽暗城穿过银松森林 << Horde
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r << Alliance
step
    #season 2
    #loop
    .goto Hillsbrad Foothills,58.2,19.6,40,0
    .goto Hillsbrad Foothills,57.5,36.4,50,0
    .goto Hillsbrad Foothills,51.1,46.4,40,0
    >>寻找 |cRXP_FRIENDLY_Zixil|r。他在塔伦米尔和南海镇之间巡逻。从他那里购买 |T134041:0|t[淡水鲷鱼饵]
    .collect 210410,1 --Freshwater Snapper Bait (1)
    .target Zixil
    .train 425759,1
step
    #season 2
    .goto Hillsbrad Foothills,61.05,33.36
    .use 210410 >>在池塘中央的船上使用 |T134041:0|t[淡水鲷鱼饵]
    >>杀死 |cRXP_ENEMY_Koartul|r (25 级精英)，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Cobra Strikes|r]
    .collect 210596,1 --Rune of Cobra Strikes (1)
    .mob Koartul
    .train 425759,1
step
    #season 2
    .train 425759 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_眼镜蛇打击符文|r] |cRXP_WARN_训练|r |T236177:0|t[眼镜蛇打击]
    .use 210596
    .itemcount 210596,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 杀戮射击 - 25（多个区域）
#title Kill Shot

step
    #completewith WyvernWrangling
    >>|cRXP_BUY_从拍卖行购买|r |T135144:0|t[高级魔杖] |cRXP_BUY_|r
    .collect 11288,1 --Greater Magic Wand (1)
    .train 410111,1
step
    #season 2
    #completewith next
    +|cRXP_WARN_开始寻找哀嚎洞穴的队伍|r
step
    #season 2
    #completewith next
    .goto Kalimdor,51.89,54.77,20,0
    .goto Kalimdor,51.95,54.56,20,0
    .goto Kalimdor,52.27,54.65,30,0
    .goto Kalimdor,52.40,55.18
    .zone 279 >>进入哀嚎洞穴
step
    #season 2
    >>杀死 |cRXP_ENEMY_吞噬者穆坦努斯|r。从他身上搜刮 |T132775:0|t[|cRXP_LOOT_催眠水晶|r]
    .collect 209838,1 --Hypnotic Crystal (1)
    .mob Mutanus the Devourer
    .train 410111,1
step
    #season 2
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    #season 2
    .goto Ashenvale,37.91,34.49,40,0
    .goto Ashenvale,35.89,36.65,40,0
    .goto Ashenvale,35.75,32.01,40,0
    .goto Ashenvale,34.09,38.48,40,0
    .goto Ashenvale,31.86,39.25,40,0
    .goto Ashenvale,32.57,42.78,40,0
    .goto Ashenvale,30.98,44.40,40,0
    .goto Ashenvale,35.75,32.01
    >>杀死 |cRXP_ENEMY_Thistlefur Shamans|r。掠夺他们以获得 |T237004:0|t[|cRXP_LOOT_Wild Magic Essence|r]
    .collect 209841,1 --Wild Magic Essence (1)
    .mob Thistlefur Shaman
    .train 410111,1
step
    #season 2
    .use 209841 >>使用 |T237004:0|t[|cRXP_LOOT_Wild Magic Essence|r] 来制作 |T237489:0|t[|cRXP_LOOT_Gnarled Wand of Wild Magic|r]
    .collect 209840,1 --Gnarled Wand of Wild Magic (1)
    .train 410111,1
step
    #season 2
    #completewith WyvernWrangling
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
step
    #season 2
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jixo Madrocket|r in Stonetalon Mountains
    .accept 78114 >>接受 野生飞龙争夺战
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    #label WyvernWrangling
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jixo Madrocket|r
    .turnin 78114 >>交出野生飞龙争夺战
    .accept 78121 >>接受“驯服一只野生飞龙”的请求
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    .goto Stonetalon Mountains,60.70,62.33
    >>和 |cRXP_FRIENDLY_Jixo Madrocket|r 呆在一起，看他驯服 |cRXP_ENEMY_Wyvern|r
    .turnin 78121 >>交出一只野生飞龙
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    .train 410111 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r] |cRXP_WARN_进行训练|r |T236174:0|t[杀戮一击]
    .use 209852
    .itemcount 209852,1


]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文书指南
<< SoD
#subgroup Chest << Shaman
#subgroup Belt << Warrior/Hunter/Mage/Paladin
#subgroup Boots << Warlock/Priest/Rogue/Druid
#name 黑暗骑士符文
#displayname Spirit of the Redeemer - 40 (Azeroth) << Priest
#displayname Melee Specialist - 40 (Azeroth) << Hunter
#displayname King of the Jungle - 40 (Azeroth) << Druid
#displayname Precise Timing - 40 (Azeroth) << Warrior
#displayname Two-Handed Mastery - 40 (Azeroth) << Shaman
#displayname Demonic Knowledge - 40 (Azeroth) << Warlock
#displayname Infusion of Light - 40 (Azeroth) << Paladin
#displayname Missile Barrage - 40 (Azeroth) << Mage
#displayname Waylay - 40 (Azeroth) << Rogue
#title Spirit of the Redeemer << Priest
#title Melee Specialist << Hunter
#title King of the Jungle << Druid
#title Precise Timing << Warrior
#title Two-Handed Mastery << Shaman
#title Demonic Knowledge << Warlock
#title Infusion of Light << Paladin
#title Missile Barrage << Mage
#title Waylay << Rogue

step
    #completewith Sigil
    +|cRXP_WARN_在尝试获取此符文之前，强烈建议您寻找一个团队。您必须杀死 41 级精英 7 次|r
step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    #label Sigil
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Deadwind Pass,52.095,34.119
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Dalaran Agent|r to receive |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r]
    .skipgossip 218920,1
    .collect 216941,1
    .target Dalaran Agent
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .equip 13 >>|cRXP_WARN_Equip|r |T338784:0|t[|cRXP_FRIENDLY_艾瑞登的印记|r]
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Deadwind Pass,45.04,28.88
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216945,<1
step
    #completewith next
    .goto Deadwind Pass,45.04,28.88
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Deadwind Pass,45.04,28.88
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Curious Dalaran Relic|r
    .use 216941
    .collect 216945,1
    .mob Dark Rider
step
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Swamp of Sorrows,69,28
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216948,<1
step
    #completewith next
    .goto Swamp of Sorrows,69,28
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Swamp of Sorrows,69,28
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Odd Dalaran Relic|r
    .use 216941
    .collect 216948,1
    .mob Dark Rider
step
    #completewith next
    .zone Duskwood >>前往: |cRXP_PICK_暮色森林|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Duskwood,23,47
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216946,<1
step
    #completewith next
    .goto Duskwood,23,47
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Duskwood,23,47
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Glittering Dalaran Relic|r
    .use 216941
    .collect 216946,1
    .mob Dark Rider
step
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Badlands,58,54
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216951,<1
step
    #completewith next
    .goto Badlands,58,54
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Badlands,58,54
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Slippery Dalaran Relic|r
    .use 216941
    .collect 216951,1
    .mob Dark Rider
step
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Arathi Highlands,60,40
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216947,<1
step
    #completewith next
    .goto Arathi Highlands,60,40
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Arathi Highlands,60,40
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Whirring Dalaran Relic|r
    .use 216941
    .collect 216947,1
    .mob Dark Rider
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto The Barrens,52,36
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216949,<1
step
    #completewith next
    .goto The Barrens,52,36
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto The Barrens,52,36
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Heavy Dalaran Relic|r
    .use 216941
    .collect 216949,1
    .mob Dark Rider
step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Desolace,65,25
    .aura 438288 >>|cRXP_WARN_前往箭头位置。当你接近时，你将收到|r |T237534:0|t[黑暗存在] |cRXP_WARN_buff|r
    >>|cRXP_WARN_您还必须下马才能获得 BUFF！|r
    >>|cRXP_WARN_确保你有|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_equiped|r
    .use 216941
    .itemcount 216950,<1
step
    #completewith next
    .goto Desolace,65,25
    .cast 438305 >>|cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r] |cRXP_WARN_来揭露|r |cRXP_ENEMY_Dark Rider|r
    .use 216941
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Desolace,65,25
    >>杀死 |cRXP_ENEMY_Dark Rider|r。从他身上搜刮 |cRXP_LOOT_Creepy Dalaran Relic|r
    .use 216941
    .collect 216950,1
    .mob Dark Rider
step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    .goto Deadwind Pass,52.095,34.119
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Dalaran Agent|r
    .turnin 80147 >>上交奇异的达拉然遗物
    .turnin 80149 >>上交奇异的达拉然遗物
    .turnin 80098 >>上交奇异的达拉然遗物
    .turnin 80152 >>上交奇异的达拉然遗物
    .turnin 80148 >>上交奇异的达拉然遗物
    .turnin 80150 >>上交奇异的达拉然遗物
    .turnin 80151 >>上交奇异的达拉然遗物
    .turnin 80120 >>向达拉然提交一项服务
    .target Dalaran Agent
step
    .train 425312,1 << Priest
    .train 426180,1 << Paladin
    .train 401763,1 << Mage
    .train 416086,1 << Hunter
    .train 424765,1 << Druid
    .train 416005,1 << Warrior
    .train 416014,1 << Warlock
    .train 415926,1 << Rogue
    .train 436368,1 << Shaman
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T135791:0|t[|cRXP_FRIENDLY_Luminous Epiphany|r] << Priest
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Infusions|r] << Paladin
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Missile Barrage|r] << Mage
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Close Combat|r] << Hunter
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_丛林​​之王符文|r] << Druid
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Ruthless Precision|r] << Warrior
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Forbidden Knowledge|r] << Warlock
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_Supply Bag|r] 以获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Assailant|r] << Rogue
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_双手大师符文|r] << Shaman
    .use 217014
    .collect 213144,1 << Priest
    .collect 213130,1 << Paladin
    .collect 213112,1 << Mage
    .collect 213124,1 << Hunter
    .collect 213118,1 << Druid
    .collect 213104,1 << Warrior
    .collect 213100,1 << Warlock
    .collect 213137,1 << Rogue
    .collect 216606,1 << Shaman
step
    .itemcount 213144,1 << Priest
    .itemcount 213130,1 << Paladin
    .itemcount 213112,1 << Mage
    .itemcount 213124,1 << Hunter
    .itemcount 213118,1 << Druid
    .itemcount 213104,1 << Warrior
    .itemcount 213100,1 << Warlock
    .itemcount 213137,1 << Rogue
    .itemcount 216606,1 << Shaman
    .use 213144 << Priest
    .use 213130 << Paladin
    .use 213112 << Mage
    .use 213124 << Hunter
    .use 213118 << Druid
    .use 213104 << Warrior
    .use 213100 << Warlock
    .use 213137 << Rogue
    .use 216606 << Shaman
    .train 425312 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_Luminous Epiphany|r] |cRXP_WARN_训练|r |T132864:0|t[救赎者之灵] << Priest
    .train 426180 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灌注符文|r] |cRXP_WARN_训练|r |T236254:0|t[光之灌注] << Paladin
    .train 401763 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_咒语说明：导弹弹幕|r] |cRXP_WARN_进行训练|r |T236221:0|t[导弹弹幕] << Mage
    .train 416086 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_近战符文|r] |cRXP_WARN_训练|r |T132394:0|t[近战专家] << Hunter
    .train 424765 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_丛林​​之王符文|r] |cRXP_WARN_进行训练|r |T236159:0|t[丛林之王] << Druid
    .train 416005 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无情精准符文|r] |cRXP_WARN_进行训练|r |T134377:0|t[精确计时] << Warrior
    .train 416014 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_禁忌知识符文|r] |cRXP_WARN_进行训练|r |T136172:0|t[恶魔知识] << Warlock
    .train 415926 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_袭击者符文|r] |cRXP_WARN_进行训练|r |T236286:0|t[伏击] << Rogue
    .train 436368 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_双手精通符文|r] |cRXP_WARN_训练|r |T135145:0|t[双手精通] << Shaman
]])

RXPGuides.RegisterGuide([[

#classic
<< SoD
#group RestedXP 符文书指南
#subgroup Belt << Druid/Priest/Rogue/Warlock
#subgroup Boots << Mage/Shaman/Hunter/Paladin/Warrior
#name 凄凉之地锁链符文
#displayname Mind Spike - 35 (Azeroth) << Priest
#displayname Trap Launcher - 35 (Azeroth) << Hunter
#displayname Eclipse - 35 (Azeroth) << Druid
#displayname Enraged Regeneration - 35 (Azeroth) << Warrior
#displayname Ancestral Awakening - 35 (Azeroth) << Shaman
#displayname Shadow and Flame - 35 (Azeroth) << Warlock
#displayname The Art of War - 35 (Azeroth) << Paladin
#displayname Brain Freeze - 35 (Azeroth) << Mage
#displayname Poisoned Knife - 35 (Azeroth) << Rogue
#title Mind Spike << Priest
#title Trap Launcher << Hunter
#title Eclipse << Druid
#title Enraged Regeneration << Warrior
#title Ancestral Awakening << Shaman
#title Shadow and Flame << Warlock
#title The Art of War << Paladin
#title Brain Freeze << Mage
#title Poisoned Knife << Rogue

step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>点击|cRXP_PICK_Extinguished Campfire|r
    .goto Desolace,47.532,54.605
    .accept 79229 >>接受拦路抢劫
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比布里·弗斯巴克|r
    .goto Desolace,62.314,38.965
    .turnin 79229 >>实施拦路抢劫
    .accept 79235 >>接受逃亡
    .target Bibbly F'utzbuckle
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tokal|r
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79235 >>举报逃犯
    .accept 79236 >>接受 Cherry 的想法吗？
    .target Tokal
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尼克拉克斯·菲拉莫格|r
    >>|cRXP_BUY_购买 a|r |T132790:0|t[樱桃格罗格]
    .goto Stranglethorn Vale,27.039,77.168
    .collect 4600,1,79236,1
    .target Nixxrax Fillamug
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tokal|r
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79236 >>交出 Cherry 你的想法吗？
    .accept 79242 >>盗贼之间不接受荣誉
    .target Tokal
step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    .goto Wetlands,58.320,6.927
    .cast 6477 >>将 |cRXP_PICK_Rowboat|r 放入水中
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .subzoneskip 308
step << NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto Arathi Highlands,93.90,71.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illari Duskfeather|r to receive |cRXP_LOOT_Illari's Key|r
    .complete 79242,1 --Found Illari Duskfeather
    .collect 212347,1,79242,1 --Illari's Key
    .skipgossip 215655,1,1,2
    .target Illari Duskfeather
step << !NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    #completewith next
    .goto Arathi Highlands,93.90,71.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illari Duskfeather|r. You will have to fight her after
    .complete 79242,1 --Found Illari Duskfeather
    .skipgossip 215655,1,1,1
    .target Illari Duskfeather
step << !NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto Arathi Highlands,93.90,71.49
    >>杀死 |cRXP_ENEMY_Illari Duskfeather|r。打开她掉在地上的 |cRXP_PICK_Dropped Pouch|r。拾取它以获取 |cRXP_LOOT_Illari's Key|r
    .collect 212347,1,79242,1 --Illari's Key
    .skipgossip 215655,1,1,1
    .mob Illari Duskfeather
step << !NightElf
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    .goto Arathi Highlands,93.90,71.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Illari Duskfeather|r
    .complete 79242,1 --Found Illari Duskfeather
    .skipgossip
    .target Illari Duskfeather
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>点击地面上的 |cRXP_PICK_Illari's Loot Cache|r
    .goto Arathi Highlands,94.154,69.266
    .turnin 79242 >>交出盗贼无荣誉
step
    .train 431663,1 << Priest
    .train 416031,1 << Paladin
    .train 401752,1 << Mage
    .train 410118,1 << Hunter
    .train 410029,1 << Druid
    .train 403467,1 << Warrior
    .train 426452,1 << Warlock
    .train 425102,1 << Rogue
    .train 425883,1 << Shaman
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T135791:0|t[|cRXP_FRIENDLY_Psychosophic Epiphany|r] << Priest
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Warfare|r] << Paladin
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Brain Freeze|r] << Mage
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Trapper|r] << Hunter
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Eclipse|r] << Druid
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Healing Rage|r] << Warrior
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Burning Darkness|r] << Warlock
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Poisoned Blade|r] << Rogue
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Ancestral Awakening|r] << Shaman
    .collect 212552,1 << Priest
    .collect 212551,1 << Paladin
    .collect 208853,1 << Mage
    .collect 212549,1 << Hunter
    .collect 212548,1 << Druid
    .collect 212562,1 << Warrior
    .collect 212561,1 << Warlock
    .collect 212559,1 << Rogue
    .collect 212560,1 << Shaman
    .use 212553 --Jewel-Encrusted Box (1)
step
    .train 431663 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_Psychosophic Epiphany|r] |cRXP_WARN_进行训练|r |T136181:0|t[Mind Spike] << Priest
    .train 416031 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_战争符文|r] |cRXP_WARN_进行训练|r |T236246:0|t[孙子兵法] << Paladin
    .train 401752 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_拼写注释：Brain Freeze|r] |cRXP_WARN_进行训练|r |T236206:0|t[Brain Freeze] << Mage
    .train 410118 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_诱捕者符文|r] |cRXP_WARN_进行训练|r |T133882:0|t[陷阱发射器] << Hunter
    .train 410029 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_Eclipse 符文|r] |cRXP_WARN_进行训练|r |T236151:0|t[Eclipse] << Druid
    .train 403467 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_治疗之怒符文|r] |cRXP_WARN_训练|r |T132345:0|t[愤怒再生] << Warrior
    .train 426452 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧黑暗符文|r] |cRXP_WARN_训练|r |T135823:0|t[暗影与火焰] << Warlock
    .train 425102 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毒刃符文|r] |cRXP_WARN_训练|r |T236270:0|t[毒刀] << Rogue
    .train 425883 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_祖先觉醒符文|r] |cRXP_WARN_训练|r |T237571:0|t[祖先觉醒] << Shaman
    .use 212552 << Priest
    .use 212551 << Paladin
    .use 208853 << Mage
    .use 212549 << Hunter
    .use 212548 << Druid
    .use 212562 << Warrior
    .use 212561 << Warlock
    .use 212559 << Rogue
    .use 212560 << Shaman
    .itemcount 212552,1 << Priest
    .itemcount 212551,1 << Paladin
    .itemcount 208853,1 << Mage
    .itemcount 212549,1 << Hunter
    .itemcount 212548,1 << Druid
    .itemcount 212562,1 << Warrior
    .itemcount 212561,1 << Warlock
    .itemcount 212559,1 << Rogue
    .itemcount 212560,1 << Shaman
step
    .goto 1417,89.536,78.149
    .cast 6477 >>在水中进入 |cRXP_PICK_Rowboat|r 返回阿拉希
    .subzoneskip 308,1
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文书指南
#subgroup 法术书
#name 符文法术书

#displayname Expanded Intellect (Stormwind) << Alliance Mage
#displayname Expanded Intellect (Orgrimmar) << Horde Mage
#title Expanded Intellect << Mage
#displayname Aspect of the Viper/Heart of the Lion (Stormwind) << Alliance Hunter
#displayname Aspect of the Viper/Heart of the Lion (Orgrimmar) << Horde Hunter
#title Aspect of the Viper/Heart of the Lion << Hunter
#displayname Soul Harvesting/Portal of Summoning/Fel Armor (Stormwind) << Alliance Warlock
#displayname Soul Harvesting/Portal of Summoning/Fel Armor (Orgrimmar) << Horde Warlock
#title Soul Harvesting/Portal of Summoning/Fel Armor << Warlock
#displayname Redirect/Occult Poison/Numbing Poison/Sebacious Poison/Atrophic Poison (Stormwind) << Alliance Rogue
#displayname Redirect/Occult Poison/Numbing Poison/Sebacious Poison/Atrophic Poison (Orgrimmar) << Horde Rogue
#title Redirect/Occult Poison/Numbing Poison/Sebacious Poison/Atrophic Poison << Rogue
#displayname Shadowfiend/Increased Fortitude (Stormwind) << Alliance Priest
#displayname Shadowfiend/Increased Fortitude (Orgrimmar) << Horde Priest
#title Shadowfiend/Increased Fortitude << Priest
#displayname Enhanced Restoration/Revive/Deeper Wilds (Stormwind) << Alliance Druid
#displayname Enhanced Restoration/Revive/Deeper Wilds (Orgrimmar) << Horde Druid
#title Enhanced Restoration/Revive/Deeper Wilds << Druid
#displayname Commanding Shout/Meathook (Stormwind) << Alliance Warrior
#displayname Commanding Shout/Meathook (Orgrimmar) << Horde Warrior
#title Commanding Shout/Meathook << Warrior
#displayname Testament of the Exorcist/Enhanced Blessings (Stormwind) << Paladin
#title Testament of the Exorcist/Enhanced Blessings << Paladin
#displayname Totemic Projection/Shamanistic Rage (Orgrimmar) << Shaman
#title Totemic Projection/Shamanistic Rage << Shaman

step
    #completewith BuyBook
    >>|cRXP_WARN_现在可以用金币从暴风城购买技能书，而不必前往血色修道院购买。|r << Alliance
    >>|cRXP_WARN_现在可以用金币从奥格瑞玛购买技能书，而不必前往血色修道院购买。|r << Horde
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r << Alliance
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r << Horde
step << Alliance
    #optional
    #completewith next
    .goto Stormwind City,70.347,27.208,15,0
    .goto Stormwind City,72.005,21.542,20 >>前往暴风要塞
step
    #label BuyBook
    .goto Stormwind City,74.182,7.465 << Alliance
    .goto Orgrimmar,38.923,38.398 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米尔顿·西弗|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_佐尔·孤树|r << Horde
    >>|cRXP_WARN_注意：|T133736:0|t|cRXP_LOOT_[Tome of Expanded Intellect]|r 需要 25 级才能使用|r << Mage
    >>|cRXP_WARN_注意：|T133733:0|t|cRXP_LOOT_[Grimoire of Soul Harvesting]|r 和 |T133733:0|t|cRXP_LOOT_[Grimoire of Portal of Summoning]|r 需要 25 级才能使用|r << Warlock
    >>|cRXP_WARN_注意：|T133733:0|t|cRXP_LOOT_[魔甲典]|r 需要 50 级才能使用|r << Warlock
    >>|cRXP_WARN_注意：|T133745:0|t|cRXP_LOOT_[驱魔人的证言]|r 和 |T133745:0|t|cRXP_LOOT_[殉道者的证言]|r 需要 10 级才能使用|r << Paladin
    >>|cRXP_WARN_注意：|T133745:0|t|cRXP_LOOT_[强化祝福的证明]|r 需要 25 级才能使用|r << Paladin
    >>|cRXP_WARN_注意：|T133739:0|t|cRXP_LOOT_[论狮子之心]|r 需要 10 级才能使用|r << Hunter
    >>|cRXP_WARN_注意：|T133739:0|t|cRXP_LOOT_[Treatise on Aspect of the Viper]|r 需要 25 级才能使用|r << Hunter
    >>|cRXP_WARN_注意：|T133735:0|t|cRXP_LOOT_[重定向手册]|r 需要 25 级才能使用|r << Rogue
    >>|cRXP_WARN_注意：|T133735:0|t|cRXP_LOOT_[神秘毒药手册]|r 需要 54 级才能使用|r << Rogue
    >>|cRXP_WARN_注意：|T133735:0|t|cRXP_LOOT_[麻木毒药手册]|r、|cRXP_LOOT_[脂质毒药手册]|r 和 |cRXP_LOOT_[萎缩毒药手册]|r 需要 60 级才能使用|r << Rogue
    >>|cRXP_WARN_注意：|T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r 和 |T237162:0|t|cRXP_LOOT_[坚韧增强卷轴]|r 需要 25 级才能使用|r << Priest
    >>|cRXP_WARN_注意：|T134914:0|t|cRXP_LOOT_[更深荒野传单]|r|cRXP_WARN_，|r |T134914:0|t|cRXP_LOOT_[增强恢复传单]|r |cRXP_WARN_和 |T134914:0|t|cRXP_LOOT_[复活传单]|r 需要 25 级才能使用|r << Druid   
    >>|cRXP_WARN_注意：|T133741:0|t|cRXP_LOOT_[指挥之吼手册]|r 需要 25 级才能使用|r << Warrior
    >>|cRXP_WARN_注意：|T133741:0|t|cRXP_LOOT_[Handbook of Meathook]|r 需要 40 级才能使用|r << Warrior
    >>|cRXP_WARN_注意：|T133747:0|t|cRXP_LOOT_[萨满之怒启示录]|r 需要 10 级才能使用|r << Shaman
    >>|cRXP_WARN_注意：|T133747:0|t|cRXP_LOOT_[图腾投影启示录]|r 需要 25 级才能使用|r << Shaman
    .train 438040 >>|cRXP_WARN_购买并使用|r |T133735:0|t|cRXP_LOOT_[重定向手册]|r |cRXP_WARN_学习|r |T135425:0|t[重定向] << Rogue
    .train 458822 >>|cRXP_WARN_购买并使用|r |T133735:0|t|cRXP_LOOT_[神秘毒药手册]|r |cRXP_WARN_学习|r |T135935:0|t[神秘毒药 I] << Rogue
    .train 438040 >>|cRXP_WARN_购买并使用|r |T133735:0|t|cRXP_LOOT_[麻痹毒药手册]|r |cRXP_WARN_学习|r |T132098:0|t[麻痹毒药] << Rogue
    .train 439500 >>|cRXP_WARN_购买并使用|r |T133735:0|t|cRXP_LOOT_[皮脂毒手册]|r |cRXP_WARN_学习|r |T132108:0|t[皮脂毒] << Rogue
    .train 438040 >>|cRXP_WARN_购买并使用|r |T133735:0|t|cRXP_LOOT_[萎缩毒药手册]|r |cRXP_WARN_学习|r |T132100:0|t[萎缩毒药] << Rogue
    .train 436949 >>|cRXP_WARN_购买并使用|r |T133736:0|t|cRXP_LOOT_[扩展智力之书]|r |cRXP_WARN_学习|r |T236513:0|t[扩展智力] << Mage
    .train 436956 >>|cRXP_WARN_购买并使用|r |T134914:0|t|cRXP_LOOT_[Deeper Wilds 传单]|r |cRXP_WARN_学习|r |T132124:0|t[Deeper Wilds] << Druid
    .train 417123 >>|cRXP_WARN_购买并使用|r |T134914:0|t|cRXP_LOOT_[增强修复传单]|r |cRXP_WARN_学习|r |T136073:0|t[增强修复] << Druid
    .train 437138 >>|cRXP_WARN_购买并使用|r |T134914:0|t|cRXP_LOOT_[Revive 传单]|r |cRXP_WARN_学习|r |T132132:0|t[Revive] << Druid
    .train 409580 >>|cRXP_WARN_购买并使用|r |T133739:0|t|cRXP_LOOT_[狮子之心论文]|r |cRXP_WARN_学习|r |T132185:0|t[狮子之心] << Hunter
    .train 415423 >>|cRXP_WARN_购买并使用|r |T133739:0|t|cRXP_LOOT_[毒蛇之相论文]|r |cRXP_WARN_学习|r |T132160:0|t[毒蛇之相] << Hunter
    .train 415076 >>|cRXP_WARN_购买并使用|r |T133745:0|t|cRXP_LOOT_[驱魔人的证言]|r |cRXP_WARN_学习|r |T135956:0|t[驱魔人] << Paladin
    .train 407798 >>|cRXP_WARN_购买并使用|r |T133745:0|t|cRXP_LOOT_[殉难证明]|r |cRXP_WARN_学习|r |T135961:0|t[殉难印章] << Paladin
    .train 435984 >>|cRXP_WARN_购买并使用|r |T133745:0|t|cRXP_LOOT_[强化祝福的证明]|r |cRXP_WARN_学习|r |T236248:0|t[强化祝福] << Paladin
    .train 401977 >>|cRXP_WARN_购买并使用|r |T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r |cRXP_WARN_学习|r |T136199:0|t[暗影魔] << Priest
    .train 436951 >>|cRXP_WARN_购买并使用|r |T237162:0|t|cRXP_LOOT_[坚韧增强卷轴]|r |cRXP_WARN_学习|r |T237543:0|t[坚韧增强] << Priest
    .train 437032 >>|cRXP_WARN_购买并使用|r |T133733:0|t|cRXP_LOOT_[灵魂收割魔典]|r |cRXP_WARN_学习|r |T132851:0|t[灵魂收割] << Warlock
    .train 437169 >>|cRXP_WARN_购买并使用|r |T133733:0|t|cRXP_LOOT_[召唤之门魔典]|r |cRXP_WARN_学习|r |T134423:0|t[召唤之门] << Warlock
    .train 403619 >>|cRXP_WARN_购买并使用|r |T133733:0|t|cRXP_LOOT_[魔甲魔典]|r |cRXP_WARN_学习|r |T136156:0|t[魔甲] << Warlock
    .train 403215 >>|cRXP_WARN_购买并使用|r |T133741:0|t|cRXP_LOOT_[指挥吼叫手册]|r |cRXP_WARN_学习|r |T132351:0|t[指挥吼叫] << Warrior
    .train 403228 >>|cRXP_WARN_购买并使用|r |T133741:0|t|cRXP_LOOT_[肉钩手册]|r |cRXP_WARN_学习|r |T132507:0|t[肉钩] << Warrior
    .train 425336 >>|cRXP_WARN_购买并使用|r |T133747:0|t|cRXP_LOOT_[萨满之怒启示]|r |cRXP_WARN_学习|r |T136088:0|t[萨满之怒] << Shaman
    .train 437009 >>|cRXP_WARN_购买并使用|r |T133747:0|t|cRXP_LOOT_[图腾投影启示录]|r |cRXP_WARN_学习|r |T310733:0|t[图腾投影] << Shaman
    .use 216738 << Rogue -- Manual of Redirect
    .use 226396 << Rogue -- Manual of Occult Poison
    .use 226394 << Rogue -- Manual of Atrophic Poison
    .use 226397 << Rogue -- Manual of Sebacious Poison
    .use 226395 << Rogue -- Manual of Numbing Poison
    .use 216740 << Mage -- Tome of Expanded Intellect
    .use 216744 << Priest -- Scroll of Increased Fortitude
    .use 216745 << Priest -- Scroll of Shadowfiend
    .use 216746 << Warrior -- Handbook of Commanding Shout
    .use 226403 << Warrior -- Handbook of Meathook
    .use 216747 << Warlock -- Grimoire of Soul Harvesting
    .use 216748 << Warlock -- Grimoire of Portal of Summoning
    .use 403619 << Warlock -- Grimoire of Fel Armor
    .use 216764 << Druid -- Leaflet of Deeper Wilds
    .use 216767 << Druid -- Leaflet of Revive
    .use 216768 << Paladin -- Testament of Enhanced Blessings
    .use 226400 << Paladin -- Testament of the Exorcist
    .use 226398 << Paladin -- Testament of Martyrdom
    .use 216769 << Shaman -- Revelation of Totemic Projection
    .use 226402 << Shaman -- Revelation of Shamanistic Rage
    .use 216770 << Hunter -- Treatise on Aspect of the Viper
    .use 226401 << Hunter -- Treatise on the Heart of the Lion
    .use 216771 << Druid -- Leaflet of Enhanced Restoration
    .target Milton Sheaf << Alliance
    .target Zor Lonetree << Horde
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Druid SoD
#group RestedXP 符文书指南
#subgroup Boots
#name 捕虫符文
#displayname Wyvern Strike - 35 (Azeroth) << Hunter
#displayname Survival Instincts - 35 (Azeroth) << Druid
#title Wyvern Strike << Hunter
#title Survival Instincts << Druid

step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    .goto Swamp of Sorrows,25.140,54.034
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Amaryllis Webb|r
    >>|cRXP_BUY_Buy a|r |T133653:0|t[昆虫学入门套件]
    .collect 213565,1 --Entomology Starter Kit (1x)
    .target Amaryllis Webb
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    >>打开 |T133653:0|t[昆虫学入门套件]
    .use 213565
    .collect 213562,1 --Bug Catching Net (1x)
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #loop
    .goto Stranglethorn Vale,43.8,18.6,20,0
    .goto Stranglethorn Vale,45.2,19.6,20,0
    .goto Stranglethorn Vale,44.2,22.0,20,0
    .goto Stranglethorn Vale,45.6,23,0,20,0
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_on a|r |cRXP_ENEMY_Arbor 狼蛛|r
    >>|cRXP_WARN_它们被发现在树桩顶上|r
    .use 213562
    .collect 213566,1 --Arbor 狼蛛 Specimen (1x)
    .mob Arbor 狼蛛
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #loop
    .goto Arathi Highlands,54.0,38.6,0
    .goto Arathi Highlands,57.0,39.8,0
    .goto Arathi Highlands,59.6,57.0,0
    .goto Arathi Highlands,61.2,55.6,0
    .goto Arathi Highlands,54.0,38.6,20,0
    .goto Arathi Highlands,57.0,39.8,20,0
    .goto Arathi Highlands,59.6,57.0,20,0
    .goto Arathi Highlands,61.2,55.6,20,0
    .goto Arathi Highlands,62.6,56.0,20,0
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_on a|r |cRXP_ENEMY_Hay Weevil|r
    >>|cRXP_WARN_这些可以在任何农场找到，包括谷仓内|r
    .use 213562
    .collect 213568,1 --Hay Weevil Specimen (1x)
    .mob Hay Weevil
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #loop
    .goto Desolace,53.0,59.0,0
    .goto Desolace,50.0,55.8,30,0
    .goto Desolace,53.0,59.0,30,0
    .goto Desolace,54.0,62.6,30,0
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_on a|r |cRXP_ENEMY_Flesh Picker|r
    >>|cRXP_WARN_这些是在科多兽墓地发现的|r
    .use 213562
    .collect 213567,1 --Flesh Picker Specimen (1x)
    .mob Flesh Picker
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    .goto Swamp of Sorrows,25.140,54.034
    >>Talk to |cRXP_FRIENDLY_Amaryllis Webb|r to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Invigoration|r] << Hunter
    >>Talk to |cRXP_FRIENDLY_Amaryllis Webb|r to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Instinct|r] << Druid
    .collect 213125,1 << Hunter --Rune of Invigoration (1x)
    .collect 213119,1 << Druid --Rune of Instinct (1x)
    .skipgossip 217412,1
    .target Amaryllis Webb
step
    .train 416089 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_活力符文|r] |cRXP_WARN_训练|r |T135125:0|t[飞龙打击] << Hunter
    .train 410027 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_本能符文|r] |cRXP_WARN_进行训练|r |T132266:0|t[生存本能] << Druid
    .use 213125 << Hunter
    .use 213119 << Druid
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文书指南
#subgroup Extras
#subweight -1
#name 舒适睡袋 - 14
#title Cozy Sleeping Bag

step
    #optional
    +|cRXP_WARN_你必须至少达到 14 级才能开始|r |T133662:0|t[|cRXP_LOOT_舒适睡袋|r] 的任务
    .xp >14,1
step << Alliance
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step << Alliance
    .goto Westfall,37.413,50.701
    >>点击地面上的 |cRXP_PICK_Burned-Out Remains|r
    .accept 79008 >>接受......以及你找到的那张纸条
step << Alliance
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Alliance
    .goto The Barrens,46.361,73.904
    >>点击地面上的 |cRXP_PICK_Burned-Out Remains|r
    .turnin 79008 >>交出...和你找到的那张纸条
    .accept 79192 >>接受垫脚石
step << Horde
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Horde
    .goto The Barrens,46.361,73.904
    >>点击地面上的 |cRXP_PICK_Burned-Out Remains|r
    .accept 79007 >>接受......以及你找到的那张纸条
step << Horde
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step << Horde
    .goto Westfall,37.413,50.701
    >>点击地面上的 |cRXP_PICK_Burned-Out Remains|r
    .turnin 79007 >>交出...和你找到的那张纸条
    .accept 79192 >>接受垫脚石
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
step
    #completewith next
    .goto Stonetalon Mountains,50.29,52.94,25 >>沿着 Sun Rock Retreat 北边的土路向上走
step
    .goto Stonetalon Mountains,40.748,52.576
    >>点击盒子上的|cRXP_PICK_Pocket Litter|r
    .turnin 79192 >>交出垫脚石
    .accept 79980 >>接受争夺
step
    #completewith next
    .goto Stonetalon Mountains,40.19,50.80,15 >>沿着山间小路前行
step
    .goto Stonetalon Mountains,39.614,49.783
    >>点击地面上的 |cRXP_PICK_Mound of Dirt|r
    .turnin 79980 >>交出争夺
    .accept 79974 >>接受湿活
step
    #completewith next
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
step
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,49.4,12.9,8 >>|cRXP_WARN_登上洛克莫丹大坝的墙壁，小心地跳到大坝中心的壁架上。按照箭头指示|r
step
    .goto Loch Modan,49.421,12.917
    >>点击壁架上的 |cRXP_PICK_Carved Figurine|r
    .turnin 79974 >>交湿活
    .accept 79975 >>接受鹰拳
step
    #completewith next
    .goto Hillsbrad Foothills,87.691,48.166,10 >>前往阿拉希高地的索拉丁之墙/希尔斯布莱德丘陵区域边界
step
    #completewith next
    .goto Arathi Highlands,24.132,21.470,7 >>爬上车，沿着墙壁往上走
step
    .goto Arathi Highlands,22.466,24.127
    >>点击挂在墙上的 |cRXP_PICK_Messenger Bag|r
    .turnin 79975 >>交出鹰拳
    .accept 79976 >>接受“这一定是这个地方”
step
    .goto Arathi Highlands,22.466,24.127
    >>点击地面上的 |cRXP_PICK_Hastily Rolled-Up Satchel|r
    .turnin 79976 >>交出“此处必是吾家”
step
    +|cRXP_WARN_强烈建议您在使用|r |T134057:0|t[|cRXP_LOOT_Student Fodder|r] |cRXP_WARN_之前将其保存起来以备更高等级使用。每次使用|r |T134057:0|t[|cRXP_LOOT_Student Fodder|r] |cRXP_WARN_都会为您的角色增加 20% 的休息经验，因此在更高等级使用效率更高|r
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文书指南
#subgroup Helmet <<Druid/Shaman/Warrior
#subgroup Bracers <<Mage/Hunter/Paladin/Priest/Rogue/Warlock
#name 翡翠守卫符文
#displayname Molten Armor <<Mage
#displayname Gore <<Druid
#displayname T.N.T. <<Hunter
#displayname 强化愤怒之锤 <<Paladin
#displayname Void Zone <<Priest
#displayname Cut to the Chase <<Rogue
#displayname Burn <<Shaman
#displayname Unstable Affliction <<Warlock
#displayname Shield Mastery <<Warrior

step
    +|cRXP_WARN_前往下列任意区域。在每个相应区域的标记位置，您将找到来自新阵营的 NPC，|r |cRXP_FRIENDLY_翡翠守卫者|r。
    >>Duskwood
    >>Ashenvale
    >>Feralas
    >>The Hinterlands
    .zoneskip Duskwood
    .zoneskip Ashenvale
    .zoneskip Feralas
    .zoneskip The Hinterlands
step
    >>在标记位置寻找 |cRXP_FRIENDLY_The Emerald Wardens|r 的军需官并从他们那里购买符文
    .goto Duskwood,45.6,51.2,-1
    .goto Ashenvale,89.6,40.6,-1
    .goto Feralas,48.6,12.6,-1
    .goto The Hinterlands,61.4,34.6,-1
    .target Quartermaster Falinar
    .target Quartermaster Kyleen
    .target Quartermaster Valdane
    .target Quartermaster Alandra
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
step
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_Nihilist Epiphany|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空区域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明：熔岩护甲|r] |cRXP_WARN_训练|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r] |cRXP_WARN_训练|r |T136228:0|t[不稳定的痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r] |cRXP_WARN_进行训练|r |T135822:0|t[燃烧] << Shaman
    .train 410098 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护者符文|r] |cRXP_WARN_训练|r |T132359:0|t[盾牌精通] << Warrior
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_Alclarity 符文|r] |cRXP_WARN_进行训练|r |T236269:0|t[切入正题] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r] |cRXP_WARN_进行训练|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_血腥符文|r] |cRXP_WARN_进行训练|r |T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤之符文|r] |cRXP_WARN_训练|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221511 << Warrior --Rune of the Protector
    .use 221512 << Rogue --Rune of Alclarity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer

]])


RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文书指南
#subgroup Helmet <<Mage/Hunter/Paladin/Priest/Rogue/Warlock
#subgroup Bracers <<Druid/Shaman/Warrior
#name 野性献祭符文
#displayname Advanced Warding - 40 (Azeroth) <<Mage
#displayname Lock and Load - 40 (Azeroth) <<Hunter
#displayname Improved Sanctuary - 40 (Azeroth) <<Paladin
#displayname Divine Aegis - 40 (Azeroth) <<Priest
#displayname Combat Potency - 40 (Azeroth) <<Rogue
#displayname Riptide - 40 (Azeroth) <<Shaman
#displayname Vengeance - 40 (Azeroth) <<Warlock
#displayname Sword and Board - 40 (Azeroth) <<Warrior
#displayname 强化狂暴回复 - 40 (Azeroth) <<Druid

step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,51.6,82.0
    >>Talk to the |cRXP_FRIENDLY_Shadowtooth Emissary|r near the Emerald Sanctuary
    .accept 82043 >>接受狂野之神
    .target Shadowtooth Emissary
step
    #optional
    #completewith next
    .goto The Hinterlands,66.27,65.13,0
    >>|cRXP_WARN_为了完成此任务，您需要一个人携带|r |T134799:0|t|cRXP_LOOT_Wildwshiper Draught|r |cRXP_WARN_in 袋子。它由内陆金萨罗的精英巨魔掉落。只有当您的剃刀高地小队中没有人拥有它时才能获得它|r
    .collect 221261,1 --Wildwhisper Draught
step
    .goto The Barrens,45.5,92.4
    >>寻找剃刀高地的队伍。你需要清理通往最终首领 |cRXP_ENEMY_Amnennar the Coldbringer|r 的螺旋并杀死他。之后队伍中的一个人必须使用他们的 |T134799:0|t|cRXP_LOOT_Wildwshiper Draught|r 召唤幽灵 |cRXP_FRIENDLY_Spirit of Agamaggan|r。与他交谈以交出任务并接收后续任务
    .turnin 82043 >>交出荒野之神
    .accept 82044 >>接受狂野之神
    .target Spirit of Agamaggan
    .mob Amnennar the Coldbringer
    .use 221261
step
    >>您现在已收到 |T237378:0|t|cRXP_LOOT_阿迦玛甘的咆哮|r。此物品可在 |cRXP_PICK_黑石深渊|r、|cRXP_PICK_祖尔法拉克|r 和 |cRXP_PICK_玛拉顿|r 中的特定区域使用，以召唤新的 |cRXP_ENEMY_Delirious Ancient|r 首领，该首领在被击杀时总会掉落一个 |T132119:0|t|cRXP_LOOT_Wild Offering|r。收集其中 3 个即可完成任务。|T132119:0|t|cRXP_LOOT_Wild Offerings|r 也可用作货币，从 |cRXP_FRIENDLY_影牙使者|r 购买非常强大的物品，因此您可能想要为您的符文收集超过 3 个
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_祖尔法拉克|r |cRXP_WARN_杀死任意 3 个首领，你将能够生成一个|r |cRXP_ENEMY_Delirious Ancient|r |cRXP_WARN_靠近 Ghaz'rilla 池|r
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_Maraudon|r |cRXP_WARN_kill|r |cRXP_ENEMY_Princess Theradras|r |cRXP_WARN_你将能够在她的竞技场中生成|r |cRXP_ENEMY_Delirious Ancient|r |cRXP_WARN_|r
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_黑石深渊|r |cRXP_WARN_杀死|r |cRXP_ENEMY_高级审讯官格斯塔恩|r，|cRXP_ENEMY_猎犬大师格雷布玛|r |cRXP_WARN_并完成|r |cRXP_ENEMY_竞技场|r |cRXP_WARN_事件。之后你将能够在黑铁高速公路（通往巴尔加的道路）上生成|r |cRXP_ENEMY_疯狂古树|r |cRXP_WARN_|r
    >>|cRXP_WARN_提示：|r 祭品可以在突袭中收集，您可以反复运行同一个地下城。目前最快的方法是 |cRXP_WARN_加入 10 人突袭|r 并运行 |cRXP_WARN_重复玛拉顿公主或祖尔法拉克任务|r
    .complete 82044,1 --Wild Offering 3/3
    .use 221418
    .mob Delirious Ancient
step
    #optional
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,51.6,82.0
    >>Talk to the |cRXP_FRIENDLY_Shadowtooth Emissary|r near the Emerald Sanctuary
    .turnin 82044 >>交出荒野之神
    .target Shadowtooth Emissary
step
    .train 431650 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T237539:0|t[神圣之盾] << Priest
    .train 431461 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T132091:0|t[强化狂暴回复] << Druid
    .train 401754 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T135733:0|t[高级守护] << Mage
    .train 416085 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T236185:0|t[锁定并加载] << Hunter
    .train 429247 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T135925:0|t[改良庇护所] << Paladin
    .train 432293 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T135673:0|t[战斗力] << Rogue
    .train 410105 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T252995:0|t[激流] << Shaman
    .train 426470 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T236299:0|t[复仇] << Warlock
    .train 427082 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔山的智慧|r]你收到的物品|cRXP_WARN_进行训练|r |T236315:0|t[剑与盾] << Warrior
    .use 222962 --Hyjal's Wisdom
]])

RXPGuides.RegisterGuide([[
<<Warlock/Priest/Mage/Paladin
<< SoD
#classic
#group RestedXP 符文书指南
#subgroup Helmet <<Warlock
#subgroup Bracers <<Paladin/Priest/Mage
#name 魔晶符文
#displayname Displacement - 45 (Azeroth) <<Mage
#displayname 净化力量 - 45 (Azeroth) <<Paladin
#displayname Despair - 45 (Azeroth) <<Priest
#displayname Backdraft - 45 (Azeroth) <<Warlock

step
    #optional
    #completewith next
    >>|cRXP_WARN_为了找到这个符文，你需要获得 4|r |T134938:0|t|cRXP_LOOT_地理占卜卷轴|r |cRXP_WARN_并将其导入世界各个区域的四个地脉水晶中，以生成|r |cRXP_ENEMY_愤怒的地脉行者|r。|cRXP_WARN_或者，你可以与其他拥有卷轴的法师或拥有|r |T132842:0|t|cRXP_FRIENDLY_世界核心碎片的术士组队|r << Mage
    >>|cRXP_WARN_为了找到这个符文，你需要从你的|r |T236294:0|t[|cRXP_FRIENDLY_Explorer Imp|r] |cRXP_WARN_探险队获得 4|r |T132842:0|t|cRXP_FRIENDLY_Worldcore Fragments|r |cRXP_WARN_，并将其中的一个引导到世界各个区域的四个 Ley Crystals 中以生成|r |cRXP_ENEMY_Enraged Leywalkers|r。|cRXP_WARN_或者，你可以与其他拥有碎片的术士或拥有 |r |T134938:0|t|cRXP_LOOT_Scrolls of Geomancy 的法师组队|r << Warlock
    +|cRXP_WARN_为了找到这个符文，你需要与一名拥有|r |T132842:0|t|cRXP_FRIENDLY_Worldcore Fragments|r |cRXP_WARN_的术士或一名拥有|r |T134938:0|t|cRXP_LOOT_Scrolls of Geomancy|r |cRXP_WARN_的法师组队来召唤所需的怪物。你无法独自召唤它们|r << Priest/Paladin
    .collect 223171,4 << Mage
    .collect 223168,4 << Warlock

step
    >>前往地图上标记的每个魔力水晶，使用 |T134938:0|t|cRXP_LOOT_Scroll of Geomancy|r 对它们进行攻击，或者让队伍中的某个人这样做，召唤一个 |cRXP_ENEMY_Enraged Leywalker|r。击败它并掠夺其 |cRXP_LOOT_Leycryst|r。可以按任意顺序执行此操作 << Mage
    >>前往地图上标记的每个魔晶，使用 |T132842:0|t|cRXP_FRIENDLY_Worldcore Fragment|r 或让队伍中的某个人这样做，召唤一个 |cRXP_ENEMY_Enraged Leywalker|r。击败它并掠夺其 |cRXP_LOOT_Leycryst|r。可以按任意顺序执行此操作 << Warlock
    >>前往地图上标记的每个魔晶，让队伍中的术士或法师召唤一个 |cRXP_ENEMY_Enraged Leywalker|r。击败它并掠夺它的 |cRXP_LOOT_Leycryst|r。可以按任意顺序完成此操作 << Priest/Paladin
    .goto Azshara,22.0,79.0,-1
    .goto Feralas,57.0,60.0,-1
    .goto The Hinterlands,48.0,59.0,-1
    .goto Searing Gorge,55,65,-1
    .collect 221318,1 >>|T237193:0|t|cRXP_LOOT_Azshara 魔晶|r 来自 |cRXP_PICK_Azshara|r 靠近 孤寂山脊
    .collect 221317,1 >>|T237189:0|t|cRXP_LOOT_Feralas 魔晶|r 来自 |cRXP_PICK_Feralas|r 位于 高荒野
    .collect 221319,1 >>|T237192:0|t|cRXP_LOOT_黑石魔晶|r 来自南部|cRXP_PICK_灼热峡谷|r
    .collect 221320,1 >>|T237191:0|t|cRXP_LOOT_Hinterlands 魔晶|r 来自 |cRXP_PICK_The Hinterlands|r 祖尔祭坛以北
    .mob Enraged Leywalker
    .train 429309,1 << Mage
    .train 431745,1 << Warlock
    .train 429255,1 << Paladin
    .train 431673,1 << Priest
step
    .train 429309 >>|cRXP_WARN_使用你收集到的任意四个水晶将它们组合起来并学习|r |T132171:0|t[位移] << Mage
    .train 431745 >>|cRXP_WARN_使用你收集到的四个水晶中的任意一个来组合它们并学习|r |T236290:0|t[Backdraft] << Warlock
    .train 429255 >>|cRXP_WARN_使用你收集的四个水晶中的任意一个来组合它们并学习|r |T135950:0|t[净化力量] << Paladin
    .train 431673 >>|cRXP_WARN_使用你收集到的四个水晶中的任意一个来组合它们并学习|r |T237555:0|t[绝望] << Priest
    .use 221318 --Azshara Leycryst
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD/Priest SoD
#group RestedXP 符文书指南
#subgroup Helmet
#title Mental Dexterity << Shaman
#title Pain and Suffering << Priest
#name 精神敏捷 - 43（塔纳利斯） << Shaman
#name 痛苦与折磨 - 43（塔纳利斯） << Priest

-- Mental Dexterity/Pain and Suffering
-- PERMOK: Needs better waypoints

step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    #completewith next
    >>杀死 |cRXP_ENEMY_废土暗影法师s|r。掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_Coded Warlock Notes|r]
    .collect 221547,1
    .mob 废土暗影法师
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,59.8,24.0,35,0
    .goto Tanaris,65.6,32.2,35,0
    .goto Tanaris,62.4,33.2,30,0
    >>杀死 |cRXP_ENEMY_Wastewander Thieves|r。掠夺他们以获得 |T134329:0|t[|cRXP_LOOT_Wastewander Cipher|r]
    .collect 221549,1
    .mob Wastewander Thief
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,58.4,38.6,40,0
    .goto Tanaris,60.3,23.4,40,0
    .goto Tanaris,66.2,35.0,40,0
    >>杀死 |cRXP_ENEMY_废土暗影法师s|r。掠夺他们以获得 |T134939:0|t[|cRXP_LOOT_Coded Warlock Notes|r]
    .collect 221547,1
    .mob 废土暗影法师
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_使用|r |T134329:0|t[废土世界密码] |cRXP_WARN_接收|r |T237018:0|t[解密的术士笔记]
    .goto Tanaris,58.0,36.0
    .use 221549
    .collect 221545,1
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_站在|r“神秘的召唤卷轴”上。|cRXP_WARN_站在卷轴上时使用|r |T237018:0|t[解密的术士笔记] |cRXP_WARN_|r。
    >>杀死 |cRXP_ENEMY_Enraged Voidwalker|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of Mental Dexterity|r] << Shaman
    >>击杀 |cRXP_ENEMY_Enraged Voidwalker|r。拾取它以获得 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of Verdant Winter|r] << Priest
    .collect 220610,1 << Shaman
    .collect 221979,1 << Priest
step
    .itemcount 220610,1 << Shaman
    .itemcount 221979,1 << Priest
    .use 220610 << Shaman
    .use 221979 << Priest
    .train 416055 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_心灵敏捷符文|r] |cRXP_WARN_学习|r |T136055:0|t[心灵敏捷] << Shaman
    .train 415991 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_翠绿冬日的预言|r] |cRXP_WARN_来学习|r |T237567:0|t[痛苦与苦难] << Priest
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Hunter SoD/Rogue SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Ranged Weapon Specialization
#name 远程武器专精 - 58（东瘟疫之地）

step
    #completewith rangeSpec
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step << Horde
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取 |cRXP_FRIENDLY_Nathanos Blightcaller|r 旁边的红书。它在房子外面，门的左边。它包含 |T134419:0|t[|cRXP_FRIENDLY_Rune of Remoted Weapon Specialization|r]
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step << Alliance
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取 |cRXP_ENEMY_Nathanos Blightcaller|r 旁边的红书。它在房子外面，门的左边。它包含 |T134419:0|t[|cRXP_FRIENDLY_Rune of Remoted Weapon Specialization|r]
    >>|cRXP_WARN_如果附近有人，请他们将|r |cRXP_ENEMY_Nathanos Blightcaller|r |cRXP_WARN_拉开一会儿，以便你安全地掠夺符文|r
    >>|cRXP_WARN_如果附近没有人，你可以死于|r |cRXP_ENEMY_Nathanos|r |cRXP_WARN_，然后站在屋内并在他的视线之外重生。然后从屋内使用互动键或倾斜相机以便单击它来抢劫这本书|r << Warrior/Rogue
    >>|cRXP_WARN_如果附近没有人，请将您的宠物设置为|r |T136106:0|t[停留] |cRXP_WARN_与|r |cRXP_ENEMY_纳萨诺斯|r |cRXP_WARN_保持一定距离，然后发送宠物|r |T132152:0|t[攻击] |cRXP_WARN_命令以将他激怒到您的宠物身上。一旦他瞄准了您的宠物，请将您的宠物设置为|r |T132311:0|t[被动]，|cRXP_WARN_这将使您的宠物返回到停留位置。走到书旁边并使用|T132293:0|t[佯装死亡]放弃战斗并掠夺符文|r << Hunter
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step
    .train 453692 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r] |cRXP_WARN_学习|r |T135490:0|t[远程武器专精]
    .use 226410
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD/Paladin SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Holy Specialization
#name 神圣专长 - 60（东瘟疫之地）

step
    #completewith next
    >>|cRXP_WARN_获得此符文需要你在精英区域与怪物战斗。单人作战是可能的，但如果你的等级较低或装备不太好，请考虑找人帮你|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    >>|cRXP_WARN_如果您先完成该任务线，则可以同时获得此符文和|r |T135883:0|t[|cRXP_FRIENDLY_Binding Heal|r] |cRXP_WARN_。如果您希望同时获得两个符文，请转到|r |T135883:0|t[|cRXP_FRIENDLY_Binding Heal|r] |cRXP_WARN_符文指南|r << Priest
    .goto Eastern Plaguelands,77.5,81.7,50 >>前往提尔之手，|cRXP_WARN_请记住，这是一个精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_前往地图上标记的建筑物图书馆侧楼，寻找书架顶部的一本书。抢夺它以获取符文。请记住，你不能在战斗中抢夺它|r
    >>|cRXP_WARN_你可以清除房间里的所有怪物，或者死在书本旁边，然后在怪物视线之外的地方释放，这样就可以掠夺符文，而不必杀死任何东西|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    #completewith next
    .train 453702 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专长符文|r] 来训练 |T237537:0|t[神圣专长]
    .train 453702,1
    .itemcount 226418,1
    .use 226418
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD/Druid SoD/Hunter SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Arcane Specialization
#name 奥术专精 - 60（西瘟疫之地）

step
    #completewith next
    >>|cRXP_WARN_获得此符文需要你在精英区域与怪物战斗。单人作战是可能的，但如果你的等级较低或装备不太好，请考虑找人帮你|r
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,48.7,22.4,50 >>前往壁炉谷，|cRXP_WARN_请记住，这是一个精英区域|r
step
    .goto Western Plaguelands,47.3,13.6
    >>|cRXP_WARN_前往地图上标记的塔顶。寻找书架旁边角落里的一本红书，它由一名|r |cRXP_ENEMY_Scarlet Priest|r看守。|cRXP_WARN_Loot 它以获取符文|r
    .collect 226413,1 --Rune of Arcane Specialization
    .train 453702,1
step
    #completewith next
    .train 453695 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奥术专长符文|r] 来训练 |T132849:0|t[奥术专长]
    .train 453695,1
    .itemcount 226413,1
    .use 226413
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Paladin SoD/Warrior SoD/Shaman SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Axe Specialization
#name 斧头专精 - 58（燃烧平原）

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    .goto Burning Steppes,40.3,34.9,100 >>前往黑石要塞
step
    .goto Burning Steppes,39.9,34.1
    >>|cRXP_WARN_进入要塞，在地图上标记的位置找到一本红色的书。从中获取符文|r
    .collect 226407,1 --Rune of Axe Specialization
step
    #completewith next
    .train 453688 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Axe Specialization|r] 来训练 |T132394:0|t[Axe Specialization]
    .itemcount 226407,1
    .use 226407
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Druid SoD/Warrior SoD/Shaman SoD/Mage SoD/Priest SoD/Rogue SoD/Warlock SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Dagger Specialization
#name 匕首专精 - 60（希利苏斯）

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_希利苏斯|r
step
    .goto Silithus,20,85,50 >>前往区域南部，靠近安其拉大门的一顶帐篷
step
    .goto Silithus,20,85
    >>|cRXP_WARN_进入帐篷，在地图上标记的位置找到一本红色的书。从中获取符文|r
    .collect 226409,1 --Rune of Dagger Specialization
step
    #completewith next
    .train 453690 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Dagger Specialization|r] 来训练 |T135641:0|t[Dagger Specialization]
    .itemcount 226409,1
    .use 226409
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD/Warrior SoD/Shaman SoD/Rogue SoD/Warlock SoD/Paladin SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Defense Specialization
#name 防御专精-60（黑石山）

step
    #completewith next
    .zone 25 >>通过灼热峡谷或燃烧平原前往黑石山
step
    .goto 1415/0,-1232.500,-7612.600,20 >>前往熔岩之桥环的东侧，直到你找到一扇通往黑石塔下层的门
step
    .goto 1415/0,-1294.200,-7574.700,5 >>沿着小路走，进入你右边的第一个侧室。|cRXP_WARN_你可能必须杀死挡在你路上的精英怪物，因为你不能在战斗中掠夺这本书|r
step
    .goto 1415/0,-1302.100,-7583.400
    >>|cRXP_WARN_寻找这个房间地上的一本红色书籍。它可以出现在多个位置。抢夺它以获得符文|r
    .collect 226694,1 --Rune of Defense Specialization
step
    #completewith next
    .train 459313 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Defense Specialization|r] 来训练 |T134952:0|t[Defense Specialization]
    .itemcount 226694,1
    .use 226694
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Feral Combat Specialization
#name 野性战斗专长 - 60（冬泉谷）

step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .goto Winterspring,49.0,8.0,50 >>向北前往霜刃岩
step
    .goto Winterspring,49.0,8.0
    >>|cRXP_WARN_在标记位置寻找一本红色的书。它可能被两个 55-56 级的怪物守卫|r |cRXP_ENEMY_霜刃豹s|r |cRXP_WARN_Loot 它以获取符文|r
    .collect 226419,1 --Rune of Feral Combat Specialization
step
    #completewith next
    .train 453703 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Feral Combat Specialization|r] 来训练 |T132116:0|t[Feral Combat Specialization]
    .itemcount 226419,1
    .use 226419
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Mage SoD/Shaman SoD/Warlock SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Fire Specialization
#name 火焰专精 - 52（灼热峡谷）

step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
    .goto 1427/0,-1425.800,-6772.400,25 >>通过地图上标记的洞穴入口进入矿渣坑
step
    .goto 1427/0,-1306.900,-6642.800,25 >>过桥向北行驶
step
    .goto 1427/0,-1225.300,-6623.600
    >>|cRXP_WARN_在|r |cRXP_ENEMY_督军马托里乌斯|r后面的长凳上寻找一本红书。|cRXP_WARN_抢走它以获取符文。请记住，你不能在战斗中这样做|r
    >>|cRXP_WARN_如果你的等级较高，你可以不拉|r |cRXP_ENEMY_监工马托里乌斯|r |cRXP_WARN_如果你紧贴着他的阳台边缘，如果你做不到，试着叫别人在你抢劫书籍时把他拉开，或者杀死他和他的守卫|r
    >>|cRXP_WARN_作为猎人，你可以用你的宠物把他拉走，然后在书旁边施放|r |T132293:0|t[佯装死亡] |cRXP_WARN_，放弃战斗并抢劫它。确保你将督军拉到视线之外的地方，否则他可能会让你重新陷入战斗|r << Hunter
    .collect 226414,1 --Rune of Fire Specialization
step
    #completewith next
    .train 453696 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Fire Specialization|r] 来训练 |T132847:0|t[Fire Specialization]
    .itemcount 226414,1
    .use 226414
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Druid SoD/Shaman SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Fist Weapon Specialization
#name 拳套武器专精 - 60（希利苏斯）

step
    #completewith next
    .zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
    .goto 1427/0,-1225.300,-6623.600
    >>|cRXP_WARN_在标记的位置寻找一本红色的书。它被暮色笼罩，可能有点难看到|r
    .collect 226411,1 --Rune of Fist Weapon Specialization
step
    #completewith next
    .train 453691 >>使用 |T134419:0|t[|cRXP_FRIENDLY_拳套武器专长符文|r] 来训练 |T133832:0|t[拳套武器专长]
    .itemcount 226411,1
    .use 226411
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD/Hunter SoD/Shaman SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Frost Specialization
#name 冰霜专精 - 60（冬泉谷）

step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .goto Winterspring,59.0,59.0,50 >>向南前往枭兽营地
step
    .goto Winterspring,59.0,59.0
    >>|cRXP_WARN_在标记位置寻找一本红色的书。它可能被一对 57-58 级的守卫|r |cRXP_ENEMY_猫头鹰beasts|r |cRXP_WARN_Loot 它以获取符文|r
    .collect 226415,1 --Rune of Frost Specialization
step
    #completewith next
    .train 453697 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Frost Specialization|r] 来训练 |T132852:0|t[Frost Specialization]
    .itemcount 226415,1
    .use 226415
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD/Rogue SoD/Shaman SoD/Hunter SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Nature Specialization
#name 自然专长 - 56（费伍德森林）

step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,63.42,7.71,50 >>向北前往 Felpaw 村
step
    .goto Felwood,62.8,7.5
    >>|cRXP_WARN_在标记位置寻找一本红色的书。它位于 |r |cRXP_ENEMY_Chieftain Bloodmaw|r |cRXP_WARN_Loot 它以获取符文|r
    .collect 226416,1 --Rune of Nature Specialization
step
    #completewith next
    .train 453698 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Nature Specialization|r] 来训练 |T132848:0|t[Nature Specialization]
    .itemcount 226416,1
    .use 226416
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Rogue SoD/Shaman SoD/Paladin SoD/Priest SoD/Druid SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Mace Specialization
#name 钉头锤专精 - 60（湿地）

step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    .goto 1437/0,-3451.700,-3450.800,25 >>向东走到通往格瑞姆巴托的道路的起点
step
    .goto 1437/0,-3582.500,-4138.200,25 >>沿着这条路一直走到格瑞姆巴托。|cRXP_WARN_路上不要与任何红色龙战斗，这样你不用杀死任何一只就可以到达那里|r
step
     .goto 1437/0,-3451.900,-4052.500
    >>|cRXP_WARN_沿着小路前往格瑞姆巴托的大门。在入口右侧寻找一本红色的书。从中获取符文|r
    .collect 226408,1 --Rune of Mace Specialization
step
    #completewith next
    .train 453689 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Mace Specialization|r] 来训练 |T133038:0|t[Mace Specialization]
    .itemcount 226408,1
    .use 226408
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Warlock SoD/Shaman SoD/Mage SoD/Priest SoD/Druid SoD/Hunter SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Pole Weapon Specialization
#name 长柄武器专精 - 60（艾萨拉）

step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    .goto Azshara,76.43,43.95,100 >>前往阿科兰神庙
step
    .goto Azshara,76.88,44.24
    >>|cRXP_WARN_寻找寺庙内月亮井上的红书。掠夺它以获得符文|r
    .collect 226412,1 --Rune of Pole Weapon Specialization
step
    #completewith next
    .train 453694 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Pole Weapon Specialization|r] 来训练 |T135145:0|t[Pole Weapon Specialization]
    .itemcount 226412,1
    .use 226412
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD/Priest SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Shadow Specialization
#name 暗影专精 - 60（诅咒之地）

step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    .goto Blasted Lands,45.19,55.29,100 >>向南前往污秽之痕。|cRXP_WARN_你将不得不穿越一个精英区域，那里有许多对 CC 免疫的高等级怪物。你很可能不得不拼命奔跑才能到达符文位置|r
step
    .goto Blasted Lands,33.0,48.0
    >>|cRXP_WARN_寻找地图上标记的祭坛上的红书。抢夺它以获得符文|r
    .collect 226417,1 --Rune of Shadow Specialization
step
    #completewith next
    .train 453700 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shadow Specialization|r] 来训练 |T132851:0|t[Shadow Specialization]
    .itemcount 226417,1
    .use 226417
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Paladin SoD/Mage SoD/Warlock SoD
#group RestedXP 符文书指南
#subgroup 戒指
#title Sword Specialization
#name 剑术专精 - 60（逆风通道）

step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,47.40,75.50 >>向南前往卡拉赞
step
    .goto 1430/0,-2019.100,-11170.300,10 >>进入大师的地窖
step
    .goto Deadwind Pass,43.06,74.58
    >>|cRXP_WARN_进入洞穴区域，在地图上标记的位置寻找一本红色的书。从中获取符文|r
    .collect 226406,1 --Rune of Sword Specialization
step
    #completewith next
    .train 453635 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Sword Specialization|r] 来训练 |T132223:0|t[Sword Specialization]
    .itemcount 226406,1
    .use 226406
]])