RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 亡灵起始区
#name 1 亡灵起始区
#displayname Chapter 1 - Deathknell
#next 2 亡灵永歌森林
#defaultfor Undead !DK

<< Horde

step << Undead
    .zoneskip 1727
    #completewith TirisfalFistQuestCheck
    +欢迎来到 RestedXP 的 |cfff78300Undead Starting Zone Guide|r。
    *This route is up to 50% slower than |cfff78300Exiles Reach|r regardless of the available consumables/heirlooms. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
step << Undead
    .zoneskip 1727,1
    +您位于流放区，但当前指南适用于亡灵起始区。
    +请选择流放者范围指南。
step
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以对目标执行此操作。|r
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label TirisfalFistQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿加莎|r
    .goto 465,40.8,78.5
    .accept 24959 >>接任务: |cRXP_WARN_从墓穴中醒来|r
    .target Agatha
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_送葬者摩尔多|r
    .goto 465,43.4,79.9
    .turnin 24959 >>交任务: |cRXP_FRIENDLY_从墓穴中醒来|r
    .accept 28608 >>接任务: |cRXP_WARN_灰影墓穴|r
    .target Undertaker Mordo
step
    >>|cRXP_WARN_按照箭头指向的坟墓|r 并拾取 |cRXP_LOOT_twine|r 和 |cRXP_LOOT_fluid|r
    .goto 18,30.33,72.24,4,0
    .goto 18,30.32,72.84,4,0
    .goto 18,30.00,72.84,4,0
    .goto 18,29.7,72.0
    .complete 28608,2 --1/1 Corpse-Stitching Twine
    .complete 28608,1 --1/1 Thick Embalming Fluid
step
    #completewith next
    .goto 18,30.00,72.84,4,0
    .goto 18,30.32,72.84,4 >>离开坟墓
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_送葬者摩尔多|r
    .goto 465,43.4,79.9
    .turnin 28608 >>交任务: |cRXP_FRIENDLY_灰影墓穴|r
    .accept 26799 >>接任务: |cRXP_WARN_不可拯救的死者|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员凯斯|r
    .goto 465,45.91,80.46
    .accept 24960 >>接任务: |cRXP_WARN_苏醒|r
step
    #sticky
    #label tirisfal26799
    >>在与亡灵交谈时杀死 |cRXP_ENEMY_无脑僵尸s|r
    .goto 465,44.4,73.9,0,0
    .complete 26799,1 --6/6 无脑僵尸 slain
    .mob 无脑僵尸
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官雷德帕斯|r
    .goto 465,46.6,71.1
    .skipgossip
    .complete 24960,2 --1/1 Speak with Marshal Redpath
    .target Marshal Redpath
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莉莉安·沃斯|r
    .goto 465,44.2,70.6
    .skipgossip
    .complete 24960,1 --1/1 Speak with Lilian Voss
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦德雷·莫莱|r
    .goto 465,40.7,73.0
    .skipgossip
    .complete 24960,3 --1/1 Speak with Valdred Moray
    .target Valdred Moray
step
    #requires tirisfal26799
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_送葬者摩尔多|r
    .goto 465,43.43,79.91
    .turnin 26799 >>交任务: |cRXP_FRIENDLY_不可拯救的死者|r
    .target Undertaker Mordo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员凯斯|r
    .goto 465,45.9,80.5
    .turnin 24960 >>交任务: |cRXP_FRIENDLY_苏醒|r
    .accept 25089 >>接任务: |cRXP_WARN_走出墓穴|r
    .target Caretaker Caice
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影牧师萨维斯|r
    .goto 465,49.08,58.83,5,0
    .goto 465,46.6,58.8
    .accept 26801 >>接任务: |cRXP_WARN_境内的天灾|r
    .target Shadow Priest Sarvis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亡灵卫兵萨尔坦|r
    .goto 465,49.08,58.83,5,0
    .goto 465,49.90,56.38
    .turnin 25089 >>交任务: |cRXP_FRIENDLY_走出墓穴|r
    .accept 26800 >>接任务: |cRXP_WARN_清扫战场|r
    .target 死亡守卫萨尔坦
step << Warlock
    #completewith next
    +|cRXP_WARN_提醒：使用 |T136218:0|t[召唤小鬼] 召唤你的宠物|r
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Wretched Ghouls|r 和 |cRXP_ENEMY_Rattlecage Skeletons|r
    .goto 465,51.61,47.23,0,0
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Wretched Ghoul
    .mob Rattlecage Skeleton
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Scarlet Corpses|r。|cRXP_WARN_等待 Darneli 捡起尸体后再点击下一个|r
    .goto 465,47.58,48.29,15,0
    .goto 465,54.14,43.99,15,0
    .goto 465,53.74,51.00,10,0
    .goto 465,47.58,48.29
    .complete 26800,1 --6/6 Scarlet Corpses gathered
    .target Scarlet Corpse
step
    >>杀死 |cRXP_ENEMY_Wretched Ghouls|r 和 |cRXP_ENEMY_Rattlecage Skeletons|r
    .goto 465,51.61,47.23
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Wretched Ghoul
    .mob Rattlecage Skeleton
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亡灵卫兵萨尔坦|r
    .goto 465,49.9,56.7
    .turnin 26800 >>交任务: |cRXP_FRIENDLY_清扫战场|r
    .target 死亡守卫萨尔坦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影牧师萨维斯|r
    .goto 465,46.6,58.8
    .turnin 26801 >>交任务: |cRXP_FRIENDLY_境内的天灾|r
    .accept 28651 >>接任务: |cRXP_WARN_新兵艾尔雷斯|r
    .target Shadow Priest Sarvis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_新兵艾尔雷斯|r
    .goto 465,46.8,58.2
    .turnin 28651 >>交任务: |cRXP_FRIENDLY_新兵艾尔雷斯|r
    .accept 24961 >>接任务: |cRXP_WARN_墓中的真相|r
    .target Novice Elreth
step
    --TODO: Add gossipoption
    .goto 465,52.38,56.41,2,0
    .goto 465,54.36,56.96,6,0
    .goto 465,46.75,58.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入房子并与 |cRXP_FRIENDLY_Lilian Voss|r 交谈。 
    >>|cRXP_WARN_她可以在楼下或楼上。与她交谈后（在角色扮演期间），你就可以离开房子并返回 |cRXP_FRIENDLY_Novice Elreth|r|r
    .skipgossip
    .complete 24961,1 --1/1 Show Lilian her reflection
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_新兵艾尔雷斯|r
    .goto 465,46.7,58.2
    .turnin 24961 >>交任务: |cRXP_FRIENDLY_墓中的真相|r
    .accept 28672 >>接任务: |cRXP_WARN_战场上的执行官|r
    .target Novice Elreth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_执行官阿伦|r
    .goto 465,55.5,37.8
    .turnin 28672 >>交任务: |cRXP_FRIENDLY_战场上的执行官|r
    .accept 26802 >>接任务: |cRXP_LOOT_被诅咒者|r
    .target 执行官阿伦
step << Hunter
    #completewith next
    .cast 1515 >>驯服一只 |cRXP_ENEMY_衣衫褴褛的清道夫|r
    .mob 衣衫褴褛的清道夫
step
    >>杀死你周围的 |cRXP_ENEMY_肮脏的杜斯克巴特s|r 和 |cRXP_ENEMY_Ragged Savengers|r。掠夺他们的 |cRXP_LOOT_paws|r 和 |cRXP_LOOT_wings|r
    .goto 465,63.26,27.68,15,0
    .goto 465,64.45,22.78,15,0
    .goto 465,59.24,21.36,25,0
    .goto 465,49.41,21.94
    .complete 26802,1 --4/4 Scavenger Paw
    .complete 26802,2 --4/4 Duskbat Wing
    .mob 肮脏的杜斯克巴特
    .mob 衣衫褴褛的清道夫
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_执行官阿伦|r
    .goto 465,55.5,37.7
    .turnin 26802 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 24973 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .target 执行官阿伦
step
    #completewith next
    >>在前往矿井的路上杀死一些|cRXP_ENEMY_Young Night Web Spiders|r
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    >>杀死矿井内的 |cRXP_ENEMY_Night Web Spiders|r
    .goto 465,30.18,30.58,10,0
    .goto 466,62.9,58.0,10,0
    .goto 466,45.27,69.84,10,0
    .goto 466,48.41,51.43,10,0
    .goto 466,62.09,58.59,10,0
    .complete 24973,2 --5/5 Night Web Spider slain
    .mob Night Web Spider
step
    >>离开矿井并杀死剩余的|cRXP_ENEMY_Young Night Web Spiders|r
    .goto 465,37.36,26.16
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_执行官阿伦|r
    .goto 465,55.5,37.8
    .turnin 24973 >>交任务: |cRXP_FRIENDLY_夜行蜘蛛洞穴|r
    .accept 24970 >>接任务: |cRXP_WARN_跟僵尸一样烂|r
    .target 执行官阿伦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达内尔|r
    .goto 465,67.1,42.4
    .turnin 24970 >>交任务: |cRXP_FRIENDLY_跟僵尸一样烂|r
    .accept 24971 >>接任务: |cRXP_WARN_袭击腐脑营地|r
    .target Darnell
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Rotbrain Berserker|r 和 |cRXP_ENEMY_Rotbrain Magus'|r。|cRXP_WARN_Focus 已经在战斗的亡灵|r
    .goto 465,74.1,66.0,0,0
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Berserker
    .mob Robrain Magus
step
    >>杀死 |cRXP_ENEMY_Marshal Redpath|r
    .goto 465,70.08,69.65
    .complete 24971,1 --1/1 Marshal Redpath slain
    .mob Marshal Redpath
step
    >>杀死 |cRXP_ENEMY_Rotbrain Berserker|r 和 |cRXP_ENEMY_Rotbrain Magus'|r。|cRXP_WARN_Focus 已经在战斗的亡灵|r
    .goto 465,74.1,66.0
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Berserker
    .mob Robrain Magus
step
    .isOnQuest 24971
    >>跟随箭头，寻找稀有的 Fangor。从他身上搜刮来一个 |cRXP_LOOT_bag|r。
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗影牧师萨维斯|r
    .goto 465,61.88,82.00,5,0
    .goto 465,62.58,78.73,5,0
    .goto 465,46.6,58.8
    .turnin 24971 >>交任务: |cRXP_FRIENDLY_袭击腐脑营地|r
    .accept 24972 >>接任务: |cRXP_LOOT_重要情报|r
    .target Shadow Priest Sarvis
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#name 2 亡灵永歌森林
#displayname Chapter 2 - Eversong Woods
#next RestedXP 部落 10-60\\1 BfA 简介
#subgroup 亡灵起始区
#defaultfor Undead !DK

<< Horde

step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[Gunshoes]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跑去和 |cRXP_FRIENDLY_Deathguard Simmer|r 交谈
    .isQuestComplete 24972
    .goto 465,77.35,17.75,20,0
    .goto 18,44.75,53.67
    .turnin 24972 >>交任务: |cRXP_FRIENDLY_重要情报|r
    .target Deathguard Simmer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亡灵卫兵希米尔|r, |cRXP_FRIENDLY_药剂师乔汉|r
    .accept 24978 >>接任务: |cRXP_WARN_收割收割者|r
    .goto 18,44.75,53.67
    .accept 24975 >>接任务: |cRXP_LOOT_悲伤之地|r
    .goto 18,44.61,53.79
    .target Deathguard Simmer
    .target Apothecary Johaan
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼和 |cRXP_FRIENDLY_Sedrick Calston|r 交谈
    .goto 18,44.48,53.86,4,0
    .goto 18,44.74,53.65
    .accept 24974 >>接任务: |cRXP_WARN_从未如此孤单|r
    .target Sedrick Calston
step
    #completewith next
    .goto 18,40.33,51.42,0
    .goto 18,40.33,51.42,10 >>检查可能的胸部
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Tirisfal 农民|r
    >>留意稀有物品 |cRXP_ENEMY_Shadowstalker|r 和 |cRXP_ENEMY_Farmer Solliden|r。
    .link https://i.imgur.com/lc7y3b4.jpeg >>你可以从屏幕截图中显示的位置攻击|cRXP_ENEMY_Shadowstalker|r
    .goto 18,40.33,51.42,0
    .goto 18,37.91,51.27,0,0
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拿起|cRXP_LOOT_提里法南瓜|r
    .goto 18,36.82,51.45,20,0
    .goto 18,35.57,51.12,20,0
    .goto 18,36.68,49.50,20,0
    .goto 18,36.48,50.85
    .complete 24975,1 --10/10 Tirisfal Pumpkin
step
    >>杀死 |cRXP_ENEMY_Tirisfal 农民|r
    >>留意稀有物品 |cRXP_ENEMY_Shadowstalker|r 和 |cRXP_ENEMY_Farmer Solliden|r
    .goto 18,40.33,51.42,0
    .goto 18,37.91,51.27,0,0
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step << Warlock/Hunter
    #completewith next
    +|cfff78300点击宠物栏或宠物标签中的法术书中的“被动”按钮，将宠物设置为被动|r
step
    >>攻击 |cRXP_ENEMY_Vile Fin Murloc|r 直到它逃跑然后使用 |T133802:0|t[Murloc Leash]。|cRXP_WARN_你不能杀死它|r
    >>寻找稀有的|cRXP_ENEMY_Muad|r
    .use 52059
    .goto 18,35.8,43.4
    .complete 24974,1 --1/1 Vile Fin captured
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Puddlejumper
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒：将您的宠物设置回“协助”|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亡灵卫兵希米尔|r, |cRXP_FRIENDLY_药剂师乔汉|r
    >>回程时注意 |cRXP_ENEMY_Bayne|r
    .goto 18,45.30,49.37,15,0
    .unitscan Bayne
    .turnin 24978 >>交任务: |cRXP_FRIENDLY_收割收割者|r
    .goto 18,44.75,53.68
    .turnin 24975 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .goto 18,44.61,53.78
    .target Deathguard Simmer
    .target Apothecary Johaan
step
    >>上楼归还鱼人
    .goto 18,44.48,53.86,4,0
    .goto 18,44.76,53.56
    .complete 24974,2 --1/1 Vile Fin returned
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞德里克·卡尔斯通|r
    .goto 18,44.75,53.65
    .turnin 24974 >>交任务: |cRXP_FRIENDLY_从未如此孤单|r
    .target Sedrick Calston
step
    #completewith next
    .goto 18,44.46,53.30,5,0
    .goto 18,44.07,58.24
    .deathskip >>拉一些怪物然后死亡跳跃到布瑞尔
step
    #completewith next
    .goto 18,60.81,51.93,5,0
    .goto 18,60.87,51.51
    .home >>将你的炉石设为 Brill
step
    .zoneskip 18,1
    >>前往银月城：
    .goto 18,60.98,58.84,6,0
    .goto 18,61.52,59.01,6,0
    .goto 18,60.73,58.68
    .zone 85 >>1) 爬上塔，通过传送门前往奥格瑞玛
step
    .goto 85,56.03,88.28
    .zone 110 >>2) 通过传送门前往银月城
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>在银月城使用 |T1405809:0|t[Gunshoes]
step
    #completewith next
    .goto 110,57.57,24.59,5,0
    .goto 110,75.57,59.24,15,0
    .goto 110,73.52,59.20,15,0
    .goto 94,56.43,50.12
    .goto 94,54.4,50.7
    .fp >>获取永歌森林飞行路线
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_游侠杰拉|r
    .goto 94,50.33,50.77
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target 8475
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒：死亡跳跃后重新召唤你的宠物|r
step
    >>杀死 |cRXP_ENEMY_Plaguebone Pillagers|r
    .goto 94,50.17,55.05
    .complete 8475,1 --8/8 Plaguebone Pillager slain
    .mob Plaguebone Pillager
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_游侠杰拉|r
    .goto 94,50.33,50.77
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_飞行管理员斯凯勒斯|r
    .goto 94,46.55,49.08,10,0
    .goto 94,46.24,46.79
    .fp >>获取鹰翼方形飞行路径
    .target Skymaster Skyles
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师亚隆尼斯|r
    .goto 94,47.26,46.32
    .accept 8472 >>接任务: |cRXP_LOOT_失效的傀儡|r
    .target Magister Jaronis
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与通缉板互动
    .goto 94,48.16,46.31
    .accept 8468 >>接任务: |cRXP_WARN_通缉：饥饿者泰里斯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔杜·炙痕|r
    .goto 94,48.17,46.0
    .accept 8463 >>接任务: |cRXP_LOOT_不稳定的法力水晶|r
    .target Aeldon Sunbrand
step
    #completewith next
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_LOOT_Unstable Mana Crystal Crates|r 来收集它们
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Acrane Patrollers|r。掠夺他们的 |cRXP_LOOT_cores|r
    .goto 94,46.94,44.59,15,0
    .goto 94,47.69,39.02,15,0
    .goto 94,47.11,37.44,15,0
    .goto 94,46.53,35.16,30,0
    .complete 8472,1 --6/6 Arcane Core
    .mob Arcane Patroller
step
    >>杀死 |cRXP_ENEMY_Thaelis|r。夺取他的 |cRXP_LOOT_head|r
    .goto 94,45.36,38.12,5,0
    .goto 94,45.01,37.68
    .complete 8468,1 --1/1 Thaelis' Head
    .mob Thaelis
step
    >>杀死 |cRXP_ENEMY_Acrane Patrollers|r。掠夺他们的 |cRXP_LOOT_cores|r
    .goto 94,45.39,40.64,20,0
    .goto 94,42.18,40.59
    .complete 8472,1 --6/6 Arcane Cores
    .mob Arcane Patroller
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_LOOT_Unstable Mana Crystal Crates|r 来收集它们
    .goto 94,45.13,40.71,18,0
    .goto 94,46.01,43.29,25,0
    .goto 94,46.92,44.57,10,0
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔杜·炙痕|r
    .goto 94,48.17,46.0
    .turnin 8463 >>交任务: |cRXP_FRIENDLY_不稳定的法力水晶|r
    .accept 9352 >>接任务: |cRXP_LOOT_达纳苏斯的侵扰|r
    .target Aeldon Sunbrand
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_坎雷中士|r
    .goto 94,47.77,46.58
    .turnin 8468 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者泰里斯|r
    .target Sergeant Kan'ren
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师亚隆尼斯|r
    .goto 94,47.26,46.30
    .turnin 8472 >>交任务: |cRXP_FRIENDLY_失效的傀儡|r
    .accept 8895 >>接任务: |cRXP_LOOT_送往北部圣殿的信|r
    .target Magister Jaronis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔网监护者凯丹尼斯|r
    .goto 94,44.63,53.13
    .turnin 8895 >>交任务: |cRXP_FRIENDLY_送往北部圣殿的信|r
    .accept 9119 >>接任务: |cRXP_LOOT_西部圣殿的麻烦|r
    .target Ley-Keeper Caidanis
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[Gunshoes]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔网监护者凯丹尼斯|r
    .goto 94,36.7,57.44
    .turnin 9119 >>交任务: |cRXP_FRIENDLY_西部圣殿的麻烦|r
    .accept 8486 >>接任务: |cRXP_LOOT_不稳定的奥术|r
    .target Ley-Keeper Caidanis
    step
    #completewith next
    >>杀死一名 |cRXP_ENEMY_Darnassian Scout|r。从他身上搜刮 |cRXP_LOOT_Incriminating Documents|r。点击背包中的文件
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>杀死 |cRXP_ENEMY_法力追猎者|r 和 |cRXP_ENEMY_魔灵s|r
    .goto 94,33.69,61.69,15,0
    .goto 94,34.50,57.84,20,0
    .goto 94,35.66,58.00
    .complete 8486,2 --5/5 法力追猎者 slain
    .complete 8486,1 --5/5 魔灵 slain
    .mob 法力追猎者
    .mob 魔灵
step
    >>杀死一名 |cRXP_ENEMY_Darnassian Scout|r。从他身上搜刮 |cRXP_LOOT_Incriminating Documents|r。点击背包中的文件
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔网监护者薇兰妮亚|r
    .goto 94,36.7,57.44
    .turnin 8486 >>交任务: |cRXP_FRIENDLY_不稳定的奥术|r
    .turnin 9352 >>交任务: |cRXP_FRIENDLY_达纳苏斯的侵扰|r
    .target Ley-Keeper Velania
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将你的宠物设置为“被动”|r
step
    #completewith next
    .goto 94,35.46,57.41
    .deathskip >>拉一些怪物，死后复活到灵魂治疗师那里
step
    .xp <10-1600,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师兰德拉·晨行者|r
    .goto 94,44.03,70.76
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .target Magistrix Landra Dawnstrider
    step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_提醒：重新召唤你的宠物并将其设置为“辅助”|r
step
    .isOnQuest 9254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学徒米尔维达|r
    .goto 94,54.28,70.98
    .turnin 9254 >>交任务: |cRXP_FRIENDLY_外出的学徒|r
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    .isOnQuest 8487
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t从地上捡起 |cRXP_LOOT_Tainted Soil Samples|r
    .goto 94,52.34,71.77,20,0
    .goto 94,51.92,68.47,20,0
    .goto 94,52.59,69.60,10,0
    .goto 94,53.75,69.89,10,0
    .goto 94,52.36,69.80
    .complete 8487,1 --8/8 Tainted Soil Sample
step
    .isQuestComplete 8487
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学徒米尔维达|r
    .goto 94,54.28,70.98
    .turnin 8487 >>交任务: |cRXP_FRIENDLY_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    .isQuestTurnedIn 8487
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待大约 5 秒钟，然后再次与 |cRXP_FRIENDLY_Apprentice Mirveda|r 交谈
    .goto 94,54.28,70.98
    .accept 8488 >>接任务: |cRXP_LOOT_出人意料的结果|r
    .target Apprentice Mirveda
step
    .isOnQuest 8488
    >>杀死 |cRXP_ENEMY_Gharsul the Remorseless|r。你可以放风筝他回到 |cRXP_FRIENDLY_Apprentice Mirveda|r
    .goto 94,53.68,69.76
    .complete 8488,2 --1/1 Gharsul the Remorseless slain
    .mob Gharsul the Remorseless
step
    .isQuestComplete 8488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_学徒米尔维达|r
    .goto 94,54.28,70.98
    .turnin 8488 >>交任务: |cRXP_FRIENDLY_出人意料的结果|r
    .accept 9255 >>接任务: |cRXP_LOOT_研究笔记|r
    .target Apprentice Mirveda
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将你的宠物设置为“被动”|r
step
    .isOnQuest 9255
    #completewith next
    .goto 94,51.47,80.11,20,0
    .deathskip >>拉一些怪物然后死掉
step
    .isOnQuest 9255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_魔导师兰德拉·晨行者|r
    .goto 94,44.02,70.77
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .target Magistrix Landra Dawnstrider
step
    #completewith next
    .goto 94,43.95,69.98
    .fp >>获取 Fairbreeze Village 飞行路线
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_飞行管理员晨光|r
    .goto 94,43.95,69.98
    .fly Falconwing Square >>飞往鹰翼广场
    .target Skymaster Brightdawn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾尔杜·炙痕|r
    .goto 94,48.17,46.00
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .target Aeldon Sunbrand
step
    #completewith next
    .hs >>从炉火到辉煌
step
    >>前往奥格瑞玛：
    .goto 18,60.98,58.84,6,0
    .goto 18,61.52,59.01,6,0
    .goto 18,60.73,58.68
    .zone 85 >>1) 爬上塔，通过传送门前往奥格瑞玛
]])
