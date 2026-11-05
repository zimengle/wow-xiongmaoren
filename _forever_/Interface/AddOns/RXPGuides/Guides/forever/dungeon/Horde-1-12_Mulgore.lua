local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 1-6 Mulgore
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Tauren
#next 6-12 Mulgore
#displayname 1-6 莫高雷
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\1-6 Mulgore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 6-12 Mulgore
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#defaultfor Tauren
#next 12-16 The Barrens
#displayname 6-12 莫高雷
step
.enabledungeon RFC
#include RestedXP Forever Guide (H)\6-12 Mulgore
]])
