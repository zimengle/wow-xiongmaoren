local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Horde' then return end


RXPGuides.RegisterGuide([[

#version 1
#group RXP 大地的裂变 1-80 (联盟) << cata
#group RestedXP 熊猫人之谜 1-60 (联盟) << mop
#cata
#mop
#name 10-18 黑海岸
#displayname 10-18 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 15-20 赤脊山
#defaultfor NightElf/Worgen/Draenei
<< Alliance


step
    #optional
    .goto 62,51.785,18.012
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 26383 >>交任务: |cRXP_FRIENDLY_乘风破浪|r << !Worgen
    .turnin 26385 >>交任务: |cRXP_FRIENDLY_乘风破浪|r << Worgen
    .accept 13518 >>接任务: |cRXP_WARN_最后一波幸存者|r
	.target Dentaria Silverglade
    .isOnQuest 26383 << !Worgen
    .isOnQuest 26385 << Worgen
step
    .goto 62,51.785,18.012
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .accept 13518 >>接任务: |cRXP_WARN_最后一波幸存者|r
	.target Dentaria Silverglade
step
    .goto 62,50.22,19.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r交谈
    .accept 13522 >>接任务: |cRXP_WARN_水的威胁|r
	.target Ranger Glynda Nal'Shea
step
    #completewith finalrescue
    >>击杀|cRXP_ENEMY_邪恶喷涌者|r
    .complete 13522,1 --8/8 Vile Spray slain
	.mob Vile Spray
step
    .goto 62,45.02,18.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .complete 13518,4 --1/1 Volcor rescued
	.target Volcor
step
    .goto 62,44.11,17.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莎拉|r交谈
    .complete 13518,2 --1/1 Gershala Nightwhisper rescued
	.target Gershala Nightwhisper
step
    .goto 62,44.58,19.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与白爪(|cRXP_FRIENDLY_Whiteclaw|r)交谈
    .complete 13518,1 --1/1 Cerellean Whiteclaw rescued
	.target Cerellean Whiteclaw
step
	#label finalrescue
    .goto 62,42.91,21.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙尔迪恩|r交谈
    .complete 13518,3 --1/1 Shaldyn rescued
	.target Shaldyn
step
    .goto 62,46.22,17.15,40,0
    .goto 62,44.85,17.07
    .goto 62,44.06,20.31
    .goto 62,42.91,21.51
    .goto 62,46.22,17.15
    >>击杀|cRXP_ENEMY_邪恶喷涌者|r
    .complete 13522,1 --8/8 Vile Spray slain
	.mob Vile Spray
step
    .goto 62,50.21,19.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r交谈
    .turnin 13522 >>交任务: |cRXP_FRIENDLY_水的威胁|r
	.target Ranger Glynda Nal'Shea
step
    .goto 62,51.78,17.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 13518 >>交任务: |cRXP_FRIENDLY_最后一波幸存者|r
	.target Dentaria Silverglade
step
    .goto 62,51.8,18.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_塞瑞蒂亚·橡语|r|cFFfa9602在旅店内来回巡逻的|r
    .accept 13520 >>接任务: |cRXP_WARN_海洋的恩赐|r
	.target Serendia Oakwhisper
step
    .goto 62,50.964,18.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯特兰|r交谈
    .home >>将你的[炉石]设置为洛达内尔
    .target Innkeeper Kyteran
step
    .goto 62,51.14,19.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 13521 >>接任务: |cRXP_WARN_传声盒413号|r
	.target Wizbang Cranktoggle
step
    #completewith next
    >>击杀|cRXP_ENEMY_堕落的潮行蟹|r. 击杀后拾取其掉落的|cRXP_LOOT_海蟹肉|r
    .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
	.mob Corrupted Tide Crawler
step
    .goto 62,52.41,19.60,20,0
    .goto 62,52.50,16.62,20,0
    .goto 62,52.57,17.53,20,0
    .goto 62,53.18,18.53,20,0
    .goto 62,52.41,19.60
    >>打捞水下的|cRXP_PICK_Encrusted Clams|r
    .complete 13520,1 --16/16 Encrusted Clam Muscle
step
    .goto 62,52.41,19.60,20,0
    .goto 62,52.50,16.62,20,0
    .goto 62,52.57,17.53,20,0
    .goto 62,53.18,18.53,20,0
    .goto 62,52.41,19.60
    >>击杀|cRXP_ENEMY_堕落的潮行蟹|r. 击杀后拾取其掉落的|cRXP_LOOT_海蟹肉|r
    .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
	.mob Corrupted Tide Crawler
step
    .goto 62,53.24,19.64
    >>点击地面上的|cRXP_PICK_传声盒413号|r
    .turnin 13521 >>交任务: |cRXP_FRIENDLY_传声盒413号|r
    .accept 13527 >>接任务: |cRXP_WARN_食性无常|r
step
    .goto 62,55.1,21.0
    >>击杀|cRXP_FRIENDLY_腐烂蓟熊|r获取战利品
    .complete 13527,1 --1/1 Foul Bear Carcass Sample
	.target Decomposing Thistle Bear
step
    .goto 62,51.17,19.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .turnin 13527 >>交任务: |cRXP_FRIENDLY_食性无常|r
    .accept 13528 >>接任务: |cRXP_WARN_传声盒723号|r
	.target Wizbang Cranktoggle
step
    #xprate >1.59
    #optional
    .maxlevel 18,DarkshoreEnd
step
    .goto 62,50.90,18.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_塞瑞蒂亚·橡语|r|cFFfa9602在旅店中来回巡逻的|r
    .turnin 13520 >>交任务: |cRXP_FRIENDLY_海洋的恩赐|r
	.target Serendia Oakwhisper
step << Priest
    .goto 62,50.647,19.840
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔拉娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Irlara Morninglight
step << Hunter
    .goto 62,50.352,19.126
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰拉·弓叶|r交谈
    .trainer >>训练你的职业法术
    .target Lanla Bowleaf
step << Mage
    .goto 62,50.465,19.210
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉雷瑟·贝德|r交谈
    .trainer >>训练你的职业法术
    .target Lareth Beld
step << Warlock
    .goto 62,50.487,19.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蕾拉·杜布斯|r交谈
    .trainer >>训练你的职业法术
    .target Laera Dubois
step << Rogue
    .goto 62,50.684,18.509
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯拉尔·夜风|r交谈
    .trainer >>训练你的职业法术
    .target Kenral Nightwind
step << Warrior
    .goto 62,50.831,18.787
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵月翼|r交谈
    .trainer >>训练你的职业法术
    .target Sentinel Moonwing
step << Druid
    .goto 62,50.120,19.495
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉尔|r交谈
    .trainer >>训练你的职业法术
    .target Dular
step
    .goto 62,52.96,25.46,40,0
    .goto 62,54.02,25.28,40,0
    .goto 62,55.73,23.95,40,0
    .goto 62,54.87,27.67,40,0
    .goto 62,52.96,25.46
    >>击杀|cRXP_ENEMY_Bears|r. 掠夺它们, 获取|cRXP_LOOT_堕落蓟熊的精华|r
    .complete 13528,1 --6/6 Corrupted Thistle Bear Guts
	.mob Corrupted Thistle Bear
	.mob Corrupted Thistle Bear Matriarch
	.mob Thistle Bear Cub
step
    .goto 62,54.17,29.24
    >>点击地面上的|cRXP_PICK_传声盒723号|r
    .turnin 13528 >>交任务: |cRXP_FRIENDLY_传声盒723号|r
    .accept 13554 >>接任务: |cRXP_WARN_黑暗中的解药|r
step
    #label itall
    .goto 62,56.26,27.41,40,0
    .goto 62,56.78,30.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tharnariun|r交谈
    .accept 13529 >>接任务: |cRXP_WARN_腐化的源头|r
	.target Tharnariun
step
    #completewith GrellsIchor
	>>击杀|cRXP_ENEMY_邪劣魔|r和|cRXP_ENEMY_邪劣魔|r. 击败它们后掠夺其掉落的|cRXP_LOOT_脏污的液体|r和 |T134245:0|t[|cRXP_LOOT_腐化者的钥匙|r]
    .use 44927 >>|cRXP_WARN_使用|r|T134245:0|t[|cRXP_LOOT_腐化者的万能钥匙|r]|cRXP_WARN_来开始任务|r
    .complete 13529,2 --8/8 Vile Grell slain
    .complete 13554,1 --6/6 Foul Ichor
	.collect 44927,1,13557
    .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r
	.mob Vile Grell
	.mob Vile Corruptor
step
    .goto 62,57.51,32.31,15,0
    .goto 62,58.58,32.24,15,0
    .goto 62,58.13,32.84,15,0
    .goto 62,57.34,33.00,15,0
    .goto 62,57.17,32.12,15,0
    .goto 62,56.97,32.66,15,0
    .goto 62,56.58,33.64,15,0
    .goto 62,57.10,34.18
    >>打开洞穴各处的笼子
	.complete 13557,1
step
    .goto 62,58.41,33.08
    >>击杀|cRXP_ENEMY_赛恩·腐蹄|r
    >>|cRXP_ENEMY_赛恩·腐蹄|r|cRXP_WARN_位于洞穴底层|r
    .complete 13529,1 --1/1 Zenn Foulhoof slain
	.mob Zenn Foulhoof
step
    #label GrellsIchor
    .goto 62,56.79,33.52,20,0
    .goto 62,57.43,33.75
    >>点击洞穴深处的|cRXP_PICK_Disgusting Workbench|r
    .accept 13831 >>接任务: |cRXP_WARN_令人不安的处方|r
step
    .goto 62,57.51,32.31,30,0
    .goto 62,58.58,32.24,30,0
    .goto 62,58.13,32.84,30,0
    .goto 62,57.34,33.0,30,0
    .goto 62,57.17,32.12,30,0
    .goto 62,56.97,32.66,30,0
    .goto 62,56.58,33.64,30,0
    .goto 62,57.10,34.18
	>>击杀|cRXP_ENEMY_邪劣魔|r和|cRXP_ENEMY_邪劣魔|r. 击败它们后掠夺其掉落的|cRXP_LOOT_脏污的液体|r和 |T134245:0|t[|cRXP_LOOT_腐化者的钥匙|r]
    .use 44927 >>|cRXP_WARN_使用|r|T134245:0|t[|cRXP_LOOT_腐化者的万能钥匙|r]|cRXP_WARN_来开始任务|r
    .complete 13529,2 --8/8 Vile Grell slain
    .complete 13554,1 --6/6 Foul Ichor
	.collect 44927,1,13557
    .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r
	.mob Vile Grell
	.mob Vile Corruptor
step
    #completewith next
    .hs >>传送至洛丹恩
    .cooldown item,6948,>2
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r 和|cRXP_FRIENDLY_萨纳瑞恩·绿树|r 交谈
    .turnin 13554 >>交任务: |cRXP_FRIENDLY_黑暗中的解药|r
	.target +Wizbang Cranktoggle
    .goto 62,51.142,19.658
    .turnin 13557 >>交任务: |cRXP_FRIENDLY_幸运儿|r
    .turnin 13831 >>交任务: |cRXP_FRIENDLY_幸运儿|r
    .turnin 13529 >>交任务: |cRXP_FRIENDLY_腐化的源头|r
	.target +Tharnariun Treetender
    .goto 62,51.134,19.709
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .target Volcor
    .accept 13564 >>接任务: |cRXP_WARN_失踪的伙伴|r
    .goto 62,50.943,18.026
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .target Cerellean Whiteclaw
    .accept 13563 >>接任务: |cRXP_WARN_爱别离|r
    .goto 62,50.821,17.884
step
    .goto 62,50.649,19.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r交谈
    >>|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r|cRXP_WARN_在洛达内尔各地巡逻|r
    .target Ranger Glynda Nal'Shea
    .accept 13562 >>接任务: |cRXP_WARN_巴莎兰的终焉之焰|r
step
    .goto 62,46.807,33.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_爱瑞娅·秋光|r 交谈
    .target Arya Autumnlight
    .accept 13561 >>接任务: |cRXP_WARN_安抚上层精灵|r
step
    .goto 62,45.958,34.240
    >>点击地面上的|cRXP_PICK_巴莎兰的终焉之焰|r
    .complete 13562,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r
    .complete 13561,1 --|6/6 Cursed Highborne slain
    .mob +Cursed Highborne
    .complete 13561,2 --|6/6 Writhing Highborne slain
    .mob +Writhing Highborne
step
    .goto 62,48.482,36.634
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 击败她后搜刮出|cRXP_LOOT_安娜雅的吊坠|r
    .complete 13563,1 --|1/1 Anaya Dawnrunner slain
    .complete 13563,2 --|1/1 Anaya's Pendant
    .unitscan Anaya Dawnrunner
step
    .goto 62,47.180,35.201
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r
    .complete 13561,1 --|6/6 Cursed Highborne slain
    .mob +Cursed Highborne
    .complete 13561,2 --|6/6 Writhing Highborne slain
    .mob +Writhing Highborne
step
    .goto 62,46.807,33.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_爱瑞娅·秋光|r 交谈
    .target Arya Autumnlight
    .turnin 13561 >>交任务: |cRXP_FRIENDLY_安抚上层精灵|r
step
    .goto 62,42.954,39.006
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守护者卡里修斯|r交谈
    .target Keeper Karithus
    .turnin 13564 >>交任务: |cRXP_FRIENDLY_失踪的伙伴|r
    .accept 13566 >>接任务: |cRXP_WARN_仪式的材料|r
    .accept 13598 >>接任务: |cRXP_WARN_良药苦口|r
step
    .goto 62,42.932,38.958
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛拉法恩|r交谈
    .target Seraphine
    .accept 13565 >>接任务: |cRXP_WARN_今非昔比|r
step
    .goto 62,40.944,38.615
    >>点击睡在树旁的|cRXP_PICK_月夜猛虎|r, 以获取他们的|cRXP_LOOT_胡须|r
    *|cRXP_WARN_Only some of the mobs are neutral and are able to be looted|r
    .complete 13566,1 --|3/3 Moonstalker Whisker
    .mob Moonstalker
step
    .goto 62,45.206,41.222
    >>点击|cRXP_PICK_杂斑母鹿|r以拾取它们的|cRXP_LOOT_Hair|r
    .complete 13566,2 --|3/3 Tuft of Mottled Doe Hair
    .mob Mottled Doe
step
    #label janira
    #sticky
    .goto 62,48.554,40.330
    >>击杀|cRXP_ENEMY_简妮拉女士|r
    .complete 13565,1 --|1/1 Lady Janira slain
    .unitscan Lady Janira
step
#loop
    .goto 62,47.071,41.609,0
    .goto 62,47.429,40.389,0
    .goto 62,48.422,40.225,0
    .goto 62,49.074,39.158,0
    .goto 62,47.071,41.609,30,0
    .goto 62,47.429,40.389,30,0
    .goto 62,48.422,40.225,30,0
    .goto 62,49.074,39.158,30,0
    .goto 62,48.422,40.225,30,0
    .goto 62,48.422,40.225,30,0
    >>拾取地面上的|cRXP_LOOT_熏烟伞菌|r
    .use 45911 >>击杀|cRXP_ENEMY_暗鳞斥候|r. |cRXP_WARN_在他们的尸体上使用|r |T134413:0 |t[石化之根]|cRXP_WARN_|r
    .complete 13598,1 --|6/6 Fuming Toadstool
    .complete 13565,2 --|6/6 Withered Ents called
    .mob Darkscale Scout
step
#loop
    .goto 62,48.579,38.630,0
    .goto 62,46.459,38.829,0
    .goto 62,48.579,38.630,30,0
    .goto 62,46.459,38.829,30,0
    >>点击河床旁的|cRXP_PICK_饥饿的蓟熊|r饮水处, 以获取它们的|cRXP_LOOT_毛皮|r
    *|cRXP_WARN_Only some of the mobs are neutral and are able to be looted|r
    .complete 13566,3 --|3/3 Thistle Bear Fur
step
    #requires janira
    .goto 62,42.932,38.958
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛拉法恩|r交谈
    .target Seraphine
    .turnin 13565 >>交任务: |cRXP_FRIENDLY_今非昔比|r
step
    .goto 62,42.954,39.006
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守护者卡里修斯|r交谈
    .target Keeper Karithus
    .turnin 13566 >>交任务: |cRXP_FRIENDLY_仪式的材料|r
    .turnin 13598 >>交任务: |cRXP_FRIENDLY_良药苦口|r
    .accept 13569 >>接任务: |cRXP_WARN_誓缚仪式|r
step
    #completewith next
    .goto 62,42.938,39.031
    .aura 64198 >>点击地面上的|cRXP_PICK_Grovekeeper's Incense|r
    .skipgossip
step
    .goto 62,43.683,39.926
    .turnin 13567>>与|cRXP_FRIENDLY_雄鹿巨灵|r交谈
    .disablecheckbox
    .complete 13569,1
    .target Great Stag Spirit
step
#requires janira
    .goto 62,42.960,38.956
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守护者卡里修斯|r交谈
    .target Keeper Karithus
    .turnin 13569 >>交任务: |cRXP_FRIENDLY_誓缚仪式|r
    .accept 13599 >>接任务: |cRXP_WARN_锐爪复元|r
step
    .xp 13
--Grinding checkpoint, likely won't be needed at all
----CENTRAL DARKSHORE

step
    .isOnQuest 13601
    .goto 62,42.596,45.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司艾琳雅|r交谈
    .target Priestess Alinya
    .turnin 13601 >>交任务: |cRXP_FRIENDLY_援助难民|r
step
    #xprate >1.59
    #optional
    .maxlevel 18,DarkshoreEnd
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞拉伊|c和|r柯维恩·月升|c交谈
    .accept 13542 >>接任务: |cRXP_WARN_对抗暴风|r
    .goto 62,42.513,45.154
    .target +Sentinel Selarin
    .accept 13543 >>接任务: |cRXP_WARN_三柄将碎之锤|r
    .accept 13573 >>接任务: |cRXP_WARN_玛法里奥的回归|r
    .goto 62,42.681,45.151
    .target +Corvine Moonrise
step
    #completewith WindmasterTzuTzu
    >>击杀|cRXP_ENEMY_狂暴飓风|r. 击杀后掠夺其身上的|T236968:0 |t[|cRXP_LOOT_狂暴飓风的护腕|r]
    .collect 44868,8,13542,1
    .mob Frenzied Cyclone
step
    .goto 62,40.818,41.476
    >>击杀|cRXP_ENEMY_克劳坦莫·蛮鬃|r
    .complete 13543,1 --|1/1 Cloudtamer Wildmane slain
    .mob Cloudtamer Wildmane
step
    .goto 62,39.159,38.314
    >>击杀|cRXP_ENEMY_啸天者布纳克斯|r
    .complete 13543,3 --|1/1 Skylord Braax slain
    .mob Skylord Braax
step
    #label WindmasterTzuTzu
    .goto 62,37.829,42.721
    >>击杀|cRXP_ENEMY_克劳坦莫·蛮鬃|r
    .complete 13543,2 --|1/1 Windmaster Tzu-Tzu slain
    .mob Windmaster Tzu-Tzu
step
    #loop
    .goto 62,39.466,42.096,0
    .goto 62,40.585,41.779,40,0
    .goto 62,39.379,39.127,40,0
    .goto 62,37.963,43.867,40,0
    >>击杀|cRXP_ENEMY_狂暴飓风|r. 击杀后掠夺其身上的|T236968:0 |t[|cRXP_LOOT_狂暴飓风的护腕|r]
    .collect 44868,8,13542,1
    .mob Frenzied Cyclone
step
    .goto 62,39.466,42.096
    .use 44868 >>|cRXP_WARN_使用|r|T236968:0|t[狂暴飓风的护腕] |cRXP_WARN_靠近奥伯丁月井|r
    .complete 13542,1 --|8/8 Frenzied Cyclone bracers destroyed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞拉伊|c和|r柯维恩·月升|c交谈
    .turnin 13542 >>交任务: |cRXP_FRIENDLY_对抗暴风|r
    .goto 62,42.513,45.154
    .target +Sentinel Selarin
    .turnin 13543 >>交任务: |cRXP_FRIENDLY_三柄将碎之锤|r
    .goto 62,42.681,45.151
    .target +Corvine Moonrise

--
step
    .goto 62,43.662,53.441
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 13573 >>交任务: |cRXP_FRIENDLY_玛法里奥的回归|r
    .accept 13575 >>接任务: |cRXP_WARN_大地的血脉|r
    .accept 13577 >>接任务: |cRXP_WARN_最后的枭兽|r
    .accept 13579 >>接任务: |cRXP_WARN_亚米萨兰的保护者|r
--
step
    .goto 62,45.584,48.470
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆姆|r交谈
    .target Aroom
    .turnin 13577 >>交任务: |cRXP_FRIENDLY_最后的枭兽|r
    .accept 13578 >>接任务: |cRXP_WARN_阿隆姆的告别|r
step
#loop
    .goto 62,45.015,47.835,0
    .goto 62,44.704,45.966,40,0
    .goto 62,46.463,47.371,40,0
    .goto 62,45.046,49.702,40,0
    .goto 62,43.670,47.028,40,0
    >>拾取地面上的死去野枭兽的羽毛|r
    .complete 13578,1 --|8/8 Slain Wildkin Feather
step
    .goto 62,45.584,48.470
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆姆|r交谈
    .target Aroom
    .turnin 13578 >>交任务: |cRXP_FRIENDLY_阿隆姆的告别|r
    .accept 13582 >>接任务: |cRXP_WARN_艾露恩之火|r
step
#loop
    .goto 62,46.875,50.147,0
    .goto 62,46.875,50.147,40,0
    .goto 62,45.698,52.584,40,0
    .goto 62,46.867,50.276,40,0
    >>击杀|cRXP_ENEMY_护火者霍鲁|r. 从他身上搜刮|cRXP_LOOT_艾露恩之火|r
    >>|cRXP_ENEMY_护火者霍鲁|r|cRXP_WARN_巡逻略有异常|r
    .complete 13582,1 --|1/1 Elune's Torch
    .unitscan Horoo the Flamekeeper
step
    .goto 62,45.584,48.470
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿隆姆|r交谈
    .target Aroom
    .turnin 13582 >>交任务: |cRXP_FRIENDLY_艾露恩之火|r
    .accept 13583 >>接任务: |cRXP_WARN_枭兽之誓|r
--
step
    .goto 62,40.945,56.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棕掌长者|r交谈
    .target Elder Brownpaw
    .turnin 13575 >>交任务: |cRXP_FRIENDLY_大地的血脉|r
    .accept 13576 >>接任务: |cRXP_WARN_互惠互助|r

step
#loop
    .goto 62,40.288,61.724,0
    .goto 62,40.576,59.527,40,0
    .goto 62,39.982,63.824,40,0
    .use 44959 >>击杀肆掠的火元素
    >>|cRXP_WARN_在他们的尸体上使用|r|T136061:0|t[抚慰图腾]|r
    .complete 13576,1 --|8/8 Unbound Fire Elemental absorbed
    .mob Unbound Fire Elemental
step
    .goto 62,40.945,56.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棕掌长者|r交谈
    .target Elder Brownpaw
    .turnin 13576 >>交任务: |cRXP_FRIENDLY_互惠互助|r
    .accept 13580 >>接任务: |cRXP_WARN_安抚元素|r
step
    #completewith next
    .goto 62,38.77,60.82,25,0
    .goto 62,39.66,62.12,30 >>前往小山山顶的祭坛
step
    .goto 62,39.66,62.12
    .cast 65361 >>|cRXP_WARN_使用|r |T135839:0|t[能量安抚图腾] |cRXP_WARN_靠近祭坛, 然后守护它|r
    .use 46546
    .isOnQuest 13580
step
    .goto 62,39.66,62.12
    .use 46546 >>|cRXP_WARN_保卫|r|T135839:0|t[能量安抚图腾]|cRXP_WARN_抵御攻击者|r
    .complete 13580,1 --|1/1 Ritual of Soothing complete
    .mob Fire Elemental Remnant
    .mob Fire Elemental Rager
step
    .goto 62,40.945,56.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_棕掌长者|r交谈
    .target Elder Brownpaw
    .turnin 13580 >>交任务: |cRXP_FRIENDLY_安抚元素|r
    .accept 13581 >>接任务: |cRXP_WARN_黑木誓言|r
--
step
    .goto 62,44.442,56.757
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里恩|r交谈
    .target Selenn
    .turnin 13579 >>交任务: |cRXP_FRIENDLY_亚米萨兰的保护者|r
    .accept 13584 >>接任务: |cRXP_WARN_平息土地|r
step
#loop
    .goto 62,43.922,59.006,0
    .goto 62,45.281,58.363,40,0
    .goto 62,42.966,60.120,40,0
    .goto 62,45.190,56.295,40,0
    >>击杀|cRXP_ENEMY_被激怒的大地元素|r
    .complete 13584,1 --|8/8 Enraged Earth Elemental slain
    .mob Enraged Earth Elemental
step
    .goto 62,44.442,56.757
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里恩|r交谈
    .target Selenn
    .turnin 13584 >>交任务: |cRXP_FRIENDLY_平息土地|r
    .accept 13585 >>接任务: |cRXP_WARN_誓死保护|r
step
    .goto 62/1,192.60001,5918.10010
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 13581 >>交任务: |cRXP_FRIENDLY_黑木誓言|r
    .turnin 13583 >>交任务: |cRXP_FRIENDLY_枭兽之誓|r
    .turnin 13585 >>交任务: |cRXP_FRIENDLY_誓死保护|r
    .accept 13586 >>接任务: |cRXP_WARN_翡翠梦境|r
--
step
#completewith next
    .goto 62,46.620,54.478,25,0
    .goto 62,47.366,55.964,25 >>前往大地震裂洞
    .subzoneskip 4708
step
    .goto 62,49.003,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击梦魇之门, 然后与|cRXP_FRIENDLY_塔丝瑟拉|r交谈
    .target Thessera
    .turnin 13586 >>交任务: |cRXP_FRIENDLY_翡翠梦境|r
    .accept 13587 >>接任务: |cRXP_WARN_清醒的梦魇|r
step
    .goto 62,49.06,55.97,40,0
    .goto 62,50.115,55.431
    >>击杀|cRXP_ENEMY_噩梦守护者|r, 击败后拾取|cRXP_LOOT_翡翠卷轴|r
    .complete 13587,1 --|1/1 Emerald Scroll
    .mob Nightmare Guardian
step
    .goto 62,49.210,56.935
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔丝瑟拉|r交谈
    .target Thessera
    .turnin 13587 >>交任务: |cRXP_FRIENDLY_清醒的梦魇|r
    .accept 13940 >>接任务: |cRXP_WARN_离开梦境|r
    .timer 30,Leaving the Dream RP
step
    .goto 62/1,192.60001,5918.10010
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 13940 >>交任务: |cRXP_FRIENDLY_离开梦境|r
    .accept 13588 >>接任务: |cRXP_WARN_群风之眼|r
step
    .goto 62,43.555,53.701
    >>与|cRXP_FRIENDLY_塔丝瑟拉|r对话以启程, 使用她的第一个技能击杀|r暮光龙骑兵|r和位于中间的|r暮光传送门|r
    .complete 13588,1 --|1/1 Twilight Portal slain
    .mob +Twilight Portal
    .complete 13588,2 --|12/12 Twilight Rider slain
    .mob +Twilight Rider
    .target Thessera
step
    .goto 62,43.647,53.432
    >>使用第二个技能让你的驭龙者降落
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .target Malfurion Stormrage
    .turnin 13588 >>交任务: |cRXP_FRIENDLY_群风之眼|r
    .usespell 65579--landing spell, not sure if it works

----
step
    #completewith next
    .hs >>传送至洛丹伦
step
#sticky
#label glynda2
    .goto 62,50.649,19.992,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r交谈
    >>|cRXP_FRIENDLY_游侠格琳达·纳尔谢|r|cRXP_WARN_在洛达内尔各地巡逻|r
    .target Ranger Glynda Nal'Shea
    .turnin 13562 >>交任务: |cRXP_FRIENDLY_巴莎兰的终焉之焰|r
    .accept 13589 >>接任务: |cRXP_WARN_碎矛入侵者|r
step
    .goto 62,50.90,18.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_塞瑞蒂亚·橡语|r|cFFfa9602在旅店中来回巡逻的|r
    .turnin 13599 >>交任务: |cRXP_FRIENDLY_锐爪复元|r
	.target Serendia Oakwhisper
step
    .goto 62,50.825,17.935
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .target Cerellean Whiteclaw
    .turnin 13563 >>交任务: |cRXP_FRIENDLY_爱别离|r
step << skip
#requires glynda2
    .goto 62,50.986,19.229
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .target Gorbold Steelhand
    .accept 13560 >>接任务: |cRXP_WARN_不那么深的海洋|r
step << skip--terrible xp/hr
    .goto 62,52.954,11.045,0
    .goto 62,52.954,11.045,15,0
    >>点击盖瑞旁边的|cRXP_PICK_Decoy Bot 控制台|r
    .target Gary
    >>使用机器人杀死附近沉船周围的鱼人
    .complete 13560,1

step << Priest
    .goto 62,50.647,19.840
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔拉娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Irlara Morninglight
step << Hunter
    .goto 62,50.352,19.126
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰拉·弓叶|r交谈
    .trainer >>训练你的职业法术
    .target Lanla Bowleaf
step << Mage
    .goto 62,50.465,19.210
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉雷瑟·贝德|r交谈
    .trainer >>训练你的职业法术
    .target Lareth Beld
step << Warlock
    .goto 62,50.487,19.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蕾拉·杜布斯|r交谈
    .trainer >>训练你的职业法术
    .target Laera Dubois
step << Rogue
    .goto 62,50.684,18.509
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯拉尔·夜风|r交谈
    .trainer >>训练你的职业法术
    .target Kenral Nightwind
step << Warrior
    .goto 62,50.831,18.787
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵月翼|r交谈
    .trainer >>训练你的职业法术
    .target Sentinel Moonwing
step << Druid
    .goto 62,50.120,19.495
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉尔|r交谈
    .trainer >>训练你的职业法术
    .target Dular
step
    #optional
    .maxlevel 18,DarkshoreEnd
step
#requires glynda2
    .goto 62,58.912,19.448
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉·星风中尉|r交谈
    .target Lieutenant Morra Starbreeze
    .turnin 13589 >>交任务: |cRXP_FRIENDLY_碎矛入侵者|r
step
    .goto 62,58.893,19.411
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 13504 >>接任务: |cRXP_WARN_碎矛劳工|r
    .target Sentinel Tysha Moonblade
step
    .goto 62,58.880,19.530
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .accept 13505 >>接任务: |cRXP_WARN_上层精灵的遗留|r
    .target Balthule Shadowstrike
step
    #sticky
    #label overseer
#loop
    .waypoint 62,60.342,17.689,45,0
    .waypoint 62,60.691,13.745,45,0
    .waypoint 62,63.258,15.511,45,0
    .waypoint 62,62.593,19.890,45,0
    .goto 62,61.832,17.573,0,0
    .use 44979>>击杀|cRXP_ENEMY_碎矛监工|r. 击败他们后可获得 |T134939:0|t[|cRXP_LOOT_监工的命令|r]
    >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_LOOT_监工的命令|r]|cRXP_WARN_来开始任务|r
    .unitscan Shatterspear Overseer
    .collect 44979,1,13506
    .accept 13506 >>接任务: |cRXP_WARN_担心的理由|r

step
#loop
    .goto 62,60.342,17.689,45,0
    .goto 62,60.691,13.745,45,0
    .goto 62,63.258,15.511,45,0
    .goto 62,62.593,19.890,45,0
    .line 62,60.342,17.689,60.691,13.745,63.258,15.511,62.593,19.890,60.342,17.689
    >>击杀|cRXP_ENEMY_碎矛劳工|r
    >>拾取地面上的上层精灵的遗物
    .complete 13504,1 --|10/10 Shatterspear Laborer slain
    .complete 13505,1 --|8/8 Highborne Relic
    .mob Shatterspear Laborer
step
    #requires overseer
    .goto 62,58.880,19.530
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 13505 >>交任务: |cRXP_FRIENDLY_上层精灵的遗留|r
    .target Balthule Shadowstrike
step
    .goto 62,58.893,19.411
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 13504 >>交任务: |cRXP_FRIENDLY_碎矛劳工|r
    .accept 13507 >>接任务: |cRXP_WARN_消减人手|r
    .target Sentinel Tysha Moonblade
step
    .goto 62,58.912,19.448
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉·星风中尉|r交谈
    .target Lieutenant Morra Starbreeze
    .turnin 13506 >>交任务: |cRXP_FRIENDLY_担心的理由|r
    .accept 13508 >>接任务: |cRXP_WARN_快速反应|r
    .turnin 13505 >>交任务: |cRXP_FRIENDLY_上层精灵的遗留|r
    .accept 13509 >>接任务: |cRXP_WARN_战时补给|r
step
#completewith escort1a
    .goto 62,62.143,9.604,0
    >>击杀|cRXP_ENEMY_部落执行者|r 和|cRXP_ENEMY_碎矛秘法师|r
    .use 44999 >>|cRXP_WARN_使用|r|T135433:0|t[卫戍火把] |cRXP_WARN_在 |cRXP_PICK_碎矛军械|r周围的部落营地|r
    .complete 13507,1 --|6/6 Horde Enforcer slain
    .mob +Horde Enforcer
    .complete 13507,2 --|6/6 Shatterspear Mystic slain
    .mob +Shatterspear Mystic
    .complete 13509,1 --|12/12 Shatterspear Armaments burned
step
    .goto 62,63.757,6.014
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .target Alanndarian Nightsong
    .turnin 13508 >>交任务: |cRXP_FRIENDLY_快速反应|r
    .accept 13511 >>接任务: |cRXP_WARN_悲恨仇怨|r
step
    .goto 62,64.122,5.336
    >>击杀|cRXP_ENEMY_Rit'ko|r. 击败他后搜刮出|cRXP_LOOT_Shatterspear Torturer's Cage Key|r
    .complete 13511,1 --|1/1 Rit'ko slain
    .collect 45040,1,13510--Key
    .mob Rit'ko
step
    .goto 62,64.500,5.455
    >>点击|cRXP_PICK_Shatterspear 笼子|r
    .target Sentinel Aynasha
    .accept 13510 >>接任务: |cRXP_WARN_及时赶到|r
step
    #label escort1a
    .goto 62,60.21,6.9
    >>|cRXP_WARN_护送|r|cRXP_FRIENDLY_哨兵阿娜莎|r
    .complete 13510,1
    .target Sentinel Aynasha
step
#loop
    .goto 62,62.929,8.213,30,0
    .goto 62,61.720,11.021,30,0
    .goto 62,62.143,9.604,0
    >>击杀|cRXP_ENEMY_部落执行者|r 和|cRXP_ENEMY_碎矛秘法师|r
    .use 44999 >>|cRXP_WARN_使用|r|T135433:0|t[卫戍火把] |cRXP_WARN_在 |cRXP_PICK_碎矛军械|r周围的部落营地|r
    .complete 13507,1 --|6/6 Horde Enforcer slain
    .mob +Horde Enforcer
    .complete 13507,2 --|6/6 Shatterspear Mystic slain
    .mob +Shatterspear Mystic
    .complete 13509,1 --|12/12 Shatterspear Armaments burned
step
    .goto 62,58.893,19.411
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 13507 >>交任务: |cRXP_FRIENDLY_消减人手|r
    .target Sentinel Tysha Moonblade
step
    .goto 62,58.912,19.448
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉·星风中尉|r交谈
    .target Lieutenant Morra Starbreeze
    .turnin 13509 >>交任务: |cRXP_FRIENDLY_战时补给|r
    .turnin 13510 >>交任务: |cRXP_FRIENDLY_及时赶到|r
    .turnin 13511 >>交任务: |cRXP_FRIENDLY_悲恨仇怨|r
    .accept 13512 >>接任务: |cRXP_WARN_战略打击|r
step
    .goto 62,58.880,19.530
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .accept 13513 >>接任务: |cRXP_WARN_一触即发|r
    .target Balthule Shadowstrike
step
    .goto 62,59.154,19.624
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马萨斯·深林|r交谈
    .target Mathas Wildwood
    .accept 13844 >>接任务: |cRXP_WARN_奥萨拉克斯的藏宝|r
step
#sticky
#label sheya
    .goto 62,61.233,20.367
    .use 44995 >>|cRXP_WARN_使用|r|T136021:0|t[树妖之矛] |cRXP_WARN_击杀|r|cRXP_ENEMY_风暴编织者赛雅|r
    .complete 13512,2 --|1/1 Sheya Stormweaver slain
    .mob Sheya Stormweaver
step
#sticky
#loop
#label shamans
    .waypoint 62,61.233,20.367,20,0
    .waypoint 62,56.801,25.781,20,0
    .waypoint 62,61.233,20.367,0
    .waypoint 62,56.801,25.781,0
    >>击杀|cRXP_ENEMY_碎矛萨满祭司|r. 从他们身上搜刮出|cRXP_LOOT_碎矛护符|r
    .complete 13513,1 --|6/6 Shatterspear Amulet
    .mob Shatterspear Shaman
step
#requires sheya
    .goto 62,58.242,23.971
    >>击杀塔顶的提甘·霍拉维
    >>战利品|cRXP_LOOT_Narassin's Tome|r位于塔的中层
    .complete 13844,1 --|1/1 Teegan Holloway slain
    .complete 13844,2 --|1/1 Narassin's Tome
    .mob Teegan Holloway
step
    .goto 62,56.801,25.781
    .use 44995 >>|cRXP_WARN_使用|r|T136021:0|t[树妖之矛]|cRXP_WARN_击杀|r|cRXP_ENEMY_洛伦瑟·唤雷|r
    .complete 13512,1 --|1/1 Lorenth Thundercall slain
    .mob Lorenth Thundercall
step--TODO: Fix this bit
#requires shamans
    .goto 1439/1,-804.20001,7376.39990
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马萨斯·深林|r交谈
    .target Mathas Wildwood
    .turnin 13844 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯的藏宝|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .goto 1439/1,-791.50000,7381.60010
    .turnin 13513 >>交任务: |cRXP_FRIENDLY_一触即发|r
    .target Balthule Shadowstrike
step
    .goto 1439/1,-792.79999,7384.80029
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉·星风中尉|r交谈
    .turnin 13512 >>交任务: |cRXP_FRIENDLY_战略打击|r
    .accept 13590 >>接任务: |cRXP_WARN_前线|r
    .target Lieutenant Morra Starbreeze
step
    .goto 1439/1,-1450.59998,7392.20020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    .accept 13514 >>接任务: |cRXP_WARN_古树的怒火|r
    .target Kerlonian Evershade
step
#completewith next
    .goto 62,69.435,19.546
    .vehicle >>|cRXP_WARN_骑乘|r|cRXP_FRIENDLY_狂怒的保护者|r
    .target Vengeful Protector
step
    .goto 62,70.684,20.841,0
    .goto 62,70.589,16.872,0
    .goto 62,70.684,20.841,50,0
    .goto 62,70.589,16.872,50,0
    >>|cRXP_WARN_施放|r|T136025:0|t[震荡波] (1)|cRXP_WARN_击杀|r|cRXP_ENEMY_碎矛巨魔|r
    >>|cRXP_WARN_施放|r|T135734:0|t[月涌] (2)|cRXP_WARN_烧毁碎星者建筑|r
    .complete 13514,1 --|30/30 Shatterspear Vale Trolls killed
    .mob +Shatterspear Champion
    .mob +Shatterspear Priestess
    .mob +Shatterspear Raider
    .complete 13514,2 --|6/6 Shatterspear Structures destroyed
step
    .isOnQuest 13514
    .exitvehicle >>|cRXP_WARN_退出|r|cRXP_FRIENDLY_狂怒的保护者|r
step
    .goto 62,72.263,19.096
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手桑德娅·月落|r交谈
    .target Huntress Sandrya Moonfall
    .turnin 13590 >>交任务: |cRXP_FRIENDLY_前线|r
    .accept 13515 >>接任务: |cRXP_WARN_结束威胁|r
step
    .isOnQuest 13515
    .goto 62,72.263,19.096
    .gossip 33178,0 >>与|cRXP_FRIENDLY_女猎手桑德娅·月落|r交谈以开始进攻
    .skipgossip 33178,1
    .target Huntress Sandrya Moonfall
step
    .goto 62,72.857,18.019
    >>击杀|cRXP_ENEMY_Jor'kil the Soulripper|r. 击败后可搜刮物品:|T133466:0|t[|cRXP_LOOT_Hellscream's Missive|r]
    .use 46318 >>|cRXP_WARN_使用|r|T133466:0|t[|cRXP_LOOT_地狱之书信|r]|cRXP_WARN_来开始任务|r
    .complete 13515,1 --|1/1 Jor'kil the Soulripper slain
    .collect 46318,1,13591
    .accept 13591 >>接任务: |cRXP_WARN_令人不安的联系|r
    .mob Jor'kil the Soulripper
step
    .goto 62,72.251,19.095
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手桑德娅·月落|r交谈
    .target Huntress Sandrya Moonfall
    .turnin 13515 >>交任务: |cRXP_FRIENDLY_结束威胁|r
--TODO: Test Logout skip
step
    .goto 62,69.109,19.249
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    .target Kerlonian Evershade
    .turnin 13514 >>交任务: |cRXP_FRIENDLY_古树的怒火|r
step
    #completewith next
    .hs >>传送至洛丹伦
step << skip
    .goto 62,51.004,19.217
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .target Gorbold Steelhand
    .turnin 13560 >>交任务: |cRXP_FRIENDLY_不那么深的海洋|r
step
    .goto 62,50.684,19.712
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠 格琳达·纳尔谢|r交谈, 她正在月井周围的区域巡逻
    .target Ranger Glynda Nal'Shea
    .turnin 13591 >>交任务: |cRXP_FRIENDLY_令人不安的联系|r
step
    .goto 62,50.129,19.461
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .target Cerellean Whiteclaw
    .accept 13570 >>接任务: |cRXP_WARN_铭记奥伯丁|r
    .turnin 13570 >>交任务: |cRXP_FRIENDLY_铭记奥伯丁|r
step << Priest
    .goto 62,50.647,19.840
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔拉娜·晨光|r交谈
    .trainer >>训练你的职业法术
    .target Irlara Morninglight
step << Hunter
    .goto 62,50.352,19.126
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰拉·弓叶|r交谈
    .trainer >>训练你的职业法术
    .target Lanla Bowleaf
step << Mage
    .goto 62,50.465,19.210
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉雷瑟·贝德|r交谈
    .trainer >>训练你的职业法术
    .target Lareth Beld
step << Warlock
    .goto 62,50.487,19.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蕾拉·杜布斯|r交谈
    .trainer >>训练你的职业法术
    .target Laera Dubois
step << Rogue
    .goto 62,50.684,18.509
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯拉尔·夜风|r交谈
    .trainer >>训练你的职业法术
    .target Kenral Nightwind
step << Warrior
    .goto 62,50.831,18.787
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵月翼|r交谈
    .trainer >>训练你的职业法术
    .target Sentinel Moonwing
step << Druid
    .goto 62,50.120,19.495
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜拉尔|r交谈
    .trainer >>训练你的职业法术
    .target Dular
step
    #optional
    #label DarkshoreEnd

--NORTHERN DARKSHORE END
step
#questguide
#completewith next
    .goto 62,51.724,17.651
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .target Teldira Moonfeather
    .fly Grove of the Ancients >>飞往古树之林
step
#questguide
    .goto 62,45.141,75.174
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佛利埃·阔叶|r交谈
    .target Foriel Broadleaf
    .accept 13525 >>接任务: |cRXP_WARN_黑木熊怪怎么了？|r
step
#questguide
    .goto 62,45.311,75.131
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与利爪德鲁伊巴尔伦交谈|cRXP_FRIENDLY_Balren of the Claw|r
    .target Balren of the Claw
    .turnin -13902 >>交任务: |cRXP_FRIENDLY_组织进攻|r
    .accept 13892 >>接任务: |cRXP_WARN_不着痕迹|r
step
#questguide
    .goto 62,45.198,74.627
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .accept 13881 >>接任务: |cRXP_WARN_病逝|r
step
#questguide
#completewith furbolgs
    >>击杀|cRXP_ENEMY_被吞噬的蓟熊|r
    .complete 13881,1
    .mob Consumed Thistle Bear
step
#questguide
    .goto 62,45.031,79.192
    >>|cRXP_WARN_游到水下的|cRXP_PICK_Devouring Artifact|r|r
    .complete 13881,2 --|Watering Hole Investigated
step
#questguide
    .goto 62,43.524,80.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_熊怪长者|r交谈
    .target Elder Brolg
    .turnin 13525 >>交任务: |cRXP_FRIENDLY_黑木熊怪怎么了？|r
    .accept 13526 >>接任务: |cRXP_WARN_熊爪草|r
step
#questguide
#loop
#label furbolgs
    .goto 62,44.749,82.357,40,0
    .goto 62,45.929,83.041,40,0
    .goto 62,45.275,85.286,40,0
    .goto 62,44.143,81.923,40,0
    .goto 62,44.828,83.242,0
    >>拾取地面上的|cRXP_LOOT_熊掌|r
    >>|cRXP_WARN_它们看起来像小型植物|r
    .complete 13526,1 --|8/8 Bear's Paw
step
#questguide
    .goto 62,40.634,84.297
    .subzone 449 >>前往主宰之剑
    .isOnQuest 13892
step
#questguide
    #completewith next
    .cast 65426 >>|cRXP_WARN_使用|r|T133236:0|t[黑豹雕像]|cRXP_WARN_变身黑豹|r
    .use 46696
step
#questguide
    .goto 62,40.634,84.297
    >>|cRXP_WARN_前往工头巴尔索斯并等待任务完成|r
    >>|cRXP_WARN_注意:如果你受到坠落伤害, 将失去黑豹buff|r
    .complete 13892,1 --|1/1 Twilight's Hammer surveillance
    .target Foreman Balsoth
    .use 46696
step
#questguide
    .goto 62,45.311,75.131
    >>点击小地图下方的任务提示窗口来交任务
    >>|cRXP_WARN_如果你无法完成此任务, 请返回并与|r|cRXP_FRIENDLY_利爪德鲁伊巴尔伦交谈|r
    .turnin 13892 >>交任务: |cRXP_FRIENDLY_不着痕迹|r
    .accept 13948 >>接任务: |cRXP_WARN_上前监视|r
    .target Balren of the Claw
step
#questguide
    .goto 62,39.658,86.384,10,0
    .goto 62,41.056,86.360,10,0
    .goto 62,40.733,85.046,10,0
    .goto 62,39.809,85.356,10,0
    .goto 62,40.101,84.651
    .use 46696 >>|cRXP_WARN_使用|r|T133236:0|t[黑豹雕像]|cRXP_WARN_再次变身成为黑豹|r
    >>|cRXP_WARN_悄悄潜行至|r|cRXP_ENEMY_灾难预言者索维利恩|r|cRXP_WARN_, 一路爬上脚手架. 再次等待复活时间|r
    >>|cRXP_WARN_避开|cRXP_ENEMY_无面者|r, 因为他们具备潜行侦测能力|r
    .target Doomspeaker Trevellion
    .complete 13948,1
step
#questguide
    .goto 62,43.535,81.019
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_熊怪长者|r交谈
    .target Elder Brolg
    .turnin 13526 >>交任务: |cRXP_FRIENDLY_熊爪草|r
    .accept 13544 >>接任务: |cRXP_WARN_熊的祝福|r
step
#questguide
#sticky
#label fleetfoot
    .goto 62,45.103,78.471
    >>击杀|cRXP_ENEMY_迅足|r. 击败后可掠夺其|cRXP_LOOT_尾羽|r
    .collect 44886,1,13544,1
    .mob Fleetfoot
step
#questguide
#loop
    .goto 62,45.945,78.353,0
    .goto 62,42.014,76.593,0
    .goto 62,45.945,78.353,40,0
    .goto 62,42.014,76.593,40,0
    >>击杀|cRXP_ENEMY_被吞噬的蓟熊|r
    .complete 13881,1
    .mob Consumed Thistle Bear
step
#questguide
#requires fleetfoot
    .goto 62,45.300,76.734
    .use 44888 >>|cRXP_WARN_使用|r|T134189:0|t[熊掌捆扎包]|cRXP_WARN_在|r|cRXP_PICK_古熊雕像附近|r
    .complete 13544,1
step
#questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利爪德鲁伊巴尔伦|r和|cRXP_FRIENDLY_拉蕾|r交谈
    .turnin 13948 >>交任务: |cRXP_FRIENDLY_上前监视|r
    .target +Balren of the Claw
    .goto 62,45.284,75.170
    .accept 13896 >>接任务: |cRXP_WARN_出土的知识|r
    .target +Larien
    .goto 62,45.324,75.050
step
#questguide
    .goto 62,45.194,74.629
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .turnin 13881 >>交任务: |cRXP_FRIENDLY_病逝|r
    .accept 13882 >>接任务: |cRXP_WARN_生命之种|r
step
#questguide
    .goto 62,45.405,74.859
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈以领取|r大地之种|r
    .complete 13882,1
    .skipgossip
    .target Onu
step
#questguide
    #sticky
    #label skyseed
    #loop
    .goto 62,41.860,77.050,0
    .goto 62,44.292,78.937,0
    .goto 62,40.902,79.825,0
    .waypoint 62,41.860,77.050,40,0
    .waypoint 62,44.292,78.937,40,0
    .waypoint 62,40.902,79.825,40,0
    >>|cRXP_WARN_寻找在黑海岸上空飞舞的黑海岸小精灵. 当它们接近地面时点击一次|r
    .unitscan Darkshore Wisp
    .complete 13882,3
step
#questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_熊怪长者 Brolg|r和|cRXP_FRIENDLY_戈伦·裂皮|r交谈
    .turnin 13544 >>交任务: |cRXP_FRIENDLY_熊的祝福|r
    .accept 13545 >>接任务: |cRXP_WARN_净化感染者|r
    .target +Elder Brolg
    .goto 62,43.515,81.018
    .accept 13572 >>接任务: |cRXP_WARN_碧火火盆|r
    .target +Gren Tornfur
    .goto 62,43.576,81.023
step
#questguide
    #loop
    #sticky
    #label braziers
    .goto 62,44.749,82.357,40,0
    .goto 62,45.929,83.041,40,0
    .goto 62,45.275,85.286,40,0
    .goto 62,44.143,81.923,40,0
    .goto 62,44.828,83.242,0
    >>点击营地周围散落的|cRXP_PICK_碧火火盆|r
    .complete 13572,1 --|8/8 Jadefire Brazier
step
#questguide
#loop
    .goto 62,44.749,82.357,40,0
    .goto 62,45.929,83.041,40,0
    .goto 62,45.275,85.286,40,0
    .goto 62,44.143,81.923,40,0
    .goto 62,44.828,83.242,0
    .use 44889>>|cRXP_WARN_使用|r |T237425:0|t[受祝福的草药包] |cRXP_WARN_对|r |cRXP_ENEMY_黑木熊怪|r施放, 然后击杀生成的|r |cRXP_ENEMY_污染之魂|r|r
    .complete 13545,1
    .mob Spirit of Corruption
    .target Maddened Blackwood
    .target Corrupted Blackwood
step
#questguide
#requires braziers
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈伦·裂皮|r和|cRXP_FRIENDLY_熊怪长者|r交谈
    .turnin 13572 >>交任务: |cRXP_FRIENDLY_碧火火盆|r
    .target +Gren Tornfur
    .goto 62,43.576,81.023
    .turnin 13545 >>交任务: |cRXP_FRIENDLY_净化感染者|r
    .accept 13546 >>接任务: |cRXP_WARN_污染者|r
    .target +Elder Brolg
    .goto 62,43.515,81.018
step
#questguide
    .goto 62,46.754,84.038
    >>击杀|cRXP_ENEMY_污染者萨纳克斯|r
    .complete 13546,1 --|1/1 Sharax the Defiler slain
    .mob Sharax the Defiler
step
#questguide
    .goto 62,43.526,80.990
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_熊怪长者|r交谈
    .target Elder Brolg
    .turnin 13546 >>交任务: |cRXP_FRIENDLY_污染者|r
step
#questguide
#loop
    .goto 62,38.060,79.195,0
    .goto 62,38.645,78.225,0
    .goto 62,37.263,76.834,0
    .goto 62,37.999,74.396,0
    .goto 62,38.060,79.195,20,0
    .goto 62,38.645,78.225,20,0
    .goto 62,37.263,76.834,20,0
    .goto 62,37.999,74.396,20,0
    >>打开地面上的|cRXP_PICK_闪亮贝壳|r, 拾取它们以获得|cRXP_LOOT_海洋之种|r
    .complete 13882,2 --|1/1 Seed of the Sea
step
#questguide
#requires skyseed
    .goto 62,37.626,82.824
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家格罗夫|r交谈
    .target Archaeologist Groff
    .turnin 13896 >>交任务: |cRXP_FRIENDLY_出土的知识|r
    .accept 13893 >>接任务: |cRXP_WARN_索苟斯与克洛恩|r
    .accept 13907 >>接任务: |cRXP_WARN_清扫废墟|r
step
#questguide
    .goto 62,37.747,82.932
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与初级考古学家费德交谈 |cRXP_FRIENDLY_初级考古学家费德|r
    .target Jr. Archaeologist Ferd
    .accept 13912 >>接任务: |cRXP_WARN_埋没的秘密|r
step
#questguide
    .goto 62,37.695,82.932
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .target Prospector Remtravel
    .accept 13911 >>接任务: |cRXP_WARN_心不在焉的勘察员|r
    >>|cRXP_WARN_这将触发一个护送任务|r
step
#questguide
    #completewith prospector
    #optional
    >>击杀|cRXP_ENEMY_灰雾难民|r 和|cRXP_ENEMY_灰雾智者|r
    .complete 13907,1
    .mob Greymist Refugee
    .mob Greymist Oracle
step
#questguide
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_勘察员雷姆塔维尔|r穿过挖掘区域|r
    .complete 13911,1
    .target Prospector Remtravel
step
#questguide
    .goto 62,37.747,82.932
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与初级考古学家费德交谈 |cRXP_FRIENDLY_初级考古学家费德|r
    .target Jr. Archaeologist Ferd
    .turnin 13911 >>交任务: |cRXP_FRIENDLY_心不在焉的勘察员|r
step
#questguide
#label prospector
    .goto 62,37.023,83.441
    >>点击水下的|r|cRXP_PICK_裹着泥巴的古老圆盘|r
    .complete 13912,1 --|1/1 Mud-Crusted Ancient Disc
step
#questguide
#loop
    .goto 62,36.355,83.599,20,0
    .goto 62,37.393,82.425,20,0
    .goto 62,36.572,84.501,20,0
    .goto 62,37.669,84.418,0
    >>击杀|cRXP_ENEMY_灰雾难民|r 和|cRXP_ENEMY_灰雾智者|r
    .complete 13907,1
    .mob Greymist Refugee
    .mob Greymist Oracle
step
#questguide
    .goto 62,37.626,82.824
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家格罗夫|r交谈
    .target Archaeologist Groff
    .turnin 13907 >>交任务: |cRXP_FRIENDLY_清扫废墟|r
    .accept 13909 >>接任务: |cRXP_WARN_有废料吗？|r
step
#questguide
    .goto 62,37.747,82.932
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与初级考古学家费德交谈 |cRXP_FRIENDLY_初级考古学家费德|r
    .target Jr. Archaeologist Ferd
    .turnin 13912 >>交任务: |cRXP_FRIENDLY_埋没的秘密|r
    .accept 13918 >>接任务: |cRXP_WARN_泰坦终端|r
step
#questguide
#completewith next
    >>战利品 |cRXP_PICK_漂浮灰雾残骸|r 沿着海岸
    .complete 13909,1
step
#questguide
#loop
    .goto 62,38.407,78.988,0
    .goto 62,36.452,81.574,0
    .goto 62,36.126,84.743,0
    .goto 62,37.149,86.795,0
    .goto 62,38.407,78.988,40,0
    .goto 62,36.452,81.574,40,0
    .goto 62,36.126,84.743,40,0
    .goto 62,37.149,86.795,40,0
    .use 46388 >>|cRXP_WARN_使用|r |T134519:0|t[地底圣物探测器] |cRXP_WARN_来发现海岸沿线的 |cRXP_PICK_埋藏残骸|r. 拾取它们以获得|r |cRXP_LOOT_远古圣物碎片|r|r
    .collect 46702,5,13918,1
    .isOnQuest 13918
step
#questguide
#loop
    .goto 62,38.407,78.988,0
    .goto 62,36.452,81.574,0
    .goto 62,36.126,84.743,0
    .goto 62,37.149,86.795,0
    .goto 62,38.407,78.988,40,0
    .goto 62,36.452,81.574,40,0
    .goto 62,36.126,84.743,40,0
    .goto 62,37.149,86.795,40,0
    >>战利品 |cRXP_PICK_漂浮灰雾残骸|r 沿着海岸
    .complete 13909,1
step
#questguide
    .use 46702 >>|cRXP_WARN_使用|r|T132997:0|t[远古圣物碎片]|cRXP_WARN_将其组合成|r|cRXP_LOOT_组装完成的远古圣物|r
    .complete 13918,1
step
#questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_考古学家格罗夫|r和|cRXP_FRIENDLY_初级考古学家费德|r
    .turnin 13909 >>交任务: |cRXP_FRIENDLY_有废料吗？|r
    .accept 13910 >>接任务: |cRXP_WARN_新家|r
    .target +Archaeologist Groff
    .goto 62,37.645,82.832
    .turnin 13918 >>交任务: |cRXP_FRIENDLY_泰坦终端|r
    .target +Jr. Archaeologist Ferd
    .goto 62,37.747,82.932
step
#questguide
    .goto 62,35.905,81.942
    .use 46385 >>|cRXP_WARN_使用|r|T132281:0|t[奇特的移动式鱼人茅舍制造器] |cRXP_WARN_旁边的|r|cRXP_PICK_格雷米斯特鱼人建造点|r
    .complete 13910,1 --|1/1 Greymist Murloc Home Built
step
#questguide
    .goto 62,37.643,82.805
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家格罗夫|r交谈
    .target Archaeologist Groff
    .turnin 13910 >>交任务: |cRXP_FRIENDLY_新家|r
step
#questguide
    .goto 62,45.310,75.054
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉蕾|r交谈
    .target Larien
    .turnin 13893 >>交任务: |cRXP_FRIENDLY_索苟斯与克洛恩|r
step
#questguide
    .goto 62,45.210,74.633
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .turnin 13882 >>交任务: |cRXP_FRIENDLY_生命之种|r
    .accept 13925 >>接任务: |cRXP_WARN_一点预防措施|r
step
#questguide
    .goto 62,45.405,74.864
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .target Onu
    .accept 13895 >>接任务: |cRXP_WARN_沉睡的古木|r
step
#questguide
    .goto 62,45.683,71.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿洛斯|r交谈
    .target Aros
    .turnin 13895 >>交任务: |cRXP_FRIENDLY_沉睡的古木|r
step
#questguide
    .goto 62,45.568,71.637
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗鳞刺客|r交谈
    .target Darkscale Assassin
    .accept 13953 >>接任务: |cRXP_WARN_我们中的纳迦|r
step
#questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利爪德鲁伊巴尔伦|r和|cRXP_FRIENDLY_菲尔罗斯|r交谈
    .turnin 13953 >>交任务: |cRXP_FRIENDLY_我们中的纳迦|r
    .accept 13899 >>接任务: |cRXP_WARN_暗鳞督军|r
    .target +Balren of the Claw
    .goto 62,45.303,75.129
    .accept 13898 >>接任务: |cRXP_WARN_形势对我们不利|r
    .target +Felros
    .goto 62,45.352,75.115
step
#questguide
#loop
    .goto 62,41.893,75.131,0
    .goto 62,40.264,73.207,0
    .goto 62,41.893,75.131,30,0
    .goto 62,40.264,73.207,30,0
    .use 46363 >>|cRXP_WARN_使用|r |T133749:0|t[予生者幼苗] |cRXP_WARN_对 |cRXP_ENEMY_白尾鹿|r和|cRXP_ENEMY_灰斑蓟熊|r和|cRXP_ENEMY_月夜雌虎|r或|r |cRXP_ENEMY_月夜雄虎|r|r
    .complete 13925,1 --|1/1 Lifebringer Sapling Tested
    .target Whitetail Stag
    .target Grizzled Thistle Bear
    .target Moonstalker Matriarch
    .target Moonstalker Sire
step
#questguide
    .goto 62,45.197,74.608
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .turnin 13925 >>交任务: |cRXP_FRIENDLY_一点预防措施|r
    .accept 13885 >>接任务: |cRXP_WARN_保卫黑海岸|r
step
#questguide
#completewith next
    .goto 62,44.474,75.350
    .vehicle >>|cRXP_WARN_与|cRXP_FRIENDLY_奥修斯|r交谈, 以骑乘|r|cRXP_FRIENDLY_角鹰兽|r|r
    .skipgossip
step
#questguide
    >>|cRXP_WARN_施放|r|T136065:0|t[保护野生动物] (1), |cRXP_WARN_目标: |r|cRXP_ENEMY_灰斑蓟熊|r和|cRXP_ENEMY_月夜猛虎|r和|r|cRXP_ENEMY_白尾鹿|r|r
    .complete 13885,1 -- Grizzled Thistle Bear Protected (8)
    .target +Grizzled Thistle Bear
    .complete 13885,2 -- Moonstalker Protected (8)
    .target +Moonstalker
    .complete 13885,3 -- Whitetail Deer Protected (8)
    .target +Whitetail Deer
step
#questguide
    .goto 62,45.198,74.627
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .turnin 13885 >>交任务: |cRXP_FRIENDLY_保卫黑海岸|r
    .accept 13891 >>接任务: |cRXP_WARN_黑海岸的吞噬者|r
step
#questguide
    #completewith next
    .goto 62,45.031,79.192
    .cast 65207 >>|cRXP_WARN_在水下|cRXP_PICK_吞噬神器|r处使用|r|T133749:0|t[予生者幼苗]|cRXP_WARN_来召唤|r|cRXP_ENEMY_吞噬者约萨尔|r
    .timer 10,The Devourer of Darkshore RP
    .use 46370
step
#questguide
    .goto 62,45.031,79.192
    .use 46370 >>击杀|cRXP_ENEMY_Yoth'al 撕裂者|r
    .complete 13891,1
    .mob Yoth'al the Devourer
step
#questguide
    #completewith AzsharaOffering
    >>击杀|cRXP_ENEMY_暗鳞随从|r
    .complete 13898,1 --|8/8 Darkscale Myrmidon slain
    .mob Darkscale Myrmidon
step
#questguide
    .goto 62,33.43,83.65,50,0
    .goto 62,33.040,83.773,15,0
    .goto 62,32.269,84.069,15,0
    .goto 62,32.263,85.379
    >>击杀|cRXP_ENEMY_怒脊督军|r
    >>点击|r怒脊督军|r尸体后
    .mob Warlord Wrathspine
    .turnin 13899 >>交任务: |cRXP_FRIENDLY_暗鳞督军|r
    .accept 13900 >>接任务: |cRXP_WARN_献给艾萨拉|r
step
#questguide
    #label AzsharaOffering
    .goto 62,32.874,84.131
    >>|cRXP_WARN_离开洞穴, 前往入口上方的平台|r
    >>击杀|cRXP_ENEMY_Darkscale 女祭司|r
    .complete 13900,1 --|1/1 Offering to Azshara prevented
    .timer 64,The Offering to Azshara RP
    .mob Darkscale Priestess
step
#questguide
#completewith next
    +|cRXP_WARN_等待与|cRXP_ENEMY_艾萨拉女王|r的剧情互动结束, 并等待|cRXP_FRIENDLY_玛法里奥·怒风|r抵达|r
step
#questguide
    .goto 62,32.796,84.294
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛法里奥·怒风|r交谈
    .turnin 13900 >>交任务: |cRXP_FRIENDLY_献给艾萨拉|r
    .accept 13897 >>接任务: |cRXP_WARN_黑海岸之战|r
    .target Malfurion Stormrage
step
#questguide
    .goto 62,32.874,84.131
    >>击杀|cRXP_ENEMY_暗鳞随从|r
    .complete 13898,1 --|8/8 Darkscale Myrmidon slain
    .mob Darkscale Myrmidon
step
#questguide
#completewith next
    .cast 80230 >>|cRXP_WARN_前往主宰之剑并使用|r |T237377:0|t[远古之角]
    .use 58365
step
#questguide
    .goto 62,40.552,83.946
    .use 58365 >>击杀索苟斯的化身
    .mob Avatar of Soggoth
    .complete 13897,1 --|1/1 Avatar of Soggoth slain
step
#questguide
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与利爪德鲁伊巴尔伦交谈|cRXP_FRIENDLY_Balren of the Claw|r
    .turnin 13897 >>交任务: |cRXP_FRIENDLY_黑海岸之战|r
    --.accept 26408 >>接任务: |cRXP_WARN_灰谷的灰|r
    .target Balren of the Claw
    .goto 62,45.305,75.134
step
#questguide
    .goto 62,45.352,75.115
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔罗斯|r交谈
    .turnin 13898 >>交任务: |cRXP_FRIENDLY_形势对我们不利|r
    .target Felros
step
#questguide
    .goto 62,45.198,74.627
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑟娜·冬灵|r交谈
    .target Kathrena Winterwisp
    .turnin 13891 >>交任务: |cRXP_FRIENDLY_黑海岸的吞噬者|r
step
#questguide
    #completewith next
    .hs >>传送至洛丹伦
]])
