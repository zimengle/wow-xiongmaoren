RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 牛头人起始区域
#name 1 牛头人起始区
#displayname Chapter 1 - Camp Narache
#next 2 牛头人莫高雷
#defaultfor Tauren !DK

<< Horde
step << Tauren
    .zoneskip 1727
    #completewith MulgoreFirstQuestCheck
    +欢迎来到 RestedXP 的 |cfff78300Tauren 起始区|r 指南。
    *This route is roughly 10-20 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
step << Tauren
    .zoneskip 1727,1
    +您位于流放区，但当前指南针对的是|cfff78300亡灵起始区|r。
    +请选择|cfff78300Exiles Reach Guide|r。
step
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以对目标执行此操作。|r
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label MulgoreFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鹰风酋长|r
    .goto 462,27.7,28.2
    .accept 14449 >>接任务: |cRXP_WARN_第一步|r
    .target Chief Hawkwind
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格鲁尔·鹰风|r
    .goto 462,39.45,37.25
    .turnin 14449 >>交任务: |cRXP_FRIENDLY_第一步|r
    .accept 14452 >>接任务: |cRXP_LOOT_力量仪祭|r
    .target Grull Hawkwind
step
    >>杀死战斗 |cRXP_ENEMY_Bristleback Invaders|r
    .goto 462,40.93,35.68,15,0
    .goto 462,42.01,32.95,15,0
    .goto 462,44.65,34.68,15,0
    .goto 462,44.40,37.15,15,0
    .goto 462,40.81,38.19
    .complete 14452,1 --6/6 Bristleback Invaders slain
    .mob Bristleback Invader
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格鲁尔·鹰风|r
    .goto 462,39.45,37.25
    .turnin 14452 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
    .accept 24852 >>接任务: |cRXP_WARN_被囚禁的部族|r
    .target Grull Hawkwind
step
    #title Brave Freed 1
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t打开|cRXP_PICK_Quilboar Cage|r
    .goto 462,49.39,35.39
    .complete 24852,1,1 --4/4 Braves Freed
step
    #title Brave Freed 2
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t打开|cRXP_PICK_Quilboar Cage|r
    .goto 462,49.07,36.97
    .complete 24852,1,2 --4/4 Braves Freed
step
    #title Brave Freed 3
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t打开|cRXP_PICK_Quilboar Cage|r
    .goto 462,49.32,42.12
    .complete 24852,1,3 --4/4 Braves Freed
step
    #title Brave Freed 4
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t打开|cRXP_PICK_Quilboar Cage|r
    .goto 462,49.07,43.80
    .complete 24852,1,4 --4/4 Braves Freed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格鲁尔·鹰风|r
    .goto 462,39.45,37.25
    .turnin 24852 >>交任务: |cRXP_FRIENDLY_被囚禁的部族|r
    .accept 14458 >>接任务: |cRXP_WARN_去找阿达娜|r
    .target Grull Hawkwind
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿达娜·雷角|r
    .goto 462,30.9,50.6
    .turnin 14458 >>交任务: |cRXP_FRIENDLY_去找阿达娜|r
    .accept 14456 >>接任务: |cRXP_WARN_勇气仪祭|r
    .accept 14455 >>接任务: |cRXP_WARN_阻止号角手|r
    .target Adana Thunderhorn
step
    #completewith next
    >>杀死 |cRXP_ENEMY_刺背枪盗贼|r。抢劫盗贼的 |cRXP_LOOT_stolen 步枪|r。
    .complete 14456,1 --7/7 Stolen Rifle
    .mob Bristleback Gun Thief
step
    >>杀死 |cRXP_ENEMY_刺背棘刺者s|r
    .goto 462,32.82,63.39,15,0
    .goto 462,31.86,68.99,15,0
    .goto 462,34.93,70.00,15,0
    .goto 462,36.56,67.73
    .complete 14455,1 --7/7 刺背棘刺者 slain
    .mob 刺背棘刺者
step
    >>杀死 |cRXP_ENEMY_刺背枪盗贼|r。抢劫盗贼的 |cRXP_LOOT_stolen 步枪|r。
    .goto 462,36.18,61.12,15,0
    .goto 462,32.81,63.11
    .complete 14456,1 --7/7 Stolen Rifle
    .mob Bristleback Gun Thief
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿达娜·雷角|r
    .goto 462,30.9,50.6
    .turnin 14456 >>交任务: |cRXP_FRIENDLY_勇气仪祭|r
    .turnin 14455 >>交任务: |cRXP_FRIENDLY_阻止号角手|r
    .accept 14459 >>接任务: |cRXP_LOOT_斗猪|r
    .accept 14461 >>接任务: |cRXP_WARN_邪恶的食粮|r
    .target Adana Thunderhorn
step
    #sticky
    #label mulgoreAmoredBattleboar
    >>杀死 |cRXP_ENEMY_Armored Battleboars|r
    .goto 462,26.78,68.79,0,0
    .complete 14459,1 --10/10 Armored Battleboar slain
    .mob Armored Battleboar
step
    >>在 |cRXP_LOOT_trough|r 旁边使用 |T135432:0|t[阿达纳火炬]
    .use 49539
    .goto 462,26.37,66.33
    .complete 14461,1 --1/1 First Trough
step
    >>在 |cRXP_LOOT_trough|r 旁边使用 |T135432:0|t[阿达纳火炬]
    .use 49539
    .goto 462,25.12,69.15
    .complete 14461,2 --1/1 Second Trough
step
    #label QuestKeybindingsTauren
    >>在 |cRXP_LOOT_trough|r 旁边使用 |T135432:0|t[阿达纳火炬]
    .use 49539
    .goto 462,28.2,70.4
    .complete 14461,3 --1/1 Third Trough
step
    #requires mulgoreAmoredBattleboar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿达娜·雷角|r
    .goto 462,30.9,50.6
    .turnin 14459 >>交任务: |cRXP_FRIENDLY_斗猪|r
    .turnin 14461 >>交任务: |cRXP_FRIENDLY_邪恶的食粮|r
    .accept 14460 >>接任务: |cRXP_WARN_荣誉仪祭|r
    .target Adana Thunderhorn
step
    >>杀死 |cRXP_ENEMY_Chief Squealer Thornmantle|r。掠夺他的 |cRXP_LOOT_mantle|r
    .goto 462,15.20,46.73
    .complete 14460,1 --1/1 Mane of Thornmantle
    .mob Chief Squealer Thornmantle
step << Hunter
    #completewith next
    .goto 462,23.69,38.27,25,0
    .cast 1515 >>驯服一只 |cRXP_ENEMY_Plainstrider|r
    .mob Plainstrider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鹰风酋长|r
    .goto 462,27.7,28.3
    .turnin 14460 >>交任务: |cRXP_FRIENDLY_荣誉仪祭|r
    .accept 24861 >>接任务: |cRXP_WARN_最后的仪式，最初的仪式|r
    .target Chief Hawkwind
step
    >>使用 |T132813:0|t[水罐]
    .goto 462,27.7,28.3
    .use 50465
    .complete 24861,1 --1/1 Offering Placed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鹰风酋长|r
    .goto 462,27.7,28.3
    .turnin 24861 >>交任务: |cRXP_FRIENDLY_最后的仪式，最初的仪式|r
    .accept 23733 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Chief Hawkwind
step
    #completewith next
    .goto 462,19.24,33.81,10,0
    .goto 462,11.91,27.64,10,0
    .goto 462,12.50,29.17,8 >>沿着上山的路走
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德亚米·翱风|r
    .goto 462,15.63,30.26
    .turnin 23733 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 24215 >>接任务: |cRXP_WARN_风之仪式|r
    .target Dyami Windsoar
step
    #completewith next
    .goto 462,15.40,27.68,10,0
    .goto 462,15.44,25.29,20,0
    .deathskip >>跟着箭跳下山，死而复生，释放灵魂
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_茂尔·祈雨|r
    .goto 7,47.16,56.66
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#name 2 牛头人莫高雷
#displayname Chapter 2 - Mulgore
#next RestedXP 部落 10-60\\1 BfA 简介
#subgroup 牛头人起始区域
#defaultfor Tauren !DK

<< Horde

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_茂尔·祈雨|r
    .goto 7,47.16,56.66
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step << Hunter/Warlock
    #completewith MulgoreABundleofHidesAccept
    +|cRXP_WARN_提醒：死亡跳跃后重新召唤你的宠物|r
step
    #completewith next
    .goto 7,46.53,58.17,5 >>进入帐篷
step
    #label MulgoreABundleofHidesAccept
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦尔格·风语|r
    .goto 7,46.06,58.19
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .target Varg Windwhisper
step
    #completewith next
    .goto 7,47.44,58.64
    .fp >>获取血蹄村飞行路线
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔克|r
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .target Tak
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈肯·风之图腾|r
    .goto 7,48.78,58.79
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target Harken Windtotem
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_穆尔·雷角|r
    .goto 7,48.61,59.8
    .accept 20440 >>接任务: |cRXP_LOOT_毒水|r
    .target Mull Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾莫·雷角|r
    .isQuestComplete 24215
    .goto 7,47.65,59.58
    .turnin 24215 >>交任务: |cRXP_FRIENDLY_风之仪式|r
    .target Ahmo Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾莫·雷角|r
    .goto 7,47.65,59.58
    .accept 14438 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 24459 >>接任务: |cRXP_WARN_摩林·云行者|r
    .target Ahmo Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢尔·鹰爪|r
    .goto 7,47.50,61.33
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target Ruul Eagletalon
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Plainstrider|r 和 |cff00ecffWolfs|r。掠夺他们的 |cRXP_LOOT_talons/paws|r
    .complete 20440,2 --4/4 Plainstrider Talon
    .complete 20440,1 --6/6 Prairie Wolf Paw
    .mob Adult Plainstrider
    .mob Prairie Wolf
step
    >>杀死 |cRXP_ENEMY_Palemane Gnolls|r
    >>留意 |cRXP_ENEMY_Snagglespear|r 和 |cRXP_ENEMY_Arra'chea|r
    .goto 7,48.44,70.79,30,0
    .goto 7,53.35,71.71
    .complete 14438,1 --15/15 Palemane Gnolls
    .mob Palemane Gnoll
step
    #completewith MulgorePoisonedWater
    >>杀死 |cRXP_ENEMY_Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    >>你现在不需要完成这个任务
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    >>杀死 |cRXP_ENEMY_Plainstrider|r 和 |cff00ecffWolfs|r。掠夺他们的 |cRXP_LOOT_talons/paws|r
    .goto 7,53.65,68.34,30,0
    .goto 7,50.30,65.51,30,0
    .goto 7,51.92,62.67
    .complete 20440,2 --4/4 Plainstrider Talon
    .complete 20440,1 --6/6 Prairie Wolf Paw
    .mob Adult Plainstrider
    .mob Prairie Wolf
step
    #label MulgorePoisonedWater
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_穆尔·雷角|r
    .goto 7,48.62,59.81
    .turnin 20440 >>交任务: |cRXP_FRIENDLY_毒水|r
    .accept 24440 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
    .target Mull Thunderhorn
step
    >>使用井旁边的|T135139:0|t[冬蹄净化图腾]
    .goto 7,53.47,65.36
    .use 5411
    .complete 24440,1 --Well Cleansed
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    >>|cRXP_WARN_你现在不需要完成这个任务|r
    .goto 7,56.22,63.43,30,0
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_摩林·云行者|r
    .goto 7,57.06,60.43
    .turnin 24459 >>交任务: |cRXP_FRIENDLY_摩林·云行者|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
    .target Morin Cloudstalker
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    >>|cRXP_WARN_你现在不需要完成这个任务|r
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    .goto 7,53.52,48.28
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与密封的补给箱互动
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step
    .goto 7,57.06,60.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_摩林·云行者|r
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 26179 >>接任务: |cRXP_LOOT_风险投资公司|r
    .accept 26180 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Venture Co. 工人|r
    >>留意 |cRXP_ENEMY_Enforcer Emilgund|r
    .complete 26179,1 --7/7 风险投资公司员工 slain
    .mob 风险投资公司员工
step
    >>Kill |cRXP_ENEMY_接任务: |cRXP_WARN_菲兹普罗克主管|r|r. Loot him for the |cRXP_LOOT_clipboard|r
    .goto 9,41.79,84.78
    .complete 26180,1 --1/1 Fizsprocket's Clipboard
    .mob 接任务: |cRXP_WARN_菲兹普罗克主管|r
step
    >>杀死 |cRXP_ENEMY_Venture Co. 工人|r
    >>留意 |cRXP_ENEMY_Enforcer Emilgund|r
    .goto 9,45.64,82.31,20,0
    .goto 7,59.09,48.71
    .complete 26179,1 --7/7 风险投资公司员工 slain
    .mob 风险投资公司员工
step
    #completewith MulgorePoisonedWater
    >>杀死 |cRXP_ENEMY_Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    >>|cRXP_WARN_你现在不需要完成这个任务|r
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_摩林·云行者|r
    .goto 7,57.06,60.43
    .turnin 26179 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 26180 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_穆尔·雷角|r
    .goto 7,48.62,59.81
    .turnin 24440 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .accept 24441 >>接任务: |cRXP_LOOT_雷角图腾|r
    .target Mull Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾莫·雷角|r
    .goto 7,47.65,59.58
    .turnin 14438 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .accept 14491 >>接任务: |cRXP_WARN_不休的大地|r
    .target Ahmo Thunderhorn
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板考乌斯|r
    .goto 7,46.82,60.45
    .home >>将你的炉石设置为血蹄村
    .target Innkeeper Kauth
step
    .zoneskip 7,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔克|r
    .goto 7,47.45,58.64
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳下来并与 |cRXP_FRIENDLY_Ahanu|r 交谈
    .goto 88,45.75,55.83
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安哈努|r
    .goto 88,45.75,55.83
    .vendor
    .target Ahanu
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t爬上塔并与 |cRXP_FRIENDLY_Tal|r 交谈
    .goto 88,47.03,49.60
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_WARN_向加翰回复|r
    .target Tal
step
    #completewith next
    .goto 88,35.79,63.03,10,0
    .goto 88,32.51,70.74,20 >>乘坐两部电梯中的一部向下。在这里死亡至少需要一分钟
step
    >>杀死 |cRXP_ENEMY_Windfury 风女巫|r 和 |cRXP_ENEMY_Windfury 鹰身女妖|r。掠夺她们的 |cRXP_LOOT_talons|r
    >>小心末日预言者智者
    .goto 7,34.20,37.19,20,0
    .goto 7,35.62,39,85,20,0
    .goto 7,34.16,42.45,20,0
    .goto 7,35.34,43.13
    .complete 743,1 --8/8 Windfury Talon
    .mob Windfury Wind Witch
    .mob Windfury Harpy
step
    >>对 |cRXP_ENEMY_Agitated Earth Spirits|r 使用 |T133841:0|t[抚慰大地之鼓]。
    >>尝试在冷却时使用鼓。有时元素生物可能会攻击你
    .use 49647
    .goto 7,35.37,46.63,35,0
    .goto 7,32.8,48.5
    .complete 14491,1 --6/6 Spirits Calmed
    .mob Agitated Earth Spirit
step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_点击宠物栏或魔法书中的“宠物”选项卡中的“被动”，将宠物设置为被动|r
step
    #completewith next
    .goto 7,32.53,49.01
    .deathskip >>拉一些怪物然后死掉
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿哈布·麦蹄|r
    .goto 7,48.34,53.09
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒：重新召唤你的宠物并将其设置回“辅助”|r
step
    #completewith MulgoreCougarStalkerClaws
    >>杀死 |cRXP_ENEMY_Flatland Cougars|r。掠夺它们的 |cRXP_LOOT_femur|r
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith MulgoreCougarStalkerClaws
    >>杀死一只 |cRXP_ENEMY_Plainstrider|r。拾取它以获得 |cRXP_LOOT_Tender Stride Meat|r
    .goto 7,44.71,52.05,0,0
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    #completewith MulgoreCougarStalkerClaws
    >>杀死 |cRXP_ENEMY_Wiry Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Wiry Swoop
step
    #label MulgoreCougarStalkerClaws
    >>杀死 |cRXP_ENEMY_Praeri Stalkers|r 和 |cRXP_ENEMY_Flatland Cougars|r。掠夺它们以获得 |cRXP_LOOT_claws|r
    >>留意|cRXP_ENEMY_Mazzranache|r
    .goto 7,47.18,50.35,15,0
    .goto 7,44.72,48.58,15,0
    .goto 7,42.48,44.81,15,0
    .goto 7,41.65,42.07,15,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35
    .complete 24441,2 --6/6 Cougar Claws
    .complete 24441,1 --6/6 Stalker Claws
    .mob Prairie Stalker
    .mob Flatland Cougar
step
    #completewith TrophySwoopQuill
    >>杀死 |cRXP_ENEMY_Flatland Cougars|r。掠夺它们的 |cRXP_LOOT_femur|r
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith TrophySwoopQuill
    >>杀死一只 |cRXP_ENEMY_Plainstrider|r。拾取它以获得 |cRXP_LOOT_Tender Stride Meat|r
    .goto 7,44.71,52.05,0,0
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    #label TrophySwoopQuill
    >>杀死 |cRXP_ENEMY_Wiry Swoops|r。掠夺他们的 |cRXP_LOOT_quills|r
    .goto 7,47.18,50.35,15,0
    .goto 7,44.72,48.58,15,0
    .goto 7,42.48,44.81,15,0
    .goto 7,41.65,42.07,15,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Wiry Swoop
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Flatland Cougars|r。掠夺它们的 |cRXP_LOOT_femur|r
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    >>杀死一只 |cRXP_ENEMY_Plainstrider|r。拾取它以获得 |cRXP_LOOT_Tender Stride Meat|r
    .goto 7,44.71,52.05
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    >>杀死 |cRXP_ENEMY_Flatland Cougars|r。掠夺它们的 |cRXP_LOOT_femur|r
    .goto 7,47.18,50.35,15,0
    .goto 7,44.72,48.58,15,0
    .goto 7,42.48,44.81,15,0
    .goto 7,41.65,42.07,15,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith MulgoreMazzranacheTurnin
    .goto 7,44.58,45.22
    >>|cRXP_WARN_点击宠物栏或魔法书中的“宠物”选项卡中的“被动”，将宠物设置为被动|r << Hunter/Warlock
    .deathskip >>拉一些怪物然后死掉
step
    #completewith MulgoreTurnInThunderhorn
    >>凯尔（一只狼）绕着城市跑了一圈。|cRXP_WARN_如果你看到他朝你跑来，那么等到他靠近你时，瞄准他并使用|cRXP_LOOT_Tender Stride Meat|r|r
    .use 33009
    .target Kyle
    .complete 11129,1 --1/1 Kyle fed
step
    #label MulgoreMazzranacheTurnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_茂尔·祈雨|r
    .goto 7,47.16,56.66
    .turnin 26188 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .mob Maur Raincaller
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒：重新召唤你的宠物并将其设置回“辅助”|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦尔格·风语|r
    .goto 7,46.06,58.19
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Varg Windwhisper
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢尔·鹰爪|r
    .goto 7,47.51,61.33
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target Ruul Eagletalon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾莫·雷角|r
    .goto 7,47.65,59.59
    .turnin 14491 >>交任务: |cRXP_FRIENDLY_不休的大地|r
    .target Ahmo Thunderhorn
step
    #label MulgoreTurnInThunderhorn
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_穆尔·雷角|r
    .goto 7,48.62,59.8
    .turnin 24441 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
    .target Mull Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈肯·风之图腾|r
    .goto 7,48.78,58.79
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
step
    >>凯尔（一只狼）绕着城市跑了一圈。|cRXP_WARN_如果你看到他朝你跑来，那么等到他靠近你时，瞄准他并使用|cRXP_LOOT_Tender Stride Meat|r|r
    .use 33009
    .target Kyle
    .goto 7,48.25,60.43,20,0
    .goto 7,48.13,57.28,20,0
    .complete 11129,1 --1/1 Kyle fed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿哈布·麦蹄|r
    .goto 7,48.34,53.09
    .turnin 11129 >>交任务: |cRXP_FRIENDLY_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Tauren
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈布·爪蹄|r
    .goto 7,47.64,58.09
    .vendor 3685
    .target Harb Clawhoof
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔克|r
    .goto 7,47.44,58.64
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step
    #completewith next
    +前往奥格瑞玛有三条路。
    *1) Use the Character Stuck Feature
    *2) Use the |T237388:0|t[Scouting Map: Walking Kalimdor with the Earthmother] toy and fly to Orgrimmar
    *3) 按照箭头 and take the Zeppelin to Orgrimmar (very slow)
    .link https://www.youtube.com/watch?v=jAGUbr8Gz9Y >>角色卡住解释链接
step
    .goto 88,42.81,39.13,10,0
    .goto 88,39.41,38.33,8,0
    .goto 88,28.19,23.46,50,0
    .goto 88,15.27,25.72
    .zone 85 >>乘坐齐柏林飞艇
]])
