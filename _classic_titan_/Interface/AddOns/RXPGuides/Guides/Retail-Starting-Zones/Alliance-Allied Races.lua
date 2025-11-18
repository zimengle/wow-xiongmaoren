RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
-- #subgroup 同盟种族 << !DK
--#subgroup 同盟种族 DK << DK
#name 3零售_同盟种族
#displayname Chapter 1 - 黑铁矮人 Intro << DarkIronDwarf !DK
#displayname Chapter 1 - 库尔提拉斯 Intro << KulTiran !DK
#displayname Chapter 1 - 光铸德莱尼 Intro << LightforgedDraenei !DK
#displayname Chapter 1 - 机械侏儒 Intro << 机械侏儒 !DK
#displayname Chapter 1 - Void Elf Intro << VoidElf !DK
#displayname Chapter 1 - New Deathknight Intro << DK
#next B-艾尔文森林

<< KulTiran/DarkIronDwarf/LightforgedDraenei/机械侏儒/VoidElf/Alliance Pandaren DK

-- step << !Pandaren !DK
-- #completewith next
--   .zoneskip 84
--   +按下默认的“N”键打开你的天赋。|cRXP_WARN_然后，选择你想要的天赋专业化。|r 
step << DarkIronDwarf !DK
    .goto 1186,56.43,31.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_茉艾拉·索瑞森|r
    .accept 51486 >>接任务: |cRXP_WARN_为了联盟|r
    .target Moira Thaurissan
step << DarkIronDwarf !DK
    #completewith next
    .goto 1186,59.27,26.52
    .cast 281587 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mole Machine|r
step << KulTiran !DK
    .goto 1161,67.71,21.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Katherine Proudmoore|r
    .accept 55142 >>接任务: |cRXP_WARN_为了联盟|r
    .target Katherine Proudmoore
step << KulTiran !DK
    .goto 1161,67.15,22.9,10,0
    .goto 1161,67.44,21.4,10,0
    .goto 1161,68.87,21.12,10,0
    .goto 1161,70.47,17.11,10,0
    .goto 1161,70.1,16.8
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Stormwind 传送门|r
    .complete 55142,1 --1/1 Portal to Stormwind Taken
step << LightforgedDraenei !DK
    .goto 940,49.2,43.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_法瑞亚船长|r
    .accept 49772 >>接任务: |cRXP_WARN_为了联盟|r
    .target 法瑞亚船长
step << LightforgedDraenei !DK
    #completewith next
    .goto 941,43.180,24.938
    >>下楼
    .zone 84 >>点击|cRXP_PICK_前往暴风城的门户|r
step << 机械侏儒 !DK
    .goto 1573,18.67,67.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_High Tinker Mekkartonque|r
    .accept 58146 >>接任务: |cRXP_WARN_为了联盟|r
    .target High Tinker Mekkartonque
step << 机械侏儒 !DK
    .goto 1573,20.5,60.0
    >>行走 |cFFfa9602在暴风城传送装置上|r
    .complete 58146,1 --1/1 前往: |cRXP_PICK_暴风城|r
step << VoidElf !DK
    .goto 971,28.5,22.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alleria|r
    .accept 49788 >>接任务: |cRXP_WARN_为了联盟|r
    .target Alleria
step << VoidElf !DK
    #completewith next
    .goto 971,27.99,21.50
    .zone 84 >>点击|cRXP_PICK_前往暴风城的门户|r
step << !DK
    .goto 84,53.059,15.259
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ambassador Moorgard|r
    .turnin 49772 >>交任务: |cRXP_FRIENDLY_为了联盟|r << LightforgedDraenei
    .turnin 49788 >>交任务: |cRXP_FRIENDLY_为了联盟|r << VoidElf
    .turnin 51486 >>交任务: |cRXP_FRIENDLY_为了联盟|r << DarkIronDwarf
    .turnin 55142 >>交任务: |cRXP_FRIENDLY_为了联盟|r << KulTiran
    .turnin 58146 >>交任务: |cRXP_FRIENDLY_为了联盟|r << 机械侏儒
    .accept 50313 >>接任务: |cRXP_WARN_异乡异客|r << LightforgedDraenei
    .accept 50305 >>接任务: |cRXP_WARN_异乡异客|r << VoidElf
    .accept 53500 >>接任务: |cRXP_WARN_异乡异客|r << DarkIronDwarf
    .accept 55146 >>接任务: |cRXP_WARN_异乡异客|r << KulTiran
    .accept 58147 >>接任务: |cRXP_WARN_异乡异客|r << 机械侏儒
    .target Ambassador Moorgard
step << !DK
    .goto 84,56.257,17.311
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗米|r
    >>|cRXP_WARN_选择“大灾变”|r
    .complete 50313,1 << LightforgedDraenei --与克罗米交谈 (1)
    .complete 50305,1 << VoidElf --与克罗米交谈 (1)
    .complete 53500,1 << DarkIronDwarf --与克罗米交谈 (1)
    .complete 55146,1 << KulTiran --与克罗米交谈 (1)
    .complete 58147,1 << 机械侏儒 --与克罗米交谈 (1)
    .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
    .skipgossip 167032,1,8 --XX Doesn't autoselect, Need zarant function? Better to give people the choice?
    .target Chromie
step << !DK
    .goto 84,56.199,17.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vindicator Minkey|r << LightforgedDraenei
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keira Onyxraven|r << VoidElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mudrik Leger|r << DarkIronDwarf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Provisioner Fray|r << KulTiran
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lulana|r << 机械侏儒
    .turnin 50313 >>交任务: |cRXP_FRIENDLY_异乡异客|r << LightforgedDraenei
    .turnin 50305 >>交任务: |cRXP_FRIENDLY_异乡异客|r << VoidElf
    .turnin 53500 >>交任务: |cRXP_FRIENDLY_异乡异客|r << DarkIronDwarf
    .turnin 55146 >>交任务: |cRXP_FRIENDLY_异乡异客|r << KulTiran
    .turnin 58147 >>交任务: |cRXP_FRIENDLY_异乡异客|r << 机械侏儒
    .target Vindicator Minkey << LightforgedDraenei
    .target Keira Onyxraven << VoidElf
    .target Mudrik Leger << DarkIronDwarf
    .target Provisioner Fray << KulTiran
    .target Lulana << 机械侏儒
step << DarkIronDwarf !DK
    .goto 84,62.16,30.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r, Hero's Call Board
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .isQuestTurnedIn 51486
    .target Hero's Herald
step << KulTiran !DK
    .goto 84,62.16,30.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .isQuestTurnedIn 55142
    .target Hero's Herald
step << LightforgedDraenei !DK
    .goto 84,62.16,30.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .isQuestTurnedIn 49772
    .target Hero's Herald
step << 机械侏儒 !DK
    .goto 84,62.16,30.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .isQuestTurnedIn 58146
    .target Hero's Herald
step << VoidElf !DK
    .goto 84,62.16,30.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .isQuestTurnedIn 49788
    .target Hero's Herald
step << !DK
    .goto 84,62.10,32.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .dmf
step << !DK
    .goto 84,62.10,32.18
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .skipgossip
    .zoneskip 37
    .dmf
step << !DK
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .target Renato
    .nodmf
step << !DK
    .goto 84,70.0,47.24,20,0
    .goto 84,68.54,51.37,20,0
    .goto 84,67.45,57.19,25,0
    .goto 84,68.59,62.19,25,0
    .goto 84,66.03,64.49,25,0
    .goto 84,64.39,67.14,25,0
    .goto 84,63.89,72.21,35,0
    .goto 84,63.81,73.53,10,0
    .goto 84,67.45,80.52,25,0
    .goto 84,67.1,83.44,25,0
    .goto 84,69.69,84.78,25,0
    .goto 37,41.71,64.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fp >>获取金郡飞行路线
    .target Bartlett the Brave
    .nodmf
step << DK
    .goto 1602,49.55,90.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .accept 58877 >>接任务: |cRXP_WARN_死亡之力的增长|r
    .target The Lich King
    .zoneskip 84
step << DK
    >>使用 [额外动作按钮] |cFFfa9602infront of|r |cRXP_FRIENDLY_巫妖王|r
    .complete 58877,1 --1/1 Fealty sworn
    .target The Lich King
    .isOnQuest 58877
step << DK
    .goto 1602,49.6,90.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巫妖王|r
    .turnin 58877,1 >>交任务: |cRXP_FRIENDLY_死亡之力的增长|r
    .accept 58902 >>接任务: |cRXP_WARN_艾泽拉斯的守护者|r << Alliance
    .accept 58903 >>接任务: |cRXP_WARN_艾泽拉斯的守护者|r << Horde
    .target The Lich King
    .isQuestComplete 58877
step << DK
    #completewith next
    +按下默认的“N”键打开你的天赋。|cRXP_WARN_然后，选择你想要的天赋专业化。|r 
    .zoneskip 84
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    .goto 1602,50.7,71.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Highlord Darion Morgraine|r
    .skipgossip
    .complete 58902,1 << Alliance --1/1 Speak with Highlord Darion Mograine 
    .complete 58903,1 << Horde --1/1 Speak with Highlord Darion Mograine
    .target Highlord Darion Morgraine
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    .goto 1602,49.96,39.08
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Death Gate|r
    .complete 58902,2 << Alliance --1/1 Death Gate Used
    .complete 58903,2 << Horde --1/1 Death Gate Used 
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    .goto 84,67.16,83.4,20,0
    .goto 84,67.51,80.47,20,0
    .goto 84,63.77,73.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .target Renato Gallina
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    .goto 84,62.9,71.8,5,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_英雄召唤板|r
    .complete 58902,4 --1/1 Hero's Call Board
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    >>|TInterface/cursor/crosshair/interact.blp:20|t|cRXP_WARN_从任务日志的弹出窗口中选择提交任务的选项。|r
    .turnin 58902 >>交任务: |cRXP_FRIENDLY_艾泽拉斯的守护者|r
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    .goto 84,62.81,71.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .target Hero's Herald
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    +使用死亡之门 |cFFfa9602前往阿彻鲁斯：黑锋要塞|r
    .zoneskip 23
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .use 50977
step << DK
    .goto 23,82.02,46.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .accept 58989 >>接任务: |cRXP_WARN_符文熔铸入门|r
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .target Highlord Darion Mograine
step << DK
    .goto 23,83.19,48.90
    >>踏上|cFFfa9602紫色圆圈|r进行传送。
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .complete 58989,1 --1/1 Use the portal to the 2nd floor
step << DK
    .goto 23,83.14,45.4
    >>访问|cFFfa9602the Runeforge|r，打开你的法术书，并将“堕落十字军”附魔应用到你的武器上。
    .complete 58989,2 --Weapon emblazoned (1)
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .use 53428
step << DK
    .isOnQuest 58989
    .goto 23,83.25,49.02,5 >>|cRXP_WARN_踏上|cFFfa9602紫色圆圈|r再次传送。|r
step << DK
    .goto 23,82.02,46.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大领主达里安·莫格莱尼|r
    .turnin 58989 >>交任务: |cRXP_FRIENDLY_符文熔铸入门|r
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .target Highlord Darion Mograine
step << DK
    #completewith next
    +使用死亡之门 |cFFfa9602前往暴风城|r
    >>|cRXP_WARN_你可能要等一会儿才能拿到它的 CD|r
    .zoneskip 84
    .isQuestTurnedIn 58877 --x New Type of DK Check
    .use 50977
step << DK
    #veteran
    .goto 84,61.11,70.6
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|cRXP_WARN_建议用其他拥有至少10000金币的角色登录，用这个角色购买物品然后寄过来。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师费奇|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Fitch
    .target Auctioneer Jaxon
    .target Auctioneer Chilton
    .dmf
    .isQuestTurnedIn 58877 --x New Type of DK Check
step << DK
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
    .isQuestTurnedIn 58902 --x New Type of DK Check
step << DK
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
    .isQuestTurnedIn 58902 --x New Type of DK Check
step << DK
    #label DarkMoonFaire
    .goto 84,62.25,72.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .target Darkmoon Faire Mystic Mage
    .dmf
    .isQuestTurnedIn 58902 --x New Type of DK Check
step << DK
    .goto 84,62.25,72.96
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .skipgossip
    .zoneskip 37
    .dmf
    .isQuestTurnedIn 58902  --x new type of dk check
    .target Darkmoon Faire Mystic Mage
step << DK 
    .goto 84,64.63,70.45,25,0
    .goto 84,68.29,74.57,25,0
    .goto 84,70.92,72.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Goldshire >>飞往闪金郡
    .target Dungar Longdrink
    .isQuestTurnedIn 58877 --x New DK Check
    .nodmf
]])
