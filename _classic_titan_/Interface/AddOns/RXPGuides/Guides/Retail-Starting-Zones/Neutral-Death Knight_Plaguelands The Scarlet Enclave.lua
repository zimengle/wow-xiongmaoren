RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 起始区域
#groupweight 8
#subgroup 死亡骑士起始区域
#name 1零售-联盟-死亡骑士_瘟疫之地 血色领地 << Alliance
#name 1零售-部落-死亡骑士_瘟疫之地 血色领地 << Horde
#displayname Death Knight Plaguelands
#next RestedXP 联盟 10-60\\1A_艾尔文森林 << Alliance
#next RestedXP 部落 10-60\\1 BfA 简介 << Horde
#defaultfor DK !Pandaren !KulTiran !DarkIronDwarf !LightforgedDraenei !机械侏儒 !VoidElf !HighmountainTauren !ZandalariTroll !夜之子 !Vulpera !MagharOrc

<<DK !Pandaren !KulTiran !DarkIronDwarf !LightforgedDraenei !机械侏儒 !VoidElf !HighmountainTauren !ZandalariTroll !夜之子 !Vulpera !MagharOrc

step
    #completewith next
    +欢迎来到 RestedXP 的 |cFFfa9602死亡骑士起始区|r 指南。
step
    .goto 124,51.33,35.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .accept 12593 >>接任务: |cRXP_LOOT_为巫妖王而战|r
    .target The Lich King
step
    .goto 124,47.59,28.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官拉苏维奥斯|r, , who is walking back and forth from left to right
    .turnin 12593 >>交任务: |cRXP_FRIENDLY_为巫妖王而战|r
    .accept 12619 >>接任务: |cRXP_LOOT_符文之剑|r
    .target Instructor Razuvious
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击在该区域中发现的 |cRXP_PICK_Battle-Worn Sword|r |cFFfa9602。|r
    .collect 38607,1
step
    .goto 124,47.88,27.54
    >>|cFFfa9602前往符文锻造师|r并使用|T135410:0|t[战损之剑]
    .complete 12619,1 --1/1 Runebladed Sword
    .use 38607
step
    .goto 124,47.59,28.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官拉苏维奥斯|r
    .turnin 12619 >>交任务: |cRXP_FRIENDLY_符文之剑|r
    .accept 12842 >>接任务: |cRXP_LOOT_符文熔铸：战争的准备|r
    .target Instructor Razuvious
step
    .goto 124,47.88,27.54
    >>|cFFfa9602前往符文锻造师|r打开你的法术书并在你的武器上使用[附魔冰刃]。
    .complete 12842,1 --Weapon emblazoned (1)
step
    .goto 124,47.59,28.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官拉苏维奥斯|r
    .turnin 12842 >>交任务: |cRXP_FRIENDLY_符文熔铸：战争的准备|r
    .accept 12848 >>接任务: |cRXP_LOOT_无尽的饥渴|r
    .target Instructor Razuvious
step
    .goto 124,48.59,28.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Acherus Soul Prison |r 来释放 |cRXP_ENEMY_Initiate。|r
    .complete 12848,1 --1/1 Unworthy Initiate dominated
    .mob Unworthy Initiate
step
    .goto 124,47.69,29.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_教官拉苏维奥斯|r
    .turnin 12848 >>交任务: |cRXP_FRIENDLY_无尽的饥渴|r
    .accept 12636 >>接任务: |cRXP_LOOT_阿彻鲁斯之眼|r
    .target Instructor Razuvious
step
    .goto 124,51.35,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .turnin 12636 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯之眼|r
    .accept 12641 >>接任务: |cRXP_LOOT_天降厄运|r
    .target The Lich King
step
    .goto 124,51.04,36.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_阿彻鲁斯控制机制之眼。|r
    >>使用 |T136158:0|t[阿彻鲁斯虹吸管](1) |cFFfa9602靠近红箭|r |cRXP_WARN_(不要太近否则你会受到攻击，45码范围)|r 对其进行分析。
    >>使用 |T136187:0|t[召唤食尸鬼](2) 来分散骑士的注意力。
    >>使用 [Shroud](3) 隐藏 |cRXP_WARN_(可在行走时使用)|r
    >>完成后使用 |T136190:0|t[召回阿彻鲁斯之眼] (4)。
    .complete 12641,1 --1/1 New Avalon Forge Analyzed
    .complete 12641,3 --1/1 Scarlet Hold Analyzed
    .complete 12641,2 --1/1 New Avalon Town Hall Analyzed
    .complete 12641,4 --1/1 Chapel of the Crimson Flame Analyzed
step
    .goto 124,51.34,35.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .turnin 12641 >>交任务: |cRXP_FRIENDLY_天降厄运|r
    .accept 12657 >>接任务: |cRXP_LOOT_天灾的力量|r
    .target The Lich King
step
    .goto 124,50.43,33.2,10,0
    .goto 124,48.88,29.75
    >>走上|cFFfa9602紫色传送器|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 12657 >>交任务: |cRXP_FRIENDLY_天灾的力量|r
    .accept 12850 >>接任务: |cRXP_LOOT_向天灾指挥官萨拉诺尔报到|r
    .target Highlord Darion Mograine
step
    .goto 124,47.47,26.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索瓦尔勋爵|r
    .turnin 12849 >>交任务: |cRXP_FRIENDLY_鲜血、冰霜与邪恶的力量|r
    .target Lord Thorval
step
    .goto 124,50.68,34.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_天灾指挥官萨拉诺尔|r
    .turnin 12850 >>交任务: |cRXP_FRIENDLY_向天灾指挥官萨拉诺尔报到|r
    .accept 12670 >>接任务: |cRXP_LOOT_血色收割|r
step
    #fresh
    .goto 124,52.08,35.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击阳台上的 |cRXP_FRIENDLY_Scourge Gryphon|r |cFFfa9602。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .turnin 12670 >>交任务: |cRXP_FRIENDLY_血色收割|r
    .accept 12678 >>接任务: |cRXP_LOOT_混乱战车，苦痛驭之|r
    .target Prince Valanar
step
    #veteran
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击阳台上的 |cRXP_FRIENDLY_Scourge Gryphon|r |cFFfa9602。|r
    >>|cRXP_WARN_您已经可以上马了，无需等待解锁DK坐骑。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .goto 124,52.08,35.04
    .turnin 12670 >>交任务: |cRXP_FRIENDLY_血色收割|r
    .accept 12678 >>接任务: |cRXP_LOOT_混乱战车，苦痛驭之|r
    .target Prince Valanar
step
    .goto 124,52.67,34.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_骑手萨拉纳尔|r
    .accept 12680 >>接任务: |cRXP_LOOT_阿彻鲁斯战马|r
    .target Salanar the Horseman
step
    .goto 124,54.44,33.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_战斗召唤者奥尔伦|r
    .accept 12733 >>接任务: |cRXP_LOOT_死亡的挑战|r
    .target Olrun the Battlecaller
step
    .goto 124,52.79,34.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Death Knight Initiates|r found in the area |cRXP_WARN_and defeat them in a duel|r
    .complete 12733,1 --5/5 Death Knights defeated in a duel
    .skipgossip
    .mob Death Knight Initiate
step
    .goto 124,52.31,38.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_遮天者奥里索斯|r
    .accept 12679 >>接任务: |cRXP_LOOT_今夜，我们在海文郡欢宴！|r
    .target Orithos the Sky Darkener
step
    #completewith arrowspart2time
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击地面上的箭头|cFFfa9602。|r
    .complete 12679,1 --15/15 Saronite Arrow
step
    #completewith next
    .goto 124,55.25,46.16,10,0
    .goto 124,54.11,52.21
    >>杀死 |cRXP_ENEMY_Crusaders|r 和 |cRXP_ENEMY_Citizens|r
    .complete 12678,1 --10/10 Scarlet Crusader slain
    .complete 12678,2 --10/10 Citizen of Havenshire slain
    .target Scarlet Crusader
    .target Citizen of Havenshire
step
    goto 124,55.25,46.16
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击邮箱上的 |cRXP_PICK_Abandoned Mail|r |cFFfa9602。|r
    .turnin 12711 >>交任务: |cRXP_FRIENDLY_被遗弃的信件|r
step
    #label arrowspart2time
    .goto 124,55.25,46.16,10,0
    .goto 124,54.11,52.21
    >>杀死 |cRXP_ENEMY_Crusaders|r 和 |cRXP_ENEMY_Citizens|r
    .complete 12678,1 --10/10 Scarlet Crusader slain
    .complete 12678,2 --10/10 Citizen of Havenshire slain
    .target Scarlet Crusader
    .target Citizen of Havenshire
step
    #label Area1
    .goto 124,58.75,50.49,60,0
    .goto 124,55.96,55.93,60,0
    .goto 124,53.93,51.15,60,0
    .goto 124,57.76,47.14
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击地面上的箭头|cFFfa9602。|r
    .complete 12679,1 --15/15 Saronite Arrow
step
    #requires Area1
    .goto 124,55.4,41.6,30,0
    .goto 124,51.41,41.09,30,0
    .goto 124,52.83,34.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Horse|r |cFFfa9602马厩附近的马|r 互动，小心 |cRXP_ENEMY_Stable Master Kitrik|r
    >>使用 |T135788:0|t[疾驰](2) 来提高移动速度，并在 |cRXP_FRIENDLY_Salanar the Horseman|r 面前交出 |T132261:0|t[偷来的马](1)，而他正在街道上巡逻 |cFFfa9602。|r
    .complete 12680,1 --1/1 Horse Successfully Stolen
    .target Salanar the Horseman
step
    .goto 124,53.00,33.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_骑手萨拉纳尔|r
    .turnin 12680 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯战马|r
    .accept 12687 >>接任务: |cRXP_LOOT_进入暗影界|r
    .target Salanar the Horseman
step
    .goto 124,55.4,41.6,30,0
    .goto 124,51.16,37.82
    >>Kill a |cRXP_ENEMY_Dark Rider of Acherus|r |cFFfa9602near the stables|r and |TInterface/cursor/crosshair/interact.blp:20|tInteract with the horse
    >>回到城里后，使用|T136129:0|t[骑士的召唤]送马|cFFfa9602。|r
    .complete 12687,1
step
    .goto 124,51.84,35.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_骑手萨拉纳尔|r
    .turnin 12687 >>交任务: |cRXP_FRIENDLY_进入暗影界|r
    .target Salanar the Horseman
step
    .goto 124,52.43,37.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_遮天者奥里索斯|r
    .turnin 12679,1 >>交任务: |cRXP_FRIENDLY_今夜，我们在海文郡欢宴！|r
    .target Orithos the Sky Darkener
step
    .goto 124,54.60,33.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_战斗召唤者奥尔伦|r
    .turnin 12733 >>交任务: |cRXP_FRIENDLY_死亡的挑战|r
    .target Olrun the Battlecaller
step
    .goto 124,52.28,34.00|cFFfa9602|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .turnin 12678 >>交任务: |cRXP_FRIENDLY_混乱战车，苦痛驭之|r
    .accept 12697 >>接任务: |cRXP_LOOT_收割者戈提克|r
    .target Prince Valanar
step
    .goto 124,54.09,35.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_收割者戈提克|r
    .turnin 12697 >>交任务: |cRXP_FRIENDLY_收割者戈提克|r
    .accept 12698 >>接任务: |cRXP_LOOT_收割者的礼物|r
    .target Gothik the Harvester
step
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r 
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    .goto 124,58.27,30.98,5,0
    --x insert more goto's
    >>对 |cRXP_ENEMY_Miner|r 使用 |T133882:0|t[收割者的礼物] 直到有 [5] |cRXP_FRIENDLY_Scarlet Ghouls|r 跟随你然后返回 |cRXP_FRIENDLY_收割者哥提克|r。
    >>|cRXP_WARN_矿工并不总是会变成友善的 |cRXP_FRIENDLY_Scarlet Ghouls|r|r
    .complete 12698,1 --5/5 Scarlet Ghoul Returned
    .use 39253
    .mob Scarlet Ghoul
    .mob Scarlet Infantryman 
    .target Gothik the Harvester
step
    .goto 124,54.07,35.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_收割者戈提克|r
    .turnin 12698 >>交任务: |cRXP_FRIENDLY_收割者的礼物|r
    .accept 12700 >>接任务: |cRXP_LOOT_伺机待发|r
    .target Gothik the Harvester
step
    .goto 124,52.28,33.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .turnin 12700 >>交任务: |cRXP_FRIENDLY_伺机待发|r
    .accept 12701 >>接任务: |cRXP_LOOT_炮轰圣光哨站|r
    .target Prince Valanar
step
    .goto 124,67.78,39.25
    >>|cRXP_WARN_前往船上，确保尽可能多地躲避敌人。|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Cannon|r 并使用 (1) 杀死敌人，如果敌人靠得太近则使用 (2)，使用 (3) 逃跑。
    .complete 12701,1 --100/100 Scarlet Defender slain
    .mob Scarlet Defender
step
    .goto 124,52.28,33.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .turnin 12701 >>交任务: |cRXP_FRIENDLY_炮轰圣光哨站|r
    .accept 12706 >>接任务: |cRXP_LOOT_死亡裂口大捷！|r
    .target Prince Valanar 
step
    #completewith next
    .hs >>天灾石炉石到阿彻鲁斯|cRXP_WARN_（不要使用炉石玩具！）|r
step
    .goto 124,50.43,33.23,10,0
    .goto 124,48.87,29.75
    >>走上|cFFfa9602紫色传送器|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 12706 >>交任务: |cRXP_FRIENDLY_死亡裂口大捷！|r
    .accept 12714 >>接任务: |cRXP_LOOT_巫妖王的意志|r
    .target Highlord Darion Mograine
step
    .goto 124,53.46,36.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Skeleton Gryphon|r 互动
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦拉纳王子|r
    .turnin 12714 >>交任务: |cRXP_FRIENDLY_巫妖王的意志|r
    .accept 12715 >>接任务: |cRXP_LOOT_追忆墓穴|r
    .target Skeleton Gryphon
    .target Prince Valanar
step
    .goto 124,55.91,52.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_药剂师诺斯|r
    .accept 12716 >>接任务: |cRXP_LOOT_药剂师的要求|r
    .target Noth the Plaguebringer
step
    .goto 124,54.06,58.14,10 >>|cFFfa9602进入墓穴。|r
step
    .goto 124,54.30,57.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯雷塞斯王子|r
    .turnin 12715 >>交任务: |cRXP_FRIENDLY_追忆墓穴|r
    .accept 12719 >>接任务: |cRXP_LOOT_无路可逃，无处可藏|r
    .target Prince Keleseth
step
    .goto 124,54.66,57.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞文戴尔男爵|r
    .accept 12722 >>接任务: |cRXP_LOOT_羊入虎口|r
    .target Baron Rivendare
step
    #completewith citizenrequirementtime
    >>杀死 |cRXP_ENEMY_Scarlet Crusaders|r、|cRXP_ENEMY_Citizens|r 并掠夺他们以获得 |cRXP_LOOT_Crusader Skull|r
    .complete 12722,1 --10/10 Scarlet Crusade Soldier slain
    .complete 12716,3 --10/10 Crusader Skull
    .complete 12722,2 --15/15 Citizen of New Avalon slain
    .mob Scarlet Crusade Soldier
    .mob Citizen of New Avalon
step
    .goto 124,52.61,71.72
    >>杀死|cRXP_ENEMY_Mayor Quimby|r |cFFfa9602市政厅内|r
    .complete 12719,1 --1/1 Mayor Quimby slain
    .mob Mayor Quimby
step
    .goto 124,52.46,71.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Book|r
    .complete 12719,2 --1/1 New Avalon Registry
step
    .goto 124,57.77,61.90
    >>|cFFfa9602进入旅馆然后进入地下室。|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Empty Cauldron|r
    .complete 12716,1 --1/1 Empty Cauldron
step
    #label citizenrequirementtime
    .goto 124,62.03,60.24
    >>|cFFfa9602 去铁匠铺。|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Iron Chain。|r
    .complete 12716,2 --1/1 Iron Chain
step
    .goto 124,57.77,61.90,40,0
    .goto 124,52.61,71.72,80,0
    .goto 124,62.03,60.24
    >>杀死 |cRXP_ENEMY_Scarlet Crusaders|r、|cRXP_ENEMY_Citizens|r 并掠夺他们以获得 |cRXP_LOOT_Crusader Skull|r
    .complete 12722,1 --10/10 Scarlet Crusade Soldier slain
    .complete 12716,3 --10/10 Crusader Skull
    .complete 12722,2 --15/15 Citizen of New Avalon slain
    .mob Scarlet Crusade Soldier
    .mob Citizen of New Avalon
step
    .goto 124,54.29,57.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯雷塞斯王子|r
    .turnin 12719 >>交任务: |cRXP_FRIENDLY_无路可逃，无处可藏|r
    .accept 12720 >>接任务: |cRXP_LOOT_说服者|r
    .target Prince Keleseth
step
    .goto 124,54.67,57.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞文戴尔男爵|r
    .turnin 12722 >>交任务: |cRXP_FRIENDLY_羊入虎口|r
    .target Baron Rivendare
step
    .goto 124,55.88,52.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_药剂师诺斯|r
    .turnin 12716 >>交任务: |cRXP_FRIENDLY_药剂师的要求|r
    .accept 12717 >>接任务: |cRXP_LOOT_诺斯的特殊药剂|r
    .target outside of the Crypt
step
    .goto 124,56.15,52.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Plague Cauldron。|r
    .turnin 12717 >>交任务: |cRXP_FRIENDLY_诺斯的特殊药剂|r
step
    #completewith next
    .use 39418 >>使用 |T132595:0|t华丽珠宝盒并装备武器
    .collect 39371,2
    .collect 142274,1
step
    .goto 124,55.79,65.73
    >>自动攻击 |cRXP_ENEMY_Scarlet Enemies|r 直到他们说话。不要使用技能。|cRXP_WARN_（如果你运气不好，这可能需要一段时间）|r
    .complete 12720,1
step
    .goto 124,54.29,57.31
    >>|cRXP_WARN_别忘了重新装备你的武器！！|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯雷塞斯王子|r
    .turnin 12720 >>交任务: |cRXP_FRIENDLY_说服者|r
    .accept 12723 >>接任务: |cRXP_LOOT_深入血色敌后|r
    .target Prince Keleseth
step
    .goto 124,56.26,79.84
    >>|cFFfa9602走进屋子，然后上楼。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥尔巴兹·血毒|r
    .turnin 12723 >>交任务: |cRXP_FRIENDLY_深入血色敌后|r
    .accept 12724 >>接任务: |cRXP_LOOT_十字军的巡逻路线|r
    .target Orbaz Bloodbane
step
    .goto 124,56.27,80.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨萨里安|r
    .accept 12725 >>接任务: |cRXP_LOOT_死亡骑士的兄弟情谊|r
    .target Thassarian
step
    .goto 124,62.95,67.87
    >>|cFFfa9602进入城堡并进入地下室|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库尔迪拉·织亡者|r 
    >>|cRXP_WARN_你可能必须等他重生。|r
    .turnin 12725 >>交任务: |cRXP_FRIENDLY_死亡骑士的兄弟情谊|r
    .accept 12727 >>接任务: |cRXP_LOOT_杀出一条血路|r
    .target 库尔迪拉·死亡编织者
step
    >>Kill |cRXP_ENEMY_the waves of enemies|r and kill |cRXP_ENEMY_Valroth|r and |TInterface/cursor/crosshair/interact.blp:20|tClick his remains after.
    .complete 12727,1 --1/1 Valroth's Head
step
    .goto 124,62.98,68.31
    >>|cFFfa9602上楼去 within the keep|r and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_book.|r
    .complete 12724,1 --1/1 New Avalon Patrol Schedule
step
    .goto 124,56.24,79.84
    >>|cFFfa9602上楼到屋顶然后从城堡上跳下来|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥尔巴兹·血毒|r
    .turnin 12724 >>交任务: |cRXP_FRIENDLY_十字军的巡逻路线|r
    .target Orbaz Bloodbane
step
    .goto 124,56.28,80.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨萨里安|r
    .turnin 12727 >>交任务: |cRXP_FRIENDLY_杀出一条血路|r
    .accept 12738 >>接任务: |cRXP_LOOT_复仇的呐喊！|r
    .target Thassarian
step
    .goto 124,52.97,82.19
    >>|cFFfa9602走出屋子。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r
    .turnin 12738 >>交任务: |cRXP_FRIENDLY_复仇的呐喊！|r
    .accept 28650 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Goblin
    .accept 28649 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Worgen
    .accept 12739 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Tauren
    .accept 12742 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Human
    .accept 12743 >>接任务: |cRXP_LOOT_特殊的怜悯|r << NightElf
    .accept 12744 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Dwarf
    .accept 12745 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Gnome
    .accept 12746 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Draenei
    .accept 12747 >>接任务: |cRXP_LOOT_特殊的怜悯|r << BloodElf
    .accept 12748 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Orc
    .accept 12749 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Troll
    .accept 12750 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Undead
    .target Knight Commander Plaguefist
step
    .goto 124,54.30,83.31 << BloodElf
    .goto 124,54.14,83.28 << Worgen
    .goto 124,53.54,83.79 << Human
    .goto 124,54.54,83.43 << Draenei
    .goto 124,54.02,83.29 << Dwarf
    .goto 124,53.77,83.28 << Orc
    .goto 124,53.54,83.31 << Undead
    .goto 124,53.79,83.7 << Troll
    .goto 124,53.93,83.8 << Gnome
    .goto 124,54.25,83.91 << NightElf
    .goto 124,54.11,83.75 << Goblin
    .goto 124,54.5,83.85 << Tauren
    >>进入房子，在 |cRXP_FRIENDLY_Lord Harford|r 面前等候，然后杀死他们 << Worgen
    >>进入房子，在 |cRXP_FRIENDLY_Lady Eonys|r 前面等候，然后杀死他们 << BloodElf
    >>进入房子，在 |cRXP_FRIENDLY_Donovan Pulfrost|r 面前等候，然后杀死他们 << Dwarf
    >>进入房子，在 |cRXP_FRIENDLY_Kug Ironjaw|r 前面等待，然后杀死他们 << Orc
    >>进入房子，在 |cRXP_FRIENDLY_Antoine Brack|r 面前等待，然后杀死他们 << Undead
    >>进入房子，在 |cRXP_FRIENDLY_Ellen Stanbridge|r 面前等候，然后杀死他们 << Human
    >>进入房子，在 |cRXP_FRIENDLY_Iggy Darktusk|r 前面等待，然后杀死他们 << Troll
    >>进入房子，在 |cRXP_FRIENDLY_Goby Blastenheimer 面前等待 |rt然后杀死他们 << Gnome
    >>进入房子，在 |cRXP_FRIENDLY_Gally Lumpstain|r 前面等待，然后杀死他们 << Goblin
    >>进入房子，在 |cRXP_FRIENDLY_Yazmina Oakenthorn|r 前面等待，然后杀死他们 << NightElf
    >>进入房子，在 |cRXP_FRIENDLY_Malar Bravehorn|r 前面等待然后杀死他们 << Tauren
    >>进入房子，在 |cRXP_FRIENDLY_Valok the Righteous|r 面前等待，然后杀死他们 << Draenei
    .complete 28650,1 >>完成特别惊喜 << Goblin
    .complete 28649,1 >>完成特别惊喜 << Worgen
    .complete 12739,1 >>完成特别惊喜 << Tauren
    .complete 12742,1 >>完成特别惊喜 << Human
    .complete 12743,1 >>完成特别惊喜 << NightElf
    .complete 12744,1 >>完成特别惊喜 << Dwarf
    .complete 12745,1 >>完成特别惊喜 << Gnome
    .complete 12746,1 >>完成特别惊喜 << Draenei
    .complete 12747,1 >>完成特别惊喜 << BloodElf
    .complete 12748,1 >>完成特别惊喜 << Orc
    .complete 12749,1 >>完成特别惊喜 << Troll
    .complete 12750,1 >>完成特别惊喜 << Undead
step
    .goto 124,52.94,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r
    .turnin 28650,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Goblin
    .turnin 28649,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Worgen
    .turnin 12739,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Tauren
    .turnin 12742,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Human
    .turnin 12743,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << NightElf
    .turnin 12744,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Dwarf
    .turnin 12745,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Gnome
    .turnin 12746,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Draenei
    .turnin 12747,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << BloodElf
    .turnin 12748,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Orc
    .turnin 12749,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Troll
    .turnin 12750,1 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Undead
    .accept 12751 >>接任务: |cRXP_LOOT_欢迎回家|r
    .target Knight Commander Plaguefist
step
    .goto 124,56.26,80.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨萨里安|r
    .turnin 12751 >>交任务: |cRXP_FRIENDLY_欢迎回家|r
    .target Thassarian
step
    .goto 124,56.25,79.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥尔巴兹·血毒|r
    .accept 12754 >>接任务: |cRXP_LOOT_悬崖伏击|r
    .target Orbaz Bloodbane
step
    .goto 124,59.69,76.6
    >>使用 136065|T967530:0|t[临时掩体] 召唤 |cRXP_ENEMY_Courier。|r 然后杀死并 |cRXP_LOOT_loot 他|r
    .complete 12754,1 --1/1 Scarlet Courier's Belongings
    .complete 12754,2 --1/1 Scarlet Courier's Message
    .use 39645
step
    .goto 124,56.27,79.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥尔巴兹·血毒|r
    .turnin 12754 >>交任务: |cRXP_FRIENDLY_悬崖伏击|r
    .accept 12755 >>接任务: |cRXP_LOOT_命运的交汇点|r
    .target Orbaz Bloodbane
step
    .goto 124,65.66,83.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莉尼亚·阿比迪斯|r 
    *|cRXP_WARN_You can mount while disguised.|r
    .turnin 12755 >>交任务: |cRXP_FRIENDLY_命运的交汇点|r
    .accept 12756 >>接任务: |cRXP_LOOT_血色先锋军|r
    .target High General Abbendis
step
    .goto 124,56.26,79.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥尔巴兹·血毒|r
    .turnin 12756 >>交任务: |cRXP_FRIENDLY_血色先锋军|r
    .accept 12757 >>接任务: |cRXP_LOOT_血色十字军进犯……|r
    .target Orbaz Bloodbane
step
    .goto 124,56.14,80.11,5,0
    .goto 124,48.88,29.75
    >>Wait for a short time and then |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Portal to Acherus|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r 
    .turnin 12757 >>交任务: |cRXP_FRIENDLY_血色十字军进犯……|r
    .accept 12778 >>接任务: |cRXP_LOOT_血色十字军的末日|r
    .target Highlord Darion Mograine
step
    .goto 124,52.08,35.04,10,0
    .goto 124,53.58,36.87
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Skeleton Gryphon|r 互动
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .turnin 12778 >>交任务: |cRXP_FRIENDLY_血色十字军的末日|r
    .accept 12779 >>接任务: |cRXP_LOOT_万物的终结……|r
    .target Skeleton Gryphon
    .target The Lich King
step
    .goto 124,54.62,65.81
    >>使用 |T134228:0|t[Horn of the Frostbrood] 来骑乘 |cRXP_FRIENDLY_Frostwyrm|r
    >>使用（1）杀死敌人和（2）对敌人进行攻击以恢复法力。
    >>|cRXP_WARN_完成后，乘坐冰霜巨龙飞回。|r
    .complete 12779,2 --10/10 Scarlet Ballista destroyed
    .complete 12779,1 --150/150 Scarlet Soldiers slain
    .use 39700
step
    .goto 124,53.55,36.83
    >>飞往|cRXP_FRIENDLY_巫妖王|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .turnin 12779 >>交任务: |cRXP_FRIENDLY_万物的终结……|r
    .accept 12800 >>接任务: |cRXP_LOOT_巫妖王的命令|r
    .target The Lich King
step
    .goto 124,49.28,28.68,10,0
    .goto 124,34.27,30.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_天灾指挥官萨拉诺尔|r
    .turnin 12800 >>交任务: |cRXP_FRIENDLY_巫妖王的命令|r
    .accept 12801 >>接任务: |cRXP_LOOT_黎明之光|r
    .target Scourge Commander Thalanor
step
    .goto 124,39.10,38.94
    >>对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r, if he's here 
    >>|cRXP_WARN_当有人与他交谈时，任务倒计时就开始了，而不仅仅是你。如果活动刚刚结束，你可能需要等待才能开始。如果活动正在进行中，请加入战斗。|r
    >>|cRXP_WARN_活动开始后，只需跟随 NPC 并等待其完成。|r
    .complete 12801,1 --1/1 The Light of Dawn Uncovered
step
    .goto 124,39.10,39.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 12801,1 >>交任务: |cRXP_FRIENDLY_黎明之光|r
    .accept 13165 >>接任务: |cRXP_LOOT_夺回阿彻鲁斯|r
    .target Highlord Darion Mograine
step
    .goto 23,83.44,49.45
    >>|cRXP_WARN_打开你的魔法书并使用​​你的死亡之门。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 13165 >>交任务: |cRXP_FRIENDLY_夺回阿彻鲁斯|r
    .accept 13166 >>接任务: |cRXP_LOOT_黑锋要塞之战|r
    .target Highlord Darion Mograine
step
    .goto 23,83.15,48.75,10,0
    .goto 23,81.72,46.70
    >>走上 |cFFfa9602紫色传送器|r 然后杀死房间里的 |cRXP_ENEMY_abominations|r |cFFfa9602。|r
    .complete 13166,2 --10/10 Scourge slain
    .complete 13166,1 --1/1 Patchwerk slain
    .target Patchwerk
step
    .goto 23,83.43,49.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 13166 >>交任务: |cRXP_FRIENDLY_黑锋要塞之战|r
    .target Highlord Darion Mograine
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r << Alliance
    .accept 13188 >>接任务: |cRXP_LOOT_王者之城|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r << Horde
    .accept 13189 >>接任务: |cRXP_WARN_酋长的祝福|r << Horde
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_前往暴风城的门户|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与安度因·乌瑞恩交谈 << Alliance
    .turnin 13188 >>交任务: |cRXP_FRIENDLY_王者之城|r << Alliance
    .goto 23,83.65,51.28,10,0 << Alliance
    .goto 84,85.91,31.57 << Alliance
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_前往奥格瑞玛的传送门|r << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与萨鲁法尔大王交谈 << Horde
    .turnin 13189 >>交任务: |cRXP_FRIENDLY_酋长的祝福|r << Horde
    .goto 85,48.53,70.71 << Horde
    .goto 23,84.56,50.45,10,0 << Horde
step <<Alliance <<DK
    #veteran
    .goto 84,61.48,31.72,5,0
    .goto 84,60.1,32.22
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师劳菲尔|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Lauffer
    .target Auctioneer Hesse
    .target Auctioneer Fitzgerald
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    #label DarkMoonFaire
    .goto 84,80.46,37.71,10,0
    .goto 84,72.51,46.59,30,0
    .goto 84,70.27,46.83,10,0
    .goto 84,62.1,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .target Darkmoon Faire Mystic Mage
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    .goto 84,62.25,72.96
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_ENEMY_暗月马戏团秘法师|r
    .skipgossip
    .zoneskip 37
    .target Darkmoon Faire Mystic Mage
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    .goto 84,73.04,47.56,25,0
    .goto 84,67.45,57.19,25,0
    .goto 84,68.59,62.19,25,0
    .goto 84,66.03,64.49,25,0
    .goto 84,64.39,67.14,25,0
    .goto 84,68.29,74.57,25,0
    .goto 84,70.92,72.45
    .fly Goldshire >>飞往 |cFFfa9602Goldshire。|r
    .nodmf
    .isQuestTurnedIn 12801 --x Traditional DK Check
]])
