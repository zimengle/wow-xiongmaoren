RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
-- #subgroup 同盟种族起始区
#name 同盟种族起始区
#displayname Chapter 1 - 至高岭牛头人 Intro << HighmountainTauren !DK
#displayname Chapter 1 - 赞达拉巨魔 Intro << ZandalariTroll !DK
#displayname Chapter 1 - 夜之子 Intro << 夜之子 !DK
#displayname Chapter 1 - Mag'har Orc Intro << MagharOrc !DK
#displayname Chapter 1 - Vulpera Intro << Vulpera !DK
#displayname Chapter 1 - New Deathknight Intro << DK
#next RestedXP 部落 10-60\\1 BfA 简介

<< HighmountainTauren/ZandalariTroll/夜之子/MagharOrc/Vulpera/Horde Pandaren DK


step << HighmountainTauren !DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mayla Highmountain|r
    .goto 652,54.85,63.18
    .accept 49773 >>接任务: |cRXP_WARN_为了部落！|r
    .target Mayla Highmountain
step << HighmountainTauren !DK
    #completewith next
    .goto 652,46.02,63.78
    .zone 85 >>前往奥格瑞玛的传送门
step << 夜之子 !DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_First Arcanist Thalyssra|r
    .goto 680,59.34,85.53
    .accept 49933 >>接任务: |cRXP_WARN_为了部落！|r
    .target First Arcanist Thalyssra
step << 夜之子 !DK
    #completewith next
    .goto 680,58.18,87.32
    .zone 85 >>前往奥格瑞玛的传送门
step << ZandalariTroll !DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Queen Talanji|r
    .goto 1165,49.93,46.64
    .accept 55137 >>接任务: |cRXP_WARN_为了部落！|r
    .target Queen Talanji
step << ZandalariTroll !DK
    #completewith next
    .goto 1165,49.94,43.85
    .zone 85 >>前往: |cRXP_PICK_杜隆塔尔|r
step << MagharOrc !DK
    .goto 85,70.6,44.6 --Not exact coords
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Overlord Geya'rah|r 
    .accept 51485 >>接任务: |cRXP_WARN_为了部落！|r
    .target Overlord Geya'rah
step << Vulpera !DK
    .goto 85,64.647,46.514
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nilsa|r 
    .accept 58122 >>接任务: |cRXP_WARN_为了部落！|r
    .target Nilsa
step << !DK
    .goto 85,39.40,79.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ambassador Blackguard|r
    .turnin 49773 >>交任务: |cRXP_FRIENDLY_为了部落！|r << HighmountainTauren
    .turnin 49933 >>交任务: |cRXP_FRIENDLY_为了部落！|r << 夜之子
    .turnin 51485 >>交任务: |cRXP_FRIENDLY_为了部落！|r << MagharOrc
    .turnin 55137 >>交任务: |cRXP_FRIENDLY_为了部落！|r << ZandalariTroll
    .turnin 58122 >>交任务: |cRXP_FRIENDLY_为了部落！|r << Vulpera
    .accept 50319 >>接任务: |cRXP_WARN_异乡异客|r << HighmountainTauren
    .accept 50303 >>接任务: |cRXP_WARN_异乡异客|r << 夜之子
    .accept 53502 >>接任务: |cRXP_WARN_异乡异客|r << MagharOrc
    .accept 55138 >>接任务: |cRXP_WARN_异乡异客|r << ZandalariTroll
    .accept 58124 >>接任务: |cRXP_WARN_异乡异客|r << Vulpera
    .target Ambassador Blackguard
step << !DK
    .goto 85,40.834,80.155
    >>对话: |cRXP_FRIENDLY_克罗米|r
    .complete 50319,1 << HighmountainTauren --与克罗米交谈 (1)
    .complete 50303,1 << 夜之子 --与克罗米交谈 (1)
    .complete 53502,1 << MagharOrc --与克罗米交谈 (1)
    .complete 55138,1 << ZandalariTroll --与克罗米交谈 (1)
    .complete 58124,1 << Vulpera --与克罗米交谈 (1)
    .target Chromie
step << !DK
    .goto 85,40.777,80.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Halian Shlavahawk|r << HighmountainTauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Melitier Vahlouran|r << 夜之子
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Limbflayer Lasha|r << MagharOrc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Natal'hakata|r << ZandalariTroll
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nilsa|r << Vulpera
    .turnin 50319 >>交任务: |cRXP_FRIENDLY_异乡异客|r << HighmountainTauren
    .turnin 50303 >>交任务: |cRXP_FRIENDLY_异乡异客|r << 夜之子
    .turnin 53502 >>交任务: |cRXP_FRIENDLY_异乡异客|r << MagharOrc
    .turnin 55138 >>交任务: |cRXP_FRIENDLY_异乡异客|r << ZandalariTroll
    .turnin 58124 >>交任务: |cRXP_FRIENDLY_异乡异客|r << Vulpera
    .target Halian Shlavahawk << HighmountainTauren
    .target Melitier Vahlouran << 夜之子
    .target Limbflayer Lasha << MagharOrc
    .target Natal'hakata << ZandalariTroll
    .target Nilsa << Vulpera
step << DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .goto 1602,49.59,90.70
    .accept 58877 >>接任务: |cRXP_WARN_死亡之力的增长|r
    .target The Lich King
step << DK
    >>使用|cffffff00[ExtraActionButton]|r
    .goto 1602,49.59,90.70
    .complete 58877,1 --1/1 Fealty sworn
step << DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .goto 1602,49.59,90.70
    .turnin 58877 >>交任务: |cRXP_FRIENDLY_死亡之力的增长|r
    .accept 58903 >>接任务: |cRXP_WARN_艾泽拉斯的守护者|r
    .target The Lich King
step << DK
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .goto 1602,50.78,71.06
    .complete 58903,1 --1/1 Speak with Highlord Darion Mograine
    .target Highlord Darion Mograine
step << DK
    >>使用死亡之门
    .goto 1602,49.91,39.06
    .complete 58903,3 --1/1 Listen to your commander (Optional)
    .complete 58903,2 --1/1 Death Gate used
step << DK
    #completewith next
    +|cfff78300 上马|r
step << DK
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与 |cRXP_PICK_Warchief 的命令板|r 交互
    .goto 85,49.67,76.46
    .complete 58903,4 --1/1 Warchief's Command Board
step << DK
    >>点击任务日志中的任务
    .goto 85,49.67,76.46
    .turnin 58903 >>交任务: |cRXP_FRIENDLY_艾泽拉斯的守护者|r
]])
