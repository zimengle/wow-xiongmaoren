RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup 库尔提拉斯
#name Z13) 库尔提拉斯任务线
#displayname 库尔提拉斯

<< Alliance !KulTiran

step
    #completewith next
    .zone 84 >>前往|cFFfa9602暴风城。|r
step
    .accept 49929 >>接任务: |cRXP_WARN_呼唤同盟|r
step
    .goto 84,52.05,13.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r |cFFfa9602inside the Stormwind Embassy.|r
    .turnin 49929 >>交任务: |cRXP_FRIENDLY_呼唤同盟|r
    .accept 50239 >>接任务: |cRXP_WARN_选择盟友|r
    .target Aysa Cloudsinger
step
    .goto 84,52.22,13.20
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void Elf Banner。|r
    .complete 50239,2 --1/1 Learn about the Void Elves
step
    .goto 84,52.34,13.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_库尔提拉斯 Banner。|r
    .complete 50239,4 --1/1 Learn about the 库尔提拉斯s
step
    .goto 84,51.73,13.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_机械侏儒 横幅。|r
    .complete 50239,5 --1/1 Learn about the 机械侏儒s
step
    .goto 84,51.78,13.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_黑铁矮人旗帜。|r
    .complete 50239,3 --1/1 Learn about the Dark Iron Dwarves
step
    .goto 84,51.86,13.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_光铸德莱尼 Banner。|r
    .complete 50239,1 --1/1 Learn about the 光铸德莱尼
step
    .goto 84,52.06,13.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 54706 >>接任务: |cRXP_WARN_库尔提拉斯制造|r
    .target Aysa Cloudsinger
step
    .goto 84,52.82,14.57,5,0
    .goto 84,49.35,86.91,5 >>前往|cFFfa9602法师塔。|r
    .isOnQuest 54706
step
    .goto 84,48.83,86.9,5,0
    .goto 84,49.15,87.77,5, >>登上 |cFFfa9602 螺旋楼梯。|r
    .isOnQuest 54706
step
    .goto 84,48.75,88.07,3 >>穿过|cFFfa9602传送门。|r
    .isOnQuest 54706
step
    .goto 84,46.77,89.79,5,0
    .goto 84,48.74,95.18
    .zone 1161 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Boralus 门户。|r
    .isOnQuest 54706
step
    .goto 1161,68.85,21.18,5,0
    .goto 1161,67.44,21.29,5,0
    .goto 1161,67.99,21.90,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Crestfall.|r
    .skipgossip 122370,1
    .complete 54706,2 --1/1 Speak to Cyrus
    .target Cyrus Crestfall
step
    .goto 1161,67.99,21.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Crestfall.|r
    .turnin 54706 >>交任务: |cRXP_FRIENDLY_库尔提拉斯制造|r
    .accept 55039 >>接任务: |cRXP_WARN_造船大师|r
    .target Cyrus Crestfall
step
    .goto 1161,67.95,22.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r
    .skipgossip
    .complete 55039,1 --1/1 Letter from the Lord Admiral
    .target Lady Jaina Proudmoore
-- step
--     #completewith next
--     .goto 1161,67.09,23.33,5,0
--     .goto 1161,66.98,14.99
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Joan Weber|r |cRXP_WARN_and if you don't have the flightpath you can just fly.|r
--     .fly Brennadam >>飞往 |cFFfa9602布伦纳丹。|r
--     .target Joan Weber
step
    .goto 1161,67.09,23.33,5 >>离开|cFFfa9602办公室。|r
    .isOnQuest 55043
step
    .goto 942,59.39,70.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Crestfall|r |cFFfa9602inside the Brennadam.|r
    .turnin 55039 >>交任务: |cRXP_FRIENDLY_造船大师|r
    .accept 55043 >>接任务: |cRXP_WARN_海上传说|r
    .target Cyrus Crestfall
step
    .goto 942,59.39,69.36
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 1.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.61,68.62
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 2.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.41,68.73
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 3.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,59.08,69.95
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 4.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.79,70.2
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 5.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.53,70.23
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 6.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.17,70.59
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 7.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.42,70.87
    .gossipoption 50031 >>Talk to |cRXP_FRIENDLY_Talkative Brennadam Citizen 8.|r
    .target Talkative Brennadam Citizen
    .isOnQuest 55043
step
    .goto 942,58.66,70.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Crestfall|r |cFFfa9602inside the Hut.|r
    .turnin 55043 >>交任务: |cRXP_FRIENDLY_海上传说|r
    .accept 54708 >>接任务: |cRXP_WARN_牧场是我家|r
    .target Cyrus Crestfall
step
    .goto 942,49.95,50.03
    >>|cRXP_WARN_前往箭头所指的位置。|r
    .complete 54708,1 --1/1 Find the homestead
step
    .goto 942,49.94,50.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sal Atwater|r |cFFfa9602infront of the House.|r
    .skipgossip
    .complete 54708,2 --1/1 Meet the shipwright
    .target Sal Atwater
step
    .goto 942,50.23,49.88
    >>|cRXP_WARN_前往房屋内箭头|r |cFFfa9602指示的位置。|r
    .complete 54708,3 --1/1 Meet the actual shipwright
    .timer 10, Shipwright RP
step
    .goto 942,50.22,49.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater.|r
    .turnin 54708 >>交任务: |cRXP_FRIENDLY_牧场是我家|r
    .accept 54721 >>接任务: |cRXP_WARN_宝刀已老|r
    .target Dorian Atwater
step
    .goto 942,50.41,49.87,5,0
    .goto 942,50.38,50.47
    .cast 291980 >>与 |cRXP_FRIENDLY_Hurricane|r |cFFfa9602屋外互动。|r
    .isOnQuest 54721
step
    .goto 942,50.46,50.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Hurricane 互动。|r
    .complete 54721,1 --1/1 Hurricane saddled
step
    .goto 942,66.13,47.37
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Dorian Atwater 互动。|r
    .accept 54723 >>接任务: |cRXP_WARN_隐藏船只|r
    .accept 54725 >>接任务: |cRXP_WARN_深海幽灵|r
    .target Dorian Atwater
step
    #completewith Ward
    >>杀死 |cRXP_ENEMY_Drowned Harbinger|r 和 |cRXP_ENEMY_Drowned Convert。|r
    .complete 54725,1 --12/12 Drowned forces slain
    .mob Drowned Harbinger
    .mob Drowned Convert
    .mob Grasp of the Deep
step
    .goto 942,65.91,43.50
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Western Fog Ward。|r
    .complete 54723,2 --1/1 Western Fog Ward placed
step
    .goto 942,66.90,44.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Southern Fog Ward。|r
    .complete 54723,1 --1/1 Southern Fog Ward placed
step
    #label Ward
    .goto 942,67.99,41.97
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Northern Fog Ward。|r
    .complete 54723,3 --1/1 Northern Fog Ward placed
step
    .goto 942,65.91,43.50,10,0
    .goto 942,66.90,44.71,10,0
    .goto 942,67.99,41.97
    >>杀死 |cRXP_ENEMY_Drowned Harbinger|r 和 |cRXP_ENEMY_Drowned Convert。|r
    .complete 54725,1 --12/12 Drowned forces slain
    .mob Drowned Harbinger
    .mob Drowned Convert
    .mob Grasp of the Deep
step
    .goto 942,66.09,47.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater.|r
    .turnin 54723 >>交任务: |cRXP_FRIENDLY_隐藏船只|r
    .turnin 54725 >>交任务: |cRXP_FRIENDLY_深海幽灵|r
    .accept 54726 >>接任务: |cRXP_WARN_基础工作|r
    .target Dorian Atwater
step
    .goto 895,68.95,20.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater|r |cFFfa9602on the bottom floor inside of the house.|r |cRXP_WARN_Be aware that there may be a brief roleplay sequence before you are able to turn in the quest.|r
    .turnin 54726 >>交任务: |cRXP_FRIENDLY_基础工作|r
    .accept 54727 >>接任务: |cRXP_WARN_搬运小队|r
    .target Dorian Atwater
step
    .goto 895,68.73,19.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Heavy Lumber。|r
    .complete 54727,1,1 --1/1 Follow Dorian to the drop point
step
    .goto 895,68.71,17.36
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Heavy Lumber。|r
    .complete 54727,1,2 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.31,17.54
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Heavy Lumber。|r
    .complete 54727,1,3 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.99,16.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Heavy Lumber。|r
    .complete 54727,1,4 --1/1 Follow Dorian to the drop point
step
    .goto 895,67.22,12.52
    >>|cRXP_WARN_跟随 |cRXP_FRIENDLY_Dorian|r 并使用 |r |cRXP_WARN_|T236188:0|t[寻求帮助](1) 指示他杀死|r |cRXP_ENEMY_攻击者。|r
    .complete 54727,2 --1/1 Follow Dorian to the drop point
    .timer 5,Short Roleplay
    .target Dorian Atwater
step
    .goto 895,67.10,12.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater.|r
    .turnin 54727 >>交任务: |cRXP_FRIENDLY_搬运小队|r
    .accept 54728 >>接任务: |cRXP_WARN_闹鬼木料|r
    .accept 54729 >>接任务: |cRXP_WARN_黯丘矿洞|r
    .target Dorian Atwater
step
    .goto 896,33.25,30.57
    >>|cRXP_WARN_前往箭头所指的位置。|r
    .complete 54729,1 --1/1 Find Chelsea Wright
step
    .goto 896,33.17,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chelsea Wright.|r
    .turnin 54729 >>交任务: |cRXP_FRIENDLY_黯丘矿洞|r
    .accept 54732 >>接任务: |cRXP_WARN_快松口！|r
    .target Chelsea Wright
step
    .goto 896,34.19,30.47,10,0
    .goto 896,34.52,29.77,10,0
    .goto 896,35.9,30.32,10,0
    .goto 896,36.65,29.98,10,0
    .goto 896,36.60,28.88,5 >>|cRXP_WARN_跟随洞穴内的 |cRXP_ENEMY_Wicker Beast|r |cFFfa9602。|r
    .timer 3,Short Roleplay
    .mob Wicker Beast
    .target Wicker Beast
    .isOnQuest 54732
step
    .goto 896,36.6,28.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_Storehouse Key|r |cFFfa9602。|r
    .complete 54732,1 --1/1 Storehouse Key
step
    .goto 896,36.62,28.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wicker Beast.|r
    .turnin 54732 >>交任务: |cRXP_FRIENDLY_快松口！|r
    .accept 55136 >>接任务: |cRXP_WARN_柳魔忠犬|r
    .target Wicker Beast
step
    .goto 896,35.31,28.90
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_Gnawed Bone|r |cFFfa9602。|r
    .complete 55136,3 --1/1 Gnawed Bone
step
    .goto 896,35.99,30.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击树枝周围的 |cRXP_PICK_Worn Collar|r |cFFfa9602。|r
    .complete 55136,1 --1/1 Worn Collar
step
    .goto 896,34.64,30.49,5 >>找到|cFFfa9602房子。|r
    .isOnQuest 55136
step
    .goto 896,34.60,30.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击房屋内的 |cRXP_PICK_Worn Collar|r |cFFfa9602。|r
    .complete 55136,2 --1/1 Squeaky Toy
step
    .goto 896,33.17,30.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Chelsea Wright.|r
    .turnin 55136 >>交任务: |cRXP_FRIENDLY_柳魔忠犬|r
    .accept 54733 >>接任务: |cRXP_WARN_成功取货|r
    .target Chelsea Wright
step
    .goto 896,33.12,30.29
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Chest。|r
    .turnin 54733 >>交任务: |cRXP_FRIENDLY_成功取货|r
step
    .goto 896,61.88,59.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thornspeaker Birchgrove.|r
    .turnin 54728 >>交任务: |cRXP_FRIENDLY_闹鬼木料|r
    .accept 54730 >>接任务: |cRXP_WARN_高莱克·图尔的影响|r
    .target Thornspeaker Birchgrove
step
    .goto 896,60.86,61.1,10,0
    .goto 896,59.48,63.85,10,0
    .goto 896,61.39,64.81,10,0
    .goto 896,62.19,63.1,10,0
    .goto 896,61.88,59.32
    >>杀死 |cRXP_ENEMY_Vengeful Bones|r 和 |cRXP_ENEMY_Awoken Guardian|r。|cRXP_WARN_此外，点击它们附近的石头将有助于你进一步填充你的德鲁斯特容器。|r
    .complete 54730,1 --1/1 Drust Vessel filled
    .mob Awoken Guardian
    .mob Vengeful Bones
step
    .goto 896,61.88,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thornspeaker Birchgrove.|r
    .turnin 54730 >>交任务: |cRXP_FRIENDLY_高莱克·图尔的影响|r
    .accept 54731 >>接任务: |cRXP_WARN_平衡存乎于万物|r
    .target Thornspeaker Birchgrove
step
    .goto 942,59.39,69.36
    .gossipoption 50185 >>Talk to |cRXP_FRIENDLY_Arthur Tradewind.|r
    .timer 4, Short Roleplay
    .target Arthur Tradewind
    .isOnQuest 54731
step
    .goto 942,59.39,69.36
    .vehicle >>与 |cRXP_FRIENDLY_Arthur Tradewind 互动。|r
    .timer 94, Arthur Roleplay
    .isOnQuest 54731
step
    .goto 942,59.39,69.36
    .gossipoption 49067 >>Talk to |cRXP_FRIENDLY_Ulfar.|r
    .timer 8, Short Roleplay
    .target Ulfar
    .isOnQuest 54731
step
    .goto 896,44.97,45.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Nut。|r
    .complete 54731,2 --1/1 Begin the ritual
step
    .goto 896,44.97,45.83
    >>杀死 |cRXP_ENEMY_Drust Manifestations。|r
    .complete 54731,3 --1/1 Balance restored
    .mob Drust Manifestation
step
    .goto 896,45.18,45.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ulfar.|r
    .turnin 54731 >>交任务: |cRXP_FRIENDLY_平衡存乎于万物|r
step
    .goto 896,45.43,45.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bound Sky.|r
    .accept 54734 >>接任务: |cRXP_WARN_多利安的召唤|r
    .target Bound Sky
step
    .goto 942,66.51,44.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater.|r
    .turnin 54734 >>交任务: |cRXP_FRIENDLY_多利安的召唤|r
    .target Dorian Atwater
step
    .goto 942,66.5,44.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r
    .accept 54735 >>接任务: |cRXP_WARN_杰出船员|r
    .target Lady Jaina Proudmoore
step
    .goto 1161,43.00,56.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tandred Proudmoore.|r
    .skipgossip
    .complete 54735,1 --1/1 Speak to Tandred Proudmoore
    .target Tandred Proudmoore
step
    .goto 1161,75.94,22.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Brother Pike.|r
    .skipgossip
    .complete 54735,2 --1/1 Brother Pike recruited
    .target Brother Pike
step
    .goto 895,56.68,61.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lieutenant Tarenfold.|r
    .skipgossip
    .complete 54735,3 --1/1 Lieutenant Tarenfold recruited
    .target Lieutenant Tarenfold
step
    .goto 895,35.26,24.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rosaline Madison.|r
    .skipgossip
    .complete 54735,4 --1/1 Outriggers recruited
    .target Rosaline Madison
step
    .goto 942,67.62,44.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dorian Atwater.|r
    .skipgossip
    .complete 54735,5 --1/1 Boatswain recruited
    .target Dorian Atwater
step
    .goto 942,67.62,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r
    .turnin 54735 >>交任务: |cRXP_FRIENDLY_杰出船员|r
    .accept 54851 >>接任务: |cRXP_WARN_海潮祝福|r
    .target Lady Jaina Proudmoore
step
    .goto 942,59.39,69.36
    .gossipoption 50743 >>对话: |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r
    .target Lady Jaina Proudmoore
    .isOnQuest 54851
step
    .goto 942,71.17,43.99
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Boat。|r
    >>|cRXP_WARN_按下键盘上的“Esc”键即可跳过电影。|r
    .complete 54851,2 --1/1 Vessel blessed
step
    .goto 942,71.13,44.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r
    .turnin 54851 >>交任务: |cRXP_FRIENDLY_海潮祝福|r
    .accept 53720 >>接任务: |cRXP_WARN_库尔提拉斯的效忠|r
    .target Lady Jaina Proudmoore
step
    .goto 942,71.18,44.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Steering Wheel。|r
    .complete 53720,1 --1/1 Sail to Stormwind Harbor
step
    .goto 84,22.53,18.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安度因·乌瑞恩|r
    .turnin 53720 >>交任务: |cRXP_FRIENDLY_库尔提拉斯的效忠|r
    .target 安度因·乌瑞恩
]])
