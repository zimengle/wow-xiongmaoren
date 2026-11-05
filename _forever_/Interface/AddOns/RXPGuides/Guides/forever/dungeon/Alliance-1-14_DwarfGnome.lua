local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 1-5 Coldridge Valley
#next 5-11 Dun Morogh
#defaultfor Dwarf/Gnome
#displayname 1-5 寒脊山谷
step
#include RestedXP Forever Guide (A)\1-5 Coldridge Valley
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#version 1
<< Alliance
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 5-11 Dun Morogh
#next 11-12 Elwynn (Dwarf/Gnome);11-12 Voidwalker Quest;12-14 Loch Modan (Dwarf/Gnome);11-13 Loch Modan (Hunter)
#defaultfor Dwarf/Gnome
#displayname 5-11 丹莫罗
step
#include RestedXP Forever Guide (A)\5-11 Dun Morogh
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
<< Alliance !Hunter
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 11-12 Elwynn (Dwarf/Gnome)
#version 1
#defaultfor Gnome/Dwarf
#next 12-14 Loch Modan (Dwarf/Gnome)
#displayname 11-12 艾尔文森林（矮人/侏儒）
step
#include RestedXP Forever Guide (A)\11-12 Elwynn (Dwarf/Gnome)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#version 1
<< Alliance !Hunter
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 12-14 Loch Modan (Dwarf/Gnome)
#next 13-15 Westfall
#defaultfor Gnome/Dwarf
#displayname 12-14 洛克莫丹（矮人/侏儒）
step
#include RestedXP Forever Guide (A)\12-14 Loch Modan (Dwarf/Gnome)
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，联盟）
#forever
#version 1
<< Alliance Hunter
#group RestedXP Forever Dungeon Guide (A)
#subgroup Dungeon Guide 1-20
#subgroupdisplayname 1-20
--#groupid RXP-SRGCE-A1
#name 11-13 Loch Modan (Hunter)
#next 13-15 Westfall
#defaultfor Dwarf
#displayname 11-13 洛克莫丹（猎人）
step
#include RestedXP Forever Guide (A)\11-13 Loch Modan (Hunter)@NormalRouteStart-NormalRouteEnd
]])