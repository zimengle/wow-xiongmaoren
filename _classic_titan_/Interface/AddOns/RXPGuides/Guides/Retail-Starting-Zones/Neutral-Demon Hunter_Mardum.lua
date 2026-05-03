RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#name 1零售-恶魔猎手_Mardum
#displayname Demon Hunter Starting Zone
#next RestedXP 联盟 10-60\\1A_艾尔文森林 << Alliance
#next RestedXP 部落 10-60\\1 BfA 简介 << Horde

<< DemonHunter

step
    #completewith DemonHunterIntroduction
    +欢迎来到 RestedXP 的 |cFFfa9602恶魔猎手起始区|r 指南。
step
    #completewith next
    +|cRXP_WARN_在快速通关方面，请始终留意该区域的绿色水晶。这些水晶可消除整整两分钟的邪能冲刺冷却时间，从而大幅提升邪能冲刺技能。这可让您以更快的速度穿越该区域并更有效地清除障碍物。|r
    .link https://gyazo.com/6cedfe6dd0314f2d85731f829b322e35 >>图片链接：强化邪能水晶
step
    #label DemonHunterIntroduction
    .goto 672,22.07,55.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    *|cRXP_WARN_Be prepared for a brief roleplay segment before you can take on Kayn's Quest. If you use your Spectral Sight ability swiftly you can skip the initial roleplay.|r
    .accept 40077 >>接任务: |cRXP_WARN_入侵开始|r
    .target Kayn Sunfury
step
    .goto 672,23.85,57.20,30,0
    .goto 672,28.46,65.88,30,0
    .goto 672,28.67,62.9
    >>杀死|cRXP_ENEMY_Demons|r
    .complete 40077,1 --15/15 Demons slain
    --x .mobs
step
    .goto 672,28.67,62.9
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Legion 网关。|r
    >>|cRXP_WARN_按下键盘上的“Esc”键即可跳过电影。|r
    .complete 40077,2 --Change the Legion Banner
step
    .goto 672,28.6,63.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 40077 >>交任务: |cRXP_FRIENDLY_入侵开始|r
    .accept 40378 >>接任务: |cRXP_WARN_加入伊利达雷：灰舌|r
    .target Kayn Sunfury
step
    #sticky
    #label MardumAssaultonMardum
    .goto 672,38.73,45.39,0,0
    >>Kill |cRXP_ENEMY_enemies|r and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Legion Communicator|r in the area.
    .accept 39279 >>接任务: |cRXP_WARN_突袭马顿|r
    .complete 39279,1 --Assault the Legion in the lowlands (100%)
    --x .mob
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,29.73,62.37,10,0
    .goto 672,28.83, 61.25,8 >>检查强化邪能水晶（绿色邪能水晶）。
step
    .goto 672,31.57,61.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Legion Banner|r
    .complete 40378,1 --1/1 Ashtongue forces
step
    .goto 672,31.51,62.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Felsaber 互动。|r
    .complete 40378,2 --1/1 Accept Illidan's Gift
    .target Felsaber
step
    #title Check for Fel Crystal
    #completewith next
    .goto 672,31.97,65.82,8 >>检查强化邪能水晶（绿色邪能水晶）。
step
    .goto 672,31.83,65.43,5,0
    .goto 672,33.94,70.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Legion 网关。|r
    .complete 40378,3 --1/1 Find Allari to the southeast
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Allari the Souleater|r and |cRXP_FRIENDLY_Sevis Brightflame|r
    .turnin 40378 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：灰舌|r
    .accept 38759 >>接任务: |cRXP_WARN_解救同胞|r
    .accept 39049 >>接任务: |cRXP_WARN_盯紧目标|r
    .goto 672,33.94,70.05
    .accept 40379 >>接任务: |cRXP_WARN_加入伊利达雷：库斯卡|r
    .goto 672,33.94,69.96
    .target Allari the Souleater
    .target Sevis Brightflame
step
    .goto 672,34.86,70.21
    .turnin 39970 >>交任务: |cRXP_FRIENDLY_[7.0 DH-Mardum - Small Treasure Chest 000]|r
step
    #completewith next
    .goto 672,33.82,70.10,10 >>离开小洞穴
step
    #completewith next
    .cast 193547 >>使用 |T441143:0|t[邪能水晶碎片] 来获得移动速度和伤害增益
    *|cRXP_WARN_Refresh when buff is fading.|r
step
    .goto 672,39.00,73.24
    >>杀死一名 |cff00ecffAnguish Jailer|r 并从他身上夺取 |cRXP_LOOT_Soulwrought Key|r
    .complete 38759,1 --1/1 Soulwrought Key
step
    .goto 672,39.34,71.64
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r
    .complete 38759,3 --1/1 Cyana Nightglaive freed
step
    .goto 672,41.74,73.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Cage|r 和 |cRXP_PICK_Legion Communicator|r
    .complete 38759,2 --1/1 Belath Dawnblade freed
step
    .goto 672,42.63,79.37
    >>杀死|cff00ecffInquisitor Baleful|r。
    *|cRXP_WARN_While he is immune, refrain from moving away from him to prevent him from evading.|r
    .complete 39049,1 --1/1 Inquisitor Baleful slain & power taken
    .mob Inquisitor Baleful
step
    .goto 672,43.43,72.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_灰舌秘术师|r
    .complete 40379,1 --1/1 Soul sacrificed
    .skipgossip
    .target Ashtongue Mystic
step
    .goto 672,43.75,72.07
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Legion 网关|r
    .complete 40379,2 --1/1 Coilskar forces
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,42.38,70.68,10 >>检查熔岩里面的强化邪能水晶（绿色邪能水晶）|cfff78300。
step
    .goto 672,41.56,66.60
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Cage。|r
    .complete 38759,5 --1/1 Mannethrel Darkstar freed
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,41.31,67.02,10,0
    .goto 672,38.74,68.27,10 >>检查洞穴上方是否有强化魔能水晶（绿色魔能水晶）|cfff78300|r。如果不存在，你可以手动跳过此步骤
step
    .goto 672,38.58,67.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r
    .complete 38759,4 --1/1 Izal Whitemoon freed
step
    #completewith next
    .goto 672,39.20,68.70,10 >>离开小洞穴
step
    .goto 672,38.8,60.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .turnin 38759 >>交任务: |cRXP_FRIENDLY_解救同胞|r
    .turnin 39049 >>交任务: |cRXP_FRIENDLY_盯紧目标|r
    .turnin 40379 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：库斯卡|r
    .target Jace Darkweaver
step
    .goto 672,38.8,60.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .accept 39050 >>接任务: |cRXP_WARN_恶魔蛛后|r
    .target Jace Darkweaver
step
    .goto 672,38.75,60.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Nether Crucible|r
    >>|cRXP_WARN_按下键盘上的“Esc”键即可跳过电影。|r
    .complete 39050,1 --1/1 Ritual completed
step
    .goto 672,38.8,60.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .turnin 39050 >>交任务: |cRXP_FRIENDLY_恶魔蛛后|r
    .accept 38765 >>接任务: |cRXP_WARN_加入伊利达雷：破坏魔|r
    .accept 38766 >>接任务: |cRXP_WARN_力挽狂澜|r
    .target Jace Darkweaver
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,41.13,52.29,10 >>检查洞穴上方的强化邪能水晶（绿色邪能水晶）|cfff78300|r。
step
    >>杀死|cff00ecffBeliash|r
    .goto 672,35.16,39.30
    .complete 38766,1 --1/1 Beliash slain & power taken
    .mob Beliash
step
    .goto 672,39.69,39.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sevis|r
    >>|cRXP_WARN_在“Eye Beam”演出期间你可以行走|r
    .complete 38765,1 --1/1 Sacrifice made
    .skipgossip 1
step
    .goto 672,40.33,38.41
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Legion 网关|r
    .complete 38765,2 --1/1 Shivarra forces
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,42.03,39.31,10 >>检查洞穴上方的强化邪能水晶（绿色邪能水晶）|cfff78300|r。
step
    #rqeuires MardumAssaultonMardum
    #completewith next
    +|cfff78300上马，沿路前行|r
step
    #rqeuires MardumAssaultonMardum
    .goto 672,60.51,44.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 38765 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：破坏魔|r
    .turnin 38766 >>交任务: |cRXP_FRIENDLY_力挽狂澜|r
    .target Kayn Sunfury
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .goto 672,60.51,44.75
    .accept 38813 >>接任务: |cRXP_WARN_战前动员|r
step
    .goto 672,59.23,46.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lady S'theno|r
    .complete 38813,2 --1/1 Lady S'theno briefed
    .skipgossip
    .target Lady S'theno
step
    .goto 672,61.0,46.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Matron Mother|r
    .complete 38813,3 --1/1 Matron Mother Malevolence briefed
    .skipgossip
step
    .goto 672,62.2,46.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Battlelord Gaardoun|r
    .complete 38813,1 --1/1 Battlelord Gaardoun briefed
    .skipgossip
    .target Battlelord Gaardoun
step
    .goto 672,60.51,44.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 38813 >>交任务: |cRXP_FRIENDLY_战前动员|r
    .accept 39262 >>接任务: |cRXP_WARN_视人所不能|r
    .target Kayn Sunfury
step
    #completewith next
    .cast 200749 >>按 N 并选择专业化（推荐：Havoc）
step
    .goto 672,64.05,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .complete 39262,1 --1/1 Speak with Jace Darkweaver
    .skipgossip 96436,1
    .target Jace Darkweaver
step
    .goto 672,63.97,52.73
    >>面向洞穴时使用 |T188501:0|tSpectral Sight |cRXP_WARN_。|r
    .complete 39262,2 --1/1 Face the Cave & 使用幽灵视线
    .usespell 188501
step
    .goto 672,64.05,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .turnin 39262 >>交任务: |cRXP_FRIENDLY_视人所不能|r
    .accept 39495 >>接任务: |cRXP_WARN_无所遁形|r
    .target Jace Darkweaver
step
    #completewith next
    .goto 673,44.24,51.08,8,0
    .goto 673,51.31,55.88,8,0
    .goto 673,55.17,56.64,8 >>进入洞穴并使用双跳爬上左侧的壁架。
step
    .goto 673,59.1,61.9
    >>杀死 |cff00ecff 邪能领主卡扎|r
    .complete 39495,1 --1/1 Caza slain & power taken
    .target Fel Lord Caza
step
    .goto 673,54.77,58.28
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_chest|r 获取戒指。
    .turnin 39973,1 >>交任务: |cRXP_FRIENDLY_[7.0 DH-Mardum - Small Treasure Chest 003]|r
step
    #completewith next
    .hs >>使用炉石 |cFFfa9602到伊利达雷据点|r
step
    .goto 672,60.51,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 39495 >>交任务: |cRXP_FRIENDLY_无所遁形|r
    .accept 38727 >>接任务: |cRXP_WARN_阻止轰炸|r
    .target Kayn Sunfury
step
    .goto 672,60.56,44.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyana Nightglaive|r
    .accept 38819 >>接任务: |cRXP_WARN_大军压境|r
    .target Cyana Nightglaive
step
    .goto 672,60.52,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Allari the Souleater|r
    .accept 38725 >>接任务: |cRXP_WARN_深入邪污产床|r
    .target Allari the Souleater
step
    #completewith
    >>杀死该区域内的 |cRXP_ENEMY_mobs|r
    .complete 38819,1 --War progress (100%)
    --x .mob
step
    .goto 672,69.26,48.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Object|r
    .complete 38727,1 --1/1 Doom Fortress Devastator
step
    #completewith next
    .goto 672,72.39,46.87,15,0
    .goto 672,73.13,45.85,15 >>使用双跳来爬墙。
step
    #completewith next
    .goto 672,75.01,41.08
    .cast 6477 >>放置横幅
step
    #completewith next
    .complete 38727,2 --1/1 Forge of Corruption Devastator
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kor'vas|r
    .goto 672,73.15,33.83
    .turnin 38725 >>交任务: |cRXP_FRIENDLY_深入邪污产床|r
    .accept 40222 >>接任务: |cRXP_WARN_鬼母魔典|r
step
    .goto 672,77.05,28.04
    >>杀死 |cff00ecffProlifica|r 并从她身上夺取 |cRXP_LOOT_Tome of Fel Secrets|r
    .complete 40222,1 --1/1 Tome of Fel Secrets
step
    #completewith next
    .goto 672,73.68,32.16,10 >>离开洞穴
step
    #label MardumStoptheBombardment
    #completewith next
    .goto 672,66.39,30.40
    .cast 6477 >>放置横幅
step
    #sticky
    #label Area1
    .goto 672,68.21,28.06,25,0
    .goto 672,66.23,25.97,25,0
    .goto 672,64.89,27.25,30,0
    .goto 672,63.71,29.63
    >>杀死该区域内的 |cRXP_ENEMY_mobs|r
    .complete 38819,1 --War progress (100%)
    --x .mob
step
    .complete 38727,3 --1/1 Soul Engine Devastator
step
    #requires Area1
    #completewith next
    +|cfff78300骑上马，跟着箭头走|r
step
    #requires Area1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r and |cRXP_FRIENDLY_Kor'vas|r
    >>|cRXP_WARN_如果你仍然拥有邪能冲刺增益，你可以直接使用邪能冲刺越过深渊到达凯隐|r
    .turnin 38727 >>交任务: |cRXP_FRIENDLY_阻止轰炸|r
    .turnin 38819 >>交任务: |cRXP_FRIENDLY_大军压境|r
    .goto 672,60.52,44.76
    .turnin 40222 >>交任务: |cRXP_FRIENDLY_鬼母魔典|r
    .accept 40051 >>接任务: |cRXP_WARN_邪魔之秘|r
    .goto 672,60.5,44.8
    .target Kayn Sunfury
    .target Kor'vas Blodthorn
step
    .goto 672,60.56,44.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_book|r 并选择专业化 |cRXP_WARN_（推荐：Havoc）|r
    .complete 40051,1 --1/1 Choose between Havoc & Vengeance
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 40051 >>交任务: |cRXP_FRIENDLY_邪魔之秘|r
    .accept 39516 >>接任务: |cRXP_WARN_传授浩劫专精|r
    .target Kayn Sunfury
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_NPC's|r
    .complete 39516,4 --1/1 Kor'vas taught
    .complete 39516,1 --1/1 Allari taught
    .complete 39516,3 --1/1 Kayn taught
    .complete 39516,2 --1/1 Cyana taught
    .skipgossip 1
    .skipgossip 93127,2
    .target Kor'vas Bloodthorn
    .target Allari the Souleater
    .target Kayn Sunfury
    .target Cyana Nightglaive
    --x fix npc order / talk to
step
    .goto 672,60.25,44.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mannethrel Darkstar|r
    .complete 39516,5 --1/1 Mannethrel taught
    .skipgossip 2
    .target Mannethrel Darkstar
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 39516 >>交任务: |cRXP_FRIENDLY_传授浩劫专精|r
    .accept 39663 >>接任务: |cRXP_WARN_搭乘魔蝠|r
    .target Kayn Sunfury
step
    .goto 672,62.52,44.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Izal Whitemoon|r |cRXP_WARN_after doing /sit.|r
    .complete 39663,1 --1/1 Ride to the Fel Hammer
    .skipgossip
step
    #completewith next
    .goto 672,69.9,44.2,40,0
    +跳入深渊，走向死亡，等待复活
step
    .goto 672,69.93,44.23
    >>Engage the |cRXP_ENEMY_Brood Queen Tyranna|r in combat and persist until she retreats into the shadows then |Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyana Nightglaive|r
    .turnin 39663 >>交任务: |cRXP_FRIENDLY_搭乘魔蝠|r
    .target Cyana Nightglaive
    .mob Brood Queen Tyranna
step
    .goto 672,69.9,44.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyana Nightglaive|r
    .accept 38728 >>接任务: |cRXP_WARN_钥石|r
    .target Cyana Nightglaive
step
    .goto 672,70.0,40.6
    >>杀死 |cff00ecff 育雏女王 Tyranna|r 并从她身上夺取 |cRXP_LOOT_Sargerite 按键tone|r
    .complete 38728,1 --1/1 Sargerite 按键ton
    .mob Brood Queen Tyranna
step
    .goto 672,70.88,39.09,-1
    .goto 672,70.95,41.90,-1
    .goto 672,68.84,41.97,-1
    .goto 672,68.80,39.13,-1
    >>前往|cRXP_WARN_downstairs|r
    .complete 38728,2 --1/1 Find the way downstairs
step
    .goto 672,69.86,37.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    >>|cRXP_WARN_等待简短的角色扮演，当计时器用完时将完成。|r
    .turnin 38728 >>交任务: |cRXP_FRIENDLY_钥石|r
    .timer 7,Roleplay Duration
    .accept 38729 >>接任务: |cRXP_WARN_返回黑暗神殿|r
step
    .goto 672,69.85,37.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Sargerite 钥石。|r
    .complete 38729,1 --1/1 Sargerite 按键tone activated
step
    .goto 672,69.85,37.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_WARN_Fel Portal|r
    .turnin 38729 >>交任务: |cRXP_FRIENDLY_返回黑暗神殿|r
step
    .goto 677,80.09,36.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛维·影歌|r
    .accept 38672 >>接任务: |cRXP_WARN_生死逃亡|r
    .target Maiev Shadowsong
step
    .goto 677,78.63,38.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Altruis 的单元格。|r
    .complete 38672,1 --1/1 Altruis freed
step
    .goto 677,78.59,34.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Kayn 的手机。|r
    .complete 38672,2 --1/1 Kayn freed
step
    .goto 677,77.8,35.7
    >>|cRXP_WARN_等待简短的角色扮演，当计时器用完时将完成。|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Lever。|r
    .turnin 38672 >>交任务: |cRXP_FRIENDLY_生死逃亡|r
    .timer 8,Roleplay Duration
step
    .goto 677,74.47,35.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .accept 38690 >>接任务: |cRXP_WARN_伊利达雷的崛起|r
    .target Kayn Sunfury
step
    .goto 677,74.42,37.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_受难者奥图里斯|r
    .accept 38689 >>接任务: |cRXP_WARN_邪能灌注|r
    .target Altruis the Sufferer
step
    #completewith next
    >>|cRXP_WARN_取得一些进展至关重要，但要避免完全完成它。|r
    .complete 39742,1 -- Repel the Legion Attackers
step
    #sticky
    #label Area2
    >>Tag as many |cRXP_ENEMY_Savage Stalkers|r as possible and kill them while |TInterface/cursor/crosshair/interact.blp:20|tclicking |cRXP_PICK_cells|r
    .complete 38689,1 --100/100 Fel Energy regained
    .mob Savage Stalker
step
    .goto 677,75.04,39.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,1 --8/8 Imprisoned Illidari freed
step
    .isOnQuest 38690
    .goto 677,74.46,32.53,8 >>使用双跳爬上壁架。
step
    .goto 677,72.14,32.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,2 --8/8 Imprisoned Illidari freed
step
    .goto 677,71.01,27.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,3 --8/8 Imprisoned Illidari freed
step
    .goto 677,66.10,31.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,4 --8/8 Imprisoned Illidari freed
step
    .goto 677,63.12,33.82
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,5 --8/8 Imprisoned Illidari freed
step
    .isOnQuest 38690
    .goto 677,63.55,39.87,8 >>双跳壁架
step
    .goto 677,65.95,40.93
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,6 --8/8 Imprisoned Illidari freed
step
    .goto 677,66.37,43.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,7 --8/8 Imprisoned Illidari freed
step
    .goto 677,71.87,43.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Warden Cell|r
    .complete 38690,1,8 --8/8 Imprisoned Illidari freed
step
    #requires Area2
    #completewith next
    .goto 677,61.52,36.49,20,0
    .goto 677,51.23,37.05,20 >>|cRXP_WARN_跟随箭头|r
step
    #requires Area2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_受难者奥图里斯|r, Kayn Sunfury, |cRXP_FRIENDLY_玛维·影歌|r
    .turnin 38689 >>交任务: |cRXP_FRIENDLY_邪能灌注|r
    .goto 677,49.68,49.3
    .turnin 38690 >>交任务: |cRXP_FRIENDLY_伊利达雷的崛起|r
    .goto 677,49.17,49.48
    .accept 38723 >>接任务: |cRXP_WARN_阻止古尔丹！|r << Female
    .accept 40253 >>接任务: |cRXP_WARN_阻止古尔丹！|r << Male
    .goto 677,49.46,49.76
    .target Altruis the Sufferer
    .target Kayn Sunfury
    .target Maiev Shadowsong
step
    .goto 677,50.1,74.5
    >>杀死 |cff00ecffCrusher Sledge|r。
    *|cRXP_WARN_They have shared HP|r
    .complete 38723,2 << Female --1/1 Crusher & Sledge slain & power taken
    .complete 40253,2 << Male --1/1 Crusher & Sledge slain & power taken
    .mob Crusher
    .mob Sledge
step
    .goto 677,50.75,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kayn Sunfury|r
    .turnin 38723 >>交任务: |cRXP_FRIENDLY_阻止古尔丹！|r << Female
    .turnin 40253 >>交任务: |cRXP_FRIENDLY_阻止古尔丹！|r << Male
    .accept 39682 >>接任务: |cRXP_WARN_侠盗蝙蝠手|r
    .target Kayn Sunfury
step
    #completewith next
    .goto 677,50.06,37.06,15,0
    .goto 677,42.93,32.10,15,0
    .goto 677,54.04,29.34,15 >>|cRXP_WARN_按照上行路线|r
step
    .goto 677,49.58,30.63
    >>|cRXP_WARN_完成此事的最后机会。|r
    .complete 39742,1 -- Repel the Legion Attackers
step
    .goto 677,54.27,29.14,15,0
    .goto 677,48.51,20.14
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Vampiric Felbat|r 互动
    .complete 39682,1 --1/1 Ride a Vampiric Felbat to the Upper Vault
    .target Vampiric Felbat
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kor'vas Bloodthorn|r and |cRXP_FRIENDLY_Allari the Souleater|r
    .goto 678,41.33,47.33
    .turnin 39682 >>交任务: |cRXP_FRIENDLY_侠盗蝙蝠手|r
    .accept 39685 >>接任务: |cRXP_WARN_冻结时光|r
    .accept 39684 >>接任务: |cRXP_WARN_发送光线|r
    .accept 39683 >>接任务: |cRXP_WARN_战火锤炼|r << Female
    .accept 40254 >>接任务: |cRXP_WARN_战火锤炼|r << Male
    .goto 678,41.12,47.17
    .target Kor'vas Bloodthorn
    .target Allari the Souleater
step
    .goto 678,46.77,36.91,15,0
    .goto 678,46.7,17.8
    >>杀死|cff00ecffImmolanth|r
    .complete 39683,1 << Female --1/1 Immolanth slain & power taken
    .complete 40254,1 << Male --1/1 Immolanth slain & power taken
    .mob Immolanth
step
    .goto 678,46.74,36.41,15,0
    .goto 678,54.76,48.15,15,0
    .goto 678,70.54,49.62
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Mirror|r
    *|cRXP_WARN_Make sure to dodge the discs|r
    .complete 39684,1 --1/1 Mirror rotated
step
    .goto 678,59.05,48.2,10,0
    .goto 678,52.93,58.45,15,0
    .goto 678,46.84,66.84,10,0
    .goto 678,50.1,78.2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,1 --1/1 Eastern Countermeasure activated
step
    .goto 678,56.77,51.86,15,0
    .goto 678,48.44,63.66,15,0
    .goto 678,46.8,84.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,2 --1/1 Southern Countermeasure activated
step
    .goto 678,43.4,78.2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,3 --1/1 Western Countermeasure activated
step
    .goto 678,46.63,66.17,8,0
    .goto 678,46.83,60.12,8,0
    .goto 678,41.1,47.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Allari the Souleater|r
    .turnin 39685 >>交任务: |cRXP_FRIENDLY_冻结时光|r
    .turnin 39683 >>交任务: |cRXP_FRIENDLY_战火锤炼|r << Alliance
    .turnin 40254 >>交任务: |cRXP_FRIENDLY_战火锤炼|r << Horde
    .turnin 39684 >>交任务: |cRXP_FRIENDLY_发送光线|r
    .accept 39686 >>接任务: |cRXP_WARN_一路向上|r
    .target Allari the Souleater
step
    .goto 678,46.69,48.12
    >>|cRXP_WARN_前往电梯所在位置并耐心等待电梯的到来。|r
    .complete 39686,1 --1/1 Ascend to the Hall of Judgment
step
    .goto 679,24.41,55.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kor'vas Bloodthorn|r
    .turnin 39686 >>交任务: |cRXP_FRIENDLY_一路向上|r
    .accept 40373 >>接任务: |cRXP_WARN_新的方向|r
    .target Kor'vas Bloodthorn
step
    .goto 679,24.52,53.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_判断池。|r
    .complete 40373,1 --1/1 Pool of Judgment viewed
step
    .goto 679,24.52,53.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Kor'vas Bloodthorn, |cRXP_FRIENDLY_凯尼斯·静风|r, |cRXP_FRIENDLY_受难者奥图里斯|r
    .complete 40373,2 --1/1 Choose between Kayn and Altruis
    .target Kor'vas Bloodthorn
step
    >>跳过无法手动接受的任务
    .goto 679,24.4,55.8
    .turnin 40373 >>交任务: |cRXP_FRIENDLY_新的方向|r
    .accept 39688 >>接任务: |cRXP_WARN_自由的绊脚石|r << NightElf
    .accept 40255 >>接任务: |cRXP_WARN_自由的绊脚石|r << NightElf
    .accept 39694 >>接任务: |cRXP_WARN_自由的绊脚石|r << BloodElf
    .accept 40256 >>接任务: |cRXP_WARN_自由的绊脚石|r << BloodElf
step
    #completewith MardumBetweenUsAndFreedom
    .goto 679,24.44,72.11,10,0
    .goto 679,32.57,77.47,10,0
    .goto 679,39.46,80.59,20 >>|cRXP_WARN_跟随箭头|r
step
    .isOnQuest 40256
    >>杀死|cff00ecffBastillax|r
    .goto 679,50.34,77.76
    .complete 40256,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 39694
    >>杀死|cff00ecffBastillax|r
    .goto 679,50.34,77.76
    .complete 39694,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 40255
    >>杀死|cff00ecffBastillax|r
    .goto 679,50.34,77.76
    .complete 40255,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 39688
    >>杀死|cff00ecffBastillax|r
    .goto 679,50.34,77.76
    .complete 39688,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    #completewith next
    .goto 679,63.39,80.28,10,0
    .goto 679,72.67,78.62,5,0
    .goto 679,78.89,80.04,5,0
    .goto 679,78.22,87.79,5 >>双跳 + 邪能冲击爬上山，迫使卡德加提前重生
    >>|cRXP_WARN_密切关注航点|r
step
    #label MardumBetweenUsAndFreedom
    .goto 679,83.98,82.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_受难者奥图里斯|r
    .turnin -39688 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << NightElf
    .turnin -40255 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << NightElf
    .turnin -40256 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << BloodElf
    .turnin -39694 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << BloodElf
    .target Altruis the Sufferer
step << Alliance
    .goto 679,85.98,84.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Khadgar|r
    .accept 39689 >>接任务: |cRXP_WARN_伊利达雷，出发吧|r
    .turnin 39689 >>交任务: |cRXP_FRIENDLY_伊利达雷，出发吧|r
    .target Archmage Khadgar
step << Alliance
    .goto 84,72.55,47.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Khadgar|r
    .accept 39691 >>接任务: |cRXP_WARN_战斗的召唤|r
    .target Archmage Khadgar
step << Alliance
    .goto 84,83.73,34.40
    .complete 39691,1 --1/1 Enter |cFFfa9602the Throne Room.|r
step << Alliance
    .goto 84,84.39,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .turnin 39691 >>交任务: |cRXP_FRIENDLY_战斗的召唤|r
    .accept 44471 >>接任务: |cRXP_WARN_洞察视觉|r
    .target Jace Darkweaver
step << Alliance
    >>|cRXP_WARN_使用光谱视线|r
    .complete 44471,1 --1/1 Spectral Sight used
    .usespell 188501
step << Alliance
    .goto 84,84.39,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jace Darkweaver|r
    .turnin 44471 >>交任务: |cRXP_FRIENDLY_洞察视觉|r
    .accept 44463 >>接任务: |cRXP_WARN_恶魔四伏|r
    .target Jace Darkweaver
step << Alliance
    .goto 84,85.90,31.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安度因·乌瑞恩|r
    .complete 44463,1 --1/1 Warn 安度因·乌瑞恩
    .skipgossip
    .target 安度因·乌瑞恩
step << Alliance
    >>杀死|cRXP_ENEMY_Demons|r
    .complete 44463,2 --5/5 Demons slain
    --x .mob
step << Alliance
    .goto 84,85.75,31.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安度因·乌瑞恩|r
    .turnin 44463 >>交任务: |cRXP_FRIENDLY_恶魔四伏|r
    安度因·乌瑞恩
step << Alliance
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .nodmf
    .isQuestTurnedIn 44463 --x DH Check
    .target Renato Gallina
step <<Alliance
    #completewith next
    .goto 84,73.04,47.56,25,0
    .goto 84,67.45,57.19,25,0
    .goto 84,68.59,62.19,25,0
    .goto 84,66.03,64.49,25,0
    .goto 84,64.39,67.14,25,0
    .goto 84,63.89,72.21,35,0
    .goto 84,68.07,79.75,25,0
    .goto 84,70.1,79.88,25,0
    .goto 84,70.41,84.03,25,0
    .goto 84,70.92,72.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fp >>获取金郡飞行路线
    .nodmf
    .isQuestTurnedIn 44463 --x DH Check
    .target Bartlett the Brave
step <<Alliance
    #veteran
    .goto 84,61.48,31.72,5,0
    .goto 84,60.1,32.22
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师劳菲尔|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Lauffer
    .target Auctioneer Hesse
    .target Auctioneer Fitzgerald
    .dmf
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #label DarkMoonFaire
    .goto 84,80.46,37.71,10,0
    .goto 84,72.51,46.59,30,0
    .goto 84,70.27,46.83,10,0
    .goto 84,62.1,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .isQuestTurnedIn 40378 --x Demon Hunter Check
    .dmf
    .target Darkmoon Faire Mystic Mage
step <<Alliance
    .goto 84,62.25,72.96
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .skipgossip
    .zoneskip 37
    .dmf
    .isQuestTurnedIn 31450 --x dh check
    .target Darkmoon Faire Mystic Mage
step << Horde
    .goto 679,85.98,84.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Khadgar|r
    .accept 39690 >>接任务: |cRXP_WARN_伊利达雷，出发吧|r
    .turnin 39690 >>交任务: |cRXP_FRIENDLY_伊利达雷，出发吧|r
    .target Archmage Khadgar
step << Horde
    .goto 85,52.53,88.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Archmage Khadgar|r
    .accept 40976 >>接任务: |cRXP_WARN_大酋长的接见|r
    .target Archmage Khadgar
step << Horde
    .goto 85,50.0,76.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Saurfang|r
    .complete 40976,1 --1/1 Report to Saurfang
    .target Saurfang
step << Horde
    .goto 1,45.8,15.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Allari the Souleater|r
    .turnin 40976 >>交任务: |cRXP_FRIENDLY_大酋长的接见|r
    .accept 40982 >>接任务: |cRXP_WARN_洞察视觉|r
    .target Allari the Souleater
step << Horde
    .goto 1,45.8,15.1
    >>|cRXP_WARN_使用光谱视线|r
    .complete 40982,1 --1/1 Spectral Sight used
    .usespell 188501
step << Horde
    .goto 1,45.8,15.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Allari the Souleater|r
    .turnin 40982 >>交任务: |cRXP_FRIENDLY_洞察视觉|r
    .accept 40983 >>接任务: |cRXP_WARN_恶魔四伏|r
    .target Allari the Souleater
step << Horde
    .goto 1,45.7,15.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_希尔瓦娜斯·风行者|r
    .complete 40983,1 --1/1 Warn Warchief Sylvanas
    .target Lady Sylvanas Windrunner
step << Horde
    .goto 1,45.80,14.77,15,0
    .goto 1,46.67,14.75,15,0
    .goto 1,46.94,16.50,15,0
    .goto 1,46.41,17.88,15,0
    .goto 1,45.60,16.47,15,0
    .goto 1,46.19,15.65
    >>杀死|cRXP_ENEMY_Demons|r
    .complete 40983,2 --12/12 Demons slain
    --x .mob
step << Horde
    .goto 1,45.68,15.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_希尔瓦娜斯·风行者|r
    .turnin 40983 >>交任务: |cRXP_FRIENDLY_恶魔四伏|r
    .accept 41002 >>接任务: |cRXP_WARN_部落的武器|r
    .target Lady Sylvanas Windrunner
]])
