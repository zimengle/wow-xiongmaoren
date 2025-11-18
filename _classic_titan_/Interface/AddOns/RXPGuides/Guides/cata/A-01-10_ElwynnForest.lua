local _,addon = ...
if addon.game ~= "CATA" or addon.player.faction ~= 'Alliance' then return end
RXPGuides.RegisterGuide([[

#group RXP 大灾变 1-80 (A)
#cata
#name 1-6 北郡谷
#version 1
#next 6-9 艾尔文森林
#defaultfor Human !DK

<< Alliance

step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .accept 28757 >>接任务: |cRXP_WARN_击退敌人！|r << Human Mage
    .accept 28762 >>接任务: |cRXP_WARN_击退敌人！|r << Human Paladin
    .accept 28763 >>接任务: |cRXP_WARN_击退敌人！|r << Human Priest
    .accept 28764 >>接任务: |cRXP_WARN_击退敌人！|r << Human Rogue
    .accept 28765 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warlock
    .accept 28766 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warrior
    .accept 28767 >>接任务: |cRXP_WARN_击退敌人！|r << Human Hunter
    .accept 29078 >>接任务: |cRXP_WARN_击退敌人！|r << !Human
    .accept 31139 >>接任务: |cRXP_WARN_击退敌人！|r << Human Death Knight/Human Monk
    .target 麦克布莱德元帅
--XX 31139 only available in MoP+ （人类 DK 一直无聊到 MoP，暴雪这边）
step
    #loop
    .goto 425,29.58,44.71,0
    .goto 425,31.33,45.67,40,0
    .goto 425,32.52,43.63,40,0
    .goto 425,29.25,38.05,40,0
    .goto 425,26.25,40.59,40,0
    .goto 425,26.09,53.65,40,0
    >>杀死 |cRXP_ENEMY_Blackrock Worgs|r
    .complete 28757,1 << Human Mage --Blackrock Worgs (6)
    .complete 28762,1 << Human Paladin --Blackrock Worgs (6)
    .complete 28763,1 << Human Priest --Blackrock Worgs (6)
    .complete 28764,1 << Human Rogue --Blackrock Worgs (6)
    .complete 28765,1 << Human Warlock --Blackrock Worgs (6)
    .complete 28766,1 << Human Warrior --Blackrock Worgs (6)
    .complete 28767,1 << Human Hunter --Blackrock Worgs (6)
    .complete 29078,1 << !Human --Blackrock Worgs (6)
    .complete 31139,1 << Human Death Knight/Human Monk --Blackrock Worgs (6)
    .mob Blackrock Worg
step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 28757 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Mage
    .turnin 28762 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Paladin
    .turnin 28763 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Priest
    .turnin 28764 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Rogue
    .turnin 28765 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Warlock
    .turnin 28766 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Warrior
    .turnin 28767 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Hunter
    .turnin 29078 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << !Human
    .turnin 31139 >>交任务: |cRXP_FRIENDLY_击退敌人！|r << Human Death Knight/Human Monk
    .accept 28759 >>接任务: |cRXP_WARN_狮入羊口|r << Human Hunter
    .accept 28769 >>接任务: |cRXP_WARN_狮入羊口|r << Human Mage
    .accept 28770 >>接任务: |cRXP_WARN_狮入羊口|r << Human Paladin
    .accept 28771 >>接任务: |cRXP_WARN_狮入羊口|r << Human Priest
    .accept 28772 >>接任务: |cRXP_WARN_狮入羊口|r << Human Rogue
    .accept 28773 >>接任务: |cRXP_WARN_狮入羊口|r << Human Warlock
    .accept 28774 >>接任务: |cRXP_WARN_狮入羊口|r << Human Warrior
    .accept 29079 >>接任务: |cRXP_WARN_狮入羊口|r << !Human
    .accept 31140 >>接任务: |cRXP_WARN_狮入羊口|r << Human Death Knight/Human Monk
    .target 麦克布莱德元帅
step
    #loop
    .goto 425,27.23,40.41,0
    .goto 425,31.76,41.17,40,0
    .goto 425,30.32,38.01,40,0
    .goto 425,27.23,40.41,40,0
    .goto 425,27.40,42.45,40,0
    .goto 425,26.49,44.73,40,0
    .goto 425,28.86,47.41,40,0
    .goto 425,24.84,50.52,40,0
    .goto 425,23.64,51.42,40,0
    .goto 425,26.60,54.71,40,0
    >>杀死 |cRXP_ENEMY_Blackrock 间谍|r
    >>|cRXP_WARN_它们是|r|T132320:0|t[隐身]|cRXP_WARN_（但很容易被看到）|r
    .complete 31140,1 << Human Death Knight/Human Monk --Blackrock Spies (8)
    .complete 28769,1 << Human Mage --Blackrock Spies (8)
    .complete 28759,1 << Human Hunter --Blackrock Spies (8)
    .complete 28770,1 << Human Paladin --Blackrock Spies (8)
    .complete 28771,1 << Human Priest --Blackrock Spies (8)
    .complete 28772,1 << Human Rogue --Blackrock Spies (8)
    .complete 28773,1 << Human Warlock --Blackrock Spies (8)
    .complete 28774,1 << Human Warrior --Blackrock Spies (8)
    .complete 29079,1 << !Human --Blackrock Spies (8)
    .complete 31140,1 << Human Death Knight/Human Monk --Blackrock Spies (8)
    .mob Blackrock Spy
step << MOP
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 28769 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Mage
    .turnin 28759 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Hunter
    .turnin 28770 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Paladin
    .turnin 28771 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Priest
    .turnin 28772 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Rogue
    .turnin 28773 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warlock
    .turnin 28774 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warrior
    .turnin 29079 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << !Human
    .turnin 31140 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Death Knight/Human Monk
    .accept 28780 >>接任务: |cRXP_WARN_加入战斗！|r << Human Hunter
    .accept 28784 >>接任务: |cRXP_WARN_加入战斗！|r << Human Mage
    .accept 28785 >>接任务: |cRXP_WARN_加入战斗！|r << Human Paladin
    .accept 28786 >>接任务: |cRXP_WARN_加入战斗！|r << Human Priest
    .accept 28787 >>接任务: |cRXP_WARN_加入战斗！|r << Human Rogue
    .accept 28788 >>接任务: |cRXP_WARN_加入战斗！|r << Human Warlock
    .accept 28789 >>接任务: |cRXP_WARN_加入战斗！|r << Human Warrior
    .accept 29080 >>接任务: |cRXP_WARN_加入战斗！|r << !Human
    .accept 31143 >>接任务: |cRXP_WARN_加入战斗！|r << Human Death Knight/Human Monk
    .target 麦克布莱德元帅
step << Cata
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 28769 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Mage
    .turnin 28759 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Hunter
    .turnin 28770 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Paladin
    .turnin 28771 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Priest
    .turnin 28772 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Rogue
    .turnin 28773 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warlock
    .turnin 28774 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Warrior
    .turnin 29079 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << !Human
    .turnin 31140 >>交任务: |cRXP_FRIENDLY_狮入羊口|r << Human Death Knight/Human Monk
    .accept 3100 >>接任务: |cRXP_LOOT_简要的信件|r << Human Warrior
    .accept 3101 >>接任务: |cRXP_LOOT_圣洁信件|r << Human Paladin
    .accept 3102 >>接任务: |cRXP_LOOT_密文信件|r << Human Rogue
    .accept 3103 >>接任务: |cRXP_LOOT_神圣信件|r << Human Priest
    .accept 3104 >>接任务: |cRXP_LOOT_雕文信件|r << Human Mage
    .accept 3105 >>接任务: |cRXP_LOOT_被污染的信件|r << Human Warlock
    .accept 26910 >>接任务: |cRXP_WARN_风蚀的信件|r << Human Hunter
    .accept 29080 >>接任务: |cRXP_WARN_加入战斗！|r << !Human
    .target 麦克布莱德元帅
--XX needs testing on non-human classes. Not needed for Monks/DKs
step << Warrior Cata/Paladin Cata
    #optional
    #completewith next
    .goto 425,35.84,51.87,8,0
    .goto 425,38.46,52.30,8,0
    .goto 425,40.87,53.80,10 >>前往修道院内的 |cRXP_FRIENDLY_Llane Beshere|r << Warrior
    .goto 425,41.55,53.23,10 >>前往修道院内的 |cRXP_FRIENDLY_Brother Sammuel|r << Paladin
step << Warrior Cata
    .goto 425,40.87,53.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尼·拜舍尔|r
    .turnin 3100 >>交任务: |cRXP_FRIENDLY_简要的信件|r << Human
    .accept 26913 >>接任务: |cRXP_WARN_冲锋陷阵|r << Human
    .train 100 >>列车 |T132337:0|t[收费]
    .target Llane Beshere
step << Paladin Cata
    .goto 425,41.55,53.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨缪尔修士|r
    .turnin 3101 >>交任务: |cRXP_FRIENDLY_圣洁信件|r << Human
    .accept 26918 >>接任务: |cRXP_WARN_圣光之力|r << Human
    .train 20154 >>列车 |T135960:0|t[正义印记]
    .train 20271 >>列车 |T135959:0|t[判断]
    .target Brother Sammuel
step << Rogue Cata
    .goto 425,41.13,45.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔里克·克里丹|r
    .turnin 3102 >>交任务: |cRXP_FRIENDLY_密文信件|r << Human
    .accept 26915 >>接任务: |cRXP_WARN_最致命的攻击|r << Human
    .train 2098 >>训练 |T132292:0|t[剔骨]
    .target Jorik Kerridan
step << Human Priest Cata/Human Mage Cata
    #optional
    #completewith next
    .goto 425,35.61,51.32,8,0
    .goto 425,37.20,48.32,8,0
    .goto 425,38.95,46.52,8,0 << Priest
    .goto 425,38.31,46.07,8,0 << Mage
    .goto 425,37.94,45.13,5,0 << Mage
    .goto 425,39.31,43.78,10 >>前往修道院内的 |cRXP_FRIENDLY_Priestess Anetta|r << Priest
    .goto 425,38.78,43.47,10 >>前往修道院楼上的 |cRXP_FRIENDLY_Khelden Bremen|r。如果可以的话，从他房间外面的栏杆上楼梯跳上去 << Mage
step << Human Priest Cata
    .goto 425,39.31,43.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师安妮塔|r
    .turnin 3103 >>交任务: |cRXP_FRIENDLY_神圣信件|r << Human
    .accept 26919 >>接任务: |cRXP_WARN_治愈伤者|r << Human
    .train 2061 >>训练 |T135907:0|t[快速治疗]
    .target Priestess Anetta
--XX Human Priest only since Flash Heal is somewhat useless when you just smite spam
step << Human Priest Cata
    #loop
    .goto 425,39.31,43.78,0
    .goto 425,38.97,43.16,10,0
    .goto 425,37.82,44.57,10,0
    .goto 425,39.70,44.56,10,0
    .goto 425,37.36,46.34,10,0
    .goto 425,35.08,48.41,10,0
    .goto 425,35.42,49.84,10,0
    .goto 425,37.84,53.31,10,0
    .goto 425,37.00,54.53,10,0
    .goto 425,36.36,53.06,10,0
    >>对修道院内的 5 名 |cRXP_FRIENDLY_Wounded Trainees|r 施放 |T135907:0|t[快速治疗]
    .complete 26919,1 --Cast Flash Heal (5)
    .target Wounded Trainee
step << Human Mage Cata
    .goto 425,38.78,43.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔登·布雷门|r
    .turnin 3104 >>交任务: |cRXP_FRIENDLY_雕文信件|r << Human
    .accept 26916 >>接任务: |cRXP_WARN_掌控奥术|r << Human
    .train 5143 >>训练 |T136096:0|t[奥术飞弹]
    .target Khelden Bremen
--XX Human Mage only since Arcane Missiles is somewhat useless when you just fireball spam
step << Warlock Cata
    .goto 425,39.55,55.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜希拉·拉萨雷|r
    .turnin 3105 >>交任务: |cRXP_FRIENDLY_被污染的信件|r << Human
    .accept 26914 >>接任务: |cRXP_WARN_献祭|r << Human
    .train 348 >>列车 |T135817:0|t[献祭]
    .target Drusilla La Salle
step << Hunter Cata
    .goto 425,34.83,54.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿什莉·布兰克|r
    .turnin 26910 >>交任务: |cRXP_FRIENDLY_风蚀的信件|r << Human
    .accept 26917 >>接任务: |cRXP_WARN_猎人之路|r << Human
    .train 56641 >>火车 |T132213:0|t[稳固射击]
    .target Ashley Blank
step << Human Warrior Cata/Human Paladin Cata/Human Mage Cata
    #optional
    #completewith next
    .goto 425,38.46,52.30,8,0 << Warrior/Paladin
    .goto 425,35.84,51.87,8,0 << Warrior/Paladin
    .goto 425,37.20,48.32,8,0 << Mage
    .goto 425,35.61,51.32,8,0 << Mage
    .goto 425,33.82,53.38,10,0
    .goto 425,35.58,60.57,40 >>前往 |cRXP_ENEMY_Training Dummies|r
step << !Priest Human Cata
    .goto 425,35.58,60.57,-1
    .goto 425,35.82,61.08,-1
    .goto 425,35.81,61.71,-1
    .goto 425,35.55,62.26,-1
    .goto 425,35.13,62.46,-1
    .goto 425,34.74,62.27,-1
    .goto 425,34.48,61.76,-1
    .goto 425,34.46,61.13,-1
    >>对 |cRXP_ENEMY_Training Dummy|r 施放 |T132337:0|t[充电] << Warrior
    >>对 |cRXP_ENEMY_Training Dummy|r 施放 |T135817:0|t[Immolate] 5 次 << Warlock
    >>对 |cRXP_ENEMY_Training Dummy|r 施放 |T136189:0|t[邪恶攻击] 然后 |T132292:0|t[剔骨] 3 次 << Rogue
    >>当 |cRXP_ENEMY_Training Dummy|r 触发时，施放 |T135812:0|t[火球术] 和 |T136096:0|t[奥术飞弹] 2 次 << Mage
    >>对 |cRXP_ENEMY_Training Dummy|r 施放 |T132213:0|t[稳固射击] 5 次 << Hunter
    >>对 |cRXP_ENEMY_Training Dummy|r 施放 |T135960:0|t[正义印记] 和 |T135959:0|t[审判] << Paladin
    .complete 26913,1 << Warrior --Cast Charge (1)
    .complete 26914,1 << Warlock --Cast Immolation (5)
    .complete 26915,1 << Rogue --Cast Eviscerate (3)
    .complete 26916,1 << Mage --Cast Arcane Missiles (2)
    .complete 26917,1 << Hunter --Cast Steady Shot (5)
    .complete 26918,1 << Paladin --Cast Judgement (1)
    .mob Training Dummy
step << Human Warrior Cata/Human Paladin Cata/Human Mage Cata
    #optional
    #completewith next
    .goto 425,35.84,51.87,8,0 << Warrior/Paladin
    .goto 425,38.46,52.30,8,0 << Warrior/Paladin
    .goto 425,35.61,51.32,8,0 << Mage
    .goto 425,37.20,48.32,8,0 << Mage
    .goto 425,38.31,46.07,8,0 << Mage
    .goto 425,37.94,45.13,5,0 << Mage
    .goto 425,40.87,53.80,10 >>返回修道院内的 |cRXP_FRIENDLY_Llane Beshere|r << Warrior
    .goto 425,41.55,53.23,10 >>返回修道院内的 |cRXP_FRIENDLY_Brother Sammuel|r << Paladin
    .goto 425,38.78,43.47,10 >>返回修道院内的 |cRXP_FRIENDLY_Khelden Bremen|r << Mage
step << Human Priest Cata
    .goto 425,39.31,43.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师安妮塔|r
    .turnin 26919 >>交任务: |cRXP_FRIENDLY_治愈伤者|r
    .accept 28786 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Priestess Anetta
step << Human Mage Cata
    .goto 425,38.78,43.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯尔登·布雷门|r
    .turnin 26916 >>交任务: |cRXP_FRIENDLY_掌控奥术|r
    .accept 28784 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Khelden Bremen
step << Human Warrior Cata
    .goto 425,40.87,53.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莱尼·拜舍尔|r
    .turnin 26913 >>交任务: |cRXP_FRIENDLY_冲锋陷阵|r
    .accept 28789 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Llane Beshere
step << Human Paladin Cata
    .goto 425,41.55,53.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨缪尔修士|r
    .turnin 26918 >>交任务: |cRXP_FRIENDLY_圣光之力|r
    .accept 28785 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Brother Sammuel
step << Human Rogue Cata
    .goto 425,41.13,45.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔里克·克里丹|r
    .turnin 26915 >>交任务: |cRXP_FRIENDLY_最致命的攻击|r
    .accept 28787 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Jorik Kerridan
step << Human Warlock Cata
    .goto 425,39.55,55.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜希拉·拉萨雷|r
    .turnin 26914 >>交任务: |cRXP_FRIENDLY_献祭|r
    .accept 28788 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Drusilla La Salle
--XX May not need to turn in class quest to accept followup (aka can turn in later)
step << Human Hunter Cata
    .goto 425,34.83,54.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿什莉·布兰克|r
    .turnin 26917 >>交任务: |cRXP_FRIENDLY_猎人之路|r
    .accept 28780 >>接任务: |cRXP_WARN_加入战斗！|r
    .target Ashley Blank
step
    .goto 425,35.73,39.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维里副队长|r
    .turnin 28780 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Hunter
    .turnin 28784 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Mage
    .turnin 28785 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Paladin
    .turnin 28786 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Priest
    .turnin 28787 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Rogue
    .turnin 28788 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Warlock
    .turnin 28789 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Warrior
    .turnin 29080 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << !Human
    .turnin 31143 >>交任务: |cRXP_FRIENDLY_加入战斗！|r << Human Death Knight/Human Monk
    .accept 28791 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Hunter
    .accept 28792 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Mage
    .accept 28793 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Paladin
    .accept 28794 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Priest
    .accept 28795 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Rogue
    .accept 28796 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Warlock
    .accept 28797 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Warrior
    .accept 29081 >>接任务: |cRXP_WARN_他们派来了刺客|r << !Human
    .accept 31144 >>接任务: |cRXP_WARN_他们派来了刺客|r << Human Death Knight/Human Monk
    .target Sergeant Willem
step
    #loop
    .goto 425,34.99,38.24,0
    .goto 425,34.47,39.42,8,0
    .goto 425,34.99,38.24,8,0
    .goto 425,35.55,37.73,8,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕克斯顿修士|r
    .accept 28806 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Hunter
    .accept 28808 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Mage
    .accept 28809 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Paladin
    .accept 28810 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Priest
    .accept 28811 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Rogue
    .accept 28812 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Warlock
    .accept 28813 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Warrior
    .accept 29082 >>接任务: |cRXP_WARN_别畏惧邪恶|r << !Human
    .accept 63447 >>接任务: |cRXP_WARN_别畏惧邪恶|r << Human Death Knight/Human Monk
    .target Brother Paxton
step << skip
    #optional
    #completewith Rear
    .goto 425,31.59,16.72,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Gug Fatcandle|r。如果他醒了就杀了他|r
    *|cRXP_WARN_It's important to kill Rares and loot Treasure Chests, as they award a lot of experience|r
	.unitscan Gug Fatcandle
    .noflyable
step
    #sticky
    #label Soldiers
    #loop
    .goto 425,31.99,28.69,0
    .goto 425,31.00,22.28,15,0
    .goto 425,29.16,25.64,15,0
    .goto 425,28.94,30.20,15,0
    .goto 425,30.49,30.95,15,0
    .goto 425,32.00,28.75,15,0
    .goto 425,31.56,25.82,15,0
    .goto 425,33.45,24.77,15,0
    .goto 425,36.08,23.69,15,0
    >>点击地面上的 |cRXP_PICK_受伤的暴风城步兵|r 来复活他们
    .complete 28806,1 << Human Hunter --Revive Injured Soldiers (4)
    .complete 28808,1 << Human Mage --Revive Injured Soldiers (4)
    .complete 28809,1 << Human Paladin --Revive Injured Soldiers (4)
    .complete 28810,1 << Human Priest --Revive Injured Soldiers (4)
    .complete 28811,1 << Human Rogue --Revive Injured Soldiers (4)
    .complete 28812,1 << Human Warlock --Revive Injured Soldiers (4)
    .complete 28813,1 << Human Warrior --Revive Injured Soldiers (4)
    .complete 63447,1 << Human Death Knight/Human Monk --Revive Injured Soldiers (4)
    .target Injured Stormwind Infantry
step
    #loop
    .goto 425,31.99,28.69,0
    .goto 425,33.00,21.94,45,0
    .goto 425,35.59,23.73,45,0
    .goto 425,36.54,27.68,45,0
    .goto 425,35.12,31.40,45,0
    .goto 425,33.27,32.25,45,0
    .goto 425,35.59,23.73,45,0
    .goto 425,29.65,31.64,45,0
    .goto 425,28.45,27.49,45,0
    .goto 425,27.16,18.98,45,0
    >>杀死|cRXP_ENEMY_Goblin Assassins|r
    .complete 28791,1 << Human Hunter --Goblin Assassins (8)
    .complete 28792,1 << Human Mage --Goblin Assassins (8)
    .complete 28793,1 << Human Paladin --Goblin Assassins (8)
    .complete 28794,1 << Human Priest --Goblin Assassins (8)
    .complete 28795,1 << Human Rogue --Goblin Assassins (8)
    .complete 28796,1 << Human Warlock --Goblin Assassins (8)
    .complete 28797,1 << Human Warrior --Goblin Assassins (8)
    .complete 29081,1 << !Human --Goblin Assassins (8)
    .complete 31144,1 << Human Death Knight/Human Monk --Goblin Assassins (8)
    .mob Goblin Assassin
step
    #requires Soldiers
    #loop
    .goto 425,34.99,38.24,0
    .goto 425,35.55,37.73,8,0
    .goto 425,34.99,38.24,8,0
    .goto 425,34.47,39.42,8,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕克斯顿修士|r
    .turnin 28806 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Hunter
    .turnin 28808 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Mage
    .turnin 28809 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Paladin
    .turnin 28810 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Priest
    .turnin 28811 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Rogue
    .turnin 28812 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warlock
    .turnin 28813 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warrior
    .turnin 29082 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << !Human
    .turnin 63447 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Death Knight/Human Monk
    .target Brother Paxton
step
    #label Rear
    .goto 425,35.73,39.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维里副队长|r
    .turnin 28791 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Hunter
    .turnin 28792 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Mage
    .turnin 28793 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Paladin
    .turnin 28794 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Priest
    .turnin 28795 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Rogue
    .turnin 28796 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Warlock
    .turnin 28797 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Warrior
    .turnin 29081 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << !Human
    .turnin 31144 >>交任务: |cRXP_FRIENDLY_他们派来了刺客|r << Human Death Knight/Human Monk
    .accept 28817 >>接任务: |cRXP_WARN_后方已经安全|r << Human Hunter
    .accept 28818 >>接任务: |cRXP_WARN_后方已经安全|r << Human Mage
    .accept 28819 >>接任务: |cRXP_WARN_后方已经安全|r << Human Paladin
    .accept 28820 >>接任务: |cRXP_WARN_后方已经安全|r << Human Priest
    .accept 28821 >>接任务: |cRXP_WARN_后方已经安全|r << Human Rogue
    .accept 28822 >>接任务: |cRXP_WARN_后方已经安全|r << Human Warlock
    .accept 28823 >>接任务: |cRXP_WARN_后方已经安全|r << Human Warrior
    .accept 29083 >>接任务: |cRXP_WARN_后方已经安全|r << !Human
    .accept 31145 >>接任务: |cRXP_WARN_后方已经安全|r << Human Death Knight/Human Monk
    .target Sergeant Willem
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r, |cRXP_FRIENDLY_米莉·奥斯沃斯|r
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
    .goto 425,33.56,53.04
    .target +麦克布莱德元帅
    .accept 26391 >>接任务: |cRXP_WARN_灭火拯救希望|r
    .goto 425,33.38,54.67
    .target +米莉·奥斯沃斯
step << skip
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Blackrock Invaders|r。掠夺他们的 |cRXP_LOOT_Blackrock Orc Weapons|r
    .complete 26389,1 --Blackrock Orc Weapon (8)
    .mob Blackrock Invader
step
    #label Fire
    .goto 425,57.48,71.22,0
    .goto 425,49.10,78.42,20,0
    .goto 425,50.78,75.57,20,0
    .goto 425,51.22,77.49,20,0
    .goto 425,51.82,78.93,20,0
    .goto 425,50.59,80.71,20,0
    .goto 425,52.81,80.56,20,0
    .goto 425,52.53,82.55,20,0
    .goto 425,53.04,84.89,20,0
    .goto 425,54.33,85.93,20,0
    .goto 425,54.67,83.87,20,0
    .goto 425,56.91,82.37,20,0
    .goto 425,56.39,80.99,20,0
    .goto 425,56.96,78.82,20,0
    .goto 425,58.94,75.77,20,0
    .goto 425,55.12,73.91,20,0
    .goto 425,55.49,70.94,20,0
    .goto 425,53.67,68.68,20,0
    .goto 425,50.63,73.13,20,0
    >>|cRXP_WARN_频道|r |T308321:0|t[米莉的灭火器] |cRXP_WARN_关于北郡葡萄园的火灾|r
    .complete 26391,1 --Vineyard Fire extinguished (8)
    .use 58362
step
    #loop
    .goto 425,54.27,77.40,0
    .goto 425,47.40,70.76,50,0
    .goto 425,46.82,75.39,50,0
    .goto 425,50.12,78.58,50,0
    .goto 425,53.79,84.88,50,0
    .goto 425,57.63,77.83,50,0
    .goto 425,57.48,71.22,50,0
    .goto 425,56.07,62.66,50,0
    >>杀死 |cRXP_ENEMY_Blackrock Invaders|r。掠夺他们的 |cRXP_LOOT_Blackrock Orc Weapons|r
    .complete 26389,1 --Blackrock Orc Weapon (8)
    .mob Blackrock Invader
step
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莉·奥斯沃斯|r, |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 26391 >>交任务: |cRXP_FRIENDLY_灭火拯救希望|r
    .target +米莉·奥斯沃斯
    .goto 425,33.38,54.67
    .turnin 26389 >>交任务: |cRXP_FRIENDLY_黑石兽人的入侵|r
    .accept 26390 >>接任务: |cRXP_WARN_终结入侵！|r
    .goto 425,33.56,53.04
    .target +麦克布莱德元帅
step
    .goto 425,64.97,48.38
    >>杀死 |cRXP_ENEMY_杀戮者库尔托克|r
    .complete 26390,1 --Kurtok the Slayer (1)
    .mob Kurtok the Slayer
step
    #completewith next
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 26390 >>交任务: |cRXP_FRIENDLY_终结入侵！|r
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .target 麦克布莱德元帅
step
    #optional
    #completewith next
    .goto 37,46.877,48.018,20,0
    .goto 37,45.563,47.738,15 >>前往 |cRXP_FRIENDLY_Falkhaan Isenstrider|r
    .skill riding,75,1
step
    .goto 37,45.563,47.738
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法尔坎·伊森斯泰德|r
    .accept 2158 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
]])

RXPGuides.RegisterGuide([[
#version 1
#group RXP 大灾变 1-80 (A)
#cata
#name 6-9 艾尔文森林
#next 9-11 丹莫罗
#defaultfor Human/Dwarf/Gnome

<< Alliance

step << Dwarf
#xprate >1.19
    .goto 27,53.124,49.995
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨雷克·黑石|r
    .turnin 24493 >>交任务: |cRXP_FRIENDLY_别忘记我们|r
	.target Tharek Blackstone
    .isOnQuest 24493
step << Dwarf/Gnome
#xprate >1.19
    #optional
    #completewith Belm
    .goto 27,54.083,50.335,8,0
    .goto 27,54.277,50.312,8,0
    .goto 27,54.485,50.847,10 >>进入雷酒酿酒厂。前往 |cRXP_FRIENDLY_Innkeeper Belm|r 内部
    .subzoneskip 2102
step << Gnome
#xprate >1.19
    .goto 27,54.485,50.847
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    .turnin 26380,2 >>交任务: |cRXP_FRIENDLY_前往卡拉诺斯|r
	.target Innkeeper Belm
    .isOnQuest 26380
--XX not sure how to do this otherwise
step << Dwarf/Gnome
#xprate >1.19
    #label Belm
    .goto 27,54.485,50.847
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板贝尔姆|r, 他在里面
    .home >>将你的炉石设置为雷酒酿酒厂
	.target Innkeeper Belm
step << Dwarf/Gnome/DarkIronDwarf
#xprate >1.19
    .goto 27,54.723,50.607,8,0
    .goto 27,54.784,50.629,8,0
    .goto 27,54.733,50.815,8,0
    .goto 27,54.733,50.815
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r
    .accept 6387 >>接任务: |cRXP_LOOT_荣誉学员|r
	.target Gremlock Pilsnor
step << cata Shaman
    #xprate <1.2
    .xp 7
step << cata Shaman
    #xprate <1.2
    .goto 1426/0,-536.50000,-5581.50000
    .train 331 >>火车 |T136052:0|Kharanos Inn 的热浪
step << Gnome
#xprate >1.19
    #optional
    #questguide
    .goto 27,53.713,52.190
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨兰恩队长|r
    .turnin 26373 >>交任务: |cRXP_FRIENDLY_前往卡拉诺斯|r
	.target 萨兰船长
    .isOnQuest 26373
step << Dwarf/Gnome
    .goto 1426/0,-497.50000,-5664.00000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛兰·风须|r
    .target Brolan Galebeard
    .turnin 6387 >>交任务: |cRXP_FRIENDLY_荣誉学员|r
    .accept 6391 >>接任务: |cRXP_LOOT_飞往铁炉堡|r
step << Dwarf/Gnome
#completewith next
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛兰·风须|r
    .target Brolan Galebeard
    .goto 1426/0,-497.50000,-5664.00000
    .fly Ironforge >>飞往铁炉堡
step << Dwarf/Gnome
    .goto 1455/0,-1118.50000,-4707.30029
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高尼尔·石趾|r
    .target Golnir Bouldertoe
    .turnin 6391 >>交任务: |cRXP_FRIENDLY_飞往铁炉堡|r
    .accept 6388 >>接任务: |cRXP_LOOT_格莱斯·瑟登|r
step << Dwarf/Gnome
    .goto 1455/0,-1154.90002,-4820.70020
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .target Gryth Thurden
    .turnin 6388 >>交任务: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .accept 6392 >>接任务: |cRXP_WARN_向布洛克回复|r
step << Dwarf/Gnome
#completewith next
    .goto Ironforge,55.501,47.743
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格莱斯·瑟登|r
    .target Gryth Thurden
    .fly Goldshire >>飞往闪金郡
step << Human
    #completewith GSReport
    .goto 37,41.71,52.74,-1
    .goto 37,39.48,60.53,-1
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 2158
    .skill riding,75,1
step
    #label GSReport
    .goto 37,42.11,65.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r << Human
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
	.target 杜汉元帅
step << Human
    .goto 37,41.708,65.541
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
    .accept 26393 >>接任务: |cRXP_LOOT_快递消息|r
	.target Smith Argus
step << Human
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
	.turnin 26393 >>交任务: |cRXP_FRIENDLY_快递消息|r
    .accept 26394 >>接任务: |cRXP_WARN_前往暴风城|r
	.target Bartlett the Brave
step
    #optional
    #completewith next
    .goto 37,43.19,65.74,5,0
    .goto 37,43.23,65.95,5,0
    .goto 37,43.318,65.705,4 >>前往 |cRXP_FRIENDLY_William Pestle|r
step
    .goto 37,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .accept 60 >>接任务: |cRXP_LOOT_狗头人的蜡烛|r
	.target William Pestle
step << Human
    .goto 37,43.77,65.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .turnin 2158 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .home >>将你的炉石设为 Lion's Pride Inn
	.target Innkeeper Farley
step << skip
    #optional
    #completewith RemyTT
    .goto 37,41.95,67.16,0
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Lien Farmer, |cRXP_FRIENDLY_雷米|r
    .target Lien Farner
step
    #optional
    #completewith next
    .goto 37,43.23,65.95,5,0
    .goto 37,43.13,65.74,5,0
    .goto 37,42.93,65.71,6,0
    .goto 37,42.14,67.26,12 >>前往 |cRXP_FRIENDLY_Remy“两次”|r
step
    #label RemyTT
    .goto 37,42.14,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
	.target 雷米“两次”
step
    #optional
    #completewith Necklace1
    .goto 37,38.22,83.41,0
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r, |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto 37,34.486,84.253
    .target +“阿姨”伯妮丝·斯通菲尔德
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
    .goto 37,34.66,84.48
	.target +马斯通菲尔德
    .xp <6,1
step
    #optional
    #label Necklace1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .accept 85 >>接任务: |cRXP_LOOT_丢失的项链|r
    .goto 37,34.486,84.253
    .target “阿姨”伯妮丝·斯通菲尔德
step
    #completewith Billy1
    .goto 37,38.22,83.41,0
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    #label Billy1
    .goto 37,43.13,85.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利·马科伦|r
    .turnin 85 >>交任务: |cRXP_FRIENDLY_丢失的项链|r
    .accept 86 >>接任务: |cRXP_LOOT_比利的馅饼|r
    .target Billy Maclure
step
    #completewith TommyJoe
    .goto 37,41.69,86.91,0
    .goto 37,32.54,85.26,0
    >>杀死 |cRXP_ENEMY_Stonetusk Boars|r。掠夺它们的 |cRXP_LOOT_Tender Boar Meat|r
    .complete 86,1 --Tender Boar Meat (4)
    .mob Stonetusk Boar
step
    .goto 37,43.154,89.625
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅贝尔·马科伦|r, 他在里面
    .accept 106 >>接任务: |cRXP_LOOT_年轻的恋人|r
    .target Maybell Maclure
step
    #optional
    .goto 37,41.69,86.91
    .xp 6 >>磨练至 6 级
    .mob Stonetusk Boar
step
    .goto 37,34.66,84.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.target 马斯通菲尔德
step
    #optional
    #completewith PrincessEnd
    .goto 37,38.22,83.41,0
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob *Kobold Tunneler
step << skip
    .goto 37,33.64,87.76,15 >>|cRXP_WARN_[宝箱] 检查马厩内的 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .isOnQuest 60
step
    #loop
    #optional
	.line 37,32.48,86.81,33.41,86.16,33.32,84.95,32.58,84.26,32.04,85.20,32.48,86.81
    .goto 37,33.32,84.95,0
    .goto 37,32.04,85.20,20,0
    .goto 37,32.58,84.26,20,0
    .goto 37,33.32,84.95,20,0
    .goto 37,33.41,86.16,20,0
    .goto 37,32.48,86.81,20,0
    >>杀死 |cRXP_ENEMY_Princess|r。搜刮她的 |cRXP_LOOT_Brass Collar|r 和 |cRXP_LOOT_Tender Boar Meat|r
    .complete 88,1 --1/1 Brass Collar
    .complete 86,1 --Tender Boar Meat (4)
    .disablecheckbox
	.mob Princess
    .itemcount 60401,<4
    .isOnQuest 86
step
    #loop
    #label PrincessEnd
	.line 37,32.48,86.81,33.41,86.16,33.32,84.95,32.58,84.26,32.04,85.20,32.48,86.81
    .goto 37,33.32,84.95,0
    .goto 37,32.04,85.20,20,0
    .goto 37,32.58,84.26,20,0
    .goto 37,33.32,84.95,20,0
    .goto 37,33.41,86.16,20,0
    .goto 37,32.48,86.81,20,0
    >>杀死 |cRXP_ENEMY_Princess|r。掠夺她的财物 |cRXP_LOOT_Brass Collar|r
    .complete 88,1 --1/1 Brass Collar
	.mob Princess
--XX Will users struggle if they're still level 6?
step
    #label TommyJoe
    .goto 37,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托米·乔·斯通菲尔德|r
    .turnin 106 >>交任务: |cRXP_FRIENDLY_年轻的恋人|r
    .accept 111 >>接任务: |cRXP_LOOT_托米的祖母|r
    .target Tommy Joe Stonefield
step
    #loop
    .goto 37,41.69,86.91,0
    .goto 37,32.54,85.26,0
    .goto 37,31.25,85.42,40,0
    .goto 37,32.26,85.70,40,0
    .goto 37,32.35,86.66,40,0
    .goto 37,33.18,86.66,40,0 --Yes it's the same Y coordinate
    .goto 37,33.64,85.47,40,0
    .goto 37,31.93,83.57,40,0
    >>杀死 |cRXP_ENEMY_Stonetusk Boars|r。掠夺它们的 |cRXP_LOOT_Tender Boar Meat|r
    .complete 86,1 --Tender Boar Meat (4)
    .mob Stonetusk Boar
step
#sticky
#label princessT
    .goto 37,34.66,84.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r
	.target 马斯通菲尔德
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .goto 37,34.486,84.253
    .turnin 86 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .target “阿姨”伯妮丝·斯通菲尔德
step << Human
#xprate <1.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .goto 37,34.486,84.253
    .target “阿姨”伯妮丝·斯通菲尔德
    .accept 84 >>接任务: |cRXP_LOOT_比利的馅饼|r
step
#requires princessT
    .goto 37,34.94,83.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莱德·斯通菲尔德|r, 他在里面
    .turnin 111 >>交任务: |cRXP_FRIENDLY_托米的祖母|r
    .accept 107 >>接任务: |cRXP_LOOT_给威廉·匹斯特的信|r
    .target Gramma Stonefield
step << Human
#xprate <1.2
    #completewith Goldtooth
    .goto 37,38.22,83.41,0
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob *Kobold Tunneler
step << Human
#xprate <1.2
    .goto 37,43.13,85.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_比利·马科伦|r
    .turnin 84 >>交任务: |cRXP_FRIENDLY_比利的馅饼|r
    .accept 87 >>接任务: |cRXP_LOOT_金牙|r
    .target Billy Maclure
step << Human
#xprate <1.2
    #label Goldtooth
    .goto Elwynn Forest,40.08,80.62
    >>杀死 |cRXP_ENEMY_Goldtooth|r |cRXP_WARN_outside|r 矿井。从他身上搜刮 |cRXP_LOOT_Bernice 的项链|r
    .complete 87,1 --Collect Bernice's Necklace (x1)
    .mob Goldtooth
step << skip
    #optional
    .goto 37,38.22,83.41,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Narg the Taskmaster|r。如果他醒了就杀了他|r
	.unitscan Narg the Taskmaster
    .isOnQuest 60
    .noflyable
step
    #completewith next
    .goto 37,38.37,81.52,30,0
    .goto 37,40.69,81.74
    >>探索 Fargodeep 矿场
    .complete 62,1 --Scout through the Fargodeep Mine
step
    .goto 37,37.82,86.14,40,0
    .goto 37,37.89,81.45,40,0
    .goto 39,47.59,68.00,20,0
    .goto 39,60.14,82.29,20,0
    .goto 39,78.65,28.65,20,0
    .goto 39,57.67,25.29,20,0
    .goto 38,53.73,72.25,20,0
    .goto 37,37.82,86.14,40,0
    .goto 37,37.89,81.45,40,0
    .goto 39,47.59,68.00,20,0
    .goto 39,60.14,82.29,20,0
    .goto 39,78.65,28.65,20,0
    .goto 39,57.67,25.29,20,0
    .goto 38,53.73,72.25
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
    .mob *Kobold Tunneler
    .mob *Kobold Miner
step
    #label scoutm1
    .goto 37,38.37,81.52,30,0
    .goto 37,40.69,81.74
    >>探索 Fargodeep 矿场
    .complete 62,1 --Scout through the Fargodeep Mine
step
#xprate <1.2
#requires scoutm1
    #optional
    .goto 37,37.82,86.14,40,0
    .goto 37,37.89,81.45,40,0
    .goto 39,47.59,68.00,20,0
    .goto 39,60.14,82.29,20,0
    .goto 39,78.65,28.65,20,0
    .goto 39,57.67,25.29,20,0
    .goto 38,53.73,72.25,20,0
    .goto 37,37.82,86.14,40,0
    .goto 37,37.89,81.45,40,0
    .goto 39,47.59,68.00,20,0
    .goto 39,60.14,82.29,20,0
    .goto 39,78.65,28.65,20,0
    .goto 39,57.67,25.29,20,0
    .goto 38,53.73,72.25
    .xp 6+2275 >>升级至 2275+/3600xp
    .mob Kobold Tunneler
    .mob Kobold Miner
--XX 625 (Gold Dust) 700 (Goldtooth) - Ensure "A Fishy Peril"
step << Human
#xprate <1.2
    .goto 37,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_波尼斯·斯通菲尔德姑妈|r
    .turnin 87 >>交任务: |cRXP_FRIENDLY_金牙|r
    .target “阿姨”伯妮丝·斯通菲尔德
--XX Early turnin XP gate for level 8? No idea how good/bad xp will be by now. Can be made optional/turned in later but I wanted to skip The Escape since you can fly Eastvale at 6+ 然后去北方检查稀有物品
step << Human
    #completewith Kelp
    .hs >>炉石到闪金镇
    .subzoneskip 87
step << !Human
#completewith next
    .deathskip >>在金郡死亡并重生
    .subzoneskip 87
step
    #label Kelp
    #xprate >1.19 << Human
    .goto 37,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .target William Pestle
step << Human
    #label Kelp
    #xprate <1.2
    .goto 37,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .turnin 107 >>交任务: |cRXP_FRIENDLY_给威廉·匹斯特的信|r
    .accept 112 >>接任务: |cRXP_LOOT_收集海藻|r
    .target William Pestle
step
    #completewith next
    .goto 37,43.23,65.95,5,0
    .goto 37,43.13,65.74,5,0
    .goto 37,42.93,65.71,6,0
    .goto 37,42.14,67.26,12 >>返回 |cRXP_FRIENDLY_Remy“两次”|r
step
    .goto 37,42.14,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
	.target 雷米“两次”
step << Hunter
    .goto 37,40.854,65.902
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_本杰明·福柯沃斯|r
    .trainer >>训练你的职业法术
    .target Benjamin Foxworthy
step << Paladin
    .goto 37,41.074,65.953
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔海姆修士|r
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << Warrior
    .goto 37,41.069,65.825
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_里瑞亚·杜拉克|r
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Warlock
    #completewith next
    .goto 37,44.54,65.76,15 >>前往金郡旅馆地下室
step << Warlock
    .goto 37,44.389,66.240
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛克西米利安·克洛文|r
    .trainer >>训练你的职业法术
    .target 马克西米利安·克罗
step << Mage/Priest/Rogue
    #completewith next
    .goto 37,43.86,66.40,15 >>在金郡旅馆爬上楼梯
step << Mage
    .goto 37,43.246,66.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
    .trainer >>训练你的职业法术
    .target Zaldimar Wefhellt
step << Priest
    .goto 37,43.282,65.720
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_女牧师洁塞塔|r
    .trainer >>训练你的职业法术
    .target Priestess Josetta
step << Rogue
    .goto 37,43.872,65.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞恩·塞尔留斯|r
    .trainer >>训练你的职业法术
    .target Keryn Sylvius
step << Human
    #xprate <1.2
    .goto 37,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .target 杜汉元帅
    .isOnQuest 112
step
    #optional << Human
    .goto 37,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .target 杜汉元帅
step << Human
    #xprate <1.2
    #completewith Frond
    #label ChargerMurloc
    .goto 37,42.105,65.927
    >>|cRXP_WARN_当 20 秒计时器到期时（接受骑行后 20 秒），注销然后重新登录，在 |cRXP_FRIENDLY_Stormwind Charger|r 上卸下它|r
    .vehicle >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r, |cRXP_FRIENDLY_暴风城战马|r, |cRXP_FRIENDLY_卫兵托马斯|r
    .timer 20,Start to Logout when timer ends
    .target 杜汉元帅
    .isOnQuest 76
    .skipgossip 240,1
    .skill riding,75,1
step << Human
    #xprate <1.2
    #optional
    #completewith Frond
    #requires ChargerMurloc
    .goto 37,56.23,66.64
    >>|cRXP_WARN_当 20 秒计时器到期时（接受骑行后 20 秒），注销然后重新登录，在 |cRXP_FRIENDLY_Stormwind Charger|r 上卸下它|r
    .subzone 18 >>前往水晶湖
    .isOnQuest 76
    .skill riding,75,1
step << Human
    #xprate <1.2
    #label Frond
    #loop
    .goto 37,56.23,66.64,0
    .goto 37,56.23,66.64,40,0
    .goto 37,57.65,65.14,40,0
    .goto 37,57.29,62.51,40,0
    .goto 37,55.14,63.48,40,0
    .goto 37,54.79,66.42,40,0
    >>杀死 |cRXP_ENEMY_Murloc Steamrunners|r 和 |cRXP_ENEMY_Murlocs|r。掠夺他们的 |cRXP_LOOT_Crystal Kelp Frond|r
    .complete 112,1 --Crystal Kelp Frond (4)
    .mob Murloc Steamrunner
    .mob Murloc
    .isOnQuest 112
step << Human
    #xprate <1.2
    #optional
    #completewith next
    .goto 37,61.65,53.93,12,0
    .goto 40,48.05,87.33
    .subzone 54 >>进入 Jasperlode 矿井
    .isOnQuest 76
step << Human
    #xprate <1.2
    .goto 40,44.22,67.89,12,0
    .goto 40,38.71,60.84,12,0
    .goto 40,35.92,52.81
    >>沿着 Jasperlode 矿井内的中间路径走
    .complete 76,1 --Scout Through the Jasperlode Mine (1)
    .isOnQuest 76
step << Human
    #xprate <1.2
    #completewith Thomas
    .goto 37,61.58,70.04,0
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 76
    .skill riding,75,1
step << Human
    #xprate <1.2
    .goto 40,38.71,60.84,12,0
    .goto 40,44.22,67.89,12,0
    .goto 37,61.82,53.88,12,0
    .subzone 54,1 >>退出 Jasperlode 矿井
    .isOnQuest 76
    .skill riding,<75,1
step
    #xprate >1.19 << !Human
    #completewith Thomas
    .goto 37,42.105,65.927
    .vehicle >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r, |cRXP_FRIENDLY_暴风城战马|r, |cRXP_FRIENDLY_卫兵托马斯|r
    .timer 90,Further Concerns RP
    .target 杜汉元帅
    .skipgossip 240,1
    .subzoneskip 87,1 --Goldshire
step
    #label Thomas
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击 |cRXP_PICK_Bounty Board|r 并与 |cRXP_FRIENDLY_后卫托马斯|r 交谈
    --.accept 46 >>接任务: |cRXP_WARN_悬赏鱼人|r
    .accept 26152 >>接任务: |cRXP_WARN_通缉：詹姆斯·克拉克|r
    .goto 37,74.025,72.310
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
    .goto 37,73.973,72.177
    .target +后卫托马斯
step
    #completewith James
    .goto 37,77.99,60.59,0
    .goto 37,71.58,60.84,0
    .goto 37,74.75,67.13,0
    .goto 37,87.15,64.63,0
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_Gray Forest Wolves|r
    >>杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*灰森林狼
    .complete 52,2 --Kill 年轻的森林熊 (5)
    .mob +年轻的森林熊
step
    .goto 37,72.653,60.323
    >>点击地面上的 |cRXP_PICK_A 半被吃掉的尸体|r
    .turnin 37 >>交任务: |cRXP_FRIENDLY_失踪的卫兵|r
    .accept 45 >>接任务: |cRXP_LOOT_罗尔夫的下落|r
step
    #label James
    .goto 37,78.87,67.20,10,0
    .goto 37,78.637,67.157
    >>杀死里面的 |cRXP_FRIENDLY_James Clark|r。搜刮他的 |cRXP_LOOT_James Clark 的头颅|r 和 |T134939:0|t|cRXP_LOOT_[金币领取时间表]|r
    >>|cRXP_WARN_使用 |T134939:0|t|cRXP_LOOT_[金币领取时间表]|r 开始任务|r
    .complete 26152,1 --James Clark's Head (1)
    .collect 1307,1,123,1 --Gold Pickup Schedule (1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .mob James Clark
    .use 1307
--step
--    .goto 37,79.462,68.715
--    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
--    .accept 83 >>接任务: |cRXP_WARN_红色亚麻布|r
--    .target Sara Timberlain
step
    .goto 37,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员莱琳|r
    .accept 5545 >>接任务: |cRXP_LOOT_木材危机|r
    .target Supervisor Raelen
step
    .goto 37,81.860,66.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Patterson|r
    .turnin 26152 >>交任务: |cRXP_FRIENDLY_通缉：詹姆斯·克拉克|r
    .turnin 123 >>交任务: |cRXP_FRIENDLY_收货人|r
    .accept 147 >>接任务: |cRXP_WARN_猎杀收货人|r
    .target Marshal Patterson
step
    #optional
    #completewith StoneCairn
    .goto 37,87.15,64.63,0
    .goto 37,81.56,58.15,0
    .goto 37,87.15,64.63,60,0
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_Gray Forest Wolves|r
    >>杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*灰森林狼
    .complete 52,2 --Kill 年轻的森林熊 (5)
    .mob +年轻的森林熊
step
    #completewith next
    .goto 37,80.88,53.78,0
    .goto 37,80.63,62.25,0
    .goto 37,82.79,60.12,0
    .goto 37,84.20,61.55,20,0
    >>在树木旁边的地面上拾取 |cRXP_LOOT_Bundles of Wood|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    .goto 37,79.795,55.510
    >>点击地面上的 |cRXP_PICK_Rolf 的尸体|r
    .turnin 45 >>交任务: |cRXP_FRIENDLY_罗尔夫的下落|r
    .accept 71 >>接任务: |cRXP_LOOT_回复托马斯|r
step
    #sticky
    #label PTFrontier
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
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_Gray Forest Wolves|r
    >>杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*灰森林狼
    .complete 52,2 --Kill 年轻的森林熊 (5)
    .mob +年轻的森林熊
step
    #loop
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
    >>在树木旁边的地面上拾取 |cRXP_LOOT_Bundles of Wood|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #requires PTFrontier
    .goto 37,73.973,72.177
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r
    --.turnin 46 >>交任务: |cRXP_FRIENDLY_悬赏鱼人|r
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r
    .target 后卫托马斯
--XX     #optional if above not skipped
step
    .goto 37,71.02,80.67
    >>杀死里面的 |cRXP_ENEMY_收藏家摩根|r。从他身上搜刮 |cRXP_LOOT_收藏家的戒指|r
    .complete 147,1 --The Collector's 戒指 (1)
    .mob Morgan the Collector
step
    .goto 37,79.462,68.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
    .target Sara Timberlain
step
    .goto 37,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员莱琳|r
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
    .target Supervisor Raelen
step
    .goto 37,81.860,66.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Patterson|r
    .turnin 147 >>交任务: |cRXP_FRIENDLY_猎杀收货人|r
    .target Marshal Patterson
    .isQuestComplete 147
step << Hunter
--TODO: COORDS
    .target Rallic Finn
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉里克·费恩|r
    >>购买 |T135489:0|t[层压反曲弓]
    .collect 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.6
step << Human
    #optional
    #completewith hs1
    .hs >>炉边到金郡
    .cooldown item,6948,<0,1
step << Human
    #completewith hs1
    #xprate <1.2
    .goto 37,81.829,66.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迅翼高斯|r
    .fly Goldshire >>飞往闪金郡
    .target Goss the Swift
    .subzoneskip 87
    .zoneskip 37,1
    .cooldown item,6948,>0,1
step << Human !Paladin !Warrior !Rogue
    #xprate >1.19
    .goto 37,81.829,66.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迅翼高斯|r
    .fly Gol'Bolar Quarry >>飞往戈尔博拉采石场
    .target Goss the Swift
    .cooldown item,6948,>0,1
step << Human
#xprate <1.2
    .goto 37,43.318,65.705
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .turnin 112 >>交任务: |cRXP_FRIENDLY_收集海藻|r
    .target William Pestle
    .isQuestComplete 112

step << Human
#xprate <1.2
    .goto 37,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 76 >>交任务: |cRXP_FRIENDLY_玉石矿洞|r
    --.accept 239 >>接任务: |cRXP_LOOT_西泉要塞|r
    .target 杜汉元帅
    .isQuestComplete 76
--XX Can skip rest of steps and fly to Dun Morogh from here if level 10+?#如果以上步骤未跳过则可选
step
#label hs1
--Melee classes need to buy weapon upgrades:
step << Human
#xprate <1.2
    #completewith next
    #label FlySW
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fly Stormwind >>飞往暴风城 << Rogue/Paladin/Warrior
    .fly Gol'Bolar Quarry >>飞往戈尔博拉采石场 << !Rogue !Paladin !Warrior
	.target Bartlett the Brave
    .zoneskip Stormwind City
    .itemStat 16,QUALITY,<7
step << Human (Warrior/Paladin)
    .goto 84,64.074,68.362
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_从她那里购买 a|r |T135350:0|t[Claymore] |cRXP_BUY_|r
    >>|cRXP_WARN_或者，去拍卖行看看有没有更好或更便宜的东西|r
    .collect 1198,1 -- Claymore (1)
    .money <0.2142
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Marda Weller
step << Human Rogue
    .goto 84,64.074,68.362
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_从她那里购买 a|r |T135346:0|t[Cutlass] |cRXP_BUY_|r
    >>|cRXP_WARN_或者，去拍卖行看看有没有更好或更便宜的东西|r
    .collect 851,1 -- Cutlass (1)
    .money <0.1618
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Marda Weller
    .xp >11,1
    .xp <10,1
step << Human Rogue
    .goto 84,64.074,68.362
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>|cRXP_BUY_从她那里购买 a|r |T132402:0|t[Hatchet] |cRXP_BUY_|r
    >>|cRXP_WARN_或者，去拍卖行看看有没有更好或更便宜的东西|r
    .collect 853,1 -- Hatchet (1)
    .money <0.1927
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target Marda Weller
    .xp >12,1
    .xp <11,1
step <<Human (Warrior/Paladin)
    #optional
    #completewith end
    +|cRXP_WARN_装备|r |T135350:0|t[克莱莫地雷]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Human Rogue
    #optional
    #completewith end
    +|cRXP_WARN_在你的主手中装备|r |T135346:0|t[弯刀] |cRXP_WARN_|r
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Human Rogue
    #optional
    #completewith end
    +|cRXP_WARN_在你的主手中装备|r |T132402:0|t[斧头] |cRXP_WARN_|r
    .use 853
    .itemcount 853,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step << Human (Rogue/Paladin/Warrior)
    .goto 84,70.938,72.472,-1
    .goto 37,81.829,66.556,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r, |cRXP_FRIENDLY_迅翼高斯|r
    .fly Gol'Bolar Quarry >>飞往戈尔博拉采石场
	.target Dungar Longdrink
    .zoneskip 27 --Dun Morogh
    .target Goss the Swift

step << Dwarf/Gnome
#completewith next
    .hs >>炉石到卡拉诺斯
    .zoneskip Dun Morogh
step << Dwarf/Gnome
    .goto 27,54.733,50.815
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格雷姆罗克·匹斯诺尔|r
    .turnin 6392 >>交任务: |cRXP_FRIENDLY_向布洛克回复|r
	.target Gremlock Pilsnor
--TODO: Training for dwarf/gnomes
step << Dwarf/Gnome
    .goto 27,53.802,52.762
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布洛兰·风须|r
    .fly Gol'Bolar Quarry >>飞往戈尔博拉采石场
	.target Brolan Galebeard
step << Human
    .abandon 26394 >>从你的任务日志中放弃所有艾尔文森林任务
step
#label end
.zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
]])
