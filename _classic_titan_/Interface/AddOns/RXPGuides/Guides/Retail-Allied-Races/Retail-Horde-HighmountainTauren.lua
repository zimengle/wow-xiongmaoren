RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup 至高岭牛头人
#name 1) 至高岭牛头人解锁任务线
#displayname 至高岭牛头人

<< Horde !HighmountainTauren

step
    #completewith HighmountainStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与横幅互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 至高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label HighmountainStartQuestline
    .isQuestTurnedIn 50242
    .goto 85,37.65,81.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .accept 48066 >>接任务: |cRXP_WARN_款待同胞|r
    .target Ji Firepaw
step
    .isOnQuest 48066
    .goto 85,53.40,90.43,10,0
    .goto 85,58.51,91.26
    .zone 1163 >>通过传送门前往祖达萨
step
    .isOnQuest 48066
    .goto 1163,73.72,77.17
    .zone 88 >>通过传送门前往雷霆崖
step
    .isOnQuest 48066
    #completewith next
    .goto 88,30.21,30.05,10 >>离开洞穴
step
    .isOnQuest 48066
    .goto 88,61.61,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bain Bloodhoof|r
    .turnin 48066>>交出一份亲族盛宴
    .target Bain Bloodhoof
step
    .isQuestTurnedIn 48066
    .goto 88,61.52,51.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bain Bloodhoof|r after a short roleplay
    .accept 48067 >>接任务: |cRXP_WARN_雷霆崖的阴影|r
    .target Bain Bloodhoof
step
    >>杀死 |cRXP_ENEMY_Dark Tendrils|r 或 |cRXP_ENEMY_Shadow of Uul|r
    .goto 88,56.02,48.32,25,0
    .goto 88,49.64,50.90,25,0
    .goto 88,49.82,36.89,25,0
    .goto 88,42.96,57.80,25,0
    .goto 88,38.18,53.12
    .complete 48067,1 --4/4 Dark Tendril slain
    .complete 48067,2 --12/12 Shadow of Uul slain
step
    .goto 88,42.18,57.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bain Bloodhoof|r next to you
    .turnin 48066>>交出雷霆崖上的暗影
    .accept 49756 >>接任务: |cRXP_WARN_黑暗之力|r
    .target Bain Bloodhoof
step
    >>杀死 |cRXP_ENEMY_Qy'telek|r
    .goto 88,41.76,59.89
    .complete 49756,1 --1/1 Qy'telek slain
step
    .goto 88,42.18,57.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bain Bloodhoof|r
    .turnin 49756 >>交任务: |cRXP_FRIENDLY_黑暗之力|r
    .accept 48079 >>接任务: |cRXP_WARN_返回至高岭|r
    .target Bain Bloodhoof
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送：奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协调斗篷
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石（在你的玩具箱里），就使用它
step
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .zoneskip 85,1
    .goto 85,58.86,89.52
    .zone 630>>使用传送门前往阿苏纳
step
    .goto 652,54.92,63.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mayla Highmountain|r
    .turnin 48079 >>交任务: |cRXP_FRIENDLY_返回至高岭|r
    .target Mayla Highmountain
step
    .goto 652,68.49,73.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r
    .accept 41884 >>接任务: |cRXP_WARN_黑暗传说|r
    .target Spiritwalker Graysky
step
    .goto 650,38.51,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r in Riverbend
    .turnin 41884 >>交任务: |cRXP_FRIENDLY_黑暗传说|r
    .accept 41764 >>接任务: |cRXP_WARN_前人的脚步|r
    .target Spiritwalker Graysky
step
    .goto 650,38.53,69.18
    >>与视觉之水互动
    .complete 41764,1 --1/1 Water of Vision used
step
    >>杀死 |cRXP_ENEMY_Shadow Lurkers|r 和 |cRXP_ENEMY_Shadows of Uul|返回
    .goto 650,40.12,71.59,25,0
    .goto 650,41.51,72.60,25,0
    .goto 650,43.75,74.11,12,0
    .goto 650,44.23,75.17,15,0
    .goto 650,45.21,76.24,20,0
    .complete 41764,2 --8/8 Shadow Lurker slain
    .complete 41764,3 --15/15 Shadow of Uul slain
    .mob Shadow Lurker
    .mob Shadow of Uul
step
    >>将 Bitestone Ward 放置在楼上
    .goto 650,44.23,75.17,15,0
    .goto 650,45.21,76.24,20,0
    .goto 650,46.29,74.35,20,0
    .goto 650,46.16,73.68
    .complete 41764,4 --1/1 Bitestone Ward placed
step
    .goto 650,38.51,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r
    .turnin 41764 >>交任务: |cRXP_FRIENDLY_前人的脚步|r
    .accept 48185 >>接任务: |cRXP_WARN_圣墓的阴影|r
    .target Spiritwalker Graysky
step
    .goto 650,57.02,46.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r
    .turnin 48185 >>交任务: |cRXP_FRIENDLY_圣墓的阴影|r
    .accept 41799 >>接任务: |cRXP_WARN_黑暗爪牙|r
    .target Spiritwalker Graysky
step
    .goto 650,57.05,46.16
    >>与视觉之水互动
    .complete 41799,1 --1/1 Water of Vision used
step
    >>杀死|cRXP_ENEMY_Dark Spirits|r。
    >>当你周围有多个怪物时，使用 |T132312:0|t[凤凰之怒] (1) 或 |T1029585:0|t[旋风漩涡] (2)
    .complete 41799,2 --12/12 Dark Spirit slain
    .goto 650,56.02,44.26,25,0
    .goto 650,54.76,45.12,25,0
    .goto 650,57.05,46.16,30,0
#loop
	.line 650,56.02,44.26,54.76,45.12,57.05,46.16
	.goto 650,56.02,44.26,30,0
	.goto 650,54.76,45.12,30,0
	.goto 650,57.05,46.16,30,0
    .mob Dark Spirit
step
    #completewith next
    .goto 650,54.98,44.11,10 >>进入洞穴
step
    >>杀死 |cRXP_ENEMY_Shadowy Tendrils|r
    >>垃圾邮件 |T132312:0|t[凤凰之怒] (1)
    .goto 650,54.43,43.16,15,0
    .goto 650,55.07,41.90
    .complete 41799,3 --6/6 Shadowy Tendril slain
    .mob Shadowy Tendril
step
    >>杀死|cRXP_ENEMY_黑暗之影|r
    >>使用 |T132312:0|t[凤凰之怒] (1) 保持 3 层 DOT 效果，并在冷却中使用 |T1029585:0|t[旋风漩涡] (2)
    .complete 41799,4 --1/1 Shadow of the Darkness slain
    .goto 650,55.47,40.99
    .mob Shadow of the Darkness
step
    >>放置墓穴守卫
    .complete 41799,5 --1/1 Sepulcher Ward placed
    .goto 650,54.74,40.63
step
    .goto 650,57.02,46.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r
    .turnin 41799 >>交任务: |cRXP_FRIENDLY_黑暗爪牙|r
    .accept 48190 >>接任务: |cRXP_WARN_胡恩的高岭|r
    .target Spiritwalker Graysky
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r in Snowblind Mesa
    .goto 650,53.33,64.01
    .turnin 48190 >>交任务: |cRXP_FRIENDLY_胡恩的高岭|r
    .accept 41800 >>接任务: |cRXP_WARN_黑暗之王的仆从|r
    .target Spiritwalker Graysky
step
    .goto 650,53.32,64.00
    >>与 |cRXP_FRIENDLY_Spiritwalker Graysky|r 互动
    .complete 41800,1 --1/1 Water of Vision used
step
    >>杀死|cRXP_ENEMY_Necrotic Defilers|r
    >>在 |T134174:0|t[Gore Charge] (3) 冷却时使用并发送 |T644382:0|t[Wild Carve] (1)
    .goto 650,53.70,66.32,25,0
    .goto 650,52.99,66.76,25,0
    .goto 650,51.50,66.64,25,0
#loop
	.line 650,53.70,66.32,52.99,66.76,,51.50,66.64
	.goto 650,53.70,66.32,30,0
	.goto 650,52.99,66.76,30,0
	.goto 650,51.50,66.64,30,0
    .complete 41800,2 --10/10 Necrotic Defiler slain
    .mob Necrotic Defiler
step
    >>杀死 |cRXP_ENEMY_Necrogg the Darkspear|r。他正在山下巡逻
    >>在击退后使用 |T135127:0|t[鱼叉践踏] (2)
    .goto 650,53.00,69.40
    .complete 41800,3 --1/1 Necrogg the Darkspear slain
    .mob Necrogg the Darkspear
step
    >>放置雪鬃守卫
    .goto 650,53.32,69.47
    .complete 41800,4 --1/1 Snowmane Ward placed
step
    .goto 650,57.02,46.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Graysky|r
    .turnin 41800 >>交任务: |cRXP_FRIENDLY_黑暗之王的仆从|r
    .accept 48434 >>接任务: |cRXP_WARN_黑角怎么样了？|r
    .target Spiritwalker Graysky
step
    #completewith next
    .goto 750,49.30,46.09,5 >>乘坐电梯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Ebonhorn|r and |cRXP_FRIENDLY_Mayla Highmountain|r
    .turnin 48434 >>交任务: |cRXP_FRIENDLY_黑角怎么样了？|r
    .goto 652,67.69,71.39
    .accept 41815 >>接任务: |cRXP_WARN_亡黯的诅咒|r
    .goto 652,68.85,71.08
    .target Spiritwalker Ebonhorn
    .target Mayla Highmountain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贝恩·血蹄|r, Jale Rivermane
    .turnin 41815 >>交任务: |cRXP_FRIENDLY_亡黯的诅咒|r
    .accept 41840 >>接任务: |cRXP_WARN_冰与影|r
    .goto 650,56.49,89.23
    .accept 41882 >>接任务: |cRXP_WARN_黑暗低语|r
    .goto 650,56.45,89.33
    .target Baine Bloodhoof
    .target Jale Rivermane
step
    #completewith HighmountainTaurenWhispersoftheDarkness
    >>杀死 |cRXP_ENEMY_Necrodarks|r 或 |cRXP_ENEMY_Frozen Mists|r。掠夺他们以获得 |cRXP_LOOT_Shadowice Shards|r
    .complete 41840,1 --20/20 Shadowice Shard
step
    #title Protector freed 1/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,56.92,89.68
    .complete 41882,1,1 --1/6 Highmountain Protector freed
step
    #title Protector freed 2/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,56.83,88.47
    .complete 41882,1,2 --2/6 Highmountain Protector freed
step
    #title Protector freed 3/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,57.49,88.95
    .complete 41882,1,3 --3/6 Highmountain Protector freed
step
    #title Protector freed 4/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,57.36,90.01
    .complete 41882,1,4 --4/6 Highmountain Protector freed
step
    #title Protector freed 5/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,58.16,90.67
    .complete 41882,1,5 --5/6 Highmountain Protector freed
step
    #label HighmountainTaurenWhispersoftheDarkness
    #title Protector freed 6/6
    >>释放 |cRXP_FRIENDLY_Highmountain Protector|r。他们可能会攻击你
    .goto 650,57.61,91.11
    .complete 41882,1 --6/6 Highmountain Protector freed
step
    >>杀死 |cRXP_ENEMY_Necrodarks|r 或 |cRXP_ENEMY_Frozen Mists|r。掠夺他们以获得 |cRXP_LOOT_Shadowice Shards|r
    >>|cRXP_WARN_|cRXP_ENEMY_Frozen Mists|r 是最好的来源|r
    .complete 41840,1 --20/20 Shadowice Shard
    .goto 650,57.15,94.63,30,0
    .goto 650,54.48,91.85,30,0
    .goto 650,58.22,91.49,30,0
#loop
	.line 650,57.15,94.63,54.48,91.85,,58.22,91.49
	.goto 650,57.15,94.63,30,0
	.goto 650,54.48,91.85,30,0
	.goto 650,58.22,91.49,30,0
step
    .goto 650,57.55,92.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Ebonhorn|r
    .turnin 41840 >>交任务: |cRXP_FRIENDLY_冰与影|r
    .turnin 41882 >>交任务: |cRXP_FRIENDLY_黑暗低语|r
    .accept 41841 >>接任务: |cRXP_WARN_最后的结界|r
    .target Spiritwalker Ebonhorn
step
    #completewith next
    .goto 650,57.28,92.23,10 >>进入洞穴
step
    >>放置 Summit 病房
    .goto 650,56.50,91.45
    .complete 41841,1 --1/1 放置 Summit 病房
step
    .goto 650,56.82,92.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Spiritwalker Ebonhorn|r
    .turnin 41841 >>交任务: |cRXP_FRIENDLY_最后的结界|r
    .accept 48403 >>接任务: |cRXP_WARN_黑暗之兽|r
    .target Spiritwalker Ebonhorn
step
    #completewith next
    .goto 650,57.28,92.23,10 >>离开洞穴
step
    >>杀死 |cRXP_ENEMY_Uul'gyneth|r。|cRXP_WARN_你可以捡起贝恩斯图腾并将其扔掉|r
    .goto 650,57.94,90.84
    .complete 48403,1 --1/1 Uul'gyneth slain
    .mob Uul'gyneth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mayla Highmountain|r and |cRXP_FRIENDLY_Bain Bloodhoof|r
    .turnin 48403 >>交任务: |cRXP_FRIENDLY_黑暗之兽|r
    .goto 650,56.66,92.71
    .accept 48433 >>接任务: |cRXP_WARN_团结是部落的力量！|r
    .goto 650,56.70,92.77
    .target Mayla Highmountain
    .target Baine Bloodhoof
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送：奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协调斗篷
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石（在你的玩具箱里），就使用它
step
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .goto 85,37.78,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 48433 >>交任务: |cRXP_FRIENDLY_团结是部落的力量！|r
    .target Ji Firepaw
step
    .isQuestTurnedIn 48433
    +恭喜！您已解锁至高岭牛头人！
]])