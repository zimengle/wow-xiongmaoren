RXPGuides.RegisterGuide([[
#classic
<< Horde Warrior SoD/Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs << Warrior
#subgroup Gloves << Hunter
#name 狂怒雷霆 - 10(莫高雷) << Warrior
#name 爆炸射击 - 10(莫高雷) << Hunter
#displayname Furious Thunder << Warrior
#displayname Explosive Shot << Hunter


    --Rune of Furious Thunder/Explosive Shot

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
    >>四处寻找|cRXP_ENEMY_Arra'Chea|r(大黑科多兽). 它沿顺时针方向移动. 击杀后拾取 |T134419:0|t[|cRXP_FRIENDLY_狂雷符文|r] << Warrior
    >>四处寻找|cRXP_ENEMY_Arra'Chea|r(体型巨大的黑色科多兽). 它会顺时针移动. 击杀后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r] << Hunter
    .collect 204809,1 << Warrior --Rune of Furious Thunder(1)
    .collect 206169,1 << Hunter --Rune of Explosive Shot (1)
    .mob Arra'Chea
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
#classic
<< Horde Warrior SoD/Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves << Warrior
#subgroup Legs << Hunter
#name 快速打击 - 18(荒地) << Warrior
#name 狙击手训练 - 16(贫瘠之地) << Hunter
#displayname Quick Strike << Warrior
#displayname Sniper Training << Hunter

    --Rune of Quick Strike/Sniper Training

step
    #season 2
    #completewith next
    +|cRXP_WARN_这个符文组队时非常容易完成. 如果是单人挑战, 建议等级达到18级或以上|r << Warrior
    +|cRXP_WARN_这个符文组队时非常容易完成, 如果是单人挑战, 建议等级达到16级或以上|r << Hunter
step
    #season 2
    .goto The Barrens,62.77,38.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔克斯|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T135129:0|t[钓鱼飞叉]|r
    .collect 208773,1 --Fishing Harpoon (1)
    .target Kilxx
    .train 425443,1 << Warrior
    .train 416091,1 << Hunter
step
    #season 2
    .goto The Barrens,64.51,39.32
    .use 208773 >>使用 |T135129:0|t[捕鱼飞叉] 对|cRXP_ENEMY_Bruuz|r进行攻击并击杀他. 从其身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_快速打击符文|r] << Warrior
    .use 208773 >>使用 |T135129:0|t[捕鱼飞叉] 对|cRXP_ENEMY_Bruuz|r进行攻击并击杀他. 从其身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] << Hunter
    >>|cRXP_WARN_他在水中的沉船周围巡逻|r
    .collect 208778,1 << Warrior --Rune of Quick Strike (1)
    .collect 208777,1 << Hunter --Rune of the Sniper (1)
    .unitscan Bruuz
    .train 425443,1 << Warrior
    .train 416091,1 << Hunter
step << Warrior
    #season 2
    .train 425443 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_快速打击符文|r]|cRXP_WARN_来训练|r|T132394:0|t[快速打击]
    .use 208778
    .itemcount 208778,1
step << Hunter
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r]|cRXP_WARN_来训练|r|T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1

    ]])
