RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 熔火冲击 - 8(莫高雷)
#displayname Molten Blast
#next 熔岩鞭笞 - 10(莫高雷)


step
    +|cRXP_WARN_你至少需达到 8 级, 才能单独在莫高雷获得|r|T133816:0|t[雕纹手套 - 熔岩冲击]|r
    >>|cRXP_WARN_你必须至少达到 3 级才能装备|r|T134918:0|t|cRXP_LOOT_[硫磺徽记]|r
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133816:0|t[雕纹手套 - 熔岩爆击]
    .train 425344,1
    .xp >3,1
step
    +|cRXP_WARN_你至少需达到 8 级, 才能单独在莫高雷获得|r|T133816:0|t[雕纹手套 - 熔岩冲击]|r
    .train 425344,1
    .xp <3,1
    .xp >8,1
step
    #loop
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 从他们身上搜刮出|cRXP_LOOT_Artifact Storage Key|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Bael'dun Appraisers|r会施放|r |T135929:0|t[治疗术] |cRXP_WARN_(远程施法:为自己或附近生命值低于50%的敌人恢复约75点生命值)|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
    .xp <3,1
--XX WIP to here
step
    .goto Mulgore,31.56,49.54
    >>打开|cRXP_PICK_Artifact Storage|r宝箱, 获取 |T134918:0|t|cRXP_LOOT_[硫磺图标]|r
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step
    .equip 18,206388 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[硫磺徽记]|r
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step
    #loop
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
    .xp <3,1
    .xp >13,1
step
    #completewith Barrens
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 425344,1
    .xp <13,1
step
    #loop
    .goto The Barrens,53.94,25.86,50,0
    .goto The Barrens,54.17,25.06,50,0
    .goto The Barrens,54.86,25.43,50,0
    .goto The Barrens,55.62,25.71,50,0
    .goto The Barrens,55.98,26.36,50,0
    .goto The Barrens,55.71,27.21,50,0
    .goto The Barrens,55.44,27.35,50,0
    .goto The Barrens,54.99,26.79,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Razormane Thornweaver
    .mob Razormane Water Seeker
    .mob Razormane Hunter
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <13,1
    .xp >16,1
step
    #loop
    .goto The Barrens,55.97,16.17,50,0
    .goto The Barrens,55.43,16.15,50,0
    .goto The Barrens,54.10,15.51,50,0
    .goto The Barrens,53.10,15.25,50,0
    .goto The Barrens,53.73,13.77,50,0
    .goto The Barrens,55.09,15.00,50,0
    .goto The Barrens,55.62,14.86,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Hecklefang Hyena
    .mob Savannah Prowler
    .mob Savannah Huntress
    .mob Sunscale Screecher
    .mob Barrens Giraffe
    .mob Fleeting Plainstrider
    .mob Zhevra Runner
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <16,1
    .xp >20,1
step
    #label Barrens
    #loop
    .goto The Barrens,40.03,15.36,50,0
    .goto The Barrens,39.39,14.65,50,0
    .goto The Barrens,39.62,11.77,50,0
    .goto The Barrens,38.84,11.93,50,0
    .goto The Barrens,38.44,13.21,50,0
    .goto The Barrens,38.48,14.85,50,0
    .goto The Barrens,37.33,16.23,50,0
    .goto The Barrens,38.64,17.49,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Witchwing Slayer
    .mob Witchwing Windcaller
    .mob Witchwing Ambusher
    .mob Witchwing Roguefeather
    .mob Serena Bloodfeather
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 425344,1
    .xp <3,1
step
    #loop
    .goto Stonetalon Mountains,64.17,57.16,50,0
    .goto Stonetalon Mountains,60.55,54.86,50,0
    .goto Stonetalon Mountains,60.95,51.21,50,0
    .goto Stonetalon Mountains,64.40,48.64,50,0
    .goto Stonetalon Mountains,66.18,52.01,50,0
    .goto Stonetalon Mountains,67.20,51.49,50,0
    .goto Stonetalon Mountains,66.83,45.34,50,0
    .goto Stonetalon Mountains,69.89,53.54,50,0
    .goto Stonetalon Mountains,70.84,56.97,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
    .mob Venture Co. Operator
    .mob Venture Co. Light Shredder
    .mob XT:9
    .mob XT:4
    .mob Deepmoss Webspinner
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[硫磺图标]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 熔岩冲击]
    .use 206388
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <3,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 熔岩爆破 - 10(杜隆塔尔)
#displayname Molten Blast
#next 大地之道 - 12(贫瘠之地)


    --Rune of Molten Blast
step
    +|cRXP_WARN_你必须至少达到10级才能获得|r|T133816:0|t[雕纹手套 - 熔岩爆击]|cRXP_WARN_因为这是训练的等级要求|r|T135813:0|t[火焰冲击]
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133816:0|t[雕纹手套 - 熔岩爆击]
    >>|cRXP_WARN_或者, 你可以在等级3及以上于莫高雷获得|r|T133816:0|t[雕文手套 - 熔岩冲击]|r
    .train 425344,1
    .xp >10,1
step
    #completewith IconS
    #label Durotar1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 425344,1
    .xp <10,1
step
    #completewith next
    #requires Durotar1
    #label Durotar2
    .goto Durotar,53.28,42.57,20,0
    .goto Durotar,54.42,42.59,15 >>前往|cRXP_FRIENDLY_斯瓦特|r内部
    .train 425344,1
    .xp <10,1
step
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .target Swart
    .train 425344,1
    .xp <10,1
step
    #completewith next
    #requires Durotar2
    .goto Durotar,58.69,45.53,40 >>前往|cRXP_ENEMY_Frozen Makrura|r方向
    .train 425344,1
    .xp <10,1
step
    #label IconS
    .goto Durotar,58.69,45.53
    >>|cRXP_WARN_在|cRXP_ENEMY_Frozen Makrura|r附近或普通聊天频道(输入 /1 进入聊天)寻找其他萨满祭司和术士或法师|r
    >>|cRXP_WARN_对|cRXP_ENEMY_Frozen Makrura|r施放 |T135813:0|t[火焰冲击]|cRXP_WARN_, 叠加一层 |T135805:0|t[加热]|cRXP_WARN_. 一次性叠加 5 层即可击杀|cRXP_ENEMY_Frozen Makrura|r. 击败后可拾取 |T134918:0|t|cRXP_LOOT_[硫磺图腾]|r
    >>|cRXP_WARN_或者, 你可以单独在莫高雷获得|r|T133816:0|t[雕纹手套 - 熔岩冲击]|r
    >>|cRXP_WARN_注意:|r|T135813:0|t[火舌武器]|cRXP_WARN_不会施加任何|r|T135805:0|t[施加热量]效果|r
    .collect 206388,1 --Sulfurous Icon (1)
    .mob Frozen Makrura
    .train 425344,1
    .xp <10,1
    .xp >12,1
step
    .goto Durotar,58.69,45.53
    >>|cRXP_WARN_在|cRXP_ENEMY_Frozen Makrura|r附近或普通聊天频道(输入 /1 进入聊天)寻找其他萨满祭司和术士或法师|r
    >>|cRXP_WARN_对|cRXP_ENEMY_Frozen Makrura|r施放 |T135813:0|t[火焰冲击]|cRXP_WARN_, 叠加一层 |T135805:0|t[加热]|cRXP_WARN_. 一次性叠加 5 层即可击杀|cRXP_ENEMY_Frozen Makrura|r. 击败后可拾取 |T134918:0|t|cRXP_LOOT_[硫磺图腾]|r
    >>|cRXP_WARN_或者, 你可以单独在莫高雷获得|r|T133816:0|t[雕纹手套 - 熔岩冲击]|r
    >>|cRXP_WARN_注意:|r|T135813:0|t[火舌武器]|cRXP_WARN_和|r|T135824:0|t[火焰新星图腾]|cRXP_WARN_不会叠加任何|r|T135805:0|t[施加热量]效果|r
    .collect 206388,1 --Sulfurous Icon (1)
    .mob Frozen Makrura
    .train 425344,1
    .xp <12,1
--XX Flametongue and Fire Nova doesn't seem to work
step
    .equip 18,206388 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[硫磺徽记]|r
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <10,1
step
    #loop
    .goto Durotar,56.87,53.05,50,0
    .goto Durotar,56.82,54.69,50,0
    .goto Durotar,58.64,53.86,50,0
    .goto Durotar,59.40,56.58,50,0
    .goto Durotar,58.41,58.17,50,0
    .goto Durotar,56.21,58.51,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <10,1
    .xp >11,1
step
    #completewith Barrens
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 425344,1
    .xp <10,1
step
    #loop
    .goto The Barrens,53.94,25.86,50,0
    .goto The Barrens,54.17,25.06,50,0
    .goto The Barrens,54.86,25.43,50,0
    .goto The Barrens,55.62,25.71,50,0
    .goto The Barrens,55.98,26.36,50,0
    .goto The Barrens,55.71,27.21,50,0
    .goto The Barrens,55.44,27.35,50,0
    .goto The Barrens,54.99,26.79,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Razormane Thornweaver
    .mob Razormane Water Seeker
    .mob Razormane Hunter
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <11,1
    .xp >16,1
step
    #loop
    .goto The Barrens,55.97,16.17,50,0
    .goto The Barrens,55.43,16.15,50,0
    .goto The Barrens,54.10,15.51,50,0
    .goto The Barrens,53.10,15.25,50,0
    .goto The Barrens,53.73,13.77,50,0
    .goto The Barrens,55.09,15.00,50,0
    .goto The Barrens,55.62,14.86,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Hecklefang Hyena
    .mob Savannah Prowler
    .mob Savannah Huntress
    .mob Sunscale Screecher
    .mob Barrens Giraffe
    .mob Fleeting Plainstrider
    .mob Zhevra Runner
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <16,1
    .xp >20,1
step
    #label Barrens
    #loop
    .goto The Barrens,40.03,15.36,50,0
    .goto The Barrens,39.39,14.65,50,0
    .goto The Barrens,39.62,11.77,50,0
    .goto The Barrens,38.84,11.93,50,0
    .goto The Barrens,38.44,13.21,50,0
    .goto The Barrens,38.48,14.85,50,0
    .goto The Barrens,37.33,16.23,50,0
    .goto The Barrens,38.64,17.49,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Witchwing Slayer
    .mob Witchwing Windcaller
    .mob Witchwing Ambusher
    .mob Witchwing Roguefeather
    .mob Serena Bloodfeather
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 425344,1
    .xp <10,1
step
    #loop
    .goto Stonetalon Mountains,64.17,57.16,50,0
    .goto Stonetalon Mountains,60.55,54.86,50,0
    .goto Stonetalon Mountains,60.95,51.21,50,0
    .goto Stonetalon Mountains,64.40,48.64,50,0
    .goto Stonetalon Mountains,66.18,52.01,50,0
    .goto Stonetalon Mountains,67.20,51.49,50,0
    .goto Stonetalon Mountains,66.83,45.34,50,0
    .goto Stonetalon Mountains,69.89,53.54,50,0
    .goto Stonetalon Mountains,70.84,56.97,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
    .mob Venture Co. Operator
    .mob Venture Co. Light Shredder
    .mob XT:9
    .mob XT:4
    .mob Deepmoss Webspinner
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[硫磺图标]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 熔岩冲击]
    .use 206388
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <10,1
--XX Cast ID may be wrong, may need to be checked
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 熔岩鞭笞 - 10(莫高雷)
#displayname Lava Lash
#next 祖先指引 - 10 (莫高雷)


    --Rune of Lava Lash
--XX Worth mentioning "Dual Wield Skill" in the name? Cuts off ingame due to it being 3 lines though
step
    +|cRXP_WARN_你至少需要达到10级, 才能在莫高雷单独获得|r|T133816:0|t[雕纹手套 - 熔岩猛击]|cRXP_WARN_和|r|T132147:0|t[双 wield]|r
    >>|cRXP_WARN_你必须至少达到4级, 因为这是开启任务线的等级要求|r
    >>|cRXP_WARN_你需要先升级才能尝试获取|r|T133816:0|t[雕纹手套 - 熔岩猛击]|cRXP_WARN_和|r|T132147:0|t[双武器专精]
    .train 410104,1
    .xp >4,1
step
    +|cRXP_WARN_你至少需要达到10级, 才能在莫高雷单独获得|r|T133816:0|t[雕纹手套 - 熔岩猛击]|cRXP_WARN_和|r|T132147:0|t[双 wield]|r
    >>|cRXP_WARN_你需要先升级才能尝试获取|r|T133816:0|t[雕纹手套 - 熔岩猛击]|cRXP_WARN_和|r|T132147:0|t[双武器专精]
    .train 410104,1
    .xp <4,1
    .xp >10,1
--XX WIP to here
step
    #completewith next
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .train 410104,1
    .xp <4,1
step
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .accept 76156 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    #completewith next
    .goto Mulgore,61.46,47.21,20 >>Enter 接任务: |cRXP_WARN_风险投资公司|r. Mine
    >>|cRXP_WARN_注意:|r|T132288:0|t[Venture Co伪装]|cRXP_WARN_无效|r
    .train 410104,1
    .xp <4,1
step
    #loop
    .goto Mulgore,63.77,43.97,15,0
    .goto Mulgore,62.81,42.81,15,0
    .goto Mulgore,60.38,42.78,15,0
    .goto Mulgore,61.64,41.33,15,0
    .goto Mulgore,63.51,39.29,15,0
    .goto Mulgore,63.39,40.80,15,0
--  .goto Mulgore,66.53,39.47,15,0 --Very deep inside the top of the mine, skipping
    .goto Mulgore,60.99,37.00,15,0
    .goto Mulgore,59.64,36.05,15,0 --Outside
    .goto Mulgore,61.72,35.15,15,0 --Outside
    >>打开矿洞内和另一侧外面的|cRXP_PICK_爆破补给|r, 拾取它们以获得|cRXP_LOOT_海火采矿炸药|r
    >>|cRXP_WARN_如果可能的话, 尽量待在洞穴的上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
--XX Didn't add the bottom of the mine ones
step
    #completewith next
    .goto Mulgore,59.99,35.82
    .subzone 215 >>从另一边离开通缉者矿井
    .train 410099,1
    .xp <4,1
step
    #completewith next
    .goto Mulgore,60.39,33.54,40 >>前往|cRXP_FRIENDLY_冒险者的遗迹|r
    .train 410099,1
    .xp <4,1
step
    #label IconS
    .goto Mulgore,60.39,33.54
    >>|cRXP_WARN_如果你还没有|r |T134596:0|t[雕文长裤 - 先祖指引]|cRXP_WARN_, 现在就是最好的时机去完成它|r
    >>|cRXP_WARN_如果你不想获得这个符文, 请跳过此步骤|r
    >>|cRXP_WARN_加入一个由另一位萨满祭司和牧师或德鲁伊站在“冒险者遗骸”旁边的队伍, 或者在通用聊天频道中寻找萨满祭司和牧师或德鲁伊的帮助(在聊天框中输入 /1)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_仪式完成后, |cRXP_FRIENDLY_冒险者之魂|r会现身并随即消亡. 击败它以获取|r|T237571:0|t|cRXP_LOOT_[祖先的回响]|r
    .collect 210589,1 --Echo of the Ancestors (1)
    .target Adventurer's Remains
    .target Adventurer's Spirit
    .skipgossip
    .train 410099,1
    .xp <4,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T237571:0|t|cRXP_LOOT_[先祖回响]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹裤 - 先祖指引]
    .use 210589
    .itemcount 210589,1 --Echo of the Ancestors (1)
    .train 410099,1
    .xp <4,1
step
    #completewith next
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .train 410104,1
    .xp <4,1
--XX Logout skips take you to Bloodhoof, not worth doing
step
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76156 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76160 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    #completewith next
    .goto Mulgore,53.91,23.45
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
    .train 410104,1
    .xp <4,1
step
    #loop
    .goto Mulgore,38.80,16.03,10,0
    .goto Mulgore,37.79,10.86,10,0
    .goto Mulgore,38.01,10.21,10,0
    .goto Mulgore,38.55,8.10,10,0
    .goto Mulgore,38.06,7.47,10,0
    .goto Mulgore,37.36,9.99,10,0
    .goto Mulgore,37.31,10.41,10,0
    .goto Mulgore,35.80,11.21,10,0
    .goto Mulgore,36.20,11.41,10,0
    .goto Mulgore,36.21,12.60,10,0
    .goto Mulgore,36.55,12.84,10,0
    .goto Mulgore,36.65,13.26,10,0
    .goto Mulgore,37.18,12.36,10,0
    >>拾取地面上的风怒锥体|cRXP_LOOT_Windfury Cones|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
    .xp <4,1
step
    >>使用 |T133748:0|t[研钵和捣杵] 制作 |T133213:0|t[松树药膏]
    .complete 76160,1 --Pine Salve (1)
    .use 206176
    .train 410104,1
    .xp <4,1
step
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76160 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76240 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买|r|T133894:0|t[新鲜的美味小鱼] |r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target Auctioneer Stampi
    .train 410104,1
    .xp <4,1
step
    #ssf
    #completewith Sewa
    .goto Thunder Bluff,46.13,51.59,12,0
    .goto Thunder Bluff,47.09,50.07,4,0
    .goto Thunder Bluff,46.49,49.16,4,0
    .goto Thunder Bluff,46.05,49.74,4,0
    .goto Thunder Bluff,46.34,50.50,4,0
    .goto Thunder Bluff,55.78,47.02,15 >>前往|cRXP_FRIENDLY_苏瓦·迷雾行者|r
    .train 410104,1
    .xp <4,1
step
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔·迷雾行者|r交谈
    .train 7734 >>训练 |T136245:0|t[钓鱼]
    .target Kah Mistrunner
    .train 410104,1
    .xp <4,1
step
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏瓦·迷雾行者|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132932:0|t[钓鱼竿]|cRXP_BUY_和|r|T134335:0|t[闪光的小珠]|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target Sewa Mistrunner
    .train 410104,1
    .xp <4,1
step
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >>|cRXP_WARN_装备|r|T132932:0|t[钓鱼竿]
    .use 6256
    .train 410104,1
    .xp <4,1
step
    #ssf
    #completewith Fish
    #requires Pole
    .aura 8087 >>|cRXP_WARN_将|r|T134335:0|t[闪光的小珠] |cRXP_WARN_附着到你的|r|T132932:0|t[钓鱼竿]
    .use 6529
    .train 410104,1
    .xp <4,1
step
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘里钓鱼, 直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
    .xp <4,1
step
    >>使用 |T132147:0|t[刀具套装] 制作 |T134007:0|t[鱼肉碎块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
    .xp <4,1
step
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76240 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
-- .train 410104 >>|cRXP_WARN_你将训练|r|T236289:0|t[熔岩鞭笞]|cRXP_WARN_和|r|T132147:0|t[双持]|cRXP_WARN_在提交时|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 水之盾 - 20(贫瘠之地)
#displayname Water Shield
#next 巨灵幽魂狼 - 25(石爪山脉)


step
    +|cRXP_WARN_你必须至少达到 20 级才能获得|r |T133816:0|t[雕纹手套 - 水之盾] |cRXP_WARN_因为这是该技能的等级要求|r |T135849:0|t[冰霜冲击]
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133816:0|t[雕纹手套 - 水盾]
    .train 410097,1
    .xp >20,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 8050,1
    .xp <20,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 8056,1
    .xp <20,1
step
    #completewith OrgTrain
    .goto Orgrimmar,40.31,37.01,15,0
    .goto Orgrimmar,38.81,36.37,15 >>前往|cRXP_FRIENDLY_Kardris|r
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 8050,1
    .train 8056,1
    .xp <20,1
step
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    #label OrgTrain
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    #ah
    .goto Orgrimmar,50.67,70.39,0
    .goto Orgrimmar,53.74,64.60,15,0
    .goto Orgrimmar,55.54,64.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师瓦巴恩交谈|cRXP_FRIENDLY_Auctioneer Wabang|r
    >>|cRXP_BUY_从拍卖行购买|r|T134237:0|t[科卡尔宝箱钥匙] |r
    >>|cRXP_WARN_这将为你节省几分钟时间|r
    .collect 5020,1 --Kolkar Booty Key (1)
    .target Auctioneer Wabang
    .zoneskip Orgrimmar,1
    .train 410097,1
    .xp <20,1
step
    #completewith TBTrain
    .goto Thunder Bluff,22.82,21.11,15 >>前往|cRXP_FRIENDLY_Siln|r
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 8050,1
    .train 8056,1
    .xp <20,1
step
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    #label TBTrain
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买|r|T134237:0|t[科卡尔宝箱钥匙] |r
    >>|cRXP_WARN_这将为你节省几分钟时间|r
    .collect 5020,1 --Kolkar Booty Key (1)
    .target Auctioneer Stampi
    .zoneskip Thunder Bluff,1
    .train 410097,1
    .xp <20,1
--XX easier to farm it IF the user is not already there to train
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 410097,1
    .xp <20,1
step
    #loop
    .goto The Barrens,45.78,25.52,0
    .goto The Barrens,43.86,21.38,0
    .goto The Barrens,43.56,26.30,0
    .goto The Barrens,45.78,25.52,50,0
    .goto The Barrens,46.54,22.99,50,0
    .goto The Barrens,45.03,20.09,50,0
    .goto The Barrens,43.86,21.38,50,0
    .goto The Barrens,43.49,23.57,50,0
    .goto The Barrens,43.56,26.30,50,0
    >>击杀科卡尔牧民和科卡尔召雷师. 击败他们后可掉落 |T134237:0|t[科卡尔宝箱钥匙]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
    .train 410097,1
    .xp <20,1
step
    .goto The Barrens,43.02,23.52,-1
--  .goto The Barrens,52.73,41.84,-1
--  .goto The Barrens,44.33,37.66,-1
    >>打开地面上的|cRXP_PICK_科卡尔的战利品|r, 拾取其中的物品 |T135832:0|t|cRXP_LOOT_[泰匹斯特图标]|r
    .collect 206382,1 --Tempest Icon (1)
    .itemcount 5020,1 --Kolkar Booty Key (1)
    .train 410097,1
    .xp <20,1
step
    .equip 18,206382 >>|cRXP_WARN_装备|r|T135832:0|t|cRXP_LOOT_[风暴图标]|r
    .use 206382
    .itemcount 206382,1 --Tempest Icon (1)
    .train 410097,1
    .xp <20,1
step
    #loop
    .goto The Barrens,40.03,15.36,50,0
    .goto The Barrens,39.39,14.65,50,0
    .goto The Barrens,39.62,11.77,50,0
    .goto The Barrens,38.84,11.93,50,0
    .goto The Barrens,38.44,13.21,50,0
    .goto The Barrens,38.48,14.85,50,0
    .goto The Barrens,37.33,16.23,50,0
    .goto The Barrens,38.64,17.49,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少一次使用自然法术(|r|T136026:0|t[地震]|cRXP_WARN_)和冰霜法术(|r|T135849:0|t[冰霜冲击]|cRXP_WARN_)和火焰法术(|r|T135813:0|t[烈焰冲击]|cRXP_WARN_)造成伤害的敌人. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Witchwing Slayer
    .mob Witchwing Windcaller
    .mob Witchwing Ambusher
    .mob Witchwing Roguefeather
    .mob Serena Bloodfeather
    .itemStat 18,QUALITY,2
    .train 410097,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 410097,1
    .xp <22,1
step
    #loop
    .goto Stonetalon Mountains,64.17,57.16,50,0
    .goto Stonetalon Mountains,60.55,54.86,50,0
    .goto Stonetalon Mountains,60.95,51.21,50,0
    .goto Stonetalon Mountains,64.40,48.64,50,0
    .goto Stonetalon Mountains,66.18,52.01,50,0
    .goto Stonetalon Mountains,67.20,51.49,50,0
    .goto Stonetalon Mountains,66.83,45.34,50,0
    .goto Stonetalon Mountains,69.89,53.54,50,0
    .goto Stonetalon Mountains,70.84,56.97,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少一次使用自然法术(|r|T136026:0|t[地震]|cRXP_WARN_)和冰霜法术(|r|T135849:0|t[冰霜冲击]|cRXP_WARN_)和火焰法术(|r|T135813:0|t[烈焰冲击]|cRXP_WARN_)造成伤害的敌人. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
    .mob Venture Co. Operator
    .mob Venture Co. Light Shredder
    .mob XT:9
    .mob XT:4
    .mob Deepmoss Webspinner
    .itemStat 18,QUALITY,2
    .train 410097,1
    .xp <22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T135832:0|t|cRXP_LOOT_[风暴图标]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 水盾]
    .use 206382
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410097,1
    .xp <20,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 水盾 - 20(银松森林)
#displayname Water Shield
#next 巨灵幽魂狼 - 25(石爪山脉)

step
    +|cRXP_WARN_你必须至少达到 20 级才能获得|r |T133816:0|t[雕纹手套 - 水之盾] |cRXP_WARN_因为这是该技能的等级要求|r |T135849:0|t[冰霜冲击]
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133816:0|t[雕纹手套 - 水盾]
    .train 410097,1
    .xp >20,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 8050,1
    .xp <20,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 8056,1
    .xp <20,1
step
    #completewith OrgTrain
    .goto Orgrimmar,40.31,37.01,15,0
    .goto Orgrimmar,38.81,36.37,15 >>前往|cRXP_FRIENDLY_Kardris|r
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 8050,1
    .train 8056,1
    .xp <20,1
step
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    #label OrgTrain
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 410097,1
    .xp <20,1
step
    #completewith TBTrain
    .goto Thunder Bluff,22.82,21.11,15 >>前往|cRXP_FRIENDLY_Siln|r
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 8050,1
    .train 8056,1
    .xp <20,1
step
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8050 >>训练 |T135813:0|t[烈焰冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    #label TBTrain
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 8056 >>训练 |T135849:0|t[冰霜冲击]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 410097,1
    .xp <20,1
step
    #completewith Grimson
    #label Grimson1
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 410097,1
    .xp <20,1
step
    #completewith Grimson
    #requires Grimson1
    #label Grimson2
    .goto Silverpine Forest,56.65,45.97,15 >>进入埃利姆矿洞
    .train 410097,1
    .xp <20,1
step
    #completewith Grimson
    #requires Grimson2
    .goto Silverpine Forest,57.28,45.42,10,0
    .goto Silverpine Forest,57.66,44.82,10,0
    .goto Silverpine Forest,58.59,44.85,30 >>前往白毛狼人格瑞姆森
    .train 410097,1
    .xp <20,1
step
    #label Grimson
    .goto Silverpine Forest,58.59,44.85
    >>击杀位于内部的白毛狼人格瑞姆森, 搜刮其身上掉落的 |T135832:0|t|cRXP_LOOT_[泰匹斯特图标]|r
    .collect 206382,1 --Tempest Icon (1)
    .mob Grimson the Pale
    .train 410097,1
    .xp <20,1
step
    .equip 18,206382 >>|cRXP_WARN_装备|r|T135832:0|t|cRXP_LOOT_[风暴图标]|r
    .use 206382
    .itemcount 206382,1 --Tempest Icon (1)
    .train 410097,1
    .xp <20,1
step
    #loop
    .goto Silverpine Forest,47.68,86.24,50,0
    .goto Silverpine Forest,45.81,86.37,50,0
    .goto Silverpine Forest,44.26,84.37,50,0
    .aura 408828 >>|cRXP_WARN_击杀至少一次使用自然法术(|r|T136026:0|t[地震]|cRXP_WARN_)和冰霜法术(|r|T135849:0|t[冰霜冲击]|cRXP_WARN_)和火焰法术(|r|T135813:0|t[烈焰冲击]|cRXP_WARN_)造成伤害的敌人. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Valdred Moray
    .mob Dalin Forgewright
    .mob Haggard Refugee
    .mob Sickly Refugee
    .itemStat 18,QUALITY,2
    .train 410097,1
    .xp <20,1
    .xp >22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T135832:0|t|cRXP_LOOT_[风暴图标]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 水盾]
    .use 206382
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410097,1
    .xp <20,1
step
    #completewith next
    >>|cRXP_WARN_如果你还没有|r|T133816:0|t[雕纹手套 - 熔岩爆裂]|cRXP_WARN_already, 现在值得去做. 如果不想做, 可以跳过此步骤|r
    .train 410095,1
    .xp <25,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410095,1
    .xp <25,1
step
    #loop
    .goto Hillsbrad Foothills,63.73,59.26,40,0
    .goto Hillsbrad Foothills,65.49,60.30,40,0
    .goto Hillsbrad Foothills,66.30,61.11,40,0
    .goto Hillsbrad Foothills,63.61,62.04,40,0
    .goto Hillsbrad Foothills,63.21,61.04,40,0
    .goto Hillsbrad Foothills,62.56,63.55,40,0
    .goto Hillsbrad Foothills,62.98,63.70,40,0
    >>击杀|cRXP_ENEMY_泥嘴萨满祭司|r. 击败他们以获取 |T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r
    .collect 206387,1 --Kajaric Icon (1)
    .mob Mudsnout Shaman
    .train 410095,1
    .xp <25,1
step
    .equip 18,206387 >>|cRXP_WARN_装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r
    .use 206387
    .itemcount 206387,1 --Kajaric Icon (1)
    .train 410095,1
    .xp <25,1
step
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .train 410095,1
    .xp <25,1
step
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >>进入暗影裂口内的怒焰裂谷
    .itemStat 18,QUALITY,2
    .train 410095,1
    .xp <25,1
step
    >>|cRXP_WARN_紧贴右侧墙壁. 走过斜坡后(就在第5个怪物之后), 进入你右侧的浅熔岩池|r
    >>|cRXP_WARN_受到的伤害从|r|T135805:0|t[熔岩]|cRXP_WARN_减少至91, 同时装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r|cRXP_WARN_时也会生效|r
    .aura 408828 >>|cRXP_WARN_受到 |T135805:0|t[熔岩]|cRXP_WARN_source 伤害 5 次|r
    .itemStat 18,QUALITY,2
    .train 410095,1
    .xp <25,1
step
    >>|cRXP_WARN_离开|r|T135805:0|t[熔岩]
    .cast 402265 >>|cRXP_WARN_使用|r |T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r |cRXP_WARN_来学习|r |T133816:0|t[雕纹手套 - 熔岩爆裂]
    .use 206387
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410095,1
    .xp <25,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 熔岩爆裂 - 25(希尔斯布莱德丘陵)
#displayname Lava Burst
#next 大地之盾 - 25(艾泽拉斯)


step
    +|cRXP_WARN_你至少需要达到25级, 才能在希尔斯布莱德单独获得|r|T133816:0|t[雕纹手套 - 熔岩爆裂]|r
    .train 410095,1
    .xp >25,1
step
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
    .train 410095,1
step
    #loop
    .goto Hillsbrad Foothills,63.73,59.26,40,0
    .goto Hillsbrad Foothills,65.49,60.30,40,0
    .goto Hillsbrad Foothills,66.30,61.11,40,0
    .goto Hillsbrad Foothills,63.61,62.04,40,0
    .goto Hillsbrad Foothills,63.21,61.04,40,0
    .goto Hillsbrad Foothills,62.56,63.55,40,0
    .goto Hillsbrad Foothills,62.98,63.70,40,0
    >>击杀|cRXP_ENEMY_泥嘴萨满祭司|r. 击败他们以获取 |T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r
    .collect 206387,1 --Kajaric Icon (1)
    .mob Mudsnout Shaman
    .train 410095,1
step
    .equip 18,206387 >>|cRXP_WARN_装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r
    .use 206387
    .itemcount 206387,1 --Kajaric Icon (1)
    .train 410095,1
step
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .train 410095,1
step
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >>进入暗影裂口内的怒焰裂谷
    .itemStat 18,QUALITY,2
    .train 410095,1
step
    >>|cRXP_WARN_紧贴右侧墙壁. 走过斜坡后(就在第5个怪物之后), 进入你右侧的浅熔岩池|r
    >>|cRXP_WARN_受到的伤害从|r|T135805:0|t[熔岩]|cRXP_WARN_减少至91, 同时装备|r|T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r|cRXP_WARN_时也会生效|r
    .aura 408828 >>|cRXP_WARN_受到 |T135805:0|t[熔岩]|cRXP_WARN_source 伤害 5 次|r
    .itemStat 18,QUALITY,2
    .train 410095,1
step
    >>|cRXP_WARN_离开|r|T135805:0|t[熔岩]
    .cast 402265 >>|cRXP_WARN_使用|r |T134920:0|t|cRXP_LOOT_[卡贾里克图标]|r |cRXP_WARN_来学习|r |T133816:0|t[雕纹手套 - 熔岩爆裂]
    .use 206387
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410095,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 过载 - 3(杜洛塔尔)
#displayname Overload
#next 盾牌掌握 - 6(杜隆塔尔)

    --Rune of Overload
step
    +|cRXP_WARN_你必须至少达到 3 级才能获得|r|T133815:0|t[雕刻胸甲 - 过载]|cRXP_WARN_, 因为这是装备|r|T134918:0|t|cRXP_LOOT_[二元图标]的等级要求|r
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133815:0|t[刻印宝箱 - 过载]
    .train 410094,1
    .xp >3,1
step
    #completewith IconS
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 410094,1
    .xp <3,1
step << !Tauren skip
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .accept 77587 >>接任务: |cRXP_WARN_力量圣像|r << Troll Shaman
    .accept 77585 >>接任务: |cRXP_WARN_力量圣像|r << Orc Shaman
    .target Shikrik
    .train 410094,1
    .xp <3,1
step
    #label IconS
#loop
	.line Durotar,43.26,58.28,42.81,58.41,41.90,58.35,41.97,59.20,41.36,60.35,40.66,61.27,40.07,61.35,39.42,61.29,39.46,62.17,39.55,63.10,40.13,64.04,40.84,64.06,40.74,65.86,39.93,66.03,40.04,66.99,40.09,67.66,40.13,68.50,40.72,68.55,41.30,67.84,41.37,66.72,41.89,66.05,41.27,65.71,41.36,64.07,41.33,63.12,41.35,61.98,41.49,61.25,41.90,60.24,42.51,59.34,43.08,59.62,43.91,59.33,45.15,59.46,45.81,59.30,45.85,60.34,46.46,61.11,47.09,62.24,47.08,63.15,47.14,64.08,47.58,64.04,47.08,63.15,47.09,62.24,46.90,61.15,46.98,60.18,47.07,59.34,46.47,58.28,45.81,59.30,45.15,59.46,43.91,59.33,43.26,58.28
	.goto Durotar,43.26,58.28,25,0
	.goto Durotar,42.81,58.41,25,0
	.goto Durotar,41.90,58.35,25,0
	.goto Durotar,41.97,59.20,25,0
	.goto Durotar,41.36,60.35,25,0
	.goto Durotar,40.66,61.27,25,0
	.goto Durotar,40.07,61.35,25,0
	.goto Durotar,39.42,61.29,25,0
	.goto Durotar,39.46,62.17,25,0
	.goto Durotar,39.55,63.10,25,0
	.goto Durotar,40.13,64.04,25,0
	.goto Durotar,40.84,64.06,25,0
	.goto Durotar,40.74,65.86,25,0
	.goto Durotar,39.93,66.03,25,0
	.goto Durotar,40.04,66.99,25,0
	.goto Durotar,40.09,67.66,25,0
	.goto Durotar,40.13,68.50,25,0
	.goto Durotar,40.72,68.55,25,0
	.goto Durotar,41.30,67.84,25,0
	.goto Durotar,41.37,66.72,25,0
	.goto Durotar,41.89,66.05,25,0
	.goto Durotar,41.27,65.71,25,0
	.goto Durotar,41.36,64.07,25,0
	.goto Durotar,41.33,63.12,25,0
	.goto Durotar,41.35,61.98,25,0
	.goto Durotar,41.49,61.25,25,0
	.goto Durotar,41.90,60.24,25,0
	.goto Durotar,42.51,59.34,25,0
	.goto Durotar,43.08,59.62,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.85,60.34,25,0
	.goto Durotar,46.46,61.11,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.14,64.08,25,0
	.goto Durotar,47.58,64.04,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,46.90,61.15,25,0
	.goto Durotar,46.98,60.18,25,0
	.goto Durotar,47.07,59.34,25,0
	.goto Durotar,46.47,58.28,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,43.26,58.28,25,0
    >>击杀|cRXP_ENEMY_蝎子|r. 击败它们以获取 |T134918:0|t|cRXP_LOOT_[二元图标]|r
    .collect 206381,1 --Dyadic Icon (1)
    .mob Scorpid Worker
    .train 410094,1
    .xp <3,1
step
    .equip 18,206381 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[Dyadic Icon]|r
    .use 206381
    .itemcount 206381,1 --Dyadic Icon (1)
    .train 410094,1
    .xp <3,1
step
#loop
	.line Durotar,43.26,58.28,42.81,58.41,41.90,58.35,41.97,59.20,41.36,60.35,40.66,61.27,40.07,61.35,39.42,61.29,39.46,62.17,39.55,63.10,40.13,64.04,40.84,64.06,40.74,65.86,39.93,66.03,40.04,66.99,40.09,67.66,40.13,68.50,40.72,68.55,41.30,67.84,41.37,66.72,41.89,66.05,41.27,65.71,41.36,64.07,41.33,63.12,41.35,61.98,41.49,61.25,41.90,60.24,42.51,59.34,43.08,59.62,43.91,59.33,45.15,59.46,45.81,59.30,45.85,60.34,46.46,61.11,47.09,62.24,47.08,63.15,47.14,64.08,47.58,64.04,47.08,63.15,47.09,62.24,46.90,61.15,46.98,60.18,47.07,59.34,46.47,58.28,45.81,59.30,45.15,59.46,43.91,59.33,43.26,58.28
	.goto Durotar,43.26,58.28,25,0
	.goto Durotar,42.81,58.41,25,0
	.goto Durotar,41.90,58.35,25,0
	.goto Durotar,41.97,59.20,25,0
	.goto Durotar,41.36,60.35,25,0
	.goto Durotar,40.66,61.27,25,0
	.goto Durotar,40.07,61.35,25,0
	.goto Durotar,39.42,61.29,25,0
	.goto Durotar,39.46,62.17,25,0
	.goto Durotar,39.55,63.10,25,0
	.goto Durotar,40.13,64.04,25,0
	.goto Durotar,40.84,64.06,25,0
	.goto Durotar,40.74,65.86,25,0
	.goto Durotar,39.93,66.03,25,0
	.goto Durotar,40.04,66.99,25,0
	.goto Durotar,40.09,67.66,25,0
	.goto Durotar,40.13,68.50,25,0
	.goto Durotar,40.72,68.55,25,0
	.goto Durotar,41.30,67.84,25,0
	.goto Durotar,41.37,66.72,25,0
	.goto Durotar,41.89,66.05,25,0
	.goto Durotar,41.27,65.71,25,0
	.goto Durotar,41.36,64.07,25,0
	.goto Durotar,41.33,63.12,25,0
	.goto Durotar,41.35,61.98,25,0
	.goto Durotar,41.49,61.25,25,0
	.goto Durotar,41.90,60.24,25,0
	.goto Durotar,42.51,59.34,25,0
	.goto Durotar,43.08,59.62,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.85,60.34,25,0
	.goto Durotar,46.46,61.11,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.14,64.08,25,0
	.goto Durotar,47.58,64.04,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,46.90,61.15,25,0
	.goto Durotar,46.98,60.18,25,0
	.goto Durotar,47.07,59.34,25,0
	.goto Durotar,46.47,58.28,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,43.26,58.28,25,0
    .aura 408828 >>|cRXP_WARN_让|cRXP_ENEMY_蝎子|r对你施放 |T136016:0|t[弱毒] |cRXP_WARN_, 然后承受该效果的伤害 10 次, 即可获得 |T136116:0|t[鼓舞] |cRXP_WARN_效果|r
    .mob Scorpid Worker
    .itemStat 18,QUALITY,2
    .train 410094,1
    .xp <3,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[二元图标]|r|cRXP_WARN_来学习|r|T133815:0|t[刻印宝箱 - 过载]
    .use 206381
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410094,1
    .xp <3,1
step << !Tauren skip
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 77587 >>交任务: |cRXP_FRIENDLY_力量圣像|r << Troll Shaman
    .turnin 77585 >>交任务: |cRXP_FRIENDLY_力量圣像|r << Orc Shaman
    .target Shikrik
    .xp <3,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 过载 - 3(莫高雷)
#displayname Overload
#next 盾牌专精 - 6(莫高雷)


    --Rune of Overload
step
    +|cRXP_WARN_你必须至少达到 3 级才能获得|r|T133815:0|t[雕刻胸甲 - 过载]|cRXP_WARN_, 因为这是装备|r|T134918:0|t|cRXP_LOOT_[二元图标]的等级要求|r
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T133815:0|t[刻印宝箱 - 过载]
    .train 410094,1
    .xp >3,1
step
    #completewith IconS
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
    .train 410094,1
    .xp <3,1
step << Tauren skip
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .accept 77652 >>接任务: |cRXP_WARN_力量圣像|r
    .target Meela Dawnstrider
    .xp <3,1
step
    #label IconS
    .goto Mulgore,63.74,81.18,50,0
    .goto Mulgore,63.86,79.97,50,0
    .goto Mulgore,65.00,78.60,50,0
    .goto Mulgore,66.05,77.83,50,0
    .goto Mulgore,65.93,77.10,50,0
    .goto Mulgore,63.57,76.25,50,0
    .goto Mulgore,63.86,80.14
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 击败他们以获取 |T134918:0|t[|cRXP_FRIENDLY_Dyadic Icon|r]
    .collect 206381,1 --Dyadic Icon (1)
    .mob Bristleback Shaman
    .train 410094,1
    .xp <3,1
step
    .equip 18,206381 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[Dyadic Icon]|r
    .use 206381
    .itemcount 206381,1 --Dyadic Icon (1)
    .train 410094,1
    .xp <3,1
step
    .goto Mulgore,63.74,81.18,50,0
    .goto Mulgore,63.86,79.97,50,0
    .goto Mulgore,65.00,78.60,50,0
    .goto Mulgore,66.05,77.83,50,0
    .goto Mulgore,65.93,77.10,50,0
    .goto Mulgore,63.57,76.25,50,0
    .goto Mulgore,63.86,80.14
    .aura 408828 >>|cRXP_WARN_让|cRXP_ENEMY_刺背萨满祭司|r对你施放|T136048:0 |t[闪电箭]|cRXP_WARN_, 并受到其伤害10次, 以获得|T136116:0 |t[灵感]|cRXP_WARN_增益效果|r
    .mob Bristleback Shaman
    .itemStat 18,QUALITY,2
    .train 410094,1
    .xp <3,1
--XX Loop needs to be added
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[二元图标]|r|cRXP_WARN_来学习|r|T133815:0|t[刻印宝箱 - 过载]
    .use 206381
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410094,1
    .xp <3,1
step << Tauren skip
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 77652 >>交任务: |cRXP_FRIENDLY_力量圣像|r
    .target Meela Dawnstrider
    .xp <3,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 盾牌掌握 - 6(杜隆塔尔)
#displayname 盾牌精通 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 熔岩爆破 - 10(杜隆塔尔)

step
    +|cRXP_WARN_你至少需要达到6级, 才能在杜隆塔尔单独获得|r|T133815:0|t[雕文胸甲 - 盾牌精通]|r
    >>|cRXP_WARN_你必须至少达到 3 级, 因为这是装备|r|T134918:0|t|cRXP_LOOT_[伽凡尼克徽记] 的等级要求|r
    >>|cRXP_WARN_你需要先提升等级才能尝试获取|r|T133815:0|t[雕纹胸甲 - 盾牌精通]
    .train 410098,1
    .xp >3,1
step
    +|cRXP_WARN_你至少需要达到6级, 才能在杜隆塔尔单独获得|r|T133815:0|t[雕文胸甲 - 盾牌精通]|r
    .train 410098,1
    .xp <3,1
    .xp >6,1
step
    #completewith IconS
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 410098,1
    .xp <3,1
step
    #label IconS
    .goto Durotar,52.06,62.49,0
    .goto Durotar,39.43,50.07,0
    .goto Durotar,50.91,51.61,0
    .goto Durotar,56.50,46.68,0
    .goto Durotar,57.03,46.66,0
    .goto Durotar,52.06,62.49,50,0
    .goto Durotar,39.43,50.07,50,0
    .goto Durotar,50.91,51.61,50,0
    .goto Durotar,56.50,46.68,50,0
    .goto Durotar,57.03,46.66,50,0
    .goto Durotar,59.00,58.00
    >>点击|cRXP_PICK_电镀图腾|r图腾, 拾取它以获得 |T134918:0|t|cRXP_LOOT_[电镀图标]|r
    >>|cRXP_WARN_|cRXP_PICK_Galvanic Icon|r至少有 15 个刷新点, 每次至少刷新 2 个. 被拾取后 <2 分钟内会消失|r
    >>|cRXP_WARN_如果你在1000码范围内, 它会每5分钟发出一次|r|T136051:0|t[闪电之盾]|cRXP_WARN_sound；如果你在300码范围内并正对它, 则会在其位置显示一次闪电打击|r
    .collect 206386,1 --Galvanic Icon (1)
    .train 410098,1
    .xp <3,1
--XX Need to check for more locations
step
    .equip 18,206386 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP战利品_[电能图示]|r
    .use 206386
    .itemcount 206386,1 --Galvanic Icon (1)
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto Durotar,56.87,53.05,50,0
    .goto Durotar,56.82,54.69,50,0
    .goto Durotar,58.64,53.86,50,0
    .goto Durotar,59.40,56.58,50,0
    .goto Durotar,58.41,58.17,50,0
    .goto Durotar,56.21,58.51,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <3,1
    .xp >11,1
step
    #completewith Barrens
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto The Barrens,53.94,25.86,50,0
    .goto The Barrens,54.17,25.06,50,0
    .goto The Barrens,54.86,25.43,50,0
    .goto The Barrens,55.62,25.71,50,0
    .goto The Barrens,55.98,26.36,50,0
    .goto The Barrens,55.71,27.21,50,0
    .goto The Barrens,55.44,27.35,50,0
    .goto The Barrens,54.99,26.79,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Razormane Thornweaver
    .mob Razormane Water Seeker
    .mob Razormane Hunter
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <11,1
    .xp >16,1
step
    #loop
    .goto The Barrens,55.97,16.17,50,0
    .goto The Barrens,55.43,16.15,50,0
    .goto The Barrens,54.10,15.51,50,0
    .goto The Barrens,53.10,15.25,50,0
    .goto The Barrens,53.73,13.77,50,0
    .goto The Barrens,55.09,15.00,50,0
    .goto The Barrens,55.62,14.86,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Hecklefang Hyena
    .mob Savannah Prowler
    .mob Savannah Huntress
    .mob Sunscale Screecher
    .mob Barrens Giraffe
    .mob Fleeting Plainstrider
    .mob Zhevra Runner
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <16,1
    .xp >20,1
step
    #label Barrens
    #loop
    .goto The Barrens,40.03,15.36,50,0
    .goto The Barrens,39.39,14.65,50,0
    .goto The Barrens,39.62,11.77,50,0
    .goto The Barrens,38.84,11.93,50,0
    .goto The Barrens,38.44,13.21,50,0
    .goto The Barrens,38.48,14.85,50,0
    .goto The Barrens,37.33,16.23,50,0
    .goto The Barrens,38.64,17.49,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Witchwing Slayer
    .mob Witchwing Windcaller
    .mob Witchwing Ambusher
    .mob Witchwing Roguefeather
    .mob Serena Bloodfeather
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto Stonetalon Mountains,64.17,57.16,50,0
    .goto Stonetalon Mountains,60.55,54.86,50,0
    .goto Stonetalon Mountains,60.95,51.21,50,0
    .goto Stonetalon Mountains,64.40,48.64,50,0
    .goto Stonetalon Mountains,66.18,52.01,50,0
    .goto Stonetalon Mountains,67.20,51.49,50,0
    .goto Stonetalon Mountains,66.83,45.34,50,0
    .goto Stonetalon Mountains,69.89,53.54,50,0
    .goto Stonetalon Mountains,70.84,56.97,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
    .mob Venture Co. Operator
    .mob Venture Co. Light Shredder
    .mob XT:9
    .mob XT:4
    .mob Deepmoss Webspinner
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[电镀徽记]|r|cRXP_WARN_来学习|r|T133815:0|t[刻印胸甲 - 盾牌专精]
    .use 206386
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <3,1
--XX Cast ID may be wrong, may need to be checked
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 盾牌专精 - 6(莫高雷)
#displayname 盾牌精通 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 熔火冲击 - 8(莫高雷)


    --Rune of 盾牌精通
 step
    +|cRXP_WARN_你至少需要达到6级, 才能单独在莫高雷获得|r|T133815:0|t[雕文胸甲 - 盾牌精通]|r
    >>|cRXP_WARN_你必须至少达到 3 级, 因为这是装备|r|T134918:0|t|cRXP_LOOT_[伽凡尼克徽记] 的等级要求|r
    >>|cRXP_WARN_你需要先提升等级才能尝试获取|r|T133815:0|t[雕纹胸甲 - 盾牌精通]
    .train 410098,1
    .xp >3,1
step
    +|cRXP_WARN_你至少需要达到6级, 才能单独在莫高雷获得|r|T133815:0|t[雕文胸甲 - 盾牌精通]|r
    .train 410098,1
    .xp <3,1
    .xp >6,1
step
    #completewith IconS
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto Mulgore,41.99,43.49,0
    .goto Mulgore,43.87,48.32,0
    .goto Mulgore,37.45,52.55,0
    .goto Mulgore,41.65,55.98,0
    .goto Mulgore,38.43,72.00,0
    .goto Mulgore,36.72,68.09,0
    .goto Mulgore,53.81,58.41,0
    .goto Mulgore,64.06,55.75,0
    .goto Mulgore,56.23,64.28,0
    .goto Mulgore,56.60,70.13,0
    .goto Mulgore,67.23,66.17,0
    .goto Mulgore,62.30,22.94,0
    .goto Mulgore,56.24,22.06,0
    .goto Mulgore,44.94,11.30,0
    .goto Mulgore,36.33,9.79,0
    .goto Mulgore,30.50,25.98,0
    .goto Mulgore,41.99,43.49,20,0
    .goto Mulgore,43.87,48.32,20,0
    .goto Mulgore,37.45,52.55,20,0
    .goto Mulgore,41.65,55.98,20,0
    .goto Mulgore,38.43,72.00,20,0
    .goto Mulgore,36.72,68.09,20,0
    .goto Mulgore,53.81,58.41,20,0
    .goto Mulgore,64.06,55.75,20,0
    .goto Mulgore,56.23,64.28,20,0
    .goto Mulgore,56.60,70.13,20,0
    .goto Mulgore,67.23,66.17,20,0
    .goto Mulgore,62.30,22.94,20,0
    .goto Mulgore,56.24,22.06,20,0
    .goto Mulgore,44.94,11.30,20,0
    .goto Mulgore,36.33,9.79,20,0
    .goto Mulgore,30.50,25.98,20,0
    >>点击|cRXP_PICK_电镀图腾|r图腾, 拾取它以获得 |T134918:0|t|cRXP_LOOT_[电镀图标]|r
    >>|cRXP_WARN_|cRXP_PICK_Galvanic Icon|r至少有 15 个刷新点, 每次至少刷新 2 个. 被拾取后 <2 分钟内会消失|r
    >>|cRXP_WARN_如果你在1000码范围内, 它会每5分钟发出一次|r|T136051:0|t[闪电之盾]|cRXP_WARN_sound；如果你在300码范围内并正对它, 则会在其位置显示一次闪电打击|r
    .collect 206386,1 --Galvanic Icon (1)
    .train 410098,1
    .xp <3,1
step
    .equip 18,206386 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP战利品_[电能图示]|r
    .use 206386
    .itemcount 206386,1 --Galvanic Icon (1)
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto Mulgore,54.24,66.98,30,0
    .goto Mulgore,54.12,65.67,30,0
    .goto Mulgore,53.40,65.49,30,0
    .goto Mulgore,53.19,66.51,30,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Hireling
    .mob Venture Co. Laborer
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <3,1
    .xp >11,1
step
    #loop
    .goto Mulgore,59.86,48.74,30,0
    .goto Mulgore,60.85,49.04,30,0
    .goto Mulgore,61.83,48.28,30,0
    .goto Mulgore,61.40,47.23,30,0
    .goto Mulgore,62.02,45.84,30,0
    .goto Mulgore,62.85,45.30,30,0
    .goto Mulgore,64.87,43.32,30,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Worker
    .mob Venture Co. Supervisor
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <11,1
    .xp >14,1
step
    #completewith Barrens
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto The Barrens,53.94,25.86,50,0
    .goto The Barrens,54.17,25.06,50,0
    .goto The Barrens,54.86,25.43,50,0
    .goto The Barrens,55.62,25.71,50,0
    .goto The Barrens,55.98,26.36,50,0
    .goto The Barrens,55.71,27.21,50,0
    .goto The Barrens,55.44,27.35,50,0
    .goto The Barrens,54.99,26.79,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Razormane Thornweaver
    .mob Razormane Water Seeker
    .mob Razormane Hunter
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <14,1
    .xp >16,1
step
    #loop
    .goto The Barrens,55.97,16.17,50,0
    .goto The Barrens,55.43,16.15,50,0
    .goto The Barrens,54.10,15.51,50,0
    .goto The Barrens,53.10,15.25,50,0
    .goto The Barrens,53.73,13.77,50,0
    .goto The Barrens,55.09,15.00,50,0
    .goto The Barrens,55.62,14.86,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Hecklefang Hyena
    .mob Savannah Prowler
    .mob Savannah Huntress
    .mob Sunscale Screecher
    .mob Barrens Giraffe
    .mob Fleeting Plainstrider
    .mob Zhevra Runner
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <16,1
    .xp >20,1
step
    #label Barrens
    #loop
    .goto The Barrens,40.03,15.36,50,0
    .goto The Barrens,39.39,14.65,50,0
    .goto The Barrens,39.62,11.77,50,0
    .goto The Barrens,38.84,11.93,50,0
    .goto The Barrens,38.44,13.21,50,0
    .goto The Barrens,38.48,14.85,50,0
    .goto The Barrens,37.33,16.23,50,0
    .goto The Barrens,38.64,17.49,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Witchwing Slayer
    .mob Witchwing Windcaller
    .mob Witchwing Ambusher
    .mob Witchwing Roguefeather
    .mob Serena Bloodfeather
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <20,1
    .xp >22,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 410098,1
    .xp <3,1
step
    #loop
    .goto Stonetalon Mountains,64.17,57.16,50,0
    .goto Stonetalon Mountains,60.55,54.86,50,0
    .goto Stonetalon Mountains,60.95,51.21,50,0
    .goto Stonetalon Mountains,64.40,48.64,50,0
    .goto Stonetalon Mountains,66.18,52.01,50,0
    .goto Stonetalon Mountains,67.20,51.49,50,0
    .goto Stonetalon Mountains,66.83,45.34,50,0
    .goto Stonetalon Mountains,69.89,53.54,50,0
    .goto Stonetalon Mountains,70.84,56.97,50,0
    .aura 408828 >>|cRXP_WARN_将敌人攻击至低血量后, 对其施放|r|T136048:0|t[闪电箭]|cRXP_WARN_以击杀他们. 重复此操作10次即可获得|r|T136116:0|t[灵感]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Venture Co. Logger
    .mob Venture Co. Deforester
    .mob Venture Co. Operator
    .mob Venture Co. Light Shredder
    .mob XT:9
    .mob XT:4
    .mob Deepmoss Webspinner
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <22,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[电镀徽记]|r|cRXP_WARN_来学习|r|T133815:0|t[刻印胸甲 - 盾牌专精]
    .use 206386
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 410098,1
    .xp <3,1
--XX Cast ID may be wrong, may need to be checked
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 祖先指引 - 6 (杜隆塔尔)
#displayname Ancestral Guidance
#next 熔岩爆破 - 10(杜隆塔尔)

    --Rune of Ancestral Guidance
step
    +|cRXP_WARN_你至少需达到6级, 才能与另一名玩家一同在杜隆塔尔获得|r|T134596:0|t[雕纹长裤 - 先祖指引]|r
    >>|cRXP_WARN_你必须至少达到 3 级, 因为这是使用|r|T237571:0|t|cRXP_LOOT_[祖先的回声] 的等级要求|r
    .train 410099,1
    .xp <3,1
step
    +|cRXP_WARN_你至少需达到6级, 才能与另一名玩家一同在杜隆塔尔获得|r|T134596:0|t[雕纹长裤 - 先祖指引]|r
    .train 410099,1
    .xp <3,1
    .xp >6,1
step
    #completewith next
    #label Durotar1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .train 410099,1
    .xp <3,1
step
    #completewith next
    #requires Durotar1
    .goto Durotar,50.84,79.14,40,0
    .goto Durotar,48.02,79.46,40 >>前往|cRXP_FRIENDLY_冒险者的遗迹|r
    .train 410099,1
    .xp <3,1
step
    #label IconS
    .goto Durotar,48.02,79.46
    >>|cRXP_WARN_加入一个由另一位萨满祭司和牧师或德鲁伊站在“冒险者遗骸”旁边的队伍, 或者在通用聊天频道中寻找萨满祭司和牧师或德鲁伊的帮助(在聊天框中输入 /1)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_仪式完成后, |cRXP_FRIENDLY_冒险者之魂|r会现身并随即消亡. 击败它以获取|r|T237571:0|t|cRXP_LOOT_[祖先的回响]|r
    .collect 210589,1 --Echo of the Ancestors (1)
    .target Adventurer's Remains
    .target Adventurer's Spirit
    .skipgossip
    .train 410099,1
    .xp <3,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T237571:0|t|cRXP_LOOT_[先祖回响]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹裤 - 先祖指引]
    .use 210589
    .itemcount 210589,1 --Echo of the Ancestors (1)
    .train 410099,1
    .xp <3,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 祖先指引 - 10 (莫高雷)
#displayname Ancestral Guidance
#next 大地之道 - 12(贫瘠之地)


    --Rune of Ancestral Guidance

step
    +|cRXP_WARN_你至少需达到10级, 才能与另一名玩家一起在莫高雷获得|r |T134596:0|t[雕纹长裤 - 先祖指引] |r
    >>|cRXP_WARN_你必须至少达到 3 级, 因为这是使用|r|T237571:0|t|cRXP_LOOT_[祖先的回声] 的等级要求|r
    .train 410099,1
    .xp <3,1
step
    +|cRXP_WARN_你至少需达到10级, 才能与另一名玩家一起在莫高雷获得|r |T134596:0|t[雕纹长裤 - 先祖指引] |r
    .train 410099,1
    .xp <3,1
    .xp >10,1
step
    #completewith next
    #label Mulgore1
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
    .train 410099,1
    .xp <3,1
step
    #completewith next
    #requires Mulgore1
    #label Cave1
    .goto Mulgore,61.46,47.21,20 >>Enter 接任务: |cRXP_WARN_风险投资公司|r. Mine
    .train 410099,1
    .xp <3,1
step
    #completewith next
    #requires Cave1
    #label Cave2
    .goto Mulgore,62.52,45.37,25,0
    .goto Mulgore,62.56,44.48,25,0
    .goto Mulgore,61.50,42.54,25,0
    .goto Mulgore,61.66,41.45,25,0
    .goto Mulgore,63.08,39.33,25,0
    .goto Mulgore,62.69,38.01,25,0
    .goto Mulgore,60.05,35.82,20 >>从另一边离开通缉者矿井
    .train 410099,1
    .xp <3,1
step
    #completewith next
    #requires Cave2
    .goto Mulgore,60.39,33.54,40 >>前往|cRXP_FRIENDLY_冒险者的遗迹|r
    .train 410099,1
    .xp <3,1
--XX Might be a faster method via the mountains, but don't want to complicate it
step
    #label IconS
    .goto Mulgore,60.39,33.54
    >>|cRXP_WARN_加入一个由另一位萨满祭司和牧师或德鲁伊站在“冒险者遗骸”旁边的队伍, 或者在通用聊天频道中寻找萨满祭司和牧师或德鲁伊的帮助(在聊天框中输入 /1)|r
    >>|cRXP_WARN_与地面上的|cRXP_FRIENDLY_冒险者遗骸|r交谈以开始仪式, 或点击其他玩家的|r|T136223:0|t[灵魂仪式]|cRXP_WARN_(处于其队伍中时)|r
    >>|cRXP_WARN_仪式完成后, |cRXP_FRIENDLY_冒险者之魂|r会现身并随即消亡. 击败它以获取|r|T237571:0|t|cRXP_LOOT_[祖先的回响]|r
    .collect 210589,1 --Echo of the Ancestors (1)
    .target Adventurer's Remains
    .target Adventurer's Spirit
    .skipgossip
    .train 410099,1
    .xp <3,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T237571:0|t|cRXP_LOOT_[先祖回响]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹裤 - 先祖指引]
    .use 210589
    .itemcount 210589,1 --Echo of the Ancestors (1)
    .train 410099,1
    .xp <3,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 大地之道 - 12(贫瘠之地)
#displayname Way of Earth
#next 水之盾 - 20(贫瘠之地)



step
    +|cRXP_WARN_你必须至少达到12级才能获得|r|T134596:0|t[刻印长裤 - 地之途]|cRXP_WARN_因为这是训练所需的等级要求|r|T136075:0|t[净化]
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T134596:0|t[雕刻裤 - 土之道]
    >>|cRXP_WARN_或者, 你可以在银松森林1级及以上地点获得|r|T134596:0|t[雕文长裤 - 土之途]|r
    .train 410107,1
    .xp >12,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 370,1
    .xp <12,1
step
    #completewith next
    .goto Orgrimmar,40.31,37.01,15,0
    .goto Orgrimmar,38.81,36.37,15 >>前往|cRXP_FRIENDLY_Kardris|r
    .zoneskip Thunder Bluff
    .train 410107,1
    .xp <12,1
step
    .goto Orgrimmar,38.81,36.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 370 >>训练 |T136075:0|t[清除]
    .target Kardris Dreamseeker
    .zoneskip Thunder Bluff
    .train 410107,1
    .xp <12,1
step
    #completewith next
    .goto Thunder Bluff,22.82,21.11,15 >>前往|cRXP_FRIENDLY_Siln|r
    .zoneskip Orgrimmar
    .train 410107,1
    .xp <12,1
step
    .goto Thunder Bluff,22.82,21.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希恩·逐星|r 交谈
    .train 370 >>训练 |T136075:0|t[清除]
    .target Siln Skychaser
    .zoneskip Orgrimmar
    .train 410107,1
    .xp <12,1
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 410107,1
    .xp <12,1
step
    #loop
    .goto The Barrens,55.77,34.01,40,0 --Spawn 1
    .goto The Barrens,55.83,34.21,40,0
    .goto The Barrens,54.81,35.95,40,0 --Spawn 2
    .goto The Barrens,54.96,35.72,40,0
    .goto The Barrens,57.47,36.03,40,0 --Spawn 3
    .goto The Barrens,57.56,35.78,40,0
    .goto The Barrens,57.46,35.70,40,0
    .goto The Barrens,57.59,38.36,40,0 --Spawn 4
    .goto The Barrens,57.49,38.65,40,0
    .goto The Barrens,58.82,37.67,40,0 --Spawn 5
    .goto The Barrens,58.92,37.53,40,0
    .goto The Barrens,58.94,37.73,40,0
    >>对|cRXP_ENEMY_Desert Mirage|r施放 |T136075:0|t[净化] 以击杀它. 击杀后可拾取 |T134419:0|t|cRXP_LOOT_[土之符文]|r
    .collect 208758,1 --Earthen Rune (1)
    .unitscan Desert Mirage
    .train 410107,1
    .xp <12,1
--XX Respawns after 85s-170s
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[大地符文]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹长裤 - 土之径]
    .use 208758
    .itemcount 208758,1 --Earthen Rune (1)
    .train 410107,1
    .xp <12,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 大地之道 - 14(银松森林)
#displayname Way of Earth
#next 水盾 - 20(银松森林)

step
    +|cRXP_WARN_你至少需达到14级, 才能在银松森林单独获得|r |T134596:0|t[雕纹长裤 - 地之途] |r
    >>|cRXP_WARN_你需要先提升等级, 才能尝试获取|r|T134596:0|t[雕刻裤 - 土之道]
    .train 410107,1
    .xp >14,1
step
    #completewith next
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .train 410107,1
step
    #loop
    .goto Silverpine Forest,45.68,22.63,30,0
    .goto Silverpine Forest,45.09,23.63,30,0
    .goto Silverpine Forest,44.16,22.47,30,0
    .goto Silverpine Forest,44.05,21.66,30,0
    .goto Silverpine Forest,45.05,20.75,30,0
    .goto Silverpine Forest,45.07,19.79,30,0
    .goto Silverpine Forest,45.59,19.29,30,0
    .goto Silverpine Forest,46.18,19.74,30,0
    .goto Silverpine Forest,46.62,20.44,30,0
    .goto Silverpine Forest,46.07,21.92,30,0
    >>击杀|cRXP_ENEMY_腐皮秘法师|r. 击败他们以获取 |T136008:0|t|cRXP_LOOT_[腐化图腾]|r
    .collect 210253,1 --Rot Hide Totem (1)
    .mob Rot Hide Mystic
    .itemcount 208758,<1 --Earthen Rune (1)
    .train 410107,1
step
    #completewith Rune
    .cast 425285 >>|cRXP_WARN_使用|r|T136008:0|t|cRXP_LOOT_[腐烂图腾]|r|cRXP_WARN_召唤|cRXP_ENEMY_腐化元素|r
    .use 210253 --Rot Hide Totem (1)
    .itemcount 210253,1 --Rot Hide Totem (1)
    .train 410107,1
    .xp <14,1
step
    #completewith next
    .cast 425285 >>|cRXP_WARN_使用|r|T136008:0|t|cRXP_LOOT_[腐烂图腾]|r|cRXP_WARN_召唤|cRXP_ENEMY_腐化元素|r
    >>|cRXP_WARN_小心它施放|r|T135848:0|t[冰霜新星]|cRXP_WARN_(远程瞬发:造成约 50 点伤害并定身 8 秒), 等级为 15|r
    .use 210253 --Rot Hide Totem (1)
    .itemcount 210253,1 --Rot Hide Totem (1)
    .train 410107,1
    .xp >14,1
step
    #label Rune
    >>击杀|cRXP_ENEMY_Decayed Elemental|r, 掉落 |T134419:0|t|cRXP_LOOT_[大地符文]|r
    .collect 208758,1 --Earthen Rune (1)
    .mob Decayed Elemental
    .train 410107,1
--XX Need to test if it can be summoned anywhere, and how much or how scary it is
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[大地符文]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹长裤 - 土之径]
    .use 208758
    .itemcount 208758,1 --Earthen Rune (1)
    .train 410107,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 巨灵幽魂狼 - 25(石爪山脉)
#displayname Greater Ghost Wolf
#next 双持专精 - 25(瑞特)


step
    +|cRXP_WARN_你至少需要达到 25 级, 才能单独在石爪山脉获得|r|T134596:0|t[雕文长裤 - 强化幽灵狼] |r
    .train 425343,1
    .xp >25,1
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 425343,1
step
    #loop
    .goto Stonetalon Mountains,28.45,65.00,0
    .goto Stonetalon Mountains,28.45,65.00,50,0
    .goto Stonetalon Mountains,29.08,71.97,50,0
    .goto Stonetalon Mountains,33.43,68.97,50,0
    .goto Stonetalon Mountains,33.49,69.40,50,0
    .goto Stonetalon Mountains,36.85,72.04,50,0
    >>击杀|cRXP_ENEMY_Primordial Anomaly|r. 击败后拾取其掉落的 |T134419:0|t|cRXP_LOOT_[原初愤怒符文]|r
    >>|cRXP_WARN_务必检查其形态(减益效果). 如果处于|r|T136074:0|t[自然形态]|cRXP_WARN_, 则造成|r|T135824:0|t[火焰伤害]|cRXP_WARN_. 如果处于|r|T135819:0|t[火焰形态]|cRXP_WARN_, 则造成|r|T135865:0|t[冰霜伤害]|cRXP_WARN_. 如果处于|r|T135861:0|t[水之形态]|cRXP_WARN_, 则造成|r|T136085:0|t[自然伤害]
    >>|cRXP_WARN_注意它会施放 |T132939:0|t[击飞]|cRXP_WARN_(近战瞬发:将目标击飞至空中并造成80点伤害)|r
    >>|cRXP_WARN_它有5-8分钟的刷新时间, 每次击杀都会掉落一件随机的绑定到角色(BoE)的绿色装备|r
    .collect 210811,1 --Rune of Primordial Fury (1)
    .mob Primordial Anomaly
    .train 425343,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[原始愤怒符文]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹裤子 - 强化幽灵狼]
    .use 210811
    .itemcount 210811,1 --Rune of Primordial Fury (1)
    .train 425343,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 大地之盾 - 25(艾泽拉斯)
#displayname Earth Shield
#next 过载 - 3(杜洛塔尔) << Orc Shaman/Troll Shaman
#next 过载 - 3(莫高雷) << Tauren Shaman


step
    +|cRXP_WARN_你必须至少达到 25 级才能获得|r|T134596:0|t[雕纹长裤 - 地之盾] |cRXP_WARN_, 因为这是进入黑暗深渊的等级要求|r
    .train 410101,1
    .xp >25,1
step
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Thunder Bluff
    .train 410101,1
    .xp <25,1
step
    .goto Orgrimmar,50.67,70.39,0
    .goto Orgrimmar,53.74,64.60,15,0
    .goto Orgrimmar,55.54,64.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师瓦巴恩交谈|cRXP_FRIENDLY_Auctioneer Wabang|r
    >>|cRXP_BUY_购买|r|T134797:0|t[水下呼吸药剂]|cRXP_BUY_和|r|T134717:0|t[智慧药剂]|cRXP_BUY_从拍卖行|r
    >>|cRXP_WARN_或者, 购买材料自行制作:2|r|T132799:0|t[黑口鱼油]|cRXP_WARN_(或4|r|T134302:0|t[油性黑口鱼]|cRXP_WARN_用于合成鱼油), 1|r|T134191:0|t[绞喉海藻]|cRXP_WARN_, 1|r|T133436:0|t[魔皇草]|cRXP_WARN_, 以及2|r|T134412:0|t[荆棘藤]
    >>|cRXP_WARN_你需要这个来完成后续任务. 在此之前请勿使用它们|r
    .collect 5996,1 --Elixir of Water Breathing (1)
    .collect 3383,1 --Elixir of Wisdom (1)
    .target Auctioneer Wabang
	.skill alchemy,<90,1
    .zoneskip Orgrimmar,1
    .train 410101,1
    .xp <25,1
step
    .goto Orgrimmar,50.67,70.39,0
    .goto Orgrimmar,53.74,64.60,15,0
    .goto Orgrimmar,55.54,64.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师瓦巴恩交谈|cRXP_FRIENDLY_Auctioneer Wabang|r
    >>|cRXP_BUY_购买|r|T134797:0|t[水下呼吸药剂]|cRXP_BUY_和|r|T134717:0|t[智慧药剂]|cRXP_BUY_从拍卖行|r
    >>|cRXP_WARN_你需要这个来完成后续任务. 在此之前请勿使用它们|r
    .collect 5996,1 --Elixir of Water Breathing (1)
    .collect 3383,1 --Elixir of Wisdom (1)
    .target Auctioneer Wabang
    .zoneskip Orgrimmar,1
    .train 410101,1
    .xp <25,1
step
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_购买|r|T134797:0|t[水下呼吸药剂]|cRXP_BUY_和|r|T134717:0|t[智慧药剂]|cRXP_BUY_从拍卖行|r
    >>|cRXP_WARN_或者, 购买材料自行制作:2|r|T132799:0|t[黑口鱼油]|cRXP_WARN_(或4|r|T134302:0|t[油性黑口鱼]|cRXP_WARN_用于合成鱼油), 1|r|T134191:0|t[绞喉海藻]|cRXP_WARN_, 1|r|T133436:0|t[魔皇草]|cRXP_WARN_, 以及2|r|T134412:0|t[荆棘藤]
    >>|cRXP_WARN_你需要这个来完成后续任务. 在此之前请勿使用它们|r
    .collect 5996,1 --Elixir of Water Breathing (1)
    .collect 3383,1 --Elixir of Wisdom (1)
    .target Auctioneer Stampi
	.skill alchemy,<90,1
    .zoneskip Thunder Bluff,1
    .train 410101,1
    .xp <25,1
step
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_购买|r|T134797:0|t[水下呼吸药剂]|cRXP_BUY_和|r|T134717:0|t[智慧药剂]|cRXP_BUY_从拍卖行|r
    >>|cRXP_WARN_你需要这个来完成后续任务. 在此之前请勿使用它们|r
    .collect 5996,1 --Elixir of Water Breathing (1)
    .collect 3383,1 --Elixir of Wisdom (1)
    .target Auctioneer Stampi
    .zoneskip Thunder Bluff,1
    .train 410101,1
    .xp <25,1
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410101,1
    .xp <25,1
step
    #completewith next
    .goto Kalimdor,44.36,34.86
    >>|cRXP_WARN_加入或创建一个全新的(0/7)10人团队, 挑战黑暗深渊副本|r
    .subzone 2797,2 >>前往BFD副本入口. 进入区域
    .train 410101,1
    .xp <25,1
step
    >>击杀黑沼深渊中的|r阿奎尼斯男爵|cRXP_ENEMY_. 从他身上搜刮出|r[奇怪的水球]|cRXP_LOOT_(图标:|T136222:0|t)
    .collect 211454,1 --Strange Water Globe (SoD) (1)
    .mob Baron Aquanis
    .train 410101,1
    .xp <25,1
step
    >>使用 |T136222:0|t|cRXP_LOOT_[奇怪的水球]|r开始任务
    .accept 78920 >>接任务: |cRXP_LOOT_阿奎尼斯男爵|r
    .use 211454
    .itemcount 211454,1 --Strange Water Globe (SoD) (1)
    .train 410101,1
    .xp <25,1
step
    #completewith Baron
    >>|cRXP_WARN_如果你想完成团队副本, 就去完成吧, 然后离开黑暗深渊|r
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .zoneskip 221,1
    .train 410101,1
    .xp <25,1
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410101,1
    .xp <25,1
step
    #label Baron
    .goto Ashenvale,11.56,34.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 78920 >>交还阿奎尼斯男爵的任务
    .accept 78506 >>接受元素困扰
    .target Je'neu Sancrea
    .train 410101,1
    .xp <25,1
step
#loop
	.line Ashenvale,48.36,69.74,48.43,70.14,48.93,70.82,49.49,70.76,50.21,70.36,50.47,70.43,50.54,71.08,50.74,71.31,51.42,70.86,52.13,71.14,52.18,71.60,52.08,72.10,45.84,70.67,48.36,69.74
	.goto Ashenvale,48.36,69.74,50,0
	.goto Ashenvale,48.43,70.14,50,0
	.goto Ashenvale,48.93,70.82,50,0
	.goto Ashenvale,49.49,70.76,50,0
	.goto Ashenvale,50.21,70.36,50,0
	.goto Ashenvale,50.47,70.43,50,0
	.goto Ashenvale,50.54,71.08,50,0
	.goto Ashenvale,50.74,71.31,50,0
	.goto Ashenvale,51.42,70.86,50,0
	.goto Ashenvale,52.13,71.14,50,0
	.goto Ashenvale,52.18,71.60,50,0
	.goto Ashenvale,52.08,72.10,50,0
	.goto Ashenvale,45.84,70.67,50,0
	.goto Ashenvale,48.36,69.74,50,0
    >>击杀 |cRXP_ENEMY_污浊的水元素|r. 击败它们可获得 |T132844:0|t|cRXP_LOOT_[暴怒之尘]|r
    .complete 78506,3 --Mote of Torrential Rage (1)
    .mob Befouled Water Elemental
    .train 410101,1
    .xp <25,1
--XX Needs to be converted to hashtag loop
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .train 410101,1
    .xp <25,1
step
    #loop
    #completewith next
    .goto Stonetalon Mountains,45.60,44.18,50,0 --NE Rogue Flame Shared Spawn Cluster (NE Spawnpoints)
    .goto Stonetalon Mountains,44.54,43.43,50,0
    .goto Stonetalon Mountains,43.96,39.90,50,0
    .goto Stonetalon Mountains,43.62,41.14,50,0
--
    .goto Stonetalon Mountains,37.09,46.62,50,0 --Path Rogue Flame Shared Spawn Cluster (Middle Spawnpoints)
    .goto Stonetalon Mountains,35.71,47.81,50,0
    .goto Stonetalon Mountains,37.21,48.30,50,0
    .goto Stonetalon Mountains,36.50,49.86,50,0
    .goto Stonetalon Mountains,37.18,51.87,50,0
    .goto Stonetalon Mountains,35.33,53.88,50,0
    .goto Stonetalon Mountains,34.59,60.23,50,0
    .goto Stonetalon Mountains,33.38,62.23,50,0
--
    .goto Stonetalon Mountains,35.22,65.79,50,0 --Start of Burning Destroyers and Ravagers
    .goto Stonetalon Mountains,36.42,71.05,50,0
    .goto Stonetalon Mountains,35.73,73.27,50,0
    .goto Stonetalon Mountains,34.50,72.62,50,0
    .goto Stonetalon Mountains,33.64,71.17,50,0
    .goto Stonetalon Mountains,33.49,70.48,50,0
    .goto Stonetalon Mountains,31.67,71.11,50,0
    .goto Stonetalon Mountains,31.13,73.45,50,0
    .goto Stonetalon Mountains,30.13,73.32,50,0
    .goto Stonetalon Mountains,30.97,67.39,50,0
    .goto Stonetalon Mountains,28.25,65.96,50,0
    >>击杀|cRXP_ENEMY_游荡的焰灵|r和|cRXP_ENEMY_燃烧的破坏者|r和|cRXP_ENEMY_燃烧的掠夺者|r. 击败它们后拾取掉落物品:|T132839:0|t|cRXP_LOOT_[地狱火爪牙狂暴]|r
    >>|cRXP_ENEMY_游荡的焰灵|r|cRXP_WARN_共享 spawns with|r|cRXP_ENEMY_黑色石化蜥蜴|r
    .complete 78506,2 --Mote of Infernal Rage (1)
    .mob Rogue Flame Spirit
    .mob Burning Destroyer
    .mob Burning Ravager
    .train 410101,1
    .xp <25,1
--XX Did waypoints in WOTLK, may be slightly off but i'd put more money on it being accurate than not
step
    #loop
    .goto Stonetalon Mountains,34.07,65.61,50,0
    .goto Stonetalon Mountains,36.42,71.05,50,0
    .goto Stonetalon Mountains,35.88,72.31,50,0
    .goto Stonetalon Mountains,32.49,73.81,50,0
    .goto Stonetalon Mountains,32.64,67.42,50,0
    .goto Stonetalon Mountains,28.99,65.18,50,0
    >>击杀|cRXP_ENEMY_狂怒的石灵|r 和|cRXP_ENEMY_暴烈的石灵|r . 击败它们后可获得 |T132838:0|t|cRXP_LOOT_[地震之核]|r|cRXP_WARN_请注意该区域内的危险敌人. |r
    .complete 78506,1 --Mote of Seismic Rage (1)
    .mob Enraged Stone Spirit
    .mob Furious Stone Spirit
    .train 410101,1
    .xp <25,1
--XX Not totally sure if any of the elementals in the charred vale do/don't share spawns? It's a total clown fiesta
step
    #loop
    .goto Stonetalon Mountains,45.60,44.18,50,0
    .goto Stonetalon Mountains,44.54,43.43,50,0
    .goto Stonetalon Mountains,43.96,39.90,50,0
    .goto Stonetalon Mountains,43.62,41.14,50,0
    .goto Stonetalon Mountains,37.09,46.62,50,0
    .goto Stonetalon Mountains,35.71,47.81,50,0
    .goto Stonetalon Mountains,37.21,48.30,50,0
    .goto Stonetalon Mountains,36.50,49.86,50,0
    .goto Stonetalon Mountains,37.18,51.87,50,0
    .goto Stonetalon Mountains,35.33,53.88,50,0
    .goto Stonetalon Mountains,34.59,60.23,50,0
    .goto Stonetalon Mountains,33.38,62.23,50,0
    .goto Stonetalon Mountains,35.22,65.79,50,0
    .goto Stonetalon Mountains,36.42,71.05,50,0
    .goto Stonetalon Mountains,35.73,73.27,50,0
    .goto Stonetalon Mountains,34.50,72.62,50,0
    .goto Stonetalon Mountains,33.64,71.17,50,0
    .goto Stonetalon Mountains,33.49,70.48,50,0
    .goto Stonetalon Mountains,31.67,71.11,50,0
    .goto Stonetalon Mountains,31.13,73.45,50,0
    .goto Stonetalon Mountains,30.13,73.32,50,0
    .goto Stonetalon Mountains,30.97,67.39,50,0
    .goto Stonetalon Mountains,28.25,65.96,50,0
    >>击杀|cRXP_ENEMY_游荡的焰灵|r和|cRXP_ENEMY_燃烧的破坏者|r和|cRXP_ENEMY_燃烧的掠夺者|r. 击败它们后拾取掉落物品:|T132839:0|t|cRXP_LOOT_[地狱火爪牙狂暴]|r
    >>|cRXP_ENEMY_游荡的焰灵|r|cRXP_WARN_共享 spawns with|r|cRXP_ENEMY_黑色石化蜥蜴|r
    .complete 78506,2 --Mote of Infernal Rage (1)
    .mob Rogue Flame Spirit
    .mob Burning Destroyer
    .mob Burning Ravager
    .train 410101,1
    .xp <25,1
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410101,1
    .xp <25,1
step
    .goto Ashenvale,11.56,34.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 78506 >>提交元素困扰
    .accept 78537 >>接受洞察药水
    .accept 78537 >>交付洞察药水
    .accept 78561 >>接受洞察药水
    .target Je'neu Sancrea
    .train 410101,1
    .xp <25,1
step
    .goto Ashenvale,11.38,33.08
    >>在篝火附近使用 |T134791:0|t[洞察药水]
    >>|cRXP_WARN_你无需等待剧情播放(RP)|r
    .complete 78561,1 --Vision Witnessed (1)
    .use 210712
    .train 410101,1
    .xp <25,1
step
    .goto Ashenvale,11.56,34.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 78561 >>交付洞察药水
    .accept 78575 >>接受希泽克
    .target Je'neu Sancrea
    .train 410101,1
    .xp <25,1
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .train 410101,1
    .xp <25,1
step
    .goto The Barrens,43.18,78.59
    >>击杀|cRXP_ENEMY_Hirzek|r. 击败他后搜刮出 |T135146:0|t|cRXP_LOOT_[Hirzek的法杖]|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Hirzek|r会施放|r|T135805:0|t[闪电箭]|cRXP_WARN_(远程施法:造成约110点自然伤害), 他是一个等级25的精英怪. 虽然可以单刷, 但建议找人协助|r
    >>|cRXP_WARN_请注意, 如果击杀|cRXP_ENEMY_Hirzek|r而让|cRXP_ENEMY_Bound Elemental|r生存, 该元素怪将拥有无限追踪距离(它会一直跟随你, 直到被你击杀或消失)|r
    .complete 78575,1 --Hirzek's Staff (1)
    .complete 78575,2 --Hirzek (1)
    .mob Hirzek
    .mob Bound Elemental
    .train 410101,1
    .xp <25,1
--XX Objective IDs (,1 and ,2) need testing
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .train 410101,1
    .xp <25,1
step
    .goto Ashenvale,11.56,34.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 78575 >>交还赫泽克的物品
    .target Je'neu Sancrea
    .train 410101,1
    .xp <25,1
step
    .cast 402265 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[大地之盾符文]|r|cRXP_WARN_来学习|r|T134596:0|t[雕纹长裤 - 大地之盾]
    .use 210746
    .itemcount 210746,1 --Rune of Earth Shield (1)
    .train 410101,1
    .xp <25,1
    --XX Rune Routing will never be good for this
step << skip
    +恭喜！您已获得当前所有可用的符文
    .train 410094,3 --Overload
    .train 410095,3 --Lava Burst
    .train 410096,3 --Dual Wield Specialization
    .train 410097,3 --Water Shield
    .train 410098,3 --盾牌精通
    .train 410099,3 --Ancestral Guidance
    .train 410101,3 --Earth Shield
    .train 410104,3 --Lava Lash
    .train 410107,3 --Way of Earth
    .train 416057,3 --Healing Rain
    .train 425343,3 --Shamanistic Rage
    .train 425344,3 --Molten Blast
    .xp <25,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 火焰新星 - 35(艾泽拉斯)
#displayname Fire Nova

-- Fire Nova

step
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .goto Desolace,56.6,21.8
    >>击杀|cRXP_ENEMY_Flameseer Dubelen|r. 击败他后搜刮出 |T136008:0|t|cRXP_LOOT_火焰图腾|r
    .collect 213451,1
    .mob Flameseer Dubelen
step
    .goto 1443,38.23,61,25,0
    .goto 1443,37.13,60.41,25,0
    .goto 1443,35.38,58.25,25,0
    .goto 1443,33.03,55.4,25,0
    .goto 1443,30.87,57.86,25,0
    .goto 1443,29.85,62.5,25,0
    .goto 1414,38.38,57.98,25,0
    .goto 1414,38.42,57.98,25,0
    .goto 1414,38.35,58.14,25,0
    .goto 1414,38.28,58.17,25,0
    .goto 1414,38.24,58.03,25,0
    .goto 1414,38.31,58.02,25,0
    .goto 1414,38.47,58.17,25,0
    .goto 1414,38.6,58.24,25,0
    .goto 1414,38.73,58.18,25,0
    .goto 1414,38.83,58.31,25,0
    .goto 1414,39.01,58.3,25,0
    .goto 1414,39.17,58.09,25,0
    .goto 1414,39.01,57.87,25,0
    .goto 1414,39.26,57.69
    >>点击橙色水晶中的|cRXP_PICK_Blue Crystal|r以收集 |T134088:0|t[瑟莱德丝之泪]
    >>|cRXP_WARN_注意, 此区域的敌人均为精英怪, 他们能造成眩晕. |r|cFFFF0000你很可能要死好几次|r
    .collect 213552,1
step
    .goto 1414,38.45,57.84,25,0
    .goto 1414,38.64,57.69,25,0
    .goto 1414,38.52,57.52,25,0
    .goto 1414,38.43,57.43,25,0
    .goto 1443,29.65,57.19,25,0
    .goto 1443,27.72,57.51
    >>点击紫色水晶中的|cRXP_PICK_Blue Crystal|r以收集|T134088:0 |t[瑟莱德丝之泪]
    >>|cRXP_WARN_注意, 此区域的敌人均为精英怪, 他们能造成眩晕. |r|cFFFF0000你很可能要死好几次|r
    .collect 213553,1
step
    #completewith next
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step
    .goto Orgrimmar,38.94,38.39
    .gossip 4047 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐尔·孤树|r交谈并选择对话选项
    -- .gossipoption --x insert id
    .target Zor Lonetree
step
    #completewith next
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
step
    .goto Thunder Bluff,78.61,28.55
    .gossip 5769 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈并选择选项
    -- .gossipoption --x insert id
    .target Arch Druid Hamuul Runetotem
step
    -- .gossipoption --x insert id
    .goto Thunder Bluff,47.00,49.82
    .gossip 2995 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈, 并选择对话选项前往月光林地
    .target Tal
step
    #completewith next
    .zone Moonglade >>前往: |cRXP_PICK_月光林地|r
step
    .goto Moonglade,36.178,41.798
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守护者雷姆洛斯|r交谈
    .collect 213558,1
    .target Keeper Remulos
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 漩涡武器 - 40(艾泽拉斯)
#displayname Maelstrom Weapon

-- Maelstrom Weapon

step
    .train 410100,1
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step
    .train 410100,1
    .goto The Barrens,43.46,90.18,0
    .goto The Barrens,43.46,90.18,40,0
    .goto 1414,50.877,70.339
    .subzone 491,2 >>进入剃刀沼泽(Razorfen Kraul)
step
    .train 410100,1
    >>击杀|cRXP_ENEMY_卡尔加·刺肋|r. 击败他后搜刮出|T134944:0 |t|cRXP_LOOT_破烂的笔记|r. 使用该物品接受任务
    >>|cRXP_WARN_强烈建议组队5名玩家完成此任务|r
    .collect 212748,1 --Tattered Note (1x)
    .accept 79358 >>接任务: |cRXP_WARN_破烂的笔记|r
    .mob Charlga Razorflank
step
    .train 410100,1
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 410100,1
    .goto Thousand Needles,46.10,51.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳恩·峭壁行者|r交谈
    .turnin 79358 >>交任务: |cRXP_FRIENDLY_破烂的笔记|r
    .accept 79360 >>接受元素援助
    .target Rau Cliffrunner
step
    .train 410100,1
    .goto Thousand Needles,46.21,51.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹迪亚|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132793:0|t[空瓶]|r
    .collect 8925,1 --Crystal Vial (1x)
    .target Jandia
step
    .train 410100,1
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    .train 410100,1
    .goto Alterac Mountains,80.499,66.923
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_风之守望者巴萨拉|r
    .turnin 79360 >>提交元素援助
    .accept 79361 >>接受风的力量
    .accept 79362 >>接受大地之力
    .accept 79363 >>接受水的力量
    .target Bath'rah the Windwatcher
step
    .train 410100,1
    #completewith next
    .zone Desolace >>前往: |cRXP_PICK_凄凉之地|r
step
    .train 410100,1
    #loop
    .goto Desolace,48.0,27.2,0
    .goto Desolace,40.6,37.0,0
    .goto Desolace,50.8,42.0,0
    .goto Desolace,64.4,39.4,0
    .goto Desolace,68.4,48.4,0
    .goto Desolace,69.4,64.6,0
    .goto Desolace,58.8,65.6,0
    .waypoint Desolace,48.0,27.2,25,0
    .waypoint Desolace,40.6,37.0,25,0
    .waypoint Desolace,50.8,42.0,25,0
    .waypoint Desolace,64.4,39.4,25,0
    .waypoint Desolace,68.4,48.4,25,0
    .waypoint Desolace,69.4,64.6,25,0
    .waypoint Desolace,58.8,65.6,25,0
    >>击杀凄凉之地中的旋风元素, 从它们身上获取掉落的旋转精华
    .complete 79361,1 -- Power of da Wind
    .mob Whirlwind Ripper
    .mob Whirlwind Stormwalker
    .mob Whirlwind Shredder
step
    .train 410100,1
    #completewith next
    .zone Dustwallow Marsh >>前往: |cRXP_PICK_尘泥沼泽|r
step
    .train 410100,1
    #loop
    .goto Dustwallow Marsh,42.6,30.0,0
    .goto Dustwallow Marsh,35.2,44.6,0
    .goto Dustwallow Marsh,42.6,62.0,0
    .goto Dustwallow Marsh,50.0,54.0,0
    .waypoint Dustwallow Marsh,42.6,30.0,25,0
    .waypoint Dustwallow Marsh,35.2,44.6,25,0
    .waypoint Dustwallow Marsh,42.6,62.0,25,0
    .waypoint Dustwallow Marsh,50.0,54.0,25,0
    >>击杀尘泥沼泽中的枯藤元素, 从它们身上获取奔涌之息
    .complete 79363,1 -- Power of da Water
    .mob Withervine Mire Beast
    .mob Withervine Rager
    .mob Withervine Bark Ripper
    .mob Withervine Creeper
step
    .train 410100,1
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
step
    .train 410100,1
    #loop
    .goto Badlands,18.0,42.8,0
    .waypoint Badlands,21.2,45.8,50,0
    .waypoint Badlands,18.0,42.8,50,0
    .waypoint Badlands,13.8,38.6,50,0
    .waypoint Badlands,21.2,45.8,50,0
    .waypoint Badlands,18.0,42.8,50,0
    >>击杀|cRXP_ENEMY_次级石元素|r和|cRXP_ENEMY_石元素|r, 击败它们后可获得 |T132846:0|t|cRXP_LOOT_隆隆之魂|r
    .complete 79362,1 -- Power of da Earth
    .mob Rock Elemental
    .mob Lesser Rock Elemental
step
    .train 410100,1
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    .train 410100,1
    .goto Alterac Mountains,80.499,66.923
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_风之守望者巴萨拉|r
    .turnin 79361 >>提交风之力
    .turnin 79362 >>交还大地之力
    .turnin 79363 >>交出水的力量
    .accept 79364 >>接受一个简易容器
    .turnin 79364 >>提交简单容器
    .accept 79365 >>接受「翼下之风」
    .target Bath'rah the Windwatcher
step
    .train 410100,1
    #completewith next
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 410100,1
    .goto Thousand Needles,46.10,51.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳恩·峭壁行者|r交谈
    .turnin 79365 -- With Wind Beneath Your Wings
    .accept 79366 --Calm Before the Storm
    .target Rau Cliffrunner
step
    .train 410100,1
    .gossip 4317 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈瑟|r 对话, 并选择第二个对话选项
    .target Nyse
step
    .train 410100,1
    >>击杀|cRXP_ENEMY_Ravaging Tempest|r, 拾取其掉落物品|cRXP_LOOT_Eye of the Tempest|r
    >>|cRXP_WARN_如果你在此过程中死亡, 请与|r|cRXP_FRIENDLY_灵魂医者|r|cRXP_WARN_交谈, 以传送至你的尸体处|r
    .collect 212792,1 --Eye of the Tempest (1x)
    .mob Dreath's Head Necromancer
    .mob Skeletal Servant
    .mob Ravaging Tempest
step
    .train 410100,1
    .vehicle >>与|cRXP_FRIENDLY_乱风岗双足飞龙|r互动
    .timer 9, Flight RP
step
    .train 410100,1
    .goto Thousand Needles,46.10,51.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳恩·峭壁行者|r交谈
    .turnin 79366 --Calm Before the Storm
    .accept 79442 --Catching up
    .target Rau Cliffrunner
step
    .train 410100,1
    #completewith next
    .zone Hillsbrad Foothills >>前往: |cRXP_PICK_希尔斯布莱德丘陵|r
step
    .train 410100,1
    .goto Alterac Mountains,80.499,66.923
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t交谈|cRXP_FRIENDLY_风之守望者巴萨拉|r
    .turnin 79442 --Catching up
    .target Bath'rah the Windwatcher
step
    .train 410100 >>|cRXP_WARN_ 使用|r|T134419:0|t[|cRXP_FRIENDLY_风暴符文|r] 来学习 |T136032:0|t[狂暴之刃]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#name 能量涌动 - 30(阿拉希高地)
#displayname Power Surge

-- Power Surge

step
    .train 416054,1
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r, 前往 |cFFfa9602阿拉希高地|r |cRXP_WARN_|cRXP_WARN_强烈建议至少组成 3 人小组。|r
step
    .train 416054,1
    .goto Arathi Highlands,31.91,41.15,50,0
    .goto Arathi Highlands,35.53,40.93,50,0
    .goto Arathi Highlands,35.51,44.26,50,0
    .goto Arathi Highlands,34.40,44.25,12,0
    .goto Arathi Highlands,31.08,43.68,12,0
    .goto Arathi Highlands,34.40,44.25,12,0
    .goto Arathi Highlands,35.51,44.26
    >>击杀 |cRXP_ENEMY_石拳食人魔|r和 |cRXP_ENEMY_石拳蛮兵|r. 从他们身上搜刮出 |T134921:0|t|cRXP_LOOT_[闪电法杖]|r
    .collect 213426,1 --Ogre Lightning Rod (1x)
    .mob Boulderfist Ogre
    .mob Boulderfist Enforcer
step
    .train 416054,1
    .goto Arathi Highlands,33.45,44.49
    .cast 434350 >>点击|cRXP_PICK_软土|r, 将 |T134921:0|t|cRXP_LOOT_[闪电法杖]|r插入地面
step
    .train 416054,1
    >>对|cRXP_ENEMY_闪电法杖|r施放 |T136048:0|t[闪电箭] 10 次
    >>击杀|cRXP_ENEMY_Tamkar|r或在它出现时风筝处理. 击败后可拾取 |T134419:0|t[能量符文]
    >>|cRXP_WARN_他将在30秒后自动死亡, 因此你可以采用风筝(kite)的方式引怪, 而不是直接击杀|r
    .collect 213093,1 --Rune of Power (1x)
    .mob Lightning Rod
    .mob Tamkar
step
    .train 416054 >>|cRXP_WARN_使用|r|T134419:0|t[能量符文] |cRXP_WARN_来学习|r|T134337:0|t[能量爆发]
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#displayname Decoy Totem
#name 诱饵图腾 - 27(千针石林)

-- Decoy Totem

step
    .train 425882,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    .train 425882,1
    .goto Thousand Needles,46.21,51.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹迪亚|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132906:0|t[丝线]|r
    .collect 4291,1 --Silken Thread (1)
    .target Jandia
step
    .train 425882,1
    #loop
    .goto Thousand Needles,55.42,51.96,0
    .waypoint Thousand Needles,55.42,51.96,40,0
    .waypoint Thousand Needles,56.68,49.88,40,0
    .waypoint Thousand Needles,55.97,45.97,40,0
    .waypoint Thousand Needles,54.29,48.10,40,0
    >>击杀|cRXP_ENEMY_云蛇|r. 从它们身上获取|cRXP_LOOT_云蛇之牙|r
    .collect 213709,3 --Cloud Serpent Fang (3x)
    .mob Cloud Serpent
    .mob Venomous Cloud Serpent
    .mob Elder Cloud Serpent
step
    .train 425882,1
    #loop
    .goto Thousand Needles,27.65,49.47,0
    .goto Thousand Needles,26.55,55.77,0
    .waypoint Thousand Needles,27.65,49.47,40,0
    .waypoint Thousand Needles,27.16,51.62,15,0
    .waypoint Thousand Needles,26.29,52.79,15,0
    .waypoint Thousand Needles,27.23,54.04,15,0
    .waypoint Thousand Needles,26.55,55.77,15,0
    >>击杀cRXP_ENEMY_Screeching Harpies|r, 掠夺他们的|cRXP_LOOT_Strong Harpy Feathers|r
    .collect 213701,10 --Strong Harpy Feather (10x)
    .mob Screeching Harpy
    .mob Screeching Roguefeather
    .mob Screeching Windcaller
step
    .train 425882,1
    .use 213709 >>|cRXP_WARN_使用你的|r |T133723:0|t[云翼蛇之牙] |cRXP_WARN_来制作|r |T133291:0|t[献给风灵的祭品]
    .collect 213737,1 --Offering to the Wind Spirit (1x)
step
    .goto Thousand Needles,31.47,36.71,30 >>前往暗云峰
step
    #completewith next
    .goto Thousand Needles,33.08,35.33,20,0
    .goto Thousand Needles,32.78,32.24,20,0
    .goto Thousand Needles,32.03,31.36,20,0
    .goto Thousand Needles,32.37,28.64,20,0
    .goto Thousand Needles,32.60,27.51,20,0
    .goto Thousand Needles,34.87,31.76,20,0
    .goto Thousand Needles,34.15,35.77,20,0
    .goto Thousand Needles,33.32,36.24,20 >>前往暗云峰顶
step
    .train 425882,1
    .goto Thousand Needles,39.44,41.98
    .aura 435218 >>|cRXP_WARN_使用|r|T133291:0|t[献给风之灵的祭品]|cRXP_WARN_靠近|r|cRXP_PICK_风之灵祭坛|r
    >>|cRXP_WARN_祭坛位于最东侧尖顶后方的小屋背后|r
    .use 213737
step
    .goto Thousand Needles,40.43,43.29
    >>跳下去向风之灵展现你的信仰, 以获得 |T134419:0|t|cRXP_FRIENDLY_诱饵符文|r
    >>|cRXP_WARN_确保你的|r|T133291:0|t[献给风之灵]|cRXP_WARN_效果不会消失, 持续时间为30秒|r
    .collect 213096,1 --Rune of Decoys (1x)
step
    .train 425882 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_FRIENDLY_诱饵符文|r|cRXP_WARN_来学习|r|T134508:0|t[诱饵图腾]
    .use 213096
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#displayname Spirit of the Alpha
#name 阿尔法之魂 - 27(千针石林)

-- Spirit of the Alpha

step
    .train 410103,1
    .zone Thousand Needles >>前往: |cRXP_PICK_千针石林|r
step
    #completewith next
    .train 410103,1
    .goto Thousand Needles,46.17,52.95,20 >>前往乱风岗以南下方桥的起点
step
    .train 410103,1
    .goto Thousand Needles,46.82,53.52
    >>|cRXP_WARN_使用|r|T136095:0|t[幽灵狼]|cRXP_WARN_小心地跳下去, 前往|r|cRXP_PICK_风化宝箱|r
    >>点击 |cRXP_PICK_Weathered Cache|r 以拾取 |T136095:0|t|cRXP_FRIENDLY_Echo of the Alpha|r
    .collect 206985,1
step
    .train 410103 >>|cRXP_WARN_使用|r|T136095:0|t|cRXP_FRIENDLY_阿尔法的回声|r|cRXP_WARN_来学习|r|T408696:0|t[阿尔法之灵]
    .use 206985
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Rolling Thunder
#name 雷霆滚雷 - 41(塔纳利斯)

-- Rolling Thunder
-- PERMOK: Needs better waypoints

step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 432236,1
step
    .train 432236,1
    .goto Tanaris,43.0,41.2
    .aura 446888,1 >>|cRXP_WARN_点击|r|cRXP_PICK_奇数图腾|r. 这会使你变成幽灵狼|cRXP_WARN_, 并使你受到的伤害增加50%|r
step
    .train 432236,1
    >>|cRXP_WARN_躲避怪物, 朝另一个图腾跑过去. |r搜刮出现的宝箱, 获得 |T134419:0|t[|cRXP_FRIENDLY_滚雷符文|r]
    *|cRXP_WARN_You are receiving 50% additional damage. Be careful!|r. You can also pre-clear the mobs on the path to the other totem
    .goto Tanaris,45.6,37.8
    .collect 220613,1
step
    .itemcount 220613,1
    .use 220613
    .train 432236 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_雷霆滚动符文|r]|cRXP_WARN_来学习|r|T136111:0|t[雷霆滚动]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Static Shock
#name 静电冲击 - 44 (菲拉斯)

-- PERMOK: Needs better waypoints

step
    #completewith ChargedAir
    +|cRXP_WARN_你必须与另一位能帮助你的玩家组队, 才能获得此符文|r
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 432238,1
step
    .train 432238,1
    .goto Feralas,60.0,66.8
    .aura 447259 >>点击|cRXP_PICK_Charged Totem|r获取 |T136075:0|t[充能之风]效果
step
    #label ChargedAir
    .train 432238,1
    >>|cRXP_WARN_靠近图腾并使用闪电伤害(例如闪电盾)击杀周围的|cRXP_ENEMY_戈杜尼食人魔|r, 直到|cRXP_ENEMY_旋风泰匹斯特|r出现
    >>击杀|cRXP_ENEMY_泰匹斯特|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_静电符文|r]
    *|cRXP_WARN_All players of the party have to stay in range of the totem|r
    .goto Feralas,60.0,66.8
    .collect 220614,1
    .mob Whirling Tempest
    .mob Gordunni Warlock
    .mob Gordunni Shaman
    .mob Gordunni Mauler
step
    .itemcount 220614,1
    .use 220614
    .train 432238 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_静电冲击符文|r]|cRXP_WARN_来学习|r|T237587:0|t[静电冲击]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup 头盔
#displayname Tidal Waves
#name 海潮之波 - 42(费伦斯)

-- PERMOK: Needs better waypoints

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 432234,1
step
    .train 432234,1
    >>点击帐篷后面的|cRXP_PICK_Old Crate|r以拾取|T134239:0 |t[旧箱子]
    .goto Feralas,76.6,48.0
    .collect 221497,1
step
    .train 432234,1
    >>点击海底的|cRXP_PICK_Old Chest|r以获取 |T134419:0|t[|cRXP_FRIENDLY_海潮之波符文|r]
    *|cRXP_WARN_Be careful! This will summon FOUR |cRXP_ENEMY_Simmering 元素生物|r (lvl 42, Frost immune)|r
    .goto Feralas,79.2,49.4
    .collect 220612,1
    .mob Simmering Elemental
step
    .itemcount 220612,1
    .use 220612
    .train 432234 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_海浪符文|r] |cRXP_WARN_来学习|r|T237590:0|t[海潮之波]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Tidal Waves
#name 海潮之波 - 45(艾泽拉斯)

--x shiek: needs better coordinates
step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
    .train 432241,1
step
    #loop
    .goto Tanaris,51.6,44.2,40,0
    .goto Tanaris,51.2,52.0,40,0
    .goto Tanaris,41.0,48.6,40,0
    .goto Tanaris,41.8,44.0,40,0
    >>击杀|cRXP_ENEMY_疱爪土狼|r和|cRXP_ENEMY_陆地暴怒者|r和|cRXP_ENEMY_玻璃皮凝视者|r, 击败后掠夺其尸体, 获得|cRXP_LOOT_|T134327:0|t污渍萨满的笔记|r
    .collect 221352,1 --1/1 Smudged Shaman's Notes
    .mob Blisterpaw Hyena
    .mob Land Rager
    .mob Glasshide Gazer
    .train 432241,1
step
    .goto Tanaris,62,64
    >>点击|cRXP_PICK_|T134327:0|t污渍斑斑的萨满笔记|r以开始任务
    .accept 82072,1 >>接任务: |cRXP_WARN_净化大地|r
    .use 221352
    .train 432241,1
step
    .isOnQuest 82072
    .goto Tanaris,62,64
    .cast 446581 >>在腐化之土图腾附近使用 |T134743:0|t[浑浊大地灵契]
    .use 221349
    .train 432241,1
step
    .goto Tanaris,62.0,62.6
    >>Kill |cRXP_ENEMY_Corrupt Moderate Manifestation of Earth|r then >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 82072 >>交任务: |cRXP_FRIENDLY_净化大地|r
    .accept 82075 >>接受回应大地的召唤
    .mob Corrupt Moderate Manifestation of Earth
    .target Moderate Manifestation of Earth
    .train 432241,1
step
    #completewith next
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
    .train 432241,1
step
    #loop
    .goto Azshara,19.4,64.0,20,0
    .goto Azshara,21.2,60.8,20,0
    .goto Azshara,21.0,60.0,20,0
    >>击杀|cRXP_ENEMY_哈达尔萨特|r和|cRXP_ENEMY_哈达尔欺诈者|r和|cRXP_ENEMY_哈达尔疯狂誓约者|r, 击败他们后拾取|cRXP_LOOT_|T134331:0|t浸水萨满的笔记|r
    .collect 221351,1 --1/1 Waterlogged Shaman's Notes
    .mob Haldarr Satyr
    .mob Haldarr Trickster
    .mob Haldarr Felsworn
    .train 432241,1
step
    .goto Azshara,14,49
    >>点击|cRXP_PICK_|T134331:0|t浸湿的萨满笔记|r以开始任务
    .accept 82073,1 >>接任务: |cRXP_WARN_净化流水|r
    .use 221352
    .train 432241,1
step
    .isOnQuest 82073
    .goto Azshara,14,49
    .cast 446581 >>在腐化水图腾附近使用 |T134743:0|t[浑浊大地灵契]
    .use 221348
    .train 432241,1
step
    .goto Azshara,15.0,49.8
    >>Kill |cRXP_ENEMY_Corrupt Moderate Manifestation of Water|r then >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moderate Manifestation of Water.|r
    .turnin 82073 >>交任务: |cRXP_FRIENDLY_净化流水|r
    .accept 82076 >>接受任务:回应水的召唤
    .mob Corrupt Moderate Manifestation of Water
    .target Moderate Manifestation of Water
    .train 432241,1
step
    #completewith next
    .zone The Hinterlands >>前往: |cRXP_PICK_辛特兰|r
    .train 432241,1
step
    #loop
    .goto The Hinterlands,48.8,53.0,40,0
    .goto The Hinterlands,47.6,40.8,40,0
    .goto The Hinterlands,58.2,41.8,40,0
    >>击杀|cRXP_ENEMY_绿色淤泥怪|r和|cRXP_ENEMY_翡翠黏液怪|r, 击败后拾取掉落的|cRXP_LOOT_|T134332:0|t撕裂萨满的笔记|r|r
    .collect 220379,1 --1/1 Torn Shaman's Notes
    .mob Green Sludge
    .mob Jade Ooze
    .train 432241,1
step
    .goto The Hinterlands,51,46
    >>点击|cRXP_PICK_|T134332:0|t撕裂萨满的笔记|r开始任务
    .accept 81960,1 >>接任务: |cRXP_WARN_净化空气|r
    .use 220379
    .train 432241,1
step
    .isOnQuest 82072
    .goto The Hinterlands,51,46
    .cast 446581 >>在腐化空气图腾附近使用 |T134743:0|t[浑浊大地灵契]
    .use 221349
    .train 432241,1
step
    .goto The Hinterlands,51.2,47.0
    >>Kill |cRXP_ENEMY_Corrupt Moderate Manifestation of Air|r then >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 81960 >>交任务: |cRXP_FRIENDLY_净化空气|r
    .accept 81968 >>接受回应风的召唤
    .mob Corrupt Moderate Manifestation of Air
    .target Moderate Manifestation of Air
    .train 432241,1
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
    .train 432241,1
step
    #loop
    .goto Searing Gorge,52.0,35.4,40,0
    .goto Searing Gorge,42.4,38.6,40,0
    .goto Searing Gorge,32.8,43.0,40,0
    .goto Searing Gorge,28.8,44.4,40,0
    .goto Searing Gorge,30.6,64.6,40,0
    .goto Searing Gorge,31.6,73.8,40,0
    >>击杀|cRXP_ENEMY_熔岩元素|r和|cRXP_ENEMY_炽焰元素|r, 击败后拾取|cRXP_LOOT_|T134327:0|t焦灼萨满的笔记|r|r
    .collect 221350,1 --1/1 Charred Shaman's Notes
    .mob Inferno Elemental
    .mob Magma Elemental
    .train 432241,1
step
    .goto Searing Gorge,24,72
    >>点击|cRXP_PICK_|T134329:0|t焦黑萨满的笔记|r以开始任务
    .accept 82071,1 >>接任务: |cRXP_WARN_净化火焰|r
    .use 221352
    .train 432241,1
step
    .isOnQuest 82072
    .goto Searing Gorge,24,72
    .cast 446581 >>在腐化火焰图腾附近使用 |T134743:0|t[浑浊大地灵契]
    .use 221349
    .train 432241,1
step
    .goto Searing Gorge,24.0,72.4
    >>Kill |cRXP_ENEMY_Corrupt Moderate Manifestation of Fire|r then >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Moderate Manifestation of Fire.|r
    .turnin 82071 >>交任务: |cRXP_FRIENDLY_净化火焰|r
    .accept 82074 >>接受回应烈焰的召唤
    .mob Corrupt Moderate Manifestation of Fire
    .target Moderate Manifestation of Fire
    .train 432241,1
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .train 432241,1
step
    #loop
    .goto Feralas,50.2,51.4,20,0
    .goto Feralas,44.8,46.2,20,0
    .goto Feralas,41.0,37.8,20,0
    .goto Feralas,37.4,33.0,20,0
    >>击杀|cRXP_ENEMY_巨大海元素|r和|cRXP_ENEMY_海元素|r, 击败后掠夺获得|cRXP_LOOT_|T132849:0|t元素精华|r
    .collect 220510,3
    .train 432241,1
step
    .cast 446803 >>使用 |T134118:0|t[大地碎片]
    .use 221355
    .train 432241,1
step
    .goto Feralas,36.0,32.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 82075 >>响应大地的召唤
    .target Moderate Manifestation of Earth
    .train 432241,1
step
    #loop
    .goto Feralas,37.4,33.0,20,0
    .goto Feralas,41.0,37.8,20,0
    .goto Feralas,44.8,46.2,20,0
    .goto Feralas,50.2,51.4,20,0
    >>击杀|cRXP_ENEMY_巨大海元素|r和|cRXP_ENEMY_海元素|r, 击败后掠夺获得|cRXP_LOOT_|T132849:0|t元素精华|r
    .collect 220510,3
    .train 432241,1
step
    .cast 446802 >>使用 |T134130:0|t[火焰碎片]
    .use 221353
    .train 432241,1
step
    .goto Feralas,36.0,32.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 82075 >>响应大地的召唤
    .target Moderate Manifestation of Earth
    .train 432241,1
step
    #loop
    .goto Feralas,50.2,51.4,20,0
    .goto Feralas,44.8,46.2,20,0
    .goto Feralas,41.0,37.8,20,0
    .goto Feralas,37.4,33.0,20,0
    >>击杀|cRXP_ENEMY_巨大海元素|r和|cRXP_ENEMY_海元素|r, 击败后掠夺获得|cRXP_LOOT_|T132849:0|t元素精华|r
    .collect 220510,3
    .train 432241,1
step
    .cast 445748 >>使用 |T134133:0|t[空气碎片]
    .use 220375
    .train 432241,1
step
    .goto Feralas,36.0,32.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 82075 >>响应大地的召唤
    .target Moderate Manifestation of Earth
    .train 432241,1
step
    #loop
    .goto Feralas,37.4,33.0,20,0
    .goto Feralas,41.0,37.8,20,0
    .goto Feralas,44.8,46.2,20,0
    .goto Feralas,50.2,51.4,20,0
    >>击杀|cRXP_ENEMY_巨大海元素|r和|cRXP_ENEMY_海元素|r, 击败后掠夺获得|cRXP_LOOT_|T132849:0|t元素精华|r
    .collect 220510,3
    .train 432241,1
step
    .cast 446804 >>使用 |T134089:0|t[水之碎片]
    .use 221354
    .train 432241,1
step
    .goto Feralas,36.0,32.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderate 地球的温和显现|r交谈
    .turnin 82075 >>响应大地的召唤
    .target Moderate Manifestation of Earth
    .train 432241,1
step
    >>击杀|cRXP_ENEMY_暮光暗影萨满|r, 搜刮其尸体以获得|cRXP_LOOT_|cRXP_FRIENDLY_|T134419:0|t充能符文|r|r
    .collect 220616,1 --1/1 Rune of Overcharged
    .train 432241,1
step
    .train 432241 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_过载符文|r]|cRXP_WARN_来训练|r|T132213:0|t[过载]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Storm, Earth, and Fire
#name 风暴和大地与火焰 - 52(费伍德)

step
    .train 440634,1
    #completewith next
    .zone Felwood >>前往: |cRXP_PICK_费伍德森林|r
step
    .goto Felwood,62.4,9.0
    .train 440634,1
    >>击杀|cRXP_ENEMY_死木萨满祭司|r和|cRXP_ENEMY_死木复仇者|r和|cRXP_ENEMY_死木守卫|r. 击败后搜刮, 获得|T134918:0|t[|cRXP_LOOT_闪电图腾|r]
    .goto Feralas,76.6,48.0
    .collect 225838,1
    .mob Deadwood Shaman
    .mob Deadwood Avenger
    .mob Deadwood Den Watcher
step
    .train 440634,1
    .equip 18,225838 >>|cRXP_WARN_装备|r |T134918:0|t[|cRXP_LOOT_闪电图标|r]
    .use 225838
step
    .train 440634,1
    .aura 408828 >>|cRXP_WARN_你现在必须用|r|T136015:0|t[连锁闪电]这一技能一次性击杀3名敌人|r
    >>|cRXP_WARN_Pull 3个怪物, 将它们的生命值降至约5%, 然后施放|r|T136015:0|t[连锁闪电]
step
    .itemcount 225838,1
    .use 225838
    .train 440634 >>|cRXP_WARN_使用|r|T134918:0|t[|cRXP_LOOT_伏特图标|r]|cRXP_WARN_来学习|r|T237588:0|t[风暴和大地与火焰]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Coherence
#name 连贯性 - 55(燃烧平原)

step
    .train 416062,1
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    .train 416062,1
    #loop
    .goto Burning Steppes,62.4,9.0,60,0
    .goto Burning Steppes,69.4,31.8,60,0
    .goto Burning Steppes,61.4,31.8,60,0
    .goto Burning Steppes,51.2,35.6,60,0
    .goto Burning Steppes,55.6,49.2,60,0
    .goto Burning Steppes,54.8,62.2,60,0
    .goto Burning Steppes,35.6,61.6,60,0
    .goto Burning Steppes,41.6,43.6,60,0
    >>击杀 |cRXP_ENEMY_巨型黑曜石元素|r. 击败它们后可获得 |cRXP_LOOT_熔岩黑曜石核心|r
    .collect 225676,1
    .mob Greater Obsidian Elemental
step
    .train 416062,1
    .goto Redridge Mountains,44.6,50.0
    >>|cRXP_WARN_你现在有10分钟时间, 可跳入世界任意地点的水域中|r
    >>|cRXP_WARN_前往: |cRXP_PICK_赤脊山|r and jump into the lake|r
    >>|cRXP_WARN_如果你的炉石靠近水域, 也可以选择这样操作|r
    >>|cRXP_WARN_跳入水中会将|cRXP_LOOT_熔岩黑曜石核心|r转变为|r|T237477:0|t[|cRXP_LOOT_烟灰黑曜石核心|r]
    .collect 225675,1
step
    .train 416062,1
    .use 225675 >>|cRXP_WARN_打开|r|T237477:0|t[|cRXP_LOOT_烟灰黑曜石核心|r]|cRXP_WARN_以获取|r|T134419:0|t[|cRXP_LOOT_沉着符文|r]
    .collect 225740,1
step
    .itemcount 225740,1
    .use 225740
    .train 416062 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_LOOT_镇静符文|r]|cRXP_WARN_来学习|r|T237586:0|t[连贯性]
]])

RXPGuides.RegisterGuide([[
#classic
<< Shaman SoD
#group RestedXP 符文与书籍指南
#subgroup Cloak
#displayname Feral Sprit
#name 狂野之灵 - 60(冬泉谷)

step
    .train 440630,1
    #completewith next
    .zone Winterspring >>前往: |cRXP_PICK_冬泉谷|r
    >>|cRXP_WARN_注意你必须击杀一名60级精英怪. 建议带上一位朋友一起完成任务|r
step
    #completewith next
    .goto Winterspring,67.93,41.44,50 >>进入熊怪洞穴
step
    .goto Winterspring,69.87,37.92
    >>|cRXP_WARN_前往雪人洞穴后方, 与被锁链束缚的元素生物交谈|r|cRXP_FRIENDLY_Frijidar|r
    >>|cRXP_WARN_几秒后他会进入敌对状态|r
    >>击杀|cRXP_ENEMY_Frijidar|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_LOOT_束缚之灵符文|r]
    .collect 225914,1
    .mob Frijidar
    .skipgossip
step
    .itemcount 225914,1
    .use 225914
    .train 440630 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_LOOT_束缚灵魂符文|r] |cRXP_WARN_来学习|r|T237577:0|t[野性幽魂]
]])