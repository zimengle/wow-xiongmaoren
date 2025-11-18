RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.2 刀锋山
#subweight 999.59
#name (一) 第1章 - 阴影的邀请
#displayname |cFF00CCFF1|r - 阴影的邀请 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ao) 第二章 - 虚空联盟

step
    #completewith next
    #label Shadowy Invitation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84956 >>提交隐秘的邀请函
    .target Locus-Walker
    .accept 84957 >>接受返回幽暗市场
    .disablecheckbox
step
    #completewith Shadowy Invitation
    .zone 2339 >>进入多尔诺加尔
step
    #requires Shadowy Invitation
    .goto 2339,42.11,26.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84956 >>提交隐秘的邀请函
    .target Locus-Walker
    .accept 84957 >>接受返回幽暗市场
    .timer 23,RP
step
    .goto 2339,40.41,22.89
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84957,1 --1/1 Follow Locus-Walker
step
    .goto 2339,40.30,22.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r
    .complete 84957,2 --1/1 Take the Spatial Rift to Tazavesh
step
    .goto 2472,59.75,83.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84957 >>提交任务:返回面纱市场
    .target Locus-Walker
step
    #hidewindow
    #completewith next
    #label Restoring Operational Efficiency
    .accept 85003 >>接受任务:恢复运营效率
step
    #completewith Restoring Operational Efficiency
    .achievementComplete 41970,4,1
    .gossipoption 134153 >>与|cRXP_FRIENDLY_Om'en|r交谈
    .target Om'en
step
    #requires Restoring Operational Efficiency
    .goto 2472,59.55,83.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'en|r交谈
    .accept 85003 >>接受任务:恢复运营效率
    .target Om'en
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ta'ka|r和|cRXP_FRIENDLY_Xy'bin|r交谈
    .accept 84958 >>接受任务:野兽挣脱束缚
    .goto 2472,56.86,73.02
    .target +Ta'ka
    .accept 85039 >>接受 compromised containment
    .goto 2472,56.64,72.88
    .target +Xy'bin
step
    .goto 2472,53.15,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴维尔|r交谈
    .accept 84959 >>接受“失落的防线”任务
    .target Ba'ver
step
    #completewith UnstableArtifactSealedB
    >>击杀|cRXP_ENEMY_不稳定的微粒|r和|cRXP_ENEMY_附魔的典籍|r和|cRXP_ENEMY_不稳定的显现|r
    .complete 85039,1 --Arcane entities destroyed (100%)
    .mob Unstable Mote
    .mob Enchanted Ledger
    .mob Unstable Manifestation
step
    #completewith UnstableArtifactSealedB
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stolen Barrier Projectors|r
    .complete 84959,1 --8/8 Stolen Barrier Projector
step
    #completewith next
    #label UnstableArtifactSealedA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unstable Artifact|r
    .complete 85039,2 --1/1 Unstable Artifact sealed
step
    #title |cFFFCDC00进入密室|r
    #completewith UnstableArtifactSealedA
    .goto 2472,56.50,52.65,12 >>进入密室
step
    #requires UnstableArtifactSealedA
    #label UnstableArtifactSealedB
    .goto 2472,59.59,46.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unstable Artifact|r
    .complete 85039,2 --1/1 Unstable Artifact sealed
step
    #completewith next
    >>击杀|cRXP_ENEMY_不稳定的微粒|r和|cRXP_ENEMY_附魔的典籍|r和|cRXP_ENEMY_不稳定的显现|r
    .complete 85039,1 --Arcane entities destroyed (100%)
    .mob Unstable Mote
    .mob Enchanted Ledger
    .mob Unstable Manifestation
step
    #completewith next
    #label StolenBarrierProjectorA
    .goto 2472,61.74,48.11,12,0
    .goto 2472,60.03,44.92,12,0
    .goto 2472,55.60,44.03,12,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stolen Barrier Projectors|r
    .complete 84959,1 --8/8 Stolen Barrier Projector
step
    #hidewindow
    #completewith StolenBarrierProjectorA
    .goto 2472,53.43,44.91,15 >>1
step
    #requires StolenBarrierProjectorA
    #hidewindow
    #completewith ArcaneEntitiesA
    #loop
    .goto 2472,52.87,51.01,18,0
    .goto 2472,53.80,54.57,18,0
    .goto 2472,56.46,54.52,18,0
    .goto 2472,57.58,56.78,18,0
    .goto 2472,53.04,57.61,18,0
    .goto 2472,50.78,54.68,18,0
    +1
step
    #requires StolenBarrierProjectorA
    #completewith next
    >>击杀|cRXP_ENEMY_不稳定的微粒|r和|cRXP_ENEMY_附魔的典籍|r和|cRXP_ENEMY_不稳定的显现|r
    .complete 85039,1 --Arcane entities destroyed (100%)
    .mob Unstable Mote
    .mob Enchanted Ledger
    .mob Unstable Manifestation
step
    #requires StolenBarrierProjectorA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stolen Barrier Projectors|r
    .complete 84959,1 --8/8 Stolen Barrier Projector
step
    #label ArcaneEntitiesA
    >>击杀|cRXP_ENEMY_不稳定的微粒|r和|cRXP_ENEMY_附魔的典籍|r和|cRXP_ENEMY_不稳定的显现|r
    .complete 85039,1 --Arcane entities destroyed (100%)
    .mob Unstable Mote
    .mob Enchanted Ledger
    .mob Unstable Manifestation
step
    #completewith next
    .goto 2472,53.42,61.39,0,0
    +|cRXP_WARN_你可以在这里飞行|r. 如果不行, 请使用传送门
step
    .goto 2472,53.08,64.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴维尔|r交谈
    .turnin 84959 >>提交丢失的防线
    .complete 85003,2 --1/1 Ba'ver assisted
    .target Ba'ver
step
    #completewith next
    .goto 2472,57.60,72.84,0,0
    >>|cRXP_WARN_你可以在这里飞行|r. 如果不行, 请使用传送门
    .complete 84958,1 --1/1 Take the access to the overlook (Optional)
step
    #loop
    .goto 2472,62.71,59.51,30,0
    .goto 2472,66.38,77.05,40,0
    .goto 2472,51.43,86.23,40,0
    .goto 2472,42.70,70.01,40,0
    >>击杀|cRXP_ENEMY_Escaped Creatures|r
    .complete 84958,2 --8/8 Escaped creatures recovered
    .mob Escaped Creature
step
    #completewith next
    #label CompromisedUnboundA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xy'bin|r和|cRXP_FRIENDLY_Ta'ka|r交谈
    .turnin 85039 >>提交受损的封存
    .complete 85003,1 --1/1 Xy'bin assisted
    .target +Xy'bin
    .turnin 84958 >>交还“挣脱束缚的野兽”
    .complete 85003,3 --1/1 Ta'ka assisted
    .target +Ta'ka
step
    #completewith next
    +进入房间
    .goto 2472,57.37,75.58,-1
    .goto 2472,56.14,71.13,-1
step
    #completewith CompromisedUnboundA
    #hidewindow
    .goto 2472,56.74,72.97,30 >>1
step
    #requires CompromisedUnboundA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xy'bin|r和|cRXP_FRIENDLY_Ta'ka|r交谈
    .turnin 85039 >>提交受损的封存
    .complete 85003,1 --1/1 Xy'bin assisted
    .goto 2472,56.65,72.84,-1
    .target +Xy'bin
    .turnin 84958 >>交还“挣脱束缚的野兽”
    .complete 85003,3 --1/1 Ta'ka assisted
    .goto 2472,56.86,72.99,-1
    .target +Ta'ka
step
    .goto 2472,59.45,83.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'en|r交谈
    .turnin 85003 >>提交任务:恢复运营效率
    .target Om'en
step
    .goto 2472,59.74,83.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .accept 84960 >>接任务: |cRXP_WARN_黑暗之兽|r Among Us
    .target Locus-Walker
step
    .goto 2472,54.81,66.26
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Presence|r
    .complete 84960,1 --1/1 Investigate the Void Presence
step
    .goto 2472,47.81,63.46
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84960,2 --1/1 Locate the source
step
    .goto 2472,47.43,65.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .complete 84960,3 --1/1 Speak to Locus-Walker
    .target Locus-Walker
    .skipgossipid 131268
step
    .goto 2472,47.43,65.77
    >>击杀3波|cRXP_ENEMY_Shadowguard Infiltrators|r和|cRXP_ENEMY_Nyz'raal the Umbral Blade|r
    .complete 84960,4 --1/1 Infiltrator's defeated
    .mob Shadowguard Infiltrator
    .mob Nyz'rall the Umbral Blade
step
    #completewith next
    #label DarknessAmongUsA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'en|r交谈
    .turnin 84960 >>交任务: |cRXP_FRIENDLY_黑暗之兽|r Among Us
    .accept 84966 >>接受突破进攻
    .target Om'en
step
    #title |cFFFCDC00离开房间|r
    #completewith DarknessAmongUsA
    .goto 2472,48.05,62.88,10 >>离开房间
step
    #requires DarknessAmongUsA
    .goto 2472,54.06,63.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'en|r交谈
    .turnin 84960 >>交任务: |cRXP_FRIENDLY_黑暗之兽|r Among Us
    .accept 84966 >>接受突破进攻
    .target Om'en
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧恩|r和|cRXP_FRIENDLY_艾莉娅·风行者|r和|cRXP_FRIENDLY_洛库斯-沃克|r交谈
    .accept 84963 >>接受封印暗影
    .goto 2472,54.08,63.68,-1
    .target +Om'en
    .accept 84964 >>接受阴影中的英雄
    .goto 2472,53.76,63.24,-1
    .target +Alleria Windrunner
    .accept 84961 >>接受进入障碍
    .goto 2472,54.17,63.09,-1
    .target +1Locus-Walker
step
    -- https://i.imgur.com/sYulo55.png (Minimap screenshot of Citizens (green), Projectors (blue))
    #completewith SaturatedEntropicCores
    #hidewindow
    #loop
    .goto 2472,49.92,57.97,15,0
    .goto 2472,46.03,51.34,15,0
    .goto 2472,41.39,49.02,15,0
    .goto 2472,40.09,51.51,15,0
    .goto 2472,39.47,41.84,15,0
    .goto 2472,44.43,40.35,18,0
    .goto 2472,44.44,36.23,15,0
    .goto 2472,58.33,32.69,15,0
    .goto 2472,55.74,38.38,18,0
    .goto 2472,51.36,41.17,15,0
    .goto 2472,53.59,40.69,18,0
    .goto 2472,53.23,44.12,18,0
    .goto 2472,52.49,46.77,15,0
    .goto 2472,49.85,58.03,15,0
    +1
step
    #completewith next
    >>击杀|r|cRXP_ENEMY_暗影守卫|r的部队. 从他们身上搜刮出|r|T4037125:0|t[|cRXP_LOOT_饱和熵核|r]
    .complete 84963,1 --5/5 Saturated Entropic Core
    .mob Shadowguard Duskwalker
    .mob Shadowguard Darkweaver
    .mob Shadowguard Voidripper
step
    -- There are exactly 8 projectors and there are enough citizens on the loop
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Barrier Projectors|r和|cRXP_FRIENDLY_Tazavesh Citizens|r
    .complete 84964,1 --8/8 Tazavesh Civilians rescued
    .complete 84961,1 --8/8 Barrier Projector placed
    .target Tazavesh Citizen
step
    #label SaturatedEntropicCores
    >>击杀|r|cRXP_ENEMY_暗影守卫|r的部队. 从他们身上搜刮出|r|T4037125:0|t[|cRXP_LOOT_饱和熵核|r]
    .complete 84963,1 --5/5 Saturated Entropic Core
    .mob Shadowguard Duskwalker
    .mob Shadowguard Darkweaver
    .mob Shadowguard Voidripper
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与身旁的|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 84964 >>提交任务:阴影中的英雄
    .turnin 84961 >>提交“进入障碍”
    .turnin 84963 >>提交“封印暗影”
    .accept 84965 >>接受岩核贡献
    .target Alleria Windrunner
step
    -- https://i.imgur.com/t9Ek1fB.png (Guardian position + 循环, 也许可以将循环改为只前往屋顶上的守护者处
    #loop
    .goto 2472,48.91,51.99,12,0
    .goto 2472,47.48,57.16,12,0
    .goto 2472,44.02,56.05,12,0
    .goto 2472,39.10,54.79,12,0
    .goto 2472,38.44,54.12,12,0
    .goto 2472,39.43,49.49,12,0
    .goto 2472,42.79,45.97,12,0
    .goto 2472,44.61,47.68,12,0
    .goto 2472,51.25,50.05,12,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Market Guardians|r
    .complete 84965,1 --5/5 Guardians activated
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与身旁的|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 84965 >>提交岩芯贡献
    .accept 86835 >>接任务: |cRXP_WARN_重组！|r
    .target Alleria Windrunner
step
    .goto 2472,40.53,67.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 86835 >>交任务: |cRXP_FRIENDLY_重组！|r
    .accept 84967 >>接受暗影守卫的破碎任务
    .target Locus-Walker
step
    #completewith next
    #label ShadowlordAlzarA
    >>击杀|cRXP_ENEMY_Shadowlord Al'zar|r
    .complete 84967,1 --1/1 Shadowlord Al'zar slain
    .mob Shadowlord Al'zar
step
    #completewith ShadowlordAlzarA
    #title |cFFFCDC00进入Boss房间|r
    .goto 2472,39.03,67.82,8 >>进入Boss房间
step
    #requires ShadowlordAlzarA
    .goto 2472,36.34,74.69
    >>击杀|cRXP_ENEMY_Shadowlord Al'zar|r
    .complete 84967,1 --1/1 Shadowlord Al'zar slain
    .mob Shadowlord Al'zar
step
    .goto 2472,37.80,74.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84967 >>交出《暗影守卫之碎》
    .target Locus-Walker
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.2 刀锋山
#name ao) 第二章 - 虚空联盟
#displayname |cFF00CCFF2|r - 虚空同盟 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AP) 第3章 - 沙漠之力

step
    .goto 2472,37.68,74.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .accept 85032 >>接受残存的家园
    .target Locus-Walker
step
    #completewith next
    #label TalkToInkeeperA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_客栈老板|r交谈
    .complete 85032,1 --1/1 Talk to the Innkeeper
    .target the Innkeeper
step
    #completewith next
    #title |cFFFCDC00离开这所房子|r
    .goto 2472,38.80,69.82,10,0
    .goto 2472,40.66,70.56,10,0
    .goto 2472,39.12,67.59,10,0
    .goto 2472,40.82,65.83,10 >>离开这所房子
step
    #hidewindow
    #completewith next
    .goto 2472,40.82,65.83,10 >>1
step
    #hidewindow
    #completewith TalkToInkeeperA
    .goto 2472,41.12,25.09,120 >>1
step
    #requires TalkToInkeeperA
    #completewith next
    #label TalkToInkeeperB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_客栈老板|r交谈
    .complete 85032,1 --1/1 Talk to the Innkeeper
    .target the Innkeeper
step
    #completewith next
    #title |cFFFCDC00进入房屋|r
    .goto 2472,42.71,31.57,10 >>进入房屋
step
    #hidewindow
    #completewith TalkToInkeeperB
    .goto 2472,41.12,25.09,50 >>1
step
    #requires TalkToInkeeperB
    .goto 2472,41.12,25.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ba'orr|r交谈
    .complete 85032,1 --1/1 Talk to the Innkeeper
    .target Ba'orr
    .skipgossipid 133203
    .skipgossipid 133205
    .skipgossipid 133223
step
    .goto 2472,40.62,29.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'sirik|r交谈
    .complete 85032,3 --1/1 Talk to the Quartermaster
    .target Om'sirik
    .skipgossipid 133225
step
    #completewith next
    #label TalkToFlightMasterA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Flight Master|r|c飞行大师交谈
    .complete 85032,4 --1/1 Talk to the Flight Master
    .target the Flight Master
step
    #completewith next
    #title |cFFFCDC00离开大厅|r
    .goto 2472,39.10,18.53,10 >>离开大厅
step
    #completewith TalkToInkeeperA
    #hidewindow
    .goto 2472,34.76,9.96,50 >>1
step
    #requires TalkToFlightMasterA
    .goto 2472,34.75,10.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行大师|r交谈
    .complete 85032,4 --1/1 Talk to the Flight Master
    .target the Flight Master
    .skipgossipid 133617
step
    .goto 2472,33.97,10.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 85032 >>上交家园残余物
    .accept 85961 >>接受移动兵卒
    .target Locus-Walker
step
    .goto 2371,48.23,36.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 85961 >>提交任务:移动兵卒
    .accept 84855 >>接受死寂
    .target Locus-Walker
step
    .goto 2371,48.28,39.21
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Lo'shah|r
    .complete 84855,1 --1/1 Scout Lo'shah found
    .target Lo'shah
step
    .goto 2371,49.43,36.78
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Yanhal|r
    .complete 84855,2 --1/1 Scout Yanhal found
    .target Yanhal
step
    .goto 2371,50.68,35.14
    >>击杀 |cRXP_ENEMY_Raz'ida|r
    .complete 84855,3 --1/1 Scout Raz'ida found
    .mob Raz'ida
step
    .goto 2371,48.19,36.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84855 >>提交任务:死寂
    .accept 86495 >>接受雷斯希丝带
    .target Locus-Walker
step
    .goto 2371,48.25,36.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .complete 86495,2 --1/1 Alleria convinced
    .target Alleria Windrunner
    .skipgossipid 132007
    .skipgossip 233945,1
step
    .goto 2371,48.20,36.58
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Locus-行者瑞希的丝带|r
    .complete 86495,3 --1/1 Locus-Walker's Reshii Ribbon acquired
step
    .goto 2371,48.18,36.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 86495 >>交还雷斯希丝带
    .accept 84856 >>接受“虚空聚集之处”任务
    .target Xal'atath
step
    .goto 2371,48.18,36.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .complete 84856,1 --1/1 Talk to Xal'atath
    .target Xal'atath
    .skipgossipid 131527
step
    #title |cFFFCDC00Avoid the Void Revealer|r
    .goto 2371,47.21,21.03,15,0
    .goto 2371,46.20,20.73,12,0
    .goto 2371,45.89,20.06,15,0
    .goto 2371,45.24,19.92
    >>使用 |T6654410:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 84856,2 --1/1 Conduit examined
step
    #title |cFFFCDC00Avoid the Void Revealer|r
    .goto 2371,44.12,21.60,20,0
    .goto 2371,42.74,22.15,20,0
    .goto 2371,42.62,22.63
    >>使用 |T6654410:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 84856,3 --1/1 Manaforge entrance examined
    .timer 30,RP
    -- Fix RP Duration
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r和|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84856 >>交还“虚空聚集之处”
    .goto 2371,48.17,36.64
    .target +Xal'atath
    .accept 84857 >>接受生态穹顶:Primus
    .goto 2371,48.19,36.55
    .target +Locus-Walker
step
    .goto 2371,47.08,54.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84857 >>提交Eco-Dome: Primus
    .target Locus-Walker
step
    .goto 2371,47.13,54.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .accept 84858 >>接受系统重启
    .target Ve'nari
step
    .goto 2371,46.20,57.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师 Om'loof|r交谈
    .complete 84858,1 --1/1 Speak to Engineer Om'loof
    .target Engineer Om'loof
    .skipgossipid 125374
step
    .goto 2371,46.23,57.30
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|r|cRXP_PICK_Rod参数|r
    .complete 84858,2 --1/1 Rod of Parameters used
step
    .goto 2371,46.25,57.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_分析之杆|r
    .complete 84858,3 --1/1 Rod of Analysis used
step
    .goto 2371,47.18,58.59
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_分析之杆|r
    .complete 84858,4 --1/1 Rod of Analysis acquired
step
    .goto 2371,46.26,57.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_分析之杆|r
    .complete 84858,5 --1/1 Rod of Analysis replaced
step
    .goto 2371,46.26,56.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_重启杆|r
    .complete 84858,6 --1/1 Rod of Restart used
step
    .goto 2371,47.13,54.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 84858 >>提交:系统重启
    .accept 84859 >>接受伤害报告101
    .accept 84860 >>接受生态稳定任务
    .target Ve'nari
step
    .goto 2371,48.42,53.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'nittar|r交谈
    .complete 84859,1 --1/1 Botanist Om'nittar found
    .target Om'nittar
step
    #loop
    .goto 2371,48.74,53.14,12,0
    .goto 2371,48.68,53.90,15,0
    .goto 2371,48.74,53.14,12,0
    .goto 2371,48.21,52.98,12,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Void Creeper|r
    .complete 84859,2 --6/6 Void Creepers dealt with
    .target Void Creeper
step
    .goto 2371,48.42,53.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'nittar|r交谈
    .complete 84859,3 --1/1 Botanic report received
    .target Om'nittar
    .skipgossipid 125356
step
    .goto 2371,49.19,54.48
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Shadowguard 设备|r
    .complete 84860,1 --1/1 Biome Z-22 stabilized
step
    .goto 2371,50.01,56.50
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制台 V-37|r
    .complete 84860,2 --1/1 Biome V-37 stabilized
    .skipgossipid 131301
step
    #completewith next
    #label BiomeD28A
    #hidewindow
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Rod of Activation|r
    .complete 84860,3 --1/1 Biome D-28 stabilized
step
    .isOnQuest 84860
    #completewith BiomeD28A
    .goto 2371,48.84,59.03
    .cast 1233199 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Rod of Activation|r
step
    #requires BiomeD28A
    .goto 2371,48.80,59.08
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Rod of Activation|r
    .complete 84860,3 --1/1 Biome D-28 stabilized
step
    .goto 2371,46.05,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'door|r交谈
    .complete 84859,4 --1/1 Technician Om'door found
    .target Om'door
    .skipgossipid 131437
step
    #loop
    .goto 2371,45.88,57.84,18,0
    .goto 2371,46.66,59.21,18,0
    >>使用 |T4914669:0|t[|cRXP_WARN_额外动作按钮|r] 并瞄准|cRXP_PICK_虚空孢子|r
    *|cRXP_WARN_If you don't have the ExtraActionButton then talk to |cRXP_FRIENDLY_Om'door|r again|r
    .complete 84859,5 --8/8 Void Spores collected
    .skipgossipid 131437
step
    .goto 2371,46.05,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'door|r交谈
    .complete 84859,6 --1/1 Technician report received
    .target Om'door
    .skipgossipid 125353
step
    .goto 2371,47.11,54.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 84860 >>提交《生态稳定化101》
    .turnin 84859 >>上交伤害报告101
    .accept 84861 >>接受任务:这是我们的穹顶！
    .target Ve'nari
step
    .goto 2371,47.09,54.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .accept 84862 >>接受虚空联盟
    .target Xal'atath
step
    #completewith DefenseMatricesPlacedA
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84861,1 --7/7 Shadowguard forces slain
    .mob Shadowguard forces
step
    .goto 2371,50.45,54.15
    #title Matrix placed (1/4)
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Defense Matrix|r
    .complete 84862,1,1 --1/4 Defense Matrices placed
step
    .goto 2371,51.00,56.34
    #title Matrix placed (2/4)
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Defense Matrix|r
    .complete 84862,1,2 --2/4 Defense Matrices placed
step
    .goto 2371,50.29,58.83
    #title Matrix placed (3/4)
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Defense Matrix|r
    .complete 84862,1,3 --3/4 Defense Matrices placed
step
    #label DefenseMatricesPlacedA
    .goto 2371,49.29,60.53
    #title Matrix placed (4/4)
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Defense Matrix|r
    .complete 84862,1 --4/4 Defense Matrices placed
step
    #loop
    .goto 2371,50.20,61.98,35,0
    .goto 2371,51.31,55.93,35,0
    .goto 2371,50.50,53.12,35,0
    .goto 2371,51.31,55.93,35,0
    >>击杀|cRXP_ENEMY_Shadowguard forces|r. |cRXP_WARN_其中很多是隐形的|r
    .complete 84861,1 --7/7 Shadowguard forces slain
    .mob Shadowguard Saboteur
    .mob Shadowguard Scout
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r和|cRXP_FRIENDLY_Xal'atath|r交谈
    .turnin 84861 >>交出任务“这是我们的穹顶！”
    .goto 2371,47.13,54.56
    .target +Ve'nari
    .turnin 84862 >>提交给虚空联盟
    .accept 84865 >>接受“分而治之”
    .accept 84864 >>接受她的黑暗面
    .goto 2371,47.09,54.60
    .target +Xal'atath
    .accept 84863 >>接受反制措施
    .goto 2371,47.13,54.56
    .target +Ve'nari
step
    #completewith EtherealConsoleOverloadedA
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84863,1 --12/12 Shadowguard forces eliminated
    .mob Shadowguard Speardancer
    .mob Shadowguard Voidblade
    .mob Shadowguard Riftcaller
step
    #completewith EtherealConsoleOverloadedA
    >>使用 |T5976941:0|t[|cRXP_WARN_额外行动按钮|r] 并将其瞄准|cRXP_PICK_暗影守卫加农炮|r
    .complete 84865,1 --3/3 Shadowguard Cannons destroyed
step
    .goto 2371,54.10,48.13
    >>在航点位置使用 |T4913234:0:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 84864,1 --1/1 Ethereal Siphon Barrier removed
    -- TODO: Add RP timer
step
    #label EtherealConsoleOverloadedA
    .goto 2371,54.10,48.13
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ethereal Siphon Console|r
    .complete 84864,2 --1/1 Ethereal Siphon Console overloaded
step
    #completewith next
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84863,1 --12/12 Shadowguard forces eliminated
    .mob Shadowguard Speardancer
    .mob Shadowguard Voidblade
    .mob Shadowguard Riftcaller
step
    #loop
    .goto 2371,54.52,50.42,25,0
    .goto 2371,52.53,49.75,25,0
    .goto 2371,52.30,48.08,25,0
    >>使用 |T5976941:0|t[|cRXP_WARN_额外行动按钮|r] 并将其瞄准|cRXP_PICK_暗影守卫加农炮|r
    .complete 84865,1 --3/3 Shadowguard Cannons destroyed
step
    #loop
    .goto 2371,53.67,45.18,35,0
    .goto 2371,54.44,50.84,35,0
    .goto 2371,52.58,50.18,35,0
    .goto 2371,52.12,47.58,35,0
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84863,1 --12/12 Shadowguard forces eliminated
    .mob Shadowguard Speardancer
    .mob Shadowguard Voidblade
    .mob Shadowguard Riftcaller

step
    .goto 2371,54.47,46.95,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾利亚·风行者|r |cRXP_WARN_就在你身边|r 交谈
    .turnin 84863 >>提交反制措施
    .turnin 84865 >>提交“分而治之”
    .turnin 84864 >>提交任务“她的黑暗面”
    .accept 84866 >>接受购买安全保护
    .target Alleria Windrunner
step
    .goto 2371,54.48,46.63
    >>击杀|cRXP_ENEMY_Shadow-Captain Lakheesh|r
    .complete 84866,1 --1/1 Shadow-Captain Lakheesh slain
    .mob Shadow-Captain Lakheesh
step
    .goto 2371,54.27,45.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 84866 >>交任务以购买安全
    .accept 86946 >>接受未包装且未解开的物品
    .target Xal'atath
step
    .goto 2371,47.07,54.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .complete 86946,1 --1/1 Find Alleria in Eco-Dome Primus
    .skipgossipid 132658
step
    .goto 2371,47.12,54.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 86946 >>上交未拆封且未解开的
    .accept 90517 >>接受我的那一份交易
    .target Ve'nari
step
    .goto 2371,47.12,54.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Ve'nari's Reshii Ribbon|r
    .complete 90517,1 --1/1 Ve'nari's Reshii Ribbon acquired
step
    .goto 2371,47.12,54.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 90517 >>提交我的那一部分交易
    .target Ve'nari
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.2 刀锋山
#name AP) 第3章 - 沙漠之力
#displayname |cFF00CCFF3|r - 沙漠之力 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next aq) 第4章 - 黑影之锋

step
    .goto 2371,47.08,54.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .accept 84826 >>接受生态穹顶:罗凡
    .target Locus-Walker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r和|cRXP_FRIENDLY_Om'resh|r交谈
    .turnin 84826 >>提交Eco-Dome: Rhovan
    .accept 84827 >>接受破碎的穹顶
    .goto 2371,70.94,58.11
    .target +Locus-Walker
    .accept 84831 >>接受罗凡的侵扰
    .goto 2371,70.98,58.04
    .target +Om'resh
step
    #completewith DaggerCollectedA
    >>杀死该区域内的|cRXP_ENEMY_creatures|r
    .complete 84831,1 --10/10 Invasive creatures slain
    .mob Void-touched Hoppling
    .mob Void-touched Hopper
    .mob Death Scavenger
step
    .goto 2371,70.88,54.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Om'Bera's Clipboard|r
    .complete 84827,1 --1/1 Clue found
step
    .goto 2371,69.99,53.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Om'bera|r
    .complete 84827,2 --1/1 Om'bera found
step
    #label DaggerCollectedA
    .goto 2371,69.99,53.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_弧形匕首|r
    .complete 84827,3 --1/1 Dagger collected
step
    #loop
    .goto 2371,70.60,51.67,24,0
    .goto 2371,68.94,52.20,30,0
    .goto 2371,69.20,55.04,35,0
    .goto 2371,71.59,54.20,32,0
    >>杀死该区域内的|cRXP_ENEMY_creatures|r
    .complete 84831,1 --10/10 Invasive creatures slain
    .mob Void-touched Hoppling
    .mob Void-touched Hopper
    .mob Death Scavenger
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r和|cRXP_FRIENDLY_Om'resh|r交谈
    .turnin 84827 >>提交“破碎的穹顶”
    .goto 2371,70.94,58.10
    .target +Locus-Walker
    .turnin 84831 >>提交“罗万虫害”
    .accept 85730 >>接受收集残余物品
    .goto 2371,70.98,58.05
    .target +Om'resh
step
    #loop
    .goto 2371,67.00,57.66,14,0
    .goto 2371,66.39,58.17,14,0
    .goto 2371,65.81,58.58,14,0
    .goto 2371,65.69,57.09,14,0
    .goto 2371,65.26,57.06,14,0
    .goto 2371,65.22,56.16,14,0
    .goto 2371,64.94,55.01,14,0
    .goto 2371,64.98,52.10,14,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stolen Research 箱子|r
    .complete 85730,1 --5/5 Stolen Research Crate
step
    .goto 2371,68.57,53.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stolen Research 箱子|r
    *|cRXP_WARN_You will be attacked by 3 |cRXP_ENEMY_Wastelander Assassins|r
    .complete 85730,2 --1/1 Stolen Crates returned
step
    #completewith next
    #hidewindow
    .gossipoption 131611 >>1
    .timer 29,RP
step
    .goto 2371,68.54,53.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .complete 85730,3 --1/1 Talk to Locus-Walker
    .target Locus-Walker
step
    .goto 2371,68.48,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'resh|r交谈
    .turnin 85730 >>上交残骸 salvage 所剩之物
    .target Om'resh
step
    .goto 2371,68.41,51.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .accept 86327 >>接受风暴之地
    .target Xal'atath
step
    .goto 2371,64.11,47.00
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 86327,2 --Meet Xal'atath at the Tempest Fields
step
    .goto 2371,64.11,47.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 86327 >>提交任务“风暴之地”
    .accept 84834 >>接受泰匹斯特裂隙
    .accept 84869 >>接受狩猎任务:玻璃上的猎物
    .target Xal'atath
step
    #completewith next
    >>击杀|cRXP_ENEMY_虚空恐魔|r
    .complete 84869,1 --4/4 Void Terror slain
    .complete 84869,2 --8/8 Unreal Observer slain
    .mob Void Terror
    .mob Unreal Observer
step
    #loop
    .goto 2371,63.82,48.49,14,0
    .goto 2371,63.03,47.47,14,0
    .goto 2371,63.29,47.11,14,0
    .goto 2371,64.29,45.75,14,0
    .goto 2371,64.07,44.54,14,0
    .goto 2371,64.86,44.89,14,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Clefts|r
    .complete 84834,1 --6/6 Void Cleft Essence
step
    #loop
    .goto 2371,68.03,40.15,40,0
    .goto 2371,64.49,44.76,40,0
    .goto 2371,63.60,48.60,40,0
    .goto 2371,63.72,43.52,40,0
    .goto 2371,62.01,40.35,40,0
    .goto 2371,64.49,44.76,40,0
    >>击杀|cRXP_ENEMY_虚空恐魔|r
    .complete 84869,1 --4/4 Void Terror slain
    .complete 84869,2 --8/8 Unreal Observer slain
    .mob Void Terror
    .mob Unreal Observer
step
    .goto 2371,64.12,47.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 84869 >>提交泰匹斯特裂隙
    .turnin 84834 >>提交泰匹斯特裂隙
    .accept 84838 >>接受“敌人的敌人”
    .target Xal'atath
step
    .goto 2371,61.02,38.90
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Void Clefts|r
    >>击杀|cRXP_ENEMY_Zagithav|r
    .complete 84838,1 --1/1 Coalesced void energy placed (Optional)
    .complete 84838,2 --1/1 Zagithav slain
    .mob Zagithav
step
    .goto 2371,61.25,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵魂书写者|r交谈
    .complete 84838,3 --1/1 Talk to Soul-Scribe
    .target Soul-Scribe
    .skipgossipid 132980
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂抄写者|cRXP_FRIENDLY_Soul-Scribe|r和沙拉塔斯|cRXP_FRIENDLY_Xal'atath|r交谈
    .turnin 84838 >>交出敌人的敌人
    .goto 2371,61.26,39.32
    .target +Soul-Scribe
    .accept 84848 >>在虚空降临前接受
    .goto 2371,61.28,39.28
    .target +Xal'atath
step
    .goto 2371,61.26,39.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灵魂书写者|r交谈
    .complete 84848,1 --1/1 Dagger returned
    .target Soul-Scribe
step
    .goto 2371,61.28,39.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r交谈
    .complete 84848,2 --1/1 Talk to Xal'atath
    .target Xal'atath
    .skipgossipid 125430
step
    .goto 2371,63.18,38.96
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84848,3 --Meet Xal'atath in the upper camp
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r和|cRXP_FRIENDLY_Xal'atath|r交谈
    .turnin 84848 >>在虚空降临前提交
    .goto 2371,63.18,38.96
    .target +Soul-Scribe
    .accept 84867 >>接受任务:追踪追踪者
    .goto 2371,63.13,39.01
    .target +Xal'atath
step
    .goto 2371,61.01,39.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉瑟|r交谈
    .complete 84867,1 --1/1 Speak to Narathe
    .target Narathe
    .skipgossipid 124848
step
    .goto 2371,61.05,39.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉瑟|r交谈
    .accept 86332 >>接受力量分配
    .target Narathe
step
    #completewith next
    .aura 467420,1 >>|TInterface/cursor/crosshair/interact.blp:20|t击败一个|cRXP_ENEMY_Escaped Stalker|r, 然后点击它
    .mob Escaped Stalker
step
    #loop
    .goto 2371,60.38,44.77,14,0
    .goto 2371,59.55,45.43,14,0
    .goto 2371,60.80,45.59,14,0
    .goto 2371,61.97,46.41,14,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Power Harvester|r
    .complete 86332,1 --4/4 Energy collected
step
    #completewith next
    #hidewindow
    #label BringStalkerToZabtaA
    .complete 84867,3 --1/1 Bring a stalker to Zabta
step
    #completewith BringStalkerToZabtaA
    .isOnQuest 84867
    #loop
    .goto 2371,59.92,44.82,35,0
    .goto 2371,61.93,46.81,35,0
    .goto 2371,67.21,36.89,35,0
    .goto 2371,64.21,37.74,35,0
    .aura 467420,1 >>|TInterface/cursor/crosshair/interact.blp:20|t击败一个|cRXP_ENEMY_Escaped Stalker|r, 然后点击它
    .mob Escaped Stalker
step
    #requires BringStalkerToZabtaA
    .goto 2371,61.04,43.65
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84867,3 --1/1 Bring a stalker to Zabta
step
    #loop
    .goto 2371,60.70,42.97,12,0
    .goto 2371,63.88,42.41,12,0
    .goto 2371,61.57,40.57,12,0
    .goto 2371,62.07,39.20,12,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_空箱子|r
    .complete 86332,2 --4/4 Crates charged
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r和|cRXP_FRIENDLY_Xal'atath|r交谈
    .turnin 84867 >>提交“权力分配”任务
    .turnin 86332 >>提交“权力分配”任务
    .goto 2371,63.18,38.96
    .target +Soul-Scribe
    .accept 84876 >>接受绿洲任务
    .goto 2371,63.13,39.01
    .target +Xal'atath
step
    .goto 2371,73.67,38.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥姆拉朱拉|r交谈
    .complete 84876,1 --1/1 Report to Om'rajula at the Oasis
    .target Om'rajula
    .skipgossipid 131494
step
    .goto 2371,75.81,34.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'talad|r交谈
    .turnin 84876 >>提交绿洲
    .target Om'talad
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r和|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .accept 84879 >>接受任务:重燃希望
    .goto 2371,75.88,34.18,-1
    .target +Xal'atath
    .accept 84883 >>接受卡雷什的任务
    .goto 2371,75.83,34.29,-1
    .target +Soul-Scribe
step
    #completewith HeartspringWaterA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_侵入蠕虫卵|r和 |cRXP_PICK_虚空裂痕|r
    .complete 84879,1 --Dome cleansed (100%)
step
    #completewith HeartspringWaterA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Zaranit Buds|r
    .complete 84883,1 --6/6 Zaranit Bud
step
    #label HeartspringWaterA
    .goto 2371,76.78,30.12
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Rippling Wellspring|r
    .complete 84883,2 --1/1 Heartspring Water
step
    -- https://i.imgur.com/24Fjv7C.png
    #completewith DomeCleansedA
    #hidewindow
    #loop
    .goto 2371,76.27,30.25,25,0
    .goto 2371,74.78,28.59,30,0
    .goto 2371,73.69,28.88,30,0
    .goto 2371,73.06,29.80,30,0
    .goto 2371,71.82,31.21,30,0
    .goto 2371,74.30,31.13,40,0
    .goto 2371,73.03,32.49,30,0
    .goto 2371,73.07,36.65,30,0
    .goto 2371,75.50,36.19,40,0
    .goto 2371,74.88,34.11,30,0
    .goto 2371,75.69,32.65,30,0
    .goto 2371,77.07,31.44,30,0
    +1
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_侵入蠕虫卵|r和 |cRXP_PICK_虚空裂痕|r
    .complete 84879,1 --Dome cleansed (100%)
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Zaranit Buds|r
    .complete 84883,1 --6/6 Zaranit Bud
step
    #label DomeCleansedA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_侵入蠕虫卵|r和 |cRXP_PICK_虚空裂痕|r
    *|cRXP_WARN_Don't mount up until the portal is destroyed|r
    .complete 84879,1 --Dome cleansed (100%)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xal'atath|r和|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .turnin 84879 >>交还希望
    .goto 2371,75.88,34.18
    .target +Xal'atath
    .turnin 84883 >>交还卡雷什的那一个
    .accept 84910 >>接受塔比卡任务
    .goto 2371,75.83,34.29
    .target +Soul-Scribe
step
    .goto 2371,74.39,30.43
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84910,1 --Meet Soul-Scribe by the water
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击桌上的|cRXP_PICK_花瓣和花粉|r和|cRXP_PICK_Vial|r和|cRXP_PICK_Tabiqa Dagger|r
    .complete 84910,2 --1/1 Pollen and petals placed
    .goto 2371,74.40,30.51,-1
    .complete 84910,3 --1/1 Vial of water placed
    .goto 2371,74.38,30.50,-1
    .complete 84910,4 --1/1 Ritual dagger placed
    .goto 2371,74.37,30.51,-1
step
    .goto 2371,74.39,30.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .complete 84910,5 --1/1 Talk to Soul-Scribe
    .target Soul-Scribe
    .skipgossipid 125067
step
    .goto 2371,74.39,30.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .turnin 84910 >>交出塔比卡
    .target Soul-Scribe
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.2 刀锋山
#name aq) 第4章 - 黑影之锋
#displayname |cFF00CCFF4|r - 暗影卫戍 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ar) 第五章 - 卡雷什之光
#internal

step
    .goto 2371,74.39,30.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .accept 84896 >>接受下一个维度
    .target Soul-Scribe
step
    .goto 2371,75.88,33.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shad'anis|r交谈
    .accept 89380 >>接受另一个世界
    .target Shad'anis
step
    .goto 2371,60.24,29.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Soul-Scribe|r交谈
    .turnin 84896 >>提交《下一个维度》
    .accept 84897 >>接任务: |cRXP_WARN_风暴前的平静|r we Storm
    .target Soul-Scribe
step
    .goto 2371,60.74,27.94
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84897,1 --Approach Alleria
step
    .goto 2371,60.74,27.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alleria|r交谈
    .complete 84897,2 --1/1 Speak with Alleria
    .target Alleria
    .skipgossipid 133244
step
    .goto 2371,60.61,27.70
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Wounded Riftwalker|r
    .complete 84897,4 --1/1 Heal the Wounded Riftwalker
    .skipgossipid 132242
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂抄写者|cRXP_FRIENDLY_Soul-Scribe|r和艾莉亚·风行者|cRXP_FRIENDLY_Alleria Windrunner|r交谈
    .turnin 84897 >>交任务: |cRXP_FRIENDLY_风暴前的平静|r we Storm
    .accept 84898 >>接受卡雷什之沙
    .goto 2371,60.68,28.00
    .target +Soul-Scribe
    .accept 84899 >>接任务: |cRXP_WARN_暗影守卫|r Diffusion
    .goto 2371,60.74,27.94
    .target +Alleria Windrunner
step
    #completewith next
    >>击杀|cRXP_ENEMY_Shadowguard 相位刃|r和|cRXP_ENEMY_Shadowguard 大师|r和|cRXP_ENEMY_Shadowguard 虚空召唤者|r
    .complete 84899,1 --6/6 Shadowguard Phaseblade slain
    .mob +Shadowguard Phaseblade
    .complete 84899,2 --6/6 Shadowguard Adept slain
    .mob +Shadowguard Adept
    .complete 84899,3 --3/3 Shadowguard Voidtamer slain
    .mob +Shadowguard Voidtamer
step
    #loop
    .goto 2371,59.12,28.51,6,0
    .goto 2371,58.68,29.54,6,0
    .goto 2371,58.34,26.30,6,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t在靠近其位置后, 点击出现的|cRXP_PICK_Sand Piles|r
    .complete 84898,1 --3/3 Shadowguard Weapons
step
    #loop
    .goto 2371,57.74,31.33,35,0
    .goto 2371,61.50,26.58,40,0
    .goto 2371,58.54,25.69,40,0
    >>击杀|cRXP_ENEMY_Shadowguard 相位刃|r和|cRXP_ENEMY_Shadowguard 大师|r和|cRXP_ENEMY_Shadowguard 虚空召唤者|r
    .complete 84899,1 --6/6 Shadowguard Phaseblade slain
    .mob +Shadowguard Phaseblade
    .complete 84899,2 --6/6 Shadowguard Adept slain
    .mob +Shadowguard Adept
    .complete 84899,3 --3/3 Shadowguard Voidtamer slain
    .mob +Shadowguard Voidtamer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂抄写者|cRXP_FRIENDLY_Soul-Scribe|r和艾莉亚·风行者|cRXP_FRIENDLY_Alleria Windrunner|r交谈
    .turnin 84898 >>交还卡雷什的沙子
    .goto 2371,55.19,30.28
    .target +Soul-Scribe
    .turnin 84899 >>交任务: |cRXP_FRIENDLY_暗影守卫|r Diffusion
    .goto 2371,55.11,30.45
    .target +Alleria Windrunner
step
    .goto 2371,55.12,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .accept 84900 >>像刀割开以太般接受
    .target Xal'atath
step
    .goto 2371,49.95,26.80
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84900,1 --Approach Xal'atath at Shadow Point: Darkmend
step
    #loop
    .goto 2371,49.51,26.81,22,0
    .goto 2371,49.53,28.22,30,0
    .goto 2371,49.62,25.17,30,0
    >>击杀|cRXP_ENEMY_Shadowguard Forgecasters|r. 击败他们后可获得 |T4549241:0|t[|cRXP_LOOT_Forgecaster Wraps|r]
    .complete 84900,2 --4/4 Forgecaster Wraps
step
    .goto 2371,49.54,26.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unwieldy Energies|r
    .complete 84900,3 --4/4 Unwieldy Energy disrupted
step
    .goto 2371,48.65,26.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .turnin 84900 >>像刀锋划过以太般交付
    .target Xal'atath
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风行者艾莉娅|r和|cRXP_FRIENDLY_洛库斯-行者|r和|cRXP_FRIENDLY_灵魂书吏|r交谈
    .accept 84903 >>接受任务:直到沙海流尽虚空
    .goto 2371,48.58,26.63,-1
    .target +Alleria Windrunner
    .accept 84902 >>接受不利实例化
    .goto 2371,48.58,26.70,-1
    .target +Locus-Walker
    .accept 84904 >>接受, 我们将答复
    .goto 2371,48.60,26.78,-1
    .target +Soul-Scribe
step
    -- https://i.imgur.com/sAyKt6T.png
    #completewith PowerPylonDisabledA
    #hidewindow
    #loop
    .goto 2371,47.25,21.58,25,0
    .goto 2371,44.12,23.21,30,0
    .goto 2371,44.31,21.07,25,0
    .goto 2371,45.09,21.06,22,0
    .goto 2371,45.95,19.20,25,0
    +1
step
    #completewith PowerPylonDisabledA
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84903,1 --Shadowguard extinguished (100%)
    .mob Shadowguard Adept
    .mob Shadowguard Voidcaller
    .mob Shadowguard Colossus
    .mob Shadowguard Bulwark
    .mob Shadowguard Phaseblade
step
    #completewith TrappedWastelandersRescuedA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Shadowguard Power Pylons|r
    .complete 84902,1 --6/6 Power Pylon disabled
step
    #label TrappedWastelandersRescuedA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Captured Wastelanders|r
    .complete 84904,1 --6/6 Trapped Wastelanders rescued
step
    #label PowerPylonDisabledA
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Shadowguard Power Pylons|r
    .complete 84902,1 --6/6 Power Pylon disabled
step
    #loop
    .goto 2371,46.89,16.87,40,0
    .goto 2371,43.25,19.48,45,0
    .goto 2371,43.41,23.74,45,0
    .goto 2371,46.15,21.23,40,0
    >>击杀|cRXP_ENEMY_暗影守卫|r部队
    .complete 84903,1 --Shadowguard extinguished (100%)
    .mob Shadowguard Adept
    .mob Shadowguard Voidcaller
    .mob Shadowguard Colossus
    .mob Shadowguard Bulwark
    .mob Shadowguard Phaseblade
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师艾露拉·风行者|r和|cRXP_FRIENDLY_灵魂书吏|r和|cRXP_FRIENDLY_灵界行者|r交谈
    .turnin 84903 >>交还“直到沙子流血的虚空”
    .goto 2371,48.16,19.43
    .target +Alleria Windrunner
    .turnin 84904 >>提交后我们会回应
    .goto 2371,48.20,19.52
    .target +Soul-Scribe
    .turnin 84902 >>提交不利实例
    .accept 84905 >>接受潜行于暗影之中
    .goto 2371,48.23,19.43
    .target +Locus-Walker
step
    .goto 2371,48.90,18.68
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84905,1 --Follow Locus-Walker
step
    .goto 2371,49.08,18.48
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_不稳定的能量矩阵|r
    .complete 84905,2 --4/4 Unstable Energy Matrix overloaded
step
    #loop
    .goto 2371,48.70,18.32,11,0
    .goto 2371,49.24,17.83,11,0
    .goto 2371,49.45,18.48,11,0
    .goto 2371,49.08,19.15,11,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Shadowguard 能量储备|r
    *|cRXP_WARN_Avoid the |cRXP_PICK_Tripwires|r, stay on the wall to avoid the lasers and doge the void zones|r
    .complete 84905,3 --4/4 Shadowguard Energy Reserves destroyed
step
    .goto 2371,48.25,19.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Locus-Walker|r交谈
    .turnin 84905 >>交予“在阴影中行走”
    .target Locus-Walker
step
    .goto 2371,48.17,19.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .accept 84906 >>接受纳克斯绝命之战
    .target Alleria Windrunner
step
    .goto 2371,44.20,16.79
    >>|cRXP_WARN_跟随箭头指引|r
    .complete 84906,1 --Follow Alleria to Umbral Garrison: Apotheosis
step
    .goto 2371,43.80,17.11
    >>击杀|cRXP_ENEMY_Nexus-王子阿齐尔|r
    *|cRXP_WARN_Drag him to the friendly NPCs to make the help you|r
    .complete 84906,2 --1/1 Nexus-Prince Azir slain
    .mob Nexus-Prince Azir
step
    .goto 2371,44.16,16.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Nexus-王子阿兹尔的雷斯之带|r
    .complete 84906,3 --1/1 Nexus-Prince Azir's Reshii Ribbon
step
    .goto 2371,44.24,18.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 84906 >>提交 Nexus Regicide
    .target Alleria Windrunner
step
    .goto 2371,44.24,18.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .accept 85037 >>接受, 任务完成
    .target Xal'atath
step
    .goto 2371,42.85,21.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉塔斯|r交谈
    .complete 85037,2 --1/1 Speak to Xal'atath
    .target Xal'atath
    .skipgossipid 131307
step
    .goto 2371,42.82,21.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Reshii 丝带|r
    .complete 85037,3 --1/1 K'areshi Wraps
step
    .goto 2371,42.89,21.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莉亚·风行者|r交谈
    .turnin 85037 >>交出任务:这就是结束
    .target Alleria Windrunner
]])

RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r11.2 刀锋山
#name ar) 第五章 - 卡雷什之光
#displayname |cFF00CCFF5|r - 卡雷什之光 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#internal

step
    #completewith next
    .hs >>传送至塔扎维什, 隐秘市场
step
    .goto 2472,39.44,24.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'talad|r交谈
    .accept 87290 >>接受绿洲任务
    .target Om'talad
step
    .goto 2371,75.88,34.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cartel Om Custodian|r交谈
    .turnin 87290 >>提交绿洲
    .target Cartel Om Custodian
    .accept 87337 >>接受看守职责
step
    .goto 2371,74.31,34.02
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Oasis 动物遗骸|r
    .complete 87337,1 --Clean up Hope's Oasis (100%)
step
    .goto 2371,75.89,34.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 87337 >>上交看管职责
    .accept 87339 >>接受进行中的活动
    .accept 87338 >>接受第一天的入职培训
    .target Ve'nari
step
    .goto 2371,75.74,34.09
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_绿洲控制台|r
    .complete 87338,3 --1/1 The Oasis Console
step
    #loop
    .goto 2371,74.22,34.85,15,0
    .goto 2371,73.84,34.59,15,0
    .goto 2371,73.60,34.40,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_数据采集无人机|r
    .complete 87339,2 --1/1 Collect Data
    .target Data Collection Drone
step
    .goto 2371,72.49,34.77
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Torn-up Earth|r
    .complete 87339,1 --1/1 Torn-up Earth
step
    .goto 2371,73.01,33.00
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Watering Jug|r
    .complete 87339,3 --1/1 Watering Jug
step
    .goto 2371,72.92,32.77
    >>使用 |T968261:0|t[浇水壶]
    .complete 87339,4 --1/1 Use Watering Jug to water plants
    .use 236641
step
    .goto 2371,73.07,32.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Slateback Alpha|r交谈
    .complete 87338,2 --1/1 Meet the Slateback Alpha
    .target Slateback Alpha
    .skipgossipid 132138
step
    .goto 2371,72.07,30.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_荆棘尾母族长|r交谈
    .complete 87338,1 --1/1 Meet the Thorntail Matriarch
    .target Thorntail Matriarch
    .skipgossipid 132139
step
    .goto 2371,75.90,34.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 87338 >>提交进行中的任务
    .turnin 87339 >>提交进行中的任务
    .accept 87340 >>接受垃圾邮件
    .target Ve'nari
step
    .goto 2472,64.24,26.94
    .complete 87340,1 --Distribute advertising in Tazavesh (100%)
step
    .goto 2371,75.90,34.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 87340 >>上交垃圾邮件
    .target Ve'nari
    .accept 85075 >>接受风暴之歌
step
    .goto 876,63.18,33.71
    .complete 85075,1 --1/1 Travel to Stormsong Valley
step
    .goto 942,72.45,69.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85075 >>提交任务给风暴之歌
    .target Botanist Alaenra
    .accept 85077 >>接受“梁上君子的指套”任务
    .accept 85076 >>接受任务:别发疯
step
    .goto 942,68.32,67.66
    .complete 85077,1 --7/7 Honey Globule
step
    .goto 942,69.44,73.30
    >>击杀|cRXP_ENEMY_Maulers|r
    .complete 85076,1 --10/10 Maulers slain
    .mob Maulers
step
    .goto 942,72.43,69.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85076 >>交出梁上君子的指套
    .target Botanist Alaenra
    .turnin 85077 >>交出梁上君子的指套

    .accept 85079 >>接受“这样的斯利比头”任务
    .accept 85078 >>接受“蜂巢之怒”任务
    .complete 85079,1 --1/1 Find a way to deal with the bees
    .complete 85079,2 --1/1 Tranquilizing Dart (Optional)
step
    .goto 942,74.15,70.15
    >>击杀|cRXP_ENEMY_Hive Guardian 麻醉或|r
    .complete 85079,3 --5/5 Hive Guardian tranquilized or slain
    .mob Hive Guardian tranquilized or
step
    .goto 942,74.28,69.39
    .complete 85078,1 --3/3 Bee Hives investigated
step
    .goto 942,72.51,65.88
    .complete 85078,2 --1/1 Final Hive investigated
step
    .goto 942,72.56,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85079 >>交出这样的傻瓜头
    .target Botanist Alaenra
    .turnin 85078 >>交还“蜂巢帽”任务物品

    .accept 85080 >>接受一个不可思议的解决方案
    .accept 85081 >>接受《波西米亚狂想曲》
    .complete 85080,1 --1/1 Ve'nari contacted
step
    .goto 942,72.63,66.01
    .complete 85081,1 --1/1 Honey Pot placed
    .complete 85081,2 --1/1 Queen Bee rescued
step
    .goto 942,72.56,65.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85081 >>交还《波西米亚狂想曲》
    .target Botanist Alaenra
    .complete 85080,2 --1/1 Anima Vacuum
step
    .goto 942,72.51,69.77
    .complete 85080,3 --15/15 Honey Bees vacuumed
step
    .goto 942,72.57,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85080 >>提交一个不可思议的解决方案
    .target Botanist Alaenra
    .accept 85082 >>接受卡雷什
    .complete 85082,1 --1/1 Take the portal to K'aresh (Optional)
step
    .goto 2371,75.90,34.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ve'nari|r交谈
    .turnin 85082 >>交给卡瑞什
    .target Ve'nari
    .accept 85249 >>接受蜜蜂测试
step
    .goto 2371,48.38,61.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85249 >>提交蜜蜂测试
    .target Botanist Alaenra
    .accept 85083 >>接受拍照蜂任务
    .accept 85084 >>接受“蜂强”任务
step
    .goto 2371,47.79,63.80
    .complete 85083,1 --10/10 Honey Bees documented
step
    .goto 2371,48.38,61.29
    .complete 85084,1 --1/1 Honey collected
step
    .goto 2371,48.05,62.68
    .complete 85084,2 --1/1 Queen fed
step
    .goto 2371,48.38,61.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85083 >>提交“蜂强”任务
    .target Botanist Alaenra
    .turnin 85084 >>提交“蜂强”任务

    .accept 85257 >>接受普利姆斯商业任务
step
    .goto 2371,48.95,57.23
    .turnin 85257 >>提交Primus Buzzness

    .accept 85256 >>接受植物学, 终于
    .accept 85255 >>接受特兰奎拉蜂任务
step
    .goto 2371,48.55,53.93
    .complete 85255,1 --10/10 Honey Bees tranquilized and tagged
step
    .goto 2371,46.84,58.79
    .complete 85256,1 --10/10 K'aresh Flora Cutting
step
    .goto 2371,48.96,57.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85255 >>提交植物学任务, 终于完成了
    .target Botanist Alaenra
    .turnin 85256 >>提交植物学任务, 终于完成了

    .accept 89348 >>接受任务:让爱存在
step
    .goto 2371,75.76,33.85
    .turnin 89348 >>交还《让爱发生》

    .accept 85258 >>接受任务:哦, 蜂蜜蜂蜜
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alaenra(可选)|r交谈
    .complete 85258,1 --1/1 Talk to Alaenra (Optional)
    .target Alaenra (Optional)
step
    .goto 2371,76.31,29.72
    .complete 85258,3 --1/1 Queen Bee petted
step
    .goto 2371,75.83,30.93
    .complete 85258,2 --8/8 Honeycomb
step
    .goto 2371,75.81,34.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Om'talad|r交谈
    .turnin 85258 >>提交“哦, 蜂蜜蜂蜜”
    .target Om'talad
    .accept 85259 >>接受摇摆舞任务
step
    .goto 2371,76.67,32.93
    .complete 85259,3 --1/1 Eastern Waggle Dance
step
    .goto 2371,74.59,30.36
    .complete 85259,1 --1/1 Northern Waggle Dance
step
    .goto 2371,71.81,32.20
    .complete 85259,2 --1/1 Western Waggle Dance
step
    .goto 2371,75.76,33.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .turnin 85259 >>提交摇摆舞任务
    .target Botanist Alaenra
    .accept 85260 >>接受艰巨的一天
step
    .goto 2371,72.53,35.00
    .complete 85260,1 --10/10 Overworked Honey Bees picked up
step
    .goto 2371,75.76,33.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与草药学家奥莱拉交谈|cRXP_FRIENDLY_草药学家奥莱拉|r
    .accept 85260 >>接受艰巨的一天
    .target Botanist Alaenra
]])