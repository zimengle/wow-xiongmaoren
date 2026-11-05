local _,addon = ...
if addon.GetSeason() ~= 2 then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD/Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs << Warrior
#subgroupdisplayname 腿部 << Warrior
#subgroup Chest << Hunter
#subgroupdisplayname 胸甲 << Hunter
#name Carrodin Runes
#title 噬心狂怒 << Warrior
#title 眼镜蛇屠夫 << Hunter
#displayname 噬心狂怒 - 25（湿地） << Warrior
#displayname 眼镜蛇屠夫 - 25（湿地） << Hunter
#displayname 卡罗丁符文
step
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #season 2
    #completewith next
    .zone Wetlands >>前往湿地
step
    #season 2
    #completewith next
    .goto Wetlands,51.914,62.692,30 >> 进入瑟尔根岩洞
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
step
    #season 2
    .goto Wetlands,47.24,65.34
    >>击杀|cRXP_ENEMY_卡洛丁|r，拾取|T134419:0|t[|cRXP_FRIENDLY_噬心狂怒符文|r] << Warrior
    >>击杀|cRXP_ENEMY_卡洛丁|r，拾取|T134419:0|t[|cRXP_FRIENDLY_眼镜蛇屠夫符文|r] << Hunter
    .collect 210573,1 << Warrior --Rune of Consuming Rage (1)
    .collect 211205,1 << Hunter --Rune of Aspect of Cobra Slayer (1)
    .mob 卡洛丁
    .train 425446,1 << Warrior
    .train 410115,1 << Hunter
step << Warrior
    #season 2
    .train 425446 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_噬心狂怒符文|r] |cRXP_WARN_学习|r |T136088:0|t[噬心狂怒]
    .use 210573
    .itemcount 210573,1
step << Hunter
    #season 2
    .train 410115 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_眼镜蛇屠夫符文|r] |cRXP_WARN_学习|r |T136040:0|t[眼镜蛇屠夫]
    .use 211205
    .itemcount 211205,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Envenom - 25 (Hillsbrad)
#title 毒伤
    --Rune of Envenom
#displayname 毒伤 - 25（希尔斯布莱德丘陵）
step
    .train 400102,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #season 2
    #completewith next
	.goto Hillsbrad Foothills,76.72,46.22,60 >> 前往敦霍尔德城堡
step
    #season 2
    .goto Hillsbrad Foothills,80.2,39.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克瑞斯·李盖斯|r交谈
    >>|cRXP_BUY_向她购买|r |T133469:0|t[火线密报] |cRXP_BUY_。|r
    .collect 210330,1 --Hot Tip (1)
    .target 克瑞斯·李盖斯
    .train 400102,1
step
    #season 2
    .use 210330 >>打开|T133469:0|t[火线密报]
    .collect 210323,1 --Safe Combination (1)
    .collect 210329,1 --Hillsbrad Treasure Map (1)
    .train 400102,1
step
    .train 400102,1
    #completewith next
    .zone Western Plaguelands >>前往西瘟疫之地
step
    #season 2
    .goto Western Plaguelands,59.4,84.5
    >>打开水中的|cRXP_PICK_生锈的保险箱|r，取得|T134419:0|t[|cRXP_FRIENDLY_毒伤符文|r]
    .collect 210322,1 --Rune of Venom (1)
    .train 400102,1
step
    #season 2
    .train 400102 >>使用|T134419:0|t[|cRXP_FRIENDLY_毒伤符文|r]
    .use 210322
    .itemcount 210322,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Cutthroat - 25 (Duskwood)
#title 割喉
#displayname 割喉 - 25（暮色森林）
step
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #season 2
    .goto Duskwood,81.24,71.86
    >>打开静谧花园墓场的|cRXP_PICK_供品箱|r，取得|T133343:0|t[|cRXP_LOOT_铭刻文字的银戒指|r]
    .collect 210251,1 --Engraved Silver Ring (1)
    .train 424988,1
step
    #season 2
    .goto Duskwood,48.5,79.9
    >>使用|T133644:0|t[搜索]（偷窃），目标为|cRXP_ENEMY_迪菲亚夜行者|r，取得|T133345:0|t[|cRXP_LOOT_铭刻文字的金戒指|r]
    .collect 210250,1 --Engraved Gold Ring (1)
    .mob 迪菲亚夜行者
    .train 424988,1
step
    .train 424988,1
    #season 2
    #completewith next
    .goto Duskwood,19.9,44.6,60,0 >>前往乌鸦岭雕像
step
    #season 2
    .goto Duskwood,19.9,44.6
    .use 210250 >> 装备两枚戒指，在乌鸦岭雕像前输入/kneel，取得|T134419:0|t[|cRXP_FRIENDLY_毒刃符文|r]
    .use 210251
    .collect 210252,1 --Rune of Shiving (1)
    .train 424988,1
step
    #season 2
    .train 424988 >>使用|T134419:0|t[|cRXP_FRIENDLY_毒刃符文|r]，学习|T236280:0|t[割喉]
    .use 210252
    .itemcount 210252,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Wild Strikes - 14 (Stonetalon Mountains)
#title 狂野打击
#displayname 狂野打击 - 14（石爪山脉）
step << Druid
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    .goto Stonetalon Mountains,80.2,90.6,60,0
    .goto Stonetalon Mountains,83.2,87.0,60,0
    .goto Stonetalon Mountains,71.6,86.6,60,0
    .goto Stonetalon Mountains,76.6,91.0,60,0
    .goto Stonetalon Mountains,80.2,90.6
    >>击杀|cRXP_ENEMY_恐怖图腾|r，拾取|T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob 恐怖图腾佣兵
    .mob 恐怖图腾蛮兵
    .mob 恐怖图腾巫师
    .mob 恐怖图腾恶徒
    .train 410021,1
step << Druid
    .equip 18,210534 >> |cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1
step << Druid
    >>|cRXP_WARN_对10只不同的友方野兽施放|r |T136085:0|t[愈合] |cRXP_WARN_或|r |T136041:0|t[治疗之触]|cRXP_WARN_，例如猎人的宠物、熊形态的德鲁伊或幽魂之狼形态的萨满祭司|r << Horde
    >>|cRXP_WARN_对10只不同的友方野兽施放|r |T136085:0|t[愈合] |cRXP_WARN_或|r |T136041:0|t[治疗之触]|cRXP_WARN_，例如猎人的宠物或熊形态的德鲁伊|r << Alliance
    .train 410021 >> |cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r] |cRXP_WARN_学习|r |T132143:0|t[狂野打击]
    .use 210534
    .itemcount 210534,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Starsurge - 25 (Wetlands)
#title 星涌术
#displayname 星涌术 - 25（湿地）
step << Druid
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    +|cRXP_WARN_1级也可以获取此符文，但过程中会死很多次|r
    .train 424718,1
step << Druid
    .goto Wetlands,36.941,15.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古基姆登|r交谈
    >>|cRXP_WARN_他会给你一份|r |T134052:0|t[|cRXP_LOOT_泽菇|r]
    .collect 210499,1 -- Marshroom (1)
    .skipgossip
    .target 古基姆登
    .train 424718,1
step << Druid
    #completewith next
    .goto Wetlands,31.187,18.328
    .cast 426019 >>|cRXP_WARN_使用|r |T134052:0|t[|cRXP_LOOT_泽菇|r] |cRXP_WARN_将其吃下|r
    .use 210499
    .train 424718,1
step << Druid
    .goto Wetlands,31.187,18.328
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德亚诺伊|r交谈
    .collect 210500,1 -- Rune of the Stars (1)
    .skipgossip
    .target 沃德亚诺伊
    .train 424718,1
step << Druid
    .train 424718 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_星辰符文|r] |cRXP_WARN_学习|r |T135730:0|t[星涌术]
    .use 210500
    .itemcount 210500,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
#group RestedXP Rune & Books Guide
#subgroup Chest << Priest/Hunter/Druid/Warrior/Shaman
#subgroupdisplayname 胸甲 << Priest/Hunter/Druid/Warrior/Shaman
#subgroup Legs << Warlock/Paladin
#subgroupdisplayname 腿部 << Warlock/Paladin
#subgroup Gloves << Rogue
#subgroupdisplayname 手套 << Rogue
#subgroup Bracers << Mage
#subgroupdisplayname 护腕 << Mage
#name Grizzby Runes
#next Crusader Strike - 4 (Elwynn Forest) << Human Paladin
#next Crusader Strike - 4 (Dun Morogh) << Dwarf Paladin
#next Lava Burst - 25 (Hillsbrad Foothills) << Shaman
#title 妙手回春 << Priest
#title 独来独往 << Hunter
#title 优胜劣汰 << Druid
#title 战神 << Warrior
#title 双武器专精 << Shaman
#title 恶魔契约 << Warlock
#title 牺牲之手 << Paladin
#title 时光倒转 << Mage
#title 左右开弓 << Rogue
<< SoD
#displayname 妙手回春 - 25（贫瘠之地） << Priest
#displayname 独来独往 - 25（贫瘠之地） << Hunter
#displayname 优胜劣汰 - 25（贫瘠之地） << Druid
#displayname 战神 - 25（贫瘠之地） << Warrior
#displayname 双武器专精 - 25（贫瘠之地） << Shaman
#displayname 恶魔契约 - 25（贫瘠之地） << Warlock
#displayname 牺牲之手 - 25（贫瘠之地） << Paladin
#displayname 时光倒转 - 25（贫瘠之地） << Mage
#displayname 左右开弓 - 25（贫瘠之地） << Rogue
#displayname 格里兹比符文
step
    .train 415995,1 << Priest
    .train 410010,1 << Paladin
    .train 401761,1 << Mage
    .train 410122,1 << Hunter
    .train 416042,1 << Druid
    .train 425445,1 << Warrior
    .train 425476,1 << Warlock
    .train 424990,1 << Rogue
    .train 410096,1 << Shaman
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone The Barrens >>前往贫瘠之地的棘齿城。|cRXP_WARN_按格里兹比的原途径购买需要3金币|r
step
    .goto The Barrens,61.8,39.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_格里兹比|r 交谈
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_祥和顿悟|r] |cRXP_WARN_学习|r |T237549:0|t[妙手回春] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 牺牲之手] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：时光倒转|r] |cRXP_WARN_学习|r |T237538:0|t[时光倒转] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] |cRXP_WARN_学习|r |T132266:0|t[独来独往] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_优胜劣汰符文|r] |cRXP_WARN_学习|r |T132126:0|t[优胜劣汰] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_战神符文|r] |cRXP_WARN_学习|r |T236319:0|t[战神] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] |cRXP_WARN_学习|r |T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_左右开弓符文|r] |cRXP_WARN_学习|r |T237531:0|t[左右开弓] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_双武器专精符文|r] |cRXP_WARN_学习|r |T132686:0|t[铭刻胸甲 - 双武器专精] << Shaman
    .target 格里兹比
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
#group RestedXP Rune & Books Guide
#subgroup Chest << Shaman/Rogue
#subgroupdisplayname 胸甲 << Shaman/Rogue
#subgroup Legs << Mage/Warlock/Hunter
#subgroupdisplayname 腿部 << Mage/Warlock/Hunter
#subgroup Gloves << Paladin/Warrior/Priest/Druid
#subgroupdisplayname 手套 << Paladin/Warrior/Priest/Druid
#name Waylaid Runes
#next Grizzby Runes << Paladin
#title 精神灼烧 << Priest
#title 毒蛇扩散 << Hunter
#title 迎头痛击 << Druid
#title 鲁莽怒火 << Warrior
#title 治疗之雨 << Shaman
#title 持久痛苦 << Warlock
#title 圣光道标 << Paladin
#title 奥术涌动 << Mage
#title 只是皮肉伤 << Rogue
<< SoD
--VV if (Reputation) name formatting removed, change in Paladin guide too
#displayname 精神灼烧 - 25（声望） << Priest
#displayname 毒蛇扩散 - 25（声望） << Hunter
#displayname 迎头痛击 - 25（声望） << Druid
#displayname 鲁莽怒火 - 25（声望） << Warrior
#displayname 治疗之雨 - 25（声望） << Shaman
#displayname 持久痛苦 - 25（声望） << Warlock
#displayname 圣光道标 - 25（声望） << Paladin
#displayname 奥术涌动 - 25（声望） << Mage
#displayname 只是皮肉伤 - 25（声望） << Rogue
#displayname 物资运输声望符文
step
    .train 415996,1 << Priest
    .train 409999,1 << Paladin
    .train 425171,1 << Mage
    .train 425760,1 << Hunter
    .train 416046,1 << Druid
    .train 416003,1 << Warrior
    .train 416008,1 << Warlock
    .train 400082,1 << Rogue
    .train 416057,1 << Shaman
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    >>外出寻找|T132765:0|t[遭劫货物]，然后返回主城交付。若想更快提升声望，可从拍卖行购买所需物品来补全货物。
    *交付补全的遭劫货物可获得更多声望；野外怪物和宝箱都可能掉落货物。
    .reputation 2587,friendly << Horde
    .reputation 2586,friendly << Alliance
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与最近城市的|cRXP_FRIENDLY_供应官|r交谈
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
    .use 206992 << Druid
    .use 211390 << Rogue
    .use 205950 << Priest
    .train 415996 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_晦暗顿悟|r] |cRXP_WARN_学习|r |T237565:0|t[精神灼烧] << Priest
    .train 409999 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_唤引圣光符文|r] |cRXP_WARN_学习|r |T236247:0|t[圣光道标] << Paladin
    .train 425171 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：奥术涌动|r] |cRXP_WARN_学习|r |T135734:0|t[奥术涌动] << Mage
    .train 425760 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_毒蛇扩散符文|r] |cRXP_WARN_学习|r |T132209:0|t[毒蛇扩散] << Hunter
    .train 416046 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_迎头痛击符文|r] |cRXP_WARN_学习|r |T133732:0|t[迎头痛击] << Druid
    .train 416003 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_鲁莽怒火符文|r] |cRXP_WARN_学习|r |T134919:0|t[鲁莽怒火] << Warrior
    .train 416008 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_持久痛苦符文|r] |cRXP_WARN_学习|r |T236296:0|t[持久痛苦] << Warlock
    .train 400082 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_挑逗符文|r] |cRXP_WARN_学习|r |T132284:0|t[只是皮肉伤] << Rogue
    .train 416057 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_治疗之雨符文|r] |cRXP_WARN_学习|r |T136107:0|t[治疗之雨] << Shaman
    .target 伊莱恩·康普顿 << Alliance
    .target 塔茉琳·阿尔德里奇 << Alliance
    .target 玛尔希·贝克 << Alliance
    .target 约尔娜 << Horde
    .target 多基米 << Horde
    .target 基莎 << Horde
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Wild Growth - 25 (Multiple Zones)
#title 野性成长
#displayname 野性成长 - 25（多个地区）
step << Druid
    .train 410028,1 << Druid
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Ashenvale >> 前往灰谷
step << Druid
    .goto Ashenvale,86.963,43.159
    >>点击 |cRXP_PICK_猫头鹰雕像|r 开始事件
    >>|cRXP_WARN_需击败 3 波怪物, 每波 2 只, 等级在 23-25 级之间|r
    >>|cRXP_WARN_确保 |cRXP_FRIENDLY_召唤出的小精灵|r 不会死亡；它无法接受治疗，但每波结束后会回满生命值|r
    >>击败全部三波后，拾取地上的|cRXP_PICK_小精灵的赐福|r
    .collect 210044,1 -- Symbol of the First Owl (1)
    .train 410028,1
step << Druid
    #completewith next
    .goto Duskwood,46.91,58.76,50,0
    .goto Duskwood,45.13,58.26,25,0
    .goto Duskwood,49.520,33.851
    .subzone 856 >> 前往暮色森林的暮光林地
    .train 410028,1
step << Druid
    .goto Duskwood,49.520,33.851
    .aura 424310 >> 点击 |cRXP_PICK_猫头鹰雕像|r 获取 |T132150:0|t[猫头鹰之眼] 增益
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
    >>击杀|cRXP_ENEMY_阿贡|r，拾取|cRXP_LOOT_第二头猫头鹰的标志|r
    >>|cRXP_ENEMY_阿贡|r|cRXP_WARN_会在附近小范围巡逻|r
    >>|cRXP_WARN_必须拥有|r |T132150:0|t[猫头鹰之眼] |cRXP_WARN_增益才能看见|r |cRXP_ENEMY_阿贡|r
    .collect 210043,1 -- Symbol of the Second Owl (1)
    .train 410028,1
step << Druid
    #completewith next
    .zone Hillsbrad Foothills >> 前往希尔斯布莱德丘陵
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,36.914,76.142
    .goto Hillsbrad Foothills,54.424,82.016,0
    +点击|cRXP_PICK_双子猫头鹰雕像|r，获得|T237178:0|t[双子猫头鹰光环]增益
    >>|cRXP_WARN_须在1分40秒内赶到另一座小岛，并点击那里的另一座|r |cRXP_PICK_双子猫头鹰雕像|r
    >>|cRXP_WARN_确保使用|r |T132112:0|t[水栖形态]
    >>|cRXP_WARN_另一座岛的位置已在你的地图上标出|r
    .aura 424181
    .aura 424182
    .train 410028,1
step << Druid
    .goto Hillsbrad Foothills,54.424,82.016
    >>游到另一座小岛，并在1分40秒内点击|cRXP_PICK_双子猫头鹰雕像|r
    >>|cRXP_WARN_确保使用|r |T132112:0|t[水栖形态]
    >>|cRXP_WARN_若失败并失去增益，就点击这座 |cRXP_PICK_双子猫头鹰雕像|r，并返回刚离开的岛屿|r
    .collect 210026,1 -- Symbol of the Third Owl (1)
    .train 410028,1
step << Druid
    #completewith next
    .zone Moonglade >> 传送到月光林地
    .train 410028,1
step << Druid
    .goto Moonglade,52.53,40.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 对话
    .accept 78229 >> 接受任务 猫头鹰试炼
    .turnin 78229 >> 交任务 猫头鹰试炼
    .target 洛甘纳尔
    .train 410028,1
step << Druid
    .train 410028 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野性成长符文|r] |cRXP_WARN_训练|r |T236153:0|t[野性成长]
    .use 210137
    .itemcount 210137,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD/Mage SoD
#group RestedXP Rune & Books Guide
#subgroup Chest << Warrior
#subgroupdisplayname 胸甲 << Warrior
#subgroup Legs << Mage
#subgroupdisplayname 腿部 << Mage
#name Duskwood Lich Runes
#title 狂热鞭笞 << Warrior
#title 群体再生 << Mage
#displayname 狂热鞭笞 - 25（暮色森林） << Warrior
#displayname 群体再生 - 25（暮色森林） << Mage
#displayname 暮色森林巫妖符文
step << Warrior/Mage
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .goto Duskwood,23.630,34.888,15 >> 进入东北方的墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,26.115,30.863
    >>打开|cRXP_PICK_尘封的箱子|r，从中取得|T252996:0|t[|cRXP_LOOT_破旧护命匣|r]
    .collect 210568,1 -- Decrepit Phylactery (1)
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,15.602,38.621,15 >> 离开此墓穴, 向西进入地下墓穴
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    #completewith next
    .goto Duskwood,18.140,37.940
    .cast 426182 >> 点击小王座上的|cRXP_PICK_沉眠之骨|r
    >>|cRXP_WARN_这会召唤一个25级精英|r |cRXP_ENEMY_觉醒巫妖|r
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior/Mage
    .goto Duskwood,18.140,37.940
    >>击杀|cRXP_ENEMY_觉醒巫妖|r，拾取|T134419:0|t[|cRXP_FRIENDLY_狂热鞭笞符文|r] << Warrior
    >>击杀|cRXP_ENEMY_觉醒巫妖|r，拾取|T134939:0|t[|cRXP_FRIENDLY_法术笔记：群体再生|r] << Mage
    >>|cRXP_WARN_若其他人正在击杀 |cRXP_ENEMY_觉醒巫妖|r，你也可以协助攻击并拾取战利品|r
    .collect 210569,1 << Warrior -- Rune of Flagellation (1)
    .collect 211514,1 << Mage -- Spell Notes: Mass Regeneration (1)
    .mob 觉醒巫妖
    .train 403480,1 << Warrior
    .train 415939,1 << Mage
step << Warrior
    .train 403480 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂热鞭笞符文|r] |cRXP_WARN_学习|r |T133495:0|t[狂热鞭笞]
    .use 210569
    .itemcount 210569,1
    .train 403480,1
step << Mage
    .train 415939 >> |cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：群体再生|r] |cRXP_WARN_学习|r |T132870:0|t[群体再生]
    .use 211514
    .itemcount 211514,1
    .train 415939,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Raging Blow - 25 (Multiple Zones)
#title 怒击
#displayname 怒击 - 25（多个地区）
step << Warrior
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .goto Wetlands,49.40,16.98
    .subzone 205 >> 前往湿地的丹莫德
    .train 425444,1
step << Warrior
    .goto Wetlands,46.92,17.53,15,0
    .goto Wetlands,46.553,18.369
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_黑铁企业家|r交谈
    >>|cRXP_WARN_可能需要多次跑尸才能到他身边|r
    >>|cRXP_BUY_购买一件|r |T135130:0|t[屠龙者之矛] |cRXP_BUY_，价格为75银币|r
    .collect 209874,1,78134,1 -- Dragonslayer's Lance (1)
    .target 黑铁企业家
    .train 425444,1
step << Warrior
    #completewith next
    .goto Redridge Mountains,69.928,55.814
    .subzone 2099 >> 前往赤脊山的石堡要塞
    .train 425444,1
step << Warrior
    .goto Redridge Mountains,69.928,55.814
    >>点击|cRXP_PICK_墙上挂着的盾牌|r，取得|cRXP_LOOT_屠龙者之盾|r
    >>|cRXP_WARN_盾牌位于主堡二楼，在 |cRXP_ENEMY_加塞尔佐格|r 身后，他是26级精英|r
    >>|cRXP_WARN_必须击杀|cRXP_ENEMY_加塞尔佐格|r，或由其他人牵制他，才能拾取盾牌。进入前务必组队|r
    .collect 209873,1,78133,1 -- Dragonslayer's Shield (1)
    .train 425444,1
step << Warrior
    .train 425444,1 << Warrior
    #completewith next
    .subzone 209,2 >> 组队并进入影牙城堡
step << Warrior
    >>打开|cRXP_PICK_废弃的头盔|r，取出|cRXP_LOOT_屠龙者的头盔|r
    >>|cRXP_WARN_它在长椅上，位于|r |cRXP_ENEMY_指挥官斯普林瓦尔|r 身后
    .collect 209872,1,78132,1 -- Dragonslayer's Helm (1)
    .train 425444,1
step << Warrior
    #completewith next
    .zone Ashenvale >> 前往灰谷
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .accept 78132 >> 接任务：屠龙者的头盔
    .accept 78134 >> 接任务：屠龙者之矛
    .accept 78133 >> 接任务：屠龙者之盾
    .turnin 78132 >> 交任务：屠龙者的头盔
    .turnin 78134 >> 交任务：屠龙者之矛
    .turnin 78133 >> 交任务：屠龙者之盾
    .target 阿隆索
    .train 425444,1
step << Warrior
    .goto Ashenvale,43.513,70.463
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .accept 78144 >> 接任务：屠龙者阿隆索
    .target 阿隆索
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.029,68.999
    >>击杀 |cRXP_ENEMY_绿龙幼龙|r
    .complete 78144,1 -- Accompany Alonso to slay the dragon.
    .target 阿隆索
    .mob 绿龙幼龙
    .train 425444,1
step << Warrior
    .goto Ashenvale,42.053,69.187
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆索|r交谈
    .turnin 78144 >> 交任务：屠龙者阿隆索
    .target 阿隆索
    .train 425444,1
step << Warrior
    .train 425444 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_怒击符文|r] |cRXP_WARN_学习|r |T132215:0|t[怒击]
    .use 210015
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Strength of Soul - 22 (Ashenvale)
#title 灵魂之力
#displayname 灵魂之力 - 22（灰谷）
step << Priest
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    .goto Ashenvale,32.0,43.0,65,0
    .goto Ashenvale,33.6,38.8,65,0
    .goto Ashenvale,37.6,34.0
    >>击杀|cRXP_ENEMY_蓟皮图腾师|r和|cRXP_ENEMY_蓟皮萨满祭司|r，拾取|T135736:0|t[原始洞察]
    .collect 211534,1 -- Primal Insight (1)
    .mob 蓟皮图腾师
    .mob 蓟皮萨满祭司
    .train 415997,1
step << Priest
    .goto Ashenvale,38.002,29.528,40,0
    .goto Ashenvale,37.938,27.958,30,0
    .goto Ashenvale,38.819,27.160,30,0
    .goto Ashenvale,38.804,26.558
    >>|cRXP_WARN_沿洞穴入口旁的巨树向上走，仔细跟随箭头|r
    .use 211534 >>|cRXP_WARN_靠近树上的两只捕梦网时使用|r |T135736:0|t[原始洞察] |cRXP_WARN_，合成|r |T135975:0|t[|cRXP_FRIENDLY_七大访客的预言|r]
    .collect 211531,1 -- Prophecy of Seven Visitors (1)
    .train 415997,1
step << Priest
    >>现在需要获得两种 |T135934:0|t|T136057:0|t[冥想] 增益 << Alliance
    >>现在需要获得两种 |T237569:0|t|T136077:0|t[冥想] 增益 << Horde
    >>在以下地点之一输入 /kneel：北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡的秘法区 << Human/Dwarf
    >>在月亮井旁输入 /kneel，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>在任意墓地输入 /kneel << Undead
    >>在任意洛阿祭坛前输入 /kneel，例如森金村或贫瘠之地十字路口的祭坛 << Troll
    >>要获得第二种 |T135934:0|t|T136057:0|t[冥想] 增益，需在拥有与你不同的 |T135934:0|t|T136057:0|t[冥想] 增益的牧师面前输入 /kneel，并让对方以你为目标输入 /pray << Alliance
    >>要获得第二种 |T237569:0|t|T136077:0|t[冥想] 增益，需在拥有与你不同的 |T135934:0|t|T136057:0|t[冥想] 增益的牧师面前输入 /kneel，并让对方以你为目标输入 /pray << Horde
    .train 415997 >> |cRXP_WARN_获得两种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_七大访客的预言|r] |cRXP_WARN_学习|r |T135911:0|t[灵魂之力] << Alliance
    .train 415997 >> |cRXP_WARN_获得两种|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_七大访客的预言|r] |cRXP_WARN_学习|r |T135911:0|t[灵魂之力] << Horde
    .use 211531
    .itemcount 211531,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#name Power Word: Barrier - 22 (Redridge Mountains)
#title 真言术：障
#displayname 真言术：障 - 22（赤脊山）
step << Priest
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Redridge Mountains >> 前往赤脊山
    .train 425213,1
step << Priest
    .goto Redridge Mountains,67.2,53.6
    .goto Redridge Mountains,68.8,57.4
    >>击杀|cRXP_ENEMY_黑石暗影法师|r，拾取|T135975:0|t[|cRXP_FRIENDLY_奴役都市的预言|r]
    >>|cRXP_ENEMY_黑石暗影法师|r |cRXP_WARN_是22–23级精英，请组队完成此步骤|r
    .collect 211530,1 -- Prophecy of a City Enthralled (1)
    .mob 黑石暗影法师
    .train 425213,1
step << Priest
    >>现在需要取得两种不同的|T135934:0|t|T136057:0|t[冥想]增益 << Alliance
    >>现在需要取得两种不同的|T237569:0|t|T136077:0|t[冥想]增益 << Horde
    >>在北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或铁炉堡的秘法区，选择一处输入/kneel << Human/Dwarf
    >>在任意月亮井内输入/kneel，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>在任意墓地输入/kneel << Undead
    >>在任意洛阿祭坛前输入/kneel，例如森金村或贫瘠之地十字路口的祭坛 << Troll
    >>要取得第二种|T135934:0|t|T136057:0|t[冥想]增益，先在拥有与你不同|T135934:0|t|T136057:0|t[冥想]的牧师面前输入/kneel，再请对方以你为目标输入/pray << Alliance
    >>要取得第二种|T237569:0|t|T136077:0|t[冥想]增益，先在拥有与你不同|T135934:0|t|T136057:0|t[冥想]的牧师面前输入/kneel，再请对方以你为目标输入/pray << Horde
    .train 425213 >> |cRXP_WARN_同时拥有两种|r |T135934:0|t|T136057:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_奴役都市的预言|r] |cRXP_WARN_学习|r |T253400:0|t[真言术：障] << Alliance
    .train 425213 >> |cRXP_WARN_同时拥有两种|r |T237569:0|t|T136077:0|t[冥想] |cRXP_WARN_增益后，使用|r |T135975:0|t[|cRXP_FRIENDLY_奴役都市的预言|r] |cRXP_WARN_学习|r |T253400:0|t[真言术：障] << Horde
    .use 211530
    .itemcount 211530,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Circle of Healing - 25 (Duskwood)
#title 治疗之环
#displayname 治疗之环 - 25（暮色森林）
step << Priest
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    .goto Duskwood,50.4,70.8,60,0
    .goto Duskwood,50.2,76.4
    >>击杀|cRXP_ENEMY_迪菲亚夜行者|r、|cRXP_ENEMY_迪菲亚夜贼|r和|cRXP_ENEMY_迪菲亚附魔师|r，拾取|T135736:0|t[|cRXP_LOOT_黑暗洞察|r]
    .collect 211528,1 -- Dark Insight (1)
    .mob 迪菲亚夜行者
    .mob 迪菲亚夜贼
    .mob 迪菲亚附魔师
    .train 402859,1
step << Priest
    .goto Duskwood,91.11,30.58
    .use 211528 >> |cRXP_WARN_使用|r |T135736:0|t[|cRXP_LOOT_黑暗洞察|r] |cRXP_WARN_；需站在塔后的隐蔽坟墓旁，即可获得|r |T135975:0|t[|cRXP_FRIENDLY_千光预言|r]
    .collect 211490,1 -- Prophecy of a Thousand Lights (1)
    .train 402859,1
step << Priest
    >>你现在必须获得两种|T135934:0|t|T136057:0|t[冥想]增益 << Alliance
    >>你现在必须获得两种|T237569:0|t|T136077:0|t[冥想]增益 << Horde
    >>你必须在以下地点之一输入 /kneel 跪下：北郡修道院、暴风城大教堂、安威玛尔或洛克莫丹的圣光祭坛，或者铁炉堡的秘法区 << Human/Dwarf
    >>你必须在月亮井旁输入 /kneel 跪下，例如暴风城或达纳苏斯的月亮井 << NightElf
    >>你必须在任意墓地输入 /kneel 跪下 << Undead
    >>你必须在任意洛阿祭坛旁输入 /kneel 跪下，例如森金村或贫瘠之地十字路口的祭坛 << Troll
    >>要获得第二种|T135934:0|t|T136057:0|t[冥想]增益，你必须在一位拥有与你不同的|T135934:0|t|T136057:0|t[冥想]增益的牧师面前输入 /kneel 跪下；对方需以你为目标输入 /pray 祈祷 << Alliance
    >>要获得第二种|T237569:0|t|T136077:0|t[冥想]增益，你必须在一位拥有与你不同的|T135934:0|t|T136057:0|t[冥想]增益的牧师面前输入 /kneel 跪下；对方需以你为目标输入 /pray 祈祷 << Horde
    .train 402859 >> |cRXP_WARN_获得两种|r|T135934:0|t|T136057:0|t[冥想]|cRXP_WARN_增益后，使用|r|T135975:0|t[|cRXP_FRIENDLY_千光预言]|r|cRXP_WARN_学习|r|T135887:0|t[治疗之环] << Alliance
    .train 402859 >> |cRXP_WARN_获得两种|r|T237569:0|t|T136077:0|t[冥想]|cRXP_WARN_增益后，使用|r|T135975:0|t[|cRXP_FRIENDLY_千光预言]|r|cRXP_WARN_学习|r|T135887:0|t[治疗之环] << Horde
    .use 211490
    .itemcount 211490,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Cobra Strikes - 25 (Hillsbrad Foothills)
#title 眼镜蛇打击
    --Rune of Cobra Strikes
#displayname 眼镜蛇打击 - 25（希尔斯布莱德丘陵）
step
    .train 425759,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #season 2
    #completewith next
    .zone Hillsbrad Foothills >>前往希尔斯布莱德丘陵（例如从幽暗城穿过银松森林） << Horde
    .zone Hillsbrad Foothills >>前往希尔斯布莱德丘陵（例如从湿地向北） << Alliance
step
    #season 2
    #loop
    .goto Hillsbrad Foothills,58.2,19.6,40,0
    .goto Hillsbrad Foothills,57.5,36.4,50,0
    .goto Hillsbrad Foothills,51.1,46.4,40,0
    >>寻找|cRXP_FRIENDLY_吉克希尔|r。他在塔伦米尔和南海镇之间巡逻。向他购买|T134041:0|t[淡水钳嘴龟诱饵]
    .collect 210410,1 --Freshwater Snapper Bait (1)
    .target 吉克希尔
    .train 425759,1
step
    #season 2
    .goto Hillsbrad Foothills,61.05,33.36
    .use 210410 >>在池塘中央的小船上使用|T134041:0|t[淡水钳嘴龟诱饵]
    >>击杀出现的|cRXP_ENEMY_科阿图尔|r（25级精英），从他身上拾取|T134419:0|t[|cRXP_FRIENDLY_眼镜蛇打击符文|r]
    .collect 210596,1 --Rune of Cobra Strikes (1)
    .mob 科阿图尔
    .train 425759,1
step
    #season 2
    .train 425759 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_眼镜蛇打击符文|r] |cRXP_WARN_学习|r |T236177:0|t[眼镜蛇打击]
    .use 210596
    .itemcount 210596,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Kill Shot - 25 (Multiple Zones)
#title 夺命射击
#displayname 夺命射击 - 25（多个地区）
step
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith WyvernWrangling
    >>|cRXP_BUY_从拍卖行购买一根|r |T135144:0|t[强效魔法杖] |cRXP_BUY_|r
    .collect 11288,1 --Greater Magic Wand (1)
    .train 410111,1
step
    .train 410111,1
    #season 2
    #completewith next
    +|cRXP_WARN_开始寻找哀嚎洞穴的队伍|r
step
    .train 410111,1
    #season 2
    #completewith next
    .goto Kalimdor,51.89,54.77,20,0
    .goto Kalimdor,51.95,54.56,20,0
    .goto Kalimdor,52.27,54.65,30,0
    .goto Kalimdor,52.40,55.18
    .zone 279 >> 进入哀嚎洞穴
step
    #season 2
    >>击杀|cRXP_ENEMY_吞噬者穆坦努斯|r，拾取|T132775:0|t[|cRXP_LOOT_催眠水晶|r]
    .collect 209838,1 --Hypnotic Crystal (1)
    .mob 吞噬者穆坦努斯
    .train 410111,1
step
    .train 410111,1
    #season 2
    #completewith next
    .zone Ashenvale >>前往灰谷
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
    >>击杀|cRXP_ENEMY_蓟皮萨满祭司|r，拾取|T237004:0|t[|cRXP_LOOT_狂野魔法精华|r]
    .collect 209841,1 --Wild Magic Essence (1)
    .mob 蓟皮萨满祭司
    .train 410111,1
step
    #season 2
    .use 209841 >>使用|T237004:0|t[|cRXP_LOOT_狂野魔法精华|r]制作|T237489:0|t[|cRXP_LOOT_多瘤的狂野魔法魔杖|r]
    .collect 209840,1 --Gnarled Wand of Wild Magic (1)
    .train 410111,1
step
    .train 410111,1
    #season 2
    #completewith WyvernWrangling
    .zone Stonetalon Mountains >>前往石爪山脉
step
    #season 2
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在石爪山脉与|cRXP_FRIENDLY_吉克索·疯箭|r交谈
    .accept 78114 >>接受任务“驯服野生双足飞龙”
    .target 吉克索·疯箭
    .train 410111,1
step
    #season 2
    #label WyvernWrangling
    .goto Stonetalon Mountains,60.71,62.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉克索·疯箭|r交谈
    .turnin 78114 >>交还任务“驯服野生双足飞龙”
    .accept 78121 >>接受任务“驯服一只野生双足飞龙”
    .target 吉克索·疯箭
    .train 410111,1
step
    #season 2
    .goto Stonetalon Mountains,60.70,62.33
    >>留在|cRXP_FRIENDLY_吉克索·疯箭|r身旁，观看他驯服一只|cRXP_ENEMY_双足飞龙|r
    .turnin 78121 >>交还任务“驯服一只野生双足飞龙”
    .target 吉克索·疯箭
    .train 410111,1
step
    #season 2
    .train 410111 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r] |cRXP_WARN_学习|r |T236174:0|t[夺命射击]
    .use 209852
    .itemcount 209852,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
#group RestedXP Rune & Books Guide
<< SoD
#subgroup Chest << Shaman
#subgroupdisplayname 胸甲 << Shaman
#subgroup Belt << Warrior/Hunter/Mage/Paladin
#subgroupdisplayname 腰带 << Warrior/Hunter/Mage/Paladin
#subgroup Boots << Warlock/Priest/Rogue/Druid
#subgroupdisplayname 靴子 << Warlock/Priest/Rogue/Druid
#name Dark Rider Runes
#title 救赎者之魂 << Priest
#title 近战专家 << Hunter
#title 丛林之王 << Druid
#title 精准猛击 << Warrior
#title 双手精通 << Shaman
#title 恶魔知识 << Warlock
#title 圣光灌注 << Paladin
#title 飞弹连射 << Mage
#title 埋伏 << Rogue
#displayname 救赎者之魂 - 40（艾泽拉斯） << Priest
#displayname 近战专家 - 40（艾泽拉斯） << Hunter
#displayname 丛林之王 - 40（艾泽拉斯） << Druid
#displayname 精准猛击 - 40（艾泽拉斯） << Warrior
#displayname 双手精通 - 40（艾泽拉斯） << Shaman
#displayname 恶魔知识 - 40（艾泽拉斯） << Warlock
#displayname 圣光灌注 - 40（艾泽拉斯） << Paladin
#displayname 飞弹连射 - 40（艾泽拉斯） << Mage
#displayname 埋伏 - 40（艾泽拉斯） << Rogue
#displayname 黑暗骑士符文
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
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith Sigil
    +|cRXP_WARN_获取此符文前强烈建议先组队。你需要击杀41级精英，总共7次|r
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
    #completewith next
    .zone Deadwind Pass >>前往逆风小径
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探金娜|r交谈，取得|T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r]
    .skipgossip 218920,1
    .collect 216941,1
    .target 密探金娜
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
    .equip 13,216941 >> |cRXP_WARN_装备|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r]
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216945,<1
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
    #completewith next
    .goto Deadwind Pass,45.04,28.88
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_奇特的达拉然圣物|r
    .use 216941
    .collect 216945,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Swamp of Sorrows >>前往悲伤沼泽
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216948,<1
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
    #completewith next
    .goto Swamp of Sorrows,69,28
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_古怪的达拉然圣物|r
    .use 216941
    .collect 216948,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Duskwood >>前往暮色森林
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216946,<1
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
    #completewith next
    .goto Duskwood,23,47
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_烁光的达拉然圣物|r
    .use 216941
    .collect 216946,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Badlands >>前往荒芜之地
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216951,<1
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
    #completewith next
    .goto Badlands,58,54
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_湿滑的达拉然圣物|r
    .use 216941
    .collect 216951,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Arathi Highlands >>前往阿拉希高地
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216947,<1
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
    #completewith next
    .goto Arathi Highlands,60,40
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_嗡鸣的达拉然圣物|r
    .use 216941
    .collect 216947,1
    .mob 黑暗骑士
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
    #completewith next
    .zone The Barrens >>前往贫瘠之地
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216949,<1
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
    #completewith next
    .goto The Barrens,52,36
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_沉重的达拉然圣物|r
    .use 216941
    .collect 216949,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Desolace >>前往凄凉之地
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
    .aura 438288 >> |cRXP_WARN_前往箭头所指位置；靠近时会获得|r |T237534:0|t[黑暗气息] |cRXP_WARN_增益|r
    >>|cRXP_WARN_必须下坐骑才能获得此增益！|r
    >>|cRXP_WARN_确保已将|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_装备好|r
    .use 216941
    .itemcount 216950,<1
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
    #completewith next
    .goto Desolace,65,25
    .cast 438305 >> |cRXP_WARN_使用|r |T338784:0|t[|cRXP_FRIENDLY_埃瑞丁的魔符|r] |cRXP_WARN_显露出|r |cRXP_ENEMY_黑暗骑士|r
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
    >>击杀|cRXP_ENEMY_黑暗骑士|r，从他身上拾取|cRXP_LOOT_阴森的达拉然圣物|r
    .use 216941
    .collect 216950,1
    .mob 黑暗骑士
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
    #completewith next
    .zone Deadwind Pass >>前往逆风小径
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探金娜|r交谈
    .turnin 80147 >>交还达拉然圣物任务（交付烁光的达拉然圣物）
    .turnin 80149 >>交还达拉然圣物任务（交付古怪的达拉然圣物）
    .turnin 80098 >>交还达拉然圣物任务（交付奇特的达拉然圣物）
    .turnin 80152 >>交还达拉然圣物任务（交付湿滑的达拉然圣物）
    .turnin 80148 >>交还达拉然圣物任务（交付嗡鸣的达拉然圣物）
    .turnin 80150 >>交还达拉然圣物任务（交付沉重的达拉然圣物）
    .turnin 80151 >>交还达拉然圣物任务（交付阴森的达拉然圣物）
    .accept 80120 >>接受任务“为达拉然服务”
    .turnin 80120 >>交还任务“为达拉然服务”
    .target 密探金娜
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
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T135791:0|t[|cRXP_FRIENDLY_璀璨顿悟|r] << Priest
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_灌注符文|r] << Paladin
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134939:0|t[|cRXP_FRIENDLY_法术笔记：飞弹连射|r] << Mage
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_短兵相接符文|r] << Hunter
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_丛林之王符文|r] << Druid
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_无情精准符文|r] << Warrior
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_禁断知识符文|r] << Warlock
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_袭击者符文|r] << Rogue
    >>打开|T133666:0|t[|cRXP_FRIENDLY_补给袋|r]，取得|T134419:0|t[|cRXP_FRIENDLY_双手精通符文|r] << Shaman
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
    .train 425312 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_璀璨顿悟|r] |cRXP_WARN_学习|r |T132864:0|t[救赎者之魂] << Priest
    .train 426180 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灌注符文|r] |cRXP_WARN_学习|r |T236254:0|t[圣光灌注] << Paladin
    .train 401763 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：飞弹连射|r] |cRXP_WARN_学习|r |T236221:0|t[飞弹连射] << Mage
    .train 416086 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_短兵相接符文|r] |cRXP_WARN_学习|r |T132394:0|t[近战专家] << Hunter
    .train 424765 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_丛林之王符文|r] |cRXP_WARN_学习|r |T236159:0|t[丛林之王] << Druid
    .train 416005 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无情精准符文|r] |cRXP_WARN_学习|r |T134377:0|t[精准猛击] << Warrior
    .train 416014 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_禁断知识符文|r] |cRXP_WARN_学习|r |T136172:0|t[恶魔知识] << Warlock
    .train 415926 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_袭击者符文|r] |cRXP_WARN_学习|r |T236286:0|t[埋伏] << Rogue
    .train 436368 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_双手精通符文|r] |cRXP_WARN_学习|r |T135145:0|t[双手精通] << Shaman
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< SoD
#group RestedXP Rune & Books Guide
#subgroup Belt << Druid/Priest/Rogue/Warlock
#subgroupdisplayname 腰带 << Druid/Priest/Rogue/Warlock
#subgroup Boots << Mage/Shaman/Hunter/Paladin/Warrior
#subgroupdisplayname 靴子 << Mage/Shaman/Hunter/Paladin/Warrior
#name Desolace Chain Runes
#title 心灵尖刺 << Priest
#title 陷阱发射器 << Hunter
#title 日月之蚀 << Druid
#title 狂怒回复 << Warrior
#title 先祖复苏 << Shaman
#title 影与焰 << Warlock
#title 战争艺术 << Paladin
#title 冰冷智慧 << Mage
#title 剧毒之刃 << Rogue
#displayname 心灵尖刺 - 35（艾泽拉斯） << Priest
#displayname 陷阱发射器 - 35（艾泽拉斯） << Hunter
#displayname 日月之蚀 - 35（艾泽拉斯） << Druid
#displayname 狂怒回复 - 35（艾泽拉斯） << Warrior
#displayname 先祖复苏 - 35（艾泽拉斯） << Shaman
#displayname 影与焰 - 35（艾泽拉斯） << Warlock
#displayname 战争艺术 - 35（艾泽拉斯） << Paladin
#displayname 冰冷智慧 - 35（艾泽拉斯） << Mage
#displayname 剧毒之刃 - 35（艾泽拉斯） << Rogue
#displayname 凄凉之地任务链符文
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
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Desolace >>前往凄凉之地
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
    >>点击 |cRXP_PICK_熄灭的营火|r
    .goto Desolace,47.532,54.605
    .accept 79229 >>接受任务 高岭越货案
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比布里·弗斯巴克|r交谈
    .goto Desolace,62.314,38.965
    .turnin 79229 >>交还任务 高岭越货案
    .accept 79235 >>接受任务 逍遥法外
    .target 比布里·弗斯巴克
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
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷 |cRXP_WARN_（藏宝海湾）|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托卡尔|r交谈
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79235 >>交还任务 逍遥法外
    .accept 79236 >>接受任务 你有故事我有酒
    .target 托卡尔
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
    .target 尼克拉克斯·菲拉莫格
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托卡尔|r交谈
    .goto Stranglethorn Vale,26.988,77.284
    .turnin 79236 >>交还任务 你有故事我有酒
    .accept 79242 >>接受任务 盗岂有道
    .target 托卡尔
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
    #completewith next
    .zone Wetlands >>前往阿拉希高地与湿地的交界处
step
    .goto Wetlands,58.320,6.927
    .cast 6477 >>进入水中的 |cRXP_PICK_划艇|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莱丽·暮羽|r交谈, 以获得 |cRXP_LOOT_伊莱丽的钥匙|r
    .complete 79242,1 --Found Illari Duskfeather
    .collect 212347,1,79242,1 --Illari's Key
    .skipgossip 215655,1,1,2
    .target 伊莱丽·暮羽
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莱丽·暮羽|r交谈. 之后你将不得不与她战斗
    .complete 79242,1 --Found Illari Duskfeather
    .skipgossip 215655,1,1,1
    .target 伊莱丽·暮羽
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
    >>击败 |cRXP_ENEMY_伊莱丽·暮羽|r，打开她留在地上的 |cRXP_PICK_袋子|r，拾取 |cRXP_LOOT_伊莱丽的钥匙|r。
    .collect 212347,1,79242,1 --Illari's Key
    .skipgossip 215655,1,1,1
    .mob 伊莱丽·暮羽
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莱丽·暮羽|r交谈
    .complete 79242,1 --Found Illari Duskfeather
    .skipgossip
    .target 伊莱丽·暮羽
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
    >>点击地上的 |cRXP_PICK_伊莱丽的战利品箱|r
    .goto Arathi Highlands,94.154,69.266
    .turnin 79242 >>交还任务 盗岂有道
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
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T135791:0|t[|cRXP_FRIENDLY_灵智顿悟|r] << Priest
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_征战符文|r] << Paladin
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：冰冷智慧|r] << Mage
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_布陷大师符文|r] << Hunter
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_日月之蚀符文|r] << Druid
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_狂怒愈体符文|r] << Warrior
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_灼烧黑暗符文|r] << Warlock
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_剧毒锋刃符文|r] << Rogue
    >>打开 |T133876:0|t[|cRXP_LOOT_镶嵌宝石的盒子|r]，取得 |T134419:0|t[|cRXP_FRIENDLY_先祖复苏符文|r] << Shaman
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
    .train 431663 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_灵智顿悟|r] |cRXP_WARN_学习|r |T136181:0|t[心灵尖刺] << Priest
    .train 416031 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_征战符文|r] |cRXP_WARN_学习|r |T236246:0|t[战争艺术] << Paladin
    .train 401752 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：冰冷智慧|r] |cRXP_WARN_学习|r |T236206:0|t[冰冷智慧] << Mage
    .train 410118 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_布陷大师符文|r] |cRXP_WARN_学习|r |T133882:0|t[陷阱发射器] << Hunter
    .train 410029 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_日月之蚀符文|r] |cRXP_WARN_学习|r |T236151:0|t[日月之蚀] << Druid
    .train 403467 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂怒愈体符文|r] |cRXP_WARN_学习|r |T132345:0|t[狂怒回复] << Warrior
    .train 426452 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_灼烧黑暗符文|r] |cRXP_WARN_学习|r |T135823:0|t[影与焰] << Warlock
    .train 425102 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_剧毒锋刃符文|r] |cRXP_WARN_学习|r |T236270:0|t[剧毒之刃] << Rogue
    .train 425883 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_先祖复苏符文|r] |cRXP_WARN_学习|r |T237571:0|t[先祖复苏] << Shaman
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
    .cast 6477 >>乘坐水中的 |cRXP_PICK_划艇|r 返回阿拉希高地
    .subzoneskip 308,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< SoD
#group RestedXP Rune & Books Guide
#subgroup Spell Books
#subgroupdisplayname 技能书
#name Spell Book Runes
#title 智慧延展 << Mage
#title 蝰蛇守护/雄狮之心 << Hunter
#title 灵魂收割/召唤传送门/邪甲术 << Warlock
#title 转嫁/玄秘毒药/迟钝毒药/解离毒药/萎缩毒药 << Rogue
#title 暗影魔/强化坚韧 << Priest
#title 强化恢复/起死回生/野性深远 << Druid
#title 命令怒吼/肉钩 << Warrior
#title 驱魔人/殉道圣印/强化祝福 << Paladin
#title 图腾投射/萨满之怒 << Shaman
#displayname 智慧延展（暴风城） << Alliance Mage
#displayname 智慧延展（奥格瑞玛） << Horde Mage
#displayname 蝰蛇守护/雄狮之心（暴风城） << Alliance Hunter
#displayname 蝰蛇守护/雄狮之心（奥格瑞玛） << Horde Hunter
#displayname 灵魂收割/召唤传送门/邪甲术（暴风城） << Alliance Warlock
#displayname 灵魂收割/召唤传送门/邪甲术（奥格瑞玛） << Horde Warlock
#displayname 转嫁/玄秘毒药/迟钝毒药/解离毒药/萎缩毒药（暴风城） << Alliance Rogue
#displayname 转嫁/玄秘毒药/迟钝毒药/解离毒药/萎缩毒药（奥格瑞玛） << Horde Rogue
#displayname 暗影魔/强化坚韧（暴风城） << Alliance Priest
#displayname 暗影魔/强化坚韧（奥格瑞玛） << Horde Priest
#displayname 强化恢复/起死回生/野性深远（暴风城） << Alliance Druid
#displayname 强化恢复/起死回生/野性深远（奥格瑞玛） << Horde Druid
#displayname 命令怒吼/肉钩（暴风城） << Alliance Warrior
#displayname 命令怒吼/肉钩（奥格瑞玛） << Horde Warrior
#displayname 驱魔人/殉道圣印/强化祝福（暴风城） << Paladin
#displayname 图腾投射/萨满之怒（奥格瑞玛） << Shaman
#displayname 技能书与符文
step
    #completewith BuyBook
    >>|cRXP_WARN_现在可以在暴风城用金币购买技能书，无需再去血色修道院获取。|r << Alliance
    >>|cRXP_WARN_现在可以在奥格瑞玛用金币购买技能书，无需再去血色修道院获取。|r << Horde
    .zone Stormwind City >> 前往暴风城 << Alliance
    .zone Orgrimmar >> 前往奥格瑞玛 << Horde
step << Alliance
    #optional
    #completewith next
    .goto Stormwind City,70.347,27.208,15,0
    .goto Stormwind City,72.005,21.542,20 >> 前往暴风要塞
step
    #label BuyBook
    .goto Stormwind City,74.182,7.465 << Alliance
    .goto Orgrimmar,38.923,38.398 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔顿·西弗|r 交谈 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔·孤树|r 交谈 << Horde
    .train 438040 >>|cRXP_WARN_购买并使用|r |T133735:0|t[|cRXP_LOOT_转嫁手册|r] |cRXP_WARN_学习|r |T135425:0|t[转嫁] << Rogue
    .train 436949 >>|cRXP_WARN_购买并使用|r |T133736:0|t[|cRXP_LOOT_秘典：智慧延展|r] |cRXP_WARN_学习|r |T236513:0|t[智慧延展] << Mage
    .train 436956 >>|cRXP_WARN_购买并使用|r |T134914:0|t[|cRXP_LOOT_活页：野性深远|r] |cRXP_WARN_学习|r |T132124:0|t[野性深远] << Druid
    .train 417123 >>|cRXP_WARN_购买并使用|r |T134914:0|t[|cRXP_LOOT_活页：强化恢复|r] |cRXP_WARN_学习|r |T136073:0|t[强化恢复] << Druid
    .train 437138 >>|cRXP_WARN_购买并使用|r |T134914:0|t[|cRXP_LOOT_活页：起死回生|r] |cRXP_WARN_学习|r |T132132:0|t[起死回生] << Druid
    .train 409580 >>|cRXP_WARN_购买并使用|r |T133739:0|t[|cRXP_LOOT_论述：雄狮之心|r] |cRXP_WARN_学习|r |T132185:0|t[雄狮之心] << Hunter
    .train 415423 >>|cRXP_WARN_购买并使用|r |T133739:0|t[|cRXP_LOOT_论述：蝰蛇守护|r] |cRXP_WARN_学习|r |T132160:0|t[蝰蛇守护] << Hunter
    .train 415076 >>|cRXP_WARN_购买并使用|r |T133745:0|t[|cRXP_LOOT_论述：驱魔人|r] |cRXP_WARN_学习|r |T135956:0|t[驱魔人] << Paladin
    .train 407798 >>|cRXP_WARN_购买并使用|r |T133745:0|t[|cRXP_LOOT_论述：殉道|r] |cRXP_WARN_学习|r |T135961:0|t[殉道圣印] << Paladin
    .train 435984 >>|cRXP_WARN_购买并使用|r |T133745:0|t[|cRXP_LOOT_圣约：强化祝福|r] |cRXP_WARN_学习|r |T236248:0|t[强化祝福] << Paladin
    .train 401977 >>|cRXP_WARN_购买并使用|r |T237162:0|t[|cRXP_LOOT_卷轴：暗影魔|r] |cRXP_WARN_学习|r |T136199:0|t[暗影魔] << Priest
    .train 436951 >>|cRXP_WARN_购买并使用|r |T237162:0|t[|cRXP_LOOT_卷轴：强化坚韧|r] |cRXP_WARN_学习|r |T237543:0|t[强化坚韧] << Priest
    .train 437032 >>|cRXP_WARN_购买并使用|r |T133733:0|t[|cRXP_LOOT_魔典：灵魂收割|r] |cRXP_WARN_学习|r |T132851:0|t[灵魂收割] << Warlock
    .train 437169 >>|cRXP_WARN_购买并使用|r |T133733:0|t[|cRXP_LOOT_魔典：召唤传送门|r] |cRXP_WARN_学习|r |T134423:0|t[召唤传送门] << Warlock
    .train 403619 >>|cRXP_WARN_购买并使用|r |T133733:0|t[|cRXP_LOOT_魔典：邪甲术|r] |cRXP_WARN_学习|r |T136156:0|t[邪甲术] << Warlock
    .train 403215 >>|cRXP_WARN_购买并使用|r |T133741:0|t[|cRXP_LOOT_手册：命令怒吼|r] |cRXP_WARN_学习|r |T132351:0|t[命令怒吼] << Warrior
    .train 403228 >>|cRXP_WARN_购买并使用|r |T133741:0|t[|cRXP_LOOT_肉钩手册|r] |cRXP_WARN_学习|r |T132507:0|t[肉钩] << Warrior
    .train 425336 >>|cRXP_WARN_购买并使用|r |T133747:0|t[|cRXP_LOOT_启示：萨满之怒|r] |cRXP_WARN_学习|r |T136088:0|t[萨满之怒] << Shaman
    .train 437009 >>|cRXP_WARN_购买并使用|r |T133747:0|t[|cRXP_LOOT_启示：图腾投射|r] |cRXP_WARN_学习|r |T310733:0|t[图腾投射] << Shaman
    .use 216738 << Rogue -- Manual of Redirect
    .use 216740 << Mage -- Tome of Expanded Intellect
    .use 216744 << Priest -- Scroll of Increased Fortitude
    .use 216745 << Priest -- Scroll of Shadowfiend
    .use 216746 << Warrior -- Handbook of Commanding Shout
    .use 226403 << Warrior -- Handbook of Meathook
    .use 216747 << Warlock -- Grimoire of Soul Harvesting
    .use 216748 << Warlock -- Grimoire of Portal of Summoning
    .use 228797 << Warlock -- Grimoire of Fel Armor
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
    .target 米尔顿·西弗 << Alliance
    .target 佐尔·孤树 << Horde

step << Rogue
    .xp <54,1
    .goto Stormwind City,74.182,7.465 << Alliance
    .goto Orgrimmar,38.923,38.398 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔顿·西弗|r 交谈 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔·孤树|r 交谈 << Horde
    >>|cRXP_WARN_玄秘毒药手册对应的技能需要54级|r
    .train 458822 >>|cRXP_WARN_购买并使用|r |T133735:0|t[|cRXP_LOOT_玄秘毒药手册|r] |cRXP_WARN_学习|r |T135935:0|t[玄秘毒药 I] << Rogue
    .use 226396 << Rogue -- Manual of Occult Poison
    .target 米尔顿·西弗 << Alliance
    .target 佐尔·孤树 << Horde

step << Rogue
    .xp <60,1
    .goto Stormwind City,74.182,7.465 << Alliance
    .goto Orgrimmar,38.923,38.398 << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔顿·西弗|r 交谈 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔·孤树|r 交谈 << Horde
    >>|cRXP_WARN_麻痹毒药手册、解离毒药手册和萎缩毒药手册对应的技能需要60级|r
    .train 439505 >>|cRXP_WARN_购买并使用|r |T133735:0|t[|cRXP_LOOT_麻痹毒药手册|r] |cRXP_WARN_学习|r |T132098:0|t[迟钝毒药] << Rogue
    .train 439500 >>|cRXP_WARN_购买并使用|r |T133735:0|t[|cRXP_LOOT_解离毒药手册|r] |cRXP_WARN_学习|r |T132108:0|t[解离毒药] << Rogue
    .train 439503 >>|cRXP_WARN_购买并使用|r |T133735:0|t[|cRXP_LOOT_萎缩毒药手册|r] |cRXP_WARN_学习|r |T132100:0|t[萎缩毒药] << Rogue
    .use 226394 << Rogue -- Manual of Atrophic Poison
    .use 226397 << Rogue -- Manual of Sebacious Poison
    .use 226395 << Rogue -- Manual of Numbing Poison
    .target 米尔顿·西弗 << Alliance
    .target 佐尔·孤树 << Horde
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#name Bugcatcher Runes
#title 翼龙打击 << Hunter
#title 生存本能 << Druid
#displayname 翼龙打击 - 35（艾泽拉斯） << Hunter
#displayname 生存本能 - 35（艾泽拉斯） << Druid
#displayname 捕虫符文
step
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Swamp of Sorrows >>前往悲伤沼泽
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    .goto Swamp of Sorrows,25.140,54.034
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛丽斯·韦伯|r交谈
    >>|cRXP_BUY_购买|r |T133653:0|t[昆虫学入门工具包]
    .collect 213565,1 --Entomology Starter Kit (1x)
    .target 阿玛丽斯·韦伯
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
    .zone Stranglethorn Vale >>前往荆棘谷
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #loop
    .goto Stranglethorn Vale,43.8,18.6,20,0
    .goto Stranglethorn Vale,45.2,19.6,20,0
    .goto Stranglethorn Vale,44.2,22.0,20,0
    .goto Stranglethorn Vale,45.6,23.0,20,0
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_捕捉|r |cRXP_ENEMY_树栖狼蛛|r
    >>|cRXP_WARN_它们在树桩上|r
    .use 213562
    .collect 213566,1 --Arbor Tarantula Specimen (1x)
    .mob 树栖狼蛛
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Arathi Highlands >>前往阿拉希高地
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
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_捕捉|r |cRXP_ENEMY_干草象鼻虫|r
    >>|cRXP_WARN_任何农场都可能找到它们，谷仓内也有|r
    .use 213562
    .collect 213568,1 --Hay Weevil Specimen (1x)
    .mob 干草象鼻虫
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Desolace >>前往凄凉之地
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #loop
    .goto Desolace,53.0,59.0,0
    .goto Desolace,50.0,55.8,30,0
    .goto Desolace,53.0,59.0,30,0
    .goto Desolace,54.0,62.6,30,0
    >>|cRXP_WARN_使用|r |T134325:0|t[捕虫网] |cRXP_WARN_捕捉|r |cRXP_ENEMY_剔肉蝎|r
    >>|cRXP_WARN_它们出现在科多兽坟场|r
    .use 213562
    .collect 213567,1 --Flesh Picker Specimen (1x)
    .mob 剔肉蝎
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    #completewith next
    .zone Swamp of Sorrows >>前往悲伤沼泽
step
    .train 416089,1 << Hunter
    .train 410027,1 << Druid
    .goto Swamp of Sorrows,25.140,54.034
    >>与 |cRXP_FRIENDLY_阿玛丽斯·韦伯|r 交谈，领取 |T134419:0|t[|cRXP_FRIENDLY_鼓舞符文|r] << Hunter
    >>与 |cRXP_FRIENDLY_阿玛丽斯·韦伯|r 交谈，领取 |T134419:0|t[|cRXP_FRIENDLY_本能符文|r] << Druid
    .collect 213125,1 << Hunter --Rune of Invigoration (1x)
    .collect 213119,1 << Druid --Rune of Instinct (1x)
    .skipgossip 217412,1
    .target 阿玛丽斯·韦伯
step
    .train 416089 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_鼓舞符文|r] |cRXP_WARN_学习|r |T135125:0|t[翼龙打击] << Hunter
    .train 410027 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_本能符文|r] |cRXP_WARN_学习|r |T132266:0|t[生存本能] << Druid
    .use 213125 << Hunter
    .use 213119 << Druid
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< SoD
#group RestedXP Rune & Books Guide
#subgroup Extras
#subgroupdisplayname 额外内容
#subweight -1
#name Cozy Sleeping Bag - 14
#title 舒适的睡袋
#displayname 舒适的睡袋 - 14
step
    #optional
    +|cRXP_WARN_你必须达到14级才能开始获取|r |T133662:0|t[|cRXP_LOOT_舒适的睡袋|r]的任务
    .xp >14,1
step << Alliance
    #completewith next
    .zone Westfall >> 前往西部荒野
step << Alliance
    .goto Westfall,37.413,50.701
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .accept 79008 >> 接任务：……你所找到的纸条
step << Alliance
    #completewith next
    .zone The Barrens >> 前往贫瘠之地
step << Alliance
    .goto The Barrens,46.361,73.904
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .turnin 79008 >> 交任务：……你所找到的纸条
    .accept 79192 >> 接任务：垫脚石
step << Horde
    #completewith next
    .zone The Barrens >> 前往贫瘠之地
step << Horde
    .goto The Barrens,46.361,73.904
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .accept 79007 >> 接任务：……你所找到的纸条
step << Horde
    #completewith next
    .zone Westfall >> 前往西部荒野
step << Horde
    .goto Westfall,37.413,50.701
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .turnin 79007 >> 交任务：……你所找到的纸条
    .accept 79192 >> 接任务：垫脚石
step
    #completewith next
    .zone Stonetalon Mountains >> 前往石爪山脉
step
    #completewith next
    .goto Stonetalon Mountains,50.29,52.94,25 >> 沿烈日石居北侧的土路向上走
step
    .goto Stonetalon Mountains,40.748,52.576
    >>点击箱子上的|cRXP_PICK_垃圾袋|r
    .turnin 79192 >> 交任务：垫脚石
    .accept 79980 >> 接任务：争分夺秒
step
    #completewith next
    .goto Stonetalon Mountains,40.19,50.80,15 >> 沿小路穿过山地
step
    .goto Stonetalon Mountains,39.614,49.783
    >>点击地上的|cRXP_PICK_一堆泥土|r
    .turnin 79980 >> 交任务：争分夺秒
    .accept 79974 >> 接任务：潮湿的活计
step
    #completewith next
    .zone Loch Modan >> 前往洛克莫丹
step
    #completewith next
    .goto Loch Modan,41.01,12.60,50,0
    .goto Loch Modan,42.86,10.36,60,0
    .goto Loch Modan,49.4,12.9,8 >> |cRXP_WARN_登上洛克莫丹水坝的坝墙，小心跳到水坝中央的凸台上，跟随箭头前进|r
step
    .goto Loch Modan,49.421,12.917
    >>点击凸台上的|cRXP_PICK_雕刻塑像|r
    .turnin 79974 >> 交任务：潮湿的活计
    .accept 79975 >> 接任务：鹰之拳
step
    #completewith next
    .goto Hillsbrad Foothills,87.691,48.166,10 >> 前往阿拉希高地与希尔斯布莱德丘陵交界处的索拉丁之墙
step
    #completewith next
    .goto Arathi Highlands,24.132,21.470,7 >> 爬上货车，沿墙向上走
step
    .goto Arathi Highlands,22.466,24.127
    >>点击挂在墙上的|cRXP_PICK_信使行囊|r
    .turnin 79975 >> 交任务：鹰之拳
    .accept 79976 >> 接任务：就是这里
step
    .goto Arathi Highlands,22.466,24.127
    >>点击地上的|cRXP_PICK_草草收起的包裹|r
    .turnin 79976 >> 交任务：就是这里
step
    +|cRXP_WARN_强烈建议将|r |T134057:0|t[|cRXP_LOOT_混调干果|r] |cRXP_WARN_留到更高等级再使用。每次使用|r |T134057:0|t[|cRXP_LOOT_混调干果|r] |cRXP_WARN_都会为角色增加20%的休息经验，因此在更高等级使用收益更高|r
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet << Druid/Shaman/Warrior
#subgroupdisplayname 头盔 << Druid/Shaman/Warrior
#subgroup Bracers << Mage/Hunter/Paladin/Priest/Rogue/Warlock
#subgroupdisplayname 护腕 << Mage/Hunter/Paladin/Priest/Rogue/Warlock
#name Emerald Wardens Runes
#title 熔岩护甲 << Mage
#title 淤血 << Druid
#title T.N.T. << Hunter
#title 强化愤怒之锤 << Paladin
#title 虚空领域 << Priest
#title 穷追猛砍 << Rogue
#title 燃烧 << Shaman
#title 痛苦无常 << Warlock
#title 盾牌精通 << Warrior
#displayname 熔岩护甲 << Mage
#displayname 淤血 << Druid
#displayname T.N.T. << Hunter
#displayname 强化愤怒之锤 << Paladin
#displayname 虚空领域 << Priest
#displayname 穷追猛砍 << Rogue
#displayname 燃烧 << Shaman
#displayname 痛苦无常 << Warlock
#displayname 盾牌精通 << Warrior
#displayname 翡翠守卫声望符文
step
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 427080,1 << Warrior
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    +|cRXP_WARN_前往下列任意区域；每个区域的标记位置都有新阵营的成员，该阵营是|r |cRXP_FRIENDLY_翡翠卫士|r。
    >>暮色森林
    >>灰谷
    >>菲拉斯
    >>辛特兰
    .zoneskip Duskwood
    .zoneskip Ashenvale
    .zoneskip Feralas
    .zoneskip The Hinterlands
step
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 427080,1 << Warrior
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    >>在地图标记处找到 |cRXP_FRIENDLY_翡翠卫士|r 的军需官，向其购买本职业符文
    .goto Duskwood,45.6,51.2,-1
    .goto Ashenvale,89.6,40.6,-1
    .goto Feralas,48.6,12.6,-1
    .goto The Hinterlands,61.4,34.6,-1
    .target 军需官法里纳尔
    .target 军需官基琳
    .target 军需官瓦尔达内
    .target 军需官阿兰德拉
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alacrity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
step
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r] |cRXP_WARN_学习|r |T132886:0|t[虚空领域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：熔岩护甲|r] |cRXP_WARN_学习|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r] |cRXP_WARN_学习|r |T136228:0|t[痛苦无常] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r] |cRXP_WARN_学习|r |T135822:0|t[燃烧] << Shaman
    .train 427080 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_学习|r |T132359:0|t[盾牌精通] << Warrior
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐符文|r] |cRXP_WARN_学习|r |T236269:0|t[穷追猛砍] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r] |cRXP_WARN_学习|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_溅血符文|r] |cRXP_WARN_学习|r |T304501:0|t[淤血] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤头符文|r] |cRXP_WARN_学习|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221511 << Warrior --Rune of the Protector
    .use 221512 << Rogue --Rune of Alacrity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet << Mage/Hunter/Paladin/Priest/Rogue/Warlock
#subgroupdisplayname 头盔 << Mage/Hunter/Paladin/Priest/Rogue/Warlock
#subgroup Bracers << Druid/Shaman/Warrior
#subgroupdisplayname 护腕 << Druid/Shaman/Warrior
#name Wild Offering Runes
#title 进阶结界 << Mage
#title 荷枪实弹 << Hunter
#title 强化庇护 << Paladin
#title 神圣庇护 << Priest
#title 作战潜能 << Rogue
#title 激流 << Shaman
#title 复仇 << Warlock
#title 剑盾猛攻 << Warrior
#title 强化狂暴回复 << Druid
#displayname 进阶结界 - 40（艾泽拉斯） << Mage
#displayname 荷枪实弹 - 40（艾泽拉斯） << Hunter
#displayname 强化庇护 - 40（艾泽拉斯） << Paladin
#displayname 神圣庇护 - 40（艾泽拉斯） << Priest
#displayname 作战潜能 - 40（艾泽拉斯） << Rogue
#displayname 激流 - 40（艾泽拉斯） << Shaman
#displayname 复仇 - 40（艾泽拉斯） << Warlock
#displayname 剑盾猛攻 - 40（艾泽拉斯） << Warrior
#displayname 强化狂暴回复 - 40（艾泽拉斯） << Druid
#displayname 荒野祭品符文
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Felwood >>前往费伍德森林
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    .goto Felwood,51.6,82.0
    >>与翡翠圣所附近的 |cRXP_FRIENDLY_影齿大使|r 交谈
    .accept 82043 >>接受任务 荒野之神
    .target 影齿大使
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    .isOnQuest 82043
    #optional
    #completewith next
    .goto The Hinterlands,66.27,65.13,0
    >>|cRXP_WARN_完成任务只需队伍中一人携带|r |T134799:0|t[|cRXP_LOOT_荒野呢喃饮剂|r] |cRXP_WARN_。它由辛特兰辛萨罗的精英巨魔掉落；只有剃刀高地队伍里无人持有时才去获取|r
    .collect 221261,1 --Wildwhisper Draught
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    .goto The Barrens,45.5,92.4
    >>组队进入剃刀高地，沿螺旋通道清怪至最终首领 |cRXP_ENEMY_寒冰之王亚门纳尔|r 并击杀。随后让队伍一人使用 |T134799:0|t[|cRXP_LOOT_荒野呢喃饮剂|r] 召出 |cRXP_FRIENDLY_阿迦玛甘之魂|r，与他交谈、交任务并接取后续任务
    .turnin 82043 >>交任务：荒野之神
    .accept 82044 >>接受任务 荒野之神
    .target 阿迦玛甘之魂
    .mob 寒冰之王亚门纳尔
    .use 221261
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    >>你已获得 |T237378:0|t[|cRXP_LOOT_阿迦玛甘之啸|r]。在 |cRXP_PICK_黑石深渊|r、|cRXP_PICK_祖尔法拉克|r 或 |cRXP_PICK_玛拉顿|r 的指定区域使用它，召唤 |cRXP_ENEMY_谵妄古魂|r；每次击杀必掉一份 |T132119:0|t[|cRXP_LOOT_荒野祭品|r]。收集3份交任务；|T132119:0|t[|cRXP_LOOT_荒野祭品|r] 也可向 |cRXP_FRIENDLY_影齿大使|r 购买强力装备，因此除了获取符文所需的3份，还可多刷来兑换装备
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_祖尔法拉克|r |cRXP_WARN_击杀任意3名首领后，可召唤|r |cRXP_ENEMY_谵妄古魂|r |cRXP_WARN_，地点在加兹瑞拉水池附近|r
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_玛拉顿|r |cRXP_WARN_击杀|r |cRXP_ENEMY_瑟莱德丝公主|r |cRXP_WARN_后，可召唤|r |cRXP_ENEMY_谵妄古魂|r |cRXP_WARN_，地点在她的竞技场内|r
    >>|cRXP_WARN_在|r |cRXP_FRIENDLY_黑石深渊|r |cRXP_WARN_击杀|r |cRXP_ENEMY_审讯官格斯塔恩|r、|cRXP_ENEMY_驯犬者格雷布玛尔|r |cRXP_WARN_并完成|r |cRXP_ENEMY_竞技场|r |cRXP_WARN_事件后，可召唤|r |cRXP_ENEMY_谵妄古魂|r |cRXP_WARN_，地点在黑铁大道（通往贝尔加的道路）|r
    >>|cRXP_WARN_提示：|r团队状态也可收集祭品，同一地下城能反复刷。目前最快的是 |cRXP_WARN_组10人团队|r，反复刷 |cRXP_WARN_玛拉顿公主或祖尔法拉克|r
    .complete 82044,1 --Wild Offering 3/3
    .use 221418
    .mob 谵妄古魂
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    #optional
    #completewith next
    .zone Felwood >>返回费伍德森林
step
    .train 431650,1 << Priest
    .train 431461,1 << Druid
    .train 401754,1 << Mage
    .train 416085,1 << Hunter
    .train 429247,1 << Paladin
    .train 432293,1 << Rogue
    .train 410105,1 << Shaman
    .train 426470,1 << Warlock
    .train 427082,1 << Warrior
    .goto Felwood,51.6,82.0
    >>与翡翠圣所附近的 |cRXP_FRIENDLY_影齿大使|r 交谈
    .turnin 82044 >>交任务：荒野之神
    .target 影齿大使
step
    .train 431650 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T237539:0|t[神圣庇护] << Priest
    .train 431461 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T132091:0|t[强化狂暴回复] << Druid
    .train 401754 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T135733:0|t[进阶结界] << Mage
    .train 416085 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T236185:0|t[荷枪实弹] << Hunter
    .train 429247 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T135925:0|t[强化庇护] << Paladin
    .train 432293 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T135673:0|t[作战潜能] << Rogue
    .train 410105 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T252995:0|t[激流] << Shaman
    .train 426470 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T236299:0|t[复仇] << Warlock
    .train 427082 >>|cRXP_WARN_使用刚获得的|r |T236160:0|t[|cRXP_FRIENDLY_海加尔的智慧|r] |cRXP_WARN_学习|r |T236315:0|t[剑盾猛攻] << Warrior
    .use 222962 --Hyjal's Wisdom
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
<<Warlock/Priest/Mage/Paladin
<< SoD
#classic
#group RestedXP Rune & Books Guide
#subgroup Helmet << Warlock
#subgroupdisplayname 头盔 << Warlock
#subgroup Bracers << Paladin/Priest/Mage
#subgroupdisplayname 护腕 << Paladin/Priest/Mage
#name Ley Crystal Runes
#title 闪回 << Mage
#title 净化之力 << Paladin
#title 绝望 << Priest
#title 爆燃 << Warlock
#displayname 闪回 - 45（艾泽拉斯） << Mage
#displayname 净化之力 - 45（艾泽拉斯） << Paladin
#displayname 绝望 - 45（艾泽拉斯） << Priest
#displayname 爆燃 - 45（艾泽拉斯） << Warlock
#displayname 魔网水晶符文
step
    .train 429309,1 << Mage
    .train 431745,1 << Warlock
    .train 429255,1 << Paladin
    .train 431673,1 << Priest
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #optional
    #completewith next
    >>|cRXP_WARN_获取此符文需要准备4份|r |T134938:0|t[|cRXP_LOOT_地卜术卷轴|r] |cRXP_WARN_，在世界各地四处魔网水晶分别引导一份，召出|r |cRXP_ENEMY_暴怒的魔网行者|r。|cRXP_WARN_也可与持有卷轴的其他法师或持有|r |T132842:0|t[|cRXP_FRIENDLY_世界之核碎块|r] 的术士组队 << Mage
    >>|cRXP_WARN_获取此符文需要准备4块|r |T132842:0|t[|cRXP_FRIENDLY_世界之核碎块|r] |cRXP_WARN_，通过|r |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r] |cRXP_WARN_探险获得；在世界各地四处魔网水晶分别引导一块，召出|r |cRXP_ENEMY_暴怒的魔网行者|r。|cRXP_WARN_也可与持有碎块的其他术士或持有|r |T134938:0|t[|cRXP_LOOT_地卜术卷轴|r] 的法师组队 << Warlock
    +|cRXP_WARN_你无法独自召唤目标；需与持|r |T132842:0|t[|cRXP_FRIENDLY_世界之核碎块|r] |cRXP_WARN_的术士或持|r |T134938:0|t[|cRXP_LOOT_地卜术卷轴|r] |cRXP_WARN_的法师组队|r << Priest/Paladin
    .collect 223171,4 << Mage
    .collect 223168,4 << Warlock
step
    >>逐一前往地图标记的四处魔网水晶，对每处使用 |T134938:0|t[|cRXP_LOOT_地卜术卷轴|r]，也可由队友使用；击败召出的 |cRXP_ENEMY_暴怒的魔网行者|r，拾取 |cRXP_LOOT_魔力结晶|r。四处可按任意顺序完成 << Mage
    >>逐一前往地图标记的四处魔网水晶，对每处使用 |T132842:0|t[|cRXP_FRIENDLY_世界之核碎块|r]，也可由队友使用；击败召出的 |cRXP_ENEMY_暴怒的魔网行者|r，拾取 |cRXP_LOOT_魔力结晶|r。四处可按任意顺序完成 << Warlock
    >>逐一前往地图标记的四处魔网水晶，让队伍里的法师或术士召出 |cRXP_ENEMY_暴怒的魔网行者|r；击败它并拾取 |cRXP_LOOT_魔力结晶|r。四处可按任意顺序完成 << Priest/Paladin
    .goto Azshara,22.0,79.0,-1
    .goto Feralas,57.0,60.0,-1
    .goto The Hinterlands,48.0,59.0,-1
    .goto Searing Gorge,55,65,-1
    .collect 221318,1 >>|T237193:0|t[|cRXP_LOOT_艾萨拉魔力结晶|r]：在 |cRXP_PICK_艾萨拉|r 的凄凉山附近获取
    .collect 221317,1 >>|T237189:0|t[|cRXP_LOOT_菲拉斯魔力结晶|r]：在 |cRXP_PICK_菲拉斯|r 的高原荒野获取
    .collect 221319,1 >>|T237192:0|t[|cRXP_LOOT_黑石魔力结晶|r]：在 |cRXP_PICK_灼热峡谷|r 南部获取
    .collect 221320,1 >>|T237191:0|t[|cRXP_LOOT_辛特兰魔力结晶|r]：在 |cRXP_PICK_辛特兰|r 的祖尔祭坛以北获取
    .mob 暴怒的魔网行者
    .use 223171 << Mage
    .use 223168 << Warlock
    .train 429309,1 << Mage
    .train 431745,1 << Warlock
    .train 429255,1 << Paladin
    .train 431673,1 << Priest
step
    .train 429309 >> |cRXP_WARN_使用收集的四块晶石中的任意一块，将它们合成并学习|r |T132171:0|t[闪回] << Mage
    .train 431745 >> |cRXP_WARN_使用收集的四块晶石中的任意一块，将它们合成并学习|r |T236290:0|t[爆燃] << Warlock
    .train 429255 >> |cRXP_WARN_使用收集的四块晶石中的任意一块，将它们合成并学习|r |T135950:0|t[净化之力] << Paladin
    .train 431673 >> |cRXP_WARN_使用收集的四块晶石中的任意一块，将它们合成并学习|r |T237555:0|t[绝望] << Priest
    .use 221318 --Azshara Leycryst
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Shaman SoD/Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#title 聪慧 << Shaman
#title 饱受折磨 << Priest
#name Mental Dexterity - 43 (Tanaris) << Shaman
#name Pain and Suffering - 43 (Tanaris) << Priest
-- Mental Dexterity/Pain and Suffering
-- PERMOK: Needs better waypoints
#displayname 聪慧 - 43（塔纳利斯） << Shaman
#displayname 饱受折磨 - 43（塔纳利斯） << Priest
step
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Tanaris >>前往塔纳利斯
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    #completewith next
    >>击杀 |cRXP_ENEMY_废土暗法师|r，拾取 |T134939:0|t[|cRXP_LOOT_加密的术士笔记|r]
    .collect 221547,1
    .mob 废土暗法师
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,59.8,24.0,35,0
    .goto Tanaris,65.6,32.2,35,0
    .goto Tanaris,62.4,33.2,30,0
    >>击杀 |cRXP_ENEMY_废土窃贼|r，拾取 |T134329:0|t[|cRXP_LOOT_废土解码表|r]
    .collect 221549,1
    .mob 废土窃贼
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    #loop
    .goto Tanaris,58.4,38.6,40,0
    .goto Tanaris,60.3,23.4,40,0
    .goto Tanaris,66.2,35.0,40,0
    >>击杀 |cRXP_ENEMY_废土暗法师|r，拾取 |T134939:0|t[|cRXP_LOOT_加密的术士笔记|r]
    .collect 221547,1
    .mob 废土暗法师
step
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_使用|r |T134329:0|t[废土解码表] |cRXP_WARN_取得|r |T237018:0|t[解译的术士笔记]
    .goto Tanaris,58.0,36.0
    .use 221549
    .collect 221545,1
step
    .use 221545
    .train 416055,1 << Shaman
    .train 415991,1 << Priest
    >>|cRXP_WARN_站在|r“神秘的召唤卷轴”上。|cRXP_WARN_使用|r |T237018:0|t[解译的术士笔记] |cRXP_WARN_，使用时务必站在卷轴上|r。
    >>击杀 |cRXP_ENEMY_暴怒的虚空行者|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_聪慧符文|r] << Shaman
    >>击杀 |cRXP_ENEMY_暴怒的虚空行者|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_青翠冬日的预言|r] << Priest
    .collect 220610,1 << Shaman
    .collect 221979,1 << Priest
step
    .itemcount 220610,1 << Shaman
    .itemcount 221979,1 << Priest
    .use 220610 << Shaman
    .use 221979 << Priest
    .train 416055 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_聪慧符文|r] |cRXP_WARN_学习|r |T136055:0|t[聪慧] << Shaman
    .train 415991 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_青翠冬日的预言|r] |cRXP_WARN_学习|r |T237567:0|t[饱受折磨] << Priest
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD/Hunter SoD/Rogue SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 远程武器专精
#name Ranged Weapon Specialization - 58 (Eastern Plaguelands)
#displayname 远程武器专精 - 58（东瘟疫之地）
step
    .train 453692,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith rangeSpec
    .zone Eastern Plaguelands >>前往东瘟疫之地
step << Horde
    .train 453692,1
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取|cRXP_FRIENDLY_纳萨诺斯·凋零者|r旁的红书。它位于屋外门的左侧，内含|T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step << Alliance
    .train 453692,1
    #label rangeSpec
    .goto Eastern Plaguelands,26.0,74.0
    >>拾取|cRXP_ENEMY_纳萨诺斯·凋零者|r旁的红书。它位于屋外门的左侧，内含|T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]
    >>|cRXP_WARN_若附近有人，请他暂时引开|r|cRXP_ENEMY_纳萨诺斯·凋零者|r|cRXP_WARN_，让你安全拾取符文|r
    >>|cRXP_WARN_若附近无人，可先被|r|cRXP_ENEMY_纳萨诺斯|r|cRXP_WARN_击杀，再在屋内、他的视线之外复活。随后在屋内使用交互键，或调整视角点击红书，拾取符文|r << Warrior/Rogue
    >>|cRXP_WARN_若附近无人，将宠物设为|r |T136106:0|t[停留] |cRXP_WARN_，停留地点应与|r |cRXP_ENEMY_纳萨诺斯|r |cRXP_WARN_保持足够距离；再命令宠物|r |T132152:0|t[攻击] |cRXP_WARN_，让他转而攻击宠物。他开始以宠物为目标后，把宠物设为|r |T132311:0|t[被动]，|cRXP_WARN_使宠物返回停留地点。走到书旁使用 |T132293:0|t[假死]脱战，再拾取符文|r << Hunter
    .collect 226410,1 --Rune of Ranged Weapon Specialization
step
    .train 453692 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_远程武器专精符文|r]|cRXP_WARN_学习|r|T135490:0|t[远程武器专精]
    .use 226410
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Priest SoD/Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 神圣专精
#name Holy Specialization - 60 (Eastern Plaguelands)
#displayname 神圣专精 - 60（东瘟疫之地）
step
    .train 453702,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    >>|cRXP_WARN_获取此符文需要在精英区域与怪物战斗。可以单人完成，但如果等级较低或装备较差，建议找人协助|r
    .zone Eastern Plaguelands >> 前往东瘟疫之地
step
    .train 453702,1
    >>|cRXP_WARN_如果先推进|r |T135883:0|t[|cRXP_FRIENDLY_联结治疗|r] |cRXP_WARN_任务线，就能同时获取此符文。若想同时获取两个符文，请先查看|r |T135883:0|t[|cRXP_FRIENDLY_联结治疗|r] |cRXP_WARN_符文指南|r << Priest
    .goto Eastern Plaguelands,77.5,81.7,50 >> 前往提尔之手，|cRXP_WARN_注意这里是精英区域|r
step
    .goto Eastern Plaguelands,83.6,78.2
    >>|cRXP_WARN_前往地图标记建筑的图书馆侧翼，寻找书架顶部的一本书。拾取它以获得符文。注意，战斗中无法拾取|r
    >>|cRXP_WARN_可先清掉房间里的怪物；也可死在书旁后释放灵魂，跑回怪物视线外复活，趁未进战拾取符文|r
    .collect 226418,1 --Rune of Holy Specialization
    .train 453702,1
step
    .train 453702 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_神圣专精符文|r] 学习 |T237537:0|t[神圣专精]
    .train 453702,1
    .itemcount 226418,1
    .use 226418
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Mage SoD/Druid SoD/Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 奥术专精
#name Arcane Specialization - 60 (Western Plaguelands)
#displayname 奥术专精 - 60（西瘟疫之地）
step
    .train 453695,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    >>|cRXP_WARN_获取此符文需要在精英区域与怪物战斗。可以独自完成，但如果等级较低或装备较差，建议找人帮忙|r
    .zone Western Plaguelands >> 前往西瘟疫之地
step
    .train 453695,1
    .goto Western Plaguelands,48.7,22.4,50 >> 前往壁炉谷. |cRXP_WARN_这是精英区域|r
step
    .goto Western Plaguelands,47.3,13.6
    >>|cRXP_WARN_登上地图标记的塔顶。在书架旁的角落寻找一本红书，有一名|r|cRXP_ENEMY_血色牧师|r|cRXP_WARN_看守。拾取书以获得符文|r
    .collect 226413,1 --Rune of Arcane Specialization
    .train 453695,1
step
    .train 453695 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_奥术专精符文|r] 学习 |T132849:0|t[奥术专精]
    .train 453695,1
    .itemcount 226413,1
    .use 226413
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Paladin SoD/Warrior SoD/Shaman SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 斧类武器专精
#name Axe Specialization - 58 (Burning Steppes)
#displayname 斧类武器专精 - 58（燃烧平原）
step
    .train 453688,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Burning Steppes >> 前往燃烧平原
step
    .train 453688,1
    .goto Burning Steppes,40.3,34.9,100 >> 前往黑石要塞
step
    .train 453688,1
    .goto Burning Steppes,39.9,34.1
    >>|cRXP_WARN_进入要塞，在地图标记位置寻找地上的一本红色书籍。拾取它以获得符文|r
    .collect 226407,1 --Rune of Axe Specialization
step
    .train 453688 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_斧类武器专精符文|r] 学习 |T132394:0|t[斧类武器专精]
    .itemcount 226407,1
    .use 226407
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Druid SoD/Warrior SoD/Shaman SoD/Mage SoD/Priest SoD/Rogue SoD/Warlock SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 匕首专精
#name Dagger Specialization - 60 (Silithus)
#displayname 匕首专精 - 60（希利苏斯）
step
    .train 453690,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Silithus >> 前往希利苏斯
step
    .train 453690,1
    .goto Silithus,20,85,50 >> 前往区域南部靠近安其拉大门的帐篷
step
    .train 453690,1
    .goto Silithus,20,85
    >>|cRXP_WARN_进入帐篷，寻找地图标记位置处地上的红色书籍，拾取它以获得符文|r
    .collect 226409,1 --Rune of Dagger Specialization
step
    .train 453690 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_匕首专精符文|r] 学习 |T135641:0|t[匕首专精]
    .itemcount 226409,1
    .use 226409
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD/Warrior SoD/Shaman SoD/Rogue SoD/Warlock SoD/Paladin SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 防御专精
#name Defense Specialization - 60 (Blackrock Mountain)
#displayname 防御专精 - 60（黑石山）
step
    .train 459313,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone 25 >> 前往黑石山, 可经由灼热峡谷或燃烧平原
step
    .train 459313,1
    .goto 1415/0,-1232.500,-7612.600,20 >> 沿熔岩环形通道向东走，找到通往黑石塔下层的入口
step
    .train 459313,1
    .goto 1415/0,-1294.200,-7574.700,5 >> 沿路向上走进入右侧第一个侧室. |cRXP_WARN_可能需要击杀挡路的精英怪, 战斗中无法拾取书籍|r
step
    .train 459313,1
    .goto 1415/0,-1302.100,-7583.400
    >>|cRXP_WARN_在这个房间的地上寻找一本红色书籍。它可能出现在多个位置，拾取后可获得符文|r
    .collect 226694,1 --Rune of Defense Specialization
step
    .train 459313 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_防御专精符文|r] 学习 |T134952:0|t[防御专精]
    .itemcount 226694,1
    .use 226694
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 野性战斗专精
#name Feral Combat Specialization - 60 (Winterspring)
#displayname 野性战斗专精 - 60（冬泉谷）
step
    .train 453703,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Winterspring >> 前往冬泉谷
step
    .train 453703,1
    .goto Winterspring,49.0,8.0,50 >> 向北前往霜刀石
step
    .train 453703,1
    .goto Winterspring,49.0,8.0
    >>|cRXP_WARN_在标记处寻找红书，附近可能有两只55–56级|r |cRXP_ENEMY_霜刃豹|r |cRXP_WARN_看守；拾取书取得符文|r
    .collect 226419,1 --Rune of Feral Combat Specialization
step
    .train 453703 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_野性战斗专精狂野符文|r] 学习 |T132116:0|t[铭刻戒指 - 野性战斗专精]
    .itemcount 226419,1
    .use 226419
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Mage SoD/Shaman SoD/Warlock SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 火焰专精
#name Fire Specialization - 52 (Searing Gorge)
#displayname 火焰专精 - 52（灼热峡谷）
step
    .train 453696,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Searing Gorge >> 前往灼热峡谷
step
    .train 453696,1
    .goto 1427/0,-1425.800,-6772.400,25 >> 通过地图标记的洞穴入口进入熔渣之池
step
    .train 453696,1
    .goto 1427/0,-1306.900,-6642.800,25 >> 向北过桥
step
    .train 453696,1
    .goto 1427/0,-1225.300,-6623.600
    >>|cRXP_WARN_在|r |cRXP_ENEMY_工头玛托留斯|r |cRXP_WARN_身后的长凳上找红书；脱战后拾取以获得符文|r
    >>|cRXP_WARN_如果等级较高，你可以紧贴阳台最边缘，在不引到|r|cRXP_ENEMY_工头玛托留斯|r|cRXP_WARN_的情况下拾取书。若做不到，可以请人将他引开，趁机拾取书，或击杀他和守卫|r
    >>|cRXP_WARN_猎人可用宠物引开他，随后在书旁施放|r |T132293:0|t[假死] |cRXP_WARN_脱战并拾取书籍；务必把工头引到你的视线外，否则他可能让你重新进入战斗|r << Hunter
    .collect 226414,1 --Rune of Fire Specialization
step
    .train 453696 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_火焰专精符文|r] 学习 |T132847:0|t[火焰专精]
    .itemcount 226414,1
    .use 226414
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Druid SoD/Shaman SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 拳套专精
#name Fist Weapon Specialization - 60 (Silithus)
#displayname 拳套专精 - 60（希利苏斯）
step
    .train 453691,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Silithus >> 前往希利苏斯
step
    .train 453691,1
    .goto Silithus,38.2,45.4
    >>|cRXP_WARN_前往暮光营地西侧、风石旁的小营地，在箱子上寻找一本红色书籍并拾取符文|r
    .collect 226411,1 --Rune of Fist Weapon Specialization
step
    .train 453691 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_拳套专精符文|r] 学习 |T133832:0|t[拳套专精]
    .itemcount 226411,1
    .use 226411
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Mage SoD/Hunter SoD/Shaman SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 冰霜专精
#name Frost Specialization - 60 (Winterspring)
#displayname 冰霜专精 - 60（冬泉谷）
step
    .train 453697,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Winterspring >> 前往冬泉谷
step
    .train 453697,1
    .goto Winterspring,59.0,59.0,50 >> 向南前往枭兽营地
step
    .train 453697,1
    .goto Winterspring,59.0,59.0
    >>|cRXP_WARN_在标记处寻找红书，附近可能有两只57–58级|r |cRXP_ENEMY_枭兽|r |cRXP_WARN_看守；拾取书取得符文|r
    .collect 226415,1 --Rune of Frost Specialization
step
    .train 453697 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_冰霜专精符文|r] 学习 |T132852:0|t[冰霜专精]
    .itemcount 226415,1
    .use 226415
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD/Rogue SoD/Shaman SoD/Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 自然专精
#name Nature Specialization - 56 (Felwood)
#displayname 自然专精 - 56（费伍德森林）
step
    .train 453698,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Felwood >> 前往费伍德森林
step
    .train 453698,1
    .goto Felwood,63.42,7.71,50 >> 向北前往魔爪村
step
    .train 453698,1
    .goto Felwood,62.8,7.5
    >>|cRXP_WARN_在标记位置寻找一本红色书籍，它位于|r |cRXP_ENEMY_血喉酋长|r |cRXP_WARN_旁边的营地中。拾取它以获得符文|r
    .collect 226416,1 --Rune of Nature Specialization
step
    .train 453698 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_自然专精符文|r] 学习 |T132848:0|t[自然专精]
    .itemcount 226416,1
    .use 226416
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD/Rogue SoD/Shaman SoD/Paladin SoD/Priest SoD/Druid SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 锤类武器专精
#name Mace Specialization - 60 (Wetlands)
#displayname 锤类武器专精 - 60（湿地）
step
    .train 453689,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Wetlands >> 前往湿地
step
    .train 453689,1
    .goto 1437/0,-3451.700,-3450.800,25 >> 向东前往通往格瑞姆巴托的小径起点
step
    .train 453689,1
    .goto 1437/0,-3582.500,-4138.200,25 >> 沿道路前往格瑞姆巴托. |cRXP_WARN_不要与路上的红色幼龙战斗, 无需击杀即可抵达|r
step
    .train 453689,1
     .goto 1437/0,-3451.900,-4052.500
    >>|cRXP_WARN_沿小径上行至格瑞姆巴托的大门，在入口右侧寻找一本红色书籍，拾取它以获得符文|r
    .collect 226408,1 --Rune of Mace Specialization
step
    .train 453689 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_锤类武器专精符文|r] 学习 |T133038:0|t[锤类武器专精]
    .itemcount 226408,1
    .use 226408
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warrior SoD/Warlock SoD/Shaman SoD/Mage SoD/Priest SoD/Druid SoD/Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 长柄军械专精
#name Pole Weapon Specialization - 60 (Azshara)
#displayname 长柄军械专精 - 60（艾萨拉）
step
    .train 453694,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Azshara >> 前往艾萨拉
step
    .train 453694,1
    .goto Azshara,76.43,43.95,100 >> 前往亚考兰神殿
step
    .train 453694,1
    .goto Azshara,76.88,44.24
    >>|cRXP_WARN_在神殿内的月亮井上寻找一本红色书籍，拾取它以获得符文|r
    .collect 226412,1 --Rune of Pole Weapon Specialization
step
    .train 453694 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_长柄武器专精符文|r] 学习 |T135145:0|t[长柄军械专精]
    .itemcount 226412,1
    .use 226412
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Warlock SoD/Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 暗影专精
#name Shadow Specialization - 60 (Blasted Lands)
#displayname 暗影专精 - 60（诅咒之地）
step
    .train 453700,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Blasted Lands >> 前往诅咒之地
step
    .train 453700,1
    .goto Blasted Lands,45.19,55.29,100 >> 向南前往腐烂之痕。|cRXP_WARN_途中精英区有大量免疫控制的高等级怪物，可能需要多次死亡后继续赶往符文地点|r
step
    .train 453700,1
    .goto Blasted Lands,33.0,48.0
    >>|cRXP_WARN_寻找地图标记处祭坛上的红色书籍。拾取它以获得符文|r
    .collect 226417,1 --Rune of Shadow Specialization
step
    .train 453700 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影专精符文|r] 学习 |T132851:0|t[暗影专精]
    .itemcount 226417,1
    .use 226417
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Warrior SoD/Rogue SoD/Paladin SoD/Mage SoD/Warlock SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 剑类武器专精
#name Sword Specialization - 60 (Deadwind Pass)
#displayname 剑类武器专精 - 60（逆风小径）
step
    .train 453635,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Deadwind Pass >> 前往逆风小径
step
    .train 453635,1
    .goto Deadwind Pass,47.40,75.50 >> 向南前往卡拉赞
step
    .train 453635,1
    .goto 1430/0,-2019.100,-11170.300,10 >> 进入麦迪文的酒窖
step
    .train 453635,1
    .goto Deadwind Pass,43.06,74.58
    >>|cRXP_WARN_进入洞穴区域，在地图标记的位置寻找一本红色书籍。拾取它以获得符文|r
    .collect 226406,1 --Rune of Sword Specialization
step
    .train 453635 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_剑类武器专精符文|r] 学习 |T132223:0|t[剑类武器专精]
    .itemcount 226406,1
    .use 226406
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD/Druid SoD/Shaman SoD/Paladin SoD/Mage SoD/Warlock SoD/Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 冥想专精
#name Meditation Specialization - 30 (Thousand Needles)
#displayname 冥想专精 - 30（千针石林）
step
    .train 468763,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Thousand Needles >> 前往千针石林的闪光平原
    >>离符文位置最近的飞行点是加基森
step
    .train 468763,1
    .goto Thousand Needles,80,77,10 >> 进入地图标记的小屋
step
    .train 468763,1
    .goto Thousand Needles,80,77
    >>|cRXP_WARN_进入小屋，在里面架子上找一本|cRXP_WARN_灰色书籍|r，拾取它取得符文|r
    .collect 231828,1 --Rune of Meditation Specialization
step
    .train 468763 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_冥想专精符文|r] 学习 |T135913:0|t[冥想专精]
    .itemcount 231828,1
    .use 231828
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Druid SoD/Shaman SoD/Paladin SoD/Mage SoD/Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Ring
#subgroupdisplayname 戒指
#title 治疗专精
#name Healing Specialization - 40 (Arathi Highlands)
#displayname 治疗专精 - 40（阿拉希高地）
step
    .train 468761,1
    >>|cRXP_WARN_也可前往各族起始区域的符文商人处直接购买本职业符文，1级即可学习；以下保留野外探索或原商人获取路线|r
    #completewith next
    .zone Arathi Highlands >> 前往阿拉希高地
step
    .train 468761,1
    .goto Arathi Highlands,21.98,79.75,40 >> 前往法迪尔海湾, 沿山脉与激流堡东南墙之间的路径前行
step
    .train 468761,1
    .goto Arathi Highlands,35.2,79.1
    >>|cRXP_WARN_前往 |cRXP_FRIENDLY_菲兹索普教授|r 旁的营火，在营火旁的箱子上找一本 |cRXP_WARN_灰色书籍|r，拾取它取得符文|r
    .collect 231829,1 --Rune of Healing Specialization
    .target 菲兹索普教授
step
    .train 468761 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_治疗专精符文|r] 学习 |T135913:0|t[治疗专精]
    .itemcount 231829,1
    .use 231829
]])
