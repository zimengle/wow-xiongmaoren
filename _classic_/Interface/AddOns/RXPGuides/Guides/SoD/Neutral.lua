local _,addon = ...
if addon.GetSeason() ~= 2 then return end
RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs << Warrior
#subgroup Chest << Hunter
#name 卡罗丁符文
#displayname 噬心狂怒 - 25 (湿地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 眼镜蛇屠夫 - 25 (湿地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter

step
    #season 2
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    #season 2
    #completewith next
    .goto Wetlands,51.914,62.692,30 >>进入瑟尔根岩洞
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
step
    #season 2
    .goto Wetlands,47.24,65.34
    >>击杀 |cRXP_ENEMY_Carrodin|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_吞噬狂暴符文|r] << Warrior
    >>击杀|cRXP_ENEMY_Carrodin|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_蛇杀手符文|r] << Hunter
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
    .train 410115 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_蛇杀手符文|r]|cRXP_WARN_进行训练|r|T136040:0|t[蛇杀手]
    .use 211205
    .itemcount 211205,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 毒化 - 25(希尔斯布莱德)
#displayname Envenom


    --Rune of Envenom

step
    #season 2
    #completewith next
	.goto Hillsbrad Foothills,76.72,46.22,60 >>前往敦霍尔德城堡
step
    #season 2
    .goto Hillsbrad Foothills,80.2,39.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克瑞斯·李盖斯|r交谈
    >>|cRXP_BUY_购买|r|T133469:0|t[热门提示]|cRXP_从她那里购买|r
    .collect 210330,1 --Hot Tip (1)
    .target Kris Legace
    .train 400102,1
step
    #season 2
    .use 210330 >>打开 |T133469:0|t[热门提示]
    .collect 210323,1 --Safe Combination (1)
    .collect 210329,1 --Hillsbrad Treasure Map (1)
    .train 400102,1
step
    #completewith next
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    #season 2
    .goto Western Plaguelands,59.4,84.5
    >>打开水中的|cRXP_PICK_生锈保险箱|r, 以获得|T134419:0|t[|cRXP_FRIENDLY_毒符文|r]
    .collect 210322,1 --Rune of Venom (1)
    .train 400102,1
step
    #season 2
    .train 400102 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毒药符文|r]
    .use 210322
    .itemcount 210322,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 割喉者 - 25(暮色森林)
#displayname Cutthroat

step
    #season 2
    .goto Duskwood,81.24,71.86
    >>在宁静花园墓地打开|cRXP_PICK_Offering Box|r, 获得一个 |T133343:0|t[|cRXP_LOOT_Engraved Silver Ring|r]
    .collect 210251,1 --Engraved Silver Ring (1)
    .train 424988,1
step
    #season 2
    .goto Duskwood,48.5,79.9
    >>对|cRXP_ENEMY_迪菲亚夜行者|r使用 |T133644:0|t[扒窃], 可获得 |T133345:0|t[|cRXP_LOOT_雕文金戒指|r]
    .collect 210250,1 --Engraved Gold Ring (1)
    .mob Defias Night Runner
    .train 424988,1
step
    #season 2
    #completewith next
    .goto Duskwood,19.9,44.6,60,0 >>前往乌鸦岭雕像
step
    #season 2
    .goto Duskwood,19.9,44.6
    .use 210250 >>装备两个戒指, 并在雕像前输入/kneel以获得 |T134419:0|t[|cRXP_FRIENDLY_震颤符文|r]
    .use 210251
    .collect 210252,1 --Rune of Shiving (1)
    .train 424988,1
step
    #season 2
    .train 424988 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 震颤符文|r] 来训练 |T236280:0|t[刀锋手]
    .use 210252
    .itemcount 210252,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 狂野打击 - 14(石爪山脉)
#displayname Wild Strikes

step << Druid
    .goto Stonetalon Mountains,80.2,90.6,60,0
    .goto Stonetalon Mountains,83.2,87.0,60,0
    .goto Stonetalon Mountains,71.6,86.6,60,0
    .goto Stonetalon Mountains,76.6,91.0,60,0
    .goto Stonetalon Mountains,80.2,90.6
    >>击杀|cRXP_ENEMY_Grimtotems|r. 击败后可拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob Grimtotem Mercenary
    .mob Grimtotem Brute
    .mob Grimtotem Sorcerer
    .mob Grimtotem Ruffian
    .train 410021,1
step << Druid
    .equip 18,210534 >>|cRXP_WARN_装备|r|T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1
step << Druid
    >>|cRXP_WARN_对10种不同的友方野兽施放|r|T136085:0|t[再生]|cRXP_WARN_或|r|T136041:0|t[治疗之触], 包括猎人宠物和熊形态的德鲁伊以及幽灵狼形态的萨满|r << Horde
    >>|cRXP_WARN_对10种不同的野兽施放|r|T136085:0|t[再生]|cRXP_WARN_或|r|T136041:0|t[治疗之触], 例如猎人宠物或德鲁伊的熊形态|r << Alliance
    .train 410021 >>|cRXP_WARN_使用|r|T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r] |cRXP_WARN_来训练|r|T132143:0|t[狂野打击]
    .itemcount 210534,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 星涌 - 25(湿地)
#displayname Starsurge

step << Druid
    #completewith next
    +|cRXP_WARN_在1级时可以完成此事, 但你将不得不多次死亡|r
    .train 424718,1
step << Druid
    .goto Wetlands,36.941,15.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grugimdern|r交谈
    >>|cRXP_WARN_他会给你一个|r|T134052:0|t[|cRXP_LOOT_泥沼菇|r]
    .collect 210499,1 -- Marshroom (1)
    .skipgossip
    .target Grugimdern
    .train 424718,1
step << Druid
    #completewith next
    .goto Wetlands,31.187,18.328
    .cast 426019 >>|cRXP_WARN_使用|r|T134052:0|t[|cRXP_LOOT_Marshroom|r]|cRXP_WARN_吃掉它|r
    .use 210499
    .train 424718,1
step << Druid
    .goto Wetlands,31.187,18.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vodyanoi|r交谈
    .collect 210500,1 -- Rune of the Stars (1)
    .skipgossip
    .target Vodyanoi
    .train 424718,1
step << Druid
    .train 424718 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_星之符文|r]|cRXP_WARN_来训练|r|T135730:0|t[星涌]
    .use 210500
    .itemcount 210500,1
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文与书籍指南
#subgroup Chest << Priest/Hunter/Druid/Warrior/Shaman
#subgroup Legs << Warlock/Paladin
#subgroup Gloves << Rogue
#subgroup Bracers << Mage
#name 格里兹比符文
#displayname 妙手回春 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Priest
#displayname 独来独往 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter
#displayname 适者生存 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Druid
#displayname 战争使者 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 双武器专精 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Shaman
#displayname 恶魔契约 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#displayname 神圣牺牲 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Paladin
#displayname 时光倒转 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Mage
#displayname 左右开弓 - 25 (贫瘠之地) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Rogue
#next 十字军打击 - 4(艾尔文森林) << Human Paladin
#next 十字军打击 - 4(丹莫罗) << Dwarf Paladin
#next 熔岩爆裂 - 25(希尔斯布莱德丘陵) << Shaman


<< SoD

step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地的棘齿城|r, |cRXP_WARN_你需要 3 金币来购买符文|r
step
    .goto The Barrens,61.8,39.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店中的|cRXP_FRIENDLY_Grizzby|r交谈
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r|T135791:0|t[|cRXP_FRIENDLY_和谐顿悟|r]|cRXP_WARN_来训练|r|T237549:0|t[意外收获] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r]|cRXP_WARN_来训练|r|T134596:0|t[雕纹长裤 - 神圣献祭] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:时光倒流|r]|cRXP_WARN_以训练|r|T237538:0|t[时光倒流] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_孤狼符文|r]|cRXP_WARN_来训练|r|T132266:0|t[孤狼] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_生存符文|r]|cRXP_WARN_来训练|r|T132126:0|t[适者生存] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_战争使者符文|r]|cRXP_WARN_用于训练|r|T236319:0|t[战争使者] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_契约符文|r]|cRXP_WARN_来学习|r|T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_钝刺符文|r]|cRXP_WARN_来训练|r|T237531:0|t[钝刺] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_双持专精符文|r]|cRXP_WARN_以训练|r|T132686:0|t[刻印胸甲 - 双持专精] << Shaman
    .target Grizzby
]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文与书籍指南
#subgroup Chest << Shaman/Rogue
#subgroup Legs << Mage/Warlock/Hunter
#subgroup Gloves << Paladin/Warrior/Priest/Druid
#name 伏击符文
#displayname 精神灼烧 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Priest
#displayname 毒蛇扩散 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter
#displayname 迎头痛击 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Druid
#displayname 鲁莽怒火 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 治疗之雨 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Shaman
#displayname 持久痛苦 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#displayname 光之信标 - 25(声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Paladin
#displayname 奥术涌动 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Mage
#displayname 只是皮肉伤 - 25 (声望) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Rogue
#next 神圣献祭 - 25(艾泽拉斯) << Paladin


<< SoD

--VV if (Reputation) name formatting removed, change in Paladin guide too

step
    >>外出寻找 |T132765:0|t[被伏击的补给]. 然后返回一座主城并交付它们. 如果你想更快提升声望, 可以前往拍卖行购买所需物品来升级补给
    *|cRXP_WARN_You can farm lower level mobs until you hit Friendly. Afterwards you have to farm high level mobs (>=17).|r Chests in the open world have a 90%+ 有几率掉落其中一件物品
    .reputation 2587,friendly << Horde
    .reputation 2586,friendly << Alliance
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_最近城市中的供应官|r交谈
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
    .train 415996 >>|cRXP_WARN_购买并使用|r|T135791:0|t[|cRXP_FRIENDLY_ 暗影启示|r]|cRXP_WARN_来训练|r|T237565:0|t[心灵灼烧] << Priest
    .train 409999 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_召唤之光符文|r]|cRXP_WARN_来训练|r|T236247:0|t[光之信标] << Paladin
    .train 425171 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术说明:奥术涌动|r] |cRXP_WARN_以训练|r |T135734:0|t[奥术涌动] << Mage
    .train 425760 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_蛇纹符文|r]|cRXP_WARN_来学习|r|T132209:0|t[蛇纹蔓延] << Hunter
    .train 416046 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_骷髅猛击符文|r]|cRXP_WARN_来学习|r|T133732:0|t[骷髅猛击] << Druid
    .train 416003 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_专注之怒符文|r]|cRXP_WARN_来学习|r|T134919:0|t[专注之怒] << Warrior
    .train 416008 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_永恒痛苦符文|r]|cRXP_WARN_来学习|r|T236296:0|t[永恒痛苦] << Warlock
    .train 400082 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_戏弄符文|r] |cRXP_WARN_来训练|r|T132284:0|t[只是皮肉伤] << Rogue
    .train 416057 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_治疗符文|r] |cRXP_WARN_来学习|r|T136107:0|t[治疗之雨] << Shaman
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
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 野性生长 - 25(多个区域)
#displayname Wild Growth

step << Druid
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step << Druid
    .goto Ashenvale,86.963,43.159
    >>点击|cRXP_PICK_Owl Statue|r开始事件
    >>|cRXP_WARN_你需要击败3波怪物, 每波2只, 这些怪物的等级在23至25级之间|r
    >>|cRXP_WARN_确保|cRXP_FRIENDLY_Summoned Wisp|r不死亡. 它无法被治疗, 但会在每波之间自动回满血量|r
    >>击败所有波次后, 拾取地面上的|cRXP_PICK_幽灵之礼|r
    .collect 210044,1 -- Symbol of the First Owl (1)
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
    .aura 424310 >>点击|cRXP_PICK_Owl Statue|r获取 |T132150:0|t[猫头鹰之眼] 增益
    .train 410028,1
step << Druid
    .goto Duskwood,45.13,58.26
    #completewith next
    +离开暮光林地
    .subzoneskip 856,1
    .train 410028,1
step << Druid
    .goto Duskwood,65.2,34.8,65,0
    .goto Duskwood,60.6,25.8,65,0
    .goto Duskwood,66.0,23.6,65,0
    .goto Duskwood,68.0,31.6,65,0
    .goto Duskwood,65.2,34.8
    >>击杀|cRXP_ENEMY_Agon|r. 击败后拾取其战利品, 获得|cRXP_LOOT_第二只猫头鹰的符号|r
    >>|cRXP_ENEMY_阿贡|r|cRXP_WARN_patrols 稍微巡逻一番|r
    >>|cRXP_WARN_你必须拥有|r|T132150:0|t[猫头鹰之眼]|cRXP_WARN_buff 才能看见|r|cRXP_ENEMY_Agon|r
    .collect 210043,2 -- Symbol of the Second Owl (1)
    .train 410028,1
step << Druid
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,36.914,76.142
    .goto Hillsbrad Foothills,54.424,82.016,0
    +点击|cRXP_PICK_Twin Owl Statue|r获取 |T237178:0|t[双头猫头鹰光环] buff
    >>|cRXP_WARN_你有1分40秒的时间赶到另一个小岛, 并点击另一个|r|cRXP_PICK_双/owl雕像|r
    >>|cRXP_WARN_请确保使用|r|T132112:0|t[水栖形态]
    >>|cRXP_WARN_另一个岛屿已在你的地图上标记|r
    .aura 424181
    .aura 424182
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,54.424,82.016
    >>游到另一个岛屿. 在1分40秒内点击|cRXP_PICK_双头猫头鹰雕像|r
    >>|cRXP_WARN_请确保使用|r|T132112:0|t[水栖形态]
    >>|cRXP_WARN_如果你失败并失去增益效果, 请点击这个|cRXP_PICK_Twin Owl Statue|r, 并返回你刚刚离开的岛屿|r
    .collect 210026,3 -- Symbol of the Third Owl (1)
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .accept 78229 >>接任务: |cRXP_WARN_猫头鹰试炼|r
    .turnin 78229 >>交任务: |cRXP_FRIENDLY_猫头鹰试炼|r
    .target Loganaar
    .train 410028,1
step << Druid
    .train 410028 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_野性成长符文|r]|cRXP_WARN_来训练|r|T236153:0|t[野性成长]
    .use 210137
    .itemcount 210137,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Mage SoD
#group RestedXP 符文与书籍指南
#subgroup Chest << Warrior
#subgroup Legs << Mage
#name 暮色森林巫妖符文
#displayname 狂热鞭笞 - 25 (暮色森林) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 群体回复 - 25 (暮色森林) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Mage


step << Warrior/Mage
    #completewith next
    .goto Duskwood,23.630,34.888,15 >>进入东北方的墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,26.115,30.863
    >>打开|cRXP_PICK_Dusty Coffer|r. 搜索其中获得 |T252996:0|t[|cRXP_LOOT_Decrepit Phylactery|r]
    .collect 210568,1 -- Decrepit Phylactery (1)
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,15.602,38.621,15 >>离开此墓穴, 向西进入地下墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,18.140,37.940
    .cast 426182 >>点击小王座上的|cRXP_PICK_Slumbering Bones|r
    >>|cRXP_WARN_这将召唤一个25级精英|r|cRXP_ENEMY_Awakened 巫妖|r
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,18.140,37.940
    >>击杀|cRXP_ENEMY_Awakened Lich|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_鞭笞符文|r] << Warrior
    >>击杀|cRXP_ENEMY_Awakened 巫妖|r. 击败后拾取其掉落的 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 大规模再生|r] << Mage
    >>|cRXP_WARN_如果其他人正在击杀|cRXP_ENEMY_Awakened Lich|r, 你也可以协助他们, 依然能获得战利品|r
    .collect 210569,1 << Warrior -- Rune of Flagellation (1)
    .collect 211514,1 << Mage -- Spell Notes: Mass Regeneration (1)
    .mob Awakened Lich
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior
    .train 416050 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_鞭笞符文|r] |cRXP_WARN_来训练|r |T133495:0|t[鞭笞]
    .use 210569
    .itemcount 210569,1
    .train 403480,1
step << Mage
    .train 416050 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术笔记:群体再生|r]|cRXP_WARN_进行训练|r|T132870:0|t[群体再生]
    .use 211514
    .itemcount 211514,1
    .train 415939,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 狂怒打击 - 25(多个区域)
#displayname Raging Blow

step << Warrior
    #completewith next
    .goto Wetlands,49.40,16.98
    .subzone 205 >>前往湿地的丹莫德
    .train 425444,1
step << Warrior
    .goto Wetlands,46.92,17.53,15,0
    .goto Wetlands,46.553,18.369
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_黑铁企业家|r交谈
    >>|cRXP_WARN_你可能需要多次跑尸才能到达他|r
    >>|cRXP_BUY_购买 a|r|T135130:0|t[屠龙长矛]|cRXP_BUY_it, 花费 75 银币|r
    .collect 209874,1,78134,1 -- Dragonslayer's Lance (1)
    .target Dark Iron Entrepreneur
    .train 425444,1
step << Warrior
    #completewith next
    .goto Redridge Mountains,69.928,55.814
    .subzone 2099 >>前往赤脊山脉的石堡要塞
    .train 425444,1
step << Warrior
    .goto Redridge Mountains,69.928,55.814
    >>点击|cRXP_PICK_壁挂盾牌|r. 拾取它以获得|cRXP_LOOT_屠龙者之盾|r
    >>|cRXP_WARN_这是在主城堡二楼, 位于26级精英|cRXP_ENEMY_Gath'Ilzogg|r身后|r
    >>|cRXP_WARN_你需要击杀|cRXP_ENEMY_Gath'Ilzogg|r, 或者让他被其他玩家吸引仇恨, 才能拾取该物品. 进入前请确保已组好队伍|r
    .collect 209873,1,78133,1 -- Dragonslayer's Shield (1)
    .train 425444,1
step << Warrior
    #completewith next
    .subzone 209,2 >>组队进入影牙城堡
step << Warrior
    >>打开|cRXP_PICK_Discarded Helm|r, 拾取它以获得|cRXP_LOOT_Dragonslayer's Helm|r
    >>|cRXP_WARN_这是在指挥官斯普林瓦尔身后长椅上找到的|r
    .collect 209872,1,78132,1 -- Dragonslayer's Helm (1)
    .train 425444,1
step << Warrior
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .accept 78132 >>接任务: |cRXP_WARN_屠龙者的头盔|r
    .accept 78134 >>接任务: |cRXP_WARN_屠龙者之矛|r
    .accept 78133 >>接任务: |cRXP_WARN_屠龙者之盾|r
    .turnin 78132 >>交任务: |cRXP_FRIENDLY_屠龙者的头盔|r
    .turnin 78134 >>交任务: |cRXP_FRIENDLY_屠龙者之矛|r
    .turnin 78133 >>交任务: |cRXP_FRIENDLY_屠龙者之盾|r
    .target Alonso
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .accept 78144 >>接受屠龙者阿隆索
    .target Alonso
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.029,68.999
    >>击杀|cRXP_ENEMY_绿龙幼龙|r
    .complete 78144,1 -- Accompany Alonso to slay the dragon.
    .target Alonso
    .mob Green Dragon Whelp
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.053,69.187
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .turnin 78144 >>交予屠龙者阿隆索
    .target Alonso
    .train 425444,1
step << Warrior
    .train 425444 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_怒击符文|r]|cRXP_WARN_来学习|r|T132215:0|t[怒击]
    .use 210015
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 灵魂之力 - 22(灰谷)
#displayname Strength of Soul

step << Priest
    .goto Ashenvale,32.0,43.0,65,0
    .goto Ashenvale,33.6,38.8,65,0
    .goto Ashenvale,37.6,34.0
    >>击杀蓟皮图腾师和蓟皮萨满祭司. 从他们身上搜刮出[T135736:0] [原始洞察]
    .collect 211534,1 -- Primal Insight (1)
    .mob Thistlefur Totemic
    .mob Thistlefur Shaman
    .train 415997,1
step << Priest
    .goto Ashenvale,38.002,29.528,40,0
    .goto Ashenvale,37.938,27.958,30,0
    .goto Ashenvale,38.819,27.160,30,0
    .goto Ashenvale,38.804,26.558
    >>|cRXP_WARN_爬上洞穴入口旁的巨树, 然后仔细跟随箭头指示前进|r
    .use 211534 >>|cRXP_WARN_当你靠近树上的两个捕梦网时, 使用|r|T135736:0|t[原始洞察]|cRXP_WARN_来触发|r|T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r
    .collect 211531,1 -- Prophecy of Seven Visitors (1)
    .train 415997,1
step << Priest
    >>你现在必须获得两个 |T135934:0|t|T136057:0|t[冥想]效果 << Alliance
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果 << Horde
    >>你必须在以下任一地点内下跪:北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须在以下地点之一内下跪:月亮井, 例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须在任何墓地/跪下 << Undead
    >>你必须在任意一个洛阿祭坛前下跪, 例如森金村的祭坛或贫瘠之地十字路口的祭坛 << Troll
    >>为了获得第二个 |T135934:0|t|T136057:0|t[冥想] 增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前 /kneel(下跪), 且该牧师必须在目标锁定你的情况下执行 /pray(祈祷)指令 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想]增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想]的牧师面前 /跪下, 且该牧师必须在目标锁定你的情况下执行 /祈祷 << Horde
    .train 415997 >>|cRXP_WARN_一旦你同时拥有|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r|cRXP_WARN_来学习|r|T135911:0|t[灵魂之力] << Alliance
    .train 415997 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_七位访客的预言]|r|cRXP_WARN_来学习|r|T135911:0|t[灵魂之力] << Horde
    .use 211531
    .itemcount 211531,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#name 真言术：屏障 - 22(赤脊山)
#displayname Power Word: Barrier

step << Priest
    #completewith next
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .train 425213,1
step << Priest
    .goto Redridge Mountains,67.2,53.6
    .goto Redridge Mountains,68.8,57.4
    >>击杀|cRXP_ENEMY_黑石暗影法师|r. 击杀后搜刮他们, 获得 |T135975:0|t[|cRXP_FRIENDLY_被奴役之城的预言|r]
    >>|cRXP_ENEMY_黑石暗影法师|r|cRXP_WARN_是22-23级精英怪. 建议组队挑战|r
    .collect 211530,1 -- Prophecy of a City Enthralled (1)
    .mob Blackrock Shadowcaster
    .train 425213,1
step << Priest
    >>你现在必须获得两个 |T135934:0|t|T136057:0|t[冥想]效果 << Alliance
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果 << Horde
    >>你必须在以下任一地点内下跪:北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须在以下地点之一内下跪:月亮井, 例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须在任何墓地/跪下 << Undead
    >>你必须在任意一个洛阿祭坛前下跪, 例如森金村的祭坛或贫瘠之地十字路口的祭坛 << Troll
    >>为了获得第二个 |T135934:0|t|T136057:0|t[冥想] 增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前 /kneel(下跪), 且该牧师必须在目标锁定你的情况下执行 /pray(祈祷)指令 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想]增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想]的牧师面前 /跪下, 且该牧师必须在目标锁定你的情况下执行 /祈祷 << Horde
    .train 425213 >>|cRXP_WARN_一旦你同时拥有|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益效果, 使用|r |T135975:0|t[|cRXP_FRIENDLY_被迷惑之城的预言|r] |cRXP_WARN_来学习|r |T253400:0|t[真言术：垒] << Alliance
    .train 425213 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_被迷惑之城的预言|r]|cRXP_WARN_来学习|r|T253400:0|t[真言术：垒] << Horde
    .use 211530
    .itemcount 211530,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 治疗之环 - 25(暮色森林)
#displayname Circle of Healing

step << Priest
    .goto Duskwood,50.4,70.8,60,0
    .goto Duskwood,50.2,76.4
    >>击杀|cRXP_ENEMY_迪菲亚夜行者|r和|cRXP_ENEMY_迪菲亚夜贼|r和|cRXP_ENEMY_迪菲亚附魔师|r, 击败后可拾取|T135736:0|t[|cRXP_LOOT_暗影洞察|r]
    .collect 211528,1 -- Dark Insight (1)
    .mob Defias Night Runner
    .mob Defias Night Blade
    .mob Defias Night Enchanter
    .train 402859,1
step << Priest
    .goto Duskwood,91.11,30.58
    .use 211528 >>|cRXP_WARN_使用|r|T135736:0|t[|cRXP_LOOT_暗影洞察|r]|cRXP_WARN_在塔后隐秘墓地处获取|r|T135975:0|t[|cRXP_FRIENDLY_千灯预言|r]
    .collect 211490,1 -- Prophecy of a Thousand Lights (1)
    .train 402859,1
step << Priest
    >>你现在必须获得两个 |T135934:0|t|T136057:0|t[冥想]效果 << Alliance
    >>你现在必须获得两个 |T237569:0|t|T136077:0|t[冥想]效果 << Horde
    >>你必须在以下任一地点内下跪:北郡修道院和暴风城大教堂和安威玛尔的圣光祭坛和洛克莫丹或铁炉堡的神秘区 << Human/Dwarf
    >>你必须在以下地点之一内下跪:月亮井, 例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须在任何墓地/跪下 << Undead
    >>你必须在任意一个洛阿祭坛前下跪, 例如森金村的祭坛或贫瘠之地十字路口的祭坛 << Troll
    >>为了获得第二个 |T135934:0|t|T136057:0|t[冥想] 增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想] 的牧师面前 /kneel(下跪), 且该牧师必须在目标锁定你的情况下执行 /pray(祈祷)指令 << Alliance
    >>为了获得你的第二个 |T237569:0|t|T136077:0|t[冥想]增益, 你需要在一位拥有不同 |T135934:0|t|T136057:0|t[冥想]的牧师面前 /跪下, 且该牧师必须在目标锁定你的情况下执行 /祈祷 << Horde
    .train 402859 >>|cRXP_WARN_一旦你同时拥有|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_千灯预言]|r|cRXP_WARN_来学习|r|T135887:0|t[治疗之环] << Alliance
    .train 402859 >>|cRXP_WARN_一旦你同时拥有|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益效果, 使用|r|T135975:0|t[|cRXP_FRIENDLY_千灯预言]|r|cRXP_WARN_来学习|r|T135887:0|t[治疗之环] << Horde
    .use 211490
    .itemcount 211490,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 眼镜蛇突袭 - 25(希尔斯布莱德丘陵)
#displayname Cobra Strikes


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
    >>寻找|cRXP_FRIENDLY_吉克希尔|r. 他在塔伦米尔和南海镇之间巡逻. 从他那里购买 |T134041:0|t[淡水鲈鱼诱饵]
    .collect 210410,1 --Freshwater Snapper Bait (1)
    .target Zixil
    .train 425759,1
step
    #season 2
    .goto Hillsbrad Foothills,61.05,33.36
    .use 210410 >>在池塘中央的船上使用 |T134041:0|t[淡水鲈鱼诱饵]
    >>击杀生成的|r|cRXP_ENEMY_Koartul|r(25级精英)后, 从他身上获取|r|T134419:0|t[|cRXP_FRIENDLY_毒蛇打击符文|r]
    .collect 210596,1 --Rune of Cobra Strikes (1)
    .mob Koartul
    .train 425759,1
step
    #season 2
    .train 425759 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_蛇击符文|r]|cRXP_WARN_来训练|r|T236177:0|t[蛇击]
    .use 210596
    .itemcount 210596,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 杀戮射击 - 25(多个区域)
#displayname Kill Shot

step
    #completewith WyvernWrangling
    >>|cRXP_BUY_从拍卖行购买|r|T135144:0|t[强效魔法杖]|r
    .collect 11288,1 --Greater Magic Wand (1)
    .train 410111,1
step
    #season 2
    #completewith next
    +|cRXP_WARN_开始组队前往哀嚎洞穴|r
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
    >>击杀|cRXP_ENEMY_吞噬者穆坦努斯|r. 击败他后可获得 |T132775:0|t[|cRXP_LOOT_催眠水晶|r]
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
    >>击杀|cRXP_ENEMY_蓟皮萨满祭司|r. 击败他们后可获得|T237004:0|t[|cRXP_LOOT_狂野魔法精华|r ]
    .collect 209841,1 --Wild Magic Essence (1)
    .mob Thistlefur Shaman
    .train 410111,1
step
    #season 2
    .use 209841 >>使用 |T237004:0|t[|cRXP_LOOT_狂野魔力精华|r] 制作 |T237489:0|t[|cRXP_LOOT_扭曲的狂野魔力法杖|r]
    .collect 209840,1 --Gnarled Wand of Wild Magic (1)
    .train 410111,1
step
    #season 2
    #completewith WyvernWrangling
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
step
    #season 2
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与石爪山脉的|cRXP_FRIENDLY_Jixo Madrocket|r交谈
    .accept 78114 >>接任务: |cRXP_WARN_驯服野生双足飞龙|r
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    #label WyvernWrangling
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jixo Madrocket|r交谈
    .turnin 78114 >>交任务: |cRXP_FRIENDLY_驯服野生双足飞龙|r
    .accept 78121 >>接受任务“驯服一只野生飞龙”
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    .goto Stonetalon Mountains,60.70,62.33
    >>跟随|cRXP_FRIENDLY_Jixo Madrocket|r, 观看他驯服一只|cRXP_ENEMY_双足飞龙|r
    .turnin 78121 >>提交驯服狂野双足飞龙任务
    .target Jixo Madrocket
    .train 410111,1
step
    #season 2
    .train 410111 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r]|cRXP_WARN_进行训练|r|T236174:0|t[杀戮射击]
    .use 209852
    .itemcount 209852,1


]])

RXPGuides.RegisterGuide([[
#classic
#group RestedXP 符文与书籍指南
<< SoD
#subgroup Chest << Shaman
#subgroup Belt << Warrior/Hunter/Mage/Paladin
#subgroup Boots << Warlock/Priest/Rogue/Druid
#name 暗骑符文
#displayname 救赎者之魂 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Priest
#displayname 近战专家 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter
#displayname 丛林之王 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Druid
#displayname 精准猛击 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 双手精通 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Shaman
#displayname 恶魔知识 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#displayname 圣光灌注 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Paladin
#displayname 飞弹连射 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Mage
#displayname 埋伏 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Rogue

step
    #completewith Sigil
    +|cRXP_WARN_在尝试获取此符文前, 强烈建议组队前往. 你需要总共击杀7次等级为41的精英怪物|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dalaran Agent|r交谈以获得|T338784:0|t[|cRXP_FRIENDLY_Ariden's Sigil|r]
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
    .equip 13 >>|cRXP_WARN_Equip|r|T338784:0|t[|cRXP_FRIENDLY_艾瑞登的印记|r]
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216945,<1
step
    #completewith next
    .goto Deadwind Pass,45.04,28.88
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_暗骑|r. 从他身上搜刮|cRXP_LOOT_达拉然奇珍|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216948,<1
step
    #completewith next
    .goto Swamp of Sorrows,69,28
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_暗骑|r. 从他身上搜刮|cRXP_LOOT_达拉然奇物|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216946,<1
step
    #completewith next
    .goto Duskwood,23,47
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_暗骑|r, 击败他后搜刮出|cRXP_LOOT_闪耀的达拉然遗物|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216951,<1
step
    #completewith next
    .goto Badlands,58,54
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀 |cRXP_ENEMY_暗骑|r. 击败他后搜刮出 |cRXP_LOOT_滑溜的达拉然遗物|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216947,<1
step
    #completewith next
    .goto Arathi Highlands,60,40
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_暗骑|r. 从他身上搜刮|cRXP_LOOT_嗡鸣的达拉然遗物|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216949,<1
step
    #completewith next
    .goto The Barrens,52,36
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_Dark Rider|r. 击败后搜刮出|cRXP_LOOT_Heavy Dalaran Relic|r
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
    .aura 438288 >>|cRXP_WARN_前往箭头标记的位置. 当你接近时, 将触发|r|T237534:0|t[黑暗存在]|cRXP_WARN_buff|r
    >>|cRXP_WARN_你必须下马才能获得增益效果！|r
    >>|cRXP_WARN_确保你已装备|r|T338784:0|t[|cRXP_FRIENDLY_阿瑞登的印记|r]|cRXP_WARN_已装备|r
    .use 216941
    .itemcount 216950,<1
step
    #completewith next
    .goto Desolace,65,25
    .cast 438305 >>|cRXP_WARN_使用|r|T338784:0|t[|cRXP_FRIENDLY_阿里登的印记|r]|cRXP_WARN_来揭示|r|cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_暗骑|r. 从他身上搜刮|cRXP_LOOT_达拉然诡异遗物|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达拉然代理人|r交谈
    .turnin 80147 >>上交奇异的达拉然遗物
    .turnin 80149 >>上交奇异的达拉然遗物
    .turnin 80098 >>上交奇异的达拉然遗物
    .turnin 80152 >>上交奇异的达拉然遗物
    .turnin 80148 >>上交奇异的达拉然遗物
    .turnin 80150 >>上交奇异的达拉然遗物
    .turnin 80151 >>上交奇异的达拉然遗物
    .turnin 80120 >>提交对达拉然的服务
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
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T135791:0|t[|cRXP_FRIENDLY_光辉顿悟|r] << Priest
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_注入符文|r] << Paladin
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:导弹齐射|r] << Mage
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_近战符文|r] << Hunter
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获取 |T134419:0|t[|cRXP_FRIENDLY_丛林之王符文|r] << Druid
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_无情精准符文|r] << Warrior
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_禁断知识符文|r] << Warlock
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_攻击者符文|r] << Rogue
    >>打开 |T133666:0|t[|cRXP_FRIENDLY_补给袋|r] 以获得 |T134419:0|t[|cRXP_FRIENDLY_双手大师符文|r] << Shaman
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
    .train 425312 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_光明启示|r]|cRXP_WARN_来训练|r|T132864:0|t[救赎者之灵] << Priest
    .train 426180 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_灌注符文|r]|cRXP_WARN_来训练|r|T236254:0|t[光之灌注] << Paladin
    .train 401763 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 技能说明:导弹弹幕|r]|cRXP_WARN_进行训练|r|T236221:0|t[导弹弹幕] << Mage
    .train 416086 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_近战符文|r]|cRXP_WARN_来训练|r|T132394:0|t[近战专精] << Hunter
    .train 424765 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_丛林之王符文|r]|cRXP_WARN_来训练|r|T236159:0|t[丛林之王] << Druid
    .train 416005 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_无情精准符文|r]|cRXP_WARN_来训练|r|T134377:0|t[精确时机] << Warrior
    .train 416014 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_禁断的知识符文|r] |cRXP_WARN_进行训练|r|T136172:0|t[恶魔知识] << Warlock
    .train 415926 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_袭击者符文|r]|cRXP_WARN_来训练|r|T236286:0|t[伏击] << Rogue
    .train 436368 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_双手精通符文|r]|cRXP_WARN_来训练|r|T135145:0|t[双手精通] << Shaman
]])

RXPGuides.RegisterGuide([[

#classic
<< SoD
#group RestedXP 符文与书籍指南
#subgroup Belt << Druid/Priest/Rogue/Warlock
#subgroup Boots << Mage/Shaman/Hunter/Paladin/Warrior
#name 凄凉之地链符文
#displayname 心灵尖刺 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Priest
#displayname 陷阱发射器 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter
#displayname 日月之蚀 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Druid
#displayname 狂怒回复 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warrior
#displayname 先祖复苏 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Shaman
#displayname 影与焰 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Warlock
#displayname 战争艺术 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Paladin
#displayname 冰冷智慧 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Mage
#displayname 剧毒之刃 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Rogue

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
    .accept 79229 >>接任务: |cRXP_WARN_高岭越货案|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bibbly F'utzbuckle|r交谈
    .goto Desolace,62.314,38.965
    .turnin 79229 >>交任务: |cRXP_FRIENDLY_高岭越货案|r
    .accept 79235 >>接任务: |cRXP_WARN_逍遥法外|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tokal|r交谈
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79235 >>交任务: |cRXP_FRIENDLY_逍遥法外|r
    .accept 79236 >>接任务: |cRXP_WARN_你有故事我有酒|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼克拉克斯·菲拉莫格|r交谈
    >>|cRXP_BUY_购买|r |T132790:0|t[樱桃酒]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tokal|r交谈
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79236 >>交任务: |cRXP_FRIENDLY_你有故事我有酒|r
    .accept 79242 >>接任务: |cRXP_WARN_盗岂有道|r
    .target Tokal
step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    .goto Wetlands,58.320,6.927
    .cast 6477 >>进入水域中的|cRXP_PICK_Rowboat|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Illari Duskfeather|r交谈, 以获得|cRXP_LOOT_Illari's Key|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Illari Duskfeather|r交谈. 之后你将不得不与她战斗
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
    >>击杀|cRXP_ENEMY_Illari 暮羽|r. 打开她掉落的|cRXP_PICK_Dropped 袋子|r. 从中获取|cRXP_LOOT_伊莉亚的钥匙|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Illari Duskfeather|r 交谈
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
    >>点击地面上的|cRXP_PICK_Illari's Loot Cache|r
    .goto Arathi Highlands,94.154,69.266
    .turnin 79242 >>交任务: |cRXP_FRIENDLY_盗岂有道|r
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
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获取 |T135791:0|t[|cRXP_FRIENDLY_Psychosophic Epiphany|r] << Priest
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Warfare|r] << Paladin
    >>打开 |T133876:0|t[|cRXP_LOOT_Jewel-Encrusted Box|r] 获取 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Brain Freeze|r] << Mage
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_猎人符文|r] << Hunter
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的箱子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_蚀日符文|r] << Druid
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的箱子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_治疗符文|r] << Warrior
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的箱子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_燃烧黑暗符文|r] << Warlock
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的箱子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_毒刃符文|r] << Rogue
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r] 获取 |T134419:0|t[|cRXP_FRIENDLY_祖先觉醒符文|r] << Shaman
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
    .train 431663 >>|cRXP_WARN_使用|r|T135791:0|t[|cRXP_FRIENDLY_ 心理顿悟|r]|cRXP_WARN_来训练|r|T136181:0|t[心灵尖刺] << Priest
    .train 416031 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_战争符文|r] |cRXP_WARN_来训练|r|T236246:0|t[战争的艺术] << Paladin
    .train 401752 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术笔记:冰冻头脑|r]|cRXP_WARN_来训练|r|T236206:0|t[冰冻头脑] << Mage
    .train 410118 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_猎人符文|r]|cRXP_WARN_来训练|r|T133882:0|t[陷阱发射器] << Hunter
    .train 410029 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_蚀之符文|r]|cRXP_WARN_来训练|r|T236151:0|t[蚀] << Druid
    .train 403467 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_治疗符文|r] |cRXP_WARN_来训练|r|T132345:0|t[狂暴再生] << Warrior
    .train 426452 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧黑暗符文|r]|cRXP_WARN_来训练|r|T135823:0|t[暗影与火焰] << Warlock
    .train 425102 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毒刃符文|r]|cRXP_WARN_来训练|r|T236270:0|t[毒刃匕首] << Rogue
    .train 425883 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_祖先觉醒符文|r]|cRXP_WARN_来训练|r|T237571:0|t[祖先觉醒] << Shaman
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
    .cast 6477 >>进入水中的|cRXP_PICK_Rowboat|r返回阿拉希
    .subzoneskip 308,1
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文与书籍指南
#subgroup 法术书
#name 符文法术书

#displayname 智慧延展  (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Mage
#displayname 智慧延展 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Mage
#displayname Expanded Intellect << Mage
#displayname 蝰蛇守护/雄狮之心 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Hunter
#displayname 蝰蛇守护/雄狮之心 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Hunter
#displayname Aspect of the Viper/Heart of the Lion << Hunter
#displayname 灵魂收割/召唤传送门/邪甲术 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Warlock
#displayname 灵魂收割/召唤传送门/邪甲术 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Warlock
#displayname Soul Harvesting/Portal of Summoning/Fel Armor << Warlock
#displayname 转嫁/玄秘毒药/迟钝药膏/解离毒药/萎缩药膏 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Rogue
#displayname 转嫁/玄秘毒药/迟钝药膏/解离毒药/萎缩药膏 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Rogue
#displayname Redirect/Occult Poison/Numbing Poison/Sebacious Poison/Atrophic Poison << Rogue
#displayname 暗影魔/强化坚韧 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Priest
#displayname 暗影魔/强化坚韧 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Priest
#displayname Shadowfiend/Increased Fortitude << Priest
#displayname 强化恢复/复活/野性深远 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Druid
#displayname 强化恢复/复活/野性深远 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Druid
#displayname Enhanced Restoration/Revive/Deeper Wilds << Druid
#displayname 命令怒吼/肉钩 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Alliance Warrior
#displayname 命令怒吼/肉钩 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Horde Warrior
#displayname Commanding Shout/Meathook << Warrior
#displayname 
驱邪术/强化祝福 (暴风城) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Paladin
#displayname Testament of the Exorcist/Enhanced Blessings << Paladin
#displayname 图腾投掷/萨满之怒 (奥格瑞玛) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Shaman
#displayname Totemic Projection/Shamanistic Rage << Shaman

step
    #completewith BuyBook
    >>|cRXP_WARN_现在可以用金币在暴风城购买技能书, 而无需再去血色修道院获取|r << Alliance
    >>|cRXP_WARN_现在可以用金币在奥格瑞玛购买技能书, 而无需再去血色修道院获取|r << Horde
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐尔·孤树|r交谈 << Horde
    >>|cRXP_WARN_注意:|T133736:0|t|cRXP_LOOT_[扩展智力之书]|r需要等级25才能使用|r << Mage
    >>|cRXP_WARN_注意:|T133733:0|t|cRXP_LOOT_[灵魂收割之书]|r和 |T133733:0|t|cRXP_LOOT_[召唤传送门之书]|r需要等级达到25级才能使用|r << Warlock
    >>|cRXP_WARN_注意:|T133733:0|t|cRXP_LOOT_[魔甲典籍]|r需要 50 级才能使用|r << Warlock
    >>|cRXP_WARN_注意:|T133745:0|t|cRXP_LOOT_[驱魔人的证言]|r和 |T133745:0|t|cRXP_LOOT_[殉道者的证言]|r需要等级达到 10 才能使用|r << Paladin
    >>|cRXP_WARN_注意:|T133745:0|t|cRXP_LOOT_[增强祝福的誓约]|r需要等级25才能使用|r << Paladin
    >>|cRXP_WARN_注意:|T133739:0|t|cRXP_LOOT_[狮心论]|r需要等级10才能使用|r << Hunter
    >>|cRXP_WARN_注意:|T133739:0|t|cRXP_LOOT_[毒蛇之相论著]|r需要25级才能使用|r << Hunter
    >>|cRXP_WARN_注意:|T133735:0|t|cRXP_LOOT_[重定向手册]|r需要达到 25 级才能使用|r << Rogue
    >>|cRXP_WARN_注意:|T133735:0|t|cRXP_LOOT_[神秘毒药手册]|r需要等级54才能使用|r << Rogue
    >>|cRXP_WARN_注意:|T133735:0|t|cRXP_LOOT_[麻木毒药手册]|r和|cRXP_LOOT_[脂溢毒药手册]|r和|cRXP_LOOT_[萎缩毒药手册]|r需要等级 60 才能使用|r << Rogue
    >>|cRXP_WARN_注意:|T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r和 |T237162:0|t|cRXP_LOOT_[坚韧之卷轴]|r需要等级 25 才能使用|r << Priest
    >>|cRXP_WARN_注意:|T134914:0|t|cRXP_LOOT_[更深荒野传单]|r|cRXP_WARN_, |r|T134914:0|t|cRXP_LOOT_[增强恢复传单]|r|cRXP_WARN_和 |T134914:0|t|cRXP_LOOT_[复活传单]|r需要等级25才能使用|r << Druid   
    >>|cRXP_WARN_注意:|T133741:0|t|cRXP_LOOT_[指挥之吼手册]|r需要等级25才能使用|r << Warrior
    >>|cRXP_WARN_注意:|T133741:0|t|cRXP_LOOT_[肉钩手册]|r需要达到 40 级才能使用|r << Warrior
    >>|cRXP_WARN_注意:|T133747:0|t|cRXP_LOOT_[萨满之怒启示]|r需要等级10才能使用|r << Shaman
    >>|cRXP_WARN_注意:|T133747:0|t|cRXP_LOOT_[图腾投影启示]|r需要等级25才能使用|r << Shaman
    .train 438040 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[重定向手册]|r|cRXP_WARN_来学习|r|T135425:0|t[重定向] << Rogue
    .train 458822 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[秘术毒药手册]|r|cRXP_WARN_来学习|r|T135935:0|t[秘术毒药 I] << Rogue
    .train 438040 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[麻痹毒药手册]|r|cRXP_WARN_来学习|r|T132098:0|t[麻痹毒药] << Rogue
    .train 439500 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[毒药手册]|r|cRXP_WARN_以学习|r|T132108:0|t[剧毒之毒] << Rogue
    .train 438040 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[萎缩毒药手册]|r|cRXP_WARN_来学习|r|T132100:0|t[萎缩毒药] << Rogue
    .train 436949 >>|cRXP_WARN_购买并使用|r|T133736:0|t|cRXP_LOOT_[扩展智力之书]|r|cRXP_WARN_来学习|r|T236513:0|t[扩展智力] << Mage
    .train 436956 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[更深处的荒野]手册|r|cRXP_WARN_来学习|r|T132124:0|t[更深处的荒野] << Druid
    .train 417123 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[增强恢复卷轴]|r|cRXP_WARN_学习|r|T136073:0|t[增强恢复] << Druid
    .train 437138 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[复活传单]|r|cRXP_WARN_来学习|r|T132132:0|t[复活] << Druid
    .train 409580 >>|cRXP_WARN_购买并使用|r|T133739:0|t|cRXP_LOOT_[狮子之心论文]|r|cRXP_WARN_来学习|r|T132185:0|t[狮子之心] << Hunter
    .train 415423 >>|cRXP_WARN_购买并使用|r|T133739:0|t|cRXP_LOOT_[蛇相论典]|r|cRXP_WARN_以学习|r|T132160:0|t[蛇相] << Hunter
    .train 415076 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[驱魔师的证言]|r|cRXP_WARN_以学习|r|T135956:0|t[驱魔师] << Paladin
    .train 407798 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[殉难证明]|r|cRXP_WARN_来学习|r|T135961:0|t[殉难印记] << Paladin
    .train 435984 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[强化祝福的证物]|r|cRXP_WARN_学习|r|T236248:0|t[强化祝福] << Paladin
    .train 401977 >>|cRXP_WARN_购买并使用|r|T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r|cRXP_WARN_来学习|r|T136199:0|t[暗影魔] << Priest
    .train 436951 >>|cRXP_WARN_购买并使用|r|T237162:0|t|cRXP_LOOT_[坚韧增强卷轴]|r|cRXP_WARN_以学习|r|T237543:0|t[坚韧增强] << Priest
    .train 437032 >>|cRXP_WARN_购买并使用|r|T133733:0|t|cRXP_LOOT_[灵魂收割魔典]|r|cRXP_WARN_以学习|r|T132851:0|t[灵魂收割] << Warlock
    .train 437169 >>|cRXP_WARN_购买并使用|r|T133733:0|t|cRXP_LOOT_[召唤之门魔典]|r|cRXP_WARN_学习|r|T134423:0|t[召唤之门] << Warlock
    .train 403619 >>|cRXP_WARN_购买并使用|r|T133733:0|t|cRXP_LOOT_[邪能护甲秘典]|r|cRXP_WARN_来学习|r|T136156:0|t[邪能护甲] << Warlock
    .train 403215 >>|cRXP_WARN_购买并使用|r|T133741:0|t|cRXP_LOOT_[指挥怒吼手册]|r|cRXP_WARN_以学习|r|T132351:0|t[指挥怒吼] << Warrior
    .train 403228 >>|cRXP_WARN_购买并使用|r|T133741:0|t|cRXP_LOOT_[肉钩手册]|r|cRXP_WARN_来学习|r|T132507:0|t[肉钩] << Warrior
    .train 425336 >>|cRXP_WARN_购买并使用|r|T133747:0|t|cRXP_LOOT_[萨满之怒启示]|r|cRXP_WARN_来学习|r|T136088:0|t[萨满之怒] << Shaman
    .train 437009 >>|cRXP_WARN_购买并使用|r|T133747:0|t|cRXP_LOOT_[图腾投影启示]|r|cRXP_WARN_来学习|r|T310733:0|t[图腾投影] << Shaman
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
#group RestedXP 符文与书籍指南
#subgroup Boots
#name 捉虫者符文
#displayname 翼龙打击 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Hunter
#displayname 生存本能 - 35 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Druid


step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Swamp of Sorrows >>前往: |cRXP_PICK_悲伤沼泽|r
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    .goto Swamp of Sorrows,25.140,54.034
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛丽莉丝·韦布|r交谈
    >>|cRXP_BUY_购买一个|r|T133653:0|t[昆虫学入门套装]
    .collect 213565,1 --Entomology Starter Kit (1x)
    .target Amaryllis Webb
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    >>打开 |T133653:0|t[昆虫学入门工具包]
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
    >>|cRXP_WARN_使用|r|T134325:0|t[捕虫网]|cRXP_WARN_在|r|cRXP_ENEMY_树狼蛛|r
    >>|cRXP_WARN_它们出现在树桩顶部|r
    .use 213562
    .collect 213566,1 --Arbor Tarantula Specimen (1x)
    .mob Arbor Tarantula
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
    >>|cRXP_WARN_使用|r|T134325:0|t[捕虫网]|cRXP_WARN_对|r|cRXP_ENEMY_海维尔|r
    >>|cRXP_WARN_这些物品可在任何农场找到, 包括谷仓内部|r
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
    >>|cRXP_WARN_使用|r|T134325:0|t[捕虫网]|cRXP_WARN_在|r|cRXP_ENEMY_肉食采集者|r
    >>|cRXP_WARN_这些物品位于科多兽墓地|r
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
    >>与|cRXP_FRIENDLY_阿玛丽莉丝·韦布|r交谈, 以获得|r|t[|cRXP_FRIENDLY_充能符文|r] << Hunter
    >>与|cRXP_FRIENDLY_阿玛丽莉丝·韦布|r交谈, 以获得|r|T134419:0|t[|cRXP_FRIENDLY_本能符文|r] << Druid
    .collect 213125,1 << Hunter --Rune of Invigoration (1x)
    .collect 213119,1 << Druid --Rune of Instinct (1x)
    .skipgossip 217412,1
    .target Amaryllis Webb
step
    .train 416089 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_活力符文|r]|cRXP_WARN_来训练|r|T135125:0|t[飞龙打击] << Hunter
    .train 410027 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_本能符文|r]|cRXP_WARN_来训练|r|T132266:0|t[生存本能] << Druid
    .use 213125 << Hunter
    .use 213119 << Druid
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文与书籍指南
#subgroup 额外内容
#subweight -1
#name 暖和睡袋 - 14
#displayname 舒适的睡袋 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    +|cRXP_WARN_你必须至少达到14级才能开始|r|T133662:0|t[|cRXP_LOOT_舒适睡袋|r] 的任务
    .xp >14,1
step << Alliance
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step << Alliance
    .goto Westfall,37.413,50.701
    >>点击地面上的|cRXP_PICK_Burned-Out Remains|r
    .accept 79008 >>接任务: |cRXP_WARN_……你所找到的纸条|r
step << Alliance
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Alliance
    .goto The Barrens,46.361,73.904
    >>点击地面上的|cRXP_PICK_Burned-Out Remains|r
    .turnin 79008 >>交任务: |cRXP_FRIENDLY_……你所找到的纸条|r
    .accept 79192 >>接受踏脚石
step << Horde
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Horde
    .goto The Barrens,46.361,73.904
    >>点击地面上的|cRXP_PICK_Burned-Out Remains|r
    .accept 79007 >>接任务: |cRXP_WARN_……你所找到的纸条|r
step << Horde
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step << Horde
    .goto Westfall,37.413,50.701
    >>点击地面上的|cRXP_PICK_Burned-Out Remains|r
    .turnin 79007 >>交任务: |cRXP_FRIENDLY_……你所找到的纸条|r
    .accept 79192 >>接受踏脚石
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
step
    #completewith next
    .goto Stonetalon Mountains,50.29,52.94,25 >>沿着烈日石居以北的土路向北前行
step
    .goto Stonetalon Mountains,40.748,52.576
    >>点击箱子上的|cRXP_PICK_Pocket Litter|r
    .turnin 79192 >>交还《踏脚石》
    .accept 79980 >>接受任务“混乱争夺”
step
    #completewith next
    .goto Stonetalon Mountains,40.19,50.80,15 >>沿着山路前行
step
    .goto Stonetalon Mountains,39.614,49.783
    >>点击地面上的|cRXP_PICK_泥土堆|r
    .turnin 79980 >>提交乱码任务
    .accept 79974 >>接受湿活任务
step
    #completewith next
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
step
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,49.4,12.9,8 >>|cRXP_WARN_前往洛克莫丹大坝的坝墙, 小心地跳到大坝中央的 ledge 上. 跟随箭头指示前进|r
step
    .goto Loch Modan,49.421,12.917
    >>点击突出处的|cRXP_PICK_Carved Figurine|r
    .turnin 79974 >>提交湿活
    .accept 79975 >>接受鹰拳任务
step
    #completewith next
    .goto Hillsbrad Foothills,87.691,48.166,10 >>前往阿拉希高地与希尔斯布莱德丘陵区域交界处的索拉丁之墙
step
    #completewith next
    .goto Arathi Highlands,24.132,21.470,7 >>爬上手推车, 沿着墙壁向上攀爬
step
    .goto Arathi Highlands,22.466,24.127
    >>点击挂在墙上的|cRXP_PICK_Messenger Bag|r
    .turnin 79975 >>提交鹰拳
    .accept 79976 >>接受任务:“这一定是这个地方”
step
    .goto Arathi Highlands,22.466,24.127
    >>点击地面上的|cRXP_PICK_Hastily Rolled-Up Satchel|r
    .turnin 79976 >>交出“此地必是吾家”
step
    +|cRXP_WARN_强烈建议您在消耗|r|T134057:0|t[|cRXP_LOOT_Student Fodder|r]|cRXP_WARN_之前将其保存, 留待更高等级时使用. 每次使用|r|T134057:0|t[|cRXP_LOOT_Student Fodder|r]|cRXP_WARN_都会为角色增加20%的休息经验, 因此在更高等级时使用效率更高|r
]])

RXPGuides.RegisterGuide([[
#classic
<< SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔 <<Druid/Shaman/Warrior
#subgroup Bracers <<Mage/Hunter/Paladin/Priest/Rogue/Warlock
#name 翡翠守卫符文
#displayname 熔岩护甲 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Mage
#displayname Gore <<Druid
#displayname T.N.T. \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Hunter
#displayname 强化愤怒之锤 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Paladin
#displayname Void Zone <<Priest
#displayname 穷追猛砍 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Rogue
#displayname Burn <<Shaman
#displayname 痛苦无常 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Warlock
#displayname 盾牌精通 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Warrior

step
    +|cRXP_WARN_前往以下任意区域. 在每个区域的指定位置, 你将遇到一名来自新阵营——翡翠守卫者——的NPC|r|cRXP_FRIENDLY_翡翠守卫者|r
    >>Duskwood
    >>Ashenvale
    >>Feralas
    >>The Hinterlands
    .zoneskip Duskwood
    .zoneskip Ashenvale
    .zoneskip Feralas
    .zoneskip The Hinterlands
step
    >>在标记位置寻找|cRXP_FRIENDLY_翡翠守卫|r的军需官, 并向他们购买你的符文
    .goto Duskwood,45.6,51.2,-1
    .goto Ashenvale,89.6,40.6,-1
    .goto Feralas,48.6,12.6,-1
    .goto The Hinterlands,61.4,34.6,-1
    .target Quartermaster Falinar
    .target Quartermaster Kyleen
    .target Quartermaster Valdane
    .target Quartermaster Alandra
    .collect 221480,1 << Mage --Spell Notes: 熔岩护甲
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
step
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_无政府主义顿悟|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空地带] << Priest
    .train 429308 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:熔岩护甲|r]|cRXP_WARN_来训练|r|T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_来训练|r|T136228:0|t[不稳定痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_进行训练|r|T135822:0|t[燃烧] << Shaman
    .train 410098 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_守护者符文|r]|cRXP_WARN_来学习|r|T132359:0|t[盾牌专精] << Warrior
    .train 432297 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_阿尔克拉里塔符文|r]|cRXP_WARN_来训练|r|T236269:0|t[直截了当] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r]|cRXP_WARN_来训练|r|T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_鲜血符文|r]|cRXP_WARN_来训练|r|T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_锤之符文|r]|cRXP_WARN_来训练|r|T236262:0|t[增强版怒锤] << Paladin
    .use 221480 << Mage -- Spell Notes: 熔岩护甲
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
#group RestedXP 符文与书籍指南
#subgroup 头盔 <<Mage/Hunter/Paladin/Priest/Rogue/Warlock
#subgroup Bracers <<Druid/Shaman/Warrior
#name 野性献祭符文
#displayname 进阶结界 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Mage
#displayname 荷枪实弹 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Hunter
#displayname 强化庇护 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Paladin
#displayname 神圣庇护 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Priest
#displayname 作战潜能 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Rogue
#displayname 激流 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Shaman
#displayname 复仇 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Warlock
#displayname 剑盾猛攻 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Warrior
#displayname 强化狂暴回复 - 40 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Druid

step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,51.6,82.0
    >>与翡翠圣所附近的|cRXP_FRIENDLY_影牙使者|r交谈
    .accept 82043 >>接任务: |cRXP_WARN_荒野之神|r
    .target Shadowtooth Emissary
step
    #optional
    #completewith next
    .goto The Hinterlands,66.27,65.13,0
    >>|cRXP_WARN_要完成此任务, 你需要一名队员携带一个|r|T134799:0|t|cRXP_LOOT_狂野水手药剂|r|cRXP_WARN_在背包中. 该物品由荒野之地金塔阿洛尔区域的精英巨魔掉落. 只有当你的剃刀高地队伍中无人拥有此物品时, 才去获取它|r
    .collect 221261,1 --Wildwhisper Draught
step
    .goto The Barrens,45.5,92.4
    >>寻找一支队伍前往剃刀高地. 你需要清理通往最终首领寒冰之王亚门纳尔的螺旋通道并击败他. 之后, 队伍中的一名成员需使用手中的 |T134799:0|t|cRXP_LOOT_野猪酒|r召唤出幽灵形态的阿迦玛甘之魂 . 与之对话以提交任务并获取后续任务
    .turnin 82043 >>交任务: |cRXP_FRIENDLY_荒野之神|r
    .accept 82044 >>接任务: |cRXP_WARN_荒野之神|r
    .target Spirit of Agamaggan
    .mob Amnennar the Coldbringer
    .use 221261
step
    >>你现已获得一个 |T237378:0|t|cRXP_LOOT_阿迦玛甘的咆哮|r. 此物品可在 |cRXP_PICK_黑石深渊|r和|cRXP_PICK_祖尔法拉克|r 和 |cRXP_PICK_玛拉顿|r 的特定区域使用, 召唤出新的 |cRXP_ENEMY_狂乱古巨兽|r 首领, 该首领击杀后必定掉落一个 |T132119:0|t|cRXP_LOOT_野性献礼|r. 收集 3 个即可完成任务. |T132119:0|t|cRXP_LOOT_野性献礼|r 同时也是货币, 可用于从 |cRXP_FRIENDLY_影牙使者|r 处兑换极其强大的装备, 因此建议你采集超过 3 个以备后续用途
    >>|cRXP_WARN_在|r|cRXP_FRIENDLY_祖尔法拉克|r|cRXP_WARN_击杀任意3个首领后, 你将能够生成一个|r|cRXP_ENEMY_疯狂的古生物|r|cRXP_WARN_出现在Ghaz'rilla池附近|r
    >>|cRXP_WARN_在|r|cRXP_FRIENDLY_玛拉顿|r|cRXP_WARN_击杀|r|cRXP_ENEMY_瑟莱德丝公主|r|cRXP_WARN_后, 你将能够在她的竞技场中召唤出|r|cRXP_ENEMY_疯狂的远古者|r|cRXP_WARN_|r
    >>|cRXP_WARN_在|r|cRXP_FRIENDLY_黑石深渊|r|cRXP_WARN_击杀|r|cRXP_ENEMY_高级审讯官格斯塔恩|r, |cRXP_ENEMY_驯犬者格雷布玛尔|r|cRXP_WARN_并完成|r|cRXP_ENEMY_竞技场|r|cRXP_WARN_事件后, 你将能够在|r|cRXP_ENEMY_暗铁公路(通往巴尔加的道路)|r上刷新|r|cRXP_ENEMY_狂乱古树|r|r
    >>|cRXP_WARN_提示:|r祭品可以在团队副本中收集, 你可以反复刷同一个地下城. 目前最快的方法是|cRXP_WARN_加入一个10人团队副本|r, 并运行|cRXP_WARN_重复玛拉顿公主或祖尔法拉克|r地下城|r
    .complete 82044,1 --Wild Offering 3/3
    .use 221418
    .mob Delirious Ancient
step
    #optional
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,51.6,82.0
    >>与翡翠圣所附近的|cRXP_FRIENDLY_影牙使者|r交谈
    .turnin 82044 >>交任务: |cRXP_FRIENDLY_荒野之神|r
    .target Shadowtooth Emissary
step
    .train 431650 >>|cRXP_WARN_使用|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]物品, 你获得该物品用于训练|r |T237539:0|t[神圣庇护] << Priest
    .train 431461 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]你获得的物品|cRXP_WARN_进行训练|r|T132091:0|t[增强狂暴回复] << Druid
    .train 401754 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]物品, 你获得的用于训练|r|T135733:0|t[高级守护] << Mage
    .train 416085 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]你获得的物品|cRXP_WARN_用于训练|r|T236185:0|t[锁定并加载] << Hunter
    .train 429247 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]你获得的物品, |cRXP_WARN_用于训练|r|T135925:0|t[增强庇护所] << Paladin
    .train 432293 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]物品, 你获得的用于训练|r|T135673:0|t[战斗强化] << Rogue
    .train 410105 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]你获得的物品, 用于训练|r|T252995:0|t[激流] << Shaman
    .train 426470 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]物品, 用于训练|r|T236299:0|t[复仇] << Warlock
    .train 427082 >>|cRXP_WARN_使用|r|T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r]你获得的物品|cRXP_WARN_来训练|r|T236315:0|t[剑与盾] << Warrior
    .use 222962 --Hyjal's Wisdom
]])

RXPGuides.RegisterGuide([[
<<Warlock/Priest/Mage/Paladin
<< SoD
#classic
#group RestedXP 符文与书籍指南
#subgroup 头盔 <<Warlock
#subgroup Bracers <<Paladin/Priest/Mage
#name 莱晶符文
#displayname 闪回 - 45 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Mage
#displayname 净化之力 - 45 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Paladin
#displayname 绝望 - 45 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Priest
#displayname 爆燃 - 45 (艾泽拉斯) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r <<Warlock

step
    #optional
    #completewith next
    >>|cRXP_WARN_为了找到这个符文, 你需要获得 4|r|T134938:0|t|cRXP_LOOT_地脉卷轴|r|cRXP_WARN_并将其引导至世界各区域的四个地脉水晶中, 以召唤出|r|cRXP_ENEMY_狂怒的地脉行者|r. |cRXP_WARN_或者, 你可以与其他拥有地脉卷轴的法师或持有|r|T132842:0|t|cRXP_FRIENDLY_世界核心碎片|r的术士组队|r << Mage
    >>|cRXP_WARN_为了找到这个符文, 你需要从|r|T236294:0|t[|cRXP_FRIENDLY_探索者小鬼|r]|cRXP_WARN_探险任务中获取 4|r|T132842:0|t|cRXP_FRIENDLY_世界核心碎片|r|cRXP_WARN_, 并将其中一块碎片引导至世界各区域的四个莱晶石中, 以召唤出|r|cRXP_ENEMY_狂怒莱行者|r. |cRXP_WARN_或者, 你可以与其他拥有该碎片的术士组队, 或与持有|r|T134938:0|t|cRXP_LOOT_几何魔法卷轴|r的法师组队|r << Warlock
    +|cRXP_WARN_要找到这个符文, 你需要组队与一名拥有|r|T132842:0|t|cRXP_FRIENDLY_Worldcore Fragments|r|cRXP_WARN_的术士或一名拥有|r|T134938:0|t|cRXP_LOOT_卷轴|r|cRXP_WARN_的法师, 一起召唤所需的怪物. 你无法独自召唤它们|r << Priest/Paladin
    .collect 223171,4 << Mage
    .collect 223168,4 << Warlock

step
    >>前往地图上标记的每个魔力水晶, 使用你的|T134938:0|t|cRXP_LOOT_几何卷轴|r对它们施放, 或让队伍中的其他玩家执行此操作, 以召唤出一个|cRXP_ENEMY_狂怒魔力行者|r. 击败它后, 即可获得其掉落的|cRXP_LOOT_魔力水晶|r. 此任务可按任意顺序完成 << Mage
    >>前往地图上标记的每个莱晶石, 使用你的|T132842:0|t|cRXP_FRIENDLY_Worldcore Fragment|r, 或让队伍中的其他玩家使用它, 召唤出一个|cRXP_ENEMY_Enraged Leywalker|r. 击败它后即可获得其掉落的|cRXP_LOOT_Leycryst|r. 此任务可按任意顺序完成 << Warlock
    >>前往地图上标记的每个魔晶, 让队伍中的术士或法师召唤一个|cRXP_ENEMY_Enraged Leywalker|r. 击败它并获取其掉落的|cRXP_LOOT_Leycryst|r. 此任务可按任意顺序完成 << Priest/Paladin
    .goto Azshara,22.0,79.0,-1
    .goto Feralas,57.0,60.0,-1
    .goto The Hinterlands,48.0,59.0,-1
    .goto Searing Gorge,55,65,-1
    .collect 221318,1 >>|T237193:0|t|cRXP_LOOT_艾萨拉魔晶|r来自 |cRXP_PICK_艾萨拉|r位于荒芜山脊附近
    .collect 221317,1 >>|T237189:0|t|cRXP_LOOT_菲拉斯魔晶|r来自 |cRXP_PICK_菲拉斯|r的高原荒野
    .collect 221319,1 >>|T237192:0|t|cRXP_LOOT_黑石莱晶|r来自南部的|cRXP_PICK_灼热峡谷|r
    .collect 221320,1 >>|T237191:0|t|cRXP_LOOT_辛特兰 莱晶|r来自 |cRXP_PICK_辛特兰|r, 位于祖尔祭坛以北
    .mob Enraged Leywalker
    .train 429309,1 << Mage
    .train 431745,1 << Warlock
    .train 429255,1 << Paladin
    .train 431673,1 << Priest
step
    .train 429309 >>|cRXP_WARN_使用你收集到的任意四个水晶将其合成, 即可学会|r|T132171:0|t[位移] << Mage
    .train 431745 >>|cRXP_WARN_使用你收集到的任意一颗水晶, 与其他水晶合成以学习|r|T236290:0|t[回火] << Warlock
    .train 429255 >>|cRXP_WARN_使用你收集的任意一个水晶, 与其他三个合成以学习|r|T135950:0|t[净化之力] << Paladin
    .train 431673 >>|cRXP_WARN_使用你收集到的任意一个水晶, 与其他三个合成以学习|r|T237555:0|t[绝望] << Priest
    .use 221318 --Azshara Leycryst
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD/Priest SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Mental Dexterity << Shaman
#displayname Pain and Suffering << Priest
#name 精神敏捷 - 43(塔纳利斯) << Shaman
#name 痛苦与折磨 - 43(塔纳利斯) << Priest

-- Mental Dexterity/Pain and Suffering
-- PERMOK: Needs better waypoints

step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    #completewith next
    >>击杀|cRXP_ENEMY_废土暗法师|r. 击败他们后搜刮出|T134939:0|t[|cRXP_LOOT_加密巫师笔记|r]
    .collect 221547,1
    .mob Wastewander Shadow Mage
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,59.8,24.0,35,0
    .goto Tanaris,65.6,32.2,35,0
    .goto Tanaris,62.4,33.2,30,0
    >>击杀|cRXP_ENEMY_Wastewander Thieves|r, 击败后搜刮其尸体以获得 |T134329:0|t[|cRXP_LOOT_Wastewander Cipher|r]
    .collect 221549,1
    .mob Wastewander Thief
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,58.4,38.6,40,0
    .goto Tanaris,60.3,23.4,40,0
    .goto Tanaris,66.2,35.0,40,0
    >>击杀|cRXP_ENEMY_废土暗法师|r. 击败他们后搜刮出|T134939:0|t[|cRXP_LOOT_加密巫师笔记|r]
    .collect 221547,1
    .mob Wastewander Shadow Mage
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_请使用|r|T134329:0|t[废墟游荡者密码]|cRXP_WARN_以获取|r|T237018:0|t[解密的术士笔记]
    .goto Tanaris,58.0,36.0
    .use 221549
    .collect 221545,1
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_站在|r“神秘召唤卷轴”上. |cRXP_WARN_使用|r|T237018:0|t[解密的术士笔记]|cRXP_WARN_的同时, 确保站在卷轴上方|r
    >>击杀|r|cRXP_ENEMY_狂怒虚空行者|r. 将其击败后拾取掉落的|r|T134419:0|t[|cRXP_FRIENDLY_精神敏捷符文|r] << Shaman
    >>击杀|cRXP_ENEMY_Enraged Voidwalker|r. 击败后拾取其掉落的 |T135975:0|t[|cRXP_FRIENDLY_Prophecy of Verdant Winter|r] << Priest
    .collect 220610,1 << Shaman
    .collect 221979,1 << Priest
step
    .itemcount 220610,1 << Shaman
    .itemcount 221979,1 << Priest
    .use 220610 << Shaman
    .use 221979 << Priest
    .train 416055 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_心灵敏捷符文|r]|cRXP_WARN_来学习|r|T136055:0|t[心灵敏捷] << Shaman
    .train 415991 >>|cRXP_WARN_使用|r|T135975:0|t[|cRXP_FRIENDLY_翠绿冬日的预言|r]|cRXP_WARN_来学习|r|T237567:0|t[痛苦与苦难] << Priest
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Hunter SoD/Rogue SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Ranged Weapon Specialization
#name 远程武器专精 - 58(东瘟疫之地)

step
    #completewith rangeSpec
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step << Horde
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取|cRXP_FRIENDLY_纳萨诺斯·凋零者|r旁边的红书. 它在房子外面, 门的左边. 其中包含 |T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step << Alliance
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取纳萨诺斯·凋零者旁边的红书. 它在房子外面, 门的左边. 其中包含 |T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]
    >>|cRXP_WARN_如果附近有人, 请他们把|r|cRXP_ENEMY_纳萨诺斯·凋零者|r|cRXP_WARN_引开一会儿,  while you safely loot the rune|r
    >>|cRXP_WARN_如果附近没有其他玩家, 你可以死亡于|r|cRXP_ENEMY_Nathanos|r|cRXP_WARN_, 然后站在屋内且处于他视野范围之外的位置重生. 随后, 通过互动键或调整摄像机角度点击的方式, 从屋内拾取书籍|r << Warrior/Rogue
    >>|cRXP_WARN_如果附近没有其他玩家, 请将宠物设置为|r|T136106:0|t[待命]|cRXP_WARN_并保持与|r|cRXP_ENEMY_Nathanos|r|cRXP_WARN_一定距离, 然后发送|r|T132152:0|t[攻击]|cRXP_WARN_命令, 使他仇恨转移到你的宠物身上. 当敌人锁定你的宠物后, 将宠物设为|r|T132311:0|t[被动]|cRXP_WARN_模式, 这会令宠物回到待命位置. 随后走到书旁, 使用|r|T132293:0|t[假死]|cRXP_WARN_脱离战斗并拾取符文|r << Hunter
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step
    .train 453692 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]|cRXP_WARN_来学习|r|T135490:0|t[远程武器专精]
    .use 226410
]])

RXPGuides.RegisterGuide([[
#classic
<< Priest SoD/Paladin SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Holy Specialization
#name 神圣专精 - 60(东瘟疫之地)

step
    #completewith next
    >>|cRXP_WARN_获得此符文需要你在精英区域击败怪物. 虽然可以单人完成, 但如果你等级较低或装备不足, 建议找人协助你|r
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    >>|cRXP_WARN_你可以在此符文与|r|T135883:0|t[|cRXP_FRIENDLY_绑定治疗|r]|cRXP_WARN_任务线同时获得, 如果你先完成该任务线. 如果你想同时获取两个符文, 请前往|r|T135883:0|t[|cRXP_FRIENDLY_绑定治疗|r]|cRXP_WARN_符文向导|r << Priest
    .goto Eastern Plaguelands,77.5,81.7,50 >>前往提尔之手, |cRXP_WARN_请记住, 这是一个精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_前往地图标记建筑内的图书馆区域, 找到书架顶部的书籍, 拾取以获得符文. 请注意, 你无法在战斗状态下拾取该物品|r
    >>|cRXP_WARN_你可以选择清空房间内的所有怪物, 或者死亡在书旁, 并在怪物无法看到的位置释放, 从而拾取符文而无需击杀任何敌人|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    #completewith next
    .train 453702 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专精符文|r] 来训练 |T237537:0|t[神圣专精]
    .train 453702,1
    .itemcount 226418,1
    .use 226418
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD/Druid SoD/Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Arcane Specialization
#name 奥术专精 - 60(西瘟疫之地)

step
    #completewith next
    >>|cRXP_WARN_获得此符文需要你在精英区域击败怪物. 虽然可以单人完成, 但如果你等级较低或装备不足, 建议找人协助你|r
    .zone Western Plaguelands >>前往: |cRXP_PICK_西瘟疫之地|r
step
    .goto Western Plaguelands,48.7,22.4,50 >>前往壁炉谷, |cRXP_WARN_请记住, 这是一个精英区域|r
step
    .goto Western Plaguelands,47.3,13.6
    >>|cRXP_WARN_前往地图标记的塔顶. 在书架旁的角落找到一本红书, 它由一名|r |cRXP_ENEMY_血色神父|r看守. |cRXP_WARN_搜索它以获取符文|r
    .collect 226413,1 --Rune of Arcane Specialization
    .train 453702,1
step
    #completewith next
    .train 453695 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奥术专精符文|r] 来训练 |T132849:0|t[奥术专精]
    .train 453695,1
    .itemcount 226413,1
    .use 226413
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Paladin SoD/Warrior SoD/Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Axe Specialization
#name 斧头专精 - 58(燃烧平原)

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    .goto Burning Steppes,40.3,34.9,100 >>前往黑石要塞
step
    .goto Burning Steppes,39.9,34.1
    >>|cRXP_WARN_进入要塞, 在地图标记的位置找到一本红色的书, 拾取它以获得符文|r
    .collect 226407,1 --Rune of Axe Specialization
step
    #completewith next
    .train 453688 >>使用 |T134419:0|t[|cRXP_FRIENDLY_斧专精符文|r] 来训练 |T132394:0|t[斧专精]
    .itemcount 226407,1
    .use 226407
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Druid SoD/Warrior SoD/Shaman SoD/Mage SoD/Priest SoD/Rogue SoD/Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Dagger Specialization
#name 匕首专精 - 60(希利苏斯)

step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_希利苏斯|r
step
    .goto Silithus,20,85,50 >>前往区域南部, 靠近安其拉大门的一顶帐篷
step
    .goto Silithus,20,85
    >>|cRXP_WARN_进入帐篷, 在地图标记的位置找到一本红色书籍, 拾取它以获得符文|r
    .collect 226409,1 --Rune of Dagger Specialization
step
    #completewith next
    .train 453690 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 剑专精符文|r] 来训练 |T135641:0|t[剑专精]
    .itemcount 226409,1
    .use 226409
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD/Warrior SoD/Shaman SoD/Rogue SoD/Warlock SoD/Paladin SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Defense Specialization
#name 防御专精 - 60(黑石山)

step
    #completewith next
    .zone 25 >>前往黑石山, 可经由灼热峡谷或燃烧平原
step
    .goto 1415/0,-1232.500,-7612.600,20 >>前往熔岩之桥环的东侧, 直到找到通往黑石塔下层的入口
step
    .goto 1415/0,-1294.200,-7574.700,5 >>沿着小路向上走, 进入右侧第一个侧室. |cRXP_WARN_你可能需要击杀挡路的精英怪, 因为在战斗中无法拾取这本书|r
step
    .goto 1415/0,-1302.100,-7583.400
    >>|cRXP_WARN_在这个房间寻找地上的一本红色书籍. 它可能出现在多个位置, 拾取它以获得符文|r
    .collect 226694,1 --Rune of Defense Specialization
step
    #completewith next
    .train 459313 >>使用 |T134419:0|t[|cRXP_FRIENDLY_防御专精符文|r] 来训练 |T134952:0|t[防御专精]
    .itemcount 226694,1
    .use 226694
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Feral Combat Specialization
#name 野性战斗专精 - 60(冬泉谷)

step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .goto Winterspring,49.0,8.0,50 >>向北前往霜刀石
step
    .goto Winterspring,49.0,8.0
    >>|cRXP_WARN_在标记位置寻找一本红色的书. 它可能被两只等级为55-56的霜刃豹守卫|r|cRXP_ENEMY_霜刃豹|r|cRXP_WARN_击败它们以获取符文|r
    .collect 226419,1 --Rune of Feral Combat Specialization
step
    #completewith next
    .train 453703 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 野性战斗专精符文|r] 来训练 |T132116:0|t[野性战斗专精]
    .itemcount 226419,1
    .use 226419
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Mage SoD/Shaman SoD/Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Fire Specialization
#name 火焰专精 - 52(灼热峡谷)

step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
    .goto 1427/0,-1425.800,-6772.400,25 >>通过地图上标记的洞穴入口进入熔渣坑
step
    .goto 1427/0,-1306.900,-6642.800,25 >>向北过桥
step
    .goto 1427/0,-1225.300,-6623.600
    >>|cRXP_WARN_在|r|cRXP_ENEMY_工头玛托留斯|r身后的长凳上寻找一本红书. |cRXP_WARN_拾取它以获得符文. 请注意, 你无法在战斗中进行此操作|r
    >>|cRXP_WARN_如果你等级较高, 可以不拉怪直接拾取它|r|cRXP_ENEMY_工头玛托留斯|r|cRXP_WARN_如果你能紧贴他阳台边缘操作, 若无法做到, 可请他人帮忙拉走他后再去拾取书籍, 或直接击杀他及其守卫|r
    >>|cRXP_WARN_作为一名猎人, 你可以用宠物将他拉走, 然后在书旁施放|r|T132293:0|t[假死]|cRXP_WARN_, 以脱离战斗并拾取物品. 确保将督军拉到你视野之外的地方, 否则他可能会让你重新进入战斗|r << Hunter
    .collect 226414,1 --Rune of Fire Specialization
step
    #completewith next
    .train 453696 >>使用 |T134419:0|t[|cRXP_FRIENDLY_烈焰符文专精|r] 来训练 |T132847:0|t[火焰专精]
    .itemcount 226414,1
    .use 226414
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Druid SoD/Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Fist Weapon Specialization
#name 拳套武器专精 - 60(希利苏斯)

step
    #completewith next
    .zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
    .goto 1427/0,-1225.300,-6623.600
    >>|cRXP_WARN_在标记位置寻找一本红色的书. 它被暮色笼罩, 可能有点难发现|r
    .collect 226411,1 --Rune of Fist Weapon Specialization
step
    #completewith next
    .train 453691 >>使用 |T134419:0|t[|cRXP_FRIENDLY_拳套武器专精符文|r] 来训练 |T133832:0|t[拳套武器专精]
    .itemcount 226411,1
    .use 226411
]])

RXPGuides.RegisterGuide([[
#classic
<< Mage SoD/Hunter SoD/Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Frost Specialization
#name 冰霜专精 - 60(冬泉谷)

step
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
step
    .goto Winterspring,59.0,59.0,50 >>向南前往枭兽营地
step
    .goto Winterspring,59.0,59.0
    >>|cRXP_WARN_在标记位置寻找一本红色的书. 它可能被一对57-58级的|r|cRXP_ENEMY_Owlbeasts|r|cRXP_WARN_击杀它们以获取符文|r
    .collect 226415,1 --Rune of Frost Specialization
step
    #completewith next
    .train 453697 >>使用 |T134419:0|t[|cRXP_FRIENDLY_冰霜专精符文|r] 来训练 |T132852:0|t[冰霜专精]
    .itemcount 226415,1
    .use 226415
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD/Rogue SoD/Shaman SoD/Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Nature Specialization
#name 自然专精 - 56(费伍德)

step
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,63.42,7.71,50 >>向北前往费尔帕村
step
    .goto Felwood,62.8,7.5
    >>|cRXP_WARN_在标记位置寻找一本红色的书. 它位于一个营地内, 旁边是|r|cRXP_ENEMY_血喉酋长|r |cRXP_WARN_掠夺它以获得符文|r
    .collect 226416,1 --Rune of Nature Specialization
step
    #completewith next
    .train 453698 >>使用 |T134419:0|t[|cRXP_FRIENDLY_自然专精符文|r] 来训练 |T132848:0|t[自然专精]
    .itemcount 226416,1
    .use 226416
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Rogue SoD/Shaman SoD/Paladin SoD/Priest SoD/Druid SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Mace Specialization
#name 锤专精 - 60 (湿地)

step
    #completewith next
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
step
    .goto 1437/0,-3451.700,-3450.800,25 >>向东前往通往格瑞姆巴托的小径起点
step
    .goto 1437/0,-3582.500,-4138.200,25 >>沿着道路一直走到格瑞姆巴托. |cRXP_WARN_路上不要与任何红色幼龙战斗, 这样你无需击杀它们就能顺利抵达|r
step
     .goto 1437/0,-3451.900,-4052.500
    >>|cRXP_WARN_沿着小路前往格瑞姆巴托的大门. 在入口右侧寻找一本红色的书, 拾取它以获得符文|r
    .collect 226408,1 --Rune of Mace Specialization
step
    #completewith next
    .train 453689 >>使用 |T134419:0|t[|cRXP_FRIENDLY_锤专精符文|r] 来训练 |T133038:0|t[锤专精]
    .itemcount 226408,1
    .use 226408
]])

RXPGuides.RegisterGuide([[
#classic
<< Warrior SoD/Warlock SoD/Shaman SoD/Mage SoD/Priest SoD/Druid SoD/Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Pole Weapon Specialization
#name 长柄武器专精 - 60 (艾萨拉)

step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    .goto Azshara,76.43,43.95,100 >>前往阿克罗坎神庙
step
    .goto Azshara,76.88,44.24
    >>|cRXP_WARN_在神庙内的月井中寻找一本红色的书, 拾取它以获得符文|r
    .collect 226412,1 --Rune of Pole Weapon Specialization
step
    #completewith next
    .train 453694 >>使用 |T134419:0|t[|cRXP_FRIENDLY_长柄武器专精符文|r] 来学习 |T135145:0|t[长柄武器专精]
    .itemcount 226412,1
    .use 226412
]])

RXPGuides.RegisterGuide([[
#classic
<< Warlock SoD/Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Shadow Specialization
#name 暗影专精 - 60(诅咒之地)

step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    .goto Blasted Lands,45.19,55.29,100 >>向南前往污秽之痕. |cRXP_WARN_你将不得不穿越一个精英区域, 那里有许多对控制效果免疫的高等级怪物. 你很可能需要一路击杀才能到达符文位置|r
step
    .goto Blasted Lands,33.0,48.0
    >>|cRXP_WARN_寻找地图标记祭坛上的红书, 拾取以获得符文|r
    .collect 226417,1 --Rune of Shadow Specialization
step
    #completewith next
    .train 453700 >>使用 |T134419:0|t[|cRXP_FRIENDLY_暗影专精符文|r] 来训练 |T132851:0|t[暗影专精]
    .itemcount 226417,1
    .use 226417
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Paladin SoD/Mage SoD/Warlock SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Sword Specialization
#name 剑术专精 - 60(死亡之风隘口)

step
    #completewith next
    .zone Deadwind Pass >>前往: |cRXP_PICK_逆风小径|r
step
    .goto Deadwind Pass,47.40,75.50 >>前往南方的卡拉赞
step
    .goto 1430/0,-2019.100,-11170.300,10 >>进入大师的酒窖
step
    .goto Deadwind Pass,43.06,74.58
    >>|cRXP_WARN_进入洞穴区域, 在地图标记的位置寻找一本红色的书, 将其拾取以获得符文|r
    .collect 226406,1 --Rune of Sword Specialization
step
    #completewith next
    .train 453635 >>使用 |T134419:0|t[|cRXP_FRIENDLY_剑专精符文|r] 来训练 |T132223:0|t[剑专精]
    .itemcount 226406,1
    .use 226406
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD/Druid SoD/Shaman SoD/Paladin SoD/Mage SoD/Warlock SoD/Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Meditation Specialization
#name 冥想专精 - 30(千针)

step
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r in Thousand Needles
    >>距符文位置最近的飞行点是加基森
step
    .goto Thousand Needles,80,77,10 >>进入地图标记的小屋内
step
    .goto Thousand Needles,80,77
    >>|cRXP_WARN_进入小屋, 在里面架子上找到一本|cRXP_WARN_gray书|r, 拾取其中的符文|r
    .collect 231828,1 --Rune of Meditation Specialization
step
    .train 468763 >>使用|T134419:0|t[|cRXP_FRIENDLY_冥想专精符文|r]来训练|T135913:0|t[冥想专精]
    .itemcount 231828,1
    .use 231828
]])

RXPGuides.RegisterGuide([[
#classic
<< Druid SoD/Shaman SoD/Paladin SoD/Mage SoD/Priest SoD
#group RestedXP 符文与书籍指南
#subgroup Ring
#displayname Healing Specialization
#name 治疗专精 - 40(阿拉希高地)

step
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .goto Arathi Highlands,21.98,79.75,40 >>前往法迪尔海湾, 沿着山脉与激流堡东南墙之间的路径前行
step
    .goto Arathi Highlands,35.2,79.1
    >>|cRXP_WARN_前往菲兹索普教授(|cRXP_FRIENDLY_菲兹索普教授|r)旁边的营火, 寻找放在篝火旁箱子上的|cRXP_WARN_gray 书|r. 拾取它以获得符文|r
    .collect 231829,1 --Rune of Healing Specialization
    .target Professor Phizzlethorpe
step
    .train 468761 >>使用|T134419:0|t[|cRXP_FRIENDLY_治疗符文专精|r]来训练|T135913:0|t[治疗专精]
    .itemcount 231829,1
    .use 231829
]])