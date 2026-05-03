-- Fate of the Kirin Tor
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r 故事线
#subweight 999.4
#name a) 博文·布里斯博埃斯的命运
#displayname 肯瑞托的命运 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next a) 可怕的幻象


step
    .isQuestAvailable 82702
    #completewith next
    +|cRXP_WARN_你必须先完成“ lingering shadows”章节|r
step
    .goto 2339,42.58,27.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多诺加尔的大法师卡德加|r交谈
    .accept 84223 >>接任务: |cRXP_WARN_幸存者的愧疚|r
    .target Archmage Khadgar
step
    #completewith next
    #title 离开大厅
    .goto 2339,42.74,30.57,15 >>离开大厅
step
    .goto 2248,29.58,58.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师艾萨斯·夺日者|r交谈
    .turnin 84223 >>交任务: |cRXP_FRIENDLY_幸存者的愧疚|r
    .target Archmage Aethas Sunreaver
    .accept 83031 >>接任务: |cRXP_WARN_艰难时刻|r
step
    .goto 2248,29.59,58.14
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Letter|r
    .complete 83031,1 --1/1 Letter to the survivors written
    .skipgossipid 124241
    .skipgossipid 124239
    .skipgossipid 124242
step
    .goto 2248,29.57,58.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师艾萨斯·夺日者|r交谈
    .turnin 83031 >>交任务: |cRXP_FRIENDLY_艰难时刻|r
    .target Archmage Aethas Sunreaver
    .accept 83499 >>接任务: |cRXP_WARN_奥术废土|r
step
    #completewith Frostfire Essence
    >>击杀|cRXP_ENEMY_Lingering Spark|r和|cRXP_ENEMY_Mana Fragment|r和|cRXP_ENEMY_Shard of Dalaran|r. 击败它们后可获得 |T4549108:0|t[|cRXP_LOOT_奥法之尘|r]
    *|cRXP_WARN_You should kill most of the ones you encounter|r.
    .complete 83499,1 --10/10 Arcane Dust collected
    .mob Lingering Spark
    .mob Mana Fragment
    .mob Shard of Dalaran
step
    .goto 2248,29.89,54.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Radiant Prism Crystal|r
    .complete 83499,2,1 --4/4 Radiant Prism Crystals collected
step
    .goto 2248,29.93,53.74
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Radiant Prism Crystal|r
    .complete 83499,2,2 --4/4 Radiant Prism Crystals collected
step
    .goto 2248,30.64,52.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Radiant Prism Crystal|r
    .complete 83499,2,3 --4/4 Radiant Prism Crystals collected
step
    .goto 2248,31.28,52.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Radiant Prism Crystal|r
    .complete 83499,2,4 --4/4 Radiant Prism Crystals collected
step
    #label Frostfire Essence
    .goto 2248,28.87,51.88
    >>击杀|cRXP_ENEMY_Frostfire Elemental|r, 击败后可获得 |T429384:0|t[|cRXP_LOOT_Frostfire Essence|r]
    .complete 83499,3 --1/1 Frostfire Essence collected
    .mob Frostfire Elemental
step
    #loop
    .goto 2248,29.98,53.81,40,0
    .goto 2248,31.02,55.42,40,0
    .goto 2248,31.62,53.89,40,0
    .goto 2248,30.96,52.24,40,0
    >>击杀|cRXP_ENEMY_Lingering Spark|r和|cRXP_ENEMY_Mana Fragment|r和|cRXP_ENEMY_Shard of Dalaran|r. 击败它们可获得 |T132854:0|t[|cRXP_LOOT_奥法之尘|r]
    *|cRXP_WARN_You should kill most of the ones you encounter|r.
    .complete 83499,1 --10/10 Arcane Dust collected
    .mob Lingering Spark
    .mob Mana Fragment
    .mob Shard of Dalaran
step
    .goto 2248,29.57,58.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师艾萨斯·夺日者|r交谈
    .turnin 83499 >>交任务: |cRXP_FRIENDLY_奥术废土|r
    .target Archmage Aethas Sunreaver
    .accept 83502 >>接任务: |cRXP_WARN_防御魔法课程|r
step
    .goto 2248,29.37,58.08
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Arcane Ward|r
    .complete 83502,1 --1/1 First Ward activated
step
    .goto 2248,29.61,57.50
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Arcane Ward|r
    .complete 83502,2 --1/1 Second Ward activated
step
    .goto 2248,29.99,57.92
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Arcane Ward|r
    .complete 83502,3 --1/1 Third Ward activated
step
    .goto 2248,29.76,58.52
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Arcane Ward|r
    .complete 83502,4 --1/1 Fourth Ward activated
step
    .goto 2248,29.74,57.93
    >>使用 |T429384:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 83502,5 --1/1 Spell empowered
    .timer 6,RP
step
    .goto 2248,29.74,57.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师艾萨斯·夺日者|r交谈
    .turnin 83502 >>交任务: |cRXP_FRIENDLY_防御魔法课程|r
    .target Archmage Aethas Sunreaver
    .accept 83539 >>接任务: |cRXP_WARN_忧蓝的感伤|r
    .timer 13,RP
step
    .goto 2248,29.62,57.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .complete 83539,1 --1/1 Speak with Kalecgos
    .skipgossipid 123141
    .target Kalecgos
step
    .goto 2248,29.65,57.59
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_杂物袋|r
    .complete 83539,2 --1/1 Bag of Helpful Goods collected
step
    #completewith next
    .cast 456663 >>使用 |T1519433:0|t[|cRXP_WARN_ExtraActionButton|r]
    .timer 5,RP
step
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 83539,3 --1/1 Bag of Helpful Goods searched
step
    .goto 2248,29.5,57.79
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_邮箱|r
    .complete 83539,4,1 --6/6 Items placed in the outpost
step
    .goto 2248,29.46,57.99
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tent|r
    .complete 83539,4,2 --6/6 Items placed in the outpost
step
    .goto 2248,29.49,58.12
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cabinet 显示|r
    .complete 83539,4,3 --6/6 Items placed in the outpost
step
    .goto 2248,29.59,58.17
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Enchanted Display|r
    .complete 83539,4,4 --6/6 Items placed in the outpost
step
    .goto 2248,29.74,58.33
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_飞毯|r
    .complete 83539,4,5 --6/6 Items placed in the outpost
    .skipgossipid 123144
step
    .goto 2248,29.71,58
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Banner|r
    .complete 83539,4,6 --6/6 Items placed in the outpost 
step
    .goto 2248,29.78,57.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83539 >>交任务: |cRXP_FRIENDLY_忧蓝的感伤|r
    .target Kalecgos
    .accept 83553 >>接任务: |cRXP_WARN_偷魔法的狗头人|r
step
    .goto 2248,61.72,41.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83553 >>交任务: |cRXP_FRIENDLY_偷魔法的狗头人|r
    .accept 83554 >>接任务: |cRXP_WARN_饰品、珍宝和强力好物|r
    .target Kalecgos
step
    .goto 2248,62.14,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_地精窃贼|r交谈
    .accept 83555 >>接任务: |cRXP_WARN_神秘项链|r
    .target Kobold Thief
step
    #completewith Arcane Manuscripts
    >>击杀 |cRXP_ENEMY_Kobolds|r. 击败后可搜刮出 |cRXP_LOOT_博文·布里斯博埃斯遗物|r的物品:|T1379168:0 |t
    .complete 83554,1 --15/15 Kirin Tor Artifacts collected
    .mob Candlelit Big-Boomer
    .mob Candlelit Ouchpatcher
    .mob Candlelit Hexthrower
step
    .goto 2248,62.17,40.61
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_赃物袋|r
    .complete 83554,2,1 --5/5 Arcane Manuscripts found
step
    .goto 2248,64.31,41.48
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_赃物袋|r
    .complete 83554,2,2 --5/5 Arcane Manuscripts found
step
    .goto 2248,64.37,43.07
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_赃物袋|r
    .complete 83554,2,3 --5/5 Arcane Manuscripts found
step
    .goto 2248,64.42,44.14
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_赃物袋|r
    .complete 83554,2,4 --5/5 Arcane Manuscripts found
step
    #label Arcane Manuscripts
    .goto 2248,63.25,45.23
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_赃物袋|r
    .complete 83554,2,5 --5/5 Arcane Manuscripts found
step
    #loop
    .goto 2248,64.07,42.53,40,0
    .goto 2248,63.33,41.85,40,0
    .goto 2248,62.64,43.54,40,0
    .goto 2248,62.45,42.58,40,0
    >>击杀 |cRXP_ENEMY_Kobolds|r. 击败它们后可获得 |T1379168:0|t[|cRXP_LOOT_博文·布里斯博埃斯遗物|r]
    .complete 83554,1 --15/15 Kirin Tor Artifacts collected
    .mob Candlelit Big-Boomer
    .mob Candlelit Ouchpatcher
    .mob Candlelit Hexthrower
step
    .goto 2248,61.52,42.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83554 >>交任务: |cRXP_FRIENDLY_饰品、珍宝和强力好物|r
    .target Kalecgos
    .turnin 83555 >>交任务: |cRXP_FRIENDLY_神秘项链|r
    .accept 83556 >>接任务: |cRXP_WARN_最好别碰|r
step
    .goto 2248,61.52,42.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_翡翠项链|r|cRXP_WARN_在卡雷苟斯手中|r
    .complete 83556,1 --1/1 Emerald Necklace inspected
    .skipgossipid 123192
step
    .isOnQuest 83556
    #completewith PocketDimension
    +|cRXP_WARN_该区域暂无可用坐标|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83556 >>交任务: |cRXP_FRIENDLY_最好别碰|r
    .timer 20,RP
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .accept 83641 >>接任务: |cRXP_WARN_困于生死之间|r
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击平台中央的 |cRXP_PICK_卷轴|r |cRXP_WARN_上|r
    .complete 83641,1 --1/1 Scroll investigated
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击平台边缘的|cRXP_PICK_破碎灵魂|r|cRXP_WARN_
    .complete 83641,2 --3/3 Fragmented Souls released
    .skipgossipid 123261
    .target Fragmented Soul
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击炼金釜旁的3个成分|cRXP_PICK_Ingredients|r|cRXP_WARN_|(死亡之息和炼金溶液和骷髅)
    .complete 83641,3 --3/3 Ingredients added to the Cauldron
step
    >>击杀|cRXP_ENEMY_Disfigured食尸鬼|r
    .complete 83641,4 --3/3 Disfigured Ghoul slain
    .timer 12,RP
    .mob Disfigured Ghoul
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_镜像阿克图瑞斯·凯尔Thuzad|r交谈
    .complete 83641,5 --1/1 Speak with the Mirror Image
    .skipgossipid 131340
    .mob Archmage Kel'Thuzad
step
    #label PocketDimension
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_维度之间的通道(传送门)|r
    .complete 83641,6 --1/1 Leave pocket dimension
step
    .goto 2248,61.52,42.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83641 >>交任务: |cRXP_FRIENDLY_困于生死之间|r
    .target Kalecgos
    .accept 83643 >>接任务: |cRXP_WARN_竟然死里逃生|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雷苟斯|r交谈
    .turnin 83643 >>交任务: |cRXP_FRIENDLY_竟然死里逃生|r
    .goto 2248,30.99,57.80
    .target +Kalecgos
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .accept 83723 >>接任务: |cRXP_WARN_帮把手|r
    .goto 2248,30.97,57.73
    .target +Lady Jaina Proudmoore
step
    #completewith next
    .goto 2248,31.12,56.66
    .cast 462625 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unstable 传送门|r
    .target Unstable Portal
step
    .goto 2248,31.7,54.96
    #title Mount Up
    >>|cRXP_WARN_点击传送门后, 前往下一个目标|r
    .complete 83723,1,1 --3/3 Mages extracted from portals
step
    #completewith next
    .goto 2248,31.7,54.96
    .cast 462625 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unstable 传送门|r
    .target Unstable Portal
step
    .goto 2248,29.98,54.05
    #title Mount Up
    >>|cRXP_WARN_点击传送门后, 前往下一个目标|r
    .complete 83723,1,2 --3/3 Mages extracted from portals
step
    #completewith next
    .goto 2248,29.98,54.05
    .cast 462625 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Unstable 传送门|r
    .target Unstable Portal
step
    .goto 2248,29.80,57.83
    #title Mount Up
    >>|cRXP_WARN_点击传送门后, 前往下一个目标|r
    .complete 83723,1,3 --3/3 Mages extracted from portals
step
    .goto 2248,29.80,57.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 83723 >>交任务: |cRXP_FRIENDLY_帮把手|r
    .target Lady Jaina Proudmoore
    .accept 83743 >>接任务: |cRXP_WARN_奥术冷战|r
    .timer 15,RP
step
    .goto 2248,29.68,57.69
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r
    .complete 83743,2 --1/1 Portal taken (Optional)
step
    .goto 2274,39.62,75.09
    .complete 83743,1 --1/1 Jaina found in Azj-Kahet
step
    .goto 2255,35.27,53.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 83743 >>交任务: |cRXP_FRIENDLY_奥术冷战|r
    .target Lady Jaina Proudmoore
    .accept 83762 >>接任务: |cRXP_WARN_临界质量|r
step
    #loop
    .goto 2255,35.38,52.82,20,0
    .goto 2255,35.18,52.02,20,0
    .goto 2255,35.79,51.25,20,0
    .goto 2255,36.03,51.8,20,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击与中央法力炸弹相连的|cRXP_PICK_对象|r, 并击杀所有出现的|cRXP_ENEMY_敌人|r
    *|cRXP_WARN_It's possible that some objects are not connected but still required|r
    .complete 83762,1 --Magical objects disentangled (100%)
    .mob Polymorphed Sheep
step
    .goto 2255,35.59,52.38
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔法炸弹|r并缠绕连接
    .complete 83762,2 --1/1 Mana Bomb disarmed
    .timer 5,RP
step
    .goto 2255,35.55,52.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r交谈
    .turnin 83762 >>交任务: |cRXP_FRIENDLY_临界质量|r
    .accept 83763 >>接任务: |cRXP_WARN_维护遗产|r
    .accept 83764 >>接任务: |cRXP_WARN_强大即危险|r
    .target Lady Jaina Proudmoore
step
    .goto 2255,35.68,52.57
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击冰封之杖(|cRXP_PICK_Wand of Permafrost|r)
    .complete 83764,1,1 --3/3 Dangerous artifacts destroyed
step
    .goto 2255,36.22,52.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_塔伦·歌者之音|r|cRXP_WARN_在水中|r
    .complete 83763,3 --1/1 Thalen Songweaver's notes collected
step
    .goto 2255,35.65,51.35
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Antonidas的书|r
    .complete 83763,1 --1/1 Antonidas' book collected
step
    .goto 2255,35.03,51.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Medivh's Karazhan Schematics|r
    .complete 83763,2 --1/1 Medivh's Schematics collected
step
    .goto 2255,35.31,51.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_千星法杖|r
    .complete 83764,1,2 --3/3 Dangerous artifacts destroyed
step
    .goto 2255,35.32,52.54
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_永久变形卷轴|r
    .complete 83764,1,3 --3/3 Dangerous artifacts destroyed
step
    #completewith next
    .goto 2255,57.49,41.63
    .zone 2339 >>使用阿兹-卡赫特传送门前往多诺加尔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉安娜·普罗德摩尔|r和|cRXP_FRIENDLY_大法师卡德加|r交谈
    .turnin 83763 >>交任务: |cRXP_FRIENDLY_维护遗产|r
    .turnin 83764 >>交任务: |cRXP_FRIENDLY_强大即危险|r
    .goto 2248,31.46,50.96
    .target +Lady Jaina Proudmoore
    .accept 83773 >>接任务: |cRXP_WARN_暂别魔法之城|r
    .goto 2248,31.45,50.93
    .target +Archmage Khadgar
step
    #loop
    .goto 2248,31.41,51.03,5,0
    .goto 2248,31.63,50.8,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击桌上的一个|cRXP_PICK_Mementos|r, 然后前往正确的船只|cRXP_WARN_then|r. 重复此操作3次
    *|cRXP_WARN_Repeat 3times|r.
    .complete 83773,1 --3/3 Mementos placed on boats
step
    .goto 2248,31.47,50.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jaina|r交谈
    .complete 83773,2 --1/1 Speak with Jaina
    .skipgossipid 123819
    .target Jaina
step
    .goto 2248,31.43,50.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营的大法师卡德加|r交谈
    .turnin 83773 >>交任务: |cRXP_FRIENDLY_暂别魔法之城|r
    .target Archmage Khadgar
]])

--故事模式: 安苏雷克女王
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r 故事线
#name a) 故事模式:安苏瑞克女王
#displayname 故事模式: 安苏雷克女王 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next a) 博文·布里斯博埃斯的命运


step
    .goto 2339,31.62,63.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Webster|r交谈
    .accept 83587 >>接任务: |cRXP_WARN_进攻时机已到|r
    .target Webster
step
    #completewith next
    .goto 2339,63.62,52.36
    .zone 2255 >>前往阿兹-卡赫特的洞穴
step
    .goto 2213,50.22,44.84,15,0
    .goto 2213,52.87,46.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行者尼兹雷克|r交谈
    .turnin 83587 >>交任务: |cRXP_FRIENDLY_进攻时机已到|r
    .target Executor Nizrek
step
    .goto 2213,52.87,46.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行者尼兹雷克|r交谈
    .target Executor Nizrek
    .accept 82124 >>接任务: |cRXP_WARN_终结肇始|r
step
    .isOnQuest 82124
    #title 离开房屋
    #completewith next
    .goto 2213,50.22,44.84,15 >>离开房屋
step
    #loop
    .goto 2216,51.83,38.55,35,0
    .goto 2213,50.69,34.03,35,0
    .goto 2213,47.53,35.42,35,0
    .goto 2213,49.58,27.56,35,0
    .goto 2213,45.6,28.18,35,0
    .goto 2213,41.08,28.92,35,0
    .goto 2213,46.65,18.41,35,0
    .goto 2213,47.3,13.92,35,0
    .goto 2213,51.08,15.51,35,0
    .goto 2213,54.24,20.73,35,0
    .goto 2213,61.26,18.95,35,0
    .goto 2213,60.43,27.59,35,0
    .goto 2213,55.38,29.1,35,0
    >>击杀 |cRXP_ENEMY_集市护卫|r和|cRXP_ENEMY_集市哨兵|r 和 |cRXP_ENEMY_效忠者线刃|r
    *Click on the |cRXP_PICK_Propaganda Holograms|r
    -- *|cRXP_WARN_Ignore |cRXP_PICK_Propaganda Holograms|r as they usually waste time|r
    .complete 82124,1 --Umbral Bazaar disrupted (100%)
    .mob Bazaar Guard
    .mob Bazaar Sentry
    .mob Loyalist Threadblade
step
    .isOnQuest 82124
    #title 进入房屋
    #completewith next
    .goto 2213,50.12,44.59,15 >>进入房屋
step
    .goto 2213,52.88,46.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行者尼兹雷克|r交谈
    .turnin 82124 >>交任务: |cRXP_FRIENDLY_终结肇始|r
    .target Executor Nizrek
    .accept 82125 >>接任务: |cRXP_WARN_间谍同行|r
step
    .isOnQuest 82125
    #title 离开房屋
    #completewith next
    .goto 2213,53.92,50.28,15 >>离开房屋
step
    .goto 2216,55,42.55,10,0
    .goto 2216,57.30,41.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与房屋内的|cRXP_FRIENDLY_Gut'usul|r|cRXP_WARN_below 对话. |r
    .turnin 82125 >>交任务: |cRXP_FRIENDLY_间谍同行|r
    .target Gut'usul
    .accept 82126 >>接任务: |cRXP_WARN_保卫人民|r
    .accept 82127 >>接任务: |cRXP_WARN_捕猎时刻|r
step
    .isOnQuest 82127
    #title 离开房屋
    #completewith next
    .goto 2216,55.19,42.91,10 >>离开房屋
step
    #completewith Burrows Residents
    >>击杀|cRXP_ENEMY_Abductors|r
    .complete 82127,1 --8/8 Abductors slain
    .mob Abductors
step
    .goto 2216,54,55.95
    >>点击|cRXP_PICK_Kah'net|r
    .complete 82126,1,1 --5/5 Burrows Residents rescued
    .mob Kah'net
step
    .goto 2216,44.26,68.11
    >>点击|cRXP_PICK_Tihk'ot|r
    .complete 82126,1,2 --5/5 Burrows Residents rescued
    .mob Tihk'ot
step
    .goto 2216,38.2,59.37
    >>点击|cRXP_PICK_Srax'run|r
    .complete 82126,1,3 --5/5 Burrows Residents rescued
    .mob Srax'run
step
    .goto 2216,36.9,57.71
    >>点击|cRXP_PICK_Gruthit|r
    .complete 82126,1,4 --5/5 Burrows Residents rescued
    .mob Gruthit
step
    #label Burrows Residents
    .goto 2216,46.85,49.12,15,0
    .goto 2216,44.63,49.17
    >>点击|cRXP_PICK_Mus'ten|r
    .complete 82126,1,5 --5/5 Burrows Residents rescued
    .mob Mus'ten
step
    #loop
    .goto 2216,54,55.95,35,0
    .goto 2216,44.26,68.11,35,0
    .goto 2216,38.2,59.37,35,0
    .goto 2216,36.9,57.71,35,0
    .goto 2216,44.63,49.17,35,0
    >>击杀|cRXP_ENEMY_Abductors|r
    .complete 82127,1 --8/8 Abductors slain
    .mob Abductors
step
    .goto 2216,55.16,42.49,10,0
    .goto 2216,57.33,41.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gut'usul|r交谈
    .turnin 82126 >>交任务: |cRXP_FRIENDLY_保卫人民|r
    .target Gut'usul
    .turnin 82127 >>交任务: |cRXP_FRIENDLY_捕猎时刻|r
    .accept 82130 >>接任务: |cRXP_WARN_擒贼擒王|r
step
    .goto 2216,56.47,53.83,15,0
    .goto 2216,55.17,42.87
    >>击杀|cRXP_ENEMY_Master 绑架者|r
    .complete 82130,1 --1/1 Master Abductor slain
    .mob Master Abductor
step
    .goto 2216,56.54,53.44,10,0
    .goto 2213,53.74,50.06,10,0
    .goto 2213,52.91,46.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行者尼兹雷克|r交谈, 他在主屋的上方
    .turnin 82130 >>交任务: |cRXP_FRIENDLY_擒贼擒王|r
    .target Executor Nizrek
    .accept 82141 >>接任务: |cRXP_WARN_女王之死|r
step
    #completewith next
    >>|cRXP_WARN_你可以单独击杀她, 也可以在团队副本中击杀(包括低配团队和普通和英雄或史诗难度)|r
    *|cRXP_WARN_The fastest and most accessible method is to kill her solo, but you might want to wait if you plan on killing her in a raid group.|r
    *|cRXP_WARN_It all depends on how eager you are for the Heroic Tier Token reward offered by this quest.|r
    *|cFFFF0000This guide will continue to direct you through the solo version|r.
    .complete 82141,2 --1/1 Enter Nerub-ar Palace in Story Mode (Optional)>>击杀|cRXP_ENEMY_女王安苏瑞克|r
    .complete 82141,1 --1/1 Queen Ansurek slain
step
    .isOnQuest 82141
    .goto 2213,31.47,64.05
    .gossipoption 123174 >>与|cRXP_FRIENDLY_忠诚者Kriz|r交谈
    .mob Kriz the "Loyal"
step
    >>击杀|cRXP_ENEMY_女王安苏瑞克|r
    .complete 82141,1 --1/1 Queen Ansurek slain
    .mob Queen Ansurek
step
    #completewith next
    +如果你使用的是单人版本, 请点击你的玩家角色界面并离开副本队伍
step
    .goto 2213,50.02,44.51,15,0
    .goto 2213,52.70,46.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行者尼兹雷克|r交谈
    .turnin 82141 >>交任务: |cRXP_FRIENDLY_女王之死|r
    .target Executor Nizrek
]])

--Horrific Visions
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r 故事线
#name a) 可怕的幻象
#displayname 恐怖幻象介绍 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next a) 夜幕光辉

step
    .goto 2339,42.51,28.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_研究员奥内尔穆|r交谈
    .accept 86706 >>接任务: |cRXP_WARN_探寻昔日奥秘|r
    .target Researcher Onermu
step
    .goto 2339,34.69,68.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索莉多米|r交谈
    .turnin 86706 >>交任务: |cRXP_FRIENDLY_探寻昔日奥秘|r
    .accept 87328 >>接任务: |cRXP_WARN_骇目惊魂|r
    .target Soridormi
step
    .goto 2339,34.69,68.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索莉多米|r交谈
    .complete 87328,1 --1/1 Speak to Soridormi
    .skipgossipid 132133
    .target Soridormi
step
    .goto 2339,34.52,69.71
    >>很快, 光球将出现在天空中并朝地面降落. 跳入其中即可获得奖励
    .complete 87328,2 --10/10 Collect Horrific Sands of Time
step
    .goto 2339,34.56,68.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索莉多米|r交谈
    .turnin 87328 >>交任务: |cRXP_FRIENDLY_骇目惊魂|r
    .accept 87329 >>接任务: |cRXP_WARN_进入最黑暗的回忆|r
    .target Soridormi
step
    .goto 2339,34.68,68.34
    >>点击 |cRXP_PICK_传送门|r
    .complete 87329,1 --1/1 Portal to Horrific Visions used
    .skipgossipid 132129
    .skipgossipid 132128
step
    .goto 2403,51.99,83.64
    .wpradius 2403,51.99,83.64,100,0
    .goto 2404,53.25,51.25
    .wpradius 2404,53.25,51.25,100,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉希奥|r交谈
    .complete 87329,2 --1/1 Speak to the Image of Wrathion
    .timer 10,RP
    .skipgossipid 125259
    .target the Image of Wrathion
step
    .zoneskip 2403,1
    .isOnQuest 87329
    .goto 2403,49.86,75.54,10,0
    .goto 2403,49.37,75.07,10,0
    .goto 2403,49.34,74.01,10,0
    .goto 2403,48.45,71.42
    .scenario 1733,1 >>击杀|cRXP_ENEMY_Voidbound Honor Guards|r以打开通往|cRXP_ENEMY_萨尔|r的门并击杀他
    .mob Thrall
    .mob Voidbound Honor Guard
step
    .zoneskip 2404,1
    .isOnQuest 87329
    .goto 2404,52,54.15,15,0
    .goto 2404,53.53,52.32,15,0
    .goto 2404,52.97,51.12,10,0
    .goto 2404,52.26,50.62,10,0
    .goto 2404,51.72,49.68,10,0
    .goto 2404,51.63,48.56,10,0
    .goto 2404,50.13,45.71
    .scenario 4171,1 >>击杀|r|cRXP_ENEMY_堕落裂谷行者|r以打开通往|r|cRXP_ENEMY_艾莉娅·风行者|r的门并击杀她 
    .mob Alleria Windrunner
    .mob Fallen Riftwalker
step
    .zoneskip 2404,1
    .isOnQuest 87329
    .goto 2404,41.58,34.72
    .cast 3365 >>点击|cRXP_PICK_Chest|r
    .complete 87329,3 --100/20 Corrupted Mementos
step
    .isOnQuest 87329
    .zoneskip 2404,1
    +离开恐怖的幻象(右键点击你的玩家界面)
step
    .isOnQuest 87329
    .zoneskip 2403,1
    .goto 2403,51.99,85.64
    .cast 3365 >>点击|cRXP_PICK_Chest|r
    .complete 87329,3 --100/20 Corrupted Mementos
step
    .isOnQuest 87329
    .zoneskip 2403,1
    +离开恐怖的幻象(右键点击你的玩家界面)
step
    .goto 2339,34.57,68.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索莉多米|r交谈
    .turnin 87329 >>交任务: |cRXP_FRIENDLY_进入最黑暗的回忆|r
    .target Soridormi
    .accept 87332 >>接任务: |cRXP_WARN_变量集合|r
step
    .goto 2339,35.21,68.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Augermu|r交谈
    .turnin 87332 >>交任务: |cRXP_FRIENDLY_变量集合|r
    .target Augermu
    .accept 87335 >>接任务: |cRXP_WARN_回响的启示|r
step
    .goto 2339,35.24,68.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Augermu|r交谈
    .complete 87335,1 --1/1 Echo of N'Zoth created
    .skipgossipid 132107
    .target Augermu
step
    .goto 2339,35.09,68.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Hourglass of Horrific Visions|r 并选择“法球操作手册”
    .complete 87335,2 --1/1 Orb Operation Manual unlocked
    .skipgossipid 132100
step
    .goto 2339,35.19,68.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Augermu|r交谈
    .turnin 87335 >>交任务: |cRXP_FRIENDLY_回响的启示|r
    .target Augermu
    .accept 87336 >>接任务: |cRXP_WARN_无尽的回忆|r
step
    .goto 2339,34.55,68.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索莉多米|r交谈
    .turnin 87336 >>交任务: |cRXP_FRIENDLY_无尽的回忆|r
    .target Soridormi
step
    .goto 2339,35.24,68.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Augermu|r交谈
    .accept 90719 >>接任务: |cRXP_WARN_借来的腐化|r
    .target Augermu
step
    .zoneskip 2404
    .goto 2339,34.67,68.29
    .zone 2403 >>点击|cRXP_PICK_传送门|r进入幻境
    .skipgossipid 132129
    .skipgossipid 132128
step
    .zoneskip 2403,1
    .goto 2403,52.00,82.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_青铜沙漏|r交谈
    .accept 88803 >>接任务: |cRXP_WARN_及时援助|r
    .target Bronze Hourglass
step
    .zoneskip 2404,1
    .goto 2404,53.29,50.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_青铜沙漏|r交谈
    .accept 88803 >>接任务: |cRXP_WARN_及时援助|r
    .target Bronze Hourglass
step
    .goto 2404,53.29,50.39
    .wpradius 2404,53.29,50.39,100,0
    .goto 2403,52.00,82.81
    .wpradius 2403,52.00,82.81,100,0
    >>为同伴选择DPS和治疗或坦克角色
    .complete 88803,1 --1/1 Use the hourglass to summon aid
step
    .zoneskip 2403,1
    .goto 2403,52.00,82.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_青铜沙漏|r交谈
    .turnin 88803 >>交任务: |cRXP_FRIENDLY_及时援助|r
    .target Bronze Hourglass
step
    .zoneskip 2404,1
    .goto 2404,53.29,50.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_青铜沙漏|r交谈
    .turnin 88803 >>交任务: |cRXP_FRIENDLY_及时援助|r
    .target Bronze Hourglass
step
    >>在恐怖幻象中击杀|r|cRXP_ENEMY_Bosses|r敌人, 并在终点打开箱子, 以获取|r|T3528446:0|t[|cRXP_LOOT_黑色鲜血残留物|r]
    .complete 90719,1
]])

--夜幕降临
RXPGuides.RegisterGuide([[
#retail
#version 3
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r 故事线
#subweight 999.59
#name a) 夜幕光辉
#displayname 夜幕降临 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    >>打开冒险指南(默认快捷键:Shift + J), 导航至“推荐内容”, 然后查找任务“夜幕光辉”. 接受该任务
    .accept 85005 >>接任务: |cRXP_WARN_光耀的召唤|r
step
    #include a) 黎明破晓者传送
step
    .goto 2215,28.26,56.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mylton Wyldbraun|r交谈
    .turnin 85005 >>交任务: |cRXP_FRIENDLY_光耀的召唤|r
    .target Mylton Wyldbraun
    .accept 89331 >>接任务: |cRXP_WARN_拱卫圣焰|r
    .accept 89332 >>接任务: |cRXP_WARN_新兵训练营|r
    .accept 89295 >>接任务: |cRXP_WARN_圣焰永明耀|r
 step
    .goto 2215,28.26,56.11
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mylton Wyldbraun|r交谈 
    .questcount <3 87477,87475,87480,88711,88916,88945 >>|cRXP_WARN_领取3个可用的日常任务|r
    .target Mylton Wyldbraun
    -- .accept 87477 >>接任务: |cRXP_WARN_苏雷吉入侵：南境虫群|r
    -- .accept 87475 >>接任务: |cRXP_WARN_苏雷吉入侵：坚守城墙|r
    -- .accept 87480 >>接任务: |cRXP_WARN_苏雷吉入侵：东部突袭|r
    -- .accept 88711 >>接任务: |cRXP_WARN_光耀入侵：毒素与信息素|r
    -- .accept 88916 >>接任务: |cRXP_WARN_光耀入侵：苏雷吉之末|r
    -- .accept 88945 >>接任务: |cRXP_WARN_光耀入侵：拉克-扎卡兹|r
step
    .goto 2215,28.29,56.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔斯·布龙斯梅尔特|r交谈
    .accept 89493 >>接任务: |cRXP_WARN_战场欢迎你|r
    .turnin 89493 >>交任务: |cRXP_FRIENDLY_战场欢迎你|r
    .target Lars Bronsmaelt
step
    .isOnQuest 88711
    .goto 2215,26.48,55.11,40,0
    #completewith Radiant Incursion: Toxins and Pheromones
    >>查看地图, 确认“夜幕降临”活动是否开启. 如果已开启, 请立即完成；若未开启, 稍后再做
    .complete 89295,1 --Complete the scenario "Nightfall"
    .complete 89331,1 --Complete the scenario "Nightfall"
step
    .goto 2215,26.48,55.11,40,0
    #completewith Sureki Incursion: The Eastern Assault
    >>查看地图, 确认“夜幕降临”活动是否开启. 如果已开启, 请立即完成；若未开启, 稍后再做
    .complete 89295,1 --Complete the scenario "Nightfall"
    .complete 89331,1 --Complete the scenario "Nightfall"
-----------------------------------------------------
--- DAILLIES BATCH 1
-----------------------------------------------------
step
    .isOnQuest 88916
    .goto 2274,48.6,57.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_神圣炼金术士|r交谈
    .complete 88916,1 --1/1 Field Elixir taken (Optional)
    .skipgossipid 132981
    .target Sacred Alchemist
step
    .isOnQuest 88916
    #loop
    .goto 2255,63.1,0.87,40,0
    .goto 2255,63.77,5.57,40,0
    .goto 2255,64.24,6.33,40,0
    .goto 2255,64.39,8.27,40,0
    .goto 2255,64.37,10.76,40,0
    .goto 2255,64.74,14.76,40,0
    .goto 2255,66.34,13.43,40,0
    .goto 2255,65.25,6.91,40,0
    >>击杀|cRXP_ENEMY_Sureki Forces|r, 并点击附近的|cRXP_PICK_Objects|r
    .complete 88916,2 --Sureki Forces disrupted (100%)
    .mob Toxic Swarmite
    .mob Battlefront Hauler
    .mob Stagshell Mite
    .mob Skitterling Soldier
    .mob Sureki Raider
    .mob Nerubian Ballista
    .mob Crimson Deathweaver
    .mob Sureki Priestess
step
    #loop
    .goto 2255,64.76,21.1,40,0
    .goto 2255,63.91,27.14,40,0
    .goto 2255,63.83,30.4,40,0
    .goto 2255,62.39,30.92,40,0
    .goto 2255,60.62,28.25,40,0
    .isOnQuest 88945
    >>击杀|cRXP_ENEMY_Sureki部队|r
    .complete 88945,1 --Sureki Sympathizers disrupted (100%)
step
    .isQuestComplete 88916
    .isQuestComplete 88945
    .goto 2255,60.65,18.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ysabel Gleamgaard|r交谈
    .dailyturnin 88916 >>提交《光辉入侵:苏雷基的终结》
    .dailyturnin 88945 >>提交“光辉入侵:拉克-扎卡兹”
    .target Ysabel Gleamgaard
step
    .isOnQuest 88711
    .goto 2255,65.33,49.67,40,0
    .goto 2255,66.34,53.89,40,0
    .goto 2255,68.72,54.3,40,0
    .goto 2255,69.9,56.17,40,0
    .goto 2255,66.52,55.31,40,0
    >>击杀|cRXP_ENEMY_Sureki Forces|r, 并点击附近的|cRXP_PICK_Objects|r
    .complete 88711,1 --Sureki forces disrupted (100%)
step
    #label Radiant Incursion: Toxins and Pheromones
    .isQuestComplete 88711
    .goto 2255,65.98,59.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱姆普莱特·凯特|r交谈
    .dailyturnin 88711 >>提交任务:光辉入侵——毒素与信息素
    .target Lamplighter Kaerter
step
    .isQuestComplete 88711
    #include a) 黎明破晓者传送
-----------------------------------------------------
--- DAILLIES BATCH 2
-----------------------------------------------------
step
    #loop
    .isOnQuest 87475
    .goto 2215,40.13,58.29,30,0
    .goto 2215,41.29,59.47,30,0
    .goto 2215,40.61,61.16,30,0
    >>击杀|cRXP_ENEMY_Sureki Forces|r, 并点击附近的|cRXP_PICK_Objects|r
    .complete 87475,1 --Sureki forces repelled (100%)
    .mob Sureki Ballista
    .mob Sureki Marauder
    .mob Sureki Battle Drone
    .mob Sureki Siegelord
step
    .isQuestComplete 87475
    .goto 2215,40.59,57.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Auralia Steelstrike|r交谈
    .turnin 87475 >>交任务: |cRXP_FRIENDLY_苏雷吉入侵：坚守城墙|r
    .target Auralia Steelstrike
step
    .isOnQuest 87477
    #loop
    .goto 2215,47.5,68.2,30,0
    .goto 2215,48.06,69.2,30,0
    .goto 2215,51.2,65.38,30,0
    .goto 2215,51.49,70.75,30,0
    >>击杀|cRXP_ENEMY_Sureki Forces|r, 并点击附近的|cRXP_PICK_Objects|r
    .complete 87477,1 --Sureki swarm thwarted (100%)
    .mob Sureki Ballista
    .mob Sureki Marauder
    .mob Sureki Battle Drone
    .mob Sureki Siegelord
step
    .isQuestComplete 87477
    .goto 2215,52.00,66.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉迪斯·拉克|r交谈
    .turnin 87477 >>交任务: |cRXP_FRIENDLY_苏雷吉入侵：南境虫群|r
    .target Meradyth Lacke
step
    .isOnQuest 87480
    #loop
    .goto 2215,71.76,45.59,30,0
    .goto 2215,72.06,46.62,30,0
    .goto 2215,72.78,47.01,30,0
    .goto 2215,73.61,45.84,30,0
    .goto 2215,74.6,45,30,0
    .goto 2215,75.86,45.18,30,0
    .goto 2215,75.66,43.38,30,0
    .goto 2215,73.09,43.06,30,0
    .goto 2215,71.5,42.9,30,0
    >>击杀|cRXP_ENEMY_Sureki Forces|r, 并点击附近的|cRXP_PICK_Objects|r
    .complete 87480,1 --Sureki invasion disrupted (100%)
step
    .isQuestComplete 87480
    #label Sureki Incursion: The Eastern Assault
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与高处平台上的|cRXP_FRIENDLY_伊泽·斯特朗铁|r交谈
    .turnin 87480 >>交任务: |cRXP_FRIENDLY_苏雷吉入侵：东部突袭|r
    .target Izaeh Strongiron
step
    .goto 2215,26.48,55.11
    >>查看你的地图, 确认“夜幕降临”活动是否开启. 如果已开启, 请立即完成；如果未开启, 请等待其开始
    .complete 89295,1 --Complete the scenario "Nightfall"
    .complete 89331,1 --Complete the scenario "Nightfall"
step
    .goto 2215,28.26,56.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mylton Wyldbraun|r交谈
    .turnin 89332 >>交任务: |cRXP_FRIENDLY_新兵训练营|r
    .turnin 89295 >>交任务: |cRXP_FRIENDLY_圣焰永明耀|r
    .turnin 89331 >>交任务: |cRXP_FRIENDLY_拱卫圣焰|r
    .target Mylton Wyldbraun
]])

--红色黎明的崛起
RXPGuides.RegisterGuide([[
#retail
#version 4
#group RestedXP 战争之内 最后的较量
#subgroup |cFFFCDC00(80)|r 故事线
#name a) 红日初升
#displayname 红色黎明的崛起 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r


-- step
--     #completewith next
--     #label Faerin
--     -- >>打开冒险指南(默认快捷键:Shift + J), 导航至“推荐内容”, 然后查找任务标题“红日之升”. 点击接受任务
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
--     .accept 91039 >>接受任务：法林的请求
--     .target Faerin Lothar
step
    #completewith next
    #label Faerin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .accept 84638 >>接受任务：：高地的麻烦
    .target Faerin Lothar
step
    #completewith Faerin
    .zone 2339 >>进入多尔诺加尔
step
    #requires Faerin
    .goto 2339,46.02,49.4 --clickradius
    .goto 2339,46.07,49.60 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .accept 84638 >>接受任务：：高地的麻烦
    .target Faerin Lothar
-- step
--     #requires Faerin
--     .goto 2339,46.07,49.63
--     -- >>打开冒险指南(默认快捷键:Shift + J), 导航至“推荐内容”, 然后查找任务标题“红日之升”. 点击接受任务
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
--     .accept 91039 >>接受任务：法林的请求
--     .target Faerin Lothar
-- step
--     .goto 2339,46.07,49.60
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
--     .turnin 91039 >>提交法艾琳的请求
--     .accept 84638 >>接受任务：：高地的麻烦
--     .target Faerin Lothar
step
    .goto 2339,46.02,49.4 --clickradius
    .goto 2339,45.96,49.19 --npc location
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r
    .complete 84638,1 --1/1 Take the portal to the Arathi Highlands
step
    .goto 2372,21.62,38.53 --npc location
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84638,2 --1/1 Follow Faerin
    .target Faerin
step
    .goto 2372,21.62,38.53 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Faerin|r交谈
    .complete 84638,3 --1/1 Speak to Faerin
    .skipgossipid 132093
    .target Faerin
step
    .goto 2372,20.46,39.30 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Danath Trollbane|r交谈
    .turnin 84638 >>交还《高地的麻烦》
    .target Danath Trollbane
step
    .goto 2372,20.42,39.5 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Walker Gresham|r 和 |cRXP_FRIENDLY_Maggie Wiltshire|r 交谈
    .accept 84639 >>接受任务：火把与焦油
    .goto 2372,20.5,39.4
    .target +Walker Gresham
    .accept 84658 >>接受任务：寻找家人
    .goto 2372,20.52,39.63
    .target +Maggie Wiltshire
step
    #completewith Barrels of Tar
    >>消灭|cRXP_ENEMY_Defias|r势力. 击杀他们后搜刮出|T135432:0|t[|cRXP_LOOT_被盗火炬|r]和|T656542:0|t[|cRXP_LOOT_陌生徽章|r]
    .complete 84639,2 --10/10 Stolen Torches retrieved
    .accept 84640 >>接受任务：“未来之征兆”徽记
    .mob Defias Lookout
    .mob Defias Ringleader
step
    .goto 2372,17.52,41.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Barrel|r
    .complete 84639,1,1 --10/10 Barrels of Tar retrieved
step
    .goto 2372,17.37,42.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Sharon Wiltshire|r|cRXP_WARN_在房子里|r
    .complete 84658,2 --1/1 Sharon Wiltshire found
    .target Sharon Wiltshire
step
    .goto 2372,16.53,42.35
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Barrels|r
    .complete 84639,1,4 --10/10 Barrels of Tar retrieved
step
    #completewith next
    #label Barn
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Marshall Wiltshire|r
    .complete 84658,1 --1/1 Marshall Wiltshire found
    .target Marshall Wiltshire
step
    #completewith Barn
    #title |cFFFCDC00进入谷仓|r
    .goto 2372,14.65,42.17,5 >>进入谷仓
step
    #requires Barn
    .goto 2372,14.75,42.72 --clickradius
    .goto 2372,14.77,42.89 --npc location
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Marshall Wiltshire|r
    .complete 84658,1 --1/1 Marshall Wiltshire found
    .target Marshall Wiltshire
step
    #completewith next
    #label Ellie
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ellie|r   
    .complete 84658,3 --1/1 Ellie found
    .target Ellie
step
    #completewith Ellie
    #title |cFFFCDC00进入房屋|r
    .goto 2372,14.6,42.19,5,0
    .goto 2372,14.27,41.89,5 >>进入房屋
step
    #requires Ellie
    .goto 2372,14.24,41.88 --clickradius
    .goto 2372,14.08,41.84 --npc location
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Ellie|r   
    .complete 84658,3 --1/1 Ellie found
    .target Ellie
step
    #label Barrels of Tar
    #loop
    .goto 2372,14.78,40.91,12,0
    .goto 2372,16.14,39.70,12,0
    .goto 2372,17.50,41.30,12,0
    .goto 2372,14.94,42.76,12,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Barrel|r
    .complete 84639,1,10 --10/10 Barrels of Tar retrieved
step
    #loop
    .goto 2372,18.17,39.76,40,0
    .goto 2372,14.54,43.84,40,0
    .goto 2372,14.63,39.93,40,0
    >>击杀|r|cRXP_ENEMY_Defias|r. 从他们身上搜刮出|r|cRXP_LOOT_Stolen Torches|r[|T135432:0|t]和一个|r|cRXP_LOOT_Unfamilar Emblem|r[|T656542:0|t]
    .complete 84639,2 --10/10 Stolen Torches retrieved
    .accept 84640 >>接受任务：“未来之征兆”徽记
    .mob Defias Lookout
    .mob Defias Ringleader
step
    .goto 2372,20.51,39.51 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克·格雷沙姆|r和|cRXP_FRIENDLY_玛吉·威尔特希尔|r和|cRXP_FRIENDLY_达纳斯·托尔贝恩|r交谈
    .turnin 84639 >>交还火把与焦油
    .goto 2372,20.47,39.59 --npc location
    .target +Walker Gresham
    .turnin 84658 >>提交任务:寻找家人
    .goto 2372,20.50,39.39 --npc location
    .target +Maggie Wiltshire
    .turnin 84640 >>上交“未来的象征”
    .accept 84641 >>接受任务：噩耗
    .goto 2372,20.46,39.29 --npc location
    .target +Danath Trollbane
step
    .goto 2372,19.4,56.42 --clickradius
    .goto 2372,19.41,56.18 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Danath Trollbane|r交谈
    .turnin 84641 >>提交任务“坏消息”
    .target Danath Trollbane
step
    .goto 2372,19.36,56.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗德里克·布鲁斯顿队长|r交谈
    .accept 84643 >>接任务: |cRXP_WARN_宵禁风波|r
    .accept 84645 >>接任务: |cRXP_WARN_副官快递|r
    .target Captain Roderick Brewston
step
    #completewith Brewston5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_Marran 支持者|r交谈并杀死他们
    .complete 84643,1 --15/15 Marran Supporters sent home
    .mob Marran Supporter
    .skipgossipid 131456
step
    .goto 2372,20.57,62.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴琳达·暗石|r交谈
    .complete 84645,1,1 --1/5 Brewston's requests delivered
    .skipgossipid 131507
    .target Balinda Darkstone
step
    .goto 2372,21.96,65.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Joseph the Enlightened|r交谈
    .complete 84645,1,2 --2/5 Brewston's requests delivered
    .mob Joseph the Enlightened
    .skipgossipid 131529
step
    #completewith next
    #label Brewston
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯特拉姆·巴利比尔|r交谈
    .complete 84645,1,3 --3/5 Brewston's requests delivered
    .target Bertram Barleybeard
step
    #completewith Brewston
    #title |cFFFCDC00进入房屋|r
    .goto 2372,19.44,65.45,10,0
    .goto 2372,19.63,65.94,5,0
    .goto 2372,19.86,66.17,5 >>进入房屋
step
    #requires Brewston
    .goto 2372,19.85,66.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯特拉姆·巴利比尔|r交谈
    .complete 84645,1,3 --3/5 Brewston's requests delivered
    .target Bertram Barleybeard
    .skipgossipid 131524
step
    #completewith next
    #label Brewston2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Luma Noss|r交谈
    .complete 84645,1,4 --4/5 Brewston's requests delivered
step
    #completewith Brewston2
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,19.86,66.17,5,0 
    .goto 2372,19.63,65.94,5,0
    .goto 2372,19.45,65.12,5 >>离开这所房子
step
    #requires Brewston2
    #completewith next
    #label Brewston3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Luma Noss|r交谈
    .complete 84645,1,4 --4/5 Brewston's requests delivered
    .target Luma Noss
step
    #requires Brewston2
    #completewith Brewston3
    #title |cFFFCDC00进入房屋|r
    .goto 2372,17.44,66.47,10,0
    .goto 2372,13.85,69.22,10 >>进入房屋
step
    #requires Brewston3
    .goto 2372,14.39,70.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Luma Noss|r交谈
    .complete 84645,1,4 --4/5 Brewston's requests delivered
    .skipgossipid 131514
    .target Luma Noss
step
    #completewith next
    #label Brewston4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾米·哈迪|r交谈
    .complete 84645,1,5 --5/5 Brewston's requests delivered
step
    #completewith Brewston4
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,13.83,69.28,10 >>离开这所房子
step
    #requires Brewston4
    #label Brewston5
    .goto 2372,13.35,68.55,10,0
    .goto 2372,11.98,68.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾米·哈迪|r交谈
    .complete 84645,1 --5/5 Brewston's requests delivered
    .skipgossipid 131516
    .target Amy Hardy
step
    #loop
    .goto 2372,12.6,67.59,30,0
    .goto 2372,14.68,68.43,30,0
    .goto 2372,14.14,64.66,30,0
    .goto 2372,15.94,65.99,30,0
    .goto 2372,17.13,63.08,30,0
    .goto 2372,19.16,62,30,0
    .goto 2372,18.63,59.31,30,0
    .goto 2372,20.99,59.88,30,0
    .goto 2372,22.5,60.04,30,0
    .goto 2372,22.41,67.44,30,0
    .goto 2372,18.14,68.19,30,0
    .goto 2372,17.43,66.54,30,0
    .goto 2372,16.27,68.33,30,0
    .goto 2372,14.68,68.43,30,0
    .goto 2372,12.16,69.33,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_Marran 支持者|r交谈并杀死他们
    .complete 84643,1 --15/15 Marran Supporters sent home
    .mob Marran Supporter
    .skipgossipid 131456
step
    #completewith next
    #label Curfew Kerfuffle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗德里克·布鲁斯顿队长|r和|cRXP_FRIENDLY_维罗妮卡·尼尔斯上校|r交谈
    .turnin 84643 >>交任务: |cRXP_FRIENDLY_宵禁风波|r
    .turnin 84645 >>交任务: |cRXP_FRIENDLY_副官快递|r
    .target +Captain Roderick Brewston
    .accept 84649 >>接受任务：马兰·托尔贝恩
    .disablecheckbox
    .target Colonel Veronica Nials
step
    #completewith Curfew Kerfuffle
    #title |cFFFCDC00进入房屋|r
    .goto 2372,17.53,60.55,10 >>进入房屋
step
    #requires Curfew Kerfuffle
    .goto 2372,17.51,59.73 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗德里克·布鲁斯顿队长|r和|cRXP_FRIENDLY_维罗妮卡·尼尔斯上校|r交谈
    .turnin 84643 >>交任务: |cRXP_FRIENDLY_宵禁风波|r
    .turnin 84645 >>交任务: |cRXP_FRIENDLY_副官快递|r
    .goto 2372,17.46,59.57
    .target +Captain Roderick Brewston
    .accept 84649 >>接受任务：马兰·托尔贝恩
    .goto 2372,17.55,59.58
    .target +Colonel Veronica Nials
step
    .goto 2372,17.96,59.45,5,0
    .goto 2372,17.9,60.45,5,0
    .goto 2372,17.75,60.18
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84649,1 --1/1 Follow Colonel Nials downstairs
step
    .goto 2372,17.79,60.33 --clickradius
    .goto 2372,17.73,60.18 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Faerin|r交谈
    .complete 84649,2 --1/1 Speak to Faerin
    .timer 63,RP
    .skipgossipid 131587
    .target Faerin
step
    .goto 2372,17.9,60.45,5,0
    .goto 2372,17.96,59.45,5,0
    .goto 2372,17.55,59.79 --clickradius
    .goto 2372,17.54,59.58 --npc location
    #title |cFFFCDC00跟随箭头指引|r
    >>|cRXP_WARN_回到楼上, 等待角色扮演|r
    .complete 84649,3 --1/1 Listen to the conversation
-- step
--     #completewith next
--     #label MarranRefuge
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_上校维罗妮卡·尼亚尔斯|r交谈
--     .turnin 84649 >>提交Marran Trollbane
--     .accept 84650 >>接受任务：在避难谷地寻找庇护
--     .target Colonel Veronica Nials
-- step
--     #completewith MarranRefuge
--     #title |cFFFCDC00跟随箭头指引|r
--     .goto 2372,17.92,60.50,6,0
--     .goto 2372,17.96,59.37,8 >>回到楼上
step
    -- #requires MarranRefuge
    .goto 2372,17.55,59.79 --clickradius
    .goto 2372,17.54,59.58 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_上校维罗妮卡·尼亚尔斯|r交谈
    .turnin 84649 >>提交Marran Trollbane
    .accept 84650 >>接受任务：在避难谷地寻找庇护
    .target Colonel Veronica Nials
step
    #completewith next
    #label Pointe
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84650,1 --1/1 Meet Faerin at Refuge Pointe
step
    #completewith Pointe
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,17.52,60.58,7 >>离开这所房子
step
    #requires Pointe
    .goto 2372,38.01,52.27
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84650,1 --1/1 Meet Faerin at Refuge Pointe
step
    .goto 2372,38.04,52.41 --clickradius
    .goto 2372,37.97,52.24 --npc location
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Corpse|r
    .complete 84650,2 --1/1 Search the body for clues
    .skipgossipid 131607
    .mob Unknown Soldier
step
    .goto 2372,40.84,53.42 --clickradius
    .goto 2372,40.95,53.55 --npc location
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84650,3 --1/1 Follow Faerin up the hill
step
    .goto 2372,40.84,53.42 --clickradius
    .goto 2372,40.95,53.54 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Karga Bloodfury|r交谈
    .complete 84650,4 --1/1 Speak to Karga
    .skipgossipid 131610
    .target Karga Bloodfury
step
    .goto 2372,40.84,53.42 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法琳·洛瑟尔和卡加·血怒|r交谈
    .turnin 84650 >>提交《寻找庇护所》至避难谷地
    .goto 2372,40.81,53.56
    .target +Faerin Lothar
    .accept 84651 >>接受任务：一位熟人
    .accept 84652 >>接受任务：补给运送
    .goto 2372,40.95,53.55
    .target +Karga Bloodfury
step
    #completewith next
    >>击败|cRXP_ENEMY_Joseph the Enlightened|r
    .complete 84651,1 --1/1 Enemy leader defeated
    .mob Joseph the Enlightened
step
    #loop
    .goto 2372,40.01,49.53,8,0
    .goto 2372,39.81,48.42,8,0
    .goto 2372,40.66,48.17,8,0
    .goto 2372,40.78,46.72,8,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_补给箱|r
    .complete 84652,1 --4/4 Supply Crates collected
step
    .goto 2372,40.42,46.28
    >>击败|cRXP_ENEMY_Joseph the Enlightened|r
    .complete 84651,1 --1/1 Enemy leader defeated
    .mob Joseph the Enlightened
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Karga Bloodfury|r和|cRXP_FRIENDLY_Faerin Lothar|r交谈
    .turnin 84651 >>提交任务:熟悉的面孔
    .turnin 84652 >>提交补给任务
    .goto 2372,40.94,53.55
    .target +Karga Bloodfury
    .accept 84656 >>接受任务：前往落锤镇
    .goto 2372,40.83,53.57
    .target +Faerin Lothar
step
    .goto 2372,69.71,39.22 --clickradius
    .goto 2372,69.71,39.37 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Faerin Lothar|r交谈
    .turnin 84656 >>提交任务:前往落锤镇
    .target Faerin Lothar
step
    .goto 2372,69.71,39.22 --clickradius
    .goto 2372,69.70,39.15 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .accept 84704 >>接受任务：不同的视角
    .target Eitrigg
step
    #loop
    .goto 2372,70.18,37.76,6,0
    .goto 2372,68.94,35.05,6,0
    .goto 2372,69.32,34.89,6,0
    .goto 2372,69.18,31.83,6,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_补给箱|r
    *|cRXP_WARN_The third one is on the platform|r
    .complete 84704,1 --4/4 Supply Crates placed
step
    #completewith next
    #label To See a Troll
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .turnin 84704 >>提交任务:不同的视角
    .target Faerin Lothar
    .accept 84707 >>接受任务：会见一名巨魔
    .disablecheckbox
step
    #completewith To See a Troll
    #title |cFFFCDC00进入房屋|r
    .goto 2372,69.14,33.07,5 >>进入房屋
step
    #requires To See a Troll
    .goto 2372,69.45,32.95 --clickradius
    .goto 2372,69.57,32.88 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .turnin 84704 >>提交任务:不同的视角
    .target Faerin Lothar
    .accept 84707 >>接受任务：会见一名巨魔
step
    #completewith next
    #label Withering the Witherbark
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 84707 >>交任务:去看一个巨魔
    .target Overlord Geya'rah
    .accept 84705 >>接受任务：枯萎树皮
    .disablecheckbox
    .accept 84706 >>接受任务：犯罪家族任务
    .disablecheckbox
step
    #completewith Withering the Witherbark
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,69.14,33.07,5 >>离开这所房子
step
    #requires Withering the Witherbark
    .goto 2372,54.44,63.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 84707 >>交任务:去看一个巨魔
    .target Overlord Geya'rah
    .accept 84705 >>接受任务：枯萎树皮
    .accept 84706 >>接受任务：犯罪家族任务
step
    #completewith Perry
    >>击杀|cRXP_ENEMY_枯木巨魔|r
    .complete 84705,1 --15/15 Witherbark troll slain
    .mob Witherbark Headhunter
    .mob Witherbark Axe Thrower
    .mob Witherbark Shadow Hunter
step
    .goto 2372,66.49,61.46 --clickradius
    .goto 2372,66.53,61.31 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crestor|r交谈
    .complete 84706,3 --1/1 Crestor saved
    .skipgossipid 124871
    .target Crestor
step
    .goto 2372,68.08,67.41 --clickradius
    .goto 2372,68.21,67.52 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍尔特|r交谈
    .complete 84706,2 --1/1 Holt saved
    .skipgossipid 124867
    .target Holt
step
    #label Perry
    .goto 2372,63.95,72.43 --clickradius
    .goto 2372,64.00,72.61 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_派瑞·加奈尔|r 交谈
    .complete 84706,1 --1/1 Perry saved
    .skipgossipid 124855
    .target Perry
step
    #loop
    .goto 2372,61.92,72.92,40,0
    .goto 2372,60.48,72.92,40,0
    .goto 2372,59.74,71.74,40,0
    .goto 2372,58.76,68.44,40,0
    .goto 2372,60.56,65.47,40,0
    .goto 2372,62.81,63.18,40,0
    .goto 2372,65.19,65.87,40,0
    >>击杀|cRXP_ENEMY_Witherbark巨魔|r
    .complete 84705,1 --15/15 Witherbark troll slain
    .mob Witherbark Headhunter
    .mob Witherbark Axe Thrower
    .mob Witherbark Shadow Hunter
    .mob Witherbark Raider
step
    .goto 2372,54.45,63.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 84705 >>提交枯萎树皮
    .turnin 84706 >>交还犯罪家族任务
    .accept 84708 >>接受任务：“辛迪加”反击
    .target Overlord Geya'rah
step
    .goto 2372,69.72,40.93 --clickradius
    .goto 2372,69.60,41.06 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 84708 >>提交《辛迪加反击》
    .accept 85451 >>接受任务：落锤镇的燃烧
    .mob Overlord Geya'rah
step
    .goto 2372,69.72,40.93 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r和|cRXP_FRIENDLY_法琳·洛萨|r交谈
    .accept 84709 >>接任务: |cRXP_LOOT_落锤镇|r Down
    .goto 2372,69.72,40.93
    .target +Eitrigg
    .accept 84710 >>接受任务：一朝被蛇咬, 十年怕井绳
    .goto 2372,69.83,41.07
    .target +Faerin Lothar
step
    #completewith Syndicates
    >>击杀|cRXP_ENEMY_Syndicate势力|r
    .complete 84709,1 --Retake Hammerfall (100%)
    .mob Syndicate Torchthrower
    .mob Syndicate Battle Shredder
    .mob Imposter Refugee
    .mob Syndicate Pyromancer
step
    .goto 2372,69.64,36.11
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,1 --1/1 East Spirit Lodge saved
step
    .goto 2372,68.44,37.15
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,2 --1/1 West Spirit Lodge saved
step
    .goto 2372,67.85,35.27
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,3 --1/1 Stables saved
step
    .goto 2372,68.97,33.23
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,5 --1/1 Great Hall saved
step
    .goto 2372,69.28,32.89
    >>击败|cRXP_ENEMY_Joseph the Enlightened|r|cRXP_WARN_在大殿内|r
    .complete 84710,1 --1/1 Joseph the Enlightened defeated
    .mob Joseph the Enlightened
step
    #completewith next
    #label Blacksmith
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,4 --1/1 Blacksmith saved
step    
    #completewith Blacksmith
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,69.02,33.06,10 >>离开这所房子
step
    #requires Blacksmith
    #label Syndicates
    .goto 2372,68.44,31.96
    >>使用 |T971277:0|t[|cRXP_WARN_ExtraActionButton|r]
    .complete 85451,4 --1/1 Blacksmith saved
step
    #loop
    .goto 2372,69.23,34.83,30,0
    .goto 2372,70.11,38.11,30,0
    .goto 2372,67.82,35.7,30,0
    >>击杀|cRXP_ENEMY_Syndicates|r
    .complete 84709,1 --Retake Hammerfall (100%)
    .mob Syndicate Torchthrower
    .mob Syndicate Battle Shredder
    .mob Imposter Refugee
    .mob Syndicate Pyromancer
step
    .goto 2372,68.46,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r和|cRXP_FRIENDLY_法林·洛萨|r和|cRXP_FRIENDLY_霸主戈亚拉|r谈话
    .turnin 84709 >>交任务: |cRXP_FRIENDLY_落锤镇|r Down
    .target +Eitrigg
    .turnin 84710 >>交还任务“一朝被蛇咬, 十年怕井绳”
    .target +Faerin Lothar
    .turnin 85451 >>提交《落锤镇的燃烧》
    .accept 84711 >>接受任务：丹纳特失踪
    .target +Overlord Geya'rah
step
    .goto 2372,41.55,61.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .turnin 84711 >>提交丹ath的失踪事件
    .accept 84712 >>接受任务：假旗
step
    .goto 2372,41.62,61.74
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Dead Horse|r
    .complete 84712,2 --1/1 Dead Horse investigated
    .skipgossipid 125032
    .target Dead Horse
step
    .goto 2372,42.15,61.18
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orcish Axe|r
    .complete 84712,1 --1/1 Orcish Axe investigated
    .skipgossipid 125039
step
    .goto 2372,40.86,61.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Suspicious Dirt|r
    .complete 84712,3 --1/1 Suspicious Dirt investigated
    .skipgossipid 125040
step
    .goto 2372,41.56,61.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
    .complete 84712,4 --1/1 Speak to Overlord Geya'rah
    .timer 25,RP
    .target Overlord Geya'rah
    .skipgossipid 125047
step
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 84712,5 --1/1 Listen to the conversation
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首领 Geya'rah|r和|cRXP_FRIENDLY_Faerin Lothar|r交谈
    .turnin 84712 >>提交假旗帜
    .goto 2372,41.55,61.56
    .target +Overlord Geya'rah
    .accept 84657 >>接受任务：返回激流堡
    .goto 2372,41.49,61.42
    .target +Faerin Lothar
step
    #completewith next
    #label Nials
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与激流堡军营中的奈尔斯交谈|r
    .complete 84657,1 --1/1 Speak with Nials in the Stromgarde barracks
    .skipgossipid 131973
    .target Nials in the Stromgarde barracks
step
    #completewith Nials
    #title |cFFFCDC00进入房屋|r
    .goto 2372,17.54,60.62,10 >>进入房屋
step
    #requires Nials
    .goto 2372,17.52,59.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与激流堡军营中的奈尔斯交谈|r
    .complete 84657,1 --1/1 Speak with Nials in the Stromgarde barracks
    .timer 12,RP
    .skipgossipid 131973
    .target Nials in the Stromgarde barracks
step   
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 84657,2 --1/1 Await rescue
step
    .goto 2372,17.73,60.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗德里克·布鲁斯顿队长|r交谈
    .turnin 84657 >>提交任务:返回激流堡
    .accept 87299 >>接受任务：这些东西有多老？
    .accept 84659 >>接受任务：寻找法瑞恩的
    .target Captain Roderick Brewston
step
    #completewith next
    #hidewindow
    #label Army Tent
    .complete 84659,1 --1/1 Army tent searched
step
    #completewith Army Tent
    .goto 2372,17.88,60.42,5,0
    .goto 2372,17.97,59.51,5,0
    .goto 2372,17.66,59.57,6,0
    #title |cFFFCDC00离开这所房子|r
    .goto 2372,17.54,60.63,3 >>离开这所房子
step
    #requires Army Tent
    #completewith Proof2
    >>击杀|cRXP_ENEMY_Red Dawns|r. 击败他们后搜刮 |T5197944:0|t[|cRXP_LOOT_Proof|r]
    .complete 87299,1 --20/20 Articles of Proof
    .mob Red Dawn Enforcer
    .mob Red Dawn Firebrand
    .mob Red Dawn Houndmaster
    .mob Red Dawn Confessor
step
    #requires Army Tent
    #label Army tent2
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_红 dawn 书|r
    .complete 84659,1 --1/1 Army tent searched
    .skipgossipid 132032
step
    #requires Army Tent
    #completewith Army tent2
    #title |cFFFCDC00进入帐篷|r
    .goto 2372,15.51,61.8,10 >>进入帐篷
step
    #requires Army tent2
    .goto 2372,15.19,61.93
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_书|r
    .complete 84659,1 --1/1 Army tent searched
    .skipgossipid 132032
step
    #completewith next
    #hidewindow
    #label Inn basement
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_卷轴|r
    .complete 84659,2 --1/1 Inn basement searched
step
    #completewith Inn basement
    #title |cFFFCDC00进入酒馆|r
    .goto 2372,15.51,61.8,6,0
    .goto 2372,15.15,64.89,5 >>进入酒馆
step
    #requires Inn basement
    #completewith next
    #label Inn basement2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_卷轴|r
    .complete 84659,2 --1/1 Inn basement searched
    .skipgossipid 132030
step
    #completewith Inn basement2
    #requires Inn basement
    #hidewindow
    #title |cFFFCDC00跟随箭头指引|r
    .goto 2372,14.29,64.92,3,0
    .goto 2372,14.3,64.55,3,0
    .goto 2372,14.78,64.49,5 >>1
step
    #requires Inn basement2
    .goto 2372,14.47,64.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_卷轴|r
    .complete 84659,2 --1/1 Inn basement searched
    .skipgossipid 132030
step
    #requires Inn basement2
    #completewith next
    #hidewindow
    #label Inn basement3
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Red Dawn Book|r
    .complete 84659,4 --1/1 Home searched
 step
    #completewith Inn basement3
    #requires Inn basement2
    #title |cFFFCDC00跟随箭头指引|r
    .goto 2372,14.78,64.49,5,0
    .goto 2372,14.3,64.55,3,0
    .goto 2372,14.29,64.92,3,0
    .goto 2372,15.2,64.89,5 >>离开旅店
step
    #requires Inn basement3
    #completewith next
    #label Home searched
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_红 dawn 书|r
    .complete 84659,4 --1/1 Home searched
    .skipgossipid 132033
step
    #requires Inn basement3
    #completewith Home searched
    #title |cFFFCDC00进入房屋|r
    .goto 2372,16.38,68.54,5 >>进入房屋
step
    #requires Home searched
    .goto 2372,16.34,68.87
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_红 dawn 书|r
    .complete 84659,4 --1/1 Home searched
    .skipgossipid 132033
step
    #completewith next
    #label Tavern searched
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_红 dawn 书|r
    .complete 84659,3 --1/1 Tavern searched
step
    #completewith Tavern searched
    #title |cFFFCDC00进入酒馆|r
    .goto 2372,16.33,68.46,5,0
    .goto 2372,13.89,69.28,5 >>进入酒馆
step
    #requires Tavern searched
    .goto 2372,14.19,69.33
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_红 dawn 书|r
    .complete 84659,3 --1/1 Tavern searched
    .skipgossipid 132031
step
    #completewith next
    #hidewindow
    #label Mage Tower
    .complete 84659,5 --1/1 Mage tower searched
step
    #completewith Mage Tower
    #title |cFFFCDC00跟随箭头指引|r
    .goto 2372,11.3,70.44,5 >>进入法师塔
step
    #requires Mage Tower
    .goto 2372,11.32,70.43,5,0
    .goto 2372,11.07,70.85,5,0
    .goto 2372,11.06,70.4,5,0
    .goto 2372,11.33,70.59,5,0
    .goto 2372,11.22,70.82,5,0
    .goto 2372,10.99,70.42,5,0
    .goto 2372,17.52,60.58,10,0
    .goto 2372,10.99,70.42
    #title |cFFFCDC00Climb the tower|r
    .complete 84659,5 --1/1 Mage tower searched
step
    #label Proof2
    .goto 2372,10.99,70.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .complete 84659,6 --1/1 Faerin freed
    .skipgossipid 132034
    .target Faerin Lothar
step
    #completewith next
    #label Mage tower searched2
    >>击杀 |cRXP_ENEMY_红日|r. 从他们身上搜刮任何 |T5197944:0|t[|cRXP_LOOT_证据之物|r]
    .complete 87299,1 --20/20 Articles of Proof
    .mob Red Dawn Enforcer
    .mob Red Dawn Firebrand
    .mob Red Dawn Houndmaster
step
    #completewith Mage tower searched2
    #title |cFFFCDC00离开法师塔|r
    .goto 2372,11.3,70.5,5,0
    .goto 2372,11.09,70.84,5,0
    .goto 2372,11.42,70.34,3 >>离开法师塔
step
    #requires Mage tower searched2
    .goto 2372,12.67,67.87,30,0
    .goto 2372,14.41,68.01,30,0
    .goto 2372,16.79,63.08,30,0
    .goto 2372,18.83,61.64,30,0
    .goto 2372,22.14,60.01,30,0
    .goto 2372,20.55,62.09,30,0
    .goto 2372,17.91,66.7,30,0
    .goto 2372,15.97,67.7,30,0
    >>击杀 |cRXP_ENEMY_Red Dawns|r. 击败他们后搜刮 |T5366050:0|t[|cRXP_LOOT_Proof|r]
    .complete 87299,1 --20/20 Articles of Proof
    .mob Red Dawn Enforcer
    .mob Red Dawn Firebrand
    .mob Red Dawn Houndmaster
    .mob Red Dawn Confessor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗德里克·布鲁斯顿船长|r和|cRXP_FRIENDLY_法琳·洛萨|r交谈
    .turnin 87299 >>交还任务:这些东西有多老了？
    .turnin 84659 >>提交《寻找费林》
    .goto 2372,19.33,59.26
    .target +Captain Roderick Brewston
    .accept 84717 >>接受任务：红日崛起
    .goto 2372,19.45,59.19
    .target +Faerin Lothar
step
    .goto 2372,19.46,64.73
    >>击杀|cRXP_ENEMY_Joseph the Enlightened|r(|cRXP_WARN_第三次是幸运之兆|r)
    .complete 84717,1 --1/1 Joseph the Enlightened slain
    .mob Joseph the Enlightened
step
    .goto 2372,21.64,65.06
    #title |cFFFCDC00跟随箭头指引|r
    .complete 84717,2 --1/1 Danath and Eitrigg found
step
    .goto 2372,21.64,65.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Danath Trollbane|r交谈
    .turnin 84717 >>提交《红日崛起》
    .accept 85529 >>接受任务：昔日荣光
    .target Danath Trollbane
step
    .goto 2372,20.46,44.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Faerin|r交谈
    .complete 85529,1 --1/1 Speak to Faerin
    .timer 70,RP
    .skipgossipid 125097
step
    .goto 2372,20.46,44.45
    >>|cRXP_WARN_请等待剧情互动|r.
    .complete 85529,2 --1/1 Listen to Faerin and Danath
    .target Faerin
step
    .goto 2372,20.46,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法林·洛瑟尔|r交谈
    .turnin 85529 >>交还过去的荣耀
    .target Faerin Lothar
step 
    .goto 2372,20.66,44.97
    .zone 2339 >>点击传送门前往多尔诺加尔
]])
