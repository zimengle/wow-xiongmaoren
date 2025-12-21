RXPGuides.RegisterGuide([[
#classic
<< Horde
#xprate >1.99
#name 24-26 南贫瘠之地
#displayname 24-26 南贫瘠之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 23
#group RestedXP 部落 22-30级
#next 26-28 灰谷；26-28 赛季服 灰谷
step
.goto Thunder Bluff,47.00,49.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
.fly Camp Taurajo >>飞往陶拉霍营地
.target Tal
.zoneskip Thunder Bluff,1
step
.goto The Barrens,44.55,59.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
.accept 879 >>接任务: |cRXP_LOOT_内奸|r
.target Mangletooth
step
#completewith CampTHS2
+|cRXP_WARN_使用你剩余的|r|T134128:0|t[血岩碎片]|cRXP_WARN_来获得|r|T136104:0|t[野猪之皮]|cRXP_WARN_及其他增益效果|r << !Mage !Druid
+|cRXP_WARN_使用你剩余的|r|T134128:0|t[血岩碎片]|cRXP_WARN_来获得增益|r << Mage/Druid
>>|cRXP_WARN_如果可能, 请保存10|r|T134128:0|t[血岩碎片]|cRXP_WARN_, 以便在指南后续阶段利用速度增益|r
+|cRXP_WARN_请确保关闭 Questie 或 Leatrix Plus 等插件的自动完成功能！|r
step
.goto The Barrens,44.85,59.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
.daily 235,742,6382 >>接任务: |cRXP_LOOT_灰谷狩猎|r
.target Jorn Skyseer
step << Warrior
.goto The Barrens,44.67,59.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的 |cRXP_FRIENDLY_鲁迦·狂暴图腾|r交谈
.turnin 1823 >>交任务: |cRXP_FRIENDLY_和鲁迦交谈|r
.accept 1824 >>接任务: |cRXP_LOOT_巨人旷野的试炼|r
.target Ruga Ragetotem
step
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.home >>将你的炉石设置为陶拉祖营地
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Byula
.dungeon WC
step << !Rogue !Shaman
.goto The Barrens,45.58,59.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
.vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
.target Innkeeper Byula
.dungeon !WC
step
#optional
#label CampTHS2
step << Warlock
#season 2
#sticky
#completewith BarrensEnd
#label ExplorerImp
>>在任务过程中对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r, 直到获得 |T133257:0|t|cRXP_LOOT_探险者之魂|r. 使用它来学习如何召唤一只 |T236294:0|t|cRXP_FRIENDLY_[探险者小鬼]|r
.train 445459 >>|cRXP_WARN_使用|r|T133257:0|t|cRXP_LOOT_探险者之魂|r|cRXP_WARN_来学习如何召唤|r|T236294:0|t[|cRXP_FRIENDLY_探险者小鬼|r]
.train 445459,1 
.train 1120,3 
.use 221978
step << Warlock/Mage
#season 2
#requires ExplorerImp << Warlock
#sticky
#completewith BarrensEnd
#label FelPortalRune
>>你所在的区域存在|cRXP_FRIENDLY_Fel Portals|r. 如果你发现一个传送门, 请召唤你的 |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r], 并站在传送门旁边与其交谈, 派遣它进行探险. 10至20分钟后, 它将返回并携带战利品, 还有机会奖励你 |T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r] << Warlock
>>你所在区域存在|cRXP_FRIENDLY_Fel 传送门|r. 若发现一个, 请使用 |T134945:0|t[|cRXP_LOOT_空间修复卷轴|r] 将其关闭. 这将奖励你 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:烈焰爆破|r] << Mage
>>|cRXP_WARN_留意传送门, 直到获得符文|r
.collect 221499,1 << Warlock 
.collect 223147,1 << Mage 
.itemcount 220792,1 << Mage 
.use 223148 << Warlock 
.use 220792 << Mage
.train 429311,1 << Mage
.train 431756,1 << Warlock
.train 1120,3 << Warlock 
.unitscan Fel Sliver
.unitscan Fel Crack
.unitscan Fel Tear
.unitscan Fel Scar
.unitscan Fel Rift
step << Warlock/Mage
#season 2
#requires FelPortalRune
#sticky
#completewith BarrensEnd
.itemcount 221499,1 << Warlock 
.itemcount 223147,1 << Mage 
.train 431756 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_恶魔守卫符文|r]|cRXP_WARN_来学习|r|T136216:0|t[召唤地狱火] << Warlock
.train 429311 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:烈焰之箭|r|cRXP_WARN_来训练|r|T135809:0|t[烈焰之箭] << Mage
.use 221499 << Warlock
.use 223147 << Mage
step
#completewith next
>>击杀一只|cRXP_ENEMY_Thunderhawk|r. 击败后搜刮其|cRXP_LOOT_Wings|r
.complete 913,1 
.mob Thunderhawk Hatchling
.mob Thunderhawk Cloudscraper
.mob Greater Thunderhawk
step
#loop
.goto The Barrens,44.63,62.71,0
.goto The Barrens,45.78,63.09,0
.goto The Barrens,49.57,59.36,0
.goto The Barrens,49.21,61.42,0
.goto The Barrens,44.63,62.71,80,0
.goto The Barrens,45.78,63.09,80,0
.goto The Barrens,49.21,61.42,80,0
.goto The Barrens,49.57,59.36,80,0
>>在该区域附近找到并击杀|cRXP_ENEMY_Owatanka|r(蓝色雷霆蜥蜴). 击败后搜刮其掉落的 |T133723:0|t[|cRXP_LOOT_Owatanka's Tailspike|r], 用它来开启任务
>>|cRXP_WARN_如果找不到他, 请跳过此任务|r
.collect 5102,1,884 
.accept 884 >>接任务: |cRXP_LOOT_奥瓦坦卡|r
.use 5102
.unitscan Owatanka
step << Warrior
#loop
.goto The Barrens,45.17,69.08,0
.goto The Barrens,45.17,69.08,50,0
.goto The Barrens,43.87,68.84,50,0
.goto The Barrens,42.17,69.65,50,0
.goto The Barrens,42.35,71.85,50,0
.goto The Barrens,42.77,72.28,50,0
.goto The Barrens,43.86,72.06,50,0
.goto The Barrens,45.38,72.25,50,0
>>击杀异种护卫者和异种群居蝎和异种爬行者和异种幼蝎. 击败它们后可获得其掉落的 |T133027:0|t[颤抖的触角]
>>|cRXP_WARN_注意:|T133027:0|t[颤抖的触角]效果仅持续15分钟, 请在任务期间勿离开或退出游戏|r
.complete 1824,1 
.mob Silithid Protector
.mob Silithid Swarmer
.mob Silithid Creeper
.mob Silithid Grub
step << Warrior
.goto The Barrens,44.67,59.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的 |cRXP_FRIENDLY_鲁迦·狂暴图腾|r交谈
>>|cRXP_WARN_跳过后续任务|r
.turnin 1824 >>交任务: |cRXP_FRIENDLY_巨人旷野的试炼|r
.target Ruga Ragetotem
step
#completewith next
>>击杀|cRXP_ENEMY_异种收割者|r. 击败后拾取其掉落的 |T134321:0|t[|cRXP_LOOT_异种收割者之首|r ], 并使用该物品启动任务
>>|cRXP_WARN_如果找不到他, 就跳过此任务. 这个怪物非常稀有！|r
.collect 5138,1,897,1 
.accept 897 >>接任务: |cRXP_LOOT_收割者|r
.use 5138
.unitscan Silithid Harvester
step
#label SilithidEggs
#loop
.goto The Barrens,42.91,69.86,0
.goto The Barrens,45.04,69.85,60,0
.goto The Barrens,42.91,69.86,60,0
.goto The Barrens,42.97,71.11,60,0
.goto The Barrens,45.36,72.36,60,0
.goto The Barrens,47.40,70.11,60,0
.goto The Barrens,48.40,70.08,60,0
.goto The Barrens,42.91,69.86,60,0
>>掠夺|cRXP_PICK_异种蝎土丘|r以获得|cRXP_LOOT_异种蝎卵|r
.complete 868,1 
.isOnQuest 868
.maxlevel 26
step << Shaman
#completewith next
.goto The Barrens,44.76,74.79,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step << Shaman
#completewith next
.goto The Barrens,43.84,77.28,25,0
.goto The Barrens,43.62,77.29,25,0
.goto The Barrens,43.42,77.41,15 >>前往|cRXP_FRIENDLY_布瑞恩|r方向
step << Shaman
.goto The Barrens,43.42,77.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
.turnin 1536 >>交任务: |cRXP_FRIENDLY_水之召唤|r
.accept 1534 >>接任务: |cRXP_LOOT_水之召唤|r
.target Brine
step
#completewith next
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#label Gann1
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.accept 843 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
.maxlevel 26
step << Mage
#season 2
.train 415936,1
.train 1953,3 
.goto The Barrens,45.45,80.00
.aura 421063,1 >>|cRXP_WARN_对着墙上的|r|cRXP_PICK_蚀刻雕刻|r|cRXP_WARN_眨眼, 即可获得|r|T236168:0|t[无台阶之路]|cRXP_WARN_buff|r
step << Mage
#season 2
.train 415936,1
.train 1953,3 
.goto The Barrens,45.28,80.14,5,0
.goto The Barrens,45.23,80.42,5,0
.goto The Barrens,45.06,80.57,5,0
.goto The Barrens,44.94,80.80,5,0
.goto The Barrens,44.87,81.08,5,0
.goto The Barrens,44.80,81.37
.train 415936 >>|cRXP_WARN_施放|r|T135736:0|t[闪现]|cRXP_WARN_依次进入绿色圆圈. 最后, 对着|r|cRXP_PICK_蚀刻雕刻|r|cRXP_WARN_进行闪现训练|r|T236220:0|t[活体炸弹]
step
#completewith Lok
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r和|cRXP_ENEMY_钢鬃探路者|r. 击败后拾取掉落的 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r]
>>击杀|cRXP_ENEMY_钢鬃先知|r. 击败他们后可获得 |T135139:0|t[|cRXP_LOOT_烧焦的钢鬃魔杖|r]
>>击杀|cRXP_ENEMY_Razormane Warfrenzies|r. 击败后可获得 |T134955:0|t[|cRXP_LOOT_钢鬃大盾|r]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.collect 5093,1,893,1 
.mob +Razormane Stalker
.mob +Razormane Pathfinder
.collect 5092,1,893,1 
.mob +Razormane Seer
.collect 5094,1,893,1 
.mob +Razormane Warfrenzy
step
#completewith next
.goto The Barrens,44.85,78.81,45,0
.goto The Barrens,44.44,78.97,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
.line The Barrens,44.37,79.85,44.83,79.87,45.05,79.75,45.12,79.20,44.89,78.87,44.43,78.71,43.80,79.46,43.66,79.12,43.48,78.95,43.07,78.98,42.65,79.87,42.82,80.23,43.24,80.49,43.49,80.48,43.63,80.97,43.79,81.40,44.15,81.44,44.83,80.95,45.46,80.91,45.52,80.47,45.10,80.30,44.66,80.49,44.31,80.79,44.16,80.46,44.03,80.38,43.91,80.46,44.06,80.02,44.37,79.85
#loop
.goto The Barrens,44.06,80.02,45,0
.goto The Barrens,43.91,80.46,45,0
.goto The Barrens,44.03,80.38,45,0
.goto The Barrens,44.16,80.46,45,0
.goto The Barrens,44.31,80.79,45,0
.goto The Barrens,44.66,80.49,45,0
.goto The Barrens,45.10,80.30,45,0
.goto The Barrens,45.52,80.47,45,0
.goto The Barrens,45.46,80.91,45,0
.goto The Barrens,44.83,80.95,45,0
.goto The Barrens,44.15,81.44,45,0
.goto The Barrens,43.79,81.40,45,0
.goto The Barrens,43.63,80.97,45,0
.goto The Barrens,43.49,80.48,45,0
.goto The Barrens,43.24,80.49,45,0
.goto The Barrens,42.82,80.23,45,0
.goto The Barrens,42.65,79.87,45,0
.goto The Barrens,43.07,78.98,45,0
.goto The Barrens,43.48,78.95,45,0
.goto The Barrens,43.66,79.12,45,0
.goto The Barrens,43.80,79.46,45,0
.goto The Barrens,44.43,78.71,45,0
.goto The Barrens,44.89,78.87,45,0
.goto The Barrens,45.12,79.20,45,0
.goto The Barrens,45.05,79.75,45,0
.goto The Barrens,44.83,79.87,45,0
.goto The Barrens,44.83,79.87,0
>>击杀|cRXP_ENEMY_Kuz|r. 击败他后搜刮其|cRXP_LOOT_Kuz's Skull|r
>>|cRXP_ENEMY_卡兹|r|cRXP_WARN_巡逻时稍有移动|r
.complete 879,1 
.unitscan Kuz
step
#completewith next
.goto The Barrens,43.14,80.75,45,0
.goto The Barrens,43.35,81.16,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#label Lok
.goto The Barrens,40.31,80.70,20,0
.goto The Barrens,40.14,80.56
>>击杀|cRXP_ENEMY_洛克·奥克班恩|r. 击败他后搜刮|cRXP_LOOT_洛克的头骨|r
.complete 879,3 
.mob Lok Orcbane
step
#completewith WandShield
.goto The Barrens,44.85,78.81,45,0
.goto The Barrens,44.44,78.97,45,0
.goto The Barrens,43.14,80.75,45,0
.goto The Barrens,43.35,81.16,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#completewith NakSkull
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r 和|cRXP_ENEMY_钢鬃探路者|r. 击败后搜刮, 有几率获得 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r ]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.collect 5093,1,893,1 
.mob Razormane Stalker
.mob Razormane Pathfinder
step
#label WandShield
#loop
.goto The Barrens,42.57,78.81,50,0
.goto The Barrens,42.12,78.48,50,0
.goto The Barrens,41.49,78.69,50,0
.goto The Barrens,41.22,79.72,50,0
.goto The Barrens,40.91,80.60,50,0
.goto The Barrens,40.55,80.84,50,0
.goto The Barrens,41.62,80.92,50,0
.goto The Barrens,41.54,82.28,50,0
.goto The Barrens,42.48,82.28,50,0
.goto The Barrens,42.57,78.81,50,0
>>击杀|cRXP_ENEMY_钢鬃先知|r. 击败他们后可获得一个 |T135139:0|t[|cRXP_LOOT_烧焦的钢鬃魔杖|r]
>>击杀|cRXP_ENEMY_Razormane Warfrenzies|r. 击败后可掠夺获得 |T134955:0|t[|cRXP_LOOT_钢鬃大盾|r]
.collect 5092,1,893,1 
.mob +Razormane Seer
.collect 5094,1,893,1 
.mob +Razormane Warfrenzy
step
#label NakSkull
.goto The Barrens,43.87,83.43
>>击杀|cRXP_ENEMY_Nak|r. 击杀后搜刮其掉落的|cRXP_LOOT_Nak's Skull|r
.complete 879,2 
.mob Nak
step
#loop
.goto The Barrens,45.48,79.89,0
.goto The Barrens,44.09,83.70,15,0
.goto The Barrens,44.15,83.34,15,0
.goto The Barrens,44.38,83.05,15,0
.goto The Barrens,44.22,82.67,15,0
.goto The Barrens,44.10,82.38,15,0
.goto The Barrens,43.85,82.25,15,0
.goto The Barrens,43.76,80.84,40,0
.goto The Barrens,44.14,80.03,40,0
.goto The Barrens,44.17,81.02,40,0
.goto The Barrens,44.66,81.18,40,0
.goto The Barrens,45.08,80.34,40,0
.goto The Barrens,45.48,79.89,40,0
.goto The Barrens,44.09,83.70,15,0
.goto The Barrens,44.15,83.34,15,0
.goto The Barrens,44.38,83.05,15,0
.goto The Barrens,44.22,82.67,15,0
.goto The Barrens,44.10,82.38,15,0
.goto The Barrens,43.85,82.25,15,0
.goto The Barrens,43.76,80.84,40,0
.goto The Barrens,44.14,80.03,40,0
.goto The Barrens,44.17,81.02,40,0
.goto The Barrens,44.66,81.18,40,0
.goto The Barrens,45.08,80.34,40,0
.goto The Barrens,45.48,79.89,40,0
>>击杀|cRXP_ENEMY_钢鬃捕猎者|r 和|cRXP_ENEMY_钢鬃探路者|r. 击败后搜刮, 有几率获得 |T135640:0|t[|cRXP_LOOT_钢鬃背刺匕首|r ]
>>|cRXP_WARN_|r 的钢鬃捕猎者处于潜行状态|c|r
.collect 5093,1,893,1 
.mob Razormane Stalker
.mob Razormane Pathfinder
step
#completewith next
>>击杀|cRXP_ENEMY_Bael'dun 掘土者|r和|cRXP_ENEMY_Bael'dun 工头|r
.complete 843,1 
.mob +Bael'dun Excavator
.complete 843,2 
.mob +Bael'dun Foreman
.isOnQuest 843
step
#loop
.goto The Barrens,48.34,86.19,0
.goto The Barrens,47.51,85.04,15,0
.goto The Barrens,47.44,85.71,15,0
.goto The Barrens,47.94,85.68,15,0
.goto The Barrens,48.34,86.19,15,0
>>击杀|cRXP_ENEMY_勘察员卡兹戈姆|r. 搜刮其尸体, 获取|cRXP_LOOT_卡兹戈姆的日记|r
.complete 843,3 
.mob Prospector Khazgorm
.isOnQuest 843
step
#loop
.goto The Barrens,47.22,84.98,0
.goto The Barrens,47.22,84.98,40,0
.goto The Barrens,47.28,85.74,40,0
.goto The Barrens,47.60,85.66,40,0
.goto The Barrens,48.43,86.34,40,0
.goto The Barrens,48.03,85.46,40,0
.goto The Barrens,47.94,84.86,40,0
.goto The Barrens,47.37,84.01,40,0
.goto The Barrens,46.92,84.22,40,0
.goto The Barrens,46.99,85.82,40,0
>>击杀|cRXP_ENEMY_Bael'dun 掘土者|r和|cRXP_ENEMY_Bael'dun 工头|r
.complete 843,1 
.mob +Bael'dun Excavator
.complete 843,2 
.mob +Bael'dun Foreman
.isOnQuest 843
step
#completewith BaelModan
.goto The Barrens,47.21,79.35,45,0
.goto The Barrens,47.22,79.72,45,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 843 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.accept 846 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
.isQuestComplete 843
step
#optional
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.accept 846 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
.isQuestTurnedIn 843
step
#label BaelModan
#completewith RevengeofGann2
.goto The Barrens,48.63,84.49,110 >>前往贝勒莫丹
.isQuestTurnedIn 843
step
#completewith TearMoons2
>>击杀|cRXP_ENEMY_Bael'dun 矮人|r. 击杀后搜刮他们的|cRXP_LOOT_硝化甘油|r和|cRXP_LOOT_木浆|r和|cRXP_LOOT_硝酸钠|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_巴尔丹军官|r|cRXP_WARN_在进入防御姿态动画后, 8秒内招架几率提升50%|r|r << Rogue/Warrior/Druid/Shaman
.complete 846,1 
.complete 846,2 
.complete 846,3 
.mob Bael'dun Rifleman
.mob Bael'dun Soldier
.mob Bael'dun Officer
.group 0
.isQuestTurnedIn 843
step
.goto The Barrens,48.94,86.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feegly|r交谈
.accept 857 >>接任务: |cRXP_LOOT_众月之泪|r
.target Feegly the Exiled
.group 3
.isQuestTurnedIn 843
step
#completewith next
.goto The Barrens,49.01,84.48,8,0
.goto The Barrens,49.06,84.59,8,0
.goto The Barrens,49.38,84.48,8,0
.goto The Barrens,49.53,84.42,8,0
.goto The Barrens,49.43,84.28,6 >>前往贝奥尔登的底层
.group
.isQuestTurnedIn 843
step
.goto The Barrens,49.13,84.25
>>打开|cRXP_PICK_塔文布莱德将军的箱子|r. 从中获取|cRXP_LOOT_众月之泪|r
>>|cRXP_WARN_小心！在塔文布莱德将军的房间很容易发生过度拉怪|r
>>|cRXP_WARN_直接拉怪时, 除了塔文布莱德将军以外的任何怪物都不要拉|r
.complete 857,1 
.group 3
.isQuestTurnedIn 843
step
#completewith next
.goto The Barrens,49.43,84.28,8,0
.goto The Barrens,49.53,84.42,8,0
.goto The Barrens,49.38,84.48,8,0
.goto The Barrens,49.06,84.59,8,0
.goto The Barrens,49.01,84.48,8,0
.goto The Barrens,48.75,84.63,20 >>离开贝奥尔丹要塞
.group
.isQuestTurnedIn 843
step
#label TearMoons2
.goto The Barrens,48.94,86.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feegly|r交谈
.turnin 857 >>交任务: |cRXP_FRIENDLY_众月之泪|r
.target Feegly the Exiled
.isQuestComplete 857
.group
step
#label RevengeofGann2
#loop
.goto The Barrens,48.96,84.36,0
.goto The Barrens,48.96,84.36,30,0
.goto The Barrens,48.88,84.02,30,0
.goto The Barrens,49.28,83.76,30,0
.goto The Barrens,49.22,84.21,30,0
.goto The Barrens,49.47,84.41,30,0
.goto The Barrens,49.09,84.67,30,0
>>击杀|cRXP_ENEMY_Bael'dun 矮人|r. 击杀后搜刮他们的|cRXP_LOOT_硝化甘油|r和|cRXP_LOOT_木浆|r和|cRXP_LOOT_硝酸钠|r
>>|cRXP_WARN_小心！|r|cRXP_ENEMY_巴尔丹军官|r|cRXP_WARN_在进入防御姿态动画后, 8秒内招架几率提升50%|r|r << Rogue/Warrior/Druid/Shaman
.complete 846,1 
.complete 846,2 
.complete 846,3 
.mob Bael'dun Rifleman
.mob Bael'dun Soldier
.mob Bael'dun Officer
.isQuestTurnedIn 843
step
#completewith GannRevengeComplete
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 846 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.accept 849 >>接任务: |cRXP_LOOT_加恩的报复|r
.target Gann Stonespire
.isQuestTurnedIn 843
step
.goto The Barrens,46.97,85.63
>>点击平台顶部的|cRXP_PICK_巴尔莫丹飞行器|r
>>|cRXP_WARN_此技能射程为50码|r
.complete 849,1 
.isQuestTurnedIn 843
step
#completewith WashtethePawne
>>击杀一只|cRXP_ENEMY_Thunderhawk|r. 击败后搜刮其|cRXP_LOOT_Wings|r
.complete 913,1 
.mob Thunderhawk Hatchling
.mob Thunderhawk Cloudscraper
.mob Greater Thunderhawk
step
#label GannRevengeComplete
#loop
.line The Barrens,46.12,81.25,46.09,80.54,46.16,79.66,46.14,79.37,46.07,79.19,45.86,78.77,45.79,78.47,45.83,77.21,45.91,76.97,46.02,76.71,46.08,76.33,46.14,75.40
.goto The Barrens,46.14,75.40,40,0
.goto The Barrens,46.08,76.33,40,0
.goto The Barrens,46.02,76.71,40,0
.goto The Barrens,45.91,76.97,40,0
.goto The Barrens,45.83,77.21,40,0
.goto The Barrens,45.79,78.47,40,0
.goto The Barrens,45.86,78.77,40,0
.goto The Barrens,46.07,79,19,40,0
.goto The Barrens,46.14,79.37,40,0
.goto The Barrens,46.16,79.66,40,0
.goto The Barrens,46.09,80.54,40,0
.goto The Barrens,46.12,81.25,40,0
.goto The Barrens,46.14,75.40,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加恩|r交谈
>>|cRXP_FRIENDLY_甘恩|r|cRXP_WARN_patrols 在道路上南北巡逻|r
.turnin 849 >>交任务: |cRXP_FRIENDLY_加恩的报复|r
.target Gann Stonespire
.isQuestTurnedIn 843
step
#label WashtethePawne
#loop
.goto The Barrens,44.85,78.81,0
.goto The Barrens,44.85,78.81,60,0
.goto The Barrens,44.44,78.97,60,0
.goto The Barrens,43.14,80.75,60,0
.goto The Barrens,43.35,81.16,60,0
.goto The Barrens,47.22,79.72,60,0
.goto The Barrens,47.21,79.35,60,0
.goto The Barrens,44.76,74.79,60,0
>>击杀|cRXP_ENEMY_瓦希塔帕恩|r. 击败他后搜刮出 |T135992:0|t[|cRXP_LOOT_瓦希塔帕恩的羽毛|r], 然后使用该物品开启任务
.collect 5103,1,885 
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.use 5103
.unitscan Washte Pawne
step
#loop
.goto The Barrens,47.08,78.69,0
.goto The Barrens,47.45,74.53,0
.goto The Barrens,44.95,75.19,0
.goto The Barrens,46.81,76.47,60,0
.goto The Barrens,47.08,78.69,60,0
.goto The Barrens,46.98,79.83,60,0
.goto The Barrens,48.73,79.22,60,0
.goto The Barrens,47.45,74.53,60,0
.goto The Barrens,44.95,75.19,60,0
>>击杀一只|cRXP_ENEMY_Thunderhawk|r. 击败后搜刮其|cRXP_LOOT_Wings|r
.complete 913,1 
.mob Thunderhawk Hatchling
.mob Thunderhawk Cloudscraper
.mob Greater Thunderhawk
step
.goto The Barrens,50.48,78.72,100 >>前往尘泥沼泽
.zoneskip Dustwallow Marsh
step
#completewith next
.goto Dustwallow Marsh,30.65,45.34,40,0
.goto Dustwallow Marsh,32.28,42.80,40,0
.goto Dustwallow Marsh,33.12,40.85,40,0
.goto Dustwallow Marsh,33.55,38.71,40,0
.goto Dustwallow Marsh,34.73,37.66,40,0
.goto Dustwallow Marsh,34.31,34.40,40,0
.goto Dustwallow Marsh,33.30,31.23,40,0
.goto Dustwallow Marsh,34.58,30.62,40,0
.goto Dustwallow Marsh,36.64,31.72,120,0
.subzone 496 >>前往蕨墙村
>>|cRXP_WARN_小心！该区域有36-38级的怪物. 请沿路径点箭头指示前进以确保安全|r
step << Warrior/Shaman
.goto Dustwallow Marsh,36.17,31.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_祖尔格|r|cRXP_BUY_交谈. 如果他有货, 可以向他购买|r|T135158:0|t[大棍子]|r
.collect 12251,1,873,1 
.money <4.3117
.target Zulrg
.itemStat 16,QUALITY,<7
.itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<25.6
step
.goto Dustwallow Marsh,36.49,30.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Balai|r交谈
.vendor >>|cRXP_BUY_购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134937:0|t[卷轴]|cRXP_BUY_, 如果它们有售|r
.target Balai Lok'Wein
step
.goto Dustwallow Marsh,36.49,30.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Balai|r交谈
>>|cRXP_BUY_从她那里购买|r|T133735:0|t[急救手册]|r
.collect 16112,1,873,1 >>手册：厚丝质绷带 (1)
.collect 16113,1,873,1 >>手册：魔纹绷带 (1)
.collect 16084,1,873,1 >>手册:中级急救教材 - 绷带缚体(1)
.target Balai Lok'Wein
.skill firstaid,<1,1
step
#completewith WeaponsofChoiceTurnin
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fp Brackenwall >>获取蕨墙村飞行点
.fly Camp Taurajo >>飞往陶拉霍营地
.target Shardi
.zoneskip The Barrens
.cooldown item,6948,<0
step
.goto Dustwallow Marsh,35.57,31.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪|r交谈
.fp Brackenwall >>获取蕨墙村飞行点
.target Shardi
.zoneskip The Barrens
.cooldown item,6948,>0
step << Druid
#completewith DruidTraining33
.cast 18960 >>施放 |T135758:0|t[传送:月光林地]
.zoneskip Moonglade
.cooldown item,6948,>0,1
step << Druid
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 1075 >>训练你的职业法术
.target Loganaar
.xp <24,1
.xp >26,1
.cooldown item,6948,>0,1
step << Druid
#optional
#label DruidTraining33
.goto Moonglade,52.53,40.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 1850 >>训练你的职业法术
.target Loganaar
.xp <26,1
.cooldown item,6948,>0,1
step
#completewith WeaponsofChoiceTurnin
.hs >>传送至陶拉祖营地
.use 6948
.cooldown item,6948,>0
step
.goto The Barrens,45.10,57.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
.accept 893 >>接任务: |cRXP_LOOT_野猪人的武器|r
.turnin 893 >>交任务: |cRXP_FRIENDLY_野猪人的武器|r
.accept 1153 >>接任务: |cRXP_LOOT_新的矿石样本|r
.target Tatternack Steelforge
.xp <25,1
step
#optional
#label WeaponsofChoiceTurnin
.goto The Barrens,45.10,57.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tatternack|r交谈
.accept 893 >>接任务: |cRXP_LOOT_野猪人的武器|r
.turnin 893 >>交任务: |cRXP_FRIENDLY_野猪人的武器|r
.target Tatternack Steelforge
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 884 >>接任务: |cRXP_LOOT_奥瓦坦卡|r
.turnin 884 >>交任务: |cRXP_FRIENDLY_奥瓦坦卡|r
.itemcount 5102,1
.target Jorn Skyseer
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 885 >>接任务: |cRXP_LOOT_瓦希塔帕恩|r
.turnin 885 >>交任务: |cRXP_FRIENDLY_瓦希塔帕恩|r
.target Jorn Skyseer
.itemcount 5103,1
step
.goto The Barrens,44.86,59.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.accept 897 >>接任务: |cRXP_LOOT_收割者|r
.turnin 897 >>交任务: |cRXP_FRIENDLY_收割者|r
.itemcount 5138,1
.target Jorn Skyseer
step
.goto The Barrens,44.85,59.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
.turnin 913 >>交任务: |cRXP_FRIENDLY_雷鹰的嘶鸣|r
.accept 874 >>接任务: |cRXP_LOOT_玛伦·星眼|r
.accept 6382 >>接任务: |cRXP_LOOT_灰谷狩猎|r
.target Jorn Skyseer
step
.goto The Barrens,44.54,59.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
.turnin 879 >>交任务: |cRXP_FRIENDLY_内奸|r
.accept 906 >>接任务: |cRXP_LOOT_内奸|r
.target Mangletooth
step
#completewith next
.goto The Barrens,44.45,59.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
.fly Crossroads >>飞往十字路口
.target Omusa Thunderhorn
step
.goto The Barrens,51.50,30.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
.turnin 906 >>交任务: |cRXP_FRIENDLY_内奸|r
.target Thork
step
.goto The Barrens,51.07,29.63
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
.turnin 868 >>交任务: |cRXP_FRIENDLY_蝎卵|r
.target Korran
.isQuestComplete 868
step
#optional
.destroy 5058 >>摧毁: |cRXP_ENEMY_异种蝎卵|r
.itemcount 5058,1
step
#optional
.abandon 868 >>放弃蝎卵任务
.isOnQuest 868
step << skip
.goto The Barrens,51.99,29.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
.home >>将你的炉石设置为十字路口
.target Innkeeper Boorand Plainswind
step << Rogue
.goto The Barrens,51.39,30.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h1|cRXP_FRIENDLY_Hula'mahi|r交谈
.vendor >>|cRXP_BUY_储备|r|T134387:0|t[闪光粉] |cRXP_BUY_和|r|T132273:0|t[速效药膏]
.target Hula'mahi
step
.goto The Barrens,51.50,30.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
.fly Ratchet >>飞往棘齿城
.target Devrak
step
#sticky
#completewith LeaveRatchet
#season 2
.goto The Barrens,61.8,39.4
>>|cRXP_WARN_如果你有多余的|cRXP_LOOT_3金币|r, 可以前往棘齿城旅店向|cRXP_FRIENDLY_格里兹比|r购买符文. |cRXP_WARN_请自行判断是否负担得起, 以及该符文是否对你的职业有用. 你以后也可以随时再买|r|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店中的|cRXP_FRIENDLY_Grizzby|r交谈
.use 210822 << Priest
.use 210820 << Paladin
.use 210654 << Mage
.use 210818 << Hunter
.use 210817 << Druid
.use 210825 << Warrior
.use 210824 << Warlock
.use 210653 << Rogue
.use 210823 << Shaman
.train 415995 >>|cRXP_WARN_购买并使用|r|T135791:0|t[|cRXP_FRIENDLY_和谐顿悟|r]|cRXP_WARN_来训练|r|T237549:0|t[意外收获] << Priest
.train 410010 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r]|cRXP_WARN_来训练|r|T134596:0|t[雕纹长裤 - 神圣献祭] << Paladin
.train 401761 >>|cRXP_WARN_购买并使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:时光倒流|r]|cRXP_WARN_以训练|r|T237538:0|t[时光倒流] << Mage
.train 410122 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_孤狼符文|r]|cRXP_WARN_来训练|r|T132266:0|t[孤狼] << Hunter
.train 416042 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_生存符文|r]|cRXP_WARN_来训练|r|T132126:0|t[适者生存] << Druid
.train 425445 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_战争使者符文|r]|cRXP_WARN_用于训练|r|T236319:0|t[战争使者] << Warrior
.train 425476 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_契约符文|r]|cRXP_WARN_来学习|r|T237562:0|t[恶魔契约] << Warlock
.train 424990 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_钝刺符文|r]|cRXP_WARN_来训练|r|T237531:0|t[钝刺] << Rogue
.train 410096 >>|cRXP_WARN_购买并使用|r|T134419:0|t[|cRXP_FRIENDLY_双持专精符文|r]|cRXP_WARN_以训练|r|T132686:0|t[刻印胸甲 - 双持专精] << Shaman
.target Grizzby
.train 415995,1 << Priest
.train 410010,1 << Paladin
.train 401761,1 << Mage
.train 410122,1 << Hunter
.train 416042,1 << Druid
.train 425445,1 << Warrior
.train 425476,1 << Warlock
.train 424990,1 << Rogue
.train 410096,1 << Shaman
step
.goto The Barrens,65.84,43.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦·星眼|r交谈
.turnin 874 >>交任务: |cRXP_FRIENDLY_玛伦·星眼|r
.accept 873 >>接任务: |cRXP_LOOT_依沙瓦克|r
.target Mahren Skyseer
step
#loop
.goto The Barrens,65.67,46.63,0
.goto The Barrens,64.74,50.35,0
.goto The Barrens,63.60,53.54,0
.goto The Barrens,65.77,45.28,50,0
.goto The Barrens,65.67,46.63,50,0
.goto The Barrens,64.74,50.35,50,0
.goto The Barrens,63.60,53.54,50,0
>>击杀|cRXP_ENEMY_依沙瓦克|r. 击杀后搜刮其掉落的|cRXP_LOOT_依沙瓦克的心脏|r
>>|cRXP_WARN_他有四个不同的刷新点, 分布在海岸沿线|r
.complete 873,1 
.unitscan Isha Awak
step
#label BarrensEnd
.goto The Barrens,65.84,43.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦·星眼|r交谈
.turnin 873 >>交任务: |cRXP_FRIENDLY_依沙瓦克|r
.target Mahren Skyseer
step
#label LeaveRatchet
.goto The Barrens,63.09,37.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
.fly Orgrimmar >>飞往奥格瑞玛
.target Bragok
.zoneskip Orgrimmar
step << Warlock
.goto Orgrimmar,48.25,45.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gan'rul|r 交谈
.trainer >>训练你的职业法术
.turnin 1512 >>交任务: |cRXP_FRIENDLY_爱的礼物|r
.accept 1513 >>接任务: |cRXP_LOOT_誓缚|r
.target Gan'rul Bloodeye
step << Warlock
#completewith next
.cast 9224 >>在召唤法阵使用 |T133290:0|t[多格兰的吊坠]
.use 6626
step << Warlock
.goto Orgrimmar,49.66,50.15
>>击杀召唤的魅魔|r
.complete 1513,1 
.mob Summoned Succubus
.use 6626
step << Warlock
.goto Orgrimmar,48.25,45.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gan'rul|r 交谈
.turnin 1513 >>交任务: |cRXP_FRIENDLY_誓缚|r
.target Gan'rul Bloodeye
step << Mage
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 2121 >>训练你的职业法术
.target Pephredo
.xp <24,1
.xp >26,1
step << Mage
#optional
.goto Orgrimmar,38.36,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
.train 120 >>训练你的职业法术
.target Pephredo
.xp <26,1
step << Mage
.goto Orgrimmar,38.66,85.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|r |cRXP_FRIENDLY_索乌|r 交谈
.train 3567 >>坐火车 |T135759:0|t[传送:奥格瑞玛]
.target Thuul
step << Troll Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.turnin 5642 >>交任务: |cRXP_FRIENDLY_暗影守卫|r
.trainer >>训练你的职业法术
.target Ur'kyo
.isOnQuest 5642
step << Troll Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.turnin 5680 >>交任务: |cRXP_FRIENDLY_暗影守卫|r
.trainer >>训练你的职业法术
.target Ur'kyo
.isQuestAvailable 5680
step << Undead Priest
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 3747 >>训练你的职业法术
.target Ur'kyo
.xp <24,1
.xp >26,1
step << Undead Priest
#optional
.goto Orgrimmar,35.59,87.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
.train 992 >>训练你的职业法术
.target Ur'kyo
.xp <26,1
step << Priest/Warlock
.goto Orgrimmar,44.16,48.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈. 从她那里购买|r|T135139:0|t[燃烧魔杖]|r
.collect 5210,1 
.money <0.5808
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
.target Katis
step << Shaman
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 905 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <24,1
.xp >26,1
step << Shaman
#optional
.goto Orgrimmar,38.82,36.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
.train 943 >>训练你的职业法术
.target Kardris Dreamseeker
.xp <26,1
step << Rogue
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 6762 >>训练你的职业法术
.target Ormok
.xp <24,1
.xp >26,1
step << Rogue
#optional
.goto Orgrimmar,43.90,54.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
.train 1833 >>训练你的职业法术
.target Ormok
.xp <26,1
step << Warrior
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 5308 >>训练你的职业法术
.target Grezz Ragefist
.xp <24,1
.xp >26,1
step << Warrior
#optional
.goto Orgrimmar,79.91,31.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
.train 6178 >>训练你的职业法术
.target Grezz Ragefist
.xp <26,1
step << Troll Warrior/Undead Warrior/Tauren Warrior
.goto Orgrimmar,81.52,19.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
.train 197 >>训练双手斧
.target Hanashi
step << Hunter
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 14262 >>训练你的职业法术
.target Ormak Grimshot
.xp <24,1
.xp >26,1
step << Hunter
#optional
.goto Orgrimmar,66.05,18.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
.train 3045 >>训练你的职业法术
.target Ormak Grimshot
.xp <26,1
step << Hunter
.goto Orgrimmar,66.34,14.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
.train 24558 >>训练你的宠物法术
.target Xao'tsu
.xp <24,1
step << Hunter
#ah
.goto Orgrimmar,78.11,38.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jin'sora|r交谈
.vendor >>|cRXP_BUY_如果有的话, 从她那里购买 a|r|T135495:0|t[强韧的弯弓]|r
.itemStat 18,QUALITY,<7
.itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.9
.target Jin'sora
.money <1.9467
step << Hunter
.goto Orgrimmar,78.08,38.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
>>|cRXP_BUY_从他那里购买|r |T132382:0|t[锋利的箭] |r
.collect 2515,1800 << Hunter 
.target Jin'sora
.itemcount 2515,<1000
.xp >25,1
step << Hunter
.goto Orgrimmar,78.08,38.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Jin'sora交谈|r
>>|cRXP_BUY_从他那里购买|r|T132382:0|t[锐锋箭]|r
.collect 3030,1800 << Hunter 
.target Jin'sora
.xp <25,1
.itemcount 3030,<1000
step
#season 2
#completewith BuyBook
.goto Orgrimmar,38.923,38.398,60 >>前往智慧谷中的|cRXP_FRIENDLY_佐尔·孤树|r
step
#season 2
.goto Orgrimmar,38.923,38.398
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐尔·孤树|r交谈
>>|cRXP_WARN_这些书的等级要求为25级, 记得升到25级后使用|r
>>|cRXP_WARN_购买|r|T133735:0|t|cRXP_LOOT_[重定向手册]|r|cRXP_WARN_以学习|r|T135425:0|t[重定向] << Rogue
>>|cRXP_WARN_购买|r|T133736:0|t|cRXP_LOOT_[扩展智力之书]|r|cRXP_WARN_以学习|r|T236513:0|t[扩展智力] << Mage
>>|cRXP_WARN_购买|r|T134914:0|t|cRXP_LOOT_[更深处的荒野指南]|r|cRXP_WARN_以了解|r|T132124:0|t[更深处的荒野] << Druid
>>|cRXP_WARN_购买|r|T134914:0|t|cRXP_LOOT_[增强恢复传单]|r|cRXP_WARN_以学习|r|T136073:0|t[增强恢复] << Druid
>>|cRXP_WARN_购买|r|T134914:0|t|cRXP_LOOT_[复活传单]|r|cRXP_WARN_以学习|r|T132132:0|t[复活] << Druid
>>|cRXP_WARN_购买|r|T133739:0|t|cRXP_LOOT_[狮子之心论文]|r|cRXP_WARN_以学习|r|T132185:0|t[狮子之心] << Hunter
>>|cRXP_WARN_购买|r|T133739:0|t|cRXP_LOOT_[毒蛇之论]|r|cRXP_WARN_以学习|r|T132160:0|t[毒蛇之相] << Hunter
>>|cRXP_WARN_购买|r|T133745:0|t|cRXP_LOOT_[驱魔师的遗嘱]|r|cRXP_WARN_以学习|r|T135956:0|t[驱魔师] << Paladin
>>|cRXP_WARN_购买|r|T133745:0|t|cRXP_LOOT_[殉难遗嘱]|r|cRXP_WARN_以学习|r|T135961:0|t[殉难印记] << Paladin
>>|cRXP_WARN_购买|r|T133745:0|t|cRXP_LOOT_[强化祝福的证明]|r|cRXP_WARN_以学习|r|T236248:0|t[强化祝福] << Paladin
>>|cRXP_WARN_购买|r |T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r |cRXP_WARN_以学习|r |T136199:0|t[暗影魔] << Priest
>>|cRXP_WARN_购买|r|T237162:0|t|cRXP_LOOT_[坚韧增强卷轴]|r|cRXP_WARN_以学习|r|T237543:0|t[坚韧增强] << Priest
>>|cRXP_WARN_购买|r|T133733:0|t|cRXP_LOOT_[灵魂收割魔典]|r|cRXP_WARN_以学习|r|T132851:0|t[灵魂收割] << Warlock
>>|cRXP_WARN_购买|r|T133733:0|t|cRXP_LOOT_[传送门召唤法典]|r|cRXP_WARN_学习|r|T134423:0|t[传送门] << Warlock
>>|cRXP_WARN_购买|r |T133741:0|t|cRXP_LOOT_[指挥怒吼手册]|r |cRXP_WARN_以学习|r |T132351:0|t[指挥怒吼] << Warrior
>>|cRXP_WARN_购买|r |T133747:0|t|cRXP_LOOT_[萨满狂怒启示]|r |cRXP_WARN_以学习|r |T136088:0|t[萨满狂怒] << Shaman
>>|cRXP_WARN_购买|r|T133747:0|t|cRXP_LOOT_[图腾投影启示]|r|cRXP_WARN_以学习|r|T310733:0|t[图腾投影] << Shaman
.collect 216738,1 << Rogue 
.collect 216740,1 << Mage 
.collect 216744,1 << Priest 
.collect 216745,1 << Priest 
.collect 216746,1 << Warrior 
.collect 216747,1 << Warlock 
.collect 216748,1 << Warlock 
.collect 216764,1 << Druid 
.collect 216767,1 << Druid 
.collect 216768,1 << Paladin 
.collect 226400,1 << Paladin 
.collect 226398,1 << Paladin 
.collect 216770,1 << Hunter 
.collect 226401,1 << Hunter 
.collect 216769,1 << Shaman 
.collect 226402,1 << Shaman 
.collect 216771,1 << Druid 
.target Zor Lonetree
.xp >25,1
step
#season 2
#label BuyBook
.goto Orgrimmar,38.923,38.398
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐尔·孤树|r交谈
.train 438040 >>|cRXP_WARN_购买并使用|r|T133735:0|t|cRXP_LOOT_[重定向手册]|r|cRXP_WARN_来学习|r|T135425:0|t[重定向] << Rogue
.train 436949 >>|cRXP_WARN_购买并使用|r|T133736:0|t|cRXP_LOOT_[扩展智力之书]|r|cRXP_WARN_来学习|r|T236513:0|t[扩展智力] << Mage
.train 436956 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[更深处的荒野]手册|r|cRXP_WARN_来学习|r|T132124:0|t[更深处的荒野] << Druid
.train 417123 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[增强恢复卷轴]|r|cRXP_WARN_学习|r|T136073:0|t[增强恢复] << Druid
.train 437138 >>|cRXP_WARN_购买并使用|r|T134914:0|t|cRXP_LOOT_[复活传单]|r|cRXP_WARN_来学习|r|T132132:0|t[复活] << Druid
.train 409580 >>|cRXP_WARN_购买并使用|r|T133739:0|t|cRXP_LOOT_[狮子之心论文]|r|cRXP_WARN_来学习|r|T132185:0|t[狮子之心] << Hunter
.train 415423 >>|cRXP_WARN_购买并使用|r|T133739:0|t|cRXP_LOOT_[蛇相论典]|r|cRXP_WARN_以学习|r|T132160:0|t[蛇相] << Hunter
.train 415076 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[驱魔师的证言]|r|cRXP_WARN_以学习|r|T135956:0|t[驱魔师] << Paladin
.train 407798 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[殉难证明]|r|cRXP_WARN_来学习|r|T135961:0|t[殉难印记] << Paladin
.train 435984 >>|cRXP_WARN_购买并使用|r|T133745:0|t|cRXP_LOOT_[强化祝福的证物]|r|cRXP_WARN_学习|r|T236248:0|t[强化祝福] << Paladin
.train 401977 >>|cRXP_WARN_购买并使用|r|T237162:0|t|cRXP_LOOT_[暗影魔卷轴]|r|cRXP_WARN_来学习|r|T136199:0|t[暗影魔] << Priest
.train 436951 >>|cRXP_WARN_购买并使用|r|T237162:0|t|cRXP_LOOT_[坚韧增强卷轴]|r|cRXP_WARN_以学习|r|T237543:0|t[坚韧增强] << Priest
.train 437032 >>|cRXP_WARN_购买并使用|r|T133733:0|t|cRXP_LOOT_[灵魂收割魔典]|r|cRXP_WARN_以学习|r|T132851:0|t[灵魂收割] << Warlock
.train 437169 >>|cRXP_WARN_购买并使用|r|T133733:0|t|cRXP_LOOT_[召唤之门魔典]|r|cRXP_WARN_学习|r|T134423:0|t[召唤之门] << Warlock
.train 403215 >>|cRXP_WARN_购买并使用|r|T133741:0|t|cRXP_LOOT_[指挥怒吼手册]|r|cRXP_WARN_以学习|r|T132351:0|t[指挥怒吼] << Warrior
.train 425336 >>|cRXP_WARN_购买并使用|r|T133747:0|t|cRXP_LOOT_[萨满之怒启示]|r|cRXP_WARN_来学习|r|T136088:0|t[萨满之怒] << Shaman
.train 437009 >>|cRXP_WARN_购买并使用|r|T133747:0|t|cRXP_LOOT_[图腾投影启示]|r|cRXP_WARN_来学习|r|T310733:0|t[图腾投影] << Shaman
.use 216738 << Rogue 
.use 216740 << Mage 
.use 216744 << Priest 
.use 216745 << Priest 
.use 216746 << Warrior 
.use 216747 << Warlock 
.use 216748 << Warlock 
.use 216764 << Druid 
.use 216767 << Druid 
.use 216768 << Paladin 
.use 226400 << Paladin 
.use 226398 << Paladin 
.use 216770 << Hunter 
.use 226401 << Hunter 
.use 216769 << Shaman 
.use 226402 << Shaman 
.use 216771 << Druid 
.target Zor Lonetree
.xp <25,1
step << Shaman
#xprate >1.99
#season 2
.equip 18,206387 >>|cRXP_WARN_装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r
.use 206387
.itemcount 206387,1 
.train 410095,1
step << Shaman
#xprate >1.99
#season 2
.goto Orgrimmar,52.77,48.97
.subzone 2437 >>进入暗影裂口内的怒焰裂谷
.itemStat 18,QUALITY,2
.train 410095,1
step << Shaman
#xprate >1.99
#season 2
>>|cRXP_WARN_紧贴右侧墙壁. 走过斜坡后(就在第5个怪物之后), 进入你右侧的浅熔岩池|r
>>|cRXP_WARN_受到的伤害从|r|T135805:0|t[熔岩]|cRXP_WARN_减少至91, 同时装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r|cRXP_WARN_时也会生效|r
.aura 408828 >>|cRXP_WARN_受到 |T135805:0|t[熔岩]|cRXP_WARN_source 伤害 5 次|r
.itemStat 18,QUALITY,2
.train 410095,1
step << Shaman
#xprate >1.99
#season 2
>>|cRXP_WARN_离开|r|T135805:0|t[熔岩]
.cast 402265 >>|cRXP_WARN_使用|r |T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r |cRXP_WARN_来学习|r |T133816:0|t[雕纹手套 - 熔岩爆裂]
.use 206387
.aura -408828
.itemStat 18,QUALITY,2
.train 410095,1
step
#ah
.goto Orgrimmar,55.59,62.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
>>|cRXP_BUY_购买|r|T134332:0|t[碎纸机操作手册页]|cRXP_BUY_从拍卖行(如果可用)|r 
.target Auctioneer Thathung
.collect 16645,1,6504,1 
.collect 16646,1,6504,1 
.collect 16647,1,6504,1 
.collect 16648,1,6504,1 
.collect 16649,1,6504,1 
.collect 16650,1,6504,1 
.collect 16651,1,6504,1 
.collect 16652,1,6504,1 
.collect 16653,1,6504,1 
.collect 16654,1,6504,1 
.collect 16655,1,6504,1 
.collect 16656,1,6504,1 
step << Hunter
#xprate <2.1
.goto Orgrimmar,45.12,63.89
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
.fly Splintertree Post >>飞往裂枝岗哨
.target Doras
.zoneskip Thunder Bluff
step
#xprate >2.09 << Hunter
#completewith next
.goto Orgrimmar,26.22,61.58,80,0
.goto Orgrimmar,15.66,63.33,30,0
.zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
.zoneskip The Barrens
.zoneskip Ashenvale
step
#xprate >2.09 << Hunter
#completewith next
.goto Kalimdor,56.80,45.45,15,0
.goto Ashenvale,94.54,76.15,40,0
.goto Ashenvale,93.49,73.76,40,0
.goto Ashenvale,92.47,71.18,40,0
.goto Ashenvale,91.85,68.71,40,0
.goto Ashenvale,91.39,65.86,25 >>沿着河流向北前往灰谷
step
#xprate >2.09 << Hunter
.goto Ashenvale,89.87,68.07,40,0
.goto Ashenvale,86.89,68.65,40,0
.goto Ashenvale,79.89,68.38,40,0
.goto Ashenvale,73.52,63.50,30 >>前往裂树岗哨
>>|cRXP_WARN_你可能会遇到一些29至30级的怪物, 如果可能的话请避开它们|r
]])
