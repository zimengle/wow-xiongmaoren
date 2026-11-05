RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 11) 登陆
#displayname 第 2 章 - 登陆开场
#title 登陆
#next 5) 卡桑琅丛林 1
step
.isOnQuest 29940
.goto 418,76.65,5.18 >>|cRXP_WARN_跟随箭头指引|r
step
#completewith Meet the Scout
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step << Alliance
.isQuestComplete 80446
.goto 393,75.04,45.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step << Alliance
.isQuestComplete 80447
.goto 393,76.55,48.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step << Alliance
#completewith Meet the Scout
.goto 393,67.15,43.64,10,0
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step << Alliance
.isQuestComplete 80448
.goto 393,64.6,42.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step << Alliance
#label Meet the Scout
.goto 390,84.00,58.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r交谈
.accept 32246 >>接任务: |cRXP_WARN_寻找斥候|r
.target 丽娅拉
step << Horde
.isQuestComplete 80447
.goto 391,21.13,40.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step << Horde
.isQuestComplete 80446
.goto 391,28.56,30.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step << Horde
#completewith Meet the Scout
.goto 391,30.05,40.79,10,0
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step << Horde
.isQuestComplete 80448
.goto 391,32.98,54.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step << Horde
#completewith Meet the Scout
.goto 390,59.14,17.93,10 >>离开建筑
step << Horde
#label Meet the Scout
.goto 390,62.8,28.0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.accept 32249 >>接任务: |cRXP_WARN_寻找斥候|r
.target 烈日行者德兹科
step
#completewith next
.aura -449510
.cast 449508 >>使用 |T134488:0|t[诺斯特温的返程服务] 返回卡桑琅丛林
.use 449508
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 1) 驭龙飞行
step << Alliance
.goto 371,45.8,84.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莫拉塔里|r
.target Moratari
.accept 80012 >>接任务: |cRXP_WARN_驭龙术|r
step << Alliance
.goto 371,45.81,84.7
>>点击 |cRXP_PICK_传送门|r
.complete 80012,1 
.complete 80012,3 
.disablecheckbox
step << Alliance
.goto 371,65.25,37.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩拉塔里·安德斯特拉兹领主|r 交谈
.complete 80012,4 
.target 劳尔d Andestrasz
step << Horde
.goto 371,45.79,84.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莫拉塔里|r
.target Moratari
.accept 80012 >>接任务: |cRXP_WARN_驭龙术|r
step << Horde
.goto 371,45.84,84.73
>>点击 |cRXP_PICK_传送门|r
.complete 80012,1 
.complete 80012,3 
.disablecheckbox
step << Horde
.goto 371,65.25,37.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.complete 80012,4 
.target 劳尔d Andestrasz
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.turnin 80012 >>交任务: |cRXP_FRIENDLY_驭龙术|r
.target 劳尔d Andestrasz
.accept 80013 >>接任务: |cRXP_WARN_驭滑翔术|r
step
#completewith How to Glide with Your Dragon
.goto 371,65.25,37.20,30,0
.cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
.itemcount 216712,1
.use 216712
step
#completewith How to Glide with Your Dragon
>>使用驭龙坐骑
.complete 80013,1 
step
#label How to Glide with Your Dragon
.goto 371,65.37,37.27
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,2,1 
step
.goto 371,66.55,37.05
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,2,2 
step
.goto 371,67.45,36.12
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,2,3 
step
.goto 371,67.57,34.72
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,2,4 
step
.goto 371,67.32,33.95
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,2,5 
step
.goto 371,66.8,33.41
>>|cRXP_WARN_跟随箭头指引|r
.complete 80013,3 
step
.goto 371,66.75,33.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞洛姆|r交谈
.turnin 80013 >>交任务: |cRXP_FRIENDLY_驭滑翔术|r
.timer 2,RP
.target 谢尔ormu
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.accept 80015 >>接任务: |cRXP_WARN_驭龙俯冲术|r
.target 劳尔d Andestrasz
step
#completewith How to Dive with Your Dragon
>>使用驭龙坐骑
.complete 80015,1 
step
#label How to Dive with Your Dragon
.goto 371,65.37,37.27
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,1 
step
.goto 371,66.59,37.19
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,2 
step
.goto 371,67.92,37.28
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,3 
step
.goto 371,68.9,38.16
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,4 
step
.goto 371,69.72,39.82
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,5 
step
.goto 371,69.93,44.03
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,6 
step
.goto 371,68.09,46.82
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,2,7 
step
.goto 371,66.33,49.38
>>|cRXP_WARN_跟随箭头指引|r
.complete 80015,3 
step
.goto 371,66.26,49.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞洛姆|r交谈
.turnin 80015 >>交任务: |cRXP_FRIENDLY_驭龙俯冲术|r
.timer 2,RP
.target 谢尔ormu
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.accept 80016 >>接任务: |cRXP_WARN_极品飞龙|r
.target 劳尔d Andestrasz
step
.goto 371,65.35,37.27
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,1 
step
.goto 371,66.35,37.22
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,2 
step
.goto 371,68.31,36.03
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,3 
step
.goto 371,68.62,32.48
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,4 
step
.goto 371,67.29,27.3
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,5 
step
.goto 371,65.89,25.58
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,2,6 
step
.goto 371,65.03,24.33
>>|cRXP_WARN_跟随箭头指引|r
.complete 80016,3 
step
.goto 371,64.99,24.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞洛姆|r交谈
.turnin 80016 >>交任务: |cRXP_FRIENDLY_极品飞龙|r
.timer 2,RP
.target 谢尔ormu
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.accept 80017 >>接任务: |cRXP_WARN_极品腾龙|r
.target 劳尔d Andestrasz
step
#completewith next
>>使用驭龙坐骑
.complete 80017,1 
step
.goto 371,65.35,37.18
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,1 
step
.goto 371,66.27,37.05
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,2 
step
.goto 371,67.83,35.58
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,3 
step
.goto 371,68.76,33.22
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,4 
step
.goto 371,68.17,29.85
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,5 
step
.goto 371,65.26,29.44
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,2,6 
step
.goto 371,62.6,28.68
>>|cRXP_WARN_跟随箭头指引|r
.complete 80017,3 
step
.goto 371,62.46,28.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞洛姆|r交谈
.turnin 80017 >>交任务: |cRXP_FRIENDLY_极品腾龙|r
.timer 2,RP
.target 谢尔ormu
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.accept 80018 >>接任务: |cRXP_WARN_飞出时髦|r
.target 劳尔d Andestrasz
step
.goto 371,65.05,37.00
>>点击 |cRXP_PICK_变形讲台|r, 然后按 |cRXP_WARN_Esc 关闭窗口|r
.complete 80018,1 
step
.goto 371,65.28,37.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.turnin 80018 >>交任务: |cRXP_FRIENDLY_飞出时髦|r
.accept 80349 >>接任务: |cRXP_WARN_今年有没有纪念品？|r
.target 劳尔d Andestrasz
step << Horde
#completewith next
.cast 421177 >>点击 |cRXP_PICK_传送门|r 前往蜜瓜村
.goto 371,65.20,37.45
step << Horde
.goto 371,28.52,14.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莫拉塔里|r
.turnin 80349 >>交任务: |cRXP_FRIENDLY_回程时间|r
.target Moratari
step << Alliance
#completewith next
.goto 371,65.21,37.46,5,0
.goto 371,45.8,84.6,40 >>点击 |cRXP_PICK_传送门|r 返回
step << Alliance
.goto 371,45.78,84.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莫拉塔里|r
.turnin 80349 >>交任务: |cRXP_FRIENDLY_回程时间|r
.target Moratari
step << Horde
.goto 371,45.79,84.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莫拉塔里|r
.turnin 80349 >>交任务: |cRXP_FRIENDLY_回程时间|r
.target Moratari
step << Alliance
#completewith next
.goto 371,65.11,37.32,30 >>点击 |cRXP_PICK_传送门|r
step
#completewith next
.goto 371,65.27,37.18
.gossipoption 121340 >>与|cRXP_FRIENDLY_安德斯特拉兹领主|r交谈
.accept 80013 >>接任务: |cRXP_WARN_驭滑翔术|r
.target 劳尔d Andestrasz
step
.goto 371,65.21,37.46,5,0
.goto 371,45.8,84.6,40 >>|cRXP_WARN_保留此任务以使用其传送道具|r
*点击 |cRXP_PICK_传送门|r 返回
.itemcount 216712,1
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 1) 武僧任务
step
.isQuestAvailable 31834
.zoneskip 379
.cast 126892 >>使用禅宗朝圣
step
.goto 379,48.60,42.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.accept 31834 >>接任务: |cRXP_WARN_开始训练：程大师|r
.target 海特大师
step
#completewith next
.goto 379,48.12,43.3,10 >>离开神庙
step
.isOnQuest 31834
.goto 379,47.06,40.15
.gossipoption 41015 >>与|cRXP_FRIENDLY_程大师|r交谈
.timer 29,RP
.target 程大师
step
.isOnQuest 31834
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_程大师|r 停下时重新瞄准他并鞠躬, 然后在决斗中击败他
.emote BOW,66138
.goto 379,48.12,40.35
.complete 31834,1 
.target 程大师
.mob 程大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31834 >>交任务: |cRXP_FRIENDLY_开始训练：程大师|r
.accept 31835 >>接任务: |cRXP_WARN_继续训练：吉斯坦大师|r
.accept 31840 >>接任务: |cRXP_WARN_熟能生巧：程大师|r
.target 海特大师
step
#completewith next
.goto 379,48.12,43.3,10 >>离开神庙
step
.isOnQuest 31840
.goto 379,47.06,40.15
.gossipoption 41015 >>与|cRXP_FRIENDLY_程大师|r交谈
.timer 30,RP
.target 程大师
step
.isOnQuest 31835
.goto 379,48.05,39.02
.gossipoption 40841 >>与|cRXP_FRIENDLY_吉斯坦大师|r交谈
.timer 30,RP
.target 吉斯坦大师
step
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_程大师|r 和 |cRXP_FRIENDLY_吉斯坦大师|r 停下时重新瞄准并鞠躬, 然后在决斗中击败他们
.emote BOW,66138
.emote BOW,65899
.goto 379,48.11,40.31
.complete 31840,1 
.complete 31835,1 
.target 程大师
.mob 程大师
.target 吉斯坦大师
.mob 吉斯坦大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31835 >>交任务: |cRXP_FRIENDLY_继续训练：吉斯坦大师|r
.turnin -31840 >>交任务: |cRXP_FRIENDLY_熟能生巧：程大师|r
.accept 31836 >>接任务: |cRXP_WARN_继续训练：尹大师|r
.target 海特大师
step
#completewith next
.goto 379,49.17,42.86,10 >>离开神庙
step
.isOnQuest 31836
#loop
.goto 379,48.96,40.88,10,0
.goto 379,48.95,40.48,10,0
.goto 379,48.74,40.65,10,0
.goto 379,48.55,40.71,10,0
.gossipoption 40843 >>与|cRXP_FRIENDLY_尹大师|r交谈
.timer 30,RP
.target 尹大师
step
#loop
.goto 379,48.95,40.48,10,0
.goto 379,48.74,40.65,10,0
.goto 379,48.55,40.71,10,0
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_尹大师|r 停下时重新瞄准并行礼, 然后在决斗中击败他
.emote BOW,66073
.complete 31836,1 
.target 尹大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31836 >>交任务: |cRXP_FRIENDLY_继续训练：尹大师|r
.accept 31837 >>接任务: |cRXP_WARN_继续训练：程大师|r
.target 海特大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.isOnQuest 31837
.goto 379,48.53,41.49
.gossipoption 40975 >>与|cRXP_FRIENDLY_程大师|r交谈
.timer 30,RP
.target 程大师
step
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_程大师|r 停下时重新瞄准他并鞠躬, 然后在决斗中击败他
.emote BOW,66180
.goto 379,48.10,40.31
.complete 31837,1 
.target 程大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31837 >>交任务: |cRXP_FRIENDLY_继续训练：程大师|r
.accept 31838 >>接任务: |cRXP_WARN_继续训练：曾大师|r
.target 海特大师
step
#completewith next
.goto 379,48.12,43.3,10 >>离开神庙
step
.isOnQuest 31838
.goto 379,48.07,41.37
.gossipoption 41014 >>与|cRXP_FRIENDLY_曾大师|r交谈
.timer 30,RP
.target 曾大师
step
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_曾大师|r 停下时重新瞄准并鞠躬, 然后在决斗中击败他
*Use |T606542:0|tCrackling Jade Lightning on the Monk Trainees around you on the Balance Poles, then deafeat Master Tsang
.emote BOW,66149
.goto 379,48.12,40.37
.complete 31838,1 
.target 曾大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31838 >>交任务: |cRXP_FRIENDLY_继续训练：曾大师|r
.accept 31839 >>接任务: |cRXP_WARN_继续训练：许大师|r
.target 海特大师
step
#completewith next
.goto 379,48.12,43.3,10 >>离开神庙
step
.isOnQuest 31839
.goto 379,47.49,40.93
.gossipoption 40709 >>与|cRXP_FRIENDLY_许大师|r交谈
.timer 30,RP
.target 许大师
step
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_许大师|r 停下时重新瞄准并鞠躬, 然后在决斗中击败他
.emote BOW,65977
.goto 379,48.11,40.36
.complete 31839,1 
.target 许大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31839 >>交任务: |cRXP_FRIENDLY_继续训练：许大师|r
.accept 31944 >>接任务: |cRXP_WARN_完成训练：终极试炼|r
.target 海特大师
step
#completewith next
.goto 379,48.12,43.3,10 >>离开神庙
step
.isOnQuest 31944
.goto 379,48.32,41.52
.gossipoption 41235 >>与|cRXP_FRIENDLY_海特大师|r交谈
.timer 30,RP
.target 海特大师
step
>>|cRXP_WARN_跟随箭头|r. |cRXP_FRIENDLY_海特大师|r 停下时重新瞄准并鞠躬, 然后在决斗中击败他
.emote BOW,66732
.goto 379,48.15,40.46
.complete 31944,1 
.target 海特大师
step
#completewith next
.goto 379,48.25,43.34,10 >>进入神庙
step
.goto 379,48.59,42.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海特大师|r交谈
.turnin 31944 >>交任务: |cRXP_FRIENDLY_完成训练：终极试炼|r
.target 海特大师
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 鹤翼
step
.xp >34,1
.goto 418,44.20,42.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科洛·迷雾行者|r交谈
.accept 30269 >>接任务: |cRXP_WARN_危险的小径|r
.target 科洛·迷雾行者
step
.xp >34,1
#completewith AccompanyKoro
#label TalkKoro
.goto 418,44.20,42.87
.gossipoption 40208 >>与|cRXP_FRIENDLY_科洛·迷雾行者|r交谈
.timer 80,RP
.target 科洛·迷雾行者
step
.xp >34,1
#completewith AccompanyKoro
#requires TalkKoro
.goto 418,43.81,38.3
>>|cRXP_WARN_护送 |cRXP_FRIENDLY_科罗·迷雾行者|r, 击杀 |cRXP_ENEMY_河刃放血者|r|r
.cast 113142 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科洛·迷雾行者|r交谈, 直到他停止移动
.skipgossip 58978,1
.timer 80,RP
.mob 河刃放血者
.target 科洛·迷雾行者
step
.xp >34,1
#label AccompanyKoro
.goto 418,43.88,36.85
>>|cRXP_WARN_继续护送 |cRXP_FRIENDLY_科罗·迷雾行者|r, 击杀 |cRXP_ENEMY_河刃放血者|r|r
.complete 30269,1 
.mob 河刃放血者
step
.xp >34,1
.goto 418,40.60,33.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科洛·迷雾行者|r交谈
.turnin 30269 >>交任务: |cRXP_FRIENDLY_危险的小径|r
.accept 30270 >>接任务: |cRXP_WARN_斩断耳目|r
.accept 30694 >>接任务: |cRXP_WARN_如履薄冰|r
.target 科洛·迷雾行者
step
.xp >34,1
.goto 418,40.49,34.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r
.accept 30268 >>接任务: |cRXP_WARN_污鳞盗汗症|r
.target 安度因·乌瑞恩国王
step
.xp >34,1
#completewith Riverblade Pathstalker
#hidewindow
#loop
.goto 418,38.88,38.20,40,0
.goto 418,36.91,41.20,40,0
.goto 418,35.84,35.96,40,0
.goto 418,36.89,37.32,40,0
.goto 418,38.16,34.17,40,0
.goto 418,40.75,30.61,40,0
.goto 418,43.71,30.95,40,0
.goto 418,45.13,29.71,40,0
.goto 418,46.13,28.25,40,0
.goto 418,47.48,30.29,40,0
.goto 418,48.35,33.53,40,0
.goto 418,47.02,36.37,40,0
.goto 418,45.52,38.23,40,0
.goto 418,38.88,38.20,0
.goto 418,36.91,41.20,0
.goto 418,35.84,35.96,0
.goto 418,36.89,37.32,0
.goto 418,38.16,34.17,0
.goto 418,40.75,30.61,0
.goto 418,43.71,30.95,0
.goto 418,45.13,29.71,0
.goto 418,46.13,28.25,0
.goto 418,47.48,30.29,0
.goto 418,48.35,33.53,0
.goto 418,47.02,36.37,0
.goto 418,45.52,38.23,0
+1
step
.xp >34,1
#completewith Traps Poked
>>击杀 |cRXP_ENEMY_河刃密径猎手|r
.complete 30270,1 
.mob riverblade pathstalker
step
.xp >34,1
#completewith Traps Poked
>>击杀 |cRXP_ENEMY_污鳞打击者|r, 拾取 |T348531:0|t[|cRXP_LOOT_污鳞蛇头|r]
.complete 30268,1 
.mob 污鳞打击者
step
.xp >34,1
#label Traps Poked
>>点击 |cRXP_PICK_陷阱|r, |cRXP_WARN_注意不要踩到|r
.complete 30694,1 
step
.xp >34,1
#completewith next
>>击杀 |cRXP_ENEMY_污鳞打击者|r, 拾取 |cRXP_LOOT_污鳞蛇头|r
.complete 30268,1 
.mob 污鳞打击者
step
.xp >34,1
#label Riverblade Pathstalker
>>击杀 |cRXP_ENEMY_河刃密径猎手|r
.complete 30270,1 
.mob riverblade pathstalker
step
.xp >34,1
#loop
.goto 418,37.32,43.07,35,0
.goto 418,35.50,34.25,35,0
.goto 418,42.04,38.52,42,0
.goto 418,37.32,43.07,0
.goto 418,35.50,34.25,0
.goto 418,42.04,38.52,0
>>击杀 |cRXP_ENEMY_污鳞打击者|r, 拾取 |cRXP_LOOT_污鳞蛇头|r
.complete 30268,1 
.mob 污鳞打击者
step
.xp >34,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安度因·乌瑞恩|r 和 |cRXP_FRIENDLY_科洛·迷雾行者|r 交谈
.turnin 30268 >>交任务: |cRXP_FRIENDLY_污鳞盗汗症|r
.goto 418,40.49,34.66
.target +安度因·乌瑞恩国王
.turnin 30270 >>交任务: |cRXP_FRIENDLY_斩断耳目|r
.turnin 30694 >>交任务: |cRXP_FRIENDLY_如履薄冰|r
.accept 30272 >>接任务: |cRXP_WARN_拨云见日|r
.accept 30695 >>接任务: |cRXP_WARN_一路向前|r
.goto 418,40.60,33.69
.target +科洛·迷雾行者
.accept 30271 >>接任务: |cRXP_WARN_不惧强敌|r
.goto 418,40.49,34.66
.target +安度因·乌瑞恩国王
step
.xp >34,1
#completewith West Pagoda Cleansed
>>站在 |cRXP_FRIENDLY_绝望的助祭|r 附近, 击杀 |cRXP_ENEMY_绝望化身|r 和 |cRXP_ENEMY_惘之影|r
.complete 30272,1 
.complete 30271,1 
.mob 绝望化身
.mob 惘之影
.target 绝望的助祭
step
.xp >34,1
.goto 418,43.05,54.22
>>击杀 |cRXP_ENEMY_惘之喉|r
.complete 30695,2 
.mob 惘之喉
step
.xp >34,1
.goto 418,37.78,54.37
#label West Pagoda Cleansed
>>击杀 |cRXP_ENEMY_惘之喉|r
.complete 30695,1 
.mob 惘之喉
step
.xp >34,1
#loop
.goto 418,38.20,51.86,40,0
.goto 418,36.95,50.92,40,0
.goto 418,37.20,49.43,40,0
.goto 418,38.97,48.36,40,0
.goto 418,39.65,48.84,40,0
.goto 418,40.36,47.18,40,0
.goto 418,41.60,46.87,40,0
.goto 418,41.75,48.12,40,0
.goto 418,42.72,50.25,40,0
.goto 418,43.12,51.13,40,0
.goto 418,38.20,51.86,0
.goto 418,36.95,50.92,0
.goto 418,37.20,49.43,0
.goto 418,38.97,48.36,0
.goto 418,39.65,48.84,0
.goto 418,40.36,47.18,0
.goto 418,41.60,46.87,0
.goto 418,41.75,48.12,0
.goto 418,42.72,50.25,0
.goto 418,43.12,51.13,0
>>站在 |cRXP_FRIENDLY_绝望的助祭|r 附近, 击杀 |cRXP_ENEMY_绝望化身|r 和 |cRXP_ENEMY_惘之影|r
.complete 30272,1 
.complete 30271,1 
.mob 绝望化身
.mob 惘之影
.target 绝望的助祭
step
.xp >34,1
.goto 418,40.42,50.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的 |cRXP_FRIENDLY_安度因·乌瑞恩|r 交谈
.turnin 30271 >>交任务: |cRXP_FRIENDLY_不惧强敌|r
.turnin 30272 >>交任务: |cRXP_FRIENDLY_拨云见日|r
.turnin 30695 >>交任务: |cRXP_FRIENDLY_不惧强敌|r
.accept 30273 >>接任务: |cRXP_WARN_朱鹤之室|r
.target 安度因·乌瑞恩国王
step
.xp >34,1
#completewith next
.goto 418,40.42,57.31,15,0
.goto 418,40.95,57.12,15,0
.goto 418,40.43,54.48,20,0
>>|cRXP_WARN_沿箭头向下进入神庙|r
.gossipoption 39489 >>与|cRXP_FRIENDLY_赤精|r交谈
.timer 10,RP
.target 赤精
step
.xp >34,1
.goto 418,40.45,54.52
>>击杀 |cRXP_ENEMY_惘之煞|r
.complete 30273,1 
.timer 10,RP
.mob 惘之煞
step
.xp >34,1
.goto 418,40.97,57.19,15,0
.goto 418,40.44,57.11,15,0
.goto 418,40.43,49.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赤精|r交谈|cRXP_WARN_在外面|r
.turnin 30273 >>交任务: |cRXP_FRIENDLY_朱鹤之室|r
.target 赤精
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 多加尼
step
.convertquest 30349,30127 << Horde
#completewith Dojani Dominator
>>击杀 |cRXP_ENEMY_都阳复国者|r, |cRXP_ENEMY_测量者|r 和 |cRXP_ENEMY_都阳暴徒|r
*|cRXP_WARN_Avoid the red circles on the ground; to deal extra 伤害, pull enemies inside them.|r
.complete 30349,1 
.complete 30349,2 
.complete 30349,3 
.mob 都阳复国者
.mob 都阳勘测者
.mob 都阳暴徒
step
.convertquest 30351,30130 << Horde
#completewith Dojani Dominator
>>点击 |cRXP_PICK_树叶|r
.complete 30351,1 
step
.convertquest 30346,30129 << Horde
#label Dojani Dominator
.goto 418,55.45,34.50
>>击杀 |cRXP_ENEMY_都阳统治者|r, 拾取 |cRXP_LOOT_都阳指令|r
.complete 30346,1 
.mob 都阳统御者
step << Alliance
>>点击任务提示弹窗提交任务
.goto 418,55.501,34.431
.turnin 30346 >>交任务: |cRXP_FRIENDLY_青春之池在哪里|r
.accept 30347 >>接任务: |cRXP_WARN_青春之池|r
step << Horde
.goto 418,55.501,34.431
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.turnin 30129 >>交任务: |cRXP_FRIENDLY_青春之池在哪里|r
.accept 30128 >>接任务: |cRXP_WARN_青春之池|r
.target 康·棘杖
step
#label DojaniSurvRecEnfSlain
#completewith FirstSwoopDojani
>>击杀 |cRXP_ENEMY_都阳复国者|r, |cRXP_ENEMY_测量者|r 和 |cRXP_ENEMY_都阳暴徒|r
*|cRXP_WARN_Avoid the red circles on the ground; to deal extra 伤害, pull enemies inside them.|r
.complete 30349,1 
.complete 30349,2 
.complete 30349,3 
.mob 都阳复国者
.mob 都阳勘测者
.mob 都阳暴徒
step
#label ImperialLotusLeaves
#completewith FirstSwoopDojani
>>点击 |cRXP_PICK_树叶|r
.complete 30351,1 
step
.isOnQuest 30351
#hidewindow
#label FirstSwoopDojani
#completewith DojaniSurvRecEnfSlain
.goto 418,56.45,38.88,35,0
.goto 418,55.06,40.81,35,0
.goto 418,53.24,37.76,35 >>1
step
#requires FirstSwoopDojani
.isOnQuest 30347,30128
#completewith next
.gossipoption 39799 >>与|cRXP_FRIENDLY_纳乐|r交谈
.goto 418,51.928,32.742
.timer 15,RPs
.target 纳乐
step
.convertquest 30347,30128 << Horde
#requires FirstSwoopDojani
#loop
.goto 418,51.66,33.08,10,0
.goto 418,52.36,32.81,10,0
.goto 418,51.89,32.20,10,0
.goto 418,51.66,33.08,0
.goto 418,52.36,32.81,0
.goto 418,51.89,32.20,0
>>击杀 |cRXP_ENEMY_沉睡的守护者|r, 点击 |cRXP_PICK_青春之水|r
.complete 30347,1 
.mob 沉睡的守卫
step
#completewith Dojani Enforcer
#hidewindow
#loop
.goto 418,55.30,32.08,40,0
.goto 418,55.66,30.16,40,0
.goto 418,54.54,30.84,40,0
.goto 418,56.45,38.88,35,0
.goto 418,55.06,40.81,35,0
.goto 418,53.24,37.76,35,0
.goto 418,55.30,32.08,0
.goto 418,55.66,30.16,0
.goto 418,54.54,30.84,0
.goto 418,56.45,38.88,0
.goto 418,55.06,40.81,0
.goto 418,53.24,37.76,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_都阳复国者|r, |cRXP_ENEMY_测量者|r 和 |cRXP_ENEMY_都阳暴徒|r
*|cRXP_WARN_Avoid the red circles on the ground; to deal extra 伤害, pull enemies inside them.|r
.complete 30349,1 
.complete 30349,2 
.complete 30349,3 
.mob 都阳复国者
.mob 都阳勘测者
.mob 都阳暴徒
step
>>点击 |cRXP_PICK_树叶|r
.complete 30351,1 
step
#label Dojani Enforcer
>>击杀 |cRXP_ENEMY_都阳复国者|r, |cRXP_ENEMY_测量者|r 和 |cRXP_ENEMY_都阳暴徒|r
*|cRXP_WARN_Avoid the red circles on the ground; to deal extra 伤害, pull enemies inside them.|r
.complete 30349,1 
.complete 30349,2 
.complete 30349,3 
.mob 都阳复国者
.mob 都阳勘测者
.mob 都阳暴徒
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 部落战役
<< Horde
step
.goto 390,62.92,28.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.accept 32249 >>接任务: |cRXP_WARN_寻找斥候|r
.target 烈日行者德兹科
step
.goto 390,63.40,20.77
.fp >>获取黄金平台飞行路线
step
.goto 390,63.40,20.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弓术大师枯弩|r 交谈
.accept 31391 >>接任务: |cRXP_WARN_卡拉克西|r
.target 弓术大师枯弩
step
.goto 390,63.14,22.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_仁慈的翁|r 交谈
.accept 31385 >>接任务: |cRXP_WARN_今年有没有纪念品？|r
.target 仁慈的翁
step
.goto 418,8.74,64.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侦察兵罗克拉|r交谈
.turnin 32249 >>交任务: |cRXP_FRIENDLY_寻找斥候|r
.target Scout Rokla
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r
.accept 32250 >>接任务: |cRXP_WARN_酋长的力量|r
.target 加尔鲁什·地狱咆哮
step
.goto 418,12.02,63.42
>>击杀 |cRXP_ENEMY_联盟士兵|r
.complete 32250,1 
.mob Alliance
step
>>|cRXP_WARN_跟随箭头指引|r
.goto 418,10.70,53.15
.complete 32250,2 
step
>>|cRXP_WARN_跟随箭头指引|r
.goto 418,15.73,57.75
.complete 32250,3 
step
.goto 418,15.73,57.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r
.turnin 32250 >>交任务: |cRXP_FRIENDLY_酋长的力量|r
.accept 32108 >>接任务: |cRXP_WARN_统御岗哨|r
.target 加尔鲁什·地狱咆哮
step
.goto 418,8.53,63.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_信号火焰|r交谈
.turnin 32108 >>交任务: |cRXP_FRIENDLY_统御岗哨|r
.target Signal Fire
step
.goto 418,10.38,53.71
.accept 32251 >>接任务: |cRXP_WARN_黑暗中的匕首|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.accept 32256 >>接任务: |cRXP_WARN_帝国的崛起|r
.target 纳兹戈林将军
step
.goto 418,12.74,56.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_悬赏榜|r 交谈
.accept 32222 >>接任务: |cRXP_WARN_今年有没有纪念品？|r
.target Bounty Board
step
.goto 418,12.97,56.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.accept 32214 >>接任务: |cRXP_WARN_今年有没有纪念品？|r
.target 利维特·急刹
step
.goto 418,13.80,55.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_公爵|r
.accept 32197 >>接任务: |cRXP_WARN_神秘肉卷|r
.target 公爵
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女工头翠克西尔|r交谈
.accept 32136 >>接取工作订单: 燃料
.target 女工头翠克西尔
step
.goto 418,25.26,60.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克西·圆锯|r交谈
.accept 32237 >>接受珍贵资源
.target 比克希·圆锯
step
.goto 418,25.54,60.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里兹尔·轮滑|r交谈
.turnin 32136 >>交任务: |cRXP_FRIENDLY_工作订单:燃料|r
.target 格里兹尔·轮滑
.accept 32137 >>接受空转
step
.goto 418,21.34,65.00
.complete 32197,1 
step
.goto 418,25.33,64.38
.complete 32137,1 
step
.goto 418,26.05,58.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞兹克·蒸锅|r交谈
.turnin 32197 >>交任务: |cRXP_FRIENDLY_神秘肉卷|r
.target 塞兹克·蒸锅
step
.goto 418,21.78,54.02
.complete 32237,1 
step
.goto 418,19.36,63.11
>>击杀 |cRXP_ENEMY_破坏者|r
.complete 32214,1 
.mob Saboteur
step
.goto 418,25.26,60.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克西·圆锯|r交谈
.turnin 32237 >>交任务: |cRXP_FRIENDLY_珍贵资源|r
.target 比克希·圆锯
step
.goto 418,21.66,51.14
>>击杀 |cRXP_ENEMY_首席技师轮钳|r
.complete 32222,1 
.mob 首席技师轮钳
step
.goto 418,13.79,55.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女工头翠克西尔|r交谈
.turnin 32137 >>交任务: |cRXP_FRIENDLY_油箱见底|r
.target 女工头翠克西尔
step
.goto 418,12.91,56.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 32214 >>交任务: |cRXP_FRIENDLY_锈水财阀渗透者|r
.target 利维特·急刹
step
.goto 418,10.08,53.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲜血卫士格罗塔什|r交谈
.turnin 32222 >>交任务: |cRXP_FRIENDLY_通缉:首席技师轮钳|r
.target 血卫士高塔什
step
.goto 418,10.38,53.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳兹戈林将军|r 交谈以排队进入"黑暗之刃"|r
.complete 32251,1 
.target 纳兹戈林将军 to queue for "Dagger in the Dark"
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 霍瑟恩
step
.goto 418,51.66,75.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尼·吐纳|r交谈
.accept 30667 >>接任务: |cRXP_WARN_特别的羽毛|r
.target 托尼·吐纳
step
.goto 418,51.53,76.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾·云瀑|r交谈
.accept 30666 >>接任务: |cRXP_WARN_突然袭击|r
.target 贾·云瀑
step
#completewith Mortbreath crocolisk
#hidewindow
#loop
.goto 418,47.65,69.69,35,0
.goto 418,44.59,68.24,35,0
.goto 418,42.59,69.95,35,0
.goto 418,44.07,73.97,50,0
.goto 418,47.65,69.69,0
.goto 418,44.59,68.24,0
.goto 418,42.59,69.95,0
.goto 418,44.07,73.97,0
+1
step
#completewith Emerald Tailfeather
>>击杀 |cRXP_ENEMY_死息鳄鱼|r
.complete 30666,1 
.mob mortbreath crocolisk
step
#completewith Emerald Tailfeather
>>击杀 |cRXP_ENEMY_暮色鹦鹉|r, 拾取 |T132921:0|t[|cRXP_LOOT_暮色尾羽|r]
.complete 30667,3 
.mob 暮色鹦鹉
step
#completewith Emerald Tailfeather
>>击杀 |cRXP_ENEMY_赤羽鹦鹉|r, 拾取 |T132929:0|t[|cRXP_LOOT_赤红尾羽|r]
.complete 30667,2 
.mob 赤羽鹦鹉
step
#label Emerald Tailfeather
>>击杀 |cRXP_ENEMY_翡翠鹦鹉|r, 拾取 |T132924:0|t[|cRXP_LOOT_翡翠尾羽|r]
.complete 30667,1 
.mob 翡翠鹦鹉
step
#completewith Crimson Tailfeather
>>击杀 |cRXP_ENEMY_死息鳄鱼|r
.complete 30666,1 
.mob mortbreath crocolisk
step
#completewith Crimson Tailfeather
>>击杀 |cRXP_ENEMY_暮色鹦鹉|r, 拾取 |T132921:0|t[|cRXP_LOOT_暮色尾羽|r]
.complete 30667,3 
.mob 暮色鹦鹉
step
#label Crimson Tailfeather
>>击杀 |cRXP_ENEMY_赤羽鹦鹉|r, 拾取 |T132929:0|t[|cRXP_LOOT_赤红尾羽|r]
.complete 30667,2 
.mob 赤羽鹦鹉
step
#completewith next
>>击杀 |cRXP_ENEMY_死息鳄鱼|r
.complete 30666,1 
.mob mortbreath crocolisk
step
>>击杀 |cRXP_ENEMY_暮色鹦鹉|r, 拾取 |T132921:0|t[|cRXP_LOOT_暮色尾羽|r]
.complete 30667,3 
.mob 暮色鹦鹉
step
#label Mortbreath crocolisk
>>击杀 |cRXP_ENEMY_死息鳄鱼|r
.complete 30666,1 
.mob mortbreath crocolisk
step
.goto 418,51.66,75.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尼·吐纳|r交谈
.turnin 30667 >>交任务: |cRXP_FRIENDLY_特别的羽毛|r
.target 托尼·吐纳
step
.goto 418,51.53,76.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾·云瀑|r交谈
.turnin 30666 >>交任务: |cRXP_FRIENDLY_突然袭击|r
.accept 30668 >>接任务: |cRXP_WARN_造木筏|r
.target 贾·云瀑
step
.goto 418,52.26,77.95
>>点击 |cRXP_PICK_结实的海藻|r
.complete 30668,2 
step
.goto 418,52.38,76.18
>>点击 |cRXP_PICK_备用木板|r
.complete 30668,1 
step
.goto 418,51.54,76.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾·云瀑|r交谈
.turnin 30668 >>交任务: |cRXP_FRIENDLY_造木筏|r
.accept 30669 >>接任务: |cRXP_WARN_湖面上的游学者|r
.target 贾·云瀑
step
.goto 418,51.68,76.58
>>点击 |cRXP_PICK_木筏|r
.complete 30669,1 
step
.goto 418,45.97,78.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_睿智的阿娜·吴|r交谈
.turnin 30669 >>交任务: |cRXP_FRIENDLY_湖面上的游学者|r
.accept 30671 >>接任务: |cRXP_WARN_知识有价|r
.accept 30691 >>接任务: |cRXP_WARN_悲天悯人|r
.target 睿智的阿娜·吴
step
#completewith next
>>击杀 |cRXP_ENEMY_巨型灰鲨|r 和 |cRXP_ENEMY_纳耶利锤头鲨|r, 拾取 |T350573:0|t[|cRXP_LOOT_鲨鱼肉|r]
.complete 30671,1 
.mob 巨型灰鲨
.mob 纳耶里锤头鲨
step
#completewith next
#title Swim Down
.goto 418,46.00,80.23,10 >>进入 |cRXP_WARN_水下|r 洞穴
step
>>击杀 |cRXP_ENEMY_纳哈萨|r
.complete 30691,1 
.goto 418,46.202,83.462
.mob 纳赫煞
step
>>点击任务提示窗口提交任务
.goto 418,46.202,83.462
.turnin 30691 >>交任务: |cRXP_FRIENDLY_悲天悯人|r
step
#completewith next
.goto 418,46,80.23,10 >>离开洞穴
step
#loop
.goto 418,47.04,79.26,40,0
.goto 418,49.13,78.94,40,0
.goto 418,46.31,77.34,40,0
.goto 418,44.45,79.32,40,0
.goto 418,47.04,79.26,0
.goto 418,49.13,78.94,0
.goto 418,46.31,77.34,0
.goto 418,44.45,79.32,0
>>击杀 |cRXP_ENEMY_巨型灰鲨|r 和 |cRXP_ENEMY_纳耶利锤头鲨|r, 拾取 |T350573:0|t[|cRXP_LOOT_鲨鱼肉|r]
.complete 30671,1 
.mob 巨型灰鲨
.mob 纳耶里锤头鲨
step
.goto 418,45.98,78.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_睿智的阿娜·吴|r交谈, 她在地表上
.turnin 30671 >>交任务: |cRXP_FRIENDLY_知识有价|r
.target 睿智的阿娜·吴
.accept 30672 >>接任务: |cRXP_WARN_平衡|r
step
#completewith next
>>击杀 |cRXP_ENEMY_乌嘎捕鱼者|r, 拾取 |cRXP_LOOT_埋好的猢狲财宝|r 并在背包中点击它
.complete 30672,1 
.collect 80827,1,30675,0
.accept 30675 >>接任务: |cRXP_WARN_埋好的猢狲财宝|r
.mob Unga Fish-getter
step
.goto 418,45.17,84.59
>>|cRXP_WARN_跟随箭头指引|r
.accept 30674 >>接任务: |cRXP_WARN_自然法则|r
step << Alliance
#completewith UngaFishGetter
#hidewindow
#loop
.goto 418,43.49,85.45,40,0
.goto 418,44.42,87.40,40,0
.goto 418,47.74,87.01,40,0
.goto 418,48.64,87.54,40,0
.goto 418,50.20,86.64,40,0
.goto 418,51.12,86.50,40,0
.goto 418,51.76,84.55,40,0
.goto 418,49.38,84.88,40,0
.goto 418,43.49,85.45,0
.goto 418,44.42,87.40,0
.goto 418,47.74,87.01,0
.goto 418,48.64,87.54,0
.goto 418,50.20,86.64,0
.goto 418,51.12,86.50,0
.goto 418,51.76,84.55,0
.goto 418,49.38,84.88,0
+1
step << Horde
#completewith UngaFishGetter
#hidewindow
#loop
.goto 418,43.49,85.45,40,0
.goto 418,42.377,86.719,25,0
.goto 418,44.42,87.40,40,0
.goto 418,47.74,87.01,40,0
.goto 418,48.64,87.54,40,0
.goto 418,50.20,86.64,40,0
.goto 418,51.12,86.50,40,0
.goto 418,51.76,84.55,40,0
.goto 418,49.38,84.88,40,0
.goto 418,43.49,85.45,0
.goto 418,42.38,86.72,0
.goto 418,44.42,87.40,0
.goto 418,47.74,87.01,0
.goto 418,48.64,87.54,0
.goto 418,50.20,86.64,0
.goto 418,51.12,86.50,0
.goto 418,51.76,84.55,0
.goto 418,49.38,84.88,0
+1
step
#completewith Buried Hozen Treasure
>>击杀 |cRXP_ENEMY_乌嘎捕鱼者|r, 拾取 |cRXP_LOOT_埋好的猢狲财宝|r
.complete 30672,1 
.collect 80827,1,30675,0
.accept 30675 >>接任务: |cRXP_WARN_埋好的猢狲财宝|r
.mob Unga Fish-getter
step
#completewith Buried Hozen Treasure
>>与 |cRXP_PICK_挣扎的鲤鱼|r 互动
.complete 30674,1 
.target 挣扎的鲤鱼
step
#label Buried Hozen Treasure
>>点击 |cRXP_PICK_泥土|r
.complete 30675,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_乌嘎捕鱼者|r, 拾取 |cRXP_LOOT_埋好的猢狲财宝|r
.complete 30672,1 
.mob unga fish-getter
step
>>与 |cRXP_PICK_挣扎的鲤鱼|r 互动
.complete 30674,1 
.target 挣扎的鲤鱼
step
#label UngaFishGetter
>>击杀 |cRXP_ENEMY_乌嘎捕鱼者|r, 拾取 |cRXP_LOOT_埋好的猢狲财宝|r
.complete 30672,1 
.collect 80827,1,30675,0
.accept 30675 >>接任务: |cRXP_WARN_埋好的猢狲财宝|r
.mob unga fish-getter
step
>>点击任务提示窗口提交任务
.turnin 30674 >>交任务: |cRXP_FRIENDLY_自然法则|r
.turnin 30675 >>交任务: |cRXP_FRIENDLY_埋好的猢狲财宝|r
step
.goto 418,51.52,76.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾·云瀑|r交谈
.turnin 30672 >>交任务: |cRXP_FRIENDLY_平衡|r
.target 贾·云瀑
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 伊克提克
step << Alliance
#completewith Ik'thik Mantid
#hidewindow
#loop
.goto 418,14.46,36.69,30,0
.goto 418,14.23,35.67,30,0
.goto 418,15.45,35.45,30,0
.goto 418,15.88,34.63,30,0
.goto 418,16.98,35.28,30,0
.goto 418,17.36,36.67,30,0
.goto 418,15.70,37.35,30,0
.goto 418,14.46,36.69,0
.goto 418,14.23,35.67,0
.goto 418,15.45,35.45,0
.goto 418,15.88,34.63,0
.goto 418,16.98,35.28,0
.goto 418,17.36,36.67,0
.goto 418,15.70,37.35,0
+1
step << Horde
#completewith Ik'thik Mantid
#hidewindow
#loop
.goto 418,15.633,37.257,25,0
.goto 418,17.204,35.091,35,0
.goto 418,15.527,34.668,25,0
.goto 418,11.823,37.577,35,0
.goto 418,13.210,37.820,25,0
.goto 418,14.136,41.437,35,0
.goto 418,15.633,37.257,0
.goto 418,17.204,35.091,0
.goto 418,15.527,34.668,0
.goto 418,11.823,37.577,0
.goto 418,13.210,37.820,0
.goto 418,14.136,41.437,0
+1
step
.convertquest 30361,30175 << Horde
#completewith next
>>击杀 |cRXP_ENEMY_伊克提克螳螂|r
.complete 30361,1 
.mob 伊克提克先锋
.mob 伊克提克尖兵
step
.convertquest 30357,30164 << Horde
>>与 |cRXP_FRIENDLY_石犁使者|r 互动
.complete 30357,1 
.target 石犁使者
step
#label Ik'thik Mantid
>>击杀 |cRXP_ENEMY_伊克提克螳螂|r
.complete 30361,1 
.mob 伊克提克先锋
.mob 伊克提克尖兵
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 3) 卡桑琅丛林 科尔詹
step << Alliance
#completewith Korjan Reclaimer
#hidewindow
#loop
.goto 418,26.71,37.67,25,0
.goto 418,27.51,39.57,25,0
.goto 418,26.35,39.35,25,0
.goto 418,25.45,39.14,25,0
.goto 418,26.75,42.26,25,0
.goto 418,25.13,42.55,25,0
.goto 418,23.64,41.59,25,0
.goto 418,24.14,39.28,25,0
.goto 418,23.44,37.83,25,0
.goto 418,24.84,38.08,25,0
.goto 418,26.71,37.67,0
.goto 418,27.51,39.57,0
.goto 418,26.35,39.35,0
.goto 418,25.45,39.14,0
.goto 418,26.75,42.26,0
.goto 418,25.13,42.55,0
.goto 418,23.64,41.59,0
.goto 418,24.14,39.28,0
.goto 418,23.44,37.83,0
.goto 418,24.84,38.08,0
+1
step << Horde
#completewith Korjan Reclaimer
#hidewindow
#loop
.goto 418,26.75,42.26,25,0
.goto 418,25.13,42.55,25,0
.goto 418,23.64,41.59,25,0
.goto 418,24.14,39.28,25,0
.goto 418,23.44,37.83,25,0
.goto 418,24.84,38.08,25,0
.goto 418,26.71,37.67,25,0
.goto 418,27.51,39.57,25,0
.goto 418,26.35,39.35,25,0
.goto 418,25.45,39.14,25,0
.goto 418,26.75,42.26,0
.goto 418,25.13,42.55,0
.goto 418,23.64,41.59,0
.goto 418,24.14,39.28,0
.goto 418,23.44,37.83,0
.goto 418,24.84,38.08,0
.goto 418,26.71,37.67,0
.goto 418,27.51,39.57,0
.goto 418,26.35,39.35,0
.goto 418,25.45,39.14,0
+1
step
.convertquest 30356,30229 << Horde
#completewith Captives Freed
>>击杀 |cRXP_ENEMY_科夏复国者|r
.complete 30356,1 
.mob 科夏复国者
.mob 科夏奴监
.mob 科夏收集者
step
.convertquest 30355,30230 << Horde
#completewith Captives Freed
>>点击 |cRXP_PICK_魔古神器|r
.complete 30355,1 
step
.convertquest 30354,30163 << Horde
#label Captives Freed
>>与 |cRXP_FRIENDLY_被俘的哨兵|r 互动
.complete 30354,1 
.target 被俘的哨兵
step
#completewith next
>>击杀 |cRXP_ENEMY_科夏复国者|r
.complete 30356,1 
.mob korjan reclaimer
.mob 科夏奴监
.mob 科夏收集者
step
>>点击 |cRXP_PICK_魔古神器|r
.complete 30355,1 
step
#label Korjan Reclaimer
>>击杀 |cRXP_ENEMY_科夏复国者|r
.complete 30356,1 
.mob korjan reclaimer
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 4) 四风谷 1
#displayname 第 2 章 - 四风谷第 1 部分
#title Valley of the Four Winds 1
#next 5) 卡桑琅丛林 1
step
.goto 376,85.94,22.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.accept 29907 >>接任务: |cRXP_WARN_陈和丽丽|r
.timer 15,Roleplay Duration
.target 陈·风暴烈酒
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楠·雷蹄|r交谈
.goto 376,83.76,20.20
.home >>将 [炉石] 设为雷霆足旅店
.target 楠·雷脚
step
>>等待剧情演出
.goto 376,83.70,21.02
.complete 29907,1 
step
.goto 376,83.70,21.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_庞·雷蹄|r交谈
.turnin 29907 >>交任务: |cRXP_FRIENDLY_陈和丽丽|r
.target 庞·雷脚
.accept 29908 >>接任务: |cRXP_WARN_剪不断理还乱|r
step
.goto 376,82.70,21.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫穆诺|r交谈
.accept 29877 >>接任务: |cRXP_WARN_缺乏常识|r
.target 雇农穆诺
step
#completewith BuriedFarmEquipment
#hidewindow
#loop
.goto 376,82.017,18.318,25,0
.goto 376,78.302,23.206,25,0
.goto 376,79.416,26.042,25,0
.goto 376,82.792,23.050,25,0
.goto 376,84.614,13.816,25,0
.goto 376,82.017,18.318,0
.goto 376,78.302,23.206,0
.goto 376,79.416,26.042,0
.goto 376,82.792,23.050,0
.goto 376,84.614,13.816,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_维尔曼骚扰者|r 和 |cRXP_ENEMY_大型维尔曼|r
.complete 29908,2 
.complete 29908,1 
.mob Virmen Pesterling
.mob 暴牙兔妖
.mob 暴牙强盗
.mob 暴牙捣蛋鬼
step
>>|cRXP_WARN_点击 |cRXP_PICK_耙子树|r|r
.complete 29877,1 
step
#label BuriedFarmEquipment
>>击杀 |cRXP_ENEMY_维尔曼骚扰者|r 和 |cRXP_ENEMY_大型维尔曼|r
.complete 29908,2 
.complete 29908,1 
.mob Virmen Pesterling
.mob 暴牙兔妖
.mob 暴牙强盗
.mob 暴牙捣蛋鬼
step
.goto 376,82.70,21.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫穆诺|r交谈
.turnin 29877 >>交任务: |cRXP_FRIENDLY_缺乏常识|r
.target 雇农穆诺
step
.goto 376,83.69,21.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_庞·雷蹄|r交谈
.turnin 29908 >>交任务: |cRXP_FRIENDLY_剪不断理还乱|r
.target 庞·雷脚
.accept 29909 >>接任务: |cRXP_WARN_低产的芜菁|r
step
.goto 376,81.60,25.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_昂·雷蹄|r交谈
.turnin 29909 >>交任务: |cRXP_FRIENDLY_低产的芜菁|r
.accept 29940 >>接任务: |cRXP_WARN_夺回作物|r
.target 昂·雷脚
step
#loop
.goto 376,81.877,25.752,8,0
.goto 376,81.925,26.512,8,0
.goto 376,82.399,26.466,8,0
.goto 376,82.585,26.275,8,0
.goto 376,82.676,25.538,8,0
.goto 376,82.190,25.828,8,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿娜·雷蹄|r交谈
.accept 29910 >>接任务: |cRXP_WARN_鼠辈泛滥|r
.target 阿娜·雷脚
step
#completewith next
>>|cRXP_WARN_点击 |cRXP_ENEMY_胀鼓鼓的土拨鼠|r|r
.complete 29910,1 
.mob 胀鼓鼓的土拨鼠
step
>>点击 |cRXP_FRIENDLY_土拨鼠洞口|r. |cRXP_WARN_|cRXP_ENEMY_胀鼓鼓的土拨鼠|r 可以打断施法|r
.goto 376,82.364,25.759
.complete 29910,2 
step
>>|cRXP_WARN_点击 |cRXP_FRIENDLY_胀鼓鼓的土拨鼠|r|r
.goto 376,82.364,25.759
.complete 29910,1 
.mob 胀鼓鼓的土拨鼠
step
#completewith next
#title 进入洞穴
.goto 376,86.478,28.052,8 >>|cRXP_WARN_进入洞窟|r
step
>>|cRXP_WARN_拾取 |cRXP_PICK_被偷的芜菁|r|r
.goto 376,85.19,27.17
.complete 29940,1 
stepw
#completewith next
#title 离开洞穴
.goto 376,86.478,28.052,8 >>|cRXP_WARN_离开洞穴|r
step
>>|cRXP_WARN_拾取 |cRXP_PICK_被偷的西瓜|r|r
.goto 376,85.301,32.329
.complete 29940,2 
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 5) 卡桑琅丛林 1
#displayname 第 3 章 - 卡萨兰荒野第 1 部分
#title Krasarang Wilds 1
#next 6) 四风谷 2
step
.goto 418,76.22,7.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.accept 30079 >>接任务: |cRXP_WARN_朱家堡之殇|r
.target 肯肯
step
.goto 418,75.84,7.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅·桶底|r交谈
.complete 30079,4 
.accept 30080 >>接任务: |cRXP_WARN_找到易默|r
.target 梅·残酒
step
.goto 418,75.48,9.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_云|r交谈, 他在小屋内
.complete 30079,3 
.target 阴
step
.goto 418,76.69,8.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沮丧的朱家守卫|r交谈
.complete 30079,1 
.skipgossip
.target 沮丧的朱家戒卫
step
.goto 418,77.48,8.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孙妮|r交谈
.complete 30079,2 
.skipgossip
.target 孙宁
step
.isOnQuest 30079
.goto 418,77.26,8.69,5 >>离开小屋
step
.goto 418,81.31,6.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_易默·长眉|r交谈
.complete 30080,1 
.skipgossip
.target 易默·长眉
step
.goto 418,81.31,6.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_易默·长眉|r交谈
.turnin 30080 >>交任务: |cRXP_FRIENDLY_找到易默|r
.accept 30082 >>接任务: |cRXP_WARN_振作起来，易默|r
.target 易默·长眉
step
.isOnQuest 30082
.goto 418,81.31,6.85
.gossipoption 40648 >>与|cRXP_FRIENDLY_易默·长眉|r交谈
.skipgossip 58376,1
.timer 60,RP
step
.isOnQuest 30082
.goto 418,81.31,6.83
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(1)|r
step
.isOnQuest 30082
.goto 418,80.98,6.88
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(2)|r
step
.isOnQuest 30082
.goto 418,80.65,6.95
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(3)|r
step
.isOnQuest 30082
.goto 418,80.33,7
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(4)|r
step
.isOnQuest 30082
.goto 418,80.01,7.08
.cast 108175 >>击杀 |cRXP_ENEMY_雷鸟|r, 然后与 |cRXP_FRIENDLY_易墨长眉|r 互动. |cRXP_WARN_(5)|r
.mob 雷鸟
step
.isOnQuest 30082
.goto 418,79.68,7.14
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(6)|r
step
.isOnQuest 30082
.goto 418,79.35,7.2
.cast 108175 >>击杀 |cRXP_ENEMY_雷鸟|r, 然后与 |cRXP_FRIENDLY_易墨长眉|r 互动. |cRXP_WARN_(7)|r
.mob 雷鸟
step
.isOnQuest 30082
.goto 418,79.02,7.28
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(8)|r
step
.isOnQuest 30082
.goto 418,78.69,7.34
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(9)|r
step
.isOnQuest 30082
.goto 418,78.37,7.41
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(10)|r
step
.isOnQuest 30082
.goto 418,78.04,7.49
.cast 108175 >>击杀 |cRXP_ENEMY_雷鸟|r, 然后与 |cRXP_FRIENDLY_易墨长眉|r 互动. |cRXP_WARN_(11)|r
.mob 雷鸟
step
.isOnQuest 30082
.goto 418,77.71,7.56
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(12)|r
step
.isOnQuest 30082
.goto 418,77.38,7.64
.cast 108175 >>击杀 |cRXP_ENEMY_雷鸟|r, 然后与 |cRXP_FRIENDLY_易墨长眉|r 互动. |cRXP_WARN_(13)|r
.mob 雷鸟
step
.isOnQuest 30082
.goto 418,77.07,7.73
.cast 108175 >>与 |cRXP_FRIENDLY_易墨·长眉|r 互动 |cRXP_WARN_(14)|r
step
.goto 418,75.84,7.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅·桶底|r交谈
.turnin 30082 >>交任务: |cRXP_FRIENDLY_振作起来，易默|r
.target 梅·残酒
.accept 30091 >>接任务: |cRXP_WARN_潘达利亚之泪|r
step
.goto 418,76.20,7.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.turnin 30079 >>交任务: |cRXP_FRIENDLY_朱家堡之殇|r
.accept 30081 >>接任务: |cRXP_WARN_对症下药|r
.target 肯肯
step
#completewith SaltyCore
#hidewindow
#loop
.goto 418,75.80,11.14,40,0
.goto 418,75.22,11.85,40,0
.goto 418,73.71,11.21,35,0
.goto 418,72.47,12.42,35,0
.goto 418,71.21,10.30,35,0
+1
step
#completewith Chunk of Honeycomb
>>击杀 |cRXP_ENEMY_哭泣恐魔|r, 拾取 |cRXP_LOOT_岩盐核心|r
.complete 30091,1 
.complete 30081,1 
.mob weeping horror
step
#completewith Chunk of Honeycomb
>>点击 |cRXP_PICK_滑溜的泥鱼|r
.complete 30081,2 
step
#label Chunk of Honeycomb
.goto 418,75.80,11.14,0
.goto 418,75.22,11.85,0
.goto 418,73.71,11.21,0
.goto 418,72.47,12.42,0
.goto 418,71.21,10.30,0
>>点击 |cRXP_PICK_湿漉漉的蜂巢|r
.complete 30081,3 
step
#completewith next
>>击杀 |cRXP_ENEMY_哭泣恐魔|r, 拾取 |cRXP_LOOT_岩盐核心|r
.complete 30091,1 
.complete 30081,1 
.mob weeping horror
step
>>点击 |cRXP_PICK_滑溜的泥鱼|r
.complete 30081,2 
step
#label SaltyCore
>>击杀 |cRXP_ENEMY_哭泣恐魔|r, 拾取 |cRXP_LOOT_岩盐核心|r
.complete 30091,1 
.complete 30081,1 
.mob weeping horror
step
.goto 418,75.84,7.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅·桶底|r交谈
.turnin 30091 >>交任务: |cRXP_FRIENDLY_潘达利亚之泪|r
.target 梅·残酒
.accept 30083 >>接任务: |cRXP_WARN_保卫朱家界|r
.accept 30084 >>接任务: |cRXP_WARN_边境|r
step
.goto 418,76.22,7.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.turnin 30081 >>交任务: |cRXP_FRIENDLY_对症下药|r
.accept 30088 >>接任务: |cRXP_WARN_干嘛这么严肃？|r
.target 肯肯
step
#completewith next
>>击杀 |cRXP_ENEMY_野鳞蜥蜴人|r
.complete 30083,1 
.mob 野鳞草药师
step
.isOnQuest 30083
.goto 376,77.23,57.34,10 >>进入洞穴
step
#completewith 离开洞穴
>>击杀 |cRXP_ENEMY_野鳞蜥蜴人|r
.complete 30083,1 
.mob 野鳞草药师
step
.isOnQuest 30088
.goto 376,75.02,55.26
.cast 3365 >>点击石碑
step
.goto 376,76.63,56.72,20,0
.goto 376,76.51,55.44,20,0
.goto 376,75.71,56.69,20,0
.goto 376,73.88,56.41
>>点击 |cRXP_PICK_一罐颜料|r
.complete 30088,2 
step
#label 离开洞穴
#title 离开洞穴
.isOnQuest 30088
.goto 376,76.26,55.52,20,0
.goto 376,77.04,57.27,20 >>离开洞穴
step
#loop
.goto 418,71.27,9.11,20,0
.goto 376,77.34,58.65,20,0
.goto 376,76.67,56.99,20,0
.goto 376,76.55,55.41,20,0
.goto 376,76.04,55.79,20,0
.goto 376,74.15,56.29,20,0
.goto 418,71.27,9.11,0
.goto 376,77.34,58.65,0
.goto 376,76.67,56.99,0
.goto 376,76.55,55.41,0
.goto 376,76.04,55.79,0
.goto 376,74.15,56.29,0
>>击杀 |cRXP_ENEMY_野鳞蜥蜴人|r
.complete 30083,1 
.mob 野鳞草药师
step
#completewith Memorial Flame of Po
>>击杀 |cRXP_ENEMY_卡萨里潜行者|r, 拾取 |T134298:0|t[|cRXP_LOOT_巨大的豹牙|r]
.complete 30088,1 
.mob 卡桑利追踪者
step
.goto 418,71.27,17.46
>>在 |cRXP_WARN_纪念碑|r 附近使用 |T135432:0|t[朱氏守望之焰]
.complete 30084,3 
.use 78928
step
.goto 418,72.77,18.08
>>在 |cRXP_WARN_纪念碑|r 附近使用 |T135432:0|t[朱氏守望之焰]
.complete 30084,1 
.use 78928
step
#label Memorial Flame of Po
.goto 418,73.87,16.85
>>在 |cRXP_WARN_纪念碑|r 附近使用 |T135432:0|t[朱氏守望之焰]
.complete 30084,2 
.use 78928
step
#loop
.goto 418,74.05,15.35,20,0
.goto 418,74.06,18.86,20,0
.goto 418,70.95,18.69,20,0
.goto 418,70.06,16.99,20,0
.goto 418,74.05,15.35,0
.goto 418,74.06,18.86,0
.goto 418,70.95,18.69,0
.goto 418,70.06,16.99,0
>>击杀 |cRXP_ENEMY_卡萨里潜行者|r, 拾取 |cRXP_LOOT_巨大的豹牙|r
.complete 30088,1 
.mob 卡桑利追踪者
step
.goto 418,75.83,7.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅·桶底|r交谈
.turnin 30083 >>交任务: |cRXP_FRIENDLY_保卫朱家界|r
.target 梅·残酒
.turnin 30084 >>交任务: |cRXP_FRIENDLY_边境|r
step
.goto 418,76.21,7.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.turnin 30088 >>交任务: |cRXP_FRIENDLY_干嘛这么严肃？|r
.target 肯肯
.accept 30089 >>接任务: |cRXP_WARN_变相怪杰|r
step
#loop
.goto 418,76.51,8.20,20,0
.goto 418,76.39,8.46,20,0
.goto 418,76.69,8.86,20,0
.goto 418,76.83,9.33,20,0
.goto 418,76.13,9.00,20,0
.goto 418,75.95,8.40,20,0
.goto 418,75.94,7.79,20,0
.goto 418,77.29,8.31,20,0
.goto 418,77.47,9.84,20,0
.goto 418,75.44,8.30,20,0
.goto 418,76.51,8.20,0
.goto 418,76.39,8.46,0
.goto 418,76.69,8.86,0
.goto 418,76.83,9.33,0
.goto 418,76.13,9.00,0
.goto 418,75.95,8.40,0
.goto 418,75.94,7.79,0
.goto 418,77.29,8.31,0
.goto 418,77.47,9.84,0
.goto 418,75.44,8.30,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱氏绝望守卫|r交谈, 然后击杀绝望化身
.complete 30089,1 
.target 沮丧的朱家戒卫
.mob 绝望化身
step
.goto 418,76.22,7.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.turnin 30089 >>交任务: |cRXP_FRIENDLY_变相怪杰|r
.target 肯肯
.accept 30090 >>接任务: |cRXP_WARN_朱家堡的绝望|r
step
#loop
.goto 418,75.65,8.73,40,0
.goto 418,77.24,9.52,40,0
.goto 418,77.07,8.21,40,0
.goto 418,75.65,8.73,0
.goto 418,77.24,9.52,0
.goto 418,77.07,8.21,0
>>击杀 |cRXP_ENEMY_绝望精魄|r
.complete 30090,1 
.mob essence of despair
step
.goto 418,76.49,8.77
>>与 |cRXP_FRIENDLY_易默·长眉|r 交谈, 击杀 |cRXP_ENEMY_绝望精华|r
.complete 30090,2 
.target 易默·长眉
.target 绝望精华
step << Horde
#completewith next
.logout 19 >>登出以跳过过场动画
step
.goto 418,76.22,7.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯肯|r交谈
.turnin 30090 >>交任务: |cRXP_FRIENDLY_朱家堡的绝望|r
.target 肯肯
step
.goto 418,75.85,7.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅·桶底|r交谈
.accept 30178 >>接任务: |cRXP_WARN_深入荒野|r << Alliance
.accept 30133 >>接任务: |cRXP_WARN_深入荒野|r << Horde
.target 梅·残酒
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 6) 四风谷 2
#displayname 第 4 章 - 四风谷第 2 部分
#title Valley of the Four Winds 2
#next 7) 卡桑琅丛林 2
step
#completewith next
.cooldown item,6948,>0,1
.hs >>用炉石回到雷霆足旅店
step
#loop
.goto 376,81.877,25.752,8,0
.goto 376,81.925,26.512,8,0
.goto 376,82.399,26.466,8,0
.goto 376,82.585,26.275,8,0
.goto 376,82.676,25.538,8,0
.goto 376,82.190,25.828,8,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿娜·雷蹄|r交谈
.turnin 29910 >>交任务: |cRXP_FRIENDLY_鼠辈泛滥|r
.target 阿娜·雷脚
step
.goto 376,81.59,25.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_昂·雷蹄|r交谈
.turnin 29940 >>交任务: |cRXP_FRIENDLY_夺回作物|r
.target 昂·雷脚
.accept 29911 >>接任务: |cRXP_WARN_近乎完美的作物|r
step
.goto 376,83.70,21.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_庞·雷蹄|r交谈
.turnin 29911 >>交任务: |cRXP_FRIENDLY_近乎完美的作物|r
.target 庞·雷脚
.accept 29912 >>接任务: |cRXP_WARN_热心的范妮小姐|r
step
>>拾取 |T645346:0|t[|cRXP_PICK_安的巨型粉红萝卜|r], |T645349:0|t[|cRXP_PICK_安的夏季西瓜|r] 和 |T461809:0|t[|cRXP_PICK_胖的超辣豆腐|r]
.collect 75259,1,29912,1
.goto 376,84.313,21.945
.collect 75258,1,29912,1
.goto 376,84.152,22.075
.collect 75256,1,29912,1
.goto 376,83.997,22.060
step
.goto 376,82.99,21.42
.gossipoption 40435 >>与|cRXP_FRIENDLY_范妮小姐|r交谈|cRXP_WARN_1|r
.timer 2,RP
step
.goto 376,82.99,21.42
.gossipoption 40431 >>与|cRXP_FRIENDLY_范妮小姐|r交谈|cRXP_WARN_2|r
.timer 2,RP
step
.goto 376,82.99,21.42
.gossipoption 40430 >>与|cRXP_FRIENDLY_范妮小姐|r交谈|cRXP_WARN_3|r
step
.convertquest 29875,29874 <<Alliance
.goto 376,84.09,21.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_晓|r交谈
.accept 30086 >>接任务: |cRXP_WARN_寻找隐秘大师|r
.disablecheckbox
.turnin 30086 >>交任务: |cRXP_FRIENDLY_寻找隐秘大师|r
.disablecheckbox
.accept 29871 >>接任务: |cRXP_WARN_聪明的阿西约|r
.accept 29872 >>接任务: |cRXP_WARN_林·柔掌|r
.accept 29875 >>接任务: |cRXP_WARN_康·棘杖|r
.target 晓
step
.goto 376,75.23,24.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁·雷蹄|r交谈
.turnin 29912 >>交任务: |cRXP_FRIENDLY_热心的范妮小姐|r
.target 梁·雷脚
.accept 29913 >>接任务: |cRXP_WARN_爱吃的肉|r
.accept 29914 >>接任务: |cRXP_WARN_送回猪圈|r
step
#completewith Ling
>>击杀 |cRXP_ENEMY_壮年穆山兽|r, 拾取 |T237348:0|t[|cRXP_LOOT_穆山兽肩肉排|r]
.complete 29913,1 
.mob 壮年穆山兽
step
>>拾取 |cRXP_FRIENDLY_健健|r
.goto 376,70.185,24.146
.complete 29914,1 
.target 健健
step
#loop
.goto 376,70.832,27.857,25,0
.goto 376,69.738,28.920,20,0
.goto 376,70.832,27.857,0
.goto 376,69.738,28.920,0
>>拾取 |cRXP_FRIENDLY_臭肥肥|r
.complete 29914,3 
.target 臭肥肥
step
#completewith next
>>击杀 |cRXP_ENEMY_龙角龟|r, 拾取 |T237349:0|t[|cRXP_LOOT_乌龟肉碎片|r]
.complete 29913,2 
.mob 龙角龟
step
#label Ling
#loop
.goto 376,66.654,28.408,10,0
.goto 376,67.082,30.280,10,0
.goto 376,66.654,28.408,0
.goto 376,67.082,30.280,0
>>拾取 |cRXP_FRIENDLY_灵灵|r
.complete 29914,2 
.target 灵灵
step
>>击杀 |cRXP_ENEMY_龙角龟|r, 拾取 |T237349:0|t[|cRXP_LOOT_乌龟肉碎片|r]
.complete 29913,2 
.goto 376,67.431,29.011
.goto 376,66.004,32.550,0
.mob 龙角龟
step
#loop
.goto 376,71.818,32.955,25,0
.goto 376,72.835,25.457,25,0
.goto 376,68.621,26.309,25,0
.goto 376,67.378,32.271,30,0
.goto 376,71.818,32.955,0
.goto 376,72.835,25.457,0
.goto 376,68.621,26.309,0
.goto 376,67.378,32.271,0
>>击杀 |cRXP_ENEMY_壮年穆山兽|r, 拾取 |T237348:0|t[|cRXP_LOOT_穆山兽肩肉排|r]
.complete 29913,1 
.mob 壮年穆山兽
step
.goto 376,75.22,24.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁·雷蹄|r交谈
.turnin 29913 >>交任务: |cRXP_FRIENDLY_爱吃的肉|r
.turnin 29914 >>交任务: |cRXP_FRIENDLY_送回猪圈|r
.accept 29915 >>接任务: |cRXP_WARN_邻居的义务|r
.target 梁·雷脚
step
.goto 376,78.11,32.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_牧羊少年弗朗西斯|r交谈
.turnin 29915 >>交任务: |cRXP_FRIENDLY_邻居的义务|r
.target 放羊的弗二郎
.accept 29916 >>接任务: |cRXP_WARN_利爪馋嘴|r
.accept 29917 >>接任务: |cRXP_WARN_卢佩罗|r
step
#completewith Lupello
>>击杀 |cRXP_ENEMY_偷猎者狼|r
.complete 29916,2 
.mob 行窃恶狼
step
#completewith Lupello
>>击杀 |cRXP_ENEMY_行窃平原鹰|r
.complete 29916,1 
.mob 行窃平原鹰
step
#label Lupello
.goto 376,81.220,40.110,12,0
.goto 376,82.351,38.481,12,0
.goto 376,82.002,39.723
>>击杀 |cRXP_ENEMY_卢佩罗|r
.complete 29917,1 
.mob 卢佩罗
step
#completewith ThievingWolf
#hidewindow
#loop
.goto 376,83.421,33.525,25,0
.goto 376,81.487,33.047,25,0
.goto 376,75.694,38.619,25,0
.goto 376,83.421,33.525,0
.goto 376,81.487,33.047,0
.goto 376,75.694,38.619,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_偷猎者狼|r
.complete 29916,2 
.mob 行窃恶狼
step
>>击杀 |cRXP_ENEMY_行窃平原鹰|r
.complete 29916,1 
.mob 行窃平原鹰
step
#label ThievingWolf
>>击杀 |cRXP_ENEMY_偷猎者狼|r
.complete 29916,2 
.mob 行窃恶狼
step
.goto 376,78.13,32.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_牧羊少年弗朗西斯|r交谈
.turnin 29916 >>交任务: |cRXP_FRIENDLY_利爪馋嘴|r
.turnin 29917 >>交任务: |cRXP_FRIENDLY_卢佩罗|r
.timer 12,Roleplay Duration
.target 放羊的弗二郎
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚·雷蹄|r交谈
.accept 29918 >>接任务: |cRXP_WARN_英勇的一课|r
.goto 376,78.188,32.806
.target 尚·雷脚
step
#loop
.goto 376,83.334,27.036,45,0
.goto 376,74.878,37.148,45,0
.goto 376,77.079,27.024,45,0
.goto 376,83.334,27.036,0
.goto 376,74.878,37.148,0
.goto 376,77.079,27.024,0
>>|cRXP_WARN_抬头望向天空, 对 |cRXP_ENEMY_巨型白色平原鹰|r 使用 |T134326:0|t[牧民的套索]|r
>>击杀 |cRXP_ENEMY_巨型白色平原鹰|r
.use 75208
.complete 29918,1 
.timer 6,RP
.mob 巨型白色平原鹰
step
#loop
.goto 376,74.69,34.6,8,0
.goto 376,74.41,34.5,8,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚·雷蹄|r交谈
.turnin 29918 >>交任务: |cRXP_FRIENDLY_英勇的一课|r
.target 尚·雷脚
step
.goto 376,75.28,35.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.accept 29919 >>接任务: |cRXP_WARN_英雄所喝略同|r
.target 陈·风暴烈酒
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
>>|cRXP_WARN_跟随 |cRXP_FRIENDLY_陈·风暴烈酒|r|r
*|cRXP_WARN_Open your boxes,euip new gear, combine your gems, and clean up your inventory|r
.goto 376,68.72,43.52
.skipgossip 1
.timer 147,Roleplay Duration
.complete 29919,1 
.target 陈·风暴烈酒
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥壶|r\|cRXP_FRIENDLY_陈·风暴烈酒|r和|cRXP_FRIENDLY_丽丽|r交谈
.turnin 29919 >>交任务: |cRXP_FRIENDLY_英雄所喝略同|r
.goto 376,68.72,43.12
.target +泥盏
.accept 29944 >>接任务: |cRXP_WARN_擒兔先擒首|r
.goto 376,68.876,43.155
.target +陈·风暴烈酒
.accept 29945 >>接任务: |cRXP_WARN_黄配红变橙色|r
.goto 376,68.881,43.308
.target +丽丽
step
#completewith Frenzyhop
>>拾取 |T133938:0|t[草甸金盏花]
.complete 29945,1 
step
#completewith Frenzyhop
>>击杀 |cRXP_ENEMY_棕皮雄鹿|r\|cRXP_ENEMY_棕皮雌鹿|r 和 |cRXP_ENEMY_棕皮幼鹿|r, 拾取 |T134830:0|t[一瓶动物血液]
.complete 29945,2 
.mob 棕皮雄鹿
.mob 棕皮雌鹿
.mob 棕皮幼鹿
step
.goto 376,68.55,38.24
>>击杀 |cRXP_ENEMY_"煎锅"艾尤|r
.complete 29944,1 
.mob “煎锅”艾尤
step
.goto 376,66.685,38.168
.line 376,66.063,37.171,66.534,37.736,66.690,38.577,66.195,39.540
>>击杀 |cRXP_ENEMY_"刃爪"吉纳亚|r
.complete 29944,2 
.mob “刃爪”吉纳亚
step
#label Frenzyhop
.goto 376,64.57,40.73
>>击杀 |cRXP_ENEMY_疯跳|r
.complete 29944,3 
.mob 疯跳
step
#completewith next
>>击杀 |cRXP_ENEMY_鹿群|r\|cRXP_ENEMY_放养的穆山兽|r 和 |cRXP_ENEMY_长牙嚎叫者|r, 拾取 |T134830:0|t[一瓶动物血液]
.complete 29945,2 
.mob 棕皮雄鹿
.mob 棕皮雌鹿
.mob 棕皮幼鹿
.mob 放养的穆山兽s
.mob 长牙嚎叫者
step
#loop
.goto 376,65.688,43.014,28,0
.goto 376,70.109,49.136,20,0
.goto 376,71.492,47.352,20,0
.goto 376,65.688,43.014,0
.goto 376,70.109,49.136,0
.goto 376,71.492,47.352,0
>>拾取 |T133938:0|t[草甸金盏花]
.complete 29945,1 
step
#loop
.goto 376,72.318,44.864,35,0
.goto 376,69.969,35.925,45,0
.goto 376,63.691,38.550,40,0
.goto 376,66.756,48.196,35,0
.goto 376,71.100,48.800,35,0
.goto 376,72.318,44.864,0
.goto 376,69.969,35.925,0
.goto 376,63.691,38.550,0
.goto 376,66.756,48.196,0
.goto 376,71.100,48.800,0
>>击杀 |cRXP_ENEMY_鹿群|r\|cRXP_ENEMY_放养的穆山兽|r 和 |cRXP_ENEMY_长牙嚎叫者|r, 拾取 |T134830:0|t[一瓶动物血液]
.complete 29945,2 
.mob 棕皮雄鹿
.mob 棕皮雌鹿
.mob 棕皮幼鹿
.mob 放养的穆山兽s
.mob 长牙嚎叫者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丽丽|r, |cRXP_FRIENDLY_陈·风暴烈酒|r 和 |cRXP_FRIENDLY_泥盏|r 交谈
.turnin 29945 >>交任务: |cRXP_FRIENDLY_黄配红变橙色|r
.accept 29947 >>接任务: |cRXP_WARN_真假胡萝卜|r
.goto 376,68.88,43.31
.target +丽丽
.turnin 29944 >>交任务: |cRXP_FRIENDLY_擒兔先擒首|r
.accept 29946 >>接任务: |cRXP_WARN_密径主母|r
.goto 376,68.878,43.140
.target +陈·风暴烈酒
.accept 29948 >>接任务: |cRXP_WARN_贼性难改|r
.goto 376,68.713,43.113
.target +泥盏
step
#completewith Chufa
>>|cRXP_WARN_不要击杀 |cRXP_ENEMY_挛踵囤积者|r|r
>>|cRXP_WARN_使用|r |T133960:0|t[刷成橙色的芜菁] |cRXP_WARN_扔到|r |cRXP_ENEMY_挛踵囤积者|r |cRXP_WARN_附近, 等计入任务进度后再扔下一个|r
.complete 29947,1 
.use 76370
.mob 挛踵囤积者
step
#completewith Chufa
>>在洞穴内拾取 |cRXP_PICK_一袋被偷的啤酒花|r
.complete 29948,1 
step
#completewith next
.goto 376,69.087,39.689,8 >>进入洞窟
step
#label Chufa
.goto 376,68.328,36.743,12,0
.goto 376,67.89,37.46
>>在洞穴内击杀 |cRXP_ENEMY_地栗|r
.complete 29946,1 
.mob 地栗
step
#completewith next
>>|cRXP_WARN_不要击杀 |cRXP_ENEMY_挛踵囤积者|r|r
>>|cRXP_WARN_使用|r |T133960:0|t[刷成橙色的芜菁] |cRXP_WARN_扔到|r |cRXP_ENEMY_挛踵囤积者|r |cRXP_WARN_附近, 等计入任务进度后再扔下一个|r
.complete 29947,1 
.mob 挛踵囤积者
step
#loop
.goto 376,66.700,37.985,15,0
.goto 376,68.863,36.211,15,0
.goto 376,69.472,34.920,15,0
.goto 376,68.909,36.655,15,0
.goto 376,66.700,37.985,0
.goto 376,68.863,36.211,0
.goto 376,69.472,34.920,0
.goto 376,68.909,36.655,0
>>拾取 |cRXP_PICK_一袋被偷的啤酒花|r
.complete 29948,1 
step
#loop
.goto 376,65,141,38.141,30,0
.goto 376,69.133,40.985,30,0
.goto 376,68.399,33.112,30,0
.goto 376,65,141,38.141,0
.goto 376,69.133,40.985,0
.goto 376,68.399,33.112,0
>>|cRXP_WARN_不要击杀 |cRXP_ENEMY_挛踵囤积者|r|r
>>|cRXP_WARN_使用|r |T133960:0|t[刷成橙色的芜菁] |cRXP_WARN_扔到|r |cRXP_ENEMY_挛踵囤积者|r |cRXP_WARN_附近, 等计入任务进度后再扔下一个|r
.use 76370
.complete 29947,1 
.mob 挛踵囤积者
step
#completewith next
.goto 376,65.9,38.34,20 >>离开洞穴
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泥盏|r, |cRXP_FRIENDLY_丽丽|r 和 |cRXP_FRIENDLY_陈·风暴烈酒|r 交谈
.turnin 29948 >>交任务: |cRXP_FRIENDLY_贼性难改|r
.goto 376,68.71,43.12
.target +泥盏
.turnin 29947 >>交任务: |cRXP_FRIENDLY_真假胡萝卜|r
.goto 376,68.88,43.31
.target +丽丽
.turnin 29946 >>交任务: |cRXP_FRIENDLY_密径主母|r
.accept 29949 >>接任务: |cRXP_WARN_遗产|r
.timer 6,Roleplay Duration
.goto 376,68.881,43.144
.target +陈·风暴烈酒
step
.goto 376,68.77,43.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽丽|r交谈
.turnin 29949 >>交任务: |cRXP_FRIENDLY_遗产|r
.accept 29950 >>接任务: |cRXP_WARN_丽丽的假日|r
.target 丽丽
step
>>若 |cRXP_FRIENDLY_丽丽|r 已消失, 使用 |T413582:0|t[丽丽的许愿石] |cRXP_WARN_在营地附近重新召唤她
.goto 376,60.75,35.78
.use 763650
.complete 29950,2 
step << Alliance
.achievement 6846,2 >>点击 |cRXP_PICK_卷轴|r
.goto 418,30.55,38.59
step
.goto 376,61.23,34.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_聪明的阿西约|r交谈
.turnin 29871 >>交任务: |cRXP_FRIENDLY_聪明的阿西约|r
.accept 29577 >>接任务: |cRXP_WARN_阿西约的预见|r
.timer 47,Roleplay Duration
.target 聪明的阿西约
step
.goto 376,60.61,33.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_颜|r交谈
.accept 29757 >>接任务: |cRXP_WARN_蛤蟆酱|r
.target 颜
step
.goto 376,59.82,27.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_张月|r交谈
.accept 29600 >>接任务: |cRXP_WARN_果断措施|r
.target 张月
step
#completewith RazorbackSnapper
#hidewindow
#loop
.goto 376,64.425,27.991,22,0
.goto 376,64.613,24.968,22,0
.goto 376,62.705,24.250,22,0
.goto 376,61.884,26.753,22,0
.goto 376,64.425,27.991,0
.goto 376,64.613,24.968,0
.goto 376,62.705,24.250,0
.goto 376,61.884,26.753,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_刀背撕咬者|r
.complete 29600,1 
.mob 刀背撕咬者
step
>>|cRXP_WARN_点击 |cRXP_PICK_冒泡的蛤蟆卵|r (水泡)|r
.complete 29757,1 
step
#label RazorbackSnapper
>>击杀 |cRXP_ENEMY_刀背撕咬者|r
.complete 29600,1 
.mob 刀背撕咬者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_聪明的阿西约|r交谈
.goto 376,59.250,27.563
.skipgossip 56113
.complete 29577,1 
step
.goto 376,59.83,27.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_张月|r交谈
.turnin 29577 >>交任务: |cRXP_FRIENDLY_阿西约的预见|r
.turnin 29600 >>交任务: |cRXP_FRIENDLY_果断措施|r
.accept 29581 >>接任务: |cRXP_WARN_金色梦境|r
.target 张月
step
>>击杀 |cRXP_ENEMY_科罗什|r, 拾取 |T134964:0|t[科罗什的背部]
.goto 376,65.35,25.73
.collect 83767,1,29758
.accept 29758 >>接任务: |cRXP_WARN_猜猜谁回来了|r
.mob 科罗什
step
>>拾取 |cRXP_PICK_入梦叶树丛|r
.goto 376,65.24,26.28
.complete 29581,1 
step
.goto 376,60.62,33.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_颜|r交谈
.turnin 29581 >>交任务: |cRXP_FRIENDLY_金色梦境|r
.turnin 29757 >>交任务: |cRXP_FRIENDLY_蛤蟆酱|r
.turnin 29758 >>交任务: |cRXP_FRIENDLY_猜猜谁回来了|r
.target 颜
step
.goto 376,68.71,43.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥盏|r交谈
.accept 29951 >>接任务: |cRXP_WARN_泥水|r
.target 泥盏
step
>>若 |cRXP_FRIENDLY_丽丽|r 已消失, 使用 |T413582:0|t[丽丽的许愿石] |cRXP_WARN_在瀑布附近重新召唤她
.goto 376,75.45,43.00
.use 763650
.complete 29950,3 
step
#loop
.goto 376,74.343,48.529,25,0
.goto 376,72.876,55.405,25,0
.goto 376,69.513,56.363,25,0
.goto 376,67.209,60.601,30,0
.goto 376,69.113,61.606,25,0
.goto 376,74.343,48.529,0
.goto 376,72.876,55.405,0
.goto 376,69.513,56.363,0
.goto 376,67.209,60.601,0
.goto 376,69.113,61.606,0
>>|cRXP_WARN_点击 |cRXP_PICK_泥水|r, 直到药剂瓶装满|r
.complete 29951,1 
step
.goto 376,63.56,58.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工匠楚|r交谈
.accept 30059 >>接任务: |cRXP_WARN_飞蛾叛乱|r
.target 工匠老楚
step
>>若 |cRXP_FRIENDLY_丽丽|r 已消失, 使用 |T413582:0|t[丽丽的许愿石] |cRXP_WARN_在村庄中心附近重新召唤她
.goto 376,62.55,59.11
.use 763650
.complete 29950,1 
step
.goto 376,62.67,59.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蔡丝匠|r交谈
.accept 30072 >>接任务: |cRXP_WARN_蚕丝从哪里来|r
.target 蔡丝匠
step
>>|cRXP_WARN_点击 |cRXP_PICK_桑葚桶|r|r
.goto 376,61.13,56.73
.complete 30072,1 
step
>>点击 |cRXP_FRIENDLY_饥饿的蚕宝宝|r
.goto 376,61.209,60.834,15,0
.complete 30072,2 
.target 饥饿的蚕宝宝
step
#completewith next
.goto 376,62.48,61.58,10 >>进入小屋
step
>>|cRXP_WARN_点击 |cRXP_PICK_蚕茧桶|r|r
.goto 376,62.36,62.49
.complete 30072,3 
step
#completewith next
.goto 376,62.48,61.58,10 >>离开小屋
step
#loop
.goto 376,61.209,60.834,15,0
.goto 376,62.378,56.573,15,0
.goto 376,61.209,60.834,0
.goto 376,62.378,56.573,0
>>点击 |cRXP_FRIENDLY_饥饿的蚕宝宝|r
.complete 30072,2 
.target 饥饿的蚕宝宝
step
#completewith TinyMutatedSilkmoth
#hidewindow
#loop
.goto 376,64.020,55.545,35,0
.goto 376,66.575,53.118,35,0
.goto 376,68.216,54.578,35,0
.goto 376,64.506,63.334,35,0
.goto 376,64.020,55.545,0
.goto 376,66.575,53.118,0
.goto 376,68.216,54.578,0
.goto 376,64.506,63.334,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_小变异魔丝蛾|r
.complete 30059,2 
.mob 小变异魔丝蛾
step
>>击杀 |cRXP_ENEMY_变异的魔丝蛾|r
.complete 30059,1 
.mob 变异的魔丝蛾
step
#label TinyMutatedSilkmoth
>>击杀 |cRXP_ENEMY_小变异魔丝蛾|r
.complete 30059,2 
.mob 小变异魔丝蛾
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工匠楚|r和|cRXP_FRIENDLY_郭大师|r交谈
.turnin 30059 >>交任务: |cRXP_FRIENDLY_飞蛾叛乱|r
.goto 376,63.55,58.46
.target +工匠老楚
.accept 30058 >>接任务: |cRXP_WARN_魔丝勒斯！|r
.goto 376,63.625,58.526
.target 郭大师
step
#completewith next
.goto 376,64.364,57.972
.cast 6478 >>|cRXP_WARN_点击 |cRXP_PICK_魔丝勒斯诱饵|r|r
.timer 14,Roleplay Duration
step
.goto 376,62.66,59.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蔡丝匠|r交谈
.turnin 30072 >>交任务: |cRXP_FRIENDLY_蚕丝从哪里来|r
.target 蔡丝匠
step
>>|cRXP_WARN_点击 |cRXP_PICK_魔丝勒斯诱饵|r 触发剧情|r
>>击杀 |cRXP_ENEMY_魔丝勒斯|r
.goto 376,64.364,57.972
.complete 30058,1 
.mob Mothallus
step
.goto 376,63.63,58.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_郭大师|r交谈
.turnin 30058 >>交任务: |cRXP_FRIENDLY_魔丝勒斯！|r
.target 郭大师
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥盏|r和|cRXP_FRIENDLY_丽丽|r交谈
.turnin 29951 >>交任务: |cRXP_FRIENDLY_泥水|r
.goto 376,68.72,43.11
.target +泥盏
step
#completewith next
.cast 106276 >>使用 |T135975:0|t[丽丽的许愿石] 召唤 |cRXP_FRIENDLY_丽丽|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽丽|r交谈
.turnin 29950 >>交任务: |cRXP_FRIENDLY_丽丽的假日|r
.timer 15,Roleplay Duration
.goto 376,68.78,43.44
.target +丽丽
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.accept 29952 >>接任务: |cRXP_WARN_破碎的梦想|r
.goto 376,68.853,43.400
.target 陈·风暴烈酒
step
#completewith ListenToChen
#label TalkChenStormstout
.goto 376,68.853,43.400
.gossipoption 40423 >>对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
step
#requires TalkChenStormstout
#completewith next
+|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
.use 211279
.usespell 436523
.usespell 433397
step
#label ListenToChen
>>|cRXP_WARN_击杀怪物后跟随 |cRXP_FRIENDLY_高老伯|r, 不要跑在他前面|r
>>用 (1) |T572033:0|t[风暴烈酒功] 击杀 |cRXP_ENEMY_恣意的啤酒元素|r 和 |cRXP_ENEMY_悟克悟克|r, 用 (2) |T132805:0|t[饮用] 恢复生命
.goto 376,34.761,70.381,15,0
.goto 376,35.841,72.712,15,0
.goto 376,36.687,72.242,15,0
.goto 376,36.364,71.080,15,0
.goto 376,34.611,70.778
.skipgossip 56133,1
.complete 29952,1 
.mob 恣意的啤酒元素
.mob 悟克悟克
step
.goto 376,68.85,43.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 29952 >>交任务: |cRXP_FRIENDLY_破碎的梦想|r
.target 陈·风暴烈酒
.accept 30046 >>接任务: |cRXP_WARN_陈的决意|r
step
#completewith next
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.goto 376,55.89,49.44
.turnin 30046 >>交任务: |cRXP_FRIENDLY_陈的决意|r
.accept 30048 >>接任务: |cRXP_WARN_丽丽和谷物|r
.accept 30049 >>接任务: |cRXP_WARN_扛不动水|r
.accept 30053 >>接任务: |cRXP_WARN_寻找啤酒花|r
.target 陈·风暴烈酒
step
.goto 376,55.14,47.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_刻石者马克|r交谈
.accept 32045 >>接任务: |cRXP_WARN_水的孩子|r
.target 刻石者马克
step
#completewith next
#loop
.goto 376,55.24,50.69,10,0
.goto 376,54.96,50.54,10,0
.goto 376,55.07,50.29,10,0
.goto 376,54.93,50.14,10,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板雷岚|r交谈
.home >>将 [炉石] 设为懒惰的芜菁
.target 旅店老板雷岚
step
.goto 376,52.69,62.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽丽|r交谈
.turnin 30048 >>交任务: |cRXP_FRIENDLY_丽丽和谷物|r
.accept 30031 >>接任务: |cRXP_WARN_尝味|r
.target 丽丽
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_种粮状元老凯|r和|cRXP_FRIENDLY_种粮大户小潘|r交谈
.accept 30029 >>接任务: |cRXP_WARN_玩个小把戏|r
.goto 376,52.738,62.994
.target +种粮状元老凯
.accept 30030 >>接任务: |cRXP_WARN_斩草除根|r
.goto 376,52.595,62.986
.target +种粮大户小潘
step
#completewith AgedGrain
>>击杀 |cRXP_ENEMY_狡猾的玉蜀黍窃贼|r
.complete 30029,1 
.mob 狡猾的玉蜀黍窃贼
step
>>|cRXP_WARN_点击 |cRXP_PICK_轻质谷物|r|r
.goto 376,53.688,63.296
.complete 30031,2 
step
>>|cRXP_WARN_点击 |cRXP_PICK_新鲜谷物|r|r
.goto 376,53.036,64.488
.complete 30031,4 
step
#completewith next
.goto 376,51.589,64.262,8 >>|cRXP_WARN_进入磨坊|r
step
#title 向上走
.goto 376,51.449,64.484
>>在磨坊内击杀 |cRXP_ENEMY_科尔南|r
.complete 30030,1 
.mob 科尔南
step
>>|cRXP_WARN_点击 |cRXP_PICK_发芽的谷物|r|r
.goto 376,50.718,61.954
.complete 30031,3 
step
#label AgedGrain
>>|cRXP_WARN_点击 |cRXP_PICK_陈年谷物|r|r
.goto 376,51.202,60.831
.complete 30031,1 
step
#loop
.goto 376,53.887,62.260,30,0
.goto 376,52.820,65.814,30,0
.goto 376,50.537,60.261,40,0
.goto 376,53.887,62.260,0
.goto 376,52.820,65.814,0
.goto 376,50.537,60.261,0
>>击杀 |cRXP_ENEMY_狡猾的玉蜀黍窃贼|r
.complete 30029,1 
.mob 狡猾的玉蜀黍窃贼
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽丽|r\|cRXP_FRIENDLY_种粮大户小潘|r和|cRXP_FRIENDLY_种粮状元老凯|r交谈
.turnin 30031 >>交任务: |cRXP_FRIENDLY_尝味|r
.goto 376,52.69,62.84
.target +丽丽
.turnin 30030 >>交任务: |cRXP_FRIENDLY_斩草除根|r
.goto 376,52.595,62.975
.target +种粮大户小潘
.accept 30028 >>接任务: |cRXP_WARN_找回谷物|r
.turnin 30029 >>交任务: |cRXP_FRIENDLY_玩个小把戏|r
.accept 30032 >>接任务: |cRXP_WARN_寻找更好的大麦|r
.goto 376,52.743,63.001
.target +种粮状元老凯
step
#completewith next
>>|cRXP_WARN_点击 |cRXP_PICK_一袋失窃的麦芽|r 拾取 |T133849:0|t[谷物袋]
.complete 30028,1 
step
>>|cRXP_WARN_点击 |cRXP_PICK_速降绳|r
.goto 376,51.26,77.49
.complete 30032,1 
step
.isOnQuest 30032
#completewith next
.goto 376,53.599,76.171,8 >>|cRXP_WARN_进入洞窟|r
step
>>|cRXP_WARN_点击 |cRXP_PICK_发芽的岩洞大麦|r|r
.goto 376,53.35,75.29
.complete 30032,2 
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 卡桑琅丛林 2
#displayname 第 5 章 - 卡萨兰荒野第 2 部分
#title Krasarang Wilds 2
#next 8) 四风谷 3
step << Horde
.goto 418,67.62,25.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.accept 30352 >>接任务: |cRXP_WARN_猎鹤|r
.accept 30353 >>接任务: |cRXP_WARN_唯利是图|r
.target 达格·自走炸弹
step << Horde
#completewith CourierFound
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Horde
#completewith CourierFound
>>击杀 |cRXP_ENEMY_卡萨里女猎手|r, 拾取 |cRXP_LOOT_虎血瓶|r
.complete 30353,1 
.mob 卡桑利雌虎
step << Horde
.goto 418,68.80,22.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_切森·逐晨者|r交谈
.accept 30179 >>接任务: |cRXP_WARN_中毒！|r
.target 切森·逐晨者
step << Horde
#loop
.goto 418,67.565,24.310,30,0
.goto 418,65.963,19.910,30,0
.goto 418,69.549,18.694,30,0
.goto 418,67.565,24.310,0
.goto 418,65.963,19.910,0
.goto 418,69.549,18.694,0
.complete 30179,1 
step << Horde
#label CourierFound
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_朱之哨站信使|r交谈
.goto 418,62.55,25.45
.complete 30133,1 
.target 朱家堡信使
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r和|cRXP_FRIENDLY_科尔·血牙|r交谈
.turnin 30179 >>交任务: |cRXP_FRIENDLY_中毒！|r
.goto 418,59.89,24.69
.target +烈日行者德兹科
.accept 30124 >>接任务: |cRXP_WARN_敌明我暗！|r
.goto 418,59.875,24.803
.target +科尔·血牙
step << Horde
.isOnQuest 29875
.goto 418,60.09,25.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.turnin 29875 >>交任务: |cRXP_FRIENDLY_康·棘杖|r
.accept 30123 >>接任务: |cRXP_WARN_飞掠者炖肉|r
.target 康·棘杖
step << Horde
#optional
.goto 418,60.09,25.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.accept 30123 >>接任务: |cRXP_WARN_飞掠者炖肉|r
.target 康·棘杖
step << Horde
#completewith next
>>击杀 |cRXP_FRIENDLY_丛林踏波者|r, 拾取 |T237415:0|t[|cRXP_LOOT_完整的飞掠者腺体|r]
.complete 30123,1 
.mob 丛林踏波者
step << Horde
#loop
.goto 418,62.343,30.723,15,0
.goto 418,61.027,29.295,15,0
.goto 418,62.343,30.723,0
.goto 418,61.027,29.295,0
>>击杀 |cRXP_ENEMY_达纳苏斯先锋|r
.complete 30124,1 
.mob 达纳苏斯先锋
step << Horde
#completewith 斯基特erGlands
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Horde
#completewith 斯基特erGlands
>>击杀 |cRXP_FRIENDLY_丛林踏波者|r, 拾取 |T237415:0|t[|cRXP_LOOT_完整的飞掠者腺体|r]
.complete 30123,1 
.mob 丛林踏波者
step << Horde
#label 斯基特erGlands
#loop
.goto 418,63.44,37.62,45,0
.goto 418,65.40,30.81,30,0
.goto 418,69.69,30.41,45,0
.goto 418,72.12,21.28,55,0
.goto 418,64.77,21.72,40,0
.goto 418,61.02,22.06,55,0
.goto 418,63.44,37.62,0
.goto 418,65.40,30.81,0
.goto 418,69.69,30.41,0
.goto 418,72.12,21.28,0
.goto 418,64.77,21.72,0
.goto 418,61.02,22.06,0
>>击杀 |cRXP_ENEMY_卡萨里女猎手|r, 拾取 |cRXP_LOOT_虎血瓶|r
.complete 30353,1 
.mob 卡桑利雌虎
step << Horde
#completewith CarpHunterSlain
#hidewindow
#loop
.goto 418,60.77,22.11,45,0
.goto 418,65.09,22.15,35,0
.goto 418,65.20,32.70,30,0
.goto 418,63.44,37.62,45,0
.goto 418,60.77,22.11,0
.goto 418,65.09,22.15,0
.goto 418,65.20,32.70,0
.goto 418,63.44,37.62,0
+1
step << Horde
#completewith next
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Horde
>>击杀 |cRXP_FRIENDLY_丛林踏波者|r, 拾取 |T237415:0|t[|cRXP_LOOT_完整的飞掠者腺体|r]
.complete 30123,1 
.mob 丛林踏波者
step << Horde
#label CarpHunterSlain
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Horde
.goto 418,67.63,25.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.turnin 30352 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.accept 31262 >>接任务: |cRXP_WARN_猎鹤高手：针尖铁嘴|r
.turnin 30353 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.accept 31260 >>接任务: |cRXP_WARN_唯利是图：查舍恩|r
.target 达格·自走炸弹
step << Horde
>>击杀 |cRXP_ENEMY_针尖铁嘴|r, 拾取 |T133707:0|t[|cRXP_LOOT_针喙|r]
.goto 418,62.73,20.46
.complete 31262,1 
.mob 针尖铁嘴
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r和|cRXP_FRIENDLY_科尔·血牙|r交谈
.turnin 30123 >>交任务: |cRXP_FRIENDLY_飞掠者炖肉|r
.goto 418,60.09,25.00
.target +康·棘杖
.turnin 30124 >>交任务: |cRXP_FRIENDLY_敌明我暗！|r
.accept 30127 >>接任务: |cRXP_WARN_都阳的威胁|r
.goto 418,59.87,24.80
.target +科尔·血牙
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r和|cRXP_FRIENDLY_康·棘杖|r交谈
.accept 30130 >>接任务: |cRXP_WARN_草药治疗|r
.goto 418,59.883,24.694
.target +烈日行者德兹科
.accept 30129 >>接任务: |cRXP_WARN_魔古的阴谋|r
.goto 418,60.09,25.00
.target +康·棘杖
step << Horde
>>击杀 |cRXP_ENEMY_查辛妮|r, 拾取 |T134817:0|t[|cRXP_LOOT_古老的虎血|r]
.goto 418,61.81,32.09
.complete 31260,1 
.mob Ancient Tiger's Blood
step << Alliance
.goto 418,67.62,25.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.accept 30352 >>接任务: |cRXP_WARN_猎鹤|r
.accept 30353 >>接任务: |cRXP_WARN_唯利是图|r
.target 达格·自走炸弹
step << Alliance
#completewith Zhu's Watch Courier
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Alliance
#completewith Zhu's Watch Courier
>>击杀 |cRXP_ENEMY_卡萨里女猎手|r, 拾取 |cRXP_LOOT_虎血瓶|r
.complete 30353,1 
.mob 卡桑利雌虎
step << Alliance
#label Zhu's Watch Courier
.goto 418,67.94,31.53
>>点击 |cRXP_PICK_东北地牢镣铐|r
.complete 30274,1 
step << Alliance
#completewith next
.goto 418,67.46,32.3,35 >>|cRXP_WARN_走进紫色气泡|r
step << Alliance
.goto 418,66.69,31.57
>>点击 |cRXP_PICK_西北地牢镣铐|r
.complete 30274,2 
step << Alliance
.goto 418,66.26,30.95
>>|cRXP_WARN_跟随箭头指引|r
.accept 30274 >>接任务: |cRXP_WARN_奥法地牢|r
.complete 30178,1 
.skipgossip
.target 朱家堡信使
step << Alliance
.goto 418,66.70,33.68
>>点击 |cRXP_PICK_西南地牢镣铐|r
.complete 30274,3 
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r\|cRXP_FRIENDLY_丽娅拉|r和|cRXP_FRIENDLY_康·棘杖|r交谈
.turnin 30274 >>交任务: |cRXP_FRIENDLY_奥法地牢|r
.accept 30344 >>接任务: |cRXP_WARN_失落的王朝|r
.goto 418,67.45,32.64
.accept 30384 >>接任务: |cRXP_WARN_敌明我暗！|r
.goto 418,67.45,32.71
.turnin 29874 >>交任务: |cRXP_FRIENDLY_康·棘杖|r
.accept 30350 >>接任务: |cRXP_WARN_飞掠杂碎汤|r
.goto 418,67.36,32.75
.target 康·棘杖
.target 博学者瓦尔德林
.target 丽娅拉
step << Alliance
#completewith Vial of Tiger Blood
>>击杀 |cRXP_ENEMY_丛林踏波者|r, 拾取 |cRXP_LOOT_完整的踏波者腺体|r
.complete 30350,1 
step << Alliance
#completewith Vial of Tiger Blood
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Alliance
#completewith Vial of Tiger Blood
>>击杀 |cRXP_ENEMY_卡萨里女猎手|r, 拾取 |cRXP_LOOT_虎血瓶|r.|cRXP_WARN_大多数处于潜行状态, 通常藏在树旁|r
.complete 30353,1 
.mob 卡桑利雌虎
step << Alliance
#hidewindow
#label Vial of Tiger Blood
.goto 418,65.44,35.54,20,0
.goto 418,64.7,35.17,20,0
.goto 418,63.89,35.25,20,0
.goto 418,63.78,36.24,20,0
.goto 418,62.66,36.89,20,0
.goto 418,62.12,36.21,20,0
.goto 418,61.57,37.11,20,0
.goto 418,60.53,37.18,20,0
.goto 418,60.34,36.39,20,0
.goto 418,59.51,36.21,20,0
.goto 418,60.89,34,20,0
.goto 418,61.46,34.78,20,0
.goto 418,62.13,33.6,20,0
.goto 418,63.51,32.23,20,0
.goto 418,64.63,31.86,20,0
.goto 418,64.63,30.79,20,0
.goto 418,63.32,30.79,20,0
.goto 418,61.66,32.92,20,0
.goto 418,61.9,30.26,20,0
.goto 418,61.1,28.9,20,0
.goto 418,61.69,27.68,20,0
.goto 418,62.57,28.66,20,0
.goto 418,63.44,27.13,20,0
.goto 418,63.01,25.74,20,0
.goto 418,63.87,24.98,20
step << Alliance
#completewith next
>>击杀 |cRXP_ENEMY_烈日行者斥候|r
.complete 30384,1 
.mob sunwalker scout
step
.isQuestComplete 30352
.isQuestComplete 30353
.goto 418,67.63,25.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.turnin 30352 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.turnin 30353 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.accept 31260 >>接任务: |cRXP_WARN_唯利是图：查舍恩|r
.accept 31262 >>接任务: |cRXP_WARN_猎鹤高手：针尖铁嘴|r
.target 达格·自走炸弹
step << Alliance
#loop
.goto 418,63.94,24.99,30,0
.goto 418,66.8,25.15,30,0
.goto 418,67.36,26.95,30,0
>>击杀 |cRXP_ENEMY_烈日行者斥候|r
.complete 30384,1 
.mob sunwalker scout
step << Alliance
#loop
.goto 418,69.73,23.71,25,0
.goto 418,69.59,22.68,25,0
.goto 418,69.56,20.78,25,0
.goto 418,68.89,20.6,25,0
.goto 418,66.89,20.32,25,0
.goto 418,66.72,23.3,25,0
>>点击 |cRXP_PICK_王朝石板|r
.complete 30344,1 
step << Alliance
.isQuestAvailable 30352
.isQuestAvailable 30353
#loop
.goto 418,71.7,23.47,20,0
.goto 418,70.47,25.23,20,0
.goto 418,70.6,26.06,20,0
.goto 418,70.23,28.97,20,0
.goto 418,70.73,29.82,20,0
>>击杀 |cRXP_ENEMY_卡萨里女猎手|r, 拾取 |cRXP_LOOT_虎血瓶|r.|cRXP_WARN_大多数处于潜行状态, 通常藏在树旁|r
.complete 30353,1 
.mob 卡桑利雌虎
step
.isQuestAvailable 30352
.isQuestAvailable 30353
#hidewindow
#completewith Carp Hunter
.goto 418,67.69,30.25,30,0
.goto 418,64.56,30.29,30,0
.goto 418,63.88,28.24,30,0
.goto 418,65.56,26.2,30,0
.goto 418,68.22,27.7,30,0
#loop
+1
step << Alliance
#completewith next
.isQuestAvailable 30352
.isQuestAvailable 30353
>>击杀 |cRXP_ENEMY_丛林踏波者|r, 拾取 |cRXP_LOOT_完整的踏波者腺体|r
.complete 30350,1 
step << Alliance
#label Carp Hunter
.isQuestAvailable 30352
.isQuestAvailable 30353
>>击杀 |cRXP_ENEMY_鲤鱼猎手|r
.complete 30352,1 
.mob carp hunter
step << Alliance
.goto 418,67.63,25.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.turnin 30352 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.turnin 30353 >>交任务: |cRXP_FRIENDLY_猎鹤|r
.accept 31260 >>接任务: |cRXP_WARN_唯利是图：查舍恩|r
.accept 31262 >>接任务: |cRXP_WARN_猎鹤高手：针尖铁嘴|r
.target 达格·自走炸弹
step << Alliance
#completewith Chasheen
.isOnQuest 31260
>>击杀 |cRXP_ENEMY_丛林踏波者|r, 拾取 |cRXP_LOOT_完整的踏波者腺体|r
.complete 30350,1 
step << Alliance
.isOnQuest 31260
.goto 418,62.84,20.33
>>击杀 |cRXP_ENEMY_针喙|r
.complete 31262,1 
.mob 针尖铁嘴
step << Alliance
.isOnQuest 31260
.goto 418,61.65,31.97
#label Chasheen
>>击杀 |cRXP_ENEMY_查辛妮|r, 拾取 |cRXP_LOOT_古老的虎血|r
.complete 31260,1 
.mob 查辛妮
step << Alliance
.isOnQuest 31260
>>击杀 |cRXP_ENEMY_丛林踏波者|r, 拾取 |cRXP_LOOT_完整的踏波者腺体|r
.complete 30350,1 
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r\|cRXP_FRIENDLY_丽娅拉|r和|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.turnin 30350 >>交任务: |cRXP_FRIENDLY_飞掠杂碎汤|r
.goto 418,67.45,32.64
.target +康·棘杖
.turnin 30384 >>交任务: |cRXP_FRIENDLY_敌明我暗！|r
.goto 418,67.45,32.71
.target +丽娅拉
.turnin 30344 >>交任务: |cRXP_FRIENDLY_失落的王朝|r
.goto 418,67.46,32.64
.target +博学者瓦尔德林
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r\|cRXP_FRIENDLY_康·棘杖|r和|cRXP_FRIENDLY_丽娅拉|r交谈
.accept 30346 >>接任务: |cRXP_WARN_青春之池在哪里|r
.goto 418,67.45,32.64
.accept 30349 >>接任务: |cRXP_WARN_都阳的威胁|r
.goto 418,67.45,32.71
.accept 30351 >>接任务: |cRXP_WARN_莲叶茶|r
.goto 418,67.37,32.76
.target 丽娅拉
.target 康·棘杖
.target 博学者瓦尔德林
step << Alliance
.goto 418,67.63,25.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.turnin 31260 >>交任务: |cRXP_FRIENDLY_唯利是图：查舍恩|r
.turnin 31262 >>交任务: |cRXP_FRIENDLY_猎鹤高手：针尖铁嘴|r
step
#include 3) 卡桑琅丛林 多加尼
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔·血牙|r和|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.turnin 30127 >>交任务: |cRXP_FRIENDLY_都阳的威胁|r
.goto 418,59.88,24.81
.target +科尔·血牙
.turnin 30128 >>交任务: |cRXP_FRIENDLY_青春之池|r
.turnin 30130 >>交任务: |cRXP_FRIENDLY_草药治疗|r
.accept 30131 >>接任务: |cRXP_WARN_生命|r
.goto 418,59.881,24.700
.target +烈日行者德兹科
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.goto 418,59.881,24.700
.skipgossip 58113,1
.complete 30131,1 
.target 烈日行者德兹科
step << Horde
.goto 418,60.41,25.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.turnin 30131 >>交任务: |cRXP_FRIENDLY_生命|r
.accept 30132 >>接任务: |cRXP_WARN_一路向西|r
.target 烈日行者德兹科
step << Horde
.goto 418,67.63,25.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达格·自走炸弹|r交谈
.turnin 31260 >>交任务: |cRXP_FRIENDLY_唯利是图：查舍恩|r
.turnin 31262 >>交任务: |cRXP_FRIENDLY_猎鹤高手：针尖铁嘴|r
.target 达格·自走炸弹
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者斥候|r交谈
.goto 418,43.80,42.77
.complete 30132,1 
.target 烈日行者斥候
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈, 他就在你身边
.turnin 30351 >>交任务: |cRXP_FRIENDLY_莲叶茶|r
.target 康·棘杖
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r和|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.turnin 30349 >>交任务: |cRXP_FRIENDLY_都阳的威胁|r
.goto 418,67.45,32.7
.turnin 30347 >>交任务: |cRXP_FRIENDLY_青春之池|r
.accept 30348 >>接任务: |cRXP_WARN_长生不老？|r
.timer 22,RP
.goto 418,67.46,32.64
.target 博学者瓦尔德林
.target 丽娅拉
step << Alliance
.goto 418,67.42,32.41
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30348,1 
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r和|cRXP_FRIENDLY_丽娅拉|r交谈
.turnin 30348 >>交任务: |cRXP_FRIENDLY_长生不老？|r
.goto 418,67.46,32.64
.accept 30363 >>接任务: |cRXP_WARN_准备进攻|r
.goto 418,67.45,32.7
.target 丽娅拉
step << Alliance
.goto 418,43.93,43.41
.isOnQuest 30269
>>与 |cRXP_FRIENDLY_先遣队哨兵|r 互动
.complete 30363,1 
.timer 58, RP
.target 先遣队哨兵
step
.goto 418,44.20,42.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科洛·迷雾行者|r交谈
.turnin 30178 >>交任务: |cRXP_FRIENDLY_深入荒野|r
.target 科洛·迷雾行者
step
#include 3) 卡桑琅丛林 鹤翼
step
.goto 418,29.67,39.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_疲惫的书生|r交谈
.accept 30168 >>接任务: |cRXP_WARN_野蛮入侵|r
.accept 30169 >>接任务: |cRXP_WARN_掠夺者首领司罗凡|r
.target 疲惫的苏什
step
#completewith next
>>击杀 |cRXP_FRIENDLY_河刃鲜肉猎人|r, 拾取 |T132594:0|t[|cRXP_LOOT_遭劫的锦鱼战利品|r]
.complete 30168,1 
.mob 河刃鲜肉猎人
step
.goto 418,31.80,28.97
>>击杀 |cRXP_ENEMY_司罗凡|r
.complete 30169,1 
.mob 司罗凡
step
#loop
.goto 418,35.86,80.50,35,0
.goto 418,31.56,49.07,42,0
.goto 418,27.90,44.32,42,0
.goto 418,31.80,28.97,42,0
>>击杀 |cRXP_FRIENDLY_河刃鲜肉猎人|r 和 |cRXP_FRIENDLY_河刃屠杀者|r, 拾取 |T132594:0|t[|cRXP_LOOT_遭劫的锦鱼战利品|r]
.complete 30168,1 
.mob 河刃鲜肉猎人
step << Alliance
.achievement 6846,3 >>点击 |cRXP_PICK_卷轴|r
.goto 418,30.55,38.59
step
.goto 418,29.67,39.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_疲惫的书生|r交谈
.turnin 30168 >>交任务: |cRXP_FRIENDLY_野蛮入侵|r
.turnin 30169 >>交任务: |cRXP_FRIENDLY_掠夺者首领司罗凡|r
.target 疲惫的苏什
step << Horde
.goto 418,28.69,50.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔·血牙|r交谈
.turnin 30132 >>交任务: |cRXP_FRIENDLY_一路向西|r
.accept 30163 >>接任务: |cRXP_WARN_为了部落|r
.accept 30229 >>接任务: |cRXP_WARN_更大的危险|r
.target 科尔·血牙
step << Horde
.goto 418,28.84,50.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.accept 30230 >>接任务: |cRXP_WARN_重夺神器|r
.target 康·棘杖
step << Alliance
.goto 418,24.71,34.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r交谈
.turnin 30465 >>交任务: |cRXP_FRIENDLY_准备进攻|r
.accept 30356 >>接任务: |cRXP_WARN_切断补给线|r
.accept 30354 >>接任务: |cRXP_WARN_一个姐妹也不能少|r
.target 丽娅拉
step << Alliance
.goto 418,25.21,34.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.accept 30355 >>接任务: |cRXP_WARN_重夺神器|r
.target 康·棘杖
step
#include 3) 卡桑琅丛林 科尔詹
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔·血牙|r和|cRXP_FRIENDLY_康·棘杖|r交谈
.turnin 30163 >>交任务: |cRXP_FRIENDLY_为了部落|r
.turnin 30229 >>交任务: |cRXP_FRIENDLY_更大的危险|r
.goto 418,28.68,50.88
.target +科尔·血牙
.turnin 30230 >>交任务: |cRXP_FRIENDLY_重夺神器|r
.goto 418,28.84,50.57
.target +康·棘杖
step << Horde
.goto 418,29.06,51.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_韩大使|r交谈
.accept 30175 >>接任务: |cRXP_WARN_螳螂妖|r
.target 韩大使
step << Horde
.goto 418,15.98,39.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.accept 30164 >>接任务: |cRXP_WARN_石犁村守卫|r
.target 烈日行者德兹科
step << Alliance
.goto 418,25.20,34.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_康·棘杖|r交谈
.turnin 30355 >>交任务: |cRXP_FRIENDLY_重夺神器|r
.target 康·棘杖
step << Alliance
.goto 418,24.70,34.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r交谈
.turnin 30354 >>交任务: |cRXP_FRIENDLY_一个姐妹也不能少|r
.turnin 30356 >>交任务: |cRXP_FRIENDLY_切断补给线|r
.target 丽娅拉
step << Alliance
.goto 418,24.88,34.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_韩大使|r交谈
.accept 30361 >>接任务: |cRXP_WARN_螳螂妖|r
.target 韩大使
step << Alliance
.goto 418,15.08,39.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.accept 30357 >>接任务: |cRXP_WARN_石犁村守卫|r
.target 博学者瓦尔德林
step
#include 3) 卡桑琅丛林 伊克提克
step << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林大使|r和|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.turnin 30175 >>交任务: |cRXP_FRIENDLY_螳螂妖|r
.goto 418,15.69,39.71
.target +林大使
.turnin 30164 >>交任务: |cRXP_FRIENDLY_石犁村守卫|r
.accept 30174 >>接任务: |cRXP_WARN_为了家人|r
.goto 418,15.98,39.78
.target +烈日行者德兹科
step << Alliance
.goto 418,15.70,39.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林大使|r交谈
.turnin 30361 >>交任务: |cRXP_FRIENDLY_螳螂妖|r
.target 林大使
step << Alliance
.goto 418,15.09,39.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.turnin 30357 >>交任务: |cRXP_FRIENDLY_石犁村守卫|r
.target 博学者瓦尔德林
step << Alliance
.goto 418,15.09,39.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.accept 30359 >>接任务: |cRXP_WARN_复国领主|r
.target 博学者瓦尔德林
step << Horde
#completewith next
.gossipoption 40073 >>与|cRXP_FRIENDLY_科尔·血牙|r交谈
.timer 5,Roleplay Duration
.goto 418,23.644,48.828
step << Horde
.goto 418,23.587,48.691
>>击杀 |cRXP_ENEMY_碎地者勃罗耶|r
.complete 30174,1 
.mob 碎地者勃罗耶
step << Horde
.goto 418,28.89,50.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者德兹科|r交谈
.turnin 30174 >>交任务: |cRXP_FRIENDLY_为了家人|r
.target 烈日行者德兹科
step << Alliance
.isOnQuest 30359
.goto 418,23.58,48.84
.gossipoption 40353 >>与|cRXP_FRIENDLY_丽娅拉|r交谈
.timer 10,RP
.target 丽娅拉
step << Alliance
.goto 418,23.53,48.75
>>击杀 |cRXP_ENEMY_碎地者勃罗耶|r
.complete 30359,1 
.mob groundbreaker brojai
step << Alliance
.goto 418,24.69,34.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者瓦尔德林|r交谈
.turnin 30359 >>交任务: |cRXP_FRIENDLY_复国领主|r
.target 博学者瓦尔德林
.accept 30445 >>接任务: |cRXP_WARN_青春之水|r
.timer 40,RP
step << Alliance
#completewith 交任务: |cRXP_FRIENDLY_青春之水|r
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step << Alliance
.isQuestComplete 80446
.goto 393,75.04,45.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step << Alliance
.isQuestComplete 80447
.goto 393,76.55,48.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step << Alliance
#completewith 交任务: |cRXP_FRIENDLY_青春之水|r
.goto 393,67.15,43.64,10,0
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step << Alliance
.goto 393,64.6,42.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step << Alliance
.goto 390,84.00,58.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r交谈
.accept 32246 >>接任务: |cRXP_WARN_寻找斥候|r
.target 丽娅拉
step << Alliance
#completewith 交任务: |cRXP_FRIENDLY_青春之水|r
.aura -449510
.cast 449508 >>使用 |T134488:0|t[诺斯特温的返程服务] 返回卡桑琅丛林
.use 449508
step << Alliance
.goto 418,24.71,34.03
#label 交任务: |cRXP_FRIENDLY_青春之水|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽娅拉|r交谈
.turnin 30445 >>交任务: |cRXP_FRIENDLY_青春之水|r
.target 丽娅拉
step
#include 3) 卡桑琅丛林 霍瑟恩
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 昆莱山 防御影踪派
step
#completewith DefenseShadopan
.goto 379,45.05,89.96,20 >>进入城堡
step
.isOnQuest 31455,31453
#optional
.goto 379,44.48,89.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派翀大师|r交谈
.turnin 31455 >>交任务: |cRXP_FRIENDLY_影踪派|r << Alliance
.turnin 31453 >>交任务: |cRXP_FRIENDLY_影踪派|r << Horde
.accept 30665 >>接任务: |cRXP_WARN_保卫影踪别院|r
.accept 30670 >>接任务: |cRXP_WARN_道法自然|r
.target 影踪派翀大师
step
#label DefenseShadopan
.goto 379,44.48,89.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派翀大师|r交谈
.accept 30665 >>接任务: |cRXP_WARN_保卫影踪别院|r
.accept 30670 >>接任务: |cRXP_WARN_道法自然|r
.target 影踪派翀大师
step
#completewith Holed Up
>>击杀 |cRXP_ENEMY_感染煞能的野牛人|r
.complete 30665,1 
.mob 感染煞能的野牛人
step
#completewith Holed Up
>>击杀 |cRXP_ENEMY_盲目怒火|r, 拾取 |cRXP_LOOT_盲目怒火精华|r
.complete 30670,1 
.mob 盲目怒火
step
#completewith Holed Up
.goto 379,44.51,89.06,10 >>离开城堡
step
#label Holed Up
.goto 379,42.94,88.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钟思亚|r交谈, 地点在小屋内
.accept 30682 >>接任务: |cRXP_WARN_救民水火|r
.target 钟思亚
step
#completewith Jin Warmkeg
>>击杀 |cRXP_ENEMY_被虫子侵扰的扬戈尔|r
.complete 30665,1 
.mob 感染煞能的野牛人
step
#completewith Jin Warmkeg
>>击杀 |cRXP_ENEMY_盲目怒火|r, 拾取 |cRXP_LOOT_盲目怒火精华|r
.complete 30670,1 
.mob 盲目怒火
step
.goto 379,43.12,88.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钟思亚|r交谈
.complete 30682,4 
.skipgossip
.target 钟思亚
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崖·火树|r交谈
.complete 30682,2 
.goto 379,41.07,87.00
.skipgossip
.target 崖·火树
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_方老太|r交谈
.complete 30682,3 
.goto 379,42.84,85.71
.skipgossip
.target 方老太
step
#label Jin Warmkeg
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_金·暖壶|r交谈
.complete 30682,1 
.goto 379,43.88,86.17
.skipgossip
.target 金·热桶
step
#completewith Sha-Infested Yaungol
#hidewindow
#loop
.goto 379,45.15,88.27,40,0
.goto 379,42.89,87.97,40,0
.goto 379,41.06,86.39,40,0
.goto 379,42.80,86.06,40,0
.goto 379,45.15,88.27,0
.goto 379,42.89,87.97,0
.goto 379,41.06,86.39,0
.goto 379,42.80,86.06,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_被虫子侵扰的扬戈尔|r
.complete 30665,1 
.mob 感染煞能的野牛人
step
>>击杀 |cRXP_ENEMY_盲目怒火|r, 拾取 |cRXP_LOOT_盲目怒火精华|r
.complete 30670,1 
.mob 盲目怒火
step
#label Sha-Infested Yaungol
>>击杀 |cRXP_ENEMY_感染煞能的野牛人|r
.complete 30665,1 
.mob 感染煞能的野牛人
step
#completewith next
.goto 379,44.51,89.06,12 >>进入城堡
step
.goto 379,44.47,89.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派翀大师|r交谈
.turnin 30665 >>交任务: |cRXP_FRIENDLY_保卫影踪别院|r
.turnin 30670 >>交任务: |cRXP_FRIENDLY_道法自然|r
.turnin 30682 >>交任务: |cRXP_FRIENDLY_救民水火|r
.accept 30690 >>接任务: |cRXP_WARN_幕后真凶|r
.target 影踪派翀大师
step
#completewith KobaiTrapMask
.goto 379,44.51,89.06,12 >>离开城堡
step
#sticky
#label KobaiTrapMask
.complete 30690,1 
step
#label KobaiTrap
#completewith KobaiTrapMask
#loop
.goto 379,44.94,86.47,20,0
.goto 379,45.14,85.98,20,0
.goto 379,45.51,85.53,20,0
.goto 379,45.82,86.57,20,0
.goto 379,45.49,86.96,20,0
.goto 379,44.94,86.47,0
.goto 379,45.14,85.98,0
.goto 379,45.51,85.53,0
.goto 379,45.82,86.57,0
.goto 379,45.49,86.96,0
.cast 118938 >>在 |cRXP_ENEMY_科拜|r 附近使用 |T537467:0|t[盲目怒火陷阱]
.mob 科拜
.use 81741
step
.isOnQuest 30690
#requires KobaiTrap
#completewith KobaiTrapMask
.goto 379,45.44,85.47
.cast 118984 >>将 |cRXP_ENEMY_科拜|r 拉入陷阱, 对其使用 |T133564:0|t[盲目怒火陷阱] 偷取面具
.use 118984
.mob 科拜
step
#requires KobaiTrapMask
>>击杀 |cRXP_ENEMY_怨毒之怒|r
.complete 30690,2 
.mob malevolent fury
step
#completewith next
.goto 379,44.51,89.06,12 >>进入城堡
step
.goto 379,44.48,89.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派翀大师|r交谈
.turnin 30690 >>交任务: |cRXP_FRIENDLY_幕后真凶|r
.target 影踪派翀大师
.accept 30699 >>接任务: |cRXP_WARN_前往冬花营|r
step
#completewith next
.goto 379,45.13,89.98,10 >>离开城堡
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 昆莱山 掠夺者
step
#loop
.goto 379,71.57,74.97,40,0
.goto 379,70.74,72.41,40,0
.goto 379,71.55,71.05,40,0
.goto 379,71.57,74.97,0
.goto 379,70.74,72.41,0
.goto 379,71.55,71.05,0
>>击杀 |cRXP_ENEMY_伯里尔基抢劫者|r, 拾取 |T133364:0|t[麝爪的纪念品] 触发任务
.accept 30582 >>接任务: |cRXP_WARN_已故的麝香爪夫人|r
.mob 伯里尔基抢劫者
step
#loop
.goto 379,71.61,70.08,20,0
.goto 379,71.21,69.36,20,0
.goto 379,71.61,70.08,0
.goto 379,71.21,69.36,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老麝香爪|r交谈
.turnin 30582 >>交任务: |cRXP_FRIENDLY_已故的麝香爪夫人|r
.accept 30488 >>接任务: |cRXP_WARN_找回麝香爪|r
.accept 30489 >>接任务: |cRXP_WARN_鲜松针的香味|r
.accept 30804 >>接任务: |cRXP_WARN_恐惧大师|r
.target 老麝香爪
step
#completewith next
.goto 379,73.05,73.49,20,0
.goto 381,16.39,39.7,10,0
.goto 381,26.25,61.08,10,0
.goto 381,41.97,40.32,10,0
.goto 381,53.77,32.01,10,0
.goto 381,65.53,43.08,10,0
>>击杀 |cRXP_ENEMY_针刺林精|r, 拾取 |T134439:0|t[|cRXP_LOOT_提神松针|r]
.complete 30489,1 
.mob 松针林精
step
.goto 381,63.96,59.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小麝香爪|r交谈
.turnin 30488 >>交任务: |cRXP_FRIENDLY_找回麝香爪|r
.target 小麝香爪
step
.group
.goto 381,63.96,59.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小麝香爪|r交谈
.accept 30491 >>接任务: |cRXP_WARN_洗牛站|r
.target 小麝香爪
step
#completewith next
.goto 381,65.53,43.08,10,0
.goto 381,53.77,32.01,10,0
.goto 381,41.97,40.32,10,0
.goto 381,26.25,61.08,10,0
.goto 381,16.39,39.7,10,0
.goto 379,73.05,73.49,10,0
.goto 379,71.92,72.18,30,0
.goto 379,71.5,72.05,30,0
.goto 379,69.31,72.72,30,0
.goto 379,67.99,72.47,30,0
.goto 379,65.68,73.11,30,0
.goto 379,66.96,74.17,30,0
>>击杀 |cRXP_ENEMY_针刺林精|r, 拾取 |cRXP_LOOT_提神松针|r
.complete 30489,1 
.mob 松针林精
step
#loop
.goto 379,71.57,74.97,40,0
.goto 379,70.74,72.41,40,0
.goto 379,71.55,71.05,40,0
.goto 379,71.57,74.97,0
.goto 379,70.74,72.41,0
.goto 379,71.55,71.05,0
>>击杀 |cRXP_ENEMY_伯里尔基抢劫者|r 以接受任务: [喋喋不休]
*|cRXP_WARN_This can take multiple kills|r
.accept 30587 >>接任务: |cRXP_WARN_喋喋不休|r
.mob 伯里尔基抢劫者
step
#completewith The Fearmaster
>>击杀 |cRXP_ENEMY_针刺林精|r, 拾取 |cRXP_LOOT_提神松针|r
.complete 30489,1 
.mob 松针林精
step
#completewith The Fearmaster
>>击杀 |cRXP_ENEMY_伯里尔基抢劫者|r
.complete 30587,1 
.mob burilgi despoiler
step
#label The Fearmaster
.goto 379,67.84,73.97
>>击杀 |cRXP_ENEMY_恐惧大师|r
.complete 30804,1 
.mob the fearmaster
step
#completewith Needle Sprite
#hidewindow
#loop
.goto 379,68.10,71.70,40,0
.goto 379,70.00,70.27,40,0
.goto 379,72.67,71.49,40,0
.goto 379,71.79,74.10,40,0
.goto 379,66.54,74.19,40,0
.goto 379,68.10,71.70,0
.goto 379,70.00,70.27,0
.goto 379,72.67,71.49,0
.goto 379,71.79,74.10,0
.goto 379,66.54,74.19,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_针刺林精|r, 拾取 |cRXP_LOOT_提神松针|r
.complete 30489,1 
.mob 松针林精
step
>>击杀 |cRXP_ENEMY_伯里尔基抢劫者|r
.complete 30587,1 
.mob burilgi despoiler
step
#label Needle Sprite
>>击杀 |cRXP_ENEMY_针刺林精|r, 拾取 |cRXP_LOOT_提神松针|r
.complete 30489,1 
.mob 松针林精
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,1 
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.isOnQuest 30489
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,2 
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.isOnQuest 30489
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,3 
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.isOnQuest 30489
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,4 
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.isOnQuest 30489
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,5 
step
.group
#loop
#completewith next
.goto 379,70.36,69.68,40,0
.goto 379,69.63,70.46,40,0
.goto 379,69.08,70.90,40,0
.goto 379,69.63,72.10,40,0
.goto 379,70.77,72.30,40,0
.goto 379,70.36,69.68,0
.goto 379,69.63,70.46,0
.goto 379,69.08,70.90,0
.goto 379,69.63,72.10,0
.goto 379,70.77,72.30,0
.isOnQuest 30489
.vehicle >>与 |cRXP_FRIENDLY_逃走的牦牛|r 互动
.mob 逃走的牦牛
step
.group
.isOnQuest 30491
.goto 379,71.41,69.14
>>|cRXP_WARN_跟随箭头|r, 使用 |T132335:0|t[冲锋] (1) 加速
.complete 30491,1,6 
step
#loop
.goto 379,71.21,69.39,25,0
.goto 379,71.94,70.30,25,0
.goto 379,71.21,69.39,0
.goto 379,71.94,70.30,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老麝香爪|r交谈
.turnin 30489 >>交任务: |cRXP_FRIENDLY_鲜松针的香味|r
.turnin 30587 >>交任务: |cRXP_FRIENDLY_喋喋不休|r
.turnin 30804 >>交任务: |cRXP_FRIENDLY_恐惧大师|r
.target 老麝香爪
step
.group
.goto 379,71.40,69.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小麝香爪|r交谈
.turnin 30491 >>交任务: |cRXP_FRIENDLY_洗牛站|r
.accept 30492 >>接任务: |cRXP_WARN_再说牦牛|r
.target 小麝香爪
step
#label Yaungoil
.goto 379,71.73,63.03
.achievement 6847,3 >>点击 |cRXP_PICK_卷轴|r
step
.goto 379,65.49,60.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黏滑墨迹|r交谈
.accept 30614 >>接任务: |cRXP_WARN_采油站|r
.target 黏滑的墨水渍
step
.goto 379,64.88,60.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烟熏煤须|r交谈
.accept 30616 >>接任务: |cRXP_WARN_交通问题|r
.target 冒烟的煤黑腚
step
.group
.goto 379,65.12,61.65
>>|cRXP_WARN_跟随箭头指引|r
.complete 30492,1 
step
.group
.goto 379,64.71,61.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运八铜钱|r交谈
.turnin 30492 >>交任务: |cRXP_FRIENDLY_再说牦牛|r
step
.goto 379,64.71,61.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运八铜钱|r交谈
.accept 30808 >>接任务: |cRXP_WARN_土地精的好运|r
.target 好运的八铜钱
step
#completewith Filled Oil Vial
>>击杀 |cRXP_ENEMY_卢秦步兵|r 和 |cRXP_ENEMY_卢秦长老|r
.complete 30616,1 
.mob 卢秦步兵
.mob 卢秦长老
step
#completewith Filled Oil Vial
>>点击 |cRXP_PICK_被盗的幸运币背包|r
.complete 30808,1 
step
#label Filled Oil Vial
.goto 379,63.34,68.46
>>点击 |cRXP_PICK_野牛人油井|r
.complete 30614,1 
step
#completewith Ruqin Yaungols
#hidewindow
#loop
.goto 379,62.19,69.29,20,0
.goto 379,62.04,67.93,20,0
.goto 379,63.38,66.86,20,0
.goto 379,62.19,69.29,0
.goto 379,62.04,67.93,0
.goto 379,63.38,66.86,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_卢秦步兵|r 和 |cRXP_ENEMY_卢秦长老|r
.complete 30616,1 
.mob 卢秦步兵
.mob 卢秦长老
.mob 卢秦护卫
step
>>点击 |cRXP_PICK_被盗的幸运币背包|r
.complete 30808,1 
step
#label Ruqin Yaungols
>>击杀 |cRXP_ENEMY_卢秦步兵|r 和 |cRXP_ENEMY_卢秦长老|r
.complete 30616,1 
.mob 卢秦步兵
.mob 卢秦长老
.mob 卢秦护卫
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 昆莱峰 我的儿子
step
.goto 379,74.97,88.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人石|r交谈
.accept 30467 >>接任务: |cRXP_WARN_我的儿子……|r
.accept 30469 >>接任务: |cRXP_WARN_取回补给|r
.target 商人施禄
step
.goto 379,74.80,88.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_剑术大师梅|r交谈
.accept 30468 >>接任务: |cRXP_WARN_复仇之怒|r
.target 宝剑女侠阿梅
step
.goto 379,75.14,87.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水语者高莱|r交谈
.accept 30496 >>接任务: |cRXP_WARN_水语者的法杖|r
.accept 30967 >>接任务: |cRXP_WARN_解救叛逆者|r
.target 水语者苟莱
step << Alliance
#completewith Role Call
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 太蛇
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
step << Alliance
#completewith Role Call
>>点击 |cRXP_PICK_被盗物资|r
.complete 30469,1 
step << Alliance
#completewith Role Call
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨鳃叛逆者|r交谈
.complete 30967,1 
.skipgossip
.target 墨鳃叛逆者
step << Alliance
#label Role Call
.goto 379,74.48,83.55
.achievement 6846,1 >>点击 |cRXP_PICK_卷轴|r
step
#completewith Orachi
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 太蛇
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
step << Alliance
#completewith Orachi
>>点击 |cRXP_PICK_被盗物资|r
.complete 30469,1 
step << Alliance
#completewith Orachi
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨鳃叛逆者|r交谈
.complete 30967,1 
.skipgossip
.target 墨鳃叛逆者
step
#completewith Orachi
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 太蛇
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
step
#completewith Orachi
>>点击 |cRXP_PICK_被盗物资|r
.complete 30469,1 
step
#completewith Orachi
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨鳃叛逆者|r交谈
.complete 30967,1 
.skipgossip
.target 墨鳃叛逆者
step
.goto 379,74.27,78.13
>>击杀 |cRXP_ENEMY_奥拉奇|r, 拾取 |cRXP_LOOT_被盗的墨鱼仪式法杖|r
.complete 30496,1 
.mob 太蛇
step
#label Orachi
.goto 379,74.68,76.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武鹏|r交谈
.turnin 30467 >>交任务: |cRXP_FRIENDLY_我的儿子……|r
.accept 30834 >>接任务: |cRXP_WARN_父子团聚|r
.target 武鹏
step
#completewith 交任务: |cRXP_FRIENDLY_水语者的法杖|r
#hidewindow
#loop
.goto 379,73.08,76.26,40,0
.goto 379,73.17,77.19,40,0
.goto 379,74.33,78.61,40,0
.goto 379,74.79,79.76,40,0
.goto 379,74.77,82.39,40,0
.goto 379,73.86,82.87,40,0
.goto 379,73.72,84.08,40,0
.goto 379,74.63,84.98,40,0
.goto 379,73.08,76.26,0
.goto 379,73.17,77.19,0
.goto 379,74.33,78.61,0
.goto 379,74.79,79.76,0
.goto 379,74.77,82.39,0
.goto 379,73.86,82.87,0
.goto 379,73.72,84.08,0
.goto 379,74.63,84.98,0
+1
step
#completewith Inkgill Dissenters
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
.mob 太蛇
step
#completewith Inkgill Dissenters
>>点击 |cRXP_PICK_被盗物资|r
.complete 30469,1 
step
#label Inkgill Dissenters
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨鳃叛逆者|r交谈
.complete 30967,1 
.skipgossip
.target 墨鳃叛逆者
step
#completewith next
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
.mob 太蛇
step
>>点击 |cRXP_PICK_被盗物资|r
.complete 30469,1 
step
#label 交任务: |cRXP_FRIENDLY_水语者的法杖|r
>>击杀 |cRXP_ENEMY_狂怒的金鱼人|r
.complete 30468,1 
.mob 暴怒骑手
.mob 暴怒祭司
.mob 暴怒铁匠
.mob 暴怒蛮兵
.mob 暴怒矛兵
.mob 暴怒织潮者
.mob 太蛇
step
.goto 379,75.21,88.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水语者高莱|r交谈
.turnin 30496 >>交任务: |cRXP_FRIENDLY_水语者的法杖|r
.turnin 30967 >>交任务: |cRXP_FRIENDLY_解救叛逆者|r
.target 水语者苟莱
step
.goto 379,74.78,88.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_剑术大师梅|r交谈
.turnin 30468 >>交任务: |cRXP_FRIENDLY_复仇之怒|r
.target 宝剑女侠阿梅
step
.goto 379,74.97,88.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人石|r交谈
.turnin 30469 >>交任务: |cRXP_FRIENDLY_取回补给|r
.turnin 30834 >>交任务: |cRXP_FRIENDLY_父子团聚|r
.target 商人施禄
step
.goto 379,75.21,88.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水语者高莱|r交谈
.accept 30480 >>接任务: |cRXP_WARN_仪式|r
.target 水语者苟莱
step
.goto 379,75.21,88.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水语者高莱|r交谈
.target 水语者苟莱
.complete 30480,1 
.timer 34,RP
.skipgossip 60973,1
step
.goto 379,74.90,88.58
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30480,2 
step
>>击杀 |cRXP_ENEMY_迸发之恨|r
.complete 30480,3 
.timer 14,RP
.mob 迸发之恨
step
.goto 379,74.90,88.59
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水语者高莱|r交谈
.turnin 30480 >>交任务: |cRXP_FRIENDLY_仪式|r
.target 水语者苟莱
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 主线战役 翡翠林 中立
step
.goto 371,46.65,46.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安·风裘|r交谈
.accept 29716 >>接任务: |cRXP_WARN_胆比猢狲大|r
.target 安·风裘
.accept 29717 >>接任务: |cRXP_WARN_教训小猫！|r
step
.goto 371,46.46,45.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖·铁腹|r交谈
.accept 29865 >>接任务: |cRXP_WARN_丝木林之路|r
.target 破军铁腹志大师
step
.goto 371,46.63,45.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗·游酒|r交谈
.accept 29866 >>接任务: |cRXP_WARN_万千烦恼丝|r
.target 罗·游酒
step
#completewith SilkwoodStalker
#hidewindow
#loop
.goto 371,45.10,47.18,30,0
.goto 371,44.98,49.66,35,0
.goto 371,43.92,51.05,35,0
.goto 371,41.70,50.53,42,0
.goto 371,42.87,47.47,42,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_丝木追踪者|r
.complete 29865,1 
.mob 丝木追踪者
step
>>点击 |cRXP_PICK_丝绸碎片|r
.complete 29866,1 
step
#label SilkwoodStalker
>>击杀 |cRXP_ENEMY_丝木追踪者|r
.complete 29865,1 
.mob 丝木追踪者
step
#completewith JadeGuardian
#hidewindow
#loop
.goto 371,39.81,47.28,32,0
.goto 371,37.61,48.69,38,0
.goto 371,36.68,45.59,38,0
.goto 371,37.27,43.31,38,0
.goto 371,38.38,41.85,38,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_青玉守护者|r
.complete 29717,1 
.mob 青玉守护者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_受惊的熊猫人幼崽|r交谈
.complete 29716,1 
.skipgossip 55267,1
.target 受惊吓的熊猫人儿童s
step
#label JadeGuardian
>>击杀 |cRXP_ENEMY_青玉守护者|r
.complete 29717,1 
.mob 青玉守护者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安·风裘|r|cRXP_WARN_就在你身边|r交谈
*If she's no longer next to you then head back to Dawn's Blossom
.turnin 29716 >>交任务: |cRXP_FRIENDLY_胆比猢狲大|r
.turnin 29717 >>交任务: |cRXP_FRIENDLY_教训小猫！|r
.accept 29723 >>接任务: |cRXP_WARN_青玉巫婆|r
.target 安·风裘
step
#completewith next
.gossipoption 39810 >>与|cRXP_FRIENDLY_寡妇绿爪|r交谈
.timer 35,Roleplay Duration
.target 寡妇绿爪
step
>>|cRXP_WARN_跟随 |cRXP_FRIENDLY_寡妇绿爪|r|r
>>等 |cRXP_ENEMY_寡妇绿爪|r 变为敌对状态后击杀
.goto 371,39.75,46.22
.complete 29723,1 
.mob 寡妇绿爪
step
.goto 371,46.46,45.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖·铁腹|r交谈
.turnin 29865 >>交任务: |cRXP_FRIENDLY_丝木林之路|r
.target 破军铁腹志大师
step
.goto 371,46.63,45.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗·游酒|r交谈
.turnin 29866 >>交任务: |cRXP_FRIENDLY_万千烦恼丝|r
.target 罗·游酒
step
.goto 371,46.86,45.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安·风裘|r交谈
*|cRXP_WARN_She runs around in a circle around the village|r
.turnin 29723 >>交任务: |cRXP_FRIENDLY_青玉巫婆|r
.target 安·风裘
step
.goto 371,46.86,45.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯·游酒|r交谈
.accept 29993 >>接任务: |cRXP_WARN_找到男孩|r
.target 凯·游酒
step
.goto 371,47.16,46.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托娅|r交谈
.accept 29925 >>接任务: |cRXP_WARN_竭尽所能|r
.target 托亚
step
.goto 371,54.67,44.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨水大师魏|r交谈
.turnin 29993 >>交任务: |cRXP_FRIENDLY_找到男孩|r
.accept 29995 >>接任务: |cRXP_WARN_黎明神龛|r
.target 墨水大师魏
step
.goto 371,54.89,45.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨水大师格伦祖|r交谈
.accept 29881 >>接任务: |cRXP_WARN_理想的颜色|r
.target 墨水大师格伦苏
step
.goto 371,55.32,45.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨水大师乔波|r交谈
.accept 29882 >>接任务: |cRXP_WARN_尾针翎笔|r
.target 墨水大师乔波
step
#completewith FreshlyFallenPetal
#hidewindow
#loop
.goto 371,56.56,42.36,34,0
.goto 371,52.97,42.98,45,0
.goto 371,51.79,44.56,35,0
.goto 371,53.90,49.59,42,0
.goto 371,53.78,45.35,40,0
+1
step
#completewith next
>>击杀 |cRXP_FRIENDLY_百木园黄蜂|r, 拾取 |T133723:0|t[黄蜂尾针]
.complete 29882,1 
.mob 百木园黄蜂s
step
>>点击 |cRXP_PICK_刚凋落的花瓣|r
.complete 29881,1 
step
#label FreshlyFallenPetal
>>击杀 |cRXP_FRIENDLY_百木园黄蜂|r, 拾取 |T133723:0|t[黄蜂尾针]
.complete 29882,1 
.mob 百木园黄蜂s
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_墨水大师乔波|r和|cRXP_FRIENDLY_墨水大师格伦祖|r交谈
.turnin 29882 >>交任务: |cRXP_FRIENDLY_尾针翎笔|r
.goto 371,55.32,45.22
.target +墨水大师乔波
.turnin 29881 >>交任务: |cRXP_FRIENDLY_理想的颜色|r
.goto 371,54.89,45.31
.target +墨水大师格伦苏
step
.goto 371,52.57,38.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉·金酿|r交谈
.turnin 29995 >>交任务: |cRXP_FRIENDLY_黎明神龛|r
.accept 29920 >>接任务: |cRXP_WARN_长辈的许可|r
.target 塞拉·金酿
step
#completewith next
.gossipoption 40636 >>与|cRXP_FRIENDLY_棘杖族长|r交谈
.target 棘杖族长
step
>>击败 |cRXP_ENEMY_棘杖族长|r
.goto 371,54.08,38.46
.complete 29920,2 
.skipgossip 56209,1
.mob 棘杖族长
step
#completewith next
.gossipoption 40637 >>与|cRXP_FRIENDLY_金酿族长|r交谈
.target 金酿族长
step
>>击败 |cRXP_ENEMY_金酿族长|r
.goto 371,53.59,36.74
.complete 29920,3 
.mob 金酿族长
step
#completewith next
.gossipoption 40541 >>与|cRXP_FRIENDLY_风裘族长|r交谈
.target 风裘族长
step
>>击败 |cRXP_ENEMY_风裘族长|r
.goto 371,52.54,35.57
.complete 29920,1 
.skipgossip 56206,1
.mob 风裘族长
step
.goto 371,52.59,38.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗·游酒|r交谈
.turnin 29920 >>交任务: |cRXP_FRIENDLY_长辈的许可|r
.target 罗·游酒
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r和|cRXP_FRIENDLY_孟工头|r交谈
.turnin 29925 >>交任务: |cRXP_FRIENDLY_竭尽所能|r
.goto 371,50.91,27.07
.target +游学者周卓
.accept 29928 >>接任务: |cRXP_WARN_疯狂的石头|r
.goto 371,50.94,27.02
.target +孟工头
step
.goto 371,48.17,29.96,30,0
.goto 371,48.29,32.51,35,0
.goto 371,48.31,31.03
>>击杀 |cRXP_ENEMY_调皮的林精|r, 拾取 |cRXP_PICK_翡翠碎片|r
.complete 29928,1 
.mob Puckfish Sprite
step
.goto 371,50.94,27.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孟工头|r交谈
.turnin 29928 >>交任务: |cRXP_FRIENDLY_疯狂的石头|r
.accept 29926 >>接任务: |cRXP_WARN_玉石灾星|r
.accept 29927 >>接任务: |cRXP_WARN_孟的丈夫|r
.target 孟工头
step
#completewith next
#title 进入洞穴
.goto 372,75.17,23.51,10 >>|cRXP_WARN_进入洞窟|r
step
>>|cRXP_WARN_跟随箭头指引|r
.goto 372,67.27,24.92
.complete 29927,1 
step
.goto 372,60.90,36.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孟豪|r交谈
.turnin 29927 >>交任务: |cRXP_FRIENDLY_孟的丈夫|r
.accept 29929 >>接任务: |cRXP_WARN_被困住了！|r
.target 孟豪
step
#completewith CalamityJade
#hidewindow
#loop
.goto 373,39.70,20.15,30,0
.goto 373,34.53,75.24,22,0
.goto 373,44.62,80.91,25,0
.goto 373,67.94,37.16,25,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_绿石利齿蛛|r 和 |cRXP_ENEMY_绿石钻孔蛛|r
.complete 29926,1 
.mob +绿石利齿蛛
.complete 29926,2 
.mob +绿石钻孔蛛
step
>>点击 |cRXP_FRIENDLY_绿石矿工|r
.goto 373,36.71,38.18
.complete 29929,1 
.target 绿石矿工
step
#label CalamityJade
>>击杀 |cRXP_ENEMY_绿石利齿蛛|r 和 |cRXP_ENEMY_绿石钻孔蛛|r
.complete 29926,1 
.mob +绿石利齿蛛
.complete 29926,2 
.mob +绿石钻孔蛛
step
#completewith next
#title 离开洞穴
.goto 373,53.68,57.27,8,0
.goto 372,43.09,31.86,8,0
.goto 372,52.42,41.97,8,0
.goto 372,77.58,25.03,10 >>|cRXP_WARN_返回上方并离开洞穴|r
step
.goto 371,46.29,29.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孟豪|r交谈
.turnin 29929 >>交任务: |cRXP_FRIENDLY_被困住了！|r
.accept 29930 >>接任务: |cRXP_WARN_全归你了|r
.target 孟豪
step
#completewith next
.vehicle 56508 >>进入 |cRXP_FRIENDLY_玉石矿车|r
.goto 371,46.27,29.47
.timer 52,Cart Duration
.target 玉石矿车
step
>>击杀进攻的 |cRXP_ENEMY_脆弱的绿石吞噬者|r
*|cRXP_WARN_Be careful not to attack |cRXP_ENEMY_Hutia|r|r
.goto 371,51.21,26.72
.complete 29930,1 
.timer 40,Hao Mann Roleplay
.mob 脆弱的绿石吞噬者
step
.goto 371,50.94,27.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孟工头|r交谈
.turnin 29926 >>交任务: |cRXP_FRIENDLY_玉石灾星|r
.turnin 29930 >>交任务: |cRXP_FRIENDLY_全归你了|r
.accept 29931 >>接任务: |cRXP_WARN_神龙之心|r
.target 孟工头
step
.goto 371,48.31,61.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头雷科|r交谈
.turnin 29931 >>交任务: |cRXP_FRIENDLY_神龙之心|r
.accept 30495 >>接任务: |cRXP_WARN_爱的劳动|r
.target 工头雷科
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风筝大师卓续|r交谈
.goto 371,48.18,60.02
.complete 30495,3 
.skipgossip 59392,2
.target 风筝大师卓续
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与雕像顶部的|cRXP_FRIENDLY_监工艾米|r交谈
.goto 371,47.58,60.67
.complete 30495,4 
.skipgossip 59397,1
.target 监工艾米
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘测员萨瓦|r交谈
.goto 371,46.94,60.35
.complete 30495,2 
.skipgossip 59401,1
.target 勘测员萨瓦
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_历史学家丁先生|r交谈
.goto 371,46.37,61.81
.complete 30495,1 
.skipgossip 59395,1
.target 历史学家丁先生
step
.goto 371,48.31,61.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头雷科|r交谈
.turnin 30495 >>交任务: |cRXP_FRIENDLY_爱的劳动|r
.accept 29932 >>接任务: |cRXP_WARN_青龙寺|r
.target 工头雷科
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者风易|r交谈
.goto 371,55.85,57.08
.complete 29932,1 
.skipgossip 57242,1
.target 大贤者易风
step
.goto 371,58.13,58.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者朱雨|r交谈
.turnin 29932 >>交任务: |cRXP_FRIENDLY_青龙寺|r
.accept 29997 >>接任务: |cRXP_WARN_占卜师的困境|r
.accept 29998 >>接任务: |cRXP_WARN_藏书人的困境|r
.target 大贤者朱雨
step
.goto 371,58.03,59.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲|r交谈
.accept 29999 >>接任务: |cRXP_WARN_骑士的羁绊|r
.accept 30005 >>接任务: |cRXP_WARN_点亮天空|r
.target 菲
step
#completewith LibrariansQuandary
>>点击 |cRXP_PICK_烟花发射器|r
.complete 30005,1 
step
>>点击 |cRXP_FRIENDLY_顽皮的赤红小翔龙|r
.goto 371,58.17,61.38
.complete 29999,2 
.target 顽皮的赤红小翔龙
step
#label LibrariansQuandary
.goto 371,56.27,60.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者石步|r交谈
.turnin 29998 >>交任务: |cRXP_FRIENDLY_藏书人的困境|r
.accept 30001 >>接任务: |cRXP_WARN_飞蛾满屋|r
.accept 30002 >>接任务: |cRXP_WARN_历史书页|r
.target 游学者石步
step
#completewith next
>>击杀 |cRXP_ENEMY_斑点飞蛾|r
.complete 30001,1 
.mob 斑点飞蛾
step
>>点击 |cRXP_FRIENDLY_顽皮的金色小翔龙|r
.goto 371,56.00,60.34
.complete 29999,4 
.target 顽皮的金色小翔龙
step
#completewith next
>>击杀 |cRXP_ENEMY_斑点飞蛾|r
.complete 30001,1 
.mob 斑点飞蛾
step
.goto 371,56.00,60.34
>>点击 |cRXP_PICK_虫蛀的书籍|r
>>点击 |cRXP_ENEMY_书虫|r 将其击杀
.complete 30002,1 
.mob 书虫
step
.goto 371,56.00,60.34
>>击杀 |cRXP_ENEMY_斑点飞蛾|r
.complete 30001,1 
.mob 斑点飞蛾
step
.goto 371,56.26,60.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者石步|r交谈
.turnin 30001 >>交任务: |cRXP_FRIENDLY_飞蛾满屋|r
.turnin 30002 >>交任务: |cRXP_FRIENDLY_历史书页|r
.accept 30004 >>接任务: |cRXP_WARN_完好如初|r
.target 游学者石步
step
#completewith PlayfulEmeraldSerpent
#title Leave Library
#label LeaveLibrary
.goto 371,57.45,60.99,10 >>|cRXP_WARN_离开图书馆|r
step
#requires LeaveLibrary
#completewith EnterFountain
>>点击 |cRXP_PICK_烟花发射器|r
.complete 30005,1 
step
#label PlayfulEmeraldSerpent
>>点击 |cRXP_FRIENDLY_顽皮的翡翠小翔龙|r
.goto 371,56.54,58.40
.complete 29999,3 
.target 顽皮的翡翠小翔龙
step
#completewith next
#title Enter building
#label EnterFountain
.goto 371,56.82,57.09,12,0
.goto 371,56.43,56.46,12,0
.goto 371,56.67,55.76,12 >>|cRXP_WARN_进入永恒守护者之泉|r
step
>>击杀 |cRXP_ENEMY_流水魔|r, 拾取 |T135139:0|t[斯瑞尔的法杖]
.goto 371,57.09,55.79
.complete 29997,1 
.mob 流水魔
step
.goto 371,57.57,56.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贤者马里|r交谈
.turnin 29997 >>交任务: |cRXP_FRIENDLY_占卜师的困境|r
.accept 30011 >>接任务: |cRXP_WARN_新的视界|r
.target 贤者马里
step
#completewith next
>>点击 |cRXP_PICK_烟花发射器|r
.complete 30005,1 
step
>>点击 |cRXP_FRIENDLY_顽皮的青色小翔龙|r
.goto 371,59.16,56.78
.complete 29999,1 
.target 顽皮的青色小翔龙
step
#loop
.goto 371,58.10,57.36,20,0
.goto 371,57.46,59.97,20,0
.goto 371,57.87,61.19,25,0
.goto 371,56.60,58.04,25,0
.goto 371,58.82,56.60,25,0
.goto 371,58.10,57.36,0
.goto 371,57.46,59.97,0
.goto 371,57.87,61.19,0
.goto 371,56.60,58.04,0
.goto 371,58.82,56.60,0
>>点击 |cRXP_PICK_烟花发射器|r
.complete 30005,1 
step
.goto 371,58.14,58.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者朱雨|r交谈
.turnin 30004 >>交任务: |cRXP_FRIENDLY_完好如初|r
.turnin 30011 >>交任务: |cRXP_FRIENDLY_新的视界|r
.target 大贤者朱雨
step
.goto 371,58.03,59.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲|r交谈
.turnin 29999 >>交任务: |cRXP_FRIENDLY_骑士的羁绊|r
.turnin 30005 >>交任务: |cRXP_FRIENDLY_点亮天空|r
.accept 30000 >>接任务: |cRXP_WARN_青龙|r
.target 菲
step
.goto 371,52.15,58.12
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
.complete 30000,1 
step
.goto 371,55.84,57.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大贤者风易|r交谈
.turnin 30000 >>交任务: |cRXP_FRIENDLY_青龙|r
.accept 30498 >>接任务: |cRXP_WARN_快回来！|r <<Alliance
.accept 30499 >>接任务: |cRXP_WARN_快回来！|r <<Horde
.target 大贤者易风
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 7) 主线战役 翡翠林 中立 2
step
>>使用 |T133305:0|t[周氏传家宝]
.goto 371,44.50,66.94
.use 80071
.complete 30485,1 
step
.convertquest 31303,31362 <<Horde
.goto 371,44.78,67.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30485 >>交任务: |cRXP_FRIENDLY_最后一块拼图|r
.accept 31303 >>接任务: |cRXP_WARN_破损的封印|r
.target 游学者周卓
step
#completewith next
.goto 371,44.77,67.04
.vehicle 64249 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米师|r
.skipgossip 64244,1
.target 米师
step
>>对 |cRXP_PICK_煞能裂缝|r 使用 |T135821:0|t[射击火炮] (1)
.goto 371,46.88,58.29
.complete 31303,1 
step
.goto 371,49.30,61.47
.convertquest 30504,31319 <<Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31303 >>交任务: |cRXP_FRIENDLY_破损的封印|r
.accept 30500 >>接任务: |cRXP_WARN_残存的影响|r
.accept 30502 >>接任务: |cRXP_WARN_灵玉之心|r
.accept 30504 >>接任务: |cRXP_WARN_紧急救援|r
.target 游学者周卓
step
#completewith EmergencyResponse
>>拾取 |cRXP_PICK_天神灵玉|r, 对 |cRXP_FRIENDLY_邪煞残影|r 使用以削弱它们
>>击杀 |cRXP_ENEMY_邪煞残影|r
.collect 80074,6,30502,0x1,-1
.disablecheckbox
.complete 30502,1 
.use 80074
.mob 邪煞残影
step
#completewith EmergencyResponse
>>击杀 |cRXP_ENEMY_煞能回声|r
.complete 30500,1 
.mob 邪煞回响
step << Horde
#title 向上走staris
>>|cRXP_WARN_在楼上对 |cRXP_FRIENDLY_纳兹戈林将军|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,48.13,61.77
.use 86467
.complete 30504,1 
.target 纳兹戈林将军
step << Horde
>>|cRXP_WARN_对 |cRXP_FRIENDLY_匿踪大师琪麟|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,47.24,62.54
.use 86467
.complete 30504,2 
.target 匿踪大师琪麟
step << Horde
>>|cRXP_WARN_对 |cRXP_FRIENDLY_夏琪亚|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,46.87,60.70
.use 86467
.complete 30504,3 
.target 夏琪亚
step << Alliance
>>|cRXP_WARN_对 |cRXP_FRIENDLY_海军上将泰勒|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,48.13,61.77
.use 86511
.complete 30504,1 
.target 海军上将泰勒
step << Alliance
>>|cRXP_WARN_对 |cRXP_FRIENDLY_米希卡|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,46.37,61.67
.use 86511
.complete 30504,2 
.target 米希卡
step << Alliance
#label EmergencyResponse
>>|cRXP_WARN_对 |cRXP_FRIENDLY_苏利|r 使用 |T620828:0|t[乔的烟花]|r
.goto 371,47.53,59.2
.use 86511
.complete 30504,3 
.target 苏利
step << Horde
#label EmergencyResponse
>>|cRXP_WARN_使用 |T620828:0|t[乔的烟花]
.goto 371,48.02,59.08
.use 86467
.complete 30504,4 
step
#completewith next
>>击杀 |cRXP_ENEMY_煞能回声|r
.complete 30500,1 
.mob 邪煞回响
step
#loop
.goto 371,49.36,58.31,40,0
.goto 371,48.06,62.74,40,0
.goto 371,46.08,63.17,40,0
.goto 371,46.63,57.54,40,0
>>拾取 |cRXP_PICK_天神灵玉|r, 对 |cRXP_FRIENDLY_邪煞残影|r 使用以削弱它们
>>击杀 |cRXP_ENEMY_邪煞残影|r
.collect 80074,6,30502,0x1,-1
.disablecheckbox
.complete 30502,1 
.use 80074
.mob 邪煞残影
step
#loop
.goto 371,48.99,60.95,30,0
.goto 371,47.42,62.41,30,0
.goto 371,45.98,60.57,30,0
.goto 371,47.65,58.58,30,0
>>击杀 |cRXP_ENEMY_煞能回声|r
.complete 30500,1 
.mob 邪煞回响
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30500 >>交任务: |cRXP_FRIENDLY_残存的影响|r
.turnin 30502 >>交任务: |cRXP_FRIENDLY_灵玉之心|r
.turnin 30504 >>交任务: |cRXP_FRIENDLY_紧急救援|r
.goto 371,49.30,61.47
.target +游学者周卓
step
.goto 371,49.31,61.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲|r交谈
.accept 30648 >>接任务: |cRXP_WARN_勇往直前|r
.target 菲
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 8) 四风谷 3
#displayname 第 6 章 - 四风谷第 3 部分
#title Valey of the Four Winds 3
#next 9) 昆莱峰
step
#completewith next
.hs >>用炉石回到懒惰的芜菁
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽丽|r\|cRXP_FRIENDLY_种粮大户小潘|r和|cRXP_FRIENDLY_种粮状元老凯|r交谈
.goto 376,52.595,62.975
.target +种粮大户小潘
.accept 30028 >>接任务: |cRXP_WARN_找回谷物|r
step
#loop
.goto 376,59.581,69.383,30,0
.goto 376,54.601,70.412,30,0
.goto 376,51.092,68.264,35,0
.goto 376,51.900,63.731,35,0
.goto 376,56.060,63.842,25,0
.goto 376,58.172,59.069,35,0
.goto 376,59.581,69.383,0
.goto 376,54.601,70.412,0
.goto 376,51.092,68.264,0
.goto 376,51.900,63.731,0
.goto 376,56.060,63.842,0
.goto 376,58.172,59.069,0
>>|cRXP_WARN_点击 |cRXP_PICK_一袋失窃的麦芽|r 拾取 |T133849:0|t[谷物袋]
*Also look on top of buildings
.complete 30028,1 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_种粮状元老凯|r和|cRXP_FRIENDLY_丽丽|r交谈
.turnin 30028 >>交任务: |cRXP_FRIENDLY_找回谷物|r
.goto 376,52.73,62.99
.target +种粮状元老凯
.turnin 30032 >>交任务: |cRXP_FRIENDLY_寻找更好的大麦|r
.accept 30047 >>接任务: |cRXP_WARN_陈的口味|r
.goto 376,52.685,62.829
.target +丽丽
step
.xp >40,1
.goto 376,38.58,51.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖兰|r交谈两次
.accept 30052 >>接任务: |cRXP_WARN_除草大战|r
.skipgossip 57385,2
.complete 30053,2 
.target 蓝盖
step
.goto 376,38.58,51.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖兰|r交谈两次
.skipgossip 57385,1
.complete 30053,2 
.target 蓝盖
step
.isOnQuest 30052
.gossipoption 40209 >>与|cRXP_FRIENDLY_盖兰|r交谈以开始任务. |cRXP_WARN_暂时不要完成它, 只需按照指南进行即可|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邓·泥爪|r和|cRXP_FRIENDLY_蒙蒙|r交谈
.accept 30056 >>接任务: |cRXP_WARN_农夫的女儿|r
.complete 30053,3 
.goto 376,44.24,34.23
.target +邓·泥爪
.accept 30054 >>接任务: |cRXP_WARN_够了，真受够了|r
.goto 376,44.160,34.239
.target +蒙蒙
.skipgossip 62385,1
step
.isOnQuest 30052
>>击杀 |cRXP_WARN_疯长的杂草|r
*Click on |cRXP_ENEMY_Ugly Weed|r
*Run over the small weed
*|cRXP_WARN_Pick up and use the |cRXP_PICK_Weed-B-Gone Gas Bomb|r to destroy multiple small and medium ones at once|r
.goto 376,39.572,51.659
.skipgossip 57385,1
.complete 30052,1 
.mob 丑陋的杂草
.mob 疯长的杂草
step
.isOnQuest 30052
.goto 376,38.57,51.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖兰|r交谈
.turnin 30052 >>交任务: |cRXP_FRIENDLY_除草大战|r
.target 蓝盖
step
#completewith MinaMudclaw
>>击杀 |cRXP_ENEMY_弹尾维尔曼|r, 拾取 |T133725:0|t[|cRXP_LOOT_维尔曼牙齿|r]
.complete 30054,1 
.mob 弹尾啮咬者
.mob 弹尾跳跃者
.mob 弹尾打洞者
.mob 弹尾重击者
step
#completewith next
.goto 376,43.286,40.939,8 >>|cRXP_WARN_进入洞窟|r
step
.goto 376,43.548,35.329,0
.goto 376,41.33,38.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米娜·泥爪|r交谈
.turnin 30056 >>交任务: |cRXP_FRIENDLY_农夫的女儿|r
.accept 30057 >>接任务: |cRXP_WARN_眼放橙光|r
.target 米娜·泥爪
step
#label MinaMudclaw
>>离开洞穴
.goto 376,44.18,34.47
.complete 30057,1 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙蒙|r和|cRXP_FRIENDLY_邓·泥爪|r交谈
.turnin 30054 >>交任务: |cRXP_FRIENDLY_够了，真受够了|r
.goto 376,44.17,34.24
.target +蒙蒙
.turnin 30057 >>交任务: |cRXP_FRIENDLY_眼放橙光|r
.goto 376,44.259,34.205
.target +邓·泥爪
step
.goto 376,48.31,33.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_园丁弗兰|r交谈两次
.accept 30050 >>接任务: |cRXP_WARN_园丁芳兰和洒水壶|r
.complete 30053,1 
.turnin 30053 >>交任务: |cRXP_FRIENDLY_寻找啤酒花|r
.skipgossip 62377,2
.target 园丁芳兰
step
#completewith next
.goto 376,48.31,33.46
.gossipoption 36034 >>再次与|cRXP_FRIENDLY_园丁芳兰|r交谈以开始任务
step
>>|cRXP_WARN_站在发光蔬菜之间时使用|r [额外动作按钮]. |cRXP_WARN_需要浇水的蔬菜种类约每 20 秒切换一次|r
.goto 376,49.143,32.929,25,0
.goto 376,47.658,32.382,20,0
.goto 376,49.362,31.912,25,0
.goto 376,48.295,30.983,25,0
.goto 376,48.290,29.023,25,0
.goto 376,50.468,27.960,25,0
.goto 376,51.288,29.325,15,0
.goto 376,48.336,29.195,25,0
.complete 30050,1 
step
.goto 376,48.31,33.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_园丁芳兰|r交谈
.turnin 30050 >>交任务: |cRXP_FRIENDLY_园丁芳兰和洒水壶|r
.target 园丁芳兰
step
.goto 376,54.28,38.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥盏|r交谈
.turnin 30049 >>交任务: |cRXP_FRIENDLY_扛不动水|r
.accept 30051 >>接任务: |cRXP_WARN_寻找活水|r
.target 泥盏
step
.isOnQuest 30051
.goto 376,54.28,38.74
.gossipoption 40623 >>与|cRXP_FRIENDLY_泥盏|r交谈
step
#completewith Succula
>>|cRXP_WARN_带着 |cRXP_FRIENDLY_泥盏|r 跑向 |cRXP_PICK_漩涡之池|r, 击杀刷新的 |cRXP_ENEMY_怪物|r|r
>>|cRXP_WARN_不要离 |cRXP_FRIENDLY_泥盏|r 太远|r
.complete 30051,2 
.mob 树林钳爪蟹
.mob 水啮爬行者
.mob 裂牙潜藏者
step
.goto 376,55.97,33.84
>>击杀 |cRXP_ENEMY_卡兰可|r
.complete 32045,1 
.mob 卡兰可
step
.goto 376,55.130,25.580
>>击杀 |cRXP_ENEMY_雷鳃|r
.complete 32045,2 
.mob 雷鳃
step
#label Succula
.goto 376,51.439,26.673
>>击杀 |cRXP_ENEMY_苏库拉|r
.complete 32045,3 
.mob 苏库拉
step
.goto 376,55.95,49.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥盏|r交谈
.turnin 30051 >>交任务: |cRXP_FRIENDLY_寻找活水|r
.accept 30172 >>接任务: |cRXP_WARN_一起走|r
.target 泥盏
step
.xp >40,1
#completewith next
>>此任务将自动添加到任务日志
.accept 30055 >>接任务: |cRXP_WARN_风暴烈酒的啤酒花|r
step
>>|cRXP_WARN_不要离 |cRXP_FRIENDLY_泥盏|r 太远|r
.goto 376,56.00,49.05
.complete 30172,1 
step
.xp >40,1
.goto 376,55.89,49.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 30055 >>交任务: |cRXP_FRIENDLY_风暴烈酒的啤酒花|r
.turnin 30047 >>交任务: |cRXP_FRIENDLY_陈的口味|r
.turnin 30172 >>交任务: |cRXP_FRIENDLY_一起走|r
.accept 30073 >>接任务: |cRXP_WARN_帝王酒|r
.timer 30,Roleplay Duration
.target 陈·风暴烈酒
step
.xp <40,1
.goto 376,55.89,49.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 30047 >>交任务: |cRXP_FRIENDLY_陈的口味|r
.turnin 30172 >>交任务: |cRXP_FRIENDLY_一起走|r
.target 陈·风暴烈酒
step
.xp >40,1
.isOnQuest 30073
#completewith next
>>等待剧情演出
.complete 30073,1 
step
.goto 376,55.14,47.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_刻石者马克|r交谈
.turnin 32045 >>交任务: |cRXP_FRIENDLY_水的孩子|r
.target 刻石者马克
step
.xp >40,1
>>等待剧情演出
.goto 376,55.97,49.55
.complete 30073,1 
step
.xp >40,1
.goto 376,55.84,49.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 30073 >>交任务: |cRXP_FRIENDLY_帝王酒|r
.accept 30074 >>接任务: |cRXP_WARN_敲门|r
.target 陈·风暴烈酒
step
.xp >40,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.goto 376,32.25,68.56
.turnin 30074 >>交任务: |cRXP_FRIENDLY_敲门|r
.target 陈·风暴烈酒
step
.xp >40,1
#completewith next
.goto 376,29.220,66.185,10 >>飞出 NPC 范围跳过剧情对话
step
.xp >40,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.accept 30075 >>接任务: |cRXP_WARN_扫清道路|r
.goto 376,32.12,68.34
.target +陈·风暴烈酒
step
.xp >40,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泥盏|r和|cRXP_FRIENDLY_丽丽|r交谈
.accept 30076 >>接任务: |cRXP_WARN_最奇妙的液体|r
.goto 376,32.254,68.275
.target +泥盏
.accept 30077 >>接任务: |cRXP_WARN_看那些木桶，伙计|r
.goto 376,32.34,68.48
.target +丽丽
step
.xp >40,1
#completewith Barreled熊猫人
>>击杀 |cRXP_ENEMY_酒臭猢狲|r 和 |cRXP_ENEMY_捣乱的兔妖|r
.complete 30075,1 
.mob 酒臭猢狲
.mob 捣乱的兔妖
step
.xp >40,1
#completewith Barreled熊猫人
>>击杀 |cRXP_ENEMY_好奇的水之灵|r, 拾取 |T134800:0|t[|cRXP_LOOT_灵水精华|r]
.complete 30076,1 
.mob Curious Water Spirit
step
.xp >40,1
#label Barreled熊猫人
#loop
.goto 376,37.869,64.733,35,0
.goto 376,35.533,66.383,35,0
.goto 376,37.869,64.733,0
.goto 376,35.533,66.383,0
>>|cRXP_WARN_当|r |cRXP_ENEMY_乌克乌克|r |cRXP_WARN_靠近时躲开|r
>>点击 |cRXP_PICK_困在桶里的熊猫人|r 释放他们
.complete 30077,1 
.target 困在桶里的熊猫人
step
.xp >40,1
#completewith next
>>击杀 |cRXP_ENEMY_酒臭猢狲|r 和 |cRXP_ENEMY_捣乱的兔妖|r
.complete 30075,1 
.mob 酒臭猢狲
.mob 捣乱的兔妖
step
.xp >40,1
#loop
.goto 376,36.702,64.690,30,0
.goto 376,36.858,71.038,30,0
.goto 376,36.702,64.690,0
.goto 376,36.858,71.038,0
>>击杀 |cRXP_ENEMY_好奇的水之灵|r, 拾取 |T134800:0|t[|cRXP_LOOT_灵水精华|r]
.complete 30076,1 
.mob Curious Water Spirit
step
.xp >40,1
#loop
.goto 376,33.576,64.610,35,0
.goto 376,30.822,68.634,35,0
.goto 376,37.986,64.710,35,0
.goto 376,33.576,64.610,0
.goto 376,30.822,68.634,0
.goto 376,37.986,64.710,0
>>击杀 |cRXP_ENEMY_酒臭猢狲|r 和 |cRXP_ENEMY_捣乱的兔妖|r
.complete 30075,1 
.mob 酒臭猢狲
.mob 捣乱的兔妖
step
.xp >40,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丽丽|r\|cRXP_FRIENDLY_泥盏|r 和 |cRXP_FRIENDLY_陈·风暴烈酒|r 交谈
.turnin 30077 >>交任务: |cRXP_FRIENDLY_看那些木桶，伙计|r
.goto 376,36.13,69.06
.target +丽丽
.turnin 30076 >>交任务: |cRXP_FRIENDLY_最奇妙的液体|r
.goto 376,36.01,69.09
.target +泥盏
.turnin 30075 >>交任务: |cRXP_FRIENDLY_扫清道路|r
.accept 30078 >>接任务: |cRXP_WARN_打扫房间|r
.goto 376,36.037,68.975
.target +陈·风暴烈酒
step
.xp >40,1
.group
#completewith FizzyYelloeAlemental
.gossipoption 39238 >>与 |cRXP_FRIENDLY_陈·风暴烈酒|r 对话开启 Boss Rush 模式
.goto 376,36.037,68.975
.target 陈·风暴烈酒
step
.xp >40,1
.group
.goto 376,36.037,68.975,0
.goto 376,33.857,70.717
>>击杀 |cRXP_ENEMY_艾迪|r
.complete 30078,1 
.mob 气旋
step
.xp >40,1
.group
.goto 376,36.037,68.975,0
.goto 376,34.588,70.465
>>击杀 |cRXP_ENEMY_尤噶|r
*|cRXP_WARN_Click on |cRXP_PICK_Empty Kegs|r to stun him|r
.complete 30078,2 
.mob 尤噶
step
.xp >40,1
.group
#label FizzyYelloeAlemental
.goto 376,36.037,68.975,0
.goto 376,38.67,69.34
>>击杀 |cRXP_WARN_所有|r |cRXP_ENEMY_碳酸黄酒之灵|r 以召唤 |cRXP_ENEMY_碳酸黄酒元素|r
>>击杀 |cRXP_ENEMY_碳酸黄酒元素|r
.complete 30078,3 
.mob 碳酸黄酒之灵s
.mob 碳酸黄酒元素
step
.xp >40,1
.group
.goto 376,36.00,69.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 30078 >>交任务: |cRXP_FRIENDLY_打扫房间|r
.target 陈·风暴烈酒
step
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尼|r和|cRXP_FRIENDLY_赫米特·奈辛瓦里 Jr.|r交谈
.accept 30183 >>接任务: |cRXP_WARN_猎虎|r
.goto 376,16.195,82.538
.target +塔尼
.accept 30181 >>接任务: |cRXP_WARN_猎穆山兽|r
.goto 376,16.068,82.618
.target +赫米特·奈辛瓦里
step
.xp >45,1
#completewith next
>>击杀 |cRXP_ENEMY_沙背穆山兽|r
.complete 30181,1 
.mob 沙背穆山兽
step
.xp >45,1
#loop
.goto 376,16.099,67.419,42,0
.goto 376,12.860,68.913,30,0
.goto 376,10.496,71.845,30,0
.goto 376,15.001,73.442,40,0
.goto 376,11.775,80.562,30,0
.goto 376,14.325,78.846,42,0
.goto 376,16.099,67.419,0
.goto 376,12.860,68.913,0
.goto 376,10.496,71.845,0
.goto 376,15.001,73.442,0
.goto 376,11.775,80.562,0
.goto 376,14.325,78.846,0
>>击杀 |cRXP_ENEMY_峡谷追猎者|r
.complete 30183,1 
.mob 峡谷追猎者
step
.xp >45,1
#loop
.goto 376,14.440,66.456,55,0
.goto 376,26.025,68.550,42,0
.goto 376,26.957,80.187,42,0
.goto 376,11.589,79.370,45,0
.goto 376,14.440,66.456,0
.goto 376,26.025,68.550,0
.goto 376,26.957,80.187,0
.goto 376,11.589,79.370,0
>>击杀 |cRXP_ENEMY_沙背穆山兽|r
.complete 30181,1 
.mob 沙背穆山兽
step
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尼|r和|cRXP_FRIENDLY_赫米特·奈辛瓦里 Jr.|r交谈
.turnin 30183 >>交任务: |cRXP_FRIENDLY_猎虎|r
.accept 30182 >>接任务: |cRXP_WARN_猎狐狸|r
.goto 376,16.195,82.538
.target +塔尼
.turnin 30181 >>交任务: |cRXP_FRIENDLY_猎穆山兽|r
.goto 376,16.068,82.626
.target +赫米特·奈辛瓦里
step
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小海默特·奈辛瓦里|r和|cRXP_FRIENDLY_马特"幸运"·戈彻尔|r交谈
.accept 30184 >>接任务: |cRXP_WARN_猎穆山兽：黑暗之皮|r
.goto 376,16.009,82.484
.target +赫米特·奈辛瓦里
.accept 32038 >>接任务: |cRXP_WARN_雄鹿大师|r
.goto 376,15.90,82.24
.target +玛特·“好运”·高特尔
step
.xp >45,1
#completewith DarkhidesHead
>>击杀 |cRXP_ENEMY_野地雄鹿|r
.complete 32038,1 
.mob 野地雄鹿
step
.xp >45,1
#completewith DarkhidesHead
>>击杀 |cRXP_ENEMY_狡猾的狐狸|r 和 |cRXP_ENEMY_狡猾的幼狐|r
*|cRXP_WARN_Most of the time they're invisible|r
.complete 30182,1 
.mob 狡猾的狐狸
.mob 狡猾的幼狐
step
.xp >45,1
#label DarkhidesHead
>>击杀 |cRXP_ENEMY_黑暗之皮|r, 拾取 |T132243:0|t[|cRXP_LOOT_黑暗之皮的头颅|r]
.goto 376,26.106,75.552
.complete 30184,1 
.mob 黑暗之皮
step
.xp >45,1
#completewith WilderlandStags
#hidewindow
#loop
.goto 376,22.277,76.530,25,0
.goto 376,20.213,69.976,42,0
.goto 376,28.106,68.363,45,0
.goto 376,30.175,82.637,35,0
.goto 376,20.904,81.513,42,0
.goto 376,22.277,76.530,0
.goto 376,20.213,69.976,0
.goto 376,28.106,68.363,0
.goto 376,30.175,82.637,0
.goto 376,20.904,81.513,0
+1
step
.xp >45,1
#completewith next
>>击杀 |cRXP_ENEMY_野地雄鹿|r
.complete 32038,1 
.mob 野地雄鹿
step
.xp >45,1
>>击杀 |cRXP_ENEMY_狡猾的狐狸|r 和 |cRXP_ENEMY_狡猾的幼狐|r
*|cRXP_WARN_Most of the time they're invisible|r
.complete 30182,1 
.mob 狡猾的狐狸
.mob 狡猾的幼狐
step
.xp >45,1
#label WilderlandStags
>>击杀 |cRXP_ENEMY_野地雄鹿|r
.complete 32038,1 
.mob 野地雄鹿
step
.goto 376,15.89,82.24
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛特·"幸运"·高特尔|r交谈
.turnin 32038 >>交任务: |cRXP_FRIENDLY_雄鹿大师|r
.target 玛特·“好运”·高特尔
step
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尼|r 和 |cRXP_FRIENDLY_赫米特·奈辛瓦里|r 交谈
.turnin 30182 >>交任务: |cRXP_FRIENDLY_猎狐狸|r
.goto 376,16.201,82.534
.target +塔尼
.turnin 30184 >>交任务: |cRXP_FRIENDLY_猎穆山兽：黑暗之皮|r
.goto 376,16.01,82.50
.target +赫米特·奈辛瓦里
step
.goto 376,16.07,82.62
.xp >45,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里二世|r交谈
.accept 30185 >>接任务: |cRXP_WARN_猎龟|r
.target 赫米特·奈辛瓦里
step
.xp >45,1
#loop
.goto 376,18.753,78.292,20,0
.goto 376,22.170,75.040,20,0
.goto 376,21.877,71.745,20,0
.goto 376,19.650,72.880,20,0
.goto 376,18.753,78.292,0
.goto 376,22.170,75.040,0
.goto 376,21.877,71.745,0
.goto 376,19.650,72.880,0
>>击杀 |cRXP_ENEMY_鼓背乌龟|r, 拾取 |T1:0|t[|cRXP_LOOT_完整的龟壳|r]
.complete 30185,1 
.mob 凸背乌龟
step
.xp >45,1
.goto 376,19.91,75.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里二世|r交谈
.turnin 30185 >>交任务: |cRXP_FRIENDLY_猎龟|r
.target 赫米特·奈辛瓦里
.accept 30186 >>接任务: |cRXP_WARN_父亲的压力|r
step
.xp >45,1
#title Swim down
#completewith RescueHemetJr
.goto 376,21.834,74.394,10 >>|cRXP_WARN_进入水下洞窟|r
step
.xp >45,1
#completewith RescueHemetJr
.goto 376,24.537,74.631
.gossipoption 40247 >>与|cRXP_FRIENDLY_赫米特·奈辛瓦里二世|r交谈
step
.xp >45,1
#label RescueHemetJr
.goto 376,24.537,74.631
>>击杀 |cRXP_ENEMY_托尔贾之灾|r
.complete 30186,1 
.mob 托加尔之怨
step
.xp >45,1
.goto 376,16.01,82.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [赫米特·奈辛瓦里] 交谈 (荆棘谷猎虎系列)
.turnin 30186 >>交任务: |cRXP_FRIENDLY_父亲的压力|r
.target 赫米特·奈辛瓦里
step
.goto 376,19.87,56.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r交谈
.turnin 29872 >>交任务: |cRXP_FRIENDLY_林·柔掌|r
.accept 29981 >>接任务: |cRXP_WARN_堵住虫群|r
.target 林·柔掌
step
.goto 376,19.55,56.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦龙|r交谈
.accept 29982 >>接任务: |cRXP_WARN_疏散命令|r
.target 麦龙
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海云·绿耕|r交谈
.goto 376,15.85,56.27
.skipgossip 57123,1
.skipgossip 57124,1
.complete 29982,3 
.target 海云·绿耕
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米亚·泥皮|r交谈
.goto 376,15.48,54.93
.skipgossip 57126,1
.skipgossip 57127,1
.complete 29982,4 
.target 米亚·泥皮
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风爪|r交谈
.goto 376,12.850,55.721
.skipgossip 57121,1
.skipgossip 57122,1
.complete 29982,2 
.target 利齿 Shadepaw
step
#completewith next
>>击杀 |cRXP_ENEMY_伊克西克螳螂妖|r
.complete 29981,1 
.mob 伊克提克刀翼者
.mob 伊克提克迅爪者
step
#completewith next
.gossipoption 40360 >>与 |cRXP_FRIENDLY_魏·黑土|r 交谈一次
.timer 1,Roleplay Duration
step
>>击杀 |cRXP_ENEMY_伊克西克伏击者|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_魏·黑土|r 交谈两次
.goto 376,7.15,54.83
.skipgossip 57120,1
.complete 29982,1 
.mob 伊克提克伏击者
.target 魏·黑土
step
#loop
.goto 376,9.85,47.00,42,0
.goto 376,11.64,52.86,42,0
.goto 376,12.50,60.47,38,0
.goto 376,9.46,60.36,38,0
.goto 376,9.85,47.00,0
.goto 376,11.64,52.86,0
.goto 376,12.50,60.47,0
.goto 376,9.46,60.36,0
>>击杀 |cRXP_ENEMY_伊克西克螳螂妖|r
.complete 29981,1 
.mob 伊克提克刀翼者
.mob 伊克提克迅爪者
step
.goto 376,19.55,56.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦龙|r交谈
.turnin 29981 >>交任务: |cRXP_FRIENDLY_堵住虫群|r
.turnin 29982 >>交任务: |cRXP_FRIENDLY_疏散命令|r
.accept 29983 >>接任务: |cRXP_WARN_隐秘大师|r
.target 麦龙
step
.goto 376,18.29,31.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.turnin 29983 >>交任务: |cRXP_FRIENDLY_隐秘大师|r
.accept 29984 >>接任务: |cRXP_WARN_不屈之拳：竹之试炼|r
.target 断掌大师
step
.isOnQuest 29984
.vehicle >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.timer 26,Roleplay Duration
.skipgossip 56714,1
.target 断掌大师
step
>>使用 |T132334:0|t[不屈之拳] (1) |cRXP_WARN_当屏幕下方圆圈填满并发光时|r
.goto 376,18.29,31.22
.complete 29984,1 
step
.goto 376,18.30,31.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.turnin 29984 >>交任务: |cRXP_FRIENDLY_不屈之拳：竹之试炼|r
.target 断掌大师
.accept 29985 >>接任务: |cRXP_WARN_迷雾重重|r
.accept 29986 >>接任务: |cRXP_WARN_驱雾火盆|r
step
.goto 376,18.06,31.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r交谈
.accept 29992 >>接任务: |cRXP_WARN_以柔掌之名，以柔掌之誉|r
.target 林·柔掌
step
#completewith SouthernFogWard
>>击杀 |cRXP_ENEMY_迷雾化身|r
.complete 29985,1 
.mob 迷雾化身
step
#completewith SouthernFogWard
>>|cRXP_WARN_点击|r |cRXP_PICK_玉月草|r |cRXP_WARN_拾取|r |T136041:0|t[玉月草叶]
.complete 29992,1 
step
>>点击 |cRXP_PICK_北部驱雾火盆|r
.goto 376,16.017,32.103
.complete 29986,1 
step
>>点击 |cRXP_PICK_西部驱雾火盆|r
.goto 376,14.853,36.827
.complete 29986,2 
step
#label SouthernFogWard
>>点击 |cRXP_PICK_南部驱雾火盆|r
.goto 376,18.104,41.459
.complete 29986,3 
step
#completewith MistIncarnation
#hidewindow
#loop
.goto 376,18.264,38.237,25,0
.goto 376,19.074,35.042,30,0
.goto 376,17.877,33.701,25,0
.goto 376,16.855,29.516,25,0
.goto 376,15.910,33.957,25,0
.goto 376,14.206,41.283,25,0
.goto 376,18.896,41.497,25,0
.goto 376,18.264,38.237,0
.goto 376,19.074,35.042,0
.goto 376,17.877,33.701,0
.goto 376,16.855,29.516,0
.goto 376,15.910,33.957,0
.goto 376,14.206,41.283,0
.goto 376,18.896,41.497,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_迷雾化身|r
.complete 29985,1 
.mob 迷雾化身
step
>>|cRXP_WARN_点击|r |cRXP_PICK_玉月草|r |cRXP_WARN_拾取|r |T136041:0|t[玉月草叶]
.complete 29992,1 
step
#label MistIncarnation
>>击杀 |cRXP_ENEMY_迷雾化身|r
.complete 29985,1 
.mob 迷雾化身
step
.goto 376,18.06,31.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·柔掌|r交谈
.turnin 29992 >>交任务: |cRXP_FRIENDLY_以柔掌之名，以柔掌之誉|r
.target 林·柔掌
step
.goto 376,18.30,31.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.turnin 29985 >>交任务: |cRXP_FRIENDLY_迷雾重重|r
.turnin 29986 >>交任务: |cRXP_FRIENDLY_驱雾火盆|r
.accept 29987 >>接任务: |cRXP_WARN_不屈之拳：木之试炼|r
.target 断掌大师
step
.isOnQuest 29987
.vehicle >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.timer 18,Roleplay Duration
.goto 376,18.30,31.23
.skipgossip 56714,1
.target 断掌大师
step
.goto 376,18.28,32.14
>>使用 |T132334:0|t[不屈之拳] (1) |cRXP_WARN_当屏幕下方圆圈填满并发光时|r
.complete 29987,1 
step
.goto 376,18.29,31.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_断掌大师|r交谈
.turnin 29987 >>交任务: |cRXP_FRIENDLY_不屈之拳：木之试炼|r
.target 断掌大师
TODO for Loremaster: Add missing quests after this point
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 9a) 塔隆米尔高地
#displayname 第 8 章 - 塔隆米尔高地
#next 9b) 恐惧废土
step
.goto 388,71.16,56.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 31695 >>交任务: |cRXP_FRIENDLY_城墙之外|r
.accept 30814 >>接任务: |cRXP_WARN_迈出第一步|r
.target 祝踏岚
step
#loop
.goto 388,70.33,54.19,30,0
.goto 388,70.06,53.00,30,0
.goto 388,71.12,52.16,30,0
.goto 388,71.47,53.14,30,0
.goto 388,70.33,54.19,0
.goto 388,70.06,53.00,0
.goto 388,71.12,52.16,0
.goto 388,71.47,53.14,0
>>击杀 |cRXP_ENEMY_奥苏尔冲锋者|r
.complete 30814,1 
.mob osul charger
step
.goto 388,71.16,56.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30814 >>交任务: |cRXP_FRIENDLY_迈出第一步|r
.accept 30769 >>接任务: |cRXP_WARN_首波攻击|r
.accept 30770 >>接任务: |cRXP_WARN_四散奔逃|r
.accept 30771 >>接任务: |cRXP_WARN_完美沥青|r
.target 祝踏岚
step
#completewith Osul Sharphorn
#hidewindow
#loop
.goto 388,68.96,55.25,40,0
.goto 388,68.43,54.65,40,0
.goto 388,67.26,54.54,40,0
.goto 388,67.43,53.88,40,0
.goto 388,68.39,53.10,40,0
.goto 388,68.80,52.01,40,0
.goto 388,69.37,50.29,40,0
.goto 388,68.96,55.25,0
.goto 388,68.43,54.65,0
.goto 388,67.26,54.54,0
.goto 388,67.43,53.88,0
.goto 388,68.39,53.10,0
.goto 388,68.80,52.01,0
.goto 388,69.37,50.29,0
+1
step
#completewith Pots
>>击杀 |cRXP_ENEMY_奥苏尔锐角者|r
.complete 30769,1 
.mob osul sharphorn
step
#completewith Pots
>>与 |cRXP_FRIENDLY_长毛牦牛|r 和 |cRXP_FRIENDLY_高原巨兽|r 互动
.complete 30770,1 
.target 长毛牦牛
.target 高原巨兽
step
#label Pots
>>点击 |cRXP_PICK_锅|r
.complete 30771,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_奥苏尔锐角者|r
.complete 30769,1 
.mob osul sharphorn
step
>>与 |cRXP_FRIENDLY_长毛牦牛|r 和 |cRXP_FRIENDLY_高原巨兽|r 互动
.complete 30770,1 
.target 长毛牦牛
.target 高原巨兽
step
#label Osul Sharphorn
>>击杀 |cRXP_ENEMY_奥苏尔锐角者|r
.complete 30769,1 
.mob osul sharphorn
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_速娜·静刃|r和|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30769 >>交任务: |cRXP_FRIENDLY_首波攻击|r
.accept 30772 >>接任务: |cRXP_WARN_红色高原|r
.accept 30774 >>接任务: |cRXP_WARN_营救游侠|r
.goto 388,67.25,52.22
.turnin 30770 >>交任务: |cRXP_FRIENDLY_四散奔逃|r
.turnin 30771 >>交任务: |cRXP_FRIENDLY_完美沥青|r
.accept 30773 >>接任务: |cRXP_WARN_借花献佛|r
.goto 388,67.21,52.28
.target 孙娜·默拳
.target 班·熊心
step
#completewith next
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.complete 30774,1 
.collect 81178,4,30774,0x2,-1
.disablecheckbox
.mob osul marauder
.target 龙影游侠
step
.goto 388,67.01,51.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战败的卡塔克|r交谈
.accept 30775 >>接任务: |cRXP_WARN_放逐|r
.target 战败的卡塔克
step
#completewith Ku-Tong
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.complete 30774,1 
.collect 81178,4,30774,0x2,-1
.disablecheckbox
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
#completewith Ku-Tong
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
.goto 388,66.97,47.93,10,0
.goto 388,66.96,48.25
#label Ku-Tong
>>击杀小屋内的 |cRXP_ENEMY_库桐|r |cRXP_WARN_|r
.complete 30775,3 
.mob ku-tong
step
#completewith Free Lin Silentstrike
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
#completewith Free Lin Silentstrike
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.complete 30774,2 
.collect 81178,4,30774,0x2,-1
.disablecheckbox
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
.goto 388,66.58,49.16
#label Free Lin Silentstrike
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·默拳|r交谈
.complete 30774,3 
.skipgossip
.target 林·默拳
step
#completewith Dominance
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.collect 81178,4,30774,0x2,-1
.complete 30774,2 
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
#completewith Dominance
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
#label Dominance
.achievement 6847,2 >>点击 |cRXP_PICK_卷轴|r
step
#completewith Urang
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.collect 81178,4,30774,0x2,-1
.complete 30774,2 
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
#completewith Urang
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
.goto 388,64.80,50.21
#label Urang
>>击杀小屋内的 |cRXP_ENEMY_厄尔昂|r |cRXP_WARN_|r
.complete 30775,2 
.mob urang
step
#completewith Battat
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.collect 81178,4,30774,0x2,-1
.complete 30774,2 
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
#completewith Battat
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
.goto 388,65.75,51.4,10,0
.goto 388,65.72,51.64
#label Battat
>>击杀小屋内的 |cRXP_ENEMY_巴塔特|r |cRXP_WARN_|r
.complete 30775,1 
.mob battat
step
#completewith Osul Marauder
#hidewindow
#loop
.goto 388,66.14,52.44,40,0
.goto 388,67.49,50.99,40,0
.goto 388,68.05,49.37,40,0
.goto 388,67.27,46.01,40,0
.goto 388,67.43,44.31,40,0
.goto 388,67.10,43.57,40,0
.goto 388,66.34,45.13,40,0
.goto 388,66.25,46.27,40,0
.goto 388,64.89,50.58,40,0
.goto 388,66.14,52.44,0
.goto 388,67.49,50.99,0
.goto 388,68.05,49.37,0
.goto 388,67.27,46.01,0
.goto 388,67.43,44.31,0
.goto 388,67.10,43.57,0
.goto 388,66.34,45.13,0
.goto 388,66.25,46.27,0
.goto 388,64.89,50.58,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.collect 81178,4,30774,0x2,-1
.complete 30774,2 
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
>>将 |T463515:0|t[班的炸药] 扔到 |cRXP_WARN_弩车|r 上. |cFFFF0000不要扔在带旋转长杆的弩车上|r
.complete 30773,1 
.use 81193
step
#label Osul Marauder
>>击杀 |cRXP_ENEMY_奥苏尔劫掠者|r 和 |cRXP_ENEMY_奥苏尔喷火者|r, 拾取 |cRXP_LOOT_石刻钥匙|r 打开附近的 |cRXP_PICK_笼子|r
.complete 30772,1 
.collect 81178,4,30774,0x2,-1
.complete 30774,2 
.mob osul marauder
.mob 奥苏尔喷火者
.target 龙影游侠
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r和|cRXP_FRIENDLY_孙娜·默拳|r交谈
.turnin 30774 >>交任务: |cRXP_FRIENDLY_营救游侠|r
.turnin 30772 >>交任务: |cRXP_FRIENDLY_红色高原|r
.turnin 30773 >>交任务: |cRXP_FRIENDLY_借花献佛|r
.goto 388,67.21,52.27
.accept 30776 >>接任务: |cRXP_WARN_江达克|r
.goto 388,67.26,52.22
.target 孙娜·默拳
.target 班·熊心
step
.goto 388,66.99,51.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战败的卡塔克|r交谈
.turnin 30775 >>交任务: |cRXP_FRIENDLY_放逐|r
.target 战败的卡塔克
step
.goto 388,66.66,51
>>点击 |cRXP_PICK_仪式桩|r, 然后击杀 |cRXP_ENEMY_荣德|r
.complete 30776,1 
.mob jung duk
step
.goto 388,71.02,56.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30776 >>交任务: |cRXP_FRIENDLY_江达克|r
.accept 30777 >>接任务: |cRXP_WARN_搜寻孙娜|r
.timer 15,RP
.target 班·熊心
step
.goto 388,82.68,73.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30777 >>交任务: |cRXP_FRIENDLY_搜寻孙娜|r
.accept 30778 >>接任务: |cRXP_WARN_尘归尘，土归土|r
.accept 30779 >>接任务: |cRXP_WARN_杀死食腐者|r
.target 班·熊心
step
.goto 388,82.71,73.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖图|r交谈
.accept 30781 >>接任务: |cRXP_WARN_野牛人的丧钟|r
.target 肖图
step
.goto 388,82.59,73.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅丽亚·圣言者|r交谈
.accept 30780 >>接任务: |cRXP_WARN_图腾研究|r
.target 雅丽亚·圣言者
step
#completewith Eastern Smoke Trail
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
#completewith Eastern Smoke Trail
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#completewith Eastern Smoke Trail
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#label Eastern Smoke Trail
.goto 388,81.26,72.27
>>前往烟雾轨迹, 确保 |cRXP_FRIENDLY_肖图|r 跟随你
*|cRXP_WARN_Wait for him at the smoke trail.|r
*|cFFFF0000In case you lose him, talk to him at his original location.|r
.complete 30781,2 
.timer 6,RP
.target 肖图
step
#completewith Northwestern Smoke Trail
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
#completewith Northwestern Smoke Trail
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#completewith Northwestern Smoke Trail
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#label Northwestern Smoke Trail
.goto 388,84.12,70.62
>>前往烟雾轨迹, 确保 |cRXP_FRIENDLY_肖图|r 跟随你
*|cRXP_WARN_Wait for him at the smoke trail.|r
*|cFFFF0000In case you lose him, talk to him at his original location.|r
.complete 30781,4 
.target 肖图
step
#completewith Eastern Smoke Trail
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
#completewith Eastern Smoke Trail
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#completewith Eastern Smoke Trail
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#label Eastern Smoke Trail
.goto 388,84.86,71.55
>>前往烟雾轨迹, 确保 |cRXP_FRIENDLY_肖图|r 跟随你
*|cRXP_WARN_Wait for him at the smoke trail.|r
*|cFFFF0000In case you lose him, talk to him at his original location.|r
.complete 30781,1 
.target 肖图
step
#completewith Trapped in a strange land
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
#completewith Trapped in a strange land
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#completewith Trapped in a strange land
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#label Trapped in a strange land
.goto 388,84.08,72.87
.achievement 6847,4 >>点击 |cRXP_PICK_卷轴|r
step
#completewith Southern Smoke Trail
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#completewith Southern Smoke Trail
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#label Southern Smoke Trail
.goto 388,83.49,78.51
>>前往烟雾轨迹, 确保 |cRXP_FRIENDLY_肖图|r 跟随你
*|cFFFF0000In case you lose him, talk to him at his original location.|r
.complete 30781,3 
.target 肖图
step
#completewith Ashfang Hyena
#hidewindow
#loop
.goto 388,83.02,79.57,40,0
.goto 388,83.00,77.23,40,0
.goto 388,82.62,74.11,40,0
.goto 388,80.27,71.93,40,0
.goto 388,82.65,70.41,40,0
.goto 388,83.02,79.57,0
.goto 388,83.00,77.23,0
.goto 388,82.62,74.11,0
.goto 388,80.27,71.93,0
.goto 388,82.65,70.41,0
+1
step
#completewith Palewind Villagers
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
#completewith Palewind Villagers
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#label Palewind Villagers
>>向 |cRXP_ENEMY_苍风村民|r 投掷 |T135432:0|t[影踪派火把]
.complete 30778,1 
.mob 苍风村民
step
#completewith next
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
>>点击 |cRXP_PICK_苍风图腾|r
.complete 30780,1 
step
#label Ashfang Hyena
>>击杀 |cRXP_ENEMY_灰牙土狼|r
.complete 30779,1 
.mob ashfang hyena
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r和|cRXP_FRIENDLY_雅丽亚·圣言者|r交谈
.turnin 30778 >>交任务: |cRXP_FRIENDLY_尘归尘，土归土|r
.turnin 30779 >>交任务: |cRXP_FRIENDLY_杀死食腐者|r
.turnin 30781 >>交任务: |cRXP_FRIENDLY_野牛人的丧钟|r
.goto 388,82.68,73.03
.turnin 30780 >>交任务: |cRXP_FRIENDLY_图腾研究|r
.accept 30827 >>接任务: |cRXP_WARN_幕后黑手|r
.goto 388,82.6,73.03
.target 雅丽亚·圣言者
.target 班·熊心
step
.goto 388,82.59,73.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅丽亚·圣言者|r交谈
.complete 30827,1 
.timer 18,RP
.skipgossip 60864,1
.target 雅丽亚·圣言者
step
.goto 388,82.59,73.25
>>点击 |cRXP_PICK_仁慈图腾|r
.complete 30827,2 
step
.goto 388,82.69,73.64
>>点击 |cRXP_PICK_静寂图腾|r
.complete 30827,4 
step
.goto 388,82.42,73.57
>>点击 |cRXP_PICK_宁神图腾|r
.complete 30827,3 
.timer 30,RP
step
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30827,5 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅丽亚·圣言者|r和|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30827 >>交任务: |cRXP_FRIENDLY_幕后黑手|r
.accept 30783 >>接任务: |cRXP_WARN_恨之入骨|r
.goto 388,82.59,73.04
.accept 30782 >>接任务: |cRXP_WARN_怨恨的灵魂|r
.goto 388,82.68,73.03
.target 班·熊心
step
#completewith Spiteful Spirit
#hidewindow
#loop
.goto 388,83.22,73.59,40,0
.goto 388,82.28,73.91,40,0
.goto 388,81.97,72.68,40,0
.goto 388,83.02,71.87,40,0
.goto 388,83.22,73.59,0
.goto 388,82.28,73.91,0
.goto 388,81.97,72.68,0
.goto 388,83.02,71.87,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_怨恨的灵魂|r
.complete 30782,1 
.mob spiteful spirit
step
>>将 |T310733:0|t[祥和图腾] 投放在 |cRXP_FRIENDLY_疯狂的影踪派游侠|r 身上, 然后击杀 |cRXP_ENEMY_沸腾的仇恨|r
.complete 30783,1 
.mob 沸腾之怨
step
#label Spiteful Spirit
>>击杀 |cRXP_ENEMY_怨恨的灵魂|r
.complete 30782,1 
.mob spiteful spirit
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅丽亚·圣言者|r和|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30783 >>交任务: |cRXP_FRIENDLY_恨之入骨|r
.goto 388,82.6,73.03
.turnin 30782 >>交任务: |cRXP_FRIENDLY_怨恨的灵魂|r
.accept 30784 >>接任务: |cRXP_WARN_不归路|r
.goto 388,82.67,73.03
.target 雅丽亚·圣言者
.target 班·熊心
step
.goto 388,84.08,70.52
>>击杀 |cRXP_ENEMY_孙娜·默拳|r
.complete 30784,1 
.mob 孙娜·默拳
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r和|cRXP_FRIENDLY_雅丽亚·圣言者|r交谈
.turnin 30784 >>交任务: |cRXP_FRIENDLY_不归路|r
.accept 30785 >>接任务: |cRXP_WARN_高岚阵|r
.goto 388,82.68,73.02
.goto 388,82.59,73.03
.target 雅丽亚·圣言者
.target 班·熊心
step
.goto 388,76.41,82.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30785 >>交任务: |cRXP_FRIENDLY_高岚阵|r
.target 祝踏岚
.accept 30884 >>接任务: |cRXP_WARN_战场后方|r
step
.goto 388,75.86,83.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_草药师赛蒂|r交谈
.accept 30891 >>接任务: |cRXP_WARN_解毒良药|r
.target 草药师赛菩提
step
#completewith next
>>点击 |cRXP_PICK_紫色香橼|r
.complete 30891,1 
step
.goto 388,76.94,78.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r交谈
.turnin 30884 >>交任务: |cRXP_FRIENDLY_战场后方|r
.target 陶矢
.accept 30887 >>接任务: |cRXP_WARN_不速之客|r
step
#completewith Krik'thik Deep-Scout
#hidewindow
#loop
.goto 388,77.99,80.34,40,0
.goto 388,78.69,80.95,40,0
.goto 388,79.41,78.88,40,0
.goto 388,79.84,76.93,40,0
.goto 388,78.77,75.90,40,0
.goto 388,78.41,75.15,40,0
.goto 388,76.48,76.91,40,0
.goto 388,77.99,80.34,0
.goto 388,78.69,80.95,0
.goto 388,79.41,78.88,0
.goto 388,79.84,76.93,0
.goto 388,78.77,75.90,0
.goto 388,78.41,75.15,0
.goto 388,76.48,76.91,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_克里克提克深穴斥候|r
.complete 30887,1 
.mob krik'thik deep-scout
step
>>点击 |cRXP_PICK_紫色香橼|r
.complete 30891,1 
step
#label Krik'thik Deep-Scout
>>击杀 |cRXP_ENEMY_克里克提克深穴斥候|r
.complete 30887,1 
.mob krik'thik deep-scout
step
.goto 388,75.86,83.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_草药师赛蒂|r交谈
.turnin 30891 >>交任务: |cRXP_FRIENDLY_解毒良药|r
.target 草药师赛菩提
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r和|cRXP_FRIENDLY_哨兵老毛|r交谈
.turnin 30887 >>交任务: |cRXP_FRIENDLY_不速之客|r
.accept 30888 >>接任务: |cRXP_WARN_防线上的突破口|r
.accept 30890 >>接任务: |cRXP_WARN_疲惫不堪|r
.goto 388,79.47,84.47
.accept 30889 >>接任务: |cRXP_WARN_布置陷阱|r
.goto 388,79.38,84.45
.target 哨兵老毛
.target 陶矢
step
#completewith Scout Jai-gan
*Use |T135815:0|t[影踪派 Flare] near moving red dust to make |cRXP_ENEMY_Krik'thik Scentlayer|r visible.
>>击杀 |cRXP_ENEMY_克里克提克气味层|r
.complete 30888,1 
.mob krik'thik scentlayer
.use 81925
step
#completewith Scout Jai-gan
>>点击 |cRXP_PICK_影踪派尖刺陷阱|r
.complete 30889,1 
step
.goto 388,82.21,84.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斥候魏勤|r交谈
.complete 30890,1 
.skipgossip
.target 斥候魏庆
step
.goto 388,81.30,86.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斥候龙|r交谈
.complete 30890,2 
.skipgossip
.target 斥候龙凡
step
.goto 388,82.52,89.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斥候英|r交谈
.complete 30890,3 
.skipgossip
.target 斥候盈盈
step
#label Scout Jai-gan
.goto 388,79.02,90.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斥候贾干|r交谈
.complete 30890,4 
.skipgossip
.target 斥候贾肯
step
#completewith Krik'thik Scentlayer
#hidewindow
#loop
.goto 388,80.71,87.11,40,0
.goto 388,81.30,83.97,40,0
.goto 388,81.34,82.25,40,0
.goto 388,81.98,84.61,40,0
.goto 388,81.87,88.40,40,0
.goto 388,81.11,90.75,40,0
.goto 388,80.71,87.11,0
.goto 388,81.30,83.97,0
.goto 388,81.34,82.25,0
.goto 388,81.98,84.61,0
.goto 388,81.87,88.40,0
.goto 388,81.11,90.75,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_克里克提克气味层|r
*Use |T135815:0|t[影踪派 Flare] near moving red dust to make |cRXP_ENEMY_Krik'thik Scentlayer|r visible.
.complete 30888,1 
.mob krik'thik scentlayer
step
>>点击 |cRXP_PICK_影踪派尖刺陷阱|r
.complete 30889,1 
.use 81925
step
#label Krik'thik Scentlayer
>>击杀 |cRXP_ENEMY_克里克提克气味层|r
*Use |T135815:0|t[影踪派 Flare] near moving red dust to make |cRXP_ENEMY_Krik'thik Scentlayer|r visible.
.complete 30888,1 
.mob krik'thik scentlayer
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r和|cRXP_FRIENDLY_哨兵老毛|r交谈
.turnin 30888 >>交任务: |cRXP_FRIENDLY_防线上的突破口|r
.turnin 30890 >>交任务: |cRXP_FRIENDLY_疲惫不堪|r
.accept 30960 >>接任务: |cRXP_WARN_小径归来|r
.goto 388,79.46,84.47
.turnin 30889 >>交任务: |cRXP_FRIENDLY_布置陷阱|r
.goto 388,79.39,84.46
.target 哨兵老毛
.target 陶矢
step
.goto 388,76.41,82.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30960 >>交任务: |cRXP_FRIENDLY_小径归来|r
.target 祝踏岚
.accept 30893 >>接任务: |cRXP_WARN_无尽的螳螂妖|r
step
.goto 388,75.86,83.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_草药师赛蒂|r交谈
.accept 30892 >>接任务: |cRXP_WARN_救死扶伤|r
.accept 30894 >>接任务: |cRXP_WARN_搜查遗体|r
.target 草药师赛菩提
step
#completewith Krik'thik Limbpincer
#hidewindow
#loop
.goto 388,73.68,86.64,40,0
.goto 388,73.53,88.82,40,0
.goto 388,74.50,90.48,40,0
.goto 388,75.25,89.01,40,0
.goto 388,74.78,87.34,40,0
.goto 388,74.72,85.84,40,0
.goto 388,73.68,86.64,0
.goto 388,73.53,88.82,0
.goto 388,74.50,90.48,0
.goto 388,75.25,89.01,0
.goto 388,74.78,87.34,0
.goto 388,74.72,85.84,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_克里克提克断肢钳|r 和 |cRXP_ENEMY_克里克提克蝗虫守卫|r, 然后点击它们的 |cRXP_PICK_克里克提克断肢|r
.complete 30893,1 
.complete 30894,1 
.mob 科里克提克钳肢者
.mob 科里克提克蝗卫
step
>>对 |cRXP_FRIENDLY_受伤的黑色卫士|r 使用 |T237266:0|t[香橼精油绷带]
*|cRXP_WARN_Priotize your own healing spells, if you have any.|r
.complete 30892,1 
.use 82787
.target Injured Gao-ran Blackguards
step
#label Krik'thik Limbpincer
>>击杀 |cRXP_ENEMY_克里克提克断肢钳|r 和 |cRXP_ENEMY_克里克提克蝗虫守卫|r, 然后点击它们的 |cRXP_PICK_克里克提克断肢|r
.complete 30893,1 
.complete 30894,1 
.mob 科里克提克钳肢者
.mob 科里克提克蝗卫
step
.goto 388,75.86,83.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_草药师赛蒂|r交谈
.turnin 30892 >>交任务: |cRXP_FRIENDLY_救死扶伤|r
.turnin 30894 >>交任务: |cRXP_FRIENDLY_搜查遗体|r
.target 草药师赛菩提
step
.goto 388,76.42,82.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30893 >>交任务: |cRXP_FRIENDLY_无尽的螳螂妖|r
.target 祝踏岚
.accept 30895 >>接任务: |cRXP_WARN_临时弹药|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新丁冯|r和|cRXP_FRIENDLY_新丁超|r交谈
.accept 30896 >>接任务: |cRXP_WARN_小偷和捣蛋鬼|r
.goto 388,70.46,86.37
.accept 30897 >>接任务: |cRXP_WARN_所托非人|r
.goto 388,70.33,86.67
.target 新丁大冯
.target 新丁小赵
step
#completewith next
>>击杀 |cRXP_ENEMY_躁动的荨皮精怪|r 和 |cRXP_ENEMY_躁动的种子掠夺者|r, 拾取 |cRXP_LOOT_不稳定的恐惧宝珠|r
.complete 30896,1 
.complete 30895,1 
.mob 躁动的荨皮精怪
.mob 躁动的种子小偷
step
.goto 388,63.07,87.65
>>击杀 |cRXP_ENEMY_针底|r, 拾取 |cRXP_LOOT_超的剑|r
.complete 30897,1 
.mob 钝针头
step
#loop
.goto 388,65.27,87.95,40,0
.goto 388,67.00,87.12,40,0
.goto 388,68.90,89.21,40,0
.goto 388,68.65,85.72,40,0
.goto 388,69.97,84.44,40,0
.goto 388,65.27,87.95,0
.goto 388,67.00,87.12,0
.goto 388,68.90,89.21,0
.goto 388,68.65,85.72,0
.goto 388,69.97,84.44,0
>>击杀 |cRXP_ENEMY_躁动的荨皮精怪|r 和 |cRXP_ENEMY_躁动的种子掠夺者|r, 拾取 |cRXP_LOOT_不稳定的恐惧宝珠|r. |cRXP_WARN_同时点击它们|r
.complete 30896,1 
.complete 30895,1 
.mob 躁动的荨皮精怪
.mob 躁动的种子小偷
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新丁冯|r和|cRXP_FRIENDLY_新丁超|r交谈
.turnin 30897 >>交任务: |cRXP_FRIENDLY_所托非人|r
.goto 388,70.34,86.67
.turnin 30896 >>交任务: |cRXP_FRIENDLY_小偷和捣蛋鬼|r
.goto 388,70.46,86.38
.target 新丁小赵
.target 新丁大冯
step
.goto 388,76.41,82.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30895 >>交任务: |cRXP_FRIENDLY_临时弹药|r
.target 祝踏岚
.accept 30898 >>接任务: |cRXP_WARN_削减虫群|r
step
.goto 388,74.8,84.72
.isOnQuest 30898
.vehicle >>点击 |cRXP_PICK_龙息火炮|r
.target 龙息火炮
step
>>使用 |T135597:0|t[龙炮] 击杀来袭的 |cRXP_ENEMY_克里克提克雄蜂|r
.complete 30898,1 
.mob krik'thik drone
step
.goto 388,74.22,85.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r交谈
.turnin 30898 >>交任务: |cRXP_FRIENDLY_削减虫群|r
.target 陶矢
.accept 30900 >>接任务: |cRXP_WARN_恐惧废土之骇|r
step
.goto 388,74.41,86.37
>>击杀从泥土中出现的 |cRXP_ENEMY_诺尔瓦凯斯|r
.complete 30900,1 
.mob norvakess
step
.goto 388,76.42,82.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30900 >>交任务: |cRXP_FRIENDLY_恐惧废土之骇|r
.target 祝踏岚
.accept 30901 >>接任务: |cRXP_WARN_沿着南部前线|r
step
.goto 388,67.31,80.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r交谈
.turnin 30901 >>交任务: |cRXP_FRIENDLY_沿着南部前线|r
.target 陶矢
.accept 30970 >>接任务: |cRXP_WARN_憎恨的怒火|r
step
.goto 388,67.36,80.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_徒弟包梅|r交谈
.accept 30971 >>接任务: |cRXP_WARN_添加库存|r
.target 徒弟包默
step
#completewith Seething Fleshripper
#hidewindow
#loop
.goto 388,64.17,82.63,40,0
.goto 388,66.69,83.71,40,0
.goto 388,66.65,81.43,40,0
.goto 388,64.17,82.63,0
.goto 388,66.69,83.71,0
.goto 388,66.65,81.43,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_灼热裂肢蝎|r
.complete 30970,1 
.mob seething fleshripper
step
>>点击 |cRXP_PICK_影踪派火箭|r
.complete 30971,1 
step
#label Seething Fleshripper
>>击杀 |cRXP_ENEMY_灼热裂肢蝎|r
.complete 30970,1 
.mob seething fleshripper
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r和|cRXP_FRIENDLY_徒弟包梅|r交谈
.turnin 30970 >>交任务: |cRXP_FRIENDLY_憎恨的怒火|r
.goto 388,67.32,80.86
.turnin 30971 >>交任务: |cRXP_FRIENDLY_添加库存|r
.accept 30972 >>接任务: |cRXP_WARN_加入战斗|r
.goto 388,67.37,80.67
.target 陶矢
.target 徒弟包默
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁腹老陈|r和|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30972 >>交任务: |cRXP_FRIENDLY_加入战斗|r
.goto 388,61.59,79.36
.accept 30973 >>接任务: |cRXP_WARN_火攻|r
.goto 388,61.64,79.33
.target 祝踏岚
.target 铁腹老陈
step
#loop
.goto 388,61.24,79.28,40,0
.goto 388,60.77,78.83,40,0
.goto 388,62.14,79.64,40,0
.goto 388,60.58,81.01,40,0
.goto 388,61.24,79.28,0
.goto 388,60.77,78.83,0
.goto 388,62.14,79.64,0
.goto 388,60.58,81.01,0
>>击杀 |cRXP_ENEMY_科尔提克剥皮者|r
.complete 30973,1 
.mob kor'thik timberhusk
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r和|cRXP_FRIENDLY_铁腹老陈|r交谈
.turnin 30973 >>交任务: |cRXP_FRIENDLY_火攻|r
.goto 388,61.64,79.32
.accept 30975 >>接任务: |cRXP_WARN_占领黯光桥|r
.goto 388,61.6,79.35
.target 铁腹老陈
.target 祝踏岚
step
.isOnQuest 30975
.goto 422,44.87,9.87,5 >>|cRXP_WARN_跟随箭头指引|r
.timer 15, Time until enemy arrival
step
.goto 422,43.33,10.89,20,0
.goto 422,44.38,12.08,20,0
.goto 422,45.57,11.24,20,0
.goto 422,44.85,9.96
>>击杀 |cRXP_ENEMY_科尔提克放血者|r 和 |cRXP_ENEMY_巨型科尔提克血肉撕裂者|r, |cRXP_WARN_拾取桶获得伤害加成|r
.complete 30975,1 
.complete 30975,2 
.mob hulking kor'thik fleshrender
.mob kor'thik bloodletter
step
.goto 388,61.11,83.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30975 >>交任务: |cRXP_FRIENDLY_占领黯光桥|r
.target 祝踏岚
.accept 30976 >>接任务: |cRXP_WARN_参加狩猎|r
step
.goto 388,67.94,67.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥比斯|r交谈
.target 奥比斯
.accept 30786 >>接任务: |cRXP_WARN_利矛穿心，铁锁囚魂|r
step
.goto 388,68.42,71.46,10,0
.goto 388,67.94,67.66
>>击杀 |cRXP_ENEMY_迪蒙·纳努克|r, |cRXP_WARN_血量降至 0% 后立即返回任务发布者处|r
.complete 30786,1 
.mob dmong naruuk
step
.goto 388,67.94,67.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥比斯|r交谈
.turnin 30786 >>交任务: |cRXP_FRIENDLY_利矛穿心，铁锁囚魂|r
.target 奥比斯
.accept 30787 >>接任务: |cRXP_WARN_火把|r
step
#loop
>>击杀 |cRXP_ENEMY_奥苏尔迷雾萨满|r, 然后点击 |cRXP_PICK_迷雾萨满的火把|r
.goto 388,66.30,67.89,30,0
.goto 388,65.76,68.96,30,0
.goto 388,67.94,69.51,30,0
.goto 388,66.30,67.89,0
.goto 388,65.76,68.96,0
.goto 388,67.94,69.51,0
.complete 30787,1 
.mob 奥苏尔迷雾萨满
step
.goto 388,67.94,67.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥比斯|r交谈
.turnin 30787 >>交任务: |cRXP_FRIENDLY_火把|r
.target 奥比斯
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r和|cRXP_FRIENDLY_任赛·橡木皮|r交谈
.turnin 30976 >>交任务: |cRXP_FRIENDLY_参加狩猎|r
.accept 30899 >>接任务: |cRXP_WARN_神射手|r
.goto 388,54.04,78.08
.accept 30977 >>接任务: |cRXP_WARN_落地欢迎|r
.goto 388,53.93,78.14
.target 任塞·橡皮
.target 祝踏岚
step
.goto 388,51.27,83.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_神射手叶|r交谈
.accept 31032 >>接任务: |cRXP_WARN_烟雾弥漫|r
.target 神射手叶飞
step
#completewith next
>>击杀 |cRXP_ENEMY_科尔提克疾翼|r
*Use |T135433:0|t[Wu Kao Torch] near dead |cRXP_ENEMY_Kor'thik Fleetwing.|r
.complete 30977,1 
.complete 31032,1 
.mob kor'thik fleetwing
.use 83768
step
.goto 388,51.67,87.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰主砮荣|r交谈
.turnin 30899 >>交任务: |cRXP_FRIENDLY_神射手|r
.target 鹰眼大师砮荣
.accept 30978 >>接任务: |cRXP_WARN_愤怒的天空|r
step
.goto 388,51.66,87.31
.isOnQuest 30978
.vehicle >>点击 |cRXP_PICK_努荣的火炮|r
.target 砮荣的弩炮
step
.goto 388,51.66,87.31
>>使用 (1) |T135597:0|t[努隆的炮击] 击落 |cRXP_ENEMY_科尔提克虫群|r, 然后击杀 |cRXP_ENEMY_沃雷斯萨利克|r
*|cRXP_WARN_Don't spam shot at |cRXP_ENEMY_沃瑞斯塔利克|r, try to be gentle :)|r
.complete 30978,1 
.complete 30978,2 
.target 沃尔斯萨里克
.target 库尔提克集结者s
step
.goto 388,51.67,87.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰主砮荣|r交谈
.turnin 30978 >>交任务: |cRXP_FRIENDLY_愤怒的天空|r
.target 鹰眼大师砮荣
.accept 30979 >>接任务: |cRXP_WARN_毁灭|r
step
#loop
.goto 388,53.64,87.59,20,0
.goto 388,54.25,87.76,20,0
.goto 388,53.64,87.59,0
.goto 388,54.25,87.76,0
>>击杀 |cRXP_ENEMY_沃雷斯萨利克|r
.complete 30979,1 
.mob voress'thalik
step
.goto 388,53.99,86.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰主砮荣|r交谈
.turnin 30979 >>交任务: |cRXP_FRIENDLY_毁灭|r
.accept 30980 >>接任务: |cRXP_WARN_影踪派的英雄|r
.target 鹰眼大师砮荣
step
#loop
.goto 388,52.28,82.91,20,0
.goto 388,50.37,84.64,20,0
.goto 388,51.30,85.97,20,0
.goto 388,52.28,82.91,0
.goto 388,50.37,84.64,0
.goto 388,51.30,85.97,0
>>击杀 |cRXP_ENEMY_科尔提克疾翼|r
*Use |T135433:0|t[Wu Kao Torch] near dead |cRXP_ENEMY_Kor'thik Fleetwing.|r
.complete 30977,1 
.complete 31032,1 
.mob kor'thik fleetwing
.use 83768
step
.goto 388,51.26,83.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_神射手叶|r交谈
.turnin 31032 >>交任务: |cRXP_FRIENDLY_烟雾弥漫|r
.target 神射手叶飞
step
.goto 388,53.92,78.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_任赛·橡木皮|r交谈
.turnin 30977 >>交任务: |cRXP_FRIENDLY_落地欢迎|r
.target 任塞·橡皮
step
.goto 388,54.07,77.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30980 >>交任务: |cRXP_FRIENDLY_影踪派的英雄|r
.target 祝踏岚
.accept 31065 >>接任务: |cRXP_WARN_洞悉|r
step
.goto 388,53.49,77.40
>>点击 |cRXP_PICK_武侯望远镜|r
.complete 31065,1 
step
.goto 388,54.06,77.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 31065 >>交任务: |cRXP_FRIENDLY_洞悉|r
.target 祝踏岚
.accept 30981 >>接任务: |cRXP_WARN_陶矢和考维克西斯|r
.accept 31063 >>接任务: |cRXP_WARN_老陈和塞勒沃克斯|r
.accept 31064 >>接任务: |cRXP_WARN_砮荣和罗塞克|r
step
.goto 388,53.94,78.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_任赛·橡木皮|r交谈
.accept 31687 >>接任务: |cRXP_WARN_削弱希克提克|r
.accept 31688 >>接任务: |cRXP_WARN_寻找冷恒|r
.target 任塞·橡皮
step
#completewith Korvexxis
>>击杀 |cRXP_ENEMY_希克提克螳螂妖|r
.complete 31687,1 
.mob 希克提克雄虫
.mob 希克提克巢穴卫士
.mob 希克提克喷毒者
step
#completewith Korvexxis
>>点击 |cRXP_PICK_希克提克囚笼|r
.complete 31688,1 
.complete 31688,2 
step
#label Korvexxis
.goto 388,46.64,83.04
>>击杀 |cRXP_ENEMY_考维克西斯|r
.complete 30981,1 
.mob korvexxis
step
#completewith Serevex
>>击杀 |cRXP_ENEMY_希克提克螳螂妖|r
.complete 31687,1 
.mob 希克提克雄虫
.mob 希克提克巢穴卫士
.mob 希克提克喷毒者
step
#completewith Serevex
>>点击 |cRXP_PICK_希克提克囚笼|r
.complete 31688,1 
.complete 31688,2 
step
#label Serevex
.goto 388,45.35,77.39
>>击杀 |cRXP_ENEMY_塞勒沃克斯|r
.complete 31063,1 
.mob serevex
step
#completewith Rothek
>>击杀 |cRXP_ENEMY_希克提克螳螂妖|r
.complete 31687,1 
.mob 希克提克雄虫
.mob 希克提克巢穴卫士
.mob 希克提克喷毒者
step
#completewith Rothek
>>点击 |cRXP_PICK_希克提克囚笼|r
.complete 31688,1 
.complete 31688,2 
step
#label Rothek
.goto 388,39.82,75.66
>>击杀 |cRXP_ENEMY_罗塞克|r
.complete 31064,1 
.mob rothek
step
#completewith Sik'thik Mantids
#hidewindow
#loop
.goto 388,40.70,80.95,40,0
.goto 388,42.62,78.48,40,0
.goto 388,44.29,77.31,40,0
.goto 388,46.64,76.70,40,0
.goto 388,46.60,74.42,40,0
.goto 388,49.41,78.82,40,0
.goto 388,47.78,83.93,40,0
.goto 388,46.95,86.57,40,0
.goto 388,40.70,80.95,0
.goto 388,42.62,78.48,0
.goto 388,44.29,77.31,0
.goto 388,46.64,76.70,0
.goto 388,46.60,74.42,0
.goto 388,49.41,78.82,0
.goto 388,47.78,83.93,0
.goto 388,46.95,86.57,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_希克提克螳螂妖|r
.complete 31687,1 
.mob 希克提克雄虫
.mob 希克提克巢穴卫士
.mob 希克提克喷毒者
step
>>点击 |cRXP_PICK_希克提克囚笼|r
.complete 31688,1 
.complete 31688,2 
step
#label Sik'thik Mantids
>>击杀 |cRXP_ENEMY_希克提克螳螂妖|r
.complete 31687,1 
.mob 希克提克雄虫
.mob 希克提克巢穴卫士
.mob 希克提克喷毒者
step
.goto 388,47.49,78.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祝踏岚|r交谈
.turnin 30981 >>交任务: |cRXP_FRIENDLY_陶矢和考维克西斯|r
.target 祝踏岚
.turnin 31063 >>交任务: |cRXP_FRIENDLY_老陈和塞勒沃克斯|r
.turnin 31064 >>交任务: |cRXP_FRIENDLY_陶矢和考维克西斯|r
.accept 30968 >>接任务: |cRXP_WARN_恨之煞|r
.timer 38,RP
step
.goto 388,53.92,78.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_任赛·橡木皮|r交谈
.turnin 31687 >>交任务: |cRXP_FRIENDLY_削弱希克提克|r
.turnin 31688 >>交任务: |cRXP_FRIENDLY_寻找冷恒|r
.target 任塞·橡皮
step
.goto 388,46.05,82.59
>>击杀 |cRXP_ENEMY_憎恨之煞|r
.complete 30968,1 
.mob 恨之煞
step
.goto 388,46.12,82.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陶矢|r交谈
.turnin 30968 >>交任务: |cRXP_FRIENDLY_恨之煞|r
.target 陶矢
step
.isQuestAvailable 30964
.goto 388,47.37,79.1 >>离开神庙
step
.goto 388,49.15,71.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_供给官班福|r交谈
.accept 30922 >>接任务: |cRXP_WARN_纯天然抗菌剂|r
.accept 30963 >>接任务: |cRXP_WARN_战场铸甲师|r
.accept 30964 >>接任务: |cRXP_WARN_合适的药膏|r
.target 供给商伴福
step
.goto 388,49.14,71.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰昊|r交谈
.accept 30921 >>接任务: |cRXP_WARN_螳螂妖的动机|r
.accept 30923 >>接任务: |cRXP_WARN_拖住螳螂妖|r
.target 泰侯
step
#completewith Gunpowder Casks
>>击杀 |cRXP_ENEMY_远影穆山兽|r, 拾取 |cRXP_LOOT_全满穆山兽膀胱|r
.complete 30922,1 
.mob 远影穆山兽
.mob 远影公穆山兽
step
#completewith Gunpowder Casks
>>击杀 |cRXP_ENEMY_排齿乌龟|r 和 |cRXP_ENEMY_排齿古兽|r, 拾取 |cRXP_LOOT_排齿贝壳碎片|r
.complete 30963,1 
.mob 排齿乌龟
.mob 排齿寿龟
step
#completewith Gunpowder Casks
>>点击 |cRXP_PICK_茂柳的|r
.complete 30964,1 
step
#completewith Gunpowder Casks
>>击杀 |cRXP_ENEMY_克里提克尖啸者|r 和 |cRXP_ENEMY_克里提克骨切者|r. |cRXP_WARN_建议一次只拉一个|r
.complete 30921,1 
.complete 30921,2 
.complete 30921,3 
.complete 30921,4 
.mob 科里提克尖啸者
.mob 科里提克剁骨者
step
>>将 |T463484:0|t[火药桶] 投掷到武器上
.goto 388,55.41,53.09
.use 81891
.complete 30923,1 
step
#label Gunpowder Casks
>>将 |T463484:0|t[火药桶] 投掷到补给品上
.goto 388,56.59,54.04
.use 81891
.complete 30923,2 
step
#completewith next
>>点击 |cRXP_PICK_茂柳的|r
.complete 30964,1 
step
#loop
.goto 388,57.59,53.91,40,0
.goto 388,56.84,50.49,40,0
.goto 388,55.29,51.79,40,0
.goto 388,55.97,54.82,40,0
.goto 388,57.59,53.91,0
.goto 388,56.84,50.49,0
.goto 388,55.29,51.79,0
.goto 388,55.97,54.82,0
>>击杀 |cRXP_ENEMY_克里提克尖啸者|r 和 |cRXP_ENEMY_克里提克骨切者|r. |cRXP_WARN_建议一次只拉一个|r
.complete 30921,1 
.complete 30921,2 
.complete 30921,3 
.complete 30921,4 
.mob 科里提克尖啸者
.mob 科里提克剁骨者
step
#completewith Full Mushan Bladder
#hidewindow
#loop
.goto 388,56.83,50.58,40,0
.goto 388,57.59,54.05,40,0
.goto 388,58.51,56.64,40,0
.goto 388,59.20,57.76,40,0
.goto 388,58.12,59.26,40,0
.goto 388,58.38,61.03,40,0
.goto 388,58.09,64.19,40,0
.goto 388,57.20,64.49,40,0
.goto 388,55.87,62.68,40,0
.goto 388,56.04,67.92,40,0
.goto 388,54.48,69.09,40,0
.goto 388,52.91,66.00,40,0
.goto 388,50.48,63.93,40,0
.goto 388,51.25,70.61,40,0
.goto 388,56.83,50.58,0
.goto 388,57.59,54.05,0
.goto 388,58.51,56.64,0
.goto 388,59.20,57.76,0
.goto 388,58.12,59.26,0
.goto 388,58.38,61.03,0
.goto 388,58.09,64.19,0
.goto 388,57.20,64.49,0
.goto 388,55.87,62.68,0
.goto 388,56.04,67.92,0
.goto 388,54.48,69.09,0
.goto 388,52.91,66.00,0
.goto 388,50.48,63.93,0
.goto 388,51.25,70.61,0
+1
step
#completewith Mao-Willow
>>击杀 |cRXP_ENEMY_远影穆山兽|r, 拾取 |cRXP_LOOT_全满穆山兽膀胱|r
.complete 30922,1 
.mob 远影穆山兽
.mob 远影公穆山兽
step
#completewith Mao-Willow
>>击杀 |cRXP_ENEMY_排齿乌龟|r 和 |cRXP_ENEMY_排齿古兽|r, 拾取 |cRXP_LOOT_排齿贝壳碎片|r
.complete 30963,1 
.mob 排齿乌龟
.mob 排齿寿龟
step
#label Mao-Willow
>>点击 |cRXP_PICK_茂柳的|r
.complete 30964,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_远影穆山兽|r, 拾取 |cRXP_LOOT_全满穆山兽膀胱|r
.complete 30922,1 
.mob 远影穆山兽
step
>>击杀 |cRXP_ENEMY_排齿乌龟|r 和 |cRXP_ENEMY_排齿古兽|r, 拾取 |cRXP_LOOT_排齿贝壳碎片|r
.complete 30963,1 
.mob 排齿乌龟
.mob 排齿寿龟
step
#label Full Mushan Bladder
>>击杀 |cRXP_ENEMY_远影穆山兽|r, 拾取 |cRXP_LOOT_全满穆山兽膀胱|r
.complete 30922,1 
.mob 远影穆山兽
.mob 远影公穆山兽
step
#loop
.goto 388,49.23,70.64,20,0
.goto 388,49.15,71.41,20,0
.goto 388,49.23,70.64,0
.goto 388,49.15,71.41,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_供给官班福|r交谈
.turnin 30922 >>交任务: |cRXP_FRIENDLY_纯天然抗菌剂|r
.turnin 30963 >>交任务: |cRXP_FRIENDLY_战场铸甲师|r
.turnin 30964 >>交任务: |cRXP_FRIENDLY_合适的药膏|r
.target 供给商伴福
step
.goto 388,49.13,71.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰昊|r交谈
.turnin 30921 >>交任务: |cRXP_FRIENDLY_螳螂妖的动机|r
.turnin 30923 >>交任务: |cRXP_FRIENDLY_拖住螳螂妖|r
.target 泰侯
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 9b) 恐惧废土
#displayname 第 9 章 - 恐惧废土
step
.goto 390,14.13,76.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弓术大师李|r交谈
.target 女射手李琪薇
.accept 31001 >>接任务: |cRXP_WARN_坠落|r
.accept 31002 >>接任务: |cRXP_WARN_绝不|r
step
#completewith DreadspinnerTender
#hidewindow
#loop
.goto 422,74.173,24.745,25,0
.goto 422,72.484,22.262,25,0
.goto 422,70.920,22.080,20,0
.goto 422,71.506,28.578,25,0
.goto 422,65.619,27.905,25,0
.goto 422,67.872,31.332,30,0
.goto 422,74.173,24.745,0
.goto 422,72.484,22.262,0
.goto 422,70.920,22.080,0
.goto 422,71.506,28.578,0
.goto 422,65.619,27.905,0
.goto 422,67.872,31.332,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_恐惧织网小蜘蛛|r
.complete 31002,2 
.mob 恐惧织网小蜘蛛
step
>>|cRXP_WARN_使用 |T133837:0|t[影踪派龙枪] |cRXP_WARN_摧毁面前的|r |cRXP_PICK_恐惧织网蛛的卵|r|r
*The gun also 伤害s the spiders
*You can cancel the channel with ESC
.use 82807
.complete 31002,1 
step
#label DreadspinnerTender
>>击杀 |cRXP_ENEMY_恐惧织网小蜘蛛|r
.complete 31002,2 
.mob 恐惧织网小蜘蛛
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_神射手兰|r交谈
.goto 422,72.55,28.68
.skipgossip 62166,1
.complete 31001,1 
.target 神射手兰
step
.goto 422,72.55,28.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_神射手兰|r交谈
.turnin 31001 >>交任务: |cRXP_FRIENDLY_坠落|r
.turnin 31002 >>交任务: |cRXP_FRIENDLY_绝不|r
.accept 31003 >>接任务: |cRXP_WARN_疯狂螳螂妖|r
.target 神射手兰
step
.goto 422,73.48,27.49
>>击杀 |cRXP_ENEMY_副官克里佐特|r
.complete 31003,1 
.mob 副官科利佐特
step
.goto 422,73.67,27.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉西瓦蒂克|r交谈
.turnin 31003 >>交任务: |cRXP_FRIENDLY_疯狂螳螂妖|r
.target 卡拉克西瓦·提克
.accept 31004 >>接任务: |cRXP_WARN_保存于琥珀中|r
step
>>点击 |cRXP_PICK_大块远古琥珀|r
.goto 422,70.210,25.661
.complete 31004,1 
step
.goto 422,70.21,25.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31004 >>交任务: |cRXP_FRIENDLY_保存于琥珀中|r
.target 掠风者克尔鲁克
.accept 31676 >>接任务: |cRXP_WARN_远古复仇|r
.accept 31005 >>接任务: |cRXP_WARN_虚弱的觉醒|r
step
#completewith VengefulGurthani
#hidewindow
#loop
.goto 422,71.394,30.671,30,0
.goto 422,71.329,39.100,30,0
.goto 422,71.394,30.671,30,0
.goto 422,66.021,27.701,30,0
.goto 422,71.394,30.671,0
.goto 422,66.021,27.701,0
.goto 422,71.329,39.100,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_格萨尼复仇之灵|r
.complete 31676,1 
.mob 格萨尼复仇之灵
step
>>击杀 |cRXP_ENEMY_树萤|r, 拾取 |T237143:0|t[|cRXP_LOOT_树萤残肢|r]
.complete 31005,1 
.mob 树脂萤火虫
step
#label VengefulGurthani
>>击杀 |cRXP_ENEMY_格萨尼复仇之灵|r
.complete 31676,1 
.mob 格萨尼复仇之灵
step
.goto 422,70.19,25.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31005 >>交任务: |cRXP_FRIENDLY_虚弱的觉醒|r
.turnin 31676 >>交任务: |cRXP_FRIENDLY_远古复仇|r
.accept 31006 >>接任务: |cRXP_WARN_卡拉克西议会|r
.target 掠风者克尔鲁克
step
.goto 422,55.67,34.90
>>飞往克拉克西维斯, |cRXP_WARN_不要选择对话选项|r
.complete 31006,1 
step
.goto 422,54.99,34.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31006 >>交任务: |cRXP_FRIENDLY_卡拉克西议会|r
.target 掠风者克尔鲁克
.accept 31007 >>接任务: |cRXP_WARN_超速生长|r
.accept 31660 >>接任务: |cRXP_WARN_虫群不宜|r
step
.goto 422,54.77,34.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_柯尔'ik|r交谈
.accept 31009 >>接任务: |cRXP_WARN_死亡区域|r
.target 科尔里克
step
.goto 422,55.02,35.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_琥珀匠师齐克|r交谈
.accept 31008 >>接任务: |cRXP_WARN_琥珀武器|r
.target 琥珀匠师齐克
step
#completewith next
>>击杀 |cRXP_ENEMY_谢尔泽尔刃誓者|r
.complete 31008,1 
.mob 夏柯希尔誓刃者
step
>>点击 |cRXP_ENEMY_休眠的声波中继器|r
.goto 422,40.02,39.00
.complete 31009,1 
step
>>点击小地图下方的弹出窗口, 或在任务日志中完成任务
.goto 422,40.02,39.00
.turnin 31009 >>交任务: |cRXP_FRIENDLY_死亡区域|r
.accept 31010 >>接任务: |cRXP_WARN_逃出魔掌|r
.timer 70,Defend Duration
step
.goto 422,44.59,41.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_煞染水晶|r交谈
.accept 31661 >>接任务: |cRXP_WARN_恐惧力量之源|r
.target 煞-Haunted Crystal
step
#completewith ParagonWeakened
>>击杀 |cRXP_ENEMY_谢尔泽尔群生者|r 和 |cRXP_ENEMY_谢尔泽尔守巢者|r
.complete 31660,1 
.complete 31007,1 
.mob 夏柯希尔聚生虫
.mob 夏柯希尔虫巢守卫
step
#completewith ParagonWeakened
>>击杀 |cRXP_ENEMY_谢尔泽尔刃誓者|r
.complete 31008,1 
.mob 夏柯希尔誓刃者
step
#label ParagonWeakened
>>点击 |cRXP_PICK_大块远古琥珀|r
>>|cRXP_WARN_保护 |cRXP_FRIENDLY_无伤者玛里克|r|r
.goto 422,44.76,41.58
.complete 31010,1 
step
#completewith AmberBlade
>>击杀 |cRXP_ENEMY_谢尔泽尔群生者|r 和 |cRXP_ENEMY_谢尔泽尔守巢者|r
.complete 31660,1 
.complete 31007,1 
.mob 夏柯希尔聚生虫
.mob 夏柯希尔虫巢守卫
step
#label AmberBlade
#loop
.goto 422,49.124,43.860,30,0
.goto 422,39.037,39.632,30,0
.goto 422,49.124,43.860,0
.goto 422,39.037,39.632,0
>>击杀 |cRXP_ENEMY_谢尔泽尔刃誓者|r
.complete 31008,1 
.mob 夏柯希尔誓刃者
step
#completewith next
>>击杀 |cRXP_ENEMY_谢尔泽尔群生者|r
.complete 31660,1 
.mob 夏柯希尔聚生虫
step
#loop
.goto 422,41.597,42.415,35,0
.goto 422,42.505,46.290,35,0
.goto 422,47.282,41.128,35,0
.goto 422,44.549,40.010,25,0
.goto 422,41.597,42.415,0
.goto 422,42.505,46.290,0
.goto 422,47.282,41.128,0
.goto 422,44.549,40.010,0
>>击杀 |cRXP_ENEMY_谢尔泽尔守巢者|r
.complete 31007,1 
.mob 夏柯希尔虫巢守卫
step
>>击杀 |cRXP_ENEMY_谢尔泽尔群生者|r
.goto 422,44.797,41.647
.complete 31660,1 
.mob 夏柯希尔聚生虫
step
.goto 422,55.02,35.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_琥珀匠师齐克|r交谈
.turnin 31008 >>交任务: |cRXP_FRIENDLY_琥珀武器|r
.target 琥珀匠师齐克
.turnin 31661 >>交任务: |cRXP_FRIENDLY_恐惧力量之源|r
.accept 31108 >>接任务: |cRXP_WARN_密集的恐惧|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_无伤者玛利克|r和|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31010 >>交任务: |cRXP_FRIENDLY_逃出魔掌|r
.goto 422,54.94,34.13
.target +无伤者玛里克
.turnin 31007 >>交任务: |cRXP_FRIENDLY_超速生长|r
.goto 422,54.986,34.045
.target +掠风者克尔鲁克
step
.goto 422,54.98,34.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31660 >>交任务: |cRXP_FRIENDLY_虫群不宜|r
.target 掠风者克尔鲁克
step
.goto 422,54.76,34.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_柯尔'ik|r交谈
.accept 31066 >>接任务: |cRXP_WARN_黑暗中的嘶吼|r
.timer 34,Roleplay Duratin
.target 科尔里克
step
.goto 422,55.07,35.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_无伤者玛利克|r交谈
.accept 31107 >>接任务: |cRXP_WARN_新帝国的公民|r
.target 无伤者玛里克
.accept 31689 >>接任务: |cRXP_WARN_惧誓者|r
step
#completewith QitartheDeathcaller
>>击杀 |cRXP_ENEMY_沃提克恐誓者|r
.complete 31689,1 
.mob 沃提克惧誓者
step
#completewith QitartheDeathcaller
>>点击 |cRXP_PICK_沃提克虫卵|r
.complete 31107,1 
step
#label QitartheDeathcaller
.goto 422,59.40,18.44
>>击杀 |cRXP_ENEMY_奇塔尔死亡召唤者|r
.complete 31066,1 
.mob 召亡者奇塔尔
step
#completewith DreadAmberFocus
>>击杀 |cRXP_ENEMY_沃提克恐誓者|r
.complete 31689,1 
.mob 沃提克惧誓者
step
#completewith DreadAmberFocus
>>点击 |cRXP_PICK_沃提克虫卵|r
.complete 31107,1 
step
#label DreadAmberFocus
#loop
.goto 422,57.697,12.068,25,0
.goto 422,56.946,18.664,25,0
.goto 422,58.205,18.625,25,0
.goto 422,60.180,15.167,28,0
.goto 422,57.697,12.068,0
.goto 422,56.454,15.593,0
.goto 422,56.946,18.664,0
.goto 422,58.205,18.625,0
.goto 422,60.180,15.167,0
>>击杀 |cRXP_ENEMY_沃尔提克恐惧塑造者|r, 拾取 |T348563:0|t[|cRXP_LOOT_恐惧琥珀焦镜|r]
.complete 31108,1 
.mob 沃提克塑恐者
step
#completewith next
>>击杀 |cRXP_ENEMY_沃提克恐誓者|r
.complete 31689,1 
.mob 沃提克惧誓者
step
#loop
.goto 422,58.700,17.269,25,0
.goto 422,58.369,19.191,20,0
.goto 422,59.651,20.048,20,0
.goto 422,60.288,17.509,20,0
.goto 422,58.700,17.269,0
.goto 422,58.369,19.191,0
.goto 422,59.651,20.048,0
.goto 422,60.288,17.509,0
>>点击 |cRXP_PICK_沃提克虫卵|r
.complete 31107,1 
step
#loop
.goto 422,59.164,14.671,25,0
.goto 422,56.862,11.771,25,0
.goto 422,57.658,16.739,32,0
.goto 422,59.164,14.671,0
.goto 422,56.862,11.771,0
.goto 422,57.658,16.739,0
>>击杀 |cRXP_ENEMY_沃提克恐誓者|r
.complete 31689,1 
.mob 沃提克惧誓者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_无伤者玛利克|r和|cRXP_FRIENDLY_琥珀匠师齐克|r交谈
.turnin 31107 >>交任务: |cRXP_FRIENDLY_新帝国的公民|r
.turnin 31689 >>交任务: |cRXP_FRIENDLY_惧誓者|r
.goto 422,55.060,35.482
.target +无伤者玛里克
.turnin 31108 >>交任务: |cRXP_FRIENDLY_密集的恐惧|r
.goto 422,55.016,35.555
.target +琥珀匠师齐克
step
.goto 422,54.76,34.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_柯尔'ik|r交谈
.turnin 31066 >>交任务: |cRXP_FRIENDLY_黑暗中的嘶吼|r
.accept 31087 >>接任务: |cRXP_WARN_扩大范围|r
.accept 31605 >>接任务: |cRXP_WARN_扎尼提克的发现|r
.target 科尔里克
step
.goto 422,55.06,35.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.accept 31019 >>接任务: |cRXP_WARN_琥珀即生命|r
.accept 31175 >>接任务: |cRXP_WARN_觅血者斯基尔|r
.target 掠风者克尔鲁克
step
.isOnQuest 31730
#optional
.goto 422,51.21,11.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.turnin 31730 >>交任务: |cRXP_FRIENDLY_不那么友好的请求|r
.accept 31067 >>接任务: |cRXP_WARN_战云密布|r
.target 树脂大师吴暮
step
.goto 422,51.21,11.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.accept 31067 >>接任务: |cRXP_WARN_战云密布|r
.target 树脂大师吴暮
step
#completewith next
.goto 422,53.525,15.100,10 >>|cRXP_WARN_进入琥珀宝库|r
step
.goto 422,53.08,12.36
>>点击 |cRXP_PICK_预言之卷|r
.accept 31068 >>接任务: |cRXP_WARN_神圣配方|r
.target Scroll of Auspice
step
.goto 422,52.78,10.56
>>击杀 |cRXP_ENEMY_阿兹克斯克泰|r
.complete 31067,1 
.mob 艾兹克西·卡泰
step
#completewith next
.goto 422,53.525,15.100,10 >>|cRXP_WARN_离开琥珀宝库|r
step
.goto 422,50.73,11.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.turnin 31068 >>交任务: |cRXP_FRIENDLY_神圣配方|r
.timer 36,Lya of Ten Songs Roleplay
.target 丽亚·十歌
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r\|cRXP_FRIENDLY_欧隆|r和|cRXP_FRIENDLY_口渴的米肖|r交谈
.turnin 31067 >>交任务: |cRXP_FRIENDLY_战云密布|r
.accept 31069 >>接任务: |cRXP_WARN_融入阴影|r
.goto 422,51.21,11.39
.target +树脂大师吴暮
.accept 31070 >>接任务: |cRXP_WARN_巨兽之匕|r
.goto 422,51.16,11.21
.target +吴龙
.accept 31071 >>接任务: |cRXP_WARN_我辜负了大家|r
.goto 422,51.133,11.109
.target +干渴的米肖
step
.goto 422,50.44,12.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.daily 31076,31129 >>接任务: |cRXP_WARN_风暴烈酒的命运|r
.target 陈·风暴烈酒
step
.isOnQuest 31076
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.goto 422,50.73,11.70
.skipgossip 62667,1
.complete 31076,2 
.target 丽亚·十歌
step
.isOnQuest 31076
.goto 422,50.91,11.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大丹·风暴烈酒|r交谈
.complete 31076,3 
.skipgossip 62845,1
.target 大丹·风暴烈酒
step
.isOnQuest 31076
.goto 422,51.21,11.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.complete 31076,1 
.skipgossip 62666,1
.target 树脂大师吴暮
step
.isOnQuest 31129
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.goto 422,50.73,11.70
.skipgossip 62667,1
.complete 31129,2 
.target 丽亚·十歌
step
.isOnQuest 31129
.goto 422,50.91,11.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大丹·风暴烈酒|r交谈
.complete 31129,3 
.skipgossip 62845,1
.target 大丹·风暴烈酒
step
.isOnQuest 31129
.goto 422,51.21,11.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.complete 31129,1 
.skipgossip 62666,1
.target 树脂大师吴暮
step
.goto 422,50.73,11.71
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.accept 31072 >>接任务: |cRXP_WARN_撕裂之匕|r
.target 丽亚·十歌
step
.goto 422,50.45,12.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 31076 >>交任务: |cRXP_FRIENDLY_风暴烈酒的命运|r
.target 陈·风暴烈酒
step
#completewith BladeofIlikkax
>>击杀 |cRXP_LOOT_惊恐的穆山兽|r, 拾取 |T135671:0|t[|cRXP_LOOT_巨型穆山兽牙|r]
.complete 31070,1 
.mob 惊恐的穆山兽
step
>>点击 |cRXP_PICK_丢失的酒杯|r
.goto 422,51.72,19.07
.complete 31071,1 
step
#label BladeofIlikkax
>>击杀 |cRXP_ENEMY_伊力卡克西|r, 拾取 |T538490:0|t[|cRXP_LOOT_伊力卡克西之刃|r]
.goto 422,50.94,20.86
.complete 31072,2 
.mob 伊力卡克西
step
#loop
.goto 422,52.106,21.147,15,0
.goto 422,53.558,19.712,15,0
.goto 422,52.106,21.147,0
.goto 422,53.558,19.712,0
>>击杀 |cRXP_ENEMY_克兹克齐|r, 拾取 |T538490:0|t[|cRXP_LOOT_克兹克齐之刃|r]
.complete 31072,1 
.mob 克兹克兹克
step
.goto 422,54.11,20.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.accept 31077 >>接任务: |cRXP_WARN_艾薇·风暴烈酒|r
.target 陈·风暴烈酒
step
>>点击 |cRXP_PICK_丢失的酒桶|r
.goto 422,54.41,20.33
.complete 31071,2 
step
#completewith LostPicnic
>>击杀 |cRXP_LOOT_惊恐的穆山兽|r, 拾取 |T135671:0|t[|cRXP_LOOT_巨型穆山兽牙|r]
.complete 31070,1 
.mob 惊恐的穆山兽
step
#completewith LostPicnic
>>击杀 |cRXP_ENEMY_惊怖潜伏者|r 和 |cRXP_ENEMY_纠缠之骇|r
.complete 31069,1 
.mob 惊怖潜伏者
.mob 纠缠之骇
step
#label LostPicnic
>>点击 |cRXP_PICK_丢失的野餐食品|r
.goto 422,56.02,19.43
.complete 31071,3 
step
#completewith next
>>击杀 |cRXP_LOOT_惊恐的穆山兽|r, 拾取 |T135671:0|t[|cRXP_LOOT_巨型穆山兽牙|r]
.complete 31070,1 
.mob 惊恐的穆山兽
step
#loop
.goto 422,57.958,20.062,32,0
.goto 422,56.105,16.052,32,0
.goto 422,53.995,17.333,32,0
.goto 422,55.094,19.947,30,0
.goto 422,57.958,20.062,0
.goto 422,56.105,16.052,0
.goto 422,53.995,17.333,0
.goto 422,55.094,19.947,0
>>击杀 |cRXP_ENEMY_惊怖潜伏者|r 和 |cRXP_ENEMY_纠缠之骇|r
.complete 31069,1 
.mob 惊怖潜伏者
.mob 纠缠之骇
step
#loop
.goto 422,51.940,14.578,36,0
.goto 422,49.263,16.335,36,0
.goto 422,47.060,20.709,35,0
.goto 422,49.102,22.156,36,0
.goto 422,56.034,14.707,36,0
.goto 422,51.940,14.578,0
.goto 422,49.263,16.335,0
.goto 422,47.060,20.709,0
.goto 422,49.102,22.156,0
.goto 422,56.034,14.707,0
>>击杀 |cRXP_LOOT_惊恐的穆山兽|r, 拾取 |T135671:0|t[|cRXP_LOOT_巨型穆山兽牙|r]
.complete 31070,1 
.mob 惊恐的穆山兽
step
>>|cRXP_WARN_跟随箭头指引|r
.goto 422,50.18,10.19
.complete 31077,1 
.timer 27,Roleplay Duration
step
#completewith
>>等待剧情演出时先交其他任务
.complete 31077,2 
step
.goto 422,50.73,11.71
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.turnin 31072 >>交任务: |cRXP_FRIENDLY_撕裂之匕|r
.accept 31074 >>接任务: |cRXP_WARN_木头和阴影|r
.target 丽亚·十歌
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_口渴的米肖|r\|cRXP_FRIENDLY_欧隆|r和|cRXP_FRIENDLY_树脂大师吴|r交谈
.turnin 31071 >>交任务: |cRXP_FRIENDLY_我辜负了大家|r
.goto 422,51.139,11.112
.target +干渴的米肖
.turnin 31070 >>交任务: |cRXP_FRIENDLY_巨兽之匕|r
.goto 422,51.17,11.22
.target +吴龙
.turnin 31069 >>交任务: |cRXP_FRIENDLY_融入阴影|r
.accept 31073 >>接任务: |cRXP_WARN_融入木头|r
.goto 422,51.21,11.40
.target +树脂大师吴暮
step
.goto 422,50.18,10.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 31077 >>交任务: |cRXP_FRIENDLY_艾薇·风暴烈酒|r
.target 陈·风暴烈酒
.accept 31078 >>接任务: |cRXP_WARN_韩·风暴烈酒|r
step
.goto 422,50.18,12.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_防御者阿佐|r交谈
.accept 31133 >>接任务: |cRXP_WARN_库尔提克的侵袭|r
.target 防御者阿佐
step
#completewith HanStormstout
>>击杀 |cRXP_ENEMY_科尔提克螳螂妖|r
.complete 31133,1 
.mob 库尔提克近侍哨卫
.mob 库尔提克战歌者
.mob 库尔提克毁灭者
step
#completewith next
.goto 422,46.710,16.787,10 >>|cRXP_WARN_进入暮光回廊|r
step
>>|cRXP_WARN_跟随箭头指示避免受到过多伤害|r
>>点击 |cRXP_FRIENDLY_韩·风暴烈酒|r
.goto 422,44.943,16.787,14,0
.goto 422,44.668,16.058,14,0
.goto 422,45.091,15.212,14,0
.goto 422,44.523,15.761,14,0
.goto 422,43.555,15.680,14,0
.goto 422,43.043,15.209,14,0
.goto 422,43.375,16.047,14,0
.goto 422,43.77,16.74
.complete 31078,1 
.target 韩·风暴烈酒
step
#label HanStormstout
>>|cRXP_WARN_跟随箭头指示避免受到过多伤害|r
.goto 422,43.375,16.047,14,0
.goto 422,43.043,15.209,14,0
.goto 422,43.555,15.680,14,0
.goto 422,44.523,15.761,14,0
.goto 422,45.091,15.212,14,0
.goto 422,44.668,16.058,14,0
.goto 422,44.41,16.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_陈·风暴烈酒|r
.turnin 31078 >>交任务: |cRXP_FRIENDLY_韩·风暴烈酒|r
.target 陈·风暴烈酒
step
#completewith HanStormstout
>>击杀 |cRXP_ENEMY_科尔提克螳螂妖|r
.complete 31133,1 
.mob 库尔提克近侍哨卫
.mob 库尔提克战歌者
.mob 库尔提克毁灭者
step
#completewith MarkoftheEmpress
#label LeaveMorrowchamber
.goto 422,46.710,16.787,10 >>|cRXP_WARN_离开暮光教廷|r
step
#completewith MarkoftheEmpress
#requires LeaveMorrowchamber
.goto 422,44.754,15.935,8 >>|cRXP_WARN_进入房屋|r
step
#label MarkoftheEmpress
>>跑下楼梯
.goto 422,44.754,15.935,0
.goto 422,44.515,16.778
.complete 31074,1 
step
#completewith HeartrootofKypariKor
#label LeavetheHouseA
.goto 422,44.754,15.935,8 >>|cRXP_WARN_离开房屋|r
step
#completewith HeartrootofKypariKor
#requires LeavetheHouseA
.goto 422,43.050,13.965,8 >>|cRXP_WARN_进入房屋|r
step
#label HeartrootofKypariKor
>>跑下楼梯
.goto 422,43.116,14.988
.complete 31074,2 
step
#completewith KorthikMantid
#hidewindow
#loop
.goto 422,42.796,7.545,35,0
.goto 422,44.556,7.456,35,0
.goto 422,48.603,11.101,35,0
.goto 422,47.245,19.051,35,0
.goto 422,45.008,18.417,37,0
.goto 422,45.957,13.026,35,0
.goto 422,43.095,12.129,35,0
.goto 422,42.796,7.545,0
.goto 422,44.556,7.456,0
.goto 422,48.603,11.101,0
.goto 422,47.245,19.051,0
.goto 422,45.008,18.417,0
.goto 422,45.957,13.026,0
.goto 422,43.095,12.129,0
+1
step
#completewith next
.goto 422,43.050,13.965,8 >>|cRXP_WARN_离开房屋|r
step
>>点击 |cRXP_FRIENDLY_腐化尸骸|r |cRXP_WARN_(可在骑乘时)|r
.complete 31073,1 
.target Withrered Husk
step
#label KorthikMantid
>>击杀 |cRXP_ENEMY_科尔提克螳螂妖|r
.complete 31133,1 
.mob 库尔提克近侍哨卫
.mob 库尔提克战歌者
.mob 库尔提克毁灭者
step
.goto 422,50.20,12.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_防御者阿佐|r交谈
.turnin 31133 >>交任务: |cRXP_FRIENDLY_库尔提克的侵袭|r
.target 防御者阿佐
step
.goto 422,50.73,11.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r交谈
.turnin 31074 >>交任务: |cRXP_FRIENDLY_木头和阴影|r
.target 丽亚·十歌
step
.goto 422,51.21,11.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.turnin 31073 >>交任务: |cRXP_FRIENDLY_融入木头|r
.accept 31075 >>接任务: |cRXP_WARN_日落之王|r
.target 树脂大师吴暮
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r交谈
.goto 422,38.19,17.18
.turnin 31075 >>交任务: |cRXP_FRIENDLY_日落之王|r
.target 树脂大师吴暮
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波格欧|r\|cRXP_FRIENDLY_欧隆|r和|cRXP_FRIENDLY_丽亚·十歌|r交谈
.accept 31079 >>接任务: |cRXP_WARN_恐怖升腾|r
.goto 422,38.159,17.339
.target +波格欧
.accept 31080 >>接任务: |cRXP_WARN_火焰之翼|r
.goto 422,38.20,17.13
.target +吴龙
.accept 31081 >>接任务: |cRXP_WARN_咒法妖精|r
.goto 422,38.302,17.137
.target +丽亚·十歌
step
.goto 422,38.65,17.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里基屯酋长|r交谈
.accept 31082 >>接任务: |cRXP_WARN_救赎方舟|r
.target 里基屯酋长
step
#completewith FliterringDust
>>击杀 |cRXP_ENEMY_蹒跚的雾行鬼|r 和 |cRXP_ENEMY_凯帕琥珀虫|r |cRXP_WARN_(注意找棕色的移动目标)|r
.complete 31079,1 
.complete 31079,2 
.mob 蹒跚的雾行鬼
.mob 凯帕琥珀虫
step
.goto 422,33.07,19.13
>>击杀 |cRXP_ENEMY_米古纳什|r
.complete 31081,2 
.mob 米古纳什
step
.goto 422,32.10,17.35
>>击杀 |cRXP_ENEMY_阿古诺什|r
.complete 31081,1 
.mob 阿古诺什
step
#label FliterringDust
#loop
.goto 422,34.321,22.761,35,0
.goto 422,39.261,24.069,35,0
.goto 422,39.536,19.790,35,0
.goto 422,36.998,14.867,35,0
.goto 422,34.321,22.761,0
.goto 422,39.261,24.069,0
.goto 422,39.536,19.790,0
.goto 422,36.998,14.867,0
>>点击 |cRXP_FRIENDLY_里基利亚飞掠者|r, |cRXP_WARN_尝试捕捉尘埃|r
.complete 31080,1 
.target 里基利亚飞掠者
step
#completewith Motherseed
>>击杀 |cRXP_ENEMY_蹒跚的雾行鬼|r 和 |cRXP_ENEMY_凯帕琥珀虫|r |cRXP_WARN_(注意找棕色的移动目标)|r
.complete 31079,1 
.complete 31079,2 
.mob 蹒跚的雾行鬼
.mob 凯帕琥珀虫
step
#completewith next
#loop
.goto 422,36.998,14.867,35,0
.goto 422,35.666,18.056,35,0
.goto 422,35.956,22.458,35,0
.goto 422,34.321,19.465,35,0
.goto 422,36.998,14.867,0
.goto 422,35.666,18.056,0
.goto 422,35.956,22.458,0
.goto 422,34.321,19.465,0
.cast 122165 >>点击 |cRXP_PICK_母种|r
step
>>将 |cRXP_FRIENDLY_母种|r 带回 |cRXP_WARN_(一次只能进行一个)|r
*|cRXP_WARN_Use the|r |T133706:0|t[Rikkitun Bell] |cRXP_WARN_when you can't click on the seeds|r
.goto 422,36.897,17.445
.use 84267
.complete 31082,1,1 
step
#completewith next
#loop
.goto 422,34.321,19.465,35,0
.goto 422,36.998,14.867,35,0
.goto 422,35.666,18.056,35,0
.goto 422,35.956,22.458,35,0
.goto 422,34.321,19.465,0
.goto 422,36.998,14.867,0
.goto 422,35.666,18.056,0
.goto 422,35.956,22.458,0
.cast 122165 >>点击 |cRXP_PICK_母种|r
step
>>将 |cRXP_FRIENDLY_母种|r 带回 |cRXP_WARN_(一次只能进行一个)|r
*|cRXP_WARN_Use the|r |T133706:0|t[Rikkitun Bell] |cRXP_WARN_when you can't click on the seeds|r
.goto 422,36.897,17.445
.use 84267
.complete 31082,1,2 
step
#completewith next
#loop
.goto 422,35.956,22.458,35,0
.goto 422,34.321,19.465,35,0
.goto 422,36.998,14.867,35,0
.goto 422,35.666,18.056,35,0
.goto 422,35.956,22.458,0
.goto 422,34.321,19.465,0
.goto 422,36.998,14.867,0
.goto 422,35.666,18.056,0
.cast 122165 >>点击 |cRXP_PICK_母种|r
step
#label Motherseed
>>将 |cRXP_FRIENDLY_母种|r 带回 |cRXP_WARN_(一次只能进行一个)|r
*|cRXP_WARN_Use the|r |T133706:0|t[Rikkitun Bell] |cRXP_WARN_when you can't click on the seeds|r
.goto 422,36.897,17.445
.use 84267
.complete 31082,1 
step
#loop
.goto 422,32.060,20.009,35,0
.goto 422,33.450,23.674,35,0
.goto 422,36.371,20.878,35,0
.goto 422,38.385,14.506,35,0
.goto 422,32.060,20.009,0
.goto 422,33.450,23.674,0
.goto 422,36.371,20.878,0
.goto 422,38.385,14.506,0
>>击杀 |cRXP_ENEMY_蹒跚的雾行鬼|r 和 |cRXP_ENEMY_凯帕琥珀虫|r |cRXP_WARN_(注意找棕色的移动目标)|r
.complete 31079,1 
.complete 31079,2 
.mob 蹒跚的雾行鬼
.mob 凯帕琥珀虫
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波格欧|r\|cRXP_FRIENDLY_欧隆|r和|cRXP_FRIENDLY_丽亚·十歌|r交谈
.turnin 31079 >>交任务: |cRXP_FRIENDLY_恐怖升腾|r
.goto 422,38.16,17.34
.target +波格欧
.turnin 31080 >>交任务: |cRXP_FRIENDLY_火焰之翼|r
.goto 422,38.20,17.12
.target +吴龙
.turnin 31081 >>交任务: |cRXP_FRIENDLY_咒法妖精|r
,giti 422,38.304,17.137
.target +丽亚·十歌
step
.goto 422,38.65,17.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里基屯酋长|r交谈
.turnin 31082 >>交任务: |cRXP_FRIENDLY_救赎方舟|r
.target 里基屯酋长
.accept 31084 >>接任务: |cRXP_WARN_施法|r
step
#completewith next
.gossipoption 40853 >>与|cRXP_FRIENDLY_里基屯酋长|r交谈
.timer 55,Roleplay Duration
.goto 422,38.65,17.25
.target 里基屯酋长
step
.goto 422,38.65,17.25,0
>>跟随 |cRXP_FRIENDLY_里基屯酋长|r, |cRXP_WARN_不要离他超过 90 码|r
.goto 422,39.67,23.18
.complete 31084,1 
.target 里基屯酋长
step
.goto 422,38.65,17.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里基屯酋长|r交谈
.turnin 31084 >>交任务: |cRXP_FRIENDLY_施法|r
.target 里基屯酋长
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽亚·十歌|r和|cRXP_FRIENDLY_树脂大师吴|r交谈
.accept 31085 >>接任务: |cRXP_WARN_远古的血与火|r
.goto 422,38.30,17.13
.target +丽亚·十歌
.accept 31086 >>接任务: |cRXP_WARN_远古之血|r
.goto 422,38.183,17.184
.target +树脂大师吴暮
step
>>点击 |cRXP_PICK_一大块固化琥珀|r
.goto 422,30.22,30.58
.complete 31086,1 
step
#completewith next
.goto 422,30.23,31.68
.cast 123270 >>点击岩石
step
>>|cRXP_WARN_使用|r |T645165:0|t[毁灭之叉]
.goto 422,32.67,33.88
.use 84771
.complete 31085,1 
step
>>击杀 |cRXP_ENEMY_副官格卡尔|r\|cRXP_ENEMY_副官欧克兹克|r 和 |cRXP_ENEMY_副官皮维卡|r
.goto 422,33.013,34.129
.complete 31085,2 
.mob 副官格卡尔
.mob 副官欧克兹克
.mob 副官皮维卡
step
#completewith next
.goto 422,30.233,31.716,10 >>|cRXP_WARN_离开琥珀寒冬|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_树脂大师吴|r和|cRXP_FRIENDLY_丽亚·十歌|r交谈
.turnin 31086 >>交任务: |cRXP_FRIENDLY_远古之血|r
.goto 422,50.22,12.11
.target +树脂大师吴暮
.turnin 31085 >>交任务: |cRXP_FRIENDLY_远古的血与火|r
.goto 422,50.29,12.07
.target +丽亚·十歌
step
#completewith SeekertheBloodseeker
.goto 422,25.752,53.923,12 >>|cRXP_WARN_进入水下洞窟|r
step
#label SeekertheBloodseeker
>>点击 |cRXP_PICK_大块远古琥珀|r
.goto 422,25.709,50.342
.complete 31175,1 
.timer 30,Roleplay Duration
step
.goto 422,25.71,50.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_觅血者斯基尔|r交谈
.turnin 31175 >>交任务: |cRXP_FRIENDLY_觅血者斯基尔|r
.target 觅血者斯基尔
.accept 31176 >>接任务: |cRXP_WARN_怪异的食欲|r
.accept 31177 >>接任务: |cRXP_WARN_丰盛大餐|r
.accept 31178 >>接任务: |cRXP_WARN_以血为乐|r
step
#completewith next
.goto 422,25.752,53.923,12 >>|cRXP_WARN_离开洞穴|r
step
#completewith VolatileBlood
#hidewindow
#loop
.goto 422,25.435,55.593,25,0
.goto 422,27.393,53.959,30,0
.goto 422,28.144,65.767,40,0
.goto 422,22.978,65.299,32,0
.goto 422,25.435,55.593,0
.goto 422,27.393,53.959,0
.goto 422,28.144,65.767,0
.goto 422,22.978,65.299,0
+1
step
#completewith ClackerTail
>>击杀 |cRXP_ENEMY_恐惧鮣鱼|r, 拾取 |T136124:0|t[|cRXP_LOOT_挥发性的血液|r]
.complete 31178,1 
.mob 恐惧鮣魚
step
#completewith ClackerTail
>>点击 |cRXP_PICK_棘刺海星|r
.complete 31176,1 
step
#label ClackerTail
>>击杀 |cRXP_ENEMY_咸水龙虾人|r, 拾取 |T134048:0|t[|cRXP_LOOT_龙虾尾|r]
.complete 31177,1 
.mob 咸水龙虾人
step
#completewith next
>>击杀 |cRXP_ENEMY_恐惧鮣鱼|r, 拾取 |T136124:0|t[|cRXP_LOOT_挥发性的血液|r]
.complete 31178,1 
.mob 恐惧鮣魚
step
>>点击 |cRXP_PICK_棘刺海星|r
.complete 31176,1 
step
#label VolatileBlood
>>击杀 |cRXP_ENEMY_恐惧鮣鱼|r, 拾取 |T136124:0|t[|cRXP_LOOT_挥发性的血液|r]
.complete 31178,1 
.mob 恐惧鮣魚
step
#completewith next
.goto 422,25.752,53.923,12 >>|cRXP_WARN_进入洞窟|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_觅血者斯基尔|r交谈
.goto 422,25.71,50.61
.turnin 31176 >>交任务: |cRXP_FRIENDLY_怪异的食欲|r
.turnin 31177 >>交任务: |cRXP_FRIENDLY_丰盛大餐|r
.turnin 31178 >>交任务: |cRXP_FRIENDLY_以血为乐|r
.accept 31179 >>接任务: |cRXP_WARN_血之气息|r
.timer 90,Quest Duration
.target 觅血者斯基尔
step
>>|cRXP_WARN_前往路径点位置|r
>>击杀正在出现的 |cRXP_ENEMY_泥鳞食肉者|r 和 |cRXP_ENEMY_泥鳞蛇面者|r
.goto 422,25.711,52.037
.complete 31179,1 
.complete 31179,2 
.mob 泥鳞食肉者
.mob 泥鳞蛇面者
step
#completewith next
.goto 422,25.752,53.923,12 >>|cRXP_WARN_离开洞穴|r
step
#completewith next
.goto 422,46.339,52.976,10 >>|cRXP_WARN_进入琥珀光辉洞穴|r
step
.goto 422,46.38,52.95
.complete 31087,1 
step
.goto 422,48.125,49.781
>>击杀 |cRXP_ENEMY_副官泽图克|r
.complete 31087,2 
.mob 副官赛图克
step
>>点击 |cRXP_PICK_寂静信标|r
.goto 422,48.12,49.75
.complete 31087,3 
step
.goto 422,48.11,49.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_柯尔'ik|r交谈
.turnin 31087 >>交任务: |cRXP_FRIENDLY_扩大范围|r
.accept 31088 >>接任务: |cRXP_WARN_罪与罚|r
.accept 31090 >>接任务: |cRXP_WARN_越陈越香|r
.target 科尔里克
step
#completewith AmberFilledJar
.goto 422,46.339,52.976,10 >>|cRXP_WARN_离开琥珀光辉谷|r
step
#completewith IkthikHarvester
#hidewindow
#loop
.goto 422,45.535,52.012,18,0
.goto 422,42.260,50.297,22,0
.goto 422,41.542,52.595,22,0
.goto 422,39.638,52.012,22,0
.goto 422,36.958,51.815,22,0
.goto 422,34.739,51.846,22,0
.goto 422,32.738,50.473,22,0
.goto 422,38.626,49.036,26,0
.goto 422,40.356,47.884,26,0
.goto 422,45.105,57.507,22,0
.goto 422,49.250,62.705,22,0
.goto 422,48.803,64.237,22,0
.goto 422,49.711,66.443,22,0
.goto 422,51.484,66.092,22,0
.goto 422,45.535,52.012,0
.goto 422,42.260,50.297,0
.goto 422,41.542,52.595,0
.goto 422,39.638,52.012,0
.goto 422,36.958,51.815,0
.goto 422,34.739,51.846,0
.goto 422,32.738,50.473,0
.goto 422,38.626,49.036,0
.goto 422,40.356,47.884,0
.goto 422,45.105,57.507,0
.goto 422,49.250,62.705,0
.goto 422,48.803,64.237,0
.goto 422,49.711,66.443,0
.goto 422,51.484,66.092,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_伊克提克收割者|r
.complete 31088,1 
.mob 伊克提克收割者
step
#label AmberFilledJar
>>点击 |cRXP_PICK_琥珀采集器|r
.complete 31090,1 
step
#label IkthikHarvester
>>击杀 |cRXP_ENEMY_伊克提克收割者|r
.complete 31088,1 
.mob 伊克提克收割者
step
#completewith next
.goto 422,46.339,52.976,10 >>|cRXP_WARN_进入琥珀光辉洞穴|r
step
.goto 422,48.11,49.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_柯尔'ik|r交谈
.turnin 31088 >>交任务: |cRXP_FRIENDLY_罪与罚|r
.turnin 31090 >>交任务: |cRXP_FRIENDLY_越陈越香|r
.accept 31089 >>接任务: |cRXP_WARN_大海的庇佑，一去不返|r
.target 科尔里克
step
>>|cRXP_WARN_使用|r |T645165:0|t[卡拉克西音叉]
.goto 422,43.42,63.55
.use 84119
.complete 31089,1 
.timer 30,Roleplay Duration
step
.goto 422,43.32,63.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_操纵者卡兹提克|r交谈
.turnin 31089 >>交任务: |cRXP_FRIENDLY_大海的庇佑，一去不返|r
.target 操纵者卡兹提克
.accept 31091 >>接任务: |cRXP_WARN_物归原主|r
step
#completewith next
.goto 422,43.321,63.498
.gossipoption 28603 >>与|cRXP_FRIENDLY_操纵者卡兹提克|r交谈
step
>>|cRXP_WARN_跟随并保护 |cRXP_FRIENDLY_卡兹提克·操纵者|r|r
.goto 422,43.321,63.498,0
.goto 422,41.763,72.038
.skipgossip 63876,1
.complete 31091,1 
step
.goto 422,41.38,71.42
.complete 31091,2 
step
.goto 422,41.75,72.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_操纵者卡兹提克|r交谈
.turnin 31091 >>交任务: |cRXP_FRIENDLY_物归原主|r
.target 操纵者卡兹提克
.accept 31092 >>接任务: |cRXP_WARN_要么喂它，要么被吃掉|r
.accept 31359 >>接任务: |cRXP_WARN_恐虫密语者|r
step
#completewith OracleHissir
>>击杀 |cRXP_ENEMY_泥鳞部族|r
.complete 31359,2 
.mob Muckscale Tribe
step
#completewith OracleHissir
>>击杀 |cRXP_ENEMY_盐壳钳嘴龟|r, 拾取 |T237345:0|t[|cRXP_LOOT_多汁的乌龟肉片|r]
*|cRXP_WARN_Use the|r |T237345:0|t[|cRXP_LOOT_Succulent Turtle Filet|r]
.use 86489
.collect 86489,6,31092,0x1,-1
.complete 31092,1 
.mob 盐水壳钳嘴龟
step
#label OracleHissir
.goto 422,41.935,63.781
>>击杀 |cRXP_ENEMY_先知希希尔|r
.complete 31359,1 
.mob 神谕者希斯尔
step
.goto 422,41.87,63.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_发光的琥珀|r交谈
.accept 31398 >>接任务: |cRXP_WARN_四分五裂|r
.target Glowing Amber
step
#completewith next
>>击杀 |cRXP_ENEMY_泥鳞部族|r
.complete 31359,2 
.mob Muckscale Tribe
step
#loop
.goto 422,44.334,67.336,38,0
.goto 422,45.885,61.940,38,0
.goto 422,39.003,62.402,38,0
.goto 422,35.147,56.680,38,0
.goto 422,34.928,66.549,38,0
.goto 422,39.065,67.311,38,0
.goto 422,41.935,63.781,38,0
.goto 422,44.334,67.336,0
.goto 422,45.885,61.940,0
.goto 422,39.003,62.402,0
.goto 422,35.147,56.680,0
.goto 422,34.928,66.549,0
.goto 422,39.065,67.311,0
.goto 422,41.935,63.781,0
>>击杀 |cRXP_ENEMY_盐壳钳嘴龟|r, 拾取 |T237345:0|t[|cRXP_LOOT_多汁的乌龟肉片|r]
*|cRXP_WARN_Use the|r |T237345:0|t[|cRXP_LOOT_Succulent Turtle Filet|r]
.use 86489
.collect 86489,6,31092,0x1,-1
.complete 31092,1 
.mob 盐水壳钳嘴龟
step
#loop
.goto 422,41.935,63.781,32,0
.goto 422,37.183,57,529,32,0
.goto 422,38.893,68.359,32,0
.goto 422,41.935,63.781,0
.goto 422,37.183,57,529,0
.goto 422,38.893,68.359,0
>>击杀 |cRXP_ENEMY_泥鳞部族|r
.complete 31359,2 
.mob Muckscale Tribe
step
.goto 422,31.80,88.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_解剖者里克卡尔|r交谈
.turnin 31605 >>交任务: |cRXP_FRIENDLY_扎尼提克的发现|r
.accept 31606 >>接任务: |cRXP_WARN_切割者觉醒|r
.timer 47,Roleplay Duration
.target 切割者里卡尔
step
.goto 422,31.80,88.95
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_解剖者里克卡尔|r交谈
.turnin 31606 >>交任务: |cRXP_FRIENDLY_切割者觉醒|r
.target 切割者里卡尔
step
.goto 422,54.73,72.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.accept 31265 >>接任务: |cRXP_WARN_玛祖的气息|r
.target 甲板长官阿林
step
>>|cRXP_WARN_使用|r |T134851:0|t[玛祖的气息药水]
.use 85869
.goto 422,54.73,72.17
.complete 31265,1 
step
.goto 422,54.73,72.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.turnin 31265 >>交任务: |cRXP_FRIENDLY_玛祖的气息|r
.target 甲板长官阿林
.accept 31182 >>接任务: |cRXP_WARN_原来是水獭|r
.accept 31181 >>接任务: |cRXP_WARN_新鲜的诱饵|r
step
#completewith ColdwhiskerOtter
#hidewindow
#loop
.goto 422,56.84,80.93,35,0
.goto 422,61.55,79.81,40,0
.goto 422,60.64,85.37,40,0
+1
step
#completewith next
>>点击 |cRXP_FRIENDLY_寒须水獭|r
.complete 31182,1 
.target 寒须水獭
step
>>击杀 |cRXP_ENEMY_海王鱼|r, 拾取 |T237338:0|t[海王鱼肉块]
>>点击 |cRXP_PICK_空蟹笼|r
.complete 31181,1 
.mob 海王鱼
step
#label ColdwhiskerOtter
>>点击 |cRXP_FRIENDLY_寒须水獭|r
.complete 31182,1 
.target 寒须水獭
step
.goto 422,54.73,72.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.turnin 31181 >>交任务: |cRXP_FRIENDLY_新鲜的诱饵|r
.turnin 31182 >>交任务: |cRXP_FRIENDLY_原来是水獭|r
.accept 31183 >>接任务: |cRXP_WARN_会见船长|r
.target 甲板长官阿林
step
.goto 422,55.67,72.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_船长"闷水壶"苏道|r交谈
.turnin 31183 >>交任务: |cRXP_FRIENDLY_会见船长|r
.target 船长“闷水壶”苏道
.accept 31184 >>接任务: |cRXP_WARN_往事与背叛|r
.accept 31185 >>接任务: |cRXP_WARN_带狗狗散步|r
step
.goto 422,54.72,72.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.accept 31188 >>接任务: |cRXP_WARN_鲨鱼周|r
.accept 31187 >>接任务: |cRXP_WARN_收获螃蟹|r
.target 甲板长官阿林
step
.goto 422,47.98,73.73
>>|cRXP_WARN_使用 |T134434:0|t[狗哨] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_狗狗|r|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_Dog|r
.accept 31186 >>接任务: |cRXP_WARN_狗狗的食物|r
.use 85955
.target 狗
step
#completewith BringDogWhaleCorpse
>>击杀 |cRXP_ENEMY_长鳍长尾鲨|r, 拾取 |T125055:0|t[长鳍长尾鲨颚骨]
>>|cRXP_WARN_使用|r |T125055:0|t[长尾鲨颚骨]
.use 85998
.complete 31188,1 
.mob 长鳍长尾鲨
step
#completewithBringDogWhaleCorpse
>>点击 |cRXP_PICK_装满的蟹笼|r
.complete 31187,1 
step
#completewith BringDogWhaleCorpse
>>击杀 |cRXP_ENEMY_石壳龙虾人|r
*|cRXP_WARN_Don't kill the too fast. Wait until your dog is in range and has eaten the previous one.|r
.complete 31186,1 
.mob 石壳龙虾人
step
>>|cRXP_WARN_跟随箭头指引|r
*|cRXP_WARN_Make sure you have summoned your|r |cRXP_FRIENDLY_Dog|r
.goto 422,45.83,73.55
.use 85955
.complete 31185,1 
step
>>|cRXP_WARN_跟随箭头指引|r
*|cRXP_WARN_Make sure you have summoned your|r |cRXP_FRIENDLY_Dog|r
.goto 422,44.93,78.32
.use 85955
.complete 31185,2 
step
>>点击 |cRXP_PICK_脚箱|r
.goto 422,44.72,78.66
.complete 31184,1 
step
#label BringDogWhaleCorpse
>>|cRXP_WARN_跟随箭头指引|r
*|cRXP_WARN_Make sure you have summoned your|r |cRXP_FRIENDLY_Dog|r
.use 85955
.goto 422,40.14,78.07
.complete 31185,3 
step
#completewith ThresherTeeth
#hidewindow
#loop
.goto 422,46.07,70.14,55,0
.goto 422,46.06,80.77,55,0
.goto 422,44.40,77.46,55,0
.goto 422,39.52,78.78,55,0
+1
step
#completewith DogFed
>>击杀 |cRXP_ENEMY_长鳍长尾鲨|r, 拾取 |T125055:0|t[长鳍长尾鲨颚骨]
>>|cRXP_WARN_使用|r |T125055:0|t[长尾鲨颚骨]
.use 85998
.complete 31188,1 
.mob 长鳍长尾鲨
step
#completewith DogFed
>>点击 |cRXP_PICK_装满的蟹笼|r
.complete 31187,1 
step
#label DogFed
>>击杀 |cRXP_ENEMY_石壳龙虾人|r
*|cRXP_WARN_Don't kill the too fast. Wait until your dog is in range and has eaten the previous one.|r
.complete 31186,1 
.use 85955
.mob 石壳龙虾人
step
#completewith next
>>击杀 |cRXP_ENEMY_长鳍长尾鲨|r, 拾取 |T125055:0|t[长鳍长尾鲨颚骨]
>>|cRXP_WARN_使用|r |T125055:0|t[长尾鲨颚骨]
.use 85998
.complete 31188,1 
.mob 长鳍长尾鲨
step
>>点击 |cRXP_PICK_装满的蟹笼|r
.complete 31187,1 
step
#label ThresherTeeth
>>击杀 |cRXP_ENEMY_长鳍长尾鲨|r, 拾取 |T125055:0|t[长鳍长尾鲨颚骨]
>>|cRXP_WARN_使用|r |T125055:0|t[长尾鲨颚骨]
.use 85998
.complete 31188,1 
.mob 长鳍长尾鲨
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_狗狗|r |cRXP_WARN_就在你身边|r 交谈
*|cRXP_WARN_使用 |T134434:0|t[狗哨] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_狗狗|r|r if you can't see it
.turnin 31186 >>交任务: |cRXP_FRIENDLY_狗狗的食物|r
.use 85955
.target 狗
step
.goto 422,55.66,72.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_船长"闷水壶"苏道|r交谈
.turnin 31184 >>交任务: |cRXP_FRIENDLY_往事与背叛|r
.target 船长“闷水壶”苏道
.turnin 31185 >>交任务: |cRXP_FRIENDLY_带狗狗散步|r
step
.goto 422,54.72,72.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.turnin 31187 >>交任务: |cRXP_FRIENDLY_收获螃蟹|r
.turnin 31188 >>交任务: |cRXP_FRIENDLY_鲨鱼周|r
.accept 31189 >>接任务: |cRXP_WARN_提供协助|r
.target 甲板长官阿林
step
.goto 422,53.64,76.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钓鱼大师朱连|r交谈
.complete 31189,1 
.skipgossip 64259,1
.target 钓鱼大师句连
step
#completewith next
.cast 125460 >>点击 |cRXP_PICK_竹竿|r
.goto 422,53.69,76.02
.cast 131712 >>点击 |cRXP_PICK_蛇杖|r
.goto 422,53.68,76.05
.cast 131715 >>点击 |cRXP_PICK_经典钓竿|r
.goto 422,53.59,76.04
.cast 131718 >>点击 |cRXP_PICK_简易钓竿|r
.goto 422,53.58,76.02
step
>>击杀 |cRXP_ENEMY_狡的子嗣|r
.complete 31189,2 
.goto 422,53.64,76.06
.mob 狡的子嗣
step
.goto 422,54.72,72.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.turnin 31189 >>交任务: |cRXP_FRIENDLY_提供协助|r
.target 甲板长官阿林
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_船长"闷水壶"苏道|r交谈
.accept 31190 >>接任务: |cRXP_WARN_水手的复仇|r
.goto 422,54.77,72.11
.target 船长“闷水壶”苏道
step
#completewith next
.goto 422,56.15,76.33
.vehicle 64235 >>点击 |cRXP_PICK_雾海飞跃者二世|r
step
>>|cRXP_WARN_使用 |T514302:0|t[鱼叉火炮] (2), |cRXP_WARN_朝十字准星射击|r|r
.goto 422,56.15,76.33
.complete 31190,1 
.complete 31190,3 
.complete 31190,4 
.complete 31190,2 
step
#completewith next
.exitvehicle >>离开载具
step
.goto 422,56.57,75.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_船长"闷水壶"苏道|r交谈
.turnin 31190 >>交任务: |cRXP_FRIENDLY_水手的复仇|r
.target 船长“闷水壶”苏道
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甲板长阿里|r交谈
.accept 31354 >>接任务: |cRXP_WARN_玛祖的奖赏|r
.goto 422,56.57,75.83
.target 甲板长官阿林
step
.goto 422,54.90,72.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钓鱼大师朱连|r交谈
.turnin 31354 >>交任务: |cRXP_FRIENDLY_玛祖的奖赏|r
.target 钓鱼大师句连
step
#loop
.goto 422,62.190,56.784,30,0
.goto 422,64.457,64.439,28,0
.goto 422,67.859,63.296,30,0
.goto 422,67.536,57.168,30,0
.goto 422,62.190,56.784,0
.goto 422,64.457,64.439,0
.goto 422,67.859,63.296,0
.goto 422,67.536,57.168,0
>>击杀 |cRXP_ENEMY_雾刃撕裂者|r
.complete 31019,1,6 
.mob 雾刃撕裂者
step
#completewith next
.goto 422,66.772,63.952,10 >>进入洞窟
step
>>击杀 |cRXP_ENEMY_雾刃邪鳞领主|r
.goto 422,66.43,66.11
.complete 31019,1 
.complete 31019,2 
.mob 雾刃撕裂者
.mob 雾刃邪鳞领主
step
.goto 422,66.86,65.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_远古琥珀块|r 和 |cRXP_FRIENDLY_至尊者柯尔凡|r 交谈
.turnin 31019 >>交任务: |cRXP_FRIENDLY_琥珀即生命|r
.timer 30,Roleplay Duration
.target +大块远古琥珀
.accept 31021 >>接任务: |cRXP_WARN_活力琥珀|r
.accept 31020 >>接任务: |cRXP_WARN_喂食|r
.target +至尊者柯尔凡
step
#completewith next
>>击杀 |cRXP_ENEMY_寒噬鳄鱼|r
.complete 31020,1 
.mob 寒噬鳄鱼
step
#loop
.goto 422,66.219,62.486,25,0
.goto 422,66.151,57.196,25,0
.goto 422,63.967,60.886,25,0
.goto 422,66.219,62.486,0
.goto 422,66.151,57.196,0
.goto 422,63.967,60.886,0
>>点击 |cRXP_PICK_琥珀碎片|r
>>|cRXP_WARN_当他不在吃鳄鱼时, 在|r |cRXP_FRIENDLY_至尊者柯尔凡|r |cRXP_WARN_附近使用|r |T463485:0|t[活体余烬] |cRXP_WARN_喂食|r
.use 82864
.collect 82864,9,31021,0x1,-1
.complete 31021,1 
.target 至尊者柯尔凡
step
#loop
.goto 422,67.291,56.815,40,0
.goto 422,65.163,54.581,40,0
.goto 422,62.413,56.369,40,0
.goto 422,64.395,61.529,40,0
.goto 422,66.929,60.934,40,0
.goto 422,65.853,58.294,40,0
.goto 422,67.291,56.815,0
.goto 422,65.163,54.581,0
.goto 422,62.413,56.369,0
.goto 422,64.395,61.529,0
.goto 422,66.929,60.934,0
.goto 422,65.853,58.294,0
>>击杀 |cRXP_ENEMY_寒噬鳄鱼|r
.complete 31020,1 
.mob 寒噬鳄鱼
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
.goto 422,62.687,60.813
.goto 422,66.86,65.35,0
.turnin 31020 >>交任务: |cRXP_FRIENDLY_喂食|r
.turnin 31021 >>交任务: |cRXP_FRIENDLY_活力琥珀|r
.accept 31022 >>接任务: |cRXP_WARN_凯帕圣树·扎尔|r
.target 至尊者柯尔凡
step
>>点击 |cRXP_PICK_声波塔|r
.goto 422,59.799,59.477
.complete 31022,1 
.timer 102,Roleplay Duration
step
>>击杀正在出现的 |cRXP_ENEMY_伊克提克塔卫兵|r
.goto 422,59.799,59.477
.complete 31022,2 
.mob 伊克提克塔卫
step
.goto 422,66.86,65.35,0
.goto 422,59.799,59.477
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
.turnin 31022 >>交任务: |cRXP_FRIENDLY_凯帕圣树·扎尔|r
.accept 31026 >>接任务: |cRXP_WARN_问题的根源|r
.target 至尊者柯尔凡
step
#completewith next
.goto 422,58.526,59.398,8 >>|cRXP_WARN_进入洞窟|r
step
.goto 422,57.368,57.776
>>击杀 |cRXP_ENEMY_寒噬主母|r
*|cRXP_WARN_Running over the eggs will spawn more small crocodiles|r
.complete 31026,1 
.mob 寒噬主母
step
.goto 422,57.368,57.776
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_至尊者柯尔凡|r交谈
.turnin 31026 >>交任务: |cRXP_FRIENDLY_问题的根源|r
.accept 32030 >>接任务: |cRXP_WARN_千年一遇|r
.target 至尊者柯尔凡
step
#completewith next
.goto 422,58.526,59.398,8 >>|cRXP_WARN_离开洞穴|r
step
.goto 422,54.26,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_操纵者卡兹提克|r交谈
.turnin 31092 >>交任务: |cRXP_FRIENDLY_要么喂它，要么被吃掉|r
.turnin 31359 >>交任务: |cRXP_FRIENDLY_恐虫密语者|r
.turnin 31398 >>交任务: |cRXP_FRIENDLY_四分五裂|r
.target 操纵者卡兹提克
step
.goto 422,55.06,35.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风掠者基尔鲁克|r交谈
.turnin 31179 >>交任务: |cRXP_FRIENDLY_血之气息|r
.target 掠风者克尔鲁克
step
.goto 422,54.72,34.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Klaxxi'va Ik|r交谈
.turnin 32030 >>交任务: |cRXP_FRIENDLY_千年一遇|r
.accept 31782 >>接任务: |cRXP_WARN_颠覆|r
.target 卡拉克西瓦·伊克
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Klaxxi'va Ik|r交谈
.goto 422,54.72,34.74
.complete 31782,1 
.target 卡拉克西瓦·伊克
step
.goto 422,55.11,34.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Klaxxi'va Vor|r交谈
.turnin 31782 >>交任务: |cRXP_FRIENDLY_颠覆|r
.target 卡拉克西瓦·沃尔
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 9c) 第 10 章 - 翡翠林 2
#displayname 第 10 章 - 翡翠林第 2 部分
#title Jade Forest 2
<< Horde
step
.goto 371,27.59,32.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.accept 31121 >>接任务: |cRXP_WARN_驻足聆听|r
.target 游学者周卓
step
#completewith next
.vehicle 63138 >>|cRXP_WARN_点击乔的锅|r
.timer 78,Roleplay Duration
.goto 371,27.68,32.56
step
>>等待剧情结束, 不要跳过
.goto 371,27.68,32.56
.complete 31121,1 
step
.goto 371,27.59,32.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31121 >>交任务: |cRXP_FRIENDLY_驻足聆听|r
.accept 31132 >>接任务: |cRXP_WARN_设身处地|r
.timer 1,Roleplay Duration
.target 游学者周卓
step
#completewith next
.goto 371,30.84,34.05
.logout 19 >>|cRXP_WARN_在路径点位置登出|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.goto 371,30.84,34.05
.goto 371,27.59,32.68,0
.turnin 31132 >>交任务: |cRXP_FRIENDLY_设身处地|r
.accept 31134 >>接任务: |cRXP_WARN_顽石开口|r
.target 游学者周卓
step
>>点击 |cRXP_PICK_第一块巨石|r
.goto 371,30.88,33.69
.complete 31134,1 
step
>>点击 |cRXP_PICK_第二块石碑|r, 击杀 |cRXP_ENEMY_嗜血的蜥蜴人|r
.goto 371,30.64,33.78
.complete 31134,2 
.mob 嗜血的蜥蜴人
step
>>点击 |cRXP_PICK_第三块巨石|r
.goto 371,30.59,34.15
.complete 31134,3 
step
.goto 371,30.84,34.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31134 >>交任务: |cRXP_FRIENDLY_顽石开口|r
.accept 31152 >>接任务: |cRXP_WARN_窥探过去|r
.timer 90,Roleplay Duration
.target 游学者周卓
step
>>|cRXP_WARN_跟随 |cRXP_FRIENDLY_游学者周卓|r|r
.goto 371,31.46,34.79,22,0
.goto 371,30.04,31.51,22,0
.goto 371,28.83,32.60
.complete 31152,1 
.target 游学者周卓
step
.goto 371,28.83,32.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31152 >>交任务: |cRXP_FRIENDLY_窥探过去|r
.target 游学者周卓
.accept 31167 >>接任务: |cRXP_WARN_兄弟|r
step
>>|cRXP_WARN_点击 |cRXP_PICK_熏香束|r|r
.goto 371,28.79,32.48
.complete 31167,1 
step
.goto 371,28.83,32.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31167 >>交任务: |cRXP_FRIENDLY_兄弟|r
.target 游学者周卓
.accept 29879 >>接任务: |cRXP_WARN_整个吞下|r
step
#completewith EngorgedCrocolisk
#hidewindow
#loop
.goto 371,24.48,35.57,32,0
.goto 371,23.57,33.43,32,0
.goto 371,22.41,34.98,32,0
.goto 371,23.62,36.74,32,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_肿胀的鳄鱼|r
.complete 29879,1 
.mob 肿胀的鳄鱼
step
>>拾取 |T133912:0|t[|cRXP_PICK_斑点鳟鱼|r] |cRXP_WARN_(可在骑乘时)|r
.complete 29879,2 
.target 斑点鳟
step
#label EngorgedCrocolisk
>>击杀 |cRXP_ENEMY_肿胀的鳄鱼|r
.complete 29879,1 
.mob 肿胀的鳄鱼
step
.goto 371,26.29,37.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图奇图奇|r交谈
.turnin 29879 >>交任务: |cRXP_FRIENDLY_整个吞下|r
.accept 29935 >>接任务: |cRXP_WARN_唯命是从|r
.target 图奇图奇
step
.goto 371,25.88,38.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波波|r交谈
.accept 29933 >>接任务: |cRXP_WARN_上等虫腿|r
.target 泼泼
step
.goto 371,25.93,38.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼比尼比|r交谈
.accept 29924 >>接任务: |cRXP_WARN_杀死柯山|r
.target 尼比尼比
step
.goto 371,28.19,38.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_叽克叽克|r交谈
.accept 31241 >>接任务: |cRXP_WARN_邪恶的无毛怪|r
.target 叽克叽克
step
#completewith next
>>击杀 |cRXP_ENEMY_疲惫的伞兵|r, 拾取 |T463448:0|t[|cRXP_LOOT_联盟效力奖章|r]
.complete 31241,1 
.mob 疲惫的伞兵
step
>>击杀 |cRXP_ENEMY_杰克·阿罗|r, 拾取 |T134166:0|t[杰克·阿罗的头颅] 并在背包中点击它
.goto 371,30.86,41.18
.collect 134166,1,31261,0
.accept 31261 >>接任务: |cRXP_WARN_杰克船长的亡灵|r
.mob 杰克·阿罗
step
#loop
.goto 371,30.13,39.94,32,0
.goto 371,31.26,39.61,32,0
.goto 371,31.78,42.50,32,0
.goto 371,29.95,42.19,32,0
>>击杀 |cRXP_ENEMY_疲惫的伞兵|r, 拾取 |T463448:0|t[|cRXP_LOOT_联盟效力奖章|r]
.complete 31241,1 
.mob 疲惫的伞兵
step
#completewith next
.goto 371,33.35,42.34,8 >>进入洞窟
step
.goto 371,33.35,41.63
>>击杀 |cRXP_ENEMY_柯山|r |cRXP_WARN_在洞穴内|r
.complete 29924,1 
.mob 柯山
step
.goto 371,33.35,41.63
>>点击小地图下方的任务提示窗口, 或在任务日志中提交任务
.turnin 29924 >>交任务: |cRXP_FRIENDLY_杀死柯山|r
step
#loop
.goto 371,32.93,45.42,20,0
.goto 371,30.78,45.11,20,0
.goto 371,29.10,43.94,25,0
.goto 371,28.24,43.10,28,0
.goto 371,29.45,45.55,30,0
>>击杀 |cRXP_ENEMY_虎纹蝇|r, 拾取 |T1:0|t[|cRXP_LOOT_虫子腿|r]
.complete 29933,1 
.mob 虎萤
step
.goto 371,27.99,47.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡哈卡哈酋长|r交谈
.turnin 29935 >>交任务: |cRXP_FRIENDLY_唯命是从|r
.turnin 31261 >>交任务: |cRXP_FRIENDLY_杰克船长的亡灵|r
.turnin 29933 >>交任务: |cRXP_FRIENDLY_上等虫腿|r
.turnin 31241 >>交任务: |cRXP_FRIENDLY_邪恶的无毛怪|r
.accept 29936 >>接任务: |cRXP_WARN_即时通信|r
.target 酋长卡哈卡哈
step
>>|cRXP_WARN_点击 |cRXP_PICK_信号焰火|r|r
.goto 371,27.98,46.78
.complete 29936,1 
step
.goto 371,28.27,47.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 29936 >>交任务: |cRXP_FRIENDLY_即时通信|r
.target 纳兹戈林将军
.accept 29941 >>接任务: |cRXP_WARN_超越地平线|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
.goto 371,28.349,46.970
.skipgossip 56340,1
.complete 29941,1 
.target 夏琪亚
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡哈卡哈|r交谈
.goto 371,27.988,47.194
.skipgossip 56336,1
.complete 29941,4 
.target Kah Kah
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.goto 371,27.099,48.986
.skipgossip 56478,1
.complete 29941,3 
.target 匿踪大师琪麟
step
#loop
.goto 371,27.058,50.655,12,0
.goto 371,28.068,50.402,12,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格罗克中士|r交谈
.skipgossip 56477,1
.complete 29941,2 
.target 格罗克中士
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r和|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 29941 >>交任务: |cRXP_FRIENDLY_超越地平线|r
.goto 371,28.25,47.77
.target +纳兹戈林将军
.accept 29937 >>接任务: |cRXP_WARN_愤怒的飞禽|r
.goto 371,28.297,47.793
.target +利维特·急刹
step
.goto 371,27.985,47.196
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡哈卡哈酋长|r交谈
.accept 31239 >>接任务: |cRXP_WARN_你叫什么名字名字？|r
.target 酋长卡哈卡哈
step
#hidewindow
#completewith RiverstrideJinyu
#label RiverstrideJinyuA
.goto 371,28.409,45.372,18,0
.goto 371,30.067,47.278,25,0
.goto 371,34.370,47.798,25,0
.goto 371,33.611,45.314,25,0
.goto 371,29.212,44.341,25 >>A
step
#completewith next
>>击杀 |cRXP_ENEMY_饥饿的血爪鹰|r, 拾取 |T237412:0|t[|cRXP_LOOT_一把鸟肠|r]
.complete 29937,1 
.mob 饥饿的血爪鹰
step
#completewith RiverstrideJinyuA
#label RiverstrideJinyu
.goto 371,28.409,45.372,0
.goto 371,30.067,47.278,0
.goto 371,34.370,47.798,0
.goto 371,33.611,45.314,0
.goto 371,29.212,44.341,0
>>击杀 |cRXP_ENEMY_溪行锦鱼人|r
.complete 31239,1 
.mob 溪行锦鱼人
step
#requires RiverstrideJinyu
#completewith next
>>击杀 |cRXP_ENEMY_溪行锦鱼人|r
.complete 31239,1 
.mob 溪行锦鱼人
step
#requires RiverstrideJinyu
#loop
.goto 371,31.903,49.596,22,0
.goto 371,31.407,53.829,22,0
.goto 371,29.808,51.347,25,0
.goto 371,27.943,52.863,28,0
.goto 371,25.672,51.566,38,0
.goto 371,29.510,50.449,28,0
.goto 371,30.147,47.972,20,0
.goto 371,31.903,49.596,0
.goto 371,31.407,53.829,0
.goto 371,29.808,51.347,0
.goto 371,27.943,52.863,0
.goto 371,25.672,51.566,0
.goto 371,29.510,50.449,0
.goto 371,30.147,47.972,0
>>击杀 |cRXP_ENEMY_饥饿的血爪鹰|r, 拾取 |T237412:0|t[|cRXP_LOOT_一把鸟肠|r]
.complete 29937,1 
.mob 饥饿的血爪鹰
step
.goto 371,27.24,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 29937 >>交任务: |cRXP_FRIENDLY_愤怒的飞禽|r
.accept 29939 >>接任务: |cRXP_WARN_炸鱼|r
.target 利维特·急刹
step
.goto 371,27.033,50.842
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃克埃克|r交谈
.accept 29942 >>接任务: |cRXP_WARN_鱼儿都是我们的！|r
.target 埃克埃克
step
#completewith ExplodedSlicky
>>击杀 |cRXP_ENEMY_淤泥钳嘴龟|r, 拾取 |T237339:0|t[钳嘴龟肉排]
.complete 29942,1 
.mob 淤泥钳嘴龟
step
#completewith next
.goto 371,26.726,55.367
.cast 105999 >>|cRXP_WARN_在航点位置使用|r |T463515:0|t[鸟肠炸弹]
step
#label ExplodedSlicky
>>拾取 |T133916:0|t[|cRXP_PICK_爆炸滑溜鱼|r]
.goto 371,26.726,55.367,0
.goto 371,26.55,55.64
.use 76262
.complete 29939,1 
step
#loop
.goto 371,26.000,54.147,35,0
.goto 371,27.173,54.755,22,0
.goto 371,27.457,56.936,35,0
.goto 371,26.010,56.384,28,0
.goto 371,26.000,54.147,0
.goto 371,27.173,54.755,0
.goto 371,27.457,56.936,0
.goto 371,26.010,56.384,0
>>击杀 |cRXP_ENEMY_淤泥钳嘴龟|r, 拾取 |T237339:0|t[钳嘴龟肉排]
.complete 29942,1 
.mob 淤泥钳嘴龟
step
>>击杀 |cRXP_ENEMY_淤泥钳嘴龟|r, 拾取 |T237339:0|t[钳嘴龟肉排]
.goto 371,27.12,55.13
.complete 29942,1 
.mob 淤泥钳嘴龟
step
.goto 371,27.04,50.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃克埃克|r交谈
.turnin 29942 >>交任务: |cRXP_FRIENDLY_鱼儿都是我们的！|r
.target 埃克埃克
step
.goto 371,27.24,50.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 29939 >>交任务: |cRXP_FRIENDLY_炸鱼|r
.target 利维特·急刹
step
#loop
.goto 371,30.067,47.278,25,0
.goto 371,28.409,45.372,18,0
.goto 371,29.212,44.341,25,0
.goto 371,33.611,45.314,25,0
.goto 371,34.370,47.798,25,0
.goto 371,30.067,47.278,0
.goto 371,28.409,45.372,0
.goto 371,29.212,44.341,0
.goto 371,33.611,45.314,0
.goto 371,34.370,47.798,0
>>击杀 |cRXP_ENEMY_溪行锦鱼人|r
.complete 31239,1 
.mob 溪行锦鱼人
step
.goto 371,27.98,47.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡哈卡哈酋长|r交谈
.turnin 31239 >>交任务: |cRXP_FRIENDLY_你叫什么名字名字？|r
.target 酋长卡哈卡哈
step
.goto 371,28.60,47.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里科|r交谈
.accept 29730 >>接任务: |cRXP_WARN_斥候报告：敌对土著|r
.timer 1,Roleplay Duration
.target 里克
step
>>点击 |cRXP_PICK_警告标志|r
.goto 371,38.31,45.42
.complete 29730,1 
.target Warning Sign
step
>>点击 |cRXP_PICK_栩栩如生的青玉雕像|r
.goto 371,38.87,45.98
.complete 29730,2 
.timer 1,Roleplay Duration
.target 栩栩如生的青玉雕像
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寡妇绿爪|r交谈
.goto 371,39.23,46.21
.skipgossip 55381,1
.timer 11,Roleplay Duration
.complete 29730,3 
.target 寡妇绿爪
step
.isOnQuest 29730
#completewith next
.exitvehicle >>离开载具
step
.goto 371,28.60,47.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里科|r交谈
.turnin 29730 >>交任务: |cRXP_FRIENDLY_斥候报告：敌对土著|r
.target 里克
step
.goto 371,28.65,47.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.accept 29731 >>接任务: |cRXP_WARN_斥候报告：步入正轨|r
.timer 32,Roleplay Duration
.target 匿踪大师琪麟
step
>>对 |cRXP_ENEMY_潜伏的老虎|r 使用 |T458733:0|t[烟雾炸弹] (1)
.goto 371,48.60,60.12
.complete 29731,1 
.mob 潜伏的老虎
step
#completewith next
.exitvehicle >>离开载具
step
.goto 371,28.65,47.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.turnin 29731 >>交任务: |cRXP_FRIENDLY_斥候报告：步入正轨|r
.target 匿踪大师琪麟
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里科|r交谈
.accept 29823 >>接任务: |cRXP_WARN_斥候报告：敌人的朋友|r
.goto 371,28.60,47.43
.timer 43,Roleplay Duration
.target 里克
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与被困住的|cRXP_FRIENDLY_影踪大师琪麟|r交谈
>>|T132939:0|t[上勾拳] (1): |cRXP_WARN_用于击退敌人|r
>>|T237150:0|t[泼洒污秽] (2): |cRXP_WARN_用于远程击杀敌人|r
.goto 371,49.82,70.51
.complete 29823,1 
.skipgossip 55688,1
step
#completewith next
.exitvehicle >>离开载具
step
.goto 371,28.60,47.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里科|r交谈
.turnin 29823 >>交任务: |cRXP_FRIENDLY_斥候报告：敌人的朋友|r
.target 里克
step
.goto 371,28.64,47.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
.accept 29824 >>接任务: |cRXP_WARN_斥候报告：锦鱼得水|r
.timer 23,Roleplay Duration
.target 夏琪亚
step
>>点击 |cRXP_PICK_狙击枪|r
>>|cRXP_WARN_之后点击 |cRXP_ENEMY_珠鳍守池者|r 击杀他们, 保护 |cRXP_FRIENDLY_匿踪大师琪麟|r|r
*You also have to click on |cRXP_ENEMY_Kiryn's Poison Barrels|r
.goto 371,62.56,82.15
.complete 29824,1 
.mob 珠鳍守池者
.target 琪麟 Poison Barrel
step
#completewith next
.exitvehicle >>离开载具
step
.goto 371,28.64,47.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
.turnin 29824 >>交任务: |cRXP_FRIENDLY_斥候报告：锦鱼得水|r
.target 夏琪亚
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.accept 29943 >>接任务: |cRXP_WARN_身边的游击队|r
.goto 371,28.67,47.53
.target 纳兹戈林将军
step
.goto 371,27.23,50.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.accept 29968 >>接任务: |cRXP_WARN_绿色能源|r
.target 利维特·急刹
step
#completewith AllianceInfiltrator
#hidewindow
#loop
.goto 371,29.17,52.67,30,0
.goto 371,30.32,53.83,25,0
.goto 371,31.79,51.26,35,0
.goto 371,29.56,50.01,35,0
.goto 371,29.17,52.67,0
.goto 371,30.32,53.83,0
.goto 371,31.79,51.26,0
.goto 371,29.56,50.01,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_联盟渗透者|r
.complete 29943,1 
.mob 联盟渗透者
step
>>点击 |cRXP_PICK_绿树枝|r
.complete 29968,1 
step
#label AllianceInfiltrator
>>击杀 |cRXP_ENEMY_联盟渗透者|r
.complete 29943,1 
.mob 联盟渗透者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r|cRXP_WARN_就在你身边|r交谈
.turnin 29943 >>交任务: |cRXP_FRIENDLY_身边的游击队|r
.accept 29966 >>接任务: |cRXP_WARN_烧毁那座房子|r
.target 纳兹戈林将军
step
>>|cRXP_WARN_使用|r |T461806:0|t[纳兹格里姆的烈酒]
.use 76336
.goto 371,29.44,54.18
.complete 29966,1 
step
.goto 371,27.23,50.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 29968 >>交任务: |cRXP_FRIENDLY_绿色能源|r
.accept 29967 >>接任务: |cRXP_WARN_炸弹才是王道！|r
.target 利维特·急刹
step
#completewith next
.gossipoption 40650 >>与|cRXP_FRIENDLY_利维特·急刹|r交谈
.target 利维特·急刹
step
>>使用 |T136173:0|t[投掷甲烷炸弹] (1) 在矩形位置释放毒云
>>击杀 |cRXP_ENEMY_锦鱼人进攻者|r
.goto 371,28.91,49.18
.complete 29967,1 
.mob 吉恩yu Attackers
step
.goto 371,28.98,49.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 29967 >>交任务: |cRXP_FRIENDLY_炸弹才是王道！|r
.target 利维特·急刹
step
.goto 371,28.67,47.53
.convertquest 30015,31230 << Horde
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 29966 >>交任务: |cRXP_FRIENDLY_烧毁那座房子|r
.accept 30015 >>接任务: |cRXP_WARN_晨芳园|r
.target 纳兹戈林将军
step
.goto 371,46.81,46.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30015 >>交任务: |cRXP_FRIENDLY_晨芳园|r
.timer 25,Roleplay Duration
.target 游学者周卓
step
.goto 371,47.15,46.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托娅|r交谈
.accept 31230 >>接任务: |cRXP_WARN_欢迎来到晨芳园|r
.target 托亚
step
.goto 371,46.78,45.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯·游酒|r交谈
.complete 31230,3 
.target 凯·游酒
step
.goto 371,48.49,44.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风裘大师|r交谈
.complete 31230,1 
.target 风裘大师
step
.goto 371,45.72,43.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佩吉·金酿|r交谈
.complete 31230,2 
.target 佩吉·金酿
step
.goto 371,47.16,46.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托娅|r交谈
.turnin 31230 >>交任务: |cRXP_FRIENDLY_欢迎来到晨芳园|r
.target 托亚
step
#include 7) 主线战役 翡翠林 中立
step
.goto 371,28.03,47.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 30499 >>交任务: |cRXP_FRIENDLY_快回来！|r
.target 纳兹戈林将军
.accept 30484 >>接任务: |cRXP_WARN_评估进度|r
.accept 30466 >>接任务: |cRXP_WARN_高效激励|r
step
>>点击 |cRXP_PICK_滑溜鱼桶|r
.goto 371,28.15,47.34
.complete 30466,2 
step
#completewith GaugingOurProgress
>>点击 |cRXP_FRIENDLY_懒惰的猢狲|r
.complete 30466,1 
.target 懒惰的猢狲
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.goto 371,28.41,47.79
.complete 30484,2 
.skipgossip 59305,1
.target 利维特·急刹
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.goto 371,29.16,50.89
.complete 30484,1 
.skipgossip 56841,1
.target 匿踪大师琪麟
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夏琪亚|r交谈
.goto 371,28.45,51.92
.complete 30484,3 
.skipgossip 56838,1
.target 夏琪亚
step
#label GaugingOurProgress
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里科|r交谈
.goto 371,27.00,54.94
.complete 30484,4 
.skipgossip 56840,1
.target 里克
step
#loop
.goto 371,26.99,50.60,25,0
.goto 371,27.18,46.53,26,0
.goto 371,28.70,47.40,25,0
.goto 371,28.72,49.73,20,0
>>点击 |cRXP_FRIENDLY_懒惰的猢狲|r
.complete 30466,1 
.target 懒惰的猢狲
step
.goto 371,28.03,47.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 30466 >>交任务: |cRXP_FRIENDLY_高效激励|r
.turnin 30484 >>交任务: |cRXP_FRIENDLY_评估进度|r
.target 纳兹戈林将军
step << Horde
.goto 371,28.22,46.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.accept 30485 >>接任务: |cRXP_WARN_最后一块拼图|r
.target 游学者周卓
step
#include 7) 主线战役 翡翠林 中立 2
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 9c) 第 10 章 - 翡翠林 2
#displayname 第 10 章 - 翡翠林第 2 部分
#title Jade Forest 2
<< Alliance
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珍珠守护者福锦|r交谈
.accept 29894 >>接任务: |cRXP_WARN_水流之灵|r
.goto 371,58.76,81.28
.target 珍珠守护者福锦
step
.goto 371,58.58,82.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长老卢山|r交谈
.complete 29894,1 
.skipgossip 30,RP
.target 长老卢山
step
.goto 371,58.97,81.7
>>执行 xyz
.complete 29894,2 
step
.goto 371,58.97,81.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r交谈
.turnin 29894 >>交任务: |cRXP_FRIENDLY_水流之灵|r
.target 勇敢的卡拉什
step
.goto 371,58.98,81.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r交谈
.accept 29733 >>接任务: |cRXP_WARN_军情七处报告：丛林迷失|r
.timer 35,RP
.skipgossip 55333,1
.target 利尔·夜风
step
#completewith next
.goto 371,49.88,70.76
.gossipoption 40098 >>与|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
.timer 25,RP
.target 安玻·吉尔妮
step
.goto 371,49.83,70.96
>>使用 |T135975:0|t[双击]\|T135975:0|t[精通打击] 和 |T135975:0|t[稳妥打击]
.complete 29733,1 
.mob 埋伏的猢狲
step
#completewith next
.exitvehicle >>离开载具
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利尔·夜风|r和|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.turnin 29733 >>交任务: |cRXP_FRIENDLY_军情七处报告：丛林迷失|r
.goto 371,58.97,81.83
.target +利尔·夜风
.accept 29725 >>接任务: |cRXP_WARN_军情七处报告：居高临下|r
.timer 46,RP
.goto 371,58.89,81.89,5,0
.goto 371,58.84,81.67
.target +“腌菜”苏利·麦克莱利
step
.isOnQuest 29725
.goto 371,50.64,62.99,10 >>|cRXP_WARN_跟随箭头|r, 使用 (1) |T463556:0|t[光瞄准镜] 击杀 |cRXP_ENEMY_潜伏的老虎|r
.mon Lurking Tiger
step
.isOnQuest 29725
.goto 371,48.47,58.6,10 >>|cRXP_WARN_跟随箭头|r, 使用 (1) |T463556:0|t[光瞄准镜] 击杀 |cRXP_ENEMY_潜伏的老虎|r
.timer 7,RP
step
.isOnQuest 29725
.goto 371,46.35,61.74,10 >>|cRXP_WARN_跟随箭头|r, 使用 (1) |T463556:0|t[光瞄准镜] 击杀 |cRXP_ENEMY_潜伏的老虎|r
.timer 45,RP
step
.isOnQuest 29725
.goto 371,50.94,63.06,20 >>|cRXP_WARN_跟随箭头|r, 使用 (1) |T463556:0|t[光瞄准镜] 击杀 |cRXP_ENEMY_潜伏的老虎|r
.timer 10,RP
step
.goto 371,50.94,63.06
>>|cRXP_WARN_使用|r |T463556:0|t[光瞄镜] (1) 击杀 |cRXP_ENEMY_埋伏的猢狲|r
.complete 29725,4 
.mob 埋伏的猢狲
step
#completewith next
.exitvehicle >>离开载具
step
.goto 371,58.84,81.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.turnin 29725 >>交任务: |cRXP_FRIENDLY_军情七处报告：居高临下|r
.target “腌菜”苏利·麦克莱利
step
.goto 371,59.07,81.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小卢|r交谈
.accept 29726 >>接任务: |cRXP_WARN_军情七处报告：敌对土著|r
.timer 35,RP
.target 小卢
step
.goto 371,38.31,45.4
>>点击 |cRXP_PICK_标志|r
.complete 29726,1 
step
.goto 371,38.86,46.2
>>点击 |cRXP_FRIENDLY_栩栩如生的青玉雕像|r
.complete 29726,2 
.target 栩栩如生的青玉雕像
step
.goto 371,38.94,46.32
>>点击 |cRXP_FRIENDLY_可疑的青玉雕像|r
.complete 29726,3 
.timer 8,RP
.target 可疑的青玉雕像
step
.isOnQuest 29726
.goto 371,39.32,46.23
.gossipoption 40113 >>与|cRXP_FRIENDLY_寡妇绿爪|r交谈
.timer 53,RP
.target 寡妇绿爪
step
.goto 371,39.25,46.22
>>执行 xyz
.complete 29726,4 
.target 寡妇绿爪
step
#completewith next
.exitvehicle >>离开载具
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小卢|r和|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
.turnin 29726 >>交任务: |cRXP_FRIENDLY_军情七处报告：敌对土著|r
.goto 371,59.06,81.89
.target +小卢
.accept 29727 >>接任务: |cRXP_WARN_军情七处报告：不留俘虏|r
.timer 16,RP
.goto 371,58.93,81.93
.target +安玻·吉尔妮
step
#completewith next
.goto 371,28.58,54.44,10 >>点击 |cRXP_PICK_狙击步枪|r
step
>>点击 |cRXP_ENEMY_猢狲的|r |cRXP_PICK_桶|r 和 |cRXP_ENEMY_兽人的|r
.complete 29727,1 
step
.goto 371,58.93,81.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
.turnin 29727 >>交任务: |cRXP_FRIENDLY_军情七处报告：不留俘虏|r
.target 安玻·吉尔妮
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的卡拉什|r和|cRXP_FRIENDLY_海军上将泰勒|r交谈
.accept 29888 >>接任务: |cRXP_WARN_找到游学者|r
.goto 371,58.97,81.70
.target +勇敢的卡拉什
.accept 29903 >>接任务: |cRXP_WARN_绝配|r
.goto 371,58.87,81.69
.target +海军上将泰勒
step
#loop
.goto 371,58.87,82.35,30,0
.goto 371,59.32,83.5,30,0
.goto 371,59.44,84.3,30,0
.goto 371,59.65,85.66,30,0
.goto 371,58.9,84.7,30,0
.goto 371,58.5,84.21,30,0
.goto 371,57.98,82.23,30,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Pearlfin Aqualyte|r交谈
.complete 29903,1 
.target 珠鳍侍水僧
step
.goto 371,58.87,81.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 29903 >>交任务: |cRXP_FRIENDLY_绝配|r
.target 海军上将泰勒
.accept 29904 >>接任务: |cRXP_WARN_另有要事|r
step
#loop
.goto 371,58.72,78.06,30,0
.goto 371,59.89,76.45,30,0
.goto 371,58.72,75.34,30,0
.goto 371,57.75,76.67,30,0
.goto 371,58.72,78.06,0
.goto 371,59.89,76.45,0
.goto 371,58.72,75.34,0
.goto 371,57.75,76.67,0
>>击杀 |cRXP_ENEMY_野地追踪者|r\|cRXP_ENEMY_石皮蜥蜴|r\|cRXP_ENEMY_野生雌虎猎手|r 和 |cRXP_ENEMY_宝石金刚鹦鹉|r
.complete 29904,1 
.mob 野地追踪者
.mob 石皮蜥蜴
.mob 野生雌虎猎手
.mob 宝石鹦鹉
step
.goto 371,58.86,81.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 29904 >>交任务: |cRXP_FRIENDLY_另有要事|r
.target 海军上将泰勒
.accept 29905 >>接任务: |cRXP_WARN_烧死他们|r
.accept 29906 >>接任务: |cRXP_WARN_群龙无首|r
step
#completewith next
>>击杀 |cRXP_ENEMY_古鲁金援兵|r 和 |cRXP_ENEMY_蛇尾新兵|r
.complete 29905,1 
.mob 古鲁金援兵
.mob 吊尾新兵
step
.goto 371,54.98,79.96
>>击杀 |cRXP_ENEMY_酋长咕克嘎克|r
.complete 29906,1 
.mob chief gukgut
step
#loop
.goto 371,53.42,80.34,30,0
.goto 371,53.61,81.31,30,0
.goto 371,54.09,82.81,30,0
.goto 371,55.79,81.84,30,0
>>击杀 |cRXP_ENEMY_古鲁金援兵|r 和 |cRXP_ENEMY_蛇尾新兵|r
.complete 29905,1 
.mob 古鲁金援兵
.mob 吊尾新兵
step
.goto 371,58.89,81.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长老卢山|r交谈
.turnin 29905 >>交任务: |cRXP_FRIENDLY_烧死他们|r
.turnin 29906 >>交任务: |cRXP_FRIENDLY_群龙无首|r
.target 长老卢山
step
.goto 371,53.72,91.50
>>点击 |cRXP_FRIENDLY_诱人美酒|r
.turnin 29888 >>交任务: |cRXP_FRIENDLY_找到游学者|r
.accept 29889 >>接任务: |cRXP_WARN_借来的美酒|r
.target Mouthwatering Brew
step
#completewith next
.goto 371,53.71,91.48
.cast 105594 >>点击 |cRXP_FRIENDLY_诱人美酒|r
.timer 7,RP
step
.goto 371,53.67,91.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 29889 >>交任务: |cRXP_FRIENDLY_借来的美酒|r
.accept 31130 >>接任务: |cRXP_WARN_拜访游学者周卓|r
.timer 13,RP
.target 游学者周卓
step
.goto 371,53.72,90.99
>>点击 |cRXP_PICK_树|r
.complete 31130,1 
.timer 27,RP
step
#completewith next
.goto 371,54.08,90.67
.gossipoption 33293 >>点击 |cRXP_PICK_画作|r
.timer 40,RP
step
>>右键点击增益栏中的 |T237156:0|t[画作] 可节省 20 秒
.complete 31130,2 
.timer 24,RP
step
#completewith next
.goto 371,54.02,91.33
.cast 123949 >>点击 |cRXP_PICK_鸟食槽|r
step
>>右键点击增益栏中的 |T605484:0|t[进食] 可节省 20 秒
.complete 31130,3 
step
.goto 371,54.01,91.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31130 >>交任务: |cRXP_FRIENDLY_拜访游学者周卓|r
.target 游学者周卓
.accept 29891 >>接任务: |cRXP_WARN_效力|r
.accept 29892 >>接任务: |cRXP_WARN_醇度|r
.accept 29893 >>接任务: |cRXP_WARN_色泽|r
step
#hidewindow
#completewith Amberfly Wing
#loop
.goto 371,54.86,88.88,30,0
.goto 371,58.01,89.99,30,0
.goto 371,62.56,89.69,30,0
.goto 371,53.58,88.85,30,0
+1
step
#completewith Mist Horror Heart
>>击杀 |cRXP_ENEMY_闪耀琥珀蝶|r, 点击它们获得 |cRXP_LOOT_琥珀蝶之翼|r
.complete 29893,1 
.mob 烁光琥珀蝇
step
#completewith Mist Horror Heart
>>击杀 |cRXP_ENEMY_泥沼鳄鱼|r, 拾取 |cRXP_LOOT_完好的鳄鱼眼|r
.complete 29892,1 
.mob 泥沼鳄鱼
step
#label Mist Horror Heart
>>击杀 8 只 |cRXP_ENEMY_迷雾爬行者|r 后, |cRXP_ENEMY_迷雾恐魔|r 会刷新, 击杀并拾取 |cRXP_LOOT_迷雾恐魔之心|r
.complete 29891,1 
.complete 29891,2 
.mob mist creeper
.mob 迷雾恐魔
step
#completewith next
>>击杀 |cRXP_ENEMY_闪耀琥珀蝶|r, 点击它们获得 |cRXP_LOOT_琥珀蝶之翼|r
.complete 29893,1 
.mob 烁光琥珀蝇
step
>>击杀 |cRXP_ENEMY_泥沼鳄鱼|r, 拾取 |cRXP_LOOT_纯净鳄鱼眼|r
.complete 29892,1 
.mob 泥沼鳄鱼
step
#label Amberfly Wing
>>击杀 |cRXP_ENEMY_闪耀琥珀蝶|r, 点击它们获得 |cRXP_LOOT_琥珀蝶之翼|r
.complete 29893,1 
.mob 烁光琥珀蝇
step
.goto 371,53.78,90.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 29891 >>交任务: |cRXP_FRIENDLY_效力|r
.turnin 29892 >>交任务: |cRXP_FRIENDLY_醇度|r
.turnin 29893 >>交任务: |cRXP_FRIENDLY_色泽|r
.accept 29890 >>接任务: |cRXP_WARN_集中精神|r
.timer 25,RP
.target 游学者周卓
step
#completewith next
.goto 371,54.68,92.06
.cast 105668 >>点击 |cRXP_PICK_强力梦境酒|r
.timer 102,RP
step
.goto 371,54.58,91.89
>>使用 (1) |T450906:0|t[左] 和 (2) |T450908:0|t[右] 使线条保持在中心附近
.complete 29890,1 
step
#completewith next
.exitvehicle >>离开载具
step
.goto 371,65.90,79.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r
.turnin 29890 >>交任务: |cRXP_FRIENDLY_集中精神|r
.accept 29898 >>接任务: |cRXP_WARN_圣水|r
.target +安度因·乌瑞恩国王
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_任·白爪|r和|cRXP_FRIENDLY_林娜·白爪|r交谈
.accept 29899 >>接任务: |cRXP_WARN_安息|r
.goto 371,65.99,79.29
.target +任·白爪
.accept 29900 >>接任务: |cRXP_WARN_古老的传说|r
.goto 371,65.99,79.39
.target +林娜·白爪
step
#completewith next
>>击杀 |cRXP_ENEMY_受折磨的灵魂|r
.complete 29899,1 
.mob tortured spirit
step
#completewith next
.goto 371,66.38,82.16,10 >>进入洞穴
step
.goto 371,66.82,82.08
>>点击 |cRXP_PICK_愈体泉|r
.complete 29898,1 
step
.goto 371,66.96,83.03,15,0
.goto 371,67.26,81.63
>>点击 |cRXP_PICK_愈智泉|r
.complete 29898,2 
step
.goto 371,68.03,81.85
>>点击 |cRXP_PICK_愈灵泉|r
.complete 29898,3 
step
#completewith next
>>击杀 |cRXP_ENEMY_凌·心拳之影|r
.complete 29900,1 
.mob shade of ling heartfist
step
.goto 371,66.43,80.01
>>点击 |cRXP_PICK_愈心泉|r
.complete 29898,4 
step
.goto 371,66.77,80.3
>>击杀 |cRXP_ENEMY_凌·心拳之影|r
.complete 29900,1 
.mob shade of ling heartfist
step
.goto 371,66.50,80.51
>>点击 |cRXP_PICK_悲伤卷轴|r
.complete 29900,2 
step
#completewith next
.goto 371,66.72,81.92,20,0
.goto 371,66.38,82.16,10 >>离开洞穴
step
#loop
.goto 371,65.99,82.12,30,0
.goto 371,65.78,82.97,30,0
.goto 371,65.15,81.93,30,0
.goto 371,65.71,81.28,30,0
>>击杀 |cRXP_ENEMY_受折磨的灵魂|r
.complete 29899,1 
.mob tortured spirit
step
.goto 371,65.98,79.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林娜·白爪|r和|cRXP_FRIENDLY_任·白爪|r交谈
.turnin 29898 >>交任务: |cRXP_FRIENDLY_圣水|r
.goto 371,65.99,79.4
.target +林娜·白爪
.turnin 29899 >>交任务: |cRXP_FRIENDLY_安息|r
.turnin 29900 >>交任务: |cRXP_FRIENDLY_安息|r
.accept 29901 >>接任务: |cRXP_WARN_安度因的决择|r
.goto 371,65.99,79.3
.target +任·白爪
step
.goto 371,65.91,79.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安杜因|r交谈
.complete 29901,1 
.target Anduin
.skipgossip
step
.goto 371,58.88,81.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 29901 >>交任务: |cRXP_FRIENDLY_安度因的决择|r
.target 海军上将泰勒
step
.goto 371,58.05,80.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长老卢山|r交谈
.accept 29922 >>接任务: |cRXP_WARN_寻求智慧|r
.target 长老卢山
step
.goto 371,57.95,82.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_风筝大师乌特南|r交谈
.complete 29922,1 
.target 风筝master Ut-Nam
step
.goto 371,47.14,46.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托娅|r交谈
.turnin 31230 >>交任务: |cRXP_FRIENDLY_欢迎来到晨芳园|r
.target 托亚
step
#include 7) 主线战役 翡翠林 中立
step
.goto 371,58.07,80.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 30498 >>交任务: |cRXP_FRIENDLY_快回来！|r
.target 海军上将泰勒
.accept 30568 >>接任务: |cRXP_WARN_略尽绵力|r
step
.goto 371,58.55,82.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.accept 30565 >>接任务: |cRXP_WARN_意外之喜|r
.target “腌菜”苏利·麦克莱利
step
#completewith next
.goto 371,54.81,79.76
.gossipoption 39488 >>与|cRXP_FRIENDLY_安玻·吉尔妮|r交谈
.target 安玻·吉尔妮
step
.goto 371,54.67,80.07
>>击杀 |cRXP_ENEMY_猢狲争斗者|r
.complete 30568,2 
.mob 猢狲争斗者
step
#completewith next
#loop
.goto 371,59.09,83.75,30,0
.goto 371,60.04,83.81,30,0
.goto 371,59.43,85.06,30,0
.goto 371,58.73,84.73,30,0
.goto 371,59.09,83.75,0
.goto 371,60.04,83.81,0
.goto 371,59.43,85.06,0
.goto 371,58.73,84.73,0
.gossipoption 39293 >>与|cRXP_FRIENDLY_珠鳍新兵|r交谈
.target 珠鳍新兵
step
>>击杀 |cRXP_ENEMY_珠鳍新兵|r
.complete 30568,1 
.mob 珠鳍新兵
step
#loop
.goto 371,59.97,86.51,30,0
.goto 371,59.06,86.94,30,0
.goto 371,59.71,88.47,30,0
.goto 371,60.53,88.23,30,0
.goto 371,61.05,87.74,30,0
.goto 371,61.09,86.98,30,0
.goto 371,59.97,86.51,0
.goto 371,59.06,86.94,0
.goto 371,59.71,88.47,0
.goto 371,60.53,88.23,0
.goto 371,61.05,87.74,0
.goto 371,61.09,86.98,0
>>与 |cRXP_FRIENDLY_受伤的珍珠鳍|r 互动
.complete 30568,3 
.target 受伤的珠鳍锦鱼人
step
#loop
.goto 371,61.64,76.69,40,0
.goto 371,65.14,79.72,40,0
.goto 371,61.64,76.69,0
.goto 371,65.14,79.72,0
>>击杀 |cRXP_ENEMY_吊尾伏击者|r, 拾取 |cRXP_LOOT_生锈螺栓|r 和 |cRXP_LOOT_受潮损齿轮|r
.complete 30565,2 
.complete 30565,1 
.mob 吊尾伏击者
step
.goto 371,58.08,80.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 30568 >>交任务: |cRXP_FRIENDLY_略尽绵力|r
.target 海军上将泰勒
step
.goto 371,58.56,82.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.turnin 30565 >>交任务: |cRXP_FRIENDLY_意外之喜|r
.target “腌菜”苏利·麦克莱利
step << Alliance
.goto 371,58.85,81.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.accept 31362 >>接任务: |cRXP_WARN_最后一块拼图|r
.target 游学者周卓
step
#include 7) 主线战役 翡翠林 中立 2
]]);
RXPGuides.RegisterGuide([[
#df
#version 3
#group RestedXP 熊猫人的诗篇
#name 9) 昆莱峰
#displayname 第 7 章 - 昆莱峰
#title Kun-Lai Summit
#next 9a) 塔隆米尔高地
step <<Monk
#include 1) 武僧任务
step
.goto 371,65.25,37.20,30,0
.cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
.itemcount 216712,1
.use 216712
step << Alliance
#completewith next
.goto 371,65.21,37.46,5,0
.goto 371,45.8,84.6,40 >>点击 |cRXP_PICK_传送门|r 返回
step << Alliance
.isOnQuest 80013
.goto 418,86.84,11.06,10 >>|cRXP_WARN_跟随箭头指引|r
step << Alliance
#completewith next
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step << Horde
.goto 371,65.25,37.20,30,0
.cast 437035 >>使用 |T134376:0|t[青铜时计] 传送至龙骑任务
.itemcount 216712,1
.use 216712
step << Horde
.goto 371,65.21,37.46,5,0
.goto 371,28.59,14.03,40 >>点击 |cRXP_PICK_传送门|r 返回
.itemcount 216712,1
step << Horde
#include 7) 昆莱山 掠夺者
step << Horde
#include 7) 昆莱峰 我的儿子
step << Alliance
.isQuestComplete 80446
.goto 393,75.04,45.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step << Alliance
.isQuestComplete 80447
.goto 393,76.55,48.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step << Alliance
#completewith The Lorewalkers
.goto 393,67.15,43.64,10,0
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step << Alliance
.goto 393,64.6,42.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step << Alliance
#label The Lorewalkers
.goto 390,85.50,60.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卷轴匠热希|r交谈, 地点在七星神龛下方
.accept 31367 >>接任务: |cRXP_WARN_游学者|r
.target 裱糊匠拉什
step << Alliance
.goto 390,84.96,60.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t骑乘时与|cRXP_FRIENDLY_米希|r交谈
.complete 31367,1 
.target 米师
step << Alliance
.goto 390,81.41,31.99,20 >>进入神庙
step << Alliance
.goto 390,83.28,29.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31367 >>交任务: |cRXP_FRIENDLY_游学者|r
.target 游学者周卓
step << Alliance
.goto 390,81.41,31.99,20 >>离开神庙
step
.goto 390,80.78,33.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_克罗米|r (安多哈尔)
.accept 33231 >>接任务: |cRXP_WARN_永恒岛之旅|r
.target 克罗米
step << Horde
.goto 379,72.27,91.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棘杖村长|r交谈
.accept 30457 >>接任务: |cRXP_WARN_引出他们的头儿|r
.target 棘杖村长
step << Horde
.goto 379,71.57,92.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陈药师|r交谈
.accept 30460 >>接任务: |cRXP_WARN_救死扶伤|r
.target 陈药师
step << Horde
.goto 379,70.75,90.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萧合指挥官|r交谈
.accept 30459 >>接任务: |cRXP_WARN_多多益善|r
.target 指挥官萧合
step << Alliance
.goto 379,71.57,92.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陈药师|r交谈
.accept 30460 >>接任务: |cRXP_WARN_救死扶伤|r
.target 陈药师
step << Alliance
.goto 379,72.27,91.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棘杖村长|r交谈
.accept 30457 >>接任务: |cRXP_WARN_引出他们的头儿|r
.target 棘杖村长
step << Alliance
.goto 379,70.75,90.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萧合指挥官|r交谈
.accept 30459 >>接任务: |cRXP_WARN_多多益善|r
.target 指挥官萧合
step
#completewith Injured Binan Warrior
#hidewindow
#loop
.goto 379,69.85,90.86,25,0
.goto 379,68.56,90.96,25,0
.goto 379,67.88,89.11,25,0
.goto 379,67.97,87.75,25,0
.goto 379,68.88,87.10,25,0
.goto 379,70.76,89.27,25,0
.goto 379,69.85,90.86,0
.goto 379,68.56,90.96,0
.goto 379,67.88,89.11,0
.goto 379,67.97,87.75,0
.goto 379,68.88,87.10,0
.goto 379,70.76,89.27,0
+1
step
#completewith Dit Da Jow
>>击杀 |cRXP_ENEMY_巴塔里部落成员|r 和 |cRXP_ENEMY_巴塔里火战士|r, |cRXP_WARN_后者在击杀 10 名部落成员后刷新|r
.complete 30457,1 
.complete 30457,2 
.mob 巴塔里烈焰召唤者
.mob bataari fire-warrior
.mob 巴塔里野牛人
step
#completewith Dit Da Jow
>>点击 |cRXP_PICK_箭矢|r
.complete 30459,1 
step
#label Dit Da Jow
>>对 |cRXP_FRIENDLY_受伤的滨岸战士|r 使用 |T132798:0|t[跌打酒]
*|cRXP_WARN_Priotize your own healing spells, if you have any.|r
.complete 30460,1 
.use 79819
.target 受伤的滨岸战士
step
#completewith next
>>对 |cRXP_FRIENDLY_受伤的滨岸战士|r 使用 |T132798:0|t[跌打酒]
*|cRXP_WARN_Priotize your own healing spells, if you have any.|r
.complete 30460,1 
.use 79819
.target 受伤的滨岸战士
step
>>点击 |cRXP_PICK_箭矢|r
.complete 30459,1 
step
#label Injured Binan Warrior
>>对 |cRXP_FRIENDLY_受伤的滨岸战士|r 使用 |T132798:0|t[跌打酒]
*|cRXP_WARN_Priotize your own healing spells, if you have any.|r
.complete 30460,1 
.use 79819
.target 受伤的滨岸战士
step
.goto 379,70.76,90.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萧合指挥官|r交谈
.turnin 30459 >>交任务: |cRXP_FRIENDLY_多多益善|r
.target 指挥官萧合
step
.goto 379,72.27,91.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棘杖村长|r交谈
.turnin 30457 >>交任务: |cRXP_FRIENDLY_引出他们的头儿|r
.target 棘杖村长
step
.goto 379,71.57,92.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陈药师|r交谈
.turnin 30460 >>交任务: |cRXP_FRIENDLY_救死扶伤|r
.target 陈药师
.accept 30508 >>接任务: |cRXP_WARN_海军上将泰勒醒了|r <<Alliance
.accept 30511 >>接任务: |cRXP_WARN_纳兹戈林将军苏醒了|r <<Horde
step << Alliance
.goto 379,71.48,93.18,5,0
.goto 379,71.53,93.08
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈, 他在楼上的房子里
.turnin 30508 >>交任务: |cRXP_FRIENDLY_海军上将泰勒醒了|r
.target 海军上将泰勒
.accept 30512 >>接任务: |cRXP_WARN_西风之息|r
step << Alliance
#include 7) 昆莱峰 我的儿子
step << Alliance
#include 7) 昆莱山 掠夺者
step << Horde
.goto 379,71.48,93.18,5,0
.goto 379,71.65,93.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 30511 >>交任务: |cRXP_FRIENDLY_纳兹戈林将军苏醒了|r
.accept 30513 >>接任务: |cRXP_WARN_东风之眠|r
.target 纳兹戈林将军
step << Alliance
.goto 379,58.87,80.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小波|r交谈
.complete 30512,1 
.skipgossip 63754,1
.target 雇农小波
step << Alliance
.goto 379,56.34,84.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_素兰长老|r交谈
.complete 30512,2 
.skipgossip 63542,1
.target 素兰长老
step <<Alliance
.goto 379,56.34,84.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_素兰长老|r交谈
.turnin 30512 >>交任务: |cRXP_FRIENDLY_西风之息|r
.target 素兰长老
.accept 30514 >>接任务: |cRXP_WARN_接受挑战|r
step << Horde
.goto 379,63.68,86.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小寇|r交谈
.complete 30513,1 
.target 雇农小寇
.skipgossip 63751,1
step << Horde
.goto 379,61.80,82.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.complete 30513,2 
.skipgossip 63535,1
.target 邵长老
step << Horde
.goto 379,61.19,82.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.turnin 30513 >>交任务: |cRXP_FRIENDLY_东风之眠|r
.accept 30515 >>接任务: |cRXP_WARN_接受挑战|r
.target 邵长老
step
#completewith next
.goto 379,58.19,84.11
.cast 8386 >>点击 |cRXP_PICK_旗帜|r 召唤 |cRXP_ENEMY_厄尔巴塔尔|r
step
.convertquest 30514,30515 <<Horde
.goto 379,58.20,84.35
>>击杀 |cRXP_ENEMY_厄尔巴塔尔|r
.complete 30514,1 
.mob ur-bataar
step << Alliance
.goto 379,54.69,84.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_素兰长老|r交谈
.turnin 30514 >>交任务: |cRXP_FRIENDLY_接受挑战|r
.target 素兰长老
step << Alliance
.goto 379,53.77,82.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.accept 30575 >>接任务: |cRXP_WARN_赶牛|r
.target 海军上将泰勒
step << Alliance
.goto 379,54.08,82.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_焦虑的凯|r交谈
.home >>将炉石设为西风之息
.target 焦虑的凯
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r和|cRXP_FRIENDLY_素兰长老|r交谈
.accept 30583 >>接任务: |cRXP_WARN_食物危机|r
.goto 379,54.15,83.30
.accept 30619 >>接任务: |cRXP_WARN_魔古族？！哦，不！|r
.goto 379,54.18,83.43
.target 素兰长老
.target “腌菜”苏利·麦克莱利
step << Alliance
.goto 379,53.78,84.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小波|r交谈
.accept 30569 >>接任务: |cRXP_WARN_农场的麻烦|r
.target 雇农小波
step <<Alliance
#loop
.goto 379,53.45,83.36,10,0
.goto 379,53.46,83.08,10,0
.goto 379,53.68,83.28,10,0
.goto 379,53.45,83.36,0
.goto 379,53.46,83.08,0
.goto 379,53.68,83.28,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r交谈
.accept 30593 >>接任务: |cRXP_WARN_复活的雕像|r
.target 米希卡
step << Horde
.goto 379,61.58,80.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.turnin 30515 >>交任务: |cRXP_FRIENDLY_接受挑战|r
.target 邵长老
step << Horde
.goto 379,63.00,80.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.accept 31256 >>接任务: |cRXP_WARN_赶牛|r
.target 纳兹戈林将军
step << Horde
.goto 379,54.08,82.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_打瞌睡的麦金|r交谈
.home >>将炉石设为东风之眠
.target 打瞌睡的麦金
step << Horde
.goto 379,62.70,80.71
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.accept 30594 >>接任务: |cRXP_WARN_复活的雕像|r
.target 匿踪大师琪麟
step << Horde
.goto 379,62.78,79.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.accept 31251 >>接任务: |cRXP_WARN_绝世美肉！|r
.target 利维特·急刹
step << Horde
.goto 379,62.53,79.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小寇|r交谈
.accept 30570 >>接任务: |cRXP_WARN_农场的麻烦|r
.target 雇农小寇
step << Horde
.goto 379,62.33,79.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.accept 30620 >>接任务: |cRXP_WARN_魔古族？！哦，不！|r
.target 邵长老
step
#completewith Profiting off of the Past
.convertquest 30575,31256 << Horde
.isOnQuest 30575,31256
+与 3 只 |cRXP_FRIENDLY_牦牛|r 互动让它们跟随.|cRXP_WARN_不用担心距离;|r |cFFFF0000绳子不会断.完成任务时此步骤不会自动完成|r
.target 被捕获的牦牛
.mob 野生平原牦牛
step
#completewith Profiting off of the Past
.convertquest 30583,31251 << Horde
>>击杀 |cRXP_ENEMY_昆莱野生动物|r, 拾取 |cRXP_LOOT_昆莱肉末|r
.complete 30583,1 
.mob 高原穆山幼崽
.mob 高原穆山兽
.mob 锐刺豪猪
.mob 山峰啄骨者
step
#label Profiting off of the Past
.goto 379,59.61,78.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宝剑|r交谈
.accept 30595 >>接任务: |cRXP_WARN_生财有道|r
.target 宝剑
step
#completewith Mogujia Soul-caller
.isOnQuest 30595
+看到 |cRXP_PICK_瓶子|r 就点击, 可获得急速和伤害增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step
.convertquest 30593,30594 << Horde
#loop
.goto 379,58.84,76.29,40,0
.goto 379,57.77,76.89,40,0
.goto 379,56.62,76.53,40,0
.goto 379,56.88,75.53,40,0
.goto 379,57.96,74.50,40,0
.goto 379,59.28,73.51,40,0
.goto 379,59.98,75.57,20,0
.goto 379,58.84,76.29,0
.goto 379,57.77,76.89,0
.goto 379,56.62,76.53,0
.goto 379,56.88,75.53,0
.goto 379,57.96,74.50,0
.goto 379,59.28,73.51,0
.goto 379,59.98,75.57,0
>>击杀 |cRXP_ENEMY_陶俑战士|r 和 |cRXP_ENEMY_陶俑卫士|r, 拾取 |cRXP_LOOT_魔古遗物|r. |cRXP_WARN_同时点击地面上的|r |cRXP_PICK_魔古遗物|r
.complete 30593,1 
.complete 30595,1 
.mob 陶俑卫士
.mob 陶俑战士
step
.convertquest 30619,30620 << Horde
.goto 379,58.13,70.92
>>击杀 |cRXP_ENEMY_魔古族灵魂召唤者|r
.complete 30619,1 
.mob mogujia soul-caller
step
#label Mogujia Soul-caller
.goto 379,59.60,78.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宝剑|r交谈
.turnin 30595 >>交任务: |cRXP_FRIENDLY_生财有道|r
.target 宝剑
step
#completewith next
>>击杀 |cRXP_ENEMY_昆莱野生动物|r, 拾取 |cRXP_LOOT_昆莱肉末|r
.complete 30583,1 
.mob 高原穆山幼崽
.mob 高原穆山兽
.mob 锐刺豪猪
.mob 山峰啄骨者
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫老周|r和|cRXP_FRIENDLY_周育温|r交谈
.turnin 30569 >>交任务: |cRXP_FRIENDLY_农场的麻烦|r << Alliance
.turnin 30570 >>交任务: |cRXP_FRIENDLY_农场的麻烦|r << Horde
.accept 30571 >>接任务: |cRXP_WARN_解救雇农|r
.goto 379,60.25,85.81
.accept 30581 >>接任务: |cRXP_WARN_……锅呢？|r
.goto 379,60.17,85.93
.target 周育温
.target 农夫老周
step
#completewith Back to Westwind Rest
.isOnQuest 30571
+看到 |cRXP_PICK_瓶子|r 就点击, 可获得急速和伤害增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step
#completewith Farmstead Slaves
#hidewindow
#loop
.goto 379,60.88,86.97,40,0
.goto 379,61.29,86.14,40,0
.goto 379,61.92,87.15,40,0
.goto 379,61.87,87.85,40,0
.goto 379,61.31,87.85,40,0
.goto 379,61.41,88.37,40,0
.goto 379,60.79,88.00,40,0
.goto 379,60.50,87.52,40,0
.goto 379,58.87,88.61,40,0
.goto 379,58.38,88.40,40,0
.goto 379,58.31,89.41,40,0
.goto 379,58.33,90.11,40,0
.goto 379,58.85,90.11,40,0
.goto 379,58.95,89.78,40,0
.goto 379,60.88,86.97,0
.goto 379,61.29,86.14,0
.goto 379,61.92,87.15,0
.goto 379,61.87,87.85,0
.goto 379,61.31,87.85,0
.goto 379,61.41,88.37,0
.goto 379,60.79,88.00,0
.goto 379,60.50,87.52,0
.goto 379,58.87,88.61,0
.goto 379,58.38,88.40,0
.goto 379,58.31,89.41,0
.goto 379,58.33,90.11,0
.goto 379,58.85,90.11,0
.goto 379,58.95,89.78,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_斡耳朵督工|r 解救 |cRXP_FRIENDLY_农场庄园奴隶|r
.complete 30571,1 
.mob 斡耳朵劫掠者
.mob 斡耳朵督工
step
>>击杀 |cRXP_ENEMY_狡猾的维尔曼|r, 拾取大量 |cRXP_LOOT_根茎蔬菜|r. |cRXP_WARN_同时点击地面上的|r |cRXP_PICK_根茎蔬菜|r
.complete 30581,1 
.mob 卑鄙的瓦尔蒙
step
#label Farmstead Slaves
>>击杀 |cRXP_ENEMY_斡耳朵督工|r 解救 |cRXP_FRIENDLY_农场庄园奴隶|r
.complete 30571,1 
.mob 斡耳朵劫掠者
.mob 斡耳朵督工
step
.goto 379,60.02,88.45
>>点击 |cRXP_PICK_块茎蔬菜|r |cRXP_WARN_在小屋内|r
.complete 30581,2 
.mob 大厨麦当牛
step
#label Back to Westwind Rest
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_周育温|r和|cRXP_FRIENDLY_农夫老周|r交谈
.turnin 30581 >>交任务: |cRXP_FRIENDLY_……锅呢？|r
.goto 379,60.17,85.92
.turnin 30571 >>交任务: |cRXP_FRIENDLY_解救雇农|r
.accept 31252 >>接任务: |cRXP_WARN_返回西风之息|r << Alliance
.accept 31253 >>接任务: |cRXP_WARN_返回东风之眠|r << Horde
.goto 379,60.24,85.8
.target 周育温
.target 农夫老周
step << Alliance
#completewith WildPlaneYakC
#hidewindow
#loop
.goto 379,55.21,86.24,40,0
.goto 379,53.95,88.55,40,0
.goto 379,53.73,90.23,40,0
.goto 379,51.77,88.90,40,0
.goto 379,50.04,88.73,40,0
.goto 379,50.07,85.97,40,0
.goto 379,50.01,84.46,40,0
.goto 379,51.98,81.15,40,0
.goto 379,54.55,79.55,40,0
.goto 379,55.21,86.24,0
.goto 379,53.95,88.55,0
.goto 379,53.73,90.23,0
.goto 379,51.77,88.90,0
.goto 379,50.04,88.73,0
.goto 379,50.07,85.97,0
.goto 379,50.01,84.46,0
.goto 379,51.98,81.15,0
.goto 379,54.55,79.55,0
+1
step << Horde
#completewith WildPlaneYakC
#hidewindow
#loop
.goto 379,63.51,84.80,40,0
.goto 379,65.95,85.31,40,0
.goto 379,67.45,80.68,40,0
.goto 379,66.52,77.04,40,0
.goto 379,64.40,78.05,40,0
.goto 379,63.51,84.80,0
.goto 379,65.95,85.31,0
.goto 379,67.45,80.68,0
.goto 379,66.52,77.04,0
.goto 379,64.40,78.05,0
+1
step
#completewith next
+与 3 只 |cRXP_FRIENDLY_牦牛|r 互动
*|cFFFF0000If you already have 3 yaks following you ignore this step.|r
.target 被捕获的牦牛
.mob 野生平原牦牛
step
#label Kun-Lai Meaty Bits
>>击杀 |cRXP_ENEMY_昆莱野生动物|r, 拾取 |cRXP_LOOT_昆莱肉块|r
.complete 30583,1 
.mob 高原穆山幼崽
.mob 高原穆山兽
.mob 锐刺豪猪
.mob 山峰啄骨者
step
#completewith Yaksroundedup
#label WildPlaneYakA
*|cRXP_WARN_If you already have 3 yaks following you ignore this step.|r
.aura 114661,1+ >>点击 |cRXP_FRIENDLY_野生平原牦牛|r
.target 被捕获的牦牛
.mob 野生平原牦牛
step
#requires WildPlaneYakA
#completewith Yaksroundedup
#label WildPlaneYakB
*|cRXP_WARN_If you already have 3 yaks following you ignore this step.|r
.cast 114653 >>点击 |cRXP_FRIENDLY_野生平原牦牛|r
.target 被捕获的牦牛
.mob 野生平原牦牛
step
#requires WildPlaneYakB
#completewith Yaksroundedup
#label WildPlaneYakC
*|cRXP_WARN_If you already have 3 yaks following you ignore this step.|r
.cast 114653 >>点击 |cRXP_FRIENDLY_野生平原牦牛|r
.target 被捕获的牦牛
.mob 野生平原牦牛
step
#label Yaksroundedup
.goto 379,54.08,83.57 << Alliance
.goto 379,62.48,80.14 << Horde
>>|cRXP_WARN_捕获 3 只 |cRXP_FRIENDLY_牦牛|r 后跟随箭头指示前进|r
.complete 30575,1 
step << Alliance
#completewith Mishka
.isOnQuest 30593
+看到 |cRXP_PICK_瓶子|r 就点击, 可获得急速和伤害增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step << Alliance
.goto 379,53.79,84.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小波|r交谈
.turnin 31252 >>交任务: |cRXP_FRIENDLY_返回西风之息|r
.target 雇农小波
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_素兰长老|r交谈, 以及与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.turnin 30619 >>交任务: |cRXP_FRIENDLY_魔古族？！哦，不！|r
.accept 30650 >>接任务: |cRXP_WARN_熊猫人囚徒|r
.goto 379,54.17,83.43
.turnin 30583 >>交任务: |cRXP_FRIENDLY_食物危机|r
.accept 30651 >>接任务: |cRXP_WARN_炸药桶的乐趣|r
.goto 379,54.17,83.28
.target “腌菜”苏利·麦克莱利
.target 素兰长老
step << Alliance
.goto 379,53.76,82.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈, 他在帐篷内
.turnin 30575 >>交任务: |cRXP_FRIENDLY_赶牛|r
.accept 30652 >>接任务: |cRXP_WARN_帐内导能|r
.target 海军上将泰勒
step << Alliance
.isOnQuest 30652
.goto 379,53.84,83.02,10 >>离开帐篷
step << Alliance
#label Mishka
#loop
.goto 379,53.45,83.36,10,0
.goto 379,53.46,83.08,10,0
.goto 379,53.68,83.28,10,0
.goto 379,53.45,83.36,0
.goto 379,53.46,83.08,0
.goto 379,53.68,83.28,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r交谈
.turnin 30593 >>交任务: |cRXP_FRIENDLY_复活的雕像|r
.target 米希卡
step << Horde
.goto 379,62.78,79.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 31251 >>交任务: |cRXP_FRIENDLY_绝世美肉！|r
.target 利维特·急刹
step << Horde
.goto 379,62.54,79.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雇农小寇|r交谈
.turnin 31253 >>交任务: |cRXP_FRIENDLY_返回东风之眠|r
.target 雇农小寇
step << Horde
.goto 379,62.34,79.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.turnin 30620 >>交任务: |cRXP_FRIENDLY_魔古族？！哦，不！|r
.accept 30655 >>接任务: |cRXP_WARN_熊猫人囚徒|r
.target 邵长老
step << Horde
.goto 379,62.73,79.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.accept 30656 >>接任务: |cRXP_WARN_炸药桶的乐趣|r
.target 利维特·急刹
step << Horde
.goto 379,63.00,80.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 31256 >>交任务: |cRXP_FRIENDLY_赶牛|r
.target 纳兹戈林将军
.accept 30657 >>接任务: |cRXP_WARN_帐内导能|r
step << Horde
.goto 379,62.69,80.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.turnin 30594 >>交任务: |cRXP_FRIENDLY_复活的雕像|r
.target 匿踪大师琪麟
step
.convertquest 30652,30657 << Horde
.convertquest 30650,30655 << Horde
.convertquest 30651,30656 << Horde
.convertquest 30660,30661
#completewith Akonu the Embercaller
>>点击 |cRXP_FRIENDLY_熊猫人囚徒|r
.complete 30650,1 
.target 熊猫人囚徒
step
#sticky
#label EasternOilRigDestroyed
.goto 379,50.97,79.53
.use 80528
.cast 115550 >>在 |cRXP_WARN_钻机旁使用|r |T252176:0|t[炸药桶]
.timer 5,Explosion
.disablecheckbox
.complete 30651,1 
step
#title Pick up |T252176:0|t[|cRXP_PICK_Explosives Barrel|r]
#completewith EasternOilRigDestroyed
.goto 379,51.24,79.29,10,0
.goto 379,51,79.37
.collect 80528,1 >>拾取 |T252176:0|t[|cRXP_PICK_炸药桶|r]
step
#requires EasternOilRigDestroyed
.goto 379,50.4,78.66
>>击杀 |cRXP_ENEMY_炽炎使穆萨安|r
.complete 30652,1 
.mob musaan the blazecaster
step
.goto 379,50.38,79.28
.achievement 6847,1 >>点击 |cRXP_PICK_卷轴|r
step
.goto 379,49.44,78.49
>>击杀 |cRXP_ENEMY_火语者哈拉拉|r
.complete 30652,3 
.mob harala the firespeaker
step
#sticky
#label SouthernOilRigDestroyed
.goto 379,49.57,81.04
.use 80528
.cast 115550 >>在 |cRXP_WARN_钻机旁使用|r |T252176:0|t[炸药桶]
.timer 5,Explosion
.disablecheckbox
.complete 30651,2 
step
#title Pick up |T252176:0|t[|cRXP_PICK_Explosives Barrel|r]
#completewith SouthernOilRigDestroyed
.goto 379,49.59,78.92,20,0
.goto 379,49.57,81.04
.collect 80528,1 >>拾取 |T252176:0|t[|cRXP_PICK_炸药桶|r]
step
#requires SouthernOilRigDestroyed
.goto 379,49.35,81.06,20,0
.goto 379,49.17,80.38
>>击杀 |cRXP_ENEMY_炮坤火术士|r
.complete 30652,4 
.mob pao-kun the pyromancer
step
.goto 379,47.70,80.05
>>击杀 |cRXP_ENEMY_唤烬者阿寇奴|r
.complete 30652,2 
.mob akonu the embercaller
step
.goto 379,48.9,76.89
>>点击任务日志提交任务
.turnin 30652 >>交任务: |cRXP_FRIENDLY_帐内导能|r
step
#sticky
#label WesternOilRigDestroyed
.goto 379,47.86,81.42
.use 80528
.cast 115550 >>在 |cRXP_WARN_钻机旁使用|r |T252176:0|t[炸药桶]
.timer 5,Explosion
.disablecheckbox
.complete 30651,3 
step
#title Pick up |T252176:0|t[|cRXP_PICK_Explosives Barrel|r]
#completewith WesternOilRigDestroyed
.goto 379,47.53,80.18,15,0
.goto 379,47.86,81.42
.collect 80528,1 >>拾取 |T252176:0|t[|cRXP_PICK_炸药桶|r]
step
#requires WesternOilRigDestroyed
#completewith Ordo Warbringer
>>与 |cRXP_FRIENDLY_熊猫人囚徒|r 互动
.complete 30650,1 
.target 熊猫人囚徒
step
#requires WesternOilRigDestroyed
#sticky
#label Ordo Warbringer
.goto 379,48.37,76.70
>>击杀洞穴中的 |cRXP_ENEMY_斡耳朵战争使者|r |cRXP_WARN_|r
.complete 30660,1 
.mob ordo warbringer
step
#requires WesternOilRigDestroyed
#completewith Ordo Warbringer
.goto 379,48.9,76.89,10 >>进入洞穴
step
#requires Ordo Warbringer
#loop
.goto 379,49.60,78.64,40,0
.goto 379,51.11,79.30,40,0
.goto 379,51.59,79.85,40,0
.goto 379,49.41,80.91,40,0
.goto 379,47.71,80.24,40,0
.goto 379,49.60,78.64,0
.goto 379,51.11,79.30,0
.goto 379,51.59,79.85,0
.goto 379,49.41,80.91,0
.goto 379,47.71,80.24,0
>>与 |cRXP_FRIENDLY_熊猫人囚徒|r 互动
.complete 30650,1 
.target 熊猫人囚徒
step
#include 7) 昆莱山 防御影踪派
step << Alliance
.isOnQuest 33231
.cast 147988 >>使用 |T134376:0|t[好奇的青铜计时器] 传送到永恒岛
step << Alliance
.goto 554,23.15,71.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_观察者劳拉|r 交谈
.turnin 33231 >>交任务: |cRXP_FRIENDLY_永恒岛之旅|r
.target 观察者劳拉
step << Alliance
.goto 379,54.08,82.87
.hs >>使用炉石传送到西风之息
step << Alliance
#loop
.goto 379,54.02,83.39,10,0
.goto 379,53.91,83.57,10,0
.goto 379,53.85,83.35,10,0
.goto 379,53.66,83.45,10,0
.goto 379,53.76,83.68,10,0
.goto 379,54.05,83.43,10,0
.goto 379,54.33,82.97,10,0
.goto 379,54.31,82.76,10,0
.goto 379,54.02,83.39,0
.goto 379,53.91,83.57,0
.goto 379,53.85,83.35,0
.goto 379,53.66,83.45,0
.goto 379,53.76,83.68,0
.goto 379,54.05,83.43,0
.goto 379,54.33,82.97,0
.goto 379,54.31,82.76,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将泰勒|r交谈
.turnin 30650 >>交任务: |cRXP_FRIENDLY_熊猫人囚徒|r
.turnin 30660 >>交任务: |cRXP_FRIENDLY_斡耳朵战争使者|r 
.target 海军上将泰勒
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"腌菜"苏利·麦克莱利|r交谈
.turnin 30651 >>交任务: |cRXP_FRIENDLY_炸药桶的乐趣|r
.goto 379,54.17,83.27
.target “腌菜”苏利·麦克莱利
step << Alliance
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_素兰长老|r交谈
.accept 31695 >>接任务: |cRXP_WARN_城墙之外|r
.goto 379,54.17,83.43
.target 素兰长老
step << Alliance
#loop
.goto 379,53.45,83.36,10,0
.goto 379,53.46,83.08,10,0
.goto 379,53.68,83.28,10,0
.goto 379,53.45,83.36,0
.goto 379,53.46,83.08,0
.goto 379,53.68,83.28,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米希卡|r交谈
.accept 31460 >>接任务: |cRXP_WARN_周卓的书信|r
.target 米希卡
step << Horde
#completewith next
.goto 379,54.08,82.87
.hs >>使用炉石传送到东风之眠
step << Horde
.goto 379,62.45,80.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹戈林将军|r交谈
.turnin 30661 >>交任务: |cRXP_FRIENDLY_斡耳朵战争使者|r
.target 纳兹戈林将军
.turnin 30655 >>交任务: |cRXP_FRIENDLY_熊猫人囚徒|r
step << Horde
.goto 379,62.77,79.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利维特·急刹|r交谈
.turnin 30656 >>交任务: |cRXP_FRIENDLY_炸药桶的乐趣|r
.target 利维特·急刹
step << Horde
.goto 379,62.69,80.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪大师琪麟|r交谈
.accept 31459 >>接任务: |cRXP_WARN_周卓的书信|r
.target 匿踪大师琪麟
step << Horde
.goto 379,62.35,79.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵长老|r交谈
.accept 31695 >>接任务: |cRXP_WARN_城墙之外|r
.target 邵长老
step
.goto 379,44.48,89.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影踪派翀大师|r交谈
.accept 30699 >>接任务: |cRXP_WARN_前往冬花营|r
.target 影踪派翀大师
step
#sticky
#label Grummle's Luck
.goto 379,64.71,61.76,0,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运八铜钱|r交谈
.turnin 30808 >>交任务: |cRXP_FRIENDLY_土地精的好运|r
.target 好运的八铜钱
step
#completewith Grummle's Luck
#label NostwinsVoucher
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step
#completewith Grummle's Luck
#requires NostwinsVoucher
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺斯温|r或|cRXP_FRIENDLY_过去的诺斯温|r交谈
.buy 217930,1
.goto 379,69.62,53.04
.itemcount 217930,0
.target Nostwin
.target Past Nostwin
step
#requires NostwinsVoucher
.isQuestComplete 80446
.goto 379,69.54,53.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step
#requires NostwinsVoucher
.isQuestComplete 80447
.goto 379,69.76,53.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step
#requires NostwinsVoucher
.isQuestComplete 80448
.goto 379,69.84,53.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step
#label UpdradeGearKunlai
#completewith Grummle's Luck
.goto 379,69.58,52.47
.cast 436451 >>与|cRXP_FRIENDLY_莫缇默斯|r交谈并升级你的装备,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
*|cRXP_WARN_Skip this step if you don't want to or can't upgrade anything|r
.skipgossip
.target 莫门图斯
step
#requires UpdradeGearKunlai
#completewith Grummle's Luck
#label GemsKunlai
.goto 379,69.34,52.59
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step
#requires Grummle's Luck
.goto 379,65.48,60.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黏滑墨迹|r交谈
.turnin 30614 >>交任务: |cRXP_FRIENDLY_采油站|r
.target 黏滑的墨水渍
step
.goto 379,64.89,60.5
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烟熏煤须|r交谈
.turnin 30616 >>交任务: |cRXP_FRIENDLY_交通问题|r
.accept 30617 >>接任务: |cRXP_WARN_道路救援|r
.target 冒烟的煤黑腚
step
#loop
.goto 379,62.91,62.03,20,0
.goto 379,62.85,63.05,20,0
.goto 379,62.79,63.80,20,0
.goto 379,62.95,64.57,20,0
.goto 379,62.44,64.45,20,0
.goto 379,62.04,64.90,20,0
.goto 379,61.73,65.37,20,0
.goto 379,61.18,65.59,20,0
.goto 379,60.37,66.00,20,0
.goto 379,59.96,65.27,20,0
.goto 379,59.33,65.10,20,0
.goto 379,58.91,64.33,20,0
.goto 379,59.00,63.81,20,0
.goto 379,58.73,63.09,20,0
.goto 379,58.81,62.48,20,0
.goto 379,58.34,62.13,20,0
.goto 379,58.35,61.63,20,0
.goto 379,62.91,62.03,0
.goto 379,62.85,63.05,0
.goto 379,62.79,63.80,0
.goto 379,62.95,64.57,0
.goto 379,62.44,64.45,0
.goto 379,62.04,64.90,0
.goto 379,61.73,65.37,0
.goto 379,61.18,65.59,0
.goto 379,60.37,66.00,0
.goto 379,59.96,65.27,0
.goto 379,59.33,65.10,0
.goto 379,58.91,64.33,0
.goto 379,59.00,63.81,0
.goto 379,58.73,63.09,0
.goto 379,58.81,62.48,0
.goto 379,58.34,62.13,0
.goto 379,58.35,61.63,0
>>点击 |cRXP_PICK_幸运粗麻熏香|r |cRXP_WARN_(可在骑乘时)|r
.complete 30617,1 
step
.goto 379,58.1,61.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_脚印心兄弟|r交谈
.turnin 30617 >>交任务: |cRXP_FRIENDLY_道路救援|r
.accept 30592 >>接任务: |cRXP_WARN_粗麻小径：前往粗麻驿站|r
.target 堂弟脚印心
step
.goto 379,57.34,61.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 31460 >>交任务: |cRXP_FRIENDLY_周卓的书信|r
.target 游学者周卓
.accept 30999 >>接任务: |cRXP_WARN_朝圣之旅|r
step
.goto 379,57.21,61.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苜蓿叶叔叔|r交谈
.turnin 30999 >>交任务: |cRXP_FRIENDLY_朝圣之旅|r
.target 表叔苜蓿叶
.accept 30601 >>接任务: |cRXP_WARN_一鼓作气|r
step
#completewith next
.goto 379,57.5,60.17 >>进入房屋
step
.goto 379,57.72,61.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵老大|r交谈, 他在小屋内
.accept 30618 >>接任务: |cRXP_WARN_恢复酒坛集的补给|r
.target 邵老大
step
.goto 379,57.37,60.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇游·雾爪|r交谈, 她在屋内
.home >>将炉石设为幸运旅者
.target 奇游·雾爪
step
.goto 379,57.33,60.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运旅行者季禄|r交谈, 他在屋内
.accept 30621 >>接任务: |cRXP_WARN_他们偷走了我的好运！|r
.target 幸运旅行者季禄
step
#completewith next
.goto 379,57.5,60.17,5 >>离开房屋
step
#completewith Stolen Sprite Treasure
>>击杀 |cRXP_ENEMY_淘气的雪妖|r 和 |cRXP_ENEMY_可疑的雪堆|r
.complete 30621,4 
.complete 30621,1 
.complete 30621,2 
.complete 30621,3 
.mob 淘气的雪妖
.mob 可疑的雪堆
step
#completewith Stolen Sprite Treasure
>>点击 |cRXP_PICK_失窃的补给品|r
.complete 30618,1 
step
#completewith Stolen Sprite Treasure
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_躲起来的向导|r交谈
.complete 30601,1 
.skipgossip
.target 躲起来的向导
step
#label Stolen Sprite Treasure
.goto 379,59.1,52.86,30,0
.goto 380,67.33,77.53,30,0
.goto 380,53.37,69.48,30,0
.goto 380,50.97,63.32,30,0
.goto 380,46.7,57.95,30,0
.goto 380,51.65,44.26,30,0
.goto 380,53.14,25.91,30,0
.goto 380,42.65,20.78,30,0
.goto 380,32.2,31.27,30,0
.goto 380,33.46,42.71,30,0
.goto 380,41.54,44.4,30,0
.cast 3365 >>交任务: |cRXP_FRIENDLY_旗帜——失窃的林精宝藏|r
step
#completewith Lucky
#hidewindow
#loop
.goto 380,33.53,41.3,30,0
.goto 380,36.82,29.36,30,0
.goto 380,42.6,24.98,30,0
.goto 380,53.88,45.19,30,0
.goto 380,66,49.91,30,0
.goto 380,48.42,58.72,30,0
.goto 380,58.72,75.11,30,0
.goto 380,67.86,78.37,30,0
.goto 379,59.1,53.18,30,0
.goto 380,33.53,41.3,0
.goto 380,36.82,29.36,0
.goto 380,42.6,24.98,0
.goto 380,53.88,45.19,0
.goto 380,66,49.91,0
.goto 380,48.42,58.72,0
.goto 380,58.72,75.11,0
.goto 380,67.86,78.37,0
.goto 379,59.1,53.18,0
+1
step
#completewith Hiding Guide
>>击杀 |cRXP_ENEMY_淘气的雪妖|r 和 |cRXP_ENEMY_可疑的雪堆|r, 拾取 |cRXP_LOOT_幸运的物品|r
.complete 30621,4 
.complete 30621,1 
.complete 30621,2 
.complete 30621,3 
.mob 淘气的雪妖
.mob 可疑的雪堆
step
#completewith Hiding Guide
>>点击 |cRXP_PICK_失窃的补给品|r
.complete 30618,1 
step
#label Hiding Guide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_躲起来的向导|r交谈
.complete 30601,1 
.skipgossip
.target 躲起来的向导
step
#completewith next
>>击杀 |cRXP_ENEMY_淘气的雪妖|r 和 |cRXP_ENEMY_可疑的雪堆|r, 拾取 |cRXP_LOOT_幸运的物品|r
.complete 30621,4 
.complete 30621,1 
.complete 30621,2 
.complete 30621,3 
.mob 淘气的雪妖
.mob 可疑的雪堆
step
>>点击 |cRXP_PICK_失窃的补给品|r
.complete 30618,1 
step
#label Lucky
>>击杀 |cRXP_ENEMY_淘气的雪妖|r 和 |cRXP_ENEMY_可疑的雪堆|r, 拾取 |cRXP_LOOT_幸运儿的物品|r
.complete 30621,4 
.complete 30621,1 
.complete 30621,2 
.complete 30621,3 
.mob 淘气的雪妖
.mob 可疑的雪堆
step
#completewith TheyStoleMyLuck
.aura -449510
.cast 449508 >>使用 |T134488:0|t[诺斯温的返程服务] 返回西风之息 << Alliance
.cast 449508 >>使用 |T134488:0|t[诺斯温的返程服务] 返回东风之眠 << Horde
.use 449508
step
#completewith TheyStoleMyLuck
.goto 379,57.5,60.17,5 >>进入房屋
step
#label TheyStoleMyLuck
.goto 379,57.32,60.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_幸运旅行者季禄|r(位于小屋内)
.turnin 30621 >>交任务: |cRXP_FRIENDLY_他们偷走了我的好运！|r
.target 幸运旅行者季禄
step
.goto 379,57.72,61.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵老大|r交谈
.turnin 30618 >>交任务: |cRXP_FRIENDLY_恢复酒坛集的补给|r
.target 邵老大
step
.goto 379,57.22,61.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苜蓿叶叔叔|r交谈
.turnin 30601 >>交任务: |cRXP_FRIENDLY_一鼓作气|r
.accept 30487 >>接任务: |cRXP_WARN_环山路|r
.target 表叔苜蓿叶
step
.goto 379,57.30,61.55
>>点击 |cRXP_FRIENDLY_吉路的货车|r
.complete 30487,1 
.timer 125,RP
.target 季禄的货车
step
.goto 379,48.13,48.92
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30487,2 
step
.goto 379,48.13,49.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运蓝麻绳|r交谈
.turnin 30487 >>交任务: |cRXP_FRIENDLY_环山路|r
.target 好运的蓝麻绳
.accept 30683 >>接任务: |cRXP_WARN_一位旅行者的不幸|r
step
.goto 379,50.07,49.25
>>点击 |cRXP_PICK_废弃的残骸|r
.complete 30683,1 
.timer 9,RP
step
.goto 379,50.07,49.37
>>击杀 |cRXP_ENEMY_石头守护者|r, 然后击杀 |cRXP_ENEMY_将军绍莲|r
.complete 30683,2 
.mob general sho lien
.mob 石头守护者
step
.goto 379,48.14,49.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幸运蓝麻绳|r交谈
.turnin 30683 >>交任务: |cRXP_FRIENDLY_一位旅行者的不幸|r
.target 好运的蓝麻绳
.accept 30684 >>接任务: |cRXP_WARN_探索者末路|r
step
.goto 379,44.78,49.17
>>点击 |cRXP_PICK_神殿|r
.complete 30684,1 
step
.goto 379,42.68,50.11
>>点击 |cRXP_PICK_神殿|r
.complete 30684,2 
step
.goto 379,43.17,51.98
>>点击 |cRXP_PICK_神殿|r
.complete 30684,3 
step
.goto 379,43.80,51.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30684 >>交任务: |cRXP_FRIENDLY_探索者末路|r
.accept 30829 >>接任务: |cRXP_WARN_巴匈之舌|r
.target 游学者周卓
step
#completewith Reclaimer Zuan
.goto 379,43.80,51.04
.gossipoption 40517 >>与|cRXP_FRIENDLY_游学者周卓|r交谈
.timer 20,RP
.skipgossip 61315,1
.target 游学者周卓
step
#completewith Reclaimer Zuan
+|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
step
#label Reclaimer Zuan
.goto 379,43.46,51.42
>>击杀 |cRXP_ENEMY_复兴者祖安|r
.complete 30829,1 
.mob 复兴者祖安
.mob 涯尺
step
.goto 379,43.77,51.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30829 >>交任务: |cRXP_FRIENDLY_巴匈之舌|r
.accept 30795 >>接任务: |cRXP_WARN_保持联系|r
.target 游学者周卓
step
.goto 379,57.11,47.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇怪的文字|r交谈
.accept 30797 >>接任务: |cRXP_WARN_功亏一篑|r
.target Curious Text
step
.goto 379,57.11,47.89
>>点击 |cRXP_PICK_撕下的书页|r
.complete 30797,1 
step
.goto 379,57.11,47.89
>>在书附近使用 |T512479:0|t[巴匈之舌]
.complete 30795,1 
.use 81712
step
.goto 379,57.11,47.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30795 >>交任务: |cRXP_FRIENDLY_保持联系|r
.accept 30796 >>接任务: |cRXP_WARN_尘埃落定|r
.turnin 30797 >>交任务: |cRXP_FRIENDLY_功亏一篑|r
.accept 30799 >>接任务: |cRXP_WARN_暗影古陵|r
.use 81712
.target 游学者周卓的影像
step
#loop
.goto 379,57.18,49.04,20,0
.goto 379,56.73,47.23,20,0
.goto 379,57.46,47.40,20,0
.goto 379,57.18,49.04,0
.goto 379,56.73,47.23,0
.goto 379,57.46,47.40,0
>>击杀 |cRXP_ENEMY_受折磨的鬼魂|r
.complete 30796,1 
.mob tormented spirits
step
#completewith next
.goto 379,55.88,46.21,10 >>进入神庙
step
.goto 379,57.07,45.03
>>点击 |cRXP_PICK_石板|r
.complete 30799,3 
step
.goto 379,57.13,43.49
>>点击雕像旁的 |cRXP_PICK_石板|r |cRXP_WARN_进行交互|r
.complete 30799,1 
step
.goto 379,56.36,43.45
>>点击杆子下方的 |cRXP_PICK_石板|r
.complete 30799,2 
step
#completewith next
.cast 118927 >>使用 |T512479:0|t[巴匈之舌] 召唤 |cRXP_FRIENDLY_游学者乔的幻象|r
step
.goto 379,55.88,46.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30796 >>交任务: |cRXP_FRIENDLY_尘埃落定|r
.turnin 30799 >>交任务: |cRXP_FRIENDLY_暗影古陵|r
.accept 30798 >>接任务: |cRXP_WARN_击破皇帝之盾|r
.target 游学者周卓的影像
.use 81712
step
#completewith InterruptedSpiritbinding
#label LeaveTempleSpiritbinding
.goto 379,55.88,46.21,10 >>离开神庙
step
#requires LeaveTempleSpiritbinding
#completewith InterruptedSpiritbinding
#label EnterTempleSpiritbinding
.goto 379,53.33,49.35,10 >>进入神庙
step
#completewith InterruptedSpiritbinding
#requires EnterTempleSpiritbinding
.goto 379,52.98,51.25,15 >>|cRXP_WARN_跟随箭头指引|r
step
#label InterruptedSpiritbinding
.goto 379,52.93,51.34
>>击杀 |cRXP_ENEMY_皇家守卫|r 和 |cRXP_ENEMY_纳克拉卡斯|r
.complete 30798,1 
.mob 皇家守卫
.mob 纳卡莱卡斯
step
#completewith next
.cast 118927 >>使用 |T512479:0|t[巴匈之舌] 召唤 |cRXP_FRIENDLY_游学者乔的幻象|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30798 >>交任务: |cRXP_FRIENDLY_击破皇帝之盾|r
.accept 30800 >>接任务: |cRXP_WARN_窃取他们的雷电之王|r
.target 游学者周卓的影像
.use 81712
step
#completewith BottomFragment
#label LeaveTempleBottomFragment
.goto 379,53.33,49.35,10 >>离开神庙
step
#completewith BottomFragment
#requires LeaveTempleBottomFragment
.goto 379,53.07,46.44,10 >>进入神庙
step
#label BottomFragment
.goto 385,84.12,61.59,10,0
.goto 385,81.57,74.06,10,0
.goto 385,58.66,72.54
>>点击 |cRXP_PICK_皇帝的宝箱|r
.complete 30800,1 
step
.goto 385,39.71,69.08,10,0
.goto 385,34.33,61.67
>>点击墙上的 |cRXP_PICK_石板|r
.complete 30800,2 
.mob 陶俑角斗士
step
#completewith next
.cast 118927 >>使用 |T512479:0|t[巴匈之舌] 召唤 |cRXP_FRIENDLY_游学者乔的幻象|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30800 >>交任务: |cRXP_FRIENDLY_窃取他们的雷电之王|r
.accept 30801 >>接任务: |cRXP_WARN_历史的教训|r
.target 游学者周卓的影像
.use 81712
step
.goto 385,34.33,61.67
>>点击墙上的 |cRXP_PICK_石板|r
.complete 30801,1 
step
#completewith next
.cast 118927 >>使用 |T512479:0|t[巴匈之舌] 召唤 |cRXP_FRIENDLY_游学者乔的幻象|r
step
.goto 385,33.44,62.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30801 >>交任务: |cRXP_FRIENDLY_历史的教训|r
.accept 30802 >>接任务: |cRXP_WARN_追逐风暴|r
.target 游学者周卓的影像
.use 81712
step
#loop
.goto 385,53.79,72.07,20,0
.goto 385,58.69,85.70,20,0
.goto 385,66.66,74.20,20,0
.goto 385,61.77,59.20,20,0
.goto 385,81.60,75.95,20,0
.goto 385,53.79,72.07,0
.goto 385,58.69,85.70,0
.goto 385,66.66,74.20,0
.goto 385,61.77,59.20,0
.goto 385,81.60,75.95,0
>>击杀 |cRXP_ENEMY_赞达拉战士|r, 拾取 |cRXP_LOOT_血迹揭示地图|r
.complete 30802,1 
.mob 赞达拉战士
step
#completewith next
.cast 118927 >>使用 |T512479:0|t[巴匈之舌] 召唤 |cRXP_FRIENDLY_游学者乔的幻象|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓的影像|r交谈
>>|cRXP_WARN_若看不到|r |cRXP_FRIENDLY_游学者周卓的影像|r, |cRXP_WARN_使用|r |T512479:0|t[巴匈之舌]
.turnin 30802 >>交任务: |cRXP_FRIENDLY_追逐风暴|r
.accept 30935 >>接任务: |cRXP_WARN_渔夫的故事|r
.target 游学者周卓的影像
.use 81712
step
#completewith next
.goto 385,82.66,75.15,15,0
.goto 385,83.41,64.77,15,0
.goto 379,52.99,46.57,10 >>离开神庙
step
#sticky
#label SpeaktoMishiLeiShensTomb
.goto 379,52.97,46.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_米师|r
.complete 30935,1 
.skipgossip
.target 米师
step
#completewith SpeaktoMishiLeiShensTomb
.goto 379,52.97,46.39
.logout >>|cRXP_WARN_站在路径点位置|r
*>>|cRXP_WARN_按下 Escape 并选择退出登录.|r |cFFFF0000这是为了跳过剧情|r
step
#requires SpeaktoMishiLeiShensTomb
.cast 441154 >>使用 |T134491:0|t[诺斯特温的凭证] 传送至无限集市
.use 217930
.itemcount 217930,1
step
.isQuestComplete 80446
.goto 379,69.54,53.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿图罗斯|r交谈
.turnin 80446 >>交任务: |cRXP_FRIENDLY_寻求组队|r
.target Arturos
step
.isQuestComplete 80447
.goto 379,69.76,53.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_毕塔戈罗斯|r交谈
.turnin 80447 >>交任务: |cRXP_FRIENDLY_寻求团队|r
.target 匹兹agorus
step
.isQuestComplete 80448
.goto 379,69.84,53.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉拉·曲木者|r交谈
.turnin 80448 >>交任务: |cRXP_FRIENDLY_新鲜场景|r
.target 劳拉h Treebender
step
.isOnQuest 30935
.goto 379,69.34,52.59,10,0
.vendor >>与|cRXP_FRIENDLY_利达莫鲁图|r交谈并购买额外宝石,|cRXP_WARN_这对更快升级有帮助,但会消耗青铜,一种外观货币|r
.skipgossip
.target Lidamorrutu
step
.isOnQuest 30935
#label access Zouchin Province
.goto 379,63.32,40.23
.logout >>|cRXP_WARN_站在路径点位置|r
*>>|cRXP_WARN_按下 Escape 并选择退出登录.|r |cFFFF0000这是为了跳过剧情|r
.timer 15,Speak Timer
step
.goto 379,63.32,40.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t当主窗口底部的说话计时器结束后,与|cRXP_FRIENDLY_辛·耳语云|r交谈
.complete 30935,2 
.skipgossip
.target 信·语云
step
#requires SpeakShinWhispercloudZouchinProvince
.goto 379,62.32,29.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 他在房子里
.turnin 30935 >>交任务: |cRXP_FRIENDLY_渔夫的故事|r
.accept 30944 >>接任务: |cRXP_WARN_全村出动|r
.target 游学者周卓
step
#completewith next
.goto 379,62.39,29.27,5 >>离开房屋
step
.goto 379,63.37,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_折钢者杜术|r交谈
.accept 30945 >>接任务: |cRXP_WARN_你的就是我的|r
.target 折钢者杜术
step
.goto 379,63.74,30.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_朔弥|r 交谈.|cRXP_WARN_在屋外和屋子下面|r
.accept 30942 >>接任务: |cRXP_WARN_传授武功|r
.target 朔弥
step
#completewith 阿曼尼散兵
#label ExhaustedDefenderRelieved
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_筋疲力尽的防御者|r交谈
.complete 30944,1 
.skipgossip
.target 筋疲力尽的防御者
step
#completewith 阿曼尼散兵
>>击杀 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.mob amani skirmishers
step
#label 阿曼尼散兵
#completewith ExhaustedDefenderRelieved
#hidewindow
.isOnQuest 30942
.goto 379,63.63,31.79,40,0
.goto 379,64.56,29.79,30 >>1
step
#requires 阿曼尼散兵
.goto 379,63.17,29.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李海|r交谈
.accept 30816 >>接任务: |cRXP_WARN_取得联络|r
.target 李海
step
#loop
.goto 379,63.33,28.75,10,0
.goto 379,63.58,28.73,10,0
.goto 379,63.23,28.65,10,0
.goto 379,63.47,28.81,10,0
.goto 379,63.33,28.75,0
.goto 379,63.58,28.73,0
.goto 379,63.23,28.65,0
.goto 379,63.47,28.81,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_舒长老|r交谈
.accept 30943 >>接任务: |cRXP_WARN_小心运送|r
.target 朱长老
step
#completewith Exhausted Defender Relieved
#hidewindow
#loop
.goto 379,63.50,28.22,40,0
.goto 379,61.90,28.16,40,0
.goto 379,63.93,31.50,40,0
.goto 379,64.59,29.73,40,0
.goto 379,64.05,28.68,40,0
.goto 379,63.50,28.22,0
.goto 379,61.90,28.16,0
.goto 379,63.93,31.50,0
.goto 379,64.59,29.73,0
.goto 379,64.05,28.68,0
+1
step
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_筋疲力尽的防御者|r交谈
.complete 30944,1 
.skipgossip
.target 筋疲力尽的防御者
step
>>击杀 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.mob amani skirmishers
step
#label Exhausted Defender Relieved
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_筋疲力尽的防御者|r交谈
.complete 30944,1 
.skipgossip
.target 筋疲力尽的防御者
step
.goto 379,60.60,21.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_廖贤者|r交谈
.turnin 30816 >>交任务: |cRXP_FRIENDLY_取得联络|r
.accept 30794 >>接任务: |cRXP_WARN_紧急救护|r
.target 廖贤者
step
.isOnQuest 30794
#completewith next
>>点击小屋内的 |cRXP_PICK_珍宝箱|r << Hunter/Rogue/Warlock/Warrior/DeathKnight/DemonHunter/Mage
.goto 379,61.01,21.54
.collect 81177,1
step
.goto 379,60.61,21.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_廖贤者|r交谈
.complete 30794,1 
.timer 8,RP
.target 廖贤者
step
.goto 379,60.61,21.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_廖贤者|r交谈
.turnin 30794 >>交任务: |cRXP_FRIENDLY_紧急救护|r
.target 廖贤者
step
.goto 379,60.61,21.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_舒长老|r交谈
.accept 30805 >>接任务: |cRXP_WARN_制裁|r
.accept 30806 >>接任务: |cRXP_WARN_长寿香|r
.accept 30807 >>接任务: |cRXP_WARN_瀑布之祭|r
.target 朱长老
step
#completewith next
>>击杀 |cRXP_ENEMY_蔚蓝刺爬者|r, 拾取 |cRXP_LOOT_虹光蓝色蟹壳|r
.complete 30806,1 
.mob 碧蓝刺蟹
step
#loop
.goto 379,59.03,27.23,30,0
.goto 379,59.72,29.83,30,0
.goto 379,60.19,31.25,30,0
.goto 379,58.89,24.56,30,0
.goto 379,59.03,27.23,0
.goto 379,59.72,29.83,0
.goto 379,60.19,31.25,0
.goto 379,58.89,24.56,0
>>点击 |cRXP_PICK_水洗石|r
.complete 30807,1 
step
#completewith Captain Ripflesh
>>击杀 |cRXP_ENEMY_蔚蓝刺爬者|r, 拾取 |cRXP_LOOT_虹光蓝色蟹壳|r
.complete 30806,1 
.mob 碧蓝刺蟹
step
#completewith Captain Ripflesh
>>点击|cRXP_PICK_木桶|r,|cRXP_WARN_并额外搜刮|cRXP_ENEMY_我|r以获得更多|cRXP_LOOT_香料|r
.complete 30806,2 
step
#label Captain Ripflesh
.goto 379,62.11,23.51
>>击杀 |cRXP_ENEMY_队长撕肉|r 和 |cRXP_ENEMY_黑鬃追踪者|r
.complete 30805,1 
.complete 30805,2 
.disablecheckbox
.mob captain ripflesh
.mob 黑鬃追踪者
.mob 黑鬃歹徒
.mob 黑鬃抢劫者
step
#completewith Blackmane Mercenaries
#hidewindow
#loop
.goto 379,62.61,21.88,40,0
.goto 379,63.55,21.97,40,0
.goto 379,64.51,21.12,40,0
.goto 379,63.30,20.80,40,0
.goto 379,62.16,20.72,40,0
.goto 379,62.61,21.88,0
.goto 379,63.55,21.97,0
.goto 379,64.51,21.12,0
.goto 379,63.30,20.80,0
.goto 379,62.16,20.72,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_蔚蓝刺爬者|r, 拾取 |cRXP_LOOT_虹光蓝色蟹壳|r
.complete 30806,1 
.mob 碧蓝刺蟹
step
>>击杀 |cRXP_ENEMY_黑鬃雇佣兵|r, 拾取 |cRXP_LOOT_熊猫人香料|r. |cRXP_WARN_同时点击|r |cRXP_PICK_木桶|r
.complete 30805,2 
.complete 30806,2 
.mob 黑鬃追踪者
.mob 黑鬃歹徒
.mob 黑鬃抢劫者
step
#label Blackmane Mercenaries
>>击杀 |cRXP_ENEMY_蔚蓝刺爬者|r, 拾取 |cRXP_LOOT_虹光蓝色蟹壳|r
.complete 30806,1 
.mob 碧蓝刺蟹
step
.goto 379,60.61,21.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_廖贤者|r交谈
.turnin 30805 >>交任务: |cRXP_FRIENDLY_制裁|r
.turnin 30806 >>交任务: |cRXP_FRIENDLY_长寿香|r
.turnin 30807 >>交任务: |cRXP_FRIENDLY_瀑布之祭|r
.accept 30819 >>接任务: |cRXP_WARN_准备葬礼|r
.target 廖贤者
step
#completewith 达卡莱织霜者
#hidewindow
#loop
.goto 379,68.17,25.56,40,0
.goto 379,70.77,25.95,40,0
.goto 379,71.90,26.42,40,0
.goto 379,72.72,30.69,40,0
.goto 379,72.23,32.21,40,0
.goto 379,70.93,29.33,40,0
.goto 379,68.06,28.35,40,0
.goto 379,68.17,25.56,0
.goto 379,70.77,25.95,0
.goto 379,71.90,26.42,0
.goto 379,72.72,30.69,0
.goto 379,72.23,32.21,0
.goto 379,70.93,29.33,0
.goto 379,68.06,28.35,0
+1
step
#completewith Exhausted Defender
>>击杀 |cRXP_ENEMY_古拉巴什妖术师|r\|cRXP_ENEMY_达卡莱织霜者|r 和 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.mob +阿曼尼散兵s
.complete 30942,2 
.mob +古拉巴什妖术师
.complete 30942,3 
.mob +达卡莱织霜者s
step
#completewith Exhausted Defender
>>击杀 |cRXP_ENEMY_阿曼尼碎颅者|r, 拾取 |cRXP_LOOT_血染之刃|r
.complete 30945,1 
.mob 阿曼尼迅猛龙驭手
step
#completewith Exhausted Defender
>>点击 |cRXP_PICK_爆烈花|r
.complete 30943,1 
step
#label Exhausted Defender
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_筋疲力尽的防御者|r交谈
.complete 30944,1 
.skipgossip
.target 筋疲力尽的防御者
step
#completewith Volatile Blooms
>>击杀 |cRXP_ENEMY_古拉巴什妖术师|r\|cRXP_ENEMY_达卡莱织霜者|r 和 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.mob +阿曼尼散兵s
.complete 30942,2 
.mob +古拉巴什妖术师
.complete 30942,3 
.mob +达卡莱织霜者s
step
#completewith Volatile Blooms
>>击杀 |cRXP_ENEMY_阿曼尼碎颅者|r 和 |cRXP_ENEMY_驭豹者|r, 拾取 |cRXP_LOOT_染血之刃|r
.complete 30945,1 
.mob 阿曼尼碎颅者
.mob 阿曼尼迅猛龙驭手
step
#label Volatile Blooms
>>点击 |cRXP_PICK_爆烈花|r
.complete 30943,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_古拉巴什妖术师|r\|cRXP_ENEMY_达卡莱织霜者|r 和 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.complete 30942,2 
.complete 30942,3 
.mob drakkari frostweaver
.mob gurubashi hexxer
.mob amani skirmisher
step
>>击杀 |cRXP_ENEMY_阿曼尼碎颅者|r, 拾取 |cRXP_LOOT_血染之刃|r
.complete 30945,1 
.mob 阿曼尼碎颅者
.mob 阿曼尼迅猛龙驭手
step
#label 达卡莱织霜者
>>击杀 |cRXP_ENEMY_古拉巴什妖术师|r\|cRXP_ENEMY_达卡莱织霜者|r 和 |cRXP_ENEMY_阿曼尼散兵|r
.complete 30942,1 
.complete 30942,2 
.complete 30942,3 
.mob drakkari frostweaver
.mob gurubashi hexxer
.mob amani skirmisher
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_朔弥|r, 就在你旁边
.turnin 30942 >>交任务: |cRXP_FRIENDLY_传授武功|r
.target 朔弥
step
.goto 379,63.16,29.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李海|r交谈
.turnin 30819 >>交任务: |cRXP_FRIENDLY_准备葬礼|r
.target 李海
.accept 30820 >>接任务: |cRXP_WARN_葬礼|r
step
#loop
.goto 379,63.33,28.75,10,0
.goto 379,63.58,28.73,10,0
.goto 379,63.23,28.65,10,0
.goto 379,63.47,28.81,10,0
.goto 379,63.33,28.75,0
.goto 379,63.58,28.73,0
.goto 379,63.23,28.65,0
.goto 379,63.47,28.81,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_舒长老|r交谈
.turnin 30943 >>交任务: |cRXP_FRIENDLY_小心运送|r
.target 朱长老
step
.goto 379,66.95,33.33
>>点击 |cRXP_PICK_熏香|r
.complete 30820,1 
step
.goto 379,67.05,33.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_廖贤者|r交谈
.turnin 30820 >>交任务: |cRXP_FRIENDLY_葬礼|r
.target 廖贤者
step
.goto 379,63.37,30.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_折钢者杜术|r交谈
.turnin 30945 >>交任务: |cRXP_FRIENDLY_你的就是我的|r
.target 折钢者杜术
step
.goto 379,62.33,29.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 他在房子里
.turnin 30944 >>交任务: |cRXP_FRIENDLY_全村出动|r
.accept 31011 >>接任务: |cRXP_WARN_兵临城下|r
.target 游学者周卓
step
#completewith next
.goto 379,62.41,29.32,10 >>离开房屋
step
#completewith next
>>击杀 |cRXP_ENEMY_阿曼尼狂战士|r
.complete 31011,1 
.mob amani berserker
step
#loop
.goto 379,64.40,29.05,30,0
.goto 379,65.44,28.04,30,0
.goto 379,65.43,31.15,30,0
.goto 379,64.29,32.11,30,0
.goto 379,64.40,29.05,0
.goto 379,65.44,28.04,0
.goto 379,65.43,31.15,0
.goto 379,64.29,32.11,0
>>击杀 |cRXP_ENEMY_古拉巴什血骑士|r |cRXP_WARN_冲向路障的敌人|r
.complete 31011,3 
.mob gurubashi bloodrider
step
#completewith next
>>击杀 |cRXP_ENEMY_阿曼尼狂战士|r
.complete 31011,1 
.mob amani berserker
step
#loop
.goto 379,61.19,29.08,20,0
.goto 379,61.15,27.97,30,0
.goto 379,61.19,29.08,0
.goto 379,61.15,27.97,0
>>击杀 |cRXP_ENEMY_阿曼尼巨兽|r. |cRXP_WARN_它们在路障处时可使用爆炸桶摧毁|r
.complete 31011,2 
.mob amani behemoth
step
#loop
.goto 379,62.04,28.39,40,0
.goto 379,63.25,28.32,40,0
.goto 379,63.87,29.63,40,0
.goto 379,63.23,30.70,40,0
.goto 379,62.04,28.39,0
.goto 379,63.25,28.32,0
.goto 379,63.87,29.63,0
.goto 379,63.23,30.70,0
>>击杀 |cRXP_ENEMY_阿曼尼狂战士|r
.complete 31011,1 
.mob amani berserker
step
#completewith next
.goto 379,62.36,29.2,5 >>进入房屋
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈, 他在房子里
.turnin 31011 >>交任务: |cRXP_FRIENDLY_兵临城下|r
.accept 30946 >>接任务: |cRXP_WARN_揭开真相|r
.goto 379,62.33,29.06
.target 游学者周卓
step
.goto 379,62.59,28.90,5,0
.goto 379,62.46,29.05,5,0
.goto 379,62.48,28.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_赞达拉囚徒|r交谈, 地点在楼上
.complete 30946,1 
.skipgossip
step
.goto 379,62.32,29.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游学者周卓|r交谈
.turnin 30946 >>交任务: |cRXP_FRIENDLY_揭开真相|r
.target 游学者周卓
step
.isOnQuest 30592
.hs >>使用炉石传送到一桶
step
.goto 379,58.71,64.77,20,0
.goto 379,58.29,64.78,20,0
.goto 379,49.74,67.57,20,0
.goto 379,53.08,66.58
>>|cRXP_WARN_沿箭头前进, |r 保护并护送格鲁米人
.complete 30592,1 
.mob 肘锤杂猴
.mob 巫金掠夺者
.mob 断牙持矛者
.target 小径运货人
step
.goto 379,51.67,67.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_脚印心兄弟|r交谈
.turnin 30592 >>交任务: |cRXP_FRIENDLY_粗麻小径：前往粗麻驿站|r
.accept 30602 >>接任务: |cRXP_WARN_兔子脚|r
.target 堂弟脚印心
step
.goto 379,49.11,70.45
>>与 |cRXP_FRIENDLY_兔脚兄弟|r 互动
.complete 30602,1 
.target 堂弟兔子脚
step
.goto 379,49.10,70.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟兔子脚|r交谈
.accept 30603 >>接任务: |cRXP_WARN_断牙猢狲的破坏|r
.target 堂弟兔子脚
step
.goto 379,48.08,73.11
>>击杀山中的 |cRXP_ENEMY_墨墨|r, 拾取 |cRXP_LOOT_墨墨的幸运符|r
.complete 30603,1 
.mob 墨墨
step
#completewith next
.isQuestAvailable 30602
+如果有就点击|cRXP_PICK_莫莫的宝箱|r,|cRXP_WARN_如果它在那里的话|r
.goto 379,47.88,73.52
step
.goto 379,51.97,67.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟兔子脚|r交谈
.turnin 30602 >>交任务: |cRXP_FRIENDLY_兔子脚|r
.turnin 30603 >>交任务: |cRXP_FRIENDLY_断牙猢狲的破坏|r
.accept 30599 >>接任务: |cRXP_WARN_猴子神像|r
.accept 30600 >>接任务: |cRXP_WARN_一个也不能少|r
.accept 30604 >>接任务: |cRXP_WARN_铲除断牙猢狲|r
.target 堂弟兔子脚
step
#completewith Breaking Broketooth
.isOnQuest 30604
+看到 |cRXP_PICK_瓶子|r 或 |cRXP_PICK_Luckydo|r 就点击, 可获得强力增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
.target 幸运星
step
#completewith Ko Ko
>>击杀 |cRXP_ENEMY_断牙冲锋者|r 和 |cRXP_ENEMY_断牙投掷者|r
.complete 30604,1 
.complete 30604,2 
.mob 断牙冲锋者
.mob broketooth tosser
step
#completewith Ko Ko
>>与 |cRXP_FRIENDLY_死去的运货人|r 互动
.complete 30600,1 
.target 死去的运货人
step
.isOnQuest 30599
.goto 379,56.84,70.99
.cast 6478 >>击杀 |cRXP_ENEMY_塔克塔克|r, 然后点击 |cRXP_PICK_塔克塔克的祭坛匕首|r
.timer 5, RP
.mob 塔克塔克
step
#label Ko Ko
.goto 379,52.27,71.44
.isOnQuest 30599
.cast 6478 >>击杀 |cRXP_ENEMY_可可|r, 然后点击 |cRXP_PICK_可可的祭坛匕首|r
.complete 30599,2 
.mob Ko Ko
step
.isOnQuest 30599
.goto 379,52.86,71.43,10 >>进入洞穴
step
#completewith Dak Dak's Altar
>>击杀 |cRXP_ENEMY_断牙冲锋者|r 和 |cRXP_ENEMY_断牙投掷者|r
.complete 30604,1 
.complete 30604,2 
.mob 断牙冲锋者
.mob broketooth tosser
step
#completewith Dak Dak's Altar
>>与 |cRXP_FRIENDLY_死去的运货人|r 互动
.complete 30600,1 
.target 死去的运货人
step
#label Dak Dak's Altar
#loop
.goto 383,51.21,31.60,20,0
.goto 383,38.75,45.06,60,0
.goto 383,40.88,74.58,60,0
.goto 384,49.65,39.63,60,0
.goto 383,51.21,31.60,0
.goto 383,38.75,45.06,0
.goto 383,40.88,74.58,0
.goto 384,49.65,39.63,0
.cast 6478 >>击杀 |cRXP_ENEMY_达卡达卡|r, 然后点击 |cRXP_PICK_达卡达卡的祭坛匕首|r
.mob 达卡达卡
step
#completewith next
>>击杀 |cRXP_ENEMY_断牙冲锋者|r 和 |cRXP_ENEMY_断牙投掷者|r
.complete 30604,1 
.complete 30604,2 
.mob 断牙冲锋者
.mob broketooth tosser
step
#loop
.goto 384,30.32,43.00,22,0
.goto 384,18.82,65.84,22,0
.goto 384,30.03,76.33,22,0
.goto 384,34.85,62.95,22,0
.goto 384,32.50,45.56,22,0
.goto 384,66.18,59.02,22,0
.goto 384,82.00,54.17,22,0
.goto 384,77.71,67.89,22,0
.goto 384,67.96,74.52,22,0
.goto 384,61.43,66.89,22,0
.goto 384,66.54,58.53,22,0
.goto 384,41.07,45.53,22,0
.goto 384,49.74,58.73,22,0
.goto 384,30.32,43.00,0
.goto 384,18.82,65.84,0
.goto 384,30.03,76.33,0
.goto 384,34.85,62.95,0
.goto 384,32.50,45.56,0
.goto 384,66.18,59.02,0
.goto 384,82.00,54.17,0
.goto 384,77.71,67.89,0
.goto 384,67.96,74.52,0
.goto 384,61.43,66.89,0
.goto 384,66.54,58.53,0
.goto 384,41.07,45.53,0
.goto 384,49.74,58.73,0
>>与 |cRXP_FRIENDLY_死去的运货人|r 互动
.complete 30600,1 
.target 死去的运货人
step
#completewith next
>>击杀 |cRXP_ENEMY_断牙冲锋者|r 和 |cRXP_ENEMY_断牙投掷者|r
.complete 30604,1 
.complete 30604,2 
.mob 断牙冲锋者
.mob broketooth tosser
step
.isOnQuest 30599
.goto 379,52.86,71.43,10 >>离开洞穴
step
#loop
.goto 379,55.52,70.17,30,0
.goto 379,52.80,70.65,30,0
.goto 379,55.52,70.17,0
.goto 379,52.80,70.65,0
>>击杀 |cRXP_ENEMY_断牙冲锋者|r 和 |cRXP_ENEMY_断牙投掷者|r
.complete 30604,1 
.complete 30604,2 
.mob 断牙冲锋者
.mob broketooth tosser
step
#label Breaking Broketooth
.goto 379,51.97,67.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟兔子脚|r交谈
.turnin 30599 >>交任务: |cRXP_FRIENDLY_猴子神像|r
.turnin 30600 >>交任务: |cRXP_FRIENDLY_一个也不能少|r
.turnin 30604 >>交任务: |cRXP_FRIENDLY_铲除断牙猢狲|r
.accept 30605 >>接任务: |cRXP_WARN_好运牦牛鞋|r
.target 堂弟兔子脚
step
.isOnQuest 30605
.goto 379,50.53,64.2
.cast 115562 >>与 |cRXP_ENEMY_莫克莫克|r 互动
.timer 11,RP
.mob 莫克莫克
step
.goto 379,50.57,64.08
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30605,1 
step
.goto 379,50.56,64.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟牦牛鞋|r交谈
.turnin 30605 >>交任务: |cRXP_FRIENDLY_好运牦牛鞋|r
.accept 30606 >>接任务: |cRXP_WARN_重挫肘锤猢狲|r
.accept 30607 >>接任务: |cRXP_WARN_猢狲和钥匙|r
.accept 30608 >>接任务: |cRXP_WARN_打牙祭|r
.target 堂弟牦牛鞋
step
#completewith Silverback Hozen
.isOnQuest 30606
+看到 |cRXP_PICK_瓶子|r 或 |cRXP_PICK_Luckydo|r 就点击, 可获得强力增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step
#completewith Release Old Poot Poot
>>击杀 |cRXP_ENEMY_肘锤重击者|r 和 |cRXP_ENEMY_肘锤刺击者|r
.complete 30606,1 
.mob 肘锤重击者
.mob 肘锤掷矛者
step
.goto 379,50.96,62.73,15,0
.goto 379,50.94,61.97,15,0
.goto 379,50.29,62.45,15,0
.goto 379,51.04,64.09,15,0
.goto 379,51.61,63.23,15,0
>>点击 |cRXP_PICK_笼子|r 并摧毁 |cRXP_ENEMY_囚徒束绳|r 解救 |cRXP_FRIENDLY_被囚的土地精|r
.complete 30608,1 
.target 被囚的土地精
.mob 囚徒束绳
step
#completewith next
.goto 382,75.83,91.72,10 >>进入洞穴
step
.goto 382,76.35,77.58,10,0
.goto 382,74.8,58.31,10,0
.goto 382,48.4,70.72,10,0
.goto 382,36.22,52.47,10,0
.goto 382,32.32,30.96,10,0
.goto 382,42.73,26.19
>>击杀 |cRXP_ENEMY_邪恶的乔乔|r, 拾取 |cRXP_LOOT_雪怪枷锁钥匙|r
.complete 30607,1 
.mob 怪猴奇奥奇奥
step
#label Release Old Poot Poot
.goto 382,42.73,26.19
>>点击 |cRXP_PICK_老波波|r
.complete 30607,2 
.timer 25, Time until Cave Exit
.target 老波波
step
.isOnQuest 30607
.goto 379,50.72,62.5,25 >>|cRXP_WARN_在洞穴外时使用 |cFFFF0000/leavevehicle|r 宏命令从雪人上下来|r
.link /leavevehicle>>点击此处获取宏命令
*|cRXP_WARN_建议保存此宏以备后用|r
step
#loop
.goto 379,49.90,64.28,25,0
.goto 379,51.63,63.58,25,0
.goto 382,74.31,85.72,25,0
.goto 379,49.90,64.28,0
.goto 379,51.63,63.58,0
.goto 382,74.31,85.72,0
>>击杀 |cRXP_ENEMY_肘锤重击者|r 和 |cRXP_ENEMY_肘锤刺击者|r
.complete 30606,1 
.mob 肘锤重击者
.mob 肘锤掷矛者
step
#label Silverback Hozen
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟兔子脚|r和|cRXP_FRIENDLY_堂弟牦牛鞋|r交谈
.turnin 30607 >>交任务: |cRXP_FRIENDLY_猢狲和钥匙|r
.turnin 30608 >>交任务: |cRXP_FRIENDLY_打牙祭|r
.accept 30610 >>接任务: |cRXP_WARN_土地精！土地精！土地精！|r
.goto 379,52.02,67.18
.turnin 30606 >>交任务: |cRXP_FRIENDLY_重挫肘锤猢狲|r
.accept 30611 >>接任务: |cRXP_WARN_释放雪人！|r
.goto 379,51.98,67.22
.target 堂弟兔子脚
.target 堂弟牦牛鞋
step
#completewith 交任务: |cRXP_FRIENDLY_土地精！土地精！土地精！|r
.isOnQuest 30611
+看到 |cRXP_PICK_瓶子|r 或 |cRXP_PICK_Luckydo|r 就点击, 可获得强力增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step
#completewith Cagemaster
#hidewindow
#loop
.goto 379,46.33,64.87,40,0
.goto 379,46.74,66.01,40,0
.goto 379,45.41,65.40,40,0
.goto 379,45.88,64.12,30,0
.goto 379,45.27,63.01,30,0
.goto 379,46.06,62.07,30,0
.goto 379,46.83,63.26,30,0
.goto 379,46.33,64.87,0
.goto 379,46.74,66.01,0
.goto 379,45.41,65.40,0
.goto 379,45.88,64.12,0
.goto 379,45.27,63.01,0
.goto 379,46.06,62.07,0
.goto 379,46.83,63.26,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_笼监|r
.complete 30611,1 
.mob cagemaster
step
>>点击 |cRXP_PICK_土地精物资|r, |cRXP_WARN_每次点击间隔约 2 秒再点下一个|r
.complete 30610,1 
step
#label Cagemaster
>>击杀 |cRXP_ENEMY_笼监|r
.complete 30611,1 
.mob cagemaster
step
#label 交任务: |cRXP_FRIENDLY_土地精！土地精！土地精！|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟牦牛鞋|r和|cRXP_FRIENDLY_堂弟兔子脚|r交谈
.turnin 30610 >>交任务: |cRXP_FRIENDLY_土地精！土地精！土地精！|r
.turnin 30611 >>交任务: |cRXP_FRIENDLY_释放雪人！|r
.goto 379,45.95,64.06
.accept 30612 >>接任务: |cRXP_WARN_猢狲头领|r
.goto 379,45.91,64.06
.timer 24,RP
.target 堂弟牦牛鞋
.target 堂弟兔子脚
step
#completewith 交任务: |cRXP_FRIENDLY_猢狲头领|r
.isOnQuest 30612
+看到 |cRXP_PICK_瓶子|r 或 |cRXP_PICK_Luckydo|r 就点击, 可获得强力增益
*|cRXP_WARN_Refresh its duration if you spot another.|r
step
.goto 379,46.09,63.34
>>|cRXP_WARN_任务空闲期间, 根据当前需求专注以下活动以提升效率:|r
*- Open |cRXP_FRIENDLY_|T1542852:0|t[Caches of Infinite Treasures]|r
*- Replace Old Gear
*- Extract Old Gems
*- Scrap Obsolete Gear
*- Combine Prismatic Gems
.use 211279
.usespell 436523
.usespell 433397
.complete 30612,1 
step
#loop
.goto 379,45.74,62.85,15,0
.goto 379,46.11,62.79,15,0
.goto 379,46.20,63.34,15,0
.goto 379,45.74,62.85,0
.goto 379,46.11,62.79,0
.goto 379,46.20,63.34,0
>>击杀 |cRXP_ENEMY_乌克头领|r
.complete 30612,2 
.mob the ook of dook
step
#label 交任务: |cRXP_FRIENDLY_猢狲头领|r
.goto 379,51.97,67.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_堂弟兔子脚|r交谈
.turnin 30612 >>交任务: |cRXP_FRIENDLY_猢狲头领|r
.target 堂弟兔子脚
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_表叔劲豆|r和|cRXP_FRIENDLY_表哥谷毛|r交谈
.accept 30744 >>接任务: |cRXP_WARN_寇塔混合咔啡|r
.accept 30745 >>接任务: |cRXP_WARN_制造难题|r
.goto 379,42.42,69.66
.accept 30742 >>接任务: |cRXP_WARN_知错就改|r
.accept 30743 >>接任务: |cRXP_WARN_羊屎咔啡|r
.goto 379,42.36,69.74
.target 表叔激情豆
.target 表哥山羊毛
step
#completewith Kafa'kota Berry
>>击杀 |cRXP_ENEMY_咔啡成瘾的高山羊|r
.complete 30742,1 
.mob kafa-crazed mountain goat
step
#completewith Kafa'kota Berry
>>点击 |cRXP_PICK_咔啡果沉积物|r
.complete 30743,1 
step
#completewith Kafa'kota Berry
>>击杀 |cRXP_ENEMY_咔啡成瘾的雪人|r
.complete 30745,1 
.mob kafa-crazed yeti
step
#loop
.goto 379,40.39,71.44,30,0
.goto 379,40.04,71.93,30,0
.goto 379,39.45,73.15,30,0
.goto 379,38.79,73.67,30,0
.goto 379,39.45,75.67,20,0
.goto 379,39.25,74.67,20,0
.goto 379,39.21,74.17,20,0
.goto 379,38.67,74.28,20,0
.goto 379,38.27,75.01,20,0
.goto 379,38.00,75.24,20,0
.goto 379,37.89,74.07,20,0
.goto 379,38.55,74.39,20,0
.goto 379,38.30,73.21,30,0
.goto 379,39.25,74.30,30,0
.goto 379,39.44,75.38,30,0
.goto 379,39.71,78.09,30,0
.goto 379,38.46,78.35,30,0
.goto 379,36.93,77.58,30,0
.goto 379,37.55,78.04,30,0
.goto 379,37.68,77.16,30,0
.goto 379,37.70,75.61,30,0
.goto 379,40.39,71.44,0
.goto 379,40.04,71.93,0
.goto 379,39.45,73.15,0
.goto 379,38.79,73.67,0
.goto 379,39.45,75.67,0
.goto 379,39.25,74.67,0
.goto 379,39.21,74.17,0
.goto 379,38.67,74.28,0
.goto 379,38.27,75.01,0
.goto 379,38.00,75.24,0
.goto 379,37.89,74.07,0
.goto 379,38.55,74.39,0
.goto 379,38.30,73.21,0
.goto 379,39.25,74.30,0
.goto 379,39.44,75.38,0
.goto 379,39.71,78.09,0
.goto 379,38.46,78.35,0
.goto 379,36.93,77.58,0
.goto 379,37.55,78.04,0
.goto 379,37.68,77.16,0
.goto 379,37.70,75.61,0
#label Kafa'kota Berry
>>点击 |cRXP_PICK_寇塔咔啡果|r, 使用 |T133958:0|t[寇塔咔啡果] 大幅提升属性
.complete 30744,1 
.turnin 30744 >>交任务: |cRXP_FRIENDLY_寇塔混合咔啡|r
.accept 30746 >>接任务: |cRXP_WARN_公平的交易|r
.use 81054
step
.goto 379,36.95,76.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侄子浆果|r交谈, 他在山洞外的山顶上
.turnin 30746 >>交任务: |cRXP_FRIENDLY_公平的交易|r
.target 表侄八宝利
step
#completewith Kafa-Crazed Mountain Goat
#hidewindow
#loop
.goto 379,38.72,73.54,30,0
.goto 379,38.55,72.60,30,0
.goto 379,40.04,71.97,30,0
.goto 379,40.73,72.39,30,0
.goto 379,40.41,73.12,30,0
.goto 379,39.51,76.93,30,0
.goto 379,38.42,78.15,30,0
.goto 379,38.72,73.54,0
.goto 379,38.55,72.60,0
.goto 379,40.04,71.97,0
.goto 379,40.73,72.39,0
.goto 379,40.41,73.12,0
.goto 379,39.51,76.93,0
.goto 379,38.42,78.15,0
+1
step
#completewith Kafa'goot "Deposit" Marked
>>击杀 |cRXP_ENEMY_咔啡成瘾的高山羊|r
.complete 30742,1 
.mob kafa-crazed mountain goat
step
#completewith Kafa'goot "Deposit" Marked
>>击杀 |cRXP_ENEMY_咔啡成瘾的雪人|r
.complete 30745,1 
.mob kafa-crazed yeti
step
#label Kafa'goot "Deposit" Marked
>>点击 |cRXP_PICK_咔啡果沉积物|r
.complete 30743,1 
step
#completewith next
>>击杀 |cRXP_ENEMY_咔啡成瘾的高山羊|r
.complete 30742,1 
.mob kafa-crazed mountain goat
step
>>击杀 |cRXP_ENEMY_咔啡成瘾的雪人|r
.complete 30745,1 
.mob kafa-crazed yeti
step
#label Kafa-Crazed Mountain Goat
>>击杀 |cRXP_ENEMY_咔啡成瘾的高山羊|r
.complete 30742,1 
.mob kafa-crazed mountain goat
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_激情豆叔叔|r\|cRXP_FRIENDLY_山羊毛表哥|r 和 |cRXP_FRIENDLY_八宝利侄子|r 交谈
.turnin 30742 >>交任务: |cRXP_FRIENDLY_知错就改|r
.turnin 30743 >>交任务: |cRXP_FRIENDLY_羊屎咔啡|r
.goto 379,42.52,69.35
.turnin 30745 >>交任务: |cRXP_FRIENDLY_制造难题|r
.goto 379,42.53,69.44
.goto 379,42.52,69.35
.target 表侄八宝利
.target 表叔激情豆
.target 表哥山羊毛
step
.goto 379,34.96,59.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·默拳|r交谈
.turnin 30699 >>交任务: |cRXP_FRIENDLY_前往冬花营|r
.target 林·默拳
.accept 30723 >>接任务: |cRXP_WARN_马革裹尸|r
step
.goto 379,35.12,59.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
.accept 30715 >>接任务: |cRXP_WARN_生死与共|r
.target 班·熊心
step
#completewith Shiya Boldblade
>>击杀 |cRXP_ENEMY_昆莱食腐鸟|r
.complete 30723,1 
.mob kun-lai corpsepicker
step
.goto 379,29.98,64.39
>>与 |cRXP_FRIENDLY_希雅·勇刃|r 互动
.complete 30715,3 
.target 诗雅·勇剑
step
.goto 379,30.16,62.49
>>与 |cRXP_FRIENDLY_千面刘|r 互动
.complete 30715,2 
.target 刘 of the Thousand
step
#label Shiya Boldblade
.goto 379,30.33,60.02
>>与 |cRXP_FRIENDLY_影魔师志耀|r 互动
.complete 30715,1 
.target 影踪派智遥大师
step
#loop
.goto 379,32.00,62.40,20,0
.goto 379,29.73,63.74,20,0
.goto 379,30.30,60.30,20,0
.goto 379,32.00,62.40,0
.goto 379,29.73,63.74,0
.goto 379,30.30,60.30,0
>>击杀 |cRXP_ENEMY_昆莱食腐鸟|r
.complete 30723,1 
.mob kun-lai corpsepicker
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林·默拳|r和|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30715 >>交任务: |cRXP_FRIENDLY_生死与共|r
.goto 379,35.11,59.64
.turnin 30723 >>交任务: |cRXP_FRIENDLY_马革裹尸|r
.accept 30724 >>接任务: |cRXP_WARN_上城墙！|r
.goto 379,34.95,59.30
.target 林·默拳
.target 班·熊心
step
#completewith next
.goto 379,34.53,59.12
.logout >>|cRXP_WARN_站在路径点位置|r
*>>|cRXP_WARN_按下 Escape 并选择退出登录.|r |cFFFF0000这是为了跳过剧情|r
step
.goto 379,34.53,59.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_风筝大师伦|r 交谈
.complete 30724,1 
.skipgossip 61512,2
.target 风筝-Master Len
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孙娜·默拳|r和|cRXP_FRIENDLY_铁腹老陈|r交谈
.turnin 30724 >>交任务: |cRXP_FRIENDLY_上城墙！|r
.accept 30750 >>接任务: |cRXP_WARN_滚下去！|r
.goto 379,29.31,62.29
.accept 30751 >>接任务: |cRXP_WARN_恐怖的献祭|r
.goto 379,29.25,62.3
.target 铁腹老陈
.target 孙娜·默拳
step
#completewith Osul Veteran Archers
#hidewindow
#loop
.goto 379,27.92,60.90,25,0
.goto 379,26.84,60.04,25,0
.goto 379,26.05,59.10,25,0
.goto 379,27.92,60.90,0
.goto 379,26.84,60.04,0
.goto 379,26.05,59.10,0
+1
step
#completewith next
>>击杀 |cRXP_ENEMY_老练弓箭手|r 和 |cRXP_ENEMY_火焰战士|r
.complete 30750,1 
.mob 奥苏尔射手老兵
.mob 奥苏尔火战士
step
>>点击 |cRXP_PICK_野牛人油桶|r
.complete 30751,1 
step
#label Osul Veteran Archers
>>击杀 |cRXP_ENEMY_老练弓箭手|r 和 |cRXP_ENEMY_火焰战士|r
.complete 30750,1 
.mob 奥苏尔射手老兵
.mob 奥苏尔火战士
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁腹老陈|r和|cRXP_FRIENDLY_孙娜·默拳|r交谈
.turnin 30751 >>交任务: |cRXP_FRIENDLY_恐怖的献祭|r
.goto 379,29.25,62.30
.turnin 30750 >>交任务: |cRXP_FRIENDLY_滚下去！|r
.accept 30994 >>接任务: |cRXP_WARN_老陈的金点子|r
.goto 379,29.3,62.29
.target 孙娜·默拳
.target 铁腹老陈
step
#completewith next
.goto 379,29.31,62.29
.logout >>|cRXP_WARN_站在路径点位置|r
*>>|cRXP_WARN_按下 Escape 并选择退出登录.|r |cFFFF0000这是为了跳过剧情|r
step
.goto 379,29.31,62.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_孙娜·默拳|r 交谈
.complete 30994,1 
.skipgossip
.target 孙娜·默拳
step
.goto 379,31.81,60.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁腹老陈|r交谈
.turnin 30994 >>交任务: |cRXP_FRIENDLY_老陈的金点子|r
.target 铁腹老陈
.accept 30991 >>接任务: |cRXP_WARN_侧翻的酒桶！|r
step
.isOnQuest 30991
.goto 379,32.08,60.52
.vehicle >>点击 |cRXP_PICK_酒桶炸弹|r
.target 酒桶炸弹
step
#loop
.goto 379,30.90,62.46,20,0
.goto 379,30.90,63.36,20,0
.goto 379,30.09,63.92,20,0
.goto 379,29.94,62.80,20,0
.goto 379,30.90,62.46,0
.goto 379,30.90,63.36,0
.goto 379,30.09,63.92,0
.goto 379,29.94,62.80,0
>>靠近 |cRXP_ENEMY_入侵者|r 和 |cRXP_ENEMY_奥苏尔投树车|r 时使用 (1) |T135265:0|t[点燃酒桶], |cRXP_WARN_多次使用|r
.complete 30991,1 
.complete 30991,2 
.mob osul invader
.mob osul treelauncher
step
.goto 379,31.82,60.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁腹老陈|r交谈
.turnin 30991 >>交任务: |cRXP_FRIENDLY_侧翻的酒桶！|r
.target 铁腹老陈
.accept 30992 >>接任务: |cRXP_WARN_终结！|r
step
.goto 379,31.36,61.48
>>击杀 |cRXP_ENEMY_贡达|r
.complete 30992,1 
.mob 贡达
step
.goto 379,31.28,61.50
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30992 >>交任务: |cRXP_FRIENDLY_终结！|r
.accept 30993 >>接任务: |cRXP_WARN_我的援军在哪儿？|r
.target 班·熊心
step
.goto 379,31.3,61.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁腹老陈|r交谈
.complete 30993,1 
.skipgossip 61819,1
.target 班·熊心
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_孙娜·默拳|r交谈
.target 孙娜·默拳
step
#completewith next
.logout 15 >>在 |cRXP_FRIENDLY_班·熊心|r 面前按 Esc 并选择登出
step
.goto 379,33.97,58.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈, 仅在登录倒计时剩余5秒时
.complete 30993,2 
.skipgossip 61819,1
.target 班·熊心
step
.goto 379,35.32,49.56
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_班·熊心|r交谈
.turnin 30993 >>交任务: |cRXP_FRIENDLY_我的援军在哪儿？|r
.target 班·熊心
.accept 30752 >>接任务: |cRXP_WARN_难以置信！|r
step
.isOnQuest 30752
.goto 379,36.7,47.72
.gossipoption 41432 >>与|cRXP_FRIENDLY_影踪派哨兵|r交谈
.timer 10,RP
.target 影踪派哨兵
step
.goto 379,36.7,47.72
>>击杀 |cRXP_ENEMY_影踪派哨兵|r
.complete 30752,1 
.skipgossip
.target 影踪派哨兵
step
.goto 379,36.70,47.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_班·熊心|r, 就在你旁边
.turnin 30752 >>交任务: |cRXP_FRIENDLY_难以置信！|r
.target 班·熊心
]]);
