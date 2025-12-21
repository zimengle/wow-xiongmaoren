-- Siren Isle Campaign
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0.7 塞壬岛
#subweight 999.9
#name ag) 塞壬岛战役
#displayname |cFF00CCFF1|r - 战役 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 啊) 第一章 - 信任问题


--WEEK 1 CAMPAIGN START

step
    .goto 2339,41.85,26.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .accept 84719 >>接任务: |cRXP_WARN_探险在即|r
    .target Dawn
step
    .goto 2339,43.41,29.92,15,0
    .goto 2248,55.40,33.862
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与乘坐飞艇的|cRXP_FRIENDLY_Skaggit|r交谈
    .turnin 84719 >>交任务: |cRXP_FRIENDLY_探险在即|r
    .target Skaggit
    .accept 84720 >>接任务: |cRXP_WARN_前往海妖岛！|r
step
    .goto 2248,55.40,33.862
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skaggit|r交谈
    .complete 84720,1 --1/1 Talk to Skaggit to depart from Dornogal
    .skipgossipid 124305
    .target Skaggit to depart from Dornogal
step
    #completewith next
    #hidewindow
    #title 跟随箭头指引
    .goto 2369,69.34,50.86,20 >>test
    .timer 9,RP
step
    .goto 2369,69.31,48.08
    #title 跟随箭头指引
    >>|cRXP_WARN_您无法在此处飞行；该区域将在后续解锁|r
    .complete 84720,2 --1/1 Rendezvous with Skaggit
step
    .goto 2369,69.32,48.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skaggit|r交谈
    .turnin 84720 >>交任务: |cRXP_FRIENDLY_前往海妖岛！|r
    .target Skaggit
    .accept 84940 >>接任务: |cRXP_WARN_友好竞赛|r
step
    .goto 2369,67.48,41.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84940 >>交任务: |cRXP_FRIENDLY_友好竞赛|r
    .target Bargus
    .accept 84721 >>接任务: |cRXP_WARN_扫描水晶|r
step
    .goto 2369,67.75,40.49
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_大地原型|r
    .complete 84721,1 --1/1 Earthen Prototype
step
    .goto 2369,70.98,40.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒坦玛尔|r交谈
    .complete 84721,2 --1/1 Arathi Crystals
    .skipgossipid 124803
    .target Apprentice Tanmar
step
    .goto 2369,71.09,45.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Goblin Power Source|r
    .complete 84721,3 --1/1 Goblin Power Source
step
    #completewith next
    .goto 2369,67.50,41.98
    .gossipoption 124801 >>与|cRXP_FRIENDLY_Bargus|r交谈
    .timer 3.5, Roleplay Duration
    .target Bargus
step
    .goto 2369,67.50,41.98
    >>|cRXP_WARN_等待短暂的剧情演出|r, |cRXP_WARN_当计时器归零时将完成|r
    .complete 84721,4 --1/1 Device assembled
step
    .goto 2369,67.47,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84721 >>交任务: |cRXP_FRIENDLY_扫描水晶|r
    .target Bargus
    .accept 84722 >>接任务: |cRXP_WARN_晶妙的信号|r
step
    .goto 2369,57.03,47.72,40,0
    .goto 2369,48.56,44.7
    #title 跟随箭头指引
    .complete 84722,1 --Meet up with Bargus
step
    .goto 2369,48.56,44.7
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击航点目的地处的|cRXP_PICK_Earthen Pylon|r
    .complete 84722,2 --1/1 First Earthen Pylon Activated
step
    .goto 2369,45.44,41.66
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击航点目的地处的|cRXP_PICK_Earthen Pylon|r
    .complete 84722,3 --1/1 Second Earthen Pylon Activated
step
    .goto 2369,44.86,44.12
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击航点目的地处的|cRXP_PICK_Earthen Pylon|r
    .complete 84722,4 --1/1 Third Earthen Pylon Activated
step
    .goto 2369,48.12,43.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84722 >>交任务: |cRXP_FRIENDLY_晶妙的信号|r
    .target Bargus
    .accept 84727 >>接任务: |cRXP_WARN_第二个信号|r
step
    .goto 2369,43.53,28.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84727 >>交任务: |cRXP_FRIENDLY_第二个信号|r
    .accept 84941 >>接任务: |cRXP_WARN_突破穴窟|r
    .target Bargus
step
    .isOnQuest 84941
    .goto 2369,44.64,22.43,40 >>跟随箭头指引
    #title 跟随箭头指引
    .timer 10,RP
step
    .goto 2369,44.64,22.43
    >>在洞穴前方等待, |cRXP_WARN_背对洞穴入口|r, 直到入口被炸开, |cRXP_WARN_爆炸冲击力会将你推得更靠近洞穴. |r
    .complete 84941,1 --1/1 Collapsed tunnel cleared
step
    .goto 2369,48.87,18.42
    #title 跟随箭头指引
    .complete 84941,2 --Cave entered
    .timer 5,RP
step
    .goto 2369,48.83,18.43
    >>|cRXP_WARN_等待短暂的剧情演出|r, |cRXP_WARN_当计时器归零时将完成|r
    *|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84941 >>交任务: |cRXP_FRIENDLY_突破穴窟|r
    .target Bargus
    .accept 84723 >>接任务: |cRXP_WARN_埋葬的秘密|r
step
    .goto 2369,50.32,15.38
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_吟唱之板|r
    *|cRXP_WARN_Remove "Singing 符文" debuff to save 3 seconds.|r
    .complete 84723,1 --1/1 Examine the Singing Tablet
    .skipgossipid 125532
step
    .goto 2375,47.58,44.69
    #title 跟随箭头指引
    .complete 84723,1 --1/1 Examine the Singing Tablet
step
    .goto 2375,47.58,44.69
    #title 跟随箭头指引
    >>击杀|cRXP_ENEMY_Crystalsworn Memory|r|cRXP_WARN_如果它们打扰你|r, 并且|cRXP_WARN_不要碰到|r|cRXP_ENEMY_Faded Construct|r
    .complete 84723,2 --Follow the Signal through the Vault.
    .mob Crystalsworn Memory
step
    .goto 2375,47.59,44.68
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ancient Rune|r
    *击杀|cRXP_ENEMY_Crystalsworn Memory|r|cRXP_WARN_如果它们打扰你|r, 并且|cRXP_WARN_不要碰到|r|cRXP_ENEMY_Faded Construct|r
    .complete 84723,4 --Follow the signal into the Central Chamber
    .mob Crystalsworn Memory
    .mob Faded Construct
    .target Bargus
step
    .goto 2375,48.02,49.32,10,0
    .goto 2375,40.15,70.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    *>>击杀|cRXP_ENEMY_Crystalsworn Memory|r|cRXP_WARN_如果他们打扰你|r
    .complete 84723,5 --Follow the signal into the Central Chamber
    .timer 8,RP
    .target Bargus
step
    .goto 2375,40.15,70.7
    >>|cRXP_WARN_等待短暂的剧情演出|r, |cRXP_WARN_当计时器归零时将完成|r
    *|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84723 >>交任务: |cRXP_FRIENDLY_埋葬的秘密|r
    .target Bargus
    .accept 84724 >>接任务: |cRXP_WARN_光耀宝库|r
step
    .goto 2375,37.43,77.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Skeletal Remains|r
    .complete 84724,1 --1/1 Skeletal Remains Inspected
    .target Skeletal Remains
step
    .goto 2375,37.43,77.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Skeletal Remains|r
    .complete 84724,2 --1/1 Ring Taken
    .skipgossipid 124399
step
    .goto 2375,44.86,72.79
    >>击杀|cRXP_ENEMY_Vault Guardian|r
    .complete 84724,3 --1/1 Tomb Guardian Defeated
    .mob Vault Guardian
step
    .goto 2375,41.37,74.38
    >>击杀|cRXP_ENEMY_Vault Guardian|r获取|T6215540:0|t[|cRXP_LOOT_Cracked Citrine|r]
    .complete 84724,4 --1/1 Cracked Citrine Collected
step
    #completewith next
    .goto 2375,38.01,78.01
    .gossipoption 124775 >>与|cRXP_FRIENDLY_Bargus|r交谈
    .timer 13,RP
    .target Bargus
step
    .goto 2369,71.12,44.27
    >>|cRXP_WARN_等待短暂的剧情演出|r, |cRXP_WARN_当计时器归零时将完成|r
    *|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bargus|r交谈
    .turnin 84724 >>交任务: |cRXP_FRIENDLY_光耀宝库|r
    .target Bargus
step
    .goto 2369,71.09,44.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .accept 84728 >>接任务: |cRXP_WARN_重塑新身|r
    .target Angorla
step
    .goto 2369,71.09,44.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Angorla|r交谈并完成谜题
    *|cRXP_WARN_Rearrange the positions so that none of the connecting intersect|r.
    .skipgossipid 124757 -- do It
    .complete 84728,1 --1/1 Cracked Citrine Repaired
    --x .skipgossipid 131242 -- wait
step
    .goto 2369,71.09,44.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .turnin 84728 >>交任务: |cRXP_FRIENDLY_重塑新身|r
    .target Angorla
    .accept 84725 >>接任务: |cRXP_WARN_指环在召唤|r
step
    .goto 2369,71.09,44.11
    >>装备 |T6215518:0|t[Cyrce的圆环]
    .complete 84725,1 --1/1 Equip Cyrce's Circlet
    .use 228411
step
    .goto 2369,71.09,44.11
    >>打开角色面板, 按住 Shift 键并右键点击 |T6215518:0|t[Cyrce's Circlet](戒指槽). 然后, 左键点击并拖动 |T6215530:0|t[Windsinger's Runed Citrine] 从你的背包中放入 |cFFEB144C红色宝石槽|r
    .complete 84725,2 --1/1 Socket
step
    .goto 2369,71.09,44.11
    >>打开角色面板, 按住 Shift 键并右键点击 |T6215518:0|t[Cyrce的圆环]. 接着, 左键点击移除 |T6215530:0|t[风歌者的符文黄水晶] 的 |cFFEB144C红色宝石槽|r, 然后再次左键点击将其重新装备
    .complete 84725,3 --1/1 Unsocket
step
    .goto 2369,71.09,44.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .turnin 84725 >>交任务: |cRXP_FRIENDLY_指环在召唤|r
    .accept 84726 >>接任务: |cRXP_WARN_奥妙揭晓|r
    .target Angorla

--CONTRUBUTION

step
    .goto 2369,69.40,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“锤子”杰克|r交谈
    .accept 85059 >>接任务: |cRXP_WARN_分一杯羹|r
    .target Jack the Hammer
step
    .goto 2369,69.32,43.18
    >>点击 |cRXP_PICK_Siren Isle Command Map|r, 并参与任意一个事件
    .complete 85059,1 --1/1 Contribute to an event
step
    .goto 2369,69.40,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“锤子”杰克|r交谈
    .turnin 85059 >>交任务: |cRXP_FRIENDLY_分一杯羹|r
    .accept 86156 >>接任务: |cRXP_WARN_参与其中|r
    .target Jack the Hammer
step
    .goto 2369,70.46,67.14,20,0
    .goto 2369,68.38,73.76
    >>|cRXP_WARN_在洞穴中使用额外动作按钮|r
    *|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Runed Storm Cache|r.
    .complete 84726,1 --1/1 Vrykul Ruins Searched
step
    .areapoiexists 2369,8149
    .goto 2369,61.93,74.69
    >>完成|cRXP_WARN_排水泵挖掘|r任务, 通过击杀|cRXP_ENEMY_墓泥|r实现
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Gravesludge
step
    .goto 2369,32.41,69.36
    >>|cRXP_WARN_使用额外动作按钮|r
    *|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Runed Storm Cache|r.
    .complete 84726,2 --1/1 Vrykul Ritual Site Searched
step
    .areapoiexists 2369,8152
    .goto 2369,33.20,64.80
    >>完成|cRXP_WARN_沉没巢穴发掘|r任务, 方法是击杀|cRXP_ENEMY_Nerathor|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Nerathor
step
    .areapoiexists 2369,8150
    .goto 2369,44.03,56.32
    >>完成|cRXP_WARN_瑟瑟发抖的万圣节挖掘|r任务, 击杀|cRXP_ENEMY_斯塔尔格纳克|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Stalagnarok
step
    .goto 2369,39.48,20.23
    >>|cRXP_WARN_使用额外动作按钮|r
    *|TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Runed Storm Cache|r.
    .complete 84726,3 --1/1 Vrykul Gravesite Searched
step
    .goto 2369,71.21,44.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .turnin 84726 >>交任务: |cRXP_FRIENDLY_奥妙揭晓|r
    .target Angorla
step
    .areapoiexists 2369,8149
    .goto 2369,61.93,74.69
    >>完成|cRXP_WARN_排水泵挖掘|r任务, 通过击杀|cRXP_ENEMY_墓泥|r实现
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Gravesludge
step
    .areapoiexists 2369,8150
    .goto 2369,44.03,56.32
    >>完成|cRXP_WARN_瑟瑟发抖的万圣节挖掘|r任务, 击杀|cRXP_ENEMY_斯塔尔格纳克|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Stalagnarok
step
    .areapoiexists 2369,8152
    .goto 2369,33.20,64.80
    >>完成|cRXP_WARN_沉没巢穴发掘|r任务, 方法是击杀|cRXP_ENEMY_Nerathor|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Nerathor
step
    .goto 2369,69.32,43.18
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Siren Isle Command Map|r, 并参与任意一个事件. |cRXP_WARN_如果可以的话, 尽量完成10次. |r
    .complete 86156,1 --10/10 Contribute ten times to events
step
    .areapoiexists 2369,8149
    .goto 2369,61.93,74.69
    >>完成|cRXP_WARN_排水泵挖掘|r任务, 通过击杀|cRXP_ENEMY_墓泥|r实现
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Gravesludge
step
    .areapoiexists 2369,8150
    .goto 2369,44.03,56.32
    >>完成|cRXP_WARN_瑟瑟发抖的万圣节挖掘|r任务, 击杀|cRXP_ENEMY_斯塔尔格纳克|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Stalagnarok
step
    .areapoiexists 2369,8152
    .goto 2369,33.20,64.80
    >>完成|cRXP_WARN_沉没巢穴发掘|r任务, 方法是击杀|cRXP_ENEMY_Nerathor|r
    .complete 86156,2 --1/1 DO ONE OF THE EVENTS IF ITS UP
    .mob Nerathor
step
    .goto 2369,69.40,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“锤子”杰克|r交谈
    .turnin 86156 >>交任务: |cRXP_FRIENDLY_参与其中|r
    .target Jack the Hammer
step
    .goto 2369,72.18,43.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒坦玛尔|r交谈
    .accept 85653 >>接任务: |cRXP_WARN_试水深浅|r
    .target Apprentice Tanmar
step
    .goto 2369,73.34,52.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击海底上的|cRXP_PICK_海员宝箱|r
    .complete 85653,1 --1/1 Search the East Shore
step
    .goto 2369,45.92,87.70
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击海底上的|cRXP_PICK_海员宝箱|r
    .complete 85653,3 --1/1 Search the Southern Shore
step
    .goto 2369,33.07,20.52
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击海底上的|cRXP_PICK_海员宝箱|r
    .complete 85653,2 --1/1 Search the Northern Shore
step
    .goto 2369,72.19,42.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒坦玛尔|r交谈
    .turnin 85653 >>交任务: |cRXP_FRIENDLY_试水深浅|r
    .target Apprentice Tanmar

step
    .isQuestAvailable 85654
    .isQuestTurnedIn 85653
    .isOnQuest 84852
    >>击杀|cRXP_ENEMY_rares|r稀有敌人和|cRXP_ENEMY_enemies|r普通敌人, 完成可重复任务和挖掘, 或开启|cRXP_PICK_chests|r宝箱, 以完成特殊任务的第一阶段
    .complete 84852,1 --Complete activities and secure the Siren Isle (100%)
step
    .isQuestAvailable 85654
    .isQuestTurnedIn 85653
    .isOnQuest 84851
    >>击杀|cRXP_ENEMY_rares|r稀有敌人和|cRXP_ENEMY_enemies|r普通敌人, 完成可重复任务和挖掘, 或开启|cRXP_PICK_chests|r宝箱, 以完成特殊任务的第一阶段
    .complete 84851,1 --Complete activities and secure the Siren Isle (100%)
step
    .isQuestAvailable 85654
    .isQuestTurnedIn 85653
    .isOnQuest 84850
    >>击杀|cRXP_ENEMY_rares|r稀有敌人和|cRXP_ENEMY_enemies|r普通敌人, 完成可重复任务和挖掘, 或开启|cRXP_PICK_chests|r宝箱, 以完成特殊任务的第一阶段
    .complete 84850,1 --Complete activities and secure the Siren Isle (100%)
step
    .goto 2369,71.28,45.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钳工蒂迪|r交谈
    .accept 85654 >>接任务: |cRXP_WARN_御戒而行|r
    .target Didi the Wrench
step
    .goto 2369,69.07,49.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suzie Boltwrench 交谈以进入风暴模式|r
    .complete 85654,2 --1/1 Talk to Suzie Boltwrench to enter Storm Mode
    .target Suzie Boltwrench
    .skipgossipid 123657
step
    .isOnQuest 85654
    .goto 2369,69.07,49.25
    .aura 458069 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suzie Boltwrench 交谈以进入风暴模式|r
    .target Suzie Boltwrench
    .skipgossipid 123657
step
    .goto 2369,69.14,49.66
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_TR-06 Pummeler|r
    .complete 85654,3 --1/1 Activate the TR-06 Pummeler
step
    .isOnQuest 85654
    #hidewindow
    #completewith next
    #label NUKULARTargetPainter
    .complete 85654,4 --1/1 Use the N.U.K.U.L.A.R Target Painter
step
    .isOnQuest 85654
    #completewith NUKULARTargetPainter
    .goto 2369,69.27,47.94
    .aura 466925 >>|TInterface/cursor/crosshair/interact.blp:20|t点击箱子顶部的|cRXP_PICK_.U.K.U.L.A.R 目标画家|r
step
    .isOnQuest 85654
    #requires NUKULARTargetPainter
    >>使用|cRXP_WARN_ExtraActionButton|r并瞄准任意位置
    .complete 85654,4 --1/1 Use the N.U.K.U.L.A.R Target Painter
step
    .isOnQuest 85654
    .goto 2369,69.23,49.26
    .aura -458069 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Suzie Boltwrench 交谈以退出风暴模式|r
    .skipgossipid 125326
    .target Suzie Boltwrench
step
    .goto 2369,71.28,45.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钳工蒂迪|r交谈
    .turnin 85654 >>交任务: |cRXP_FRIENDLY_御戒而行|r
    .target Didi the Wrench
step
    .goto 2369,71.22,44.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .accept 85655 >>接任务: |cRXP_WARN_力量迸发|r
    .target Angorla
step
    #completewith next
    #hidewindow
    #label EquipCyresCircleUnleashingPower
    .isOnQuest 85655
    .equip 11,228411 >>装备赛瑞的法阵

step
    .isOnQuest 85655
    #completewith EquipCyresCircleUnleashingPower
    .equip 11,228411 >>装备赛瑞的法阵
    .use 228411
step
    #requires EquipCyresCircleUnleashingPower
    #loop
    .goto 2369,63.44,76.73,35,0
    .goto 2369,34.47,65.59,35,0
    .goto 2369,45.96,56.72,35,0
    .goto 2369,45.19,23.39,45,0
    >>四处跑动并攻击|cRXP_ENEMY_anything|r
    .complete 85655,1 --10/10 Potential Unveiled
step
    .goto 2369,71.21,44.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安戈拉|r交谈
    .turnin 85655 >>交任务: |cRXP_FRIENDLY_力量迸发|r
    .target Angorla
step
    .goto 2369,72.19,43.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒坦玛尔|r交谈
    .accept 85656 >>接任务: |cRXP_WARN_吟歌窃贼落网记|r
    .target Apprentice Tanmar
step
    #completewith next
    #label SpiritScarredCave
    >>击杀被诅咒的水手. 击败后可获得[歌声碎片]
    .complete 85656,1 --1/1 Spirit Scarred Cave Searched
    .mob Cursed Sailor
step
    #title Enter Cave
    #completewith SpiritScarredCave
    .goto 2369,49.96,42.67,10 >>进入洞窟
step
    #requires SpiritScarredCave
    .goto 2369,52.34,38.57
    >>击杀被诅咒的水手. 击败后可获得[歌声碎片]
    .complete 85656,1 --1/1 Spirit Scarred Cave Searched
    .mob Cursed Sailor
step
    .goto 2369,43.21,47.79,10,0
    .goto 2369,43.02,49.41,10,0
    .goto 2369,38.94,52.49
    >>击杀被诅咒的水手. 击败后可获得[歌声碎片]
    .complete 85656,2 --1/1 Salt and Shanty Searched
    .mob Cursed Sailor
step
    .goto 2369,48.43,58.40
    >>击杀被诅咒的水手. 击败后可获得[歌声碎片]
    .complete 85656,3 --1/1 Ghoststone Diggings Searched
    .mob Cursed Sailor
step
    .goto 2369,72.14,42.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒坦玛尔|r交谈
    .turnin 85656 >>交任务: |cRXP_FRIENDLY_吟歌窃贼落网记|r
    .target Apprentice Tanmar
step
    .goto 2369,71.28,45.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钳工蒂迪|r交谈
    .accept 85657 >>接任务: |cRXP_WARN_喀耳刻会骄傲的|r
    .target Didi the Wrench
step
    .goto 2369,72.19,44.89
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_摩天营救|r
    *|cRXP_WARN_Use the correct ability:|r
    - Wind on the left: Left
    - Wind on the right: Right
    - Wind in the middle: Forward
    .complete 85657,1 --1/1 Survive a ride in the Skypiercer
    .target The Skypiercer
step
    .goto 2369,71.29,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钳工蒂迪|r交谈
    .turnin 85657 >>交任务: |cRXP_FRIENDLY_喀耳刻会骄傲的|r
    .target Didi the Wrench
]])

-- Siren Isle Dailies/Weeklies?
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.0.7 塞壬岛
#name 啊) 塞壬岛周常任务
#displayname |cFF00CCFF2|r - 周常 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r


step
    #loop
    .goto 2369,69.29,43.48,10,0
    .goto 2369,69.42,42.84,10,0
    .goto 2369,71.34,44.10,10,0
    .goto 2369,71.04,39.69,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sky-Captain Elaena Lancekat|r和|cRXP_FRIENDLY_Skaggit|r和|cRXP_FRIENDLY_Dawn|r以及|cRXP_FRIENDLY_Stellin Verasa|r交谈
    .questcount <4,83932,85589,84222,84627,84430,84432,84680,83753,84299,84619 >>|cRXP_WARN_接受浮沙浅滩中的重复任务|r
    *Skip this step when you've accepted all quests.
    .target Sky-Captain Elaena Lancekat
    .target Dawn
    .target Stellin Verasa
    .target Skaggit
step
    .isOnQuest 83932
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_有趣的笔记|r和|cRXP_PICK_褪色的笔记|r和|cRXP_PICK_旧卷轴|r
    *|cRXP_WARN_Use the|r |T2101967:0|t[Research Journal] |cRXP_WARN_afterwards|r.
    .complete 83932,1 --12/12 Interesting Notes added to the Research Journal
    .use 227405
step
    .isOnQuest 83932
    .isQuestAvailable 84248
    .goto 2369,51.50,48.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .accept 84248 >>接任务: |cRXP_WARN_符文仪式|r
    .target Machinist Kromleg
step
    .isOnQuest 84248
    #completewith next
    #label EnterCaveRitual符文
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_召唤符文|r
    .complete 84248,1 --5/5 Summoning 符文 destroyed
step
    .isOnQuest 84248
    #completewith EnterCaveRitual符文
    #title 进入洞窟
    .goto 2369,50.09,42.41,8 >>进入洞窟
step
    .isOnQuest 84248
    #title |TInterface/cursor/crosshair/interact.blp:20|tSummoning 符文
    #requires EnterCaveRitual符文
    #loop
    .goto 2369,52.58,38.46,10,0
    .goto 2369,53.10,40.69,10,0
    .goto 2369,54.11,37.70,10,0
    .goto 2369,53.32,35.62,10,0
    .goto 2369,51.41,37.53,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_召唤符文|r
    .complete 84248,1 --5/5 Summoning 符文 destroyed
step
    .isOnQuest 84248
    .goto 2369,53.02,37.76
    >>击杀|cRXP_ENEMY_Inhyldir 被诅咒者|r
    .complete 84248,2 --1/1 Inhyldir the Cursed slain
    .mob Inhyldir the Cursed
step
    .isOnQuest 84248
    #completewith next
    #label LeaveCaveRitual符文
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .turnin 84248 >>交任务: |cRXP_FRIENDLY_符文仪式|r
    .target Machinist Kromleg
step
    .isOnQuest 84248
    #completewith LeaveCaveRitual符文
    #title 离开洞穴
    .goto 2369,50.09,42.41,8 >>离开洞穴
step
    .isOnQuest 84248
    #requires LeaveCaveRitual符文
    .goto 2369,51.51,48.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .turnin 84248 >>交任务: |cRXP_FRIENDLY_符文仪式|r
    .target Machinist Kromleg
step
    .isOnQuest 84299
    #completewith OokerDookerLiteratureClub
    >>击杀该区域内的|cRXP_ENEMY_Bilge Rat部队|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t或点击|cRXP_PICK_卡亚可乐罐|r和|cRXP_PICK_卡亚可乐储藏品|r
    .complete 84299,1 --Bilge Rat forces disupted (100%)
step
    .isOnQuest 84619,84299,83753
    .isQuestAvailable 84001
    .goto 2369,48.53,53.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .accept 84001 >>接任务: |cRXP_WARN_越轨的矿车|r
    .target Machinist Kromleg
step
    .isOnQuest 84001
    #loop
    .goto 2369,50.03,57.31,8,0
    .goto 2369,51.43,58.68,8,0
    .goto 2369,52.65,59.07,8,0
    .goto 2369,58.49,62.64,8,0
    .goto 2369,58.78,62.96,8,0
    .goto 2369,58.49,62.64,8,0
    .goto 2369,52.65,59.07,8,0
    .goto 2369,51.43,58.68,8,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Crashed Ore Carts|r和|cRXP_PICK_Ore Samples|r和|cRXP_PICK_Mine Tracks|r
    *|cRXP_WARN_Tracks and carts are on the track, most of the ore is below it|r
    .complete 84001,1 --2/2 Mine Tracks repaired
    .complete 84001,2 --5/5 Crashed Mine Carts cleared
    .complete 84001,3 --12/12 Ore Sample
step
    .isOnQuest 84001
    .isQuestComplete 84001
    .goto 2369,48.55,53.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .turnin 84001 >>交任务: |cRXP_FRIENDLY_越轨的矿车|r
    .target Machinist Kromleg
step
    .isOnQuest 83753
    .goto 2369,47.64,64.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Blackstell 炮弹|r
    >>击杀|cRXP_ENEMY_血羽游荡者|r, 从他身上获取 |T252185:0|t[|cRXP_LOOT_黑钢炮弹|r ]
    .complete 83753,1 --1/1 Cannon Master Jin'chu
    .complete 83753,2 --1/1 Blacksteel Cannonballs collected
    .mob Cannon Master Jin'chu
step
    .isOnQuest 83753
    .goto 2369,47.95,66.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bilge Rat Cannon|r
    .complete 83753,3 --1/1 Bilge Rat Cannon controlled
step
    .isOnQuest 83753
    .goto 2369,47.95,66.03
    >>使用 |T252185:0|t[炮击]消灭|cRXP_ENEMY_Bilge Rat|r的鼠类部队
    .complete 83753,4 --Bilge Rat Forces destroyed (100%)
step
    .isOnQuest 84619,84299,83753
    .isQuestAvailable 83827
    .goto 2369,45.31,67.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加尔德·霍恩弗莱|r交谈
    .accept 83827 >>接任务: |cRXP_WARN_静默冥曲|r
    .target Regald Hornfyre
step
    .isOnQuest 83827
    #completewith next
    >>对|cRXP_ENEMY_Arathor Scouts|r和|cRXP_ENEMY_Greaseguard Acquisitioner|r使用|T458645:0|t[音速扰乱器](|cRXP_WARN_或击杀他们|r)
    .complete 83827,2 --7/7 Charmed Troops dispelled
    .mob Arathor Scout
    .mob Greaseguard Acquisitioner
    .mob Alluring Songtwister
    .use 226261
step
    .isOnQuest 83827
    .goto 2369,33.05,73.80
    >>击杀|cRXP_ENEMY_Macabea 海女妖|r
    .complete 83827,1 --1/1 Macabea The Sea Banshee slain
    .mob Macabea The Sea Banshee
step
    .isOnQuest 83827
    #loop
    .goto 2369,36.76,73.33,25,0
    .goto 2369,39.44,67.92,25,0
    .goto 2369,42.50,73.33,25,0
    .goto 2369,32.56,70.59,25,0
    >>对|cRXP_ENEMY_Arathor Scouts|r和|cRXP_ENEMY_Greaseguard Acquisitioner|r使用|T458645:0|t[音速扰乱器](|cRXP_WARN_或击杀他们|r)
    .complete 83827,2 --7/7 Charmed Troops dispelled
    .mob Arathor Scout
    .mob Greaseguard Acquisitioner
    .mob Alluring Songtwister
    .use 226261
step
    .isOnQuest 83827
    .isQuestComplete 83827
    .goto 2369,45.31,67.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加尔德·霍恩弗莱|r交谈
    .turnin 83827 >>交任务: |cRXP_FRIENDLY_静默冥曲|r
    .target Regald Hornfyre
step
    .isOnQuest 84432,84680
    #completewith next
    >>击杀该区域的|r|cRXP_ENEMY_Bloodwake 维库人|r和|r|cRXP_ENEMY_Bloodbrine 恶魔|r
    .complete 84432,1 --15/15 Bloodwake Vrykul slain
    .complete 84680,2 --8/8 Bloodbrine Horror slain
    .mob Bloodwake Spellslinger
    .mob Bloodwake Deathdealer
    .mob Bloodwake Marauder
    .mob Bloodwake Brawler
step
    .isOnQuest 84680
    #label BrinedMonstrosity
    .goto 2369,39.39,73.45
    >>击杀|cRXP_ENEMY_Brined Monstrosity|r
    .complete 84680,3 --1/1 Brined Monstrosity slain
    .mob Brined Monstrosity
step
    #hidewindow
    #completewith BloodwakeVrykul
    #loop
    .goto 2369,39.39,73.45,30,0
    .goto 2369,49.72,74.73,30,0
    .goto 2369,57.90,70.69,45,0
    .goto 2369,54.82,82.28,25,0
    .goto 2369,61.58,83.82,25,0
    .goto 2369,63.17,87.14,30,0
    .goto 2369,66.11,67.24,35,0
    .goto 2369,57.92,61.66,25,0
    .goto 2369,50.18,61.10,25,0
    +1
step
    .isOnQuest 83932
    #completewith RestlessBloodbrine
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_有趣的笔记|r和|cRXP_PICK_褪色的笔记|r和|cRXP_PICK_旧卷轴|r
    *|cRXP_WARN_Use the|r |T2101967:0|t[Research Journal] |cRXP_WARN_afterwards|r.
    .complete 83932,1 --12/12 Interesting Notes added to the Research Journal
    .use 227405
step
    .isOnQuest 84432,84680
    #completewith RestlessBloodbrine
    >>击杀该区域的|r|cRXP_ENEMY_Bloodwake 维库人|r和|r|cRXP_ENEMY_Bloodbrine 恶魔|r
    .complete 84432,1 --15/15 Bloodwake Vrykul slain
    .complete 84680,2 --8/8 Bloodbrine Horror slain
    .mob Bloodwake Spellslinger
    .mob Bloodwake Marauder
    .mob Bloodbrine Horror
step
    .isOnQuest 84680
    #label RestlessBloodbrine
    >>使用|T511729:0|t[石块恢复剂]对|r|cRXP_PICK_Restless Stones|r和|r|cRXP_PICK_Restless Pebbles|r
    .complete 84680,1 --8/8 Restless Stones and Pebbles animated
    .use 228988
    .target Restless Stone
    .target Restless Pebble
step
    .isOnQuest 83932
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_有趣的笔记|r和|cRXP_PICK_褪色的笔记|r和|cRXP_PICK_旧卷轴|r
    *|cRXP_WARN_Use the|r |T2101967:0|t[Research Journal] |cRXP_WARN_afterwards|r.
    .complete 83932,1 --12/12 Interesting Notes added to the Research Journal
step
    .isOnQuest 84432,84680
    #label BloodwakeVrykul
    >>击杀该区域的|r|cRXP_ENEMY_Bloodwake 维库人|r和|r|cRXP_ENEMY_Bloodbrine 恶魔|r
    .complete 84432,1 --15/15 Bloodwake Vrykul slain
    .complete 84680,2 --8/8 Bloodbrine Horror slain
    .mob Bloodwake Spellslinger
    .mob Bloodwake Marauder
    .mob Bloodbrine Horror
step
    .isOnQuest 83932
    #label InterestingNotes
    #loop
    .goto 2369,48.19,60.36,20,0
    .goto 2369,42.30,46.05,20,0
    .goto 2369,45.95,47.72,20,0
    .goto 2369,39.75,52.98,20,0
    .goto 2369,39.02,39.07,20,0
    .goto 2369,52.22,32.87,20,0
    .goto 2369,66.49,64.54,15,0
    .goto 2369,67.39,60.92,15,0
    .goto 2369,63.95,63.12,15,0
    .goto 2369,62.48,67.31,20,0
    .goto 2369,56.01,85.92,20,0
    .goto 2369,54.01,77.09,20,0
    .goto 2369,50.80,76.44,20,0
    .goto 2369,49.17,71.57,20,0
    .goto 2369,51.91,70.01,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_有趣的笔记|r和|cRXP_PICK_褪色的笔记|r和|cRXP_PICK_旧卷轴|r
    *|cRXP_WARN_Use the|r |T2101967:0|t[Research Journal] |cRXP_WARN_afterwards|r.
    .complete 83932,1 --12/12 Interesting Notes added to the Research Journal
step
    .isOnQuest 84430
    #completewith ThreeHeadsOfTheDeep
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_水体防护层|r, 然后点击|cRXP_PICK_水晶碎片|r
    >>击杀 |cRXP_ENEMY_Naga部队|r. 击败它们后搜刮出 |T134111:0|t[|cRXP_LOOT_晶化裂片|r]
    .complete 84430,1 --10/10 Crystal Chunk
    .complete 84430,2 --30/30 Crystal Fragment
    .mob Water Shell
    .mob Crystal Chunk
step
    .isOnQuest 84627
    .goto 2369,67.22,61.88
    >>击杀|cRXP_ENEMY_Warlord Thresh|r
    .complete 84627,1 --1/1 Warlord Thresh slain
    .mob Warlord Thresh
step
    .isOnQuest 84627
    .goto 2369,61.36,67.21
    >>击杀|cRXP_ENEMY_Nereu of the Silent Wave|r
    .complete 84627,3 --1/1 Nereu of the Silent Wave slain
    .mob Nereu of the Silent Wave
step
    .isOnQuest 84627
    .goto 2369,48.54,74.89
    >>击杀|cRXP_ENEMY_Extractor 西莉赛|r
    .complete 84627,2 --1/1 Extractor Silisai slain
    .mob Extractor Silisai
step
    .isQuestAvailable 85051
    .isOnQuest 84627,84430,85589
    .goto 2369,41.95,68.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .accept 85051 >>接任务: |cRXP_WARN_翻遍海滩|r
    .target Machinist Kromleg
step
    .isOnQuest 85051
    #loop
    .goto 2369,32.70,70.21,15,0
    .goto 2369,30.62,76.18,15,0
    .goto 2369,33.63,78.16,15,0
    .goto 2369,37.30,74.36,15,0
    .goto 2369,38.84,67.95,15,0
    >>|cRXP_WARN_跟随并保护|cRXP_FRIENDLY_回收者克尔坎克|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_Salvaged Scrap|r
    .complete 85051,1 --Escort Kerchunk as he searches the beach
    .complete 85051,2 --24/24 Salvageable Scrap
    .mob Driftwave Bull
    .mob Cliffreach Pridetalon
step
    .isOnQuest 85051
    .isQuestComplete 85051
    #label ThreeHeadsOfTheDeep
    .goto 2369,41.95,68.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_机械师克罗姆勒格|r交谈
    .turnin 85051 >>交任务: |cRXP_FRIENDLY_翻遍海滩|r
    .target Machinist Kromleg
step
    .isOnQuest 84430
    #loop
    .goto 2369,47.21,75.12,35,0
    .goto 2369,52.21,59.35,35,0
    .goto 2369,59.92,66.82,35,0
    .goto 2369,53.64,79.25,35,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_水体防护层|r, 然后点击|cRXP_PICK_水晶碎片|r
    >>击杀 |cRXP_ENEMY_Naga部队|r. 击败它们后搜刮出 |T134111:0|t[|cRXP_LOOT_晶化裂片|r]
    .complete 84430,1 --10/10 Crystal Chunk
    .complete 84430,2 --30/30 Crystal Fragment
    .mob Water Shell
    .mob Crystal Chunk
step
    .isOnQuest 85589
    #completewith next
    #label RuffledPagesA
    >>击杀|cRXP_ENEMY_Cliffreach Pridetalons|r. 击败它们可获得 |T134332:0|t[|cRXP_LOOT_Ruffled Pages|r]
    .complete 85589,1 --15/15 Ruffled Pages
    .mob Cliffreach Pridetalon
    .mob Cliffreach Matriarch
step
    .isOnQuest 85589
    #completewith RuffledPagesA
    .goto 2369,46.27,65.11
    .cast 313062 >>向上看并点击|cRXP_PICK_Grappling Hold|r
step
    .isOnQuest 85589
    #requires RuffledPagesA
    #loop
    .goto 2369,42.31,61.27,15,0
    .goto 2369,39.70,62.48,15,0
    .goto 2369,41.94,60.27,10,0
    .goto 2369,43.18,63.49,10,0
    .goto 2369,39.59,58.73,15,0
    .goto 2369,38.83,58.94,20,0
    .goto 2369,31.29,59.51,15,0
    .goto 2369,30.69,65.57,15,0
    .goto 2369,29.57,70.49,10,0
    .goto 2369,26.74,72.44,15,0
    >>击杀|cRXP_ENEMY_Cliffreach Pridetalons|r. 击败它们可获得 |T134332:0|t[|cRXP_LOOT_Ruffled Pages|r]
    *向上看并点击|cRXP_PICK_Grappling Hold|r
    .complete 85589,1 --15/15 Ruffled Pages
    .mob Cliffreach Pridetalon
    .mob Cliffreach Matriarch
step
    .isOnQuest 84222
    >>击杀|r在塞壬岛(在你的地图上寻找星星)
    *|cRXP_WARN_Just wait in the center of the isle until one appears|r
    .complete 84222,1 --2/2 Rare Siren Isle enemies slain
step
    .isOnQuest 84619
    .goto 2369,54.76,83.26
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bilge Rat Trunk|r
    .complete 84619,4 --1/1 Ookler's Diary
step
    .isOnQuest 84619
    .goto 2369,55.09,92.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_塞壬岛宣言|r|cRXP_WARN_在船上|r
    .complete 84619,2 --1/1 Siren Isle Manifest
step
    .isOnQuest 84619
    #completewith next
    >>击杀|r|cRXP_ENEMY_First Mate Dat-Dat|r. 击败他后搜刮出|r|T134245:0|t[|cRXP_LOOT_First Mate Dat Dat's Key|r]
    .collect 231809,1 --1/1 First Mate Dat Dat's Key
    .mob First Mate Dat-Dat
step
    .isOnQuest 84619
    .goto 2369,62.69,97.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击船上|cRXP_PICK_Song's of the Siren|r书|cRXP_WARN_on the boat|r
    .complete 84619,5 --1/1 Songs of the Siren
step
    .isOnQuest 84619
    #hidewindow
    #label FirstMateDatDatsKey
    #completewith next
    .complete 84619,1 --1/1 Ashvane Co. Survry Report
step
    .isOnQuest 84619
    .goto 2369,62.92,97.25
    #completewith FirstMateDatDatsKey
    >>击杀|r|cRXP_ENEMY_First Mate Dat-Dat|r. 击败他后搜刮出|r|T134245:0|t[|cRXP_LOOT_First Mate Dat Dat's Key|r]
    .collect 231809,1 --1/1 First Mate Dat Dat's Key
    .mob First Mate Dat-Dat
step
    .isOnQuest 84619
    #requires FirstMateDatDatsKey
    .goto 2369,60.36,98.00
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Dat Dat的书本藏匿处|r
    .complete 84619,1 --1/1 Ashvane Co. Survry Report
step
    .isOnQuest 84619
    #label OokerDookerLiteratureClub
    #requires FirstMateDatDatsKey
    .goto 2369,66.64,87.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Hozen Poetry|r
    .complete 84619,3 --1/1 Hozen Poetry
step
    .isOnQuest 84299
    #loop
    .goto 2369,68.27,60.10,35,0
    .goto 2369,59.66,67.45,35,0
    .goto 2369,47.73,65.43,35,0
    .goto 2369,46.45,75.68,35,0
    .goto 2369,66.34,86.30,35,0
    >>击杀该区域内的|cRXP_ENEMY_Bilge Rat部队|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t或点击|cRXP_PICK_卡亚可乐罐|r和|cRXP_PICK_卡亚可乐储藏品|r
    .complete 84299,1 --Bilge Rat forces disupted (100%)
step
    .isQuestComplete 83753
    .goto 2369,69.34,43.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skaggit|r交谈
    .turnin 83753 >>交任务: |cRXP_FRIENDLY_因果相炮|r
    .target Skaggit
step
    .isQuestComplete 84299
    .goto 2369,69.34,43.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Skaggit|r交谈
    .turnin 84299 >>交任务: |cRXP_FRIENDLY_海盗的珍宝|r
    .target Skaggit
step
    .isQuestComplete 84619
    .goto 2369,71.05,39.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰林·维拉莎|r交谈
    .turnin 84619 >>交任务: |cRXP_FRIENDLY_乌克都克文学社|r
    .target Stellin Verasa
step
    .isOnQuest 84222
    .isQuestComplete 84222
    .goto 2369,69.43,42.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sky-Captain Elaena Lancekat|r交谈
    .turnin 84222 >>交任务: |cRXP_FRIENDLY_肃清周边|r
    .target Sky-Captain Elaena Lancekat
step
    .isOnQuest 84430
    .goto 2369,69.43,42.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sky-Captain Elaena Lancekat|r交谈
    .turnin 84430 >>交任务: |cRXP_FRIENDLY_水晶的远征|r
    .target Sky-Captain Elaena Lancekat
step
    .isOnQuest 84627
    .goto 2369,69.43,42.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sky-Captain Elaena Lancekat|r交谈
    .turnin 84627 >>交任务: |cRXP_FRIENDLY_深渊三祸首|r
    .target Sky-Captain Elaena Lancekat
step
    .isOnQuest 84680
    .goto 2369,69.13,43.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 84680 >>交任务: |cRXP_FRIENDLY_滚石苏生|r
    .target Dawn
step
    .isOnQuest 84432
    .goto 2369,69.13,43.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 84432 >>交任务: |cRXP_FRIENDLY_长船登岸|r
    .target Dawn
step
    .isOnQuest 83932
    .goto 2369,71.05,39.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰林·维拉莎|r交谈
    .turnin 83932 >>交任务: |cRXP_FRIENDLY_历史文献|r
    .target Stellin Verasa,
step
    .isOnQuest 85589
    .goto 2369,71.05,39.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰林·维拉莎|r交谈
    .turnin 85589 >>交任务: |cRXP_FRIENDLY_起皱的纸页|r
    .target Stellin Verasa
]])
