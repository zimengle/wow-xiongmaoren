RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP 同盟种族解锁
#groupweight 5
-- #subgroup Void Elf
#name 4）虚空精灵剧情任务线
#displayname Void Elf

<< Alliance !VoidElf

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
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_库尔提拉斯 横幅。|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger|r
    .turnin 50239 >>交任务: |cRXP_FRIENDLY_选择盟友|r
    .accept 49787 >>接任务: |cRXP_WARN_幽魂之地|r
    .target Aysa Cloudsinger
step
    .goto 84,52.44,13.23
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void 门户。|r
    .complete 49787,1 --1/1 Travel to the Ghostlands
step
    .goto 95,33.87,33.37,5,0
    .goto 95,33.63,34.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Umbric 的笔记 - 月之圣殿。|r
    .complete 49787,2 --1/1 Umbric's Notes - Sanctum of the Moon
step
    .goto 95,33.7,33.59,5,0
    .goto 95,34,33.19,5,0
    .goto 95,46.88,55.00,5,0
    .goto 95,46.88,54.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Umbric 的笔记 - Andilien Estate。|r
    .complete 49787,3 --1/1 Umbric's Notes - Andilien Estate
step
    .goto 95,46.69,56.05,5,0
    .goto 95,57.71,51.13,10,0
    .goto 95,65.6,41.78,30,0
    .goto 95,71.04,32.02,5,0
    .goto 95,79.35,16.76,5,0
    .goto 95,79.66,17.52
    .cast 258931 >>跳转到并单击 |cRXP_PICK_Teleportation 控制台。|r
step
    .goto 95,79.99,19.86,5,0
    .goto 95,79.27,20.21,5,0
    .goto 95,79.66,19.7
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Umbric 的笔记 - Dawnstar Spire。|r
    .complete 49787,4 --1/1 Umbric's Notes - Dawnstar Spire
step    
    .goto 95,79.68,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alleria Windrunner.|r
    .turnin 49787 >>交任务: |cRXP_FRIENDLY_幽魂之地|r
    .accept 48962 >>接任务: |cRXP_WARN_泰洛古斯裂隙|r
    .target Alleria Windrunner
step
    .goto 95,79.64,19.8
    .zone 972 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void 门户。|r
step
    .goto 972,47.84,73.88
    .gossipoption 47941 >>Talk to |cRXP_FRIENDLY_Magister Umbric.|r
    .timer 66,Duration until continuation.
    .target Magister Umbric
step
    .goto 972,48.97,73.02
    .scenario 3675,1 >>|cRXP_WARN_前往箭头所指的位置。|r
step
    .goto 972,37.3,49.23
    .scenario 3490,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void 门户。|r
step
    .goto 972,37.3,49.23
    .scenario 3662,1,100 >>杀死 |cRXP_ENEMY_虚空生物。|r |cRXP_WARN_不要靠近虚空泡泡。|r
    .mob Creeping Void
    .mob Netherguard Phaseblade
    .mob Curious Voidstalker
    .mob Netherguard Transmogrifier
step
    .goto 972,37.3,49.23
    .scenario 3673,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void 门户。|r
step
    .goto 972,37.3,49.23
    .scenario 3495,1,100 >>杀死 |cRXP_ENEMY_虚空生物。|r |cRXP_WARN_不要靠近虚空泡泡。|r
    .mob Dark Manifestation
    .mob Curious Voidstalker
step
    .goto 972,28.96,40.21
    .scenario 3496,1 >>杀死 |cRXP_ENEMY_Nhr'ghesh。|r
    .mob Nhr'ghesh
step
    .goto 972,28.89,38.2
    .scenario 3520,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void 门户。|r
step
    .goto 972,29.02,27.72,5,0
    .goto 972,28.5,21.7,5,0
    .goto 972,26.23,24.46
    .scenario 3674,1 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Voidforges.|r
step
    .goto 972,27.78,24.1
    >>杀死 |cRXP_ENEMY_Nether-Prince Durzaan。|r
    .complete 48962,1 --"Telogrus Rift" scenario complete 
    .mob Nether-Prince Durzaan
step
    #completewith next
    .goto 972,27.98,24.48,5,0
    .cast 253691 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Void Portal|r 传送至 |cFFfa9602Stormwind。|r
    .isOnQuest 48962
step
    .goto 84,52.05,13.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aysa Cloudsinger.|r
    .turnin 48962 >>交任务: |cRXP_FRIENDLY_泰洛古斯裂隙|r
    .target Aysa Cloudsinger
]])