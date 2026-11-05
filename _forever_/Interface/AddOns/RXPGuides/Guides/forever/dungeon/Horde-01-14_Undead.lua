local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Undead
#name 1-6 Tirisfal Glades
#next 6-12 Tirisfal Glades
#displayname 1-6 提瑞斯法林地
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\1-6 Tirisfal Glades
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 6-12 Tirisfal Glades
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Undead
#next 12-14 Silverpine Forest; 12-17 The Barrens
#displayname 6-13 提瑞斯法林地 << Paladin
#displayname 6-12 提瑞斯法林地
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\6-12 Tirisfal Glades
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
<< Horde
#version 11
#defaultfor !Hunter !Shaman !Tauren
#forever
#era/som--h
#name 12-14 Silverpine Forest
#next 12-16 The Barrens
#displayname 13-15 银松森林 << Paladin
#displayname 12-14 银松森林
step
.enabledungeon RFC
.enabledungeon ROL
#include RestedXP Forever Guide (H)\12-14 Silverpine Forest
]])
