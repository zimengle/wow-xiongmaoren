RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup 夜之子
#name 01) 夜之子解锁场景
#displayname 夜之子

<< Horde !夜之子

step
    #completewith 夜之子StartQuestline
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
    #label 夜之子StartQuestline
    .goto 85,37.65,81.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .accept 49973 >>接任务: |cRXP_WARN_塔莉萨的庄园|r
    .target Ji Firepaw
step << Mage
    #completewith 夜之子ThalyssraEstate
    .train 224869,3
    .cast 224869 >>使用传送：达拉然 - 破碎的伊尔塞斯
step
    #completewith 夜之子ThalyssraEstate
    .goto 85,53.38,90.45,10,0
    .goto 85,58.90,89.51
    .zone 630 >>通过传送门前往阿苏纳
step
    #label 夜之子ThalyssraEstate
    .goto 680,65.88,63.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女伯爵莉亚德琳|r
    .turnin 49973 >>交任务: |cRXP_FRIENDLY_塔莉萨的庄园|r
    .accept 49613 >>接任务: |cRXP_WARN_银月城|r
    .target Lady Liadrin
step << Mage
    .isOnQuest 49613
    #completewith 夜之子ThalyssraEstate
    .train 32272,3
    .cast 32272 >>使用传送：银月城
step
    .isOnQuest 49613
    .zoneskip 110
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .goto 680,65.88,63.71
    .zone 85 >>使用协调斗篷
step
    .isOnQuest 49613
    #completewith next
    .zoneskip 110
    .zone 627 >>如果你有达拉然炉石（在你的玩具箱里），就使用它
step 
    .isOnQuest 49613
    .zoneskip 110
    .goto 627,55.27,23.93
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .zoneskip 85,1
    .goto 85,56.02,88.25
    .zone 110 >>通过传送门前往银月城
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女伯爵莉亚德琳|r
    .goto 110,58.11,19.87
    .turnin 49613 >>交任务: |cRXP_FRIENDLY_银月城|r
    .accept 49354 >>接任务: |cRXP_WARN_记住太阳之井的耻辱|r
    .target Lady Liadrin
step
    #sticky
    #label 夜之子RemembertheSunwell
    >>完成“记住太阳之井”场景
    .goto 110,53.97,19.51,0,0
    .complete 49354,1 --1/1 "Remember the Sunwell" scenario complete
step
    .isOnQuest 49354
    #completewith next
    .goto 110,56.43,73.10,10,0
    .goto 110,53.97,19.51
    .zone 973 >>通过传送门前往太阳之井
step
    .isOnQuest 49354
    >>前往航点位置。等待 RP
    .scenario 3583,1
    .goto 973,49.27,67.10
step
    .isOnQuest 49354
    >>杀死 |cRXP_ENEMY_Void Effusions|r 和 |cRXP_ENEMY_Creeping Void|r
    .goto 973,46.43,74.16,25,0
    .goto 973,36.95,61.32,25,0
    .goto 973,47.16,47.87,25,0
    .goto 973,55.03,59.13,25,0
#loop
	.line 973,46.43,74.16,36.95,61.32,47.16,47.87,55.03,59.13
	.goto 973,46.43,74.16,25,0
	.goto 973,36.95,61.32,25,0
	.goto 973,47.16,47.87,25,0
	.goto 973,55.03,59.13,25,0
    .scenario 3584,1
    .mob Void Effusion
    .mob Creeping Void
    .mob Void Fragment
step
    .isOnQuest 49354
    >>杀死 |cRXP_ENEMY_黑暗者阿鲁恩|r
    .goto 973,49.51,66.10
    .scenario 3585,1
    .mob Aruun the Darkener
step
    .isOnQuest 49354
    >>前往航点位置。等待 RP
    .goto 973,62.80,66.16
    .scenario 3663,1 --1/1 Void rift closed
step
    .isOnQuest 49354
    #completewith 夜之子RemembertheSunwell
    >>使用 |cRXP_PICK_Silvermoon 传送器|r
    .goto 973,62.58,66.94
    .scenario 3586,1 --1/1 Leave the Sunwell
step
    #requires 夜之子RemembertheSunwell
    .goto 110,58.44,19.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女伯爵莉亚德琳|r
    .turnin 49354 >>交任务: |cRXP_FRIENDLY_记住太阳之井的耻辱|r
    .accept 49614 >>接任务: |cRXP_WARN_夜之子|r
    .target Lady Liadrin
step << Mage
    .isOnQuest 49614
    #completewith 夜之子The夜之子
    .zoneskip 85
    .goto 110,58.44,19.13
    .cast 3567>>使用传送：奥格瑞玛
step
    .isOnQuest 49614
    #completewith next
    .zoneskip 85
    .itemcount 140192,1
    .cooldown item,140192,>0,1
    .goto 680,65.88,63.71
    .zone 627 >>如果你有达拉然炉石（在你的玩具箱里），就使用它
step 
    .isOnQuest 49614
    .zoneskip 627,1
    .goto 627,55.27,23.93
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    #completewith next
    .zoneskip 85
    .goto 110,51.93,18.06,10,0
    .goto 110,48.52,14.91,10,0
    .goto 110,49.80,13.85,8,0
    .goto 110,49.52,14.80
    .zone 18 >>使用 |cRXP_PICK_Orb 的 Translocation|r
step
    #completewith next
    .goto 18,60.74,58.68
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r on top of the tower. |cRXP_WARN_You may have to talk to Zidormi (speech bubble on the map) to get to the correct phase.|r
step
    #label 夜之子The夜之子
    .goto 85,37.76,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ji Firepaw|r
    .turnin 49614 >>交任务: |cRXP_FRIENDLY_夜之子|r
    .target Ji Firepaw
step
    .isQuestTurnedIn 49614
    +恭喜！您已解锁夜之子！
]])
