--DawnBreakerTeleport
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 战争之内 最后的较量
#name a) 黎明破晓者传送
#displayname a) 黎明破晓者传送 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

step
    .zoneskip 2215
    .zone 2359 >>打开地牢查找器, 进入追随者地下城页面, 并排队挑战|cRXP_WARN_'破晓者'|r
step
    .zoneskip 2215
    .gossipoption 124142 >>与黎明破军内的|cRXP_FRIENDLY_钢铁打击者|r交谈. |cRXP_WARN_她应该可以从入口处看到. 请使用“目标”界面标记她. |r
    .target General Steelstrik
]])

--Lost Dragonscale
RXPGuides.RegisterGuide([[
#retail
#version 4
#group RestedXP 快速升级
#name a) 失落的龙鳞(联盟)
#displayname a) 失落的龙鳞(联盟) \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

<< Alliance

step
    .accept 65436 >>接任务: |cRXP_WARN_巨龙群岛在等待|r
step
    >>使用|T134309:0|t[失落龙鳞]传送到暴风城
    .complete 65436,1 --1/1 Lost Dragonscale used to teleport to near Wrathion's location (Optional)
    .use 205456
step
    .isOnQuest 65436
    .abandon 65436,1
-- step
--     .goto 84,79.83,27.08
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉希奥|r交谈, 以获得另一枚|T134309:0|t[失落龙鳞], 供日后使用
--     .accept 65436 >>接任务: |cRXP_WARN_巨龙群岛在等待|r
--     .target Wrathion
]])

--DMF Alliance
RXPGuides.RegisterGuide([[
#retail
#version 4
#group RestedXP 快速升级
#name a) DMF 联盟
#displayname a) DMF 联盟 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

<< Alliance

-- step
--     #veteran
--     .goto 84,61.11,70.6
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
--     >>|cRXP_WARN_ 建议使用另一个拥有至少10,000金币的角色登录. 用该角色购买物品后, 再将它们发送过来|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师费奇|r交谈
--     .collect 71715,1
--     .collect 71638,1
--     .collect 71637,1
--     .collect 71636,1
--     .collect 71635,1
--     .collect 71952,1
--     .collect 71951,1
--     .collect 71953,1
--     .collect 71716,1
--     .target Auctioneer Fitch
--     .target Auctioneer Jaxon
--     .target Auctioneer Chilton
--     .dmf
-- step
--     #fresh
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
--     .dmf
-- step
--     #veteran
--     .goto 37,41.95,67.16
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lien Farmer|r交谈
--     >>|cRXP_WARN_这些专业以后会用于暗月马戏团任务. 如果您不想进行此步骤, 请跳过|r
--     .train 2259 >>训练 |T4620669:0|t[炼金术] 和 |T4620676:0|t[铭文]
--     .skipgossip 47384,2,1,1
--     .target Lien Farmer
--     .dmf
-- step
--     #veteran
--     .goto 37,41.95,67.16
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lien Farmer|r交谈
--     .train 45357 >>训练 |T4620676:0|t[铭文]
--     .skipgossip 47384,3,6,2
--     .target Lien Farmer
--     .dmf
--     .train 2259,3 --Only show if you have Alchemy
-- step
--     #veteran
--     .goto 37,41.89,67.10
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨瑞恩·博丁|r交谈. 向他购买以下物品:
-- --    .collect 2604,1,29520,1 --Red Dye (1)
-- --    .collect 6260,1,29520,1 --Blue Dye (1)
-- --  .collect 2320,1,29520,1 --Coarse Thread (1)
--     .collect 30817,5,29509,1 --Simple Flour (5)
--     .collect 39354,5,29515,1 --Light Parchment (1)
--     .target Tharynn Bouden
--     .dmf
--     .train 45357,3 --Only show if you have Inscription
-- --XX 29520 needs to be added
-- --XX DMF section needs a polish at some point. Coords to 3dp, new formatting, #optional on steps
-- step
--     #veteran
--     .goto 37,41.89,67.10
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨瑞恩·博丁|r交谈. 向他购买以下物品:
-- --    .collect 2604,1,29520,1 --Red Dye (1)
-- --    .collect 6260,1,29520,1 --Blue Dye (1)
-- --  .collect 2320,1,29520,1 --Coarse Thread (1)
--     .collect 30817,5,29509,1 --Simple Flour (5)
--     .target Tharynn Bouden
--     .dmf
-- --XX 29520 needs to be added
-- --XX DMF section needs a polish at some point. Coords to 3dp, new formatting, #optional on steps
-- step
--     .goto 37,43.2,65.99,5,0
--     .goto 37,43.2,65.63,5,0
--     .goto 37,42.9,65.7,5,0
--     .goto 37,41.78,69.55
--     .zone 407 >>前往|cRXP_PICK_暗月马戏团传送门|r|cRXP_WARN_前往暗月岛|r
--     .dmf
-- step
--     #completewith next
--     +|TInterface/cursor/crosshair/interact.blp:20|t只有在你没有1级坐骑的情况下, 才可与|r|cRXP_FRIENDLY_Strider|r|r|cRXP_WARN_互动|r
--     .dmf
-- step
--     #veteran
--     .goto 407,51.57,24.84,10,0
--     .goto 407,55.83,53.02,15,0
--     .goto 407,50.44,59.33
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kae Ti|r交谈, 并向她购买一张|T133734:0|t[木马联票]
--     *|cRXP_WARN_buy the cheaper version |cRXP_WARN_on the left in the window|r|r.
--     .collect 92788,1,92794,1 --Ride Ticket Book (1)
--     .target Kae Ti
--     .dmf
-- step
--     #completewith next
--     .goto 407,49.45,57.5
--     .cast 107829 >>|cRXP_WARN_开启木马联票|r
--     .dmf
--     .use 92788
--     .use 92794
-- step
--     #veteran
--     .goto 407,49.45,57.5
--     >>|cRXP_WARN_站在旋转木马上, 等待经验加成持续满60分钟|r|r
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击背包中的任务物品|cRXP_WARN_并跳过你没有的物品)|
--     --x insert macro to accept quests here
--     .accept 29464 >>接任务: |cRXP_WARN_占卜道具|r
--     .accept 29451 >>接任务: |cRXP_WARN_战略大师|r
--     .accept 29456 >>接任务: |cRXP_WARN_缴获的旗帜|r
--     .accept 29457 >>接任务: |cRXP_WARN_敌人的徽记|r
--     .accept 29458 >>接任务: |cRXP_WARN_缴获的日记|r
--     .accept 29443 >>接任务: |cRXP_WARN_奇怪的水晶|r
--     .accept 29444 >>接任务: |cRXP_WARN_古怪的蛋|r
--     .accept 29445 >>接任务: |cRXP_WARN_奇异的魔典|r
--     .accept 29446 >>接任务: |cRXP_WARN_精美的武器|r
--     .zoneskip 407,1
--     .dmf
-- step
--     #fresh
--     .goto 407,49.45,57.5
--     >>|cRXP_WARN_站在旋转木马上, 等待经验加成持续满60分钟|r|r
--     .zoneskip 407,1
--     .dmf
-- step
--     #veteran
--     .goto 407,51.91,60.94
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Professor Paleo|r交谈
--     .turnin -29464 >>交任务: |cRXP_FRIENDLY_占卜道具|r
--     .turnin -29451 >>交任务: |cRXP_FRIENDLY_战略大师|r
--     .turnin -29456 >>交任务: |cRXP_FRIENDLY_缴获的旗帜|r
--     .turnin -29457 >>交任务: |cRXP_FRIENDLY_敌人的徽记|r
--     .turnin -29458 >>交任务: |cRXP_FRIENDLY_缴获的日记|r
--     .turnin -29443 >>交任务: |cRXP_FRIENDLY_奇怪的水晶|r
--     .turnin -29446 >>交任务: |cRXP_FRIENDLY_精美的武器|r
--     .zoneskip 407,1
--     .dmf
-- step
--     #veteran
--     .goto 407,47.76,64.76
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gelvas Grimegate|r交谈, 并尽可能多地向他购买 |T669449:0|t[暗月大礼帽]
--     .turnin 7905 >>交任务: |cRXP_FRIENDLY_暗月马戏团|r
--     .collect 171364,1,29506,1 --Darkmoon Top Hat (1)
--     .target Gelvas Grimegate
--     .zoneskip 407,1
--     .dmf
-- step
--     #fresh
--     .goto 407,47.76,64.76
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉瓦斯·格里加特|r 交谈
--     .turnin 7905 >>交任务: |cRXP_FRIENDLY_暗月马戏团|r
--     .target Gelvas Grimegate
--     .zoneskip 407,1
--     .dmf
-- step
--     .goto 407,52.89,67.96
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔姆·雷角|r交谈
--     .accept 29509 >>接任务: |cRXP_WARN_让青蛙肉更松脆|r
--     .target Stamp Thunderhorn
--     .zoneskip 407,1
--     .dmf
-- step
--     .goto 407,52.88,67.96
--     >>使用 |T133642:0|t[一袋肥美的青蛙] 将它们变成 |T237579:0|t[裹着面粉的青蛙]
--     .collect 72056,5,29509,1,-1 --Plump Frogs (5)
--     .collect 30817,5,29509,1,-1 --Simple Flour (5)
--     .collect 72057,5,29509,1 --Breaded Frog (5)
--     .use 72056 --Plump Frog
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29509
-- step
--     .goto 407,52.88,67.96
--     >>使用|T237579:0|t[裹着面粉的青蛙]靠近|cRXP_FRIENDLY_斯塔姆·雷角|r
--     .collect 72057,5,29509,1,-1 --Breaded Frog (5)
--     .complete 29509,1 --5/5 Crunchy Frog
--     .use 72057 --Breaded Frog
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29509
-- step
--     .goto 407,52.88,67.96
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯塔姆·雷角|r交谈
--     .turnin 29509 >>交任务: |cRXP_FRIENDLY_让青蛙肉更松脆|r
--     .target Stamp Thunderhorn
--     .zoneskip 407,1
--     .dmf
-- step
--     .goto 407,50.54,69.56
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰妮亚|r交谈, 并向她购买|T132792:0|t[泡沫饮料]
--     .accept 29506 >>接任务: |cRXP_WARN_调制饮料|r
--     .collect 19299,5,29506,1 --Fizzy Faire Drinks (5)
--     .target Sylannia
--     .zoneskip 407,1
--     .dmf
--     .train 2259,3 --Only show if you have Alchemy
-- step
--     .goto 407,50.54,69.56
--     >>使用 |T132793:0|t[鸡尾酒调酒器] 制作 |T463532:0|t[月莓泡沫饮料]
--     .collect 1645,5,29506,1,-1 --Moonberry Juice (5)
--     .collect 19299,5,29506,1,-1 --Fizzy Faire Drinks (5)
--     .complete 29506,1 --5/5 Moonberry Fizz
--     .use 72043 --Cocktail Shaker
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29506
-- step
--     .goto 407,50.53,69.56
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兰妮亚|r交谈
--     .turnin 29506 >>交任务: |cRXP_FRIENDLY_调制饮料|r
--     .target Sylannia
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29506
-- step
--     .goto 407,53.23,75.82
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞格|r交谈
--     .turnin 29445 >>交任务: |cRXP_FRIENDLY_奇异的魔典|r
--     .accept 29515 >>接任务: |cRXP_WARN_书写未来|r
--     .target Sayge
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29445
--     .train 45357,3 --Only show if you have Inscription
-- step
--     #optional
--     .goto 407,53.23,75.82
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞格|r交谈
--     .turnin 29445 >>交任务: |cRXP_FRIENDLY_奇异的魔典|r
--     .target Sayge
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29445
-- step
--     #optional
--     .goto 407,53.23,75.82
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞格|r交谈
--     .accept 29515 >>接任务: |cRXP_WARN_书写未来|r
--     .target Sayge
--     .zoneskip 407,1
--     .dmf
--     .train 45357,3 --Only show if you have Inscription
-- step
--     .goto 407,53.23,75.82
--     >>使用 |T413571:0|t[一包奇异的草药] 制作 |T237061:0|t[预言墨水]
--     .collect 71972,1,29515,1
--     .use 71971
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29515
-- step
--     .goto 407,53.23,75.82
--     >>使用 |T237061:0|t[预言墨水] 制作 |T134943:0|t[命运之书]
--     .collect 39354,5,29515,1,-1 --Light Parchment
--     .complete 29515,1 --5/5 Fortune
--     .use 71972
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29515
-- step
--     .goto 407,53.23,75.82
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞格|r交谈
--     .turnin 29515 >>交任务: |cRXP_FRIENDLY_书写未来|r
--     .target Sayge
--     .skipgossip
--     .zoneskip 407,1
--     .dmf
-- step
--     #veteran
--     .goto 407,51.11,82.04
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚布·尼比盖尔|r交谈
--     .turnin 29444 >>交任务: |cRXP_FRIENDLY_古怪的蛋|r
--     .target Yebb Neblegear
--     .zoneskip 407,1
--     .dmf
--     .isOnQuest 29444
-- step
--     .goto 407,50.56,90.80
--     .zone 37 >>前往|cRXP_PICK_暗月马戏团传送门|r|cRXP_WARN_到艾尔文森林|r
--     .zoneskip 407,1
--     .dmf
-- step
--     #completewith next
--     +|cRXP_WARN_放弃你的专业技能|r
--     .link /run AbandonSkill(773); AbandonSkill(171); >>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
--     --x .skill 773,<1 >>遗忘铭文
--     --x .skill 171,<1 >>遗忘炼金术
--     --x add unlearn logic
--     .isOnQuest 60
--     .dmf
-- step
--     #sticky
--     #label Professions1
--     #completewith Professions3
--     .goto 37,41.95,67.16
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lien Farmer|r交谈
--     >>|cRXP_WARN_Herbing 草药和采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r.
--     >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
--     .train 2366 >>训练 |T4620675:0|t[草药学]
--     .train 2575 >>训练 |T4620679:0|t[采矿]
--     .target Lien Farmer
--     .skipgossip 47396,1,1,1
--     .train 2366,1 --Herbalism
--     .train 2575,1 --Mining
-- step
--     #optional
--     #requires Professions1
--     #label Professions2
--     #completewith Professions3
--     .goto 37,41.95,67.16
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lien Farmer|r交谈
--     >>|cRXP_WARN_Herbing 草药提供经验值. 请仅在你的前进路径上采集资源|r
--     >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
--     .train 2366 >>训练 |T4620675:0|t[草药学]
--     .target Lien Farmer
--     .skipgossip 47396,2,2,2
--     .train 2575,3 --Mining
-- step
--     #optional
--     #requires Professions2
--     #label Professions3
--     .goto 37,41.95,67.16
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lien Farmer|r交谈
--     >>|cRXP_WARN_采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r
--     >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
--     .train 2575 >>训练 |T4620679:0|t[采矿]
--     .target Lien Farmer
--     .skipgossip 47396,2,3,2
--     .train 2366,3 --Herbalism
-- step
--     #veteran
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
--     >>|cRXP_WARN_如果您的宠物对战宠物等级未达到25级, 请跳过此步骤|r
--     .goto 37,41.65,83.67
--     .accept 31693 >>接任务: |cRXP_WARN_茱莉亚·史蒂文斯|r
--     .target Julia Stevens
--     .isQuestTurnedIn 31903 --x Pet Battle Campaign Check
-- step
--     #veteran
--     >>在宠物对战中击败茱莉亚·史蒂文斯
--     .complete 31693,1 --Defeat Julia Stevens
--     .target Julia Stevens
--     .isOnQuest 31693
-- step
--     #veteran
--     .goto 37,41.66,83.66
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
--     .turnin 31693 >>交任务: |cRXP_FRIENDLY_茱莉亚·史蒂文斯|r
--     .target Julia Stevens
--     .isQuestComplete 31693
]])

--Lost Dragonscale
RXPGuides.RegisterGuide([[
#retail
#version 4
#group RestedXP 快速升级
#name a) 失落的龙鳞部落
#displayname a) 失落的龙鳞部落 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

<< Horde

step
    .accept 65436 >>接任务: |cRXP_WARN_巨龙群岛在等待|r
step
    .isOnQuest 65435
    >>使用|T134309:0|t[失落龙鳞]传送到奥格瑞玛
    .complete 65436,1 --1/1 Lost Dragonscale used to teleport to near Wrathion's location (Optional)
step
    .isOnQuest 65435
    .abandon 65435,1
-- step
--     .goto 84,79.83,27.08
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉希奥|r交谈, 以获得另一枚|T134309:0|t[失落龙鳞], 供日后使用
--     .accept 65436 >>接任务: |cRXP_WARN_巨龙群岛在等待|r
--     .target Wrathion
]])