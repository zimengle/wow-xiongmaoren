
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup 光铸德莱尼
#name 5) 光铸德莱尼剧情任务线
#displayname 光铸德莱尼

<< Alliance !LightforgedDraenei

step
    #completewith next
    .zone 84 >>前往|cFFfa9602暴风城。|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r |cFFfa9602inside the Stormwind Embassy.|r
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void Elf Banner。|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_库尔提拉斯 Banner。|r
    .complete 50239,4 --1/1 Learn about the 库尔提拉斯s
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_机械侏儒 横幅。|r
    .complete 50239,5 --1/1 Learn about the 机械侏儒s
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_黑铁矮人旗帜。|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_光铸德莱尼 Banner。|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 49698 >>接任务: |cRXP_WARN_光铸者|r
    .target Aysa Cloudsinger
step
    #completewith next
    .goto 84,52.81,14.57,5,0
    .goto 84,54.426,14.433,10 >>前往 |cRXP_PICK_Lightforged Beacon|r
    .isOnQuest 49698
step
    .goto 84,52.81,14.57,5,0
    .goto 84,54.426,14.433
    .zone 940 >>使用 |cRXP_PICK_Lightforged Beacon|r 传送至维迪卡尔
    .complete 49698,1 --Stormwind Embassy Beacon used (1)
    .isOnQuest 49698
step
    .goto 940,43.852,27.027
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_法瑞亚船长|r
    >>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .turnin 49698 >>交任务: |cRXP_FRIENDLY_光铸者|r
    .accept 49266 >>接任务: |cRXP_WARN_万世熔炉|r
    .target 法瑞亚船长
step
    .goto 940,49.945,46.279
    .zone 933 >>使用 |cRXP_PICK_Lightforged Beacon|r 传送至永恒熔炉
    .isOnQuest 49266
--XX no zone ID (its a scenario) so .cast must be used
step
    .goto 933,88.51,36.44,10 >>|cRXP_WARN_前往箭头所指的位置|r
    .timer 27,Duration until continuation.
    -- .scenario 3547,1 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,87.42,29.73
    .scenario 3549,1 >>|cRXP_WARN_在|cFFfa9602大楼前面等候。|r|r
    .isOnQuest 49266
step
    .goto 933,89.13,28.53,5 >>|cRXP_WARN_前往箭头所指的位置。|r
    .timer 14,Duration until continuation.
step
    .goto 933,75.78,31.33,5 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,75.78,31.33
    .scenario 3550,1 >>|cRXP_WARN_等待剩余的时间。|r
    .isOnQuest 49266
step
    .goto 933,66.81,29.77,5 >>查找 |cRXP_FRIENDLY_Child。|r
    .timer 15,Duration until continuation.
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,66.87,29.96
    .scenario 3553,1 >>|cRXP_WARN_杀死 |cRXP_ENEMY_Swamp Serpent。|r|r
    .mob Swamp Serpent
    .isOnQuest 49266
 step
    .goto 933,56.43,23.82,5 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,56.43,23.82
    .scenario 3554,1 >>|cRXP_WARN_等待 |cRXP_FRIENDLY_T'paartos|r 到达。|r
    .isOnQuest 49266
step
    .goto 933,46.96,27.4
    .scenario 3555,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602洞穴内的 |cRXP_PICK_Crystal|r。|r
    .isOnQuest 49266
step
    .goto 933,46.96,27.4
    .scenario 3561,1 >>杀死|cRXP_ENEMY_Crystal Fury。|r
    .mob Crystal Fury
    .isOnQuest 49266
step
    .goto 933,57.03,23.41,5 >>离开|cFFfa9602洞穴。|r
    .isOnQuest 49266
step
    .goto 933,52.93,31.59,20,0
    .goto 933,41.26,46.52,20,0
    .goto 933,27.44,36.56
    .scenario 3556,1 >>杀死 |cRXP_ENEMY_Doubts|r 和 |cRXP_ENEMY_Fears.|r
    .mob Fear
    .mob Doubt
    .isOnQuest 49266
step
    .goto 933,16.92,46.28,5 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,16.92,46.28
    .scenario 3570,1 >>|cRXP_WARN_等待 |cRXP_FRIENDLY_T'paartos|r 到达。|r
    .isOnQuest 49266
step
    .goto 933,11.35,50.13,5 >>进入|cFFfa9602洞穴。|r
    .timer 3, Terror activates in...
    .isOnQuest 49266
step
    .goto 933,8.57,50.04
    .scenario 3571,1 >>|cRXP_WARN_杀死|cRXP_ENEMY_Terror。|r|r
    .mob Terror
    .isOnQuest 49266
step
    .goto 933,17.25,46.42,10 >>离开|cFFfa9602洞穴。|r
    .isOnQuest 49266
step
    .goto 933,41.85,58.85,10 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,41.85,58.85
    .scenario 3572,1 >>|cRXP_WARN_等待 |cRXP_FRIENDLY_T'paartos|r 到达。|r
    .isOnQuest 49266
step
    .goto 933,46.79,65.98
    .scenario 3573,1 >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_T'paartos 互动。|r
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,66.37,77.37,10 >>|cRXP_WARN_前往箭头所指的位置。|r
    .isOnQuest 49266
step
    .goto 933,66.37,77.37
    .scenario 3579,1 >>|cRXP_WARN_等待 |cRXP_FRIENDLY_T'paartos|r 到达。|r
    .isOnQuest 49266
step
    .goto 933,68.51,77,5 >>|cRXP_WARN_走下螺旋楼梯。|r
    .isOnQuest 49266
step
    .goto 933,63.78,71.47,5,0
    .goto 933,61.53,75.87,5,0
    .goto 933,68.36,77.08
    .scenario 3574,1 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(1)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,61.53,75.87,5 >>|cRXP_WARN_深入|cFFfa9602洞穴。|r|r
    .isOnQuest 49266
step
    .goto 933,65.73,73.57
    .scenario 3574,2 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(2)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,72.31,86.51
    .scenario 3574,3 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(3)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,73.59,75.21,15,0
    .goto 933,69.63,68.27
    .scenario 3574,4 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(4)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,65.16,71.82,15,0
    .goto 933,63.03,74.51
    .scenario 3574,5 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(5)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,64.02,81.39,15,0
    .goto 933,69.6,77.79
    .scenario 3574,6 >>|cRXP_WARN_与 |cRXP_FRIENDLY_T'paartos 交互。|r|r(6)
    .target T'paartos
    .isOnQuest 49266
step
    .goto 933,68.59,88.86,15,0
    .goto 933,73.39,94.59
    >>杀死 |cRXP_ENEMY_堕落者T'paartos|r
    .complete 49266,1 --Forge of Aeons scenario completed
    .mob T'paartos the Fallen
    .isOnQuest 49266
    --x wrong scenaruio id fix
step
    #completewith next
    .link /script C_PartyInfo.LeaveParty() >>|cRXP_WARN_单击此处可获得一个宏，您可以通过在聊天中输入该宏来退出群组。|r
    +|cRXP_WARN_您也可以使用其他标准方法离开。|r
    .isOnQuest 49266
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_法瑞亚船长|r and |cRXP_FRIENDLY_大主教图拉扬|r
    .turnin 49266 >>交任务: |cRXP_FRIENDLY_万世熔炉|r
    .goto 940,48.453,39.556
    .target +法瑞亚船长
    .accept 50071 >>接任务: |cRXP_WARN_为圣光而战！|r
    .goto 940,47.468,40.178
    .target +大主教图拉扬
step
    #completewith next
    .goto 941,43.180,24.938
    >>下楼
    .zone 84 >>点击|cRXP_PICK_前往暴风城的门户|r
step
    .goto 84,52.79,14.51,5,0
    .goto 84,52.05,13.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 50071 >>交任务: |cRXP_FRIENDLY_为圣光而战！|r
    .target Aysa Cloudsinger
]])
