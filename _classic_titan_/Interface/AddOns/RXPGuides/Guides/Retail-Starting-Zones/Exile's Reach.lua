RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#name 1零售_流放之境
#displayname Exile's Reach
#next RestedXP 联盟 10-60\\1A_艾尔文森林 << Alliance
#next RestedXP 部落 10-60\\1 BfA 简介 << Horde

<< !DemonHunter !DK !Kultiran !DarkIronDwarf !LightforgedDraenei !机械侏儒 !VoidElf !NightBorne !HighmountainTauren !Vulpera !MagharOrc !ZandalariTroll

step << Alliance/Horde
	#completewith next
    +欢迎阅读 RestedXP Exile's Reach 指南！本指南既适合初学者，也是最快的入门指南。
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r in front of you
	.accept 56775 >>接任务: |cRXP_WARN_热身|r
	.target Captain Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
	.accept 59926 >>接任务: |cRXP_WARN_热身|r
	.target Warlord Breka Grimaxe
step
    >>使用动作栏上的咒语杀死 |cRXP_ENEMY_Combat Dummy|r （最好是离你最近的）
    .complete 56775,1 << Alliance
    .complete 59926,1 << Horde
    .mob Combat Dummy
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
	.turnin 56775 >>交任务: |cRXP_FRIENDLY_热身|r
	.target Captain Garrick
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
	.turnin 59926 >>交任务: |cRXP_FRIENDLY_热身|r
	.target Warlord Breka Grimaxe
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库勒曼·法席恩|r
	.accept 58209 >>接任务: |cRXP_WARN_坚守阵地|r
	.target Private Cole
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Throg|r
	.accept 59927 >>接任务: |cRXP_WARN_坚守阵地|r
	.target Grunt Throg
step << Alliance
    >>杀死 |cRXP_ENEMY_Cole|r
	.complete 58209,1 --1/1 Spar with Private Cole
	.mob Private Cole
step << Horde
	>>杀死 |cRXP_ENEMY_Throg|r
	.complete 59927,1 --1/1 Spar with Grunt Throg
	.mob Grunt Throg
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库勒曼·法席恩|r
    .turnin 58209 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
	.accept 58208 >>接任务: |cRXP_WARN_抵御冲击|r
	.timer 13,Brace for Impact RP
	.target Private Cole
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Throg|r
    .turnin 59927 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
    .accept 59928 >>接任务: |cRXP_WARN_抵御冲击|r
	.timer 13,Brace for Impact RP
	.target Grunt Throg
step << Alliance
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r inside the ship
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
	.turnin 58208 >>交任务: |cRXP_FRIENDLY_抵御冲击|r
	.target Captain Garrick
step << Horde
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .turnin 59928 >>交任务: |cRXP_FRIENDLY_抵御冲击|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,61.88,82.89
    >>|cRXP_WARN_如果你没有在屏幕顶部中间看到航点箭头，请输入 /reload|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .accept 55122 >>接任务: |cRXP_WARN_鱼人狂欢|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|cRXP_WARN_如果你没有在屏幕顶部中间看到航点箭头，请输入 /reload|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
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
    >>杀死 |cRXP_ENEMY_Murloc Spearhunters|r 和 |cRXP_ENEMY_Watershapers|r。掠夺他们的 |cRXP_LOOT_First Aid Kits|r
    .complete 55122,1 << Alliance   --6/6 First Aid Kits recovered from defeated Murlocs
    .complete 59929,1 << Horde      --6/6 First Aid Kits recovered from defeated Murlocs
    .mob Murloc Spearhunter
    .mob Murloc Watershaper
step << Alliance
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 55122 >>交任务: |cRXP_FRIENDLY_鱼人狂欢|r
    .accept 54951 >>接任务: |cRXP_WARN_紧急治疗|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59929 >>交任务: |cRXP_FRIENDLY_鱼人狂欢|r
    .accept 59930 >>接任务: |cRXP_WARN_紧急治疗|r
	.target Warlord Breka Grimaxe
step
    #completewith next
    +|cRXP_WARN_如果您想充分利用 RXP；请按 Escape -> 选项 -> 键绑定 -> RestedXP 指南 -> 选择并绑定活动按钮 1、2、3 和 4。您也可以使用目标执行此操作|r
    >>|cRXP_WARN_这将允许你按下按键来使用任务物品/Target 相关的怪物|r
step << Alliance
	>>对周围地面上的 |cRXP_FRIENDLY_Kee-La|r、|cRXP_FRIENDLY_Austin|r 和 |cRXP_FRIENDLY_Bjorn|r 使用 |T1387611:0|t[急救箱]
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
	>>对周围地面上的 |cRXP_FRIENDLY_Bo|r、|cRXP_FRIENDLY_Mithdran|r 和 |cRXP_FRIENDLY_Lana|r 使用 |T1387611:0|t[急救箱]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 54951 >>交任务: |cRXP_FRIENDLY_紧急治疗|r
    .accept 54952 >>接任务: |cRXP_WARN_寻找失踪的考察队|r
	.target Captain Garrick
step << Horde
    .goto 1409,61.88,82.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59930 >>交任务: |cRXP_FRIENDLY_紧急治疗|r
    .accept 59931 >>接任务: |cRXP_WARN_寻找失踪的考察队|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,58.36,74.47
    >>前往 |cRXP_FRIENDLY_Alaria|r
    .complete 54952,1 --1/1 Travel north to find any expedition survivors
step << Horde
    .goto 1409,58.36,74.47
    >>前往 |cRXP_FRIENDLY_Won'sa|r
    .complete 59931,1 --1/1 Travel north to find any expedition survivors
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alaria|r and |cRXP_FRIENDLY_Garrick|r
    .turnin 54952 >>交任务: |cRXP_FRIENDLY_寻找失踪的考察队|r
    .goto 1409,58.36,74.47
    .accept 55174 >>接任务: |cRXP_WARN_烹调肉食|r
    .goto 1409,58.37,74.63
	.target Alaria
	.target Captain Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Won'sa, |cRXP_FRIENDLY_布蕾卡·狼女|r
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
    >>杀死 |cRXP_ENEMY_Coastal Albatrosses|r、|cRXP_ENEMY_Coastal Goats|r 和 |cRXP_ENEMY_Prickly Porcupines|r。掠夺它们的 |cRXP_LOOT_Meat|r
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
    >>杀死 |cRXP_ENEMY_Coastal Albatrosses|r、|cRXP_ENEMY_Coastal Goats|r 和 |cRXP_ENEMY_Prickly Porcupines|r。掠夺它们的 |cRXP_LOOT_Meat|r
    .complete 55174,1 << Alliance --5/5 Raw Meat collected from wildlife
    .complete 59932,1 << Horde --5/5 Raw Meat collected from wildlife
	.mob Coastal Albatross
	.mob Coastal Goat
	.mob Pricky Porcupine
step
    .goto 1409,58.33,74.58
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击地面上的 |cRXP_PICK_Campfire|r
    .complete 55174,2 << Alliance --1/1 Cook the meat on the campfire
    .complete 59932,2 << Horde --1/1 Cook the meat on the campfire
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alaria|r and |cRXP_FRIENDLY_Garrick|r << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Alaria|r << Hunter
    .turnin 55174 >>交任务: |cRXP_FRIENDLY_烹调肉食|r
    .accept 55173 >>接任务: |cRXP_WARN_向北而行|r << Hunter
    .goto 1409,58.36,74.47
    .accept 59339 >>接任务: |cRXP_WARN_强化战斗技巧|r << Monk
    .accept 59254 >>接任务: |cRXP_WARN_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.38,74.63
	.target Alaria
	.target Captain Garrick << !Hunter
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Won'sa, |cRXP_FRIENDLY_布蕾卡·狼女|r << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Won'sa|r << Hunter
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
    >>跟随 |cRXP_FRIENDLY_Garrick|r。一旦 |cRXP_ENEMY_Garrick|r 转为敌对，就攻击她
    >>施放 |T136207:0|t暗言术：痛。在减益效果消失前再施放 3 次 << Priest
    >>对 |cRXP_ENEMY_Garrick|r 施放 |T132337:0|tCharge 3 次 << Warrior
    >>当 |cRXP_ENEMY_Garrick|r 提示你时，对她施放 |T136096:0|tMoonfire  << Druid
    >>在一定范围内施放 |T135846:0|tFrostbolt，然后在近战范围内施放 |T135807:0|tFire Blast -> 重复 << Mage
    >>在一定范围内施放 |T136048:0|t闪电箭，然后施放 |T460956:0|t原始打击 4 次 -> 重复 << Shaman
    >>施放 |T135891:0|t十字军打击 3 次以建立 3 点神圣能量，然后施放 |T236265:0|t正义之盾 -> 重复 << Paladin
    .complete 59339,2 << Monk --3/3 Blackout Kick used on Captain Garrick
    .complete 59339,1 << Monk --6/6 Tiger Palm used on Captain Garrick
    .complete 59254,1 << !Hunter !Monk --3/3 Abilities proven against Captain Garrick
	.mob Captain Garrick
step << Horde !Hunter
    .goto 1409,57.60,72.95 << !Monk
    .goto 1409,58.87,73.55 << Monk
    >>跟随 |cRXP_FRIENDLY_Breka|r。一旦 |cRXP_ENEMY_Breka|r 转为敌对，就攻击她
    >>施放 |T136207:0|t暗言术：痛。在减益效果消失前再施放 3 次 << Priest
    >>对 |cRXP_ENEMY_Breka|r 施放 |T132337:0|tCharge 3 次 << Warrior
    >>当 |cRXP_ENEMY_Breka|r 提示你时，对她施放 |T136096:0|tMoonfire  << Druid
    >>在一定范围内施放 |T135846:0|tFrostbolt，然后在近战范围内施放 |T135807:0|tFire Blast -> 重复 << Mage
    >>在一定范围内施放 |T136048:0|t闪电箭，然后施放 |T460956:0|t原始打击 4 次 -> 重复 << Shaman
    >>施放 |T135891:0|t十字军打击 3 次以建立 3 点神圣能量，然后施放 |T236265:0|t正义之盾 -> 重复 << Paladin
    .complete 59934,2 << Monk --3/3 Blackout Kick used on Warlord Grimaxe
    .complete 59934,1 << Monk --6/6 Tiger Palm used on Warlord Grimaxe
    .complete 59933,1 << !Hunter !Monk --3/3 Abilities proven against Warlord Grimaxe
	.mob Warlord Breka Grimaxe
step << Alliance !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Alaria|r
    .turnin 59339 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << Monk 
    .turnin 59254 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.36,74.63
    .accept 55173 >>接任务: |cRXP_WARN_向北而行|r
    .goto 1409,58.36,74.48
	.target Captain Garrick
	.target Alaria
step << Horde !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Won'sa
    .turnin 59934 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << Monk
    .turnin 59933 >>交任务: |cRXP_FRIENDLY_强化战斗技巧|r << !Hunter !Monk
    .goto 1409,58.36,74.63
    .accept 59935 >>接任务: |cRXP_WARN_向北而行|r
    .goto 1409,58.36,74.48
	.target Warlord Breka Grimaxe
	.target Won'sa
step << Alliance
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    .turnin 55173 >>交任务: |cRXP_FRIENDLY_向北而行|r
    .accept 55184 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r << !Hunter
    .accept 55186 >>接任务: |cRXP_WARN_打倒野猪人|r << !Hunter
    .accept 59342 >>接任务: |cRXP_WARN_野性可驯|r << Hunter
	.timer 9,Taming the Wilds RP << Hunter
	.target Austin Huxworth
step << Horde
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    .turnin 59935 >>交任务: |cRXP_FRIENDLY_向北而行|r
    .accept 59938 >>接任务: |cRXP_WARN_打倒野猪人|r << !Hunter
    .accept 59939 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r << !Hunter
    .accept 59937 >>接任务: |cRXP_WARN_野性可驯|r << Hunter
	.timer 9,Taming the Wilds RP << Hunter
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,62.72,69.85
    >>等待 RP
    .complete 59342,1 << Alliance --1/1 Tame Beast learned from Mithdran
    .complete 59937,1 << Horde --1/1 Tame Beast learned from Mithdran
step << Hunter
    .goto 1409,62.62,68.23,30,0
    .goto 1409,64.22,68.26,30,0
    .goto 1409,63.60,70.74,30,0
    .goto 1409,62.62,68.23,30,0
    .goto 1409,64.22,68.26,30,0
    .goto 1409,63.60,70.74
    >>将 |T132161:0|t[召唤宠物] 和 |T132179:0|t[宠物工具] 拖拽到你的动作栏上
	>>|cRXP_WARN_对 |cRXP_ENEMY_Sharpbeak Hawk|r 施放 |T132164:0|t[驯服野兽] 来驯服它。确保驯服的是一只鹰，以提高移动速度|r
    .complete 59342,2 << Alliance --1/1 Any wildlife beast tamed
    .complete 59937,2 << Horde --1/1 Any wildlife beast tamed
	.mob Sharpbeak Hawk
step << Alliance Hunter
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    .turnin 59342 >>交任务: |cRXP_FRIENDLY_野性可驯|r
    .accept 55184 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r
    .accept 55186 >>接任务: |cRXP_WARN_打倒野猪人|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,62.72,69.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    .turnin 59937 >>交任务: |cRXP_FRIENDLY_野性可驯|r
    .accept 59938 >>接任务: |cRXP_WARN_打倒野猪人|r
    .accept 59939 >>接任务: |cRXP_WARN_禁忌的野猪人通灵术|r
	.target Mithdran Dawntracker
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Quilboar Warriors|r 和 |cRXP_ENEMY_Geomancers|r
    .complete 55184,1 << Alliance --7/7 Quilboar slain
    .complete 59939,1 << Horde --7/7 Quilboar slain
	.mob Quilboar Warrior
	.mob Quilboar Geomancer
step
    .goto 1409,60.63,61.37,25,0
    .goto 1409,58.87,63.00
	>>杀死 |cRXP_ENEMY_Geolord Grek'og|r
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
    >>杀死 |cRXP_ENEMY_Quilboar Warriors|r 和 |cRXP_ENEMY_Geomancers|r
    .complete 55184,1 << Alliance --7/7 Quilboar slain
    .complete 59939,1 << Horde --7/7 Quilboar slain
	.mob Quilboar Warrior
	.mob Quilboar Geomancer
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r and |cRXP_FRIENDLY_Lindie|r
    .turnin 55184 >>交任务: |cRXP_FRIENDLY_禁忌的野猪人通灵术|r
    .goto 1409,56.26,59.17
    .turnin 55186 >>交任务: |cRXP_FRIENDLY_打倒野猪人|r
    .accept 55193 >>接任务: |cRXP_WARN_斥候机器人5000型|r
	.timer 20,Scout-o-Matic RP
    .goto 1409,56.17,59.12
	.target Austin Huxworth
	.target Lindie Springstock
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r and |cRXP_FRIENDLY_Cork|r
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
	.vehicle >>等待 RP。进入 |cRXP_FRIENDLY_Scout-o-Matic 5000|r
	.timer 33,Scout-o-Matic Flight RP
step << Alliance
    .goto 1409,56.08,58.81
    >>等待 |cRXP_FRIENDLY_Scout-o-Matic 5000|r 上的 RP。|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .complete 55193,1 --1/1 Use the Scout-o-Matic 5000 to scout the Area
	.timer 27,Scout-o-Matic Flight RP
step << Horde
	#completewith next
    .goto 1409,56.08,58.81
	.vehicle >>等待 RP。进入 |cRXP_FRIENDLY_Choppy Booster Mk. 5|r
	.timer 33,Choppy Booster Flight RP
step << Horde
    .goto 1409,56.08,58.81
    >>等待 |cRXP_FRIENDLY_Choppy Booster Mk. 5|r 上的 RP。|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .complete 59940,1 --1/1 Use the Choppy Booster Mk. 5 to scout the Area
	.timer 27,Choppy Booster Flight RP
step << Alliance
    .goto 1409,56.16,59.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lindie|r
    .turnin 55193 >>交任务: |cRXP_FRIENDLY_斥候机器人5000型|r
    .accept 56034 >>接任务: |cRXP_WARN_调整局面|r
	.target Lindie Springstock
step << Horde
    .goto 1409,56.16,59.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cork|r
    .turnin 59940 >>交任务: |cRXP_FRIENDLY_强力直升爪Mk5型|r
    .accept 59941 >>接任务: |cRXP_WARN_调整局面|r
	.target Cork Fizzlepop
step
    #sticky
	#label Chest1
    .goto 1409,58.51,59.30
	.turnin 56579 >>抢劫地面上的 |cRXP_PICK_Chest|r
step
	.goto 1409,56.63,55.46,40,0
    .goto 1409,58.51,59.30,40,0
	.goto 1409,56.63,55.46,40,0
    .goto 1409,58.51,59.30
    >>在近战范围内对 |cRXP_ENEMY_Wandering Boars|r 使用 |T2735166:0|t[Re-Sizer v9.0.1] << Alliance
    >>在近战范围内对 |cRXP_ENEMY_Wandering Boars|r 使用 |T178051:0|t[Re-Sizer v9.0.1] << Horde
    .complete 56034,1 << Alliance --3/3 Re-Sizer v9.0.1 tested on Wandering Boars
    .complete 59941,1 << Horde --3/3 Re-Sizer v9.0.1 tested on Wandering Boars
	.mob Wandering Boar
    .use 178051 << Horde
    .use 170557 << Alliance
step << Alliance
	#requires Chest1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Lindie|r
    .turnin 56034 >>交任务: |cRXP_FRIENDLY_调整局面|r
    .goto 1409,56.25,59.03
	.timer 8,Re-sizing the Situation RP
    .accept 55879 >>接任务: |cRXP_WARN_骑乘科技强化野猪|r
    .goto 1409,56.17,59.13
	.target Captain Garrick
	.target Lindie Springstock
step << Horde
	#requires Chest1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Cork
    .turnin 59941 >>交任务: |cRXP_FRIENDLY_调整局面|r
    .goto 1409,56.25,59.03
    .accept 59942 >>接任务: |cRXP_WARN_死亡调整器|r
    .goto 1409,56.17,59.13
	.target Warlord Breka Grimaxe
	.target Cork Fizzlepop
step << Alliance
    .goto 1409,56.53,58.42
    >>短暂 RP 后登上 |cRXP_FRIENDLY_Giant Boar|r
    .complete 55879,1 --1/1 Ride the Giant Boar
    .target Giant Boar
step << Horde
    .goto 1409,56.08,58.81
    >>短暂 RP 后进入 |cRXP_FRIENDLY_Choppy Booster Mk. 5|r
    .complete 59942,1 --1/1 Ride the Choppy Booster Mk. 5
    .target Choppy Booster Mk. 5
step << Alliance
    .goto 1409,52.59,53.34
	>>使用 |T132226:0|t[践踏] (1) 对 |cRXP_ENEMY_Monstrous Cadavers|r 进行杀死它们
    .complete 55879,2 --8/8 Monstrous Cadaver slain
	.timer 8,Ride of the Boar RP
	.mob Monstrous Cadaver
step << Horde
    .goto 1409,52.59,53.34
    >>使用 |T2735166:0|t[Re-Sizer Blast] (1) 对 |cRXP_ENEMY_Monstrous Cadavers|r 杀死它们
    .complete 59942,2 --8/8 Monstrous Cadaver slain
	.timer 13,The Re-Deather RP
	.mob Monstrous Cadaver
step
    .goto 1409,50.94,52.78
    >>进入建筑内。杀死|cRXP_ENEMY_Torgok|r
    .complete 55879,3 << Alliance --1/1 Torgok slain
    .complete 59942,3 << Horde --1/1 Torgok slain
	.timer 23,Ride of the Boar RP << Alliance
	.timer 23,The Re-Deather RP << Horde
	.mob Torgok
step << Alliance
    .goto 1409,52.60,53.35
    >>等待 RP
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Henry|r
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .turnin 55879,1 >>交任务: |cRXP_FRIENDLY_骑乘科技强化野猪|r
	.target Henry Garrick
step << Horde
    .goto 1409,52.59,53.35
    >>等待 RP
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shuja|r
	>>|cRXP_WARN_按键盘上的“Esc”键跳过电影|r
    .turnin 59942,1 >>交任务: |cRXP_FRIENDLY_死亡调整器|r
	.target Shuja Grimaxe
step << Alliance
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .accept 55194 >>接任务: |cRXP_WARN_囤积补给|r
	.target Captain Garrick
step << Horde
    .goto 1409,52.17,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .accept 59950 >>接任务: |cRXP_WARN_囤积补给|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,52.22,55.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Richter|r
	>>购买 |cRXP_BUY_Tough Jerky|r 或 |cRXP_BUY_Alliance Tabard|r。出售包里的任何垃圾
    .complete 55194,2 --Any Item sold to Quartermaster Richter
    .complete 55194,1 --Any Item purchased from Quartermaster Richter
	.target Quartermaster Richter
step << Horde
    .goto 1409,52.45,55.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Jin'hake|r
	>>购买 |cRXP_BUY_Tough Jerky|r 或 |cRXP_BUY_Horde Tabard|r。出售背包中的任何垃圾
    .complete 59950,1 -- A Purchase an item from Provisioner Jin'hake
    .complete 59950,2 -- Sell an item to Provisioner Jin'hake
	.target Provisioner Jin'hake
step << Alliance
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 55194 >>交任务: |cRXP_FRIENDLY_囤积补给|r
	.target Captain Garrick
step << Horde
    .goto 1409,52.17,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59950 >>交任务: |cRXP_FRIENDLY_囤积补给|r
	.target Warlord Breka Grimaxe
step << Alliance Warrior/Alliance Warlock/Alliance Paladin/Alliance Priest
    .goto 1409,52.08,55.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库勒曼·法席恩|r
    .accept 58914 >>接任务: |cRXP_WARN_战士的终点|r << Warrior
    .accept 58953 >>接任务: |cRXP_WARN_牧师的终途|r << Priest
    .accept 58923 >>接任务: |cRXP_WARN_圣骑士的效劳|r << Paladin
    .accept 58962 >>接任务: |cRXP_WARN_术士的交易|r << Warlock
	.target Private Cole
step << Horde Warrior/Horde Warlock/Horde Paladin/Horde Priest
    .goto 1409,52.08,55.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Throg|r
    .accept 59971 >>接任务: |cRXP_WARN_战士的终点|r << Warrior
    .accept 59961 >>接任务: |cRXP_WARN_牧师的终途|r << Priest
    .accept 59958 >>接任务: |cRXP_WARN_圣骑士的效劳|r << Paladin
    .accept 59970 >>接任务: |cRXP_WARN_术士的交易|r << Warlock
	.target Grunt Throg
step << Shaman
    .goto 1409,52.30,55.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛戈什幽灵狼|r
    .accept 59002 >>接任务: |cRXP_WARN_萨满祭司的责任|r
	.target Ghost Wolf
step << Alliance
    .goto 1409,53.02,55.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bjorn|r
    .accept 55965 >>接任务: |cRXP_WARN_西部边界|r
	.target Bjorn Stouthands
step << Horde
    .goto 1409,52.89,56.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lana|r
    .accept 59948 >>接任务: |cRXP_WARN_西部边界|r
	.target Lana Jordan
step << Shaman
    .goto 1409,52.12,51.65
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 |cRXP_PICK_Blossoms|r
    .complete 59002,1,1 --1/4 Veil Blossom
step << Shaman
    .goto 1409,51.84,51.12
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 |cRXP_PICK_Blossoms|r
    .complete 59002,1,2 --2/4 Veil Blossom
step << Shaman
    .goto 1409,52.53,51.00
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 |cRXP_PICK_Blossoms|r
    .complete 59002,1,3 --3/4 Veil Blossom
step << Shaman
    .goto 1409,53.23,51.38
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t拾取地面上的 |cRXP_PICK_Blossoms|r
    .complete 59002,1 --4/4 Veil Blossom
step << Horde
    .goto 1409,53.79,52.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shuja|r
    .accept 59943 >>接任务: |cRXP_WARN_鹰身人的问题|r
	.target Shuja Grimaxe
step << Alliance
    .goto 1409,53.51,52.31
     >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Henry|r
    .accept 55196 >>接任务: |cRXP_WARN_鹰身人的问题|r
	.target Henry Garrick
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Henry|r and |cRXP_FRIENDLY_Kee-La|r
    .turnin 55196 >>交任务: |cRXP_FRIENDLY_鹰身人的问题|r
    .accept 55763 >>接任务: |cRXP_WARN_拯救梅瑞迪·寻涌|r
    .accept 55881 >>接任务: |cRXP_WARN_净化图腾|r
    .goto 1409,56.83,46.17
    .accept 55764 >>接任务: |cRXP_WARN_消灭鹰身人|r
    .goto 1409,56.93,46.25
	.target Henry Garrick
	.target Kee-La
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布尔|r, Shuja
    .turnin 59943 >>交任务: |cRXP_FRIENDLY_鹰身人的问题|r
    .accept 59945 >>接任务: |cRXP_WARN_消灭鹰身人|r
    .accept 59946 >>接任务: |cRXP_WARN_净化图腾|r
    .goto 1409,56.93,46.24
    .accept 59944 >>接任务: |cRXP_WARN_拯救梅瑞迪·寻涌|r
    .goto 1409,56.83,46.17
step
	#completewith Harpytotem
	>>杀死 |cRXP_ENEMY_Harpy Boltcallers|r、|cRXP_ENEMY_Snatchers|r 和 |cRXP_ENEMY_Hunting Worgs|r。暂时不要关注这个
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step
    .goto 1409,58.23,44.49
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Harpy Totem|r 进行刻录
    .complete 59946,1,1 << Horde --1/5 Harpy Totems burned
    .complete 55881,1,1 << Alliance --1/5 Harpy Totems burned
step
    .goto 1409,58.84,42.95
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Harpy Totem|r 进行刻录
    .complete 59946,1,2 << Horde --2/5 Harpy Totems burned
    .complete 55881,1,2 << Alliance --2/5 Harpy Totems burned
step
    .goto 1409,61.23,41.31
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Harpy Totem|r 进行刻录
    .complete 59946,1,3 << Horde --3/5 Harpy Totems burned
    .complete 55881,1,3 << Alliance --3/5 Harpy Totems burned
    .goto 1409,61.23,41.31
step
    #label Chest3
    .goto 1409,59.33,37.63
    .turnin 56581 >>抢劫地面上的 |cRXP_PICK_Chest|r
step
    .goto 1409,59.01,39.10
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Harpy Totem|r 进行刻录
    .complete 59946,1,4 << Horde --4/5 Harpy Totems burned
    .complete 55881,1,4 << Alliance --4/5 Harpy Totems burned
step
	#label Harpytotem
    .goto 1409,57.18,42.23
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Harpy Totem|r 进行刻录
    .complete 59946,1 << Horde --5/5 Harpy Totems burned
    .complete 55881,1 << Alliance --5/5 Harpy Totems burned
step
	#completewith next
    >>杀死在你保护 |cRXP_FRIENDLY_Meredy|r 时召唤的 |cRXP_ENEMY_Harpies|r 和 |cRXP_ENEMY_Worgs|r << Alliance
    >>杀死在你保护 |cRXP_FRIENDLY_Herbert|r 时召唤的 |cRXP_ENEMY_Harpies|r 和 |cRXP_ENEMY_Worgs|r << Horde
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
    .goto 1409,56.16,43.55,0,0
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step
    .goto 1409,54.29,41.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r << Horde
	>>击杀迎面而来的敌人。当 |cRXP_ENEMY_Bloodbeak|r 到来时将其击杀
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
	>>杀死 |cRXP_ENEMY_Harpy Boltcallers|r、|cRXP_ENEMY_Snatchers|r、和 |cRXP_ENEMY_Hunting Worgs|r
    .complete 55764,1 << Alliance --10/10 Harpies and cohorts slain
    .complete 59945,1 << Horde --10/10 Harpies and cohorts slain
    .goto 1409,56.16,43.55,0,0
	.mob Harpy Boltcaller
	.mob Harpy Snatcher
	.mob Hunting Worg
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r, |cRXP_FRIENDLY_布尔|r, Shuja
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r, |cRXP_FRIENDLY_Kee-La|r and |cRXP_FRIENDLY_Henry|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Lightspawn|r
    .accept 54933 >>接任务: |cRXP_WARN_圣光解救|r
	.target Lightspawn
step
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Orbs|r 分散能量
    .complete 54933,1 --1/1 First necrotic energy dispersed
    .goto 1409,57.42,49.68
    .complete 54933,2 --1/1 Second necrotic energy dispersed
    .goto 1409,58.49,49.16
    .complete 54933,3 --1/1 Third necrotic energy dispersed
    .goto 1409,59.00,50.69
    .complete 54933,4 --1/1 Fourth necrotic energy dispersed
	.timer 11,Freeing the Light RP
    .goto 1409,57.82,51.19
step << Alliance Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorah|r
    .complete 58923,1 --1/1 Speak with the ghost paladin
    .turnin 58923 >>交任务: |cRXP_FRIENDLY_圣骑士的效劳|r
    .accept 58946 >>接任务: |cRXP_WARN_圣盾术|r
	.skipgossip 162998,1
	.target Yorah
step << Horde Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daelya|r
    .complete 59958,1 --1/1 Speak with the ghost paladin
    .turnin 59958 >>交任务: |cRXP_FRIENDLY_圣骑士的效劳|r
    .accept 60174 >>接任务: |cRXP_WARN_圣盾术|r
	.skipgossip 167179,1
	.target Daelya Twilightsbane
step << Alliance Paladin
	#completewith next
    .goto 1409,57.08,52.73
    >>施放|T524354:0|t[圣盾]穿过屏障
	>>|cRXP_WARN_如果你没有及时穿过屏障，请再次与 Yorah 交谈以重置圣盾的冷却时间|r
    .complete 58946,1 --1/1 Divine shield used
	.skipgossip 162998,1
	.target Yorah
step << Horde Paladin
	#completewith next
    .goto 1409,57.08,52.73
    >>施放|T524354:0|t[圣盾]穿过屏障
	>>|cRXP_WARN_如果你没有及时穿过屏障，请再次与 Daelya 交谈以重置圣盾的冷却时间|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Yorah|r
    .turnin 58946 >>交任务: |cRXP_FRIENDLY_圣盾术|r
	.target Yorah
step << Horde Paladin
    .goto 1409,57.57,52.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Daelya|r
    .turnin 60174 >>交任务: |cRXP_FRIENDLY_圣盾术|r
	.target Daelya Twilightsbane
step
    .goto 1409,58.20,50.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Lightspawn|r
    .turnin 54933 >>交任务: |cRXP_FRIENDLY_圣光解救|r
	.target Lightspawn
step << Alliance Warrior
    .goto 1409,51.47,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_ENEMY_Hjalmar|r. |cRXP_WARN_Damage him to 20% or less health|r. |cRXP_WARN_Cast|r |T135358:0|t|cRXP_WARN_Execute on him|r
    .turnin 58914 >>交任务: |cRXP_FRIENDLY_战士的终点|r
    .accept 58915 >>接任务: |cRXP_WARN_哈尔玛的最后处决|r
    .complete 58915,1 --1/1 Hjalmar the Undying slain with Execute
    .skipgossip
	.target Hjalmar the Undying
step << Horde Warrior
    .goto 1409,51.47,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_ENEMY_Hjalmar|r. |cRXP_WARN_Damage him to 20% or less health|r. |cRXP_WARN_Cast|r |T135358:0|t|cRXP_WARN_Execute on him|r
    .turnin 59971 >>交任务: |cRXP_FRIENDLY_战士的终点|r
    .accept 59972 >>接任务: |cRXP_WARN_哈尔玛的最后处决|r
    .complete 59972,1 --1/1 Hjalmar the Undying slain with Execute
    .skipgossip
	.target Hjalmar the Undying
step << Alliance Warrior
    .goto 1409,52.08,55.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库勒曼·法席恩|r
    .turnin 58915 >>交任务: |cRXP_FRIENDLY_哈尔玛的最后处决|r
	.target Private Cole
step << Horde Warrior
    .goto 1409,52.03,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Throg|r
    .turnin 59972 >>交任务: |cRXP_FRIENDLY_哈尔玛的最后处决|r
	.target Grunt Throg
step << Alliance Priest
    .goto 1409,57.32,51.87,15,0
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branven|r
    .turnin 58953 >>交任务: |cRXP_FRIENDLY_牧师的终途|r
    .accept 58960 >>接任务: |cRXP_WARN_复活新兵|r
	.target Branven Hammerheart
step << Horde Priest
    .goto 1409,57.32,51.87,15,0
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sha'zul|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Branven|r
    .turnin 58960 >>交任务: |cRXP_FRIENDLY_复活新兵|r
	.target Branven Hammerheart
step << Horde Priest
    .goto 1409,56.12,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Sha'zul|r
    .turnin 59965 >>交任务: |cRXP_FRIENDLY_复活新兵|r
	.target Sha'zul
step << Alliance Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hubert|r's Corpse on the ground
	>>拾取他旁边地面上的 |cRXP_PICK_Book|r
    .complete 58962,1 --1/1 Dead warlock's body investigated
    .goto 1409,52.53,45.89
    .complete 58962,2 --1/1 Old Grimoire
    .goto 1409,52.59,45.85
	.target Hubert Lucas 
    .skipgossip
step << Horde Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯普拉格·弗劳克|r
	>>拾取他旁边地面上的 |cRXP_PICK_Book|r
    .complete 59970,1 --1/1 Dead warlock's body investigated
    .goto 1409,52.53,45.89
    .complete 59970,2 --1/1 Old Grimoire
    .goto 1409,52.59,45.85
	.target Sprag Buzzboom
    .skipgossip
step << Warlock
	#completewith next
    .goto 1409,52.61,45.44
    >>使用虚空传送门旁边的 |T538444:0|t[旧魔法书]
    .complete 58962,3 << Alliance --1/1 Voidwalker summoned with grimoire
    .complete 59970,3 << Horde --1/1 Voidwalker summoned with grimoire
    .use 174947
step << Warlock
    .goto 1409,52.61,45.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虚空行者|r
    .turnin 58962 >>交任务: |cRXP_FRIENDLY_术士的交易|r << Alliance
    .turnin 59970 >>交任务: |cRXP_FRIENDLY_术士的交易|r << Horde
	.target Summoned Voidwalker
step << Alliance !Priest !Monk !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Campfire|r << Shaman
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .complete 59002,2 << Shaman --1/1 Blossoms burned on campfire
    .goto 1409,52.21,55.58 << Shaman
	.target Captain Garrick
step << Horde !Priest !Monk !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
	>>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Campfire|r << Shaman
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .complete 59002,2 << Shaman --1/1 Blossoms burned on campfire
    .goto 1409,52.21,55.58 << Shaman
	.target Warlord Breka Grimaxe
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Austin|r
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .accept 59355 >>接任务: |cRXP_WARN_猎人的陷阱|r
    .goto 1409,52.41,55.28
	.target Captain Garrick
	.target Austin Huxworth
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Mithdran
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .accept 59952 >>接任务: |cRXP_WARN_猎人的陷阱|r
    .goto 1409,52.56,55.43
	.target Warlord Breka Grimaxe
	.target Mithdran Dawntracker
step << Alliance Monk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Kee-La|r
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.35,55.34
    .accept 59347 >>接任务: |cRXP_WARN_武僧的专注|r
    .goto 1409,52.14,55.68
	.timer 34,A Monk's Focus RP
	.target Captain Garrick
	.target Kee-La
step << Horde Monk
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, |cRXP_FRIENDLY_布尔|r
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r
    .goto 1409,52.18,55.34
    .accept 59956 >>接任务: |cRXP_WARN_武僧的专注|r
    .goto 1409,52.04,55.22
	.timer 34,A Monk's Focus RP
	.target Warlord Breka Grimaxe
	.target Bo
step << Shaman
    .goto 1409,54.40,58.45
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Ghost Wolf|r 来释放它
    .complete 59002,3,1 --1/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,55.28,52.79
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Ghost Wolf|r 来释放它
    .complete 59002,3,2 --2/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,55.40,50.78
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Ghost Wolf|r 来释放它
    .complete 59002,3 --3/3 Captured ghost wolves freed
    .target Ghost Wolf
step << Shaman
    .goto 1409,52.30,55.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛戈什幽灵狼|r
    .turnin 59002 >>交任务: |cRXP_FRIENDLY_萨满祭司的责任|r
	.target Ghost Wolf
step << Alliance Monk
    .goto 1409,52.62,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跟随 |cRXP_FRIENDLY_Kee-La|r，然后与她交谈
    .complete 59347,1 --1/1 Meditate with Kee-La
	.skipgossip 164835,1
	.timer 42,A Monk's Focus RP
	.target Kee-La
step << Horde Monk
    .goto 1409,52.62,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跟随 |cRXP_FRIENDLY_Bo|r，然后与他交谈
    .complete 59956,1 --1/1 Meditate with Bo
	.skipgossip 167537,1
	.timer 42,A Monk's Focus RP
	.target Bo
step << Alliance Monk
    .goto 1409,52.63,49.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kee-La|r
    .turnin 59347 >>交任务: |cRXP_FRIENDLY_武僧的专注|r
    .accept 59349 >>接任务: |cRXP_WARN_最后的比试|r
	.timer 5,One Last Spar RP
	.target Kee-La
step << Horde Monk
    .goto 1409,52.63,49.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布尔|r
    .turnin 59956 >>交任务: |cRXP_FRIENDLY_武僧的专注|r
    .accept 59957 >>接任务: |cRXP_WARN_最后的比试|r
	.timer 5,One Last Spar RP
	.target Bo
step << Alliance Monk
    .goto 1409,53.72,50.24
    >>跟随 |cRXP_FRIENDLY_Kee-La|r。当 |cRXP_ENEMY_Kee-La|r 转为敌对时，对她施放 |T606552:0|tTouch of Death
    .complete 59349,1 --1/1 Touch of Death used on Kee-La
    .mob Kee-La
step << Horde Monk
    .goto 1409,53.72,50.24
    >>跟随 |cRXP_FRIENDLY_Bo|r。当 |cRXP_ENEMY_Bo|r 转为敌对时，对他施放 |T606552:0|tTouch of Death
    .complete 59957,1 --1/1 Touch of Death used on Bo
    .mob Bo
step << Alliance Monk
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 59349 >>交任务: |cRXP_FRIENDLY_最后的比试|r
	.target Captain Garrick
step << Horde Monk
    .goto 1409,52.18,55.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59957 >>交任务: |cRXP_FRIENDLY_最后的比试|r
	.target Warlord Breka Grimaxe
step << Alliance Mage
    .goto 1409,52.28,55.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r
    .accept 59352 >>接任务: |cRXP_WARN_法师的知识|r
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r
    .accept 59954 >>接任务: |cRXP_WARN_法师的知识|r
	.target Herbert Gloomburst
step << Mage
    .goto 1409,51.95,49.84
	>>在水下拾取 |cRXP_PICK_Spell Book|r
    .complete 59352,1 << Alliance --1/1 Meredy's Spell Book
    .complete 59954,1 << Horde --1/1 Herbert's Spell Book
step << Alliance Mage
    .goto 1409,52.28,55.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r
    .turnin 59352 >>交任务: |cRXP_FRIENDLY_法师的知识|r
    .accept 59354 >>接任务: |cRXP_WARN_绵羊的最佳用途|r
    .complete 59354,1 --Speak with Meredy to being sparring (1)
	.skipgossip 156886,1
	.timer 18,The Best Way to Use Sheep RP
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r
    .turnin 59954 >>交任务: |cRXP_FRIENDLY_法师的知识|r
    .accept 59955 >>接任务: |cRXP_WARN_绵羊的最佳用途|r
    .complete 59955,1 --Speak with Herbert to begin sparring (1)
	.skipgossip 167309,1
	.timer 18,The Best Way to Use Sheep RP
	.target Herbert Gloomburst
step << Alliance Mage
    .goto 1409,52.30,55.46
    >>关注 |cRXP_FRIENDLY_Meredy|r 和 |cRXP_FRIENDLY_Cole|r。等待 RP
    >>对 |cRXP_ENEMY_Meredy|r 或 |cRXP_ENEMY_Cole|r 施放 |T136071:0|t[变形]，然后对你变形过的对象造成一次伤害
    .complete 59354,2 --Practice Polymorph with Meredy or Cole
	.timer 10,The Best Way to Use Sheep RP
	.mob Meredy Huntsworth
	.mob Private Cole
step << Horde Mage
    .goto 1409,52.30,55.46
    >>关注 |cRXP_FRIENDLY_Herbert|r 和 |cRXP_FRIENDLY_Throg|r。等待 RP
    >>对 |cRXP_ENEMY_Herbert|r 或 |cRXP_ENEMY_Throg|r 施放 |T136071:0|t[变形]，然后对你变形过的对象造成伤害
    .complete 59955,2 --Practice Polymorph with Herbert or Throg
	.timer 10,The Best Way to Use Sheep RP
	.mob Herbert Gloomburst
	.mob Grunt Throg
step << Alliance Mage
    .goto 1409,52.30,55.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r
    .turnin 59354 >>交任务: |cRXP_FRIENDLY_绵羊的最佳用途|r
	.target Meredy Huntsworth
step << Horde Mage
    .goto 1409,52.16,55.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r
    .turnin 59955 >>交任务: |cRXP_FRIENDLY_绵羊的最佳用途|r
	.target Herbert Gloomburst
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bjorn|r and |cRXP_FRIENDLY_Alaria|r
    .turnin 55965 >>交任务: |cRXP_FRIENDLY_西部边界|r
    .goto 1409,51.18,59.61
    .accept 55639 >>接任务: |cRXP_WARN_谁藏在坑中|r
    .goto 1409,51.11,59.51
	.target Bjorn Stouthands
	.target Alaria
step << Horde
    .goto 1409,51.11,59.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lana|r
    .turnin 59948 >>交任务: |cRXP_FRIENDLY_西部边界|r
    .accept 59949 >>接任务: |cRXP_WARN_谁藏在坑中|r
	.target Lana Jordan
step
	#completewith next
	>>|cRXP_WARN_尽量避免在室内与蜘蛛战斗|r
    .goto 1409,50.88,60.45,10 >>进入蜘蛛洞
step
    .goto 1409,52.07,59.99
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Cocoon|r 来摧毁它
    .complete 55639,1,1 << Alliance --1/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,1 << Horde --1/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,52.02,58.31,15,0
    .goto 1409,50.26,58.69
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Cocoon|r 来摧毁它
    .complete 55639,1,2 << Alliance --2/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,2 << Horde --2/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,49.71,60.49,15,0
    .goto 1409,49.70,62.02
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Cocoon|r 来摧毁它
    .complete 55639,1,3 << Alliance --3/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,3 << Horde --3/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,51.12,62.10,15,0
    .goto 1409,51.96,60.67
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Cocoon|r 来摧毁它
    .complete 55639,1,4 << Alliance --4/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1,4 << Horde --4/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,52.07,59.13,12,0
    .goto 1409,50.87,58.12
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Cocoon|r 来摧毁它
    .complete 55639,1 << Alliance --5/5 Trapped Expedition Member rescued from cocoons
    .complete 59949,1 << Horde --5/5 Trapped Expedition Member rescued from cocoons
step
    .goto 1409,50.08,59.91,12,0
    .goto 1409,47.42,60.49
    >>杀死 |cRXP_ENEMY_被放逐的Hrun|r
    .complete 55639,2 << Alliance --Defeat Hrun to rescue Ralia Dreamchaser (1)
    .complete 59949,2 << Horde --Defeat Hrun to rescue Crenna Earth-Daughter (1)
	.mob Hrun the Exiled
step << skip
	#completewith next
    .goto 1409,47.79,60.27
    .vehicle >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Ralia|r 来骑她
	.timer 51,Who Lurks in the Pit RP
	.target Ralia Dreamchaser
--VV ALLIANCE Ralia/Crenna not classified as either vehicle or flight paths so can't do this. unluko
step << Alliance 
    .goto 1409,47.79,60.27
--  .goto 1409,51.83,58.76
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Ralia|r 骑上她。等待 RP
    .complete 55639,3 --Ride Ralia Dreamchaser to escape (1)
	.target Ralia Dreamchaser
step << skip
	#completewith next
    .goto 1409,47.79,60.27
    .vehicle >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Crenna|r 来骑她
	.timer 51,Who Lurks in the Pit RP
	.target Crenna Earth-Daughter
--VV HORDE Ralia/Crenna not classified as either vehicle or flight paths so can't do this. unluko
step << Horde 
    .goto 1409,47.79,60.27
--   .goto 1409,51.83,58.76
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Crenna|r 骑上她。等待 RP
    .complete 59949,3 --Ride Crenna Earth-Daughter to escape (1)
	.target Crenna Earth-Daughter
step << Horde !Hunter !Rogue !Druid
    .goto 1409,52.18,55.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .turnin 59947 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r << Priest
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Warlord Breka Grimaxe
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r, |cRXP_FRIENDLY_布蕾卡·狼女|r
    .complete 59952,1 --1/1 Ice mote received from Herbert Gloomburst
    .goto 1409,52.16,55.49
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
    .skipgossip
	.target Herbert Gloomburst
	.target Warlord Breka Grimaxe
step << Horde Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Throg
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
    .accept 59967 >>接任务: |cRXP_WARN_[A Rogue's End]|r
    .goto 1409,52.08,55.29
	.target Warlord Breka Grimaxe
	.target Grunt Throg
step << Horde Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .accept 59951 >>接任务: |cRXP_WARN_[A Druid's Form]|r
    .goto 1409,52.33,55.44
    .turnin 59949 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.18,55.34
	.target Crenna Earth-Daughter
	.target Warlord Breka Grimaxe
step << Alliance !Hunter !Rogue !Druid
    .goto 1409,52.35,55.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .turnin 55882 >>交任务: |cRXP_FRIENDLY_带给基地的消息|r << Priest
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Captain Garrick
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r and |cRXP_FRIENDLY_Garrick|r
    .complete 59355,1 --1/1 Ice mote received from Meredy Huntswell
    .goto 1409,52.29,55.47
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
	.skipgossip
	.target Meredy Huntswell
	.target Captain Garrick
step << Alliance Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Coulston|r
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
    .accept 58917 >>接任务: |cRXP_WARN_[A Rogue's End]|r
    .goto 1409,52.08,55.29
	.target Captain Garrick
	.target Coulston Nereus
step << Alliance Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ralia|r and |cRXP_FRIENDLY_Garrick|r
    .accept 59350 >>接任务: |cRXP_WARN_[A Druid's Form]|r
    .goto 1409,52.33,55.44
    .turnin 55639 >>交任务: |cRXP_FRIENDLY_谁藏在坑中|r
    .goto 1409,52.35,55.33
	.target Ralia Dreamchaser
	.target Captain Garrick
step << Druid
    .goto 1409,45.34,49.19
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击|cRXP_PICK_Druid Stone|r 执行仪式
    .complete 59350,1 << Alliance --1/1 Commune with the Druid Stone
    .complete 59951,1 << Horde --1/1 Commune with the Druid Stone
step << Alliance Druid
    .goto 1409,45.50,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ralia|r
    .turnin 59350 >>交任务: |cRXP_FRIENDLY_德鲁伊的形态|r
	.target Ralia Dreamchaser
step << Horde Druid
    .goto 1409,45.50,49.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Crenna|r
    .turnin 59951 >>交任务: |cRXP_FRIENDLY_德鲁伊的形态|r
	.target Crenna Earth-Daughter
step << Horde Druid
    .goto 1409,52.17,55.35
    >>将旅行表格放入你的行动栏
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Warlord Breka Grimaxe
step << Alliance Druid
    .goto 1409,52.35,55.33
    >>将 |T132144:0|tTravel Form 放在你的动作栏上
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
	.target Captain Garrick
step << Hunter
    >>拾取地面上的 |cRXP_PICK_Chain|r 和 |cRXP_PICK_Spring|r
    .complete 59355,2 << Alliance --1/1 Rusted Chain
    .complete 59952,2 << Horde --1/1 Rusted Chain
    .goto 1409,52.25,53.03
    .complete 59355,3 << Alliance --1/1 Old Spring
    .complete 59952,3 << Horde --1/1 Old Spring
    .goto 1409,51.83,51.60
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    .turnin 59355 >>交任务: |cRXP_FRIENDLY_猎人的陷阱|r
    .accept 59356 >>接任务: |cRXP_WARN_狩猎潜伏者|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    .turnin 59952 >>交任务: |cRXP_FRIENDLY_猎人的陷阱|r
    .accept 59953 >>接任务: |cRXP_WARN_狩猎潜伏者|r
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,52.60,53.29
    >>|cRXP_WARN_将 |T135834:0|t[冰冻陷阱] 从法术书拖到你的动作栏|r
    >>在食人魔之环中央施放|T135834:0|t冰冻陷阱
    .complete 59356,1 << Alliance --1/1 Freezing trap used within Ogre Ruins to capture stalker
    .complete 59953,1 << Horde --1/1 Freezing trap used within Ogre Ruins to capture stalker
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    .turnin 59356 >>交任务: |cRXP_FRIENDLY_狩猎潜伏者|r
    .accept 60168 >>接任务: |cRXP_WARN_驯服的艺术|r
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    .turnin 59953 >>交任务: |cRXP_FRIENDLY_狩猎潜伏者|r
    .accept 60162 >>接任务: |cRXP_WARN_驯服的艺术|r
	.target Mithdran Dawntracker
step << Hunter
    .goto 1409,52.56,55.45
    >>|cRXP_WARN_点击 |T132179:0|t[宠物工具] -> 施放 |T136095:0|t[关闭宠物]|r
    .complete 60168,1 << Alliance --Use "Dismiss Pet" to temporarily dismiss your current pet
    .complete 60162,1 << Horde --Use "Dismiss Pet" to temporarily dismiss your current pet
step << Alliance Hunter
    .goto 1409,52.42,55.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    >>瞄准 |cRXP_ENEMY_Wolf|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast]|r << !Worgen !Draenei
    >>瞄准 |cRXP_ENEMY_Dog|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast] 攻击它|r << Worgen
    >>瞄准 |cRXP_ENEMY_Moth|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast] 攻击它|r << Draenei
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    >>瞄准 |cRXP_ENEMY_Turtle|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast] 在其上|r << !Orc !BloodElf
    >>瞄准 |cRXP_ENEMY_Wolf|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast]|r << Orc
    >>瞄准 |cRXP_ENEMY_Dragonhawk|r。|cRXP_WARN_Cast |T132164:0|t[Tame Beast] 攻击它|r << BloodElf
    >>对其施放|T132164:0|t[驯服野兽]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r
    .complete 60168,3 --Speak with Austin to learn about pet stables
	.skipgossip 161666,1
	.target Austin Huxworth
step << Horde Hunter
    .goto 1409,52.56,55.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithdran|r
    .complete 60162,3 --Speak with Mithdran to learn about pet stables
	.skipgossip 167215,1
	.target Mithdran Dawntracker
step << Alliance Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Austin|r and |cRXP_FRIENDLY_Garrick|r
    .turnin 60168 >>交任务: |cRXP_FRIENDLY_驯服的艺术|r
    .goto 1409,52.42,55.27
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.35,55.33
	.target Austin Huxworth
	.target Captain Garrick
step << Horde Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Mithdran, |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 60162 >>交任务: |cRXP_FRIENDLY_驯服的艺术|r
    .goto 1409,52.56,55.45
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.17,55.35
	.target Mithdran Dawntracker
	.target Warlord Breka Grimaxe
step << Rogue
    .goto 1409,48.76,54.25
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Danger Sign|r
    .accept 56839 >>接任务: |cRXP_WARN_可怕的灭爪|r
step << Rogue
	#completewith RoguesEnd
	>>杀死 |cRXP_ENEMY_Killclaw the Terrible|r |cRXP_WARN_如果有其他玩家正在杀死他。否则，暂时避开他|r
	.complete 56839,1 --Killclaw the Terrible Slain (1)
    .mob Killclaw the Terrible
step << Alliance Rogue
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coulston|r
    .complete 58917,1 --1/1 First expedition's rogue found
	.target Coulston Nereus
step << Horde Rogue
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizza|r
    .complete 59967,1 --1/1 First expedition's rogue found
	.target Drizza Sidestabber
step << Rogue
    .goto 1409,44.76,56.42
    >>拾取地面上的 |cRXP_PICK_Hemlock Plant|r
    .complete 58917,2,1 << Alliance --3/3 Withering Hemlock
    .complete 59967,2,1 << Horde --3/3 Withering Hemlock
step << Rogue
    .goto 1409,45.17,55.69
    >>拾取地面上的 |cRXP_PICK_Hemlock Plant|r
    .complete 58917,2,2 << Alliance --3/3 Withering Hemlock
    .complete 59967,2,2 << Horde --3/3 Withering Hemlock
step << Rogue
    .goto 1409,45.09,54.66
    >>拾取地面上的 |cRXP_PICK_Hemlock Plant|r
    .complete 58917,2 << Alliance --3/3 Withering Hemlock
    .complete 59967,2 << Horde --3/3 Withering Hemlock
step << Alliance Rogue
	#label RoguesEnd
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Coulston|r
    .turnin 58917 >>交任务: |cRXP_FRIENDLY_潜行者的末路|r
    .accept 58933 >>接任务: |cRXP_WARN_最致命的药膏|r
	.target Coulston Nereus
step << Horde Rogue
	#label RoguesEnd
    .goto 1409,45.64,56.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Drizza|r
    .turnin 59967 >>交任务: |cRXP_FRIENDLY_潜行者的末路|r
    .accept 59968 >>接任务: |cRXP_WARN_最致命的药膏|r
	.target Drizza Sidestabber
step << Rogue
	#completewith KillclawR
    .complete 59968,1 >>施放 |T132273:0|t[速效毒药] 将其涂抹到你的武器上
step << Rogue
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27,30,0
    .goto 1409,44.15,52.58,30,0
    .goto 1409,45.09,53.91,30,0
    .goto 1409,46.18,54.36,30,0
    .goto 1409,48.24,54.27
	>>杀死 |cRXP_ENEMY_Killclaw the Terrible|r。|cRXP_WARN_这个任务很难|r。如果需要，为他找一个小组。如果你无法找到一个小组或单独完成他，请跳过此步骤
    >>在他施放 |cRXP_ENEMY_Killclaw|r“践踏冲锋”时，移到一边以躲避。如果你单独对付他，施放 |T1373904:0|t[深红药瓶]，并在需要时使用 |T134830:0|t[远征治疗药水]
    .complete 56839,1 --1/1 Killclaw the Terrible slain
	.mob Killclaw the Terrible
	.use 175241
	.isOnQuest 56839
step << Rogue
	#completewith next
    .goto 1409,44.20,52.65,20 >>进入洞穴
step << Rogue
    .goto 1409,43.42,51.13
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Chest|r
    .turnin 56839 >>交任务: |cRXP_FRIENDLY_可怕的灭爪|r
	.isQuestComplete 56839
step << Rogue
	#label KillclawR
	.abandon 56839 >>抛弃可怕的基尔克劳
step << Rogue
    .goto 1409,48.47,52.04
    .complete 59968,1 >>施放 |T132273:0|t[速效毒药] 将其应用到你的武器上 +|cRXP_WARN_BEFORE|r 杀死 |cRXP_ENEMY_Gutgruk|r
step << Rogue
	#label GutGruk
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04,40,0
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04,40,0
    .goto 1409,47.92,50.23,40,0
    .goto 1409,48.47,52.04
	>>杀死 |cRXP_ENEMY_Gutgruk|r
    .complete 58933,2 << Alliance --1/1 Gutgruk the Tough slain
    .complete 59968,2 << Horde --1/1 Gutgruk the Tough slain
	.mob Gutgruk the Tough
step << Alliance Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库勒曼·法席恩|r, Garrick
    .turnin 58933 >>交任务: |cRXP_FRIENDLY_最致命的药膏|r
    .goto 1409,52.08,55.29
    .accept 56344 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.35,55.33
	.target Private Cole
	.target Captain Garrick
step << Horde Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Throg, |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59968 >>交任务: |cRXP_FRIENDLY_最致命的药膏|r
    .goto 1409,52.08,55.29
    .accept 59975 >>接任务: |cRXP_WARN_[To Darkmaul Citadel]|r
    .goto 1409,52.17,55.35
	.target Grunt Throg
	.target Warlord Breka Grimaxe
step << !Rogue
    .goto 1409,48.76,54.25
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Danger Sign|r
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
    >>杀死 |cRXP_ENEMY_可怕的Killclaw|r << Hunter/Warlock
    >>杀死 |cRXP_ENEMY_Killclaw the Terrible|r。|cRXP_WARN_这个任务很难|r。如果需要，为他找一个小组。如果你无法找到一个小组或单独完成他，请跳过此步骤 << !Hunter !Warlock
    >>在他施放“践踏冲锋”时移动到一侧以躲避|cRXP_ENEMY_Killclaw|r << !Warlock !Priest
    >>躲避 |cRXP_ENEMY_Killclaw|r 施放“践踏冲锋”时，移至一侧。Killclaw 免疫 |T136183:0|t[恐惧] << Warlock
    >>躲避 |cRXP_ENEMY_Killclaw|r 施放“践踏冲锋”时，移至一侧。Killclaw 免疫 |T136184:0|t[心灵尖啸] << Priest
    .complete 56839,1 --1/1 Killclaw the Terrible slain
	.mob Killclaw the Terrible
	.use 175241
	.isOnQuest 56839
step << !Rogue
	#completewith next
    .goto 1409,44.20,52.65,20 >>进入洞穴
step << !Rogue
    .goto 1409,43.42,51.13
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Chest|r
    .turnin 56839 >>交任务: |cRXP_FRIENDLY_可怕的灭爪|r
	.isQuestComplete 56839
step << !Rogue
	.abandon 56839 >>抛弃可怕的基尔克劳
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r and |cRXP_FRIENDLY_Meredy|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, |cRXP_FRIENDLY_赫伯特·哈尔希医生|r
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
    >>跑向暗槌城堡的楼梯
    .complete 55981,2 << Alliance --1/1 Enter Darkmaul Citadel
    .complete 59978,2 << Horde --1/1 Enter Darkmaul Citadel
step
    .goto 1409,45.68,37.55
	>>跑到食人魔烹饪区
    .complete 55981,3 << Alliance --Find the ogre cooking Area
    .complete 59978,3 << Horde --Find the ogre cooking Area
step
    .goto 1409,45.68,37.55
    >>瞄准 |cRXP_FRIENDLY_Gor'groth|r 即可自动向他挥手。如果此方法无效，请在 |cRXP_FRIENDLY_Gor'groth|r 输入 /wave
    .complete 55981,4 << Alliance --Type /wave to Gor'groth
    .complete 59978,4 << Horde --Type /wave to Gor'groth
    .emote WAVE,153580
	.target Gor'groth
step
	#completewith next
    .goto 1409,45.95,36.07,15,0
    .goto 1409,40.16,32.35
	>>跑上通往城堡的楼梯
    .complete 55981,6 << Alliance --Reach the Citadel entrance
    .complete 59978,6 << Horde --Reach the Citadel entrance
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r, |cRXP_FRIENDLY_Henry|r, and |cRXP_FRIENDLY_Meredy|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Shuja, |cRXP_FRIENDLY_赫伯特·哈尔希医生|r
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
    >>杀死 |cRXP_ENEMY_Ogre Shadowcasters|r、|cRXP_ENEMY_Brutes|r 和 |cRXP_ENEMY_Chefs|r
    .complete 55988,1 << Alliance --8/8 Ogres slain
    .complete 59979,1 << Horde--8/8 Ogres slain
	.mob Ogre Brute
	.mob Ogre Chef
	.mob Ogre Shadowcaster
step
    >>杀死建筑物内的 |cRXP_ENEMY_Wug|r 和 |cRXP_ENEMY_Jugnug|r。掠夺他们的 |cRXP_LOOT_Ward Stones|r
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
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Catapult|r 来摧毁它
    .complete 55989,1,1 << Alliance --1/4 Catapults destroyed
    .complete 59980,1,1 << Horde --1/4 Catapults destroyed
step
    .goto 1409,46.26,39.71
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Catapult|r 来摧毁它
    .complete 55989,1,2 << Alliance --2/4 Catapults destroyed
    .complete 59980,1,2 << Horde --2/4 Catapults destroyed
step
    .goto 1409,45.28,41.72
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Catapult|r 来摧毁它
    .complete 55989,1,3 << Alliance --3/4 Catapults destroyed
    .complete 59980,1,3 << Horde --3/4 Catapults destroyed
step
    .goto 1409,42.80,41.00
    >>杀死建筑内的 |cRXP_ENEMY_Grunk|r。搜刮他的 |cRXP_LOOT_Ward Stone|r
    .complete 55990,3 << Alliance --1/1 Grunk's ward stone recovered
    .complete 59981,3 << Horde --1/1 Grunk's ward stone recovered
	.mob Grunk
step
    .goto 1409,43.74,42.86
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Catapult|r 来摧毁它
    .complete 55989,1 << Alliance --4/4 Catapults destroyed
    .complete 59980,1 << Horde --4/4 Catapults destroyed
step
	#label KillOgre
    .goto 1409,41.81,42.88
    .turnin 56088 >>抢劫地面上的 |cRXP_PICK_Chest|r
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
    >>杀死 |cRXP_ENEMY_Ogre Shadowcasters|r、|cRXP_ENEMY_Brutes|r 和 |cRXP_ENEMY_Chefs|r
    .complete 55988,1 << Alliance --8/8 Ogres slain
    .complete 59979,1 << Horde--8/8 Ogres slain
	.mob Ogre Brute
	.mob Ogre Chef
	.mob Ogre Shadowcaster
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Meredy|r and |cRXP_FRIENDLY_Henry|r
    .turnin 55989 >>交任务: |cRXP_FRIENDLY_毁灭投石车|r
    .goto 1409,40.26,32.33
    .turnin 55988 >>交任务: |cRXP_FRIENDLY_食人魔任人宰割|r
    .goto 1409,40.22,32.35
	.target Meredy Huntsworth
	.target Henry Garrick
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫伯特·哈尔希医生|r, Shuja
    .turnin 59980 >>交任务: |cRXP_FRIENDLY_毁灭投石车|r
    .goto 1409,40.37,32.41
    .turnin 59979 >>交任务: |cRXP_FRIENDLY_食人魔任人宰割|r
    .goto 1409,40.25,32.56
	.target Herbert Gloomburst
	.target Shuja Grimaxe
step
    .goto 1409,39.93,32.44
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Rune|r 来禁用它
    .complete 55990,4,1 << Alliance --1/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,1 << Horde --1/3 Disable runes holding Warlord Thunderwalker
step
    .goto 1409,39.73,32.04
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Rune|r 来禁用它
    .complete 55990,4,2 << Alliance --2/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,2 << Horde --2/3 Disable runes holding Warlord Thunderwalker
step
    .goto 1409,40.07,31.96
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_PICK_Rune|r 来禁用它
    .complete 55990,4,3 << Alliance --3/3 Disable runes holding Warlord Thunderwalker
    .complete 59981,4,3 << Horde --3/3 Disable runes holding Warlord Thunderwalker
step << Alliance
    .goto 1409,39.93,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kelra|r
    .turnin 55990 >>交任务: |cRXP_FRIENDLY_控制他们的石头|r
    .accept 55992 >>接任务: |cRXP_WARN_地下城：暗槌堡垒|r
	.target Captain Kelra
step << Horde
    .goto 1409,39.93,32.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulgrin|r
    .turnin 59981 >>交任务: |cRXP_FRIENDLY_控制他们的石头|r
    .accept 59984 >>接任务: |cRXP_WARN_地下城：暗槌堡垒|r
	.target Warlord Mulgrin Thunderwalker
step
    >>|cRXP_WARN_打开队伍查找器（默认：I）并排队“Darkmaul Citadel”|r
    .complete 55992,1 << Alliance --Use the Group Finder to enter the dungeon, "Darkmaul Citadel"
    .complete 59984,1 << Horde --Use the Group Finder to enter the dungeon, "Darkmaul Citadel"
step
    >>在最后杀死 |cRXP_ENEMY_Ravnyr|r 来通关地下城
    .complete 55992,2 << Alliance --1/1 Gor'groth's final ritual stopped
    .complete 59984,2 << Horde --1/1 Gor'groth's final ritual stopped
step << Alliance
    >>|cRXP_WARN_点击地下城查找器的眼睛或你的角色肖像，然后选择“离开副本组”。这更快|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t或者，与船长 |cRXP_FRIENDLY_Garrick|r 交谈
    .complete 55992,3 --1/1 Speak with Captain Garrick to leave Darkmaul Citadel
	.target Captain Garrick
step << Horde
    >>|cRXP_WARN_点击地下城查找器的眼睛或你的角色肖像，然后选择“离开副本组”。这更快|r
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t或者，与 |cRXP_FRIENDLY_Breka|r 交谈
    .complete 59984,3 --1/1 Speak with Warlord Grimaxe to leave Darkmaul Citadel
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 55992 >>交任务: |cRXP_FRIENDLY_地下城：暗槌堡垒|r
	.target Captain Garrick
step << Horde
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59984 >>交任务: |cRXP_FRIENDLY_地下城：暗槌堡垒|r
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,39.65,31.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .accept 55991 >>接任务: |cRXP_WARN_终结与开始|r
	.target Captain Garrick
    .zoneskip 84
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .goto 1409,39.65,31.99
    .accept 59985 >>接任务: |cRXP_WARN_终结与开始|r
    .zoneskip 85
	.target Warlord Breka Grimaxe
step << Alliance
    .goto 1409,40.37,32.63
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Gryphon|r 前往暴风城。等待 RP
    .complete 55991,1 --1/1 Alliance Gryphon rode back to Stormwind
	.isOnQuest 55991
    .target Alliance Gryphon
step << Horde
    .goto 1409,40.37,32.63
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击 |cRXP_FRIENDLY_Wyvern|r 骑乘前往奥格瑞玛。等待 RP
    .complete 59985,1 --1/1 Horde Wyvern rode back to Orgrimmar
    .isOnQuest 59985
    .target Horde Wyvern
step << Alliance
    .goto 84,73.70,91.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 55991 >>交任务: |cRXP_FRIENDLY_终结与开始|r
	.target Captain Garrick
    .isOnQuest 55991
step << Horde
    .goto 85,52.52,88.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 59985 >>交任务: |cRXP_FRIENDLY_终结与开始|r
	.target Warlord Breka Grimaxe
	.isOnQuest 59985
step << Alliance 
    .goto 84,73.70,91.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r. |cRXP_WARN_Skip the Tutorial if you can|r
	.accept 59583 >>接任务: |cRXP_WARN_欢迎来到暴风城|r
	.target Captain Garrick
	.skipgossip 154169,1
step << Alliance
    .goto 84,70.15,85.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lindie|r
    .turnin 59583 >>交任务: |cRXP_FRIENDLY_欢迎来到暴风城|r
	.target Lindie Springstock
    .isOnQuest 59583
step << Alliance
    .goto 84,70.15,85.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lindie|r
    .accept 58908 >>接任务: |cRXP_WARN_找到你的道路|r
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暴风城卫兵|r, Lindie
    .complete 58908,1 --1/1 Ask a guard for directions to the Stable Master in Old Town
    .goto 84,69.47,84.58,-1
    .goto 84,70.29,83.60,-1
    .complete 58908,2 --1/1 Speak with Lindie Springstock
    .goto 84,69.79,83.82
	.target Stormwind City Guard
	.target Lindie Springstock
	.skipgossip 68,15,1
	.skipgossip 186180,15,1
	.skipgossip 1976,15,1
	.skipgossip 163095,1
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,70.28,79.83,20,0
    .goto 84,67.72,80.03,30,0
    .goto 84,63.77,73.59
    >>|cRXP_WARN_跟随|r|cRXP_FRIENDLY_Lindie|r。|cRXP_WARN_留在他附近，否则他会停止移动|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
	.target Lindie Springstock
	.target Renato Gallina
    .isQuestTurnedIn 59583
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
    >>|cRXP_WARN_跟随|r|cRXP_FRIENDLY_Lindie|r。|cRXP_WARN_留在他附近，否则他会停止移动|r
    .complete 58908,3 --1/1 Follow Lindie Springstock to the Stable Master in Old Town
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,77.29,66.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Curly|r
    .turnin 58908 >>交任务: |cRXP_FRIENDLY_找到你的道路|r
step << skip
	#label UseMount
	#completewith Specialize
	>>使用 |T132254:0|t[棕色雷象] 来学习它 << Draenei --CASTID NEEDED
	.use 28481 << Draenei
--VV CHANGE TO OTHER RACES LATER. MUST DO THE QUEST/FIND A WAY TO FIND ALL MOUNT IDS FOR EACH RACE
step << Alliance
    #completewith Specialization
    +|cRXP_WARN_将坐骑日志中的坐骑移至动作栏（默认：SHIFT+P）。使用坐骑可以更快地移动|r
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,77.28,66.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lindie|r
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
step << Alliance Hunter/Shaman/Priest/Paladin/Warrior
	#completewith next
    .goto 84,79.34,68.39,10 >>进入大楼
step << Alliance Rogue/Warlock
	#completewith next
    .goto 84,79.34,68.39,10,0
    .goto 84,80.11,68.41,6,0 
	.goto 84,79.40,69.61,6 >>进入大楼。下楼
step << Alliance Druid/Mage/Monk
	#completewith next
    .goto 84,79.34,68.39,10,0
    .goto 84,79.62,71.28,8,0
	.goto 84,80.19,70.56,8 >>进入大楼。上楼
step << Alliance Druid
	#label Specialization
    .goto 84,79.20,68.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithlos|r upstairs
    .complete 58910,1 --1/1 Speak with Mithlos Falconbriar to learn about specializations
    .complete 58910,2 --1/1 Activate a combat specialization
	.target Mithlos Falconbriar
	.skipgossip 164962,1
    .isQuestTurnedIn 59583
step << Alliance Druid
    .goto 84,79.20,68.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mithlos|r upstairs
    .turnin 58910 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Mithlos Falconbriar
    .isQuestTurnedIn 59583
step << Alliance Hunter
	#label Specialization
    .goto 84,79.13,71.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalgrun|r
    .complete 59586,1 --1/1 Speak with Dalgrun Steelpine to learn about specializations
    .complete 59586,2 --1/1 Activate a combat specialization
	.target Dalgrun Steelpine
	.skipgossip 164960,1
    .isQuestTurnedIn 59583
step << Alliance Hunter
    .goto 84,79.13,71.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dalgrun|r
    .turnin 59586 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Dalgrun Steelpine
    .isQuestTurnedIn 59583
step << Alliance Mage
	#label Specialization
    .goto 84,80.16,69.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frazzle|r upstairs
    .complete 59587,1 --1/1 Speak with Frazzle Frostfingers to learn about specializations
    .complete 59587,2 --1/1 Activate a combat specialization
	.target Frazzle Frostfingers
	.skipgossip 164955,1
    .isQuestTurnedIn 59583
step << Alliance Mage
    .goto 84,80.16,69.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frazzle|r upstairs
    .turnin 59587 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Frazzle Frostfingers
    .isQuestTurnedIn 59583
step << Alliance Monk
	#label Specialization
    .goto 84,80.35,70.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Juisheng|r upstairs
    .complete 59588,1 --1/1 Speak with Juisheng Halfclaw to learn about specializations
    .complete 59588,2 --1/1 Activate a combat specialization
	.target Juisheng Halfclaw
	.skipgossip 164954,1
    .isQuestTurnedIn 59583
step << Alliance Monk
    .goto 84,80.35,70.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Juisheng|r upstairs
    .turnin 59588 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Juisheng Halfclaw
    .isQuestTurnedIn 59583
step << Alliance Paladin
	#label Specialization
    .goto 84,79.13,69.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ezul'aan|r
    .complete 59589,1 --1/1 Speak with Ezul'aan to learn about specializations
    .complete 59589,2 --1/1 Activate a combat specialization
	.target Ezul'aan
	.skipgossip 164952,1
    .isQuestTurnedIn 59583
step << Alliance Paladin
    .goto 84,79.13,69.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ezul'aan|r
    .turnin 59589 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Ezul'aan
    .isQuestTurnedIn 59583
step << Alliance Priest
	#label Specialization
    .goto 84,78.88,69.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕崔斯·杜耶尔|r
    .complete 59590,1 --1/1 Speak with Patrice Lancaster to learn about specializations
    .complete 59590,2 --1/1 Activate a combat specialization
	.target Patrice Lancaster
	.skipgossip 164949,1
    .isQuestTurnedIn 59583
step << Alliance Priest
    .goto 84,78.88,69.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕崔斯·杜耶尔|r
    .turnin 59590 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Patrice Lancaster
    .isQuestTurnedIn 59583
step << Alliance Rogue
	#label Specialization
    .goto 84,78.53,70.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veruca|r downstairs
    .complete 59591,1 --1/1 Speak with Patrice Lancaster to learn about specializations
    .complete 59591,2 --1/1 Activate a combat specialization
	.target Veruca Darkstream
	.skipgossip 164946,1
    .isQuestTurnedIn 59583
step << Alliance Rogue
    .goto 84,78.53,70.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Veruca|r downstairs
    .turnin 59591 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Veruca Darkstream
    .isQuestTurnedIn 59583
step << Alliance Shaman
	#label Specialization
    .goto 84,78.72,70.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulric|r
    .complete 59592,1 --1/1 Speak with Mulric Boldrock to learn about specializations
    .complete 59592,2 --1/1 Activate a combat specialization
	.target Mulric Boldrock
	.skipgossip 164945,1
    .isQuestTurnedIn 59583
step << Alliance Shaman
    .goto 84,78.72,70.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Mulric|r
    .turnin 59592 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Mulric Boldrock
    .isQuestTurnedIn 59583
step << Alliance Warrior
	#label Specialization
    .goto 84,80.01,70.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kualiang|r
    .complete 59594,1 --1/1 Speak with Kualiang Thunderfist to learn about specializations
    .complete 59594,2 --1/1 Activate a combat specialization
	.target Kualiang Thunderfist
	.skipgossip 164940,1
    .isQuestTurnedIn 59583
step << Alliance Warrior
    .goto 84,80.01,70.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kualiang|r
    .turnin 59594 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Kualiang Thunderfist
    .isQuestTurnedIn 59583
step << Alliance Warlock
	#label Specialization
    .goto 84,78.99,69.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laphandrus|r downstairs
    .complete 59593,1 --1/1 Speak with Laphandrus Voidheart to learn about specializations
    .complete 59593,2 --1/1 Activate a combat specialization
	.target Laphandrus Voidheart
	.skipgossip 164941,1
    .isQuestTurnedIn 59583
step << Alliance Warlock
    .goto 84,78.99,69.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Laphandrus|r downstairs
    .turnin 59593 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Laphandrus Voidheart
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,79.68,69.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lindie|r
    .accept 58911 >>接任务: |cRXP_WARN_炉石所在便是家|r
	.target Lindie Springstock
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,76.34,64.55,25,0
    .goto 84,75.11,55.32,15,0
    .goto 84,75.69,54.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅根·提尔曼|r
	.home >>将你的炉石设置为猪与口哨
    .complete 58911,1 --1/1 Make the Pig and Whistle Tavern your home
    .turnin 58911 >>交任务: |cRXP_FRIENDLY_炉石所在便是家|r
	.target Maegan Tillman
	.isOnQuest 58911
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,75.25,54.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Henry|r
    .accept 58912 >>接任务: |cRXP_WARN_紧急会议|r
	.target Henry Garrick
    .isQuestTurnedIn 59583
step << Alliance
	#completewith next
    .goto 84,71.45,55.76,20,0
    .goto 84,70.05,52.73,20,0
    .goto 84,80.66,37.87,20,0
    .goto 84,85.22,32.07,40 >>前往暴风要塞
step << skip
    .goto 84,85.22,32.06
    .complete 58912,2 --1/1 Find Captain Garrick in Stormwind Keep
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,85.22,32.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Garrick|r
    .turnin 58912 >>交任务: |cRXP_FRIENDLY_紧急会议|r
    .accept 58983 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
	.timer 58,BFA: Tides of War RP
	.target Captain Garrick
    .isQuestTurnedIn 59583
step << Alliance
    .goto 84,85.92,31.57
    >>等待 RP
	.timer 45,War Council Roleplay
    .complete 58983,1 --1/1 Attend the War Council
    .isOnQuest 58983
step << Alliance
    .goto 84,85.92,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Anduin|r
    .turnin 58983 >>交任务: |cRXP_FRIENDLY_争霸艾泽拉斯：战争之潮|r
	.accept 59641 >>接任务: |cRXP_WARN_库尔提拉斯王国|r
	.target 安度因·乌瑞恩
    .isOnQuest 58983
step << Horde
    .goto 85,52.52,88.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r, Skip the tutorial if you can
    .accept 60343 >>接任务: |cRXP_WARN_欢迎来到奥格瑞玛|r
	.target Warlord Breka Grimaxe
    .skipgossip 168431,1
step << Horde
    .goto 85,52.51,88.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 63219 >>如果可以的话，跳过教程。否则跳过此步骤
	.target Warlord Breka Grimaxe
    .skipgossip 168431,1
--VV review these steps. Need to make sure they can differentiate between new/veteran accounts and autoskip correctly based on each
step << Horde
    .goto 85,51.93,85.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cork|r
    .turnin 60343 >>交任务: |cRXP_FRIENDLY_欢迎来到奥格瑞玛|r
    .accept 60344 >>接任务: |cRXP_WARN_找到你的道路|r
    .target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥格瑞玛步兵|r, Cork
    .complete 60344,1 --1/1 Ask a guard for directions to the Stable Master
    .goto 85,52.48,84.18
    .complete 60344,2 --1/1 Speak with Cork Fizzlepop
    .goto 85,52.25,84.42
    .skipgossip 168441,1
    .gossipoption 109405
    .isQuestAvailable 63219
	.target Orgrimmar Grunt
	.target Cork Fizzlepop
step << Horde
    .goto 85,62.06,33.33
    >>|cRXP_WARN_与|r |cRXP_FRIENDLY_Cork|r一起骑行。
    .complete 60344,3 --1/1 Ride with Cork Fizzlepop to the Stables
	.target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    .goto 85,71.57,47.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rohaka|r
    .turnin 60344 >>交任务: |cRXP_FRIENDLY_找到你的道路|r
step << Horde
	#label UseMount
	#completewith Specialize
	.cast 55884 >>使用背包中的坐骑来学习
	.use 87800 << Pandaren
    .isQuestAvailable 63219
--VV CHANGE TO OTHER RACES LATER. MUST DO THE QUEST/FIND A WAY TO FIND ALL MOUNT IDS FOR EACH RACE
--PRMK Cast ID is the same regardless of the mount. Will level through Exile's Reach with each race when I have the time for it.
step << Horde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cork|r
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
    +|cRXP_WARN_将坐骑日志中的坐骑移至动作栏（默认：SHIFT+P）。使用坐骑可以更快地移动|r
    .isQuestAvailable 63219
step << Horde
    #completewith HordeERIntroBrekaGrommashHold
    .goto 85,71.55,42.30,10,0
    .goto 85,72.38,45.14,30 >>游过水面，然后跑上临时坡道。进入建筑物内部
    .isQuestAvailable 63219
step << Horde Druid
    #label Specialize
    .goto 85,72.92,43.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telotha|r
    .complete 60346,1 --1/1 Speak with Telotha Pinegrove to learn about specializations
    .complete 60346,2 --1/1 Activate a combat specialization
	.target Telotha Pinegrove
    .skipgossip 168553,1
    .isQuestAvailable 63219
step << Horde Druid
    .goto 85,72.92,43.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Telotha|r
    .turnin 60346 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Telotha Pinegrove
    .isQuestAvailable 63219
step << Horde Hunter
    #label Specialize
    .goto 85,73.89,43.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tamanji|r
    .complete 60347,1 --1/1 Speak with Tamanji to learn about specializations
    .complete 60347,2 --1/1 Activate a combat specialization
	.target Tamanji
    .skipgossip 168551,1
    .isQuestAvailable 63219
step << Horde Hunter
    .goto 85,73.89,43.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tamanji|r
    .turnin 60347 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Tamanji
    .isQuestAvailable 63219
step << Horde Warrior
    #label Specialize
    .goto 85,73.76,47.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gormok|r
    .complete 60357,1 --1/1 Speak with Gormok Ogrefist to learn about specializations
    .complete 60357,2 --1/1 Activate a combat specialization
	.target Gormok Ogrefist
    .skipgossip 168596,1
    .isQuestAvailable 63219
step << Horde Warrior
    .goto 85,73.76,47.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gormok|r
    .turnin 60357 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Gormok Ogrefist
    .isQuestAvailable 63219
step << Horde Shaman
    #label Specialize
    .goto 85,73.41,43.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hretar|r
    .complete 60353,1 --1/1 Speak with Hretar Riverspeaker to learn about specializations
    .complete 60353,2 --1/1 Activate a combat specialization
	.target Hretar Riverspeaker
    .skipgossip 168628,1
    .isQuestAvailable 63219
step << Horde Shaman
    .goto 85,73.41,43.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hretar|r
    .turnin 60353 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Hretar Riverspeaker
    .isQuestAvailable 63219
step << Horde Priest
    #label Specialize
    .goto 85,72.64,46.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martin|r
    .complete 60351,1 --1/1 Speak with Martin Goodchilde to learn about specializations
    .complete 60351,2 --1/1 Activate a combat specialization
	.target Martin Goodchilde
    .skipgossip 168621,1
    .isQuestAvailable 63219
step << Horde Priest
    .goto 85,72.64,46.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Martin|r
    .turnin 60351 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Martin Goodchilde
    .isQuestAvailable 63219
step << Horde Paladin
    #label Specialize
    .goto 85,73.19,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Avaros|r
    .complete 60350,1 --1/1 Speak with Avaros Dawnglaive to learn about specializations
    .complete 60350,2 --1/1 Activate a combat specialization
	.target Avaros Dawnglaive
    .skipgossip 168597,1
    .isQuestAvailable 63219
step << Horde Paladin
    .goto 85,73.19,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Avaros|r
    .turnin 60350 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Avaros Dawnglaive
    .isQuestAvailable 63219
step << Horde Mage
    #label Specialize
    .goto 85,74.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Feenix|r
    .complete 60348,1 --1/1 Speak with Feenix Arcshine to learn about specializations
    .complete 60348,2 --1/1 Activate a combat specialization
	.target Feenix Arcshine
    .skipgossip 168626,1
    .isQuestAvailable 63219
step << Horde Mage
    .goto 85,74.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Feenix|r
    .turnin 60348 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Feenix Arcshine
    .isQuestAvailable 63219
step << Horde Monk
    #label Specialize
    .goto 85,75.69,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huinli|r
    .complete 60349,1 --1/1 Speak with Huinli Wingpaw to learn about specializations
    .complete 60349,2 --1/1 Activate a combat specialization
	.target Huinli Wingpaw
    .skipgossip 168619,1
    .isQuestAvailable 63219
step << Horde Monk
    .goto 85,75.68,43.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huinli|r
    .turnin 60349 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Huinli Wingpaw
    .isQuestAvailable 63219
step << Horde Rogue
    #label Specialize
    .goto 85,75.47,47.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thega|r
    .complete 60352,1 --1/1 Speak with Huinli Wingpaw to learn about specializations
    .complete 60352,2 --1/1 Activate a combat specialization
	.target Thega Graveblade
    .skipgossip 168598,1
    .isQuestAvailable 63219
step << Horde Rogue
    .goto 85,75.47,47.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thega|r
    .turnin 60352 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Thega Graveblade
    .isQuestAvailable 63219
step << Horde Warlock
    #label Specialize
    .goto 85,74.63,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kazak|r
    .complete 60355,1 --1/1 Speak with Kazak Darkscream to learn about specializations
    .complete 60355,2 --1/1 Activate a combat specialization
	.target Kazak Darkscream
    .skipgossip 168623,1
    .isQuestAvailable 63219
step << Horde Warlock
    .goto 85,74.63,47.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kazak|r
    .turnin 60355 >>交任务: |cRXP_FRIENDLY_你的专精是什么？|r
	.target Kazak Darkscream
    .isQuestAvailable 63219
step << Horde
    #label HordeERIntroBrekaGrommashHold
    .goto 85,73.29,45.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cork|r
    .accept 60359 >>接任务: |cRXP_WARN_炉石所在便是家|r
	.target Cork Fizzlepop
    .isQuestAvailable 63219
step << Horde
    .goto 85,70.37,49.01,15,0
    .goto 85,71.31,49.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅馆老板努法|r
	.home >>将你的炉石设为飞龙之尾
    .complete 60359,1 --1/1 Make The Wyvern's Tail your home
    .turnin 60359 >>交任务: |cRXP_FRIENDLY_炉石所在便是家|r
	.target Innkeeper Nufa
    .isOnQuest 60359
step << Horde
    .goto 85,70.86,49.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shuja|r
    *|cRXP_WARN_Relog if you can't see her.|r
    .accept 60360 >>接任务: |cRXP_WARN_紧急会议|r
	.target Shuja Grimaxe
    .isQuestAvailable 63219
step << Horde
	#completewith next
    .goto 85,64.89,46.56,30,0
    .goto 85,60.47,50.16,30,0
    .goto 85,58.35,61.57,30,0
    .goto 85,52.16,66.44,30,0
    .goto 85,49.90,75.60,15,0
    .goto 85,49.29,73.94,15 >>前往格罗玛什要塞。|cRXP_WARN_记得使用你的坐骑|r
step << skip
    .goto 85,49.29,73.94
	>>进入格罗玛什 
    .complete 60360,2 --1/1 Find Warlord Breka Grimaxe at Grommash Hold
    .isOnQuest 60360
--VV Horde
step << Horde
    .goto 85,48.26,71.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布蕾卡·狼女|r
    .turnin 60360 >>交任务: |cRXP_FRIENDLY_紧急会议|r
    .accept 60361 >>接任务: |cRXP_WARN_争霸艾泽拉斯：使命宣言|r
	.timer 42,Mission Statement RP
	.target Warlord Breka Grimaxe
    .isQuestTurnedIn 60359
step << Horde
	#completewith next
    >>等待 RP
    .complete 60361,1 --Meet with Warchief Sylvanas Windrunner
    .isQuestTurnedIn 60359
step << Horde
    .goto 85,48.51,71.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nathanos|r
    .complete 60361,2 --Speak with Nathanos Blightcaller
	.target Nathanos Blightcaller
    .skipgossip
    .isQuestTurnedIn 60359
]])
