local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 1-6 Durotar
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 6-10 Durotar
#displayname 1-6 杜隆塔尔
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\1-6 Durotar
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 6-10 Durotar
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Durotar
#displayname 6-10 杜隆塔尔
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\6-10 Durotar
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 10-12 Durotar
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Tirisfal (Orc/Troll) << !Hunter !Shaman !Tauren !Skyborne
#next 12-16 The Barrens << Orc Hunter/Troll Hunter/Orc Shaman/Troll Shaman
#displayname 10-12 杜隆塔尔
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\10-12 Durotar
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 10-12 Tirisfal (Orc/Troll)
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor !Hunter !Shaman !Tauren !Skyborne !Undead
#next 12-14 Silverpine Forest << !Hunter !Shaman !Tauren !Skyborne !Undead
#displayname 10-12 提瑞斯法林地（兽人/巨魔）
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\10-12 Tirisfal (Orc/Troll)
]])
