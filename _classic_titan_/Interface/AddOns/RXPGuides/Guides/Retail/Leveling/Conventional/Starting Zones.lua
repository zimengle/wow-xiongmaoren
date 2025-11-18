-- =================================
-- =======  SEPERATORS =============
-- =================================

--LEVEL 1-10
RXPGuides.RegisterGuide([[
#retail
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name 1a
#displayname |cFFFCDC00等级 1-10|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#disabled


]])

-- =================================
-- =======  NEUTRAL ZONES ==========
-- =================================

--Beginners Exile's Reach
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#groupweight 1000
#subgroup |cFFFCDC00(1-80)|r默认值
#subweight 1000
#name a) 流放者之角
#displayname |cFF00CCFF1|r - 流放者离岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde


<<!Dracthyr !Pandaren !DemonHunter !DK !KulTiran !EarthenDwarf !DarkIronDwarf !LightforgedDraenei !Mechagnome !VoidElf !NightBorne !HighmountainTauren !Vulpera !MagharOrc !ZandalariTroll


step << Alliance/Horde
	#completewith next
    +欢迎阅读《RestedXP 流亡者之角》攻略！本指南既适合新手, 也是最快捷的入门指引
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你面前的|cRXP_FRIENDLY_Garrick|r交谈
	.accept 56775 >>接任务: |cRXP_WARN_热身|r
	.target Captain Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你面前的|cRXP_FRIENDLY_Breka|r交谈
	.accept 59926 >>接任务: |cRXP_WARN_热身|r
	.target Warlord Breka Grimaxe
step
    >>使用技能栏中的法术击杀一个|cRXP_ENEMY_作战假人|r(最好选择离你最近的那个)
    .complete 56775,1 << Alliance
    .complete 59926,1 << Horde
    .mob Combat Dummy
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
	.turnin 56775 >>交任务: |cRXP_FRIENDLY_热身|r
	.target Captain Garrick
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
	.turnin 59926 >>交任务: |cRXP_FRIENDLY_热身|r
	.target Warlord Breka Grimaxe
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cole|r交谈
	.accept 58209 >>接任务: |cRXP_WARN_坚守阵地|r
	.target Private Cole
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Throg|r交谈
	.accept 59927 >>接任务: |cRXP_WARN_坚守阵地|r
	.target Grunt Throg
step << Alliance
    >>击杀|cRXP_ENEMY_Cole|r
	.complete 58209,1 --1/1 Spar with Private Cole
	.mob Private Cole
step << Horde
	>>击杀|cRXP_ENEMY_Throg|r
	.complete 59927,1 --1/1 Spar with Grunt Throg
	.mob Grunt Throg
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cole|r交谈
    .turnin 58209 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
	.accept 58208 >>接任务: |cRXP_WARN_抵御冲击|r
	.timer 13,Brace for Impact RP
	.target Private Cole
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Throg|r交谈
    .turnin 59927 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
    .accept 59928 >>接任务: |cRXP_WARN_抵御冲击|r
	.timer 13,Brace for Impact RP
	.target Grunt Throg
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与船内的|r|cRXP_FRIENDLY_Garrick|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
	.turnin 58208 >>交任务: |cRXP_FRIENDLY_抵御冲击|r
	.target Captain Garrick
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 59928 >>交任务: |cRXP_FRIENDLY_抵御冲击|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,61.88,82.89
    >>|cRXP_WARN_如果您没有看到屏幕顶部中间的航点箭头, 请输入 /reload|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .accept 55122 >>接任务: |cRXP_WARN_鱼人狂欢|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|cRXP_WARN_如果您没有看到屏幕顶部中间的航点箭头, 请输入 /reload|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .accept 59929 >>接任务: |cRXP_WARN_鱼人狂欢|r
	.target Warlord Breka Grimaxe
step
    .goto 1409,61.23,80.35,20,0
    .goto 1409,59.84,80.37,20,0
    .goto 1409,60.02,81.97,20,0
    .goto 1409,61.75,79.36,20,0
    .goto 1409,61.12,77.68,20,0
    .goto 1409,61.23,80.35,20,0
    .goto 1409,59.84,80.37,20,0
    .goto 1409,60.02,81.97,20,0
    .goto 1409,61.75,79.36,20,0
    .goto 1409,61.12,77.68
    >>击杀|r|cRXP_ENEMY_鱼人长矛猎手|r和|r|cRXP_ENEMY_水域塑造者|r. 从他们身上搜刮出|r|cRXP_LOOT_急救包|r
    .complete 55122,1 << Alliance   --6/6 First Aid Kits recovered from defeated Murlocs
    .complete 59929,1 << Horde      --6/6 First Aid Kits recovered from defeated Murlocs
    .mob Murloc Spearhunter
    .mob Murloc Watershaper
step << Alliance
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 55122 >>交任务: |cRXP_FRIENDLY_鱼人狂欢|r
    .accept 54951 >>接任务: |cRXP_WARN_紧急治疗|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59929 >>交任务: |cRXP_FRIENDLY_鱼人狂欢|r
    .accept 59930 >>接任务: |cRXP_WARN_紧急治疗|r
	.target Warlord Breka Grimaxe
step
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    >>|cRXP_WARN_这将允许你按下按键绑定来使用任务物品或瞄准相关怪物|r
step << Alliance
	>>使用|T1387611:0|t[急救包]治疗你周围的地面上的|cRXP_FRIENDLY_Kee-La|r和|cRXP_FRIENDLY_Austin|r和|cRXP_FRIENDLY_Bjorn|r
    .complete 54951,2 --1/1 First Aid Kit used on Kee-La
    .goto 1409,61.73,83.48,-1
    .complete 54951,3 --1/1 First Aid Kit used on Austin Huxworth
    .goto 1409,61.37,82.60,-1
    .complete 54951,1 --1/1 First Aid Kit used on Bjorn Stouthands
    .goto 1409,61.56,82.24,-1
	.use 168410
    .target Kee-La
    .target Austin Huxworth
    .target Bjorn Stouthands
step << Horde
	>>使用|T1387611:0|t[急救包]治疗你周围的|cRXP_FRIENDLY_Bo|r和|cRXP_FRIENDLY_Mithdran|r和|cRXP_FRIENDLY_Lana|r
    .complete 59930,2 --1/1 First Aid Kit used on Bo
    .goto 1409,61.73,83.48,-1
    .complete 59930,3 --1/1 First Aid Kit used on Mithdran Dawntracker
    .goto 1409,61.37,82.60,-1
    .complete 59930,1 --1/1 First Aid Kit used on Lana Jordan
    .goto 1409,61.56,82.24,-1
	.use 168410
    .target Bo
    .target Mithdran Dawntracker
    .target Lana Jordan
step << Alliance
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 54951 >>交任务: |cRXP_FRIENDLY_紧急治疗|r
    .accept 54952 >>接任务: |cRXP_WARN_寻找失踪的考察队|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59930 >>交任务: |cRXP_FRIENDLY_紧急治疗|r
    .accept 59931 >>接任务: |cRXP_WARN_寻找失踪的考察队|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,58.36,74.47
    >>前往|cRXP_FRIENDLY_Alaria|r方向
    .complete 54952,1 --1/1 Travel north to find any expedition survivors
step << Horde
    .goto 1409,58.36,74.47
    >>前往|cRXP_FRIENDLY_Won'sa|r
    .complete 59931,1 --1/1 Travel north to find any expedition survivors
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alaria|r和|cRXP_FRIENDLY_Garrick|r交谈
    .turnin 54952 >>交任务: |cRXP_FRIENDLY_寻找失踪的考察队|r
    .goto 1409,58.36,74.47
    .accept 55174 >>接任务: |cRXP_WARN_烹调肉食|r
    .goto 1409,58.37,74.63
	.target Alaria
	.target Captain Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Won'sa|r和|cRXP_FRIENDLY_Breka|r交谈
    .turnin 59931 >>交任务: |cRXP_FRIENDLY_寻找失踪的考察队|r
    .goto 1409,58.36,74.47
    .accept 59932 >>接任务: |cRXP_WARN_烹调肉食|r
    .goto 1409,58.37,74.63
	.target Won'sa
	.target Warlord Breka Grimaxe
step << Rogue/Warrior/Monk/Paladin
    .goto 1409,56.31,74.62,30,0
    .goto 1409,59.58,72.91,30,0
    .goto 1409,58.05,70.22,30,0
    .goto 1409,56.31,74.62,30,0
    .goto 1409,59.58,72.91,30,0
    .goto 1409,58.05,70.22
    >>击杀|r |cRXP_ENEMY_Coastal Albatrosses|r和|cRXP_ENEMY_Coastal Goats|r和|r |cRXP_ENEMY_Prickly Porcupines|r. 从它们身上采集 [|cRXP_LOOT_Meat|r]
    .complete 55174,1 << Alliance --5/5 Raw Meat collected from wildlife
    .complete 59932,1 << Horde --5/5 Raw Meat collected from wildlife
	.mob Coastal Albatross
	.mob Coastal Goat
	.mob Pricky Porcupine
step << !Rogue !Warrior !Monk !Paladin
    .goto 1409,59.58,72.91,30,0
    .goto 1409,58.05,70.22,30,0
    .goto 1409,56.31,74.62,30,0
    .goto 1409,59.58,72.91,30,0
    .goto 1409,58.05,70.22
    >>击杀|r |cRXP_ENEMY_Coastal Albatrosses|r和|cRXP_ENEMY_Coastal Goats|r和|r |cRXP_ENEMY_Prickly Porcupines|r. 从它们身上采集 [|cRXP_LOOT_Meat|r]
    .complete 55174,1 << Alliance --5/5 Raw Meat collected from wildlife
    .complete 59932,1 << Horde --5/5 Raw Meat collected from wildlife
	.mob Coastal Albatross
	.mob Coastal Goat
	.mob Pricky Porcupine
step
    .goto 1409,58.33,74.58
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击地面上的|cRXP_PICK_Campfire|r
    .complete 55174,2 << Alliance --1/1 Cook the meat on the campfire
    .complete 59932,2 << Horde --1/1 Cook the meat on the campfire
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alaria|r和|cRXP_FRIENDLY_Garrick|r交谈 << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿尔莉亚|r交谈 << Hunter
    .turnin 55174 >>交任务: |cRXP_FRIENDLY_烹调肉食|r
    .accept 55173 >>接任务: |cRXP_WARN_向北而行|r << Hunter
    .goto 1409,58.36,74.47
    .accept 59339 >>接任务: |cRXP_WARN_强化战斗技巧|r << Monk
    .accept 59254 >>接任务: |cRXP_WARN_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.38,74.63
	.target Alaria
	.target Captain Garrick << !Hunter
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Won'sa|r和|cRXP_FRIENDLY_Breka|r交谈 << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Won'sa|r交谈 << Hunter
    .turnin 59932 >>交任务: |cRXP_FRIENDLY_烹调肉食|r
    .accept 59935 >>接任务: |cRXP_WARN_向北而行|r << Hunter
    .goto 1409,58.36,74.47
    .accept 59934 >>接任务: |cRXP_WARN_强化战斗技巧|r << Monk
    .accept 59933 >>接任务: |cRXP_WARN_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.38,74.63
	.target Won'sa
	.target Warlord Breka Grimaxe << !Hunter
step << Alliance !Hunter
    .goto 1409,57.60,72.95 << !Monk
    .goto 1409,58.87,73.55 << Monk
    >>跟随|cRXP_FRIENDLY_Garrick|r. 当|cRXP_ENEMY_Garrick|r变为敌对状态时, 攻击她
    >>施放 |T136207:0|t暗言术:痛. 在该减益效果消失前再施放3次 << Priest
    >>对 |cRXP_ENEMY_Garrick|r 施放 |T132337:0|t冲锋 3 次. 可使用 |T132316:0|t断筋 来减缓她的移动速度 << Warrior
    >>当 |cRXP_ENEMY_Garrick|r 提示你时, 对她施放 |T136096:0|t月火术  << Druid
    >>远程施放冰霜箭, 然后在近战范围内施放火焰冲击 -> 重复 << Mage
    >>在远距离施放 |T136048:0|t闪电箭, 然后施放 |T460956:0|t根源打击 4 次 -> 重复 << Shaman
    >>施放 |T135891:0|t十字军打击 3 次以积累 3 点神圣能量, 然后施放 |T236265:0|t正义之盾 -> 重复 << Paladin
    .complete 59339,2 << Monk --3/3 Blackout Kick used on Captain Garrick
    .complete 59339,1 << Monk --6/6 Tiger Palm used on Captain Garrick
    .complete 59254,1 << !Hunter !Monk --3/3 Abilities proven against Captain Garrick
	.mob Captain Garrick
step << Horde !Hunter
    .goto 1409,57.60,72.95 << !Monk
    .goto 1409,58.87,73.55 << Monk
    >>跟随|cRXP_FRIENDLY_Breka|r. 当|cRXP_ENEMY_Breka|r变为敌对时, 攻击她
    >>施放 |T136207:0|t暗言术:痛. 在该减益效果消失前再施放3次 << Priest
    >>对|cRXP_ENEMY_Breka|r施放 |T132337:0|t冲锋 3 次. 你可以使用 |T132316:0|t断筋 来减缓她的移动速度 << Warrior
    >>当|cRXP_ENEMY_Breka|r提示你时, 对她施放 |T136096:0|t月火术  << Druid
    >>远程施放冰霜箭, 然后在近战范围内施放火焰冲击 -> 重复 << Mage
    >>在远距离施放 |T136048:0|t闪电箭, 然后施放 |T460956:0|t根源打击 4 次 -> 重复 << Shaman
    >>施放 |T135891:0|t十字军打击 3 次以积累 3 点神圣能量, 然后施放 |T236265:0|t正义之盾 -> 重复 << Paladin
    .complete 59934,2 << Monk --3/3 Blackout Kick used on Warlord Grimaxe
    .complete 59934,1 << Monk --6/6 Tiger Palm used on Warlord Grimaxe
    .complete 59933,1 << !Hunter !Monk --3/3 Abilities proven against Warlord Grimaxe
	.mob Warlord Breka Grimaxe
step << Alliance !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Alaria|r交谈
    .turnin 59339 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << Monk
    .turnin 59254 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.36,74.63
    .accept 55173 >>接任务: |cRXP_WARN_向北而行|r
    .goto 1409,58.36,74.48
	.target Captain Garrick
	.target Alaria
step << Horde !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Breka|r和|cRXP_FRIENDLY_Won'sa|r交谈
    .turnin 59934 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << Monk
    .turnin 59933 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.36,74.63
    .accept 59935 >>接任务: |cRXP_WARN_向北而行|r
    .goto 1409,58.36,74.48
	.target Warlord Breka Grimaxe
	.target Won'sa
step << Alliance
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    .turnin 55173 >>交任务: |cRXP_FRIENDLY_向北而行|r
    .accept 55184 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r << !Hunter
    .accept 55186 >>接任务: |cRXP_WARN_打倒野猪人|r << !Hunter
    .accept 59342 >>接任务: |cRXP_WARN_野性可驯|r << Hunter
	.timer 9,Taming the Wilds RP << Hunter
	.target Austin Huxworth
step << Horde
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    .turnin 59935 >>交任务: |cRXP_FRIENDLY_向北而行|r
    .accept 59938 >>接任务: |cRXP_WARN_打倒野猪人|r << !Hunter
    .accept 59939 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r << !Hunter
    .accept 59937 >>接任务: |cRXP_WARN_野性可驯|r << Hunter
	.timer 9,Taming the Wilds RP << Hunter
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,62.72,69.85
    >>等待RP结束
    .complete 59342,1 << Alliance --1/1 Tame Beast learned from Mithdran
    .complete 59937,1 << Horde --1/1 Tame Beast learned from Mithdran
step << Hunter
    .goto 1409,62.62,68.23,30,0
    .goto 1409,64.22,68.26,30,0
    .goto 1409,63.60,70.74,30,0
    .goto 1409,62.62,68.23,30,0
    .goto 1409,64.22,68.26,30,0
    .goto 1409,63.60,70.74
    >>将 |T132161:0|t[召唤宠物] 和 |T132179:0|t[宠物技能] 拖拽到你的快捷栏上
	>>|cRXP_WARN_Cast |T132164:0|t[驯服野兽]对一只|cRXP_ENEMY_Sharpbeak Hawk|r进行驯服. 请确保驯服一只鹰, 以获得更高的移动速度|r
    .complete 59342,2 << Alliance --1/1 Any wildlife beast tamed
    .complete 59937,2 << Horde --1/1 Any wildlife beast tamed
	.mob Sharpbeak Hawk
step << Alliance Hunter
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    .turnin 59342 >>交任务: |cRXP_FRIENDLY_野性可驯|r
    .accept 55184 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r
    .accept 55186 >>接任务: |cRXP_WARN_打倒野猪人|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    .turnin 59937 >>交任务: |cRXP_FRIENDLY_野性可驯|r
    .accept 59938 >>接任务: |cRXP_WARN_打倒野猪人|r
    .accept 59939 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r
	.target Mithdran Dawntracker
step
    #completewith next
    >>击杀|cRXP_ENEMY_奎尔博尔战士|r和|cRXP_ENEMY_地元素师|r
    .complete 55184,1 << Alliance --7/7 Quilboar slain
    .complete 59939,1 << Horde --7/7 Quilboar slain
	.mob Quilboar Warrior
	.mob Quilboar Geomancer
step
    .goto 1409,60.63,61.37,25,0
    .goto 1409,58.87,63.00
	>>击杀|cRXP_ENEMY_Geolord Grek'og|r
    .complete 55186,1 << Alliance --1/1 Geolord Grek'og slain
    .complete 59938,1 << Horde --1/1 Geolord Grek'og slain
	.mob Geolord Grek'og
step
    .goto 1409,59.99,61.07,30,0
    .goto 1409,62.11,59.41,30,0
    .goto 1409,61.11,64.05,30,0
    .goto 1409,61.62,65.78,30,0
    .goto 1409,63.47,65.32,30,0
    .goto 1409,59.99,61.07,30,0
    .goto 1409,62.11,59.41,30,0
    .goto 1409,61.11,64.05,30,0
    .goto 1409,61.62,65.78,30,0
    .goto 1409,63.47,65.32
    >>击杀|cRXP_ENEMY_奎尔博尔战士|r和|cRXP_ENEMY_地元素师|r
    .complete 55184,1 << Alliance --7/7 Quilboar slain
    .complete 59939,1 << Horde --7/7 Quilboar slain
	.mob Quilboar Warrior
	.mob Quilboar Geomancer
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r和|cRXP_FRIENDLY_Lindie|r交谈
    .turnin 55184 >>交任务: |cRXP_FRIENDLY_禁忌的野猪人通灵术|r
    .goto 1409,56.26,59.17
    .turnin 55186 >>交任务: |cRXP_FRIENDLY_打倒野猪人|r
    .accept 55193 >>接任务: |cRXP_WARN_斥候机器人5000型|r
	.timer 20,Scout-o-Matic RP
    .goto 1409,56.17,59.12
	.target Austin Huxworth
	.target Lindie Springstock
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r和|cRXP_FRIENDLY_Cork|r交谈
    .turnin 59939 >>交任务: |cRXP_FRIENDLY_禁忌的野猪人通灵术|r
    .goto 1409,56.26,59.17
    .turnin 59938 >>交任务: |cRXP_FRIENDLY_打倒野猪人|r
    .accept 59940 >>接任务: |cRXP_WARN_强力直升爪Mk5型|r
	.timer 15,Choppy Booster RP
    .goto 1409,56.17,59.12
	.target Mithdran Dawntracker
	.target Cork Fizzlepop
step << Alliance
	#completewith next
    .goto 1409,56.08,58.81
	.vehicle >>等待RP结束. 进入|cRXP_FRIENDLY_Scout-o-Matic 5000|r
	.timer 33,Scout-o-Matic Flight RP
step << Alliance
    .goto 1409,56.08,58.81
    >>等待|cRXP_FRIENDLY_Scout-o-Matic 5000|r上的过场动画. |cRXP_WARN_Press "Esc" on your keyboard to skip the cinematic|r
    .complete 55193,1 --1/1 Use the Scout-o-Matic 5000 to scout the Area
	.timer 27,Scout-o-Matic Flight RP
step << Horde
    #completewith next
    #label ChoppyBoosterMk
    .goto 1409,56.08,58.81,0,0
    .complete 59940,1 --1/1 Use the Choppy Booster Mk. 5 to scout the Area
step << Horde
	#completewith ChoppyBoosterMk
    .goto 1409,56.08,58.81
	.vehicle >>等待RP结束. 进入|cRXP_FRIENDLY_Choppy Booster Mk. 5|r
	.timer 33,Choppy Booster Flight RP
step << Horde
    #requires ChoppyBoosterMk
    .goto 1409,56.08,58.81
    >>等待|cRXP_FRIENDLY_Choppy Booster Mk. 5|r上的剧情播放结束. |cRXP_WARN_按键盘上的“Esc”键可跳过过场动画|r
    .complete 59940,1 --1/1 Use the Choppy Booster Mk. 5 to scout the Area
	.timer 27,Choppy Booster Flight RP
step << Alliance
    .goto 1409,56.16,59.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lindie|r交谈
    .turnin 55193 >>交任务: |cRXP_FRIENDLY_斥候机器人5000型|r
    .accept 56034 >>接任务: |cRXP_WARN_调整局面|r
	.target Lindie Springstock
step << Horde
    .goto 1409,56.16,59.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cork|r交谈
    .turnin 59940 >>交任务: |cRXP_FRIENDLY_强力直升爪Mk5型|r
    .accept 59941 >>接任务: |cRXP_WARN_调整局面|r
	.target Cork Fizzlepop
step
    #sticky
	#label Chest1
    .goto 1409,58.51,59.30
	.turnin 56579 >>拾取地面上的|cRXP_PICK_宝箱|r
step
	.goto 1409,56.63,55.46,40,0
    .goto 1409,58.51,59.30,40,0
	.goto 1409,56.63,55.46,40,0
    .goto 1409,58.51,59.30
    >>在近战范围内对游荡野猪使用|T2735166:0|t[重置器 v9.0.1] << Alliance
    >>在近战范围内对游荡野猪使用|T2735166:0|t[重置器 v9.0.1] << Horde
    .complete 56034,1 << Alliance --3/3 Re-Sizer v9.0.1 tested on Wandering Boars
    .complete 59941,1 << Horde --3/3 Re-Sizer v9.0.1 tested on Wandering Boars
	.mob Wandering Boar
    .use 178051 << Horde
    .use 170557 << Alliance
step << Alliance
	#requires Chest1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Lindie|r交谈
    .turnin 56034 >>交任务: |cRXP_FRIENDLY_调整局面|r
    .goto 1409,56.25,59.03
	.timer 8,Re-sizing the Situation RP
    .accept 55879 >>接任务: |cRXP_WARN_骑乘科技强化野猪|r
    .goto 1409,56.17,59.13
	.target Captain Garrick
	.target Lindie Springstock
step << Horde
	#requires Chest1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Breka|r和|cRXP_FRIENDLY_Cork|r交谈
    .turnin 59941 >>交任务: |cRXP_FRIENDLY_调整局面|r
    .goto 1409,56.25,59.03
    .accept 59942 >>接任务: |cRXP_WARN_死亡调整器|r
    .goto 1409,56.17,59.13
	.target Warlord Breka Grimaxe
	.target Cork Fizzlepop
step << Alliance
    .goto 1409,56.53,58.42
    >>短暂RP后登上|r|cRXP_FRIENDLY_Giant Boar|r
    .complete 55879,1 --1/1 Ride the Giant Boar
    .target Giant Boar
step << Horde
    .goto 1409,56.08,58.81
    >>短暂剧情任务后进入|cRXP_FRIENDLY_Choppy Booster Mk. 5|r
    .complete 59942,1 --1/1 Ride the Choppy Booster Mk. 5
    .target Choppy Booster Mk. 5
step << Alliance
    .goto 1409,52.59,53.34
	>>使用 |T132226:0|t[践踏] (1) 施加在|cRXP_ENEMY_怪物尸体|r上以击杀它们
    .complete 55879,2 --8/8 Monstrous Cadaver slain
	.timer 8,Ride of the Boar RP
	.mob Monstrous Cadaver
step << Horde
    .goto 1409,52.59,53.34
    >>对|cRXP_ENEMY_Monstrous Cadavers|r使用 |T2735166:0|t[重置器爆破] (1) 来杀死它们
    .complete 59942,2 --8/8 Monstrous Cadaver slain
	.timer 13,Roleplay Duration
	.mob Monstrous Cadaver
step
    .goto 1409,50.94,52.78
    >>进入建筑内. 击杀|cRXP_ENEMY_Torgok|r
    .complete 55879,3 << Alliance --1/1 Torgok slain
    .complete 59942,3 << Horde --1/1 Torgok slain
	.timer 23,Ride of the Boar RP << Alliance
	.timer 23,The Re-Deather RP << Horde
	.mob Torgok
step << Alliance
    .goto 1409,52.60,53.35
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_Henry|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 55879,1 >>交任务: |cRXP_FRIENDLY_骑乘科技强化野猪|r
	.target Henry Garrick
step << Horde
    .goto 1409,52.59,53.35
    >>等待RP结束
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shuja|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 59942,1 >>交任务: |cRXP_FRIENDLY_死亡调整器|r
	.target Shuja Grimaxe
step << Alliance
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .accept 55194 >>接任务: |cRXP_WARN_囤积补给|r
	.target Captain Garrick
step << Horde
    .goto 1409,52.17,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .accept 59950 >>接任务: |cRXP_WARN_囤积补给|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,52.22,55.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richter|r交谈
	>>购买|cRXP_BUY_硬肉干|r或一件|cRXP_BUY_Alliance Tabard|r. 清理背包中所有垃圾物品
    .complete 55194,2 --Any Item sold to Quartermaster Richter
    .complete 55194,1 --Any Item purchased from Quartermaster Richter
	.target Quartermaster Richter
step << Horde
    .goto 1409,52.45,55.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jin'hake|r交谈
	>>购买|cRXP_BUY_硬肉干|r或|cRXP_BUY_Horde Tabard|r. 清理背包中任何垃圾物品
    .complete 59950,1 -- A Purchase an item from Provisioner Jin'hake
    .complete 59950,2 -- Sell an item to Provisioner Jin'hake
    .buy 178120,1
	.target Provisioner Jin'hake
step << Alliance
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 55194 >>交任务: |cRXP_FRIENDLY_囤积补给|r
	.target Captain Garrick
step << Horde
    .goto 1409,52.17,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59950 >>交任务: |cRXP_FRIENDLY_囤积补给|r
	.target Warlord Breka Grimaxe
step << Alliance Warrior/Alliance Warlock/Alliance Paladin/Alliance Priest
    .goto 1409,52.08,55.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cole|r交谈
    .accept 58914 >>接任务: |cRXP_WARN_战士的终点|r << Warrior
    .accept 58953 >>接任务: |cRXP_WARN_牧师的终途|r << Priest
    .accept 58923 >>接任务: |cRXP_WARN_圣骑士的效劳|r << Paladin
    .accept 58962 >>接任务: |cRXP_WARN_术士的交易|r << Warlock
	.target Private Cole
step << Horde Warrior/Horde Warlock/Horde Paladin/Horde Priest
    .goto 1409,52.02,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁恩·索格|r交谈
    .accept 59971 >>接任务: |cRXP_WARN_战士的终点|r << Warrior
    .accept 59961 >>接任务: |cRXP_WARN_牧师的终途|r << Priest
    .accept 59958 >>接任务: |cRXP_WARN_圣骑士的效劳|r << Paladin
    .accept 59970 >>接任务: |cRXP_WARN_术士的交易|r << Warlock
	.target Grunt Throg
step << Shaman
    .goto 1409,52.30,55.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幽灵狼|r交谈
    .accept 59002 >>接任务: |cRXP_WARN_萨满祭司的责任|r
	.target Ghost Wolf
step << Alliance
    .goto 1409,53.02,55.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Bjorn|r 交谈
    .accept 55965 >>接任务: |cRXP_WARN_西部边界|r
	.target Bjorn Stouthands
step << Horde
    .goto 1409,52.89,56.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱娜|r交谈
    .accept 59948 >>接任务: |cRXP_WARN_西部边界|r
	.target Lana Jordan
step << Shaman
    .goto 1409,52.12,51.65
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的|cRXP_PICK_Blossoms|r
    .complete 59002,1,1 --1/4 Veil Blossom
step << Shaman
    .goto 1409,51.84,51.12
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的|cRXP_PICK_Blossoms|r
    .complete 59002,1,2 --2/4 Veil Blossom
step << Shaman
    .goto 1409,52.53,51.00
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的|cRXP_PICK_Blossoms|r
    .complete 59002,1,3 --3/4 Veil Blossom
step << Shaman
    .goto 1409,53.23,51.38
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的|cRXP_PICK_Blossoms|r
    .complete 59002,1 --4/4 Veil Blossom
step << Horde
    .goto 1409,53.79,52.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shuja|r交谈
    .accept 59943 >>接任务: |cRXP_WARN_鹰身人的问题|r
	.target Shuja Grimaxe
step << Alliance
    .goto 1409,53.51,52.31
     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与亨利(|cRXP_FRIENDLY_Henry|r)交谈
    .accept 55196 >>接任务: |cRXP_WARN_鹰身人的问题|r
	.target Henry Garrick
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Henry|r 和 |cRXP_FRIENDLY_Kee-La|r 交谈
    .turnin 55196 >>交任务: |cRXP_FRIENDLY_鹰身人的问题|r
    .accept 55763 >>接任务: |cRXP_WARN_拯救梅瑞迪·寻涌|r
    .accept 55881 >>接任务: |cRXP_WARN_净化图腾|r
    .goto 1409,56.83,46.17
    .accept 55764 >>接任务: |cRXP_WARN_消灭鹰身人|r
    .goto 1409,56.93,46.25
	.target Henry Garrick
	.target Kee-La
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bo|r和|cRXP_FRIENDLY_Shuja|r交谈
    *|cRXP_WARN_You may have to wait for |cRXP_FRIENDLY_Shuja|r|r.
    .turnin 59943 >>交任务: |cRXP_FRIENDLY_鹰身人的问题|r
    .accept 59945 >>接任务: |cRXP_WARN_消灭鹰身人|r
    .accept 59946 >>接任务: |cRXP_WARN_净化图腾|r
    .goto 1409,56.93,46.24
    .accept 59944 >>接任务: |cRXP_WARN_拯救梅瑞迪·寻涌|r
    .goto 1409,56.83,46.17
step
	#completewith Harpytotem
	>>击杀|cRXP_ENEMY_Harpy Boltcallers|r和|cRXP_ENEMY_Snatchers|r和|cRXP_ENEMY_Hunting Worgs|r. 暂时不用优先处理
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step
    .goto 1409,58.23,44.49
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Harpy Totem|r燃烧它
    .complete 59946,1,1 << Horde --1/5 Harpy Totems burned
    .complete 55881,1,1 << Alliance --1/5 Harpy Totems burned
step
    .goto 1409,58.84,42.95
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Harpy Totem|r燃烧它
    .complete 59946,1,2 << Horde --2/5 Harpy Totems burned
    .complete 55881,1,2 << Alliance --2/5 Harpy Totems burned
step
    .goto 1409,61.23,41.31
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Harpy Totem|r燃烧它
    .complete 59946,1,3 << Horde --3/5 Harpy Totems burned
    .complete 55881,1,3 << Alliance --3/5 Harpy Totems burned
    .goto 1409,61.23,41.31
step
    #label Chest3
    .goto 1409,59.33,37.63
    .turnin 56581 >>拾取地面上的|cRXP_PICK_宝箱|r
step
    .goto 1409,59.01,39.10
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Harpy Totem|r燃烧它
    .complete 59946,1,4 << Horde --4/5 Harpy Totems burned
    .complete 55881,1,4 << Alliance --4/5 Harpy Totems burned
step
	#label Harpytotem
    .goto 1409,57.18,42.23
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Harpy Totem|r燃烧它
    .complete 59946,1 << Horde --5/5 Harpy Totems burned
    .complete 55881,1 << Alliance --5/5 Harpy Totems burned
step
	#completewith next
    >>击杀你在保护|cRXP_FRIENDLY_Meredy|r时出现的|cRXP_ENEMY_Harpies|r和|cRXP_ENEMY_Worgs|r << Alliance
    >>击杀你在保护|cRXP_FRIENDLY_赫伯特|r时召唤出的|cRXP_ENEMY_哈比|r和|cRXP_ENEMY_座狼|r << Horde
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
    .goto 1409,56.16,43.55,0,0
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step
    .goto 1409,54.29,41.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r交谈 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫伯特|r交谈 << Horde
	>>消灭不断涌来的敌人. 当|cRXP_ENEMY_Bloodbeak|r出现时, 击杀他
    .complete 55763,1 << Alliance --1/1 Meredy Huntswell rescued
    .complete 59944,1 << Horde --1/1 Herbert Gloomburst rescued
    .skipgossip
	.target Meredy Huntswell << Alliance
	.target Herbert Gloomburst << Horde
	.mob Bloodbeak
--VV GOSSIP OBJECTIVE? No timer since i think it depends on mob kill times
--PRMK You can also run into someone else that has already started the RP so the timer can be wrong
step
    .goto 1409,55.90,42.97,30,0
    .goto 1409,59.06,39.05,30,0
    .goto 1409,58.23,44.49
	>>击杀|cRXP_ENEMY_Harpy Boltcallers|r和|cRXP_ENEMY_Snatchers|r和|cRXP_ENEMY_Hunting Worgs|r
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
    .goto 1409,56.16,43.55,0,0
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫伯特|r和|cRXP_FRIENDLY_博|r和|cRXP_FRIENDLY_舒贾|r交谈
    .turnin 59944 >>交任务: |cRXP_FRIENDLY_拯救赫伯特·暗爆|r
    .goto 1409,56.90,46.13
    .turnin 59946 >>交任务: |cRXP_FRIENDLY_净化图腾|r
    .turnin 59945 >>交任务: |cRXP_FRIENDLY_消灭鹰身人|r
    .goto 1409,56.94,46.23
    .accept 59947 >>接任务: |cRXP_WARN_带给基地的消息|r
    .goto 1409,56.83,46.16
	.target Herbert Gloomburst
	.target Bo
    .target Shuja Grimaxe
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r和|cRXP_FRIENDLY_Kee-La|r和|cRXP_FRIENDLY_Henry|r交谈
    .turnin 55763 >>交任务: |cRXP_FRIENDLY_拯救梅瑞迪·寻涌|r
    .goto 1409,56.90,46.14
    .turnin 55764 >>交任务: |cRXP_FRIENDLY_消灭鹰身人|r
    .goto 1409,56.93,46.25
    .turnin 55881 >>交任务: |cRXP_FRIENDLY_净化图腾|r
    .accept 55882 >>接任务: |cRXP_WARN_带给基地的消息|r
    .goto 1409,56.83,46.18
	.target Meredy Huntswell
	.target Kee-La
	.target Henry Garrick
step
    .goto 1409,58.20,50.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与光之 spawn(|cRXP_FRIENDLY_Lightspawn|r)交谈
    .accept 54933 >>接任务: |cRXP_WARN_圣光解救|r
	.target Lightspawn
step
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Orbs|r以分散能量
    .complete 54933,1 --1/1 First necrotic energy dispersed
    .goto 1409,57.42,49.68
step
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Orbs|r以分散能量
    .complete 54933,2 --1/1 Second necrotic energy dispersed
    .goto 1409,58.49,49.16
step
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Orbs|r以分散能量
    .complete 54933,3 --1/1 Third necrotic energy dispersed
    .goto 1409,59.00,50.69
step
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Orbs|r以分散能量
    .complete 54933,4 --1/1 Fourth necrotic energy dispersed
	.timer 11,Freeing the Light RP
    .goto 1409,57.82,51.19
step << Alliance Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yorah|r交谈
    .complete 58923,1 --1/1 Speak with the ghost paladin
    .turnin 58923 >>交任务: |cRXP_FRIENDLY_圣骑士的效劳|r
    .accept 58946 >>接任务: |cRXP_WARN_圣盾术|r
	.skipgossip 162998,1
	.target Yorah
step << Horde Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达莉娅(|cRXP_FRIENDLY_Daelya|r)交谈
    .complete 59958,1 --1/1 Speak with the ghost paladin
    .turnin 59958 >>交任务: |cRXP_FRIENDLY_圣骑士的效劳|r
    .accept 60174 >>接任务: |cRXP_WARN_圣盾术|r
	.skipgossip 167179,1
	.target Daelya Twilightsbane
step << Alliance Paladin
	#completewith next
    .goto 1409,57.08,52.73
    >>施放|T524354:0|t[神圣护盾]以穿过屏障
	>>|cRXP_WARN_如果你未能及时穿过屏障, 请再次与约拉交谈以重置神圣护盾的冷却时间|r
    .complete 58946,1 --1/1 Divine shield used
	.skipgossip 162998,1
	.target Yorah
step << Horde Paladin
	#completewith next
    .goto 1409,57.08,52.73
    >>施放|T524354:0|t[神圣护盾]以穿过屏障
	>>|cRXP_WARN_如果你未能及时穿过屏障, 请再次与达莉娅交谈以重置神圣护盾的冷却时间|r
    .complete 60174,1 --1/1 Divine shield used
	.skipgossip 167179,1
	.target Daelya Twilightsbane
step << Alliance Paladin
    .goto 1409,57.08,52.73
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Altar|r 来摧毁它
    .complete 58946,2 --1/1 Necrotic altar destroyed
step << Horde Paladin
    .goto 1409,57.08,52.73
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Altar|r 来摧毁它
    .complete 60174,2 --1/1 Necrotic altar destroyed
step << Alliance Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Yorah|r交谈
    .turnin 58946 >>交任务: |cRXP_FRIENDLY_圣盾术|r
	.target Yorah
step << Horde Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达莉娅(|cRXP_FRIENDLY_Daelya|r)交谈
    .turnin 60174 >>交任务: |cRXP_FRIENDLY_圣盾术|r
	.target Daelya Twilightsbane
step
    .goto 1409,58.20,50.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与光之 spawn(|cRXP_FRIENDLY_Lightspawn|r)交谈
    .turnin 54933 >>交任务: |cRXP_FRIENDLY_圣光解救|r
	.target Lightspawn
step << Alliance Warrior
    .goto 1409,51.47,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_Hjalmar|r交谈. |cRXP_WARN_|将他的血量降至20%或更低. |cRXP_WARN_|对他施放|r|T135358:0|t|r|RXP_WARN|斩杀技能
    .turnin 58914 >>交任务: |cRXP_FRIENDLY_战士的终点|r
    .accept 58915 >>接任务: |cRXP_WARN_哈尔玛的最后处决|r
    .complete 58915,1 --1/1 Hjalmar the Undying slain with Execute
    .skipgossip
	.target Hjalmar the Undying
step << Horde Warrior
    .goto 1409,51.47,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_Hjalmar|r交谈. |cRXP_WARN_|将他的血量降至20%或更低. |cRXP_WARN_|对他施放|r|T135358:0|t|r|RXP_WARN|斩杀技能
    .turnin 59971 >>交任务: |cRXP_FRIENDLY_战士的终点|r
    .accept 59972 >>接任务: |cRXP_WARN_哈尔玛的最后处决|r
    .complete 59972,1 --1/1 Hjalmar the Undying slain with Execute
    .skipgossip
	.target Hjalmar the Undying
step << Alliance Warrior
    .goto 1409,52.08,55.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cole|r交谈
    .turnin 58915 >>交任务: |cRXP_FRIENDLY_哈尔玛的最后处决|r
	.target Private Cole
step << Horde Warrior
    .goto 1409,52.03,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Throg|r交谈
    .turnin 59972 >>交任务: |cRXP_FRIENDLY_哈尔玛的最后处决|r
	.target Grunt Throg
step << Alliance Priest
    .goto 1409,57.32,51.87,15,0
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰文|r交谈
    .turnin 58953 >>交任务: |cRXP_FRIENDLY_牧师的终途|r
    .accept 58960 >>接任务: |cRXP_WARN_复活新兵|r
	.target Branven Hammerheart
step << Horde Priest
    .goto 1409,57.32,51.87,15,0
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sha'zul|r交谈
    .turnin 59961 >>交任务: |cRXP_FRIENDLY_牧师的终途|r
    .accept 59965 >>接任务: |cRXP_WARN_复活新兵|r
	.target Sha'zul
step << Priest
    .goto 1409,56.12,53.25,15,0
    .goto 1409,56.44,53.73,15,0
    .goto 1409,56.12,53.25,15,0
    .goto 1409,56.21,53.48
	>>对新兵施放|T135955:0|t[复活]
    .complete 58960,1 << Alliance --3/3 Expedition recruits resurrected
    .complete 59965,1 << Horde --3/3 Expedition recruits resurrected
    .target First Expedition Recruit
step << Alliance Priest
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰文|r交谈
    .turnin 58960 >>交任务: |cRXP_FRIENDLY_复活新兵|r
	.target Branven Hammerheart
step << Horde Priest
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sha'zul|r交谈
    .turnin 59965 >>交任务: |cRXP_FRIENDLY_复活新兵|r
	.target Sha'zul
step << Alliance Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_地面上的Hubert尸体|r交谈
	>>拾取出现在他身旁地面上的|cRXP_PICK_书|r
    .complete 58962,1 --1/1 Dead warlock's body investigated
    .goto 1409,52.53,45.89
    .complete 58962,2 --1/1 Old Grimoire
    .goto 1409,52.59,45.85
	.target Hubert Lucas
    .skipgossip
step << Horde Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_斯普拉格·弗劳克|r的尸体交谈
	>>拾取出现在他身旁地面上的|cRXP_PICK_书|r
    .complete 59970,1 --1/1 Dead warlock's body investigated
    .goto 1409,52.53,45.89
    .complete 59970,2 --1/1 Old Grimoire
    .goto 1409,52.59,45.85
	.target Sprag Buzzboom
    .skipgossip
step << Warlock
	#completewith next
    .goto 1409,52.61,45.44
    >>使用荒芜之地, 卡加斯旁边的 |T538444:0|t[旧魔法书]
    .complete 58962,3 << Alliance --1/1 Voidwalker summoned with grimoire
    .complete 59970,3 << Horde --1/1 Voidwalker summoned with grimoire
    .use 174947
step << Warlock
    .goto 1409,52.61,45.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虚空行者|r.交谈
    .turnin 58962 >>交任务: |cRXP_FRIENDLY_术士的交易|r << Alliance
    .turnin 59970 >>交任务: |cRXP_FRIENDLY_术士的交易|r << Horde
	.target Summoned Voidwalker
step << Alliance !Priest !Monk !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Campfire|r << Shaman
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .complete 59002,2 << Shaman --1/1 Blossoms burned on campfire
    .goto 1409,52.21,55.58 << Shaman
	.target Captain Garrick
step << Horde !Priest !Monk !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Campfire|r << Shaman
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .complete 59002,2 << Shaman --1/1 Blossoms burned on campfire
    .goto 1409,52.21,55.58 << Shaman
	.target Warlord Breka Grimaxe
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Austin|r交谈
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .accept 59355 >>接任务: |cRXP_WARN_猎人的陷阱|r
    .goto 1409,52.41,55.28
	.target Captain Garrick
	.target Austin Huxworth
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r和|cRXP_FRIENDLY_米斯丹|r交谈
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .accept 59952 >>接任务: |cRXP_WARN_猎人的陷阱|r
    .goto 1409,52.56,55.43
	.target Warlord Breka Grimaxe
	.target Mithdran Dawntracker
step << Alliance Monk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Kee-La|r交谈
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .accept 59347 >>接任务: |cRXP_WARN_武僧的专注|r
    .goto 1409,52.14,55.68
	.timer 34,A Monk's Focus RP
	.target Captain Garrick
	.target Kee-La
step << Horde Monk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r和|cRXP_FRIENDLY_布尔|r交谈
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .accept 59956 >>接任务: |cRXP_WARN_武僧的专注|r
    .goto 1409,52.04,55.22
	.timer 34,A Monk's Focus RP
	.target Warlord Breka Grimaxe
	.target Bo
step << Shaman
    .goto 1409,54.40,58.45
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Ghost Wolf|r以解救它
    .complete 59002,3,1 --1/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,55.28,52.79
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Ghost Wolf|r以解救它
    .complete 59002,3,2 --2/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,55.40,50.78
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Ghost Wolf|r以解救它
    .complete 59002,3 --3/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,52.30,55.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幽灵狼|r交谈
    .turnin 59002 >>交任务: |cRXP_FRIENDLY_萨满祭司的责任|r
	.target Ghost Wolf
step << Alliance Monk
    .goto 1409,52.62,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跟随|cRXP_FRIENDLY_Kee-La|r, 然后与她交谈
    .complete 59347,1 --1/1 Meditate with Kee-La
	.skipgossip 164835,1
	.timer 42,A Monk's Focus RP
	.target Kee-La
step << Horde Monk
    .goto 1409,52.62,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跟随 |cRXP_FRIENDLY_Bo|r, 然后与他交谈
    .complete 59956,1 --1/1 Meditate with Bo
	.skipgossip 167537,1
	.timer 42,A Monk's Focus RP
	.target Bo
step << Alliance Monk
    .goto 1409,52.63,49.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kee-La|r交谈
    .turnin 59347 >>交任务: |cRXP_FRIENDLY_武僧的专注|r
    .accept 59349 >>接任务: |cRXP_WARN_最后的比试|r
	.timer 5,One Last Spar RP
	.target Kee-La
step << Horde Monk
    .goto 1409,52.63,49.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布尔|r交谈
    .turnin 59956 >>交任务: |cRXP_FRIENDLY_武僧的专注|r
    .accept 59957 >>接任务: |cRXP_WARN_最后的比试|r
	.timer 5,One Last Spar RP
	.target Bo
step << Alliance Monk
    .goto 1409,53.72,50.24
    >>跟随 |cRXP_FRIENDLY_Kee-La|r. 当 |cRXP_ENEMY_Kee-La|r 变为敌对状态时, 对她施放 |T606552:0|t 死亡之触
    .complete 59349,1 --1/1 Touch of Death used on Kee-La
    .mob Kee-La
step << Horde Monk
    .goto 1409,53.72,50.24
    >>跟随|cRXP_FRIENDLY_Bo|r. 当|cRXP_ENEMY_Bo|r变为敌对状态时, 对他施放 |T606552:0|t死亡之触
    .complete 59957,1 --1/1 Touch of Death used on Bo
    .mob Bo
step << Alliance Monk
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 59349 >>交任务: |cRXP_FRIENDLY_最后的比试|r
	.target Captain Garrick
step << Horde Monk
    .goto 1409,52.18,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59957 >>交任务: |cRXP_FRIENDLY_最后的比试|r
	.target Warlord Breka Grimaxe
step << Alliance Mage
    .goto 1409,52.28,55.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r交谈
    .accept 59352 >>接任务: |cRXP_WARN_法师的知识|r
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫伯特|r交谈
    .accept 59954 >>接任务: |cRXP_WARN_法师的知识|r
	.target Herbert Gloomburst
step << Mage
    .goto 1409,51.95,49.84
	>>在水下拾取|cRXP_PICK_法术书|r
    .complete 59352,1 << Alliance --1/1 Meredy's Spell Book
    .complete 59954,1 << Horde --1/1 Herbert's Spell Book
step << Alliance Mage
    .goto 1409,52.28,55.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r交谈
    .turnin 59352 >>交任务: |cRXP_FRIENDLY_法师的知识|r
    .accept 59354 >>接任务: |cRXP_WARN_绵羊的最佳用途|r
    .complete 59354,1 --Speak with Meredy to being sparring (1)
	.skipgossip 156886,1
	.timer 18,The Best Way to Use Sheep RP
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫伯特|r交谈
    .turnin 59954 >>交任务: |cRXP_FRIENDLY_法师的知识|r
    .accept 59955 >>接任务: |cRXP_WARN_绵羊的最佳用途|r
    .complete 59955,1 --Speak with Herbert to begin sparring (1)
	.skipgossip 167309,1
	.timer 18,The Best Way to Use Sheep RP
	.target Herbert Gloomburst
step << Alliance Mage
    .goto 1409,52.30,55.46
    >>跟随|cRXP_FRIENDLY_Meredy|r和|cRXP_FRIENDLY_Cole|r. 等待剧情演出结束
    >>施放 |T136071:0|t[变形术]于|cRXP_ENEMY_Meredy|r或|cRXP_ENEMY_Cole|r, 然后对被你变形的目标造成一次伤害
    .complete 59354,2 --Practice Polymorph with Meredy or Cole
	.timer 10,The Best Way to Use Sheep RP
	.mob Meredy Huntsworth
	.mob Private Cole
step << Horde Mage
    .goto 1409,52.30,55.46
    >>跟随|cRXP_FRIENDLY_Herbert|r和|cRXP_FRIENDLY_Throg|r. 等待剧情演出结束
    >>施放 |T136071:0|t[变形术]于|cRXP_ENEMY_Herbert|r或|cRXP_ENEMY_Throg|r, 然后对被你变形的目标造成一次伤害
    .complete 59955,2 --Practice Polymorph with Herbert or Throg
	.timer 10,The Best Way to Use Sheep RP
	.mob Herbert Gloomburst
	.mob Grunt Throg
step << Alliance Mage
    .goto 1409,52.30,55.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r交谈
    .turnin 59354 >>交任务: |cRXP_FRIENDLY_绵羊的最佳用途|r
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫伯特|r交谈
    .turnin 59955 >>交任务: |cRXP_FRIENDLY_绵羊的最佳用途|r
	.target Herbert Gloomburst
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bjorn|r和|cRXP_FRIENDLY_Alaria|r交谈
    .turnin 55965 >>交任务: |cRXP_FRIENDLY_西部边界|r
    .goto 1409,51.18,59.61
    .accept 55639 >>接任务: |cRXP_WARN_谁藏在坑中|r
    .goto 1409,51.11,59.51
	.target Bjorn Stouthands
	.target Alaria
step << Horde
    .goto 1409,51.11,59.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱娜|r交谈
    .turnin 59948 >>交任务: |cRXP_FRIENDLY_西部边界|r
    .accept 59949 >>接任务: |cRXP_WARN_谁藏在坑中|r
	.target Lana Jordan
step
	#completewith next
	>>|cRXP_WARN_尽量避免在内部与蜘蛛战斗|r.
    .goto 1409,50.88,60.45,10 >>进入蜘蛛洞窟
step
    .goto 1409,52.07,59.99
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Cocoon|r以摧毁它
    .complete 55639,1,1 << Alliance --1/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,1 << Horde --1/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,52.02,58.31,15,0
    .goto 1409,50.26,58.69
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Cocoon|r以摧毁它
    .complete 55639,1,2 << Alliance --2/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,2 << Horde --2/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,49.71,60.49,15,0
    .goto 1409,49.70,62.02
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Cocoon|r以摧毁它
    .complete 55639,1,3 << Alliance --3/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,3 << Horde --3/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,51.12,62.10,15,0
    .goto 1409,51.96,60.67
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Cocoon|r以摧毁它
    .complete 55639,1,4 << Alliance --4/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,4 << Horde --4/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,52.07,59.13,12,0
    .goto 1409,50.87,58.12
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Cocoon|r以摧毁它
    .complete 55639,1 << Alliance --5/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1 << Horde --5/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,50.08,59.91,12,0
    .goto 1409,47.42,60.49
    >>击杀|cRXP_ENEMY_Hrun the Exiled|r
    .complete 55639,2 << Alliance --Defeat Hrun to rescue Ralia Dreamchaser (1)
    .complete 59949,2 << Horde --Defeat Hrun to rescue Crenna Earth-Daughter (1)
	.mob Hrun the Exiled
step << skip
	#completewith next
    .goto 1409,47.79,60.27
    .vehicle >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Ralia|r骑乘她
	.timer 51,Who Lurks in the Pit RP
	.target Ralia Dreamchaser
--VV ALLIANCE Ralia/Crenna not classified as either vehicle or flight paths so can't do this. unluko
step << Alliance
    .goto 1409,47.79,60.27
--  .goto 1409,51.83,58.76
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Ralia|r骑乘她. 等待剧情演出结束
    .complete 55639,3 --Ride Ralia Dreamchaser to escape (1)
	.target Ralia Dreamchaser
step << skip
	#completewith next
    .goto 1409,47.79,60.27
    .vehicle >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Crenna|r骑乘她
	.timer 51,Who Lurks in the Pit RP
	.target Crenna Earth-Daughter
--VV HORDE Ralia/Crenna not classified as either vehicle or flight paths so can't do this. unluko
step << Horde
    .goto 1409,47.79,60.27
--   .goto 1409,51.83,58.76
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Crenna|r骑乘她. 等待剧情演出结束
    .complete 59949,3 --Ride Crenna Earth-Daughter to escape (1)
	.target Crenna Earth-Daughter
step << Horde !Hunter !Rogue !Druid
    .goto 1409,52.18,55.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r << Priest
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Warlord Breka Grimaxe
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Herbert|r和|cRXP_FRIENDLY_Breka|r交谈
    .complete 59952,1 --1/1 Ice mote received from Herbert Gloomburst
    .goto 1409,52.16,55.49
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
    .skipgossip
	.target Herbert Gloomburst
	.target Warlord Breka Grimaxe
step << Horde Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Breka|r和|cRXP_FRIENDLY_Throg|r交谈
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
    .accept 59967 >>接任务: |cRXP_WARN_[A Rogue's End]|r
    .goto 1409,52.08,55.29
	.target Warlord Breka Grimaxe
	.target Grunt Throg
step << Horde Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与克雷纳和|cRXP_FRIENDLY_布蕾卡|r交谈
    .accept 59951 >>接任务: |cRXP_WARN_[A Druid's Form]|r
    .goto 1409,52.33,55.44
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
	.target Crenna Earth-Daughter
	.target Warlord Breka Grimaxe
step << Alliance !Hunter !Rogue !Druid
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r << Priest
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Captain Garrick
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r和|cRXP_FRIENDLY_Garrick|r交谈
    .complete 59355,1 --1/1 Ice mote received from Meredy Huntswell
    .goto 1409,52.29,55.47
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
	.skipgossip
	.target Meredy Huntswell
	.target Captain Garrick
step << Alliance Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Coulston|r交谈
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
    .accept 58917 >>接任务: |cRXP_WARN_[A Rogue's End]|r
    .goto 1409,52.08,55.29
	.target Captain Garrick
	.target Coulston Nereus
step << Alliance Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ralia|r和|r|cRXP_FRIENDLY_Garrick|r交谈
    .accept 59350 >>接任务: |cRXP_WARN_[A Druid's Form]|r
    .goto 1409,52.33,55.44
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
	.target Ralia Dreamchaser
	.target Captain Garrick
step << Druid
    .goto 1409,45.34,49.19
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Druid 石头|r来执行仪式
    .complete 59350,1 << Alliance --1/1 Commune with the Druid Stone
    .complete 59951,1 << Horde --1/1 Commune with the Druid Stone
step << Alliance Druid
    .goto 1409,45.50,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉莉亚|r交谈
    .turnin 59350 >>交任务: |cRXP_FRIENDLY_德鲁伊的形态|r
	.target Ralia Dreamchaser
step << Horde Druid
    .goto 1409,45.50,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷娜|r交谈
    .turnin 59951 >>交任务: |cRXP_FRIENDLY_德鲁伊的形态|r
	.target Crenna Earth-Daughter
step << Horde Druid
    .goto 1409,52.17,55.35
    >>将旅行形态技能放置到你的快捷栏中
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Warlord Breka Grimaxe
step << Alliance Druid
    .goto 1409,52.35,55.33
    >>将 |T132144:0|t旅行形态 放在你的快捷栏上
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Captain Garrick
step << Hunter
    >>拾取地面上的|rXP_PICK_链子|r和|rXP_PICK_春水蛾|r
    .complete 59355,2 << Alliance --1/1 Rusted Chain
    .complete 59952,2 << Horde --1/1 Rusted Chain
    .goto 1409,52.25,53.03
    .complete 59355,3 << Alliance --1/1 Old Spring
    .complete 59952,3 << Horde --1/1 Old Spring
    .goto 1409,51.83,51.60
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    .turnin 59355 >>交任务: |cRXP_FRIENDLY_猎人的陷阱|r
    .accept 59356 >>接任务: |cRXP_WARN_狩猎潜伏者|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    .turnin 59952 >>交任务: |cRXP_FRIENDLY_猎人的陷阱|r
    .accept 59953 >>接任务: |cRXP_WARN_狩猎潜伏者|r
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,52.60,53.29
    >>|cRXP_WARN_Drag |T135834:0|t将[冰冻陷阱]从法术书拖动到你的动作条|r
    >>在食人魔之环中央施放冰冻陷阱 |T135834:0|t
    .complete 59356,1 << Alliance --1/1 Freezing trap used within Ogre Ruins to capture stalker
    .complete 59953,1 << Horde --1/1 Freezing trap used within Ogre Ruins to capture stalker
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    .turnin 59356 >>交任务: |cRXP_FRIENDLY_狩猎潜伏者|r
    .accept 60168 >>接任务: |cRXP_WARN_驯服的艺术|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    .turnin 59953 >>交任务: |cRXP_FRIENDLY_狩猎潜伏者|r
    .accept 60162 >>接任务: |cRXP_WARN_驯服的艺术|r
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,52.56,55.45
    >>|cRXP_WARN_Click |T132179:0|t[宠物实用功能] -> 施放 |T136095:0|t[召回宠物]|r.
    .complete 60168,1 << Alliance --Use "Dismiss Pet" to temporarily dismiss your current pet
    .complete 60162,1 << Horde --Use "Dismiss Pet" to temporarily dismiss your current pet
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    >>目标|cRXP_ENEMY_狼|r. 对其施放|cRXP_WARN_Cast |T132164:0|t[驯服野兽]|r << !Worgen !Draenei
    >>目标|cRXP_ENEMY_Dog|r. 对其施放|cRXP_WARN_Cast |T132164:0|t[驯服野兽]|r << Worgen
    >>目标|cRXP_ENEMY_Moth|r. 对其施放|cRXP_WARN_Cast |T132164:0|t[驯服野兽]|r << Draenei
    .complete 60168,2 -- Speak with Austin to summon and tame your new pet
	.skipgossip 161666,2
	.timer 7,The Art of Taming RP
	.target Austin Huxworth
	.mob Wolf
	.mob Dog << Worgen
	.mob Moth << Draenei
--VV GOSSIP OBJECTIVE STEP
step << Horde Hunter
    .goto 1409,52.56,55.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    >>目标|cRXP_ENEMY_Turtle|r. |cRXP_WARN_Cast |T132164:0|t[驯服野兽]在它身上|r << !Orc !BloodElf
    >>目标|cRXP_ENEMY_狼|r. 对其施放|cRXP_WARN_Cast |T132164:0|t[驯服野兽]|r << Orc
    >>目标锁定|cRXP_ENEMY_龙鹰|r. |cRXP_WARN_对它使用 |T132164:0|t[驯服野兽]|r << BloodElf
    >>对其施放[驯服野兽]
    .complete 60162,2 -- Speak with Mithdran to summon and tame your new pet
	.skipgossip 167215,2
	.timer 7,The Art of Taming RP
	.target Mithdran Dawntracker
	.mob Turtle
    .mob Wolf
    .mob Dragonhawk
--VV GOSSIP OBJECTIVE STEP
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austin|r交谈
    .complete 60168,3 --Speak with Austin to learn about pet stables
	.skipgossip 161666,1
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r交谈
    .complete 60162,3 --Speak with Mithdran to learn about pet stables
	.skipgossip 167215,1
	.target Mithdran Dawntracker
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Austin|r 和 |cRXP_FRIENDLY_Garrick|r 交谈
    .turnin 60168 >>交任务: |cRXP_FRIENDLY_驯服的艺术|r
    .goto 1409,52.42,55.27
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.35,55.33
	.target Austin Huxworth
	.target Captain Garrick
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithdran|r和|cRXP_FRIENDLY_Breka|r交谈
    .turnin 60162 >>交任务: |cRXP_FRIENDLY_驯服的艺术|r
    .goto 1409,52.56,55.45
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.17,55.35
	.target Mithdran Dawntracker
	.target Warlord Breka Grimaxe
step << Rogue
    .goto 1409,48.76,54.25
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Danger Sign|r交谈
    .accept 56839 >>接任务: |cRXP_WARN_可怕的灭爪|r
step << Rogue
	#completewith RoguesEnd
	>>击杀|cRXP_ENEMY_Killclaw the Terrible|r. |cRXP_WARN_如果发现其他玩家正在击杀他, 请避免冲突；否则, 暂时避开他|r
	.complete 56839,1 --Killclaw the Terrible Slain (1)
    .mob Killclaw the Terrible
step << Alliance Rogue
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Coulston|r交谈
    .complete 58917,1 --1/1 First expedition's rogue found
	.target Coulston Nereus
step << Horde Rogue
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德拉萨|r交谈
    .complete 59967,1 --1/1 First expedition's rogue found
	.target Drizza Sidestabber
step << Rogue
    .goto 1409,44.76,56.42
    >>在地面上采集|cRXP_PICK_Hemlock 植物|r
    .complete 58917,2,1 << Alliance --3/3 Withering Hemlock
    .complete 59967,2,1 << Horde --3/3 Withering Hemlock
step << Rogue
    .goto 1409,45.17,55.69
    >>在地面上采集|cRXP_PICK_Hemlock 植物|r
    .complete 58917,2,2 << Alliance --3/3 Withering Hemlock
    .complete 59967,2,2 << Horde --3/3 Withering Hemlock
step << Rogue
    .goto 1409,45.09,54.66
    >>在地面上采集|cRXP_PICK_Hemlock 植物|r
    .complete 58917,2 << Alliance --3/3 Withering Hemlock
    .complete 59967,2 << Horde --3/3 Withering Hemlock
step << Alliance Rogue
	#label RoguesEnd
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Coulston|r交谈
    .turnin 58917 >>交任务: |cRXP_FRIENDLY_潜行者的末路|r
    .accept 58933 >>接任务: |cRXP_WARN_最致命的药膏|r
	.target Coulston Nereus
step << Horde Rogue
	#label RoguesEnd
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德拉萨|r交谈
    .turnin 59967 >>交任务: |cRXP_FRIENDLY_潜行者的末路|r
    .accept 59968 >>接任务: |cRXP_WARN_最致命的药膏|r
	.target Drizza Sidestabber
step << Rogue
	#completewith KillclawR
    .complete 59968,1 >>施放 |T132273:0|t[速效药膏] 以将其涂抹到你的武器上
step << Rogue
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27,30,0
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27
	>>击杀|cRXP_ENEMY_Killclaw the Terrible|r. |cRXP_WARN_此任务难度较高|r. 如有需要, 请组队完成. 若无法组队或无法单刷, 请跳过此步骤
    >>躲避Killclaw的“践踏冲锋”, 在他施法时向一侧移动. 如果你是单刷他, 可以使用|T1373904:0|t[绯红药瓶], 并在需要时使用|T134830:0|t[远征治疗药水]
    .complete 56839,1 --1/1 Killclaw the Terrible slain
	.mob Killclaw the Terrible
	.use 175241
	.isOnQuest 56839
step << Rogue
	#completewith next
    .goto 1409,44.20,52.65,20 >>进入洞穴内部
step << Rogue
    .goto 1409,43.42,51.13
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Chest|r交谈
    .turnin 56839 >>交任务: |cRXP_FRIENDLY_可怕的灭爪|r
	.isQuestComplete 56839
step << Rogue
	#label KillclawR
	.abandon 56839 >>放弃可怕的杀爪
step << Rogue
    .goto 1409,48.47,52.04
    .complete 59968,1 >>施放 |T132273:0|t[速效药膏], 将其涂抹到你的武器上, 然后|cRXP_WARN_BEFORE|r击杀|cRXP_ENEMY_Gutgruk|r
step << Rogue
	#label GutGruk
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04,40,0
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04,40,0
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04
	>>击杀 |cRXP_ENEMY_Gutgruk|r
    .complete 58933,2 << Alliance --1/1 Gutgruk the Tough slain
    .complete 59968,2 << Horde --1/1 Gutgruk the Tough slain
	.mob Gutgruk the Tough
step << Alliance Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Cole|r 和 |cRXP_FRIENDLY_Garrick|r 交谈
    .turnin 58933 >>交任务: |cRXP_FRIENDLY_最致命的药膏|r
    .goto 1409,52.08,55.29
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.35,55.33
	.target Private Cole
	.target Captain Garrick
step << Horde Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Throg|r和|cRXP_FRIENDLY_Breka|r交谈
    .turnin 59968 >>交任务: |cRXP_FRIENDLY_最致命的药膏|r
    .goto 1409,52.08,55.29
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.17,55.35
	.target Grunt Throg
	.target Warlord Breka Grimaxe
step << !Rogue
    .goto 1409,48.76,54.25
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Danger Sign|r交谈
    .accept 56839 >>接任务: |cRXP_WARN_可怕的灭爪|r
step << !Rogue
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27,30,0
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27
    >>杀死可怕的杀爪(Killclaw the Terrible) << Hunter/Warlock
    >>击杀|cRXP_ENEMY_Killclaw the Terrible|r. |cRXP_WARN_此任务难度较高|r. 如有需要, 请组队完成. 若无法组队或选择单人挑战, 请跳过此步骤 << !Hunter !Warlock
    >>道奇|cRXP_ENEMY_Killclaw's|r的“践踏冲锋”, 在施放时向一侧移动躲避 << !Warlock !Priest
    >>躲避Killclaw的“践踏冲锋”, 在施法时向一侧移动. Killclaw对[恐惧]免疫 << Warlock
    >>躲避|cRXP_ENEMY_Killclaw's|r的“践踏冲锋”, 在施法时向一侧移动. Killclaw 对 |T136184:0|t[心灵尖啸] 免疫 << Priest
    .complete 56839,1 --1/1 Killclaw the Terrible slain
	.mob Killclaw the Terrible
	.use 175241
	.isOnQuest 56839
step << !Rogue
	#completewith next
    .goto 1409,44.20,52.65,20 >>进入洞穴内部
step << !Rogue
    .goto 1409,43.42,51.13
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Chest|r交谈
    .turnin 56839 >>交任务: |cRXP_FRIENDLY_可怕的灭爪|r
	.isQuestComplete 56839
step << !Rogue
	.abandon 56839 >>放弃可怕的杀爪
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garrick|r和|cRXP_FRIENDLY_Meredy|r交谈
    .turnin 56344 >>交任务: |cRXP_FRIENDLY_前往暗槌堡垒|r
    .accept 55981 >>接任务: |cRXP_WARN_就在眼皮底下|r
    .goto 1409,48.98,49.24
    .complete 55981,1 --1/1 Ask Meredy to perform ogre transformation spell
    .goto 1409,49.04,49.20
    .skipgossip
	.timer 8,Right Beneath their Eyes RP
	.target Captain Garrick
	.target Meredy Huntsworth
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r和|cRXP_FRIENDLY_赫伯特|r交谈
    .turnin 59975 >>交任务: |cRXP_FRIENDLY_前往暗槌堡垒|r
    .accept 59978 >>接任务: |cRXP_WARN_就在眼皮底下|r
    .goto 1409,48.95,49.33
    .complete 59978,1 --1/1 Ask Herbert to perform ogre transformation spell
    .goto 1409,48.93,49.46
    .skipgossip
	.timer 8,Right Beneath their Eyes RP
	.target Warlord Breka Grimaxe
	.target Herbert Gloomburst
step
    .goto 1409,45.22,43.37
    >>跑向暗槌要塞的楼梯
    .complete 55981,2 << Alliance --1/1 Enter Darkmaul Citadel
    .complete 59978,2 << Horde --1/1 Enter Darkmaul Citadel
step
    .goto 1409,45.68,37.55
	>>前往食人魔烹饪区
    .complete 55981,3 << Alliance --Find the ogre cooking Area
    .complete 59978,3 << Horde --Find the ogre cooking Area
step
    .goto 1409,45.68,37.55
    >>目标|cRXP_FRIENDLY_Gor'groth|r以自动向他挥手. 如果此方法无效, 请输入 /wave 至|cRXP_FRIENDLY_Gor'groth|r
    .complete 55981,4 << Alliance --Type /wave to Gor'groth
    .complete 59978,4 << Horde --Type /wave to Gor'groth
    .emote WAVE,153580
	.target Gor'groth
step
	#completewith next
    .goto 1409,45.95,36.07,15,0
    .goto 1409,40.16,32.35
	>>跑上通往要塞的楼梯
    .complete 55981,6 << Alliance --Reach the Citadel entrance
    .complete 59978,6 << Horde --Reach the Citadel entrance
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加里克|r和|cRXP_FRIENDLY_亨利|r和|cRXP_FRIENDLY_梅雷迪|r交谈
    .turnin 55981 >>交任务: |cRXP_FRIENDLY_就在眼皮底下|r
    .accept 55990 >>接任务: |cRXP_WARN_控制他们的石头|r
    .goto 1409,40.16,32.35
    .accept 55988 >>接任务: |cRXP_WARN_食人魔任人宰割|r
    .goto 1409,40.22,32.35
    .accept 55989 >>接任务: |cRXP_WARN_毁灭投石车|r
    .goto 1409,40.26,32.33
	.target Captain Garrick
	.target Henry Garrick
	.target Meredy Huntsworth
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r和|cRXP_FRIENDLY_舒贾|r和|cRXP_FRIENDLY_赫伯特|r交谈
    .turnin 59978 >>交任务: |cRXP_FRIENDLY_就在眼皮底下|r
    .accept 59981 >>接任务: |cRXP_WARN_控制他们的石头|r
    .goto 1409,40.29,32.45
    .accept 59979 >>接任务: |cRXP_WARN_食人魔任人宰割|r
    .goto 1409,40.25,32.56
    .accept 59980 >>接任务: |cRXP_WARN_毁灭投石车|r
    .goto 1409,40.37,32.42
	.target Warlord Breka Grimaxe
	.target Shuja Grimaxe
	.target Herbert Gloomburst
step
	#completewith KillOgre
    >>击杀|cRXP_ENEMY_Ogre Shadowcasters|r和|cRXP_ENEMY_Brutes|r和|cRXP_ENEMY_Chefs|r
    .complete 55988,1 << Alliance --8/8 Ogres slain
    .complete 59979,1 << Horde--8/8 Ogres slain
	.mob Ogre Brute
	.mob Ogre Chef
	.mob Ogre Shadowcaster
step
    >>击杀建筑物内的|cRXP_ENEMY_Wug|r和|cRXP_ENEMY_Jugnug|r, 搜刮出他们的[|cRXP_LOOT_Ward Stones|r]
    .complete 55990,2 << Alliance --1/1 Wug's ward stone recovered
    .complete 59981,2 << Horde --1/1 Wug's ward stone recovered
    .goto 1409,44.13,37.29
    .complete 55990,1 << Alliance --1/1 Jugnug's ward stone recovered
    .complete 59981,1 << Horde --1/1 Jugnug's ward stone recovered
    .goto 1409,47.57,34.17
	.mob Wug
	.mob Jugnug
step
    .goto 1409,47.21,36.44
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Catapult|r来摧毁它
    .complete 59980,1,1 << Horde --1/4 Catapults destroyed
step
    .goto 1409,46.26,39.71
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Catapult|r来摧毁它
    .complete 55989,1,2 << Alliance --2/4 Catapults destroyed
    .complete 59980,1,2 << Horde --2/4 Catapults destroyed
step
    .goto 1409,45.28,41.72
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Catapult|r来摧毁它
    .complete 55989,1,3 << Alliance --3/4 Catapults destroyed
    .complete 59980,1,3 << Horde --3/4 Catapults destroyed
step
    .goto 1409,42.80,41.00
    >>击杀建筑内的|cRXP_ENEMY_Grunk|r, 从他身上获取 [|cRXP_LOOT_Ward Stone|r]
    .complete 55990,3 << Alliance --1/1 Grunk's ward stone recovered
    .complete 59981,3 << Horde --1/1 Grunk's ward stone recovered
	.mob Grunk
step
    .goto 1409,43.74,42.86
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Catapult|r来摧毁它
    .complete 55989,1 << Alliance --4/4 Catapults destroyed
    .complete 59980,1 << Horde --4/4 Catapults destroyed
step
	#label KillOgre
    .goto 1409,41.81,42.88
    .turnin 56088 >>拾取地面上的|cRXP_PICK_宝箱|r
step
    .goto 1409,43.19,37.59,30,0
    .goto 1409,45.74,34.78,30,0
    .goto 1409,47.48,36.77,30,0
    .goto 1409,46.92,38.25,30,0
    .goto 1409,46.07,39.85,30,0
    .goto 1409,45.44,37.11,30,0
    .goto 1409,43.83,40.24,30,0
    .goto 1409,43.95,42.92,30,0
    .goto 1409,43.95,42.92,30,0
    .goto 1409,41.91,41.79,30,0
    .goto 1409,43.19,37.59,30,0
    .goto 1409,45.74,34.78,30,0
    .goto 1409,47.48,36.77,30,0
    .goto 1409,46.92,38.25,30,0
    .goto 1409,46.07,39.85,30,0
    .goto 1409,45.44,37.11,30,0
    .goto 1409,43.83,40.24,30,0
    .goto 1409,43.95,42.92,30,0
    .goto 1409,43.95,42.92,30,0
    .goto 1409,41.91,41.79
    >>击杀|cRXP_ENEMY_Ogre Shadowcasters|r和|cRXP_ENEMY_Brutes|r和|cRXP_ENEMY_Chefs|r
    .complete 55988,1 << Alliance --8/8 Ogres slain
    .complete 59979,1 << Horde--8/8 Ogres slain
	.mob Ogre Brute
	.mob Ogre Chef
	.mob Ogre Shadowcaster
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Meredy|r和|cRXP_FRIENDLY_Henry|r交谈
    .turnin 55989 >>交任务: |cRXP_FRIENDLY_毁灭投石车|r
    .goto 1409,40.26,32.33
    .turnin 55988 >>交任务: |cRXP_FRIENDLY_食人魔任人宰割|r
    .goto 1409,40.22,32.35
	.target Meredy Huntsworth
	.target Henry Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Herbert|r和|cRXP_FRIENDLY_Shuja|r交谈
    .turnin 59980 >>交任务: |cRXP_FRIENDLY_毁灭投石车|r
    .goto 1409,40.37,32.41
    .turnin 59979 >>交任务: |cRXP_FRIENDLY_食人魔任人宰割|r
    .goto 1409,40.25,32.56
	.target Herbert Gloomburst
	.target Shuja Grimaxe
step
    .goto 1409,39.93,32.44
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Ogre 符文tone|r以禁用它
    .complete 55990,4,1 << Alliance --1/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,1 << Horde --1/3 Disable runes holding Warlord Thunderwalker
step
    .goto 1409,39.73,32.04
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Ogre 符文tone|r以禁用它
    .complete 55990,4,2 << Alliance --2/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,2 << Horde --2/3 Disable runes holding Warlord Thunderwalker
step
    .goto 1409,40.07,31.96
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Ogre 符文tone|r以禁用它
    .complete 55990,4,3 << Alliance --3/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,3 << Horde --3/3 Disable runes holding Warlord Thunderwalker
step << Alliance
    .goto 1409,39.93,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kelra|r交谈
    .turnin 55990 >>交任务: |cRXP_FRIENDLY_控制他们的石头|r
    .accept 55992 >>接任务: |cRXP_WARN_地下城：暗槌堡垒|r
	.target Captain Kelra
step << Horde
    .goto 1409,39.93,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mulgrin|r交谈
    .turnin 59981 >>交任务: |cRXP_FRIENDLY_控制他们的石头|r
    .accept 59984 >>接任务: |cRXP_WARN_地下城：暗槌堡垒|r
	.target Warlord Mulgrin Thunderwalker
step
    >>|cRXP_WARN_打开团队查找器(默认键:I), 并排队进入“暗爪要塞”|r
    .complete 55992,1 << Alliance --Use the Group Finder to enter the dungeon, "Darkmaul Citadel"
    .complete 59984,1 << Horde --Use the Group Finder to enter the dungeon, "Darkmaul Citadel"
step
    >>通过击杀最终的|cRXP_ENEMY_Ravnyr|r来清除地牢
    .complete 55992,2 << Alliance --1/1 Gor'groth's final ritual stopped
    .complete 59984,2 << Horde --1/1 Gor'groth's final ritual stopped
step << Alliance
    >>|cRXP_WARN_点击地下城查找器的眼睛图标或你的角色头像, 然后选择“离开副本队伍”. 这样更快|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t或者, 与队长|cRXP_FRIENDLY_Garrick|r交谈
    .complete 55992,3 --1/1 Speak with Captain Garrick to leave Darkmaul Citadel
	.target Captain Garrick
step << Horde
    >>|cRXP_WARN_点击地下城查找器的眼睛图标或你的角色头像, 然后选择“离开副本队伍”. 这样更快|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t或者, 与|cRXP_FRIENDLY_Breka|r交谈
    .complete 59984,3 --1/1 Speak with Warlord Grimaxe to leave Darkmaul Citadel
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 55992 >>交任务: |cRXP_FRIENDLY_地下城：暗槌堡垒|r
	.target Captain Garrick
step << Horde
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59984 >>交任务: |cRXP_FRIENDLY_地下城：暗槌堡垒|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .accept 55991 >>接任务: |cRXP_WARN_终结与开始|r
	.target Captain Garrick
    .zoneskip 84
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .goto 1409,39.65,31.99
    .accept 59985 >>接任务: |cRXP_WARN_终结与开始|r
    .zoneskip 85
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,40.37,32.63
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_Gryphon|r骑乘前往暴风城. 等待剧情演出结束
    .complete 55991,1 --1/1 Alliance Gryphon rode back to Stormwind
	.isOnQuest 55991
    .target Alliance Gryphon
step << Horde
    .goto 1409,40.37,32.63
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_双足飞龙|r骑乘前往奥格瑞玛. 等待剧情演出结束
    .complete 59985,1 --1/1 Horde Wyvern rode back to Orgrimmar
    .isOnQuest 59985
    .target Horde Wyvern
step << Alliance
    .goto 84,73.70,91.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
    .turnin 55991 >>交任务: |cRXP_FRIENDLY_终结与开始|r
	.target Captain Garrick
    .isOnQuest 55991
step << Horde
    .goto 85,52.52,88.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 59985 >>交任务: |cRXP_FRIENDLY_终结与开始|r
	.target Warlord Breka Grimaxe
	.isOnQuest 59985
step << Alliance
    .goto 84,73.70,91.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Garrick|r 交谈. |cRXP_WARN_Skip the Tutorial if you can|r
	.accept 59583 >>接任务: |cRXP_WARN_欢迎来到暴风城|r
	.target Captain Garrick
	.skipgossip 154169,1
step << Alliance
    .goto 84,70.15,85.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lindie Springstock|r交谈
    .turnin 59583 >>交任务: |cRXP_FRIENDLY_欢迎来到暴风城|r
	.target Lindie Springstock
    .isOnQuest 59583
step << Alliance
    .goto 84,70.15,85.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lindie Springstock|r交谈
    .accept 58908 >>接任务: |cRXP_WARN_找到你的道路|r
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暴风城卫兵|r交谈
    .complete 58908,1 --1/1 Ask a guard for directions to the Stable Master in Old Town
    .goto 84,70.29,83.60
    .skipgossipid 109407
    .target Stormwind City Guard
step << Alliance
    .goto 84,70.04,83.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lindie Springstock|r交谈
    .complete 58908,2 --1/1 Speak with Lindie Springstock
    .timer 115,RP
    .skipgossip
	.target Lindie Springstock
	-- .skipgossip 68,15,1
	-- .skipgossip 1976,15,1
	-- .skipgossip 163095,1
    .isQuestTurnedIn 59583
-- step << Alliance
--     .goto 84,70.28,79.83,20,0
--     .goto 84,67.72,80.03,30,0
--     .goto 84,63.77,73.59
--     >>|cRXP_WARN_跟随|r|cRXP_FRIENDLY_琳迪|r. |cRXP_WARN_请靠近他, 否则他会停止移动|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
--     .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
-- 	.target Lindie Springstock
-- 	.target Renato Gallina
--     .isQuestTurnedIn 59583
step << Alliance
    .goto 84,64.28,70.36,20,0
    .goto 84,64.89,68.42,20,0
    .goto 84,64.24,66.74,20,0
    .goto 84,66.12,64.00,20,0
    .goto 84,67.03,64.75,20,0
    .goto 84,69.12,62.19,20,0
    .goto 84,70.36,62.03,20,0
    .goto 84,71.89,60.40,20,0
    .goto 84,73.08,62.03,20,0
    .goto 84,76.42,64.84,20,0
    .goto 84,77.41,65.91,20,0
    .goto 84,77.29,66.95
    >>等待抵达马厩
    .complete 58908,3 --1/1 Follow Lindie Springstock to the Stable Master in Old Town
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,77.29,66.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Curly|r交谈
    .turnin 58908 >>交任务: |cRXP_FRIENDLY_找到你的道路|r
step << Alliance
    #completewith Specialization
    +|cRXP_WARN_将坐骑从坐骑日志移动到快捷栏(默认:SHIFT+P). 使用该坐骑可提升移动速度|r
    .isQuestTurnedIn 59583
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与身旁的|cRXP_FRIENDLY_林迪·斯普林斯托克|r|cRXP_WARN_| 交谈
    .accept 58910 >>接任务: |cRXP_WARN_你的专精是什么？|r << Druid
    .accept 59586 >>接任务: |cRXP_WARN_你的专精是什么？|r << Hunter
    .accept 59587 >>接任务: |cRXP_WARN_你的专精是什么？|r << Mage
    .accept 59588 >>接任务: |cRXP_WARN_你的专精是什么？|r << Monk
    .accept 59589 >>接任务: |cRXP_WARN_你的专精是什么？|r << Paladin
    .accept 59590 >>接任务: |cRXP_WARN_你的专精是什么？|r << Priest
    .accept 59591 >>接任务: |cRXP_WARN_你的专精是什么？|r << Rogue
    .accept 59592 >>接任务: |cRXP_WARN_你的专精是什么？|r << Shaman
    .accept 59593 >>接任务: |cRXP_WARN_你的专精是什么？|r << Warlock
    .accept 59594 >>接任务: |cRXP_WARN_你的专精是什么？|r << Warrior
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    .isOnQuest 58910,59593,59594,59592,59591,59590,59589,59588,59587,59586
    .goto 84,79.54,68.76,10 >>进入房屋
step << Alliance Druid
	#label Specialization
    .goto 84,78.81,71.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithlos Falconbriar|r交谈
    .complete 58910,1 --1/1 Speak with Mithlos Falconbriar to learn about specializations
    .complete 58910,2 --1/1 Activate a combat specialization
	.target Mithlos Falconbriar
	.skipgossip 164962,1
    .isQuestTurnedIn 59583
step << Alliance Druid
    .goto 84,78.81,71.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mithlos Falconbriar|r交谈
    .turnin 58910 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Mithlos Falconbriar
    .isQuestTurnedIn 59583
step << Alliance Hunter
	#label Specialization
    .goto 84,79.13,71.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔格伦·钢松|r交谈
    .complete 59586,1 --1/1 Speak with Dalgrun Steelpine to learn about specializations
    .complete 59586,2 --1/1 Activate a combat specialization
	.target Dalgrun Steelpine
	.skipgossip 164960,1
    .isQuestTurnedIn 59583
step << Alliance Hunter
    .goto 84,79.13,71.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达尔格伦·钢松|r交谈
    .turnin 59586 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Dalgrun Steelpine
    .isQuestTurnedIn 59583
step << Alliance Mage
	#label Specialization
    .goto 84,80.02,69.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Frazzle Frostfingers|r交谈
    .complete 59587,1 --1/1 Speak with Frazzle Frostfingers to learn about specializations
    .complete 59587,2 --1/1 Activate a combat specialization
	.target Frazzle Frostfingers
	.skipgossip 164955,1
    .isQuestTurnedIn 59583
step << Alliance Mage
    .goto 84,80.02,69.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Frazzle Frostfingers|r交谈
    .turnin 59587 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Frazzle Frostfingers
    .isQuestTurnedIn 59583
step << Alliance Monk
	#label Specialization
    .goto 84,79.59,70.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Juisheng 残爪|r交谈
    .complete 59588,1 --1/1 Speak with Juisheng Halfclaw to learn about specializations
    .complete 59588,2 --1/1 Activate a combat specialization
	.target Juisheng Halfclaw
	.skipgossip 164954,1
    .isQuestTurnedIn 59583
step << Alliance Monk
    .goto 84,79.59,70.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Juisheng 残爪|r交谈
    .turnin 59588 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Juisheng Halfclaw
    .isQuestTurnedIn 59583
step << Alliance Paladin
	#label Specialization
    .goto 84,79.32,70.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Ezul'aan|r交谈
    .complete 59589,1 --1/1 Speak with Ezul'aan to learn about specializations
    .complete 59589,2 --1/1 Activate a combat specialization
	.target Ezul'aan
	.skipgossip 164952,1
    .isQuestTurnedIn 59583
step << Alliance Paladin
    .goto 84,79.32,70.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Ezul'aan|r交谈
    .turnin 59589 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Ezul'aan
    .isQuestTurnedIn 59583
step << Alliance Priest
	#label Specialization
    .goto 84,79.8,70.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里丝·兰卡斯特|r交谈
    .complete 59590,1 --1/1 Speak with Patrice Lancaster to learn about specializations
    .complete 59590,2 --1/1 Activate a combat specialization
	.target Patrice Lancaster
	.skipgossip 164949,1
    .isQuestTurnedIn 59583
step << Alliance Priest
    .goto 84,79.8,70.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特里丝·兰卡斯特|r交谈
    .turnin 59590 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Patrice Lancaster
    .isQuestTurnedIn 59583
step << Alliance Rogue
	#label Specialization
    .goto 84,79.27,70.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Veruca Darkstream|r交谈
    .complete 59591,1 --1/1 Speak with Patrice Lancaster to learn about specializations
    .complete 59591,2 --1/1 Activate a combat specialization
	.target Veruca Darkstream
	.skipgossip 164946,1
    .isQuestTurnedIn 59583
step << Alliance Rogue
    .goto 84,79.27,70.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Veruca Darkstream|r交谈
    .turnin 59591 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Veruca Darkstream
    .isQuestTurnedIn 59583
step << Alliance Shaman
	#label Specialization
    .goto 84,78.72,70.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Mulric Boldrock|r 交谈
    .complete 59592,1 --1/1 Speak with Mulric Boldrock to learn about specializations
    .complete 59592,2 --1/1 Activate a combat specialization
	.target Mulric Boldrock
	.skipgossip 164945,1
    .isQuestTurnedIn 59583
step << Alliance Shaman
    .goto 84,78.72,70.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Mulric Boldrock|r 交谈
    .turnin 59592 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Mulric Boldrock
    .isQuestTurnedIn 59583
step << Alliance Warrior
	#label Specialization
    .goto 84,80.02,70.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库拉扬·雷拳|r交谈
    .complete 59594,1 --1/1 Speak with Kualiang Thunderfist to learn about specializations
    .complete 59594,2 --1/1 Activate a combat specialization
	.target Kualiang Thunderfist
	.skipgossip 164940,1
    .isQuestTurnedIn 59583
step << Alliance Warrior
    .goto 84,80.02,70.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库拉扬·雷拳|r交谈
    .turnin 59594 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Kualiang Thunderfist
    .isQuestTurnedIn 59583
step << Alliance Warlock
	#label Specialization
    .goto 84,80.12,69.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Laphandrus Voidheart|r交谈
    .complete 59593,1 --1/1 Speak with Laphandrus Voidheart to learn about specializations
    .complete 59593,2 --1/1 Activate a combat specialization
	.target Laphandrus Voidheart
	.skipgossip 164941,1
    .isQuestTurnedIn 59583
step << Alliance Warlock
    .goto 84,80.12,69.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Laphandrus Voidheart|r交谈
    .turnin 59593 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Laphandrus Voidheart
    .isQuestTurnedIn 59583
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与身旁的|cRXP_FRIENDLY_Lindie Springstock|r|cRXP_WARN_交谈
    .accept 58911 >>接任务: |cRXP_WARN_炉石所在便是家|r
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,76.34,64.55,25,0
    .goto 84,75.11,55.32,15,0
    .goto 84,75.69,54.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅根·提尔曼|r交谈
    .complete 58911,1 --1/1 Make the Pig and Whistle Tavern your home
step << Alliance
    .goto 84,75.69,54.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅根·提尔曼|r交谈
    .home >>将你的炉石设置为猪和哨声旅店
    .turnin 58911 >>交任务: |cRXP_FRIENDLY_炉石所在便是家|r
	.target Maegan Tillman
	.isOnQuest 58911
    .isQuestTurnedIn 59583
-- step << Alliance
--     .goto 84,75.25,54.31
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Henry Garrick|r交谈
--     .accept 58912 >>接任务: |cRXP_WARN_紧急会议|r
-- 	.target Henry Garrick
--     .isQuestTurnedIn 59583
-- step << Alliance
-- 	#completewith next
--     .goto 84,71.45,55.76,20,0
--     .goto 84,70.05,52.73,20,0
--     .goto 84,80.66,37.87,20,0
--     .goto 84,85.22,32.07,40 >>前往暴风要塞
-- -- step << skip
-- --     .goto 84,85.22,32.06
-- --     .complete 58912,2 --1/1 Find Captain Garrick in Stormwind Keep
-- --     .isQuestTurnedIn 59583
-- step << Alliance
--     .goto 84,85.22,32.06
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迦里克|r交谈
--     .turnin 58912 >>交任务: |cRXP_FRIENDLY_紧急会议|r
--     .accept 58983 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
-- 	.timer 58,BFA: Tides of War RP
-- 	.target Captain Garrick
--     .isQuestTurnedIn 59583
-- step << Alliance
--     .goto 84,85.92,31.57
--     >>等待RP结束
-- 	.timer 45,War Council Roleplay
--     .complete 58983,1 --1/1 Attend the War Council
--     .isOnQuest 58983
-- step << Alliance
--     .goto 84,85.92,31.57
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Anduin|r交谈
--     .turnin 58983 >>交任务: |cRXP_FRIENDLY_争霸艾泽拉斯：战争之潮|r
-- 	.accept 59641 >>接任务: |cRXP_WARN_库尔提拉斯王国|r
-- 	.target Anduin Wrynn
--     .isOnQuest 58983
step << Horde
    .goto 85,52.52,88.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈. |cRXP_WARN_ 如果可以的话, 跳过教程|r
    .accept 60343 >>接任务: |cRXP_WARN_欢迎来到奥格瑞玛|r
	.target Warlord Breka Grimaxe
    .skipgossip 168431,1
step << Horde
    .goto 85,52.51,88.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布蕾卡|r交谈
    .turnin 63219 >>如果可能, 请跳过教程；否则, 跳过此步骤
	.target Warlord Breka Grimaxe
    .skipgossip 168431,1
--VV review these steps. Need to make sure they can differentiate between new/veteran accounts and autoskip correctly based on each
step << Horde
    .goto 85,51.93,85.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cork|r交谈
    .turnin 60343 >>交任务: |cRXP_FRIENDLY_欢迎来到奥格瑞玛|r
    .accept 60344 >>接任务: |cRXP_WARN_找到你的道路|r
    .target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥格瑞玛步兵|r和|cRXP_FRIENDLY_Cork|r交谈
    .complete 60344,1 --1/1 Ask a guard for directions to the Stable Master
    .goto 85,52.48,84.18
    .complete 60344,2 --1/1 Speak with Cork Fizzlepop
    .timer 100,Ride Duration
    .goto 85,52.25,84.42
    .skipgossip 168441,1
    .skipgossipid 109405
    .isQuestAvailable 63219
	.target Orgrimmar Grunt
	.target Cork Fizzlepop
step << Horde
    .goto 85,62.06,33.33
    >>|cRXP_WARN_骑乘|r|cRXP_FRIENDLY_Cork|r
    .complete 60344,3 --1/1 Ride with Cork Fizzlepop to the Stables
	.target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    .goto 85,71.57,47.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗哈卡|r交谈
    .turnin 60344 >>交任务: |cRXP_FRIENDLY_找到你的道路|r
step << Horde
	#label UseMount
	#completewith Specialize
	.cast 55884 >>使用背包中的坐骑学习它
	.use 87800 << Pandaren
    .use 25474 << Pandaren
    .isQuestAvailable 63219
--VV CHANGE TO OTHER RACES LATER. MUST DO THE QUEST/FIND A WAY TO FIND ALL MOUNT IDS FOR EACH RACE
--PRMK Cast ID is the same regardless of the mount. Will level through Exile's Reach with each race when I have the time for it.
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cork|r交谈
    .goto 85,61.46,32.90
    .accept 60347 >>接任务: |cRXP_WARN_你的专精是什么？|r << Hunter
    .accept 60353 >>接任务: |cRXP_WARN_你的专精是什么？|r << Shaman
    .accept 60357 >>接任务: |cRXP_WARN_你的专精是什么？|r << Warrior
    .accept 60348 >>接任务: |cRXP_WARN_你的专精是什么？|r << Mage
    .accept 60352 >>接任务: |cRXP_WARN_你的专精是什么？|r << Rogue
    .accept 60355 >>接任务: |cRXP_WARN_你的专精是什么？|r << Warlock
    .accept 60350 >>接任务: |cRXP_WARN_你的专精是什么？|r << Paladin
    .accept 60349 >>接任务: |cRXP_WARN_你的专精是什么？|r << Monk
    .accept 60351 >>接任务: |cRXP_WARN_你的专精是什么？|r << Priest
    .accept 60346 >>接任务: |cRXP_WARN_你的专精是什么？|r << Druid
	.target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
	#requires UseMount
    #completewith next
    +|cRXP_WARN_将坐骑从坐骑日志移动到快捷栏(默认:SHIFT+P). 使用该坐骑可提升移动速度|r
    .isQuestAvailable 63219
step << Horde Druid
    #label Specialize
    .goto 85,72.92,43.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛莎|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60346,1 --1/1 Speak with Telotha Pinegrove to learn about specializations
    .complete 60346,2 --1/1 Activate a combat specialization
	.target Telotha Pinegrove
    .skipgossip 168553,1
    .isQuestAvailable 63219
step << Horde Druid
    .goto 85,72.92,43.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔洛莎|r交谈
    .turnin 60346 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Telotha Pinegrove
    .isQuestAvailable 63219
step << Horde Hunter
    #label Specialize
    .goto 85,73.89,43.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔曼吉|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60347,1 --1/1 Speak with Tamanji to learn about specializations
    .complete 60347,2 --1/1 Activate a combat specialization
	.target Tamanji
    .skipgossip 168551,1
    .isQuestAvailable 63219
step << Horde Hunter
    .goto 85,73.89,43.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔曼吉|r交谈
    .turnin 60347 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Tamanji
    .isQuestAvailable 63219
step << Horde Warrior
    #label Specialize
    .goto 85,73.76,47.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gormok|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60357,1 --1/1 Speak with Gormok Ogrefist to learn about specializations
    .complete 60357,2 --1/1 Activate a combat specialization
	.target Gormok Ogrefist
    .skipgossip 168596,1
    .isQuestAvailable 63219
step << Horde Warrior
    .goto 85,73.76,47.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gormok|r交谈
    .turnin 60357 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Gormok Ogrefist
    .isQuestAvailable 63219
step << Horde Shaman
    #label Specialize
    .goto 85,73.41,43.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Hretar|r 交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60353,1 --1/1 Speak with Hretar Riverspeaker to learn about specializations
    .complete 60353,2 --1/1 Activate a combat specialization
	.target Hretar Riverspeaker
    .skipgossip 168628,1
    .isQuestAvailable 63219
step << Horde Shaman
    .goto 85,73.41,43.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Hretar|r 交谈
    .turnin 60353 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Hretar Riverspeaker
    .isQuestAvailable 63219
step << Horde Priest
    #label Specialize
    .goto 85,72.64,46.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Martin|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60351,1 --1/1 Speak with Martin Goodchilde to learn about specializations
    .complete 60351,2 --1/1 Activate a combat specialization
	.target Martin Goodchilde
    .skipgossip 168621,1
    .isQuestAvailable 63219
step << Horde Priest
    .goto 85,72.64,46.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Martin|r交谈
    .turnin 60351 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Martin Goodchilde
    .isQuestAvailable 63219
step << Horde Paladin
    #label Specialize
    .goto 85,73.19,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Avaros|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60350,1 --1/1 Speak with Avaros Dawnglaive to learn about specializations
    .complete 60350,2 --1/1 Activate a combat specialization
	.target Avaros Dawnglaive
    .skipgossip 168597,1
    .isQuestAvailable 63219
step << Horde Paladin
    .goto 85,73.19,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Avaros|r交谈
    .turnin 60350 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Avaros Dawnglaive
    .isQuestAvailable 63219
step << Horde Mage
    #label Specialize
    .goto 85,74.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feenix|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60348,1 --1/1 Speak with Feenix Arcshine to learn about specializations
    .complete 60348,2 --1/1 Activate a combat specialization
	.target Feenix Arcshine
    .skipgossip 168626,1
    .isQuestAvailable 63219
step << Horde Mage
    .goto 85,74.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Feenix|r交谈
    .turnin 60348 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Feenix Arcshine
    .isQuestAvailable 63219
step << Horde Monk
    #label Specialize
    .goto 85,75.69,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Huinli|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60349,1 --1/1 Speak with Huinli Wingpaw to learn about specializations
    .complete 60349,2 --1/1 Activate a combat specialization
	.target Huinli Wingpaw
    .skipgossip 168619,1
    .isQuestAvailable 63219
step << Horde Monk
    .goto 85,75.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Huinli|r交谈
    .turnin 60349 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Huinli Wingpaw
    .isQuestAvailable 63219
step << Horde Rogue
    #label Specialize
    .goto 85,75.47,47.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thega|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60352,1 --1/1 Speak with Huinli Wingpaw to learn about specializations
    .complete 60352,2 --1/1 Activate a combat specialization
	.target Thega Graveblade
    .skipgossip 168598,1
    .isQuestAvailable 63219
step << Horde Rogue
    .goto 85,75.47,47.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thega|r交谈
    .turnin 60352 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Thega Graveblade
    .isQuestAvailable 63219
step << Horde Warlock
    #label Specialize
    .goto 85,74.63,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kazak|r交谈
    >>|cRXP_WARN_按下N键并选择一个专精|r
    .complete 60355,1 --1/1 Speak with Kazak Darkscream to learn about specializations
    .complete 60355,2 --1/1 Activate a combat specialization
	.target Kazak Darkscream
    .skipgossip 168623,1
    .isQuestAvailable 63219
step << Horde Warlock
    .goto 85,74.63,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kazak|r交谈
    .turnin 60355 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Kazak Darkscream
    .isQuestAvailable 63219
step << Horde
    #label HordeERIntroBrekaGrommashHold
    .goto 85,73.29,45.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cork|r交谈
    .accept 60359 >>接任务: |cRXP_WARN_炉石所在便是家|r
	.target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    .goto 85,70.37,49.01,15,0
    .goto 85,71.31,49.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nufa|r交谈
	.home >>将你的[炉石]设置为“飞龙之尾”
    .complete 60359,1 --1/1 Make The Wyvern's Tail your home
    .turnin 60359 >>交任务: |cRXP_FRIENDLY_炉石所在便是家|r
	.target Innkeeper Nufa
    .isOnQuest 60359
]])

--Death Knight Plaguelands The Scarlet Enclave
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 死亡骑士入门
#displayname |cFF00CCFF1|r - 瘟疫之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde


<< DK !Pandaren !KulTiran !DarkIronDwarf !LightforgedDraenei !Mechagnome !VoidElf !HighmountainTauren !ZandalariTroll !夜之子 !Vulpera !MagharOrc

step
    .goto 124,51.33,35.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .accept 12593 >>接任务: |cRXP_LOOT_为巫妖王而战|r
    .target The Lich King
step
    .goto 124,47.59,28.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_.|cRXP_FRIENDLY_教官拉苏维奥斯|r.|cRXP_WARN_从左到右来回走动的|r.交谈
    .turnin 12593 >>交任务: |cRXP_FRIENDLY_为巫妖王而战|r
    .accept 12619 >>接任务: |cRXP_LOOT_符文之剑|r
    .target Instructor Razuvious
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击该区域发现的|cRXP_PICK_破旧的长剑|r
    .collect 38607,1
step
    .goto 124,47.88,27.54
    >>|cRXP_WARN_前往符文熔炉|r并使用 |T135410:0|t[破旧的长剑]
    .complete 12619,1 --1/1 Runebladed Sword
    .use 38607
step
    .goto 124,47.59,28.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12619 >>交任务: |cRXP_FRIENDLY_符文之剑|r
    .accept 12842 >>接任务: |cRXP_LOOT_符文熔铸：战争的准备|r
    .target Instructor Razuvious
step
    .goto 124,47.88,27.54
    >>|cRXP_WARN_前往符文熔炉|r, 打开你的法术书, 并在你的武器上使用[附魔剃刀冰]
    .complete 12842,1 --Weapon emblazoned (1)
step
    .goto 124,47.59,28.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12842 >>交任务: |cRXP_FRIENDLY_符文熔铸：战争的准备|r
    .accept 12848 >>接任务: |cRXP_LOOT_无尽的饥渴|r
    .target Instructor Razuvious
step
    .goto 124,48.59,28.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Acherus Soul Prison|r以解救一名|cRXP_ENEMY_Initiate|r
    .complete 12848,1 --1/1 Unworthy Initiate dominated
    .mob Unworthy Initiate
step
    .goto 124,47.69,29.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12848 >>交任务: |cRXP_FRIENDLY_无尽的饥渴|r
    .accept 12636 >>接任务: |cRXP_LOOT_阿彻鲁斯之眼|r
    .target Instructor Razuvious
step
    .goto 124,51.35,35.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .turnin 12636 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯之眼|r
    .accept 12641 >>接任务: |cRXP_LOOT_天降厄运|r
    .target The Lich King
step
    .goto 124,51.04,36.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_阿彻鲁斯之眼控制台|r
    >>使用 |T136158:0|t[Siphon of Acherus](1)|cRXP_WARN_靠近红箭头|r|cRXP_WARN_(不要太近, 否则会触发攻击, 范围45码)|r进行分析
    >>使用 |T136187:0|t[召唤食尸鬼](2) 来吸引骑士的注意力
    >>使用[裹尸布](3)隐藏|cRXP_WARN_(可在行走时使用)|r
    >>完成后使用 |T136190:0|t[召回阿彻鲁斯之眼] (4)
    .complete 12641,1 --1/1 New Avalon Forge Analyzed
    .complete 12641,3 --1/1 Scarlet Hold Analyzed
    .complete 12641,2 --1/1 New Avalon Town Hall Analyzed
    .complete 12641,4 --1/1 Chapel of the Crimson Flame Analyzed
step
    .goto 124,51.34,35.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r对话, 并按 (4) 键离开眼球
    .turnin 12641 >>交任务: |cRXP_FRIENDLY_天降厄运|r
    .accept 12657 >>接任务: |cRXP_LOOT_天灾的力量|r
    .target The Lich King
step
    .goto 124,50.43,33.2,10,0
    .goto 124,48.88,29.75
    >>踏上紫色传送器
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12657 >>交任务: |cRXP_FRIENDLY_天灾的力量|r
    .accept 12850 >>接任务: |cRXP_LOOT_向天灾指挥官萨拉诺尔报到|r
    .target Highlord Darion Mograine
step
    .goto 124,47.47,26.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索瓦尔勋爵|r交谈
    .turnin 12849 >>交任务: |cRXP_FRIENDLY_鲜血、冰霜与邪恶的力量|r
    .target Lord Thorval
step
    .goto 124,50.68,34.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在阳台巡逻的天灾指挥官萨拉诺尔(|cRXP_FRIENDLY_Scourge Commander Thalanor|r)对话
    .turnin 12850 >>交任务: |cRXP_FRIENDLY_向天灾指挥官萨拉诺尔报到|r
    .accept 12670 >>接任务: |cRXP_LOOT_血色收割|r
step
    #fresh
    .goto 124,52.08,35.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击阳台上的|cRXP_FRIENDLY_天灾狮鹫|r|cRXP_WARN_on
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12670 >>交任务: |cRXP_FRIENDLY_血色收割|r
    .accept 12678 >>接任务: |cRXP_LOOT_混乱战车，苦痛驭之|r
    .target Prince Valanar
step
    #veteran
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击阳台上的|cRXP_FRIENDLY_天灾狮鹫|r|cRXP_WARN_on
    >>|cRXP_WARN_你已经可以骑乘了, 无需等待解锁死亡骑士坐骑|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .goto 124,52.08,35.04
    .turnin 12670 >>交任务: |cRXP_FRIENDLY_血色收割|r
    .accept 12678 >>接任务: |cRXP_LOOT_混乱战车，苦痛驭之|r
    .target Prince Valanar
step
    .goto 124,52.67,34.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在街上巡逻的|cRXP_WARN_骑手萨拉纳尔|r交谈
    .accept 12680 >>接任务: |cRXP_LOOT_阿彻鲁斯战马|r
    .target Salanar the Horseman
step
    .goto 124,54.44,33.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战斗召唤者奥尔伦|r交谈
    .accept 12733 >>接任务: |cRXP_LOOT_死亡的挑战|r
    .target Olrun the Battlecaller
step
    .goto 124,52.79,34.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与该区域发现的|r死亡骑士新兵|r交谈, 并与其进行一场决斗, 击败他们
    .complete 12733,1 --5/5 Death Knights defeated in a duel
    .skipgossip
    .mob Death Knight Initiate
step
    .goto 124,52.31,38.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_遮天者奥里索斯|r, 他会在附近巡逻
    .accept 12679 >>接任务: |cRXP_LOOT_今夜，我们在海文郡欢宴！|r
    .target Orithos the Sky Darkener
step
    #completewith arrowspart2time
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的箭头|cRXP_WARN_on|r
    .complete 12679,1 --15/15 Saronite Arrow
step
    #completewith next
    .goto 124,55.25,46.16,10,0
    .goto 124,54.11,52.21
    >>击杀|r|cRXP_ENEMY_Crusaders| 和|cRXP_ENEMY_Citizens
    .complete 12678,1 --10/10 Scarlet Crusader slain
    .complete 12678,2 --10/10 Citizen of Havenshire slain
    .target Scarlet Crusader
    .target Citizen of Havenshire
step
    goto 124,55.25,46.16
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击邮箱上的 |cRXP_PICK_被丢弃的信件|r |cRXP_WARN_提示|r
    .turnin 12711 >>交任务: |cRXP_FRIENDLY_被遗弃的信件|r
step
    #label arrowspart2time
    .goto 124,55.25,46.16,10,0
    .goto 124,54.11,52.21
    >>击杀|r|cRXP_ENEMY_Crusaders| 和|cRXP_ENEMY_Citizens
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
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的箭头|cRXP_WARN_on|r
    .complete 12679,1 --15/15 Saronite Arrow
step
    #requires Area1
    .goto 124,55.4,41.6,30,0
    .goto 124,51.41,41.09,30,0
    .goto 124,52.83,34.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|r|cRXP_FRIENDLY_马|r互动, 注意避开|r|cRXP_ENEMY_马厩管理员基特里克|r
    >>使用 |T135788:0|t[疾驰](2) 以提升移动速度, 并在你位于巡逻于|cRXP_WARN_街道|r的|cRXP_FRIENDLY_骑手萨拉纳尔|r前方时, 交付 |T132261:0|t[偷来的马](1)
    .complete 12680,1 --1/1 Horse Successfully Stolen
    .target Salanar the Horseman
step
    .goto 124,53.00,33.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_骑手萨拉纳尔|r交谈
    .turnin 12680 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯战马|r
    .accept 12687 >>接任务: |cRXP_LOOT_进入暗影界|r
    .target Salanar the Horseman
step
    .goto 124,55.4,41.6,30,0
    .goto 124,51.16,37.82
    >>Kill a |cRXP_ENEMY_Dark Rider of Acherus|r |cRXP_WARN_near the stables|r and |TInterface/cursor/crosshair/interact.blp:20|tInteract with the horse
    >>使用 |T136129:0|t[骑士之召], 回到城镇后交付马|cRXP_WARN_一次|r
    .complete 12687,1
step
    .goto 124,51.84,35.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_骑手萨拉纳尔|r交谈
    .turnin 12687 >>交任务: |cRXP_FRIENDLY_进入暗影界|r
    .target Salanar the Horseman
step
    .goto 124,52.43,37.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻的|cRXP_FRIENDLY_遮天者奥里索斯|r谈话
    .turnin 12679,1 >>交任务: |cRXP_FRIENDLY_今夜，我们在海文郡欢宴！|r
    .target Orithos the Sky Darkener
step
    .goto 124,54.60,33.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战斗召唤者奥尔伦|r交谈
    .turnin 12733 >>交任务: |cRXP_FRIENDLY_死亡的挑战|r
    .target Olrun the Battlecaller
step
    .goto 124,52.28,34.00|cRXP_WARN_|r.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12678 >>交任务: |cRXP_FRIENDLY_混乱战车，苦痛驭之|r
    .accept 12697 >>接任务: |cRXP_LOOT_收割者戈提克|r
    .target Prince Valanar
step
    .goto 124,54.09,35.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_收割者戈提克|r交谈
    .turnin 12697 >>交任务: |cRXP_FRIENDLY_收割者戈提克|r
    .accept 12698 >>接任务: |cRXP_LOOT_收割者的礼物|r
    .target Gothik the Harvester
step
    #completewith next
    +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
    *[1] Press the |cRXP_WARN_Escape key|r.
    *[2] Select |cRXP_WARN_Options|r.
    *[3] Navigate to |cRXP_WARN_Keybindings|r.
    *[4] Within |cRXP_WARN_Keybindings|r,find |cRXP_WARN_RestedXP Guides|r.
    *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
step
    .goto 124,58.27,30.98,5,0
    --x insert more goto's
    >>使用 |T133882:0|t[收割者的礼物] 对 |cRXP_ENEMY_矿工|r施放, 直到有 [5] 个 |cRXP_FRIENDLY_被控制的血色矿工|r跟随你, 然后返回至 |cRXP_FRIENDLY_收割者戈提克|r
    >>|cRXP_WARN_矿工并不总是会变成被控制的血色矿工|r|r
    .complete 12698,1 --5/5 Scarlet Ghoul Returned
    .use 39253
    .mob Scarlet Ghoul
    .mob Scarlet Infantryman
    .target Gothik the Harvester
step
    .goto 124,54.07,35.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_收割者戈提克|r交谈
    .turnin 12698 >>交任务: |cRXP_FRIENDLY_收割者的礼物|r
    .accept 12700 >>接任务: |cRXP_LOOT_伺机待发|r
    .target Gothik the Harvester
step
    .goto 124,52.28,33.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12700 >>交任务: |cRXP_FRIENDLY_伺机待发|r
    .accept 12701 >>接任务: |cRXP_LOOT_炮轰圣光哨站|r
    .target Prince Valanar
step
    .goto 124,67.78,39.25
    >>|cRXP_WARN_前往船只, 尽量避开尽可能多的敌人|r.
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cannon|r, 并使用 (1) 攻击敌人, 若敌人逼近则使用 (2), 使用 (3) 逃离
    .complete 12701,1 --100/100 Scarlet Defender slain
    .mob Scarlet Defender
step
    .goto 124,52.28,33.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12701 >>交任务: |cRXP_FRIENDLY_炮轰圣光哨站|r
    .accept 12706 >>接任务: |cRXP_LOOT_死亡裂口大捷！|r
    .target Prince Valanar
step
    #completewith next
    .hs >>天灾石传送至阿彻鲁斯|cRXP_WARN_(不要使用炉石玩具！)|r
step
    .goto 124,50.43,33.23,10,0
    .goto 124,48.87,29.75
    >>踏上紫色传送器
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12706 >>交任务: |cRXP_FRIENDLY_死亡裂口大捷！|r
    .accept 12714 >>接任务: |cRXP_LOOT_巫妖王的意志|r
    .target Highlord Darion Mograine
step
    .goto 124,53.46,36.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|r互动
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12714 >>交任务: |cRXP_FRIENDLY_巫妖王的意志|r
    .accept 12715 >>接任务: |cRXP_LOOT_追忆墓穴|r
    .target Skeleton Gryphon
    .target Prince Valanar
step
    .goto 124,55.91,52.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瘟疫使者诺斯|r交谈
    .accept 12716 >>接任务: |cRXP_LOOT_药剂师的要求|r
    .target Noth the Plaguebringer
step
    .goto 124,54.06,58.14,10 >>|cRXP_WARN_进入地底墓穴|r
step
    .goto 124,54.30,57.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯雷塞斯王子|r交谈
    .turnin 12715 >>交任务: |cRXP_FRIENDLY_追忆墓穴|r
    .accept 12719 >>接任务: |cRXP_LOOT_无路可逃，无处可藏|r
    .target Prince Keleseth
step
    .goto 124,54.66,57.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞文戴尔男爵|r交谈
    .accept 12722 >>接任务: |cRXP_LOOT_羊入虎口|r
    .target Baron Rivendare
step
    #completewith citizenrequirementtime
    >>击杀|cRXP_ENEMY_血色十字军战士|r和|cRXP_ENEMY_市民|r并从他们身上搜刮 [|cRXP_LOOT_十字军徽记|r]
    .complete 12722,1 --10/10 Scarlet Crusade Soldier slain
    .complete 12716,3 --10/10 Crusader Skull
    .complete 12722,2 --15/15 Citizen of New Avalon slain
    .mob Scarlet Crusade Soldier
    .mob Citizen of New Avalon
step
    .goto 124,52.61,71.72
    >>杀死|cRXP_ENEMY_奎比镇长|r|cRXP_WARN_在市政厅内|r
    .complete 12719,1 --1/1 Mayor Quimby slain
    .mob Mayor Quimby
step
    .goto 124,52.46,71.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_书|r
    .complete 12719,2 --1/1 New Avalon Registry
step
    .goto 124,57.77,61.90
    >>|cRXP_WARN_进入酒馆, 然后前往地下室|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_空锅|r
    .complete 12716,1 --1/1 Empty Cauldron
step
    #label citizenrequirementtime
    .goto 124,62.03,60.24
    >>|cRXP_WARN_进入铁匠铺|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_铁链|r
    .complete 12716,2 --1/1 Iron Chain
step
    .goto 124,57.77,61.90,40,0
    .goto 124,52.61,71.72,80,0
    .goto 124,62.03,60.24
    >>击杀|cRXP_ENEMY_血色十字军战士|r和|cRXP_ENEMY_市民|r并从他们身上搜刮 [|cRXP_LOOT_十字军徽记|r]
    .complete 12722,1 --10/10 Scarlet Crusade Soldier slain
    .complete 12716,3 --10/10 Crusader Skull
    .complete 12722,2 --15/15 Citizen of New Avalon slain
    .mob Scarlet Crusade Soldier
    .mob Citizen of New Avalon
step
    .goto 124,54.29,57.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯雷塞斯王子|r|cRXP_WARN_在墓穴内|r交谈
    .turnin 12719 >>交任务: |cRXP_FRIENDLY_无路可逃，无处可藏|r
    .accept 12720 >>接任务: |cRXP_LOOT_说服者|r
    .target Prince Keleseth
step
    .goto 124,54.67,57.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞文戴尔男爵|r交谈
    .turnin 12722 >>交任务: |cRXP_FRIENDLY_羊入虎口|r
    .target Baron Rivendare
step
    .goto 124,55.88,52.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瘟疫使者诺斯|r |cRXP_WARN_在墓穴外|r交谈
    .turnin 12716 >>交任务: |cRXP_FRIENDLY_药剂师的要求|r
    .accept 12717 >>接任务: |cRXP_LOOT_诺斯的特殊药剂|r
    .target outside of the Crypt
step
    .goto 124,56.15,52.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_天灾之锅|r
    .turnin 12717 >>交任务: |cRXP_FRIENDLY_诺斯的特殊药剂|r
step
    #completewith next
    .use 39418 >>使用 |T132595:0|t精致的珠宝箱并装备武器
    .collect 39371,2
    .collect 142274,1
step
    .goto 124,55.79,65.73
    >>自动攻击|cRXP_ENEMY_Scarlet Enemies|r直到他们说话. 不要使用技能. |cRXP_WARN_(如果运气不好, 这可能需要一段时间)|r
    .complete 12720,1
step
    .goto 124,54.29,57.31
    >>|cRXP_WARN_别忘了重新装备你的武器！！|r.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯雷塞斯王子|r|cRXP_WARN_在墓穴内|r交谈
    .turnin 12720 >>交任务: |cRXP_FRIENDLY_说服者|r
    .accept 12723 >>接任务: |cRXP_LOOT_深入血色敌后|r
    .target Prince Keleseth
step
    .goto 124,56.26,79.84
    >>|cRXP_WARN_进入房屋, 然后上楼|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12723 >>交任务: |cRXP_FRIENDLY_深入血色敌后|r
    .accept 12724 >>接任务: |cRXP_LOOT_十字军的巡逻路线|r
    .target Orbaz Bloodbane
step
    .goto 124,56.27,80.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
    .accept 12725 >>接任务: |cRXP_LOOT_死亡骑士的兄弟情谊|r
    .target Thassarian
step
    .goto 124,62.95,67.87
    >>|cRXP_WARN_进入城堡内部, 然后下到地下室|r.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库尔迪拉·织亡者|r交谈
    >>|cRXP_WARN_你可能需要等待他刷新|r
    .turnin 12725 >>交任务: |cRXP_FRIENDLY_死亡骑士的兄弟情谊|r
    .accept 12727 >>接任务: |cRXP_LOOT_杀出一条血路|r
    .target Koltira Deathweaver
step
    >>Kill |cRXP_ENEMY_the waves of enemies|r and kill |cRXP_ENEMY_Valroth|r and |TInterface/cursor/crosshair/interact.blp:20|tClick his remains after.
    .complete 12727,1 --1/1 Valroth's Head
step
    .goto 124,62.98,68.31
    >>|cRXP_WARN_上楼 within the keep|r and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_book|r.
    .complete 12724,1 --1/1 New Avalon Patrol Schedule
step
    .goto 124,56.24,79.84
    >>|cRXP_WARN_上楼到屋顶, 从城堡跳下去|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12724 >>交任务: |cRXP_FRIENDLY_十字军的巡逻路线|r
    .target Orbaz Bloodbane
step
    .goto 124,56.28,80.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
    .turnin 12727 >>交任务: |cRXP_FRIENDLY_杀出一条血路|r
    .accept 12738 >>接任务: |cRXP_LOOT_复仇的呐喊！|r
    .target Thassarian
step
    .goto 124,52.97,82.19
    >>|cRXP_WARN_请到屋外去|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r.交谈
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
    >>进入房子, 在哈尔福特勋爵面前等待, 然后击杀他们 << Worgen
    >>进入房子, 在艾欧妮丝女士面前等待, 然后击杀他们 << BloodElf
    >>进入房子, 在|cRXP_FRIENDLY_多诺凡·普弗斯特|r面前等待, 然后杀死他们 << Dwarf
    >>进入房子, 在库格·铁腭面前等待, 然后杀死他们 << Orc
    >>进入房子, 在|cRXP_FRIENDLY_安东尼·布拉克|r面前等待, 然后击杀他们 << Undead
    >>进入房子, 在|cRXP_FRIENDLY_艾琳·斯坦布雷|r面前等待, 然后击杀他们 << Human
    >>进入房屋, 在伊吉·暗齿面前等待, 然后杀死他们 << Troll
    >>进入屋子, 在|cRXP_FRIENDLY_戈比·雷管|r面前等待, 然后杀死他们 << Gnome
    >>进入房子, 在|cRXP_FRIENDLY_加里·顽渍|r面前等待, 然后击杀他们 << Goblin
    >>进入房屋, 在|cRXP_FRIENDLY_亚米娜·橡刺|r面前等待, 然后击杀他们 << NightElf
    >>进入房子, 在|cRXP_FRIENDLY_玛拉尔·勇角|r面前等待, 然后杀死他们 << Tauren
    >>进入房子, 在正义的瓦洛克面前等待, 然后击杀他们 << Draenei
    .complete 28650,1 >>完成特殊的怜悯 << Goblin
    .complete 28649,1 >>完成特殊的怜悯 << Worgen
    .complete 12739,1 >>完成特殊的怜悯 << Tauren
    .complete 12742,1 >>完成特殊的怜悯 << Human
    .complete 12743,1 >>完成特殊的怜悯 << NightElf
    .complete 12744,1 >>完成特殊的怜悯 << Dwarf
    .complete 12745,1 >>完成特殊的怜悯 << Gnome
    .complete 12746,1 >>完成特殊的怜悯 << Draenei
    .complete 12747,1 >>完成特殊的怜悯 << BloodElf
    .complete 12748,1 >>完成特殊的怜悯 << Orc
    .complete 12749,1 >>完成特殊的怜悯 << Troll
    .complete 12750,1 >>完成特殊的怜悯 << Undead
step
    .goto 124,52.94,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r.交谈
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
    .turnin 12751 >>交任务: |cRXP_FRIENDLY_欢迎回家|r
    .target Thassarian
step
    .goto 124,56.25,79.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .accept 12754 >>接任务: |cRXP_LOOT_悬崖伏击|r
    .target Orbaz Bloodbane
step
    .goto 124,59.69,76.6
    >>使用136065|T967530:0|t[伪装工具]召唤 |cRXP_ENEMY_信使|r, 然后击杀并|cRXP_LOOT_掠夺他|r
    .complete 12754,1 --1/1 Scarlet Courier's Belongings
    .complete 12754,2 --1/1 Scarlet Courier's Message
    .use 39645
step
    .goto 124,56.27,79.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12754 >>交任务: |cRXP_FRIENDLY_悬崖伏击|r
    .accept 12755 >>接任务: |cRXP_LOOT_命运的交汇点|r
    .target Orbaz Bloodbane
step
    .goto 124,65.66,83.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比迪斯将军|r交谈
    *|cRXP_WARN_You can mount while disguised|r.
    .turnin 12755 >>交任务: |cRXP_FRIENDLY_命运的交汇点|r
    .accept 12756 >>接任务: |cRXP_LOOT_血色先锋军|r
    .target High General Abbendis
step
    .goto 124,56.26,79.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12756 >>交任务: |cRXP_FRIENDLY_血色先锋军|r
    .accept 12757 >>接任务: |cRXP_LOOT_血色十字军进犯……|r
    .target Orbaz Bloodbane
step
    .goto 124,56.14,80.11,5,0
    .goto 124,48.88,29.75
    >>Wait for a short time and then |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Portal to Acherus|r.
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12757 >>交任务: |cRXP_FRIENDLY_血色十字军进犯……|r
    .accept 12778 >>接任务: |cRXP_LOOT_血色十字军的末日|r
    .target Highlord Darion Mograine
step
    .goto 124,52.08,35.04,10,0
    .goto 124,53.58,36.87
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|r互动
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .turnin 12778 >>交任务: |cRXP_FRIENDLY_血色十字军的末日|r
    .accept 12779 >>接任务: |cRXP_LOOT_万物的终结……|r
    .target Skeleton Gryphon
    .target The Lich King
step
    .goto 124,54.62,65.81
    >>使用 |T134228:0|t[冰霜巨龙号角]骑乘一只|cRXP_FRIENDLY_Frostwyrm|r(霜龙)
    >>使用(1)击杀敌人, 对敌人施放(2)以恢复法力
    >>|cRXP_WARN_任务完成后, 骑乘冰霜巨龙返回|r
    .complete 12779,2 --10/10 Scarlet Ballista destroyed
    .complete 12779,1 --150/150 Scarlet Soldiers slain
    .use 39700
step
    .goto 124,53.55,36.83
    >>飞往|cRXP_FRIENDLY_巫妖之王|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .turnin 12779 >>交任务: |cRXP_FRIENDLY_万物的终结……|r
    .accept 12800 >>接任务: |cRXP_LOOT_巫妖王的命令|r
    .target The Lich King
step
    .goto 124,49.28,28.68,10,0
    .goto 124,34.27,30.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_.|cRXP_FRIENDLY_天灾指挥官萨拉诺尔|交谈. |r.|cRXP_WARN_穿过洞穴以翻越山脉|r.
    .turnin 12800 >>交任务: |cRXP_FRIENDLY_巫妖王的命令|r
    .accept 12801 >>接任务: |cRXP_LOOT_黎明之光|r
    .target Scourge Commander Thalanor
step
    .goto 124,39.10,38.94
    >>对话|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r. |cRXP_WARN_如果他在这里|r
    >>|cRXP_WARN_任务倒计时会在任何人与他交谈时开始, 而不仅仅是对你而言. 如果事件刚结束, 你可能需要等待一段时间才能重新开始. 如果事件正在进行中, 请立即加入战斗|r.
    >>|cRXP_WARN_活动开始后, 只需跟随NPC指引, 等待任务自动完成即可|r
    .complete 12801,1 --1/1 The Light of Dawn Uncovered
step
    .goto 124,39.10,39.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12801,1 >>交任务: |cRXP_FRIENDLY_黎明之光|r
    .accept 13165 >>接任务: |cRXP_LOOT_夺回阿彻鲁斯|r
    .target Highlord Darion Mograine
step
    .goto 23,83.44,49.45
    >>|cRXP_WARN_ 打开你的法术书并使用你的死亡之门|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 13165 >>交任务: |cRXP_FRIENDLY_夺回阿彻鲁斯|r
    .accept 13166 >>接任务: |cRXP_LOOT_黑锋要塞之战|r
    .target Highlord Darion Mograine
step
    .goto 23,83.15,48.75,10,0
    .goto 23,81.72,46.70
    >>踏上|cRXP_WARN_Purple Teleporter|r, 然后击杀房间内的|cRXP_ENEMY_abominations|r
    .complete 13166,2 --10/10 Scourge slain
    .complete 13166,1 --1/1 Patchwerk slain
    .target Patchwerk
step
    .goto 23,83.43,49.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 13166 >>交任务: |cRXP_FRIENDLY_黑锋要塞之战|r
    .target Highlord Darion Mograine
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈 << Alliance
    .accept 13188 >>接任务: |cRXP_LOOT_王者之城|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈 << Horde
    .accept 13189 >>接任务: |cRXP_WARN_酋长的祝福|r << Horde
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通往暴风城的传送门|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与安度因·乌瑞恩国王交谈 << Alliance
    .turnin 13188 >>交任务: |cRXP_FRIENDLY_王者之城|r << Alliance
    .goto 23,83.65,51.28,10,0 << Alliance
    .goto 84,85.91,31.57 << Alliance
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_到奥格瑞玛的传送门|r << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与萨鲁法尔大王交谈 << Horde
    .turnin 13189 >>交任务: |cRXP_FRIENDLY_酋长的祝福|r << Horde
    .goto 85,48.53,70.71 << Horde
    .goto 23,84.56,50.45,10,0 << Horde
step <<Alliance <<DK
    #veteran
    .goto 84,61.48,31.72,5,0
    .goto 84,60.1,32.22
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师劳菲尔(|cRXP_FRIENDLY_Auctioneer Lauffer|r)交谈
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
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    #label DarkMoonFaire
    .goto 84,80.46,37.71,10,0
    .goto 84,72.51,46.59,30,0
    .goto 84,70.27,46.83,10,0
    .goto 84,62.1,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .target Darkmoon Faire Mystic Mage
    .dmf
    .isQuestTurnedIn 31450 --x Old DK
step <<Alliance <<DK
    .goto 84,62.25,72.96
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_暗月马戏团秘法师|r交谈
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
    .fly Goldshire >>飞往|cRXP_WARN_闪金镇|r
    .nodmf
    .isQuestTurnedIn 12801 --x Traditional DK Check
]])

--Demon Hunter Mardum
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 死亡骑士入门
#displayname |cFF00CCFF1|r - 马顿 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde

<< DemonHunter

step
    #completewith next
    +|cRXP_WARN_在速通术语中, 务必留意此区域内的绿色水晶. 这些水晶可显著增强你的“邪能冲刺”能力, 使其冷却时间减少整整两分钟. 这使你能够更快地通过该区域, 并更高效地清除障碍物|r.
    .link https://gyazo.com/6cedfe6dd0314f2d85731f829b322e35 >>图片链接:强化邪能水晶
step
    #label DemonHunterIntroduction
    .goto 672,22.07,55.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    *|cRXP_WARN_Be prepared for a brief roleplay segment before you can take on Kayn's Quest. If you use your Spectral Sight ability swiftly you can skip the initial roleplay|r.
    .accept 40077 >>接任务: |cRXP_WARN_入侵开始|r
    .target Kayn Sunfury
step
    .goto 672,23.85,57.20,30,0
    .goto 672,28.46,65.88,30,0
    .goto 672,28.67,62.9
    >>击杀|cRXP_ENEMY_Demons|r
    .complete 40077,1 --15/15 Demons slain
    --x .mobs
step
    .goto 672,28.67,62.9
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Legion Gateway|r
    >>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 40077,2 --Change the Legion Banner
step
    .goto 672,28.6,63.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 40077 >>交任务: |cRXP_FRIENDLY_入侵开始|r
    .accept 40378 >>接任务: |cRXP_WARN_加入伊利达雷：灰舌|r
    .target Kayn Sunfury
step
    #sticky
    #label MardumAssaultonMardum
    .goto 672,38.73,45.39,0,0
    >>Kill |cRXP_ENEMY_enemies|r and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Legion Communicator|r in the area.
    .accept 39279 >>接任务: |cRXP_WARN_突袭马顿|r
    .complete 39279,1 --Assault the Legion in the lowlands (100%)
    --x .mob
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,29.73,62.37,10,0
    .goto 672,28.83, 61.25,8 >>检查强化邪能水晶(绿色邪能水晶)
step
    .goto 672,31.57,61.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Legion旗帜|r
    .complete 40378,1 --1/1 Ashtongue forces
step
    .goto 672,31.51,62.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|r|cRXP_FRIENDLY_Felsaber|r互动
    .complete 40378,2 --1/1 Accept Illidan's Gift
    .target Felsaber
step
    #title Check for Fel Crystal
    #completewith next
    .goto 672,31.97,65.82,8 >>检查强化邪能水晶(绿色邪能水晶)
step
    .goto 672,31.83,65.43,5,0
    .goto 672,33.94,70.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Legion Gateway|r
    .complete 40378,3 --1/1 Find Allari to the southeast
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Allari 亡魂吞噬者|r和|cRXP_FRIENDLY_Sevis 明焰|r交谈
    .turnin 40378 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：灰舌|r
    .accept 38759 >>接任务: |cRXP_WARN_解救同胞|r
    .accept 39049 >>接任务: |cRXP_WARN_盯紧目标|r
    .goto 672,33.94,70.05
    .accept 40379 >>接任务: |cRXP_WARN_加入伊利达雷：库斯卡|r
    .goto 672,33.94,69.96
    .target Allari the Souleater
    .target Sevis Brightflame
step
    .goto 672,34.86,70.21
    .turnin 39970 >>打开洞穴后面的箱子 |cRXP_WARN_|r
step
    #completewith next
    .goto 672,33.82,70.10,10 >>离开小洞穴
step
    #completewith next
    .cast 193547 >>使用 |T441143:0|t[晶化裂片] 可获得移动速度和伤害加成
    *|cRXP_WARN_Refresh when buff is fading|r.
step
    .goto 672,39.00,73.24
    >>击杀一名|cff00ecff痛苦狱卒|r并从其身上获取[|cRXP_LOOT_灵魂锻造之钥|r]
    .complete 38759,1 --1/1 Soulwrought Key
step
    .goto 672,39.34,71.64
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r
    .complete 38759,3 --1/1 Cyana Nightglaive freed
step
    .goto 672,41.74,73.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r和|cRXP_PICK_军团联络器|r
    .complete 38759,2 --1/1 Belath Dawnblade freed
step
    .goto 672,42.63,79.37
    >>击杀|cff00ecff审问官巴尔菲尔|r
    *|cRXP_WARN_While he is immune, refrain from moving away from him to prevent him from evading|r.
    .complete 39049,1 --1/1 Inquisitor Baleful slain & power taken
    .mob Inquisitor Baleful
step
    .goto 672,43.43,72.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌秘术师|r谈话
    .complete 40379,1 --1/1 Soul sacrificed
    .skipgossip
    .target Ashtongue Mystic
step
    .goto 672,43.75,72.07
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Legion Gateway|r
    .complete 40379,2 --1/1 Coilskar forces
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,42.38,70.68,10 >>检查熔岩内是否有强化邪能水晶(绿色邪能水晶)|cfff78300
step
    .goto 672,41.56,66.60
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r
    .complete 38759,5 --1/1 Mannethrel Darkstar freed
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,41.31,67.02,10,0
    .goto 672,38.74,68.27,10 >>检查洞穴上方是否存在强化邪能水晶(绿色邪能水晶)|cfff78300above the cave|r. 如果不存在, 可以手动跳过此步骤
step
    .goto 672,38.58,67.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cage|r
    .complete 38759,4 --1/1 Izal Whitemoon freed
step
    #completewith next
    .goto 672,39.20,68.70,10 >>离开小洞穴
step
    .goto 672,38.8,60.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .turnin 38759 >>交任务: |cRXP_FRIENDLY_解救同胞|r
    .turnin 39049 >>交任务: |cRXP_FRIENDLY_盯紧目标|r
    .turnin 40379 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：库斯卡|r
    .target Jace Darkweaver
step
    .goto 672,38.8,60.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .accept 39050 >>接任务: |cRXP_WARN_恶魔蛛后|r
    .target Jace Darkweaver
step
    .goto 672,38.75,60.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Nether Crucible|r
    >>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 39050,1 --1/1 Ritual completed
step
    .goto 672,38.8,60.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .turnin 39050 >>交任务: |cRXP_FRIENDLY_恶魔蛛后|r
    .accept 38765 >>接任务: |cRXP_WARN_加入伊利达雷：破坏魔|r
    .accept 38766 >>接任务: |cRXP_WARN_力挽狂澜|r
    .target Jace Darkweaver
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,41.13,52.29,10 >>检查洞穴上方的强化邪能水晶(绿色邪能水晶)|cfff78300above the cave|r
step
    >>击杀 |cff00ecff贝利亚斯|r
    .goto 672,35.16,39.30
    .complete 38766,1 --1/1 Beliash slain & power taken
    .mob Beliash
step
    .goto 672,39.69,39.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞维斯|r交谈
    >>|cRXP_WARN_在施放“眼眸光束”期间, 你可以移动|r
    .complete 38765,1 --1/1 Sacrifice made
    .skipgossip 1
step
    .goto 672,40.33,38.41
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Legion Gateway|r
    .complete 38765,2 --1/1 Shivarra forces
step
    #title Check Fel Crystal Location
    #completewith next
    .goto 672,42.03,39.31,10 >>检查洞穴上方的强化邪能水晶(绿色邪能水晶)|cfff78300above the cave|r
step
    #rqeuires MardumAssaultonMardum
    #completewith next
    +|cfff78300骑上坐骑, 跟随道路|r.
step
    #rqeuires MardumAssaultonMardum
    .goto 672,60.51,44.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 38765 >>交任务: |cRXP_FRIENDLY_加入伊利达雷：破坏魔|r
    .turnin 38766 >>交任务: |cRXP_FRIENDLY_力挽狂澜|r
    .target Kayn Sunfury
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .goto 672,60.51,44.75
    .accept 38813 >>接任务: |cRXP_WARN_战前动员|r
step
    .goto 672,59.23,46.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lady S'theno|r交谈
    .complete 38813,2 --1/1 Lady S'theno briefed
    .skipgossip
    .target Lady S'theno
step
    .goto 672,61.0,46.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Matron Mother|r交谈
    .complete 38813,3 --1/1 Matron Mother Malevolence briefed
    .skipgossip
step
    .goto 672,62.2,46.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战帅加尔顿|r交谈
    .complete 38813,1 --1/1 Battlelord Gaardoun briefed
    .skipgossip
    .target Battlelord Gaardoun
step
    .goto 672,60.51,44.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 38813 >>交任务: |cRXP_FRIENDLY_战前动员|r
    .accept 39262 >>接任务: |cRXP_WARN_视人所不能|r
    .target Kayn Sunfury
step
    #completewith next
    .cast 200749 >>按 N 键并选择一个专精(推荐:混乱)
step
    .goto 672,64.05,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .complete 39262,1 --1/1 Speak with Jace Darkweaver
    .skipgossip 96436,1
    .target Jace Darkweaver
step
    .goto 672,63.97,52.73
    >>使用 |T188501:0|t幻影之眼|cRXP_WARN_时, 面向洞穴|r
    .complete 39262,2 --1/1 Face the Cave & 使用幽灵之眼
    .usespell 188501
step
    .goto 672,64.05,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .turnin 39262 >>交任务: |cRXP_FRIENDLY_视人所不能|r
    .accept 39495 >>接任务: |cRXP_WARN_无所遁形|r
    .target Jace Darkweaver
step
    #completewith next
    .goto 673,44.24,51.08,8,0
    .goto 673,51.31,55.88,8,0
    .goto 673,55.17,56.64,8 >>进入洞穴, 使用双跳跃上左侧的 ledge
step
    .goto 673,59.1,61.9
    >>击杀 |cff00ecff费尔勋爵卡扎|r
    .complete 39495,1 --1/1 Caza slain & power taken
    .target Fel Lord Caza
step
    .goto 673,54.77,58.28
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_chest|r获取戒指
    .turnin 39973,1 >>|TInterface/cursor/crosshair/interact.blp:20|t交任务: |cRXP_FRIENDLY_[7.0 DH-Mardum - Small Treasure Chest 003]|r
step
    #completewith next
    .hs >>使用[炉石]|cRXP_WARN_前往伊利达里高地|r
step
    .goto 672,60.51,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 39495 >>交任务: |cRXP_FRIENDLY_无所遁形|r
    .accept 38727 >>接任务: |cRXP_WARN_阻止轰炸|r
    .target Kayn Sunfury
step
    .goto 672,60.56,44.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyana Nightglaive|r交谈
    .accept 38819 >>接任务: |cRXP_WARN_大军压境|r
    .target Cyana Nightglaive
step
    .goto 672,60.52,44.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉里·噬魂者|r交谈
    .accept 38725 >>接任务: |cRXP_WARN_深入邪污产床|r
    .target Allari the Souleater
step
    #completewith
    >>杀死该区域内的敌对怪物
    .complete 38819,1 --War progress (100%)
    --x .mob
step
    .goto 672,69.26,48.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Object|r
    .complete 38727,1 --1/1 Doom Fortress Devastator
step
    #completewith next
    .goto 672,72.39,46.87,15,0
    .goto 672,73.13,45.85,15 >>使用双跳技能攀爬墙壁
step
    #completewith next
    .goto 672,75.01,41.08
    .cast 6477 >>放置旗帜
step
    #completewith next
    .complete 38727,2 --1/1 Forge of Corruption Devastator
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kor'vas|r交谈
    .goto 672,73.15,33.83
    .turnin 38725 >>交任务: |cRXP_FRIENDLY_深入邪污产床|r
    .accept 40222 >>接任务: |cRXP_WARN_鬼母魔典|r
step
    .goto 672,77.05,28.04
    >>击杀 |cff00ecffProlifica|r并从她身上搜刮出 [|cRXP_LOOT_Tome of Fel Secrets|r]
    .complete 40222,1 --1/1 Tome of Fel Secrets
step
    #completewith next
    .goto 672,73.68,32.16,10 >>离开洞穴
step
    #label MardumStoptheBombardment
    #completewith next
    .goto 672,66.39,30.40
    .cast 6477 >>放置旗帜
step
    #sticky
    #label Area1
    .goto 672,68.21,28.06,25,0
    .goto 672,66.23,25.97,25,0
    .goto 672,64.89,27.25,30,0
    .goto 672,63.71,29.63
    >>杀死该区域内的敌对怪物
    .complete 38819,1 --War progress (100%)
    --x .mob
step
    .complete 38727,3 --1/1 Soul Engine Devastator
step
    #requires Area1
    #completewith next
    +|cfff78300骑上坐骑并跟随箭头指引|r.
step
    #requires Area1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r和|cRXP_FRIENDLY_Kor'vas|r交谈
    >>|cRXP_WARN_如果你仍拥有Felrush增益效果, 可以直接使用Felrush跃过深渊抵达Kayn|r
    .turnin 38727 >>交任务: |cRXP_FRIENDLY_阻止轰炸|r
    .turnin 38819 >>交任务: |cRXP_FRIENDLY_大军压境|r
    .goto 672,60.52,44.76
    .turnin 40222 >>交任务: |cRXP_FRIENDLY_鬼母魔典|r
    .accept 40051 >>接任务: |cRXP_WARN_邪魔之秘|r
    .goto 672,60.5,44.8
    .target Kayn Sunfury
    .target Kor'vas Blodthorn
step
    .goto 672,60.56,44.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_book|r并选择一个专精|cRXP_WARN_(推荐:毁灭)|r
    .complete 40051,1 --1/1 Choose between Havoc & Vengeance
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 40051 >>交任务: |cRXP_FRIENDLY_邪魔之秘|r
    .accept 39516 >>接任务: |cRXP_WARN_传授浩劫专精|r
    .target Kayn Sunfury
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_NPC|r 交谈
    .complete 39516,4 --1/1 Kor'vas taught
    .complete 39516,1 --1/1 Allari taught
    .complete 39516,3 --1/1 Kayn taught
    .complete 39516,2 --1/1 Cyana taught
    .skipgossip 1
    .skipgossip 93127,2
    .target Kor'vas Bloodthorn
    .target Allari the Souleater
    .target Kayn Sunfury
    .target Cyana Nightglaive
    --x fix npc order / talk to
step
    .goto 672,60.25,44.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mannethrel Darkstar|r交谈
    .complete 39516,5 --1/1 Mannethrel taught
    .skipgossip 2
    .target Mannethrel Darkstar
step
    .goto 672,60.52,44.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 39516 >>交任务: |cRXP_FRIENDLY_传授浩劫专精|r
    .accept 39663 >>接任务: |cRXP_WARN_搭乘魔蝠|r
    .target Kayn Sunfury
step
    .goto 672,62.52,44.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Izal Whitemoon|r交谈, 前提是在使用 /sit 命令之后
    .complete 39663,1 --1/1 Ride to the Fel Hammer
    .skipgossip
step
    #completewith next
    .goto 672,69.9,44.2,40,0
    +跳入深渊赴死, 等待复活
step
    .goto 672,69.93,44.23
    >>Engage the |cRXP_ENEMY_Brood Queen Tyranna|r in combat and persist until she retreats into the shadows then |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyana Nightglaive|r交谈
    .turnin 39663 >>交任务: |cRXP_FRIENDLY_搭乘魔蝠|r
    .target Cyana Nightglaive
    .mob Brood Queen Tyranna
step
    .goto 672,69.9,44.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cyana Nightglaive|r交谈
    .accept 38728 >>接任务: |cRXP_WARN_钥石|r
    .target Cyana Nightglaive
step
    .goto 672,70.0,40.6
    >>击杀|cff00ecff幼龙女王蒂拉娜|r并从她身上获取[|cRXP_LOOT_Sargerite 钥匙之石|r]
    .complete 38728,1 --1/1 Sargerite 钥匙ton
    .mob Brood Queen Tyranna
step
    .goto 672,70.88,39.09,-1
    .goto 672,70.95,41.90,-1
    .goto 672,68.84,41.97,-1
    .goto 672,68.80,39.13,-1
    >>前往|cRXP_WARN_楼下|r
    .complete 38728,2 --1/1 Find the way downstairs
step
    .goto 672,69.86,37.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    .turnin 38728 >>交任务: |cRXP_FRIENDLY_钥石|r
    .timer 7,Roleplay Duration
    .accept 38729 >>接任务: |cRXP_WARN_返回黑暗神殿|r
step
    .goto 672,69.85,37.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Sargerite 陨石钥石|r
    .complete 38729,1 --1/1 Sargerite 钥匙tone activated
step
    .goto 672,69.85,37.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击 |cRXP_WARN_Fel Portal|r
    .turnin 38729 >>交任务: |cRXP_FRIENDLY_返回黑暗神殿|r
step
    .goto 677,80.09,36.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛维·影歌|r交谈
    .accept 38672 >>接任务: |cRXP_WARN_生死逃亡|r
    .target Maiev Shadowsong
step
    .goto 677,78.63,38.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Altruis的牢房|r
    .complete 38672,1 --1/1 Altruis freed
step
    .goto 677,78.59,34.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Kayn's Cell|r
    .complete 38672,2 --1/1 Kayn freed
step
    .goto 677,77.8,35.7
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Lever|r
    .turnin 38672 >>交任务: |cRXP_FRIENDLY_生死逃亡|r
    .timer 8,Roleplay Duration
step
    .goto 677,74.47,35.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .accept 38690 >>接任务: |cRXP_WARN_伊利达雷的崛起|r
    .target Kayn Sunfury
step
    .goto 677,74.42,37.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与受难者奥图里斯(|cRXP_FRIENDLY_Altruis the Sufferer|r)交谈
    .accept 38689 >>接任务: |cRXP_WARN_邪能灌注|r
    .target Altruis the Sufferer
step
    #completewith next
    >>|cRXP_WARN_|在这件事上取得一些进展至关重要, 但切忌完全完成它|r
    .complete 39742,1 -- Repel the Legion Attackers
step
    #sticky
    #label Area2
    >>Tag as many |cRXP_ENEMY_Savage Stalkers|r as possible and kill them while |TInterface/cursor/crosshair/interact.blp:20|tclicking |cRXP_PICK_cells|r.
    .complete 38689,1 --100/100 Fel Energy regained
    .mob Savage Stalker
step
    .goto 677,75.04,39.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,1 --8/8 Imprisoned Illidari freed
step
    .isOnQuest 38690
    .goto 677,74.46,32.53,8 >>使用双跳登上 ledge
step
    .goto 677,72.14,32.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,2 --8/8 Imprisoned Illidari freed
step
    .goto 677,71.01,27.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,3 --8/8 Imprisoned Illidari freed
step
    .goto 677,66.10,31.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,4 --8/8 Imprisoned Illidari freed
step
    .goto 677,63.12,33.82
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,5 --8/8 Imprisoned Illidari freed
step
    .isOnQuest 38690
    .goto 677,63.55,39.87,8 >>跳台双跳
step
    .goto 677,65.95,40.93
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,6 --8/8 Imprisoned Illidari freed
step
    .goto 677,66.37,43.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,7 --8/8 Imprisoned Illidari freed
step
    .goto 677,71.87,43.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Warden Cell|r
    .complete 38690,1,8 --8/8 Imprisoned Illidari freed
step
    #requires Area2
    #completewith next
    .goto 677,61.52,36.49,20,0
    .goto 677,51.23,37.05,20 >>|cRXP_WARN_请跟随箭头指示|r
step
    #requires Area2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_受难者奥图里斯|r和|cRXP_FRIENDLY_凯恩·日怒|r和|cRXP_FRIENDLY_玛维·影歌|r交谈
    .turnin 38689 >>交任务: |cRXP_FRIENDLY_邪能灌注|r
    .goto 677,49.68,49.3
    .turnin 38690 >>交任务: |cRXP_FRIENDLY_伊利达雷的崛起|r
    .goto 677,49.17,49.48
    .accept 38723 >>接任务: |cRXP_WARN_阻止古尔丹！|r << Female
    .accept 40253 >>接任务: |cRXP_WARN_阻止古尔丹！|r << Male
    .goto 677,49.46,49.76
    .target Altruis the Sufferer
    .target Kayn Sunfury
    .target Maiev Shadowsong
step
    .goto 677,50.1,74.5
    >>击杀 |cff00ecff碎石蟹 & 碎石蟹|r
    *|cRXP_WARN_They have shared HP|r.
    .complete 38723,2 << Female --1/1 Crusher & Sledge slain & power taken
    .complete 40253,2 << Male --1/1 Crusher & Sledge slain & power taken
    .mob Crusher
    .mob Sledge
step
    .goto 677,50.75,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kayn Sunfury|r交谈
    .turnin 38723 >>交任务: |cRXP_FRIENDLY_阻止古尔丹！|r << Female
    .turnin 40253 >>交任务: |cRXP_FRIENDLY_阻止古尔丹！|r << Male
    .accept 39682 >>接任务: |cRXP_WARN_侠盗蝙蝠手|r
    .target Kayn Sunfury
step
    #completewith next
    .goto 677,50.06,37.06,15,0
    .goto 677,42.93,32.10,15,0
    .goto 677,54.04,29.34,15 >>|cRXP_WARN_请按照指示向上走|r.
step
    .goto 677,49.58,30.63
    >>|cRXP_WARN_最后一次机会完成此任务|r
    .complete 39742,1 -- Repel the Legion Attackers
step
    .goto 677,54.27,29.14,15,0
    .goto 677,48.51,20.14
    >>|TInterface/cursor/crosshair/interact.blp:20|t与|cRXP_FRIENDLY_Vampiric Felbat|r互动
    .complete 39682,1 --1/1 Ride a Vampiric Felbat to the Upper Vault
    .target Vampiric Felbat
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ 科尔瓦斯·血棘|r和|cRXP_FRIENDLY_ 阿拉莉·噬魂者|r交谈
    .goto 678,41.33,47.33
    .turnin 39682 >>交任务: |cRXP_FRIENDLY_侠盗蝙蝠手|r
    .accept 39685 >>接任务: |cRXP_WARN_冻结时光|r
    .accept 39684 >>接任务: |cRXP_WARN_发送光线|r
    .accept 39683 >>接任务: |cRXP_WARN_战火锤炼|r << Female
    .accept 40254 >>接任务: |cRXP_WARN_战火锤炼|r << Male
    .goto 678,41.12,47.17
    .target Kor'vas Bloodthorn
    .target Allari the Souleater
step
    .goto 678,46.77,36.91,15,0
    .goto 678,46.7,17.8
    >>击杀 |cff00ecff伊莫兰特|r
    .complete 39683,1 << Female --1/1 Immolanth slain & power taken
    .complete 40254,1 << Male --1/1 Immolanth slain & power taken
    .mob Immolanth
step
    .goto 678,46.74,36.41,15,0
    .goto 678,54.76,48.15,15,0
    .goto 678,70.54,49.62
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Mirror|r
    *|cRXP_WARN_Make sure to dodge the discs|r.
    .complete 39684,1 --1/1 Mirror rotated
step
    .goto 678,59.05,48.2,10,0
    .goto 678,52.93,58.45,15,0
    .goto 678,46.84,66.84,10,0
    .goto 678,50.1,78.2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,1 --1/1 Eastern Countermeasure activated
step
    .goto 678,56.77,51.86,15,0
    .goto 678,48.44,63.66,15,0
    .goto 678,46.8,84.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,2 --1/1 Southern Countermeasure activated
step
    .goto 678,43.4,78.2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Orb|r
    .complete 39685,3 --1/1 Western Countermeasure activated
step
    .goto 678,46.63,66.17,8,0
    .goto 678,46.83,60.12,8,0
    .goto 678,41.1,47.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉里·噬魂者|r交谈
    .turnin 39685 >>交任务: |cRXP_FRIENDLY_冻结时光|r
    .turnin 39683 >>交任务: |cRXP_FRIENDLY_战火锤炼|r << Alliance
    .turnin 40254 >>交任务: |cRXP_FRIENDLY_战火锤炼|r << Horde
    .turnin 39684 >>交任务: |cRXP_FRIENDLY_发送光线|r
    .accept 39686 >>接任务: |cRXP_WARN_一路向上|r
    .target Allari the Souleater
step
    .goto 678,46.69,48.12
    >>|cRXP_WARN_前往电梯所在位置, 耐心等待其到来|r
    .complete 39686,1 --1/1 Ascend to the Hall of Judgment
step
    .goto 679,24.41,55.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kor'vas Bloodthorn|r交谈
    .turnin 39686 >>交任务: |cRXP_FRIENDLY_一路向上|r
    .accept 40373 >>接任务: |cRXP_WARN_新的方向|r
    .target Kor'vas Bloodthorn
step
    .goto 679,24.52,53.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击审判之池|cRXP_PICK_Pool of Judgment|r
    .complete 40373,1 --1/1 Pool of Judgment viewed
step
    .goto 679,24.52,53.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔瓦斯·血棘|r交谈, 并选择|cRXP_FRIENDLY_凯恩|r或|cRXP_FRIENDLY_奥图里斯|r
    .complete 40373,2 --1/1 Choose between Kayn and Altruis
    .target Kor'vas Bloodthorn
step
    >>跳过无法手动接受的任务
    .goto 679,24.4,55.8
    .turnin 40373 >>交任务: |cRXP_FRIENDLY_新的方向|r
    .accept 39688 >>接任务: |cRXP_WARN_自由的绊脚石|r << NightElf
    .accept 40255 >>接任务: |cRXP_WARN_自由的绊脚石|r << NightElf
    .accept 39694 >>接任务: |cRXP_WARN_自由的绊脚石|r << BloodElf
    .accept 40256 >>接任务: |cRXP_WARN_自由的绊脚石|r << BloodElf
step
    #completewith MardumBetweenUsAndFreedom
    .goto 679,24.44,72.11,10,0
    .goto 679,32.57,77.47,10,0
    .goto 679,39.46,80.59,20 >>|cRXP_WARN_请跟随箭头指示|r
step
    .isOnQuest 40256
    >>击杀|cff00ecff巴斯塔拉克斯|r
    .goto 679,50.34,77.76
    .complete 40256,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 39694
    >>击杀|cff00ecff巴斯塔拉克斯|r
    .goto 679,50.34,77.76
    .complete 39694,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 40255
    >>击杀|cff00ecff巴斯塔拉克斯|r
    .goto 679,50.34,77.76
    .complete 40255,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    .isOnQuest 39688
    >>击杀|cff00ecff巴斯塔拉克斯|r
    .goto 679,50.34,77.76
    .complete 39688,1 --1/1 Bastillax slain & power taken
    .mob Bastillax
step
    #completewith next
    .goto 679,63.39,80.28,10,0
    .goto 679,72.67,78.62,5,0
    .goto 679,78.89,80.04,5,0
    .goto 679,78.22,87.79,5 >>双段跳 + 邪能冲击爬上山, 迫使卡德加提前刷新
    >>|cRXP_WARN_ 请密切遵循航点|r
step
    #label MardumBetweenUsAndFreedom
    .goto 679,83.98,82.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与受难者奥图里斯(|cRXP_FRIENDLY_Altruis the Sufferer|r)交谈
    .turnin -39688 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << NightElf
    .turnin -40255 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << NightElf
    .turnin -40256 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << BloodElf
    .turnin -39694 >>交任务: |cRXP_FRIENDLY_自由的绊脚石|r << BloodElf
    .target Altruis the Sufferer
step << Alliance
    .goto 679,85.98,84.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营的大法师卡德加|r交谈
    .accept 39689 >>接任务: |cRXP_WARN_伊利达雷，出发吧|r
    .turnin 39689 >>交任务: |cRXP_FRIENDLY_伊利达雷，出发吧|r
    .target Archmage Khadgar
step << Alliance
    .goto 84,72.55,47.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营的大法师卡德加|r交谈
    .accept 39691 >>接任务: |cRXP_WARN_战斗的召唤|r
    .target Archmage Khadgar
step << Alliance
    .goto 84,83.73,34.40
    .complete 39691,1 --1/1 Enter |cRXP_WARN_the Throne Room|r.
step << Alliance
    .goto 84,84.39,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .turnin 39691 >>交任务: |cRXP_FRIENDLY_战斗的召唤|r
    .accept 44471 >>接任务: |cRXP_WARN_洞察视觉|r
    .target Jace Darkweaver
step << Alliance
    >>|cRXP_WARN_使用幽灵之眼|r
    .complete 44471,1 --1/1 Spectral Sight used
    .usespell 188501
step << Alliance
    .goto 84,84.39,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jace Darkweaver|r交谈
    .turnin 44471 >>交任务: |cRXP_FRIENDLY_洞察视觉|r
    .accept 44463 >>接任务: |cRXP_WARN_恶魔四伏|r
    .target Jace Darkweaver
step << Alliance
    .goto 84,85.90,31.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .complete 44463,1 --1/1 Warn Anduin Wrynn
    .skipgossip
    .target Anduin Wrynn
step << Alliance
    >>击杀|cRXP_ENEMY_Demons|r
    .complete 44463,2 --5/5 Demons slain
    --x .mob
step << Alliance
    .goto 84,85.75,31.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r交谈
    .turnin 44463 >>交任务: |cRXP_FRIENDLY_恶魔四伏|r
    Anduin Wrynn
step << Alliance
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .nodmf
    .isQuestTurnedIn 44463 --x DH Check
    .target Renato Gallina
step <<Alliance
    #completewith next
    .goto 84,73.04,47.56,25,0
    .goto 84,67.45,57.19,25,0
    .goto 84,68.59,62.19,25,0
    .goto 84,66.03,64.49,25,0
    .goto 84,64.39,67.14,25,0
    .goto 84,63.89,72.21,35,0
    .goto 84,68.07,79.75,25,0
    .goto 84,70.1,79.88,25,0
    .goto 84,70.41,84.03,25,0
    .goto 84,70.92,72.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_闪金镇的勇敢的巴特利|r交谈
    .fp >>获取闪金镇飞行路线
    .nodmf
    .isQuestTurnedIn 44463 --x DH Check
    .target Bartlett the Brave
step <<Alliance
    #veteran
    .goto 84,61.48,31.72,5,0
    .goto 84,60.1,32.22
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师劳菲尔(|cRXP_FRIENDLY_Auctioneer Lauffer|r)交谈
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
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
    .dmf
    .isQuestTurnedIn 31450 --x dh check
step <<Alliance
    #label DarkMoonFaire
    .goto 84,80.46,37.71,10,0
    .goto 84,72.51,46.59,30,0
    .goto 84,70.27,46.83,10,0
    .goto 84,62.1,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
    .isQuestTurnedIn 40378 --x Demon Hunter Check
    .dmf
    .target Darkmoon Faire Mystic Mage
step <<Alliance
    .goto 84,62.25,72.96
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .skipgossip
    .zoneskip 37
    .dmf
    .isQuestTurnedIn 31450 --x dh check
    .target Darkmoon Faire Mystic Mage
step << Horde
    .goto 679,85.98,84.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营的大法师卡德加|r交谈
    .accept 39690 >>接任务: |cRXP_WARN_伊利达雷，出发吧|r
    .turnin 39690 >>交任务: |cRXP_FRIENDLY_伊利达雷，出发吧|r
    .target Archmage Khadgar
step << Horde
    .goto 85,52.53,88.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营的大法师卡德加|r交谈
    .accept 40976 >>接任务: |cRXP_WARN_大酋长的接见|r
    .target Archmage Khadgar
step << Horde
    .goto 85,50.0,76.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔法恩|r交谈
    .complete 40976,1 --1/1 Report to Saurfang
    .target Saurfang
step << Horde
    .goto 1,45.8,15.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉里·噬魂者|r交谈
    .turnin 40976 >>交任务: |cRXP_FRIENDLY_大酋长的接见|r
    .accept 40982 >>接任务: |cRXP_WARN_洞察视觉|r
    .target Allari the Souleater
step << Horde
    .goto 1,45.8,15.1
    >>|cRXP_WARN_使用幽灵之眼|r
    .complete 40982,1 --1/1 Spectral Sight used
    .usespell 188501
step << Horde
    .goto 1,45.8,15.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉里·噬魂者|r交谈
    .turnin 40982 >>交任务: |cRXP_FRIENDLY_洞察视觉|r
    .accept 40983 >>接任务: |cRXP_WARN_恶魔四伏|r
    .target Allari the Souleater
step << Horde
    .goto 1,45.7,15.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦娜斯·风行者|r交谈
    .complete 40983,1 --1/1 Warn Warchief Sylvanas
    .target Lady Sylvanas Windrunner
step << Horde
    .goto 1,45.80,14.77,15,0
    .goto 1,46.67,14.75,15,0
    .goto 1,46.94,16.50,15,0
    .goto 1,46.41,17.88,15,0
    .goto 1,45.60,16.47,15,0
    .goto 1,46.19,15.65
    >>击杀|cRXP_ENEMY_Demons|r
    .complete 40983,2 --12/12 Demons slain
    --x .mob
step << Horde
    .goto 1,45.68,15.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦娜斯·风行者|r交谈
    .turnin 40983 >>交任务: |cRXP_FRIENDLY_恶魔四伏|r
    .accept 41002 >>接任务: |cRXP_WARN_部落的武器|r
    .target Lady Sylvanas Windrunner
]])

--Dracthyr The Forbidden Reach
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 龙族导引
#displayname |cFF00CCFF1|r - 禁忌离岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde

<< Dracthyr


step << !Evoker
    .goto 2373,42.99,89.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander Emberthal|r交谈
    .turnin 84423 >>交任务: |cRXP_FRIENDLY_焕发新生|r
    .accept 84424 >>接任务: |cRXP_WARN_向着冒险前进！|r
    .target Scalecommander Emberthal
step << !Evoker
    .goto 2373,43.81,81.09
    >>跳下|cRXP_WARN_(按空格键停止坠落)|r. 点击|cRXP_PICK_到奥格瑞玛的传送门|r << Horde
    >>跳下|cRXP_WARN_(按空格键停止坠落)|r. 点击|cRXP_PICK_通往暴风城的传送门|r << Alliance
    .complete 84424,3 << Horde --1/1 使用到奥格瑞玛的传送门
    .complete 84424,3 << Alliance--1/1 Use the Portal to Stormwind
step << !Evoker Horde
    .goto 85,40.82,80.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
    .turnin 84424 >>交任务: |cRXP_FRIENDLY_向着冒险前进！|r
    .target Chromie
step << !Evoker Alliance
    .goto 84,56.26,17.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
    .turnin 84424 >>交任务: |cRXP_FRIENDLY_向着冒险前进！|r
    .target Chromie
step << Evoker
    .goto 2109,46.73,78.71
    .accept 64864 >>接任务: |cRXP_WARN_[Awaken, Dracthyr]|r
step << Evoker
    #label DrakthyrIntroduction
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与你面前的|cRXP_FRIENDLY_Kodethi|r或|cRXP_FRIENDLY_Dervishian|r互动. 等待你的“分解术”施放完成
    .goto 2109,47.50,84.52,-1
    .goto 2109,46.28,79.52,-1
    .goto 2109,42.91,77.49,-1
    .goto 2109,39.59,79.71,-1
    .goto 2109,38.20,84.72,-1
    .goto 2109,43.03,91.77,-1
    .goto 2109,46.34,89.49,-1
    .complete 64864,1 --1/1 Dracthyr ally awakened
    .target Kodethi
    .target Dervishian
step << Evoker
    #completewith TheForbiddenReachAwakenDracthyr
    +|移动时使用空格键跳跃比正常移动更快|r
step << Evoker
    >>跳下并与|cRXP_FRIENDLY_Tethalash|r互动. 等待你的“解离”技能施放完成
    .goto 2109,44.36,85.54
    .complete 64864,3 --1/1 Tethalash awakened
    .target Tethalash
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与床上的|r互动
    .goto 2109,47.95,79.94
    .complete 64864,2 --1/1 Kethahn found
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与|cRXP_FRIENDLY_Azurathel|r交互. 等待你的“解体”技能完成
    .goto 2109,46.83,81.83,5,0
    .goto 2109,39.18,82.11,5,0
    .goto 2109,34.26,81.08,5,0
    .goto 2109,32.15,82.73
    .complete 64864,4 --1/1 Azurathel awakened
    .target Azurathel
step << Evoker
    #label TheForbiddenReachAwakenDracthyr
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander Azurathel|r和|cRXP_FRIENDLY_Dervishian|r交谈, 完成简短的角色扮演后
    .turnin 64864 >>交任务: |cRXP_FRIENDLY_[Awaken, Dracthyr]|r
    .accept 64865 >>接任务: |cRXP_WARN_[Gear Up]|r
    .goto 2109,32.92,81.57
    .accept 64863 >>接任务: |cRXP_WARN_[Arcane Guardians]|r
    .goto 2109,33.08,80.67
    .target Scalecommander Azurathel
    .target Dervishian
step << Evoker
    #completewith next
    .goto 2109,35.81,73.85
    .cast 6478 >>拿起|cRXP_PICK_Crystal Key|r水晶钥匙, 并将其放入旁边的水晶焦点中
step << Evoker
    .goto 2109,38.29,74.52
    .turnin 66010 >>在桌子上拿起|cRXP_PICK_Mysterious Wand|r
step << Evoker
    #sticky
    #label TheForbiddenReachArcaneGuardians
    >>聚焦|cRXP_ENEMY_Ancient Constructs|r. 当它们血量降至40%时逃跑(会分裂并召唤两个小怪)
    .complete 64863,1 --4/4 Guardians or Constructs slain
    .mob Ancient Guardian
    .mob Ancient Construct
step << Evoker
    >>拾取 |cRXP_PICK_Stack of Weapons|r
    .goto 2109,38.05,65.56,6,0
    .goto 2109,43.27,63.85,6,0
    .goto 2109,45.04,66.23
    .complete 64865,1 --1/1 Stack of Weapons
step << Evoker
    >>拾取|r|cRXP_PICK_Rations|r
    .goto 2109,43.54,63.77,6,0
    .goto 2109,43.54,63.77,6,0
    .goto 2109,34.25,61.10
    .complete 64865,3 --1/1 Bundle of Rations collected
step << Evoker
    >>拾起|cRXP_PICK_Crate|r
    .goto 2109,36.45,61.32,6,0
    .goto 2109,39.54,54.9,6,0
    .goto 2109,38.78,51.35
    .complete 64865,2 --1/1 Crate of Warscales
step << Evoker
    #requires TheForbiddenReachArcaneGuardians
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    #requires TheForbiddenReachArcaneGuardians
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德维希安人|r和|cRXP_FRIENDLY_鳞甲指挥官阿祖拉瑟尔|r交谈
    .goto 2109,39.75,54.98,6,0
    .goto 2109,43.89,59.14,6,0
    .turnin 64863 >>交任务: |cRXP_FRIENDLY_[Arcane Guardians]|r
    .goto 2109,45.82,58.56
    .turnin 64865 >>交任务: |cRXP_FRIENDLY_[Gear Up]|r
    .accept 64866 >>接任务: |cRXP_WARN_[Into the Cauldron]|r
    .goto 2109,46.45,57.07
    .target Dervishian
    .target Scalecommander Azurathel
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    >>使用 |T4622464:0|t[活火] 治疗该区域受伤的德拉克瑟尔
    .goto 2109,55.54,45.41,15,0
    .goto 2109,53.46,39.05,25,0
    .goto 2109,59.21,50.57,25,0
    .goto 2109,62.73,50.29,25,0
    .goto 2109,64.09,43.09,25,0
    .goto 2109,58.3,41.21
    .complete 64866,1 --1/1 Glide into the Earth-Warder's Cauldron
    .complete 64866,2 --5/5 Dracthyr rescued or healed with Living Flame
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鳞指挥官阿祖拉瑟尔|r和|cRXP_FRIENDLY_鳞指挥官辛德瑞斯|r交谈
    .turnin 64866 >>交任务: |cRXP_FRIENDLY_[Into the Cauldron]|r
    .goto 2109,61.98,36.25
    .accept 64871 >>接任务: |cRXP_WARN_[The Dragon at the Door]|r
    .goto 2109,62.34,36.41
    .target Scalecommander Azurathel
    .target Scalecommander Cindrethresh
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    >>确保在击杀巨龙前完成“已到达出口”任务
    .goto 2109,66.4,10.69
    .complete 64871,1 --Exit reached
step << Evoker
    >>击杀|cRXP_ENEMY_Lapisagos|r. 小型元素生物死亡时会为你提供伤害加成
    .goto 2109,66.4,10.69
    .complete 64871,2 --1/1 Lapisagos slain
    .mob Lapisagos
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander Cindrethresh|r和|cRXP_FRIENDLY_Scalecommander Azurathel|r交谈
    >>|cRXP_WARN_取消“窒息效果”以提升移动速度|r
    .turnin 64871 >>交任务: |cRXP_FRIENDLY_[The Dragon at the Door]|r
    .accept 64872 >>接任务: |cRXP_WARN_[The Fire Within]|r
    .goto 2118,44.39,61.51
    .accept 65615 >>接任务: |cRXP_WARN_奥术侵扰|r
    .goto 2118,44.10,61.38
    .target Scalecommander Cindrethresh
    .target Scalecommander Azurathel
step << Evoker
    #completewith TheForbiddenReachTheFireWithin3
    +检查背包中是否有新装备
step << Evoker
    #completewith TheForbiddenReachTheFireWithin
    +|cRXP_WARN_You can |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Fire Breath Infusers|r to reset your Fire Breath cooldown|r.
step << Evoker
    #label TheForbiddenReachTheFireWithin3
    >>施放 |T4622458:0|t[火焰吐息]并保持, 直到抵达最后一个强化阶段
    .goto 2118,43.78,61.29
    .complete 64872,3 --Cast an Empowered III Fire Breath
step << Evoker
    >>施放 |T4622458:0|t[火焰吐息]并保持效果, 直到抵达 |cRXP_WARN_second|r强化区域
    .goto 2118,43.78,61.29
    .complete 64872,2 --Cast an Empowered II Fire Breath
step << Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与|cRXP_PICK_信标|r互动
    .goto 2118,45.42,53.71
    .complete 65615,1 --1/1 Beacon investigated
step << Evoker
    #label TheForbiddenReachTheFireWithin
    >>施放 |T4622458:0|t[烈焰吐息](不要长按按钮)
    .goto 2118,44.41,57.63
    .complete 64872,1 --Cast an Empowered I Fire Breath
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander Cindrethresh|r和|cRXP_FRIENDLY_Scalecommander Azurathel|r交谈
    .turnin 64872 >>交任务: |cRXP_FRIENDLY_[The Fire Within]|r
    .goto 2118,44.40,61.50
    .turnin 65615 >>交任务: |cRXP_FRIENDLY_奥术侵扰|r
    .goto 2118,44.09,61.36
    .target Scalecommander Cindrethresh
    .target Azurathel
step << Evoker
    #completewith next
    #sticky
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Fusethrian|r交谈
	.target Fusethrian
    .goto 2118,43.42,60.80
    .home >>将你的[炉石]设置为旧巢穴之地
step << Evoker
    .goto 2118,44.54,61.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .accept 64873 >>接任务: |cRXP_WARN_[Stretch Your Wings]|r
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    >>使用[ExtraActionButton]传送到NPC正前方
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dervishian|r交谈
	.target Dervishian
    .goto 2118,44.73,57.65
    .use 195044
    .complete 64873,1 --1/1 Learn about coasting
step << Evoker
    #completewith next
    +查看你的法术书中的 |T4622485:0|t[翱翔]
step << Evoker
    >>使用 |T4622485:0|t[飞翔]
    .complete 64873,2 --释放翱翔
step << Evoker
    >>使用“翱翔之能”|T2103880:0|t[向前冲刺](1)和|T2103876:0|t[向上攀升](2). |cRXP_WARN_请确保飞过环形目标|r
    .goto 2118,50.53,45.29
    .complete 64873,3 --5/5 Soared through rings
step << Evoker
    #completewith next
    .cast 369536 >>释放翱翔
step << Evoker
    .goto 2118,42.12,34.36
    .turnin 65909 >>拾取|cRXP_PICK_魔法风之袋|r以获得移动速度加成
step << Evoker
    #completewith next
    +使用[ExtraActionButton]返回
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kodethi|r交谈
	.target Kodethi
    .use 195044
    .goto 2118,41.42,48.21
    .complete 64873,4 --1/1 Learn about diving
step << Evoker
    #completewith next
    .cast 369536 >>释放翱翔
step << Evoker
    >>使用“翱翔之能”|T2103880:0|t[向前冲刺](1)和|T2103876:0|t[向上攀升](2). |cRXP_WARN_请确保飞过环形目标|r
    .goto 2118,34.59,49.58
    .complete 64873,5 --5/5 Diving through rings
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dervishian|r交谈
	.target Dervishian
    .goto 2118,44.71,57.64
    .complete 64873,6 --1/1 Learn about Advanced Flying
step << Evoker
    #completewith next
    .cast 369536 >>释放翱翔
step << Evoker
    >>使用“翱翔之能”|T2103880:0|t[向前冲刺](1)和|T2103876:0|t[向上攀升](2). |cRXP_WARN_请确保飞过环形目标|r
    .goto 2118,52.78,35.59
    .complete 64873,7 --3/3 Soar through rings
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dervishian|r交谈
	.target Dervishian
    .goto 2118,44.71,57.63
    .turnin 64873 >>交任务: |cRXP_FRIENDLY_[Stretch Your Wings]|r
    .accept 65036 >>接任务: |cRXP_WARN_[Train Like We Fight]|r
step << Evoker
    >>使用 |T4622485:0|t[飞翔]
    .complete 65036,1 --Practice Soar
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .goto 2118,44.23,61.16
    .turnin 65036 >>交任务: |cRXP_FRIENDLY_[Train Like We Fight]|r
    .accept 65060 >>接任务: |cRXP_WARN_[Caldera of the Menders]|r
step << Evoker
    #completewith next
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“Scalecommander Cindrethresh”|r交谈
	.target Scalecommander Cindrethresh
    .goto 2118,36.46,32.54
    .skipgossip 1
    .complete 65060,1 --1/1 Meet Cindrethresh at the Caldera of the Menders
step << Evoker
    #completewith next
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“Scalecommander Cindrethresh”|r交谈
    .goto 2118,18.81,15.82
    .turnin 65060 >>交任务: |cRXP_FRIENDLY_[Caldera of the Menders]|r
    .accept 65063 >>接任务: |cRXP_WARN_[Into the Hive]|r
	.target Scalecommander Cindrethresh
step << Evoker
    >>|cRXP_WARN_不要跟着他|r. 只需按照箭头指示, 站在毒气中即可填满进度条
    .goto 2110,84.91,77.00
    .complete 65063,1 --1/1 Follow Cindrethresh
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander 维里迪亚|r和|cRXP_FRIENDLY_Scalecommander 金德瑞斯|r交谈
    .turnin 65063 >>交任务: |cRXP_FRIENDLY_[Into the Hive]|r
    .accept 65073 >>接任务: |cRXP_WARN_[A Toxic Problem]|r
    .goto 2118,20.08,19.08
    .accept 65074 >>接任务: |cRXP_WARN_[Easy Prey]|r
    .goto 2118,20.22,19.00
	.target Scalecommander Viridia
	.target Scalecommander Cindrethresh
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    #completewith next
    +快速按空格键比正常行走更快
step << Evoker
    #completewith next
    >>杀死该区域内的|cRXP_ENEMY_Scythid|r
    .complete 65074,1 --4/4 Scythid slain
    .mob Scythid Steamstalker
    .mob Deatheater Scythid
step << Evoker
    >>击杀该区域内的|rXP_ENEMY_Scalerenders|c敌人. 击败他们后可获得|rXP_LOOT_腺体|r
#loop
	.line 2118,24.77,30.11,26.89,32.41,28.52,30.33,30.39,29.45,33.84,29.78,36.97,24.44,30.60,20.52
	.goto 2118,24.77,30.11,20,0
	.goto 2118,26.89,32.41,20,0
	.goto 2118,28.52,30.33,20,0
	.goto 2118,30.39,29.45,20,0
	.goto 2118,33.84,29.78,20,0
	.goto 2118,36.97,24.44,20,0
	.goto 2118,30.60,20.52,20,0
    .complete 65073,1 --6/6 Toxin Glands collected
    .mob Mature Scalerender
    .mob Scalerender Beetle
    .mob Deatheater Scythid
step << Evoker
    >>杀死该区域内的|cRXP_ENEMY_Scythid|r
    .goto 2118,35.21,24.52,30,0
    .goto 2118,31.33,24.79,30,0
#loop
	.line 2118,24.77,30.11,26.89,32.41,28.52,30.33,30.39,29.45,33.84,29.78,36.97,24.44,30.60,20.52
	.goto 2118,24.77,30.11,20,0
	.goto 2118,26.89,32.41,20,0
	.goto 2118,28.52,30.33,20,0
	.goto 2118,30.39,29.45,20,0
	.goto 2118,33.84,29.78,20,0
	.goto 2118,36.97,24.44,20,0
	.goto 2118,30.60,20.52,20,0
    .complete 65074,1 --4/4 Scythid slain
    .mob Scythid Steamstalker
    .mob Deatheater Scythid
step << Evoker
    #completewith next
    .cooldown spell,369536,>0,1
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander Cindrethresh|r和|rScalecommander Viridia|r交谈
    .goto 2118,20.59,17.44,30,0
    .turnin 65074 >>交任务: |cRXP_FRIENDLY_[Easy Prey]|r
    .goto 2118,20.23,19.01
    .turnin 65073 >>交任务: |cRXP_FRIENDLY_[A Toxic Problem]|r
    .accept 65307 >>接任务: |cRXP_WARN_[Mercy First]|r
    .goto 2118,20.07,19.08
	.target Scalecommander Cindrethresh
    .target Scalecommander Viridia
step << Evoker
    #completewith next
    +检查背包中是否有新装备
    *Check your Spellbook for Emerald Blossom and Fury of the Aspect(if you are 60)
step << Evoker
    >>对任意一名|cRXP_FRIENDLY_受伤的龙族|r使用 |T4622457:0:0|t[翡翠之花]. 然后与|cRXP_PICK_翡翠之花注入器|r互动以重置冷却时间
    *Alternatively use |T4622464:0:0|t[Living Flame]
    .complete 65307,3 --1/1 Atrenosh Hailstone healed
    .goto 2118,24.90,13.59
    .complete 65307,2 --4/4 Injured drakonid healed
    .goto 2118,24.90,13.59
    .target Injured Drakonid
step << Evoker
    >>对任意一名 |cRXP_FRIENDLY_受伤的爪牙|r 使用 |T4622457:0:0|t[翡翠之花]. 然后与 |cRXP_PICK_翡翠之花注入器|r 互动以重置你的冷却时间
    *Alternatively use |T4622464:0:0|t[Living Flame]
    .goto 2118,25.77,17.75,15,0
    .goto 2118,25.89,18.55,15,0
    .goto 2118,24.03,22.16,15,0
    .goto 2118,21.89,22.21
    .complete 65307,1 --10/10 Injured dracthyr healed
    .target Injured Talon
step << Evoker
    #requires Area3
    .goto 2118,21.76,18.36,15,0
    .goto 2118,20.61,17.41,15,0
    .goto 2118,20.06,19.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官维里迪亚(Viridia)|r交谈
	.target Scalecommander Viridia
    .turnin 65307 >>交任务: |cRXP_FRIENDLY_[Mercy First]|r
    .accept 66324 >>接任务: |cRXP_WARN_[Never Forgotten]|r
step << Evoker
    #completewith TheForbiddenReachNeverForgotten3
    +|cRXP_WARN_几乎在冷却结束时使用[额外动作按钮]来降低毒性等级|r
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与地面上的 |cRXP_PICK_Report: 虫群侵扰|r 互动
    .goto 2110,66.63,67.70
    .complete 66324,2 --1/1 Clues discovered
    .use 191729
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t搜索|cRXP_FRIENDLY_Karinasa|r
    .goto 2110,39.43,28.74
    .complete 66324,1,1 --3/3 Horn signets collected
    .use 191729
    .target Karinasa
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t搜索|cRXP_FRIENDLY_Rethenash|r
    .goto 2110,34.49,38.6
    .complete 66324,1,2 --3/3 Horn signets collected
    .use 191729
    .target Rethenash
step << Evoker
    #label TheForbiddenReachNeverForgotten3
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t搜索|cRXP_FRIENDLY_Tenezeth|r
    .goto 2110,18.66,50.86
    .complete 66324,1,3 --3/3 Horn signets collected
    .use 191729
    .target Tenezeth
step << Evoker
    #completewith TheForbiddenReachNeverForgotten10
    +|cRXP_WARN_仅使用 |cffffff00[额外动作按钮]|r, 保持在50-60%左右即可|r
step << Evoker
    #completewith next
    .goto 2110,27.74,45.67
    .cast 6478 >>拾起地上的|cRXP_PICK_Crystal Key|r
step << Evoker
    #label TheForbiddenReachNeverForgotten10
    >>将水晶钥匙放入|cRXP_PICK_Crystal Lock|r中
    .goto 2110,25.6,33.76
    .complete 66324,3 --10/10 Survivors Rescued
    .use 191729
step << Evoker
    #completewith next
    .goto 2110,32.46,40.74,10,0
    +|cRXP_WARN_请停止使用[额外动作按钮]. 只需让它自然发生即可！|r. 进入毒气云以产生更多毒性
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官维里迪亚(Viridia)|r交谈
	.target Scalecommander Viridia
    .goto 2118,20.07,19.08
    .turnin 66324 >>交任务: |cRXP_FRIENDLY_[Never Forgotten]|r
    .accept 65075 >>接任务: |cRXP_WARN_[The Healing Wings]|r
step << Evoker
    #completewith next
    +检查背包中是否有新装备
    *Check your Spellbook for Hover
step << Evoker
    >>进入空气漩涡, 返回至|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
    .goto 2118,20.4,19.6,5,0
    .goto 2118,44.24,61.17
    .turnin 65075 >>交任务: |cRXP_FRIENDLY_[The Healing Wings]|r
    .accept 65045 >>接任务: |cRXP_WARN_[Stormsunder Crater]|r
    .target Scalecommander Emberthal
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Treysh|r. Choose any mount of you like (Ctrl+|TInterface/cursor/crosshair/interact.blp:20|t点击预览)
    .goto 2118,45.31,61.34
    .turnin 72263 >>交任务: |cRXP_FRIENDLY_[Cavalry Has Its Place]|r
step << Evoker
    #completewith TheForbiddenReachStormsunderCrater
    +|cRXP_WARN_请将坐骑放入背包, 并拖拽到动作条上|r.
step << Evoker
    #completewith next
    .cooldown spell,369536,>0,1
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    #label TheForbiddenReachStormsunderCrater
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿祖拉瑟尔·斯凯尔指挥官|r和|cRXP_FRIENDLY_德维希安|r交谈
    .turnin 65045 >>交任务: |cRXP_FRIENDLY_[Stormsunder Crater]|r
    .accept 65049 >>接任务: |cRXP_WARN_[Tangle with the Tarasek]|r
    .accept 65050 >>接任务: |cRXP_WARN_[Conjured Army]|r
    .goto 2118,70.43,64.35
    .accept 65046 >>接任务: |cRXP_WARN_[The Primalists]|r
    .goto 2118,70.36,64.61
    .target Scalecommander Azurathel
    .target Dervishian
step << Evoker
    #completewith TheForbiddenReachThePrimalists1
    +提醒:你现在可以骑乘了
step << Evoker
    #sticky
    #label TheForbiddenReachConjuredArmy
    >>击杀|cRXP_ENEMY_被召唤的元素|r
    .goto 2118,76.04,66.83,0,0
    .complete 65050,1 --12/12 Conjured elementals slain
    .mob Conjured Stormling
step << Evoker
    #completewith next
    >>击杀|cRXP_ENEMY_Taraseks|r
    .complete 65049,1 --7/7 Tarasek slain
    .mob Infused Tarasek
    .mob Tarasek Shockbringer
    .mob Tarasek Shockshaman
step << Evoker
    #label TheForbiddenReachThePrimalists1
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与漂浮的|cRXP_PICK_stones|r互动
    .goto 2118,71.87,60.20
    .complete 65046,1 --1/1 Primalist intentions discovered
step << Evoker
    #completewith TheForbiddenReachThePrimalists
    >>击杀|cRXP_ENEMY_Taraseks|r
    .complete 65049,1 --7/7 Tarasek slain
    .mob Infused Tarasek
    .mob Tarasek Shockbringer
    .mob Tarasek Shockshaman
step << Evoker
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与漂浮的|cRXP_PICK_stones|r互动
    .goto 2118,71.93,54.52
    .complete 65046,3 --1/1 Primalist leaders discovered
step << Evoker
    #completewith next
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    #label TheForbiddenReachThePrimalists
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与漂浮的|cRXP_PICK_stones|r互动
    .goto 2118,78.25,66.47
    .complete 65046,2 --1/1 Primalist motivations discovered
step << Evoker
    >>击杀|cRXP_ENEMY_Taraseks|r
    .goto 2118,77.71,68.82,30,0
    .goto 2118,74.28,68.59,30,0
    .goto 2118,73.49,65.82,20,0
    .goto 2118,70.78,60.33,30,0
    .goto 2118,74.91,56.79
    .complete 65049,1 --7/7 Tarasek slain
    .mob Infused Tarasek
    .mob Tarasek Shockbringer
    .mob Tarasek Shockshaman
step << Evoker
    #requires TheForbiddenReachConjuredArmy
    .goto 2118,79.42,62.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德维希安人|r和|cRXP_FRIENDLY_鳞甲指挥官阿祖拉瑟尔|r交谈
    .turnin 65046 >>交任务: |cRXP_FRIENDLY_[The Primalists]|r
    .turnin 65049 >>交任务: |cRXP_FRIENDLY_[Tangle with the Tarasek]|r
    .turnin 65050 >>交任务: |cRXP_FRIENDLY_[Conjured Army]|r
    .accept 65052 >>接任务: |cRXP_WARN_[The Ebon Scales]|r
    .target Dervishian
    .target Scalecommander Azurathel
step << Evoker
    #completewith next
    +检查背包中是否有新装备
    *Check your Spellbook for new Spells
step << Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    >>一旦看到[ExtraActionButon], 立即按下它
    .goto 2118,81.32,56.81
    .complete 65052,1 --1/1 Attack on Ekrazathal signaled
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阵营的|cRXP_FRIENDLY_斯卡尔指挥官萨卡雷思|r交谈
	.target Scalecommander Sarkareth
    .goto 2118,81.22,53.96
    .turnin 65052 >>交任务: |cRXP_FRIENDLY_[The Ebon Scales]|r
    .accept 65057 >>接任务: |cRXP_WARN_[Rally to Emberthal]|r
step << Evoker
    #completewith next
    .hs >>传送至禁忌之地
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .goto 2118,44.22,61.17
    *您可以跳过下一个过场动画(Esc → 是)
    .turnin 65057 >>交任务: |cRXP_FRIENDLY_[Rally to Emberthal]|r
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .goto 2118,44.83,57.69
    .accept 65701 >>接任务: |cRXP_WARN_[Preservation, Augmentation, or Devastation]|r
step << Evoker
    >>选择毁灭(DPS)或守护(治疗)
    .complete 65701,1 --1/1 Activate a Talent Spec
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .goto 2118,44.83,57.69
    .turnin 65701 >>交任务: |cRXP_FRIENDLY_[Preservation, Augmentation, or Devastation]|r
    .accept 65084 >>接任务: |cRXP_WARN_[The Froststone Vault]|r
step << Evoker
    #completewith next
    +检查背包中是否有新装备
    *Check your Spellbook for new spells
step << Evoker
    #completewith next
    .cast 369536 >>施放“ soar”并跟随箭头
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阵营的|cRXP_FRIENDLY_斯卡尔指挥官萨卡雷思|r交谈
	.target Scalecommander Sarkareth
    .goto 2118,56.72,28.18
    .turnin 65084 >>交任务: |cRXP_FRIENDLY_[The Froststone Vault]|r
    .accept 65087 >>接任务: |cRXP_WARN_[The Prize Inside]|r
step << Evoker
    >>使用翡翠之花和活焰治疗NPC并击杀敌人
    *The best way is to find a |cRXP_FRIENDLY_Azuresworn Drakonid|r. with very low HP and heal him.
    .goto 2118,54.52,31.64
    .complete 65087,1 --Froststone Vault defended (100%)
step << Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阵营的|cRXP_FRIENDLY_斯卡尔指挥官萨卡雷思|r交谈
	.target Scalecommander Sarkareth
    .goto 2118,56.35,28.75
    .turnin 65087 >>交任务: |cRXP_FRIENDLY_[The Prize Inside]|r
step << Evoker
    .goto 2118,54.10,32.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .accept 65097 >>接任务: |cRXP_WARN_[Run!]|r
step << Evoker
    #completewith TheForbiddenReachFinalOrders
    +|cRXP_WARN_提醒:按空格键移动比正常行走更快|r.
step << Evoker
    >>立即开始跑向 |cRXP_FRIENDLY_拉希奥|r
    .goto 2118,47.02,35.52
    .complete 65097,1 --1/1 Outrun the Avatar of the Storm
step << Evoker
    >>前往|cRXP_FRIENDLY_拉希奥|r
    .goto 2118,47.75,34.69
    .complete 65097,2 --Wrathion found
step << Evoker
    >>治疗|cRXP_FRIENDLY_拉希奥|r 使用活焰和翡翠之花
    .goto 2118,47.09,35.38
    .complete 65097,3 --1/1 Wrathion healed
    .target Wrathion
step << Evoker
    .goto 2118,47.04,35.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉希奥|r交谈
	.target Wrathion
    .turnin 65097 >>交任务: |cRXP_FRIENDLY_[Run!]|r
    .accept 65098 >>接任务: |cRXP_WARN_[The Consequence of Courage]|r
step << Evoker
    >>避免拉怪. 跟随箭头指示
    .goto 2118,45.96,40.26
    .complete 65098,1 --1/1 Ebyssian found
step << Evoker
    >>使用活火和翡翠之花将|cRXP_FRIENDLY_Ebyssian|r的生命值治疗超过90%
    .goto 2118,43.22,38.26
    .complete 65098,2 --1/1 Ebyssian healed
    .target Ebyssian
step << Evoker
    .goto 2118,41.68,44.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官埃博尔塔尔(Scalecommander Emberthal)|r交谈
	.target Scalecommander Emberthal
    .turnin 65098 >>交任务: |cRXP_FRIENDLY_[The Consequence of Courage]|r
    .accept 65100 >>接任务: |cRXP_WARN_[Final Orders]|r
step << Evoker
    #completewith next
    +检查背包中是否有新装备
step << Evoker
    >>跟随箭头指引
    .goto 2118,41.79,53.44
    .complete 65100,1 --1/1 Reach the Old Weyrn Grounds
step << Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺兹多姆|r交谈
    .goto 2118,42.98,59.63,25,0
    .goto 2118,43.57,59.68
    .complete 65100,2 --1/1 Speak with Nozdormu
    .target Nozdormu
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Viridia|r交谈
	.target Viridia
    .goto 2118,43.47,54.15
    .skipgossip 1
    .complete 65100,4 --1/1 Viridia spoken to
step << Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarkareth|r交谈
	.target Sarkareth
    .goto 2118,47.06,55.88
    .skipgossip 1
    .complete 65100,3 --1/1 Sarkareth spoken to
step << Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Evoker
    --x .goto 2118,44.65,55.16 --x maybe talent choice based?
    #label TheForbiddenReachFinalOrders
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander 阿祖拉瑟尔|r交谈
	.target Scalecommander Azurathel
    .goto 2118,44.64,55.16
    .turnin 65100 >>交任务: |cRXP_FRIENDLY_[Final Orders]|r
step << Alliance Evoker
    #completewith next
    +检查背包中是否有新装备
step << Alliance Evoker
    .goto 37,32.26,49.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉希奥|r交谈
	.target Wrathion
    .accept 65286 >>接任务: |cRXP_WARN_龙裔交际|r
step << Alliance Evoker
    .goto 37,32.26,49.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander 阿祖拉瑟尔|r交谈
	.target Scalecommander Azurathel
    .turnin 65286 >>交任务: |cRXP_FRIENDLY_龙裔交际|r
    .accept 66513 >>接任务: |cRXP_WARN_探路假期|r
step << Alliance Evoker
    >>跟随路径点
    .goto 84,62.63,77.65
    .complete 66513,2 --Visit the Bank
step << Alliance Evoker
    >>跟随路径点
    .goto 84,61.60,72.29
    .complete 66513,1 --Visit the Auction House
step << Alliance Evoker
    >>跟随路径点
    .goto 84,49.05,87.11
    .complete 66513,4 --Visit the Portal Room
step << Alliance Evoker
    >>跟随路径点
    .goto 84,52.39,13.83
    .complete 66513,3 --Visit the Embassy
step << Alliance Evoker
    .goto 84,79.93,26.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Scalecommander 阿祖拉瑟尔|r交谈
	.target Scalecommander Azurathel
    .turnin 66513 >>交任务: |cRXP_FRIENDLY_探路假期|r
step << Alliance Evoker
    .goto 84,79.84,27.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉希奥|r交谈
	.target Wrathion
    .accept 66577 >>接任务: |cRXP_WARN_守护巨龙之邀|r
    .turnin 66577 >>交任务: |cRXP_FRIENDLY_守护巨龙之邀|r
    .accept 65101 >>接任务: |cRXP_WARN_龙裔标志造型|r
step << Alliance Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉希奥|r交谈
	.target Wrathion
    .complete 65101,1 --1/1 Speak to Wrathion
step << Alliance Evoker
    >>跟随拉希奥并尽快使用额外动作按钮
    .goto 84,82.61,23.94
    .complete 65101,2 --1/1 Learn about visage form
    .complete 65101,3 --1/1 Assume your mortal visage
step << Alliance Evoker
    .goto 84,82.58,23.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉希奥|r交谈
	.target Wrathion
    .turnin 65101 >>交任务: |cRXP_FRIENDLY_龙裔标志造型|r
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Spiritwalker Ebonhorn|r和|cRXP_FRIENDLY_Scalecommander Cindrethresh|r交谈
    .accept 66237 >>接任务: |cRXP_WARN_[Spiritual Allies]|r
    .goto 1,45.62,12.89
    .turnin 66237 >>交任务: |cRXP_FRIENDLY_[Spiritual Allies]|r
    .accept 66534 >>接任务: |cRXP_WARN_探路假期|r
    .goto 1,45.56,12.95
    .target Spiritwalker Ebonhorn
    .target Scalecommander Cindrethresh
step << Horde Evoker
    #completewith next
    +|cRXP_WARN_提醒:您可以再次骑乘了！|r
step << Horde Evoker
    >>跟随箭头指引
    .complete 66534,4 --Visit the Portal Room
    .goto 85,55.77,90.01
    .complete 66534,2 --Visit the Bank
    .goto 85,48.97,82.67
    .complete 66534,1 --Visit the Auction House
    .goto 85,53.45,74.25
    .complete 66534,3 --Visit the Embassy
    .goto 85,38.26,80.72
step << Horde Evoker
    #completewith DracthyrHordeTrainRiding
    .cooldown spell,369536,>20,1
    .cast 369536 >>施放“ soar”并跟随箭头
step << Horde Evoker
    #completewith DracthyrHordeTrainRiding
    .noflyable 85
    .cooldown spell,369536,<1,1
    .goto 85,43.70,67.46,5 >>乘坐电梯
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“Scalecommander Cindrethresh”|r交谈
	.target Scalecommander Cindrethresh
    .goto 85,44.02,38.23
    .turnin 66534 >>交任务: |cRXP_FRIENDLY_探路假期|r
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ebyssian|r交谈
	.target Ebyssian
    .goto 85,44.06,37.93
    .accept 65437 >>接任务: |cRXP_WARN_守护巨龙之邀|r
step << Horde Evoker
    #completewith next
    +您可以跳过下一个过场动画(Esc → 是)
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ebyssian|r交谈
	.target Ebyssian
    .goto 85,44.06,37.93
    .skipgossip 190239,1
    .complete 65437,1 --1/1 Speak with Ebyssian
step << Horde Evoker
    .goto 85,44.07,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ebyssian|r交谈
	.target Ebyssian
    .turnin 65437 >>交任务: |cRXP_FRIENDLY_守护巨龙之邀|r
    .accept 65613 >>接任务: |cRXP_WARN_龙裔标志造型|r
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ebyssian|r交谈
	.target Ebyssian
    .goto 85,44.07,37.96
    .skipgossip 190239,1
    .complete 65613,1 --1/1 Ask Ebyssian about Visage Form
step << Horde Evoker
    >>等待|cRXP_FRIENDLY_Ebyssian|r完成他的故事
    .goto 85,44.06,37.96
    .complete 65613,2 --1/1 Learn about Visage Form
step << Horde Evoker
    >>使用[额外动作按钮]
    .goto 85,44.06,37.96
    .complete 65613,3 --1/1 Adopt a Visage Form
step << Horde Evoker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ebyssian|r交谈
	.target Ebyssian
    .goto 85,44.09,37.98
    .turnin 65613 >>交任务: |cRXP_FRIENDLY_龙裔标志造型|r
]])

--Earthen Hall of Awakening
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 地质矮人入门
#displayname |cFF00CCFF1|r - 觉醒大厅 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next <<Alliance
#next <<Horde


<< EarthenDwarf


step
    .goto 2322,89.47,48.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .accept 79200 >>接任务: |cRXP_WARN_[Who am I?]|r
    .target Dawn
step
    .goto 2322,87.04,49.47
    >>Step on the scanner and |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Diagnostics Scan|r.
    .complete 79200,1 --1/1 Diagnostics Scan completed
    .target Diagnostics Scanner
step
    .goto 2322,83.70,60.93
    >>Step on the scanner and |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Cognitive Scan|r.
    .complete 79200,2 --1/1 Cognitive Scan completed
    .target Cognitive Scan
step
    .goto 2322,83.77,37.91
    >>Step on the scanner and |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Anomaly Scan|r.
    .complete 79200,3 --1/1 Anomaly Scan completed
    .target Anomaly Scan
step
    .goto 2322,83.77,37.91
    >>|cRXP_WARN_使用|r[ExtraActionButton], 当它出现时
    .complete 79200,4 --1/1 Containment Protocol disrupted
step
    .goto 2322,77.74,47.98,10,0
    .goto 2322,75.05,47.28,10,0
    .goto 2322,73.42,44.47,10,0
    .goto 2322,67.84,48.14,10,0
    .goto 2322,62.64,49.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 79200 >>交任务: |cRXP_FRIENDLY_[Who am I?]|r
    .target Dawn
step
    .goto 2322,62.61,49.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头乌兹贾克斯|r交谈
    .accept 79201 >>接任务: |cRXP_WARN_[The Analysis Interface]|r
    .target Foreman Uzjax
step
    .goto 2322,61.40,47.07
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Primary Interface|r
    .complete 79201,1 --1/1 Primary analysis completed
    .skipgossip 224809,1,1,1
    .target Primary Interface
step
    .goto 2322,61.40,51.92
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Secondary Interface|r
    .complete 79201,2 --1/1 Secondary analysis completed
    .skipgossip 224797,1,1,1
    .target Secondary Interface
step
    .goto 2322,57.37,49.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tertiary 界面|r
    .complete 79201,3 --1/1 Tertiary analysis completed
    .skipgossip 224810,1,1,1
    .target Tertiary Interface
step
    .goto 2322,48.29,51.51,10,0
    .goto 2322,47.77,54.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 79201 >>交任务: |cRXP_FRIENDLY_[The Analysis Interface]|r
    .target Dawn
    .accept 79202 >>接任务: |cRXP_WARN_土灵硬碰硬|r
step
    #loop
    .goto 2322,46.06,57.69,10,0
    .goto 2322,42.75,59.04,10,0
    .goto 2322,41.89,55.26,10,0
    .goto 2322,40.86,53.62,10,0
    .goto 2322,42.87,51.96,10,0
    .goto 2322,45.57,52.53,10,0
    .goto 2322,45.94,49.31,10,0
    .goto 2322,47.17,48.85,10,0
    .goto 2322,48.34,46.44,10,0
    .goto 2322,47.55,43.92,10,0
    .goto 2322,45.94,41.24,10,0
    .goto 2322,42.74,39.91,10,0
    .goto 2322,41.86,42.16,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_觉醒的风暴手|r和|cRXP_FRIENDLY_觉醒的机械师|r交谈并击败他们
    *|cRXP_WARN_only speak to one at a time|r.
    .complete 79202,1 --6/6 Earthen defeated in combat
    .mob Awakened Stormhand
    .mob Awakened Machinist
    .target Awakened Machinist
    .target Awakened Stormhand
    .skipgossip
step
    .goto 2322,36.05,49.9,10,0
    .goto 2322,30.75,48.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 79202 >>交任务: |cRXP_FRIENDLY_土灵硬碰硬|r
    .target Dawn
step
    .goto 2322,30.95,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库尔达斯|r交谈
    .accept 79203 >>接任务: |cRXP_WARN_[Authorization: Negated]|r
    .timer 6,RP
    .target Speaker Kuldas
step
    .goto 2322,25.91,49.65
    >>击杀|cRXP_ENEMY_Phalanx of Authorization|r
    .complete 79203,1 --1/1 Phalanx of Authorization slain
    .timer 22,RP
    .mob Phalanx of Authorization
step
    .goto 2322,16.33,48.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库尔达斯|r交谈
    .turnin 79203 >>交任务: |cRXP_FRIENDLY_[Authorization: Negated]|r
    .target Speaker Kuldas
    .accept 79204 >>接任务: |cRXP_WARN_[Whoever You Want to Be]|r
step
    .goto 2322,8.62,49.68
    #title |cFFFCDC00跟随箭头指引|r.
    .complete 79204,1 --1/1 Meet Dawn in the Awakening Vestibule
step
    .goto 2322,8.63,49.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dawn|r交谈
    .turnin 79204 >>交任务: |cRXP_FRIENDLY_[Whoever You Want to Be]|r
    .target Dawn
    .accept 81886 >>接任务: |cRXP_WARN_为了联盟|r << Alliance
    .accept 81888 >>接任务: |cRXP_WARN_为了部落！|r << Horde
step << Alliance
    #completewith next
    .goto 2322,7.3,46.27
    .zone 84 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r
step << Alliance
    .goto 84,53.03,15.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
    .turnin 81886 >>交任务: |cRXP_FRIENDLY_为了联盟|r
    .target Ambassador Moorgard
    .accept 81887 >>接任务: |cRXP_WARN_异乡异客|r
step << Alliance
    .goto 84,56.24,17.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
    .complete 81887,1 --1/1 与克罗米交谈
    .skipgossip
    .target Chromie
step << Alliance
    .goto 84,56.19,17.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Adhelda|r交谈
    .turnin 81887 >>交任务: |cRXP_FRIENDLY_异乡异客|r
    .target Adhelda
step << Horde
    #completewith next
    .goto 2322,7.16,52.62
    .zone 85 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_传送门|r
step << Horde
    .goto 85,39.40,79.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
    .turnin 81888 >>交任务: |cRXP_FRIENDLY_为了部落！|r
    .target Ambassador Blackguard
    .accept 81889 >>接任务: |cRXP_WARN_异乡异客|r
step << Horde
    .goto 85,40.82,80.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
    .complete 81889,1 --1/1 与克罗米交谈
    .skipgossip 167032,1
    .target Chromie
step << Horde
    .goto 85,40.77,80.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布鲁诺尔|r交谈
    .turnin 81889 >>交任务: |cRXP_FRIENDLY_异乡异客|r
    .target Brunhold
]])

--Pandaren The Wandering Isle
RXPGuides.RegisterGuide([[
#retail
#version 1
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name b) 熊猫人入门
#displayname |cFF00CCFF1|r - 迷踪岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde

<< Pandaren !DK

step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .accept 30034 >>接任务: |cRXP_WARN_武装训练|r << Hunter
    .accept 30027 >>接任务: |cRXP_WARN_武装训练|r << Priest/Monk
    .accept 30033 >>接任务: |cRXP_WARN_武装训练|r << Mage
    .accept 30037 >>接任务: |cRXP_WARN_武装训练|r << Shaman
    .accept 30038 >>接任务: |cRXP_WARN_武装训练|r << Warrior
    .accept 30036 >>接任务: |cRXP_WARN_武装训练|r << Rogue
	.target Master Shang Xi
step << Hunter
    .isOnQuest 30034
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取|T537025:0|t[见习者的十字弓]
    .collect 73211,1 --Trainee's Crossbow (1)
step << Hunter
    .goto 378,57.22,19.22
    >>装备 |T537025:0|t[学徒十字弓]
    .complete 30034,1 --1/1 Loot and Equip a Trainee's Crossbow
    .use 73211 --Trainee's Crossbow
step << Mage
    .isOnQuest 30033
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取 |T537771:0|t[学徒法刃] 和 |T654237:0|t[学徒扇].
    .collect 76390,1 --Trainee's Spellblade (1)
    .collect 76392,1, --Trainee's Hand Fan (1)
step << Mage
    .goto 378,57.22,19.22
    >>装备|T537771:0|t[学徒法术之刃]和|T654237:0|t[学徒扇].
    .complete 30033,1 --Loot and Equip a Trainee's Spellblade (1)
    .complete 30033,2 --Loot and Equip a Trainee's Hand Fan (1)
    .use 76390 --Trainee's Spellblade
    .use 76392 --Trainee's Hand Fan
step << Monk/Priest
    .isOnQuest 30027
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取 |T537770:0|t[见习者法杖]
    .collect 73209,1 -Trainee's Staff (1)
step << Monk/Priest
    .goto 378,56.67,18.20
    >>装备 |T537770:0|t[学徒法杖]
    .complete 30027,1 --Loot and Equip a Trainee's Staff
    .use 73209
step << Shaman
    .isOnQuest 30037
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取 |T537205:0|t[学徒之斧] 和 |T537769:0|t[学徒之盾]
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1 --Trainee's Shield (1)
step << Shaman
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学徒之斧]和|T537769:0|t[学徒之盾]
    .complete 30037,1 --Loot and Equip a Trainee's Axe
    .complete 30037,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取 |T537205:0|t[学徒之斧] 和 |T537769:0|t[学徒之盾]
    .collect 76391,1  --Trainee's Axe (1)
    .collect 73213,1  --Trainee's Shield (1)
step << Warrior
    .isOnQuest 30038
    .goto 378,57.22,19.22
    >>装备|T537205:0|t[学徒之斧]和|T537769:0|t[学徒之盾]
    .complete 30038,1 --Loot and Equip a Trainee's Axe
    .complete 30038,2 --Loot and Equip a Trainee's Shield
    .use 76391 --Trainee's Axe
    .use 73213 --Trainee's Shield
step << Rogue
    .isOnQuest 30036
    .goto 378,57.22,19.22
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_武器架|r获取|T537767:0|t[学徒匕首]
    .collect 73208,1,30036,1,1 --Trainee's Dagger (ID 1)
    .collect 73212,1,30036,1,1 --Trainee's Dagger (ID 2)
step << Rogue
    .goto 378,57.22,19.22
    >>装备|T537767:0|t[学徒匕首]
    .complete 30036,1 --Loot and Equip a Trainee's Dagger
    .complete 30036,2 --Loot and Equip a Second Trainee's Dagger
    .use 73208 --Trainee's Dagger (ID 1)
    .use 73212 --Trainee's Dagger (ID 2)
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 30034 >>交任务: |cRXP_FRIENDLY_武装训练|r << Hunter
    .turnin 30033 >>交任务: |cRXP_FRIENDLY_武装训练|r << Mage
    .turnin 30027 >>交任务: |cRXP_FRIENDLY_武装训练|r << Priest/Monk
    .turnin 30037 >>交任务: |cRXP_FRIENDLY_武装训练|r << Shaman
    .turnin 30038 >>交任务: |cRXP_FRIENDLY_武装训练|r << Warrior
    .turnin 30036 >>交任务: |cRXP_FRIENDLY_武装训练|r << Rogue
    .accept 29406 >>接任务: |cRXP_WARN_沙袋训练|r
	.target Master Shang Xi
step
    .goto 378,57.49,18.64,10,0
    .goto 378,57.12,19.43,10,0
    .goto 378,57.49,18.64,10,0
    .goto 378,57.12,19.43,10,0
    .goto 378,57.31,18.97
    >>击杀|cRXP_ENEMY_沙袋|r
    .complete 29406,1 --5/5 Training Targets destroyed
	.mob Training Target
step
    .goto 378,56.67,18.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29406 >>交任务: |cRXP_FRIENDLY_沙袋训练|r
    .accept 29524 >>接任务: |cRXP_WARN_戒骄|r
	.target Master Shang Xi
step
    .goto 378,59.53,19.03,15,0
    .goto 378,60.30,19.00,10,0
    .goto 378,60.13,19.77,10,0
    .goto 378,60.44,19.47
    >>进入|r建筑|r并击败|cRXP_ENEMY_Sparring Trainees|r训练学员
    .complete 29524,1 --6/6 Sparring Trainees defeated
	.mob Tushui Trainee
	.mob Huojin Trainee
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29524 >>交任务: |cRXP_FRIENDLY_戒骄|r
    .accept 29408 >>接任务: |cRXP_WARN_烧毁卷轴|r
	.target Master Shang Xi
step
    .isOnQuest 29408
    .goto 378,59.97,18.58,8,0
    .goto 378,60.48,18.85,5,0
    .goto 378,60.20,18.89,5,0
    .goto 378,59.98,18.69,5,0
	.goto 378,60.46,19.60,8 >>|cRXP_WARN_T通过跳过第二组楼梯下方的缺口, 走捷径到达顶层|r
step
    .goto 378,59.95,20.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Banner|r燃烧它
    .complete 29408,2 --1/1 Burn the Edict of Temperance
step
	#completewith next
    .goto 378,60.19,19.35,6 >>|cRXP_WARN_跳下楼梯|r.
step
    .goto 378,59.67,19.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29408 >>交任务: |cRXP_FRIENDLY_烧毁卷轴|r
    .accept 29409 >>接任务: |cRXP_WARN_门徒的挑战|r
	.target Master Shang Xi
step
    .goto 378,67.78,22.75
    >>击败 |cRXP_ENEMY_Jaomin|r
    .complete 29409,1 --1/1 Defeat Jaomin Ro
	.mob Jaomin Ro
step << Warrior
	#completewith Lorvo
    +使用 |T132337:0|t充能对小动物施放, 使其移动更快
step
    .goto 378,65.97,22.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29409 >>交任务: |cRXP_FRIENDLY_门徒的挑战|r
    .accept 29410 >>接任务: |cRXP_WARN_土水派的艾莎|r
	.target Master Shang Xi
step
	#label Lorvo
    .goto 378,55.09,32.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人罗福|r交谈
    .turnin 29410 >>交任务: |cRXP_FRIENDLY_土水派的艾莎|r
    .accept 29419 >>接任务: |cRXP_WARN_失踪的车夫|r
    .accept 29424 >>接任务: |cRXP_WARN_至关重要的物品|r
	.target Merchant Lorvo
step
    #completewith next
    >>击杀|r珀叶精怪|r并从它们身上搜刮出|r|T132622:0|t[|cRXP_LOOT_补给|r]
    .complete 29424,1 --6/6 Stolen Training Supplies
	.mob Amberleaf Scamp
step
    .goto 378,54.11,20.90
    >>|cRXP_WARN_跟随箭头|r
    .complete 29419,1 --1/1 Rescue the Cart Driver
	.target Min Dimwind
step
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44,15,0
    .goto 378,53.00,20.17,15,0
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44
    >>击杀|r珀叶精怪|r并从它们身上搜刮出|r|T132622:0|t[|cRXP_LOOT_补给|r]
    .complete 29424,1 --6/6 Stolen Training Supplies
	.target Amberleaf Scamp
step
    .isOnQuest 29424
    .goto 378,54.03,20.93,15,0
    .goto 378,54.02,17.44,15,0
    .goto 378,53.00,20.17,15,0
    .goto 378,54.03,20.93
    >>|cRXP_WARN_1./sit 会使你受到的伤害增加|r.
    >>|cRXP_WARN_2.卸下装备会增加你所受到的伤害|r.
    .deathskip >>死亡并重生|cRXP_WARN_在灵魂医者|r
	.target Spirit Healer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_商人罗福|r和|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29419,2 >>交任务: |cRXP_FRIENDLY_失踪的车夫|r
    .turnin 29424 >>交任务: |cRXP_FRIENDLY_至关重要的物品|r
    .goto 378,55.11,32.40
    .accept 29414 >>接任务: |cRXP_WARN_土水之道|r
    .goto 378,55.10,32.55
	.target Merchant Lorvo
	.target Aysa Cloudsinger
step << Hunter
    .isOnQuest 29414
    .goto 378,56.25,30.34,30,0
    .goto 378,57.97,30.62
    .tame 57797 >>|cRXP_WARN_驯服一只沙狐|r
	.target Corsac Fox
step
	.isOnQuest 29414
    .goto 378,55.61,30.90,15,0 << !Hunter
    .goto 378,55.94,30.96,10,0
    .goto 378,56.58,31.98,10,0
    .goto 378,57.89,36.55,15 >>进入|r
	.timer 87,Cave RP
step
    #sticky
    .goto 378,57.89,36.55,10,0
    >>保护|cRXP_FRIENDLY_Aysa|r不受即将到来的|cRXP_ENEMY_珀叶捣蛋鬼|r的攻击
    .complete 29414,1 --1/1 Protect Aysa while she meditates
	.mob Amberleaf Troublemaker
step
    #title Advanced
    .isOnQuest 29414
    >>|cFFFF0000试试找出|r
    .goto 378,57.52,34.59,5 >>|cRXP_WARN_ 待在入口附近更快, 但更危险|r.
step
    .goto 378,57.54,34.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29414 >>交任务: |cRXP_FRIENDLY_土水之道|r
    .accept 29522 >>接任务: |cRXP_WARN_火金派的季|r
	.target Master Shang Xi
step << Hunter
    .isOnQuest 29522
    .hs >>壁炉|cRXP_WARN_前往尚熙训练场|r
step
    .goto 378,50.24,21.26
    >>爬上树根, 然后脱离战斗, 跃向左侧的墙壁 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29522 >>交任务: |cRXP_FRIENDLY_火金派的季|r
    .accept 29417 >>接任务: |cRXP_WARN_火金之道|r
	.target Ji Firepaw
step
    .goto 378,51.18,17.71,20,0
    .goto 378,49.56,18.31,20,0
    .goto 378,49.49,20.13,20,0
    .goto 378,48.27,22.97,20,0
    .goto 378,49.23,24.48,20,0
    .goto 378,49.90,23.37,20,0
    .goto 378,51.18,17.71,20,0
    .goto 378,49.56,18.31,20,0
    .goto 378,49.49,20.13,20,0
    .goto 378,48.27,22.97,20,0
    .goto 378,49.23,24.48,20,0
    .goto 378,49.90,23.37
    >>击杀|cRXP_ENEMY_猢狲|r
    .complete 29417,1 --8/8 Fe-Feng attackers slain
	.mob Fe-Feng Hozen
    .mob Fe-Feng Brewthief
    .mob Fe-Feng Leaper
step
    .goto 378,50.24,21.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29417 >>交任务: |cRXP_FRIENDLY_火金之道|r
    .accept 29418 >>接任务: |cRXP_WARN_点火|r
    .accept 29523 >>接任务: |cRXP_WARN_煽风|r
	.target Ji Firepaw
step
    .isOnQuest 29523
    #completewith Fluttering Breeze
    +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
    *[1] Press the |cRXP_WARN_Escape key|r.
    *[2] Select |cRXP_WARN_Options|r.
    *[3] Navigate to |cRXP_WARN_Keybindings|r.
    *[4] Within |cRXP_WARN_Keybindings|r,find |cRXP_WARN_RestedXP Guides|r.
    *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
step
    #completewith Fluttering Breeze
	>>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Roots|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    .isOnQuest 29523
    .goto 378,48.63,29.43,10,0
    .goto 378,47.98,31.94,10,0
    .goto 378,47.29,31.43
	.cast 106299 >>在祭坛处使用|T519378:0|t[风之石]
    .use 72109
step
    #label Fluttering Breeze
    .goto 378,46.73,30.32,10,0
    >>击杀|cRXP_ENEMY_活体之气|r, 并从其身上搜刮出 |T463565:0|t[|cRXP_LOOT_颤动的微风|r]
    .complete 29523,1 --1/1 Fluttering Breeze
    .use 72109
	.mob Living Air
step
    .goto 378,46.07,27.94,10,0
    .goto 378,48.99,30.16,10,0
    .goto 378,46.83,34.88,10,0
    .goto 378,46.04,33.12,10,0
    .goto 378,47.39,29.11
	>>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_Roots|r
    .complete 29418,1 --5/5 Dry Dogwood Root
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r和|cRXP_FRIENDLY_尚熙|r交谈
    .turnin 29418 >>交任务: |cRXP_FRIENDLY_点火|r
    .turnin 29523 >>交任务: |cRXP_FRIENDLY_煽风|r
    .goto 378,50.24,21.26
    .accept 29420 >>接任务: |cRXP_WARN_元素之灵守护者|r
    .goto 378,50.29,21.47
	.target Ji Firepaw
	.target Master Shang Xi
step
	.isOnQuest 29420
    .goto 378,41.09,24.83,10 >>进入|r
step
    .goto 378,40.75,23.86,10,0
    .goto 378,40.84,22.19,10,0
    .goto 378,40,22.77,10,0
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29420 >>交任务: |cRXP_FRIENDLY_元素之灵守护者|r
    .accept 29664 >>接任务: |cRXP_WARN_挑战者之火|r
	.target Master Li Fei
step
    .goto 378,38.71,25.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_火盆|r
    .complete 29664,1 --1/1 Challenger Torch lit
 step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_火盆|r
    .complete 29664,4 --1/1 Violet Brazier lit
    .goto 378,38.25,24.87
    .complete 29664,2 --1/1 Red Brazier lit
    .goto 378,38.99,23.50
    .complete 29664,3 --1/1 Blue Brazier lit
    .goto 378,39.19,25.41
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29664 >>交任务: |cRXP_FRIENDLY_挑战者之火|r
    .accept 29421 >>接任务: |cRXP_WARN_胜者方能通行|r
	.target Master Li Fei
step
    .goto 378,38.88,24.64,10,0
    .goto 378,38.81,25.51
    >>击败|cRXP_FRIENDLY_李飞大师|r, 将其生命值降至20%
    .complete 29421,1 --1/1 Defeat Master Li Fei
	.mob Master Li Fei
step
    .goto 378,38.81,25.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_李飞大师|r交谈
    .turnin 29421,2 >>交任务: |cRXP_FRIENDLY_胜者方能通行|r
    .accept 29422 >>接任务: |cRXP_WARN_上古火灵燧焰|r
	.target Master Li Fei
step
	.isOnQuest 29422
    .goto 378,39.45,29.65
	.cast 102522 >>使用|T133662:0|t[火之献祭]对|cRXP_FRIENDLY_燧焰|r使用
	.timer 11, Huo the Spirit of Fire RP
	.use 72583
    .target Huo
step
    .goto 378,39.45,29.65
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    .complete 29422,1 --1/1 Reignite the Spirit of Fire
    .use 72583
    .target Huo
step
    .goto 378,39.41,29.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_燧焰|r交谈
    .turnin 29422 >>交任务: |cRXP_FRIENDLY_上古火灵燧焰|r
    .accept 29423 >>接任务: |cRXP_WARN_神真子的热情|r
	.target Huo
step
	.isOnQuest 29423
    .goto 378,40.12,25.50,20,0
    .goto 378,41.48,25.05,20,0
    .goto 378,51.04,30.62,20,0
    .goto 378,51.89,35.93,20,0
    .goto 378,50.32,37.48,20,0
    .goto 378,51.58,40.46,20 >>前往五黎明神庙
step
    .goto 378,51.41,46.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29423 >>交任务: |cRXP_FRIENDLY_神真子的热情|r
    .accept 29521 >>接任务: |cRXP_WARN_咏之池|r
	.target Master Shang Xi
step
    .isOnQuest 29521
    .goto 378,51.83,46.08
    .home >>将炉石设置为|cRXP_WARN_五 dawn's Temple|r
	.target Cheng Dawnscrive
step
    .isOnQuest 29521
    .goto 378,53.22,47.45,10,0
    .goto 378,57.12,46.63,10,0
    .goto 378,63.12,41.44
    .skipgossip 57620,1,1
    .gossipoption 38919 >>草药学界面
    .train 2366 >>从|cRXP_FRIENDLY_Dewei|r处学习草药学
    .target Whittler Dewei
step
    .isOnQuest 29521
    .goto 378,63.12,41.44
    .skipgossip 57620,2,3
    .gossipoption 38872 >>采矿窗口
    .train 2575 >>从|cRXP_FRIENDLY_Dewei|r学习采矿技能
	.target Whittler Dewei
step
    #completewith next
    +|cRXP_WARN_在这个区域, 某些水域会让你变成动物形态, 大幅提升移动速度|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r和|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .accept 29662 >>接任务: |cRXP_WARN_比芦苇更硬|r
    .goto 378,63.50,41.93
    .turnin 29521 >>交任务: |cRXP_FRIENDLY_咏之池|r
    .accept 29661 >>接任务: |cRXP_WARN_戒躁|r
    .accept 29663 >>接任务: |cRXP_WARN_平衡训练|r
    .goto 378,65.59,42.61
	.target Jojo Ironbrow
	.target Aysa Cloudsinger
step
    .isOnQuest 29663
    #completewith next
    +|cRXP_WARN_在这个区域, 某些水域会让你变成动物形态, 大幅提升移动速度|r
step
    .isOnQuest 29663
	#completewith Shrine
    .goto 378,63.37,45.17
	.vehicle >>|TInterface/cursor/crosshair/interact.blp:20|t当您不在水中时, 点击一个|cRXP_FRIENDLY_梅花桩|r
step
    #completewith Shrine
	>>击败杆子上的土水派武僧
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    .isOnQuest 29661
	#label Shrine
    .goto 378,61.39,47.87,5 >>通过跳上最近的柱子, 向|cRXP_WARN_Shrine|r前进
step
    .goto 378,61.41,47.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Bell|r
    .complete 29661,1 --1/1 Ring the Training Bell
step
    #completewith next
	>>击败杆子上的土水派武僧
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    .goto 378,61.08,46.43,15,0
    .goto 378,61.16,45.27,15,0
    .goto 378,61.94,44.44,15,0
    .goto 378,62.77,44.86,15,0
    .goto 378,62.76,46.36,15,0
    .goto 378,62.68,48.46,15,0
    .goto 378,62.25,50,15,0
    .goto 378,60.43,48.97
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_结实的泪木芦苇|r
    .complete 29662,1 --8/8 Hard Tearwood Reed
step
    .goto 378,62.77,44.86,15,0
    .goto 378,62.76,46.36,15,0
    .goto 378,62.68,48.46,15,0
    .goto 378,62.25,50,15,0
    .goto 378,60.43,48.97,15,0
    .goto 378,62.22,44.33
	>>击败杆子上的土水派武僧
    .complete 29663,1 --6/6 Defeat Tushui Monks
	.mob Tushui Monk
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r和|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29662 >>交任务: |cRXP_FRIENDLY_比芦苇更硬|r
    .goto 378,63.50,41.93
    .turnin 29661 >>交任务: |cRXP_FRIENDLY_戒躁|r
    .turnin 29663 >>交任务: |cRXP_FRIENDLY_平衡训练|r
    .accept 29676 >>接任务: |cRXP_WARN_寻找老朋友|r
    .goto 378,65.59,42.61
	.target Jojo Ironbrow
	.target Aysa Cloudsinger
step
    #completewith next
    +|cRXP_WARN_在这个区域, 某些水域会让你变成动物形态, 大幅提升移动速度|r
step
    .goto 378,72.15,37.88,13,0
    .goto 378,70.62,38.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁老先生|r谈话
    .turnin 29676 >>交任务: |cRXP_FRIENDLY_寻找老朋友|r
    .accept 29666 >>接任务: |cRXP_WARN_吃一蛰，长一智|r
    .accept 29677 >>接任务: |cRXP_WARN_炎阳珠|r
	.target Old Man Liang
step
    .goto 378,73.86,40.37,30,0
    .goto 378,72.67,42.89,30,0
    .goto 378,75.41,37.59,30,0
    .goto 378,73.86,40.37,30,0
    .goto 378,72.67,42.89,30,0
    .goto 378,75.41,37.59
    >>击杀|r水钳虫|cRXP_ENEMY_Water Pincers|r
    .complete 29666,1 --6/6 Water Pincer slain
    .mob Water Pincer
step
    .goto 378,76.21,46.87
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_远古蛤蜊|r|cRXP_WARN_水下|r
    >>|cRXP_WARN_你不需要杀死|r|cRXP_ENEMY_盘蛇|r
    .complete 29677,1 --1/1 Sun Pearl
    .mob Fang-she
step
    .goto 378,78.48,42.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梁老先生|r谈话
    .turnin 29666 >>交任务: |cRXP_FRIENDLY_吃一蛰，长一智|r
    .turnin 29677 >>交任务: |cRXP_FRIENDLY_炎阳珠|r
    .accept 29678 >>接任务: |cRXP_WARN_上古水灵涓流|r
	.target Old Man Liang
step
	.isOnQuest 29678
    .goto 378,79.66,41.83,4,0
    .goto 378,79.61,38.72
    >>将自身定位在|r.蓝色圆圈|cRXP_WARN_上. 这将使你能够向|r.水池|cRXP_WARN_跳跃
    .complete 29678,1 --1/1 Cross to the Pool of Reflection
step
    .goto 378,79.59,38.58
    >>使用|T463854:0|t[炎阳珠]放置在|cRXP_WARN_Water's Surface|r的水面上
    .complete 29678,2 --1/1 Coax Shu, the Water Spirit
    .use 73791
step
    .goto 378,79.82,39.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击任务日志中的任务提交弹出窗口
    .turnin 29678 >>交任务: |cRXP_FRIENDLY_上古水灵涓流|r
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .accept 29679 >>接任务: |cRXP_WARN_新朋友|r
	.target Aysa Cloudsinger
step
    --x shiek : no go to here, as i think it would only be confusing here.
    >>跟随|cRXP_FRIENDLY_涓流|r紧密移动. 他会在附近的水域施放一个喷泉|cRXP_WARN_in|r. 确保将自己 positioned|cRXP_WARN_站在它上方|r
    >>在最后一次喷射将你击飞到空中后, 使用“闪避”技能  << Hunter
    >>在被弹起升空后, 使用闪现技能完成最后一次喷射 << Mage
    .complete 29679,1 --5/5 Play with the Spirit of Water
	.target Shu
step
    .goto 378,79.82,39.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29679 >>交任务: |cRXP_FRIENDLY_新朋友|r
    .accept 29680 >>接任务: |cRXP_WARN_生计来源|r
	.target Aysa Cloudsinger
step
    .goto 378,76.57,57.36,40,0
    .goto 378,68.89,64.98
	>>|cRXP_WARN_无视|r|cRXP_FRIENDLY_牛车|r. ；|cRXP_WARN_步行前往目的地会更快|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29680 >>交任务: |cRXP_FRIENDLY_生计来源|r
    .accept 29769 >>接任务: |cRXP_WARN_小无赖|r
    .target Ji Firepaw
step
    .goto 378,68.13,66.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高·夏酒|r交谈
    .accept 29770 >>接任务: |cRXP_WARN_还能吃！|r
	.target Gao Summerdraft
step
	#completewith Carrots
    >>击杀|cRXP_ENEMY_肥胖的兔妖|r
    .complete 29769,1 --10/10 Plump Virmen slain
	.mob Plump Virmen
    .mob Plump Carrotcatcher
step
    .goto 378,70.11,77.63,15,0
    .goto 378,69.55,79.23,15,0
    .goto 378,70.84,80.41,15,0
    .goto 378,71.46,78.11,15,0
#loop
	.line 378,70.11,77.63,69.55,79.23,70.84,80.41,71.46,78.11
	.goto 378,70.11,77.63,10,0
	.goto 378,69.55,79.23,10,0
	.goto 378,70.84,80.41,10,0
	.goto 378,71.46,78.11,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Turnips|r
    .complete 29770,1 --3/3 Uprooted Turnip
step
    .goto 378,75.54,72.25,20,0
    .goto 378,77.79,71.81,20,0
    .goto 378,78.01,72.56,15,0
    .goto 378,78.85,70.76,20,0
    .goto 378,78.6,69.74,20,0
#loop
	.line 378,77.35,70.51,78.12,72.61,78.82,70.88,78.6,69.75
	.goto 378,77.35,70.51,10,0
	.goto 378,78.12,72.61,10,0
	.goto 378,78.82,70.88,10,0
	.goto 378,78.60,69.75,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_南瓜|r
    .complete 29770,3 --3/3 Pilfered Pumpkin
step
	.isOnQuest 29770
    .goto 378,77.05,71.02,10 >>进入|cRXP_WARN_洞穴|r
step
	#label Carrots
    .goto 378,76.1,71.26,15,0
    .goto 378,75.57,72.94,15,0
    .goto 378,73.97,72.58,15,0
    .goto 378,73.94,70.86,15,0
    .goto 378,74.7,74.76,15,0
#loop
	.line 378,73.97,72.58,73.94,70.86,74.7,74.76
	.goto 378,73.97,72.58,5,0
	.goto 378,73.94,70.86,5,0
	.goto 378,74.70,74.76,5,0
    >>Kill |cRXP_ENEMY_Plump Carrotcatchers|r and loot them for their [|cRXP_LOOT_Carrots|r. You can also |TInterface/cursor/crosshair/interact.blp:20|tclick the |cRXP_PICK_Carrots|r]. on the ground.
    .complete 29770,2 --3/3 Stolen Carrot
	.mob Plump Carrotcatcher
step
	.isOnQuest 29770
    .goto 378,74.99,69.42,10 >>离开|cRXP_WARN_洞穴|r
step
    .goto 378,74.73,67.2,15,0
    .goto 378,72.67,69.48,15,0
    .goto 378,70.75,71.61,15,0
    .goto 378,69.4,69.74,15,0
#loop
	.line 378,77.89,70.13,77.36,70.49,77.85,71.75
	.goto 378,77.89,70.13,10,0
	.goto 378,77.36,70.49,10,0
	.goto 378,77.85,71.75,10,0
    >>击杀|cRXP_ENEMY_肥胖的兔妖|r
    .complete 29769,1 --10/10 Plump Virmen slain
	.mob Plump Virmen
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高·夏酒|r和|cRXP_FRIENDLY_季·火掌|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29770 >>交任务: |cRXP_FRIENDLY_还能吃！|r
    .goto 378,68.13,66.40
    .turnin 29769 >>交任务: |cRXP_FRIENDLY_小无赖|r
    .accept 29768 >>接任务: |cRXP_WARN_丢失的槌子|r
	.goto 378,68.89,64.98
    .accept 29771 >>接任务: |cRXP_WARN_比木头更硬|r
    .goto 378,69.16,66.71
	.target Gao Summerdraft
	.target Ji Firepaw
	.target Jojo Ironbrow
step
	#completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_木板|r
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    .goto 378,62.63,77.05
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击桶上的 |cRXP_PICK_Mallet|r
    >>|cRXP_WARN_你不必杀死|cRXP_ENEMY_拉吉斯|r. 如果可以的话, 尽量避免击杀|r
    .complete 29768,1 --1/1 Dai-Lo Recess Mallet
step
    .goto 378,63.77,77.19,15,0
    .goto 378,63.27,79.16,15,0
    .goto 378,62.94,79.04,15,0
    .goto 378,62.19,81.08,15,0
    .goto 378,63.77,77.19,15,0
    .goto 378,63.27,79.16,15,0
    .goto 378,62.94,79.04,15,0
    .goto 378,62.19,81.08
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_木板|r|cRXP_WARN_
    .complete 29771,1 --12/12 Discarded Wood Plank
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r和|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29771 >>交任务: |cRXP_FRIENDLY_比木头更硬|r
    .goto 378,69.16,66.71
    .turnin 29768 >>交任务: |cRXP_FRIENDLY_丢失的槌子|r
    .accept 29772 >>接任务: |cRXP_WARN_锣声震天|r
	.goto 378,68.89,64.98
    .target Jojo Ironbrow
    .target Ji Firepaw
step
    .goto 378,68.95,64.80
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_铜锣|r
    .complete 29772,1 --1/1 Ring the town gong
step
    .goto 378,68.89,64.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29772 >>交任务: |cRXP_FRIENDLY_锣声震天|r
    .accept 29774 >>接任务: |cRXP_WARN_别泼脸！|r
	.target Ji Firepaw
step
    .goto 378,68.98,62.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_涓流|r交谈
    .complete 29774,1 --1/1 Ask Shu for help
    .skipgossip
	.timer 15,Not In the Face! RP
	.target Shu
step
    .goto 378,68.89,64.98
    >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29774 >>交任务: |cRXP_FRIENDLY_别泼脸！|r
    .accept 29775 >>接任务: |cRXP_WARN_神真子的灵魂和躯体|r
	.target Ji Firepaw
step
	.isOnQuest 29775
    .goto 378,58.86,63.38,40,0
    .goto 378,55.23,58.57,40,0
    .goto 378,51.48,57.40,20 >>前往五 dawn 之庙
	>>|cRXP_WARN_无视|r|cRXP_FRIENDLY_牛车|r. ；|cRXP_WARN_步行前往目的地会更快|r
step
    .goto 378,51.59,48.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29775 >>交任务: |cRXP_FRIENDLY_神真子的灵魂和躯体|r
    .accept 29776 >>接任务: |cRXP_WARN_晨息村|r
	.timer 20,Morning Breeze Village RP
	.target Master Shang Xi
step
    .isOnQuest 29776
    .goto 378,51.46,48.93,7 >>|cRXP_WARN_等待短暂的角色扮演环节, 当计时器归零时将自动完成|r
step
	.isOnQuest 29776
    .goto 378,51.01,49.05,10,0
    .goto 378,40.19,50.79,20,0
    .goto 378,34.91,50.73,15,0
    .goto 378,33.1,42.6,15,0
    .goto 378,30.42,37.50,20 >>前往|cRXP_WARN_晨息村|r
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29776 >>交任务: |cRXP_FRIENDLY_晨息村|r
    .accept 29778 >>接任务: |cRXP_WARN_重写智慧|r
	.target Ji Firepaw
step
    .goto 378,30.17,39.01,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵白长老|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .accept 29777 >>接任务: |cRXP_WARN_作案工具|r
    .goto 378,31.78,39.71
    .accept 29783 >>接任务: |cRXP_WARN_比石头更硬|r
    .goto 378,29.90,39.76
	.target Elder Shaopai
	.target Jojo Ironbrow
step
    .isOnQuest 29777
    #completewith Defaced Scroll of Wisdom burned
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沈·石锲|r交谈
    .vendor >>|cRXP_WARN_ 如果需要, 请出售和修理|r
    .target Shen Stonecarver
step
    #completewith Defaced Scroll of Wisdom burned
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    #completewith Defaced Scroll of Wisdom burned
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_石块|r
    .complete 29783,1 --12/12 Abandoned Stone Block
step
    .goto 378,30.3,42.95,15,0
    .goto 378,29.49,45.36,15,0
    .goto 378,29.11,47.53,15,0
    .goto 378,29.78,47.67,15,0
    .goto 378,29.21,48.57,15,0
    .goto 378,28.37,49.37,15,0
    .goto 378,27.16,49.67,15,0
    .goto 378,28.54,49.93,15,0
    .goto 378,29.12,51.09,15,0
    .goto 378,31.19,47.97,15,0
    .goto 378,32.49,46.63,15,0
    .goto 378,33.13,46.32,15,0
#loop
	.line 378,33.42,50.88,32.57,53.31,28.71,50.23
	.goto 378,33.42,50.88,15,0
	.goto 378,32.57,53.31,15,0
	.goto 378,28.71,50.23,15,0
    #label Defaced Scroll of Wisdom burned
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击纪念碑上的旗帜
    .complete 29778,1 --5/5 Defaced Scroll of Wisdom burned
step
    #completewith next
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    .goto 378,31.18,47.97,15,0
    .goto 378,32.57,46.43,15,0
    .goto 378,33.66,47.21,15,0
    .goto 378,33.99,50.9,15,0
    .goto 378,33.06,52.27,15,0
    .goto 378,32.16,50.53,15,0
    .goto 378,31.32,52.22,15,0
#loop
	.line 378,31.18,47.9,32.57,46.43,33.99,50.9,32.16,50.53,31.32,52.22
	.goto 378,31.18,47.90,15,0
	.goto 378,32.57,46.43,15,0
	.goto 378,33.99,50.90,15,0
	.goto 378,32.16,50.53,15,0
	.goto 378,31.32,52.22,15,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_石块|r
    .complete 29783,1 --12/12 Abandoned Stone Block
step
#loop
	.line 378,31.18,47.9,32.57,46.43,33.99,50.9,32.16,50.53,31.32,52.22
	.goto 378,31.18,47.90,15,0
	.goto 378,32.57,46.43,15,0
	.goto 378,33.99,50.90,15,0
	.goto 378,32.16,50.53,15,0
	.goto 378,31.32,52.22,15,0
    >>击杀|r|cRXP_ENEMY_狒狒村智者|r并从他们身上搜刮出[|cRXP_LOOT_刷子|r]
    .complete 29777,1 --8/8 Paint Soaked Brush
	.mob Fe-Feng Wiseman
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_邵白长老|r和|cRXP_FRIENDLY_乔乔·铁眉|r和|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29777 >>交任务: |cRXP_FRIENDLY_作案工具|r
    .goto 378,31.78,39.71
    .turnin 29783 >>交任务: |cRXP_FRIENDLY_比石头更硬|r
    .goto 378,29.90,39.76
    .turnin 29778 >>交任务: |cRXP_FRIENDLY_重写智慧|r
    .accept 29779 >>接任务: |cRXP_WARN_以直报怨|r
    .accept 29780 >>接任务: |cRXP_WARN_不作恶|r
    .accept 29781 >>接任务: |cRXP_WARN_警告猴子|r
    .goto 378,30.97,36.74
	.target Elder Shaopai
	.target Jojo Ironbrow
	.target Ji Firepaw
step
	.isOnQuest 29779
    .goto 378,29.28,39.98,15,0
    .goto 378,27.42,36.25,30,0
    .goto 378,26.42,33.68,30 >>前往|cRXP_WARN_Jade Pillar|r
step
	#completewith next
	>>击杀|cRXP_ENEMY_狒狒村猢狲|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.42,33.68
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Jade Pillar|r
    .accept 29782 >>接任务: |cRXP_WARN_比骨头更硬|r
step
    #completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
    .goto 378,26.75,31.86,15,0
    .goto 378,27.49,29.61,15,0
    .goto 378,25.72,29.91,15,0
    .goto 378,24.24,30.84,15,0
    .goto 378,20.52,34.6,10,0
#loop
	.line 378,24.24,30.84,25.72,29.91,27.49,29.61,26.75,31.86
	.goto 378,24.24,30.84,10,0
	.goto 378,25.72,29.91,10,0
	.goto 378,27.49,29.61,10,0
	.goto 378,26.75,31.86,10,0
	>>击杀|cRXP_ENEMY_狒狒村猢狲|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
    .goto 378,26.08,35.17,15,0
    .goto 378,20.94,34.43
	>>击杀|cRXP_ENEMY_鲁克鲁克|r
    .complete 29780,1 --1/1 Ruk-Ruk slain
	.mob Ruk-Ruk
step
    #completewith next
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
    >>击杀|cRXP_ENEMY_狒狒村猢狲|r
    .complete 29779,1 --20/20 Fe-Feng Hozen slain
	.mob Fe-Feng Firethief
	.mob Fe-Feng Ruffian
step
#loop
	.line 378,24.24,30.84,25.72,29.91,27.49,29.61,26.75,31.86
	.goto 378,24.24,30.84,10,0
	.goto 378,25.72,29.91,10,0
	.goto 378,27.49,29.61,10,0
	.goto 378,26.75,31.86,10,0
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Firework Bundles|r
    .complete 29781,1 --8/8 Stolen Firework Bundle
step
	#completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与季·火掌交谈, 他应该就在你旁边. |cFFFF0000如果他不在那里, 请跳过此步骤|r
    .turnin 29779 >>交任务: |cRXP_FRIENDLY_以直报怨|r
    .turnin 29780 >>交任务: |cRXP_FRIENDLY_不作恶|r
    .turnin 29781 >>交任务: |cRXP_FRIENDLY_警告猴子|r
    .accept 29784 >>接任务: |cRXP_WARN_平衡之念|r
	.target Ji Firepaw
step
    .goto 378,29.90,39.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29782 >>交任务: |cRXP_FRIENDLY_比骨头更硬|r
	.target Jojo Ironbrow
step
    .goto 378,30.97,36.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 29779 >>交任务: |cRXP_FRIENDLY_以直报怨|r
    .turnin 29780 >>交任务: |cRXP_FRIENDLY_不作恶|r
    .turnin 29781 >>交任务: |cRXP_FRIENDLY_警告猴子|r
    .accept 29784 >>接任务: |cRXP_WARN_平衡之念|r
	.target Ji Firepaw
step
	#completewith next
    .goto 378,31.14,36.79,5,0
    .goto 378,32.17,36.36,8,0
    .goto 378,32.88,37.16,8,0
    .goto 378,32.94,35.61,8 >>|cRXP_WARN_Carefully|r走过绳索
step
	#label BalancedP
    .goto 378,32.94,35.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29784 >>交任务: |cRXP_FRIENDLY_平衡之念|r
    .accept 29785 >>接任务: |cRXP_WARN_上古风灵大风|r
	.target Aysa Cloudsinger
step
	#sticky
	#label Temple1
    .goto 378,30.21,38.57,20,0
    .goto 378,28.94,62.89,20 >>前往寺庙|r
	.isOnQuest 29785
step
	#sticky
	#label Temple2
	#requires Temple1
    .goto 378,26.64,66.63,10 >>在第一次风势减弱后, 于楼梯间奔跑
	.isOnQuest 29785
step
	#sticky
	#label Temple3
	#requires Temple2
    .goto 378,26.64,66.63,10 >>在下一间房间的风势平息后, 朝|cRXP_FRIENDLY_大风|r奔去
	.isOnQuest 29785
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大风|r和|cRXP_FRIENDLY_Aysa|r交谈
    .turnin 29785 >>交任务: |cRXP_FRIENDLY_上古风灵大风|r
    .goto 378,24.65,69.80
    .accept 29786 >>接任务: |cRXP_WARN_天空之战|r
    .goto 378,24.78,69.78
	.target Dafeng
	.target Aysa Cloudsinger
step
    .goto 378,29.54,60.74,5,0
    .goto 378,30.18,61.88,5,0
    .goto 378,30.93,61.59,5,0
    .goto 378,31.37,60.05,5,0
    .goto 378,29.78,58.93,5,0
    .goto 378,29.54,60.74,5,0
    .goto 378,30.18,61.88,5,0
    .goto 378,30.93,61.59,5,0
    .goto 378,31.37,60.05,5,0
    .goto 378,29.78,58.93,5,0
    .goto 378,30.52,59.72
	>>|TInterface/cursor/crosshair/interact.blp:20|t当|cRXP_ENEMY_炤壬|r在你上方时, 点击|cRXP_PICK_烟花发射器|r来造成伤害. 他会逆时针绕圈移动. |cRXP_WARN_避开他的闪电水坑|r. 在他落地时攻击他. 第二次落地时将其击杀
    .complete 29786,1 --1/1 Zhao-Ren slain
	.target Zhao-Ren
step
    .goto 378,29.99,60.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29786 >>交任务: |cRXP_FRIENDLY_天空之战|r
    .accept 29787 >>接任务: |cRXP_WARN_传承的价值|r
	.target Master Shang Xi
step
	#completewith next
    .goto 378,26.32,52.83,20,0
    .goto 378,22.70,52.80,40 >>前往长老之路|r
step
    .goto 378,22.70,52.80
	>>击杀长者的卫士|r
    .complete 29787,1 --1/1 Guardian of the Elders slain
	.timer 19,Worthy of Passing RP
	.target Guardian of the Elders
step
    .goto 378,19.45,51.22
	>>等待RP结束
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29787 >>交任务: |cRXP_FRIENDLY_传承的价值|r
    .accept 29788 >>接任务: |cRXP_WARN_不受欢迎的生灵|r
    .accept 29789 >>接任务: |cRXP_WARN_积跬步，致千里|r
	.target Master Shang Xi
step
    .goto 378,18.84,51.88,15,0
    .goto 378,18.43,49.88,15,0
    .goto 378,18.37,48.13,15,0
    .goto 378,21.57,49.29,15,0
    .goto 378,22.50,48.95,15,0
    .goto 378,24.22,45.72,30,0
    .goto 378,18.18,44.52,30,0
    .goto 378,24.22,45.72,30,0
    .goto 378,18.18,44.52
	>>击杀棘枝恶灵并拾取挂在树上的魔力护符
    .complete 29788,1 --8/8 Thornbranch Scamp slain
    .complete 29789,1 --8/8 Kun-Pai Ritual Charm
	.target Thornbranch Scamp
step
    .goto 378,19.46,51.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚喜师父|r交谈
    .turnin 29788 >>交任务: |cRXP_FRIENDLY_不受欢迎的生灵|r
    .turnin 29789 >>交任务: |cRXP_FRIENDLY_积跬步，致千里|r
    .accept 29790 >>接任务: |cRXP_WARN_智慧传承|r
	.timer 83,Passing Wisdom RP
	.target Master Shang Xi
step
	#completewith next
	.cast 108034 >>吃掉|T571818:0|t[小甘蔗杆]持续10秒, 以获得增益效果
    .use 77272
	.itemcount 77272,1
step
    .goto 378,17.29,50.78
    >>|cRXP_WARN_在箭头位置等待RP|r
    .complete 29790,1 --1/1 Listen to Master Shang Xi
step
    .goto 378,15.79,49.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29790 >>交任务: |cRXP_FRIENDLY_智慧传承|r
    .accept 29791 >>接任务: |cRXP_WARN_神真子的苦难|r
	.target Aysa Cloudsinger
step
    .goto 378,15.55,48.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_Air Balloon|r登上飞艇
    .complete 29791,1 --1/1 Board the Hot Air Balloon
	.timer 191,The Suffering of Shen-zin Su RP
step
    .goto 378,30.8,92.9
	>>|cRXP_WARN_等待RP结束|r
    .complete 29791,2 --1/1 Uncover the source of Shen-zin Su's pain
step
    .goto 378,51.31,48.28
    >>从气球上掉下时, 使用“脱离”技能朝东北方向的楼梯移动以节省时间 << Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shaopai|r交谈
    .turnin 29791 >>交任务: |cRXP_FRIENDLY_神真子的苦难|r
    .accept 29792 >>接任务: |cRXP_WARN_通往卓越|r
	.target Elder Shaopai
step
    .goto 378,51.60,61.39
    >>跑到大门开启它. 等待回合制事件结束
    .complete 29792,1 --1/1 Open the Mandori Village Gate
step
	#completewith next
    .goto 378,50.66,65.62,20,0
    .goto 378,52.28,68.43,30 >>前往佩武门|r
	.timer 28,Pei-Wu Gate RP
step
    .goto 378,52.28,68.43
    >>跑到大门开启它. 等待回合制事件结束
    .complete 29792,2 --1/1 Open the Pei-Wu Forest Gate
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wei|r和|cRXP_FRIENDLY_Korga|r交谈
    .turnin 29792 >>交任务: |cRXP_FRIENDLY_通往卓越|r
    .accept 30591 >>接任务: |cRXP_LOOT_猎杀狼群|r
    .goto 378,50.07,76.63
    .accept 29795 >>接任务: |cRXP_WARN_储备竹竿|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    .goto 378,50.62,78.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_供应商卓歌|r交谈
    .vendor 67186 >>出售你的垃圾并进行修理
	.target Provisioner Drog
	.isOnQuest 29795
step
#loop
	.line 378,54.51,85.54,45.05,85.81,45.89,71.57,55.62,69.49,54.51,85.54
	.goto 378,54.51,85.54,40,0
	.goto 378,45.05,85.81,40,0
	.goto 378,45.89,71.57,40,0
	.goto 378,55.62,69.49,40,0
	.goto 378,54.51,85.54,40,0
    >>击杀 |cRXP_ENEMY_悲雾猛虎|r. 拾取地面上的 |cRXP_PICK_竹枝|r
    .complete 30591,1 --9/9 Pei-Wu Tiger slain
    .complete 29795,1 --10/10 Broken Bamboo Stalk
	.mob Pei-Wu Tiger
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wei|r和|cRXP_FRIENDLY_Korga|r交谈
    .turnin 30591 >>交任务: |cRXP_FRIENDLY_猎杀狼群|r
    .goto 378,50.07,76.63
    .turnin 29795 >>交任务: |cRXP_FRIENDLY_储备竹竿|r
    .accept 30589 >>接任务: |cRXP_WARN_炸毁残骸|r
    .goto 378,50.22,76.65
	.target Wei Palerage
	.target Korga Strongmane
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Makael|r和|cRXP_FRIENDLY_Ji|r交谈
    .turnin 30589 >>交任务: |cRXP_FRIENDLY_炸毁残骸|r
    .accept 30590 >>接任务: |cRXP_LOOT_小心运送|r
    .goto 378,36.32,72.36
    .accept 29793 >>接任务: |cRXP_WARN_海中的邪恶|r
    .goto 378,36.37,72.53
	.target Makael Bay
	.target Ji Firepaw
step
    .goto 378,36.06,76.73,40,0
    .goto 378,35.41,79.00,40,0
    .goto 378,40.14,78.79,40,0
    .goto 378,38.29,74.01,40,0
    .goto 378,36.06,76.73,40,0
    .goto 378,35.41,79.00,40,0
    .goto 378,40.14,78.79,40,0
    .goto 378,38.29,74.01
    >>击杀|cRXP_ENEMY_黑暗骇魔|r和|cRXP_ENEMY_恐怖生物|r. |cRXP_WARN_小心黑暗骇魔的暗影喷泉|r
	>>拾取地面上的爆炸装置
    .complete 29793,1 --8/8 Darkened Horrors or Darkened Terrors slain
    .complete 30590,1 --6/6 Packed Explosion Charge
	.mob Darkened Horror
	.mob Darkened Terror
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈凯尔·贝|r和|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 30590 >>交任务: |cRXP_FRIENDLY_小心运送|r
    .goto 378,36.32,72.36
    .turnin 29793 >>交任务: |cRXP_FRIENDLY_海中的邪恶|r
    .accept 29796 >>接任务: |cRXP_WARN_紧急消息|r
    .goto 378,36.37,72.53
	.target Makael Bay
	.target Ji Firepaw
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德罗娜·莱因哈特|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29796 >>交任务: |cRXP_FRIENDLY_紧急消息|r
    .accept 29794 >>接任务: |cRXP_WARN_一个都不能少|r
    .accept 29797 >>接任务: |cRXP_WARN_医疗物资|r
    .goto 378,42.21,86.54
    .accept 29665 >>接任务: |cRXP_WARN_越来越糟|r
    .goto 378,42.30,86.35
	.target Delora Lionheart
	.target Jojo Ironbrow
step
	#completewith Sailor2
    >>击杀|cRXP_ENEMY_深鳞折磨者|r. 在地面上拾取|cRXP_PICK_医疗补给品|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
    #optional
	#completewith next
    .goto 378,40.18,87.69
	.cast 56685 >>拾起受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
--XXZ Zarant Function
step
    #optional
    .goto 378,42.27,86.80
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,1 --3/3 Injured Sailors rescued
step
    #optional
	#completewith next
    .goto 378,39.41,87.98
	.cast 56685 >>拾起受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
step
    #optional
	#label Sailor2
    .goto 378,42.27,86.80
    >>将受伤的船员带回到德尔拉的营地
    .complete 29794,1,2 --3/3 Injured Sailors rescued
step
    #optional
    .goto 378,38.36,87.60,20,0
    .goto 378,37.04,87.93,20,0
    .goto 378,35.77,86.77,20,0
    .goto 378,36.40,83.30,20,0
    .goto 378,37.92,81.39,20,0
    .goto 378,37.86,83.22,20,0
    .goto 378,36.41,85.51,10,0
    .goto 378,36.82,89.24,20,0
    .goto 378,38.36,87.60,20,0
    .goto 378,37.04,87.93,20,0
    .goto 378,35.77,86.77,20,0
    .goto 378,36.40,83.30,20,0
    .goto 378,37.92,81.39,20,0
    .goto 378,37.86,83.22,20,0
    .goto 378,36.41,85.51,10,0
    .goto 378,36.82,89.24
	>>|cRXP_WARN_别急着接新的水手任务|r
    >>击杀|cRXP_ENEMY_深鳞折磨者|r. 在地面上拾取|cRXP_PICK_医疗补给品|r
    .complete 29665,1 --8/8 Deepscale Tormentor slain
    .complete 29797,1 --8/8 Alliance Medical Supplies
	.mob Deepscale Tormentor
step
	#completewith next
    .goto 378,38.36,87.43,-1
    .goto 378,37.66,87.22,-1
    .goto 378,36.17,87.63,-1
    .goto 378,35.49,83.80,-1
    .goto 378,37.60,81.44,-1
    .goto 378,38.41,83.09,-1
    .goto 378,38.08,84.73,-1
    .goto 378,40.01,84.36,-1
	.cast 56685 >>拾起受伤的船员|r
	.isOnQuest 29794
	.target Injured Sailor
step
    .goto 378,42.27,86.80
    >>将受伤的船员送回德拉拉·狮心的营地
    .complete 29794,1 --3/3 Injured Sailors rescued
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德罗娜·莱因哈特|r和|cRXP_FRIENDLY_乔乔·铁眉|r交谈
    .turnin 29794 >>交任务: |cRXP_FRIENDLY_一个都不能少|r
    .turnin 29797 >>交任务: |cRXP_FRIENDLY_医疗物资|r
    .goto 378,42.21,86.54
    .turnin 29665 >>交任务: |cRXP_FRIENDLY_越来越糟|r
    .accept 29798 >>接任务: |cRXP_WARN_远古的邪恶|r
    .goto 378,42.30,86.35
	.target Delora Lionheart
	.target Jojo Ironbrow
step
    .goto 378,36.50,84.23
    >>击杀 |cRXP_ENEMY_Vordraka, 深海噩梦|r
    >>|cRXP_WARN_躲避他的深海重击|r. 击杀出现的|cRXP_ENEMY_深鳞压迫者|r
    .complete 29798,1 --1/1 Vordraka, the Deep Sea Nightmare slain
	.mob Vordraka, The Deep Sea Nightmare
    .mob Deepscale Aggressor
step
    .goto 378,36.50,84.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 29798 >>交任务: |cRXP_FRIENDLY_远古的邪恶|r
    .accept 30767 >>接任务: |cRXP_WARN_孤注一掷|r
    .timer 77,Risking It All RP
	.target Aysa Cloudsinger
	.skipgossip
step
    .goto 378,36.35,86.08,10,0 << skip
    .goto 378,36.27,86.99,10,0 << skip
    .goto 378,36.90,85.50,5,0 << skip
    .goto 378,36.36,87.2,10,0 << skip
    .goto 378,36.38,87.12 << skip
    >>等待 RP 时间(此期间你可以休息)
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 30767,1 --1/1 Shen-zin Su's Thorn Removed
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 30767 >>交任务: |cRXP_FRIENDLY_孤注一掷|r
    .accept 29799 >>接任务: |cRXP_WARN_治疗神真子|r
	.target Ji Firepaw
step
    .goto 378,39.08,88.32,5,0
    .goto 378,39.04,88.87,5,0
    .goto 378,39.89,88.62,5,0
    .goto 378,42.92,87.31,5,0
    .goto 378,42.85,85.16,5,0
    .goto 378,42.01,84.89,5,0
    .goto 378,42.31,83.89,5,0
    .goto 378,41.21,83.78,5,0
    .goto 378,40.55,82.45,5,0
    .goto 378,40.26,83.35,5,0
    .goto 378,40.12,84.37,5,0
    .goto 378,38.44,86.07
    >>从残骸中解救出联盟牧师和部落德鲁伊, 然后与他们交谈. 击杀暗鳞肉食者. 如果他们正在攻击这些人
    .complete 29799,1 --1/1 Protect the healers
	.target Alliance Priest
	.target Horde Druid
	.mob Dampscale Fleshripper
step
    .goto 378,39.30,86.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 29799 >>交任务: |cRXP_FRIENDLY_治疗神真子|r
	.timer 18,The Healing of Shen-zin Su RP
	.target Ji Firepaw
step
    >>|cRXP_WARN_等待RP结束|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .goto 378,38.77,86.32
    .accept 29800 >>接任务: |cRXP_WARN_新的盟友|r
	.target Ji Firepaw
step
    #completewith next
    .hs >>炉石|cRXP_WARN_前往五黎明神殿|r
step
    .goto 378,51.45,48.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尚熙之灵|r交谈并选择你的阵营
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 29800 >>交任务: |cRXP_FRIENDLY_新的盟友|r
    .accept 31450 >>接任务: |cRXP_WARN_新的命运|r
    .complete 31450,1 --1/1 Choose your faction
    .skipgossip
	.target Spirit of Shang Xi
step << Alliance
    .goto 84,74.19,91.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莎·云歌|r交谈
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
	.accept 30987 >>接任务: |cRXP_WARN_加入联盟|r
	.target Aysa Cloudsinger
step << Alliance
    .goto 84,63.77,73.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
    .target Renato Gallina
step << Alliance
    .goto 84,62.81,71.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
    .target Hero's Herald
step << Alliance
    #veteran
	>>通过复制并粘贴以下链接到聊天窗口中, 来遗忘你的专业技能
    .link /run AbandonSkill(186); AbandonSkill(182);>>|TInterface/cursor/crosshair/interact.blp:20|t点击这里
	.train 2366,1 >>遗忘草药学
	.train 2575,1 >>遗忘采矿
    .dmf
step
    #veteran
    .goto 84,61.11,70.6
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师|r交谈
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
step
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
step
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
    .dmf
step << Alliance
    #label DarkMoonFaire
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .goto 84,62.25,72.96
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
	.zone 407 >>前往暗月马戏团
	.target Darkmoon Faire Mystic Mage
	.skipgossip
    .dmf
step << Horde
    .dmf
	>>通过复制并粘贴以下链接到聊天窗口中, 来遗忘你的专业技能
    .link /run AbandonSkill(186); AbandonSkill(182);>>|TInterface/cursor/crosshair/interact.blp:20|t点击这里
	.train 2366,1 >>遗忘草药学
	.train 2575,1 >>遗忘采矿
step << Horde
    .goto 1,45.58,12.61
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_季·火掌|r交谈
    .turnin 31450 >>交任务: |cRXP_FRIENDLY_新的命运|r
    .accept 31012 >>接任务: |cRXP_WARN_加入部落|r
    .target Ji Firepaw
step << Horde
    #completewith next
    .goto 85,49.87,75.52,20 >>前往|cRXP_WARN_inside 格罗玛什要塞|r
step << Horde
    .goto 85,48.76,70.77
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r谈话
    .turnin 31012 >>交任务: |cRXP_FRIENDLY_加入部落|r
    .target Garrosh Hellscream
]])

--New DK Intro The Frozen Throne
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 新死亡骑士引导任务
#displayname |cFF00CCFF1|r - 冰封王座 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next << Alliance
#next << Horde

<< DK Pandaren/DarkIronDwarf DK/KulTiran DK/LightforgedDraenei DK/Mechagnome DK/VoidElf DK/HighmountainTauren DK/夜之子 DK/ZandalariTroll DK/MagharOrc DK/Vulpera DK

step
    .goto 1602,49.55,89.74 --clickradius
    .goto 1602,49.55,90.69 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .accept 58877 >>接任务: |cRXP_WARN_死亡之力的增长|r
    .target The Lich King
    .zoneskip 84
step
    .goto 1602,49.55,89.74 --clickradius
    >>使用[额外动作按钮]|cRXP_WARN_在|r|cRXP_FRIENDLY_巫妖王|r面前
    .complete 58877,1 --1/1 Fealty sworn
    .target The Lich King
    .isOnQuest 58877
step
    .goto 1602,49.55,89.74 --clickradius
    .goto 1602,49.6,90.7 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巫妖王|r交谈
    .turnin 58877,1 >>交任务: |cRXP_FRIENDLY_死亡之力的增长|r
    .accept 58902 >>接任务: |cRXP_WARN_艾泽拉斯的守护者|r << Alliance
    .accept 58903 >>接任务: |cRXP_WARN_艾泽拉斯的守护者|r << Horde
    .target The Lich King
    .isQuestComplete 58877
-- step
--     #completewith next
--     +按下默认的“N”键打开你的天赋界面. |cRXP_WARN_然后选择你想要的天赋专精|r
--     .zoneskip 84
--     .isQuestTurnedIn 58877 --x New Type of DK Check
step
    .goto 1602,49.84,68.43 --clickradius
    .goto 1602,50.7,71.0 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .skipgossip
    .complete 58902,1 << Alliance --1/1 Speak with Highlord Darion Mograine
    .complete 58903,1 << Horde --1/1 Speak with Highlord Darion Mograine
    .target Highlord Darion Morgraine
    .isQuestTurnedIn 58877 --x New Type of DK Check
step 
    .goto 1602,49.93,42.41  --clickradius
    .goto 1602,49.96,39.08 --npc location
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_死亡之门|r
    .complete 58902,2 << Alliance --1/1 Death Gate Used
    .complete 58903,2 << Horde --1/1 Death Gate Used
    .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     -- .goto 84,67.16,83.4,20,0
--     -- .goto 84,67.51,80.47,20,0
--     .goto 84,63.77,73.60
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
--     .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
--     .target Renato Gallina
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .goto 84,62.9,71.8
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_英雄的召唤布告牌|r并选择克罗米的召唤
--     .complete 58902,4 --1/1 Hero's Call Board
--     .accept 62567 >>接任务: |cRXP_WARN_招募冒险者：克罗米的召唤|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .goto 84,62.9,71.8
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_英雄的召唤布告牌|r并选择破碎海岸
--     .accept 40519 >>接任务: |cRXP_WARN_军团再临：军团回归|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     >>|TInterface/cursor/crosshair/interact.blp:20|t|cRXP_WARN_从任务日志的弹出窗口中选择交还任务的选项|r.
--     .turnin 58902 >>交任务: |cRXP_FRIENDLY_艾泽拉斯的守护者|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .goto 84,62.81,71.74
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .target Hero's Herald
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .cast 50977 >>使用死亡之门
--     .usespell 50977
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .zone 23 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_死亡之门|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     .goto 23,82.09,46.46 --clickradius
--     .goto 23,82.02,46.31 --npc location
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
--     .accept 58989 >>接任务: |cRXP_WARN_符文熔铸入门|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
--     .target Highlord Darion Mograine
-- step
--     .goto 23,83.19,48.90
--     >>踏上|cRXP_WARN_紫色圆圈|r以传送
--     .isQuestTurnedIn 58877 --x New Type of DK Check
--     .complete 58989,1 --1/1 Use the portal to the 2nd floor
-- step
--     .goto 23,83.14,45.4
--     >>前往符文熔炉, 用任意死亡骑士附魔强化你的武器
--     *
--     .complete 58989,2 --Weapon emblazoned (1)
--     .isQuestTurnedIn 58877 --x New Type of DK Check
--     .usespell 53428
-- step
--     .isOnQuest 58989
--     .goto 23,83.25,49.02,5 >>|cRXP_WARN_踩上|cRXP_WARN_紫色圆圈|r以再次传送|r
-- step
--     .goto 23,82.02,46.28
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
--     .turnin 58989 >>交任务: |cRXP_FRIENDLY_符文熔铸入门|r
--     .isQuestTurnedIn 58877 --x New Type of DK Check
--     .target Highlord Darion Mograine
-- step
--     #completewith next
--     +使用死亡之门|cRXP_WARN_前往暴风城|r
--     >>|cRXP_WARN_你可能需要稍等片刻, 它的冷却时间还没结束|r.
--     .zoneskip 84
--     .isQuestTurnedIn 58877 --x New Type of DK Check
--     .use 50977
-- step
--     #veteran
--     .goto 84,61.11,70.6
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
--     >>|cRXP_WARN_ 建议使用另一个拥有至少10,000金币的角色登录. 用该角色购买物品后, 再将它们发送过来|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师费奇|r交谈
--     .collect 71715,1
--     .collect 71638,1
--     .collect 71637,1
--     .collect 71636,1
--     .collect 71635,1
--     .collect 71952,1
--     .collect 71951,1
--     .collect 71953,1
--     .collect 71716,1
--     .target Auctioneer Fitch
--     .target Auctioneer Jaxon
--     .target Auctioneer Chilton
--     .dmf
--     .isQuestTurnedIn 58877 --x New Type of DK Check
-- step
--     #fresh
--     #completewith DarkMoonFaire
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
--     .isQuestTurnedIn 58902 --x New Type of DK Check
-- step
--     #completewith next
--     .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
--     .dmf
--     .isQuestTurnedIn 58902 --x New Type of DK Check
-- step
--     #label DarkMoonFaire
--     .goto 84,62.25,72.96
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
--     .target Darkmoon Faire Mystic Mage
--     .dmf
--     .isQuestTurnedIn 58902 --x New Type of DK Check
-- step
--     .goto 84,62.25,72.96
--     +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .skipgossip
--     .zoneskip 37
--     .dmf
--     .isQuestTurnedIn 58902  --x new type of dk check
--     .target Darkmoon Faire Mystic Mage
-- step
--     .goto 84,64.63,70.45,25,0
--     .goto 84,68.29,74.57,25,0
--     .goto 84,70.92,72.45
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
--     .fly Goldshire >>飞往闪金镇
--     .target Dungar Longdrink
--     .isQuestTurnedIn 58877 --x New DK Check
--     .nodmf
]])

-- =================================
-- =======  ALLIANCE  ZONES ========
-- =================================

--Draenei Ammen Vale
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ab) 埃门谷
#displayname 埃门谷 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Draenei !DK
#next ac) 德莱尼 秘蓝岛

<< Alliance 

step
    .xp >10,1
    .goto 468,61.21,29.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格伦|r交谈
    .accept 9279 >>接任务: |cRXP_LOOT_你活下来了！|r
	.target Megelon
step
    .xp >10,1
    .goto 468,52.86,35.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .turnin 9279 >>交任务: |cRXP_FRIENDLY_你活下来了！|r
    .accept 9280 >>接任务: |cRXP_LOOT_补充治疗水晶|r
	.target Proenitus
step
    .xp >10,1
    #loop
    .goto 468,52.84,28.69,30,0
    .goto 468,51.77,26.5,30,0
    .goto 468,49.48,29.56,30,0
    .goto 468,50.64,34.24,30,0
    .goto 468,46.43,33.61,30,0
    .goto 468,45.1,28.57,30,0
    .goto 468,49.21,25.21,30,0
    .goto 468,53.47,25.15,30,0
    .goto 468,54.91,28.56,30,0
    .goto 468,54.47,31.88,30,0
    >>击杀|cRXP_ENEMY_峡谷蛾|r. 击败它们后可掉落 |T134844:0|t[|cRXP_LOOT_一瓶蛾血|r]
    .complete 9280,1 --6/6 Vial of Moth Blood
	.mob Vale Moth
step
    .xp >10,1
    .goto 468,52.52,35.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .turnin 9280 >>交任务: |cRXP_FRIENDLY_补充治疗水晶|r
    .accept 9409 >>接任务: |cRXP_LOOT_紧急物资！|r
	.target Proenitus
step
    .xp >10,1
    #completewith next
    #label Urgent Delivery!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔杜|r 交谈
    .turnin 9409 >>交任务: |cRXP_FRIENDLY_紧急物资！|r
    .accept 9283 >>接任务: |cRXP_LOOT_拯救幸存者！|r
	.target Zalduun
step
    .xp >10,1
    #completewith Urgent Delivery!
    .goto 468,52.45,38.24,10 >>进入房屋
step
    .xp >10,1
    #requires Urgent Delivery!
    #loop
    .goto 468,52.1,41.05,15,0
    .goto 468,51.78,43.55,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔杜|r 交谈
    .turnin 9409 >>交任务: |cRXP_FRIENDLY_紧急物资！|r
    .accept 9283 >>接任务: |cRXP_LOOT_拯救幸存者！|r
	.target Zalduun
step
    .xp >10,1
    #completewith next
    #label Botanist Taerix
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .accept 9371 >>接任务: |cRXP_WARN_植物学家塔蕾克丝|r
	.target Proenitus
step
    .xp >10,1
    #completewith Botanist Taerix
    .goto 468,52.75,36.22,30 >>离开房屋
step
    .xp >10,1
    #requires Botanist Taerix
    .goto 468,52.75,36.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普罗尼图斯|r交谈
    .accept 9371 >>接任务: |cRXP_WARN_植物学家塔蕾克丝|r
	.target Proenitus
step
    .xp >10,1
    .goto 468,50.11,37.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9371 >>交任务: |cRXP_FRIENDLY_植物学家塔蕾克丝|r
    .accept 10302 >>接任务: |cRXP_LOOT_暴躁的变异体|r
	.target Botanist Taerix
step
    .xp >10,1
    #hidewindow
    #completewith Volatile Mutation
    #loop
    .goto 468,47.03,31.53,40,0
    .goto 468,44.28,26.66,40,0
    .goto 468,50.22,25.47,40,0
    .goto 468,53,28.76,40,0
    .goto 468,51.35,20.89,40,0
    .goto 468,56.71,23.14,40,0
    .goto 468,55.99,29.92,40,0
    .goto 468,41.42,38.77,40,0
    .goto 468,40.37,45.4,40,0
    .goto 468,35.46,50.34,40,0
    .goto 468,33.25,42.24,30,0
    +1
step
    .xp >10,1
    #completewith next
    >>击杀|cRXP_ENEMY_暴躁的变异体|r
    .complete 10302,1 --8/8 Volatile Mutation slain
	.mob Volatile Mutation
step
    .xp >10,1
    >>对远处的|cRXP_FRIENDLY_德莱尼幸存者|r|cRXP_WARN_理想情况下|r使用 |T135923:0|t[纳鲁之赐]
    .complete 9283,1 --1/1 Draenei Survivors Saved
    .use 370626
    .target Draenei Survivor
step
    .xp >10,1
    #label Volatile Mutation
    >>击杀|cRXP_ENEMY_暴躁的变异体|r
    .complete 10302,1 --8/8 Volatile Mutation slain
	.mob Volatile Mutation
step
    .xp >10,1
    #completewith next
    #label Botanical Legwork
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r和|cRXP_FRIENDLY_学徒维莎尔|r交谈
    .turnin 10302 >>交任务: |cRXP_FRIENDLY_暴躁的变异体|r
    .accept 9293 >>接任务: |cRXP_LOOT_必需的措施......|r
    .disablecheckbox
	.target +Botanist Taerix
    .accept 9799 >>接任务: |cRXP_LOOT_跑腿采花|r
    .disablecheckbox
    .target +Apprentice Vishael
step
    .xp >10,1
    #completewith Botanical Legwork
    .goto 468,49.66,37.15,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    .xp >10,1
    #requires Botanical Legwork
    .goto 468,49.66,37.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r和|cRXP_FRIENDLY_学徒维莎尔|r交谈
    .turnin 10302 >>交任务: |cRXP_FRIENDLY_暴躁的变异体|r
    .accept 9293 >>接任务: |cRXP_LOOT_必需的措施......|r
	.target +Botanist Taerix
    .accept 9799 >>接任务: |cRXP_LOOT_跑腿采花|r
    .target +Apprentice Vishael
step
    .xp >10,1
    #completewith next
    #hidewindow
    #label Corrupted Flower1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被污染的花朵|r
    .complete 9799,1 --3/3 Corrupted Flower
step
    .xp >10,1
    #completewith Corrupted Flower1
    .goto 468,40.88,43.2,40 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Volatile Mutation
    .mob Vale Moth
step
    .xp >10,1
    #requires Corrupted Flower1
    #hidewindow
    #completewith Corrupted Flower2
    #loop
    .goto 468,40.88,43.2,30,0
    .goto 468,37.38,43.28,30,0
    .goto 468,37.4,49.58,35,0
    .goto 468,37.89,52.1,30,0
    .goto 468,39.96,45.86,30,0
    .goto 468,35.81,39.68,30,0
    .goto 468,33.71,45.45,30,0
    .goto 468,34.73,49.62,30,0
    +1
step
    .xp >10,1
    #requires Corrupted Flower1
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被污染的花朵|r
    .complete 9799,1 --3/3 Corrupted Flower
step
    .xp >10,1
    #requires Corrupted Flower1
    >>击杀|cRXP_ENEMY_变异的根须鞭笞者|r. 击败它们后可获得 |T134192:0|t[|cRXP_LOOT_鞭笞者样本|r]
    *|cRXP_WARN_Ignore the bugged one in the ground|r.
    .complete 9293,1 --10/10 Lasher Sample
	.mob Root Lasher
step
    .xp >10,1
    #label Corrupted Flower2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被污染的花朵|r
    .complete 9799,1 --3/3 Corrupted Flower
step
    .xp >10,1
    #completewith next
    #label Botanical Legwork
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒维莎尔|r和|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9799 >>交任务: |cRXP_FRIENDLY_跑腿采花|r
	.target +Apprentice Vishael
    .turnin 9293 >>交任务: |cRXP_FRIENDLY_必需的措施......|r
    .accept 9294 >>接任务: |cRXP_LOOT_净化湖水|r
    .disablecheckbox
    .target +Botanist Taerix
step
    .xp >10,1
    #completewith Botanical Legwork
    .goto 468,44.92,39.8,40,0
    .goto 468,49.78,37.47,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Volatile Mutation
    .mob Vale Moth
step
    .xp >10,1
    #requires Botanical Legwork
    .goto 468,49.78,37.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒维莎尔|r和|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9799 >>交任务: |cRXP_FRIENDLY_跑腿采花|r
	.target +Apprentice Vishael
    .turnin 9293 >>交任务: |cRXP_FRIENDLY_必需的措施......|r
    .accept 9294 >>接任务: |cRXP_LOOT_净化湖水|r
    .target +Botanist Taerix
step
    .xp >10,1
    #completewith next
    #label Rescue the Survivors!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔杜|r 交谈
    .turnin 9283 >>交任务: |cRXP_FRIENDLY_拯救幸存者！|r
	.target Zalduun
step
    .xp >10,1
    #completewith Rescue the Survivors!
    .goto 468,51.98,36.89,10,0
    .goto 468,52.64,37.31,5 >>进入房屋
step
    .xp >10,1
    #requires Rescue the Survivors!
    #loop
    .goto 468,52.1,41.05,15,0
    .goto 468,51.78,43.55,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔杜|r 交谈
    .turnin 9283 >>交任务: |cRXP_FRIENDLY_拯救幸存者！|r
	.target Zalduun
step
    .xp >10,1
    #completewith next
    #label Spare Parts
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师沙娜安和守备官奥达尔|r交谈
    .accept 37445 >>接任务: |cRXP_LOOT_备用零件|r
    .accept 37444 >>接任务: |cRXP_LOOT_疫苗|r
	.target Technician Zhanaa
    .target Vindicator Aldar
step
    .xp >10,1
    #completewith Spare Parts
    .goto 468,50.55,47.41,20 >>离开房屋
step
    .xp >10,1
    #requires Spare Parts
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师沙娜安和守备官奥达尔|r交谈
    .accept 37445 >>接任务: |cRXP_LOOT_备用零件|r
    .goto 468,50.52,47.93
    .accept 37444 >>接任务: |cRXP_LOOT_疫苗|r
    .goto 468,50.65,48.76
	.target Technician Zhanaa
    .target Vindicator Aldar
step <<!Hunter
    .xp >10,1
    #completewith next
    #label Emitter Spare Part
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_备用零件|r
    .complete 37445,1 --4/4 Emitter Spare Part
step <<Hunter
    .xp >10,1
    #completewith next
    #hidewindow
    #label Emitter Spare Part
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_备用零件|r
    .complete 37445,1 --4/4 Emitter Spare Part
step <<!Hunter
    .xp >10,1
    #completewith Emitter Spare Part
    #title |cFFFCDC00跟随箭头指引|r
    .goto 468,53.63,53.97,10,0
    .goto 468,54.58,54.58,5,0
    .goto 468,54.98,55.51,10,0
    .goto 468,55.27,57.62,20 >>跳到瀑布边的白色石头上, 然后跳下地面
step <<Hunter
    .xp >10,1
    #completewith Emitter Spare Part
    #title |cFFFCDC00跟随箭头指引|r
    .goto 468,53.68,51.21,10,0
    .goto 468,55.81,53.12,10 >>使用 |T132294:0|t[闪避] 跳跃跨过水面 
step <<Hunter
    #requires Emitter Spare Part
    .xp >10,1
    #completewith next
    #label Emitter Spare Part2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_备用零件|r
    .complete 37445,1 --4/4 Emitter Spare Part
step <<Hunter
    #requires Emitter Spare Part
    #completewith Emitter Spare Part2
    .goto 468,56.53,53.88
    .cast 1515 >>施放 |T132164:0|t[驯服野兽]于|cRXP_ENEMY_峡谷蛾|r上, 以驯服它
    .usespell 1515
    .mob Vale Moth
step <<Hunter
    .xp >10,1
    #requires Emitter Spare Part2
    #hidewindow
    #completewith inoculated
    #loop
    .goto 468,56.71,67.79,20,0
    .goto 468,53.93,68.77,35,0
    .goto 468,56.37,67.94,10,0
    .goto 468,57.04,68.3,10,0
    .goto 468,57.71,69.2,10,0
    .goto 468,57.46,71.46,30,0
    .goto 468,63.59,66.9,10,0
    .goto 468,62.85,65.5,10,0
    .goto 468,63.15,63.38,10,0
    .goto 468,63.93,61.75,27,0
    .goto 468,63.12,69.18,40,0
    .goto 468,67.92,72.17,20,0
    .goto 468,69.4,71.14,20,0
    .goto 468,71.82,70.82,30,0
    .goto 468,70.09,74.99,20,0
    .goto 468,66.84,78.92,20,0
    .goto 468,65.54,80.89,20,0
    .goto 468,65.02,82.77,20,0
    .goto 468,65.82,87.04,20,0
    .goto 468,63.78,88.55,20,0
    .goto 468,62.88,86.78,20,0
    .goto 468,61.73,84.6,20,0
    .goto 468,62.72,78.7,20,0
    .goto 468,60.89,77.7,20,0
    .goto 468,59.6,75.04,20,0
    .goto 468,58.32,70.44,20,0
    +1
step <<!Hunter
    .xp >10,1
    #requires Emitter Spare Part
    #hidewindow
    #completewith inoculated
    #loop
    .goto 468,56.71,67.79,20,0
    .goto 468,53.93,68.77,40,0
    .goto 468,56.37,67.94,10,0
    .goto 468,57.04,68.3,10,0
    .goto 468,57.71,69.2,10,0
    .goto 468,57.46,71.46,20,0
    .goto 468,63.59,66.9,10,0
    .goto 468,62.85,65.5,10,0
    .goto 468,63.15,63.38,10,0
    .goto 468,63.93,61.75,20,0
    .goto 468,63.12,69.18,40,0
    .goto 468,67.92,72.17,20,0
    .goto 468,69.4,71.14,20,0
    .goto 468,71.82,70.82,20,0
    .goto 468,70.09,74.99,20,0
    .goto 468,66.84,78.92,20,0
    .goto 468,65.54,80.89,20,0
    .goto 468,65.02,82.77,20,0
    .goto 468,65.82,87.04,20,0
    .goto 468,63.78,88.55,20,0
    .goto 468,62.88,86.78,20,0
    .goto 468,61.73,84.6,20,0
    .goto 468,62.72,78.7,20,0
    .goto 468,60.89,77.7,20,0
    .goto 468,59.6,75.04,20,0
    .goto 468,58.32,70.44,20,0
    +1
step <<Hunter
    .xp >10,1
    #requires Emitter Spare Part2
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t当你靠近时, 点击|cRXP_PICK_木巢枭兽|r
    .complete 37444,1 --6/6 Nestlewood Owlkin inoculated
	.mob Nestlewood Owlkin
    .use 22962
step <<Hunter
    .xp >10,1
    #requires Emitter Spare Part2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_备用零件|r
    .complete 37445,1 --4/4 Emitter Spare Part
step <<!Hunter
    .xp >10,1
    #requires Emitter Spare Part
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t当你靠近时, 点击|cRXP_PICK_木巢枭兽|r
    .complete 37444,1 --6/6 Nestlewood Owlkin inoculated
	.mob Nestlewood Owlkin
    .use 22962
step <<!Hunter
    .xp >10,1
    #requires Emitter Spare Part
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_备用零件|r
    .complete 37445,1 --4/4 Emitter Spare Part
step
    .xp >10,1
    #label inoculated
    >>使用 |T132775:0|t[疫苗水晶] 在你靠近 |cRXP_ENEMY_木巢枭兽|r时对其施放
    .complete 37444,1 --6/6 Nestlewood Owlkin inoculated
	.mob Nestlewood Owlkin
    .use 22962
step <<Hunter
    .xp >10,1
    #completewith next
    #hidewindow
    #label 交任务: |cRXP_FRIENDLY_备用零件|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r和|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
    .disablecheckbox
	.target +Vindicator Aldar
step <<!Hunter
    .xp >10,1
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_备用零件|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r和|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
    .disablecheckbox
	.target +Vindicator Aldar
-- step
--     #completewith 交任务: |cRXP_FRIENDLY_备用零件|r
--     .hs >>使用 |T134414:0|t[炉石]
step
    .xp >10,1
    #completewith 交任务: |cRXP_FRIENDLY_备用零件|r
    .goto 468,62.21,63.45,5,0
    .goto 468,61.22,62.27,10,0
    .goto 468,60.61,64.49,10,0
    .goto 468,59.71,64.41,10,0
    .goto 468,57.37,64.96
    >>你可以被周围的敌人击败, 也可以跟着箭头跳下山丘——如果你离得近, 后者更快
    *|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .deathskip >>在灵魂医者处死亡并重生
    .emote SIT,16537
    .emote SIT,16518
    .mob Nestlewood Owlkin
    .mob Mutated Owlkin
step <<Hunter
    .xp >10,1
    #requires 交任务: |cRXP_FRIENDLY_备用零件|r
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_备用零件|r2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r和|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
	.target +Technician Zhanaa
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
    .disablecheckbox
	.target +Vindicator Aldar
step <<Hunter
    #requires 交任务: |cRXP_FRIENDLY_备用零件|r
    .xp >10,1
    #completewith 交任务: |cRXP_FRIENDLY_备用零件|r2
    .goto 468,50.5,47.9
    .cast 883 >>使用 |T236193:0|t[召唤飞蛾]
step <<Hunter
    .xp >10,1
    #requires 交任务: |cRXP_FRIENDLY_备用零件|r2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r和|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
    .goto 468,50.27,47.69
	.target +Technician Zhanaa
    -- .turnin 10304 >>交任务: |cRXP_FRIENDLY_守备官奥达尔|r
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
    .goto 468,50.44,48.62
	.target +Vindicator Aldar
step <<!Hunter
    .xp >10,1
    #requires 交任务: |cRXP_FRIENDLY_备用零件|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r和|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 37445 >>交任务: |cRXP_FRIENDLY_备用零件|r
    .goto 468,50.27,47.69
	.target +Technician Zhanaa
    -- .turnin 10304 >>交任务: |cRXP_FRIENDLY_守备官奥达尔|r
    .turnin 37444 >>交任务: |cRXP_FRIENDLY_疫苗|r
    .accept 9309 >>接任务: |cRXP_LOOT_失踪的斥候|r
    .goto 468,50.44,48.62
	.target +Vindicator Aldar
step
    .xp >10,1
    #completewith next
    +|cFFFF0000[提示]|r要为|RXP_WARN_quest物品和目标和怪物框架设置快捷键, 或删除最便宜的垃圾物品, 请按Esc打开选项菜单, 进入“快捷键”并找到“RestedXP指南”
    .use 5997
    .use 2454
    .use 118
step
    .xp >10,1
    #completewith next
    #label Neutralizing Agent
    >>使用 |T132858:0|t[中和媒介] |cRXP_WARN_靠近大水晶旁的水|r
    .complete 9294,1 --1/1 Disperse the Neutralizing Agent
    .use 22955
step
    .xp >10,1
    #completewith Neutralizing Agent
    .goto 468,47.39,59.38,15,0
    .goto 468,46.91,64.16,7 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Volatile Mutation
    .mob Vale Moth
step
    .xp >10,1
    #requires Neutralizing Agent
    .goto 468,46.91,64.16
    >>使用 |T132858:0|t[中和媒介] |cRXP_WARN_靠近大水晶旁的水|r
    .complete 9294,1 --1/1 Disperse the Neutralizing Agent
    .use 22955
step
    .xp >10,1
    #completewith next
    #label The Missing Scout
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图兰|r 交谈
    .turnin 9309 >>交任务: |cRXP_FRIENDLY_失踪的斥候|r
    .accept 10303 >>接任务: |cRXP_LOOT_血精灵|r
	.target Tolaan
step
    .xp >10,1
    #completewith The Missing Scout
    .goto 468,46.74,67.31,10,0
    .goto 468,33.91,69.36,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    .xp >10,1
    #requires The Missing Scout
    .goto 468,33.91,69.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图兰|r 交谈
    .turnin 9309 >>交任务: |cRXP_FRIENDLY_失踪的斥候|r
    .accept 10303 >>接任务: |cRXP_LOOT_血精灵|r
	.target Tolaan
step
    .xp >10,1
    #loop
    .goto 468,33.32,74.12,20,0
    .goto 468,29.83,75.39,20,0
    .goto 468,28.38,73.07,20,0
    .goto 468,28.31,71,20,0
    .goto 468,31.23,69.98,20,0
    .goto 468,26.47,76.69,20,0
    .goto 468,30.17,78.5,20,0
    >>击杀血精灵斥候
    .complete 10303,1 --10/10 Blood Elf Scout slain
	.mob Blood Elf Scout
step
    .xp >10,1
    .goto 468,33.67,69.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图兰|r 交谈
    .turnin 10303 >>交任务: |cRXP_FRIENDLY_血精灵|r
    .accept 9311 >>接任务: |cRXP_LOOT_血精灵间谍|r
	.target Tolaan
step
    .xp >10,1
    #completewith next
    #label Surveyor Candress
    >>击杀|cRXP_ENEMY_测量员卡蒂瑞丝|r. 搜刮她掉落的 |T132319:0|t[|cRXP_LOOT_血精灵计划书|r]
    .complete 9311,1 --1/1 Surveyor Candress slain
    .accept 9798 >>接任务: |cRXP_LOOT_血精灵计划书|r
    .disablecheckbox
	.target Surveyor Candress
    .use 24414
step
    .xp >10,1
    #completewith Surveyor Candress
    .goto 468,30.71,77.11,10 >>往高处走
step
    .xp >10,1
    #requires Surveyor Candress
    .goto 468,27.8,80.41
    >>击杀|cRXP_ENEMY_测量员卡蒂瑞丝|r. 搜刮她掉落的 |T132319:0|t[|cRXP_LOOT_血精灵计划书|r]
    .complete 9311,1 --1/1 Surveyor Candress slain
    .accept 9798 >>接任务: |cRXP_LOOT_血精灵计划书|r
	.target Surveyor Candress
    .use 24414
step <<!Hunter
    .xp >10,1
    #completewith next
    #label Healing the Lake
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
	.target Botanist Taerix
step <<Hunter
    .xp >10,1
    #hidewindow
    #completewith next
    #label Healing the Lake
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
	.target Botanist Taerix
step 
    .xp >10,1
    #completewith Healing the Lake
    .goto 468,26.97,76.13,40,0
    .goto 468,28.56,72.18,40,0
    .goto 468,32.29,74.47,40,0
    >>|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .deathskip >>在灵魂医者处死亡并重生
    .emote SIT,16521
    .mob Blood Elf Scout
step <<!Hunter
    .xp >10,1
    #requires Healing the Lake
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
    .goto 468,49.86,37.36
	.target Botanist Taerix
step <<Hunter
    .xp >10,1
    #requires Healing the Lake
    #completewith next
    #label Healing the Lake2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
	.target Botanist Taerix
step <<Hunter
    .xp >10,1
    #requires Healing the Lake
    #completewith Healing the Lake2
    .goto 468,49.86,37.36
    .cast 883 >>使用 |T236193:0|t[召唤飞蛾]
step <<Hunter
    .xp >10,1
    #requires Healing the Lake2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_植物学家塔蕾克丝|r交谈
    .turnin 9294 >>交任务: |cRXP_FRIENDLY_净化湖水|r
    .goto 468,49.86,37.36
	.target Botanist Taerix
step
    .xp >10,1
    #completewith next
    #label Blood Elf Spy
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r交谈
    .turnin 9311 >>交任务: |cRXP_FRIENDLY_血精灵间谍|r
    .turnin 9798 >>交任务: |cRXP_FRIENDLY_血精灵计划书|r
    .accept 9312 >>接任务: |cRXP_LOOT_图像发射器|r
    .disablecheckbox
	.target Vindicator Aldar
step
    .xp >10,1
    #completewith Blood Elf Spy
    #hidewindow
    .goto 468,49.29,41.05,25,0
    .goto 468,49.77,46,25,0
    .goto 468,50.66,48.75,40 >>1
step
    .xp >10,1
    #requires Blood Elf Spy
    .goto 468,50.53,48.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官奥达尔|r交谈
    .turnin 9311 >>交任务: |cRXP_FRIENDLY_血精灵间谍|r
    .turnin 9798 >>交任务: |cRXP_FRIENDLY_血精灵计划书|r
    .accept 9312 >>接任务: |cRXP_LOOT_图像发射器|r
	.target Vindicator Aldar
step
    .xp >10,1
    .goto 468,50.5,48.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师沙娜安|r交谈
    .turnin 9312 >>交任务: |cRXP_FRIENDLY_图像发射器|r
    .accept 9313 >>接任务: |cRXP_LOOT_前往碧蓝岗哨|r
	.target Technician Zhanaa
]])

--Draenei Azuremyst Isle
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ac) 德莱尼 秘蓝岛
#displayname |cFF00CCFF2|r - 秘蓝岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Draenei !DK
#next a) 艾尔文森林

<< Alliance

step
    .xp >10,1
    .goto 468,50.5,48.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师沙娜安|r交谈
    .accept 9313 >>接任务: |cRXP_LOOT_前往碧蓝岗哨|r
	.target Technician Zhanaa
step
    .xp >10,1
    #completewith next
    #label Word from Azure Watch
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃文|r交谈
    .accept 9314 >>接任务: |cRXP_LOOT_碧蓝岗哨的消息|r
	.target Aeun
step
    .xp >10,1
    #completewith Word from Azure Watch
    .goto 468,31.66,51.82,30,0
    .goto 468,25.6,53.55,15,0
    .goto 97,64.5,54.04,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Volatile Mutation
    .mob Vale Moth
step
    .xp >10,1
    #requires Word from Azure Watch
    .goto 97,64.5,54.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃文|r交谈
    .accept 9314 >>接任务: |cRXP_LOOT_碧蓝岗哨的消息|r
	.target Aeun
step
    .xp >10,1
    #xprate 1-1.10
    .goto 97,61.11,54.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪泰娜|r交谈
    .accept 9452 >>接任务: |cRXP_LOOT_美味的红钳鱼|r
    .target Diktynna
step
    .xp >10,1
    .goto 97,49.78,51.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 9454 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    .xp >10,1
    .goto 97,49.3,52.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勒内|r谈话
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Lehna
step
    .xp >10,1
    .goto 97,48.68,52.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦伦|r交谈
    .train 2366 >>训练 |T4620675:0|t[草药学]
	.skipgossip 47431,1,1,1
	.target Valn
step
    .xp >10,1
    .goto 97,48.68,52.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦伦|r交谈
    .train 2575 >>训练 |T4620679:0|t[采矿]
	.skipgossip 47431,2,3,2
	.target Valn
step
    .xp >10,1
    #completewith next
    #label Medicinal Purpose
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者法蒂玛|r交谈
    .accept 9463 >>接任务: |cRXP_LOOT_医疗材料|r
	.target Anchorite Fateema
step
    .xp >10,1
    #completewith next
    .goto 97,48.36,52.23,10,0
    .goto 97,48.04,52.15
    .vendor >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥图纳布斯|r 交谈以购买背包
    .buy 4496,4
	.target Otonambusi
step
    .xp >10,1
    #requires Medicinal Purpose
    .goto 97,48.39,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者法蒂玛|r交谈
    .accept 9463 >>接任务: |cRXP_LOOT_医疗材料|r
	.target Anchorite Fateema
step
    .xp >10,1
    .goto 97,48.72,50.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师戴维恩|r交谈
    .turnin 9313 >>交任务: |cRXP_FRIENDLY_前往碧蓝岗哨|r
	.target Technician Dyvuun
step
    .xp >10,1
    #completewith next
    #hidewindow
    #label Word from Azure Watch2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9314,2 >>交任务: |cRXP_FRIENDLY_碧蓝岗哨的消息|r
    .accept 9603 >>接任务: |cRXP_LOOT_床铺，绷带，以及更多|r
    .disablecheckbox
	.target Caregiver Chellan
step
    .xp >10,1
    #completewith Word from Azure Watch2
    .goto 97,48.81,49.97,5,0
    .goto 97,48.65,49.69,5 >>进入房屋
step
    .xp >10,1
    #requires Word from Azure Watch2
    #completewith next
    #label Beds, Bandages, and Beyond
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9314,2 >>交任务: |cRXP_FRIENDLY_碧蓝岗哨的消息|r
    .accept 9603 >>接任务: |cRXP_LOOT_床铺，绷带，以及更多|r
	.target Caregiver Chellan
step
    .xp >10,1
    #requires Word from Azure Watch2
    #completewith Beds, Bandages, and Beyond
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .home >>将你的|cRXP_WARN_炉石 | 设置为碧蓝岗哨
	.target Caregiver Chellan
step
    .xp >10,1
    #requires Beds, Bandages, and Beyond
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9314,2 >>交任务: |cRXP_FRIENDLY_碧蓝岗哨的消息|r
	.target Caregiver Chellan
step
    .xp >10,1
    #requires Beds, Bandages, and Beyond
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .accept 9603 >>接任务: |cRXP_LOOT_床铺，绷带，以及更多|r
	.target Caregiver Chellan
step
    .xp >10,1
    #completewith next
    #label Wings of a Hippogryph
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .turnin 9603 >>交任务: |cRXP_FRIENDLY_床铺，绷带，以及更多|r
    .accept 9604 >>接任务: |cRXP_LOOT_乘坐角鹰兽|r
    .disablecheckbox
	.target Zaldaan
step
    .xp >10,1
    #completewith Wings of a Hippogryph
    .goto 97,48.83,50,5 >>离开房屋
step
    .isQuestComplete 9603
    #requires Wings of a Hippogryph
    .goto 97,49.62,49.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .turnin 9603 >>交任务: |cRXP_FRIENDLY_床铺，绷带，以及更多|r
	.target Zaldaan
step
    .xp >10,1
    #requires Wings of a Hippogryph
    .goto 97,49.72,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .accept 9604 >>接任务: |cRXP_LOOT_乘坐角鹰兽|r
	.target Zaldaan
step
    .xp >10,1
    #completewith next
    +|cRXP_WARN_仅当草药或矿石资源就在附近时, 才采集以获取经验|r
step
    .xp >10,1
    #completewith next
    >>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
    .complete 9454,1 --6/6 Moongraze Stag Tenderloin
	.mob Moongraze Stag
	.mob Moongraze Buck
step
    .xp >10,1
    #loop
    .goto 97,51.48,44.08,40,0
    .goto 97,52.08,41.08,40,0
    .goto 97,49.84,40.35,40,0
    .goto 97,47.37,41.81,40,0
    .goto 97,43.6,41.92,40,0
    .goto 97,43.52,45.58,40,0
    .goto 97,45.73,45.09,40,0
    >>击杀一只感染的夜行豹幼崽, 从他身上搜刮出|T134072:0|t[|cRXP_LOOT_微微发光的水晶|r]
	.collect 23678,1,9455
    .accept 9455 >>接任务: |cRXP_LOOT_奇怪的发现|r
	.mob Infected Nightstalker Runt
    .use 23678


-- ******************** ROUTES DIVERGE HERE ********************--


-- =========================================================
-- ===               XPRATE: ABOVE 1.10                  ===
-- =========================================================


step
    .xp >10,1
    #xprate >1.10
    #hidewindow
    #completewith Root Trapper Vine2
    #loop
    .goto 97,54.34,46.83,40,0
    .goto 97,55.34,44.58,40,0
    .goto 97,57.05,44.93,40,0
    .goto 97,57.82,46.96,40,0
    .goto 97,58.52,48.68,40,0
    .goto 97,59.29,51.17,40,0
    .goto 97,54.91,50.18,40,0
    .goto 97,53.97,49.63,40,0
    .goto 97,52.69,55.47,40,0
    .goto 97,50.89,59.6,40,0
    .goto 97,50.87,61.64,40,0
    .goto 97,52.33,61.18,40,0
    .goto 97,55.12,60.71,40,0
    .goto 97,58.15,60.18,40,0
    .goto 97,59.16,56.12,40,0
    +1
step
    .xp >10,1
    #xprate >1.10
    #completewith next
    #label Root Trapper Vine
    >>击杀 |cRXP_ENEMY_根须诱捕者|r. 击败它们后可获得 [|cRXP_LOOT_|T134196:0|t根须诱捕者的枝条|r ]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper
step
    #xprate >1.10
    #completewith Root Trapper Vine
    .xp >10,1
	>>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
    .complete 9454,1 --6/6 Moongraze Stag Tenderloin
	.mob Moongraze Stag
	.mob Moongraze Buck
step
    #requires Root Trapper Vine
    #label Root Trapper Vine2
    #xprate >1.10
    >>击杀 |cRXP_ENEMY_根须诱捕者|r. 击败它们后可获得 [|cRXP_LOOT_|T134196:0|t根须诱捕者的枝条|r ]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper
step
    #xprate >1.10
    .xp >10,1
    #completewith next
    #label The Great Moongraze Hunt
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 9454 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
    .disablecheckbox
	.target Acteon
step
    .xp >10,1
    #xprate >1.10
    #completewith The Great Moongraze Hunt
    .goto 97,49.78,51.94,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    .isQuestComplete 9454
    #xprate >1.10
    #requires The Great Moongraze Hunt
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 9454 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
	.target Acteon


-- ==============================================
-- ===        XPRATE: BETWEEN 1 - 1.10       ====
-- ==============================================


step
    #xprate 1-1.10
    .xp >10,1
    #hidewindow
    #completewith test
    #label Red Snapper
    .complete 9452,1 --10/10 Red Snapper
step
    .xp >10,1
    #completewith test
    #xprate 1-1.10
	>>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
    .complete 9454,1 --6/6 Moongraze Stag Tenderloin
	.mob Moongraze Stag
	.mob Moongraze Buck
step
    #completewith next
    #label test
    .xp >10,1
    #xprate 1-1.10
    >>击杀|cRXP_ENEMY_根须诱捕者|r. 击败它们后, 可掠夺 [|cRXP_LOOT_|T134196:0|t[根须诱捕者的枝条]|r]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper
step
    #xprate 1-1.10
    #completewith Red Snapper
    .xp >10,1
    #hidewindow
    .goto 97,53.24,46.32,40,0
    .goto 97,54.97,49.26,40,0
    .goto 97,56.41,44.31,40,0
    .goto 97,58.97,47.88,40,0
    .goto 97,61.37,47.15,60 >>1
step
    #requires test
    #loop
    #xprate 1-1.10
    .xp >10,1
    -- .goto 97,61.37,47.15,30,0
    -- .goto 97,61.08,48.65,30,0
    -- .goto 97,62.13,52.47,40,0
    -- .goto 97,62.16,52.42,40,0
    -- .goto 97,62.17,52.42,40,0
    .goto 97,61.36,47.15,30,0
    .goto 97,61.07,48.64,30,0
    .goto 97,62.23,52.88,30,0
    >>在钓鱼池附近使用|T134325:0|t[德莱尼渔网]. 如果出现|cRXP_ENEMY_愤怒的鱼人|r, 将其击杀, 并从其身上获得|T133892:0|t[|cRXP_LOOT_红钳鱼|r]
    .complete 9452,1 --10/10 Red Snapper
    .mob Angry Muloc
    .use 23654
step
    .goto 97,61.11,54.07
    #xprate 1-1.10
    .isQuestComplete 9452
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪泰娜|r交谈
    .turnin 9452 >>交任务: |cRXP_FRIENDLY_美味的红钳鱼|r
    .target Diktynna
step
    #xprate 1-1.10
    .xp >10,1
    .goto 97,61.06,54.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪泰娜|r交谈
    .accept 9453 >>接任务: |cRXP_LOOT_找到艾克提恩！|r
    .target Diktynna
-- step
--     .xp >10,1
--     #xprate 1-1.10
--     #hidewindow
--     #completewith Moongraze Stag Tenderloin
--     #loop
--     .goto 97,58.08,56.13,40,0
--     .goto 97,52.81,55.11,40,0
--     .goto 97,50.44,60.99,40,0
--     .goto 97,55.45,63.14,40,0
--     +1
-- step
--     .xp >10,1
--     #completewith next
--     #xprate 1-1.10
--     >>击杀|cRXP_ENEMY_根须诱捕者|r. 击败它们后, 可掠夺 [|cRXP_LOOT_|T134196:0|t[根须诱捕者的枝条]|r]
--     .complete 9463,1 --8/8 Root Trapper Vine
-- 	.mob Root Trapper
-- step
--     .xp >10,1
--     #xprate 1-1.10
-- 	>>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
--     .complete 9454,1 --6/6 Moongraze Stag Tenderloin
-- 	.mob Moongraze Stag
-- 	.mob Moongraze Buck
-- step
--     .xp >10,1
--     #xprate 1-1.10
--     #label Moongraze Stag Tenderloin
--     >>击杀 |cRXP_ENEMY_根须诱捕者|r. 击败它们后可获得 [|cRXP_LOOT_|T134196:0|t根须诱捕者的枝条|r ]
--     .complete 9463,1 --8/8 Root Trapper Vine
-- 	.mob Root Trapper
step
    .xp >10,1
    #completewith BloodElfBandit
    #xprate 1-1.10
    >>击杀|cRXP_ENEMY_根须诱捕者|r. 击败它们后, 可掠夺 [|cRXP_LOOT_|T134196:0|t[根须诱捕者的枝条]|r]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper
step
    .xp >10,1
    #completewith BloodElfBandit
    #xprate 1-1.10
	>>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
    .complete 9454,1 --6/6 Moongraze Stag Tenderloin
	.mob Moongraze Stag
	.mob Moongraze Buck
step
    .isOnQuest 9454
    #xprate 1-1.10
    .xp >10,1
    #label BloodElfBandit
    #title |cFFFCDC00跟随箭头指引|r
    .goto 97,53.13,60.94,30,0
    .goto 97,53.64,61.38,10,0
    .goto 97,52.98,61.69,10 >>|cRXP_WARN_[稀有]|r击杀|cRXP_ENEMY_血精灵强盗|r(如果他在), 从他身上搜刮 |T133473:0|t[|cRXP_LOOT_血精灵布告|r]
    .unitscan Blood Elf Bandit
step
    #hidewindow
    #xprate 1-1.10
    #completewith BloodElfBandit2
    #loop
    .goto 97,50.44,60.46,40,0
    .goto 97,51.56,57.5,40,0
    .goto 97,53.73,55.61,40,0
    .goto 97,59.32,56.45,40,0
    .goto 97,59.19,61.43,40,0
    .goto 97,56.49,64.11,40,0
    .goto 97,51.57,63.8,40,0
    +1
step
    .xp >10,1
    #completewith next
    #xprate 1-1.10
    >>击杀|cRXP_ENEMY_根须诱捕者|r. 击败它们后, 可掠夺 [|cRXP_LOOT_|T134196:0|t[根须诱捕者的枝条]|r]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper
step
    .xp >10,1
    #xprate 1-1.10
	>>击杀 |cRXP_ENEMY_Deer|r. 击败后可获得 |T134025:0|t[|cRXP_LOOT_月痕鹿的嫩腰肉|r]
    .complete 9454,1 --6/6 Moongraze Stag Tenderloin
	.mob Moongraze Stag
	.mob Moongraze Buck
step
    .xp >10,1
    #xprate 1-1.10
    #label BloodElfBandit2
    >>击杀|cRXP_ENEMY_根须诱捕者|r. 击败它们后, 可掠夺 [|cRXP_LOOT_|T134196:0|t[根须诱捕者的枝条]|r]
    .complete 9463,1 --8/8 Root Trapper Vine
	.mob Root Trapper

-- ******************** ROUTES INTERSECT HERE ********************--

step
    .isQuestComplete 9453
    .isQuestComplete 9454
    #xprate 1-1.10
    #requires The Great Moongraze Hunt
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 9454 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .turnin 9453 >>交任务: |cRXP_FRIENDLY_找到艾克提恩！|r
	.target Acteon
step
    .xp >10,1
    #xprate 1-1.10
    #requires The Great Moongraze Hunt
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    .xp >10,1
    #xprate 1.10-1.30
    #requires The Great Moongraze Hunt
    .goto 97,49.78,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    .isQuestComplete 9463
    .goto 97,48.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者法蒂玛|r交谈
    .turnin 9463 >>交任务: |cRXP_FRIENDLY_医疗材料|r
	.target Anchorite Fateema
step
    #xprate <1.30
    .xp >10,1
    .goto 97,48.3,51.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    *|cRXP_WARN_you might need to wait a few seconds before being able to accept the quest|r.
    .accept 9473 >>接任务: |cRXP_LOOT_备选方案的备选方案|r
	.target Daedal
step
    .isQuestComplete 9616
    .goto 97,47.24,50.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9616 >>交任务: |cRXP_FRIENDLY_强盗！|r
    .target Exarch Menelaous
step
    .isQuestComplete 9455
    .goto 97,47.24,50.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9455 >>交任务: |cRXP_FRIENDLY_奇怪的发现|r
	.target Exarch Menelaous

-- ******************** ROUTES DIVERGE HERE ********************--


-- ====================================
-- ===    XPRATE: ABOVE 1.30 MAIN  ====
-- ====================================

step
    #xprate >1.30
    .xp >10,1
    #completewith next
    #label Wings of a Hippogryph2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .disablecheckbox
    .target Nurguni
step
    #completewith Wings of a Hippogryph2
    .zoneskip 103
    .xp >10,1
    #xprate >1.30
    .goto 97,48.1,50.58,10,0
    .goto 97,49.69,49.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .fly The Exodar >>飞往埃索达
    .target Zaldaan
step
    #requires Wings of a Hippogryph2
    #xprate >1.30
    .isQuestComplete 9604
    .goto 103,54.77,44.1,25,0
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .target Nurguni
step
    #requires Wings of a Hippogryph2
    #xprate >1.30
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .target Nurguni
step
    #xprate >1.30
    .isQuestComplete 9605
    .goto 103,54.56,42.93,10,0
    .goto 103,54.35,36.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
    .target Stephanos
step
    #xprate >1.30
    .xp >10,1
    .goto 103,54.35,36.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .accept 9606 >>接任务: |cRXP_WARN_返回托菲尔·罗阿身边|r
    .target Stephanos
step
    #xprate >1.30
    .xp >10,1
    #completewith next
    #label Caregiver Chellan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan
step
    #xprate >1.30
    #completewith Caregiver Chellan
    .xp >10,1
    .hs >>使用 |T134414:0|t[炉石]
step
    #xprate >1.30
    #requires Caregiver Chellan
    .isQuestComplete 9606
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan


-- ╔═════════════════════════════════╗
-- ║       LEVEL 10 REACHED!         ║
-- ╚═════════════════════════════════╝




-- =====================================
-- ===    XP RATE: UNDER 1.30        ===
-- =====================================


step
    #xprate <1.30
    .xp >10,1
    .goto 97,47.12,50.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .accept 9456 >>接任务: |cRXP_LOOT_清理夜行豹......|r
	.target Exarch Menelaous
step
    #xprate <1.30
    #completewith next
    #label Azure Snapdragon Bulb
    #hidewindow
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate <1.30
    .xp >10,1
    #completewith Azure Snapdragon Bulb
    .goto 97,46.97,49.12,10,0
    .goto 97,46.98,48.26,10,0
    .goto 97,46.41,46.95,25 >>跨过树干
step
    #xprate <1.30
    #requires Azure Snapdragon Bulb
    .xp >10,1
    #hidewindow
    #completewith Infected Nightstalker Runt 
    #loop
    .goto 97,46.02,44.02,40,0
    .goto 97,44.7,45.52,40,0
    .goto 97,42.7,47.24,40,0
    .goto 97,40.74,46.05,40,0
    .goto 97,41.08,43.36,40,0
    .goto 97,44.48,41.62,40,0
    .goto 97,41.38,39.42,40,0
    .goto 97,41.62,36.33,40,0
    .goto 97,49.26,37.16,40,0
    .goto 97,48.04,34.66,40,0
    .goto 97,50.44,34.46,40,0
    .goto 97,52.48,33.97,40,0
    .goto 97,54.69,37.83,40,0
    +1
step
    #xprate <1.30
    #requires Azure Snapdragon Bulb
    #completewith Moongraze Buck Hide
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate <1.30
    #requires Azure Snapdragon Bulb
    #completewith Moongraze Buck Hide
    .xp >10,1
    >>杀死|cRXP_ENEMY_感染的夜行豹幼崽|r
    .complete 9456,1 --8/8 Infected Nightstalker Runt slain
    .mob Infected Nightstalker Runt
step
    #xprate <1.30
    #requires Azure Snapdragon Bulb
    #label Moongraze Buck Hide
    .xp >10,1
    >>击杀|r月痕巨鹿|c敌人. 从它们身上获取战利品:|T134346:0|t[|cRXP_LOOT_月痕鹿皮|r]
    .complete 10324,1 --6/6 Moongraze Buck Hide
    .mob Moongraze Buck
step
    #xprate <1.30
    #completewith next
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate <1.30
    .xp >10,1
    >>杀死|cRXP_ENEMY_感染的夜行豹幼崽|r
    .complete 9456,1 --8/8 Infected Nightstalker Runt slain
    .mob Infected Nightstalker Runt
step
    #xprate <1.30
    .xp >10,1
    #label Infected Nightstalker Runt
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb


-- ===========================================
-- ===     XPRATE: BETWEEN 1.25-1.30       ===
-- ===========================================


step
    #xprate 1.25-1.30
    .xp >10,1
    #hidewindow
    #completewith next
    #label Nightstalker Clean Up, Isle 2...
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate 1.25-1.30
    #completewith Nightstalker Clean Up, Isle 2...
    .xp >10,1
    .hs >>使用 |T134414:0|t[炉石]
step
    #xprate 1.25-1.30
    #requires Nightstalker Clean Up, Isle 2...
    #completewith next
    #label Exarch Menelaous
    .xp >10,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate 1.25-1.30
    .xp >10,1
    #requires Nightstalker Clean Up, Isle 2...
    #completewith Exarch Menelaous
    .goto 97,48.83,50,5 >>离开房屋
step
    #requires Exarch Menelaous
    #xprate 1.25-1.30
    .isQuestComplete 9473
    .goto 97,47.85,50.66,20,0
    .goto 97,47.14,50.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate 1.25-1.30
    .isQuestComplete 9473
    .goto 97,48.43,51.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
    .timer 36,RP
    .target Daedal
step
    #xprate 1.25-1.30
    .isQuestComplete 10324
    .goto 97,49.80,51.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .target Acteon

-- ╔═════════════════════════════════╗
-- ║       LEVEL 10 REACHED!         ║
-- ╚═════════════════════════════════╝


-- =====================================
-- ====    XPRATE: UNDER 1.25       ====
-- =====================================


step
    #xprate <1.25
    #completewith next
    #hidewindow
    #label Wings of a Hippogryph3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .disablecheckbox
    .target Nurguni
step
    #xprate <1.25
    #completewith Wings of a Hippogryph3
    #title |cFFFCDC00跟随箭头指引|r
    .goto 97,47.2,43.22,40,0
    .goto 97,49.71,49.1,60 >>绕过山脚前往飞行路径
step
    #xprate <1.25
    #requires Wings of a Hippogryph3
    #completewith next
    #label Wings of a Hippogryph4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .disablecheckbox
    .target Nurguni
step
    #requires Wings of a Hippogryph3
    #completewith Wings of a Hippogryph4
    #xprate <1.25
    .goto 97,49.71,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .fly The Exodar >>飞往埃索达
    .target Zaldaan
step
    #xprate <1.25
    #requires Wings of a Hippogryph4
    .isQuestComplete 9604
    .goto 103,54.8,44.03,20,0
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈 
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .target Nurguni
step
    #xprate <1.25
    #requires Wings of a Hippogryph4
    .xp >10,1
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .target Nurguni
step
    #xprate <1.25
    .isQuestComplete 9605
    .goto 103,54.51,36.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
	.target Stephanos
step
    #xprate <1.25
    .xp >10,1
    .goto 103,54.51,36.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .accept 9606 >>接任务: |cRXP_WARN_返回托菲尔·罗阿身边|r
	.target Stephanos
step
    #xprate <1.25
    #completewith next
    #label Caregiver Chellan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan
step
    #xprate <1.25
    #completewith Caregiver Chellan
    .xp >10,1
    .hs >>使用 |T134414:0|t[炉石]
step
    #xprate <1.25
    #requires Caregiver Chellan
    .isQuestComplete 9606
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan
step
    #xprate <1.25
    .xp >10,1
    #hidewindow
    #completewith next
    #label Nightstalker Clean Up, Isle 2...
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate <1.25
    .xp >10,1
    #completewith Nightstalker Clean Up, Isle 2...
    .goto 97,48.82,50.02,10 >>离开房屋
step
    #xprate <1.25
    #requires Nightstalker Clean Up, Isle 2...
    .isQuestComplete 9456
    .goto 97,47.8,50.65,25,0
    .goto 97,47.24,50.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate <1.25
    .isQuestComplete 9473
    .goto 97,48.45,51.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
    .timer 36,RP
    .target Daedal
step
    #xprate <1.25
    .isQuestComplete 10324
    .goto 97,49.66,51.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .target Acteon


-- ===========================================
-- ====    XPRATE: ABOVE 1.30 BACKUP      ====
-- ===========================================
     
step
    .xp >10,1
    #xprate >1.30
    #completewith next
    #label The Great Moongraze Hunt Backup
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    #xprate >1.30
    .xp >10,1
    #completewith The Great Moongraze Hunt Backup
    .goto 97,48.83,50,5 >>离开房屋
step
    .xp >10,1
    #xprate >1.30
    #requires The Great Moongraze Hunt Backup
    .goto 97,49.72,51.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
    .accept 10324 >>接任务: |cRXP_LOOT_狩猎月痕鹿|r
	.target Acteon
step
    #xprate >1.30
    .xp >10,1
    .goto 97,48.43,51.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    .accept 9473 >>接任务: |cRXP_LOOT_备选方案的备选方案|r
	.target Daedal
step
    #xprate >1.30
    .xp >10,1
    .goto 97,47.22,50.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .accept 9456 >>接任务: |cRXP_LOOT_清理夜行豹......|r
	.target Exarch Menelaous
step
    #xprate >1.30
    #completewith next
    #label Azure Snapdragon Bulb
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate >1.30
    .xp >10,1
    #completewith Azure Snapdragon Bulb
    .goto 97,46.97,49.12,10,0
    .goto 97,46.98,48.26,10,0
    .goto 97,46.41,46.95,25 >>跨过树干
step
    #xprate >1.30
    #requires Azure Snapdragon Bulb
    .xp >10,1
    #hidewindow
    #completewith Infected Nightstalker Runt 
    #loop
    .goto 97,44.7,45.52,40,0
    .goto 97,42.7,47.24,40,0
    .goto 97,40.74,46.05,40,0
    .goto 97,41.08,43.36,40,0
    .goto 97,44.48,41.62,40,0
    .goto 97,41.38,39.42,40,0
    .goto 97,41.62,36.33,40,0
    .goto 97,49.26,37.16,40,0
    .goto 97,48.04,34.66,40,0
    .goto 97,50.44,34.46,40,0
    .goto 97,52.48,33.97,40,0
    .goto 97,54.69,37.83,40,0
    +1
step
    #xprate >1.30
    #requires Azure Snapdragon Bulb
    #completewith Moongraze Buck Hide
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate >1.30
    #requires Azure Snapdragon Bulb
    #completewith Moongraze Buck Hide
    .xp >10,1
    >>杀死|cRXP_ENEMY_感染的夜行豹幼崽|r
    .complete 9456,1 --8/8 Infected Nightstalker Runt slain
    .mob Infected Nightstalker Runt
step
    #xprate >1.30
    #requires Azure Snapdragon Bulb
    #label Moongraze Buck Hide
    .xp >10,1
    >>击杀|r月痕巨鹿|c敌人. 从它们身上获取战利品:|T134346:0|t[|cRXP_LOOT_月痕鹿皮|r]
    .complete 10324,1 --6/6 Moongraze Buck Hide
    .mob Moongraze Buck
step
    #xprate >1.30
    #completewith next
    .xp >10,1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate >1.30
    .xp >10,1
    >>杀死|cRXP_ENEMY_感染的夜行豹幼崽|r
    .complete 9456,1 --8/8 Infected Nightstalker Runt slain
    .mob Infected Nightstalker Runt
step
    #xprate >1.30
    .xp >10,1
    #label Infected Nightstalker Runt
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
    *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
    .complete 9473,1 --5/5 Azure Snapdragon Bulb
step
    #xprate >1.30
    .xp >10,1
    #completewith next
    #label Nightstalker Clean Up, Isle 2...
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate >1.30
    .xp >10,1
    #completewith Nightstalker Clean Up, Isle 2...
    #title |cFFFCDC00跟随箭头指引|r
    .goto 97,47.2,43.22,40,0
    .goto 97,48.27,48.51,40,0 
    .goto 97,47.14,50.61,60 >>绕过这座山, 前往任务发布者处
step
    #requires Nightstalker Clean Up, Isle 2...
    #xprate >1.30
    .isQuestComplete 9473
    .goto 97,47.17,50.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
    .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
    .target Exarch Menelaous
step
    #xprate >1.30
    .isQuestComplete 9473
    .goto 97,48.43,51.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
    .timer 36,RP
    .target Daedal
step
    #xprate >1.30
    .isQuestComplete 10324
    .goto 97,49.67,51.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾克提恩|r交谈
    .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
    .target Acteon

-- =============================================
-- ====   XPRATE: BETWEEN 1.25-1.30 BACKUP    ==
-- =============================================


step
    #xprate 1.25-1.30
    #requires Wings of a Hippogryph3
    #completewith next
    #label Wings of a Hippogryph4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .disablecheckbox
    .target Nurguni
step
    #requires Wings of a Hippogryph3
    #completewith Wings of a Hippogryph4
    #xprate 1.25-1.30
    .goto 97,49.71,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔达恩|r交谈
    .fly The Exodar >>飞往埃索达
    .target Zaldaan
step
    #xprate 1.25-1.30
    #requires Wings of a Hippogryph4
    .isQuestComplete 9604
    .goto 103,54.8,44.03,20,0
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
    .target Nurguni
step
    #xprate 1.25-1.30
    #requires Wings of a Hippogryph4
    .xp >10,1
    .goto 103,56.78,49.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r交谈
    .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
    .target Nurguni
step
    #xprate 1.25-1.30
    .isQuestComplete 9605
    .goto 103,54.8,44.03,20,0
    .goto 103,54.51,36.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
	.target Stephanos
step
    #xprate 1.25-1.30
    .xp >10,1
    .goto 103,54.51,36.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .accept 9606 >>接任务: |cRXP_WARN_返回托菲尔·罗阿身边|r
	.target Stephanos
step
    .xp >10,1
    #xprate 1.25-1.30
    #completewith next
    #hidewindow
    #label Caregiver Chellan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan
step
    #xprate 1.25-1.30
    #completewith Caregiver Chellan
    .xp >10,1
    .goto 103,54.47,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
    .fly Azure Watch >>飞往碧蓝岗哨
    .target Stephanos
step
    #xprate 1.25-1.30
    #requires Caregiver Chellan
    #completewith next
    #label Caregiver Chellan2
    .isQuestComplete 9606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan
step
    #requires Caregiver Chellan
    #xprate 1.25-1.30
    #completewith Caregiver Chellan2
    .goto 97,48.79,49.93,10 >>进入房屋
step
    #xprate 1.25-1.30
    #requires Caregiver Chellan2
    .isQuestComplete 9606
    .goto 97,48.42,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护员谢尔兰|r交谈
    .turnin 9606 >>交任务: |cRXP_FRIENDLY_返回托菲尔·罗阿身边|r
    .target Caregiver Chellan


-- ******************** ROUTES INTERSECT HERE ********************--


-- =========================
-- ====  NO XPRATES END ====
-- =========================

step
    .xp >10,1
    .goto 97,48.45,51.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
    .accept 9505 >>接任务: |cRXP_WARN_维伦的预言|r
    .target Daedal
-- step
--     .isQuestComplete 9505
--     .xp <9.7,1
--     .goto 97,47.02,70.07
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
--     .turnin 9505 >>交任务: |cRXP_FRIENDLY_维伦的预言|r
--     .target Admiral Odesyus
-- step
--     .xp >10,1
--     .xp <9.7,1
--     .goto 97,46.66,70.37
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
--     .skipgossipid 30302
--     .train 2550 >>训练 |T4620671:0|t[烹饪]
-- 	.target "Cookie" McWeaksauce
step
    .xp >10,1
    .xp >9.7,1
    .goto 97,46.66,70.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .accept 9512 >>接任务: |cRXP_LOOT_曲奇的大餐|r
	.target "Cookie" McWeaksauce
step
    .xp >10,1
    .xp >9.7,1
    .goto 97,46.66,70.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .skipgossipid 30302
    .train 2550 >>训练 |T4620671:0|t[烹饪]
	.target "Cookie" McWeaksauce
step
    .isQuestComplete 9505
    .xp >9.7,1
    .goto 97,46.94,70.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9505 >>交任务: |cRXP_FRIENDLY_维伦的预言|r
    .target Admiral Odesyus
-- step
--     .isNotOnQuest 9506
--     .xp >10,1
--     .xp <9.8,1
--     #loop
--     .goto 97,47.77,73.24,40,0
--     .goto 12,32.41,29.53,40,0
--     .goto 12,32.57,29.4,40,0
--     .goto 12,32.68,29.07,40,0
--     .goto 97,50.79,69.63,40,0
--     >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
--     .complete 9512,1 --6/6 Skittering Crawler Meat
-- 	.mob Skittering Crawler
-- step
--     .isQuestComplete 9512
--     .isNotOnQuest 9506
--     .xp >10,1
--     .xp <9.8,1
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
--     .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
--     .goto 97,46.79,70.6
-- 	.target +"Cookie" McWeaksauce
step
    .xp >10,1
    .xp >9.8,1
    .goto 97,47.03,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
    .accept 9506 >>接任务: |cRXP_LOOT_第三类接触|r
	.target Admiral Odesyus
step
    .xp >10,1
    .xp >9.8,1
    #completewith next
    #label Skittering Crawler Meat
    >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .xp >10,1
    .xp >9.8,1
    #completewith Skittering Crawler Meat
    #hidewindow
    .goto 97,50.01,69.84,40,0
    .goto 97,52.37,69.3,40,0
    .goto 97,58.13,69.25,40,0
    .goto 97,59.94,70.42,40,0
    .goto 97,61.66,68.32,40 >>1
step
    .xp >10,1
    .xp >9.8,1
    #requires Skittering Crawler Meat
    .goto 97,59.57,67.65
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小营地中的|cRXP_PICK_航海罗盘|r
    .complete 9506,1 --1/1 Nautical Compass
step
    .xp >10,1
    .xp >9.8,1
    .goto 97,58.60,66.36
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小型营地中的|cRXP_PICK_航海图|r
    .complete 9506,2 --1/1 Nautical Map
step
    .xp >10,1
    .xp >9.8,1
    #loop
    .goto 97,55.49,69.25,40,0
    .goto 97,52.43,69.1,40,0
    .goto 97,50.8,69.66,40,0
    .goto 97,49.76,73.69,40,0
    .goto 97,48.37,71.99,40,0
    >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .xp >9.8,1
    .isQuestComplete 9506
    .goto 97,47.03,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
    .turnin 9506 >>交任务: |cRXP_FRIENDLY_第三类接触|r
step
    .xp >10,1
    .xp <9.7,1
    .goto 97,47.02,70.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海军上将奥德修斯|r交谈
    .turnin 9505 >>交任务: |cRXP_FRIENDLY_维伦的预言|r
    .target Admiral Odesyus
step
    .xp >10,1
    .xp <9.7,1
    .goto 97,46.66,70.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .skipgossipid 30302
    .train 2550 >>训练 |T4620671:0|t[烹饪]
	.target "Cookie" McWeaksauce
step
    .isNotOnQuest 9506
    .xp >10,1
    .xp <9.8,1
    #loop
    .goto 97,47.77,73.24,40,0
    .goto 12,32.41,29.53,40,0
    .goto 12,32.57,29.4,40,0
    .goto 12,32.68,29.07,40,0
    .goto 97,50.79,69.63,40,0
    >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .isQuestComplete 9512
    .isNotOnQuest 9506
    .xp >10,1
    .xp <9.8,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
    .goto 97,46.79,70.6
	.target +"Cookie" McWeaksauce



-- ╔═════════════════════════════════╗
-- ║       LEVEL 10 REACHED!         ║
-- ╚═════════════════════════════════╝


--------------------------
step
    .xp >10,1
    .goto 97,47.03,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
    .accept 9506 >>接任务: |cRXP_LOOT_第三类接触|r
	.target Admiral Odesyus
step
    .xp >10,1
    #completewith next
    #label Skittering Crawler Meat
    >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .xp >10,1
    #completewith Skittering Crawler Meat
    #hidewindow
    .goto 97,50.01,69.84,40,0
    .goto 97,52.37,69.3,40,0
    .goto 97,58.13,69.25,40,0
    .goto 97,59.94,70.42,40,0
    .goto 97,61.66,68.32,40 >>1
step
    .xp >10,1
    #requires Skittering Crawler Meat
    .goto 97,59.57,67.65
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小营地中的|cRXP_PICK_航海罗盘|r
    .complete 9506,1 --1/1 Nautical Compass
step
    .xp >10,1
    .goto 97,58.60,66.36
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击小型营地中的|cRXP_PICK_航海图|r
    .complete 9506,2 --1/1 Nautical Map
step
    .xp >10,1
    #loop
    .goto 97,55.49,69.25,40,0
    .goto 97,52.43,69.1,40,0
    .goto 97,50.8,69.66,40,0
    .goto 97,49.76,73.69,40,0
    .goto 97,48.37,71.99,40,0
    >>击杀|cRXP_ENEMY_迅捷的螃蟹|r. 击败它们后可获得 |T134007:0|t[|cRXP_LOOT_迅捷螃蟹的肉|r ]
    .complete 9512,1 --6/6 Skittering Crawler Meat
	.mob Skittering Crawler
step
    .isQuestComplete 9506
    .goto 97,47.03,70.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
    .turnin 9506 >>交任务: |cRXP_FRIENDLY_第三类接触|r
-- step
--     .xp >10,1
--     .xp <9.8,1
--     .goto 97,47.03,70.20
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
--     .accept 9530 >>接任务: |cRXP_LOOT_天才的方案！|r
-- 	.target +Admiral Odesyus
-- step
--     .xp >10,1
--     .xp <9.8,1
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女祭司凯琳·伊尔蒂娜|r和|cRXP_FRIENDLY_考古学家阿达曼特·铁心|r交谈
--     .accept 9513 >>接任务: |cRXP_LOOT_夺回废墟|r
--     .goto 97,47.13,70.28
-- 	.target +Priestess Kyleen
--     .accept 9523 >>接任务: |cRXP_LOOT_贵重物品，小心轻放|r
--     .goto 97,47.24,70.00
--     .target +Archaeologist Adamant Ironheart
step
    .isQuestComplete 9512
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_"曲奇"米维克索斯|r交谈
    .turnin 9512 >>交任务: |cRXP_FRIENDLY_曲奇的大餐|r
    .goto 97,46.69,70.53
	.target +"Cookie" McWeaksauce
-- step
--     .xp >10,1
--     #loop
--     .goto 97,50.66,66.93,40,0
--     .goto 97,51.81,65.36,40,0
--     .goto 97,50.96,64.48,40,0
--     .goto 97,50.19,62.67,40,0
--     .goto 97,48.99,61.85,40,0
--     .goto 97,49.29,63.22,40,0
--     .goto 97,48.25,64.9,40,0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_树桩|r和|cRXP_PICK_落叶堆|r
--     .complete 9530,2 --5/5 Pile of Leaves
--     .complete 9530,1 --1/1 Hollowed Out Tree
-- step
--     .isQuestComplete 9530
--     .goto 97,47.04,70.21
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
--     .turnin 9530 >>交任务: |cRXP_FRIENDLY_天才的方案！|r
-- 	.target Admiral Odesyus
-- step
--     .xp >10,1
--     .goto 97,47.04,70.21
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
--     .accept 9531 >>接任务: |cRXP_LOOT_间谍之树|r
-- 	.target Admiral Odesyus
step
    #include a) 失落的龙鳞(联盟)






































-- step
--     #loop

--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
--     *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
--     .complete 9473,1 --5/5 Azure Snapdragon Bulb
-- step
--     #loop
--     .goto 97,46.79,53.01,30,0
--     .goto 97,47.7,53.99,30,0
--     .goto 97,47.06,58.52,30,0
--     .goto 97,50.07,59.37,30,0
--     .goto 97,43.71,57.17,30,0
--     .goto 97,52.11,59.76,30,0
--     .goto 97,54.43,57.31,30,0
--     .goto 97,51.13,55.16,30,0
--     .goto 97,43.6,56.25,30,0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_碧蓝金鱼草|r
--     *|cRXP_WARN_These should be visible on your minimap, provided you have learned the Herbalism skill.|r.
--     .complete 9473,1 --5/5 Azure Snapdragon Bulb
-- step
--     #hidewindow
--     #completewith Wrathscale
--     #loop
--     .goto 97,45.85,71.97,30,0
--     .goto 97,41.36,74.99,30,0
--     .goto 97,39.63,75.2,30,0
--     .goto 97,37.86,80.73,30,0
--     .goto 97,35.02,80.97,30,0
--     .goto 97,35.57,77.98,30,0
--     .goto 97,34.43,76.67,30,0
--     .goto 97,33.76,79.13,30,0
--     .goto 97,31.23,77.58,30,0
--     .goto 97,29.91,78.67,30,0
--     .goto 97,27.92,79.45,30,0
--     .goto 97,26.14,77.96,30,0
--     .goto 97,29.22,76.68,30,0
--     +1
-- step
--     #completewith next
--     >>击杀|cRXP_ENEMY_Nagas|r并从其身上搜刮出[|cRXP_LOOT_|T134462:0|t符文覆盖的石板. |r]
--     -- *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_写满符文的石板|r.
-- 	.collect 23759,1,9514
--     .accept 9514 >>接任务: |cRXP_WARN_写满符文的石板|r
--     .complete 9513,1 --5/5 Wrathscale Myrmidon slain
--     .complete 9513,2 --5/5 Wrathscale Naga slain
--     .complete 9513,3 --5/5 Wrathscale Siren slain
-- 	.mob Wrathscale Myrmidon
-- 	.mob Wrathscale Naga
-- 	.mob Wrathscale Siren
--     .use 23759
-- step
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_远古的圣物|r
--     .complete 9523,1 --8/8 Ancient Relic
-- step
--     #label Wrathscale
--     >>击杀|cRXP_ENEMY_Nagas|r并从其身上搜刮出[|cRXP_LOOT_|T134462:0|t符文覆盖的石板. |r]
--     -- *|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_写满符文的石板|r.
-- 	.collect 23759,1,9514
--     .accept 9514 >>接任务: |cRXP_WARN_写满符文的石板|r
--     .complete 9513,1 --5/5 Wrathscale Myrmidon slain
--     .complete 9513,2 --5/5 Wrathscale Naga slain
--     .complete 9513,3 --5/5 Wrathscale Siren slain
-- 	.mob Wrathscale Myrmidon
-- 	.mob Wrathscale Naga
-- 	.mob Wrathscale Siren
--     .use 23759
-- step
--     #hidewindow
--     #completewith Infected Nightstalker Runt
--     #loop
--     .goto 97,28.5,73.33,40,0
--     .goto 97,32.05,71.43,40,0
--     .goto 97,32.63,65.74,40,0
--     .goto 97,24.98,73.92,40,0
--     +1
-- step
--     #completewith next
--     >>杀死 |cRXP_ENEMY_感染的夜行豹幼崽|r
--     .complete 9456,1 --8/8 Infected Nightstalker Runt slain
-- 	.mob Infected Nightstalker Runt
-- step
--     >>击杀|cRXP_ENEMY_月痕巨鹿|r, 然后从其身上获取[|cRXP_LOOT_|T134346:0|t月痕鹿皮|r]
--     .complete 10324,1 --6/6 Moongraze Buck Hide
-- 	.mob Moongraze Buck
-- step
--     #label Infected Nightstalker Runt
--     >>杀死 |cRXP_ENEMY_感染的夜行豹幼崽|r
--     .complete 9456,1 --8/8 Infected Nightstalker Runt slain
-- 	.mob Infected Nightstalker Runt
-- step
--     .isOnQuest 9531
--     .goto 97,18.8,83.46,10,0
--     .goto 97,18.37,86.32,10,0
--     .goto 97,16.59,94.46
--     .aura 30298 >>请在|cRXP_WARN_Red Flag|r附近使用 |T132288:0|t[树伪装工具包]
--     .use 23792
-- step
--     #completewith next
--     .aura -30298 >>右键取消树伪装工具包效果
--     .link /cancelaura Tree Disguise Kit >>|TInterface/cursor/crosshair/interact.blp:20|t点击此处获取宏. 将其粘贴至聊天框中
-- step
--     .goto 97,15.26,92.24
--     >>|cRXP_WARN_跟随箭头|r
--     .complete 9531,1 --1/1 The Traitor Uncovered
-- step
--     #label QuestKeybindingsDraenei2
--     .goto 97,16.59,94.46
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库雷|r交谈
--     .turnin 10428 >>交任务: |cRXP_FRIENDLY_失踪的渔夫|r
--     .accept 9527 >>接任务: |cRXP_LOOT_遗体|r
-- 	.target Cowlen
-- step
--     .goto 97,14.58,90.66
--     >>击杀|cRXP_ENEMY_猫头兽|r并从它们身上搜刮出[|cRXP_LOOT_科伦家族的遗物|r]
--     .complete 9527,1 --1/1 Remains of Cowlen's Family
-- step
--     #sticky
--     .goto 97,16.59,94.45
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库雷|r交谈
--     .turnin 9527 >>交任务: |cRXP_FRIENDLY_遗体|r
-- 	.target Cowlen
-- step
--     #completewith next
--     .deathskip >>击杀|cRXP_ENEMY_Owlbeasts|r刷新点|cRXP_WARN_在碧蓝岗哨|r
-- step
--     .goto 97,47.04,70.21
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
--     .turnin 9531 >>交任务: |cRXP_FRIENDLY_间谍之树|r
--     .accept 9537 >>接任务: |cRXP_LOOT_绳侏儒以法|r
-- 	.target Admiral Odesyus
-- step
--     .goto 97,47.13,70.29
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
--     .turnin 9513 >>交任务: |cRXP_FRIENDLY_夺回废墟|r
-- 	.target Priestess Kyleen Il'dinare
-- step
--     .goto 97,47.14,70.33
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师凯琳·伊尔迪纳尔|r交谈
--     .turnin 9514 >>交任务: |cRXP_FRIENDLY_写满符文的石板|r
-- 	.target Priestess Kyleen Il'dinare
-- step
--     .goto 97,47.23,69.99
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家阿达曼特·铁心|r交谈
--     .turnin 9523 >>交任务: |cRXP_FRIENDLY_贵重物品，小心轻放|r
-- 	.target Archaeologist Adamant Ironheart
-- step
--     .goto 97,48.56,71.71
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师欧格林德|r交谈
--     >>|cRXP_WARN_等待剧情推进,|r击杀|cRXP_ENEMY_工程师“火花”欧格林德|r并从他身上搜刮 [|cRXP_LOOT_叛徒的通讯装置|r]
--     .complete 9537,1 --1/1 Traitor's Communication
--     .skipgossip
--     .mob Engineer "Spark" Overgrind
-- step
--     .goto 97,47.04,70.21
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营海军上将奥德修斯|r交谈
--     .turnin 9537,1 >>交任务: |cRXP_FRIENDLY_绳侏儒以法|r
--     .accept 9602 >>接任务: |cRXP_LOOT_邪恶的书信|r
-- 	.target Admiral Odesyus
-- step
--     #completewith next
--     .hs >>炉石|cRXP_WARN_to 碧蓝岗哨|r.
-- step
--     .goto 97,49.78,51.94
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾克提恩|r交谈
--     .turnin 10324 >>交任务: |cRXP_FRIENDLY_狩猎月痕鹿|r
-- 	.target Acteon
-- step
--     .goto 97,48.39,51.47
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹达尔|r交谈
--     .turnin 9473 >>交任务: |cRXP_FRIENDLY_备选方案的备选方案|r
-- 	.target Daedal
-- step
--     .goto 97,47.12,50.61
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大主教梅内莱厄斯|r交谈
--     .turnin 9602 >>交任务: |cRXP_FRIENDLY_邪恶的书信|r
--     .turnin 9456 >>交任务: |cRXP_FRIENDLY_清理夜行豹......|r
-- 	.target Exarch Menelaous
-- step
--     .goto 103,81.51,51.47
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_象群管理者妥拉留斯|r交谈
--     .turnin 9623 >>交任务: |cRXP_FRIENDLY_成年|r
-- 	.target Torallius the Pack Handler
-- step
--     .goto 103,75.17,53.85,20,0
--     .goto 103,73.55,39.76,20,0
--     .goto 103,66.18,33.78,20,0
--     .goto 103,62.49,43.7,20,0
--     .goto 103,57.03,50.08
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努古尼|r|cRXP_WARN_inside 埃索达|r交谈
--     .turnin 9604 >>交任务: |cRXP_FRIENDLY_乘坐角鹰兽|r
--     .accept 9605 >>接任务: |cRXP_LOOT_斯泰法努斯|r
-- 	.target Nurguni
-- step
--     .goto 103,55.07,47.2
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
-- 	.target Hero's Herald
-- step
--     .goto 103,54.49,36.32
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯泰法努斯|r交谈
--     .turnin 9605 >>交任务: |cRXP_FRIENDLY_斯泰法努斯|r
-- 	.target Stephanos
-- step
--     .nodmf
--     .goto 103,48.34,62.9,5 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_暴风城传送门|r
--     .zoneskip 84
-- step
--     #completewith next
--     .goto 84,49.36,86.76,10,0
--     .goto 84,53.58,85.4,15,0
--     .goto 84,53.95,79.25,15,0
--     .goto 84,55.54,76.05,20,0
--     .goto 84,60.00,71.95,20,0
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
-- 	.target Hero's Herald
--     .nodmf
-- step
--     .goto 84,49.36,86.76,10,0
--     .goto 84,53.58,85.4,15,0
--     .goto 84,53.95,79.25,15,0
--     .goto 84,55.54,76.05,20,0
--     .goto 84,60.00,71.95,20,0
--     .goto 84,63.77,73.60
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
--     .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
-- 	.target Renato Gallina
--     .nodmf
-- step
--     .goto 84,67.49,80.56,20,0
--     .goto 84,67.03,83.44,20,0
--     .goto 84,69.76,84.87,20,0
--     .goto 37,41.71,64.64
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_闪金镇的勇敢的巴特利|r交谈
--     .fp >>获取闪金镇飞行路线
-- 	.target Bartlett the Brave
--     .nodmf
-- step
--     #veteran
--     .goto 103,61,52.56,5,0
--     .goto 103,63.23,58.75
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并且临时获得10%的经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品才能充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品|r
--     >>|cRXP_WARN_ 建议使用另一个拥有至少10,000金币的角色登录. 用该角色购买物品后, 再将它们发送过来|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师伊蕾萨|r交谈
--     .collect 71715,1
--     .collect 71638,1
--     .collect 71637,1
--     .collect 71636,1
--     .collect 71635,1
--     .collect 71952,1
--     .collect 71951,1
--     .collect 71953,1
--     .collect 71716,1
--     .target Auctioneer Iressa
--     .dmf
-- step
--     #fresh
--     #completewith DarkMoonFaire
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
--     .dmf
-- step
--     #completewith next
--     .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以获取一个宏, 该宏将取消学习你的专业|r
--     .dmf
-- step
--     #label DarkMoonFaire
--     .goto 103,51.34,42.03
--     .zoneskip 37 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
-- 	.target Darkmoon Faire Mystic Mage
--     .dmf
-- step
--     .goto 84,62.10,32.18
--     +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .zoneskip 37
--     .skipgossip
-- 	.target Darkmoon Faire Mystic Mage
--     .dmf
]])

--Dwarf Coldridge Vallley
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AB) 矮人冷岭谷
#displayname 寒脊山谷 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Dwarf !DK
#next AC) 矮人 & 侏儒 - 丹莫罗

<< Alliance


step
    .goto 427,67.28,41.62  --clickradius
    .goto 27,36.872,70.045  --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·铁枷|r交谈
    .accept 24469 >>接任务: |cRXP_WARN_坚守防线！|r
	.target Joren Ironstock
step
    #loop
    .goto 427,68.68,47.37,10,0
    .goto 427,63.75,47.23,10,0
    .goto 427,63.2,43.67,24,0
    .goto 427,59.38,48.48,30,0
    .goto 427,70.59,53.09,10,0
    >>击杀|cRXP_ENEMY_石腭入侵者|r
    .complete 24469,1 --Rockjaw Invader (6)
	.mob Rockjaw Invader
step
    .goto 427,66.79,41.91 --clickradius
    .goto 27,36.872,70.045 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·铁枷|r交谈
    .turnin 24469 >>交任务: |cRXP_FRIENDLY_坚守防线！|r
    .accept 24470 >>接任务: |cRXP_WARN_罪有应得！|r
	.target Joren Ironstock
step
    .goto 427,65.47,43.23
    .goto 427,65.89,44.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 24471 >>接任务: |cRXP_WARN_疗伤|r
	.target Sten Stoutarm
-- step << skip
--     #completewith next
--     +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
--     *[1] Press the |cRXP_WARN_Escape key|r.
--     *[2] Select |cRXP_WARN_Options|r.
--     *[3] Navigate to |cRXP_WARN_Keybindings|r.
--     *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides|r
--     *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
step
    #hidewindow
    #completewith Rockjaw Goons
    #loop
    .goto 427,55.95,49.85,25,0
    .goto 427,60.67,59.03,25,0
    .goto 427,75.17,55.16,40,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_石腭暴徒|r
    .complete 24470,1 --Rockjaw Goon (3)
	.mob Rockjaw Goon
step
    >>使用|T133675:0|t[斯坦的急救包]对|cRXP_FRIENDLY_受伤的寒脊巡山人|r|cRXP_WARN_他们正跪着|r
    *|cRXP_WARN_You can do this from a 5 yard distance|r.
    .complete 24471,1 --Wounded Coldridge Mountaineers Aided (4)
	.target Wounded Coldridge Mountaineer
	.use 49743
step
    #label Rockjaw Goons
    >>击杀|cRXP_ENEMY_石腭暴徒|r
    .complete 24470,1 --Rockjaw Goon (3)
	.mob Rockjaw Goon
step
    #completewith next
    #label Aid for the Wounded
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 24471 >>交任务: |cRXP_FRIENDLY_疗伤|r
	.target Sten Stoutarm
step
    #completewith Aid for the Wounded
    #title |cFFFCDC00跟随箭头指引|r
    .goto 427,65.46,43.86,40 >>|cRXP_WARN_如果你无法骑乘, 且能边走边高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Aid for the Wounded
    .goto 427,65.46,43.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 24471 >>交任务: |cRXP_FRIENDLY_疗伤|r
	.target Sten Stoutarm
step
    .goto 427,66.79,41.91 --clickradius
    .goto 27,36.872,70.045 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·铁枷|r交谈
    .turnin 24470 >>交任务: |cRXP_FRIENDLY_罪有应得！|r
    .accept 24473 >>接任务: |cRXP_WARN_安威玛尔紧急戒严|r
	.target Joren Ironstock
step
    #completewith next
    #label Lockdown in Anvilmar
    .goto 427,62.47,30.28,10,0
    .goto 427,61.87,27.51,10,0
    .goto 427,61.87,26.1,5,0
    .goto 427,62.53,24.98,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24473 >>交任务: |cRXP_FRIENDLY_安威玛尔紧急戒严|r
    .accept 24474 >>接任务: |cRXP_WARN_重要的事先做：我们需要啤酒|r
    .disablecheckbox
	.target Jona Ironstock
step
    #completewith Lockdown in Anvilmar
    .goto 427,61.7,22.06,20 >>进入安威玛尔
step
    #requires Lockdown in Anvilmar
    .goto 427,61.7,22.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24473 >>交任务: |cRXP_FRIENDLY_安威玛尔紧急戒严|r
    .accept 24474 >>接任务: |cRXP_WARN_重要的事先做：我们需要啤酒|r
	.target Jona Ironstock
step
    .goto 27,35.801,66.256
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r交谈
    .accept 24477 >>接任务: |cRXP_WARN_矮人圣物|r
	.target Grundel Harkin
step
    #completewith next
    #label Cask of Gnomenbrau
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Keg of Gnomenbrau|r
    .complete 24474,3,1 --Cask of Gnomenbrau (1)
step
    #completewith Cask of Gnomenbrau
    .goto 427,61.71,28.85,10 >>离开安威玛尔
step
    #requires Cask of Gnomenbrau
    #hidewindow
    #completewith Forgotten Dwarven Artifacts
    #loop
    .goto 427,62.31,32.29,10,0
    .goto 427,67.39,32.96,20,0
    .goto 427,71.47,28.57,30,0
    .goto 427,66.9,28.54,15,0
    .goto 427,64.94,30.27,5,0
    .goto 427,62.52,30.5,10,0
    .goto 427,60.02,30.05,10,0
    .goto 427,55.56,28.67,10,0
    .goto 427,55.03,24.18,15,0
    .goto 427,52.49,27.3,10,0
    .goto 427,48.4,28.52,15,0
    .goto 427,48.97,32.32,10,0
    .goto 427,46.99,31.44,15,0
    .goto 427,38.76,29.48,10,0
    .goto 427,34.83,30.78,10,0
    .goto 427,32.19,30.85,10,0
    .goto 427,30.89,33.19,20,0
    .goto 427,26.96,36.69,20,0
    .goto 427,23.17,33.56,20,0
    .goto 427,26.85,30.57,20,0
    +1
step
    #requires Cask of Gnomenbrau
    #completewith Cask of Theramore Pale Ale
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被遗忘的矮人圣物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step
    #requires Cask of Gnomenbrau
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Keg of Gnomenbrau|r
    .complete 24474,3 --Cask of Gnomenbrau (1)
step
    #requires Cask of Gnomenbrau
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_风暴战锤烈酒小桶|r
    .complete 24474,1 --Cask of Stormhammer Stout (1)
step
    #requires Cask of Gnomenbrau
    #label Cask of Theramore Pale Ale
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Keg of Theramore Pale Ale|r
    .complete 24474,2 --Cask of Theramore Pale Ale (1)
step
    #requires Cask of Gnomenbrau
    #label Forgotten Dwarven Artifacts
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被遗忘的矮人圣物|r
    .complete 24477,1 --Forgotten Dwarven Artifacts	(5)
step
    #completewith next
    #label Dwarven Artifacts
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r和|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24477 >>交任务: |cRXP_FRIENDLY_矮人圣物|r
    .turnin 24474 >>交任务: |cRXP_FRIENDLY_重要的事先做：我们需要啤酒|r
    .accept 24486 >>接任务: |cRXP_WARN_抓紧时机|r
    .disablecheckbox
    .accept 24475 >>接任务: |cRXP_WARN_其他的物资|r
    .disablecheckbox
	.target Jona Ironstock
	.target Grundel Harkin
step
    #completewith Dwarven Artifacts
    .hs >>炉石到安威玛尔
step
    #requires Dwarven Artifacts
    .goto 427,61.46,22.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r和|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24477 >>交任务: |cRXP_FRIENDLY_矮人圣物|r
    .accept 24486 >>接任务: |cRXP_WARN_抓紧时机|r
    .turnin 24474 >>交任务: |cRXP_FRIENDLY_重要的事先做：我们需要啤酒|r
    .accept 24475 >>接任务: |cRXP_WARN_其他的物资|r
	.target Jona Ironstock
	.target Grundel Harkin
step
    #completewith next
    #label Priceless Rockjaw Artifact (5)
    >>击杀 |cRXP_ENEMY_石腭挖掘者|r. 从他们身上搜刮出 |T135238:0|t[|cRXP_LOOT_岩石颚骨遗物|r ]
    *|cRXP_WARN_You can get extra artifacts by letting their cast hit you. They cast only once, from moderate range.|r
    .complete 24486,1 --Priceless Rockjaw Artifact (5)
step
    #completewith Priceless Rockjaw Artifact (5)
    .goto 427,61.71,28.85,10 >>离开安威玛尔
step
    #requires Priceless Rockjaw Artifact (5)
    #hidewindow
    #completewith Ragged Wolf Hide
    #loop
    .goto 427,53.5,44.53,30,0
    .goto 427,50.96,51.06,20,0
    -- .goto 427,54.47,59.34,30,0 --early cutoff
    .goto 427,55.84,63.43,30,0 -- late cutoff
    -- .goto 427,48.03,55.31,30,0 --early cutoff
    .goto 427,47.44,62.09,30,0 -- late cutoff
    -- .goto 427,47.62,44.34,30,0 --early cutoff
    .goto 427,48.05,43.36,30,0 -- late cutoff
    .goto 427,41.94,41.18,30,0
    .goto 427,48.13,33.92,30,0
    +1
step
    #requires Priceless Rockjaw Artifact (5)
    #completewith Priceless Rockjaw Artifact
    >>击杀 |cRXP_ENEMY_Ragged Timber Wolves|r和 |cRXP_ENEMY_Ragged Young Wolves|r. 击败它们后拾取 |T134366:0|t[|cRXP_LOOT_粗糙的狼皮|r]
    .complete 24475,2 --Ragged Wolf Hide (4)
    .mob *Ragged Young Wolf
    .mob *Ragged Timber Wolf
step
    #requires Priceless Rockjaw Artifact (5)
    #completewith Priceless Rockjaw Artifact
    >>击杀 |cRXP_ENEMY_小型峭壁野猪|r. 击败它们后可获得 |T133969:0|t[|cRXP_LOOT_野猪腰肉|r]
    .complete 24475,1 --Boar Haunch (3)
    .mob *Small Crag Boar
step
    #requires Priceless Rockjaw Artifact (5)
    #label Priceless Rockjaw Artifact
    >>击杀 |cRXP_ENEMY_石腭挖掘者|r. 从他们身上搜刮出 |T135238:0|t[|cRXP_LOOT_岩石颚骨遗物|r ]
    *|cRXP_WARN_You can get extra artifacts by letting their cast hit you. They cast only once, from moderate range.|r
    .complete 24486,1 --Priceless Rockjaw Artifact (5)
step
    #completewith next
    >>击杀 |cRXP_ENEMY_Ragged Timber Wolves|r和 |cRXP_ENEMY_Ragged Young Wolves|r. 击败它们后拾取 |T134366:0|t[|cRXP_LOOT_粗糙的狼皮|r]
    .complete 24475,2 --Ragged Wolf Hide (4)
    .mob *Ragged Young Wolf
    .mob *Ragged Timber Wolf
step
    >>击杀 |cRXP_ENEMY_小型峭壁野猪|r. 击败它们后可获得 |T133969:0|t[|cRXP_LOOT_野猪腰肉|r]
    .complete 24475,1 --Boar Haunch (3)
    .mob *Small Crag Boar
step
    #label Ragged Wolf Hide
    >>击杀 |cRXP_ENEMY_Ragged Timber Wolves|r和 |cRXP_ENEMY_Ragged Young Wolves|r. 击杀它们以获得 |T134366:0|t[|cRXP_LOOT_粗糙的狼皮|r]
    .complete 24475,2 --Ragged Wolf Hide (4)
    .mob *Ragged Young Wolf
    .mob *Ragged Timber Wolf
step
    #completewith next
    #label Make Hay While the Sun Shines
    .goto 427,60.83,30.43,10,0
    .goto 427,61.52,28.27,5,0
    .goto 427,61.51,26.57,5,0
    .goto 427,60.87,25.15,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r和|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24486 >>交任务: |cRXP_FRIENDLY_抓紧时机|r
    .turnin 24475 >>交任务: |cRXP_FRIENDLY_其他的物资|r
    .accept 24487 >>接任务: |cRXP_WARN_白须需要你|r
    .disablecheckbox
	.target Jona Ironstock
    .target Grundel Harkin
step
    #completewith Make Hay While the Sun Shines
    .goto 427,61.46,22.63,20 >>进入安威玛尔
step
    #requires Make Hay While the Sun Shines
    .goto 427,61.46,22.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格伦德尔·哈金|r和|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .turnin 24486 >>交任务: |cRXP_FRIENDLY_抓紧时机|r
    .turnin 24475 >>交任务: |cRXP_FRIENDLY_其他的物资|r
    .accept 24487 >>接任务: |cRXP_WARN_白须需要你|r
	.target Jona Ironstock
    .target Grundel Harkin
step
    #label Whitebeard Needs Ye
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_,|cRXP_FRIENDLY_格瑞林·白须|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_菲利克斯|r交谈
    .turnin 24487 >>交任务: |cRXP_FRIENDLY_白须需要你|r
    .accept 182 >>接任务: |cRXP_WARN_巨魔洞穴|r
    .disablecheckbox
	.target +Grelin Whitebeard
    .accept 24489 >>接任务: |cRXP_WARN_打探消息|r
    .disablecheckbox
	.target +Apprentice Soren
    .accept 3361 >>接任务: |cRXP_LOOT_逃难者的困境|r
    .disablecheckbox
	.target +Felix Whindlebolt
step
    #completewith Whitebeard Needs Ye
    .goto 427,61.65,28.18,5 >>离开安威玛尔
step
    #requires Whitebeard Needs Ye
    #label Whitebeard Needs Ye2
    #completewith next
    .goto 427,61.16,31.56,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_,|cRXP_FRIENDLY_格瑞林·白须|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_菲利克斯|r交谈
    .turnin 24487 >>交任务: |cRXP_FRIENDLY_白须需要你|r
    .accept 182 >>接任务: |cRXP_WARN_巨魔洞穴|r
    .disablecheckbox
	.target +Grelin Whitebeard
    .accept 24489 >>接任务: |cRXP_WARN_打探消息|r
    .disablecheckbox
	.target +Apprentice Soren
    .accept 3361 >>接任务: |cRXP_LOOT_逃难者的困境|r
    .disablecheckbox
	.target +Felix Whindlebolt
step
    #requires Whitebeard Needs Ye
    #completewith Whitebeard Needs Ye2
    #title |cFFFCDC00跟随箭头指引|r
    .goto 427,43.03,62.66 ,40 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Whitebeard Needs Ye2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_,|cRXP_FRIENDLY_格瑞林·白须|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_菲利克斯|r交谈
    .turnin 24487 >>交任务: |cRXP_FRIENDLY_白须需要你|r
    .accept 182 >>接任务: |cRXP_WARN_巨魔洞穴|r
    .goto 427,43.03,62.66 --clickradius
    .goto 27,32.064,74.170 --npc location
	.target +Grelin Whitebeard
    .accept 24489 >>接任务: |cRXP_WARN_打探消息|r
    .goto 427,43.03,62.66 --clickradius
    .goto 27,32.165,74.347 --npc location
	.target +Apprentice Soren
    .accept 3361 >>接任务: |cRXP_LOOT_逃难者的困境|r
    .goto 427,41.83,63.2
	.target +Felix Whindlebolt
-- step
--     --insert if bags are needed
--     #completewith Staging in Brewnall
--     .goto 427,41.83,63.2
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利克斯·温德尔bolt|r交谈
--     .collect 4496,3
--     .buy 4496,3
--     .target +Felix Whindlebolt
step
    #completewith Soothsayer Shi'kala Scouted
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Frostmane Troll Whelp (10)
	.mob Frostmane Troll Whelp
step
    #completewith next
    #label Felix's Box
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的盒子|r
    .complete 3361,1 --Felix's Box (1)
step
    #completewith Felix's Box
    .goto 27,27.759,75.195,11 >>在箭头位置11码范围内会触发事件. |cRXP_WARN_一旦开始, |r|cFFFF0000迅速拾取箱子, 然后进入室内|r
    *|cRXP_WARN_Avoid combat during this time|r.
    .timer 11,RP
step
    #requires Felix's Box
    #title |cFFFCDC00Pickup Box|r
    .goto 27,27.846,74.530
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的盒子|r
    .complete 3361,1 --Felix's Box (1)
step
    .goto 27,27.759,75.195
    #title |cFFFCDC00Hurry inside the Hut|r
    >>|cRXP_WARN_请在箭头标记处等待角色扮演|r.
    .complete 24489,3 --Soothsayer Mirim'koa Scouted (1)
    .target Soothsayer Mirim'koa
step
    #completewith next
    #label Felix's Chest
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的箱子|r
    .complete 3361,2 --Felix's Chest (1)
step
    #completewith Felix's Chest
    .goto 27,29.593,78.754,11 >>靠近箭头位置11码范围内会触发一个事件. |cRXP_WARN_一旦开始, |r|cFFFF0000迅速拾取宝箱, 然后进入室内|r
    *|cRXP_WARN_Avoid combat during this time|r.
    .timer 11,RP
step
    #requires Felix's Chest
    .goto 27,29.750,78.485
    #title |cFFFCDC00Pickup Chest|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的箱子|r
    .complete 3361,2 --Felix's Chest (1)
step
    .goto 27,29.593,78.754
    #title |cFFFCDC00Hurry inside the Hut|r
    >>|cRXP_WARN_请在箭头标记处等待角色扮演|r.
    .complete 24489,2 --Soothsayer Rikkari Scouted (1)
    .target Soothsayer Rikkari
step
    #completewith next
    #label Felix's Bucket of Bolts
    #title |cFFFCDC00Pickup Bolts|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的螺栓桶|r
    .complete 3361,3 --Felix's Bucket of Bolts (1
step
    #completewith Felix's Bucket of Bolts
    .goto 27,33.323,77.988,11 >>靠近箭矢位置13码以内会触发一个事件. |cRXP_WARN_一旦开始, |r|cFFFF0000请迅速拾取箭矢, 然后进入室内|r
    *|cRXP_WARN_Avoid combat during this time|r.
    .timer 13,Trolling for Information RP
    .isOnQuest 24489
step
    #requires Felix's Bucket of Bolts
    .goto 27,33.325,77.755
    #title |cFFFCDC00Pickup Bolts|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_菲利克斯的螺栓桶|r
    .complete 3361,3 --Felix's Bucket of Bolts (1)
step
    #label Soothsayer Shi'kala Scouted
    .goto 27,33.323,77.988
    #title |cFFFCDC00Hurry to |cFF00FF25Soothsayer Shi'kala|r |r
    >>|cRXP_WARN_请在箭头标记处等待角色扮演|r.
    .complete 24489,1 --Soothsayer Shi'kala Scouted (1)
    .target Soothsayer Shi'kala
step
    #completewith next
    #label isQuestComplete Troll Menace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利克斯|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 3361 >>交任务: |cRXP_FRIENDLY_逃难者的困境|r
	.target +Felix Whindlebolt
    .turnin 24489 >>交任务: |cRXP_FRIENDLY_打探消息|r
	.target +Apprentice Soren
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
	.accept 218 >>接任务: |cRXP_WARN_被窃取的日记|r
    .disablecheckbox
	.target +Grelin Whitebeard
    .isQuestComplete 182
step
    #completewith isQuestComplete Troll Menace
    .goto 427,41.83,63.2,30 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires isQuestComplete Troll Menace
    .goto 427,46.25,76.11,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利克斯|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 3361 >>交任务: |cRXP_FRIENDLY_逃难者的困境|r
    .goto 427,41.83,63.2
	.target +Felix Whindlebolt
    .turnin 24489 >>交任务: |cRXP_FRIENDLY_打探消息|r
    .goto 427,42.85,63.01 --clickradius
    .goto 27,32.165,74.347 --npc location
	.target +Apprentice Soren
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
	.accept 218 >>接任务: |cRXP_WARN_被窃取的日记|r
    .goto 427,42.85,63.01 --clickradius
    .goto 27,32.064,74.170 --npc location
	.target +Grelin Whitebeard
    .isQuestComplete 182
step
    #completewith next
    #label isQuestNotComplete Troll Menace
    .goto 427,46.25,76.11,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利克斯|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 3361 >>交任务: |cRXP_FRIENDLY_逃难者的困境|r
	.target +Felix Whindlebolt
    .turnin 24489 >>交任务: |cRXP_FRIENDLY_打探消息|r
	.target +Apprentice Soren
	.accept 218 >>接任务: |cRXP_WARN_被窃取的日记|r
    .disablecheckbox
	.target +Grelin Whitebeard
    .isQuestNotComplete 182
step
    #completewith isQuestNotComplete Troll Menace
    .goto 427,41.83,63.2,30 >>|cRXP_WARN_如果你无法骑乘, 且能边走边高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires isQuestNotComplete Troll Menace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲利克斯|r和|cRXP_FRIENDLY_学徒索林|r和|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 3361 >>交任务: |cRXP_FRIENDLY_逃难者的困境|r
    .goto 427,41.83,63.2
	.target +Felix Whindlebolt
    .turnin 24489 >>交任务: |cRXP_FRIENDLY_打探消息|r
    .goto 427,42.85,63.01 --clickradius
    .goto 27,32.165,74.347 --npc location
	.target +Apprentice Soren
	.accept 218 >>接任务: |cRXP_WARN_被窃取的日记|r
    .goto 427,42.85,63.01 --clickradius
    .goto 27,32.064,74.170 --npc location
	.target +Grelin Whitebeard
    .isQuestNotComplete 182
step
    #completewith next
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Frostmane Troll Whelp (10)
	.mob Frostmane Troll Whelp
step
    #title |cFFFCDC00Enter Cave|r
    .goto 427,51.36,83.12,20 >>进入寒脊山谷洞穴
    .isOnQuest 218
step
    #hidewindow
    #completewith Grik'nir the Cold
    .goto 428,16.58,48.34,5,0
    .goto 428,27.19,43.8,10,0
    .goto 428,52.39,13.39,10,0
    -- .goto 428,76.94,32.07
    +1
step
    #completewith Grik'nir the Cold
    >>击杀|cRXP_ENEMY_Grik'nir the Cold|r
    .complete 218,1 --Grik'nir the Cold (1)
	.mob Grik'nir the Cold
step
    #completewith Grik'nir the Cold
    >>击杀霜鬃巨魔新兵和游荡的火元素
    .complete 218,3 --Frostmane Novice (3)
    .complete 218,2 --Wayward Fire Elemental (1)
    .mob Frostmane Novice
    .mob Wayward Fire Elemental
step
    #completewith Grik'nir the Cold
    #label Frostmane Blades
    >>击杀|cRXP_ENEMY_霜鬃之刃|r
    .complete 218,4 --Frostmane Blade (6)
    .mob Frostmane Blade
    .mob Wayward Fire Elemental
step
    #label Grik'nir the Cold
    #completewith Ice and Fire
    #hidewindow
    .goto 428,76.94,32.07,30 >>1
step
    #completewith Grik'nir the Cold2
    >>击杀|cRXP_ENEMY_霜鬃之刃|r
    .complete 218,4 --Frostmane Blade (6)
    .mob Frostmane Novice
    .mob Frostmane Blade
    .mob Wayward Fire Elemental
step
    #completewith Grik'nir the Cold2
    >>击杀霜鬃巨魔新兵和游荡的火元素
    .complete 218,3 --Frostmane Novice (3)
    .complete 218,2 --Wayward Fire Elemental (1)
    .mob Frostmane Novice
    .mob Frostmane Blade
    .mob Wayward Fire Elemental
step
    #label Grik'nir the Cold2
    .goto 428,76.94,32.07
    >>击杀|cRXP_ENEMY_Grik'nir the Cold|r
    .complete 218,1 --Grik'nir the Cold (1)
	.mob Grik'nir the Cold
-- step
-- step original
--     #hidewindow
--     #completewith Grik'nir the Cold
--     .goto 428,16.58,48.34,5,0
--     .goto 428,27.19,43.8,10,0
--     .goto 428,52.39,13.39,10,0
--     .goto 428,76.94,32.07
--     +1
-- step
--     #completewith Grik'nir the Cold
--     >>击杀|cRXP_ENEMY_霜鬃之刃|r
--     .complete 218,4 --Frostmane Blade (6)
--     .mob Frostmane Novice
--     .mob Frostmane Blade
--     .mob Wayward Fire Elemental
-- step
--     #completewith Grik'nir the Cold
--     >>击杀霜鬃巨魔新兵和游荡的火元素
--     .complete 218,3 --Frostmane Novice (3)
--     .complete 218,2 --Wayward Fire Elemental (1)
--     .mob Frostmane Novice
--     .mob Frostmane Blade
--     .mob Wayward Fire Elemental
-- step
--     #label Grik'nir the Cold
--     >>击杀|cRXP_ENEMY_Grik'nir the Cold|r
--     .complete 218,1 --Grik'nir the Cold (1)
-- 	.mob Grik'nir the Cold
step
    #loop
    .goto 428,71.44,20.47,10,0
    .goto 428,61.09,15.8,10,0
    .goto 428,59,26.7,10,0
    .goto 428,61.26,38.84,10,0
    .goto 428,76.88,35.41,10,0
    >>击杀霜鬃巨魔新兵和游荡的火元素
    .complete 218,3 --Frostmane Novice (3)
    .complete 218,2 --Wayward Fire Elemental (1)
    .mob Frostmane Novice
    .mob Frostmane Blade
    .mob Wayward Fire Elemental
step
    #completewith next
    #label Coldridge Valley cave
    #loop
    .goto 428,51.6,12.38,10,0
    .goto 428,45.23,23.61,10,0
    .goto 428,48.29,53.03,20,0
    .goto 428,29.88,48.61,10,0
    .goto 428,13.99,48.37,10,0
    .goto 428,28.01,49.02,10,0
    .goto 428,44.44,87.89,10,0
    .goto 428,32.16,47.08,10,0
    .goto 428,36.95,30.39,10,0
    .goto 428,53.46,12.93,10,0
    .goto 428,57.71,23.72,10,0
    .goto 428,66.13,40.71,10,0
    .goto 428,75.95,24.71,10,0
    .goto 27,33.772,78.335,15 >>离开寒脊山谷洞穴
step
    #completewith Coldridge Valley cave
    >>击杀|cRXP_ENEMY_霜鬃之刃|r
    .complete 218,4 --Frostmane Blade (6)
    .mob Frostmane Novice
    .mob Frostmane Blade
    .mob Wayward Fire Elemental
step
    #requires Coldridge Valley cave
    #completewith next
    #label Ice and Fire
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 24490 >>接任务: |cRXP_WARN_铁炉堡之旅|r
    .disablecheckbox
	.target Grelin Whitebeard
step
    #requires Coldridge Valley cave
    #completewith Ice and Fire
    .goto 27,33.772,78.335,15 >>离开寒脊山谷洞穴
step
    #requires Ice and Fire
    #loop
    .goto 427,49.29,79.74,15,0
    .goto 427,52.55,76.61,15,0
    .goto 427,47.62,75.19,15,0
    .goto 427,45.09,80.44,15,0
    .goto 427,34.2,85.12,15,0
    .goto 427,30.71,84.38,15,0
    .goto 427,29.51,78.15,15,0
    .goto 427,25.2,72.01,15,0
    .goto 427,21.34,65.5,15,0
    .goto 427,21.73,61,15,0
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Frostmane Troll Whelp (10)
	.mob Frostmane Troll Whelp
step
    .goto 27,32.064,74.170
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 182 >>交任务: |cRXP_FRIENDLY_巨魔洞穴|r
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 24490 >>接任务: |cRXP_WARN_铁炉堡之旅|r
	.target Grelin Whitebeard
    .isQuestComplete 182
step
    #completewith next
    #label Ice and Fire2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 24490 >>接任务: |cRXP_WARN_铁炉堡之旅|r
    .isQuestNotComplete 182
	.target Grelin Whitebeard
step
    #completewith Ice and Fire2
    .goto 27,32.064,74.170,30 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .isNotOnQuest 182
step
    #requires Ice and Fire2
    .goto 427,42.93,62.89
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 218 >>交任务: |cRXP_FRIENDLY_被窃取的日记|r
    .accept 24490 >>接任务: |cRXP_WARN_铁炉堡之旅|r
    .isQuestNotComplete 182
	.target Grelin Whitebeard
step
    #completewith next
    #label Trip to Ironforge
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .turnin 24490 >>交任务: |cRXP_FRIENDLY_铁炉堡之旅|r
    .accept 24491 >>接任务: |cRXP_WARN_跟上那架直升机！|r
	.target Hands Springsprocket
step
    #completewith Trip to Ironforge
    .goto 427,86.95,44.49,90 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Trip to Ironforge
    .goto 427,86.95,44.49 --clickradius
    .goto 27,40.883,70.673 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .turnin 24490 >>交任务: |cRXP_FRIENDLY_铁炉堡之旅|r
    .accept 24491 >>接任务: |cRXP_WARN_跟上那架直升机！|r
	.target Hands Springsprocket
step
    .goto 427,70.39,43.94 --clickradius
    .goto 27,37.404,70.581 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米罗·齿针|r交谈
    .turnin 24491 >>交任务: |cRXP_FRIENDLY_跟上那架直升机！|r
    .accept 24492 >>接任务: |cRXP_WARN_收拾行囊|r
	.target Milo Geartwinge
step
    #completewith next
    #label Goods
    .goto 427,67.76,40.58,10,0
    .goto 427,64.9,35.49,10,0
    .goto 427,62.63,30.48,10,0
    .goto 427,61.78,26.49,5,0
    .goto 427,62.65,25.02,5,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cloak|r和|cRXP_PICK_啤酒桶|r和|cRXP_PICK_Boar Meat|r
    .complete 24492,1 --Coldridge Beer Flagon (1)
    .complete 24492,3 --Leftover Boar Meat (1)
    .complete 24492,2 --Ragged Wolf-Hide Cloak (1)
step
    #completewith Goods
    .goto 427,62.3,23.74,15 >>进入安威玛尔
step
    #requires Goods
    .goto 427,62.3,23.74
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Cloak|r和|cRXP_PICK_啤酒桶|r和|cRXP_PICK_Boar Meat|r
    .complete 24492,1 --Coldridge Beer Flagon (1)
    .complete 24492,3 --Leftover Boar Meat (1)
    .complete 24492,2 --Ragged Wolf-Hide Cloak (1)
step
    .goto 427,61.71,22.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔娜·铁枷|r交谈
    .accept 24493 >>接任务: |cRXP_WARN_别忘记我们|r
	.target Jona Ironstock
step
    #completewith next
    #label Pack Your Bags
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米罗·齿针|r交谈
    .turnin 24492 >>交任务: |cRXP_FRIENDLY_收拾行囊|r
	.target Milo Geartwinge
step
    #completewith Pack Your Bags
    .goto 427,61.71,28.4,5 >>离开安威玛尔
step
    #requires Pack Your Bags
    #completewith next
    #label Pack Your Bags2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米罗·齿针|r交谈
    .turnin 24492 >>交任务: |cRXP_FRIENDLY_收拾行囊|r
	.target Milo Geartwinge
step
    #hidewindow
    #completewith Pack Your Bags2
    .goto 427,62.37,32.21,5 >>1
step
    #requires Pack Your Bags2
    .goto 427,69.43,43.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米罗·齿针|r交谈
    .turnin 24492 >>交任务: |cRXP_FRIENDLY_收拾行囊|r
    .timer 20, Countdown for Logout
	.target Milo Geartwinge
step
    .logout >>时间到期后|cRXP_WARN_relog|r
-- step
--     >>|cRXP_WARN_当26秒计时器到期(接受骑乘后26秒), 请在|r|cRXP_FRIENDLY_Milo的飞艇|r上注销并重新登录, 以跳过卡拉诺斯|r
--     >>|cRXP_WARN_如果你在计时器结束前完成此操作, 可能会登出并直接传送至新工匠镇或返回冷溪谷. 如果发生这种情况, 请正常前往卡拉诺斯|r
--     .subzone 131 >>前往卡拉诺斯
--     .isOnQuest 24493
-- .timer 26,Start to Logout when timer ends --Kharanos, Between 10-26s after turnin (needs to be tested more)
--   .timer 10,Start to Logout when timer ends --New Tinkertown
--   .timer 83.5,Pack Your Bags RP
]])

--Gnome New Tinkertown
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ab) 新工匠镇
#displayname  新工匠镇 |cRXP_ENEMY_(备选)|r
#defaultfor Gnome !DK
#next AC) 矮人 & 侏儒 - 丹莫罗

<< Alliance

step
    .goto 30,34.101,32.243
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内温·扭钳|r交谈
    .accept 27670 >>接任务: |cRXP_WARN_被压制|r
step
    #completewith next
    #label Crazed Leper Gnome 
    >>杀死 |cRXP_ENEMY_癫狂的麻疯侏儒|r
    .complete 27670,1 --Crazed Leper Gnome (6)
	.mob Crazed Leper Gnome
step
    #completewith Crazed Leper Gnome 
    .goto 30,42.21,32.17,10 >>|cRXP_WARN_通常情况下, 最好的做法是击杀位于4个NPC附近的侏儒, 然后等待它们刷新|r
    .target S.A.F.E. Operative
step
    #requires Crazed Leper Gnome 
    #loop
    .goto 30,43.59,33.64,10,0
    .goto 30,40.53,31.95,20,0
    .goto 30,47.79,41.62,25,0
    .goto 30,48.07,25.62,25,0
    >>杀死附近的|cRXP_ENEMY_癫狂的麻疯侏儒|r(若重生较慢, 请注意|cRXP_WARN_if respawns are slow|r)
    *|cRXP_WARN_Ignore the gnome stuck on the stairs|r.
    .complete 27670,1 --Crazed Leper Gnome (6)
	.mob Crazed Leper Gnome
step
    .goto 30,35.04,32.17 --clickradius
    .goto 30,34.101,32.243 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_内温·扭钳|r
    .turnin 27670 >>交任务: |cRXP_FRIENDLY_被压制|r
    .accept 28167 >>接任务: |cRXP_WARN_向卡沃·爆弹报告|r
	.target Nevin Twistwrench
step
    .goto 30,50.14,31.93 --clickradius
    .goto 30,50.973,31.915 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡沃·爆弹|r交谈
    .turnin 28167 >>交任务: |cRXP_FRIENDLY_向卡沃·爆弹报告|r
    .accept 27671 >>接任务: |cRXP_WARN_照料幸存者|r
	.target Carvo Blastbolt
-- step
--     #completewith next
--     +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
--     *[1] Press the |cRXP_WARN_Escape key|r.
--     *[2] Select |cRXP_WARN_Options|r.
--     *[3] Navigate to |cRXP_WARN_Keybindings|r.
--     *[4] Within |cRXP_WARN_Keybindings|r,find |cRXP_WARN_RestedXP Guides|r.
--     *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
--     .isOnQuest 27671
step
    #loop
    .goto 30,47.66,30.02,10,0
    .goto 30,53.18,29.42,11,0
    .goto 30,52.63,23.41,10,0
    .goto 30,45.35,28.18,10,0
    .goto 30,44.02,36.28,10,0
    .goto 30,51.61,37.3,11,0
    -- .goto 30,50.07,30.69,3,0
    -- .goto 30,53.18,29.29,7,0
    -- .goto 30,52.15,27.62,7,0
    -- .goto 30,52.67,23.08,8,0
    -- .goto 30,45.86,24.31,10,0
    -- .goto 30,47.63,30.01,5,0
    -- .goto 30,43.91,30.16,8,0
    -- .goto 30,42.59,36.47,8,0
    -- .goto 30,50.99,42.94,15,0
    -- .goto 30,51.61,37.35,10,0
    -- .goto 30,48.14,33.31,10,0
    -- .goto 30,54.92,35.93,10,0
    -- .goto 30,55.11,36.97,5,0
    -- .goto 30,53.89,43.48,7,0
    -- .goto 30,60.25,43.79,10,0
    -- .goto 30,64.41,37.61,10,0
    -- .goto 30,64.01,32.74,8,0
    -- .goto 30,62.91,28.42,10,0
    -- .goto 30,57.68,30.99,10,0
    -- .goto 30,56.04,23.32,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_幸存者|r
    *|cRXP_WARN_You can do this from a distance|r.
    .complete 27671,1 --Survivors Rescued (6)
	.target Survivor
step
    .goto 30,50.11,32.47 --clickradius
    .goto 30,50.973,31.915 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡沃·爆弹|r交谈
    .turnin 27671 >>交任务: |cRXP_FRIENDLY_照料幸存者|r
    .accept 28169 >>接任务: |cRXP_WARN_撤到装载室！|r
	.target Carvo Blastbolt
step
    #completewith next
    #label Withdraw to the Loading Room!
    .goto 30,52.21,38.3,10,0
    .goto 30,53.47,75.07,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格菲尔·卷簧|r谈话
    .turnin 28169 >>交任务: |cRXP_FRIENDLY_撤到装载室！|r
    .accept 27635 >>接任务: |cRXP_WARN_净化处理|r
	.target Gaffer Coilspring
step
    #completewith Withdraw to the Loading Room!
    #title |cFFFCDC00跟随箭头指引|r
    .goto 30,53.063,82.341,30 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Withdraw to the Loading Room!
    .goto 30,53.83,81.53 --clickradius
    .goto 30,53.063,82.341 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格菲尔·卷簧|r谈话
    .turnin 28169 >>交任务: |cRXP_FRIENDLY_撤到装载室！|r
    .accept 27635 >>接任务: |cRXP_WARN_净化处理|r
	.target Gaffer Coilspring
step
    .goto 30,58.88,82.06 --optimized for click radius
    .goto 30,58.93,81.73 --optimized for npclocation
    -- >>|cRXP_WARN_输入 /坐在|r|cRXP_FRIENDLY_净化者500型|r前面, 然后输入它跳过剧情对话|r
    #title |cFFFCDC00Click when in range and stationary|r
    >>点击|cRXP_PICK_净化者500型|r|cRXP_WARN_请勿使用互动按钮|r
    -- |cRXP_WARN_but only when you are certain you are within range to enter it. Ensure you are stationary before clicking, and click only once(don't use the interact button)|r.
    .complete 27635,1 --Decontamination Process started (1)
    .target Sanitron 500
    .emote SIT,46185
--   .timer 26,Decontamination RP
step
    .goto 30,66.17,82.93 --clickradius
    .goto 30,66.420,81.624 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_技师布朗格|r交谈
    .turnin 27635 >>交任务: |cRXP_FRIENDLY_净化处理|r
    .accept 27674 >>接任务: |cRXP_WARN_到地面去|r
	.target Technician Braggle
step
    .goto 30,67.282,84.148
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托尔本·光爆|r谈话
    .complete 27674,1 --Speak to Torben Zapblast (1)
    .target Torben Zapblast
	.skipgossipid 37763
step
    .goto 469,39.51,38.15 --clickradius
    .goto 469,39.504,38.383 --npclocation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内温·扭钳|r交谈
    .turnin 27674 >>交任务: |cRXP_FRIENDLY_到地面去|r
    .accept 26206 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Rogue
    .accept 26197 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Mage
    .accept 26199 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Priest
    .accept 26202 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Warlock
    .accept 26203 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Warrior
    .accept 31135 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Monk
    .accept 41217 >>接任务: |cRXP_WARN_诺莫瑞根的未来|r << Gnome Hunter
	.target Nevin Twistwrench
step << Gnome Rogue
    #completewith next
    #label The Future of Gnomeregan
    .goto 469,39.51,37.35,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔希·钢烁|r交谈
    .turnin 26206 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26423 >>接任务: |cRXP_WARN_晋见大工匠|r
    .disablecheckbox
	.target Kelsey Steelspark
step << Gnome Rogue
    #hidewindow
    #completewith The Future of Gnomeregan
    .goto 469,38.025,33.570,20 >>1
step << Gnome Rogue
    #requires The Future of Gnomeregan
    .goto 469,38.18,33.94 --clickradius
    .goto 469,38.025,33.570 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔希·钢烁|r交谈
    .turnin 26206 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26423 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Kelsey Steelspark
step << Gnome Mage
    .goto 469,41.03,29.46 --clickradius
    .goto 469,41.093,29.130 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝西·冰雹|r交谈
    .turnin 26197 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26421 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Bipsi Frostflinger
step << Gnome Priest
    .goto 469,39.46,28.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“怪医”克斯宾|r交谈
    .turnin 26199 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26422 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target "Doc" Cogspin
step << Gnome Warlock
    #completewith next
    #label The Future of Gnomeregan
    .goto 469,39.51,37.21,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .turnin 26202 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26424 >>接任务: |cRXP_WARN_晋见大工匠|r
    .disablecheckbox
	.target Alamar Grimm
step << Gnome Warlock
    #hidewindow
    #completewith The Future of Gnomeregan
    .goto 469,37.88,37.86,20 >>1
step << Gnome Warlock
    #requires The Future of Gnomeregan
    .goto 469,37.88,37.86 --clickradius
    .goto 469,37.679,37.957--npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿拉玛尔·格里姆|r交谈
    .turnin 26202 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26424 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Alamar Grimm
step << Gnome Warrior
    #completewith next
    #label in The Future of Gnomeregan
    .goto 469,39.71,37.3,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒸汽齿轮军士德拉尔|r交谈
    .turnin 26203 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26425 >>接任务: |cRXP_WARN_晋见大工匠|r
    .disablecheckbox
	.target Drill Seargent Steamcrank
step << Gnome Warrior
    #hidewindow
    #completewith in The Future of Gnomeregan
    .goto 469,40.68,35.59,20 >>1
step << Gnome Warrior
    #requires in The Future of Gnomeregan
    .goto 469,40.68,35.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒸汽齿轮军士德拉尔|r交谈
    .turnin 26203 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 26425 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Drill Seargent Steamcrank
step << Gnome Monk
    .goto 469,40.086,35.614
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侏儒之友西希|r交谈
    .turnin 31135 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 31137 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Xi, Friend to the Small
step << Gnome Hunter
    #completewith next
    #label The Future of Gnomeregan
    .goto 469,39.66,37.34,5,0
    .goto 469,41.1,31.17,10,0
    .goto 469,42.1,30.91,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Muffinus Chromebrew|r交谈
    .turnin 41217 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 41218 >>接任务: |cRXP_WARN_晋见大工匠|r
    .disablecheckbox
	.target Muffinus Chromebrew
step << Gnome Hunter
    #completewith The Future of Gnomeregan
    #hidewindow
    .goto 469,41.925,31.636,10 >>1
step << Gnome Hunter
    #requires The Future of Gnomeregan
    .goto 469,41.925,31.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Muffinus Chromebrew|r交谈
    .turnin 41217 >>交任务: |cRXP_FRIENDLY_诺莫瑞根的未来|r
    .accept 41218 >>接任务: |cRXP_WARN_晋见大工匠|r
	.target Muffinus Chromebrew
step
    .goto 469,38.95,32.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|r交谈
    .turnin 26423 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Rogue
    .turnin 26421 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Mage
    .turnin 26422 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Priest
    .turnin 26424 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Warlock
    .turnin 26425 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Warrior
    .turnin 31137 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Monk
    .turnin 41218 >>交任务: |cRXP_FRIENDLY_晋见大工匠|r << Hunter/Druid
    .accept 26208 >>接任务: |cRXP_WARN_战斗继续|r
	.timer 4.5,Meet the High Tinker RP
	.target High Tinker Mekkatorque
step
    .goto 469,38.95,32.3
    >>|cRXP_WARN_请等待旁边的RP|r|cRXP_FRIENDLY_大工匠梅卡托克|r
    .complete 26208,1 --Learn about 诺莫瑞根行动 (1)
step
    .goto 469,38.95,32.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|r交谈
    .turnin 26208 >>交任务: |cRXP_FRIENDLY_战斗继续|r
    .accept 26566 >>接任务: |cRXP_WARN_侏儒才智的胜利|r
	.target High Tinker Mekkatorque
step
    .goto 469,40.578,28.021
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师格林德斯巴克|r交谈
    .turnin 26566 >>交任务: |cRXP_FRIENDLY_侏儒才智的胜利|r
    .accept 26222 >>接任务: |cRXP_WARN_寻找零件|r
	.target Engineer Grindspark
step
    #loop
    -- .goto 469,40.5,27.63,6,0
    -- .goto 469,39.6,29.35,8,0
    -- -- .goto 469,39.17,29.2,6,0
    -- .goto 469,38.62,29.48,10,0
    -- .goto 469,39.92,30.49,6,0
    -- .goto 469,41.57,29.22,6,0
    -- .goto 469,41.06,28.93,3,0
    -- .goto 469,41.14,27.98,6,0
    -- .goto 469,40.87,28.82,3,0
    -- .goto 469,38.88,27.1,6,0
    -- .goto 469,39.88,29.12,15,0
    -- .goto 469,38.5,28.45,10,0
    -- .goto 469,39.26,28.98,8,0
    -- .goto 469,39.28,29.16,3,0
    -- .goto 469,39.28,29.16,12,0
    -- .goto 469,37.97,32.97,10,0
    -- .goto 469,39.69,32.66,10,0
    -- .goto 469,41.18,31.75,10,0
    -- .goto 469,40.73,34.67,10,0
    -- .goto 469,41.51,35.43,10,0
    -- .goto 469,41.65,33.57,10,0
    .goto 469,40.5,27.63,6,0
    .goto 469,39.6,29.35,10,0
    .goto 469,38.62,29.48,10,0
    .goto 469,39.92,30.49,10,0
    .goto 469,41.57,29.22,6,0
    .goto 469,41.06,28.93,3,0
    .goto 469,41.14,27.98,6,0
    .goto 469,40.87,28.82,3,0
    .goto 469,38.88,27.1,15,0
    .goto 469,39.88,29.12,10,0
    .goto 469,38.5,28.45,10,0
    .goto 469,39.26,28.98,8,0
    .goto 469,39.28,29.16,3,0
    .goto 469,39.28,29.16,10,0
    .goto 469,37.97,32.97,10,0
    .goto 469,39.69,32.66,10,0
    .goto 469,42.16,30.91,10,0
    .goto 469,42.31,28.85,10,0
    .goto 469,40.14,30.26,10,0
    .goto 469,41.3,33.51,10,0
    .goto 469,41.21,36.74,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t单击|cRXP_PICK_备用零件|r
    .complete 26222,1 --Spare Part (7)
step
    .goto 469,40.578,28.021
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师格林德斯巴克|r交谈
    .turnin 26222 >>交任务: |cRXP_FRIENDLY_寻找零件|r
    .accept 26205 >>接任务: |cRXP_WARN_多功能机器人的工作|r
	.target Engineer Grindspark
step
    .goto 469,39.45,26.87 --clickradius
    .goto 469,39.225,26.552 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_托克·滑链|r.
    .accept 26264 >>接任务: |cRXP_WARN_身后物|r
	.target Tock Sprysprocket
step
    #completewith next
    #label Dealing with the Fallout
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹维斯下士|r交谈
    .goto 469,39.4,29.14,10,0
    .goto 469,38.72,38.66,10,0
    .accept 26265 >>接任务: |cRXP_WARN_处理辐射|r
	.target Corporal Fizzwhistle
step 
    #completewith Dealing with the Fallout
    #hidewindow
    .goto 469,38.43,40.48,20 >>1
step
    #requires Dealing with the Fallout
    .goto 469,38.43,40.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹维斯下士|r交谈
    .accept 26265 >>接任务: |cRXP_WARN_处理辐射|r
	.target Corporal Fizzwhistle
step
    #hidewindow
    #completewith Living Contaminations
    #loop
    .goto 469,40.05,42.01,15,0
    .goto 469,42.66,45.39,15,0
    .goto 469,39.18,46.56,10,0
    .goto 469,38.58,44.96,10,0
    .goto 469,37.78,47.01,10,0
    .goto 469,37.09,50.61,10,0
    .goto 469,41.05,52.15,15,0
    .goto 469,41.41,50.23,15,0
    .goto 469,41.98,52.25,15,0
    .goto 469,42.18,51.57,15,0
    .goto 469,41.29,50.26,15,0
    .goto 469,38.44,56.98,15,0
    .goto 469,37.54,56.79,15,0
    .goto 469,42.47,61.83,15,0
    .goto 469,42.47,63.32,15,0
    +1
step
    #completewith Living Contaminations
    +|cRXP_WARN_[稀有]|r如果吉波维特在场, 请击杀他, |cRXP_ENEMY_吉波维特|r, |cRXP_WARN_因为他能提供大量经验值|r
    .unitscan Gibblewilt
step
    #completewith GS-9x Multi-Bot
    >>杀死|cRXP_ENEMY_活体污染物|r
    .complete 26265,1 --Living Contamination (6)
    .mob Living Contamination
step
    #completewith GS-9x Multi-Bot
    >>击杀|cRXP_ENEMY_毒性淤泥|r 
    *Loot them for their |T133151:0|t[|cRXP_LOOT_Recovered Possessions|r].
    .complete 26264,1 --Recovered Possession (6)
    .mob Toxic Sludge
step
    #label GS-9x Multi-Bot
    >>引导|cRXP_FRIENDLY_GS-9x 多功能机器人|r进入间歇泉, |cFFFF0000请勿自己撞上去|r
    *|cRXP_WARN_如果你的 |cRXP_FRIENDLY_GS-9x 多功能机器人|r死亡了, 请返回 |cRXP_FRIENDLY_工程师格林德斯巴克|r处领取一个新的|r
    .complete 26205,1 --Clean up Toxic Geysers (5)
    .target GS-9x Multi-Bot
    .skipgossip 42553,1
step
    #completewith next
    >>杀死|cRXP_ENEMY_活体污染物|r
    .complete 26265,1 --Living Contamination (6)
    .mob Living Contamination
step
    >>击杀|cRXP_ENEMY_毒性淤泥|r
    Loot them for their |T133151:0|t[|cRXP_LOOT_Recovered Possessions|r].
    .complete 26264,1 --Recovered Possession (6)
    .mob Toxic Sludge
step
    #label Living Contaminations
    >>杀死|cRXP_ENEMY_活体污染物|r
    .complete 26265,1 --Living Contamination (6)
    .mob Living Contamination
-- step
--     #sticky
--     #label Contamination
--     #loop
--     .goto 469,40.992,40.259,0
--     .goto 469,37.170,40.971,0
--     .goto 469,39.912,49.912,0
--     .waypoint 469,40.992,40.259,40,0
--     .waypoint 469,40.559,39.847,40,0
--     .waypoint 469,39.968,40.426,40,0
--     .waypoint 469,39.065,40.724,40,0
--     .waypoint 469,38.592,40.539,40,0
--     .waypoint 469,37.980,41.331,40,0
--     .waypoint 469,37.170,40.971,40,0
--     .waypoint 469,36.360,40.843,40,0
--     .waypoint 469,34.620,43.365,40,0
--     .waypoint 469,36.336,44.818,40,0
--     .waypoint 469,39.912,49.912,40,0
--     >>杀死|cRXP_ENEMY_活体污染物|r
--     .complete 26265,1 --Living Contamination (6)
--     .mob Living Contamination
-- step
--     #completewith Geysers
--     .goto 469,38.054,47.396,0
--     .goto 469,39.129,53.303,0
--     .goto 469,41.419,42.524,0
--     >>击杀|cRXP_ENEMY_毒性淤泥|r. 从他们身上搜刮出 [|cRXP_LOOT_收回的个人财物|r]
--     .complete 26264,1 --Recovered Possession (6)
--     .mob *Toxic Sludge
-- step
--     #optional
--     #completewith next
--     .goto 469,40.603,45.713,45 >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_吉波维特|r. 如果他在, 就杀掉他|r
--     .unitscan Gibblewilt
--     .noflyable
-- step
--     #label Geysers
--     #loop
--     .goto 469,40.578,28.021,0 --Grindspark
--     .goto 469,40.029,42.015,0
--     .goto 469,39.349,46.363,0
--     .goto 469,41.328,50.585,0
--     .goto 469,40.029,42.015,15,0
--     .goto 469,41.629,44.514,15,0
--     .goto 469,42.430,45.128,15,0
--     .goto 469,39.349,46.363,15,0
--     .goto 469,38.657,45.115,15,0
--     .goto 469,37.860,46.624,15,0
--     .goto 469,36.858,50.094,15,0
--     .goto 469,37.386,50.996,15,0
--     .goto 469,40.808,52.328,15,0
--     .goto 469,41.910,51.865,15,0
--     .goto 469,41.328,50.585,15,0
--     >>引导你的|cRXP_FRIENDLY_GS-9x Multi-bot|r前往绿色水池中的喷泉
--     >>|cRXP_WARN_如果你的 |cRXP_FRIENDLY_GS-9x 多功能机器人|r死亡了, 请返回 |cRXP_FRIENDLY_工程师格林德斯巴克|r处领取一个新的|r
--     .complete 26205,1 --Clean up Toxic Geysers (5)
--     .skipgossip 42553,1
-- step
--     #optional
--     #loop
--     .goto 469,38.054,47.396,0
--     .goto 469,39.129,53.303,0
--     .goto 469,41.419,42.524,0
--     .goto 469,38.054,47.396,40,0
--     .goto 469,35.840,46.516,40,0
--     .goto 469,34.007,48.244,40,0
--     .goto 469,34.752,49.411,40,0
--     .goto 469,35.620,52.363,40,0
--     .goto 469,36.659,52.593,40,0
--     .goto 469,39.129,53.303,40,0
--     .goto 469,40.837,53.655,40,0
--     .goto 469,42.523,50.016,40,0
--     .goto 469,40.920,48.049,40,0
--     .goto 469,40.209,47.931,40,0
--     .goto 469,41.419,42.524,40,0
--     >>击杀|cRXP_ENEMY_毒性淤泥|r. 从他们身上搜刮出 [|cRXP_LOOT_收回的个人财物|r]
--     .complete 26264,1 --Recovered Possession (6)
--     .mob Toxic Sludge
step
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_处理辐射|r
    .goto 469,38.201,40.196
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹维斯下士|r交谈
    .turnin 26265 >>交任务: |cRXP_FRIENDLY_处理辐射|r
	.target Corporal Fizzwhistle
step
    #completewith 交任务: |cRXP_FRIENDLY_处理辐射|r
    #title |cFFFCDC00跟随箭头指引|r
    .goto 469,38.38,39.94,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires 交任务: |cRXP_FRIENDLY_处理辐射|r
    .goto 469,38.38,39.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹维斯下士|r交谈
    .turnin 26265 >>交任务: |cRXP_FRIENDLY_处理辐射|r
	.target Corporal Fizzwhistle
step
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
    .goto 469,39.04,38.13,10,0
    .goto 469,40.58,28.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师格林德斯巴克|r交谈
    .turnin 26205 >>交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
	.target Engineer Grindspark
step 
    #completewith 交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
    #hidewindow
    .goto 469,40.4,28.22,40 >>1
step
    #requires 交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
    .goto 469,40.4,28.22  --clickradius
    .goto 469,40.58,28.04 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工程师格林德斯巴克|r交谈
    .turnin 26205 >>交任务: |cRXP_FRIENDLY_多功能机器人的工作|r
	.target Engineer Grindspark
step
    .goto 469,39.37,26.92 --clickradius
    .goto 469,39.225,26.552 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_托克·滑链|r.
    .turnin 26264 >>交任务: |cRXP_FRIENDLY_身后物|r
	.target Tock Sprysprocket
step
    #completewith next
    #label What's Keeping Kharmarn?
    .goto 469,39.36,29.15,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .accept 26316 >>接任务: |cRXP_WARN_杰萨普怎么了？|r
	.target Captain Tread Sparknozzle
step
    #completewith What's Keeping Kharmarn?
    #hidewindow
    .goto 469,38.27,33.88,30 >>1
step
    #requires What's Keeping Kharmarn?
    .goto 469,38.27,33.88

    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_崔德·火钻队长|r交谈
    .accept 26316 >>接任务: |cRXP_WARN_杰萨普怎么了？|r
	.target Captain Tread Sparknozzle
step
    #completewith next
    #label Missing in Action
    .goto 469,37.29,38.97,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
    .turnin 26316 >>交任务: |cRXP_FRIENDLY_杰萨普怎么了？|r
    .accept 26284 >>接任务: |cRXP_WARN_失踪的士兵|r
    .accept 26285 >>接任务: |cRXP_WARN_把我的炸药还回来！|r
	.target Kharmarn Palegrip
step
    #completewith Missing in Action
    #title |cFFFCDC00跟随箭头指引|r
    .goto 469,37.11,65.54,40 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Missing in Action
    .goto 469,37.11,65.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
    .turnin 26316 >>交任务: |cRXP_FRIENDLY_杰萨普怎么了？|r
    .accept 26284 >>接任务: |cRXP_WARN_失踪的士兵|r
    .accept 26285 >>接任务: |cRXP_WARN_把我的炸药还回来！|r
	.target Kharmarn Palegrip
step
    #hidewindow
    #completewith Stolen Powder Keg
    #loop
    .goto 469,36.59,68.65,15,0
    .goto 469,38.24,68.88,15,0
    .goto 469,37.99,72.61,15,0
    .goto 469,38.86,74.37,15,0
    .goto 469,40.85,74.37,15,0
    .goto 469,41.09,69.67,15,0
    .goto 469,42,73.55,15,0
    .goto 469,44.01,70.25,15,0
    .goto 469,45.91,69.29,15,0
    .goto 469,47.08,71.13,15,0
    .goto 469,47.23,73.6,15,0
    .goto 469,44.96,73.37,15,0
    +1
step
    #completewith Stolen Powder Keg
    +|cRXP_WARN_[稀有]|r如果他还在, 就击杀|cRXP_ENEMY_洞窟强夺者|r, |cRXP_WARN_因为他会提供大量经验值|r
	.unitscan Caverndeep Looter
step
    #completewith next
    >>击杀|cRXP_ENEMY_石腭拾骨者|r和|cRXP_ENEMY_石腭袭击者|r 
    *Loot them for the |T132622:0|t[|cRXP_LOOT_Stolen Powder Kegs|r].
    .complete 26285,1 --Stolen Powder Keg (7)
	.mob Rockjaw Bonepicker
	.mob Rockjaw Marauder
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Makeshift Cages|r
    .complete 26284,1 --Captured Demolitionists rescued (6)
step
    #label Stolen Powder Keg
    >>击杀|cRXP_ENEMY_石腭拾骨者|r和|cRXP_ENEMY_石腭袭击者|r 
    *Loot them for the |T132622:0|t[|cRXP_LOOT_Stolen Powder Kegs|r].
    .complete 26285,1 --Stolen Powder Keg (7)
	.mob Rockjaw Bonepicker
	.mob Rockjaw Marauder
step
    .goto 469,37.15,65.57 --clickradius
    .goto 469,37.283,65.200 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
    .turnin 26284 >>交任务: |cRXP_FRIENDLY_失踪的士兵|r
    .turnin 26285 >>交任务: |cRXP_FRIENDLY_把我的炸药还回来！|r
    .accept 26318 >>接任务: |cRXP_WARN_致命一击|r
	.target Kharmarn Palegrip
-- step
--     #sticky
--     #label PowderKegs
--     .goto 469,38.413,67.778,0
--     .goto 469,46.960,73.690,0
--     .goto 469,42.336,69.559,0
--     .waypoint 469,38.413,67.778,40,0
--     .waypoint 469,36.284,70.305,40,0
--     .waypoint 469,39.268,75.879,40,0
--     .waypoint 469,42.366,75.706,40,0
--     .waypoint 469,44.629,77.577,40,0
--     .waypoint 469,45.326,73.024,40,0
--     .waypoint 469,46.960,73.690,40,0
--     .waypoint 469,47.296,72.654,40,0
--     .waypoint 469,46.734,71.721,40,0
--     .waypoint 469,47.119,68.438,40,0
--     .waypoint 469,47.163,65.769,40,0
--     .waypoint 469,43.581,70.051,40,0
--     .waypoint 469,42.336,69.559,40,0
--     >>击杀|r石腭拾骨者|r和|r石腭袭击者|r. 从他们身上搜刮出[|被偷走的火药桶|]
--     .complete 26285,1 --Stolen Powder Keg (7)
-- 	.mob Rockjaw Bonepicker
-- 	.mob Rockjaw Marauder
-- step
--     #loop
--     .goto 469,36.560,68.469,0
--     .goto 469,38.768,74.257,0
--     .goto 469,45.803,69.339,0
--     .goto 469,36.560,68.469,15,0
--     .goto 469,38.134,68.845,15,0
--     .goto 469,37.972,72.466,15,0
--     .goto 469,38.768,74.257,15,0
--     .goto 469,40.738,74.411,15,0
--     .goto 469,41.168,69.792,15,0
--     .goto 469,42.045,73.682,15,0
--     .goto 469,45.032,73.353,15,0
--     .goto 469,47.131,73.469,15,0
--     .goto 469,47.007,71.031,15,0
--     .goto 469,45.803,69.339,15,0
--     .goto 469,43.887,70.268,15,0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Makeshift Cages|r以解救被俘的爆破师|cRXP_FRIENDLY_Captured Demolitionists|r
--     .complete 26284,1 --Captured Demolitionists rescued (6)
-- step
--     #requires PowderKegs
--     .goto 469,37.283,65.200
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
--     .turnin 26284 >>交任务: |cRXP_FRIENDLY_失踪的士兵|r
--     .turnin 26285 >>交任务: |cRXP_FRIENDLY_把我的炸药还回来！|r
--     .accept 26318 >>接任务: |cRXP_WARN_致命一击|r
-- 	.target Kharmarn Palegrip
step
    #completewith next
    #label Boss Bruggor
    >>击杀穴居人头目布鲁戈
    .complete 26318,2 --Boss Bruggor (1)
step
    #title |cFFFCDC00Enter Cave|r
    #completewith Boss Bruggor
    .goto 469,33.8,66.29,15 >>进入霜鬃巨魔要塞洞穴
step
    #requires Boss Bruggor
    #completewith next
    #label Detonate trogg tunnel
    .goto 470,87.21,51.37,10,0
    .goto 470,79.61,39.36,10,0
    .goto 470,67.4,48.66,10,0
    .goto 470,59.67,74.59,10,0
    .goto 470,44.6,75.2,10,0
    .goto 470,34.74,63.44,10,0
    .goto 470,27.47,52.08,10,0
    .goto 470,36.17,40.83
    >>击杀穴居人头目布鲁戈
    *|cRXP_WARN_You won't aggro the sleeping|r |cRXP_ENEMY_Rockjaw Fungus-Flingers|r |cRXP_WARN_unless you attack them|r.
    .complete 26318,2 --Boss Bruggor (1)
	.mob Boss Bruggor
step
    #requires Boss Bruggor
    #completewith Detonate trogg tunnel
    #title |cFFFCDC00跟随箭头指引|r
    .goto 470,27.47,52.08,30 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Detonate trogg tunnel
    #completewith next
    .goto 470,27.47,52.08,10,0
    >>击杀穴居人头目布鲁戈
    *|cRXP_WARN_You won't aggro the sleeping|r |cRXP_ENEMY_Rockjaw Fungus-Flingers|r |cRXP_WARN_unless you attack them|r.
    .complete 26318,2 --Boss Bruggor (1)
	.mob Boss Bruggor
step
    #requires Detonate trogg tunnel
    .goto 470,36.17,40.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Detonator|r
    .complete 26318,1 --Detonate trogg tunnel (1)
step
    .goto 470,27.47,52.08
    >>击杀穴居人头目布鲁戈
    *|cRXP_WARN_You won't aggro the sleeping|r |cRXP_ENEMY_Rockjaw Fungus-Flingers|r |cRXP_WARN_unless you attack them|r.
    .complete 26318,2 --Boss Bruggor (1)
	.mob Boss Bruggor
step
    #completewith next
    #label Finishin' the Job
    .goto 470,34.89,63.73,10,0
    .goto 470,46.28,74.88,10,0
    .goto 470,60.56,72.62,10,0
    .goto 470,64.93,53.53,10,0
    .goto 470,76.16,37.36,10,0
    .goto 470,87.69,51.74,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
    .turnin 26318 >>交任务: |cRXP_FRIENDLY_致命一击|r
    .accept 26329 >>接任务: |cRXP_WARN_还有一件事|r
    .disablecheckbox
	.target Kharmarn Palegrip
step
    #completewith Finishin' the Job
    #title |cFFFCDC00Exit Cave|r
    .goto 469,34.42,66.18,30 >>离开霜鬃巨魔要塞洞穴, |cRXP_WARN_如果你在移动时能高效击杀怪物, 建议沿途清除它们|r
    *|cRXP_WARN_你不会激怒正在睡觉的|r|cRXP_ENEMY_石腭真菌投掷者|r, 除非你攻击它们|r
step
    #requires Finishin' the Job
    .goto 469,37.07,64.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
    .turnin 26318 >>交任务: |cRXP_FRIENDLY_致命一击|r
    .accept 26329 >>接任务: |cRXP_WARN_还有一件事|r
	.target Kharmarn Palegrip
-- step
-- 	#completewith next
--     .goto 470,95.285,56.045,15 >>进入霜鬃巨魔要塞洞穴
--     .isOnQuest 26318
-- step
--     #completewith Bruggor
--     .goto 470,87.857,52.221,15,0
--     .goto 470,83.611,44.352,15,0
--     .goto 470,74.752,38.437,15,0
--     .goto 470,64.507,54.540,15,0
--     .goto 470,60.714,72.486,15,0
--     .goto 470,45.246,74.390,15,0
--     .goto 470,31.866,44.578,45 >>前往 |cRXP_ENEMY_穴居人头目布鲁戈|r内部
--     >>|cRXP_WARN_你不会激怒正在睡觉的|r|cRXP_ENEMY_石腭真菌投掷者|r, 除非你攻击它们|r
--     .noflyable --Azeroth Flying
-- step
--     #completewith Bruggor
--     .goto 470,87.857,52.221,15,0
--     .goto 470,83.611,44.352,15,0
--     .goto 470,74.752,38.437,15,0
--     .goto 470,64.507,54.540,15,0
--     .goto 470,60.714,72.486,15,0
--     .goto 470,45.246,74.390,15,0
--     .goto 470,31.866,44.578,45 >>前往 |cRXP_ENEMY_穴居人头目布鲁戈|r内部
--     .flyable --Azeroth Flying
-- step
--     #sticky
--     #label Detonator
--     .goto 470,36.112,40.902,0,0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_Detonator|r
--     .complete 26318,1 --Detonate trogg tunnel (1)
-- step
--     #label Bruggor
--     .goto 470,21.791,58.700,15,0
--     .goto 470,31.866,44.578
--     >>击杀 |cRXP_ENEMY_穴居人头目布鲁戈|rinside
--     .complete 26318,2 --Boss Bruggor (1)
-- 	.mob Boss Bruggor
-- step
--     #requires Detonator
--     #completewith Finishing
--     .goto 470,45.246,74.390,15,0
--     .goto 470,60.714,72.486,15,0
--     .goto 470,64.507,54.540,15,0
--     .goto 470,74.752,38.437,15,0
--     .goto 470,83.611,44.352,15,0
--     .goto 469,33.781,66.184,20 >>离开霜鬃巨魔要塞洞穴
--     >>|cRXP_WARN_你不会激怒正在睡觉的|r|cRXP_ENEMY_石腭真菌投掷者|r, 除非你攻击它们|r
--     .noflyable --Azeroth Flying
--     .subzoneskip 135,1
-- step
--     #optional
--     #requires Detonator
--     #completewith Finishing
--     .goto 470,45.246,74.390,15,0
--     .goto 470,60.714,72.486,15,0
--     .goto 470,64.507,54.540,15,0
--     .goto 470,74.752,38.437,15,0
--     .goto 470,83.611,44.352,15,0
--     .goto 469,33.781,66.184,20 >>离开霜鬃巨魔要塞洞穴
--     .flyable --Azeroth Flying
--     .subzoneskip 135,1
-- step
--     #label Finishing
--     #requires Detonator
--     .goto 469,37.283,65.200
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_Kharmarn Palegrip|r
--     .turnin 26318 >>交任务: |cRXP_FRIENDLY_致命一击|r
--     .accept 26329 >>接任务: |cRXP_WARN_还有一件事|r
-- 	.target Kharmarn Palegrip
-- step not faster on average
--     #completewith next
--     .goto 469,36.284,70.305,-1
--     .goto 469,47.880,44.670,-1
--     *|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
--     .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    #completewith next
    #label in One More Thing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|r和|cRXP_FRIENDLY_辛克尔斯·迅击|r交谈
    .goto 469,37.25,59.43,10,0
    .goto 469,37.26,54.35,10,0
    .goto 469,38.71,40.01,10,0
    .turnin 26329 >>交任务: |cRXP_FRIENDLY_还有一件事|r
    .accept 26331 >>接任务: |cRXP_WARN_碎轮的爪牙|r
    .disablecheckbox
    .accept 26333 >>接任务: |cRXP_WARN_没坦克！|r
    .disablecheckbox
	.target +High Tinker Mekkatorgue
step
    #title |cFFFCDC00跟随箭头指引|r
    #completewith in One More Thing
    .goto 469,38.84,33.15,100 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires in One More Thing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|r和|cRXP_FRIENDLY_辛克尔斯·迅击|r交谈
    .turnin 26329 >>交任务: |cRXP_FRIENDLY_还有一件事|r
    .accept 26331 >>接任务: |cRXP_WARN_碎轮的爪牙|r
    .goto 469,38.84,33.15 --clickradius
    .goto 469,38.802,32.715 --npc location
	.target +High Tinker Mekkatorgue
    .accept 26333 >>接任务: |cRXP_WARN_没坦克！|r
    .goto 469,38.46,33.49 --clickradius
    .goto 469,38.204,33.662 --npc location
	.target +Hinkles Fastblast
-- step
--     >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_狂暴的冬狼|r. 如果他在, 就杀掉他|r
--     .unitscan Timber
step
    #completewith next
    #label Repaired Mechano-Tanks destroyed
    .goto 469,42.31,31.79,10,0
    .goto 469,47.39,27.48,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_修复的步行坦克|r
    *|cRXP_WARN_You can do this from a distance|r.
    .complete 26333,1 --Repaired Mechano-Tanks destroyed (5)
	.mob Repaired Mechano-Tank
    .use 58200
step
    #completewith Repaired Mechano-Tanks destroyed
    .goto 469,49.24,26.54,10 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    #requires Repaired Mechano-Tanks destroyed
    #hidewindow
    #completewith Crushcog's Minions killed
    #loop
    .goto 469,52.77,23.59,10,0
    .goto 469,54.43,21.88,10,0
    .goto 469,55.97,21.22,10,0
    .goto 469,56.07,24.99,20,0
    .goto 469,53.61,26.69,20,0
    .goto 469,58.18,23.56,30,0
    .goto 469,58.66,21.09,30,0
    .goto 469,58.14,18.36,30,0
    +1
step
    #requires Repaired Mechano-Tanks destroyed
    #completewith next
    >>击杀|cRXP_ENEMY_碎轮机动战士|r和|cRXP_ENEMY_被辐射的技师|r
	.complete 26331,1 --Crushcog's Minions killed (8)
	.mob Crushcog Battle Suit
	.mob Irradiated Technician
step
    #requires Repaired Mechano-Tanks destroyed
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_修复的步行坦克|r
    *|cRXP_WARN_You can do this from a distance|r.
    .complete 26333,1 --Repaired Mechano-Tanks destroyed (5)
	.mob Repaired Mechano-Tank
    .use 58200
step
    #label Crushcog's Minions killed
    >>击杀|cRXP_ENEMY_碎轮机动战士|r和|cRXP_ENEMY_被辐射的技师|r
	.complete 26331,1 --Crushcog's Minions killed (8)
	.mob Crushcog Battle Suit
	.mob Irradiated Technician
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|cRXP_FRIENDLY_和|r辛克尔斯·迅击|cRXP_FRIENDLY_和|r凯尔希·钢烁|cRXP_FRIENDLY_交谈
    .turnin 26331 >>交任务: |cRXP_FRIENDLY_碎轮的爪牙|r
    .goto 469,38.96,33.09 --clickradius
    .goto 469,38.802,32.715 --npc location
	.target +High Tinker Mekkatorgue
    .turnin 26333 >>交任务: |cRXP_FRIENDLY_没坦克！|r
    .goto 469,38.27,33.79 --clickradius
    .goto 469,38.204,33.662 --npc location
	.target +Hinkles Fastblast
    .accept 26339 >>接任务: |cRXP_WARN_烈酒村的准备|r
    .goto 469,38.204,33.662 --clickradius
    .goto 469,38.025,33.570 --npc location
	.target +Kelsey Steelspark
step
    #completewith next
    #label Staging in Brewnall
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
    .turnin 26339 >>交任务: |cRXP_FRIENDLY_烈酒村的准备|r
    .accept 26342 >>接任务: |cRXP_WARN_涂成黑色|r
    .disablecheckbox
	.target Jarvi Shadowstep
step
    --insert if bags are needed
    #completewith Staging in Brewnall
    .goto 469,39.94,35.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡森·疯髯|r交谈
    .collect 4496,3
    .buy 4496,3
    .target Carson Crazybread
step
    #requires Staging in Brewnall
    #completewith next
    +|cRXP_WARN_[稀有]|r如果吉波维特在场, 请击杀他, |cRXP_ENEMY_吉波维特|r, |cRXP_WARN_因为他能提供大量经验值|r
    .unitscan Gibblewilt
step
    #requires Staging in Brewnall
    .goto 469,48.82,52.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
    .turnin 26339 >>交任务: |cRXP_FRIENDLY_烈酒村的准备|r
    .accept 26342 >>接任务: |cRXP_WARN_涂成黑色|r
	.target Jarvi Shadowstep
step
    #loop
    .goto 469,55.05,48.64,25,0
    .goto 469,54.64,52.83,25,0
    .goto 469,54.24,43.3,25,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Crushcog哨兵机器人|r|cRXP_WARN_在面对它们时|r
    *|cRXP_WARN_If you can pull them from distance it is advised|r.
    .complete 26342,1 --Crushcog's Sentry Bot blinded (5)
	.mob Crushcog Sentry Bot
    .use 58203
-- step
--     #optional
--     #questguide
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
--     .accept 26364 >>接任务: |cRXP_WARN_碎轮的倒台！|r
-- 	.target Jarvi Shadowstep
step
    .goto 469,49,52.76 --clickradius
    .goto 469,48.744,52.880 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
    .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
	.target Jarvi Shadowstep
step
    #completewith next
    #label Bound for Kharanos
    .goto 469,51.44,53.16,15,0
    .goto 469,57.91,54.65,15,0
    .goto 469,63.5,54.55,15,0
    .goto 469,75.58,55.64,15,0
    .goto 27,49.65,45.29,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_席亚拉·深石|r交谈
    .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Ciara Deepstone
step
    #completewith Bound for Kharanos
    #hidewindow
    .goto 27,49.85,45.08,10 >>1
step
    #requires Bound for Kharanos
    .goto 27,49.85,45.08 --clickradius
    .goto 27,49.906,44.980 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_席亚拉·深石|r交谈
    .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Ciara Deepstone
-- step
--     #questguide
--     #optional
--     #completewith Razlo
--     #label Mekkatalk
--     .goto 469,57.188,47.535
--     .gossipoption 38798 >>与|cRXP_FRIENDLY_大工匠梅卡托克|r交谈
--     .timer 72,Down with Crushcog! RP
--     .target High Tinker Mekkatorque
--     .isOnQuest 26364
-- step
--     #questguide
--     #optional
--     #completewith next
--     #requires Mekkatalk
--     >>|cRXP_WARN_等待RP结束|r
--     +使用 |T308321:0|t[轨道定位装置] 对准 |cRXP_ENEMY_拉奇诺·碎轮|r和 |cRXP_ENEMY_碎轮守卫|r
--     .isOnQuest 26364
--     .use 58253
-- step
--     #questguide
--     #label Razlo
--     .goto 469,58.749,42.222
--     >>击败|cRXP_ENEMY_拉奇诺·碎轮|r
--     .complete 26364,2 --Razlo Crushcog defeated (1)
--     .use 58253
--     .mob Razlo Crushcog
--     .mob Crushcog's Guardians
-- step
--     #questguide
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26364 >>交任务: |cRXP_FRIENDLY_碎轮的倒台！|r
--     .accept 26373 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
-- 	.target Jarvi Shadowstep
--XX Doable by other races but simpler to do for gnomes only
-- step
--     #sticky
--     #label Tanks
--     #loop
--     .goto 469,59.638,21.877,0
--     .goto 469,53.711,22.482,0
--     .goto 469,58.619,23.568,0
--     .waypoint 469,59.638,21.877,15,0
--     .waypoint 469,59.620,19.066,15,0
--     .waypoint 469,58.784,18.047,15,0
--     .waypoint 469,57.507,18.837,15,0
--     .waypoint 469,56.560,20.889,15,0
--     .waypoint 469,55.463,21.067,15,0
--     .waypoint 469,53.711,22.482,15,0
--     .waypoint 469,53.126,24.536,15,0
--     .waypoint 469,54.080,26.011,15,0
--     .waypoint 469,55.407,23.742,15,0
--     .waypoint 469,56.513,23.676,15,0
--     .waypoint 469,57.585,23.609,15,0
--     .waypoint 469,58.619,23.568,15,0
--     >>使用 |T133710:0|t[高新榴弹] 对准 |cRXP_FRIENDLY_修复的步行坦克|r使用
--     .complete 26333,1 --Repaired Mechano-Tanks destroyed (5)
-- 	.mob Repaired Mechano-Tank
--     .use 58200
-- step
--     #sticky
--     #label CrushcogM
--     #loop
--     .goto 469,54.018,26.884,0
--     .goto 469,60.672,22.216,0
--     .goto 469,52.540,24.667,0
--     .goto 469,54.018,26.884,45,0
--     .goto 469,55.919,26.336,45,0
--     .goto 469,57.608,25.933,45,0
--     .goto 469,60.002,25.191,45,0
--     .goto 469,61.148,25.266,45,0
--     .goto 469,60.490,23.847,45,0
--     .goto 469,60.672,22.216,45,0
--     .goto 469,56.948,18.526,45,0
--     .goto 469,56.251,19.440,45,0
--     .goto 469,54.541,18.700,45,0
--     .goto 469,54.364,20.143,45,0
--     .goto 469,52.960,21.320,45,0
--     .goto 469,52.540,24.667,45,0
--     >>击杀|cRXP_ENEMY_碎轮机动战士|r和|cRXP_ENEMY_被辐射的技师|r
-- 	.complete 26331,1 --Crushcog's Minions killed (8)
-- 	.mob Crushcog Battle Suit
-- 	.mob Irradiated Technician
-- step
--     #optional
--     .goto 469,66.100,26.168,45,0
--     .goto 469,66.023,27.211,45 >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_武器化机械兔|r. 如果它出现了, 就击杀它|r
-- 	.unitscan Weaponized Rabbot
--     .isOnQuest 26331
--     .noflyable
-- step
--     #optional
--     .goto 469,68.698,35.590,45,0
--     .goto 469,67.992,35.519,45,0
--     .goto 469,67.433,37.129,45 >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_狂暴的冬狼|r. 如果他在, 就杀掉他|r
--     .unitscan Timber
--     .isOnQuest 26331
--     .noflyable
-- step
--     #optional
--     #requires CrushcogM
-- --XXREQ Placeholder invis step until multiple requires per step
-- step << skip
--     #requires Tanks
--     #completewith next
--     .goto 469,56.346,21.833,-1
--     .goto 469,47.880,44.670,-1
-- -- .goto 425,38.29,58.12
--     *|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
--     .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
--     .skill riding,75,1
-- --XX unlikely to ever be worth
-- step
--     #requires Tanks
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大工匠梅卡托克|cRXP_FRIENDLY_和|r辛克尔斯·迅击|cRXP_FRIENDLY_和|r凯尔希·钢烁|cRXP_FRIENDLY_交谈
--     .turnin 26331 >>交任务: |cRXP_FRIENDLY_碎轮的爪牙|r
--     .goto 469,38.802,32.715
-- 	.target +High Tinker Mekkatorgue
--     .turnin 26333 >>交任务: |cRXP_FRIENDLY_没坦克！|r
--     .goto 469,38.204,33.662
-- 	.target +Hinkles Fastblast
--     .accept 26339 >>接任务: |cRXP_WARN_烈酒村的准备|r
--     .goto 469,38.025,33.570
-- 	.target +Kelsey Steelspark
-- step
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26339 >>交任务: |cRXP_FRIENDLY_烈酒村的准备|r
--     .accept 26342 >>接任务: |cRXP_WARN_涂成黑色|r
-- 	.target Jarvi Shadowstep
-- step
--     #loop
--     .goto 469,52.723,50.681,0
--     .goto 469,52.556,44.220,0
--     .goto 469,61.154,48.908,0
--     .goto 469,52.723,50.681,50,0
--     .goto 469,55.901,51.426,50,0
--     .goto 469,52.556,44.220,50,0
--     .goto 469,54.584,39.961,50,0
--     .goto 469,61.154,48.908,50,0
--     >>使用 |T133037:0|t[喷漆枪] 对准|cRXP_ENEMY_碎轮哨戒机器人|r施放
--     .complete 26342,1 --Crushcog's Sentry Bot blinded (5)
-- 	.mob Crushcog Sentry Bot
--     .use 58203
-- step
--     #optional
--     #questguide
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
--     .accept 26364 >>接任务: |cRXP_WARN_碎轮的倒台！|r
-- 	.target Jarvi Shadowstep
-- step
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26342 >>交任务: |cRXP_FRIENDLY_涂成黑色|r
-- 	.target Jarvi Shadowstep
-- step
--     #questguide
--     #optional
--     #completewith Razlo
--     #label Mekkatalk
--     .goto 469,57.188,47.535
--     .gossipoption 38798 >>与|cRXP_FRIENDLY_大工匠梅卡托克|r交谈
--     .timer 72,Down with Crushcog! RP
--     .target High Tinker Mekkatorque
--     .isOnQuest 26364
-- step
--     #questguide
--     #optional
--     #completewith next
--     #requires Mekkatalk
--     >>|cRXP_WARN_等待RP结束|r
--     +使用 |T308321:0|t[轨道定位装置] 对准 |cRXP_ENEMY_拉奇诺·碎轮|r和 |cRXP_ENEMY_碎轮守卫|r
--     .isOnQuest 26364
--     .use 58253
-- step
--     #questguide
--     #label Razlo
--     .goto 469,58.749,42.222
--     >>击败|cRXP_ENEMY_拉奇诺·碎轮|r
--     .complete 26364,2 --Razlo Crushcog defeated (1)
--     .use 58253
--     .mob Razlo Crushcog
--     .mob Crushcog's Guardians
-- step
--     #questguide
--     .goto 469,48.744,52.880
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔维·影踪|r谈话
--     .turnin 26364 >>交任务: |cRXP_FRIENDLY_碎轮的倒台！|r
--     .accept 26373 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
-- 	.target Jarvi Shadowstep
-- step
--     .goto 27,49.906,44.980
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_席亚拉·深石|r交谈
--     .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
-- 	.target Ciara Deepstone
-- --XX Doable by other races but simpler to do for gnomes only
]])

--Dwarf & Gnome Dun Morogh
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AC) 矮人 & 侏儒 - 丹莫罗
#displayname |cFF00CCFF2|r - 丹莫罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r 
#defaultfor Dwarf Gnome !DK
#next BA)艾尔文森林

<< Alliance

step << Gnome
    #completewith next
    #label Frostmane Aggression
    .goto 27,49.85,45.09,10,0
    .goto 27,50.6,46.16,10,0
    .goto 27,51.56,47.24,10,0
    .goto 27,53.07,49.85,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|r交谈
    .accept 25724 >>接任务: |cRXP_WARN_霜鬃的挑衅|r
	.target Captain Tharran
step << Gnome
    #hidewindow
    #completewith Frostmane Aggression
    .goto 27,53.73,52.04,40 >>1
step << Gnome
    #requires Frostmane Aggression
    .goto 27,53.73,52.04 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|r交谈
    .accept 25724 >>接任务: |cRXP_WARN_霜鬃的挑衅|r
	.target Captain Tharran
step << Dwarf
    .goto 27,53.81,52.18 --clickradius
    .goto 27,53.713,52.190 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|r交谈
    .accept 25724 >>接任务: |cRXP_WARN_霜鬃的挑衅|r
	.target Captain Tharran
step
    .goto 27,53.8,51.85 << Gnome --clickradius
    .goto 27,53.83,52.03 << Dwarf --clickradius
    .goto 27,53.807,51.935 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温比尔·任务栏|r交谈
    *|cRXP_WARN_Herbing 草药和采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r.
    .train 2366 >>训练 |T4620675:0|t[草药学]
    .target Wembil Taskwidget
    .skipgossip 47396,1,1,1
step
    .goto 27,53.8,51.85 << Gnome --clickradius
    .goto 27,53.83,52.03 << Dwarf --clickradius
    .goto 27,53.807,51.935 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温比尔·任务栏|r交谈
    *|cRXP_WARN_采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r
    .train 2575 >>训练 |T4620679:0|t[采矿]
    .target Wembil Taskwidget
    .skipgossip 47396,2,3,2
step
    .goto 27,54.09,51.16 --clickradius dwarf
    .goto 27,54.196,51.169 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷杰德·麦酒|r交谈
    .accept 315 >>接任务: |cRXP_LOOT_完美烈酒|r
	.target Rejold Barleybrew
step
    .goto 27,54.04,50.74 --clickradius
    .goto 27,53.933,50.684  --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉格纳·雷酒|r交谈
    .accept 384 >>接任务: |cRXP_LOOT_啤酒烤猪排|r
	.target Ragnar Thunderbrew
step
    #completewith next
    #label Honor Students
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
    .train 2550 >>训练 |T4620671:0|t[烹饪]
    .disablecheckbox
	.target Gremlock Pilsnor
step
    #completewith Honor Students
    .goto 27,54.06,50.23,5,0 
    .goto 27,54.28,50.27,5 >>进入雷霆酿酒厂
step
    #completewith next
    #label Honor Students2
    #requires Honor Students
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r交谈
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
    .train 2550 >>训练 |T4620671:0|t[烹饪]
	.target Gremlock Pilsnor
step
    #requires Honor Students
    #completewith Honor Students2
    .goto 27,54.6,50.73,5 >>进入厨房
step
    #requires Honor Students2
    .goto 27,54.73,50.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r交谈. [1]
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
	.target Gremlock Pilsnor
step
    #requires Honor Students2
    .goto 27,54.73,50.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r|cRXP_WARN_[2]|r交谈
    .train 2550 >>训练 |T4620671:0|t[烹饪]
	.target Gremlock Pilsnor
step << Gnome
    .goto 27,54.5,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[1]|r交谈
    .turnin 26380 >>交任务: |cRXP_FRIENDLY_前往卡拉诺斯|r
    .isOnQuest 26380
	.target Innkeeper Belm
step << Gnome
    #completewith next
    #label Rhapsody Malt
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[3]|r交谈
    .complete 384,2 --1/1 Rhapsody Malt
	.target Innkeeper Belm
    .isOnQuest 384
step << Gnome
    #completewith Rhapsody Malt
    .goto 27,54.5,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[2]|r交谈
    .home >>将你的[炉石]设置为雷酒酿造厂
	.target Innkeeper Belm
step << Gnome
    #requires Rhapsody Malt
    .goto 27,54.5,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[3]|r交谈
    .skipgossipid 30011
    .complete 384,2 --1/1 Rhapsody Malt
    .buy 2894,1
	.target Innkeeper Belm
    .isOnQuest 384
step << Dwarf
    #completewith next
    #label Rhapsody Malt
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[2]|r交谈
    .complete 384,2 --1/1 Rhapsody Malt
	.target Innkeeper Belm
    .isOnQuest 384
step << Dwarf
    #completewith Rhapsody Malt
    .goto 27,54.5,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[1]|r交谈
    .home >>将你的[炉石]设置为雷酒酿造厂
	.target Innkeeper Belm
step << Dwarf
    #requires Rhapsody Malt
    .goto 27,54.5,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板贝尔姆|r|cRXP_WARN_[2]|r交谈
    .skipgossipid 30011
    .complete 384,2 --1/1 Rhapsody Malt
    .buy 2894,1
	.target Innkeeper Belm
    .isOnQuest 384
step << Dwarf
    #completewith Thunderbrew Distillery
    #label Don't Forget About Us
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .turnin 24493 >>交任务: |cRXP_FRIENDLY_别忘记我们|r
	.target Tharek Blackstone
step << Dwarf
    #completewith Don't Forget About Us
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷迪·班森|r谈话
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Grady Bannson
step << Dwarf
    #completewith Don't Forget About Us
    #label Thunderbrew Distillery
    .goto 27,54.24,50.27,5,0
    .goto 27,54.08,50.31,5,0
    .goto 27,54.06,50.5,5 >>离开雷霆酿酒厂
step << Dwarf
    #requires Thunderbrew Distillery
    .goto 27,53.9,50.46,8,0
    .goto 27,53.81,50.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷迪·班森|r谈话
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Grady Bannson
step << Dwarf
    #requires Thunderbrew Distillery
    .goto 27,53.18,49.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨雷克·黑石|r交谈
    .turnin 24493 >>交任务: |cRXP_FRIENDLY_别忘记我们|r
	.target Tharek Blackstone

-- --replace
-- step << Gnome
--     #completewith Thunderbrew Distillery
--     #label Tender Boar Ribs
-- 	>>击杀 |cRXP_ENEMY_峭壁野猪|r. 击杀后从它们身上获取 |T133972:0|t[|cRXP_LOOT_嫩猪肋排|r] 的战利品
--     .complete 384,1 --Tender Boar Ribs (4)
-- 	.mob Crag Boar
step << Gnome
    #completewith Thunderbrew Distillery
    #label Tender Boar Ribs
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_微光草|r
    .complete 315,1 --Shimmerweed (7)
step << Gnome
    #completewith Tender Boar Ribs
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷迪·班森|r谈话
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Grady Bannson
step << Gnome
    #completewith Tender Boar Ribs
    #label Thunderbrew Distillery
    .goto 27,54.24,50.27,5,0
    .goto 27,54.08,50.31,5,0
    .goto 27,54.06,50.5,5 >>离开雷霆酿酒厂
step << Gnome 
    #requires Thunderbrew Distillery
    .goto 27,53.9,50.46,5,0
    .goto 27,53.82,50.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷迪·班森|r谈话
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Grady Bannson
-- ---replace
-- step << Gnome
--     #requires Thunderbrew Distillery
--     #completewith next
--     #label Crag Boars
--     .goto 27,53,46.19,20,0
--     .goto 27,52.53,43.08,20,0
--     .goto 27,51.7,40.39,20,0
-- 	>>击杀 |cRXP_ENEMY_峭壁野猪|r. 击杀后从它们身上获取 |T133972:0|t[|cRXP_LOOT_嫩猪肋排|r] 的战利品
--     .complete 384,1 --Tender Boar Ribs (4)
-- 	.mob Crag Boar
---
step << Dwarf
    #completewith next
    #label Bound for KharanosDwarf
    .goto 27,51.79,47.6,5,0
    .goto 27,50.82,45.7,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_席亚拉·深石|r交谈
    .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Ciara Deepstone
step << Dwarf
    #hidewindow
    #completewith Bound for KharanosDwarf
    .goto 27,50,44.88,40 >>1
step << Dwarf
    #requires Bound for KharanosDwarf
    .goto 27,50,44.88 --clickradius
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_席亚拉·深石|r交谈
    .accept 26380 >>接任务: |cRXP_WARN_前往卡拉诺斯|r
	.target Ciara Deepstone
step << Dwarf
    #completewith WayShortcut1
    #label WayShortcut
    .goto 27,49.81,43.53,5,0
    >>击杀 |cRXP_ENEMY_霜鬃雪行者|r 和 |cRXP_ENEMY_霜鬃先知|r. 从它们身上搜刮出 |T134184:0|t[|cRXP_LOOT_微光草|r]
    .complete 25724,2 --Frostmane Snowstrider slain (7)
    .complete 25724,1 --Frostmane Seer slain (5)
	.mob +Frostmane Seer
step << Dwarf
    #completewith WayShortcut
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_微光草|r
    .complete 315,1 --Shimmerweed (7)
step << Dwarf
    #completewith WayShortcut
    #label WayShortcut1
    .goto 27,49.43,43.53,10 >>向上坡前进
step << Gnome
    #completewith WayShortcut1
    #label WayShortcut
    .goto 27,49.73,43.71,5,0
    .goto 27,49.81,43.43,5,0
    .goto 27,51.79,47.6,10,0
    .goto 27,50.39,44.94,10,0
    >>击杀 |cRXP_ENEMY_霜鬃雪行者|r 和 |cRXP_ENEMY_霜鬃先知|r. 从它们身上搜刮出 |T134184:0|t[|cRXP_LOOT_微光草|r]
    .complete 25724,2 --Frostmane Snowstrider slain (7)
    .complete 25724,1 --Frostmane Seer slain (5)
	.mob +Frostmane Seer
step << Gnome
    #completewith WayShortcut
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_微光草|r
    .complete 315,1 --Shimmerweed (7)
step << Gnome
    #completewith WayShortcut
    #label WayShortcut1
    .goto 27,49.37,43.57,10 >>向上坡前进
step
    #requires WayShortcut1
    #hidewindow
    #completewith Frostmane Seer
    #loop
    .goto 27,48.16,42.52,15,0
    .goto 27,49.12,39.67,20,0
    .goto 27,49.07,37.1,20,0
    .goto 27,47.97,37.91,20,0
    .goto 27,47.52,40.93,20,0
    +1
step
    #requires WayShortcut1
    #completewith Frostmane Seer
    +|cRXP_WARN_[稀有]|r击杀|cRXP_ENEMY_霜鬃长老|r, 如果他在场, |cRXP_WARN_因为他会提供大量经验值|r
    *After these objectives, we'll deathskip. Feel free to lower your health beforehand.
    .unitscan Great Father Arctikus
step
    #completewith next
    #requires WayShortcut1
    >>击杀 |cRXP_ENEMY_霜鬃雪行者|r 和 |cRXP_ENEMY_霜鬃先知|r. 从它们身上搜刮出 |T134184:0|t[|cRXP_LOOT_微光草|r]
    .complete 25724,2 --Frostmane Snowstrider slain (7)
    .complete 25724,1 --Frostmane Seer slain (5)
	.mob +Frostmane Seer
step
    #requires WayShortcut1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_微光草|r
    .complete 315,1 --Shimmerweed (7)
step
    #label Frostmane Seer
    >>击杀 |cRXP_ENEMY_霜鬃雪行者|r 和 |cRXP_ENEMY_霜鬃先知|r. 从它们身上搜刮出 |T134184:0|t[|cRXP_LOOT_微光草|r]
    .complete 25724,2 --Frostmane Snowstrider slain (7)
    .complete 25724,1 --Frostmane Seer slain (5)
	.mob +Frostmane Seer
step
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_荣誉学员|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛兰·风须|r交谈
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
    .disablecheckbox
step
    #completewith 交任务: |cRXP_FRIENDLY_荣誉学员|r
    .goto 27,50.63,39.51
    .deathskip >>拉怪并尽可能多地击杀怪物, 然后在|cRXP_FRIENDLY_灵魂医者|r处死亡并复活
    *|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .target Spirit Healer
step
    #requires 交任务: |cRXP_FRIENDLY_荣誉学员|r
    .goto 27,53.802,52.762  --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛兰·风须|r交谈
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
	.target Brolan Galebeard
step
    #requires Shimmerweed
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|cRXP_FRIENDLY_和|r军需官吉尼亚|cRXP_FRIENDLY_交谈
    .turnin 25724 >>交任务: |cRXP_FRIENDLY_霜鬃的挑衅|r
    .accept 313 >>接任务: |cRXP_WARN_灰色洞穴|r
    .accept 25667 >>接任务: |cRXP_WARN_宰杀雪怪|r
    .goto 27,53.713,52.190 --npc location
	.target +Captain Tharran
    .accept 25668 >>接任务: |cRXP_WARN_被窃的补给品|r
    .goto 27,53.707,52.095 --npc location
	.target +Quartermaster Glynna
-- step
--     #completewith Wendigo Cave2
--     #label Wendigo Cave
--     >>击杀|cRXP_ENEMY_雪怪|r
--     .complete 25667,1 --Wendigo slain (10)
-- 	.mob Wendigo
-- 	.mob Young Wendigo
step
    #completewith next
    #label Wendigo Cave
	>>击杀 |cRXP_ENEMY_峭壁野猪|r. 击杀后从它们身上获取 |T133972:0|t[|cRXP_LOOT_嫩猪肋排|r] 的战利品
    .complete 384,1 --Tender Boar Ribs (4)
	.mob Crag Boar
step
    #completewith Wendigo Cave
    .goto 27,51.85,53.93,20,0
    .goto 27,49.61,52.86,20,0
    .goto 27,49.48,52.07,15 >>进入雪怪洞穴
step
    #requires Wendigo Cave
    #completewith Mountaineer Valgrum2
    >>击杀|cRXP_ENEMY_雪怪|r
    .complete 25667,1 --Wendigo slain (10)
	.mob Wendigo
	.mob Young Wendigo
step
    #requires Wendigo Cave
    #completewith Mountaineer Valgrum2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被窃的补给品|r
    .complete 25668,1 --Pilfered Supplies (6)
step
    #requires Wendigo Cave
    #completewith next
    #label Mountaineer Dunstan
    .goto 29,61.57,86.83,10,0
    .goto 29,62.53,76.71,10,0
    .goto 29,54.19,72.4,10,0
    .goto 29,50.17,58.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人东斯坦|r交谈
    .complete 313,1 --Convey orders to Mountaineer Dunstan (1)
	.target Mountaineer Dunstan
step
    #hidewindow
    #completewith Mountaineer Dunstan
    .goto 29,51.81,48.44,30 >>1
step
    #requires Mountaineer Dunstan
    .goto 29,51.81,48.44 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人东斯坦|r交谈
    .complete 313,1 --Convey orders to Mountaineer Dunstan (1)
	.target Mountaineer Dunstan
    .skipgossipid 37802
step
    #completewith next
    #label Mountaineer Lewin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人雷文|r交谈
    .complete 313,2 --Convey orders to Mountaineer Lewin (1)
	.target Mountaineer Lewin
    .skipgossipid 37803
step
    #hidewindow
    #completewith Mountaineer Lewin
    .goto 29,60.272,56.211,20 >>1
step
    #requires Mountaineer Lewin
    .goto 29,60.272,56.211 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人雷文|r交谈
    .complete 313,2 --Convey orders to Mountaineer Lewin (1)
	.target Mountaineer Lewin
    .skipgossipid 37803
step
    #completewith next
    #label Mountaineer Valgrum
    .goto 29,61.47,51.5,7,0
    .goto 29,59.69,44.37,15,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人沃格姆|r交谈
    .complete 313,3 --Convey orders to Mountaineer Valgrum (1)
	.target Mountaineer Valgrum
    .skipgossipid 37551
step
    #hidewindow
    #completewith Mountaineer Valgrum
    .goto 29,60.91,22.88,30 >>1
step
    #requires Mountaineer Valgrum
    #label Mountaineer Valgrum2
    .goto 29,60.91,22.88 --clickradius
    .goto 29,61.511,22.248 --npc location
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巡山人沃格姆|r交谈
    .complete 313,3 --Convey orders to Mountaineer Valgrum (1)
	.target Mountaineer Valgrum
    .skipgossipid 37551
step
    #completewith WaytoEdan
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被窃的补给品|r
    .complete 25668,1 --Pilfered Supplies (6)
step
    #completewith WaytoEdan
    >>击杀|cRXP_ENEMY_雪怪|r
    .complete 25667,1 --Wendigo slain (10)
	.mob Wendigo
	.mob Young Wendigo
step
    #completewith WaytoEdan
    +|cRXP_WARN_[稀有]|r:如果他在场, 请击杀|cRXP_ENEMY_饥饿的雪怪|r, |cRXP_WARN_因为他会提供大量经验值|r
    *|cRXP_WARN_[VERY RARE TREASURE]|r 
    *Loot the |cRXP_PICK_Treasure|r if it's up , |cRXP_WARN_as it grants massive XP|r. 
    *|cFFFF0000Avoid looking around for too long|r
    .unitscan Edan the Howler
step
    #hidewindow
    #label WaytoEdan
    .goto 29,55.31,17.3,15,0
    .goto 29,50.09,19.08,15,0
    .goto 29,41.77,31.49,15,0
    .goto 29,34.13,36.32,15,0
    .goto 29,30.67,55.6,30 >>1
    .isOnQuest 25667,25668
step
    #hidewindow
    #completewith Forced to Watch from Afar
    #loop
    .goto 29,29.13,40.54,25,0
    .goto 29,41.53,36.64,25,0
    .goto 29,37.28,50.41,25,0
    +1
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被窃的补给品|r
    .complete 25668,1 --Pilfered Supplies (6)
step
    >>击杀|cRXP_ENEMY_雪怪|r
    .complete 25667,1 --Wendigo slain (10)
	.mob Wendigo
	.mob Young Wendigo
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_被窃的补给品|r
    .complete 25668,1 --Pilfered Supplies (6)
step
    #completewith next
    #label Forced to Watch from Afar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|cRXP_FRIENDLY_和|r军需官吉尼亚|cRXP_FRIENDLY_交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .turnin 25667 >>交任务: |cRXP_FRIENDLY_宰杀雪怪|r
    .accept 25792 >>接任务: |cRXP_WARN_推进|r
    .disablecheckbox
	.target +Captain Tharran
    .turnin 25668 >>交任务: |cRXP_FRIENDLY_被窃的补给品|r
    .disablecheckbox
	.target +Quartermaster Glynna
step
    #completewith Forced to Watch from Afar
    .deathskip >>拉怪并尽可能多地击杀怪物, 然后在|cRXP_FRIENDLY_灵魂医者|r处死亡并复活
    *|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .target Spirit Healer
step
    #requires Forced to Watch from Afar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨兰恩队长|cRXP_FRIENDLY_和|r军需官吉尼亚|cRXP_FRIENDLY_交谈
    .turnin 313 >>交任务: |cRXP_FRIENDLY_灰色洞穴|r
    .turnin 25667 >>交任务: |cRXP_FRIENDLY_宰杀雪怪|r
    .accept 25792 >>接任务: |cRXP_WARN_推进|r
    .goto 27,53.713,52.190
	.target +Captain Tharran
    .turnin 25668 >>交任务: |cRXP_FRIENDLY_被窃的补给品|r
    .goto 27,53.707,52.095
	.target +Quartermaster Glynna





















]])

--Human Northshire Valley
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AB) 北郡谷
#displayname 北郡 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Human !DK
#next AC) 人类 艾尔文森林

<< Alliance

step
    .goto 425,33.18,53.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .accept 28757 >>接任务: |cRXP_WARN_击退敌人！|r << Human Mage/KulTiran Mage
    .accept 28762 >>接任务: |cRXP_WARN_击退敌人！|r << Human Paladin
    .accept 28763 >>接任务: |cRXP_WARN_击退敌人！|r << Human Priest/KulTiran Priest
    .accept 28764 >>接任务: |cRXP_WARN_击退敌人！|r << Human Rogue/KulTiran Rogue
    .accept 28765 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warlock/KulTiran Warlock
    .accept 28766 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warrior/KulTiran Warrior
    .accept 28767 >>接任务: |cRXP_WARN_击退敌人！|r << Human Hunter/KulTiran Hunter
    .accept 29078 >>接任务: |cRXP_WARN_击退敌人！|r << !Human !KulTiran
    .accept 31139 >>接任务: |cRXP_WARN_击退敌人！|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Marshal McBride
step
    #loop
    .goto 425,30.38,45.91,25,0
    .goto 425,27.15,46.01,25,0
    .goto 425,25.66,57.49,30,0
    .goto 425,26.65,65.32,30,0
    .goto 425,23.73,61.82,20,0
    .goto 425,26.63,38.77,25,0
    .goto 425,29.87,37.49,25,0
    >>击杀|cRXP_ENEMY_黑石座狼|r
    .complete 28757,1 << Human Mage/KulTiran Mage --Blackrock Worgs (6)
    .complete 28762,1 << Human Paladin --Blackrock Worgs (6)
    .complete 28763,1 << Human Priest/KulTiran Priest --Blackrock Worgs (6)
    .complete 28764,1 << Human Rogue/KulTiran Rogue --Blackrock Worgs (6)
    .complete 28765,1 << Human Warlock/KulTiran Warlock --Blackrock Worgs (6)
    .complete 28766,1 << Human Warrior/KulTiran Warrior --Blackrock Worgs (6)
    .complete 28767,1 << Human Hunter/KulTiran Hunter --Blackrock Worgs (6)
    .complete 29078,1 << !Human !KulTiran --Blackrock Worgs (6)
    .complete 31139,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Blackrock Worgs (6)
    .mob Blackrock Worg
step
    .goto 425,33.14,53.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 28757 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Mage/KulTiran Mage
    .turnin 28762 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Paladin
    .turnin 28763 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Priest/KulTiran Priest
    .turnin 28764 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Rogue/KulTiran Rogue
    .turnin 28765 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Warlock/KulTiran Warlock
    .turnin 28766 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Warrior/KulTiran Warrior
    .turnin 28767 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Hunter/KulTiran Hunter
    .turnin 29078 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << !Human !KulTiran
    .turnin 31139 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .accept 28759 >>接任务: |cRXP_WARN_狮入羊口|r << Human Hunter/KulTiran Hunter
    .accept 28769 >>接任务: |cRXP_WARN_狮入羊口|r << Human Mage/KulTiran Mage
    .accept 28770 >>接任务: |cRXP_WARN_狮入羊口|r << Human Paladin
    .accept 28771 >>接任务: |cRXP_WARN_狮入羊口|r << Human Priest/KulTiran Priest
    .accept 28772 >>接任务: |cRXP_WARN_狮入羊口|r << Human Rogue/KulTiran Rogue
    .accept 28773 >>接任务: |cRXP_WARN_狮入羊口|r << Human Warlock/KulTiran Warlock
    .accept 28774 >>接任务: |cRXP_WARN_狮入羊口|r << Human Warrior/KulTiran Warrior
    .accept 29079 >>接任务: |cRXP_WARN_狮入羊口|r << !Human !KulTiran
    .accept 31140 >>接任务: |cRXP_WARN_狮入羊口|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Marshal McBride
step
    #loop
    .goto 425,31.52,39.9,25,0
    .goto 425,28.84,38.97,25,0
    .goto 425,26.71,42.75,25,0
    .goto 425,23.02,41.61,25,0
    .goto 425,29.48,48.96,25,0
    .goto 425,22.8,52.53,25,0
    .goto 425,24.43,63.26,25,0
    >>击杀|cRXP_ENEMY_黑石间谍|r
    >>|cRXP_WARN_它们是|r|T132320:0|t[潜行中]|cRXP_WARN_(但很容易被发现)|r
    .complete 28759,1 << Human Hunter/KulTiran Hunter --Blackrock Spies (8)
    .complete 28769,1 << Human Mage/KulTiran Mage--Blackrock Spies (8)
    .complete 28770,1 << Human Paladin --Blackrock Spies (8)
    .complete 28771,1 << Human Priest/KulTiran Priest --Blackrock Spies (8)
    .complete 28772,1 << Human Rogue/KulTiran Rogue --Blackrock Spies (8)
    .complete 28773,1 << Human Warlock/KulTiran Warlock --Blackrock Spies (8)
    .complete 28774,1 << Human Warrior/KulTiran Warrior --Blackrock Spies (8)
    .complete 29079,1 << !Human !KulTiran --Blackrock Spies (8)
    .complete 31140,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Blackrock Spies (8)
    .mob Blackrock Spy
    .use 57253
step
    .goto 425,33.13,52.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 28759 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Hunter/KulTiran Hunter
    .turnin 28769 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Mage/KulTiran Mage
    .turnin 28770 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Paladin
    .turnin 28771 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Priest/KulTiran Priest
    .turnin 28772 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Rogue/KulTiran Rogue
    .turnin 28773 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warlock/KulTiran Warlock
    .turnin 28774 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warrior/KulTiran Warrior
    .turnin 29079 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << !Human !KulTiran
    .turnin 31140 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .accept 28780 >>接任务: |cRXP_WARN_加入战斗！|r << Human Hunter/KulTiran Hunter
    .accept 28784 >>接任务: |cRXP_WARN_加入战斗！|r << Human Mage/KulTiran Mage
    .accept 28785 >>接任务: |cRXP_WARN_加入战斗！|r << Human Paladin
    .accept 28786 >>接任务: |cRXP_WARN_加入战斗！|r << Human Priest/KulTiran Priest
    .accept 28787 >>接任务: |cRXP_WARN_加入战斗！|r << Human Rogue/KulTiran Rogue
    .accept 28788 >>接任务: |cRXP_WARN_加入战斗！|r << Human Warlock/KulTiran Warlock
    .accept 28789 >>接任务: |cRXP_WARN_加入战斗！|r << Human Warrior/KulTiran Warrior
    .accept 29080 >>接任务: |cRXP_WARN_加入战斗！|r << !Human !KulTiran
    .accept 31143 >>接任务: |cRXP_WARN_加入战斗！|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Marshal McBride
step
    .goto 425,35.59,40.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 28780 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Hunter/KulTiran Hunter
    .turnin 28784 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Mage/KulTiran Mage
    .turnin 28785 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Paladin
    .turnin 28786 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Priest/KulTiran Priest
    .turnin 28787 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Rogue/KulTiran Rogue
    .turnin 28788 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Warlock/KulTiran Warlock
    .turnin 28789 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Warrior/KulTiran Warrior
    .turnin 29080 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << !Human !KulTiran
    .turnin 31143 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .accept 28791 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Hunter/KulTiran Hunter
    .accept 28792 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Mage/KulTiran Mage
    .accept 28793 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Paladin
    .accept 28794 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Priest/KulTiran Priest
    .accept 28795 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Rogue/KulTiran Rogue
    .accept 28796 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Warlock/KulTiran Warlock
    .accept 28797 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Warrior/KulTiran Warrior
    .accept 29081 >>接任务: |cRXP_WARN_他们派来了刺客|r << !Human !KulTiran
    .accept 31144 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Sergeant Willem
    .use 57386
step
    .goto 425,34.91,38.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕克斯顿修士|r交谈
    .accept 28806 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Hunter/KulTiran Hunter
    .accept 28808 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Mage/KulTiran Mage
    .accept 28809 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Paladin
    .accept 28810 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Priest/KulTiran Priest
    .accept 28811 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Rogue/KulTiran Rogue
    .accept 28812 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Warlock/KulTiran Warlock
    .accept 28813 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Warrior/KulTiran Warrior
    .accept 29082 >>接任务: |cRXP_WARN_别畏惧邪恶|r << !Human !KulTiran
    .accept 63447 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Brother Paxton
step
    #label Gug Fatcandle2
    #completewith Gug Fatcandle
    >>击杀|cRXP_ENEMY_地精刺客|r
    .complete 28791,1 << Human Hunter/KulTiran Hunter --Goblin Assassins (8)
    .complete 28792,1 << Human Mage/KulTiran Mage --Goblin Assassins (8)
    .complete 28793,1 << Human Paladin --Goblin Assassins (8)
    .complete 28794,1 << Human Priest/KulTiran Priest --Goblin Assassins (8)
    .complete 28795,1 << Human Rogue/KulTiran Rogue --Goblin Assassins (8)
    .complete 28796,1 << Human Warlock/KulTiran Warlock --Goblin Assassins (8)
    .complete 28797,1 << Human Warrior/KulTiran Warrior --Goblin Assassins (8)
    .complete 29081,1 << !Human !KulTiran --Goblin Assassins (8)
    .complete 31144,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Goblin Assassins (8)
    .mob Goblin Assassin
step
    #completewith Gug Fatcandle
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Injured 暴风城伤兵|r
    .complete 28806,1 << Human Hunter/KulTiran Hunter --Revive Injured Soldiers (4)
    .complete 28808,1 << Human Mage/KulTiran Mage --Revive Injured Soldiers (4)
    .complete 28809,1 << Human Paladin --Revive Injured Soldiers (4)
    .complete 28810,1 << Human Priest/KulTiran Priest --Revive Injured Soldiers (4)
    .complete 28811,1 << Human Rogue/KulTiran Rogue --Revive Injured Soldiers (4)
    .complete 28812,1 << Human Warlock/KulTiran Warlock --Revive Injured Soldiers (4)
    .complete 28813,1 << Human Warrior/KulTiran Warrior --Revive Injured Soldiers (4)
    .complete 29082,1 << !Human !KulTiran --Revive Injured Soldiers (4)
    .complete 63447,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Revive Injured Soldiers (4)
    .target Injured Stormwind Infantry
step
    #label Gug Fatcandle
    #completewith Gug Fatcandle2
    .goto 425,31.59,16.72,40 >>|cRXP_WARN_[稀有]|r检查|cRXP_ENEMY_大蜡烛伽格|r是否出现, 如果他在就杀掉他|r, |cRXP_WARN_因为他会掉落大量经验值|r 
	.unitscan Gug Fatcandle
step
    #requires Gug Fatcandle2
    #hidewindow
    #completewith Goblin Assassins 
    #loop
    .goto 425,29.87,31.6,30,0
    .goto 425,39.8,26.07,30,0
    .goto 425,46.71,32.34,30,0
    .goto 425,41.36,37.8,30,0
    +1
step
    #requires Gug Fatcandle2
    #completewith next
    >>击杀|cRXP_ENEMY_地精刺客|r
    .complete 28791,1 << Human Hunter/KulTiran Hunter --Goblin Assassins (8)
    .complete 28792,1 << Human Mage/KulTiran Mage --Goblin Assassins (8)
    .complete 28793,1 << Human Paladin --Goblin Assassins (8)
    .complete 28794,1 << Human Priest/KulTiran Priest --Goblin Assassins (8)
    .complete 28795,1 << Human Rogue/KulTiran Rogue --Goblin Assassins (8)
    .complete 28796,1 << Human Warlock/KulTiran Warlock --Goblin Assassins (8)
    .complete 28797,1 << Human Warrior/KulTiran Warrior --Goblin Assassins (8)
    .complete 29081,1 << !Human !KulTiran --Goblin Assassins (8)
    .complete 31144,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Goblin Assassins (8)
    .mob Goblin Assassin
step
    #requires Gug Fatcandle2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Injured 暴风城伤兵|r
    .complete 28806,1 << Human Hunter/KulTiran Hunter --Revive Injured Soldiers (4)
    .complete 28808,1 << Human Mage/KulTiran Mage --Revive Injured Soldiers (4)
    .complete 28809,1 << Human Paladin --Revive Injured Soldiers (4)
    .complete 28810,1 << Human Priest/KulTiran Priest --Revive Injured Soldiers (4)
    .complete 28811,1 << Human Rogue/KulTiran Rogue --Revive Injured Soldiers (4)
    .complete 28812,1 << Human Warlock/KulTiran Warlock --Revive Injured Soldiers (4)
    .complete 28813,1 << Human Warrior/KulTiran Warrior --Revive Injured Soldiers (4)
    .complete 29082,1 << !Human !KulTiran --Revive Injured Soldiers (4)
    .complete 63447,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Revive Injured Soldiers (4)
    .target Injured Stormwind Infantry
step
    #label Goblin Assassins
    >>击杀|cRXP_ENEMY_地精刺客|r
    .complete 28791,1 << Human Hunter/KulTiran Hunter --Goblin Assassins (8)
    .complete 28792,1 << Human Mage/KulTiran Mage --Goblin Assassins (8)
    .complete 28793,1 << Human Paladin --Goblin Assassins (8)
    .complete 28794,1 << Human Priest/KulTiran Priest --Goblin Assassins (8)
    .complete 28795,1 << Human Rogue/KulTiran Rogue --Goblin Assassins (8)
    .complete 28796,1 << Human Warlock/KulTiran Warlock --Goblin Assassins (8)
    .complete 28797,1 << Human Warrior/KulTiran Warrior --Goblin Assassins (8)
    .complete 29081,1 << !Human !KulTiran --Goblin Assassins (8)
    .complete 31144,1 << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman --Goblin Assassins (8)
    .mob Goblin Assassin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕克斯顿修士|r和|cRXP_FRIENDLY_维里副队长|r交谈
    .turnin 28806 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Hunter/KulTiran Hunter
    .turnin 28808 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Mage/KulTiran Mage
    .turnin 28809 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Paladin
    .turnin 28810 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Priest/KulTiran Priest
    .turnin 28811 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Rogue/KulTiran Rogue
    .turnin 28812 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warlock/KulTiran Warlock
    .turnin 28813 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warrior/KulTiran Warrior
    .turnin 29082 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << !Human !KulTiran
    .turnin 63447 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .goto 425,35.16,38.03
    .target +Brother Paxton
    .turnin 28791 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Hunter/KulTiran Hunter
    .turnin 28792 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Mage/KulTiran Mage
    .turnin 28793 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Paladin
    .turnin 28794 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Priest/KulTiran Priest
    .turnin 28795 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Rogue/KulTiran Rogue
    .turnin 28796 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Warlock/KulTiran Warlock
    .turnin 28797 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Warrior/KulTiran Warrior
    .turnin 29081 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << !Human !KulTiran
    .turnin 31144 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .accept 28817 >>接任务: |cRXP_WARN_后方已经安全|r << Human Hunter/KulTiran Hunter
    .accept 28818 >>接任务: |cRXP_WARN_后方已经安全|r << Human Mage/KulTiran Mage
    .accept 28819 >>接任务: |cRXP_WARN_后方已经安全|r << Human Paladin
    .accept 28820 >>接任务: |cRXP_WARN_后方已经安全|r << Human Priest/KulTiran Priest
    .accept 28821 >>接任务: |cRXP_WARN_后方已经安全|r << Human Rogue/KulTiran Rogue
    .accept 28822 >>接任务: |cRXP_WARN_后方已经安全|r << Human Warlock/KulTiran Warlock
    .accept 28823 >>接任务: |cRXP_WARN_后方已经安全|r << Human Warrior/KulTiran Warrior
    .accept 29083 >>接任务: |cRXP_WARN_后方已经安全|r << !Human !KulTiran
    .accept 31145 >>接任务: |cRXP_WARN_后方已经安全|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .goto 425,35.2,39.87
    .target +Sergeant Willem
step
    #completewith next
    #label Blackrock Invasion
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r和|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 28817 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Hunter
    .turnin 28818 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Mage
    .turnin 28819 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Paladin
    .turnin 28820 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Priest
    .turnin 28821 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Rogue
    .turnin 28822 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Warlock
    .turnin 28823 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Warrior
    .turnin 29083 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << !Human
    .turnin 31145 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Death Knight/Human Monk
    .accept 26389 >>接任务: |cRXP_WARN_黑石兽人的入侵|r
    .disablecheckbox
    .accept 26391 >>接任务: |cRXP_WARN_灭火拯救希望|r
    .disablecheckbox
    .target +Marshal McBride
    .target +Milly Osworth
    .use 11192
    .use 57256
step
    #hidewindow
    #completewith Blackrock Invasion
    .goto 425,34.28,47.86,30,0
    .goto 425,33.2,53.95,20 >>1
step
    #requires Blackrock Invasion
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r和|cRXP_FRIENDLY_米莉·奥斯沃斯|r交谈
    .turnin 28817 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Hunter
    .turnin 28818 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Mage
    .turnin 28819 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Paladin
    .turnin 28820 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Priest
    .turnin 28821 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Rogue
    .turnin 28822 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Warlock
    .turnin 28823 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Warrior
    .turnin 29083 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << !Human
    .turnin 31145 >>交任务: |cRXP_FRIENDLY_后方已经安全|r << Human Death Knight/Human Monk
    .accept 26389 >>接任务: |cRXP_WARN_黑石兽人的入侵|r
    .goto 425,33.32,53.48
    .target +Marshal McBride
    .accept 26391 >>接任务: |cRXP_WARN_灭火拯救希望|r
    .goto 425,33.48,54.53
    .target +Milly Osworth
step
    #completewith next
    #hidewindow
    #label Vineyard Fire extinguished
    >>使用并引导 |T308321:0|t[米莉的灭火器] 靠近|cRXP_PICK_Vineyard 火焰|r
    .complete 26391,1 --Vineyard Fire extinguished (8)
step <<!Hunter
    .xp >10,1
    #completewith Vineyard Fire extinguished
    .goto 425,49.53,76.72,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Blackrock Worg
    .mob Blackrock Spy
step <<Hunter
    .xp >10,1
    #completewith Vineyard Fire extinguished
    .goto 425,40.24,64.95,20,0
    .goto 425,49.53,76.72,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .cast 1515 >>施放 |T132164:0|t[驯服野兽]于|cRXP_ENEMY_黑石座狼|r上以驯服它
    -- .usespell 1515
    .mob Blackrock Worg
step
    #requires Vineyard Fire extinguished
    #hidewindow
    #completewith Vineyard Fire extinguished2
    #loop
    .goto 425,51.97,82.49,30,0
    .goto 425,54.93,77.08,30,0
    .goto 425,56.27,73.85,30,0
    .goto 425,52.89,69.85,30,0
    .goto 425,50.66,73.13,30,0
    .goto 425,54.35,85.81,30,0
    .goto 425,59.31,77.29,30,0
    +1
step
    #requires Vineyard Fire extinguished
    #completewith next
    #label Blackrock Orc Weapon
    >>击杀|cRXP_ENEMY_黑石侵略者|r. 击败后可获得 |T:0|t[|cRXP_LOOT_黑石兽人的武器|r]
    .complete 26389,1 --Blackrock Orc Weapon (8)
    .mob Blackrock Invader
step
    #requires Vineyard Fire extinguished
    >>使用 |T250627:0|t[米莉的灭火器] 并将其施放在火焰上
    .complete 26391,1 --Vineyard Fire extinguished (8)
    .use 58362
step
    #label Vineyard Fire extinguished2
    >>击杀|cRXP_ENEMY_黑石侵略者|r. 击败他们后可获得 |T250627:0|t[|cRXP_LOOT_黑石兽人的武器|r]
    .complete 26389,1 --Blackrock Orc Weapon (8)
    .mob Blackrock Invader
step
    #completewith next
    #label Ending the Invasion!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉·奥斯沃斯|r和|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 26391 >>交任务: |cRXP_FRIENDLY_灭火拯救希望|r
    .turnin 26389 >>交任务: |cRXP_FRIENDLY_黑石兽人的入侵|r
    .accept 26390 >>接任务: |cRXP_WARN_终结入侵！|r
    .target Milly Osworth
    .target Marshal McBride
step
    .xp >10,1
    #completewith Ending the Invasion!
    .goto 425,33.38,54.67,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Blackrock Worg
    .mob Blackrock Spy
step
    #requires Ending the Invasion!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉·奥斯沃斯|r和|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 26391 >>交任务: |cRXP_FRIENDLY_灭火拯救希望|r
    .goto 425,33.38,54.67
    .target +Milly Osworth
    .turnin 26389 >>交任务: |cRXP_FRIENDLY_黑石兽人的入侵|r
    .accept 26390 >>接任务: |cRXP_WARN_终结入侵！|r
    .goto 425,33.49,53.86
    .target +Marshal McBride
step
    #completewith next
    #label Kurtok the Slayer
    .goto 425,37.85,56.24,20,0
    .goto 425,43.03,55.88,20,0
    >>击杀|cRXP_ENEMY_屠杀者库尔托克|r
    .complete 26390,1 --Kill Kurtok the Slayer (1)
    .mob Kurtok the Slayer
step
    #completewith Kurtok the Slayer
    .goto 425,64.97,48.38,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Blackrock Worg
    .mob Blackrock Spy
    .mob Blackrock Invader
    .use 11475
step
    #requires Kurtok the Slayer
    .goto 425,64.97,48.38
    >>击杀|cRXP_ENEMY_屠杀者库尔托克|r
    .complete 26390,1 --Kill Kurtok the Slayer (1)
    .mob Kurtok the Slayer
step
    #completewith next
    #label Ending the Invasion!
    .goto 425,43.03,55.88,20,0
    .goto 425,37.85,56.24,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 26390 >>交任务: |cRXP_FRIENDLY_终结入侵！|r
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .disablecheckbox
    .target Marshal McBride
step
    #completewith Ending the Invasion!
    .goto 425,33.92,53.68,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Blackrock Worg
    .mob Blackrock Spy
    .mob Blackrock Invader
step
    #requires Ending the Invasion!
    .goto 425,33.92,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官玛克布莱德|r交谈
    .turnin 26390 >>交任务: |cRXP_FRIENDLY_终结入侵！|r
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .target Marshal McBride
step
    #completewith next
    #label Rest and Relaxation
    .goto 425,28.6,74.34,18,0
    .goto 425,23.55,75.01,22,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .accept 37112 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
step
    #completewith Rest and Relaxation
    .goto 37,45.42,48.8,20 >>离开北郡谷
    .use 85575
    .use 133699
step
    #requires Rest and Relaxation
    .goto 37,45.42,48.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔坎·伊森斯泰德|r交谈
    .accept 37112 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
]])

--Human Elwynn Forest
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AC) 人类 艾尔文森林
#displayname |cFF00CCFF2|r - 艾尔文森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor Human !DK/KulTiran DK/DarkIronDwarf DK/LightforgedDraenei DK/Mechagnome DK/VoidElf DK/Pandaren
#next BA)艾尔文森林

<< Alliance

step <<Human/KulTiran
    #hidewindow
    .countdown 1 >>1
step <<Human/KulTiran
    #completewith next
    #hidewindow
    #label Marshal Dughan
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .disablecheckbox
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
    .disablecheckbox
	.target Marshal Dughan
step <<Human/KulTiran
    #completewith Marshal Dughan
    .goto 37,41.715,64.636,100 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Mangy Wolf
    .mob Cutpurse
    .mob Forest Spider
    .mob Young Wolf
step <<Human/KulTiran
    #requires Marshal Dughan
    #completewith next
    #label Goldshire Flight Path1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target Marshal Dughan
step <<Human/KulTiran
    #requires Marshal Dughan
    #completewith Goldshire Flight Path1
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的巴特利|r交谈
    .fp Goldshire, Elwynn >>获取闪金镇飞行路线
	.target Bartlett the Brave
step <<Human/KulTiran
    #requires Marshal Dughan
    #requires Goldshire Flight Path1
    .goto 37,42.08,65.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
step <<!Human/!KulTiran
    #completewith next
    #label Goldshire Flight Path
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target Marshal Dughan
step <<!Human/!KulTiran
    #completewith Goldshire Flight Path
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的巴特利|r交谈
    .fp Goldshire, Elwynn >>获取闪金镇飞行路线
	.target Bartlett the Brave
step <<!Human/!KulTiran
    #requires Goldshire Flight Path
    .goto 37,42.08,65.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
step <<Human/KulTiran
    .goto 37,42.08,65.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target Marshal Dughan
    .isOnQuest 54
step <<Human/KulTiran
    .goto 37,42.08,65.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target Marshal Dughan
    .isNotOnQuest 54
step << Human/KulTiran
    .goto 37,41.82,65.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
    .accept 26393 >>接任务: |cRXP_LOOT_快递消息|r
	.target Smith Argus
step << Human/KulTiran
    #completewith next
    #label Goldshire Flight Path2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的巴特利|r交谈
	.turnin 26393 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 26394 >>接任务: |cRXP_WARN_前往暴风城|r
	.target Bartlett the Brave
step <<Human/KulTiran
    #completewith Goldshire Flight Path2
    .goto 37,41.81,64.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的巴特利|r交谈
    .fp Goldshire, Elwynn >>获取闪金镇飞行路线
	.target Bartlett the Brave
step << Human/KulTiran
    #requires Goldshire Flight Path2
    .goto 37,41.81,64.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勇敢的巴特利|r交谈
	.turnin 26393 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 26394 >>接任务: |cRXP_WARN_前往暴风城|r
	.target Bartlett the Brave
step
    #completewith next
    #label Kobold Candles
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
	.target William Pestle
step
    #completewith Kobold Candles
    .goto 37,43.2,65.76,5,0
    .goto 37,43.29,66.12,5,0
    .goto 37,43.3,65.93,3 >>进入旅店
step
    #requires Kobold Candles
    .goto 37,43.3,65.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
    .use 57389
	.target William Pestle

-- =================
-- === DMF Human ===
-- =================


step
    #completewith next
    #label Rest and Relaxation2
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .isOnQuest 37112
    .dmf
step
    #completewith Rest and Relaxation2
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .home >>将你的[炉石]设置为狮子的尊严旅店
	.target Innkeeper Farley
    .dmf
step
    #requires Rest and Relaxation2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .buy 1645,5
	.target Innkeeper Farley
    .dmf
step
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .buy 1645,5
    .home >>将你的[炉石]设置为狮子的尊严旅店
	.target Innkeeper Farley
    .dmf

-- ====================
-- === NO DMF HUMAN ===
-- ====================

step
    #completewith next
    #label Rest and Relaxation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .nodmf
    .isOnQuest 37112
step
    #completewith Rest and Relaxation
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .home >>将你的[炉石]设置为狮子的尊严旅店
	.target Innkeeper Farley
    .nodmf
step
    .goto 37,43.63,65.87
    #requires Rest and Relaxation
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .nodmf
    .isOnQuest 37112

-- ===========
-- === DMF ===
-- ===========


step
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .home >>将你的[炉石]设置为狮子的尊严旅店
	.target Innkeeper Farley
    .subzoneskip 5637,1
    .dmf 

-- ==============
-- === NO DMF ===
-- ==============

step
    .goto 37,43.63,65.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|旅店老板法雷|r|交谈
    .home >>将你的[炉石]设置为狮子的尊严旅店
	.target Innkeeper Farley
    .subzoneskip 5637,1,1
    .nodmf




-- ===================
-- === DMF COOKING ===
-- ===================

step
    #completewith next
    #label Cooking
    .goto 37,43.98,66.05,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托马斯|r交谈
    .train 2550 >>学习烹饪技能
	.target Tomas
    .dmf
step
    #completewith Cooking
    #hidewindow
    .goto 37,44.37,65.99,20 >>1
step
    #requires Cooking
    .goto 37,44.37,65.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托马斯|r交谈
    .train 2550 >>学习烹饪技能
	.target Tomas
    .dmf
    .dmf
step
    #completewith next
    #label Remy "Two Times"
    .goto 37,43.23,65.95,5,0
    .goto 37,43.13,65.74,5,0
    .goto 37,42.93,65.71,6,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r“两倍”交谈
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
	.target Remy "Two Times"
step
    #completewith Remy "Two Times"
    .goto 37,42.24,67.1,30 >>离开旅店
step
    #requires Remy "Two Times"
    .goto 37,42.24,67.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r“两倍”交谈
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
	.target Remy "Two Times"
step
    #completewith next
    #label Julia Stevens
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
    .daily 31693 >>接任务: |cRXP_WARN_茱莉亚·史蒂文斯|r
    .train 125610,3
	.target Julia Stevens
    .isQuestTurnedIn 31889,31891,31902,31903
step
    #completewith Julia Stevens
    .goto 37,41.66,83.67,60 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .use 57395
    .mob Stonetusk Boar
    .mob Kobold Tunneler
step
    #requires Julia Stevens
    .goto 37,41.66,83.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
    .daily 31693 >>接任务: |cRXP_WARN_茱莉亚·史蒂文斯|r
    .train 125610,3
	.target Julia Stevens
    .isQuestTurnedIn 31889,31891,31902,31903
step
    .goto 37,41.66,83.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
    *|cRXP_WARN_Defeat her in a Pet Battle|r.
    .complete 31693,1 --Defeat Julia Stevens
	.target Julia Stevens
    .skipgossipid 40127
    .isOnQuest 31693
step
    .goto 37,41.66,83.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茱莉亚·史蒂文斯|r交谈
    .turnin 31693 >>交任务: |cRXP_FRIENDLY_茱莉亚·史蒂文斯|r
	.target Julia Stevens
    .isQuestComplete 31693
step
    #completewith next
    #label Large Candle
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败他们后搜刮出 |T133848:0|t[|cRXP_LOOT_金砂|r] 和 |T133750:0|t[|cRXP_LOOT_大蜡烛|r]
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    #completewith Large Candle
    .goto 37,39.13,83.16,20,0
    .goto 38,41.17,84.24,5 >>进入矿井
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    *|cRXP_WARN_[RARE]|r Check for |cRXP_ENEMY_Narg the Taskmaster|r near the Mine. Kill |cRXP_ENEMY_Narg|r if he's up.
    .use 57395
	.unitscan Narg the Taskmaster
step
    #requires Large Candle
    #completewith next
    #label 穿越矿井
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败他们后搜刮出 |T133848:0|t[|cRXP_LOOT_金砂|r] 和 |T133750:0|t[|cRXP_LOOT_大蜡烛|r]
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    #requires Large Candle
    #completewith 穿越矿井
    .goto 38,45.04,64.28,15,0
    .goto 38,50.1,54.38
    >>穿越矿井
    .complete 62,1 --Scout through the Fargodeep Mine
step
    #requires 穿越矿井
    #completewith next
    .goto 38,53.11,39.87,20,0
    .goto 39,63.2,24.25,20,0
    .goto 39,78.6,29.79,20,0
    .goto 39,58.12,83.78,20,0
    .goto 39,42.72,67.38,20,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r. 击败他们后搜刮出 |T133848:0|t[|cRXP_LOOT_金砂|r] 和 |T133750:0|t[|cRXP_LOOT_大蜡烛|r]
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    #requires 穿越矿井
    #hidewindow
    #completewith next
    #label Princess Must Die!2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.target Ma Stonefield
step
    #requires 穿越矿井
    #completewith Princess Must Die!2
    .goto 37,38.22,81.62,15 >>通过后方隧道离开矿井
step
    #requires Princess Must Die!2
    #hidewindow
    #completewith next
    #label Princess Must Die!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.target Ma Stonefield
step
    #requires Princess Must Die!2
    #completewith Princess Must Die!
    .goto 37,38.18,82.22,10,0
    .goto 37,38.22,83.41,40 >>|cRXP_WARN_[稀有与宝藏]|r在矿场附近寻找|cRXP_PICK_宝藏|r和|cRXP_ENEMY_监工纳尔格|r. 点击宝藏并击杀监工纳尔格(若他们出现)——|cRXP_WARN_两者都会提供大量经验值|r
	.unitscan Narg the Taskmaster
step
    #requires Princess Must Die!
    #loop
    .goto 37,36.9,83.02,30,0
    .goto 37,36.69,84.64,30,0
    .goto 37,36.38,82.09,30,0
    .goto 37,37.08,80.53,30,0
    .goto 37,39.25,83.08,30,0
    .goto 37,39.8,84.12,30,0
    .goto 37,38.96,85.48,30,0
    .goto 37,37.67,87.08,30,0
    >>击杀狗头人隧道工和狗头人矿工. 击败他们后, 搜刮出 [大蜡烛和金砂]
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    .goto 37,34.66,84.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.target Ma Stonefield
step
    #completewith next
    #label Princess
    >>击杀|cRXP_ENEMY_公主|r. 搜刮她的 |T133345:0|t[|cRXP_LOOT_黄铜项圈|r]
    .complete 88,1 --1/1 Brass Collar
	.mob Princess
step
    #completewith Princess
    .goto 37,33.64,87.76,15 >>|cRXP_WARN_[宝箱]|r检查马厩内的|cRXP_PICK_Chest|r, 如果它出现了就去拾取. |cRXP_WARN_它会提供大量经验值|r 
step
    #requires Princess
    .goto 37,32.57,85.16
    >>击杀|cRXP_ENEMY_公主|r. 搜刮她的 |T133345:0|t[|cRXP_LOOT_黄铜项圈|r]
    .complete 88,1 --1/1 Brass Collar
	.mob Princess
step
    .goto 37,34.53,84.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r
	.target Ma Stonefield
-- step
--     .goto 37,30.81,64.65,40 >>|cRXP_WARN_[稀有]|r检查是否有|cRXP_ENEMY_狡猾的莫加尼|r. 如果她还在, 就杀了她|r, |cRXP_WARN_因为她会掉落大量经验值|r 
--     .unitscan Morgaine the Sly
-- step
--     .goto 37,27.22,67.51,40 >>|cRXP_WARN_[稀有]|r检查是否有|cRXP_ENEMY_灰斑熊大本|r. 如果他在, 就杀了他|r, |cRXP_WARN_因为他会掉落大量经验值|r 
-- 	.unitscan Grizzled Ben
step
    #completewith next
    #label Hogger
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通缉海报|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
step
    #completewith Hogger
    .goto 37,24.66,74.88,65 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Riverpaw Runt
    .mob Stonetusk Boar
step
    #requires Hogger
    .goto 37,24.66,74.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通缉海报|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
step
    .goto 37,24.33,74.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
	.target Deputy Rainer
step
    #hidewindow
    #completewith Treasure2
    #label Gruff Swiftbite
    .complete 176,1 --1/1 Dealt with "The Hogger Situation"
step
    #completewith next
    >>击杀|cRXP_ENEMY_河爪豺狼人前锋|r和|cRXP_ENEMY_矮小的河爪豺狼人|r. 击败它们后搜刮出 |T133693:0|t[|cRXP_LOOT_彩色豺狼人臂章|r]
    .complete 11,1 --8/8 Painted Gnoll Armband
	.mob *Riverpaw Outrunner
	.mob *Riverpaw Runt
step
    #completewith Gruff Swiftbite
    #label Treasure2
    .goto 37,27.75,88.42,30,0
    .goto 37,25.3,90.13,30,0
    .goto 37,25.23,93.25,20 >>|cRXP_WARN_[稀有 & 宝藏]|r在营地中寻找|cRXP_PICK_宝箱|r和|cRXP_ENEMY_格拉夫·疾齿|r 
    *Click on the treasure and kill |cRXP_ENEMY_Gruff|r if they are up — |cRXP_WARN_both give a lot of XP|r
	.unitscan Gruff Swiftbite
step
    #requires Gruff Swiftbite
    .goto 37,24.87,95.07
    >>击败 |cRXP_ENEMY_霍格|r
    .complete 176,1 --1/1 Dealt with "The Hogger Situation"
    .mob Hogger
    .mob Minion of Hogger
step
    .goto 37,24.78,95.26
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_西部荒野地契|r
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
    >>击杀|cRXP_ENEMY_河爪豺狼人前锋|r和|cRXP_ENEMY_矮小的河爪豺狼人|r. 击败它们后搜刮出 |T133693:0|t[|cRXP_LOOT_彩色豺狼人臂章|r]
    .complete 11,1 --8/8 Painted Gnoll Armband
	.mob *Riverpaw Outrunner
	.mob *Riverpaw Runt
step
    #completewith next
    #label Riverpaw Gnoll Bounty
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
	.target Deputy Rainer
step
    #completewith Riverpaw Gnoll Bounty
    .goto 37,24.27,74.66,65 >>|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Riverpaw Runt
    .mob Stonetusk Boar
    .mob Riverpaw Outrunner
    .mob Longsnout
step
    #requires Riverpaw Gnoll Bounty
    .goto 37,24.27,74.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔副队长|r交谈
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
	.target Deputy Rainer
step
    .goto 52,60.86,18.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老马当劳|r交谈
    .daily 31780 >>接任务: |cRXP_WARN_老马当劳|r
    .train 125610,3
	.target Old MacDonald
    .isQuestTurnedIn 31889,31891,31902,31903
step
    .goto 52,60.86,18.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_老马当劳|r交谈
    *|cRXP_WARN_Defeat him in a Pet Battle|r.
    .complete 31780,1 --Defeat Old MacDonald
	.target Old MacDonald
    .skipgossipid 65648
    .isOnQuest 31780
step
    .goto 52,60.86,18.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_老马当劳 任务弹出窗口|r并提交任务
    .turnin 31780 >>交任务: |cRXP_FRIENDLY_老马当劳|r
	.target Old MacDonald
    .isQuestComplete 31780
step
    .goto 52,60.09,19.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r交谈
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .turnin 26378 >>交任务: |cRXP_FRIENDLY_英雄的召唤：西部荒野！|r
    .accept 26209 >>接任务: |cRXP_WARN_他们把谋杀案撂我这儿了|r
	.target Lieutenant Horatio Laine
step
    #loop
    .goto 52,58.23,18.12,0
    .goto 52,58.56,16.21,20,0
    .goto 52,59.18,18.16,20,0
    .goto 52,58.12,19.58,20,0
    .goto 52,57.31,18.33,20,0
    .goto 52,58.56,16.21,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Citizens|r交谈, 用他们的 [|cRXP_LOOT_Clues|r] 支付报酬
    *|cRXP_WARN_ignore them if they turn hostile if you can|r.
    .complete 26209,1 --1/1 Clue #1 obtained
    .complete 26209,2 --1/1 Clue #2 obtained
    .complete 26209,3 --1/1 Clue #3 obtained
    .complete 26209,4 --1/1 Clue #4 obtained
	.target Homeless Stormwind Citizen
	.target West Plains Drifter
    .target Transients
    .skipgossip 42383,1 --Transient
    .skipgossip 42384,1 --Homeless Stormwind Citizen
    .skipgossip 42386,1 --Homeless Stormwind Citizen
    .skipgossip 42391,1 --West Plains Drifter
step
    .goto 52,60.05,19.28,5,0
    .goto 52,60.18,19.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r交谈
    .turnin 26209 >>交任务: |cRXP_FRIENDLY_他们把谋杀案撂我这儿了|r
    .accept 26213 >>接任务: |cRXP_WARN_重要线索：河爪氏族|r
	.target Lieutenant Horatio Laine
step
    #completewith next
    #label Riverpaw Gnoll Clue
    >>击杀|r河爪斥候|r和|r河爪豺狼人|r. 击败它们后搜刮出[|r河爪豺狼人线索|r]
    .complete 26213,1 --1/1 Riverpaw Gnoll Clue
	.mob Riverpaw Scout
	.mob Riverpaw Gnoll
step
    #completewith Riverpaw Gnoll Clue
    .goto 52,56.32,13.54,20 >>|cRXP_WARN_[宝箱]|r检查营地中是否有|cRXP_PICK_Chest|r
step
    #requires Riverpaw Gnoll Clue
    #loop
    .goto 52,56.46,13.26,0
    .goto 52,58.16,10.71,40,0
    .goto 52,57.17,15.12,40,0
    .goto 52,51.38,15.89,40,0
    .goto 52,50.68,14.77,40,0
    .goto 52,56.46,13.26,40,0
    >>击杀|r河爪斥候|r和|r河爪豺狼人|r. 击败它们后搜刮出[|r河爪豺狼人线索|r]
    .complete 26213,1 --1/1 Riverpaw Gnoll Clue
	.mob Riverpaw Scout
	.mob Riverpaw Gnoll
step
    .goto 52,59.97,19.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r交谈
    .turnin 26213 >>交任务: |cRXP_FRIENDLY_重要线索：河爪氏族|r
    .target Lieutenant Horatio Laine
step
    #completewith next
    #label Lion's Pride Inn
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .target William Pestle
step
    #completewith Lion's Pride Inn
    .hs >>传送至狮子的尊严旅店
step
    #requires Lion's Pride Inn
    .goto 37,43.45,65.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉·匹斯特|r交谈
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .target William Pestle
step
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .goto 37,43.18,66.03,5,0
    .goto 37,43.16,65.63,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r和|r治安官杜汉|r交谈
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
	.target +Remy "Two Times"
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .disablecheckbox
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .disablecheckbox
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
	.target +Marshal Dughan
	.isOnQuest 40
step
	.isOnQuest 40
    #completewith 交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .goto 37,42.86,65.71,10 >>离开旅店
step
    #requires 交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r和|r治安官杜汉|r交谈
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .goto 37,42.22,67.06
	.target +Remy "Two Times"
step
    .goto 37,42.11,65.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
	.target +Marshal Dughan
	.isOnQuest 40
step
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .goto 37,43.18,66.03,5,0
    .goto 37,43.16,65.63,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r和|r治安官杜汉|r交谈
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
	.target +Remy "Two Times"
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
	.target +Marshal Dughan
step
	.isOnQuest 40
    #completewith 交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .goto 37,42.86,65.71,5 >>离开旅店
step
    .goto 37,42.22,67.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r和|r治安官杜汉|r交谈
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
	.target +Remy "Two Times"
step
    .goto 37,42.16,66.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
	.target +Marshal Dughan











    
step
    #optional
    .goto 37,52.25,62.90,40 >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_啜泣者残爪|r. 如果他还在, 就杀掉他|r
	.unitscan Lamepaw the Whimperer
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,57.49,64.61,45 >>|cRXP_WARN_[CHEST] Scan the murloc islands with your mouse for a|r |cRXP_PICK_Chest|r. Your mouse will become a |TInterface/cursor/crosshair/interact.blp:20|tgear icon if there's a |cRXP_PICK_Chest|r. If you find one. Loot it if it's up|r.
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,66.51,63.83,40 >>|cRXP_WARN_[稀有] 检查|cRXP_ENEMY_塔兰蒂斯|r. 如果他在, 就杀掉他|r
	.unitscan Tarantis
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,64.7,56.73,30 >>|cRXP_WARN_[箱子] 检查哥布林营地内的|cRXP_PICK_箱子|r. 如果存在, 请拾取|r
    .isOnQuest 35
    .noflyable
step
    #completewith next
    .goto 37,61.65,53.93,12,0
    .goto 40,48.05,87.33
    .subzone 54 >>进入青金石矿洞
step
    .goto 40,44.22,67.89,12,0
    .goto 40,38.71,60.84,12,0
    .goto 40,35.92,52.81
    >>沿着贾斯珀洛德矿井内的中路前进
    .complete 76,1 --Scout Through the Jasperlode Mine (1)
step
    #optional
	.goto 40,31.02,37.51,20,0
    .goto 40,37.01,50.26,20,0
    .goto 40,47.25,36.66,20,0
    .goto 40,53.93,30.58,20,0
    .goto 40,45.14,21.76,20 >>|cRXP_WARN_[稀有] 检查贾斯珀洛德矿洞后方的|cRXP_ENEMY_母蜘蛛|r, 如果她出现, 请将其击杀|r
	.unitscan Mother Fang
    .isOnQuest 35
    .noflyable
step
    #completewith next
    .goto 37,61.58,70.04,0
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .isOnQuest 35
    .skill riding,75,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r和|cRXP_FRIENDLY_悬赏榜|r交谈
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
    .goto 37,73.973,72.177
	.target +Guard Thomas
    .accept 46 >>接任务: |cRXP_WARN_悬赏鱼人|r
    .accept 26152 >>接任务: |cRXP_WARN_通缉：詹姆斯·克拉克|r
    .goto 37,74.025,72.310
step
    #completewith next
    >>击杀|cRXP_ENEMY_觅食的灰狼|r 和|cRXP_ENEMY_灰森林狼|r
    >>杀死你看到的任何森林熊幼崽
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*Gray Forest Wolf
    .complete 52,2 --Kill Young Forest Bear (5)
    .mob +Young Forest Bear
step
    #optional
    .goto 37,82.95,84.82,40 >>|cRXP_WARN_[稀有] 检查 |cRXP_ENEMY_灌尾|r. 如果他在, 就杀掉他|r
    .isOnQuest 52
	.unitscan Bushtail
    .noflyable
step
	#completewith next
    .goto 37,75.71,86.29,0
    >>击杀|cRXP_ENEMY_鱼人强盗|r和|cRXP_ENEMY_鱼人潜伏者|r. 击杀后搜刮他们的 [|cRXP_LOOT_破损的鱼人鳞片|r]
    .complete 46,1,4 --Torn Murloc Fin (4/8)
    .mob Murloc Forager
    .mob Murloc Lurker
step
    .goto 37,75.71,86.29,30,0
    .goto 37,77.55,85.75
    .deathskip >>击杀|cRXP_ENEMY_鱼人强盗|r和|cRXP_ENEMY_鱼人潜伏者|r时, 死亡并前往|cRXP_FRIENDLY_灵魂医者|r处复活
    .isOnQuest 46
    .skill riding,75,1
step
    .goto 37,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉里克·费恩|r交谈
    .vendor 1198 >>NPC与修理
	.target Rallic Finn
	.isOnQuest 52
    .noflyable --Azeroth Flying
step
    .goto 37,79.462,68.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .accept 83 >>接任务: |cRXP_WARN_红色亚麻布|r
    .target Sara Timberlain
step
    .goto 37,78.87,67.20,10,0
    .goto 37,78.637,67.157
    >>击杀|r|cRXP_FRIENDLY_詹姆斯·克拉克|r, 从他身上搜刮|[|cRXP_LOOT_詹姆斯·克拉克的头颅|r和|T134939:0|t|cRXP_LOOT_采金日程表|r]
    >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_采金日程表|r] 开始任务|r
    .complete 26152,1 --James Clark's Head (1)
    .collect 1307,1,123,1 --Gold Pickup Schedule (1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .mob James Clark
    .use 1307
step
    .goto 37,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r交谈
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
    .target Supervisor Raelen
step
    .goto 37,81.860,66.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特森上校|r交谈
    .turnin 26152 >>交任务: |cRXP_FRIENDLY_通缉：詹姆斯·克拉克|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .accept 147 >>接任务: |cRXP_WARN_猎杀收货人|r
    .target Marshal Patterson
step
    #completewith StoneCairn
    .goto 37,81.72,58.57,0
    .goto 37,77.99,60.59,0
    .goto 37,71.58,60.84,0
    .goto 37,74.75,67.13,0
    .goto 37,87.15,64.63,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r 和|cRXP_ENEMY_灰森林狼|r
    >>杀死你看到的任何森林熊幼崽
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*Gray Forest Wolf
    .complete 52,2 --Kill Young Forest Bear (5)
    .mob +Young Forest Bear
step
    #completewith MurlocFins
    .goto 37,80.88,53.78,0
    .goto 37,80.63,62.25,0
    .goto 37,82.79,60.12,0
    >>在树旁边的地面上掉落 [|cRXP_LOOT_木头捆|r]
    .complete 5545,1 -- Bundle of Wood (8)
step
    #label LostGuards
    .goto 37,72.653,60.323
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_被吃掉一半的尸体|r
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
    #label StoneCairn
    .goto 37,79.795,55.510
    .subzone 86 >>前往石冢湖
    .isOnQuest 45
step
    #sticky
    #label MurlocFins
    #loop
    .goto 37,78.837,55.770,0
    .waypoint 37,80.004,53.783,40,0
    .waypoint 37,79.222,54.041,40,0
    .waypoint 37,78.554,55.834,40,0
    .waypoint 37,77.474,57.257,40,0
    .waypoint 37,77.991,58.108,40,0
    .waypoint 37,79.370,57.016,40,0
    >>击杀|cRXP_ENEMY_鱼人强盗|r和|cRXP_ENEMY_鱼人潜伏者|r. 击杀后搜刮他们的 [|cRXP_LOOT_破损的鱼人鳞片|r]
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_鱼人强盗|r会施放|r|T135915:0|t[饮用小型治疗药水]|cRXP_WARN_, 这将使他们恢复61-68点生命值|r
    .complete 46,1 --Torn Murloc Fin (8)
    .mob Murloc Forager
    .mob Murloc Lurker
step
    .goto 37,79.795,55.510
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_罗尔夫的尸体|r
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step
    #sticky
    #label PTFrontier
    #requires MurlocFins
    #loop
    .goto 37,81.72,58.57,0
    .goto 37,77.99,60.59,0
    .goto 37,71.58,60.84,0
    .goto 37,74.75,67.13,0
    .goto 37,87.15,64.63,0
    .waypoint 37,81.72,58.57,60,0
    .waypoint 37,77.99,60.59,60,0
    .waypoint 37,71.58,60.84,60,0
    .waypoint 37,74.75,67.13,60,0
    .waypoint 37,87.15,64.63,60,0
    >>击杀|cRXP_ENEMY_觅食的灰狼|r 和|cRXP_ENEMY_灰森林狼|r
    >>杀死你看到的任何森林熊幼崽
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*Gray Forest Wolf
    .complete 52,2 --Kill Young Forest Bear (5)
    .mob +Young Forest Bear
step
    #loop
    #requires MurlocFins
    .goto 37,80.88,53.78,0
    .goto 37,80.63,62.25,0
    .goto 37,82.79,60.12,0
    .goto 37,80.88,53.78,20,0
    .goto 37,80.48,55.18,20,0
    .goto 37,79.79,56.71,20,0 --Not Exact
    .goto 37,79.04,59.56,20,0
    .goto 37,77.30,59.56,20,0 --Not Exact/Real
    .goto 37,77.18,60.65,20,0 --Not Exact/Real
    .goto 37,76.75,61.76,20,0
    .goto 37,77.13,63.00,20,0
    .goto 37,78.38,62.35,20,0
    .goto 37,79.30,63.34,20,0
    .goto 37,80.24,61.47,20,0
    .goto 37,80.63,62.25,20,0
    .goto 37,81.57,62.64,20,0
    .goto 37,81.27,61.59,20,0
    .goto 37,82.00,61.01,20,0
    .goto 37,83.27,61.12,20,0
    .goto 37,84.20,61.55,20,0
    .goto 37,83.85,60.48,20,0
    .goto 37,82.79,60.12,20,0
    >>在树旁边的地面上掉落 [|cRXP_LOOT_木头捆|r]
    .complete 5545,1 -- Bundle of Wood (8)
step << skip
    #requires MurlocFins
    #completewith next
    .goto 37,77.65,57.70
    >>|cRXP_WARN_Skip this if you're not low on health|r
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    .goto 37,73.973,72.177
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵托马斯|r交谈
    .turnin 46 >>交任务: |cRXP_FRIENDLY_悬赏鱼人|r
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r
    .target Guard Thomas
step
    #completewith Morgan
    .goto 37,68.56,82.68,0
    .goto 37,67.63,78.01,0
    .goto 37,68.23,76.33,0
    .goto 37,71.31,76.93,0
    .goto 37,71.81,78.51,0
    >>击杀内部的 |cRXP_ENEMY_迪菲亚强盗|r和 |cRXP_ENEMY_埃尔兰·杜德摩尔|r以及 |cRXP_ENEMY_苏伦娜·凯尔东|r. 从他们身上搜刮 [|cRXP_LOOT_红色亚麻面罩|r]
    .complete 83,1 --Collect Linen Scrap (6)
    .mob Bandit
    .mob Erlan Drudgemoor
    .mob Surena Caledon
step
    #optional
    #label Morgan
    .goto 37,71.02,80.67
    >>击杀 |cRXP_ENEMY_收货人莫根|rinside. 击杀后搜刮出 [|cRXP_LOOT_The Collector's Ring|r] 和 [|cRXP_LOOT_红色亚麻面罩|r]
    >>|cRXP_WARN_[宝箱] 检查房屋内及周围的|cRXP_PICK_宝箱|r, 如果可用则拾取它
    .complete 147,1 --The Collector's Ring (1)
    .complete 83,1 --Collect Linen Scrap (6)
    .disablecheckbox
    .mob Morgan the Collector
    .itemcount 1019,<6
    .isOnQuest 83
step
    .goto 37,71.02,80.67
    >>击杀 |cRXP_ENEMY_收货人莫根|rinside, 击败他后搜刮出 [|cRXP_LOOT_The Collector's Ring|r]
    >>|cRXP_WARN_[宝箱] 检查房屋内及周围的|cRXP_PICK_宝箱|r, 如果可用则拾取它
    .complete 147,1 --The Collector's Ring (1)
    .mob Morgan the Collector
step
    #optional
    #sticky
    #label Snoot
    .goto 37,69.32,79.31,30 >>|cRXP_WARN_[稀有] 检查是否存在|cRXP_ENEMY_刨根者阿呆|r. 如果他在场, 请击杀他|r
	.unitscan Snoot the Rooter
    .isOnQuest 83
    .noflyable
step
    #loop
    .goto 37,68.56,82.68,0
    .goto 37,67.63,78.01,0
    .goto 37,68.23,76.33,0
    .goto 37,71.31,76.93,0
    .goto 37,71.81,78.51,0
    .goto 37,70.62,80.73,50,0
    .goto 37,68.56,82.68,50,0
    .goto 37,67.83,80.86,50,0
    .goto 37,67.63,78.01,50,0
    .goto 37,68.55,77.39,50,0
    .goto 37,68.23,76.33,50,0
    .goto 37,70.97,77.21,10,0
    .goto 37,71.31,76.93,10,0
    .goto 37,70.84,78.22,50,0
    .goto 37,71.81,78.51,50,0
    >>击杀 |cRXP_ENEMY_迪菲亚强盗|r. 击败他们以获取 [|cRXP_LOOT_红色亚麻面罩|r]
    >>|cRXP_WARN_[箱子] 检查谷仓内及周围的 |cRXP_PICK_箱子|r. 如果存在, 请拾取|r
    .complete 83,1 --Collect Linen Scrap (6)
    .mob Bandit
step
    #completewith next
    #requires Snoot
    .goto 37,75.71,86.29,30,0
    .goto 37,77.55,85.75,-1
    .goto 37,83.68,69.74,-1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
    .isOnQuest 83
    .skill riding,75
step
    #requires Snoot
    .goto 37,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉里克·费恩|r交谈
    .vendor 1198 >>NPC与修理
	.target Rallic Finn
    .isOnQuest 83
    .noflyable --Azeroth Flying
step << !DarkIronDwarf !KulTiran !LightforgedDraenei !Mechagnome !VoidElf
    .goto 37,81.829,66.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迅翼高斯|r交谈
    .fp Eastvale Logging Camp >>获取东谷伐木场的飞行点路线
	.target Goss the Swift
step
    .goto 37,81.860,66.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕特森上校|r交谈
    .turnin 147 >>交任务: |cRXP_FRIENDLY_猎杀收货人|r
    .target Marshal Patterson
step
    .goto 37,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_管理员莱琳|r交谈
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
    .target Supervisor Raelen
step
    .goto 37,79.462,68.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉·迪博雷恩|r交谈
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
    .target Sara Timberlain
]])

--Night Elf Shadowglen
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AB) 幽影谷
#displayname 幽影谷 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor NightElf !DemonHunter !DK
#next AC) 夜精灵泰达希尔

<< Alliance

step
    .xp >10,1
    .goto 460,45.54,74.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .accept 28713 >>接任务: |cRXP_LOOT_自然的平衡|r
	.target Ilthalaine
step
    .xp >10,1
    #loop
    .goto 460,51.1,78.12,40,0
    .goto 460,43.45,83.69,40,0
    .goto 460,41.56,70.52,40,0
    .goto 460,37.46,78.38,40,0
    .goto 460,33.54,67.31,40,0
    .goto 460,39.8,62.47,40,0
    >>击杀|cRXP_ENEMY_夜刃豹幼崽|r
    .complete 28713,1 --6/6 Young Nightsaber slain
	.mob Young Nightsaber
step
    .xp >10,1
    .goto 460,45.62,74.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 28713 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .accept 28714 >>接任务: |cRXP_WARN_腐化的魔苔|r
	.target Ilthalaine
step
    .xp >10,1
    .goto 460,45.72,73.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    .accept 28715 >>接任务: |cRXP_WARN_恶魔窃贼|r
	.target Melithar Staghelm
step
    .xp >10,1
    #completewith next
    #optional
    #hidewindow
    #label Fel Moss
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后拾取 |T134186:0|t[|cRXP_LOOT_魔苔|r]
    .complete 28714,1 --6/6 Fel Moss
step
    .xp >10,1
    #completewith Fel Moss
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,36.55,79.72,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
step
    .xp >10,1
    #requires Fel Moss
    #hidewindow
    #completewith Grell
    #loop
    .goto 460,36.55,79.72,20,0
    .goto 460,34.34,80.69,20,0
    .goto 460,33.23,77.07,10,0
    .goto 460,35.31,76.52,20,0
    .goto 460,31.06,72.32,40,0
    .goto 460,31.78,68.8,40,0
    +1
step
    .xp >10,1
    #optional
    #requires Fel Moss
    #completewith next
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后拾取 |T134186:0|t[|cRXP_LOOT_魔苔|r]
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    .xp >10,1
    #requires Fel Moss
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_梅利塔尔的被盗背包|r
    .complete 28715,1 --5/5 Melithar's Stolen Bags
step
    .xp >10,1
    #label Grell
    >>击杀|cRXP_ENEMY_小劣魔|r和|cRXP_ENEMY_劣魔|r. 击败它们后拾取 |T134186:0|t[|cRXP_LOOT_魔苔|r]
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    .xp >10,1
    #completewith next
    #label Demonic Thieves
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    .turnin 28715 >>交任务: |cRXP_FRIENDLY_恶魔窃贼|r
	.target Melithar Staghelm
step
    .xp >10,1
    #completewith Demonic Thieves
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,45.96,73.38,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
step
    .xp >10,1
    #requires Demonic Thieves
    .goto 460,45.96,73.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦利萨尔·鹿盔|r交谈
    .turnin 28715 >>交任务: |cRXP_FRIENDLY_恶魔窃贼|r
	.target Melithar Staghelm
step
    .xp >10,1
    .goto 460,45.96,73.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员伊尔萨莱恩|r交谈
    .turnin 28714 >>交任务: |cRXP_FRIENDLY_腐化的魔苔|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
	.target Ilthalaine
step
    .xp >10,1
    #completewith next
    #optional
    #label Moon
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28723 >>交任务: |cRXP_FRIENDLY_月神女祭司|r
    .accept 28724 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
	.target Dentaria Silverglade
step
    .xp >10,1
    #completewith Moon
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,42.55,61.85,10,0
    .goto 460,42.69,50.87,70 >>跟随箭头指引
step
    .xp >10,1
    #requires Moon
    .goto 460,42.69,50.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28723 >>交任务: |cRXP_FRIENDLY_月神女祭司|r
    .accept 28724 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
	.target Dentaria Silverglade
step
    .xp >10,1
    #loop
    .goto 460,43.54,51.84,10,0
    .goto 460,42.18,52.95,10,0
    .goto 460,41.09,56.9,10,0
    .goto 460,40.75,53.28,10,0
    .goto 460,40.01,52.28,10,0
    .goto 460,39.53,50.64,10,0
    .goto 460,40.62,49.01,10,0
    .goto 460,42.09,49.73,10,0
    .goto 460,40.68,47.18,10,0
    .goto 460,43.26,44.89,10,0
    .goto 460,43.65,46.67,10,0
    .goto 460,46.13,48.39,10,0
    .goto 460,47.17,48.81,10,0
    .goto 460,47.1,50.11,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Moonpetal Lilies|r
    .complete 28724,1 -- 7/7 Moonpetal Lily
step
    .xp >10,1
    .goto 460,42.25,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28724 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .accept 28725 >>接任务: |cRXP_LOOT_森林守护者|r
	.target Dentaria Silverglade
step
    .xp >10,1
    #optional
    #completewith next
    #label Woodland Protector
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈 
    *|cRXP_WARN_She will appear at the entrance of the cave|r.
    .turnin 28725 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .accept 28726 >>接任务: |cRXP_WARN_树林蜘蛛的腐蚀|r
    .disablecheckbox
	.target Tarindrella
step
    .xp >10,1
	#completewith Woodland Protector
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,40.68,42.49,20,0
    .goto 58,45.06,84.11,20 >>进入|cRXP_WARN_Cave|r
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
    .mob Thistle Boar
step
    .xp >10,1
    #requires Woodland Protector
    .goto 58,44.98,83.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r交谈
    *|cRXP_WARN_She might dissappear if you go too far away from the cave|r.
    .turnin 28725 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .accept 28726 >>接任务: |cRXP_WARN_树林蜘蛛的腐蚀|r
	.target Tarindrella
-- step
--     #completewith next
--     #hidewindow
--     #label Webwood Spider
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与你旁边的|cRXP_FRIENDLY_塔琳德拉|r交谈
--     .turnin 28726 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的腐蚀|r
--     .accept 28727 >>接任务: |cRXP_WARN_邪恶的触摸|r
--     .disablecheckbox
-- 	.target Tarindrella
step
    .xp >10,1
    #optional
    #completewith next
    #label Webwood Spider
    >>在跟随路线时击杀树林蜘蛛
    .complete 28726,1 --12/12 Webwood Spider slain
	.mob Webwood Spider
step
    .xp >10,1
    #completewith Webwood Spider
    .goto 58,39.52,62.81,30,0
    .goto 58,32.22,46.27,30,0
    .goto 58,39.62,34.28,10 >>跳下悬崖 << !Hunter
    *|cRXP_WARN_Drag|r |T132294:0|t[Disengage] |cRXP_WARN_onto your Action Bars|r. << Hunter
    .goto 58,39.62,34.28,10 >>将自己背靠悬崖边缘站立 << Hunter
    .goto 58,41.28,28.46,10 >>使用 |T132294:0|t[闪避] 跳到最近的平台 << Hunter
step << Hunter
    .xp >10,1 
    #requires Webwood Spider 
    .goto 58,41.19,16.74,20,0
    .goto 58,51.51,27.33,20,0
    .goto 58,56.8,26.03,10,0
    .goto 58,56.34,41.54,20,0
    .goto 58,41.6,34.04,20,0
    .goto 58,33.87,18.02,10,0
    .goto 58,39.63,14.64,10,0
    >>击杀剩余的|cRXP_ENEMY_树林蜘蛛|r
    *|cRXP_WARN_Avoid killing |cRXP_ENEMY_Githyiss the Vile|r if possible, as you will need him later|r.
    .complete 28726,1 --12/12 Webwood Spider slain
	.mob Webwood Spider
step <<!Hunter
    .xp >10,1 
    #requires Webwood Spider
    #loop
    .goto 58,41.6,34.04,20,0
    .goto 58,33.87,18.02,10,0
    .goto 58,39.63,14.64,10,0
    .goto 58,51.51,27.33,20,0
    .goto 58,56.8,26.03,10,0
    .goto 58,56.34,41.54,20,0
    >>击杀剩余的|cRXP_ENEMY_树林蜘蛛|r
    *|cRXP_WARN_Avoid killing |cRXP_ENEMY_Githyiss the Vile|r if possible, as you will need him later|r.
    .complete 28726,1 --12/12 Webwood Spider slain
	.mob Webwood Spider
step
    .xp >10,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r|cRXP_WARN_就在你身边|r交谈
    *|cRXP_WARN_She might be stuck somewhere|r
    .turnin 28726 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的腐蚀|r
    .accept 28727 >>接任务: |cRXP_WARN_邪恶的触摸|r
	.target Tarindrella
step
    .xp >10,1
    .goto 58,44.8,29.1
    >>击杀邪恶的基塞伊斯
    .complete 28727,1 --1/1 Githyiss the Vile slain
	.mob Githyiss the Vile
step
    .xp >10,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔琳德拉|r|cRXP_WARN_就在你身边|r交谈
    .turnin 28727,1 >>交任务: |cRXP_FRIENDLY_邪恶的触摸|r
    .accept 28728 >>接任务: |cRXP_WARN_未来的征兆|r
	.target Tarindrella
step
    .xp >10,1
    .goto 460,42.50,50.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28728 >>交任务: |cRXP_FRIENDLY_未来的征兆|r
    .accept 28729 >>接任务: |cRXP_WARN_泰达希尔：艾泽拉斯之冠|r
	.target Dentaria Silverglade
step
    .xp >10,1
    #optional
    #completewith next
    #label Filled Crystal Phial
    >>使用 |T967530:0|t[水晶瓶] |cRXP_WARN_near 月亮井|r
    .complete 28729,1 --1/1 Filled Crystal Phial
    .use 5185
step << !Hunter
    .xp >10,1 
	#completewith Filled Crystal Phial
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,49.97,34.37,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
    .mob Thistle Boar
step << Hunter
    .xp >10,1 
	#completewith Filled Crystal Phial
    .goto 460,49.97,34.37
	*|cRXP_WARN_Drag|r |T132161:0|t[Call Pet] |cRXP_WARN_and|r |T132179:0|t[Pet Utility] |cRXP_WARN_onto your Action Bars|r.
    .cast 1515 >>施放 |T132164:0|t[驯服野兽] 作用于|cRXP_ENEMY_癞皮夜刃豹|r, 以驯服它
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .usespell 1515
	.mob Mangy Nightsaber
step
    .xp >10,1
    #requires Filled Crystal Phial
    .goto 460,49.97,34.37
    >>使用 |T967530:0|t[水晶瓶] |cRXP_WARN_near 月亮井|r
    .complete 28729,1 --1/1 Filled Crystal Phial
    .use 5185
step
    .xp >10,1
    #optional
    #completewith next
    #label Crown of Azeroth
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28729 >>交任务: |cRXP_FRIENDLY_泰达希尔：艾泽拉斯之冠|r
    .accept 28730 >>接任务: |cRXP_WARN_珍贵的水|r
    .disablecheckbox
	.target Dentaria Silverglade
step
    .xp >10,1
	#completewith Crown of Azeroth
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,42.49,50.49,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
    .mob Thistle Boar
step
    .xp >10,1
    #requires Crown of Azeroth
    .goto 460,42.49,50.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
    .turnin 28729 >>交任务: |cRXP_FRIENDLY_泰达希尔：艾泽拉斯之冠|r
    .accept 28730 >>接任务: |cRXP_WARN_珍贵的水|r
	.target Dentaria Silverglade
step
    .xp >10,1
    #optional
    #completewith next
    #label Precious Waters
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特纳隆·雷拳|r交谈
    .turnin 28730 >>交任务: |cRXP_FRIENDLY_珍贵的水|r
    .accept 28731 >>接任务: |cRXP_WARN_泰达希尔：传递信息|r
	.target Tenaron Stormgrip
step
    .xp >10,1
    #completewith Precious Waters
    .goto 460,41.78,63.83,15,0
    .goto 460,43.41,58.86,10,0
    .goto 460,44.56,54.51,10,0
    .goto 460,46.18,53.36,10,0
    .goto 460,44.59,57.67,10,0
    .goto 460,44.87,60.29,10,0
    .goto 460,46.14,60.77,10,0
    .goto 460,47.86,58.81,10,0
    .goto 460,48.5,55.37,10,0
    .goto 460,47.97,54.61,5 >>爬上树的坡道
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
    .mob Thistle Boar
step
    .xp >10,1
    #requires Precious Waters
    .goto 460,47.37,55.68
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特纳隆·雷拳|r交谈
    .turnin 28730 >>交任务: |cRXP_FRIENDLY_珍贵的水|r
    .accept 28731 >>接任务: |cRXP_WARN_泰达希尔：传递信息|r
	.target Tenaron Stormgrip
step
    .xp >10,1
    #optional
    #hidewindow
    #completewith next
    #label Dolanaar Delivery
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
step
    .xp >10,1
    #completewith Dolanaar Delivery
    #title Jump off the Tree.
    .goto 460,48.12,54.41,8,0
    .goto 460,48.96,56.98,10,0
    .goto 460,49.51,59.39,10 >>你获得了减速效果, 不会死亡
step
    .xp >10,1
    #optional
    #requires Dolanaar Delivery
    #completewith next
    #label Dolanaar Delivery2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
step
    .xp >10,1
    #requires Dolanaar Delivery
    #completewith Dolanaar Delivery2
    #title |cFFFCDC00跟随箭头指引|r
    .goto 460,54.79,86.2,5,0
    .goto 57,60.39,45.13,10,0
    .goto 57,60.35,45.81,10,0
    .goto 57,60.35,45.81,10,0
    .goto 460,54.7,84.79,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Young Nightsaber
    .mob Young Thistle Boar
    .mob Grell
	.mob Grellkin
    .mob Strigid Owl
    .mob Thistle Boar
step
    .xp >10,1
    #requires Dolanaar Delivery2
    .goto 460,54.7,84.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
]])

--Night Elf Teldrassil
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AC) 夜精灵泰达希尔
#displayname |cFF00CCFF2|r - 泰达希尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor NightElf !DemonHunter !DK
#next BA)艾尔文森林

<< Alliance

step
    .xp >10,1
    .goto 460,54.57,84.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯萨努斯|r交谈
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
step
    .xp >10,1
    #optional
    #completewith next
    #label Zenn's Bidding
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
	.target Zenn Foulhoof
step
    .xp >10,1
    #completewith Zenn's Bidding
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,59.56,49.09,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
step
    .xp >10,1
    #requires Zenn's Bidding
    .goto 57,59.56,49.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
	.target Zenn Foulhoof
step
    .xp >10,1
    #loop
    .goto 57,60.93,54.2,40,0
    .goto 57,57.41,53.02,40,0
    .goto 57,57.14,48.36,40,0
    .goto 57,59.54,47.9,40,0
    >>击杀|cRXP_ENEMY_树林潜伏者|r和|cRXP_ENEMY_夜刃豹|r和|cRXP_ENEMY_巨翼枭|r. 沿路追踪时, 从它们身上获取|T133725:0|t[|cRXP_LOOT_夜刃豹的牙齿|r]和|T135975:0|t[|cRXP_LOOT_巨翼枭的羽毛|r]和|T135975:0|t[|cRXP_LOOT_树林蜘蛛丝|r]
    .complete 488,1 --2/2 Nightsaber Fang
    .complete 488,2 --2/2 Strigid Owl Feather
    .complete 488,3 --2/2 Webwood Spider Silk
	.mob Nightsaber Fang
	.mob Strigid Owl Feather
	.mob Webwood Spider
step
    .xp >10,1
    .goto 57,59.49,49.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
    .target Zenn Foulhoof
step
    .xp >10,1
    #optional
    #completewith next
    #label Seek Redemption!
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
	.target Syral Bladeleaf
step
    .xp >10,1
    #completewith Seek Redemption!
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,59.1,49.97,10,0
    .goto 57,55.84,50.39,40 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
	.mob Nightsaber Fang
	.mob Strigid Owl Feather
	.mob Webwood Spider
step
    .xp >10,1
    #requires Seek Redemption!
    .goto 57,55.84,50.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
	.target Syral Bladeleaf
step
    .xp >10,1
    .goto 57,55.58,50.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
	.target Tallonkai Swiftroot
step
    .xp >10,1
    #optional
    #completewith next
    #hidewindow
    #label A Troubling Breeze
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
	.target Athridas Bearmantle
step
    .xp >10,1
    #completewith A Troubling Breeze
    .goto 57,55.48,50.43
    .fp Dolanaar, Teldrassil >>获取|cRXP_WARN_多兰纳尔飞行路径|r
	.target Fidelio
step
    .xp >10,1
    #optional
    #completewith next
    #label A Troubling Breeze2
    #requires A Troubling Breeze
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
	.target Athridas Bearmantle
step
    .xp >10,1
    #requires A Troubling Breeze
    #completewith A Troubling Breeze2
    .goto 57,55.23,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦丽娜|r交谈
    .train 125610 >>训练 |T643856:0|t[宠物战斗训练]
    .skipgossipid 41206
    .target Valeena
step
    .xp >10,1
    #requires A Troubling Breeze2
    .goto 57,55.77,51.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
	.target Athridas Bearmantle
step
    .xp >10,1
	#completewith next
    .goto 57,55.93,52.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊兰尼斯·影花|r交谈
    .train 2366 >>训练 |T4620675:0|t[草药学]
	.skipgossip 47420,1,1,1
	.target Iranis Shadebloom
step
    .xp >10,1
    .goto 57,55.93,52.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊兰尼斯·影花|r交谈
    .train 2575 >>训练 |T4620679:0|t[采矿]
	.skipgossip 47420,2,3,2
	.target Iranis Shadebloom
step
    .xp >10,1
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .home >>将你的[炉石]设置为多兰纳尔
	.target Innkeeper Keldamyr
step
    .xp >10,1
    .goto 57,55.46,52.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板凯达米尔|r交谈
    .turnin 2159,1 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r
	.target Innkeeper Keldamyr
step
    .xp >10,1
    #optional
    #completewith next
    +|cRXP_WARN_Herbing 草药和采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r.
step
    .xp >10,1
    .goto 57,55.82,53.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 28731 >>交任务: |cRXP_FRIENDLY_泰达希尔：传递信息|r
    .accept 929 >>接任务: |cRXP_WARN_大地之冠|r
	.target Corithras Moonrage
step
    .xp >10,1
    #completewith next
    #label Fel Cone
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔锥果|r
    .complete 489,1 --3/3 Fel Cone
step
    .xp >10,1
    #completewith Fel Cone
    #hidewindow
    .goto 57,56.5,55.69,20,0
    .goto 57,56.97,55.44,20,0
    .goto 57,56.76,54.68,20 >>1
step
    .xp >10,1
    #requires Fel Cone
    .goto 57,56.8,53.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈欧玛|r交谈
    .accept 6344 >>接任务: |cRXP_WARN_尼莎·影歌|r
	.target Nyoma
step
    .xp >10,1
    #optional
    #completewith next
    #label Cooking
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔锥果|r
    .complete 489,1 --3/3 Fel Cone
step
    .xp >10,1
    #completewith Cooking
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎瑞恩|r交谈
    .train 2550 >>训练 |T4620671:0|t[烹饪]
    .target Zarrin
step
    #requires Cooking
    .xp >10,1
    #loop
    .goto 57,58.24,53.93,10,0
    .goto 57,58.36,54.46,10,0
    .goto 57,58.3,53.43,10,0
    .goto 57,59.35,54.4,10,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔锥果|r
    .complete 489,1 --3/3 Fel Cone
step
    .xp >10,1
    #optional
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_寻求救赎！|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .target Zenn Foulhoof
step
    .xp >10,1
    #completewith 交任务: |cRXP_FRIENDLY_寻求救赎！|r
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,59.51,49.25,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Webwood Lurker
    .mob Strigid Owl
    .mob Nightsaber
step
    .xp >10,1
    #requires 交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .goto 57,59.51,49.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
    .target Zenn Foulhoof
step
    .xp >10,1
    #optional
    #completewith next
    #label Filled Jade Phial
    >>使用 |T967530:0|t[翡翠瓶] |cRXP_WARN_near the 月亮井|r
    .complete 929,1 --1/1 Filled Jade Phial
    .use 5619
step
    .xp >10,1
    #completewith Filled Jade Phial
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,62.03,50.54,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Webwood Lurker
    .mob Strigid Owl
    .mob Nightsaber
step
    .xp >10,1
    #requires Filled Jade Phial
    .goto 57,62.03,50.54
    >>使用 |T967530:0|t[翡翠瓶] |cRXP_WARN_near the 月亮井|r
    .complete 929,1 --1/1 Filled Jade Phial
    .use 5619
step
    .xp >10,1
    #requires Jade Phial
    #completewith next
    #label in A Troubling Breeze
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r交谈
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
	.target Gaerolas Talvethren
step
    .xp >10,1
    #requires Jade Phial
    #completewith in A Troubling Breeze
    .goto 57,63.27,50.36,10,0
    .goto 57,64.53,51.47,10,0
    .goto 57,64.9,51.61,5,0
    .goto 57,64.84,51.36,5,0
    .goto 57,64.6,51.16,5 >>检查房屋内|cRXP_WARN_inside| 的宝箱
    .mob Gnarlpine Gardener
    .mob Gnarlpine Warrior
    .mob Gnarlpine Ursa
step
    .xp >10,1    
    #requires in A Troubling Breeze
    .goto 57,64.6,51.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r交谈
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
	.target Gaerolas Talvethren
step
    .xp >10,1
    #optional
    #completewith next
    #label Emerald Dreamcatcher
    #hidewindow
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tailonkai的梳妆台|r
    .complete 2438,1 --1/1 Emerald Dreamcatcher
step
    .xp >10,1
    #completewith Emerald Dreamcatcher
    .goto 57,65.36,49.97,40,0
    .goto 57,65.69,51.85,40 >>检查|cRXP_ENEMY_Uruson(稀有)|r是否在房屋之间巡逻
	.unitscan Uruson
step
    .xp >10,1
    #optional
    #requires Emerald Dreamcatcher
    #completewith next
    #label Emerald Dreamcatcher2
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tailonkai的梳妆台|r
    .complete 2438,1 --1/1 Emerald Dreamcatcher
step
    .xp >10,1
    #requires Emerald Dreamcatcher
    #completewith Emerald Dreamcatcher2
    .goto 57,66.07,51.92,8 >>进入房屋
step
    .xp >10,1
    #requires Emerald Dreamcatcher2
    .goto 57,66.11,52.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Tailonkai的梳妆台|r
    .complete 2438,1 --1/1 Emerald Dreamcatcher
step
    .xp >10,1
    #optional
    #completewith next
    #label Teldrassil: The Refusal of the Aspects
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
step
    .xp >10,1
    -- .subzoneskip 186
    .goto 57,64.73,52.37
    #completewith Teldrassil: The Refusal of the Aspects
    >>|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .deathskip >>死亡并重生|cRXP_WARN_在灵魂医者|r
step
    .xp >10,1
    #requires Teldrassil: The Refusal of the Aspects
    .goto 57,55.87,54.01
    -- #completewith next
    -- #label Teldrassil: The Refusal of the Aspects2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
    .target Corithras Moonrage
-- step
--     #requires Teldrassil: The Refusal of the Aspects
--     .xp >10,1
--     .subzoneskip 260
--     .goto 57,55.86,55.28
--     #completewith Teldrassil: The Refusal of the Aspects2
--     >>|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
--     .deathskip >>死亡并重生|cRXP_WARN_在灵魂医者|r
-- step
--     .xp >10,1
--     #requires Teldrassil: The Refusal of the Aspects2
--     .goto 57,55.88,54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科瑞萨斯·月怒|r交谈
--     .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
--     .target Corithras Moonrage
step
    .xp >10,1
    #optional
    #completewith next
    #label Head to the Objective
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_奇怪的果树|r
    .accept 930 >>接任务: |cRXP_LOOT_发光的水果|r
    .target Strange Fruited Plant
step
    .xp >10,1
    #completewith Head to the Objective
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,57.6,62.74,60 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Webwood Lurker
    .mob Strigid Owl
    .mob Nightsaber
step
    .xp >10,1
    #requires Head to the Objective
    .goto 57,57.6,62.74
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_奇怪的果树|r
    .accept 930 >>接任务: |cRXP_LOOT_发光的水果|r
    .target Strange Fruited Plant
step
    .xp >10,1
    #optional
    #completewith next
    #label Glowing Fruit
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 930 >>交任务: |cRXP_FRIENDLY_发光的水果|r
    .target Denalan
 step
    .xp >10,1
    #completewith Glowing Fruit
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,58.05,62.22,10,0
    .goto 57,58.65,62.06,10,0
    .goto 57,59.95,59.78,80 >>前往目标地点
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Timberling
step
    .xp >10,1
    #requires Glowing Fruit
    .goto 57,59.9,59.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德纳兰|r交谈
    .turnin 930 >>交任务: |cRXP_FRIENDLY_发光的水果|r
    .target Denalan
step
    .xp >10,1
    #optional
    #completewith next
    #label Gnarlpine Corruption
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
	.target Athridas
step
    .xp >10,1
    #completewith Gnarlpine Corruption
    .hs >>使用 |T134414:0|t[炉石]
step
    .xp >10,1
    #requires Gnarlpine Corruption
    .goto 57,55.69,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
	.target Athridas
step
    .xp >10,1
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲德利奥|r 交谈
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    -- .accept 6341 >>接任务: |cRXP_WARN_泰达希尔的渔业|r
	.target Fidelio
-- step
--     #completewith next
--     #label 交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tallonkai|r交谈
--     .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
--     .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r
-- 	.target Tallonkai
-- step
--     #hidewindow
--     #completewith 交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
--     .goto 57,55.79,50.31,10 >>1
step
    #xprate <1.21
    .xp >10,1
    .goto 57,55.78,50.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .accept 13946 >>接任务: |cRXP_WARN_自然的报复|r
    .target Syral Bladeleaf
step
    #xprate <1.21
    .xp >10,1
    .goto 57,55.62,50.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
    .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r
    .accept 932 >>接任务: |cRXP_LOOT_扭曲的仇恨|r
    .target Tallonkai Swiftroot
step
    #xprate <1.21
    #optional
    .xp >10,1
    #completewith next
    #label Fel Rock
    #hidewindow
    .complete 932,1 --1/1 Melenas' Head
    .mob Rascal Sprite
    .mob Shadow Sprite
step
    #xprate <1.21
    .xp >10,1
    #completewith Fel Rock
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,56.9,49.05,10,0
    .goto 57,56.49,47.84,10,0
    .goto 59,77.79,86.06,20 >>进入洞穴
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .mob Strigid Owl
    .mob Nightsaber
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock
    #completewith Fel Rock4
    >>使用 |T134217:0|t[怒根之种] 并将其放置在 |cRXP_ENEMY_Sprites|r 上, 消灭它们
    .complete 13946,1 --12/12 Fel Rock grellkin killed with Ireroot Seeds
    .mob Rascal Sprite
    .mob Shadow Sprite
step
    #xprate <1.21
    #optional
    .xp >10,1
    #completewith next
    #label Fel Rock2
    #hidewindow
    .complete 932,1 --1/1 Melenas' Head
    .mob Rascal Sprite
    .mob Shadow Sprite
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock
    #completewith Fel Rock2
    .goto 59,77.18,61.91,10,0
    .goto 59,57.29,60.13,10,0
    .goto 59,43.59,53.44,10 >>|cRXP_WARN_检查|cRXP_ENEMY_特雷吉尔(稀有)|r
    .mob Threggil
    .unitscan Threggil
step
    #xprate <1.21
    .xp >10,1
    #optional
    #requires Fel Rock2
    #hidewindow
    #completewith next
    #label Fel Rock3
    .complete 932,1 --1/1 Melenas' Head
    .mob Rascal Sprite
    .mob Shadow Sprite
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock2
    #completewith Fel Rock3
    .goto 59,42.35,81.29,20,0 
    .goto 59,32.5,81.69,20,0
    .goto 59,31.01,60.8,10 >>在水边寻找一个宝箱
step
    #xprate <1.21
    .xp >10,1
    #optional
    #requires Fel Rock3
    #completewith next
    #label Fel Rock4
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 搜刮其尸体, 获取 |T134161:0|t[|cRXP_LOOT_迈雷纳斯的头颅|r]
    .complete 932,1 --1/1 Melenas' Head
    .mob Lord Melenas
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock3
    #completewith Fel Rock4
    .goto 59,35.32,44.93,20,0
    .goto 59,26.74,47.21,5,0
    .goto 59,23.34,46.51,5,0
    .goto 59,20.76,43.33,8 >>跳上山丘
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock4
    .goto 59,20.76,43.33
    >>击杀|cRXP_ENEMY_迈雷纳斯|r. 从他身上搜刮 |T134161:0|t[|cRXP_LOOT_Melenas' Head|r]
    .complete 932,1 --1/1 Melenas' Head
    .mob Lord Melenas
step
    #xprate <1.21
    .xp >10,1
    #requires Fel Rock3
    #loop
    .goto 59,27.8,50.91,20,0
    .goto 59,17.63,50.41,20,0
    .goto 59,16.94,63.62,20,0
    .goto 59,32.69,79.56,20,0
    .goto 59,35.32,44.93,20,0
    >>使用 |T134217:0|t[怒根之种] 并将其放置在 |cRXP_ENEMY_Sprites|r 上, 消灭它们
    .complete 13946,1 --12/12 Fel Rock grellkin killed with Ireroot Seeds
    .mob Rascal Sprite
    .mob Shadow Sprite
step
    #xprate <1.21
    .xp >10,1
    #optional
    #completewith next
    #hidewindow
    #label Nature's Reprisal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .turnin 13946 >>交任务: |cRXP_FRIENDLY_自然的报复|r
    .target Syral Bladeleaf
step
    #xprate <1.21
    .xp >10,1
    #completewith Nature's Reprisal
    #loop
    .goto 59,24.23,41.76,5 >>在|cRXP_ENEMY_迈雷纳斯|r附近寻找宝箱
step
    #xprate <1.21
    .xp >10,1
    #optional
    #requires Nature's Reprisal
    #completewith next
    #hidewindow
    #label Nature's Reprisal2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .turnin 13946 >>交任务: |cRXP_FRIENDLY_自然的报复|r
    .target Syral Bladeleaf
step
    #xprate <1.21
    .xp >10,1
    #requires Nature's Reprisal
    #completewith Nature's Reprisal2
    #loop
    .goto 59,15.93,55.43,20,0
    .goto 59,30.97,78.72,10,0
    .goto 59,33.82,52.08,10,0
    >>|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .deathskip >>死亡并重生|cRXP_WARN_在灵魂医者|r
step
    #xprate <1.21
    .xp >10,1
    #optional
    #requires Nature's Reprisal2
    #completewith next
    #label Nature's Reprisal3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .turnin 13946 >>交任务: |cRXP_FRIENDLY_自然的报复|r
    .target Syral Bladeleaf
step
    #xprate <1.21
    .xp >10,1
    #hidewindow
    #title |cFFFCDC00跟随箭头指引|r
    #completewith Nature's Reprisal3
    #requires Nature's Reprisal2
    .goto 57,55.78,52.73,10,0
    .goto 57,55.78,52.17,10,0
    .goto 57,55.82,51.03,10,0
    .goto 57,55.76,50.44,40 >>跟随箭头指引
step
    #xprate <1.21
    .xp >10,1
    #requires Nature's Reprisal3
    .goto 57,55.76,50.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
    .turnin 13946 >>交任务: |cRXP_FRIENDLY_自然的报复|r
    .target Syral Bladeleaf
step
    #xprate <1.21
    .xp >10,1
    .goto 57,55.61,50.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 932 >>交任务: |cRXP_FRIENDLY_扭曲的仇恨|r
    .target Tallonkai Swiftroot
-- step
--     .isQuestComplete 488
--     .goto 57,59.52,49.18
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
--     .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
-- 	.target Zenn Foulhoof
-- step
--     #loop
--     >>击杀|cRXP_ENEMY_树林潜伏者|r和|cRXP_ENEMY_夜刃豹|r和|cRXP_ENEMY_巨翼枭|r. 沿路前进时, 从它们身上搜刮|T133725:0|t[|cRXP_LOOT_夜刃豹的牙齿|r]和|T135975:0|t[巨翼枭的羽毛]和|T135975:0|t[树林蜘蛛丝]
--     .complete 488,1 --2/2 Nightsaber Fang
--     .complete 488,2 --2/2 Strigid Owl Feather
--     .complete 488,3 --2/2 Webwood Spider Silk
-- 	.mob Nightsaber Fang
-- 	.mob Strigid Owl Feather
-- 	.mob Webwood Spider Silk
-- step
--     .goto 57,59.43,49.29
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
--     .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
--     .target Zenn Foulhoof
step
    #loop
    .goto 57,57.31,49.18,20,0
    .goto 57,57.46,48.37,20,0
    .goto 57,58.18,49.43,20,0
    .xp <9.9,1
    .xp 10 >>升级至10级
    .mob Webwood Lurker
    .mob Strigid Owl
    .mob Nightsaber
step
    #optional
    #completewith next
    #label Ferocitas the Dream Eater
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    .xp >10,1
    #completewith Ferocitas the Dream Eater
    #title |cFFFCDC00跟随箭头指引|r
    .goto 57,59.35,48.04,20,0
    .goto 57,65.05,46.72,20,0
    .goto 57,67.26,46.83,50 >>在|cRXP_ENEMY_Ferocitas噬梦者菲罗斯塔|r附近寻找宝箱
    *|cRXP_WARN_如果你无法骑乘, 但在行走时能高效击杀怪物, 那么在移动途中就直接击杀它们|r
    .unitscan Ferocitas the Dream Eater
    .mob Ferocitas the Dream Eater
    .mob Strigid Owl
    .mob Webwood Lurker
step
    .xp >10,1
    #requires Ferocitas the Dream Eater
    .goto 57,67.26,46.83
    >>击杀|cRXP_ENEMY_噬梦者菲罗斯塔|r. 击败他后可获得掉落物品 |T134104:0|t[|cRXP_LOOT_塔隆凯的宝石|r]
    .complete 2459,2 --1/1 Tallonkai's Jewel
	.mob Ferocitas the Dream Eater
	.unitscan Ferocitas
step
    .xp >10,1
    #hidewindow
    #completewith 交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    #loop
    .goto 57,67.57,48.13,30,0
    .goto 57,67.68,46.84,30,0
    .goto 57,67.59,46.02,30,0
    .goto 57,66.42,45.02,30,0
    .goto 57,65.07,44.8,30,0
    .goto 57,65.82,46.12,30,0
    +1
step
    .xp >10,1
    >>击杀|cRXP_ENEMY_瘤背秘法师|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    .xp >10,1
    #optional
    #completewith next
    #label 交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
	.target Tallonkai Swiftroot
step
    .xp >10,1
    #completewith 交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    >>|cRXP_WARN_频繁使用/sit指令或卸下装备会加速你的死亡|r.
    .deathskip >>死亡并重生|cRXP_WARN_在灵魂医者|r
step
    .xp >10,1
    #requires 交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    #optional
    #completewith next
    #label Ferocitas the Dream Eater2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
	.target Tallonkai Swiftroot
step
    .xp >10,1
    #hidewindow
    #requires 交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
    #title |cFFFCDC00跟随箭头指引|r
    #completewith Ferocitas the Dream Eater2
    .goto 57,55.82,52.95,10,0
    .goto 57,55.79,52.12,10,0
    .goto 57,55.71,51.27,10,0
    .goto 57,55.83,50.35,10,0
    .goto 57,55.55,49.99,30 >>跟随箭头指引
step
    .xp >10,1
    #requires Ferocitas the Dream Eater2
    .goto 57,55.55,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔隆凯·捷根|r交谈
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
	.target Tallonkai Swiftroot
step
    .goto 57,55.69,51.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵凯拉·星歌|r交谈
    .accept 13945 >>接任务: |cRXP_WARN_常驻的危险|r
    .target Sentinel Kyra Starsong
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r交谈
    .accept 483 >>接任务: |cRXP_WARN_唤醒圣物|r
    .target Athridas Bearmantle
step
    .goto 57,39.45,29.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .accept 937 >>接任务: |cRXP_LOOT_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
step
    .goto 57,39.19,29.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .accept 2518 >>接任务: |cRXP_LOOT_月神的泪水|r
    .target Priestess A'moora
step
    .goto 57,37.30,25.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奇怪的树木|r交谈
    .accept 931 >>接任务: |cRXP_LOOT_发光的树叶|r
    .target Strange Fronded Plant
step
    .goto 57,34.71,28.35
    .complete 937,1 --6/6 Bloodfeather Belt
step
    .goto 57,39.50,29.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵阿瑞尼亚·碎云|r交谈
    .turnin 937 >>交任务: |cRXP_FRIENDLY_神谕林地|r
    .target Sentinel Arynia Cloudsbreak
step
    .goto 57,40.81,22.43
    .complete 2518,1 --1/1 Silvery Spinnerets
step
    .goto 57,39.25,29.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师A'moora|r交谈
    .turnin 2518 >>交任务: |cRXP_FRIENDLY_月神的泪水|r
    .target Priestess A'moora
step
    #include a) 失落的龙鳞(联盟)
-- step
--     .goto 57,55.72,50.52
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉尔·刃叶|r交谈
--     .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
-- 	.target Syral Bladeleaf
-- step
--     .goto 57,56.76,54.79,40,0
--     .goto 57,56.48,55.73,40,0
--     .goto 57,56.99,55.46,40,0
--     .goto 57,55.19,57.22,40,0
--     .goto 57,53.52,58.94,40,0
--     .goto 57,52.7,59.39,40,0
--     .goto 57,51.98,57.96,40,0
--     .goto 57,50.76,56.8,40,0
--     .goto 57,51.27,55.63,40,0
--     .goto 57,50.76,54.98,40,0
--     .goto 57,52.57,53.56,40,0
--     .goto 57,54.39,54.88,40,0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_魔锥果|r
--     .complete 489,1 --3/3 Fel Cone
-- step
--     .goto 57,59.47,49.24
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
--     .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
--     .target Zenn Foulhoof
-- step
--     .goto 57,55.47,50.42
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲德利奥|r 交谈
--     .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
--     .accept 6341 >>接任务: |cRXP_WARN_泰达希尔的渔业|r
-- 	.target Fidelio
-- step
--     #completewith next
--     .goto 57,55.47,50.42
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲德利奥|r 交谈
--     .fly Darnassus >>飞往达纳苏斯
-- 	.target Fidelio
-- step
--     .goto 89,36.10,53.44
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾奎恩妮|r交谈
--     >>|cRXP_WARN_请勿踏入紫色区域|r
--     .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
--     .accept 6342 >>接任务: |cRXP_WARN_飞往奥伯丁|r
-- 	.target Sister Aquinne
-- step
--     .goto 89,36.59,47.83
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_利奥拉|r交谈
--     .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
--     .accept 6343 >>接任务: |cRXP_WARN_飞回泰达希尔|r
--     .target Leora
-- step
--     #completewith next
--     .goto 89,36.48,50.08,10,0
--     .goto 57,55.42,88.39
--     >>走进|cRXP_WARN_Purple 传送门|r
--     .fp >>获取鲁瑟兰村飞行路径
-- step
-- 	#completewith next
--     .goto 57,55.42,88.40
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维斯派塔斯|r 交谈
--     .fly Lor'danel >>飞往洛丹伦
-- 	.target Vesprystus
-- step
--     .goto 62,51.78,18.01
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
--     .accept 13518 >>接任务: |cRXP_WARN_最后一波幸存者|r
-- 	.target Dentaria Silverglade
-- step
--     .goto 62,50.92,18.88
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_宁莉瑟|r 交谈
--     .vendor 43439 >>|cRXP_WARN_商店与修理|r.
-- 	.target Nyrisse
-- step
--     .goto 62,50.22,19.78
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠 格琳达·纳尔谢|r交谈
--     .accept 13522 >>接任务: |cRXP_WARN_水的威胁|r
-- 	.target Ranger Glynda Nal'Shea
-- step
--     #completewith finalrescue
--     >>击杀|cRXP_ENEMY_邪恶喷涌者|r
--     .complete 13522,1 --8/8 Vile Spray slain
-- 	.mob Vile Spray
-- step
--     .goto 62,45.02,18.17
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
--     .complete 13518,4 --1/1 Volcor rescued
-- 	.target Volcor
-- step
--     .goto 62,44.11,17.79
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gershala|r交谈
--     .complete 13518,2 --1/1 Gershala Nightwhisper rescued
-- 	.target Gershala Nightwhisper
-- step
--     .goto 62,44.58,19.89
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与白爪(|cRXP_FRIENDLY_Whiteclaw|r)对话
--     .complete 13518,1 --1/1 Cerellean Whiteclaw rescued
-- 	.target Cerellean Whiteclaw
-- step
-- 	#label finalrescue
--     .goto 62,42.91,21.51
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙尔迪恩|r交谈
--     .complete 13518,3 --1/1 Shaldyn rescued
-- 	.target Shaldyn
-- step
--     .goto 62,46.22,17.15,40,0
--     .goto 62,44.85,17.07
--     .goto 62,44.06,20.31
--     .goto 62,42.91,21.51
--     .goto 62,46.22,17.15
--     >>击杀|cRXP_ENEMY_邪恶喷涌者|r
--     .complete 13522,1 --8/8 Vile Spray slain
-- 	.target Vile Spray
-- step
--     .goto 62,50.21,19.78
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠 格琳达·纳尔谢|r交谈
--     .turnin 13522 >>交任务: |cRXP_FRIENDLY_水的威胁|r
-- 	.target Ranger Glynda Nal'Shea
-- step
--     .goto 62,51.78,17.99
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德塔莉亚·银林|r交谈
--     .turnin 13518 >>交任务: |cRXP_FRIENDLY_最后一波幸存者|r
-- 	.target Dentaria Silverglade
-- step
--     .goto 62,51.8,18.07
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞蒂亚|r交谈
--     .accept 13520 >>接任务: |cRXP_WARN_海洋的恩赐|r
-- 	.target Serendia
-- step
--     .goto 62,51.14,19.66
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹班恩·曲针|r 交谈
--     .accept 13521 >>接任务: |cRXP_WARN_传声盒413号|r
-- 	.target Wizbang Cranktoggle
-- step
--     #completewith next
--     >>击杀|cRXP_ENEMY_堕落的潮行蟹|r并从它们身上搜刮 [|cRXP_LOOT_堕落潮行蟹的肉片|r ]
--     .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
-- 	.mob Corrupted Tide Crawler
-- step
--     .goto 62,52.41,19.60,20,0
--     .goto 62,52.50,16.62,20,0
--     .goto 62,52.57,17.53,20,0
--     .goto 62,53.18,18.53,20,0
--     .goto 62,52.41,19.60
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_带壳蚌肉|r
--     .complete 13520,1 --16/16 Encrusted Clam Muscle
-- step
--     .goto 62,52.41,19.60,20,0
--     .goto 62,52.50,16.62,20,0
--     .goto 62,52.57,17.53,20,0
--     .goto 62,53.18,18.53,20,0
--     .goto 62,52.41,19.60
--     >>击杀|cRXP_ENEMY_堕落的潮行蟹|r并从它们身上搜刮 [|cRXP_LOOT_堕落潮行蟹的肉片|r ]
--     .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
-- 	.mob Corrupted Tide Crawler
-- step
--     .goto 62,53.24,19.64
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_传声盒413号|r交谈
--     .turnin 13521 >>交任务: |cRXP_FRIENDLY_传声盒413号|r
--     .accept 13527 >>接任务: |cRXP_WARN_食性无常|r
-- step
--     .goto 62,55.1,21.0
--     >>|TInterface/cursor/crosshair/interact.blp:20|t与|cRXP_ENEMY_腐烂蓟熊|r互动
--     .complete 13527,1 --1/1 Foul Bear Carcass Sample
-- 	.target Decomposing Thistle Bear
-- step
--     .goto 62,51.17,19.63
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹班恩·曲针|r 交谈
--     .turnin 13527 >>交任务: |cRXP_FRIENDLY_食性无常|r
--     .accept 13528 >>接任务: |cRXP_WARN_传声盒723号|r
-- 	.target Wizbang Cranktoggle
-- step
--     .goto 62,52.96,25.46,40,0
--     .goto 62,54.02,25.28,40,0
--     .goto 62,55.73,23.95,40,0
--     .goto 62,54.87,27.67,40,0
--     .goto 62,52.96,25.46
--     >>击杀 |cRXP_ENEMY_熊|r 并从它们身上搜刮出 [|cRXP_LOOT_堕落蓟熊的精华|r ]
--     .complete 13528,1 --6/6 Corrupted Thistle Bear Guts
-- 	.mob Corrupted Thistle Bear
-- 	.mob Corrupted Thistle Bear Matriarch
-- 	.mob Thistle Bear Cub
-- step
--     .goto 62,54.17,29.24
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_传声盒723号|r交谈
--     .turnin 13528 >>交任务: |cRXP_FRIENDLY_传声盒723号|r
--     .accept 13554 >>接任务: |cRXP_WARN_黑暗中的解药|r
-- step
--     #label itall
--     .goto 62,56.26,27.41,40,0
--     .goto 62,56.78,30.1
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tharnariun|r交谈
--     .accept 13529 >>接任务: |cRXP_WARN_腐化的源头|r
-- 	.target Tharnariun
-- step
--     #completewith next
-- 	>>击杀|cRXP_ENEMY_邪劣魔|r和|cRXP_ENEMY_邪劣魔|r, 并从它们身上搜刮 [|cRXP_LOOT_脏污的液体|r和|cRXP_LOOT_邪恶腐蚀者的钥匙|r]
-- 	>>|cRXP_WARN_在任务中寻找|cRXP_ENEMY_Licillin(稀有|r. )
--     .complete 13554,1 --6/6 Foul Ichor
--     .complete 13529,2 --8/8 Vile Grell slain
-- 	.collect 44927,1,13557
-- 	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Corruptor's Master Key|r
--     .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r
--     .use 44927
-- 	.mob Vile Grell
-- 	.mob Vile Corruptor
-- 	.unitscan Licillin
-- step
--     .goto 62,57.51,32.31,15,0
--     .goto 62,58.58,32.24,15,0
--     .goto 62,58.13,32.84,15,0
--     .goto 62,57.34,33.00,15,0
--     .goto 62,57.17,32.12,15,0
--     .goto 62,56.97,32.66,15,0
--     .goto 62,56.58,33.64,15,0
--     .goto 62,57.10,34.18
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击洞穴中遍布的|cRXP_PICK_Cages|r|cRXP_WARN_笼子|r
-- 	.complete 13557,1
-- step
--     .goto 62,58.41,33.08
--     >>击杀|cRXP_ENEMY_Zenn|r|cRXP_WARN_inside the Cave|r
--     >>|cRXP_WARN_检查他旁边是否有箱子, 可能不在那里|r.
--     .complete 13529,1 --1/1 Zenn Foulhoof slain
-- 	.mob Zenn Foulhoof
-- step
--     .goto 62,57.51,32.31,30,0
--     .goto 62,58.58,32.24,30,0
--     .goto 62,58.13,32.84,30,0
--     .goto 62,57.34,33.0,30,0
--     .goto 62,57.17,32.12,30,0
--     .goto 62,56.97,32.66,30,0
--     .goto 62,56.58,33.64,30,0
--     .goto 62,57.10,34.18
--     >>击杀|cRXP_ENEMY_邪劣魔|r和|cRXP_ENEMY_邪劣魔|r, 并从它们身上搜刮 [|cRXP_LOOT_脏污的液体|r和|cRXP_LOOT_邪恶腐蚀者的钥匙|r]
--     >>|cRXP_WARN_在任务中寻找|cRXP_ENEMY_Licillin(稀有|r. )
--     .complete 13554,1 --6/6 Foul Ichor
--     .complete 13529,2 --8/8 Vile Grell slain
-- 	.collect 44927,1,13557
-- 	>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Corruptor's Master Key|r
--     .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r
-- 	.mob Vile Grell
-- 	.mob Vile Corrup
-- 	.unitscan Licillin
--     .use 44927
-- step
--     .goto 62,56.79,33.52,20,0
--     .goto 62,57.43,33.75
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击洞穴后方的|cRXP_PICK_恶心的工作台|r
--     .accept 13831 >>接任务: |cRXP_WARN_令人不安的处方|r
-- step
--     #completewith next
--     .deathskip >>死亡并重生 |cFFfa9602rat 灵魂治疗师. |
-- step
--     #completewith next
--     #requires itall
--     .goto 62,51.13,19.71
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
--     .turnin 13557 >>交任务: |cRXP_FRIENDLY_幸运儿|r
--     .turnin 13831 >>交任务: |cRXP_FRIENDLY_幸运儿|r
--     .turnin 13529 >>交任务: |cRXP_FRIENDLY_腐化的源头|r
-- 	.target Tharnariun Treetender
-- step
--     .goto 62,51.14,19.66
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wizbang|r交谈
--     .turnin 13554 >>交任务: |cRXP_FRIENDLY_黑暗中的解药|r
-- 	.target Wizbang
-- step
--     .goto 62,50.90,18.13
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞蒂亚·橡语|r交谈, 她正在旅店的楼梯间来回巡逻
--     .turnin 13520 >>交任务: |cRXP_FRIENDLY_海洋的恩赐|r
-- 	.target Serendia Oakwhisper
-- step
--     #completewith next
--     .hs >>炉火|cRXP_WARN_到多兰纳尔|r.
-- step
--     .goto 57,56.73,53.51
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈欧玛|r交谈
--     .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
-- 	.target Nyoma
-- step
--     .goto 57,59.51,49.1
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赛恩·腐蹄|r交谈
--     .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
-- 	.target Zenn Foulhoof
-- step
-- 	#completewith next
--     .goto 57,55.49,50.46
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲德利奥|r 交谈
--     .fly Darnassus >>飞往达纳苏斯|r
-- 	.target Fidelio
-- step
--     #veteran
--     .goto 89,56.58,60.73,10,0
--     .goto 89,54.82,59.18
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
--     >>|cRXP_WARN_ 建议使用另一个拥有至少10,000金币的角色登录. 用该角色购买物品后, 再将它们发送过来|r
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师|r交谈
--     .collect 71715,1
--     .collect 71638,1
--     .collect 71637,1
--     .collect 71636,1
--     .collect 71635,1
--     .collect 71952,1
--     .collect 71951,1
--     .collect 71953,1
--     .collect 71716,1
--     .target Auctioneer Tolon
--     .target Auctioneer Golothas
--     .target Auctioneer Cazarez
--     .target Auctioneer Golothas
-- step
--     #fresh
--     #completewith DarkMoonFaire
--     +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
-- step
--     #completewith next
--     .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_点击此文本以接收一个宏, 该宏将取消学习您的专业技能|r
--     .dmf
-- step
--     #label DarkMoonFaire
--     .goto 89,38.58,49.38
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
-- 	.target Darkmoon Faire Mystic Mage
--     .dmf
-- step
--     .goto 89,38.58,49.38
--     +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
--     .skipgossip
--     .zoneskip 37
--     .dmf
-- 	.target Darkmoon Faire Mystic Mage
-- step
--     #completewith next
--     .goto 89,36.58,49.23,20 >>走进|cRXP_WARN_紫色区域|r即可传送
--     .zoneskip 97
--     .nodmf
-- step
--     .goto 57,52.28,89.47,5 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_埃索达传送门|r
--     .zoneskip 97
--     .nodmf
-- step
--     .goto 103,41.87,72.93,10 >>进入|cRXP_WARN_埃索达|r并|cRXP_WARN_沿螺旋楼梯下去|r
--     .goto 103,48.33,62.94,10 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_暴风城传送门|r
--     .zoneskip 84
--     .nodmf
-- step
-- 	.goto 84,62.81,71.74
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
-- 	.target Hero's Herald
--     .nodmf
-- step
--     .nodmf
-- 	.goto 84,63.76,73.59
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷纳多·加林纳|r交谈
--     .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
-- 	.target Renato Gallina
-- step
--     .nodmf
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_闪金镇的勇敢的巴特利|r交谈
--     .goto 37,41.71,64.64
--     .fp >>获取闪金镇飞行路线
-- 	.target Bartlett the Brave
]])

--Worgen Gilneas
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 狼人入门
#displayname |cFF00CCFF1|r - 吉尔尼斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< Worgen !DK

step
    .goto 202,59.130,23.865
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .accept 14078 >>接任务: |cRXP_WARN_戒严！|r
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    .goto 202,56.879,17.856,15,0
    .goto 202,54.626,16.717,15 >>前往地面上|cRXP_FRIENDLY_沃登中尉|r的尸体
step
    .goto 202,54.626,16.717
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_沃登中尉|r的尸体交谈
    .turnin 14078 >>交任务: |cRXP_FRIENDLY_戒严！|r
    .accept 14091 >>接任务: |cRXP_WARN_事有蹊跷|r
	.target Lieutenant Walden
step
    #optional
    #completewith next
    .goto 202,56.872,17.840,15,0
    .goto 202,58.366,20.712,15,0
    .goto 202,59.830,22.192,15 >>返回至 |cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r
step
    .goto 202,59.830,22.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14091 >>交任务: |cRXP_FRIENDLY_事有蹊跷|r
    .accept 14093 >>接任务: |cRXP_WARN_天下大乱|r
    .accept 14098 >>接任务: |cRXP_WARN_疏散商人广场|r
	.target Prince Liam Greymane
step
    #completewith next
    .goto 202,57.678,23.371,0
    .goto 202,65.642,33.161,0
    .goto 202,57.192,40.351,0
    >>击杀|cRXP_ENEMY_暴怒的狼人|r
    .complete 14093,1 --Rampaging Worgen slain (6)
	.mob Rampaging Worgen
step
    .goto 202,59.561,26.776
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .accept 14094 >>接任务: |cRXP_WARN_抢救补给品|r
	.target Gwen Armstead
step
    #sticky
    #label Salvaged
    #loop
    .goto 202,58.931,25.445,0
    .goto 202,61.954,36.882,0
    .goto 202,55.539,33.642,0
    .waypoint 202,58.931,25.445,12,0
    .waypoint 202,62.280,26.295,12,0
    .waypoint 202,59.193,28.776,12,0
    .waypoint 202,59.012,35.683,12,0
    .waypoint 202,61.954,36.882,12,0
    .waypoint 202,59.174,38.938,12,0
    .waypoint 202,56.253,42.897,12,0
    .waypoint 202,58.449,36.570,12,0
    .waypoint 202,55.539,33.642,12,0
    .waypoint 202,60.040,20.806,12,0
    >>打开地面上的|cRXP_PICK_补给箱|r, 掠夺出 [|cRXP_LOOT_回收的补给品|r]
    .complete 14094,1 --Salvaged Supplies (4)
step
    #sticky
    #label Gwen
    #requires Salvaged
    .goto 202,59.561,26.776,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14094 >>交任务: |cRXP_FRIENDLY_抢救补给品|r
	.target Gwen Armstead
step
    #optional
    #sticky
    #label RampWorgen
    #loop
    .goto 202,57.678,23.371,0
    .goto 202,65.642,33.161,0
    .goto 202,57.192,40.351,0
    .waypoint 202,57.678,23.371,45,0
    .waypoint 202,60.799,22.195,45,0
    .waypoint 202,63.387,19.323,45,0
    .waypoint 202,64.497,24.603,45,0
    .waypoint 202,65.642,33.161,45,0
    .waypoint 202,60.451,34.024,45,0
    .waypoint 202,59.696,41.857,45,0
    .waypoint 202,57.192,40.351,45,0
    >>击杀|cRXP_ENEMY_暴怒的狼人|r
    .complete 14093,1 --Rampaging Worgen slain (6)
	.mob Rampaging Worgen
step
    #label Area1
    #loop
    .goto 202,63.192,31.620,0
    .goto 202,55.001,26.559,0
    .goto 202,58.493,19.345,0
    .goto 202,63.192,31.620,8,0
    .goto 202,63.199,34.791,8,0
    .goto 202,55.001,26.559,8,0
    .goto 202,55.839,20.215,8,0
    .goto 202,58.493,19.345,8,0
    >>敲击|cRXP_PICK_Merchant Square Doors|r
    >>|cRXP_WARN_这可能会召唤出敌对生物|r|cRXP_ENEMY_暴怒的狼人|r
    .complete 14098,1 --Market Homes Evacuated (3)
step
    #optional
    #requires RampWorgen
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires Gwen
    .goto 202,59.561,26.776
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14094 >>交任务: |cRXP_FRIENDLY_抢救补给品|r
	.target Gwen Armstead
step
    .goto 202,59.830,22.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14093 >>交任务: |cRXP_FRIENDLY_天下大乱|r
    .turnin 14098 >>交任务: |cRXP_FRIENDLY_疏散商人广场|r
    .accept 14099 >>接任务: |cRXP_WARN_皇家命令|r
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    .goto 202,62.290,31.759,15,0
    .goto 202,64.098,34.535,15,0
    .goto 202,68.809,45.472,15,0
    .goto 202,70.770,55.050,15 >>前往|cRXP_FRIENDLY_格温·阿姆斯特|r
step
    .goto 202,70.770,55.050
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14099 >>交任务: |cRXP_FRIENDLY_皇家命令|r
    .accept 14265 >>接任务: |cRXP_WARN_你的导师|r << Warrior
    .accept 14269 >>接任务: |cRXP_WARN_有人在找你|r << Rogue
    .accept 14273 >>接任务: |cRXP_WARN_神秘的联系人|r << Warlock
    .accept 14275 >>接任务: |cRXP_WARN_有人想联系你|r << Hunter
    .accept 14277 >>接任务: |cRXP_WARN_探究奥术|r << Mage
    .accept 14278 >>接任务: |cRXP_WARN_寻找修女|r << Priest
    .accept 14280 >>接任务: |cRXP_WARN_风中的名字|r << Druid
    .accept 75190 >>接任务: |cRXP_WARN_[Ready and Abel]|r << Monk --Added in DF
	.target Gwen Armstead
step << skip
    #completewith next
    .goto 202,71.023,55.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛丽·艾伦|r交谈
    .vendor 38853 >>|cRXP_BUY_购买|r|T133634:0|t[小棕色布袋]|cRXP_BUY_如有需要可向她购买|r
	.target Marie Allen
step << Warrior
    .goto 202,67.592,64.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尔斯中士(Seargent Cleese)|r交谈
    .turnin 14265 >>交任务: |cRXP_FRIENDLY_你的导师|r
    .accept 14286 >>接任务: |cRXP_WARN_人多安全|r
	.target Sergeant Cleese
step << Rogue
    .goto 202,71.406,65.752
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侠盗萝伦|r交谈
    >>|cRXP_WARN_她|r|T132320:0|t[潜行中]
    .turnin 14269 >>交任务: |cRXP_FRIENDLY_有人在找你|r
    .accept 14285 >>接任务: |cRXP_WARN_人多安全|r
	.target Loren the Fence
step << Warlock
    .goto 202,71.420,64.435
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维图斯·暗行者|r交谈
    .turnin 14273 >>交任务: |cRXP_FRIENDLY_神秘的联系人|r
    .accept 14287 >>接任务: |cRXP_WARN_人多安全|r
	.target Vitus Darkwalker
step << Hunter
    .goto 202,71.503,61.307
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎手布雷克|r交谈
    .turnin 14275 >>交任务: |cRXP_FRIENDLY_有人想联系你|r
    .accept 14290 >>接任务: |cRXP_WARN_人多安全|r
	.target Huntsman Blake
step << Mage
    .goto 202,68.043,64.695
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉安·唤法者|r谈话
    .turnin 14277 >>交任务: |cRXP_FRIENDLY_探究奥术|r
    .accept 14288 >>接任务: |cRXP_WARN_人多安全|r
	.target Myriam Spellwaker
step << Priest
    .goto 202,70.421,65.541
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔米拉修女|r交谈
    .turnin 14278 >>交任务: |cRXP_FRIENDLY_寻找修女|r
    .accept 14289 >>接任务: |cRXP_WARN_人多安全|r
	.target Sister Almyra
step << Druid
    .goto 202,70.190,65.887
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与丰收女巫塞莱斯廷(|cRXP_FRIENDLY_Celestine of the Harvest|r)交谈
    .turnin 14280 >>交任务: |cRXP_FRIENDLY_风中的名字|r
    .accept 14291 >>接任务: |cRXP_WARN_人多安全|r
	.target Celestine of the Harvest
step << Monk
    .goto 202,69.977,65.559
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Todd Abel|r交谈
    .turnin 75190 >>交任务: |cRXP_FRIENDLY_[Ready and Abel]|r
    .accept 75189 >>接任务: |cRXP_WARN_人多安全|r
    .target Todd Abel
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r和|cRXP_FRIENDLY_高弗雷勋爵|r交谈
    .turnin 14285 >>交任务: |cRXP_FRIENDLY_人多安全|r << Rogue
    .turnin 14286 >>交任务: |cRXP_FRIENDLY_人多安全|r << Warrior
    .turnin 14287 >>交任务: |cRXP_FRIENDLY_人多安全|r << Warlock
    .turnin 14288 >>交任务: |cRXP_FRIENDLY_人多安全|r << Mage
    .turnin 14289 >>交任务: |cRXP_FRIENDLY_人多安全|r << Priest
    .turnin 14290 >>交任务: |cRXP_FRIENDLY_人多安全|r << Hunter
    .turnin 14291 >>交任务: |cRXP_FRIENDLY_人多安全|r << Druid
    .turnin 75189 >>交任务: |cRXP_FRIENDLY_人多安全|r << Monk
    .accept 14157 >>接任务: |cRXP_WARN_旧日的分歧|r
    .goto 202,65.810,77.714
	.target +King Genn Greymane
    .accept 24930 >>接任务: |cRXP_WARN_顺路除害|r
    .goto 202,65.279,77.607
	.target +Lord Godfrey
step
    #sticky
    #label Bloodfang
    #loop
    .goto 202,57.890,72.582,0
    .goto 202,59.334,63.772,0
    .goto 202,61.376,70.799,0
    .goto 202,67.168,64.124,0
    .waypoint 202,57.890,72.582,20,0
    .waypoint 202,55.652,68.601,20,0
    .waypoint 202,56.961,66.801,20,0
    .waypoint 202,58.605,63.555,20,0
    .waypoint 202,59.334,63.772,20,0
    .waypoint 202,61.343,66.187,20,0
    .waypoint 202,61.898,66.760,20,0
    .waypoint 202,59.853,70.005,20,0
    .waypoint 202,61.376,70.799,20,0
    .waypoint 202,61.872,71.789,20,0
    .waypoint 202,64.690,69.474,20,0
    .waypoint 202,67.168,64.124,20,0
	>>击杀血牙狼人
    .complete 24930,1 --Bloodfang Worgen slain (5)
	.mob *Bloodfang Worgen
step
    #optional
    #completewith next
    .goto 202,59.984,71.904,15,0
    .goto 202,58.006,72.476,15,0
    .goto 202,57.736,73.926,15,0
    .goto 202,57.925,75.584,10 >>前往|r布罗德里克队长|r内部
step
    .goto 202,57.925,75.584
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗德里克队长|r交谈
    .turnin 14157 >>交任务: |cRXP_FRIENDLY_旧日的分歧|r
    .accept 28850 >>接任务: |cRXP_WARN_监狱的屋顶|r
	.target Captain Broderick
step
    #optional
    #completewith Rooftop
    #label Staircase1
    .goto 202,57.001,74.780,5,0
    .goto 202,55.627,72.484,12 >>沿着螺旋楼梯向上前进
step
    #optional
    #completewith Rooftop
    #requires Staircase1
    .goto 202,54.046,69.362,12,0
    .goto 202,53.759,67.454,12,0
    .goto 202,55.224,62.906,12 >>前往|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r
step
    #label Rooftop
    .goto 202,55.224,62.906
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 28850 >>交任务: |cRXP_FRIENDLY_监狱的屋顶|r
    .accept 14154 >>接任务: |cRXP_WARN_命悬一线|r
    .timer 118,By the Skin of His Teeth RP
	.target Lord Darius Crowley
step
    .goto 202,55.224,62.906
    >>在2分钟内消灭不断涌来的|cRXP_ENEMY_狼人前锋|r和|cRXP_ENEMY_血牙幼崽|r
    >>|cRXP_WARN_靠近|r|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r以获得|r|T236310:0|t[叛军勇气]|cRXP_WARN_(被动光环:大幅提高急速和生命恢复和资源恢复)|r
    .complete 14154,1 --Survive while holding back the worgen for 2 分钟 (1)
    .mob Worgen Alpha
    .mob Bloodfang Runt
step
    .goto 202,55.224,62.906
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 14154 >>交任务: |cRXP_FRIENDLY_命悬一线|r
    .accept 26129 >>接任务: |cRXP_WARN_兄弟情深|r
	.target Lord Darius Crowley
step
    #optional
    #completewith Brothers
    #label Staircase2
    .goto 202,53.759,67.454,12,0
    .goto 202,54.046,69.362,12 >>前往螺旋楼梯
--XX NOTE: You can longjump up behind Darius to jump down, but I doubt the avg user can do it (evident of Wetlands skip despite it being easier)
step
    #optional
    #completewith Brothers
    #requires Staircase2
    .goto 202,55.627,72.484,15,0
    .goto 202,57.707,74.729,5,0
    .goto 202,59.984,71.904,20 >>走下螺旋楼梯, 然后外出
step
    #label Brothers
    #requires Bloodfang
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高弗雷勋爵|r和|r吉恩·格雷迈恩国王|r交谈
    .turnin 24930 >>交任务: |cRXP_FRIENDLY_顺路除害|r
    .goto 202,65.279,77.607
	.target +Lord Godfrey
    .turnin 26129 >>交任务: |cRXP_FRIENDLY_兄弟情深|r
    .accept 14159 >>接任务: |cRXP_WARN_叛军领主的军械库|r
    .goto 202,65.810,77.714
	.target +King Genn Greymane
step
    #optional
    #completewith Arsenal
    #requires Cellar1
    .goto 202,61.383,80.814,15,0
    .goto 202,56.181,82.790,15,0
    .goto 202,55.945,81.481,5,0
    .goto 202,56.805,81.599,6,0
    .goto 202,56.768,85.448,10 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_地窖门|r打开它, 然后前往|cRXP_FRIENDLY_约书亚·阿维利|r所在的位置
--XX no spell for this
step
    #label Arsenal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约书亚·阿维利|r和|r罗娜·克罗雷|r交谈
    .turnin 14159 >>交任务: |cRXP_FRIENDLY_叛军领主的军械库|r
    .goto 202,56.768,85.448
	.target +Josiah Avery
    .accept 14204 >>接任务: |cRXP_WARN_来自阴影|r
    .goto 202,56.873,81.421
	.target +Lorna Crowley
step << skip
    #completewith next
    +|cRXP_WARN_要为任务物品启用快捷键绑定, 请按照以下步骤操作:|r
    *[1] Press the |cRXP_WARN_Escape key|r.
    *[2] Select |cRXP_WARN_Options|r.
    *[3] Navigate to |cRXP_WARN_Keybindings|r.
    *[4] Within |cRXP_WARN_Keybindings|r,find |cRXP_WARN_RestedXP Guides|r.
    *[5] Select and bind the |cRXP_WARN_Active Buttons|r.
step
    #loop
    .goto 202,54.026,81.617,0
    .goto 202,50.457,81.103,0
    .goto 202,47.100,77.204,0
    .goto 202,53.263,76.819,0
    .goto 202,54.026,81.617,20,0
    .goto 202,55.209,84.131,20,0
    .goto 202,51.607,83.495,20,0
    .goto 202,50.679,83.942,20,0
    .goto 202,50.457,81.103,20,0
    .goto 202,48.050,84.424,20,0
    .goto 202,47.075,81.792,20,0
    .goto 202,46.153,81.533,20,0
    .goto 202,47.100,77.204,20,0
    .goto 202,48.918,76.770,20,0
    .goto 202,51.200,76.089,20,0
    .goto 202,53.263,76.819,20,0
    >>击杀 |cRXP_ENEMY_血牙潜伏者|r
    >>|cRXP_WARN_小心, 他们处于潜行状态|r|T132320:0|t[潜行中]
    >>|cRXP_WARN_使用你的|r|cRXP_FRIENDLY_吉尔尼斯牧羊犬|r|T236186:0|t[攻击潜伏者]|cRXP_WARN_法术, 必要时可帮助定位|cRXP_ENEMY_血牙潜伏者|r
    >>|cRXP_WARN_如果你丢失了你的 |cRXP_FRIENDLY_吉尔尼斯巨犬|r, 可使用|r |T236926:0|t[吉尔尼斯巨犬项圈] 重新召唤
    .complete 14204,1 --Bloodfang Lurker slain (6)
	.mob Bloodfang Lurker
    .use 48707
step
    .goto 202,56.873,81.421
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 14204 >>交任务: |cRXP_FRIENDLY_来自阴影|r
    .accept 14214 >>接任务: |cRXP_WARN_给格雷迈恩的消息|r
	.target Lorna Crowley
step
    #optional
    #completewith next
    .goto 202,55.818,81.572,6,0
    .goto 202,56.184,82.795,12,0
    .goto 202,59.207,83.777,15 >>前往|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r
step
    .goto 202,59.207,83.777
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
    .turnin 14214 >>交任务: |cRXP_FRIENDLY_给格雷迈恩的消息|r
    .accept 14293 >>接任务: |cRXP_WARN_救援克雷南·阿朗纳斯|r
    .timer 16,Save Krennan Aranas RP
	.target King Genn Greymane
step << skip
    #completewith next
    .goto 202,58.710,77.289,0
    .deathskip >>在|cRXP_FRIENDLY_灵魂医者|r处死亡并重生. 拯救|cRXP_FRIENDLY_克雷南·阿朗纳斯|r之后
    .target Spirit Healer
step
    .goto 202,59.207,83.777,0
    .goto 202,66.171,61.811
    >>在骑乘|r|cRXP_FRIENDLY_King Greymane's Horse|r|上时:
    >>施放 |T134149:0|t[救援克雷南·阿朗纳斯] (1), 在靠近他时将其救下
-- >>|cRXP_WARN_救下他后, 按下“下马”键|cRXP_FRIENDLY_格雷迈恩国王的马|r并自杀以触发|r|cRXP_ENEMY_血牙撕裂者|r
    >>|cRXP_WARN_如果你失败了, 请与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r谈话以重新尝试|r
    .complete 14293,1 --Krennan Aranas rescued (1)
    .timer 19,Save Krennan Aranas RP
	.target Krennan Aranas
    .target *King Genn Greymane
    .skipgossip 35550,1
    .timer 16,Save Krennan Aranas RP
--XX 19s slower to not deathskip, not gonna risk it
step << skip
    #optional
    #completewith next
    .goto 202,58.710,77.289
    .deathskip >>在|cRXP_FRIENDLY_灵魂医者|r处死亡并重生. 拯救|cRXP_FRIENDLY_克雷南·阿朗纳斯|r之后
    .target Spirit Healer
step
    .goto 202,55.715,80.753
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高弗雷勋爵|r交谈
    .turnin 14293 >>交任务: |cRXP_FRIENDLY_救援克雷南·阿朗纳斯|r
    .accept 14294 >>接任务: |cRXP_WARN_重整旗鼓|r
	.target Lord Godfrey
--XX 14293 didn't complete after turning in quest, worked again after accepting followup (very minor issue)
step
    #optional
    #completewith next
    .goto 202,53.411,82.729,15,0
    .goto 202,44.351,82.504,15,0
    .goto 202,41.103,81.945,15,0
    .goto 202,30.373,73.142,15 >>前往|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r和|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 14294 >>交任务: |cRXP_FRIENDLY_重整旗鼓|r
    .goto 202,30.373,73.142
	.target +King Genn Greymane
    .accept 14212 >>接任务: |cRXP_WARN_牺牲|r
    .goto 202,31.103,72.365
	.target +Lord Darius Crowley
step
    #completewith next
    .goto 202,31.282,72.645
    .vehicle >>进入|cRXP_FRIENDLY_Crowley的马|r
    .timer 79,Sacrifices RP
    .target Crowley's Horse
step
    .goto 202,31.282,72.645,-1
    .goto 202,40.749,39.219,-1
    >>在|cRXP_FRIENDLY_Crowley的马|r上时:
    >>围捕|cRXP_ENEMY_血牙猎手|r
    >>施放 |T135433:0|t[投掷火把] (1) (远程瞬发:召唤 |cRXP_ENEMY_血牙猎手|r. )
    .complete 14212,1 --Bloodfang Stalker rounded up (30)
	.mob Bloodfang Stalker
--XX about 40s slower not to deathskip, but new client stuff is too advanced (IMO)
step
    #completewith next
    >>|cRXP_WARN_等待RP结束|r
    .goto 202,40.548,39.446,20 >>前往|r克劳利的马|r, 朝向|r托比亚斯·密斯特曼托|r前进
step
    .goto 202,40.548,39.446
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托比亚斯·密斯特曼托|r谈话
    .turnin 14212 >>交任务: |cRXP_FRIENDLY_牺牲|r
    .accept 14218 >>接任务: |cRXP_WARN_以鲜血与灰烬之名|r
	.target Tobias Mistmantle
step
    #completewith next
    .goto 202,40.883,36.449,-1
    .goto 202,40.120,36.463,-1
    .goto 202,38.786,37.390,-1
    .goto 202,38.395,38.282,-1
    .goto 202,37.896,39.535,-1
    .goto 202,37.955,40.949,-1
    .vehicle >>进入一辆叛军大炮
    .target Rebel Cannon
step
    .goto 202,40.13,36.52
    >>在处于|cRXP_FRIENDLY_叛军大炮|r时:
    >>击杀血牙猎手
    >>施放 |T252185:0|t[叛军大炮] (1) (远程瞬发:造成大量伤害)
    .complete 14218,1 --Bloodfang Stalker slain (80)
    .mob Bloodfang Stalker
step
    .goto 202,40.548,39.446
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托比亚斯·密斯特曼托|r谈话
    .turnin 14218 >>交任务: |cRXP_FRIENDLY_以鲜血与灰烬之名|r
    .accept 14221 >>接任务: |cRXP_WARN_绝不投降，偶尔撤退|r
	.target Tobias Mistmantle
step
    #optional
    #completewith next
    .goto 202,41.075,40.477,8,0
    .goto 202,43.584,44.647,12 >>进入大教堂
step
    .goto 202,48.936,52.794
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 14221 >>交任务: |cRXP_FRIENDLY_绝不投降，偶尔撤退|r
    .accept 14222 >>接任务: |cRXP_WARN_破釜沉舟|r
	.target Lord Darius Crowley
step
    #loop
    .goto 202,42.708,43.201,0
    .goto 202,46.550,49.292,0
    .goto 202,47.789,46.937,20,0
    .goto 202,43.825,45.568,20,0
    .goto 202,42.708,43.201,20,0
    .goto 202,45.161,50.530,20,0
    >>击杀 |cRXP_ENEMY_狂暴猎手|r
    >>|cRXP_WARN_靠近|r|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r以获得|r|T236310:0|t[叛逆之勇]|cRXP_WARN_(被动光环:大幅提高急速和生命回复和法力回复)|r
    .complete 14222,1 --Frenzied Stalker slain (8)
	.mob Frenzied Stalker
step
    .goto 202,48.936,52.794
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 14222 >>交任务: |cRXP_FRIENDLY_破釜沉舟|r
    .timer 46,Last Stand RP
	.target Lord Daruius Crowley
step
    .goto 179,36.47,61.39
    >>|cRXP_WARN_等待RP结束|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
    .turnin 14375 >>交任务: |cRXP_FRIENDLY_人性的最后希望|r
    .timer 7,Last Chance at Humanity RP
	.target King Genn Greymane
--XX 2dp waypoints here on out (gc bug)
step
    .goto 179,36.51,62.27
    >>|cRXP_WARN_等待RP结束|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高弗雷勋爵|r交谈
    .accept 14313 >>接任务: |cRXP_WARN_恢复人性|r
	.target Lord Godfrey
step
    #optional
    #completewith next
    .goto 179,37.17,63.58,8,0
    .goto 179,37.41,63.24,10 >>进入房屋
step
    .goto 179,37.41,63.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷南·阿朗纳斯|cRXP_FRIENDLY_克雷南·阿朗纳斯|r交谈
    .turnin 14313 >>交任务: |cRXP_FRIENDLY_恢复人性|r
    .accept 14320 >>接任务: |cRXP_WARN_急需药材|r
	.target Krennan Aranas
step
    #sticky
    #label Professions1
    #completewith Professions3
    .goto 179,37.34,63.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰克 "All Trades" 德林顿|r交谈
    >>|cRXP_WARN_Herbing 草药和采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r.
    >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
    .train 2366 >>训练 |T4620675:0|t[草药学]
    .train 2575 >>训练 |T4620679:0|t[采矿]
    .target Jack "All Trades" Derrington
    .skipgossip 50247,1,1,1
    .train 2366,1 --Herbalism
    .train 2575,1 --Mining
step
    #optional
    #requires Professions1
    #label Professions2
    #completewith Professions3
    .goto 179,37.34,63.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰克 "All Trades" 德林顿|r交谈
    >>|cRXP_WARN_Herbing 草药提供经验值. 请仅在你的前进路径上采集资源|r
    >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
    .train 2366 >>训练 |T4620675:0|t[草药学]
    .target Jack "All Trades" Derrington
    .skipgossip 50247,2,2,2
    .train 2575,3 --Mining
step
    #optional
    #requires Professions2
    #label Professions3
    .goto 179,37.34,63.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰克 "All Trades" 德林顿|r交谈
    >>|cRXP_WARN_采矿矿脉提供经验值. 请仅在你的直接路径上采集资源|r
    >>|cRXP_WARN_如果您不想进行此操作, 请跳过这一步|r
    .train 2575 >>训练 |T4620679:0|t[采矿]
    .target Jack "All Trades" Derrington
    .skipgossip 50247,2,3,2
    .train 2366,3 --Herbalism
step
    .goto 179,32.77,66.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_PICK_箱子|r
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 14320 >>交任务: |cRXP_FRIENDLY_急需药材|r
step
    #label MiningWorgen
    .goto 179,32.77,66.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_被杀死的巡逻兵|r的尸体对话
	>>|cRXP_WARN_如果你无法完成此操作, 请在聊天框中输入 /reload|r
    .accept 14321 >>接任务: |cRXP_WARN_入侵|r
    .target Slain Watchman
step
    .goto 179,37.41,63.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14321 >>交任务: |cRXP_FRIENDLY_入侵|r
    .accept 14336 >>接任务: |cRXP_WARN_猎物还是猎人|r
	.target Gwen Armstead
step
    .goto 179,35.94,66.16,15,0
    .goto 179,35.28,66.06,15,0
    .goto 179,35.76,67.31,15,0
    .goto 179,35.94,66.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14336 >>交任务: |cRXP_FRIENDLY_猎物还是猎人|r
    .accept 14347 >>接任务: |cRXP_WARN_坚守阵地|r
    .accept 14348 >>接任务: |cRXP_WARN_合作|r
	.target Prince Liam Greymane
step
    #sticky
    #label ForsakenInvader
    .goto 179,35.61,66.62,0,0
    >>击杀|cRXP_ENEMY_入侵的被遗忘者|r
    .complete 14347,1 --Forsaken Invader slain (10)
	.mob Forsaken Invader
step
    #label Abominations
    #loop
    .goto 179,37.77,69.30,0
    .goto 179,34.23,69.98,0
    .goto 179,33.63,64.76,0
    .goto 179,37.77,69.30,30,0
    .goto 179,38.48,71.45,30,0
    .goto 179,37.24,71.34,30,0
    .goto 179,36.02,71.29,30,0
    .goto 179,34.23,69.98,30,0
    .goto 179,33.39,70.65,30,0
    .goto 179,33.33,71.73,30,0
    .goto 179,33.33,67.76,30,0
    .goto 179,33.63,64.76,30,0
    >>战利品 |T132620:0|t[|cRXP_LOOT_黑火药桶|r]. 在地上
    >>投掷|T132620:0|t[|cRXP_LOOT_黑火药桶|r]至|cRXP_ENEMY_恐怖憎恶|r
    .collect 49202,4,14348,1,-1 --Black Gunpowder Keg (4)
    .complete 14348,1 --Gunpowder thrown at Abominations (4)
    .use 49202
	.mob Horrid Abomination
step
    .goto 179,35.94,66.16,15,0
    .goto 179,35.28,66.06,15,0
    .goto 179,35.76,67.31,15,0
    .goto 179,35.94,66.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14347 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
    .turnin 14348,1 >>交任务: |cRXP_FRIENDLY_合作|r << !Warrior !Rogue !Monk
    .turnin 14348,2 >>交任务: |cRXP_FRIENDLY_合作|r << Warrior/Rogue/Monk
    .accept 14366 >>接任务: |cRXP_WARN_沉着迎敌|r
	.target Prince Liam Greymane
step
    .goto 179,37.41,63.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14366 >>交任务: |cRXP_FRIENDLY_沉着迎敌|r
    .accept 14367 >>接任务: |cRXP_WARN_艾伦农场的防风地窖|r
	.target Gwen Armstead
step
    #optional
    #completewith next
    .goto 179,28.41,64.23,8,0
    .goto 179,28.32,63.88,6 >>进入地窖
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内之|cRXP_FRIENDLY_高弗雷勋爵|r和|cRXP_FRIENDLY_梅琳达·哈蒙德|r谈话
    .turnin 14367 >>交任务: |cRXP_FRIENDLY_艾伦农场的防风地窖|r
    .accept 14369 >>接任务: |cRXP_WARN_释放兽性|r
    .accept 14382 >>接任务: |cRXP_WARN_海边的船长|r
    .goto 179,28.97,63.93
	.target +Lord Godfrey
    .accept 14368 >>接任务: |cRXP_WARN_救救我的孩子！|r
    .goto 179,28.93,64.04
	.target +Melinda Hammond
step
    #optional
    #label ChildrenHouse1
    #completewith Ashley
    .goto 179,28.32,63.88,6,0
    .goto 179,28.41,64.23,5 >>离开地窖
step
    #optional
	#completewith Cynthia
    >>击杀|cRXP_ENEMY_被遗忘者步兵|r
    .complete 14369,1 --Forsaken Combatant slain (8)
	.mob Forsaken Footsoldier
step
    #optional
    #label ChildrenHouse2
    #requires ChildrenHouse1
    #completewith Ashley
    .goto 179,27.83,66.83,7 >>进入房屋
step
    #optional
    #completewith Ashley
    #requires ChildrenHouse2
    .goto 179,27.90,66.12,3,0
    .goto 179,28.19,66.32,3 >>上楼
step
    #label Ashley
    .goto 179,27.88,66.66
    .cast 68598 >>和楼上|cRXP_FRIENDLY_阿什莉|r谈话
--  .complete 14368,2 --Ashley rescued (1)
	.target Ashley
    .isOnQuest 14368
--XX talk spell is about 0.5s faster than credit
step
    .goto 179,28.53,66.73,8,0
    .goto 179,28.71,66.78
    .cast 68596 >>与|cRXP_FRIENDLY_詹姆斯|r在外面交谈
--  .complete 14368,3 --James rescued (1)
	.target James
    .isOnQuest 14368
step
    #label Cynthia
    .goto 179,29.59,69.31
    .cast 68597 >>与|cRXP_FRIENDLY_辛西娅|r谈话
--  .complete 14368,1 --Cynthia rescued (1)
	.target Cynthia
    .isOnQuest 14368
step
	#sticky
    #label Combatants
    #loop
    .goto 179,27.59,75.20,0
    .goto 179,26.15,74.55,0
    .goto 179,24.40,70.19,0
    .goto 179,24.55,69.00,0
    .waypoint 179,27.59,75.20,45,0
    .waypoint 179,27.39,73.94,45,0
    .waypoint 179,26.15,74.55,45,0
    .waypoint 179,24.29,73.29,45,0
    .waypoint 179,24.40,70.19,45,0
    .waypoint 179,24.55,69.00,45,0
    >>击杀|cRXP_ENEMY_被遗忘者步兵|r和|cRXP_ENEMY_被遗忘者水手|r
    .complete 14369,1 --Forsaken Combatant slain (8)
	.mob *Forsaken Footsoldier
	.mob *Forsaken Sailor
step
    #optional
    #completewith Anson
    #loop
    .goto 179,28.39,72.09,0
    .goto 179,26.90,71.55,0
    .goto 179,26.26,70.66,0
    .goto 179,24.79,68.98,0
    .goto 179,25.13,72.09,0
    .goto 179,26.73,73.45,0
    .goto 179,28.39,72.09,45,0
    .goto 179,26.90,71.55,45,0
    .goto 179,26.26,70.66,45,0
    .goto 179,24.79,68.98,45,0
    .goto 179,25.13,72.09,45,0
    .goto 179,26.73,73.45,45,0
    >>击杀|cRXP_ENEMY_被遗忘者机械师|r (如果存在的话), 以便为|cRXP_FRIENDLY_被遗忘者投石车|r 腾出空间
    .vehicle >>进入|cRXP_FRIENDLY_被遗忘者投石车|r
    .timer 59,Catapult Implodes
	.mob Forsaken Machinist
    .target Forsaken Catapult
step
    #optional
    #completewith Anson
    +在使用 |cRXP_FRIENDLY_被遗忘者投石车|r 时:
    >>小心瞄准, 然后施放|T252175:0|t[发射](1)投射到|r安森船长|r的北侧船只上
    *|cRXP_WARN_Remember that you can move whilst in the|r |cRXP_FRIENDLY_Forsaken Catapult|r.
    *|cRXP_WARN_Make sure you aim carefully, as you can be launched into the side of the boat, or into the water past the boat|r.
--XX Subzone 4714 (Gilneas) - can tie this to cast ID or subzone ID but there's no good way to hide this/detect if the player gets onto the boat or not
step
    #label Anson
    .goto 179,24.74,76.26,6,0
    .goto 179,24.94,76.50,6,0
    .goto 179,23.77,74.70
    >>击杀|cRXP_ENEMY_安森船长|r, 位于北侧船体底层
    .complete 14382,1 --Captain Anson slain (1)
	.mob Captain Anson
--XX Would add waypoints but the Catapult step gives enough bloat as is
--XX Check if body type 2s can exit via cannon holes
step
    #optional
    #completewith Morris
    #label Catapult3
    .goto 179,24.94,76.50,6 >>回到楼上
step
    #optional
    #requires Catapult3
    #completewith Morris
    #loop
    .goto 179,26.73,73.45,0
    .goto 179,26.90,71.55,0
    .goto 179,28.39,72.09,0
    .goto 179,29.61,74.10,0
    .goto 179,26.26,70.66,0
    .goto 179,24.79,68.98,0
    .goto 179,25.13,72.09,0
    .goto 179,26.73,73.45,45,0
    .goto 179,26.90,71.55,45,0
    .goto 179,28.39,72.09,45,0
    .goto 179,29.61,74.10,45,0
    .goto 179,26.26,70.66,45,0
    .goto 179,24.79,68.98,45,0
    .goto 179,25.13,72.09,45,0
    >>击杀一名 |cRXP_ENEMY_被遗忘者机械师|r, 为 |cRXP_FRIENDLY_被遗忘者投石车|r腾出空间
    .vehicle >>进入|cRXP_FRIENDLY_被遗忘者投石车|r
    .timer 59,Catapult Implodes
	.mob Forsaken Machinist
    .target Forsaken Catapult
step
    #optional
    #requires Catapult3
    #completewith Morris
    +在使用 |cRXP_FRIENDLY_被遗忘者投石车|r 时:
    >>小心瞄准, 然后施放|T252175:0|t[发射](1), 将目标投射到|r.莫里斯船长|cRXP_ENEMY_的南侧舰船上
    *|cRXP_WARN_Remember that you can move whilst in the|r |cRXP_FRIENDLY_Forsaken Catapult|r.
    *|cRXP_WARN_Make sure you aim carefully, as you can be launched into the side of the boat, or into the water past the boat|r.
step
	#label Morris
    .goto 179,27.90,81.11,6,0
    .goto 179,28.06,81.32,6,0
    .goto 179,26.85,79.32
    >>击杀南部船只底层的莫里斯船长
    .complete 14382,2 --Captain Morris slain (1)
	.mob Captain Morris
step << skip
    #requires Combatants
    #completewith Unleash
    .goto 179,27.65,66.05,0
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
    .target Spirit Healer
    .subzoneskip 4792
--XX not worth the timesave
step
    #optional
    #requires Combatants
    #completewith Unleash
    .goto 179,28.41,64.23,8,0
    .goto 179,28.32,63.88,6 >>进入地窖
step
    #label Unleash
    #requires Combatants
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅琳达·哈蒙德|r和|cRXP_FRIENDLY_高弗雷勋爵|r在室内交谈
    .turnin 14368 >>交任务: |cRXP_FRIENDLY_救救我的孩子！|r
    .goto 179,28.93,64.04
	.target +Melinda Hammond
    .turnin 14369 >>交任务: |cRXP_FRIENDLY_释放兽性|r
    .turnin 14382 >>交任务: |cRXP_FRIENDLY_海边的船长|r
    .accept 14386 >>接任务: |cRXP_WARN_敌军的首领|r
    .goto 179,28.97,63.93
	.target +Lord Godfrey
step
    #optional
    #label Cellar6
    #completewith next
    .goto 179,28.32,63.88,6,0
    .goto 179,28.41,64.23,5 >>离开地窖
step
    #optional
    #requires Cellar6
    #completewith Thyala
    .cast 68682 >>使用 |T132161:0|t[训犬口哨] 召唤 |cRXP_FRIENDLY_攻击猎犬|r攻击 |cRXP_ENEMY_黑暗游侠西亚拉|r
step
    #label Thyala
    .goto 179,23.48,67.53
    >>击杀|cRXP_ENEMY_黑暗游侠西亚拉|r
    .complete 14386,1 --Dark Ranger Thyala slain (1)
    .use 49240
	.mob Dark Ranger Thyala
step
    #optional
    #completewith next
    .goto 179,28.41,64.23,8,0
    .goto 179,28.32,63.88,6 >>进入地窖
step
    .goto 179,28.97,63.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高弗雷勋爵|r交谈
    .turnin 14386 >>交任务: |cRXP_FRIENDLY_敌军的首领|r
    .accept 14396 >>接任务: |cRXP_WARN_天崩地裂|r
	.target Lord Godfrey
step
    #optional
    #label Cellar6
    #completewith next
    .goto 179,28.32,63.88,6,0
    .goto 179,28.41,64.23,5 >>离开地窖
step
    .goto 179,29.03,65.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14396 >>交任务: |cRXP_FRIENDLY_天崩地裂|r
    .accept 14395 >>接任务: |cRXP_WARN_屏住呼吸|r
	.target Prince Liam Greymane
step
    #completewith next
    #loop
    .goto 179,27.20,68.79,0
    .goto 179,27.07,65.40,0
    .goto 179,27.93,66.03,0
    .goto 179,28.53,66.66,15,0
    .goto 179,28.64,67.08,15,0
    .goto 179,28.76,67.34,15,0
    .goto 179,28.00,67.26,15,0
    .goto 179,27.20,68.79,15,0
    .goto 179,26.34,68.02,15,0
    .goto 179,26.04,66.63,15,0
    .goto 179,26.45,65.92,15,0
    .goto 179,27.07,65.40,15,0
    .goto 179,27.89,66.66,15,0
    .goto 179,27.93,66.03,15,0
    .cast 68735 >>拾起一个|cRXP_FRIENDLY_溺水的哨兵|r
	.target Drowning Watchman
    .isOnQuest 14395
--XXZ Zarant function
step
    .goto 179,29.03,65.05
    >>将|r|cRXP_FRIENDLY_溺水的哨兵|r带回给|r|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r
    .complete 14395,1,1 --Drowning Watchman rescued (4)
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    #loop
    .goto 179,27.20,68.79,0
    .goto 179,27.07,65.40,0
    .goto 179,27.93,66.03,0
    .goto 179,28.53,66.66,15,0
    .goto 179,28.64,67.08,15,0
    .goto 179,28.76,67.34,15,0
    .goto 179,28.00,67.26,15,0
    .goto 179,27.20,68.79,15,0
    .goto 179,26.34,68.02,15,0
    .goto 179,26.04,66.63,15,0
    .goto 179,26.45,65.92,15,0
    .goto 179,27.07,65.40,15,0
    .goto 179,27.89,66.66,15,0
    .goto 179,27.93,66.03,15,0
    .cast 68735 >>拾起一个|cRXP_FRIENDLY_溺水的哨兵|r
	.target Drowning Watchman
    .isOnQuest 14395
step
    #optional
    .goto 179,29.03,65.05
    >>将|r|cRXP_FRIENDLY_溺水的哨兵|r带回给|r|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r
    .complete 14395,1,2 --Drowning Watchman rescued (4)
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    #loop
    .goto 179,27.20,68.79,0
    .goto 179,27.07,65.40,0
    .goto 179,27.93,66.03,0
    .goto 179,28.53,66.66,15,0
    .goto 179,28.64,67.08,15,0
    .goto 179,28.76,67.34,15,0
    .goto 179,28.00,67.26,15,0
    .goto 179,27.20,68.79,15,0
    .goto 179,26.34,68.02,15,0
    .goto 179,26.04,66.63,15,0
    .goto 179,26.45,65.92,15,0
    .goto 179,27.07,65.40,15,0
    .goto 179,27.89,66.66,15,0
    .goto 179,27.93,66.03,15,0
    .cast 68735 >>拾起一个|cRXP_FRIENDLY_溺水的哨兵|r
	.target Drowning Watchman
    .isOnQuest 14395
step
    #optional
    .goto 179,29.03,65.05
    >>将|r|cRXP_FRIENDLY_溺水的哨兵|r带回给|r|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r
    .complete 14395,1,3 --Drowning Watchman rescued (4)
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    #loop
    .goto 179,27.20,68.79,0
    .goto 179,27.07,65.40,0
    .goto 179,27.93,66.03,0
    .goto 179,28.53,66.66,15,0
    .goto 179,28.64,67.08,15,0
    .goto 179,28.76,67.34,15,0
    .goto 179,28.00,67.26,15,0
    .goto 179,27.20,68.79,15,0
    .goto 179,26.34,68.02,15,0
    .goto 179,26.04,66.63,15,0
    .goto 179,26.45,65.92,15,0
    .goto 179,27.07,65.40,15,0
    .goto 179,27.89,66.66,15,0
    .goto 179,27.93,66.03,15,0
    .cast 68735 >>拾起一个|cRXP_FRIENDLY_溺水的哨兵|r
	.target Drowning Watchman
    .isOnQuest 14395
step
    #optional
    .goto 179,29.03,65.05
    >>将|r|cRXP_FRIENDLY_溺水的哨兵|r带回给|r|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r
    .complete 14395,1 --Drowning Watchman rescued (4)
	.target Prince Liam Greymane
step
    .goto 179,29.03,65.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 14395,1 >>交任务: |cRXP_FRIENDLY_屏住呼吸|r
    .accept 14397 >>接任务: |cRXP_WARN_撤退行动|r
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    .goto 179,35.95,63.54,20,0
    .goto 179,37.63,65.23,12 >>前往|cRXP_FRIENDLY_格温·阿姆斯特|r
step
    .goto 179,37.63,65.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14397 >>交任务: |cRXP_FRIENDLY_撤退行动|r
    .accept 14398 >>接任务: |cRXP_WARN_薇儿外婆|r
    .accept 14403 >>接任务: |cRXP_WARN_海瓦尔德兄弟|r
    .accept 14406 >>接任务: |cRXP_WARN_克罗雷果园|r
	.target Gwen Armstead
step
    .goto 179,37.68,72.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 14406 >>交任务: |cRXP_FRIENDLY_克罗雷果园|r
    .accept 14416 >>接任务: |cRXP_WARN_饥饿的双头怪|r
	.target Lorna Crowley
step
    #optional
    #completewith next
    #loop
    .goto 179,39.82,75.32,0
    .goto 179,40.11,79.92,0
    .goto 179,39.90,81.96,0
    .goto 179,38.21,81.88,0
    .goto 179,39.82,75.32,20,0
    .goto 179,40.26,75.67,20,0
    .goto 179,40.24,77.06,20,0
    .goto 179,39.72,77.14,20,0
    .goto 179,40.11,79.92,20,0
    .goto 179,39.90,81.96,20,0
    .goto 179,38.21,81.88,20,0
    .vehicle >>进入一匹高山马
    .target Mountain Horse
step
    .goto 179,39.82,75.32,0
    .goto 179,40.11,79.92,0
    .goto 179,39.90,81.96,0
    .goto 179,38.21,81.88,0
    .goto 179,40.26,75.67,20,0
    .goto 179,40.24,77.06,20,0
    .goto 179,37.68,72.76
    >>骑着高山马时:
    >>使用 |T134326:0|t[驱赶马匹] (1) 对 |cRXP_FRIENDLY_高山马|r使其跟随你
    >>指南 5|cRXP_FRIENDLY_高山马|r(包括你自己的)带回|cRXP_FRIENDLY_罗娜·克罗雷|r
    >>|cRXP_WARN_避免|cRXP_ENEMY_崩山者克洛斯|r
    .complete 14416,1 --Mountain Horse rescued (5)
	.target Mountain Horse
	.target Lorna
    .unitscan Koroth the Hillbreaker
--XXZ Zarant function
step
    .goto 179,37.68,72.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 14416 >>交任务: |cRXP_FRIENDLY_饥饿的双头怪|r
	.target Lorna Crowley
step
    #optional
    #completewith next
    .goto 179,33.00,76.02,15,0
    .goto 179,32.57,75.84,6 >>进入瓦尔小屋
step
    .goto 179,32.52,75.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_薇儿外婆|r交谈
    .turnin 14398 >>交任务: |cRXP_FRIENDLY_薇儿外婆|r
    .accept 14399 >>接任务: |cRXP_WARN_失踪的宝贝|r
	.target Grandma Wahl
step
    .goto 179,33.96,77.38
    >>在地面上搜刮[|cRXP_LOOT_亚麻布包裹的书籍|r]
    .complete 14399,1 --Linen-Wrapped Book (1)
step
    .goto 179,32.52,75.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_inside|cRXP_FRIENDLY_薇儿外婆|r交谈
    .turnin 14399 >>交任务: |cRXP_FRIENDLY_失踪的宝贝|r
    .accept 14400 >>接任务: |cRXP_WARN_我不要穿成这样|r
	.target Grandma Wahl
step
    #optional
    #completewith next
    .goto 179,32.50,76.06,8,0
    .goto 179,32.27,76.07,10,0
    .goto 179,32.04,75.45,10 >>前往外面的 [|cRXP_LOOT_Grandma's Good Clothes|r]
step
    .goto 179,32.04,75.45
    >>战利品 [|cRXP_LOOT_Grandma's Good Clothes|r]. 外部区域
    .complete 14400,1 --Grandma's Good Clothes (1)
step
    .goto 179,32.52,75.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_薇儿外婆|r交谈
    .turnin 14400 >>交任务: |cRXP_FRIENDLY_我不要穿成这样|r
    .accept 14401 >>接任务: |cRXP_WARN_外婆的猫咪|r
	.target Grandma Wahl
step
    #optional
    #completewith next
    .goto 179,35.16,74.82
    .cast 68743 >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的|cRXP_FRIENDLY_黄猫小运|r召唤|cRXP_ENEMY_残忍的卢修斯|r
	.mob Lucius the Cruel
    .isOnQuest 14401
step
    .goto 179,35.24,74.98
    >>击杀|cRXP_ENEMY_残忍的卢修斯|r. 击败他后可获得 [|cRXP_LOOT_黄猫小运|r]
    .complete 14401,1 --Chance the Cat (1)
	.mob Lucius the Cruel
step
    #optional
    #completewith next
    .goto 179,33.00,76.02,15,0
    .goto 179,32.57,75.84,6 >>进入瓦尔小屋
step
    .goto 179,32.52,75.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_薇儿外婆|r交谈
    .turnin 14401 >>交任务: |cRXP_FRIENDLY_外婆的猫咪|r
	.target Grandma Wahl
step
    .goto 179,36.89,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞巴斯蒂安·海瓦尔德|r交谈
    .turnin 14403 >>交任务: |cRXP_FRIENDLY_海瓦尔德兄弟|r
    .accept 14404 >>接任务: |cRXP_WARN_丢三落四|r
    .accept 14412 >>接任务: |cRXP_WARN_清理渔场|r
	.target Sebastian Hayward
step
	#sticky
    #label Castaways
    #loop
    .goto 179,36.89,84.68,0
    .waypoint 179,37.31,84.32,6,0
    .waypoint 179,36.89,84.68,6,0
    .waypoint 179,36.57,84.53,6,0
    >>击杀流窜的被遗忘者
    .complete 14412,1 --Forsaken Castaway slain (6)
	.mob Forsaken Castaway
step
    .goto 179,37.58,85.98
    >>打开地面上的|cRXP_PICK_Barrel of Coal Tar|r, 从中获取 [|cRXP_LOOT_Coal Tar|r]
    .complete 14404,3 --Coal Tar (1)
step
    #optional
    #completewith next
    .goto 179,37.05,86.81,6 >>进入海沃德渔场小屋
step
    .goto 179,37.46,87.15
    >>拾取地上 [|cRXP_LOOT_Shipwright's Tools|r]
    .complete 14404,1 --Shipwright's Tools (1)
step
    .goto 179,36.09,86.44
    >>在地面上搜刮 [|cRXP_LOOT_厚木板|r]
    .complete 14404,2 --Planks of Wood (1)
step
    #requires Castaways
    .goto 179,36.89,84.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞巴斯蒂安·海瓦尔德|r交谈
    .turnin 14404 >>交任务: |cRXP_FRIENDLY_丢三落四|r
    .turnin 14412 >>交任务: |cRXP_FRIENDLY_清理渔场|r
    .accept 14405 >>接任务: |cRXP_WARN_海路出逃|r
	.target Sebastian Hayward
step
    #completewith next
    .hs >>炉石传送至暮色港
step
    .goto 179,37.63,65.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 14405 >>交任务: |cRXP_FRIENDLY_海路出逃|r
    .accept 14465 >>接任务: |cRXP_WARN_前往格雷迈恩庄园|r
	.timer 32,Greymane Manor RP
	.target Gwen Armstead
step << skip
    #optional
    #label Manor01
    #completewith next
    >>|cRXP_WARN_等待RP结束|r
--XX add waypoint to tie to timer
step
    #optional
    #completewith next
    .goto 179,30.27,52.03,15,0
    .goto 179,29.54,51.55,15,0
    .goto 181,70.44,61.92,10 >>进入格雷迈恩庄园
step
    .goto 181,62.10,49.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米亚·格雷迈恩王后|r交谈
    .turnin 14465 >>交任务: |cRXP_FRIENDLY_前往格雷迈恩庄园|r
    .accept 14466 >>接任务: |cRXP_WARN_国王的瞭望台|r
	.target Queen Mia Greymane
step
    #optional
    #label Manor1
    #completewith AlasGilneas
    .goto 181,60.45,38.72,12,0
    .goto 182,61.52,38.13,6 >>上楼前往阳台
step
    #optional
    #label Manor2
    #requires Manor1
    #completewith AlasGilneas
    .goto 182,50.53,33.85,10,0
    .goto 182,40.44,15.56,10,0
    .goto 182,43.87,15.56,6 >>攀上庄园塔楼的顶端
step
    #label AlasGilneas
    .goto 182,46.40,21.17,8,0
    .goto 182,42.76,27.22,8,0
    .goto 182,39.16,20.96,8,0
    .goto 182,43.26,16.63,8,0
    .goto 182,45.33,22.62,8,0
    .goto 182,41.91,20.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .turnin 14466 >>交任务: |cRXP_FRIENDLY_国王的瞭望台|r
    .turnin 14467 >>交任务: |cRXP_FRIENDLY_天哪，吉尔尼斯！|r
    .accept 24438 >>接任务: |cRXP_WARN_逃亡|r
	.target King Genn Greymane
step
    #optional
    #completewith next
    .goto 181,68.57,64.01,10,0
    .goto 179,65.65,82.88,10,0
    .goto 179,28.90,54.22,15 >>下塔后离开格雷曼庄园, 然后跳向|cRXP_FRIENDLY_驿站马车|r的方向
step
    .goto 179,28.90,54.22
    >>进入|cRXP_FRIENDLY_驿站马车|r
    .complete 24438,1 --Carriage boarded (1)
	.timer 80,Exodus RP
    .target Stagecoach Carriage
step
    .goto 179,51.81,80.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 24438 >>交任务: |cRXP_FRIENDLY_逃亡|r
    .accept 24468 >>接任务: |cRXP_WARN_沼泽困境|r
	.target Prince Liam Greymane
step
    #loop
    .goto 179,53.08,74.25,0
    .goto 179,52.73,72.07,0
    .goto 179,52.23,68.59,0
    .goto 179,53.08,74.25,45,0
    .goto 179,52.04,73.67,45,0
    .goto 179,51.75,72.92,45,0
    .goto 179,51.41,71.57,45,0
    .goto 179,52.73,72.07,45,0
    .goto 179,53.59,71.89,45,0
    .goto 179,53.95,73.95,45,0
    .goto 179,53.56,68.69,45,0
    .goto 179,52.23,68.59,45,0
    .goto 179,50.45,68.07,45,0
    .goto 179,51.46,69.67,45,0
    >>拯救被沼泽鳄鱼袭击的撞击幸存者
    .complete 24468,1 --Crash Survivor rescued (5)
	.mob Swamp Crocolisk
    .target Crash Survivor
step
    .goto 179,51.81,80.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 24468 >>交任务: |cRXP_FRIENDLY_沼泽困境|r
    .accept 24472 >>接任务: |cRXP_WARN_恰当的欢迎|r
	.target Prince Liam Greymane
step
    #optional
    #completewith Koroth
    .goto 179,50.38,84.87,15,0
    .goto 179,48.88,84.64,15,0
    .goto 179,48.14,85.41,15,0
    .goto 179,46.74,83.20,12 >>前往山上的 [|cRXP_LOOT_Koroth's Banner|r]
step
    #sticky
    #label Ogres
    #loop
    .goto 179,46.93,85.06,0
    .goto 179,50.56,85.62,0
    .waypoint 179,46.93,85.06,45,0
    .waypoint 179,45.77,87.30,45,0
    .waypoint 179,45.77,88.95,45,0
    .waypoint 179,45.26,87.21,45,0
    .waypoint 179,48.10,86.57,45,0
    .waypoint 179,49.25,83.82,45,0
    .waypoint 179,50.56,85.62,45,0
    >>击杀|cRXP_ENEMY_食人魔爪牙|r
    .complete 24472,1 --Ogre Minion slain (4)
	.mob Ogre Minion
step
    #label Koroth
    .goto 179,46.74,83.20
    >>在地面上拾取 [|cRXP_LOOT_Koroth's Banner|r]
    .complete 24472,2 --Koroth's Banner (1)
step
    #requires Ogres
    .goto 179,51.81,80.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利亚姆·格雷迈恩王子|r交谈
    .turnin 24472 >>交任务: |cRXP_FRIENDLY_恰当的欢迎|r
    .accept 24483 >>接任务: |cRXP_WARN_风谷村|r
	.target Prince Liam Greymane
step
    #optional
    #completewith next
    .goto 179,53.19,84.01,30,0
    .goto 179,55.27,87.50,30,0
    .goto 179,58.49,91.88,30,0
    .goto 179,59.33,92.34,12,0
    .goto 179,59.84,91.92,6 >>进入格温·阿姆斯特的家, 地点在风谷村
step
    .goto 179,59.86,91.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 24483 >>交任务: |cRXP_FRIENDLY_风谷村|r
    .accept 24484 >>接任务: |cRXP_LOOT_害虫控制|r
	.target Gwen Armstead
step
    #sticky
    #label Stormglen
    .goto 179,60.06,91.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_薇拉·阿尔尼斯|r交谈
    .home >>将你的[炉石]设置为风谷村
    .isQuestAvailable 24495
step
    .goto 179,60.26,91.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .accept 24495 >>接任务: |cRXP_WARN_破碎的往昔|r
	.target Lorna Crowley
step
    #optional
    #requires Stormglen
    #completewith next
    .goto 179,60.44,91.30,8 >>离开房屋
step
    #sticky
    #requires Stormglen
    #label JournalP
    #loop
    .goto 179,62.32,92.85,0
    .goto 179,65.14,90.76,0
    .goto 179,67.36,92.29,0
    .goto 179,62.32,92.85,15,0
    .goto 179,62.98,92.74,15,0
    .goto 179,63.84,91.65,15,0
    .goto 179,64.33,90.99,15,0
    .goto 179,64.82,90.71,15,0
    .goto 179,65.14,90.76,15,0
    .goto 179,65.45,90.92,15,0
    .goto 179,65.78,90.96,15,0
    .goto 179,65.22,92.46,15,0
    .goto 179,65.48,91.64,15,0
    .goto 179,65.91,90.76,15,0
    .goto 179,66.40,90.82,15,0
    .goto 179,67.18,90.80,15,0
    .goto 179,67.41,91.41,15,0
    .goto 179,67.36,92.29,15,0
    >>在地面上找到 [|cRXP_LOOT_破旧的日记书页|r]
    .complete 24495,1 --Old Journal Page (6)
step
    #requires Stormglen
    #loop
    .goto 179,65.32,92.71,0
    .goto 179,65.53,88.51,0
    .goto 179,65.59,90.93,0
    .goto 179,65.32,92.71,45,0
    .goto 179,66.30,91.16,45,0
    .goto 179,67.59,92.29,45,0
    .goto 179,67.50,88.31,45,0
    .goto 179,65.53,88.51,45,0
    .goto 179,62.70,91.02,45,0
    .goto 179,63.53,89.30,45,0
    .goto 179,63.64,91.38,45,0
    .goto 179,65.12,91.93,45,0
    .goto 179,65.59,90.93,45,0
    >>击杀|cRXP_ENEMY_邪巢诱捕蛛|r
    .complete 24484,1 --Vilebrood Skitterer slain (6)
	.mob Vilebrood Skitterer
step
    #optional
    #requires JournalP
    #completewith next
    .goto 179,60.37,91.46,8 >>进入房屋
step
    #requires JournalP
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与室内之|cRXP_FRIENDLY_罗娜·克罗雷|r和|cRXP_FRIENDLY_格温·阿姆斯特|r谈话
    .turnin 24495 >>交任务: |cRXP_FRIENDLY_破碎的往昔|r
    .goto 179,60.26,91.85
	.target +Lorna Crowley
    .turnin 24484 >>交任务: |cRXP_FRIENDLY_害虫控制|r
    .accept 24501 >>接任务: |cRXP_WARN_蛛后的麻烦|r
    .goto 179,59.86,91.71
	.target +Gwen Armstead
step
    .goto 179,68.35,81.65
    >>击杀|cRXP_ENEMY_雷格纳|r
    .complete 24501,1 --Rygna slain (1)
	.mob Rygna
step
    #optional
    #requires JournalP
    #completewith next
    .goto 179,60.37,91.46,8 >>进入房屋
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与内部的|cRXP_FRIENDLY_格温·阿姆斯特|r和|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24501 >>交任务: |cRXP_FRIENDLY_蛛后的麻烦|r
    .goto 179,59.86,91.71
	.target +Gwen Armstead
    .accept 24578 >>接任务: |cRXP_WARN_黑瘴林|r
    .goto 179,60.26,91.85
	.target +Lorna Crowley
step
    .goto 179,63.35,82.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝莉莎·星风|r交谈
    .turnin 24578 >>交任务: |cRXP_FRIENDLY_黑瘴林|r
    .accept 24616 >>接任务: |cRXP_WARN_反跟踪|r
	.target Belyrsa Starbreeze
step
    #optional
    #sticky
    #label Trap1
    #completewith Scout
    .goto 179,63.92,81.25
    .aura 70794 >>|cRXP_WARN_跑到路上触发|r|T134916:0|t[冰冻陷阱]|cRXP_WARN_并召唤|r|cRXP_ENEMY_黑暗斥候|r使用|r|T133443:0|t[贝莉丝拉的护身符]|cRXP_WARN_来解除|r|T134916:0|t[冰冻陷阱]
    .use 49944
step
    #optional
    #sticky
    #requires Trap1
    #completewith Scout
    .goto 179,63.92,81.25
    .aura -70794 >>|cRXP_WARN_使用|r |T133443:0|t[贝利斯拉的护身符] |cRXP_WARN_来驱散|r |T134916:0|t[冰冻陷阱]
    .use 49944
--XXZ Currently doesnt work (aura needs to count debuffs)
step
    #label Scout
    .goto 179,64.12,80.52
    >>击杀 |cRXP_ENEMY_黑暗斥候|r
    .complete 24616,1 --Dark Scout slain (1)
	.mob Dark Scout
    .use 49944
step
    .goto 179,63.35,82.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝莉莎·星风|r交谈
    .turnin 24616 >>交任务: |cRXP_FRIENDLY_反跟踪|r
    .accept 24617 >>接任务: |cRXP_WARN_塔多伦，野性的家园|r
	.target Belyrsa Starbreeze
step
    .goto 179,68.72,73.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24617 >>交任务: |cRXP_FRIENDLY_塔多伦，野性的家园|r
    .accept 24627 >>接任务: |cRXP_WARN_兵临城下|r
	.target Lord Darius Crowley
step
    .goto 179,69.30,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .accept 24628 >>接任务: |cRXP_WARN_仪式前的准备|r
	.target Vassandra Stormclaw
step
    #sticky
    #label Banshees
    #loop
    .goto 179,64.34,75.55,0
    .goto 179,60.44,78.54,0
    .goto 179,64.23,72.55,0
    .goto 179,64.34,75.55,45,0
    .goto 179,61.21,77.57,45,0
    .goto 179,61.38,79.02,45,0
    .goto 179,61.86,79.10,45,0
    .goto 179,60.44,78.54,45,0
    .goto 179,60.19,80.23,45,0
    .goto 179,60.41,76.88,45,0
    .goto 179,59.79,75.62,45,0
    .goto 179,63.38,74.31,45,0
    .goto 179,64.23,72.55,45,0
    >>击杀|cRXP_ENEMY_尖啸女妖|r
    .complete 24627,1 --Howling Banshee slain (6)
	.mob Howling Banshee
step
    #optional
    .goto 179,60.64,74.63,0
    .goto 179,63.59,73.45,0
    .goto 179,62.70,76.04,0
    .goto 179,59.97,77.38,0
    .goto 179,60.64,74.63,15,0
    .goto 179,60.95,74.43,15,0
    .goto 179,61.19,74.67,15,0
    .goto 179,61.51,72.89,15,0
    .goto 179,63.38,73.45,15,0
    .goto 179,63.59,73.45,15,0
    .goto 179,66.17,71.64,15,0
    .goto 179,67.04,71.91,15,0
    .goto 179,67.18,75.96,15,0
    .goto 179,65.23,76.21,15,0
    .goto 179,62.70,76.04,15,0
    .goto 179,61.99,75.87,15,0
    .goto 179,61.44,78.34,15,0
    .goto 179,62.27,79.09,15,0
    .goto 179,61.23,79.36,15,0
    .goto 179,60.97,79.56,15,0
    .goto 179,60.06,78.49,15,0
    .goto 179,59.77,78.08,15,0
    .goto 179,59.97,77.38,15,0
    >>地上有战利品 [|cRXP_LOOT_月叶|r]
    *|cRXP_WARN_You can see the location of [|cRXP_LOOT_Moonleaf|r on your minimap if you have|r |T133939:0|t[Find Herbs] |cRXP_WARN_enabled|r].
    .complete 24628,1 --Moonleaf (6)
	.skill herbalism,1,1
step
    .goto 179,60.64,74.63,0
    .goto 179,63.59,73.45,0
    .goto 179,62.70,76.04,0
    .goto 179,59.97,77.38,0
    .goto 179,60.64,74.63,15,0
    .goto 179,60.95,74.43,15,0
    .goto 179,61.19,74.67,15,0
    .goto 179,61.51,72.89,15,0
    .goto 179,63.38,73.45,15,0
    .goto 179,63.59,73.45,15,0
    .goto 179,66.17,71.64,15,0
    .goto 179,67.04,71.91,15,0
    .goto 179,67.18,75.96,15,0
    .goto 179,65.23,76.21,15,0
    .goto 179,62.70,76.04,15,0
    .goto 179,61.99,75.87,15,0
    .goto 179,61.44,78.34,15,0
    .goto 179,62.27,79.09,15,0
    .goto 179,61.23,79.36,15,0
    .goto 179,60.97,79.56,15,0
    .goto 179,60.06,78.49,15,0
    .goto 179,59.77,78.08,15,0
    .goto 179,59.97,77.38,15,0
    >>地上有战利品 [|cRXP_LOOT_月叶|r]
    .complete 24628,1 --Moonleaf (6)
    .skill herbalism,<1,1
step
    #requires Banshees
    .goto 179,68.72,73.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24627 >>交任务: |cRXP_FRIENDLY_兵临城下|r
    .accept 24646 >>接任务: |cRXP_WARN_夺回镰刀|r
	.target Lord Darius Crowley
step
    .goto 179,69.30,72.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法珊德拉·暴风爪|r交谈
    .turnin 24628 >>交任务: |cRXP_FRIENDLY_仪式前的准备|r
	.target Vassandra Stormclaw
step
    #optional
    #label Taldoren
    #completewith ScytheOfElune
    .goto 179,58.14,75.79
    .cast 71061 >>|cRXP_WARN_使用|r|T134229:0|t[塔尔多伦之角] |cRXP_WARN_来引开|r|cRXP_ENEMY_精练的暗影游侠|r的注意力
    .use 50134
    .unitscan Veteran Dark Ranger
step
    #optional
    #requires Taldoren
    #completewith ScytheOfElune
    .goto 179,57.85,75.95,8 >>进入房屋
step
    #label ScytheOfElune
    .goto 179,57.51,75.59
	>>打开里面的|cRXP_PICK_磨损的宝箱|r, 将其掠夺以获得[|cRXP_LOOT_神秘的古器|r]
    .complete 24646,1 --Mysterious Artifact (1)
    .use 50134
step
    .goto 179,68.72,73.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24646 >>交任务: |cRXP_FRIENDLY_夺回镰刀|r
    .accept 24593 >>接任务: |cRXP_WARN_非人非兽|r
	.target Lord Darius Crowley
step
    >>从|cRXP_PICK_愤怒之井|r和|cRXP_PICK_平静之井|r和|cRXP_PICK_平衡之井|r中饮水
    .complete 24593,1 --Well of Fury (1)
    .goto 179,68.98,72.80,-1
    .complete 24593,2 --Well of Tranquility (1)
    .goto 179,69.26,73.10,-1
    .complete 24593,3 --Well of Balance (1)
    .goto 179,69.14,73.52,-1
step
    .goto 179,68.72,73.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24593 >>交任务: |cRXP_FRIENDLY_非人非兽|r
    .accept 24673 >>接任务: |cRXP_WARN_返回风谷村|r
	.target Lord Darius Crowley
step
    #completewith next
    .hs >>炉石到风谷村
step
    .goto 179,59.86,91.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格温·阿姆斯特|r交谈
    .turnin 24673 >>交任务: |cRXP_FRIENDLY_返回风谷村|r
    .accept 24672 >>接任务: |cRXP_WARN_勇敢向前|r
	.target Gwen Armstead
step
    #optional
    #completewith next
    .goto 179,60.44,91.30,8,0
    .goto 179,68.80,85.65,45,0
    .goto 179,72.02,82.07,30,0
    .goto 179,72.73,80.05,12 >>前往|cRXP_FRIENDLY_Krennas Aranas|r
step
    .goto 179,72.73,80.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷纳斯·阿拉纳斯|r交谈
    .turnin 24672 >>交任务: |cRXP_FRIENDLY_勇敢向前|r
    .accept 24592 >>接任务: |cRXP_WARN_风暴海崖的背叛|r
	.target Krennas Aranas
step
    #optional
    #label Walden1
    #completewith Walden
    .goto 179,74.82,76.94,30,0
    .goto 179,76.67,72.75
    .subzone 4788 >>前往风暴之港
step
    #optional
    #sticky
    #label KrennanStealth
    #requires Walden1
    #completewith TempestBetrayal
    .cast 70456 >>|cRXP_WARN_使用|r|T135446:0|t[克伦南的隐身药水]|cRXP_WARN_后将进入|r|T132320:0|t[隐身状态]
    >>|cRXP_WARN_虽然|r|T132320:0|t[潜行]|cRXP_WARN_ 你可以施放大多数法术.  |T132320:0|t[潜行]|cRXP_WARN_ 进入战斗时会失效|r
    >>|cRXP_WARN_注意：|cRXP_ENEMY_高山猎犬|r的 |T132320:0|t[潜行] |cRXP_WARN_探测范围|r已提升
    .use 50218
step
    #optional
    #sticky
    #requires KrennanStealth
    #completewith TempestBetrayal
    +|cRXP_WARN_如果你|r |T132320:0|t[潜行] |cRXP_WARN_失效, 使用|r |T135446:0|t[克雷南的潜行药水] |cRXP_WARN_重新进入|r |T132320:0|t[潜行] |cRXP_WARN_状态(战斗中可用)|r
    >>|cRXP_WARN_潜行时|r|T132320:0|t[潜行]|cRXP_WARN_ 你可以施放大多数法术. |T132320:0|t[潜行]|cRXP_WARN_ 但进入战斗时会失效|r
    >>|cRXP_WARN_注意：|cRXP_ENEMY_高山猎犬|r的 |T132320:0|t[潜行] |cRXP_WARN_探测范围|r已提升
    .use 50218
step
    #optional
    #requires Walden1
    #completewith Walden
    .goto 179,74.82,76.94,30,0
    .goto 179,76.67,72.75,15,0
    .goto 179,76.84,72.10,12,0
    .goto 179,76.88,71.32,12,0
    .goto 179,78.25,70.46,15,0
    .goto 179,79.25,67.92,15,0
    .goto 179,79.29,64.84,35 >>小心地在建筑物与山丘之间穿行, 前往 |cRXP_ENEMY_沃登勋爵|r
step
    #label Walden
    .goto 179,79.29,64.84,30,0
    .goto 179,78.25,65.86,6,0
    .goto 179,78.03,66.47,4,0
    .goto 179,77.83,66.14,4,0
    .goto 179,78.20,65.97,4,0
    .goto 179,78.11,66.23
    >>击杀|r|cRXP_ENEMY_沃登勋爵|r
    >>|cRXP_WARN_他在这所房子的外部和楼上内部之间巡逻|r
    >>|cRXP_WARN_注意, 当他施放时|r|T132797:0|t[陈年白兰地]|cRXP_WARN_(远程瞬发:眩晕4秒并造成伤害)|r
    .complete 24592,2 --Lord Walden slain (1)
	.mob Lord Walden
step
    #optional
    #completewith next
    .goto 179,82.67,69.63,30,0
    .goto 179,84.22,72.50,30,0
    .goto 179,85.47,73.25,15,0
    .goto 179,79.29,64.84,35 >>前往|cRXP_ENEMY_灰葬男爵|r
step
    #label Ashbury
    .goto 179,85.44,74.22,15,0
    .goto 179,84.93,74.37,15,0
    .goto 179,84.21,74.80
    >>击杀|cRXP_ENEMY_灰葬男爵|r
    >>|cRXP_WARN_他在自家房屋的门之间巡逻|r
    .complete 24592,1 --Baron Ashbury slain (1)
	.mob Baron Ashbury
step
    #label TempestBetrayal
    .goto 179,78.28,72.07
    .use 50218 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
    .turnin 24592 >>交任务: |cRXP_FRIENDLY_风暴海崖的背叛|r
    .accept 24677 >>接任务: |cRXP_WARN_包抄被遗忘者|r
	.target King Genn Greymane
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r和|cRXP_FRIENDLY_麦格达·白墙|r和|cRXP_FRIENDLY_玛库斯|r交谈
    .turnin 24677 >>交任务: |cRXP_FRIENDLY_包抄被遗忘者|r
    .accept 24575 >>接任务: |cRXP_WARN_解放村民|r
    .goto 179,70.88,39.84
	.target +Lorna Crowley
    .accept 24675 >>接任务: |cRXP_WARN_最后的美餐|r
    .goto 179,70.65,39.70
	.target +Magda Whitewall
    .accept 24674 >>接任务: |cRXP_WARN_揭竿而起|r
    .goto 179,70.29,40.05,8,0
    .goto 179,70.63,40.12,8,0
    .goto 179,71.25,39.78
	.target +Marcus
step
    #loop
    .goto 179,75.70,39.60,0
    .goto 179,76.24,45.37,0
    .goto 179,77.83,35.81,0
    .goto 179,75.70,39.60,45,0
    .goto 179,76.12,42.77,45,0
    .goto 179,76.24,45.37,45,0
    .goto 179,77.22,46.97,45,0
    .goto 179,78.11,43.54,45,0
    .goto 179,78.05,38.73,45,0
    .goto 179,77.83,35.81,45,0
    >>击杀|cRXP_ENEMY_棕色雄鹿|r. 击败它们后搜刮 [|cRXP_LOOT_鹿肉|r]
    .complete 24675,1 --Side of Stag Meat (10)
	.mob Brown Stag
step
    #sticky
    #label Enslaved
    #loop
    .goto 180,64.14,74.25,0
    .goto 180,47.14,34.18,0
    .goto 179,75.71,31.17,0
    .waypoint 180,64.14,74.25,15,0
    .waypoint 180,64.24,67.89,15,0
    .waypoint 180,55.31,36.68,15,0
    .waypoint 180,50.40,27.86,15,0
    .waypoint 180,47.14,34.18,15,0
    .waypoint 180,41.60,26.07,15,0
    .waypoint 180,35.36,40.89,15,0
    .waypoint 180,27.38,59.96,15,0
    .waypoint 180,27.12,66.71,15,0
    .waypoint 179,75.71,31.17,15,0
    >>击杀|cRXP_ENEMY_被遗忘者奴隶主|r. 击败他们后可获得 |T134247:0|t[|cRXP_LOOT_奴隶主之钥|r]
    >>使用 |T134247:0|t[|cRXP_LOOT_奴隶主的钥匙|r] 对准 |cRXP_FRIENDLY_被奴役的村民|r 的 |cRXP_PICK_链球|r, 以解救位于艾姆伯石矿场内部及周围的他们
    .collect 49881,5,24575,1,-1 --Slaver's Key (5)
    .complete 24575,1 --Enslaved Gilnean freed (5)
	.mob Forsaken Slavedriver
	.target Enslaved Villagers
--XX may need key drop
step
    #optional
    #label Emberstone1
    #completewith Brothogg
    .goto 179,76.71,30.84,10 >>进入熔石矿井
    .isOnQuest 24674
step
    #optional
    #requires Emberstone1
    #completewith Brothogg
    .goto 180,29.52,60.93,15,0
    .goto 180,34.05,48.96,15,0
    .goto 180,34.48,33.25,15,0
    .goto 180,56.95,38.04,15,0
    .goto 180,58.17,42.57,15,0
    .goto 180,54.26,81.11,10 >>前往奴隶主博罗索格内部
    .isOnQuest 24674
step
    #label Brothogg
    .goto 180,54.26,81.11
    >>击杀 |cRXP_ENEMY_奴隶主博罗索格|rinside
    .complete 24674,1 --Brothogg the Slavemaster slain (1)
	.mob Brothogg the Slavemaster
step
    #optional
    #requires Enslaved
    #completewith next
    .goto 179,76.71,30.84,10 >>离开余烬石矿井
    .subzoneskip 4732,1
step << skip
    #requires Enslaved
	#completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
    .subzoneskip 4732,1
--XX skipping because theres 0 repair vendors in Gilneas past duskhaven?
step
    #requires Enslaved
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格达·白墙|r和|cRXP_FRIENDLY_玛库斯|r和|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24675 >>交任务: |cRXP_FRIENDLY_最后的美餐|r
    .goto 179,70.65,39.70
	.target +Magda Whitewall
    .turnin 24674 >>交任务: |cRXP_FRIENDLY_揭竿而起|r
    .goto 179,70.29,40.05,8,0
    .goto 179,70.63,40.12,8,0
    .goto 179,71.25,39.78
	.target +Marcus
    .turnin 24575 >>交任务: |cRXP_FRIENDLY_解放村民|r
    .accept 24676 >>接任务: |cRXP_WARN_手刃仇人|r
    .goto 179,70.88,39.84
	.target +Lorna Crowley
step
    #sticky
    #label Infantry
    #loop
	.goto 179,74.71,27.21,0
	.goto 179,73.51,30.96,0
	.goto 179,71.72,31.08,0
	.waypoint 179,74.71,27.21,45,0
	.waypoint 179,74.95,27.98,45,0
    .waypoint 179,73.54,29.99,45,0
	.waypoint 179,73.51,30.96,45,0
    .waypoint 179,72.88,29.98,45,0
	.waypoint 179,72.30,30.37,45,0
    .waypoint 179,71.90,29.52,45,0
	.waypoint 179,71.72,31.08,45,0
    >>击杀 |cRXP_ENEMY_被遗忘者士兵|r
	.complete 24676,1 --Forsaken Infantry slain (4)
	.mob Forsaken Infantry
step
    #sticky
    #label Cornell
	.goto 179,72.86,28.42
    >>击杀|cRXP_ENEMY_执行官柯奈尔|r
    .complete 24676,2 --Executor Cornell (1)
	.mob Executor Cornell
step
	.goto 179,74.15,27.40
    >>击杀|cRXP_ENEMY_Valov the Mad|r
    .complete 24676,3 --Valnov the Mad slain (1)
	.mob Valnov the Mad
step
    #optional
    #requires Cornell
--XXREQ Placeholder invis step until multiple requires per step
step
    #requires Infantry
    .goto 179,70.88,39.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24676 >>交任务: |cRXP_FRIENDLY_手刃仇人|r
    .accept 24904 >>接任务: |cRXP_WARN_吉尔尼斯城保卫战|r
	.target Lorna Crowley
step
    #optional
    #label GoreTravel1
    #completewith Gorerot
    .goto 179,67.43,44.08,30,0
    .goto 202,70.99,40.78,30,0
    .goto 202,70.53,49.79,30,0
    .goto 202,69.29,63.84,30,0
    .goto 202,67.38,65.22,30,0
    >>|cRXP_WARN_Ignore|cRXP_FRIENDLY_价格 利亚姆·格雷曼|r.'s RP
    >>如果你不小心引来了任何怪物, 或者需要清理路径, 请进入附近的|cRXP_FRIENDLY_烬石大炮|r
    >>处于 |cRXP_FRIENDLY_烬石大炮|r时:
    >>施放 |T252185:0|t[烬石大炮] (1) (远程瞬发:造成大量伤害)
    >>|cRXP_WARN_请将|r|T135340:0|t[吉尔尼斯捍卫者之剑]|cRXP_WARN_装备在你的|r|cRXP_FRIENDLY_吉尔尼斯民兵|r卫士身上, 以提升他们的急速和生命回复速率|r
    .goto 202,61.86,70.83,30 >>前往|cRXP_ENEMY_腐血怪|r
    .target Emberstone Cannon
    .use 50334
step
    #optional
    #requires GoreTravel1
    #completewith Gorerot
    #loop
    .goto 202,59.74,63.47,15,0
    .goto 202,55.39,68.35,15,0
    .goto 202,60.09,77.28,15,0
    .goto 202,63.20,80.72,15,0
-- .goto 202,68.34,82.00,15,0
    +进入附近的|cRXP_FRIENDLY_损坏的投石车|r
    >>在处于|cRXP_FRIENDLY_损坏的投石车|r时:
    >>施放|r|T132386:0|t[燃烧石] (1) (远程瞬发:施加|r|T132386:0|t[燃烧石]减益效果, 在30秒内持续造成火焰伤害, 不可叠加). 每30秒刷新一次该减益效果, 可造成大量伤害
    .target Damaged Catapult
    .use 50334
step
    #label Gorerot
    .goto 202,57.73,66.59
    >>击杀|cRXP_ENEMY_腐血怪|r
    >>|cRXP_WARN_不用担心会受到他的攻击, 因为你拥有|r|T236310:0|t[吉尔尼斯城之战的士兵]|cRXP_WARN_增益(被动光环:大幅提高急速和生命值回复和资源恢复)|r
    >>|cRXP_WARN_请将|r|T135340:0|t[吉尔尼斯捍卫者之剑]|cRXP_WARN_装备在你的|r|cRXP_FRIENDLY_吉尔尼斯民兵|r卫士身上, 以提升他们的急速和生命回复速率|r
    .complete 24904,1 --Gorerot slain (1)
	.mob Gorerot
step
    #optional
    #completewith next
    .goto 202,57.73,77.33,30,0
    .goto 202,48.15,75.63,20,0
    .goto 202,48.26,72.93,20,0
    .goto 202,50.12,70.54,20,0
    .goto 202,41.51,62.98,20,0
    .goto 202,36.17,62.68,50 >>前往|cRXP_ENEMY_希尔瓦娜斯·风行者|r
step
    .goto 202,36.17,62.68
    >>杀死|cRXP_ENEMY_被束缚灵魂的女妖|r
    >>击败希尔瓦娜斯·风行者, 使其生命值降至30%以下
    .complete 24904,2 --Battle for Gilneas City Complete (1)
    .timer 15,The Battle for Gilneas City RP
    .mob Soultethered Banshees
    .mob Lady Sylvanas Windrunner
step
    #optional
    #completewith next
    >>|cRXP_WARN_等待RP结束|r
    .goto 202,36.89,59.09,8 >>进入房屋
step
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24904 >>交任务: |cRXP_FRIENDLY_吉尔尼斯城保卫战|r
    .accept 24902 >>接任务: |cRXP_WARN_追踪希尔瓦娜斯|r
    .timer 193.5,The Hunt For Sylvanas RP
	.target Lorna Crowley
step
    .goto 202,36.17,62.68,0
    .goto 202,36.49,59.34,8,0
    .goto 202,36.44,47.99,12,0
    .goto 202,35.22,41.12,12,0
    .goto 202,40.17,31.05,12,0
    .goto 202,40.82,40.67,10,0
    .goto 202,43.46,44.64,10,0
    .goto 202,45.06,50.85
    >>|cRXP_WARN_跟随|cRXP_FRIENDLY_托比亚斯·密斯特曼托|r保持近距离, 否则他将不会移动, 并可能消失|r
    >>|cRXP_WARN_跟随他, 直到他在大教堂内的水中藏身, 然后等待RP|r
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_托比亚斯·密斯特曼托|r亡故, 跳过此步骤|r
    .complete 24902,1 --Hunt for Sylvanas (1)
	.target Tobias Mistmantle
	.target Lorna Crowley
    .isOnQuest 24092
step
    #optional
    #completewith next
    .goto 202,43.04,44.05,10,0
    .goto 202,40.40,40.31,10,0
    .goto 202,37.25,44.17,12,0
    .goto 202,38.92,59.78,6,0
    .goto 202,38.62,60.25,8 >>返回至|cRXP_FRIENDLY_罗娜·克罗雷|r
    .isQuestComplete 24902
step
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24902 >>交任务: |cRXP_FRIENDLY_追踪希尔瓦娜斯|r
    .accept 24903 >>接任务: |cRXP_WARN_复仇或是生存|r
	.target Lorna Crowley
    .isQuestComplete 24902
step
    #optional
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .accept 24903 >>接任务: |cRXP_WARN_复仇或是生存|r
	.target Lorna Crowley
    .isQuestTurnedIn 24902
step
    #optional
    #completewith next
    .abandon 24902 >>放弃追踪希尔瓦娜斯
step
    #optional
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t 与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .accept 24902 >>接任务: |cRXP_WARN_追踪希尔瓦娜斯|r
    .timer 193.5,The Hunt For Sylvanas RP
	.target Lorna Crowley
step
    #optional
    .goto 202,36.17,62.68,0
    .goto 202,36.49,59.34,8,0
    .goto 202,36.44,47.99,12,0
    .goto 202,35.22,41.12,12,0
    .goto 202,40.17,31.05,12,0
    .goto 202,40.82,40.67,10,0
    .goto 202,43.46,44.64,10,0
    .goto 202,45.06,50.85
    >>|cRXP_WARN_跟随|cRXP_FRIENDLY_托比亚斯·密斯特曼托|r保持近距离, 否则他将不会移动, 并可能消失|r
    >>|cRXP_WARN_跟随他, 直到他在大教堂内的水中藏身, 然后等待RP|r
    .complete 24902,1 --Hunt for Sylvanas (1)
	.target Tobias Mistmantle
	.target Lorna Crowley
    .isOnQuest 24092
step
    #optional
    #completewith next
    .goto 202,43.04,44.05,10,0
    .goto 202,40.40,40.31,10,0
    .goto 202,37.25,44.17,12,0
    .goto 202,38.92,59.78,6,0
    .goto 202,38.62,60.25,8 >>返回至|cRXP_FRIENDLY_罗娜·克罗雷|r
step
    #optional
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 24902 >>交任务: |cRXP_FRIENDLY_追踪希尔瓦娜斯|r
    .accept 24903 >>接任务: |cRXP_WARN_复仇或是生存|r
	.target Lorna Crowley
step
    #optional
    .goto 202,38.62,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .accept 24903 >>接任务: |cRXP_WARN_复仇或是生存|r
	.target Lorna Crowley
step
    #optional
    #requires GennHouse1
    #completewith Vengeance
    .goto 202,32.10,58.01,8 >>进入|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r.的宅邸
step
    #label Vengeance
    .goto 202,32.36,57.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
    .turnin 24903 >>交任务: |cRXP_FRIENDLY_复仇或是生存|r
    .accept 24920 >>接任务: |cRXP_WARN_拖延不可避免的局势|r
	.target King Genn Greymane
step
    #optional
    #label RidingBat
    #completewith Survival
    .goto 202,30.24,60.96
    .vehicle >>进入被俘的骑乘蝙蝠
    .timer 21,Slowing the Inevitable RP
    .target Captured Riding Bat
step
    #optional
    #requires RidingBat
    #completewith Survival
    .goto 179,57.11,39.50,5 >>|cRXP_WARN_等待RP结束|r
step
    #label Survival
    .goto 179,54.83,35.83,-1
    .goto 179,56.43,28.49,-1
    .goto 179,56.77,20.70,-1
    .goto 179,57.12,15.66,-1
    .goto 179,61.45,19.86,-1
    .goto 179,64.89,27.43,-1
    .goto 179,61.30,35.14,-1
    >>在骑乘被俘的骑乘蝙蝠时:
    >>击杀|cRXP_ENEMY_被遗忘者天灾锻造师|r和|cRXP_ENEMY_入侵的被遗忘者|r和|cRXP_ENEMY_被遗忘者投石车|r
    >>施放 |T133709:0|t[铁炸弹] (1) (远程瞬发:造成伤害)
    .complete 24920,2 --Invading Forsaken (40)
    .complete 24920,1 --Forsaken Catapult slain (6)
    .mob Forsaken Catapult
    .mob Invading Forsaken
step
    #optional
    #completewith next
    >>在骑乘被俘的骑乘蝙蝠时:
    .goto 202,30.43,60.88,5 >>使用 |T132182:0|t[飞回] (2) 返回至|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r
step
    .goto 202,32.36,57.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩·格雷迈恩国王|r交谈
    .turnin 24920 >>交任务: |cRXP_FRIENDLY_拖延不可避免的局势|r
    .accept 24678 >>接任务: |cRXP_WARN_齐膝的危险|r
	.target King Genn Greymane
step
    #optional
    #completewith next
    .goto 202,33.75,57.09,6 >>下楼进入墓穴
step
    #optional
    #completewith Knee
    .goto 179,53.56,55.10,20,0
    .goto 179,49.87,57.26,10,0
    >>|cRXP_WARN_使用|r |T135432:0|t[烧了一半的火把] |cRXP_WARN_来驱散 |cRXP_ENEMY_腐烂蛆虫|r和|cRXP_ENEMY_地下蜘蛛|r和|r |cRXP_ENEMY_墓地老鼠|r
    .goto 179,49.78,57.88,6 >>前往墓穴尽头
    .mob Putrescent Maggot
    .mob Underground Spider
    .mob Graveyard Rat
    .use 50220
step
    #label Knee
    .goto 179,49.71,57.28,8,0
    .goto 179,49.84,56.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷南·阿朗纳斯|cRXP_FRIENDLY_克雷南·阿朗纳斯|r交谈
    .turnin 24678 >>交任务: |cRXP_FRIENDLY_齐膝的危险|r
    .accept 24602 >>接任务: |cRXP_WARN_入土为安|r
    .target Krennan Aranas
step
    #loop
    .goto 179,48.60,54.28,0
    .goto 179,46.85,54.23,0
    .goto 179,46.71,56.03,0
    .goto 179,49.33,49.77,0
    .goto 179,51.18,54.22,0
    .goto 179,48.60,54.28,15,0
    .goto 179,48.08,54.11,15,0
    .goto 179,47.59,53.54,15,0
    .goto 179,46.85,54.23,15,0
    .goto 179,48.04,56.35,15,0
    .goto 179,46.71,56.03,15,0
    .goto 179,45.76,54.87,15,0
    .goto 179,45.80,53.49,15,0
    .goto 179,46.79,53.32,15,0
    .goto 179,48.82,50.70,15,0
    .goto 179,49.33,49.77,15,0
    .goto 179,51.01,53.23,15,0
    .goto 179,51.18,54.22,15,0
    >>打开地面上的|cRXP_PICK_扰动的土壤|r, 从中拾取 [|cRXP_LOOT_被发掘的纪念物|r]
    .complete 24602,1 --Unearthed Memento (5)
step
    .goto 179,49.84,56.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷南·阿朗纳斯|r交谈
    .turnin 24602 >>交任务: |cRXP_FRIENDLY_入土为安|r
    .accept 24679 >>接任务: |cRXP_WARN_先祖的祝福|r
    .target Krennan Aranas
step
    .goto 179,48.89,53.14
    >>将 |T134344:0|t[神圣供品] 放置在圣坛上
	>>|cRXP_WARN_按键盘上的“Esc”键跳过过场动画|r.
    .complete 24679,1 --Offering placed (1)
    .use 51956
step
    .goto 179,49.84,56.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克雷南·阿朗纳斯|r交谈
    .turnin 24679 >>交任务: |cRXP_FRIENDLY_先祖的祝福|r
    .accept 24680 >>接任务: |cRXP_WARN_覆舟海湾|r
	.target Krennan Aranas
step
    .goto 179,41.93,37.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24680 >>交任务: |cRXP_FRIENDLY_覆舟海湾|r
    .accept 24681 >>接任务: |cRXP_WARN_他们有盟友，我们也有|r
	.target Lord Darius Crowley
step
    #optional
    #label Glaive
	#completewith Allies
    .goto 179,42.47,37.84
    .vehicle >>进入|cRXP_FRIENDLY_投刃车|r
    .target Glaive Thrower
step
    #optional
    #requires Glaive
    #completewith Allies
    .goto 179,40.32,38.58,20,0
    .goto 179,35.59,35.80
    >>在|cRXP_FRIENDLY_投刃车|r附近时:
    .subzone 4725 >>前往高地岬
step
    #label Allies
    #loop
    .goto 179,35.03,36.16,0
    .goto 179,31.05,20.09,0
    .goto 179,28.07,23.84,0
    .goto 179,26.35,29.74,0
    .goto 179,30.78,38.88,0
    .goto 179,35.03,36.16,60,0
    .goto 179,31.05,20.09,60,0
    .goto 179,29.52,21.20,60,0
    .goto 179,28.07,23.84,60,0
    .goto 179,27.64,25.32,60,0
    .goto 179,26.83,26.13,60,0
    .goto 179,27.64,27.00,60,0
    .goto 179,26.35,29.74,60,0
    .goto 179,26.56,31.40,60,0
    .goto 179,30.78,38.88,60,0
    >>在|cRXP_FRIENDLY_投刃车|r附近时:
    >>击杀|cRXP_ENEMY_兽人掠夺者|r和|cRXP_ENEMY_狼喉护卫|r和|cRXP_ENEMY_兽人战争机器|r
    >>施放 |T132330:0|t[投掷飞斧] (1) (远程瞬发:造成伤害并击退)
    >>|T236303:0|t[飞斧风暴] (2) (远程瞬发:造成大量伤害并击退)
    >>|T136106:0|t[双倍速度] (3) (瞬发:移动速度提高100%, 持续10秒)
    >>|cRXP_WARN_不要让|r|cRXP_FRIENDLY_投刃车|r倒下|r
    .complete 24681,1 --Orc Raider slain (40)
    .complete 24681,2 --Wolfmaw Outrider slain (8)
    .complete 24681,3 --Orcish War Machine slain (4)
step
    #optional
    #completewith next
    .goto 179,41.93,37.60
    >>在|cRXP_FRIENDLY_投刃车|r附近时:
    >>施放 |T136106:0|t[双倍速度] (3) (自身瞬发:移动速度提升100%, 持续10秒)
    .subzone 4726 >>返回覆舟海湾
step
    .goto 179,41.93,37.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达利乌斯·克罗雷领主|r交谈
    .turnin 24681 >>交任务: |cRXP_FRIENDLY_他们有盟友，我们也有|r
	.target Lord Darius Crowley
step
    .goto 179,41.65,36.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .accept 26706 >>接任务: |cRXP_WARN_最后的较量|r
	.target Lorna Crowley
step
	#completewith next
    .goto 179,41.65,36.14
    >>|cRXP_WARN_NOTE:此任务使用独立计时器, 这意味着你最多需要等待5分钟才能进入|r|cRXP_FRIENDLY_角鹰兽|r
    .vehicle >>进入|cRXP_FRIENDLY_角鹰兽|r
	.timer 58,Endgame RP
step
    >>击杀顶层甲板上的炮艇兽人步兵
    >>After clearing the top deck, |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Rope|r in the middle of the boat to follow |cRXP_FRIENDLY_Lorna Crowley|r.
    >>击杀|cRXP_ENEMY_炮艇兽人步兵|r, 同时跟随|cRXP_FRIENDLY_罗娜·克罗雷|r
    >>|cRXP_WARN_After|cRXP_FRIENDLY_罗娜·克罗雷|r放置炸药后, 请等待剧情播放|r
    .complete 26706,1 --Gunship destroyed (1)
	.timer 43,Endgame RP
    .mob Gunship Grunt
    .target Lorna Crowley
--XX Gunship moves, can't use waypoints and timer may be off
step
    .goto 179,41.65,36.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗娜·克罗雷|r交谈
    .turnin 26706 >>交任务: |cRXP_FRIENDLY_最后的较量|r
	.target Lorna Crowley
step
    .goto 179,42.59,35.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_|夜风将军|r交谈
    .accept 14434 >>接任务: |cRXP_WARN_鲁瑟兰村|r
    .turnin 14434 >>交任务: |cRXP_FRIENDLY_鲁瑟兰村|r
	.target Admiral Nightwind
step
    #completewith next
    .goto 57,52.28,89.47
    .zone 12 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_到埃索达的传送门|r
    .zoneskip 37
    .zoneskip 84
    .zoneskip 103
    .nodmf
step
    #completewith next
    .goto 103,41.752,72.550
    .zone 103 >>进入埃索达
    .zoneskip 37
    .zoneskip 84
    .nodmf
step
    .goto 103,42.133,66.528,30,0
    .goto 103,40.432,62.485,30,0
    .goto 103,37.317,60.966,30,0
    .goto 103,34.295,62.822,30,0
    .goto 103,48.335,62.929
    >>产卵下螺旋楼梯
    .zone 84 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通往暴风城的传送门|r
    .zoneskip 37
    .nodmf
step
    #optional
    #completewith DarkmoonFaire
    .goto 57,55.045,88.301
    .zone 89 >>穿过传送门前往达纳苏斯
    .dmf
step
    #veteran
    .goto 89,56.58,60.73,10,0
    .goto 89,54.82,59.18
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r. 你需要从拍卖行购买|cRXP_WARN_某些物品, 以充分利用这一活动|r. 如有必要, |cRXP_WARN_你可以从其他角色转移金币来进行这些购买|r. 不过, 如果你发现无法负担所有物品, |cRXP_WARN_仍然值得前往暗月马戏团, 以获取临时的经验加成, 并仅购买其中部分物品即可|r
    >>|cRXP_WARN_ 建议使用另一个拥有至少10,000金币的角色登录. 用该角色购买物品后, 再将它们发送过来|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师|r交谈
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Tolon
    .target Auctioneer Golothas
    .target Auctioneer Cazarez
    .target Auctioneer Golothas
    .dmf
step
    #fresh
    #completewith DarkmoonFaire
    +暗月马戏团活动现已开启, |cRXP_WARN_这将保证你免费获得一个额外等级, 并获得临时的10%经验加成|r
    .dmf
step
    #label DarkmoonFaire
    .goto 89,38.58,49.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
	.target Darkmoon Faire Mystic
    .dmf
step
    .goto 89,38.58,49.38
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗月马戏团秘法师|r交谈
    .skipgossip
    .zoneskip 37
    .dmf
    .target Darkmoon Faire Mystic Mage
]])

--DarkIronDwarf Shadowforge City
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 黑铁矮人入门
#displayname |cFF00CCFF1|r - 暗炉堡城 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< DarkIronDwarf !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 1186,56.43,31.86
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茉艾拉·索瑞森|r交谈
--     .accept 51486 >>接任务: |cRXP_WARN_为了联盟|r
--     .target Moira Thaurissan
-- step
--     #completewith next
--     .goto 1186,59.27,26.52
--     .cast 281587 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_挖掘机|r
-- step
--     .goto 84,53.059,15.259
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
--     .turnin 51486 >>交任务: |cRXP_FRIENDLY_为了联盟|r
--     .accept 53500 >>接任务: |cRXP_WARN_异乡异客|r 
--     .target Ambassador Moorgard
-- step
--     .goto 84,56.257,17.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
--     *|cRXP_WARN_Select "大地的裂变"|r
--     .complete 53500,1 --与克罗米交谈 (1)
--     .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
--     .skipgossipid 51901
--     .target Chromie
-- step
--     .goto 84,56.199,17.671
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mudrik Leger|r交谈
--     .turnin 53500 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Mudrik Leger << DarkIronDwarf
-- step
--     .goto 84,62.16,30.14
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与前方的|cRXP_FRIENDLY_英雄传令官|r交谈, 地点在英雄的召唤布告牌前
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .isQuestTurnedIn 51486
--     .target Hero's Herald
]])

--KulTiran Boralus
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 库尔提拉斯介绍
#displayname |cFF00CCFF1|r - 伯拉勒斯 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< KulTiran !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 1161,67.71,21.77
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯瑟琳·普罗德摩尔|r交谈
--     .accept 55142 >>接任务: |cRXP_WARN_为了联盟|r
--     .target Katherine Proudmoore
-- step
--     .goto 1161,67.15,22.9,10,0
--     .goto 1161,67.44,21.4,10,0
--     .goto 1161,68.87,21.12,10,0
--     .goto 1161,70.47,17.11,10,0
--     .goto 1161,70.1,16.8
--     >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_暴风城传送门|r
--     .complete 55142,1 --1/1 Portal to Stormwind Taken
-- step
--     .goto 84,53.059,15.259
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
--     .turnin 55142 >>交任务: |cRXP_FRIENDLY_为了联盟|r
--     .accept 55146 >>接任务: |cRXP_WARN_异乡异客|r
--     .target Ambassador Moorgard
-- step
--     .goto 84,56.257,17.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
--     *|cRXP_WARN_Select "大地的裂变"|r
--     .complete 55146,1 << KulTiran --与克罗米交谈 (1)
--     .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
--     .skipgossipid 51901
--     .target Chromie
-- step
--     .goto 84,56.199,17.671
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_补给官弗雷|r交谈
--     .turnin 55146 >>交任务: |cRXP_FRIENDLY_异乡异客|r << KulTiran
--     .target Provisioner Fray
-- step
--     .goto 84,62.16,30.14
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .isQuestTurnedIn 55142
--     .target Hero's Herald
]])

--LightforgedDraenei The Vindicaar
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 光铸德莱尼入门任务
#displayname |cFF00CCFF1|r - 维迪卡尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< LightforgedDraenei !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 940,49.2,43.8
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法瑞娅队长|r交谈
--     .accept 49772 >>接任务: |cRXP_WARN_为了联盟|r
--     .target Captain Fareeya
-- step
--     #completewith next
--     .goto 941,43.180,24.938
--     >>下楼
--     .zone 84 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通往暴风城的传送门|r
-- step
--     .goto 84,53.059,15.259
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
--     .turnin 49772 >>交任务: |cRXP_FRIENDLY_为了联盟|r 
--     .accept 50313 >>接任务: |cRXP_WARN_异乡异客|r
--     .target Ambassador Moorgard
-- step
--     .goto 84,56.257,17.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
--     *|cRXP_WARN_Select "大地的裂变"|r
--     .complete 50313,1 << LightforgedDraenei --与克罗米交谈 (1)
--     .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
--     .skipgossipid 51901
--     .target Chromie
-- step
--     .goto 84,56.199,17.671
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维盾者Minkey|r交谈
--     .turnin 50313 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Vindicator Minkey
-- step
--     .goto 84,62.16,30.14
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .isQuestTurnedIn 49772
--     .target Hero's Herald
]])

--Mechagnome Mechagon City
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 机械侏儒介绍
#displayname |cFF00CCFF1|r - 麦卡贡市 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< Mechagnome !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 1573,18.67,67.5
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶技师梅卡托克|r交谈
--     .accept 58146 >>接任务: |cRXP_WARN_为了联盟|r
--     .target High Tinker Mekkartonque
-- step
--     .goto 1573,20.5,60.0
--     >>在暴风城传送装置上行走|cRXP_WARN_on|r
--     .complete 58146,1 --1/1 前往: |cRXP_PICK_暴风城|r
-- step
--     .goto 84,53.059,15.259
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
--     .turnin 58146 >>交任务: |cRXP_FRIENDLY_为了联盟|r
--     .accept 58147 >>接任务: |cRXP_WARN_异乡异客|r 
--     .target Ambassador Moorgard
-- step
--     .goto 84,56.257,17.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
--     *|cRXP_WARN_Select "大地的裂变"|r
--     .complete 58147,1 --与克罗米交谈 (1)
--     .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
--     .skipgossipid 51901
--     .target Chromie
-- step
--     .goto 84,56.199,17.671
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lulana|r交谈
--     .turnin 58147 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Lulana
-- step
--     .goto 84,62.16,30.14
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .isQuestTurnedIn 58146
--     .target Hero's Herald
]])

--VoidElf Telogrus Rift
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 虚空精灵介绍
#displayname |cFF00CCFF1|r - 泰洛古斯裂隙 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next BA)艾尔文森林

<< VoidElf !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 971,28.5,22.3
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾拉莉亚|r交谈
--     .accept 49788 >>接任务: |cRXP_WARN_为了联盟|r
--     .target Alleria
-- step
--     #completewith next
--     .goto 971,27.99,21.50
--     .zone 84 >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_通往暴风城的传送门|r
-- step
--     .goto 84,53.059,15.259
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_使者莫加德|r交谈
--     .turnin 49788 >>交任务: |cRXP_FRIENDLY_为了联盟|r
--     .accept 50305 >>接任务: |cRXP_WARN_异乡异客|r
--     .target Ambassador Moorgard
-- step
--     .goto 84,56.257,17.311
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
--     >>|cRXP_WARN_Select "大地的裂变"|r
--     .complete 50305,1 --与克罗米交谈 (1)
--     .accept 60891 >>接任务: |cRXP_WARN_大地的裂变：东部王国的冒险|r
--     .skipgossipid 51901
--     .target Chromie
-- step
--     .goto 84,56.199,17.671
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉 Onyxraven|r交谈
--     .turnin 50305 >>交任务: |cRXP_FRIENDLY_异乡异客|r 
--     .target Keira Onyxraven
-- step
--     .goto 84,62.16,30.14
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hero's Herald|r交谈
--     .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
--     .isQuestTurnedIn 49788
--     .target Hero's Herald
]])

-- ====================================
-- =======  HORDE  ZONES ==============
-- ====================================

--Blood Elf Sunstrider Isle
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ab) 逐日岛
#displayname 逐日岛 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next AC) 血精灵 永歌森林
#defaultfor BloodElf !DK

<< Horde

step
    .zoneskip 1727
    #completewith SunstriderIsleFirstQuestCheck
    +欢迎来到 |cfff78300血精灵起始区域|r. RestedXP 指南
    *This route is roughly 10-20 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
step
    .zoneskip 1727,1
    +你位于流放者之角, 但当前指南针对的是|cfff78300血精灵起始区域|r
    +请选择流放者高地向导
step
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label SunstriderIsleFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .goto 467,61.04,45.13
    .accept 8325 >>接任务: |cRXP_LOOT_夺回逐日岛|r
    .target Magistrix Erona
step
    >>击杀|cRXP_ENEMY_法力浮龙|r
    .goto 467,60.6,52.5
    .complete 8325,1 --6/6 Mana Wyrm slain
    .mob Mana Wyrm
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .goto 467,61.0,45.1
    .turnin 8325 >>交任务: |cRXP_FRIENDLY_夺回逐日岛|r
    .accept 8326 >>接任务: |cRXP_LOOT_令人遗憾的措施|r
    .target Magistrix Erona
step
    >>击杀|cRXP_ENEMY_魔泉山猫幼崽|r 和|cRXP_ENEMY_魔泉山猫|r , 击败它们后拾取 [|cRXP_LOOT_项圈|r ]
    .goto 467,65.77,39.97,20,0
    .goto 467,68.40,37.61,20,0
    .goto 467,63.49,33.62,30,0
    .goto 467,68.13,34.18
    .complete 8326,1 --8/8 Lynx Collar
    .mob Springpaw Cub
    .mob Springpaw Lynx
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师艾洛娜|r交谈
    .goto 467,61.0,45.1
    .turnin 8326 >>交任务: |cRXP_FRIENDLY_令人遗憾的措施|r
    .accept 8327 >>接任务: |cRXP_LOOT_向兰萨恩·派雷隆报到|r
    .target Magistrix Erona
step << Warlock
    #completewith next
    +|cfff78300提醒:使用 |T136218:0|t召唤地狱火小鬼来召唤你的宠物|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t走上坡道, 与|cRXP_FRIENDLY_护井者索兰尼亚|r交谈
    .goto 467,65.18,45.72,5,0
    .goto 467,65.81,44.45,5,0
    .goto 467,65.43,42.94,5,0
    .goto 467,64.49,42.17,5,0
    .goto 467,63.9,42.8
    .accept 37442 >>接任务: |cRXP_LOOT_达斯雷玛的神龛|r
    .accept 37443 >>接任务: |cRXP_LOOT_索兰尼亚的物品|r
    .target Well Watcher Solanian
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师伊塔纳斯|r交谈
    .goto 467,61.8,39.3
    .accept 37440 >>接任务: |cRXP_LOOT_奥术薄片|r
    .target Arcanist Ithanas
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师赫里恩|r交谈
    .goto 467,58.45,38.79
    .accept 37439 >>接任务: |cRXP_LOOT_无尽的渴求|r
    .target Arcanist Helion
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰萨恩·派雷隆|r交谈
    .goto 467,52.9,49.8
    .turnin 8327 >>交任务: |cRXP_FRIENDLY_向兰萨恩·派雷隆报到|r
    .accept 8334 >>接任务: |cRXP_LOOT_攻势|r
    .target Lanthan Perilon
step
    #sticky
    #label EversongWoodsArcaneSilver
    >>击杀|cRXP_ENEMY_法力浮龙|r. 从它们身上掠夺 [|cRXP_LOOT_银币|r]
    .goto 467,50.15,40.74
    .complete 37440,1 --6/6 Arcane Sliver
    .mob Mana Wyrm
step
    >>在|cRXP_ENEMY_法力浮龙|r旁边使用|T136222:0|t[奥术洪流]
    .goto 467,53.1,40.5
    .complete 37439,1 --1/1 Arcane Torrent unleashed
step
    #requires EversongWoodsArcaneSilver
    #completewith EversongWoodsSecondBelonging
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r在旁边
    .complete 8334,2 --7/7 Feral Tender slain
    .complete 8334,1 --7/7 Tender slain
    .mob Tender
    .mob Feral Tender
step
    #requires EversongWoodsArcaneSilver
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击发光的 [|cRXP_LOOT_达斯雷玛的神龛|r]
    .goto 467,35.3,40.2
    .complete 37442,1 --1/1 Shrine of Dath'Remar Read
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾起地上的 [|cRXP_LOOT_天灾魔法卷轴|r]
    .goto 467,40.4,50.5
    .complete 37443,2 --1/1 Scroll of Scourge Magic
step
    #label EversongWoodsSecondBelonging
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取 [|cRXP_LOOT_Solanian's Srying Orb|r]
    .goto 467,52.2,69.4
    .complete 37443,1 --1/1 Solanian's Scrying Orb
step
    >>击杀|cRXP_ENEMY_凶猛的树人嫩苗|r和|cRXP_ENEMY_凶猛的树人嫩苗|r
    .goto 467,54.76,70.68
    .complete 8334,2 --7/7 Feral Tender slain
    .complete 8334,1 --7/7 Tender slain
    .mob Tender
    .mob Feral Tender
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 [|cRXP_LOOT_索兰尼亚的日记|r]
    .goto 467,60.1,57.1
    .complete 37443,3 --1/1 Solanian's Journal
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰萨恩·派雷隆|r交谈
    .goto 467,52.9,49.8
    .turnin 8334 >>交任务: |cRXP_FRIENDLY_攻势|r
    .accept 8335 >>接任务: |cRXP_LOOT_放逐者菲伦德雷|r
    .target Lanthan Perilon
step
    #completewith EversongWoodsFelendrenHead
    >>在前往学院的路上击杀奥术怨灵和被污染的奥术怨灵
    .complete 8335,1 --8/8 Arcane Wraith slain
    .complete 8335,2 --2/2 Tainted Arcane Wraith slain
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
step
    #completewith EversongWoodsFelendrenHead
    .goto 467,41.59,61.88,15,0
    .goto 467,42.40,66.28,15,0
    .goto 467,44.01,69.31,5,0
    .goto 467,43.05,71.29,5,0
    .goto 467,41.12,71.24,15,0
    .goto 467,41.00,72.53,5,0
    .goto 467,40.35,73.98,5,0
    .goto 467,39.12,74.24,5,0
    .goto 467,38.00,73.02,5,0
    .goto 467,37.80,69.96,15,0
    .goto 467,38.43,65.79,10,0
    .goto 467,40.17,64.78,8,0
    .goto 467,40.01,62.64,8,0
    .goto 467,37.86,60.95,5,0
    .goto 467,36.69,61.87,5,0
    .goto 467,36.34,63.76,5,0
    .goto 467,37.98,66.43,8 >>沿着道路向上走
step
    >>Kill a |cRXP_ENEMY_Tainted Arcane Wraith|r. Loot it for the [|cRXP_LOOT_Tainted Arcane Sliver|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .collect 20483,1,8338,1
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
step
    #label EversongWoodsFelendrenHead
    >>击杀|cRXP_ENEMY_放逐者菲伦德雷|r. 击败他后搜刮其 [|cRXP_LOOT_头颅|r]
    .goto 467,38.92,63.98
    .complete 8335,3 --1/1 Felendren's Head
    .mob Felendren the Banished
step
    >>Kill a |cRXP_ENEMY_Tainted Arcane Wraith|r. Loot it for the [|cRXP_LOOT_Tainted Arcane Sliver|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .collect 20483,1,8338,1
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
step
    .isQuestComplete 8335
    #completewith next
    .goto 467,39.87,59.96
    .deathskip >>跑下去(不要跳)去死
step
    .isQuestComplete 8335
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师赫里恩|r交谈
    .goto 467,58.5,38.8
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r
    .turnin 37439 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .target Arcanist Helion
step
    .isOnQuest 8338
    #sticky
    #label EversongWoodsArcaneWraith
    >>击杀|cRXP_ENEMY_奥术怨灵|r和|cRXP_ENEMY_被污染的奥术怨灵|r
    .goto 467,36.49,62.42,10,0
#loop
	.line 467,35.95,62.37,33.98,60.95,33.30,57.44,35.22,55.35,37.68,57.26,41.53,61.92,42.39,66.27,44.03,69.13,43.00,71.32,41,32,71.70,39.72,74.29,38.05,73.09,37.83,70.00,38.26,66.85
	.goto 467,35.95,62.37,15,0
	.goto 467,33.98,60.95,15,0
	.goto 467,33.30,57.44,15,0
	.goto 467,35.22,55.35,15,0
	.goto 467,37.68,57.26,15,0
	.goto 467,41.53,61.92,15,0
	.goto 467,42.39,66.27,15,0
	.goto 467,44.03,69.13,15,0
	.goto 467,43.00,71.32,15,0
	.goto 467,41.00,32.00,15,0
	.goto 467,71.70,39.72,15,0
	.goto 467,74.29,38.05,15,0
	.goto 467,73.09,37.83,15,0
	.goto 467,70.00,38.26,15,0
    .complete 8335,1 --8/8 Arcane Wraith slain
    .complete 8335,2 --2/2 Tainted Arcane Wraith slain
    .mob Arcane Wraith
    .mob Tainted Arcane Wraith
step
    .isOnQuest 8338
    >>Kill a |cRXP_ENEMY_Tainted Arcane Wraith|r. Loot it for the [|cRXP_LOOT_Tainted Arcane Sliver|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .collect 20483,1,8338,1
    .accept 8338 >>接任务: |cRXP_LOOT_被污染的奥术薄片|r
    .mob Tainted Arcane Wraith
step
    .isOnQuest 8338
    #requires EversongWoodsArcaneWraith
    #completewith next
    .goto 467,41.44,51.44
    .deathskip >>拉怪, 死亡, 去灵魂治疗师处复活
step
    .isOnQuest 8338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师赫里恩|r交谈
    .goto 467,58.5,38.8
    .turnin 8338 >>交任务: |cRXP_FRIENDLY_被污染的奥术薄片|r
    .turnin 37439 >>交任务: |cRXP_FRIENDLY_无尽的渴求|r
    .target Arcanist Helion
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥术师伊塔纳斯|r交谈
    .goto 467,61.8,39.3
    .turnin 37440 >>交任务: |cRXP_FRIENDLY_奥术薄片|r
    .target Arcanist Ithanas
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_|走上坡道|r并和|cRXP_FRIENDLY_|护井者索兰尼亚|r交谈
    .goto 467,62.74,45.12,5,0
    .goto 467,65.29,45.79,10,0
    .goto 467,65.50,42.88,5,0
    .goto 467,63.97,42.83
    .turnin 37442 >>交任务: |cRXP_FRIENDLY_达斯雷玛的神龛|r
    .turnin 37443 >>交任务: |cRXP_FRIENDLY_索兰尼亚的物品|r
    .target Well Watcher Solanian
step
    #completewith next
    .goto 467,63.04,43.06
    .vendor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰萨恩·派雷隆|r交谈
    .goto 467,52.9,49.78
    .turnin 8335 >>交任务: |cRXP_FRIENDLY_放逐者菲伦德雷|r
    .accept 8347 >>接任务: |cRXP_LOOT_帮助信使|r
    .target Lanthan Perilon
]])

--Blood Elf Eversong Woods
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AC) 血精灵 永歌森林
#displayname |cFF00CCFF2|r - 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 
#defaultfor BloodElf !DK

<< Horde

step << Hunter
    #completewith next
    .goto 467,58.74,57.51
    .cast 1515 >>用你的能力 |T132164:0|t[驯服野兽]驯服一只|cRXP_ENEMY_法力浮龙|r
step
    .isOnQuest 8347
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使奥拉莉恩|r 交谈
    .goto 94,40.42,32.21
    .turnin 8347 >>交任务: |cRXP_FRIENDLY_帮助信使|r
    .accept 9704 >>接任务: |cRXP_LOOT_失心者的牺牲品|r
    .target Outrunner Alarion
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上被击杀的Outrunner互动
    .goto 94,42.02,35.65
    .turnin 9704 >>交任务: |cRXP_FRIENDLY_失心者的牺牲品|r
    .accept 9705 >>接任务: |cRXP_LOOT_找回包裹|r
    .target Slain Outrunner
step
    #completewith next
    .goto 94,44.11,38.15,15,0
    .goto 94,45.01,37.49
    .deathskip >>拉一些怪物, 死亡后前往灵魂治疗师处复活
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|cRXP_FRIENDLY_Ranger Jaela|r交谈
    .goto 94,50.33,50.77
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒:死亡跳跃后请重新召唤宠物|r.
step
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .goto 94,50.17,55.05
    .complete 8475,1 --8/8 Plaguebone Pillager slain
    .mob Plaguebone Pillager
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|cRXP_FRIENDLY_Ranger Jaela|r交谈
    .goto 94,50.33,50.77
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员斯凯勒斯|r交谈
    .goto 94,46.53,48.61,20,0
    .goto 94,46.2,46.8
    .fp >>获取银月城废墟的飞行路径
    .target Skymaster Skyles
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师亚隆尼斯|r交谈
    .goto 94,47.25,46.30
    .accept 8472 >>接任务: |cRXP_LOOT_失效的傀儡|r
    .target Magister Jaronis
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与通缉告示板互动
    .goto 94,48.16,46.31
    .accept 8468 >>接任务: |cRXP_WARN_通缉：饥饿者泰里斯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,48.17,46.0
    .accept 8463 >>接任务: |cRXP_LOOT_不稳定的法力水晶|r
    .target Aeldon Sunbrand
step
    #completewith next
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 [|cRXP_LOOT_不稳定的法力水晶箱|r] 以收集它们
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    #completewith next
    >>击杀|r. 从他们身上搜刮 [|cRXP_LOOT_cores|r]
    .goto 94,46.94,44.59,15,0
    .goto 94,47.69,39.02,15,0
    .goto 94,47.11,37.44,15,0
    .goto 94,46.53,35.16,30,0
    .complete 8472,1 --6/6 Arcane Core
    .mob Arcane Patroller
step
    >>击杀|cRXP_ENEMY_Thaelis|r. 击败后搜刮他的 [|cRXP_LOOT_head|r]
    .goto 94,45.36,38.12,5,0
    .goto 94,45.01,37.68
    .complete 8468,1 --1/1 Thaelis' Head
    .mob Thaelis
step
    >>击杀|r. 从他们身上搜刮 [|cRXP_LOOT_cores|r]
    .goto 94,45.39,40.64,20,0
    .goto 94,42.18,40.59
    .complete 8472,1 --6/6 Arcane Cores
    .mob Arcane Patroller
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 [|cRXP_LOOT_不稳定的法力水晶箱|r] 以收集它们
    .goto 94,45.13,40.71,18,0
    .goto 94,46.01,43.29,25,0
    .goto 94,46.92,44.57,10,0
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师亚隆尼斯|r交谈
    .goto 94,47.26,46.30
    .turnin 8472 >>交任务: |cRXP_FRIENDLY_失效的傀儡|r
    .accept 8895 >>接任务: |cRXP_LOOT_送往北部圣殿的信|r
    .target Magister Jaronis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,48.17,46.0
    .turnin 8463 >>交任务: |cRXP_FRIENDLY_不稳定的法力水晶|r
    .accept 9352 >>接任务: |cRXP_LOOT_达纳苏斯的侵扰|r
    .target Aeldon Sunbrand
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坎伦|r交谈
    .goto 94,47.77,46.58
    .turnin 8468 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者泰里斯|r
    .target Sergeant Kan'ren
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯雷因|r交谈
    .goto 94,47.07,47.49
    .vendor
    .target Sleyin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者凯丹尼斯|r交谈
    .goto 94,44.6,53.1
    .turnin 8895 >>交任务: |cRXP_FRIENDLY_送往北部圣殿的信|r
    .accept 9119 >>接任务: |cRXP_LOOT_西部圣殿的麻烦|r
    .target Ley-Keeper Caidanis
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[喷气鞋]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者薇兰妮亚|r交谈
    .goto 94,36.7,57.44
    .turnin 9119 >>交任务: |cRXP_FRIENDLY_西部圣殿的麻烦|r
    .accept 8486 >>接任务: |cRXP_LOOT_不稳定的奥术|r
    .target Ley-Keeper Velania
step
    #completewith next
    >>Kill a |cRXP_ENEMY_Darnassian Scout|r. Loot him for the [|cRXP_LOOT_Incriminating Documents|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>击杀|cRXP_ENEMY_法力漫步者|r和|cRXP_ENEMY_法力怨灵|r
    .goto 94,33.69,61.69,15,0
    .goto 94,34.50,57.84,20,0
    .goto 94,35.66,58.00
    .complete 8486,2 --5/5 Mana Stalker slain
    .complete 8486,1 --5/5 Manawraith slain
    .mob Mana Stalker
    .mob Manawraith
step
    >>Kill a |cRXP_ENEMY_Darnassian Scout|r. Loot him for the [|cRXP_LOOT_Incriminating Documents|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者薇兰妮亚|r交谈
    .goto 94,36.7,57.44
    .turnin 8486 >>交任务: |cRXP_FRIENDLY_不稳定的奥术|r
    .turnin 9352 >>交任务: |cRXP_FRIENDLY_达纳苏斯的侵扰|r
    .target Ley-Keeper Velania
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将宠物设置为“被动”模式|r
step
    #completewith next
    .goto 94,35.46,57.41
    .deathskip >>拉一些怪物, 死后在灵魂治疗师处复活
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .goto 94,44.03,70.76
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .target Magistrix Landra Dawnstrider
step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_提醒:重新召唤你的宠物并设置为“协助”模式|r.
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尼尔·琥珀之光|r 和|cRXP_FRIENDLY_萨希尔|r 交谈
    .accept 9358 >>接任务: |cRXP_LOOT_游侠萨蕾恩|r
    .goto 94,43.67,71.31
    .accept 9130 >>接任务: |cRXP_LOOT_银月城的货物|r
    .goto 94,43.70,71.55
    .target Marniel Amberlight
    .target Sathiel
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r|cNORMAL_交谈
    .goto 94,46.93,71.79
    .turnin 9358 >>交任务: |cRXP_FRIENDLY_游侠萨蕾恩|r
    .accept 9252 >>接任务: |cRXP_LOOT_保卫晴风村|r
    .target Ranger Sareyn
step
    #completewith next
    >>击杀|cRXP_ENEMY_Rotlim Maurauders|r和 |cRXP_ENEMY_黑暗怨灵|r
    .goto 94,50.75,81.06,30,0
    .goto 94,51.00,76.81,30,0
    .goto 94,51.98,72.04,30,0
    .complete 9252,1 --4/4 Rotlimb Marauder slain
    .complete 9252,2 --4/4 Darkwraith slain
    .mob Rotlimb Marauder
    .mob Darkwraith
step
    >>|cRXP_WARN_如果你拉太多|r|cRXP_ENEMY_Rotlimb Maurauders|r|r, 可能会死亡
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 9254 >>交任务: |cRXP_FRIENDLY_外出的学徒|r
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 [|cRXP_LOOT_被污染的土壤样本|r]
    .goto 94,52.34,71.77,20,0
    .goto 94,51.92,68.47,20,0
    .goto 94,52.59,69.60,10,0
    .goto 94,53.75,69.89,10,0
    .goto 94,52.36,69.80
    .complete 8487,1 --8/8 Tainted Soil Sample
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 8487 >>交任务: |cRXP_FRIENDLY_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待约5秒钟后, 再次与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .accept 8488 >>接任务: |cRXP_LOOT_出人意料的结果|r
    .target Apprentice Mirveda
step
    >>击杀|r|cRXP_ENEMY_冷酷的加苏尔|r. 你可以风筝他回到|r|cRXP_FRIENDLY_学徒米尔维达|r
    .goto 94,53.69,69.71,10,0
    .goto 94,54.28,70.98
    .complete 8488,2 --1/1 Gharsul the Remorseless slain
    .mob Gharsul the Remorseless
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 8488 >>交任务: |cRXP_FRIENDLY_出人意料的结果|r
    .accept 9255 >>接任务: |cRXP_LOOT_研究笔记|r
    .target Apprentice Mirveda
step
    >>击杀|cRXP_ENEMY_Rotlim Maurauders|r和 |cRXP_ENEMY_黑暗怨灵|r
    .goto 94,51.98,72.04,30,0
    .goto 94,51.00,76.81
    .complete 9252,1 --4/4 Rotlimb Marauder slain
    .complete 9252,2 --4/4 Darkwraith slain
    .mob Rotlimb Marauder
    .mob Darkwraith
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将宠物设置为“被动”模式|r
step
    #completewith next
    .goto 94,51.47,70.39
    .deathskip >>把一些怪物拉到身边, 然后在路点位置死亡. Rotlimb Marauders(罗特林姆掠夺者)非常擅长击杀你
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠萨蕾恩|r|cNORMAL_交谈
    .goto 94,46.93,71.79
    .turnin 9252 >>交任务: |cRXP_FRIENDLY_保卫晴风村|r
    .target Ranger Sareyn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .goto 94,44.03,70.76
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .target Magistrix Landra Dawnstrider
step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_提醒:重新召唤你的宠物并设置为“协助”模式|r.
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .goto 94,43.94,69.99
    .turnin 9130 >>交任务: |cRXP_FRIENDLY_银月城的货物|r
    .target Skymaster Brightdawn
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .goto 94,43.95,69.98
    .fly Falconwing Square >>飞往鹰翼广场
    .target Skymaster Brightdawn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,47.80,47.65,5,0
    .goto 94,48.16,46.0
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .target Aeldon Sunbrand
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员斯凯勒斯|r交谈
    .goto 94,46.25,46.80
    .fly Silvermoon City >>飞往银月城
    .target Skymaster Skyles
step
    .goto 94,56.39,50.57,15,0
    .goto 110,72.71,59.22,20,0
    .goto 110,76.28,59.20,20,0
    .goto 110,76.06,52.10,20,0
    .goto 110,56.39,23.23,20,0
    .goto 110,58.55,18.65
    .zone 85 >>|cRXP_WARN_Mount up|r 前往: |cRXP_PICK_杜隆塔尔|r.
]])

--Orc Valley of Trials
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ab) 试炼谷1  << !Troll --Orc
#name ab) 试炼谷2  << Troll
#displayname |cFF00CCFF2|r - 试炼谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Troll
#displayname 试炼谷 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !Troll --Orc
#next << !Troll --Orc
#next << Troll
#defaultfor Orc !DK/Troll !DK

<< Horde

step << Orc
    .zoneskip 1727
    #completewith DurotarFirstQuestCheck
    +欢迎来到 |cfff78300兽人起始区域|r. RestedXP 指南
    *Without consumables/heirlooms this route is roughly 5 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
    *With consumables/heirlooms this route is just as fast or up to 15% faster.
step << Orc
    .zoneskip 1727,1
    +你位于流放者之境, 但当前指南适用于兽人起始区域
    +请选择流放者高地向导
step << Troll
	#completewith ValleyofTrialsShortcut
	+走捷径前往试炼谷
step << Troll
	#completewith next
    .goto 1,49.42,70.56,4,0
    .goto 461,68.14,75.44,6 >>到达墙壁时跳跃
step << Troll
	#label ValleyofTrialsShortcut
	#completewith DurotarFirstQuestCheck
    .goto 461,67.83,74.52,6,0
    .goto 461,67.01,74.53,6,0
    .goto 461,64.89,71.70,12 >>紧贴左侧墙壁, 攀登山坡
step << Orc
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label DurotarFirstQuestCheck
    .goto 461,45.20,68.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .accept 25152 >>接任务: |cRXP_LOOT_起点|r
    .target Kaltunk
step
    .goto 461,44.93,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 25152 >>交任务: |cRXP_FRIENDLY_起点|r
    .accept 25126 >>接任务: |cRXP_LOOT_小试身手|r
    .target Gornek
step
    .goto 461,48.08,54.03,40,0
    .goto 461,46.68,52.16
	>>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 25126,1 --6/6 Mottled Boar slain
    .mob Mottles Boar
step
    .goto 461,44.93,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 25126 >>交任务: |cRXP_FRIENDLY_小试身手|r
    .accept 25172 >>接任务: |cRXP_WARN_家园里的入侵者|r
    .target Gornek
step
    #loop
    .goto 461,51.95,75.86,40,0
    .goto 461,46.75,87.23,55,0
    .goto 461,36.46,78.09,45,0
	>>击杀潜行的北卫军斥候
    .complete 25172,1 --7/7 Northwatch Scout slain
    .mob Northwatch Scout
step
    .goto 461,46.95,72.89,40,0
    .goto 461,44.93,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 25172 >>交任务: |cRXP_FRIENDLY_家园里的入侵者|r
    .accept 25127 >>接任务: |cRXP_WARN_家园里的入侵者|r
    .target Gornek
step << Warlock
	#completewith ValleyOfTrialsSarkoth
	.cast 688 >>施放 |T136218:0|r.[召唤小鬼] 来召唤你的恶魔仆从
	.xp <3,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_戈加尔|r 和 |cRXP_FRIENDLY_伐木工萨兹里尔|r 交谈
    .accept 25136 >>接任务: |cRXP_LOOT_戈加尔的清凉果|r
    .goto 461,42.98,62.41
    .accept 37446 >>接任务: |cRXP_LOOT_懒惰的苦工|r
    .goto 461,46.16,63.27
    .target Galgar
    .target Foreman Thazz'ril
step
    #completewith ValleyOfTrialsSarkoth
    >>击杀|r Scorpid Workers|r. 击杀后搜刮出他们的|T132274:0|t[工蝎的尾巴]
    .complete 25127,1 --8/8 Scorpid Worker Tail
    .mob Scorpid Worker
step
    #completewith ValleyOfTrialsBackDen
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击正在睡觉的懒惰的苦工
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    #completewith ValleyTurnins
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_仙人掌果|r
    .complete 25136,1 --6/6 Cactus Apple
step
    #optional
    #completewith next
    #label SarkothRoute
    .goto 461,46.52,58.50,10,0
    .goto 461,34.62,44.23
    >>离开城镇, 向北前进
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 25129 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
    #hidewindow
    #completewith SarkothRoute
    .goto 461,34.62,44.23,15 >>1
step
    #requires SarkothRoute
	#label Sarkoth
    .goto 461,34.62,44.23
    >>离开城镇, 向北前进
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 25129 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
    #label ValleyOfTrialsSarkoth
    .goto 461,32.7,61.9
	>>击杀|cRXP_ENEMY_萨科斯|r. 击败他后拾取战利品:|T134294:0|t[|cRXP_LOOT_萨科斯的残破利爪|r]
    .complete 25129,1 --1/1 Sarkoth's Mangled Claw
    .mob Sarkoth
step
    #title Finish |T132274:0|t[Scorpid Worker Tails]
    >>击杀|r Scorpid Workers|r. 击杀后搜刮出他们的|T132274:0|t[工蝎的尾巴]
    #loop
	.goto 461,37.38,65.09,40,0
	.goto 461,34.90,67.58,40,0
	.goto 461,32.93,66.72,40,0
	.goto 461,32.45,61.81,40,0
	.goto 461,32.11,57.46,40,0
	.goto 461,34.97,57.14,40,0
	.goto 461,39.82,56.48,40,0
	.goto 461,37.38,65.09,40,0
    .complete 25127,1 --8/8 Scorpid Worker Tail
    .mob Scorpid Worker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_跳回城镇|r. 与|cRXP_FRIENDLY_戈加尔|r和|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_祖瑞莎|r和|cRXP_FRIENDLY_工头萨兹里尔|r交谈
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .goto 461,46.15,63.28
	.isQuestComplete 25136
	.isQuestComplete 37446
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳回城镇, 然后与|cRXP_FRIENDLY_戈加尔|r和|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
	.isQuestComplete 25136
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_祖雷萨|r和|cRXP_FRIENDLY_工头塔兹里尔|r交谈
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.93,66.42
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .goto 461,46.15,63.28
	.isQuestComplete 37446
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 25127 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .goto 461,44.91,66.41
    .accept 25131 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .goto 461,45.81,63.42
    .target Gornek
    .target Zureetha Fargaze
step
    #completewith next
    #label ValleyOfTrialsBackDenRoute
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h|cRXP_FRIENDLY_哈纳祖|r交谈
    .goto 461,46.45,57.83,15,0
    .goto 461,34.62,44.23
    .turnin 25129 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .accept 25130 >>接任务: |cRXP_WARN_返回大兽穴|r
    .target Hana'zua
step
    #hidewindow
    #completewith ValleyOfTrialsBackDenRoute
    .goto 461,34.62,44.23,20 >>1
step
    #requires ValleyOfTrialsBackDenRoute
    #label ValleyOfTrialsBackDen
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|h|cRXP_FRIENDLY_哈纳祖|r交谈
    .goto 461,34.62,44.23
    .turnin 25129 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .accept 25130 >>接任务: |cRXP_WARN_返回大兽穴|r
    .target Hana'zua
step
    #completewith next
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击正在睡觉的懒惰的苦工
    .goto 461,36.22,35.30,20,0
    .goto 461,37.20,29.67,20,0
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    #loop
    .goto 461,49.86,25.11,50,0
    .goto 461,56.34,31.92,50,0
    .goto 461,48.90,37.40,50,0
	>>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 25131,1 --8/8 Vile Familiar slain
    .mob Vile Familiar
step
    #loop
    .goto 461,58.79,36.66,25,0
    .goto 461,61.15,56.34,30,0
    .goto 461,54.42,57.33,20,0
    .goto 461,52.01,69.59,20,0
    .goto 461,48.28,71.90,20,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击正在睡觉的懒惰的苦工
    .complete 37446,1 --4/4 Sleeping Lazy Peons awakened
    .use 16114
    .target Lazy Peon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r和|cRXP_FRIENDLY_铁匠塔扎里尔|r交谈
    .turnin 25131 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .goto 461,45.81,63.42
    .turnin 37446 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .accept 25135 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .goto 461,46.15,63.28
    .accept 25132 >>接任务: |cRXP_LOOT_火刃奖章|r
    .goto 461,45.81,63.42
	.isOnQuest 37446
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
	#label ValleyTurnins
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r和|cRXP_FRIENDLY_铁匠塔扎里尔|r交谈
    .turnin 25131 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 25132 >>接任务: |cRXP_LOOT_火刃奖章|r
    .goto 461,45.81,63.42
    .accept 25135 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .goto 461,46.15,63.28
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step << Hunter
    #completewith next
    .goto 461,52.42,52.84,20,0
    .goto 461,50.50,53.00,20,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_仙人掌果|r
    .complete 25136,1 --6/6 Cactus Apple
step << Hunter Orc
    .goto 461,47.61,47.66
    .cast 1515 >>瞄准|cRXP_ENEMY_杂斑野猪|r, 施放后持续施法 |T132164:0|t[驯服野兽]以驯服它
    .isOnQuest 25135
    .mob Mottled Boar
step
    #loop
    .goto 461,50.50,53.00,18,0 << !Hunter
    .goto 461,51.34,32.89,18,0
    .goto 461,50.28,27.29,18,0
    .goto 461,53.63,28.29,18,0
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_仙人掌果|r
    .complete 25136,1 --6/6 Cactus Apple
step
    #completewith Yarrog
	>>在洞穴内击杀|cRXP_ENEMY_地狱捕猎者|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    #label ThazzrilsPickA
    #completewith next
    >>在地面上掉落 [|cRXP_LOOT_塔兹利尔的镐|r]
    .complete 25135,1 --1/1 Thazz'ril's Pick
step
    #title 进入洞窟
    #completewith ThazzrilsPickA
    .goto 1,45.37,56.22,15 >>进入洞窟
step
    #requires ThazzrilsPickA
    .goto 2,75.04,80.08,15,0
    .goto 2,40.75,52.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_LOOT_塔兹利尔的镐|r
    .complete 25135,1 --1/1 Thazz'ril's Pick
step
	#label Yarrog
    >>击杀|cRXP_ENEMY_亚罗格·刺影|r. 从他身上搜刮出 |T133434:0|t[|cRXP_LOOT_火刃奖章|r]
    .goto 2,39.21,88.42,15,0
    .goto 2,26.73,83.52,15,0
    .goto 2,14.96,46.80
    .complete 25132,2 --1/1 Burning Blade Medallion
    .mob Yarrog Baneshadow
step
    .goto 2,39.21,88.42,15,0
    .goto 2,75.04,80.08,15,0
    .goto 1,45.37,56.22
	>>在洞穴内击杀|cRXP_ENEMY_地狱捕猎者|r
    .complete 25132,1 --5/5 Felstalker slain
    .mob Felstalker
step
    #completewith next
    .goto 2,14.96,46.80,-1
    .goto 461,48.47,70.89,-1
    .deathskip >>尽可能多地拉怪, 然后死亡并在灵魂治疗师处复活. 请在路标附近或洞穴入口附近死亡 << !Hunter !Warlock
    .deathskip >>|cfff78300将你的宠物设置为被动|r. 尽可能多地拉怪, 然后死亡并前往灵魂治疗师处重生. 死亡位置尽量靠近路标或洞穴入口附近 << Hunter/Warlock
step
    #hidewindow
    #completewith next
    .goto 461,48.45,70.92,20 >>1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_戈加尔|r和|cRXP_FRIENDLY_祖雷萨|r以及|cRXP_FRIENDLY_福尔曼·扎兹里尔|r交谈
    .turnin 25130 >>交任务: |cRXP_FRIENDLY_返回大兽穴|r
    .goto 461,44.93,66.42
    .turnin 25136 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .goto 461,42.95,62.42
    .turnin 25132 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 25133 >>接任务: |cRXP_LOOT_去森金村报到|r << Orc
    .goto 461,45.82,63.42
    .turnin 25135 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .goto 461,46.19,63.29
	.isOnQuest 25136
    .target Galgar
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r和|cRXP_FRIENDLY_祖雷萨|r以及|cRXP_FRIENDLY_法尔曼·萨兹里尔|r交谈
    .turnin 25130 >>交任务: |cRXP_FRIENDLY_返回大兽穴|r
    .goto 461,44.93,66.42
    .turnin 25132 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 25133 >>接任务: |cRXP_LOOT_去森金村报到|r << Orc
    .goto 461,45.82,63.42
    .turnin 25135 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .goto 461,46.19,63.29
    .target Gornek
    .target Zureetha Fargaze
    .target Foreman Thazz'ril
step << Troll
    .goto 461,46.68,52.16
    .xp 10
step << Troll
    #completewith next
    .goto 1,45.34,56.40,10,0
    .goto 2,57.97,30.96
    .deathskip >>回到洞穴内, 尽可能多地拉怪, 然后死亡并在灵魂治疗师处复活, 最后在路点附近死亡 << !Hunter !Warlock
    .deathskip >>回到洞穴内. |cfff78300将你的宠物设置为被动|r. 尽可能多地拉怪, 然后死亡并在灵魂治疗师处重生. 死在路标附近 << Hunter/Warlock
step << Troll
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波洛克|r交谈
    .goto 1,53.10,43.58
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Burok
]])

--Orc Echo Isles
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AC) 回声群岛1 << Troll
#name AC) 回声群岛2 << !Troll --Orc
#displayname 回音群岛 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Troll
#displayname |cFF00CCFF2|r - 回音群岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !Troll 
#next << Troll
#next << !Troll 
#defaultfor Orc !DK/Troll !DK

<< Horde

step << Orc
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step << Troll
    .zoneskip 1727
    #completewith EchoIslesFirstQuestCheck
    +欢迎来到 |cfff78300巨魔起始区域|r. RestedXP 指南
    *Without consumables/heirlooms this route is roughly 5 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
    *With consumbales/heirlooms this route is just as fast or up to 15% faster.
step << Troll
    .zoneskip 1727,1
    +你位于流放者之境, 但当前指南适用于巨魔起始区域
    +请选择流放者高地向导
step << Troll
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step << Orc
    #completewith next
    #label ReportToSenjinVillage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 25133 >>交任务: |cRXP_FRIENDLY_去森金村报到|r
    .target Master Gadrin
step << Orc
    #completwith ReportToSenjinVillage
    .goto 461,68.14,69.72,20,0
    .goto 461,71.74,67.17,20 >>离开试炼谷
step << Orc
    #requires ReportToSenjinVillage
    .goto 1,55.95,74.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 25133 >>交任务: |cRXP_FRIENDLY_去森金村报到|r
    .target Master Gadrin
step
    #requires EchoIslesFirstQuestCheckA
    #label EchoIslesFirstQuestCheckB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jin'thala|r交谈
    .goto 463,42.82,53.43
    .accept 24607 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warrior
    .accept 24750 >>接任务: |cRXP_WARN_暗矛的崛起|r << Mage
    .accept 24758 >>接任务: |cRXP_WARN_暗矛的崛起|r << Shaman
    .accept 24764 >>接任务: |cRXP_WARN_暗矛的崛起|r << Druid
    .accept 24770 >>接任务: |cRXP_WARN_暗矛的崛起|r << Rogue
    .accept 24776 >>接任务: |cRXP_WARN_暗矛的崛起|r << Hunter
    .accept 24782 >>接任务: |cRXP_WARN_暗矛的崛起|r << Priest
    .accept 26272 >>接任务: |cRXP_WARN_暗矛的崛起|r << Warlock
    .accept 31159 >>接任务: |cRXP_WARN_暗矛的崛起|r << Monk
    .target Jin'thala
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺泰特|r交谈
    .turnin 24607 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24639 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索拉萨|r交谈
    .turnin 24750 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24751 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Soratha
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈卡利|r交谈
    .goto 463,50.06,52.75
    .turnin 24758 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24759 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Nekali
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zen'tabra|r交谈
    .turnin 24764 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24765 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加提|r交谈
    .turnin 24770 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24771 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧塔扎|r交谈
    .turnin 24776 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24777 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图娜尼|r交谈
    .turnin 24782 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 24783 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Tunari
step << Warlock
    .goto 463,50.04,49.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德雷卡|r交谈
    .turnin 26272 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 26273 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Voldreka
--X Currently has phasing issues, need to relog to make him show
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎布拉克斯|r交谈
    .turnin 31159 >>交任务: |cRXP_FRIENDLY_暗矛的崛起|r
    .accept 31158 >>接任务: |cRXP_WARN_基础教程：攻击目标|r
    .target Zabrax
step
    #loop
    .goto 463,52.20,54.49,15,0 << Warrior
    .goto 463,51.67,53.56,15,0 << Warrior
    .goto 463,60.90,52.87,20,0 << Mage
    .goto 463,58.92,53.59,15,0 << Mage
    .goto 463,49.82,54.17,20,0 << Shaman
    .goto 463,50.35,48.82,20,0 << Warlock
    .goto 463,58.83,53.72,20,0 << Druid
    .goto 463,57.35,55.29,20,0 << Druid
    .goto 463,52.97,49.26,15,0 << Rogue
    .goto 463,52.89,50.69,15,0 << Rogue
    .goto 463,56.65,49.54,15,0 << Hunter
    .goto 463,55.92,50.76,15,0 << Hunter
    .goto 463,58.78,47.98 << Priest
    .goto 463,49.44,52.23 << Warlock/Shaman
    .goto 463,52.89,50.69,15,0 << Monk
    .goto 463,52.96,53.08,15,0 << Monk
    >>击杀蒂基面具假人目标
    .complete 24639,1 << Warrior --6/6 Tiki Target slain
    .complete 24751,1 << Mage --6/6 Tiki Target slain
    .complete 24759,1 << Shaman --6/6 Tiki Target slain
    .complete 24765,1 << Druid --6/6 Tiki Target slain
    .complete 24771,1 << Rogue --6/6 Tiki Target slain
    .complete 24777,1 << Hunter --6/6 Tiki Target slain
    .complete 24783,1 << Priest --6/6 Tiki Target slain
    .complete 26273,1 << Warlock --6/6 Tiki Target slain
    .complete 31158,1 << Monk --6/6 Tiki Target slain
    .mob Tiki Target
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺泰特|r交谈
    .turnin 24639 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24641 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索拉萨|r交谈
    .turnin 24751 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24753 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Soratha
step << Shaman
    .goto 463,50.06,52.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈卡利|r交谈
    .turnin 24759 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24761 >>接任务: |cRXP_WARN_粗暴的开始|r
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zen'tabra|r交谈
    .turnin 24765 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24767 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加提|r交谈
    .turnin 24771 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24773 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧塔扎|r交谈
    .turnin 24777 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24779 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图娜尼|r交谈
    .turnin 24783 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 24785 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Tunari
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德雷卡|r交谈
    .goto 463,50.04,49.93
    .turnin 26273 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 26275 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎布拉克斯|r交谈
    .turnin 31158 >>交任务: |cRXP_FRIENDLY_基础教程：攻击目标|r
    .accept 31160 >>接任务: |cRXP_WARN_粗暴的开始|r
    .target Zabrax
step << Warrior
    .goto 463,49.55,59.41,20,0
    .goto 463,52.07,61.40,20,0
    .goto 463,55.33,59.93
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24641,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Mage
    .goto 463,62.91,48.23,10,0
    .goto 463,62.71,56.70
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24753,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Shaman
    .goto 463,47.46,51.74,10,0
    .goto 463,48.06,46.84,10,0
    .goto 463,49.87,41.43,10,0
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24761,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Druid
    .goto 463,63.12,57.25,10,0
    .goto 463,62.68,50.67,10,0
    .goto 463,62.87,47.90
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24767,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Rogue
    .goto 463,48.82,43.95,10,0
    .goto 463,50.89,40.74
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24773,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Hunter
    .goto 463,55.41,41.56
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24779,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Priest
    .goto 463,55.42,41.49
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 24785,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Warlock
    .goto 463,49.05,44.40,10,0
    .goto 463,50.84,41.86
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 26275,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Monk
    .goto 463,48.82,43.95,10,0
    .goto 463,50.89,40.74
    >>击杀|r|cRXP_ENEMY_蛮鬃野豹|r. 从它们身上搜刮 [|cRXP_LOOT_兽皮|r]
    .complete 31160,1 --6/6 Wildmane Cat Pelt
    .mob Wildmane Cat
step << Warrior
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺泰特|r交谈
    .turnin 24641 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24642 >>接任务: |cRXP_WARN_试炼场|r
    .target Nortet
step << Mage
    .goto 463,59.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索拉萨|r交谈
    .turnin 24753 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24754 >>接任务: |cRXP_WARN_试炼场|r
    .target Soratha
step << Shaman
    .goto 463,50.06,52.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈卡利|r交谈
    .turnin 24761 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24762 >>接任务: |cRXP_WARN_试炼场|r
    .target Nekali
step << Druid
    .goto 463,58.06,54.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zen'tabra|r交谈
    .turnin 24767 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24768 >>接任务: |cRXP_WARN_试炼场|r
    .target Zen'tabra
step << Rogue
    .goto 463,52.90,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加提|r交谈
    .turnin 24773 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24774 >>接任务: |cRXP_WARN_试炼场|r
    .target Legati
step << Hunter
    .goto 463,56.4,50.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧塔扎|r交谈
    .turnin 24779 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24780 >>接任务: |cRXP_WARN_试炼场|r
    .target Ortezza
step << Priest
    .goto 463,58.04,49.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图娜尼|r交谈
    .turnin 24785 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 24786 >>接任务: |cRXP_WARN_试炼场|r
    .target Tunari
step << Warlock
    .goto 463,50.04,49.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德雷卡|r交谈
    .turnin 26275 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 26276 >>接任务: |cRXP_WARN_试炼场|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎布拉克斯|r交谈
    .turnin 31160 >>交任务: |cRXP_FRIENDLY_粗暴的开始|r
    .accept 31161 >>接任务: |cRXP_WARN_试炼场|r
    .target Zabrax
step << Warrior
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24642,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Mage
    .goto 463,57.50,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24754,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Shaman
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24762,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Druid
    .goto 463,57.49,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24768,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Rogue
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24774,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Hunter
    .goto 463,57.49,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24780,1 --1/1 Speak to a Darkspear Jailor
    .target Darkspear Jailor
    .skipgossip
step << Priest
    .goto 463,57.47,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 24786,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Troll Warlock
    #completewith next
    .cast 688 >>使用“召唤小鬼”法术来召唤你的小鬼
step << Warlock
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 26276,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Monk
    .goto 463,51.94,51.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗矛狱卒(|cRXP_FRIENDLY_Darkspear Jailor|r)交谈
    .complete 31161,1 --1/1 Speak to a Darkspear Jailor
    .skipgossip
    .target Darkspear Jailor
step << Warrior
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,51.15,51.29
    .complete 24642,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Mage
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,57.28,51.84,10,0
    .goto 463,58.06,51.54
    .complete 24754,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Shaman
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,50.68,51.91
    .complete 24762,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Druid
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,57,28,51.82
    .complete 24768,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Rogue
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,51.15,51.28
    .complete 24774,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Hunter
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,57.29,51.80
    .complete 24780,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Priest
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,57.29,51.82
    .complete 24786,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warlock
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,50.69,51.88
    .complete 26276,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Monk
    >>击杀|cRXP_ENEMY_恶鳞斥候俘虏|r
    .goto 463,50.69,51.88
    .complete 26276,2 --1/1 Captive Spitescale Scout slain
    .mob Captive Spitescale Scout
step << Warrior
    .goto 463,51.45,52.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺泰特|r交谈
    .turnin 24642 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24643 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nortet
step << Mage
    .goto 463,58.20,51.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索拉萨|r交谈
    .turnin 24754 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24755 >>接任务: |cRXP_WARN_喜出望外|r
    .target Soratha
step << Shaman
    .goto 463,50.71,52.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈卡利|r交谈
    .turnin 24762 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24763 >>接任务: |cRXP_WARN_喜出望外|r
    .target Nekali
step << Druid
    .goto 463,57.66,52.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zen'tabra|r交谈
    .turnin 24768 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24769 >>接任务: |cRXP_WARN_喜出望外|r
    .target Zen'tabra
step << Rogue
    .goto 463,51.95,51.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加提|r交谈
    .turnin 24774 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24775 >>接任务: |cRXP_WARN_喜出望外|r
    .target Legati
step << Hunter
    .goto 463,57.22,50.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧塔扎|r交谈
    .turnin 24780 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24781 >>接任务: |cRXP_WARN_喜出望外|r
    .target Ortezza
step << Priest
    .goto 463,57.38,50.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图娜尼|r交谈
    .turnin 24786 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 24787 >>接任务: |cRXP_WARN_喜出望外|r
    .target Tunari
step << Warlock
    .goto 463,50.69,51.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德雷卡|r交谈
    .turnin 26276 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 26277 >>接任务: |cRXP_WARN_喜出望外|r
    .target Voldreka
step << Monk
    .goto 463,52.55,53.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎布拉克斯|r交谈
    .turnin 31161 >>交任务: |cRXP_FRIENDLY_试炼场|r
    .accept 31163 >>接任务: |cRXP_WARN_喜出望外|r
    .target Zabrax
step
    .goto 463,61.57,65.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vol'jin|r交谈
    .turnin 24643 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warrior
    .turnin 24755 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Mage
    .turnin 24763 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Shaman
    .turnin 24769 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Druid
    .turnin 24775 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Rogue
    .turnin 24781 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Hunter
    .turnin 24787 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Priest
    .turnin 26277 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Warlock
    .turnin 31163 >>交任务: |cRXP_FRIENDLY_恶性竞争|r << Monk
    .accept 25064 >>接任务: |cRXP_WARN_莫拉亚|r
    .target Vol'jin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tora'jin|r和|cRXP_FRIENDLY_莫拉亚|r交谈
    .accept 25037 >>接任务: |cRXP_WARN_捉螃蟹|r
    .goto 463,60.52,62.87
    .turnin 25064 >>交任务: |cRXP_FRIENDLY_莫拉亚|r
    .accept 24622 >>接任务: |cRXP_WARN_巨魔的铁杆伙伴|r
    .goto 463,56.82,63.69
    .target Tora'jin
    .target Moraya
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[喷气鞋]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基加拉|r交谈(她会在附近巡逻), 然后与|cRXP_FRIENDLY_缇卡什|r交谈
    .turnin 24622 >>交任务: |cRXP_FRIENDLY_巨魔的铁杆伙伴|r
    .accept 24623 >>接任务: |cRXP_WARN_拯救幼崽|r
    .goto 463,50.42,66.82,30,0
    .goto 463,45.27,85.38
    .accept 24624 >>接任务: |cRXP_WARN_给迷失者的怜悯|r
    .accept 24625 >>接任务: |cRXP_WARN_海巫的配偶|r
    .goto 463,45.73,85.00
    .target Kijara
    .target Tegashi
step
    #completewith Bloodtalons
    #label EchoIslesBloodtalonsRescued
    .goto 463,38.01,67.58,25,0
    >>使用 |T132161:0|t[血爪之哨] 在血爪幼龙附近召唤它们以解救它们
    .complete 24623,1 --12/12 Bloodtalon Hatchlings rescued
    .use 52283
step
	#completewith next
    .goto 463,38.82,72.57,0
    >>杀死|cRXP_ENEMY_被腐蚀的血爪迅猛龙|r
    .complete 24624,1 --8/8 Corrupted Bloodtalon slain
    .mob Corrupted Bloodtalon
step
    .goto 463,36.72,69.04
    >>击杀|cRXP_ENEMY_Naj'tess|r. 击败他后拾取 |T332402:0|t[|cRXP_LOOT_Naj'tess'腐败之球|r]
    .complete 24625,1 --1/1 Naj'tess' Orb of Corruption
    .mob Naj'tess
step
	#label Bloodtalons
    #loop
	.line 463,34.04,70.60,36.60,69.56,38.51,66.20,40.18,69.15,40.05,71.23,39.37,74.83,38.41,73.07,36.67,73.48,35.14,73.49,36.60,69.56
	.goto 463,34.04,70.60,30,0
	.goto 463,36.60,69.56,30,0
	.goto 463,38.51,66.20,30,0
	.goto 463,40.18,69.15,30,0
	.goto 463,40.05,71.23,30,0
	.goto 463,39.37,74.83,30,0
	.goto 463,38.41,73.07,30,0
	.goto 463,36.67,73.48,30,0
	.goto 463,35.14,73.49,30,0
	.goto 463,36.60,69.56,30,0
    >>杀死|cRXP_ENEMY_被腐蚀的血爪迅猛龙|r
    .complete 24624,1 --8/8 Corrupted Bloodtalon slain
    .mob Corrupted Bloodtalon
step
#loop
	.line 463,36.60,69.56,38.51,66.20,40.18,69.15,40.05,71.23,39.37,74.83,38.41,73.07,36.67,73.48,35.14,73.49,36.60,69.56
	.goto 463,36.60,69.56,30,0
	.goto 463,38.51,66.20,30,0
	.goto 463,40.18,69.15,30,0
	.goto 463,40.05,71.23,30,0
	.goto 463,39.37,74.83,30,0
	.goto 463,38.41,73.07,30,0
	.goto 463,36.67,73.48,30,0
	.goto 463,35.14,73.49,30,0
	.goto 463,36.60,69.56,30,0
    >>使用 |T132161:0|t[血爪之哨] 在血爪幼龙附近召唤它们以解救它们
    .complete 24623,1 --12/12 Bloodtalon Hatchlings rescued
    .use 52283
step
	#completewith next
    >>在返回途中击杀|r小海浪蟹|r. 击败它们后, 可获得|r新鲜的蟹肉|r|T134007:0|t[|cRXP_LOOT_Fresh Crawler Meat|r]
    .complete 25037,1 --5/5 Fresh Crawler Meat
    .mob Pygmy Surf Crawler
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_缇卡什|r和|cRXP_FRIENDLY_基加拉|r交谈
    .turnin 24625 >>交任务: |cRXP_FRIENDLY_海巫的配偶|r
    .turnin 24624 >>交任务: |cRXP_FRIENDLY_给迷失者的怜悯|r
    .goto 463,45.73,85.00
    .turnin 24623 >>交任务: |cRXP_FRIENDLY_拯救幼崽|r
    .accept 24626 >>接任务: |cRXP_WARN_年轻气盛|r
    .goto 463,45.27,85.38
    .target Tegashi
    .target Kijara
step
    #loop
	.line 463,45.93,86.53,46.15,88.00,43.81,88.49,43.46,91.82,44.25,91.93,45.27,89.85,45.95,89.71,46.91,93.18,47.68,92.85,47.84,88.58,48.45,90.12,47.51,88.96,47.42,86.91,46.21,85.10,46.03,83.83,44.17,82.86,42.43,83.12,41.15,85.98,40.87,88.56,42.30,88.10,43.60,85.27,44.56,85.10,45.93,86.53
    .goto 463,45.93,86.53,30,0
    .goto 463,44.56,85.10,30,0
    .goto 463,43.60,85.27,30,0
    .goto 463,42.30,88.10,30,0
    .goto 463,40.87,88.56,30,0
    .goto 463,41.15,85.98,30,0
    .goto 463,42.43,83.12,30,0
    .goto 463,44.17,82.86,30,0
    .goto 463,46.03,83.83,30,0
    .goto 463,46.21,85.10,30,0
    .goto 463,47.42,86.91,30,0
    .goto 463,47.51,88.96,30,0
    .goto 463,48.45,90.12,30,0
    .goto 463,47.84,88.58,30,0
    .goto 463,47.68,92.85,30,0
    .goto 463,46.91,93.18,30,0
    .goto 463,45.95,89.71,30,0
    .goto 463,45.27,89.85,30,0
    .goto 463,44.25,91.93,30,0
    .goto 463,43.46,91.82,30,0
    .goto 463,43.81,88.49,30,0
    .goto 463,46.15,88.00,30,0
    >>使用|T134326:0|t[血爪套索]对|cRXP_FRIENDLY_迅爪|r. 他会出现在你身边, 然后沿着岛屿逆时针方向奔跑
    .complete 24626,1 --1/1 Capture Swiftclaw
	.unitscan Swiftclaw
    .use 50053
step
    .goto 463,50.42,66.82,40,0
    .goto 463,53.21,65.40
    >>骑乘 |cRXP_FRIENDLY_迅爪|r 返回 |cRXP_PICK_迅猛龙围栏|r
    .complete 24626,2 --1/1 Return Swiftclaw to the Raptor Pens
step << Hunter Troll
    #completewith TrollBreakingtheLine
    .goto 463,53.03,65.42
    .cast 1515 >>|cRXP_WARN_Tame a|cRXP_ENEMY_血爪迅猛龙|rwith your |T132164:0|t[驯服野兽]能力|r
    .mob Bloodtalon Raptor
step
    #loop
    .goto 463,52.87,71.28,40,0
    .goto 463,58.36,70.75,30,0
    >>击杀|cRXP_ENEMY_小海浪蟹|r. 击败它们后搜刮 [|cRXP_LOOT_肉|r]
    .complete 25037,1 --5/5 Fresh Crawler Meat
    .mob Pygmy Surf Crawler
step << Troll
    #label TrollBreakingtheLine
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉亚|r和|cRXP_FRIENDLY_托尔图盖|r和|cRXP_FRIENDLY_托拉吉恩|r交谈
    .turnin 24626 >>交任务: |cRXP_FRIENDLY_年轻气盛|r
    .goto 463,56.82,63.69
    .accept 25035 >>接任务: |cRXP_WARN_突破防线|r
    .goto 463,58.97,66.85
    .turnin 25037 >>交任务: |cRXP_FRIENDLY_捉螃蟹|r
    .goto 463,60.52,62.87
    .xp >10-1400,1
    .target Moraya
    .target Tortunga
    .target Tora'jin
--XX was 1600
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉亚|r和|cRXP_FRIENDLY_托尔图盖|r和|cRXP_FRIENDLY_托拉吉恩|r交谈 << Orc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉亚|r和|cRXP_FRIENDLY_Tora'jin|r交谈 << Troll
    .turnin 24626 >>交任务: |cRXP_FRIENDLY_年轻气盛|r
    .goto 463,56.82,63.69
    .accept 25035 >>接任务: |cRXP_WARN_突破防线|r << Orc
    .goto 463,58.97,66.85 << Orc
    .turnin 25037 >>交任务: |cRXP_FRIENDLY_捉螃蟹|r
    .goto 463,60.52,62.87
    .target Moraya
    .target Tora'jin
step
    .goto 463,58.90,23.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉基|r交谈
    .turnin 25035 >>交任务: |cRXP_FRIENDLY_突破防线|r
    .accept 24812 >>接任务: |cRXP_WARN_不再怜悯|r
    .accept 24813 >>接任务: |cRXP_WARN_领土神像|r
	.isOnQuest 25035
    .xp 10,1
    .target Morakki
step
    .goto 463,58.90,23.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉基|r交谈
    .accept 24812 >>接任务: |cRXP_WARN_不再怜悯|r
    .accept 24813 >>接任务: |cRXP_WARN_领土神像|r
	.isQuestTurnedIn 25035
    .target Morakki
step
    #sticky
    #label EchoingIslesSpitescaleNagas
    >>击杀|cRXP_ENEMY_Spitescale Nagas|r的同时, 放置 [|cRXP_LOOT_Territorial Fetishes|r]
    .goto 464,58.0,46.3,0,0
    .complete 24812,1 --12/12 Spitescale Naga
	.isQuestTurnedIn 25035
step
    >>使用位于|r 旁边的 |T132482:0|t[领土神像]. 这些领土神像一段时间后会消失, 你可以再次放置它们
    .goto 464,61.97,71.50,10,0
    .goto 464,66.21,58.45,10,0
    .goto 464,68.96,40.94,10,0
    .goto 464,61.30,39.97,10,0
    .goto 464,56.63,44.08,10,0
    .goto 464,61.97,71.50,10,0
    .goto 464,62.32,28.54,10,0
    .goto 464,70.05,27.89,10,0
    .goto 464,77.46,16.94,10,0
    .goto 464,72.44,43.92,10,0
    .goto 464,77.81,47.26,10,0
    .goto 464,73.25,55.40,10,0
    .goto 464,76.82,63.45,10,0
    .goto 464,67.34,78.51,10,0
    .goto 464,52.47,61.80,10,0
    .goto 464,71.26,73.84,15,0
    .goto 464,69.36,30.91,15,0
    .use 52065
    .complete 24813,1 --8/8 Territorial Fetish placed
	.isQuestTurnedIn 25035
step
    #requires EchoingIslesSpitescaleNagas
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫拉基|r交谈
    .goto 463,58.90,23.08
    .turnin 24812 >>交任务: |cRXP_FRIENDLY_不再怜悯|r
    .turnin 24813 >>交任务: |cRXP_FRIENDLY_领土神像|r
	.isQuestTurnedIn 25035
    .target Morakki
step << Orc
    .nodmf
    #completewith next
    .hs >>传送至试炼谷
step << Orc
    .nodmf
    #completewith next
    .goto 1,45.37,56.22,20,0
    .goto 2,61.50,65.13,20,0
    .goto 2,57.97,30.96,-1
    .goto 1,53.50,44.43,-1
    >>跑到洞穴尽头
    .deathskip >>尽可能多地拉怪, 然后死亡并在灵魂医者处复活 << !Hunter !Warlock
    .deathskip >>|cRXP_WARN_将你的宠物设置为被动|r. 尽可能多地拉怪, 然后自杀并前往灵魂医者处复活 << Hunter/Warlock
step << Orc
    #completewith next
    .goto 1,53.10,43.58,-1
    .goto 1,55.38,63.34,-1
    .fly Orgrimmar >>飞往奥格瑞玛
]])

--Tauren Camp Narache
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AB) 纳拉其营地
#displayname 纳拉其营地 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ac) 莫高雷牛头人营地
#defaultfor Tauren !DK

<< Horde

step << Tauren
    .zoneskip 1727
    #completewith MulgoreFirstQuestCheck
    +欢迎来到 |cfff78300牛头人起始区域|r. RestedXP 指南
    *This route is roughly 10-20 minutes slower than |cfff78300Exiles Reach|r. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
step << Tauren
    .zoneskip 1727,1
    +您当前位于流放者之角, 但当前指南针对的是亡灵起始区域
    +请选择 |cfff78300流放者之境指南|r
step
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label MulgoreFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .goto 462,27.7,28.2
    .accept 14449 >>接任务: |cRXP_WARN_第一步|r
    .target Chief Hawkwind
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔·鹰风|r交谈
    .goto 462,39.45,37.25
    .turnin 14449 >>交任务: |cRXP_FRIENDLY_第一步|r
    .accept 14452 >>接任务: |cRXP_LOOT_力量仪祭|r
    .target Grull Hawkwind
step
    #loop
    .goto 462,40.93,35.68,15,0
    .goto 462,42.01,32.95,15,0
    .goto 462,44.65,34.68,15,0
    .goto 462,44.40,37.15,15,0
    .goto 462,40.81,38.19,15,0
    >>击杀|cRXP_ENEMY_刺背野猪人|r
    .complete 14452,1 --6/6 Bristleback Invaders slain
    .mob Bristleback Invader
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔·鹰风|r交谈
    .goto 462,39.45,37.25
    .turnin 14452 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
    .accept 24852 >>接任务: |cRXP_WARN_被囚禁的部族|r
    .target Grull Hawkwind
step
    #title Brave Freed (1/4)
    .goto 462,49.39,35.39
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_兽人笼|r
    .complete 24852,1,1 --4/4 Braves Freed
step
    #title Brave Freed (2/4)
    .goto 462,49.07,36.97
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_兽人笼|r
    .complete 24852,1,2 --4/4 Braves Freed
step
    #title Brave Freed (3/4)
    .goto 462,49.32,42.12
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_兽人笼|r
    .complete 24852,1,3 --4/4 Braves Freed
step
    #title Brave Freed (4/4)
    .goto 462,49.07,43.80
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_兽人笼|r
    .complete 24852,1 --4/4 Braves Freed
step
    .goto 462,39.45,37.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔·鹰风|r交谈
    .turnin 24852 >>交任务: |cRXP_FRIENDLY_被囚禁的部族|r
    .accept 14458 >>接任务: |cRXP_WARN_去找阿达娜|r
    .target Grull Hawkwind
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达娜·雷角|r交谈
    .goto 462,30.9,50.6
    .turnin 14458 >>交任务: |cRXP_FRIENDLY_去找阿达娜|r
    .accept 14456 >>接任务: |cRXP_WARN_勇气仪祭|r
    .accept 14455 >>接任务: |cRXP_WARN_阻止号角手|r
    .target Adana Thunderhorn
step
    #completewith StolenRifles
    #hidewindow
    #loop
    .goto 462,32.82,63.39,15,0
    .goto 462,31.86,68.99,15,0
    .goto 462,34.93,70.00,15,0
    .goto 462,36.56,67.73,15,0
    +1
step
    #completewith next
    >>击杀|cRXP_ENEMY_刺背号角手|r
    .complete 14455,1 --7/7 Bristleback Thorncaller slain
    .mob Bristleback Thorncaller
step
    >>击杀|r|cRXP_ENEMY_刺背枪匪|r. 从他们身上搜刮出|r|T135610:0|t[|cRXP_LOOT_被偷走的步枪|r]
    .complete 14456,1 --7/7 Stolen Rifle
    .mob Bristleback Gun Thief
step
    #label StolenRifles
    >>击杀|cRXP_ENEMY_刺背号角手|r
    .complete 14455,1 --7/7 Bristleback Thorncaller slain
    .mob Bristleback Thorncaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达娜·雷角|r交谈
    .goto 462,30.9,50.6
    .turnin 14456 >>交任务: |cRXP_FRIENDLY_勇气仪祭|r
    .turnin 14455 >>交任务: |cRXP_FRIENDLY_阻止号角手|r
    .accept 14459 >>接任务: |cRXP_LOOT_斗猪|r
    .accept 14461 >>接任务: |cRXP_WARN_邪恶的食粮|r
    .target Adana Thunderhorn
step
    #completewith ArmoredBattleboar
    #hidewindow
    #loop
    .goto 462,26.37,66.33,12,0
    .goto 462,25.12,69.15,12,0
    .goto 462,28.2,70.4,12,0
    +1
step
    #completewith ThirdTrough
    >>击杀|cRXP_ENEMY_重甲斗猪|r
    .goto 462,26.78,68.79,0,0
    .complete 14459,1 --10/10 Armored Battleboar slain
    .mob Armored Battleboar
step
    >>使用 |T135432:0|t[阿达纳的火把] 点燃|cRXP_PICK_Trough|r
    .complete 14461,1 --1/1 First Trough
    .use 49539
step
    >>在 [|cRXP_LOOT_trough|r] 旁边使用 |T135432:0|t[阿达纳的火炬]
    .complete 14461,2 --1/1 Second Trough
    .use 49539
step
    #label ThirdTrough
    >>在 [|cRXP_LOOT_trough|r] 旁边使用 |T135432:0|t[阿达纳的火炬]
    .complete 14461,3 --1/1 Third Trough
    .use 49539
step
    #label ArmoredBattleboar
    >>击杀|cRXP_ENEMY_重甲斗猪|r
    .complete 14459,1 --10/10 Armored Battleboar slain
    .mob Armored Battleboar
step
    #requires mulgoreAmoredBattleboar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达娜·雷角|r交谈
    .goto 462,30.9,50.6
    .turnin 14459 >>交任务: |cRXP_FRIENDLY_斗猪|r
    .turnin 14461 >>交任务: |cRXP_FRIENDLY_邪恶的食粮|r
    .accept 14460 >>接任务: |cRXP_WARN_荣誉仪祭|r
    .target Adana Thunderhorn
step
    >>击杀|r|cRXP_ENEMY_尖啸·刺鬃酋长|r. 从他身上搜刮出 [|cRXP_LOOT_披风|r]
    .goto 462,15.20,46.73
    .complete 14460,1 --1/1 Mane of Thornmantle
    .mob Chief Squealer Thornmantle
step << Hunter
    #completewith next
    .goto 462,23.69,38.27,25,0
    .cast 1515 >>驯服一只|cRXP_ENEMY_平原陆行鸟|r
    .mob Plainstrider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .goto 462,27.7,28.3
    .turnin 14460 >>交任务: |cRXP_FRIENDLY_荣誉仪祭|r
    .accept 24861 >>接任务: |cRXP_WARN_最后的仪式，最初的仪式|r
    .target Chief Hawkwind
step
    >>使用 |T132813:0|t[水罐]
    .goto 462,27.7,28.3
    .use 50465
    .complete 24861,1 --1/1 Offering Placed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .goto 462,27.7,28.3
    .turnin 24861 >>交任务: |cRXP_FRIENDLY_最后的仪式，最初的仪式|r
    .accept 23733 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Chief Hawkwind
step
    #completewith next
    #label RitesoftheEarthmother
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与山顶上的|r德亚米·翱风|r交谈
    .turnin 23733 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 24215 >>接任务: |cRXP_WARN_风之仪式|r
    .target Dyami Windsoar
step
    #title |cFFFCDC00跟随箭头指引|r
    #completewith RitesoftheEarthmother
    .goto 462,19.24,33.81,10,0
    .goto 462,11.91,27.64,10,0
    .goto 462,12.50,29.17,8 >>沿着山路向上走
step
    #requires RitesoftheEarthmother
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与山顶上的|r德亚米·翱风|r交谈
    .goto 462,15.63,30.26
    .turnin 23733 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 24215 >>接任务: |cRXP_WARN_风之仪式|r
    .target Dyami Windsoar
step
    #completewith next
    #label Mazzranache
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔·祈雨|r 交谈
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step
    #completewith Mazzranache
    .goto 462,15.40,27.68,10,0
    .goto 462,15.44,25.29,20,0
    .deathskip >>跟随箭头从山上跳下, 死亡并释放你的灵魂
step
    #requires Mazzranache
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔·祈雨|r 交谈
    .goto 7,47.16,56.66
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
]])

--Tauren Camp Mulgore
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ac) 莫高雷牛头人营地
#displayname |cFF00CCFF2|r - 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 
#defaultfor Tauren !DK

<< Horde

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔·祈雨|r 交谈
    .goto 7,47.16,56.66
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step
    #completewith next
    #label MulgoreABundleofHidesAcceptA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与帐篷内的|r瓦尔格·风语|r交谈
    .goto 7,46.06,58.19
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .target Varg Windwhisper
step
    #completewith MulgoreABundleofHidesAcceptA
    #title |cFFFCDC00进入帐篷|r
    *|cRXP_WARN_提醒:死亡跳跃后请重新召唤宠物|r. << Hunter/Warlock
    .goto 7,46.53,58.17,5 >>进入帐篷
step
    #label MulgoreABundleofHidesAcceptB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与帐篷内的|r瓦尔格·风语|r交谈
    .goto 7,46.06,58.19
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .target Varg Windwhisper
step
    #completewith next
    .goto 7,47.44,58.64
    .fp >>获取血蹄村飞行路径
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .target Tak
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .goto 7,48.78,58.79
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target Harken Windtotem
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .goto 7,48.61,59.8
    .accept 20440 >>接任务: |cRXP_LOOT_毒水|r
    .target Mull Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莫·雷角|r交谈
    .isQuestComplete 24215
    .goto 7,47.65,59.58
    .turnin 24215 >>交任务: |cRXP_FRIENDLY_风之仪式|r
    .accept 14438 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 24459 >>接任务: |cRXP_WARN_摩林·云行者|r
    .target Ahmo Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莫·雷角|r交谈
    .goto 7,47.65,59.58
    .accept 14438 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 24459 >>接任务: |cRXP_WARN_摩林·云行者|r
    .target Ahmo Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .goto 7,47.50,61.33
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target Ruul Eagletalon
step
    #completewith next
    >>击杀|cRXP_ENEMY_平原陆行鸟|r 和|cRXP_ENEMY_草原狼|r. 击败它们后拾取 |T136063:0|t[|cRXP_LOOT_平原陆行鸟的爪子|r ] 和 |T134297:0|t[|cRXP_LOOT_草原狼的爪子|r ]
    .complete 20440,2 --4/4 Plainstrider Talon
    .complete 20440,1 --6/6 Prairie Wolf Paw
    .mob Adult Plainstrider
    .mob Prairie Wolf
step
    #loop
    .goto 7,48.44,70.79,30,0
    .goto 7,53.35,71.71,30,0
    >>击杀|cRXP_ENEMY_Palemane Gnolls|r
    >>|cRXP_WARN_请注意稀有怪物|cRXP_ENEMY_断矛|r和|cRXP_ENEMY_Arra'chea|r(它们会提供一个经验值丰厚的任务)|r
    .complete 14438,1 --15/15 Palemane Gnolls
    .mob Palemane Skinner
    .mob Palemane Tanner
    .mob Palemane Poacher
    .mob Snagglespear
    .mob Arra'chea
step
    #completewith MulgorePoisonedWater
    >>击杀|cRXP_ENEMY_Swoops|r. 从它们身上获取战利品 |T135992:0|r[|cRXP_LOOT_猛鹫的羽毛|r]
    >>你现在无需立即完成此任务
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    #loop
    .goto 7,53.65,68.34,30,0
    .goto 7,50.30,65.51,30,0
    .goto 7,51.92,62.67,30,0
    >>击杀|cRXP_ENEMY_平原陆行鸟|r和 |cff00ecff草原狼|r. 击败它们后拾取 |T136063:0|t[|cRXP_LOOT_平原陆行鸟的爪子|r] 和 |T134297:0|t[|cRXP_LOOT_草原狼的爪子|r]
    .complete 20440,2 --4/4 Plainstrider Talon
    .complete 20440,1 --6/6 Prairie Wolf Paw
    .mob Adult Plainstrider
    .mob Prairie Wolf
step
    #label MulgorePoisonedWater
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .goto 7,48.62,59.81
    .turnin 20440 >>交任务: |cRXP_FRIENDLY_毒水|r
    .accept 24440 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
    .target Mull Thunderhorn
step
    >>使用井旁的|T135139:0|t[冰蹄之井净化图腾]
    .goto 7,53.47,65.36
    .use 5411
    .complete 24440,1 --Well Cleansed
step
    #completewith next
    >>击杀|cRXP_ENEMY_Swoops|r. 从它们身上获取战利品 |T135992:0|r[|cRXP_LOOT_猛鹫的羽毛|r]
    >>|cRXP_WARN_这个任务你现在不必完成|r
    .goto 7,56.22,63.43,30,0
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r谈话
    .goto 7,57.06,60.43
    .turnin 24459 >>交任务: |cRXP_FRIENDLY_摩林·云行者|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
    .target Morin Cloudstalker
step
    #completewith next
    >>击杀|cRXP_ENEMY_Swoops|r. 从它们身上获取战利品 |T135992:0|r[|cRXP_LOOT_猛鹫的羽毛|r]
    >>|cRXP_WARN_现在不必立即完成此任务|r
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    #completewith next
    >>击杀|cRXP_ENEMY_平原狮|r. 从它们身上搜取 |T133718:0|t[|cRXP_LOOT_平原狮的腿骨|r]
    >>|cRXP_WARN_现在不必立即完成此任务|r
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    .goto 7,53.52,48.28
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step
    .goto 7,57.06,60.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r谈话
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 26179 >>接任务: |cRXP_LOOT_风险投资公司|r
    .accept 26180 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司工人|r
    >>|cRXP_WARN_如果你看到稀有敌人执行者埃米尔冈德, 就杀掉他|r
    .complete 26179,1 --7/7 Venture Co. Worker slain
    .mob Venture Co. Worker
step
    >>Kill |cRXP_ENEMY_Supervisor Fizsprocket|r. Loot him for |T134944:0|t[|cRXP_LOOT_Fizsprocket's Clipboard|r].
    .goto 9,41.79,84.78
    .complete 26180,1 --1/1 Fizsprocket's Clipboard
    .mob Supervisor Fizsprocket
step
    #loop
    .goto 9,45.64,82.31,30,0
    .goto 7,59.09,48.71,20,0
    >>击杀|cRXP_ENEMY_风险投资公司工人|r
    >>|cRXP_WARN_如果你看到稀有敌人执行者埃米尔冈德, 就杀掉他|r
    .complete 26179,1 --7/7 Venture Co. Worker slain
    .mob Venture Co. Worker
step
    #completewith MulgorePoisonedWater
    >>击杀|r|猛鹫. 从它们身上搜刮其 [|cRXP_LOOT_quills|r]
    >>|cRXP_WARN_此时无需完成此任务|r.
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Swoop
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r谈话
    .goto 7,57.06,60.43
    .turnin 26179 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 26180 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .goto 7,48.62,59.81
    .turnin 24440 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .accept 24441 >>接任务: |cRXP_LOOT_雷角图腾|r
    .target Mull Thunderhorn
step
    .isQuestComplete 761
    .goto 7,48.78,58.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莫·雷角|r交谈
    .goto 7,47.65,59.58
    .turnin 14438 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .accept 14491 >>接任务: |cRXP_WARN_不休的大地|r
    .target Ahmo Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .goto 7,46.82,60.45
    .home >>将你的[炉石]设置为血蹄村
    .target Innkeeper Kauth
step
    .isQuestComplete 26188
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔·祈雨|r 交谈
    .goto 7,47.16,56.66
    .turnin 26188 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .mob Maur Raincaller
step
    .isOnQuest 6362
    .zoneskip 7,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .goto 7,47.45,58.64
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳下去, 然后与|cRXP_FRIENDLY_安哈努|r交谈
    .goto 88,45.75,55.83
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step
    #completewith next
    #label TalTheWindRiderMaster
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t爬上塔楼, 与|cRXP_FRIENDLY_塔尔|r交谈
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_WARN_向加翰回复|r
    .target Tal
step
    #completewith TalTheWindRiderMaster
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安哈努|r交谈
    .goto 88,45.75,55.83
    .vendor
    .target Ahanu
step
    #requires TalTheWindRiderMaster
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_WARN_爬上塔|r. 去找|cRXP_FRIENDLY_塔尔|r交谈
    .goto 88,47.03,49.60
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_WARN_向加翰回复|r
    .target Tal
step
    #completewith next
    #label WindfuryTalons
    >>击杀|r|cRXP_ENEMY_Windfury 风怒女巫|r和|r|cRXP_ENEMY_Windfury 哈比鸟|r. 击杀后搜刮它们的[|cRXP_LOOT_talons|r]利爪
    >>|cRXP_WARN_杀死你看到的|cRXP_ENEMY_Doomsayer Wiserunner|r(末日预言者智蹄), 如果见到他|r
    .complete 743,1 --8/8 Windfury Talon
    .mob Windfury Wind Witch
    .mob Windfury Harpy
step
    #completewith WindfuryTalons
    .goto 88,35.79,63.03,10,0
    .goto 88,32.51,70.74,35 >>乘坐两部电梯中的一部向下. 在此处死亡至少会损失一分钟时间
step
    #requires WindfuryTalons
    #completewith next
    >>击杀|cRXP_ENEMY_平原狮|r 和|cRXP_ENEMY_草原捕食者|r. 击败它们后拾取|T134297:0|t[|cRXP_LOOT_平原狮的爪子|r ]和|T134296:0|t[|cRXP_LOOT_草原捕食者的爪子|r ]
    *|cRXP_WARN_你现在不必立即完成这个任务.|r
    .complete 24441,2 --6/6 Cougar Claws
    .complete 24441,1 --6/6 Stalker Claws
    .mob Prairie Stalker
    .mob Flatland Cougar
-- TODO: Maybe split the waypoint for the rare from the quest step
step
    #requires WindfuryTalons
    >>击杀|r|cRXP_ENEMY_Windfury 风怒女巫|r和|r|cRXP_ENEMY_Windfury 哈比鸟|r. 击杀后搜刮它们的[|cRXP_LOOT_talons|r]利爪
    >>|cRXP_WARN_杀死你看到的|cRXP_ENEMY_Doomsayer Wiserunner|r(末日预言者智蹄), 如果见到他|r
    .goto 7,34.57,37.78,20,0
    .goto 7,35.62,39,85,20,0
    .goto 7,34.16,42.45,20,0
    .goto 7,35.34,43.13
    .complete 743,1 --8/8 Windfury Talon
    .mob Windfury Wind Witch
    .mob Windfury Harpy
step
    >>对 |cRXP_ENEMY_激动的大地之魂|r使用 |T133841:0|t[宁静大地之鼓]
    >>|cRXP_WARN_尝试在冷却完毕时使用战鼓. 有时元素生物可能会攻击你|r
    .use 49647
    .goto 7,35.37,46.63,35,0
    .goto 7,32.8,48.5
    .complete 14491,1 --6/6 Spirits Calmed
    .mob Agitated Earth Spirit
step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_通过点击宠物栏或法术书宠物选项卡中的“被动”按钮, 将你的宠物设置为被动模式|r
step
    #completewtih next
    #label KylesGoneMissing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
    .target Ahab Wheathoof
step
    #completewith KylesGoneMissing
    .goto 7,32.53,49.01
    .deathskip >>拉怪后死亡
step
    #requires KylesGoneMissing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .goto 7,48.34,53.09
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒:重新召唤你的宠物, 并将其设置为“协助”模式|r
step
    #completewith MulgoreCougarStalkerClaws
    >>击杀|cRXP_ENEMY_平原狮|r. 从它们身上搜取 |T133718:0|t[|cRXP_LOOT_平原狮的腿骨|r]
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith MulgoreCougarStalkerClaws
    >>击杀一只|cRXP_ENEMY_平原陆行鸟|r. 击杀后可获得一个 |T134343:0|t[|cRXP_LOOT_嫩步肉|r]
    .goto 7,44.71,52.05,0,0
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    #completewith MulgoreCougarStalkerClaws
    >>杀死|cRXP_ENEMY_消瘦的猛鹫|r. 击杀后从它们身上搜刮 [|cRXP_LOOT_羽毛|r]
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Wiry Swoop
step
    #label MulgoreCougarStalkerClaws
    .goto 7,47.18,50.35,20,0
    .goto 7,44.72,48.58,20,0
    .goto 7,42.48,44.81,20,0
    .goto 7,41.65,42.07,20,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35,20,0
    >>击杀|cRXP_ENEMY_平原狮|r 和|cRXP_ENEMY_草原捕食者|r. 击败它们后拾取|T134297:0|t[|cRXP_LOOT_平原狮的爪子|r ]和|T134296:0|t[|cRXP_LOOT_草原捕食者的爪子|r ]
    >>留意|cRXP_ENEMY_马兹拉纳其|r
    .complete 24441,2 --6/6 Cougar Claws
    .mob +Flatland Cougar
    .complete 24441,1 --6/6 Stalker Claws
    .mob +Prairie Stalker
step
    #completewith TrophySwoopQuill
    >>击杀|cRXP_ENEMY_平原狮|r. 从它们身上搜取 |T133718:0|t[|cRXP_LOOT_平原狮的腿骨|r]
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith TrophySwoopQuill
    >>击杀一只|cRXP_ENEMY_平原陆行鸟|r. 击杀后可获得一个 |T134343:0|t[|cRXP_LOOT_嫩步肉|r]
    .goto 7,44.71,52.05,0,0
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    #label TrophySwoopQuill
    >>杀死|cRXP_ENEMY_消瘦的猛鹫|r. 击杀后从它们身上搜刮 [|cRXP_LOOT_羽毛|r]
    .goto 7,47.18,50.35,15,0
    .goto 7,44.72,48.58,15,0
    .goto 7,42.48,44.81,15,0
    .goto 7,41.65,42.07,15,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35
    .complete 761,1 --8/8 Trophy Swoop Quill
    .mob Wiry Swoop
step
    #completewith next
    >>击杀|r平原狮|cRXP_ENEMY_Flatland Cougars|r. 击败它们, 搜刮出 [|cRXP_LOOT_femur|r]
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    >>击杀一只|cRXP_ENEMY_平原陆行鸟|r. 击败后可获得 [|cRXP_LOOT_嫩滑步肉|r]
    .goto 7,44.71,52.05
    .collect 33009,1,11129,1
    .mob Adult Plainstrider
step
    #loop
    .goto 7,47.18,50.35,15,0
    .goto 7,44.72,48.58,15,0
    .goto 7,42.48,44.81,15,0
    .goto 7,41.65,42.07,15,0
    .goto 7,46.13,39.72,20,0
    .goto 7,47.18,50.35,20,0
    >>击杀|r平原狮|cRXP_ENEMY_Flatland Cougars|r. 击败它们, 搜刮出 [|cRXP_LOOT_femur|r]
    .complete 26188,1 --1/1 Flatland Cougar Femur
    .mob Flatland Cougar
step
    #completewith MulgoreMazzranacheTurnin
    #label DieMazzranache
    .goto 7,44.58,45.22
    >>|cRXP_WARN_通过点击宠物栏或法术书宠物选项卡中的“被动”按钮, 将你的宠物设置为被动模式|r << Hunter/Warlock
    .deathskip >>拉怪后死亡
step << Warlock/Hunter
    #requires DieMazzranache
    #completewith next
    +|cRXP_WARN_提醒:重新召唤你的宠物, 并将其设置为“协助”模式|r
step
    #label MulgoreMazzranacheTurnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_茂尔·祈雨|r 交谈
    .goto 7,47.16,56.66
    .turnin 26188 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .mob Maur Raincaller
step
    #completewith next
    #label ReturnToVarg
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔格·风语|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Varg Windwhisper
step
    #completewith ReturnToVarg
    #title |cFFFCDC00进入帐篷|r
    .goto 7,46.58,58.20,8 >>进入帐篷
step
    #requires ReturnToVarg
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔格·风语|r交谈
    .goto 7,46.06,58.19
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Varg Windwhisper
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .goto 7,47.51,61.33
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target Ruul Eagletalon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾莫·雷角|r交谈
    .goto 7,47.65,59.59
    .turnin 14491 >>交任务: |cRXP_FRIENDLY_不休的大地|r
    .target Ahmo Thunderhorn
step
    #label MulgoreTurnInThunderhorn
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆尔·雷角|r交谈
    .goto 7,48.62,59.8
    .turnin 24441 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
    .target Mull Thunderhorn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .goto 7,48.78,58.79
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
step
    #loop
    .goto 7,48.25,60.43,20,0
    .goto 7,48.13,57.28,20,0
    >>凯雷(一只狼)在城市中绕圈奔跑. |cRXP_WARN_如果你看到他朝你跑来, 就等他靠近时瞄准他, 并使用[|cRXP_LOOT_嫩步肉|r|r]
    .complete 11129,1 --1/1 Kyle fed
    .target Kyle
    .use 33009
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .goto 7,48.34,53.09
    .turnin 11129 >>交任务: |cRXP_FRIENDLY_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Tauren
    #completewith next
    #label FlyToThunderbluffB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step << Tauren
    #completewith FlyToThunderbluffB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈布·爪蹄|r 交谈
    .goto 7,47.64,58.09
    .vendor 3685
    .target Harb Clawhoof
step
    #requires FlyToThunderbluffB
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .goto 7,47.44,58.64
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step
    #completewith next
    +|cRXP_WARN_前往奥格瑞玛有三种途径|r
    *1) Use the Character Stuck Feature
    *2) Use the |T237388:0|t[Scouting Map: Walking Kalimdor with the Earthmother] toy and fly to Orgrimmar
    *3) 跟随箭头指引 and take the Zeppelin to Orgrimmar (very slow)
    .link https://www.youtube.com/watch?v=pW3S9iDpn4Q >>角色卡住说明链接
step
    .goto 88,42.81,39.13,10,0
    .goto 88,39.41,38.33,8,0
    .goto 88,28.19,23.46,50,0
    .goto 88,15.27,25.72
    .zone 85 >>乘坐齐柏林飞艇
]])

--Undead Deathknell
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name AB) 丧钟镇
#displayname 丧钟镇 |cRXP_ENEMY_(备选)|r \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next ac) 亡灵永歌森林
#defaultfor Undead !DK

<< Horde

step << Undead
    .zoneskip 1727
    #completewith TirisfalFistQuestCheck
    +欢迎来到 |cfff78300亡灵起始区域指南|r. ——RestedXP
    *This route is up to 50% slower than |cfff78300Exiles Reach|r regardless of the available consumables/heirlooms. For faster leveling recreate your character and choose |cfff78300Exiles Reach|r instead.
step << Undead
    .zoneskip 1727,1
    +你位于流放者之境, 但当前指南适用于亡灵起始区域
    +请选择流放者高地向导
step
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label TirisfalFistQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿加莎|r交谈
    .goto 465,40.8,78.5
    .accept 24959 >>接任务: |cRXP_WARN_从墓穴中醒来|r
    .target Agatha
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_管理员摩尔多|r
    .goto 465,43.4,79.9
    .turnin 24959 >>交任务: |cRXP_FRIENDLY_从墓穴中醒来|r
    .accept 28608 >>接任务: |cRXP_WARN_灰影墓穴|r
    .target Undertaker Mordo
step
    >>|cRXP_WARN_跟随箭头向下进入墓穴|r, 并搜刮 [|cRXP_LOOT_麻绳|r和|cRXP_LOOT_液体|r]
    .goto 18,30.33,72.24,4,0
    .goto 18,30.32,72.84,4,0
    .goto 18,30.00,72.84,4,0
    .goto 18,29.7,72.0
    .complete 28608,2 --1/1 Corpse-Stitching Twine
    .complete 28608,1 --1/1 Thick Embalming Fluid
step
    #completewith next
    .goto 18,30.00,72.84,4,0
    .goto 18,30.32,72.84,4 >>离开墓地
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_管理员摩尔多|r
    .goto 465,43.4,79.9
    .turnin 28608 >>交任务: |cRXP_FRIENDLY_灰影墓穴|r
    .accept 26799 >>接任务: |cRXP_WARN_不可拯救的死者|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员凯斯|r交谈
    .goto 465,45.91,80.46
    .accept 24960 >>接任务: |cRXP_WARN_苏醒|r
step
    #sticky
    #label tirisfal26799
    >>击杀|cRXP_ENEMY_无脑的僵尸|r, 同时与亡灵交谈
    .goto 465,44.4,73.9,0,0
    .complete 26799,1 --6/6 Mindless Zombie slain
    .mob Mindless Zombie
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官雷德帕斯|r交谈
    .goto 465,46.6,71.1
    .skipgossip
    .complete 24960,2 --1/1 Speak with Marshal Redpath
    .target Marshal Redpath
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .goto 465,44.2,70.6
    .skipgossip
    .complete 24960,1 --1/1 Speak with Lilian Voss
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦德雷·莫莱|r交谈
    .goto 465,40.7,73.0
    .skipgossip
    .complete 24960,3 --1/1 Speak with Valdred Moray
    .target Valdred Moray
step
    #requires tirisfal26799
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_管理员摩尔多|r
    .goto 465,43.43,79.91
    .turnin 26799 >>交任务: |cRXP_FRIENDLY_不可拯救的死者|r
    .target Undertaker Mordo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_管理员凯斯|r交谈
    .goto 465,45.9,80.5
    .turnin 24960 >>交任务: |cRXP_FRIENDLY_苏醒|r
    .accept 25089 >>接任务: |cRXP_WARN_走出墓穴|r
    .target Caretaker Caice
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .goto 465,49.08,58.83,5,0
    .goto 465,46.6,58.8
    .accept 26801 >>接任务: |cRXP_WARN_境内的天灾|r
    .target Shadow Priest Sarvis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r交谈
    .goto 465,49.08,58.83,5,0
    .goto 465,49.90,56.38
    .turnin 25089 >>交任务: |cRXP_FRIENDLY_走出墓穴|r
    .accept 26800 >>接任务: |cRXP_WARN_清扫战场|r
    .target Deathguard Saltain
step << Warlock
    #completewith next
    +|cRXP_WARN_Reminder: 使用 |T136218:0|t[召唤地狱火] 召唤你的宠物|r
step
    #completewith next
    >>击杀|cRXP_ENEMY_丑陋的僵尸|r和|cRXP_ENEMY_断骨骷髅|r
    .goto 465,51.61,47.23,0,0
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Wretched Ghoul
    .mob Rattlecage Skeleton
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|r血色十字军尸体|r. |cRXP_WARN_请等待达恩利拾取尸体后再点击下一个|r
    .goto 465,47.58,48.29,15,0
    .goto 465,54.14,43.99,15,0
    .goto 465,53.74,51.00,10,0
    .goto 465,47.58,48.29
    .complete 26800,1 --6/6 Scarlet Corpses gathered
    .target Scarlet Corpse
step
    >>击杀|cRXP_ENEMY_丑陋的僵尸|r和|cRXP_ENEMY_断骨骷髅|r
    .goto 465,51.61,47.23
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Wretched Ghoul
    .mob Rattlecage Skeleton
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r交谈
    .goto 465,49.9,56.7
    .turnin 26800 >>交任务: |cRXP_FRIENDLY_清扫战场|r
    .target Deathguard Saltain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .goto 465,46.6,58.8
    .turnin 26801 >>交任务: |cRXP_FRIENDLY_境内的天灾|r
    .accept 28651 >>接任务: |cRXP_WARN_新兵艾尔雷斯|r
    .target Shadow Priest Sarvis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r.交谈
    .goto 465,46.8,58.2
    .turnin 28651 >>交任务: |cRXP_FRIENDLY_新兵艾尔雷斯|r
    .accept 24961 >>接任务: |cRXP_WARN_墓中的真相|r
    .target Novice Elreth
step
    --TODO: Add gossipoption
    .goto 465,52.38,56.41,2,0
    .goto 465,54.36,56.96,6,0
    .goto 465,46.75,58.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入房子, 与莉莉安·沃斯交谈
    >>|cRXP_WARN_她可能在楼下或楼上. 与她对话(在角色扮演过程中)后, 你就可以离开房子并返回到 |cRXP_FRIENDLY_新兵艾尔雷斯|r|r
    .skipgossip
    .complete 24961,1 --1/1 Show Lilian her reflection
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r.交谈
    .goto 465,46.7,58.2
    .turnin 24961 >>交任务: |cRXP_FRIENDLY_墓中的真相|r
    .accept 28672 >>接任务: |cRXP_WARN_战场上的执行官|r
    .target Novice Elreth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .goto 465,55.5,37.8
    .turnin 28672 >>交任务: |cRXP_FRIENDLY_战场上的执行官|r
    .accept 26802 >>接任务: |cRXP_LOOT_被诅咒者|r
    .target Executor Arren
step << Hunter
    #completewith next
    .cast 1515 >>驯服一只|cRXP_ENEMY_蓬毛食腐狼|r
    .mob Ragged Scavenger
step
    >>击杀你周围的|cRXP_ENEMY_癞皮夜行蝙蝠|r和|cRXP_ENEMY_Ragged Savengers|r. 从它们身上获取 [|cRXP_LOOT_paws|r和|cRXP_LOOT_wings|r]
    .goto 465,63.26,27.68,15,0
    .goto 465,64.45,22.78,15,0
    .goto 465,59.24,21.36,25,0
    .goto 465,49.41,21.94
    .complete 26802,1 --4/4 Scavenger Paw
    .complete 26802,2 --4/4 Duskbat Wing
    .mob Mangy Duskbat
    .mob Ragged Scavenger
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .goto 465,55.5,37.7
    .turnin 26802 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 24973 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .target Executor Arren
step
    #completewith next
    >>在前往矿井的路上, 杀死一些 |cRXP_ENEMY_小夜行蜘蛛|r
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    >>杀死矿井内的夜行蜘蛛
    .goto 465,30.18,30.58,10,0
    .goto 466,62.9,58.0,10,0
    .goto 466,45.27,69.84,10,0
    .goto 466,48.41,51.43,10,0
    .goto 466,62.09,58.59,10,0
    .complete 24973,2 --5/5 Night Web Spider slain
    .mob Night Web Spider
step
    >>离开矿井并击杀剩余的|cRXP_ENEMY_小夜行蜘蛛|r
    .goto 465,37.36,26.16
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .goto 465,55.5,37.8
    .turnin 24973 >>交任务: |cRXP_FRIENDLY_夜行蜘蛛洞穴|r
    .accept 24970 >>接任务: |cRXP_WARN_跟僵尸一样烂|r
    .target Executor Arren
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达内尔|r谈话
    .goto 465,67.1,42.4
    .turnin 24970 >>交任务: |cRXP_FRIENDLY_跟僵尸一样烂|r
    .accept 24971 >>接任务: |cRXP_WARN_袭击腐脑营地|r
    .target Darnell
step
    #completewith next
    >>击杀 |cRXP_ENEMY_腐脑狂战士|r和 |cRXP_ENEMY_腐脑巫师|r. |cRXP_WARN_请注意正在战斗的亡灵|r
    .goto 465,74.1,66.0,0,0
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Berserker
    .mob Robrain Magus
step
    >>杀死|cRXP_ENEMY_治安官雷德帕斯|r
    .goto 465,70.08,69.65
    .complete 24971,1 --1/1 Marshal Redpath slain
    .mob Marshal Redpath
step
    >>击杀 |cRXP_ENEMY_腐脑狂战士|r和 |cRXP_ENEMY_腐脑巫师|r. |cRXP_WARN_请注意正在战斗的亡灵|r
    .goto 465,74.1,66.0
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Berserker
    .mob Robrain Magus
step
    .isOnQuest 24971
    >>跟随箭头指示, 留意稀有怪法戈尔. 击败他后可获得一个 [|cRXP_LOOT_bag|r]
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .goto 465,61.88,82.00,5,0
    .goto 465,62.58,78.73,5,0
    .goto 465,46.6,58.8
    .turnin 24971 >>交任务: |cRXP_FRIENDLY_袭击腐脑营地|r
    .accept 24972 >>接任务: |cRXP_LOOT_重要情报|r
    .target Shadow Priest Sarvis
]])

--Undead Eversong Woods
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ac) 亡灵永歌森林
#displayname |cFF00CCFF2|r - 永歌森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 
#defaultfor Undead !DK

<< Horde

step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[喷气鞋]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跑过去和|cRXP_FRIENDLY_亡灵卫兵希米尔|r交谈
    .isQuestComplete 24972
    .goto 465,77.35,17.75,20,0
    .goto 18,44.75,53.67
    .turnin 24972 >>交任务: |cRXP_FRIENDLY_重要情报|r
    .target Deathguard Simmer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵希米尔|r和|cRXP_FRIENDLY_药剂师乔汉|r交谈
    .accept 24978 >>接任务: |cRXP_WARN_收割收割者|r
    .goto 18,44.75,53.67
    .accept 24975 >>接任务: |cRXP_LOOT_悲伤之地|r
    .goto 18,44.61,53.79
    .target Deathguard Simmer
    .target Apothecary Johaan
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼去和|cRXP_FRIENDLY_塞德里克·卡尔斯通|r交谈
    .goto 18,44.48,53.86,4,0
    .goto 18,44.74,53.65
    .accept 24974 >>接任务: |cRXP_WARN_从未如此孤单|r
    .target Sedrick Calston
step
    #completewith next
    .goto 18,40.33,51.42,0
    .goto 18,40.33,51.42,10 >>检查是否有可能的宝箱
step
    #completewith next
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r
    >>留意稀有敌人|cRXP_ENEMY_暗影猎手|r 和|cRXP_ENEMY_农夫索利丹|r
    .link https://i.imgur.com/lc7y3b4.jpeg >>你可以从截图所示位置攻击|r暗影猎手|cRXP_ENEMY_Shadowstalker|r
    .goto 18,40.33,51.42,0
    .goto 18,37.91,51.27,0,0
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取 [|cRXP_LOOT_Tirifal 南瓜|r]
    .goto 18,36.82,51.45,20,0
    .goto 18,35.57,51.12,20,0
    .goto 18,36.68,49.50,20,0
    .goto 18,36.48,50.85
    .complete 24975,1 --10/10 Tirisfal Pumpkin
step
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r
    >>留意稀有敌人|cRXP_ENEMY_暗影猎手|r 和|cRXP_ENEMY_农夫索利丹|r
    .goto 18,40.33,51.42,0
    .goto 18,37.91,51.27,0,0
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step << Warlock/Hunter
    #completewith next
    +|cfff78300通过点击宠物栏或法术界面中“宠物”选项卡下的“被动”按钮, 将你的宠物设置为被动模式|r
step
    >>攻击一个|cRXP_ENEMY_邪鳍鱼人|r, 直到它逃跑, 然后使用 |T133802:0|t[鱼人拴绳]. |cRXP_WARN_你不能杀死它|r
    >>留意稀有敌人|cRXP_ENEMY_穆亚德|r
    .use 52059
    .goto 18,35.8,43.4
    .complete 24974,1 --1/1 Vile Fin captured
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Puddlejumper
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_Reminder:将宠物切换到“协助”模式|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵希米尔|r和|cRXP_FRIENDLY_药剂师乔汉|r交谈
    >>返回途中留意|cRXP_ENEMY_贝恩|r
    .goto 18,45.30,49.37,15,0
    .unitscan Bayne
    .turnin 24978 >>交任务: |cRXP_FRIENDLY_收割收割者|r
    .goto 18,44.75,53.68
    .turnin 24975 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .goto 18,44.61,53.78
    .target Deathguard Simmer
    .target Apothecary Johaan
step
    >>上楼归还鱼人任务物品
    .goto 18,44.48,53.86,4,0
    .goto 18,44.76,53.56
    .complete 24974,2 --1/1 Vile Fin returned
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞德里克·卡尔斯通|r谈话
    .goto 18,44.75,53.65
    .turnin 24974 >>交任务: |cRXP_FRIENDLY_从未如此孤单|r
    .target Sedrick Calston
step
    #completewith next
    .goto 18,44.46,53.30,5,0
    .goto 18,44.07,58.24
    .deathskip >>拉一些怪物后死亡跳过到达布瑞尔
step
    #completewith next
    .goto 18,60.81,51.93,5,0
    .goto 18,60.87,51.51
    .home >>将你的[炉石]设置为布瑞尔
step
    .zoneskip 18,1
    >>前往银月城:
    .goto 18,60.98,58.84,6,0
    .goto 18,61.52,59.01,6,0
    .goto 18,60.73,58.68
    .zone 85 >>1) 攀上塔顶, 通过传送门前往奥格瑞玛
step
    .goto 85,56.03,88.28
    .zone 110 >>2) 通过传送门前往银月城
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>在银月城使用|T1405809:0|t[喷气靴]
step
    #completewith next
    .goto 110,57.57,24.59,5,0
    .goto 110,75.57,59.24,15,0
    .goto 110,73.52,59.20,15,0
    .goto 94,56.43,50.12
    .goto 94,54.4,50.7
    .fp >>获取永歌森林的飞行点
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|cRXP_FRIENDLY_Ranger Jaela|r交谈
    .goto 94,50.33,50.77
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target 8475
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_提醒:死亡跳跃后请重新召唤宠物|r.
step
    >>击杀|cRXP_ENEMY_天灾骨骸|r
    .goto 94,50.17,55.05
    .complete 8475,1 --8/8 Plaguebone Pillager slain
    .mob Plaguebone Pillager
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|cRXP_FRIENDLY_Ranger Jaela|r交谈
    .goto 94,50.33,50.77
    .turnin 8475 >>交任务: |cRXP_FRIENDLY_死亡之痕|r
    .target Ranger Jaela
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员斯凯勒斯|r交谈
    .goto 94,46.55,49.08,10,0
    .goto 94,46.24,46.79
    .fp >>获取鹰翼广场飞行路线
    .target Skymaster Skyles
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师亚隆尼斯|r交谈
    .goto 94,47.26,46.32
    .accept 8472 >>接任务: |cRXP_LOOT_失效的傀儡|r
    .target Magister Jaronis
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与通缉告示板互动
    .goto 94,48.16,46.31
    .accept 8468 >>接任务: |cRXP_WARN_通缉：饥饿者泰里斯|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,48.17,46.0
    .accept 8463 >>接任务: |cRXP_LOOT_不稳定的法力水晶|r
    .target Aeldon Sunbrand
step
    #completewith next
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 [|cRXP_LOOT_不稳定的法力水晶箱|r] 以收集它们
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    #completewith next
    >>击杀|r. 从他们身上搜刮 [|cRXP_LOOT_cores|r]
    .goto 94,46.94,44.59,15,0
    .goto 94,47.69,39.02,15,0
    .goto 94,47.11,37.44,15,0
    .goto 94,46.53,35.16,30,0
    .complete 8472,1 --6/6 Arcane Core
    .mob Arcane Patroller
step
    >>击杀|cRXP_ENEMY_Thaelis|r. 击败后搜刮他的 [|cRXP_LOOT_head|r]
    .goto 94,45.36,38.12,5,0
    .goto 94,45.01,37.68
    .complete 8468,1 --1/1 Thaelis' Head
    .mob Thaelis
step
    >>击杀|r. 从他们身上搜刮 [|cRXP_LOOT_cores|r]
    .goto 94,45.39,40.64,20,0
    .goto 94,42.18,40.59
    .complete 8472,1 --6/6 Arcane Cores
    .mob Arcane Patroller
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 [|cRXP_LOOT_不稳定的法力水晶箱|r] 以收集它们
    .goto 94,45.13,40.71,18,0
    .goto 94,46.01,43.29,25,0
    .goto 94,46.92,44.57,10,0
    .complete 8463,1 --6/6 Unstable Mana Crystal
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,48.17,46.0
    .turnin 8463 >>交任务: |cRXP_FRIENDLY_不稳定的法力水晶|r
    .accept 9352 >>接任务: |cRXP_LOOT_达纳苏斯的侵扰|r
    .target Aeldon Sunbrand
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坎伦|r交谈
    .goto 94,47.77,46.58
    .turnin 8468 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者泰里斯|r
    .target Sergeant Kan'ren
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师亚隆尼斯|r交谈
    .goto 94,47.26,46.30
    .turnin 8472 >>交任务: |cRXP_FRIENDLY_失效的傀儡|r
    .accept 8895 >>接任务: |cRXP_LOOT_送往北部圣殿的信|r
    .target Magister Jaronis
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者凯丹尼斯|r交谈
    .goto 94,44.63,53.13
    .turnin 8895 >>交任务: |cRXP_FRIENDLY_送往北部圣殿的信|r
    .accept 9119 >>接任务: |cRXP_LOOT_西部圣殿的麻烦|r
    .target Ley-Keeper Caidanis
step
    .itemcount 132516,1
    #completewith next
    .cast 202844 >>使用 |T1405809:0|t[喷气鞋]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者凯丹尼斯|r交谈
    .goto 94,36.7,57.44
    .turnin 9119 >>交任务: |cRXP_FRIENDLY_西部圣殿的麻烦|r
    .accept 8486 >>接任务: |cRXP_LOOT_不稳定的奥术|r
    .target Ley-Keeper Caidanis
    step
    #completewith next
    >>Kill a |cRXP_ENEMY_Darnassian Scout|r. Loot him for the [|cRXP_LOOT_Incriminating Documents|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>击杀|cRXP_ENEMY_法力漫步者|r和|cRXP_ENEMY_法力怨灵|r
    .goto 94,33.69,61.69,15,0
    .goto 94,34.50,57.84,20,0
    .goto 94,35.66,58.00
    .complete 8486,2 --5/5 Mana Stalker slain
    .complete 8486,1 --5/5 Manawraith slain
    .mob Mana Stalker
    .mob Manawraith
step
    >>Kill a |cRXP_ENEMY_Darnassian Scout|r. Loot him for the [|cRXP_LOOT_Incriminating Documents|r]. |TInterface/cursor/crosshair/interact.blp:20|tClick it in your bags
    .goto 94,36.4,60.7,20,0
    .goto 94,34.65,62.03,20,0
    .collect 20765,1,8482,1
    .accept 8482 >>接任务: |cRXP_LOOT_秘密文件|r
    .complete 9352,1 --1/1 Intruder Defeated
    .mob Darnassian Scout
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔网监护者薇兰妮亚|r交谈
    .goto 94,36.7,57.44
    .turnin 8486 >>交任务: |cRXP_FRIENDLY_不稳定的奥术|r
    .turnin 9352 >>交任务: |cRXP_FRIENDLY_达纳苏斯的侵扰|r
    .target Ley-Keeper Velania
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将宠物设置为“被动”模式|r
step
    #completewith next
    .goto 94,35.46,57.41
    .deathskip >>拉一些怪物, 死后在灵魂治疗师处复活
step
    .xp <10-1600,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .goto 94,44.03,70.76
    .accept 9254 >>接任务: |cRXP_LOOT_外出的学徒|r
    .target Magistrix Landra Dawnstrider
    step << Hunter/Warlock
    #completewith next
    +|cRXP_WARN_提醒:重新召唤你的宠物并设置为“协助”模式|r.
step
    .isOnQuest 9254
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 9254 >>交任务: |cRXP_FRIENDLY_外出的学徒|r
    .accept 8487 >>接任务: |cRXP_LOOT_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    .isOnQuest 8487
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 [|cRXP_LOOT_被污染的土壤样本|r]
    .goto 94,52.34,71.77,20,0
    .goto 94,51.92,68.47,20,0
    .goto 94,52.59,69.60,10,0
    .goto 94,53.75,69.89,10,0
    .goto 94,52.36,69.80
    .complete 8487,1 --8/8 Tainted Soil Sample
step
    .isQuestComplete 8487
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 8487 >>交任务: |cRXP_FRIENDLY_被腐蚀的土地|r
    .target Apprentice Mirveda
step
    .isQuestTurnedIn 8487
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待约5秒钟后, 再次与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .accept 8488 >>接任务: |cRXP_LOOT_出人意料的结果|r
    .target Apprentice Mirveda
step
    .isOnQuest 8488
    >>击杀|r|cRXP_ENEMY_冷酷的加苏尔|r. 你可以风筝他回到|r|cRXP_FRIENDLY_学徒米尔维达|r
    .goto 94,53.68,69.76
    .complete 8488,2 --1/1 Gharsul the Remorseless slain
    .mob Gharsul the Remorseless
step
    .isQuestComplete 8488
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学徒米尔维达|r交谈
    .goto 94,54.28,70.98
    .turnin 8488 >>交任务: |cRXP_FRIENDLY_出人意料的结果|r
    .accept 9255 >>接任务: |cRXP_LOOT_研究笔记|r
    .target Apprentice Mirveda
step << Warlock/Hunter
    #completewith next
    +|cRXP_WARN_将宠物设置为“被动”模式|r
step
    .isOnQuest 9255
    #completewith next
    .goto 94,51.47,80.11,20,0
    .deathskip >>拉怪后死亡
step
    .isOnQuest 9255
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_魔导师兰德拉·晨行者|r交谈
    .goto 94,44.02,70.77
    .turnin 9255 >>交任务: |cRXP_FRIENDLY_研究笔记|r
    .target Magistrix Landra Dawnstrider
step
    #completewith next
    .goto 94,43.95,69.98
    .fp >>获取晴风村飞行路径
step
    #completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行管理员晨光|r交谈
    .goto 94,43.95,69.98
    .fly Falconwing Square >>飞往鹰翼广场
    .target Skymaster Brightdawn
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔杜·炙痕|r交谈
    .goto 94,48.17,46.00
    .turnin 8482 >>交任务: |cRXP_FRIENDLY_秘密文件|r
    .target Aeldon Sunbrand
step
    #completewith next
    .hs >>传送回布瑞尔
step
    >>前往奥格瑞玛:
    .goto 18,60.98,58.84,6,0
    .goto 18,61.52,59.01,6,0
    .goto 18,60.73,58.68
    .zone 85 >>1) 攀上塔顶, 通过传送门前往奥格瑞玛
]])

--Goblin Kezan & The Lost Isles
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name ab) 地精入门
#displayname |cFF00CCFF1|r - 科赞&失落群岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 

<< Goblin !DK

step << Goblin
    .zoneskip 1727
    #completewith KezanFirstQuestCheck
    +欢迎来到|cRXP_WARN_地精起始区域|r. RestedXP 指南
    *This route is a lot slower than |cRXP_WARN_Exiles Reach|r. For faster leveling recreate your character and choose |cRXP_WARN_Exiles Reach|r instead.
step << Goblin
    .zoneskip 1727,1
    +你位于流放者之角, 但当前指南适用于|cRXP_WARN_地精起始区域|r
    +请选择|cRXP_WARN_Exiles Reach|r探险指南
step
    #completewith next
    +|cRXP_WARN_如果你想充分利用RXP, 请按Esc -> 选项 -> 键位设置 -> RestedXP指南 -> 选择并绑定按钮1和2和3和4. 你也可以对目标执行此操作|r.
    *This will allow you to press a Keybind to use a Quest Items/target a relevant mob
step
    #label KezanFirstQuestCheck
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 194,56.4,76.9
    .accept 14138 >>接任务: |cRXP_WARN_照看生意|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 194,60.3,74.6
    .turnin 14138 >>交任务: |cRXP_FRIENDLY_照看生意|r
    .accept 14069 >>接任务: |cRXP_WARN_好帮手很难找|r
    .accept 14075 >>接任务: |cRXP_WARN_矿井的麻烦事|r
    .target Foreman Dampwick
step
    #completewith next
    .goto 194,65.52,87.82,10 >>进入矿坑
step
    #completewith KezanTroubleintheMines
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_抗命的巨魔|r. 它们也出现在矿井外部区域
    .goto 194,66.02,82.39,0,0
    .complete 14069,1 --8/8 Attitudes Adjusted
    .target Defiant Troll
step
    #label KezanTroubleintheMines
    >>击杀|cRXP_ENEMY_矿道虫|r
    .goto 197,50.73,59.55
    .complete 14075,1 --6/6 Tunneling Worm slain
    .mob Tunneling Worm
step
    #completewith next
    .goto 194,65.52,87.82,8 >>离开矿井
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_抗命的巨魔|r
    .goto 194,72.45,83.45,50,0
    .goto 194,70.39,77.73,30,0
    .goto 194,68.74,82.87
    .complete 14069,1 --8/8 Attitudes Adjusted
    .target Defiant Troll
step
    #completewith next
    .hs >>回到KTC总部
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 194,60.1,74.6
    .turnin 14075 >>交任务: |cRXP_FRIENDLY_矿井的麻烦事|r
    .turnin 14069 >>交任务: |cRXP_FRIENDLY_好帮手很难找|r
    .accept 25473 >>接任务: |cRXP_WARN_卡亚可乐|r
    .target Foreman Dampwick
step << Warlock
    #completewith next
    +|cRXP_WARN_Reminder: 使用 |T136218:0|t[召唤地狱火] 召唤你的宠物|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sassy Handwrench|r交谈
    .goto 194,56.4,76.9
    .turnin 25473 >>交任务: |cRXP_FRIENDLY_卡亚可乐|r
    .accept 28349 >>接任务: |cRXP_WARN_市场部的梅格斯|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅格斯·碎纸机|r 交谈
    .goto 194,58.3,76.4
    .turnin 28349 >>交任务: |cRXP_FRIENDLY_市场部的梅格斯|r
    .accept 14071 >>接任务: |cRXP_WARN_呼朋唤友|r
    .target Megs Dreadshredder
step
    >>使用 |T134246:0|t[改装跑车的钥匙] 骑乘改装跑车
    .goto 194,58.9,76.3
    .complete 14071,1 --1/1 钥匙 to the Hot Rod used
    .use 46856
step
    >>跟随箭头拾取|cRXP_FRIENDLY_小静|r
    >>在冷却结束后使用 |T135788:0|t[重拳] (1)
    .goto 194,59.93,85.52,15,0
    .goto 194,58.9,85.5
    .complete 14071,2 --1/1 Izzy picked up
    .target Izzy
step
    >>跟随箭头拾取|cRXP_FRIENDLY_大胖|r
    >>在冷却结束后使用 |T135788:0|t[重拳] (1)
    .goto 194,59.93,85.52,15,0
    .goto 194,57.95,70.46,20,0
    .goto 194,60.6,49.9
    .complete 14071,4 --1/1 Gobber picked up
    .target Gobber
step
    >>跟随箭头拾取|cRXP_FRIENDLY_王牌|r
    >>在冷却结束后使用 |T135788:0|t[重拳] (1)
    .goto 194,48.5,38.3
    .complete 14071,3 --1/1 Ace picked up
    .target Ace
step
    #completewith next
    .goto 194,61.98,54.83,30,0
    .goto 194,60.13,64.59,30,0
    .goto 194,57.90,71.12,20 >>沿着街道往回走
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅格斯·碎纸机|r 交谈
    .goto 194,58.3,76.5
    .turnin 14071 >>交任务: |cRXP_FRIENDLY_呼朋唤友|r
    .accept 24567 >>接任务: |cRXP_WARN_参加预选赛|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sassy Handwrench|r交谈
    .goto 194,56.4,77.0
    .accept 14070 >>接任务: |cRXP_WARN_亲自动手|r
    .target Sassy Handwrench
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奇普·英代尔|r交谈
    .goto 194,56.3,76.8
    .accept 26711 >>接任务: |cRXP_WARN_前往银行|r
    .target Chip Endale
--female quest
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小甜甜|r交谈
    .goto 194,56.3,76.8
    .accept 26712 >>接任务: |cRXP_WARN_前往银行|r
    .target Candy Cane
--male quest
step
    >>沿着箭头绕过房子, 然后攻击|cRXP_ENEMY_布鲁诺·防火棉|r
    *|cRXP_WARN_Don't forget to use your 钥匙 to the Hot Rod|r.
    .use 46856
    .goto 194,57.52,76.93,5,0
    .goto 194,57.46,78.35,5,0
    .goto 194,55.34,78.25,5,0
    .goto 194,45.25,74.75
    .complete 14070,1 --1/1 Bruno Flameretardant beaten down
    .mob Bruno Flameretardant
step
    >>攻击|cRXP_ENEMY_萨德希·玛格|r
    .goto 194,41.6,81.9
    .complete 14070,4 --1/1 Sudsy Magee beaten down
    .mob Sudsy Magee
step
    >>攻击|cRXP_ENEMY_“锤子”杰克|r
    .goto 194,37.47,75.97,15,0
    .goto 194,35.0,77.8
    .complete 14070,3 --1/1 Jack the Hammer beaten down
    .mob Jack the Hammer
step
    >>攻击|cRXP_ENEMY_Frankei Gearslipper|r
    .goto 194,36.84,69.95
    .complete 14070,2 --1/1 Frankie Gearslipper beaten down
    .mob Frankey Gearslipper
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请务必使用你的改装跑车的钥匙|r
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入银行, 与|cRXP_FRIENDLY_第一银行柜台员|r交谈
    .goto 194,34.16,69.32,10,0
    .goto 194,32.27,63.79,12,0
    .goto 194,29.72,64.52,16,0
    .goto 194,30.1,71.9
    .turnin 26711 >>交任务: |cRXP_FRIENDLY_前往银行|r
    .accept 14110 >>接任务: |cRXP_WARN_崭新的你|r
    .target FBoK Bank Teller
--female quest
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入银行, 与|cRXP_FRIENDLY_第一银行柜台员|r交谈
    .goto 194,34.16,69.32,10,0
    .goto 194,32.27,63.79,12,0
    .goto 194,29.72,64.52,16,0
    .goto 194,30.1,71.9
    .turnin 26712 >>交任务: |cRXP_FRIENDLY_前往银行|r
    .accept 14109 >>接任务: |cRXP_WARN_崭新的你|r
    .target FBoK Bank Teller
--male quest
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请务必使用你的 |T134246:0|t[改装跑车的钥匙] (当你需要快速前往某地时, 应始终使用它们)|r
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏扎博|r交谈
    .goto 194,29.80,63.62,16,0
    .goto 194,34.66,54.73,10,0
    .goto 194,37.63,55.38
    .use 46856
    .skipgossip
    .complete 14110,2 --1/1 Hip New Outfit
    .target Szabo
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏扎博|r交谈
    .goto 194,29.80,63.62,16,0
    .goto 194,34.66,54.73,10,0
    .goto 194,37.63,55.38
    .use 46856
    .skipgossip
    .complete 14109,2 --1/1 Hip New Outfit
    .target Szabo
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“大金牙”盖比|r交谈
    .goto 194,34.9,45.7
    .skipgossip
    .complete 14110,1 --1/1 Shiny Bling
    .target Gappy Silvertooth
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“大金牙”盖比|r交谈
    .goto 194,34.9,45.7
    .skipgossip
    .complete 14109,1 --1/1 Shiny Bling
    .target Gappy Silvertooth
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“软糖”米萨|r谈话
    .goto 194,40.5,45.8
    .skipgossip
    .complete 14110,3 --1/1 Cool Shades
    .target Missa Spekkies
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“软糖”米萨|r谈话
    .goto 194,40.5,45.8
    .skipgossip
    .complete 14109,3 --1/1 Cool Shades
    .target Missa Spekkies
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r交谈
    .goto 194,42.57,55.34,20,0
    .goto 194,48.8,57.8
    .turnin 24567 >>交任务: |cRXP_FRIENDLY_参加预选赛|r
    .accept 24488 >>接任务: |cRXP_WARN_替代品|r
    .target Coach Crosscheck
step
    >>在热车(Hot Rod)上时, 从地上拾取|cRXP_PICK_Replacements| 零件
#loop
	.line 194,50.99,57.96,51.22,61.01,49.78,66.39,48.17,66.87,46.08,68.18,44.49,65.76,44.23,63.11,43.75,59.25
	.goto 194,50.99,57.96,20,0
	.goto 194,51.22,61.01,20,0
	.goto 194,49.78,66.39,20,0
	.goto 194,48.17,66.87,20,0
	.goto 194,46.08,68.18,20,0
	.goto 194,44.49,65.76,20,0
	.goto 194,44.23,63.11,20,0
	.goto 194,43.75,59.25,20,0
    .complete 24488,1 --6/6 Replacement Parts
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r交谈
    .goto 194,48.8,57.8
    .turnin 24488 >>交任务: |cRXP_FRIENDLY_替代品|r
    .accept 24502 >>接任务: |cRXP_WARN_必要的粗暴|r
    .target Coach Crosscheck
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_锈水海盗队|r机器人
    >>使用 |T134480:0|t[投掷脚炸弹] (1) 来击杀你面前的|cRXP_ENEMY_热砂港大鲨鱼队队员|r
    .goto 194,47.7,57.7
    .complete 24502,1 --1/1 Bilgewater Buccaneer
    .complete 24502,2 --8/8 Steamwheedle Shark Footbombed
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击任务日志中的任务, |cRXP_WARN_你可能需要下马才能从|cRXP_FRIENDLY_克罗斯彻克教练|r|r接受下一个任务
    .goto 194,47.7,57.7
    .turnin 24502 >>交任务: |cRXP_FRIENDLY_必要的粗暴|r
    .accept 24503 >>接任务: |cRXP_WARN_四攻得分|r << Male
    .accept 28414 >>接任务: |cRXP_WARN_四攻得分|r << Female
    .target Coach Crosscheck
step
    >>使用 |T134480:0|t[踢飞炸弹] (1)
    .complete 24503,1 << Male --1/1 Footbomb Kicked Through Smokestacks
    .complete 28414,1 << Female --1/1 Footbomb Kicked Through Smokestacks
step
    #completewith next
    +|cRXP_WARN_离开载具|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r交谈
    .goto 194,48.7,57.8
    .turnin 24503 >>交任务: |cRXP_FRIENDLY_四攻得分|r << Male
    .turnin 28414 >>交任务: |cRXP_FRIENDLY_四攻得分|r << Female
    .accept 24520 >>接任务: |cRXP_WARN_告诉莎希好消息|r
    .target Coach Crosscheck
step
    #completewith next
    .use 46856
    .vehicle 34840 >>|cRXP_WARN_请务必使用你的 |T134246:0|t[改装跑车的钥匙] (当你需要快速前往某地时, 应始终使用它们)|r
step
    #completewith next
    .goto 194,52.91,51.59,30,0
    .goto 194,61.86,55.57,20,0
    .goto 194,61.01,62.01,8,0
    .goto 194,57.76,71.07,15 >>请沿箭头返回总部
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r和|cRXP_FRIENDLY_奇普·英代尔|r交谈
    .goto 194,57.58,76.99,10,0
    .turnin 24520 >>交任务: |cRXP_FRIENDLY_告诉莎希好消息|r
    .turnin 14070 >>交任务: |cRXP_FRIENDLY_亲自动手|r
    .goto 194,56.4,76.9
    .turnin 14110 >>交任务: |cRXP_FRIENDLY_崭新的你|r
    .accept 14153 >>接任务: |cRXP_WARN_聚会生活|r
    .goto 194,56.3,76.8
    .target Sassy Hardwrench
    .target Chip Endale
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r和|cRXP_FRIENDLY_小甜甜|r交谈
    .goto 194,57.58,76.99,10,0
    .turnin 24520 >>交任务: |cRXP_FRIENDLY_告诉莎希好消息|r
    .turnin 14070 >>交任务: |cRXP_FRIENDLY_亲自动手|r
    .goto 194,56.4,76.9
    .turnin 14109 >>交任务: |cRXP_FRIENDLY_崭新的你|r
    .accept 14113 >>接任务: |cRXP_WARN_聚会生活|r
    .goto 194,56.3,76.8
    .target Sassy Hardwrench
    .target Candy Cane
step
    >>使用 |T132809:0|t[泡泡] (1) 作用于饮用时的|cRXP_FRIENDLY_Goblins|r地精
    >>使用|T132806:0|t[桶] (2)作用于醉酒或神志不清的|r地精身上
    >>|T133836:0|t[舞蹈] (3) 与|cRXP_FRIENDLY_地精|r跳舞
    >>使用 |T134285:0|t[烟花] (4) 在|cRXP_FRIENDLY_Goblins|r的地精身上, 使其带有火花
    >>使用 |T237329:0|t[开胃菜] (5) |cRXP_FRIENDLY_地精|r使用, 直到他们吃掉为止
    .goto 194,59.56,78.75,15,0
    .goto 194,59.09,80.31,10,0
    .goto 194,60.59,82.98,15,0
    .goto 194,60.82,86.33,15,0
    .goto 194,60.6,83.4
    .complete 14153,1 << Female --10/10 Partygoer entertained
	.complete 14113,1 << Male --10/10 Partygoer entertained
    .target Kezan Partygoer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 194,57.41,77.03,8,0
    .goto 194,56.4,77.0
    .turnin 14153 >>交任务: |cRXP_FRIENDLY_聚会生活|r << Female
	.turnin 14113 >>交任务: |cRXP_FRIENDLY_聚会生活|r << Male
    .accept 14115 >>接任务: |cRXP_WARN_捣乱的海盗|r
    .target Sassy Hardwrench
step
    >>击杀|cRXP_ENEMY_捣乱的海盗|r. 优先集中攻击血量较低的目标
    .goto 194,57.51,76.97,8,0
    .goto 194,60.05,80.79
    .complete 14115,1 --12/12 Pirate Party Crasher slain
    .target Pirate Party Crasher
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 194,56.4,77.0
    .turnin 14115 >>交任务: |cRXP_FRIENDLY_捣乱的海盗|r
    .accept 14116 >>接任务: |cRXP_WARN_不速之客|r
    .target Sassy Hardwrench
step
    #completewith next
    .goto 194,56.41,75.33,5,0
    .goto 194,55.99,75.65,4,0
    .goto 194,55.96,77.07,5 >>上楼梯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .goto 194,56.7,76.9
    .turnin 14116 >>交任务: |cRXP_FRIENDLY_不速之客|r
    .accept 14120 >>接任务: |cRXP_WARN_万亿杏仁币|r
    .target Trade Prince Gallywix
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳窗后与|cRXP_FRIENDLY_萨西·手扳钳|r和|cRXP_FRIENDLY_梅格斯·碎纸机|r和|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .turnin 14120 >>交任务: |cRXP_FRIENDLY_万亿杏仁币|r
    .accept 14122 >>接任务: |cRXP_WARN_紧急措施|r
    .goto 194,59.6,77.1
    .accept 14121 >>接任务: |cRXP_WARN_热力追踪|r
    .goto 194,60.0,78.1
    .accept 14124 >>接任务: |cRXP_WARN_搜刮卡亚矿石|r
    .goto 194,63.0,77.8
    .target Sassy Handwrench
    .target Megs Dreadshredder
    .target Foreman Dampwick
step
    #completewith next
    .use 46856
    .vehicle 34840 >>|cRXP_WARN_请务必使用你的 |T134246:0|t[改装跑车的钥匙]. 进入车辆后, 你将免疫坠落伤害|r
step
    >>将 |T133712:0|t[不靠谱炸弹] 投向卡贾米特矿床, 并拾取矿场附近地面上的 [|cRXP_LOOT_卡贾米特碎块|r]
    .goto 194,67.27,77.69,8,0
    .goto 194,69.59,79.35,8,0
    .goto 194,69.03,83.16,8,0
    .goto 194,66.64,84.03,8,0
    .goto 194,66.09,87.34,8,0
    .goto 194,64.34,83.48,8,0
    .goto 194,64.5,83.6
    .use 48768
    .complete 14124,1 --12/12 Kaja'mite Chunk
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史莉琪·剃刀|r交谈. 她会在附近区域移动
    .goto 194,58.82,75.06
    .accept 14123 >>接任务: |cRXP_WARN_别墅漫步|r
    .target Slinky Sharpshiv
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请务必使用你的 |T134246:0|t[改装跑车的钥匙]. 进入车辆后, 你将免疫坠落伤害|r
step
    #completewith next
    >>当看到 |cRXP_ENEMY_受雇的抢掠者|r 时, 驱赶他们
    .goto 194,57.94,69.61,15,0
    .goto 194,47.67,60.09,25,0
    .goto 194,38.63,78.42,25,0
    .goto 194,32.71,63.68,10,0
    .goto 194,29.79,63.75,10,0
    .complete 14121,1 --12/12 Stolen Loot
    .mob Hired Looter
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_科赞避难所第一银行|r并按照屏幕中央显示的说明进行操作
    .goto 194,29.3,69.5
    .complete 14122,1 --1/1 First Bank of Kezan Vault
    .complete 14122,2 --1/1 Personal Riches
step
    >>驱车碾过|cRXP_ENEMY_受雇的抢掠者|r
    .goto 194,35.91,53.68,20,0
    .goto 194,41.33,53.03,20,0
    .goto 194,41.16,42.01,20,0
    .goto 194,35.96,44.39
    .complete 14121,1 --12/12 Stolen Loot
    .mob Hired Looter
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请确保使用你的 |T134246:0|t[改装跑车的钥匙]|r
step
    #completewith KezanWaltzRightIn
    +|cRXP_WARN_请避开|r|cRXP_ENEMY_巨怪保安|r和 |cRXP_ENEMY_基斯诺特胖肚子|r, 因为他们能发现并击杀你|r
step
    >>拾取 [|cRXP_LOOT_bomb|r]
    .goto 194,24.20,40.67,30,0
    .goto 194,19.9,30.7
    .complete 14123,3 --1/1 The Ultimate Bomb
step
    >>拾取 [|cRXP_LOOT_painting|r]
    .goto 194,13.1,35.2
    .complete 14123,2 --1/1 The Goblin Lisa
step
    #completewith next
    .goto 194,17.66,44.49,8,0
    .goto 194,17.66,45.92,8,0
    .goto 194,16.79,46.89,5,0
    .goto 194,17.84,46.82,5,0
    .goto 194,17.34,45.91,3 >>上楼梯
step
    #label KezanWaltzRightIn
    >>拾取 [|cRXP_LOOT_Maldy's Falcon|r]
    .goto 194,16.7,46.2
    .complete 14123,1 --1/1 Maldy's Falcon
step
    #completewith next
    .goto 194,17.65,45.94,5,0
    .goto 194,17.00,33.96
    .deathskip >>跳窗并主动接触敌对的|cRXP_ENEMY_巨怪保安|r或|cRXP_ENEMY_Keesnout Potbellys|r以触发死亡
step
    #completewith next
    .goto 194,61.89,54.13,25,0
    .goto 194,57.90,71.17,15 >>前往总部的路线
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史莉琪·剃刀|r交谈
    .goto 194,58.97,76.03
    .turnin 14123 >>交任务: |cRXP_FRIENDLY_别墅漫步|r
    .target Slinky Sharpshiv
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 194,59.7,76.9
    .turnin 14122 >>交任务: |cRXP_FRIENDLY_紧急措施|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅格斯·碎纸机|r 交谈
    .goto 194,60.0,78.2
    .turnin 14121 >>交任务: |cRXP_FRIENDLY_热力追踪|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 194,62.9,77.8
    .turnin 14124 >>交任务: |cRXP_FRIENDLY_搜刮卡亚矿石|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 194,59.8,76.9
    .accept 14125 >>接任务: |cRXP_WARN_447|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t进入房屋 and |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Defective Generator|r.
    .goto 194,56.07,76.63
    .complete 14125,1 --1/1 Overload the Defective Generator
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_漏水的炉子|r
    .goto 194,56.05,74.67
    .complete 14125,2 --1/1 Activate the Leaky Stove
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t上楼梯 and |TInterface/cursor/crosshair/interact.blp:20|tClick the |cRXP_PICK_Flammable Bed|r.
    .goto 194,55.98,77.11,5,0
    .goto 194,56.64,76.33,5,0
    .goto 194,56.61,74.85
    .complete 14125,3 --1/1 Drop a Cigar on the Flammable Bed
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|tJump out of the window and |TInterface/cursor/crosshair/interact.blp:20|tClick on the |cRXP_PICK_Gasbot Control Panel|r.
    >>等待短暂的剧情演出
    .goto 194,56.60,76.93,8,0
    .goto 194,59.49,76.81
    .complete 14125,4 --1/1 KTC Headquarters Set Ablaze with Gasbot!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_事故勘察员|r 和|cRXP_FRIENDLY_莎希·硬钳|r 交谈
    .turnin 14125 >>交任务: |cRXP_FRIENDLY_447|r
    .goto 194,59.6,76.6
    .accept 14126 >>接任务: |cRXP_WARN_毕生积蓄|r
    .goto 194,59.6,77.1
    .target Claims Adjuster
    .target Sassy Hardwrench
step
    #completewith next
    .vehicle 34840 >>|cRXP_WARN_请确保使用你的 |T134246:0|t[改装跑车的钥匙]|r
step
    #completewith next
    .goto 194,25.69,32.13,10,0
    .goto 194,22.22,24.92,10 >>紧贴山体一侧前进
step
    #completewith next
    .goto 194,22.31,16.78
    .cast 92633 >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击大炮
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .use 46856
    .goto 194,20.8,13.7
    .turnin 14126 >>交任务: |cRXP_FRIENDLY_毕生积蓄|r
    .target Trade Prince Gallywix
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎普诺兹医生|r交谈
    >>有时你会卡住, 需要重新登录或输入/reload命令
    .goto 174,24.6,77.9
    .turnin 14239 >>交任务: |cRXP_FRIENDLY_还不是见圣光的时候！|r
    .target Doc Zapnozzle
step
    .goto 174,24.65,77.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“发明家”盖格林登|r交谈
    .accept 14001 >>接任务: |cRXP_WARN_地精逃生舱|r
    .target Geargrinder Gizmo
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_地精逃生舱|r
    .goto 174,22.99,75.62,30,0
    .goto 174,25.50,77.65,30,0
    .goto 174,25.37,75.44
    .complete 14001,1 --6/6 Goblin Survivors Rescued
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sassy Handwrench|r交谈
    .goto 174,27.9,75.5
    .turnin 14001 >>交任务: |cRXP_FRIENDLY_地精逃生舱|r
    .accept 14014 >>接任务: |cRXP_WARN_夺回工具箱！|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克斯·雪崩|r谈话
    .goto 174,27.85,74.29
    .accept 14473 >>接任务: |cRXP_WARN_收拾烂摊子|r
    .target Maxx Avalanche
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴姆·重磅炸弹|r交谈
    .goto 174,27.95,74.43
    .accept 14019 >>接任务: |cRXP_WARN_闯祸的猴子|r
    .target Bamm Megabomb
step << Hunter
    #completewith next
    .cast 1515 >>驯服一只|cRXP_ENEMY_刺角雏龙|r
    .mob Teraptor Hatchling
step
    #sticky
    #label TheLostIslesTeraMonkeys
    >>对|cRXP_ENEMY_投弹猴子|r使用|T133979:0|t[硝化钾香蕉], 并击杀|cRXP_ENEMY_刺角雏龙|r
    .use 49028
    .goto 174,27.32,70.14,0,0
    .complete 14473,1 --6/6 Teraptor Hatchling slain
    .complete 14019,1 --10/10 Bomb-Throwing Monkeys Fed
    .mob Bomb Throwing Monkeys
    .mob Teraptor Hatchlings
step
    >>收集 [|cRXP_LOOT_工具箱|r]
    .goto 174,29.73,75.42,15,0
    .goto 174,30.35,74.49,15,0
    .goto 174,30.10,72.55,20,0
    .goto 174,28.44,70.88,20,0
    .goto 174,27.32,70.14,20,0
    .complete 14014,1 --8/8 Crate of Tools
step
    #requires TheLostIslesTeraMonkeys
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克斯·雪崩|r和|cRXP_FRIENDLY_巴姆·重磅炸弹|r交谈
    .turnin 14473 >>交任务: |cRXP_FRIENDLY_收拾烂摊子|r
    .goto 174,27.85,74.29
    .turnin 14019 >>交任务: |cRXP_FRIENDLY_闯祸的猴子|r
    .goto 174,27.95,74.43
    .target Maxx Avalanche
    .target Bamm Megabomb
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sassy Handwrench|r交谈
    .goto 174,27.9,75.5
    .turnin 14014 >>交任务: |cRXP_FRIENDLY_夺回工具箱！|r
    .accept 14248 >>接任务: |cRXP_WARN_急需帮助|r
    .target Sassy Handwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 174,31.27,79.26
    .turnin 14248 >>交任务: |cRXP_FRIENDLY_急需帮助|r
    .accept 14021 >>接任务: |cRXP_WARN_矿工的麻烦|r
    .accept 14031 >>接任务: |cRXP_WARN_捕获未知的信息|r
    .target Foreman Dampwick
step
    >>使用|T134442:0|t[卡亚罗牌自动成像机]拍摄墙上标有浮动相机标记的画作
    .goto 175,55.29,68.39
    .use 49887
    .complete 14031,1 --1/1 Cave Painting 1 Captured
step
    >>使用|T134442:0|t[卡亚罗牌自动成像机]拍摄墙上标有浮动相机标记的画作
    .use 49887
    .goto 175,46.82,53.78,10,0
    .goto 175,60.44,63.52
    .complete 14031,2 --1/1 Cave Painting 2 Captured
step
    >>使用|T134442:0|t[卡亚罗牌自动成像机]拍摄墙上标有浮动相机标记的画作
    .goto 175,83.43,46.55
    .complete 14031,3 --1/1 Cave Painting 3 Captured
step
    .goto 175,51.28,19.23,10,0
    .goto 175,42.41,23.23,0,0
    >>使用|T134442:0|t[卡亚罗牌自动成像机]拍摄墙上标有浮动相机标记的画作
    .use 49887
    .complete 14031,4 --1/1 Pygmy Altar Captured
step
    >>跟随并保护被吓坏的|cRXP_FRIENDLY_矿工|r
    .complete 14021,1 --1/1 Kaja'mite Ore mining a success!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t试着和|cRXP_FRIENDLY_已死亡的兽人斥候|r交谈
    .goto 175,42.3,24.4
    .accept 14233 >>接任务: |cRXP_WARN_兽人会写字？|r
    .target Dead Orc Scout
step
    #requires TheLostIslesSnapflash4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t离开洞穴, 与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 175,55.05,79.29,10,0
    .goto 174,31.27,79.27
    .turnin 14021 >>交任务: |cRXP_FRIENDLY_矿工的麻烦|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sassy Handwrench|r交谈
    .goto 174,27.88,75.55
    .turnin 14031 >>交任务: |cRXP_FRIENDLY_捕获未知的信息|r
    .turnin 14233 >>交任务: |cRXP_FRIENDLY_兽人会写字？|r
    .accept 14234 >>接任务: |cRXP_WARN_敌人的敌人就是……|r
    .target Sassy Handwrench
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step
    #completewith next
    .goto 174,32.73,80.53,30,0
    .goto 174,34.36,80.78,30,0
    .goto 174,36.96,77.02,20 >>沿着山路向上前进
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿格娜|r交谈
    .goto 174,37.63,78.02
    .turnin 14234 >>交任务: |cRXP_FRIENDLY_敌人的敌人就是……|r
    .accept 14235 >>接任务: |cRXP_WARN_恶花谷|r
    .target Aggra
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基拉格·血牙|r交谈
    .goto 174,35.43,75.71
    .turnin 14235 >>交任务: |cRXP_FRIENDLY_恶花谷|r
    .accept 14236 >>接任务: |cRXP_WARN_除草无双|r
    .target Kilag Gorefang
step
    >>使用|cRXP_FRIENDLY_杂草清理者|r跑过|cRXP_ENEMY_植物|r杀死它们
    .use 49108
    .goto 174,33.90,72.85,30,0
    .goto 174,32.81,76.42,20,0
    .complete 14236,1 --100/100 Deadly Jungle Plants mowed down
    .mob Deadly Jungle Plant
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基拉格·血牙|r交谈
    .goto 174,35.43,75.71
    .turnin 14236 >>交任务: |cRXP_FRIENDLY_除草无双|r
    .accept 14303 >>接任务: |cRXP_WARN_向阿格娜复命|r
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿格娜|r交谈
    .goto 174,37.63,78.02
    .turnin 14303 >>交任务: |cRXP_FRIENDLY_向阿格娜复命|r
    .accept 14237 >>接任务: |cRXP_WARN_继续前进|r
    .target Aggra
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基拉格·血牙|r交谈
    .goto 174,34.62,66.85
    .turnin 14237 >>交任务: |cRXP_FRIENDLY_继续前进|r
    .accept 14238 >>接任务: |cRXP_WARN_死亡的红外光|r
    .target Kilag Gorefang
step
    >>使用|T133149:0|t[红外热成像瞄准镜]并击杀|cRXP_ENEMY_军情七处刺客|r
    .use 49611
    .goto 174,31.67,65.81
    .complete 14238,1 --10/10 SI:7 Assassin slain
    .mob SI:7 Assassin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基拉格·血牙|r交谈
    .goto 174,34.61,66.85
    .turnin 14238 >>交任务: |cRXP_FRIENDLY_死亡的红外光|r
    .accept 14240 >>接任务: |cRXP_WARN_前往峭壁|r
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斥候布拉克斯|r交谈
    .goto 174,25.28,59.84
    .turnin 14240 >>交任务: |cRXP_FRIENDLY_前往峭壁|r
    .accept 14241 >>接任务: |cRXP_WARN_旋翼机！|r
    .target Scout Brax
step
    >>击杀|cRXP_ENEMY_军情七处特工|r和|cRXP_ENEMY_旋翼机飞行员|r, 搜刮他们以获取[|cRXP_LOOT_旋翼机钥匙|r]
    .goto 174,23.23,67.50
    .complete 14241,1 --1/1 Gyrochoppa 钥匙
    .mob SI:7 Operative
    .mob Gyrochopper Pilot
step
    >>与|cRXP_FRIENDLY_旋翼机|r互动. 你可以忽略飞行员
    .goto 174,23.2,67.5
    .turnin 14241 >>交任务: |cRXP_FRIENDLY_旋翼机！|r
    .accept 14242 >>接任务: |cRXP_WARN_珍贵的货物|r
    .target Gyrochoppa
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船内, 与 |cRXP_FRIENDLY_萨尔|r 交谈
    .goto 174,11.8,62.7
    .complete 14242,1 --1/1 Precious Cargo located
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .goto 174,11.8,62.8
    .turnin 14242 >>交任务: |cRXP_FRIENDLY_珍贵的货物|r
    .accept 14326 >>接任务: |cRXP_WARN_甲板上见|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出门到甲板上与|r萨尔|r相遇
    .goto 174,12.68,63.33,10,0
    .goto 174,12.4,63.1
    .turnin 14326 >>交任务: |cRXP_FRIENDLY_甲板上见|r
    .accept 14243 >>接任务: |cRXP_WARN_酋长的复仇|r
    .target Thrall
step
    >>使用你的 |T237589:0|t[闪电打击] (1) 集中攻击小船. 否则直接击杀附近的游泳水手
    .complete 14243,1 --50/50 Alliance Sailor slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .goto 174,35.92,66.72
    .turnin 14243 >>交任务: |cRXP_FRIENDLY_酋长的复仇|r
    .accept 14445 >>接任务: |cRXP_WARN_暂时的离别|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,36.02,67.53
    .turnin 14445 >>交任务: |cRXP_FRIENDLY_暂时的离别|r
    .accept 14244 >>接任务: |cRXP_WARN_爬升，爬升，火箭分离！|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Rocket Sling|r
    .goto 174,36.34,66.55
    .skipgossip
    .complete 14244,1 --1/1 Rocket Sling Trip Survived
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 174,44.54,64.36
    .turnin 14244 >>交任务: |cRXP_FRIENDLY_爬升，爬升，火箭分离！|r
    .accept 14245 >>接任务: |cRXP_WARN_胶囊镇|r
    .target Foreman Dampwick
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Town-In-A-Box 柱塞|r
    .goto 174,45.40,65.36
    .complete 14245,1 --1/1 Town-In-A-Box Set Off!
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克|r交谈
    .goto 174,45.36,64.74
    .turnin 14245 >>交任务: |cRXP_FRIENDLY_胶囊镇|r
    .accept 27139 >>接任务: |cRXP_WARN_霍巴特需要你|r
    .target Foreman Dampwick
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .goto 174,45.34,65.22
    .turnin 27139 >>交任务: |cRXP_FRIENDLY_霍巴特需要你|r
    .accept 24671 >>接任务: |cRXP_WARN_飞翔的肉鸡|r
    .target Hobart Grapplehammer
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击城镇周围10个|cRXP_PICK_cluckers|r
#loop
	.line 174,45.64,64.12,46.45,64.90,47.03,65.75,46.28,66.40,45.39,66.82,44.55,66.91,44.52,65.61,44.67,63.90
	.goto 174,45.64,64.12,20,0
	.goto 174,46.45,64.90,20,0
	.goto 174,47.03,65.75,20,0
	.goto 174,46.28,66.40,20,0
	.goto 174,45.39,66.82,20,0
	.goto 174,44.55,66.91,20,0
	.goto 174,44.52,65.61,20,0
	.goto 174,44.67,63.90,20,0
    .complete 24671,1 --10/10 Wild Cluckers captured
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|cRXP_FRIENDLY_和|r巴姆·重磅炸弹|cRXP_FRIENDLY_交谈
    .turnin 24671 >>交任务: |cRXP_FRIENDLY_飞翔的肉鸡|r
    .goto 174,45.34,65.22
    .accept 24741 >>接任务: |cRXP_WARN_以小换大|r
    .goto 174,45.25,64.85
    .target Hobart Grapplehammer
    .target Bamm Megabomb
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step
    >>使用 |T236997:0|t[野性集群蛋] 将一枚蛋放入陷阱中. 然后等待一只 |cRXP_ENEMY_raptor|r进入陷阱, 再拾取 |cRXP_PICK_骨刺迅猛龙蛋|r
    .use 50232
    .goto 174,49.64,63.45,30,0
    .goto 174,50.25,65.80,20,0
    .goto 174,50.64,68.35,15,0
    .goto 174,47.83,69.14,20,0
    .goto 174,45.93,69.88
    .complete 24741,1 --5/5 Spiny Raptor Egg
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴姆·重磅炸弹|r和|cRXP_FRIENDLY_霍巴特·钩锤|r交谈
    .turnin 24741 >>交任务: |cRXP_FRIENDLY_以小换大|r
    .goto 174,45.25,64.85
    .accept 24744 >>接任务: |cRXP_WARN_史上第一巨蛋|r
    .goto 174,45.34,65.21
    .target Bamm Megabomb
    .target Hobart Grapplehammer
step
    >>击杀|cRXP_ENEMY_机动战鸡|r. 击杀后可拾取它的 [|cRXP_LOOT_蛋|r]
    .goto 174,44.46,54.24
    .complete 24744,1 --1/1 The Biggest Egg Ever
    .mob Mechachicken
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .goto 174,45.34,65.21
    .turnin 24744 >>交任务: |cRXP_FRIENDLY_史上第一巨蛋|r
    .accept 24816 >>接任务: |cRXP_WARN_到底谁站在食物链顶层？|r
    .target Hobart Grapplehammer
step
    >>击杀|r|cRXP_ENEMY_饥饿潜伏者|r. 从他们身上搜刮物品 [|cRXP_LOOT_parts|r]
    .goto 174,43.41,70.15,20,0
    .goto 174,42.49,63.12,20,0
    .goto 174,41.53,63.36,10,0
    .goto 174,42.6,62.7
    .complete 24816,1 --5/5 Shark Parts
    .mob Ravenous Lurker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,45.27,65.57
    .turnin 24816 >>交任务: |cRXP_FRIENDLY_到底谁站在食物链顶层？|r
    .accept 24817 >>接任务: |cRXP_WARN_披着鲨鱼皮的地精|r
    .target Assistant Greely
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Mechshark X-Steam 控制器|r
    .goto 174,43.68,65.50
    .complete 24817,1 --1/1 Use the Mechashark X-Steam Controller
step
    >>使用你的1技能和2技能击杀 |cRXP_ENEMY_巨锤|r
    .goto 174,41.7,66.7
    .complete 24817,2 --1/1 The Hammer slain
    .mob The Hammer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .goto 174,45.34,65.21
    .turnin 24817 >>交任务: |cRXP_FRIENDLY_披着鲨鱼皮的地精|r
    .accept 24856 >>接任务: |cRXP_WARN_迫在眉睫的威胁|r
    .target Hobart Grapplehammer
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅格斯·碎纸机|r 交谈
    .goto 174,52.2,73.2
    .turnin 24856 >>交任务: |cRXP_FRIENDLY_迫在眉睫的威胁|r
    .accept 24858 >>接任务: |cRXP_WARN_锈水财阀的地权主张|r
    .target Megs Dreadshredder
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“硬币”布雷特|r交谈
    .goto 174,52.20,73.22
    .accept 24859 >>接任务: |cRXP_WARN_纳迦皮|r
    .target Brett "Coins" McQuid
step
    #completewith next
    >>击杀|cRXP_ENEMY_Nagas|r的同时更换旗帜. 击败它们以获取[|cRXP_LOOT_hides|r]
    .goto 174,54.12,78.39,0,0
    .complete 24859,1 --5/5 Intact Naga Hide
step
    .goto 174,52.22,79.19,10,0
    .goto 174,52.76,78.97,10,0
    .goto 174,53.47,80.15,10,0
    .goto 174,54.14,79.91,10,0
    .goto 174,54.81,79.39,10,0
    .goto 174,55.50,79.54,10,0
    .goto 174,55.49,77.98,10,0
    .goto 174,54.86,76.94,10,0
    .goto 174,55.04,76.25,10,0
    .goto 174,53.53,76.90,10,0
    .complete 24858,1 --10/10 Naga Banners replaced
step
    >>击杀|cRXP_ENEMY_Nagas|r的同时更换旗帜. 击败它们以获取[|cRXP_LOOT_hides|r]
    .goto 174,54.27,83.49,30,0
    .goto 174,54.12,78.39,0,0
    .complete 24859,1 --5/5 Intact Naga Hide
    .mob Vashj'elan Warrior
    .mob Vashj'elan Siren
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“硬币”布雷特|r和|r梅格斯·碎纸机|r交谈
    .turnin 24859 >>交任务: |cRXP_FRIENDLY_纳迦皮|r
    .goto 174,52.2,73.22
    .turnin 24858 >>交任务: |cRXP_FRIENDLY_锈水财阀的地权主张|r
    .accept 24864 >>接任务: |cRXP_WARN_无法抗拒的池塘小马|r
    .goto 174,52.20,73.14
    .target Brett "Coins" McQuid
    .target Megs Dreadshredder
step
    #completewith next
    .use 50602
    .cast 71914 >>一旦到达水面, 请使用 |T132261:0|t[无法抗拒的池塘小马]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳迦幼崽|r交谈. |cRXP_WARN_请注意不要用范围攻击技能杀死这些幼崽|r
    .use 50602
    .goto 174,59.23,83.03
    .complete 24864,1 --12/12 Naga Hatchlings lured
    .target Naga Hatchling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯·碎纸机|r交谈
    .goto 174,52.2,73.15
    .turnin 24864 >>交任务: |cRXP_FRIENDLY_无法抗拒的池塘小马|r
    .accept 24868 >>接任务: |cRXP_WARN_和谈的希望|r
    .target Megs Dreadshredder
step
    >>|cRXP_WARN_当你看到生成动画(紫色圆圈)时, 就可以返回了. 请继续留意身后的敌人, 因为你还需要击败|cRXP_ENEMY_首领|r|r
    .goto 174,54.07,90.06,1,0
    .goto 174,53.90,84.17
    .complete 24868,1 --1/1 Leader of the naga dealt with
    .mob Faceless of the Deep
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_梅格斯·碎纸机|r 交谈
    .goto 174,52.20,73.15
    .turnin 24868 >>交任务: |cRXP_FRIENDLY_和谈的希望|r
    .accept 24897 >>接任务: |cRXP_WARN_返回胶囊镇|r
    .target Megs Dreadshredder
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,45.18,64.91
    .turnin 24897 >>交任务: |cRXP_FRIENDLY_返回胶囊镇|r
    .accept 24901 >>接任务: |cRXP_WARN_胶囊镇：遭到攻击|r
    .target Sassy Hardwrench
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击一个|cRXP_PICK_B.C.消除者|r进入并射击|cRXP_ENEMY_乌姆洛特战士|r
    .goto 174,45.7,65.0
    .complete 24901,1 --30/30 Oomlot Warriors defeated
step
    #completewith next
    +|cRXP_WARN_离开载具|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,45.2,64.9
    .turnin 24901 >>交任务: |cRXP_FRIENDLY_胶囊镇：遭到攻击|r
    .accept 24924 >>接任务: |cRXP_WARN_乌姆洛特村|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小静|r交谈
    .goto 174,56.56,71.96
    .turnin 24924 >>交任务: |cRXP_FRIENDLY_乌姆洛特村|r
    .accept 24925 >>接任务: |cRXP_WARN_营救俘虏|r
    .accept 24929 >>接任务: |cRXP_WARN_传递信息|r
    .target Izzy
step
    #completewith next
    >>击杀|cRXP_ENEMY_乌姆洛特萨满祭司|r以解救地精
    .goto 174,59.16,70.39,0,0
    .complete 24925,1 --5/5 Goblin Captives freed
    .mob Oomlot Shaman
step
    >>击杀|cRXP_ENEMY_英格维|r
    .goto 174,59.20,67.32,15,0
    .goto 174,62.91,68.54
    .complete 24929,1 --1/1 Yngwie slain
    .mob Yngwie
step
    >>击杀|cRXP_ENEMY_乌姆洛特萨满祭司|r以解救地精
    .goto 174,59.16,70.39
    .complete 24925,1 --5/5 Goblin Captives freed
    .mob Oomlot Shaman
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小静|r交谈
    .goto 174,56.56,71.96
    .turnin 24925 >>交任务: |cRXP_FRIENDLY_营救俘虏|r
    .turnin 24929 >>交任务: |cRXP_FRIENDLY_传递信息|r
    .accept 24937 >>接任务: |cRXP_WARN_危机解除|r
    .target Izzy
step
    #completewith next
    .hs >>传送至盒中镇
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,45.2,64.9
    .turnin 24937 >>交任务: |cRXP_FRIENDLY_危机解除|r
    .accept 24940 >>接任务: |cRXP_WARN_前往火山口|r
    .target Sassy Hardwrench
step
    #completewith next
    .cast 202844 >>使用你的 |T1405809:0|t[枪鞋] 以提升移动速度
    .use 132516
    .itemcount 132516,1
step
    #completewith next
    +|cRXP_WARN_在上山时避开|r|cRXP_ENEMY_地精僵尸|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r和|cRXP_FRIENDLY_工头戴姆维克|r和|cRXP_FRIENDLY_助手格瑞里|r交谈
    .turnin 24940 >>交任务: |cRXP_FRIENDLY_前往火山口|r
    .accept 24942 >>接任务: |cRXP_WARN_僵尸大战超级火箭靴|r
    .goto 174,51.8,47.1
    .accept 24945 >>接任务: |cRXP_WARN_三个小俾格米人|r
    .goto 174,51.85,47.19
    .accept 24946 >>接任务: |cRXP_WARN_摇滚粉末|r
    .goto 174,51.73,47.38
    .target Coach Crosscheck
    .target Foreman Dampwick
    .target Assistant Greely
step
    #completewith next
    >>|cRXP_WARN_如果你是暗影牧师, 在使用这双靴子之前必须先取消暗影形态|r <<Priest
    .use 52013
    .goto 174,51.77,46.97
    .cast 72891 >>|cRXP_WARN_使用 |T133029:0|t[超级助推火箭靴]|r
step
    #completewith next
    >>用火箭靴踩过地精僵尸即可将其击杀
    >>|cRXP_WARN_避免|cRXP_ENEMY_乌司坦猎头者|r|r. 他们很容易就能秒杀你
    .use 52013
    .complete 24942,1 --50/50 Goblin Zombies slain
step
    #completewith TheLostIslesGaahl
    >>从地上拾取|cRXP_PICK_摇滚粉末|r
    .complete 24946,1 --5/5 Rockin' Powder
step
    >>击杀|cRXP_ENEMY_马奥默|r
    .goto 174,58.74,47.16
    .complete 24945,2 --1/1 Malmo slain
    .mob Malmo
step
    >>击杀|cRXP_ENEMY_塔卢可|r
    .goto 174,63.7,52.76
    .complete 24945,3 --1/1 Teloch slain
    .mob Teloch
step
    #label TheLostIslesGaahl
    >>击杀|cRXP_ENEMY_加奥
    .goto 174,59.59,40.20
    .complete 24945,1 --1/1 Gaahl slain
    .mob Gaahl
step
    >>环顾四周, 拾取剩余的|cRXP_PICK_摇滚粉末|r
    .goto 174,58.8,40.5
    .complete 24946,1 --5/5 Rockin' Powder
step
    >>用火箭靴踩过地精僵尸即可将其击杀
    .use 52013
    .goto 174,56.67,44.26,15,0
    .complete 24942,1 --50/50 Goblin Zombies slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头戴姆维克和助理格里迪以及克罗斯彻克教练|r交谈
    .turnin 24945 >>交任务: |cRXP_FRIENDLY_三个小俾格米人|r
    .goto 174,51.85,47.20
    .turnin 24946 >>交任务: |cRXP_FRIENDLY_摇滚粉末|r
    .goto 174,51.73,47.38
    .turnin 24942 >>交任务: |cRXP_FRIENDLY_僵尸大战超级火箭靴|r
    .accept 24952 >>接任务: |cRXP_WARN_火箭靴的威力|r
    .goto 174,51.8,47.1
    .target Foreman Dampwick
    .target Assistant Greedy
    .target Coach Crosscheck
step
    >>使用 |T133029:0|t[摇滚粉末强化火箭靴]
    .use 52032
    .complete 24952,1 --1/1 Rockin' Powder Infused Rocket Boots used
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .goto 174,68.93,46.44
    .turnin 24952 >>交任务: |cRXP_FRIENDLY_火箭靴的威力|r
    .accept 24954 >>接任务: |cRXP_WARN_龟神的子嗣|r
    .target Hobart Grapplehammer
step
    >>击杀|cRXP_ENEMY_沃卡罗斯之子|r. 击败他们后搜刮 [|cRXP_LOOT_腺体|r]
    .goto 174,66.92,44.29,20,0
    .goto 174,68.64,43.40
    .complete 24954,1 --5/5 Fire Gland
    .mob Childs of Volcanoth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .goto 174,68.93,46.44
    .turnin 24954 >>交任务: |cRXP_FRIENDLY_龟神的子嗣|r
    .accept 24958 >>接任务: |cRXP_WARN_沃卡洛斯！|r
    .target Hobart Grapplehammer
step
    >>使用 |T135624:0|t[地精火箭筒] 在|cRXP_ENEMY_沃卡洛斯|r的路径点位置
    .use 52043
    .goto 176,55.55,33.93
    .complete 24958,1 --1/1 Volcanoth slain
    .mob Volcanoth
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 176,62.99,49.87
    .turnin 24958 >>交任务: |cRXP_FRIENDLY_沃卡洛斯！|r
    .accept 25023 >>接任务: |cRXP_WARN_老朋友|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r和|r莎希·硬钳|r和|r阿格娜|r交谈
    .turnin 25023 >>交任务: |cRXP_FRIENDLY_老朋友|r
    .accept 25024 >>接任务: |cRXP_WARN_击退伞兵|r
    .goto 174,36.79,43.14
    .accept 25058 >>接任务: |cRXP_WARN_以地精的方式拆除地雷|r
    .goto 174,37.35,41.91
    .accept 25093 >>接任务: |cRXP_WARN_军情七处的头目们|r
    .goto 174,36.26,43.36
    .target Thrall
    .target Sassy Hardwrench
    .target Aggra
step
    #sticky
    #label TheLostIslesLandMines
    >>使用 |T133716:0|t[一袋手榴弹]摧毁地雷
    .goto 174,32.38,36.34,0,0
    .use 52280
    .complete 25058,1 --10/10 Land Mines detonated
step
    #completewith TheLostIslesCyn
    >>击杀|cRXP_ENEMY_联盟伞兵|r
    .complete 25024,1 --10/10 Alliance Paratrooper slain
    .mob Alliance Paratrooper
step
    >>击杀指挥官亚林登. 从他身上搜刮他的 [头颅]
    .goto 174,32.29,42.89
    .complete 25093,1 --1/1 Commander Arrington's Head
    .target Commander Arrington
step
    >>击杀|cRXP_ENEMY_阿莱克西·默嚎|r. 从他身上搜刮 [|cRXP_LOOT_head|r]
    .goto 174,30.80,33.92
    .complete 25093,3 --1/1 Alexi Silenthowl's Head
    .mob Alexi Silenthowl
step
    #label TheLostIslesCyn
    >>击杀|r|cRXP_ENEMY_黑刃希恩|r. 从他身上搜刮他的 [|cRXP_LOOT_head|r]
    .goto 174,33.44,27.88
    .complete 25093,2 --1/1 Darkblade Cyn's Head
    .mob Darkblade Cyn
step
    >>击杀|cRXP_ENEMY_联盟伞兵|r
    .goto 174,32.38,36.34
    .complete 25024,1 --10/10 Alliance Paratrooper slain
    .mob Alliance Paratrooper
step
    #requires TheLostIslesLandMines
    #completewith next
    .cooldown item,6948,<1,1
    .hs >>传送至酋长的瞭望台
step
    #requires TheLostIslesLandMines
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r和|cRXP_FRIENDLY_阿格娜|r和|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .turnin 25024 >>交任务: |cRXP_FRIENDLY_击退伞兵|r
    .goto 174,36.8,43.1
    .turnin 25093 >>交任务: |cRXP_FRIENDLY_军情七处的头目们|r
    .goto 174,36.26,43.37
    .turnin 25058 >>交任务: |cRXP_FRIENDLY_以地精的方式拆除地雷|r
    .accept 25066 >>接任务: |cRXP_WARN_科赞的骄傲|r
    .goto 174,37.35,41.91
    .target Thrall
    .target Aggra
    .target Sassy Hardwrench
step
    #completewith next
    .skipgossip 38387,1
    .vehicle 39074 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈以登上载具
    .target Sassy Hardwrench
step
    >>在冷却结束后使用 |T134273:0|t[野鼬火箭] (2)
    >>否则 spam |T135627:0|t[机枪] (1)
    .goto 174,30.37,39.89
    .complete 25066,1 --10/10 Gnomeregan Stealth Fighters shot down
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t飞回并与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,37.36,41.92
    .turnin 25066 >>交任务: |cRXP_FRIENDLY_科赞的骄傲|r
    .accept 25098 >>接任务: |cRXP_WARN_觐见酋长|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .goto 174,36.79,43.13
    .turnin 25098 >>交任务: |cRXP_FRIENDLY_觐见酋长|r
    .accept 25099 >>接任务: |cRXP_WARN_借巴斯蒂亚一用|r
    .target Thrall
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基拉格·血牙|r交谈
    .goto 174,33.8,38.8
    .turnin 25099 >>交任务: |cRXP_FRIENDLY_借巴斯蒂亚一用|r
    .accept 25100 >>接任务: |cRXP_WARN_奔跑吧|r
    .timer 87,Panther Ride
    .target Kilag Gorefang
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在与黑豹一起骑行后, 与|cRXP_FRIENDLY_史莉琪·剃刀|r交谈
    .goto 174,53.71,34.94
    .turnin 25100 >>交任务: |cRXP_FRIENDLY_奔跑吧|r
    .accept 25109 >>接任务: |cRXP_WARN_加里维克斯劳工矿井|r
    .target Slinky Sharpshiv
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入洞穴, 跳下去并与 |cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,54.09,36.01,10,0
    .goto 174,54.94,33.72,10,0
    .goto 174,53.17,36.55
    .turnin 25109 >>交任务: |cRXP_FRIENDLY_加里维克斯劳工矿井|r
    .accept 25110 >>接任务: |cRXP_WARN_卡亚可乐，给你灵感！(注册商标)|r
    .target Assistant Greely
step
    >>从地上拾取一个|cRXP_PICK_卡亚可乐 Zero-One|r
    .goto 174,53.59,37.41,10,0
    .goto 174,53.94,37.46,10,0
    .goto 174,53.70,36.67
    .complete 25110,1 --1/1 Kaja'Cola Zero-One
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,53.17,36.55
    .turnin 25110 >>交任务: |cRXP_FRIENDLY_卡亚可乐，给你灵感！(注册商标)|r
    .accept 25122 >>接任务: |cRXP_WARN_重振士气|r
    .accept 25123 >>接任务: |cRXP_WARN_摧毁灵魂石！|r
    .target Assistant Greely
step
    #sticky
    >>你需要收集总共9瓶卡亚可乐零一号
    >>瞄准|cRXP_FRIENDLY_科赞公民|r并使用可乐
    .use 52484
    .collect 52484,9,25122,0xF
    .complete 25122,4 --6/6 Other goblin's minds freed
    .target Kezan Citizen
step
    #title Free Ace
    >>目标|cRXP_FRIENDLY_王牌|r并使用卡亚可乐Zero-One
    .goto 174,57.1,36.9
    .use 52484
    .complete 25122,1 --1/1 Ace's mind freed
    .target Ace
step
    #title Free Izzy
    >>目标|cRXP_FRIENDLY_小静|r, 并使用卡亚可乐零号
    .goto 174,57.01,35.02
    .use 52484
    .complete 25122,2 --1/1 Izzy's mind freed
    .target Izzy
step
    >>击杀|cRXP_ENEMY_残酷主人“裂影”|r并拾取飘落的紫色|cRXP_PICK_初级灵魂石|r. 瞄准|cRXP_ENEMY_残酷主人“裂影”|r的尸体并使用 |T134336:0|t[初级灵魂石]
    .use 52481
    .goto 174,56.18,32.29
    .complete 25123,1 --1/1 Blastshadow's Soulstone destroyed
    .mob Blastshadow the Brutemaster
step
    #title Free Gobber
    >>目标|cRXP_FRIENDLY_大胖|r并使用卡亚可乐零号
    .goto 174,57.04,32.17
    .use 52484
    .complete 25122,3 --1/1 Gobber's mind freed
    .target Gobber
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .turnin 25123 >>交任务: |cRXP_FRIENDLY_摧毁灵魂石！|r
    .turnin 25122 >>交任务: |cRXP_FRIENDLY_重振士气|r
    .accept 25125 >>接任务: |cRXP_WARN_矿道尽头的亮光|r
    .target Assistant Greely
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与|cRXP_PICK_采矿车|r互动
    .goto 174,56.29,27.33
    .turnin 25125 >>交任务: |cRXP_FRIENDLY_矿道尽头的亮光|r
    .accept 25184 >>接任务: |cRXP_WARN_乘坐采矿车|r
step
    >>乘坐采矿车
    .goto 174,54.2,17.0
    .complete 25184,1 --1/1 Mine Cart ridden
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,54.4,16.9
    .turnin 25184 >>交任务: |cRXP_FRIENDLY_乘坐采矿车|r
    .accept 25200 >>接任务: |cRXP_WARN_清理伐木机|r
    .target Assistant Greely
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r交谈
    .goto 174,54.44,16.93
    .accept 25201 >>接任务: |cRXP_WARN_终极足球炸弹制服|r
    .target Coach Crosscheck
step
    #sticky
    #label TheLostIslesShredderShutdown
    >>击杀|cRXP_ENEMY_热砂港大鲨鱼队队员|r
    .goto 174,53.5,18.9,0,0
    .complete 25200,1 --8/8 Steamwheedle Shark slain
    .mob Steamwheedle Shark
step
    >>拾取 [|cRXP_LOOT_备用伐木机零件|r]
    .goto 174,53.24,19.55,20,0
    .goto 174,52.16,20.68,20,0
    .goto 174,51.85,19.17,20,0
    .goto 174,52.64,16.93,20,0
    .goto 174,53.13,18.70
    .complete 25201,1 --8/8 Spare Shredder Parts
step
    #requires TheLostIslesShredderShutdown
    #completewith next
    .goto 174,54.47,17.16
    .vendor
step
    #requires TheLostIslesShredderShutdown
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Coach 克罗斯彻克教练|r交谈
    .goto 174,54.44,16.93
    .turnin 25201 >>交任务: |cRXP_FRIENDLY_终极足球炸弹制服|r
    .target Coach Crosscheck
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,54.4,16.93
    .turnin 25200 >>交任务: |cRXP_FRIENDLY_清理伐木机|r
    .accept 25204 >>接任务: |cRXP_WARN_打开阀门|r
    .target Assistant Greely
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王牌|r交谈
    .goto 174,54.16,17.21
    .accept 25203 >>接任务: |cRXP_WARN_奇普是什么鬼名字？|r
    .target Ace
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小静|r交谈
    .goto 174,54.01,16.98
    .accept 25202 >>接任务: |cRXP_WARN_通往他的内心的捷径|r
    .target Izzy
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.85,15.86,10,0
    .goto 174,50.72,13.81
    .complete 25204,1 --1/1 Valve #1 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.5,13.2
    .complete 25204,3 --1/1 Valve #3 released
step << Female
    >>击杀|cRXP_ENEMY_奇普·英代尔|r. 击败他后搜刮 [|cRXP_LOOT_heart|r]
    .goto 174,50.1,13.8
    .complete 25202,1 --1/1 Still-Beating Heart
    .mob Chip Endale
step << Male
    >>击杀|cRXP_ENEMY_奇普·英代尔|r. 击败他后搜刮 [|cRXP_LOOT_heart|r]
    .goto 174,50.1,13.8
    .complete 25203,1 --1/1 Still-Beating Heart
    .mob Chip Endale
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,49.9,12.8
    .complete 25204,4 --1/1 Valve #4 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_valve|r
    .goto 174,50.2,11.8
    .complete 25204,2 --1/1 Valve #2 released
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t与|cRXP_PICK_Platform Control Panel|r互动
    .goto 174,51.4,13.1
    .turnin 25204 >>交任务: |cRXP_FRIENDLY_打开阀门|r
    .accept 25207 >>接任务: |cRXP_WARN_再见，甜蜜的油井|r
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Red Button|r
    .goto 174,51.4,13.1
    .complete 25207,1 --1/1 KTC Oil Platform destroyed
step << Male
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_王牌|r交谈
    .goto 174,54.16,17.19
    .turnin 25203 >>交任务: |cRXP_FRIENDLY_奇普是什么鬼名字？|r
    .target Ace
step << Female
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_小静|r交谈
    .goto 174,54.01,16.97
    .turnin 25202 >>交任务: |cRXP_FRIENDLY_通往他的内心的捷径|r
    .target Izzy
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手格瑞里|r交谈
    .goto 174,54.4,16.9
    .turnin 25207 >>交任务: |cRXP_FRIENDLY_再见，甜蜜的油井|r
    .accept 25213 >>接任务: |cRXP_WARN_奴隶营|r
    .timer 24,Shredder Ride
    .target Assistant Greely
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈, 条件是在乘坐碎纸机之后
    .goto 174,43.63,25.32
    .turnin 25213 >>交任务: |cRXP_FRIENDLY_奴隶营|r
    .accept 25244 >>接任务: |cRXP_WARN_小甜甜是什么鬼名字？|r << Female
	.accept 25243 >>接任务: |cRXP_WARN_她爱我，她不爱我！|r << Male
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|hobart|r交谈
    .goto 174,43.85,25.30
    .accept 25214 >>接任务: |cRXP_WARN_极速逃逸|r
    .target Hobart
step
    #completewith next
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_被俘的地精|r
    .complete 25214,1 --8/8 Cages launched
    .target Captured Goblin
step
    >>击杀 |cRXP_ENEMY_小甜甜|r
    .goto 174,39.68,27.18
    .complete 25244,1 << Female --1/1 Candy Cane slain
	.complete 25243,1 << Male --1/1 Candy Cane slain
    .mob Candy Cane
step
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_FRIENDLY_被俘的地精|r
    .goto 174,40.03,26.08,10,0
    .goto 174,41.03,25.24,15,0
    .goto 174,41.24,26.35
    .complete 25214,1 --8/8 Cages launched
    .target Captured Goblin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r和|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .turnin 25214 >>交任务: |cRXP_FRIENDLY_极速逃逸|r
    .goto 174,43.85,25.29
    .turnin 25244 >>交任务: |cRXP_FRIENDLY_小甜甜是什么鬼名字？|r << Female
	.turnin 25243 >>交任务: |cRXP_FRIENDLY_她爱我，她不爱我！|r << Male
    .accept 25251 >>接任务: |cRXP_WARN_最后的对峙|r
    .goto 174,43.63,25.32
    .target Hobart Grapplehammer
    .target Sassy Hardwrench
step
    >>进入|cRXP_PICK_终极足球炸弹制服|r
    .goto 174,43.86,25.16
    .complete 25251,1 --1/1 Ultimate Footbomb Uniform
step
    >>目标|cRXP_ENEMY_贸易大王加里维克斯|r, 对所有目标使用你的技能(保持技能循环)
    .goto 174,41.87,17.61,10,0
    .goto 174,43.4,19.9
    .complete 25251,2 --1/1 Trade Prince Gallywix dealt with
    .mob Trade Prince Gallywix
step
    #completewith next
    .goto 174,42.76,18.61,10,0
    .goto 174,42.24,19.45,20 >>跳下去
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .goto 174,43.6,25.3
    .turnin 25251 >>交任务: |cRXP_FRIENDLY_最后的对峙|r
    .accept 25265 >>接任务: |cRXP_WARN_胜利！|r
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .goto 174,42.16,17.37
    .turnin 25265 >>交任务: |cRXP_FRIENDLY_胜利！|r
    .accept 25266 >>接任务: |cRXP_WARN_酋长的大使|r
    .target Thrall
step
    #completewith next
    .goto 174,42.57,16.37
    .skipgossip
    .zone 1 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莎希·硬钳|r交谈
    .target Sassy Hardwrench
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗之矛部落忠诚者|r交谈
    .goto 1,57.65,9.78
    .turnin 25266 >>交任务: |cRXP_FRIENDLY_酋长的大使|r
    .accept 25267 >>接任务: |cRXP_WARN_给加尔鲁什的消息|r
    .target Darkspear Loyalist
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔法恩|r交谈
    .goto 85,48.5,70.8
    .turnin 25267 >>交任务: |cRXP_FRIENDLY_给加尔鲁什的消息|r
    .target Saurfang
]])

--HighmountainTauren Highmountain
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 高山牛头人
#displayname |cFF00CCFF1|r - 至高岭 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next

<< HighmountainTauren !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mayla Highmountain|r交谈
--     .goto 652,54.85,63.18
--     .accept 49773 >>接任务: |cRXP_WARN_为了部落！|r
--     .target Mayla Highmountain
-- step
--     #completewith next
--     .goto 652,46.02,63.78
--     .zone 85 >>前往奥格瑞玛的传送门
-- step 
--     .goto 85,39.40,79.54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
--     .turnin 49773 >>交任务: |cRXP_FRIENDLY_为了部落！|r
--     .target Ambassador Blackguard
-- step 
--     .goto 85,40.834,80.155
--     >>与|cRXP_FRIENDLY_克罗米|r交谈
--     .complete 50319,1 << HighmountainTauren --与克罗米交谈 (1)
--     .target Chromie
-- step
--     .goto 85,40.777,80.404
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈里安·沙拉瓦克|r交谈
--     .turnin 50319 >>交任务: |cRXP_FRIENDLY_异乡异客|r 
--     .target Halian Shlavahawk 
]])

--夜之子 The Nighthold
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 夜之子简介
#displayname |cFF00CCFF1|r - 暗夜要塞 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next

<< 夜之子 !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首座法师塔莉萨斯|r交谈
--     .goto 680,59.34,85.53
--     .accept 49933 >>接任务: |cRXP_WARN_为了部落！|r
--     .target First Arcanist Thalyssra
-- step
--     #completewith next
--     .goto 680,58.18,87.32
--     .zone 85 >>前往奥格瑞玛的传送门
-- step
--     .goto 85,39.40,79.54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
--     .turnin 49933 >>交任务: |cRXP_FRIENDLY_为了部落！|r << 夜之子
--     .target Ambassador Blackguard
-- step
--     .goto 85,40.834,80.155
--     >>与|cRXP_FRIENDLY_克罗米|r交谈
--     .target Chromie
-- step
--     .goto 85,40.777,80.404
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melitier Vahlouran|r交谈
--     .turnin 50303 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Melitier Vahlouran 
]])

--ZandalariTroll Dazar'alor
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 赞达拉巨魔介绍
#displayname |cFF00CCFF1|r - 达萨罗 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next

<< ZandalariTroll !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女王塔兰吉(Queen Talanji)|r交谈
--     .goto 1165,49.93,46.64
--     .accept 55137 >>接任务: |cRXP_WARN_为了部落！|r
--     .target Queen Talanji
-- step
--     #completewith next
--     .goto 1165,49.94,43.85
--     .zone 85 >>前往: |cRXP_PICK_杜隆塔尔|r
-- step
--     .goto 85,39.40,79.54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
--     .turnin 55137 >>交任务: |cRXP_FRIENDLY_为了部落！|r
--     .target Ambassador Blackguard
-- step
--     .goto 85,40.834,80.155
--     >>与|cRXP_FRIENDLY_克罗米|r交谈
--     .complete 55138,1 --与克罗米交谈 (1)
--     .target Chromie
-- step
--     .goto 85,40.777,80.404
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Natal'hakata|r交谈 << ZandalariTroll
--     .turnin 55138 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Natal'hakata
]])

--MagharOrc Orgrimmar
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 马格哈尔兽人介绍
#displayname |cFF00CCFF1|r - 奥格瑞玛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next

<< MagharOrc !DK

step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 85,70.6,44.6
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_势力首领Geya'rah|r交谈
--     .accept 51485 >>接任务: |cRXP_WARN_为了部落！|r
--     .target Overlord Geya'rah
-- step
--     .goto 85,39.40,79.54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
--     .turnin 51485 >>交任务: |cRXP_FRIENDLY_为了部落！|r
--     .accept 53502 >>接任务: |cRXP_WARN_异乡异客|r
--     .target Ambassador Blackguard
-- step
--     .goto 85,40.834,80.155
--     >>与|cRXP_FRIENDLY_克罗米|r交谈
--     .complete 53502,1 --与克罗米交谈 (1)
--     .target Chromie
-- step
--     .goto 85,40.777,80.404
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Limbflayer Lasha|r交谈
--     .turnin 53502 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Limbflayer Lasha 
]])

--Vulpera Orgrimmar
RXPGuides.RegisterGuide([[
#retail
#version 2
#group RestedXP 快速升级
#subgroup |cFFFCDC00(1-80)|r默认值
#name a) 狼人族介绍
#displayname |cFF00CCFF1|r - 奥格瑞玛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

<< Vulpera !DK
 
step
    .cast 205456 >>使用 |T134309:0|t[失落的龙鳞]
    .use 205456
-- step
--     .goto 85,64.647,46.514
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nilsa|r交谈
--     .accept 58122 >>接任务: |cRXP_WARN_为了部落！|r
--     .target Nilsa
-- step
--     .goto 85,39.40,79.54
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阵营大使黑色卫士|r交谈
--     .turnin 58122 >>交任务: |cRXP_FRIENDLY_为了部落！|r
--     .accept 58124 >>接任务: |cRXP_WARN_异乡异客|r 
--     .target Ambassador Blackguard
-- step
--     .goto 85,40.834,80.155
--     >>与|cRXP_FRIENDLY_克罗米|r交谈
--     .complete 58124,1 --与克罗米交谈 (1)
--     .target Chromie
-- step
--     .goto 85,40.777,80.404
--     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Nilsa|r交谈
--     .turnin 58124 >>交任务: |cRXP_FRIENDLY_异乡异客|r
--     .target Nilsa 
]])