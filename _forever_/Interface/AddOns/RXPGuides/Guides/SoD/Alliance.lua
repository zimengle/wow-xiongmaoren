RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Druid SoD/Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs << Druid
#subgroupdisplayname 腿部 << Druid
#subgroup Chest << Hunter
#subgroupdisplayname 胸甲 << Hunter
#name Lacerate - 12 (Darkshore) << Druid
#name Beast Mastery - 12 (Darkshore) << Hunter
#title 割伤 << Druid
#title 野兽控制 << Hunter
#displayname 割伤 - 12（黑海岸） << Druid
#displayname 野兽控制 - 12（黑海岸） << Hunter
step << Druid/Hunter
    .goto Darkshore,39.84,53.82,50,0
    .goto Darkshore,40.03,56.24,50,0
    .goto Darkshore,39.34,56.58,50,0
    .goto Darkshore,39.84,53.82
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r，拾取它们的|T237270:0|t[|cRXP_LOOT_螃蟹点心|r]
    .collect 209027,1 -- Crab Treats (1)
    .mob 黑木探路者
    .mob 黑木风语者
    .train 416049,1 << Druid
    .train 410110,1 << Hunter
step << Druid/Hunter
    .goto Darkshore,35.8,55.6
    .use 209027 >> |cRXP_WARN_将|r |T237270:0|t[|cRXP_LOOT_螃蟹点心|r] |cRXP_WARN_喂给|cRXP_ENEMY_暗礁蟹幼崽|r，以获得|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r] << Druid
    .use 209027 >> |cRXP_WARN_将|r |T237270:0|t[|cRXP_LOOT_螃蟹点心|r] |cRXP_WARN_喂给|cRXP_ENEMY_暗礁蟹幼崽|r，以获得|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] << Hunter
    .collect 208687,1 << Druid -- Rune of Lacerate (1)
    .collect 208701,1 << Hunter -- Beast Mastery (1)
    .target 暗礁蟹幼崽
    .train 416049,1 << Druid
    .train 410110,1 << Hunter
step << Druid/Hunter
    .train 416049 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r] |cRXP_WARN_学习|r |T132131:0|t[割伤] << Druid
    .use 208687 << Druid
    .itemcount 208687,1 << Druid
    .train 410110 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制] << Hunter
    .use 208701 << Hunter
    .itemcount 208701,1 << Hunter
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Druid SoD/Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Mangle - 8 (Teldrassil) << Druid
#name Explosive Shot - 8 (Teldrassil) << Hunter
#title 割碎 << Druid
#title 爆炸射击 << Hunter
#displayname 割碎 - 10（泰达希尔） << Druid
#displayname 爆炸射击 - 8（泰达希尔） << Hunter
step
    +|cRXP_WARN_建议至少达到 10 级并学会熊形态，再在泰达希尔完成|r |T133816:0|t[铭刻手套 - 割碎] |cRXP_WARN_符文|r << Druid
    +|cRXP_WARN_建议至少达到 8 级，才能独自在泰达希尔获得|r |T133816:0|t[铭刻手套 - 爆炸射击] |cRXP_WARN_符文|r << Hunter
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .xp >9,1 << Druid
    .xp >7,1 << Hunter
step
    #completewith Rune
    #label Teld1
    .zone Teldrassil >> 前往泰达希尔
    .subzoneskip 262
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #optional
    #requires Teld1
    #label ShadowCave1
    #completewith Rune
    .goto 1438,44.197,58.040
    .subzone 262 >> 进入班奈希尔兽穴
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #optional
    #requires ShadowCave1
    #completewith Rune
    .goto 1438,44.064,58.196,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,45.118,57.701,20 >> 进入洞穴深处寻找 |cRXP_ENEMY_怒爪|r
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
step
    #loop
    #label Rune
    .line 1438,45.055,57.739,45.008,58.055,45.091,58.386,45.256,58.538,45.492,58.609,45.668,58.356,45.702,57.980,45.604,57.699,45.370,57.566,45.161,57.638,45.118,57.701
    .goto 1438,45.055,57.739,12,0
    .goto 1438,45.008,58.055,12,0
    .goto 1438,45.091,58.386,12,0
    .goto 1438,45.256,58.538,12,0
    .goto 1438,45.492,58.609,12,0
    .goto 1438,45.668,58.356,12,0
    .goto 1438,45.702,57.980,12,0
    .goto 1438,45.604,57.699,12,0
    .goto 1438,45.370,57.566,12,0
    .goto 1438,45.161,57.638,12,0
    .goto 1438,45.118,57.701,12,0
    >>击杀洞穴底层的 |cRXP_ENEMY_怒爪|r，拾取它的 |T136061:0|t|cRXP_LOOT_[怒熊神像]|r << Druid
    >>击杀洞穴底层的 |cRXP_ENEMY_怒爪|r，拾取它的 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r << Hunter
    .collect 206954,1 << Druid -- Idol of Ursine Rage (1)
    .collect 206169,1 << Hunter -- Rune of Explosive Shot (1)
    .train 410025,1 << Druid
    .train 410123,1 << Hunter
    .unitscan 怒爪
step << Hunter
    .train 410123 >> |cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
step << Druid
    .equip 18,206954 >> |cRXP_WARN_装备|r |T136061:0|t|cRXP_LOOT_[怒熊神像]|r
    .use 206954
    .itemcount 206954,1
    .train 410025,1
step << Druid
    #loop
    .goto 1438,44.731,57.355,0
    .goto 1438,44.254,59.083,0
    .goto 1438,44.064,58.196,0
    .goto 1438,44.731,57.355,15,0
    .goto 1438,43.947,57.297,15,0
    .goto 1438,43.944,57.918,15,0
    .goto 1438,44.292,58.555,15,0
    .goto 1438,44.254,59.083,15,0
    .goto 1438,43.602,59.799,15,0
    .goto 1438,43.399,59.885,15,0
    .goto 1438,43.073,59.123,15,0
    .goto 1438,44.167,58.204,15,0
    .goto 1438,44.196,58.597,15,0
    .goto 1438,43.975,58.537,15,0
    .goto 1438,44.064,58.196,15,0
    .aura 414824 >>|cRXP_WARN_在|r |T132276:0|t[熊形态]|cRXP_WARN_下将怒气保持在50或以上，持续60秒|r
    .itemStat 18,QUALITY,2
    .train 410025,1
step << Druid
    .train 410025 >>|cRXP_WARN_使用|r |T136061:0|t|cRXP_LOOT_[怒熊神像]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 割碎]
    .use 206954
    .aura -414824
    .train 410025,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD/Alliance Warrior SoD/Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Chest << Rogue
#subgroupdisplayname 胸甲 << Rogue
#subgroup Boots << Priest
#subgroupdisplayname 靴子 << Priest
#subgroup Legs << Warrior
#subgroupdisplayname 腿部 << Warrior
#name Slaughter from the Shadows - 8 (Teldrassil) << Rogue
#name Furious Thunder - 8 (Teldrassil) << Warrior
#name Void Plague - 8 (Teldrassil) << Priest
#title 暗影杀手 << Rogue
#title 狂怒雷霆 << Warrior
#title 虚空疫病 << Priest
#displayname 暗影杀手 - 8（泰达希尔） << Rogue
#displayname 狂怒雷霆 - 8（泰达希尔） << Warrior
#displayname 虚空疫病 - 8（泰达希尔） << Priest
step
    #completewith next
    .goto Teldrassil,44.18,58.19
    .subzone 262 >> 进入班奈希尔兽穴
    .train 424992,1 << Rogue
    .train 403476,1 << Warrior
    .train 425216,1 << Priest
step << Rogue
    .train 424992,1
    .goto Teldrassil,44.155,61.182
    >>打开|cRXP_PICK_瘤背储藏处|r，拾取其中的|T134419:0|t[|cRXP_FRIENDLY_杀手符文|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_瘤背储藏处|r会在班奈希尔兽穴内随机位置出现|r
    .collect 203993 -- Rune of Slaughter (1)
    .train 424992 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_杀手符文|r] |cRXP_WARN_学习|r |T236280:0|t[暗影杀手]
    .use 203993
step << Warrior
    .train 403476,1
    .goto Teldrassil,44.401,60.655
    >>打开|cRXP_PICK_瘤背储藏处|r，拾取其中的|T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_瘤背储藏处|r可能在班奈希尔兽穴内多个位置出现|r
    .collect 204809,1 -- Rune of Furious Thunder (1)
    .train 403476 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]|cRXP_WARN_学习|r|T136048:0|t[狂怒雷霆]
    .use 204809
step << Priest
    .train 425216,1
    .goto Teldrassil,44.401,60.655
    >>打开|cRXP_PICK_瘤背储藏处|r，拾取其中的|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    >>|cRXP_WARN_注意：|cRXP_PICK_瘤背储藏处|r可能在班奈希尔兽穴内多个位置出现|r
    .collect 205940,1 -- Memory of a Dark Purpose (1)
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
    >>|cRXP_WARN_学习回忆前需先获得冥想增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂等圣光圣地输入 /kneel。也可向已有增益的牧师请求传授|r
    .use 205940
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Rogue SoD/Alliance Priest SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves << Rogue
#subgroupdisplayname 手套 << Rogue
#subgroup Legs << Priest
#subgroupdisplayname 腿部 << Priest
#name Mutilate - 8 (Teldrassil) << Rogue
#name Shared Pain - 8 (Teldrassil) << Priest
#title 毁伤 << Rogue
#title 分担痛苦 << Priest
#displayname 毁伤 - 8（泰达希尔） << Rogue
#displayname 分担痛苦 - 8（泰达希尔） << Priest
step << Rogue/Priest
    #completewith next
    .goto Teldrassil,54.68,52.84,20,0
    .goto Teldrassil,54.42,51.19,15 >> 前往地狱石
    .train 400094,1 << Rogue
    .train 402854,1 << Priest
step << Rogue/Priest
    .goto Teldrassil,51.2,50.6
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] << Rogue
    >>击杀|cRXP_ENEMY_迈雷纳斯|r，拾取|T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] << Priest
    >>|cRXP_ENEMY_迈雷纳斯|r |cRXP_WARN_可能在地狱石的多个位置出现|r
    .collect 203990,1 << Rogue
    .collect 205945,1 << Priest
    .unitscan 迈雷纳斯
    .train 400094,1 << Rogue
    .train 402854,1 << Priest
step << Rogue
    .train 400094,1
    .train 400094 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step << Priest
    .train 402854,1
    .train 402854 >> |cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_落难救世主的回忆|r] |cRXP_WARN_学习|r |T136160:0|t[分担痛苦]
    >>|cRXP_WARN_学习回忆前需先获得冥想增益：暗夜精灵在月亮井旁输入 /kneel；人类或矮人在北郡修道院、暴风城大教堂等圣光圣地输入 /kneel。也可向已有增益的牧师请求传授|r
    .use 205945
    .itemcount 205945,1
]])
