local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#season 0,1
<< Alliance
#name 1-6 Shadowglen
#version 1
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#defaultfor NightElf
#next 6-11 Teldrassil
#displayname 1-6 幽影谷
step
#include RestedXP Forever Guide (A)\1-6 Shadowglen
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#season 0,1
<< Alliance
#name 6-11 Teldrassil
#version 1
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#defaultfor NightElf
#next 11-16 Darkshore/Loch Modan
#displayname 6-11 泰达希尔
step
#include RestedXP Forever Guide (A)\6-11 Teldrassil
]])
