----------------------------
---x DAILIES
----------------------------

--SEPERATOR
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name 9ha
#displayname |cFFFCDC00详情|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled



]])

--Cloud Serpent Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name a) 风蛇日常任务
#displayname |cFF1EFF001|r - 翔龙骑士团 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ab) 卡拉克西日常任务

step
    #loop
    .goto 371,57.51,45.36,15,0
    .goto 371,57.75,44.94,10,0
    .goto 371,58.28,45.04,15,0
    .goto 371,58.61,43.65,15,0
    .goto 371,57.29,43.46,15,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r和|cRXP_FRIENDLY_你的雏龙|r和|cRXP_FRIENDLY_宁纳·黑轮|r和|cRXP_FRIENDLY_奎陆·白眉|r和|cRXP_FRIENDLY_风刃教头|r交谈
    .questcount <3,31706,31711,31708,31194,30155,30156,30158,31700,31701,30154,31719,31721,31699,31702,31710,31703,31698,31712,31715,31714 >>|cRXP_WARN_在植物园领取3个可用的日常任务|r
    .target Elder Anli
    .target Your Hatchling
    .target Ningna Darkwheel
    .target Qua-Ro Whitebrow
    .target Instructor Windblade
step
    .isOnQuest 31719
    .goto 371,58.26,45.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宁纳·黑轮|r交谈, |cRXP_WARN_击败她|r
    .complete 31719,1 --1/1 Ningna Darkwheel defeated
    .target Ningna Darkwheel
    .skipgossipid 41480
step
    .isOnQuest 31721
    .goto 371,57.29,43.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奎陆·白眉|r交谈, |cRXP_WARN_击败他|r
    .complete 31721,1 --1/1 Qua-Ro Whitebrow defeated
    .target Qua-Ro Whitebrow
    .mob Qua-Ro Whitebrow
    .skipgossipid 40479
step
    .isOnQuest 30152
    #completewith next
    #label TheSkyRace
    .complete 30152,1 --10/10 Checkpoints passed
    .complete 30152,2 --1/1 Pass underneath the Finish Line
step
    .isOnQuest 30152
    #completewith TheSkyRace
    .goto 371,58.61,43.65
    .gossipoption 40400 >>与|cRXP_FRIENDLY_风刃教头|r交谈
    .target Instructor Windblade
step
    .isOnQuest 30152
    #title Checkpoint (1/10)
    #requires TheSkyRace
    .goto 371,60.60,39.34
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,1 --1/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (2/10)
    .goto 371,59.67,31.51
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,2 --2/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (3/10)
    .goto 371,61.29,25.20
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,3 --3/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (4/10)
    .goto 371,66.30,35.91
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,4 --4/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (5/10)
    .goto 371,66.11,42.49
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,5 --5/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (6/10)
    .goto 371,66.73,51.47
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,6 --6/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (7/10)
    .goto 371,64.05,51.04
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,7 --7/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (8/10)
    .goto 371,61.82,54.54
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,8 --8/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (9/10)
    .goto 371,60.40,52.88
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1,9 --9/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Checkpoint (10/10)
    .goto 371,58.76,46.83
    >>|cRXP_WARN_带着旗帜飞过气球|r
    *Try to fly through the cloud rings to gain a speed buff
    .complete 30152,1 --10/10 Checkpoints passed
    .target Instructor Windblade
    .skipgossipid 40400
step
    .isOnQuest 30152
    #title Finish Line
    .goto 371,58.38,46.35
    >>|cRXP_WARN_飞越终点线|r
    .complete 30152,2 --1/1 Pass underneath the Finish Line
    .skipgossipid 40400
step
    .isOnQuest 31712
    #completewith LordOonaSlainB
    >>击杀|cRXP_ENEMY_Oona Hozen|r
    .complete 31712,1 --13/13 Oona Hozen slain
    .mob Oona Goon
    .mob Oona Brewchugger
    .mob Oona Tuna-Catcher
step
    .isOnQuest 31714
    #completewith LordOonaSlainB
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_迷失翔龙|r
    *|cRXP_WARN_Be careful as you're able to kill them accidentally.|r
    .complete 31714,1 --10/10 Rescued Serpent
    .target Misguided Serpent
step
    .isOnQuest 31715
    #completewith next
    #label LordOonaSlainA
    >>击杀|cRXP_ENEMY_Load Oona|r
    .complete 31715,1 --1/1 Lord Oona slain
    .mob Lord Oona
step
    #title Enter Cave
    #completewith LordOonaSlainA
    .goto 371,57.50,27.72,10 >>进入洞窟
step
    #requires LordOonaSlainA
    #label LordOonaSlainB
    .goto 375,47.51,28.36,20,0
    .goto 375,24.43,44.19,20,0
    .goto 375,46.44,81.04
    >>击杀|cRXP_ENEMY_Load Oona|r
    .complete 31715,1 --1/1 Lord Oona slain
    .mob Lord Oona
step
    #completewith OonaHozenSlain
    #hidewindow
    #loop
    .goto 375,37.18,41.68,8,0
    .goto 375,57.06,30.82,15,0
    .goto 375,76.14,52.98,18,0
    .goto 375,79.01,35.69,18,0
    .goto 375,57.06,30.82,15,0
    .goto 375,24.43,44.19,20,0
    .goto 375,46.44,81.04,20,0
    +1
step
    .isOnQuest 31712
    #completewith next
    >>击杀|cRXP_ENEMY_Oona Hozen|r
    .complete 31712,1 --13/13 Oona Hozen slain
    .mob Oona Goon
    .mob Oona Brewchugger
    .mob Oona Tuna-Catcher
step
    .isOnQuest 31714
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_迷失翔龙|r
    *|cRXP_WARN_Be careful as you're able to kill them accidentally|r.
    .complete 31714,1 --10/10 Rescued Serpent
    .target Misguided Serpent
step
    .isOnQuest 31712
    #label OonaHozenSlain
    >>击杀|cRXP_ENEMY_Oona Hozen|r
    .complete 31712,1 --13/13 Oona Hozen slain
    .mob Oona Goon
    .mob Oona Brewchugger
    .mob Oona Tuna-Catcher
step
    .isOnQuest 31710
    #completewith SeedofDoubtSlainB
    >>击杀 |cRXP_ENEMY_小寡妇蛛|r. 从它们身上搜刮出|T463856:0|t[|cRXP_LOOT_小蜘蛛眼|r]
    .complete 31710,1 --100/100 Tiny Spider Eye
    .mob Widowspawn
step
    .isOnQuest 31706
    #completewith SeedofDoubtSlainB
    >>击杀|cRXP_ENEMY_悲泣寡妇蛛|r
    .complete 31706,1 --7/7 Weeping Widow slain
    .mob Weeping Widow
step
    .isOnQuest 31708
    #completewith SeedofDoubtSlainB
    .complete 31708,1 --25/25 Serpent's Scale
step
    .isOnQuest 31711
    #completewith next
    #label SeedofDoubtSlainA
    #hidewindow
    >>击杀|cRXP_ENEMY_疑虑之种|r
    .complete 31711,1 --1/1 Seed of Doubt slain
    .mob Seed of Doubt
step
    #title Enter Cave
    #completewith SeedofDoubtSlainA
    .goto 371,57.69,31.72,10 >>进入洞窟
step
    .isOnQuest 31711
    #requires SeedofDoubtSlainA
    #label SeedofDoubtSlainB
    .goto 374,47.73,20.00,20,0
    .goto 374,33.23,38.52
    >>击杀|cRXP_ENEMY_疑虑之种|r
    .complete 31711,1 --1/1 Seed of Doubt slain
    .mob Seed of Doubt
step
    #completewith WeepingWidowSlain
    #hidewindow
    #loop
    .goto 374,30.30,72.86,18,0
    .goto 374,46.61,85.36,18,0
    .goto 374,73.39,49.73,18,0
    .goto 374,41.79,15.36,25,0
    +1
step
    .isOnQuest 31706
    #completewith TinySpiderEyes
    >>击杀|cRXP_ENEMY_悲泣寡妇蛛|r
    .complete 31706,1 --7/7 Weeping Widow slain
    .mob Weeping Widow
step
    .isOnQuest 31708
    #completewith TinySpiderEyes
    .complete 31708,1 --25/25 Serpent's Scale
step
    .isOnQuest 31710
    #label TinySpiderEyes
    >>击杀 |cRXP_ENEMY_小寡妇蛛|r. 从它们身上搜刮出|T463856:0|t[|cRXP_LOOT_小蜘蛛眼|r]
    .complete 31710,1 --100/100 Tiny Spider Eye
    .mob Widowspawn
step
    .isOnQuest 31706
    #completewith next
    >>击杀|cRXP_ENEMY_悲泣寡妇蛛|r
    .complete 31706,1 --7/7 Weeping Widow slain
    .mob Weeping Widow
step
    .isOnQuest 31708
    #completewith TinySpiderEyes
    .complete 31708,1 --25/25 Serpent's Scale
step
    .isOnQuest 31706
    #label WeepingWidowSlain
    >>击杀|cRXP_ENEMY_悲泣寡妇蛛|r
    .complete 31706,1 --7/7 Weeping Widow slain
    .mob Weeping Widow
step
    .isOnQuest 31711,31706,31710
    .zoneskip 374,1
    #title Leave Cave
    .goto 371,57.94,31.72
    .zone 371 >>离开洞穴
step
    .isOnQuest 31710
    .goto 371,57.54,45.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碧蓝雏龙|r交谈
    .dailyturnin 31710 >>交还风味美食
    .target Azure Hatchling
step
    .isOnQuest 31708
    .goto 371,57.54,45.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_你的云蛇|r交谈
    .dailyturnin 31708 >>交任务: |cRXP_FRIENDLY_龙鳞菇|r
    .target Your Cloud Serpent
step
    .isOnQuest 31706
    .goto 371,57.71,45.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31706 >>交任务: |cRXP_FRIENDLY_悲泣寡妇蛛|r
    .target Elder Anli
step
    .isOnQuest 31711
    .goto 371,57.71,45.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31711 >>交任务: |cRXP_FRIENDLY_疑虑之种|r
    .target Elder Anli
step
    .isOnQuest 31194
    .goto 371,69.68,31.28
    >>击杀|cRXP_ENEMY_滑鳞蜥蜴领主|r
    .complete 31194,1 --1/1 Slitherscale Lizard-Lord slain
    .mob Slitherscale Lizard-Lord
step
    #completewith SlitherscaleSaurokSlainB
    #hidewindow
    #loop
    .goto 371,68.27,32.88,40,0
    .goto 371,66.74,25.68,40,0
    .goto 371,69.51,25.81,35,0
    +1
step
    .isOnQuest 30155
    #completewith next
    >>击杀|cRXP_ENEMY_Slitherscale saurok|r
    .complete 30155,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale saurok
step
    .isOnQuest 30156
    >>击杀 |cRXP_ENEMY_盐背海龟|r和 |cRXP_ENEMY_盐背幼龟|r. 击败它们后可掉落 |T237339:0|t[盐背碎肉] 或 |T237338:0|t[盐背肉]
    >>将5个盐背碎肉合成获得盐背肉
    >>|cRXP_WARN_点击你旁边的|cRXP_FRIENDLY_云蛇|r|r
    .use 79028
    .use 79027
    .complete 30156,1 --3/3 Hatchling fed
    .mob Saltback Turtle
    .mob Saltback Yearling
step
    .isOnQuest 30155
    #completewith next
    >>击杀|cRXP_ENEMY_Slitherscale saurok|r
    .complete 30155,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale saurok
step
    .isOnQuest 30158
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_滑鳞武器架|r
    .complete 30158,1 --5/5 Slitherscale Harpoon
step
    .isOnQuest 30155
    #label SlitherscaleSaurokSlainA
    >>击杀|cRXP_ENEMY_Slitherscale saurok|r
    .complete 30155,1 --8/8 Slitherscale saurok slain
    .mob Slitherscale saurok
step
    #requies SlitherscaleSaurokSlainA
    #label SlitherscaleSaurokSlainB
    #optional
step
    .isOnQuest 31699
    #completewith WindwardHuntressSlain
    >>击杀 |cRXP_FRIENDLY_ShadowfaeTrickster|r
    .complete 31699,1 --7/7 Shadowfae Trickster slain
    .mob Shadowfae Trickster
step
    .isOnQuest 31698
    #completewith WindwardHuntressSlain
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31698,1 --7/7 Windward Tiger slain
    .mob Windward Tiger
step
    .isOnQuest 31700
    #completewith WindwardHuntressSlain
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 30154
    #completewith WindwardHuntressSlain
    >>击杀|cRXP_ENEMY_临风猛虎|r. 击杀后搜刮出 |T237347:0|t[|cRXP_LOOT_老虎腰肉|r]
    .complete 30154,1 --5/5 Tiger Flank
    .mob Windward Tiger
step
    .isOnQuest 31702
    .goto 371,63.86,22.36
    >>击杀|cRXP_ENEMY_临风刃牙虎|r
    .complete 31702,1 --1/1 Windward Saber slain
    .mob Windward Saber
step
    .isOnQuest 31701
    #completewith next
    #label WindwardHuntressSlain
    >>击杀|cRXP_ENEMY_临风女猎手|r
    .complete 31701,1 --1/1 Windward Huntress slain
    .mob Windward Huntress
step
    #title Enter Cave
    #completewith WindwardHuntressSlain
    .goto 371,64.40,25.86,10 >>进入洞窟
step
    .isOnQuest 31701
    #requires WindwardHuntressSlain
    .goto 371,64.92,25.54
    >>击杀|cRXP_ENEMY_临风女猎手|r
    .complete 31701,1 --1/1 Windward Huntress slain
    .mob Windward Huntress

step
    .isOnQuest 31699
    #completewith ShadowfaeMadcapSlain
    >>击杀 |cRXP_FRIENDLY_ShadowfaeTrickster|r
    .complete 31699,1 --7/7 Shadowfae Trickster slain
    .mob Shadowfae Trickster
step
    .isOnQuest 31698
    #completewith ShadowfaeMadcapSlain
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31698,1 --7/7 Windward Tiger slain
    .mob Windward Tiger
step
    .isOnQuest 31700
    #completewith ShadowfaeMadcapSlain
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 30154
    #completewith ShadowfaeMadcapSlain
    >>击杀|cRXP_ENEMY_临风猛虎|r. 击杀后搜刮出 |T237347:0|t[|cRXP_LOOT_老虎腰肉|r]
    .complete 30154,1 --5/5 Tiger Flank
    .mob Windward Tiger
step
    .isOnQuest 31703
    #completewith next
    #label ShadowfaeMadcapSlain
    >>击杀影妖狂徒
    .complete 31703,1 --1/1 Shadowfae Madcap slain
    .mob Shadowfae Madcap
step
    #title Enter Cave
    #completewith ShadowfaeMadcapSlain
    .goto 371,62.68,26.79,10 >>进入洞窟
step
    .isOnQuest 31703
    #requires ShadowfaeMadcapSlain
    .goto 371,62.65,27.45
    >>击杀影妖狂徒
    .complete 31703,1 --1/1 Shadowfae Madcap slain
    .mob Shadowfae Madcap

step
    #completewith StolenBoots
    #hidewindow
    #loop
    .goto 371,61.10,26.14,35,0
    .goto 371,62.38,20.81,35,0
    .goto 371,63.56,23.84,35,0
    .goto 371,64.08,27.32,35,0
    +1
step
    .isOnQuest 31699
    #completewith TigerFlank
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31699,1 --7/7 Shadowfae Trickster slain
    .mob Shadowfae Trickster
step
    .isOnQuest 31698
    #completewith TigerFlank
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31698,1 --7/7 Windward Tiger slain
    .mob Windward Tiger
step
    .isOnQuest 31700
    #completewith TigerFlank
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 30154
    #label TigerFlank
    >>击杀|cRXP_ENEMY_临风猛虎|r和|cRXP_ENEMY_临风猛虎|r, 击败它们后可掉落 |T237347:0|t[|cRXP_LOOT_老虎腰肉|r]
    .complete 30154,1 --5/5 Tiger Flank
    .mob Windward Tiger
    .mob Windward Alpha
step
    .isOnQuest 31700
    #completewith ShadowfaeTricksterSlain
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 31698
    #completewith ShadowfaeTricksterSlain
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31698,1 --7/7 Windward Tiger slain
    .mob Windward Tiger
step
    .isOnQuest 31699
    #label ShadowfaeTricksterSlain
    >>击杀 |cRXP_FRIENDLY_ShadowfaeTrickster|r
    .complete 31699,1 --7/7 Shadowfae Trickster slain
    .mob Shadowfae Trickster
step
    .isOnQuest 31700
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 31698
    >>击杀|cRXP_ENEMY_影妖骗子|r
    .complete 31698,1 --7/7 Windward Tiger slain
    .mob Windward Tiger
step
    .isOnQuest 31700
    #label StolenBoots
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_失窃的靴子|r
    .complete 31700,1 --14/14 Stolen Boots
    .mob Shadowfae Trickster
step
    .isOnQuest 30155
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 30155 >>交还:恢复平衡
    .target Elder Anli
step
    .isOnQuest 30156
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 30156 >>交还“喂食时间”任务
    .target Elder Anli
step
    .isOnQuest 31194
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31194 >>提交镇压滑鳞氏族任务
    .target Elder Anli
step
    .isOnQuest 30158
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 30158 >>交出:解除武装
    .target Elder Anli
step
    .isOnQuest 31702
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31702 >>交还“心头大患”任务
    .target Elder Anli
step
    .isOnQuest 31703
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31703 >>狂徒的末日
    .target Elder Anli
step
    .isOnQuest 31700
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31700 >>交还《穿错鞋》
    .target Elder Anli
step
    .isOnQuest 31701
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31701 >>交还残暴的女猎手
    .target Elder Anli
step
    .isOnQuest 31699
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31699 >>交出林精恐惧症
    .target Elder Anli
step
    .isOnQuest 31698
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31698 >>提交“养虎为患”任务
    .target Elder Anli
step
    .isOnQuest 30154
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 30154 >>交还《想要抓住心, 得先抓住胃》
    .target Elder Anli
step
    .isOnQuest 31719
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31719 >>提交训练师的试炼：宁纳·黑轮
    .target Elder Anli
step
    .isOnQuest 31721
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31721 >>提交训练师的试炼：奎陆·白眉
    .target Elder Anli
step
    .isOnQuest 30152
    .goto 371,57.63,44.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 30152 >>提交飞行竞技赛任务
    .target Elder Anli
step
    .isOnQuest 31712
    .goto 371,57.72,44.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31712 >>提交顽劣的猴子
    .target Elder Anli
step
    .isOnQuest 31715
    .goto 371,57.72,44.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31715 >>交出海上魔王
    .target Elder Anli
step
    .isOnQuest 31714
    .goto 371,57.72,44.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安离长老|r交谈
    .dailyturnin 31714 >>交还:拯救翔龙
    .target Elder Anli
]])

--卡拉克西 Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name ab) 卡拉克西日常任务
#displayname |cFF1EFF002|r - 卡拉克西 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r 
#title 卡拉克西 Dailies
#next AC) 至尊天神日常任务

step
    #loop
    .goto 422,54.29,35.93,15,0
    .goto 422,55.06,35.85,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_操纵者卡兹克|r和|cRXP_FRIENDLY_解剖者里卡尔|r和|cRXP_FRIENDLY_至尊者柯尔凡|r或|cRXP_FRIENDLY_风刃者基鲁克|r谈话
    .questcount <6,31232,31238,31231,31235,31234,31233,31109,31487,31494,31502,31503,31496,31808 >>|cRXP_WARN_完成所有影踪派日常任务, 若未完成则跳过此步骤|r
    .target Kaz'tik the Manipulator
    .target Rik'kal the Dissector
    .target Korven the Prime
    .target Kil'ruk the Wind-Reaver
step
    .isOnQuest 31808
    .goto 422,50.82,41.37
    #title |cFFFCDC00跟随箭头指引|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_科沃克|r
    .complete 31808,1 --1/1 Locate Kovok near the Clutches of Shek'zeer
    .target Kovok
step
    .isOnQuest 31808
    #loop
    .goto 422,50.65,45.84,40,0
    .goto 422,41.68,41.22,50,0
    .goto 422,40.63,34.35,45,0
    .goto 422,41.76,27.94,40,0
    .goto 422,68.01,12.87,50,0
    .goto 422,41.76,27.94,40,0
    .goto 422,40.63,34.35,45,0
    .goto 422,41.68,41.22,50,0
    >>垃圾邮件 |T132104:0|t[毒爆] (1) 击杀|cRXP_ENEMY_螳螂妖|r
    .complete 31808,2 --200/200 Mantid slain
    .mob Ik'thik Warrior
    .mob Ik'thik Slayer
    .mob Krik'thik Battletank
    .mob Krik'thik Wingguard
    .mob Krik'thik Wingleader
step
    .isOnQuest 31109
    #completewith KunchongHatchlingReleased
    >>击杀|cRXP_ENEMY_Shek'zeer Mantid|r
    .complete 31109,1 --40/40 Shek'zeer Mantid Slain
    .mob Shek'zeer Bladesworn
    .mob Shek'zeer Manipulator
step
    .isOnQuest 31487
    #completewith KunchongHatchlingReleased
    >>击杀|cRXP_ENEMY_惊怖恐虫|r和|cRXP_ENEMY_Shek'zeer Manipulator|r
    *|cRXP_WARN_Use the|r |T458772:0|t[Sonic Disruption Tool] |cRXP_WARN_near |cRXP_ENEMY_Dread Kunchong|r to weaken them and make them attack the |cRXP_ENEMY_Shek'zeer Manipulator|r|r
    .complete 31487,1 --4/4 Dread Kunchong slain
    .complete 31487,2 --6/6 Shek'zeer Manipulator slain
    .mob Dread Kunchong
    .mob Shek'zeer Manipulator
step
    .isOnQuest 31494
    #label KunchongHatchlingReleased
    #loop
    .goto 422,47.78,36.52,30,0
    .goto 422,49.71,33.25,30,0
    .goto 422,46.05,30.11,30,0
    .goto 422,44.73,34.43,27,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_恐虫笼子|r
    .complete 31494,1 --8/8 Kunchong Hatchling released
step
    .isOnQuest 31109
    #completewith DreadKunchongShekzeerManipulator
    >>击杀|cRXP_ENEMY_Shek'zeer Mantid|r
    .complete 31109,1 --40/40 Shek'zeer Mantid Slain
    .mob Shek'zeer Bladesworn
    .mob Shek'zeer Manipulator
    .mob Shek'zeer Needler
step
    .isOnQuest 31487
    #completewith VessGuardNakalSlain
    >>击杀|cRXP_ENEMY_惊怖恐虫|r和|cRXP_ENEMY_Shek'zeer Manipulator|r
    *|cRXP_WARN_Use the|r |T458772:0|t[Sonic Disruption Tool] |cRXP_WARN_near |cRXP_ENEMY_Dread Kunchong|r to weaken them and make them attack the |cRXP_ENEMY_Shek'zeer Manipulator|r|r
    .complete 31487,1 --4/4 Dread Kunchong slain
    .complete 31487,2 --6/6 Shek'zeer Manipulator slain
    .mob Dread Kunchong
    .mob Shek'zeer Manipulator
step
    .isOnQuest 31503
    #label VessGuardNakalSlain
    .goto 422,39.24,31.37
    >>击杀|cRXP_ENEMY_Vess-Guard Na'kal|r
    .complete 31503,1 --1/1 Vess-Guard Na'kal slain
    .mob Vess-Guard Na'kal
step
    .isOnQuest 31502
    #completewith FeederA
    >>击杀|cRXP_ENEMY_Shek'zeer Needler|r. 击败后可获得 |T237143:0|t[|cRXP_LOOT_Needler Wing|r] 战利品
    .complete 31502,1 --24/24 Needler Wing
    .mob Shek'zeer Needler
step
    .isOnQuest 31496
    #hidewindow
    #label FeederB
    .complete 31496,2 --1/1 East Feeder
    .complete 31496,3 --1/1 North Feeder
    .complete 31496,1 --1/1 Central Feeder
    .complete 31496,4 --1/1 Northeast Feeder
step
    .isOnQuest 31496
    #completewith next
    #label EastFeeder
    #hidewindow
    .complete 31496,2 --1/1 East Feeder
step
    #title 进入房屋
    #completewith EastFeeder
    .goto 422,38.29,31.95,6 >>进入房屋
step
    .isOnQuest 31496
    #requires EastFeeder
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_East Feeder|r 或使用 |T134772:0|t[树脂罐]
    .goto 422,37.85,33.06
    .use 87400
    .complete 31496,2 --1/1 East Feeder
step
    --PRMK: Is there no better way?
    .isOnQuest 31496
    #title Leave House
    .goto 422,38.29,31.95,6 >>离开这所房子
step
    .isOnQuest 31496
    #completewith next
    #label NorthFeeder
    #hidewindow
    .complete 31496,3 --1/1 North Feeder
step
    #title 进入房屋
    #completewith NorthFeeder
    .goto 422,36.25,32.26,6 >>进入房屋
step
    .isOnQuest 31496
    #requires NorthFeeder
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_North Feeder|r 或使用 |T134772:0|t[树脂罐]
    .goto 422,37.03,32.83
    .use 87400
    .complete 31496,3 --1/1 North Feeder
step
    .isOnQuest 31496
    #title Leave House
    .goto 422,36.25,32.26,6 >>离开这所房子
step
    .isOnQuest 31496
    #completewith next
    #label CentralFeeder
    #hidewindow
    .complete 31496,1 --1/1 Central Feeder
step
    #title 进入房屋
    #completewith CentralFeeder
    .goto 422,37.03,28.07,6 >>进入房屋
step
    .isOnQuest 31496
    #requires CentralFeeder
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Central Feeder|r 或使用 |T134772:0|t[树脂罐]
    .goto 422,37.40,29.24
    .use 87400
    .complete 31496,1 --1/1 Central Feeder
step
    .isOnQuest 31496
    #title Leave House
    .goto 422,37.03,28.07,6 >>离开这所房子
step
    .isOnQuest 31496
    #completewith next
    #label NortheastFeeder
    #hidewindow
    .complete 31496,4 --1/1 Northeast Feeder
step
    #title 进入房屋
    #completewith NortheastFeeder
    .goto 422,39.35,29.24,6 >>进入房屋
step
    .isOnQuest 31496
    #requires NortheastFeeder
    #label FeederA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Northeast Feeder|r或使用 |T134772:0|t[树脂罐]
    .goto 422,39.04,30.47
    .use 87400
    .complete 31496,4 --1/1 Northeast Feeder
step
    .isOnQuest 31502
    #loop
    .goto 422,40.10,31.25,35,0
    .goto 422,33.92,30.95,35,0
    .goto 422,38.50,28.84,35,0
    >>击杀|cRXP_ENEMY_Shek'zeer Needler|r. 击败后可获得 |T237143:0|t[|cRXP_LOOT_Needler Wing|r] 战利品
    .complete 31502,1 --24/24 Needler Wing
    .mob Shek'zeer Needler
step
    .isOnQuest 31487
    #label DreadKunchongShekzeerManipulator
    #loop
    .goto 422,43.38,31.81,50,0
    .goto 422,49.86,25.29,50,0
    .goto 422,48.41,36.73,50,0
    >>击杀|cRXP_ENEMY_惊怖恐虫|r和|cRXP_ENEMY_Shek'zeer Manipulator|r
    *|cRXP_WARN_Use the|r |T458772:0|t[Sonic Disruption Tool] |cRXP_WARN_near |cRXP_ENEMY_Dread Kunchong|r to weaken them and make them attack the |cRXP_ENEMY_Shek'zeer Manipulator|r|r
    .complete 31487,1 --4/4 Dread Kunchong slain
    .complete 31487,2 --6/6 Shek'zeer Manipulator slain
    .mob Dread Kunchong
    .mob Shek'zeer Manipulator
step
    .isOnQuest 31109
    #loop
    .goto 422,34.59,30.45,40,0
    .goto 422,50.40,23.56,50,0
    .goto 422,48.40,36.80,45,0
    >>击杀|cRXP_ENEMY_Shek'zeer Mantid|r
    .complete 31109,1 --40/40 Shek'zeer Mantid Slain
    .mob Shek'zeer Bladesworn
    .mob Shek'zeer Manipulator
    .mob Shek'zeer Needler
step
    .isOnQuest 31233
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|tClick on |cRXP_PICK_Amber Taps|r |cRXP_WARN_found on trees|r. Afterwards |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Amber Pot|r below the tap.
    .complete 31233,1 --6/6 Amber Sap
step
    .isOnQuest 31234
    >>击杀|cRXP_ENEMY_泥泞兽|r. 击败它们后搜刮出|T237299:0|t[|cRXP_LOOT_泥泞兽信息囊|r]
    .complete 31234,1 --1/1 Pristine Mire Beast Eye
    .goto 422,67.35,36.63
    .mob Mire Beast
step
    #completewith DreadspinnerTenderSlain
    #hidewindow
    #loop
    .goto 422,66.22,29.08,40,0
    .goto 422,72.50,29.17,35,0
    .goto 422,71.46,22.47,40,0
    .goto 422,74.72,20.60,40,0
    +1
step
    .isOnQuest 31231
    #completewith GurhtaniTablets
    >>击杀|cRXP_ENEMY_恐惧织网小蜘蛛|r
    .complete 31231,1 --8/8 Dreadspinner Tender slain
    .mob Dreadspinner Tender
step
    .isOnQuest 31235
    #completewith GurhtaniTablets
    >>使用 |T133837:0|t[影踪派龙枪] 摧毁|cRXP_PICK_恐惧织网蛛的卵|r
    .complete 31235,1 --20/20 Dreadspinner Egg slain
    .use 82807
    .mob Dreadspinner Egg
step
    .isOnQuest 31232
    #label GurhtaniTablets
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_格萨尼石板|r
    .complete 31232,1 --8/8 Gurthani Tablet
step
    .isOnQuest 31231
    #completewith next
    >>击杀|cRXP_ENEMY_恐惧织网小蜘蛛|r
    .complete 31231,1 --8/8 Dreadspinner Tender slain
    .mob Dreadspinner Tender
step
    .isOnQuest 31235
    >>使用 |T133837:0|t[影踪派龙枪] 摧毁|cRXP_PICK_恐惧织网蛛的卵|r
    .complete 31235,1 --20/20 Dreadspinner Egg slain
    .use 82807
    .mob Dreadspinner Egg
step
    .isOnQuest 31231
    #label DreadspinnerTenderSlain
    >>击杀|cRXP_ENEMY_恐惧织网小蜘蛛|r
    .complete 31231,1 --8/8 Dreadspinner Tender slain
    .mob Dreadspinner Tender
step
    .isOnQuest 31238
    #completewith AmberSapA
    >>击杀|cRXP_ENEMY_阔背穆山兽|r和|cRXP_ENEMY_阔背幼兽|r. 击杀后从它们身上搜刮出 |T350575:0|t[|cRXP_LOOT_穆山兽之舌|r]
    .complete 31238,1 --4/4 Mushan Tongue
    .mob Greatback Mushan
    .mob Greatback Calf
step
    #completewith next
    #hidewindow
    --.goto 422,69.71,17.14,0
    --.goto 422,68.07,17.10,0
    --.goto 422,67.51,20.31,0
    --.goto 422,67.24,19.92,0
    --.goto 422,66.24,17.56,0
    --.goto 422,65.61,17.81,0
    --.goto 422,65.53,21.69,0
    --.goto 422,66.23,24.31,0
    --.goto 422,63.92,19.48,0
    --.goto 422,66.13,26.99,0
    --.goto 422,71.14,30.27,0
    --.goto 422,73.36,31.55,0
    --.goto 422,71.16,24.12,0
    --.goto 422,65.06,32.14,0
    --.goto 422,65.82,34.00,0
    --.goto 422,68.33,33.99,0
    --.goto 422,69.65,34.20,0
    --.goto 422,69.37,32.31,0
    --.goto 422,66.53,39.27,0
    --.goto 422,65.62,38.33,0
    --.goto 422,64.76,41.82,0
    --.goto 422,64.38,42.00,0
    --.goto 422,65.88,44.49,0
    --.goto 422,66.13,44.80,0
    --.goto 422,66.58,43.75,0
    --.goto 422,67.49,43.83,0
    --.goto 422,67.38,42.65,0
    +1
step
    #label AmberSapA
    .isOnQuest 31233
    #loop
    .goto 422,69.70,17.03,15,0
    .goto 422,68.12,17.09,15,0
    .goto 422,65.82,17.69,15,0
    .goto 422,63.89,19.55,15,0
    .goto 422,65.52,21.68,15,0
    .goto 422,66.26,24.31,15,0
    .goto 422,66.14,26.92,15,0
    .goto 422,65.06,32.36,15,0
    .goto 422,65.81,34.08,15,0
    .goto 422,65.61,38.37,15,0
    .goto 422,64.56,41.99,15,0
    .goto 422,66.28,43.33,15,0
    .goto 422,65.99,44.77,15,0
    .goto 422,67.49,43.81,15,0
    .goto 422,68.09,40.08,15,0
    .goto 422,66.51,39.17,15,0
    .goto 422,70.31,37.98,15,0
    .goto 422,69.65,34.21,15,0
    .goto 422,71.13,30.23,15,0
    .goto 422,72.21,30.65,15,0
    .goto 422,73.35,31.56,15,0
    .goto 422,73.83,28.74,15,0
    .goto 422,71.13,24.09,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|tClick on |cRXP_PICK_Amber Taps|r |cRXP_WARN_found on trees|r. Afterwards |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Amber Pot|r below the tap.
    .complete 31233,1 --6/6 Amber Sap
step
    .isOnQuest 31238
    #loop
    .goto 422,59.88,22.23,55,0
    .goto 422,63.44,20.32,55,0
    .goto 422,67.03,20.71,45,0
    .goto 422,62.41,25.75,45,0
    .goto 422,50.10,29.42,45,0
    >>击杀|cRXP_ENEMY_阔背穆山兽|r和|cRXP_ENEMY_阔背幼兽|r. 击杀后从它们身上搜刮出 |T350575:0|t[|cRXP_LOOT_穆山兽之舌|r]
    .complete 31238,1 --4/4 Mushan Tongue
    .mob Greatback Mushan
    .mob Greatback Calf
step
    .isOnQuest 31231
    .goto 422,55.06,35.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kil'ruk the Wind-Reaver|r交谈
    .dailyturnin 31231 >>提交根除恐惧织网蛛任务
    .target Kil'ruk the Wind-Reaver
step
    .isOnQuest 31235
    .goto 422,55.06,35.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kil'ruk the Wind-Reaver|r交谈
    .dailyturnin 31235 >>交任务: |cRXP_FRIENDLY_绝不|r Nope Nope
    .target Kil'ruk the Wind-Reaver
step
    .isOnQuest 31234
    .goto 422,54.37,35.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rik'kal the Dissector|r交谈
    .dailyturnin 31234 >>提交“完美的信息”
    .target Rik'kal the Dissector
step
    .isOnQuest 31233
    .goto 422,54.31,36.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
    .dailyturnin 31233 >>提交采集树脂任务
    .target Korven the Prime
step
    .isOnQuest 31232
    .goto 422,54.31,36.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
    .dailyturnin 31232 >>提交远古帝国
    .target Korven the Prime
step
    .isOnQuest 31238
    .goto 422,54.25,35.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kaz'tik the Manipulator|r交谈
    .dailyturnin 31238 >>提交健脑食品
    .target Kaz'tik the Manipulator
step
    .isOnQuest 31487
    .goto 422,54.26,35.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kaz'tik the Manipulator|r交谈
    .dailyturnin 31487 >>提交“声波干扰”
    .target Kaz'tik the Manipulator
step
    .isOnQuest 31494
    .goto 422,54.26,35.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kaz'tik the Manipulator|r交谈
    .dailyturnin 31494 >>交还逃出虫巢
    .target Kaz'tik the Manipulator
step
    .isOnQuest 31808
    .goto 422,54.25,35.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kaz'tik the Manipulator|r交谈
    .dailyturnin 31808 >>交任务: |cRXP_FRIENDLY_狂暴|r Against the Machine
    .target Kaz'tik the Manipulator
step
    .isOnQuest 31502
    .goto 422,54.37,35.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rik'kal the Dissector|r交谈
    .dailyturnin 31502 >>提交摔绊
    .target Rik'kal the Dissector
step
    .isOnQuest 31503
    .goto 422,54.37,35.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rik'kal the Dissector|r交谈
    .dailyturnin 31503 >>交还“欲速则不达”
    .target Rik'kal the Dissector
step
    .isOnQuest 31496
    .goto 422,54.30,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
    .dailyturnin 31496 >>提交“帝国精华采样”
    .target Korven the Prime
step
    .isOnQuest 31109
    .goto 422,55.06,35.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kil'ruk the Wind-Reaver|r交谈
    .dailyturnin 31109 >>提交“血洗虫群”
    .target Kil'ruk the Wind-Reaver
]])

--August Celestial Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name AC) 至尊天神日常任务
#displayname |cFF1EFF003|r - 至尊天神 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#title August Celestial Daillies
#next ad) 统御岗哨日常任务


--Jade Forest
-- step
--     .accept 30066 >>接任务: |cRXP_WARN_隐藏的力量|r
--     .accept 30065 >>接任务: |cRXP_WARN_命运之箭|r
--     .target +Elder Sage Tai-Feng
--     .accept 30063 >>接任务: |cRXP_WARN_面具背后|r
--     .accept 30064 >>接任务: |cRXP_WARN_抢救经书|r
--     .target +Elder Sage Storm-Sing
step
    .areapoiexists 371,7734,7735,7736,7737
    #loop
    .goto 371,53.90,61.96,10,0
    .goto 371,53.8,61.8,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r和|r大贤者吟云|r交谈
    .questcount <4,30066,30065,30063,30064  >>|cRXP_WARN_完成所有日常任务|r
step
    .goto 371,53.8,61.8
    .reputation 1269,revered,<0,1
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .accept 30006 >>接任务: |cRXP_WARN_黑暗缠身|r
step
    #hidewindow
    #completewith AugustLoop1
    #label startaugustjade
    #loop
    .goto 371,53.6,54.06,40,0
    .goto 371,56.3,51.04,40,0
    .goto 371,56.1,53.41,40,0
    .goto 371,55.16,57.24,40,0
    +1
step
    #completewith Ancient Mantras
    .isOnQuest 30006
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_终极之疑|r
    .complete 30006,1 --15/15 Sha invaders slain
    .mob Lingering Doubt
    .mob Final Doubt
step
    #completewith Ancient Mantras
    .isOnQuest 30063
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终之疑|r, 击败后可掉落 [|cRXP_LOOT_怀疑面具|r]
    .complete 30063,1 --8/8 Mask of Doubt
    .mob Lingering Doubt
    .mob Final Doubt
step
    #completewith Ancient Mantras
    .isOnQuest 30065
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Arrows|r
    .complete 30065,1 --8/8 Defender's Arrow
step
    #completewith Ancient Mantras
    .isOnQuest 30064
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Books|r
    .complete 30064,1 --6/6 Ancient Sutra
step
    .isOnQuest 30066
    #label Ancient Mantras
    >>与|cRXP_FRIENDLY_Yu'lon Adept|r和|cRXP_FRIENDLY_Yu'lon Guardian|r互动, 以交付咒语
    .complete 30066,1 --6/6 Ancient Mantras delivered
    .use 77475
    .target Yu'lon Adept
    .target Yu'lon Guardian
step
    #completewith Defender's Arrow
    .isOnQuest 30006
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终疑虑|r
    .complete 30006,1 --15/15 Sha invaders slain
    .mob Lingering Doubt
    .mob Final Doubt
step
    #completewith Defender's Arrow
    .isOnQuest 30063
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终之疑|r, 击败后可掉落 [|cRXP_LOOT_怀疑面具|r]
    .complete 30063,1 --8/8 Mask of Doubt
    .mob Lingering Doubt
    .mob Final Doubt
step
    #label Defender's Arrow
    .isOnQuest 30065
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Arrows|r
    .complete 30065,1 --8/8 Defender's Arrow
step
    #completewith Ancient Sutra
    .isOnQuest 30006
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_终极之疑|r
    .complete 30006,1 --15/15 Sha invaders slain
    .mob Lingering Doubt
    .mob Final Doubt
step
    #completewith Ancient Sutra
    .isOnQuest 30063
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终之疑|r, 击败后可掉落 [|cRXP_LOOT_怀疑面具|r]
    .complete 30063,1 --8/8 Mask of Doubt
    .mob Lingering Doubt
    .mob Final Doubt
step
    #label Ancient Sutra
    .isOnQuest 30064
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Books|r
    .complete 30064,1 --6/6 Ancient Sutra
step
    #completewith next
    .isOnQuest 30063
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终之疑|r, 击败后可掉落 [|cRXP_LOOT_怀疑面具|r]
    .complete 30063,1 --8/8 Mask of Doubt
    .mob Lingering Doubt
    .mob Final Doubt
step
    .isOnQuest 30006
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_终极之疑|r
    .complete 30006,1 --15/15 Sha invaders slain
    .mob Lingering Doubt
    .mob Final Doubt
step
    #label AugustLoop1
    .isOnQuest 30063
    >>击杀|cRXP_ENEMY_徘徊之疑|r和|cRXP_ENEMY_最终之疑|r, 击败后可掉落 [|cRXP_LOOT_怀疑面具|r]
    .complete 30063,1 --8/8 Mask of Doubt
    .mob Lingering Doubt
    .mob Final Doubt
step
    .reputation 1269,revered,<0,1
    .goto 371,53.90,61.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .dailyturnin 30006 >>交任务: |cRXP_FRIENDLY_黑暗之兽|r Around Us
    .target Elder Sage Tai-Feng
step
    .isOnQuest 30066
    .goto 371,53.90,61.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .dailyturnin 30066 >>提交隐藏的力量
    .target Elder Sage Tai-Feng
step
    .isOnQuest 30065
    .goto 371,53.90,61.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .dailyturnin 30065 >>交还命运之箭
    .target Elder Sage Tai-Feng
step
    .isOnQuest 30064
    .goto 371,53.8,61.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者吟云|r谈话
    .dailyturnin 30064 >>交还抢救经书
    .target Elder Sage Storm-Sing
step
    .areapoiexists 371,7734,7735,7736,7737
    .goto 371,53.90,61.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .accept 30067 >>接任务: |cRXP_WARN_疑之影|r
    .accept 30068 >>接任务: |cRXP_WARN_虚无之火|r
    .target Elder Sage Tai-Feng
step
    .isOnQuest 30067
    .goto 371,57.53,62.26
    >>击杀|cRXP_ENEMY_怀疑之影|r
    .complete 30067,1 --1/1 Shadow of Doubt slain
    .mob Shadow of Doubt
step
    .isOnQuest 30068
    #completewith next
    .goto 371,54.13,60.87
    .vehicle >>与|cRXP_FRIENDLY_作战翔龙|r互动
    .target War Serpent
step
    .isOnQuest 30068
    #loop
    .goto 371,52.32,57.21,30,0
    .goto 371,53.95,57.25,30,0
    .goto 371,52.87,55.57,30,0
    .goto 371,54.45,55.66,30,0
    .goto 371,54.27,53.43,30,0
    .goto 371,54.62,52.25,30,0
    .goto 371,55.75,52.3,30,0
    .goto 371,55.07,53.91,30,0
    >>飞近水池获取水源, 然后对冒烟的虚空裂隙使用|cRXP_WARN_(1)|r|T135975:0|t[水炮]. 重复此操作
    .complete 30068,1 --6/6 Void Flames doused
step
    .isOnQuest 30067
    .goto 371,53.91,61.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .dailyturnin 30067 >>提交“疑之影”
    .target Elder Sage Tai-Feng
step
    .isOnQuest 30068
    #label endaugustjade
    .goto 371,53.91,61.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者泰峰|r交谈
    .dailyturnin 30068 >>交还虚无之火
    .target Elder Sage Tai-Feng
--Kun-Lai
step << Alliance
    #label startaugustkunlai
    .isQuestAvailable 31394
    .goto 379,68.78,43.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .accept 31394 >>接任务: |cRXP_WARN_神圣体验|r
    .target Anduin Wrynn
step << Horde
    .isQuestAvailable 31395
    .goto 379,68.73,43.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
    .accept 31395 >>接任务: |cRXP_WARN_神圣体验|r
    .target Sunwalker Dezco
step << Alliance
    .isOnQuest 31394
    .goto 379,68.87,42.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .complete 31394,1 --1/1 Speak to Xuen
    .timer 55,RP
    .target Xuen
step << Alliance
    .isOnQuest 31394
    .goto 379,68.79,43.99
    -- #loop
    -- .goto 379,68.79,43.99,5,0
    -- .goto 379,68.81,43.69,5,0
    >>击杀|cRXP_ENEMY_暴虐之灵|r|cRXP_WARN_角色扮演结束后. |r
    .complete 31394,2 --1/1 Pass the First Test
    .mob Spirit of Violence
step << Alliance
    .isOnQuest 31394
    .goto 379,68.79,43.99
    -- #loop
    -- .goto 379,68.79,43.99,5,0
    -- .goto 379,68.81,43.69,5,0
    >>击杀|cRXP_ENEMY_愤怒之灵|r|cRXP_WARN_角色扮演结束后|r
    .complete 31394,3 --1/1 Pass the Second Test
    .mob Spirit of Anger
step
    .convertquest 31394,31395 <<Horde
    .isOnQuest 31394,31395
    .goto 379,68.79,43.99
    -- #loop
    -- .goto 379,68.79,43.99,5,0
    -- .goto 379,68.81,43.69,5,0
    >>击杀|cRXP_ENEMY_怨恨之灵|r |cRXP_WARN_剧情演出后|r
    .complete 31394,4 --1/1 Pass the Third Test
    .mob Spirit of Hatred
step << Alliance
    .goto 379,68.78,43.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .turnin 31394 >>交任务: |cRXP_FRIENDLY_神圣体验|r
    .target Anduin Wrynn
step << Horde
    .goto 379,68.73,43.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
    .turnin 31395 >>交任务: |cRXP_FRIENDLY_神圣体验|r
    .target Sunwalker Dezco
step << Alliance
    .isQuestTurnedIn 31394
    .goto 379,68.78,43.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .target Anduin Wrynn
    .accept 31512 >>接任务: |cRXP_WARN_历史见证|r
step << Horde
    .isQuestTurnedIn 31395
    .goto 379,68.73,43.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
    .target Sunwalker Dezco
    .accept 31511 >>接任务: |cRXP_WARN_历史见证|r
step << Alliance
    .isOnQuest 31512
    .goto 379,55.10,91.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安杜因|r在 august celestial 之门交谈
    .complete 31512,1 --1/1 Speak to Anduin at the Gate of the August Celestials
    .skipgossip
    .target Anduin
step << Horde
    .goto 379,56.18,91.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dezco|r交谈, 地点在八月天神之门
    .complete 31511,1 --1/1 Speak with Dezco at the Gate of the August Celestials
    .skipgossip
    .target Dezco at the Gate of the August Celestials
step << Alliance
    .isOnQuest 31512
    .goto 393,36.20,66.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦妮阿姨|r交谈
    .turnin 31512 >>交任务: |cRXP_FRIENDLY_历史见证|r
    .target Matron Vi Vinh
step << Horde
    #completewith next
    .goto 391,77.48,71.91,10 >>进入双月神殿
step << Horde
    .goto 391,68.38,47.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与薇洛夫人交谈|cRXP_FRIENDLY_薇洛夫人|r
    .turnin 31511 >>交任务: |cRXP_FRIENDLY_历史见证|r
    .target Madam Vee Luo
step
    .areapoiexists 379,7734,7735,7736,7737
    .goto 379,67.24,55.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .target Xuen
    -- .daily 31517,31492 >>接任务: |cRXP_WARN_与恶霸抗争|r
    .daily 31517 >>接任务: |cRXP_WARN_与恶霸抗争|r
    .daily 30879,30880 >>接任务: |cRXP_WARN_第1回合：酒仙倩妮|r
step
    .isOnQuest 31517
    .goto 379,71.09,55.93
    >>击杀|cRXP_ENEMY_烁奴夫|r
    .complete 31517,1 --1/1 Shonuf slain
    .mob Shonuf
step
    .isOnQuest 30879
    .goto 379,70.96,51.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_酒仙倩妮|r交谈
    .complete 30879,1 --1/1 Defeat Brewmaster Chani
    .skipgossip
    .target Brewmaster Chani
    .mob Brewmaster Chani
step
    .isOnQuest 30880
    .goto 379,70.81,51.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽春|r交谈
    .complete 30880,1 --1/1 Defeat Lun-Chi
    .skipgossip
    .target Lun-Chi
    .mob Lun-Chi
step
    .isOnQuest 30879
    .goto 379,70.3,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 30879 >>交任务: |cRXP_FRIENDLY_第1回合：酒仙倩妮|r
    .target Xuen
step
    .isOnQuest 31517
    .goto 379,70.3,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 31517 >>交任务: |cRXP_FRIENDLY_与恶霸抗争|r
    .target Xuen
step
    .isOnQuest 30880
    .goto 379,70.41,51.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 30880 >>交任务：第1回合·街头霸王
    .target Xuen
step
    .goto 379,70.28,51.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .daily 30881,30882 >>接任务: |cRXP_WARN_第2回合：聪明的阿西约和肯肯|r
    .target Xuen
step
    .isOnQuest 30881
    .goto 379,71.67,45.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_聪明的阿西约|r交谈, 然后击败他
    .complete 30881,2 --1/1 Defeat Ken-Ken
    .complete 30881,1 --1/1 Defeat Clever Ashyo
    .skipgossip
    .target Clever Ashyo
    .mob Clever Ashyo
    .mob Ken-Ken
step
    .isOnQuest 30882
    .goto 379,71.61,45.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈, 然后击败他
    .complete 30882,1 --1/1 Defeat Kang Bramblestaff
    .target Kang Bramblestaff
    .mob Kang Bramblestaff
step
    .isOnQuest 30881
    .goto 379,71.76,44.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 30881,30882 >>交任务: |cRXP_FRIENDLY_第2回合：聪明的阿西约和肯肯|r or Round 2: Kang Bramblestaff
    .target Xuen
 step
    .goto 379,71.76,44.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .target Xuen
    .daily 30883,30885 >>接任务: |cRXP_WARN_第3回合：摔跤手|r
step
    .isOnQuest 30883
    .goto 379,71.53,45.95,10,0
    .goto 379,66.74,46.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摔跤手|r交谈并击败他
    .complete 30883,1 --1/1 Defeat The Wrestler
    .skipgossip
    .target The Wrestler
    .mob The Wrestler
step
    .isOnQuest 30885
    .goto 379,66.61,46.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布姆布姆大师|r交谈并击败他
    .complete 30885,1 --1/1 Defeat Master Boom Boom
    .target Master Boom Boom
    .mob Master Boom Boom
step
    .isOnQuest 30883
    .goto 379,66.39,46.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 30883,30885 >>交任务: |cRXP_FRIENDLY_第3回合：摔跤手|r or Round 3: Master Boom Boom
    .target Xuen
step
    .goto 379,66.39,46.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .target Xuen
    .daily 30907,30902 >>接任务: |cRXP_WARN_第4回合：以一敌三|r
step
    .isOnQuest 30907
    .goto 379,67.15,46.79,10,0
    .goto 379,68.66,45.71,10,0
    .goto 379,69.02,43.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希利斯|r对话, 然后击败他们
    .complete 30907,3 --1/1 Defeat Tankiss
    .complete 30907,1 --1/1 Defeat Hackiss
    .complete 30907,2 --1/1 Defeat Healiss
    .skipgossip
    .target Healiss
    .mob Hackiss
    .mob Healiss
    .mob Tankiss
step
    .isOnQuest 30902
    .goto 379,68.81,43.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风裘大师|r交谈, 然后击败他
    .complete 30902,1 --1/1 Defeat Master Windfur
    .target Master Windfur
    .mob Master Windfur
step
    #label endaugustkunlai
    .isOnQuest 30907
    .goto 379,68.49,44.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雪怒|r 交谈
    .dailyturnin 30907,30902 >>交任务: |cRXP_FRIENDLY_第4回合：以一敌三|r or Round 4: Master Windfur
    .target Xuen
--Townlong
step
    #label startaugusttownlong
    .areapoiexists 388,7734,7735,7736,7737
    #loop
    .goto 388,38.90,62.75,10,0
    .goto 388,39.33,62.22,10,0
    .goto 388,39.14,62.05,10,0
    .goto 388,39.40,61.98,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_高阶助祭包裟|r和|cRXP_FRIENDLY_小傲古|r和|cRXP_FRIENDLY_牦牛倌雅楠|r和|cRXP_FRIENDLY_哨兵指挥官奇磐|r和|cRXP_FRIENDLY_老傲古|r
    .questcount <4,30955,30954,30953,30957,30956,30952,30959,30958  >>|cRXP_WARN_完成所有日常任务|r
    .target High Adept Paosha
    .target Ogo the Younger
    .target Yak-Keeper Kyana
    .target Sentinel Commander Qipan
    .target Ogo the Elder
step
    #hidewindow
    #completewith Pot of Fire
    #loop
    +1
    .goto 388,42.55,61.38,30,0
    .goto 388,43.2,62.23,30,0
    .goto 388,41.81,60.47,30,0
    .goto 388,41.98,57.45,30,0
    .goto 388,41.08,59,30,0
    .goto 388,39.81,57.03,30,0
    .goto 388,38.5,59.78,30,0
    .goto 388,40.04,60.15,30,0
    .goto 388,40.58,62.05,30,0
step
    #completewith 1
    .isOnQuest 30952
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30952,1 --12/12 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 1
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 1
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #completewith 1
    .isOnQuest 30955
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_砈皂 食物补给|r
    .complete 30955,1 --6/6 Gather Food for Niuzao
step
    #completewith 1
    .isOnQuest 30957
    >>击杀|cRXP_ENEMY_Sra'thik Kunchongs|r
    .complete 30957,1 --4/4 Sra'thik Kunchong slain
    .mob Sra'thik Kunchong
step
    #completewith 1
    .isOnQuest 30953
    >>使用 |T135975:0|t[牦牛奶瓶]作用于|cRXP_FRIENDLY_受伤的砮皂哨兵|r
    .complete 30953,1 --8/8 Niuzao Sentinel healed
    .target Wounded Niuzao Sentinel
    .use 82381
step
    #completewith 1
    .isOnQuest 30958
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bricks|r
    .complete 30958,1 --10/10 Loose Brick
step
    #label 1
    .isOnQuest 30959
    >>在|r上使用|T135975:0|t[火罐]
    .complete 30959,1 --3/3 Sra'thik War Wagon exploded
    .mob Sra'thik War Wagon
    .use 82346
step
    #completewith 2
    .isOnQuest 30952
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30952,1 --12/12 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 2
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 2
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #completewith 2
    .isOnQuest 30955
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_砈皂 食物补给|r
    .complete 30955,1 --6/6 Gather Food for Niuzao
step
    #completewith 2
    .isOnQuest 30957
    >>击杀|cRXP_ENEMY_Sra'thik Kunchongs|r
    .complete 30957,1 --4/4 Sra'thik Kunchong slain
    .mob Sra'thik Kunchong
step
    #completewith 2
    .isOnQuest 30953
    >>使用 |T135975:0|t[牦牛奶瓶]作用于|cRXP_FRIENDLY_受伤的砮皂哨兵|r
    .complete 30953,1 --8/8 Niuzao Sentinel healed
    .target Wounded Niuzao Sentinel
    .use 82381
step
    #label 2
    .isOnQuest 30958
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bricks|r
    .complete 30958,1 --10/10 Loose Brick
step
    #completewith 3
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 3
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #completewith 3
    .isOnQuest 30955
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_砈皂 食物补给|r
    .complete 30955,1 --6/6 Gather Food for Niuzao
step
    #completewith 3
    .isOnQuest 30957
    >>击杀|cRXP_ENEMY_Sra'thik Kunchongs|r
    .complete 30957,1 --4/4 Sra'thik Kunchong slain
    .mob Sra'thik Kunchong
step
    #label 3
    .isOnQuest 30953
    >>使用 |T135975:0|t[牦牛奶瓶]作用于|cRXP_FRIENDLY_受伤的砮皂哨兵|r
    .complete 30953,1 --8/8 Niuzao Sentinel healed
    .target Wounded Niuzao Sentinel
    .use 82381
step
    #completewith 4
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 4
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #completewith 4
    .isOnQuest 30955
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_砈皂 食物补给|r
    .complete 30955,1 --6/6 Gather Food for Niuzao
step
    #label 4
    .isOnQuest 30957
    >>击杀|cRXP_ENEMY_Sra'thik Kunchongs|r
    .complete 30957,1 --4/4 Sra'thik Kunchong slain
    .mob Sra'thik Kunchong
step
    #completewith 5
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    #completewith 5
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #label 5
    .isOnQuest 30955
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_砈皂 食物补给|r
    .complete 30955,1 --6/6 Gather Food for Niuzao
step
    #completewith next
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    .isOnQuest 30954
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器|r
    .complete 30954,1 --10/10 Sra'thik Weapon
step
    #label Pot of Fire
    .isOnQuest 30956
    >>击杀|cRXP_ENEMY_Sra'thik 战呼者|r和|cRXP_ENEMY_Sra'thik 迅爪者|r
    .complete 30956,1 --25/25 Sra'thik attacker slain
    .mob Sra'thik Warcaller
    .mob Sra'thik Swiftclaw
step
    .isOnQuest 30953
    .goto 388,39.16,62.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_牦牛倌雅楠|r交谈
    .dailyturnin 30953 >>交任务: |cRXP_FRIENDLY_虚弱的戒卫|r
    .target Yak-Keeper Kyana
step
    .isOnQuest 30958
    .goto 388,39.16,62.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_牦牛倌雅楠|r交谈
    .dailyturnin 30958 >>交任务: |cRXP_FRIENDLY_战争的阴影|r
    .target Yak-Keeper Kyana
step
    .isOnQuest 30955
    .goto 388,38.91,62.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶助祭包裟|r交谈
    .dailyturnin 30955 >>交任务: |cRXP_FRIENDLY_进贡|r
    .target High Adept Paosha
step
    .isOnQuest 30954
    .goto 388,39.33,62.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_小傲古|r 交谈
    .dailyturnin 30954 >>交任务: |cRXP_FRIENDLY_敌人的刀也是刀|r
    .target Ogo the Younger
step
    .isOnQuest 30959
    .goto 388,39.33,62.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_小傲古|r 交谈
    .dailyturnin 30959 >>交任务: |cRXP_FRIENDLY_摧毁战车|r
    .target Ogo the Younger
step
    .isOnQuest 30952
    .goto 388,39.2,62.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老傲古|r交谈
    .dailyturnin 30952 >>交任务: |cRXP_FRIENDLY_无休止的围攻|r
    .target Ogo the Elder
step
    .isOnQuest 30956
    .goto 388,39.2,62.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老傲古|r交谈
    .dailyturnin 30956 >>交任务: |cRXP_FRIENDLY_重重包围|r
    .target Ogo the Elder
step
    #label endaugusttownlong
    .isOnQuest 30957
    .goto 388,39.41,61.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵指挥官奇磐|r交谈
    .dailyturnin 30957 >>交任务: |cRXP_FRIENDLY_蜂拥而至|r
    .target Sentinel Commander Qipan
--Krasarang
step
    #label startaugustkrasa
    .areapoiexists 418,7734,7735,7736,7737
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r和|cRXP_FRIENDLY_郭楠·翎爪|r和|cRXP_FRIENDLY_燕·翎爪|r交谈
    .daily 30718 >>接任务: |cRXP_WARN_赤精的弟子们|r
    .goto 418,31.35,63.44
    .target +Thelonius
    .daily 30716 >>接任务: |cRXP_WARN_追赶希望|r
    .goto 418,31.14,63.56
    .target +Kuo-Na Quillpaw
    .daily 30717 >>接任务: |cRXP_WARN_神鹤的恩赐|r
    .goto 418,31.52,63.75
    .target +Yan Quillpaw
step
    #hidewindow
    #completewith Gift of the Great Crane
    #loop
    .goto 418,30.61,66.15,40,0
    .goto 418,30.4,68.7,40,0
    .goto 418,30.12,71.67,40,0
    .goto 418,30.79,76.26,40,0
    .goto 418,32.65,76.13,40,0
    .goto 418,33.65,79.76,40,0
    .goto 418,35.98,78.81,40,0
    .goto 418,36.35,73.26,40,0
    .goto 418,33.87,69.19,40,0
    +1
step
    .isOnQuest 30717
    #completewith Spirit of the Crane found
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Feathers|r
    .complete 30717,1 --10/10 Gift of the Great Crane
step
    .isOnQuest 30718
    #completewith Spirit of the Crane found
    >>击杀|cRXP_ENEMY_赤精的弟子|r
    .complete 30718,1 --10/10 Student of Chi-Ji dueled
    .mob Student of Chi-Ji
step
    .isOnQuest 30716
    #label Spirit of the Crane found
    >>这个区域有幽灵鹤游荡；靠近它们
    .complete 30716,1 --3/3 Spirit of the Crane found
step
    .isOnQuest 30717
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Feathers|r
    .complete 30717,1 --10/10 Gift of the Great Crane
step
    .isOnQuest 30718
    >>击杀|cRXP_ENEMY_赤精的弟子|r
    .complete 30718,1 --10/10 Student of Chi-Ji dueled
    .mob Student of Chi-Ji
step
    .isOnQuest 30717
    #label Gift of the Great Crane
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Feathers|r
    .complete 30717,1 --10/10 Gift of the Great Crane
step
    .isOnQuest 30718,30716,30717
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r和|cRXP_FRIENDLY_郭楠·翎爪|r和|cRXP_FRIENDLY_燕·翎爪|r交谈
    .dailyturnin 30718 >>交予赤精的弟子们
    .target +Thelonius
    .dailyturnin 30716 >>交还“追赶希望”
    .target +Kuo-Na Quillpaw
    .dailyturnin 30717 >>交还神鹤的恩赐
    .target +Yan Quillpaw
step
    .areapoiexists 418,7734,7735,7736,7737
    .goto 418,31.34,63.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .daily 30725,30725,30728,30729,30730,30731,30732,30733,30734,30735,30736,30737,30738,30739
    -- .accept 30725 >>接任务: |cRXP_WARN_艾黎亚·鸦鬃|r
    -- .accept 30728 >>接任务: |cRXP_WARN_[Fat Long-Fat]|r
    -- .accept 30729 >>接任务: |cRXP_WARN_茱莉亚·贝茨|r
    -- .accept 30730 >>接任务: |cRXP_WARN_[Dextrous Izissha]|r
    -- .accept 30731 >>接任务: |cRXP_WARN_郭楠·翎爪|r
    -- .accept 30732 >>接任务: |cRXP_WARN_艾黎亚·鸦鬃：复仇|r
    -- .accept 30733 >>接任务: |cRXP_WARN_图卡图克|r
    -- .accept 30734 >>接任务: |cRXP_WARN_哈克·独轮|r
    -- .accept 30735 >>接任务: |cRXP_WARN_米德尔·日语者|r
    -- .accept 30736 >>接任务: |cRXP_WARN_燕·翎爪|r
    -- .accept 30737 >>接任务: |cRXP_WARN_肥龙：重赛|r
    -- .accept 30738 >>接任务: |cRXP_WARN_塞隆尼斯|r
    -- .accept 30739 >>接任务: |cRXP_WARN_艾黎亚·鸦鬃：救赎|r
    .target Thelonius
step
    .isOnQuest 30725
    .goto 418,31.8,71.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾黎亚·鸦鬃|r交谈, 并击杀|cRXP_ENEMY_艾黎亚·鸦鬃|r
    .complete 30725,1 --1/1 Ellia Ravenmane defeated
    .skipgossip
    .target Ellia Ravenmane
    .mob Ellia Ravenmane
step
    .isOnQuest 30728
    .goto 418,32.0,70.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肥龙|cRXP_FRIENDLY_肥龙|r交谈, 并击杀|r肥龙|cRXP_ENEMY_肥龙
    .complete 30728,1 --1/1 Fat Long-Fat defeated
    .skipgossip
    .target Fat Long-Fat
    .mob Fat Long-Fat
step
    .isOnQuest 30729
    .goto 418,28.8,75.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·贝茨|r交谈, 并击杀|cRXP_ENEMY_茱莉亚·贝茨|r
    .complete 30729,1 --1/1 Julia Bates defeated
    .skipgossip
    .target Julia Bates
    .mob Julia Bates
step
    .isOnQuest 30730
    .goto 418,31.6,80.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_敏捷的伊兹沙|r交谈, 并击杀|cRXP_ENEMY_敏捷的伊兹沙|r
    .complete 30730,1 --1/1 Dextrous Izissha defeated
    .skipgossip
    .target Dextrous Izissha
    .mob Dextrous Izissha
step
    .isOnQuest 30731
    .goto 418,36.6,74.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_郭楠·翎爪|r交谈并击杀|r郭楠·翎爪|r
    .complete 30731,1 --1/1 Kuo-Na Quillpaw defeated
    .skipgossip
    .target Kuo-Na Quillpaw
    .mob Kuo-Na Quillpaw
step
    .isOnQuest 30732
    .goto 418,34.6,83.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾黎亚·鸦鬃|r交谈, 并击杀|cRXP_ENEMY_艾黎亚·鸦鬃|r
    .complete 30732,1 --1/1 Ellia Ravenmane defeated
    .skipgossip
    .target Ellia Ravenmane
    .mob Ellia Ravenmane
step
    .isOnQuest 30733
    .goto 418,34.0,75.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图卡图克|r交谈, 并击杀|cRXP_ENEMY_图卡图克|r
    .complete 30733,1 --1/1 Tukka-Tuk defeated
    .skipgossip
    .target Tukka-Tuk
    .mob Tukka-Tuk
step
    .isOnQuest 30734
    .goto 418,27.8,70.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈克·独轮|r交谈, 并击杀|cRXP_ENEMY_哈克·独轮|r
    .complete 30734,1 --1/1 Huck Wheelbarrow defeated
    .skipgossip
    .target Huck Wheelbarrow
    .mob Huck Wheelbarrow
step
    .isOnQuest 30735
    .goto 418,32.0,70.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米德尔·日语者|r交谈, 并击杀|cRXP_ENEMY_米德尔·日语者|r
    .complete 30735,1 --1/1 Mindel Sunspeaker defeated
    .skipgossip
    .target Mindel Sunspeaker
    .mob Mindel Sunspeaker
step
    .isOnQuest 30736
    .goto 418,36.6,76.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_燕·翎爪|r交谈, 并击杀|cRXP_ENEMY_燕·翎爪|r
    .complete 30736,1 --1/1 Yan Quillpaw defeated
    .skipgossip
    .target Yan Quillpaw
    .mob Yan Quillpaw
step
    .isOnQuest 30737
    .goto 418,34.8,82.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肥龙|cRXP_FRIENDLY_肥龙|r交谈, 并击杀|r肥龙|cRXP_ENEMY_肥龙
    .complete 30737,1 --1/1 Fat Long-Fat defeated
    .skipgossip
    .target Fat Long-Fat
    .mob Fat Long-Fat
step
    .isOnQuest 30738
    .goto 418,28.8,72.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈, 并击杀|cRXP_ENEMY_塞隆尼斯|r
    .complete 30738,1 --1/1 Thelonius defeated
    .skipgossip
    .target Thelonius
    .mob Thelonius
step
    .isOnQuest 30739
    .goto 418,36.2,75.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾黎亚·鸦鬃|r交谈, 并击杀|cRXP_ENEMY_艾黎亚·鸦鬃|r
    .complete 30739,1 --1/1 Ellia Ravenmane defeated
    .skipgossip
    .target Ellia Ravenmane
    .mob Ellia Ravenmane
step
    .isOnQuest 30725
    .goto 418,31.34,63.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30725 >>交予艾黎亚·鸦鬃
    .target Thelonius
step
    .isOnQuest 30728
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30728 >>交出肥龙
step
    .isOnQuest 30729
    .goto 418,31.34,63.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30729 >>交予茱莉亚·贝茨
    .target Thelonius
step
    .isOnQuest 30730
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30730 >>交还敏捷的伊兹沙
step
    .isOnQuest 30731
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30731 >>交出郭楠·翎爪的羽毛笔
step
    .isOnQuest 30732
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30732 >>交还艾黎亚·鸦鬃：复仇
step
    .isOnQuest 30733
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30733 >>提交图卡图克
step
    .isOnQuest 30734
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30734 >>交出哈克·独轮
step
    .isOnQuest 30735
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30735 >>交予米德尔·日语者
step
    .isOnQuest 30736
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30736 >>交还燕·翎爪
step
    .isOnQuest 30737
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30737 >>交还肥龙：重赛
step
    .isOnQuest 30738
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30738 >>交出塞隆尼斯
step
    #label endaugustkrasa
    .isOnQuest 30739
    .goto 418,31.34,63.44
    .target Thelonius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞隆尼斯|r交谈
    .dailyturnin 30739 >>交还艾莉亚·鸦鬃：救赎
]])

--Domination Point Dailies Horde
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name ad) 统御岗哨日常任务
#displayname |cFF1EFF004|r - 统御岗哨 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ae) 登陆戴利群岛 联盟

step
    #loop
    .goto 418,10.07,53.86,15,0
    .goto 418,10.51,52.99,20,0
    .goto 418,10.33,55.68,15,0
    .goto 418,12.74,56.74,15,0
    .goto 418,12.91,56.13,15,0
    .goto 418,13.79,55.78,15,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|cRXP_FRIENDLY_和布罗利克|cRXP_FRIENDLY_和夏琪亚|cRXP_FRIENDLY_和利维特·急刹|cRXP_FRIENDLY_和悬赏榜|cRXP_FRIENDLY_和女工头翠克西尔|cRXP_FRIENDLY_和公爵|r交谈
    .questcount <3,32235,32126,32123,32214,32199,32222,32136,32223,32221,32318 >>|cRXP_WARN_接受所有统御岗哨日常任务|r
    .target Master Snowdrift
    .target Ling of the Six Pools
    .target Rivett Clutchpop
    .target Bounty Board
    .target Boss-Lady Trixel
    .target Shokia
    .target Brolic
    .target Duke
    .target Blood Guard Gro'tash
step
    .xp >69,1
    .abandon 32214 >>放弃比尔德沃特渗透者
step
    .isOnQuest 32235
    >>飞向空中, 在驾驶|cRXP_ENEMY_天火号旋翼机X2型|r时使用 |T135815:0|t[锈水燃烧瓶]
    .goto 418,10.87,56.80
    .complete 32235,1 --6/6 Skyfire Gyrocopter X2 slain
    .mob Skyfire Gyrocopter X2
step
    #completewith AllianceTwoLegs
    #hidewindow
    #loop
    .goto 418,8.22,59.15,35,0
    .goto 418,8.75,69.49,35,0
    .goto 418,13.94,68.86,35,0
    +1
step
    .isOnQuest 32123
    #completewith next
    >>击杀|cRXP_ENEMY_Alliance|r
    .complete 32123,1 --10/10 Alliance slain
    .mob Alliance
step
    .isOnQuest 32126
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_联盟空投补给|r
    .complete 32126,1 --8/8 Alliance Supply Drops destroyed
step
    .isOnQuest 32123
    #label AllianceTwoLegs
    >>击杀|cRXP_ENEMY_Alliance|r
    .complete 32123,1 --10/10 Alliance slain
    .mob Alliance
step
    .isOnQuest 32123
    .goto 418,10.33,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
    .dailyturnin 32123 >>交还“死战到底”
    .target Shokia
step
    .isOnQuest 32235
    .goto 418,10.08,53.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
    .dailyturnin 32235 >>交任务！点火！哇啊啊！
    .target Blood Guard Gro'tash
step
    .isOnQuest 32126
    .goto 418,10.47,53.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗利克|r交谈
    .dailyturnin 32126 >>交出“破灭的希望”
    .target Brolic
step
    .isOnQuest 32199
    .goto 418,13.79,55.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女工头翠克西尔|r交谈
    .daily 32136,32138 >>接任务: |cRXP_WARN_[Work Order: Fuel]|r
    .target Boss-Lady Trixel
step
    .isOnQuest 32221
    #completewith next
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall forces
step
    .isOnQuest 32199
    #label PollutedViseclawMeatA
    .goto 418,18.01,55.41
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r, 击败它们后可获得 |T645112:0|t[污染的维斯克劳肉]
    .complete 32199,1,3 --3/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    .isOnQuest 32199
    #completewith next
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r, 击败它们后可获得 |T645112:0|t[污染的维斯克劳肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    .isOnQuest 32222
    .goto 418,21.68,51.16
    >>击杀|cRXP_ENEMY_首席技师轮钳|r
    .complete 32222,1 --1/1 Chief Engineer Cogwrench slain
    .mob Chief Engineer Cogwrench
step
    .isOnQuest 32221
    #completewith WorkOrderFuel
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall forces
step
    .isOnQuest 32214
    #completewith WorkOrderFuel
    >>击杀|cRXP_ENEMY_军情七处破坏者|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals]
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32199
    #completewith WorkOrderFuel
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r, 击败它们后可获得 |T645112:0|t[污染的维斯克劳肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    #label WorkOrderFuel
    .isOnQuest 32136
    .goto 418,25.54,60.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里兹尔·轮滑|r谈话
    .turnin 32136 >>交任务: |cRXP_FRIENDLY_[Work Order: Fuel]|r
    .target Grizzle Gearslip
step
    .isOnQuest 32221
    #completewith WorkOrderLumber
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall forces
step
    .isOnQuest 32214
    #completewith WorkOrderLumber
    >>击杀|cRXP_ENEMY_军情七处破坏者|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals]
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32199
    #completewith WorkOrderLumber
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r, 击败它们后可获得 |T645112:0|t[污染的维斯克劳肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    #label WorkOrderLumber
    .isOnQuest 32138
    .goto 418,20.48,60.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“伐木机”兹诺·快锯|r交谈
    .turnin 32138 >>交任务: |cRXP_FRIENDLY_[Work Order: Lumber]|r
    .target Zino "The Shredder" Quickchop
step
    .isQuestTurnedIn 32138
    .goto 418,20.48,60.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“伐木机”兹诺·快锯|r交谈
    .daily 32139 >>接任务: |cRXP_WARN_加班加点！|r
    .target Zino "The Shredder" Quickchop
step
    .isQuestTurnedIn 32138
    .goto 418,20.61,58.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克希·圆锯|r交谈
    .daily 32238 >>接任务: |cRXP_WARN_通用型遥控引爆器|r
    .target Bixy Buzzsaw
step
    #completewith ShieldwallMechaPounderExploded
    #hidewindow
    #loop
    .goto 418,18.66,62.38,25,0
    .goto 418,21.46,63.05,25,0
    .goto 418,20.57,58.35,35,0
    +1
step
    .isOnQuest 32221
    #completewith ShieldwallMechaPounderExploded
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall Engineer
    .mob SI:7 Saboteur
    .mob 7th Legion Paratrooper
step
    .isOnQuest 32214
    #completewith ShieldwallMechaPounderExploded
    >>击杀|cRXP_ENEMY_军情七处破坏者|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals]
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32238
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_ENEMY_Shieldwall Mecha Pounder|r, 用 |T133015:0|t[通用遥控器] 削弱它们. 然后击杀|cRXP_ENEMY_Shieldwall Mecha Pounder|r
    .complete 32238,1 --9/9 Shieldwall Mecha Pounder exploded
    .use 91902
    .mob Shieldwall Mecha Pounder
step
    .isOnQuest 32139
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_统御岗哨木材|r
    .complete 32139,1 --9/9 Domination Point Lumber collected
step
    .isOnQuest 32238
    #label ShieldwallMechaPounderExploded
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_ENEMY_Shieldwall Mecha Pounder|r, 用 |T133015:0|t[通用遥控器] 削弱它们. 然后击杀|cRXP_ENEMY_Shieldwall Mecha Pounder|r
    .complete 32238,1 --9/9 Shieldwall Mecha Pounder exploded
    .use 91902
    .mob Shieldwall Mecha Pounder
step
    .isOnQuest 32238
    .goto 418,20.61,58.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克希·圆锯|r交谈
    .dailyturnin 32238 >>提交通用型遥控引爆器
    .target Bixy Buzzsaw
step
    .isOnQuest 32139
    .goto 418,20.54,60.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“伐木机”兹诺·快锯|r交谈
    .dailyturnin 32139 >>加班加点！
    .target Zino "The Shredder" Quickchop
step
    .isOnQuest 32221
    #completewith LieutenantEthanJacobsonSlain
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall Engineer
    .mob SI:7 Saboteur
    .mob 7th Legion Paratrooper
step
    .isOnQuest 32214
    #completewith LieutenantEthanJacobsonSlain
    >>击杀|cRXP_ENEMY_军情七处破坏者|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals]
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32199
    #completewith LieutenantEthanJacobsonSlain
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r. 击杀后可获得 |T645112:0|t[被污染的维斯克爪肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    .isOnQuest 32223
    #label LieutenantEthanJacobsonSlain
    .goto 418,19.05,70.96
    .complete 32223,1 --1/1 Lieutenant Ethan Jacobson slain
    .mob Lieutenant Ethan Jacobson
step
    #completewith ShieldwallForcesSlain
    #hidewindow
    #loop
    .goto 418,16.10,71.22,35,0
    .goto 418,21.56,67.09,35,0
    .goto 418,24.58,56.15,35,0
    .goto 418,19.44,58.99,35,0
    +1
step
    .isOnQuest 32221
    #completewith next
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall Engineer
    .mob SI:7 Saboteur
    .mob 7th Legion Paratrooper
step
    .isOnQuest 32199
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r. 击杀后可获得 |T645112:0|t[被污染的维斯克爪肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    .isOnQuest 32221
    #label ShieldwallForcesSlain
    >>击杀|cRXP_ENEMY_Shieldwall部队|r
    .complete 32221,1 --10/10 Shieldwall forces slain
    .mob Shieldwall Engineer
    .mob SI:7 Saboteur
    .mob 7th Legion Paratrooper
step
    .isOnQuest 32214
    #completewith next
    >>击杀|cRXP_ENEMY_军情七处破坏者|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals]
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32199
    #loop
    .goto 418,28.07,58.22,22,0
    .goto 418,21.86,63.93,35,0
    .goto 418,16.16,58.46,35,0
    .goto 418,19.49,53.54,35,0
    >>击杀|cRXP_ENEMY_Polluted Visceclaws|r和|cRXP_ENEMY_Polluted Visceclaw Scuttlers|r. 击杀后可获得 |T645112:0|t[被污染的维斯克爪肉]
    .complete 32199,1 --5/5 Polluted Viseclaw Meat
    .mob Polluted Visceclaw
    .mob Polluted Visceclaw Scuttler
step
    .isOnQuest 32199
    .goto 418,26.06,58.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兹克·蒸锅|r交谈
    .dailyturnin 32199 >>交还卡桑琅蒸汽锅
    .target Sezik Steampot
step
    .isOnQuest 32214
    #loop
    .goto 418,21.88,53.96,22,0
    .goto 418,23.58,56.29,25,0
    .goto 418,26.40,62.04,25,0
    .goto 418,19.65,61.74,40,0
    >>击杀|cRXP_ENEMY_SI:7 军情七处破坏者|r|cRXP_WARN_mostly 在管道和阀门附近|r
    *Use the |T644269:0|t["New" and "Improved" Infrared Heat Focals] which will allow you to see them from 10 yards :)
    .complete 32214,1 --10/10 SI:/ Saboteur slain
    .use 92475
    .mob SI:7 Saboteur
step
    .isOnQuest 32221
    .goto 418,12.91,56.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .dailyturnin 32221 >>提交“海滩大反攻”任务
    .target Rivett Clutchpop
step
    .isOnQuest 32214
    .goto 418,12.91,56.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
    .dailyturnin 32214 >>交任务: |cRXP_FRIENDLY_[Bilgewater Infiltrators]|r
    .target Rivett Clutchpop
step
    .isOnQuest 32222
    .goto 418,10.07,53.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
    .turnin 32222 >>交任务: |cRXP_FRIENDLY_[WANTED: Chief Engineer Cogwrench]|r
    .target Blood Guard Gro'tash
step
    .isOnQuest 32223
    .goto 418,10.06,53.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
    .dailyturnin 32223 >>提交任务:通缉令——伊桑·雅各布森中尉
    .target Blood Guard Gro'tash
--step
--    .xp >69,1
--    .isQuestTurnedIn 32449
--    .goto 418,10.07,53.87
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
--    .target Blood Guard Gro'tash
--    .accept 32449 >>接任务: |cRXP_WARN_敖骨打废墟|r
step
    .isQuestTurnedIn 32235
    .isQuestTurnedIn 32126
    .isQuestTurnedIn 32123
    .goto 418,10.08,53.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
    .accept 32128 >>接任务: |cRXP_WARN_又干掉一个|r
    .target Blood Guard Gro'tash
step
    .isQuestTurnedIn 32235
    .isQuestTurnedIn 32126
    .isQuestTurnedIn 32123
    .goto 418,10.47,53.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗利克|r交谈
    .accept 32127 >>接任务: |cRXP_WARN_统统干掉|r
    .target Brolic
step
    .isOnQuest 32127
    .goto 418,12.80,75.80
    >>击杀|cRXP_ENEMY_“黑炭”布伦特船长|r
    .complete 32127,1 --1/1 Captain Brent the Black slain
    .mob Captain Brent the Black
step
    .isOnQuest 32128
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Powder|r
    .goto 418,11.56,75.15,10,0
    .goto 418,12.33,75.59
    .complete 32128,2 --1/1 The Defiant ammunition destroyed
step
    .isOnQuest 32127
    .goto 418,15.31,76.35
    >>击杀|cRXP_ENEMY_马尔基船长|r
    .complete 32127,2 --1/1 Captain Mulkey slain
    .mob Captain Mulkey
step
    .isOnQuest 32128
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Powder|r
    .goto 418,14.09,77.07,10,0
    .goto 418,15.09,76.61
    .complete 32128,1 --1/1 Valor's Edge ammunition destroyed
step
    .isOnQuest 32128
    .goto 418,10.08,53.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
    .dailyturnin 32128 >>交出“又干掉一个”
    .target Blood Guard Gro'tash
step
    .isOnQuest 32127
    .goto 418,10.47,53.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗利克|r交谈
    .dailyturnin 32127 >>交任务：统统干掉
    .target Brolic

]])

--Landfall Daillies Alliance
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name ae) 登陆戴利群岛 联盟
#displayname |cFF1EFF005|r - 夺岛奇兵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next af) 影踪派日常任务

--Ruins of Ogudei
-- step
--     .goto 418,89.70,33.09
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德曼元帅|r交谈
--     .accept 32116 >>接任务: |cRXP_WARN_救人要紧！|r
--     .target Marshal Troteman
step
    #loop
    #label startlandfall1
    .goto 418,89.70,33.09,10,0
    .goto 418,89.79,32.43,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德曼元帅|r和|r安伯·基尔南|r交谈
    .questcount <1,32116,32451,32452 >>|cRXP_WARN_获取登陆任务每日起始点|r
step
    .isOnQuest 32116
    .goto 419,30.20,27.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔达·盘角|r交谈
    .dailyturnin 32116 >>救人要紧！
    .target Hilda Hornswaggle
step
    .isQuestTurnedIn 32116
    .goto 419,30.20,27.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔达·盘角|r交谈
    .target Hilda Hornswaggle
    .daily 32347 >>接任务: |cRXP_WARN_驱逐令|r
    .daily 32346 >>接任务: |cRXP_WARN_灾祸猛于鬼！|r
    .daily 32122 >>接任务: |cRXP_WARN_敖骨打的副官|r
    .daily 32121 >>接任务: |cRXP_WARN_灵魂陷阱|r
    .daily 32115,32119 >>接任务: |cRXP_WARN_旧日的枷锁|r
step
    .isOnQuest 32347
    .goto 419,39.81,16.62,15,0
    .goto 419,57.57,37.52,20 >>进入矿坑
step
    .isOnQuest 32346,32121
    #completewith Reliquary Area
    >>击杀|cRXP_ENEMY_魂缚摩古|r和|cRXP_ENEMY_魂能陷阱. |r
    .complete 32346,1 --12/12 Spiritbound Mogu slain
    .complete 32121,1 --3/3 Spirit Trap destroyed
    .mob Spiritbound Mogu
    .mob Spiritbound Arcanist
    .mob Spiritbound Brutalizer
    .mob Spirit Trap
step
    .isOnQuest 32115
    #completewith Reliquary Area
    >>杀死不安的灵奴以解救他们
    .complete 32115,1 --14/14 Troubled Slave Spirits released
    .mob Troubled Slave Spirit
step
    .isOnQuest 32119
    .goto 421,74.86,14.23
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 32119,1 --1/1 Anomaly dispersed
step
    .isOnQuest 32122
    #completewith next
    .goto 421,74.86,14.23,20,0
    .goto 421,95.99,47.12,10,0
    .goto 420,78.86,52.69,10,0
    .goto 420,76.78,63.49,10  >>进入Boss领域
step
    .isOnQuest 32122
    .goto 420,68.66,78.64
    >>击杀|cRXP_ENEMY_织谎者庚离|r和|cRXP_ENEMY_担山力士孟都|r
    .complete 32122,1 --1/1 Gen-li, Twister of Words slain
    .complete 32122,2 --1/1 Meng-do, Strength of Mountains slain
    .mob Meng-do, Strength of Mountains
    .mob Gen-li, Twister of Words
step
    .isOnQuest 32122
    .goto 420,76.78,63.49,10,0
    .goto 420,78.86,52.69,10,0
    .goto 421,95.99,47.12,10 >>离开Boss区域
step
    .isOnQuest 32347
    #completewith next
    #label Reliquary Area
    .goto 421,80.8,83.47
    .goto 421,58.81,84.44
    .goto 421,68.68,45.48,10 >>进入遗物区
step
    .isOnQuest 32347
    #loop
    .goto 421,80.56,52.81,20,0
    .goto 421,51.78,48.62,20,0
    .goto 421,33.68,37.72,20,0
    .goto 421,42.83,74.62,20,0
    >>击杀|cRXP_ENEMY_神圣遗物学会血骑士|r|cRXP_ENEMY_骑士|r和|cRXP_ENEMY_斥候|r
    .complete 32347,1 --10/10 Reliquary slain
    .mob Reliquary Blood Knight
    .mob Reliquary Scout
    .mob Reliquary Mage
step
    .isOnQuest 32347
    #completewith next
    .goto 421,80.13,44.45,20,0
    .goto 421,75.28,23.51,20,0
    .goto 421,68.68,45.48,10 >>离开圣物存放区
step
    .isOnQuest 32346,32121
    #hidewindow
    #completewith Spirit Trap destroyed
    #loop
    .goto 421,40.73,29.01,20,0
    .goto 420,48.61,15.97,20,0
    .goto 421,59.56,1.41,20,0
    .goto 420,73.16,16.77,20,0
    .goto 421,90,48.12,20,0
    .goto 421,86.81,78.17,20,0
    .goto 421,70.78,86.37,20,0
    .goto 421,57.26,91.21,20,0
    +1
step
    .isOnQuest 32346,32121
    #completewith next
    >>击杀|cRXP_ENEMY_魂缚摩古|r和|cRXP_ENEMY_魂能陷阱. |r
    .complete 32346,1 --12/12 Spiritbound Mogu slain
    .complete 32121,1 --3/3 Spirit Trap destroyed
    .mob Spiritbound Mogu
    .mob Spiritbound Arcanist
    .mob Spiritbound Brutalizer
    .mob Spirit Trap
step
    .isOnQuest 32115
    >>杀死不安的灵奴以解救他们
    .complete 32115,1 --14/14 Troubled Slave Spirits released
    .mob Troubled Slave Spirit
step
    .isOnQuest 32346,32121
    #label Spirit Trap destroyed
    >>击杀|cRXP_ENEMY_魂缚摩古|r和|cRXP_ENEMY_魂能陷阱. |r
    .complete 32346,1 --12/12 Spiritbound Mogu slain
    .complete 32121,1 --3/3 Spirit Trap destroyed
    .mob Spiritbound Mogu
    .mob Spiritbound Arcanist
    .mob Spiritbound Brutalizer
    .mob Spirit Trap
step
    #completewith next
    .goto 421,63.56,37.09,15,0
    .goto 421,61.18,24.34,15,0
    .goto 419,63.72,46.52,15,0
    .goto 419,56.43,29.72,15,0
    .goto 419,36.07,17.57,20 >>回到矿井入口处
step
    .isQuestTurnedIn 32116
    .goto 419,30.07,27.46
    #label endlandfall1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔达·盘角|r交谈
    .dailyturnin 32115 >>交还旧日的枷锁
    .dailyturnin 32119,32115 >>交出“这是个谜”或“旧日的枷锁”
    .dailyturnin 32121 >>交还灵魂陷阱
    .dailyturnin 32122 >>交出敖骨打的副官
    .dailyturnin 32346 >>交出“灾祸猛于鬼！”
    .dailyturnin 32347 >>提交驱逐令
    .target Hilda Hornswaggle
--Domination Point
-- step
--     .goto 418,89.82,32.41
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
--     .accept 32451 >>接任务: |cRXP_WARN_明确的信息|r
--     .target Amber Kearnen
step
    .isOnQuest 32451
    #label startlandfallfinal
    .goto 418,16.46,79.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .dailyturnin 32451 >>提交 明确的信息
    .target +Sky Admiral Rogers
step
    .isQuestTurnedIn 32451
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .daily 32142 >>接任务: |cRXP_WARN_干掉他们！|r
    .daily 32146 >>接任务: |cRXP_WARN_达摩克利斯之锤|r
    .goto 418,16.48,79.2
    .target +Sky Admiral Rogers
step
    .isQuestTurnedIn 32451
    #loop
    .goto 418,16.45,79.27,20,0
    .goto 418,16.74,79.69,20,0
    .goto 418,16.26,79.21,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工匠大师欧沃斯巴克|r交谈
    .daily 32143 >>接任务: |cRXP_WARN_神奇魔法|r
    .target +Tinkmaster Overspark
step
    .isQuestTurnedIn 32451
    .goto 418,16.66,78.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r交谈
    .daily 32144 >>接任务: |cRXP_WARN_重压之下|r
    .target Mishka
step
    .isOnQuest 32142,32146
    #completewith Scout-o-Meter Mk III
    >>击杀|cRXP_ENEMY_控制权兽人|r和|cRXP_ENEMY_重装巨怪|r
    .complete 32142,1 --10/10 Domination Orc slain
    .complete 32146,1 --5/5 Heavy Mook slain
    .mob Domination Orc
    .mob Dominance Grunt
    .mob Heavy Mook
    .mob Bloodhilt Honor Guard
    .mob Dominance Raider
step
    .isOnQuest 32144
    #completewith Scout-o-Meter Mk III
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_箱子|r
    .complete 32144,1 --8/8 Horde Supply Crates Destroyed
step
    .isOnQuest 32143
    .goto 418,11.66,67.84
    >>与|Mk I号探查器|r互动
    .complete 32143,1 --1/1 Eliminate the Beachhead Demolishers
    .target Scout-o-Meter Mk I
step
    .isOnQuest 32143
    .goto 418,10.89,60.91
    >>与Mk II号探查器互动
    .complete 32143,2 --1/1 Eliminate the Horde Wolves
    .target Scout-o-Meter Mk II
step
    .isOnQuest 32143
    .goto 418,12.64,56.60
    >>与|Mk III号探查器|r互动
    .complete 32143,3 --1/1 Destroy the Horde Bomb Stockpile
    .target Scout-o-Meter Mk III
step
    .isOnQuest 32143
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击任务弹出窗口提交任务
    .turnin 32143 >>交任务: |cRXP_FRIENDLY_神奇魔法|r
step
    .isQuestTurnedIn 32145
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击任务提示窗口接受新任务
    .accept 32145 >>接任务: |cRXP_WARN_小心你的脑袋|r
step
    .isOnQuest 32145
    .goto 418,13.29,56.25
    >>击杀|cRXP_ENEMY_首席炸弹技师斯尼克弗里兹|r
    .complete 32145,3 --1/1 Chief Bombgineer Snicklefritz slain
    .mob Chief Bombgineer Snicklefritz
step
    .isOnQuest 32145
    .goto 418,13.40,57.85
    >>击杀 |cRXP_ENEMY_石卫鲁克拉|r
    .complete 32145,2 --1/1 Stone Guard Ruk'Ra slain
    .mob Stone Guard Ruk'Ra
step
    .isOnQuest 32145
    #label Scout-o-Meter Mk III
    .goto 418,10.38,58.00
    >>击杀|cRXP_ENEMY_Or'Dac|r
    .complete 32145,1 --1/1 Or'Dac slain
    .mob Or'Dac
step
    .isOnQuest 32142,32146
    #hidewindow
    #completewith Domination Orcs
    #loop
    .goto 418,8.21,61.03,30,0
    .goto 418,9.56,64.58,30,0
    .goto 418,12.73,65.31,30,0
    .goto 418,11.3,60.34,30,0
    .goto 418,13.45,59.88,30,0
    .goto 418,14.07,56.99,30,0
    +1
step
    .isOnQuest 32142,32146
    #completewith next
    >>击杀|cRXP_ENEMY_控制权兽人|r和|cRXP_ENEMY_重装巨怪|r
    .complete 32142,1 --10/10 Domination Orc slain
    .complete 32146,1 --5/5 Heavy Mook slain
    .mob Domination Orc
    .mob Dominance Grunt
    .mob Heavy Mook
    .mob Bloodhilt Honor Guard
    .mob Dominance Raider
step
    .isOnQuest 32144
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_箱子|r
    .complete 32144,1 --8/8 Horde Supply Crates Destroyed
step
    .isOnQuest 32142,32146
    #label Domination Orcs
    >>击杀|cRXP_ENEMY_控制权兽人|r和|cRXP_ENEMY_重装巨怪|r
    .complete 32142,1 --10/10 Domination Orc slain
    .complete 32146,1 --5/5 Heavy Mook slain
    .mob Domination Orc
    .mob Dominance Grunt
    .mob Heavy Mook
    .mob Bloodhilt Honor Guard
    .mob Dominance Raider
step
    .isOnQuest 32144
    .goto 418,16.68,78.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r交谈
    .dailyturnin 32144 >>任务交还：重压之下
    .target Mishka
step
    .isOnQuest 32142,32146
    .goto 418,16.47,79.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .dailyturnin 32142 >>提交任务“干掉他们！”
    .dailyturnin 32146 >>交出达摩克利斯之锤以完成任务
    .target Sky Admiral Rogers
step
    .isOnQuest 32145
    #loop
    .goto 418,16.45,79.27,20,0
    .goto 418,16.74,79.69,20,0
    .goto 418,16.26,79.21,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工匠大师欧沃斯巴克|r交谈
    .dailyturnin 32145 >>交出任务“小心你的脑袋”
    .target Tinkmaster Overspark
--Domination Point 2
-- step
--     .goto 418,89.79,32.43
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
--     .accept 32452 >>接任务: |cRXP_WARN_还有地精|r
--     .target Amber Kearnen
step
    .isOnQuest 32452
    .goto 418,16.47,79.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .dailyturnin 32452 >>交还任务：还有地精
    .target Sky Admiral Rogers
step
    .isQuestTurnedIn 32157
    .goto 418,16.47,79.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .target Sky Admiral Rogers
    .daily 32157 >>接任务: |cRXP_WARN_唯一的好地精……|r
step
    .isQuestTurnedIn 32156,32158
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r和|cRXP_FRIENDLY_严酷的塞拉菲娜|r交谈
    .daily 32156 >>接任务: |cRXP_WARN_最后的关怀|r
    .goto 418,16.66,78.52
    .target +Mishka
    .daily 32158 >>接任务: |cRXP_WARN_两步走|r
    .goto 418,16.71,78.52
    .target +Seraphine of the Winter
step
    .isQuestTurnedIn 32154,32446
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“腌菜”苏利·麦克莱利|r交谈
    .daily 32154 >>接任务: |cRXP_WARN_统统烧光！|r
    .daily 32446 >>接任务: |cRXP_WARN_拆卸请求|r
    #loop
    .goto 418,17.36,78.68,10,0
    .goto 418,16.73,78.6,10,0
    .target +Sully "The Pickle" McLeary
step
    .isOnQuest 32157
    #completewith Northwestern
    >>击杀|cRXP_ENEMY_地精|r
    .complete 32157,1 --10/10 Bilgewater Goblins slain
    .mob Off-Duty Logger
    .mob Grease Worker
step
    .isOnQuest 32156
    #completewith Northwestern
    >>与|cRXP_FRIENDLY_阵亡的神盾士兵|r互动
    .complete 32156,1 --7/7 Shieldwall Soldier Dog Tag
    .target Fallen Shieldwall Soldier
step
    .isOnQuest 32446
    #completewith Northwestern
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_ENEMY_丛林伐木机|r, 然后击杀并搜刮它们 [|cRXP_LOOT_金属碎片|r]
    .complete 32446,1 --6/6 Scrap Metal
    .mob Jungle Shredder
step
    .isOnQuest 32158
    .goto 418,19.49,62.11
    >>击杀|cRXP_ENEMY_伐木大师帕克尔|r
    .complete 32158,1 --1/1 Shredmaster Packle slain
    .mob Shredmaster Packle
step
    .isOnQuest 32154
   .goto 418,25.48,59.44
    >>在|cRXP_WARN_地精炸弹箱子|r 附近使用 |T133717:0|t[不稳定的炸药]
    .complete 32154,1 --1/1 Northeastern Fuel Tank destroyed
    .use 93187
step
    .isOnQuest 32154
    .goto 418,23.92,54.63
    >>在|cRXP_WARN_地精炸弹箱子|r 附近使用 |T133717:0|t[不稳定的炸药]
    .complete 32154,2 --1/1 Northern Fuel Tank destroyed
    .use 93187
step
    .isOnQuest 32154
    #label Northwestern
    .goto 418,15.28,59
    >>在|cRXP_WARN_地精炸弹箱子|r 附近使用 |T133717:0|t[不稳定的炸药]
    .complete 32154,3 --1/1 Northwestern Fuel Tank destroyed
    .use 93187
step
    .isOnQuest 32157,32156
    #hidewindow
    #completewith Bilgewater Goblins
    #loop
    .goto 418,19.49,62.11,40,0
    .goto 418,25.48,59.44,40,0
    .goto 418,23.92,54.63 ,40,0
    .goto 418,15.28,59,40,0
    +1
step
    .isOnQuest 32157
    #completewith Scrap Metal
    >>击杀|cRXP_ENEMY_地精|r
    .complete 32157,1 --10/10 Bilgewater Goblins slain
    .mob Off-Duty Logger
    .mob Grease Worker
step
    .isOnQuest 32156
    #completewith Scrap Metal
    >>与|cRXP_FRIENDLY_阵亡的神盾士兵|r互动
    .complete 32156,1 --7/7 Shieldwall Soldier Dog Tag
    .target Fallen Shieldwall Soldier
step
    .isOnQuest 32446
    #label Scrap Metal
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_ENEMY_丛林伐木机|r, 然后击杀并搜刮它们 [|cRXP_LOOT_金属碎片|r]
    .complete 32446,1 --6/6 Scrap Metal
    .mob Jungle Shredder
step
    .isOnQuest 32157
    #completewith next
    >>击杀|cRXP_ENEMY_地精|r
    .complete 32157,1 --10/10 Bilgewater Goblins slain
    .mob Off-Duty Logger
    .mob Grease Worker
step
    .isOnQuest 32156
    >>与|cRXP_FRIENDLY_阵亡的神盾士兵|r互动
    .complete 32156,1 --7/7 Shieldwall Soldier Dog Tag
    .target Fallen Shieldwall Soldier
step
    .isOnQuest 32157
    #label Bilgewater Goblins
    >>击杀|cRXP_ENEMY_地精|r
    .complete 32157,1 --10/10 Bilgewater Goblins slain
    .mob Off-Duty Logger
    .mob Grease Worker
    .mob Refining Specialist
step
    .isOnQuest 32154,32446
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“腌菜”苏利·麦克莱利|r交谈
    .dailyturnin 32154 >>提交任务“统统烧光！”！
    .dailyturnin 32446 >>提交拆卸请求
    #loop
    .goto 418,17.36,78.68,10,0
    .goto 418,16.73,78.6,10,0
    .target +Sully "The Pickle" McLeary
step
    .isOnQuest 32156,32158
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r和|cRXP_FRIENDLY_严酷的塞拉菲娜|r交谈
    .dailyturnin 32156 >>交出“最后的关怀”
    .goto 418,16.66,78.52
    .target +Mishka
    .dailyturnin 32158 >>提交“两步走”任务
    .goto 418,16.71,78.52
    .target +Seraphine of the Winter
step
    #label endlandfallfinal
    .isOnQuest 32157
    .goto 418,16.47,79.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军上将罗杰斯|r交谈
    .target Sky Admiral Rogers
    .dailyturnin 32157 >>交出“唯一的好地精”……
]])

--Shado-Pan Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name af) 影踪派日常任务
#displayname |cFF1EFF006|r - 影踪派 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#title Shado-Pan Dailies
#next a) 风蛇日常任务

step
    #loop
    .goto 388,49.61,70.50,10,0
    .goto 388,49.01,71.33,10,0
    .goto 388,49.02,70.45,10,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r和|cRXP_FRIENDLY_六池门徒岭云|r或|cRXP_FRIENDLY_班·熊心|r交谈
    .questcount <4,31039,31040,31041,31046,31042,31043,31047,31105,31113,31114,31116,31118,31119,31196,31197,31199,31200,31201,31203,31198,31044,31045,31048,31106 >>|cRXP_WARN_完成所有影踪派日常任务|r
    .target Master Snowdrift
    .target Ling of the Six Pools
    .target Ban Bearheart
step
    #completewith DeadTalkerAssault
    #hidewindow
    #loop
    .goto 388,51.36,53.11,45,0
    .goto 388,50.37,48.88,45,0
    .goto 388,53.27,49.36,40,0
    +1
step
    #completewith CipheredScroll
    .isOnQuest 31114
    >>击杀|cRXP_ENEMY_死语渎尸者|r 和一名|cRXP_ENEMY_死语碾压者|r
    .complete 31114,1 --8/8 Deadtalker Corpsedefiler slain
    .complete 31114,2 --1/1 Deadtalker Crusher slain
    .mob Deadtalker Corpsedefiler
    .mob Deadtalker Crusher
step
    #completewith CipheredScroll
    .isOnQuest 31116
    >>击杀|cRXP_ENEMY_被亵渎的幽灵|r. 击败后可拾取 |T132859:0|t[|cRXP_LOOT_古代灵魂尘|r]
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_污损的野牛人残骸|r(每个残骸需要 4 点尘埃)
    .complete 31116,1 --8/8 Spirits Returned to Their Remnants
    .mob Defiled Spirit
step
    #label CipheredScroll
    .isOnQuest 31118
    >>击杀|cRXP_ENEMY_Deadtalkers|r和|cRXP_ENEMY_乌奴克|r. 击败它们后搜刮出 |T1:0|t[密文卷轴]
    .complete 31118,1 --1/1 Ciphered Scroll
    .mob Deadtalker Crusher
    .mob Deadtalker Corpsedefiler
    .mob Uruk
step
    #completewith next
    .isOnQuest 31114
    >>击杀|cRXP_ENEMY_死语渎尸者|r 和一名|cRXP_ENEMY_死语碾压者|r
    .complete 31114,1 --8/8 Deadtalker Corpsedefiler slain
    .complete 31114,2 --1/1 Deadtalker Crusher slain
    .mob Deadtalker Corpsedefiler
    .mob Deadtalker Crusher
step
    .isOnQuest 31116
    >>击杀|cRXP_ENEMY_被亵渎的幽灵|r. 击败后可拾取 |T132859:0|t[|cRXP_LOOT_古代灵魂尘|r]
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_污损的野牛人残骸|r(每个残骸需要 4 点尘埃)
    .complete 31116,1 --8/8 Spirits Returned to Their Remnants
    .mob Defiled Spirit
step
    .isOnQuest 31114
    #label DeadTalkerAssault
    >>击杀|cRXP_ENEMY_死语渎尸者|r 和一名|cRXP_ENEMY_死语碾压者|r
    .complete 31114,1 --8/8 Deadtalker Corpsedefiler slain
    .complete 31114,2 --1/1 Deadtalker Crusher slain
    .mob Deadtalker Corpsedefiler
    .mob Deadtalker Deadtalker Crusher
step
    .isOnQuest 31119
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_野牛人高爆油桶|r
    .collect 84762,10 --10 Highly Explosive Yaungol Oil
step
    .isOnQuest 31113
    #loop
    .goto 388,61.52,43.70,35,0
    .goto 388,64.08,42.00,35,0
    .goto 388,60.89,41.58,35,0
    >>击杀|cRXP_ENEMY_Gai-Chos|r
    .complete 31113,1 --16/16 Gai-Cho Yaungol, Earthtalkers, or Pitchthrowers Slain
    .mob Gai-Cho Pitchthrower
    .mob Gai-Cho Yaungol
    .mob Gai-Cho Earthtalker
step
    .isOnQuest 31119
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_野牛人高爆油桶|r
    .collect 84762,10 --10 Highly Explosive Yaungol Oil
    .goto 388,61.52,43.70,0
    .goto 388,60.89,41.58,0
    .goto 388,64.08,42.00,0
step
    .isOnQuest 31119
    #loop
    .goto 388,59.97,48.29,35,0
    .goto 388,62.13,47.91,35,0
    >>使用 |T252176:0|t[野牛人高爆油桶] 杀死 |cRXP_ENEMY_Kri'thik|r和 |cRXP_ENEMY_Gai_Cho|r
    *|cRXP_WARN_If you need more barrels then fly back up and collect some more|r
    .complete 31119,1 --100/100 Gai-Cho Battlefield Combatants slain
    .use 84762
step
    .isOnQuest 31113
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31113 >>交还突袭铠胄火营的委托任务 Gai-Cho
    .target Master Snowdrift
step
    .isOnQuest 31114
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31114 >>交还突袭死语者高地的物品
    .target Master Snowdrift
step
    .isOnQuest 31118
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31118 >>交出顺藤摸瓜
    .target Master Snowdrift
step
    .isOnQuest 31119
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31119 >>交任务: |cRXP_FRIENDLY_敌人的敌人就是……|r... Is Still My Enemy!
    .target Master Snowdrift
step
    .isOnQuest 31116
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31116 >>交还灵魂尘
    .target Master Snowdrift

step
    .isQuestTurnedIn 31119
    .goto 388,49.61,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .daily 31117,31120 >>接任务: |cRXP_WARN_乌奴克！|r
    .target Master Snowdrift
step
    .isOnQuest 31120
    .goto 388,60.76,42.03
    >>击杀|cRXP_ENEMY_成柏|r
    .complete 31120,1 --1/1 Cheng Bo slain
    .mob Cheng Bo
step
    .isOnQuest 31117
    .goto 388,50.35,48.95
    >>击杀|cRXP_ENEMY_乌奴克|r
    .complete 31117,1 --1/1 Uruk slain
    .mob Uruk
step
    .isOnQuest 31120
    .goto 388,49.60,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31120 >>交出成柏！
    .target Master Snowdrift
step
    .isOnQuest 31117
    .goto 388,49.60,70.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雪流大师|r交谈
    .dailyturnin 31117 >>提交乌奴克！
    .target Master Snowdrift
step
    .isOnQuest 31196
    #completewith ShadoPanTraineesFreed
    >>击杀该区域内的|cRXP_WARN_non-elite|r|cRXP_ENEMY_Sra'thik Mantid|r
    .complete 31196,1 --15/15 Lesser Sra'thik mantid slain
    .mob Sra'thik Regenerator
    .mob Sra'thik Swiftwing
    .mob Sra'thik Drone
    .mob Sra'thik Cacophyte
    .mob Sra'thik Mutilator
step
    .isOnQuest 31199
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克攻城武器|r
    .goto 388,27.44,54.78
    .complete 31199,2 --1/1 Small Southern Siege Weapon destroyed
step
    .isOnQuest 31199
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克攻城武器|r
    .goto 388,25.76,53.55
    .complete 31199,1 --1/1 Large Southern Siege Weapon destroyed
step
    .isOnQuest 31197
    #completewith ShadoPanTraineesFreed
    .goto 388,16.36,40.87,0
    .line 388,17.66,41.90,17.96,44.79,17.85,46.17,17.64,49.62,18.00,50.30
    .line 388,18.41,49.86,19.65,48.38,19.71,46.84,20.18,45.97
    .line 388,20.92,42.96,20.16,42.98,19.50,43.73,19.48,44.28,19.71,44.75
    .line 388,20.52,40.24,21.59,40.26,22.25,39.77,23.33,39.91,23.55,39.88
    .line 388,27.16,40.54,26.27,40.82,27.16,39.60,26.43,38.76
    .line 388,24.00,43.82,24.35,42.97,25.19,43.10,25.37,41.57,25.16,40.64
    .line 388,26.07,40.86,25.72,43.12,26.12,45.35,26.15,45.90
    .line 388,26.01,46.35,25.38,47.65,24.81,48.07
    .line 388,23.97,49.38,23.42,50.62,23.37,51.69
    .line 388,23.21,52.69,22.45,53.35,21.70,53.59
    .line 388,24.85,55.10,24.33,54.92,23.70,54.09,23.52,52.50
    .line 388,21.66,53.58,20.31,53.99,20.03,52.51,19.39,51.33
    >>击杀该区域内的|r|cRXP_WARN_elite|r|cRXP_ENEMY_Sra'thik Mantid|r
    .complete 31197,1 --4/4 Greater Sra'thik mantid slain
    .mob Sra'thik Deathmixer
    .mob Sra'thik Vessguard
    .mob Sra'thik Swarmlord
    .mob Sra'thik Will-Breaker
    .mob Sra'thik Swarm-Leader
step
    .isOnQuest 31198
    .goto 388,23.57,55.64
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克雕像|r
    .complete 31198,1 --1/1 Southern idol
step
    .isOnQuest 31198
    .goto 388,21.53,49.24
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克雕像|r
    .complete 31198,3 --1/1 Center idol
step
    .isOnQuest 31200
    >>在路径点位置使用 |T348523:0|t[一袋影踪派瓦斯弹]
    .use 86532
    .goto 388,23.83,47.29
    .complete 31200,2 --1/1 Nutriment Cell bombed
step
    .isOnQuest 31200
    >>在路径点位置使用 |T348523:0|t[一袋影踪派瓦斯弹]
    .use 86532
    .goto 388,23.63,44.72
    .complete 31200,3 --1/1 Egg Chamber bombed
step
    .isOnQuest 31198
    .goto 388,27.82,41.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克雕像|r
    .complete 31198,4 --1/1 Eastern idol
step
    .isOnQuest 31199
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克攻城武器|r
    .goto 388,27.18,41.18
    .complete 31199,3 --1/1 Large Northern Siege Weapon destroyed
step
    .isOnQuest 31199
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克攻城武器|r
    .goto 388,26.06,39.94
    .complete 31199,4 --1/1 Small Northern Siege Weapon destroyed
step
    .isOnQuest 31200
    >>在路径点位置使用 |T348523:0|t[一袋影踪派瓦斯弹]
    .use 86532
    .goto 388,22.04,41.56
    .complete 31200,4 --1/1 Torture Cell bombed
step
    .isOnQuest 31200
    >>在路径点位置使用 |T348523:0|t[一袋影踪派瓦斯弹]
    .use 86532
    .goto 388,21.20,43.18
    .complete 31200,5 --1/1 Slaughtering Pit bombed
step
    .isOnQuest 31200
    >>在路径点位置使用 |T348523:0|t[一袋影踪派瓦斯弹]
    .use 86532
    .goto 388,21.00,45.88
    .complete 31200,1 --1/1 Amber Vault bombed
step
    .isOnQuest 31198
    .goto 388,16.17,45.78
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_瑟拉提克雕像|r
    .complete 31198,2 --1/1 Western idol
step
    .isOnQuest 31201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派受训者|r交谈
    *|cRXP_WARN_Be careful, you may get dismounted in the area|r
    .goto 388,18.00,53.45
    .skipgossip
    .complete 31201,1 --1/1 Shado-Pan Trainee at Northern Feeding Pit freed
    .target Shado_pan Trainee
step
    .isOnQuest 31201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派受训者|r交谈
    *|cRXP_WARN_Be careful, you may get dismounted in the area|r
    .goto 388,17.40,56.91
    .skipgossip
    .complete 31201,2 --1/1 Shado-Pan Trainee at Central Feeding Pit freed
    .target Shado_pan Trainee
step
    .isOnQuest 31201
    #label ShadoPanTraineesFreed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派受训者|r交谈
    *|cRXP_WARN_Be careful, you may get dismounted in the area|r
    .goto 388,17.57,58.04
    .skipgossip
    .complete 31201,3 --1/1 Shado-Pan Trainee at Southern Feeding Pit freed
    .target Shado_pan Trainee
step
    #completewith LesserSrathikSlain
    #hidewindow
    #loop
    .goto 388,23.52,52.48,45,0
    .goto 388,26.02,40.53,55,0
    .goto 388,16.44,40.98,55,0
    .goto 388,19.57,45.90,55,0
    .goto 388,20.12,54.23,45,0
    +1
step
    .isOnQuest 31196
    #completewith next
    >>击杀该区域内的|cRXP_WARN_non-elite|r|cRXP_ENEMY_Sra'thik Mantid|r
    .complete 31196,1 --15/15 Lesser Sra'thik mantid slain
    .mob Sra'thik Regenerator
    .mob Sra'thik Swiftwing
    .mob Sra'thik Drone
    .mob Sra'thik Cacophyte
    .mob Sra'thik Mutilator
step
    .isOnQuest 31197
    .goto 388,16.36,40.87,0
    .line 388,17.66,41.90,17.96,44.79,17.85,46.17,17.64,49.62,18.00,50.30
    .line 388,18.41,49.86,19.65,48.38,19.71,46.84,20.18,45.97
    .line 388,20.92,42.96,20.16,42.98,19.50,43.73,19.48,44.28,19.71,44.75
    .line 388,20.52,40.24,21.59,40.26,22.25,39.77,23.33,39.91,23.55,39.88
    .line 388,27.16,40.54,26.27,40.82,27.16,39.60,26.43,38.76
    .line 388,24.00,43.82,24.35,42.97,25.19,43.10,25.37,41.57,25.16,40.64
    .line 388,26.07,40.86,25.72,43.12,26.12,45.35,26.15,45.90
    .line 388,26.01,46.35,25.38,47.65,24.81,48.07
    .line 388,23.97,49.38,23.42,50.62,23.37,51.69
    .line 388,23.21,52.69,22.45,53.35,21.70,53.59
    .line 388,24.85,55.10,24.33,54.92,23.70,54.09,23.52,52.50
    .line 388,21.66,53.58,20.31,53.99,20.03,52.51,19.39,51.33
    >>击杀该区域内的|r|cRXP_WARN_elite|r|cRXP_ENEMY_Sra'thik Mantid|r
    .complete 31197,1 --4/4 Greater Sra'thik mantid slain
    .mob Sra'thik Deathmixer
    .mob Sra'thik Vessguard
    .mob Sra'thik Swarmlord
    .mob Sra'thik Will-Breaker
    .mob Sra'thik Swarm-Leader
step
    .isOnQuest 31196
    #label LesserSrathikSlain
    >>击杀该区域内的|cRXP_WARN_non-elite|r|cRXP_ENEMY_Sra'thik Mantid|r
    .complete 31196,1 --15/15 Lesser Sra'thik mantid slain
    .mob Sra'thik Regenerator
    .mob Sra'thik Swiftwing
    .mob Sra'thik Drone
    .mob Sra'thik Cacophyte
    .mob Sra'thik Mutilator
step
    .isOnQuest 31196
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31196 >>提交瑟拉维斯的苦差事
    .target Ling of the Six Pools
step
    .isOnQuest 31197
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31197 >>交出“朋友, 不是食物！”
    .target Ling of the Six Pools
step
    .isOnQuest 31199
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31199 >>提交任务“摧毁攻城武器”！
    .target Ling of the Six Pools
step
    .isOnQuest 31201
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31201 >>交出“朋友, 不是食物！”
    .target Ling of the Six Pools
step
    .isOnQuest 31198
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31198 >>提交打击士气
    .target Ling of the Six Pools
step
    .isOnQuest 31203
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31203 >>交还任务:机会目标——瑟拉提克统群者
    .target Ling of the Six Pools
step
    .xp <70,1
    .isQuestAvailable 31204
    .isQuestTurnedIn 31201,31199,31197,31196,31200
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .daily 31204,31203 >>接任务: |cRXP_WARN_机会目标：瑟拉提克领巢者|r
    .target Ling of the Six Pools
step
    .isOnQuest 31203
    .goto 388,16.36,40.88
    >>击杀|cRXP_ENEMY_Sra'thik Swarmlord|r
    .complete 31203,1 --1/1 Sra'thik Swarmlord slain
    .mob Sra'thik Swarmlord
step
    .isOnQuest 31203
    .goto 388,49.01,71.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31203 >>交还任务:机会目标——瑟拉提克统群者
    .target Ling of the Six Pools
step
    .isOnQuest 31204
    #completewith next
    #title 进入密室
    .goto 388,27.10,44.07,10 >>进入密室
step
    .isOnQuest 31204
    .goto 388,27.10,44.07,0
    .goto 388,24.33,43.99
    >>击杀|cRXP_ENEMY_Sra'thik Hivelord|r
    .complete 31204,1 --1/1 Sra'thik Hivelord slain
    .mob Sra'thik Hivelord
step
    .isOnQuest 31204
    #completewith next
    #title 离开密室
    .goto 388,27.10,44.07,10 >>离开密室
step
    .isOnQuest 31204
    .goto 388,49.01,71.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六池门徒岭云|r交谈
    .dailyturnin 31204 >>提交任务:机会目标——瑟拉提克领巢者
    .target Ling of the Six Pools
step
    #completewith ShanzeAncestorsSlain
    #hidewindow
    #loop
    .goto 388,29.96,22.40,35,0
    .goto 388,28.98,17.46,35,0
    .goto 388,21.74,13.51,45,0
    +1
step
    .isOnQuest 31106
    #completewith ShanzeIllusionistsSlain
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31106,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31048
    #completewith ShanzeIllusionistsSlain
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔古随葬小罐|r. 击杀|cRXP_ENEMY_山泽先祖|r
    .complete 31048,1 --24/24 Shan'ze Ancestor slain
    .mob Shan'ze Ancestor
step
    .isOnQuest 31044
    #completewith ShanzeIllusionistsSlain
    >>击杀|cRXP_ENEMY_青铜魁麟|r. 击败它们后可获得 |T370770:0|t[|cRXP_LOOT_青铜爪|r]
    .complete 31044,1 --20/20 Bronze Claw
    .mob Bronze Quilen
step
    #label ShanzeIllusionistsSlain
    .isOnQuest 31045
    >>击杀|cRXP_ENEMY_Shan'ze 幻影术士|r
    .complete 31045,1 --3/3 Shan'ze Illusionist slain
    .mob Shan'ze Illusionist
step
    .isOnQuest 31106
    #completewith BronzeClaws
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31106,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31048
    #completewith BronzeClaws
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔古随葬小罐|r. 击杀|cRXP_ENEMY_山泽先祖|r
    .complete 31048,1 --24/24 Shan'ze Ancestor slain
    .mob Shan'ze Ancestor
step
    .isOnQuest 31044
    #label BronzeClaws
    >>击杀|cRXP_ENEMY_青铜魁麟|r. 击败它们后可获得 |T370770:0|t[|cRXP_LOOT_青铜爪|r]
    .complete 31044,1 --20/20 Bronze Claw
    .mob Bronze Quilen
step
    .isOnQuest 31106
    #completewith next
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31106,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31048
    #label ShanzeAncestorsSlain
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔古随葬小罐|r. 击杀|cRXP_ENEMY_山泽先祖|r
    .complete 31048,1 --24/24 Shan'ze Ancestor slain
    .mob Shan'ze Ancestor
step
    .isOnQuest 31106
    #loop
    .goto 388,22.75,8.46,45,0
    .goto 388,30.24,8.35,45,0
    .goto 388,25.05,19.09,50,0
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31106,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31105
    #completewith WildCloudridersFreed
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31105,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31042
    #completewith WildCloudridersFreed
    >>击杀|r|cRXP_ENEMY_玛瑙暴爪龙|r. 击败它们后, 可获得|T399041:0|t[|cRXP_LOOT_玛瑙之心|r]
    .complete 31042,1 --4/4 Onyx Heart
    .mob Onyx Stormclaw
step
    .isOnQuest 31043
    #completewith WildCloudridersFreed
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_山泽石板|r
    .complete 31043,1 --8/8 Shan'ze Tablet
step
    .isOnQuest 31047
    #label WildCloudridersFreed
    #loop
    .goto 388,30.26,26.06,35,0
    .goto 388,33.48,27.21,35,0
    .goto 388,34.97,20.17,35,0
    .goto 388,31.75,21.86,35,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_链球|r
    .complete 31047,1 --6/6 Wild Cloudriders freed
step
    #completewith ShanzeeSerpenbindersBeastmastersSlain
    #hidewindow
    #loop
    .goto 388,25.71,19.64,35,0
    .goto 388,21.84,11.62,35,0
    .goto 388,24.39,8.36,35,0
    .goto 388,30.12,9.33,35,0
    .goto 388,25.71,19.64,35,0
    .goto 388,30.26,26.06,35,0
    .goto 388,33.48,27.21,35,0
    .goto 388,34.97,20.17,35,0
    .goto 388,31.75,21.86,35,0
    +1
step
    .isOnQuest 31105
    #completewith OnyxHeart
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31105,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31043
    #completewith OnyxHeart
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_山泽石板|r
    .complete 31043,1 --8/8 Shan'ze Tablet
step
    .isOnQuest 31042
    #label OnyxHeart
    >>击杀|r|cRXP_ENEMY_玛瑙暴爪龙|r. 击败它们后, 可获得|T399041:0|t[|cRXP_LOOT_玛瑙之心|r]
    .complete 31042,1 --4/4 Onyx Heart
    .mob Onyx Stormclaw
step
    .isOnQuest 31105
    #completewith next
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31105,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31043
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_山泽石板|r
    .complete 31043,1 --8/8 Shan'ze Tablet
step
    .isOnQuest 31105
    #label ShanzeeSerpenbindersBeastmastersSlain
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31105,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31039
    #completewith CloudrunnerHatchlingsFreed
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31039,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31041
    #completewith CloudrunnerHatchlingsFreed
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_闪光的蛋|r
    .complete 31041,1 --8/8 Cloudrunner Egg
step
    #label CloudrunnerHatchlingsFreed
    .isOnQuest 31046
    #loop
    .goto 388,33.48,27.21,35,0
    .goto 388,34.97,20.17,35,0
    .goto 388,31.75,21.86,35,0
    .goto 388,30.26,26.06,35,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_山泽囚笼|r
    .complete 31046,1 --20/20 Cloudrunner Hatchlings freed
    .target Cloudrunner Hatchling
step
    #completewith DarkwoodPixieCharmer
    #hidewindow
    #loop
    .goto 388,27.39,24.52,40,0
    .goto 388,25.16,24.07,35,0
    .goto 388,22.07,18.62,35,0
    .goto 388,19.33,16.52,35,0
    .goto 388,22.21,10.14,35,0
    .goto 388,23.38,17.98,40,0
    +1
step
    .isOnQuest 31040
    #completewith CloudrunnerEggs
    >>击杀|cRXP_ENEMY_黑木小鬼|r或|cRXP_ENEMY_黑木法师|r
    .complete 31040,1 --30/30 Darkwoods Pixies or Darkwoods Charmers slain
    .mob Darkwoods Pixie
    .mob Darkwoods Charmer
step
    .isOnQuest 31039
    #completewith CloudrunnerEggs
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31039,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31041
    #label CloudrunnerEggs
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_腾云翔龙蛋|r
    .complete 31041,1 --8/8 Cloudrunner Egg
step
    .isOnQuest 31040
    #completewith next
    >>击杀|cRXP_ENEMY_黑木小鬼|r或|cRXP_ENEMY_黑木法师|r
    .complete 31040,1 --30/30 Darkwoods Pixies or Darkwoods Charmers slain
    .mob Darkwoods Pixie
    .mob Darkwoods Charmer
step
    .isOnQuest 31039
    #completewith CloudrunnerEggs
    >>击杀|cRXP_ENEMY_Shan'ze 蛇缚者|r或|cRXP_ENEMY_Shan'ze 兽王|r
    .complete 31039,1 --12/12 Shan'ze Serpentbinders or Beastmasters slain
    .mob Shan'ze Serpentbinder
    .mob Shan'ze BeastMaster
step
    .isOnQuest 31040
    #label DarkwoodPixieCharmer
    >>击杀|cRXP_ENEMY_黑木小鬼|r或|cRXP_ENEMY_黑木法师|r
    .complete 31040,1 --30/30 Darkwoods Pixies or Darkwoods Charmers slain
    .mob Darkwoods Pixie
    .mob Darkwoods Charmer
step
    .isOnQuest 31044
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31044 >>提交青铜爪
    .target Ban Bearheart
step
    .isOnQuest 31045
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31045 >>交还“往日的幻影”
    .target Ban Bearheart
step
    .isOnQuest 31048
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31048 >>交还任务：后果很严重
    .target Ban Bearheart
step
    .isOnQuest 31106
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31106 >>提交《魔古的威胁》任务
    .target Ban Bearheart
step
    .isQuestTurnedIn 31106
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .daily 31062 >>接任务: |cRXP_WARN_亡语者|r
    .target Ban Bearheart
step
    .isOnQuest 31040
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31040 >>交还狡诈的林精
    .target Ban Bearheart
step
    .isOnQuest 31041
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31041 >>交还拯救龙蛋！
    .target Ban Bearheart
step
    .isOnQuest 31046
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31046 >>交还小雏龙
    .target Ban Bearheart
step
    .isOnQuest 31039
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31039 >>提交《魔古的威胁》任务
    .target Ban Bearheart
step
    .isNotOnQuest 31062
    .isQuestTurnedIn 31039
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .daily 31049 >>接任务: |cRXP_WARN_擒贼擒王|r
    .target Ban Bearheart
step
    .isOnQuest 31042
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31042 >>交还玛瑙之心
    .target Ban Bearheart
step
    .isOnQuest 31043
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31043 >>交出黑暗的艺术
    .target Ban Bearheart
step
    .isOnQuest 31047
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31047 >>交还“生而自由”
    .target Ban Bearheart
step
    .isOnQuest 31105
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31105 >>提交《魔古的威胁》任务
    .target Ban Bearheart
step
    .isNotOnQuest 31062,31049
    .isQuestTurnedIn 31105
    .goto 388,49.02,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .daily 31061 >>接任务: |cRXP_WARN_暴风骑士|r
    .target Ban Bearheart
step
    .isOnQuest 31062
    .goto 388,32.35,9.56
    >>击杀|cRXP_ENEMY_Shan'ze Deathspeaker|r
    .complete 31062,1 --1/1 Shan'ze Deathspeaker slain
    .mob Shan'ze Deathspeaker
step
    .isOnQuest 31049
    #completewith next
    #label DarkwoodsFaerieSlain
    >>击杀|cRXP_ENEMY_黑木妖精|r
    .complete 31049,1 --1/1 Darkwoods Faerie slain
    .mob Darkwoods Faerie
step
    .isOnQuest 31049
    #title Enter Cave
    #completewith DarkwoodsFaerieSlain
    .goto 388,20.23,15.70,6 >>进入洞窟
step
    .isOnQuest 31049
    #requires DarkwoodsFaerieSlain
    .goto 388,20.23,15.70,0
    .goto 388,19.53,13.87
    >>击杀|cRXP_ENEMY_黑木妖精|r
    .complete 31049,1 --1/1 Darkwoods Faerie slain
    .mob Darkwoods Faerie
step
    .isOnQuest 31061
    .goto 388,33.47,15.63
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击一个|cRXP_ENEMY_Shan'ze Cloudrunner|r或使用 |T134226:0|t[青铜爪]. 击杀你正在骑乘的|cRXP_ENEMY_Shan'ze Cloudrunner|r
    .complete 31061,1 --8/8 Shan'ze Cloudrider saved
    .use 83134
    .mob Shan'ze Cloudrunner
step
    .isOnQuest 31062
    .goto 388,49.01,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31062 >>交予“亡语者”
    .target Ban Bearheart
step
    .isOnQuest 31049
    .goto 388,49.01,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31049 >>交还万物之灵
    .target Ban Bearheart
step
    .isOnQuest 31061
    .goto 388,49.01,70.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
    .dailyturnin 31061 >>提交“暴风骑士”任务
    .target Ban Bearheart
]])


----------------------------
---x UNUSED
----------------------------

-- Vale Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(10-70)|r 潘达利亚混编版 
#name X) 瓦莱日常任务 1
#internal

step
    .goto 390,21.40,71.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奎·秋光|r交谈
    .accept 30266 >>接任务: |cRXP_WARN_浸血的苍穹|r
    .accept 30243 >>接任务: |cRXP_WARN_火烧螳螂|r
    .target Kun Autumnlight
step
    .goto 390,21.46,71.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安济·秋光|r交谈
    .turnin 80427,1 >>交任务: |cRXP_FRIENDLY_协助金莲教|r
    .daily 30277,30280 >>接任务: |cRXP_WARN_破败的大厅|r
    .target Anji Autumnlight
step
    #loop
    .goto 390,19.96,72.97,10,0
    .goto 390,20.49,75.10,10,0
    .goto 390,19.14,75.72,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海麦·重拳|r交谈
    .accept 30306 >>接任务: |cRXP_WARN_大竞技场|r
    .target Hai-Me Heavyhands
step
    >>击败|cRXP_ENEMY_影踪派受训者|r
    .goto 390,19.60,74.41
    .complete 30306,1 --20/20 Shado-Pan Trainees defeated
    .mob Shado-Pan Trainee
step
    .isOnQuest 30306
    #loop
    .goto 390,19.96,72.97,10,0
    .goto 390,20.49,75.10,10,0
    .goto 390,19.14,75.72,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海麦·重拳|r交谈
    .dailyturnin 30306 >>提交大竞技场
    .target Hai-Me Heavyhands
step
    .goto 390,18.49,71.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_余觅·金爪|r交谈
    .daily 30240,30242 >>接任务: |cRXP_WARN_生存之环：火焰|r
    .target Yumi Goldenpaw
step
    .isOnQuest 30242
    >>站在航点正上方
    .goto 390,19.72,67.97
    .complete 30242,1 --1/1 Live through the Survival Ring for 60 seconds
step
    .isOnQuest 30240
    >>躲避地面上的烟雾圈
    .goto 390,18.67,68.24
    .complete 30240,1 --1/1 Live through the Survival Ring for 60 seconds
step
    .isOnQuest 30240
    .goto 390,18.48,71.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_余觅·金爪|r交谈
    .dailyturnin 30240 >>交还生存之环：火焰
    .target Yumi Goldenpaw
step
    .goto 390,18.10,63.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科拉·羽足|r交谈
    .accept 30261 >>接任务: |cRXP_WARN_翻滚俱乐部：蟠龙脊|r
    .target Kelari Featherfoot
step
    .isOnQuest 30261
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科拉·羽足|r交谈
    .goto 390,18.10,63.55
    .complete 30261,1 --1/1 Speak to Kelari Featherfoot
    .skipgossipid 40305
    .target Kelari Featherfoot
step
    .isOnQuest 30261
    .goto 390,18.10,63.55,0
    .goto 390,12.46,92.44,22,0
    .goto 390,12.27,96.11,22,0
    .goto 390,11.62,99.60,22,0
    .goto 376,12.14,34.25,22,0
    .goto 376,10.28,40.08,22,0
    .goto 376,8.89,42.71,22,0
    .goto 376,8.17,44.47,22,0
    .goto 376,6.18,53.54,22,0
    .goto 376,7.19,59.14,22,0
    .goto 376,7.28,65.28,22,0
    .goto 376,7.14,69.16,22,0
    .goto 376,5.65,76.76,22,0
    .goto 376,3.75,82.85,22,0
    .goto 376,1.07,89.73,22,0
    >>通过速度增益时, 请避开油池, 除非你想故意减速
    .skipgossipid 40305
    .goto 424,39.08,78.06
    .complete 30261,2 --1/1 Serpent's Spine Roll Course finished
    .target Kelari Featherfoot
step
    .isOnQuest 30261
    .goto 390,18.10,63.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科拉·羽足|r交谈
    .dailyturnin 30261 >>提交 翻滚俱乐部：蟠龙脊
    .target Kelari Featherfoot
step
    .isOnQuest 30266
    #hidewindow
    #label KrikthikSwarmerSlain
    #completewith next
    .complete 30266,1 --30/30 Krik'thik Swarmer slain
step
    .isOnQuest 30266
    #completewith KrikthikSwarmerSlain
    #label SettingSunTurret
    .goto 390,6.63,70.26
    .vehicle 64336 >>进入|cRXP_FRIENDLY_残阳炮塔|r
step
    .isOnQuest 30266
    #requires SettingSunTurret
    >>|cRXP_WARN_使用|r|T236469:0|t[龙炮] (1)|cRXP_WARN_击杀|r|cRXP_ENEMY_ 克里克提克群蜂|r
    .goto 390,6.63,70.26
    .complete 30266,1 --30/30 Krik'thik Swarmer slain
    .mob Krik'thik Swarmer
step
    .isOnQuest 30243
    #hidewindow
    #label KrikthikHivelingSlain
    #completewith next
    .complete 30243,1 --30/30 Krik'thik Swarmer slain
step
    .isOnQuest 30243
    #completewith KrikthikHivelingSlain
    #label HotOilCauldron
    .goto 390,2.64,62.32
    .vehicle 64369 >>进入|cRXP_FRIENDLY_热油大锅|r
step
    .isOnQuest 30243
    #requires HotOilCauldron
    >>你也可以前往不同的|cRXP_FRIENDLY_热油大锅|r
    >>|cRXP_WARN_使用|r|T252176:0|t[可燃油桶] (1)|cRXP_WARN_将油倒在地面
    >>|cRXP_WARN_使用|r|T135433:0|t[影踪派火把] (2)|cRXP_WARN_在油上点燃它, 然后击杀|r|cRXP_ENEMY_克里克蒂克幼体|r
    .goto 390,2.64,62.32
    .complete 30243,1 --30/30 Krik'thik Hiveling slain
    .mob Krik'thik Hiveling
step
    .isOnQuest 30277
    #hidewindow
    #label DeactivateSpiritWall
    .complete 30277,1 --1/1 Deactivate Spirit Wall
step
    #completewith next
    .isOnQuest 30277
    .goto 395,55.60,92.17,10 >>进入郭来大厅
step
    .isOnQuest 30277
    #completewith DeactivateSpiritWall
    #label SpiritWallA
    .goto 395,47.67,80.90,15,0
    .goto 395,46.25,56.38,15,0
    .goto 395,26.83,47.25,15,0
    .goto 395,36.48,36.55
    .cast 3365 >>|TInterface/cursor/crosshair/interact.blp:20|t点击灵魂之球
step
    .isOnQuest 30277
    #completewith DeactivateSpiritWall
    #requires SpiritWallA
    #label SpiritWallB
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击灵魂之球
    .goto 395,23.16,28.83
    .cast 3365 >>|TInterface/cursor/crosshair/interact.blp:20|t点击灵魂之球
step
    .isOnQuest 30277
    #requires SpiritWallB
    >>|cRXP_WARN_查看地面上的第一个符文, 这个符文指向一个不会对你造成伤害的保险箱. 沿着这个符文找到灵魂之球|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击灵魂之球
    .goto 395,49.10,22.67
    .complete 30277,1 --1/1 Deactivate Spirit Wall
step
    .isOnQuest 30277
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_远古郭莱神器|r
    .goto 395,49.63,30.67
    .complete 30277,2 --1/1 Ancient Guo-Lau Artifact
step
    #completewith next
    .isOnQuest 30280
    .goto 395,55.60,92.17,10 >>进入郭来大厅
step
    .goto 395,47.79,80.48,15,0
    .goto 395,65.24,14.12,17,0
    .goto 395,54.75,63.21
    >>|cRXP_WARN_沿着箭头向下走. 每个符文谜题开头的第一个中心符文是安全的, 请按照这些指示行动, 以避免死亡|r
    >>|cRXP_WARN_请远离闪电区域, 否则会被一击毙命|r
    >>击杀|cRXP_ENEMY_秘烙|r
    .complete 30280,1 --1/1 Milau slain
    .mob Milau
step
    .isOnQuest 30277
    .goto 390,21.47,71.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安济·秋光|r交谈
    .dailyturnin 30277 >>交还破败的大厅
    .target Anji Autumnlight
step
    .isOnQuest 30280
    .goto 390,21.47,71.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安济·秋光|r交谈
    .dailyturnin 30280 >>提交“地底雷电”
    .target Anji Autumnlight
step
    .isOnQuest 30243
    .goto 390,21.38,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奎·秋光|r交谈
    .dailyturnin 30243 >>提交任务:火烧螳螂
    .target Kun Autumnlight
step
    .isOnQuest 30266
    .goto 390,21.38,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奎·秋光|r交谈
    .dailyturnin 30266 >>提交“浸血的苍穹”
    .target Kun Autumnlight
]])

-- Niuzao Dailies
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#name X) 奈祖奥日报
#internal


]])
