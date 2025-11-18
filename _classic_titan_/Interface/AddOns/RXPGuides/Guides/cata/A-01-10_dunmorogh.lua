local _,addon = ...
if addon.game ~= "CATA" or addon.player.faction ~= 'Alliance' then return end
RXPGuides.RegisterGuide([[

#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 1-6 寒脊山谷
#displayname 1-6 寒脊山谷
#next 6-7 丹莫罗;6-9 艾尔文森林
#defaultfor Dwarf !DK

<< Alliance

--XX Map ID changes from 27 -> 427 in MoP / custom starter zone map gets added


step
    .goto 27,36.872,70.045
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔恩·铁枷|r
    .accept 24469 >>接任务: |cRXP_WARN_坚守防线！|r
	.target Joren Ironstock
step
    #loop
    .goto 27,36.614,70.677,0
    .goto 27,36.978,72.181,0
    .goto 27,35.484,71.799,0
    .goto 27,36.614,70.677,45,0
    .goto 27,37.227,71.407,45,0
    .goto 27,37.518,72.286,45,0
    .goto 27,36.978,72.181,45,0
    .goto 27,36.652,71.711,45,0
    .goto 27,36.202,71.961,45,0
    .goto 27,35.484,71.799,45,0
    .goto 27,35.294,71.208,45,0
    .goto 27,35.510,70.301,45,0
    .goto 27,36.048,70.841,45,0
    >>杀死|cRXP_ENEMY_Rockjaw 入侵者|r
    .complete 24469,1 --Rockjaw Invader (6)
	.mob Rockjaw Invader
step
    .goto 27,36.872,70.045
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔恩·铁枷|r
    .turnin 24469 >>交任务: |cRXP_FRIENDLY_坚守防线！|r
    .accept 24470 >>接任务: |cRXP_WARN_罪有应得！|r
	.target Joren Ironstock
step
    .goto 27,36.563,70.080,5,0 --North side
    .goto 27,36.554,70.400,5,0
    .goto 27,36.584,70.497,5,0
    .goto 27,36.554,70.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯登·粗臂|r
    .accept 24471 >>接任务: |cRXP_WARN_疗伤|r
	.target Sten Stoutarm
step << skip
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
	#sticky
    #label Goons
    #loop
    .goto 27,38.515,72.700,0
    .goto 27,36.526,73.694,0
    .goto 27,34.795,71.111,0
    .waypoint 27,38.515,72.700,45,0
    .waypoint 27,38.009,73.295,45,0
    .waypoint 27,37.141,73.772,45,0
    .waypoint 27,36.526,73.694,45,0
    .waypoint 27,36.476,74.066,45,0
    .waypoint 27,35.450,73.525,45,0
    .waypoint 27,35.070,73.188,45,0
    .waypoint 27,34.649,71.899,45,0
    .waypoint 27,34.795,71.111,45,0
    >>杀死 |cRXP_ENEMY_Rockjaw Goons|r
    .complete 24470,1 --Rockjaw Goon (3)
	.mob Rockjaw Goon
step
    #loop
    .goto 27,37.425,72.024,0
    .goto 27,36.778,73.978,0
    .goto 27,35.620,71.276,0
    .goto 27,37.425,72.024,15,0
    .goto 27,38.080,72.027,15,0
    .goto 27,38.468,72.417,15,0
    .goto 27,38.061,72.905,15,0
    .goto 27,37.477,73.160,15,0
    .goto 27,37.363,74.004,15,0
    .goto 27,36.778,73.978,15,0
    .goto 27,36.810,73.133,15,0
    .goto 27,36.497,73.536,15,0
    .goto 27,35.829,73.700,15,0
    .goto 27,35.112,73.167,15,0
    .goto 27,35.672,72.677,15,0
    .goto 27,35.923,72.086,15,0
    .goto 27,35.620,71.276,15,0
    >>|cRXP_WARN_使用|r |T133675:0|t[Sten 的急救箱] |cRXP_WARN_on|r |cRXP_FRIENDLY_受伤的寒脊登山者|r
    .complete 24471,1 --Wounded Coldridge Mountaineers Aided (4)
	.target Wounded Coldridge Mountaineer
	.use 49743
step
    #requires Goons
    .goto 27,36.584,70.497,5,0 --South side
    .goto 27,36.554,70.400,5,0
    .goto 27,36.563,70.080,5,0
    .goto 27,36.554,70.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯登·粗臂|r
    .turnin 24471 >>交任务: |cRXP_FRIENDLY_疗伤|r
	.target Sten Stoutarm
step
    .goto 27,36.872,70.045
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔恩·铁枷|r
    .turnin 24470 >>交任务: |cRXP_FRIENDLY_罪有应得！|r
    .accept 24473 >>接任务: |cRXP_WARN_安威玛尔紧急戒严|r
	.target Joren Ironstock
step
    #optional
    #completewith next
    .goto 27,35.914,68.096,30,0
    .goto 27,35.751,67.107,12,0
    .goto 27,35.650,66.782,12 >>进入安威玛尔
    .isOnQuest 24473
step
    #loop
    .line 27,35.901,65.750,35.997,65.913,36.009,66.126,35.944,66.274,35.810,66.348,35.674,66.264,35.598,66.086,35.627,65.905,35.901,65.750
    .goto 27,35.810,66.348,12,0
    .goto 27,35.674,66.264,12,0
    .goto 27,35.598,66.086,12,0
    .goto 27,35.627,65.905,12,0
    .goto 27,35.901,65.750,12,0
    .goto 27,35.997,65.913,12,0
    .goto 27,36.009,66.126,12,0
    .goto 27,35.944,66.274,12,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔娜·铁枷|r, 他在里面
    .turnin 24473 >>交任务: |cRXP_FRIENDLY_安威玛尔紧急戒严|r
    .accept 24474 >>接任务: |cRXP_WARN_重要的事先做：我们需要啤酒|r
	.target Jona Ironstock
step
    .goto 27,35.801,66.256
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格伦德尔·哈金|r, 他在里面
    .accept 24477 >>接任务: |cRXP_WARN_矮人圣物|r
	.target Grundel Harkin
step
    #optional
    #completewith next
    .goto 27,35.805,67.328,10,0
    .goto 27,35.912,68.003,15 >>离开安威玛尔
    .isOnQuest 24474
    .subzoneskip 77,1
step
    #completewith next
    .goto 27,38.393,67.671,0
    .goto 27,36.450,67.833,0
    .goto 27,36.450,67.833,15,0
    >>拾取地下的 |cRXP_LOOT_被遗忘的矮人文物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step
    .goto 27,37.079,67.402
    >>打开地面上的 |cRXP_PICK_Keg of Gnomenbrau|r。拾取它以获得 |cRXP_LOOT_Cask of Gnomenbrau|r
    .complete 24474,3 --Cask of Gnomenbrau (1)
step
    #optional
    #completewith next
    .goto 27,38.393,67.671,0
    .goto 27,36.450,67.833,0
    --Z: those goto steps are a huge waste of time, just run to the next cask and get stuff on the way
    --.goto 27,37.830,67.473,15,0
    --.goto 27,38.307,66.701,15,0
    --.goto 27,38.370,66.206,15,0
    --.goto 27,39.189,66.844,15,0
    --.goto 27,38.393,67.671,15,0
    --.goto 27,37.556,67.973,15,0
    --.goto 27,37.093,68.372,15,0
    --.goto 27,36.821,68.680,15,0
    --.goto 27,36.450,67.833,15,0
    --.goto 27,35.548,67.767,15,0 --West1
    >>拾取地下的 |cRXP_LOOT_被遗忘的矮人文物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step
    .goto 27,34.822,67.386
    >>打开地面上的 |cRXP_PICK_Keg of Stormhammer Stout|r。拾取它以获得 |cRXP_LOOT_Casak of Stormhammer Stout|r
    .complete 24474,1 --Cask of Stormhammer Stout (1)
step
    #optional
    #completewith next
    .goto 27,34.600,67.539,0
    .goto 27,34.244,67.234,0
    .goto 27,34.600,67.539,15,0
    .goto 27,34.440,66.416,15,0
    .goto 27,34.244,67.234,15,0
    .goto 27,34.321,68.013,15,0
    .goto 27,33.794,67.327,15,0
    >>拾取地下的 |cRXP_LOOT_被遗忘的矮人文物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step
    .goto 27,31.469,67.635
    >>打开地面上的 |cRXP_PICK_Keg of Theramore Pale Ale|r。拾取它以获得 |cRXP_LOOT_Cask of Stormhammer Stout|r
    .complete 24474,2 --Cask of Theramore Pale Ale (1)
step
    #loop
    .goto 27,34.600,67.539,0
    .goto 27,33.794,67.327,0
    .goto 27,38.307,66.701,0
    .goto 27,36.450,67.833,0
    .goto 27,33.794,67.327,15,0
    .goto 27,34.321,68.013,15,0
    .goto 27,34.244,67.234,15,0
    .goto 27,34.440,66.416,15,0
    .goto 27,34.600,67.539,15,0
    .goto 27,35.548,67.767,15,0
    .goto 27,36.450,67.833,15,0
    .goto 27,37.830,67.473,15,0
    .goto 27,38.307,66.701,15,0
    .goto 27,38.370,66.206,15,0
    .goto 27,39.189,66.844,15,0
    .goto 27,38.393,67.671,15,0
    .goto 27,37.556,67.973,15,0
    .goto 27,37.093,68.372,15,0
    .goto 27,36.821,68.680,15,0
    .goto 27,36.450,67.833,15,0
    >>拾取地下的 |cRXP_LOOT_被遗忘的矮人文物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step << skip
    #loop
    .goto 27,30.733,68.123,0
    .goto 27,30.082,67.724,0
    .goto 27,29.520,68.468,0
    .goto 27,27.786,67.798,0
    .goto 27,28.926,69.221,0
    .goto 27,31.020,69.465,0
    .goto 27,30.733,68.123,15,0
    .goto 27,30.458,67.808,15,0
    .goto 27,30.167,68.093,15,0
    .goto 27,30.082,67.724,15,0
    .goto 27,30.165,68.092,15,0
    .goto 27,29.944,68.767,15,0
    .goto 27,29.520,68.468,15,0
    .goto 27,28.890,67.923,15,0
    .goto 27,27.126,67.182,15,0
    .goto 27,27.786,67.798,15,0
    .goto 27,28.224,68.504,15,0
    .goto 27,28.126,68.706,15,0
    .goto 27,28.926,69.221,15,0
    .goto 27,29.245,68.975,15,0
    .goto 27,31.020,69.465,15,0
    >>拾取地下的 |cRXP_LOOT_被遗忘的矮人文物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
--XX Far west side near boars. Just not worth it - there's enough shared spawns outside Anvilmar
step
    #optional
    #completewith FirstThing
    .goto 27,35.914,68.096,30,0
    .goto 27,35.751,67.107,12,0
    .goto 27,35.650,66.782,15 >>进入安威玛尔
    .cooldown item,6948,<0 << Dwarf !DK
    .isOnQuest 24474
    .noflyable  --Azeroth Flying
step << Dwarf !DK
    #optional
    #completewith FirstThing
    .hs >>炉石到安威玛尔
    .cooldown item,6948,>2,1
    .isOnQuest 24474
    .noflyable  --Azeroth Flying
    .subzoneskip 77
step
    #optional
    #completewith FirstThing
    .goto 27,35.914,68.096,30,0
    .goto 27,35.751,67.107,12,0
    .goto 27,35.650,66.782,15 >>进入安威玛尔
    .isOnQuest 24474
    .flyable  --Azeroth Flying
step
    #sticky
    #label FirstThing
    .line 27,35.901,65.750,35.997,65.913,36.009,66.126,35.944,66.274,35.810,66.348,35.674,66.264,35.598,66.086,35.627,65.905,35.901,65.750
    .goto 27,35.810,66.348,12,0
    .goto 27,35.674,66.264,12,0
    .goto 27,35.598,66.086,12,0
    .goto 27,35.627,65.905,12,0
    .goto 27,35.901,65.750,12,0
    .goto 27,35.997,65.913,12,0
    .goto 27,36.009,66.126,12,0
    .goto 27,35.944,66.274,12,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔娜·铁枷|r, 他在里面
    .turnin 24474 >>交任务: |cRXP_FRIENDLY_重要的事先做：我们需要啤酒|r
    .accept 24475 >>接任务: |cRXP_WARN_其他的物资|r
	.target Jona Ironstock
step
    .goto 27,35.801,66.256,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格伦德尔·哈金|r, 他在里面
    .turnin 24477 >>交任务: |cRXP_FRIENDLY_矮人圣物|r
    .accept 24486 >>接任务: |cRXP_WARN_抓紧时机|r
	.target Grundel Harkin
step
    #optional
    #requires FirstThing
    #completewith RockjawA
    .goto 27,35.805,67.328,10,0
    .goto 27,35.702,68.138,20 >>离开安威玛尔
    .isOnQuest 24475
    .subzoneskip 77,1
step
    #completewith RockjawA
    #requires FirstThing
    .goto 27,34.571,68.391,0
    .goto 27,35.301,74.641,0
    .goto 27,36.039,76.329,0
    .goto 27,37.881,75.440,0
    .goto 27,39.236,72.809,0
    .goto 27,37.185,74.444,0
    .goto 27,34.571,68.391,35,0
    >>杀死 |cRXP_ENEMY_Ragged Timber Wolves|r 和 |cRXP_ENEMY_Ragged Young Wolves|r。掠夺他们的 |cRXP_LOOT_Ragged Wolf Hides|r
    .complete 24475,2 --Ragged Wolf Hide (4)
    .mob *Ragged Young Wolf
    .mob *Ragged Timber Wolf
step
    #completewith RockjawA
    #requires FirstThing
    .goto 27,34.474,69.536,0
    .goto 27,33.467,72.668,0
    .goto 27,34.475,74.869,0
    .goto 27,36.077,74.386,0
    .goto 27,31.914,69.640,0
    .goto 27,34.474,69.536,35,0
    >>杀死 |cRXP_ENEMY_Small Crag Boars|r。掠夺它们的 |cRXP_LOOT_Boar Haunches|r
    .complete 24475,1 --Boar Haunch (3)
    .mob *Small Crag Boar
step
    #label RockjawA
    #requires FirstThing
    #loop
    .goto 27,33.804,70.522,0
    .goto 27,32.918,70.006,0
    .goto 27,34.104,71.636,0
    .goto 27,33.804,70.522,30,0
    .goto 27,32.918,70.006,30,0
    .goto 27,32.729,70.874,30,0
    .goto 27,33.203,71.701,30,0
    .goto 27,34.104,71.636,30,0
    >>杀死 |cRXP_ENEMY_Rockjaw 拾荒者|r。掠夺他们的 |cRXP_LOOT_无价的 Rockjaw 文物|r
    >>|cRXP_WARN_请注意 |cRXP_ENEMY_Rockjaw Scavengers|r 施放|r |T135238:0|t[投掷无价文物] |cRXP_WARN_（造成伤害，但会给你一个 |cRXP_LOOT_无价的 Rockjaw 文物|r）|r
    .complete 24486,1 --Priceless Rockjaw Artifact (5)
	.mob Rockjaw Scavenger
--XX May need to drop duplicates?
step
    #optional
    #sticky
    #label DunWolves
    .goto 27,35.301,74.641,0
    .goto 27,36.039,76.329,0
    .goto 27,37.881,75.440,0
    .goto 27,39.236,72.809,0
    .goto 27,37.185,74.444,0
    .waypoint 27,35.301,74.641,50,0
    .waypoint 27,35.862,75.105,50,0
    .waypoint 27,35.644,75.522,50,0
    .waypoint 27,36.039,76.329,50,0
    .waypoint 27,36.517,76.456,50,0
    .waypoint 27,36.835,75.494,50,0
    .waypoint 27,37.881,75.440,50,0
    .waypoint 27,38.459,74.734,50,0
    .waypoint 27,39.273,74.287,50,0
    .waypoint 27,39.236,72.809,50,0
    .waypoint 27,38.883,72.557,50,0
    .waypoint 27,37.879,73.478,50,0
    .waypoint 27,37.185,74.444,50,0
    >>杀死 |cRXP_ENEMY_Ragged Timber Wolves|r 和 |cRXP_ENEMY_Ragged Young Wolves|r。掠夺他们的 |cRXP_LOOT_Ragged Wolf Hides|r
    .complete 24475,2 --Ragged Wolf Hide (4)
    .mob *Ragged Young Wolf
    .mob *Ragged Timber Wolf
step
    #optional
    .goto 27,33.467,72.668,0
    .goto 27,34.475,74.869,0
    .goto 27,36.077,74.386,0
    .goto 27,31.914,69.640,0
    .goto 27,33.467,72.668,50,0
    .goto 27,34.081,73.758,50,0
    .goto 27,34.475,74.869,50,0
    .goto 27,35.291,74.316,50,0
    .goto 27,36.077,74.386,50,0
    .goto 27,32.453,72.893,50,0
    .goto 27,30.989,70.747,50,0
    .goto 27,31.914,69.640,50,0
    >>杀死 |cRXP_ENEMY_Small Crag Boars|r。掠夺它们的 |cRXP_LOOT_Boar Haunches|r
    .complete 24475,1 --Boar Haunch (3)
    .mob Small Crag Boar
step
    #optional
    #requires DunWolves
    #completewith Sun
    .goto 27,35.914,68.096,30,0
    .goto 27,35.751,67.107,12,0
    .goto 27,35.650,66.782,15 >>进入安威玛尔
    .cooldown item,6948,<0 << Dwarf !DK
    .isOnQuest 24475
    .noflyable  --Azeroth Flying
step << Dwarf !DK
    #optional
    #requires DunWolves
    #completewith Sun
    .hs >>炉石到安威玛尔
    .cooldown item,6948,>2,1
    .isOnQuest 24475
    .noflyable  --Azeroth Flying
step
    #optional
    #requires DunWolves
    #completewith Sun
    .goto 27,35.914,68.096,30,0
    .goto 27,35.751,67.107,12,0
    .goto 27,35.650,66.782,15 >>进入安威玛尔
    .isOnQuest 24475
    .flyable  --Azeroth Flying
step
    #label Sun
    #requires DunWolves
    .goto 27,35.801,66.256
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格伦德尔·哈金|r, 他在里面
    .turnin 24486 >>交任务: |cRXP_FRIENDLY_抓紧时机|r
	.target Grundel Harkin
step
    .line 27,35.901,65.750,35.997,65.913,36.009,66.126,35.944,66.274,35.810,66.348,35.674,66.264,35.598,66.086,35.627,65.905,35.901,65.750
    .goto 27,35.810,66.348,12,0
    .goto 27,35.674,66.264,12,0
    .goto 27,35.598,66.086,12,0
    .goto 27,35.627,65.905,12,0
    .goto 27,35.901,65.750,12,0
    .goto 27,35.997,65.913,12,0
    .goto 27,36.009,66.126,12,0
    .goto 27,35.944,66.274,12,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔娜·铁枷|r, 他在里面
    .turnin 24475 >>交任务: |cRXP_FRIENDLY_其他的物资|r
    .accept 24487 >>接任务: |cRXP_WARN_白须需要你|r
	.target Jona Ironstock
step
    #optional
    #completewith next
    .goto 27,35.805,67.328,10,0
    .goto 27,35.702,68.138,20 >>离开安威玛尔
    .isOnQuest 24487
    .subzoneskip 77,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r, |cRXP_FRIENDLY_学徒索林|r, |cRXP_FRIENDLY_菲利克斯|r
    .turnin 24487 >>交任务: |cRXP_FRIENDLY_白须需要你|r
    .accept 182 >>接任务: |cRXP_WARN_巨魔洞穴|r
    .goto 27,32.064,74.170
	.target +格雷林·白胡子
    .accept 24489 >>接任务: |cRXP_WARN_打探消息|r
    .goto 27,32.165,74.347
	.target +学徒索伦
    .accept 3361 >>接任务: |cRXP_LOOT_逃难者的困境|r
    .goto 27,31.899,74.318,10,0
    .goto 27,31.906,74.525
	.target +菲利克斯·温德尔博特
step
	#sticky
    #label Whelps
    #loop
    .goto 27,33.906,77.523,0
    .goto 27,32.815,76.666,0
    .goto 27,29.841,78.444,0
    .goto 27,28.324,75.368,0
    .goto 27,28.176,74.189,0
    .waypoint 27,33.906,77.523,45,0
    .waypoint 27,34.167,77.077,45,0
    .waypoint 27,33.405,76.915,45,0
    .waypoint 27,32.815,76.666,45,0
    .waypoint 27,32.380,76.052,45,0
    .waypoint 27,30.676,78.641,45,0
    .waypoint 27,29.841,78.444,45,0
    .waypoint 27,29.325,77.816,45,0
    .waypoint 27,28.216,76.231,45,0
    .waypoint 27,28.324,75.368,45,0
    .waypoint 27,27.677,74.636,45,0
    .waypoint 27,27.627,74.159,45,0
    .waypoint 27,27.900,73.634,45,0
    .waypoint 27,28.176,74.189,45,0
    >>杀死 |cRXP_ENEMY_Frostmane 巨魔幼龙|r
    .complete 182,1 --Frostmane Troll Whelp (10)
	.mob Frostmane Troll Whelp
step
    .goto 27,27.846,74.530
    >>战利品 |cRXP_LOOT_Felix 的盒子|r 在地面上
    .complete 3361,1 --Felix's Box (1)
step
    #optional
    #completewith next
    .goto 27,27.759,75.195,10 >>前往 |cRXP_FRIENDLY_Soothsayer Mirim'koa|r 内部
    .timer 11,Trolling for Information RP
    .isOnQuest 24489
--XX you can start the event earlier then get the box and come back but its way too hard to communicate it/trust the player enough for a 3s time gain vs 20s time loss
step
    .goto 27,27.759,75.195
    >>|cRXP_WARN_等待 RP|r
    >>|cRXP_WARN_靠近 |cRXP_FRIENDLY_Soothsayer Mirim'koa|r，否则目标将无法完成|r
    .complete 24489,3 --Soothsayer Mirim'koa Scouted (1)
    .target Soothsayer Mirim'koa
step
    #optional
    #completewith next
    .goto 27,29.593,78.754,11 >>前往 |cRXP_FRIENDLY_Soothsayer Rikkari|r 内部
    .timer 11,Trolling for Information RP
    .isOnQuest 24489
step
    #sticky
    #label Rikkari
    .goto 27,29.593,78.754
    >>|cRXP_WARN_等待 RP|r
    >>|cRXP_WARN_靠近 |cRXP_FRIENDLY_Soothsayer Rikkari|r，否则目标将无法完成|r
    .complete 24489,2 --Soothsayer Rikkari Scouted (1)
    .target Soothsayer Rikkari
--XX no good way to do the .goto prios for these steps
step
    .goto 27,29.750,78.485
    >>战利品 |cRXP_LOOT_Felix's Chest|r 在地面上
    .complete 3361,2 --Felix's Chest (1)
step
    #optional
    #completewith next
    #requires Rikkari
    .goto 27,33.323,77.988,11 >>前往 |cRXP_FRIENDLY_Soothsayer Shi'kala|r
    .timer 13,Trolling for Information RP
    .isOnQuest 24489
step
    #sticky
    #requires Rikkari
    #label Shikala
    .goto 27,33.323,77.988
    >>|cRXP_WARN_等待 RP|r
    >>|cRXP_WARN_靠近 |cRXP_FRIENDLY_Soothsayer Shi'kala|r，否则目标将无法完成|r
    .complete 24489,1 --Soothsayer Shi'kala Scouted (1)
    .target Soothsayer Shi'kala
step
    #requires Rikkari
    .goto 27,33.325,77.755
    >>战利品 |cRXP_LOOT_Felix 的一桶螺栓|r 在地面上
    .complete 3361,3 --Felix's Bucket of Bolts (1)
step
    #optional
    #requires Shikala
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires Whelps
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲利克斯|r, |cRXP_FRIENDLY_学徒索林|r, |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 3361 >>交任务: |cRXP_FRIENDLY_逃难者的困境|r
    .goto 27,31.906,74.525,10,0
    .goto 27,31.899,74.318
	.target +菲利克斯·温德尔博特
    .turnin 24489 >>交任务: |cRXP_FRIENDLY_打探消息|r
    .goto 27,32.165,74.347
	.target +学徒索伦
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
	.accept 218 >>接任务: |cRXP_WARN_被窃取的日记|r
    .goto 27,32.064,74.170
	.target +格雷林·白胡子
--XX 182 can be completed later

--steps for strictly cata, changes in mop
step << cata
    #optional
    #completewith Griknir
    .goto 428,12.774,40.711,15 >>进入寒脊山谷洞穴
	.isOnQuest 218
step << cata
    #optional
    #completewith Griknir
    >>杀死 |cRXP_ENEMY_Frostmane Blades|r 和 |cRXP_ENEMY_Frostmane Novices|r
    .complete 218,2 --Grik'nir's Servant slain (10)
	.mob Frostmane Blade
step << cata
    #label Griknir
    .goto Dun Morogh,35.80,77.36,30,0
    .goto 428,76.449,32.098
    >>杀死 |cRXP_ENEMY_冷酷的格里克尼尔|r
    .complete 218,1 --Grik'nir the Cold (1)
	.mob Grik'nir the Cold
step << cata
    #completewith next
    .goto 428,77.421,26.068,0
    .goto 428,60.009,17.985,0
    .goto 428,60.865,46.816,0
    >>杀死 |cRXP_ENEMY_Frostmane Blades|r 和 |cRXP_ENEMY_Frostmane Novices|r
    .complete 218,2 --Grik'nir's Servant slain (10)
	.mob Frostmane Blade
    .mob Frostmane Novice
step << cata
    .line 428,63.523,21.372,63.490,25.701,64.533,33.319,65.216,34.130,67.843,33.396,69.711,31.243,69.677,26.654,66.486,22.402,63.523,21.372
    .goto 428,63.523,21.372,10,0
    .goto 428,63.490,25.701,10,0
    .goto 428,64.533,33.319,10,0
    .goto 428,65.216,34.130,10,0
    .goto 428,67.843,33.396,10,0
    .goto 428,69.711,31.243,10,0
    .goto 428,69.677,26.654,10,0
    .goto 428,66.486,22.402,10,0
    >>杀死里面的 |cRXP_ENEMY_Wayward Fire Elemental|r
    .complete 218,3 --Wayward Fire Elemental (1)
	.mob Wayward Fire Elemental
step << cata
    .goto 428,77.421,26.068,0
    .goto 428,60.009,17.985,0
    .goto 428,60.865,46.816,0
    >>杀死 |cRXP_ENEMY_Frostmane Blades|r 和 |cRXP_ENEMY_Frostmane Novices|r
    .complete 218,2 --Grik'nir's Servant slain (10)
    .waypoint 428,71.104,18.539,20,0
    .waypoint 428,55.686,13.478,12,0
    .waypoint 428,58.225,33.709,12,0
    .waypoint 428,59.189,40.829,12,0
    .waypoint 428,67.202,42.936,12,0
	.mob Frostmane Blade
    .mob Frostmane Novice

--steps for mop onwards
step << !tbc !wotlk !cata
    #optional
    #completewith Hovel2
    >>杀死 |cRXP_ENEMY_Frostmane Blades|r
    .complete 218,4 --Frostmane Blade (6)
	.mob Frostmane Blade
step << !tbc !wotlk !cata
    #optional
    #completewith Griknir
    #label Hovel1
    .goto 428,12.774,40.711,15 >>进入寒脊山谷洞穴
	.isOnQuest 218
step << !tbc !wotlk !cata
    #optional
    #completewith Griknir
    #label Hovel2
    #requires Hovel1
    .goto 428,15.112,45.588,15,0
    .goto 428,18.302,48.547,15,0
    .goto 428,37.713,29.248,15,0
    .goto 428,52.353,14.297,15,0
    .goto 428,76.449,32.098,80 >>前往 |cRXP_ENEMY_Grik'nir the Cold|r 内部
	.isOnQuest 218
step << !tbc !wotlk !cata
    #sticky
    #label Novices
    #requires Hovel2
    #loop
    .goto 428,77.421,26.068,0
    .goto 428,60.009,17.985,0
    .goto 428,60.865,46.816,0
    >>杀死里面的 |cRXP_ENEMY_Frostmane Novices|r 和 |cRXP_ENEMY_Frostmane Blades|r
    .complete 218,3 --Frostmane Novice (3)
    .waypoint 428,78.818,25.838,12,0
    .waypoint 428,71.497,24.360,12,0
    .waypoint 428,66.048,20.082,12,0
    .waypoint 428,60.965,24.058,12,0
    .waypoint 428,61.733,31.748,12,0
    .waypoint 428,62.955,38.259,12,0
    .waypoint 428,74.593,37.568,12,0
	.mob +*霜鬃新手
    .complete 218,4 --Frostmane Blade (6)
    .waypoint 428,71.104,18.539,20,0
    .waypoint 428,55.686,13.478,12,0
    .waypoint 428,58.225,33.709,12,0
    .waypoint 428,59.189,40.829,12,0
    .waypoint 428,67.202,42.936,12,0
	.mob +*霜鬃之刃
step << !tbc !wotlk !cata
    #sticky
    #label FireElemental
    #requires Hovel2
    #loop
    .line 428,63.523,21.372,63.490,25.701,64.533,33.319,65.216,34.130,67.843,33.396,69.711,31.243,69.677,26.654,66.486,22.402,63.523,21.372
    .goto 428,63.523,21.372,10,0
    .goto 428,63.490,25.701,10,0
    .goto 428,64.533,33.319,10,0
    .goto 428,65.216,34.130,10,0
    .goto 428,67.843,33.396,10,0
    .goto 428,69.711,31.243,10,0
    .goto 428,69.677,26.654,10,0
    .goto 428,66.486,22.402,10,0
    >>杀死里面的 |cRXP_ENEMY_Wayward Fire Elemental|r
    .complete 218,2 --Wayward Fire Elemental (1)
	.mob Wayward Fire Elemental
step << !tbc !wotlk !cata
    .goto 428,76.449,32.098
    >>杀死里面的 |cRXP_ENEMY_Grik'nir the Cold|r
    .complete 218,1 --Grik'nir the Cold (1)
	.mob Grik'nir the Cold
step << !tbc !wotlk !cata
    #optional
    #requires Novices
--XXREQ Placeholder invis step until multiple requires per step
step
    #optional
    #completewith next
    #requires FireElemental
    .goto 428,14.750,45.019,30,0
    .goto 27,33.772,78.335,15 >>离开寒脊山谷洞穴
    .isOnQuest 218
step
    .goto 27,32.064,74.170
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞林·白须|r
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 24490 >>接任务: |cRXP_WARN_铁炉堡之旅|r
	.target 格雷林·白胡子
step
    .goto 27,40.883,70.673
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_汉兹·跳链|r
    .turnin 24490 >>交任务: |cRXP_FRIENDLY_铁炉堡之旅|r
    .accept 24491 >>接任务: |cRXP_WARN_跟上那架直升机！|r
	.target 指针 弹簧链轮
step
    .goto 27,37.404,70.581
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米罗·齿针|r
    .turnin 24491 >>交任务: |cRXP_FRIENDLY_跟上那架直升机！|r
    .accept 24492 >>接任务: |cRXP_WARN_收拾行囊|r
	.target Milo Geartwinge
step
    #optional
    #completewith Pack
    .goto 27,35.914,68.096,30,0
    .goto 27,35.836,67.146,12,0
    .goto 27,35.953,66.803,15 >>进入安威玛尔
    .isOnQuest 24492
    .subzoneskip 77
step
    #sticky
    #label Forget
    .line 27,35.901,65.750,35.997,65.913,36.009,66.126,35.944,66.274,35.810,66.348,35.674,66.264,35.598,66.086,35.627,65.905,35.901,65.750
    .goto 27,35.810,66.348,12,0
    .goto 27,35.674,66.264,12,0
    .goto 27,35.598,66.086,12,0
    .goto 27,35.627,65.905,12,0
    .goto 27,35.901,65.750,12,0
    .goto 27,35.997,65.913,12,0
    .goto 27,36.009,66.126,12,0
    .goto 27,35.944,66.274,12,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔娜·铁枷|r, 他在里面
    .accept 24493 >>接任务: |cRXP_WARN_别忘记我们|r
	.target Jona Ironstock
step
    .goto Dun Morogh,35.39,66.03
    >>拾取桌子上的 |cRXP_LOOT_Leftover Boar Meat|r
    .complete 24492,3 --|Leftover Boar Meat: 1/1
step
    .goto Dun Morogh,35.480,65.151
    >>打开地面上的 |cRXP_PICK_啤酒桶|r。拾取它以获得 |cRXP_LOOT_Coldridge 啤酒瓶|r
    .complete 24492,1 --|Coldridge Beer Flagon: 1/1
step
    #completewith next
    .goto Dun Morogh,36.120,64.787,8 >>跑上楼梯
step
    .goto Dun Morogh,35.782,64.496
    >>打开地上的 |cRXP_PICK_狼皮斗篷|r 盒子。拾取 |cRXP_LOOT_破烂狼皮斗篷|r
    .complete 24492,2 --|Ragged Wolf-Hide 披风: 1/1
step
    #optional
    #requires Forget
    #completewith next
    .goto 27,35.805,67.328,10,0
    .goto 27,35.912,68.003,20 >>离开安威玛尔
    .isOnQuest 24492
    .subzoneskip 77,1
step
    #requires Forget
    .goto 27,37.404,70.581
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米罗·齿针|r
    .turnin 24492 >>交任务: |cRXP_FRIENDLY_收拾行囊|r
    .timer 26,Start to Logout when timer ends --Kharanos, Between 10-26s after turnin (needs to be tested more)
--   .timer 10,Start to Logout when timer ends --New Tinkertown
--   .timer 83.5,Pack Your Bags RP
	.target Milo Geartwinge
step
    .goto 27,53.713,52.190
    >>|cRXP_WARN_当 26 秒计时器到期时（接受搭乘后 26 秒），请注销，然后重新登录，同时 |cRXP_FRIENDLY_Milo's Gyro|r 注销并跳转到 Kharanos|r
    >>|cRXP_WARN_如果你在计时器到期前完成此操作，你可以退出并跳转到新 Tinkertown 或返回 Coldridge Valley。如果发生这种情况，请正常前往 Kharanos|r
    .subzone 131 >>前往卡拉诺斯
    .isOnQuest 24493
]])

--TODO: Polish the gnome section, havent touched it
--XX Logout Dwarves come from GY, non-logout from in front of blacksmith
RXPGuides.RegisterGuide([[

#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 1-6 新工匠镇
#displayname 1-6 新工匠镇
#next 6-7 丹莫罗;6-9 艾尔文森林
#defaultfor Gnome !DK

<< Gnome Alliance

step
    .goto 30,34.101,32.243
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_内温·扭钳|r
    .accept 27670 >>接任务: |cRXP_WARN_被压制|r
    .target Nevin Twistwrench
step
    #loop
    .goto 30,40.712,32.200,0
    .goto 30,43.924,36.923,0
    .goto 30,44.916,26.413,0
    .goto 30,40.712,32.200,15,0
    .goto 30,43.924,36.923,25,0
    .goto 30,49.744,39.322,25,0
    .goto 30,49.077,32.873,25,0
    .goto 30,50.404,27.498,25,0
    .goto 30,44.916,26.413,25,0
    >>杀死 |cRXP_ENEMY_疯狂的麻风侏儒|r
    .complete 27670,1 --Crazed Leper Gnome (6)
	.mob Crazed Leper Gnome
step
    .goto 30,34.101,32.243
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Nevin Twistwrench|r
    .turnin 27670 >>交任务: |cRXP_FRIENDLY_被压制|r
    .accept 28167 >>接任务: |cRXP_WARN_向卡沃·爆弹报告|r
	.target Nevin Twistwrench
step
    .goto 30,50.973,31.915
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡沃·爆弹|r
    .turnin 28167 >>交任务: |cRXP_FRIENDLY_向卡沃·爆弹报告|r
    .accept 27671 >>接任务: |cRXP_WARN_照料幸存者|r
	.target Carvo Blastbolt
step << skip
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
    .isOnQuest 27671
step
    #loop
    .goto 30,50.065,30.713,0
    .goto 30,52.634,23.152,0
    .goto 30,51.591,37.316,0
    .goto 30,50.065,30.713,15,0
    .goto 30,53.170,29.377,15,0
    .goto 30,52.156,27.685,15,0
    .goto 30,52.634,23.152,15,0
    .goto 30,45.858,24.345,15,0
    .goto 30,47.631,30.000,15,0
    .goto 30,43.926,30.137,15,0
    .goto 30,42.540,36.441,15,0
    .goto 30,50.993,42.921,15,0
    .goto 30,51.591,37.316,15,0
    >>|cRXP_WARN_使用|r |T133860:0|t[传送信标] |cRXP_WARN_on|r |cRXP_FRIENDLY_Survivors|r
    .complete 27671,1 --Survivors Rescued (6)
    .use 62057
	.target Survivor
step
    .goto 30,50.973,31.915
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡沃·爆弹|r
    .turnin 27671 >>交任务: |cRXP_FRIENDLY_照料幸存者|r
    .accept 28169 >>接任务: |cRXP_WARN_撤到装载室！|r
	.target Carvo Blastbolt
step
    #completewith next
    .goto 30,51.481,37.082,20,0
    .goto 30,52.309,62.433,20,0
    .goto 30,53.355,74.209,20,0
    .goto 30,53.063,82.341,15 >>前往 |cRXP_FRIENDLY_Gaffer Coilspring|r
step
    .goto 30,53.063,82.341
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格菲尔·卷簧|r
    .turnin 28169 >>交任务: |cRXP_FRIENDLY_撤到装载室！|r
    .accept 27635 >>接任务: |cRXP_WARN_净化处理|r
	.target Gaffer Coilspring
step << skip -- not working currently in cata
    .goto 30,58.746,82.974
    >>|cRXP_WARN_在 |cRXP_FRIENDLY_Sanitron 500|r 前面输入 /sit，然后输入以跳过 RP|r
    .complete 27635,1 --Decontamination Process started (1)
    .target Sanitron 500
--XX  .emote SIT,46185 Doesn't work here, needs a delay (batch makes this not work)
--   .timer 26,Decontamination RP

step
    .isOnQuest 27635
    .goto 30,58.746,82.974
    .vehicle >>单击|cRXP_FRIENDLY_Sanitron 500|r
    .timer 30,Decontamination RP
    .target Sanitron 500
step
    >>|cRXP_WARN_等待 RP|r
    .complete 27635,1 --Decontamination Process started (1)
    .target Sanitron 500
step
    .goto 30,66.420,81.624
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_技师布朗格|r
    .turnin 27635 >>交任务: |cRXP_FRIENDLY_净化处理|r
    .accept 27674 >>接任务: |cRXP_WARN_到地面去|r
	.target Technician Braggle
step
    .goto 30,67.282,84.148
    .gossip 46293,0 >>对话: |cRXP_FRIENDLY_托尔本·光爆|r
    .skipgossip 46293,1
    .isOnQuest 27674
    .target Torben Zapblast
step
    .goto 469,39.504,38.383
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_内温·扭钳|r
    .turnin 27674 >>交任务: |cRXP_FRIENDLY_到地面去|r
    .accept 26206 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Rogue
    .accept 26197 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Mage
    .accept 26199 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Priest
    .accept 26202 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Warlock
    .accept 26203 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Warrior
    .accept 31135 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Monk
    .accept 41217 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Hunter
	.target Nevin Twistwrench
step << Gnome Rogue
    .goto 469,38.025,33.570
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 26206 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26423 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target 凯尔西·斯蒂尔斯帕克
step << Gnome Mage
    .goto 469,41.093,29.130
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贝西·冰雹|r
    .turnin 26197 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26421 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Bipsi Frostflinger
step << Gnome Priest
    .goto 469,39.406,28.385
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“怪医”克斯宾|r
    .turnin 26199 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26422 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target "Doc" Cogspin
step << Gnome Warlock
    .goto 469,37.679,37.957
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r
    .turnin 26202 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26424 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Alamar Grimm
step << Gnome Warrior
    #loop
    .line 469,40.688,36.199,40.672,35.736,40.645,35.354,40.517,34.973
    .goto 469,40.688,36.199,10,0
    .goto 469,40.672,35.736,10,0
    .goto 469,40.645,35.354,10,0
    .goto 469,40.517,34.973,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drill Seargent Steamcrank|r
    .turnin 26203 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26425 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Drill Seargent Steamcrank
step << Gnome Monk
    .goto 469,40.086,35.614
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xi, Friend to the Small|r
    .turnin 31135 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 31137 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Xi, Friend to the Small
step << Gnome Hunter
    .goto 469,41.925,31.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Muffinus Chromebrew|r
    .turnin 41217 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 41218 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Muffinus Chromebrew
step
    .goto 469,38.802,32.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大工匠梅卡托克|r
    .turnin 26423 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Rogue
    .turnin 26421 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Mage
    .turnin 26422 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Priest
    .turnin 26424 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Warlock
    .turnin 26425 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Warrior
    .turnin 31137 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Monk
    .turnin 41218 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Hunter/Druid
    .accept 26208 >>接任务: |cRXP_WARN_战斗继续|r
	.timer 115,Meet the High Tinker RP
	.target High Tinker Mekkatorque
step
    .goto 469,38.802,32.715
    >>|cRXP_WARN_等待|r |cRXP_FRIENDLY_High Tinker Mekkatorque旁边的RP|r
    .complete 26208,1 --Learn about Operation: Gnomeregan (1)
--XX moves to     .goto 469,38.622,32.905 1-2s after objective completes
step
    .goto 469,38.622,32.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大工匠梅卡托克|r
    .turnin 26208 >>交任务: |cRXP_FRIENDLY_战斗继续|r
    .accept 26566 >>接任务: |cRXP_WARN_侏儒才智的胜利|r
	.target High Tinker Mekkatorque
step
    .goto 469,40.578,28.021
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工程师格林德斯巴克|r
    .turnin 26566 >>交任务: |cRXP_FRIENDLY_侏儒才智的胜利|r
    .accept 26222 >>接任务: |cRXP_WARN_寻找零件|r
	.target Engineer Grindspark
step
    #loop
    .goto 469,40.494,27.605,0
    .goto 469,40.120,29.225,0
    .goto 469,39.656,32.676,0
    .goto 469,41.582,29.198,0
    .goto 469,40.494,27.605,10,0
    .goto 469,39.198,24.420,15,0
    .goto 469,38.810,27.054,15,0
    .goto 469,40.120,29.225,15,0
    .goto 469,39.165,29.163,15,0
--  .goto 469,38.476,28.416,15,0 --Inside, would cause too much confusion
    .goto 469,38.584,29.471,15,0
    .goto 469,38.171,30.664,15,0
    .goto 469,36.688,31.718,15,0
    .goto 469,37.961,32.983,15,0
    .goto 469,39.656,32.676,15,0
    .goto 469,40.736,34.654,15,0
    .goto 469,41.463,35.446,15,0
    .goto 469,41.611,33.559,15,0
    .goto 469,41.052,33.663,15,0
    .goto 469,41.387,31.803,15,0
    .goto 469,42.278,28.782,15,0
    .goto 469,41.582,29.198,15,0
    >>拾取地面上的 |cRXP_LOOT_Spare Parts|r
    .complete 26222,1 --Spare Part (7)
step
    .goto 469,40.578,28.021
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工程师格林德斯巴克|r
    .turnin 26222 >>交任务: |cRXP_FRIENDLY_寻找零件|r
    .accept 26205 >>接任务: |cRXP_WARN_多功能机器人的工作|r
	.target Engineer Grindspark
step
    .goto 469,39.225,26.552
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_Tock Sprysprocket|r
    .accept 26264 >>接任务: |cRXP_WARN_身后物|r
	.target Tock Sprysprocket
step
    .goto 469,38.201,40.196
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲兹维斯下士|r
    .accept 26265 >>接任务: |cRXP_WARN_处理辐射|r
	.target Corporal Fizzwhistle
step
    #sticky
    #label Contamination
    #loop
    .goto 469,40.992,40.259,0
    .goto 469,37.170,40.971,0
    .goto 469,39.912,49.912,0
    .waypoint 469,40.992,40.259,40,0
    .waypoint 469,40.559,39.847,40,0
    .waypoint 469,39.968,40.426,40,0
    .waypoint 469,39.065,40.724,40,0
    .waypoint 469,38.592,40.539,40,0
    .waypoint 469,37.980,41.331,40,0
    .waypoint 469,37.170,40.971,40,0
    .waypoint 469,36.360,40.843,40,0
    .waypoint 469,34.620,43.365,40,0
    .waypoint 469,36.336,44.818,40,0
    .waypoint 469,39.912,49.912,40,0
    >>杀死 |cRXP_ENEMY_Living Contaminations|r
    .complete 26265,1 --Living Contamination (6)
    .mob Living Contamination
step
    #completewith Geysers
    .goto 469,38.054,47.396,0
    .goto 469,39.129,53.303,0
    .goto 469,41.419,42.524,0
    >>杀死 |cRXP_ENEMY_Toxic Sludges|r。掠夺他们的 |cRXP_LOOT_Recovered Possessions|r
    .complete 26264,1 --Recovered Possession (6)
    .mob *Toxic Sludge
step
    #label Geysers
    #loop
    .goto 469,40.578,28.021,0 --Grindspark
    .goto 469,40.029,42.015,0
    .goto 469,39.349,46.363,0
    .goto 469,41.328,50.585,0
    .goto 469,40.029,42.015,15,0
    .goto 469,41.629,44.514,15,0
    .goto 469,42.430,45.128,15,0
    .goto 469,39.349,46.363,15,0
    .goto 469,38.657,45.115,15,0
    .goto 469,37.860,46.624,15,0
    .goto 469,36.858,50.094,15,0
    .goto 469,37.386,50.996,15,0
    .goto 469,40.808,52.328,15,0
    .goto 469,41.910,51.865,15,0
    .goto 469,41.328,50.585,15,0
    >>引导你的 |cRXP_FRIENDLY_GS-9x Multi-bot|r 前往绿色水池中的间歇泉
    >>|cRXP_WARN_如果你的 |cRXP_FRIENDLY_GS-9x Multi-bot|r 死了，就回到 |cRXP_FRIENDLY_Engineer Grindspark|r 换一个新的|r
    .complete 26205,1 --Clean up Toxic Geysers (5)
    .skipgossip 42553,1
    .target GS-9x Multi-bot
step
    #optional
    #loop
    .goto 469,38.054,47.396,0
    .goto 469,39.129,53.303,0
    .goto 469,41.419,42.524,0
    .goto 469,38.054,47.396,40,0
    .goto 469,35.840,46.516,40,0
    .goto 469,34.007,48.244,40,0
    .goto 469,34.752,49.411,40,0
    .goto 469,35.620,52.363,40,0
    .goto 469,36.659,52.593,40,0
    .goto 469,39.129,53.303,40,0
    .goto 469,40.837,53.655,40,0
    .goto 469,42.523,50.016,40,0
    .goto 469,40.920,48.049,40,0
    .goto 469,40.209,47.931,40,0
    .goto 469,41.419,42.524,40,0
    >>杀死 |cRXP_ENEMY_Toxic Sludges|r。掠夺他们的 |cRXP_LOOT_Recovered Possessions|r
    .complete 26264,1 --Recovered Possession (6)
    .mob Toxic Sludge
step
    #requires Contamination
    .goto 469,38.201,40.196
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲兹维斯下士|r
    .turnin 26265 >>交任务: |cRXP_FRIENDLY_处理辐射|r
	.target Corporal Fizzwhistle
step
    .goto 469,40.578,28.021
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工程师格林德斯巴克|r
    .turnin 26205 >>交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
	.target Engineer Grindspark
step << Priest
    .goto Dun Morogh,33.898,34.782
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“怪医”克斯宾|r
    .trainer >>训练你的职业法术
	.target "Doc" Cogspin
step << Mage
    .goto Dun Morogh,34.534,35.065
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_贝西·冰雹|r
    .trainer >>训练你的职业法术
	.target Bipsi Frostflinger
step
    .goto 469,39.225,26.552
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_Tock Sprysprocket|r
    .turnin 26264 >>交任务: |cRXP_FRIENDLY_身后物|r
	.target Tock Sprysprocket
step
    .goto 469,38.385,33.488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_崔德·火钻队长|r
    .accept 26316 >>接任务: |cRXP_WARN_杰萨普怎么了？|r << cata
    .accept 26316 >>接任务: |cRXP_WARN_杰萨普怎么了？|r << !tbc !wotlk !cata
	.target Captain Tread Sparknozzle
step << Warrior
    .goto Dun Morogh,34.274,37.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官汽轴|r
    .trainer >>训练你的职业法术
	.target Drill Sergeant Steamcrank
step << Warrior
    #optional
    .goto Dun Morogh,34.274,37.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官汽轴|r
    .accept 26204 >>接任务: |cRXP_WARN_克拉兹克的烹调锅|r
	.target Drill Sergeant Steamcrank
    .itemStat 16,QUALITY,<7
step << Warrior
    #optional
    .isOnQuest 26204
    .goto Dun Morogh,34.53,37.45
    >>|cRXP_WARN_施放|r |T132337:0|t[冲锋] |cRXP_WARN_on the|r |cRXP_ENEMY_Training Dummy|r
    .complete 26204,1 -- Practice Charge (1)
    .mob Training Dummy
    .itemStat 16,QUALITY,<7
step << Warrior
    #optional
    .isQuestComplete 26204
    .goto Dun Morogh,34.274,37.520
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官汽轴|r
    .turnin 26204 >>交任务: |cRXP_FRIENDLY_啊，安多哈尔！|r
	.target Drill Sergeant Steamcrank
    .itemStat 16,QUALITY,<7
step << Warrior
    #optional
    #completewith next
    .equip 16,59039 >>|cRXP_WARN_装备|r |T135275:0|t[超轻军刀]
    .use 59039
    .itemcount 59039,1
    .itemStat 16,QUALITY,<7
step << Warlock
    .goto Dun Morogh,33.246,38.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿拉玛尔·格里姆|r
    .trainer >>训练你的职业法术
	.target Alamar Grimm
step << Rogue
    .goto Dun Morogh,33.376,36.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔希·钢烁|r
    .trainer >>训练你的职业法术
	.target 凯尔西·斯蒂尔斯帕克
step << Rogue
    #optional
    .goto Dun Morogh,33.376,36.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔希·钢烁|r
    .accept 26207 >>接任务: |cRXP_WARN_潜行者的技艺|r
	.target 凯尔西·斯蒂尔斯帕克
    .itemStat 16,QUALITY,<7
step << Rogue
    #optional
    .isOnQuest 26207
    .goto Dun Morogh,34.53,37.45
    >>|cRXP_WARN_施放|r |T136189:0|t[邪恶攻击] |cRXP_WARN_然后|r |T132292:0|t[剔骨] |cRXP_WARN_对|r |cRXP_ENEMY_训练假人|r |cRXP_WARN_3 次|r << Rogue
    .complete 26207,1 -- Practice Eviscerate (1)
    .mob Training Dummy
    .itemStat 16,QUALITY,<7
step << Rogue
    #optional
    .isQuestComplete 26207
    .goto Dun Morogh,33.376,36.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 26207 >>交任务: |cRXP_FRIENDLY_潜行者的技艺|r
	.target 凯尔西·斯蒂尔斯帕克
    .itemStat 16,QUALITY,<7
step << Rogue
    #optional
    #completewith next
    .equip 16,59043 >>|cRXP_WARN_装备|r |T133514:0|t[死星]
    .use 59043
    .itemcount 59043,1
    .itemStat 16,QUALITY,<7
step
    .goto 469,37.283,65.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Jessup McCree|r << cata
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Kharmarn Palegrip|r << !tbc !wotlk !cata
    .turnin 26316 >>交任务: |cRXP_FRIENDLY_杰萨普怎么了？|r << cata
    .turnin 26316 >>交任务: |cRXP_FRIENDLY_杰萨普怎么了？|r << !tbc !wotlk !cata
    .accept 26284 >>接任务: |cRXP_WARN_失踪的士兵|r
    .accept 26285 >>接任务: |cRXP_WARN_把我的炸药还回来！|r
    .target Jessup McCree << cata
    .target Kharmarn Palegrip << !tbc !wotlk !cata
step
    #sticky
    #label PowderKegs
    .goto 469,38.413,67.778,0
    .goto 469,46.960,73.690,0
    .goto 469,42.336,69.559,0
    .waypoint 469,38.413,67.778,40,0
    .waypoint 469,36.284,70.305,40,0
    .waypoint 469,39.268,75.879,40,0
    .waypoint 469,42.366,75.706,40,0
    .waypoint 469,44.629,77.577,40,0
    .waypoint 469,45.326,73.024,40,0
    .waypoint 469,46.960,73.690,40,0
    .waypoint 469,47.296,72.654,40,0
    .waypoint 469,46.734,71.721,40,0
    .waypoint 469,47.119,68.438,40,0
    .waypoint 469,47.163,65.769,40,0
    .waypoint 469,43.581,70.051,40,0
    .waypoint 469,42.336,69.559,40,0
    >>杀死 |cRXP_ENEMY_Rockjaw Bonepickers|r 和 |cRXP_ENEMY_Rockjaw Marauders|r。从他们身上搜刮 |cRXP_LOOT_Stolen Powder Kegs|r
    .complete 26285,1 --Stolen Powder Keg (7)
	.mob Rockjaw Bonepicker
	.mob Rockjaw Marauder
step
    #loop
    .goto 469,36.560,68.469,0
    .goto 469,38.768,74.257,0
    .goto 469,45.803,69.339,0
    .goto 469,36.560,68.469,15,0
    .goto 469,38.134,68.845,15,0
    .goto 469,37.972,72.466,15,0
    .goto 469,38.768,74.257,15,0
    .goto 469,40.738,74.411,15,0
    .goto 469,41.168,69.792,15,0
    .goto 469,42.045,73.682,15,0
    .goto 469,45.032,73.353,15,0
    .goto 469,47.131,73.469,15,0
    .goto 469,47.007,71.031,15,0
    .goto 469,45.803,69.339,15,0
    .goto 469,43.887,70.268,15,0
    >>点击 |cRXP_PICK_临时笼子|r 来营救 |cRXP_FRIENDLY_被捕的爆破手|r
    .complete 26284,1 --Captured Demolitionists rescued (6)
step
    #requires PowderKegs
    .goto 469,37.283,65.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Jessup McCree|r << cata
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Kharmarn Palegrip|r << !tbc !wotlk !cata
    .turnin 26284 >>交任务: |cRXP_FRIENDLY_失踪的士兵|r
    .turnin 26285 >>交任务: |cRXP_FRIENDLY_把我的炸药还回来！|r
    .accept 26318 >>接任务: |cRXP_WARN_致命一击|r
    .target Jessup McCree << cata
    .target Kharmarn Palegrip << !tbc !wotlk !cata
step
	#completewith next
    .goto 470,95.285,56.045,15 >>进入霜鬃要塞洞穴
    .isOnQuest 26318
step
    #completewith Bruggor
    .goto 470,87.857,52.221,15,0
    .goto 470,83.611,44.352,15,0
    .goto 470,74.752,38.437,15,0
    .goto 470,64.507,54.540,15,0
    .goto 470,60.714,72.486,15,0
    .goto 470,45.246,74.390,15,0
    .goto 470,31.866,44.578,45 >>前往 |cRXP_ENEMY_Boss Bruggor|r 内部
    >>|cRXP_WARN_除非你攻击他们，否则你不会激怒正在睡觉的 |cRXP_ENEMY_Rockjaw Fungus-Flingers|r|r
    .noflyable --Azeroth Flying
step
    #completewith Bruggor
    .goto 470,87.857,52.221,15,0
    .goto 470,83.611,44.352,15,0
    .goto 470,74.752,38.437,15,0
    .goto 470,64.507,54.540,15,0
    .goto 470,60.714,72.486,15,0
    .goto 470,45.246,74.390,15,0
    .goto 470,31.866,44.578,45 >>前往 |cRXP_ENEMY_Boss Bruggor|r 内部
    .flyable --Azeroth Flying
step
    #sticky
    #label Detonator
    .goto 470,36.112,40.902,0,0
    >>点击内部地面上的 |cRXP_PICK_Detonator|r
    .complete 26318,1 --Detonate trogg tunnel (1)
step
    #label Bruggor
    .goto 470,21.791,58.700,15,0
    .goto 470,31.866,44.578
    >>杀死里面的 |cRXP_ENEMY_Boss Bruggor|r
    .complete 26318,2 --Boss Bruggor (1)
	.mob Boss Bruggor
step
    #requires Detonator
    #completewith Finishing
    .goto 470,45.246,74.390,15,0
    .goto 470,60.714,72.486,15,0
    .goto 470,64.507,54.540,15,0
    .goto 470,74.752,38.437,15,0
    .goto 470,83.611,44.352,15,0
    .goto 469,33.781,66.184,20 >>离开霜鬃要塞洞穴
    >>|cRXP_WARN_除非你攻击他们，否则你不会激怒正在睡觉的 |cRXP_ENEMY_Rockjaw Fungus-Flingers|r|r
    .noflyable --Azeroth Flying
    .subzoneskip 135,1
step
    #optional
    #requires Detonator
    #completewith Finishing
    .goto 470,45.246,74.390,15,0
    .goto 470,60.714,72.486,15,0
    .goto 470,64.507,54.540,15,0
    .goto 470,74.752,38.437,15,0
    .goto 470,83.611,44.352,15,0
    .goto 469,33.781,66.184,20 >>离开霜鬃要塞洞穴
    .flyable --Azeroth Flying
    .subzoneskip 135,1
step
    #label Finishing
    #requires Detonator
    .goto 469,37.283,65.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Jessup McCree|r << cata
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t讨论 |cRXP_FRIENDLY_Kharmarn Palegrip|r << !tbc !wotlk !cata
    .turnin 26318 >>交任务: |cRXP_FRIENDLY_致命一击|r
    .accept 26329 >>接任务: |cRXP_WARN_还有一件事|r
    .target Jessup McCree << cata
    .target Kharmarn Palegrip << !tbc !wotlk !cata
step
    #completewith next
    .goto 469,36.284,70.305,-1
    .goto 469,47.880,44.670,-1
-- .goto 425,38.29,58.12
    *|cRXP_WARN_Spamming /sit or removing your gear will make you die faster|r
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .skill riding,75,1
--XX NOTE: Dying in gnomer sends you to Chill Breeze
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大工匠梅卡托克|r, |cRXP_FRIENDLY_辛克尔斯·迅击|r
    .turnin 26329 >>交任务: |cRXP_FRIENDLY_还有一件事|r
    .accept 26331 >>接任务: |cRXP_WARN_碎轮的爪牙|r
    .goto 469,38.802,32.715
	.target +大工匠梅卡托格
    .accept 26333 >>接任务: |cRXP_WARN_没坦克！|r
    .goto 469,38.204,33.662
	.target +辛克尔斯快速爆炸
step
    #sticky
    #label Tanks
    #loop
    .goto 469,59.638,21.877,0
    .goto 469,53.711,22.482,0
    .goto 469,58.619,23.568,0
    .waypoint 469,59.638,21.877,15,0
    .waypoint 469,59.620,19.066,15,0
    .waypoint 469,58.784,18.047,15,0
    .waypoint 469,57.507,18.837,15,0
    .waypoint 469,56.560,20.889,15,0
    .waypoint 469,55.463,21.067,15,0
    .waypoint 469,53.711,22.482,15,0
    .waypoint 469,53.126,24.536,15,0
    .waypoint 469,54.080,26.011,15,0
    .waypoint 469,55.407,23.742,15,0
    .waypoint 469,56.513,23.676,15,0
    .waypoint 469,57.585,23.609,15,0
    .waypoint 469,58.619,23.568,15,0
    >>|cRXP_WARN_使用|r |T133710:0|t[科技手榴弹] |cRXP_WARN_on the|r |cRXP_ENEMY_Repaired Mechano-Tanks|r
    .complete 26333,1 --Repaired Mechano-Tanks destroyed (5)
	.mob Repaired Mechano-Tank
    .use 58200
step
    #sticky
    #label CrushcogM
    #loop
    .goto 469,54.018,26.884,0
    .goto 469,60.672,22.216,0
    .goto 469,52.540,24.667,0
    .goto 469,54.018,26.884,45,0
    .goto 469,55.919,26.336,45,0
    .goto 469,57.608,25.933,45,0
    .goto 469,60.002,25.191,45,0
    .goto 469,61.148,25.266,45,0
    .goto 469,60.490,23.847,45,0
    .goto 469,60.672,22.216,45,0
    .goto 469,56.948,18.526,45,0
    .goto 469,56.251,19.440,45,0
    .goto 469,54.541,18.700,45,0
    .goto 469,54.364,20.143,45,0
    .goto 469,52.960,21.320,45,0
    .goto 469,52.540,24.667,45,0
    >>杀死 |cRXP_ENEMY_Crushcog 战斗服|r 和 |cRXP_ENEMY_Irradiated 技师|r
	.complete 26331,1 --Crushcog's Minions killed (8)
	.mob Crushcog Battle Suit
	.mob Irradiated Technician
step
    #optional
    #requires CrushcogM
--XXREQ Placeholder invis step until multiple requires per step
step << skip
    #requires Tanks
    #completewith next
    .goto 469,56.346,21.833,-1
    .goto 469,47.880,44.670,-1
-- .goto 425,38.29,58.12
    *|cRXP_WARN_Spamming /sit or removing your gear will make you die faster|r
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .skill riding,75,1
--XX unlikely to ever be worth
step
    #requires Tanks
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大工匠梅卡托克|r, |cRXP_FRIENDLY_辛克尔斯·迅击|r, |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 26331 >>交任务: |cRXP_FRIENDLY_碎轮的爪牙|r
    .goto 469,38.802,32.715
	.target +大工匠梅卡托格
    .turnin 26333 >>交任务: |cRXP_FRIENDLY_没坦克！|r
    .goto 469,38.204,33.662
	.target +辛克尔斯快速爆炸
    .accept 26339 >>接任务: |cRXP_WARN_烈酒村的准备|r
    .goto 469,38.025,33.570
	.target +凯尔西·斯蒂尔斯帕克
step
    .goto 469,48.744,52.880
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加尔维·影踪|r
    .turnin 26339 >>交任务: |cRXP_FRIENDLY_烈酒村的准备|r
    .accept 26342 >>接任务: |cRXP_WARN_涂成黑色|r
	.target Jarvi Shadowstep
step
    #loop
    .goto 469,52.723,50.681,0
    .goto 469,52.556,44.220,0
    .goto 469,61.154,48.908,0
    .goto 469,52.723,50.681,50,0
    .goto 469,55.901,51.426,50,0
    .goto 469,52.556,44.220,50,0
    .goto 469,54.584,39.961,50,0
    .goto 469,61.154,48.908,50,0
    >>|cRXP_WARN_使用|r |T133037:0|t[Paintinator] |cRXP_WARN_on|r |cRXP_ENEMY_Crushcog Sentry-Bots|r
    .complete 26342,1 --Crushcog's Sentry Bot blinded (5)
	.mob Crushcog Sentry Bot
    .use 58203
step
    #optional
    #questguide
    .goto 469,48.744,52.880
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加尔维·影踪|r
    .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
    .accept 26364 >>接任务: |cRXP_WARN_碎轮的倒台！|r
	.target Jarvi Shadowstep
step
    .goto 469,48.744,52.880
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加尔维·影踪|r
    .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
	.target Jarvi Shadowstep
--XX Start of optional Amberstill Ranch - it sucks but is (probably) better than Airfield
step
    #questguide
    #optional
    #completewith Razlo
    #label Mekkatalk
    .goto 469,57.188,47.535
    .gossipoption 38798 >>对话: |cRXP_FRIENDLY_大工匠梅卡托克|r
    .timer 72,Down with Crushcog! RP
    .target High Tinker Mekkatorque
    .isOnQuest 26364
step
    #questguide
    #optional
    #completewith next
    #requires Mekkatalk
    >>|cRXP_WARN_等待 RP|r
    +|cRXP_WARN_使用|r |T308321:0|t[轨道瞄准装置] |cRXP_WARN_on|r |cRXP_ENEMY_Razlo Crushcog|r |cRXP_WARN_and|r |cRXP_ENEMY_Crushcog 的守护者|r
    .isOnQuest 26364
    .use 58253
step
    #questguide
    #label Razlo
    .goto 469,58.749,42.222
    >>击败 |cRXP_ENEMY_Razlo Crushcog|r
    .complete 26364,2 --Razlo Crushcog defeated (1)
    .use 58253
    .mob Razlo Crushcog
    .mob Crushcog's Guardians
--XX get instakilled on retail, not sure how it plays out for cata
step
    #questguide
    .goto 469,48.744,52.880
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_加尔维·影踪|r
    .turnin 26364 >>交任务: |cRXP_FRIENDLY_碎轮的倒台！|r
    .accept 26373 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Jarvi Shadowstep
step
    .goto 27,49.906,44.980
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_席亚拉·深石|r
    .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Ciara Deepstone
--XX Doable by other races but simpler to do for gnomes only
]])

RXPGuides.RegisterGuide([[

#xprate <1.2
#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 6-7 丹莫罗
#next 6-9 艾尔文森林
#defaultfor Dwarf/Gnome

<< Alliance

--XX 6-9 and 9-10 separated so can combine human guide without maintaining 2x code
step
    #xprate >1.19
    .next
    +-
step << Gnome
    #optional
    #questguide
    .goto 27,53.713,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r
    .accept 25724 >>接任务: |cRXP_WARN_霜鬃的挑衅|r
    .turnin 26373 >>交任务: |cRXP_FRIENDLY_前往卡拉诺斯|r
	.target 萨兰船长
    .isOnQuest 26373
step
    .goto 27,53.713,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r
    .accept 25724 >>接任务: |cRXP_WARN_霜鬃的挑衅|r
	.target 萨兰船长
step
    .goto 27,54.196,51.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷杰德·麦酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
	.target Rejold 大麦啤酒
step
    .goto 27,53.933,50.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
	.target Ragnar Thunderbrew

step
    #optional
    #label Distillery
    #completewith Belm
    .goto 27,54.083,50.335,8,0
    .goto 27,54.277,50.312,8,0
    .goto 27,54.485,50.847,10 >>进入雷酒酿酒厂。前往 |cRXP_FRIENDLY_Innkeeper Belm|r 内部
    .subzoneskip 2102
step << Gnome
    #requires Distillery
    #completewith Belm
    .goto 27,54.485,50.847
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    .turnin 26380,2 >>交任务: |cRXP_FRIENDLY_前往卡拉诺斯|r
	.target Innkeeper Belm
    .isOnQuest 26380
--XX not sure how to do this otherwise


step
    #label Belm
    .goto 27,54.485,50.847
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    >>|cRXP_BUY_从他那里购买 a|r |T132800:0|t[Rhapsody Malt] |cRXP_BUY_|r
    .collect 2894,1,384,1 --Rhapsody Malt (1)
    .home >>将你的炉石设置为雷酒酿酒厂
	.target Innkeeper Belm
    .zoneskip 27,1
step << Warrior
    .goto 27,54.470,50.974
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格兰尼斯·快斧|r
    .trainer >>训练你的职业法术
    .target Granis Swiftaxe
step << Dwarf/Gnome/DarkIronDwarf
    .goto 27,54.723,50.607,8,0
    .goto 27,54.784,50.629,8,0
    .goto 27,54.733,50.815,8,0
    .goto 27,54.733,50.815
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
	.target Gremlock Pilsnor
step << Rogue
    .goto 27,54.673,50.933
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍格拉尔·巴坎|r
    .trainer >>训练你的职业法术
    .target Hogral Bakkan
step << Priest
    .goto 27,54.455,50.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马克萨恩·安沃尔|r
    .trainer >>训练你的职业法术
    .target Maxan Anvol
step << Shaman
    .goto 27,54.605,50.232
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈鲁宾·霜锤|r
    .trainer >>训练你的职业法术
    .target Halbin Frosthammer
step << Mage
    .goto 27,54.609,50.397
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛济斯·石衣|r
    .trainer >>训练你的职业法术
    .target Magis Sparkmantle
step << Paladin
    .goto 27,54.709,50.392
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿扎尔·战锤|r
    .trainer >>训练你的职业法术
    .target Azar Stronghammer
step << Warlock
    .goto 27,54.437,52.022
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉姆瑞兹·黑轮|r
    .trainer >>训练你的职业法术
    .target Gimrizz Shadowcog
step << Hunter
    .goto 27,52.913,51.364
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格瑞夫|r
    .trainer >>训练你的职业法术
    .target Grif Wildheart
step
    .goto 27,53.124,49.995
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨雷克·黑石|r
    .turnin 24493 >>交任务: |cRXP_FRIENDLY_别忘记我们|r
	.target Tharek Blackstone
    .isOnQuest 24493
step
    #completewith next
    .goto 27,53.376,44.252,0
    .goto 27,53.193,42.603,0
    .goto 27,53.376,44.252,60,0
    .goto 27,53.193,42.603,60,0
	>>杀死 |cRXP_ENEMY_Crag Boars|r。掠夺他们的 |cRXP_LOOT_Tender Boar Ribs|r
    .complete 384,1 --Tender Boar Ribs (4)
	.mob Crag Boar
step
    #optional
    #completewith next
    #label Ramp
    .goto 27,51.034,40.862,50 >>沿斜坡向上行驶
    .subzoneskip 802
    .noflyable --Azeroth Flying
    .isOnQuest 25724
step << skip
    #requires Ramp
    #completewith Snowstrider
    .goto 27,49.056,37.135,45 >>|cRXP_WARN_[罕见] 查找 |cRXP_ENEMY_Great Father Arctikus|r。如果他醒了就杀了他|r
	.unitscan Great Father Arctikus
    .isOnQuest 25724
    .noflyable
step
    #sticky
    #requires Ramp
    #label Shimmerweed
    .goto 27,48.955,36.824,0
    .goto 27,48.330,38.486,0
    .goto 27,48.092,42.928,0
    .goto 27,48.773,42.485,0
    .goto 27,48.949,37.202,0
    .waypoint 27,48.955,36.824,15,0
    .waypoint 27,48.331,36.523,15,0
    .waypoint 27,47.734,37.203,15,0
    .waypoint 27,47.704,37.755,15,0
    .waypoint 27,48.330,38.486,15,0
    .waypoint 27,47.699,39.542,15,0
    .waypoint 27,48.504,42.035,15,0
    .waypoint 27,48.371,42.052,15,0
    .waypoint 27,48.092,42.928,15,0
    .waypoint 27,48.283,42.796,15,0
    .waypoint 27,48.316,43.158,15,0
    .waypoint 27,48.805,42.774,15,0
    .waypoint 27,48.773,42.485,15,0
    .waypoint 27,50.247,40.528,15,0
    .waypoint 27,49.153,41.241,15,0
    .waypoint 27,49.220,37.873,15,0
    .waypoint 27,48.949,37.202,15,0
    >>杀死 |cRXP_ENEMY_霜鬃先知s|r。掠夺他们的 |cRXP_LOOT_Shimmerweed|r
    >>打开地面上的 |cRXP_PICK_Shimmerweed Baskets|r。拾取其中的 |cRXP_LOOT_Shimmerweed|r
    .complete 315,1 --Shimmerweed (7)
	.mob 霜鬃先知
step
    #label Snowstrider
    #requires Ramp
    >>杀死 |cRXP_ENEMY_霜鬃雪行者s|r 和 |cRXP_ENEMY_霜鬃先知s|r
    .complete 25724,2 --霜鬃雪行者 slain (7)
    .goto 27,50.507,39.991,0
    .goto 27,49.270,38.306,0
    .goto 27,47.506,39.668,0
    .goto 27,49.717,41.829,0
    .goto 27,50.507,39.991,50,0
    .goto 27,50.697,39.331,50,0
    .goto 27,50.165,38.971,50,0
    .goto 27,50.533,38.088,50,0
    .goto 27,49.270,38.306,50,0
    .goto 27,49.109,37.844,50,0
    .goto 27,48.866,37.838,50,0
    .goto 27,48.852,36.950,50,0
    .goto 27,47.506,39.668,50,0
    .goto 27,48.468,42.612,50,0
    .goto 27,49.264,42.981,50,0
    .goto 27,49.717,41.829,50,0
    .mob +霜鬃雪行者
    .complete 25724,1 --霜鬃先知 slain (5)
    .goto 27,49.142,39.986,0
    .goto 27,48.164,43.105,0
    .goto 27,49.362,37.687,0
    .goto 27,49.142,39.986,50,0
    .goto 27,48.924,39.588,50,0
    .goto 27,48.191,37.582,50,0
    .goto 27,48.544,40.678,50,0
    .goto 27,48.164,43.105,50,0
    .goto 27,48.539,43.228,50,0
    .goto 27,49.027,42.624,50,0
    .goto 27,49.836,37.127,50,0
    .goto 27,49.362,37.687,50,0
	.mob +霜鬃先知
step
    #optional
    #requires Shimmerweed
	#completewith next
    .goto 27,50.495,40.006,70 >>前往营地东侧。在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .noflyable --Azeroth Flying
step
    #requires Shimmerweed
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .noflyable --Azeroth Flying
step << Dwarf/Gnome/DarkIronDwarf
    #requires Shimmerweed
    .goto 27,53.802,52.762
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛兰·风须|r
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
--  .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
--[RARE] .fp Kharanos >>获取卡拉诺斯飞行路线
	.target Brolan Galebeard
--XX re-add 6391 if Airfield added
step
    #requires Shimmerweed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r, |cRXP_FRIENDLY_军需官吉尼亚|r
    .turnin 25724 >>交任务: |cRXP_FRIENDLY_霜鬃的挑衅|r
    .accept 313 >>接任务: |cRXP_WARN_灰色洞穴|r
    .accept 25667 >>接任务: |cRXP_WARN_宰杀雪怪|r
    .goto 27,53.713,52.190
	.target +萨兰船长
    .accept 25668 >>接任务: |cRXP_WARN_被窃的补给品|r
    .goto 27,53.707,52.095
	.target +军需官格林娜
step
    .goto 27,54.196,51.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷杰德·麦酒|r
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
	.target Rejold 大麦啤酒
step
    #optional
    .isQuestComplete 384
    .goto 27,53.933,50.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
	.target Ragnar Thunderbrew
step
    #completewith WendigoCave
    .goto 27,51.697,54.360,0
    .goto 27,50.738,54.065,0
    .goto 27,49.815,53.919,0
    .goto 27,51.697,54.360,60,0
    .goto 27,50.738,54.065,60,0
    .goto 27,49.815,53.919,60,0
	>>杀死 |cRXP_ENEMY_Crag Boars|r。掠夺他们的 |cRXP_LOOT_Tender Boar Ribs|r
    .complete 384,1 --Tender Boar Ribs (4)
	.mob Crag Boar
step
    #sticky
    #label Pilfered
    #loop
    .goto 29,62.330,22.544,0
    .goto 29,70.564,57.907,0
    .goto 29,50.663,47.870,0
    .waypoint 29,62.330,22.544,15,0
    .waypoint 29,58.260,24.711,15,0
    .waypoint 29,57.075,45.882,15,0
    .waypoint 29,70.564,57.907,15,0
    .waypoint 29,69.021,60.488,15,0
    .waypoint 29,60.967,56.171,15,0
    .waypoint 29,56.301,54.391,15,0
    .waypoint 29,50.663,47.870,15,0
    >>掠夺地面上的 |cRXP_LOOT_Pilfered Supplies|r
    .complete 25668,1 --Pilfered Supplies (6)
step
    #completewith WendigoCave
    >>杀死 |cRXP_ENEMY_Young Wendigos|r 和 |cRXP_ENEMY_Wendigos|r
    .complete 25667,1 --Wendigo slain (10)
	.mob Wendigo
	.mob Young Wendigo
step
    #optional
    #label WendigoCave
    .goto 29,61.676,88.466,40 >>进入温迪戈洞穴
	.isOnQuest 25668
step
    #optional
    #sticky
    #label Wendigos
    #loop
    .goto 29,56.228,15.776,0
    .goto 29,69.067,56.919,0
    .goto 29,49.271,52.117,0
    .waypoint 29,56.228,15.776,40,0
    .waypoint 29,61.453,19.391,40,0
    .waypoint 29,65.808,34.242,40,0
    .waypoint 29,60.523,38.069,40,0
    .waypoint 29,69.067,56.919,40,0
    .waypoint 29,51.657,55.467,40,0
    .waypoint 29,49.271,52.117,40,0
    >>杀死里面的|cRXP_ENEMY_Wendigos|r
    .complete 25667,1 --Wendigo slain (10)
	.mob Wendigo
step
    #optional
    #completewith next
    .goto 29,61.083,82.713,20,0
    .goto 29,58.971,77.810,20,0
    .goto 29,53.639,70.746,20,0
    .goto 29,51.947,65.073,20,0
    .goto 29,51.819,48.382,15 >>前往 |cRXP_FRIENDLY_Mountaineer Dunstan|r 内部
    .isOnQuest 313
step
    .goto 29,51.819,48.382
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人东斯坦|r, 他在里面
    .complete 313,1 --Convey orders to Mountaineer Dunstan (1)
	.target Mountaineer Dunstan
    .skipgossip
step
    .goto 29,60.272,56.211
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人雷文|r, 他在里面
    .complete 313,2 --Convey orders to Mountaineer Lewin (1)
	.target Mountaineer Lewin
    .skipgossip
step
    .goto 29,61.511,22.248
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巡山人沃格姆|r, 他在里面
    .complete 313,3 --Convey orders to Mountaineer Valgrum (1)
	.target Mountaineer Valgrum
    .skipgossip
--XX not doing Edan/Chest check due to deathskip location
step
    #optional
    #requires Pilfered
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires Wendigos
    #completewith Afar
    >>|cRXP_WARN_确保你死在 |cRXP_FRIENDLY_Mountaineer Valgrum|r 所在位置东/东南方向|r
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 313
    .subzoneskip 131
step
    #requires Wendigos
    #label Afar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r, |cRXP_FRIENDLY_军需官吉尼亚|r
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .turnin 25667 >>交任务: |cRXP_FRIENDLY_宰杀雪怪|r
    .goto 27,53.713,52.190
	.target +萨兰船长
    .turnin 25668 >>交任务: |cRXP_FRIENDLY_被窃的补给品|r
    .goto 27,53.707,52.095
	.target +军需官格林娜
step
    .goto 27,53.933,50.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
	.target Ragnar Thunderbrew
]])

RXPGuides.RegisterGuide([[

#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 7-9 丹莫罗
#next 9-11 丹莫罗
#defaultfor None
<<Alliance
step
    .goto 27,54.196,51.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷杰德·麦酒|r
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
	.target Rejold 大麦啤酒
step
    .goto 27,53.933,50.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
	.target Ragnar Thunderbrew
step
    #requires Wendigos
    #label Afar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r, |cRXP_FRIENDLY_军需官吉尼亚|r
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .turnin 25667 >>交任务: |cRXP_FRIENDLY_宰杀雪怪|r
    .accept 25792 >>接任务: |cRXP_WARN_推进|r
    .goto 27,53.713,52.190
	.target +萨兰船长
    .turnin 25668 >>交任务: |cRXP_FRIENDLY_被窃的补给品|r
    .goto 27,53.707,52.095
	.target +军需官格林娜
step
    .goto 27,53.262,51.917
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉兹·滑链|r
    .accept 412 >>接任务: |cRXP_LOOT_自动净化装置|r
	.target Razzle Sprysprocket
step
    #completewith Gears
    .goto 27,55.315,56.087,0
    .goto 27,55.156,54.313,60,0
    .goto 27,55.315,56.087,60,0
	>>杀死 |cRXP_ENEMY_Crag Boars|r。掠夺他们的 |cRXP_LOOT_Tender Boar Ribs|r
    .complete 384,1 --Tender Boar Ribs (4)
	.mob Crag Boar
step << skip
    #completewith Gears
    .goto 27,57.252,57.622,40,0
    .goto 27,60.260,57.034,15 >>|cRXP_WARN_[Chest] 留意 Frostmane Front 的 |cRXP_PICK_Chest|r。如果在上方，则将其拾取|r
step
    #sticky
    #label Gears
    .goto 27,61.927,55.860,0
    .goto 27,60.305,57.134,0
    .goto 27,56.337,56.955,0
    .waypoint 27,61.927,55.860,45,0
    .waypoint 27,61.571,55.817,45,0
    .waypoint 27,60.806,56.782,45,0
    .waypoint 27,60.460,56.838,45,0
    .waypoint 27,60.305,57.134,45,0
    .waypoint 27,59.977,57.500,45,0
    .waypoint 27,57.341,57.547,45,0
    .waypoint 27,56.923,57.456,45,0
    .waypoint 27,56.337,56.955,45,0
    >>杀死 |cRXP_ENEMY_Frostmane Scavengers|r。掠夺他们的 |cRXP_LOOT_Gyromechanic Gears|r
    .complete 412,1 --Gyromechanic Gear (8)
	.mob Frostmane Scavenger
step
    #label Totems
    #loop
    .goto 27,56.705,56.430,0
    .goto 27,59.034,57.689,0
    .goto 27,57.648,58.825,0
    .goto 27,55.958,61.442,0
    .goto 27,56.705,56.430,20,0
    .goto 27,57.576,56.626,20,0
    .goto 27,58.403,56.723,20,0
    .goto 27,59.099,57.035,20,0
    .goto 27,59.034,57.689,20,0
    .goto 27,58.631,58.074,20,0
    .goto 27,58.186,57.427,20,0
    .goto 27,57.724,57.788,20,0
    .goto 27,57.648,58.825,20,0
    .goto 27,57.134,59.461,20,0
    .goto 27,56.937,60.250,20,0
    .goto 27,56.701,61.013,20,0
    .goto 27,55.958,61.442,20,0
    >>对 |cRXP_ENEMY_Constriction Totems|r 使用 |T134424:0|t[火焰符文]
    .complete 25792,1 --Constriction Totems burned (4)
    .use 56009
    .mob Constriction Totem
step
    #requires Gears
    .goto 27,55.315,56.087,0
    .goto 27,54.940,57.752,0
    .goto 27,53.276,57.839,0
    .goto 27,55.315,56.087,60,0
    .goto 27,55.156,54.313,60,0
    .goto 27,56.204,52.928,60,0
    .goto 27,54.940,57.752,60,0
    .goto 27,55.073,58.728,60,0
    .goto 27,54.442,59.686,60,0
    .goto 27,53.235,60.000,60,0
    .goto 27,53.276,57.839,60,0
	>>杀死 |cRXP_ENEMY_Crag Boars|r。掠夺他们的 |cRXP_LOOT_Tender Boar Ribs|r
    .complete 384,1 --Tender Boar Ribs (4)
	.mob Crag Boar
step
    #sticky
    #label Pushing
    .goto 27,53.713,52.190,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r
    .turnin 25792 >>交任务: |cRXP_FRIENDLY_推进|r
    .accept 25838 >>接任务: |cRXP_WARN_来自钢架补给站的帮手|r
	.target 萨兰船长
--XX not sure if you need to turnin 412 to accept
step
    .goto 27,53.262,51.917
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉兹·滑链|r
    .turnin 412 >>交任务: |cRXP_FRIENDLY_自动净化装置|r
	.target Razzle Sprysprocket
step
    #requires Pushing
    .goto 27,54.196,51.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷杰德·麦酒|r
    .turnin 315 >>交任务: |cRXP_FRIENDLY_完美烈酒|r
	.target Rejold 大麦啤酒
step
    .goto 27,53.933,50.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉格纳·雷酒|r
    .turnin 384 >>交任务: |cRXP_FRIENDLY_啤酒烤猪排|r
	.target Ragnar Thunderbrew
step
    #completewith next
    .goto 27,53.941,50.053,15,0
    .goto 27,56.823,47.107,15 >>前往 |cRXP_FRIENDLY_Delber Cranktoggle|r
    .noflyable
step
    .goto 27,56.823,47.107
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戴博·曲针|r
    .turnin 25838 >>交任务: |cRXP_FRIENDLY_来自钢架补给站的帮手|r
    .accept 25839 >>接任务: |cRXP_WARN_超安全单兵发射器|r
	.target Delber Cranktoggle
step
    #completewith next
    .goto 27,56.725,46.583,-1
    .goto 27,56.758,46.518,-1
    .vehicle >>进入|cRXP_PICK_Ultrasafe 人员发射器|r
    .timer 18.5,The Ultrasafe Personnel Launcher RP
    .isOnQuest 25839
    .noflyable
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯拉姆·摇轮|r, |cRXP_FRIENDLY_尖刀斯尼威克|r
    .turnin 25839 >>交任务: |cRXP_FRIENDLY_超安全单兵发射器|r
    .accept 25840 >>接任务: |cRXP_WARN_消灭抵抗|r
    .accept 25841 >>接任务: |cRXP_WARN_从天而降|r
    .goto 27,62.505,53.708
	.target +斯兰普·沃布尔科格
    .accept 28868 >>接任务: |cRXP_WARN_仰视|r
    .goto 27,62.546,53.807
	.target +刀锋者斯内维克
step
    #sticky
    #label Builders
    .goto 27,63.237,57.685,0
    .goto 27,62.461,55.569,0
    .goto 27,60.230,56.060,0
    .goto 27,64.303,54.222,0
    .goto 27,64.240,56.533,0
    .waypoint 27,63.237,57.685,20,0
    .waypoint 27,62.898,57.772,20,0
    .waypoint 27,62.360,57.619,20,0
    .waypoint 27,62.169,56.801,20,0
    .waypoint 27,62.461,55.569,20,0
    .waypoint 27,62.860,55.116,20,0
    .waypoint 27,63.454,54.870,20,0
    .waypoint 27,61.662,54.594,20,0
    .waypoint 27,60.908,54.935,20,0
    .waypoint 27,60.693,55.826,20,0
    .waypoint 27,60.230,56.060,20,0
    >>在 |cRXP_ENEMY_Frostmane Builders|r 上使用 |T133015:0|t[Viewpoint Equalizer]
    .complete 28868,1 --Frostmane Builders shrunk (5)
    .mob Frostmane Builder
    .use 67249
step
    #sticky
    #label Warriors
    .goto 27,62.959,56.486,0
    .goto 27,63.017,54.746,0
    .goto 27,64.023,56.068,0
    .waypoint 27,62.959,56.486,50,0
    .waypoint 27,62.214,56.630,50,0
    .waypoint 27,62.049,56.284,50,0
    .waypoint 27,62.154,54.625,50,0
    .waypoint 27,63.017,54.746,50,0
    .waypoint 27,63.875,54.960,50,0
    .waypoint 27,64.243,54.643,50,0
    .waypoint 27,64.023,56.068,50,0
	>>杀死 |cRXP_ENEMY_Frostmane 战士|r
    .complete 25840,2 --Frostmane Warrior slain (5)
	.mob Frostmane Warrior
step << skip
    #sticky
    #label FrostmaneChest1
    .goto 27,64.706,54.003,20 >>|cRXP_WARN_[宝箱] 检查小屋楼梯附近的 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .isOnQuest 25841
step
    .goto 27,64.487,54.103
    >>在北方营地使用|T133033:0|t[信号弹]
    .complete 25841,1 --Attack on Northern Frostmane Retreat (1)
    .use 56048
step
    #requires FrostmaneChest1
    .goto 27,63.780,55.735
    >>杀死 |cRXP_ENEMY_狂战士巴托克|r
    .complete 25840,1 --Battok the Berserker slain (1)
    .mob Battok the Berserker
step << skip
    #completewith next
    .goto 27,63.550,56.118,20 >>|cRXP_WARN_[宝箱] 检查鼓附近的 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .isOnQuest 25841
step
    #requires FrostmaneChest2
    .goto 27,63.191,57.128
    >>在南方营地使用|T133033:0|t[信号弹]
    .complete 25841,2 --Attack on Southern Frostmane Retreat (1)
    .use 56048
step
    #optional
    #requires Builders
--XXREQ Placeholder invis step until multiple requires per step
step
    #questguide
    #optional
    #requires Warriors
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尖刀斯尼威克|r, |cRXP_FRIENDLY_斯拉姆·摇轮|r
    .turnin 28868 >>交任务: |cRXP_FRIENDLY_仰视|r
    .goto 27,62.546,53.807
	.target +刀锋者斯内维克
    .turnin 25840 >>交任务: |cRXP_FRIENDLY_消灭抵抗|r
    .turnin 25841 >>交任务: |cRXP_FRIENDLY_从天而降|r
    .accept 25882 >>接任务: |cRXP_WARN_支援农场|r
    .goto 27,62.505,53.708
	.target +斯兰普·沃布尔科格
step
    #requires Warriors
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尖刀斯尼威克|r, |cRXP_FRIENDLY_斯拉姆·摇轮|r
    .turnin 28868 >>交任务: |cRXP_FRIENDLY_仰视|r
    .goto 27,62.546,53.807
	.target +刀锋者斯内维克
    .turnin 25840 >>交任务: |cRXP_FRIENDLY_消灭抵抗|r
    .turnin 25841 >>交任务: |cRXP_FRIENDLY_从天而降|r
    .goto 27,62.505,53.708
	.target +斯兰普·沃布尔科格
step
    #questguide
    .goto 27,70.410,48.918
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_火锤中士|r
    .turnin 25882 >>交任务: |cRXP_FRIENDLY_支援农场|r
    .accept 25932 >>接任务: |cRXP_WARN_每天晚上都来袭|r
    .timer 49.5,It's Raid Night Every Night RP
    .target 弗林萨默中士
step
    #questguide
    >>|cRXP_WARN_等待 RP|r
    >>杀死|cRXP_ENEMY_Frostmane Raiders|r
    .complete 25932,1 --Defend Amberstill Ranch (1)
    .mob Frostmane Raider
step
    #questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_火锤中士|r, |cRXP_FRIENDLY_维隆·冻石|r
    .turnin 25932 >>交任务: |cRXP_FRIENDLY_每天晚上都来袭|r
    .goto 27,70.410,48.918
    .target +弗林萨默中士
    .accept 25905 >>接任务: |cRXP_WARN_山羊大潜逃|r
    .goto 27,70.643,48.947,5,0
    .goto 27,70.667,48.872
    .target +维隆·安伯斯蒂尔
step
    #questguide
    .goto 27,70.280,48.160
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁德拉·冻石|r
    .accept 314 >>接任务: |cRXP_LOOT_保护牲畜|r
    .target Rudra Amberstill
step
    #questguide
    #completewith next
    .goto 27,69.406,48.810,15,0
    .goto 27,69.652,47.319,45 >>沿着山上的捷径前往 |cRXP_ENEMY_Vagash|r
    .noflyable
step
    #questguide
    .goto 27,69.652,47.319
    >>杀死 |cRXP_ENEMY_Vagash|r。从他身上搜刮 |cRXP_LOOT_Fang of Vagash|r
    .complete 314,1 --Fang of Vagash (1)
    .mob Vagash
step
    #questguide
    .goto 27,70.280,48.160
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_鲁德拉·冻石|r
    .turnin 314 >>交任务: |cRXP_FRIENDLY_保护牲畜|r
    .target Rudra Amberstill
step
    #questguide
    .goto 27,70.897,54.543,0
    .goto 27,69.536,57.132,0
    .goto 27,70.494,55.638,0
    .goto 27,70.897,54.543,50,0
    .goto 27,70.103,54.570,50,0
    .goto 27,69.532,54.826,50,0
    .goto 27,69.459,56.016,50,0
    .goto 27,69.536,57.132,50,0
    .goto 27,69.669,58.206,50,0
    .goto 27,70.946,58.959,50,0
    .goto 27,70.401,57.412,50,0
    .goto 27,70.494,55.638,50,0
    >>点击 |cRXP_FRIENDLY_Stolen Rams|r 吹口哨将它们送回 Amberstill 以将其取回
    .complete 25905,1 --Stolen Rams recovered (6)
    .emote WHISTLE,41539
step
    #questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维隆·冻石|r, |cRXP_FRIENDLY_火锤中士|r
    .turnin 25905 >>交任务: |cRXP_FRIENDLY_山羊大潜逃|r
    .goto 27,70.643,48.947,5,0
    .goto 27,70.667,48.872
    .target +维隆·安伯斯蒂尔
    .accept 25933 >>接任务: |cRXP_WARN_支援采石场|r
    .goto 27,70.410,48.918
    .target +弗林萨默中士
]])

RXPGuides.RegisterGuide([[

#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 9-11 丹莫罗
#displayname 9-10 Dun Morogh
#next 10-20 洛克莫丹
#defaultfor Dwarf/Gnome/Human

<< Alliance

step << Human
    #completewith next
    #label FlySW
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fly Gol'Bolar Quarry >>飞往戈尔博拉采石场
	.target Bartlett the Brave
    .zoneskip Dun Morogh

step
    .goto 27,75.899,54.312
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .accept 433 >>接任务: |cRXP_LOOT_公众之仆|r
    .target 参议员梅尔·斯通哈洛
step
    .goto 27,76.187,53.043
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勘查员德鲁甘|r
    .accept 25937 >>接任务: |cRXP_WARN_无价之宝|r
    .target Prospector Drugan
step
    #optional
    .goto 27,76.314,54.672
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .turnin 25933 >>交任务: |cRXP_FRIENDLY_支援采石场|r
    .target 工头石眉
    .isOnQuest 25933
step
    .goto 27,76.314,54.672
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头乔尼·石眉|r
    .accept 432 >>接任务: |cRXP_LOOT_该死的石腭怪！|r
    .target 工头石眉
step
    #optional
    #completewith next
    .goto 31,47.46,91.03,20 >>进入 Gol'Bolar 采石场
    .isOnQuest 432
--XX No subzone ID for the mine (returns error)
step
    #sticky
    #label Bonesnappers
    #loop
    .goto 31,34.187,78.128,0
    .goto 31,40.856,80.145,0
    .goto 31,36.930,44.837,0
    .goto 31,52.851,20.234,0
    .goto 31,66.155,59.716,0
    .waypoint 31,33.77,82.69,25,0
    .waypoint 31,46.60,81.48,25,0
    .waypoint 31,38.77,64.92,20,0
    .waypoint 31,32.17,43.58,25,0
    .waypoint 31,48.90,36.81,25,0
    .waypoint 31,50.56,22.97,25,0
    .waypoint 31,54.33,10.09,35,0
    .waypoint 31,67.03,60.11,35,0
    .waypoint 31,48.90,36.81,25,0
    .waypoint 31,38.77,64.92,20,0
    >>杀死里面的 |cRXP_ENEMY_Rockjaw Skullthumpers|r 和 |cRXP_ENEMY_岩颚骨撕咬者s|r
    >>拾取地面上的 |cRXP_PICK_Frozen Artifacts|r
    .complete 432,1 --Rockjaw Skullthumper (8)
    .disablecheckbox
    .complete 432,2 --岩颚骨撕咬者 (8)
    .mob +岩颚骨撕咬者
    .complete 25937,1,6 --Frozen Artifact (6/8)
    .mob *Rockjaw Skullthumper
--XX No good way to tie Skullthumper to an objective in this scenario
step
    #loop
    .goto 31,34.187,78.128,0
    .goto 31,40.856,80.145,0
    .goto 31,36.930,44.837,0
    .goto 31,52.851,20.234,0
    .goto 31,66.155,59.716,0
    .goto 31,33.77,82.69,25,0
    .goto 31,46.60,81.48,25,0
    .goto 31,38.77,64.92,20,0
    .goto 31,32.17,43.58,25,0
    .goto 31,48.90,36.81,25,0
    .goto 31,50.56,22.97,25,0
    .goto 31,54.33,10.09,35,0
    .goto 31,67.03,60.11,35,0
    .goto 31,48.90,36.81,25,0
    .goto 31,38.77,64.92,20,0
    >>对里面的 |cRXP_FRIENDLY_Trapped Miners|r 使用 |T134423:0|t[Runes of Return]
    .complete 433,1 --Trapped Miners rescued (7)
    .use 56222
    .target Trapped Miner
step
    #optional
    #requires Bonesnappers
    .goto 27,77.84,55.24,20 >>离开戈尔博拉采石场
    .isOnQuest 432
step
    #sticky
    #label Artifacts
    .goto 27,77.48,56.88,0
    .goto 27,77.37,55.11,40,0
    .goto 27,76.66,55.77,40,0
    .goto 27,74.80,56.88,40,0
    .goto 27,74.19,58.06,40,0
    .goto 27,75.12,58.43,40,0
    .goto 27,76.55,57.47,40,0
    .goto 27,77.74,57.90,40,0
    .goto 27,78.35,56.30,40,0
    >>拾取地面上的 |cRXP_PICK_Frozen Artifacts|r
    .complete 25937,1 --Frozen Artifact (8)
step
    #loop
    .goto 27,77.48,56.88,0
    .goto 27,77.37,55.11,40,0
    .goto 27,76.66,55.77,40,0
    .goto 27,74.80,56.88,40,0
    .goto 27,74.19,58.06,40,0
    .goto 27,75.12,58.43,40,0
    .goto 27,76.55,57.47,40,0
    .goto 27,77.74,57.90,40,0
    .goto 27,78.35,56.30,40,0
    >>杀死外面的 |cRXP_ENEMY_Rockjaw Skullthumpers|r
    .complete 432,1 --Rockjaw Skullthumper (8)
    .mob Rockjaw Skullthumper
step
    #requires Artifacts
    .goto 27,76.314,54.672
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头乔尼·石眉|r
    .turnin 432 >>交任务: |cRXP_FRIENDLY_该死的石腭怪！|r
    .target 工头石眉
step
    #questguide
    .goto 27,75.899,54.312
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    --.accept 25986 >>接任务: |cRXP_WARN_盔枕湖的麻烦|r
    --trouble at the lake require all 3 quest to be turned, not worth the run back
    .target 参议员梅尔·斯通哈洛
--XX Breadcrumb unlocks after completing all 3 quests, not worth the xp of running 60 extra yards
step
    .goto 27,75.899,54.312
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_参议员梅尔·圣石|r
    .turnin 433 >>交任务: |cRXP_FRIENDLY_公众之仆|r
    .target 参议员梅尔·斯通哈洛
--XX non-questguide needed
step
    .goto 27,76.187,53.043
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勘查员德鲁甘|r
    .turnin 25937 >>交任务: |cRXP_FRIENDLY_无价之宝|r
    .target Prospector Drugan
step
    #questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格恩·焦羽|r, |cRXP_FRIENDLY_巴鲁姆中士|r
    .accept 25979 >>接任务: |cRXP_WARN_情绪澎湃|r
    .goto 27,82.642,48.295
    .target +库尔贡·火羽者
    .turnin -25986 >>交任务: |cRXP_FRIENDLY_盔枕湖的麻烦|r
    .accept 25978 >>接任务: |cRXP_WARN_冰中之棺|r
    .goto 27,82.854,48.409
    .target +巴鲁姆中士
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格恩·焦羽|r, |cRXP_FRIENDLY_巴鲁姆中士|r
    .accept 25979 >>接任务: |cRXP_WARN_情绪澎湃|r
    .goto 27,82.642,48.295
    .target +库尔贡·火羽者
    .accept 25978 >>接任务: |cRXP_WARN_冰中之棺|r
    .goto 27,82.854,48.409
    .target +巴鲁姆中士
--XX non-questguide needed
step
    #loop
    .goto 27,82.139,52.619,0
    .goto 27,82.996,53.473,0
    .goto 27,85.594,54.978,0
    .goto 27,85.545,51.344,0
    .goto 27,83.967,49.804,0
    .goto 27,83.062,49.742,30,0
    .goto 27,82.139,52.619,30,0
    .goto 27,82.996,53.469,30,0
    .goto 27,82.996,53.473,30,0
    .goto 27,84.364,55.220,30,0
    .goto 27,85.594,54.978,30,0
    .goto 27,85.172,52.836,30,0
    .goto 27,85.545,51.344,30,0
    .goto 27,84.985,49.687,30,0
    .goto 27,83.967,49.804,30,0
    >>杀死 |cRXP_ENEMY_Helm 的床位调整器s|r
    >>摧毁 |cRXP_ENEMY_Icy Tombs|r 以释放 |cRXP_FRIENDLY_Frozen Mountaineers|r
    .complete 25979,1 --Helm 的床位调整器 (6)
    .mob +Helm 的床位调整器
    .complete 25978,1 --Frozen Mountaineers freed (6)
    .mob +Icy Tomb
step
#xprate >1.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格恩·焦羽|r
    .turnin 25979 >>交任务: |cRXP_FRIENDLY_情绪澎湃|r
    .goto 27,82.642,48.295
    .target +库尔贡·火羽者
    .turnin 25978 >>交任务: |cRXP_FRIENDLY_冰中之棺|r
    .goto 27,82.854,48.409
    .target +巴鲁姆中士
step
#xprate <1.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格恩·焦羽|r
    .turnin 25979 >>交任务: |cRXP_FRIENDLY_情绪澎湃|r
    .goto 27,82.642,48.295
    .target +库尔贡·火羽者
    .turnin 25978 >>交任务: |cRXP_FRIENDLY_冰中之棺|r
    .accept 25997 >>接任务: |cRXP_WARN_黑铁的阴谋|r
    .goto 27,82.854,48.409
    .target +巴鲁姆中士
step
#xprate <1.2
    #sticky
    #label Spies
    #loop
    .goto 27,84.507,58.595,0
    .waypoint 27,84.412,60.513,50,0
    .waypoint 27,83.302,59.242,50,0
    .waypoint 27,83.728,57.545,50,0
    .waypoint 27,84.528,57.093,50,0
    .waypoint 27,85.580,57.504,50,0
    .waypoint 27,85.254,60.177,50,0
    >>杀死 |cRXP_ENEMY_黑铁间谍|r
    .complete 25997,1 --Dark Iron Spy (5)
    .mob *Dark Iron Spy
step
#xprate <1.2
    #optional
    #completewith Beld
    .goto 27,85.20,60.62,10,0
    .goto 27,85.19,60.98,8 >>进入铁环大院
    .isOnQuest 25997
step
#xprate <1.2
    #label Beld
    .goto 27,85.172,60.614
    >>杀死位于底层的 Ironband 大院内的 |cRXP_ENEMY_Captain Beld|r。从他身上搜刮 |cRXP_LOOT_Dark Iron Attack Plans|r
    .complete 25997,2 --Dark Iron Attack Plans (1)
    .mob Captain Beld
step
#xprate <1.2
    #requires Spies
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
#xprate <1.2
    #requires Spies
    .goto 27,82.854,48.409
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴鲁姆中士|r
    .turnin 25997 >>交任务: |cRXP_FRIENDLY_黑铁的阴谋|r
    --.accept 25998 >>接任务: |cRXP_WARN_前往机场|r << !Human
    .target 巴鲁姆中士

step
    #optional
    #completewith next
    .goto 27,87.534,48.059,20,0
    .goto 27,88.331,47.792,12,0
    .goto 27,88.873,48.312,12,0
    .goto 48,12.138,54.947,20,0
    .goto 48,14.025,56.641,12 >>|cRXP_WARN_爬上山，然后小心地向|r |cRXP_FRIENDLY_Pilot Hammerfoot 下降|r
    .noflyable
step
    .goto 48,14.006,56.485
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .accept 26854 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
    .target Pilot Hammerfoot
step
    #optional
    #completewith next
    .goto 48,12.639,58.419,20,0
    .goto 27,89.543,51.716,20,0
    >>前往地面上的 |cRXP_PICK_A 矮人尸体|r
    .noflyable
step
    .goto 27,87.633,50.139
    >>点击地面上的 |cRXP_PICK_A 矮人尸体|r
    >>|cRXP_WARN_这会让 |cRXP_ENEMY_Mangeclaw|r 开始向你跑来|r
    .turnin 26854 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 26855 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step
    .goto 27,87.421,50.013,0
    .goto 27,87.357,49.213
    >>杀死 |cRXP_ENEMY_Mangeclaw|r。掠夺他的 |cRXP_LOOT_Mangy Claw|r
    .complete 26855,1 --Mangy Claw (1)
    .unitscan Mangeclaw
step
    .goto 48,14.006,56.485
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驾驶员塞克·锤足|r
    .turnin 26855 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
    .accept 13635 >>接任务: |cRXP_WARN_南门进度报告|r
    .target Pilot Hammerfoot
step
    .goto 48,16.385,58.564,30,0
    .goto 48,19.511,62.766,30,0
    .goto 48,21.097,64.989,30 >>穿过南门隘口前往洛克莫丹
    .noflyable
    .isOnQuest 26855
step << skip
    .hs >>炉石 至 |cFFfa9602雷酒酿酒厂|r
step << skip
    #completewith next
    .goto 27,53.80,52.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛兰·风须|r
    .fly Ironforge >>飞往铁炉堡
	.target Brolan Galebeard
step << skip
    #optional
    #completewith Gryth
    .goto 87,55.876,38.146,15,0
    .goto 87,51.865,30.064,15,0
    .goto 87,49.712,28.525,8,0
	.goto 87,51.54,26.30,6 >>前往 |cRXP_FRIENDLY_Golnir Bouldertoe|r
    .noflyable --Azeroth Flying
step << skip
    #completewith next
    .goto 87,49.712,28.525,8,0
	.goto 87,51.54,26.30,6 >>前往 |cRXP_FRIENDLY_Golnir Bouldertoe|r
    .flyable --Azeroth Flying
step << skip
    #label Gryth
    .goto 87,51.521,26.310
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尼尔·石趾|r
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
	.target Golnir Bouldertoe
step << skip
    .goto 87,55.508,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
	.target Gryth Thurden
step << skip
    #completewith next
    .goto 87,57.97,34.68,15,0
    .goto 87,62.84,29.74,20,0
    .goto 87,69.95,33.94,10,0
    .goto 87,71.37,45.83,15,0
    .goto 87,76.7,51.3,10,0
    .goto 499,66.61,34.72,250,0
    .goto 499,42.46,13.03
    .zone 84 >>乘坐深奔线电车|cFFfa9602前往暴风城。|r
    >>|cRXP_WARN_您可能需要等待火车到达车站。|r
--TODO: this might not work on the cata client, also add deeprun tram quest if possible (not available on retail)
--XX Needs XP check: Should go straight to Loch if 12+? 并忽略艾尔文
step << skip
    .goto Stormwind City,63.07,71.46
    >>点击 |cRXP_PICK_Hero 的召唤板|r
    .accept 28562 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
--XX Better to get the alternative quest from Elwynn (26378)
step << skip
    #completewith next
    .goto 84,68.50,73.43,10,0
    .goto 84,68.54,74.89,10,0
    .goto 84,70.94,72.47,10 >>前往 |cRXP_FRIENDLY_Dungar Longdrink|r
    .skill riding,75,1
step << skip
    #completewith next
    .goto 84,70.94,72.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Goldshire >>飞往闪金郡
	.target Dungar Longdrink
    .zoneskip 37 --Elwynn Forest
--XX Elwynn Non-human route: Copy retail elwynn (Fargo->Hogger->WF start->HS/Fly Goldshire->Eastvale->HS/Fly Loch/Fly Redridge?)
step << skip
    .goto 37,42.11,65.93
    .zone 37 >>前往: |cRXP_PICK_艾尔文森林|r
    .isQuestAvailable 62 --The Fargodeep Mine
]])
