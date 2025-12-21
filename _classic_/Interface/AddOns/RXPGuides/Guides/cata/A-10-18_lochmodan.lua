local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Horde' then return end

RXPGuides.RegisterGuide([[

#version 1
#group RXP 大地的裂变 1-80 (联盟) << cata
#group RestedXP 熊猫人之谜 1-60 (联盟) << mop
#cata
#mop
#name 10-20 洛克莫丹
#displayname 10-18 洛克莫丹 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 15-20 赤脊山
#defaultfor Human/Dwarf/Gnome/Pandaren

<<Alliance

step
    #optional
    .maxlevel 20,endOfTheGuide
step << Pandaren
    .goto 84,70.94,72.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Gol'Bolar Quarry >>飞往古博拉采掘场
	.target Dungar Longdrink
    .zoneskip Dun Morogh
    .zoneskip Loch Modan
step << Pandaren
    #optional
    #completewith next
    .goto 27,87.534,48.059,20,0
    .goto 27,88.331,47.792,12,0
    .goto 27,88.873,48.312,12,0
    .goto 48,12.138,54.947,20,0
    .goto 48,14.025,56.641,12 >>|cRXP_WARN_爬上山顶, 然后小心地向|r|cRXP_FRIENDLY_驾驶员塞克·锤足 下降|r
    .noflyable
step << Pandaren
    .goto 48,14.006,56.485
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 26854 >>接任务: |cRXP_LOOT_失踪的驾驶员|r
    .target Pilot Hammerfoot
step << Pandaren
    #optional
    #completewith next
    .goto 48,12.639,58.419,20,0
    .goto 27,89.543,51.716,20,0
    >>前往地面上的|cRXP_PICK_矮人的尸体|r
    .noflyable
step << Pandaren
    .goto 27,87.633,50.139
    >>点击地面上的|cRXP_PICK_矮人的尸体|r
    >>|cRXP_WARN_这将使|cRXP_ENEMY_癞爪|r开始朝你奔来|r
    .turnin 26854 >>交任务: |cRXP_FRIENDLY_失踪的驾驶员|r
    .accept 26855 >>接任务: |cRXP_LOOT_驾驶员的复仇|r
step << Pandaren
    .goto 27,87.421,50.013,0
    .goto 27,87.357,49.213
    >>击杀|cRXP_ENEMY_癞爪|r. 击败他后搜刮出他的|cRXP_LOOT_肮脏的爪子|r
    .complete 26855,1 --Mangy Claw (1)
    .unitscan Mangeclaw
step << Pandaren
    .goto 48,14.006,56.485
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 26855 >>交任务: |cRXP_FRIENDLY_驾驶员的复仇|r
    .accept 13635 >>接任务: |cRXP_WARN_南门进度报告|r
    .target Pilot Hammerfoot
step
    #completewith next
    .goto 48,21.398,66.390,30,0
    .goto 48,21.559,68.292,30,0
    .goto 48,23.670,75.378,15,0
    .goto 48,23.495,75.054,12 >>前往碉堡内找拉格弗斯上尉
    .xp >30,1
    .isOnQuest 13635
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格弗斯上尉|r 和 |cRXP_FRIENDLY_巡山人库伯弗林特|r inside
    .turnin -13635 >>交任务: |cRXP_FRIENDLY_南门进度报告|r
    .accept 26146 >>接任务: |cRXP_LOOT_保卫国王的领土|r
    .goto 48,23.495,75.054
    .target +Captain Rugelfuss
    .accept 26145 >>接任务: |cRXP_LOOT_穴居人的威胁|r
    .goto 48,23.332,74.925
    .target +Mountaineer Cobbleflint
step << Warrior/Paladin
    .goto 48,23.673,74.329
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索瓦尔德·深炉|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    .collect 1198,1 -- Claymore (1)
    .money <0.2142
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Thorvald Deepforge
step << Rogue/Shaman
    .goto 48,23.673,74.329
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索瓦尔德·深炉|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132402:0|t[短柄斧]|r
    .collect 853,1 -- Hatchet (1)
    .money <0.1927
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target Thorvald Deepforge
    .xp <11,1
step << Warrior/Paladin
    #optional
    #completewith end
    +|cRXP_WARN_装备|r|T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue/Shaman
    #optional
    #completewith end
    +|cRXP_WARN_在你的主手装备|r|T132402:0|t[短柄斧]|r
    .use 853
    .itemcount 853,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step
    #completewith next
    .goto 48,22.850,77.894,20,0
    .goto 48,23.693,79.793,20,0
    .goto 48,24.950,78.306,20,0
    .goto 48,27.712,76.586,20,0
    .goto 48,30.076,78.276
    .subzone 923 >>沿着小路向上前往石裂谷
    .xp >30,1
step
#loop
    .goto 48,28.888,86.139,30,0
    .goto 48,32.444,79.051,30,0
    .goto 48,36.068,83.253,30,0
    .goto 48,28.888,86.139,0
    .goto 48,32.444,79.051,0
    .goto 48,36.068,83.253,0
    >>击杀并掠夺|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r
    .complete 26146,1 --|12/12 Stonesplinter Trogg slain
    .complete 26145,1 --|8/8 Trogg Stone Tooth
    .mob Stonesplinter Trogg
    .mob Stonesplinter Scout
step
#xprate <1.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r和|r巡山人库伯弗林特|r以及|r瓦尔邦队长|r交谈
    .turnin 26146 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
    .accept 26148 >>接任务: |cRXP_WARN_决定性的一击|r
    .target +Captain Rugelfuss
    .goto 48,23.359,74.990
    .turnin 26145 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
    .target +Mountaineer Cobbleflint
    .goto 48,23.332,74.927
    .accept 26147 >>接任务: |cRXP_WARN_更大更丑|r
    .target +Mountaineer Wallbang
    .goto 48,23.298,75.054
step
#xprate >1.299
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格弗斯上尉|r和|r巡山人库伯弗林特|r以及|r瓦尔邦队长|r交谈
    .turnin 26146 >>交任务: |cRXP_FRIENDLY_保卫国王的领土|r
    .target +Captain Rugelfuss
    .goto 48,23.359,74.990
    .turnin 26145 >>交任务: |cRXP_FRIENDLY_穴居人的威胁|r
    .target +Mountaineer Cobbleflint
    .goto 48,23.332,74.927
step
#xprate <1.3
#sticky
#label troggcave1
#loop
    .goto 48,33.657,67.547,25,0
    .goto 48,35.599,63.221,25,0
    .goto 48,35.304,59.151,25,0
    .goto 48,33.289,62.142,25,0
    .goto 48,35.558,61.606,25,0
    .goto 48,34.289,61.146,25,0
    .goto 48,35.995,64.384,25,0
    .goto 48,34.366,66.919,0
    >>前往石裂谷以北的洞穴
    >>击杀|cRXP_ENEMY_萨满祭司|r和|cRXP_ENEMY_折骨者|r
    .complete 26147,1 --|8/8 Stonesplinter Shaman slain
    .complete 26147,2 --|8/8 Stonesplinter Bonesnapper slain
    .mob Stonesplinter Shaman
    .mob Stonesplinter Bonesnapper
step
#xprate <1.3
    >>前往洞穴尽头并击杀|cRXP_ENEMY_格劳姆格|r
    .goto 48,34.289,61.146
    .complete 26148,1 --|1/1 Grawmug slain
    .mob Grawmug
step
#xprate <1.3
#requires troggcave1
    .goto 48,23.321,75.013
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉格弗斯上尉|r 和 |cRXP_FRIENDLY_瓦尔邦克上尉|r 交谈
    .turnin 26148 >>交任务: |cRXP_FRIENDLY_决定性的一击|r
    .accept 26176 >>接任务: |cRXP_WARN_前往塞尔萨玛|r
    .target +Captain Rugelfuss
    .goto 48,23.359,74.990
    .turnin 26147 >>交任务: |cRXP_FRIENDLY_更大更丑|r
    .target +Mountaineer Wallbang
    .goto 48,23.298,75.054
step
    .goto 48,33.940,50.955
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .target Thorgrum Borrelson
step
    .goto 48,35.079,46.663
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .target Mountaineer Kadrell
    .turnin -26176 >>交任务: |cRXP_FRIENDLY_前往塞尔萨玛|r
    .accept 26842 >>接任务: |cRXP_WARN_凭空出现|r
    .accept 13636 >>接任务: |cRXP_WARN_雷矛的命令|r
step
    #optional
    .maxlevel 20,endOfTheGuide
step
    .goto 48,35.536,48.404
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板纳克罗·壁炉|r交谈
    .home >>将你的[炉石]设置为塞尔萨玛
    .target Innkeeper Hearthstove
step
    .goto 48,34.849,49.177
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .target Vidra Hearthstove
    .accept 26860 >>接任务: |cRXP_LOOT_塞尔萨玛血肠|r
step << Paladin
    .goto 48,35.374,48.810
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔多克·石信|r谈话
    .trainer >>训练你的职业法术
    .target Faldoc Stonefaith
step << Rogue
    .goto 48,34.935,48.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔达·铜刃|r交谈
    .trainer >>训练你的职业法术
    .target Galda Bronzeblade
step << Mage
    .goto 48,35.012,48.445
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_绿袍甘道尔|r交谈
    .trainer >>训练你的职业法术
    .target Gindle the Green
step << Hunter
    .goto 48,34.553,48.117
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔达·野性之心|r交谈
    .trainer >>训练你的职业法术
    .target Belda Wildheart
step << Warrior
    .goto 48,33.951,46.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦丁·迅斧|r交谈
    .trainer >>训练你的职业法术
    .target Grendin Swiftaxe
step << Shaman
    .goto 48,36.596,48.341
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦希尔德·暗爪|r交谈
    .trainer >>训练你的职业法术
    .target Grenhild Darktalon
step << Warlock
    .goto 48,35.879,46.199
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔宾·暗影齿轮|r交谈
    .trainer >>训练你的职业法术
    .target Solbin Shadowcog
step << Priest
    .goto 48,36.108,45.893
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师贝尔拉|r交谈
    .trainer >>训练你的职业法术
    .target Priestess Baerla
step
    .goto 48,37.303,46.517
    >>点击|cRXP_PICK_通缉：范高雷中尉|r海报
    .accept 13648 >>接任务: |cRXP_WARN_通缉：黑铁间谍|r
step
    .goto 48,35.960,44.028
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达克·枪火|r交谈
    .target Dakk Blunderblast
    .accept 25118 >>接任务: |cRXP_WARN_寻找潜伏者|r
step
    #completewith SilverStreamMine
    >>击杀 |cRXP_ENEMY_森林潜伏者|r
    .complete 25118,1 --|8/8 Forest Lurker slain
    .mob Forest Lurker
step
    #completewith SilverStreamMine
    >>击杀|cRXP_ENEMY_黑熊|r. 击败它们后搜刮其|cRXP_LOOT_Rump|r
    .complete 26860,1 --|8/8 Bear Rump
    .mob Black Bear
step
    #loop
    .goto 48,26.258,42.477,30,0
    .goto 48,26.888,50.154,30,0
    .goto 48,26.258,42.477,0
    .goto 48,26.888,50.154,0
    >>击杀|cRXP_ENEMY_藓皮斥候|r和|cRXP_ENEMY_藓皮猛击者|r, 搜刮他们的|cRXP_LOOT_耳朵|r
    .complete 26842,1 --|12/12 Mosshide Ear
    .mob Mosshide Basher
    .mob Mosshide Scout
step
    .goto 48,25.444,17.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 13636 >>交任务: |cRXP_FRIENDLY_雷矛的命令|r
    .accept 26843 >>接任务: |cRXP_WARN_小小聪明指挥官|r
    .target Mountaineer Stormpike
step
    .goto 48,26.111,31.575
    >>击杀|cRXP_ENEMY_“指挥官”纳兹利姆|r
    .complete 26843,1 --|1/1 "Commander" Nazrim slain
    .mob "Commander" Nazrim
step
    .goto 48,25.444,17.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .turnin 26843 >>交任务: |cRXP_FRIENDLY_小小聪明指挥官|r
    .accept 26844 >>接任务: |cRXP_WARN_更多的狗头人|r
    .target Mountaineer Stormpike
step
    .goto 48,31.485,13.582,30,0
    .goto 48,35.425,16.773,30,0
    .goto 48,38.607,15.477,30,0
    .goto 48,38.760,13.619,0
    >>击杀|cRXP_ENEMY_坑道鼠勘探员|r和|cRXP_ENEMY_坑道鼠征粮官|r
    .complete 26844,1 --|5/5 Tunnel Rat Surveyor slain
    .mob +Tunnel Rat Surveyor
    .complete 26844,2 --|5/5 Tunnel Rat Forager slain
    .mob +Tunnel Rat Forager
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r和|cRXP_FRIENDLY_斥候多尔莉|r交谈
    .turnin 26844 >>交任务: |cRXP_FRIENDLY_更多的狗头人|r
    .accept 26845 >>接任务: |cRXP_WARN_这儿谁做主？|r
    .accept 26863 >>接任务: |cRXP_LOOT_肮脏的爪子|r
    .goto 48,25.444,17.963
    .target +Mountaineer Stormpike
    .accept 26846 >>接任务: |cRXP_WARN_肮脏的把戏|r
    .goto 48,25.398,17.793
    .target +Scout Dorli
step
    #label SilverStreamMine
    #completewith ForemanSharpsneer
    .goto 48,35.49,19.13,15 >>进入银溪矿井
step
    #sticky
    #label koboldmine1
    #loop
    .goto 48,35.623,20.181,20,0
    .goto 48,36.222,24.255,20,0
    .goto 48,34.854,27.180,20,0
    .goto 48,34.752,26.885,20,0
    .goto 48,35.214,20.966,0
    >>击杀|cRXP_ENEMY_坑道鼠地卜师|r
    >>打开|cRXP_PICK_矿工联盟的储物箱|r. 搜刮其中的|cRXP_LOOT_矿工联盟装备|r
    .complete 26846,1 --|5/5 Tunnel Rat Geomancer slain
    .mob +Tunnel Rat Geomancer
    .complete 26863,1 --|6/6 Miners' Gear
step
    #label ForemanSharpsneer
    .goto 48,34.752,26.885
    >>|cRXP_WARN_前往银溪矿井后方|r
    >>击杀|cRXP_ENEMY_工头山普斯尼尔|r. 击败后搜刮他的|cRXP_LOOT_头颅|r
    .complete 26845,1 --|1/1 Foreman Sharpsneer's Head
    .mob Foreman Sharpsneer
step
    #requires koboldmine1
    #completewith next
    .goto 48,35.49,19.13,15 >>离开银溪矿井
step
    #completewith TheBearer
    >>击杀 |cRXP_ENEMY_森林潜伏者|r
    .complete 25118,1 --|8/8 Forest Lurker slain
    .mob Forest Lurker
step
    #completewith TheBearer
    >>击杀|cRXP_ENEMY_黑熊|r. 击败它们后搜刮其|cRXP_LOOT_Rump|r
    .complete 26860,1 --|8/8 Bear Rump
    .mob Black Bear
step
    #requires koboldmine1
    #label TheBearer
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r和|cRXP_FRIENDLY_斥候多尔莉|r交谈
    .turnin 26845 >>交任务: |cRXP_FRIENDLY_这儿谁做主？|r
    .accept 26864 >>接任务: |cRXP_WARN_捎上豺狼人的消息|r
    .turnin 26863 >>交任务: |cRXP_FRIENDLY_肮脏的爪子|r
    .target +Mountaineer Stormpike
    .goto 48,25.444,17.963
    .turnin 26846 >>交任务: |cRXP_FRIENDLY_肮脏的把戏|r
    .goto 48,25.398,17.793
    .target +Scout Dorli
step
    #completewith next
    >>击杀 |cRXP_ENEMY_森林潜伏者|r
    .complete 25118,1 --|8/8 Forest Lurker slain
    .mob Forest Lurker
step
    #loop
    .goto 48,27.649,21.203,40,0
    .goto 48,33.193,31.069,40,0
    .goto 48,35.295,39.016,40,0
    .goto 48,27.649,21.203,0
    .goto 48,33.193,31.069,0
    .goto 48,35.295,39.016,0
    >>击杀|cRXP_ENEMY_黑熊|r. 击败它们后搜刮其|cRXP_LOOT_Rump|r
    .complete 26860,1 --|8/8 Bear Rump
    .mob Black Bear
step
    #loop
    .goto 48,33.55,37.43,60,0
    .goto 48,38.94,30.41,60,0
    .goto 48,35.19,27.68,60,0
    .goto 48,27.64,21.20,70,0
    >>击杀 |cRXP_ENEMY_森林潜伏者|r
    .complete 25118,1 --|8/8 Forest Lurker slain
    .mob Forest Lurker
step
    .isOnQuest 26860,25118
    .hs >>传送至瑟尔塞玛
    .cooldown item,6948,>2,1
step
    .goto 48,35.969,44.330
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达克·枪火|r交谈
    .turnin 25118 >>交任务: |cRXP_FRIENDLY_寻找潜伏者|r
    .target Dakk Blunderblast
step
    .goto 48,35.017,46.663
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .turnin 26842 >>交任务: |cRXP_FRIENDLY_凭空出现|r
    .turnin 26864 >>交任务: |cRXP_FRIENDLY_捎上豺狼人的消息|r
    .accept 26927 >>接任务: |cRXP_WARN_突然，鱼人来了！|r
    .target Mountaineer Kadrell
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯娜莉·桶杯|r和|cRXP_FRIENDLY_维德拉·壁炉|r交谈
    .turnin 26927 >>交任务: |cRXP_FRIENDLY_突然，鱼人来了！|r
    .accept 26928 >>接任务: |cRXP_WARN_闻起来像是个计划|r
    .accept 26929 >>接任务: |cRXP_WARN_一群鳄鱼|r
    .target +Cannary Caskshot
    .goto 48,34.789,49.122
    .turnin 26860 >>交任务: |cRXP_FRIENDLY_塞尔萨玛血肠|r
    .target +Vidra Hearthstove
    .goto 48,34.827,49.285
step
    #optional
    .maxlevel 20,endOfTheGuide
step << Paladin
    .goto 48,35.374,48.810
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔多克·石信|r谈话
    .trainer >>训练你的职业法术
    .target Faldoc Stonefaith
step << Rogue
    .goto 48,34.935,48.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔达·铜刃|r交谈
    .trainer >>训练你的职业法术
    .target Galda Bronzeblade
step << Mage
    .goto 48,35.012,48.445
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_绿袍甘道尔|r交谈
    .trainer >>训练你的职业法术
    .target Gindle the Green
step << Hunter
    .goto 48,34.553,48.117
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔达·野性之心|r交谈
    .trainer >>训练你的职业法术
    .target Belda Wildheart
step << Warrior
    .goto 48,33.951,46.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦丁·迅斧|r交谈
    .trainer >>训练你的职业法术
    .target Grendin Swiftaxe
step
    .goto 48,35.079,46.663
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .target Mountaineer Kadrell
    .accept 26932 >>接任务: |cRXP_WARN_秃鹫滚开|r
step << Shaman
    .goto 48,36.596,48.341
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦希尔德·暗爪|r交谈
    .trainer >>训练你的职业法术
    .target Grenhild Darktalon
step << Warlock
    .goto 48,35.879,46.199
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔宾·暗影齿轮|r交谈
    .trainer >>训练你的职业法术
    .target Solbin Shadowcog
step << Priest
    .goto 48,36.108,45.893
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师贝尔拉|r交谈
    .trainer >>训练你的职业法术
    .target Priestess Baerla
step
    .goto 48,40.642,58.310,15,0
    .goto 48,39.670,62.104,15,0
    .goto 48,36.796,61.173
    >>沿着箭头前往格里兹尔爪山脊的顶端
    >>击杀 |cRXP_ENEMY_葛瑞克·豪饮|r
    .complete 13648,1 --|1/1 Gorick Guzzledraught slain
    .mob Gorick Guzzledraught
step
    .goto 48,36.752,61.108
    >>点击洞穴内的|cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13656>>接受探险者协会的文件(1/6)
step
    #completewith next
    >>击杀|cRXP_ENEMY_洛克鹫|r
    >>|cRXP_WARN_一些|cRXP_ENEMY_洛克鹫|r可以在空中飞行|r
    .complete 26932,1 --|8/8 Loch Buzzard slain
    .mob Loch Buzzard
step
    #loop
    .goto 48,50.790,63.748,60,0
    .goto 48,55.580,56.273,60,0
    .goto 48,59.933,52.441,60,0
    >>击杀|cRXP_ENEMY_洛克鳄|r. 击败它们后获取其掉落的|cRXP_LOOT_完整的鳄鱼颌骨|r
    .complete 26929,1 --|6/6 Intact Crocolisk Jaw
    .mob Loch Crocolisk
step
    #loop
    .goto 48,50.790,63.748,60,0
    .goto 48,55.580,56.273,60,0
    .goto 48,59.933,52.441,60,0
    >>击杀|cRXP_ENEMY_洛克鹫|r
    >>|cRXP_WARN_一些|cRXP_ENEMY_洛克鹫|r可以在空中飞行|r
    .complete 26932,1 --|8/8 Loch Buzzard slain
    .mob Loch Buzzard
step
    #completewith next
    >>击杀|cRXP_ENEMY_蓝鳃泥潭行者|r 和|cRXP_ENEMY_蓝鳃游荡者|r . 击败后搜刮它们的|cRXP_LOOT_嗅觉腺|r
    .complete 26928,1 --|7/7 Murloc Scent Gland
    .mob Bluegill Mudskipper
    .mob Bluegill Wanderer
step
    .goto 48,41.379,38.967
    >>点击桥下的 |cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13655 >>接任务: |cRXP_WARN_探险者协会的文件（2/6）|r
step
    #loop
    .goto 48,42.957,39.201,60,0
    .goto 48,46.231,51.109,60,0
    >>击杀|cRXP_ENEMY_蓝鳃泥潭行者|r 和|cRXP_ENEMY_蓝鳃游荡者|r . 击败后搜刮它们的|cRXP_LOOT_嗅觉腺|r
    .complete 26928,1 --|7/7 Murloc Scent Gland
    .mob Bluegill Mudskipper
    .mob Bluegill Wanderer
step
    .goto 48,34.613,44.539
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_镇长埃罗恩·钝鼻|r交谈
    .target Magistrate Bluntnose
    .turnin 13648 >>交任务: |cRXP_FRIENDLY_通缉：黑铁间谍|r
step
    .goto 48,35.079,46.663
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    .target Mountaineer Kadrell
    .turnin 26932 >>交任务: |cRXP_FRIENDLY_秃鹫滚开|r
step
    .goto 48,34.789,49.122
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯娜莉·桶杯|r交谈
    .turnin 26929 >>交任务: |cRXP_FRIENDLY_一群鳄鱼|r
    .turnin 26928 >>交任务: |cRXP_FRIENDLY_闻起来像是个计划|r
    .accept 26868 >>接任务: |cRXP_WARN_恶心轴心|r
    .target Cannary Caskshot
step
    .goto 48,37.200,46.363
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托瑞恩·方颔|r 对话
    .turnin 13656 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（1/6）|r
    .turnin 13655 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（2/6）|r
    .target Torren Squarejaw
step
    #optional
    .maxlevel 20,endOfTheGuide
step
    .isOnQuest 26868
    .use 60681 >>|cRXP_WARN_开启|r |T133639:0|t[卡纳瑞的宝箱] |cRXP_WARN_获得|r |T237425:0|t[|cRXP_LOOT_精巧的植物伪装包|r] |cRXP_WARN_和|r |T134839:0|t[|cRXP_LOOT_超浓鱼人信息素|r]
    .collect 60502,1,26868,1 -- Clever Plant Disguise Kit (1)
    .collect 60503,1,26868,1 -- Potent Murloc Pheromones (1)
step
    .isOnQuest 26868
    .goto 48,50.585,56.048,85 >>|cRXP_WARN_前往|r|cRXP_ENEMY_藓皮使者处|r
step
    .isOnQuest 26868
    .cast 82788 >>|cRXP_WARN_使用|r|T237425:0|t[|cRXP_LOOT_精巧的植物伪装包|r]|cRXP_WARN_来伪装自己|r
    .use 60502
step
    .goto 48,50.585,56.048
    >>|cRXP_WARN_使用|r|T134839:0|t[|cRXP_LOOT_超浓鱼人信息素|r] |cRXP_WARN_对准|r|cRXP_ENEMY_藓皮使者的|r|r
    >>|cRXP_WARN_这个技能的射程为15码|r
    .complete 26868,1 --|1/1 Mosshide Tagged
    .mob Mosshide Representative
    .use 60503
step
    .goto 48,34.789,49.122
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯娜莉·桶杯|r交谈
    .turnin 26868 >>交任务: |cRXP_FRIENDLY_恶心轴心|r
    .target Cannary Caskshot
step
    .goto 48,36.992,47.016
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·角盔|r交谈
    .accept 13639 >>接任务: |cRXP_WARN_补给挖掘场|r
    .target Jern Hornhelm
step
    .goto 48,56.353,65.959
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_胡达尔|r交谈
    .target Huldar
    .turnin 13639 >>交任务: |cRXP_FRIENDLY_补给挖掘场|r
    .accept 309 >>接任务: |cRXP_WARN_护送货物|r
step
    .goto 48,56.353,65.959
    >>|cRXP_WARN_留在商队并保护|cRXP_FRIENDLY_胡达尔|r免受|cRXP_ENEMY_黑铁伏击者|r和|cRXP_ENEMY_赛恩|r的袭击|r
    .complete 309,1 -- Protect the Ironband Caravan (1)
    .mob Dark Iron Ambusher
    .mob Saean
    .target Huldar
step
    .goto 48,58.183,68.975,20,0
    .goto 48,59.722,72.385,20,0
    .goto 48,61.701,73.181
    >>点击地面上的|cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13657 >>接任务: |cRXP_WARN_探险者协会的文件（3/6）|r
step
    .goto 48,64.896,66.659
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格玛尔·落斧|r交谈
    .target Magmar Fellhew
    .accept 26961 >>接任务: |cRXP_WARN_收集石像|r
step
    .goto 48,65.336,65.979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈
    .target Prospector Ironband
    .turnin 309 >>交任务: |cRXP_FRIENDLY_护送货物|r
    .accept 13650 >>接任务: |cRXP_WARN_把你的脏手拿开！|r
step
    #completewith Artifacts
    >>击杀|cRXP_ENEMY_碎石怪掘地工|r 和|cRXP_ENEMY_碎石怪地卜师|r . 掠夺他们以获得|cRXP_LOOT_小石像|r
    .complete 26961,1 --|8/8 Carved Stone Idol
    .mob Stonesplinter Digger
    .mob Stonesplinter Geomancer
step
    .goto 48,67.610,68.736,20,0
    .goto 48,69.218,66.357,8,0
    .goto 48,68.112,66.143
    >>点击桶旁边的|cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13658 >>接任务: |cRXP_WARN_探险者协会的文件（4/6）|r
step
    #label Artifacts
    >>|cRXP_WARN_探索挖掘现场的文物|r
    .complete 13650,1 --|1/1 Artifact of the Broken Tablet Inspected
    .goto 48,70.696,67.524
    .complete 13650,3 --|1/1 Artifact of the Overdressed Woman Inspected
    .goto 48,72.759,65.494
    .complete 13650,2 --|1/1 Artifact of the Upturned Giant Inspected
    .goto 48,70.111,59.987
step
    #loop
    .goto 48,69.037,59.360,40,0
    .goto 48,70.633,67.770,40,0
    >>击杀|cRXP_ENEMY_碎石怪掘地工|r 和|cRXP_ENEMY_碎石怪地卜师|r . 掠夺他们以获得|cRXP_LOOT_小石像|r
    .complete 26961,1 --|8/8 Carved Stone Idol
    .mob Stonesplinter Digger
    .mob Stonesplinter Geomancer
step
    .goto 48,65.336,65.979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈
    .target Prospector Ironband
    .turnin 13650 >>交任务: |cRXP_FRIENDLY_把你的脏手拿开！|r
step
    .goto 48,64.896,66.659
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格玛尔·落斧|r交谈
    .target Magmar Fellhew
    .turnin 26961 >>交任务: |cRXP_FRIENDLY_收集石像|r
    .accept 13647 >>接任务: |cRXP_WARN_参加狩猎|r
step
    #completewith next
    .goto 48,69.478,51.742,70,0
    .goto 48,83.597,60.675,40 >>前往远行者守望哨
    .subzoneskip 147
step
    .goto 48,82.789,63.459
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安全保障官皮普希|r交谈
    .target Safety Warden Pipsy
    .accept 27025 >>接任务: |cRXP_WARN_处理刺蓟|r
step
    .goto 48,83.428,65.309
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与年轻的达瑞尔交谈|cRXP_FRIENDLY_年轻的达瑞尔|r
    .target Daryl the Youngling
    .accept 27016 >>接任务: |cRXP_WARN_猎野猪的乐趣|r
step
    .goto 48,81.944,64.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维林·疾风|r交谈
    .target Vyrin Swiftwind
    .home >>将你的[炉石]设置为远行者小屋
step
    .goto 48,81.647,64.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宾格斯·雷管|r谈话
    .target Bingles Blastenheimer
    .accept 27031 >>接任务: |cRXP_WARN_飞行呆子|r
step
    .goto 48,81.803,61.735
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马雷克·铁心|r交谈
    .target Marek Ironheart
    .turnin 13647 >>交任务: |cRXP_FRIENDLY_参加狩猎|r
    .accept 27028 >>接任务: |cRXP_WARN_捕猎黄蜂|r
    .accept 27030 >>接任务: |cRXP_WARN_毛茸茸的狐狸尾巴|r
step
    .goto 48,78.350,69.552,40,0
    .goto 48,77.581,75.929,40,0
    .goto 48,74.254,71.828,40,0
    .goto 48,78.350,69.552,0
    .goto 48,77.581,75.929,0
    .goto 48,74.254,71.828,0
    >>击杀|r金色雄鹰|cRXP_ENEMY_Golden Eagles|r. 击败它们后搜刮|r羽毛|cRXP_LOOT_Feathers|r
    .complete 27031,1 --|3/3 Pristine Flight Feather
    .mob Golden Eagle
step
    #completewith doc6
    >>拾取地面上的|cRXP_LOOT_刺蓟之种|r
    .complete 27025,1 --|6/6 Stabthistle Seed
step
    #completewith doc6
    >>击杀|cRXP_ENEMY_Hill Foxes|r. 搜刮它们的|cRXP_LOOT_Tails|r
    .complete 27030,1 --|7/7 Fluffy Fox Tail
    .mob Hill Fox
step
    #label doc6
    .goto 48,73.188,35.870
    >>点击地面上的|cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13659 >>接任务: |cRXP_WARN_探险者协会的文件（6/6）|r
step
    #completewith next
    >>拾取地面上的|cRXP_LOOT_刺蓟之种|r
    .complete 27025,1 --|6/6 Stabthistle Seed
step
    #loop
    .goto 48,72.311,40.993,0
    .goto 48,75.992,46.409,40,0
    .goto 48,66.113,37.946,40,0
    .goto 48,72.311,40.993,40,0
    .goto 48,76.495,36.873,40,0
    >>击杀|cRXP_ENEMY_Hill Foxes|r. 搜刮它们的|cRXP_LOOT_Tails|r
    .complete 27030,1 --|7/7 Fluffy Fox Tail
    .mob Hill Fox
step
    #loop
    .goto 48,72.311,40.993,0
    .goto 48,75.992,46.409,40,0
    .goto 48,66.113,37.946,40,0
    .goto 48,72.311,40.993,40,0
    .goto 48,76.495,36.873,40,0
    >>拾取地面上的|cRXP_LOOT_刺蓟之种|r
    .complete 27025,1 --|6/6 Stabthistle Seed
step
    #completewith doc5
    >>击杀|cRXP_ENEMY_泥腹野猪|r
    .complete 27016,1 --|10/10 Mudbelly Boar slain
    .mob Mudbelly Boar
step
    #completewith doc5
    >>击杀|cRXP_ENEMY_沼泽黄蜂|r. 击杀后搜刮其|cRXP_LOOT_翅膀|r
    .complete 27028,1 --|6/6 Glassy Hornet Wing
    .mob Marsh Hornet
    .mob Marsh Wasp
step
    #label doc5
    .goto 48,53.707,38.109
    >>点击地面上的|cRXP_PICK_被盗的守夜人基佛文件|r
    .accept 13660 >>接任务: |cRXP_WARN_探险者协会的文件（5/6）|r
step
    #completewith next
    >>击杀|cRXP_ENEMY_泥腹野猪|r
    .complete 27016,1 --|10/10 Mudbelly Boar slain
    .mob Mudbelly Boar
step
    #loop
    .goto 48,52.298,39.499,40,0
    .goto 48,56.479,31.679,40,0
    .goto 48,58.179,44.704,40,0
    .goto 48,52.298,39.499,0
    .goto 48,56.479,31.679,0
    .goto 48,58.179,44.704,0
    >>击杀|cRXP_ENEMY_沼泽黄蜂|r. 击杀后搜刮其|cRXP_LOOT_翅膀|r
    .complete 27028,1 --|6/6 Glassy Hornet Wing
    .mob Marsh Hornet
    .mob Marsh Wasp
step
    #loop
    .goto 48,52.298,39.499,40,0
    .goto 48,56.479,31.679,40,0
    .goto 48,58.179,44.704,40,0
    .goto 48,52.298,39.499,0
    .goto 48,56.479,31.679,0
    .goto 48,58.179,44.704,0
    >>击杀|cRXP_ENEMY_泥腹野猪|r
    .complete 27016,1 --|10/10 Mudbelly Boar slain
    .mob Mudbelly Boar
step
    .isOnQuest 27016,27028,13660,27025,27030,27031
    .hs >>传送至远行者小屋
    .cooldown item,6948,>2,1
step
#requires doc5
    .goto 48,82.789,63.459
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安全保障官皮普希|r交谈
    .target Safety Warden Pipsy
    .turnin 27025 >>交任务: |cRXP_FRIENDLY_处理刺蓟|r
    .accept 27026 >>接任务: |cRXP_WARN_戒备：山猫|r
step
    .goto 48,83.462,65.333
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与年轻的达瑞尔交谈|cRXP_FRIENDLY_年轻的达瑞尔|r
    .target Daryl the Youngling
    .turnin 27016 >>交任务: |cRXP_FRIENDLY_猎野猪的乐趣|r
step
    .goto 48,81.756,61.661
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马雷克·铁心|r交谈
    .target Marek Ironheart
    .turnin 27028 >>交任务: |cRXP_FRIENDLY_捕猎黄蜂|r
    .turnin 27030 >>交任务: |cRXP_FRIENDLY_毛茸茸的狐狸尾巴|r
step
    .goto 48,81.910,64.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维林·疾风|r交谈
    .target Vyrin Swiftwind
    .accept 27036 >>接任务: |cRXP_WARN_维林的报复|r
step
    .goto 48,81.647,64.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宾格斯·雷管|r谈话
    .target Bingles Blastenheimer
    .turnin 27031 >>交任务: |cRXP_FRIENDLY_飞行呆子|r
    .accept 27032 >>接任务: |cRXP_WARN_重要的鸟|r
step
    #optional
    .maxlevel 20,endOfTheGuide
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猫|r
    .complete 27026,1
    .mob Bobcat
step
    .goto 48,72.590,72.017,70,0
    .goto 48,71.603,77.167,20 >>前往铁翼洞穴
    .subzoneskip 5391
    .isOnQuest 27032
step
    .isOnQuest 27032
    #completewith next
    .goto 48,78.594,76.215,20 >>|cRXP_WARN_清除通往洞穴深处的道路|r
step
    .goto 48,78.594,76.215
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_生锈的天行者|r交谈
    .target Rusted Skystrider
    .turnin 27032 >>交任务: |cRXP_FRIENDLY_重要的鸟|r
    .accept 27033 >>接任务: |cRXP_WARN_天行者之心|r
step
    #completewith next
    .goto 48,71.603,77.167,20 >>离开铁翼洞窟
    .subzoneskip 5391,1
    .isOnQuest 27033
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猫|r
    .complete 27026,1
    .mob Bobcat
step
    .goto 48,80.158,51.943
    >>击杀|cRXP_ENEMY_Ol' Sooty|r. 击败他后拾取他的|cRXP_LOOT_Head|r
    .complete 27036,1 --|1/1 Ol' Sooty's Head
    .mob Ol' Sooty
step
    #loop
    .goto 48,76.773,58.389,40,0
    .goto 48,78.786,69.272,40,0
    .goto 48,72.778,71.667,40,0
    .goto 48,76.773,58.389,0
    .goto 48,78.786,69.272,0
    .goto 48,72.778,71.667,0
    >>击杀|cRXP_ENEMY_山猫|r
    .complete 27026,1
    .mob Bobcat
step
    .isOnQuest 27026,27036
    .hs >>传送至远行者小屋
    .cooldown item,6948,>2,1
step
    .goto 48,82.789,63.459
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安全保障官皮普希|r交谈
    .target Safety Warden Pipsy
    .turnin 27026 >>交任务: |cRXP_FRIENDLY_戒备：山猫|r
step
    .goto 48,83.435,65.246
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与年轻的达瑞尔交谈|cRXP_FRIENDLY_年轻的达瑞尔|r
    .target Daryl the Youngling
    .turnin 27036 >>交任务: |cRXP_FRIENDLY_维林的报复|r
    .accept 27037 >>接任务: |cRXP_WARN_维林的报复|r
step
    .goto 48,81.910,64.618
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维林·疾风|r交谈
    .target Vyrin Swiftwind
    .turnin 27037 >>交任务: |cRXP_FRIENDLY_维林的报复|r
step
#questguide
    .goto 48,81.647,64.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宾格斯·雷管|r谈话
    .target Bingles Blastenheimer
    .turnin 27033 >>交任务: |cRXP_FRIENDLY_天行者之心|r
    .accept 27034 >>接任务: |cRXP_WARN_他那个年纪|r
step
    .goto 48,81.647,64.750
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_宾格斯·雷管|r谈话
    .target Bingles Blastenheimer
    .turnin 27033 >>交任务: |cRXP_FRIENDLY_天行者之心|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾瑞文·格蕾尔|r交谈
    .goto 48,81.877,64.071
    .fly Thelsamar >>飞往塞尔萨玛
    .target Eeryven Grayer
step
    #label end
    .goto 48,37.200,46.363
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托瑞恩·方颔|r 对话
    .target Torren Squarejaw
    .turnin 13657 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（3/6）|r
    .turnin 13658 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（4/6）|r
    .turnin 13660 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（5/6）|r
    .turnin 13659 >>交任务: |cRXP_FRIENDLY_探险者协会的文件（6/6）|r
    .accept 13661 >>接任务: |cRXP_WARN_衷心的感谢|r
    .turnin 13661 >>交任务: |cRXP_FRIENDLY_衷心的感谢|r
step
    #optional
    #label endOfTheGuide
step << Paladin
    .goto 48,35.374,48.810
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔多克·石信|r谈话
    .trainer >>训练你的职业法术
    .target Faldoc Stonefaith
step << Rogue
    .goto 48,34.935,48.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格尔达·铜刃|r交谈
    .trainer >>训练你的职业法术
    .target Galda Bronzeblade
step << Mage
    .goto 48,35.012,48.445
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_绿袍甘道尔|r交谈
    .trainer >>训练你的职业法术
    .target Gindle the Green
step << Hunter
    .goto 48,34.553,48.117
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔达·野性之心|r交谈
    .trainer >>训练你的职业法术
    .target Belda Wildheart
step << Warrior
    .goto 48,33.951,46.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦丁·迅斧|r交谈
    .trainer >>训练你的职业法术
    .target Grendin Swiftaxe
step << Shaman
    .goto 48,36.596,48.341
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦希尔德·暗爪|r交谈
    .trainer >>训练你的职业法术
    .target Grenhild Darktalon
step << Warlock
    .goto 48,35.879,46.199
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔宾·暗影齿轮|r交谈
    .trainer >>训练你的职业法术
    .target Solbin Shadowcog
step << Priest
    .goto 48,36.108,45.893
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师贝尔拉|r交谈
    .trainer >>训练你的职业法术
    .target Priestess Baerla
step
#questguide
    .goto 48,33.938,50.932
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Farstrider Lodge >>飞往远行者营地
    .target Thorgrum Borrelson
step
#questguide
    .goto 48,58.585,29.077
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安多·雷管|r交谈
    .target Ando Blastenheimer
    .turnin 27034 >>交任务: |cRXP_FRIENDLY_他那个年纪|r
    .accept 27035 >>接任务: |cRXP_WARN_站出来|r
step
#questguide
    .goto 48,50.532,23.802
    >>击杀|cRXP_ENEMY_暮光塑地者|r
    .complete 27035,1 --|1/1 Twilight Landshaper destroyed
    .mob Twilight Landshaper
step
#questguide
    .goto 48,58.551,29.012
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安多·雷管|r交谈
    .target Ando Blastenheimer
    .turnin 27035 >>交任务: |cRXP_FRIENDLY_站出来|r
    .accept 27074 >>接任务: |cRXP_WARN_对抗暮光之锤|r
step
#questguide
    .goto 48,64.085,26.707
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿什兰·暗石|r交谈
    .target Ashlan Stonesmirk
    .turnin 27074 >>交任务: |cRXP_FRIENDLY_对抗暮光之锤|r
    .accept 27075 >>接任务: |cRXP_WARN_古加尔的奴仆|r
    .accept 27077 >>接任务: |cRXP_WARN_攫住混沌|r

step
#questguide
#loop
    .goto 48,67.559,22.273,40,0
    .goto 48,69.705,25.944,40,0
    .goto 48,74.141,20.405,40,0
    .goto 48,71.035,21.294,0
    >>击杀|cRXP_ENEMY_Mo'grosh 食人魔|r
    >>拾取散落在地面上的黑色小尖刺
    .complete 27075,1 --|7/7 Mo'grosh Ogre slain
    .complete 27077,1 --|10/10 Nascent Elementium Spike
    .mob Mo'grosh Earthbender
    .mob Mo'grosh Darkmauler


step
#questguide
    .goto 48,64.049,26.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿什兰·暗石|r交谈
    .target Ashlan Stonesmirk
    .turnin 27075 >>交任务: |cRXP_FRIENDLY_古加尔的奴仆|r
    .turnin 27077 >>交任务: |cRXP_FRIENDLY_攫住混沌|r
    .accept 27078 >>接任务: |cRXP_WARN_戈克雷什|r
step
#questguide
    .goto 48,75.212,19.594,20,0
    .goto 48,79.665,14.870
    >>前往洞穴东北方向的后方
    >>击杀|cRXP_ENEMY_戈克雷什|r
    .complete 27078,1 --|1/1 Gor'kresh slain
    .mob Gor'kresh

step
#questguide
    .goto 48,64.145,26.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿什兰·暗石|r交谈
    .target Ashlan Stonesmirk
    .turnin 27078 >>交任务: |cRXP_FRIENDLY_戈克雷什|r
    .accept 27115 >>接任务: |cRXP_WARN_安多的召唤|r
step
#questguide
    .goto 48,58.491,29.051
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安多·雷管|r交谈
    .target Ando Blastenheimer
    .turnin 27115 >>交任务: |cRXP_FRIENDLY_安多的召唤|r
    .accept 27116 >>接任务: |cRXP_WARN_洛克莫丹的风|r
step
#questguide
    .goto 48,25.444,17.963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈
    .target Mountaineer Stormpike
    .turnin 27116 >>交任务: |cRXP_FRIENDLY_洛克莫丹的风|r
    .accept 26137 >>接任务: |cRXP_WARN_小子们情况如何|r
step
#questguide
    .goto 48,25.315,1.591,15,0
    .goto 56,54.873,83.458,15,0
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .isOnQuest 26137
step
#questguide
    .goto 56,49.973,79.288
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人拉伦|r交谈
    .target Mountaineer Rharen
    .turnin 26137 >>交任务: |cRXP_FRIENDLY_小子们情况如何|r
    .accept 25395 >>接任务: |cRXP_WARN_被偷的麦酒|r
    .accept 25211 >>接任务: |cRXP_WARN_大扫除|r

--TODO: follow the path to the first quest hub
--fly to gol'bolar quarry (dwarf) or kharanos (gnome)
--buy mount, then fly to SW and do duskwood
]])
