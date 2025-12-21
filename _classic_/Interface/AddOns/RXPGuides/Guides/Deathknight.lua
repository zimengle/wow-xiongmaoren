local _, class = UnitClass("player")
if class ~= "DEATHKNIGHT" then return end

RXPGuides.RegisterGuide([[
#version 6
#wotlk
#cata
#mop
<< DK
#group RestedXP 死亡骑士 开始
#next RestedXP 联盟 60-70/59-61 地狱火半岛 << Alliance wotlk
#next RestedXP 部落 60-70/59-61 地狱火半岛 << Horde wotlk
#next RXP 大地的裂变 60-80 (部落)\59-61 地狱火半岛 << Horde cata
#next RXP 大地的裂变 60-80 (联盟)\59-61 地狱火半岛 << Alliance cata
#next RestedXP 熊猫人之谜 60-80 (部落)\59-61 地狱火半岛 << Horde !wotlk !cata
#next RestedXP 熊猫人之谜 60-80 (联盟)\59-61 地狱火半岛 << Alliance !wotlk !cata
#defaultfor DK
#name 55-58 血色领地
#displayname 55-58 血色领地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    .goto ScarletEnclave,51.3,35.1
    .target The Lich King
    >>与|cRXP_FRIENDLY_巫妖王|r谈话
    .accept 12593 >>接任务: |cRXP_LOOT_为巫妖王而战|r
step
    .goto ScarletEnclave,48.3,28.2
    >>与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12593 >>交任务: |cRXP_FRIENDLY_为巫妖王而战|r
    .target Instructor Razuvious
    .accept 12619 >>接任务: |cRXP_LOOT_符文之剑|r
step
    .goto ScarletEnclave,46.8,29.1,40,0
    .goto ScarletEnclave,48.1,27.9,40,0
    .goto ScarletEnclave,49.2,26.5,40,0
    .goto ScarletEnclave,46.8,29.1,40,0
    .goto ScarletEnclave,48.1,27.9,40,0
    .goto ScarletEnclave,49.2,26.5
	>>拾取战损之剑. 它可能在城墙周围多个位置刷新
    .collect 38607,1,12619,1 --Battle-Worn Sword (1)
step
    .goto ScarletEnclave,47.9,27.6
	.use 38607 >>前往符文熔炉. 点击背包中的破旧的长剑, 将其打造为符文之剑
    .complete 12619,1 --Runebladed Sword (1)
step
    .goto ScarletEnclave,48.3,28.2
    >>与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12619 >>交任务: |cRXP_FRIENDLY_符文之剑|r
    .target Instructor Razuvious
    .accept 12842 >>接任务: |cRXP_LOOT_符文熔铸：战争的准备|r
step
    .goto ScarletEnclave,47.9,27.5
	>>前往符文熔炉. 打开法术书, 点击“符文锻造”, 然后将其拖到你的快捷栏上. 将其中一个附魔效果施加到你背包中的符文灵魂之剑上
    .complete 12842,1 --Weapon emblazoned (1)
step
    .goto ScarletEnclave,48.3,28.2
    >>与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12842 >>交任务: |cRXP_FRIENDLY_符文熔铸：战争的准备|r
    .target Instructor Razuvious
    .accept 12848 >>接任务: |cRXP_LOOT_无尽的饥渴|r
step
    .goto ScarletEnclave,48.4,29.0
	.use 40732 >>走到房间中央. 点击其中一个将黑锋叛徒束缚在墙上的阿彻鲁斯灵魂牢笼, 与其中的敌人战斗. 在等待他们技能冷却(RP)期间, 跑回拉苏维奥斯身边, 并用死亡缠绕将他们拉到他面前. 击杀它们
    .complete 12848,1 --Unworthy Initiate dominated (1)
step
    .goto ScarletEnclave,48.3,28.2
    >>与|cRXP_FRIENDLY_教官拉苏维奥斯|r交谈
    .turnin 12848 >>交任务: |cRXP_FRIENDLY_无尽的饥渴|r
    .target Instructor Razuvious
    .accept 12636 >>接任务: |cRXP_LOOT_阿彻鲁斯之眼|r
step << wotlk
    .goto ScarletEnclave,48.67,32.77
    >>与|cRXP_FRIENDLY_Karloff|r交谈. 向他购买4个尸尘
    .collect 37201,4 --Corpse Dust (4)
    .isOnQuest 12636
    .target Alchemist Karloff
step
    .goto ScarletEnclave,51.3,35.1
    >>与|cRXP_FRIENDLY_巫妖王|r谈话
    .turnin 12636 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯之眼|r
    .target The Lich King
    .accept 12641 >>接任务: |cRXP_LOOT_天降厄运|r
step
	#label dkeyes
	#completewith next
    .goto ScarletEnclave,51.1,36.2
    .goto ScarletEnclave,61.5,60.6,0
	>>点击巫妖王左侧或右侧的眼球
	>>使用“阿彻鲁斯之吸管”(1)来分析熔炉. 使用“幽影斗篷”(3)来避免受到猩红教徒的伤害
    .complete 12641,1 --New Avalon Forge Analyzed (1)
step
    .goto ScarletEnclave,61.7,68.2,0
	>>使用“阿彻鲁斯虹吸”(1)来分析要塞. 使用“裹尸布”(3)以避免受到猩红军团怪物的伤害
    .complete 12641,3 --Scarlet Hold Analyzed (1)
step
    .goto ScarletEnclave,53.4,70.7,0
	>>使用“阿彻鲁斯之吸”(1)来分析市政厅. 使用“阴影斗篷”(3)以避免受到猩红教徒的伤害
    .complete 12641,2 --New Avalon Town Hall Analyzed (1)
step
    .goto ScarletEnclave,52.2,80.7,0
	>>使用“阿彻鲁斯之吸管”(1)来分析教堂. 使用“裹尸布”(3)以避免受到猩红教徒的伤害
    .complete 12641,4 --Chapel of the Crimson Flame Analyzed (1)
--X NEED A NEW COMMAND FOR THESE PREVIOUS 4 STEPS
step
	#completewith next
 	+完成后按“取消”或(4)返回黑锋要塞
step
	#requires dkeyes
    .goto ScarletEnclave,51.3,35.3
    >>与|cRXP_FRIENDLY_巫妖王|r谈话
    .turnin 12641 >>交任务: |cRXP_FRIENDLY_天降厄运|r
    .target The Lich King
    .accept 12657 >>接任务: |cRXP_LOOT_天灾的力量|r
step
	#completewith next
    .goto ScarletEnclave,50.5,33.4,10 >>跑进紫色传送门
step
    .goto ScarletEnclave,48.871,29.739
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12657 >>交任务: |cRXP_FRIENDLY_天灾的力量|r
    .target Highlord Darion Mograine
    .accept 12850 >>接任务: |cRXP_LOOT_向天灾指挥官萨拉诺尔报到|r
step
    .goto ScarletEnclave,51.0,34.6
    >>与|cRXP_FRIENDLY_天灾指挥官萨拉诺尔|r交谈
    .turnin 12850 >>交任务: |cRXP_FRIENDLY_向天灾指挥官萨拉诺尔报到|r
    .target Scourge Commander Thalanor
    .accept 12670 >>接任务: |cRXP_LOOT_血色收割|r
step
	#completewith next
    .goto ScarletEnclave,52.0,35.0
    .fly >>点击天灾狮鹫前往死亡裂口
step
    .goto ScarletEnclave,52.3,33.9
    >>与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12670 >>交任务: |cRXP_FRIENDLY_血色收割|r
    .target Prince Valanar
    .accept 12678 >>接任务: |cRXP_LOOT_混乱战车，苦痛驭之|r
step
	#completewith next
    .goto ScarletEnclave,53.2,33.5,0
    .goto ScarletEnclave,51.4,36.1,0
    .target Salanar the Horseman
    >>与骑手萨拉纳尔交谈|cRXP_FRIENDLY_Salanar|r
    .accept 12680 >>接任务: |cRXP_LOOT_阿彻鲁斯战马|r
step
    .goto ScarletEnclave,54.5,34.2
    .target Olrun the Battlecaller
    >>与|cRXP_FRIENDLY_战斗召唤者奥尔伦|r交谈
    .accept 12733 >>接任务: |cRXP_LOOT_死亡的挑战|r
step
    .goto ScarletEnclave,53.2,33.5,30,0
    .goto ScarletEnclave,51.4,36.1
    .target Salanar the Horseman
    >>与骑手萨拉纳尔交谈|cRXP_FRIENDLY_Salanar|r
    .accept 12680 >>接任务: |cRXP_LOOT_阿彻鲁斯战马|r
step
    .goto ScarletEnclave,53.7,36.3,50,0
    .goto ScarletEnclave,52.1,38.2
    .target Orithos the Sky Darkener
    >>与|cRXP_FRIENDLY_遮天者奥里索斯|r交谈
    .accept 12679 >>接任务: |cRXP_LOOT_今夜，我们在海文郡欢宴！|r
step
	#completewith next
    .goto ScarletEnclave,55.6,51.4
	>>击杀该区域的猩红教徒和海文郡居民. 拾取地上掉落的萨罗尼特箭矢
	.complete 12678,1 --Scarlet Crusader (10)
    .complete 12678,2 --Citizen of Havenshire (10)
    .complete 12679,1 --Saronite Arrow (15)
step
	#completewith next
    .goto ScarletEnclave,57.4,42.3
	.vehicle >>偷取任意海文郡马匹. 注意马厩管理员基特里克正在马匹区域巡逻, 他是一名精英
step
    .goto ScarletEnclave,52.4,34.3
	>>将偷来的马送回死亡裂口. 使用“疾驰”(2)在冷却完毕时加快移动速度. 使用“归还偷来的马”(1)完成任务交付
    .complete 12680,1 --Horse Successfully Stolen (1)
step
    .goto ScarletEnclave,53.2,33.5,30,0
    .goto ScarletEnclave,51.4,36.1
    >>与骑手萨拉纳尔交谈|cRXP_FRIENDLY_Salanar|r
    .turnin 12680 >>交任务: |cRXP_FRIENDLY_阿彻鲁斯战马|r
    .target Salanar the Horseman
    .accept 12687 >>接任务: |cRXP_LOOT_进入暗影界|r
step
	#completewith next
    .goto ScarletEnclave,54.6,46.4
    .vehicle >>击杀一名阿彻鲁斯黑暗骑士, 击杀后骑上他的黑色骸骨战马
step
    .goto ScarletEnclave,52.4,34.7
	>>将阿彻鲁斯死亡战马送回死亡裂隙. 使用“骑士的召唤”(1)将其传送回去
    .complete 12687,1 --The Horseman's Challenge (1)
step
    .goto ScarletEnclave,53.2,33.5,30,0
    .goto ScarletEnclave,51.4,36.1
    .target Salanar the Horseman
    >>与骑手萨拉纳尔交谈|cRXP_FRIENDLY_Salanar|r
    .turnin 12687 >>交任务: |cRXP_FRIENDLY_进入暗影界|r
step
	#completewith next
	.cast 48778 >>进入角色面板(C), 然后切换到收藏选项卡. 召唤你的黑色骸骨战马, 然后将其绑定到快捷栏上
step
	#completewith Mailbox
    .goto ScarletEnclave,55.6,51.4,0
	>>击杀海文郡区域内的平民. 搜刮该区域地面上的萨罗尼特箭矢
    .complete 12678,2 --Citizen of Havenshire (10)
    .complete 12679,1 --Saronite Arrow (15)
step
    .goto ScarletEnclave,55.9,38.8,50,0
    .goto ScarletEnclave,53.9,45.6
	>>击杀该区域内的猩红军团敌人
	.complete 12678,1 --Scarlet Crusader (10)
step
	#sticky
	#label Citizens
    .goto ScarletEnclave,56.0,58.8,0,0
	>>击杀该地区逃跑的海文郡居民
    .complete 12678,2 --Citizen of Havenshire (10)
step
    .goto ScarletEnclave,56.1,51.9
	>>搜刮战场上地面的箭矢
    .complete 12679,1 --Saronite Arrow (15)
step
	#requires Citizens
    .goto ScarletEnclave,51.9,35.4,30,0
    .goto ScarletEnclave,51.0,33.6,30,0
    .goto ScarletEnclave,53.8,30.9,30,0
    .goto ScarletEnclave,51.9,35.4
    >>与|cRXP_FRIENDLY_死亡骑士新兵|r交谈, 然后在决斗中击败他们
	>>|cRXP_WARN_不要跑出30码的决斗范围|r
    .complete 12733,1 --Death Knights defeated in a duel (5)
	.skipgossip
    .target Death Knight Initiate
step
	#requires Citizens
	>>骑回死亡裂口
    .target Orithos the Sky Darkener
    >>与|cRXP_FRIENDLY_遮天者奥里索斯|r交谈
    .turnin 12679 >>交任务: |cRXP_FRIENDLY_今夜，我们在海文郡欢宴！|r
    .goto ScarletEnclave,53.3,36.8
    .target Olrun the Battlecaller
    >>与|cRXP_FRIENDLY_战斗召唤者奥尔伦|r交谈
    .turnin 12733 >>交任务: |cRXP_FRIENDLY_死亡的挑战|r
    .goto ScarletEnclave,54.5,34.5
    >>与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12678 >>交任务: |cRXP_FRIENDLY_混乱战车，苦痛驭之|r
    .accept 12697 >>接任务: |cRXP_LOOT_收割者戈提克|r
    .target Prince Valanar
    .goto ScarletEnclave,52.273,33.967
step
    .goto ScarletEnclave,54.0,35.0
    >>与|cRXP_FRIENDLY_收割者戈提克|r交谈
    .turnin 12697 >>交任务: |cRXP_FRIENDLY_收割者戈提克|r
    .target Gothik the Harvester
    .accept 12698 >>接任务: |cRXP_LOOT_收割者的礼物|r
step
	#completewith next
	.use 39253
	+进入海文郡矿场. 在未处于战斗状态的血色矿工身上使用背包中的“收割者的礼物”, 直到有5个食尸鬼跟随你, 然后返回死亡裂隙
    .goto ScarletEnclave,58.4,30.9,30,0
    .goto ScarletEnclave,60.0,31.6,30,0
    .goto ScarletEnclave,61.6,27.5,0
step
	.goto ScarletEnclave,54.1,34.9
	>>将所有5只食尸鬼送回死亡裂口的哥提克
    .complete 12698,1 --Scarlet Ghoul Returned (5)
    .turnin 12698 >>交任务: |cRXP_FRIENDLY_收割者的礼物|r
    .accept 12700 >>接任务: |cRXP_LOOT_伺机待发|r
step
    .goto ScarletEnclave,52.273,33.967
    >>与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12700 >>交任务: |cRXP_FRIENDLY_伺机待发|r
    .target Prince Valanar
    .accept 12701 >>接任务: |cRXP_LOOT_炮轰圣光哨站|r
step
    .goto ScarletEnclave,60.2,32.7,40,0
    .goto ScarletEnclave,63.5,32.3,20,0
    .goto ScarletEnclave,67.7,39.1
    >>跑过矿场, 从山上跳下, 然后绕到圣光哨站后面. 在那儿继续跳下山, 接着跑向船只. 避开所有非矿工的怪物. 如果死亡, 请等待瓦尔克复活你(切勿释放灵魂)
	>>到达飞船后, 进入其中一门猩红大炮. 不断使用“猩红大炮”(1)击杀血色防御者. 若血色防御者开始近战攻击大炮, 请使用“电磁脉冲”(2)
    .complete 12701,1 --Scarlet Defender (100)
step
	#completewith next
	.vehicle >>当你杀死了全部100名守卫后, 使用“骷髅狮鹫逃脱”(3)返回死亡之域
step
    .goto ScarletEnclave,52.3,34.1
    >>与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12701 >>交任务: |cRXP_FRIENDLY_炮轰圣光哨站|r
    .target Prince Valanar
    .accept 12706 >>接任务: |cRXP_LOOT_死亡裂口大捷！|r
step << skip
    .hs >>返回阿彻鲁斯(你的炉石会自动设置在此处)
--X Flight timer is 15s on retail, so i think its slightly faster. Didn't get a hearthstone on my retail run either
step << skip
	#completewith next
	.goto ScarletEnclave,50.5,33.4,10 >>使用传送器下楼
step
	#completewith next
    .goto ScarletEnclave,53.1,32.5
	.fly >>乘坐其中一只天灾狮鹫返回阿彻鲁斯
step
    .goto ScarletEnclave,48.9,29.9
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12706 >>交任务: |cRXP_FRIENDLY_死亡裂口大捷！|r
    .target Highlord Darion Mograine
    .accept 12714 >>接任务: |cRXP_LOOT_巫妖王的意志|r
step
    .goto ScarletEnclave,47.472,26.550
    .target Lord Thorval
    >>与|cRXP_FRIENDLY_索瓦尔勋爵|r交谈
	.turnin 12849 >>交任务: |cRXP_FRIENDLY_鲜血、冰霜与邪恶的力量|r
	.trainer >>训练你的职业法术
step
    .goto ScarletEnclave,47.472,26.550
    .target Lord Thorval
    >>与|cRXP_FRIENDLY_索瓦尔勋爵|r交谈
	.turnin 12849 >>交任务: |cRXP_FRIENDLY_鲜血、冰霜与邪恶的力量|r
step
	#completewith next
    .goto ScarletEnclave,52.1,35.0
    .fly >>点击狮鹫返回死亡裂口
step
    .goto ScarletEnclave,53.4,36.5
    >>与|cRXP_FRIENDLY_瓦拉纳王子|r交谈
    .turnin 12714 >>交任务: |cRXP_FRIENDLY_巫妖王的意志|r
    .target Prince Valanar
    .accept 12715 >>接任务: |cRXP_LOOT_追忆墓穴|r
step << wotlk
    .goto ScarletEnclave,52.9,35.2
    >>购买40份尸尘
    .collect 37201,40
step
    .goto ScarletEnclave,55.3,46.2
	>>点击邮箱上的字母
    .turnin 12711 >>交任务: |cRXP_FRIENDLY_被遗弃的信件|r
step
    .goto ScarletEnclave,55.8,52.4
    .target Noth the Plaguebringer
    >>与|cRXP_FRIENDLY_瘟疫使者诺斯|r交谈
    .accept 12716 >>接任务: |cRXP_LOOT_药剂师的要求|r
step
    .goto ScarletEnclave,53.9,58.1,15,0
	>>前往追忆墓穴底部
    >>与|cRXP_FRIENDLY_凯雷塞斯王子|r交谈
    .turnin 12715 >>交任务: |cRXP_FRIENDLY_追忆墓穴|r
    .target Prince Keleseth
    .accept 12719 >>接任务: |cRXP_LOOT_无路可逃，无处可藏|r
    .goto ScarletEnclave,54.3,57.4
    .target Baron Rivendare
    >>与|cRXP_FRIENDLY_瑞文戴尔男爵|r交谈
    .accept 12722 >>接任务: |cRXP_LOOT_羊入虎口|r
    .goto ScarletEnclave,54.6,57.4
step
	#completewith next
	>>击杀新阿瓦隆市民和血色十字军的怪物, 搜刮他们的头骨. 稍后完成此任务
    .complete 12716,3 --Crusader Skull (10)
    .complete 12722,2 --Citizen of New Avalon (15)
    .complete 12722,1 --Scarlet Crusade Soldier (10)
step
    .goto ScarletEnclave,53.1,71.1,20,0
	>>进入议政厅, 杀死市长昆比, 搜刮他旁边桌上的书
    .complete 12719,1 --Mayor Quimby (1)
    .goto ScarletEnclave,52.2,71.2
    .complete 12719,2 --New Avalon Registry (1)
    .goto ScarletEnclave,52.5,71.0
step
    .goto ScarletEnclave,53.9,58.1,15,0
	>>骑马返回墓穴
    >>与|cRXP_FRIENDLY_凯雷塞斯王子|r交谈
    .turnin 12719 >>交任务: |cRXP_FRIENDLY_无路可逃，无处可藏|r
.target Prince Keleseth
    .accept 12720 >>接任务: |cRXP_LOOT_说服者|r
    .goto ScarletEnclave,54.3,57.4
step
	#completewith Dawn
	>>击杀新阿瓦隆市民与血色十字军的怪物, 掠夺他们的头骨
    .complete 12716,3 --Crusader Skull (10)
    .complete 12722,2 --Citizen of New Avalon (15)
    .complete 12722,1 --Scarlet Crusade Soldier (10)
step
    .goto ScarletEnclave,62.0,60.3
	>>在铁匠铺内墙上的链子上获取战利品
    .complete 12716,2 --Iron Chain (1)
step
    .goto ScarletEnclave,57.8,61.8
	>>在旅店地下室的锅中获取战利品
    .complete 12716,1 --Empty Cauldron (1)
step
	#completewith next
    	.use 39418
	+打开背包中的精致的珠宝箱, 将其中的两件凯雷塞斯的说服者装备上去
--X objective step for use/equip
step
	#label Dawn
    .goto ScarletEnclave,62.4,68.2
	>>装备上凯雷塞斯的说服者后, 攻击猩红军团成员——持续击杀他们, 直到其中一人告知你信息(当任务目标完成后, 他们会变为中立状态)
    .complete 12720,1 --"Crimson Dawn" Revealed (1)
step
	#completewith Soldiers
	>>搜集新阿瓦隆类人生物的头骨
    .complete 12716,3 --Crusader Skull (10)
step
	#completewith next
    .goto ScarletEnclave,62.7,68.4
	>>击杀该区域内的血色十字军士兵
    .complete 12722,1 --Scarlet Crusade Soldier (10)
step
    .goto ScarletEnclave,57.8,67.8,30,0
    .goto ScarletEnclave,56.9,68.5,30,0
    .goto ScarletEnclave,55.5,68.3,30,0
    .goto ScarletEnclave,53.9,71.9,30,0
    .goto ScarletEnclave,53.0,69.7
	>>击杀该区域的新阿瓦隆市民
    .complete 12722,2 --Citizen of New Avalon (15)
step
	#label Soldiers
    .goto ScarletEnclave,62.7,68.4
	>>击杀该区域内的血色十字军士兵
    .complete 12722,1 --Scarlet Crusade Soldier (10)
step
    .goto ScarletEnclave,53.0,69.7
	>>搜集新阿瓦隆类人生物的头骨
    .complete 12716,3 --Crusader Skull (10)
step
    >>与|cRXP_FRIENDLY_瘟疫使者诺斯|r交谈
    .turnin 12716 >>交任务: |cRXP_FRIENDLY_药剂师的要求|r
    .target Noth the Plaguebringer
    .accept 12717 >>接任务: |cRXP_LOOT_诺斯的特殊药剂|r
    .goto ScarletEnclave,55.893,52.400
    .turnin 12717 >>交任务: |cRXP_FRIENDLY_诺斯的特殊药剂|r
    .goto ScarletEnclave,56.2,52.0
step
    .goto ScarletEnclave,56.2,52.0
	>>再次点击坩埚, 获取更多诺斯的特殊药剂
	.turnin 12718 >>交任务: |cRXP_FRIENDLY_更多的徽记|r
    .itemcount 39328,20
step
    .goto ScarletEnclave,53.9,58.1,15,0
	>>骑马返回墓穴. 重新装备你的普通武器. 将诺斯的特殊药剂绑定到快捷栏上
    .target Baron Rivendare
    >>与|cRXP_FRIENDLY_瑞文戴尔男爵|r交谈
	.turnin 12722 >>交任务: |cRXP_FRIENDLY_羊入虎口|r
	.goto ScarletEnclave,54.6,57.5
    >>与|cRXP_FRIENDLY_凯雷塞斯王子|r交谈
    .turnin 12720 >>交任务: |cRXP_FRIENDLY_说服者|r
    .target Prince Keleseth
    .accept 12723 >>接任务: |cRXP_LOOT_深入血色敌后|r
    .goto ScarletEnclave,54.2,57.4
step
	>>骑马前往房屋, 然后上楼到达二楼
    >>与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12723 >>交任务: |cRXP_FRIENDLY_深入血色敌后|r
    .target Orbaz Bloodbane
    .accept 12724 >>接任务: |cRXP_LOOT_十字军的巡逻路线|r
    .goto ScarletEnclave,56.3,79.8
    .target Thassarian
    >>与|cRXP_FRIENDLY_萨萨里安|r交谈
    .accept 12725 >>接任务: |cRXP_LOOT_死亡骑士的兄弟情谊|r
    .goto ScarletEnclave,56.3,80.0
step
    .goto ScarletEnclave,62.8,68.6,15,0
    .goto ScarletEnclave,63.0,68.0
	>>前往血色城堡的地下室, 与科尔蒂拉·死织者交谈. 途中请避免与怪物战斗——若不幸死亡, 请让瓦尔基尔复活你(切勿释放)
	>>开始任务后不要保护库尔蒂拉, 这不是护送任务
    >>与|cRXP_FRIENDLY_库尔迪拉·织亡者|r交谈
    .turnin 12725 >>交任务: |cRXP_FRIENDLY_死亡骑士的兄弟情谊|r
    .target Koltira Deathweaver
    .accept 12727 >>接任务: |cRXP_LOOT_杀出一条血路|r
step
	#completewith next
    .goto ScarletEnclave,63.1,68.2,15,0
    .goto ScarletEnclave,62.7,68.6,15,0
    .goto ScarletEnclave,62.9,68.3
	>>不要防守库尔蒂拉, 而是前往顶层. 在桌子上拾取巡逻日程表
    .complete 12724,1 --New Avalon Patrol Schedule (1)
step
	.goto ScarletEnclave,63.0,68.0
	>>回到科尔提拉·死语那里. 击杀瓦尔罗斯. 从地上拾取他的头颅
	>>在等待瓦尔罗斯出现的过程中, 你可能需要击杀攻击科尔提拉的小怪
    .complete 12727,1 --Valroth's Head (1)
step
    .goto ScarletEnclave,63.1,68.2,15,0
    .goto ScarletEnclave,62.7,68.6,15,0
    .goto ScarletEnclave,62.9,68.3
	>>前往顶层, 拾取桌上的巡逻安排表
    .complete 12724,1 --New Avalon Patrol Schedule (1)
step
    .goto ScarletEnclave,56.2,52.0
	>>再次点击坩埚, 获取更多诺斯的特殊药剂
	.turnin 12718 >>交任务: |cRXP_FRIENDLY_更多的徽记|r
    .itemcount 39328,20
step
	#completewith next
	.destroy 39328 >>摧毁: |cRXP_ENEMY_十字军徽记|r
step
	>>返回房屋的二楼
    .target Orbaz Bloodbane
    >>与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12724 >>交任务: |cRXP_FRIENDLY_十字军的巡逻路线|r
    .goto ScarletEnclave,56.3,79.8
    >>与|cRXP_FRIENDLY_萨萨里安|r交谈
    .turnin 12727 >>交任务: |cRXP_FRIENDLY_杀出一条血路|r
    .target Thassarian
    .accept 12738 >>接任务: |cRXP_LOOT_复仇的呐喊！|r
    .goto ScarletEnclave,56.3,80.0
step
    .goto ScarletEnclave,52.6,80.7,40,0
    .goto ScarletEnclave,53.1,82.1
	>>骑马离开房屋前往教堂. 与瘟疫之拳交谈
    >>与|cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r交谈
    .turnin 12738 >>交任务: |cRXP_FRIENDLY_复仇的呐喊！|r
    .target Knight Commander Plaguefist
    .accept 12748 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Orc
    .accept 12739 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Tauren
    .accept 12742 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Human
    .accept 12743 >>接任务: |cRXP_LOOT_特殊的怜悯|r << NightElf
    .accept 12744 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Dwarf
    .accept 12745 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Gnome
    .accept 12746 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Draenei
    .accept 12747 >>接任务: |cRXP_LOOT_特殊的怜悯|r << BloodElf
    .accept 12749 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Troll
    .accept 12750 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Undead
    .accept 28649 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Worgen
    .accept 28650 >>接任务: |cRXP_LOOT_特殊的怜悯|r << Goblin
step << Orc
    .goto ScarletEnclave,53.8,83.4
	>>站在库格面前, 等待剧情动画结束, 随后击杀他
    .complete 12748,1 --Kug Ironjaw (1)
step << Tauren
    .goto ScarletEnclave,54.4,83.4
	>>站在马拉尔面前, 等待剧情动画结束, 随后将其击杀
    .complete 12739,1 -- Malar Bravehorn (1)
step << Human
    .goto ScarletEnclave,53.6,83.6
	>>站在艾伦面前, 等待剧情动画结束, 然后杀死她
    .complete 12742,1 --Ellen Stanbridge  (1)
step << NightElf
    .goto ScarletEnclave,54.2,83.8
	>>站在亚兹米娜面前, 等待剧情动画结束, 之后杀死她
    .complete 12743,1 -- Yazmina Oakenthorn (1)
step << Dwarf
    .goto ScarletEnclave,54.0,83.4
	>>站在唐诺万面前, 等待剧情动画结束, 之后杀死他
    .complete 12744,1 --Donovan Pulfrost (1)
step << Gnome
    .goto ScarletEnclave,54.0,83.4
	>>站在戈比面前, 等待剧情播放完成, 结束后杀掉他
    .complete 12745,1 -- Goby Blastenheimer  (1)
step << Draenei
    .goto ScarletEnclave,54.4,83.4
	>>站在瓦洛克面前, 等待剧情播放结束, 之后击杀他
    .complete 12746,1 -- Valok the Righteous (1)
step << BloodElf
    .goto ScarletEnclave,54.2,83.4
	>>站在艾欧妮丝女士面前, 等待剧情动画结束, 随后击杀她
    .complete 12747,1 --Lady Eonys (1)
step << Troll
    .goto ScarletEnclave,53.8,83.4
	>>站在伊吉面前, 等待剧情动画完成, 之后杀死他
    .complete 12749,1 --Iggy Darktusk(1)
step << Undead
    .goto ScarletEnclave,53.6,83.4
	>>站在安托万面前, 等待剧情动画结束, 之后杀掉他
    .complete 12750,1 -- Antoine Brack (1)
step << Worgen
    .goto ScarletEnclave,54.145,83.282
	>>站在哈尔福特勋爵面前, 等待剧情对话结束, 随后击杀他
    .complete 28649,1 -- Lord Harford (1)
step << Goblin
    .goto ScarletEnclave,54.111,83.756
	>>站在加里·顽渍面前, 等待剧情动画播放完毕, 随后将其击杀
    .complete 28650,1 -- Gally Lumpstain (1)
step
    .goto ScarletEnclave,53.1,82.1
	>>返回瘟疫之拳
    >>与|cRXP_FRIENDLY_骑士团指挥官普雷菲斯特|r交谈
    .turnin 12748 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Orc
    .turnin 12739 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Tauren
    .turnin 12742 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Human
    .turnin 12743 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Nightelf
    .turnin 12744 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Dwarf
    .turnin 12745 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Gnome
    .turnin 12746 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Draenei
    .turnin 12747 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Bloodelf
    .turnin 12749 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Troll
    .turnin 12750 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Undead
    .turnin 28649 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Worgen
    .turnin 28650 >>交任务: |cRXP_FRIENDLY_特殊的怜悯|r << Goblin
    .target Knight Commander Plaguefist
	.accept 12751 >>接任务: |cRXP_LOOT_欢迎回家|r
step
    .goto ScarletEnclave,56.3,80.0
	>>返回房屋二楼
    .target Thassarian
    >>与|cRXP_FRIENDLY_萨萨里安|r交谈
    .turnin 12751 >>交任务: |cRXP_FRIENDLY_欢迎回家|r
    .goto ScarletEnclave,56.3,80.0
    .target Orbaz Bloodbane
    >>与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .accept 12754 >>接任务: |cRXP_LOOT_悬崖伏击|r
    .goto ScarletEnclave,56.3,79.8
step
	.use 39645 >>使用背包中的伪装工具, 击杀猩红信使
    .goto ScarletEnclave,60.0,77.0
    .complete 12754,1 --Scarlet Courier's Belongings (1)
    .complete 12754,2 --Scarlet Courier's Message (1)
step
    .goto ScarletEnclave,56.3,79.8
	>>返回房屋二楼
    >>与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12754 >>交任务: |cRXP_FRIENDLY_悬崖伏击|r
    .target Orbaz Bloodbane
    .accept 12755 >>接任务: |cRXP_LOOT_命运的交汇点|r
step
    .goto ScarletEnclave,65.6,83.9
	>>一路骑乘到海滩上的|cRXP_FRIENDLY_阿比迪斯|r
    >>与 |cRXP_FRIENDLY_阿比迪斯将军|r 交谈
    .turnin 12755 >>交任务: |cRXP_FRIENDLY_命运的交汇点|r
    .target High General Abbendis
    .accept 12756 >>接任务: |cRXP_LOOT_血色先锋军|r
step
    .goto ScarletEnclave,56.3,79.8
	>>返回房屋二楼
    >>与|cRXP_FRIENDLY_奥尔巴兹·血毒|r交谈
    .turnin 12756 >>交任务: |cRXP_FRIENDLY_血色先锋军|r
    .target Orbaz Bloodbane
    .accept 12757 >>接任务: |cRXP_LOOT_血色十字军进犯……|r
step
	#completewith next
    .goto ScarletEnclave,50.0,32.3,20 >>等待奥尔巴兹召唤传送门, 点击通往阿彻鲁斯的传送门返回指挥大厅
step
    .goto ScarletEnclave,48.9,29.9
	>>返回达里安·莫格莱尼处
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12757 >>交任务: |cRXP_FRIENDLY_血色十字军进犯……|r
    .target Highlord Darion Mograine
    .accept 12778 >>接任务: |cRXP_LOOT_血色十字军的末日|r
step
    .goto ScarletEnclave,47.4,26.8
	.trainer >>训练你的职业法术
--X SPELL IDS BASED ON SPECIALIZATION, COPY PASTE THIS FROM EARLIER
step
    .goto ScarletEnclave,52.0,35.0
    .fly >>点击狮鹫返回死亡裂口
step
    .goto ScarletEnclave,53.5,36.8
    >>与|cRXP_FRIENDLY_巫妖王|r谈话
    .turnin 12778 >>交任务: |cRXP_FRIENDLY_血色十字军的末日|r
    .target The Lich King
    .accept 12779 >>接任务: |cRXP_LOOT_万物的终结……|r
step
	#completewith next
	.use 39700
	.vehicle >>使用[冰霜巨龙号角]骑上冰霜飞龙
step
	>>施放“冰冻死亡之箭”(1)造成伤害(不要频繁使用). 使用“吞噬人形生物”(2)在近战范围内拾取一名血色士兵, 以恢复生命值和法力值. 击杀被血色士兵包围的弩炮
    .goto ScarletEnclave,56.0,62.2,100,0
    .goto ScarletEnclave,55.4,64.8,100,0
    .goto ScarletEnclave,54.8,66.8,100,0
    .goto ScarletEnclave,54.6,69.9,100,0
    .goto ScarletEnclave,54.4,75.6,100,0
    .goto ScarletEnclave,57.0,74.8,100,0
    .goto ScarletEnclave,57.3,71.8,100,0
    .goto ScarletEnclave,60.0,72.2,100,0
    .goto ScarletEnclave,62.6,75.1,100,0
    .goto ScarletEnclave,59.5,66.1,100,0
    .goto ScarletEnclave,59.5,60.2,100,0
    .goto ScarletEnclave,56.0,62.2,100,0
    .goto ScarletEnclave,55.4,64.8,100,0
    .goto ScarletEnclave,54.8,66.8
    .complete 12779,2 --Scarlet Ballista destroyed (10)
    .complete 12779,1 --Scarlet Soldiers (150)
step
	>>飞回巫妖王那里
    .goto ScarletEnclave,53.5,36.8
    >>与|cRXP_FRIENDLY_巫妖王|r谈话
    .turnin 12779 >>交任务: |cRXP_FRIENDLY_万物的终结……|r
    .target The Lich King
    .accept 12800 >>接任务: |cRXP_LOOT_巫妖王的命令|r
step
    .goto ScarletEnclave,49.3,28.7,45,0
    .goto ScarletEnclave,47.1,24.1,45,0
    .goto ScarletEnclave,34.1,30.4
	>>跑过北方的剧毒小径, 骑马前往布洛米尔, 与萨拉诺交谈
    >>与|cRXP_FRIENDLY_天灾指挥官萨拉诺尔|r交谈
    .turnin 12800 >>交任务: |cRXP_FRIENDLY_巫妖王的命令|r
    .target Scourge Commander Thalanor
    .accept 12801 >>接任务: |cRXP_LOOT_黎明之光|r
step
	#completewith next
	+与大领主达里安·莫格莱尼交谈以开启事件
	.skipgossip 29173,2
step
    .goto ScarletEnclave,39.0,38.5
	>>等待活动开始(此期间可休息). 完成这场漫长的战斗与角色扮演
    .complete 12801,1 --The Light of Dawn Uncovered (1)
step
    .goto Eastern Plaguelands,39,39
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 12801 >>交任务: |cRXP_FRIENDLY_黎明之光|r
    .target Highlord Darion Mograine
    .accept 13165 >>接任务: |cRXP_LOOT_夺回阿彻鲁斯|r
step
	#completewith next
	.cast 50977 >>使用你的死亡之门法术返回黑锋要塞
step
    .goto Eastern Plaguelands,83.4,49.4
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 13165 >>交任务: |cRXP_FRIENDLY_夺回阿彻鲁斯|r
    .target Highlord Darion Mograine
    .accept 13166 >>接任务: |cRXP_LOOT_黑锋要塞之战|r
    .train 48721 >>训练你的职业法术
	.xp <58,1
step
    .goto Eastern Plaguelands,83.4,49.4
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 13165 >>交任务: |cRXP_FRIENDLY_夺回阿彻鲁斯|r
    .target Highlord Darion Mograine
    .accept 13166 >>接任务: |cRXP_LOOT_黑锋要塞之战|r
	.xp <57,1
step
	#completewith next
    .goto ScarletEnclave,50.3,33.1,8 >>穿过传送门
step
    #sticky
    #label Cinderglacier
    .cast 53341 >>确保你已装备好新武器. 在房间内的任意符文熔炉处, 用“冰川符文”为你的新武器附魔
step
	#completewith next
	>>击杀黑锋要塞主楼层内的亡灵敌人|cRXP_ENEMY_Scourge|r
    .goto ScarletEnclave,48.1,28.4,0,0
    .complete 13166,2 --Scourge (10)
step
    .goto ScarletEnclave,48.871,29.739
	>>击杀位于黑锋要塞主楼层中央的帕奇维克
    .complete 13166,1 --Patchwerk (1)
step
	>>击杀黑锋要塞主楼层内的亡灵敌人|cRXP_ENEMY_Scourge|r
    .goto ScarletEnclave,48.1,28.4
    .complete 13166,2 --Scourge (10)
step
    #requires Cinderglacier
	#completewith next
    .goto ScarletEnclave,50.5,33.4,10 >>跑进紫色传送门
step
    #requires Cinderglacier
    .goto ScarletEnclave,50.7,33.7
	>>返回达里安·莫格莱尼处
    >>与|cRXP_FRIENDLY_大领主达里安·莫格莱尼|r交谈
    .turnin 13166 >>交任务: |cRXP_FRIENDLY_黑锋要塞之战|r
    .target Highlord Darion Mograine
    .accept 13188 >>接任务: |cRXP_LOOT_王者之城|r << Alliance
    .accept 13189 >>接任务: |cRXP_LOOT_酋长的祝福|r << Horde
step << Horde
    .goto ScarletEnclave,52.1,35.0
	.zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
step << Horde
    .goto Orgrimmar,31.74,37.82
    .target Thrall
    >>与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 13189 >>交任务: |cRXP_FRIENDLY_酋长的祝福|r
step << Horde
    .goto Orgrimmar,38.1,85.8
	.zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step << Alliance
    .goto ScarletEnclave,50.9,36.3
	.zone Elwynn Forest >>前往: |cRXP_PICK_暴风城|r
step << Alliance
    .goto Stormwind City,79.989,38.468
    .target King Varian Wrynn
    >>与|cRXP_FRIENDLY_瓦里安·乌瑞恩国王|r交谈
    .turnin 13188 >>交任务: |cRXP_FRIENDLY_王者之城|r
step << Alliance
    .goto Stormwind City,48.99,87.36
	.zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
]])