RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Warrior SoD/Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs << Warrior
#subgroupdisplayname 腿部 << Warrior
#subgroup Gloves << Hunter
#subgroupdisplayname 手套 << Hunter
#name Furious Thunder - 10 (Mulgore) << Warrior
#name Explosive Shot - 10 (Mulgore) << Hunter
#title 狂怒雷霆 << Warrior
#title 爆炸射击 << Hunter
    --Rune of Furious Thunder/Explosive Shot
#displayname 狂怒雷霆 - 10（莫高雷） << Warrior
#displayname 爆炸射击 - 10（莫高雷） << Hunter
step
    #season 2
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9,90,0
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9
    >>寻找 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽）。它顺时针巡逻；击杀并拾取它的 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r] << Warrior
    >>寻找 |cRXP_ENEMY_阿兰其亚|r（大型黑色科多兽）。它顺时针巡逻；击杀并拾取它的 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r] << Hunter
    .collect 204809,1 << Warrior --Rune of Furious Thunder(1)
    .collect 206169,1 << Hunter --Rune of Explosive Shot (1)
    .mob 阿兰其亚
    .train 403476,1 << Warrior
    .train 410123,1 << Hunter
step << Warrior
    #season 2
    .train 403476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    .use 204809
    .itemcount 204809,1
step << Hunter
    #season 2
    .train 410123 >>使用 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .use 206169
    .itemcount 206169,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Warrior SoD/Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves << Warrior
#subgroupdisplayname 手套 << Warrior
#subgroup Legs << Hunter
#subgroupdisplayname 腿部 << Hunter
#name Quick Strike - 18 (The Barrens) << Warrior
#name Sniper Training - 16 (The Barrens) << Hunter
#title 迅捷打击 << Warrior
#title 狙击训练 << Hunter
    --Rune of Quick Strike/Sniper Training
#displayname 迅捷打击 - 18（贫瘠之地） << Warrior
#displayname 狙击训练 - 16（贫瘠之地） << Hunter
step
    #season 2
    #completewith next
    +|cRXP_WARN_组队获取此符文非常容易。如果单人进行，建议达到18+级|r << Warrior
    +|cRXP_WARN_组队获取此符文非常容易。如果单人进行，建议达到16+级|r << Hunter
step
    #season 2
    .goto The Barrens,62.77,38.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔克斯|r交谈
    >>|cRXP_BUY_向他购买|r |T135129:0|t[猎鱼叉] |cRXP_BUY_|r
    .collect 208773,1 --Fishing Harpoon (1)
    .target 基尔克斯
    .train 425443,1 << Warrior
    .train 416091,1 << Hunter
step
    #season 2
    .goto The Barrens,64.51,39.32
    .use 208773 >>使用 |T135129:0|t[猎鱼叉] 攻击 |cRXP_ENEMY_布鲁兹|r，击杀它并拾取 |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] << Warrior
    .use 208773 >>使用|T135129:0|t[猎鱼叉]攻击|cRXP_ENEMY_布鲁兹|r，然后将其击杀并拾取|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] << Hunter
    >>|cRXP_WARN_它在水中的沉船附近巡逻|r
    .collect 208778,1 << Warrior --Rune of Quick Strike (1)
    .collect 208777,1 << Hunter --Rune of the Sniper (1)
    .unitscan 布鲁兹
    .train 425443,1 << Warrior
    .train 416091,1 << Hunter
step << Warrior
    #season 2
    .train 425443 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] |cRXP_WARN_学习|r |T132394:0|t[迅捷打击]
    .use 208778
    .itemcount 208778,1
step << Hunter
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_学习|r |T132212:0|t[狙击训练]
    .use 208777
    .itemcount 208777,1
    ]])
