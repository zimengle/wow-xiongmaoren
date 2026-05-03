RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 人类起跑区
#group weight 9
#name A-北郡谷
#displayname Chapter 1 - Northshire Valley
#next B-艾尔文森林
#defaultfor Human !DK

<< Alliance

step
    #completewith next
    +欢迎来到 RestedXP 的人类起始区指南。
    +强烈建议|cRXP_WARN_NOT|r 级别 |cFFfa9602在人类起始区|r 并选择|cFFfa9602流放之域|r 以实现更快的升级。
    *|cFFfa9602The Human Starting Experience|r requires a lot of experience from Rares and Treasure to be equally efficient.
step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .accept 28757 >>接任务: |cRXP_WARN_击退敌人！|r << Human Mage/KulTiran Mage
    .accept 28762 >>接任务: |cRXP_WARN_击退敌人！|r << Human Paladin
    .accept 28763 >>接任务: |cRXP_WARN_击退敌人！|r << Human Priest/KulTiran Priest
    .accept 28764 >>接任务: |cRXP_WARN_击退敌人！|r << Human Rogue/KulTiran Rogue
    .accept 28765 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warlock/KulTiran Warlock
    .accept 28766 >>接任务: |cRXP_WARN_击退敌人！|r << Human Warrior/KulTiran Warrior
    .accept 28767 >>接任务: |cRXP_WARN_击退敌人！|r << Human Hunter/KulTiran Hunter
    .accept 29078 >>接任务: |cRXP_WARN_击退敌人！|r << !Human !KulTiran
    .accept 31139 >>接任务: |cRXP_WARN_击退敌人！|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target 麦克布莱德元帅
step
    #loop
    .goto 425,29.58,44.71,0
    .goto 425,31.33,45.67,40,0
    .goto 425,32.52,43.63,40,0
    .goto 425,29.25,38.05,40,0
    .goto 425,26.25,40.59,40,0
    .goto 425,26.09,53.65,40,0
    >>杀死 |cRXP_ENEMY_Blackrock Worgs|r
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
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
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
step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
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
    .target 麦克布莱德元帅
step
    .goto 425,35.73,39.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维里副队长|r
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
step
    #loop
    .goto 425,34.99,38.24,0
    .goto 425,34.47,39.42,8,0
    .goto 425,34.99,38.24,8,0
    .goto 425,35.55,37.73,8,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕克斯顿修士|r
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
    #requires Soldiers
    #loop
    .goto 425,34.99,38.24,0
    .goto 425,35.55,37.73,8,0
    .goto 425,34.99,38.24,8,0
    .goto 425,34.47,39.42,8,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_帕克斯顿修士|r
    .turnin 28806 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Hunter/KulTiran Hunter
    .turnin 28808 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Mage/KulTiran Mage
    .turnin 28809 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Paladin
    .turnin 28810 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Priest/KulTiran Priest
    .turnin 28811 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Rogue/KulTiran Rogue
    .turnin 28812 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warlock/KulTiran Warlock
    .turnin 28813 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Warrior/KulTiran Warrior
    .turnin 29082 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << !Human !KulTiran
    .turnin 63447 >>交任务: |cRXP_FRIENDLY_别畏惧邪恶|r << Human Death Knight/Human Monk/KulTiran Death Knight/KulTiran Monk/KulTiran Druid/KulTiran Shaman
    .target Brother Paxton
step
    #label Rear
    .goto 425,35.73,39.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维里副队长|r
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
    #sticky
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
    >>使用，然后将 |T308321:0|t[米莉的灭火器] 引导到 |cRXP_PICK_Vineyard Fires|r 附近
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
    >>杀死 |cRXP_ENEMY_Blackrock Invaders|r。掠夺他们以获得 |cRXP_LOOT_Blackrock Orc Weapons|r
    .complete 26389,1 --Blackrock Orc Weapon (8)
    .mob Blackrock Invader
step
    #requires Fire
    #completewith next
    .goto 425,54.27,77.40,0
    .goto 425,38.29,58.12,0
-- .goto 425,38.29,58.12
    *|cRXP_WARN_Spamming /sit or removing your gear will make you die faster|r
    .deathskip >>在 |cRXP_FRIENDLY_Spirit Healer|r 处死亡并重生
    .skill riding,75,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米莉·奥斯沃斯|r, |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 26391 >>交任务: |cRXP_FRIENDLY_灭火拯救希望|r
    .goto 425,33.38,54.67
    .turnin 26389 >>交任务: |cRXP_FRIENDLY_黑石兽人的入侵|r
    .accept 26390 >>接任务: |cRXP_WARN_终结入侵！|r
    .goto 425,33.56,53.04
    .target 米莉·奥斯沃斯
    .target 麦克布莱德元帅
step
    .goto 425,64.97,48.38
    >>杀死 |cRXP_ENEMY_杀戮者库尔托克|r
    .complete 26390,1 --Kill Kurtok the Slayer (1)
    .mob Kurtok the Slayer
step
    #completewith next
    .goto 425,54.27,77.40,0
    .goto 425,38.29,58.12,0
-- .goto 425,38.29,58.12
    .deathskip >>在 |cRXP_FRIENDLY_Spirit Healer|r 处死亡并重生
    .skill riding,75,1
step
    .goto 425,33.56,53.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官玛克布莱德|r
    .turnin 26390 >>交任务: |cRXP_FRIENDLY_终结入侵！|r
    .accept 54 >>接任务: |cRXP_LOOT_去闪金镇报到|r
    .target 麦克布莱德元帅
step
    #optional
    #completewith next
    .goto 425,29.17,72.43,15,0
    .goto 425,28.28,73.45,15,0
    .goto 425,24.47,74.67,15,0
    .goto 37,45.37,49.00,15 >>前往 |cRXP_FRIENDLY_Falkhaan Isenstrider|r
step
    .goto 37,45.37,49.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_法尔坎·伊森斯泰德|r
    .accept 37112 >>接任务: |cRXP_LOOT_休息和放松|r
    .target Falkhaan Isenstrider
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 人类起跑区 << !KulTiran !DK/!DarkIronDwarf !DK/!LightforgedDraenei !DK/!机械侏儒 !DK/!VoidElf !DK/!Pandaren !DK
#subgroup 同盟种族 DK << KulTiran DK/DarkIronDwarf DK/LightforgedDraenei DK/机械侏儒 DK/VoidElf DK/Pandaren DK
#displayname Chapter 2 - Elwynn Forest
#name B-艾尔文森林
#next RestedXP 联盟 10-60\\2A_赤脊山
#defaultfor Human/KulTiran DK/DarkIronDwarf DK/LightforgedDraenei DK/机械侏儒 DK/VoidElf DK/Pandaren DK

<< Alliance


step
    #veteran
    .goto 84,61.11,70.6
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|cRXP_WARN_建议用其他拥有至少10000金币的角色登录，用这个角色购买物品然后寄过来。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师费奇|r
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
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
    .dmf
step
    .goto 37,41.71,52.74,-1
    .goto 37,39.48,60.53,-1
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 37112 --Rest and Relaxation (Breadcrumb to Goldshire quest)
    .skill riding,75,1
step << !Human !KulTiran
    .goto 37,41.715,64.636
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .fp Goldshire >>获取金郡飞行路线
	.target Bartlett the Brave
step
    #optional
    .goto 37,42.11,65.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 54 >>交任务: |cRXP_FRIENDLY_去闪金镇报到|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target 杜汉元帅
    .isOnQuest 54
--  .isQuestTurnedIn 26390 --Ending the Invasion! (Human Starter Zone final quest)
step
    .goto 37,42.11,65.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .accept 62 >>接任务: |cRXP_LOOT_法戈第矿洞|r
    .accept 26378 >>接任务: |cRXP_WARN_英雄的召唤：西部荒野！|r
	.target 杜汉元帅
step << Human/KulTiran
    .goto 37,41.708,65.541
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
    .accept 26393 >>接任务: |cRXP_LOOT_快递消息|r
	.target Smith Argus
step << Human/KulTiran
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
step
    #veteran
    #completewith 烹饪
    .goto 37,43.77,65.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r 
    >>|cRXP_BUY_从他那里购买 5|r |T132789:0|t[月莓汁] |cRXP_BUY_|r
    >>|cRXP_WARN_|r |T132789:0|t[月莓汁] |cRXP_WARN_是|r |T4620669:0|t[炼金术] |cRXP_WARN_暗月马戏团任务。如果你不想训练|r |T4620669:0|t[炼金术]|cRXP_WARN_，请跳过目标|r
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .collect 1645,5,29506,1 --Moonberry Juice (5)
    .home >>将你的炉石设为 Lion's Pride Inn
	.target Innkeeper Farley
    .isQuestAvailable 47
    .dmf
step
    #veteran
    .goto 37,43.77,65.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .home >>将你的炉石设为 Lion's Pride Inn
	.target Innkeeper Farley
    .isQuestAvailable 47
    .nodmf
step
    #veteran
    #label 烹饪
    .goto 37,44.37,65.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师托马斯|r
    .train 2550 >>火车烹饪
	.target Tomas
    .dmf
step
    #fresh
    .goto 37,43.77,65.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .turnin 37112 >>交任务: |cRXP_FRIENDLY_休息和放松|r
    .home >>将你的炉石设为 Lion's Pride Inn
	.target Innkeeper Farley
    .isQuestAvailable 47
step
    #optional
    #completewith next
    .goto 37,43.23,65.95,5,0
    .goto 37,43.13,65.74,5,0
    .goto 37,42.93,65.71,6,0
    .goto 37,42.14,67.26,12 >>前往 |cRXP_FRIENDLY_Remy“两次”|r
step
    .goto 37,42.14,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r
    .accept 40 >>接任务: |cRXP_LOOT_鱼人的威胁|r
    .accept 47 >>接任务: |cRXP_LOOT_金砂交易|r
	.target 雷米“两次”
step
    #veteran
    .goto 37,41.95,67.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lien Farmer|r
    >>|cRXP_WARN_这些职业以后会用于暗月马戏团任务。如果你不想这样做，请跳过此步骤|r
    .train 2259 >>训练 |T4620669:0|t[炼金术] 和 |T4620676:0|t[铭文]
	.skipgossip 47384,2,1,1
	.target Lien Farmer
    .dmf
step
    #veteran
    .goto 37,41.95,67.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lien Farmer|r
    .train 45357 >>火车 |T4620676:0|t[铭文]
	.skipgossip 47384,3,6,2
	.target Lien Farmer
    .dmf
    .train 2259,3 --Only show if you have Alchemy
step
    #veteran
    .goto 37,41.89,67.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨瑞恩·博丁|r
--    .collect 2604,1,29520,1 --Red Dye (1)
--    .collect 6260,1,29520,1 --Blue Dye (1)
--  .collect 2320,1,29520,1 --Coarse Thread (1)
    .collect 30817,5,29509,1 --Simple Flour (5)
    .collect 39354,5,29515,1 --Light Parchment (1)
	.target Tharynn Bouden
    .dmf
    .train 45357,3 --Only show if you have Inscription
--XX 29520 needs to be added
--XX DMF section needs a polish at some point. Coords to 3dp, new formatting, #optional on steps
step
    #veteran
    .goto 37,41.89,67.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨瑞恩·博丁|r
--    .collect 2604,1,29520,1 --Red Dye (1)
--    .collect 6260,1,29520,1 --Blue Dye (1)
--  .collect 2320,1,29520,1 --Coarse Thread (1)
    .collect 30817,5,29509,1 --Simple Flour (5)
	.target Tharynn Bouden
    .dmf
--XX 29520 needs to be added
--XX DMF section needs a polish at some point. Coords to 3dp, new formatting, #optional on steps
step
    .goto 37,43.2,65.99,5,0
    .goto 37,43.2,65.63,5,0
    .goto 37,42.9,65.7,5,0
    .goto 37,41.78,69.55
    .zone 407 >>通过 |cRXP_PICK_暗月马戏团传送门|r |cFFfa9602前往暗月岛。|r
    .dmf
step
    #completewith next
    +|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_FRIENDLY_Strider 互动。|r |cRXP_WARN_only 如果你没有 1 级坐骑。|r
    .dmf
step
    #veteran
    .goto 407,51.57,24.84,10,0
    .goto 407,55.83,53.02,15,0
    .goto 407,50.44,59.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kae Ti|r and buy a |T133734:0|t[Ride Ticket Book] from her.
    *|cRXP_WARN_buy the cheaper version |cFFfa9602on the left in the window|r|r
    .collect 92788,1,92794,1 --Ride Ticket Book (1)
	.target Kae Ti
    .dmf
step
    #completewith next
    .goto 407,49.45,57.5
    .cast 107829 >>|cRXP_WARN_打开乘车票簿|r
    .dmf
    .use 92788
    .use 92794
step
	#veteran
    .goto 407,49.45,57.5
    >>|cRXP_WARN_站在旋转木马上|cRXP_WARN_等待经验增益达到60分钟|r|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击你背包里的任务物品 |cRXP_WARN_并跳过你没有的物品)|
    --x insert macro to accept quests here
    .accept 29464 >>接任务: |cRXP_WARN_占卜道具|r
    .accept 29451 >>接任务: |cRXP_WARN_战略大师|r
    .accept 29456 >>接任务: |cRXP_WARN_缴获的旗帜|r
    .accept 29457 >>接任务: |cRXP_WARN_敌人的徽记|r
    .accept 29458 >>接任务: |cRXP_WARN_缴获的日记|r
    .accept 29443 >>接任务: |cRXP_WARN_奇怪的水晶|r
    .accept 29444 >>接任务: |cRXP_WARN_古怪的蛋|r
    .accept 29445 >>接任务: |cRXP_WARN_奇异的魔典|r
    .accept 29446 >>接任务: |cRXP_WARN_精美的武器|r
    .zoneskip 407,1
    .dmf
step
	#fresh
    .goto 407,49.45,57.5
    >>|cRXP_WARN_站在旋转木马上|cRXP_WARN_等待经验增益达到60分钟|r|r
    .zoneskip 407,1
    .dmf
step
	#veteran
    .goto 407,51.91,60.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Professor Paleo|r
    .turnin -29464 >>交任务: |cRXP_FRIENDLY_占卜道具|r
    .turnin -29451 >>交任务: |cRXP_FRIENDLY_战略大师|r
    .turnin -29456 >>交任务: |cRXP_FRIENDLY_缴获的旗帜|r
    .turnin -29457 >>交任务: |cRXP_FRIENDLY_敌人的徽记|r
    .turnin -29458 >>交任务: |cRXP_FRIENDLY_缴获的日记|r
    .turnin -29443 >>交任务: |cRXP_FRIENDLY_奇怪的水晶|r
    .turnin -29446 >>交任务: |cRXP_FRIENDLY_精美的武器|r
    .zoneskip 407,1
    .dmf
step
    #veteran
    .goto 407,47.76,64.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉瓦斯·格里加特|r
    .turnin 7905 >>交任务: |cRXP_FRIENDLY_暗月马戏团|r
    .collect 171364,1,29506,1 --Darkmoon Top Hat (1)
	.target Gelvas Grimegate
    .zoneskip 407,1
    .dmf
step
    #fresh
    .goto 407,47.76,64.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吉瓦斯·格里加特|r
    .turnin 7905 >>交任务: |cRXP_FRIENDLY_暗月马戏团|r
	.target Gelvas Grimegate
    .zoneskip 407,1
    .dmf
step
    .goto 407,52.89,67.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯塔姆·雷角|r
    .accept 29509 >>接任务: |cRXP_WARN_让青蛙肉更松脆|r
	.target Stamp Thunderhorn
    .zoneskip 407,1
    .dmf
step
    .goto 407,52.88,67.96
    >>使用 |T133642:0|t[丰满的青蛙] 将它们变成 |T237579:0|t[裹面包屑的青蛙]。
	.collect 72056,5,29509,1,-1 --Plump Frogs (5)
	.collect 30817,5,29509,1,-1 --Simple Flour (5)
	.collect 72057,5,29509,1 --Breaded Frog (5)
    .use 72056 --Plump Frog
    .zoneskip 407,1
	.dmf
	.isOnQuest 29509
step
    .goto 407,52.88,67.96
	>>使用 |cRXP_FRIENDLY_Stamp Thunderhorn|r 附近的 |T237579:0|t[面包青蛙]
	.collect 72057,5,29509,1,-1 --Breaded Frog (5)
    .complete 29509,1 --5/5 Crunchy Frog
	.use 72057 --Breaded Frog
    .zoneskip 407,1
    .dmf
	.isOnQuest 29509
step
    .goto 407,52.88,67.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯塔姆·雷角|r
    .turnin 29509 >>交任务: |cRXP_FRIENDLY_让青蛙肉更松脆|r
	.target Stamp Thunderhorn
    .zoneskip 407,1
    .dmf
step
    .goto 407,50.54,69.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞兰妮亚|r
    .accept 29506 >>接任务: |cRXP_WARN_调制饮料|r
    .collect 19299,5,29506,1 --Fizzy Faire Drinks (5)
	.target Sylannia
    .zoneskip 407,1
    .dmf
    .train 2259,3 --Only show if you have Alchemy
step
    .goto 407,50.54,69.56
    >>使用 |T132793:0|t[鸡尾酒调酒器] 制作 |T463532:0|t[月莓汽水]
    .collect 1645,5,29506,1,-1 --Moonberry Juice (5)
    .collect 19299,5,29506,1,-1 --Fizzy Faire Drinks (5)
    .complete 29506,1 --5/5 Moonberry Fizz
    .use 72043 --Cocktail Shaker
    .zoneskip 407,1
    .dmf
    .isOnQuest 29506
step
    .goto 407,50.53,69.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞兰妮亚|r
    .turnin 29506 >>交任务: |cRXP_FRIENDLY_调制饮料|r
	.target Sylannia
    .zoneskip 407,1
    .dmf
    .isOnQuest 29506
step
    .goto 407,53.23,75.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞格|r
    .turnin 29445 >>交任务: |cRXP_FRIENDLY_奇异的魔典|r
    .accept 29515 >>接任务: |cRXP_WARN_书写未来|r
	.target Sayge
    .zoneskip 407,1
    .dmf
	.isOnQuest 29445
    .train 45357,3 --Only show if you have Inscription
step
    #optional
    .goto 407,53.23,75.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞格|r
    .turnin 29445 >>交任务: |cRXP_FRIENDLY_奇异的魔典|r
	.target Sayge
    .zoneskip 407,1
    .dmf
	.isOnQuest 29445
step
    #optional
    .goto 407,53.23,75.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞格|r
    .accept 29515 >>接任务: |cRXP_WARN_书写未来|r
	.target Sayge
    .zoneskip 407,1
    .dmf
    .train 45357,3 --Only show if you have Inscription
step
    .goto 407,53.23,75.82
	>>使用 |T413571:0|t[一捆奇异的草药] 制作 |T237061:0|t[预言墨水]
	.collect 71972,1,29515,1
    .use 71971
    .zoneskip 407,1
	.dmf
	.isOnQuest 29515
step
    .goto 407,53.23,75.82
    >>使用 |T237061:0|t[预言墨水] 来制作 |T134943:0|t[财富]
    .collect 39354,5,29515,1,-1 --Light Parchment
    .complete 29515,1 --5/5 Fortune
    .use 71972
    .zoneskip 407,1
	.dmf
	.isOnQuest 29515
step
    .goto 407,53.23,75.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞格|r
    .turnin 29515 >>交任务: |cRXP_FRIENDLY_书写未来|r
	.target Sayge
    .skipgossip
    .zoneskip 407,1
    .dmf
step
    #veteran
    .goto 407,51.11,82.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_亚布·尼比盖尔|r
    .turnin 29444 >>交任务: |cRXP_FRIENDLY_古怪的蛋|r
	.target Yebb Neblegear
    .zoneskip 407,1
    .dmf
	.isOnQuest 29444
step
    .goto 407,50.56,90.80
    .zone 37 >>通过 |cRXP_PICK_暗月马戏团传送门|r |cFFfa9602前往艾尔文森林。|r
    .zoneskip 407,1
    .dmf
step
    #completewith next
    +|cRXP_WARN_放弃你的职业|r
    .link /run AbandonSkill(773); AbandonSkill(171); >>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    --x .skill 773,<1 >>忘记铭文
    --x .skill 171,<1 >>忘记炼金术
    --x add unlearn logic
    .isOnQuest 60
	.dmf
step
    #sticky
    #label Professions1
    #completewith Professions3
    .goto 37,41.95,67.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lien Farmer|r
    >>|cRXP_WARN_采集草药和采矿矿脉可获得经验值。只采集直接路径上的资源|r
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    .train 2366 >>训练 |T4620675:0|t[草药学]
    .train 2575 >>列车 |T4620679:0|t[采矿]
    .target Lien Farmer
    .skipgossip 47396,1,1,1
    .train 2366,1 --Herbalism
    .train 2575,1 --Mining
step
    #optional
    #requires Professions1
    #label Professions2
    #completewith Professions3
    .goto 37,41.95,67.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lien Farmer|r
    >>|cRXP_WARN_采药草可获得经验值。只采集你直接路径上的资源|r
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    .train 2366 >>训练 |T4620675:0|t[草药学]
    .target Lien Farmer
    .skipgossip 47396,2,2,2
    .train 2575,3 --Mining
step
    #optional
    #requires Professions2
    #label Professions3
    .goto 37,41.95,67.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lien Farmer|r
    >>|cRXP_WARN_采矿矿脉提供经验值。只收集你直接路径上的资源|r
    >>|cRXP_WARN_如果你不想这样做，请跳过此步骤|r
    .train 2575 >>列车 |T4620679:0|t[采矿]
    .target Lien Farmer
    .skipgossip 47396,2,3,2
    .train 2366,3 --Herbalism
step
	#veteran
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Julia Stevens|r.
    >>|cRXP_WARN_如果您没有 25 级宠物战斗宠物，请跳过此步骤。|r
    .goto 37,41.65,83.67
    .accept 31693 >>接任务: |cRXP_WARN_茱莉亚·史蒂文斯|r
    .target Julia Stevens
    .isQuestTurnedIn 31903 --x Pet Battle Campaign Check
step
	#veteran
    >>在宠物对战中击败 |cRXP_ENEMY_Julia Stevens|r。
    .complete 31693,1 --Defeat Julia Stevens
    .target Julia Stevens
    .isOnQuest 31693
step
	#veteran
    .goto 37,41.66,83.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Julia Stevens|r
    .turnin 31693 >>交任务: |cRXP_FRIENDLY_茱莉亚·史蒂文斯|r
    .target Julia Stevens
    .isQuestComplete 31693
step
    #completewith FargodeepM
    .goto 37,38.22,83.41,0
    >>杀死 |cRXP_ENEMY_Kobold Tunnelers|r 和 |cRXP_ENEMY_Kobold Miners|r。掠夺他们的 |cRXP_LOOT_Large Candles|r 和 |cRXP_LOOT_Gold Dust|r
    .complete 60,1 --8/8 Large Candle
    .complete 47,1 --10/10 Gold Dust
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    #optional
    .goto 37,38.22,83.41,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Narg the Taskmaster|r。如果他醒了就杀了他|r
	.unitscan Narg the Taskmaster
    .isOnQuest 60
    .noflyable
step
    #optional
	#completewith next
    .goto 37,38.94,82.23,12,0
    .goto 38,42.52,71.63
    .subzone 54 >>进入法戈迪普矿井的上层
step
    #label FargodeepM
    .goto 38,54.31,59.56,-1
    .goto 39,66.53,66.18,-1
    >>进入法戈迪普矿井内的其中一个中央房间
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
	.mob Kobold Tunneler
	.mob Kobold Miner
step
    .goto 37,34.66,84.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .accept 88 >>接任务: |cRXP_LOOT_公主必须死！|r
	.target 马斯通菲尔德
step
    #optional
    .goto 37,33.64,87.76,15 >>|cRXP_WARN_[宝箱] 检查马厩内的 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .isOnQuest 60
    .noflyable
step
    #loop
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
step
    .goto 37,34.66,84.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯通菲尔德妈妈|r
    .turnin 88 >>交任务: |cRXP_FRIENDLY_公主必须死！|r
	.target 马斯通菲尔德
step
    #optional
    .goto 37,30.81,64.65,40 >>|cRXP_WARN_[罕见] 检查里面是否有 |cRXP_ENEMY_Morgaine the Sly|r。如果她醒了就杀了她|r
    .unitscan Morgaine the Sly
    .isOnQuest 60
    .noflyable
step
    #optional
    .goto 37,27.22,67.51,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Grizzled Ben|r。如果他醒了就杀了他|r
	.unitscan Grizzled Ben
    .isOnQuest 60
    .noflyable
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: Wanted Poster, |cRXP_FRIENDLY_瑞尼尔副队长|r
    .accept 176 >>接任务: |cRXP_WARN_通缉：霍格|r
    .goto 37,24.55,74.67
    .accept 11 >>接任务: |cRXP_LOOT_悬赏河爪豺狼人|r
    .goto 37,24.23,74.45
	.target 副总统雷纳
step
    #optional
	#completewith Bounty
    .goto 37,24.36,93.65,0
    .goto 37,26.10,91.95,0
    .goto 37,25.30,88.95,0
    .goto 37,27.80,88.36,0
    .goto 37,27.67,86.21,0
    .goto 37,26.32,86.82,0
    +|cRXP_WARN_[稀有宝箱] 留意营地中的 |cRXP_PICK_Chest|r 和 |cRXP_ENEMY_Gruff Swiftbite|r。如果找到 |cRXP_PICK_Chest|r，则将其抢走；如果 |cRXP_ENEMY_Gruff Swiftbite|r 出现，则将其击杀|r
	.unitscan Gruff Swiftbite
    .noflyable
step
    #sticky
    #label Armbands
    #loop
    .goto 37,24.36,93.65,0
    .goto 37,26.10,91.95,0
    .goto 37,25.30,88.95,0
    .goto 37,27.80,88.36,0
    .goto 37,27.67,86.21,0
    .goto 37,26.32,86.82,0
    .waypoint 37,24.36,93.65,40,0
    .waypoint 37,26.10,91.95,40,0
    .waypoint 37,25.30,88.95,40,0
    .waypoint 37,27.80,88.36,40,0
    .waypoint 37,27.67,86.21,40,0
    .waypoint 37,26.32,86.82,40,0
    >>杀死 |cRXP_ENEMY_Riverpaw Outrunners|r 和 |cRXP_ENEMY_Riverpaw Runts|r。掠夺他们的 |cRXP_LOOT_Painted Gnoll Armbands|r
    .complete 11,1 --8/8 Painted Gnoll Armband
	.mob *Riverpaw Outrunner
	.mob *Riverpaw Runt
step
    #sticky
    #label Deed
    .goto 37,24.78,95.26
    >>点击地面上的 |cRXP_PICK_Westfall Deed|r
    .accept 184 >>接任务: |cRXP_LOOT_法布隆的地契|r
step
    #label Hogger
    .goto 37,24.85,95.14
    >>击败 |cRXP_ENEMY_Hogger|r
    >>|cRXP_WARN_打败他后不要等待 RP|r
    .complete 176,1 --1/1 Dealt with "The Hogger Situation"
    .mob Hogger
    .mob Minion of Hogger
step
    #optional
    #requires Deed
--XXREQ Placeholder invis step until multiple requires per step
step
    #label Bounty
    #requires Armbands
    .goto 37,24.23,74.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瑞尼尔副队长|r
    .turnin 11 >>交任务: |cRXP_FRIENDLY_悬赏河爪豺狼人|r
	.target 副总统雷纳
step
	#veteran
    .goto 52,60.85,18.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Old MacDonald|r
    >>|cRXP_WARN_如果您没有 25 级宠物战斗宠物，请跳过此步骤。|r
    .accept 31780 >>接任务: |cRXP_WARN_老马当劳|r
	.target Old MacDonald
    .isQuestTurnedIn 31903
step
	#veteran
    .goto 52,61.04,18.82
    >>在宠物战斗中击败 |cRXP_ENEMY_Old MacDonald|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与老麦克唐纳交谈
    .complete 31780,1 --Defeat Old MacDonald
	.target Old MacDonald
    .skipgossip 65648,1
    .isOnQuest 31780
step
	#veteran
    .goto 52,61.04,18.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Old MacDonald|r
    .turnin 31780 >>交任务: |cRXP_FRIENDLY_老马当劳|r
	.target Old MacDonald
    .isQuestComplete 31780
step
    .goto 52,60.05,19.28,5,0
    .goto 52,60.18,19.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Homeless Stormwind Citizens|r, |cRXP_FRIENDLY_West Plains Drifters|r, and |cRXP_FRIENDLY_Transients|r. Pay them for their |cRXP_LOOT_Clues|r.
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
    .skill riding,75,1
step
    #loop
    #optional
    .goto 52,58.23,18.12,0
    .goto 52,58.56,16.21,20,0
    .goto 52,59.18,18.16,20,0
    .goto 52,58.12,19.58,20,0
    .goto 52,57.31,18.33,20,0
    .goto 52,58.56,16.21,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Homeless Stormwind Citizens|r, |cRXP_FRIENDLY_West Plains Drifters|r, and |cRXP_FRIENDLY_Transients|r for their |cRXP_LOOT_Clues|r.
    >>|cRXP_WARN_保持骑乘姿势并与他们进行垃圾对话，如果他们变得有敌意，则忽略他们|r
    .complete 26209,1 --1/1 Clue #1 obtained
    .complete 26209,2 --1/1 Clue #2 obtained
    .complete 26209,3 --1/1 Clue #3 obtained
    .complete 26209,4 --1/1 Clue #4 obtained
	.target Homeless Stormwind Citizen
	.target West Plains Drifter
    .target Transients
    .skipgossip 2
    .skill riding,<75,1
step
    .goto 52,60.05,19.28,5,0
    .goto 52,60.18,19.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r
    .turnin 26209 >>交任务: |cRXP_FRIENDLY_他们把谋杀案撂我这儿了|r
    .accept 26213 >>接任务: |cRXP_WARN_重要线索：河爪氏族|r
	.target Lieutenant Horatio Laine
step
    #optional
	#completewith Horatio
    .goto 52,56.46,13.26,30 >>|cRXP_WARN_[宝箱] 检查营地中是否有 |cRXP_PICK_Chest|r|r
    .noflyable
step
    #loop
    .goto 52,56.46,13.26,0
    .goto 52,58.16,10.71,40,0
    .goto 52,57.17,15.12,40,0
    .goto 52,51.38,15.89,40,0
    .goto 52,50.68,14.77,40,0
    .goto 52,56.46,13.26,40,0
    >>杀死 |cRXP_ENEMY_Riverpaw Scouts|r 和 |cRXP_ENEMY_Riverpaw Gnolls|r。从他们身上搜刮 |cRXP_LOOT_Riverpaw Gnoll Clue|r
    .complete 26213,1 --1/1 Riverpaw Gnoll Clue
	.mob Riverpaw Scout
	.mob Riverpaw Gnoll
step
	#label Horatio
    .goto 52,60.05,19.28,5,0
    .goto 52,60.18,19.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍拉提奥·莱茵中尉|r
    .turnin 26213 >>交任务: |cRXP_FRIENDLY_重要线索：河爪氏族|r
    .target Lieutenant Horatio Laine
step
    #completewith next
    .hs >>狮子之傲旅馆
step
    .goto 37,43.32,65.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威廉·匹斯特|r
    .turnin 60 >>交任务: |cRXP_FRIENDLY_狗头人的蜡烛|r
    .target William Pestle
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r, |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .goto 37,42.14,67.25
	.target +雷米“两次”
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .turnin 40 >>交任务: |cRXP_FRIENDLY_鱼人的威胁|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .goto 37,42.11,65.93
	.target +杜汉元帅
	.isOnQuest 40
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷米|r, |cRXP_FRIENDLY_治安官杜汉|r
    .turnin 47 >>交任务: |cRXP_FRIENDLY_金砂交易|r
    .goto 37,42.14,67.25
	.target +雷米“两次”
    .turnin 62 >>交任务: |cRXP_FRIENDLY_法戈第矿洞|r
    .accept 35 >>接任务: |cRXP_LOOT_卫兵托马斯|r
    .accept 76 >>接任务: |cRXP_LOOT_玉石矿洞|r
    .turnin 176 >>交任务: |cRXP_FRIENDLY_通缉：霍格|r
    .goto 37,42.11,65.93
	.target +杜汉元帅
step
    .goto 37,41.69,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安德温·克里顿|r
	.vendor >>供应商和维修
    .isOnQuest 35
	.target Andrew Krighton
    .noflyable --Azeroth Flying
step
    #optional
    .goto 37,52.25,62.90,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Lamepaw the Whimperer|r。如果他醒了就杀了他|r
	.unitscan Lamepaw the Whimperer
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,57.49,64.61,45 >>|cRXP_WARN_[CHEST] Scan the murloc islands with your mouse for a|r |cRXP_PICK_Chest|r. Your mouse will become a |TInterface/cursor/crosshair/interact.blp:20|tgear icon if there's a |cRXP_PICK_Chest|r. If you find one. Loot it if it's up|r
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,66.51,63.83,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Tarantis|r。如果他醒了就杀了他|r
	.unitscan Tarantis
    .isOnQuest 35
    .noflyable
step
    #optional
    .goto 37,64.7,56.73,30 >>|cRXP_WARN_[宝箱] 检查狗头人营地内的 |cRXP_PICK_Chest|r。如果在，则将其抢走|r
    .isOnQuest 35
    .noflyable
step
    #completewith next
    .goto 37,61.65,53.93,12,0
    .goto 40,48.05,87.33
    .subzone 54 >>进入 Jasperlode 矿井
step
    .goto 40,44.22,67.89,12,0
    .goto 40,38.71,60.84,12,0
    .goto 40,35.92,52.81
    >>沿着 Jasperlode 矿井内的中间路径走
    .complete 76,1 --Scout Through the Jasperlode Mine (1)
step
    #optional
	.goto 40,31.02,37.51,20,0
    .goto 40,37.01,50.26,20,0
    .goto 40,47.25,36.66,20,0
    .goto 40,53.93,30.58,20,0
    .goto 40,45.14,21.76,20 >>|cRXP_WARN_[罕见] 检查 Jasperlode 矿井后面的 |cRXP_ENEMY_Mother Fang|r。如果她起来了就杀了她|r
	.unitscan Mother Fang
    .isOnQuest 35
    .noflyable
step
    #completewith next
    .goto 37,61.58,70.04,0
    .deathskip >>在 |cRXP_FRIENDLY_Spirit Healer|r 处死亡并重生
    .isOnQuest 35
    .skill riding,75,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r, Bounty Board
    .turnin 35 >>交任务: |cRXP_FRIENDLY_卫兵托马斯|r
    .accept 37 >>接任务: |cRXP_LOOT_失踪的卫兵|r
    .accept 52 >>接任务: |cRXP_LOOT_保卫边境|r
    .goto 37,73.973,72.177
	.target +后卫托马斯
    .accept 46 >>接任务: |cRXP_WARN_悬赏鱼人|r
    .accept 26152 >>接任务: |cRXP_WARN_通缉：詹姆斯·克拉克|r
    .goto 37,74.025,72.310
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_Gray Forest Wolves|r
    >>杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*灰森林狼
    .complete 52,2 --Kill 年轻的森林熊 (5)
    .mob +年轻的森林熊
step
    #optional
    .goto 37,82.95,84.82,40 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Bushtail|r。如果他醒了就杀了他|r
    .isOnQuest 52
	.unitscan Bushtail
    .noflyable
step
	#completewith next
    .goto 37,75.71,86.29,0
    >>杀死 |cRXP_ENEMY_Murloc Foragers|r 和 |cRXP_ENEMY_Murloc Lurkers|r。掠夺他们的 |cRXP_LOOT_Torn Murloc Fins|r
    .complete 46,1,4 --Torn Murloc Fin (4/8)
    .mob Murloc Forager
    .mob Murloc Lurker
step
    .goto 37,75.71,86.29,30,0
    .goto 37,77.55,85.75
    .deathskip >>在杀死 |cRXP_ENEMY_Murloc Foragers|r 和 |cRXP_ENEMY_Murloc Lurkers|r 时死亡并在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 46
    .skill riding,75,1
step
    .goto 37,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉里克·费恩|r
    .vendor 1198 >>供应商和维修
	.target Rallic Finn
	.isOnQuest 52
    .noflyable --Azeroth Flying
step
    .goto 37,79.462,68.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .accept 83 >>接任务: |cRXP_WARN_红色亚麻布|r
    .target Sara Timberlain
step
    .goto 37,78.87,67.20,10,0
    .goto 37,78.637,67.157
    >>杀死里面的 |cRXP_FRIENDLY_James Clark|r。搜刮他的 |cRXP_LOOT_James Clark 的头颅|r 和 |T134939:0|t|cRXP_LOOT_[金币领取时间表]|r
    >>|cRXP_WARN_使用 |T134939:0|t|cRXP_LOOT_[金币领取时间表]|r 开始任务|r
    .complete 26152,1 --James Clark's Head (1)
    .collect 1307,1,123,1 --Gold Pickup Schedule (1)
    .accept 123 >>接任务: |cRXP_LOOT_收货人|r
    .mob James Clark
    .use 1307
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
    #completewith StoneCairn
    .goto 37,81.72,58.57,0
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
    #completewith MurlocFins
    .goto 37,80.88,53.78,0
    .goto 37,80.63,62.25,0
    .goto 37,82.79,60.12,0
    >>在树木旁边的地面上拾取 |cRXP_LOOT_Bundles of Wood|r
    .complete 5545,1 -- Bundle of Wood (8)
step
    #label LostGuards
    .goto 37,72.653,60.323
    >>点击地面上的 |cRXP_PICK_A 半被吃掉的尸体|r
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
    >>杀死 |cRXP_ENEMY_Murloc Foragers|r 和 |cRXP_ENEMY_Murloc Lurkers|r。掠夺他们的 |cRXP_LOOT_Torn Murloc Fins|r
    >>|cRXP_WARN_小心 |cRXP_ENEMY_Murloc Foragers|r 会施放|r |T135915:0|t[喝下小药水] |cRXP_WARN_这会治愈他们自己 61-68 点生命值|r
    .complete 46,1 --Torn Murloc Fin (8)
    .mob Murloc Forager
    .mob Murloc Lurker
step
    .goto 37,79.795,55.510
    >>点击地面上的 |cRXP_PICK_Rolf 的尸体|r
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
    >>杀死 |cRXP_ENEMY_Prowlers|r 和 |cRXP_ENEMY_Gray Forest Wolves|r
    >>杀死你看到的任何|cRXP_ENEMY_年轻的森林熊s|r
    .complete 52,1 --Kill Prowler or Forest Wolf (8)
    .mob +*Prowler
    .mob +*灰森林狼
    .complete 52,2 --Kill 年轻的森林熊 (5)
    .mob +年轻的森林熊
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
    >>在树木旁边的地面上拾取 |cRXP_LOOT_Bundles of Wood|r
    .complete 5545,1 -- Bundle of Wood (8)
step << skip
    #requires MurlocFins
    #completewith next
    .goto 37,77.65,57.70
    >>|cRXP_WARN_如果你的健康水平不低，请跳过此步骤|r
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
step
    .goto 37,73.973,72.177
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卫兵托马斯|r
    .turnin 46 >>交任务: |cRXP_FRIENDLY_悬赏鱼人|r
    .turnin 52 >>交任务: |cRXP_FRIENDLY_保卫边境|r
    .turnin 71 >>交任务: |cRXP_FRIENDLY_回复托马斯|r
    .accept 59 >>接任务: |cRXP_LOOT_布甲和皮甲|r
    .target 后卫托马斯
step
    #completewith Morgan
    .goto 37,68.56,82.68,0
    .goto 37,67.63,78.01,0
    .goto 37,68.23,76.33,0
    .goto 37,71.31,76.93,0
    .goto 37,71.81,78.51,0
    >>杀死里面的 |cRXP_ENEMY_Bandits|r、|cRXP_ENEMY_Erlan Drudgemoor|r 和 |cRXP_ENEMY_Surena Caledon|r。掠夺他们的 |cRXP_LOOT_Linen Scraps|r
    .complete 83,1 --Collect Linen Scrap (6)
    .mob Bandit
    .mob Erlan Drudgemoor
    .mob Surena Caledon
step
    #optional
    #label Morgan
    .goto 37,71.02,80.67
    >>杀死里面的 |cRXP_ENEMY_Morgan the Collector|r。搜刮他的 |cRXP_LOOT_The Collector's 戒指|r 和 |cRXP_LOOT_Linen Scraps|r
    >>|cRXP_WARN_[宝箱] 检查房屋内和周围是否有 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .complete 147,1 --The Collector's 戒指 (1)
    .complete 83,1 --Collect Linen Scrap (6)
    .disablecheckbox
    .mob Morgan the Collector
    .itemcount 1019,<6
    .isOnQuest 83
step
    .goto 37,71.02,80.67
    >>杀死里面的 |cRXP_ENEMY_收藏家摩根|r。从他身上搜刮 |cRXP_LOOT_收藏家的戒指|r
    >>|cRXP_WARN_[宝箱] 检查房屋内和周围是否有 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .complete 147,1 --The Collector's 戒指 (1)
    .mob Morgan the Collector
step
    #optional
    #sticky
    #label Snoot
    .goto 37,69.32,79.31,30 >>|cRXP_WARN_[罕见] 检查 |cRXP_ENEMY_Snoot the Rooter|r。如果他醒了就杀了他|r
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
    >>杀死 |cRXP_ENEMY_Bandits|r。掠夺他们的 |cRXP_LOOT_Linen Scraps|r
    >>|cRXP_WARN_[宝箱] 检查谷仓内和周围是否有 |cRXP_PICK_Chest|r。如果在上方，则将其抢走|r
    .complete 83,1 --Collect Linen Scrap (6)
    .mob Bandit
step
    #completewith next
    #requires Snoot
    .goto 37,75.71,86.29,30,0
    .goto 37,77.55,85.75,-1
    .goto 37,83.68,69.74,-1
    .deathskip >>死亡后在 |cRXP_FRIENDLY_Spirit Healer|r 处重生
    .isOnQuest 83
    .skill riding,75
step
    #requires Snoot
    .goto 37,83.283,66.089
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉里克·费恩|r
    .vendor 1198 >>供应商和维修
	.target Rallic Finn
    .isOnQuest 83
    .noflyable --Azeroth Flying
step << !DarkIronDwarf !KulTiran !LightforgedDraenei !机械侏儒 !VoidElf
    .goto 37,81.829,66.556
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迅翼高斯|r
    .fp Eastvale Logging Camp >>获取 Eastvale Logging Camp 飞行路线
	.target Goss the Swift
step
    .goto 37,81.860,66.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Marshal Patterson|r
    .turnin 147 >>交任务: |cRXP_FRIENDLY_猎杀收货人|r
    .target Marshal Patterson
step
    .goto 37,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_管理员莱琳|r
    .turnin 5545 >>交任务: |cRXP_FRIENDLY_木材危机|r
    .target Supervisor Raelen
step
    .goto 37,79.462,68.715
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉·迪博雷恩|r
    .turnin 83 >>交任务: |cRXP_FRIENDLY_红色亚麻布|r
    .turnin 59 >>交任务: |cRXP_FRIENDLY_布甲和皮甲|r
    .target Sara Timberlain
]])
