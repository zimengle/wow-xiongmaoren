RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 地精起始区域
#name 地精起始区
#displayname Chapter 1 - Kezan & The Lost Isles
#next RestedXP 部落 10-60\\1 BfA 简介

<< Goblin !DK

step << Goblin
    .zoneskip 1727
    #completewith KezanFirstQuestCheck
    +欢迎来到 RestedXP 的 |cRXP_WARN_Goblin 起始区|r 指南。
    *This route is a lot slower than |cRXP_WARN_Exiles Reach|r. For faster leveling recreate your character and choose |cRXP_WARN_Exiles Reach|r instead.
step << Goblin
    .zoneskip 1727,1
    +您位于流放区，但当前指南针对的是 |cRXP_WARN_Goblin 起始区|r。
    +请选择|cRXP_WARN_Exiles Reach|r 指南。
step
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以对目标执行此操作。|r
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label KezanFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 194,56.4,76.9
    .accept 14138 >>接任务: |cRXP_WARN_照看生意|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 194,60.3,74.6
    .turnin 14138 >>交任务: |cRXP_FRIENDLY_照看生意|r
    .accept 14069 >>接任务: |cRXP_WARN_好帮手很难找|r
    .accept 14075 >>接任务: |cRXP_WARN_矿井的麻烦事|r
    .target Foreman Dampwick
step
    #completewith next
    .goto 194,65.52,87.82,10 >>进入矿井
step
    #completewith KezanTroubleintheMines
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Defiant Trolls|r。它们也可以在矿井外找到。
    .goto 194,66.02,82.39,0,0
    .complete 14069,1 --8/8 Attitudes Adjusted
    .target Defiant Troll
step
    #label KezanTroubleintheMines
    >>杀死 |cRXP_ENEMY_Tunneling Worms|r
    .goto 197,50.73,59.55
    .complete 14075,1 --6/6 Tunneling Worm slain
    .mob Tunneling Worm
step
    #completewith next
    .goto 194,65.52,87.82,8 >>离开矿井
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Defiant Trolls|r
    .goto 194,72.45,83.45,50,0
    .goto 194,70.39,77.73,30,0
    .goto 194,68.74,82.87
    .complete 14069,1 --8/8 Attitudes Adjusted
    .target Defiant Troll
step
    #completewith next
    .hs >>回到 KTC 总部
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 194,60.1,74.6
    .turnin 14075 >>交任务: |cRXP_FRIENDLY_矿井的麻烦事|r
    .turnin 14069 >>交任务: |cRXP_FRIENDLY_好帮手很难找|r
    .accept 25473 >>接任务: |cRXP_WARN_卡亚可乐|r
    .target Foreman Dampwick
step << Warlock
    #completewith next
    +|cRXP_WARN_提醒：使用 |T136218:0|t[召唤小鬼] 召唤你的宠物|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sassy Handwrench|r
    .goto 194,56.4,76.9
    .turnin 25473 >>交任务: |cRXP_FRIENDLY_卡亚可乐|r
    .accept 28349 >>接任务: |cRXP_WARN_市场部的梅格斯|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .goto 194,58.3,76.4
    .turnin 28349 >>交任务: |cRXP_FRIENDLY_市场部的梅格斯|r
    .accept 14071 >>接任务: |cRXP_WARN_呼朋唤友|r
    .target Megs Dreadshredder
step
    >>使用 |T134246:0|t[热棒钥匙] 安装热棒
    .goto 194,58.9,76.3
    .complete 14071,1 --1/1 按键 to the Hot Rod used
    .use 46856
step
    >>按照箭头指示拾取 |cRXP_FRIENDLY_Izzy|r
    >>在冷却时使用 |T135788:0|t[Punch] (1)
    .goto 194,59.93,85.52,15,0
    .goto 194,58.9,85.5
    .complete 14071,2 --1/1 Izzy picked up
    .target Izzy
step
    >>按照箭头拾取|cRXP_FRIENDLY_Gobber|r
    >>在冷却时使用 |T135788:0|t[Punch] (1)
    .goto 194,59.93,85.52,15,0
    .goto 194,57.95,70.46,20,0
    .goto 194,60.6,49.9
    .complete 14071,4 --1/1 Gobber picked up
    .target Gobber
step
    >>按照箭头拾取|cRXP_FRIENDLY_Ace|r
    >>在冷却时使用 |T135788:0|t[Punch] (1)
    .goto 194,48.5,38.3
    .complete 14071,3 --1/1 Ace picked up
    .target Ace
step
    #completewith next
    .goto 194,61.98,54.83,30,0
    .goto 194,60.13,64.59,30,0
    .goto 194,57.90,71.12,20 >>沿着街道往回走
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .goto 194,58.3,76.5
    .turnin 14071 >>交任务: |cRXP_FRIENDLY_呼朋唤友|r
    .accept 24567 >>接任务: |cRXP_WARN_参加预选赛|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sassy Handwrench|r
    .goto 194,56.4,77.0
    .accept 14070 >>接任务: |cRXP_WARN_亲自动手|r
    .target Sassy Handwrench
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奇普·英代尔|r
    .goto 194,56.3,76.8
    .accept 26711 >>接任务: |cRXP_WARN_前往银行|r
    .target Chip Endale
--female quest
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_小甜甜|r
    .goto 194,56.3,76.8
    .accept 26712 >>接任务: |cRXP_WARN_前往银行|r
    .target Candy Cane
--male quest
step
    >>沿着房子周围的箭头并攻击 |cRXP_ENEMY_Bruno Flameretardant|r
    *|cRXP_WARN_Don't forget to use your 按键 to the Hot Rod|r
    .use 46856
    .goto 194,57.52,76.93,5,0
    .goto 194,57.46,78.35,5,0
    .goto 194,55.34,78.25,5,0
    .goto 194,45.25,74.75
    .complete 14070,1 --1/1 Bruno Flameretardant beaten down
    .mob Bruno Flameretardant
step
    >>攻击 |cRXP_ENEMY_Sudsy Magee|r
    .goto 194,41.6,81.9
    .complete 14070,4 --1/1 Sudsy Magee beaten down
    .mob Sudsy Magee
step
    >>攻击 |cRXP_ENEMY_Jack the Hammer|r
    .goto 194,37.47,75.97,15,0
    .goto 194,35.0,77.8
    .complete 14070,3 --1/1 Jack the Hammer beaten down
    .mob Jack the Hammer
step
    >>攻击 |cRXP_ENEMY_Frankei Gearslipper|r
    .goto 194,36.84,69.95
    .complete 14070,2 --1/1 Frankie Gearslipper beaten down
    .mob Frankey Gearslipper
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_确保使用你的 Hot Rod 钥匙|r。
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入银行并与 |cRXP_FRIENDLY_FBoK 银行出纳员|r交谈
    .goto 194,34.16,69.32,10,0
    .goto 194,32.27,63.79,12,0
    .goto 194,29.72,64.52,16,0
    .goto 194,30.1,71.9
    .turnin 26711 >>交任务: |cRXP_FRIENDLY_前往银行|r
    .accept 14110 >>接任务: |cRXP_WARN_崭新的你|r
    .target FBoK Bank Teller
--female quest
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入银行并与 |cRXP_FRIENDLY_FBoK 银行出纳员|r交谈
    .goto 194,34.16,69.32,10,0
    .goto 194,32.27,63.79,12,0
    .goto 194,29.72,64.52,16,0
    .goto 194,30.1,71.9
    .turnin 26712 >>交任务: |cRXP_FRIENDLY_前往银行|r
    .accept 14109 >>接任务: |cRXP_WARN_崭新的你|r
    .target FBoK Bank Teller
--male quest
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_确保使用你的 |T134246:0|t[Hot Rod 的钥匙]（当你必须跑到某个地方时，你应该总是使用它们）|r。
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_苏扎博|r
    .goto 194,29.80,63.62,16,0
    .goto 194,34.66,54.73,10,0
    .goto 194,37.63,55.38
    .use 46856
    .skipgossip
    .complete 14110,2 --1/1 Hip New Outfit
    .target Szabo
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_苏扎博|r
    .goto 194,29.80,63.62,16,0
    .goto 194,34.66,54.73,10,0
    .goto 194,37.63,55.38
    .use 46856
    .skipgossip
    .complete 14109,2 --1/1 Hip New Outfit
    .target Szabo
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“大金牙”盖比|r
    .goto 194,34.9,45.7
    .skipgossip
    .complete 14110,1 --1/1 Shiny Bling
    .target Gappy Silvertooth
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“大金牙”盖比|r
    .goto 194,34.9,45.7
    .skipgossip
    .complete 14109,1 --1/1 Shiny Bling
    .target Gappy Silvertooth
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“软糖”米萨|r
    .goto 194,40.5,45.8
    .skipgossip
    .complete 14110,3 --1/1 Cool Shades
    .target Missa Spekkies
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“软糖”米萨|r
    .goto 194,40.5,45.8
    .skipgossip
    .complete 14109,3 --1/1 Cool Shades
    .target Missa Spekkies
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r
    .goto 194,42.57,55.34,20,0
    .goto 194,48.8,57.8
    .turnin 24567 >>交任务: |cRXP_FRIENDLY_参加预选赛|r
    .accept 24488 >>接任务: |cRXP_WARN_替代品|r
    .target Coach Crosscheck
step
    >>在 Hot Rod 上从地上捡起 |cRXP_PICK_Replacements Parts|r
#loop
	.line 194,50.99,57.96,51.22,61.01,49.78,66.39,48.17,66.87,46.08,68.18,44.49,65.76,44.23,63.11,43.75,59.25
	.goto 194,50.99,57.96,20,0
	.goto 194,51.22,61.01,20,0
	.goto 194,49.78,66.39,20,0
	.goto 194,48.17,66.87,20,0
	.goto 194,46.08,68.18,20,0
	.goto 194,44.49,65.76,20,0
	.goto 194,44.23,63.11,20,0
	.goto 194,43.75,59.25,20,0
    .complete 24488,1 --6/6 Replacement Parts
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r
    .goto 194,48.8,57.8
    .turnin 24488 >>交任务: |cRXP_FRIENDLY_替代品|r
    .accept 24502 >>接任务: |cRXP_WARN_必要的粗暴|r
    .target Coach Crosscheck
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Bilgewater Buccaneer|r 机器人
    >>使用 |T134480:0|t[投掷足球炸弹] (1) 杀死你面前的 |cRXP_ENEMY_Steamwheedle Sharks|r
    .goto 194,47.7,57.7
    .complete 24502,1 --1/1 Bilgewater Buccaneer
    .complete 24502,2 --8/8 Steamwheedle Shark Footbombed
step
    >>点击任务日志中的任务，|cRXP_WARN_你可能必须下马才能接受|cRXP_FRIENDLY_Coach Crosscheck|r|r 的下一个任务
    .goto 194,47.7,57.7
    .turnin 24502 >>交任务: |cRXP_FRIENDLY_必要的粗暴|r
    .accept 24503 >>接任务: |cRXP_WARN_四攻得分|r << Male
    .accept 28414 >>接任务: |cRXP_WARN_四攻得分|r << Female
    .target Coach Crosscheck
step
    >>使用 |T134480:0|t[Kick Footbomb] (1)
    .complete 24503,1 << Male --1/1 Footbomb Kicked Through Smokestacks
    .complete 28414,1 << Female --1/1 Footbomb Kicked Through Smokestacks
step
    #completewith next
    +|cRXP_WARN_离开车辆|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r
    .goto 194,48.7,57.8
    .turnin 24503 >>交任务: |cRXP_FRIENDLY_四攻得分|r << Male
    .turnin 28414 >>交任务: |cRXP_FRIENDLY_四攻得分|r << Female
    .accept 24520 >>接任务: |cRXP_WARN_告诉莎希好消息|r
    .target Coach Crosscheck
step
    #completewith next
    .use 46856
    .vehicle 34840 >>|cRXP_WARN_确保使用你的 |T134246:0|t[Hot Rod 的钥匙]（当你必须跑到某个地方时，你应该总是使用它们）|r。
step
    #completewith next
    .goto 194,52.91,51.59,30,0
    .goto 194,61.86,55.57,20,0
    .goto 194,61.01,62.01,8,0
    .goto 194,57.76,71.07,15 >>按照箭头返回总部
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r, |cRXP_FRIENDLY_奇普·英代尔|r
    .goto 194,57.58,76.99,10,0
    .turnin 24520 >>交任务: |cRXP_FRIENDLY_告诉莎希好消息|r
    .turnin 14070 >>交任务: |cRXP_FRIENDLY_亲自动手|r
    .goto 194,56.4,76.9
    .turnin 14110 >>交任务: |cRXP_FRIENDLY_崭新的你|r
    .accept 14153 >>接任务: |cRXP_WARN_聚会生活|r
    .goto 194,56.3,76.8
    .target Sassy Hardwrench
    .target Chip Endale
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r, |cRXP_FRIENDLY_小甜甜|r
    .goto 194,57.58,76.99,10,0
    .turnin 24520 >>交任务: |cRXP_FRIENDLY_告诉莎希好消息|r
    .turnin 14070 >>交任务: |cRXP_FRIENDLY_亲自动手|r
    .goto 194,56.4,76.9
    .turnin 14109 >>交任务: |cRXP_FRIENDLY_崭新的你|r
    .accept 14113 >>接任务: |cRXP_WARN_聚会生活|r
    .goto 194,56.3,76.8
    .target Sassy Hardwrench
    .target Candy Cane
step
    >>对 |cRXP_FRIENDLY_Goblins|r 饮酒者使用 |T132809:0|t[Bubbly] (1)
    >>使用 |T132806:0|t[Bucket] (2) 对醉汉/困惑的 |cRXP_FRIENDLY_Goblins|r
    >>|T133836:0|t[舞蹈] (3) 与 |cRXP_FRIENDLY_Goblins|r 一起跳舞
    >>使用 |T134285:0|t[Fireworks] (4) 对 |cRXP_FRIENDLY_Goblins|r 制造火花
    >>对 |cRXP_FRIENDLY_Goblins|r 吃东西的人使用 |T237329:0|t[Hors D'oeuvres] (5)
    .goto 194,59.56,78.75,15,0
    .goto 194,59.09,80.31,10,0
    .goto 194,60.59,82.98,15,0
    .goto 194,60.82,86.33,15,0
    .goto 194,60.6,83.4
    .complete 14153,1 << Female --10/10 Partygoer entertained
	.complete 14113,1 << Male --10/10 Partygoer entertained
    .target Kezan Partygoer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 194,57.41,77.03,8,0
    .goto 194,56.4,77.0
    .turnin 14153 >>交任务: |cRXP_FRIENDLY_聚会生活|r << Female
	.turnin 14113 >>交任务: |cRXP_FRIENDLY_聚会生活|r << Male
    .accept 14115 >>接任务: |cRXP_WARN_捣乱的海盗|r
    .target Sassy Hardwrench
step
    >>杀死 |cRXP_ENEMY_Pirate Party Crashers|r。集中杀死生命值较低的人。
    .goto 194,57.51,76.97,8,0
    .goto 194,60.05,80.79
    .complete 14115,1 --12/12 Pirate Party Crasher slain
    .target Pirate Party Crasher
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 194,56.4,77.0
    .turnin 14115 >>交任务: |cRXP_FRIENDLY_捣乱的海盗|r
    .accept 14116 >>接任务: |cRXP_WARN_不速之客|r
    .target Sassy Hardwrench
step
    #completewith next
    .goto 194,56.41,75.33,5,0
    .goto 194,55.99,75.65,4,0
    .goto 194,55.96,77.07,5 >>上楼梯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .goto 194,56.7,76.9
    .turnin 14116 >>交任务: |cRXP_FRIENDLY_不速之客|r
    .accept 14120 >>接任务: |cRXP_WARN_万亿杏仁币|r
    .target Trade Prince Gallywix
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳出窗户并与 |cRXP_FRIENDLY_Sassy Handwrench|r、|cRXP_FRIENDLY_Megs Dreadshredder|r 和 |cRXP_FRIENDLY_Foreman Dampwick|r 交谈
    .turnin 14120 >>交任务: |cRXP_FRIENDLY_万亿杏仁币|r
    .accept 14122 >>接任务: |cRXP_WARN_紧急措施|r
    .goto 194,59.6,77.1
    .accept 14121 >>接任务: |cRXP_WARN_热力追踪|r
    .goto 194,60.0,78.1
    .accept 14124 >>接任务: |cRXP_WARN_搜刮卡亚矿石|r
    .goto 194,63.0,77.8
    .target Sassy Handwrench
    .target Megs Dreadshredder
    .target Foreman Dampwick
step
    #completewith next
    .use 46856
    .vehicle 34840 >>|cRXP_WARN_请确保使用 |T134246:0|t[热棒钥匙]。在车辆中时，您不会受到坠落伤害|r。
step
    >>将 |T133712:0|t[Kablooey Bombs] 瞄准 Kaja'mite 矿床并掠夺矿井附近地面上的 |cRXP_LOOT_Kaja'mite Chunks|r。
    .goto 194,67.27,77.69,8,0
    .goto 194,69.59,79.35,8,0
    .goto 194,69.03,83.16,8,0
    .goto 194,66.64,84.03,8,0
    .goto 194,66.09,87.34,8,0
    .goto 194,64.34,83.48,8,0
    .goto 194,64.5,83.6
    .use 48768
    .complete 14124,1 --12/12 Kaja'mite Chunk
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史莉琪·剃刀|r
    .goto 194,58.82,75.06
    .accept 14123 >>接任务: |cRXP_WARN_别墅漫步|r
    .target Slinky Sharpshiv
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请确保使用 |T134246:0|t[热棒钥匙]。在车辆中时，您不会受到坠落伤害|r。
step
    #completewith next
    >>当你看到 |cRXP_ENEMY_Hired Looters|r 时，驾车过去
    .goto 194,57.94,69.61,15,0
    .goto 194,47.67,60.09,25,0
    .goto 194,38.63,78.42,25,0
    .goto 194,32.71,63.68,10,0
    .goto 194,29.79,63.75,10,0
    .complete 14121,1 --12/12 Stolen Loot
    .mob Hired Looter
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_科赞金库第一银行|r 并按照屏幕中央显示的说明进行操作
    .goto 194,29.3,69.5
    .complete 14122,1 --1/1 First Bank of Kezan Vault
    .complete 14122,2 --1/1 Personal Riches
step
    >>开车过去 |cRXP_ENEMY_Hired Looters|r
    .goto 194,35.91,53.68,20,0
    .goto 194,41.33,53.03,20,0
    .goto 194,41.16,42.01,20,0
    .goto 194,35.96,44.39
    .complete 14121,1 --12/12 Stolen Loot
    .mob Hired Looter
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请确保使用你的|T134246:0|t[按键 to the Hot Rod]|r。
step
    #completewith KezanWaltzRightIn
    +|cRXP_WARN_避开 |cRXP_ENEMY_Villa Mooks|r 和 |cRXP_ENEMY_Keesnout Potbellys|r 因为他们可以发现并杀死你|r
step
    >>拿起|cRXP_LOOT_bomb|r
    .goto 194,24.20,40.67,30,0
    .goto 194,19.9,30.7
    .complete 14123,3 --1/1 The Ultimate Bomb
step
    >>拿起|cRXP_LOOT_painting|r
    .goto 194,13.1,35.2
    .complete 14123,2 --1/1 The Goblin Lisa
step
    #completewith next
    .goto 194,17.66,44.49,8,0
    .goto 194,17.66,45.92,8,0
    .goto 194,16.79,46.89,5,0
    .goto 194,17.84,46.82,5,0
    .goto 194,17.34,45.91,3 >>上楼梯
step
    #label KezanWaltzRightIn
    >>拾取 |cRXP_LOOT_Maldy 的猎鹰|r
    .goto 194,16.7,46.2
    .complete 14123,1 --1/1 Maldy's Falcon
step
    #completewith next
    .goto 194,17.65,45.94,5,0
    .goto 194,17.00,33.96
    .deathskip >>跳出窗户，撞上敌对的 |cRXP_ENEMY_Villa Mooks|r 或 |cRXP_ENEMY_Keesnout Potbellys|r 就会死
step
    #completewith next
    .goto 194,61.89,54.13,25,0
    .goto 194,57.90,71.17,15 >>按照前往总部的路线
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史莉琪·剃刀|r
    .goto 194,58.97,76.03
    .turnin 14123 >>交任务: |cRXP_FRIENDLY_别墅漫步|r
    .target Slinky Sharpshiv
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 194,59.7,76.9
    .turnin 14122 >>交任务: |cRXP_FRIENDLY_紧急措施|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .goto 194,60.0,78.2
    .turnin 14121 >>交任务: |cRXP_FRIENDLY_热力追踪|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 194,62.9,77.8
    .turnin 14124 >>交任务: |cRXP_FRIENDLY_搜刮卡亚矿石|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 194,59.8,76.9
    .accept 14125 >>接任务: |cRXP_WARN_447|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t进入房子并点击|cRXP_PICK_Defective Generator|r
    .goto 194,56.07,76.63
    .complete 14125,1 --1/1 Overload the Defective Generator
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Leaky Stove|r
    .goto 194,56.05,74.67
    .complete 14125,2 --1/1 Activate the Leaky Stove
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t上楼梯，点击|cRXP_PICK_易燃床|r
    .goto 194,55.98,77.11,5,0
    .goto 194,56.64,76.33,5,0
    .goto 194,56.61,74.85
    .complete 14125,3 --1/1 Drop a Cigar on the Flammable Bed
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t跳出窗口并点击|cRXP_PICK_Gasbot 控制面板|r
    >>等待简短的角色扮演
    .goto 194,56.60,76.93,8,0
    .goto 194,59.49,76.81
    .complete 14125,4 --1/1 KTC Headquarters Set Ablaze with Gasbot!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_事故勘察员|r, |cRXP_FRIENDLY_莎希·硬钳|r
    .turnin 14125 >>交任务: |cRXP_FRIENDLY_447|r
    .goto 194,59.6,76.6
    .accept 14126 >>接任务: |cRXP_WARN_毕生积蓄|r
    .goto 194,59.6,77.1
    .target Claims Adjuster
    .target Sassy Hardwrench
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请确保使用你的|T134246:0|t[按键 to the Hot Rod]|r。
step
    #completewith next
    .goto 194,25.69,32.13,10,0
    .goto 194,22.22,24.92,10 >>拥抱山的一侧
step
    #completewith next
    .goto 194,22.31,16.78
    .cast 92633 >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击大炮
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .use 46856
    .goto 194,20.8,13.7
    .turnin 14126 >>交任务: |cRXP_FRIENDLY_毕生积蓄|r
    .target Trade Prince Gallywix
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎普诺兹医生|r
    >>有时你可能会卡住，必须重新登录或/reload
    .goto 174,24.6,77.9
    .turnin 14239 >>交任务: |cRXP_FRIENDLY_还不是见圣光的时候！|r
    .target Doc Zapnozzle
step
    .goto 174,24.65,77.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“发明家”盖格林登|r
    .accept 14001 >>接任务: |cRXP_WARN_地精逃生舱|r
    .target Geargrinder Gizmo
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Goblin Escape Pods|r
    .goto 174,22.99,75.62,30,0
    .goto 174,25.50,77.65,30,0
    .goto 174,25.37,75.44
    .complete 14001,1 --6/6 Goblin Survivors Rescued
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sassy Handwrench|r
    .goto 174,27.9,75.5
    .turnin 14001 >>交任务: |cRXP_FRIENDLY_地精逃生舱|r
    .accept 14014 >>接任务: |cRXP_WARN_夺回工具箱！|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦克斯·雪崩|r
    .goto 174,27.85,74.29
    .accept 14473 >>接任务: |cRXP_WARN_收拾烂摊子|r
    .target Maxx Avalanche
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴姆·重磅炸弹|r
    .goto 174,27.95,74.43
    .accept 14019 >>接任务: |cRXP_WARN_闯祸的猴子|r
    .target Bamm Megabomb
step << Hunter
    #completewith next
    .cast 1515 >>驯服一只 |cRXP_ENEMY_Teraptor Hatchling|r
    .mob Teraptor Hatchling
step
    #sticky
    #label TheLostIslesTeraMonkeys
    >>使用 |T133979:0|t[硝基钾香蕉] 对 |cRXP_ENEMY_Bomb Throwing Monkeys|r 并杀死 |cRXP_ENEMY_Teraptor Hatchlings|r
    .use 49028
    .goto 174,27.32,70.14,0,0
    .complete 14473,1 --6/6 Teraptor Hatchling slain
    .complete 14019,1 --10/10 Bomb-Throwing Monkeys Fed
    .mob Bomb Throwing Monkeys
    .mob Teraptor Hatchlings
step
    >>收集 |cRXP_LOOT_工具箱|r
    .goto 174,29.73,75.42,15,0
    .goto 174,30.35,74.49,15,0
    .goto 174,30.10,72.55,20,0
    .goto 174,28.44,70.88,20,0
    .goto 174,27.32,70.14,20,0
    .complete 14014,1 --8/8 Crate of Tools
step
    #requires TheLostIslesTeraMonkeys
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦克斯·雪崩|r, |cRXP_FRIENDLY_巴姆·重磅炸弹|r
    .turnin 14473 >>交任务: |cRXP_FRIENDLY_收拾烂摊子|r
    .goto 174,27.85,74.29
    .turnin 14019 >>交任务: |cRXP_FRIENDLY_闯祸的猴子|r
    .goto 174,27.95,74.43
    .target Maxx Avalanche
    .target Bamm Megabomb
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sassy Handwrench|r
    .goto 174,27.9,75.5
    .turnin 14014 >>交任务: |cRXP_FRIENDLY_夺回工具箱！|r
    .accept 14248 >>接任务: |cRXP_WARN_急需帮助|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 174,31.27,79.26
    .turnin 14248 >>交任务: |cRXP_FRIENDLY_急需帮助|r
    .accept 14021 >>接任务: |cRXP_WARN_矿工的麻烦|r
    .accept 14031 >>接任务: |cRXP_WARN_捕获未知的信息|r
    .target Foreman Dampwick
step
    >>使用|T134442:0|t[KTC Snapflash]拍摄墙上标有浮动相机的画作
    .goto 175,55.29,68.39
    .use 49887
    .complete 14031,1 --1/1 Cave Painting 1 Captured
step
    >>使用|T134442:0|t[KTC Snapflash]拍摄墙上标有浮动相机的画作
    .use 49887
    .goto 175,46.82,53.78,10,0
    .goto 175,60.44,63.52
    .complete 14031,2 --1/1 Cave Painting 2 Captured
step
    >>使用|T134442:0|t[KTC Snapflash]拍摄墙上标有浮动相机的画作
    .goto 175,83.43,46.55
    .complete 14031,3 --1/1 Cave Painting 3 Captured
step
    .goto 175,51.28,19.23,10,0
    .goto 175,42.41,23.23,0,0
    >>使用|T134442:0|t[KTC Snapflash]拍摄墙上标有浮动相机的画作
    .use 49887
    .complete 14031,4 --1/1 Pygmy Altar Captured
step
    >>关注并保护|cRXP_FRIENDLY_Fightened Miner|r
    .complete 14021,1 --1/1 Kaja'mite Ore mining a success!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t尝试与 |cRXP_FRIENDLY_Dead Orc Scout|r 交谈
    .goto 175,42.3,24.4
    .accept 14233 >>接任务: |cRXP_WARN_兽人会写字？|r
    .target Dead Orc Scout
step
    #requires TheLostIslesSnapflash4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t离开洞穴并与 |cRXP_FRIENDLY_Foreman Dampwick|r 交谈
    .goto 175,55.05,79.29,10,0
    .goto 174,31.27,79.27
    .turnin 14021 >>交任务: |cRXP_FRIENDLY_矿工的麻烦|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sassy Handwrench|r
    .goto 174,27.88,75.55
    .turnin 14031 >>交任务: |cRXP_FRIENDLY_捕获未知的信息|r
    .turnin 14233 >>交任务: |cRXP_FRIENDLY_兽人会写字？|r
    .accept 14234 >>接任务: |cRXP_WARN_敌人的敌人就是……|r
    .target Sassy Handwrench
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step
    #completewith next
    .goto 174,32.73,80.53,30,0
    .goto 174,34.36,80.78,30,0
    .goto 174,36.96,77.02,20 >>沿着小路上山
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格娜|r
    .goto 174,37.63,78.02
    .turnin 14234 >>交任务: |cRXP_FRIENDLY_敌人的敌人就是……|r
    .accept 14235 >>接任务: |cRXP_WARN_恶花谷|r
    .target Aggra
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基拉格·血牙|r
    .goto 174,35.43,75.71
    .turnin 14235 >>交任务: |cRXP_FRIENDLY_恶花谷|r
    .accept 14236 >>接任务: |cRXP_WARN_除草无双|r
    .target Kilag Gorefang
step
    >>使用 |cRXP_FRIENDLY_Weed Whacker|r 并穿过 |cRXP_ENEMY_plants|r 来杀死它们
    .use 49108
    .goto 174,33.90,72.85,30,0
    .goto 174,32.81,76.42,20,0
    .complete 14236,1 --100/100 Deadly Jungle Plants mowed down
    .mob Deadly Jungle Plant
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基拉格·血牙|r
    .goto 174,35.43,75.71
    .turnin 14236 >>交任务: |cRXP_FRIENDLY_除草无双|r
    .accept 14303 >>接任务: |cRXP_WARN_向阿格娜复命|r
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格娜|r
    .goto 174,37.63,78.02
    .turnin 14303 >>交任务: |cRXP_FRIENDLY_向阿格娜复命|r
    .accept 14237 >>接任务: |cRXP_WARN_继续前进|r
    .target Aggra
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基拉格·血牙|r
    .goto 174,34.62,66.85
    .turnin 14237 >>交任务: |cRXP_FRIENDLY_继续前进|r
    .accept 14238 >>接任务: |cRXP_WARN_死亡的红外光|r
    .target Kilag Gorefang
step
    >>使用 |T133149:0|t[红外热焦点] 并杀死 |cRXP_ENEMY_SI:7 Assassins|r
    .use 49611
    .goto 174,31.67,65.81
    .complete 14238,1 --10/10 SI:7 Assassin slain
    .mob SI:7 Assassin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基拉格·血牙|r
    .goto 174,34.61,66.85
    .turnin 14238 >>交任务: |cRXP_FRIENDLY_死亡的红外光|r
    .accept 14240 >>接任务: |cRXP_WARN_前往峭壁|r
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斥候布拉克斯|r
    .goto 174,25.28,59.84
    .turnin 14240 >>交任务: |cRXP_FRIENDLY_前往峭壁|r
    .accept 14241 >>接任务: |cRXP_WARN_旋翼机！|r
    .target Scout Brax
step
    >>杀死 |cRXP_ENEMY_SI:7 特工|r 和 |cRXP_ENEMY_Gyrochopper 飞行员|r。从他们身上夺取 |cRXP_LOOT_Gyrochoppa 钥匙|r
    .goto 174,23.23,67.50
    .complete 14241,1 --1/1 Gyrochoppa 按键
    .mob SI:7 Operative
    .mob Gyrochopper Pilot
step
    >>与 |cRXP_FRIENDLY_Gyrochoppa|r 互动。你可以忽略飞行员。
    .goto 174,23.2,67.5
    .turnin 14241 >>交任务: |cRXP_FRIENDLY_旋翼机！|r
    .accept 14242 >>接任务: |cRXP_WARN_珍贵的货物|r
    .target Gyrochoppa
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船内并与 |cRXP_FRIENDLY_Thrall|r 交谈
    .goto 174,11.8,62.7
    .complete 14242,1 --1/1 Precious Cargo located
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r
    .goto 174,11.8,62.8
    .turnin 14242 >>交任务: |cRXP_FRIENDLY_珍贵的货物|r
    .accept 14326 >>接任务: |cRXP_WARN_甲板上见|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出去在甲板上和 |cRXP_FRIENDLY_Thrall|r 见面
    .goto 174,12.68,63.33,10,0
    .goto 174,12.4,63.1
    .turnin 14326 >>交任务: |cRXP_FRIENDLY_甲板上见|r
    .accept 14243 >>接任务: |cRXP_WARN_酋长的复仇|r
    .target Thrall
step
    >>使用 |T237589:0|t[闪电打击] (1) 集中攻击小船。否则就杀死 |cRXP_FRIENDLY_swimming sailors|r。
    .complete 14243,1 --50/50 Alliance Sailor slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r
    .goto 174,35.92,66.72
    .turnin 14243 >>交任务: |cRXP_FRIENDLY_酋长的复仇|r
    .accept 14445 >>接任务: |cRXP_WARN_暂时的离别|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,36.02,67.53
    .turnin 14445 >>交任务: |cRXP_FRIENDLY_暂时的离别|r
    .accept 14244 >>接任务: |cRXP_WARN_爬升，爬升，火箭分离！|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Rocket Sling|r
    .goto 174,36.34,66.55
    .skipgossip
    .complete 14244,1 --1/1 Rocket Sling Trip Survived
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 174,44.54,64.36
    .turnin 14244 >>交任务: |cRXP_FRIENDLY_爬升，爬升，火箭分离！|r
    .accept 14245 >>接任务: |cRXP_WARN_胶囊镇|r
    .target Foreman Dampwick
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Town-In-A-Box Plunger|r
    .goto 174,45.40,65.36
    .complete 14245,1 --1/1 Town-In-A-Box Set Off!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r
    .goto 174,45.36,64.74
    .turnin 14245 >>交任务: |cRXP_FRIENDLY_胶囊镇|r
    .accept 27139 >>接任务: |cRXP_WARN_霍巴特需要你|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,45.34,65.22
    .turnin 27139 >>交任务: |cRXP_FRIENDLY_霍巴特需要你|r
    .accept 24671 >>接任务: |cRXP_WARN_飞翔的肉鸡|r
    .target Hobart Grapplehammer
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击城镇周围的 10 个 |cRXP_PICK_cluckers|r
#loop
	.line 174,45.64,64.12,46.45,64.90,47.03,65.75,46.28,66.40,45.39,66.82,44.55,66.91,44.52,65.61,44.67,63.90
	.goto 174,45.64,64.12,20,0
	.goto 174,46.45,64.90,20,0
	.goto 174,47.03,65.75,20,0
	.goto 174,46.28,66.40,20,0
	.goto 174,45.39,66.82,20,0
	.goto 174,44.55,66.91,20,0
	.goto 174,44.52,65.61,20,0
	.goto 174,44.67,63.90,20,0
    .complete 24671,1 --10/10 Wild Cluckers captured
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r, |cRXP_FRIENDLY_巴姆·重磅炸弹|r
    .turnin 24671 >>交任务: |cRXP_FRIENDLY_飞翔的肉鸡|r
    .goto 174,45.34,65.22
    .accept 24741 >>接任务: |cRXP_WARN_以小换大|r
    .goto 174,45.25,64.85
    .target Hobart Grapplehammer
    .target Bamm Megabomb
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step
    >>使用 |T236997:0|t[野生集群蛋] 将蛋放入陷阱。然后等待 |cRXP_ENEMY_raptor|r 踏入陷阱并掠夺 |cRXP_PICK_Spiny Raptor Egg|r
    .use 50232
    .goto 174,49.64,63.45,30,0
    .goto 174,50.25,65.80,20,0
    .goto 174,50.64,68.35,15,0
    .goto 174,47.83,69.14,20,0
    .goto 174,45.93,69.88
    .complete 24741,1 --5/5 Spiny Raptor Egg
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴姆·重磅炸弹|r, |cRXP_FRIENDLY_霍巴特·钩锤|r
    .turnin 24741 >>交任务: |cRXP_FRIENDLY_以小换大|r
    .goto 174,45.25,64.85
    .accept 24744 >>接任务: |cRXP_WARN_史上第一巨蛋|r
    .goto 174,45.34,65.21
    .target Bamm Megabomb
    .target Hobart Grapplehammer
step
    >>杀死 |cRXP_ENEMY_Mechachicken|r。掠夺其 |cRXP_LOOT_egg|r
    .goto 174,44.46,54.24
    .complete 24744,1 --1/1 The Biggest Egg Ever
    .mob Mechachicken
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,45.34,65.21
    .turnin 24744 >>交任务: |cRXP_FRIENDLY_史上第一巨蛋|r
    .accept 24816 >>接任务: |cRXP_WARN_到底谁站在食物链顶层？|r
    .target Hobart Grapplehammer
step
    >>杀死 |cRXP_ENEMY_Ravenous Lurkers|r。掠夺他们的 |cRXP_LOOT_parts|r
    .goto 174,43.41,70.15,20,0
    .goto 174,42.49,63.12,20,0
    .goto 174,41.53,63.36,10,0
    .goto 174,42.6,62.7
    .complete 24816,1 --5/5 Shark Parts
    .mob Ravenous Lurker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .goto 174,45.27,65.57
    .turnin 24816 >>交任务: |cRXP_FRIENDLY_到底谁站在食物链顶层？|r
    .accept 24817 >>接任务: |cRXP_WARN_披着鲨鱼皮的地精|r
    .target Assistant Greely
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Mechshark X-Steam 控制器|r
    .goto 174,43.68,65.50
    .complete 24817,1 --1/1 Use the Mechashark X-Steam Controller
step
    >>使用你的 1 2 能力杀死 |cRXP_ENEMY_The Hammer|r。
    .goto 174,41.7,66.7
    .complete 24817,2 --1/1 The Hammer slain
    .mob The Hammer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,45.34,65.21
    .turnin 24817 >>交任务: |cRXP_FRIENDLY_披着鲨鱼皮的地精|r
    .accept 24856 >>接任务: |cRXP_WARN_迫在眉睫的威胁|r
    .target Hobart Grapplehammer
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .goto 174,52.2,73.2
    .turnin 24856 >>交任务: |cRXP_FRIENDLY_迫在眉睫的威胁|r
    .accept 24858 >>接任务: |cRXP_WARN_锈水财阀的地权主张|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“硬币”布雷特|r
    .goto 174,52.20,73.22
    .accept 24859 >>接任务: |cRXP_WARN_纳迦皮|r
    .target Brett "Coins" McQuid
step
    #completewith next
    >>更换旗帜时杀死 |cRXP_ENEMY_Nagas|r。掠夺他们的 |cRXP_LOOT_hides|r
    .goto 174,54.12,78.39,0,0
    .complete 24859,1 --5/5 Intact Naga Hide
step
    .goto 174,52.22,79.19,10,0
    .goto 174,52.76,78.97,10,0
    .goto 174,53.47,80.15,10,0
    .goto 174,54.14,79.91,10,0
    .goto 174,54.81,79.39,10,0
    .goto 174,55.50,79.54,10,0
    .goto 174,55.49,77.98,10,0
    .goto 174,54.86,76.94,10,0
    .goto 174,55.04,76.25,10,0
    .goto 174,53.53,76.90,10,0
    .complete 24858,1 --10/10 Naga Banners replaced
step
    >>更换旗帜时杀死 |cRXP_ENEMY_Nagas|r。掠夺他们的 |cRXP_LOOT_hides|r
    .goto 174,54.27,83.49,30,0
    .goto 174,54.12,78.39,0,0
    .complete 24859,1 --5/5 Intact Naga Hide
    .mob Vashj'elan Warrior
    .mob Vashj'elan Siren
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“硬币”布雷特|r, |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .turnin 24859 >>交任务: |cRXP_FRIENDLY_纳迦皮|r
    .goto 174,52.2,73.22
    .turnin 24858 >>交任务: |cRXP_FRIENDLY_锈水财阀的地权主张|r
    .accept 24864 >>接任务: |cRXP_WARN_无法抗拒的池塘小马|r
    .goto 174,52.20,73.14
    .target Brett "Coins" McQuid
    .target Megs Dreadshredder
step
    #completewith next
    .use 50602
    .cast 71914 >>一旦到达水面，请使用 |T132261:0|t[Irresistible Pool Pony]。
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Naga Hatchlings|r. |cRXP_WARN_小心不要用 AoE 技能杀死幼崽|r
    .use 50602
    .goto 174,59.23,83.03
    .complete 24864,1 --12/12 Naga Hatchlings lured
    .target Naga Hatchling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Megs Dreadshredder|r
    .goto 174,52.2,73.15
    .turnin 24864 >>交任务: |cRXP_FRIENDLY_无法抗拒的池塘小马|r
    .accept 24868 >>接任务: |cRXP_WARN_和谈的希望|r
    .target Megs Dreadshredder
step
    >>|cRXP_WARN_当你看到重生动画（紫色圆圈）时，你就可以回去了。继续向后看，因为你仍然需要杀死|cRXP_ENEMY_leader|r|r
    .goto 174,54.07,90.06,1,0
    .goto 174,53.90,84.17
    .complete 24868,1 --1/1 Leader of the naga dealt with
    .mob Faceless of the Deep
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅格斯·碎纸机|r
    .goto 174,52.20,73.15
    .turnin 24868 >>交任务: |cRXP_FRIENDLY_和谈的希望|r
    .accept 24897 >>接任务: |cRXP_WARN_返回胶囊镇|r
    .target Megs Dreadshredder
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,45.18,64.91
    .turnin 24897 >>交任务: |cRXP_FRIENDLY_返回胶囊镇|r
    .accept 24901 >>接任务: |cRXP_WARN_胶囊镇：遭到攻击|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_B.C. Eliminator|r 进入并射击 |cRXP_ENEMY_Oomlot Warriors|r
    .goto 174,45.7,65.0
    .complete 24901,1 --30/30 Oomlot Warriors defeated
step
    #completewith next
    +|cRXP_WARN_离开车辆|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,45.2,64.9
    .turnin 24901 >>交任务: |cRXP_FRIENDLY_胶囊镇：遭到攻击|r
    .accept 24924 >>接任务: |cRXP_WARN_乌姆洛特村|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_小静|r
    .goto 174,56.56,71.96
    .turnin 24924 >>交任务: |cRXP_FRIENDLY_乌姆洛特村|r
    .accept 24925 >>接任务: |cRXP_WARN_营救俘虏|r
    .accept 24929 >>接任务: |cRXP_WARN_传递信息|r
    .target Izzy
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Oomlot Shamans|r 以释放地精
    .goto 174,59.16,70.39,0,0
    .complete 24925,1 --5/5 Goblin Captives freed
    .mob Oomlot Shaman
step
    >>杀死 |cRXP_ENEMY_Yngwie|r
    .goto 174,59.20,67.32,15,0
    .goto 174,62.91,68.54
    .complete 24929,1 --1/1 Yngwie slain
    .mob Yngwie
step
    >>杀死 |cRXP_ENEMY_Oomlot Shamans|r 以释放地精
    .goto 174,59.16,70.39
    .complete 24925,1 --5/5 Goblin Captives freed
    .mob Oomlot Shaman
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_小静|r
    .goto 174,56.56,71.96
    .turnin 24925 >>交任务: |cRXP_FRIENDLY_营救俘虏|r
    .turnin 24929 >>交任务: |cRXP_FRIENDLY_传递信息|r
    .accept 24937 >>接任务: |cRXP_WARN_危机解除|r
    .target Izzy
step
    #completewith next
    .hs >>从炉边到小镇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,45.2,64.9
    .turnin 24937 >>交任务: |cRXP_FRIENDLY_危机解除|r
    .accept 24940 >>接任务: |cRXP_WARN_前往火山口|r
    .target Sassy Hardwrench
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 来更快地移动
    .use 132516
    .itemcount 132516,1
step
    #completewith next
    +|cRXP_WARN_跑上山时避开 |cRXP_ENEMY_Goblin Zombies|r|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r, |cRXP_FRIENDLY_工头戴姆维克|r, |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 24940 >>交任务: |cRXP_FRIENDLY_前往火山口|r
    .accept 24942 >>接任务: |cRXP_WARN_僵尸大战超级火箭靴|r
    .goto 174,51.8,47.1
    .accept 24945 >>接任务: |cRXP_WARN_三个小俾格米人|r
    .goto 174,51.85,47.19
    .accept 24946 >>接任务: |cRXP_WARN_摇滚粉末|r
    .goto 174,51.73,47.38
    .target Coach Crosscheck
    .target Foreman Dampwick
    .target Assistant Greely
step
    #completewith next
    >>|cRXP_WARN_如果你是暗影牧师，你必须取消暗影形态才能使用靴子|r <<Priest
    .use 52013
    .goto 174,51.77,46.97
    .cast 72891 >>|cRXP_WARN_使用 |T133029:0|t[超级助推火箭靴]|r
step
    #completewith next
    >>穿着火箭靴走过 |cRXP_ENEMY_Goblin Zombies|r 来杀死它们
    >>|cRXP_WARN_Avoid |cRXP_ENEMY_Oostan 猎头人|r|r。他们可以轻易杀死你
    .use 52013
    .complete 24942,1 --50/50 Goblin Zombies slain
step
    #completewith TheLostIslesGaahl
    >>从地上捡起 |cRXP_PICK_Rockin' Powder|r
    .complete 24946,1 --5/5 Rockin' Powder
step
    >>杀死|cRXP_ENEMY_Malmo|r
    .goto 174,58.74,47.16
    .complete 24945,2 --1/1 Malmo slain
    .mob Malmo
step
    >>杀死 |cRXP_ENEMY_Teloch|r
    .goto 174,63.7,52.76
    .complete 24945,3 --1/1 Teloch slain
    .mob Teloch
step
    #label TheLostIslesGaahl
    >>杀死|cRXP_ENEMY_Gaahl
    .goto 174,59.59,40.20
    .complete 24945,1 --1/1 Gaahl slain
    .mob Gaahl
step
    >>环顾四周，捡起剩余的|cRXP_PICK_Rockin' Powders|r
    .goto 174,58.8,40.5
    .complete 24946,1 --5/5 Rockin' Powder
step
    >>穿着火箭靴走过 |cRXP_ENEMY_Goblin Zombies|r 来杀死它们
    .use 52013
    .goto 174,56.67,44.26,15,0
    .complete 24942,1 --50/50 Goblin Zombies slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头戴姆维克|r, Assistant Greedy, |cRXP_FRIENDLY_克罗斯彻克教练|r
    .turnin 24945 >>交任务: |cRXP_FRIENDLY_三个小俾格米人|r
    .goto 174,51.85,47.20
    .turnin 24946 >>交任务: |cRXP_FRIENDLY_摇滚粉末|r
    .goto 174,51.73,47.38
    .turnin 24942 >>交任务: |cRXP_FRIENDLY_僵尸大战超级火箭靴|r
    .accept 24952 >>接任务: |cRXP_WARN_火箭靴的威力|r
    .goto 174,51.8,47.1
    .target Foreman Dampwick
    .target Assistant Greedy
    .target Coach Crosscheck
step
    >>使用 |T133029:0|t[注入摇滚粉末的火箭靴]
    .use 52032
    .complete 24952,1 --1/1 Rockin' Powder Infused Rocket Boots used
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,68.93,46.44
    .turnin 24952 >>交任务: |cRXP_FRIENDLY_火箭靴的威力|r
    .accept 24954 >>接任务: |cRXP_WARN_龟神的子嗣|r
    .target Hobart Grapplehammer
step
    >>杀死 |cRXP_ENEMY_Childs of Volcanoth|r。掠夺他们以获得 |cRXP_LOOT_glands|r
    .goto 174,66.92,44.29,20,0
    .goto 174,68.64,43.40
    .complete 24954,1 --5/5 Fire Gland
    .mob Childs of Volcanoth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,68.93,46.44
    .turnin 24954 >>交任务: |cRXP_FRIENDLY_龟神的子嗣|r
    .accept 24958 >>接任务: |cRXP_WARN_沃卡洛斯！|r
    .target Hobart Grapplehammer
step
    >>在 |cRXP_ENEMY_Volcanoth|r 的路径点位置使用 |T135624:0|t[Bootzooka] 发送垃圾邮件
    .use 52043
    .goto 176,55.55,33.93
    .complete 24958,1 --1/1 Volcanoth slain
    .mob Volcanoth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 176,62.99,49.87
    .turnin 24958 >>交任务: |cRXP_FRIENDLY_沃卡洛斯！|r
    .accept 25023 >>接任务: |cRXP_WARN_老朋友|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r, |cRXP_FRIENDLY_莎希·硬钳|r, |cRXP_FRIENDLY_阿格娜|r
    .turnin 25023 >>交任务: |cRXP_FRIENDLY_老朋友|r
    .accept 25024 >>接任务: |cRXP_WARN_击退伞兵|r
    .goto 174,36.79,43.14
    .accept 25058 >>接任务: |cRXP_WARN_以地精的方式拆除地雷|r
    .goto 174,37.35,41.91
    .accept 25093 >>接任务: |cRXP_WARN_军情七处的头目们|r
    .goto 174,36.26,43.36
    .target Thrall
    .target Sassy Hardwrench
    .target Aggra
step
    #sticky
    #label TheLostIslesLandMines
    >>使用 |T133716:0|t[手榴弹包] 摧毁地雷
    .goto 174,32.38,36.34,0,0
    .use 52280
    .complete 25058,1 --10/10 Land Mines detonated
step
    #completewith TheLostIslesCyn
    >>杀死 |cRXP_ENEMY_Alliance 伞兵|r
    .complete 25024,1 --10/10 Alliance Paratrooper slain
    .mob Alliance Paratrooper
step
    >>杀死 |cRXP_ENEMY_Commander Arrington|r。夺取他的 |cRXP_LOOT_head|r
    .goto 174,32.29,42.89
    .complete 25093,1 --1/1 Commander Arrington's Head
    .target Commander Arrington
step
    >>杀死 |cRXP_ENEMY_Alexi Silenthowl|r。夺取他的 |cRXP_LOOT_head|r
    .goto 174,30.80,33.92
    .complete 25093,3 --1/1 Alexi Silenthowl's Head
    .mob Alexi Silenthowl
step
    #label TheLostIslesCyn
    >>杀死 |cRXP_ENEMY_Darkblade Cyn|r。掠夺他的 |cRXP_LOOT_head|r
    .goto 174,33.44,27.88
    .complete 25093,2 --1/1 Darkblade Cyn's Head
    .mob Darkblade Cyn
step
    >>杀死 |cRXP_ENEMY_Alliance 伞兵|r
    .goto 174,32.38,36.34
    .complete 25024,1 --10/10 Alliance Paratrooper slain
    .mob Alliance Paratrooper
step
    #requires TheLostIslesLandMines
    #completewith next
    .cooldown item,6948,<1,1
    .hs >>炉边到酋长的瞭望台
step
    #requires TheLostIslesLandMines
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r, |cRXP_FRIENDLY_阿格娜|r, |cRXP_FRIENDLY_莎希·硬钳|r
    .turnin 25024 >>交任务: |cRXP_FRIENDLY_击退伞兵|r
    .goto 174,36.8,43.1
    .turnin 25093 >>交任务: |cRXP_FRIENDLY_军情七处的头目们|r
    .goto 174,36.26,43.37
    .turnin 25058 >>交任务: |cRXP_FRIENDLY_以地精的方式拆除地雷|r
    .accept 25066 >>接任务: |cRXP_WARN_科赞的骄傲|r
    .goto 174,37.35,41.91
    .target Thrall
    .target Aggra
    .target Sassy Hardwrench
step
    #completewith next
    .skipgossip 38387,1
    .vehicle 39074 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .target Sassy Hardwrench
step
    >>使用 |T134273:0|t[野鼬火箭] (2) 冷却中
    >>否则垃圾邮件 |T135627:0|t[机关枪] (1)
    .goto 174,30.37,39.89
    .complete 25066,1 --10/10 Gnomeregan Stealth Fighters shot down
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t飞回去和 |cRXP_FRIENDLY_Sassy Hardwrench|r 交谈
    .goto 174,37.36,41.92
    .turnin 25066 >>交任务: |cRXP_FRIENDLY_科赞的骄傲|r
    .accept 25098 >>接任务: |cRXP_WARN_觐见酋长|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r
    .goto 174,36.79,43.13
    .turnin 25098 >>交任务: |cRXP_FRIENDLY_觐见酋长|r
    .accept 25099 >>接任务: |cRXP_WARN_借巴斯蒂亚一用|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基拉格·血牙|r
    .goto 174,33.8,38.8
    .turnin 25099 >>交任务: |cRXP_FRIENDLY_借巴斯蒂亚一用|r
    .accept 25100 >>接任务: |cRXP_WARN_奔跑吧|r
    .timer 87,Panther Ride
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史莉琪·剃刀|r
    .goto 174,53.71,34.94
    .turnin 25100 >>交任务: |cRXP_FRIENDLY_奔跑吧|r
    .accept 25109 >>接任务: |cRXP_WARN_加里维克斯劳工矿井|r
    .target Slinky Sharpshiv
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入洞穴，跳下去并与 |cRXP_FRIENDLY_Assistant Greely|r 交谈
    .goto 174,54.09,36.01,10,0
    .goto 174,54.94,33.72,10,0
    .goto 174,53.17,36.55
    .turnin 25109 >>交任务: |cRXP_FRIENDLY_加里维克斯劳工矿井|r
    .accept 25110 >>接任务: |cRXP_WARN_卡亚可乐，给你灵感！(注册商标)|r
    .target Assistant Greely
step
    >>从地上捡起一罐 |cRXP_PICK_Kaja'Cola Zero-One|r
    .goto 174,53.59,37.41,10,0
    .goto 174,53.94,37.46,10,0
    .goto 174,53.70,36.67
    .complete 25110,1 --1/1 Kaja'Cola Zero-One
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .goto 174,53.17,36.55
    .turnin 25110 >>交任务: |cRXP_FRIENDLY_卡亚可乐，给你灵感！(注册商标)|r
    .accept 25122 >>接任务: |cRXP_WARN_重振士气|r
    .accept 25123 >>接任务: |cRXP_WARN_摧毁灵魂石！|r
    .target Assistant Greely
step
    #sticky
    >>你需要收集总共 9 个 Kaja'Colas Zero-One
    >>瞄准 |cRXP_FRIENDLY_Kezan Citizen|r 并使用可乐
    .use 52484
    .collect 52484,9,25122,0xF
    .complete 25122,4 --6/6 Other goblin's minds freed
    .target Kezan Citizen
step
    #title Free Ace
    >>目标 |cRXP_FRIENDLY_Ace|r 并使用 Kaja'Cola Zero-One
    .goto 174,57.1,36.9
    .use 52484
    .complete 25122,1 --1/1 Ace's mind freed
    .target Ace
step
    #title Free Izzy
    >>目标 |cRXP_FRIENDLY_Izzy|r 并使用 Kaja'Cola Zero-One
    .goto 174,57.01,35.02
    .use 52484
    .complete 25122,2 --1/1 Izzy's mind freed
    .target Izzy
step
    >>杀死 |cRXP_ENEMY_Blastshadow the Brutemaster|r 并拾起飞来的紫色 |cRXP_PICK_Soulstone|r。瞄准 |cRXP_ENEMY_Blastshadow the Brutemaster|r 的尸体并使用 |T134336:0|t[Blastshadow 的灵魂石]
    .use 52481
    .goto 174,56.18,32.29
    .complete 25123,1 --1/1 Blastshadow's Soulstone destroyed
    .mob Blastshadow the Brutemaster
step
    #title Free Gobber
    >>目标 |cRXP_FRIENDLY_Gobber|r 并使用 Kaja'Cola Zero-One
    .goto 174,57.04,32.17
    .use 52484
    .complete 25122,3 --1/1 Gobber's mind freed
    .target Gobber
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 25123 >>交任务: |cRXP_FRIENDLY_摧毁灵魂石！|r
    .turnin 25122 >>交任务: |cRXP_FRIENDLY_重振士气|r
    .accept 25125 >>接任务: |cRXP_WARN_矿道尽头的亮光|r
    .target Assistant Greely
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与 |cRXP_PICK_Mine Cart|r 交互
    .goto 174,56.29,27.33
    .turnin 25125 >>交任务: |cRXP_FRIENDLY_矿道尽头的亮光|r
    .accept 25184 >>接任务: |cRXP_WARN_乘坐采矿车|r
step
    >>乘坐矿车
    .goto 174,54.2,17.0
    .complete 25184,1 --1/1 Mine Cart ridden
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .goto 174,54.4,16.9
    .turnin 25184 >>交任务: |cRXP_FRIENDLY_乘坐采矿车|r
    .accept 25200 >>接任务: |cRXP_WARN_清理伐木机|r
    .target Assistant Greely
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r
    .goto 174,54.44,16.93
    .accept 25201 >>接任务: |cRXP_WARN_终极足球炸弹制服|r
    .target Coach Crosscheck
step
    #sticky
    #label TheLostIslesShredderShutdown
    >>杀死 |cRXP_ENEMY_Steamwheedle Sharks|r
    .goto 174,53.5,18.9,0,0
    .complete 25200,1 --8/8 Steamwheedle Shark slain
    .mob Steamwheedle Shark
step
    >>拿起|cRXP_LOOT_备用伐木机零件|r
    .goto 174,53.24,19.55,20,0
    .goto 174,52.16,20.68,20,0
    .goto 174,51.85,19.17,20,0
    .goto 174,52.64,16.93,20,0
    .goto 174,53.13,18.70
    .complete 25201,1 --8/8 Spare Shredder Parts
step
    #requires TheLostIslesShredderShutdown
    #completewith next
    .goto 174,54.47,17.16
    .vendor
step
    #requires TheLostIslesShredderShutdown
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗斯彻克教练|r
    .goto 174,54.44,16.93
    .turnin 25201 >>交任务: |cRXP_FRIENDLY_终极足球炸弹制服|r
    .target Coach Crosscheck
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .goto 174,54.4,16.93
    .turnin 25200 >>交任务: |cRXP_FRIENDLY_清理伐木机|r
    .accept 25204 >>接任务: |cRXP_WARN_打开阀门|r
    .target Assistant Greely
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_王牌|r
    .goto 174,54.16,17.21
    .accept 25203 >>接任务: |cRXP_WARN_奇普是什么鬼名字？|r
    .target Ace
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_小静|r
    .goto 174,54.01,16.98
    .accept 25202 >>接任务: |cRXP_WARN_通往他的内心的捷径|r
    .target Izzy
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.85,15.86,10,0
    .goto 174,50.72,13.81
    .complete 25204,1 --1/1 Valve #1 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.5,13.2
    .complete 25204,3 --1/1 Valve #3 released
step << Female
    >>杀死 |cRXP_ENEMY_Chip Endale|r。掠夺他的 |cRXP_LOOT_heart|r
    .goto 174,50.1,13.8
    .complete 25202,1 --1/1 Still-Beating Heart
    .mob Chip Endale
step << Male
    >>杀死 |cRXP_ENEMY_Chip Endale|r。掠夺他的 |cRXP_LOOT_heart|r
    .goto 174,50.1,13.8
    .complete 25203,1 --1/1 Still-Beating Heart
    .mob Chip Endale
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,49.9,12.8
    .complete 25204,4 --1/1 Valve #4 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.2,11.8
    .complete 25204,2 --1/1 Valve #2 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与 |cRXP_PICK_Platform 控制面板|r 交互
    .goto 174,51.4,13.1
    .turnin 25204 >>交任务: |cRXP_FRIENDLY_打开阀门|r
    .accept 25207 >>接任务: |cRXP_WARN_再见，甜蜜的油井|r
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_红色按钮|r
    .goto 174,51.4,13.1
    .complete 25207,1 --1/1 KTC Oil Platform destroyed
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_王牌|r
    .goto 174,54.16,17.19
    .turnin 25203 >>交任务: |cRXP_FRIENDLY_奇普是什么鬼名字？|r
    .target Ace
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_小静|r
    .goto 174,54.01,16.97
    .turnin 25202 >>交任务: |cRXP_FRIENDLY_通往他的内心的捷径|r
    .target Izzy
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .goto 174,54.4,16.9
    .turnin 25207 >>交任务: |cRXP_FRIENDLY_再见，甜蜜的油井|r
    .accept 25213 >>接任务: |cRXP_WARN_奴隶营|r
    .timer 24,Shredder Ride
    .target Assistant Greely
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,43.63,25.32
    .turnin 25213 >>交任务: |cRXP_FRIENDLY_奴隶营|r
    .accept 25244 >>接任务: |cRXP_WARN_小甜甜是什么鬼名字？|r << Female
	.accept 25243 >>接任务: |cRXP_WARN_她爱我，她不爱我！|r << Male
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 174,43.85,25.30
    .accept 25214 >>接任务: |cRXP_WARN_极速逃逸|r
    .target Hobart
step
    #completewith next
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Captured Goblins|r
    .complete 25214,1 --8/8 Cages launched
    .target Captured Goblin
step
    >>杀死 |cRXP_ENEMY_Candy Cane|r
    .goto 174,39.68,27.18
    .complete 25244,1 << Female --1/1 Candy Cane slain
	.complete 25243,1 << Male --1/1 Candy Cane slain
    .mob Candy Cane
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Captured Goblins|r
    .goto 174,40.03,26.08,10,0
    .goto 174,41.03,25.24,15,0
    .goto 174,41.24,26.35
    .complete 25214,1 --8/8 Cages launched
    .target Captured Goblin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r, |cRXP_FRIENDLY_莎希·硬钳|r
    .turnin 25214 >>交任务: |cRXP_FRIENDLY_极速逃逸|r
    .goto 174,43.85,25.29
    .turnin 25244 >>交任务: |cRXP_FRIENDLY_小甜甜是什么鬼名字？|r << Female
	.turnin 25243 >>交任务: |cRXP_FRIENDLY_她爱我，她不爱我！|r << Male
    .accept 25251 >>接任务: |cRXP_WARN_最后的对峙|r
    .goto 174,43.63,25.32
    .target Hobart Grapplehammer
    .target Sassy Hardwrench
step
    >>进入 |cRXP_PICK_Ultimate Footbomb Uniform|r
    .goto 174,43.86,25.16
    .complete 25251,1 --1/1 Ultimate Footbomb Uniform
step
    >>目标 |cRXP_ENEMY_Trade Prince Gallywix|r 并且全部使用你冷却中的技能
    .goto 174,41.87,17.61,10,0
    .goto 174,43.4,19.9
    .complete 25251,2 --1/1 Trade Prince Gallywix dealt with
    .mob Trade Prince Gallywix
step
    #completewith next
    .goto 174,42.76,18.61,10,0
    .goto 174,42.24,19.45,20 >>跳下
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .goto 174,43.6,25.3
    .turnin 25251 >>交任务: |cRXP_FRIENDLY_最后的对峙|r
    .accept 25265 >>接任务: |cRXP_WARN_胜利！|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨尔|r
    .goto 174,42.16,17.37
    .turnin 25265 >>交任务: |cRXP_FRIENDLY_胜利！|r
    .accept 25266 >>接任务: |cRXP_WARN_酋长的大使|r
    .target Thrall
step
    #completewith next
    .goto 174,42.57,16.37
    .skipgossip
    .zone 1 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎希·硬钳|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darkspear Loyalist|r
    .goto 1,57.65,9.78
    .turnin 25266 >>交任务: |cRXP_FRIENDLY_酋长的大使|r
    .accept 25267 >>接任务: |cRXP_WARN_给加尔鲁什的消息|r
    .target Darkspear Loyalist
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Saurfang|r
    .goto 85,48.5,70.8
    .turnin 25267 >>交任务: |cRXP_FRIENDLY_给加尔鲁什的消息|r
    .target Saurfang
]])
