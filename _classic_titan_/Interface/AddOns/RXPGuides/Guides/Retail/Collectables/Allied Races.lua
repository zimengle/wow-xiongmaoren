-- ================================================================
-- ================    ALLIED RACE UNLOCK   =======================
-- ================================================================

-----------------------------------------------------
--- ALLIANCE
-----------------------------------------------------

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 收藏品
#subgroup 同盟种族
#name 1a
#displayname |cFFFCDC00解锁|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled


]])

---VoidElf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name a) 虚空精灵解锁
#displayname |cFF00CCFF1|r - 虚空精灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ab) 光铸德莱尼 解锁

<< Alliance !VoidElf

step
    #completewith next
    .zone 84 >>前往|cRXP_WARN_to暴风城|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r在暴风城大使馆内交谈
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空精灵旗帜|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kul Tiran 旗帜|r
    .complete 50239,4 --1/1 Learn about the Kul Tirans
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mechagnome 标志|r
    .complete 50239,5 --1/1 Learn about the Mechagnomes
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_黑铁矮人旗帜|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_光铸德莱尼军旗|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 49787 >>接任务: |cRXP_WARN_幽魂之地|r
    .target Aysa Cloudsinger
step
    .goto 84,52.44,13.23
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
    .complete 49787,1 --1/1 Travel to the Ghostlands
step
    .goto 95,33.87,33.37,5,0
    .goto 95,33.63,34.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_乌姆布里克的笔记 - 月亮圣殿|r
    .complete 49787,2 --1/1 Umbric's Notes - Sanctum of the Moon
step
    .goto 95,33.7,33.59,5,0
    .goto 95,34,33.19,5,0
    .goto 95,46.88,55.00,5,0
    .goto 95,46.88,54.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_乌姆布里克的笔记 - 安迪尔林庄园|r
    .complete 49787,3 --1/1 Umbric's Notes - Andilien Estate
step
    .goto 95,46.69,56.05,5,0
    .goto 95,57.71,51.13,10,0
    .goto 95,65.6,41.78,30,0
    .goto 95,71.04,32.02,5,0
    .goto 95,79.35,16.76,5,0
    .goto 95,79.66,17.52
    .cast 258931 >>Jump to and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Teleportation Console|r.
step
    .goto 95,79.99,19.86,5,0
    .goto 95,79.27,20.21,5,0
    .goto 95,79.66,19.7
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_乌姆布里克的笔记 - 晨星之塔|r
    .complete 49787,4 --1/1 Umbric's Notes - Dawnstar Spire
step
    .goto 95,79.68,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 49787 >>交任务: |cRXP_FRIENDLY_幽魂之地|r
    .accept 48962 >>接任务: |cRXP_WARN_泰洛古斯裂隙|r
    .target Alleria Windrunner
step
    .goto 95,79.64,19.8
    .zone 972 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
step
    .goto 972,47.84,73.88
    .gossipoption 47941 >>与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .timer 66,Duration until continuation.
    .target Magister Umbric
step
    .goto 972,48.97,73.02
    .scenario 3675,1 >>|cRXP_WARN_前往箭头指示的位置|r.
step
    .goto 972,37.3,49.23
    .scenario 3490,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
step
    .goto 972,37.3,49.23
    .scenario 3662,1,100 >>击杀|cRXP_ENEMY_Void生物|r. |cRXP_WARN_请勿靠近虚空气泡|r
    .mob Creeping Void
    .mob Netherguard Phaseblade
    .mob Curious Voidstalker
    .mob Netherguard Transmogrifier
step
    .goto 972,37.3,49.23
    .scenario 3673,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
step
    .goto 972,37.3,49.23
    .scenario 3495,1,100 >>击杀|cRXP_ENEMY_Void生物|r. |cRXP_WARN_请勿靠近虚空气泡|r
    .mob Dark Manifestation
    .mob Curious Voidstalker
step
    .goto 972,28.96,40.21
    .scenario 3496,1 >>击杀|cRXP_ENEMY_Nhr'ghesh|r
    .mob Nhr'ghesh
step
    .goto 972,28.89,38.2
    .scenario 3520,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
step
    .goto 972,29.02,27.72,5,0
    .goto 972,28.5,21.7,5,0
    .goto 972,26.23,24.46
    .scenario 3674,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Voidforges|r
step
    .goto 972,27.78,24.1
    >>击杀|cRXP_ENEMY_Nether-Prince Durzaan|r
    .complete 48962,1 --"Telogrus Rift" scenario complete
    .mob Nether-Prince Durzaan
step
    #completewith next
    .goto 972,27.98,24.48,5,0
    .cast 253691 >>点击|cRXP_PICK_荒芜之地, 卡加斯|r传送至|cRXP_WARN_暴风城|r
    .isOnQuest 48962
step
    .goto 84,52.05,13.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 48962 >>交任务: |cRXP_FRIENDLY_泰洛古斯裂隙|r
    .target Aysa Cloudsinger
]])

--LightforgedDraenei
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name ab) 光铸德莱尼 解锁
#displayname |cFF00CCFF2|r - 光铸德莱尼 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ac) 解锁暗铁矮人

<< Alliance !LightforgedDraenei

step
    #completewith next
    .zone 84 >>前往|cRXP_WARN_to暴风城|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r在暴风城大使馆内交谈
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空精灵旗帜|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kul Tiran 旗帜|r
    .complete 50239,4 --1/1 Learn about the Kul Tirans
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mechagnome 旗帜|r
    .complete 50239,5 --1/1 Learn about the Mechagnomes
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_黑铁矮人旗帜|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_光铸德莱尼军旗|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 49698 >>接任务: |cRXP_WARN_光铸者|r
    .target Aysa Cloudsinger
step
    #completewith next
    .goto 84,52.81,14.57,5,0
    .goto 84,54.426,14.433,10 >>前往|cRXP_PICK_Lightforged 信标|r方向
    .isOnQuest 49698
step
    .goto 84,52.81,14.57,5,0
    .goto 84,54.426,14.433
    .zone 940 >>使用|cRXP_PICK_Lightforged Beacon|r传送至维迪卡尔号
    .complete 49698,1 --Stormwind Embassy Beacon used (1)
    .isOnQuest 49698
step
    .goto 940,43.852,27.027
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法瑞娅队长|r交谈
    >>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 49698 >>交任务: |cRXP_FRIENDLY_光铸者|r
    .accept 49266 >>接任务: |cRXP_WARN_万世熔炉|r
    .target Captain Fareeya
step
    .goto 940,49.945,46.279
    .zone 933 >>使用|cRXP_PICK_Lightforged Beacon|r传送至永恒熔炉
    .isOnQuest 49266
--XX no zone ID (its a scenario) so .cast must be used
step
    .goto 933,88.51,36.44,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    .timer 27,Duration until continuation.
    -- .scenario 3547,1 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,87.42,29.73
    .scenario 3549,1 >>|cRXP_WARN_Wait|cRXP_WARN_in front of the building|r|r.
    .isOnQuest 49266
step
    .goto 933,89.13,28.53,5 >>|cRXP_WARN_前往箭头指示的位置|r.
    .timer 14,Duration until continuation.
step
    .goto 933,75.78,31.33,5 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,75.78,31.33
    .scenario 3550,1 >>|cRXP_WARN_请等待剩余时间|r.
    .isOnQuest 49266
step
    .goto 933,66.81,29.77,5 >>找到|cRXP_FRIENDLY_Child|r
    .timer 15,Duration until continuation.
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,66.87,29.96
    .scenario 3553,1 >>|cRXP_WARN_击杀|cRXP_ENEMY_沼泽巨蟒|r|r
    .mob Swamp Serpent
    .isOnQuest 49266
 step
    .goto 933,56.43,23.82,5 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,56.43,23.82
    .scenario 3554,1 >>|cRXP_WARN_等待|r|cRXP_FRIENDLY_T'paartos|r到达|r
    .isOnQuest 49266
step
    .goto 933,46.96,27.4
    .scenario 3555,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击洞穴内的|r水晶|r
    .isOnQuest 49266
step
    .goto 933,46.96,27.4
    .scenario 3561,1 >>击杀|cRXP_ENEMY_水晶怒焰|r
    .mob Crystal Fury
    .isOnQuest 49266
step
    .goto 933,57.03,23.41,5 >>离开|cRXP_WARN_洞穴|r
    .isOnQuest 49266
step
    .goto 933,52.93,31.59,20,0
    .goto 933,41.26,46.52,20,0
    .goto 933,27.44,36.56
    .scenario 3556,1 >>杀死|cRXP_ENEMY_怀疑|r和|cRXP_ENEMY_恐惧|r
    .mob Fear
    .mob Doubt
    .isOnQuest 49266
step
    .goto 933,16.92,46.28,5 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,16.92,46.28
    .scenario 3570,1 >>|cRXP_WARN_等待|r|cRXP_FRIENDLY_T'paartos|r到达|r
    .isOnQuest 49266
step
    .goto 933,11.35,50.13,5 >>进入|cRXP_WARN_洞穴|r
    .timer 3, Terror activates in...
    .isOnQuest 49266
step
    .goto 933,8.57,50.04
    .scenario 3571,1 >>|cRXP_WARN_击杀|cRXP_ENEMY_恐怖|r|r
    .mob Terror
    .isOnQuest 49266
step
    .goto 933,17.25,46.42,10 >>离开|cRXP_WARN_洞穴|r
    .isOnQuest 49266
step
    .goto 933,41.85,58.85,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,41.85,58.85
    .scenario 3572,1 >>|cRXP_WARN_等待|r|cRXP_FRIENDLY_T'paartos|r到达|r
    .isOnQuest 49266
step
    .goto 933,46.79,65.98
    .scenario 3573,1 >>|TInterface/cursor/crosshair/interact.blp:20|t与|cRXP_FRIENDLY_T'paartos|r互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,66.37,77.37,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    .isOnQuest 49266
step
    .goto 933,66.37,77.37
    .scenario 3579,1 >>|cRXP_WARN_等待|r|cRXP_FRIENDLY_T'paartos|r到达|r
    .isOnQuest 49266
step
    .goto 933,68.51,77,5 >>|cRXP_WARN_沿着螺旋楼梯下行|r
    .isOnQuest 49266
step
    .goto 933,63.78,71.47,5,0
    .goto 933,61.53,75.87,5,0
    .goto 933,68.36,77.08
    .scenario 3574,1 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos|r|r(1)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,61.53,75.87,5 >>|cRXP_WARN_深入更深处|cRXP_WARN_进入洞穴|r|r.
    .isOnQuest 49266
step
    .goto 933,65.73,73.57
    .scenario 3574,2 >>|cRXP_WARN_与|cRXP_FRIENDLY_T'paartos|r|r(2)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,72.31,86.51
    .scenario 3574,3 >>|cRXP_WARN_与|cRXP_FRIENDLY_T'paartos|r|r(3)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,73.59,75.21,15,0
    .goto 933,69.63,68.27
    .scenario 3574,4 >>|cRXP_WARN_与|cRXP_FRIENDLY_T'paartos|r|r(4)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,65.16,71.82,15,0
    .goto 933,63.03,74.51
    .scenario 3574,5 >>|cRXP_WARN_与|cRXP_FRIENDLY_T'paartos|r|r(5)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,64.02,81.39,15,0
    .goto 933,69.6,77.79
    .scenario 3574,6 >>|cRXP_WARN_与|cRXP_FRIENDLY_T'paartos|r|r(6)互动
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,68.59,88.86,15,0
    .goto 933,73.39,94.59
    >>击杀|cRXP_ENEMY_T'paartos 坠落者|r
    .complete 49266,1 --Forge of Aeons scenario completed
    .mob T'paartos the Fallen
    .isOnQuest 49266
    --x wrong scenaruio id fix
step
    #completewith next
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_点击此处获取一个宏, 通过在聊天中输入该宏即可退出队伍|r
    +|cRXP_WARN_你也可以通过其他标准方式离开|r
    .isOnQuest 49266
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Captain Fareeya|r和|cRXP_FRIENDLY_High Exarch Turalyon|r交谈
    .turnin 49266 >>交任务: |cRXP_FRIENDLY_万世熔炉|r
    .goto 940,48.453,39.556
    .target +Captain Fareeya
    .accept 50071 >>接任务: |cRXP_WARN_为圣光而战！|r
    .goto 940,47.468,40.178
    .target +High Exarch Turalyon
step
    #completewith next
    .goto 941,43.180,24.938
    >>下楼
    .zone 84 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通往暴风城的传送门|r
step
    .goto 84,52.79,14.51,5,0
    .goto 84,52.05,13.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50071 >>交任务: |cRXP_FRIENDLY_为圣光而战！|r
    .target Aysa Cloudsinger
]])

--DarkIronDwarf 
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name ac) 解锁暗铁矮人
#displayname |cFF00CCFF3|r - 黑铁矮人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AD) 库尔提拉斯解锁

<< Alliance !DarkIronDwarf

step
    #completewith next
    .zone 84 >>前往|cRXP_WARN_to暴风城|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r在暴风城大使馆内交谈
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空精灵旗帜|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kul Tiran 旗帜|r
    .complete 50239,4 --1/1 Learn about the Kul Tirans
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mechagnome 旗帜|r
    .complete 50239,5 --1/1 Learn about the Mechagnomes
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_黑铁矮人旗帜|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_光铸德莱尼军旗|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 51813 >>接任务: |cRXP_WARN_黑石深渊|r
    .target Aysa Cloudsinger
step
    .goto 84,51.88,14.06
    .gossipoption 48178 >>与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .target Moira Thaurissan
    .isOnQuest 51813
step
    .goto 1159,56.03,31.84
    >>|cRXP_WARN_前往箭头指示的位置, 并等待简短的剧情演出|r
    .scenario 3830,1 --1/1
    .isOnQuest 51813
step
    .goto 1159,55.84,31.94
    .cast 274627 >>点击地面上的|cRXP_PICK_箱子|r
    .isOnQuest 51813
step
    .goto 1159,56.65,31.33
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_箱子|r|cRXP_WARN_在 黑铁砧|r
    .scenario 3847,1
    .timer 5, Time until first wave.
    .isOnQuest 51813
step
    .goto 1159,56.65,31.33
    >>|cRXP_WARN_等待短暂的角色扮演后|r. 击杀 |cRXP_ENEMY_凝固的艾泽里特|r
    .scenario 3848,1,75
    .isOnQuest 51813
    .mob Unleashed Azerite
    .mob Congealed Azerite
    .mob Unbound Azerite
step
    .goto 1159,55.38,33.23
    >>击杀|cRXP_ENEMY_Unleashed 阿泽瑞特|r
    .scenario 3848,1,91
    .isOnQuest 51813
    .mob Unleashed Azerite
    .mob Congealed Azerite
    .mob Unbound Azerite
step
    .goto 1159,55.38,33.23
    >>击杀|cRXP_ENEMY_虚空裂隙艾泽瑞尔|r
    .scenario 3848,1,100
    .isOnQuest 51813
    .mob Unleashed Azerite
    .mob Congealed Azerite
    .mob Unbound Azerite
step
    .goto 1159,49.93,41.67
    >>|cRXP_WARN_前往箭头指示的位置, 并等待简短的剧情演出|r
    .scenario 3849,1
    .isOnQuest 51813
    .mob Venture Co. Skyscorcher
step
    .goto 1159,49.93,41.67
    >>击杀|cRXP_ENEMY_Venture Co. Skyscorcher|r
    .scenario 3850,1
    .isOnQuest 51813
    .mob Venture Co. Skyscorcher
step
    .goto 1159,38.09,58.9,15,0
    .goto 1159,29.93,56.72,10,0
    .goto 1159,35.73,63.84
    >>杀死你沿途遇到的每一个敌人
    .scenario 3851,1,100
    .isOnQuest 51813
    .mob Wanton Sapper
    .mob Azerite Extractor
    .mob Fanatical Driller
    .mob Venture Co. Earthshaper
step
    .goto 1159,35.73,63.84
    >>击败|cRXP_ENEMY_Rixxa Fluxflame|r, 将其生命值降低至75%
    .scenario 3852,1
    .timer 11, Duration until continuation.
    .mob Rixxa Fluxflame
    .isOnQuest 51813
step
    .goto 1159,36.79,61.65
    .cast 3365 >>点击地面上的|cRXP_PICK_Propellant Canister|r|cRXP_WARN_| 原子燃料罐
    .isOnQuest 51813
step
    .goto 1159,39.37,55.18
    .cast 3365 >>点击地面上的|cRXP_PICK_Propellant Canister|r|cRXP_WARN_| 原子燃料罐
    .isOnQuest 51813
step
    .goto 1159,44.33,49.55
    .cast 3365 >>点击地面上的|cRXP_PICK_Propellant Canister|r|cRXP_WARN_| 原子燃料罐
    .isOnQuest 51813
step
    .goto 1159,49.23,44.38
    .cast 3365 >>点击地面上的|cRXP_PICK_Propellant Canister|r|cRXP_WARN_| 原子燃料罐
    .isOnQuest 51813
step
    .goto 1159,57.11,30.41
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 51813,1 --Blackrock Depths scenario completed
step
    .goto 1159,57.04,30.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 51813 >>交任务: |cRXP_FRIENDLY_黑石深渊|r
    .accept 53351 >>接任务: |cRXP_WARN_暴富矿区！！：反对者|r
    .target Moira Thaurissan
step
    #completewith 交任务: |cRXP_FRIENDLY_暴富矿区！！：反对者|r
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_点击此处获取一个宏, 通过在聊天中输入该宏即可退出队伍|r
    +|cRXP_WARN_你也可以通过其他标准方式离开|r
    .isOnQuest 53351
step
    .goto 84,51.89,14.07
    .gossipoption 48181 >>与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .target Moira Thaurissan
    .isOnQuest 53351
step
    #label 交任务: |cRXP_FRIENDLY_暴富矿区！！：反对者|r
    .goto 84,51.89,14.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 53351 >>交任务: |cRXP_FRIENDLY_暴富矿区！！：反对者|r
    .accept 53342 >>接任务: |cRXP_WARN_熔火之心|r
    .target Moira Thaurissan
    .isOnQuest 53351
step
    .goto 84,51.89,14.07
    .gossipoption 48179 >>与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .target Moira Thaurissan
    .isOnQuest 53342
step
    .goto 1160,29.17,26.27
    .vehicle >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_坦克|r
    .target The Tank
    .isOnQuest 53342
step
    .goto 1160,33.04,21.38,5 >>使用 |T1032476:0|t [Afterburn](2) 冲刺远离边缘|cRXP_WARN_|r. |cRXP_WARN_| 请瞄准落在山崖上
    .isOnQuest 53342
step
    .goto 1160,41.94,25.73,25,0
    .goto 1160,44.83,64.11,15 >>使用 |T1032476:0|t[燃烧追击](2)进行冲刺, 使用 |T135781:0|t[冰冻凝视者](1)击杀你前方的|cRXP_ENEMY_enemies|r|cRXP_WARN_敌人|r
    .timer 7, Duration until continuation.
    .isOnQuest 53342
step
    .goto 1160,61.13,61.75,10,0
    .goto 1160,62.08,53.53,10,0
    .goto 1160,59.21,48.71,10,0
    .goto 1160,56.71,54.29,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    .timer 20, Duration until continuation.
    .isOnQuest 53342
step
    .goto 1160,56.48,54.86
    >>Kill |cRXP_ENEMY_Gezzrok the Keeper|r and then |TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r |cRXP_WARN_in the middle|r.
    .complete 53342,2 --1/1 Fragment o' the Molten Core
    .mob Gezzrok the Keeper
step
    #completewith next
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_点击此处获取一个宏, 通过在聊天中输入该宏即可退出队伍|r
    +|cRXP_WARN_你也可以通过其他标准方式离开|r
    .isOnQuest 53342
step
    .goto 84,51.89,14.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 53342 >>交任务: |cRXP_FRIENDLY_熔火之心|r
    .accept 53352 >>接任务: |cRXP_WARN_火焰之地|r
    .target Moira Thaurissan
step
    .goto 84,51.89,14.07
    .gossipoption 48180 >>与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .target Moira Thaurissan
    .isOnQuest 53352
step
    .goto 1958,49.24,29.7
    >>|cRXP_WARN_ 等待短暂的角色扮演|r, 然后击杀|cRXP_ENEMY_ 黑铁教徒|r
    .scenario 3982,1
    .mob Dark Iron Cultist
    .isOnQuest 53352
step
    .goto 1958,49.2,25.47,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    >>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .isOnQuest 53352
step
    .goto 1959,50.82,67.4,5,0
    .goto 1959,48.71,62.17,10,0
    .goto 1959,50.69,59.05,10,0
    >>杀死沿途遇到的大多数敌人|r
    .scenario 3983,1,100
    .mob Blazing Elemental
    .mob Lava Spawn
    .mob Molten Giant
    .mob Flamewalker Sentinel
    .mob Ancient Core Hound
    .isOnQuest 53352
step
    .goto 1959,50.58,24.56,10 >>|cRXP_WARN_前往箭头指示的位置|r.
    .timer 60, Duration until continuation.
    .isOnQuest 53352
step
    .goto 1959,50.53,20.76
    >>击杀|cRXP_ENEMY_裁决者格里斯通|r
    .scenario 3986,1
    .mob High Justice Grimstone
    .isOnQuest 53352
step
    .goto 1959,50.53,20.76
    >>击杀|cRXP_ENEMY_裁决者格里斯通|r
    .scenario 3984,1
    .mob High Justice Grimstone
    .isOnQuest 53352
step
    .goto 1959,50.51,19.26
    >>站在熔岩气泡|cRXP_WARN_在巨大的熔岩池前面|r
    .scenario 3985,1,100
    .isOnQuest 53352
step
    #completewith next
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_点击此处获取一个宏, 通过在聊天中输入该宏即可退出队伍|r
    +|cRXP_WARN_你也可以通过其他标准方式离开|r
    .isOnQuest 53352
step
    .goto 84,51.89,14.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 53352 >>交任务: |cRXP_FRIENDLY_火焰之地|r
    .accept 51474 >>接任务: |cRXP_WARN_烈焰铸就|r
    .target Moira Thaurissan
step
    .goto 84,51.89,14.07
    .gossipoption 48178 >>与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .target Moira Thaurissan
    .isOnQuest 51474
step
    .goto 1159,56.65,31.35
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击铁砧上的|cRXP_PICK_黄球|r|cRXP_WARN_
    .complete 51474,1 --1/1 Black Anvil repaired
step
    .goto 1159,57.19,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
    .turnin 51474 >>交任务: |cRXP_FRIENDLY_烈焰铸就|r
    .accept 53566 >>接任务: |cRXP_WARN_黑铁矮人|r
    .target Moira Thaurissan
step
    #completewith next
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_点击此处获取一个宏, 通过在聊天中输入该宏即可退出队伍|r
    +|cRXP_WARN_你也可以通过其他标准方式离开|r
    .isOnQuest 53566
step
    .goto 84,52.02,13.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 53566 >>交任务: |cRXP_FRIENDLY_黑铁矮人|r
    .target Aysa Cloudsinger
]])

--KulTiran
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name AD) 库尔提拉斯解锁
#displayname |cFF00CCFF4|r - 库尔提拉斯人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ae) 机械侏儒解锁

<< Alliance !KulTiran

step
    #completewith next
    .zone 84 >>前往|cRXP_WARN_to暴风城|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r在暴风城大使馆内交谈
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空精灵旗帜|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kul Tiran 旗帜|r
    .complete 50239,4 --1/1 Learn about the Kul Tirans
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mechagnome 旗帜|r
    .complete 50239,5 --1/1 Learn about the Mechagnomes
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_黑铁矮人旗帜|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_光铸德莱尼军旗|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 54706 >>接任务: |cRXP_WARN_库尔提拉斯制造|r
    .target Aysa Cloudsinger
step
    .goto 84,52.82,14.57,5,0
    .goto 84,49.35,86.91,5 >>前往法师塔
    .isOnQuest 54706
step
    .goto 84,48.83,86.9,5,0
    .goto 84,49.15,87.77,5 >>攀登|cRXP_WARN_螺旋楼梯|r
    .isOnQuest 54706
step
    .goto 84,48.75,88.07,3 >>穿过|cRXP_WARN_传送门|r
    .isOnQuest 54706
step
    .goto 84,46.77,89.79,5,0
    .goto 84,48.74,95.18
    .zone 1161 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Boralus 传送门|r
    .isOnQuest 54706
step
    .goto 1161,68.85,21.18,5,0
    .goto 1161,67.44,21.29,5,0
    .goto 1161,67.99,21.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyrus Crestfall|r交谈
    .skipgossip 122370,1
    .complete 54706,2 --1/1 Speak to Cyrus
    .target Cyrus Crestfall
step
    .goto 1161,67.99,21.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyrus Crestfall|r交谈
    .turnin 54706 >>交任务: |cRXP_FRIENDLY_库尔提拉斯制造|r
    .accept 55039 >>接任务: |cRXP_WARN_造船大师|r
    .target Cyrus Crestfall
step
    .goto 1161,67.95,22.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .skipgossip
    .complete 55039,1 --1/1 Letter from the Lord Admiral
    .target Lady Jaina Proudmoore
-- step
--     #completewith next
--     .goto 1161,67.09,23.33,5,0
--     .goto 1161,66.98,14.99
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与RXP_FRIENDLY_Joan Weber|r交谈, 如果你没有飞行路径, 可以直接飞过去
--     .fly Brennadam >>飞往布伦纳达姆
--     .target Joan Weber
step
    #completewith next
    .goto 1161,67.09,23.33,5 >>离开|cRXP_WARN_办公室|r
step
    .goto 942,59.39,70.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyrus Crestfall|r在|cRXP_WARN_布伦纳达姆|r内交谈
    .turnin 55039 >>交任务: |cRXP_FRIENDLY_造船大师|r
    .accept 55043 >>接任务: |cRXP_WARN_海上传说|r
    .target Cyrus Crestfall
step
    .goto 942,59.39,69.36
    .gossipoption 50031 >>与|cRXP_FRIENDLY_Talkative 布伦纳达姆市民 1|r谈话
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.61,68.62
    .gossipoption 50031 >>与|cRXP_FRIENDLY_Talkative 布伦纳达姆市民 2|r谈话
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.41,68.73
    .gossipoption 50031 >>与|cRXP_FRIENDLY_唠叨布伦纳达姆市民3|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.08,69.95
    .gossipoption 50031 >>与|cRXP_FRIENDLY_Talkative 布伦纳达姆市民 4|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.79,70.2
    .gossipoption 50031 >>与|cRXP_FRIENDLY_唠叨布伦纳达姆市民5|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.53,70.23
    .gossipoption 50031 >>与|cRXP_FRIENDLY_Talkative 布伦纳达姆市民 6|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.17,70.59
    .gossipoption 50031 >>与|cRXP_FRIENDLY_Talkative 布伦纳达姆市民 7|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.42,70.87
    .gossipoption 50031 >>与|cRXP_FRIENDLY_喋喋不休的布伦纳达姆市民8|r交谈
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.66,70.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Cyrus Crestfall|r 交谈, 地点在小屋内
    .turnin 55043 >>交任务: |cRXP_FRIENDLY_海上传说|r
    .accept 54708 >>接任务: |cRXP_WARN_牧场是我家|r
    .target Cyrus Crestfall
step
    .goto 942,49.95,50.03
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 54708,1 --1/1 Find the homestead
step
    .goto 942,49.94,50.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Sal Atwater|r 交谈, 位置在房屋前方
    .skipgossip
    .complete 54708,2 --1/1 Meet the shipwright
    .target Sal Atwater
step
    .goto 942,50.23,49.88
    >>|cRXP_WARN_前往箭头指示的位置|r |cRXP_WARN_在房屋内|r
    .complete 54708,3 --1/1 Meet the actual shipwright
    .timer 10, Shipwright RP
step
    .goto 942,50.41,49.87,5,0
    .goto 942,50.38,50.47
    .cast 291980 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_飓风|r|cRXP_WARN_[1]|r
    .isOnQuest 54721
step
    #loop
    .goto 942,50.39,50.71,5,0
    .goto 942,50.34,50.29,5,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_飓风|r|cRXP_WARN_[2]|r
    .complete 54721,1 --1/1 Hurricane saddled
    .isOnQuest 54721
step
    .goto 942,66.13,47.37
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|cRXP_FRIENDLY_Dorian Atwater|r互动
    .turnin 54721 >>交任务: |cRXP_FRIENDLY_宝刀已老|r
    .accept 54723 >>接任务: |cRXP_WARN_隐藏船只|r
    .accept 54725 >>接任务: |cRXP_WARN_深海幽灵|r
    .target Dorian Atwater
step
    #completewith Ward
    >>击杀|cRXP_ENEMY_Drowned Harbinger|r和|cRXP_ENEMY_Drowned Convert|r
    .complete 54725,1 --12/12 Drowned forces slain
    .mob Drowned Harbinger
    .mob Drowned Convert
    .mob Grasp of the Deep
step
    .goto 942,66.90,44.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_南部驱雾火盆|r
    .complete 54723,1 --1/1 Southern Fog Ward placed
step
    .goto 942,67.99,41.97
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_北部驱雾火盆|r
    .complete 54723,3 --1/1 Northern Fog Ward placed
step
    #label Ward
    .goto 942,65.91,43.50
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_西部驱雾火盆|r
    .complete 54723,2 --1/1 Western Fog Ward placed
step
    #loop
    .goto 942,65.92,44.97,40,0
    .goto 942,66.75,46.16,40,0
    .goto 942,67.36,44.13,40,0
    .goto 942,67.33,42.09,40,0
    .goto 942,66.52,40.17,40,0
    .goto 942,65.92,42.94,40,0
    >>击杀|cRXP_ENEMY_Drowned Harbinger|r和|cRXP_ENEMY_Drowned Convert|r
    .complete 54725,1 --12/12 Drowned forces slain
    .mob Drowned Harbinger
    .mob Drowned Convert
    .mob Grasp of the Deep
step
    .goto 942,66.09,47.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorian Atwater|r交谈
    .turnin 54723 >>交任务: |cRXP_FRIENDLY_隐藏船只|r
    .turnin 54725 >>交任务: |cRXP_FRIENDLY_深海幽灵|r
    .accept 54726 >>接任务: |cRXP_WARN_基础工作|r
    .target Dorian Atwater
step
    .goto 895,68.95,20.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于房屋底层的|cRXP_FRIENDLY_Dorian Atwater|r交谈. |cRXP_WARN_请注意, 在提交任务前可能会有一段简短的角色扮演环节|r
    .turnin 54726 >>交任务: |cRXP_FRIENDLY_基础工作|r
    .accept 54727 >>接任务: |cRXP_WARN_搬运小队|r
    .target Dorian Atwater
step
    .goto 895,68.73,19.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_重木材|r
    .complete 54727,1,1 --1/1 Follow Dorian to the drop point
step
    .goto 895,68.71,17.36
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_重木材|r
    .complete 54727,1,2 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.31,17.54
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_重木材|r
    .complete 54727,1,3 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.99,16.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_重木材|r
    .complete 54727,1,4 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.22,12.52
    >>|cRXP_WARN_跟随|cRXP_FRIENDLY_多里安|r并使用|T236188:0|t[求援](1)|cRXP_WARN_指示他击杀|r|cRXP_ENEMY_袭击者|r
    .complete 54727,2 --1/1 Follow Dorian to the drop point
    .timer 10,Short Roleplay
    .target Dorian Atwater
step
    .goto 895,67.10,12.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorian Atwater|r交谈
    .turnin 54727 >>交任务: |cRXP_FRIENDLY_搬运小队|r
    .accept 54728 >>接任务: |cRXP_WARN_闹鬼木料|r
    .accept 54729 >>接任务: |cRXP_WARN_黯丘矿洞|r
    .target Dorian Atwater
step
    .goto 896,33.17,30.37
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 54729,1 --1/1 Find Chelsea Wright
step
    .goto 896,33.17,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_切尔西·赖特|r交谈
    .turnin 54729 >>交任务: |cRXP_FRIENDLY_黯丘矿洞|r
    .accept 54732 >>接任务: |cRXP_WARN_快松口！|r
    .target Chelsea Wright
step
    .goto 896,34.19,30.47,10,0
    .goto 896,34.52,29.77,10,0
    .goto 896,35.9,30.32,10,0
    .goto 896,36.65,29.98,10,0
    .goto 896,36.60,28.88,5 >>|cRXP_WARN_跟随|cRXP_ENEMY_Wicker Beast|r|cRXP_WARN_进入洞穴内|r
    .timer 3,Short Roleplay
    .mob Wicker Beast
    .target Wicker Beast
    .isOnQuest 54732
step
    .goto 896,36.6,28.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击地面上的|cRXP_PICK_仓库钥匙|r
    .complete 54732,1 --1/1 Storehouse Key
step
    .goto 896,36.62,28.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wicker Beast|r交谈
    .turnin 54732 >>交任务: |cRXP_FRIENDLY_快松口！|r
    .accept 55136 >>接任务: |cRXP_WARN_柳魔忠犬|r
    .target Wicker Beast
step
    .goto 896,35.31,28.90
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_啃过的骨头|r|cRXP_WARN_
    .complete 55136,3 --1/1 Gnawed Bone
step
    .goto 896,35.99,30.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Worn Collar|r|cRXP_WARN_around a tree branch|r
    .complete 55136,1 --1/1 Worn Collar
step
    .goto 896,34.19,30.81,8,0
    .goto 896,34.60,30.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Worn Collar|r|cRXP_WARN_inside a house|r
    .complete 55136,2 --1/1 Squeaky Toy
step
    .goto 896,33.17,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_切尔西·赖特|r交谈
    .turnin 55136 >>交任务: |cRXP_FRIENDLY_柳魔忠犬|r
    .accept 54733 >>接任务: |cRXP_WARN_成功取货|r
    .target Chelsea Wright
step
    .goto 896,33.12,30.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Chest|r
    .turnin 54733 >>交任务: |cRXP_FRIENDLY_成功取货|r
step
    .goto 896,61.88,59.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thornspeaker Birchgrove|r交谈
    .turnin 54728 >>交任务: |cRXP_FRIENDLY_闹鬼木料|r
    .accept 54730 >>接任务: |cRXP_WARN_高莱克·图尔的影响|r
    .target Thornspeaker Birchgrove
step
    #loop
    .goto 896,60.44,62.23,40,0
    .goto 896,59.11,65.05,40,0
    .goto 896,62.43,63.31,40,0
    .goto 896,60.11,69.55,40,0
    >>击杀|cRXP_ENEMY_Vengeful Bones|r和|cRXP_ENEMY_Awoken Guardian|r. |cRXP_WARN_此外, 点击它们附近的石块将有助于你进一步填满你的德拉斯特容器|r
    .complete 54730,1 --1/1 Drust Vessel filled
    .mob Awoken Guardian
    .mob Vengeful Bones
step
    .goto 896,61.88,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thornspeaker Birchgrove|r交谈
    .turnin 54730 >>交任务: |cRXP_FRIENDLY_高莱克·图尔的影响|r
    .accept 54731 >>接任务: |cRXP_WARN_平衡存乎于万物|r
    .target Thornspeaker Birchgrove
step
    .goto 896,61.86,59.37
    .gossipoption 50185 >>与|cRXP_FRIENDLY_Arthur Tradewind|r交谈
    .timer 3, Short Roleplay
    .target Arthur Tradewind
    .isOnQuest 54731
step
    .goto 942,59.39,69.36
    .vehicle >>与|r互动
    .timer 107, Arthur Roleplay
    .isOnQuest 54731
step
    .goto 896,45.22,45.84
    .gossipoption 49067 >>与|cRXP_FRIENDLY_Ulfar|r交谈
    .timer 8, Short Roleplay
    .target Ulfar
    .isOnQuest 54731
step
    .goto 896,44.97,45.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Nut|r
    .complete 54731,2 --1/1 Begin the ritual
step
    .goto 896,44.97,45.83
    >>收集绿色法球并击杀|cRXP_ENEMY_Drust 显现|r
    .complete 54731,3 --1/1 Balance restored
    .mob Drust Manifestation
step
    .goto 896,45.18,45.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ulfar|r交谈
    .turnin 54731 >>交任务: |cRXP_FRIENDLY_平衡存乎于万物|r
step
    .goto 896,45.43,45.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bound Sky|r交谈
    .accept 54734 >>接任务: |cRXP_WARN_多利安的召唤|r
    .target Bound Sky
step
    .goto 942,66.51,44.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorian Atwater|r交谈
    .turnin 54734 >>交任务: |cRXP_FRIENDLY_多利安的召唤|r
    .target Dorian Atwater
step
    .goto 942,66.5,44.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .accept 54735 >>接任务: |cRXP_WARN_杰出船员|r
    .target Lady Jaina Proudmoore
step
    .goto 1161,43.00,56.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔恩德·普罗德摩尔|r交谈
    .skipgossip
    .complete 54735,1 --1/1 Speak to Tandred Proudmoore
    .target Tandred Proudmoore
step
    .goto 1161,75.94,22.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兄弟派克|r交谈
    .skipgossip
    .complete 54735,2 --1/1 Brother Pike recruited
    .target Brother Pike
step
    .goto 895,56.68,61.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔伦福尔中尉|r交谈
    .skipgossip
    .complete 54735,3 --1/1 Lieutenant Tarenfold recruited
    .target Lieutenant Tarenfold
step
    .goto 895,35.26,24.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_.罗莎琳·麦迪逊|r交谈
    .skipgossip
    .complete 54735,4 --1/1 Outriggers recruited
    .target Rosaline Madison
step
    .goto 942,67.62,44.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorian Atwater|r交谈
    .skipgossip
    .complete 54735,5 --1/1 Boatswain recruited
    .target Dorian Atwater
step
    .goto 942,67.62,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 54735 >>交任务: |cRXP_FRIENDLY_杰出船员|r
    .accept 54851 >>接任务: |cRXP_WARN_海潮祝福|r
    .target Lady Jaina Proudmoore
step
    .goto 942,67.62,44.68
    .gossipoption 50743 >>|cRXP_WARN_等待剧情推进 and then|r与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .target Lady Jaina Proudmoore
    .isOnQuest 54851
step
    .goto 942,68.16,45.63
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Boat|r
    >>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 54851,2 --1/1 Vessel blessed
step
    .goto 942,71.13,44.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 54851 >>交任务: |cRXP_FRIENDLY_海潮祝福|r
    .accept 53720 >>接任务: |cRXP_WARN_库尔提拉斯的效忠|r
    .target Lady Jaina Proudmoore
step
    .goto 942,71.18,44.03

    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_方向盘|r
    .complete 53720,1 --1/1 Sail to Stormwind Harbor
step
    .goto 84,22.53,18.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .turnin 53720 >>交任务: |cRXP_FRIENDLY_库尔提拉斯的效忠|r
    .target Anduin Wrynn
]])

--Mechagnome
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name ae) 机械侏儒解锁
#displayname |cFF00CCFF5|r - 机械侏儒 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next a) 虚空精灵解锁

<< Alliance !Mechagnome

step
    #completewith next
    .zone 84 >>前往|cRXP_WARN_to暴风城|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r在暴风城大使馆内交谈
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空精灵旗帜|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kul Tiran 旗帜|r
    .complete 50239,4 --1/1 Learn about the Kul Tirans
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mechagnome 旗帜|r
    .complete 50239,5 --1/1 Learn about the Mechagnomes
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_黑铁矮人旗帜|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_光铸德莱尼军旗|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 58214 >>接任务: |cRXP_WARN_紧急支援|r
    .target Aysa Cloudsinger
step
    .goto 84,52.82,14.57,5,0
    .goto 84,49.35,86.91,5 >>前往法师塔
step
    .goto 84,48.83,86.9,5,0
    .goto 84,49.15,87.77,5, >>登上螺旋楼梯
step
    .goto 84,48.83,86.9,5,0
    .goto 84,49.15,87.77,5, >>登上螺旋楼梯
step
    .goto 84,48.75,88.07,3 >>穿过|cRXP_WARN_传送门|r
step
    .goto 84,46.77,89.79,5,0
    .goto 84,48.74,95.18
    .zone 1161 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Boralus 传送门|r
step
    .goto 1161,70.32,18.08,5,0
    .goto 1161,73.15,16.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔希·钢烁|r交谈
    .turnin 58214 >>交任务: |cRXP_FRIENDLY_紧急支援|r
    .accept 57486 >>接任务: |cRXP_WARN_衰弱的能量|r
    .target Kelsey Steelspark
step
    .goto 1161,36.91,62.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔希·钢烁|r交谈
    .turnin 57486 >>交任务: |cRXP_FRIENDLY_衰弱的能量|r
    .accept 57487 >>接任务: |cRXP_WARN_寻求帮助|r
    .target Kelsey Steelspark
step
    .goto 1161,49.50,40.16
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Homing Copter|r
    .complete 57487,1 --1/1 Homing Copter acquired
    .target Homing Copter
step
    .goto 1161,36.73,62.63
    .cast 316417 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Mekkatorgue的逃生舱|r
    .target Mekkatorgue's Escape Pod
step
    .goto 1161,36.85,63.48
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57487,2 --1/1 Escape Pod sent to Mechagon
    .target Homing Copter
step
    .goto 1161,36.85,63.48
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Homing Copter|r
    .complete 57487,3 --1/1 Ride the Homing Copter to Mechagon
    .timer 128, Duration until continuation.
step
    .goto 1462,74.12,37.02
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57487,4 --1/1 Prince Erazmin met
step
    .goto 1462,74.12,37.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王子埃拉兹敏|r交谈
    .turnin 57487 >>交任务: |cRXP_FRIENDLY_寻求帮助|r
    .target Prince Erazmin
step
    .goto 1462,72.64,43.16,10,0
    .goto 1462,70.57,46.87,10,0
    .goto 1462,67.97,44.26,10,0
    .goto 1462,66.34,46.73,10,0
    .goto 1462,74.89,51.51
    >>击杀|cRXP_ENEMY_Malfunctioning Scrapbot|r和|cRXP_ENEMY_Malfunctioning Scraphound|r, 并从它们身上搜取 [|cRXP_LOOT_Acquisitioned Machine Part|r]
    .complete 57488,2 --6/6 Acquisitioned Machine Part
    .mob Malfunctioning Scrapbot
    .mob Malfunctioning Scraphound
step
    .goto 1462,73.61,58.36,10,0
    .goto 1462,73.36,61.51,10,0
    .goto 1462,69.93,58.88
    >>击杀|cRXP_ENEMY_凝固油|r. |cRXP_WARN_必要时, 你也可以击杀|cRXP_ENEMY_淤泥元素|r, 并从它们身上获取 [|cRXP_LOOT_采集的机械零件|r]
    .mob Slime Elemental
    .mob Congealed Oil
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Waren Gearhart|r和|r|cRXP_FRIENDLY_Prince Erazmin|r交谈
    .turnin 57488 >>交任务: |cRXP_FRIENDLY_当前结构图|r
    .goto 1462,73.13,33.33
    .accept 57490 >>接任务: |cRXP_WARN_安全航行|r
    .goto 1462,73.03,33.42
    .target Waren Gearhart
    .target Prince Erazmin
step
    .goto 1462,63.03,37.91
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57490,1 --1/1 Piston and crew activated
step
    .goto 1462,86.92,73.79
    >>击杀|cRXP_ENEMY_Rust-Eye 聪明的|r
    .complete 57490,2 --1/1 Rust-Eye the Clever slain
    .mob Rust-Eye the Clever
step
    .goto 1462,86.92,73.79
    >>从他身上搜刮 [|cRXP_LOOT_Pod|r]
    .complete 57490,3 --1/1 Pod retrieved
step
    .goto 1462,73.12,33.33
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57490,4 --1/1 Pod delivered
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Prince Erazmin|r和|cRXP_FRIENDLY_Christy Punchcog|r交谈
    .turnin 57490 >>交任务: |cRXP_FRIENDLY_安全航行|r
    .goto 1462,73.22,33.14
    .accept 57491 >>接任务: |cRXP_WARN_更好……更强……更安全|r
    .goto 1462,73.21,33.46
    .target Prince Erazmin
    .target Christy Punchcog
step
    .goto 1462,54.49,26.94
    >>击杀|cRXP_ENEMY_Insurgent Cycloid|r并从其身上获取 [|cRXP_LOOT_Omni Electromagnetic Amplifier|r]
    .complete 57491,2 --1/1 Omni Electromagnetic Amplifier
    .mob Insurgent Cycloid
step
    .goto 1462,37.46,46.05,10,0
    .goto 1462,36.79,58.83
    >>击杀|cRXP_ENEMY_HK-3 空中威慑单位|r并从其身上获取 [|cRXP_LOOT_神经加速器|r]
    .complete 57491,1 --1/1 Neural Accelerator
    .mob HK-3 Aerial Dissuasion Unit
step
    .goto 1462,52.79,51.86
    >>击杀|cRXP_ENEMY_Insurgent Crawler|和|cRXP_ENEMY_Upgraded Sentry|r并从它们身上搜刮 [|cRXP_LOOT_Flux Energized Servos|r]
    .complete 57491,3 --1/1 Flux Energized Servos
    .mob Upgraded Sentry
    .mob Insurgent Crawler#
step
    .goto 1462,73.53,31.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Christy Punchcog|r交谈
    .turnin 57491 >>交任务: |cRXP_FRIENDLY_更好……更强……更安全|r
    .target Christy Punchcog
step
    .goto 1462,73.02,33.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Christy Punchcog|r交谈
    .accept 57492 >>接任务: |cRXP_WARN_他？|r
    .target Prince Erazmin
step
    .goto 1462,70.56,31.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Elya Codepunch|r交谈
    .skipgossip
    .complete 57492,1 --1/1 Speak with Elya Codepunch
    .target Elya Codepunch
step
    .goto 1462,69.92,32.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Stuard Sharpsprocket|r交谈
    .skipgossip
    .complete 57492,6 --1/1 Speak with Stuard Sharpsprocket
    .target Stuard Sharpsprocket
step
    .goto 1462,71.28,34.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Elya Idee Quickcoil|r 交谈
    .skipgossip
    .complete 57492,2 --1/1 Speak with Idee Quickcoil
    .target Idee Quickcoil
step
    .goto 1462,72.09,38.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Quimby Sparklighter|r交谈
    .skipgossip
    .complete 57492,4 --1/1 Speak with Quimby Sparklighter
    .target Quimby Sparklighter
step
    .goto 1462,75.45,36.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Flouresce Brightgear|r交谈
    .skipgossip
    .complete 57492,5 --1/1 Speak with Flouresce Brightgear
    .target Flouresce Brightgear
step
    .goto 1462,74.31,34.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pegi Cogsterh|r交谈
    .skipgossip
    .complete 57492,3 --1/1 Speak with Pegi Cogster
    .target Pegi Cogster
step
    .goto 1462,73.02,33.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王子埃拉兹敏|r交谈
    .turnin 57492 >>交任务: |cRXP_FRIENDLY_他？|r
    .target Prince Erazmin
step
    .goto 1462,73.51,31.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Christy Punchcog|r交谈
    .accept 57493 >>接任务: |cRXP_WARN_精神协调|r
    .target Christy Punchcog
step
    .goto 1462,73.62,32.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Synchroscope|r
    .complete 57493,1 --1/1 Initiate synchronization
    .timer 20,Duration until continuation.
step
    .goto 1462,73.57,32.1
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57493,2 --1/1 Synchronization complete
step
    .goto 1462,73.57,32.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Escape Pod|r
    .complete 57493,3 --1/1 Open the escape pod
step
    .goto 1462,73.51,31.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Christy Punchcog|r交谈
    .turnin 57493 >>交任务: |cRXP_FRIENDLY_精神协调|r
    .accept 57494 >>接任务: |cRXP_WARN_勇敢的心|r
    .target Christy Punchcog
step
    .goto 1462,58.8,56.7
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57494,1 --1/1 Find Kelsey
step
    .goto 1462,59.38,55.99
    >>击杀|cRXP_ENEMY_迪菲亚叛军 线圈持有者|r
    .complete 57494,2 --1/1 Insurgent Coilbearer slain
    .mob Insurgent Coilbearer
    .mob Insurgent Machinist
step
    .goto 1462,73.60,32.13
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57494,3 --1/1 Unit retrieved
step
    .goto 1462,73.60,32.13
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Spark 反应堆|r
    .complete 57494,4 --1/1 Spark Reactor delivered
    .timer 10, Duration until continuation.
step
    .goto 1462,73.71,31.85
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57494,5 --1/1 Circuit calibrated
step
    .goto 1462,73.71,31.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Generator|r
    .complete 57494,6 --1/1 Generator activated
step
    .goto 1462,73.56,32.08
    .cast 311518 >>|cRXP_WARN_请使用|r|T136099:0|t[额外动作按钮]靠近|cRXP_FRIENDLY_格尔宾·麦卡托克|r|cRXP_WARN_对他进行电击复律|r
    .target Gelbin Mekkatorque
    .timer 5, Duration until continuation.
step
    .goto 1462,73.02,33.43
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57494,7 --1/1 Defibrillate
    .timer 5, Duration until continuation.
step
    .goto 1462,73.04,33.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王子埃拉兹敏|r交谈
    .turnin 57494 >>交任务: |cRXP_FRIENDLY_勇敢的心|r
    .target Prince Erazmin
step
    .goto 1462,73.07,33.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔宾·麦卡托克|r交谈
    .accept 57496 >>接任务: |cRXP_WARN_晋升|r
    .target Gelbin Mekkatorque
step
    .goto 1462,72.34,31.15
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57496,1 --1/1 Take teleporter to Mechagon City
step
    .goto 1573,56.24,70.68,10,0
    .goto 1573,65.93,47.95
    .complete 57496,2 --1/1 Blastatron X-81 slain
    .mob Mechagon Trooper
    .mob Defense Bot Mk I
    .mob Blastatron X-81
step
    .goto 1573,58.02,41.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔宾·麦卡托克|r交谈
    .turnin 57496 >>交任务: |cRXP_FRIENDLY_晋升|r
    .accept 57495 >>接任务: |cRXP_WARN_麦卡贡的未来|r
    .target Gelbin Mekkatorque
step
    .goto 1573,31.37,85.80
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57495,1 --1/1 Teleport to the High Tinkertory
step
    .goto 1573,36.15,70.98,5,0
    .goto 1573,35.63,55.12,5,0
    .goto 1573,27.8,57.3,5 >>进入国王的房间|r
step
    .goto 1573,18.66,67.47
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57495,2 --1/1 Speech witnessed
step
    .goto 1573,18.65,67.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔宾·麦卡托克|r交谈
    .turnin 57495 >>交任务: |cRXP_FRIENDLY_麦卡贡的未来|r
    .target Gelbin Mekkatorque
step
    .goto 1573,18.66,66.14,5,0
    .goto 1573,17.82,65.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔希·钢烁|r交谈
    .target Kelsey Steelspark
step
    .goto 1573,20.41,59.95
    >>|cRXP_WARN_前往箭头指示的位置|r.
    .complete 57497,1 --1/1 前往: |cRXP_PICK_暴风城|r
step
    .goto 84,52.05,13.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 57497 >>交任务: |cRXP_FRIENDLY_传播消息|r
    .target Aysa Cloudsinger
]])

-----------------------------------------------------
--- HORDE
-----------------------------------------------------

--夜之子
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name a) 夜之子解锁
#displayname |cFF00CCFF1|r - 夜之子 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AB) 高山牛头人解锁

<< Horde !夜之子

step
    #completewith 夜之子StartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与旗帜互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label 夜之子StartQuestline
    .goto 85,37.65,81.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 49973 >>接任务: |cRXP_WARN_塔莉萨的庄园|r
    .target Ji Firepaw
step << Mage
    #completewith 夜之子ThalyssraEstate
    .train 224869,3
    .cast 224869 >>使用传送:达拉然 - 破碎的伊尔瑟斯
step
    #completewith 夜之子ThalyssraEstate
    .goto 85,53.38,90.45,10,0
    .goto 85,58.90,89.51
    .zone 630 >>通过传送门前往阿苏纳
step
    #label 夜之子ThalyssraEstate
    .goto 680,65.88,63.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女伯爵莉亚德琳|r交谈
    *|cRXP_WARN_按“ESC”键跳过即将播放的过场动画|r
    .turnin 49973 >>交任务: |cRXP_FRIENDLY_塔莉萨的庄园|r
    .accept 49613 >>接任务: |cRXP_WARN_银月城|r
    .target Lady Liadrin
step << Mage
    .isOnQuest 49613
    #completewith 夜之子ThalyssraEstate
    .train 32272,3
    .cast 32272 >>使用传送:银月城
step
    .isOnQuest 49613
    .zoneskip 110
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .goto 680,65.88,63.71
    .zone 85 >>使用协同披风
step
    .isOnQuest 49613
    #completewith next
    .zoneskip 110
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .isOnQuest 49613
    .zoneskip 110
    .goto 627,55.27,23.93
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .zoneskip 85,1
    .goto 85,56.02,88.25
    .zone 110 >>通过到银月城的传送门
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to
    *|cRXP_WARN_按“ESC”键跳过即将播放的过场动画|r
    .goto 110,58.11,19.87
    .turnin 49613 >>交任务: |cRXP_FRIENDLY_银月城|r
    .accept 49354 >>接任务: |cRXP_WARN_记住太阳之井的耻辱|r
    .target Lady Liadrin
step
    #sticky
    #label 夜之子RemembertheSunwell
    >>完成“记住太阳之井”剧情任务
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
    >>前往标记位置. 等待RP
    .scenario 3583,1
    .goto 973,49.27,67.10
step
    .isOnQuest 49354
    >>击杀|cRXP_ENEMY_Void Effusions|r和|cRXP_ENEMY_Creeping Void|r
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
    >>击杀|cRXP_ENEMY_Aruun the Darkener|r
    .goto 973,49.51,66.10
    .scenario 3585,1
    .mob Aruun the Darkener
step
    .isOnQuest 49354
    >>前往标记位置. 等待RP
    .goto 973,62.80,66.16
    .scenario 3663,1 --1/1 Void rift closed
step
    .isOnQuest 49354
    #completewith 夜之子RemembertheSunwell
    >>使用|cRXP_PICK_银月城转运器|r
    .goto 973,62.58,66.94
    .scenario 3586,1 --1/1 Leave the Sunwell
step
    #requires 夜之子RemembertheSunwell
    .goto 110,58.44,19.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女伯爵莉亚德琳|r交谈
    .turnin 49354 >>交任务: |cRXP_FRIENDLY_记住太阳之井的耻辱|r
    .accept 49614 >>接任务: |cRXP_WARN_夜之子|r
    .target Lady Liadrin
step << Mage
    .isOnQuest 49614
    #completewith 夜之子The夜之子
    .zoneskip 85
    .goto 110,58.44,19.13
    .cast 3567>>使用传送:奥格瑞玛
step
    .isOnQuest 49614
    #completewith next
    .zoneskip 85
    .itemcount 140192,1
    .cooldown item,140192,>0,1
    .goto 680,65.88,63.71
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
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
    .zone 18 >>使用传送宝珠
step
    #completewith next
    .goto 18,60.74,58.68
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r on top of the tower. |cRXP_WARN_You may have to talk to Zidormi (speech bubble on the map) to get to the correct phase|r.
step
    #label 夜之子The夜之子
    .goto 85,37.76,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49614 >>交任务: |cRXP_FRIENDLY_夜之子|r
    .target Ji Firepaw
step
    .isQuestTurnedIn 49614
    +恭喜！你已解锁夜之子！
]])

--HighmountainTauren
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name AB) 高山牛头人解锁
#displayname |cFF00CCFF2|r - 至高岭牛头人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AC) 马格哈尔兽人解锁

<< Horde !HighmountainTauren

step
    #completewith HighmountainStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与旗帜互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label HighmountainStartQuestline
    .isQuestTurnedIn 50242
    .goto 85,37.65,81.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bain Bloodhoof|r交谈
    .turnin 48066>>交出《亲族的盛宴》
    .target Bain Bloodhoof
step
    .isQuestTurnedIn 48066
    .goto 88,61.52,51.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bain Bloodhoof|r交谈(短暂剧情对话后)
    .accept 48067 >>接任务: |cRXP_WARN_雷霆崖的阴影|r
    .target Bain Bloodhoof
step
    >>击杀|cRXP_ENEMY_黑暗触须|r或|cRXP_ENEMY_乌尔的阴影|r
    .goto 88,56.02,48.32,25,0
    .goto 88,49.64,50.90,25,0
    .goto 88,49.82,36.89,25,0
    .goto 88,42.96,57.80,25,0
    .goto 88,38.18,53.12
    .complete 48067,1 --4/4 Dark Tendril slain
    .complete 48067,2 --12/12 Shadow of Uul slain
step
    .goto 88,42.18,57.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你旁边的|cRXP_FRIENDLY_Bain Bloodhoof|r交谈
    .turnin 48066>>提交“雷霆崖之暗影”
    .accept 49756 >>接任务: |cRXP_WARN_黑暗之力|r
    .target Bain Bloodhoof
step
    >>击杀|cRXP_ENEMY_Qy'telek|r
    .goto 88,41.76,59.89
    .complete 49756,1 --1/1 Qy'telek slain
step
    .goto 88,42.18,57.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bain Bloodhoof|r交谈
    .turnin 49756 >>交任务: |cRXP_FRIENDLY_黑暗之力|r
    .accept 48079 >>接任务: |cRXP_WARN_返回至高岭|r
    .target Bain Bloodhoof
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mayla Highmountain|r交谈
    .turnin 48079 >>交任务: |cRXP_FRIENDLY_返回至高岭|r
    .target Mayla Highmountain
step
    .goto 652,68.49,73.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .accept 41884 >>接任务: |cRXP_WARN_黑暗传说|r
    .target Spiritwalker Graysky
step
    .goto 650,38.51,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在河湾与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .turnin 41884 >>交任务: |cRXP_FRIENDLY_黑暗传说|r
    .accept 41764 >>接任务: |cRXP_WARN_前人的脚步|r
    .target Spiritwalker Graysky
step
    .goto 650,38.53,69.18
    >>与视像之水互动
    .complete 41764,1 --1/1 Water of Vision used
step
    >>击杀|cRXP_ENEMY_黑影潜伏者|r和|cRXP_ENEMY_乌尔之影|r. 返回
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
    >>将碧石守卫放置在楼上
    .goto 650,44.23,75.17,15,0
    .goto 650,45.21,76.24,20,0
    .goto 650,46.29,74.35,20,0
    .goto 650,46.16,73.68
    .complete 41764,4 --1/1 Bitestone Ward placed
step
    .goto 650,38.51,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .turnin 41764 >>交任务: |cRXP_FRIENDLY_前人的脚步|r
    .accept 48185 >>接任务: |cRXP_WARN_圣墓的阴影|r
    .target Spiritwalker Graysky
step
    .goto 650,57.02,46.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .turnin 48185 >>交任务: |cRXP_FRIENDLY_圣墓的阴影|r
    .accept 41799 >>接任务: |cRXP_WARN_黑暗爪牙|r
    .target Spiritwalker Graysky
step
    .goto 650,57.05,46.16
    >>与视像之水互动
    .complete 41799,1 --1/1 Water of Vision used
step
    >>击杀|cRXP_ENEMY_Dark Spirits|r
    >>当你周围有多个怪物时, 使用 |T132312:0|t[凤凰之怒] (1) 或 |T1029585:0|t[魔法涡流] (2)
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
    .goto 650,54.98,44.11,10 >>进入洞窟
step
    >>击杀|cRXP_ENEMY_阴影触须|r
    >>垃圾邮件 |T132312:0|t[凤凰之怒] (1)
    .goto 650,54.43,43.16,15,0
    .goto 650,55.07,41.90
    .complete 41799,3 --6/6 Shadowy Tendril slain
    .mob Shadowy Tendril
step
    >>击杀黑暗之影|r
    >>保持3层|T132312:0|t[凤凰之怒](1)的dot效果, 并在冷却完毕时使用|T1029585:0|t[旋风漩涡](2)
    .complete 41799,4 --1/1 Shadow of the Darkness slain
    .goto 650,55.47,40.99
    .mob Shadow of the Darkness
step
    >>放置墓穴符文
    .complete 41799,5 --1/1 Sepulcher Ward placed
    .goto 650,54.74,40.63
step
    .goto 650,57.02,46.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .turnin 41799 >>交任务: |cRXP_FRIENDLY_黑暗爪牙|r
    .accept 48190 >>接任务: |cRXP_WARN_胡恩的高岭|r
    .target Spiritwalker Graysky
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往雪盲台地与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .goto 650,53.33,64.01
    .turnin 48190 >>交任务: |cRXP_FRIENDLY_胡恩的高岭|r
    .accept 41800 >>接任务: |cRXP_WARN_黑暗之王的仆从|r
    .target Spiritwalker Graysky
step
    .goto 650,53.32,64.00
    >>与|r|cRXP_FRIENDLY_Spiritwalker Graysky|r互动
    .complete 41800,1 --1/1 Water of Vision used
step
    >>击杀|cRXP_ENEMY_Necrotic Defilers|r
    >>在 |T134174:0|t[戈尔冲锋] (3) 冷却时使用, 并频繁施放 |T644382:0|t[狂野劈击] (1)
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
    >>击杀|cRXP_ENEMY_Necrogg the Darkspear|r. 他正在山下巡逻
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者格雷斯凯|r交谈
    .turnin 41800 >>交任务: |cRXP_FRIENDLY_黑暗之王的仆从|r
    .accept 48434 >>接任务: |cRXP_WARN_黑角怎么样了？|r
    .target Spiritwalker Graysky
step
    #completewith next
    .goto 750,49.30,46.09,5 >>乘坐电梯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spiritwalker Ebonhorn|r和|cRXP_FRIENDLY_Mayla Highmountain|r交谈
    .turnin 48434 >>交任务: |cRXP_FRIENDLY_黑角怎么样了？|r
    .goto 652,67.69,71.39
    .accept 41815 >>接任务: |cRXP_WARN_亡黯的诅咒|r
    .goto 652,68.85,71.08
    .target Spiritwalker Ebonhorn
    .target Mayla Highmountain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与山顶上的 |cRXP_FRIENDLY_贝恩·血蹄|r 和 |cRXP_FRIENDLY_贾勒·河man|r 交谈
    .turnin 41815 >>交任务: |cRXP_FRIENDLY_亡黯的诅咒|r
    .accept 41840 >>接任务: |cRXP_WARN_冰与影|r
    .goto 650,56.49,89.23
    .accept 41882 >>接任务: |cRXP_WARN_黑暗低语|r
    .goto 650,56.45,89.33
    .target Baine Bloodhoof
    .target Jale Rivermane
step
    #completewith HighmountainTaurenWhispersoftheDarkness
    >>击杀|cRXP_ENEMY_Necrodarks|r或|cRXP_ENEMY_Frozen Mists|r. 击败后可拾取 [|cRXP_LOOT_Shadowice Shards|r]
    .complete 41840,1 --20/20 Shadowice Shard
step
    #title Protector freed 1/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,56.92,89.68
    .complete 41882,1,1 --1/6 Highmountain Protector freed
step
    #title Protector freed 2/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,56.83,88.47
    .complete 41882,1,2 --2/6 Highmountain Protector freed
step
    #title Protector freed 3/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,57.49,88.95
    .complete 41882,1,3 --3/6 Highmountain Protector freed
step
    #title Protector freed 4/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,57.36,90.01
    .complete 41882,1,4 --4/6 Highmountain Protector freed
step
    #title Protector freed 5/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,58.16,90.67
    .complete 41882,1,5 --5/6 Highmountain Protector freed
step
    #label HighmountainTaurenWhispersoftheDarkness
    #title Protector freed 6/6
    >>解救|cRXP_FRIENDLY_Highmountain Protector|r|cRXP_WARN_他们可能会攻击你|r
    .goto 650,57.61,91.11
    .complete 41882,1 --6/6 Highmountain Protector freed
step
    >>击杀|cRXP_ENEMY_Necrodarks|r或|cRXP_ENEMY_Frozen Mists|r. 击败后可拾取 [|cRXP_LOOT_Shadowice Shards|r]
    >>|cRXP_WARN_|cRXP_ENEMY_Frozen Mists|r是最佳来源|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者黑角|r交谈
    .turnin 41840 >>交任务: |cRXP_FRIENDLY_冰与影|r
    .turnin 41882 >>交任务: |cRXP_FRIENDLY_黑暗低语|r
    .accept 41841 >>接任务: |cRXP_WARN_最后的结界|r
    .target Spiritwalker Ebonhorn
step
    #completewith next
    .goto 650,57.28,92.23,10 >>进入洞窟
step
    >>放置巅峰守护符
    .goto 650,56.50,91.45
    .complete 41841,1 --1/1 放置巅峰守护符
step
    .goto 650,56.82,92.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者黑角|r交谈
    .turnin 41841 >>交任务: |cRXP_FRIENDLY_最后的结界|r
    .accept 48403 >>接任务: |cRXP_WARN_黑暗之兽|r
    .target Spiritwalker Ebonhorn
step
    #completewith next
    .goto 650,57.28,92.23,10 >>离开洞穴
step
    >>击杀|cRXP_ENEMY_Uul'gyneth|r. |cRXP_WARN_你可以拾取贝恩斯图腾并投掷它|r
    .goto 650,57.94,90.84
    .complete 48403,1 --1/1 Uul'gyneth slain
    .mob Uul'gyneth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伊拉·高岭和贝恩·血蹄|r交谈
    .turnin 48403 >>交任务: |cRXP_FRIENDLY_黑暗之兽|r
    .goto 650,56.66,92.71
    .accept 48433 >>接任务: |cRXP_WARN_团结是部落的力量！|r
    .goto 650,56.70,92.77
    .target Mayla Highmountain
    .target Baine Bloodhoof
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .goto 85,37.78,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 48433 >>交任务: |cRXP_FRIENDLY_团结是部落的力量！|r
    .target Ji Firepaw
step
    .isQuestTurnedIn 48433
    +恭喜！你已解锁高岭牛头人！
]])

--MagharOrc
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name AC) 马格哈尔兽人解锁
#displayname |cFF00CCFF3|r - 玛格汉兽人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ad) 赞达拉巨魔 解锁

<< Horde !MagharOrc

step
    #completewith MagharOrcStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在奥格瑞玛找|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与旗帜互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label MagharOrcStartQuestline
    .goto 85,37.77,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 53466 >>接任务: |cRXP_WARN_时光之眼|r
    .target Ji Firepaw
step
    #completewith next
    #title 通过传送门前往祖达萨
    .goto 85,53.46,90.42,10,0
    .goto 85,58.56,91.31
    .zone 1163 >>通过传送门前往祖达萨
step
    .goto 1163,67.03,73.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首领泰勒曼瑟·奥库莱斯|r交谈
    .turnin 53466 >>交任务: |cRXP_FRIENDLY_时光之眼|r
    .accept 53467 >>接任务: |cRXP_WARN_时光之穴|r
    .target Chief Telemancer Oculeth
step
    #completewith next
    #title 前往: |cRXP_PICK_奥格瑞玛|r
    .goto 1163,73.83,69.92
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    #completewith next
    #title 前往楼下时光之穴的传送门
    .goto 85,54.78,89.74,7,0
    .goto 85,54.64,87.12,7,0
    .goto 85,56.02,86.85,7,0
    .goto 85,56.41,92.56
    .zone 74 >>前往楼下时光之穴的传送门
step
    .goto 74,66.05,28.47,20,0
    .goto 74,61.50,16.78,20,0
    .goto 74,65.75,26.35,20,0
    .goto 74,66.66,16.11,20,0
    .goto 74,50.46,19.50,30,0
    .goto 74,39.19,50.42,30,0
    .goto 75,41.74,49.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t沿着路径往下走. 与|cRXP_FRIENDLY_阿纳克洛斯|r交谈
    .turnin 53467 >>交任务: |cRXP_FRIENDLY_时光之穴|r
    .accept 53354 >>接任务: |cRXP_WARN_古尔丹的回响|r
    .target Anachronos
step << Mage
    .isOnQuest 53354
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .isOnQuest 53354
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .isOnQuest 53354
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .zoneskip 627,1
    .isOnQuest 53354
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .zoneskip 85
    .isOnQuest 53354
    #completewith next
    .goto 74,39.19,50.42,30,0
    .goto 74,50.46,19.50,30,0
    .goto 74,66.66,16.11,20,0
    .goto 74,65.75,26.35,20,0
    .goto 74,61.50,16.78,20,0
    .goto 74,66.05,28.47,20,0
    .goto 74,58.17,26.73
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 53354
    #completewith next
    .goto 85,53.20,90.46,10,0
    .goto 85,52.69,52.84
    .zone 50 >>前往: |cRXP_PICK_荆棘谷|r
step
    >>Fly to the Time Rift and |TInterface/cursor/crosshair/interact.blp:20|tClick on it. Kill the |cRXP_ENEMY_Echo of Gul'dan|r.
    >>躲避液态地狱火. 侧身闪避邪能涌流. 打断死亡缠绕
    .goto 17,54.42,50.49
    .complete 53354,1 --1/1 Echo of Gul'dan slain
    .mob Echo of Gul'dan
step
    .goto 17,54.40,50.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿纳克洛斯|r交谈
    .turnin 53354 >>交任务: |cRXP_FRIENDLY_古尔丹的回响|r
    .accept 53353 >>接任务: |cRXP_WARN_督军扎伊拉的回响|r
    .target Anachronos
step
    #completewith next
    #title 前往: |cRXP_PICK_奥格瑞玛|r
    .goto 17,72.65,49.50
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    #completewith next
    #title Take the Portal to Jade Forest
    .goto 85,55.90,86.85,8,0
    .goto 85,54.53,87.12,8,0
    .goto 85,54.79,90.18,8,0
    .goto 85,57.47,92.26
    .zone 371 >>向上走. 通过传送门前往翡翠林
step
    >>Fly to the Time Rift and |TInterface/cursor/crosshair/interact.blp:20|tClick on it. Kill the |cRXP_ENEMY_Echo of Warlord Zaela|r.
    .goto 379,68.60,46.08,15,0
    .goto 379,68.80,43.69
    .complete 53353,1 --1/1 Echo of Warlord Zaela slain
    .mob Echo of Warlord Zaela
step
    .goto 379,68.90,43.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿纳克洛斯|r交谈
    .turnin 53353 >>交任务: |cRXP_FRIENDLY_督军扎伊拉的回响|r
    .accept 53355 >>接任务: |cRXP_WARN_加尔鲁什·地狱咆哮的回响|r
    .target Anachronos
step << Mage
    .isOnQuest 53355
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .isOnQuest 53355
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .isOnQuest 53355
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .zoneskip 627,1
    .isOnQuest 53355
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .zoneskip 85
    .isOnQuest 53355
    #completewith next
    .goto 371,28.52,14.02
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_杜隆塔尔|r. 与|cRXP_FRIENDLY_阿纳克洛斯|r交谈
    .goto 1,40.80,16.36
    .skipgossip
    .complete 53355,1 --1/1 Meet Anachronos outside Orgrimmar
    .target Anachronos
step
    >>(No arrow possible) 跳下去. |TInterface/cursor/crosshair/interact.blp:20|tClick on the Time Rift. Kill the |cRXP_ENEMY_Echo of Garrosh Hellscream|r.
    >>在他释放旋风期间远离. 躲避铁星(战争机器施放)
    .complete 53355,2 --1/1 Echo of Garrosh Hellscream slain
    .mob Echo of Garrosh Hellscream
step
    #completewith next
    #title 通过传送门前往祖达萨
    >>Leave the instance group (Right-|TInterface/cursor/crosshair/interact.blp:20|tClick your character frame)
    .goto 85,53.44,90.45,10,0
    .goto 85,58.59,91.32
    .zone 1163 >>通过传送门前往祖达萨
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Chief Telemancer Oculeth|r和|cRXP_FRIENDLY_伊崔格|r交谈
    .turnin 53355 >>交任务: |cRXP_FRIENDLY_加尔鲁什·地狱咆哮的回响|r
    .goto 1163,72.00,65.50
    .accept 52942 >>接任务: |cRXP_WARN_重修旧好|r
    .goto 1163,70.33,69.75
    .target Chief Telemancer Oculeth
    .target Eitrigg
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首领泰勒曼瑟·奥库莱斯|r交谈
    .complete 52942,1 --1/1 Speak with Oculeth to go to Draenor
    .goto 1163,72.00,65.50
    .skipgossip 131443,1
    .target Chief Telemancer Oculeth
step
    >>过桥. 你可能需要等待一个随机事件(RP)
    .goto 1170,44.07,55.07,20,0
    .goto 1170,44.87,53.20
    .complete 52942,2 --Meet the Overlord
step
    .goto 1170,44.94,53.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊崔格|r 交谈
    .turnin 52942 >>交任务: |cRXP_FRIENDLY_重修旧好|r
    .accept 52943 >>接任务: |cRXP_WARN_呼唤氏族|r
    .target Eitrigg
step
    >>|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Blackrock banner|r. Relog if you can't |TInterface/cursor/crosshair/interact.blp:20|tClick on it
    .goto 1170,45.17,52.64
    .complete 52943,1 --1/1 Blackrock
step
    >>|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Blackrock banner|r. Relog if you can't |TInterface/cursor/crosshair/interact.blp:20|tClick on it
    .goto 1170,45.48,51.94
    .complete 52943,2 --1/1 Warsong
step
    >>|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Blackrock banner|r. Relog if you can't |TInterface/cursor/crosshair/interact.blp:20|tClick on it
    .goto 1170,44.82,52.00
    .complete 52943,3 --1/1 Frostwolf
step
    .goto 1170,45.14,52.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 52943 >>交任务: |cRXP_FRIENDLY_呼唤氏族|r
    .target Overlord Geya'rah
step
    .goto 1170,45.26,52.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_格罗姆·地狱咆哮|r交谈
    .accept 52945 >>接任务: |cRXP_WARN_战铸盟约|r
    .target Grommash Hellscream
step
    >>击杀|cRXP_ENEMY_Kor'gall叛逃者|r和|cRXP_ENEMY_Kor'gall煽动者|r
    .goto 1170,40.23,65.14,25,0
    .goto 1170,39.10,65.72,25,0
    .goto 1170,38.81,67.47,25,0
    .goto 1170,38.25,67.48,25,0
    .goto 1170,37.73,68.32
    .complete 52945,1 --10/10 Kor'gall Defector slain
    .mob Kor'gall Defector
    .mob Kor'gall Agitator
step
    >>在短暂的RP之后, 击杀|cRXP_ENEMY_Kor'gall, Greatson of Kor'gall|r
    >>避开猛烈的撞击. 闪避巨石
    .goto 1170,36.80,68.06,15,0
    .goto 1170,36.26,68.70,10,0
    .goto 1170,36.49,70.06
    .complete 52945,2 --1/1 Kor'gall, Greatson of Kor'gall slain
    .mob Kor'gall, Greatson of Kor'gall
step
    .goto 1170,36.48,70.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 52945 >>交任务: |cRXP_FRIENDLY_战铸盟约|r
    .accept 52955 >>接任务: |cRXP_WARN_光缚的暴行|r
    .target Overlord Geya'rah
step
    #sticky
    #label MagharOrcTyrannyoftheLight
    .goto 1170,44.13,69.99,0,0
    .complete 52955,1 --"Tyranny of the Light" scenario completed
step
    #completewith next
    .goto 1170,38.59,67.38,10 >>离开洞穴
step
    .isOnQuest 52955
    >>跟随箭头前往野兽岗哨
    .goto 1170,41.39,66.92,20,0
    .goto 1170,43.02,67.09,30,0
    .goto 1170,43.89,69.46
    .scenario 3973,1
step
    .isOnQuest 52955
    >>摧毁|cRXP_ENEMY_Lightbound Batteries|r并击杀|cRXP_ENEMY_Lighbounds|r
    .goto 1170,44.76,75.62,15,0
    .goto 1170,45.18,76.10,15,0
    .goto 1170,45.94,74.77,15,0
    .goto 1170,46.00,75.66,25,0
    .goto 1170,44.04,75.25,25,0
    .goto 1170,45.22,73.85,25,0
    .goto 1170,45.17,74.45
    .mob Lightbound Battery
    .scenario 3974,1
step
    .isOnQuest 52955
    >>跟随箭头前往|cRXP_ENEMY_大主教欧雷里斯|r
    .goto 1170,45.49,78.58
    .scenario 3975,1
step
    .isOnQuest 52955
    >>击杀|cRXP_ENEMY_大主教欧雷里斯|r
    >>侧身躲避普罗米修斯射线, 打断圣光
    .goto 1170,45.26,80.33
    .scenario 3976,1
    .mob Exarch Orelis
step
    .isOnQuest 52955
    >>跑回兽人守卫处, 与|r格罗玛什·地狱咆哮|r会面
    .goto 1170,44.55,71.37
    .scenario 3977,1
    .timer 55,Order RP
step
    .isOnQuest 52955
    >>等待角色扮演
    .goto 1170,43.89,70.89
    .scenario 3980,1
step
    .isOnQuest 52955
    >>爬上塔楼, 登上玛格哈炮塔. 在冷却时间结束后使用 |T879998:0|t[铁光使者](2), 否则持续施放 |T252185:0|t[炮塔轰击] 以击杀来袭的怪物
    .goto 1170,43.48,71.38,10,0
    .goto 1170,43.63,71.48
    .scenario 3978,1
step
    .isOnQuest 52955
    >>跳下去. 跑到酋长那里. 等待剧情演出
    .goto 1170,44.55,71.37
    .scenario 3981,1
step
    .isOnQuest 52955
    >>跟随箭头指引
    .goto 1170,44.13,69.99
    .scenario 3979,1
step
    #requires MagharOrcTyrannyoftheLight
    .goto 1,41.25,16.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 52955 >>交任务: |cRXP_FRIENDLY_光缚的暴行|r
    .accept 51479 >>接任务: |cRXP_WARN_纯净者|r
    .target Overlord Geya'rah
step
    .goto 85,38.64,80.07,12,0
    .goto 85,37.78,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 51479 >>交任务: |cRXP_FRIENDLY_纯净者|r
    .target Ji Firepaw
step
    .isQuestTurnedIn 57448
    +恭喜！你已解锁玛格汉兽人！
]])

--ZandalariTroll
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name ad) 赞达拉巨魔 解锁
#displayname |cFF00CCFF4|r - 赞达拉巨魔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ae) 狼人解锁

<< Horde !ZandalariTroll

step
    #completewith ZandalariTrollStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与旗帜互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label ZandalariTrollStartQuestline
    .goto 85,37.75,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 53831 >>接任务: |cRXP_WARN_皇家盛典|r
    .target Ji Firepaw
step
    .isOnQuest 53831
    #completewith next
    .goto 85,53.40,90.43,10,0
    .goto 85,58.48,91.26
    .complete 53831,1 --1/1 Use the portal to Zuldazar (Optional)
step
    >>跟随箭头指引
    .goto 1163,48.94,29.53
    .complete 53831,2 --1/1 Meet the Zandalari emissary
step
    .goto 1163,48.53,21.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Natal'hakata|r交谈
    .turnin 53831 >>交任务: |cRXP_FRIENDLY_皇家盛典|r
    .accept 53823 >>接任务: |cRXP_WARN_女王随行|r
    .target Natal'hakata
step << !DemonHunter !Dracthyr
    #completewith next
    .noflyable 862
    .goto 1165,48.51,38.00,15,0
    .goto 1165,45.15,47.02,20,0
    .goto 1165,42.06,26.50,20 >>小心跳下金字塔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_高级大祭司拉塔|r交谈
    .turnin 53823 >>交任务: |cRXP_FRIENDLY_女王随行|r
    .goto 1165,42.58,22.81
    .accept 53824 >>接任务: |cRXP_WARN_王者加冕|r
    .goto 1165,42.58,22.53
    .target Princess Talanji
    .target High Prelate Rata
step
    >>骑乘|cRXP_FRIENDLY_Ceremonial Warbeast|r
    .goto 1165,42.51,23.26
    .complete 53824,1 --1/1 Ride the Ceremonial Warbeast
    .timer 76,Ride RP
step
    >>等待角色扮演
    .goto 1165,39.83,12.82
    .complete 53824,2 --1/1 Ride in procession with Talanji
step
    .goto 1165,40.28,12.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级教士拉塔|r交谈
    .turnin 53824 >>交任务: |cRXP_FRIENDLY_王者加冕|r
    .timer 9,Zolani RP
    .target High Prelate Rata
step
    .goto 1165,40.28,12.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zolani|r交谈
    .accept 53826 >>接任务: |cRXP_WARN_我们之间的煽动者|r
    .accept 54419 >>接任务: |cRXP_WARN_镇压暴乱|r
    .target Zolani
step
    #completewith next
    >>击败|cRXP_ENEMY_Rioting Speakers|r
    .complete 54419,1 --12/12 Rioters subdued
    .mob Rioting Speaker
step
    >>跳下去. 击败|cRXP_ENEMY_Enforcer Malzon|r
    .goto 1165,36.72,10.43,12,0
    .goto 1165,37.29,10.46
    .complete 53826,1 --1/1 Enforcer Malzon confronted
    .mob Enforcer Malzon
step
    >>击败|cRXP_ENEMY_暴动演说者|r, 或与|cRXP_ENEMY_骚乱广场的德鲁格斯|r交谈
    .goto 1165,36.17,7.69,20,0
    .goto 1165,34.96,10.72,20,0
    .goto 1165,36.49,15.16,20,0
    .goto 1165,39.96,20.07,20,0
#loop
	.line 1165,36.17,7.69,34.96,10.72,36.49,15.16,39.96,20.07
	.goto 1165,36.17,7.69,22,0
	.goto 1165,34.96,10.72,22,0
	.goto 1165,36.49,15.16,22,0
	.goto 1165,39.96,20.07,22,0
    .skipgossip 147781,1
    .complete 54419,1 --12/12 Rioters subdued
    .mob Rioting Speaker
    .mob Rioting Zocalo Druges
step
    #completewith next
    .noflyable 862
    .goto 1165,42.61,22.91,12,0
    .goto 1165,41.41,18.05,12 >>返回上层
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_大主教拉塔|r和|cRXP_FRIENDLY_佐兰尼|r交谈
    .turnin 53826 >>交任务: |cRXP_FRIENDLY_我们之间的煽动者|r
    .turnin 54419 >>交任务: |cRXP_FRIENDLY_镇压暴乱|r
    .accept 54301 >>接任务: |cRXP_WARN_塔兰吉的仁慈|r
    .goto 1165,40.51,11.91
    .accept 54925 >>接任务: |cRXP_WARN_[Heresy!]|r
    .goto 1165,40.17,11.91
    .accept 54300 >>接任务: |cRXP_WARN_违背信仰|r
    .goto 1165,40.49,12.41
    .target Princess Talanji
    .target High Prelate Rata
    .target Zolani
step
    #completewith ZandalariTrollHeresy
    >>击败|cRXP_ENEMY_狂怒的拉塔里德鲁伊|r和|cRXP_ENEMY_暴怒的拉斯塔里大祭司|r
    .complete 54300,1 --12/12 Angered faithful subdued
    .mob Furious Raptari Druid
    .mob Incensed Rastari Prelate
step
    #completewith ZandalariTrollHeresy
    >>疏散|cRXP_FRIENDLY_阿昆达牧师|r
    .complete 54301,1 --10/10 Innocent bystanders evacuated
step
    #label ZandalariTrollHeresy
    >>击杀|cRXP_ENEMY_Prelate Kaj'ra|r
    .groundgoto 1165,45.50,19.77,20,0
    .goto 1165,50.72,16.60,20,0
    .goto 1165,50.86,11.01,20,0
    .goto 1165,50.72,16.60,20,0
    .goto 1165,50.86,11.01,20,0
    .goto 1165,50.84,13.63
    .complete 54925,1 --1/1 Prelate Kaj'ra slain
    .mob Prelate Kaj'ra
step
    >>击败|cRXP_ENEMY_狂怒的拉塔里德鲁伊|r和|cRXP_ENEMY_暴怒的拉斯塔里大祭司|r
    >>撤离牧师
    .goto 1165,52.00,11.87,20,0
    .goto 1165,49.21,14.52,15,0
    .goto 1165,50.31,7.20,20,0
    .goto 1165,49.08,11.45,20,0
    .goto 1165,49.07,15.55,20,0
    .goto 1165,50.49,19.18,20,0
    .complete 54300,1 --12/12 Angered faithful subdued
    .complete 54301,1 --10/10 Innocent bystanders evacuated
    .mob Furious Raptari Druid
    .mob Incensed Rastari Prelate
    .target Priest of Akunda
    .target Priest of Krag'wa
    .target Raptari Druid
    .target Balina
step
    .groundgoto 1165,41.81,17.15,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级大祭司拉塔|r和|cRXP_FRIENDLY_佐拉尼|r和|cRXP_FRIENDLY_塔兰吉公主|r交谈
    .turnin 54925 >>交任务: |cRXP_FRIENDLY_[Heresy!]|r
    .goto 1165,40.49,11.85
    .turnin 54300 >>交任务: |cRXP_FRIENDLY_违背信仰|r
    .goto 1165,40.43,11.95
    .turnin 54301 >>交任务: |cRXP_FRIENDLY_塔兰吉的仁慈|r
    .accept 53825 >>接任务: |cRXP_WARN_[The New Zanchuli Council]|r
    .goto 1165,40.56,11.97
    .target High Prelate Rata
    .target Zolani
    .target Princess Talanji
step
    #completewith next
    .goto 1167,46.53,40.27,10,0
    .goto 1167,37.33,24.93,10,0
    .goto 1167,45.02,15.53,10,0
    .goto 1166,56.09,44.27,20 >>进入金字塔
step
    >>跟随箭头指引
    .goto 1166,61.24,38.93
    .complete 53825,1 --1/1 Meet the new Zanchuli Council
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守望德鲁伊洛蒂|r和|cRXP_FRIENDLY_拉什克|r和|cRXP_FRIENDLY_乔诺克|r和|cRXP_FRIENDLY_拉凯拉将军|r以及|cRXP_FRIENDLY_拉尔魔君|r交谈
    .complete 53825,2 --1/1 Greet Wardruid Loti
    .goto 1166,63.05,24.49
    .complete 53825,3 --1/1 Greet Lash
    .goto 1166,64.62,26.47
    .complete 53825,4 --1/1 Greet Jo'nok
    .goto 1166,67.02,31.67
    .complete 53825,5 --1/1 Greet General Rakera
    .goto 1166,68.44,34.00
    .complete 53825,5 --1/1 Greet Hexlord Raal
    .goto 1166,69.73,36.00
    .target Wardruid Loti
    .target Lashk
    .target Jo'nok, Bulwark of Torcall
    .target General Rakera
    .target Hexlord Raal
step
    .goto 1166,60.47,38.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 53825 >>交任务: |cRXP_FRIENDLY_[The New Zanchuli Council]|r
    .accept 53827 >>接任务: |cRXP_WARN_议会已经表态|r
    .timer 56,Blessing RP
    .target Princess Talanji
step
    >>等待角色扮演
    .goto 1166,60.47,38.75
    .complete 53827,1 --1/1 Zanchuli blessing given
step
    >>击杀|cRXP_ENEMY_Widow's Eyes|r
    .goto 1166,60.47,38.75
    .complete 53827,2 --1/1 Survive the ambush
    .mob Widow's Eyes
step
    >>击杀|cRXP_ENEMY_Samara|r
    .goto 1166,65.16,33.13
    .complete 53827,3 --1/1 Samara slain
    .mob Samara
step
    .goto 1166,60.48,38.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 53827 >>交任务: |cRXP_FRIENDLY_议会已经表态|r
    .accept 53828 >>接任务: |cRXP_WARN_神灵的注视|r
    .target Princess Talanji
step
    #completewith ZandalariTrollGazeoftheLoa
    .goto 1166,65.29,68.73,10,0
    .goto 1166,78.84,85.80,10,0
    .goto 1165,44.57,14.38
    .zone 1165 >>沿箭头指示离开金字塔
step
    .goto 1165,44.57,14.38
    .complete 53828,1 --1/1 Follow Talanji
step
    #label ZandalariTrollGazeoftheLoa
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_Krag'wa巨兽|r交谈
    .turnin 53828 >>交任务: |cRXP_FRIENDLY_神灵的注视|r
    .goto 1165,44.57,14.38
    .accept 54031 >>接任务: |cRXP_WARN_[Gaze of the Loa: Krag'wa]|r
    .goto 1165,44.21,14.92
    .target Princess Talanji
    .target Krag'wa the Huge
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Krag'wa the Huge|r交谈
    .complete 54031,1 --1/1 Speak to Krag'wa
    .goto 1165,44.21,14.92
    .skipgossip 146208,1
    .timer 15,RP
    .target Krag'wa the Huge
step
    >>只要逃离那些攻击你的青蛙(使用[冲刺]技能), 然后等待|cRXP_FRIENDLY_公主塔兰吉|r击败它们即可
    .goto 1165,45.13,16.82
    .complete 54031,2 --1/1 Krag'wa's trial complete
step
    .goto 1165,44.25,14.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Krag'wa the Huge|r交谈
    .turnin 54031 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Krag'wa]|r
    .accept 54033 >>接任务: |cRXP_WARN_[Gaze of the Loa: Gonk]|r
    .target Krag'wa the Huge
step
    >>沿着箭头向上前往金字塔
    .groundgoto 1165,46.06,16.17,15,0
    .goto 1165,46.30,12.28
    .complete 54033,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gonk|r交谈
    .goto 1165,46.51,12.02
    .skipgossip 146214,1
    .complete 54033,2 --1/1 Speak to Gonk
    .timer 44,Gonk RP
    .target Gonk
step
    .goto 1165,46.51,12.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gonk|r交谈
    .turnin 54033 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Gonk]|r
    .accept 54032 >>接任务: |cRXP_WARN_[Gaze of the Loa: Pa'ku]|r
    .target Gonk
step
    >>沿着箭头向上前往金字塔
    .goto 1165,44.70,9.09
    .complete 54032,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕库|r交谈
    .goto 1165,44.58,8.89
    .skipgossip 146209,1
    .complete 54032,2 --1/1 Speak to Pa'ku
    .timer 44,Gonk RP
    .target Pa'ku
step
    >>躲避龙卷风, 然后跑回|r|cRXP_FRIENDLY_Pa'ku|r
    .goto 1165,44.58,8.89
    .complete 54032,3 --1/1 Pa'ku's trial complete
step
    .goto 1165,44.58,8.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕库|r交谈
    .turnin 54032 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Pa'ku]|r
    .accept 54034 >>接任务: |cRXP_WARN_[Gaze of the Loa: Bwonsamdi]|r
    .target Pa'ku
step
    >>跟随 |cRXP_FRIENDLY_公主塔兰吉|r
    .goto 1165,43.63,7.41
    .complete 54034,1 --1/1 Follow Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邦桑迪|r交谈
    .goto 1165,43.29,6.88
    .skipgossip 146215,1
    .timer 51,Bwonsamdi RP
    .complete 54034,2 --1/1 Speak to Bwonsamdi
    .timer 25,Talanji RP
step
    .goto 1165,42.73,8.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 54034 >>交任务: |cRXP_FRIENDLY_[Gaze of the Loa: Bwonsamdi]|r
    .accept 53830 >>接任务: |cRXP_WARN_[Queen of the Zandalari]|r
    .target Princess Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    *|cRXP_WARN_按“ESC”键跳过即将播放的过场动画|r
    .skipgossip 145359,1
    .goto 1165,42.73,8.73
    .complete 53830,1 --1/1 Witness Talanji's address
    .target Princess Talanji
step
    .goto 1165,42.41,9.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女王塔兰吉(Queen Talanji)|r交谈
    .turnin 53830 >>交任务: |cRXP_FRIENDLY_[Queen of the Zandalari]|r
    .accept 53719 >>接任务: |cRXP_WARN_[Allegiance of the Zandalari]|r
    .target Queen Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦娜斯·风行者|r交谈
    .goto 1165,41.41,10.62
    .complete 53719,1 --1/1 Talanji's invitation extended
    .target Lady Sylvanas Windrunner
step
    #completewith next
    .noflyable 862
    >>小心跳下去
    .goto 1165,46.06,16.57,15,0
    .goto 1165,47.06,19.23,15,0
    .goto 1165,47.55,23.59,15,0
    .goto 1165,53.14,19.35
    .fly The Great Seal >>飞往大符文封印
step
    #completewith ZandalariTrollAllegianceoftheZandalari
    .noflyable 862
    .isQuestTurnedIn 47436
    .isOnQuest 53719
    .vehicle 131154 >>|TInterface/cursor/crosshair/interact.blp:20|t点击帕库图腾
    .goto 1165,51.37,40.95
step
    #completewith ZandalariTrollAllegianceoftheZandalari
    .noflyable 862
    .isQuestTurnedIn 47443
    .isOnQuest 53719
    .goto 1165,49.93,42.24,10,0
    .goto 1164,37.75,71.70,10,0
    .goto 1164,20.56,72.09,5 >>乘坐电梯前往|cRXP_FRIENDLY_Queen Talanji|r
step
    #label ZandalariTrollAllegianceoftheZandalari
    .goto 1165,49.92,46.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|r希尔瓦娜斯·风行者|cRXP_FRIENDLY_交谈
    .turnin 53719 >>交任务: |cRXP_FRIENDLY_[Allegiance of the Zandalari]|r
    .target Lady Sylvanas Windrunner
step
    .isQuestTurnedIn 53719
    +恭喜！你已解锁赞达拉巨魔
]])

--Vulpera
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name ae) 狼人解锁
#displayname |cFF00CCFF5|r - 狐人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next a) 夜之子解锁

<< Horde !Vulpera

step
    #completewith VulperaStartQuestline
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .isOnQuest 49930
    .isQuestAvailable 49930
    .goto 85,53.23,90.47,10,0
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 49930 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .target Ji Firepaw
step
    .isQuestAvailable 50242
    .goto 85,37.76,81.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .accept 50242 >>接任务: |cRXP_WARN_选择盟友|r
    .target Ji Firepaw
step
    .isOnQuest 50242
    >>按任意顺序与旗帜互动
    .goto 85,37.65,81.43
    .complete 50242,1 -- Learn more about the 高岭牛头人
    .complete 50242,2 -- Learn more about the nightborne
    .complete 50242,3 -- Learn more about the 玛格汉兽人s
    .complete 50242,4 -- Learn more about the Zandalari trolls
    .complete 50242,5 -- Learn more about the Vulpera
step
    .isQuestComplete 50242
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 85,37.65,81.44
    .turnin 50242 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .target Ji Firepaw
step
    #label VulperaStartQuestline
    .goto 85,37.77,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与季·火掌交谈
    .accept 53870 >>接任务: |cRXP_WARN_格罗玛什要塞的来客|r
    .target Ji Firepaw
step
    #completewith next
    .goto 85,49.88,75.57,10 >>进入格罗玛什大厅
step
    .goto 85,48.90,72.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .turnin 53870 >>交任务: |cRXP_FRIENDLY_格罗玛什要塞的来客|r
    .accept 53889 >>接任务: |cRXP_WARN_意图宣言|r
    .target Kiro
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_基罗|r交谈
    .goto 85,48.89,72.74
    .turnin 53889 >>交任务: |cRXP_FRIENDLY_意图宣言|r
    .accept 53890 >>接任务: |cRXP_WARN_新盟友，新问题|r
    .target Kiro
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_指挥官德雷什|r和|cRXP_FRIENDLY_守护者索尼|r和|cRXP_FRIENDLY_第一秘术师萨莉丝拉|r交谈
    .complete 53890,1 --1/1 Commander Dresh questioned
    .goto 85,48.23,71.76
    .complete 53890,2 --1/1 Bladeguard Sonji questioned
    .goto 85,48.69,71.63
    .complete 53890,3 --1/1 First Arcanist Thalyssra questioned
    .goto 85,48.65,71.25
    .skipgossip
    .target Commander Dresh
    .target Bladeguard Sonji
    .target First Arcanist Thalyssra
step
    .goto 85,48.88,72.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .turnin 53890 >>交任务: |cRXP_FRIENDLY_新盟友，新问题|r
    .accept 53891 >>接任务: |cRXP_WARN_事无巨细|r
    .target Kiro
step
    #completewith next
    .goto 85,49.88,75.57,10 >>离开格罗玛什要塞
step
    .isOnQuest 53891
    .goto 85,50.22,39.46
    .zone 241 >>通过传送门前往暮光高地
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .goto 241,44.11,73.47
    .turnin 53891 >>交任务: |cRXP_FRIENDLY_事无巨细|r
    .accept 53892 >>接任务: |cRXP_WARN_工人去哪儿了？|r
    .target Kiro
step
    >>跟随箭头前往航点
    .goto 241,46.81,66.22
    .complete 53892,1 --1/1 Follow Kiro
    .target Kiro
step
    #completewith next
    .goto 241,46.62,65.95,8 >>进入房屋
step
    >>等待角色扮演
    .goto 241,46.05,65.60
    .complete 53892,2 --1/1 Peon Hideout investigated
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_粉碎者据点 苦工|r.交谈
    .goto 241,46.05,65.60
    .skipgossip
    .complete 53892,3 --3/3 Peons questioned
    .target Crushblow Peon
step
    #completewith next
    .goto 241,46.62,65.95,8 >>离开地窖
step
    .goto 241,46.81,66.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .turnin 53892 >>交任务: |cRXP_FRIENDLY_工人去哪儿了？|r
    .accept 53893 >>接任务: |cRXP_WARN_一点善意|r
    .accept 53894 >>接任务: |cRXP_WARN_必先利其器|r
    .accept 53895 >>接任务: |cRXP_WARN_苦工升职！|r
    .target Kiro
step
    #completewith next
    .goto 241,46.62,65.95,8 >>进入房屋
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_粉碎者据点 苦工|r.交谈
    .goto 241,46.09,65.59
    .skipgossip 1
    .complete 53895,1 --3/3 Peons promoted
    .target Crushblow Peon
step
    #completewith next
    .goto 241,46.62,65.95,8 >>离开地窖
step
    #completewith next
    >>从矿脉中拾取|cRXP_PICK_暮光矿石|r
    .complete 53894,1 --15/15 Twilight Ore
step
    >>在击杀该区域周围的|cRXP_ENEMY_beasts|r之前, 先使用 |T310733:0|t[增益图腾]. 击杀后, 可从它们身上获得 [|cRXP_LOOT_flanks|r]和[|cRXP_LOOT_meat|r] 和 [|cRXP_LOOT_tidbits|r] 这些战利品
    .goto 241,48.40,65.62,30,0
    .goto 241,46.62,63.33,30,0
    .goto 241,44.39,67.00,30,0
    .goto 241,45.34,67.78,30,0
    .goto 241,50.10,74.37,30,0
    .goto 241,53.75,71.69,30,0
#loop
	.line 241,48.40,65.62,46.62,63.33,44.39,67.00,45.34,67.78,50.10,74.37,53.75,71.69
	.goto 241,48.40,65.62,35,0
	.goto 241,46.62,63.33,35,0
	.goto 241,44.39,67.00,35,0
	.goto 241,45.34,67.78,35,0
	.goto 241,50.10,74.37,35,0
	.goto 241,53.75,71.69,35,0
    .complete 53893,1 --100/100 Saber Flank
    .complete 53893,2 --100/100 Worg Meat
    .complete 53893,3 --100/100 Clucker Tidbits
    .use 171356
    .mob Twilight Prowler
    .mob Highlands Clucker
step
    >>从矿脉中拾取|cRXP_PICK_暮光矿石|r
    .goto 241,51.13,68.58,30,0
    .goto 241,48.60,70.24,30,0
    .goto 241,46.42,72.89,30,0
#loop
	.line 241,51.13,68.58,48.60,70.24,46.42,72.89
	.goto 241,51.13,68.58,30,0
	.goto 241,48.60,70.24,30,0
	.goto 241,46.42,72.89,30,0
    .complete 53894,1 --15/15 Twilight Ore
step
    .goto 241,46.81,66.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .turnin 53893 >>交任务: |cRXP_FRIENDLY_一点善意|r
    .turnin 53894 >>交任务: |cRXP_FRIENDLY_必先利其器|r
    .turnin 53895 >>交任务: |cRXP_FRIENDLY_苦工升职！|r
    .accept 53897 >>接任务: |cRXP_WARN_犒劳宴|r
    .target Kiro
step
    #completewith next
    .goto 241,46.62,65.95,8 >>进入房屋
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头马格罗克|r交谈并击败他
    .goto 241,45.93,65.50
    .complete 53897,1 --1/1 Foreman Magrok invited
    .skipgossip
    .target Foreman Magrok
step
    #completewith next
    .goto 241,46.62,65.95,8 >>离开地窖
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .goto 241,45.04,76.24
    .turnin 53897 >>交任务: |cRXP_FRIENDLY_犒劳宴|r
    .accept 53898 >>接任务: |cRXP_WARN_力量与荣耀|r
    .target Kiro
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头马格罗克|r交谈并击败他
    .goto 241,45.67,76.42
    .complete 53898,1 --1/1 Foreman Magrok confronted
    .complete 53898,2 --1/1 Foreman Magrok defeated
    .skipgossip
    .target Foreman Magrok
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .goto 241,45.04,76.24
    .turnin 53898 >>交任务: |cRXP_FRIENDLY_力量与荣耀|r
    .accept 54026 >>接任务: |cRXP_WARN_完工了|r
    .target Kiro
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .isOnQuest 54026
    .zoneskip 85
    .goto 18,60.74,58.67
    .zone 85 >>前往: |cRXP_PICK_杜隆塔尔|r
step
    #completewith next
    .goto 85,49.88,75.57,10 >>进入格罗玛什大厅
step
    .goto 85,48.21,71.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官Dresh|r交谈
    .turnin 54026 >>交任务: |cRXP_FRIENDLY_完工了|r
    .target Commander Dresh
step
    .goto 85,49.02,73.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .accept 53899 >>接任务: |cRXP_WARN_郊外|r
    .target Kiro
step
    #completewith next
    .goto 85,49.88,75.57,10 >>离开格罗玛什要塞
step
    .isOnQuest 53899
    .goto 85,53.42,90.44,10,0
    .goto 85,58.55,91.31
    .zone 1163 >>通过传送门前往祖达萨
step
    #completewith VulperaOntheOutskirts
    .goto 1165,49.94,42.02,10 >>离开大封印
step
    #completewith next
    .noflyable 862
    .goto 1165,51.91,41.20
    .fly Seeker's Outpost >>飞往探路者前哨
step
    #label VulperaOntheOutskirts
    .goto 862,74.86,63.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nisha|r交谈
    .turnin 53899 >>交任务: |cRXP_FRIENDLY_郊外|r
    .accept 53901 >>接任务: |cRXP_WARN_爆炸总能奏效|r
    .accept 53900 >>接任务: |cRXP_WARN_借用武器|r
    .accept 58087 >>接任务: |cRXP_WARN_摧毁电源|r
    .target Nisha
step
    #completewith VulperaExplosionsAlwaysWork
    >>击杀|cRXP_ENEMY_纳泽希监察者|r或|cRXP_ENEMY_纳泽希风暴掌控者|r. 击败后搜刮他们的 [|cRXP_LOOT_武器|r]
    .complete 53900,1 --10/10 Nazeshi Weaponry collected
    .mob Nazeshi Tempest-Wielder
    .mob Nazeshi Overseer
step
    #title Powercell 1/3
    >>摧毁能量核心
    .goto 862,77.13,63.87
    .complete 58087,1,1 --1/3 Nazeshi Powercell destroyed
step
    #title Powercell 2/3
    >>摧毁能量核心
    .goto 862,75.64,64.94
    .complete 58087,1,2 --2/3 Nazeshi Powercell destroyed
step
    #title Powercell 3/3
    >>摧毁能量核心
    .goto 862,76.61,66.54
    .complete 58087,1 --3/3 Nazeshi Powercell destroyed
step
    #title Explosives placed 2/8
    >>将炸药放置在标记的地点
    .goto 862,75.73,67.67
    .complete 53901,1,2 --2/8 Explosives placed
step
    #title Explosives placed 4/8
    >>将炸药放置在标记的地点
    .goto 862,75.03,67.89
    .complete 53901,1,4 --4/8 Explosives placed
step
    #title Explosives placed 6/8
    >>将炸药放置在标记的地点
    .goto 862,74.31,67.83
    .complete 53901,1,6 --6/8 Explosives placed
step
    #label VulperaExplosionsAlwaysWork
    #title Explosives placed 8/8
    >>将炸药放置在标记的地点
    .goto 862,73.71,66.84
    .complete 53901,1 --8/8 Explosives placed
step
    >>击杀|cRXP_ENEMY_纳泽希监察者|r或|cRXP_ENEMY_纳泽希风暴掌控者|r. 击败后搜刮他们的 [|cRXP_LOOT_武器|r]
    .goto 862,74.18,65.41,20,0
    .goto 862,75.11,66.23,20,0
    .goto 862,76.92,66.23,25,0
    .goto 862,77.14,63.93,25,0
#loop
	.line 862,74.18,65.41,75.11,66.23,76.92,66.23,77.14,63.93
	.goto 862,74.18,65.41,30,0
	.goto 862,75.11,66.23,30,0
	.goto 862,76.92,66.23,30,0
	.goto 862,77.14,63.93,30,0
    .complete 53900,1 --10/10 Nazeshi Weaponry collected
    .mob Nazeshi Tempest-Wielder
    .mob Nazeshi Overseer
step
    >>使用你的[额外动作按钮]
    .goto 862,73.72,66.84
    .complete 53901,2 --1/1 Explosives detonated
step
    .goto 862,74.86,63.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nisha|r交谈
    .turnin 53901 >>交任务: |cRXP_FRIENDLY_爆炸总能奏效|r
    .turnin 53900 >>交任务: |cRXP_FRIENDLY_借用武器|r
    .turnin 58087 >>交任务: |cRXP_FRIENDLY_摧毁电源|r
    .accept 53902 >>接任务: |cRXP_WARN_解决唤潮者|r
    .target Nisha
step
    >>击杀|cRXP_ENEMY_Tidecaller Nezara|r. |cRXP_WARN_ 请注意躲避水爆(地面上的大蓝漩涡), 如果你等级为60级|r
    .goto 862,77.18,65.30
    .complete 53902,1 --1/1 Tidecaller Nezara slain
    .mob Tidecaller Nezara
step
    .goto 862,77.18,65.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你身旁的|cRXP_FRIENDLY_Nisha|r交谈
    .turnin 53902 >>交任务: |cRXP_FRIENDLY_解决唤潮者|r
    .accept 54027 >>接任务: |cRXP_WARN_威胁得到控制|r
    .target Nisha
step << Mage
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .zoneskip 85
    #completewith next
    .isOnQuest 54027
    .noflyable 862
    .goto 862,70.45,65.30
    .fly The Great Seal >>飞往大符文封印
step
    .zoneskip 85
    .isOnQuest 54027
    #completewith VulperaOntheOutskirts
    .goto 1165,49.94,42.02,10 >>进入大印
step
    .isOnQuest 54027
    .zoneskip 85
    .goto 1163,73.72,70.00
    .zone 85 >>前往: |cRXP_PICK_杜隆塔尔|r
step
    #completewith next
    .goto 85,49.88,75.57,10 >>进入格罗玛什大厅
step
    .goto 85,48.68,71.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与刀锋守护者桑吉交谈
    .turnin 54027 >>交任务: |cRXP_FRIENDLY_威胁得到控制|r
    .target Bladeguard Sonji
step
    .goto 85,49.02,73.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .accept 53903 >>接任务: |cRXP_WARN_找到米尔拉|r
    .target Kiro
step
    #completewith next
    .goto 85,49.88,75.57,10 >>离开格罗玛什要塞
step
    .isOnQuest 53899
    .goto 85,53.42,90.44,10,0
    .goto 85,58.86,89.52
    .zone 630 >>通过传送门前往阿苏纳
step
    .goto 680,58.94,55.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meerah|r交谈
    .turnin 53903 >>交任务: |cRXP_FRIENDLY_找到米尔拉|r
    .accept 53904 >>接任务: |cRXP_WARN_酿酒师的助手|r
    .target Meerah
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大老板米达|r交谈
    .goto 680,60.69,56.38
    .skipgossip
    .complete 53904,2 --1/1 Speak to Boss Mida
    .target Boss Mida
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Micah Broadhoof|r交谈
    .goto 680,61.22,55.15
    .complete 53904,1 --1/1 Speak to Micah Broadhoof
    .target Micah Broadhoof
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺米|r交谈
    .goto 680,62.42,57.64
    .complete 53904,3 --1/1 Speak to Nomi
    .target Nomi
step
    .goto 680,58.94,55.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meerah|r交谈
    .turnin 53904 >>交任务: |cRXP_FRIENDLY_酿酒师的助手|r
    .accept 53905 >>接任务: |cRXP_WARN_各展所长|r
    .target Meerah
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大老板米达|r交谈
    .goto 680,60.69,56.38
    .skipgossip 1
    .complete 53905,2 --1/1 Boss Mida assigned
    .target Boss Mida
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Micah Broadhoof|r交谈
    .goto 680,61.22,55.15
    .skipgossip 2
    .complete 53905,1 --1/1 Micah assigned
    .target Micah Broadhoof
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺米|r交谈
    .goto 680,62.42,57.65
    .skipgossip 1
    .complete 53905,3 --1/1 Nomi assigned
    .target Nomi
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Vintner Iltheux|r交谈
    .goto 680,58.79,55.43
    .complete 53905,4 --1/1 Vintner Iltheux informed
    .target Vintner Iltheux
step
    .goto 680,58.80,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meerah|r交谈
    .turnin 53905 >>交任务: |cRXP_FRIENDLY_各展所长|r
    .accept 54036 >>接任务: |cRXP_WARN_特别流程|r
    .target Meerah
step
    .goto 680,60.59,56.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺米|r交谈
    .turnin 54036 >>交任务: |cRXP_FRIENDLY_特别流程|r
    .accept 53906 >>接任务: |cRXP_WARN_给部落的佳酿|r
    .target Nomi
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大老板米达|r交谈, 并购买 10|cRXP_BUY_发酵火焰花|r
    .goto 680,61.36,55.36
    .complete 53906,2 --10/10 Fermented Firebloom
    .target Boss Mida
step
    >>击杀|cRXP_ENEMY_丝翼巨蛾|r. 击败它们获取 [|cRXP_LOOT_纤维|r]
    .goto 680,63.97,57.97,25,0
    .goto 680,62.87,59.77,25,0
    .goto 680,61.06,57.61,25,0
    .goto 680,62.03,55.66,25,0
#loop
	.line 680,63.97,57.97,62.87,59.77,61.06,57.61,62.03,55.66
	.goto 680,63.97,57.97,25,0
	.goto 680,62.87,59.77,25,0
	.goto 680,61.06,57.61,25,0
	.goto 680,62.03,55.66,25,0
    .complete 53906,1 --20/20 Silkwing Fibers
    .mob Tattered Silkwing
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺米|r交谈, 并与夜裔瓦特互动
    .turnin 53906 >>交任务: |cRXP_FRIENDLY_给部落的佳酿|r
    .accept 53907 >>接任务: |cRXP_WARN_品酒|r
    .goto 680,60.60,56.22
    .complete 53907,1 --1/1 Collect a sample
    .goto 680,60.59,56.34
    .target Nomi
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vintner Iltheux|r交谈并等待剧情发展
    .goto 680,58.79,55.42
    .skipgossip
    .complete 53907,2 --1/1 Deliver the sample to Vintner Iltheux
    .target Vintner Iltheux
step
    .goto 680,58.80,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meerah|r交谈
    .turnin 53907 >>交任务: |cRXP_FRIENDLY_品酒|r
    .accept 53908 >>接任务: |cRXP_WARN_等待归来|r
    .target Meerah
step << Mage
    .isOnQuest 53908
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .isOnQuest 53908
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .isOnQuest 53908
    .zoneskip 85
    .zone 627 >>如果你有达拉然炉石(在你的玩具箱里), 就使用它
step
    .isOnQuest 53908
    .zoneskip 85
    .goto 627,55.27,23.97
    .zone 85 >>使用达拉然的传送门前往奥格瑞玛
step
    #completewith next
    .goto 85,49.88,75.57,10 >>进入格罗玛什大厅
step
    .goto 85,48.31,71.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈并等待剧情发展
    .turnin 53908 >>交任务: |cRXP_FRIENDLY_等待归来|r
    .accept 57448 >>接任务: |cRXP_WARN_我们的新盟友|r
    .complete 57448,1 --1/1 Witness Baine welcome the vulpera to the Horde
    .target Baine Bloodhoof
step
    .goto 85,48.43,71.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基罗|r 交谈
    .turnin 57448 >>交任务: |cRXP_FRIENDLY_我们的新盟友|r
    .target Kiro
step
    .isQuestTurnedIn 57448
    +恭喜！你已解锁狐人！
]])

-- ============================================================
-- ================    HERITAGE ARMOR   =======================
-- ============================================================

-----------------------------------------------------
--- ALLIANCE
-----------------------------------------------------

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 收藏品
#subgroup 同盟种族
#name az
#displayname |cFFFCDC00传承护甲|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled


]])

--Human
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name b) 人类遗产护甲
#displayname |cFF1EFF001|r - 人类 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA) 矮人传承护甲

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 84 >>前往: |cRXP_PICK_暴风城|r
step
    .goto 84,54.47,20.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Render|r交谈
    .accept 75265 >>接任务: |cRXP_WARN_紧急军务|r
    .target Agent Render
step
    .goto 84,87.45,30.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈, 他在房子后面
    .turnin 75265 >>交任务: |cRXP_FRIENDLY_紧急军务|r
    .target Master Mathias Shaw
    .accept 72405 >>接任务: |cRXP_WARN_不寻常的线人|r
step
    .isOnQuest 72405
    .goto 37,43.06,65.68,10 >>进入狮子的尊严旅店
step
    .goto 37,43.22,66.09,5,0
    .goto 37,43.77,65.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒馆老板法雷尔|r交谈
    .home >>将你的[炉石]设置为狮子的尊严旅店
    .target Innkeeper Farlay
step
    .isOnQuest 72405
    .goto 37,44.05,66.07,5,0
    .goto 37,44.46,65.74,10 >>进入狮子的尊严旅店地下室
step
    .isOnQuest 72405
    .goto 37,44.34,66.21
    .gossipoption 107712 >>与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .timer 26,RP
    .target Master Mathias Shaw
step
    .goto 37,44.34,66.19
    >>|cRXP_WARN_请等待目标完成后继续
    .complete 72405,1 --1/1 Shaw talked to in the Lion's Pride Inn basement
step
    .goto 37,44.34,66.19
    >>|r|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .turnin 72405 >>交任务: |cRXP_FRIENDLY_不寻常的线人|r
    .target Master Mathias Shaw
    .accept 72408 >>接任务: |cRXP_WARN_往事如昨|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shaw|r交谈
    *|cFFFF0000After completing the objective, you can skip the cutscene by pressing 'Escape' and accepting the prompt.|r
    .complete 72408,1 --1/1 Speak with Shaw
    .skipgossip
    .target Shaw
step
    .goto 37,44.34,66.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .turnin 72408 >>交任务: |cRXP_FRIENDLY_往事如昨|r
    .target Vanessa VanCleef
    .accept 72409 >>接任务: |cRXP_WARN_陈腐的回忆|r
step
    .isOnQuest 72409
    .goto 37,44.46,65.74,10,0
    .goto 37,44.09,66.04,10,0
    .goto 37,43.16,65.95,10,0
    .goto 37,43.19,65.63,8,0
    .goto 37,42.86,65.63,8 >>离开狮子的尊严旅店地下室
step
    .goto 36,72.86,64.80
    -- .gossipoption 107725
    -- .gossipoption 107724
    -- .gossipoption 107723
    -- .gossipoption 107722
    -- .gossipoption 108338 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_狼狈不堪的约翰|r交谈
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_狼狈不堪的约翰|r交谈
    .complete 72409,1 --1/1 Speak to Ragged John
    .skipgossip 9563,1,1,1,1,2
    .target Ragged John
step
    .isOnQuest 72409
    .goto 36,61.99,65.07,10 >>进入洞穴
step
    .goto 36,61.76,66.76
    >>点击 |cRXP_PICK_Hoarded Debris.|r
    .complete 72409,2,1 --4/4 Chewed Piece of Journal
    .mob Vicious Ember Worg
step
    .goto 36,61.21,67.24
    >>点击 |cRXP_PICK_Hoarded Debris.|r
    .complete 72409,2,2 --4/4 Chewed Piece of Journal
    .mob Vicious Ember Worg
step
    .goto 36,60.24,66.23
    >>点击 |cRXP_PICK_Hoarded Debris.|r
    .complete 72409,2,3 --4/4 Chewed Piece of Journal
    .mob Vicious Ember Worg
step
    .goto 36,61.28,65.28
    >>点击 |cRXP_PICK_Hoarded Debris.|r
    .complete 72409,2,4 --4/4 Chewed Piece of Journal
    .mob Vicious Ember Worg
step
    .isOnQuest 72409
    .goto 36,61.99,65.07,10 >>离开洞穴
step
    .goto 36,72.84,64.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_狼狈不堪的约翰|r交谈
    .turnin 72409 >>交任务: |cRXP_FRIENDLY_陈腐的回忆|r
    .target Ragged John
    .accept 72424 >>接任务: |cRXP_WARN_点名搜索|r
step
    .isOnQuest 72424
    .goto 37,43.13,65.68,10,0
    .goto 37,43.2,66.1,10,0
    .goto 37,44.11,66.06,10,0
    .goto 37,44.46,65.74,10 >>进入狮子的尊严旅店地下室
step
    .goto 37,44.33,66.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .turnin 72424 >>交任务: |cRXP_FRIENDLY_点名搜索|r
    .target Master Mathias Shaw
    .accept 72426 >>接任务: |cRXP_WARN_克莱辛顿的新产业|r
step
    .isOnQuest 72426
    .goto 37,44.46,65.74,10,0
    .goto 37,44.09,66.04,10,0
    .goto 37,43.16,65.95,10,0
    .goto 37,43.19,65.63,8,0
    .goto 37,42.86,65.63,8 >>离开狮子的尊严旅店地下室
step
    #completewith next
    .goto 47,18.04,55.13,10 >>进入房屋
step
    .goto 47,17.45,55.22,10,0
    .goto 47,18.04,54.65,5,0
    .goto 47,18.06,54.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cecilia Clessington|r交谈
    .complete 72426,1 --1/1 Clessington Manor investigated
    .skipgossip 198912,1
    .target Cecilia Clessington
step
    #completewith escorted
    .goto 47,17.88,54.81,10,0
    .goto 47,17.54,54.72,10,0
    .goto 47,18.04,55.39,10 >>离开建筑
    *击杀|cRXP_ENEMY_Clessington 侍从|r
    .mob Clessington Attendant
step
    #completewith escorted
    .goto 47,18.34,54.63,5 >>跟随箭头指引
    *击杀|cRXP_ENEMY_Clessington 侍从|r
    .mob Clessington Attendant
step
    #label escorted
    .goto 47,18.35,55.07
    >>等待目标完成
    .complete 72426,2 --1/1 Cecilia escorted from the building
    .mob Clessington Attendant
    .target Cecilia Clessington
step
    .goto 47,18.35,55.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cecilia Clessington|r交谈
    .complete 72426,3 --1/1 Circumstances explained to Cecilia
    .skipgossip 198912,1
    .target Cecilia Clessington
step
    .goto 47,18.35,55.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cecilia Clessington|r交谈
    .turnin 72426 >>交任务: |cRXP_FRIENDLY_克莱辛顿的新产业|r
    .target Cecilia Clessington
step
    .goto 47,18.32,54.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .accept 72430 >>接任务: |cRXP_WARN_月溪镇的恶行|r
    .target Vanessa VanCleef
step
    .goto 52,46.72,66.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .turnin 72430 >>交任务: |cRXP_FRIENDLY_月溪镇的恶行|r
    .target Vanessa VanCleef
step
    .goto 52,46.72,66.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .accept 72431 >>接任务: |cRXP_WARN_[A Hungry Heritage]|r
    .target Vanessa VanCleef
step
    .goto 52,46.74,66.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cecilia Clessington|r交谈
    .accept 72432 >>接任务: |cRXP_WARN_[Supply Only the Finest Goons]|r
    .target Cecilia Clessington
step
    #completewith Count Clessington
    >>击杀|cRXP_ENEMY_Clessington 侍从|r
    .complete 72432,1 --16/16 Clessington Attendant slain
    .mob Clessington Attendant
step
    .goto 52,42.60,71.96
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72431,1 --1/1 Defias Hideout entered
step
    #label Count Clessington
    .isOnQuest 72431
    .goto 52,43.36,71.91,10,0
    .goto 52,42.78,72.6,10,0
    .goto 52,43.37,72.66,5,0
    .goto 52,43.65,72.81,10,0
    .goto 52,43.3,72.98,10,0
    .goto 55,69.27,22.87,10,0
    .goto 55,65.89,25.58,10 >>|cRXP_WARN_跟随箭头指引|r
step
    .isOnQuest 72431
    .goto 55,62.34,30.28,10 >>跳下
step
    .isOnQuest 72431
    .goto 55,49.56,42.05,10,0
    .goto 55,51.58,53.49,10,0
    .goto 55,58.03,58.81,10 >>|cRXP_WARN_跟随箭头指引|r
    .timer 60,RP
step
    #sticky
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72431,2 --1/1 Count Clessington found
step
    .goto 55,49.41,49.63,10,0
    .goto 55,50.94,41.01,10,0
    .goto 55,63.63,15.28,10,0
    .goto 55,59.69,18.33,10,0
    .goto 55,66.17,26.3,10,0
    .goto 55,70.24,21.8,10,0
    .goto 52,43.3,72.95,10,0
    .goto 52,43.36,72.72,5,0
    .goto 52,42.89,72.73,5,0
    .goto 52,42.98,71.73,10,0
    .goto 52,42.57,72.02,5 >>离开洞穴
step
    #sticky
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r|cRXP_WARN_就在你身边|r交谈
    .target Vanessa VanCleef
    .turnin 72431 >>交任务: |cRXP_FRIENDLY_[A Hungry Heritage]|r
step
    .goto 52,45.22,68.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .target Vanessa VanCleef
    .accept 72453 >>接任务: |cRXP_WARN_[Betrayal of the Brotherhood]|r
step
    #loop
    .goto 52,42.77,68.77,40,0
    .goto 52,45.62,68.77,40,0
    .goto 52,42.56,71.82,40,0
    >>击杀|cRXP_ENEMY_Clessington 侍从|r
    *|cRXP_WARN_You can use the|r [ExtraActionButton] to increase your movement speed.
    .complete 72432,1 --16/16 Clessington Attendant slain
    .mob Clessington Attendant
step
    #completewith next
    .goto 52,46.88,66.62,10 >>跟随箭头指引
    .timer 5, RP
step
    #title |cFFFCDC00跟随箭头指引|r
    *|cRXP_WARN_You can use the|r [ExtraActionButton] to increase your movement speed.
    .complete 72453,1 --1/1 Defias Hideout escaped
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r和|cRXP_FRIENDLY_塞西莉亚·克莱辛顿|r和|cRXP_FRIENDLY_马修斯·肖|r交谈
    .turnin 72453 >>交任务: |cRXP_FRIENDLY_[Betrayal of the Brotherhood]|r
    .goto 52,46.65,66.78
    .target +Vanessa VanCleef
    .turnin 72432 >>交任务: |cRXP_FRIENDLY_[Supply Only the Finest Goons]|r
    .goto 52,46.74,66.75
    .target +Cecilia Clessington
    .accept 72445 >>接任务: |cRXP_WARN_[To Northshire]|r
    .goto 52,46.72,66.71
    .target +Master Mathias Shaw
step
    #completewith next
    .hs >>传送至狮子的尊严旅店
step
    .goto 425,27.90,66.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .turnin 72445 >>交任务: |cRXP_FRIENDLY_[To Northshire]|r
    .target Master Mathias Shaw
    .accept 72449 >>接任务: |cRXP_WARN_[Knock It Off!]|r
step
    .goto 425,27.70,66.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .accept 72446 >>接任务: |cRXP_WARN_[What's Their Problem?]|r
    .target Marshal McBride
step
    #completewith Enforcer Horb's Signet
    >>击杀|cRXP_ENEMY_Defias|r和|cRXP_ENEMY_Confused Citizens|r和|cRXP_ENEMY_Clessington Attendant|r
    .complete 72446,1 --Northshire defended (100%)
    .mob Clessington Attendant
    .mob Confused Acolyte
    .mob Confused Commoner
    .mob Confused Recruit
    .mob Defias Bandit
    .mob Defias Mage
step
    .goto 425,35.61,61.23
    >>击杀|cRXP_ENEMY_Enforcer Grant.|r从其身上搜刮 [|cRXP_LOOT_Enforcer Grant's Signet|r]
    .complete 72449,1 --1/1 Enforcer Grant's Signet
    .mob Enforcer Grant
step
    .goto 425,49.52,62.61
    >>击杀 |cRXP_ENEMY_执行者珍妮芙|r, 击败她后可获得 [|cRXP_LOOT_执行者珍妮芙的徽记|r]
    .complete 72449,2 --1/1 Enforcer Jennive's Signet
    .mob Enforcer Jennive
step
    .goto 425,35.32,39.05
    >>击杀 |cRXP_ENEMY_Enforcer Tera|r, 从其身上获取 [|cRXP_LOOT_Enforcer Tera's Signet|r]
    .complete 72449,3 --1/1 Enforcer Tera's Signet
    .mob Enforcer Tera
step
    #label Enforcer Horb's Signet
    .goto 425,31.25,19.24
    >>击杀|cRXP_ENEMY_执行者霍尔布|r, 击败他们后可获得 [|cRXP_LOOT_执行者霍尔布的印章|r]
    .complete 72449,4 --1/1 Enforcer Horb's Signet
    .mob Enforcer Horb
step
    #label EndIncludePrepGuide
    #loop
    .goto 425,26.88,48.3,40,0
    .goto 425,32.24,54.67,40,0
    .goto 425,37.41,59.37,40,0
    .goto 425,47.25,59.06,40,0
    .goto 425,43.14,46.45,40,0
    .goto 425,31.35,21.82,40,0
    >>击杀|cRXP_ENEMY_Defias|r和|cRXP_ENEMY_Confused Citizens|r和|cRXP_ENEMY_Clessington Attendant|r
    .complete 72446,1 --Northshire defended (100%)
    .mob Clessington Attendant
    .mob Confused Acolyte
    .mob Confused Commoner
    .mob Confused Recruit
    .mob Defias Bandit
    .mob Defias Mage
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r和|cRXP_FRIENDLY_马蒂亚斯·肖尔大师|r和|cRXP_FRIENDLY_塞西莉亚·克莱辛顿|r交谈
    .turnin 72446 >>交任务: |cRXP_FRIENDLY_[What's Their Problem?]|r
    .goto 425,27.68,66.66
    .target +Marshal McBride
    .turnin 72449 >>交任务: |cRXP_FRIENDLY_[Knock It Off!]|r
    .goto 425,27.89,66.73
    .target +Master Mathias Shaw
    .accept 72450 >>接任务: |cRXP_WARN_克莱辛顿的意志|r
    .goto 425,28.02,67.31
    .target +Cecilia Clessington
step
    .goto 425,35.42,51.63
    >>点击|cRXP_PICK_Barrier|r
    .complete 72450,1 --1/1 Barrier dispelled
step
    #completewith next
    .goto 425,37.6,50.33,10 >>|cRXP_WARN_跟随箭头指引|r
    .timer 15,RP
step
    .goto 425,36.98,51.16
    >>击杀|cRXP_ENEMY_Count 克莱辛顿|r及其|cRXP_ENEMY_minions.|r
    *使用|cRXP_WARN_[ExtraActionButton]|r if you are stunned.
    .complete 72450,2 --1/1 Count Clessington slain
    .mob Count Clessington
    .mob Clessington Attendant
    .mob Defias Rebel
    .mob Confused Recruit
step
    .goto 425,36.4,50.82,5,0
    .goto 425,37.59,50.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cecilia Clessington|r交谈
    .turnin 72450 >>交任务: |cRXP_FRIENDLY_克莱辛顿的意志|r
    .target Cecilia Clessington
step
    .goto 425,36.40,51.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 72451 >>接任务: |cRXP_WARN_[Will to Survive]|r
    .target Master Mathias Shaw
step
    .goto 425,37.53,50.55
    >>点击|cRXP_PICK_Amulet|r
    .complete 72451,1 --1/1 Drakefire Amulet
step
    .goto 425,36.47,51.12
    .gossipoption 108735 >>与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .target Master Mathias Shaw
    .timer 25,RP
step
    .goto 425,37.46,52.03
    >>等待目标完成
    .complete 72451,2 --1/1 Amulet given to Shaw
    .skipgossip
step
    #completewith [3]
    >>|cRXP_WARN_请遵循指示|r
    .complete 72451,3 --1/1 Resist
step
    .isOnQuest 72451
    .goto 425,37.46,52.03
    .cast 59752 >>使用 |T136129:0|t[生存意志]|cRXP_WARN_额外动作按钮|r|cRXP_WARN_[1]|r
step
    .isOnQuest 72451
    .goto 425,37.46,52.03
    .cast 59752 >>使用 |T136129:0|t[求生意志]|cRXP_WARN_额外动作按钮|r|cRXP_WARN_[2]|r
step
    .isOnQuest 72451
    #label [3]
    .goto 425,37.46,52.03
    .cast 59752 >>使用 |T136129:0|t[求生意志] 你的|cRXP_WARN_额外动作按钮|r|cRXP_WARN_[3]|r
    .timer 26, RP
step
    .goto 425,37.31,51.03
    >>击杀|cRXP_ENEMY_奥妮克希亚的阴影|r
    *使用|cRXP_WARN_[ExtraActionButton]|r if you are stunned.
    .complete 72451,4 --1/1 Shade of Onyxia slain
    .mob Shade of Onyxia
step
    .goto 425,36.56,51.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梵妮莎·范克里夫|r交谈
    .turnin 72451 >>交任务: |cRXP_FRIENDLY_[Will to Survive]|r
    .target Vanessa VanCleef
step
    .goto 425,36.75,51.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 72452 >>接任务: |cRXP_WARN_[Go with Honor, Friend]|r
    .target Master Mathias Shaw
step
    .goto 84,71.06,85.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .complete 72452,1 --1/1 Shaw met outside Stormwind
    .skipgossip
step
    .goto 84,69.38,82.99
    >>等待目标完成
    .complete 72452,2 --1/1 General Hammond Clay approached
step
    .goto 84,69.38,82.99
    >>使用|cRXP_WARN_[ExtraActionButton]|r
    .complete 72452,3 --1/1 Honor received
step
    .goto 84,69.21,82.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈蒙德·克雷将军|r交谈
    .turnin 72452 >>交任务: |cRXP_FRIENDLY_[Go with Honor, Friend]|r
    .target General Hammond Clay
]])

--Dwarf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name BA) 矮人传承护甲
#displayname |cFF1EFF002|r - 矮人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BC) 暗夜精灵传承护甲

<< Alliance

step
    #label StartIncludePrepGuide
    .goto 84,54.61,18.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Digger Golad|r交谈
    .accept 53838 >>接任务: |cRXP_WARN_一路走好|r
    .target Digger Golad
step
    #completewith missing excavators
    .zone 27 >>前往丹莫罗
step
    #completewith missing excavators
    .goto 27,68.08,48.91 >>进入洞穴
step
    #label missing excavators
    .goto 31,38.47,54.23,10,0
    .goto 31,50.87,20.89,10,0
    .goto 31,39.69,22.64
    #title |cFFFCDC00跟随箭头指引|r
    .complete 53838,1 --1/1 Find the missing excavators
step
    .goto 31,39.80,22.55
    >>击杀|cRXP_ENEMY_Maw'roc the Thief|r
    .complete 53838,2 --1/1 Maw'roc the Thief slain
    .mob Maw'roc the Thief
step
    .goto 31,39.80,22.55
    >>点击|cRXP_PICK_上古石板|r
    .turnin 53838 >>交任务: |cRXP_FRIENDLY_一路走好|r
    .accept 53835 >>接任务: |cRXP_WARN_有什么有价值的东西吗？|r
    .target Ancient Tablet
step
    #completewith 交任务: |cRXP_FRIENDLY_有什么有价值的东西吗？|r
    .goto 31,50.87,20.89
    .goto 31,38.47,54.23
    .goto 27,77.83,54.89 >>离开洞穴
step
    #completewith 交任务: |cRXP_FRIENDLY_有什么有价值的东西吗？|r
    .goto 27,60.55,33.3
    .zone 87 >>前往: |cRXP_PICK_铁炉堡|r
step
    #label 交任务: |cRXP_FRIENDLY_有什么有价值的东西吗？|r
    .goto 87,77.42,9.56,40,0
    .goto 87,22.21,78.59,20,0
    .goto 87,27.48,84.68,20,0
    .goto 87,37.43,66.74,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .turnin 53835 >>交任务: |cRXP_FRIENDLY_有什么有价值的东西吗？|r
    .accept 53836 >>接任务: |cRXP_WARN_古代铠甲，上古之谜|r
    .target Brann Bronzebeard
step
    .goto 87,44.26,49.85,10,0
    .goto 87,46.37,52.83,5,0
    .goto 1361,75.76,88.5,5,0
    .goto 1361,80.96,89.21,5,0
    .goto 1361,82,53.24,5,0
    .goto 1361,57.03,47.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_顾问贝尔格拉姆|r交谈
    .turnin 53836 >>交任务: |cRXP_FRIENDLY_古代铠甲，上古之谜|r
    .target Advisor Belgrum
    .accept 53837 >>接任务: |cRXP_WARN_多加小心|r
step
    .goto 1361,45.14,62.19,5,0
    .goto 1361,38.25,66.03,5,0
    .goto 1361,43.4,54.15,5,0
    .goto 1361,37.63,40.67,5,0
    .goto 1361,28.2,50.73,5,0
    .goto 1361,38.87,71.33,5,0
    .goto 1361,47.72,65.33,5,0
    .goto 1361,38.15,44.51,5,0
    .goto 1361,19.69,51.98
    >>击杀|cRXP_ENEMY_Trogg Invader|r和|cRXP_ENEMY_Roc'maw the Burrower|r
    .complete 53837,1 --8/8 Trogg Invader slain
    .complete 53837,2 --1/1 Roc'maw the Burrower slain
    .mob Trogg Invader
    .mob Roc'maw the Burrower
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_顾问贝尔格拉姆|r, 就在你旁边
    .turnin 53837 >>交任务: |cRXP_FRIENDLY_多加小心|r
    .target Advisor Belgrum
    .accept 53839 >>接任务: |cRXP_WARN_艾格利姆的书房|r
step
    .isOnQuest 53839
    .goto 1361,18.65,52.4
    .zone 87 >>点击|cRXP_PICK_Door|r
step
    .goto 87,19.55,52.05
    >>点击 |the cRXP_PICK_Armor Stand|r
    .turnin 53839 >>交任务: |cRXP_FRIENDLY_艾格利姆的书房|r
    .target Armor Stand
    .accept 53841 >>接任务: |cRXP_WARN_昔日碎片|r
step
    #completewith Ancient Golem Guards
    +击杀|cRXP_ENEMY_古代石像守卫. |r
    .mob Ancient Golem Guard
step
    .goto 87,19.48,51.8
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,1 --6/6 Fragments of Shattered Armor
step
    .goto 87,20.25,52.57
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,2 --6/6 Fragments of Shattered Armor
step
    .goto 87,20.89,53.24
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,3 --6/6 Fragments of Shattered Armor
step
    .goto 87,21.96,51.53
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,4 --6/6 Fragments of Shattered Armor
step
    .goto 87,20.93,50.94
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,5 --6/6 Fragments of Shattered Armor
step
    #label Ancient Golem Guards
    .goto 87,20.7,49.65
    >>点击|cRXP_PICK_Metal.|r
    .complete 53841,1,6 --6/6 Fragments of Shattered Armor
step
    .goto 87,24.82,49.31
    .isOnQuest 53841
    .zone 1361 >>点击|cRXP_PICK_Door|r
step
    .goto 1361,38.15,44.51,5,0
    .goto 1361,47.72,65.33,5,0
    .goto 1361,38.87,71.33,5,0
    .goto 1361,28.2,50.73,5,0
    .goto 1361,37.63,40.67,5,0
    .goto 1361,43.4,54.15,5,0
    .goto 1361,38.25,66.03,5,0
    .goto 1361,45.14,62.19,5,0
    .goto 1361,63.29,48.61,5,0
    .goto 1361,81.67,53.71,5,0
    .goto 1361,79.76,88.88,5,0
    .goto 1361,75.6,88.32,5,0
    .goto 87,46.51,52.75,5,0
    .goto 87,43.95,51.91,5,0
    .goto 87,44.86,49.14,5,0
    .goto 87,77.44,9.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .turnin 53841 >>交任务: |cRXP_FRIENDLY_昔日碎片|r
    .target Brann Bronzebeard
    .accept 53840 >>接任务: |cRXP_WARN_想来点儿酒吗？|r
step
    #completewith next
    .goto 87,55.65,47.84
    .fly Thelsamar >>飞往塞尔萨玛
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .target Gryth Thurden
step
    .isOnQuest 53840
    .goto 48,35.23,47.77,5,0 >>进入塞尔萨玛
step
    .goto 48,35.53,48.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .home >>将你的炉石设置为酒馆旅店
    .target Innkeeper Hearthstove
step
    .goto 48,35.00,48.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁努斯·削钢|r交谈
    .turnin 53840 >>交任务: |cRXP_FRIENDLY_想来点儿酒吗？|r
    .target Grumnus Steelshaper
step
    .goto 48,35.02,48.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .accept 53844 >>接任务: |cRXP_WARN_招募掌炉者|r
    .target Brann Bronzebeard
-- step
-- .set hs
-- step
--     #completewith next
--     .hs >>传送至贸易区
step
    .cast 48933 >>|T135778:0|t[虫洞发生器:诺森德]
    .itemcount 48933,1
step
    #completewith next
    .zone 120 >>前往风暴之峰(北端)
step
    .goto 120,41.55,17.99
    >>进入奥杜尔副本传送门
    .complete 53844,1 --1/1 前往奥杜尔
step
    #completewith next
    >>击杀|cRXP_ENEMY_烈焰|r
    .complete 53844,2 --6/6 Titan Flame slain
    .mob Titan Flame
step
    >>击杀|cRXP_ENEMY_熔炉的玛格玛利昂|r
    *|cRXP_WARN_Take the first left turn.|r
    .complete 53844,3 --1/1 Magmarion of the Furnace slain
    .mob Magmarion of the Furnace
step
    >>击杀|cRXP_ENEMY_烈焰|r
    .complete 53844,2 --6/6 Titan Flame slain
    .mob Titan Flame
step
    .goto 48,35.01,48.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .turnin 53844 >>交任务: |cRXP_FRIENDLY_招募掌炉者|r
    .target Brann Bronzebeard
    .accept 53842 >>接任务: |cRXP_WARN_大地赐福|r
step
    #completewith next
    .goto 48,35.48,48.16,5,0
    .goto 48,35.37,47.67,5,0
    .goto 48,33.84,50.82
    .fly Ironforge >>飞往铁炉堡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .target Thorgrum Borrelson
step
    .goto 87,44.26,49.85,10,0
    .goto 87,46.37,52.83,5,0
    .goto 1361,75.76,88.5,5,0
    .goto 1361,80.96,89.21,5,0
    .goto 1361,82,53.24,5,0
    .goto 1361,36.11,54.22
    >>点击|cRXP_PICK_大地仪式的残余|r
    .complete 53842,1 --1/1 Remnant of the Earthen Ritual
step
    .goto 1361,82,53.24,5,0
    .goto 1361,80.96,89.21,5,0
    .goto 1361,75.76,88.5,5,0
    .goto 87,46.37,52.83,5,0
    .goto 87,44.26,49.85,10,0
    .goto 87,49.23,45.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塑石者布德克拉格|r交谈
    .turnin 53842 >>交任务: |cRXP_FRIENDLY_大地赐福|r
    .target Bouldercrag the Rockshaper
step
    .goto 87,48.79,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁努斯·削钢|r交谈
    .accept 53845 >>接任务: |cRXP_WARN_铸造铠甲|r
    .target Grumnus Steelshaper
step
    .goto 87,49.13,44.88
    >>|cRXP_WARN_请在炽热的圆圈内使用|r[额外动作按钮]
    .complete 53845,1 --1/1 Help Bouldercrag's Ritual
step
    #completewith next
    .goto 87,49.03,44.67
    .cast 6478 >>点击|cRXP_PICK_古代金属堆|r
step
    .goto 87,51.69,43.70
    >>骑上坐骑, 飞入火焰圆圈内
    .complete 53845,2 --1/1 Present Ignis the Armor Shards
step
    #completewith next
    .goto 87,52.34,44.08
    .cast 6478 >>点击|cRXP_PICK_Molten Metal.|r
step
    .goto 87,50.10,43.96
    >>骑上坐骑, 飞入火焰圆圈内
    .complete 53845,3 --1/1 Bring the Molten Metal to the Great Anvil
step
    >>|cRXP_WARN_使用|r[额外动作按钮]
    .complete 53845,4 --1/1 Forge the Bulwark of the Mountain Kings
step
    .goto 87,49.74,43.71
    >>点击|rC罗普克·山王壁垒|c
    .complete 53845,5 --1/1 Heritage of the Bronzebeard
step
    #EndIncludePrepGuide
    .goto 87,46.10,50.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁努斯·削钢|r交谈
    .turnin 53845 >>交任务: |cRXP_FRIENDLY_铸造铠甲|r
    .target Grumnus Steelshaper
step
    .goto 87,45.88,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱恩·铜须|r交谈
    .accept 53846 >>接任务: |cRXP_WARN_铜须部族的遗产|r
    .target Brann Bronzebeard
    .turnin 53846 >>交任务: |cRXP_FRIENDLY_铜须部族的遗产|r
    .target Muradin Bronzebeard
]])

--Nightelf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name BC) 暗夜精灵传承护甲
#displayname |cFF1EFF003|r - 暗夜精灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bd) 侏儒传承护甲

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 84 >>前往: |cRXP_PICK_暴风城|r
step
    .goto 84,52.3,14.2
    >>点击|cRXP_PICK_卷轴|r
    .accept 75890 >>接任务: |cRXP_WARN_号角之召|r
step
    .goto 84,52.34,4.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arko'narin 星影草|r交谈
    .turnin 75890 >>交任务: |cRXP_FRIENDLY_号角之召|r
    .target Arko'narin Starshade
    .accept 75891 >>接任务: |cRXP_WARN_远古诅咒|r
step
    #completewith next
    .goto 84,76.16,18.7
    .zone 198 >>前往暮光高地的传送门
step
    .goto 12,47.67,30.61,10 >>|cRXP_WARN_跟随箭头指引|r
    .timer 30,RP
step
    .goto 12,47.67,30.61
    >>等待目标进度完成
    .complete 75891,1 --1/1 Meet Maiev Shadowsong in Felwood
    .target Maiev Shadowsong
step
    .goto 12,47.67,30.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 75891 >>交任务: |cRXP_FRIENDLY_远古诅咒|r
    .target Maiev Shadowsong
    .accept 76194 >>接任务: |cRXP_WARN_恐怖征兆|r
step
    .isOnQuest 76194
    .goto 12,47.67,30.62
    .gossipoption 110344 >>与|cRXP_FRIENDLY_阿科纳瑞恩|r交谈
    .timer 30,RP
    .target Arko'narin
step
    .goto 12,47.67,30.61
    >>等待目标进度完成
    .complete 76194,1 --1/1 Speak with Arko'narin
step
    .goto 12,47.68,30.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 76194 >>交任务: |cRXP_FRIENDLY_恐怖征兆|r
    .target Maiev Shadowsong
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_星影草|cRXP_FRIENDLY_Lysander|r和|r星影草|cRXP_FRIENDLY_Arko'narin|r交谈
    .accept 76195 >>接任务: |cRXP_WARN_抵御腐化|r
    .goto 12,47.68,30.62
    .target +Lysander Starshade
    .accept 76196 >>接任务: |cRXP_WARN_悲慈一念间|r
    .goto 12,47.66,30.61
    .target +Arko'narin Starshade
step
    #hidewindow
    #completewith Kill enemies in Jaedenar
    #loop
    .goto 12,47.55,30.78,30,0
    .goto 12,47.42,30.62,30,0
    .goto 12,47.33,30.47,30,0
    .goto 12,47.34,30.36,30,0
    .goto 12,47.47,30.44,30,0
    .goto 12,47.48,30.3,30,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_加德纳尔诡术师|r和|cRXP_ENEMY_加德纳尔法师|r和|cRXP_ENEMY_加德纳尔战士|r和|cRXP_ENEMY_加德纳尔恶棍|r
    .complete 76196,1 --15/15 Kill enemies in Jaedenar
    .mob Feltouched Trickster
    .mob Jaedenar Warrior
    .mob Jaedenar Scoundrel
    .mob Feltouched Conjurer
step
    >>对死去的|cRXP_ENEMY_Feltouched Trickster|r和|cRXP_ENEMY_Feltouched Conjurer|r使用 |T134544:0|t[咒术师法典]
    .complete 76195,1 --6/6 Satyr corpses neutralized
    .use 207004
step
    #label Kill enemies in Jaedenar
    >>击杀|cRXP_ENEMY_加德纳尔诡术师|r和|cRXP_ENEMY_加德纳尔法师|r和|cRXP_ENEMY_加德纳尔战士|r和|cRXP_ENEMY_加德纳尔恶棍|r
    .complete 76196,1 --15/15 Kill enemies in Jaedenar
    .mob Feltouched Trickster
    .mob Jaedenar Warrior
    .mob Jaedenar Scoundrel
    .mob Feltouched Conjurer
step
    .goto 77,36.14,57.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 76195 >>交任务: |cRXP_FRIENDLY_抵御腐化|r
    .turnin 76196 >>交任务: |cRXP_FRIENDLY_悲慈一念间|r
    .target Maiev Shadowsong
    .accept 76203 >>接任务: |cRXP_WARN_没影之路|r
step
    .goto 77,36.14,57.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .complete 76203,1 --1/1 Speak with Maiev Shadowsong
    .skipgossip 202702,1
    .target Maiev Shadowsong
step
    #completewith Maiev Shadowsong1
    +靠近|cRXP_FRIENDLY_玛维·影歌|r
step
    .goto 77,36.09,57.49,5,0
    .goto 77,35.9,57.8,5,0
    .goto 77,36.19,57.79,5,0
    .goto 77,36.18,56.85
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,1 --6/6 Felflame Braziers extinguished
step
    .goto 77,36.83,56.17
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,2 --6/6 Felflame Braziers extinguished
step
    .goto 77,37.07,55.38
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,3 --6/6 Felflame Braziers extinguished
step
    .goto 77,37.17,54.67
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,4 --6/6 Felflame Braziers extinguished
step
    .goto 77,37.92,54.77
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,5 --6/6 Felflame Braziers extinguished
step
    .goto 77,38.46,54.4
    >>点击|cRXP_PICK_Felflame 火盆|r
    .complete 76203,2,6 --6/6 Felflame Braziers extinguished
step
    #label Maiev Shadowsong1
    .goto 77,39,54.04,10,0
    .goto 77,38.85,54.36,10,0
    .goto 77,38.19,53.7,10,0
    .goto 77,38.05,53.68
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76203,3 --1/1 Discover what lurks in the depths of Shadow Hold
    .timer 5, RP
step
    .goto 77,38.06,53.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 76203 >>交任务: |cRXP_FRIENDLY_没影之路|r
    .target Maiev Shadowsong
    .accept 76197 >>接任务: |cRXP_WARN_恐怖窥探|r
step
    .goto 77,37.85,52.77
    >>击杀|cRXP_ENEMY_Cultist Nethus|r
    .complete 76197,1 --1/1 Cultist Nethus slain
    .mob Cultist Nethus
step
    .goto 77,36.71,51.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 76197 >>交任务: |cRXP_FRIENDLY_恐怖窥探|r
    .target Maiev Shadowsong
    .accept 76205 >>接任务: |cRXP_WARN_力量制衡|r
step
    .goto 77,36.68,51.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lysander Starshade|r交谈
    .accept 76206 >>接任务: |cRXP_WARN_症结之心|r
    .target Lysander Starshade
step
    #completewith Portals
    >>击杀|cRXP_ENEMY_Hel'nurathian 海尔努拉西亚邪教徒|r和|cRXP_ENEMY_Hel'nurathian 海尔努拉西亚守卫|r和|cRXP_ENEMY_Hel'nurathian 费尔莫|r
    .complete 76205,1 --Enemies slain in Shadow Hold (100%)
    .mob Hel'nurathian Cultist
    .mob Hel'nurathian Defender
    .mob Hel'nurathian Felmaw
step
    .isOnQuest 76206
    .goto 77,39.03,50.3
    .cast 416036 >>点击|cRXP_PICK_传送门|r
step
    #hidewindow
    #completewith Portal1
    .goto 77,39.47,49.61,5,0
    .goto 77,39.69,49.86,5,0
    .goto 77,39.93,49.99,5,0
    .goto 77,39.86,49.57,5,0
    .goto 77,39.66,49.86,5,0
    .goto 77,39.96,49.87,5,0
    .goto 77,41.17,48.4
    +1
step
    .isOnQuest 76206
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76206,1,1 --4/4 Portals closed
step
    #label Portal1
    .isOnQuest 76206
    .cast 416036 >>点击|cRXP_PICK_传送门|r
step
    #hidewindow
    #completewith Portal2
    .goto 77,40.72,48.7,15,0
    .goto 77,41.05,49.58
    +1
step
    .isOnQuest 76206
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76206,1,2 --4/4 Portals closed
step
    .isOnQuest 76206
    #label Portal2
    .cast 416036 >>点击|cRXP_PICK_传送门|r
step
    #hidewindow
    #completewith Portal3
    .goto 77,40.5,47.76,10,0
    .goto 77,39.28,46.94
    +1
step
    .isOnQuest 76206
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76206,1,3 --4/4 Portals closed
step
    #label Portal3
    .cast 416036 >>点击|cRXP_PICK_传送门|r
step
    #loop
    .goto 77,40.5,47.76,10,0
    .goto 77,40.53,48.05,10,0
    .goto 77,40.4,48.96,10,0
    .goto 77,41.05,49.58,10,0
    .goto 77,39.03,50.3,10,0
    >>击杀|cRXP_ENEMY_Hel'nurathian 海尔努拉西亚邪教徒|r和|cRXP_ENEMY_Hel'nurathian 海尔努拉西亚守卫|r和|cRXP_ENEMY_Hel'nurathian 费尔莫|r
    .complete 76205,1 --Enemies slain in Shadow Hold (100%)
    .mob Hel'nurathian Cultist
    .mob Hel'nurathian Defender
    .mob Hel'nurathian Felmaw
step
    #hidewindow
    #completewith 交任务: |cRXP_FRIENDLY_力量制衡|r
    .goto 77,39.14,46.23,15,0
    .goto 77,38.74,46.88,15,0
    .goto 77,37.98,46.21
    +1
step
    .isOnQuest 76206
    #label Portals
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76206,1,4 --4/4 Portals closed
step
    #label 交任务: |cRXP_FRIENDLY_力量制衡|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_玛维·影歌|r和|cRXP_FRIENDLY_阿尔科纳林·星影草|r
    .turnin 76205 >>交任务: |cRXP_FRIENDLY_力量制衡|r
    .goto 77,37.98,46.21
    .target +Maiev Shadowsong
    .turnin 76206 >>交任务: |cRXP_FRIENDLY_症结之心|r
    .goto 77,37.93,46.26
    .target +Arko'narin Starshade
step
    .goto 77,38.49,45.66,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arko'narin 星影草|r交谈
    .accept 76207 >>接任务: |cRXP_WARN_守望者之怒|r
    .target Arko'narin Starshade
step
    .goto 77,38.47,45.7,10,0
    .goto 77,38.58,46.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .target Maiev Shadowsong
    .complete 76207,1 --1/1 Maiev signaled
    .skipgossip
step
    .goto 77,38.11,47.37
    >>保护 |cRXP_FRIENDLY_Lysander|r
    *|cFFFF0000After completing the objective, you can skip the cutscene by pressing 'Escape' and accepting the prompt.|r
    .complete 76207,2 --1/1 Lysander protected
    .mob Hel'nurathian Eye
    .mob Hel'nurathian Felmaw
step
    .goto 12,47.41,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lysander Starshade|r交谈
    .turnin 76207 >>交任务: |cRXP_FRIENDLY_守望者之怒|r
    .target Lysander Starshade
step
    .goto 12,47.42,30.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .accept 76212 >>接任务: |cRXP_WARN_守护者的印记|r
    .target Maiev Shadowsong
step
    .goto 12,47.4,30.36
    #title |cFFFCDC00跟随箭头指引|r
    .complete 76212,1 --1/1 Take your position
step
    #completewith next
    .goto 12,47.4,30.36
    .cast 421556 >>|cRXP_WARN_使用|r[额外动作按钮]
    .timer 82,RP
step
    >>等待目标完成
    .complete 76212,2 --1/1 Witness the facial marking ceremony
step
    #EndIncludePrepGuide
    #completewith next
    .goto 12,47.42,30.38
    .zone 84 >>前往通往暴风城的传送门
step
    .goto 84,49.4,86.71,5,0
    .goto 84,49.36,87.41,5,0
    .goto 84,48.92,86.78,5,0
    .goto 84,48.66,87.69,5,0
    .goto 84,49.42,86.83,5,0
    .goto 84,52.42,4.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lysander Starshade|r交谈
    .turnin 76212 >>交任务: |cRXP_FRIENDLY_守护者的印记|r
    .target Lysander Starshade
step
    .goto 84,52.59,3.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .accept 76213 >>接任务: |cRXP_WARN_女神的荣耀|r
    .timer 30,RP
    .target Maiev Shadowsong
step
    .goto 84,52.59,3.82
    >>|cRXP_WARN_等待角色扮演|r
    *|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .target Maiev Shadowsong
    .turnin 76213 >>交任务: |cRXP_FRIENDLY_女神的荣耀|r
]])

--Gnome
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bd) 侏儒传承护甲
#displayname |cFF1EFF004|r - 侏儒 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 是)德莱尼传承装甲

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 87 >>前往: |cRXP_PICK_铁炉堡|r
step
    .goto 84,54.81,18.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王牌飞行员斯托姆克罗格|r交谈
    .accept 54402 >>接任务: |cRXP_WARN_风云变幻|r
    .target Ace Pilot Stormcrog
step
    .goto 469,41.77,31.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .turnin 54402 >>交任务: |cRXP_FRIENDLY_风云变幻|r
    .target Captain Tread Sparknozzle
    .accept 54576 >>接任务: |cRXP_WARN_诺莫瑞根最强王者|r
step
    .goto 469,40.28,38.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .complete 54576,3 --1/1 Speak with Cog Captain Winklespring
    .skipgossip
    .target Cog Captain Winklespring
step
    .goto 469,37.46,38.16,10,0
    .goto 469,38.25,39.24,5,0
    .goto 469,38.19,38.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_Emaedi Autoblast|r|cRXP_WARN_交谈. |r
    .complete 54576,1 --1/1 Speak with Emaedi Autoblast
    .skipgossip
    .target Emaedi Autoblast
step
    .goto 469,38.23,39.32,5,0
    .goto 469,37.43,38.11,5,0
    .goto 469,37.95,33.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fizzi Tinkerbow|r交谈
    .complete 54576,2 --1/1 Speak with Fizzi Tinkerbow
    .skipgossip
    .target Fizzi Tinkerbow
step
    .goto 469,41.78,31.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .turnin 54576 >>交任务: |cRXP_FRIENDLY_诺莫瑞根最强王者|r
    .target Captain Tread Sparknozzle
    .accept 54577 >>接任务: |cRXP_WARN_漆黑的走廊和满是灰尘的齿轮|r
step
    .goto 27,31.18,38.02,10,0
    .goto 30,69.88,83.03,10,0
    .goto 30,56.49,81.13,10,0
    .goto 30,54.09,75.64,10,0
    .goto 30,53.88,14.98,10,0
    .goto 30,45.43,13.95
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 54577,1 --1/1 进入诺莫瑞根 through the Workshop Entrance
step
    .goto 1380,83.17,63.81,20,0
    .goto 1380,78.3,63.53,20,0
    .goto 1380,75.05,67.25,20,0
    .goto 1380,72.05,73.19,20,0
    .goto 1380,65.41,72.47,20,0
    .goto 1380,56.56,62.8,20,0
    .goto 1380,52.9,67.83,20,0
    .goto 1380,50.66,89.67,20,0
    .goto 1380,46.39,89.92,20,0
    .goto 1380,36.7,86.26,20,0
    .goto 1380,35.95,73.04
    >>点击|cRXP_PICK_Prototype 奥术引擎|r
    .complete 54577,2 --1/1 Prototype Arcane Engine
step
    #completewith next
    .goto 1380,37.81,72.24
    .cast 6478 >>点击|cRXP_PICK_Broken Teleporter|r的传送师
step
    .goto 469,41.77,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .turnin 54577 >>交任务: |cRXP_FRIENDLY_漆黑的走廊和满是灰尘的齿轮|r
    .target Captain Tread Sparknozzle
    .accept 54580 >>接任务: |cRXP_WARN_苔原难题|r
step
    #completewith next
    .zone 114 >>前往冰原大陆(北境)
step
    #loop
    .goto 114,55.28,18.92,2,0
    .goto 114,55.36,18.82,2,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .turnin 54580 >>交任务: |cRXP_FRIENDLY_苔原难题|r
    .target Cog Captain Winklespring
step
    .goto 114,55.32,18.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fizzi Tinkerbow|r交谈
    .accept 54581 >>接任务: |cRXP_WARN_更多的机械猛禽|r
    .target Fizzi Tinkerbow
step
    #loop
    .goto 114,60.31,21.08,30,0
    .goto 114,62.12,20.23,30,0
    .goto 114,63.06,19.3,30,0
    .goto 114,64.2,19.82,30,0
    .goto 114,64.41,22.12,30,0
    >>击杀|cRXP_ENEMY_Ironbound Brute|r和|cRXP_ENEMY_Ironbound Scrapthrower|r
    *|cRXP_WARN_使用|r[额外动作按钮] to deal additional damage.
    .complete 54581,1 --10/10 Ironbound Brute slain
    .mob Ironbound Brute
    .mob Ironbound Scrapthrower
step
    .goto 114,64.08,24.73
    >>|cRXP_WARN_点击任务日志中的弹出提示|r
    .turnin 54581 >>交任务: |cRXP_FRIENDLY_更多的机械猛禽|r
    .accept 54582 >>接任务: |cRXP_WARN_比一般穴居人聪明得多|r
step
    .goto 114,64.62,23.02
    >>击杀|cRXP_ENEMY_Krugg the Smart.|r, 从其身上搜刮 [|cRXP_LOOT_Broken Communication Device.|r]
    .complete 54582,1 --1/1 Krugg the Smart slain
    .complete 54582,2 --1/1 Broken Communication Device
    .mob Krugg the Smart
step
    .goto 114,55.31,18.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fizzi Tinkerbow|r交谈
    .turnin 54582 >>交任务: |cRXP_FRIENDLY_比一般穴居人聪明得多|r
    .target Fizzi Tinkerbow
    .accept 54579 >>接任务: |cRXP_WARN_穴居人背后的侏儒|r
step
    .goto 114,55.28,18.98
    >>点击|cRXP_PICK_RCV 控制开关. |r
    .complete 54579,1 --1/1 RCV Control Switch
    .timer 15,RP
step
    .goto 114,55.31,18.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fizzi Tinkerbow|r交谈
    .turnin 54579 >>交任务: |cRXP_FRIENDLY_穴居人背后的侏儒|r
    .target Fizzi Tinkerbow
    .accept 54639 >>接任务: |cRXP_WARN_风暴峭壁内的信号|r
step
    .goto 114,55.18,18.83
    >>点击|cRXP_PICK_First Squadron Prototype.|r
    .complete 54639,1 --1/1 Jump in the First Squadron Prototype
    .timer 140,RP
    .target First Squadron Prototype
step
    >>等待它抵达
    .complete 54639,2 --1/1 Reach the signal point
step
    .goto 120,37.60,60.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .turnin 54639 >>交任务: |cRXP_FRIENDLY_风暴峭壁内的信号|r
    .target Cog Captain Winklespring
    .accept 54640 >>接任务: |cRXP_WARN_无情的侏儒！|r
step
    .goto 120,37.45,60.51
    >>点击|cRXP_PICK_缩小突击坦克|r
    .complete 54640,1 --1/1 De-Shrinkify the Assault Tank
    .target Shrinkified Assault Tank
step
    .goto 120,37.45,60.51
    >>点击 |cRXP_PICK_诺莫瑞根突击坦克|r
    .complete 54640,2 --1/1 Commandeer the Assault Tank
    .target Gnomeregan Assault Tank
step
    .isOnQuest 54640
    .exitvehicle >>|cRXP_WARN_通过按下动作条上的|r[退出]|cRXP_WARN_button, 解除诺莫瑞根突击坦克的骑乘状态|r
    *|cRXP_WARN_或者, 您可以使用这个宏；|r
    .link /leavevehicle>>点击此处获取宏
step
    #loop
    .goto 120,38.23,59.93,40,0
    .goto 120,40.17,60.55,40,0
    .goto 120,42.49,59.35,40,0
    .goto 120,43.22,57.1,40,0
    .goto 120,42.66,54.85,40,0
    .goto 120,41.48,53.15,40,0
    .goto 120,39.53,53.8,40,0
    .goto 120,38.01,57.05,40,0
    >>击杀|cRXP_ENEMY_Ironbound Invader|r
    .complete 54640,3 --30/30 Ironbound Invader slain
    .mob Ironbound Invader
step
    .goto 120,56.12,51.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .turnin 54640 >>交任务: |cRXP_FRIENDLY_无情的侏儒！|r
    .target Cog Captain Winklespring
    .accept 54850 >>接任务: |cRXP_WARN_行动：穴居人末日|r
step
    .goto 120,56.17,51.50
    >>点击|cRXP_PICK_First Squadron Prototype|r
    .complete 54850,1 --1/1 Jump in the First Squadron Prototype
    .target First Squadron Prototype
step
    .goto 120,37.43,43.02
    >>使用 |T1141394:0|t1[制式轰炸机炮](1)攻击你前方锥形范围内的敌人, 以及使用 |T136111:0|t[旺财 Mk. II](2)攻击地面上圆形区域内的敌人
    .complete 54850,2 --Defeat Sparkspanner's Army (100%)
step
    #label EndIncludePrepGuide
    .goto 120,38.73,42.67
    >>|cRXP_WARN_点击任务日志中的弹出提示|r
    .turnin 54850 >>交任务: |cRXP_FRIENDLY_行动：穴居人末日|r
step
    #completewith next
    .exitvehicle >>|cRXP_WARN_通过按下动作条上的|r[退出]|cRXP_WARN_button, 卸下第一中队原型|r
    *|cRXP_WARN_或者, 您可以使用这个宏；|r
    .link /leavevehicle>>点击此处获取宏
step
    .goto 120,56.13,51.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .accept 54641 >>接任务: |cRXP_WARN_为了诺莫瑞根！|r
    .target Cog Captain Winklespring
step
    .goto 120,39.43,26.88
    >>Enter the 接任务: |cRXP_WARN_长者尤拉克|r Dungeon  Portal.
    .complete 54641,1 --1/1 Enter the 接任务: |cRXP_WARN_长者尤拉克|r
step
    #completewith next
    .goto 1375,44.43,36.29,20,0
    .goto 1375,48.84,28.47,20,0
    .goto 1375,50,11.5,20,0
    +击杀|cRXP_ENEMY_Smasher X900.|r
step
    .goto 1375,50.11,12.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cog Captain Winklespring|r交谈
    .turnin 54641 >>交任务: |cRXP_FRIENDLY_为了诺莫瑞根！|r
    .target Cog Captain Winklespring
    .accept 54642 >>接任务: |cRXP_WARN_全新G.E.A.R.，迎接挑战！|r
step
    #completewith next
    .zone 469 >>前往丹莫罗
step
    .goto 469,41.78,31.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .turnin 54642 >>交任务: |cRXP_FRIENDLY_全新G.E.A.R.，迎接挑战！|r
    .target Captain Tread Sparknozzle
]])

--Draenei
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name 是)德莱尼传承装甲
#displayname |cFF1EFF005|r - 德莱尼 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bf) 狼人传承护甲

<< Alliance

step
    #label StartIncludePrepGuide
    .goto 13,43.79,71.79
    .accept 78068 >>接任务: |cRXP_WARN_技师的恳请|r
step
    #completewith next
    .cast 426620 >>使用 |T1686574:0|t[备用全息水晶]
    .use 210454
step
    .goto 103,54.78,79.84
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 78068,2 --1/1 Meet Romuul in the Exodar
step
    .goto 103,54.78,79.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠罗穆尔|r交谈
    .turnin 78068 >>交任务: |cRXP_FRIENDLY_技师的恳请|r
    .target Grand Artificer Romuul
    .accept 78069 >>接任务: |cRXP_WARN_[Reviving Tradition]|r
step
    .goto 103,58.05,79.79
    >>点击|cRXP_PICK_Chest|r
    .complete 78069,1 --1/1 Empyrium Filament
step
    .goto 103,51.26,74.67
    >>点击|cRXP_PICK_Chest|r
    .complete 78069,2 --1/1 Hyperthermal Soldering Tool
step
    .goto 103,54.78,79.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠罗穆尔|r交谈
    .complete 78069,3 --1/1 Materials brought to Romuul
    .skipgossip 210340,1
    .target Grand Artificer Romuul
step
    .isOnQuest 78069
    .cast 3365>>点击|cRXP_PICK_奥金锭 烈焰之柱|r
    .target Arkonite Generator
    .goto 103,55.55,78.78
step
    .isOnQuest 78069
    .cast 3365>>点击|cRXP_PICK_奥金锭 烈焰之柱|r
    .target Arkonite Generator
    .goto 103,54.72,78.81
step
    .isOnQuest 78069
    .cast 3365>>点击|cRXP_PICK_奥金锭 烈焰之柱|r
    .target Arkonite Generator
    .goto 103,54.32,81.45
step
    .isOnQuest 78069
    .cast 3365>>点击|cRXP_PICK_奥金锭 烈焰之柱|r
    .target Arkonite Generator
    .goto 103,53.97,80.18
step
    #label EndIncludePrepGuide
    .goto 103,53.82,78.96
    >>点击中央的|cRXP_PICK_Arkonite Generator|r
    .complete 78069,4 --2/2 Arkonite Array connected
step
    .goto 103,54.78,79.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠罗穆尔|r交谈
    .turnin 78069 >>交任务: |cRXP_FRIENDLY_[Reviving Tradition]|r
    .target Grand Artificer Romuul
    .accept 78070 >>接任务: |cRXP_WARN_大限将至|r
step
    #completewith next
    .cast 426620 >>使用 |T1686574:0|t[备用全息水晶]
    .use 210454
step
    .goto 111,38.96,46.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿塔亚|r交谈
    .complete 78070,2 --1/1 Speak to Ataanya
    .timer 15,RP
    .skipgossip 208494,1
    .target Ataanya
step
    .goto 111,37.95,46.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯鲁恩|r交谈
    .complete 78071,1 --1/1 Speak to Beruun
    .skipgossip 208496,1
    .target Beruun
step
    .goto 111,38.74,47.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等工匠阿塔亚|r交谈
    .accept 78071 >>接任务: |cRXP_WARN_[Rush Order]|r
    .target High Artificer Ataanya
step
    .goto 108,40.51,25.07
    #title |cFFFCDC00跟随箭头指引|r
    .complete 78071,2 --1/1 Draenite miners located
step
    #loop
    .goto 108,40.63,25.2,3,0
    .goto 108,40.69,25.31,3,0
    .goto 108,40.57,25.36,3,0
    >>点击|cRXP_PICK_Crates|r
    .complete 78071,3 --3/3 Draenite Crates loaded
step
    .goto 108,40.64,25.1
    >>点击|cRXP_PICK_Fragments|r
    .complete 78071,4 --1/1 Draenite Fragments gathered
step
    .goto 111,76.12,47.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水晶匠拉哈鲁|r交谈
    .complete 78071,5 --1/1 Draenite delivered to crystalsmiths
    .skipgossip
    .target Crystalsmith Laharu
step
    .goto 111,38.94,46.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等工匠阿塔亚|r交谈
    .complete 78071,7 --1/1 Work orders brought to Ataanya
    .skipgossip
    .target High Artificer Ataanya
step
    .goto 111,37.96,46.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒贝鲁恩|r交谈
    .turnin 78071 >>交任务: |cRXP_FRIENDLY_[Rush Order]|r
    .target Apprentice Beruun
    .accept 78072 >>接任务: |cRXP_WARN_[An Old Wound]|r
step
    .goto 108,37.5,64.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵魂献祭者奈穆兰|r交谈
    .complete 78072,1 --1/1 Speak to the Auchenai soulpriests
    .skipgossip 210575,1,1
    .timer 13,RP
    .target Soultender Nemuraan
    .target the Auchenai soulpriests
step
    .goto 108,38.18,69.71
    >>在黄色圆圈中使用你的|cRXP_WARN_[ExtraActionButton]|r
    .complete 78073,2 --1/1 Commune with Exarch Larohir
step
    #loop
    .goto 108,38.71,70.01,8,0
    .goto 108,38.17,70.17,8,0
    .goto 108,38.25,69.61,8,0
    >>与|cRXP_FRIENDLY_Shattrath受害者|r互动
    .complete 78073,3 --8/8 Shattrath Victims returned to rest
    .target Shattrath Victim
step
    .goto 108,38.10,69.65
    >>点击|cRXP_PICK_Ashes|r
    .complete 78073,4 --1/1 Exarch Larohir calmed
step
    .goto 108,42.35,67.79
    >>在黄色圆圈中使用你的|cRXP_WARN_[ExtraActionButton]|r
    .complete 78073,5 --1/1 Commune with Exarch Kelios
step
    #loop
    .goto 108,42.26,67.86,5,0
    .goto 108,42.65,68.12,5,0
    >>一旦你点燃一支蜡烛, 它最终会熄灭. 诀窍是在一支蜡烛熄灭后立即重新点燃, 但必须等到当前施法完成之后再进行. 这样, 所有蜡烛就能同时保持点亮状态
    .complete 78073,6 --1/1 Light all Karabor Prayer Candles at once
step
    .goto 108,42.34,67.92
    >>点击|cRXP_PICK_Ashes|r
    .complete 78073,7 --1/1 Exarch Kelios calmed
step
    .goto 108,41.53,61.88
    >>在黄色圆圈中使用你的|cRXP_WARN_[ExtraActionButton]|r
    .complete 78073,8 --1/1 Commune with Restalaan
step
    .goto 108,41.53,61.88
    .complete 78073,8 --1/1 Commune with Restalaan
    >>击杀|cRXP_ENEMY_死亡记忆|r
    .complete 78073,9 --2/2 Memories of Death slain
    .mob Memories of Death
step
    .goto 108,41.46,61.81
    >>点击|cRXP_PICK_Ashes|r
    .complete 78073,10 --1/1 Restalaan calmed
step
    .goto 108,37.09,62.88
    >>点击|cRXP_PICK_Ashes|r
    .complete 78074,2 --1/1 Request spoken to Hataaru's Ashes
step
    .goto 108,36.84,62.67
    >>点击|cRXP_PICK_Chest|r
    .complete 78074,3 --1/1 Exarch Hataaru's Artificing Lens
step
    .goto 111,39.06,46.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级工匠阿塔尼亚|r交谈
    .complete 78074,4 --1/1 Lens taken to Ataanya in Shattrath
    .timer 35,RP
    .skipgossip 210569,1
    .target High Artificer Ataanya
step
    #completewith next
    .cast 426620 >>使用 |T1686574:0|t[备用全息水晶]
    .use 210454
step
    .goto 103,55.36,79.03
    #title |cFFFCDC00跟随箭头指引|r
    .complete 78075,2 --1/1 Return to Romuul in the Exodar
step
    .goto 103,55.36,79.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠罗穆尔|r交谈
    .turnin 78075 >>交任务: |cRXP_FRIENDLY_[Moving Past]|r
    .target Grand Artificer Romuul
step
    .goto 103,53.97,76.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酋长哈屯|r交谈
    .accept 78076 >>接任务: |cRXP_WARN_[Emergency Efforts]|r
    .target Chieftain Hatuun
step
    .goto 103,53.68,75.70
    >>与|cRXP_FRIENDLY_Argussian Mana Ray.|r互动
    .complete 78076,1 --1/1 Argussian Mana Ray mounted
    .timer 90,RP
    .target Argussian Mana Ray
step
    .goto 106,52.17,74.11
    >>等待目标完成后继续
    .complete 78076,2 --1/1 Ride to Bloodmyst Isle
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r和|cRXP_FRIENDLY_Arzaal|r和|cRXP_FRIENDLY_酋长哈图恩|r交谈
    .turnin 78076 >>交任务: |cRXP_FRIENDLY_[Emergency Efforts]|r
    .goto 106,52.02,75.59
    .target +Prophet Velen
    .accept 78078 >>接任务: |cRXP_WARN_[Assessing the Enemy]|r
    .goto 106,51.92,75.68
    .target +Arzaal
    .accept 78077 >>接任务: |cRXP_WARN_[Beneath the Skin]|r
    .goto +106,51.88,75.54
    .target Chieftain Hatuun
step
    #hidewindow
    #completewith Pitted Bones
    #loop
    +1
    .goto 106,57.35,67.53,40,0
    .goto 106,54.84,68.3,40,0
    .goto 106,52.39,68.94,40,0
    .goto 106,49.79,72.78,40,0
    .goto 106,49.77,77.47,40,0
    .goto 106,52.67,80.43,40,0
step
    #completewith next
    >>击杀|cRXP_ENEMY_受感染的夜刃豹|r和|cRXP_ENEMY_腐化的灰熊|r. 从它们身上搜刮 [|cRXP_LOOT_被附魔的骨头|r]
    .complete 78077,1 --8/8 Pitted Bones
    .mob Infected Nightsaber
    .mob Corrupted Grizzly
step
    >>点击|cRXP_PICK_Totems|r
    .complete 78078,1 --6/6 Satyr Totem
    .goto 106,55.53,74.1
step
    #label Pitted Bones
    .goto 106,54.08,74.12
    .complete 78077,1 --8/8 Pitted Bones
    .mob Infected Nightsaber
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酋长哈图恩|r和|cRXP_FRIENDLY_阿尔扎尔|r和|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 78077 >>交任务: |cRXP_FRIENDLY_[Beneath the Skin]|r
    .goto 106,51.87,75.51
    .target +Chieftain Hatuun
    .turnin 78078 >>交任务: |cRXP_FRIENDLY_[Assessing the Enemy]|r
    .goto 106,51.92,75.68
    .target +Arzaal
    .accept 78079 >>接任务: |cRXP_WARN_精准铲除|r
    .goto 106,52.02,75.59
    .target +Prophet Velen
step
    .goto 106,43.85,77.68
    #title |cFFFCDC00跟随箭头指引|r
    .complete 78079,1 --1/1 Meet Velen and Hatuun in Nazzivian
step
    .goto 106,41.6,77.85
    >>点击|cRXP_PICK_Evidence|r
    .complete 78079,2,1 --3/3 Man'ari evidence found
step
    .goto 106,35.72,80.89
    >>点击|cRXP_PICK_Evidence|r
    .complete 78079,2,2 --3/3 Man'ari evidence found
step
    .goto 106,36.53,71.94
    >>点击|cRXP_PICK_Evidence|r
    .complete 78079,2,3 --3/3 Man'ari evidence found
step
    .goto 106,39.47,67.78,20,0
    .goto 106,42.27,36.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 78079 >>交任务: |cRXP_FRIENDLY_精准铲除|r
    .target Prophet Velen
step
    .goto 106,42.22,36.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿扎尔|r交谈
    .accept 78080 >>接任务: |cRXP_WARN_[At the Source]|r
    .timer 40,RP
    .target Arzaal
step
    .goto 106,41.47,33.07
    #title |cFFFCDC00跟随箭头指引|r
    .complete 78080,1 --1/1 Source of fel revealed
step
    .goto 106,41.47,33.07
    .cast 428008 >>使用你的 |cRXP_WARN_[ExtraActionButton]|r
    .timer 20,RP
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velen|r交谈
    .complete 78080,3 --1/1 Speak to Velen
    .skipgossip 210605,1
    .target Velen
step
    .goto 106,41.84,32.20
    >>保卫|r cRXP_FRIENDLY_Velen|r的船员
    *|cFFFF0000After completing the objective, you can skip the cutscene by pressing 'Escape' and accepting the prompt.|r
    .complete 78080,4 --1/1 Generator defended
    .mob Axxarien Fleshrender
    .mob Axxarien Ragehide
    .mob Sironas
step
    .goto 106,41.47,33.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 78080 >>交任务: |cRXP_FRIENDLY_[At the Source]|r
    .target Prophet Velen
    .accept 78081 >>接任务: |cRXP_WARN_[Pain Recedes]|r
step
    #completewith next
    .cast 426620 >>使用 |T1686574:0|t[备用全息水晶]
    .use 210454
step
    .goto 103,54.72,80.66
    #title |cFFFCDC00跟随箭头指引|r
    .complete 78081,2 --1/1 Return to Velen in the Exodar
step
    .goto 103,54.72,80.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 78081 >>交任务: |cRXP_FRIENDLY_[Pain Recedes]|r
    .target Prophet Velen
    .accept 78082 >>接任务: |cRXP_WARN_[A Burden Shared]|r
step
    .goto 103,55.47,79.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠罗穆尔|r交谈
    .complete 78082,1,1 --10/10 Memory Stones collected
    .skipgossip
    .target Grand Artificer Romuul
step
    .goto 103,55.62,78.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等工匠阿塔亚|r交谈
    .complete 78082,1,2 --10/10 Memory Stones collected
    .skipgossip
    .target High Artificer Ataanya
step
    .goto 103,57.32,92.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官波鲁斯|r交谈
    .complete 78082,1,3 --10/10 Memory Stones collected
    .skipgossip
    .target Vindicator Boros
step
    .goto 103,57.18,93.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿扎尔|r交谈
    .complete 78082,1,4 --10/10 Memory Stones collected
    .skipgossip
    .target Arzaal
step
    .goto 103,47.73,81.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高等女牧师伊沙娜|r交谈
    .complete 78082,1,5 --10/10 Memory Stones collected
    .skipgossip
    .target High Priestess Ishanah
step
    .goto 103,53.74,84.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酋长哈屯|r交谈
    .complete 78082,1,6 --10/10 Memory Stones collected
    .skipgossip 210671,1
    .target Chieftain Hatuun
step
    .goto 103,53.86,83.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .complete 78082,1,7 --10/10 Memory Stones collected
    .skipgossip
    .target Prophet Velen
step
    .goto 103,57.18,69.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳艾尔执政官|r交谈
    .complete 78082,1,8 --10/10 Memory Stones collected
    .skipgossip
    .target Exarch Naielle
step
    .goto 103,68.34,80.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_预言者努波顿|r交谈
    .complete 78082,1,9 --10/10 Memory Stones collected
    .skipgossip 212343,1
    .target Farseer Nobundo
step
    .goto 103,67.88,85.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿卡玛|r交谈
    .complete 78082,1,10 --10/10 Memory Stones collected
    .skipgossip 212349,1
    .target Akama
step
    .goto 103,64.39,87.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贫瘠之地陶拉祖营地的|cRXP_FRIENDLY_大锚匠阿尔莫宁|r交谈
    .complete 78082,2 --1/1 Personal Memory Stone created
    .skipgossip 212387,1,1
    .target Grand Anchorite Almonen
step
    .goto 103,65.15,87.66
    >>使用你的 |cRXP_WARN_[ExtraActionButton]|r
    .complete 78082,3 --1/1 Memory Stones dissolved
step
    .goto 103,64.40,87.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贫瘠之地陶拉祖营地的|cRXP_FRIENDLY_大锚匠阿尔莫宁|r交谈
    .turnin 78082 >>交任务: |cRXP_FRIENDLY_[A Burden Shared]|r
    .target Grand Anchorite Almonen
    .accept 78083 >>接任务: |cRXP_WARN_[Our Path Forward]|r
step
    .goto 103,54.74,80.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .complete 78083,1 --1/1 Ask Velen to begin the ceremony
    .skipgossip 212402,1
    .target Prophet Velen
step
    .goto 103,54.74,80.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知维伦|r交谈
    .turnin 78083 >>交任务: |cRXP_FRIENDLY_[Our Path Forward]|r
    .target Prophet Velen
]])

--Worgen
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bf) 狼人传承护甲
#displayname  |cFF1EFF006|r - 狼人
#next (bg) 虚空精灵

<< Alliance

step
    #label StartIncludePrepGuide
    .goto 84,54.81,18.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_信使克拉奇德|r交谈
    .accept 54976 >>接任务: |cRXP_WARN_吉尔尼斯之影|r
    .target Courier Claridge
step
    .goto 84,82.50,28.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苔丝·格雷迈恩公主|r交谈
    .turnin 54976 >>交任务: |cRXP_FRIENDLY_吉尔尼斯之影|r
    .target Princess Tess Greymane
step
    .goto 84,82.35,27.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米亚·格雷迈恩|r交谈
    .accept 54977 >>接任务: |cRXP_WARN_进入暮色森林|r
    .target Mia Greymane
step
    #loop
    .goto 47,18.29,57.21,2,0
    .goto 47,18.09,57.23,2,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .turnin 54977 >>交任务: |cRXP_FRIENDLY_进入暮色森林|r
    .target Vassandra Stormclaw
    .accept 54980 >>接任务: |cRXP_WARN_夜行狼人之灾|r
step
    .goto 47,52.01,61.63
    >>点击|cRXP_PICK_Pungent Meat|r
    .complete 54980,1 --1/1 Pungent Meat placed (Optional)
step
    .goto 47,52.01,61.63
    >>击杀|cRXP_ENEMY_Bloodeyes|r
    *|cRXP_WARN_使用|r[额外动作按钮] when it's available.
    .complete 54980,2 --1/1 Bloodeyes subdued
    .mob Bloodeyes
step
    .goto 47,18.10,57.23
    #title |cFFFCDC00跟随箭头指引|r
    .complete 54980,3 --1/1 Bloodeyes brought to Raven Hill
step
    #loop
    .goto 47,18.29,57.21,2,0
    .goto 47,18.09,57.23,2,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .turnin 54980 >>交任务: |cRXP_FRIENDLY_夜行狼人之灾|r
    .target Vassandra Stormclaw
    .accept 54981 >>接任务: |cRXP_WARN_向月嚎叫|r
    .accept 54982 >>接任务: |cRXP_WARN_猎人之魂|r
step
    #completewith next
    >>击杀|cRXP_ENEMY_Mistfang Alpha|r. 击杀它们以获取 [|cRXP_LOOT_Bloodstained Fangs|r]
    .complete 54982,1 --6/6 Bloodstained Fangs
    .mob Mistfang Alpha
step
    .goto 47,82.36,33.95
    >>点击|cRXP_PICK_艾露恩的赐福|r
    .complete 54981,1 --1/1 Elune's Grace
step
    #label EndIncludePrepGuide
    #loop
    .goto 47,77.27,35.49,15,0
    .goto 47,77.3,30.53,15,0
    .goto 47,81.7,33.46,15,0
    >>击杀|cRXP_ENEMY_Mistfang Alpha|r. 击杀它们以获取 [|cRXP_LOOT_Bloodstained Fangs|r]
    .complete 54982,1 --6/6 Bloodstained Fangs
    .mob Mistfang Alpha
step
    .goto 47,46.39,36.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .turnin 54981 >>交任务: |cRXP_FRIENDLY_向月嚎叫|r
    .target Vassandra Stormclaw
    .turnin 54982 >>交任务: |cRXP_FRIENDLY_猎人之魂|r
    .accept 54983 >>接任务: |cRXP_WARN_梦境初醒|r
step
    .goto 47,46.39,36.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .complete 54983,1 --1/1 Speak with Vassandra Stormclaw
    .timer 56,RP
    .skipgossip
    .target Vassandra Stormclaw
step
    .goto 47,46.60,36.98
    >>击杀 |cRXP_ENEMY_愤怒之灵|r
    .complete 54983,2 --1/1 Defend Vassandra during the ritual
    .mob Spirit of Fury
step
    .goto 47,46.58,36.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈德林|r交谈
    .turnin 54983 >>交任务: |cRXP_FRIENDLY_梦境初醒|r
    .target Goldrinn
    .accept 54984 >>接任务: |cRXP_WARN_梦境之狼|r
step
    #completewith scenario
    .goto 47,46.58,35.81,10 >>进入传送门
step
    .isOnQuest 54984
    .goto 1577,65.91,20.95
    .cast 295507 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苔丝·格雷迈恩公主|r交谈(下马时)|cRXP_WARN_while dismounted.|r
    *|cRXP_WARN_You might have to do a /reload to see the arrow again.|r
    .timer 23,RP
    .skipgossip 150851,2
    .target Princess Tess Greymane
step
    .isOnQuest 54984
    .goto 1577,65.24,21.1
    >>等待目标完成
    .scenario 4186,1 --Wake Tess
step
    .isOnQuest 54984
    #loop
    .goto 1577,60.87,27.63,20,0
    .goto 1577,57.23,26.71,20,0
    .goto 1577,60.08,33.58,20,0
    .goto 1577,58.63,40.39,20,0
    >>击杀|cRXP_ENEMY_Forsakens|r并点击|cRXP_PICK_Plaguethrowers|r
    .scenario 4187,1 --Fight back the Forsaken
    .mob Plague Thrower
    .mob Phantasmal Stalker
    .mob Lumbering Nightmare
step
    .isOnQuest 54984
    .goto 1577,60.07,40.7
    >>击杀|cRXP_ENEMY_黑暗游侠西亚拉|r|cRXP_WARN_小心那些可怕的马匹. |r
    .scenario 4188,1
    .mob Dark Ranger Thyala
-- step
--     .isOnQuest 54984
--     .goto 1577,60.07,40.7
--     >>击杀|cRXP_ENEMY_黑暗游侠西亚拉|r|cRXP_WARN_小心那些可怕的马匹. |r
--     .scenario 4189,1
--     .mob Dark Ranger Thyala
step
    .isOnQuest 54984
    .goto 1577,68.93,44.58,15,0
    .goto 1577,68.74,44.68,15,0
    .goto 1577,70.31,55.25,15,0
    .goto 1577,66.03,63.33,15,0
    .goto 1577,66.03,63.33,10 >>跟随箭头指引
    .timer 15,RP
step
    .isOnQuest 54984
    .goto 1577,66.03,63.33
    .countdown 30 >>等待纳萨诺斯出现并击败他
step
    .isOnQuest 54984
    .goto 1577,66.99,79.31
    >>跟随箭头并击杀|cRXP_ENEMY_幻影潜行者|r
    .scenario 4189,1
    .mob Phantasmal Stalker
step
    .isOnQuest 54984
    .goto 1577,58.59,68.1
    >>击杀|cRXP_ENEMY_Nathanos|r
    .scenario 4190,1
    .mob Nathanos
step
    .isOnQuest 54984
    .goto 1577,60.91,71.3,10,0
    .goto 1577,61.35,81.86,10,0
    .goto 1577,40.72,81.89,10,0
    .goto 1577,41.32,76,10,0
    .goto 1577,36.79,62.62,10 >>跟随箭头指引
    .timer 60,RP
step
    #label scenario
    .isOnQuest 54984
    .goto 1577,33.95,66.3
    >>击杀|cRXP_ENEMY_狂暴之魂|r
    .complete 54984,1 --Guide Tess through the Emerald Dream
    .mob Essence of Rage
step
    .isOnQuest 54984
    .goto 1577,33.65,67.84
    .zone 47 >>点击传送门
step
    .goto 47,46.34,37.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苔丝·格雷迈恩公主|r交谈
    .turnin 54984 >>交任务: |cRXP_FRIENDLY_梦境之狼|r
    .target Princess Tess Greymane
    .accept 54990 >>接任务: |cRXP_WARN_新的守护者|r
step
    .goto 84,82.50,28.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暴风要塞的|cRXP_FRIENDLY_Tess交谈|r
    .complete 54990,1 --1/1 Speak with Tess at Stormwind Keep
    .timer 15,RP
    .skipgossip 155313,1
    .target Tess at Stormwind Keep
step
    .goto 84,82.51,27.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苔丝·格雷迈恩公主|r交谈
    .turnin 54990 >>交任务: |cRXP_FRIENDLY_新的守护者|r
    .target Princess Tess Greymane
]])

--Void Elf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name (bg) 虚空精灵
#displayname |cFF1EFF007|r - 虚空精灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bh) 光铸德莱尼

<< Allianc

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 84 >>前往: |cRXP_PICK_暴风城|r
step
    .goto 84,50.7,8.44
    .zone 971 >>点击|cRXP_PICK_Rift to Telogrus|r
step
    .goto 971,28.53,22.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 49928 >>交任务: |cRXP_FRIENDLY_虚空的传承|r
    .target Alleria Windrunner
]])

--光铸德莱尼
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bh) 光铸德莱尼
#displayname |cFF1EFF008|r - 光铸德莱尼 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BI) 黑铁矮人

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 84 >>前往: |cRXP_PICK_暴风城|r
step
    .goto 84,48.08,11.13
    .zone 940 >>点击 |cRXP_PICK_Lightforged 信标|r
step
    .goto 940,49.21,43.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Captain Fareeya|r交谈
    .target Captain Fareeya
    .turnin 49782 >>交任务: |cRXP_FRIENDLY_光铸者的传承|r
]])

--Dark Iron Dwarf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name BI) 黑铁矮人
#displayname |cFF1EFF009|r - 黑铁矮人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bj) 库尔提拉斯

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith Heritage of the
    .goto 84,49.73,10.66
    >>点击|cRXP_PICK_Mole Machine|r前往暗铸城
    .target Mole Machine to Shadowforge City
step
    #completewith Heritage of the
    >>使用|T1786409:0|t[挖掘机]前往影铁城
    .use 265225
step
    #label Heritage of the
    .goto 971,28.53,22.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 51483 >>交任务: |cRXP_FRIENDLY_黑铁的传承|r
    .target Alleria Windrunner
]])

--Kul Tiran
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bj) 库尔提拉斯
#displayname |cFF1EFF0010|r - 库尔提拉斯人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BK) 机械侏儒

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 1161 >>前往博拉苏
step
    .goto 1161,43.94,62.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯瑟琳·普罗德摩尔|r交谈
    .turnin 53722 >>交任务: |cRXP_FRIENDLY_库尔提拉斯的传承|r
    .target Katherine Proudmoore
]])

--Mechagnome
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name BK) 机械侏儒
#displayname |cFF1EFF0011|r - 机械侏儒 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bl) 传承 地质矮人

<< Alliance

step
    #label StartIncludePrepGuide
    #completewith Heritage of the Mechagnome
    .zone 84 >>前往: |cRXP_PICK_暴风城|r
step
    #completewith Heritage of the Mechagnome
    .goto 84,48.47,8.65
    .zone 1573 >>踏上传送器前往机械侏儒
step
    #label Heritage of the Mechagnome
    .goto 1573,18.67,67.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与埃拉兹敏王子(|cRXP_FRIENDLY_Prince Erazmin|r)交谈
    .turnin 58436 >>交任务: |cRXP_FRIENDLY_机械侏儒的传承|r
    .target Prince Erazmin
]])

-----------------------------------------------------
--- HORDE
-----------------------------------------------------

--Orc
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name b) 兽人种族护甲
#displayname |cFF1EFF001|r - 兽人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA) 亡灵遗产护甲

<< Horde

step
    #label StartIncludePrepGuide
    #completewith next
    .goto 85,50.01,75.88,10,0 >>进入格罗玛什要塞
step
    .goto 85,50.1,74.48,5,0
    .goto 85,49.26,73.73,6,0
    .goto 85,49.21,72.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .turnin 73703 >>交任务: |cRXP_FRIENDLY_奥格瑞玛的召唤|r
    .accept 72462 >>接任务: |cRXP_WARN_需要治愈的人民|r
    .target Eitrigg
step
    .goto 85,49.26,73.78,5,0
    .goto 85,49.99,74.61,5,0
    .goto 85,49.94,75.75,5,0
    .goto 85,51.15,78.94
    >>点击|cRXP_PICK_Portal.|r
    .complete 72462,1 --1/1 Portal to Alterac Valley taken
    .timer 100,RP
step
    #completewith next
    .isOnQuest 72462
    >>等待伊崔格到达
    .scenario 5388,1
    .target Eitrigg
step
    .isOnQuest 72462
    .goto 2162,48.83,83.96,15,0
    .goto 2162,48.73,86.09,15,0
    .goto 2162,47.8,86.44,15,0
    .goto 2162,47.51,86.19,15,0
    .goto 2162,47.11,86.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .scenario 5388,2
    .skipgossip
    .target Eitrigg
step
    .isOnQuest 72462
    .goto 2162,47.1,86.58
    >>等待先知德雷克塔尔到达
    .scenario 5388,1
    .target Farseer Drek'Thar
step
    .isOnQuest 72462
    .goto 2162,47.1,86.58
    >>点击|cRXP_PICK_Totem of Air|r
    .scenario 5389,2,1
    .target Totem of Air
step
    .isOnQuest 72462
    .goto 2162,47.31,86.35
    >>点击|cRXP_PICK_水之图腾|r
    .scenario 5389,2,2
    .target Totem of Water
step
    .isOnQuest 72462
    .goto 2162,47.52,87.32
    >>点击|cRXP_PICK_火焰图腾|r
    .scenario 5389,2,3
    .target Totem of Fire
step
    .isOnQuest 72462
    .goto 2162,47.26,87.3
    >>点击|cRXP_PICK_大地图腾|r
    .scenario 5389,2,4
    .target Totem of Earth
step
    .isOnQuest 72462
    .goto 2162,47.11,86.98
    >>等待目标完成
    .scenario 5389,1
step
    .isOnQuest 72462
    .goto 2162,47.11,86.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知德雷克塔尔|r交谈
    .scenario 5390,1,1
    .timer 20,RP
    .skipgossip
    .target Farseer Drek'Thar
step
    .isOnQuest 72462
    .goto 2162,47.41,86.84
    >>击杀|cRXP_ENEMY_杜洛斯|r和|cRXP_ENEMY_德拉卡|r
    .timer 20,RP
    .scenario 5390,2
    .scenario 5390,3
    .mob Duros
    .mob Drakan
step
    .isOnQuest 72462
    .goto 2162,47.1,86.58,10,0
    .goto 2162,47.31,86.35,10,0
    .goto 2162,47.52,87.32,10,0
    .goto 2162,47.26,87.3,10,0
    .goto 2162,47.41,86.84
    >>击杀|cRXP_ENEMY_Totems|r, 然后击杀|cRXP_ENEMY_Elemental Projection.|r
    .scenario 5396,1
    .mob Elemental Projection
step
    .goto 2162,47.42,86.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈并使用|T413582:0|t[萨尔的炉石]
    .scenario 5422,1
    .skipgossip
    .target Thrall
step
    .goto 85,54.37,78.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .complete 72462,2 --1/1 Complete Scenario "The Future of Our People"
    .target Aggra
step
    .goto 85,54.31,78.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿格娜|r交谈
    .turnin 72462 >>交任务: |cRXP_FRIENDLY_需要治愈的人民|r
    .target Aggra
    .accept 72464 >>接任务: |cRXP_WARN_克许哈格祭典|r
step
    .goto 85,53.2,78.96,10,0
    .goto 1,52.21,43.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知阿格兰|r交谈以开始奥姆戈拉任务
    .complete 72464,2 --1/1 Talk to Farseer Aggralan to begin the Om'gora
    .skipgossip 199148,2
    .target Farseer Aggralan
step
    .goto 1,52.20,43.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知阿格兰|r交谈
    .turnin 72464 >>交任务: |cRXP_FRIENDLY_克许哈格祭典|r
    .target Farseer Aggralan
step
    .goto 1,52.20,43.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知阿格兰|r交谈
    .turnin 72464 >>交任务: |cRXP_FRIENDLY_克许哈格祭典|r
    .target Farseer Aggralan
    .accept 72465 >>接任务: |cRXP_WARN_大地祝福|r
    .accept 72476 >>接任务: |cRXP_WARN_先祖祝福|r
    .accept 72467 >>接任务: |cRXP_WARN_氏族祝福|r
step
    .goto 1,53.54,42.61,10,0
    .goto 1,53.91,42.89,10,0
    .goto 1,54.01,42.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thega Graveblade|r交谈并接受任务提示
    *|cRXP_WARN_The clan can be changed at a later time if you want.|r
    .complete 72467,1 --1/1 Clan Chosen
    .skipgossip 199151,1
    .target Thega Graveblade
step
    .goto 1,52.11,42.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .accept 74581 >>接任务: |cRXP_WARN_长匕|r
    .target Eitrigg
step
    .goto 1,50.73,42.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .turnin 72476 >>交任务: |cRXP_FRIENDLY_先祖祝福|r
    .target Cook Torka
    .accept 74374 >>接任务: |cRXP_WARN_传家珍宝|r
step
    .goto 1,50.76,42.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿露基|r交谈并学习烹饪
    .complete 74374,2 --Cooking Learned
    .target Arugi
step
    .goto 1,51.67,42.36,10,0
    .goto 1,51.83,41.97,10,0
    .goto 1,51.66,41.23
    >>点击|cRXP_PICK_旧食谱|r
    .complete 74374,1 --1/1 Old Cookbook Collected
step
    .goto 1,51.83,41.97,10,0
    .goto 1,51.67,42.36,10,0
    .goto 1,50.75,42.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .turnin 74374 >>交任务: |cRXP_FRIENDLY_传家珍宝|r
    .target Cook Torka
    .accept 72477 >>接任务: |cRXP_WARN_兽人杂货铺|r
step
    .goto 1,50.78,42.72
    >>点击|cRXP_PICK_Spoons and Forks.|r
    .complete 72477,1 --1/1 "Spoons and Forks" Read
step
    .goto 1,50.72,43.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_屠夫努尔拉|r交谈
    .complete 72477,10 --3/3 Fresh Talbuk Steak
    .skipgossip
    .buy 202027,3
    .target Nula the Butcher
step
    .goto 1,51.10,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏加|r交谈
    .skipgossip
    .buy 202029,3
    .buy 202707,2
    .buy 204793,3
    .complete 72477,6 --3/3 Isle Lemon
    .complete 72477,7 --3/3 Suja's Sweet Salt
    .complete 72477,4 --2/2 Un'goro Coconut
    .target Suja
step
    #completewith next
    .goto 1,51.39,44.19
    .cast 6478 >>点击|cRXP_PICK_箱子|r
step
    #loop
    .goto 1,51.38,44.18,15,0
    .goto 1,51.08,43.86,15,0
    .goto 1,51.34,43.44,15,0
    >>点击 |cRXP_PICK_逃脱的螃蟹|r
    .complete 72477,2 --2/2 Durotar Coast Crab
    .target Escaped Crab
step
    .goto 1,51.58,43.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹加尔|r交谈
    .complete 72477,5 --3/3 Southfury Salmon
    .skipgossip
    .buy 202028,5
    .target Razgar
step
    .goto 1,51.30,42.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kyl'kahn|r交谈
    .complete 72477,11 --1/1 Keg of Ancestral Ale
    .skipgossip
    .target Kyl'kahn
step
    .goto 1,50.84,41.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Far'kul 炎舌|r交谈
    .buy 202706,3
    .buy 202030,3
    .buy 202031,2
    .complete 72477,9 --3/3 Zandali Piri Piri
    .complete 72477,8 --3/3 Ground Gorgrond Pepper
    .complete 72477,3 --2/2 Farahlon Fenugreek
    .skipgossip
    .target Far'kul Flametongue
step
    .goto 1,50.79,42.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_杜莱克|r, 就在你旁边
    .turnin 72477 >>交任务: |cRXP_FRIENDLY_兽人杂货铺|r
    .target Durak
    .accept 74415 >>接任务: |cRXP_WARN_适合的贡品|r
step
    .goto 1,40.80,26.88
    >>点击|cRXP_PICK_骷髅|r
    .complete 72465,1 --1/1 Find the Spirit of Thunder Ridge
step
    .goto 1,40.59,26.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷霆岭之灵|r交谈
    .turnin 72465 >>交任务: |cRXP_FRIENDLY_大地祝福|r
    .target The Spirit of Thunder Ridge
    .accept 72466 >>接任务: |cRXP_WARN_雷霆山之魂|r
step
    .goto 1,40.31,27.69
    >>点击|cRXP_PICK_Ancient Seed|r
    *|cRXP_WARN_Kill spawning |cRXP_ENEMY_Mud Elemental|r|r
    .complete 72466,1 --8/8 Ancient Seed
    .mob Mud Elemental
step
    #loop
    .goto 1,40.43,28.72,20,0
    .goto 1,40.34,29.63,20,0
    .goto 1,40.93,30.03,20,0
    .goto 1,40.83,30.73,20,0
    .goto 1,39.11,28.19,20,0
    .goto 1,38.92,27.84,20,0
    .goto 1,38.87,26.99,20,0
    >>点击|cRXP_PICK_Ancient Seed|r
    *|cRXP_WARN_Kill spawning |cRXP_ENEMY_Mud Elemental|r|r
    .complete 72466,1 --8/8 Ancient Seed
    .mob Mud Elemental
    .mob Eroded Stone Elemental
    .mob Flood Elemental
step
    .goto 1,40.48,26.90
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72466,2 --1/1 Return to the Ancient Skeleton
step
    .goto 1,40.60,26.77
    >>点击|cRXP_PICK_雷霆岭的幽灵|r
    .complete 72466,3 --1/1 Seeds Planted in Ancient Skeleton
    .target The Spirit of Thunder Ridge
step
    .goto 1,52.21,42.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知阿格兰|r交谈
    .turnin 72466 >>交任务: |cRXP_FRIENDLY_雷霆山之魂|r
    .target Farseer Aggralan
step
    .goto 1,50.79,42.69
    >>打开专业技能书并选择烹饪；烹饪以下物品
    .complete 74415,3 --2/2 Curried Coconut Crab Cooked
    .complete 74415,1 --3/3 Grilled Southfury Salmon Cooked
    .complete 74415,2 --3/3 Seared Spicy Talbuk Steak Cooked
step
    .goto 1,50.79,42.69
    >>厨师 |T2066013:0|t[祖先盛宴]
    .complete 74415,4 --1/1 Feast for the Ancestors Cooked
step
    .goto 1,53.13,45.76
    >>点击|cRXP_PICK_Feast 祭奠祖先
    .complete 74415,5 --1/1 Feast for the Ancestors Placed
step
    .goto 461,45.20,68.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .turnin 74581 >>交任务: |cRXP_FRIENDLY_长匕|r
    .target Kaltunk
    .accept 72474 >>接任务: |cRXP_WARN_[Tracking a Killer]|r
step
    .goto 461,43.4,70.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡朗尼沙|r交谈
    .complete 72474,1,1 --5/5 Clues found
    .skipgossip
    .target Karranisha
step
    >>跟随箭头指示, 前往|cRXP_FRIENDLY_苦工|r附近等待
    .complete 72474,1,2 --5/5 Clues found
    .skipgossip
    .goto 461,46.01,63.39
    .target Dead Peon
step
    .goto 461,49.98,59.98
    >>点击|cRXP_PICK_仙人掌果袋|r
    .accept 72463 >>接任务: |cRXP_WARN_[Galgar's Cactus Apple Surprise...]|r
    .target Bag of Cactus Apples
step
    .goto 461,49.98,59.98
    >>点击|cRXP_PICK_仙人掌果袋|r
    .complete 72463,1 --1/1 Bag of Cactus Apples
    .complete 72474,1,3 --5/5 Clues found
step
    .goto 461,54.25,62.52
    >>点击|cRXP_PICK_野兽踪迹|r
    .complete 72474,1,4 --5/5 Clues found
    .skipgossip
step
    .goto 461,52.42,68.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Terrified Peon|r交谈
    .complete 72474,1,5 --5/5 Clues found
    .skipgossip
    .target Terrified Peon
step
    .goto 461,45.13,68.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .turnin 72474 >>交任务: |cRXP_FRIENDLY_[Tracking a Killer]|r
    .target Kaltunk
    .accept 72475 >>接任务: |cRXP_WARN_[Cornering Gor'krosh]|r
-- step
--     .goto 461,42.94,62.42
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
--     .turnin 72463 >>交任务: |cRXP_FRIENDLY_[Galgar's Cactus Apple Surprise...]|r
--     .target Galgar
step
    .goto 1,59.28,63.38
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72475,1 --Trail Followed
step
    #completewith next
    .goto 1,59.28,63.38
    .cast 384743 >>点击|cRXP_PICK_迅猛龙巢穴|r
    .timer 5,RP
step
    .goto 1,59.15,63.43
    >>击杀|cRXP_ENEMY_Gor'krosh.|r, 从他们身上搜刮 [|cRXP_LOOT_长匕首|r]
    .complete 72475,2 --1/1 Gor'krosh slain
    .complete 72475,4 --1/1 "Long Knife" Collected
    .mob Gor'krosh
step
    #label EndIncludePrepGuide
    .goto 1,59.14,63.51
    >>点击|cRXP_PICK_迅猛龙鲜血|r
    .complete 72475,3 --1/1 Blood of Gor'krosh
step
    .goto 1,52.20,42.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知阿格兰|r交谈
    .turnin 72467 >>交任务: |cRXP_FRIENDLY_氏族祝福|r
    .turnin 74415 >>交任务: |cRXP_FRIENDLY_适合的贡品|r
    .turnin 72475 >>交任务: |cRXP_FRIENDLY_[Cornering Gor'krosh]|r
    .target Farseer Aggralan
    .accept 72478 >>接任务: |cRXP_WARN_荣誉与荣耀|r
step
    #completewith Boss Magor
    >>点击所有|cRXP_PICK_Food.|r杀死|cRXP_ENEMY_Rowdy Warlock|r和|cRXP_ENEMY_Rowdy Grunt.|r
    .complete 72478,1 --Enjoy the Feast! (100%)
    .mob Rowdy Warlock
    .mob Rowdy Grunt
step
    #completewith Boss Magor
    .goto 1,52.48,40.95
    .gossipoption 108372 >>与|cRXP_FRIENDLY_Boss Magor|r交谈
    .timer 10,RP
    .target Boss Magor
step
    #label Boss Magor
    .goto 1,52.06,42.15
    >>击杀|cRXP_ENEMY_Boss Magor. |r拾取一个|cRXP_PICK_训诫靴|r, 并在他施放|cRXP_WARN_Bootstorm|r时使用你的|cRXP_WARN_ExtraActionButton|r
    .complete 72478,2 --1/1 Brawl with Boss Magor and the Peons
    .mob Boss Magor
    .target Boss Magor
step
    #loop
    .goto 1,52.2,42.31,30,0
    .goto 1,52.5,41.5,30,0
    .goto 1,52.95,42.85,30,0
    .goto 1,52.33,43.32,30,0
    >>点击所有|cRXP_PICK_Food.|r杀死|cRXP_ENEMY_Rowdy Warlock|r和|cRXP_ENEMY_Rowdy Grunt.|r
    .complete 72478,1 --Enjoy the Feast! (100%)
    .mob Rowdy Warlock
    .mob Rowdy Grunt
step
    .goto 1,52.25,43.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 72478 >>交任务: |cRXP_FRIENDLY_荣誉与荣耀|r
    .target Thrall
    .accept 72479 >>接任务: |cRXP_WARN_历久弥新|r
step
    .goto 1,52.26,43.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .turnin 72479 >>交任务: |cRXP_FRIENDLY_历久弥新|r
    .target Eitrigg
]])

--Undead
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name BA) 亡灵遗产护甲
#displayname |cFF1EFF002|r - 亡灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bc) 牛头人传承护甲

<< Horde

step
    #label StartIncludePrepGuide
    .goto 85,50.70,75.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Calia 米奈希尔|r交谈
    .accept 65656 >>接任务: |cRXP_WARN_洛丹伦的召唤|r
    .target Calia Menethil
step
    .goto 85,50.85,75.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幽暗城的亡灵巫师(Forsaken Dreadmage)|r交谈
    .complete 65656,1 --1/1 Speak to Forsaken Dreadmage for a teleport
    .skipgossip
    .target Forsaken Dreadmage
step
    .goto 2070,60.83,51.98,10,0
    .goto 2070,60.80,51.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Calia 米奈希尔|r交谈
    .turnin 65656 >>交任务: |cRXP_FRIENDLY_洛丹伦的召唤|r
    .target Calia Menethil
    .accept 65657 >>接任务: |cRXP_WARN_集结被遗忘者|r
step
    .goto 2070,61.97,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r交谈
    .accept 65658 >>接任务: |cRXP_WARN_这是我们的土地|r
    .complete 65657,1 --1/1 Speak to Dark Ranger Velonara
    .skipgossip
    .target Dark Ranger Velonara
step
    .goto 2070,63.47,49.21
    >>击杀|cRXP_ENEMY_Blighted 士兵和暗影法师|r
    .complete 65658,1 --8/8 Blighted Soldiers and Shadowmages slain
    .mob Blighted Soldiers
    .mob Blighted Shadowmages
step
    .goto 2070,63.23,55.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
    .complete 65657,3 --1/1 Speak to Master Apothecary Faranell
    .skipgossip 185794,1
    .target Master Apothecary Faranell
step
    .goto 2070,57.57,49.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .complete 65657,2 --1/1 Speak to Lilian Voss
    .target Lilian Voss
    .skipgossip 185793,1
step
    .goto 2070,60.84,51.96,10,0
    .goto 2070,60.80,51.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r交谈
    .turnin 65658 >>交任务: |cRXP_FRIENDLY_这是我们的土地|r
    .target Dark Ranger Velonara
step
    .goto 2070,60.90,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 65657 >>交任务: |cRXP_FRIENDLY_集结被遗忘者|r
    .target Lilian Voss
    .accept 65659 >>接任务: |cRXP_WARN_凋零会议|r
step
    #completewith next
    .gossipoption 54673 >>与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .timer 50,RP
    .target Lilian Voss
step
    .goto 2070,60.79,51.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加莉亚·哈斯汀|r 交谈
    .complete 65659,3 --1/1 Speak to Calia
    .skipgossip 185512,1
    .target Calia
step
    .goto 2070,61.97,55.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Calia 米奈希尔|r交谈
    .turnin 65659 >>交任务: |cRXP_FRIENDLY_凋零会议|r
    .target Calia Menethil
    .accept 65660 >>接任务: |cRXP_WARN_与信仰同行|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加莉亚·哈斯汀|r 交谈
    .complete 65660,1 --1/1 Speak to Calia to Begin
    .skipgossip
    .target Calia
step
    >>保卫|cRXP_FRIENDLY_凯莉娅·梅纳西尔. |r一旦激活, 请使用你的|cRXP_WARN_[额外动作按钮]|r
    .complete 65660,2 --1/1 Collect Pure Plague Sample
    .target Calia Menethil
    .mob Blighted Soldier
    .mob Blighted Lieutenant
step
    >>保卫 |cRXP_FRIENDLY_Calia Menethil. |r
    .complete 65660,3 --1/1 Escape the Blight with Calia
    .target Calia Menethil
    .mob Blighted Soldier
    .mob Blighted Lieutenant
step
    .goto 2070,61.92,55.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 65660 >>交任务: |cRXP_FRIENDLY_与信仰同行|r
    .target Lilian Voss
    .accept 65661 >>接任务: |cRXP_WARN_咨询盟友|r
step
    #completewith next
    .zone 1536 >>前往马尔德拉克斯的传送门
step
    .goto 1536,74.76,33.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格拉夫·辛达恩|r交谈
    .turnin 65661 >>交任务: |cRXP_FRIENDLY_咨询盟友|r
    .target Margrave Sin'dane
    .accept 65662 >>接任务: |cRXP_WARN_凋零密院|r
step
    #completewith next
    .goto 1536,73.56,33.4,10,0
    .goto 1536,74.29,33.88,5 >>使用传送门前往地面
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瘟疫先知玛莉莱斯|r和|cRXP_FRIENDLY_卡莉娅·米奈希尔|r交谈
    .turnin 65662 >>交任务: |cRXP_FRIENDLY_凋零密院|r
    .target Plague Deviser Marileth
    .accept 65664 >>接任务: |cRXP_WARN_魔药营养|r
    .goto 1536,71.15,71.47
    .accept 65663 >>接任务: |cRXP_WARN_喂食吞食者|r
    .goto 1536,71.15,71.38
    .target Calia Menethil
step
    #completewith Tumultuous Concoction
    >>击杀|cRXP_ENEMY_Plaguerocs|r和|cRXP_ENEMY_Concentrated Plague|r和|cRXP_ENEMY_Undiluted Plague|r
    .complete 65663,1 --House of Plagues cleared (100%)
    .mob Plagueroc
    .mob Concentrated Plague
    .mob Undiluted Plague
step
    .goto 1536,70.96,74.06
    >>点击|cRXP_PICK_沸腾药剂|r
    .complete 65664,1 --1/1 Simmering Concoction absorbed
step
    .goto 1536,69.66,75.59
    >>点击|cRXP_PICK_Unstable Concoction|r
    .complete 65664,2 --1/1 Unstable Concoction absorbed
step
    #label Tumultuous Concoction
    .goto 1536,68.53,79.82
    >>点击|cRXP_PICK_混乱药剂|r
    .complete 65664,3 --1/1 Tumultuous Concoction absorbed
step
    #loop
    .goto 1536,69.66,75.59,40,0
    .goto 1536,70.96,74.06,40,0
    .goto 1536,68.53,79.82,40,0
    >>击杀|cRXP_ENEMY_Plaguerocs|r和|cRXP_ENEMY_Concentrated Plague|r和|cRXP_ENEMY_Undiluted Plague|r
    .complete 65663,1 --House of Plagues cleared (100%)
    .mob Plagueroc
    .mob Concentrated Plague
    .mob Undiluted Plague
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡莉娅·米奈希尔|r和|cRXP_FRIENDLY_瘟疫先知玛莉瑟|r交谈
    .turnin 65663 >>交任务: |cRXP_FRIENDLY_喂食吞食者|r
    .goto 1536,68.66,81.69
    .target +Calia Menethil
    .turnin 65664 >>交任务: |cRXP_FRIENDLY_魔药营养|r
    .goto 1536,68.67,81.76
    .target +Plague Deviser Marileth
    .accept 65665 >>接任务: |cRXP_WARN_魔药化形|r
step
    .goto 1536,68.27,84.58
    >>击杀|cRXP_ENEMY_洛丹伦瘟疫|r
    .complete 65665,1 --1/1 Lordaeron Blight slain
    .mob Lordaeron Blight
step
    .goto 1536,68.61,81.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 65665 >>交任务: |cRXP_FRIENDLY_魔药化形|r
    .target Lilian Voss
    .accept 65666 >>接任务: |cRXP_WARN_返回布瑞尔|r
step
    #completewith next
    .cast 368788 >>使用 |T413582:0|t[莉莉安的炉石]
    .use 191029
step
    .goto 2070,60.83,52.01,10,0
    .goto 2070,65.78,60.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
    .complete 65666,1 --1/1 Speak to Master Apothecary Faranell
    .skipgossip 185731,1
    .target Master Apothecary Faranell
step
    .goto 2070,65.78,60.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
    .turnin 65666 >>交任务: |cRXP_FRIENDLY_返回布瑞尔|r
    .target Master Apothecary Faranell
step
    .goto 2070,65.84,60.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Calia 米奈希尔|r交谈
    .accept 65667 >>接任务: |cRXP_WARN_洛丹伦的解药|r
    .target Calia Menethil
step
    .goto 2070,65.70,59.81
    >>与一只暗影蝠互动
    .complete 65667,1 --1/1 Mount Shadowbat
    .target Shadowbat
step
    >>在冷却时间结束后使用(1)和(2), 如果靠近紫色箭头, 则优先对它使用
    .complete 65667,2 --Drop Plague Eaters in Ruins of Lordaeron (100%)
step
    .goto 2070,63.28,69.71
    >>使用 3 和 4 杀死|cRXP_ENEMY_Amalgam|r, 用 5 治疗
    .complete 65667,3 --1/1 Amalgam slain
    .mob Amalgam
step
    .goto 2070,61.85,67.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 65667 >>交任务: |cRXP_FRIENDLY_洛丹伦的解药|r
    .target Lilian Voss
    .accept 65668 >>接任务: |cRXP_WARN_荒芜议会|r
    .timer 60,RP
step
    .goto 2070,61.78,67.99
    .complete 65668,1 --1/1 Witness the Formation of the Desolate Council
    Council
step
    .goto 2070,61.79,67.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡莉娅·米奈希尔|r和|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 65668 >>交任务: |cRXP_FRIENDLY_荒芜议会|r
    .target +Calia Menethil
    .turnin 66091 >>交任务: |cRXP_FRIENDLY_黑暗游侠之路|r
    .goto 2070,61.73,67.74
    .target +Dark Ranger Velonara
    .accept 65788 >>接任务: |cRXP_WARN_往日阴影|r
    .goto 2070,61.86,67.76
    .target Lilian Voss
step
    .goto 2070,61.84,71.51
    #title |cFFFCDC00跟随箭头指引|r
    .complete 65788,1 --1/1 Enter the Throne Room of Lordaeron
step
    .goto 2070,61.84,72.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Calia 米奈希尔|r交谈
    .turnin 65788 >>交任务: |cRXP_FRIENDLY_往日阴影|r
    .target Calia Menethil
    .accept 76530 >>接任务: |cRXP_WARN_[Unliving Summons]|r
step
    .goto 2070,63.76,68.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 76530 >>交任务: |cRXP_FRIENDLY_[Unliving Summons]|r
    .target Lilian Voss
    .accept 72854 >>接任务: |cRXP_WARN_举目皆敌|r
step
    .goto 2070,61.21,82.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔蒙特|r交谈
    .complete 72854,1 --1/1 Speak to Belmont
    .skipgossip 199761,1
    .target Belmont
step
    .goto 2070,61.21,82.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_死亡猎手指挥官贝尔蒙特|r交谈
    .turnin 72854 >>交任务: |cRXP_FRIENDLY_举目皆敌|r
    .target Deathstalker Commander Belmont
    .accept 72855 >>接任务: |cRXP_WARN_前往瑟伯切尔|r
step
    .goto 2070,61.17,82.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幽暗城的亡灵巫师(Forsaken Dreadmage)|r交谈
    .complete 72855,1 --1/1 Speak to Forsaken Dreadmage
    .skipgossip
    .target Forsaken Dreadmage
step
    .goto 21,42.66,40.84,10,0
    .goto 21,42.68,41.44,10,0
    .goto 21,45.57,42.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r交谈
    .turnin 72855 >>交任务: |cRXP_FRIENDLY_前往瑟伯切尔|r
    .target Dark Ranger Velonara
    .accept 72858 >>接任务: |cRXP_WARN_[Acid Beats Paper]|r
step
    .goto 21,45.57,42.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
    .accept 72856 >>接任务: |cRXP_WARN_[Nothing Like the Classic]|r
    .target Master Apothecary Faranell
    .accept 72857 >>接任务: |cRXP_WARN_[Boom Weed]|r
step
    #completewith Notice to All Undead
    >>击杀|cRXP_ENEMY_受瘟疫侵袭的狼|r和|cRXP_ENEMY_生病的鹿|r和|cRXP_ENEMY_受瘟疫侵袭的熊|r, 从它们身上搜刮 [|cRXP_LOOT_受瘟疫侵袭的肉|r]
    .complete 72856,1 --12/12 Plagued Flesh
    .mob Plagued Wolf
    .mob Sickly Deer
    .mob Plagued Bear
step
    #completewith Notice to All Undead
    >>点击|cRXP_PICK_Boom Weed.|r
    .complete 72857,1 --6/6 Boom Weed
step
    .goto 21,46.67,47.08
    >>在纸张前方使用 |T132104:0|t[酸性步枪]
    .complete 72858,1,1 --4/4 Notice to All Undead destroyed
step
    .goto 21,45.61,47.37
    >>在纸张前方使用 |T132104:0|t[酸性步枪]
    .complete 72858,1,2 --4/4 Notice to All Undead destroyed
step
    .goto 21,46.95,50.23
    >>在纸张前方使用 |T132104:0|t[酸性步枪]
    .complete 72858,1,3 --4/4 Notice to All Undead destroyed
step
    #label Notice to All Undead
    .goto 21,48.35,48.83
    >>在纸张前方使用 |T132104:0|t[酸性步枪]
    .complete 72858,1,4 --4/4 Notice to All Undead destroyed
step
    #hidewindow
    #completewith EndIncludePrepGuide
    #loop
    .goto 21,48.05,52.44,40,0
    .goto 21,46.47,54.45,40,0
    .goto 21,43.59,50.86,40,0
    .goto 21,46.69,44.83,40,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_受瘟疫侵袭的狼|r和|cRXP_ENEMY_生病的鹿|r和|cRXP_ENEMY_受瘟疫侵袭的熊|r, 从它们身上搜刮 [|cRXP_LOOT_受瘟疫侵袭的肉|r]
    .complete 72856,1 --12/12 Plagued Flesh
    .mob Plagued Wolf
    .mob Sickly Deer
    .mob Plagued Bear
step
    >>点击|cRXP_PICK_Boom Weed.|r
    .complete 72857,1 --6/6 Boom Weed
step
    #label EndIncludePrepGuide
    >>击杀|cRXP_ENEMY_受瘟疫侵袭的狼|r和|cRXP_ENEMY_生病的鹿|r和|cRXP_ENEMY_受瘟疫侵袭的熊|r, 从它们身上搜刮 [|cRXP_LOOT_受瘟疫侵袭的肉|r]
    .complete 72856,1 --12/12 Plagued Flesh
    .mob Plagued Wolf
    .mob Sickly Deer
    .mob Plagued Bear
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r和|r|cRXP_FRIENDLY_大药剂师法拉尼尔|r交谈
    .turnin 72858 >>交任务: |cRXP_FRIENDLY_[Acid Beats Paper]|r
    .goto 21,45.56,42.04
    .target +Dark Ranger Velonara
    .turnin 72856 >>交任务: |cRXP_FRIENDLY_[Nothing Like the Classic]|r
    .target +Master Apothecary Faranell
    .turnin 72857 >>交任务: |cRXP_FRIENDLY_[Boom Weed]|r
    .goto 21,45.63,41.99
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡莉亚·米奈希尔|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .accept 72859 >>接任务: |cRXP_WARN_[A Proper Disguise]|r
    .goto 21,45.55,41.58
    .target Calia Menethil
    .accept 72860 >>接任务: |cRXP_WARN_[Fear is Our Weapon]|r
    .goto 21,45.51,41.58
    .target Lilian Voss
step
    .goto 21,52.75,27.58,10,0
    .goto 21,52.81,28.10
    >>击杀|cRXP_ENEMY_Lieutenant Hawlsey.|r, 击败后可获得 [|cRXP_LOOT_Hawlsey's Armor|r]
    .complete 72859,1 --1/1 Steal Lieutenant Hawlsey's Armor
    .mob Lieutenant Hawlsey
step
    #loop
    .goto 21,53.39,25.34,20,0
    .goto 21,51.81,25.12,20,0
    .goto 21,51.88,27.98,20,0
    .goto 21,53.55,27.53,20,0
    >>击杀|cRXP_ENEMY_Scarlet新兵|r和|cRXP_ENEMY_Scarlet训练员|r
    .complete 72860,2 --12/12 Scarlet Recruits or Trainers slain
    .mob Scarlet Recruits
    .mob Scarlet Trainers
step
    .goto 21,45.48,41.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 72859 >>交任务: |cRXP_FRIENDLY_[A Proper Disguise]|r
    .target Lilian Voss
    .turnin 72860 >>交任务: |cRXP_FRIENDLY_[Fear is Our Weapon]|r
    .accept 72861 >>接任务: |cRXP_WARN_[The Scarlet Spy]|r
step
    .goto 21,45.63,41.90
    >>使用你的 |cRXP_WARN_[ExtraActionButton]|r
    .complete 72861,1 --1/1 Don Scarlet Disguise
step
    .goto 21,45.63,41.90
    >>点击|cRXP_PICK_Barrel|r
    .complete 72861,2 --1/1 Pick Up Faranell's Mixture
step
    .goto 21,59.92,34.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_绯红船长|r交谈
    .skipgossip 199804,2
    .target the Scarlet Boatmaster
step
    .goto 21,68.82,35.39
    >>点击|cRXP_PICK_Barrel|r
    .complete 72862,1,1 --3/3 Plant Explosive Plague
step
    .goto 21,70.53,35.49
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,1 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,76.11,33.34
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,2 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,75.77,31.72
    >>点击|cRXP_PICK_Barrel|r
    .complete 72862,1,2 --3/3 Plant Explosive Plague
step
    .goto 21,78.71,24.43
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,3 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,76.36,19.97
    >>点击|cRXP_PICK_Barrel|r
    .complete 72862,1,3 --3/3 Plant Explosive Plague
step
    .goto 21,75.09,19.44
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,4 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,74.17,16.39
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,5 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,73.5,16.33
    >>击杀|cRXP_ENEMY_血色大法师|r
    .complete 72862,2,6 --6/6 Scarlet Archmage slain
    .mob Scarlet Archmage
step
    .goto 21,70.45,18.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗游侠维罗娜拉|r交谈
    .turnin 72862 >>交任务: |cRXP_FRIENDLY_[Among Us]|r
    .target Dark Ranger Velonara
    .accept 72863 >>接任务: |cRXP_WARN_[The Flight of the Banshee]|r
step
    .goto 21,70.46,18.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Velonara|r交谈
    .complete 72863,1 --1/1 Speak to Velonara
    .skipgossip
    .target Velonara
step
    .goto 21,70.25,18.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_死亡猎手指挥官贝尔蒙特|r交谈
    .turnin 72863 >>交任务: |cRXP_FRIENDLY_[The Flight of the Banshee]|r
    .target Deathstalker Commander Belmont
    .accept 72864 >>接任务: |cRXP_WARN_[Death to the Living]|r
step
    .goto 21,73.76,17.22
    .goto 21,76.57,21.31
    .goto 21,78.23,25.16
    .goto 21,76.59,30.17
    .goto 21,72.12,35.08
    >>击杀|cRXP_ENEMY_猩红十字军. |r
    .complete 72864,1 --Scarlet Crusade routed (100%)
    .mob Scarlet Footsoldier
    .mob Alert Hound
    .mob Scarlet Confessor
step
    .goto 21,66.33,31.09
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72864,2 --1/1 Meet Lilian Voss Ouside Fenris Keep
step
    .goto 21,66.33,31.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 72864 >>交任务: |cRXP_FRIENDLY_[Death to the Living]|r
    .target Lilian Voss
    .accept 72865 >>接任务: |cRXP_WARN_[This is the Hour of the Forsaken]|r
step
    .goto 21,65.74,24.72
    #title |cFFFCDC00跟随箭头指引|r
    .complete 72865,1 --1/1 Reach Fenris Keep
step
    .goto 21,65.19,24.42,10,0
    .goto 21,65.21,23.95,10,0
    .goto 21,65.6,23.93,10,0
    .goto 21,65.71,23.35,10,0
    .goto 21,65.89,23.89,10,0
    .goto 21,66.24,23.88,10,0
    .goto 21,66.01,24.59,10,0
    .goto 21,65.74,23.77
    >>击杀|cRXP_ENEMY_血色指挥官 福赛思|r
    .complete 72865,2 --1/1 Scarlet Commander Forsythe slain
    .mob Scarlet Commander Forsythe
step
    .goto 21,66.15,24.56,10,0
    .goto 21,66.04,23.88,10,0
    .goto 21,65.61,23.36,10,0
    .goto 21,65.62,23.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈, 你可能需要等待 |cRXP_FRIENDLY_莉莉安·沃斯|r 出现. |r
    .turnin 72865 >>交任务: |cRXP_FRIENDLY_[This is the Hour of the Forsaken]|r
    .target Lilian Voss
    .accept 72866 >>接任务: |cRXP_WARN_[Return to Lordaeron]|r
step
    .goto 21,65.59,23.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幽暗城的亡灵巫师(Forsaken Dreadmage)|r交谈
    .complete 72866,1 --1/1 Take the portal to Ruins of Lordaeron
    .skipgossip
    .target Forsaken Dreadmage
step
    .goto 2070,61.84,68.62
    >>|cRXP_WARN_请在蓝色圆圈内使用|r[额外动作按钮]
    .complete 72867,1 --1/1 Receive the Honor of the Forsaken
step
    .goto 2070,61.83,69.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 72867 >>交任务: |cRXP_FRIENDLY_我是被遗忘者|r
    .target Lilian Voss
]])

--Tauren
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bc) 牛头人传承护甲
#displayname |cFF1EFF003|r - 牛头人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bd) 巨魔遗产套装

<< Horde

step
    #label StartIncludePrepGuide
    .goto 88,60.29,51.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者乌索|r交谈
    .turnin 54759 >>交任务: |cRXP_FRIENDLY_灵魂低语之时|r
    .accept 54760 >>接任务: |cRXP_WARN_灵魂行者|r
    .target Spiritwalker Ussoh
step
    .goto 462,12.18,31.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 54760 >>交任务: |cRXP_FRIENDLY_灵魂行者|r
    .accept 54761 >>接任务: |cRXP_WARN_[Spirit Guide]|r
    .target Baine Bloodhoof
step
    #completewith next
    .goto 462,12.55,31.36
    .cast 6478,1 >>点击|cRXP_PICK_灵行者熏香|r
    .timer 23,RP
step
    .isOnQuest 54761
    >>等待目标完成
    .complete 54761,1 --1/1 Light Spiritwalker's Incense
step
    .goto 462,12.15,31.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者乌索|r交谈
    .turnin 54761 >>交任务: |cRXP_FRIENDLY_[Spirit Guide]|r
    .target Spiritwalker Ussoh
    .accept 54762 >>接任务: |cRXP_WARN_[A Small Retreat]|r
step
    .goto 65,49.18,60.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者乌索|r交谈
    .turnin 54762 >>交任务: |cRXP_FRIENDLY_[A Small Retreat]|r
    .accept 54763 >>接任务: |cRXP_WARN_[Crossing Over]|r
    .target Spiritwalker Ussoh
step
    .goto 65,49.18,60.93
    >>使用 |T921387:0|t[灵魂行者的圣物容器]
    .complete 54763,1 --1/1 Entered Spirit Realm
    .use 166899
step
    #completewith next
    .goto 65,49.54,61.46,20,0
    .goto 65,49.2,62.98,20,0
    .goto 65,48.15,63.06,20,0
    .goto 65,48.05,64.45,20,0
    .goto 65,48.86,65.36,20 >>跟随箭头|cRXP_WARN_请靠近|r|cRXP_FRIENDLY_远古科多兽|r
    .target Ancient Kodo
step
    .goto 65,50.05,65.68
    >>击杀|cRXP_ENEMY_通灵魔|r
    .complete 54763,2 --1/1 Followed Spirit Guide
    .mob Necrofiend
step
    .goto 65,49.17,60.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者乌索|r交谈
    .turnin 54763 >>交任务: |cRXP_FRIENDLY_[Crossing Over]|r
    .target Spiritwalker Ussoh
step
    .goto 65,49.17,60.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵行者乌索|r交谈
    .target Spiritwalker Ussoh
    .accept 54764 >>接任务: |cRXP_WARN_风暴将至|r
step
    .goto 7,47.49,55.94
    >>跟随箭头指引
    .complete 54764,1 --1/1 前往血蹄村
step
    #loop
    .goto 7,46.84,56.95,30,0
    .goto 7,47.68,59.2,30,0
    .goto 7,48.43,57.22,30,0
    >>与|cRXP_FRIENDLY_Bloodhoof 村民|r和|cRXP_FRIENDLY_被困的科多|r互动
    *Click on |cRXP_PICK_Spirit Portals|r
    *击杀|cRXP_ENEMY_通灵魔|r and |cRXP_ENEMY_Malicious Spirits.|r
    .complete 54764,2 --Save the people of Bloodhoof Village (100%)
    .mob Necrofiend
    .mob Malicious Spirit
    .target Bloodhoof Villager
    .target Trapped Kodo
step
    .goto 88,58.21,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 54764 >>交任务: |cRXP_FRIENDLY_风暴将至|r
    .target Baine Bloodhoof
step
    .goto 88,58.21,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .target Baine Bloodhoof
    .accept 54766 >>接任务: |cRXP_WARN_响应召唤|r
step
    #completewith next
    .goto 88,58.21,51.78
    .gossipoption 49999 >>与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
step
    #label EndIncludePrepGuide
    .goto 88,55.63,50.91
    >>击杀|cRXP_ENEMY_Malevolent Spirit|r
    .complete 54766,1 --1/1 Malevolent Spirit slain
    .mob Malevolent Spirit
step
    #completewith next
    .logout >>|cRXP_WARN_按 Esc 键并选择“退出登录”|r
step
    .goto 88,60.32,51.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 54766 >>交任务: |cRXP_FRIENDLY_响应召唤|r
    .target Baine Bloodhoof
step
    .goto 88,60.32,51.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .target Baine Bloodhoof
    .accept 54765 >>接任务: |cRXP_WARN_感谢指引|r
step
    .goto 7,33.97,38.64
    >>点击|cRXP_PICK_Spirit Offering|r
    .complete 54765,1 --1/1 Offering presented
step
    .goto 7,34.00,38.67
    >>点击|cRXP_PICK_Ceremonial Tauren Garb|r
    .turnin 54765 >>交任务: |cRXP_FRIENDLY_感谢指引|r
    .target Ceremonial Tauren Garb
]])

--Troll
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bd) 巨魔遗产套装
#displayname |cFF1EFF004|r - 巨魔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next (血精灵传承护甲)

<< Horde

step
    #label StartIncludePrepGuide
    .goto 85,32.70,64.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zi'guma|r交谈
    .accept 77869 >>接任务: |cRXP_WARN_重返回音群岛|r
    .target Zi'guma
step
    .goto 463,61.13,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77869 >>交任务: |cRXP_FRIENDLY_重返回音群岛|r
    .target Rokhan
step
    .goto 463,61.39,65.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r交谈
    .accept 77871 >>接任务: |cRXP_WARN_[De Old Loa]|r
    .target Master Gadrin
step
    .goto 463,61.9,65.42
    >>点击|cRXP_PICK_Mueh'zala 供品|r|cRXP_WARN_[1]|r
    .complete 77871,1,1 --5/5 Destroy Mueh'zala Offerings
step
    .goto 463,61.65,64.44
    >>点击|cRXP_PICK_Mueh'zala 供品|r|cRXP_WARN_[1]|r
    .complete 77871,1,2 --5/5 Destroy Mueh'zala Offerings
step
    .goto 463,60.65,65.34
    >>点击|cRXP_PICK_Mueh'zala 供品|r|cRXP_WARN_[1]|r
    .complete 77871,1,3 --5/5 Destroy Mueh'zala Offerings
step
    .goto 463,60.6,66.2
    >>点击|cRXP_PICK_Mueh'zala 供品|r|cRXP_WARN_[1]|r
    .complete 77871,1,4 --5/5 Destroy Mueh'zala Offerings
step
    .goto 463,60.62,66.58
    >>点击|cRXP_PICK_Mueh'zala 供品|r|cRXP_WARN_[1]|r
    .complete 77871,1,5 --5/5 Destroy Mueh'zala Offerings
step
    .goto 463,61.37,65.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r交谈
    .accept 77871 >>接任务: |cRXP_WARN_[De Old Loa]|r
    .target Master Gadrin
step
    #completewith next
    +跳离房屋
step
    .goto 463,58.75,66.27
    >>点击|cRXP_PICK_先知祭坛|r
    .complete 77871,2 --1/1 Assist Tzadah with loa ritual
step
    .goto 463,59.16,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77871 >>交任务: |cRXP_FRIENDLY_[De Old Loa]|r
    .target Rokhan
step
    .goto 463,59.16,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .target Rokhan
    .accept 77874 >>接任务: |cRXP_WARN_[De Loa of de Past]|r
step
    .goto 463,59.22,62.1
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,1 --8/8 Tribute objects collected
step
    .goto 463,59.93,60.92
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,2 --8/8 Tribute objects collected
step
    .goto 463,60.03,61.07
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,3 --8/8 Tribute objects collected
step
    .goto 463,59.74,62.5,5,0
    .goto 463,60.26,61.61
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,4 --8/8 Tribute objects collected
step
    .goto 463,60.18,62.12
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,5 --8/8 Tribute objects collected
step
    .goto 463,60.87,63.34
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,6 --8/8 Tribute objects collected
step
    .goto 463,60.51,63.45
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,7 --8/8 Tribute objects collected
step
    .goto 463,60.36,63.21
    >>点击|cRXP_PICK_Tribute|r物品
    .complete 77874,1,8 --8/8 Tribute objects collected
step
    .goto 463,58.72,65.99
    >>点击|cRXP_PICK_Jani的垃圾堆|r
    .complete 77874,2 --1/1 Create a Jani tribute
    .timer 32,RP
step
    .goto 463,58.37,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jani|r交谈
    .complete 77874,3 --1/1 Consult Jani
    .skipgossip
    .target Jani
step
    .goto 463,58.71,66.04
    >>点击|cRXP_PICK_Jani的垃圾堆|r
    .complete 77874,4 --1/1 Jani's Junkpile
step
    .goto 50,84.60,40.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77874 >>交任务: |cRXP_FRIENDLY_[De Loa of de Past]|r
    .target Rokhan
    .accept 77879 >>接任务: |cRXP_WARN_[Stalking the Stalker]|r
step
    #loop
    .goto 50,88.01,45.74,20,0
    .goto 50,89.17,49.06,20,0
    .goto 50,87.18,49.64,20,0
    >>击杀|cRXP_ENEMY_Animated Offering|r和|cRXP_ENEMY_Hakkari Ritualist|r和|cRXP_ENEMY_Foul Offering|r. 击败它们后可获得 [|cRXP_LOOT_Offering to Hakkar|r] 的战利品
    .complete 77879,1 --6/6 Offering to Hakkar
    .mob Animated Offering
    .mob Hakkari Ritualist
    .mob Foul Offering
step
    .goto 50,81.77,47.86
    #title |cFFFCDC00跟随箭头指引|r
    .complete 77879,2 --1/1 Return to Jani
    .timer 20,RP
step
    .goto 50,81.81,48.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kevo ya Siti|r 交谈
    .turnin 77879 >>交任务: |cRXP_FRIENDLY_[Stalking the Stalker]|r
    .target Kevo ya Siti
    .accept 77881 >>接任务: |cRXP_WARN_[There is Another]|r
step
    >>点击|cRXP_PICK_Jani's Junkpile|r
    .goto 50,81.84,47.61
    .complete 77881,1 --1/1 Use Jani's Junkpile to travel to Bambala (Optional)
    .complete 77881,2 --1/1 返回班巴拉
step
    .goto 50,63.59,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kevo ya Siti|r 交谈
    .turnin 77881 >>交任务: |cRXP_FRIENDLY_[There is Another]|r
    .target Kevo ya Siti
step
    .goto 50,63.48,41.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .accept 77880 >>接任务: |cRXP_WARN_[Looking for Lukou]|r
    .target Rokhan
step
    .goto 50,65.03,42.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .complete 77880,1,1 --3/3 Ask about Lukou
    .skipgossip
    .target Shadow Hunter Ty'jin
step
    .goto 50,66.05,40.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .complete 77880,1,2 --3/3 Ask about Lukou
    .skipgossip
    .target Shadow Hunter Ty'jin
step
    .goto 50,63.18,39.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .complete 77880,1,3 --3/3 Ask about Lukou
    .skipgossip
    .target Shadow Hunter Ty'jin
step
    .goto 50,63.48,41.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .complete 77880,2 --1/1 Speak with Rokhan
    .skipgossip 210091,1
    .target Rokhan
step
    .goto 50,65.14,47.69
    >>跟随箭头指引
    .complete 77880,3 --1/1 Find Kevo ya Siti by the Ogre Mound
step
    .goto 50,65.09,47.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77880 >>交任务: |cRXP_FRIENDLY_[Looking for Lukou]|r
    .target Rokhan
step
    .goto 50,65.06,47.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kevo ya Siti|r 交谈
    .accept 77877 >>接任务: |cRXP_WARN_[One with the Loa]|r
    .target Kevo ya Siti
step
    .goto 50,65.06,47.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kevo ya Siti|r 交谈
    .complete 77877,1 --1/1 Tell Kevo you're ready
    .timer 20,RP
    .skipgossip
step
    .goto 50,70.38,48.96
    >>等待目标完成
    .complete 77877,2 --1/1 Ogre cave infiltrated

step
    .goto 50,70.63,49.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77877 >>交任务: |cRXP_FRIENDLY_[One with the Loa]|r
    .target Rokhan
    .accept 77882 >>接任务: |cRXP_WARN_[Stolen but Not Forgotten]|r
    .accept 78875 >>接任务: |cRXP_WARN_[The Unkillable]|r
step
    >>击杀|cRXP_ENEMY_Mosh'Ogg 巫医|r和|cRXP_ENEMY_Mosh'Ogg 法师|r, 从他们身上获取 [|cRXP_LOOT_祭坛碎片.|r]
    *Click on |cRXP_PICK_Dusty Bags|r
    .complete 77882,1 --8/8 Altar Fragment
    .mob Mosh'Ogg Witch Doctor
    .mob Mosh'Ogg Spellcrafter
step
    .goto 50,69.24,48.6,10,0
    .goto 50,68.6,49.63,10,0
    .goto 50,68.44,49.04,10,0
    .goto 50,67.92,47,10,0
    .goto 50,69.18,46.97
    >>击杀|cRXP_ENEMY_Mai'Zoth.|r击败他们以获取 [|cRXP_LOOT_陆寇祭坛中心装饰|r]
    .complete 78875,1 --1/1 Lukou's Altar Centerpiece
    .mob Mai'Zoth
step
    #loop
    .goto 50,69.64,47.11,10,0
    .goto 50,67.93,47.09,10,0
    .goto 50,67.52,47.92,10,0
    .goto 50,67.28,49.01,10,0
    .goto 50,67.64,48.91,10,0
    .goto 50,68.34,48.88,10,0
    .goto 50,68.76,49.38,10,0
    .goto 50,68.97,48.84,10,0
    >>击杀|cRXP_ENEMY_Mosh'Ogg 巫医|r和|cRXP_ENEMY_Mosh'Ogg 法师|r, 从他们身上获取 [|cRXP_LOOT_祭坛碎片.|r]
    *Click on |cRXP_PICK_Dusty Bags|r
    .complete 77882,1 --8/8 Altar Fragment
step
    .goto 50,70.62,49.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77882 >>交任务: |cRXP_FRIENDLY_[Stolen but Not Forgotten]|r
    .target Rokhan
    .turnin 78875 >>交任务: |cRXP_FRIENDLY_[The Unkillable]|r
    .accept 77894 >>接任务: |cRXP_WARN_[Heart of Lukou]|r
step
    .goto 50,70.71,48.99
    >>点击|rAltar of Regeneration|r
    .complete 77894,1 --1/1 Repair Destroyed Effigy
    .timer 10,RP
step
    .goto 50,70.78,48.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lukou|r交谈
    .complete 77894,2 --1/1 Calm Lukou
    .timer 9,RP
    .skipgossip
    .target Lukou
step
    .goto 50,70.63,49.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77894 >>交任务: |cRXP_FRIENDLY_[Heart of Lukou]|r
    .target Rokhan
    .accept 77898 >>接任务: |cRXP_WARN_[Honor and Tribute]|r
step
    .goto 50,70.4,49.58
    >>点击|cRXP_PICK_Jani's Junkpile|r
    .complete 77898,1 --1/1 Return to Echo Isles using Jani's Junkpile (Optional)
step
    .goto 463,59.07,65.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔扎达|r交谈
    .complete 77898,2 --1/1 Speak with Tzadah
    .skipgossip 210086,1
    .target Tzadah
step
    .goto 463,58.64,66.3
    >>点击|cRXP_PICK_Lukou Offering|r
    .complete 77898,4 --1/1 Lukou Offering placed
step
    .goto 463,58.85,66.28
    >>点击|cRXP_PICK_Kevo ya Siti Offering|r
    .complete 77898,3 --1/1 Kevo ya Siti Offering placed
step
    .goto 463,58.75,66.28
    >>点击|cRXP_PICK_Kevo ya Siti Offering|r
    .complete 77898,5 --1/1 Last Offering placed
step
    .goto 463,59.07,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_术士巫医塔扎达|r交谈
    .turnin 77898 >>交任务: |cRXP_FRIENDLY_[Honor and Tribute]|r
    .target Witch Doctor Tzadah
    .accept 77899 >>接任务: |cRXP_WARN_[The Rush'kah]|r
step
    .goto 463,59.29,61.88
    >>点击|cRXP_PICK_Rush'kah Paint|r
    .complete 77899,1 --1/1 Paint mixed
step
    .goto 463,59.2,61.96
    >>点击|cRXP_PICK_预制木材|r
    .complete 77899,2 --1/1 Prepared Wood
step
    .goto 463,60.13,62.17
    >>点击|cRXP_PICK_Finished Rush'kah|r
    .complete 77899,3 --1/1 Rush'kah mask created
step
    .goto 463,60.09,62.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77899 >>交任务: |cRXP_FRIENDLY_[The Rush'kah]|r
    .target Rokhan
step
    .goto 463,60.09,62.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .target Rokhan
    .accept 77900 >>接任务: |cRXP_WARN_[The Loa Trials]|r
step
    #completewith next
    .goto 463,58.77,65.92
    .cast 427573 >>使用 |T136194:0|t[洛阿试炼仪式]
    .use 427573
    .timer 46,RP
step
    .goto 463,58.5,65.57
    >>等待目标完成
    .complete 77900,1 --1/1 Participate in trial ritual
step
    .goto 463,58.52,65.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77900 >>交任务: |cRXP_FRIENDLY_[The Loa Trials]|r
    .target Rokhan
    .accept 77903 >>接任务: |cRXP_WARN_[De Power of Death]|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lukou|r和|cRXP_FRIENDLY_Kevo ya Siti|r交谈
    .accept 77902 >>接任务: |cRXP_WARN_[Ritual Recovery]|r
    .goto 463,58.48,66.15
    .target +Lukou
    .accept 77901 >>接任务: |cRXP_WARN_[Retraining the Trainees]|r
    .goto 463,59.02,66.17
    .target +Kevo ya Siti
step
    #completewith Ritual Circle
    >>击杀|cRXP_ENEMY_ 穆扎拉的信徒|r和|cRXP_ENEMY_ 复活的骨刃者|r和|cRXP_ENEMY_ 未完成的鲁沙克|r以及|cRXP_ENEMY_ 被赋予力量的骨卫|r
    .complete 77903,1 --12/12 Minions of Mueh'zala slain
    .mob Devotee of Mueh'zala
    .mob Raised Boneripper
    .mob Empowered Boneguard
    .mob Unfinished Rush'kah
step
    #completewith Ritual Circle
    >>当 |cRXP_ENEMY_Lost Trainee's|r 的生命值降至 50% 时, 点击他们以获取任务奖励
    .complete 77901,1 --8/8 Lost Trainee darkness removed
    .use 211000
    .mob Lost Trainee Warrior
    .mob Lost Trainee Rogue
    .mob Lost Trainee Druid
    .mob Lost Trainee Hunter
    .mob Lost Trainee Priest
    .mob Lost Trainee Shaman
    .mob Lost Trainee Warlock
step
    .goto 463,59.72,51.61
    >>点击|cRXP_PICK_Ritual Circle|r
    .complete 77902,1,1 --3/3 Ritual Circle removed
step
    .goto 463,48.59,47.55
    >>点击|cRXP_PICK_Ritual Circle|r
    .complete 77902,1,2 --3/3 Ritual Circle removed
step
    #label Ritual Circle
    .goto 463,49.55,60.84
    >>点击|cRXP_PICK_Ritual Circle|r
    .complete 77902,1,3 --3/3 Ritual Circle removed
step
    #hidewindow
    #completewith EndIncludePrepGuide
    #loop
    .goto 463,53.86,64.39,25,0
    .goto 463,56.74,51.61,25,0
    .goto 463,56,42.86,25,0
    .goto 463,49.53,44.43,25,0
    .goto 463,47.62,53.04,25,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_ 穆扎拉的信徒|r和|cRXP_ENEMY_ 复活的骨刃者|r和|cRXP_ENEMY_ 未完成的鲁沙克|r以及|cRXP_ENEMY_ 被赋予力量的骨卫|r
    .complete 77903,1 --12/12 Minions of Mueh'zala slain
    .mob Devotee of Mueh'zala
    .mob Raised Boneripper
    .mob Empowered Boneguard
    .mob Unfinished Rush'kah
step
    >>当 |cRXP_ENEMY_Lost Trainee's|r 的生命值降至 50% 时, 点击他们以获取任务奖励
    .complete 77901,1 --8/8 Lost Trainee darkness removed
    .use 211000
    .mob Lost Trainee Warrior
    .mob Lost Trainee Rogue
    .mob Lost Trainee Druid
    .mob Lost Trainee Hunter
    .mob Lost Trainee Priest
    .mob Lost Trainee Shaman
    .mob Lost Trainee Warlock
step
    #label EndIncludePrepGuide
    >>击杀|cRXP_ENEMY_ 穆扎拉的信徒|r和|cRXP_ENEMY_ 复活的骨刃者|r和|cRXP_ENEMY_ 未完成的鲁沙克|r以及|cRXP_ENEMY_ 被赋予力量的骨卫|r
    .complete 77903,1 --12/12 Minions of Mueh'zala slain
    .mob Devotee of Mueh'zala
    .mob Raised Boneripper
    .mob Empowered Boneguard
    .mob Unfinished Rush'kah
step
    .goto 463,56.96,56.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77901 >>交任务: |cRXP_FRIENDLY_[Retraining the Trainees]|r
    .target Rokhan
    .turnin 77902 >>交任务: |cRXP_FRIENDLY_[Ritual Recovery]|r
    .turnin 77903 >>交任务: |cRXP_FRIENDLY_[De Power of Death]|r
    .accept 77905 >>接任务: |cRXP_WARN_[Avatar of Mueh'zala]|r
step
    .goto 463,56.27,56.49
    >>点击|cRXP_PICK_Feather|r
    .complete 77905,1 --1/1 Jani's Blessing
step
    .goto 463,58.55,56.29
    >>击杀柱子上的召唤面具, 并点击图腾
    .complete 77905,3,1 --4/4 Tzadah's Empowerment destroyed
    .mob Summoned Visage
step
    .goto 463,54.39,56.53
    >>击杀柱子上的召唤面具, 并点击图腾
    .complete 77905,3,2 --4/4 Tzadah's Empowerment destroyed
    .mob Summoned Visage
step
    .goto 463,54.49,47.04
    >>击杀柱子上的召唤面具, 并点击图腾
    .complete 77905,3,3 --4/4 Tzadah's Empowerment destroyed
    .mob Summoned Visage
step
    .goto 463,58.48,46.89
    >>击杀柱子上的召唤面具, 并点击图腾
    *|cFFFF0000After completing the objective, you can skip the cutscene by pressing 'Escape' and accepting the prompt.|r
    .complete 77905,3,4 --4/4 Tzadah's Empowerment destroyed
    .mob Summoned Visage
step
    .goto 463,58.50,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 77905 >>交任务: |cRXP_FRIENDLY_[Avatar of Mueh'zala]|r
    .target Rokhan
    .accept 77906 >>接任务: |cRXP_WARN_[De Darkspear Loa]|r
step
    .goto 463,58.73,66.12
    >>点击|cRXP_PICK_Totem|r
    .complete 77906,1 --1/1 Destroy Mueh'zala's effigy
step
    .goto 463,58.73,66.12
    >>点击|cRXP_PICK_Loa Offering|r
    .complete 77906,2 --1/1 Replace Mueh'zala's effigy with Jani's
step
    .goto 463,59.05,65.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 77906 >>交任务: |cRXP_FRIENDLY_[De Darkspear Loa]|r
    .target Master Gadrin
]])

--BloodElf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name (血精灵传承护甲)
#displayname |cFF1EFF005|r - 血精灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bf) 地精传承护甲

<< Horde

step
    #label StartIncludePrepGuide
    .goto 85,39.13,79.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_曙光使徒大使达恩斯沃恩|r交谈
    .accept 53791 >>接任务: |cRXP_WARN_辛多雷的骄傲|r
    .target Ambassador Dawnsworn
step
    .goto 110,53.75,20.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛萨·托尔贝恩|r交谈
    .turnin 53791 >>交任务: |cRXP_FRIENDLY_辛多雷的骄傲|r
    .target Lor'themar Theron
step
    .goto 110,53.75,20.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛萨·托尔贝恩|r交谈
    .target Lor'themar Theron
    .accept 53734 >>接任务: |cRXP_WARN_幽魂之路|r
step
    #completewith next
    .goto 110,72.29,44.21,10,0
    .goto 110,75.61,59.19,10,0
    .goto 110,74.53,56.19,10,0
    .goto 110,73.1,59.08,10,0
    .goto 110,72.32,86.03,10,0
    .goto 110,70.13,87.82,10,0
    .goto 94,56.61,49.61,10,0
    .goto 94,54.38,50.79
    .fly Tranquillien >>飞往塔奎林
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛拉米|r交谈
    .target Skymistress Gloaming
step
    .goto 95,46.31,31.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lor'themar Theron|交谈|
    .turnin 53734 >>交任务: |cRXP_FRIENDLY_幽魂之路|r
    .accept 53882 >>接任务: |cRXP_WARN_天灾之祸|r
    .target Lor'themar Theron
step
    .goto 95,47.73,84.01
    >>点击|cRXP_PICK_街灯|r
    .complete 53882,1 --1/1 Light the First Flame
step
    .goto 95,37.08,65.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lor'themar Theron|r交谈, 他稍后会在你身边出现
    .turnin 53882 >>交任务: |cRXP_FRIENDLY_天灾之祸|r
    .target Lor'themar Theron
    .accept 53735 >>接任务: |cRXP_WARN_第一滴血|r
step
    .goto 95,37.08,65.52
    >>使用|cRXP_WARN_ExtraActionButton|r
    .complete 53735,1 --1/1 Shed light on the first battlefield
step
    .goto 95,36.61,67.25
    >>击杀|cRXP_ENEMY_亡灵|r
    .complete 53735,2 --Fight back the undead (100%)
    .mob Risen Attacker
    .mob Risen Abomination
    .mob Necrotic Echo
step
    .goto 95,12.39,56.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的|cRXP_FRIENDLY_Lor'themar Theron|r交谈
    .turnin 53735 >>交任务: |cRXP_FRIENDLY_第一滴血|r
    .target Lor'themar Theron
    .accept 53736 >>接任务: |cRXP_WARN_上层精灵的挽歌|r
step
    .goto 95,18.72,58.43,30,0
    .goto 95,12.17,56.37
    >>击杀|cRXP_ENEMY_Tormented Ranger|r
    .complete 53736,1 --6/6 Tormented Ranger slain
    .mob Tormented Ranger
step
    .goto 95,12.42,56.93
    >>点击|cRXP_PICK_街灯|r
    .complete 53736,2 --1/1 Light the Second Flame
step
    .goto 95,12.48,56.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛萨·托尔贝恩|r交谈
    .turnin 53736 >>交任务: |cRXP_FRIENDLY_上层精灵的挽歌|r
    .target Lor'themar Theron
step
    .goto 95,12.48,56.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛萨·托尔贝恩|r交谈
    .target Lor'themar Theron
    .accept 53737 >>接任务: |cRXP_WARN_希望泯灭之日|r
step
    .goto 95,45.42,30.52
    .fly Fairbreeze Village >>飞往晴风村
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员加尼斯·日翼|r交谈
    .target Skymaster Sunwing
step
    .goto 94,51.21,69.28
    >>当你到达指定位置时, 使用你的[ExtraActionButton]
    .complete 53737,1 --1/1 Light shed at Sylvanas' fall
step
    .goto 94,51.44,69.09
    >>点击|cRXP_PICK_银月城弩炮|r
    .complete 53737,2 --1/1 Man a Silvermoon Ballista
    .target Silvermoon Ballista
step
    .goto 94,51.41,68.90
    >>使用 |T132330:0|t[投掷标枪](1) 对|cRXP_ENEMY_亡灵|r
    .complete 53737,3 --50/50 Kill undead
step
    .goto 94,43.96,69.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_Lor'themar Theron|r|cRXP_WARN_就在你身边. |r
    .turnin 53737 >>交任务: |cRXP_FRIENDLY_希望泯灭之日|r
    .target Lor'themar Theron
    .accept 53738 >>接任务: |cRXP_WARN_奎尔丹纳斯保卫战|r
step
    .goto 94,43.96,69.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .complete 53738,1 --1/1 Talk to Skymaster Brightdawn
    .timer 151,RP
    .skipgossip 44036,2
    .target Skymaster Brightdawn
step
    .goto 122,48.35,36.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女伯爵莉亚德琳|r交谈
    .turnin 53738 >>交任务: |cRXP_FRIENDLY_奎尔丹纳斯保卫战|r
    .target Lady Liadrin
    .accept 53725 >>接任务: |cRXP_WARN_支离破碎|r
step
    .goto 122,48.55,37.14
    >>点击|cRXP_PICK_街灯|r
    .complete 53725,1 --1/1 Light the Final Flame
step
    #loop
    .goto 122,48.33,36,8,0
    .goto 122,48.83,36.94,8,0
    .goto 122,48.6,36.93,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女伯爵莉亚德琳|r交谈
    .turnin 53725 >>交任务: |cRXP_FRIENDLY_支离破碎|r
    .target Lady Liadrin
    .accept 53853 >>接任务: |cRXP_WARN_逐日残阳|r
step
    .goto 122,41.24,45.28,40,0
    .goto 122,38.77,47.59,40,0
    .goto 122,38.22,51.35,40,0
    .goto 122,38.94,54.56,40,0
    .goto 122,47.4,75.11,40,0
    .goto 122,50.3,84.11,40,0
    .goto 122,53.49,87.16
    >>当你到达指定位置时, 使用你的[ExtraActionButton]
    .complete 53853,1 --1/1 Light shed on Anasterian's Fall
step
    .goto 122,53.25,85.67
    >>击杀|cRXP_ENEMY_Blightgut|r
    .complete 53853,2 --1/1 Blightgut slain
    .mob Blightgut
step
    .goto 122,50.3,84.11,40,0
    .goto 122,47.4,75.11,40,0
    .goto 122,38.94,54.56,40,0
    .goto 122,38.22,51.35,40,0
    .goto 122,38.77,47.59,40,0
    .goto 122,41.24,45.28,40,0
    .goto 122,48.36,35.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女伯爵莉亚德琳|r交谈
    .turnin 53853 >>交任务: |cRXP_FRIENDLY_逐日残阳|r
    .target Lady Liadrin
    .accept 54096 >>接任务: |cRXP_WARN_太阳井之殇|r
step
    #completewith next
    .goto 122,44.38,45.69,5 >>进入太阳之井
step
    .isOnQuest 54096
    .goto 973,46.64,23.88
    .scenario 3999,1
    >>当处于该位置时, 请使用|cRXP_WARN_ExtraActionButton|r
step
    .isOnQuest 54096
    .goto 973,46.64,23.88
    >>击杀|cRXP_ENEMY_腐朽潜行者|r和|cRXP_ENEMY_精灵蹒跚者|r和|cRXP_ENEMY_尼鲁布先锋|r
    .scenario 4000,1
    .mob Decrepit Stalker
    .mob Elven Shambler
    .mob Nerubis Vanguard
step
    .isOnQuest 54096
    .goto 973,46.64,23.88
    >>击杀 |cRXP_ENEMY_Seer Drannix.|r
    .scenario 4001,1
    .mob Seer Drannix
step
    .isOnQuest 54096
    #completewith next
    .goto 973,50.25,17.25
    .cast 284579 >>使用 |T461859:0|t[点亮道路] 你的|cRXP_WARN_ExtraActionButton|r
step
    .isOnQuest 54096
    .goto 973,48.33,20.52
    >>等待目标完成
    .scenario 4002,1
step
    .isOnQuest 54096
    .goto 973,48.33,20.52
    >>当处于该位置时, 请使用|cRXP_WARN_ExtraActionButton|r
    .scenario 4039,1
step
    .isOnQuest 54096
    .goto 973,28.35,63.46,20,0
    .goto 973,38.12,83.64,20,0
    .goto 973,47.18,85.34,20,0
    .goto 973,46.16,61.95
    >>护送|cRXP_FRIENDLY_Kael'thas Sunstrider.|r, 击杀来袭的|cRXP_ENEMY_attackers.|r
    .scenario 4003,1
    .target Kael'thas Sunstrider
    .mob Risen Defender
    .mob Tormented Magister
step
    .isOnQuest 54096
    .goto 973,47.98,64.75
    >>击杀|cRXP_ENEMY_Necrotic 森提内尔|r
    .complete 54096,1 --Complete the Fall of the Sunwell scenario
    .mob Necrotic Sentinel
step
    #completewith next
    .isOnQuest 54096
    .goto 973,55.47,72.13
    .zone 110 >>使用|cRXP_PICK_portal|r前往银月城
step
    .isOnQuest 54096
    .goto 110,68.64,35.1,10,0
    .goto 110,60.37,28.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛萨·托尔贝恩|r交谈
    .turnin 54096 >>交任务: |cRXP_FRIENDLY_太阳井之殇|r
    .target Lor'themar Theron
]])

--Goblin
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bf) 地精传承护甲
#displayname |cFF1EFF006|r - 地精 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next (BG) 夜裔传承护甲

<< Horde

step
    #label StartIncludePrepGuide
    .goto 85,39.51,80.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小静|r交谈
    .accept 57043 >>接任务: |cRXP_WARN_老友新活|r
    .target Izzy
step
    .goto 210,34.61,28.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .turnin 57043 >>交任务: |cRXP_FRIENDLY_老友新活|r
    .target Sassy Hardwrench
    .accept 57045 >>接任务: |cRXP_WARN_特别快递|r
step
    .goto 210,32.82,26.13
    >>点击|cRXP_PICK_地精飞行器|r并接受提示
    .complete 57045,1 --1/1 Travel to Crapopolis
    .target Goblin Flying Machine
step
    .isOnQuest 57045
    .goto 1532,53.86,65.37,10 >>跟随箭头指引
    .timer 18,RP
step
    .isOnQuest 57045
    .goto 1532,53.86,65.37
    .countdown 18 >>|cRXP_WARN_等待加里维克斯离开|r
step
    .goto 1532,53.57,61.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57045 >>交任务: |cRXP_FRIENDLY_特别快递|r
    .target Hobart Grapplehammer
    .accept 57047 >>接任务: |cRXP_WARN_一次简单的试验|r
    .timer 22,RP
step
    .goto 1532,53.00,58.56
    >>等待目标完成
    .complete 57047,1 --1/1 Listen to Hobart Grapplehammer
step
    .goto 1532,53.00,58.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .complete 57047,2 --1/1 Speak with Hobart Grapplehammer
    .skipgossip 156520,1
    .target Hobart Grapplehammer
step
    .isOnQuest 57047
    .goto 1532,52.51,60.29
    .cast 305728 >>点击|cRXP_PICK_Freezing Console|r
    .timer 24,RP
step
    .goto 1532,53.23,60.13
    >>等待目标完成
    .complete 57047,3 --1/1 Freezing Console activated
step
    .isOnQuest 57047
    .goto 1532,53.21,60.08
    .cast 305733 >>点击|cRXP_PICK_Flame 火焰控制台|r
    .timer 22,RP
step
    .goto 1532,54.00,59.74
    >>等待目标完成
    .complete 57047,4 --1/1 Flame Console activated
step
    .goto 1532,54.00,59.74
    >>点击|cRXP_PICK_Flame 火焰控制台|r
    .complete 57047,5 --1/1 Explosive Console activated
step
    .goto 1532,52.99,58.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57047 >>交任务: |cRXP_FRIENDLY_一次简单的试验|r
    .target Hobart Grapplehammer
    .accept 57048 >>接任务: |cRXP_WARN_购买零件|r
step
    .goto 1532,56.11,78.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank Greasefuse|r交谈
    .turnin 57048 >>交任务: |cRXP_FRIENDLY_购买零件|r
    .target Crank Greasefuse
    .accept 57051 >>接任务: |cRXP_WARN_收债！|r
step
    #loop
    .goto 1532,54.92,76.22,20,0
    .goto 1532,52.86,76.19,20,0
    .goto 1532,53.42,72.68,20,0
    .goto 1532,53.87,70.96,20,0
    .goto 1532,53.17,69.77,20,0
    .goto 1532,55.88,69.89,20,0
    .goto 1532,55.7,74.02,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阴险混混.|r交谈
    *|cRXP_WARN_If you have to kill them|r Loot them for [|cRXP_LOOT_Unpaid Debt|r]
    .skipgossip
    .complete 57051,1 --8/8 Unpaid Debt
    .target Shady Thug
    .mob Shady Thug
step
    .goto 1532,56.12,78.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crank Greasefuse|r交谈
    .turnin 57051 >>交任务: |cRXP_FRIENDLY_收债！|r
    .target Crank Greasefuse
    .accept 57052 >>接任务: |cRXP_WARN_我有你要的东西|r
step
    .goto 1532,58.75,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57052 >>交任务: |cRXP_FRIENDLY_我有你要的东西|r
    .target Hobart Grapplehammer
    .accept 57053 >>接任务: |cRXP_WARN_钝击测试|r
step
    .goto 1532,53.23,59.97
    >>使用 |T431762:0|t[X-52 体术护甲]
    .complete 57053,1 --1/1 X-52 Body Armor Equipped
    .use 171114
step
    .goto 1532,53.23,59.97
    >>点击|cRXP_PICK_Test 控制台|r
    .complete 57053,2 --1/1 Mechanized Lab Assistant activated
    .timer 6,RP
step
    .goto 1532,53.13,59.34
    >>杀死 |cRXP_ENEMY_机械化实验室助理|r
    .complete 57053,3 --1/1 Mechanized Lab Assistant slain
    .mob Mechanized Lab Assistant
step
    .goto 1532,58.74,60.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57053 >>交任务: |cRXP_FRIENDLY_钝击测试|r
    .target Hobart Grapplehammer
    .accept 57058 >>接任务: |cRXP_WARN_快乐地雷|r
step
    .goto 1532,46.24,47.98
    >>使用 |T431762:0|t[X-52 体术护甲]
    .complete 57058,1 --1/1 X-52 Personnel Armor equipped
    .use 174059
step
    #completewith next
    .goto 1532,47.84,50.61,10,0
    .cast 69070 >>冲向炸弹以获得升力；当靠近炸弹中心时, 在空中使用 |T370769:0|t[火箭跳], 即可接近清爽的椰子饮料
step
    .goto 1532,46.02,48.25
    >>点击 |cRXP_PICK_清爽椰子饮料|r
    .complete 57058,2 --1/1 Refreshing coconut beverage
step
    .goto 1532,51.77,62.22,10,0
    .goto 1532,52.09,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57058 >>交任务: |cRXP_FRIENDLY_快乐地雷|r
    .target Hobart Grapplehammer
    .accept 57059 >>接任务: |cRXP_WARN_我们动手吧！|r
step
    #loop
    .goto 1532,54.02,58.66,15,0
    .goto 1532,53.55,61.22,15,0
    .goto 1532,52.21,60.38,15,0
    >>击杀|cRXP_ENEMY_雇佣恶棍|r
    .complete 57059,1 --8/8 Hired Scoundrel slain
    .mob Hired Scoundrel
step
    .goto 1532,53.29,60.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gallywix|r交谈
    .complete 57059,2 --1/1 Speak with Gallywix
    .skipgossip
    .target Gallywix
step
    .goto 1532,52.10,59.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57059 >>交任务: |cRXP_FRIENDLY_我们动手吧！|r
    .target Hobart Grapplehammer
    .accept 57077 >>接任务: |cRXP_WARN_寻求买家！|r
step
    .goto 1532,50.69,94.75
    >>点击|cRXP_PICK_地精飞行器|r并接受提示
    .complete 57077,1 --1/1 Take the Flying Machine
    .target Goblin Flying Machine
step
    .goto 210,34.61,28.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .turnin 57077 >>交任务: |cRXP_FRIENDLY_寻求买家！|r
    .target Sassy Hardwrench
    .accept 57078 >>接任务: |cRXP_WARN_贵宾名单|r
step
    .goto 71,51.20,29.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马林·诺格弗格|r交谈
    .complete 57078,1 --1/1 Noggenfogger invited
    .skipgossip
    .target Marin Noggenfogger
step
    .goto 64,75.93,74.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兹克|r交谈
    .complete 57078,2 --1/1 Pozzik invited
    .skipgossip 40028,1
    .target Pozzik
step
    .goto 10,68.41,69.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .complete 57078,3 --1/1 Gazlowe invited
    .skipgossip 3391,1
    .target Gazlowe
step
    .goto 210,34.61,28.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .turnin 57078 >>交任务: |cRXP_FRIENDLY_贵宾名单|r
    .target Sassy Hardwrench
    .accept 57079 >>接任务: |cRXP_WARN_把他打出渣！|r
step
    .isOnQuest 57079
    .goto 210,32.86,26.18
    .cast 306977 >>点击|cRXP_PICK_地精飞行器|r
    .target Goblin Flying Machine
step
    .goto 1531,52.31,84.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .scenario 4367,1 --Speak with Gazlowe at dock.
    .skipgossip
step
    #loop
    .goto 1531,53.13,59.45,5,0
    .goto 1531,52.58,58.9,5,0
    >>击杀|cRXP_ENEMY_Dax Blitzblaster|r和|cRXP_ENEMY_暴徒|r以解救|cRXP_FRIENDLY_Hobart Grapplehammer|r
    .scenario 4368,1
    .mob Street Thug
    .mob Dax Blitzblaster
    .target Hobart Grapplehammer
step
    .isOnQuest 57079
    .goto 1531,52.58,58.9
    >>点击|cRXP_PICK_Chest|r
    .scenario 4369,1
step
    #label EndIncludePrepGuide
    .goto 1531,51.36,62.77,15,0
    .goto 1531,46.29,48.2
    >>击杀|cRXP_ENEMY_Gallywix|r, 但请注意, 他会在你最终使用|cRXP_WARN_[额外动作按钮]|r摧毁之前自行修复三次
    *If you are struggling with survivability, you can use your |cRXP_WARN_[ExtraActionButton]|r to defend yourself from incoming fire damage as well.
    .complete 57079,1 --1/1 Crapopolis saved
    .mob Trade Prince Gallywix
step
    .goto 1531,47.86,50.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .turnin 57079 >>交任务: |cRXP_FRIENDLY_把他打出渣！|r
    .target Hobart Grapplehammer
    .accept 57080 >>接任务: |cRXP_WARN_合适的奖励|r
    .turnin 57080 >>交任务: |cRXP_FRIENDLY_合适的奖励|r
]])

--夜之子
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name (BG) 夜裔传承护甲
#displayname |cFF1EFF007|r - 夜之子 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bh) 高山传承护甲

<< Horde 夜之子

step
    #label StartIncludePrepGuide
    #completewith next
    .goto 85,38.59,75.92
    .zone 680 >>点击|cRXP_PICK_传送门|r进入夜之魇
step
    .goto 680,59.33,85.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_第一法师萨斯拉|r交谈
    .turnin 49784 >>交任务: |cRXP_FRIENDLY_夜之子的传承|r
    .target First Arcanist Thalyssra
]])

--HighmountainTauren
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bh) 高山传承护甲
#displayname |cFF1EFF008|r - 至高岭牛头人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bi) 马格哈兽人传承护甲

<< Horde HighmountainTauren

step
    #label StartIncludePrepGuide
    #completewith Heritage of Highmountain
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    #completewith Heritage of Highmountain
    .goto 85,38.17,75.3
    .zone 652 >>使用奥格瑞玛传送门前往高岭山脉
step
    #label Heritage of Highmountain
    .goto 652,54.95,63.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mayla Highmountain|r交谈
    .turnin 49783 >>交任务: |cRXP_FRIENDLY_至高岭的传承|r
    .target Mayla Highmountain
]])

--MagharOrc
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bi) 马格哈兽人传承护甲
#displayname |cFF1EFF009|r - 玛格汉兽人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bj) 赞达拉巨魔传承护甲

<< Horde MagharOrc

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .goto 85,70.61,44.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 51484 >>交任务: |cRXP_FRIENDLY_玛格汉的传承|r
    .target Overlord Geya'rah
]])

--ZandalariTroll
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bj) 赞达拉巨魔传承护甲
#displayname |cFF1EFF0010|r - 赞达拉巨魔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bk) 狐人传承护甲

<< Horde ZandalariTroll

step
    #label StartIncludePrepGuide
    #completewith Heritage of Highmountain
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    #completewith next
    .goto 85,52.98,90.58,15,0
    .goto 85,58.54,91.29
    .zone 862 >>从奥格瑞玛前往祖尔达萨的传送门
step
    .goto 971,28.53,22.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 53721 >>交任务: |cRXP_FRIENDLY_赞达拉的传承|r
    .target Alleria Windrunner
]])

--Vulpera
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bk) 狐人传承护甲
#displayname |cFF1EFF0012|r - 狐人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next bm) 传承地元素矮人

<< Horde Vulpera

step
    #label StartIncludePrepGuide
    #completewith next
    .zone 864 >>前往沃爾登
step
    .goto 864,56.78,49.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈加西|r交谈
    .turnin 58435 >>交任务: |cRXP_FRIENDLY_狐人的传承|r
    .target Hagashi
]])

-----------------------------------------------------
--- NEUTRAL
-----------------------------------------------------

--EarthenDwarf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bl) 传承 地质矮人
#displayname |cFF1EFF0012|r - 土灵矮人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

<< Alliance

step
    +PH2
]])

--EarthenDwarf
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 同盟种族
#name bm) 传承地元素矮人
#displayname |cFF1EFF007|r - 土灵矮人 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

<< Horde

step
    +PH1

]])