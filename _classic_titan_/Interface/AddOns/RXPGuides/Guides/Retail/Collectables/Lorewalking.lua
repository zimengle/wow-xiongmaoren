RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 探索背景故事
#name a) 哈拉塔斯
#displayname Xal'atath
#next 乙) 空灵


step << Alliance
    .goto 84,64.24,16.10,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或暴风城
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step << Horde
    .goto 85,54.24,56.59,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或奥格瑞玛
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step
    .goto 85,54.19,56.75,-1 << Horde
    .goto 84,64.24,16.10,-1 << Alliance
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈 
    .accept 84371 >>接受传说之旅：刀锋与大祭司
    .skipgossipid 124311
    .choose 6403389
    .timer 39,RP
    .target Lorewalker Cho
step
    .goto 85,54.19,56.75,-1 << Horde
    .goto 84,64.24,16.10,-1 << Alliance
    .goto 2339,49.6,31.63,-1
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 84371,1 --1/1 Talk to Lorewalker Cho to learn about the Legion invasion
    .target Lorewalker Cho 
step
    .goto 85,54.19,56.75,-1 << Horde
    .goto 84,64.24,16.10,-1 << Alliance
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 84371,2 --1/1 Talk to Lorewalker Cho to learn of the High Priest's journey
    -- .skipgossipid 124811
    -- .skipgossipid 124812
    .skipgossipid 124809
    .target Lorewalker Cho
step
    .isOnQuest 84371
    .zone 18 >>进入提拉斯法尔沼泽
step
    #completewith next
    #label Blade in Twilight
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔隆努斯·法尔|r交谈
    .accept 40710 >>接任务: |cRXP_WARN_暮光之刃|r
    .target Alonsus Faol
step
    #completewith Blade in Twilight
    .goto 18,12.82,59.21
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires Blade in Twilight
    .goto 18,12.79,59.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔隆努斯·法尔|r交谈
    .accept 40710 >>接任务: |cRXP_WARN_暮光之刃|r
    .target Alonsus Faol
step
    .isOnQuest 40710
    .goto 18,13.47,57.59
    #title |cFFFCDC00跟随箭头指引|r
    .complete 40710,1 --1/1 Go to the marked location in Tirisfal Glades
step
    .isOnQuest 40710
    .goto 18,13.47,57.59
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Notes|r
    .scenario 2221,1
step
    .isOnQuest 40710
    .goto 18,13.2,55.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击帐篷中的|cRXP_PICK_Notes|r|cRXP_WARN_提示|r
    .scenario 2221,2
step
    .isOnQuest 40710
    .goto 18,13.91,55.4
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Notes|r
    .scenario 2221,3
step
    .isOnQuest 40710
    #completewith next
    #hidewindow
    #label Tomb
    #title |cFFFCDC00跟随箭头指引|r
    .scenario 2031,1
step
    .isOnQuest 40710
    #completewith Tomb
    .goto 20,37.32,13.37,10,0
    .goto 20,36.24,17.16,10,0
    .goto 20,34.22,22.72,10,0
    .goto 20,34.92,28.92,10 >>进入墓穴|cRXP_WARN_在湖底|r
step
    .isOnQuest 40710
    #requires Tomb
    #title |cFFFCDC00跟随箭头指引|r
    .scenario 2031,1
step
    .isOnQuest 40710
    #completewith next
    #label Twilight Shadowcaster
    >>击杀|cRXP_ENEMY_Twilight Shadowcaster|r和|cRXP_ENEMY_Twilight Bladetwister|r
    .scenario 2032,1
    .mob Twilight Shadowcaster
    .mob Twilight Bladetwister
step
    .isOnQuest 40710
    #hidewindow
    #completewith Twilight Shadowcaster
    .goto 20,37.18,43.08,30 >>1
    .timer 30,RP
step
    .isOnQuest 40710
    #requires Twilight Shadowcaster
    .goto 20,37.18,43.08
    >>击杀|cRXP_ENEMY_Twilight Shadowcaster|r和|cRXP_ENEMY_Twilight Bladetwister|r
    .scenario 2032,1
step
    .isOnQuest 40710
    .goto 20,38.03,47.62
    #title |cFFFCDC00跟随箭头指引|r
    .scenario 2048,1
step
    .isOnQuest 40710
    #loop
    .goto 20,40.04,51.38,15,0
    .goto 20,40.17,57.68,15,0
    .goto 20,34.97,58.57,15,0
    .goto 20,34.83,51.15,15,0
    >>击杀四名|cRXP_ENEMY_暮光仪式师|r
    .scenario 2086,1
    .mob Twilight Ritualist
    .mob Flesh Spawn
step
    .isOnQuest 40710
    .goto 20,37.4,53,10,0
    .goto 20,37.49,54.93
    >>击杀|cRXP_ENEMY_Amassing Darkness|r
    .scenario 2171,1
    .mob Amassing Darkness
step
    .isOnQuest 40710
    .goto 20,37.64,66.51,10,0
    .goto 20,39.85,79.51,10,0
    .goto 20,42.73,84.43,20,0
    .goto 20,47.8,75.48
    #title |cFFFCDC00跟随箭头指引|r
    >>在前往监狱室的路上消灭敌人|r
    .scenario 2089,1
    .mob Twilight Bladetwister
    .mob Borgoth the Master Reaver
    .mob Flesh Spawn
    .mob Void Tendril
step
    #completewith next
    #label Twilight Deacon
    .isOnQuest 40710
    >>击杀|cRXP_ENEMY_暮光教士法辛|r
    .scenario 2099,1
    .mob Twilight Deacon Farthing
step
    #completewith Twilight Deacon
    .isOnQuest 40710
    #title |cFFFCDC00Mind your step|r
    .goto 20,51.71,74.95,10,0
    .goto 20,56.16,75.11,15 >>|cRXP_WARN_过桥|r
step
    #requires Twilight Deacon
    .isOnQuest 40710
    .goto 20,58.79,75.17,10,0
    .goto 20,58.61,76.46
    >>击杀|cRXP_ENEMY_暮光教士法辛|r
    .scenario 2099,1
    .timer 15,RP
    .mob Twilight Deacon Farthing
step
    .isOnQuest 40710
    .goto 20,58.61,76.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath (暮光之刃)|r
    .scenario 2115,1
step
    .isOnQuest 40710
    .goto 20,58.61,76.46
    .cast 201904 >>使用|cRXP_WARN_ExtraActionButton|r
    .timer 10,RP
step
    .goto 20,58.79,76.87
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 40710,2 --1/1 Stop the Ritual and acquire the Blade
step
    .goto 20,58.79,76.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 40710 >>交任务: |cRXP_FRIENDLY_暮光之刃|r
    .complete 84371,3 --Follow the High Priest's journey and acquire Xal'atath
    .turnin 84371 >>提交任务:游历传说——刀锋与大祭司
    .accept 84779 >>接受传说之旅：刀锋之赌
    .timer 12,RP
    .target Lorewalker Cho
step
    .isOnQuest 84779
    .zone 20 >>进入风暴之歌谷
step
    .goto 20,58.79,76.87
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 84779,1 --1/1 Talk to Lorewalker Cho to learn of Xal'atath's gambit
    .target Lorewalker Cho 
step << Horde
    #completewith next
    #label Every Little Death Helps H 
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .accept 54118 >>接任务: |cRXP_WARN_聚沙成塔|r
step << Horde 
    #completewith Every Little Death Helps H
    .goto 862,78.07,36.72
    .exitvehicle >>|cRXP_WARN_离开载具|r    
step << Alliance
    #completewith next
    #label Every Little Death Helps A
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .accept 54114 >>接任务: |cRXP_WARN_聚沙成塔|r
step << Alliance
    #completewith Every Little Death Helps A
    .goto 942,34.18,31.8
    .exitvehicle >>|cRXP_WARN_离开载具|r
step << Horde
    #requires Every Little Death Helps H
    .goto 862,78.07,36.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .accept 54118 >>接任务: |cRXP_WARN_聚沙成塔|r
step << Alliance
    #requires Every Little Death Helps A
    .goto 942,34.14,31.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .accept 54114 >>接任务: |cRXP_WARN_聚沙成塔|r
step << Horde
    #loop
    .goto 862,80.36,35.86,35,0
    .goto 862,78.93,39.23,45,0
    .goto 862,78.07,37.13,40,0
    >>击杀|cRXP_ENEMY_Darktide部队|r(7个敌人)
    .complete 54118,1 --1/1 Xal'atath fed
    .mob Darktide Champion
    .mob Darktide Sorceress
    .mob Darktide Witch
    .mob Darktide Marauder
step << Alliance
    #loop
    .goto 942,34.44,32.35,15,0
    .goto 942,33.56,32.94,15,0
    .goto 942,32.46,32.04,15,0
    .goto 942,31.39,31.68,15,0
    .goto 942,30.97,33.71,15,0
    .goto 942,32.71,34.5,15,0
    >>击杀|cRXP_ENEMY_Darktide部队|r
    .complete 54114,1 --1/1 Xal'atath fed
    .mob Darktide Champion
    .mob Darktide Sorceress
    .mob Darktide Witch
    .mob Darktide Marauder
step << Horde
    .goto 862,78.07,36.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .turnin 54118 >>交任务: |cRXP_FRIENDLY_聚沙成塔|r
    .accept 54058 >>接任务: |cRXP_WARN_无心插柳|r
    .target Xal'atath, Blade of the Black Empire
step << Alliance
    .goto 942,34.1,31.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Xal'atath, 黑色帝国之刃|r
    .turnin 54114 >>交任务: |cRXP_FRIENDLY_聚沙成塔|r
    .accept 54058 >>接任务: |cRXP_WARN_无心插柳|r
    .target Xal'atath, Blade of the Black Empire
step
    #completewith next
    #label Void Stone
    #hidewindow
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 54058,1 --1/1 Void Stone found
step
    #completewith Void Stone
    .goto 942,34.09,31.96 << Alliance
    .goto 862,78.01,36.70 << Horde
    .vehicle >>点击|cRXP_PICK_毒蛇 (Mishi)|r
    .timer 50,RP
    .target Mishi
step
    #requires Void Stone
    .goto 876,25.86,64.65
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 54058,1 --1/1 Void Stone found
step
    .goto 896,20.13,35.85
    >>击杀|cRXP_ENEMY_Deep Watchers|r和|cRXP_ENEMY_Inanis|r
    .complete 54058,2 --1/1 Stop the ritual
    .mob Deep Watcher
    .mob Inanis
step
    .goto 896,20.13,35.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空石|r
    .complete 54058,3 --1/1 Void Stone activated
step
    .goto 896,20.13,35.85
    >>使用 |T1386548:0|t|cRXP_WARN_ExtraActionButton|r
    .complete 54058,4 --1/1 Void Stone activated
    .timer 22,RP
step
    .goto 896,19.92,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r在剧情演出结束后对话|cRXP_WARN_after
    .turnin 54058 >>交任务: |cRXP_FRIENDLY_无心插柳|r
    .target Xal'atath
    .accept 53761 >>接任务: |cRXP_WARN_海盗的宝藏|r
step
    #completewith next
    #label Pirate's Den
    #hidewindow
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53761,1 --1/1 Pirate's Den found
step
    #completewith Pirate's Den
    .goto 896,19.88,36.42
    .vehicle >>点击|cRXP_PICK_毒蛇 (Mishi)|r
    .timer 37,RP
    .target Mishi
step
    #requires Pirate's Den
    .goto 876,61.79,80.08
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53761,1 --1/1 Pirate's Den found
step
    #loop
    .goto 895,75.09,78.47,10,0
    .goto 895,74.88,78.81,20,0
    >>击杀|r|cRXP_ENEMY_中尉埃尔丝贝思·浪刃|r, 从她身上搜刮出|T2010761:0|t[|cRXP_LOOT_骷髅钥匙|r]
    .complete 53761,2 --1/1 Skeleton Key
    .mob Lieutenant Elsbeth Wavecutter
step
    .goto 895,74.9,78.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Chest|r
    .complete 53761,3 --1/1 Trident of Deep Ocean
step
    .goto 895,75.04,77.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 53761 >>交任务: |cRXP_FRIENDLY_海盗的宝藏|r
    .target Xal'atath
    .accept 53762 >>接任务: |cRXP_WARN_风暴王冠|r
step
    #completewith next
    #label Toatana's Cave
    #hidewindow
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53762,1 --1/1 Toatana's Cave found
step
    #completewith Toatana's Cave
    .goto 895,75.07,77.54
    .vehicle >>点击|cRXP_PICK_毒蛇 (Mishi)|r
    .timer 50,RP
    .target Mishi
step
    #requires Toatana's Cave
    .goto 864,51.94,13.7,10,0
    .goto 864,52.35,14.19,15,0
    >>|cRXP_WARN_等待剧情互动后进入洞穴|r.
    .complete 53762,1 --1/1 Toatana's Cave found
step
    .goto 864,52.35,14.19,15,0
    .goto 864,53.46,13.13
    >>击杀|cRXP_ENEMY_Toatana|r. 从它身上搜刮 |T2481336:0|t[|cRXP_LOOT_Tempest Caller|r]
    .complete 53762,2 --1/1 Toatana slain
    .complete 53762,3 --1/1 Retrieve the Tempest Caller
    .mob Toatana
step << Alliance 
    #loop
    .goto 864,53.02,13.68,15,0
    .goto 864,52.55,14.2,10,0
    .goto 864,52.08,14.09,10,0
    .goto 864,51.93,13.68,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 53762 >>交任务: |cRXP_FRIENDLY_风暴王冠|r
    .target Xal'atath
    .accept 54126 >>接任务: |cRXP_WARN_利刃扭转|r
step << Horde
    #loop
    .goto 864,53.02,13.68,15,0
    .goto 864,52.55,14.2,10,0
    .goto 864,52.08,14.09,10,0
    .goto 864,51.93,13.68,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r|cRXP_WARN_ 在你身边或入口处交谈|r
    .turnin 53762 >>交任务: |cRXP_FRIENDLY_风暴王冠|r
    .target Xal'atath
    .accept 53763 >>接任务: |cRXP_WARN_利刃扭转|r
step 
    #completewith next
    #label Xal'atath found
    #hidewindow
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53763,1 << Horde --1/1 Xal'atath found 
    .complete 54126,1 << Alliance--1/1 Xal'atath found
step
    #completewith Xal'atath found
    .goto 864,51.81,13.32
    .vehicle >>点击|cRXP_PICK_毒蛇 (Mishi)|r
    .timer 45,RP
    .target Mishi
step << Horde
    #requires Xal'atath found
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53763,1 --1/1 Xal'atath found 
step <<Alliance
    #requires Xal'atath found
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 54126,1 --1/1 Xal'atath found
step << Alliance
    .goto 1363,28.18,54.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空石|r
    .complete 54126,3 --1/1 Void Stone placed
step << Alliance
    .goto 1363,27.94,53.25
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Trident|r
    .complete 54126,4 --1/1 Trident of Deep Ocean placed
step << Alliance
    .goto 1363,27.93,52.68
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_风暴召唤者|r
    .complete 54126,5 --1/1 Tempest Caller placed
    .timer 10,RP
step << Horde
    .goto 1363,27.97,54.57
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_虚空石|r
    .complete 53763,3 --1/1 Void Stone placed
step << Horde
    .goto 1363,27.94,53.25
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Trident|r
    .complete 53763,4 --1/1 Trident of Deep Ocean placed
step << Horde
    .goto 1363,27.89,52.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_风暴召唤者|r
    .complete 53763,5 --1/1 Tempest Caller placed
    .timer 10,RP
step << Horde
    .goto 1363,28.44,54.53
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 53763,6 --1/1 Gift received
step << Alliance
    .goto 1363,28.44,54.53
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 54126,6 --1/1 Gift received
step << Alliance
    .goto 85,54.35,56.66,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 54126 >>交任务: |cRXP_FRIENDLY_利刃扭转|r
    .complete 84779,2 --Aid Xal'atath across Kul Tiras and Zandalar
    .target Lorewalker Cho
    .turnin 84779 >>交还《传说行者:刀锋的赌注》
    .accept 84782 >>接受传说之旅：刀锋的过往
    .timer 8, RP
step << Horde
    .goto 85,54.35,56.66,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 53763 >>交任务: |cRXP_FRIENDLY_利刃扭转|r
    .complete 84779,2 --Aid Xal'atath across Kul Tiras and Zandalar
    .target Lorewalker Cho
    .turnin 84779 >>交还《传说行者:刀锋的赌注》
    .accept 84782 >>接受传说之旅：刀锋的过往
    .timer 8, RP
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.24,16.10,-1
    .goto 2339,49.6,31.63,-1
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 84782,1 --1/1 Talk to Lorewalker Cho to learn of Xal'atath's distant past
    .target Lorewalker Cho
step
    .isOnQuest 84782
    .zone 2381 >>进入尼阿洛萨
step
    #completewith next
    #label The Blade's Past
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xithixxin|r交谈
    .turnin 84782 >>提交任务:游历传说——刀锋的过去
    .target Xithixxin
    .accept 85871 >>接受传说之旅：刀锋之力
    .disablecheckbox
    .accept 84784 >>接受传说之旅：刀锋的宿敌
    .disablecheckbox
step
    #completewith The Blade's Past
    .goto 2381,52.58,72.86
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires The Blade's Past
    .goto 2381,52.58,72.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xithixxin|r交谈
    .turnin 84782 >>提交任务:游历传说——刀锋的过去
    .target Xithixxin
    .accept 85871 >>接受传说之旅：刀锋之力
    .accept 84784 >>接受传说之旅：刀锋的宿敌
step
    #completewith C'Thun
    *Use |T236171:0|t[Dark Leap] for movement and to stun enemies.
    *Use |T425954:0|t[Breath of Shadow] on Cooldown; |cRXP_WARN_ however, prioritize using it for AoE when possible.|r.
    *Use |T537022:0|t[Reach of N'Zoth] when |T425954:0|t[Breath of Shadow] is on cooldown.
    *Use |T135913:0|t[Strength of the Deep] to apply a healing-over-time effect to yourself.
    >>击杀|cRXP_ENEMY_Xal'atath的部队|r
    .complete 85871,1 --Xal'atath's forces slain (100%)
    .mob Shadowshaper
    .mob Shadowlasher
step
    .goto 2381,56.94,67.69,15,0
    .goto 2381,56.30,62.53,15,0
    .goto 2384,52.44,19.41,15,0
    .goto 2384,44.76,32.85,15,0
    .goto 2384,53.27,63.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Obelisk|r
    .complete 84784,1 --1/1 Yogg-Saron summoned
step
    #completewith next
    #hidewindow
    #label Y'Shaarj summoned
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Obelisk|r
    .complete 84784,2 --1/1 Y'Shaarj summoned
step
    #completewith Y'Shaarj summoned
    .goto 2384,53.08,50.65
    .cast 471456 >>使用 |T1386548:0|t[天选者之路] (6)
step
    #requires Y'Shaarj summoned
    #completewith next
    #hidewindow
    #label Y'Shaarj summoned2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Obelisk|r
    .complete 84784,2 --1/1 Y'Shaarj summoned
step
    #requires Y'Shaarj summoned
    #completewith next
    .goto 2381,59.93,53.62
    .cast 466734 >>使用 |T1386548:0|t[天选者之路] (6)
step
    #requires Y'Shaarj summoned2
    .goto 2383,36.95,50.3
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Obelisk|r
    .complete 84784,2 --1/1 Y'Shaarj summoned
step
    #completewith next
    #label CThunSummonedA
    #hidewindow
    .complete 84784,3 --1/1 C'Thun summoned
step
    #completewith CThunSummonedA
    .goto 2383,32.41,46.45
    .cast 466734 >>使用 |T1386548:0|t[天选者之路] (6)
step
    #requires CThunSummonedA
    #label C'Thun
    .goto 2381,52.2,45.53,20,0
    .goto 2381,48.71,46.58,20,0
    .goto 2382,81.44,91.38,20,0
    .goto 2381,42.14,38.97,20,0
    .goto 2381,41.8,37.57,20,0
    .goto 2382,66.83,74.22,20,0
    .goto 2382,58.06,60.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Obelisk|r
    .complete 84784,3 --1/1 C'Thun summoned
step
    #loop
    .goto 2381,42.3,38.13,8,0
    .goto 2381,42.76,40.14,8,0
    .goto 2381,49.44,48.52,30,0
    .goto 2381,52.05,45.49,30,0
    .goto 2381,57.05,54.05,30,0
    .goto 2381,57.39,61.12,30,0
    .goto 2381,50.77,53.24,30,0
    .goto 2381,47.21,53.9,30,0
    *Use |T236171:0|t[Dark Leap] for movement and to stun enemies.
    *Use |T425954:0|t[Breath of Shadow] on Cooldown; |cRXP_WARN_ however, prioritize using it for AoE when possible.|r.
    *Use |T537022:0|t[Reach of N'Zoth] when |T425954:0|t[Breath of Shadow] is on cooldown.
    *Use |T135913:0|t[Strength of the Deep] to apply a healing-over-time effect to yourself.
    >>击杀|cRXP_ENEMY_Xal'atath的部队|r
    .complete 85871,1 --Xal'atath's forces slain (100%)
    .mob Shadowshaper
    .mob Shadowlasher
step
    .goto 2381,52.62,72.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xithixxin|r交谈
    .turnin 84784 >>提交任务:游历传说——刀锋的宿敌
    .turnin 85871 >>提交任务:游历传说——刀锋之力
    .accept 84789 >>接受传说之旅：刀锋的陨落
    .target Xithixxin
step
    #completewith next
    #label Descend to the Annex of Prophecy
    .complete 84789,1 --1/1 Descend to the Annex of Prophecy
step
    #completewith Descend to the Annex of Prophecy
    .goto 2379,50.97,28.05
    *Spam cast |T236171:0|t[Dark Leap] (3) for movement.
    .cast 466734 >>使用 |T1386548:0|t[天选者之路] (6)
step
    #requires Descend to the Annex of Prophecy
    #title |cFFFCDC00跟随箭头指引|r
    .goto 2379,50.97,77.46
    *Spam cast |T236171:0|t[Dark Leap] (3) for movement.
    .complete 84789,1 --1/1 Descend to the Annex of Prophecy
step
    .goto 2379,50.96,77.53
    >>使用 |T237561:0|t[暗潮] (1)
    .complete 84789,2 --1/1 Xal'atath defeated
    .mob Xal'atath
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.24,16.10,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 84789 >>交还任务:洛尔沃金——刀刃的陨落
    .target Lorewalker Cho
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 探索背景故事
#name 乙) 空灵
#displayname 虚灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AC) 巫妖王


step << Alliance
    .goto 84,64.24,16.10,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或暴风城
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step << Horde
    .goto 85,54.24,56.59,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或奥格瑞玛
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step
    .goto 84,64.24,16.10,-1 <<Alliance
    .goto 85,54.28,56.56,-1 <<Horde
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .accept 85027 >>接受传说之旅：守护者军团
    .timer 39,RP
    .skipgossipid 124311
    .choose 6403387
    .target Lorewalker Cho
step
    .goto 84,64.24,16.10,-1 <<Alliance
    .goto 85,54.28,56.56,-1 <<Horde
    .goto 2339,49.62,31.52,-1
    >>|cRXP_WARN_请等待剧情发展|r.
    .complete 85027,1 --1/1 Talk to Lorewalker Cho to learn about the 虚灵
step
    .goto 84,64.24,16.10,-1 <<Alliance
    .goto 85,54.28,56.56,-1 <<Horde
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85027,2 --1/1 Talk to Lorewalker Cho to learn about the Protectorate
    .skipgossipid 124637
    .target Lorewalker Cho
step
    .isOnQuest 85027
    .zone 109 >>进入虚空风暴
step
    #completewith next
    #label The Ethereum
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔|r交谈
    .accept 10339 >>接任务: |cRXP_LOOT_复仇军|r
    .target Commander Ameer
step
    #completewith The Ethereum
    .goto 109,59.50,32.39
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires The Ethereum
    .goto 109,59.50,32.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔|r交谈
    .accept 10339 >>接任务: |cRXP_LOOT_复仇军|r
    .target Commander Ameer
step
    #loop
    .goto 109,57.21,33.42,40,0
    .goto 109,56.98,36.09,40,0
    .goto 109,56.76,40.61,40,0
    .goto 109,55.24,40.77,40,0
    .goto 109,58.03,36.11,40,0
    >>击杀|cRXP_ENEMY_Ethereum势力|r和|cRXP_ENEMY_索瓦克斯上尉|r
    .complete 10339,1 --5/5 Ethereum Assassin slain
    .mob +Ethereum Assassin
    .complete 10339,2 --5/5 Ethereum Shocktrooper slain
    .mob +Ethereum Shocktrooper
    .complete 10339,3 --2/2 Ethereum Researcher slain
    .mob +Ethereum Researcher
    .complete 10339,4 --1/1 Captain Zovax slain
    .mob +Captain Zovax 
-- step
--     #completewith next
--     #label Ethereum
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
--     .turnin 10339 >>交任务: |cRXP_FRIENDLY_复仇军|r
--     .accept 10384 >>接任务: |cRXP_LOOT_复仇军的数据|r
--     .disablecheckbox
-- step
--     #completewith Ethereum
--     .goto 109,56.82,38.70
--     .cast 3365 >>点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r
step
    .goto 109,56.82,38.70
    *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r if necessary, 
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
    .turnin 10339 >>交任务: |cRXP_FRIENDLY_复仇军|r
    .accept 10384 >>接任务: |cRXP_LOOT_复仇军的数据|r
step
    .goto 109,55.77,39.89
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_复仇军数据单元|r
    .complete 10384,1 --1/1 Ethereum Data Cell
step
    .goto 109,56.82,38.70
    *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r if necessary.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
    .turnin 10384 >>交任务: |cRXP_FRIENDLY_复仇军的数据|r
    .target Image of Commander Ameer
    .accept 10385 >>接任务: |cRXP_LOOT_脑部损伤几率：高|r
step
    #hidewindow
    #completewith Ethereum Relay Data 
    #loop
    .goto 109,56.49,41.09,40,0
    .goto 109,55.99,42.73,40,0
    .goto 109,54.56,41.68,40,0
    .goto 109,55.89,38.84,40,0
    .goto 109,57.06,35.45,40,0
    .goto 109,57.98,36.36,40,0
    +1
step
    .isOnQuest 10385
    .aura 35409
    >>击杀任意|cRXP_ENEMY_Ethereums|r. 击败它们后可获得 |T134729:0|t[|cRXP_LOOT_复仇军精华|r]. |cRXP_WARN_请使用它. |r
    .collect 29482,1
    .cast 35409 >>使用[复仇军精华|r]
    .use 29482
    .mob Ethereum Assassin
    .mob Ethereum Shocktrooper
    .mob Ethereum Researcher
    .mob Captain Zovax
step
    #label Ethereum Relay Data
    .aura -35409
    >>击杀|cRXP_ENEMY_复仇军传达者|r. 从他们身上搜取 |T134139:0|t[|cRXP_LOOT_复仇军中继数据|r ]
    .complete 10385,2 --12/12 Ethereum Relay Data
    .mob Ethereum Relay
step
    .goto 109,56.82,38.71
    *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r if necessary.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
    .turnin 10385 >>交任务: |cRXP_FRIENDLY_脑部损伤几率：高|r
    .accept 10406 >>接任务: |cRXP_LOOT_传达信息|r
    .timer 110,RP
    .target Image of Commander Ameer
step
    >>护送并保护|cRXP_FRIENDLY_维序派爆破师|r
    .complete 10406,1 --Sabotage 
    .target Protectorate Demolitionist
    .mob Ethereum Archon
    .mob Ethereum Overlord
    .mob Ethereum Nexus-Stalker
step
    .goto 109,56.82,38.71
    *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r if necessary.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
    .target Image of Commander Ameer
    .turnin 10406 >>交任务: |cRXP_FRIENDLY_传达信息|r
    .accept 10408 >>接任务: |cRXP_LOOT_节点之王萨哈达尔|r
step
    #completewith next
    .goto 109,53.64,42.37,5,0
    .goto 109,53.7,42.02,5,0
    .goto 109,53.32,42.31,5,0
    .goto 109,53.73,42.87,5,0
    >>使用 |T133002:0|t[维序派干扰器]|cRXP_WARN_放置在每个能量导管旁, 以激活|cRXP_ENEMY_节点之王萨哈达尔|r
    *|cRXP_WARN_Ignore this step if he's already active|r.
    .complete 10408,1 --3/3 Salhadaar's Power Conduits disrupted (Optional)
    .timer 17,RP
    .use 29618
step
    .goto 109,53.64,42.37
    >>击杀|cRXP_ENEMY_节点之王萨哈达尔|r
    .complete 10408,2 --1/1 Nexus-King Salhadaar slain
    .mob Nexus-King Salhadaar
step
    .goto 109,56.83,38.68
    *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereum 以太坊应答器 Zeta|r if necessary.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿米尔的影像|r交谈
    .turnin 10408 >>交任务: |cRXP_FRIENDLY_节点之王萨哈达尔|r
    .complete 85027,3 --Aid the Protectorate against Nexus-King Salhadaar
    .target Image of Commander Ameer
step
    .goto 109,56.83,38.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 了解迪门修斯|r
    .complete 85027,4 --1/1 Talk to Lorewalker Cho to learn about Dimensius
    .skipgossipid 134099
    .target Lorewalker Cho to learn about Dimensius
step
    .goto 109,60.11,31.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达比雷教授|r交谈
    .accept 10437 >>接任务: |cRXP_LOOT_毁灭的材料|r
    .target Professor Dabiri
step
    #loop
    .goto 109,60.75,37.3,30,0
    .goto 109,60.67,39.56,30,0
    .goto 109,61.91,37.21,30,0
    .goto 109,62.9,34.94,30,0
    .goto 109,61.62,34.21,30,0
    .goto 109,65.45,38.5,30,0
    .goto 109,65.92,42.03,30,0
    .goto 109,64.41,42.03,30,0
    .goto 109,60.84,43.11,30,0
    .goto 109,59.32,41.12,30,0
    >>击杀 |cRXP_ENEMY_空灵尖啸者|r 和 |cRXP_ENEMY_不稳定的虚空幽灵|r. 从它们身上搜刮出 |cRXP_LOOT_迪门修斯碎片|r|t[|T132776:0|t]
    .complete 10437,1 --4/4 Fragment of Dimensius
    .mob Voidshrieker
    .mob Unstable Voidwraith
step
    .goto 109,60.12,31.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达比雷教授|r交谈
    .turnin 10437 >>交任务: |cRXP_FRIENDLY_毁灭的材料|r
    .complete 85027,5 --Help Professor Dabiri prepare to attack Dimensius
    .target Professor Dabiri
step
    .goto 109,60.12,31.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达比雷教授|r交谈
    .accept 10439 >>接任务: |cRXP_WARN_诸界吞噬者迪门修斯|r
    .target Professor Dabiri
step
    .goto 109,60.64,32.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨义德上尉|r交谈
    .complete 10439,1 --1/1 Speak to Captain Saeed
    .skipgossipid 33088
step
    #completewith next
    #label Dimensius the All-Devouring
    >>击杀|cRXP_ENEMY_诸界吞噬者迪门修斯|r
    .complete 10439,3 --1/1 Dimensius the All-Devouring slain
step
    #completewith next
    #completewith Dimensius the All-Devouring
    .goto 109,60.78,39.22,20,0
    .gossipoption 33644 >>与|cRXP_FRIENDLY_萨义德上尉|r|cRXP_WARN_[2]|r交谈
    *|cRXP_WARN_Someone may have already spoken to him; if so, just move on|r.
    .target Captain Saeed
step
    #hidewindow
    #completewith Dimensius the All-Devouring
    .goto 109,61.33,39.81,10 >>1
step
    #requires Dimensius the All-Devouring
    #loop
    .goto 109,62.50,40.82,10,0
    .goto 109,60.78,39.22,20,0
    >>击杀|cRXP_ENEMY_诸界吞噬者迪门修斯|r
    .complete 10439,3 --1/1 Dimensius the All-Devouring slain
    .mob Dimensius the All-Devouring
step
    #completewith next
    #label Professor Dabiri
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达比雷教授|r交谈
    .turnin 10439 >>交任务: |cRXP_FRIENDLY_诸界吞噬者迪门修斯|r
    .target Professor Dabiri
step
    #completewith Professor Dabiri
    .goto 109,60.88,39.26,10 >>离开建筑
step
    #requires Professor Dabiri
    .goto 109,60.11,31.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达比雷教授|r交谈
    .turnin 10439 >>交任务: |cRXP_FRIENDLY_诸界吞噬者迪门修斯|r
    .target Professor Dabiri
    .complete 85027,6 --Aid the Protectorate forces against Dimensius the All-Devouring
step
    .goto 109,60.11,31.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 85027 >>提交任务:游历之途——守护者
    .accept 85029 >>接受传说之旅：地点行者
    .target Lorewalker Cho
step
    .goto 109,60.11,31.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85029,1 --1/1 Talk to Lorewalker Cho to learn about void ethereals
    .skipgossipid 124639
    .target Lorewalker Cho
step
    .isOnQuest 85029
    .zone 882 >>进入阿格斯
step
    #completewith next
    #label Throwing Shade
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .accept 47203 >>接任务: |cRXP_WARN_虚空投影|r
    .target Alleria Windrunner
step
    #completewith Throwing Shade
    .goto 882,35.34,59.55
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires Throwing Shade
    .goto 882,35.34,59.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .accept 47203 >>接任务: |cRXP_WARN_虚空投影|r
    .target Alleria Windrunner
step
    .goto 882,37.13,52.32
    #title |cFFFCDC00跟随箭头指引|r
    .complete 47203,1 --1/1 Meet Alleria in Umbra Hollows
    .timer 20,RP
step
    .goto 882,37.04,52.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Tear|r|cRXP_WARN_剧情结束后|r
    .complete 47203,2 --1/1 Enter the Void Tear
step
    #completewith Voidforge
    +|cRXP_WARN_避开围绕着|cRXP_ENEMY_Void Effusions|r的圆圈, 并远离|cRXP_ENEMY_暗影守卫|r|r
step
    .goto 882,37.82,50.88,15,0
    .goto 882,39.63,48.21
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Dismantled 传送门|r
    .complete 47203,3 --1/1 Dismantled Portal examined
step
    .goto 882,39.07,47.22,10,0
    .goto 882,37.51,45.44,15,0
    .goto 882,35.55,43.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Image of Saprish|r
    .complete 47203,4 --1/1 Image of Saprish examined
step
    #label Voidforge
    .goto 882,35.32,41.43,10,0
    .goto 882,36.02,38.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Voidforge|r
    .complete 47203,5 --1/1 Voidforge examined
step
    .goto 882,33.35,39.58,15,0
    .goto 882,31.87,37.47
    #title |cFFFCDC00跟随箭头指引|r
    .complete 47203,6 --1/1 Meet Alleria and Locus-Walker
    .timer 15,RP
step
    .goto 882,31.87,37.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 47203 >>交任务: |cRXP_FRIENDLY_虚空投影|r
    .accept 47217 >>接任务: |cRXP_WARN_黑暗之源|r
    .target Alleria Windrunner
step
    .goto 882,31.94,37.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .accept 47218 >>接任务: |cRXP_WARN_影卫入侵|r
    .target Locus-Walker
step
    #completewith Void Harvesters
    >>击杀|cRXP_ENEMY_暗影守卫|r
    .complete 47218,1 --15/15 Shadowguard ethereals slain
    .mob Shadowguard Siphoner
    .mob Shadowguard Phaseblade
    .mob Shadowguard Adept
step
    .goto 882,32.07,34.9,15,0
    .goto 882,31.67,34.4
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Harvester|r
    .complete 47217,1,1 --5/5 Void Harvesters deactivated
step
    .goto 882,28.33,34.24
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Harvester|r
    .complete 47217,1,2 --5/5 Void Harvesters deactivated
step
    .goto 882,25.59,32.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Harvester|r
    .complete 47217,1,3 --5/5 Void Harvesters deactivated
step
    .goto 882,24.67,33.4
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Harvester|r
    .complete 47217,1,4 --5/5 Void Harvesters deactivated
step
    #label Void Harvesters
    .goto 882,25.07,35.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Harvester|r
    .complete 47217,1,5 --5/5 Void Harvesters deactivated
step
    #loop
    .goto 882,27.16,39.85,40,0
    .goto 882,25.7,42.24,40,0
    .goto 882,23.38,39.49,40,0
    .goto 882,24.62,35.32,40,0
    >>击杀|cRXP_ENEMY_暗影守卫|r
    .complete 47218,1 --15/15 Shadowguard ethereals slain
    .mob Shadowguard Siphoner
    .mob Shadowguard Phaseblade
    .mob Shadowguard Adept
step
    .goto 882,31.91,37.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alleria Windrunner|r和|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 47217 >>交任务: |cRXP_FRIENDLY_黑暗之源|r
    .target +Alleria Windrunner
    .turnin 47218 >>交任务: |cRXP_FRIENDLY_影卫入侵|r
    .accept 47219 >>接任务: |cRXP_WARN_准备就绪|r
    .timer 20,RP
    .target +Locus-Walker
step
    .goto 882,31.92,37.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r|cRXP_WARN_角色扮演后|r
    .complete 47219,1 --1/1 Enter the Void Tear
step
    .goto 882,27.29,44.85,15,0
    .goto 882,26.82,45.88,15,0
    .goto 882,26.53,43.99,15,0
    .goto 882,26.6,44.94
    >>击杀|cRXP_ENEMY_Shadowguard深渊召唤者|r和|cRXP_ENEMY_Nhal'athoth|r
    .complete 47219,2 --1/1 Defeat Nhal'athoth
    .timer 10,RP
step
    .goto 882,26.6,44.94
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Heart of Nhal'athoth|r|cRXP_WARN_在剧情演出后|r
    .complete 47219,3 --1/1 Heart of Nhal'athoth
    .mob Shadowguard Abyss Caller
    .mob Nhal'athoth
step
    .goto 882,28.43,47.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 47219 >>交任务: |cRXP_FRIENDLY_准备就绪|r
    .target Alleria Windrunner
    .complete 85029,2 --Aid Locus-Walker in teaching Alleria to master the Void
step
    .goto 882,28.43,47.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 85029 >>提交任务:洛尔沃克——地点行者
    .target Lorewalker Cho
    .accept 85028 >>接受传说之旅：掮客
step
    .goto 882,28.43,47.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85028,1 --1/1 Talk to Lorewalker Cho
    .skipgossipid 124635
    .target Lorewalker Cho
step
    #completewith next
    #label The Al'ley Cat of Oribos
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔瑞拉|r交谈
    .accept 63976 >>接任务: |cRXP_WARN_奥利波斯的奥妙|r
    .target Host Ta'rela
step
    #completewith The Al'ley Cat of Oribos
    .goto 2381,52.58,72.86
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires The Al'ley Cat of Oribos
    .goto 1670,67.50,50.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔瑞拉|r交谈
    .accept 63976 >>接任务: |cRXP_WARN_奥利波斯的奥妙|r
    .target Host Ta'rela
step
    #completewith next
    #label Al'ley Cat of Oribos
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .turnin 63976 >>交任务: |cRXP_FRIENDLY_奥利波斯的奥妙|r
    .target Al'dalil
step
    #hidewindow
    #completewith Al'ley Cat of Oribos
    .goto 1670,69.38,42.87,10,0
    .goto 1672,57.5,27.72,10 >>1
step
    #requires Al'ley Cat of Oribos
    .goto 1672,56.72,31.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .turnin 63976 >>交任务: |cRXP_FRIENDLY_奥利波斯的奥妙|r
    .accept 63977 >>接任务: |cRXP_WARN_内幕交易|r
    .accept 63979 >>接任务: |cRXP_WARN_鬼祟龌龊之事|r
    .target Al'dalil
step
    #completewith next
    #label Cartel Ta
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_监察官塔瑞顿|r交谈
    .complete 63977,4 --1/1 Cartel Ta spoken to
    .target Overseer Ta'readon
step
    #hidewindow
    #completewith Cartel Ta
    .goto 1670,70.67,40.41,10,0
    .goto 1670,65.54,49.48,10,0
    .goto 1670,62.26,51.5,10,0
    .goto 1670,60.5,62.23,10,0
    .goto 1670,64.37,68.31,40 >>1
step
    #requires Cartel Ta
    .goto 1670,64.37,68.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_监察官塔瑞顿|r交谈
    .complete 63977,4 --1/1 Cartel Ta spoken to
    .skipgossipid 54344
    .target Overseer Ta'readon
step
    #completewith next
    #label Cartel Ba
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者巴哈斯克|r交谈
    .complete 63977,1 --1/1 Cartel Ba spoken to
    .target Emissary Ba'hask
step
    #completewith Cartel Ba
    #hidewindow
    .goto 1670,54.69,73.83,10,0
    .goto 1670,50.28,73.85,20,0
    .goto 1670,47.36,73.16,20 >>1
step
    #requires Cartel Ba
    .goto 1670,47.70,72.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者巴哈斯克|r交谈
    .complete 63977,1 --1/1 Cartel Ba spoken to
    .skipgossipid 51187
    .target Emissary Ba'hask
step
    #completewith next
    #label Cartel Zo
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zo'sorg|r交谈
    .complete 63977,2 --1/1 Cartel Zo spoken to
    .target Zo'sorg
step
    #hidewindow
    #completewith Cartel Zo
    .goto 1670,44.81,70.91,10,0
    .goto 1670,36.99,60.16,10,0
    .goto 1670,34.48,57.49,30 >>1
step
    #requires Cartel Zo
    .goto 1670,34.48,57.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zo'sorg|r交谈
    .complete 63977,2 --1/1 Cartel Zo spoken to
    .skipgossipid 53363
    .target Zo'sorg
step
    #completewith next
    #label Cartel Au
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥布拉克|r交谈
    .complete 63977,3 --1/1 Cartel Au spoken to
    .target Foreman Au'brak
step
    #hidewindow
    #completewith Cartel Au
    .goto 1670,35.59,54.03,10,0
    .goto 1670,37.48,41.83,10,0
    .goto 1670,40.37,32.59,50 >>1
step
    #requires Cartel Au
    .goto 1670,40.37,32.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥布拉克|r交谈
    .complete 63977,3 --1/1 Cartel Au spoken to
    .skipgossipid 54347
    .target Foreman Au'brak
step
    #completewith next
    #label Shipping Manifest
    #hidewindow
    .complete 63979,1 --1/1 Cartel So Shipping Manifest
step
    #completewith next
    .cast 3365 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_卷轴|r
step
    #hidewindow
    #completewith Shipping Manifest
    .goto 1670,51.68,24.95,10,0
    .goto 1670,51.11,17.5,10,0
    .goto 1670,48.04,15.84,10,0
    .goto 1670,38.31,22.55,10,0
    .goto 1670,38.53,25.27,30 >>1
step
    #requires Shipping Manifest
    #completewith next
    #label Shipping Manifest2
    >>击杀|cRXP_ENEMY_So'danah|r. 击败他们后搜刮出 |T2178827:0|t[|cRXP_LOOT_Cartel 所德安航运清单|r]
    .complete 63979,1 --1/1 Cartel So Shipping Manifest
    .mob So'danah
step
    #requires Shipping Manifest
    #completewith Shipping Manifest2
    .goto 1670,38.53,25.28
    .cast 3365 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_卷轴|r
step
    #requires Shipping Manifest2
    .goto 1670,38.22,23.39
    >>击杀|cRXP_ENEMY_So'danah|r. 击败他们后搜刮出 |T2178827:0|t[|cRXP_LOOT_Cartel 所德安航运清单|r]
    .complete 63979,1 --1/1 Cartel So Shipping Manifest
step
    #completewith Insider Trading2
    #label Insider Trading
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .turnin 63977 >>交任务: |cRXP_FRIENDLY_内幕交易|r
    .turnin 63979 >>交任务: |cRXP_FRIENDLY_鬼祟龌龊之事|r
    .target Al'dalil
step
    #completewith next
    .goto 1670,35.04,18.87
    .deathskip >>跳下平台 -- Deathskip无法使用, 因为我们可能没有在灵魂治疗者处手动复活
step
    #hidewindow
    #completewith Insider Trading
    .goto 1670,76.91,50.29,40 >>1
step
    #hidewindow
    #requires Insider Trading
    #label Insider Trading2
    #completewith Insider Trading
    .goto 1670,72.65,47.65,10,0
    .goto 1670,68.15,45.72,10,0
    .goto 1672,57.37,27.76,10 >>1
step
    #requires Insider Trading
    .goto 1672,56.70,31.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .turnin 63977 >>交任务: |cRXP_FRIENDLY_内幕交易|r
    .target Al'dalil
    .turnin 63979 >>交任务: |cRXP_FRIENDLY_鬼祟龌龊之事|r
step
    .goto 1672,56.70,31.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .accept 63980 >>接任务: |cRXP_WARN_寻找走私贩|r
    .target Al'dalil
step
    .goto 1672,56.57,29.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho交谈, 了解夜市事宜(可选)|r
    .complete 85028,3 --1/1 Talk to Cho about the Night Market (Optional)
    .target Cho about the Night Market (Optional)
step
    .goto 1672,56.46,29.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与夜市中的|r|cRXP_FRIENDLY_Ta'nla|r交谈
    .complete 85028,4 --Speak with Ta'nla at the Night Market
    .skipgossipid 124638
    .target Ta'nla at the Night Market
step
    .isOnQuest 63980
    .zone 1525 >>进入雷文德斯
step
    #completewith next
    #label Seeking Smugglers
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'nla the Identifier|r交谈
    .turnin 63980 >>交任务: |cRXP_FRIENDLY_寻找走私贩|r
    .target Ta'nla the Identifier
step
    #completewith Seeking Smugglers
    .goto 1525,51.34,82.71
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires Seeking Smugglers
    .goto 1525,51.34,82.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'nla the Identifier|r交谈
    .turnin 63980 >>交任务: |cRXP_FRIENDLY_寻找走私贩|r
    .target Ta'nla the Identifier
step
    .goto 1525,51.34,82.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'nla the Identifier|r交谈
    .accept 63982 >>接任务: |cRXP_WARN_不在其位|r
    .target Ta'nla the Identifier
step
    #title |cFFFCDC00进入传送门|r
    .goto 1525,50.97,81.90
    .complete 63982,1 --Portal to Transfer Station Ta taken
step
    .goto 1533,32.51,32.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赏金猎人Ta'oku|r交谈
    .turnin 63982 >>交任务: |cRXP_FRIENDLY_不在其位|r
    .target Bounty Hunter Ta'oku
    .accept 63983 >>接任务: |cRXP_WARN_交货地点|r
step
    .goto 1533,36.94,31.63,20,0
    .goto 1533,37.37,29.99,20,0
     .goto 1533,36.98,31.47
    #title |cFFFCDC00Enter the repository|r
    >>|cRXP_WARN_进入地下设施|r
    .complete 63983,1 --Export party found
step
    .goto 1533,37.37,29.99
    >>击败|cRXP_ENEMY_Prototype Aquilon|r
    .complete 63983,2 --1/1 Prototype Aquilon subdued
    .mob Prototype Aquilon
step
    #completewith next
    #label chat Instructions
    #hidewindow
    >>|cRXP_WARN_按照聊天中的说明操作(5次)|r
    *|T237290:0|t[Press Buttons] = any text with button in it.
    *|T2909707:0|t[Pull Lever] = any text with lever in it.
    *|T2437249:0|t[Bonk Head] = any text with whack,bonk,strike,hit in it.
    .complete 63983,3 --1/1 Prototype Aquilon returned
step
    #completewith chat Instructions
    .goto 1533,37.37,29.99
    .vehicle >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Prototype Aquilon|r
    .timer 60,RP
    .mob Prototype Aquilon
step
    #requires chat Instructions
    >>|cRXP_WARN_按照聊天中的说明操作(5次)|r
    *|T237290:0|t[Press Buttons] = any text with button in it.
    *|T2909707:0|t[Pull Lever] = any text with lever in it.
    *|T2437249:0|t[Bonk Head] = any text with whack,bonk,strike,hit in it.
    .complete 63983,3 --1/1 Prototype Aquilon returned
-- step
--     #completewith next
--     #label in Dead Drop
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赏金猎人Ta'oku|r交谈
--     .turnin 63983 >>交任务: |cRXP_FRIENDLY_交货地点|r
--     .target Bounty Hunter Ta'oku
-- step
--     #completewith in Dead Drop
--     .goto 1533,32.52,32.36
--     .exitvehicle >>|cRXP_WARN_离开载具|r
step
    -- #requires in Dead Drop
    .goto 1533,32.52,32.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赏金猎人Ta'oku|r交谈
    .turnin 63983 >>交任务: |cRXP_FRIENDLY_交货地点|r
    .target Bounty Hunter Ta'oku
step
    .goto 1533,32.52,32.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赏金猎人Ta'oku|r交谈
    .accept 63984 >>接任务: |cRXP_WARN_摆渡人的硬币|r
    .target Bounty Hunter Ta'oku
step
    #completewith next
    #label SerpentA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'meri|r交谈
    .turnin 63984 >>交任务: |cRXP_FRIENDLY_摆渡人的硬币|r
    .accept 63985 >>接任务: |cRXP_WARN_帷纱集市|r
    .target Ta'meri
step
    #completewith SerpentA
    .goto 1533,32.98,32.30
    .vehicle >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_毒蛇 (Mishi)|r
    .timer 15,RP
-- step
--     .goto 1533,32.98,32.30
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_毒蛇|r
--     .complete 85028,2 --1/1 Ride Mishi to the Tazavesh Ferry -- had an issue with it loading
step
    #requires SerpentA
    .goto 1670,29.83,66.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'meri|r交谈
    .turnin 63984 >>交任务: |cRXP_FRIENDLY_摆渡人的硬币|r
    .accept 63985 >>接任务: |cRXP_WARN_帷纱集市|r
    .target Ta'meri
step
    .goto 1670,29.83,66.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'meri|r交谈
    .complete 63985,1 --1/1 Barge taken to Tazavesh
    .skipgossipid 51818
    .timer 60,RP
step
    #completewith next
    #label Bouncer spoken to
    #hidewindow
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 63985,2 --1/1 Bouncer spoken to
step
    #completewith Bouncer spoken to
    .goto 2016,84.15,47.3
    .gossipoption 52184 >>与|cRXP_FRIENDLY_Zo'mezal|r在剧情演出后对话|cRXP_WARN_after
    .timer 45,RP
step
    #requires Bouncer spoken to
    #title |cFFFCDC00跟随箭头指引|r
    .goto 2016,86.69,48.49
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 63985,2 --1/1 Bouncer spoken to
    .target Zo'mezal
    .target Ta'meri
step
    .goto 2016,86.69,48.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Al'dalil|r交谈
    .turnin 63985 >>交任务: |cRXP_FRIENDLY_帷纱集市|r
    .target Al'dalil
step
    .goto 2016,86.67,48.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85028,10 --1/1 Ask Lorewalker Cho about Ve'nari
    .skipgossipid 124632
    .target Lorewalker Cho
step
    .isOnQuest 85028
    .zone 1961 >>进入科西亚
step
    #completewith next
    #label Ease of Passage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .accept 63855 >>接任务: |cRXP_WARN_畅通无阻|r
    .target Ve'nari
step
    #completewith Ease of Passage
    .goto 1961,65.98,23.12
    .exitvehicle >>|cRXP_WARN_离开载具|r
step
    #requires Ease of Passage
    .goto 1961,65.91,22.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .accept 63855 >>接任务: |cRXP_WARN_畅通无阻|r
    .target Ve'nari
step
    .goto 1961,65.91,22.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .complete 63855,1 --1/1 Speak with Ve'nari
    .skipgossipid 54169
    .timer 18,RP
    .target Ve'nari
step
    .goto 1961,64.96,23.69
    #title |cFFFCDC00跟随箭头指引|r
    *|cRXP_WARN_等待角色扮演|r
    .complete 63855,2 --1/1 Suitable location found
step
    .goto 1961,64.96,23.69
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Animaflow 传送器|r
    .complete 63855,3 --1/1 Anima signature imprinted
step
    .goto 1961,66.02,23.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bag|r
    .complete 63855,4 --1/1 Ve'nari's bag collected
step
    .goto 1961,65.65,23.34
    >>点击|cRXP_PICK_毒蛇 (Mishi)|r
    .complete 85028,12 --1/1 Ride Mishi to Ve'nari's Refuge (Optional)
    .timer 40,RP
step
    #completewith next
    #label Ease of Passage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈, 地点在角色扮演结束后|cRXP_WARN_after
    .turnin 63855 >>交任务: |cRXP_FRIENDLY_畅通无阻|r
    .target Ve'nari
    .accept 63895 >>接任务: |cRXP_WARN_翻袋掏兜|r
    .disablecheckbox
step
    #completewith Ease of Passage
    #hidewindow
    .goto 1543,46.63,42.04,10,0
    .goto 1543,46.91,41.7,20 >>1
step
    #requires Ease of Passage
    .goto 1543,46.91,41.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 63855 >>交任务: |cRXP_FRIENDLY_畅通无阻|r
    .target Ve'nari
    .accept 63895 >>接任务: |cRXP_WARN_翻袋掏兜|r
step
    .goto 1543,46.91,41.54
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Transferral 增强器|r
    .complete 63895,1 --1/1 Transferral Augmentor used
step
    #completewith next
    #hidewindow
    #label TransferSuccessful
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Transferral 增强器|r
    .complete 63895,2 --1/1 Transfer successful
step
    #completewith TransferSuccessful
    .goto 1543,46.9,41.54
    .isOnQuest 63895
    .aura -351792 >>|cRXP_WARN_你可以通过右键点击它来取消缓慢下降效果, 从而更快地坠落|r
step
    #requires TransferSuccessful
    .goto 1543,46.9,41.54
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Transferral 增强器|r
    .complete 63895,2 --1/1 Transfer successful
step
    .goto 1543,61.65,59.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Projection of Ve'nari|r交谈
    .turnin 63895,1 >>交任务: |cRXP_FRIENDLY_翻袋掏兜|r
    .target Projection of Ve'nari
step
    .goto 1543,61.67,59.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈   
    .complete 85028,14 --1/1 Thank Lorewalker Cho
    .skipgossipid 125268
    .target Lorewalker Cho
step
    .goto 84,64.19,16.26,-1
    .goto 85,54.35,56.66,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 85028 >>提交任务:洛尔沃金——经纪人
    .target Lorewalker Cho
step
    .goto 84,63.85,15.72,-1
    .goto 85,54.35,56.66,-1
    .goto 2339,49.33,31.16,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥姆拉朱拉|r交谈
    .accept 85035 >>接受任务：洛卡斯·沃克, 特洛格鲁斯游侠
    .target Om'rajula
step
    .goto 85,53.96,57.10 << Horde
    .goto 84,63.85,15.72 << Alliance
    .goto 2339,49.33,31.16,-1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
    .complete 85035,1 --1/1 Portal taken to Telogrus Rift
step
    .goto 971,26.35,27.90
    >>击杀|cRXP_ENEMY_Shadowguard Voidguards|r和|cRXP_ENEMY_Shadowguard Phaseblades|r(每次2个)
    *|cRXP_WARN_they are not immediately present|r
    .complete 85035,2 --6/6 Ethereal assassins slain
    .mob Shadowguard Phaseblade
    .mob Shadowguard Voidguard
step
    .goto 971,27.49,28.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 85035 >>交予洛卡斯-沃克, 特洛格鲁斯游侠
    .accept 85036 >>接受任务：维尼维迪维纳里
    .target Locus-Walker
    .timer 20,RP
step
    .goto 971,27.66,27.56
    >>|cRXP_WARN_等待角色扮演|r
    .complete 85036,1 --1/1 Witness the Conversation between Ve'nari and Locus-Walker
step
    .goto 971,27.93,27.62
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_荒芜之地, 卡加斯|r
    .complete 85036,2 --1/1 Return to Lorewalker Cho
    .timer 70,RP
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.19,16.26,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r|cRXP_WARN_剧情结束后|r交谈
    .turnin 85036 >>交还维尼维迪维纳里
    .target Lorewalker Cho
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 收藏品
#subgroup 探索背景故事
#name AC) 巫妖王
#displayname The Lich King
#next a) 哈拉塔斯

step << Alliance
    .goto 84,64.24,16.10,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或暴风城
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step << Horde
    .goto 85,54.24,56.59,-1
    .goto 2339,49.62,31.52,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 地点在多诺加尔或奥格瑞玛
    .accept 90705 >>接受传说之旅
    .turnin 90705 >>提交洛尔沃克
    .target Lorewalker Cho
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.19,16.26,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .accept 85884 >>接受传说之旅：渴望成为国王的王子
    .skipgossipid 124311
    .choose 6403388
    .target Lorewalker Cho
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.19,16.26,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho|r交谈
    .complete 85884,1 --1/1 Talk to Cho
    .skipgossipid 131596
    .skipgossipid 131598
    .target Cho
step
    .goto 2418,34.49,84.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与乌瑟尔·光明使者交谈|cRXP_FRIENDLY_乌瑟尔·光明使者|r
    .accept 85862 >>接受任务：王子的使命
    .target Uther Lightbringer
step
    #completewith next
    #label Train soldiers
    .goto 2418,44.89,81.69,10,0
    .goto 2418,48.21,77.71,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛丹伦民兵|r交谈并击败他们
    *|cRXP_WARN_Use|r |T236253:0|t[Training Strike] |cRXP_WARN_to deal damage|r.
    *|cRXP_WARN_Use|r |T135906:0|t[Expert Backhand] |cRXP_WARN_to stun the enemy|r.
    .complete 85862,1 --6/6 Train soldiers
step
    #completewith Train soldiers
    #hidewindow
    .goto 2418,48.06,70.12,30 >>1
step
    #requires Train soldiers
    .goto 2418,48.62,51.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛丹伦军士|r交谈并击败他们
    *|cRXP_WARN_Use|r |T236253:0|t[Training Strike] |cRXP_WARN_to deal damage|r |cRXP_WARN_and|r |T135906:0|t[Expert Backhand] |cRXP_WARN_to stun the enemy|r.
    *|cRXP_WARN_You can talk to multiple at once; shortly after defeating one, talk to them again.|r.
    .complete 85862,1 --6/6 Train soldiers
    .skipgossipid 131459
    .target Lordaeron Militia
step
    #completewith next
    #label Muradin
    .goto 2418,50.4,36.66,15,0
    .goto 2418,53.73,34.9,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆拉丁|r交谈
    *|cRXP_WARN_Use|r |T135906:0|t[Expert Backhand] |cRXP_WARN_during his cast of|r |T135975:0|t[Storm Bolt] |cRXP_WARN_to interrupt the cast; move out of the void|r.
    .complete 85862,2 --1/1 Spar with Muradin
    .target Muradin
step
    #completewith Muradin
    #hidewindow
    .goto 2418,54.50,29.96,20 >>1
step
    #requires Muradin
    .goto 2418,54.50,29.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆拉丁|r交谈
    *|cRXP_WARN_Use|r |T135906:0|t[Expert Backhand] |cRXP_WARN_during his cast of|r |T135975:0|t[Storm Bolt] |cRXP_WARN_to interrupt the cast; move out of the void|r.
    .complete 85862,2 --1/1 Spar with Muradin
    .skipgossipid 131489
    .target Muradin Bronzebeard
    .mob Muradin Bronzebeard
step
    .goto 2418,55.38,21.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰瑞纳斯·米奈希尔二世|r交谈
    .turnin 85862 >>交还王子的职责
    .target Terenas Menethil II
step
    .goto 2418,55.38,21.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho|r交谈
    .complete 85884,3 --1/1 Talk to Cho
    .timer 160,RP
    .skipgossipid 131599
    .target Cho
step
    #completewith Coordinates
    +无法获取玩家坐标, 因此不会显示指向箭头
step
    >>|cRXP_WARN_进入斯坦索姆的大门, 然后等待剧情演出|r.
    .scenario 15174,1
step
    *|cRXP_WARN_He's going to enter the gates of stratholme shortly|r.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔萨斯|r交谈
    .scenario 15805,1
    .timer 120,RP
    .skipgossipid 36217
    .target Arthas
step
    >>|cRXP_WARN_跟随|cRXP_FRIENDLY_阿尔萨斯|r并等待剧情发展|r
    .complete 85884,4 --1/1 Witness the Culling of Stratholme
    .target Arthas
step
    #completewith next
    #label Arthas
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔萨斯|r交谈
    .scenario 15807,1
    .target Arthas
step
    #completewith Arthas
    .gossipoption 134404 >>与|cRXP_FRIENDLY_Cho|r交谈
step
    #requires Arthas
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔萨斯|r交谈
    .scenario 15807,1
    .timer 60,RP
    .skipgossipid 36273
    .target Arthas
step
    >>跟随|r阿尔萨斯|r并击杀|r马尔加尼斯|r
    *|cRXP_WARN_Wait for roleplay after|r.
    .complete 85884,5 --Confront Malganis
    .mob Mal'Ganis
step
    #label Coordinates
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho|r交谈
    .complete 85884,6 --1/1 Talk to Cho
    .skipgossipid 131600
    .target Cho
step
    .goto 115,87.17,57.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧瑞克·图哈特|r交谈
    .accept 12291 >>接任务: |cRXP_LOOT_被遗忘的故事|r
    .target Orik Trueheart
step
    #loop
    .goto 115,86.89,64.68,40,0
    .goto 115,86.84,67.57,40,0
    .goto 115,85.44,69.95,40,0
    .goto 115,84.08,66.37,40,0
    .goto 115,82.42,66.74,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_被遗忘的火枪手|r和|cRXP_FRIENDLY_被遗忘的步兵|r和|cRXP_FRIENDLY_被遗忘的骑士|r和|cRXP_FRIENDLY_被遗忘的农夫|r交谈
    .complete 12291,1 --1/1 Forgotten Peasant Questioned
    .mob +Forgotten Peasant
    .complete 12291,2 --1/1 Forgotten Rifleman Questioned
    .mob +Forgotten Rifleman
    .complete 12291,3 --1/1 Forgotten Knight Questioned
    .mob +Forgotten Knight
    .complete 12291,4 --1/1 Forgotten Footman Questioned
    .mob +Forgotten Footman
    .skipgossipid 37796
    .skipgossipid 37797
    .skipgossipid 35881
    .skipgossipid 34970
step
    .goto 115,87.17,57.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧瑞克·图哈特|r交谈
    .turnin 12291 >>交任务: |cRXP_FRIENDLY_被遗忘的故事|r
    .accept 12301 >>接任务: |cRXP_LOOT_真相会让我们解脱|r
    .target Orik Trueheart
step
    #completewith next
    #label Orik's
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12301,1
step
    #completewith Orik's
    .goto 115,86.85,65.99
    .cast 48866 >>使用 |T134334:0|t[欧瑞克的水晶球]
    .timer 113,RP
    .use 37577
step
    #requires Orik's
    .goto 115,86.97,65.58
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12301,1
step
    .goto 115,87.17,57.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧瑞克·图哈特|r交谈
    .turnin 12301 >>交任务: |cRXP_FRIENDLY_真相会让我们解脱|r
    .accept 12305 >>接任务: |cRXP_LOOT_离别的思绪|r
    .target Orik Trueheart
step
    #completewith next
    #label Parting Thoughts
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幻象师瑟里格(|cRXP_FRIENDLY_Zelig the Visionary|r)交谈
    .turnin 12305 >>交任务: |cRXP_FRIENDLY_离别的思绪|r
    .accept 12478 >>接任务: |cRXP_LOOT_霜之哀伤洞穴|r
    .disablecheckbox
    .target Zelig the Visionary
step
    #completewith Parting Thoughts
    .goto 115,78.99,47.41,10 >>进入高塔
step
    #requires Parting Thoughts
    .goto 115,79.15,47.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幻象师瑟里格(|cRXP_FRIENDLY_Zelig the Visionary|r)交谈
    .turnin 12305 >>交任务: |cRXP_FRIENDLY_离别的思绪|r
    .accept 12478 >>接任务: |cRXP_LOOT_霜之哀伤洞穴|r
    .target Zelig the Visionary
step
    #completewith next
    #hidewindow
    #label Parting Thoughts2
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    #completewith Parting Thoughts2
    .goto 115,78.95,47.44,4 >>离开塔楼
step
    #requires Parting Thoughts2
    #completewith next
    #hidewindow
    #label Parting Thoughts3
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    #requires Parting Thoughts2
    #completewith Parting Thoughts3
    .goto 115,74.69,24.28,40,0
    .goto 115,74.7,22.98,10 >>进入霜之哀伤洞穴
step
    #requires Parting Thoughts3
    #completewith next
    #hidewindow
    #label Parting Thoughts4
    .goto 115,75.06,20.26
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    #requires Parting Thoughts3
    #completewith Parting Thoughts4
    .cast 49817 >>使用 |T134334:0|t[泽利格的占卜宝珠]
    .timer 122,RP
    .use 37933
step
    #requires Parting Thoughts4
    #hidewindow
    #completewith next
    #label Parting Thoughts5
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    #requires Parting Thoughts4
    #completewith Parting Thoughts5
    .goto 115,74.36,23.84,20 >>离开霜之哀伤洞穴
step
    #requires Parting Thoughts5
    #completewith next
    #label Parting Thoughts6
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    #requires Parting Thoughts5
    #completewith Parting Thoughts6
    .goto 115,78.96,47.44,20 >>前往任务发布者
step
    #requires Parting Thoughts6
    .goto 115,79.15,47.16
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 12478,1 --1/1 Secrets of the Past Revealed
step
    .goto 115,79.15,47.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幻象师瑟里格(|cRXP_FRIENDLY_Zelig the Visionary|r)交谈
    .turnin 12478 >>交任务: |cRXP_FRIENDLY_霜之哀伤洞穴|r
    .target Zelig the Visionary
    .complete 85884,8 --1/1 Learn about the Doomed Expedition
step
    .goto 85,54.35,56.66,-1 <<Horde
    .goto 84,64.19,16.26,-1 <<Alliance
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 85884 >>提交任务:游历传说——欲称王的王子
    .accept 85885 >>接受传说之旅：无王永存
    .target Lorewalker Cho
step
    .goto 85,54.35,56.66,-1 <<Horde
    .goto 84,64.19,16.26,-1 <<Alliance
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho|r交谈
    .complete 85885,1 --1/1 Talk to Cho
    .timer 24,RP
    .skipgossipid 131573
step
    .goto 85,54.35,56.66,-1 <<Horde
    .goto 84,64.19,16.26,-1 <<Alliance
    .goto 2339,49.6,31.63,-1
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 85885,2 --1/1 Learn about the Lich King's betrayal
step
    .goto 85,54.35,56.66,-1 <<Horde
    .goto 84,64.19,16.26,-1 <<Alliance
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cho|r交谈
    .complete 85885,3 --1/1 Talk to Cho
    .skipgossipid 132759
step
    #completewith next
    #label Memory of Muradin
    >>进入冰冠冰川
    .accept 85875 >>接受任务：巫妖王的崛起
step
    #completewith Memory of Muradin
    .goto 85,54.35,56.66,-1 <<Horde
    .goto 84,64.19,16.26,-1 <<Alliance
    .goto 2339,49.6,31.63,-1
    .gossipoption 134404 >>与|cRXP_FRIENDLY_Cho|r交谈
step
    #requires Memory of Muradin
    .accept 85875 >>接受任务：巫妖王的崛起
step
    .goto 118,51.54,79.93
    >>击杀|cRXP_ENEMY_穆拉丁的记忆|r
    .complete 85875,1 --1/1 Banish the Memory of Muradin
    .mob Memory of Muradin
step
    .goto 118,51.52,79.86
    >>击杀|cRXP_ENEMY_穆拉丁的记忆|r
    .complete 85875,1 --1/1 Banish the Memory of Muradin
    .mob Memory of Muradin
step
    .goto 118,51.77,80.69
    >>击杀|cRXP_ENEMY_Memory of Jaina|r
    .complete 85875,2 --1/1 Banish the Memory of Jaina
    .mob Memory of Jaina
step
    .goto 118,52.01,81.44
    >>击杀|cRXP_ENEMY_乌瑟尔的记忆|r
    .complete 85875,3 --1/1 Banish the Memory of Uther
    .mob Memory of Uther
step
    .isOnQuest 85875
    .goto 118,52.34,82.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特拉诺斯的记忆|r交谈
    .turnin 85875,1 >>提交《巫妖王的崛起》
    .target Memory of Terenas
step
    .complete 85885,4 --1/1 Witness the ascent of the Lich King
step
    .goto 118,52.34,82.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85885,5 --1/1 Talk to Cho
    .skipgossipid 131603
    .target Cho
step
    *|cRXP_WARN_Walk forward a bit to spawn |cRXP_FRIENDLY_Lady Jaina Proudmoore|r behind you|r
    .gossipoption 37487 >>与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .timer 230,RP
    .target Lady Jaina Proudmoore
step
    >>击杀|cRXP_ENEMY_法瑞克|r和|cRXP_ENEMY_法瑞克|r
    .scenario 1057,1
    .mob Ghostly Priest
    .mob Spectral Footman
    .mob Tortured Rifleman
    .mob Phantom Mage
    .mob Falric
step
    >>击杀|cRXP_ENEMY_玛维恩|r和|cRXP_ENEMY_玛维恩|r
    .scenario 1057,2
    .mob Ghostly Priest
    .mob Spectral Footman
    .mob Tortured Rifleman
    .mob Phantom Mage
    .mob Marwyn
step
    *|cRXP_WARN_Walk through the hallway. You will encounter the |cRXP_ENEMY_Lich King|r and |cRXP_FRIENDLY_Jaina|r.
    *Fight the |cRXP_ENEMY_Lich King|r until |cRXP_FRIENDLY_Jaina|r freezes him, then follow her.|r
    .gossipoption 37662 >>与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .timer 330,RP
    .target Lady Jaina Proudmoore
step
    >>击败由|cRXP_ENEMY_Lich King|r召唤的敌人士兵浪潮
    *Defeating the waves of enemies allows |cRXP_FRIENDLY_Jaina|r to progress
    *|cRXP_WARN_Don't let the Lich King reach |cRXP_FRIENDLY_Jaina|r|r.
    .complete 85885,6 --1/1 Help Jaina investigate the Halls of Reflection
    .mob Raging Ghoul
    .mob Risen Witch Doctor
    .mob Lumbering Abomination
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .complete 85885,7 --1/1 Talk to Cho
    .skipgossipid 131606
    .target Cho
step
    .accept 85878,1 >>接受任务：奥塔纳戈尔
step
    >>spam |T132291:0|t[污浊者] 理想情况下尽可能多地作用于NPC
    *Use |T237532:0|t[Pain and Suffering] on cooldown.
    *Use |T135833:0|t[Remorseless Winter] on cooldown.
    .complete 85878,1 --1/1 Complete "O'Thanagor"
step
    .goto 85,54.35,56.66,-1
    .goto 84,64.19,16.26,-1
    .goto 2339,49.6,31.63,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
    .turnin 85878 >>交还奥塔纳戈尔
    .turnin 85885 >>交还任务:洛尔漫步——没有国王永远统治
    .target Lorewalker Cho
]])