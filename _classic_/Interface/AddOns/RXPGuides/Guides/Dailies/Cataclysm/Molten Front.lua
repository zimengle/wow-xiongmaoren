RXPGuides.RegisterGuide([[
#cata
#version 1
#group +熔火前线
#name A_1_TMF_开始
#next B_1_TSOM_开始
#displayname |cRXP_LOOT_1.0|r - 入侵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #completewith OpeningtheDoor
	.zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r << Horde
	.zone 84 >>前往: |cRXP_PICK_暴风城|r << Alliance
	.zoneskip 198
step
    #completewith OpeningtheDoor
    .goto 85,51.000,38.221 << Horde
    .goto 84,76.178,18.695 << Alliance
	.zone 198 >>前往海加尔传送门
step
    #label OpeningtheDoor
    .goto 198/1,-2082.800,4424.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈 
    .target Matoclaw
    .accept 29145 >>接任务: |cRXP_WARN_开门|r
step
    .goto 198/1,-2079.100,4653.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .target Arch Druid Hamuul Runetotem
    .turnin 29145 >>交任务: |cRXP_FRIENDLY_开门|r
    .accept 29195 >>接任务: |cRXP_WARN_烈焰仪式|r
step
    .goto 198/1,-2092.900,4621.800
    >>击杀|cRXP_ENEMY_灼焦入侵者|r, 直到进度条填满. 这将触发|cRXP_ENEMY_莱雅娜|r通过传送门出现
    >>击杀|cRXP_ENEMY_莱雅娜|r
    >>|cRXP_WARN_你不需要给她贴上标记|r
    .complete 29195,1 -- Open the portal to the Firelands (1)
    .mob Charred Invader
    .mob Leyara
step
    .goto 198/1,-2092.900,4621.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 29195 >>交任务: |cRXP_FRIENDLY_烈焰仪式|r
    .accept 29196 >>接任务: |cRXP_WARN_前往庇护所！|r
step
    .goto 198/1,-2082.800,4424.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .turnin 29196 >>交任务: |cRXP_FRIENDLY_前往庇护所！|r
    .accept 29197 >>接任务: |cRXP_WARN_出其不意|r
step
    .goto 198/1,-1980.300,4628.000
    >>杀死靠近|cRXP_FRIENDLY_希萨莉·黑鸦|r的|cRXP_ENEMY_狂怒入侵者|r
    .complete 29197,2 --|Kill elementals near Thisalee: 6/6
    .mob Raging Invader
    .target Thisalee Crow
step
    .goto 198/1,-2373.900,4560.100
    >>杀死附近|cRXP_ENEMY_狂怒的入侵者|r的|cRXP_FRIENDLY_老树干|r
    .complete 29197,1 --|Kill elementals near Elderlimb: 6/6
    .mob Raging Invader
    .target Elderlimb
step
    .goto 198/1,-2699.000,4584.200
    >>击杀附近|cRXP_FRIENDLY_托洛|r和|cRXP_FRIENDLY_安仁|r的|cRXP_ENEMY_狂怒的入侵者|r
    .complete 29197,3 --|Kill elementals near Tholo and Anren: 6/6
    .mob Raging Invader
    .target Tholo
    .target Anren
step
    .goto 198/1,-2082.200,4423.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .target Arch Druid Hamuul Runetotem
    .turnin 29197 >>交任务: |cRXP_FRIENDLY_出其不意|r
    .accept 29198 >>接任务: |cRXP_WARN_庇护所保卫战|r
step
    .goto 198/1,-2080.200,4421.700
    >>|cRXP_WARN_等待RP结束|r
    .complete 29198,1
step
    .goto 198/1,-2080.200,4421.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 29198 >>交任务: |cRXP_FRIENDLY_庇护所保卫战|r
step
    .goto 198/1,-2080.200,4417.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈 
    .target Arch Druid Hamuul Runetotem
    .accept 29199 >>接任务: |cRXP_WARN_寻求增援|r
step
    .goto 198/1,-2082.700,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈 
    .target Matoclaw
    .daily 29123,29149,29127,29163,29166 >>接任务: |cRXP_WARN_灭火之怒|r
step
    #loop
    .goto 198,27.108,62.009,5,0
    .goto 198,27.170,62.563,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r或|cRXP_FRIENDLY_米露恩|r交谈
    .daily 29125,29147,29164,29101,29161 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29125,29147,29164,29101,29161
    .target Matoclaw
    .target Mylune
step
    .isOnQuest 29166
    #completewith KillNemesis
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29101
    #loop
    .goto 198,22.89,59.91,70,0
    .goto 198,18.58,56.71,70,0
    .goto 198,15.11,48.85,70,0
    .goto 198,19.97,46.22,70,0
    >>点击一个|cRXP_FRIENDLY_托尔托拉之子|r
    >>|cRXP_WARN_瞄准水面并投掷|r |T132219:0|t[投掷乌龟] |cRXP_WARN_(1)|r
    .complete 29101,1 -- Child of Tortolla punted into water (5)
    .target Child of Tortolla
step
    .isOnQuest 29164
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .use 69235 >>|cRXP_WARN_在他们的尸体上使用|r|T134298:0|t[狼的尖牙]|r
    .complete 29164,1 -- Howl atop an invader's corpse (10)
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29147
    #completewith next
    .cast 97241 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽] |cRXP_WARN_来转化成|r|cRXP_FRIENDLY_艾维娜之翼|r
    .use 69234
step
    .isOnQuest 29147
    #loop
    .goto 198,14.90,45.11,80,0
    .goto 198,10.13,36.76,80,0
    .goto 198,13.24,33.64,80,0
    .goto 198,18.65,40.28,80,0
    .use 69234 >>|cRXP_WARN_使用|r|T132172:0|t[召唤鸟群] (1)|cRXP_WARN_ability 靠近|cRXP_FRIENDLY_高山鸣雀|r和|cRXP_FRIENDLY_森林猫头鹰|r和|cRXP_FRIENDLY_金翼雄鹰|r|r
    .complete 29147,1 -- Alpine Songbird gathered (12)
    .target +Alpine Songbird
    .complete 29147,2 -- Forest Owl gathered (5)
    .target +Forest Owl
    .complete 29147,3 -- Goldwing Hawk gathered (2)
    .target +Goldwing Hawk
step
    .isOnQuest 29125
    #loop
    .goto 198,37.32,54.52,70,0
    .goto 198,40.87,55.93,70,0
    .goto 198,36.43,60.73,70,0
    .goto 198,33.45,64.19,70,0
    >>站在玛洛恩之魂面前
    >>|cRXP_WARN_这些是四处乱窜的幽灵鹿|r
    .complete 29125,1 --Spirit of Malorne captured (3)
step
    #completewith next
    .goto 198,14.310,33.203
    .vehicle >>点击|cRXP_PICK_攀爬树|r开始攀爬这棵树
    .target Climbing Tree
    .isOnQuest 29161
step
    .goto 198,14.310,33.203
    >>在树上时, 点击|cRXP_FRIENDLY_海加尔幼熊|r
    .collect 54439,1
    .target Hyjal Bear Cub
    .isOnQuest 29161
step
    .isOnQuest 29161
    .goto 198,14.310,33.203
    *|cRXP_WARN_Cast|r |T450907:0|t[Climb Up] (1) |cRXP_WARN_until you're at the top, aim the arrow at the trampoline beside |cRXP_FRIENDLY_Keeper Taldros|r, then cast|r |T446127:0|t[Chuck-a-bear] (4)|cRXP_WARN_. Cast|r |T450905:0|t[Climb Down] (2) |cRXP_WARN_and repeat the process|r
    .complete 29161,1 --6/6 Hyjal Bear Cubs Rescued
step
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    .isOnQuest 29161
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29161 >>交任务: |cRXP_FRIENDLY_熊就在那里|r
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isQuestTurnedIn 29161
    >>点击任务日志中的任务提交弹出窗口
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isOnQuest 29125
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29125 >>交任务: |cRXP_FRIENDLY_林木之间|r
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isQuestTurnedIn 29125
    >>点击任务日志中的任务提交弹出窗口
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isOnQuest 29147
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29147 >>交任务: |cRXP_FRIENDLY_召唤鸟群|r
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isQuestTurnedIn 29147
    >>点击任务日志中的任务提交弹出窗口
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isOnQuest 29164
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29164 >>交任务: |cRXP_FRIENDLY_让你的吼声更完美|r
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isQuestTurnedIn 29164
    >>点击任务日志中的任务提交弹出窗口
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isOnQuest 29101
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29101 >>交任务: |cRXP_FRIENDLY_踢飞季节|r
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    .isQuestTurnedIn 29101
    >>点击任务日志中的任务提交弹出窗口
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    #completewith next
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .cast 97517 >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_召唤|r|cRXP_ENEMY_派拉奇尼斯|r
    .use 69232
step
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .use 69232 >>击杀|cRXP_ENEMY_派拉齐尼斯|r
    >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_来移除自身身上的|r|T136016:0|t[沸腾毒药箭]|cRXP_WARN_ debuff, 该效果由|r|cRXP_ENEMY_派拉齐尼斯|r施加|r
    .complete 29162,1 --|Pyrachnis slain: 1/1
    .mob Pyrachnis
step
    #completewith next
    .isOnQuest 29126
    .goto 198,41.667,56.130
    .cast 97012 >>|cRXP_WARN_使用|r|T135139:0|t[守护者法杖]|cRXP_WARN_于|cRXP_PICK_ 灰烬堆|r召唤|r|cRXP_ENEMY_ 盖伦格斯|r
    .use 68997
step
    .goto 198,41.667,56.130
    .isOnQuest 29126
    .use 68997 >>击杀|cRXP_ENEMY_盖伦格斯|r
    .complete 29126,1 -- Galenges slain (1)
    .mob Galenges
step
    .isOnQuest 29148
    #completewith next
    .goto 198/1,-1500.700,4929.300
    .cast 97324 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽]|cRXP_WARN_靠近西部火焰传送门来召唤|r|cRXP_ENEMY_米拉盖佐尔|r
    .use 69212
step
    .isOnQuest 29148
    .goto 198/1,-1500.700,4929.300
    .use 69212 >>击杀|cRXP_ENEMY_米拉盖佐尔|r
    .complete 29148,1 -- Millagazor slain (1)
    .mob Millagazor
step
    .isOnQuest 29165
    #completewith next
    .goto 198,41.667,56.130
    .cast 97498 >>|cRXP_WARN_使用|r|T134298:0|t[狼的尖牙] |cRXP_WARN_来召唤|r|cRXP_ENEMY_莱拉克斯|r
    .use 69225
step
    .isOnQuest 29165
    .goto 198,41.667,56.130
    .use 69225 >>击杀|cRXP_ENEMY_莱拉克斯|r
    .complete 29165,1 -- Lylagar slain (1)
    .mob Lylagar
step
    .isOnQuest 29122
    #completewith next
    .goto 198,24.014,55.803
    .gossip 52425,0 >>与|cRXP_FRIENDLY_图加|r交谈以召唤|cRXP_ENEMY_涅墨西斯|r
    .skipgossip
    .target Tooga
step
    #label KillNemesis
    .isOnQuest 29122
    .goto 198,24.760,55.259
    >>击杀|cRXP_ENEMY_涅墨西斯|r
    >>|cRXP_WARN_站在|cRXP_FRIENDLY_Tooga's|r的壳下, 以躲避|r|cRXP_ENEMY_Nemesis'|r|T135830:0|t[熔火之怒]|cRXP_WARN_cast|r
    .complete 29122,1 -- Nemesis slain (1)
    .target Tooga
    .mob Nemesis
step
    .isOnQuest 29166
    #loop
    .goto 198,29.53,56.21,70,0
    .goto 198,36.15,52.44,70,0
    .goto 198,35.94,58.80,70,0
    .goto 198,24.27,62.12,70,0
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isQuestComplete 29162
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29162 >>交还自然的祝福
step
    .isQuestComplete 29122
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29122 >>交还涅墨西斯之回响
step
    .isQuestComplete 29126
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29126 >>交还玛洛恩之力
step
    .isQuestComplete 29165
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29165 >>提交《狼群的召唤》
step
    .isQuestComplete 29148
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29148 >>交还燃烧之翼
step
    .isQuestComplete 29166
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29166 >>提交补给给另一方
step
    .isQuestComplete 29123
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29123 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29149
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29149 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29127
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29127 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29163
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29163 >>提交“对抗烈焰的狂怒”
step
    .goto 198/1,-2080.200,4417.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈 
    .target Arch Druid Hamuul Runetotem
    .turnin 29199 >>交任务: |cRXP_FRIENDLY_寻求增援|r
    .accept 29200 >>接任务: |cRXP_WARN_莱雅娜|r
step
    .goto 198/1,-1214.200,5236.700
    >>与|cRXP_ENEMY_莱雅娜|r交谈
    .complete 29200,1 --|Find Leyara: 1/1
    .mob Leyara
step
    .goto 198/1,-2082.700,4424.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .turnin 29200 >>交任务: |cRXP_FRIENDLY_莱雅娜|r
step
    .goto 198/1,-2076.300,4420.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈 
    .target Malfurion Stormrage
    .accept 29201 >>接任务: |cRXP_WARN_穿越地狱之门|r
step
    #completewith GatesofHell
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    >>击杀|cRXP_ENEMY_黑曜石熔渣之主|r
    .complete 29201,1 --|Secure a foothold in the Firelands: 1/1
    .mob Obsidian Slaglord
step
    #label GatesofHell
    .goto 338,47.151,90.502
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈 
    .target Malfurion Stormrage
    .turnin 29201 >>交任务: |cRXP_FRIENDLY_穿越地狱之门|r
]])


RXPGuides.RegisterGuide([[
#cata
#version 1
#group +熔火前线
#name B_1_TSOM_开始
#next C_1_TSOM_德鲁伊
#displayname |cRXP_FRIENDLY_2.0|r - 熔火前线 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

--Molten Front quests

step
    #completewith WispAway
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .daily 29139,29143 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Rayne Feathersong
step
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .daily 29138 >>接任务: |cRXP_WARN_烧伤患者|r
    .target Captain Irontree
step
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .daily 29179 >>接任务: |cRXP_WARN_元素敌人|r
    .daily 29304,29141,29142,29137 >>接任务: |cRXP_WARN_灭火之怒|r
    .target General Taldris Moonfall
step -- 29138 Burn Victims
    .isOnQuest 29138
    #sticky
    #label BurnVictims
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .use 69240 >>|cRXP_WARN_使用|r|T463860:0|t[魔法药膏], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_受伤的海加尔防御者|r
    .complete 29138,1 -- Wounded Hyjal Defender saved 1/1
    .target Wounded Hyjal Defender
step -- 29179 Hostile Elements
    .isOnQuest 29179
    #sticky
    #label HostileElements
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦征服者|r和|cRXP_ENEMY_灼焦士兵|r
    .complete 29179,1 -- Charred Combatant slain (8)
    .mob Charred Vanquisher
    .mob Charred Soldier


step -- 29304 The Dogs of War
    .isOnQuest 29304
    #sticky
    #label TheDogs
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_灼焦恶犬|r 和|cRXP_ENEMY_上古灼焦恶犬|r
    .complete 29304,1 -- Ancient Charhound slain (5)
    .mob Charhound
    .mob Ancient Charhound
step -- 29141 The Harder They Fall
    .isOnQuest 29141
    #sticky
    #label HarderTheyFall
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔火巨兽|r
    .complete 29141,1 -- Molten Behemoth slain (3)
    .mob Molten Behemoth
step -- 29142 Traitors Return
    .isOnQuest 29142
    #sticky
    #label TraitorsReturn
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,71.0,38.6,45,0
    >>击杀|cRXP_ENEMY_火焰德鲁伊|r
    .complete 29142,1 -- Druid of the Flame slain (3)
    .mob Druid of the Flame
step -- 29137 Breach in the Defenses
    .isOnQuest 29137
    #sticky
    #label Breach
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔岩破坏者|r
    .complete 29137,1 -- Lava Burster slain (5)
    .mob Lava Burster
step -- 29139 Aggressive Growth
    .isOnQuest 29139
    #sticky
    #label AggressiveGrowth
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>点击地面上的|cRXP_PICK_燃灰堆|r
    .complete 29139,1 -- Smothervine planted (5)
step -- 29143 Wisp Away
    .isOnQuest 29143
    #sticky
    #label WispAway
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>|cRXP_WARN_带着跟随你的海加尔小精灵前往火焰传送门|r
    >>|cRXP_WARN_击杀从里面出来的怪物. 确保 |cRXP_FRIENDLY_海加尔小精灵|r 不会死亡！|r
    .complete 29143,1 -- Close a Fire Portal 1/1
step
    #optional
    #requires BurnVictims
step
    #optional
    #requires HostileElements
step
    #optional
    #requires TheDogs
step
    #optional
    #requires HarderTheyFall
step
    #optional
    #requires TraitorsReturn
step
    #optional
    #requires Breach
step
    #optional
    #requires AggressiveGrowth
step
    #optional
    #requires WispAway
step
    .isQuestComplete 29179
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29179 >>提交敌对元素
    .target General Taldris Moonfall
step
    .isQuestComplete 29304
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29304 >>交出《战争之犬》
    .target General Taldris Moonfall
step
    .isQuestComplete 29141
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29141 >>交出《他们先杀了我父亲》
    .target General Taldris Moonfall
step
    .isQuestComplete 29142
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29142 >>交还叛徒的归来
    .target General Taldris Moonfall
step
    .isQuestComplete 29137
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29137 >>交任务: |cRXP_FRIENDLY_防线上的突破口|r
    .target General Taldris Moonfall
step
    .isQuestComplete 29138
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .dailyturnin 29138 >>提交烧伤受害者任务
    .target Captain Irontree
step
    .isQuestComplete 29139
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29139 >>提交任务“激进成长”
    .target Rayne Feathersong
step
    .isQuestComplete 29143
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29143 >>交出小精灵
    .target Rayne Feathersong




--Hyjal quests
    
step
    #completewith HyjalQuests
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
step --accepted back at sanctuary of malorne
    .goto 198/1,-2088.800,4452.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_队长索伦·月落|r交谈 
    .target Captain Soren Moonfall
    .daily 29128 >>接任务: |cRXP_WARN_海加尔的保卫者|r
step
    #loop
    .goto 198,27.108,62.009,5,0
    .goto 198,27.170,62.563,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r或|cRXP_FRIENDLY_米露恩|r交谈
    .daily 29125,29147,29164,29101,29161 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29125,29147,29164,29101,29161
    .target Matoclaw
    .target Mylune
step
    #loop
    #label HyjalQuests
    .goto 198,27.527,62.510,5,0
    .goto 198,27.172,62.565,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦托克劳|r 或 |cRXP_FRIENDLY_Dorda'en 夜游者|r 交谈
    .daily 29123,29149,29127,29163,29166,29247,29246,29248 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29123,29149,29127,29163,29166,29247,29246,29248
    .target Matoclaw
    .target Dorda'en Nightweaver
step
    .isOnQuest 29166
    #completewith KillNemesis
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29101
    #loop
    .goto 198,22.89,59.91,70,0
    .goto 198,18.58,56.71,70,0
    .goto 198,15.11,48.85,70,0
    .goto 198,19.97,46.22,70,0
    >>点击一个|cRXP_FRIENDLY_托尔托拉之子|r
    >>|cRXP_WARN_瞄准水面并投掷|r |T132219:0|t[投掷乌龟] |cRXP_WARN_(1)|r
    .complete 29101,1 -- Child of Tortolla punted into water (5)
    .target Child of Tortolla
step
    .isOnQuest 29164
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .use 69235 >>|cRXP_WARN_在他们的尸体上使用|r|T134298:0|t[狼的尖牙]|r
    .complete 29164,1 -- Howl atop an invader's corpse (10)
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29147
    #completewith next
    .cast 97241 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽] |cRXP_WARN_来转化成|r|cRXP_FRIENDLY_艾维娜之翼|r
    .use 69234
step
    .isOnQuest 29147
    #loop
    .goto 198,14.90,45.11,80,0
    .goto 198,10.13,36.76,80,0
    .goto 198,13.24,33.64,80,0
    .goto 198,18.65,40.28,80,0
    .use 69234 >>|cRXP_WARN_使用|r|T132172:0|t[召唤鸟群] (1)|cRXP_WARN_ability 靠近|cRXP_FRIENDLY_高山鸣雀|r和|cRXP_FRIENDLY_森林猫头鹰|r和|cRXP_FRIENDLY_金翼雄鹰|r|r
    .complete 29147,1 -- Alpine Songbird gathered (12)
    .target +Alpine Songbird
    .complete 29147,2 -- Forest Owl gathered (5)
    .target +Forest Owl
    .complete 29147,3 -- Goldwing Hawk gathered (2)
    .target +Goldwing Hawk
step
    .isOnQuest 29125
    #loop
    .goto 198,37.32,54.52,70,0
    .goto 198,40.87,55.93,70,0
    .goto 198,36.43,60.73,70,0
    .goto 198,33.45,64.19,70,0
    >>站在玛洛恩之魂面前
    >>|cRXP_WARN_这些是四处乱窜的幽灵鹿|r
    .complete 29125,1 --Spirit of Malorne captured (3)
step
    #completewith next
    .goto 198,14.310,33.203
    .vehicle >>点击|cRXP_PICK_攀爬树|r开始攀爬这棵树
    .target Climbing Tree
    .isOnQuest 29161
step
    .goto 198,14.310,33.203
    >>在树上时, 点击|cRXP_FRIENDLY_海加尔幼熊|r
    .collect 54439,1
    .target Hyjal Bear Cub
    .isOnQuest 29161
step
    .isOnQuest 29161
    .goto 198,14.310,33.203
    *|cRXP_WARN_Cast|r |T450907:0|t[Climb Up] (1) |cRXP_WARN_until you're at the top, aim the arrow at the trampoline beside |cRXP_FRIENDLY_Keeper Taldros|r, then cast|r |T446127:0|t[Chuck-a-bear] (4)|cRXP_WARN_. Cast|r |T450905:0|t[Climb Down] (2) |cRXP_WARN_and repeat the process|r
    .complete 29161,1 --6/6 Hyjal Bear Cubs Rescued
step
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    .isOnQuest 29161
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29161 >>交任务: |cRXP_FRIENDLY_熊就在那里|r
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isQuestTurnedIn 29161
    >>点击任务日志中的任务提交弹出窗口
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isOnQuest 29125
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29125 >>交任务: |cRXP_FRIENDLY_林木之间|r
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isQuestTurnedIn 29125
    >>点击任务日志中的任务提交弹出窗口
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isOnQuest 29147
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29147 >>交任务: |cRXP_FRIENDLY_召唤鸟群|r
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isQuestTurnedIn 29147
    >>点击任务日志中的任务提交弹出窗口
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isOnQuest 29164
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29164 >>交任务: |cRXP_FRIENDLY_让你的吼声更完美|r
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isQuestTurnedIn 29164
    >>点击任务日志中的任务提交弹出窗口
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isOnQuest 29101
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29101 >>交任务: |cRXP_FRIENDLY_踢飞季节|r
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    .isQuestTurnedIn 29101
    >>点击任务日志中的任务提交弹出窗口
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    #completewith next
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .cast 97517 >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_召唤|r|cRXP_ENEMY_派拉奇尼斯|r
    .use 69232
step
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .use 69232 >>击杀|cRXP_ENEMY_派拉齐尼斯|r
    >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_来移除自身身上的|r|T136016:0|t[沸腾毒药箭]|cRXP_WARN_ debuff, 该效果由|r|cRXP_ENEMY_派拉齐尼斯|r施加|r
    .complete 29162,1 --|Pyrachnis slain: 1/1
    .mob Pyrachnis
step
    #completewith next
    .isOnQuest 29126
    .goto 198,41.667,56.130
    .cast 97012 >>|cRXP_WARN_使用|r|T135139:0|t[守护者法杖]|cRXP_WARN_于|cRXP_PICK_ 灰烬堆|r召唤|r|cRXP_ENEMY_ 盖伦格斯|r
    .use 68997
step
    .goto 198,41.667,56.130
    .isOnQuest 29126
    .use 68997 >>击杀|cRXP_ENEMY_盖伦格斯|r
    .complete 29126,1 -- Galenges slain (1)
    .mob Galenges
step
    .isOnQuest 29148
    #completewith next
    .goto 198/1,-1500.700,4929.300
    .cast 97324 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽]|cRXP_WARN_靠近西部火焰传送门来召唤|r|cRXP_ENEMY_米拉盖佐尔|r
    .use 69212
step
    .isOnQuest 29148
    .goto 198/1,-1500.700,4929.300
    .use 69212 >>击杀|cRXP_ENEMY_米拉盖佐尔|r
    .complete 29148,1 -- Millagazor slain (1)
    .mob Millagazor
step
    .isOnQuest 29165
    #completewith next
    .goto 198,41.667,56.130
    .cast 97498 >>|cRXP_WARN_使用|r|T134298:0|t[狼的尖牙] |cRXP_WARN_来召唤|r|cRXP_ENEMY_莱拉克斯|r
    .use 69225
step
    .isOnQuest 29165
    .goto 198,41.667,56.130
    .use 69225 >>击杀|cRXP_ENEMY_莱拉克斯|r
    .complete 29165,1 -- Lylagar slain (1)
    .mob Lylagar
step
    .isOnQuest 29122
    #completewith next
    .goto 198,24.014,55.803
    .gossip 52425,0 >>与|cRXP_FRIENDLY_图加|r交谈以召唤|cRXP_ENEMY_涅墨西斯|r
    .skipgossip
    .target Tooga
step
    #label KillNemesis
    .isOnQuest 29122
    .goto 198,24.760,55.259
    >>击杀|cRXP_ENEMY_涅墨西斯|r
    >>|cRXP_WARN_站在|cRXP_FRIENDLY_Tooga's|r的壳下, 以躲避|r|cRXP_ENEMY_Nemesis'|r|T135830:0|t[熔火之怒]|cRXP_WARN_cast|r
    .complete 29122,1 -- Nemesis slain (1)
    .target Tooga
    .mob Nemesis
step
    .isOnQuest 29166
    #loop
    .goto 198,29.53,56.21,70,0
    .goto 198,36.15,52.44,70,0
    .goto 198,35.94,58.80,70,0
    .goto 198,24.27,62.12,70,0
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step -- 29248 Releasing the Pressure
    .isOnQuest 29248
    .goto 198,32.0,59.8,70,0
    .goto 198,36.6,54.8,70,0
    .goto 198,39.2,62.6,70,0
    .goto 198,34.6,64.6,70,0
    .goto 198,30.6,52.2,70,0
    >>击杀 |cRXP_ENEMY_灼焦火妖|r. 从他们身上获取 |cRXP_LOOT_火妖的鳞片|r
    .complete 29248,1 -- Flamewaker Scale (100)
    .mob Charred Flamewaker
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #completewith FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step -- 29247 Treating the Wounds
    .isOnQuest 29247
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r. 从它们身上搜刮|cRXP_LOOT_沾满硫磺的包裹|r
    .complete 29247,1 -- Sulfur-Laced Wrapping (4)
    .mob Fiery Behemoth
step -- 29246 Relieving the Pain
    .isOnQuest 29246
    #label FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_炽热的葬火领主|r. 击败他们以获取他们的|cRXP_LOOT_烈焰裹附核心|r
    .complete 29246,1 -- Flame-Wreathed Heart (4)
    .mob Seething Pyrelord
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step
    .isQuestComplete 29162
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29162 >>交还自然的祝福
step
    .isQuestComplete 29122
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29122 >>交还涅墨西斯之回响
step
    .isQuestComplete 29126
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29126 >>交还玛洛恩之力
step
    .isQuestComplete 29165
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29165 >>提交《狼群的召唤》
step
    .isQuestComplete 29148
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29148 >>交还燃烧之翼
step
    .isQuestComplete 29166
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29166 >>提交补给给另一方
step
    .isQuestComplete 29123
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29123 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29149
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29149 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29127
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29127 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29163
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29163 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29246
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29246 >>提交任务:缓解痛苦
step
    .isQuestComplete 29247
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29247 >>交还《治疗伤口》
step
    .isQuestComplete 29248
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29248 >>提交任务:释放压力
step
    #completewith next
    .isQuestComplete 29128
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isQuestComplete 29128
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29128 >>交还《海加尔的守护者》任务物品
    .target General Taldris Moonfall
step
    #completewith Finish德鲁伊
    .goto 338,47.017,91.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈 
    .accept 29181 >>接任务: |cRXP_WARN_猛禽德鲁伊|r
    --.accept 29214 >>接任务: |cRXP_WARN_暗影守望者|r
    .target Malfurion Stormrage
step
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
step
    .isQuestComplete 29181
    .goto 198,47.017,91.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈 
    .turnin 29181 >>交任务: |cRXP_FRIENDLY_猛禽德鲁伊|r
    .target Skylord Omnuron
step
    #label Finish德鲁伊
    .isQuestAvailable 29181
    +|cRXP_WARN_您已完成今日所有可用的日常任务. 请于明日重新加载本指南(|r|cRXP_FRIENDLY_2.0|r- 熔火前线|cRXP_WARN_), 继续完成日常任务, 直至获得足够的|r|T513195:0|t[世界树印记]

-- Beginning of 德鲁伊 questline if turned in
step
    .isQuestTurnedIn 29181
    .goto 198/1,-2740.000,4902.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎娜·溪行|r交谈 
    .target Isara Riverstride
    .accept 29182 >>接任务: |cRXP_WARN_风暴乌鸦的飞行|r
step
    #completewith next
    .isOnQuest 29182
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isQuestComplete 29181
    .goto 338,43.028,80.598
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈 
    .turnin 29182 >>交任务: |cRXP_FRIENDLY_风暴乌鸦的飞行|r
    .target Skylord Omnuron
step
    .isQuestTurnedIn 29181
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .daily 29206 >>接任务: |cRXP_WARN_进入火焰之中|r
    .target General Taldris Moonfall
step
    .isOnQuest 29206
    .goto 338,43.15,80.14,10,0
    .goto 338,33.83,67.40
    >>护送并保护|cRXP_FRIENDLY_Windcaller|r穿越火焰
    >>在终点处击杀葬火领主
    >>在火堆旁, 如果附近没有风语者, 就与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈
    .complete 29206,1 -- Druid of the Talon Windcaller protected 1/1
    .mob Flamewaker Assassin
    .mob Pyrelord
    .target Nordrala
    .skipgossip
step
    #completewith next
    .subzone 5746 >>|cRXP_WARN_从大洞口掉下去. 朝|r|cRXP_FRIENDLY_希萨莉·黑鸦的方向走去|r
step
    .isQuestTurnedIn 29181
    .goto 338,42.541,59.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希萨莉·黑鸦|r交谈
    .dailyturnin 29206 >>提交任务:投入火中
    .daily 29264 >>接任务: |cRXP_WARN_熔火激流的火妖|r
    .daily 29265 >>接任务: |cRXP_WARN_火焰之花|r
    .target Thisalee Crow
step -- 29264 Flamewakers of the Molten Flow
    .isOnQuest 29264
    #completewith AnrenEscort
    >>击杀|cRXP_ENEMY_火妖哨兵|r和|cRXP_ENEMY_火妖猎人|r和|cRXP_ENEMY_火妖萨满|r
    .complete 29264,1 -- Flamewaker slain (8)
    .mob Flamewaker Sentinel
    .mob Flamewaker Shaman
    .mob Flamewaker Hunter
step -- 29265 Fire Flowers
    .isOnQuest 29265
    #completewith AnrenEscort
    >>在地面上掠夺|cRXP_LOOT_炼狱花|r
    .complete 29265,1 -- Lucifern (5)
step
    .isQuestTurnedIn 29181
    .goto 338,51.897,30.965
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    .accept 29272 >>接任务: |cRXP_WARN_真的……需要……水……|r
    .target Anren Shadowseeker
step
    .isOnQuest 29272
    .goto 338,51.897,30.965
    .gossip 53233 >>对话 |cRXP_FRIENDLY_安伦·觅影者|r 再次开始护送任务
    .skipgossip
    .target Anren Shadowseeker
step
    #label AnrenEscort
    .isOnQuest 29272
    .goto 338,42.59,59.85
    >>护送|cRXP_FRIENDLY_安伦·觅影者|r
    >>|cRXP_WARN_紧跟着他, 并跳上旁边的|r|T514278:0|t[热力通风口]|cRXP_WARN_alongside him|r
    .complete 29272,1 -- Escort Anren Shadowseeker to the front of the cave 1/1
    .target Anren Shadowseeker
step -- 29264 Flamewakers of the Molten Flow
    .isOnQuest 29264
    #sticky
    #label FOTMF
    #loop
    .goto 338,50.15,58.80,70,0
    .goto 338,43.39,51.11,70,0
    .goto 338,51.48,39.68,70,0
    .goto 338,52.74,54.06,70,0
    >>击杀|cRXP_ENEMY_火妖哨兵|r和|cRXP_ENEMY_火妖猎人|r和|cRXP_ENEMY_火妖萨满|r
    .complete 29264,1 -- Flamewaker slain (8)
    .mob Flamewaker Sentinel
    .mob Flamewaker Shaman
    .mob Flamewaker Hunter
step -- 29265 Fire Flowers
    .isOnQuest 29265
    #sticky
    #label Lucifern
    #loop
    .goto 338,50.15,58.80,70,0
    .goto 338,43.39,51.11,70,0
    .goto 338,51.48,39.68,70,0
    .goto 338,52.74,54.06,70,0
    >>在地面上掠夺|cRXP_LOOT_炼狱花|r
    .complete 29265,1 -- Lucifern (5)
step
    #optional
    #requires FOTMF
step
    #optional
    #requires Lucifern
step
    .isQuestComplete 29264
    .goto 338,42.541,59.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希萨莉·黑鸦|r交谈
    .dailyturnin 29264 >>交还熔岩流的烈焰行者
    .target Thisalee Crow
step
    #label ExitUnderground
    #completewith DruidDailies
    .goto 338,33.08,67.62
    .aura 98833 >>|cRXP_WARN_回到你之前跳下的那个大开口处. 站在|r|T514278:0|t[热能喷口]|cRXP_WARN_, 然后跳回熔火前线的表面|r
    .subzoneskip 5746,1
step
    #requires ExitUnderground
    #completewith DruidDailies
    .goto 338,33.08,67.62
    +|cRXP_WARN_跳回熔火前线表面|r
    .subzoneskip 5746,1
step
    .isQuestComplete 29272
    .goto 338,35.983,58.988
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    .turnin 29272 >>交任务: |cRXP_FRIENDLY_真的……需要……水……|r
    .target Tholo Whitehoof
step
    .isQuestTurnedIn 29272
    .goto 338,35.860,59.235
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r或|cRXP_FRIENDLY_安伦·觅影者|r交谈
    .daily 29273,29274 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Tholo Whitehoof
    .target Anren Shadowseeker
step
    .isQuestComplete 29265
    .goto 338,36.299,56.344
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楚伦娜|r交谈
    .dailyturnin 29265 >>交出火焰之花
    .target Choluna
step
    .isQuestTurnedIn 29181
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .daily 29290,29287,29288 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Morthis Whisperwing
step
    .isQuestTurnedIn 29181
    #label DruidDailies
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .daily 29293,29296 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Arthorn Windsong
step
    #completewith next
    .goto 338,33.808,57.177
    .isOnQuest 29290
    .vehicle >>骑乘|cRXP_FRIENDLY_驯服的火鹰|r
    .target Trained Fire Hawk
step
    .isOnQuest 29290
    >>|cRXP_WARN_施放|r|T135821:0|t[火焰种子] (1)|cRXP_WARN_and|r|T451164:0|t[火焰爆裂] (2)|cRXP_WARN_以击杀|cRXP_ENEMY_烈焰行者|r和|cRXP_ENEMY_熔丝蛛|r和|r|cRXP_ENEMY_熔火领主|r
    .complete 29290,1 -- Amassing Flamewakers slain  (100)
    .mob +Flamewaker Centurion
    .mob +Flamewaker Cauterizer
    .mob +Flamewaker Incinerator
    .complete 29290,2 -- Amassing Cinderwebs slain  (40)
    .mob +Cinderweb Skitterer
    .mob +Cinderweb Clutchkeeper
    .mob +Cinderweb Matriarch
    .complete 29290,3 -- Molten Lords slain (3)
    .mob +Molten Lord
step
    .isQuestComplete 29290
    .subzone 5745 >>|cRXP_WARN_铸造|r|T514278:0|t[返回熔炉] (6)|cRXP_WARN_返回|r
    .subzoneskip 5748
step
    #optional
    #sticky
    .isOnQuest 29287,29288,29293,29296
    .subzone 5748 >>|cRXP_WARN_使用踏脚石前往火羽山脊. 建议在踏脚石尽头利用通风口, 这样可获得|r|T236222:0|t[康复之风]|cRXP_WARN_buff效果, 使你的攻击速度和急速提升100%, 并让你的跳跃高度和距离远超平常水平|r
step
    #sticky
    #label HowHot
    .isOnQuest 29273
    .use 69806 >>|cRXP_WARN_使用|r|T135155:0|t[索洛的温度计]|cRXP_WARN_在火羽峰|r|cRXP_PICK_熔岩之池|r
    >>|cRXP_WARN_你可以使用|r|T135155:0|t[托洛的温度计]|cRXP_WARN_, 但继续骑乘时|r
    >>|cRXP_WARN_利用|r|T514278:0|t[热力 vents]|cRXP_WARN_分布在火焰柱峰各处, 助你抵达山顶|r
    .complete 29273,2 --|Northeastern Lava Pool sampled: 1/1
    .goto 338,30.748,31.572,-1
    .complete 29273,1 --|Northwestern Lava Pool sampled: 1/1
    .goto 338,21.364,29.851,-1
    .complete 29273,3 --|Central Lava Pool sampled: 1/1
    .goto 338,23.276,41.385,-1
step
    #sticky
    #label FireHawkEgg
    .isOnQuest 29287
    .goto 338,23.790,41.557
    >>从火羽峰顶掠夺|cRXP_LOOT_火鹰卵|r
    >>|cRXP_WARN_利用|r|T514278:0|t[热力 vents]|cRXP_WARN_分布在火焰柱峰各处, 助你抵达山顶|r
    .complete 29287,1 -- Fire Hawk Egg (1)
step
    #sticky
    #label Injured德鲁伊
    .isOnQuest 29293
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>点击|cRXP_FRIENDLY_受伤的德鲁伊 of the Talon|r
    .complete 29293,1 -- 德鲁伊 of the Talon rescued (5)
    .target Druid of the Talon
step
    #sticky
    #label FireHawks
    .isOnQuest 29296
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>击杀|cRXP_ENEMY_火鹰|r
    .complete 29296,1 -- Fire Hawk slain (5)
    .mob Fire Hawk
step
    .isOnQuest 29288
    #label FireHawkHatchling
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>点击|cRXP_FRIENDLY_火鹰雏鸟|r
    >>|cRXP_WARN_火羽峰顶有大量的它们|r
    .complete 29288,1 --  Fire Hawk Hatchling (5)
 step
    #optional
    #requires Injured德鲁伊
step
    #optional
    #requires FireHawkEgg
step
    #optional
    #requires FireHawks
step
    #optional
    #requires HowHot
step
    #optional
    #requires FireHawkHatchling
step
    .isQuestComplete 29290
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29290 >>提交任务“天空中的火焰”
    .target Morthis Whisperwing
step
    .isQuestComplete 29287
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29287 >>提交任务:兴趣高涨
    .target Morthis Whisperwing
step
    .isQuestComplete 29288
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29288 >>交任务:初出茅庐
    .target Morthis Whisperwing
step
    .isQuestComplete 29293
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .dailyturnin 29293 >>交出焦灼之翼
    .target Arthorn Windsong
step
    .isQuestComplete 29296
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .dailyturnin 29296 >>提交 territorial birds
    .target Arthorn Windsong
step
    .isQuestComplete 29273
    .goto 338,51.245,85.865
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    .dailyturnin 29273 >>交出“有多热”
    .target Anren Shadowseeker
step
    .isQuestComplete 29274
    .goto 338,51.555,85.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    .dailyturnin 29274 >>交还沙诺克斯的猎犬
    .target Tholo Whitehoof
step
    .goto 338,47.017,91.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈 
    --.accept 29181 >>接任务: |cRXP_WARN_猛禽德鲁伊|r
    .accept 29214 >>接任务: |cRXP_WARN_暗影守望者|r
    .target Malfurion Stormrage
step
    .isQuestTurnedIn 29181
    +|cRXP_WARN_您已完成今日所有可用的日常任务. 明天重新加载(|r|cRXP_ENEMY_2.5|r- 熔火前线 + 德鲁伊|cRXP_WARN_)指南, 继续完成日常任务, 直到获得足够的|r|T513195:0|t[世界树的印记]
]])

RXPGuides.RegisterGuide([[
#cata
#version 1
#group +熔火前线
#name C_1_TSOM_德鲁伊
--#next D_1_TSOM守卫
--Making guide not auto change so user has choice of which daily quests they want to do out of 德鲁伊/守卫者
#displayname |cRXP_ENEMY_2.5|r - 熔火前线 + 德鲁伊 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    .isQuestAvailable 29181
    +|cRXP_WARN_你必须先收集150|r|T513195:0|t[世界树印记]|cRXP_WARN_, 并提交任务[爪之德鲁伊], 才能完成他们的日常任务|r
    >>|cRXP_WARN_继续完成(|r|cRXP_FRIENDLY_2.0|r- 熔火前线|cRXP_WARN_)指南, 直到你获得足够的|r|T513195:0|t[世界树的印记]
    .goto 198,47.017,91.361
    .turnin 29181 >>交任务: |cRXP_FRIENDLY_猛禽德鲁伊|r
    .target Skylord Omnuron
step
    #optional
    #completewith HyjalQuests
	.zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r << Horde
	.zone 84 >>前往: |cRXP_PICK_暴风城|r << Alliance
	.zoneskip 198
    .zoneskip 338
step
    #optional
    #completewith HyjalQuests
    .goto 85,51.12,38.26 << Horde
    .goto 84,76.199,18.690 << Alliance
    .zone 198 >>前往海加尔传送门
    .zoneskip 338
step
    #optional
    #completewith HyjalQuests
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step --accepted back at sanctuary of malorne
    .goto 198/1,-2088.800,4452.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_队长索伦·月落|r交谈 
    .target Captain Soren Moonfall
    .daily 29128 >>接任务: |cRXP_WARN_海加尔的保卫者|r
step
    #loop
    .goto 198,27.108,62.009,5,0
    .goto 198,27.170,62.563,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r或|cRXP_FRIENDLY_米露恩|r交谈
    .daily 29125,29147,29164,29101,29161 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29125,29147,29164,29101,29161
    .target Matoclaw
    .target Mylune
step
    #loop
    #label HyjalQuests
    .goto 198,27.527,62.510,5,0
    .goto 198,27.172,62.565,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦托克劳|r 或 |cRXP_FRIENDLY_Dorda'en 夜游者|r 交谈
    .daily 29123,29149,29127,29163,29166,29247,29246,29248 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29123,29149,29127,29163,29166,29247,29246,29248
    .target Matoclaw
    .target Dorda'en Nightweaver
step
    .isOnQuest 29166
    #completewith KillNemesis
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29101
    #loop
    .goto 198,22.89,59.91,70,0
    .goto 198,18.58,56.71,70,0
    .goto 198,15.11,48.85,70,0
    .goto 198,19.97,46.22,70,0
    >>点击一个|cRXP_FRIENDLY_托尔托拉之子|r
    >>|cRXP_WARN_瞄准水面并投掷|r |T132219:0|t[投掷乌龟] |cRXP_WARN_(1)|r
    .complete 29101,1 -- Child of Tortolla punted into water (5)
    .target Child of Tortolla
step
    .isOnQuest 29164
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .use 69235 >>|cRXP_WARN_在他们的尸体上使用|r|T134298:0|t[狼的尖牙]|r
    .complete 29164,1 -- Howl atop an invader's corpse (10)
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29147
    #completewith next
    .cast 97241 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽] |cRXP_WARN_来转化成|r|cRXP_FRIENDLY_艾维娜之翼|r
    .use 69234
step
    .isOnQuest 29147
    #loop
    .goto 198,14.90,45.11,80,0
    .goto 198,10.13,36.76,80,0
    .goto 198,13.24,33.64,80,0
    .goto 198,18.65,40.28,80,0
    .use 69234 >>|cRXP_WARN_使用|r|T132172:0|t[召唤鸟群] (1)|cRXP_WARN_ability 靠近|cRXP_FRIENDLY_高山鸣雀|r和|cRXP_FRIENDLY_森林猫头鹰|r和|cRXP_FRIENDLY_金翼雄鹰|r|r
    .complete 29147,1 -- Alpine Songbird gathered (12)
    .target +Alpine Songbird
    .complete 29147,2 -- Forest Owl gathered (5)
    .target +Forest Owl
    .complete 29147,3 -- Goldwing Hawk gathered (2)
    .target +Goldwing Hawk
step
    .isOnQuest 29125
    #loop
    .goto 198,37.32,54.52,70,0
    .goto 198,40.87,55.93,70,0
    .goto 198,36.43,60.73,70,0
    .goto 198,33.45,64.19,70,0
    >>站在玛洛恩之魂面前
    >>|cRXP_WARN_这些是四处乱窜的幽灵鹿|r
    .complete 29125,1 --Spirit of Malorne captured (3)
step
    #completewith next
    .goto 198,14.310,33.203
    .vehicle >>点击|cRXP_PICK_攀爬树|r开始攀爬这棵树
    .target Climbing Tree
    .isOnQuest 29161
step
    .goto 198,14.310,33.203
    >>在树上时, 点击|cRXP_FRIENDLY_海加尔幼熊|r
    .collect 54439,1
    .target Hyjal Bear Cub
    .isOnQuest 29161
step
    .isOnQuest 29161
    .goto 198,14.310,33.203
    *|cRXP_WARN_Cast|r |T450907:0|t[Climb Up] (1) |cRXP_WARN_until you're at the top, aim the arrow at the trampoline beside |cRXP_FRIENDLY_Keeper Taldros|r, then cast|r |T446127:0|t[Chuck-a-bear] (4)|cRXP_WARN_. Cast|r |T450905:0|t[Climb Down] (2) |cRXP_WARN_and repeat the process|r
    .complete 29161,1 --6/6 Hyjal Bear Cubs Rescued
step
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    .isOnQuest 29161
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29161 >>交任务: |cRXP_FRIENDLY_熊就在那里|r
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isQuestTurnedIn 29161
    >>点击任务日志中的任务提交弹出窗口
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isOnQuest 29125
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29125 >>交任务: |cRXP_FRIENDLY_林木之间|r
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isQuestTurnedIn 29125
    >>点击任务日志中的任务提交弹出窗口
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isOnQuest 29147
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29147 >>交任务: |cRXP_FRIENDLY_召唤鸟群|r
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isQuestTurnedIn 29147
    >>点击任务日志中的任务提交弹出窗口
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isOnQuest 29164
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29164 >>交任务: |cRXP_FRIENDLY_让你的吼声更完美|r
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isQuestTurnedIn 29164
    >>点击任务日志中的任务提交弹出窗口
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isOnQuest 29101
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29101 >>交任务: |cRXP_FRIENDLY_踢飞季节|r
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    .isQuestTurnedIn 29101
    >>点击任务日志中的任务提交弹出窗口
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    #completewith next
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .cast 97517 >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_召唤|r|cRXP_ENEMY_派拉奇尼斯|r
    .use 69232
step
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .use 69232 >>击杀|cRXP_ENEMY_派拉齐尼斯|r
    >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_来移除自身身上的|r|T136016:0|t[沸腾毒药箭]|cRXP_WARN_ debuff, 该效果由|r|cRXP_ENEMY_派拉齐尼斯|r施加|r
    .complete 29162,1 --|Pyrachnis slain: 1/1
    .mob Pyrachnis
step
    #completewith next
    .isOnQuest 29126
    .goto 198,41.667,56.130
    .cast 97012 >>|cRXP_WARN_使用|r|T135139:0|t[守护者法杖]|cRXP_WARN_于|cRXP_PICK_ 灰烬堆|r召唤|r|cRXP_ENEMY_ 盖伦格斯|r
    .use 68997
step
    .goto 198,41.667,56.130
    .isOnQuest 29126
    .use 68997 >>击杀|cRXP_ENEMY_盖伦格斯|r
    .complete 29126,1 -- Galenges slain (1)
    .mob Galenges
step
    .isOnQuest 29148
    #completewith next
    .goto 198/1,-1500.700,4929.300
    .cast 97324 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽]|cRXP_WARN_靠近西部火焰传送门来召唤|r|cRXP_ENEMY_米拉盖佐尔|r
    .use 69212
step
    .isOnQuest 29148
    .goto 198/1,-1500.700,4929.300
    .use 69212 >>击杀|cRXP_ENEMY_米拉盖佐尔|r
    .complete 29148,1 -- Millagazor slain (1)
    .mob Millagazor
step
    .isOnQuest 29165
    #completewith next
    .goto 198,41.667,56.130
    .cast 97498 >>|cRXP_WARN_使用|r|T134298:0|t[狼的尖牙] |cRXP_WARN_来召唤|r|cRXP_ENEMY_莱拉克斯|r
    .use 69225
step
    .isOnQuest 29165
    .goto 198,41.667,56.130
    .use 69225 >>击杀|cRXP_ENEMY_莱拉克斯|r
    .complete 29165,1 -- Lylagar slain (1)
    .mob Lylagar
step
    .isOnQuest 29122
    #completewith next
    .goto 198,24.014,55.803
    .gossip 52425,0 >>与|cRXP_FRIENDLY_图加|r交谈以召唤|cRXP_ENEMY_涅墨西斯|r
    .skipgossip
    .target Tooga
step
    #label KillNemesis
    .isOnQuest 29122
    .goto 198,24.760,55.259
    >>击杀|cRXP_ENEMY_涅墨西斯|r
    >>|cRXP_WARN_站在|cRXP_FRIENDLY_Tooga's|r的壳下, 以躲避|r|cRXP_ENEMY_Nemesis'|r|T135830:0|t[熔火之怒]|cRXP_WARN_cast|r
    .complete 29122,1 -- Nemesis slain (1)
    .target Tooga
    .mob Nemesis
step
    .isOnQuest 29166
    #loop
    .goto 198,29.53,56.21,70,0
    .goto 198,36.15,52.44,70,0
    .goto 198,35.94,58.80,70,0
    .goto 198,24.27,62.12,70,0
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step -- 29248 Releasing the Pressure
    .isOnQuest 29248
    .goto 198,32.0,59.8,70,0
    .goto 198,36.6,54.8,70,0
    .goto 198,39.2,62.6,70,0
    .goto 198,34.6,64.6,70,0
    .goto 198,30.6,52.2,70,0
    >>击杀 |cRXP_ENEMY_灼焦火妖|r. 从他们身上获取 |cRXP_LOOT_火妖的鳞片|r
    .complete 29248,1 -- Flamewaker Scale (100)
    .mob Charred Flamewaker
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #completewith FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step -- 29247 Treating the Wounds
    .isOnQuest 29247
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r. 从它们身上搜刮|cRXP_LOOT_沾满硫磺的包裹|r
    .complete 29247,1 -- Sulfur-Laced Wrapping (4)
    .mob Fiery Behemoth
step -- 29246 Relieving the Pain
    .isOnQuest 29246
    #label FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_炽热的葬火领主|r. 击败他们以获取他们的|cRXP_LOOT_烈焰裹附核心|r
    .complete 29246,1 -- Flame-Wreathed Heart (4)
    .mob Seething Pyrelord
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step
    .isQuestComplete 29162
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29162 >>交还自然的祝福
step
    .isQuestComplete 29122
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29122 >>交还涅墨西斯之回响
step
    .isQuestComplete 29126
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29126 >>交还玛洛恩之力
step
    .isQuestComplete 29165
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29165 >>提交《狼群的召唤》
step
    .isQuestComplete 29148
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29148 >>交还燃烧之翼
step
    .isQuestComplete 29166
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29166 >>提交补给给另一方
step
    .isQuestComplete 29123
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29123 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29149
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29149 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29127
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29127 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29163
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29163 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29246
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29246 >>提交任务:缓解痛苦
step
    .isQuestComplete 29247
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29247 >>交还《治疗伤口》
step
    .isQuestComplete 29248
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29248 >>提交任务:释放压力
step
    #completewith RayneFeathersong
    .isQuestComplete 29128
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isQuestTurnedIn 29215 -- If turned in quest to unlock 守卫者
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .daily 29255,29257,29299 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Avrilla
step
    #label RayneFeathersong
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .daily 29139,29143 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Rayne Feathersong
step
    .isQuestTurnedIn 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    >>|cRXP_WARN_如果今天|cRXP_FRIENDLY_莉吉特|r 没有在此提供任务, 请跳过此步骤|r
    .target Ricket
step
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .daily 29138 >>接任务: |cRXP_WARN_烧伤患者|r
    .target Captain Irontree
step
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .daily 29179 >>接任务: |cRXP_WARN_元素敌人|r
    .daily 29304,29141,29142,29137 >>接任务: |cRXP_WARN_灭火之怒|r
    .target General Taldris Moonfall
step
    .isQuestComplete 29128
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29128 >>交还《海加尔的守护者》任务物品
    .target General Taldris Moonfall
step -- 29138 Burn Victims
    .isOnQuest 29138
    #sticky
    #label BurnVictims
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .use 69240 >>|cRXP_WARN_使用|r|T463860:0|t[魔法药膏], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_受伤的海加尔防御者|r
    .complete 29138,1 -- Wounded Hyjal Defender saved 1/1
    .target Wounded Hyjal Defender
step -- Embergris 29255
    .isOnQuest 29255
    #label Embergris
    #sticky
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦士兵|r和|cRXP_ENEMY_灼焦征服者|r. 从他们身上搜取|cRXP_LOOT_烬蜡|r
    .complete 29255,1 -- Embergris (5)
    .mob Charred Soldier
    .mob Charred Vanquisher
step -- 29179 Hostile Elements
    .isOnQuest 29179
    #sticky
    #label HostileElements
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦征服者|r和|cRXP_ENEMY_灼焦士兵|r
    .complete 29179,1 -- Charred Combatant slain (8)
    .mob Charred Vanquisher
    .mob Charred Soldier
step -- 29304 The Dogs of War
    .isOnQuest 29304
    #sticky
    #label TheDogs
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_灼焦恶犬|r 和|cRXP_ENEMY_上古灼焦恶犬|r
    .complete 29304,1 -- Ancient Charhound slain (5)
    .mob Charhound
    .mob Ancient Charhound
step -- 29141 The Harder They Fall
    .isOnQuest 29141
    #sticky
    #label HarderTheyFall
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔火巨兽|r
    .complete 29141,1 -- Molten Behemoth slain (3)
    .mob Molten Behemoth
step -- 29142 Traitors Return
    .isOnQuest 29142
    #sticky
    #label TraitorsReturn
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,71.0,38.6,45,0
    >>击杀|cRXP_ENEMY_火焰德鲁伊|r
    .complete 29142,1 -- Druid of the Flame slain (3)
    .mob Druid of the Flame
step -- 29137 Breach in the Defenses
    .isOnQuest 29137
    #sticky
    #label Breach
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔岩破坏者|r
    .complete 29137,1 -- Lava Burster slain (5)
    .mob Lava Burster
step -- 29139 Aggressive Growth
    .isOnQuest 29139
    #sticky
    #label AggressiveGrowth
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>点击地面上的|cRXP_PICK_燃灰堆|r
    .complete 29139,1 -- Smothervine planted (5)
step -- Steal Magmolias 29257
    .isOnQuest 29257
    #label StealMagmolias
    #sticky
    #loop
    .goto 338,47.7,59.6,45,0
    .goto 338,41.5,43.6,45,0
    .goto 338,54.5,45.5,45,0
    >>在小熔岩池中击杀熔岩花获取 loot
    >>|cRXP_WARN_如果在掠夺一个|r|cRXP_ENEMY_熔岩破坏者|r后刷新, 击杀它并掠夺其掉落的|r|cRXP_LOOT_熔岩花|r|r
    .complete 29257,1 -- Magmolia (8)
    .mob Lava Burster
step -- Some Like It Hot 29299
    .isOnQuest 29299
    #label LikeItHot
    #sticky
    #loop
    .goto 338,50.6,68.6,45,0
    .goto 338,42.2,60.2,45,0
    .goto 338,42.8,41.8,45,0
    .goto 338,56.2,46.8,45,0
    .goto 338,54.6,61.6,45,0
    >>|cRXP_WARN_带上你的|r火红鞭笞者|r并战斗|r|cRXP_ENEMY_熔焰蝎虫|r|r << !Hunter
    >>|cRXP_WARN_施放|r|T135834:0|t[冰冻陷阱]|cRXP_WARN_于|r|cRXP_ENEMY_熔焰蝎虫|r上. 它会持续施放|r|T135826:0|t[余烬池]|cRXP_WARN_,  while你的|r|cRXP_FRIENDLY_火红鞭笞者|r正在饮用, 这样你只需一只|r|cRXP_ENEMY_熔焰蝎虫|r即可完成此日常任务|r << Hunter
    >>|cRXP_WARN_|r|cRXP_ENEMY_熔焰蝎虫|r将施放|r|T135826:0|t[余烬池]|cRXP_WARN_, 你的|cRXP_FRIENDLY_火红鞭笞者|r会饮用|r|r
    .complete 29299,1 -- Help the Crimson Lasher Drink from Ember Pools (6)
    .mob Emberspit Scorpion
step -- 29263 A Bitter Pill
    .isOnQuest 29263
    #label MagmaWorm
    #sticky
    #loop
    .goto 338,43.8,46.8,50,0
    .goto 338,53.6,41.8,50,0
    .goto 338,55.6,54.6,50,0
    .goto 338,44.8,54.4,50,0
    >>点击熔岩池中的|cRXP_PICK_熔岩气泡|r以召唤|cRXP_ENEMY_潜地熔岩虫|r
    .use 69759 >>|cRXP_WARN_当你看到警告信息:“虫子要咬了！现在立即放置炸弹！”时使用|r|T133710:0|t[苦果炸弹]
    .complete 29263,1 -- Subterranean Magma Worm slain 1/1
    .mob Subterranean Magma Worm
step -- 29278 Living Obsidium
    .isOnQuest 29278
    #label ObsidiumMeteorite
    #sticky
    #loop
    .goto 338,41.5,49.8,50,0
    .goto 338,46.6,43.1,50,0
    .goto 338,54.6,43.8,50,0
    .goto 338,51.5,51.2,50,0
    >>点击|cRXP_PICK_磁石|r, 然后拾取掉落的|cRXP_LOOT_黑曜石陨星|r
    .complete 29278,1 -- Obsidium Meteorite (10)
    .target Magnetic Stone
step -- 29143 Wisp Away
    .isOnQuest 29143
    #sticky
    #label WispAway
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>|cRXP_WARN_带着跟随你的海加尔小精灵前往火焰传送门|r
    >>|cRXP_WARN_击杀从里面出来的怪物. 确保 |cRXP_FRIENDLY_海加尔小精灵|r 不会死亡！|r
    .complete 29143,1 -- Close a Fire Portal 1/1
step
    #optional 
    #requires MagmaWorm
step
    #optional 
    #requires ObsidiumMeteorite
step
    #optional 
    #requires Embergris
step
    #optional
    #requires StealMagmolias
step
    #optional
    #requires LikeItHot
step
    #optional
    #requires BurnVictims
step
    #optional
    #requires HostileElements
step
    #optional
    #requires TheDogs
step
    #optional
    #requires HarderTheyFall
step
    #optional
    #requires TraitorsReturn
step
    #optional
    #requires Breach
step
    #optional
    #requires AggressiveGrowth
step
    #optional
    #requires WispAway
step
    .isQuestComplete 29255
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29255 >>交还烬蜡
    .target Avrilla
step
    .isQuestComplete 29257
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29257 >>交出偷来的熔岩花
    .target Avrilla
step
    .isQuestComplete 29299
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29299 >>提交“一些像它热”
    .target Avrilla
step
    .isQuestComplete 29139
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29139 >>提交任务“激进成长”
    .target Rayne Feathersong
step
    .isQuestComplete 29143
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29143 >>交出小精灵
    .target Rayne Feathersong
step
    .isQuestComplete 29263
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29263 >>交还苦药丸
    .target Damek Bloombeard
step
    .isQuestComplete 29278
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29278 >>交出活体黑曜石
    .target Damek Bloombeard
step
    .isQuestComplete 29295
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29295 >>交还“越大越强”
    .target Damek Bloombeard
step
    .isQuestComplete 29297
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29297 >>交还“再见, 伯迪”
    .target Damek Bloombeard
step
    .isQuestComplete 29179
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29179 >>提交敌对元素
    .target General Taldris Moonfall
step
    .isQuestComplete 29304
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29304 >>交出《战争之犬》
    .target General Taldris Moonfall
step
    .isQuestComplete 29141
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29141 >>交出《他们先杀了我父亲》
    .target General Taldris Moonfall
step
    .isQuestComplete 29142
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29142 >>交还叛徒的归来
    .target General Taldris Moonfall
step
    .isQuestComplete 29137
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29137 >>交任务: |cRXP_FRIENDLY_防线上的突破口|r
    .target General Taldris Moonfall
step
    .isQuestComplete 29138
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .dailyturnin 29138 >>提交烧伤受害者任务
    .target Captain Irontree

-- Checking if can turn in The Shadow 守卫者 before starting 德鲁伊 quests for the day
step
    .goto 338,47.017,91.361
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈 
    .accept 29214 >>接任务: |cRXP_WARN_暗影守望者|r
    .target Malfurion Stormrage
step
    #completewith THB
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
step
    .isQuestComplete 29214
    .goto 198,26.799,62.157
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨伊娜·风驰队长|r交谈 
    .turnin 29214 >>交任务: |cRXP_FRIENDLY_暗影守望者|r
    .target Captain Saynna Stormrunner

-- Beginning of 守卫者 questline if turned in
step
    #label THB
    .isQuestTurnedIn 29214
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    >>|cRXP_WARN_注意:如果您刚提交了【暗影守望者】任务, 但|cRXP_FRIENDLY_麦托克劳|r尚未提供此任务, 请等到当日日常任务重置后再尝试领取. 建议明天再检查一次|r
    .target Matoclaw
    .accept 29215 >>接任务: |cRXP_LOOT_开始狩猎|r
step
    #completewith ITF
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29215
    .goto 338,47.584,90.558
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨伊娜·风驰队长|r交谈 
    .turnin 29215 >>交任务: |cRXP_FRIENDLY_开始狩猎|r
    .target Captain Saynna Stormrunner
step
    #completewith next
    .goto 338,57.02,66.92,40,0
    .goto 338,71.30,38.43
    .subzone 5744 >>前往野火角
step
    .isQuestTurnedIn 29215
    .goto 338,71.309,38.430
    >>击杀一个查特. 它会在地上掉落一个干橡子
    >>|cRXP_WARN_你必须在烈焰尖刺击杀|cRXP_ENEMY_火焰德鲁伊|r, 灰烬原野的不算|r
    >>点击地上的|cRXP_PICK_干橡子|r
    .accept 29245 >>接任务: |cRXP_WARN_神秘的种子|r
    .mob Druid of the Flame
step
    .isQuestTurnedIn 29215
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .turnin 29245 >>交任务: |cRXP_FRIENDLY_神秘的种子|r
    .accept 29249 >>接任务: |cRXP_WARN_植树的季节|r
    .target Avrilla
step
    .isOnQuest 29249
    .goto 338,53.527,90.736
    .cast 8386,6477,6478 >>点击地面上的|cRXP_PICK_安戈洛的泥土|r
    .timer 10,Planting Season RP
step
    .isQuestTurnedIn 29215
    .goto 338,53.527,90.736
    >>|cRXP_WARN_等待RP结束|r
    .complete 29249,1 -- Acorn Planted 1/1
step
    .isQuestTurnedIn 29215
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29249 >>交任务: |cRXP_FRIENDLY_植树的季节|r
    .accept 29254 >>接任务: |cRXP_WARN_小小的鞭笞者|r
    .target Avrilla
step
    .isQuestTurnedIn 29215
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .turnin 29254 >>交任务: |cRXP_FRIENDLY_小小的鞭笞者|r
    .target Avrilla
step
    .isQuestTurnedIn 29215
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .daily 29255,29257,29299 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Avrilla
step -- Embergris 29255
    .isOnQuest 29255
    #sticky
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦士兵|r和|cRXP_ENEMY_灼焦征服者|r. 从他们身上搜取|cRXP_LOOT_烬蜡|r
    .complete 29255,1 -- Embergris (5)
    .mob Charred Soldier
    .mob Charred Vanquisher
step -- Steal Magmolias 29257
    .isOnQuest 29257
    #sticky
    #loop
    .goto 338,47.7,59.6,45,0
    .goto 338,41.5,43.6,45,0
    .goto 338,54.5,45.5,45,0
    >>在小熔岩池中击杀熔岩花获取 loot
    >>|cRXP_WARN_如果在掠夺一个|r|cRXP_ENEMY_熔岩破坏者|r后刷新, 击杀它并掠夺其掉落的|r|cRXP_LOOT_熔岩花|r|r
    .complete 29257,1 -- Magmolia (8)
    .mob Lava Burster
step -- Some Like It Hot 29299
    .isOnQuest 29299
    #sticky
    #loop
    .goto 338,50.6,68.6,45,0
    .goto 338,42.2,60.2,45,0
    .goto 338,42.8,41.8,45,0
    .goto 338,56.2,46.8,45,0
    .goto 338,54.6,61.6,45,0
    >>|cRXP_WARN_带上你的|r火红鞭笞者|r并战斗|r|cRXP_ENEMY_熔焰蝎虫|r|r << !Hunter
    >>|cRXP_WARN_施放|r|T135834:0|t[冰冻陷阱]|cRXP_WARN_于|r|cRXP_ENEMY_熔焰蝎虫|r上. 它会持续施放|r|T135826:0|t[余烬池]|cRXP_WARN_,  while你的|r|cRXP_FRIENDLY_火红鞭笞者|r正在饮用, 这样你只需一只|r|cRXP_ENEMY_熔焰蝎虫|r即可完成此日常任务|r << Hunter
    >>|cRXP_WARN_|r|cRXP_ENEMY_熔焰蝎虫|r将施放|r|T135826:0|t[余烬池]|cRXP_WARN_, 你的|cRXP_FRIENDLY_火红鞭笞者|r会饮用|r|r
    .complete 29299,1 -- Help the Crimson Lasher Drink from Ember Pools (6)
    .mob Emberspit Scorpion
step
    .isQuestComplete 29255
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29255 >>交还烬蜡
    .target Avrilla
step
    .isQuestComplete 29257
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29257 >>交出偷来的熔岩花
    .target Avrilla
step
    .isQuestComplete 29299
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29299 >>提交“一些像它热”
    .target Avrilla
step
    #label ITF
    .isQuestTurnedIn 29181
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .daily 29206 >>接任务: |cRXP_WARN_进入火焰之中|r
    .target General Taldris Moonfall
step
    .isOnQuest 29206
    .goto 338,43.15,80.14,10,0
    .goto 338,33.83,67.40
    >>护送并保护|cRXP_FRIENDLY_Windcaller|r穿越火焰
    >>在终点处击杀葬火领主
    >>在火堆旁, 如果附近没有风语者, 就与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈
    .complete 29206,1 -- Druid of the Talon Windcaller protected 1/1
    .mob Flamewaker Assassin
    .mob Pyrelord
    .target Windcaller Nordrala
    .target Windcaller Voramus
    .skipgossip
step << skip
    .goto 338,34.400,66.213
    .subzone 5746 >>点击|cRXP_PICK_垂降绳索|r以垂降进入熔岩流
step
    #completewith next
    .subzone 5746 >>|cRXP_WARN_从大洞口掉下去. 朝|r|cRXP_FRIENDLY_希萨莉·黑鸦的方向走去|r
step
    .isQuestTurnedIn 29181
    .goto 338,42.541,59.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希萨莉·黑鸦|r交谈
    .dailyturnin 29206 >>提交任务:投入火中
    .daily 29264 >>接任务: |cRXP_WARN_熔火激流的火妖|r
    .daily 29265 >>接任务: |cRXP_WARN_火焰之花|r
    .target Thisalee Crow
step
    .isQuestTurnedIn 29272
    .goto 338,41.772,61.475
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    >>|cRXP_WARN_注意:如果|cRXP_FRIENDLY_安伦·觅影者|r未在此地下生成, 请跳过此步骤|r
    .daily 29274 >>接任务: |cRXP_WARN_沙恩诺克斯的猎狗|r
    .target Anren Shadowseeker
    .questcount <1,29273,29274
step -- 29264 Flamewakers of the Molten Flow
    .isOnQuest 29264
    #sticky
    #label FOTMF
    #loop
    .goto 338,50.15,58.80,70,0
    .goto 338,43.39,51.11,70,0
    .goto 338,51.48,39.68,70,0
    .goto 338,52.74,54.06,70,0
    >>击杀|cRXP_ENEMY_火妖哨兵|r和|cRXP_ENEMY_火妖猎人|r和|cRXP_ENEMY_火妖萨满|r
    .complete 29264,1 -- Flamewaker slain (8)
    .mob Flamewaker Sentinel
    .mob Flamewaker Shaman
    .mob Flamewaker Hunter
step
    .isOnQuest 29274
    #sticky
    #label Houndbones
    #loop
    .goto 338,50.15,58.80,70,0
    .goto 338,43.39,51.11,70,0
    .goto 338,51.48,39.68,70,0
    .goto 338,52.74,54.06,70,0
    >>击杀|cRXP_ENEMY_灼焦恶犬|r. 从它们身上搜刮|cRXP_LOOT_猎狗骨灰|r
    .complete 29274,1 -- Houndbone Ash (6)
    .mob Charhound
step -- 29265 Fire Flowers
    .isOnQuest 29265
    #sticky
    #label Lucifern
    #loop
    .goto 338,50.15,58.80,70,0
    .goto 338,43.39,51.11,70,0
    .goto 338,51.48,39.68,70,0
    .goto 338,52.74,54.06,70,0
    >>在地面上掠夺|cRXP_LOOT_炼狱花|r
    .complete 29265,1 -- Lucifern (5)
step
    #optional
    #requires FOTMF
step
    #optional
    #requires Lucifern
step
    #optional
    #requires Houndbones
step
    .isQuestComplete 29264
    .goto 338,42.541,59.713
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希萨莉·黑鸦|r交谈
    .dailyturnin 29264 >>交还熔岩流的烈焰行者
    .target Thisalee Crow
step
    #label ExitUnderground
    #completewith DruidEnd
    .goto 338,33.08,67.62
    .aura 98833 >>|cRXP_WARN_回到你之前跳下的那个大开口处. 站在|r|T514278:0|t[热能喷口]|cRXP_WARN_, 然后跳回熔火前线的表面|r
    .subzoneskip 5746,1
step
    #requires ExitUnderground
    #completewith DruidEnd
    .goto 338,33.08,67.62
    +|cRXP_WARN_跳回熔火前线表面|r
    .subzoneskip 5746,1
step
    .isQuestTurnedIn 29272
    .goto 338,35.985,58.974
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    .daily 29273 >>接任务: |cRXP_WARN_到底有多热|r
    .disablecheckbox
    .target Tholo Whitehoof
    .questcount <1,29273,29274
step
    .isQuestComplete 29265
    .goto 338,36.299,56.344
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楚伦娜|r交谈
    .dailyturnin 29265 >>交出火焰之花
    .target Choluna
step -- Ricket @ DRUIDS
    .isQuestTurnedIn 29282
    .goto 338,36.251,56.586
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    >>|cRXP_WARN_如果她不在这里, 请跳过此步骤|r
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Ricket
step
    .isQuestTurnedIn 29181
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .daily 29290,29287,29288 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Morthis Whisperwing
step
    .isQuestTurnedIn 29181
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .daily 29293,29296 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Arthorn Windsong
step
    #completewith next
    .goto 338,33.808,57.177
    .isOnQuest 29290
    .vehicle >>骑乘|cRXP_FRIENDLY_驯服的火鹰|r
    .target Trained Fire Hawk
step
    .isOnQuest 29290
    >>|cRXP_WARN_施放|r|T135821:0|t[火焰种子] (1)|cRXP_WARN_and|r|T451164:0|t[火焰爆裂] (2)|cRXP_WARN_以击杀|cRXP_ENEMY_烈焰行者|r和|cRXP_ENEMY_熔丝蛛|r和|r|cRXP_ENEMY_熔火领主|r
    .complete 29290,1 -- Amassing Flamewakers slain  (100)
    .mob +Flamewaker Centurion
    .mob +Flamewaker Cauterizer
    .mob +Flamewaker Incinerator
    .complete 29290,2 -- Amassing Cinderwebs slain  (40)
    .mob +Cinderweb Skitterer
    .mob +Cinderweb Clutchkeeper
    .mob +Cinderweb Matriarch
    .complete 29290,3 -- Molten Lords slain (3)
    .mob +Molten Lord
step
    .isQuestComplete 29290
    .subzone 5745 >>|cRXP_WARN_铸造|r|T514278:0|t[返回熔炉] (6)|cRXP_WARN_返回|r
    .subzoneskip 5748
step
    #optional
    #sticky
    .isOnQuest 29287,29288,29293,29296,29273
    .subzone 5748 >>|cRXP_WARN_使用踏脚石前往火羽山脊. 建议在踏脚石尽头利用通风口, 这样可获得|r|T236222:0|t[康复之风]|cRXP_WARN_buff效果, 使你的攻击速度和急速提升100%, 并让你的跳跃高度和距离远超平常水平|r
step
    #sticky
    #label HowHot
    .isOnQuest 29273
    .use 69806 >>|cRXP_WARN_使用|r|T135155:0|t[索洛的温度计]|cRXP_WARN_在火羽峰|r|cRXP_PICK_熔岩之池|r
    >>|cRXP_WARN_你可以使用|r|T135155:0|t[托洛的温度计]|cRXP_WARN_, 但继续骑乘时|r
    >>|cRXP_WARN_利用|r|T514278:0|t[热力 vents]|cRXP_WARN_分布在火焰柱峰各处, 助你抵达山顶|r
    .complete 29273,2 --|Northeastern Lava Pool sampled: 1/1
    .goto 338,30.748,31.572,-1
    .complete 29273,1 --|Northwestern Lava Pool sampled: 1/1
    .goto 338,21.364,29.851,-1
    .complete 29273,3 --|Central Lava Pool sampled: 1/1
    .goto 338,23.276,41.385,-1
step
    #sticky
    #label FireHawkEgg
    .isOnQuest 29287
    .goto 338,23.790,41.557
    >>从火羽峰顶掠夺|cRXP_LOOT_火鹰卵|r
    >>|cRXP_WARN_利用|r|T514278:0|t[热力 vents]|cRXP_WARN_分布在火焰柱峰各处, 助你抵达山顶|r
    .complete 29287,1 -- Fire Hawk Egg (1)
step
    #sticky
    #label Injured德鲁伊
    .isOnQuest 29293
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>点击|cRXP_FRIENDLY_受伤的德鲁伊 of the Talon|r
    .complete 29293,1 -- 德鲁伊 of the Talon rescued (5)
    .target Injured Druid of the Talon
step -- 29295 The Bigger They Are -- DRUIDS ONLY
    .isOnQuest 29295
    #sticky
    #label ObsidiumChips
    #loop
    .goto 338,29.7,28.5,50,0
    .goto 338,16.8,32.5,50,0
    .goto 338,19.5,49.5,50,0
    .goto 338,32.7,43.6,50,0
    >>击杀|cRXP_ENEMY_黑曜石惩罚者|r. 在其死亡后, 从地面上的|cRXP_LOOT_活体黑曜石碎片|r碎片中收集战利品
    .complete 29295,1 -- Living Obsidium Chip (10)
    .mob Obsidium Punisher
step
    #sticky
    #label FireHawks
    .isOnQuest 29296
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>击杀|cRXP_ENEMY_火鹰|r
    .complete 29296,1 -- Fire Hawk slain (5)
    .mob Fire Hawk
step
    .isOnQuest 29288
    #label FireHawkHatchling
    #loop
    .goto 338,28.2,46.7,70,0
    .goto 338,28.5,33.0,70,0
    .goto 338,19.4,29.7,70,0
    .goto 338,16.7,39.4,70,0
    >>点击|cRXP_FRIENDLY_火鹰雏鸟|r
    >>|cRXP_WARN_火羽峰顶有大量的它们|r
    .complete 29288,1 --  Fire Hawk Hatchling (5)
step
    #optional
    #requires Injured德鲁伊
step
    #optional
    #requires FireHawkEgg
step
    #optional
    #requires FireHawks
step
    #optional
    #requires HowHot
step
    #optional
    #requires FireHawkHatchling
step
    #optional
    #requires ObsidiumChips
step
    .isQuestComplete 29290
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29290 >>提交任务“天空中的火焰”
    .target Morthis Whisperwing
step
    .isQuestComplete 29287
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29287 >>提交任务:兴趣高涨
    .target Morthis Whisperwing
step
    .isQuestComplete 29288
    .goto 338,34.496,56.208
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫希斯·轻翼|r交谈
    .dailyturnin 29288 >>交任务:初出茅庐
    .target Morthis Whisperwing
step
    .isQuestComplete 29293
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .dailyturnin 29293 >>交出焦灼之翼
    .target Arthorn Windsong
step
    .isQuestComplete 29296
    .goto 338,34.295,56.419
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿尔索恩·风歌|r 交谈
    .dailyturnin 29296 >>提交 territorial birds
    .target Arthorn Windsong
step
    .isQuestTurnedIn 29284
    .goto 338,36.299,56.344
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楚伦娜|r交谈
    .daily 29305 >>接任务: |cRXP_WARN_直击要害|r
    .target Choluna
step
    .isOnQuest 29305
    .goto 338,50.343,23.036
    >>杀死一名火焰的中尉
    .complete 29305,1 -- Lieutenant of Flame slain
    .mob Ancient Charscale
    .mob Ancient Smoldering Behemoth
    .mob Ancient Firelord
    .mob Cinderweb Queen
    .mob Devout Harbinger
 step
    .isQuestComplete 29305
    .goto 338,43.033,80.597
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈
    .dailyturnin 29305 >>提交任务:突袭心脏
    .target Skylord Omnuron
step
    .isQuestComplete 29295
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29295 >>交还“越大越强”
    .target Damek Bloombeard
step
    .isQuestComplete 29273
    .goto 338,51.245,85.865
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    .dailyturnin 29273 >>交出“有多热”
    .target Anren Shadowseeker
step
    .isQuestComplete 29274
    .goto 338,51.555,85.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    .dailyturnin 29274 >>交还沙诺克斯的猎犬
    .target Tholo Whitehoof

--Calling the Ancients unlock
step
    .isQuestTurnedIn 29182 -- 德鲁伊 prereq
    .isQuestTurnedIn 29215 -- Warden prereq
    .goto 338,44.434,88.790
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔兰·高枝|r交谈
    .accept 29283 >>接任务: |cRXP_WARN_呼唤古树|r
    .target Varlan Highbough
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29283
    .goto 198,26.005,61.302
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老树干|r交谈
    .turnin 29283 >>交任务: |cRXP_FRIENDLY_呼唤古树|r
    .target Elderlimb
step
    .isQuestTurnedIn 29283
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .accept 29284 >>接任务: |cRXP_WARN_古树的援助|r
step
    #optional
    #completewith WardenEnd
    .isOnQuest 29284
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29284
    .goto 338,43.812,88.964
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老树干|r交谈
    .turnin 29284 >>交任务: |cRXP_FRIENDLY_古树的援助|r
    .target Elderlimb
step
    .isQuestTurnedIn 29284
    .goto 338,36.299,56.344
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楚伦娜|r交谈
    .daily 29305 >>接任务: |cRXP_WARN_直击要害|r
    .target Choluna
step
    .isOnQuest 29305
    .goto 338,50.343,23.036
    >>杀死一名火焰的中尉
    .complete 29305,1 -- Lieutenant of Flame slain
    .mob Ancient Charscale
    .mob Ancient Smoldering Behemoth
    .mob Ancient Firelord
    .mob Cinderweb Queen
    .mob Devout Harbinger
 step
    .isQuestComplete 29305
    .goto 338,43.033,80.597
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_啸天者欧穆隆|r交谈
    .dailyturnin 29305 >>提交任务:突袭心脏
    .target Skylord Omnuron
--Complete Calling the Ancients unlock

--Additional Armaments unlock
step
    .isQuestTurnedIn 29182 -- 德鲁伊 prereq
    .isQuestTurnedIn 29215 -- Warden prereq
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .accept 29281 >>接任务: |cRXP_WARN_追加军火|r
    .target Damek Bloombeard
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29281
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .turnin 29281 >>交任务: |cRXP_FRIENDLY_追加军火|r
    .accept 29282 >>接任务: |cRXP_WARN_全副武装|r
step
    .isQuestTurnedIn 29281
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .accept 29282 >>接任务: |cRXP_WARN_全副武装|r
step
    #optional
    #completewith next
    .isOnQuest 29282
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .target Ricket
    .turnin 29282 >>交任务: |cRXP_FRIENDLY_全副武装|r
step
    .isQuestTurnedIn 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Ricket
step -- 29263 A Bitter Pill
    .isOnQuest 29263
    #loop
    .goto 338,43.8,46.8,50,0
    .goto 338,53.6,41.8,50,0
    .goto 338,55.6,54.6,50,0
    .goto 338,44.8,54.4,50,0
    >>点击熔岩池中的|cRXP_PICK_熔岩气泡|r以召唤|cRXP_ENEMY_潜地熔岩虫|r
    .use 69759 >>|cRXP_WARN_当你看到警告信息:“虫子要咬了！现在立即放置炸弹！”时使用|r|T133710:0|t[苦果炸弹]
    .complete 29263,1 -- Subterranean Magma Worm slain 1/1
    .mob Subterranean Magma Worm
step -- 29278 Living Obsidium
    .isOnQuest 29278
    #loop
    .goto 338,41.5,49.8,50,0
    .goto 338,46.6,43.1,50,0
    .goto 338,54.6,43.8,50,0
    .goto 338,51.5,51.2,50,0
    >>点击|cRXP_PICK_磁石|r, 然后拾取掉落的|cRXP_LOOT_黑曜石陨星|r
    .complete 29278,1 -- Obsidium Meteorite (10)
    .target Magnetic Stone
step -- 29295 The Bigger They Are -- DRUIDS ONLY
    .isOnQuest 29295
    #loop
    .goto 338,29.7,28.5,50,0
    .goto 338,16.8,32.5,50,0
    .goto 338,19.5,49.5,50,0
    .goto 338,32.7,43.6,50,0
    >>击杀|cRXP_ENEMY_黑曜石惩罚者|r. 在其死亡后, 从地面上的|cRXP_LOOT_活体黑曜石碎片|r碎片中收集战利品
    .complete 29295,1 -- Living Obsidium Chip (10)
    .mob Obsidium Punisher
step -- 29297 Bye Bye Burdy -- WARDENS ONLY
    .isOnQuest 29297
    #loop
    .goto 338,73.03,54.88,50,0
    .goto 338,73.82,38.28,50,0
    .goto 338,63.73,38.76,50,0
    .use 69832 >>|cRXP_WARN_使用|r|T135129:0|t[戳鸟之矛], |cRXP_WARN_目标: |r|cRXP_ENEMY_火焰德鲁伊|r, 它们正在空中飞行|r
    .complete 29297,1 -- 德鲁伊 of the Flame in Fire Crow form slain (3)
    .mob Druid of the Flame
step
    .isQuestComplete 29263
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29263 >>交还苦药丸
    .target Damek Bloombeard
step
    .isQuestComplete 29278
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29278 >>交出活体黑曜石
    .target Damek Bloombeard
step
    .isQuestComplete 29295
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29295 >>交还“越大越强”
    .target Damek Bloombeard
step
    .isQuestComplete 29297
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29297 >>交还“再见, 伯迪”
    .target Damek Bloombeard
--Complete Additional Armaments unlock

--Filling the Moonwell unlock
step
    .goto 338,44.087,86.321
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉·影暴|r交谈
    .accept 29279 >>接任务: |cRXP_WARN_注满月井|r
    .target Ayla Shadowstorm
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29279
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .turnin 29279 >>交任务: |cRXP_FRIENDLY_注满月井|r
    .accept 29280 >>接任务: |cRXP_WARN_滋养之水|r
    .target Matoclaw
step
    .isQuestTurnedIn 29279
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .accept 29280 >>接任务: |cRXP_WARN_滋养之水|r
    .target Matoclaw
step
    #optional
    #completewith next
    .isOnQuest 29280
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29280
    .goto 338,44.087,86.321
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉·影暴|r交谈
    .target Ayla Shadowstorm
    .turnin 29280 >>交任务: |cRXP_FRIENDLY_滋养之水|r
step
    .isQuestTurnedIn 29280
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .accept 29203 >>接任务: |cRXP_WARN_深入神庙|r
step
    .isOnQuest 29203
    #completewith next
    .goto 338,57.491,49.532,15 >>进入火成深处
step
    .isOnQuest 29203
    .goto 338,64.615,59.216
    >>击杀|cRXP_ENEMY_莱雅娜|r
    .complete 29203,1 -- Leyara slain 1/1
    .mob Leyara
step
    .isQuestComplete 29203
    #completewith next
    .goto 338,57.491,49.532,15 >>离开火成深渊
    .subzoneskip 5741,1
step
    .isQuestComplete 29203
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 29203 >>交任务: |cRXP_FRIENDLY_深入神庙|r
step
    .isQuestTurnedIn 29203
    >>|cRXP_WARN_你现在已经收到|r|cRXP_FRIENDLY_瑟蕾莎·树皮|r|r的邮件, 其中附有|r|T514925:0|t[|cRXP_LOOT_烟熏过的坠饰|r]
    .use 69854 >>|cRXP_WARN_使用|r|T514925:0|t[|cRXP_LOOT_烟熏过的坠饰|r]|cRXP_WARN_开始任务|r
    .collect 69854,1,29298,1 -- Smoke-Stained Locket (1)
    .accept 29298 >>接任务: |cRXP_WARN_一条烟熏过的坠饰|r
step
    #optional
    #completewith SecretsWithin
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestTurnedIn 29203
    #completewith next
    .zone Moonglade >>前往月光林地
step
    #label SecretsWithin
    .isQuestTurnedIn 29203
    .goto Moonglade,51.685,45.098
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩·萨图纳|r交谈
    .turnin 29298 >>交任务: |cRXP_FRIENDLY_一条烟熏过的坠饰|r
    .accept 29302 >>接任务: |cRXP_WARN_解开其中的秘密|r
    .timer 42,Unlocking the Secrets Within RP
    .target Rabine Saturna
step
    .isQuestTurnedIn 29203
    >>|cRXP_WARN_等待RP结束|r
    .complete 29302,1 -- Look into Leyara's memories 1/1
step
    .isQuestTurnedIn 29203
    .goto Moonglade,51.685,45.098
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩·萨图纳|r交谈
    .turnin 29302 >>交任务: |cRXP_FRIENDLY_解开其中的秘密|r
    .accept 29303 >>接任务: |cRXP_WARN_悲剧与家庭|r
    .target Rabine Saturna
step
    .isOnQuest 29303
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .isOnQuest 29303
    .goto Ashenvale,40.501,53.281
    .cast 6247 >>点击|cRXP_PICK_Night Elf Grave|r
    .timer 48,Tragedy and Family RP
    .skipgossip
step
    .isOnQuest 29203
    .goto Ashenvale,40.501,53.281
    >>|cRXP_WARN_等待RP结束|r
    .complete 29303,1 -- Look deeper into Leyara's memories 1/1
    .skipgossip
step
    .isQuestTurnedIn 29203
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29303 >>交任务: |cRXP_FRIENDLY_悲剧与家庭|r
    .accept 29310 >>接任务: |cRXP_WARN_临界点|r
step
    .isOnQuest 29310
    #completewith next
    .zone 198 >>前往海加尔山
step
    .isOnQuest 29310
    .goto 198,7.561,34.582
    .cast 6247 >>点击|cRXP_PICK_墓碑|r
    .timer 59,The Tipping Point RP
    .skipgossip
step
    .isOnQuest 29310
    .goto 198,7.561,34.582
    >>|cRXP_WARN_等待RP结束|r
    .complete 29310,1 -- Look deeper into Leyara's memories 1/1
    .skipgossip
step
    .isQuestTurnedIn 29203
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29310 >>交任务: |cRXP_FRIENDLY_临界点|r
    .accept 29311 >>接任务: |cRXP_WARN_皆不可考|r
step
    #optional
    #completewith next
    .isOnQuest 29311
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29311
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .turnin 29311 >>交任务: |cRXP_FRIENDLY_皆不可考|r
    .target Malfurion Stormrage
--Complete Filling the Moonwell

step
    #optional
    .isQuestTurnedIn 29284
    .isQuestTurnedIn 29282
    .isQuestTurnedIn 29311
    .goto 338,46.932,90.984
    +恭喜你解锁了熔火前线全部内容！继续完成以下任一任务(|cRXP_ENEMY_2.5|r- 熔火前线 + 德鲁伊)或(|cRXP_PICK_2.5|r- 熔火前线 + 守护者), 以获得更多的 |T513195:0|t[世界树印记]
    >>|cRXP_FRIENDLY_Zen'Vorka|r出售|T133654:0|t[|cRXP_FRIENDLY_Zen'Vorka的宝箱|r], 价格为30枚|T513195:0|t[世界树印记], 其中可能包含一件随机的绿色品质物品或稀有宠物|T294481:0|t[|cFF0070FF灼烧石|r]
    .target Zen'Vorka
step
    .isQuestAvailable 29214
    #label DruidEnd
    +|cRXP_WARN_您已完成今日所有可用的日常任务. 请于明日重新加载本指南(|r|cRXP_ENEMY_2.5|r- 熔火前线 + 德鲁伊|cRXP_WARN_)继续完成日常任务, 直至获得足够的|r|T513195:0|t[世界树印记]
step
    .isQuestTurnedIn 29214
    +|cRXP_WARN_你已解锁【暗影守望者】日常任务. 你可以选择完成爪牙德鲁伊或暗影守望者任务. 如果你想完成爪牙德鲁伊的任务, 请明天重新加载本指南(|r|cRXP_ENEMY_2.5|r- 熔火前线 + 德鲁伊|cRXP_WARN_), 或者如果你想完成暗影守望者任务, 则明天加载(|r|cRXP_PICK_2.5|r- 熔火前线 + 守望者|cRXP_WARN_). 两者均可获得相同数量的|r|T513195:0|t[世界树印记]
]])

RXPGuides.RegisterGuide([[
#cata
#version 1
#group +熔火前线
#name D_1_TSOM守卫
#displayname |cRXP_ENEMY_2.5|r - 熔火前线 + 守望者 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    .isQuestAvailable 29214
    +|cRXP_WARN_你必须先收集150个|r|T513195:0|t[世界树印记], 并提交任务【暗影守望者】, 才能完成他们的日常任务|r
    .turnin 29214 >>交任务: |cRXP_FRIENDLY_暗影守望者|r
    .target Captain Saynna Stormrunner
    .goto 198,26.799,62.157
step
    #optional
    #completewith HyjalQuests
	.zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r << Horde
	.zone 84 >>前往: |cRXP_PICK_暴风城|r << Alliance
	.zoneskip 198
    .zoneskip 338
step
    #optional
    #completewith HyjalQuests
    .goto 85,51.12,38.26 << Horde
    .goto 84,76.199,18.690 << Alliance
    .zone 198 >>前往海加尔传送门
    .zoneskip 338
step
    #optional
    #completewith HyjalQuests
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step --accepted back at sanctuary of malorne
    .goto 198/1,-2088.800,4452.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_队长索伦·月落|r交谈 
    .target Captain Soren Moonfall
    .daily 29128 >>接任务: |cRXP_WARN_海加尔的保卫者|r
step
    #loop
    .goto 198,27.108,62.009,5,0
    .goto 198,27.170,62.563,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r或|cRXP_FRIENDLY_米露恩|r交谈
    .daily 29125,29147,29164,29101,29161 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29125,29147,29164,29101,29161
    .target Matoclaw
    .target Mylune
step
    #loop
    #label HyjalQuests
    .goto 198,27.527,62.510,5,0
    .goto 198,27.172,62.565,5,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦托克劳|r 或 |cRXP_FRIENDLY_Dorda'en 夜游者|r 交谈
    .daily 29123,29149,29127,29163,29166,29247,29246,29248 >>接任务: |cRXP_WARN_灭火之怒|r
    .disablecheckbox
    .questcount <1,29123,29149,29127,29163,29166,29247,29246,29248 
    .target Matoclaw
    .target Dorda'en Nightweaver
step
    .isOnQuest 29166
    #completewith KillNemesis
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #completewith KillNemesis
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29101
    #loop
    .goto 198,22.89,59.91,70,0
    .goto 198,18.58,56.71,70,0
    .goto 198,15.11,48.85,70,0
    .goto 198,19.97,46.22,70,0
    >>点击一个|cRXP_FRIENDLY_托尔托拉之子|r
    >>|cRXP_WARN_瞄准水面并投掷|r |T132219:0|t[投掷乌龟] |cRXP_WARN_(1)|r
    .complete 29101,1 -- Child of Tortolla punted into water (5)
    .target Child of Tortolla
step
    .isOnQuest 29164
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .use 69235 >>|cRXP_WARN_在他们的尸体上使用|r|T134298:0|t[狼的尖牙]|r
    .complete 29164,1 -- Howl atop an invader's corpse (10)
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29147
    #completewith next
    .cast 97241 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽] |cRXP_WARN_来转化成|r|cRXP_FRIENDLY_艾维娜之翼|r
    .use 69234
step
    .isOnQuest 29147
    #loop
    .goto 198,14.90,45.11,80,0
    .goto 198,10.13,36.76,80,0
    .goto 198,13.24,33.64,80,0
    .goto 198,18.65,40.28,80,0
    .use 69234 >>|cRXP_WARN_使用|r|T132172:0|t[召唤鸟群] (1)|cRXP_WARN_ability 靠近|cRXP_FRIENDLY_高山鸣雀|r和|cRXP_FRIENDLY_森林猫头鹰|r和|cRXP_FRIENDLY_金翼雄鹰|r|r
    .complete 29147,1 -- Alpine Songbird gathered (12)
    .target +Alpine Songbird
    .complete 29147,2 -- Forest Owl gathered (5)
    .target +Forest Owl
    .complete 29147,3 -- Goldwing Hawk gathered (2)
    .target +Goldwing Hawk
step
    .isOnQuest 29125
    #loop
    .goto 198,37.32,54.52,70,0
    .goto 198,40.87,55.93,70,0
    .goto 198,36.43,60.73,70,0
    .goto 198,33.45,64.19,70,0
    >>站在玛洛恩之魂面前
    >>|cRXP_WARN_这些是四处乱窜的幽灵鹿|r
    .complete 29125,1 --Spirit of Malorne captured (3)
step
    #completewith next
    .goto 198,14.310,33.203
    .vehicle >>点击|cRXP_PICK_攀爬树|r开始攀爬这棵树
    .target Climbing Tree
    .isOnQuest 29161
step
    .goto 198,14.310,33.203
    >>在树上时, 点击|cRXP_FRIENDLY_海加尔幼熊|r
    .collect 54439,1
    .target Hyjal Bear Cub
    .isOnQuest 29161
step
    .isOnQuest 29161
    .goto 198,14.310,33.203
    *|cRXP_WARN_Cast|r |T450907:0|t[Climb Up] (1) |cRXP_WARN_until you're at the top, aim the arrow at the trampoline beside |cRXP_FRIENDLY_Keeper Taldros|r, then cast|r |T446127:0|t[Chuck-a-bear] (4)|cRXP_WARN_. Cast|r |T450905:0|t[Climb Down] (2) |cRXP_WARN_and repeat the process|r
    .complete 29161,1 --6/6 Hyjal Bear Cubs Rescued
step
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .vehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    #optional
    .isQuestComplete 29161
    .exitvehicle >>|cRXP_WARN_施放|r|T450905:0|t[爬下] (2)|cRXP_WARN_离开树|r
step
    .isOnQuest 29161
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29161 >>交任务: |cRXP_FRIENDLY_熊就在那里|r
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isQuestTurnedIn 29161
    >>点击任务日志中的任务提交弹出窗口
    .accept 29162 >>接任务: |cRXP_WARN_自然的祝福|r
step
    .isOnQuest 29125
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29125 >>交任务: |cRXP_FRIENDLY_林木之间|r
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isQuestTurnedIn 29125
    >>点击任务日志中的任务提交弹出窗口
    .accept 29126 >>接任务: |cRXP_WARN_玛洛恩的力量|r
step
    .isOnQuest 29147
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29147 >>交任务: |cRXP_FRIENDLY_召唤鸟群|r
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isQuestTurnedIn 29147
    >>点击任务日志中的任务提交弹出窗口
    .accept 29148 >>接任务: |cRXP_WARN_羽翼烈焰|r
step
    .isOnQuest 29164
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29164 >>交任务: |cRXP_FRIENDLY_让你的吼声更完美|r
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isQuestTurnedIn 29164
    >>点击任务日志中的任务提交弹出窗口
    .accept 29165 >>接任务: |cRXP_WARN_召唤兽群|r
step
    .isOnQuest 29101
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29101 >>交任务: |cRXP_FRIENDLY_踢飞季节|r
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    .isQuestTurnedIn 29101
    >>点击任务日志中的任务提交弹出窗口
    .accept 29122 >>接任务: |cRXP_WARN_涅墨西斯的回声|r
step
    #completewith next
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .cast 97517 >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_召唤|r|cRXP_ENEMY_派拉奇尼斯|r
    .use 69232
step
    .isOnQuest 29162
    .goto 198/1,-1500.700,4929.300
    .use 69232 >>击杀|cRXP_ENEMY_派拉齐尼斯|r
    >>|cRXP_WARN_使用|r|T134093:0|t[艾森娜的翡翠]|cRXP_WARN_来移除自身身上的|r|T136016:0|t[沸腾毒药箭]|cRXP_WARN_ debuff, 该效果由|r|cRXP_ENEMY_派拉齐尼斯|r施加|r
    .complete 29162,1 --|Pyrachnis slain: 1/1
    .mob Pyrachnis
step
    #completewith next
    .isOnQuest 29126
    .goto 198,41.667,56.130
    .cast 97012 >>|cRXP_WARN_使用|r|T135139:0|t[守护者法杖]|cRXP_WARN_于|cRXP_PICK_ 灰烬堆|r召唤|r|cRXP_ENEMY_ 盖伦格斯|r
    .use 68997
step
    .goto 198,41.667,56.130
    .isOnQuest 29126
    .use 68997 >>击杀|cRXP_ENEMY_盖伦格斯|r
    .complete 29126,1 -- Galenges slain (1)
    .mob Galenges
step
    .isOnQuest 29148
    #completewith next
    .goto 198/1,-1500.700,4929.300
    .cast 97324 >>|cRXP_WARN_使用|r|T135992:0|t[群鸟女王的翎羽]|cRXP_WARN_靠近西部火焰传送门来召唤|r|cRXP_ENEMY_米拉盖佐尔|r
    .use 69212
step
    .isOnQuest 29148
    .goto 198/1,-1500.700,4929.300
    .use 69212 >>击杀|cRXP_ENEMY_米拉盖佐尔|r
    .complete 29148,1 -- Millagazor slain (1)
    .mob Millagazor
step
    .isOnQuest 29165
    #completewith next
    .goto 198,41.667,56.130
    .cast 97498 >>|cRXP_WARN_使用|r|T134298:0|t[狼的尖牙] |cRXP_WARN_来召唤|r|cRXP_ENEMY_莱拉克斯|r
    .use 69225
step
    .isOnQuest 29165
    .goto 198,41.667,56.130
    .use 69225 >>击杀|cRXP_ENEMY_莱拉克斯|r
    .complete 29165,1 -- Lylagar slain (1)
    .mob Lylagar
step
    .isOnQuest 29122
    #completewith next
    .goto 198,24.014,55.803
    .gossip 52425,0 >>与|cRXP_FRIENDLY_图加|r交谈以召唤|cRXP_ENEMY_涅墨西斯|r
    .skipgossip
    .target Tooga
step
    #label KillNemesis
    .isOnQuest 29122
    .goto 198,24.760,55.259
    >>击杀|cRXP_ENEMY_涅墨西斯|r
    >>|cRXP_WARN_站在|cRXP_FRIENDLY_Tooga's|r的壳下, 以躲避|r|cRXP_ENEMY_Nemesis'|r|T135830:0|t[熔火之怒]|cRXP_WARN_cast|r
    .complete 29122,1 -- Nemesis slain (1)
    .target Tooga
    .mob Nemesis
step
    .isOnQuest 29166
    #loop
    .goto 198,29.53,56.21,70,0
    .goto 198,36.15,52.44,70,0
    .goto 198,35.94,58.80,70,0
    .goto 198,24.27,62.12,70,0
    >>拾取地面上的|cRXP_LOOT_蓝根藤|r
    .complete 29166,1
step
    .isOnQuest 29123
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29123,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29149
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29149,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29127
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29127,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step
    .isOnQuest 29163
    #loop
    .goto 198,23.06,59.99,0
    .goto 198,16.01,50.51,0
    .goto 198,10.29,36.11,0
    .goto 198,23.06,59.99,70,0
    .goto 198,19.29,58.54,70,0
    .goto 198,16.01,50.51,70,0
    .goto 198,14.98,43.10,70,0
    .goto 198,10.29,36.11,70,0
    >>击杀来自火焰之地的|cRXP_ENEMY_入侵者|r
    .complete 29163,1
    .mob Flame Terror
    .mob Brimstone Hound
    .mob Scarred Acolyte
    .mob Charred Invader
step -- 29248 Releasing the Pressure
    .isOnQuest 29248
    .goto 198,32.0,59.8,70,0
    .goto 198,36.6,54.8,70,0
    .goto 198,39.2,62.6,70,0
    .goto 198,34.6,64.6,70,0
    .goto 198,30.6,52.2,70,0
    >>击杀 |cRXP_ENEMY_灼焦火妖|r. 从他们身上获取 |cRXP_LOOT_火妖的鳞片|r
    .complete 29248,1 -- Flamewaker Scale (100)
    .mob Charred Flamewaker
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #completewith FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step -- 29247 Treating the Wounds
    .isOnQuest 29247
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r. 从它们身上搜刮|cRXP_LOOT_沾满硫磺的包裹|r
    .complete 29247,1 -- Sulfur-Laced Wrapping (4)
    .mob Fiery Behemoth
step -- 29246 Relieving the Pain
    .isOnQuest 29246
    #label FinishProtector
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_炽热的葬火领主|r. 击败他们以获取他们的|cRXP_LOOT_烈焰裹附核心|r
    .complete 29246,1 -- Flame-Wreathed Heart (4)
    .mob Seething Pyrelord
step -- 29128 The Protectors of Hyjal
    .isOnQuest 29128
    #loop
    .goto 198,31.6,74.2,70,0
    .goto 198,30.0,80.2,70,0
    .goto 198,31.2,87.6,70,0
    .goto 198,31.6,95.6,70,0
    .goto 198,36.4,98.0,70,0
    >>击杀|cRXP_ENEMY_火焰巨兽|r和 |cRXP_ENEMY_炙热的葬火领主|r
    .complete 29128,1 -- Invader slain at Sethria's Roost (6)
    .mob Fiery Behemoth
    .mob Seething Pyrelord
step
    .isQuestComplete 29162
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29162 >>交还自然的祝福
step
    .isQuestComplete 29122
    .goto 198/1,-2080.000,4439.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米露恩|r交谈
    .target Mylune
    .dailyturnin 29122 >>交还涅墨西斯之回响
step
    .isQuestComplete 29126
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29126 >>交还玛洛恩之力
step
    .isQuestComplete 29165
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29165 >>提交《狼群的召唤》
step
    .isQuestComplete 29148
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29148 >>交还燃烧之翼
step
    .isQuestComplete 29166
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29166 >>提交补给给另一方
step
    .isQuestComplete 29123
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29123 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29149
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29149 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29127
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29127 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29163
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .dailyturnin 29163 >>提交“对抗烈焰的狂怒”
step
    .isQuestComplete 29246
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29246 >>提交任务:缓解痛苦
step
    .isQuestComplete 29247
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29247 >>交还《治疗伤口》
step
    .isQuestComplete 29248
    .goto 198,27.527,62.515
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dorda'en 夜游者|r交谈
    .target Dorda'en Nightweaver
    .dailyturnin 29248 >>提交任务:释放压力
step
    #completewith RayneFeathersong
    .isQuestComplete 29128
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isQuestTurnedIn 29215
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .daily 29255,29257,29299 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Avrilla
step
    #label RayneFeathersong
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .daily 29139,29143 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Rayne Feathersong
step
    .isQuestTurnedIn 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    >>|cRXP_WARN_如果今天|cRXP_FRIENDLY_莉吉特|r 没有在此提供任务, 请跳过此步骤|r
    .target Ricket
step
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .daily 29138 >>接任务: |cRXP_WARN_烧伤患者|r
    .target Captain Irontree
step
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .daily 29179 >>接任务: |cRXP_WARN_元素敌人|r
    .daily 29304,29141,29142,29137 >>接任务: |cRXP_WARN_灭火之怒|r
    .target General Taldris Moonfall
step
    .isQuestComplete 29128
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29128 >>交还《海加尔的守护者》任务物品
    .target General Taldris Moonfall
step -- 29138 Burn Victims
    .isOnQuest 29138
    #sticky
    #label BurnVictims
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .use 69240 >>|cRXP_WARN_使用|r|T463860:0|t[魔法药膏], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_受伤的海加尔防御者|r
    .complete 29138,1 -- Wounded Hyjal Defender saved 1/1
    .target Wounded Hyjal Defender
step -- Embergris 29255
    .isOnQuest 29255
    #label Embergris
    #sticky
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦士兵|r和|cRXP_ENEMY_灼焦征服者|r. 从他们身上搜取|cRXP_LOOT_烬蜡|r
    .complete 29255,1 -- Embergris (5)
    .mob Charred Soldier
    .mob Charred Vanquisher
step -- 29179 Hostile Elements
    .isOnQuest 29179
    #sticky
    #label HostileElements
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>击杀|cRXP_ENEMY_灼焦征服者|r和|cRXP_ENEMY_灼焦士兵|r
    .complete 29179,1 -- Charred Combatant slain (8)
    .mob Charred Vanquisher
    .mob Charred Soldier
step -- 29304 The Dogs of War
    .isOnQuest 29304
    #sticky
    #label TheDogs
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_灼焦恶犬|r 和|cRXP_ENEMY_上古灼焦恶犬|r
    .complete 29304,1 -- Ancient Charhound slain (5)
    .mob Charhound
    .mob Ancient Charhound
step -- 29141 The Harder They Fall
    .isOnQuest 29141
    #sticky
    #label HarderTheyFall
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔火巨兽|r
    .complete 29141,1 -- Molten Behemoth slain (3)
    .mob Molten Behemoth
step -- 29142 Traitors Return
    .isOnQuest 29142
    #sticky
    #label TraitorsReturn
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,71.0,38.6,45,0
    >>击杀|cRXP_ENEMY_火焰德鲁伊|r
    .complete 29142,1 -- Druid of the Flame slain (3)
    .mob Druid of the Flame
step -- 29137 Breach in the Defenses
    .isOnQuest 29137
    #sticky
    #label Breach
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    .goto 338,53.4,53.0,45,0
    .goto 338,40.8,45.0,45,0
    >>击杀|cRXP_ENEMY_熔岩破坏者|r
    .complete 29137,1 -- Lava Burster slain (5)
    .mob Lava Burster
step -- 29139 Aggressive Growth
    .isOnQuest 29139
    #sticky
    #label AggressiveGrowth
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>点击地面上的|cRXP_PICK_燃灰堆|r
    .complete 29139,1 -- Smothervine planted (5)
step -- Steal Magmolias 29257
    .isOnQuest 29257
    #label StealMagmolias
    #sticky
    #loop
    .goto 338,47.7,59.6,45,0
    .goto 338,41.5,43.6,45,0
    .goto 338,54.5,45.5,45,0
    >>在小熔岩池中击杀熔岩花获取 loot
    >>|cRXP_WARN_如果在掠夺一个|r|cRXP_ENEMY_熔岩破坏者|r后刷新, 击杀它并掠夺其掉落的|r|cRXP_LOOT_熔岩花|r|r
    .complete 29257,1 -- Magmolia (8)
    .mob Lava Burster
step -- Some Like It Hot 29299
    .isOnQuest 29299
    #label LikeItHot
    #sticky
    #loop
    .goto 338,50.6,68.6,45,0
    .goto 338,42.2,60.2,45,0
    .goto 338,42.8,41.8,45,0
    .goto 338,56.2,46.8,45,0
    .goto 338,54.6,61.6,45,0
    >>|cRXP_WARN_带上你的|r火红鞭笞者|r并战斗|r|cRXP_ENEMY_熔焰蝎虫|r|r << !Hunter
    >>|cRXP_WARN_施放|r|T135834:0|t[冰冻陷阱]|cRXP_WARN_于|r|cRXP_ENEMY_熔焰蝎虫|r上. 它会持续施放|r|T135826:0|t[余烬池]|cRXP_WARN_,  while你的|r|cRXP_FRIENDLY_火红鞭笞者|r正在饮用, 这样你只需一只|r|cRXP_ENEMY_熔焰蝎虫|r即可完成此日常任务|r << Hunter
    >>|cRXP_WARN_|r|cRXP_ENEMY_熔焰蝎虫|r将施放|r|T135826:0|t[余烬池]|cRXP_WARN_, 你的|cRXP_FRIENDLY_火红鞭笞者|r会饮用|r|r
    .complete 29299,1 -- Help the Crimson Lasher Drink from Ember Pools (6)
    .mob Emberspit Scorpion
step -- 29263 A Bitter Pill
    .isOnQuest 29263
    #label MagmaWorm
    #sticky
    #loop
    .goto 338,43.8,46.8,50,0
    .goto 338,53.6,41.8,50,0
    .goto 338,55.6,54.6,50,0
    .goto 338,44.8,54.4,50,0
    >>点击熔岩池中的|cRXP_PICK_熔岩气泡|r以召唤|cRXP_ENEMY_潜地熔岩虫|r
    .use 69759 >>|cRXP_WARN_当你看到警告信息:“虫子要咬了！现在立即放置炸弹！”时使用|r|T133710:0|t[苦果炸弹]
    .complete 29263,1 -- Subterranean Magma Worm slain 1/1
    .mob Subterranean Magma Worm
step -- 29278 Living Obsidium
    .isOnQuest 29278
    #label ObsidiumMeteorite
    #sticky
    #loop
    .goto 338,41.5,49.8,50,0
    .goto 338,46.6,43.1,50,0
    .goto 338,54.6,43.8,50,0
    .goto 338,51.5,51.2,50,0
    >>点击|cRXP_PICK_磁石|r, 然后拾取掉落的|cRXP_LOOT_黑曜石陨星|r
    .complete 29278,1 -- Obsidium Meteorite (10)
    .target Magnetic Stone
step -- 29143 Wisp Away
    .isOnQuest 29143
    #sticky
    #label WispAway
    #loop
    .goto 338,47.6,79.6,45,0
    .goto 338,43.8,74.0,45,0
    .goto 338,45.8,64.2,45,0
    .goto 338,52.8,64.4,45,0
    .goto 338,53.6,79.6,45,0
    >>|cRXP_WARN_带着跟随你的海加尔小精灵前往火焰传送门|r
    >>|cRXP_WARN_击杀从里面出来的怪物. 确保 |cRXP_FRIENDLY_海加尔小精灵|r 不会死亡！|r
    .complete 29143,1 -- Close a Fire Portal 1/1
step
    #optional 
    #requires MagmaWorm
step
    #optional 
    #requires ObsidiumMeteorite
step
    #optional 
    #requires Embergris
step
    #optional
    #requires StealMagmolias
step
    #optional
    #requires LikeItHot
step
    #optional
    #requires BurnVictims
step
    #optional
    #requires HostileElements
step
    #optional
    #requires TheDogs
step
    #optional
    #requires HarderTheyFall
step
    #optional
    #requires TraitorsReturn
step
    #optional
    #requires Breach
step
    #optional
    #requires AggressiveGrowth
step
    #optional
    #requires WispAway
step
    .isQuestComplete 29255
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29255 >>交还烬蜡
    .target Avrilla
step
    .isQuestComplete 29257
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29257 >>交出偷来的熔岩花
    .target Avrilla
step
    .isQuestComplete 29299
    .goto 338,50.644,87.244
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾薇尔拉|r交谈 
    .dailyturnin 29299 >>提交“一些像它热”
    .target Avrilla
step
    .isQuestComplete 29139
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29139 >>提交任务“激进成长”
    .target Rayne Feathersong
step
    .isQuestComplete 29143
    .goto 338,48.513,86.257
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱茵·羽歌|r交谈 
    .dailyturnin 29143 >>交出小精灵
    .target Rayne Feathersong
step
    .isQuestComplete 29263
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29263 >>交还苦药丸
    .target Damek Bloombeard
step
    .isQuestComplete 29278
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29278 >>交出活体黑曜石
    .target Damek Bloombeard
step
    .isQuestComplete 29295
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29295 >>交还“越大越强”
    .target Damek Bloombeard
step
    .isQuestComplete 29297
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29297 >>交还“再见, 伯迪”
    .target Damek Bloombeard
step
    .isQuestComplete 29179
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29179 >>提交敌对元素
    .target General Taldris Moonfall
step
    .isQuestComplete 29304
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29304 >>交出《战争之犬》
    .target General Taldris Moonfall
step
    .isQuestComplete 29141
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29141 >>交出《他们先杀了我父亲》
    .target General Taldris Moonfall
step
    .isQuestComplete 29142
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29142 >>交还叛徒的归来
    .target General Taldris Moonfall
step
    .isQuestComplete 29137
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈 
    .dailyturnin 29137 >>交任务: |cRXP_FRIENDLY_防线上的突破口|r
    .target General Taldris Moonfall
step
    .isQuestComplete 29138
    .goto 338,45.626,86.144
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁木队长|r交谈 
    .dailyturnin 29138 >>提交烧伤受害者任务
    .target Captain Irontree
step
    .isQuestTurnedIn 29214
    .goto 338,45.589,85.822
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_将军泰尔迪斯·月落|r交谈
    .daily 29205 >>接任务: |cRXP_WARN_荒芜尖塔|r
    .target General Taldris Moonfall
step
    .isOnQuest 29205
    .goto 338,54.503,70.816,10,0
    .goto 338,66.301,65.137
    >>保护一名|cRXP_FRIENDLY_德鲁伊|r在前往荒芜尖塔的过程中
    >>击杀终点处的|cRXP_ENEMY_葬火领主|r 和|cRXP_ENEMY_烈焰守御哨兵|r
    .complete 29205,1 -- Druid Assault Group Protected
    .target Keeper Taldros
    .target Turak Runetotem
    .target Deldren Ravenelm
    .mob Pyrelord
    .mob Flamewatch Sentinel
step
    .goto 338,64.855,67.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦琳·刀翼|r交谈
    .dailyturnin 29205 >>交还荒芜尖塔
    .daily 29211,29192 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Marin Bladewing
step
    .isQuestTurnedIn 29272 -- Only offered if completed 德鲁伊 questline
    .goto 338,66.259,66.141
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    >>|cRXP_WARN_如果他未提供此任务, 请跳过此步骤|r
    .daily 29276 >>接任务: |cRXP_WARN_烈焰蛛后|r
    .target Tholo Whitehoof
step -- Ricket @ WARDENS
    .isQuestTurnedIn 29282
    .goto 338,66.429,65.396
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    >>|cRXP_WARN_如果她不在这里, 请跳过此步骤|r
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Ricket
step
    .goto 338,66.100,63.908
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德尔德伦·鸦榆|r交谈
    .daily 29189,29159,29160 >>接任务: |cRXP_WARN_邪恶的网|r
    .disablecheckbox
    .target Deldren Ravenelm
    .questcount <2,29189,29159,29160
step -- Solar Core Destruction 29211
    .isOnQuest 29211
    #label SolarCore
    #sticky
    .goto 338,70.815,38.196
    >>点击|cRXP_PICK_Solar Core|r
    .complete 29211,1 -- Solar Core detonated 1/1
step -- The 守卫者 are Watching 29192
    .isOnQuest 29192
    #label 守卫者Watching
    #sticky
    #loop
    .goto 338,71.6,44.6,30,0
    .goto 338,72.0,37.4,30,0
    .goto 338,68.8,41.4,30,0 
    >>攻击火焰德鲁伊查特直到它被削弱, 然后将其引诱至暗影守望者陷阱中
    .complete 29192,1 -- Druid of the Flame captured 1/1
    .mob Druid of the Flame
step -- The Flame Spider Queen 29276
    .isOnQuest 29276
    #label FlameSpider
    #sticky
    #loop
    .goto 338,69.6,49.8,40,0
    .goto 338,60.6,40.8,40,0
    .goto 338,60.8,61.0,40,0
    >>击杀|cRXP_ENEMY_烬网爬虫|r. 击杀后可获得其|cRXP_LOOT_火热毒液|r
    >>击杀 |cRXP_ENEMY_烬网织网蛛|r. 从它们身上获取 |cRXP_LOOT_滚烫的蛛网分泌液|r
    >>|cRXP_WARN_你还会在对其造成伤害时被动地收集他们的 |cRXP_LOOT_火热毒液|r 和 |cRXP_LOOT_滚烫的蛛网分泌液|r|r
    .complete 29276,1 -- Flame Venom (8)
    .mob +Cinderweb Creeper
    .complete 29276,2 -- Searing Web Fluid (8)
    .mob +Cinderweb Spinner
step -- Wicked Webs 29189
    .isOnQuest 29189
    #label WickedWebs
    #sticky
    #loop
    .goto 338,69.6,49.8,40,0
    .goto 338,60.6,40.8,40,0
    .goto 338,60.8,61.0,40,0
    >>击杀烬网虫茧
    .complete 29189,1 -- Victims freed  (8)
    .mob Cinderweb Cocoon
step -- Pyrorachnophobia 29159
    .isOnQuest 29159
    #label Pyrorachnophobia
    #sticky
    #loop
    .goto 338,69.6,49.8,40,0
    .goto 338,60.6,40.8,40,0
    .goto 338,60.8,61.0,40,0
    >>击杀烬网爬虫和烬网织网蛛
    .complete 29159,1 -- Cinderweb spider slain  (8)
    .mob Cinderweb Creeper
    .mob Cinderweb Spinner
step -- Egg-stinction 29160
    .isOnQuest 29160
    #label Eggstinction
    #sticky
    #loop
    .goto 338,69.6,49.8,40,0
    .goto 338,60.6,40.8,40,0
    .goto 338,60.8,61.0,40,0
    >>打开 |cRXP_PICK_烬网蛛卵囊|r. 从中拾取 |cRXP_LOOT_烬网蛛卵|r
    .complete 29160,1 -- Cinderweb Egg (20)
step -- 29297 Bye Bye Burdy -- WARDENS ONLY
    .isOnQuest 29297
    #label ByeByeBurdy
    #sticky
    #loop
    .goto 338,73.03,54.88,50,0
    .goto 338,73.82,38.28,50,0
    .goto 338,63.73,38.76,50,0
    .use 69832 >>|cRXP_WARN_使用|r|T135129:0|t[戳鸟之矛], |cRXP_WARN_目标: |r|cRXP_ENEMY_火焰德鲁伊|r, 它们正在空中飞行|r
    .complete 29297,1 -- 德鲁伊 of the Flame in Fire Crow form slain (3)
    .mob Druid of the Flame
step
    #optional
    #requires SolarCore
step
    #optional 
    #requires 守卫者Watching
step
    #optional
    #requires FlameSpider
step
    #optional
    #requires WickedWebs
step
    #optional
    #requires Pyrorachnophobia
step
    #optional
    #requires Eggstinction
step
    #optional
    #requires ByeByeBurdy
step
    .isQuestComplete 29160
    .goto 338,66.100,63.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德尔德伦·鸦榆|r交谈
    .dailyturnin 29160 >>上交“蛋灭”任务
    .target Deldren Ravenelm
step
    .isQuestComplete 29159
    .goto 338,66.100,63.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德尔德伦·鸦榆|r交谈
    .dailyturnin 29159 >>提交《火蜥蜴恐惧症》任务
    .target Deldren Ravenelm
step
    .isQuestComplete 29189
    .goto 338,66.100,63.908
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德尔德伦·鸦榆|r交谈
    .dailyturnin 29189 >>提交邪恶之网
    .target Deldren Ravenelm
step
    .isQuestComplete 29192
    .goto 338,64.855,67.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦琳·刀翼|r交谈
    .dailyturnin 29192 >>交任务: |cRXP_FRIENDLY_典狱官|rs are Watching
    .target Marin Bladewing
step
    .isQuestComplete 29211
    .goto 338,64.855,67.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦琳·刀翼|r交谈
    .dailyturnin 29211 >>提交太阳核心毁灭任务
    .target Marin Bladewing
step
    .goto 338,64.855,67.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦琳·刀翼|r交谈
    .daily 29210 >>接任务: |cRXP_WARN_忍受炎热|r
    .target Marin Bladewing
step -- this step will autoskip if they completed 29276 earlier
    .goto 338,65.959,66.093
    .isQuestTurnedIn 29272 -- Only offered if completed 德鲁伊 questline
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    >>|cRXP_WARN_如果他不在这里, 请跳过此步骤|r
    .daily 29275 >>接任务: |cRXP_WARN_范达尔的研究|r
    .disablecheckbox
    .target Anren Shadowseeker
    .questcount <1,29275,29276
step -- Enduring the Heat 29210
    .isOnQuest 29210
    .goto 338,57.491,49.532
    >>|cRXP_WARN_坠入下方的火成岩深处|r
    .complete 29210,1 -- All Flame 符文 Destroyed 1/1
step
    .isOnQuest 29275
    #completewith next
    >>掠夺|cRXP_LOOT_烈焰德鲁伊法杖|r和|cRXP_LOOT_烈焰德鲁伊法术书|r和|cRXP_LOOT_烈焰德鲁伊材料包|r和|cRXP_LOOT_烈焰德鲁伊神像|r
    >>|cRXP_WARN_这些物品散落在火成深渊的各个角落|r
    .complete 29275,1 -- Flame Druid Staff 1/1
    .complete 29275,2 -- Flame Druid Spellbook 1/1
    .complete 29275,3 -- Flame Druid Reagent Pouch 1/1
    .complete 29275,4 -- Flame Druid Idol 1/1
step -- Enduring the Heat 29210
    .isOnQuest 29210
    #loop
    .goto 338,61.620,52.938,8,0
    .goto 338,66.330,52.184,8,0
    .goto 338,61.386,48.457,8,0
    .goto 338,64.718,59.267,8,0
    .goto 338,68.854,58.329,8,0
    .goto 338,68.109,66.500,8,0
    .goto 338,64.165,66.062,8,0
    .goto 338,60.547,59.997,8,0
    >>|cRXP_WARN_沿着箭头走, 然后点击地上的|cRXP_PICK_烈焰防护符文|r|r
    >>|cRXP_WARN_点击|cRXP_PICK_烈焰防护符文|r将会击杀所有正在攻击你的|cRXP_ENEMY_不稳定的怒焰元素|r|r
    .complete 29210,2 -- All Flame 符文 Destroyed 1/1
step
    .isOnQuest 29275
    #loop
    .goto 338,61.620,52.938,20,0
    .goto 338,66.330,52.184,20,0
    .goto 338,61.386,48.457,20,0
    .goto 338,64.718,59.267,20,0
    .goto 338,68.854,58.329,20,0
    .goto 338,68.109,66.500,20,0
    .goto 338,64.165,66.062,20,0
    .goto 338,60.547,59.997,20,0
    >>掠夺|cRXP_LOOT_烈焰德鲁伊法杖|r和|cRXP_LOOT_烈焰德鲁伊法术书|r和|cRXP_LOOT_烈焰德鲁伊材料包|r和|cRXP_LOOT_烈焰德鲁伊神像|r
    >>|cRXP_WARN_这些物品散落在火成深渊的各个角落|r
    .complete 29275,1 -- Flame Druid Staff 1/1
    .complete 29275,2 -- Flame Druid Spellbook 1/1
    .complete 29275,3 -- Flame Druid Reagent Pouch 1/1
    .complete 29275,4 -- Flame Druid Idol 1/1
step
    .isQuestComplete 29210
    .goto 338,57.742,49.502
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟蕾莎·树皮|r交谈
    .dailyturnin 29210 >>提交任务“耐热考验”
    .target Theresa Barkskin
step
    .isQuestTurnedIn 29284
    .goto 338,57.518,49.478
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨莉斯·黑暗猎手|r交谈
    .daily 29243 >>接任务: |cRXP_WARN_直击要害|r
    .target Shalis Darkhunter
step
    .isOnQuest 29243
    .goto 338,50.343,23.036
    >>杀死一名火焰的中尉
    .complete 29243,1 -- Lieutenant of Flame slain
    .mob Ancient Charscale
    .mob Ancient Smoldering Behemoth
    .mob Ancient Firelord
    .mob Cinderweb Queen
    .mob Devout Harbinger
step
    .isQuestComplete 29276
    .goto 338,51.245,85.865
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安伦·觅影者|r交谈
    .dailyturnin 29276 >>提交火焰蜘蛛女王
    .target Anren Shadowseeker
step
    .isQuestComplete 29275
    .goto 338,51.547,85.511
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索罗·白蹄|r交谈
    .dailyturnin 29275 >>提交法德拉的秘术
    .target Tholo Whitehoof
step
    .isQuestComplete 29297
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29297 >>交还“再见, 伯迪”
    .target Damek Bloombeard
step
    .isQuestComplete 29243
    .goto 338,47.584,90.552
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨伊娜·风驰队长|r交谈
    .dailyturnin 29243 >>提交任务:突袭心脏
    .target Captain Saynna Stormrunner

--Calling the Ancients unlock
step
    .isQuestTurnedIn 29182 -- 德鲁伊 prereq
    .isQuestTurnedIn 29215 -- Warden prereq
    .goto 338,44.434,88.790
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔兰·高枝|r交谈
    .accept 29283 >>接任务: |cRXP_WARN_呼唤古树|r
    .target Varlan Highbough
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29283
    .goto 198,26.005,61.302
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老树干|r交谈
    .turnin 29283 >>交任务: |cRXP_FRIENDLY_呼唤古树|r
    .target Elderlimb
step
    .isQuestTurnedIn 29283
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .accept 29284 >>接任务: |cRXP_WARN_古树的援助|r
step
    #optional
    #completewith WardenEnd
    .isOnQuest 29284
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29284
    .goto 338,43.812,88.964
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老树干|r交谈
    .turnin 29284 >>交任务: |cRXP_FRIENDLY_古树的援助|r
    .target Elderlimb
step
    .isQuestTurnedIn 29284
    .goto 338,51.713,81.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨莉斯·黑暗猎手|r交谈
    .daily 29243 >>接任务: |cRXP_WARN_直击要害|r
    .target Shalis Darkhunter
step
    .isOnQuest 29243
    .goto 338,50.343,23.036
    >>杀死一名火焰的中尉
    .complete 29243,1 -- Lieutenant of Flame slain
    .mob Ancient Charscale
    .mob Ancient Smoldering Behemoth
    .mob Ancient Firelord
    .mob Cinderweb Queen
    .mob Devout Harbinger
 step
    .isQuestComplete 29243
    .goto 338,47.584,90.552
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨伊娜·风驰队长|r交谈
    .dailyturnin 29243 >>提交任务:突袭心脏
    .target Captain Saynna Stormrunner
--Complete Calling the Ancients unlock

--Additional Armaments unlock
step
    .isQuestTurnedIn 29182 -- 德鲁伊 prereq
    .isQuestTurnedIn 29215 -- Warden prereq
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .accept 29281 >>接任务: |cRXP_WARN_追加军火|r
    .target Damek Bloombeard
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29281
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .turnin 29281 >>交任务: |cRXP_FRIENDLY_追加军火|r
    .accept 29282 >>接任务: |cRXP_WARN_全副武装|r
step
    .isQuestTurnedIn 29281
    .goto 198/1,-2082.800,4424.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .target Matoclaw
    .accept 29282 >>接任务: |cRXP_WARN_全副武装|r
step
    #optional
    #completewith next
    .isOnQuest 29282
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .target Ricket
    .turnin 29282 >>交任务: |cRXP_FRIENDLY_全副武装|r
step
    .isQuestTurnedIn 29282
    .goto 338,46.758,90.170
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉吉特|r交谈
    .daily 29263,29278,29295,29297 >>接任务: |cRXP_WARN_灭火之怒|r
    .target Ricket
step -- 29263 A Bitter Pill
    .isOnQuest 29263
    #loop
    .goto 338,43.8,46.8,50,0
    .goto 338,53.6,41.8,50,0
    .goto 338,55.6,54.6,50,0
    .goto 338,44.8,54.4,50,0
    >>点击熔岩池中的|cRXP_PICK_熔岩气泡|r以召唤|cRXP_ENEMY_潜地熔岩虫|r
    .use 69759 >>|cRXP_WARN_当你看到警告信息:“虫子要咬了！现在立即放置炸弹！”时使用|r|T133710:0|t[苦果炸弹]
    .complete 29263,1 -- Subterranean Magma Worm slain 1/1
    .mob Subterranean Magma Worm
step -- 29278 Living Obsidium
    .isOnQuest 29278
    #loop
    .goto 338,41.5,49.8,50,0
    .goto 338,46.6,43.1,50,0
    .goto 338,54.6,43.8,50,0
    .goto 338,51.5,51.2,50,0
    >>点击|cRXP_PICK_磁石|r, 然后拾取掉落的|cRXP_LOOT_黑曜石陨星|r
    .complete 29278,1 -- Obsidium Meteorite (10)
    .target Magnetic Stone
step -- 29295 The Bigger They Are -- DRUIDS ONLY
    .isOnQuest 29295
    #loop
    .goto 338,29.7,28.5,50,0
    .goto 338,16.8,32.5,50,0
    .goto 338,19.5,49.5,50,0
    .goto 338,32.7,43.6,50,0
    >>击杀|cRXP_ENEMY_黑曜石惩罚者|r. 在其死亡后, 从地面上的|cRXP_LOOT_活体黑曜石碎片|r碎片中收集战利品
    .complete 29295,1 -- Living Obsidium Chip (10)
    .mob Obsidium Punisher
step -- 29297 Bye Bye Burdy -- WARDENS ONLY
    .isOnQuest 29297
    #loop
    .goto 338,73.03,54.88,50,0
    .goto 338,73.82,38.28,50,0
    .goto 338,63.73,38.76,50,0
    .use 69832 >>|cRXP_WARN_使用|r|T135129:0|t[戳鸟之矛], |cRXP_WARN_目标: |r|cRXP_ENEMY_火焰德鲁伊|r, 它们正在空中飞行|r
    .complete 29297,1 -- 德鲁伊 of the Flame in Fire Crow form slain (3)
    .mob Druid of the Flame
step
    .isQuestComplete 29263
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29263 >>交还苦药丸
    .target Damek Bloombeard
step
    .isQuestComplete 29278
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29278 >>交出活体黑曜石
    .target Damek Bloombeard
step
    .isQuestComplete 29295
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29295 >>交还“越大越强”
    .target Damek Bloombeard
step
    .isQuestComplete 29297
    .goto 338,46.919,89.996
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达默克·冲炉|r交谈
    .dailyturnin 29297 >>交还“再见, 伯迪”
    .target Damek Bloombeard
--Complete Additional Armaments unlock

--Filling the Moonwell unlock
step
    .goto 338,44.087,86.321
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉·影暴|r交谈
    .accept 29279 >>接任务: |cRXP_WARN_注满月井|r
    .target Ayla Shadowstorm
step
    #optional
    #completewith next
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestComplete 29279
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .turnin 29279 >>交任务: |cRXP_FRIENDLY_注满月井|r
    .accept 29280 >>接任务: |cRXP_WARN_滋养之水|r
    .target Matoclaw
step
    .isQuestTurnedIn 29279
    .goto 198,27.170,62.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦托克劳|r交谈
    .accept 29280 >>接任务: |cRXP_WARN_滋养之水|r
    .target Matoclaw
step
    #optional
    #completewith next
    .isOnQuest 29280
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29280
    .goto 338,44.087,86.321
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉·影暴|r交谈
    .target Ayla Shadowstorm
    .turnin 29280 >>交任务: |cRXP_FRIENDLY_滋养之水|r
step
    .isQuestTurnedIn 29280
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .accept 29203 >>接任务: |cRXP_WARN_深入神庙|r
step
    .isOnQuest 29203
    #completewith next
    .goto 338,57.491,49.532,15 >>进入火成深处
step
    .isOnQuest 29203
    .goto 338,64.615,59.216
    >>击杀|cRXP_ENEMY_莱雅娜|r
    .complete 29203,1 -- Leyara slain 1/1
    .mob Leyara
step
    .isQuestComplete 29203
    #completewith next
    .goto 338,57.491,49.532,15 >>离开火成深渊
    .subzoneskip 5741,1
step
    .isQuestComplete 29203
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 29203 >>交任务: |cRXP_FRIENDLY_深入神庙|r
step
    .isQuestTurnedIn 29203
    >>|cRXP_WARN_你现在已经收到|r|cRXP_FRIENDLY_瑟蕾莎·树皮|r|r的邮件, 其中附有|r|T514925:0|t[|cRXP_LOOT_烟熏过的坠饰|r]
    .use 69854 >>|cRXP_WARN_使用|r|T514925:0|t[|cRXP_LOOT_烟熏过的坠饰|r]|cRXP_WARN_开始任务|r
    .collect 69854,1,29298,1 -- Smoke-Stained Locket (1)
    .accept 29298 >>接任务: |cRXP_WARN_一条烟熏过的坠饰|r
step
    #optional
    #completewith SecretsWithin
    .goto 338,53.026,83.693
    .zone 198 >>前往海加尔山的传送门
    .zoneskip 338,1
step
    .isQuestTurnedIn 29203
    #completewith next
    .zone Moonglade >>前往月光林地
step
    #label SecretsWithin
    .isQuestTurnedIn 29203
    .goto Moonglade,51.685,45.098
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩·萨图纳|r交谈
    .turnin 29298 >>交任务: |cRXP_FRIENDLY_一条烟熏过的坠饰|r
    .accept 29302 >>接任务: |cRXP_WARN_解开其中的秘密|r
    .timer 42,Unlocking the Secrets Within RP
    .target Rabine Saturna
step
    .isQuestTurnedIn 29203
    >>|cRXP_WARN_等待RP结束|r
    .complete 29302,1 -- Look into Leyara's memories 1/1
step
    .isQuestTurnedIn 29203
    .goto Moonglade,51.685,45.098
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉比恩·萨图纳|r交谈
    .turnin 29302 >>交任务: |cRXP_FRIENDLY_解开其中的秘密|r
    .accept 29303 >>接任务: |cRXP_WARN_悲剧与家庭|r
    .target Rabine Saturna
step
    .isOnQuest 29303
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .isOnQuest 29303
    .goto Ashenvale,40.501,53.281
    .cast 6247 >>点击|cRXP_PICK_Night Elf Grave|r
    .timer 48,Tragedy and Family RP
    .skipgossip
step
    .isOnQuest 29203
    .goto Ashenvale,40.501,53.281
    >>|cRXP_WARN_等待RP结束|r
    .complete 29303,1 -- Look deeper into Leyara's memories 1/1
    .skipgossip
step
    .isQuestTurnedIn 29203
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29303 >>交任务: |cRXP_FRIENDLY_悲剧与家庭|r
    .accept 29310 >>接任务: |cRXP_WARN_临界点|r
step
    .isOnQuest 29310
    #completewith next
    .zone 198 >>前往海加尔山
step
    .isOnQuest 29310
    .goto 198,7.561,34.582
    .cast 6247 >>点击|cRXP_PICK_墓碑|r
    .timer 59,The Tipping Point RP
    .skipgossip
step
    .isOnQuest 29310
    .goto 198,7.561,34.582
    >>|cRXP_WARN_等待RP结束|r
    .complete 29310,1 -- Look deeper into Leyara's memories 1/1
    .skipgossip
step
    .isQuestTurnedIn 29203
    >>点击任务日志中的任务提交弹出窗口
    .turnin 29310 >>交任务: |cRXP_FRIENDLY_临界点|r
    .accept 29311 >>接任务: |cRXP_WARN_皆不可考|r
step
    #optional
    #completewith next
    .isOnQuest 29311
    .goto 198,27.484,56.394
    .zone 338 >>穿过传送门前往火焰之地
step
    .isOnQuest 29311
    .goto 338,47.022,91.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .turnin 29311 >>交任务: |cRXP_FRIENDLY_皆不可考|r
    .target Malfurion Stormrage
--Complete Filling the Moonwell

step
    #optional
    .isQuestTurnedIn 29284
    .isQuestTurnedIn 29282
    .isQuestTurnedIn 29311
    .goto 338,46.932,90.984
    +恭喜你解锁了熔火前线全部内容！继续完成以下任一任务(|cRXP_ENEMY_2.5|r- 熔火前线 + 德鲁伊)或(|cRXP_PICK_2.5|r- 熔火前线 + 守护者), 以获得更多的 |T513195:0|t[世界树印记]
    >>|cRXP_FRIENDLY_Zen'Vorka|r出售|T133654:0|t[|cRXP_FRIENDLY_Zen'Vorka的宝箱|r], 价格为30枚|T513195:0|t[世界树印记], 其中可能包含一件随机的绿色品质物品或稀有宠物|T294481:0|t[|cFF0070FF灼烧石|r]
    .target Zen'Vorka

step
    #label WardenEnd
    +|cRXP_WARN_您已完成今日所有可用的日常任务. 请明日重新加载同一份指南(|r|cRXP_PICK_2.5|r- 熔火前线 + 守护者|cRXP_WARN_), 继续完成日常任务, 直至收集足够的|r|T513195:0|t[世界树印记]
]])