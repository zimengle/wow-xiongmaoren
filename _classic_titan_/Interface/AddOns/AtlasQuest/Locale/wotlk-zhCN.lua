--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


------------  WOTLK CLASSIC  ------------

-- 69 = DUNGEON: Caverns of Time: Stratholme Past
-- 70 = DUNGEON: Utgarde Keep: Utgarde Keep
-- 71 = DUNGEON: Utgarde Keep: Utgarde Pinnacle
-- 72 = DUNGEON: The Nexus: The Nexus
-- 73 = DUNGEON: The Nexus: The Oculus
-- 74 = RAID: The Nexus: The Eye of Eternity
-- 75 = DUNGEON: Azjol-Nerub: The Upper Kingdom
-- 76 = DUNGEON: Azjol-Nerub: Ahn'kahet: The Old Kingdom
-- 77 = DUNGEON: Ulduar: Halls of Stone
-- 78 = DUNGEON: Ulduar: Halls of Lightning
-- 79 = RAID: The Obsidian Sanctum
-- 80 = DUNGEON: Drak'Tharon Keep
-- 81 = DUNGEON: Zul'Drak: Gundrak
-- 82 = DUNGEON: The Violet Hold
-- 83 = BATTLEGROUND: Strand of the Ancients (SotA)
-- 84 = RAID: Naxxramas (Naxx)
-- 85 = RAID: Vault of Archavon (VoA)
-- 86 = RAID: Ulduar
-- 87 = DUNGEON: Trial of the Champion (ToC)
-- 88 = RAID: Trial of the Crusader (ToC)
-- 89 = BATTLEGROUND: Isle of Conquest (IoC)
-- 90 = DUNGEON: Forge of Souls (FoS)
-- 91 = DUNGEON: Pit of Saron (PoS)
-- 92 = DUNGEON: Halls of Reflection (HoR)
-- 93 = RAID: Icecrown Citadel (ICC)
-- 94 = RAID: Ruby Sanctum (RS)




if ( GetLocale() == "zhCN" ) then

---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff66cc33";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local YELLOW = "|cffFFd200";   -- Ingame Yellow





--------------- INST69 - Caverns of Time: Stratholme Past ---------------

Inst69Story = "Prior to his unthinkable merger with the Lich King, Arthas waged war against the Scourge, bent on eradicating the plague of undeath that had spread throughout Lordaeron. After Arthas watched villages succumb to darkness and saw his fallen subjects transformed into hideous undead creatures, fear and hate engulfed his mind. Upon discovering signs of the plague within Stratholme, he knew it was only a matter of time before the residents of the city were reborn as Scourge agents. For Arthas, there was only one course of action: purge the city. Yet within the Caverns of Time, deceptive magic permeates Stratholme. The infinite dragons and their agents have targeted Arthas and his quest to cull the city, seeking to alter history. Fearing the temporal disruption might jeopardize Azeroth's very existence, the bronze dragonflight has called upon mortals to assist Arthas and ensure that the purge is carried out successfully. Regardless of how vile the event might seem, the keepers of time maintain that what was, must always be."
Inst69Caption = "净化斯坦索姆"
Inst69QAA = "4个任务"
Inst69QAH = "4个任务"

--Quest 1 Alliance
Inst69Quest1 = "1. 驱除幻象"
Inst69Quest1_Aim = "克罗米要你对往日的斯坦索姆内的可疑箱子使用奥术干扰器，然后到斯坦索姆的入口附近去见她。"
Inst69Quest1_Location = "克罗米(往日的斯坦索姆; "..GREEN.."[1']"..WHITE..")"
Inst69Quest1_Note = "箱子可以在通往斯坦索姆的路上的房子附近找到。完成后，您可以在进入城市之前的桥上交给另一个克罗米完成任务。"
Inst69Quest1_Prequest = "无"
Inst69Quest1_Folgequest = "皇家护卫"
-- No Rewards for this quest

--Quest 2 Alliance
Inst69Quest2 = "2. 皇家护卫"
Inst69Quest2_Aim = "克罗米要你在阿尔萨斯净化斯坦索姆时陪在他身边。击败玛尔加尼斯后再去见她。"
Inst69Quest2_Location = "克罗米(往日的斯坦索姆; "..GREEN.."[1']"..WHITE..")"
Inst69Quest2_Note = "玛尔加尼斯在 "..YELLOW.."[5]"..WHITE.."。 克罗米会在事件结束后出现在那里。"
Inst69Quest2_Prequest = "驱除幻象"
Inst69Quest2_Folgequest = "无"
--
Inst69Quest2name1 = "时间守护者手套"
Inst69Quest2name2 = "历史之流裹手"
Inst69Quest2name3 = "纪年手套"
Inst69Quest2name4 = "清洗护手"

--Quest 3 Alliance
Inst69Quest3 = "3. 提迈尔的预言：永恒密探！"
Inst69Quest3_Aim = "根据达拉然的大法师提迈尔的预言，你必须去杀死4个永恒密探。"
Inst69Quest3_Location = "大法师提迈尔(达拉然 - 紫罗兰监狱; "..YELLOW.."64.2, 54.7"..WHITE..")"
Inst69Quest3_Note = "这是一个日常任务。永恒密探位于市政大厅建筑中，介于第二和第三个首领之间。"
Inst69Quest3_Prequest = "无"
Inst69Quest3_Folgequest = "无"
--
Inst69Quest3name1 = "肯瑞托奖章"
Inst69Quest3name2 = "银色北伐军奖章"
Inst69Quest3name3 = "黑锋骑士团奖章"
Inst69Quest3name4 = "龙眠联军奖章"
Inst69Quest3name5 = "霍迪尔之子奖章"
Inst69Quest3name6 = "征服纹章"

--Quest 4 Alliance
Inst69Quest4 = "4. 死亡证明：玛尔加尼斯"
Inst69Quest4_Aim = "达拉然的大法师兰达洛克要你将纳斯雷兹姆家园的圣物交给他。"
Inst69Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst69Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n玛尔加尼斯在 "..YELLOW.."[5]"..WHITE.."."
Inst69Quest4_Prequest = "无"
Inst69Quest4_Folgequest = "无"
--
Inst69Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst69Quest1_HORDE = Inst69Quest1
Inst69Quest1_HORDE_Aim = Inst69Quest1_Aim
Inst69Quest1_HORDE_Location = Inst69Quest1_Location
Inst69Quest1_HORDE_Note = Inst69Quest1_Note
Inst69Quest1_HORDE_Prequest = Inst69Quest1_Prequest
Inst69Quest1_HORDE_Folgequest = Inst69Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst69Quest2_HORDE = Inst69Quest2
Inst69Quest2_HORDE_Aim = Inst69Quest2_Aim
Inst69Quest2_HORDE_Location = Inst69Quest2_Location
Inst69Quest2_HORDE_Note = Inst69Quest2_Note
Inst69Quest2_HORDE_Prequest = Inst69Quest2_Prequest
Inst69Quest2_HORDE_Folgequest = Inst69Quest2_Folgequest
--
Inst69Quest2name1_HORDE = Inst69Quest2name1
Inst69Quest2name2_HORDE = Inst69Quest2name2
Inst69Quest2name3_HORDE = Inst69Quest2name3
Inst69Quest2name4_HORDE = Inst69Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst69Quest3_HORDE = Inst69Quest3
Inst69Quest3_HORDE_Aim = Inst69Quest3_Aim
Inst69Quest3_HORDE_Location = Inst69Quest3_Location
Inst69Quest3_HORDE_Note = Inst69Quest3_Note
Inst69Quest3_HORDE_Prequest = Inst69Quest3_Prequest
Inst69Quest3_HORDE_Folgequest = Inst69Quest3_Folgequest
--
Inst69Quest3name1_HORDE = Inst69Quest3name1
Inst69Quest3name2_HORDE = Inst69Quest3name2
Inst69Quest3name3_HORDE = Inst69Quest3name3
Inst69Quest3name4_HORDE = Inst69Quest3name4
Inst69Quest3name5_HORDE = Inst69Quest3name5
Inst69Quest3name6_HORDE = Inst69Quest3name6

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst69Quest4_HORDE = Inst69Quest4
Inst69Quest4_HORDE_Aim = Inst69Quest4_Aim
Inst69Quest4_HORDE_Location = Inst69Quest4_Location
Inst69Quest4_HORDE_Note = Inst69Quest4_Note
Inst69Quest4_HORDE_Prequest = Inst69Quest4_Prequest
Inst69Quest4_HORDE_Folgequest = Inst69Quest4_Folgequest
--
Inst69Quest4name1_HORDE = Inst69Quest4name1



--------------- INST70 - Utgarde Keep: Utgarde Keep ---------------

Inst70Story = "Among the cliffs of the Daggercap Bay in the Howling Fjord stands Utgarde Keep, an impervious fortress occupied by the savage and enigmatic vrykul. With mysterious, foul magic and proto-dragons at their command, the vrykul of Utgarde Keep pose an imminent threat to both the Alliance and the Horde. Only the bravest would dare to strike against Ymiron's faithful and delve into the heart of the vrykul's primeval home."
Inst70Caption = "乌特加德"
Inst70QAA = "3个任务"
Inst70QAH = "4个任务"

--Quest 1 Alliance
Inst70Quest1 = "1. 杀入乌特加德！"
Inst70Quest1_Aim = "防御者墨尔顿指派你去消灭乌特加德城堡的劫掠者因格瓦尔。将因格瓦尔的徽记交给凯勒中将。"
Inst70Quest1_Location = "防御者墨尔顿(嚎风峡湾 - 龙颅村; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest1_Note = "劫掠者因格瓦尔在 "..YELLOW.."[3]"..WHITE.."。\n\n前置任务是可选的。 任务交给凯勒中将 (嚎风峡湾 - 瓦加德; "..YELLOW.."60.4, 61.0"..WHITE..")。"
Inst70Quest1_Prequest = "跑腿侦查"
Inst70Quest1_Folgequest = "无"
--
Inst70Quest1name1 = "刽子手的指环"
Inst70Quest1name2 = "屠戮之戒"
Inst70Quest1name3 = "迅捷审判徽记"

--Quest 2 Alliance
Inst70Quest2 = "2. 削减军备"
Inst70Quest2_Aim = "防御者墨尔顿要你进入乌特加德城堡，偷取5把维库武器。"
Inst70Quest2_Location = "防御者墨尔顿(嚎风峡湾 - 龙颅村; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest2_Note = "维库武器可以在副本各处的墙壁上找到。前置任务来自斥候瓦罗瑞(嚎风峡湾 - 龙颅村; "..YELLOW.."56.0, 55.8"..WHITE..")且是一个可选任务。"
Inst70Quest2_Prequest = "无"
Inst70Quest2_Folgequest = "无"
--
Inst70Quest2name1 = "宁静思绪符咒"
Inst70Quest2name2 = "锋刃坠饰"
Inst70Quest2name3 = "破碎光明项链"
Inst70Quest2name4 = "钢纹项链"

--Quest 3 Alliance
Inst70Quest3 = "3. 死亡证明：劫掠者因格瓦尔"
Inst70Quest3_Aim = "达拉然的大法师兰达洛克要你将掠夺者的战斧交给他。"
Inst70Quest3_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst70Quest3_Note = "这个日常任务只能在英雄难度下完成。\n\n劫掠者因格瓦尔在 "..YELLOW.."[3]"..WHITE.."。"
Inst70Quest3_Prequest = "无"
Inst70Quest3_Folgequest = "无"
--
Inst70Quest3name1 = "凯旋纹章"


--Quest 1 Horde
Inst70Quest1_HORDE = "1. 旗开得胜"
Inst70Quest1_HORDE_Aim = "高级执行官安希尔姆要求你进入乌特加德城堡，杀死凯雷塞斯王子。"
Inst70Quest1_HORDE_Location = "高级执行官安希尔姆(嚎风峡湾 - 复仇港; "..YELLOW.."78.5, 31.1"..WHITE..")"
Inst70Quest1_HORDE_Note = "凯雷塞斯王子在 "..YELLOW.."[1]"..WHITE.."。\n\n前置任务开始自同一NPC。"
Inst70Quest1_HORDE_Prequest = "地狱般的战争 -> 向安希尔姆复命"
Inst70Quest1_HORDE_Folgequest = "无"
--
Inst70Quest1name1_HORDE = "萨莱因裹腕"
Inst70Quest1name2_HORDE = "仇杀护腕"
Inst70Quest1name3_HORDE = "符文法师护腕"
Inst70Quest1name4_HORDE = "复仇使者臂铠"

--Quest 2 Horde
Inst70Quest2_HORDE = "2. 除掉因格瓦尔！"
Inst70Quest2_HORDE_Aim = "黑暗游侠玛尔拉要求你杀死乌特加德城堡内的劫掠者因格瓦尔，然后把他的徽记交给复仇港的高级执行官安希尔姆。"
Inst70Quest2_HORDE_Location = "黑暗游侠玛尔拉(乌特加德城堡; "..YELLOW.."[A] 入口"..WHITE..")"
Inst70Quest2_HORDE_Note = "黑暗游侠玛尔拉会在你进入副本后的几秒钟内出现在传送门内。\n\n劫掠者因格瓦尔在 "..YELLOW.."[3]"..WHITE.."。\n\n任务交给高级执行官安希尔姆(嚎风峡湾 - 复仇港; "..YELLOW.."78.5, 31.1"..WHITE..")。"
Inst70Quest2_HORDE_Prequest = "无"
Inst70Quest2_HORDE_Folgequest = "无"
--
Inst70Quest2name1_HORDE = "刽子手的指环"
Inst70Quest2name2_HORDE = "屠戮之戒"
Inst70Quest2name3_HORDE = "迅捷审判徽记"

--Quest 3 Horde
Inst70Quest3_HORDE = "3. 削减军备"
Inst70Quest3_HORDE_Aim = "黑暗游侠玛尔拉要你从乌特加德城堡中偷出5把维库武器，并把它们交给复仇港的高级执行官安希尔姆。"
Inst70Quest3_HORDE_Location = "黑暗游侠玛尔拉(乌特加德城堡; "..YELLOW.."[A] Entrance"..WHITE..")"
Inst70Quest3_HORDE_Note = "黑暗游侠玛尔拉会在你进入副本后的几秒钟内出现在传送门内。\n\n维库武器可以在副本各处的墙壁上找到。\n\n任务交给高级执行官安希尔姆(嚎风峡湾 - 复仇港; "..YELLOW.."78.5, 31.1"..WHITE..")。"
Inst70Quest3_HORDE_Prequest = "无"
Inst70Quest3_HORDE_Folgequest = "无"
--
Inst70Quest3name1_HORDE = "平静天空项链"
Inst70Quest3name2_HORDE = "百牙项链"
Inst70Quest3name3_HORDE = "约束能量符咒"
Inst70Quest3name4_HORDE = "页岩坠饰"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst70Quest4_HORDE = Inst70Quest3
Inst70Quest4_HORDE_Aim = Inst70Quest3_Aim
Inst70Quest4_HORDE_Location = Inst70Quest3_Location
Inst70Quest4_HORDE_Note = Inst70Quest3_Note
Inst70Quest4_HORDE_Prequest = Inst70Quest3_Prequest
Inst70Quest4_HORDE_Folgequest = Inst70Quest3_Folgequest
--
Inst70Quest4name1_HORDE = Inst70Quest3name1



--------------- INST71 - Utgarde Keep: Utgarde Pinnacle ---------------

Inst71Story = "Among the cliffs of the Daggercap Bay in the Howling Fjord stands Utgarde Keep, an impervious fortress occupied by the savage and enigmatic vrykul. With mysterious, foul magic and proto-dragons at their command, the vrykul of Utgarde Keep pose an imminent threat to both the Alliance and the Horde. Only the bravest would dare to strike against Ymiron's faithful and delve into the heart of the vrykul's primeval home."
Inst71Caption = "乌特加德之巅"
Inst71QAA = "4个任务"
Inst71QAH = "4个任务"

--Quest 1 Alliance
Inst71Quest1 = "1. 宝箱中的垃圾"
Inst71Quest1_Aim = "乌特加德之巅的布雷格要你帮他收集5块失去光泽的银锭、3枚闪亮的饰物、2只黄金酒杯和1座碧玉雕像。"
Inst71Quest1_Location = "布雷格(乌特加德之巅; "..YELLOW.."[A]"..WHITE..")"
Inst71Quest1_Note = "物品可以在副本的各个地方找到，通常是散落在地上的。这些闪亮的小饰物并不是用作钓鱼诱饵的那种。"
Inst71Quest1_Prequest = "无"
Inst71Quest1_Folgequest = "无"
--
Inst71Quest1name1 = "宝珠镶饰长袍"
Inst71Quest1name2 = "怪异皮甲"
Inst71Quest1name3 = "银板战甲"
Inst71Quest1name4 = "镀金链甲外套"

--Quest 2 Alliance
Inst71Quest2 = "2. 我要复仇！"
Inst71Quest2_Aim = "乌特加德之巅的布雷格要你去杀死伊米隆国王。"
Inst71Quest2_Location = "布雷格(乌特加德之巅; "..YELLOW.."[A]"..WHITE..")"
Inst71Quest2_Note = "伊米隆国王在"..YELLOW.."[4]"..WHITE.."。"
Inst71Quest2_Prequest = "无"
Inst71Quest2_Folgequest = "无"
--
Inst71Quest2name1 = "复仇船长的兜帽"
Inst71Quest2name2 = "反击头盔"
Inst71Quest2name3 = "公正惩戒头盔"
Inst71Quest2name4 = "惩罚面甲"
Inst71Quest2name5 = "愤怒复仇战盔"

--Quest 3 Alliance
Inst71Quest3 = "3. 提迈尔的预言：伊米亚狂战士！"
Inst71Quest3_Aim = "达拉然的大法师提迈尔要你去杀死7个伊米亚狂战士。"
Inst71Quest3_Location = "大法师提迈尔(达拉然 - 紫罗兰监狱; "..YELLOW.."64.2, 54.7"..WHITE..")"
Inst71Quest3_Note = "这是个日常任务。"
Inst71Quest3_Prequest = "无"
Inst71Quest3_Folgequest = "无"
--
Inst71Quest3name1 = "肯瑞托奖章"
Inst71Quest3name2 = "银色北伐军奖章"
Inst71Quest3name3 = "黑锋骑士团奖章"
Inst71Quest3name4 = "龙眠联军奖章"
Inst71Quest3name5 = "霍迪尔之子奖章"
Inst71Quest3name6 = "征服纹章"

--Quest 4 Alliance
Inst71Quest4 = "4. 死亡证明：伊米隆国王"
Inst71Quest4_Aim = "达拉然的大法师兰达洛克要你将已故女王的饰物交给他。"
Inst71Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst71Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n伊米隆国王在 "..YELLOW.."[4]"..WHITE.."。"
Inst71Quest4_Prequest = "无"
Inst71Quest4_Folgequest = "无"
--
Inst71Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst71Quest1_HORDE = Inst71Quest1
Inst71Quest1_HORDE_Aim = Inst71Quest1_Aim
Inst71Quest1_HORDE_Location = Inst71Quest1_Location
Inst71Quest1_HORDE_Note = Inst71Quest1_Note
Inst71Quest1_HORDE_Prequest = Inst71Quest1_Prequest
Inst71Quest1_HORDE_Folgequest = Inst71Quest1_Folgequest
--
Inst71Quest1name1_HORDE = Inst71Quest1name1
Inst71Quest1name2_HORDE = Inst71Quest1name2
Inst71Quest1name3_HORDE = Inst71Quest1name3
Inst71Quest1name4_HORDE = Inst71Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst71Quest2_HORDE = Inst71Quest2
Inst71Quest2_HORDE_Aim = Inst71Quest2_Aim
Inst71Quest2_HORDE_Location = Inst71Quest2_Location
Inst71Quest2_HORDE_Note = Inst71Quest2_Note
Inst71Quest2_HORDE_Prequest = Inst71Quest2_Prequest
Inst71Quest2_HORDE_Folgequest = Inst71Quest2_Folgequest
--
Inst71Quest2name1_HORDE = Inst71Quest2name1
Inst71Quest2name2_HORDE = Inst71Quest2name2
Inst71Quest2name3_HORDE = Inst71Quest2name3
Inst71Quest2name4_HORDE = Inst71Quest2name4
Inst71Quest2name5_HORDE = Inst71Quest2name5

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst71Quest3_HORDE = Inst71Quest3
Inst71Quest3_HORDE_Aim = Inst71Quest3_Aim
Inst71Quest3_HORDE_Location = Inst71Quest3_Location
Inst71Quest3_HORDE_Note = Inst71Quest3_Note
Inst71Quest3_HORDE_Prequest = Inst71Quest3_Prequest
Inst71Quest3_HORDE_Folgequest = Inst71Quest3_Folgequest
--
Inst71Quest3name1_HORDE = Inst71Quest3name1
Inst71Quest3name2_HORDE = Inst71Quest3name2
Inst71Quest3name3_HORDE = Inst71Quest3name3
Inst71Quest3name4_HORDE = Inst71Quest3name4
Inst71Quest3name5_HORDE = Inst71Quest3name5
Inst71Quest3name6_HORDE = Inst71Quest3name6

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst71Quest4_HORDE = Inst71Quest4
Inst71Quest4_HORDE_Aim = Inst71Quest4_Aim
Inst71Quest4_HORDE_Location = Inst71Quest4_Location
Inst71Quest4_HORDE_Note = Inst71Quest4_Note
Inst71Quest4_HORDE_Prequest = Inst71Quest4_Prequest
Inst71Quest4_HORDE_Folgequest = Inst71Quest4_Folgequest
--
Inst71Quest4name1_HORDE = Inst71Quest4name1



--------------- INST72 - The Nexus: The Nexus ---------------

Inst72Story = "The blue Dragon Aspect, Malygos, has created rifts with his manipulation of raw magical power: tears in the very fabric of the magical dimension. The Kirin Tor, the elite magi of Dalaran, have formed a council with the red dragonflight, who are charged with the preservation of life. To this end, the two groups have begun actively subverting Malygos's devastating campaign. The sides have been chosen; the battle lines have been drawn. The only question that remains now is...Who will win."
Inst72Caption = "魔枢"
Inst72QAA = "5个任务"
Inst72QAH = "5个任务"

--Quest 1 Alliance
Inst72Quest1 = "1. 他们丝毫不感到羞愧吗？"
Inst72Quest1_Aim = "图书馆员塞尔拉希望你进入魔枢，找回伯林纳德的研究笔记。"
Inst72Quest1_Location = "图书馆员塞尔拉(北风苔原 - 永生之盾; "..YELLOW.."33.4, 34.3"..WHITE..")"
Inst72Quest1_Note = "研究笔记在 "..YELLOW.."[4]"..WHITE.."的大厅地上，那里的NPC都被冻住了。"
Inst72Quest1_Prequest = "无"
Inst72Quest1_Folgequest = "无"
--
Inst72Quest1name1 = "北地光芒护肩"
Inst72Quest1name2 = "熟化猛犸皮衬肩"
Inst72Quest1name3 = "苔原追踪者护肩"
Inst72Quest1name4 = "苔原肩铠"

--Quest 2 Alliance
Inst72Quest2 = "2. 延缓灾难"
Inst72Quest2_Aim = "永生之盾的大法师伯林纳德要你在魔枢的裂隙附近使用交叉空间重塑器。"
Inst72Quest2_Location = "大法师伯林纳德(北风苔原 - 永生之盾; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest2_Note = "在阿诺玛鲁斯 "..YELLOW.."[3]"..WHITE.."所在的平台边缘使用交叉空间重塑器。"
Inst72Quest2_Prequest = "监测数据"
Inst72Quest2_Folgequest = "无"
--
Inst72Quest2name1 = "时间扭曲裹手"
Inst72Quest2name2 = "时间停止手套"
Inst72Quest2name3 = "阴谋护腕"
Inst72Quest2name4 = "困惑巨人护手"

--Quest 3 Alliance
Inst72Quest3 = "3. 战争的囚徒"
Inst72Quest3_Aim = "永生之盾的莱洛拉斯要你进入魔枢并释放克莉斯塔萨。"
Inst72Quest3_Location = "莱洛拉斯(北风苔原 - 永生之盾; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst72Quest3_Note = "克莉斯塔萨在 "..YELLOW.."[5]"..WHITE.."。"
Inst72Quest3_Prequest = "克莉斯塔萨 -> 触动陷阱"
Inst72Quest3_Folgequest = "无"
--
Inst72Quest3name1 = "碧蓝光芒披风"
Inst72Quest3name2 = "克莉斯塔萨衬肩"
Inst72Quest3name3 = "流畅攻击披风"

--Quest 4 Alliance
Inst72Quest4 = "4. 苏醒"
Inst72Quest4_Aim = "永生之盾的大法师伯林纳德要你进入魔枢，并从晶化保卫者身上收集5块奥术古树碎片。"
Inst72Quest4_Location = "大法师伯林纳德(北风苔原 - 永生之盾; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest4_Note = "晶化保卫者会掉落奥术古树碎片。你可以在前往塑树者奥莫洛克的路上找到它们。"
Inst72Quest4_Prequest = "古树的秘密"
Inst72Quest4_Folgequest = "无"
--
Inst72Quest4name1 = "秘法进化便鞋"
Inst72Quest4name2 = "破碎未来之靴"
Inst72Quest4name3 = "变异刺靴"
Inst72Quest4name4 = "充沛之靴"
Inst72Quest4name5 = "不屈保卫者之靴"

--Quest 5 Alliance
Inst72Quest5 = "5. 死亡证明：克莉斯塔萨"
Inst72Quest5_Aim = "达拉然的大法师兰达洛克要你将克莉斯塔萨的破碎之心交给他。"
Inst72Quest5_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst72Quest5_Note = "这个日常任务只能在英雄难度下完成。\n\n克莉斯塔萨在 "..YELLOW.."[5]"..WHITE.."."
Inst72Quest5_Prequest = "无"
Inst72Quest5_Folgequest = "无"
--
Inst72Quest5name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst72Quest1_HORDE = Inst72Quest1
Inst72Quest1_HORDE_Aim = Inst72Quest1_Aim
Inst72Quest1_HORDE_Location = Inst72Quest1_Location
Inst72Quest1_HORDE_Note = Inst72Quest1_Note
Inst72Quest1_HORDE_Prequest = Inst72Quest1_Prequest
Inst72Quest1_HORDE_Folgequest = Inst72Quest1_Folgequest
--
Inst72Quest1name1_HORDE = Inst72Quest1name1
Inst72Quest1name2_HORDE = Inst72Quest1name2
Inst72Quest1name3_HORDE = Inst72Quest1name3
Inst72Quest1name4_HORDE = Inst72Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst72Quest2_HORDE = Inst72Quest2
Inst72Quest2_HORDE_Aim = Inst72Quest2_Aim
Inst72Quest2_HORDE_Location = Inst72Quest2_Location
Inst72Quest2_HORDE_Note = Inst72Quest2_Note
Inst72Quest2_HORDE_Prequest = Inst72Quest2_Prequest
Inst72Quest2_HORDE_Folgequest = Inst72Quest2_Folgequest
--
Inst72Quest2name1_HORDE = Inst72Quest2name1
Inst72Quest2name2_HORDE = Inst72Quest2name2
Inst72Quest2name3_HORDE = Inst72Quest2name3
Inst72Quest2name4_HORDE = Inst72Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst72Quest3_HORDE = Inst72Quest3
Inst72Quest3_HORDE_Aim = Inst72Quest3_Aim
Inst72Quest3_HORDE_Location = Inst72Quest3_Location
Inst72Quest3_HORDE_Note = Inst72Quest3_Note
Inst72Quest3_HORDE_Prequest = Inst72Quest3_Prequest
Inst72Quest3_HORDE_Folgequest = Inst72Quest3_Folgequest
--
Inst72Quest3name1_HORDE = Inst72Quest3name1
Inst72Quest3name2_HORDE = Inst72Quest3name2
Inst72Quest3name3_HORDE = Inst72Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst72Quest4_HORDE = Inst72Quest4
Inst72Quest4_HORDE_Aim = Inst72Quest4_Aim
Inst72Quest4_HORDE_Location = Inst72Quest4_Location
Inst72Quest4_HORDE_Note = Inst72Quest4_Note
Inst72Quest4_HORDE_Prequest = Inst72Quest4_Prequest
Inst72Quest4_HORDE_Folgequest = Inst72Quest4_Folgequest
--
Inst72Quest4name1_HORDE = Inst72Quest4name1
Inst72Quest4name2_HORDE = Inst72Quest4name2
Inst72Quest4name3_HORDE = Inst72Quest4name3
Inst72Quest4name4_HORDE = Inst72Quest4name4
Inst72Quest4name5_HORDE = Inst72Quest4name5

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst72Quest5_HORDE = Inst72Quest5
Inst72Quest5_HORDE_Aim = Inst72Quest5_Aim
Inst72Quest5_HORDE_Location = Inst72Quest5_Location
Inst72Quest5_HORDE_Note = Inst72Quest5_Note
Inst72Quest5_HORDE_Prequest = Inst72Quest5_Prequest
Inst72Quest5_HORDE_Folgequest = Inst72Quest5_Folgequest
--
Inst72Quest5name1_HORDE = Inst72Quest5name1



--------------- INST73 - The Nexus: The Oculus ---------------

Inst73Story = "The blue Dragon Aspect, Malygos, has created rifts with his manipulation of raw magical power: tears in the very fabric of the magical dimension. The Kirin Tor, the elite magi of Dalaran, have formed a council with the red dragonflight, who are charged with the preservation of life. To this end, the two groups have begun actively subverting Malygos's devastating campaign. The sides have been chosen; the battle lines have been drawn. The only question that remains now is...Who will win."
Inst73Caption = "魔环"
Inst73QAA = "6个任务"
Inst73QAH = "6个任务"

--Quest 1 Alliance
Inst73Quest1 = "1. 战斗仍在继续"
Inst73Quest1_Aim = "莱洛拉斯希望你进入魔环，营救贝加里斯塔兹与他的同伴。"
Inst73Quest1_Location = "莱洛拉斯(北风苔原 - 永生之盾; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst73Quest1_Note = "在你击败位于 "..YELLOW.."[1]"..WHITE.."的审讯者达库斯后，贝加里斯塔兹将从他的笼子里被释放出来。"
Inst73Quest1_Prequest = "无"
Inst73Quest1_Folgequest = "协同作战"
--
Inst73Quest1name1 = "蛮勇之戒"
Inst73Quest1name2 = "繁荣指环"
Inst73Quest1name3 = "动力指环"
Inst73Quest1name4 = "忠诚徽记之戒"

--Quest 2 Alliance
Inst73Quest2 = "2. 协同作战"
Inst73Quest2_Aim = "贝加里斯塔兹要求你摧毁10台离心构造体，以此关闭瓦尔洛斯的护盾。然后击败瓦尔洛斯·云击。"
Inst73Quest2_Location = "贝加里斯塔兹(魔枢: 魔环; "..YELLOW.."[1]"..WHITE..")"
Inst73Quest2_Note = "在你击败位于 "..YELLOW.."[2]"..WHITE.."的瓦尔洛斯·云击后，贝加里斯塔兹将会出现。"
Inst73Quest2_Prequest = "战斗仍在继续"
Inst73Quest2_Folgequest = "法师领主伊洛姆"
-- No Rewards for this quest

--Quest 3 Alliance
Inst73Quest3 = "3. 法师领主伊洛姆"
Inst73Quest3_Aim = "贝加里斯塔兹要求你击败魔环的法师领主伊洛姆。"
Inst73Quest3_Location = "贝加里斯塔兹的影像(魔枢: 魔环; "..YELLOW.."[2]"..WHITE..")"
Inst73Quest3_Note = "在你击败位于 "..YELLOW.."[3]"..WHITE.."的法师领主伊洛姆后，贝加里斯塔兹将会出现。"
Inst73Quest3_Prequest = "协同作战"
Inst73Quest3_Folgequest = "龙翼之力"
-- No Rewards for this quest

--Quest 4 Alliance
Inst73Quest4 = "4. 龙翼之力"
Inst73Quest4_Aim = "贝加里斯塔兹要求你击败魔环的埃雷苟斯，然后回到考达拉的永生之盾，向莱洛拉斯复命。"
Inst73Quest4_Location = "贝加里斯塔兹的影像(魔枢: 魔环; "..YELLOW.."[3]"..WHITE..")"
Inst73Quest4_Note = "魔网守护者埃雷苟斯在 "..YELLOW.."[4]"..WHITE.."。莱洛拉斯在(北风苔原 - 永生之盾; "..YELLOW.."33.2, 34.4"..WHITE..")。"
Inst73Quest4_Prequest = "法师领主伊洛姆"
Inst73Quest4_Folgequest = "无"
--
Inst73Quest4name1 = "感恩裹腕"
Inst73Quest4name2 = "翱翔裹腕"
Inst73Quest4name3 = "莱洛拉斯的护腕"
Inst73Quest4name4 = "威严护腕"

--Quest 5 Alliance
Inst73Quest5 = "5. 提迈尔的预言：离心构造体！"
Inst73Quest5_Aim = "根据达拉然的大法师提迈尔的预言，你必须去消灭10台离心构造体。"
Inst73Quest5_Location = "大法师提迈尔(达拉然 - 紫罗兰监狱; "..YELLOW.."64.2, 54.7"..WHITE..")"
Inst73Quest5_Note = "这是一个日常任务。你可以在第一个和第二个首领之间的六个不同的组中找到离心构造体，在 "..YELLOW.."1'"..WHITE.."。"
Inst73Quest5_Prequest = "无"
Inst73Quest5_Folgequest = "无"
--
Inst73Quest5name1 = "肯瑞托奖章"
Inst73Quest5name2 = "银色北伐军奖章"
Inst73Quest5name3 = "黑锋骑士团奖章"
Inst73Quest5name4 = "龙眠联军奖章"
Inst73Quest5name5 = "霍迪尔之子奖章"
Inst73Quest5name6 = "征服纹章"

--Quest 6 Alliance
Inst73Quest6 = "6. 死亡证明：魔网守护者埃雷苟斯"
Inst73Quest6_Aim = "达拉然的大法师兰达洛克要你将魔网调谐器交给他。"
Inst73Quest6_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst73Quest6_Note = "这个日常任务只能在英雄难度下完成。\n\n魔网调谐器来自于埃雷苟斯的宝箱在 "..YELLOW.."[5]"..WHITE.."。"
Inst73Quest6_Prequest = "无"
Inst73Quest6_Folgequest = "无"
--
Inst73Quest6name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst73Quest1_HORDE = Inst73Quest1
Inst73Quest1_HORDE_Aim = Inst73Quest1_Aim
Inst73Quest1_HORDE_Location = Inst73Quest1_Location
Inst73Quest1_HORDE_Note = Inst73Quest1_Note
Inst73Quest1_HORDE_Prequest = Inst73Quest1_Prequest
Inst73Quest1_HORDE_Folgequest = Inst73Quest1_Folgequest
--
Inst73Quest1name1_HORDE = Inst73Quest1name1
Inst73Quest1name2_HORDE = Inst73Quest1name2
Inst73Quest1name3_HORDE = Inst73Quest1name3
Inst73Quest1name4_HORDE = Inst73Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst73Quest2_HORDE = Inst73Quest2
Inst73Quest2_HORDE_Aim = Inst73Quest2_Aim
Inst73Quest2_HORDE_Location = Inst73Quest2_Location
Inst73Quest2_HORDE_Note = Inst73Quest2_Note
Inst73Quest2_HORDE_Prequest = Inst73Quest2_Prequest
Inst73Quest2_HORDE_Folgequest = Inst73Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst73Quest3_HORDE = Inst73Quest3
Inst73Quest3_HORDE_Aim = Inst73Quest3_Aim
Inst73Quest3_HORDE_Location = Inst73Quest3_Location
Inst73Quest3_HORDE_Note = Inst73Quest3_Note
Inst73Quest3_HORDE_Prequest = Inst73Quest3_Prequest
Inst73Quest3_HORDE_Folgequest = Inst73Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst73Quest4_HORDE = Inst73Quest4
Inst73Quest4_HORDE_Aim = Inst73Quest4_Aim
Inst73Quest4_HORDE_Location = Inst73Quest4_Location
Inst73Quest4_HORDE_Note = Inst73Quest4_Note
Inst73Quest4_HORDE_Prequest = Inst73Quest4_Prequest
Inst73Quest4_HORDE_Folgequest = Inst73Quest4_Folgequest
--
Inst73Quest4name1_HORDE = Inst73Quest4name1
Inst73Quest4name2_HORDE = Inst73Quest4name2
Inst73Quest4name3_HORDE = Inst73Quest4name3
Inst73Quest4name4_HORDE = Inst73Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst73Quest5_HORDE = Inst73Quest5
Inst73Quest5_HORDE_Aim = Inst73Quest5_Aim
Inst73Quest5_HORDE_Location = Inst73Quest5_Location
Inst73Quest5_HORDE_Note = Inst73Quest5_Note
Inst73Quest5_HORDE_Prequest = Inst73Quest5_Prequest
Inst73Quest5_HORDE_Folgequest = Inst73Quest5_Folgequest
--
Inst73Quest5name1_HORDE = Inst73Quest5name1
Inst73Quest5name2_HORDE = Inst73Quest5name2
Inst73Quest5name3_HORDE = Inst73Quest5name3
Inst73Quest5name4_HORDE = Inst73Quest5name4
Inst73Quest5name5_HORDE = Inst73Quest5name5
Inst73Quest5name6_HORDE = Inst73Quest5name6

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst73Quest6_HORDE = Inst73Quest6
Inst73Quest6_HORDE_Aim = Inst73Quest6_Aim
Inst73Quest6_HORDE_Location = Inst73Quest6_Location
Inst73Quest6_HORDE_Note = Inst73Quest6_Note
Inst73Quest6_HORDE_Prequest = Inst73Quest6_Prequest
Inst73Quest6_HORDE_Folgequest = Inst73Quest6_Folgequest
--
Inst73Quest6name1_HORDE = Inst73Quest6name1



--------------- INST74 - The Nexus: The Eye of Eternity ---------------

Inst74Story = "From within the safety of his personal domain, the Eye of Eternity, Malygos coordinates a crusade to reestablish his dominance over the arcane energies coursing through Azeroth. In his eyes, the foolish actions of the Kirin Tor and other mortal magi have plunged the world into chaos, and the abuse of their powers will no longer be tolerated. Threatened by the Spell-Weaver's brutal tactics, the Kirin Tor has allied itself with the red dragonflight. Together, the two groups closely observe Malygos, searching for a way to thwart his campaign and strike out at the Aspect of Magic, but thus far the elusive Spell-Weaver has proven difficult to engage.\n\nAt Wyrmrest Temple, the ancient meeting ground of the dragonflights, Alexstrasza and the ambassadors of other flights have discussed Malygos' recklessness and reluctantly concluded that he is beyond the point of salvation. With the red dragons' assistance, Azeroth's heroes may be able to accomplish what has formerly been unthinkable: challenging the Spell-Weaver from inside the Eye of Eternity. Sustaining the safety of Azeroth depends on Malygos' defeat, but his end will also herald a new age: a world of unguarded magic, absent of the Dragon Aspect powerful enough to watch over it."
Inst74Caption = "永恒之眼"
Inst74QAA = "3个任务"
Inst74QAH = "3个任务"

--Quest 1 Alliance
Inst74Quest1 = "1. 永恒之眼的审判"
Inst74Quest1_Aim = "龙骨荒野龙眠神殿的克拉苏斯要你取回魔法之心。"
Inst74Quest1_Location = "克拉苏斯(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest1_Note = "在玛里苟斯死后，他的魔法之心可以在阿莱克丝塔萨的礼物附近的一个红色的心脏中找到。"
Inst74Quest1_Prequest = "聚焦之虹的钥匙("..YELLOW.."Naxxramas"..WHITE..")"
Inst74Quest1_Folgequest = "无"
--
Inst74Quest1name1 = "上古巨龙锁链"
Inst74Quest1name2 = "红龙军团颈链"
Inst74Quest1name3 = "龙人坠饰"
Inst74Quest1name4 = "龙鳞项圈"

--Quest 2 Alliance
Inst74Quest2 = "2. 英雄永恒之眼的审判"
Inst74Quest2_Aim = "龙骨荒野龙眠神殿的克拉苏斯要你取回魔法之心。"
Inst74Quest2_Location = "克拉苏斯(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest2_Note = "在玛里苟斯死后，他的魔法之心可以在阿莱克丝塔萨的礼物附近的一个红色的心脏中找到。"
Inst74Quest2_Prequest = "英雄聚焦之虹的钥匙("..YELLOW.."Naxxramas"..WHITE..")"
Inst74Quest2_Folgequest = "无"
--
Inst74Quest2name1 = "龙眠强能项链"
Inst74Quest2name2 = "生命誓缚者颈饰"
Inst74Quest2name3 = "巨龙女王的恩赐"
Inst74Quest2name4 = "魔枢战争勇士珠串"

--Quest 3 Alliance
Inst74Quest3 = "3. 消灭玛里苟斯(每周)"
Inst74Quest3_Aim = "消灭玛里苟斯。"
Inst74Quest3_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst74Quest3_Note = "玛里苟斯在 "..YELLOW.." [1]"..WHITE..".\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst74Quest3_Prequest = "无"
Inst74Quest3_Folgequest = "无"
--
Inst74Quest3name1 = "寒冰纹章"
Inst74Quest3name2 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst74Quest1_HORDE = Inst74Quest1
Inst74Quest1_HORDE_Aim = Inst74Quest1_Aim
Inst74Quest1_HORDE_Location = Inst74Quest1_Location
Inst74Quest1_HORDE_Note = Inst74Quest1_Note
Inst74Quest1_HORDE_Prequest = Inst74Quest1_Prequest
Inst74Quest1_HORDE_Folgequest = Inst74Quest1_Folgequest
--
Inst74Quest1name1_HORDE = Inst74Quest1name1
Inst74Quest1name2_HORDE = Inst74Quest1name2
Inst74Quest1name3_HORDE = Inst74Quest1name3
Inst74Quest1name4_HORDE = Inst74Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst74Quest2_HORDE = Inst74Quest2
Inst74Quest2_HORDE_Aim = Inst74Quest2_Aim
Inst74Quest2_HORDE_Location = Inst74Quest2_Location
Inst74Quest2_HORDE_Note = Inst74Quest2_Note
Inst74Quest2_HORDE_Prequest = Inst74Quest2_Prequest
Inst74Quest2_HORDE_Folgequest = Inst74Quest2_Folgequest
--
Inst74Quest2name1_HORDE = Inst74Quest2name1
Inst74Quest2name2_HORDE = Inst74Quest2name2
Inst74Quest2name3_HORDE = Inst74Quest2name3
Inst74Quest2name4_HORDE = Inst74Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst74Quest3_HORDE = Inst74Quest3
Inst74Quest3_HORDE_Aim = Inst74Quest3_Aim
Inst74Quest3_HORDE_Location = Inst74Quest3_Location
Inst74Quest3_HORDE_Note = Inst74Quest3_Note
Inst74Quest3_HORDE_Prequest = Inst74Quest3_Prequest
Inst74Quest3_HORDE_Folgequest = Inst74Quest3_Folgequest
--
Inst74Quest3name1_HORDE = Inst74Quest3name1
Inst74Quest3name2_HORDE = Inst74Quest3name2



--------------- INST75 - Azjol-Nerub ---------------

Inst75Story = "Azjol-Nerub is a vast underground dungeon hub home to the arachnid-like nerubian. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. Many of deepest areas in Azjol-Nerub are held by faceless ones.\n\nAzjol-Nerub: The Upper Kingdom is a mystery waiting to be explored. It once held a powerful and advanced civilization, and many of its treasures still rest here undamaged. Great riches litter the lower halls, not only gems and magic items but art and literature and scholarly tomes. The Scourge infest this place. Forgotten ones seethe below, eager to return to the world above.\n\n"..GREEN.."Quoted from WoWWiki"
Inst75Caption = "艾卓-尼鲁布"
Inst75QAA = "3个任务"
Inst75QAH = "3个任务"

--Quest 1 Alliance
Inst75Quest1 = "1. 别忘了蛛卵！"
Inst75Quest1_Aim = "纳尔苏深渊的拆解者基里克斯希望你前往艾卓-尼鲁布，摧毁6枚天灾蛛魔之卵。"
Inst75Quest1_Location = "拆解者基里克斯(龙骨荒野 - 艾卓-尼鲁布; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest1_Note = "天灾蛛魔之卵位于第一个首领，看门者克里克希尔的房间内，在 "..YELLOW.."[1]"..WHITE.."。"
Inst75Quest1_Prequest = "无"
Inst75Quest1_Folgequest = "无"
--
Inst75Quest1name1 = "驱逐护手"
Inst75Quest1name2 = "净化手甲"
Inst75Quest1name3 = "镇压灾祸护手"
Inst75Quest1name4 = "痛苦消除手套"

--Quest 2 Alliance
Inst75Quest2 = "2. 叛徒国王之死"
Inst75Quest2_Aim = "纳尔苏深渊的拆解者基里克斯要你去击败艾卓-尼鲁布的阿努巴拉克，并将阿努巴拉克的破损甲壳交给基里克斯。"
Inst75Quest2_Location = "拆解者基里克斯(龙骨荒野 - 艾卓-尼鲁布; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest2_Note = "阿努巴拉克在 "..YELLOW.."[3]"..WHITE.."。"
Inst75Quest2_Prequest = "无"
Inst75Quest2_Folgequest = "无"
--
Inst75Quest2name1 = "基里克斯的丝绸便鞋"
Inst75Quest2name2 = "索托的靴子"
Inst75Quest2name3 = "甲壳碎片战靴"
Inst75Quest2name4 = "叛徒胫甲"

--Quest 3 Alliance
Inst75Quest3 = "3. 死亡证明：阿努巴拉克"
Inst75Quest3_Aim = "达拉然的大法师兰达洛克要你将阿努巴拉克的王冠交给他。"
Inst75Quest3_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst75Quest3_Note = "这个日常任务只能在英雄难度下完成。\n\n阿努巴拉克在 "..YELLOW.."[3]"..WHITE.."。"
Inst75Quest3_Prequest = "无"
Inst75Quest3_Folgequest = "无"
--
Inst75Quest3name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst75Quest1_HORDE = Inst75Quest1
Inst75Quest1_HORDE_Aim = Inst75Quest1_Aim
Inst75Quest1_HORDE_Location = Inst75Quest1_Location
Inst75Quest1_HORDE_Note = Inst75Quest1_Note
Inst75Quest1_HORDE_Prequest = Inst75Quest1_Prequest
Inst75Quest1_HORDE_Folgequest = Inst75Quest1_Folgequest
--
Inst75Quest1name1_HORDE = Inst75Quest1name1
Inst75Quest1name2_HORDE = Inst75Quest1name2
Inst75Quest1name3_HORDE = Inst75Quest1name3
Inst75Quest1name4_HORDE = Inst75Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst75Quest2_HORDE = Inst75Quest2
Inst75Quest2_HORDE_Aim = Inst75Quest2_Aim
Inst75Quest2_HORDE_Location = Inst75Quest2_Location
Inst75Quest2_HORDE_Note = Inst75Quest2_Note
Inst75Quest2_HORDE_Prequest = Inst75Quest2_Prequest
Inst75Quest2_HORDE_Folgequest = Inst75Quest2_Folgequest
--
Inst75Quest2name1_HORDE = Inst75Quest2name1
Inst75Quest2name2_HORDE = Inst75Quest2name2
Inst75Quest2name3_HORDE = Inst75Quest2name3
Inst75Quest2name4_HORDE = Inst75Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst75Quest3_HORDE = Inst75Quest3
Inst75Quest3_HORDE_Aim = Inst75Quest3_Aim
Inst75Quest3_HORDE_Location = Inst75Quest3_Location
Inst75Quest3_HORDE_Note = Inst75Quest3_Note
Inst75Quest3_HORDE_Prequest = Inst75Quest3_Prequest
Inst75Quest3_HORDE_Folgequest = Inst75Quest3_Folgequest
--
Inst75Quest3name1_HORDE = Inst75Quest3name1



--------------- INST76 - Ahn'kahet: The Old Kingdom ---------------

Inst76Story = "Azjol-Nerub is a vast underground dungeon hub home to the arachnid-like nerubian. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. Many of deepest areas in Azjol-Nerub are held by faceless ones.\n\nAhn'kahet: The Old Kingdom is the second dungeon located within Azjol-Nerub and is controlled by nerubians.\n\n"..GREEN.."Quoted from WoWWiki"
Inst76Caption = "安卡赫特：古代王国"
Inst76QAA = "4个任务"
Inst76QAH = "4个任务"

--Quest 1 Alliance
Inst76Quest1 = "1. 黄金时代"
Inst76Quest1_Aim = "纳尔苏深渊的拆解者基里克斯希望你弄到一具安卡哈看守者的尸体，将其放在安卡赫特的安卡赫特火盆上焚烧。"
Inst76Quest1_Location = "拆解者基里克斯(龙骨荒野 - 艾卓-尼鲁布; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest1_Note = "这个日常任务只能在英雄难度下完成。\n\n安卡赫特火盆位于传令官沃拉兹的背后 "..YELLOW.."[6]"..WHITE.."。 这具尸体有一个1小时的持续时间计时器，如果你在活着的状态下离开副本，它将会消失。"
Inst76Quest1_Prequest = "无"
Inst76Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst76Quest2 = "2. 奇怪的蘑菇"
Inst76Quest2_Aim = "从安卡赫特的野蛮洞穴兽那里收集6只奇异的蘑菇，然后把它们交给纳尔苏深渊的拆解者基里克斯。"
Inst76Quest2_Location = "拆解者基里克斯(龙骨荒野 - 艾卓-尼鲁布; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest2_Note = "掉落任务所需物品的野蛮洞穴兽位于英雄模式才有的首领阿玛尼塔尔所在的区域，位置为 "..YELLOW.."[3]"..WHITE.."。"
Inst76Quest2_Prequest = "无"
Inst76Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst76Quest3 = "3. 无面者"
Inst76Quest3_Aim = "纳尔苏深渊的拆解者基里克斯要你去杀死安卡赫特的传令官沃拉兹和他身边的3个被遗忘的无面者。"
Inst76Quest3_Location = "拆解者基里克斯(龙骨荒野 - 艾卓-尼鲁布; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest3_Note = "被遗忘的无面者和传令官沃拉兹可以在 "..YELLOW.."[5]"..WHITE.."找到。"
Inst76Quest3_Prequest = "无"
Inst76Quest3_Folgequest = "无"
--
Inst76Quest3name1 = "邪恶挫败衬肩"
Inst76Quest3name2 = "憎恨肩垫"
Inst76Quest3name3 = "废除肩铠"
Inst76Quest3name4 = "无面者肩饰"

--Quest 4 Alliance
Inst76Quest4 = "4. 死亡证明：传令官沃拉兹"
Inst76Quest4_Aim = "达拉然的大法师兰达洛克要你将无面者的萎缩大脑交给他。"
Inst76Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst76Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n传令官沃拉兹在 "..YELLOW.."[5]"..WHITE.."."
Inst76Quest4_Prequest = "无"
Inst76Quest4_Folgequest = "无"
--
Inst76Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst76Quest1_HORDE = Inst76Quest1
Inst76Quest1_HORDE_Aim = Inst76Quest1_Aim
Inst76Quest1_HORDE_Location = Inst76Quest1_Location
Inst76Quest1_HORDE_Note = Inst76Quest1_Note
Inst76Quest1_HORDE_Prequest = Inst76Quest1_Prequest
Inst76Quest1_HORDE_Folgequest = Inst76Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst76Quest2_HORDE = Inst76Quest2
Inst76Quest2_HORDE_Aim = Inst76Quest2_Aim
Inst76Quest2_HORDE_Location = Inst76Quest2_Location
Inst76Quest2_HORDE_Note = Inst76Quest2_Note
Inst76Quest2_HORDE_Prequest = Inst76Quest2_Prequest
Inst76Quest2_HORDE_Folgequest = Inst76Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst76Quest3_HORDE = Inst76Quest3
Inst76Quest3_HORDE_Aim = Inst76Quest3_Aim
Inst76Quest3_HORDE_Location = Inst76Quest3_Location
Inst76Quest3_HORDE_Note = Inst76Quest3_Note
Inst76Quest3_HORDE_Prequest = Inst76Quest3_Prequest
Inst76Quest3_HORDE_Folgequest = Inst76Quest3_Folgequest
--
Inst76Quest3name1_HORDE = Inst76Quest3name1
Inst76Quest3name2_HORDE = Inst76Quest3name2
Inst76Quest3name3_HORDE = Inst76Quest3name3
Inst76Quest3name4_HORDE = Inst76Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst76Quest4_HORDE = Inst76Quest4
Inst76Quest4_HORDE_Aim = Inst76Quest4_Aim
Inst76Quest4_HORDE_Location = Inst76Quest4_Location
Inst76Quest4_HORDE_Note = Inst76Quest4_Note
Inst76Quest4_HORDE_Prequest = Inst76Quest4_Prequest
Inst76Quest4_HORDE_Folgequest = Inst76Quest4_Folgequest
--
Inst76Quest4name1_HORDE = Inst76Quest4name1



--------------- INST77 - Ulduar: Halls of Stone ---------------

Inst77Story = "In the frigid cliffs of the Storm Peaks, legendary explorer Brann Bronzebeard spent countless hours piecing together clues about a recently discovered titan city known as Ulduar. But far from unearthing the mysteries of the titans, the explorer found the city overrun with iron dwarves. Eager to save the priceless information within the titan city before it was destroyed and lost forever, Brann feared that an even greater evil could be at work behind the fall of Ulduar...."
Inst77Caption = "岩石大厅"
Inst77QAA = "2个任务"
Inst77QAH = "2个任务"

--Quest 1 Alliance
Inst77Quest1 = "1. 岩石大厅"
Inst77Quest1_Aim = "布莱恩·铜须希望你能与他结伴而行，揭开岩石大厅的秘密。"
Inst77Quest1_Location = "布莱恩·铜须(奥杜尔: 岩石大厅; "..YELLOW.."[3]"..WHITE..")"
Inst77Quest1_Note = "跟随布莱恩·铜须进入附近的室内，位置为 "..YELLOW.."[4]"..WHITE.."，并在他研究那里的石板时保护他不受一波又一波怪物的攻击。成功后，你可以打开石板旁边的审判官宝箱。\n\n再次与他交谈，他会跑到 "..YELLOW.."[5]"..WHITE.."外的门边。你不需要跟随他，他会在那里等你。击败塑铁者斯约尼尔后，任务可以交给布莱恩·铜须。"
Inst77Quest1_Prequest = "无"
Inst77Quest1_Folgequest = "无"
--
Inst77Quest1name1 = "无畏探索者衬肩"
Inst77Quest1name2 = "冒险者的肩垫"
Inst77Quest1name3 = "失落秘密肩甲"
Inst77Quest1name4 = "侦查肩铠"

--Quest 2 Alliance
Inst77Quest2 = "2. 死亡证明：塑铁者斯约尼尔"
Inst77Quest2_Aim = "达拉然的大法师兰达洛克要你将血肉诅咒圆盘交给他。"
Inst77Quest2_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst77Quest2_Note = "这个日常任务只能在英雄难度下完成。\n\n塑铁者斯约尼尔在 "..YELLOW.."[5]"..WHITE.."。"
Inst77Quest2_Prequest = "无"
Inst77Quest2_Folgequest = "无"
--
Inst77Quest2name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst77Quest1_HORDE = Inst77Quest1
Inst77Quest1_HORDE_Aim = Inst77Quest1_Aim
Inst77Quest1_HORDE_Location = Inst77Quest1_Location
Inst77Quest1_HORDE_Note = Inst77Quest1_Note
Inst77Quest1_HORDE_Prequest = Inst77Quest1_Prequest
Inst77Quest1_HORDE_Folgequest = Inst77Quest1_Folgequest
--
Inst77Quest1name1_HORDE = Inst77Quest1name1
Inst77Quest1name2_HORDE = Inst77Quest1name2
Inst77Quest1name3_HORDE = Inst77Quest1name3
Inst77Quest1name4_HORDE = Inst77Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst77Quest2_HORDE = Inst77Quest2
Inst77Quest2_HORDE_Aim = Inst77Quest2_Aim
Inst77Quest2_HORDE_Location = Inst77Quest2_Location
Inst77Quest2_HORDE_Note = Inst77Quest2_Note
Inst77Quest2_HORDE_Prequest = Inst77Quest2_Prequest
Inst77Quest2_HORDE_Folgequest = Inst77Quest2_Folgequest
--
Inst77Quest2name1_HORDE = Inst77Quest2name1



--------------- INST78 - Ulduar: Halls of Lightning ---------------

Inst78Story = "In the frigid cliffs of the Storm Peaks, legendary explorer Brann Bronzebeard spent countless hours piecing together clues about a recently discovered titan city known as Ulduar. But far from unearthing the mysteries of the titans, the explorer found the city overrun with iron dwarves. Eager to save the priceless information within the titan city before it was destroyed and lost forever, Brann feared that an even greater evil could be at work behind the fall of Ulduar...."
Inst78Caption = "闪电大厅"
Inst78QAA = "4个任务"
Inst78QAH = "4个任务"

--Quest 1 Alliance
Inst78Quest1 = "1. 不惜代价！"
Inst78Quest1_Aim = "丹尼芬雷的约库姆国王要你进入闪电大厅并击败洛肯，然后将洛肯的信物带回去给他。"
Inst78Quest1_Location = "约库姆国王(风暴峭壁 - 丹尼芬雷; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest1_Note = "洛肯在 "..YELLOW.."[4]"..WHITE.."。\n\n这个任务在完成一系列非常长的任务线后才会开放，任务线起始于格莱奇·菲兹巴克(风暴峭壁 - K3; "..YELLOW.."41.1, 86.1"..WHITE..")。"
Inst78Quest1_Prequest = "她们把男人都抓走了！ -> 清算之战"
Inst78Quest1_Folgequest = "无"
Inst78Quest1PreQuest = "true"
--
Inst78Quest1name1 = "闪电之袍"
Inst78Quest1name2 = "硬舌外套"
Inst78Quest1name3 = "闪电使者锁甲"
Inst78Quest1name4 = "碎石胸铠"

--Quest 2 Alliance
Inst78Quest2 = "2. 势不两立"
Inst78Quest2_Aim = "丹尼芬雷的约库姆国王要你进入闪电大厅，击败沃尔坎。"
Inst78Quest2_Location = "约库姆国王(风暴峭壁 - 丹尼芬雷; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest2_Note = "沃尔坎在 "..YELLOW.."[2]"..WHITE.."。\n\n这个任务在完成一系列非常长的任务线后才会开放，任务线起始于格莱奇·菲兹巴克(风暴峭壁 - K3; "..YELLOW.."41.1, 86.1"..WHITE..")。"
Inst78Quest2_Prequest = "她们把男人都抓走了！ -> 清算之战"
Inst78Quest2_Folgequest = "无"
--
Inst78Quest2name1 = "闪电灌注衬肩"
Inst78Quest2name2 = "焦皮护肩"
Inst78Quest2name3 = "雷铸护肩"
Inst78Quest2name4 = "熄灭仇恨肩甲"
Inst78Quest2name5 = "沃尔坎的衬肩"

--Quest 3 Alliance
Inst78Quest3 = "3. 提迈尔的预言：泰坦神铁先锋！"
Inst78Quest3_Aim = "根据达拉然的大法师提迈尔的预言，你必须去杀死7个泰坦神铁先锋。"
Inst78Quest3_Location = "大法师提迈尔(达拉然 - 紫罗兰监狱; "..YELLOW.."64.2, 54.7"..WHITE..")"
Inst78Quest3_Note = "这是一个日常任务。"
Inst78Quest3_Prequest = "无"
Inst78Quest3_Folgequest = "无"
--
Inst78Quest3name1 = "肯瑞托奖章"
Inst78Quest3name2 = "银色北伐军奖章"
Inst78Quest3name3 = "黑锋骑士团奖章"
Inst78Quest3name4 = "龙眠联军奖章"
Inst78Quest3name5 = "霍迪尔之子奖章"
Inst78Quest3name6 = "征服纹章"

--Quest 4 Alliance
Inst78Quest4 = "4. 死亡证明：洛肯"
Inst78Quest4_Aim = "达拉然的大法师兰达洛克要你将天界红宝石戒指交给他。"
Inst78Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst78Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n洛肯在 "..YELLOW.."[4]"..WHITE.."。"
Inst78Quest4_Prequest = "无"
Inst78Quest4_Folgequest = "无"
--
Inst78Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst78Quest1_HORDE = Inst78Quest1
Inst78Quest1_HORDE_Aim = Inst78Quest1_Aim
Inst78Quest1_HORDE_Location = Inst78Quest1_Location
Inst78Quest1_HORDE_Note = Inst78Quest1_Note
Inst78Quest1_HORDE_Prequest = Inst78Quest1_Prequest
Inst78Quest1_HORDE_Folgequest = Inst78Quest1_Folgequest
--
Inst78Quest1name1_HORDE = Inst78Quest1name1
Inst78Quest1name2_HORDE = Inst78Quest1name2
Inst78Quest1name3_HORDE = Inst78Quest1name3
Inst78Quest1name4_HORDE = Inst78Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst78Quest2_HORDE = Inst78Quest2
Inst78Quest2_HORDE_Aim = Inst78Quest2_Aim
Inst78Quest2_HORDE_Location = Inst78Quest2_Location
Inst78Quest2_HORDE_Note = Inst78Quest2_Note
Inst78Quest2_HORDE_Prequest = Inst78Quest2_Prequest
Inst78Quest2_HORDE_Folgequest = Inst78Quest2_Folgequest
--
Inst78Quest2name1_HORDE = Inst78Quest2name1
Inst78Quest2name2_HORDE = Inst78Quest2name2
Inst78Quest2name3_HORDE = Inst78Quest2name3
Inst78Quest2name4_HORDE = Inst78Quest2name4
Inst78Quest2name5_HORDE = Inst78Quest2name5

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst78Quest3_HORDE = Inst78Quest3
Inst78Quest3_HORDE_Aim = Inst78Quest3_Aim
Inst78Quest3_HORDE_Location = Inst78Quest3_Location
Inst78Quest3_HORDE_Note = Inst78Quest3_Note
Inst78Quest3_HORDE_Prequest = Inst78Quest3_Prequest
Inst78Quest3_HORDE_Folgequest = Inst78Quest3_Folgequest
--
Inst78Quest3name1_HORDE = Inst78Quest3name1
Inst78Quest3name2_HORDE = Inst78Quest3name2
Inst78Quest3name3_HORDE = Inst78Quest3name3
Inst78Quest3name4_HORDE = Inst78Quest3name4
Inst78Quest3name5_HORDE = Inst78Quest3name5
Inst78Quest3name6_HORDE = Inst78Quest3name6

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst78Quest4_HORDE = Inst78Quest4
Inst78Quest4_HORDE_Aim = Inst78Quest4_Aim
Inst78Quest4_HORDE_Location = Inst78Quest4_Location
Inst78Quest4_HORDE_Note = Inst78Quest4_Note
Inst78Quest4_HORDE_Prequest = Inst78Quest4_Prequest
Inst78Quest4_HORDE_Folgequest = Inst78Quest4_Folgequest
--
Inst78Quest4name1_HORDE = Inst78Quest4name1



--------------- INST79 - The Obsidian Sanctum ---------------

Inst79Story = "No information."
Inst79Caption = "黑曜石圣殿"
Inst79QAA = "1个任务"
Inst79QAH = "1个任务"

--Quest 1 Alliance
Inst79Quest1 = "1. 消灭萨塔里奥！ (每周)"
Inst79Quest1_Aim = "消灭萨塔里奥。"
Inst79Quest1_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst79Quest1_Note = "萨塔里奥在 "..YELLOW.."[4]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst79Quest1_Prequest = "无"
Inst79Quest1_Folgequest = "无"
--
Inst79Quest1name1 = "寒冰纹章"
Inst79Quest1name2 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst79Quest1_HORDE = Inst79Quest1
Inst79Quest1_HORDE_Aim = Inst79Quest1_Aim
Inst79Quest1_HORDE_Location = Inst79Quest1_Location
Inst79Quest1_HORDE_Note = Inst79Quest1_Note
Inst79Quest1_HORDE_Prequest = Inst79Quest1_Prequest
Inst79Quest1_HORDE_Folgequest = Inst79Quest1_Folgequest
--
Inst79Quest1name1_HORDE = Inst79Quest1name1
Inst79Quest1name2_HORDE = Inst79Quest1name2



--------------- INST80 - Drak'Tharon Keep ---------------

Inst80Story = "Drak'Tharon Keep is located in the icy northlands of Northrend, in the northwestern part of the Grizzly Hills, and is an ancient ice troll stronghold. The Scourge drove the trolls out and took possession, and now the Scourge has a solid garrison there holding the mountain passes. The strange dungeon is filled with dinosaurs and lizards, while teeming with undead. You are sent in to discover the reasoning behind why the trolls are leaving their home of Zul'Drak.\n\n"..GREEN.."Quoted from WoWWiki"
Inst80Caption = "达克萨隆要塞"
Inst80QAA = "4个任务"
Inst80QAH = "4个任务"

--Quest 1 Alliance
Inst80Quest1 = "1. 净化达克萨隆"
Inst80Quest1_Aim = "达库鲁希望你前往达克萨隆，在那里找到他的火盆。使用达库鲁的药剂需要消耗5份耐久魔精。"
Inst80Quest1_Location = "达库鲁的影像(灰熊丘陵 - 达基尔金废墟; "..YELLOW.."71.7, 26.2"..WHITE..")"
Inst80Quest1_Note = "达库鲁的火盆位于先知萨隆亚的背后，位置为 "..YELLOW.."[6]"..WHITE.."。 耐久魔精在达克萨隆要塞内掉落。"
Inst80Quest1_Prequest = "停战？ -> 灰尘之声"
Inst80Quest1_Folgequest = "无"
--
Inst80Quest1name1 = "诱导兜帽"
Inst80Quest1name2 = "引诱战靴"
Inst80Quest1name3 = "黑暗低语者镣铐"
Inst80Quest1name4 = "诱惑者护肩"

--Quest 2 Alliance
Inst80Quest2 = "2. 搜寻和营救"
Inst80Quest2_Aim = "岩石之泉的马克希望你前往达克萨隆，看看库塞尔到底出了什么事。"
Inst80Quest2_Location = "马克·菲尔森(灰熊丘陵 - 岩石之泉; "..YELLOW.."16.6, 48.1"..WHITE..")"
Inst80Quest2_Note = "库塞尔是 "..YELLOW.."[2]"..WHITE.."处被网缠住的受害者之一。攻击被网缠住的受害者直到你找到她。"
Inst80Quest2_Prequest = "净化天灾巨魔"
Inst80Quest2_Folgequest = "欺骗游戏"
--
Inst80Quest2name1 = "库塞尔的焦虑"
Inst80Quest2name2 = "库塞尔的怒火"
Inst80Quest2name3 = "库塞尔的作战指环"

--Quest 3 Alliance
Inst80Quest3 = "3. 欺骗游戏"
Inst80Quest3_Aim = "库塞尔希望你对达克萨隆要塞的召唤者诺沃斯的尸体使用库尔基的布片。然后把沾满腐液的布片交给灰熊丘陵岩石之泉的马克。"
Inst80Quest3_Location = "库塞尔(达克萨隆要塞; "..YELLOW.."[2]"..WHITE..")"
Inst80Quest3_Note = "召唤者诺沃斯在 "..YELLOW.."[3]"..WHITE.."。 马克在(灰熊丘陵 - 岩石之泉; "..YELLOW.."16.6, 48.1"..WHITE..")。"
Inst80Quest3_Prequest = "搜寻和营救"
Inst80Quest3_Folgequest = "无"
--
Inst80Quest3name1 = "耻辱护腕"
Inst80Quest3name2 = "蔑视护腕"
Inst80Quest3name3 = "控告腕甲"
Inst80Quest3name4 = "否定护腕"

--Quest 4 Alliance
Inst80Quest4 = "4. 死亡证明：先知萨隆亚"
Inst80Quest4_Aim = "达拉然的大法师兰达洛克要你将先知的魔化蒂基面具交给他。"
Inst80Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst80Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n先知萨隆亚在 "..YELLOW.."[5]"..WHITE.."。"
Inst80Quest4_Prequest = "无"
Inst80Quest4_Folgequest = "无"
--
Inst80Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst80Quest1_HORDE = Inst80Quest1
Inst80Quest1_HORDE_Aim = Inst80Quest1_Aim
Inst80Quest1_HORDE_Location = Inst80Quest1_Location
Inst80Quest1_HORDE_Note = Inst80Quest1_Note
Inst80Quest1_HORDE_Prequest = Inst80Quest1_Prequest
Inst80Quest1_HORDE_Folgequest = Inst80Quest1_Folgequest
--
Inst80Quest1name1_HORDE = Inst80Quest1name1
Inst80Quest1name2_HORDE = Inst80Quest1name2
Inst80Quest1name3_HORDE = Inst80Quest1name3
Inst80Quest1name4_HORDE = Inst80Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst80Quest2_HORDE = Inst80Quest2
Inst80Quest2_HORDE_Aim = Inst80Quest2_Aim
Inst80Quest2_HORDE_Location = Inst80Quest2_Location
Inst80Quest2_HORDE_Note = Inst80Quest2_Note
Inst80Quest2_HORDE_Prequest = Inst80Quest2_Prequest
Inst80Quest2_HORDE_Folgequest = Inst80Quest2_Folgequest
--
Inst80Quest2name1_HORDE = Inst80Quest2name1
Inst80Quest2name2_HORDE = Inst80Quest2name2
Inst80Quest2name3_HORDE = Inst80Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst80Quest3_HORDE = Inst80Quest3
Inst80Quest3_HORDE_Aim = Inst80Quest3_Aim
Inst80Quest3_HORDE_Location = Inst80Quest3_Location
Inst80Quest3_HORDE_Note = Inst80Quest3_Note
Inst80Quest3_HORDE_Prequest = Inst80Quest3_Prequest
Inst80Quest3_HORDE_Folgequest = Inst80Quest3_Folgequest
--
Inst80Quest3name1_HORDE = Inst80Quest3name1
Inst80Quest3name2_HORDE = Inst80Quest3name2
Inst80Quest3name3_HORDE = Inst80Quest3name3
Inst80Quest3name4_HORDE = Inst80Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst80Quest4_HORDE = Inst80Quest4
Inst80Quest4_HORDE_Aim = Inst80Quest4_Aim
Inst80Quest4_HORDE_Location = Inst80Quest4_Location
Inst80Quest4_HORDE_Note = Inst80Quest4_Note
Inst80Quest4_HORDE_Prequest = Inst80Quest4_Prequest
Inst80Quest4_HORDE_Folgequest = Inst80Quest4_Folgequest
--
Inst80Quest4name1_HORDE = Inst80Quest4name1



--------------- INST81 - Gundrak ---------------

Inst81Story = "Gundrak is the capital of the Ice Trolls. Located in Zul'Drak, the instance contains three entrances which all lead into a main circle. The Drakkari tribe rule Zul'Drak from here, constantly battling the mighty forces of the Scourge. This dungeon shows the Ice Trolls in all their glory, including the opportunity to fight the Ice Troll leader, and teach us why they have been so successful against the Scourge.\n\n"..GREEN.."Quoted from WoWWiki"
Inst81Caption = "古达克"
Inst81QAA = "4个任务"
Inst81QAH = "4个任务"

--Quest 1 Alliance
Inst81Quest1 = "1. 前车之鉴"
Inst81Quest1_Aim = "杜布拉金的记载者拜基妮要你进入古达克，收集6份达卡莱历史石板。"
Inst81Quest1_Location = "记载者拜基妮(祖达克 - 杜布拉金; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest1_Note = "石板散布在副本的各个地方。有足够的数量供一个完整的队伍完成任务。前置任务是可选的。"
Inst81Quest1_Prequest = "核实情况"
Inst81Quest1_Folgequest = "None"
--
Inst81Quest1name1 = "狮头戒指"
Inst81Quest1name2 = "邪恶魔精指环"
Inst81Quest1name3 = "坚硬白金指环"
Inst81Quest1name4 = "巫毒徽记"

--Quest 2 Alliance
Inst81Quest2 = "2. 迦尔达拉之死"
Inst81Quest2_Aim = "杜布拉金的托玛尔要你杀死古达克的迦尔达拉。"
Inst81Quest2_Location = "托玛尔(祖达克 - 杜布拉金; "..YELLOW.."69.9, 22.8"..WHITE..")"
Inst81Quest2_Note = "迦尔达拉在 "..YELLOW.."[5]"..WHITE.."。"
Inst81Quest2_Prequest = "未完的事情"
Inst81Quest2_Folgequest = "None"
--
Inst81Quest2name1 = "狡诈魔精腰带"
Inst81Quest2name2 = "奇怪的巫毒腰带"
Inst81Quest2name3 = "覆灭帝国的游侠腰带"
Inst81Quest2name4 = "陨落半神束腰"

--Quest 3 Alliance
Inst81Quest3 = "3. 独一无二"
Inst81Quest3_Aim = "杜布拉金的记载者拜基妮要你进入古达克，获取一块达卡莱巨像的碎片。"
Inst81Quest3_Location = "记载者拜基妮(祖达克 - 杜布拉金; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest3_Note = "达卡莱巨像的碎片在 "..YELLOW.."[2]"..WHITE.."的达卡莱巨像掉落。"
Inst81Quest3_Prequest = "无"
Inst81Quest3_Folgequest = "无"
--
Inst81Quest3name1 = "鹿皮缝合软靴"
Inst81Quest3name2 = "犀牛皮革长靴"
Inst81Quest3name3 = "陨落希望之鳞甲靴"
Inst81Quest3name4 = "魔精能量之靴"
Inst81Quest3name5 = "巨魔蹂躏者"

--Quest 4 Alliance
Inst81Quest4 = "4. 死亡证明：迦尔达拉"
Inst81Quest4_Aim = "达拉然的大法师兰达洛克要你将阿卡里的魔精残渣交给他。"
Inst81Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst81Quest4_Note = "这个日常任务只能在英雄难度下完成。\n\n迦尔达拉在 "..YELLOW.."[5]"..WHITE.."。"
Inst81Quest4_Prequest = "无"
Inst81Quest4_Folgequest = "无"
--
Inst81Quest4name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst81Quest1_HORDE = Inst81Quest1
Inst81Quest1_HORDE_Aim = Inst81Quest1_Aim
Inst81Quest1_HORDE_Location = Inst81Quest1_Location
Inst81Quest1_HORDE_Note = Inst81Quest1_Note
Inst81Quest1_HORDE_Prequest = Inst81Quest1_Prequest
Inst81Quest1_HORDE_Folgequest = Inst81Quest1_Folgequest
--
Inst81Quest1name1_HORDE = Inst81Quest1name1
Inst81Quest1name2_HORDE = Inst81Quest1name2
Inst81Quest1name3_HORDE = Inst81Quest1name3
Inst81Quest1name4_HORDE = Inst81Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst81Quest2_HORDE = Inst81Quest2
Inst81Quest2_HORDE_Aim = Inst81Quest2_Aim
Inst81Quest2_HORDE_Location = Inst81Quest2_Location
Inst81Quest2_HORDE_Note = Inst81Quest2_Note
Inst81Quest2_HORDE_Prequest = Inst81Quest2_Prequest
Inst81Quest2_HORDE_Folgequest = Inst81Quest2_Folgequest
--
Inst81Quest2name1_HORDE = Inst81Quest2name1
Inst81Quest2name2_HORDE = Inst81Quest2name2
Inst81Quest2name3_HORDE = Inst81Quest2name3
Inst81Quest2name4_HORDE = Inst81Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst81Quest3_HORDE = Inst81Quest3
Inst81Quest3_HORDE_Aim = Inst81Quest3_Aim
Inst81Quest3_HORDE_Location = Inst81Quest3_Location
Inst81Quest3_HORDE_Note = Inst81Quest3_Note
Inst81Quest3_HORDE_Prequest = Inst81Quest3_Prequest
Inst81Quest3_HORDE_Folgequest = Inst81Quest3_Folgequest
--
Inst81Quest3name1_HORDE = Inst81Quest3name1
Inst81Quest3name2_HORDE = Inst81Quest3name2
Inst81Quest3name3_HORDE = Inst81Quest3name3
Inst81Quest3name4_HORDE = Inst81Quest3name4
Inst81Quest3name5_HORDE = Inst81Quest3name5

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst81Quest4_HORDE = Inst81Quest4
Inst81Quest4_HORDE_Aim = Inst81Quest4_Aim
Inst81Quest4_HORDE_Location = Inst81Quest4_Location
Inst81Quest4_HORDE_Note = Inst81Quest4_Note
Inst81Quest4_HORDE_Prequest = Inst81Quest4_Prequest
Inst81Quest4_HORDE_Folgequest = Inst81Quest4_Folgequest
--
Inst81Quest4name1_HORDE = Inst81Quest4name1



--------------- INST82 - The Violet Hold ---------------

Inst82Story = "Among the ornate spires and enchanted streets of Dalaran, a dark presence stirs within the mighty walls of the Violet Hold. Long used to restrain threats to the city, the tower holds row upon row of deadly inmates, and it has been diligently watched over by the Kirin Tor. However, a sudden assault has tested the integrity of the hold, putting at risk the safety of everyone outside the prison's walls. Using the dungeon as a means to breach the city, Malygos and his blue dragonflight have begun to chip away at the Violet Hold's defenses, hungry to reclaim arcane dominance over Azeroth. Only the brave souls of those protecting the prison stand between the continued existence of Dalaran and the city's utter annihilation."
Inst82Caption = "紫罗兰监狱"
Inst82QAA = "3个任务"
Inst82QAH = "3个任务"

--Quest 1 Alliance
Inst82Quest1 = "1. 谨慎行事"
Inst82Quest1_Aim = "罗宁希望你前往达拉然的紫罗兰监狱，与典狱官奥图拉斯谈一谈。"
Inst82Quest1_Location = "罗宁(达拉然 - 紫罗兰城堡; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst82Quest1_Note = "典狱官奥图拉斯在(达拉然 - 紫罗兰监狱; "..YELLOW.."60.8, 62.7"..WHITE..")。"
Inst82Quest1_Prequest = "无"
Inst82Quest1_Folgequest = "堵截"
-- No Rewards for this quest

--Quest 2 Alliance
Inst82Quest2 = "2. 堵截"
Inst82Quest2_Aim = "典狱官奥图拉斯希望你进入紫罗兰监狱，消灭入侵的蓝龙军团。杀死塞安妮苟萨之后向他复命。"
Inst82Quest2_Location = "典狱官奥图拉斯(达拉然 - 紫罗兰监狱; "..YELLOW.."60.8, 62.7"..WHITE..")"
Inst82Quest2_Note = "塞安妮苟萨在 "..YELLOW.."[6]"..WHITE.."。"
Inst82Quest2_Prequest = "谨慎行事"
Inst82Quest2_Folgequest = "无"
--
Inst82Quest2name1 = "纹饰鹿皮护腿"
Inst82Quest2name2 = "协商长裤"
Inst82Quest2name3 = "迷宫护腿"
Inst82Quest2name4 = "达拉然典狱官腿铠"

--Quest 3 Alliance
Inst82Quest3 = "3. 死亡证明：塞安妮苟萨"
Inst82Quest3_Aim = "达拉然的大法师兰达洛克要你将塞安妮苟萨的徽记交给他。"
Inst82Quest3_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst82Quest3_Note = "这个日常任务只能在英雄难度下完成。\n\n塞安妮苟萨在 "..YELLOW.."[6]"..WHITE.."。"
Inst82Quest3_Prequest = "无"
Inst82Quest3_Folgequest = "无"
--
Inst82Quest3name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst82Quest1_HORDE = Inst82Quest1
Inst82Quest1_HORDE_Aim = Inst82Quest1_Aim
Inst82Quest1_HORDE_Location = Inst82Quest1_Location
Inst82Quest1_HORDE_Note = Inst82Quest1_Note
Inst82Quest1_HORDE_Prequest = Inst82Quest1_Prequest
Inst82Quest1_HORDE_Folgequest = Inst82Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst82Quest2_HORDE = Inst82Quest2
Inst82Quest2_HORDE_Aim = Inst82Quest2_Aim
Inst82Quest2_HORDE_Location = Inst82Quest2_Location
Inst82Quest2_HORDE_Note = Inst82Quest2_Note
Inst82Quest2_HORDE_Prequest = Inst82Quest2_Prequest
Inst82Quest2_HORDE_Folgequest = Inst82Quest2_Folgequest
--
Inst82Quest2name1_HORDE = Inst82Quest2name1
Inst82Quest2name2_HORDE = Inst82Quest2name2
Inst82Quest2name3_HORDE = Inst82Quest2name3
Inst82Quest2name4_HORDE = Inst82Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst82Quest3_HORDE = Inst82Quest3
Inst82Quest3_HORDE_Aim = Inst82Quest3_Aim
Inst82Quest3_HORDE_Location = Inst82Quest3_Location
Inst82Quest3_HORDE_Note = Inst82Quest3_Note
Inst82Quest3_HORDE_Prequest = Inst82Quest3_Prequest
Inst82Quest3_HORDE_Folgequest = Inst82Quest3_Folgequest
--
Inst82Quest3name1_HORDE = Inst82Quest3name1




--------------- INST83 - Strand of the Ancients (SotA)  ---------------

Inst83Story = "The Strand of the Ancients is a battleground located off the southern coast of the Dragonblight being introduced in Wrath of the Lich King. This battleground consists of 3 walls which have to be destroyed to continue, capture points and a graveyard after each wall. The overall goal is to be the first team to get through the last wall.\n\n"..GREEN.."Quoted from WoWWiki"
Inst83Caption = "Strand of the Ancients"
Inst83QAA = "1 Quest"
Inst83QAH = "1 Quest"

--Quest 1 Alliance
Inst83Quest1 = "1. Call to Arms: Strand of the Ancients (Daily)"
Inst83Quest1_Aim = "Win a Strand of the Ancients battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst83Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst83Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst83Quest1_Prequest = "None"
Inst83Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 1 Horde
Inst83Quest1_HORDE = "1. Call to Arms: Strand of the Ancients (Daily)"
Inst83Quest1_HORDE_Aim = "Win a Strand of the Ancients battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran or Shattrath."
Inst83Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst83Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst83Quest1_HORDE_Prequest = "None"
Inst83Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST84 - Naxxramas (Naxx) ---------------

Inst84Caption = "纳克萨玛斯"
Inst84QAA = "6个任务"
Inst84QAH = "6个任务"

--Quest 1 Alliance
Inst84Quest1 = "1. 聚焦之虹的钥匙"
Inst84Quest1_Aim = "前往龙骨荒野的龙眠神殿，将聚焦之虹的钥匙交给阿莱克丝塔萨，生命的缚誓者。"
Inst84Quest1_Location = "聚焦之虹的钥匙(掉落自萨菲隆; "..YELLOW.."冰霜巨龙巢穴 [1]"..WHITE..")"
Inst84Quest1_Note = "阿莱克丝塔萨在(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")。这个奖励是用来开启“魔枢：永恒之眼”的10人普通模式所必需的。"
Inst84Quest1_Prequest = "无"
Inst84Quest1_Folgequest = "永恒之眼的审判("..YELLOW.."永恒之眼"..WHITE..")"
--
Inst84Quest1name1 = "聚焦之虹的钥匙"

--Quest 2 Alliance
Inst84Quest2 = "2. 英雄聚焦之虹的钥匙(英雄)"
Inst84Quest2_Aim = "前往龙骨荒野的龙眠神殿，将英雄聚焦之虹的钥匙交给阿莱克丝塔萨，生命的缚誓者。"
Inst84Quest2_Location = "英雄聚焦之虹的钥匙(掉落自萨菲隆; "..YELLOW.."冰霜巨龙巢穴 [1]"..WHITE..")"
Inst84Quest2_Note = "阿莱克丝塔萨在(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")。这个奖励是用来开启“魔枢：永恒之眼”的25人英雄模式所必需的。"
Inst84Quest2_Prequest = "无"
Inst84Quest2_Folgequest = "永恒之眼的审判("..YELLOW.."永恒之眼"..WHITE..")"
--
Inst84Quest2name1 = "英雄聚焦之虹的钥匙"

--Quest 3 Alliance
Inst84Quest3 = "3. 阿努布雷坎必须死(每周)"
Inst84Quest3_Aim = "消灭阿努布雷坎。"
Inst84Quest3_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest3_Note = "阿努布雷坎在 "..YELLOW.."蜘蛛区 [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst84Quest3_Prequest = "无"
Inst84Quest3_Folgequest = "无"
--
Inst84Quest3name1 = "寒冰纹章"
Inst84Quest3name2 = "凯旋纹章"

--Quest 4 Alliance
Inst84Quest4 = "4. 消灭教官拉苏维奥斯！(每周)"
Inst84Quest4_Aim = "消灭教官拉苏维奥斯。"
Inst84Quest4_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest4_Note = "教官拉苏维奥斯在 "..YELLOW.."军事区 [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst84Quest4_Prequest = "无"
Inst84Quest4_Folgequest = "无"
--
Inst84Quest4name1 = "寒冰纹章"
Inst84Quest4name2 = "凯旋纹章"

--Quest 5 Alliance
Inst84Quest5 = "5. 消灭药剂师诺斯！(每周)"
Inst84Quest5_Aim = "消灭药剂师诺斯。"
Inst84Quest5_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest5_Note = "药剂师诺斯在 "..YELLOW.."瘟疫区 [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst84Quest5_Prequest = "无"
Inst84Quest5_Folgequest = "无"
--
Inst84Quest5name1 = "寒冰纹章"
Inst84Quest5name2 = "凯旋纹章"

--Quest 6 Alliance
Inst84Quest6 = "6. 消灭帕奇维克！(每周)"
Inst84Quest6_Aim = "消灭帕奇维克。"
Inst84Quest6_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest6_Note = "帕奇维克在 "..YELLOW.."构造区 [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst84Quest6_Prequest = "无"
Inst84Quest6_Folgequest = "无"
--
Inst84Quest6name1 = "寒冰纹章"
Inst84Quest6name2 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst84Quest1_HORDE = Inst84Quest1
Inst84Quest1_HORDE_Aim = Inst84Quest1_Aim
Inst84Quest1_HORDE_Location = Inst84Quest1_Location
Inst84Quest1_HORDE_Note = Inst84Quest1_Note
Inst84Quest1_HORDE_Prequest = Inst84Quest1_Prequest
Inst84Quest1_HORDE_Folgequest = Inst84Quest1_Folgequest
--
Inst84Quest1name1_HORDE = Inst84Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst84Quest2_HORDE = Inst84Quest2
Inst84Quest2_HORDE_Aim = Inst84Quest2_Aim
Inst84Quest2_HORDE_Location = Inst84Quest2_Location
Inst84Quest2_HORDE_Note = Inst84Quest2_Note
Inst84Quest2_HORDE_Prequest = Inst84Quest2_Prequest
Inst84Quest2_HORDE_Folgequest = Inst84Quest2_Folgequest
--
Inst84Quest2name1_HORDE = Inst84Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst84Quest3_HORDE = Inst84Quest3
Inst84Quest3_HORDE_Aim = Inst84Quest3_Aim
Inst84Quest3_HORDE_Location = Inst84Quest3_Location
Inst84Quest3_HORDE_Note = Inst84Quest3_Note
Inst84Quest3_HORDE_Prequest = Inst84Quest3_Prequest
Inst84Quest3_HORDE_Folgequest = Inst84Quest3_Folgequest
--
Inst84Quest3name1_HORDE = Inst84Quest3name1
Inst84Quest3name2_HORDE = Inst84Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst84Quest4_HORDE = Inst84Quest4
Inst84Quest4_HORDE_Aim = Inst84Quest4_Aim
Inst84Quest4_HORDE_Location = Inst84Quest4_Location
Inst84Quest4_HORDE_Note = Inst84Quest4_Note
Inst84Quest4_HORDE_Prequest = Inst84Quest4_Prequest
Inst84Quest4_HORDE_Folgequest = Inst84Quest4_Folgequest
--
Inst84Quest4name1_HORDE = Inst84Quest4name1
Inst84Quest4name2_HORDE = Inst84Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst84Quest5_HORDE = Inst84Quest5
Inst84Quest5_HORDE_Aim = Inst84Quest5_Aim
Inst84Quest5_HORDE_Location = Inst84Quest5_Location
Inst84Quest5_HORDE_Note = Inst84Quest5_Note
Inst84Quest5_HORDE_Prequest = Inst84Quest5_Prequest
Inst84Quest5_HORDE_Folgequest = Inst84Quest5_Folgequest
--
Inst84Quest5name1_HORDE = Inst84Quest5name1
Inst84Quest5name2_HORDE = Inst84Quest5name2

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst84Quest6_HORDE = Inst84Quest6
Inst84Quest6_HORDE_Aim = Inst84Quest6_Aim
Inst84Quest6_HORDE_Location = Inst84Quest6_Location
Inst84Quest6_HORDE_Note = Inst84Quest6_Note
Inst84Quest6_HORDE_Prequest = Inst84Quest6_Prequest
Inst84Quest6_HORDE_Folgequest = Inst84Quest6_Folgequest
--
Inst84Quest6name1_HORDE = Inst84Quest6name1
Inst84Quest6name2_HORDE = Inst84Quest6name2



--------------- INST85 - Vault of Archavon ---------------

Inst85Story = "Overlooking the frozen plains of the Great Dragonblight and the inhospitable wastes of Borean Tundra lies a region known to the denizens of Northrend as Wintergrasp. Seated atop a high plateau, Wintergrasp has remained undisturbed for ages, its icy winds howling unheard amongst the ancient titan fortifications that dot the landscape. However, an abundance of elemental materials and its strategically important titan fortifications are making Wintergrasp the focus of a vicious tug-of-war between the Horde and the Alliance. And then there are the persistent rumors of an ancient titan vault beneath Wintergrasp's keep. One can only marvel at the thought of what treasures may be waiting there...."
Inst85Caption = "阿尔卡冯的宝库"
Inst85QAA = "没有任务"
Inst85QAH = "没有任务"



--------------- INST86 - Ulduar ---------------

Inst86Story = "For millennia, Ulduar has remained undisturbed by mortals, far away from their concerns and their struggles. Yet since its recent discovery, many have wondered what the structure's original purpose may have been. Some thought it a city, built to herald the glory of its makers; some thought it a vault containing innumerable treasures, perhaps even relics of the mighty Titans themselves. Such speculations were wrong. Beyond Ulduar's gates lies no city, no treasure vault, no final answer to the Titan's mysteries. All that awaits those who dare set foot in Ulduar is a horror even the Titans could not, would not destroy, an evil they merely... contained. Beneath ancient Ulduar, the Old God of death lies, whispering.... Tread carefully, or its prison will become your tomb."
Inst86Caption = "奥杜尔"
Inst86QAA = "20个任务"
Inst86QAH = "20个任务"

--Quest 1 Alliance
Inst86Quest1 = "1. 档案馆数据圆盘"
Inst86Quest1_Aim = "将档案馆数据圆盘带到奥杜尔的档案馆控制台前。"
Inst86Quest1_Location = "档案馆数据圆盘(掉落自钢铁议会; "..YELLOW.."前厅 [5]"..WHITE..")"
Inst86Quest1_Note = "只有在困难模式下完成钢铁议会战斗时，数据圆盘才会掉落。每次团队副本中只有一个人能够拾取数据圆盘。\n\n在钢铁议会被击败后，一个门会打开。在之后的房间内，将任务交给文件馆控制台。勘探员多尔伦将给你下一个任务。"
Inst86Quest1_Prequest = "无"
Inst86Quest1_Folgequest = "天文台"
-- No Rewards for this quest

--Quest 2 Alliance
Inst86Quest2 = "2. 天文台"
Inst86Quest2_Aim = "奥杜尔档案馆中的勘探员多尔伦要你找到天文台的入口。"
Inst86Quest2_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest2_Note = "天文台在(奥杜尔 - 前厅; "..YELLOW.."[7]"..WHITE..")。\n\n在你将任务交给勘探员多尔伦后，他会给你四个更多的任务。"
Inst86Quest2_Prequest = "档案馆数据圆盘"
Inst86Quest2_Folgequest = "四个更多的任务"
-- No Rewards for this quest

--Quest 3 Alliance
Inst86Quest3 = "3. 霍迪尔的徽记"
Inst86Quest3_Aim = "将霍迪尔的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest3_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest3_Note = "霍迪尔在 "..YELLOW.."守护者 [9]"..WHITE.."。必须在困难模式下击败他，符记才会掉落。"
Inst86Quest3_Prequest = "天文台"
Inst86Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst86Quest4 = "4. 托里姆的徽记"
Inst86Quest4_Aim = "将托里姆的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest4_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest4_Note = "托里姆在 "..YELLOW.."守护者 [10]"..WHITE.."。必须在困难模式下击败他，符记才会掉落。"
Inst86Quest4_Prequest = "天文台"
Inst86Quest4_Folgequest = "无"
-- No Rewards for this quest

--Quest 5 Alliance
Inst86Quest5 = "5. 弗蕾亚的徽记"
Inst86Quest5_Aim = "将弗蕾亚的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest5_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest5_Note = "弗蕾亚在 "..YELLOW.."守护者 [11]"..WHITE.."。必须在困难模式下击败她，符记才会掉落。"
Inst86Quest5_Prequest = "天文台"
Inst86Quest5_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Alliance
Inst86Quest6 = "6. 米米尔隆的徽记"
Inst86Quest6_Aim = "将米米尔隆的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest6_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest6_Note = "米米尔隆在 "..YELLOW.."思想火花 [15]"..WHITE.."。必须在困难模式下击败他，符记才会掉落。"
Inst86Quest6_Prequest = "天文台"
Inst86Quest6_Folgequest = "无"
-- No Rewards for this quest

--Quest 7 Alliance
Inst86Quest7 = "7. 奥尔加隆"
Inst86Quest7_Aim = "将守护者的徽记带到奥杜尔的文件馆控制台前。"
Inst86Quest7_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest7_Note = "完成这个任务将允许你在天文台与观察者奥尔加隆进行战斗。"
Inst86Quest7_Prequest = "四个徽记任务"
Inst86Quest7_Folgequest = "无"
--
Inst86Quest7name1 = "天文台钥匙"
Inst86Quest7name2 = "一包奥杜尔战利品"

--Quest 8 Alliance
Inst86Quest8 = "8. 结果好，一切都好"
Inst86Quest8_Aim = "将回复代码阿尔法交给达拉然的罗宁。"
Inst86Quest8_Location = "回复代码阿尔法(掉落自观察者奥尔加隆; "..YELLOW.."前厅 [7]"..WHITE..")"
Inst86Quest8_Note = "每次团队副本中只有一个团队成员可以拿取回复代码。罗宁在 达拉然 - 紫罗兰城堡; "..YELLOW.."30.5, 48.4"..WHITE.."。"
Inst86Quest8_Prequest = "无"
Inst86Quest8_Folgequest = "无"
--
Inst86Quest8name1 = "天空使者斗篷"
Inst86Quest8name2 = "阳光斗篷"
Inst86Quest8name3 = "布莱恩的焊接戒指"
Inst86Quest8name4 = "星芒徽记"

--Quest 9 Alliance
Inst86Quest9 = "9. 英雄：档案馆数据圆盘"
Inst86Quest9_Aim = "将档案馆数据圆盘带到奥杜尔的档案馆控制台前。"
Inst86Quest9_Location = "档案馆数据圆盘(掉落自钢铁议会; "..YELLOW.."前厅 [5]"..WHITE..")"
Inst86Quest9_Note = "只有在英雄困难模式下完成钢铁议会战斗时，数据圆盘才会掉落。每次团队副本中只有一个人能够拾取数据圆盘。\n\n在钢铁议会被击败后，一个门会打开。在之后的房间内，将任务交给文件馆控制台。勘探员多尔伦将给你下一个任务。"
Inst86Quest9_Prequest = "无"
Inst86Quest9_Folgequest = "天文台"
-- No Rewards for this quest

--Quest 10 Alliance
Inst86Quest10 = "10. 英雄：天文台"
Inst86Quest10_Aim = "奥杜尔档案馆中的勘探员多尔伦要你找到天文台的入口。"
Inst86Quest10_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest10_Note = "天文台在(奥杜尔 - 前厅; "..YELLOW.."[7]"..WHITE..")。\n\n在你将任务交给勘探员多尔伦后，他会给你四个更多的任务。"
Inst86Quest10_Prequest = "档案馆数据圆盘"
Inst86Quest10_Folgequest = "四个更多的任务"
-- No Rewards for this quest

--Quest 11 Alliance
Inst86Quest11 = "11. 英雄：霍迪尔的徽记"
Inst86Quest11_Aim = "将霍迪尔的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest11_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest11_Note = "霍迪尔在 "..YELLOW.."守护者 [9]"..WHITE.."。必须在英雄困难模式下击败他，符记才会掉落。"
Inst86Quest11_Prequest = "天文台"
Inst86Quest11_Folgequest = "无"
-- No Rewards for this quest

--Quest 12 Alliance
Inst86Quest12 = "12. 英雄：托里姆的徽记"
Inst86Quest12_Aim = "将托里姆的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest12_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest12_Note = "托里姆在 "..YELLOW.."守护者 [10]"..WHITE.."。必须在英雄困难模式下击败他，符记才会掉落。"
Inst86Quest12_Prequest = "天文台"
Inst86Quest12_Folgequest = "无"
-- No Rewards for this quest

--Quest 13 Alliance
Inst86Quest13 = "13. 英雄：弗蕾亚的徽记"
Inst86Quest13_Aim = "将弗蕾亚的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest13_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest13_Note = "弗蕾亚在 "..YELLOW.."守护者 [11]"..WHITE.."。必须在英雄困难模式下击败她，符记才会掉落。"
Inst86Quest13_Prequest = "天文台"
Inst86Quest13_Folgequest = "无"
-- No Rewards for this quest

--Quest 14 Alliance
Inst86Quest14 = "14. 米米尔隆的徽记"
Inst86Quest14_Aim = "将米米尔隆的徽记交给奥杜尔文件馆中的勘探员多尔伦。"
Inst86Quest14_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest14_Note = "米米尔隆在 "..YELLOW.."思想火花 [15]"..WHITE.."。必须在英雄困难模式下击败他，符记才会掉落。"
Inst86Quest14_Prequest = "天文台"
Inst86Quest14_Folgequest = "无"
-- No Rewards for this quest

--Quest 15 Alliance
Inst86Quest15 = "15. 英雄：奥尔加隆"
Inst86Quest15_Aim = "将守护者的徽记带到奥杜尔的文件馆控制台前。"
Inst86Quest15_Location = "勘探员多尔伦(奥杜尔 - 前厅; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest15_Note = "完成这个任务将允许你在天文台与观察者奥尔加隆进行战斗。"
Inst86Quest15_Prequest = "四个徽记任务"
Inst86Quest15_Folgequest = "无"
--
Inst86Quest15name1 = "英雄天文台钥匙"
Inst86Quest15name2 = "一大包奥杜尔战利品"

--Quest 16 Alliance
Inst86Quest16 = "16. 英雄：结果好，一切都好"
Inst86Quest16_Aim = "将回复代码阿尔法交给达拉然的罗宁。"
Inst86Quest16_Location = "回复代码阿尔法(掉落自观察者奥尔加隆; "..YELLOW.."前厅 [7]"..WHITE..")"
Inst86Quest16_Note = "每次团队副本中只有一个团队成员可以拿取回复代码。罗宁在 达拉然 - 紫罗兰城堡; "..YELLOW.."30.5, 48.4"..WHITE.."。"
Inst86Quest16_Prequest = "无"
Inst86Quest16_Folgequest = "无"
--
Inst86Quest16name1 = "天界斗篷"
Inst86Quest16name2 = "阳光披风"
Inst86Quest16name3 = "布莱恩的徽记之戒"
Inst86Quest16name4 = "星光之环"

--Quest 17 Alliance
Inst86Quest17 = "17. 烈焰巨兽必须死！(每周)"
Inst86Quest17_Aim = "消灭烈焰巨兽。"
Inst86Quest17_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest17_Note = "烈焰巨兽在 "..YELLOW.."攻城区域 [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst86Quest17_Prequest = "无"
Inst86Quest17_Folgequest = "无"
--
Inst86Quest17name1 = "寒冰纹章"
Inst86Quest17name2 = "凯旋纹章"

--Quest 18 Alliance
Inst86Quest18 = "18. 消灭掌炉者伊格尼斯！(每周)"
Inst86Quest18_Aim = "消灭掌炉者伊格尼斯。"
Inst86Quest18_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest18_Note = "掌炉者伊格尼斯在 "..YELLOW.."攻城区域 [3]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst86Quest18_Prequest = "无"
Inst86Quest18_Folgequest = "无"
--
Inst86Quest18name1 = "寒冰纹章"
Inst86Quest18name2 = "凯旋纹章"

--Quest 19 Alliance
Inst86Quest19 = "19. 消灭锋鳞!(每周)"
Inst86Quest19_Aim = "消灭锋鳞。"
Inst86Quest19_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest19_Note = "锋鳞在 "..YELLOW.."攻城区域 [2]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst86Quest19_Prequest = "无"
Inst86Quest19_Folgequest = "无"
--
Inst86Quest19name1 = "寒冰纹章"
Inst86Quest19name2 = "凯旋纹章"

--Quest 20 Alliance
Inst86Quest20 = "20. 消灭XT-002拆解者！(每周)"
Inst86Quest20_Aim = "消灭XT-002拆解者。"
Inst86Quest20_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest20_Note = "XT-002拆解者在 "..YELLOW.."攻城区域 [4]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst86Quest20_Prequest = "无"
Inst86Quest20_Folgequest = "无"
--
Inst86Quest20name1 = "寒冰纹章"
Inst86Quest20name2 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst86Quest1_HORDE = Inst86Quest1
Inst86Quest1_HORDE_Aim = Inst86Quest1_Aim
Inst86Quest1_HORDE_Location = Inst86Quest1_Location
Inst86Quest1_HORDE_Note = Inst86Quest1_Note
Inst86Quest1_HORDE_Prequest = Inst86Quest1_Prequest
Inst86Quest1_HORDE_Folgequest = Inst86Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst86Quest2_HORDE = Inst86Quest2
Inst86Quest2_HORDE_Aim = Inst86Quest2_Aim
Inst86Quest2_HORDE_Location = Inst86Quest2_Location
Inst86Quest2_HORDE_Note = Inst86Quest2_Note
Inst86Quest2_HORDE_Prequest = Inst86Quest2_Prequest
Inst86Quest2_HORDE_Folgequest = Inst86Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst86Quest3_HORDE = Inst86Quest3
Inst86Quest3_HORDE_Aim = Inst86Quest3_Aim
Inst86Quest3_HORDE_Location = Inst86Quest3_Location
Inst86Quest3_HORDE_Note = Inst86Quest3_Note
Inst86Quest3_HORDE_Prequest = Inst86Quest3_Prequest
Inst86Quest3_HORDE_Folgequest = Inst86Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst86Quest4_HORDE = Inst86Quest4
Inst86Quest4_HORDE_Aim = Inst86Quest4_Aim
Inst86Quest4_HORDE_Location = Inst86Quest4_Location
Inst86Quest4_HORDE_Note = Inst86Quest4_Note
Inst86Quest4_HORDE_Prequest = Inst86Quest4_Prequest
Inst86Quest4_HORDE_Folgequest = Inst86Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst86Quest5_HORDE = Inst86Quest5
Inst86Quest5_HORDE_Aim = Inst86Quest5_Aim
Inst86Quest5_HORDE_Location = Inst86Quest5_Location
Inst86Quest5_HORDE_Note = Inst86Quest5_Note
Inst86Quest5_HORDE_Prequest = Inst86Quest5_Prequest
Inst86Quest5_HORDE_Folgequest = Inst86Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst86Quest6_HORDE = Inst86Quest6
Inst86Quest6_HORDE_Aim = Inst86Quest6_Aim
Inst86Quest6_HORDE_Location = Inst86Quest6_Location
Inst86Quest6_HORDE_Note = Inst86Quest6_Note
Inst86Quest6_HORDE_Prequest = Inst86Quest6_Prequest
Inst86Quest6_HORDE_Folgequest = Inst86Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst86Quest7_HORDE = Inst86Quest7
Inst86Quest7_HORDE_Aim = Inst86Quest7_Aim
Inst86Quest7_HORDE_Location = Inst86Quest7_Location
Inst86Quest7_HORDE_Note = Inst86Quest7_Note
Inst86Quest7_HORDE_Prequest = Inst86Quest7_Prequest
Inst86Quest7_HORDE_Folgequest = Inst86Quest7_Folgequest
--
Inst86Quest7name1_HORDE = Inst86Quest7name1
Inst86Quest7name2_HORDE = Inst86Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst86Quest8_HORDE = Inst86Quest8
Inst86Quest8_HORDE_Aim = Inst86Quest8_Aim
Inst86Quest8_HORDE_Location = Inst86Quest8_Location
Inst86Quest8_HORDE_Note = Inst86Quest8_Note
Inst86Quest8_HORDE_Prequest = Inst86Quest8_Prequest
Inst86Quest8_HORDE_Folgequest = Inst86Quest8_Folgequest
--
Inst86Quest8name1_HORDE = Inst86Quest8name1
Inst86Quest8name2_HORDE = Inst86Quest8name2
Inst86Quest8name3_HORDE = Inst86Quest8name3
Inst86Quest8name4_HORDE = Inst86Quest8name4

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst86Quest9_HORDE = Inst86Quest9
Inst86Quest9_HORDE_Aim = Inst86Quest9_Aim
Inst86Quest9_HORDE_Location = Inst86Quest9_Location
Inst86Quest9_HORDE_Note = Inst86Quest9_Note
Inst86Quest9_HORDE_Prequest = Inst86Quest9_Prequest
Inst86Quest9_HORDE_Folgequest = Inst86Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst86Quest10_HORDE = Inst86Quest10
Inst86Quest10_HORDE_Aim = Inst86Quest10_Aim
Inst86Quest10_HORDE_Location = Inst86Quest10_Location
Inst86Quest10_HORDE_Note = Inst86Quest10_Note
Inst86Quest10_HORDE_Prequest = Inst86Quest10_Prequest
Inst86Quest10_HORDE_Folgequest = Inst86Quest10_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst86Quest11_HORDE = Inst86Quest11
Inst86Quest11_HORDE_Aim = Inst86Quest11_Aim
Inst86Quest11_HORDE_Location = Inst86Quest11_Location
Inst86Quest11_HORDE_Note = Inst86Quest11_Note
Inst86Quest11_HORDE_Prequest = Inst86Quest11_Prequest
Inst86Quest11_HORDE_Folgequest = Inst86Quest11_Folgequest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst86Quest12_HORDE = Inst86Quest12
Inst86Quest12_HORDE_Aim = Inst86Quest12_Aim
Inst86Quest12_HORDE_Location = Inst86Quest12_Location
Inst86Quest12_HORDE_Note = Inst86Quest12_Note
Inst86Quest12_HORDE_Prequest = Inst86Quest12_Prequest
Inst86Quest12_HORDE_Folgequest = Inst86Quest12_Folgequest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst86Quest13_HORDE = Inst86Quest13
Inst86Quest13_HORDE_Aim = Inst86Quest13_Aim
Inst86Quest13_HORDE_Location = Inst86Quest13_Location
Inst86Quest13_HORDE_Note = Inst86Quest13_Note
Inst86Quest13_HORDE_Prequest = Inst86Quest13_Prequest
Inst86Quest13_HORDE_Folgequest = Inst86Quest13_Folgequest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst86Quest14_HORDE = Inst86Quest14
Inst86Quest14_HORDE_Aim = Inst86Quest14_Aim
Inst86Quest14_HORDE_Location = Inst86Quest14_Location
Inst86Quest14_HORDE_Note = Inst86Quest14_Note
Inst86Quest14_HORDE_Prequest = Inst86Quest14_Prequest
Inst86Quest14_HORDE_Folgequest = Inst86Quest14_Folgequest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst86Quest15_HORDE = Inst86Quest15
Inst86Quest15_HORDE_Aim = Inst86Quest15_Aim
Inst86Quest15_HORDE_Location = Inst86Quest15_Location
Inst86Quest15_HORDE_Note = Inst86Quest15_Note
Inst86Quest15_HORDE_Prequest = Inst86Quest15_Prequest
Inst86Quest15_HORDE_Folgequest = Inst86Quest15_Folgequest
--
Inst86Quest15name1_HORDE = Inst86Quest15name1
Inst86Quest15name2_HORDE = Inst86Quest15name2

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst86Quest16_HORDE = Inst86Quest16
Inst86Quest16_HORDE_Aim = Inst86Quest16_Aim
Inst86Quest16_HORDE_Location = Inst86Quest16_Location
Inst86Quest16_HORDE_Note = Inst86Quest16_Note
Inst86Quest16_HORDE_Prequest = Inst86Quest16_Prequest
Inst86Quest16_HORDE_Folgequest = Inst86Quest16_Folgequest
--
Inst86Quest16name1_HORDE = Inst86Quest16name1
Inst86Quest16name2_HORDE = Inst86Quest16name2
Inst86Quest16name3_HORDE = Inst86Quest16name3
Inst86Quest16name4_HORDE = Inst86Quest16name4

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst86Quest17_HORDE = Inst86Quest17
Inst86Quest17_HORDE_Aim = Inst86Quest17_Aim
Inst86Quest17_HORDE_Location = Inst86Quest17_Location
Inst86Quest17_HORDE_Note = Inst86Quest17_Note
Inst86Quest17_HORDE_Prequest = Inst86Quest17_Prequest
Inst86Quest17_HORDE_Folgequest = Inst86Quest17_Folgequest
--
Inst86Quest17name1_HORDE = Inst86Quest17name1
Inst86Quest17name2_HORDE = Inst86Quest17name2

--Quest 18 Horde  (same as Quest 18 Alliance)
Inst86Quest18_HORDE = Inst86Quest18
Inst86Quest18_HORDE_Aim = Inst86Quest18_Aim
Inst86Quest18_HORDE_Location = Inst86Quest18_Location
Inst86Quest18_HORDE_Note = Inst86Quest18_Note
Inst86Quest18_HORDE_Prequest = Inst86Quest18_Prequest
Inst86Quest18_HORDE_Folgequest = Inst86Quest18_Folgequest
--
Inst86Quest18name1_HORDE = Inst86Quest18name1
Inst86Quest18name2_HORDE = Inst86Quest18name2

--Quest 19 Horde  (same as Quest 19 Alliance)
Inst86Quest19_HORDE = Inst86Quest19
Inst86Quest19_HORDE_Aim = Inst86Quest19_Aim
Inst86Quest19_HORDE_Location = Inst86Quest19_Location
Inst86Quest19_HORDE_Note = Inst86Quest19_Note
Inst86Quest19_HORDE_Prequest = Inst86Quest19_Prequest
Inst86Quest19_HORDE_Folgequest = Inst86Quest19_Folgequest
--
Inst86Quest19name1_HORDE = Inst86Quest19name1
Inst86Quest19name2_HORDE = Inst86Quest19name2

--Quest 20 Horde  (same as Quest 20 Alliance)
Inst86Quest20_HORDE = Inst86Quest20
Inst86Quest20_HORDE_Aim = Inst86Quest20_Aim
Inst86Quest20_HORDE_Location = Inst86Quest20_Location
Inst86Quest20_HORDE_Note = Inst86Quest20_Note
Inst86Quest20_HORDE_Prequest = Inst86Quest20_Prequest
Inst86Quest20_HORDE_Folgequest = Inst86Quest20_Folgequest
--
Inst86Quest20name1_HORDE = Inst86Quest20name1
Inst86Quest20name2_HORDE = Inst86Quest20name2


--------------- INST87 - Trial of the Champion ---------------

Inst87Story = "The time to strike at the heart of the Scourge is drawing close. Clouds blanket the skies of Azeroth and heroes gather beneath battle-worn banners in preparation for the coming storm. They say that even the darkest cloud has a silver lining. It is this hope that drives the men and women of the Argent Crusade: hope that the Light will see them through these trying times, hope that good will triumph over evil, hope that a hero blessed by the Light will come forth to put an end to the Lich King's dark reign. \n\nSo the Argent Crusade has sent out the call, a call to arms for all heroes far and wide, to meet at the very doorstep of the Lich King's domain and to prove their might in a tournament the likes of which Azeroth has never seen. Of course, a tournament such as this needs a fitting stage. A place where potential candidates are tested to the limits of exhaustion. A place where heroes... become champions. A place called the Crusaders' Coliseum."
Inst87Caption = "冠军的试炼"
Inst87QAA = "1个任务"
Inst87QAH = "1个任务"

--Quest 1 Alliance
Inst87Quest1 = "1. 死亡证明：黑骑士"
Inst87Quest1_Aim = "达拉然的大法师兰达洛克希望你能带给他一片黑骑士的灵魂碎片。"
Inst87Quest1_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst87Quest1_Note = "这个日常任务只能在英雄难度下完成。\n\n黑骑士是冠军的试炼中的最终首领。"
Inst87Quest1_Prequest = "无"
Inst87Quest1_Folgequest = "无"
--
Inst87Quest1name1 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst87Quest1_HORDE = Inst87Quest1
Inst87Quest1_HORDE_Aim = Inst87Quest1_Aim
Inst87Quest1_HORDE_Location = Inst87Quest1_Location
Inst87Quest1_HORDE_Note = Inst87Quest1_Note
Inst87Quest1_HORDE_Prequest = Inst87Quest1_Prequest
Inst87Quest1_HORDE_Folgequest = Inst87Quest1_Folgequest
--
Inst87Quest1name1_HORDE = Inst87Quest1name1



--------------- INST88 - Trial of the Crusader ---------------

Inst88Story = "The time to strike at the heart of the Scourge is drawing close. Clouds blanket the skies of Azeroth and heroes gather beneath battle-worn banners in preparation for the coming storm. They say that even the darkest cloud has a silver lining. It is this hope that drives the men and women of the Argent Crusade: hope that the Light will see them through these trying times, hope that good will triumph over evil, hope that a hero blessed by the Light will come forth to put an end to the Lich King's dark reign. \n\nSo the Argent Crusade has sent out the call, a call to arms for all heroes far and wide, to meet at the very doorstep of the Lich King's domain and to prove their might in a tournament the likes of which Azeroth has never seen. Of course, a tournament such as this needs a fitting stage. A place where potential candidates are tested to the limits of exhaustion. A place where heroes... become champions. A place called the Crusaders' Coliseum."
Inst88Caption = "十字军的试炼"
Inst88QAA = "1个任务"
Inst88QAH = "1个任务"

--Quest 1 Alliance
Inst88Quest1 = "1. 消灭加拉克苏斯大王！(每周)"
Inst88Quest1_Aim = "消灭加拉克苏斯大王。"
Inst88Quest1_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst88Quest1_Note = "加拉克苏斯大王是第二个首领。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst88Quest1_Prequest = "无"
Inst88Quest1_Folgequest = "无"
--
Inst88Quest1name1 = "寒冰纹章"
Inst88Quest1name2 = "凯旋纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst88Quest1_HORDE = Inst88Quest1
Inst88Quest1_HORDE_Aim = Inst88Quest1_Aim
Inst88Quest1_HORDE_Location = Inst88Quest1_Location
Inst88Quest1_HORDE_Note = Inst88Quest1_Note
Inst88Quest1_HORDE_Prequest = Inst88Quest1_Prequest
Inst88Quest1_HORDE_Folgequest = Inst88Quest1_Folgequest
--
Inst88Quest1name1_HORDE = Inst88Quest1name1
Inst88Quest1name2_HORDE = Inst88Quest1name2




--------------- INST89 - Isle of Conquest (IoC)  ---------------

Inst89Story = "An island somewhere off the shores of Northrend. A rock, hardly worth a second look. But as insignificant as it may seem, this is no ordinary place. A sound of thunder as waves crash endlessly against rocky cliffs; a sound of fury as swords clash on the blood-stained fields of this island on the edge of forever.\n\nWelcome to the Isle of Conquest."
Inst89Caption = "Isle of Conquest"
Inst89QAA = "1 Quest"
Inst89QAH = "1 Quest"

--Quest 1 Alliance
Inst89Quest1 = "1. Call to Arms: Isle of Conquest (Daily)"
Inst89Quest1_Aim = "Win an Isle of Conquest battleground match and return to a Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran, or Shattrath."
Inst89Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst89Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst89Quest1_Prequest = "None"
Inst89Quest1_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde
Inst89Quest1_HORDE = "1. Call to Arms: Isle of Conquest (Daily)"
Inst89Quest1_HORDE_Aim = "Win an Isle of Conquest battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran, or Shattrath."
Inst89Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst89Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst89Quest1_HORDE_Prequest = "None"
Inst89Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest




--------------- INST90 - Forge of Souls (FoS)  ---------------

Inst90Story = "Serving as the first wing in this expansive dungeon, the Forge of Souls will quickly put players to the test of carving through the Scourge stronghold into deeper, more treacherous locations. Jaina will command Alliance forces, and Sylvanas will direct Horde forces. The goal is to ruin the twisted engines known as soul grinders found in this portion of the citadel, and then players can advance -- that is, if the Horde and Alliance forces can overcome the foes who confront them."
Inst90Caption = "灵魂洪炉"
Inst90QAA = "3个任务"
Inst90QAH = "3个任务"

--Quest 1 Alliance
Inst90Quest1 = "1. 进入寒冰堡垒"
Inst90Quest1_Aim = "从冰冠堡垒一侧进入到灵魂洪炉，在那里找到吉安娜·普罗德摩尔女士。"
Inst90Quest1_Location = "学徒奈尔菲(达拉然 - 在南部银行外徘徊)"
Inst90Quest1_Note = "吉安娜·普罗德摩尔就在副本的入口处。"
Inst90Quest1_Prequest = "无"
Inst90Quest1_Folgequest = "痛苦灵魂的回声"
-- No Rewards for this quest

--Quest 2 Alliance
Inst90Quest2 = "2. 痛苦灵魂的回声"
Inst90Quest2_Aim = "消灭布隆亚姆和噬魂者，夺取萨隆矿坑的入口。"
Inst90Quest2_Location = "吉安娜·普罗德摩尔(灵魂洪炉; "..YELLOW.."入口"..WHITE..")"
Inst90Quest2_Note = "在离开副本之前，将任务交给位于 "..YELLOW.."[2]"..WHITE.."的吉安娜·普罗德摩尔。\n\n完成这个任务是进入萨隆矿坑的必要条件。"
Inst90Quest2_Prequest = "进入寒冰堡垒"
Inst90Quest2_Folgequest = "萨隆矿坑("..YELLOW.."萨隆矿坑"..WHITE..")"
--
Inst90Quest2name1 = "寒冰纹章"

--Quest 3 Alliance
Inst90Quest3 = "3. 锻造利剑"
Inst90Quest3_Aim = "在灵魂坩锅锻造已经重铸的奎尔德拉。"
Inst90Quest3_Location = "卡莱迪斯·亮矛(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst90Quest3_Note = "灵魂坩锅位于 "..YELLOW.."[2]"..WHITE.."，接近副本的尾部。"
Inst90Quest3_Prequest = "利剑的重铸("..YELLOW.."萨隆矿坑"..WHITE..")"
Inst90Quest3_Folgequest = "映像大厅("..YELLOW.."映像大厅"..WHITE..")"
-- No Rewards for this quest


--Quest 1 Horde
Inst90Quest1_HORDE = "1. 进入寒冰堡垒"
Inst90Quest1_HORDE_Aim = "从冰冠堡垒一侧进入到灵魂洪炉，在那里找到希尔瓦娜斯·风行者女王。"
Inst90Quest1_HORDE_Location = "黑暗游侠沃蕾尔(达拉然 - 在北部银行外徘徊)"
Inst90Quest1_HORDE_Note = "希尔瓦娜斯·风行者女王就在副本的入口处。"
Inst90Quest1_HORDE_Prequest = "无"
Inst90Quest1_HORDE_Folgequest = "痛苦灵魂的回声"
-- No Rewards for this quest

--Quest 2 Horde
Inst90Quest2_HORDE = "2. 痛苦灵魂的回声"
Inst90Quest2_HORDE_Aim = "消灭布隆亚姆和噬魂者，夺取萨隆矿坑的入口。"
Inst90Quest2_HORDE_Location = " 希尔瓦娜斯·风行者(灵魂洪炉; "..YELLOW.."入口"..WHITE..")"
Inst90Quest2_HORDE_Note = "在离开副本之前，将任务交给位于 "..YELLOW.."[2]"..WHITE.."的希尔瓦娜斯·风行者。\n\n完成这个任务是进入萨隆矿坑的必要条件。"
Inst90Quest2_HORDE_Prequest = "进入寒冰堡垒"
Inst90Quest2_HORDE_Folgequest = "萨隆矿坑("..YELLOW.."萨隆矿坑"..WHITE..")"
--
Inst90Quest2name1_HORDE = "寒冰纹章"

--Quest 3 Horde
Inst90Quest3_HORDE = "3. 锻造利剑"
Inst90Quest3_HORDE_Aim = "在灵魂坩锅锻造已经重铸的奎尔德拉。"
Inst90Quest3_HORDE_Location = "麦雷昂·阳炎(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst90Quest3_HORDE_Note = "灵魂坩锅位于 "..YELLOW.."[2]"..WHITE.."，接近副本的尾部。"
Inst90Quest3_HORDE_Prequest = "利剑的重铸("..YELLOW.."萨隆矿坑"..WHITE..")"
Inst90Quest3_HORDE_Folgequest = "映像大厅("..YELLOW.."映像大厅"..WHITE..")"
-- No Rewards for this quest



--------------- INST91 - Pit of Saron (PoS)  ---------------

Inst91Story = "Accessible only to those who have laid waste to the Forge of Souls' unholy operations, the Pit of Saron will bring Horde and Alliance forces deeper into the Lich King's domain. Players who venture here will immediately be confronted by the lord of this lair, Scourgelord Tyrannus. But defeating him will not be as easy as it seems. Before they can present a threat to Tyrannus, the adventurers, instructed by their leaders, will need to free enslaved allies who have been trapped by the Scourge. Until that happens, Tyrannus will leave all adversaries to his minions, workers of the citadel's mines. Perhaps the challenges here will lend clues as to the whereabouts of the Lich King's private chambers outside of the Frozen Throne, deep within the Halls of Reflection."
Inst91Caption = "萨隆矿坑"
Inst91QAA = "4个任务"
Inst91QAH = "4个任务"

--Quest 1 Alliance
Inst91Quest1 = "1. 萨隆矿坑"
Inst91Quest1_Aim = "在萨隆矿坑和吉安娜·普罗德摩尔见面。"
Inst91Quest1_Location = "吉安娜·普罗德摩尔(灵魂洪炉; "..YELLOW.."[2]"..WHITE..")"
Inst91Quest1_Note = "吉安娜·普罗德摩尔就在副本的入口处。"
Inst91Quest1_Prequest = "痛苦灵魂的回声("..YELLOW.."灵魂洪炉"..WHITE..")"
Inst91Quest1_Folgequest = "通向堡垒之路"
-- No Rewards for this quest

--Quest 2 Alliance
Inst91Quest2 = "2. 通向堡垒之路"
Inst91Quest2_Aim = "解救15名联盟奴隶，消灭熔炉领主加弗斯特。"
Inst91Quest2_Location = "吉安娜·普罗德摩尔(萨隆矿坑; "..YELLOW.."[1']"..WHITE..")"
Inst91Quest2_Note = "奴隶遍布整个矿坑。在击败熔炉之主加弗斯特后，任务可以在 "..YELLOW.."[1]"..WHITE.."处交给马丁·维克图斯。"
Inst91Quest2_Prequest = "萨隆矿坑"
Inst91Quest2_Folgequest = "深渊的裁决"
-- No Rewards for this quest

--Quest 3 Alliance
Inst91Quest3 = "3. 深渊的裁决"
Inst91Quest3_Aim = "杀死天灾领主泰兰努斯。"
Inst91Quest3_Location = "马丁·维克图斯(萨隆矿坑; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_Note = "天灾领主泰兰努斯在副本的尾部。完成这个任务是进入映像大厅的必要条件。\n\n记得在离开之前将任务交给吉安娜·普罗德摩尔。"
Inst91Quest3_Prequest = "通向堡垒之路"
Inst91Quest3_Folgequest = "霜之哀伤("..YELLOW.."映像大厅"..WHITE..")"
--
Inst91Quest3name1 = "寒冰纹章"

--Quest 4 Alliance
Inst91Quest4 = "4. 利剑的重铸"
Inst91Quest4_Aim = "取得5块注能的萨隆邪铁锭和熔炉之主的巨锤，用它们重铸奎尔德拉。"
Inst91Quest4_Location = "卡莱迪斯·亮矛(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst91Quest4_Note = "注能的萨隆邪铁锭散布在萨隆矿坑各处。使用从熔炉领主加弗斯特那里掉落的锤子，在他附近的铁砧上使用它。"
Inst91Quest4_Prequest = "去见卡莱迪斯·亮矛"
Inst91Quest4_Folgequest = "锻造利剑("..YELLOW.."灵魂洪炉"..WHITE..")"
-- No Rewards for this quest


--Quest 1 Horde
Inst91Quest1_HORDE = "1. 萨隆矿坑"
Inst91Quest1_HORDE_Aim = "在萨隆矿坑和希尔瓦娜斯·风行者见面。"
Inst91Quest1_HORDE_Location = "希尔瓦娜斯·风行者(灵魂洪炉; "..YELLOW.."[2]"..WHITE..")"
Inst91Quest1_HORDE_Note = "希尔瓦娜斯·风行者就在副本的入口处。"
Inst91Quest1_HORDE_Prequest = "痛苦灵魂的回声("..YELLOW.."灵魂洪炉"..WHITE..")"
Inst91Quest1_HORDE_Folgequest = "通向堡垒之路"
-- No Rewards for this quest

--Quest 2 Horde
Inst91Quest2_HORDE = "2. 通向堡垒之路"
Inst91Quest2_HORDE_Aim = "解救15名部落奴隶，消灭熔炉领主加弗斯特。"
Inst91Quest2_HORDE_Location = "希尔瓦娜斯·风行者(萨隆矿坑; "..YELLOW.."[1']"..WHITE..")"
Inst91Quest2_HORDE_Note = "奴隶遍布整个矿坑。在击败熔炉之主加弗斯特后，任务可以在 "..YELLOW.."[2]"..WHITE.."处交给戈库恩·铁颅"
Inst91Quest2_HORDE_Prequest = "萨隆矿坑"
Inst91Quest2_HORDE_Folgequest = "深渊的裁决"
-- No Rewards for this quest

--Quest 3 Horde
Inst91Quest3_HORDE = "3. 深渊的裁决"
Inst91Quest3_HORDE_Aim = "杀死天灾领主泰兰努斯。"
Inst91Quest3_HORDE_Location = "戈库恩·铁颅(萨隆矿坑; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_HORDE_Note = "天灾领主泰兰努斯在副本的尾部。完成这个任务是进入映像大厅的必要条件。\n\n记得在离开之前将任务交给希尔瓦娜斯·风行者。"
Inst91Quest3_HORDE_Prequest = "通向堡垒之路"
Inst91Quest3_HORDE_Folgequest = "霜之哀伤("..YELLOW.."映像大厅"..WHITE..")"
--
Inst91Quest3name1_HORDE = "寒冰纹章"

--Quest 4 Horde
Inst91Quest4_HORDE = "4. 利剑的重铸"
Inst91Quest4_HORDE_Aim = "取得5块注能的萨隆邪铁锭和熔炉之主的巨锤，用它们重铸奎尔德拉。"
Inst91Quest4_HORDE_Location = "麦雷昂·阳炎(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst91Quest4_HORDE_Note = "注能的萨隆邪铁锭散布在萨隆矿坑各处。使用从熔炉领主加弗斯特那里掉落的锤子，在他附近的铁砧上使用它。"
Inst91Quest4_HORDE_Prequest = "去见麦雷昂·阳炎"
Inst91Quest4_HORDE_Folgequest = "锻造利剑("..YELLOW.."灵魂洪炉"..WHITE..")"
-- No Rewards for this quest



--------------- INST92 - Halls of Reflection (HoR)  ---------------

Inst92Story = "With Jaina and Sylvanas leading the way, adventurers who make it as far as these frigid halls will quickly recognize the weapon that lies ahead: Frostmourne, the corruptive, legendary device of the Lich King himself. The Lich King's private chambers are within reach, although they may be the death of anyone who ventures there."
Inst92Caption = "映像大厅"
Inst92QAA = "3个任务"
Inst92QAH = "3个任务"

--Quest 1 Alliance
Inst92Quest1 = "1. 霜之哀伤"
Inst92Quest1_Aim = "在映像大厅的入口与吉安娜女士汇合。"
Inst92Quest1_Location = "吉安娜·普罗德摩尔(萨隆矿坑; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_Note = "你可以从萨隆矿坑的尾部的吉安娜·普罗德摩尔那里获得这个任务，然后通过进入映像大厅来完成它。确保在继续之前，所有队伍成员都已经提交了任务。事件完成后，会给出后续任务。"
Inst92Quest1_Prequest = "深渊的裁决("..YELLOW.."萨隆矿坑"..WHITE..")"
Inst92Quest1_Folgequest = "巫妖王之怒"
-- No Rewards for this quest

--Quest 2 Alliance
Inst92Quest2 = "2. 巫妖王之怒"
Inst92Quest2_Aim = "找到吉安娜·普罗德摩尔，并逃出映像大厅。"
Inst92Quest2_Location = "映像大厅"
Inst92Quest2_Note = "吉安娜·普罗德摩尔就在前方。在超级另人惊叹的事件结束后，你可以把任务交给她。"
Inst92Quest2_Prequest = "霜之哀伤"
Inst92Quest2_Folgequest = "无"
--
Inst92Quest2name1 = "寒冰纹章"

--Quest 3 Alliance
Inst92Quest3 = "3. 映像大厅"
Inst92Quest3_Aim = "将淬火的奎尔德拉带到映像大厅里面的剑冢去。"
Inst92Quest3_Location = "卡莱迪斯·亮矛(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst92Quest3_Note = "你可以在副本内部完成这个任务。"
Inst92Quest3_Prequest = "锻造利剑("..YELLOW.."灵魂洪炉"..WHITE..")"
Inst92Quest3_Folgequest = "太阳之井之旅"
-- No Rewards for this quest


--Quest 1 Horde
Inst92Quest1_HORDE = "1. 霜之哀伤"
Inst92Quest1_HORDE_Aim = "在映像大厅的入口与希尔瓦娜斯汇合。"
Inst92Quest1_HORDE_Location = "希尔瓦娜斯·风行者(萨隆矿坑; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_HORDE_Note = "你可以从萨隆矿坑的尾部的希尔瓦娜斯·风行者那里获得这个任务，然后通过进入映像大厅来完成它。确保在继续之前，所有队伍成员都已经提交了任务。事件完成后，会给出后续任务。"
Inst92Quest1_HORDE_Prequest = "深渊的裁决("..YELLOW.."萨隆矿坑"..WHITE..")"
Inst92Quest1_HORDE_Folgequest = "巫妖王之怒"
-- No Rewards for this quest

--Quest 2 Horde
Inst92Quest2_HORDE = "2. 巫妖王之怒"
Inst92Quest2_HORDE_Aim = "找到希尔瓦娜斯·风行者，并逃出映像大厅。"
Inst92Quest2_HORDE_Location = "映像大厅"
Inst92Quest2_HORDE_Note = "希尔瓦娜斯·风行者就在前方。在超级另人惊叹的事件结束后，你可以把任务交给她。"
Inst92Quest2_HORDE_Prequest = "霜之哀伤"
Inst92Quest2_HORDE_Folgequest = "无"
--
Inst92Quest2name1_HORDE = "寒冰纹章"

--Quest 3 Horde
Inst92Quest3_HORDE = "3. 映像大厅"
Inst92Quest3_HORDE_Aim = "将淬火的奎尔德拉带到映像大厅里面的剑冢去。"
Inst92Quest3_HORDE_Location = "麦雷昂·阳炎(冰冠冰川 - 奎尔德拉之墓; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst92Quest3_HORDE_Note = "你可以在副本内部完成这个任务。"
Inst92Quest3_HORDE_Prequest = "锻造利剑("..YELLOW.."灵魂洪炉"..WHITE..")"
Inst92Quest3_HORDE_Folgequest = "太阳之井之旅"
-- No Rewards for this quest



--------------- INST93 - Icecrown Citadel (ICC)  ---------------

Inst93Story = "After breaching the fortress, players will face a legion of undead guards directed to repel any invaders. Commanding the defenders is Lord Marrowgar, a monstrosity fused together from the bones of the undead. Supreme Overseer of the Cult of the Damned, Lady Deathwhisper is the next opponent. She bolsters the faith of her followers by promising them the opportunity to give eternal service in undeath.\n\nAs they continue their ascent, the Alliance and Horde heroes ultimately end up outside of the citadel where their hatred for one another erupts into a battle for dominance over the Rampart of Skulls. Players will join in battle alongside High Overlord Saurfang on the Orgrim's Hammer gunship or Muradin Bronzebeard on The Skybreaker in a unique encounter. Each faction will protect its gunship and try to destroy the other one in a back-and-forth battle to see who is truly worthy of facing the Lich King."
Inst93Caption = "冰冠堡垒"
Inst93QAA = "15个任务"
Inst93QAH = "15个任务"

--Quest 1 Alliance
Inst93Quest1 = "1. 消灭玛洛加尔领主！(每周)"
Inst93Quest1_Aim = "消灭玛洛加尔领主。"
Inst93Quest1_Location = "大法师兰达洛克(达拉然 - 紫罗兰监狱; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst93Quest1_Note = "玛洛加尔领主在 "..YELLOW.." [1]"..WHITE.."。\n\n每周团队任务每周可以完成一次，可以选择10人或25人模式完成。"
Inst93Quest1_Prequest = "无"
Inst93Quest1_Folgequest = "无"
--
Inst93Quest1name1 = "寒冰纹章"
Inst93Quest1name2 = "凯旋纹章"

--Quest 2 Alliance
Inst93Quest2 = "2. 思想净化(每周随机)"
Inst93Quest2_Aim = "击败亡语者女士，同时确保达尔纳文活着。"
Inst93Quest2_Location = "内线米查尔(冰冠堡垒; "..YELLOW.."靠近 [1]"..WHITE..")"
Inst93Quest2_Note = "如果这个任务对你的团队ID可用，那么在你杀死玛洛加尔领主后，内线米查尔。\n\n在亡语者女士战斗中，达尔纳文会出现。为了完成任务，整个战斗过程中他必须保持活着。"
Inst93Quest2_Prequest = "无"
Inst93Quest2_Folgequest = "无"
--
Inst93Quest2name1 = "冰霜珍宝袋"

--Quest 3 Alliance
Inst93Quest3 = "3. 保卫城墙(每周随机)"
Inst93Quest3_Aim = "消灭腐烂的冰霜巨人。"
Inst93Quest3_Location = "破天号将领(冰冠堡垒; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_Note = "如果这个任务对你的团队ID可用，那么当你在亡语者女士之后击败第一波小怪时，破天号将领会出现。\n\n腐烂的冰霜巨人可以在城墙的巡逻中找到。"
Inst93Quest3_Prequest = "无"
Inst93Quest3_Folgequest = "无"
--
Inst93Quest3name1 = "冰霜珍宝袋"

--Quest 4 Alliance
Inst93Quest4 = "4. 药剂融合(每周随机)"
Inst93Quest4_Aim = "承受了橙色和绿色毒气之后，返回到采炼师阿德里安娜那里。"
Inst93Quest4_Location = "采炼师阿德里安娜(冰冠堡垒; "..GREEN.."[4']"..WHITE..")"
Inst93Quest4_Note = "如果这个任务对你的团队ID可用，那么当你在死亡使者萨鲁法尔过后激活传送门时，采炼师阿德里安娜会出现。\n\n为了完成任务，至少有一名团队成员必须从烂肠和腐面那里获得减益效果，并在获得第一个减益效果后的30分钟内返回给采炼师阿德里安娜。所有带有此任务的团队成员都会获得任务完成的认证。"
Inst93Quest4_Page = {2, "减益效果在死亡、登出、神圣干涉和神圣护盾以及可能的其他技能后会消失。使用假死并存活的猎人将保留减益效果。", };
Inst93Quest4_Prequest = "无"
Inst93Quest4_Folgequest = "无"
--
Inst93Quest4name1 = "冰霜珍宝袋"

--Quest 5 Alliance
Inst93Quest5 = "5. 鲜血涌动(每周随机)"
Inst93Quest5_Aim = "在内线米查尔被处死之前将他救出来。"
Inst93Quest5_Location = "敏捷的埃尔林(冰冠堡垒; 血色大厅入口)"
Inst93Quest5_Note = "如果这个任务对于你的团队ID是可用的，敏捷的埃尔林会在血色大厅的入口出现。\n\n从进入血色大厅开始，你有30分钟的计时器。你必须在计时器耗尽之前清除所有小怪，击败鲜血王子和鲜血女王兰娜瑟尔，以完成这个任务。"
Inst93Quest5_Prequest = "无"
Inst93Quest5_Folgequest = "无"
--
Inst93Quest5name1 = "冰霜珍宝袋"

--Quest 6 Alliance
Inst93Quest6 = "6. 痛苦灵魂的安息(每周随机)"
Inst93Quest6_Aim = "使用生命水晶，保护辛达苟萨的灵魂。"
Inst93Quest6_Location = "踏梦者瓦莉瑟瑞娅(冰冠堡垒; "..YELLOW.."[14]"..WHITE..")"
Inst93Quest6_Note = "如果这个任务对于你的团队ID是可用的，当你完成那场战斗后，踏梦者瓦莉瑟瑞娅会给你这个任务。\n\n为了完成这个任务，团队成员必须在辛达苟萨的血量降至20%或更低时，使用提供的物品在她身上堆叠debuff（10人团队为30层，25人团队为75层）。如果成功并且辛达苟萨在死亡前获得了灵魂庇护光环，那么任务就算完成了。"
Inst93Quest6_Prequest = "无"
Inst93Quest6_Folgequest = "无"
--
Inst93Quest6name1 = "冰霜珍宝袋"

--Quest 7 Alliance
Inst93Quest7 = "7. 神圣的和堕落的"
Inst93Quest7_Aim = "将圣光的复仇、25块源生萨隆邪铁、腐面的酸性血液和烂肠的酸性血液放进冰冠堡垒大领主莫格莱尼的符文熔炉中。"
Inst93Quest7_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest7_Note = "这个任务线只对战士、圣骑士和死亡骑士开放。大领主莫格莱尼的符文熔炉位于冰冠堡垒的入口。\n\n腐面的酸性血液和烂肠的酸性血液只从25人模式中掉落，并且每次团队锁定只能由一名玩家拾取。"
Inst93Quest7_Prequest = "无"
Inst93Quest7_Folgequest = "影锋"
-- No Rewards for this quest

--Quest 8 Alliance
Inst93Quest8 = "8. 影锋"
Inst93Quest8_Aim = "等待莫格莱尼锻造你的武器。"
Inst93Quest8_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest8_Note = "观看莫格莱尼锻造你的武器，并在他完成后收取它。"
Inst93Quest8_Prequest = "神圣的和堕落的"
Inst93Quest8_Folgequest = "灵魂盛宴"
--
Inst93Quest8name1 = "影锋"

--Quest 9 Alliance
Inst93Quest9 = "9. 灵魂盛宴"
Inst93Quest9_Aim = "大领主达里安·莫格莱尼希望你用影锋在冰冠堡垒消灭1000个巫妖王的爪牙。灵魂可以在10人或25人难度中获得。"
Inst93Quest9_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest9_Note = "你有很多击杀要做。只有在冰冠堡垒中的击杀才能算入1000。"
Inst93Quest9_Prequest = "影锋"
Inst93Quest9_Folgequest = "注入邪恶"
-- No Rewards for this quest

--Quest 10 Alliance
Inst93Quest10 = "10. 注入邪恶"
Inst93Quest10_Aim = "大领主达里安·莫格莱尼要你用邪恶能量灌注影锋，并杀死普崔塞德教授。"
Inst93Quest10_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest10_Note = "这个任务只能在25人模式下完成。\n\n在普崔塞德教授的战斗中，你必须控制憎恶并使用一个叫做“暗影灌注”的特殊能力来为影锋注能。"
Inst93Quest10_Prequest = "灵魂盛宴"
Inst93Quest10_Folgequest = "鲜血灌注"
-- No Rewards for this quest

--Quest 11 Alliance
Inst93Quest11 = "11. 鲜血灌注"
Inst93Quest11_Aim = "大领主达里安·莫格莱尼要你使用鲜血灌注影锋，并击败鲜血女王兰娜瑟尔。"
Inst93Quest11_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest11_Note = "这个任务只能在25人模式下完成。\n\n为了完成任务，你需要获得鲜血镜像的减益效果。然后，假设你不是第一个被咬的，让第一个被咬的人咬你。然后你再咬三个人，并在战斗中存活下来，任务就完成了。"
Inst93Quest11_Prequest = "注入邪恶"
Inst93Quest11_Folgequest = "冰霜灌注"
-- No Rewards for this quest

--Quest 12 Alliance
Inst93Quest12 = "12. 冰霜灌注"
Inst93Quest12_Aim = "大领主达里安·莫格莱尼对你做出了指示，他要你在使用影锋与辛达苟萨战斗时，经受住辛达苟萨的四次气息攻击，然后再杀死她。"
Inst93Quest12_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest12_Note = "这个任务只能在25人模式下完成。\n\n在从四次吐息攻击中获得凝霜之剑增益效果后，你必须在6分钟内击败辛达苟萨来完成这个任务。"
Inst93Quest12_Prequest = "鲜血灌注"
Inst93Quest12_Folgequest = "碎裂的王座"
-- No Rewards for this quest

--Quest 13 Alliance
Inst93Quest13 = "13. 碎裂的王座"
Inst93Quest13_Aim = "大领主达里安·莫格莱尼要你收集50块影霜碎片。"
Inst93Quest13_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest13_Note = "这个任务只能在25人模式下完成。\n\n影霜碎片是首领的稀有掉落物。"
Inst93Quest13_Prequest = "冰霜灌注"
Inst93Quest13_Folgequest = "影之哀伤……"
-- No Rewards for this quest

--Quest 14 Alliance
Inst93Quest14 = "14. 影之哀伤……"
Inst93Quest14_Aim = "大领主达里安·莫格莱尼想要你将影锋带给他。"
Inst93Quest14_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest14_Note = "这个任务将升级你的影锋为影之哀伤。"
Inst93Quest14_Prequest = "碎裂的王座"
Inst93Quest14_Folgequest = "巫妖王最后的阵地"
--
Inst93Quest14name1 = "影之哀伤"

--Quest 15 Alliance
Inst93Quest15 = "15. 巫妖王最后的阵地"
Inst93Quest15_Aim = "冰冠堡垒中的大领主达里安·莫格莱尼希望你去消灭巫妖王。"
Inst93Quest15_Location = "大领主达里安·莫格莱尼(冰冠堡垒; "..GREEN.."[1']"..WHITE..")"
Inst93Quest15_Note = "这个任务只能在25人模式下完成。"
Inst93Quest15_Prequest = "影之哀伤……"
Inst93Quest15_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst93Quest1_HORDE = Inst93Quest1
Inst93Quest1_HORDE_Aim = Inst93Quest1_Aim
Inst93Quest1_HORDE_Location = Inst93Quest1_Location
Inst93Quest1_HORDE_Note = Inst93Quest1_Note
Inst93Quest1_HORDE_Prequest = Inst93Quest1_Prequest
Inst93Quest1_HORDE_Folgequest = Inst93Quest1_Folgequest
--
Inst93Quest1name1_HORDE = Inst93Quest1name1
Inst93Quest1name2_HORDE = Inst93Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst93Quest2_HORDE = Inst93Quest2
Inst93Quest2_HORDE_Aim = Inst93Quest2_Aim
Inst93Quest2_HORDE_Location = Inst93Quest2_Location
Inst93Quest2_HORDE_Note = Inst93Quest2_Note
Inst93Quest2_HORDE_Prequest = Inst93Quest2_Prequest
Inst93Quest2_HORDE_Folgequest = Inst93Quest2_Folgequest
--
Inst93Quest2name1_HORDE = Inst93Quest2name1

--Quest 3 Horde
Inst93Quest3_HORDE = "3. 保卫城墙(每周随机)"
Inst93Quest3_HORDE_Aim = "消灭腐烂的冰霜巨人。"
Inst93Quest3_HORDE_Location = "库卡隆将领(冰冠堡垒; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_HORDE_Note = "这是在冰冠堡垒中可用的五个随机任务之一。如果这个任务对你的团队ID可用，当你在亡语者女士之后击败第一波小怪时，库卡隆将领将会出现。\n\n腐烂的冰霜巨人可以在城墙的巡逻中找到。"
Inst93Quest3_HORDE_Prequest = "无"
Inst93Quest3_HORDE_Folgequest = "无"
--
Inst93Quest3name1_HORDE = "冰霜珍宝袋"

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst93Quest4_HORDE = Inst93Quest4
Inst93Quest4_HORDE_Aim = Inst93Quest4_Aim
Inst93Quest4_HORDE_Location = Inst93Quest4_Location
Inst93Quest4_HORDE_Note = Inst93Quest4_Note
Inst93Quest4_HORDE_Page = Inst93Quest4_Page
Inst93Quest4_HORDE_Prequest = Inst93Quest4_Prequest
Inst93Quest4_HORDE_Folgequest = Inst93Quest4_Folgequest
--
Inst93Quest4name1_HORDE = Inst93Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst93Quest5_HORDE = Inst93Quest5
Inst93Quest5_HORDE_Aim = Inst93Quest5_Aim
Inst93Quest5_HORDE_Location = Inst93Quest5_Location
Inst93Quest5_HORDE_Note = Inst93Quest5_Note
Inst93Quest5_HORDE_Prequest = Inst93Quest5_Prequest
Inst93Quest5_HORDE_Folgequest = Inst93Quest5_Folgequest
--
Inst93Quest5name1_HORDE = Inst93Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst93Quest6_HORDE = Inst93Quest6
Inst93Quest6_HORDE_Aim = Inst93Quest6_Aim
Inst93Quest6_HORDE_Location = Inst93Quest6_Location
Inst93Quest6_HORDE_Note = Inst93Quest6_Note
Inst93Quest6_HORDE_Prequest = Inst93Quest6_Prequest
Inst93Quest6_HORDE_Folgequest = Inst93Quest6_Folgequest
--
Inst93Quest6name1_HORDE = Inst93Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst93Quest7_HORDE = Inst93Quest7
Inst93Quest7_HORDE_Aim = Inst93Quest7_Aim
Inst93Quest7_HORDE_Location = Inst93Quest7_Location
Inst93Quest7_HORDE_Note = Inst93Quest7_Note
Inst93Quest7_HORDE_Prequest = Inst93Quest7_Prequest
Inst93Quest7_HORDE_Folgequest = Inst93Quest7_Folgequest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst93Quest8_HORDE = Inst93Quest8
Inst93Quest8_HORDE_Aim = Inst93Quest8_Aim
Inst93Quest8_HORDE_Location = Inst93Quest8_Location
Inst93Quest8_HORDE_Note = Inst93Quest8_Note
Inst93Quest8_HORDE_Prequest = Inst93Quest8_Prequest
Inst93Quest8_HORDE_Folgequest = Inst93Quest8_Folgequest
--
Inst93Quest8name1_HORDE = Inst93Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst93Quest9_HORDE = Inst93Quest9
Inst93Quest9_HORDE_Aim = Inst93Quest9_Aim
Inst93Quest9_HORDE_Location = Inst93Quest9_Location
Inst93Quest9_HORDE_Note = Inst93Quest9_Note
Inst93Quest9_HORDE_Prequest = Inst93Quest9_Prequest
Inst93Quest9_HORDE_Folgequest = Inst93Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst93Quest10_HORDE = Inst93Quest10
Inst93Quest10_HORDE_Aim = Inst93Quest10_Aim
Inst93Quest10_HORDE_Location = Inst93Quest10_Location
Inst93Quest10_HORDE_Note = Inst93Quest10_Note
Inst93Quest10_HORDE_Prequest = Inst93Quest10_Prequest
Inst93Quest10_HORDE_Folgequest = Inst93Quest10_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst93Quest11_HORDE = Inst93Quest11
Inst93Quest11_HORDE_Aim = Inst93Quest11_Aim
Inst93Quest11_HORDE_Location = Inst93Quest11_Location
Inst93Quest11_HORDE_Note = Inst93Quest11_Note
Inst93Quest11_HORDE_Prequest = Inst93Quest11_Prequest
Inst93Quest11_HORDE_Folgequest = Inst93Quest11_Folgequest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst93Quest12_HORDE = Inst93Quest12
Inst93Quest12_HORDE_Aim = Inst93Quest12_Aim
Inst93Quest12_HORDE_Location = Inst93Quest12_Location
Inst93Quest12_HORDE_Note = Inst93Quest12_Note
Inst93Quest12_HORDE_Prequest = Inst93Quest12_Prequest
Inst93Quest12_HORDE_Folgequest = Inst93Quest12_Folgequest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst93Quest13_HORDE = Inst93Quest13
Inst93Quest13_HORDE_Aim = Inst93Quest13_Aim
Inst93Quest13_HORDE_Location = Inst93Quest13_Location
Inst93Quest13_HORDE_Note = Inst93Quest13_Note
Inst93Quest13_HORDE_Prequest = Inst93Quest13_Prequest
Inst93Quest13_HORDE_Folgequest = Inst93Quest13_Folgequest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst93Quest14_HORDE = Inst93Quest14
Inst93Quest14_HORDE_Aim = Inst93Quest14_Aim
Inst93Quest14_HORDE_Location = Inst93Quest14_Location
Inst93Quest14_HORDE_Note = Inst93Quest14_Note
Inst93Quest14_HORDE_Prequest = Inst93Quest14_Prequest
Inst93Quest14_HORDE_Folgequest = Inst93Quest14_Folgequest
--
Inst93Quest14name1_HORDE = Inst93Quest14name1
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst93Quest15_HORDE = Inst93Quest15
Inst93Quest15_HORDE_Aim = Inst93Quest15_Aim
Inst93Quest15_HORDE_Location = Inst93Quest15_Location
Inst93Quest15_HORDE_Note = Inst93Quest15_Note
Inst93Quest15_HORDE_Prequest = Inst93Quest15_Prequest
Inst93Quest15_HORDE_Folgequest = Inst93Quest15_Folgequest
-- No Rewards for this quest



--------------- INST94 - Ruby Sanctum (RS)  ---------------

Inst94Story = "A powerful war party of the Black Dragonflight, led by the fearsome Twilight dragon, Halion, have launched an assault upon the Ruby Sanctum beneath Wyrmrest Temple. By destroying the sanctum, the Black Dragonflight look to crush those that would stand in the way of their masters reemergence into Azeroth and to ultimately shatter the Wyrmrest Accord  the sacred bond that unites the dragonflights.\n\nThe battle that is to come will surely deal a crippling blow to the Red Dragonflight, however, it is up to you to stop this unprecedented offensive and defend the Ruby Sanctum. First you must face the assault of Halion's servants, Saviana Ragefire, Baltharus the Warborn, and General Zarithrian, before squaring off against Halion the Twilight Destroyer, a new and deadly force in this realm."
Inst94Caption = "红玉圣殿"
Inst94QAA = "3个任务"
Inst94QAH = "3个任务"

--Quest 1 Alliance
Inst94Quest1 = "1. 龙眠之灾"
Inst94Quest1_Aim = "前往龙骨荒野，和龙眠神殿中的克拉苏斯交谈。"
Inst94Quest1_Location = "罗宁(达拉然 - 紫罗兰城堡; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst94Quest1_Note = "克拉苏斯在(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")。"
Inst94Quest1_Prequest = "无"
Inst94Quest1_Folgequest = "突袭红玉圣殿"
-- No Rewards for this quest

--Quest 2 Alliance
Inst94Quest2 = "2. 突袭红玉圣殿"
Inst94Quest2_Aim = "调查龙眠神殿之下的红玉圣殿。"
Inst94Quest2_Location = "克拉苏斯(龙骨荒野 - 龙眠神殿; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst94Quest2_Note = "圣殿守卫赫蕾丝塔萨在红玉圣殿内，并在你击败位于 "..YELLOW.."[1]"..WHITE.."的第二个次级首领战争之子巴尔萨鲁斯之后出现。"
Inst94Quest2_Prequest = "龙眠之灾(可选)"
Inst94Quest2_Folgequest = "暮光毁灭者"
-- No Rewards for this quest

--Quest 3 Alliance
Inst94Quest3 = "3. 暮光毁灭者"
Inst94Quest3_Aim = "击败海里昂和入侵红玉圣殿的敌人。"
Inst94Quest3_Location = "圣殿守卫赫蕾丝塔萨(红玉圣殿; "..YELLOW.."[A] 入口"..WHITE..")"
Inst94Quest3_Note = "海里昂是主要首领，位于 "..YELLOW.."[4]"..WHITE.."。"
Inst94Quest3_Prequest = "龙眠之灾"
Inst94Quest3_Folgequest = "无"
--
Inst94Quest3name1 = "寒冰纹章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst94Quest1_HORDE = Inst94Quest1
Inst94Quest1_HORDE_Aim = Inst94Quest1_Aim
Inst94Quest1_HORDE_Location = Inst94Quest1_Location
Inst94Quest1_HORDE_Note = Inst94Quest1_Note
Inst94Quest1_HORDE_Prequest = Inst94Quest1_Prequest
Inst94Quest1_HORDE_Folgequest = Inst94Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst94Quest2_HORDE = Inst94Quest2
Inst94Quest2_HORDE_Aim = Inst94Quest2_Aim
Inst94Quest2_HORDE_Location = Inst94Quest2_Location
Inst94Quest2_HORDE_Note = Inst94Quest2_Note
Inst94Quest2_HORDE_Prequest = Inst94Quest2_Prequest
Inst94Quest2_HORDE_Folgequest = Inst94Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst94Quest3_HORDE = Inst94Quest3
Inst94Quest3_HORDE_Aim = Inst94Quest3_Aim
Inst94Quest3_HORDE_Location = Inst94Quest3_Location
Inst94Quest3_HORDE_Note = Inst94Quest3_Note
Inst94Quest3_HORDE_Prequest = Inst94Quest3_Prequest
Inst94Quest3_HORDE_Folgequest = Inst94Quest3_Folgequest
--
Inst94Quest3name1_HORDE = Inst94Quest3name1





end
-- End of File
