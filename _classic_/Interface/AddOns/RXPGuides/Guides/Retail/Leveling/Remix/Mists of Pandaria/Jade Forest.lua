----------------------------
---x SIDEQUESTS
----------------------------

-- Jade Forest Tian Monastery
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 潘达利亚 remix
#name 1) 翡翠林支线任务 天禅院
#displayname Jade Forest Side Quests Tian Monastery
#internal

step
    #completewith next
    .cast 441154 >>使用|T134491:0|t[Nostwin的凭证]传送至无限集市
    .use 217930
    .itemcount 217930,1
step
    .goto 371,42.96,27.44 --x left
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
    .accept 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
    .target Arturos
-- step
--     #completewith next
--     .goto 371,43.01,27.58,10,0
--     .vendor >>与|cRXP_FRIENDLY_Lidamorrutu|c交谈并购买额外的宝石|cRXP_WARN_建议购买以加快升级速度, 但需使用青铜币, 这是一种装饰性货币|r
--     .skipgossip
--     .target Lidamorrutu
step
    #hidewindow
    #completewith All
    #label all2
    .achievement 20005,0
    .achievement 19881,0
    .achievement 20006,0
    .achievement 20004,0
    .achievement 40223,0
step
    #completewith all2
    .goto 371,43.01,27.58
    .achievementComplete 40223,1
    .collect 208555,1 >>与 |cRXP_FRIENDLY_Lidamorrutu|r交谈并购买 |T634012:0|t[时光守护者之像]
    .skipgossip
    .buy 208555,1
    .target Lidamorrutu
step
    #completewith all2
    .goto 371,43.01,27.58
    .achievementComplete 20004,1
    .collect 208487,1 >>与|cRXP_FRIENDLY_Lidamorrutu|r交谈并购买 |T629696:0|t[时 Runner 的戒指]
    .skipgossip
    .buy 208487,1
    .target Lidamorrutu
step
    #completewith all2
    .goto 371,43.01,27.58
    .achievementComplete 20005,1
    .collect 208491,1 >>与|cRXP_FRIENDLY_Lidamorrutu|r交谈并购买 |T645143:0|t[时空信物]
    .skipgossip
    .buy 208491,1
    .target Lidamorrutu
step
    #completewith all2
    .goto 371,43.01,27.58
    .achievementComplete 20006,1
    .collect 210523,1 >>与|cRXP_FRIENDLY_Lidamorrutu|r交谈并购买 |T632849:0|t[计时者护符]
    .skipgossip
    .buy 210523,1
    .target Lidamorrutu
step
    #completewith all2
    #label All
    .goto 371,43.01,27.58
    .achievementComplete 19881,0
    .collect 208554,1 >>与|cRXP_FRIENDLY_Lidamorrutu|r交谈并购买|T971287:0|t[时光信标]
    .skipgossip
    .buy 208554,1
    .target Lidamorrutu
step
    .achievementComplete 20005,0
    .achievementComplete 19881,0
    .achievementComplete 20006,0
    .achievementComplete 20004,0
    .achievementComplete 40223,0
    .goto 371,43.01,27.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Lidamorrutu|r交谈并购买饰品
    .collect 208491,1
    .collect 210523,1
    .collect 208554,1
    .collect 208555,1
    .collect 208487,1
    .buy 208487,1
    .buy 208555,1
    .buy 208555,1
    .buy 208554,1
    .buy 208491,1
    .buy 210523,1
    .skipgossip
    .target Lidamorrutu
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pythagorus|r和|cRXP_FRIENDLY_Larah Treebender|r交谈
    .accept 80447 >>接任务: |cRXP_WARN_寻求团队|r
    .goto 371,42.95,27.73 --x middle
    .target +Pythagorus
    .accept 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
    .goto 371,42.81,27.62 --x left
    .target +Larah Treebender
-- step
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Momentus|r交谈
--     .goto 371,42.5,27.32
--     .accept 78894 >>接任务: |cRXP_WARN_永恒壮大|r
--     .target Momentus
step
    #completewith next
    .goto 371,42.5,27.32,10,0
    .vendor >>与|cRXP_FRIENDLY_Momentus|r交谈并升级装备|cRXP_WARN_建议使用以加快升级速度, 但会消耗青铜币, 这是一种装饰性货币|r
    .skipgossip
    .target Momentus
step
    .goto 371,44.99,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r谈话
    .target Lin Tenderpaw
    .accept 29618 >>接任务: |cRXP_WARN_拜会长老|r
step
    .goto 371,45.22,25.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_云瀑长老|r|cRXP_WARN_在阳台上的|r交谈
    .turnin 29618 >>交任务: |cRXP_FRIENDLY_拜会长老|r
    .target High Elder Cloudfall
step
    .goto 371,44.99,24.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r谈话
    .accept 29619 >>接任务: |cRXP_WARN_谦谦来客|r
    .target Lin Tenderpaw
step
    #loop
    .goto 371,45.67,26.91,10,0
    .goto 371,45.96,27.19,10,0
    .goto 371,45.92,27.68,10,0
    .goto 371,45.63,27.50,10,0
    .goto 371,45.67,26.91,0
    .goto 371,45.96,27.19,0
    .goto 371,45.92,27.68,0
    .goto 371,45.63,27.50,0
    >>击杀 |cRXP_ENEMY_Greenwood盗贼|r. 击杀后搜刮 [|cRXP_LOOT_成熟的橘子|r]
    .complete 29619,1 --8/8 Ripe Orange
    .mob Greenwood Thief
step
    .goto 371,44.99,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r谈话
    .turnin 29619 >>交任务: |cRXP_FRIENDLY_谦谦来客|r
    .target Lin Tenderpaw
    .accept 29620 >>接任务: |cRXP_WARN_盛大的宴会|r
step
    #hidewindow
    #completewith next
    #label SkipElderCloudfall
    .gossipoption 39493 >>与|cRXP_FRIENDLY_High 云瀑长老|r谈话. (用于跳过)
    .gossipoption 40364 >>与|cRXP_FRIENDLY_High 云瀑长老|r谈话. (用于跳过)
    .goto 371,42.75,23.17
step
    .isOnQuest 29620
    #completewith next
    .gossipoption 39491 >>与|cRXP_FRIENDLY_High 云瀑长老|r交谈
    --.skipgossip 54914,1
    .timer 162, RP
    .target High Elder Cloudfall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_High 云瀑长老|r交谈
    .goto 371,42.75,23.17
    .complete 29620,1 --1/1 Speak with High Elder Cloudfall
    .target High Elder Cloudfall
step
    .goto 371,42.74,23.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_High 云瀑长老|r交谈
    .turnin 29620 >>交任务: |cRXP_FRIENDLY_盛大的宴会|r
    .timer 8, RP
    .target High Elder Cloudfall
step
    .goto 371,43.13,23.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_晓|r交谈
    .accept 29622 >>接任务: |cRXP_WARN_训练开始|r
    .accept 29626 >>接任务: |cRXP_WARN_园丁老吴|r
    .target Xiao
step
    .goto 371,43.24,24.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_石拳大师|r谈话
    .accept 29632 >>接任务: |cRXP_WARN_战备状态|r
    .target Master Stone Fist
step
    #loop
    .goto 371,43.26,25.12,15,0
    .goto 371,43.47,25.42,15,0
    .goto 371,43.81,25.36,15,0
    .goto 371,44.13,25.03,15,0
    .goto 371,43.81,24.71,15,0
    .goto 371,43.26,25.12,0
    .goto 371,43.47,25.42,0
    .goto 371,43.81,25.36,0
    .goto 371,44.13,25.03,0
    .goto 371,43.81,24.71,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_天禅院新徒|r交谈, 向他们发起决斗挑战. |cRXP_WARN_如果你敢的话, 可以同时挑战多个对手|r
    .complete 29632,1 --8/8 Tian Pupil defeated
    .skipgossip
    .target Tian Pupil
step
    .goto 371,43.24,24.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_石拳大师|r谈话
    .turnin 29632 >>交任务: |cRXP_FRIENDLY_战备状态|r
    .target Master Stone Fist
    .accept 29633 >>接任务: |cRXP_WARN_灵巧的齐齐|r
    .accept 29634 >>接任务: |cRXP_WARN_枯瘦的胡苏安|r
step
    #completewith next
    .goto 371,43.06,26.01
    .gossipoption 40594 >>与|cRXP_FRIENDLY_齐齐|r交谈
    .target Zhi-Zhi
step
    >>击杀|cRXP_ENEMY_齐齐|r
    .goto 371,43.06,26.01
    .complete 29633,1 --1/1 Zhi-Zhi defeated
    .mob Zhi-Zhi
step
    #completewith next
    .goto 371,44.57,24.06
    .gossipoption 40595 >>与|cRXP_FRIENDLY_胡苏安|r交谈
    .target Husshun
step
    .goto 371,44.57,24.06
    >>击杀|cRXP_ENEMY_胡苏安|r
    .complete 29634,1 --1/1 Husshun defeated
    .mob Husshun
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_石拳大师|r谈话
    .turnin 29633 >>交任务: |cRXP_FRIENDLY_灵巧的齐齐|r
    .turnin 29634 >>交任务: |cRXP_FRIENDLY_枯瘦的胡苏安|r
    .accept 29635 >>接任务: |cRXP_WARN_贪吃的晓|r
    .goto 371,43.24,24.76
    .target Master Stone Fist
step
    .isOnQuest 29633
    .goto 371,43.06,26.01
    .gossipoption 40594 >>与|cRXP_FRIENDLY_齐齐|r交谈
    .target Zhi-Zhi
step
    #completewith next
    .goto 371,43.13,23.65
    .gossipoption 40337 >>与|cRXP_FRIENDLY_晓|r交谈
    .target Xiao
step
    .goto 371,43.13,23.65
    >>击杀|cRXP_ENEMY_晓|r
    .complete 29635,1 --1/1 Xiao defeated
    .mob Xiao
step
    .goto 371,43.23,24.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_石拳大师|r谈话
    .turnin 29635 >>交任务: |cRXP_FRIENDLY_贪吃的晓|r
    .target Master Stone Fist
    .accept 29636 >>接任务: |cRXP_WARN_耐力的试炼|r
step
    .solo
    .goto 371,41.61,28.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏教头|r交谈
    .turnin 29622 >>交任务: |cRXP_FRIENDLY_训练开始|r
    .target Instructor Xann
step
    .group
    .goto 371,41.61,28.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏教头|r交谈
    .turnin 29622 >>交任务: |cRXP_FRIENDLY_训练开始|r
    .accept 29623 >>接任务: |cRXP_WARN_臻于完美|r
    .target Instructor Xann
step
    .group
    .goto 371,41.61,28.34
    >>|cRXP_WARN_将你的|r|cFFFF0000角色|r转向远离训练场的方向, 并将你的|r|cFFFF0000摄像机|r对准它|r
    *After the |cRXP_FRIENDLY_Tian Students|r copy the |cFFFF0000master's action|r,use |T135906:0|t[Punch(1)] for a punch, |T132219:0|t[Kick(2)] for a stomp, and |T236169:0|t[Growl(3)] for a growl.
    .complete 29623,1 --12/12 Practice Strikes completed
    .target Tian Student
step
    .group
    .goto 371,41.61,28.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏教头|r交谈
    .turnin 29623 >>交任务: |cRXP_FRIENDLY_臻于完美|r
    .target Instructor Xann
    .accept 29624 >>接任务: |cRXP_WARN_保持专注|r
step
    .group
    .goto 371,41.15,27.98
    >>击杀|cRXP_ENEMY_训练沙袋|r
    .complete 29624,1 --2/2 Training Bag slain
    .mob training bag
step
    .group
    .goto 371,41.61,28.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏教头|r交谈
    .turnin 29624 >>交任务: |cRXP_FRIENDLY_保持专注|r
    .target Instructor Xann
step
    .goto 371,41.61,23.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_园丁老吴|r谈话
    .turnin 29626 >>交任务: |cRXP_FRIENDLY_园丁老吴|r
    .target Groundskeeper Wu
    .accept 29627 >>接任务: |cRXP_WARN_称手的武器|r
step
    #completewith --3/3 Triple-Bittered Ale
    >>点击|cRXP_PICK_Bambus|r
    .complete 29627,1 --6/6 Rattan Switch
step
    .goto 371,41.40,24.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_琼·白花|r交谈
    .buy 72954,1
    .complete 29627,2 --1/1 Black Walnut Extract
    .target June Whiteblossom
step
    #label --3/3 Triple-Bittered Ale
    .goto 371,41.77,24.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒仙雷康磊|r交谈
    .buy 72979,3
    .complete 29627,3 --3/3 Triple-Bittered Ale
    .target Brewmaster Lei Kanglei
step
    #loop
    .goto 371,41.86,24.87,20,0
    .goto 371,42.28,24.64,20,0
    .goto 371,41.87,23.99,20,0
    .goto 371,41.35,23.17,20,0
    .goto 371,41.10,23.07,20,0
    .goto 371,40.89,23.72,20,0
    .goto 371,41.01,24.14,20,0
    .goto 371,41.86,24.87,0
    .goto 371,42.28,24.64,0
    .goto 371,41.87,23.99,0
    .goto 371,41.35,23.17,0
    .goto 371,41.10,23.07,0
    .goto 371,40.89,23.72,0
    .goto 371,41.01,24.14,0
    >>点击|cRXP_PICK_Bambus|r
    .complete 29627,1 --6/6 Rattan Switch
step
    .goto 371,41.62,23.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_园丁老吴|r谈话
    .turnin 29627 >>交任务: |cRXP_FRIENDLY_称手的武器|r
    .accept 29629 >>接任务: |cRXP_WARN_稳健的双手|r
    .accept 29630 >>接任务: |cRXP_WARN_沉重的拳头|r
    .target Groundskeeper Wu
step
    .goto 371,38.97,24.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Instructor 孟教头|r交谈
    .turnin 29636 >>交任务: |cRXP_FRIENDLY_耐力的试炼|r
    .target Instructor Myang
step
    .goto 371,38.02,23.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫尚龙|r交谈
    .accept 29631 >>接任务: |cRXP_WARN_明亮地燃烧|r
    .target Guard Shan Long
step
    #hidewindow
    #completewith Waxwood Hunter
    #loop
    .goto 371,37.18,20.65,25,0
    .goto 371,36.41,22.21,25,0
    .goto 371,35.36,23.41,25,0
    .goto 371,34.62,23.61,25,0
    .goto 371,34.31,22.87,25,0
    .goto 371,33.93,21.73,25,0
    .goto 371,33.59,21.70,25,0
    .goto 371,33.67,21.05,25,0
    .goto 371,33.29,19.95,25,0
    .goto 371,33.79,20.01,25,0
    .goto 371,34.99,20.93,25,0
    .goto 371,36.05,21.92,25,0
    -- .goto 371,37.18,20.65,25,0 << Alliance
    -- .goto 371,38.31,21.43,25,0 << Alliance
    -- .goto 371,36.41,22.21,25,0 << Alliance
    -- .goto 371,35.36,23.41,25,0 << Alliance
    -- .goto 371,34.62,23.61,25,0 << Alliance
    -- .goto 371,34.32,23.72,25,0 << Alliance
    -- .goto 371,34.31,22.87,25,0 << Alliance
    +1
step
    #completewith Blushleaf Extract
    >>击杀|cRXP_ENEMY_绿木欺诈者|r
    .complete 29630,1 --10/10 Greenwood Trickster slain
    .mob greenwood trickster
step
    #completewith Blushleaf Extract
    >>击杀红烛林掠食者
    .complete 29631,1 --6/6 Waxwood Hunter slain
    .mob waxwood hunter
step
    #label Blushleaf Extract
    .goto 371,37.18,20.65,0
    .goto 371,38.31,21.43,0
    .goto 371,36.41,22.21,0
    .goto 371,35.36,23.41,0
    .goto 371,34.62,23.61,0
    .goto 371,34.32,23.72,0
    .goto 371,34.31,22.87,0
    .goto 371,33.93,21.73,0
    .goto 371,33.59,21.70,0
    .goto 371,33.67,21.05,0
    .goto 371,33.29,19.95,0
    .goto 371,33.79,20.01,0
    .goto 371,34.99,20.93,0
    .goto 371,36.05,21.92,0
    -- .goto 371,37.18,20.65,0 << Alliance
    -- .goto 371,38.31,21.43,0 << Alliance
    -- .goto 371,36.41,22.21,0 << Alliance
    -- .goto 371,35.36,23.41,0 << Alliance
    -- .goto 371,34.62,23.61,0 << Alliance
    -- .goto 371,34.32,23.72,0 << Alliance
    -- .goto 371,34.31,22.87,0 << Alliance
    >>点击|cRXP_PICK_Bushleaf Cluster|r|cRXP_WARN_并等待施法结束(在此期间不允许移动或转向, 否则角色将失败)|r
    .complete 29629,1 --80/80 Blushleaf Extract
step
    #completewith next
    >>击杀|cRXP_ENEMY_绿木欺诈者|r
    .complete 29630,1 --10/10 Greenwood Trickster slain
    .mob greenwood trickster
step
    .goto 371,37.18,20.65,0
    .goto 371,38.31,21.43,0
    .goto 371,36.41,22.21,0
    .goto 371,35.36,23.41,0
    .goto 371,34.62,23.61,0
    .goto 371,34.32,23.72,0
    .goto 371,34.31,22.87,0
    .goto 371,33.93,21.73,0
    .goto 371,33.59,21.70,0
    .goto 371,33.67,21.05,0
    .goto 371,33.29,19.95,0
    .goto 371,33.79,20.01,0
    .goto 371,34.99,20.93,0
    .goto 371,36.05,21.92,0
    -- .goto 371,37.18,20.65,0 << Alliance
    -- .goto 371,38.31,21.43,0 << Alliance
    -- .goto 371,36.41,22.21,0 << Alliance
    -- .goto 371,35.36,23.41,0 << Alliance
    -- .goto 371,34.62,23.61,0 << Alliance
    -- .goto 371,34.32,23.72,0 << Alliance
    -- .goto 371,34.31,22.87,0 << Alliance
    #label Waxwood Hunter
    >>击杀红烛林掠食者
    .complete 29631,1 --6/6 Waxwood Hunter slain
    .mob waxwood hunter
step
    #loop
    .goto 371,37.83,18.34,20,0
    .goto 371,37.70,20.48,20,0
    .goto 371,37.75,22.54,20,0
    .goto 371,36.65,21.73,20,0
    .goto 371,38.31,17.65,20,0
    .goto 371,37.83,18.34,0
    .goto 371,37.70,20.48,0
    .goto 371,37.75,22.54,0
    .goto 371,36.65,21.73,0
    .goto 371,38.31,17.65,0
    >>击杀|cRXP_ENEMY_绿木欺诈者|r
    .complete 29630,1 --10/10 Greenwood Trickster slain
    .mob greenwood trickster
--step
--    #completewith next
--    >>击杀|cRXP_ENEMY_绿木欺诈者|r
--    .complete 29630,1 --10/10 Greenwood Trickster slain
--    .mob greenwood trickster
--step
--    .goto 371,37.74,17.57
--    >>点击|cRXP_PICK_沸腾的大锅|r
--    .complete 29628,1 --1/1 Boiling Cauldron obtained
--step
--    #completewith Burning Bright
--    >>注意不要将绳索拉伸超过100码, 以免断开连接
--    .complete 29628,2 --1/1 Boiling Cauldron returned
step
    #label Burning Bright
    .goto 371,38.02,23.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫尚龙|r交谈
    .turnin 29631 >>交任务: |cRXP_FRIENDLY_明亮地燃烧|r
    .target Guard Shan Long
--step
--    .goto 371,41.60,23.69
--    >>|cRXP_WARN_归还大锅|r, 但请注意不要将绳索拉伸超过|cRXP_WARN_100码|r, 以免断开连接
--    .complete 29628,2 --1/1 Boiling Cauldron returned
step
    .convertquest 29646,29646 << Horde
    .goto 371,41.60,23.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_园丁老吴|r谈话
    --.turnin 29628 >>交任务: |cRXP_FRIENDLY_强壮的后背|r
    .turnin 29629 >>交任务: |cRXP_FRIENDLY_稳健的双手|r
    .turnin 29630 >>交任务: |cRXP_FRIENDLY_沉重的拳头|r
    --.accept 29646 >>接任务: |cRXP_WARN_流光溢彩|r
    .target Groundskeeper Wu
--step
--    .goto 371,42.73,23.16
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_High 云瀑长老|r交谈
--    .turnin 29646 >>交任务: |cRXP_FRIENDLY_流光溢彩|r
--    .timer 15,RP
--    .target High Elder Cloudfall
]])

-- Jade Forest Sprites Plight
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 潘达利亚 remix
#name 1) 翡翠林支线任务:精灵的困境
#displayname 1) 翡翠林支线任务:精灵的困境 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

step
    .goto 371,48.67,24.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_流浪林精|r交谈
    .accept 29745 >>接任务: |cRXP_WARN_林精的困境|r
    .target Outcast Sprite
step
    #completewith next
    .goto 371,49.22,22.72,20,0
    .goto 371,48.71,21.13,20,0
    >>击杀|cRXP_ENEMY_缚岩毁灭者|r
    .complete 29745,1 --10/10 Stonebound Destroyer slain
    .mob stonebound destroyer
step
    .goto 371,48.58,20.63
    >>|cRXP_WARN_跟随箭头|r
    .complete 29745,2 --1/1 Source of the destroyers found
step
    #loop
    .goto 371,47.55,20.83,20,0
    .goto 371,49.90,19.47,20,0
    .goto 371,49.22,22.72,20,0
    .goto 371,48.71,21.13,20,0
    .goto 371,47.55,20.83,0
    .goto 371,49.90,19.47,0
    .goto 371,49.22,22.72,0
    .goto 371,48.71,21.13,0
    >>击杀|cRXP_ENEMY_缚岩毁灭者|r
    .complete 29745,1 --10/10 Stonebound Destroyer slain
    .mob stonebound destroyer
step
    .goto 371,49.04,20.86
    >>点击弹出窗口提交任务
    .turnin 29745 >>交任务: |cRXP_FRIENDLY_林精的困境|r
    .accept 29747 >>接任务: |cRXP_WARN_打破循环|r
step
    .goto 371,48.57,20.63
    >>点击|cRXP_PICK_Mogu Head|r
    .accept 29748 >>接任务: |cRXP_WARN_灵俑破灭|r
    .target Shattered Destroyer
step
    #completewith Vacant Destroyer
    #hidewindow
    #loop
    .goto 371,48.44,20.61,20,0
    .goto 371,48.33,18.78,20,0
    .goto 371,47.79,18.20,20,0
    .goto 371,47.18,16.91,20,0
    .goto 371,46.95,16.13,20,0
    .goto 371,46.32,15.78,20,0
    .goto 371,48.44,20.61,0
    .goto 371,48.33,18.78,0
    .goto 371,47.79,18.20,0
    .goto 371,47.18,16.91,0
    .goto 371,46.95,16.13,0
    .goto 371,46.32,15.78,0
    +1
step
    #completewith next
    >>点击|cRXP_PICK_Statues|r
    .complete 29748,1 --6/6 Vacant Destroyer Kicked
step
    >>击杀|cRXP_ENEMY_Shan'ze灵缚者|r
    .complete 29747,1 --8/8 Shan'ze Spiritbinder slain
    .mob shan'ze spiritbinder
step
    #label Vacant Destroyer
    >>点击|cRXP_PICK_Statues|r
    .complete 29748,1 --6/6 Vacant Destroyer Kicked
step
    .goto 371,47.99,18.74
    >>点击弹出窗口提交任务
    .turnin 29747 >>交任务: |cRXP_FRIENDLY_打破循环|r
    .turnin 29748 >>交任务: |cRXP_FRIENDLY_灵俑破灭|r
    .accept 29749 >>接任务: |cRXP_WARN_迫切的恳求|r
step
    .goto 371,44.23,14.95
    >>点击|cRXP_PICK_法杖|r
    .complete 29749,1 --1/1 Staff of Pei-Zhi
    -- .timer 100,RP
step
    .goto 371,44.363,15.629
    >>击杀|cRXP_ENEMY_古代灵魂|r, 直到任务完成(你需要击杀20个怪物才能填满进度条)
    .complete 29749,2 --1/1 Interrupt the Ritual of Spiritbinding
    .mob Ancient Spirit
step
    #completewith next
    .logout >>|cRXP_WARN_按下Esc键并选择“登出”|r, 等待重新登录以跳过剧情扮演
step
    .goto 371,44.23,15.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裴智|r交谈
    .turnin 29749 >>交任务: |cRXP_FRIENDLY_迫切的恳求|r
    .accept 29750 >>接任务: |cRXP_WARN_灵魂的容器|r
    .accept 29751 >>接任务: |cRXP_WARN_仪式神器|r
    .accept 29752 >>接任务: |cRXP_WARN_倔强的死者|r
    .target Pei-Zhi
--x step add treasure
step
    #completewith Chipped Ritual Bowl
    >>击杀 |cRXP_ENEMY_Shan'ze Spiritclaws|r. 击败它们后可获得 |T461804:0|t[|cRXP_LOOT_灵魂瓶|r]
    .complete 29750,1 --8/8 Spirit Bottle
    .mob Shan'ze Spiritclaw
step
    #completewith Chipped Ritual Bowl
    >>点击|cRXP_ENEMY_倔强的祖先灵魂|r. |cRXP_WARN_施法期间可以行走|r
    .complete 29752,1 --10/10 Wayward Ancestors Recovered
    .use 74771
    .mob Wayward Ancestor
step
    .goto 371,42.69,15.75
    >>点击|cRXP_PICK_玉琮|r
    .complete 29751,1 --1/1 Jade Cong
step
    .goto 371,42.28,17.1
    >>点击|cRXP_PICK_Candle|r
    .complete 29751,3 --1/1 Pungent Ritual Candle
step
    .goto 371,41.64,14.3
    #label Chipped Ritual Bowl
    >>点击|cRXP_PICK_碗|r
    .complete 29751,2 --1/1 Chipped Ritual Bowl
step
    #completewith Spirit Bottle
    #hidewindow
    #loop
    .goto 371,40.29,15.13,20,0
    .goto 371,40.35,13.82,20,0
    .goto 371,41.10,14.15,20,0
    .goto 371,41.61,17.42,20,0
    .goto 371,40.29,15.13,0
    .goto 371,40.35,13.82,0
    .goto 371,41.10,14.15,0
    .goto 371,41.61,17.42,0
    +1
step
    #completewith next
    >>击杀 |cRXP_ENEMY_Shan'ze Spiritclaws|r. 击败它们后可获得 |T461804:0|t[|cRXP_LOOT_灵魂瓶|r]
    .complete 29750,1 --8/8 Spirit Bottle
    .mob Shan'ze Spiritclaw
step
    >>点击|cRXP_ENEMY_倔强的祖先灵魂|r. |cRXP_WARN_施法期间可以行走|r
    .complete 29752,1 --10/10 Wayward Ancestors Recovered
    .use 74771
    .mob Wayward Ancestor
step
    #label Spirit Bottle
    >>击杀|rXP_ENEMY_善泽灵爪|r. 击败后可获得[|rXP_LOOT_灵魂瓶|r]
    .complete 29750,1 --8/8 Spirit Bottle
    .mob Shan'ze Spiritclaw
step
    .goto 371,44.24,15.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裴智|r交谈
    .turnin 29750 >>交任务: |cRXP_FRIENDLY_灵魂的容器|r
    .turnin 29751 >>交任务: |cRXP_FRIENDLY_仪式神器|r
    .turnin 29752 >>交任务: |cRXP_FRIENDLY_倔强的死者|r
    .accept 29753 >>接任务: |cRXP_WARN_重归自然|r
    .accept 29756 >>接任务: |cRXP_WARN_寒酸的供品|r
    .target Pei-Zhi
step
    #xprate <2
    #completewith Tidemist Cap
    #hidewindow
    #loop
    .goto 371,40.15,11.19,40,0
    .goto 371,38.81,09.96,40,0
    .goto 371,38.11,10.50,40,0
    .goto 371,37.69,12.00,40,0
    .goto 371,38.29,12.58,40,0
    .goto 371,39.19,12.60,40,0
    .goto 371,40.15,11.76,40,0
    .goto 371,40.15,11.19,0
    .goto 371,38.81,09.96,0
    .goto 371,38.11,10.50,0
    .goto 371,37.69,12.00,0
    .goto 371,38.29,12.58,0
    .goto 371,39.19,12.60,0
    .goto 371,40.15,11.76,0
    +1
--x step add treasure
step
    #xprate <2
    #completewith next
    >>点击|cRXP_PICK_潮雾菇|r
    .complete 29756,1 --10/10 Tidemist Cap
step
    #xprate <2
    >>在地面上使用 |T461804:0|t[灵魂瓶], 处于冷却中|r . 击杀出现的狂怒的野兽之魂
    .complete 29753,1 --8/8 Beast Spirits Returned to Nature
    .use 74808
    .mob Raging Beast Spirit
step
    #xprate <2
    #label Tidemist Cap
    >>点击|cRXP_PICK_潮雾菇|r
    .complete 29756,1 --10/10 Tidemist Cap
step
    #xprate <2
    .goto 371,44.24,15.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裴智|r交谈
    .turnin 29753 >>交任务: |cRXP_FRIENDLY_重归自然|r
    .turnin 29756 >>交任务: |cRXP_FRIENDLY_寒酸的供品|r
    --.accept 29754 >>接任务: |cRXP_WARN_沟通天地|r
    .timer 147,RP
    .target Pei-Zhi
--step
--    .goto 371,43.84,12.52
--    >>do xyz
--    .complete 29754,1 --1/1 Protect Pei-Zhi during his ritual.
--step
--    >>点击弹出窗口提交任务
--    .turnin 29754 >>交任务: |cRXP_FRIENDLY_沟通天地|r
--    .accept 29755 >>接任务: |cRXP_WARN_裴智归来|r
--step
--    .goto 371,42.51,10.62
--    >>击败|cRXP_ENEMY_缚岩巨像|r. 当|cRXP_ENEMY_单忌同|r将你从躯体中撕裂时, 务必尽快将灵魂归位
--    >>在最后击杀|cRXP_ENEMY_单忌同|r
--    .complete 29755,1 --1/1 Shan Jitong slain
--    .mob shan jitong
--    .mob Stonebound Colossus
--    .target your body
--step
--    .goto 371,43.84,12.53
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_裴智|r交谈
--    .turnin 29755 >>交任务: |cRXP_FRIENDLY_裴智归来|r
--    .target Pei-Zhi
]])

-- Jade Forest Defiance
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 潘达利亚 remix
#name 1) 翡翠林反抗支线任务
#displayname 1) 翡翠林反抗支线任务 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

-- step << Alliance
--     #completewith next
--     .goto 371,46.31,80.67,40 >>在祭坛上寻找宝藏
step << Horde
    .goto 371,48.32,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雾眼老人|r交谈
    .accept 29576 >>接任务: |cRXP_WARN_烦恼之风|r
    .target Old Man Misteye
step
    .goto 371,43.49,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挑战者邵傲|r交谈
    .turnin 29576 >>交任务: |cRXP_FRIENDLY_烦恼之风|r << Horde
    .accept 29578 >>接任务: |cRXP_WARN_抗争|r
    .accept 29579 >>接任务: |cRXP_WARN_集结幸存者|r
    .target Shao the Defiant
step
    #loop
    .goto 371,43.25,76.02,10,0
    .goto 371,43.28,75.68,10,0
    .goto 371,43.25,76.02,0
    .goto 371,43.28,75.68,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温柔的大妈韩妮|r交谈
    .accept 29580 >>接任务: |cRXP_WARN_果园里的装备|r
    .accept 29585 >>接任务: |cRXP_WARN_火花四溅|r
    .target Gentle Mother Hanae
step
    .isOnQuest 29585
    .goto 371,43.49,75.92,10 >>离开房屋
step
    #completewith 交任务: |cRXP_FRIENDLY_抗争|r
    #hidewindow
    #loop
    .goto 371,43.40,75.36,20,0
    .goto 371,43.06,74.88,20,0
    .goto 371,43.21,73.76,20,0
    .goto 371,43.72,72.16,20,0
    .goto 371,43.72,71.14,20,0
    .goto 371,44.27,71.18,20,0
    .goto 371,44.42,71.82,20,0
    .goto 371,44.34,72.51,20,0
    .goto 371,44.64,73.35,20,0
    .goto 371,44.49,74.45,20,0
    .goto 371,43.91,75.07,20,0
    .goto 371,44.66,75.61,20,0
    .goto 371,43.98,76.54,20,0
    .goto 371,43.40,75.36,0
    .goto 371,43.06,74.88,0
    .goto 371,43.21,73.76,0
    .goto 371,43.72,72.16,0
    .goto 371,43.72,71.14,0
    .goto 371,44.27,71.18,0
    .goto 371,44.42,71.82,0
    .goto 371,44.34,72.51,0
    .goto 371,44.64,73.35,0
    .goto 371,44.49,74.45,0
    .goto 371,43.91,75.07,0
    .goto 371,44.66,75.61,0
    .goto 371,43.98,76.54,0
    +1
step
    #completewith Orchard Fires
    >>击杀|cRXP_ENEMY_格玛利掠夺者|r 和|cRXP_ENEMY_格玛利焚化者|r. |cRXP_WARN_优先击杀那些攻击|cRXP_FRIENDLY_蜜风果农|r的敌人
    .complete 29578,1 --8/8 Gormali Raider slain
    .complete 29578,2 --8/8 Gormali Incinerator slain
    .skipgossip
    .mob gormali incinerator
step
    #completewith Orchard Fires
    >>点击|cRXP_PICK_Gardening Tools|r
    .complete 29580,1 --6/6 Orchard Tool
step
    #completewith Orchard Fires
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蜜风果农|r谈话
    .complete 29579,1 --5/5 Survivors Rescued
    .target Nectarbreeze Farmer
step
    #label Orchard Fires
    >>使用 |T463863:0|t[蜜风果酒]|cRXP_WARN_on 附近火源|r
    .complete 29585,1 --12/12 Orchard Fires Put Out
    .use 72578
step
    #completewith Survivors
    >>击杀|cRXP_ENEMY_格玛利掠夺者|r 和|cRXP_ENEMY_格玛利焚化者|r. |cRXP_WARN_优先击杀那些攻击|cRXP_FRIENDLY_蜜风果农|r的敌人
    .complete 29578,1 --8/8 Gormali Raider slain
    .complete 29578,2 --8/8 Gormali Incinerator slain
    .skipgossip
    .mob gormali incinerator
step
    #completewith Survivors
    >>点击|cRXP_PICK_Gardening Tools|r
    .complete 29580,1 --6/6 Orchard Tool
step
    #label Survivors
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蜜风果农|r谈话
    .complete 29579,1 --5/5 Survivors Rescued
    .target Nectarbreeze Farmer
step
    #completewith next
    >>击杀|cRXP_ENEMY_格玛利掠夺者|r 和|cRXP_ENEMY_格玛利焚化者|r. |cRXP_WARN_优先击杀那些攻击|cRXP_FRIENDLY_蜜风果农|r的敌人
    .complete 29578,1 --8/8 Gormali Raider slain
    .complete 29578,2 --8/8 Gormali Incinerator slain
    .skipgossip
    .mob gormali incinerator
step
    >>点击|cRXP_PICK_Gardening Tools|r
    .complete 29580,1 --6/6 Orchard Tool
step
    #label 交任务: |cRXP_FRIENDLY_抗争|r
    >>击杀|cRXP_ENEMY_格玛利掠夺者|r 和|cRXP_ENEMY_格玛利焚化者|r. |cRXP_WARN_优先击杀那些攻击|cRXP_FRIENDLY_蜜风果农|r的敌人
    .complete 29578,1 --8/8 Gormali Raider slain
    .complete 29578,2 --8/8 Gormali Incinerator slain
    .skipgossip
    .mob gormali incinerator
step
    .goto 371,43.49,75.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挑战者邵傲|r交谈
    .turnin 29578 >>交任务: |cRXP_FRIENDLY_抗争|r
    .turnin 29579 >>交任务: |cRXP_FRIENDLY_集结幸存者|r
    .target Shao the Defiant
step
    #loop
    .goto 371,43.28,75.77,10,0
    .goto 371,43.28,75.72,10,0
    .goto 371,43.28,75.77,0
    .goto 371,43.28,75.72,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温柔的大妈韩妮|r交谈, 她在屋内
    .turnin 29580 >>交任务: |cRXP_FRIENDLY_果园里的装备|r
    .turnin 29585 >>交任务: |cRXP_FRIENDLY_火花四溅|r
    .target Gentle Mother Hanae
step
    .goto 371,43.21,75.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_受轻伤的蜜风果农|r交谈
    .accept 29586 >>接任务: |cRXP_WARN_崎岖小路|r
    .target Traumatized Nectarbreeze Farmer
step
    #completewith next
    .goto 371,43.49,75.92,10 >>离开房屋
step
    .goto 371,41.01,73.97
    >>|cRXP_WARN_跟随箭头|r
    .complete 29586,1 --1/1 Mogu Camp Discovered
step
    .goto 371,41.00,73.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挑战者邵傲|r交谈
    .turnin 29586 >>交任务: |cRXP_FRIENDLY_崎岖小路|r
    .accept 29587 >>接任务: |cRXP_WARN_释放俘虏|r
    .accept 29670 >>接任务: |cRXP_WARN_以暴制暴|r
    .target Shao the Defiant
step
    #completewith FarmersSetFree
    #hidewindow
    .goto 371,40.3,74.49,22,0
    .goto 371,39.8,75.48,22,0
    .goto 371,39.58,74.39,22,0
    .goto 371,39.27,74.82,22 >>1
step
    #label FarmersSetFree
    #completewith next
    >>通过与被俘的蜜风果农身上的|cRXP_PICK_网|r互动, 并击杀与其锁链相连的|cRXP_ENEMY_格玛利奴隶主|r, 来解救|cRXP_FRIENDLY_被俘的蜜风果农|r
    .complete 29587,1 --10/10 Farmers Set Free
    .mob Gormali Slaver
    .target Captured Nectarbreeze Farmer
step
    .goto 371,37.8,76.19
    >>击杀|cRXP_ENEMY_征服者格玛尔|r
    .complete 29670,1 --1/1 Subjugator Gormal slain
    .mob subjugator gormal
step
    #loop
    .goto 371,37.79,76.91,15,0
    .goto 371,38.63,77.40,15,0
    .goto 371,38.94,76.28,15,0
    .goto 371,39.79,75.53,15,0
    .goto 371,39.46,74.75,15,0
    .goto 371,39.70,74.32,15,0
    .goto 371,40.18,74.77,15,0
    .goto 371,37.79,76.91,0
    .goto 371,38.63,77.40,0
    .goto 371,38.94,76.28,0
    .goto 371,39.79,75.53,0
    .goto 371,39.46,74.75,0
    .goto 371,39.70,74.32,0
    .goto 371,40.18,74.77,0
    >>通过与被俘的蜜风果农身上的|cRXP_PICK_网|r互动, 并击杀与其锁链相连的|cRXP_ENEMY_格玛利奴隶主|r, 来解救|cRXP_FRIENDLY_被俘的蜜风果农|r
    .complete 29587,1 --10/10 Farmers Set Free
    .mob Gormali Slaver
    .target Captured Nectarbreeze Farmer
step
    .goto 371,40.99,73.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_挑战者邵傲|r交谈
    .turnin 29587 >>交任务: |cRXP_FRIENDLY_释放俘虏|r
    .turnin 29670 >>交任务: |cRXP_FRIENDLY_以暴制暴|r
    .target Shao the Defiant
]])

-- Jade Forest Cloud Serpent
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 潘达利亚 remix
#name 1) 翡翠林云 serpent 支线任务
#displayname 1) 翡翠林云 serpent 支线任务 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

step
    #completewith next
    .goto 371,65.25,37.20,20,0
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
-- step
--     #loop
--     .goto 371,49.21,46.01,8,0
--     .goto 371,49.01,46.13,8,0
--     .goto 371,48.97,45.89,8,0
--     .goto 371,49.16,45.75,8,0
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托托·宽心|r交谈
--     .accept 80311 >>接任务: |cRXP_WARN_[Order of the Cloud Serpent]|r
--     .target Toortle Wider
step
    .goto 371,57.64,44.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    -- .turnin 80311 >>交任务: |cRXP_FRIENDLY_[Order of the Cloud Serpent]|r
    .accept 30134 >>接任务: |cRXP_WARN_局势失控|r
    .target Elder Anli
-- step << Alliance
--     .goto 371,47.17,47.19
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_翡翠林烈焰卫士|r交谈
--    .accept 32498 >>接任务: |cRXP_WARN_祭拜这团火焰|r
--    .target Jade Forest Flame Guardian
-- step << Alliance
--     .goto 371,47.17,47.13
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_仲夏篝火|r交谈
--     .turnin 32498 >>交任务: |cRXP_FRIENDLY_祭拜这团火焰|r
--     .target Midsummer Bonfire
step
    #completewith next
    .goto 371,65.25,37.20,20,0
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    .goto 371,65.33,31.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佟教头|r交谈
    .turnin 30134 >>交任务: |cRXP_FRIENDLY_局势失控|r
    .accept 30135 >>接任务: |cRXP_WARN_放手一搏|r
    .accept 30136 >>接任务: |cRXP_WARN_空荡荡的巢穴|r
    .accept 30137 >>接任务: |cRXP_WARN_收集龙蛋|r
    .target Instructor Tong
step
    #completewith Interact with Windward Hatchlings
    #hidewindow
    #loop
    .goto 371,65.25,32.10,20,0
    .goto 371,64.75,32.28,20,0
    .goto 371,64.74,31.10,20,0
    .goto 371,64.69,30.44,20,0
    .goto 371,64.54,29.52,20,0
    .goto 371,65.25,29.19,20,0
    .goto 371,65.53,29.54,20,0
    .goto 371,65.25,32.10,0
    .goto 371,64.75,32.28,0
    .goto 371,64.74,31.10,0
    .goto 371,64.69,30.44,0
    .goto 371,64.54,29.52,0
    .goto 371,65.25,29.19,0
    .goto 371,65.53,29.54,0
    +1
step
    #completewith Interact with Windward Hatchlings
    >>击杀|cRXP_ENEMY_Slitherscale Saurok|r
    .complete 30135,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale Eggdrinker
step
    .isOnQuest 30136
    .cast 110171 >>与|cRXP_FRIENDLY_临风雏龙|r|cRXP_WARN_[1]|r互动
    .use 78947
    .target Windward Hatchlings
step
    .isOnQuest 30136
    .cast 110171 >>与|cRXP_FRIENDLY_临风雏龙|r|cRXP_WARN_[2]|r互动
    .use 78947
    .target Windward Hatchlings
step
    .isOnQuest 30136
    .cast 110171 >>与一只 |cRXP_FRIENDLY_临风雏龙|r |cRXP_WARN_[3]|r互动
    .use 78947
    .target Windward Hatchlings
step
    .isOnQuest 30136
    .cast 110171 >>与|cRXP_FRIENDLY_临风雏龙|r|cRXP_WARN_[4]|r互动
    .use 78947
    .target Windward Hatchlings
step
    .isOnQuest 30136
    .cast 110171 >>与|cRXP_FRIENDLY_临风雏龙|r|cRXP_WARN_[5]|r互动
    .use 78947
    .target Windward Hatchlings
step
    #label Interact with Windward Hatchlings
    .isOnQuest 30136
    .cast 110171 >>与|cRXP_FRIENDLY_临风雏龙|r|cRXP_WARN_[6]|r互动
    .use 78947
    .target Windward Hatchlings
step
    .goto 371,65.18,30.07,-1
    .goto 371,65.64,30.22,-1
    .goto 371,65.71,30.69,-1
    .goto 371,65.8,31.25,-1
    >>|cRXP_WARN_跟随箭头|r
    .complete 30136,1 --6/6 Windward Hatchlings returned to their nests
step
    #completewith Slitherscale saurok
    #hidewindow
    #loop
    .goto 371,66.85,28.05,20,0
    .goto 371,67.43,27.94,20,0
    .goto 371,67.75,28.87,20,0
    .goto 371,67.77,30.25,20,0
    .goto 371,67.73,31.90,20,0
    .goto 371,68.74,32.16,20,0
    .goto 371,69.03,29.14,20,0
    .goto 371,69.07,27.93,20,0
    .goto 371,69.06,26.11,20,0
    .goto 371,68.14,25.30,20,0
    .goto 371,66.85,28.05,0
    .goto 371,67.43,27.94,0
    .goto 371,67.75,28.87,0
    .goto 371,67.77,30.25,0
    .goto 371,67.73,31.90,0
    .goto 371,68.74,32.16,0
    .goto 371,69.03,29.14,0
    .goto 371,69.07,27.93,0
    .goto 371,69.06,26.11,0
    .goto 371,68.14,25.30,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_Slitherscale saurok|r
    .complete 30135,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale Eggdrinker
    .mob Slitherscale Ripper
step
    >>点击|cRXP_PICK_翔龙蛋|r
    .complete 30137,1 --6/6 Serpent Egg
step
    #label Slitherscale saurok
    >>击杀|cRXP_ENEMY_Slitherscale saurok|r
    .complete 30135,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale Eggdrinker
    .mob Slitherscale Ripper
step
    #completewith next
    .goto 371,65.25,37.20,20,0
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    .goto 371,65.34,31.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佟教头|r交谈
    .turnin 30135 >>交任务: |cRXP_FRIENDLY_放手一搏|r
    .turnin 30136 >>交任务: |cRXP_FRIENDLY_空荡荡的巢穴|r
    .turnin 30137 >>交任务: |cRXP_FRIENDLY_收集龙蛋|r
    .accept 30138 >>接任务: |cRXP_WARN_选择龙蛋|r
    .turnin 30138 >>交任务: |cRXP_FRIENDLY_选择龙蛋|r
step
    .goto 371,65.34,31.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佟教头|r交谈
    .daily 30140,30141,30139 >>接任务: |cRXP_WARN_骑士之旅|r
    .target Instructor Tong
step
    #completewith Egg hatched
    .goto 371,65.25,37.20,20,0
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    .goto 371,57.55,45.10
    .isOnQuest 30139
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_天荆教头|r交谈
    .turnin 30139 >>交任务: |cRXP_FRIENDLY_骑士之旅|r
    .target Instructor Skythorn
step
    .goto 371,57.55,45.10
    .isOnQuest 30140
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_天荆教头|r交谈
    .turnin 30140 >>交任务: |cRXP_FRIENDLY_骑士之旅|r
    .target Instructor Skythorn
step
    .isOnQuest 30141
    .goto 371,57.55,45.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_天荆教头|r交谈
    .turnin 30141 >>交任务: |cRXP_FRIENDLY_骑士之旅|r
    .target Instructor Skythorn
step
    #label Egg hatched
    .goto 371,57.55,45.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_天荆教头|r交谈
    .accept 30142 >>接任务: |cRXP_WARN_这是个……|r
    .complete 30142,1 --1/1 Egg hatched
    .turnin 30142 >>交任务: |cRXP_FRIENDLY_这是个……|r
    .target Instructor Skythorn
]])

---------------------------
---x MAIN QUESTS
----------------------------

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name 0
#displayname |cFFFCDC00平衡|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled



]])

-- Pandaria Remix Leveling Guide: 使用方法和基本技巧
RXPGuides.RegisterGuide([[ 
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name 1) 潘达利亚重制版升级指南:如何使用与必备技巧
#next 2) 潘达利亚重制版简介
#displayname |cFF00CCFF0|r - 使用方法和基本技巧 |cRXP_ENEMY_(可选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #completewith test
    +|cFFFF0000重要提示:|r|cRXP_WARN_请仔细阅读每个部分, 并点击指南以获取详细的技巧和策略|r
step
    #label test
    +|T623705:0|t[无限潜能斗篷] 是本次活动的关键道具. 以下是它的机制说明以及如何最大化利用其效果:
step
    +|cRXP_WARN_Acquisition:|r从初始任务线中获取 |T623705:0|t[无限潜能斗篷]
step
    +|cRXP_WARN_属性增益:|r披风通过各种活动获得属性提升:
    *|cRXP_WARN_Looting Enemies:|r Defeat normal enemies, elites, rares, and bosses.
    *|cRXP_WARN_Opening Pandaria Treasures:|r Find and open Treasures of Pandaria scattered throughout Pandaria.
    *|cRXP_WARN_Completing Content:|r Participate in dungeons, scenarios, and raids.
    *|cRXP_WARN_Completing Quests:|r Finish quests to receive |cRXP_FRIENDLY_|T1542852:0|tCaches of Infinite Treasures|r open them to enhance your cloak stats further.
step
    +|cRXP_WARN_属性提升机制:|r通过各类活动获得的属性提升均为随机效果. 虽然你可能运气不错, 早期就获得大量所需属性, 但请放心, 只要持续参与这些活动, 最终一定能完全升级你的披风
    *|cRXP_WARN_Stats that can be Enhanced:|r.
    *Main Stat(Intellect,Agility,Strength)
    *Stamina
    *Critical Strike
    *Haste
    *Leech
    *Mastery
    *Speed
    *Versatility
    *Experience Gain %
step
    +|cRXP_WARN_经验获取百分比:|r这是快速升级最重要的属性. 提升经验获取百分比将显著加快你的升级速度
    *|cRXP_WARN_Additionally, some of the Experience Gain will carry over to each new toon you create during the event. This is true for every other stat as well|r.
step
    +|cRXP_WARN_《魔兽世界》重制版:潘达利亚之谜|r
step
    +|cRXP_WARN_在《魔兽世界》重混版：潘达利亚之谜活动中, |r宝石在强化角色能力与定制玩法体验方面发挥着至关重要的作用
step
    +玩家可以通过击败敌人和开启无限珍宝宝箱获得四种宝石
step
    +|cRXP_WARN_铭文宝石:|r这些宝石可镶嵌在头部装备插槽中, 使用时提供独特而强大的效果, 具备极强的破坏力
step
    +|cRXP_WARN_ 齿轮宝石:|r这些宝石可镶嵌在腿部装备插槽中, 提升标志性移动速度技能, 例如盗贼的“冲刺”或武僧的“翻滚”
step
    +|cRXP_WARN_ 修理宝石:|r这些宝石可装备于肩部和腰带和手腕和手套装备槽位, 提供独特而强大的被动效果
step
    +|cRXP_WARN_棱镜宝石:|r这些宝石可装备于胸部和腿部和项链和戒指和饰品等装备槽位
    *|cRXP_WARN_Prismatic Gems provide a range of stats from main stat to secondary stats|r.
step
    +升级期间特别有用的宝石是 |T839974:0|t[雷霆之球]和|T236172:0|t[先锋宝石] 和 |T236209:0|t[脆裂宝石]
step
    +|cRXP_WARN_|T4638724:0|t[青铜]在《魔兽世界》重制版:潘达利亚之谜|r
step
    +|cRXP_WARN_在魔兽世界混搭版:潘达利亚之谜中|r |T4638724:0|t[青铜]是一种特殊货币, 用于提升装备等级和购买外观道具
    *Here's a detailed explanation of how Bronze works and its role in the event:
step
    +|cRXP_WARN_获取 |T4638724:0|t[青铜]|r
    *|cRXP_WARN_Scrapping Unwanted Items:|r Players can scrap unwanted or outleveled items |cRXP_WARN_including prismatic gems|r by using the |T4643984:0|t[Unraveling Sands] Abilty to obtain Bronze. This process helps players clear their inventory of items they no longer need while gaining a valuable resource.
    *|cRXP_WARN_Gem extraction:|r.  Players can remove gems from items by using the |T1379201:0|t[Gem Extraction] Ability or by scrapping obsolete gear with gems inside, allowing them to reuse or replace the gems with better ones. This ensures that players can continually optimize their gear without losing valuable gems.
    *|cRXP_WARN_Loot and Rewards:|r |T4638724:0|t[Bronze] can also be obtained from various event activities, such as dragonriding, looting enemies and completing quests.
step
    +|cFFFF0000TLDR:始终搜刮每个敌人的物品, 永远别忘了穿上你的斗篷|r.
step
    +指南将提示你购买宝石并升级装备
    *|cRXP_WARN_However, if you prefer to spend your |T4638724:0|t[Bronze] on cosmetics, you will need to manually skip those steps|r.
step
    +在停机期间(通常称为角色扮演或RP), 指南会指示你进行拆解和提取宝石和开启|cRXP_FRIENDLY_|T1542852:0|t无尽珍宝|r, 并装备新的装备和宝石
    *|cRXP_WARN_This may occasionally be required outside of downtime as well|r.
step
    +|cRXP_WARN_实用宏:|r
    .link https://pastebin.com/DU8YgCAf >>|cRXP_WARN_点击这里|r
step
    +|cRXP_WARN_有用的弱提示(WeakAura):|r
    .link https://wago.io/DSKFme0-p >>|cRXP_WARN_点击这里|r
step
    +如果你在路线上发现任何稀有怪或宝藏, 请务必收集并击杀它们
]])

-- Introduction
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name 2) 潘达利亚重制版简介
#displayname |cFF00CCFF1|r - 永恒岛介绍 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#title Timeless Isle Introduction
#next 3) 翡翠林 部落 << Horde
#next 3) 翡翠林 联盟 << Alliance

step
    .goto 554,24.54,52.21
    .achievementComplete 19871,1
    .gossipoption 120607 >>与|cRXP_FRIENDLY_Eternus|r交谈
    .target Eternus
step
    .goto 554,24.54,52.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .accept 79432 >>接任务: |cRXP_WARN_是时候了|r
    .target Eternus
step
    #completewith next
    .goto 554,25.72,46.29
    >>点击|cRXP_PICK_Unstable Rift|r
    .complete 79432,1 --1/1 Investigate the Unstable Rift (Optional)
step
    .goto 554,25.72,46.29
    >>击杀|cRXP_ENEMY_Archaios 工艺师|r
    .complete 79432,1 --1/1 Investigate the Unstable Rift (Optional)
    .complete 79432,2 --1/1 Archaios the Artificer slain
step
    .goto 554,25.72,46.29
    >>击败他, 搜刮他的 [|cRXP_LOOT_Artifact|r]
    .complete 79432,3 --1/1 Archaios's artifact taken
    .mob archaios the artificer
step
    .goto 554,24.51,52.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .turnin 79432 >>交任务: |cRXP_FRIENDLY_是时候了|r
    .accept 79433 >>接任务: |cRXP_WARN_专业咨询|r
    .target Eternus
step
    .goto 554,25.68,51.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .turnin 79433 >>交任务: |cRXP_FRIENDLY_专业咨询|r
    .accept 79434 >>接任务: |cRXP_WARN_深织我心|r
    .accept 79437 >>接任务: |cRXP_WARN_时不关己|r
    .target Moratari
step
    #completewith Time Rift
    >>击杀|cRXP_ENEMY_Infinite Ravagers|r. 击败他们后拾取 [|cRXP_LOOT_Threads of Time|r]
    .complete 79434,1 --3/3 Thread of Time
    .mob Infinite Ravager
step
    .goto 554,22.95,55.54
    >>点击|cRXP_PICK_时间裂隙|r
    .complete 79437,1,1 --3/3 Time Rift closed
step
    .goto 554,22.47,50.32
    >>点击|cRXP_PICK_时间裂隙|r
    .complete 79437,1,2 --3/3 Time Rift closed
step
    #label Time Rift
    .goto 554,20.95,45.15
    >>点击|cRXP_PICK_时间裂隙|r
    .complete 79437,1,3 --3/3 Time Rift closed
step
    #loop
    .goto 554,24.0,55.4,40,0
    .goto 554,22.4,43.4,40,0
    .goto 554,24.0,55.4,0
    .goto 554,22.4,43.4,0
    >>击杀|cRXP_ENEMY_Infinite Ravagers|r. 击败他们后拾取 [|cRXP_LOOT_Threads of Time|r]
    .complete 79434,1 --3/3 Thread of Time
    .mob Infinite Ravager
step
    .goto 554,25.69,51.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .turnin 79437 >>交任务: |cRXP_FRIENDLY_时不关己|r
    .accept 79435 >>接任务: |cRXP_WARN_有时同享|r
    .target Moratari
step
    .goto 554,25.46,53.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Horos|r交谈
    .complete 79435,1 --1/1 Chronobadge purchased
    .skipgossip 217051,1
    .buy 215438,1
    .target Horos
step
    #completewith next
    .goto 554,24.97,52.87
    .gossipoption 120769>>与|cRXP_FRIENDLY_Momentus|r交谈
    .timer 9,RP
    .target Momentus
step
    .goto 554,25.67,51.61
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 79435,2 --1/1 Ask Momentus to forge your artifact
    .skipgossip
    .target Momentus
step
    .goto 554,25.67,51.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .turnin 79435 >>交任务: |cRXP_FRIENDLY_有时同享|r
    .accept 80380 >>接任务: |cRXP_WARN_手中线，身上披|r
    .target Moratari
step
    .goto 554,24.0,55.4,40,0
    .goto 554,22.4,43.4,40,0
    .goto 554,24.0,55.4,0
    .goto 554,22.4,43.4,0
    >>装备 |T622728:0|t[无限潜能披风]
    .complete 80380,1 --1/1 Cloak of Infinite Potential equipped
    .use 210333
step
    #loop
    .goto 554,24.0,55.4,40,0
    .goto 554,22.4,43.4,40,0
    .goto 554,24.0,55.4,0
    .goto 554,22.4,43.4,0
    >>击杀|cRXP_ENEMY_Infinite Ravagers|r. 击败后可获得 [|cRXP_LOOT_Thread of Power|r]
    .complete 80380,2 --1/1 Thread of Power collected from Infinite Ravager
    .mob Infinite Ravager
step
    .goto 554,25.67,51.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .turnin 80380 >>交任务: |cRXP_FRIENDLY_手中线，身上披|r
    .target Moratari
    .accept 79438 >>接任务: |cRXP_WARN_永生之人伤离别|r
step
    .goto 554,25.71,58.11
    >>击杀|cRXP_ENEMY_Eratus, 无形的悖论|r
    .complete 79438,1 --1/1 Eratus, the Unwoven Paradox defeated
    .mob Eratus, the Unwoven Paradox
step
    .goto 554,26.44,54.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .turnin 79438 >>交任务: |cRXP_FRIENDLY_永生之人伤离别|r
    .target Moratari
    .accept 79440 >>接任务: |cRXP_WARN_战火回忆|r
step
    .goto 554,26.04,53.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .complete 79440,1 --1/1 Speak to Eternus about recent events
    .skipgossip 217538,3
    .target Eternus
step << Horde
    .goto 371,30.84,10.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .turnin 79440 >>交任务: |cRXP_FRIENDLY_战火回忆|r
    .target Eternus
step << Alliance
    .goto 371,41.98,92.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .turnin 79440 >>交任务: |cRXP_FRIENDLY_战火回忆|r
    .target Eternus
]])

-- Jade Forest Horde
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#subweight -1
#title Jade Forest
#name 3) 翡翠林 部落
#displayname |cFF00CCFF2|r - 翡翠林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 4) 四风谷 1

<< Horde

step
    .goto 371,30.85,10.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Eternus|r交谈
    .turnin 79440 >>交任务: |cRXP_FRIENDLY_战火回忆|r
    .target Eternus
step
    .goto 12,61.22,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .accept 29690 >>接任务: |cRXP_WARN_深入迷雾|r
    .target General Nazgrim
step
    .goto 371,31.12,11.03
    .complete 29690,1 --1/1 Discovered Pandaria
step
    .goto 371,30.78,10.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 29690 >>交任务: |cRXP_FRIENDLY_深入迷雾|r
    .target General Nazgrim
    .accept 31765 >>接任务: |cRXP_WARN_血染滩头！|r
step
    #completewith next
    .goto 371,31.36,11.05,8,0
    .goto 371,31.37,11.51,8,0
    .goto 371,31.07,11.37,8,0
    .goto 371,31.12,11.57,8 >>沿着这条路走下去
step
    .isOnQuest 31765
    .goto 371,31.53,11.01
    .vehicle 66183 >>进入炮舰炮台
step
    >>击杀|r雷霆要塞加农炮|r和|r雷霆要塞士兵|r
    >>使用 |T132385:0|t[切割弹] (2), 在冷却时使用 |T249177:0|t[全自动射击] (1)
    *|cRXP_WARN_Focus the barrels, because they kill everything around them|r.
    .goto 371,31.53,11.01
    .complete 31765,2 --9/9 Thunder Hold cannons destroyed
    .complete 31765,1 --80/80 Thunder Hold troops slain
step
    .goto 371,31.01,11.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .turnin 31765 >>交任务: |cRXP_FRIENDLY_血染滩头！|r
    .target Rivett Clutchpop
    .accept 31766 >>接任务: |cRXP_WARN_天降神兵|r
step
    >>点击|cRXP_PICK_Rappeling Rope|r
    .goto 371,31.51,11.10
    .complete 31766,1 --1/1 Rappel into Honeydew Glade
step
    #loop
    .goto 371,31.55,11.29,5,0
    .goto 371,31.69,11.48,5,0
    .goto 371,31.55,11.29,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 31766 >>交任务: |cRXP_FRIENDLY_天降神兵|r
    .accept 31767 >>接任务: |cRXP_WARN_干掉他们！|r
    .accept 31768 >>接任务: |cRXP_WARN_火总是那么管用|r
    .target General Nazgrim
step
    #completewith ThunderHoldTroops
    #hidewindow
    #loop
    .goto 371,33.77,13.27,15,0
    .goto 371,34.38,13.12,20,0
    .goto 371,34.81,12.25,18,0
    .goto 371,34.41,11.72,15,0
    .goto 371,33.14,11.39,18,0
    .goto 371,33.24,9.70,25,0
    .goto 371,35.12,9.31,25,0
    .goto 371,35.39,7.30,25,0
    .goto 371,33.91,8.81,25,0
    .goto 371,32.15,6.25,30,0
    .goto 371,33.77,13.27,0
    .goto 371,34.38,13.12,0
    .goto 371,34.81,12.25,0
    .goto 371,34.41,11.72,0
    .goto 371,33.14,11.39,0
    .goto 371,33.24,9.70,0
    .goto 371,35.12,9.31,0
    .goto 371,35.39,7.30,0
    .goto 371,33.91,8.81,0
    .goto 371,32.15,6.25,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_雷霆要塞修理工|r和|cRXP_ENEMY_雷霆要塞炮手|r和|cRXP_ENEMY_雷霆要塞武装士兵|r
    .complete 31767,1 --15/15 Thunder Hold troops slain
    .mob Thunder Hold Mender
    .mob Thunder Hold Cannoneer
    .mob Thunder Hold Armsman
step
    >>使用 |T134538:0|t[纳兹格林的信号枪]摧毁|cRXP_PICK_雷霆要塞军火|r
    .use 89605
    .complete 31768,1 --10/10 Thunder Hold Munitions destroyed
step
    #label ThunderHoldTroops
    >>击杀|cRXP_ENEMY_雷霆要塞修理工|r和|cRXP_ENEMY_雷霆要塞炮手|r和|cRXP_ENEMY_雷霆要塞武装士兵|r
    .complete 31767,1 --15/15 Thunder Hold troops slain
    .mob Thunder Hold Mender
    .mob Thunder Hold Cannoneer
    .mob Thunder Hold Armsman
step
    #completewith next
    .goto 371,33.76,10.62,10 >>进入雷霆要塞
step
    .goto 371,34.78,10.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 31767 >>交任务: |cRXP_FRIENDLY_干掉他们！|r
    .target General Nazgrim
    .turnin 31768 >>交任务: |cRXP_FRIENDLY_火总是那么管用|r
    .accept 31769 >>接任务: |cRXP_WARN_致命一击！|r
step
    >>使用 |T134538:0|t[Nazgrim的信号枪] 摧毁|cRXP_PICK_攻城傀儡|r
    .use 89769
    .goto 371,34.01,10.00
    .complete 31769,1 --1/1 Destroy the first barricade
step
    >>使用 |T134538:0|t[Nazgrim的信号枪] 摧毁|cRXP_PICK_攻城傀儡|r
    .use 89769
    .goto 371,34.72,9.96
    .complete 31769,2 --1/1 Destroy the second barricade
step
    >>使用 |T134538:0|t[Nazgrim的信号枪] 摧毁|cRXP_PICK_攻城傀儡|r
    .use 89769
    .goto 371,34.89,10.65
    .complete 31769,3 --1/1 Destroy the third barricade
step
    >>等待剧情演出. |cRXP_WARN_您可以跳过过场动画|r
    .goto 371,33.65,10.61
    .complete 31769,4 --1/1 Find Captain Doren
    .timer 20,Roleplay duration
    --PERMOK: Fix timer
step
    #completewith next
    +|cRXP_WARN_如果什么都没有发生, 请开始移动|r
step
    .goto 371,33.66,10.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 31769 >>交任务: |cRXP_FRIENDLY_致命一击！|r
    .timer 30,Roleplay duration
    .target General Nazgrim
    --PERMOK: Fix timer
step
    #completewith next
    +|cRXP_WARN_要高效学习龙骑天赋, 请使用“点击这里”下的宏|r
    .link /run GenericTraitUI_LoadUI();GenericTraitFrame:SetSystemID(1);ToggleFrame(GenericTraitFrame) >>点击这里
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军和祝踏岚|r交谈
    .accept 29694 >>接任务: |cRXP_WARN_重组！|r
    .accept 31770 >>接任务: |cRXP_WARN_要么服从要么……|r
    .goto 371,33.66,10.62
    .target +General Nazgrim
    .accept 31771 >>接任务: |cRXP_WARN_自食恶果|r
    .goto 371,33.72,10.61
    .target +Taran Zhu
step
    #loop
    .goto 371,34.45,9.89,30,0
    .goto 371,34.55,11.31,30,0
    .goto 371,34.66,10.61,10,0
    .goto 371,35.00,10.62,10,0
    .goto 371,33.13,10.62,20,0
    .goto 371,34.77,10.62,20,0
    .goto 371,33.08,10.60,25,0
    .goto 371,34.27,13.17,25,0
    .goto 371,33.38,12.97,25,0
    .goto 371,32.39,6.20,25,0
    .goto 371,35.25,7.67,25,0
    .goto 371,34.45,9.89,0
    .goto 371,34.55,11.31,0
    .goto 371,34.66,10.61,0
    .goto 371,35.00,10.62,0
    .goto 371,34.63,8.83,0
    .goto 371,34.00,9.90,0
    .goto 371,34.77,10.62,0
    .goto 371,33.08,10.60,0
    .goto 371,34.27,13.17,0
    .goto 371,33.38,12.97,0
    .goto 371,32.39,6.20,0
    .goto 371,35.25,7.67,0
    >>击杀煞魔先驱和徘徊煞魔
    .complete 31771,2 --7/7 Sha Harbinger slain
    .complete 31771,1 --20/20 Sha Haunt slain
    .mob Sha Harbinger
    .mob Sha Haunt
step
    .goto 371,31.99,13.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季鸥|r交谈
    .accept 31978 >>接任务: |cRXP_WARN_酒最珍贵！|r
    .target Gi-Oh
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匿踪大师琪麟|r交谈
    .goto 371,32.06,13.35
    .skipgossip 55141,1
    .complete 29694,1 --1/1 Shademaster Kiryn Rescued
    .target Shademaster Kiryn
step
    .goto 371,32.06,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林凯·蜜露|r交谈
    .accept 31773 >>接任务: |cRXP_WARN_徘徊者危机|r
    .target Kai-Lin Honeydew
step
    #completewith ShokiaRescued
    >>击杀染煞徘徊者
    .complete 31773,1 --10/10 Sha-Infested Prowler slain
    .mob Sha-Infested Prowler
step
    #completewith next
    >>点击蜂蜜酒桶(|cRXP_PICK_Barrels of Honeybrew|r)
    .complete 31978,1 --6/6 Barrel of Honeybrew
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格罗克中士|r交谈
    .goto 371,30.58,11.65
    .skipgossip 55162,1
    .complete 29694,3 --1/1 Sergeant Gorrok Rescued
    .target Sergeant Gorrok
step
    #completewith next
    .goto 371,30.91,10.03,18,0
    .goto 371,31.13,9.36,18,0
    >>点击蜂蜜酒桶(|cRXP_PICK_Barrels of Honeybrew|r)
    .complete 31978,1 --6/6 Barrel of Honeybrew
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .goto 371,30.53,7.22
    .skipgossip 55146,1
    .complete 29694,2 --1/1 Rivett Clutchpop Rescued
    .target Rivett Clutchpop
step
    #label ShokiaRescued
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
    .goto 371,29.43,8.47
    .skipgossip 55170,1
    .complete 29694,4 --1/1 Shokia Rescued
    .target Shokia
step
    #completewith ShaInfestedProwler
    #hidewindow
    #loop
    .goto 371,28.60,8.88,25,0
    .goto 371,29.09,10.02,25,0
    .goto 371,30.78,12.52,25,0
    .goto 371,30.63,15.18,25,0
    .goto 371,31.95,13.56,25,0
    .goto 371,31.09,9.34,35,0
    .goto 371,28.60,8.88,0
    .goto 371,29.09,10.02,0
    .goto 371,30.78,12.52,0
    .goto 371,30.63,15.18,0
    .goto 371,31.95,13.56,0
    .goto 371,31.09,9.34,0
    +1
step
    #completewith next
    >>击杀染煞徘徊者
    .complete 31773,1 --10/10 Sha-Infested Prowler slain
    .mob Sha-Infested Prowler
step
    >>点击蜂蜜酒桶(|cRXP_PICK_Barrels of Honeybrew|r)
    .complete 31978,1 --6/6 Barrel of Honeybrew
step
    #label ShaInfestedProwler
    >>击杀染煞徘徊者
    .complete 31773,1 --10/10 Sha-Infested Prowler slain
    .mob Sha-Infested Prowler
step
    .goto 371,29.38,13.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾利·蜜掌|r交谈
    .turnin 31978 >>交任务: |cRXP_FRIENDLY_酒最珍贵！|r
    .target Ellie Honeypaw
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蜜露村长|r和|cRXP_FRIENDLY_祝踏岚|r和|cRXP_FRIENDLY_格罗克中士|r交谈
    .turnin 31770 >>交任务: |cRXP_FRIENDLY_要么服从要么……|r
    .goto 371,29.18,13.79
    .target +Mayor Honeydew
    .turnin 31771 >>交任务: |cRXP_FRIENDLY_自食恶果|r
    .turnin 31773 >>交任务: |cRXP_FRIENDLY_徘徊者危机|r
    .goto 371,29.13,13.85
    .target +Taran Zhu
    .turnin 29694 >>交任务: |cRXP_FRIENDLY_重组！|r
    .accept 31774 >>接任务: |cRXP_WARN_寻找金祖恩|r
    .goto 371,29.13,13.72
    .target +Sergeant Gorrok
step
    .goto 371,28.51,13.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒坊老板娘奇奇|r交谈
    .turnin 81638 >>交任务: |cRXP_FRIENDLY_炉石所指才是家|r
    .target Brewmother Kiki
step
    .goto 371,28.53,14.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .target Moratari
    .accept 80012 >>接任务: |cRXP_WARN_驭龙术|r
    .timer 5,RP
step
    .isOnQuest 80012
    .xp >14,1
    .goto 371,28.6,14.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈并购买 |T134491:0|t[Nostwin的代金券]
    .collect 217930,10
    .buy 217930,10
    .skipgossip
    .target Nostwin
step
    .isOnQuest 80012
    .xp <14,1
    #loop
    .goto 371,28.6,14.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈并购买 |T134491:0|t[Nostwin的代金券]
    .collect 217930,10
    .buy 217930,10
    .skipgossip
    .accept 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .turnin 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .target Nostwin
step
    .goto 371,28.53,14.01
    >>点击|cRXP_PICK_传送门|r
    .complete 80012,1 --1/1 Take Moratari's portal
    .complete 80012,3 --1/1 Learn your new dragonriding mount from your inventory
    .disablecheckbox
step
    #completewith next
    .goto 371,65.28,37.18
    .gossipoption 120916 >>与|cRXP_FRIENDLY_Lord Andestrasz|r交谈
    .target Lord Andestrasz
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lord Andestrasz|r交谈
    .goto 371,65.28,37.18
    .complete 80012,4 --1/1 Learn your new dragonriding mount from your inventory
    .target Lord Andestrasz
    --.complete 80012,3 --1/1 Learn your new dragonriding mount from your inventory
step
    .goto 371,65.27,37.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lord Andestrasz|r交谈
    .turnin 80012 >>交任务: |cRXP_FRIENDLY_驭龙术|r
    .accept 80013 >>接任务: |cRXP_WARN_驭滑翔术|r
    .target Lord Andestrasz
step
    #completewith next
    .goto 371,65.21,37.46,5,0
    .goto 371,28.58,14.04,40 >>|cRXP_WARN_我们接取了这个任务, 以获得前往该区域的传送道具|r.
    *点击|cRXP_PICK_传送门|r前往蜜瓜村 to go back.
    .itemcount 216712,1
step
    .goto 371,31.14,17.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zin'Jun|r交谈
    .turnin 31774 >>交任务: |cRXP_FRIENDLY_寻找金祖恩|r
    .accept 29765 >>接任务: |cRXP_WARN_视力衰弱|r
    .target Zin'Jun
step
    .goto 371,30.90,17.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古代雕像|r.交谈
    .accept 29743 >>接任务: |cRXP_WARN_怪物|r
    .target Ancient Statue
step
    #completewith Monstrosity
    >>击杀 |cRXP_ENEMY_猢狲震地者|r. 击败他们后拾取战利品:|T135611:0|t[辛俊的步枪]和|T237297:0|t[辛俊的左眼]和|T237299:0|t[辛俊的右眼]和|T134176:0|t[斯纳夫的尸体]
    *|cRXP_WARN_Don't kill too many at the same time otherwise they will all drop the same item|r.
    .goto 371,27.81,18.27,45,0
    .complete 29765,1 --1/1 Zin'Jun's Rifle
    .complete 29765,2 --1/1 Zin'Jun's Left Eye
    .complete 29765,3 --1/1 Zin'Jun's Right Eye
    .complete 29765,4 --1/1 Snuff's Corpse
    .mob Hozen Groundpounder
step
    >>点击|cRXP_PICK_古代雕像躯干|r
    .goto 371,29.27,18.97
    .skipgossip 1
    .complete 29743,1 --1/1 Statue Torso Sketched
step
    >>点击|cRXP_PICK_古代雕像肩膀|r
    .goto 371,28.47,22.24
    .skipgossip 1
    .complete 29743,3 --1/1 Statue Shoulder Sketched
step
    >>点击 |cRXP_PICK_古代雕像头颅|r
    .goto 371,29.95,22.48
    .skipgossip 1
    .complete 29743,4 --1/1 Statue Head Sketched
step
    >>点击|cRXP_PICK_古代雕像手臂|r
    .goto 371,29.93,21.21
    .skipgossip 1
    .complete 29743,2 --1/1 Statue Arm Sketched
step
    #label Monstrosity
    .goto 371,28.61,22.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mopreemixer|r交谈
    .turnin 29743 >>交任务: |cRXP_FRIENDLY_怪物|r
    .target Mopreemixer
step
    #loop
    .goto 371,31.28,21.63,28,0
    .goto 371,30.78,23.01,28,0
    .goto 371,27.81,18.27,30,0
    .goto 371,31.28,21.63,0
    .goto 371,30.78,23.01,0
    .goto 371,27.81,18.27,0
    >>击杀 |cRXP_ENEMY_猢狲震地者|r. 击败他们后拾取战利品:|T135611:0|t[辛俊的步枪]和|T237297:0|t[辛俊的左眼]和|T237299:0|t[辛俊的右眼]和|T134176:0|t[斯纳夫的尸体]
    *|cRXP_WARN_Don't kill too many at the same time otherwise they will all drop the same item|r.
    .complete 29765,1 --1/1 Zin'Jun's Rifle
    .complete 29765,2 --1/1 Zin'Jun's Left Eye
    .complete 29765,3 --1/1 Zin'Jun's Right Eye
    .complete 29765,4 --1/1 Snuff's Corpse
    .mob Hozen Groundpounder
step
    .goto 371,31.16,21.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zin'Jun|r交谈
    .turnin 29765 >>交任务: |cRXP_FRIENDLY_视力衰弱|r
    .accept 29804 >>接任务: |cRXP_WARN_血债血偿|r
    .target Zin'Jun
step
    .goto 371,31.95,22.22
    >>击杀|cRXP_ENEMY_空克|r
    .complete 29804,1 --1/1 Konk Slain
    .timer 11,Roleplay Duration
    .mob Konk
step
    .goto 371,31.66,21.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 29804 >>交任务: |cRXP_FRIENDLY_血债血偿|r
    .accept 31775 >>接任务: |cRXP_WARN_突袭机坪|r
    .accept 31776 >>接任务: |cRXP_WARN_铁腕战术|r
    .target General Nazgrim
step
    .goto 371,31.41,21.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人金宝|r交谈
    .accept 31778 >>接任务: |cRXP_WARN_是敌非友|r
    .target Merchant Zin
step
    .goto 371,31.13,21.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .accept 31777 >>接任务: |cRXP_WARN_土制火箭筒|r
    .target Rivett Clutchpop
-- PERMOK: WORK IN PROGRESS
step
    #completewith Cogswing
    #completewith Grimhatchet
    #hidewindow
    #loop
    .goto 371,29.66,23.11,15,0
    .goto 371,30.32,24.38,15,0
    .goto 371,29.66,23.11,0
    .goto 371,30.32,24.38,0
    +1
step
    #completewith MorgusGrimhatchet
    >>击杀|cRXP_ENEMY_Strongarm部队|r
    .complete 31775,1 --15/15 Strongarm troop slain
    .mob Strongarm troop
step
    #completewith MorgusGrimhatchet
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_熊猫人志愿者|r 交谈
    .skipgossip 65974,1
    .skipgossip 67090,1
    .complete 31778,1 --12/12 Indentured Pandaren freed
    .target Pandaren Volunteer
step
    #completewith next
    #label Cogswing
    >>击杀|cRXP_ENEMY_首席技师克格斯温|r和|cRXP_ENEMY_陀螺技师拉文德普|r
    .complete 31776,1 --1/1 Master Engineer Cogswing slain
    .complete 31776,2 --1/1 Gyro-Mechanic Lavenderp slain
    .mob Master Engineer Cogswing
    .mob Gyro-Mechanic Lavenderp
step
    #completewith Cogswing
    #label Grimhatchet
    >>击杀|cRXP_ENEMY_莫格斯·凶斧|r
    .complete 31776,3 --1/1 Morgus Grimhatchet slain
    .mob Morgus Grimhatchet
step
    #requires Grimhatchet
    #optional
    >>击杀|cRXP_ENEMY_首席技师克格斯温|r和|cRXP_ENEMY_陀螺技师拉文德普|r
    .goto 371,30.32,24.38
    .complete 31776,1 --1/1 Master Engineer Cogswing slain
    .complete 31776,2 --1/1 Gyro-Mechanic Lavenderp slain
    .mob Master Engineer Cogswing
    .mob Gyro-Mechanic Lavenderp
step
    #optional
    #label MorgusGrimhatchet
    >>击杀|cRXP_ENEMY_莫格斯·凶斧|r
    .goto 371,29.66,23.11
    .complete 31776,3 --1/1 Morgus Grimhatchet slain
    .mob Morgus Grimhatchet
step
    #completewith CorporalJacksonSilver
    >>击杀|cRXP_ENEMY_Strongarm部队|r
    .complete 31775,1 --15/15 Strongarm troop slain
    .mob Strongarm troop
step
    #completewith CorporalJacksonSilver
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_熊猫人志愿者|r 交谈
    .skipgossip 65974,1
    .skipgossip 67090,1
    .complete 31778,1 --12/12 Indentured Pandaren freed
    .target Pandaren Volunteer
step
    #label CorporalJacksonSilver
    >>击杀|cRXP_ENEMY_杰克逊·希尔瓦下士|r
    .goto 371,27.78,22.92
    .complete 31776,4 --1/1 Corporal Jackson Silver slain
    .mob Corporal Jackson Silver
step
    #completewith StrongarmGyrocopter
    #hidewindow
    #loop
    .goto 371,28.26,23.48,12,0
    .goto 371,28.35,24.20,12,0
    .goto 371,28.18,25.09,12,0
    .goto 371,27.34,24.76,12,0
    .goto 371,26.96,23.26,12,0
    .goto 371,28.26,23.48,0
    .goto 371,28.35,24.20,0
    .goto 371,28.18,25.09,0
    .goto 371,27.34,24.76,0
    .goto 371,26.96,23.26,0
    +1
step
    #completewith StrongarmGyrocopter
    >>击杀|cRXP_ENEMY_Strongarm部队|r
    .complete 31775,1 --15/15 Strongarm troop slain
    .mob Strongarm troop
step
    #completewith StrongarmGyrocopter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_熊猫人志愿者|r 交谈
    .skipgossip 65974,1
    .skipgossip 67090,1
    .complete 31778,1 --12/12 Indentured Pandaren freed
    .target Pandaren Volunteer
step
    #label StrongarmGyrocopter
    >>拾取 |T133837:0|t[征用的焰火发射器]. |cRXP_WARN_您一次只能携带4个|r
    >>|cRXP_WARN_点击空中的|r|cRXP_ENEMY_铁腕旋翼机|r.  (你只需右键点击即可)
    .use 89163
    .complete 31777,1 --12/12 Strongarm Gyrocopter shot down
    .mob Strongarm Gyrocopter
step
    #completewith StrongarmTroop
    #hidewindow
    #loop
    .goto 371,29.72,24.58,25,0
    .goto 371,29.67,23.17,25,0
    .goto 371,29.10,22.59,20,0
    .goto 371,28.26,23.48,12,0
    .goto 371,28.35,24.20,12,0
    .goto 371,28.18,25.09,12,0
    .goto 371,27.34,24.76,12,0
    .goto 371,26.96,23.26,12,0
    .goto 371,29.72,24.58,0
    .goto 371,29.67,23.17,0
    .goto 371,29.10,22.59,0
    .goto 371,28.26,23.48,0
    .goto 371,28.35,24.20,0
    .goto 371,28.18,25.09,0
    .goto 371,27.34,24.76,0
    .goto 371,26.96,23.26,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_Strongarm部队|r
    .complete 31775,1 --15/15 Strongarm troop slain
    .mob Strongarm troop
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_熊猫人志愿者|r 交谈
    .skipgossip 65974,1
    .skipgossip 67090,1
    .complete 31778,1 --12/12 Indentured Pandaren freed
    .target Pandaren Volunteer
step
    #label StrongarmTroop
    >>击杀|cRXP_ENEMY_Strongarm部队|r
    .complete 31775,1 --15/15 Strongarm troop slain
    .mob Strongarm troop
step
    #requires Grimhatchet
    .goto 371,31.14,21.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .turnin 31777 >>交任务: |cRXP_FRIENDLY_土制火箭筒|r
    .target Rivett Clutchpop
step
    .goto 371,31.43,21.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人金宝|r交谈
    .turnin 31778 >>交任务: |cRXP_FRIENDLY_是敌非友|r
    .target Merchant Zin
step
    .goto 371,31.67,21.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 31775 >>交任务: |cRXP_FRIENDLY_突袭机坪|r
    .turnin 31776 >>交任务: |cRXP_FRIENDLY_铁腕战术|r
    .accept 31779 >>接任务: |cRXP_WARN_掘地三尺|r
    .target General Nazgrim
step
    #completewith next
    .goto 371,26.00,24.43,10 >>进入桥后的洞穴
step
    .goto 371,25.76,23.64
    >>击杀 |cRXP_ENEMY_多伦上尉|r
    .complete 31779,1 --1/1 Captain Doren slain
    .mob Captain Doren
step
    .goto 371,27.57,24.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旗杆|r交谈
    .turnin 31779 >>交任务: |cRXP_FRIENDLY_掘地三尺|r
    .accept 31999 >>接任务: |cRXP_WARN_纳兹戈林的命令|r
    .target Flagpole
step
    .goto 371,28.43,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .turnin 31999 >>交任务: |cRXP_FRIENDLY_纳兹戈林的命令|r
    .target General Nazgrim
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匿踪大师琪麟|r和|cRXP_FRIENDLY_利维特·急刹|r交谈
    .accept 29815 >>接任务: |cRXP_WARN_法医学|r
    .goto 371,28.19,24.83
    .target +Shademaster Kiryn
    .accept 29821 >>接任务: |cRXP_WARN_差那么一点……就打中我了！|r
    .goto 371,28.10,24.70
    .target +Rivett Clutchpop
step
    #completewith next
    >>拾取 |T132108:0|t[蹒跚花苗]|cRXP_WARN_(可能在骑乘时)|r
    .complete 29815,1 --8/8 Viscous Chlorophyll
    .target Lurching Blossom
step
    .goto 371,22.87,30.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空包裹|r交谈
    .turnin 29821 >>交任务: |cRXP_FRIENDLY_差那么一点……就打中我了！|r
    .accept 31112 >>接任务: |cRXP_WARN_问题变得棘手了！|r
    .target Empty Package
step
    #completewith EmergencySupplies
    #hidewindow
    #loop
    .goto 371,24.06,26.77,35,0
    .goto 371,25.61,29.03,25,0
    .goto 371,26.52,25.86,25,0
    .goto 371,24.06,26.77,0
    .goto 371,25.61,29.03,0
    .goto 371,26.52,25.86,0
    +1
step
    #completewith next
    >>点击|cRXP_PICK_蹒跚花苗|r|cRXP_WARN_(可能在骑乘时)|r
    .complete 29815,1 --8/8 Viscous Chlorophyll
    .target Lurching Blossom
step
    #label EmergencySupplies
    >>击杀 |cRXP_ENEMY_水精灵|r. 从它们身上搜取|T348523:0|t[应急补给]
    .complete 31112,1 --5/5 Emergency Supplies
    .mob Water Sprite
step
    >>拾取 |T132108:0|t[蹒跚花苗]|cRXP_WARN_(可能在骑乘时)|r
    .complete 29815,1 --8/8 Viscous Chlorophyll
    .target Lurching Blossom
-- step << Horde
--     .goto 371,26.39,28.33
--     .achievement 6850,1 >>点击|cRXP_PICK_卷轴|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r和|cRXP_FRIENDLY_匿踪大师琪麟|r交谈
    .turnin 31112 >>交任务: |cRXP_FRIENDLY_问题变得棘手了！|r
    .goto 371,28.11,24.69
    .target +Rivett Clutchpop
    .turnin 29815 >>交任务: |cRXP_FRIENDLY_法医学|r
    .accept 29827 >>接任务: |cRXP_WARN_酸雨|r
    .goto 371,28.19,24.82
    .target +Shademaster Kiryn
step
    #completewith next
    .goto 371,28.07,24.79
    >>|cRXP_WARN_不要跳过过场动画|r
    .vehicle 55676 >>乘坐|cRXP_FRIENDLY_回收的旋翼机|r
    .target Recovered Gyrocopter
step
    .goto 371,28.07,24.79
    >>|cRXP_WARN_使用|r|T237521:0|t[毒花] (2)|cRXP_WARN_在面对一大群怪物时|r. |cRXP_WARN_使用|r|T135431:0|t[投掷星] (1)|cRXP_WARN_击杀单个怪物|r
    >>击杀猢狲刺剑手和猢狲裂肠者
    .complete 29827,2 --25/25 Hozen Nibstabber slain
    .complete 29827,1 --25/25 Hozen Gutripper slain
    .mob Hozen Nibstabber
    .mob Hozen Gutripper
step
    .goto 371,26.83,26.79
    >>击杀|cRXP_ENEMY_猢狲裂肠者|r
    .mob Hozen Gutripper
step
    .goto 371,28.18,24.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匿踪大师琪麟|r交谈
    .turnin 29827 >>交任务: |cRXP_FRIENDLY_酸雨|r
    .target Shademaster Kiryn
step
    .goto 371,28.44,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
    .accept 29822 >>接任务: |cRXP_WARN_事态|r
    .target General Nazgrim
step
    >>跟随箭头指引
    .goto 371,31.98,27.73
    .complete 29822,1 --1/1 Shrine of the Sun Visited
step
    .isOnQuest 29822
    .cast 3365 >>在井中拾取 |T133784:0|t[熊猫人幸运硬币]
    .goto 371,31.96,27.75
step
    .goto 371,27.80,30.28
    >>击杀|cRXP_ENEMY_乌克门头领|r
    .complete 29822,3 --1/1 Dook Ookem slain
    .mob Dook Ookem
step
    >>跟随箭头指引
    .goto 371,26.25,32.35
    .complete 29822,2 --1/1 Shrine of the Moon Visited
step
    .isOnQuest 29822
    .cast 3365 >>拿起桌上的|T608949:0|t[古代熊猫人茶壶]
    .goto 371,26.22,32.35
step
    .goto 371,27.59,32.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 29822 >>交任务: |cRXP_FRIENDLY_事态|r
    --.accept 31121 >>接任务: |cRXP_WARN_驻足聆听|r
    .target Lorewalker Cho
step
    #include 1) 翡翠林支线任务 天禅院
step
    #include 1) 翡翠林支线任务:精灵的困境
step
    #include 1) 翡翠林云 serpent 支线任务
step
    #include X) 至尊天神日常任务@startaugustjade-endaugustjade
step
    .goto 371,48.32,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雾眼老人|r交谈
    .accept 29576 >>接任务: |cRXP_WARN_烦恼之风|r
    .target Old Man Misteye
-- step
--    .goto 371,47.17,47.19
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_翡翠林烈焰卫士|r交谈
--    .accept 32498 >>接任务: |cRXP_WARN_祭拜这团火焰|r
--    .target Jade Forest Flame Guardian
-- step
--     .goto 371,47.17,47.13
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_仲夏篝火|r交谈
--     .turnin 32498 >>交任务: |cRXP_FRIENDLY_祭拜这团火焰|r
--     .target Midsummer Bonfire
step
    #include 1) 翡翠林反抗支线任务
]])

-- Jade Forest Alliance
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#subweight -1
#name 3) 翡翠林 联盟
#displayname |cFF00CCFF2|r - 翡翠林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#title Jade Forest
#next 4) 四风谷 1
<<Alliance

step
    .goto 371,42.03,92.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .target Sky Admiral Rogers
    .accept 31732 >>接任务: |cRXP_WARN_天火降临|r
step
    .goto 371,42.04,92.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .accept 31732 >>接任务: |cRXP_WARN_天火降临|r
    .target Sky Admiral Rogers
step
    .isOnQuest 31732
    .goto 371,42.02,92.53
    .vehicle >>点击|cRXP_PICK_天火号旋翼机|r
    .timer 25.5, RP
    .target Skyfire Gyrocopter
step
    #completewith next
    +|cRXP_WARN_要高效学习龙骑天赋, 请使用“点击这里”下的宏|r
    .link /run GenericTraitUI_LoadUI();GenericTraitFrame:SetSystemID(1);ToggleFrame(GenericTraitFrame) >>点击这里
step
    >>使用 |T249177:0|t[全自动射击(1)], 然后对 |cRXP_ENEMY_Shredders|r和|cRXP_ENEMY_苦工|r和 |cRXP_ENEMY_战士|r使用 |T249177:0|t[鱼雷火箭(2)]. |cRXP_WARN_理想情况下, 尽可能同时瞄准多个目标, 若它们距离较近, 可一并击中 barrels|r
    *|cFFFF0000Make sure to do this as often as possible|r.|r.
    .complete 31732,2 --8/8 Garrosh'ar Shredder slain
    .complete 31732,1 --60/60 Garrosh'ar Horde slain
    .timer 20, RP
    .mob Garrosh'ar Grunt
    .mob Garrosh'ar Peon
    .mob garrosh'ar shredder
step
    .goto 371,44.18,98.83
    >>对船上的油桶使用 |T249177:0|t[全自动射击(1)] 或 |T249177:0|t[鱼雷火箭(2)]|cRXP_WARN_|r
    .complete 31732,3 --1/1 Bladefist Reaper sunk
    .timer 10.5, RP
step
    .goto 424,65.59,74.42
    >>对船上的油桶使用 |T249177:0|t[全自动射击(1)] 或 |T249177:0|t[鱼雷火箭(2)]|cRXP_WARN_|r
    .complete 31732,4 --1/1 Stygian Scar sunk
step
    #completewith next
    .exitvehicle >>|cRXP_WARN_请通过按下动作条上的|r.[退出]|cRXP_WARN_按钮来从天火号旋翼机上下来|r
    *|cRXP_WARN_或者, 您可以使用这个宏；|r.
    .link /leavevehicle>>点击此处获取宏
    *|cRXP_WARN_It's recommended to safe this macro for future use|r.
step
    .goto 371,42.04,92.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .turnin 31732 >>交任务: |cRXP_FRIENDLY_天火降临|r
    .target Sky Admiral Rogers
    .accept 31733 >>接任务: |cRXP_WARN_天降神兵|r
step
    .goto 371,42.32,92.79
    >>点击|cRXP_PICK_天火号降落伞|r
    .complete 31733,1 --1/1 Equip a Skyfire Parachute
step
    #completewith next
    .exitvehicle >>|cRXP_WARN_请通过按下动作条上的|r.[退出]|cRXP_WARN_按钮来从天火号旋翼机上下来|r
    *|cRXP_WARN_或者, 您可以使用这个宏；|r.
    .link /leavevehicle>>点击此处获取宏
    *|cRXP_WARN_It's recommended to safe this macro for future use|r.
step
    .goto 371,43.58,90.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“腌菜”苏利·麦克莱利|r交谈
    .turnin 31733 >>交任务: |cRXP_FRIENDLY_天降神兵|r
    .target Sully "The Pickle" McLeary
    .accept 30069 >>接任务: |cRXP_WARN_随机应变|r
    .accept 31734 >>接任务: |cRXP_WARN_摧毁战车|r
step
    #completewith next
    >>击杀|cRXP_ENEMY_Grunts|r和|cRXP_ENEMY_Gear-Greasers|r
    .complete 30069,1 --6/6 Garrosh'ar Grunt slain
    .mob garrosh'ar grunt
    .complete 30069,2 --4/4 Garrosh'ar Gear-Greaser slain
    .mob garrosh'ar gear-greaser
step
    #loop
    -- .goto 371,42.53,92.97,15,0
    -- .goto 371,44.09,93.55,15,0
    -- .goto 371,43.92,94.27,15,0
    -- .goto 371,44.41,94.61,15,0
    -- .goto 371,45.10,95.37,15,0
    -- .goto 371,45.60,94.07,15,0
    -- .goto 371,46.10,93.56,15,0
    -- .goto 371,45.14,92.68,15,0
    -- .goto 371,44.83,94.02,15,0
    -- .goto 371,43.81,95.99,15,0
    -- .goto 371,42.53,92.97,0
    -- .goto 371,44.09,93.55,0
    -- .goto 371,43.92,94.27,0
    -- .goto 371,44.41,94.61,0
    -- .goto 371,45.10,95.37,0
    -- .goto 371,45.60,94.07,0
    -- .goto 371,46.10,93.56,0
    -- .goto 371,45.14,92.68,0
    -- .goto 371,44.83,94.02,0
    -- .goto 371,43.81,95.99,0
    .goto 371,44.11,93.48,20,0
    .goto 371,43.92,94.31,20,0
    .goto 371,44.45,94.53,20,0
    .goto 371,44.85,93.98,20,0
    .goto 371,44.11,93.48,0
    .goto 371,43.92,94.31,0
    .goto 371,44.45,94.53,0
    .goto 371,44.85,93.98,0
    >>使用 |T135619:0|t[Sully的信号枪]|cRXP_WARN_near 部落战车|r
    .complete 31734,1 --5/5 Horde War Wagon destroyed
    .use 89624
step
    #loop
    -- .goto 371,42.53,92.97,15,0
    -- .goto 371,44.09,93.55,15,0
    -- .goto 371,43.92,94.27,15,0
    -- .goto 371,44.41,94.61,15,0
    -- .goto 371,45.10,95.37,15,0
    -- .goto 371,45.60,94.07,15,0
    -- .goto 371,46.10,93.56,15,0
    -- .goto 371,45.14,92.68,15,0
    -- .goto 371,44.83,94.02,15,0
    -- .goto 371,43.81,95.99,15,0
    -- .goto 371,42.53,92.97,0
    -- .goto 371,44.09,93.55,0
    -- .goto 371,43.92,94.27,0
    -- .goto 371,44.41,94.61,0
    -- .goto 371,45.10,95.37,0
    -- .goto 371,45.60,94.07,0
    -- .goto 371,46.10,93.56,0
    -- .goto 371,45.14,92.68,0
    -- .goto 371,44.83,94.02,0
    -- .goto 371,43.81,95.99,0
    .goto 371,45.78,93.33,30,0
    .goto 371,45.4,94.35,30,0
    .goto 371,44.63,95.64,30,0
    .goto 371,44.21,95.97,30,0
    .goto 371,45.78,93.33,0
    .goto 371,45.4,94.35,0
    .goto 371,44.63,95.64,0
    .goto 371,44.21,95.97,0
    >>击杀|cRXP_ENEMY_Grunts|r和|cRXP_ENEMY_Gear-Greasers|r
    .complete 30069,1 --6/6 Garrosh'ar Grunt slain
    .complete 30069,2 --4/4 Garrosh'ar Gear-Greaser slain
    .mob garrosh'ar grunt
    .mob garrosh'ar gear-greaser
step
    .goto 371,45.17,95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .turnin 30069 >>交任务: |cRXP_FRIENDLY_随机应变|r
    .turnin 31734 >>交任务: |cRXP_FRIENDLY_摧毁战车|r
    .accept 31735 >>接任务: |cRXP_WARN_物尽其用|r
    .target Rell Nightwind
step
    .goto 371,45.62,95.24
    >>使用 |T135619:0|t[Sully的信号枪]|cRXP_WARN_NEAR路障|r
    .complete 31735,1 --1/1 First Barricade Destroyed
    .use 89624
step
    .goto 371,45.99,96.01
    >>使用 |T135619:0|t[Sully的信号枪]|cRXP_WARN_NEAR路障|r
    .complete 31735,2 --1/1 Second Barricade Destroyed
    .use 89624
step
    .goto 371,46.21,96.34
    >>|cRXP_WARN_跟随箭头|r
    .complete 31735,3 --1/1 Ga'trul Confronted
    .timer 13,RP
step
    .goto 371,46.47,96.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .turnin 31735 >>交任务: |cRXP_FRIENDLY_物尽其用|r
    .target Rell Nightwind
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .goto 371,46.47,96.42
    .accept 31736 >>接任务: |cRXP_WARN_联盟使节|r
    .accept 31737 >>接任务: |cRXP_WARN_战争的代价|r
    .target Rell Nightwind
step
    #loop
    .goto 371,45.53,94.18,15,0
    .goto 371,45.90,93.36,15,0
    .goto 371,45.10,91.64,15,0
    .goto 371,44.52,91.27,15,0
    .goto 371,42.94,92.81,15,0
    .goto 371,44.32,94.09,15,0
    .goto 371,45.53,94.18,0
    .goto 371,45.90,93.36,0
    .goto 371,45.10,91.64,0
    .goto 371,44.52,91.27,0
    .goto 371,42.94,92.81,0
    .goto 371,44.32,94.09,0
    >>击杀|cRXP_ENEMY_徘徊煞魔|r 和|cRXP_ENEMY_煞魔先驱|r
    .complete 31737,1 --10/10 Sha Haunt slain
    .mob +sha haunt
    .complete 31737,2 --5/5 Sha Harbinger slain
    .mob +sha harbinger
step
    .goto 371,46.13,85.11
    >>|cRXP_WARN_跟随箭头|r
    .complete 31736,1 --1/1 Leader of Paw'don Village found
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r和|r|cRXP_FRIENDLY_康顺可|r和|r|cRXP_FRIENDLY_邓·苹花|r和|r|cRXP_FRIENDLY_米希卡|r交谈
    .turnin 31737 >>交任务: |cRXP_FRIENDLY_战争的代价|r
    .goto 371,46.25,84.81
    .target +Taran Zhu
    .turnin 31736 >>交任务: |cRXP_FRIENDLY_联盟使节|r
    .accept 31738 >>接任务: |cRXP_WARN_表明诚意|r
    .goto 371,46.26,84.73
    .target +Sunke Khang
    .accept 31739 >>接任务: |cRXP_WARN_酒最珍贵！|r
    .target +Teng Applebloom
    .goto 371,46.22,84.69
    .accept 29552 >>接任务: |cRXP_WARN_情况危急|r
    .goto 371,46.14,84.57
    .target +Mishka
step
    .goto 371,45.79,84.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉塔里|r交谈
    .accept 80012 >>接任务: |cRXP_WARN_驭龙术|r
    .target Moratari
step
    .isOnQuest 80012
    .xp >14,1
    #loop
    .goto 371,45.89,84.63,5,0
    .goto 371,45.83,84.83,5,0
    .goto 371,45.89,84.63,0
    .goto 371,45.83,84.83,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈并购买 |T134491:0|t[Nostwin的代金券]
    .collect 217930,10
    .buy 217930,10
    .skipgossip
    .target Nostwin
step
    .isOnQuest 80012
    .xp <14,1
    #loop
    .goto 371,45.89,84.63,5,0
    .goto 371,45.83,84.83,5,0
    .goto 371,45.89,84.63,0
    .goto 371,45.83,84.83,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈并购买 |T134491:0|t[Nostwin的代金券]
    .collect 217930,10
    .buy 217930,10
    .skipgossip
    .accept 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .turnin 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .target Nostwin
step
    .goto 371,45.82,84.72
    >>点击|cRXP_PICK_传送门|r
    .complete 80012,1 --1/1 Take Moratari's portal
    .complete 80012,3 --1/1 Learn your new dragonriding mount from your inventory
    .disablecheckbox
step
    #completewith next
    .goto 371,65.25,37.20
    .gossipoption 120916 >>与|cRXP_FRIENDLY_Lord Andestrasz|r交谈
    .target Lord Andestrasz
step
    .goto 371,65.25,37.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lord Andestrasz|r交谈
    .accept 80013 >>接任务: |cRXP_WARN_驭滑翔术|r
    .target Lord Andestrasz
step
    #completewith next
    .goto 371,65.21,37.46,5,0
    .goto 371,45.8,84.6,40 >>|cRXP_WARN_我们接取了这个任务, 以获得前往该区域的传送道具|r.
    *点击|cRXP_PICK_传送门|r返回
    .itemcount 216712,1
step
    .goto 371,44.89,84.58,10,0
    .goto 371,44.88,84.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佳意·苹花|r谈话
    .accept 81638 >>接任务: |cRXP_WARN_炉石所指才是家|r
    .turnin 81638 >>交任务: |cRXP_FRIENDLY_炉石所指才是家|r
    .target Jiayi Applebloom
step
    #loop
    .goto 371,44.00,85.39,20,0
    .goto 371,43.13,85.57,20,0
    .goto 371,42.47,85.96,20,0
    .goto 371,42.27,87.33,20,0
    .goto 371,42.15,87.96,20,0
    .goto 371,42.10,88.62,20,0
    .goto 371,41.58,88.52,20,0
    .goto 371,41.20,89.88,20,0
    .goto 371,41.64,90.41,20,0
    .goto 371,42.22,89.44,20,0
    .goto 371,43.46,88.36,20,0
    .goto 371,44.00,85.39,0
    .goto 371,43.13,85.57,0
    .goto 371,42.47,85.96,0
    .goto 371,42.27,87.33,0
    .goto 371,42.15,87.96,0
    .goto 371,42.10,88.62,0
    .goto 371,41.58,88.52,0
    .goto 371,41.20,89.88,0
    .goto 371,41.64,90.41,0
    .goto 371,42.22,89.44,0
    .goto 371,43.46,88.36,0
    >>击杀双塔劳工
    *点击|cRXP_PICK_Barrels|r.
    *Interact with |cRXP_FRIENDLY_Wounded Pilots|r |cRXP_WARN_Ideally use your own healing abilities if possible|r.
    .complete 31738,1 --12/12 Twinspire Peon slain
    .complete 31739,1 --6/6 Applebloom Cider
    .complete 29552,1 --6/6 Wounded Pilots revived
    .mob twinspire peon
    .target Mortally Wounded Pilot
    .target Wounded Pilot
    .target Terribly Pilot
step
    .goto 371,39.56,90.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·苹花|r交谈
    .turnin 31739 >>交任务: |cRXP_FRIENDLY_酒最珍贵！|r
    .accept 31740 >>接任务: |cRXP_WARN_丧失理智的扣扣|r
    .target Lin Applebloom
step
    .goto 371,39.32,89.86
    >>击杀|cRXP_ENEMY_扣扣|r
    .complete 31740,1 --1/1 Koukou slain
    .mob koukou
step
    #completewith Critical Condition
    .goto 371,65.25,37.20
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    #completewith Critical Condition
    .goto 371,65.21,37.46,5,0
    .goto 371,45.8,84.6,40 >>|cRXP_WARN_我们接取了这个任务, 以获得前往该区域的传送道具|r.
    *点击|cRXP_PICK_传送门|r返回
    .itemcount 216712,1
step
    .xp <14,1
    #loop
    .goto 371,45.89,84.63,5,0
    .goto 371,45.83,84.83,5,0
    .goto 371,45.89,84.63,0
    .goto 371,45.83,84.83,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈
    .accept 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .turnin 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .target Nostwin
step
    #label Critical Condition
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|cRXP_FRIENDLY_和|r康顺可|cRXP_FRIENDLY_和|r利尔·夜风|cRXP_FRIENDLY_交谈
    .turnin 29552 >>交任务: |cRXP_FRIENDLY_情况危急|r
    .goto 371,46.12,84.57
    .target +Mishka
    .turnin 31738 >>交任务: |cRXP_FRIENDLY_表明诚意|r
    .turnin 31740 >>交任务: |cRXP_FRIENDLY_丧失理智的扣扣|r
    .accept 31741 >>接任务: |cRXP_WARN_双塔堡垒|r
    .accept 31744 >>接任务: |cRXP_WARN_不公平的交易|r
    .goto 371,46.26,84.72
    .target +Sunke Khang
    .accept 31742 >>接任务: |cRXP_WARN_内讧|r
    .accept 31743 >>接任务: |cRXP_WARN_空中打击|r
    .target +Rell Nightwind
    .goto 371,46.2,84.82
step
    #completewith Dalgan and Bellandra Felstorm
    >>击杀|cRXP_ENEMY_加特鲁尔之眼|r以解救|cRXP_FRIENDLY_熊猫人幼崽|r
    .complete 31744,1 --8/8 Captive Pandaren Cub freed
    .target Captive Pandaren Cub
    .mob Eye of Ga'trul
step
    .xp <14,1
    #loop
    .goto 371,45.89,84.63,5,0
    .goto 371,45.83,84.83,5,0
    .goto 371,45.89,84.63,0
    .goto 371,45.83,84.83,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈
    .accept 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .turnin 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .target Nostwin
step
    #completewith Dalgan and Bellandra Felstorm
    >>击杀 |cRXP_ENEMY_Horde部队|r
    .complete 31741,1 --15/15 Twinspire Horde slain
    .mob Felstorm Warlock
    .mob Twinspire Deathguard
    .mob Twinspire Grunt
    .mob Gatrul'lon Flamecaller
    .mob Twinspire Demolitionist
step
    .goto 371,42.98,81.26
    >>在绿色气泡上使用联盟信号弹
    .complete 31743,4 --1/1 Wild Imps bombed
    .use 89602
step
    .goto 371,41.30,81.34
    >>对|cRXP_ENEMY_双塔投石车|r使用 |T458733:0|t[联盟信号弹]
    .use 89602
    .complete 31743,2 --1/1 Twinspire Demolishers bombed
    .mob Twinspire Demolisher
step
    .goto 371,40.14,81.61
    >>在|r|cRXP_WARN_spike ball|r附近使用|T458733:0|t[联盟信号弹]
    .use 89602
    .complete 31743,1 --1/1 Twinspire munitions stockpile bombed
step
    .goto 371,40.19,81.78
    >>在|rXhu'daggab|r上使用|T458733:0|t[联盟信号弹]
    .use 89602
    .complete 31743,3 --1/1 Xhu'daggab bombed
    .mob Xhu'daggab
step
    #label Dalgan and Bellandra Felstorm
    #loop
    .goto 371,41.15,80.27,10,0
    .goto 371,41.78,80.31,10,0
    .goto 371,41.15,80.27,0
    .goto 371,41.78,80.31,0
    >>击杀|cRXP_ENEMY_达尔甘|r和|cRXP_ENEMY_贝兰德拉·邪风|r|cRXP_WARN_在露台上|r
    .complete 31742,1 --1/1 Dalgan slain
    .mob dalgan
    .complete 31742,2 --1/1 Bellandra Felstorm slain
    .mob bellandra felstorm
step
    #completewith next
    >>击杀 |cRXP_ENEMY_Horde部队|r
    .complete 31741,1 --15/15 Twinspire Horde slain
    .mob Felstorm Warlock
    .mob Twinspire Deathguard
    .mob Twinspire Grunt
    .mob Gatrul'lon Flamecaller
    .mob Twinspire Demolitionist
step
    #loop
    .goto 371,42.93,81.27,20,0
    .goto 371,42.75,82.27,20,0
    .goto 371,42.19,82.10,20,0
    .goto 371,41.47,80.63,20,0
    .goto 371,40.34,82.23,20,0
    .goto 371,39.62,82.29,20,0
    .goto 371,39.76,81.08,20,0
    .goto 371,42.93,81.27,0
    .goto 371,42.75,82.27,0
    .goto 371,42.19,82.10,0
    .goto 371,41.47,80.63,0
    .goto 371,40.34,82.23,0
    .goto 371,39.62,82.29,0
    .goto 371,39.76,81.08,0
    >>击杀|cRXP_ENEMY_加特鲁尔之眼|r以解救|cRXP_FRIENDLY_熊猫人幼崽|r
    .complete 31744,1 --8/8 Captive Pandaren Cub freed
    .target Captive Pandaren Cub
    .mob Eye of Ga'trul
step
    #loop
    .goto 371,42.93,81.27,20,0
    .goto 371,42.75,82.27,20,0
    .goto 371,42.19,82.10,20,0
    .goto 371,41.47,80.63,20,0
    .goto 371,40.34,82.23,20,0
    .goto 371,39.62,82.29,20,0
    .goto 371,39.76,81.08,20,0
    .goto 371,42.93,81.27,0
    .goto 371,42.75,82.27,0
    .goto 371,42.19,82.10,0
    .goto 371,41.47,80.63,0
    .goto 371,40.34,82.23,0
    .goto 371,39.62,82.29,0
    .goto 371,39.76,81.08,0
    >>击杀 |cRXP_ENEMY_Horde部队|r
    .complete 31741,1 --15/15 Twinspire Horde slain
    .mob Felstorm Warlock
    .mob Twinspire Deathguard
    .mob Twinspire Grunt
    .mob Gatrul'lon Flamecaller
    .mob Twinspire Demolitionist
step
    .goto 371,41.39,79.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“腌菜”苏利·麦克莱利|r|cRXP_WARN_在神庙前交谈|r
    .turnin 31741 >>交任务: |cRXP_FRIENDLY_双塔堡垒|r
    .turnin 31742 >>交任务: |cRXP_FRIENDLY_内讧|r
    .turnin 31743 >>交任务: |cRXP_FRIENDLY_空中打击|r
    .turnin 31744 >>交任务: |cRXP_FRIENDLY_不公平的交易|r
    .accept 30070 >>接任务: |cRXP_WARN_消灭加图尔|r
    .target Sully "The Pickle" McLeary
step
    .goto 371,41.38,77.82
    >>击杀|cRXP_ENEMY_Ga'trul|r
    .complete 30070,1 --1/1 Ga'trul slain
    .mob ga'trul
step
    .goto 371,41.45,79.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .turnin 30070 >>交任务: |cRXP_FRIENDLY_消灭加图尔|r
    .accept 31745 >>接任务: |cRXP_WARN_继往开来|r
    .target Rell Nightwind
step
    .isOnQuest 31745
    .goto 371,41.46,79.84,10 >>离开神殿. |cRXP_WARN_不要点击旋翼机|r
step
    #include 1) 翡翠林反抗支线任务
step
    #completewith Paw'don Village
    .goto 371,65.25,37.20
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    #completewith Paw'don Village
    .goto 371,65.21,37.46,5,0
    .goto 371,45.8,84.6,40 >>|cRXP_WARN_我们接取了这个任务, 以获得前往该区域的传送道具|r.
    *点击|cRXP_PICK_传送门|r返回
    .itemcount 216712,1
step
    #label Paw'don Village
    .goto 371,48.06,88.4
    >>|cRXP_WARN_跟随箭头|r
    .complete 31745,1 --1/1 Return to Paw'don Village
step
    .xp <14,1
    #loop
    .goto 371,45.89,84.63,5,0
    .goto 371,45.83,84.83,5,0
    .goto 371,45.89,84.63,0
    .goto 371,45.83,84.83,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nostwin|r交谈
    .accept 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .turnin 81976 >>接任务: |cRXP_WARN_集市，对吧？|r
    .target Nostwin
step
    .goto 371,48.05,88.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .turnin 31745 >>交任务: |cRXP_FRIENDLY_继往开来|r
    .accept 29555 >>接任务: |cRXP_WARN_白卒|r
    .accept 29556 >>接任务: |cRXP_WARN_是敌非友|r
    .target Sky Admiral Rogers
step
    #completewith Alliance Banner
    >>击杀|cRXP_ENEMY_猢狲|r
    .complete 29556,1 --14/14 Hozen slain
    .mob hozen
step
    .goto 371,49.8,90.18
    >>与船上的|cRXP_FRIENDLY_联盟保镖|r|cRXP_WARN_互动|r
    .complete 29555,1,1 --3/3 Clues found
    .target Alliance Bodyguard
step
    .goto 371,49.79,89.96,8,0
    .goto 371,50,90.28
    >>点击|cRXP_PICK_精装皮革日记|r|cRXP_WARN_在船内|r
    .complete 29555,1,2 --3/3 Clues found
    .target Fine Leather Journal
step
    .goto 371,50.01,90.38,10,0
    .goto 371,50.15,90.37,5,0
    .goto 371,50.27,90.83
    >>击杀 |cRXP_ENEMY_猢狲潜水员|r. 从他身上搜刮出 |cRXP_LOOT_船长的日志|r
    .complete 29555,2 --1/1 Encoded Captain's Log
    .mob Hozen Diver
step
    #label Alliance Banner
    .goto 371,50.15,90.782
    >>点击|cRXP_PICK_联盟旗帜|r
    .complete 29555,1,3 --3/3 Clues found
    .target Alliance Banner
step
    .isOnQuest 29556
    .goto 371,49.98,90.89,5 >>离开船只
step
    #loop
    .goto 371,49.47,90.51,20,0
    .goto 371,50.03,89.21,20,0
    .goto 371,50.58,89.99,20,0
    .goto 371,49.47,90.51,0
    .goto 371,50.03,89.21,0
    .goto 371,50.58,89.99,0
    >>击杀|cRXP_ENEMY_猢狲|r
    .complete 29556,1 --14/14 Hozen slain
    .mob hozen
step
    .goto 371,50.42,88.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺德·杰码|r交谈
    .turnin 29555 >>交任务: |cRXP_FRIENDLY_白卒|r
    .turnin 29556 >>交任务: |cRXP_FRIENDLY_是敌非友|r
    .accept 29553 >>接任务: |cRXP_WARN_失踪的海军上将|r
    .target Nodd Codejack
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r 和|cRXP_FRIENDLY_勇敢的卡拉什|r 交谈
    .turnin 29553 >>交任务: |cRXP_FRIENDLY_失踪的海军上将|r
    .goto 371,54.21,82.50
    .target +Admiral Taylor
    .accept 29558 >>接任务: |cRXP_WARN_战争之路|r
    .accept 29559 >>接任务: |cRXP_WARN_拯救同胞|r
    .accept 29560 >>接任务: |cRXP_WARN_上古力量|r
    .goto 371,54.19,82.41
    .target +Bold Karasshi
step
    #completewith Slingtail Hozen Camp loop
    #hidewindow
    #loop
    .goto 371,54.20,81.91,15,0
    .goto 371,53.89,81.92,15,0
    .goto 371,53.69,81.15,15,0
    .goto 371,54.15,81.01,15,0
    .goto 371,53.80,80.18,15,0
    .goto 371,53.47,79.99,15,0
    .goto 371,52.97,80.88,15,0
    .goto 371,53.33,81.66,15,0
    .goto 371,54.16,83.05,15,0
    .goto 371,54.37,81.29,15,0
    .goto 371,54.64,79.30,15,0
    .goto 371,54.20,81.91,0
    .goto 371,53.89,81.92,0
    .goto 371,53.69,81.15,0
    .goto 371,54.15,81.01,0
    .goto 371,53.80,80.18,0
    .goto 371,53.47,79.99,0
    .goto 371,52.97,80.88,0
    .goto 371,53.33,81.66,0
    .goto 371,54.16,83.05,0
    .goto 371,54.37,81.29,0
    .goto 371,54.64,79.30,0
    +1
step
    #completewith Prisoners freed
    >>击杀|cRXP_ENEMY_Slingtail 猢狲|r. 击败它们后可获得 |T133749:0|t[|cRXP_LOOT_竹制钥匙|r] 的战利品
    .complete 29558,1 --12/12 Slingtail hozen slain
    .mob Slingtail Treeleaper
    .mob Slingtail Mudseer
step
    #completewith Prisoners freed
    >>点击地面上的|cRXP_PICK_古代猢狲遗物|r 
    .complete 29560,1 --8/8 Ancient Hozen Skull
step
    #label Prisoners freed
    >>点击|cRXP_PICK_猢狲笼子|r解救|cRXP_FRIENDLY_联盟囚犯|r|cRXP_WARN_不要打开空的笼子|r
    .complete 29559,1 --6/6 Prisoners freed
    .collect 74260,6,29559,0x1,-1
    .disablecheckbox
    .target Alliance Prisoner
step
    #completewith next
    >>击杀|cRXP_ENEMY_Slingtail 猢狲|r. 击败它们后可获得 [|cRXP_LOOT_|T133749:0|t 竹制钥匙|r]
    .complete 29558,1 --12/12 Slingtail hozen slain
    .disablecheckbox
    .mob Slingtail Treeleaper
    .mob Slingtail Mudseer
step
    >>点击|cRXP_PICK_古代猢狲遗物|r
    .complete 29560,1 --8/8 Ancient Hozen Skull
step
    #label Slingtail Hozen Camp loop
    >>击杀|cRXP_ENEMY_Slingtail 猢狲|r
    .complete 29558,1 --12/12 Slingtail hozen slain
    .mob Slingtail Treeleaper
    .mob Slingtail Mudseer
step
    .goto 371,54.18,82.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r交谈
    .turnin 29558 >>交任务: |cRXP_FRIENDLY_战争之路|r
    .turnin 29559 >>交任务: |cRXP_FRIENDLY_拯救同胞|r
    .turnin 29560 >>交任务: |cRXP_FRIENDLY_上古力量|r
    .accept 29759 >>接任务: |cRXP_WARN_恐钉|r
    .target Bold Karasshi
step
    .goto 371,54.65,80.12
    >>击杀|cRXP_ENEMY_恐钉|r. 击败他后搜刮 [|cRXP_LOOT_吊尾钥匙|r]
    .complete 29759,1 --1/1 Slingtail Key
    .mob Kung Din
step
    .goto 371,54.18,82.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r交谈
    .turnin 29759 >>交任务: |cRXP_FRIENDLY_恐钉|r
    .target Bold Karasshi
    .accept 29562 >>接任务: |cRXP_WARN_越狱|r
step
    #loop
    .goto 371,56.27,81.48,20,0
    .goto 371,55.31,83.20,20,0
    .goto 371,55.73,80.08,20,0
    .goto 371,55.75,78.17,20,0
    .goto 371,55.31,83.20,20,0
    .goto 371,53.23,78.75,20,0
    .goto 371,56.27,81.48,0
    .goto 371,55.31,83.20,0
    .goto 371,55.73,80.08,0
    .goto 371,55.75,78.17,0
    .goto 371,55.31,83.20,0
    .goto 371,53.23,78.75,0
    >>击杀|cRXP_ENEMY_吊尾剥鱼者|r
    .complete 29562,1 --10/10 Slingtail Fishripper slain
    .mob slingtail fishripper
step
    .goto 371,58.97,81.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r交谈
    .turnin 29562 >>交任务: |cRXP_FRIENDLY_越狱|r
    .timer 54, RP
    .target Bold Karasshi
step
    #completewith 接任务: |cRXP_WARN_审时度势|r
    +|cRXP_WARN_等待角色扮演, 计时器计时结束后, 角色扮演即告结束|r. |cFFFF0000整理行囊, 优化装备 use --x item |r.
step
    #label 接任务: |cRXP_WARN_审时度势|r
    .goto 371,58.93,81.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .accept 29883 >>接任务: |cRXP_WARN_审时度势|r
    .accept 29885 >>接任务: |cRXP_WARN_行军口粮|r
    .target Rell Nightwind
step
    .goto 371,58.75,81.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珍珠守护者福锦|r交谈
    .complete 29883,1 --1/1 Speak to Pearlkeeper Fujin
    .skipgossip
    .target Pearlkeeper Fujin
step
    .goto 371,58.05,80.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长老卢山|r交谈
    .complete 29883,4 --1/1 Speak to Elder Lusshan
    .skipgossip
    .target Elder Lusshan
step
    .goto 371,58.79,84.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_锐鳍教头|r交谈
    .complete 29883,3 --1/1 Speak to Instructor Sharpfin
    .skipgossip
    .target Instructor Sharpfin
step
    .goto 371,59.91,83.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃特斯密斯·吽·提门度|r交谈
    .complete 29883,2 --1/1 Speak to Watersmith Ot-Temmdo
    .skipgossip 56693,2
    .target Watersmith Ot-Temmdo
step
    #loop
    .goto 371,61.31,83.65,20,0
    .goto 371,61.02,81.44,20,0
    .goto 371,60.97,79.64,20,0
    .goto 371,59.80,81.04,20,0
    .goto 371,57.01,84.36,20,0
    .goto 371,58.97,86.20,20,0
    .goto 371,60.56,84.90,20,0
    .goto 371,61.31,83.65,0
    .goto 371,61.02,81.44,0
    .goto 371,60.97,79.64,0
    .goto 371,59.80,81.04,0
    .goto 371,57.01,84.36,0
    .goto 371,58.97,86.20,0
    .goto 371,60.56,84.90,0
    >>击杀|cRXP_ENEMY_珍珠龟|r. 击败它们后搜刮[|cRXP_LOOT_乌龟腰肉|r]
    .complete 29885,1 --6/6 Tortoise Flank
    .mob Pearly Tortoise
step
    .goto 371,58.93,81.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
    .turnin 29883 >>交任务: |cRXP_FRIENDLY_审时度势|r
    .target Rell Nightwind
    .turnin 29885 >>交任务: |cRXP_FRIENDLY_行军口粮|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珍珠守护者福锦|r和|cRXP_FRIENDLY_勇敢的卡拉什|r交谈
    .accept 29762 >>接任务: |cRXP_WARN_传家宝|r
    .goto 371,58.97,81.7
    .target +Pearlkeeper Fujin
    .accept 29887 >>接任务: |cRXP_WARN_长老的道具|r
    .goto 371,58.76,81.28
    .target +Bold Karasshi
-- step
--     #completewith Watersmithing
--     >>击杀|cRXP_ENEMY_吊尾粘爪猴|r. 击败它们后搜刮 [|cRXP_LOOT_衣物|r ]
--     .complete 29887,3 --1/1 Jade Crown
--     .complete 29887,4 --1/1 Rosewood Beads
--     .complete 29887,2 --1/1 Ceremonial Robes
--     .complete 29887,1 --1/1 Waterspeaker's Staff
--     .mob Slingtail Stickypaw
-- step
--     #completewith Watersmithing
--     >>与 |cRXP_PICK_珠鳍村民|r互动, 收集 [|cRXP_LOOT_珠鳍遗宝|r]
--     .complete 29762,1 --8/8 Glassfin Heirloom
--     .target Pearlfin Villager
-- step
--     #label Watersmithing
--     .goto 371,66.03,87.55
--     .achievement 6846,1 >>点击|cRXP_PICK_卷轴|r
step
    #completewith Clothes
    #hidewindow
    #loop
    .goto 371,66.03,87.55,30,0
    .goto 371,67.25,87.32,30,0
    .goto 371,66.2,88.25,30,0
    .goto 371,65.46,87.7,30,0
    .goto 371,65.25,86.94,30,0
    .goto 371,67.25,87.32,0
    .goto 371,66.2,88.25,0
    .goto 371,65.46,87.7,0
    .goto 371,65.25,86.94,0
    +1
step
    #completewith next
    >>与 |cRXP_PICK_珠鳍村民|r互动, 收集 [|cRXP_LOOT_珠鳍遗宝|r]
    .complete 29762,1 --8/8 Glassfin Heirloom
    .target Pearlfin Villager
step
    >>击杀|cRXP_ENEMY_吊尾粘爪猴|r. 击败它们后搜刮 [|cRXP_LOOT_衣物|r ]
    .complete 29887,3 --1/1 Jade Crown
    .complete 29887,4 --1/1 Rosewood Beads
    .complete 29887,2 --1/1 Ceremonial Robes
    .complete 29887,1 --1/1 Waterspeaker's Staff
    .mob Slingtail Stickypaw
step
    #label Clothes
    >>与 |cRXP_PICK_珠鳍村民|r互动, 收集 [|cRXP_LOOT_珠鳍遗宝|r]
    .complete 29762,1 --8/8 Glassfin Heirloom
    .target Pearlfin Villager
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r和|r珍珠守护者福锦|r交谈
    .turnin 29762 >>交任务: |cRXP_FRIENDLY_传家宝|r
    .goto 371,58.97,81.69
    .target +Bold Karasshi
    .turnin 29887 >>交任务: |cRXP_FRIENDLY_长老的道具|r
    -- .accept 29894 >>接任务: |cRXP_WARN_水流之灵|r
    .goto 371,58.76,81.29
    .target +Pearlkeeper Fujin
step
    #include X) 至尊天神日常任务@startaugustjade-endaugustjade
step
    #include 1) 翡翠林云 serpent 支线任务
step
    #include 1) 翡翠林支线任务:精灵的困境
step
    #include 1) 翡翠林支线任务 天禅院
step
    #completewith next
    .goto 371,65.25,37.20,20,0
    .cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
    .itemcount 216712,1
    .use 216712
step
    .goto 371,65.21,37.46,5,0
    .goto 371,45.8,84.6,40 >>|cRXP_WARN_我们接取了这个任务, 以获得前往该区域的传送道具|r.
    *点击|cRXP_PICK_传送门|r返回
    .itemcount 216712,1
-- step
--     .goto 371,31.96,27.76
--     .cast 3365 >>点击熊猫人幸运硬币
-- step
--     .goto 371,26.22,32.35
--     .cast 3365 >>点击古代熊猫人茶壶
-- step
--     .goto 371,23.5,35.04
--     .cast 3365 >>点击古代熊猫人茶壶
]])
