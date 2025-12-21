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


------------  TBC CLASSIC  ------------

-- 40 = DUNGEON: Hellfire Ramparts
-- 41 = DUNGEON: Blood Furnace
-- 42 = DUNGEON: Shattered Halls
-- 43 = RAID: Magtheridon's Lair
-- 44 = DUNGEON: The Slave Pens
-- 45 = DUNGEON: The Steamvault
-- 46 = DUNGEON: The Underbog
-- 47 = DUNGEON: Auchenai Crypts
-- 48 = DUNGEON: Mana Tombs
-- 49 = DUNGEON: Sethekk Halls
-- 50 = DUNGEON: Shadow Labyrinth
-- 51 = RAID: Serpentshrine Cavern
-- 52 = DUNGEON: Black Morass
-- 53 = RAID: Battle of Mount Hyjal
-- 54 = DUNGEON: Old Hillsbrad
-- 55 = RAID: Gruul's Lair
-- 56 = RAID: Karazhan
-- 57 = DUNGEON: The Arcatraz
-- 58 = DUNGEON: Botanica
-- 59 = DUNGEON: The Mechanar
-- 60 = BATTLEGROUND: Eye of the Storm
-- 61 = RAID: The Eye
-- 62 = RAID: Black Temple
-- 63 = RAID: Zul'Aman
-- 65 = OUTDOOR: Skettis
-- 67 = DUNGEON: Magisters' Terrace
-- 68 = RAID: Sunwell Plateau




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





--------------- INST40 - Hellfire Ramparts ---------------

Inst40Caption = "地狱火城墙"
Inst40QAA = "3个任务"
Inst40QAH = "3个任务"

--Quest 1 Alliance
Inst40Quest1 = "1. 攻陷城墙"
Inst40Quest1_Aim = "杀死巡视者加戈玛、无疤者奥摩尔和座龙纳杉，并将加戈玛之手、奥摩尔之蹄和纳杉之颅交给地狱火半岛上的荣耀堡内的冈尼。"
Inst40Quest1_Location = "卡德维克中尉(地狱火半岛 - 荣耀堡; "..YELLOW.."56.6, 66.4"..WHITE..")"
Inst40Quest1_Note = "巡视者加戈玛在 "..YELLOW.."[1]"..WHITE.."，无疤者奥摩尔在 "..YELLOW.."[2]"..WHITE.."以及座龙纳杉在 "..YELLOW.."[3]"..WHITE.."。冈尼在(地狱火半岛 - 荣耀堡; "..YELLOW.."56.4, 66.6"..WHITE.."). \n\n为了获得这个任务，你必须完成“邪恶的咒语”，该任务始于远征军指挥官达纳斯·托尔贝恩(地狱火半岛 - 荣耀堡; "..YELLOW.."56.6, 66.6"..WHITE..")处的“知己知彼”。"
Inst40Quest1_Prequest = "知己知彼 -> 邪恶的咒语"
Inst40Quest1_Folgequest = "愤怒之心("..YELLOW.."HFC:鲜血熔炉"..WHITE..")"
--
Inst40Quest1name1 = "精确手甲"
Inst40Quest1name2 = "翡翠战士肩铠"
Inst40Quest1name3 = "魔法力量护肩"
Inst40Quest1name4 = "稳步皮靴"

--Quest 2 Alliance
Inst40Quest2 = "2. 黑暗之潮"
Inst40Quest2_Aim = "将不祥的信件交给地狱火半岛上荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst40Quest2_Location = "不祥的信件(掉落自传令官瓦兹德; "..YELLOW.."[3]"..WHITE..")"
Inst40Quest2_Note = "远征军指挥官达纳斯·托尔贝恩在荣耀堡的 "..YELLOW.."56.6, 66.6"..WHITE.."。"
Inst40Quest2_Prequest = "无"
Inst40Quest2_Folgequest = "鲜血就是生命("..YELLOW.."HFC:鲜血熔炉"..WHITE..")"
-- No Rewards for this quest

--Quest 3 Alliance
Inst40Quest3 = "3. 悬赏：纳杉的骑鞭"
Inst40Quest3_Aim = "商人扎雷姆要求你夺得纳杉的骑鞭。将骑鞭带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst40Quest3_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst40Quest3_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n纳杉是最后的首领。"
Inst40Quest3_Prequest = "无"
Inst40Quest3_Folgequest = "无"
--
Inst40Quest3name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPCs and pre-quest)
Inst40Quest1_HORDE = Inst40Quest1
Inst40Quest1_HORDE_Aim = "杀死巡视者加戈玛、无疤者奥摩尔和座龙纳杉，并将加戈玛之手、奥摩尔之蹄和纳杉之颅交给地狱火半岛上的萨尔玛内的卡萨雷兹。"
Inst40Quest1_HORDE_Location = "石头守卫斯托克顿(地狱火半岛 - 萨尔玛; "..YELLOW.."55.2, 36.0"..WHITE..")"
Inst40Quest1_HORDE_Note = "巡视者加戈玛在 "..YELLOW.."[1]"..WHITE.."，无疤者奥摩尔在 "..YELLOW.."[2]"..WHITE.."以及座龙纳杉在 "..YELLOW.."[3]"..WHITE.."。冈尼在(地狱火半岛 - 荣耀堡; "..YELLOW.."56.4, 66.6"..WHITE..")。\n\n为了获得这个任务，你必须完成“机甲残骸”，这个任务开始于你在诅咒之地的黑暗之门获得的“跨越黑暗之门”任务。"
Inst40Quest1_HORDE_Prequest = "跨越黑暗之门 -> 机甲残骸"
Inst40Quest1_HORDE_Folgequest = Inst40Quest1_Folgequest
--
Inst40Quest1name1_HORDE = Inst40Quest1name1
Inst40Quest1name2_HORDE = Inst40Quest1name2
Inst40Quest1name3_HORDE = Inst40Quest1name3
Inst40Quest1name4_HORDE = Inst40Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst40Quest2_HORDE = Inst40Quest2
Inst40Quest2_HORDE_Aim = "将不祥的信件交给地狱火半岛上萨尔玛的纳兹格雷尔。"
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "纳兹格雷尔在萨尔玛的 "..YELLOW.."55.0, 36.0"..WHITE.."。"
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst40Quest3_HORDE = Inst40Quest3
Inst40Quest3_HORDE_Aim = Inst40Quest3_Aim
Inst40Quest3_HORDE_Location = Inst40Quest3_Location
Inst40Quest3_HORDE_Note = Inst40Quest3_Note
Inst40Quest3_HORDE_Prequest = Inst40Quest3_Prequest
Inst40Quest3_HORDE_Folgequest = Inst40Quest3_Folgequest
--
Inst40Quest3name1_HORDE = Inst40Quest3name1



--------------- INST41 - Blood Furnace ---------------

Inst41Caption = "鲜血熔炉"
Inst41QAA = "3个任务"
Inst41QAH = "3个任务"

--Quest 1 Alliance
Inst41Quest1 = "1. 鲜血就是生命"
Inst41Quest1_Aim = "收集10份邪兽人血样，把它们交给地狱火半岛上的荣耀堡内的冈尼。"
Inst41Quest1_Location = "冈尼(地狱火半岛 - 荣耀堡; "..YELLOW.."56,67"..WHITE..")"
Inst41Quest1_Note = "所有在鲜血熔炉的兽人都可以掉落血样。"
Inst41Quest1_Prequest = "黑暗之潮("..YELLOW.."地狱火城墙"..WHITE..")"
Inst41Quest1_Folgequest = "无"
--
Inst41Quest1name1 = "惩戒胸甲"
Inst41Quest1name2 = "致命钻孔虫护腿"
Inst41Quest1name3 = "枭兽头饰"
Inst41Quest1name4 = "缀鳞毁灭护腿"

--Quest 2 Alliance
Inst41Quest2 = "2. 愤怒之心"
Inst41Quest2_Aim = "全面调查鲜血熔炉，然后向地狱火半岛上的荣耀堡内的远征军指挥官达纳斯·托尔贝恩汇报。"
Inst41Quest2_Location = "冈尼(地狱火半岛 - 荣耀堡; "..YELLOW.."56,67"..WHITE..")."
Inst41Quest2_Note = "任务在最后一个首领的房间内完成。远征军指挥官达纳斯·托尔贝恩位于荣耀堡的 "..YELLOW.."57,67"..WHITE.."。"
Inst41Quest2_Prequest = "攻陷城墙("..YELLOW.."地狱火城墙"..WHITE..")"
Inst41Quest2_Folgequest = "无"
--
Inst41Quest2name1 = "清澈火红坠饰"
Inst41Quest2name2 = "神圣治疗指环"
Inst41Quest2name3 = "完美平衡斗篷"

--Quest 3 Alliance
Inst41Quest3 = "3. 悬赏：克里丹的羽饰法杖"
Inst41Quest3_Aim = "商人扎雷姆要求你夺得克里丹的羽饰法杖。将法杖带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst41Quest3_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst41Quest3_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n击碎者克里丹在 "..YELLOW.."[3]"..WHITE.."。"
Inst41Quest3_Prequest = "无"
Inst41Quest3_Folgequest = "无"
--
Inst41Quest3name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPC to turn in)
Inst41Quest1_HORDE = Inst41Quest1
Inst41Quest1_HORDE_Aim = "收集10份邪兽人血样，把它们交给地狱火半岛上的萨尔玛内的卡萨雷兹。"
Inst41Quest1_HORDE_Location = "卡萨雷兹(地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE..")"
Inst41Quest1_HORDE_Note = Inst41Quest1_Note
Inst41Quest1_HORDE_Prequest = Inst41Quest1_Prequest
Inst41Quest1_HORDE_Folgequest = Inst41Quest1_Folgequest
--
Inst41Quest1name1_HORDE = Inst41Quest1name1
Inst41Quest1name2_HORDE = Inst41Quest1name2
Inst41Quest1name3_HORDE = Inst41Quest1name3
Inst41Quest1name4_HORDE = Inst41Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst41Quest2_HORDE = Inst41Quest2
Inst41Quest2_HORDE_Aim = "全面调查鲜血熔炉，然后向地狱火半岛上的萨尔玛内的纳兹格雷尔汇报。"
Inst41Quest2_HORDE_Location = "卡萨雷兹(地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE..")"
Inst41Quest2_HORDE_Note = "任务在最后一个首领的房间内完成。纳兹格雷尔位于地狱火半岛 - 萨尔玛的 ("..YELLOW.."55,36"..WHITE..")。"
Inst41Quest2_HORDE_Prequest = Inst41Quest2_Prequest
Inst41Quest2_HORDE_Folgequest = Inst41Quest2_Folgequest
--
Inst41Quest2name1_HORDE = Inst41Quest2name1
Inst41Quest2name2_HORDE = Inst41Quest2name2
Inst41Quest2name3_HORDE = Inst41Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst41Quest3_HORDE = Inst41Quest3
Inst41Quest3_HORDE_Aim = Inst41Quest3_Aim
Inst41Quest3_HORDE_Location = Inst41Quest3_Location
Inst41Quest3_HORDE_Note = Inst41Quest3_Note
Inst41Quest3_HORDE_Prequest = Inst41Quest3_Prequest
Inst41Quest3_HORDE_Folgequest = Inst41Quest3_Folgequest
--
Inst41Quest3name1_HORDE = Inst41Quest3name1



--------------- INST42 - Shattered Halls ---------------

Inst42Caption = "破碎大厅"
Inst42QAA = "10个任务"
Inst42QAH = "9个任务"

--Quest 1 Alliance
Inst42Quest1 = "1. 邪能灰烬"
Inst42Quest1_Aim = "荣耀堡的大法师萨布兰希要求你给她带回一块邪能灰烬。"
Inst42Quest1_Location = "大法师萨布兰希(地狱火半岛 - 荣耀堡; "..YELLOW.."54,66"..WHITE..")"
Inst42Quest1_Note = "在击败高阶术士奈瑟库斯后，位于 "..YELLOW.."[2]"..WHITE.."，他会掉落一个护符。在他的王座附近的一个火盆使用护符来获得邪能灰烬。"
Inst42Quest1_Prequest = "无"
Inst42Quest1_Folgequest = "无"
--
Inst42Quest1name1 = "助理牧师长靴"
Inst42Quest1name2 = "符文蚀刻腰带"
Inst42Quest1name3 = "维护手套"
Inst42Quest1name4 = "远征军斥候护肩"
Inst42Quest1name5 = "无惧护手"

--Quest 2 Alliance
Inst42Quest2 = "2. 邪部落的荣耀"
Inst42Quest2_Aim = "荣耀堡的战地指挥官洛姆斯要求你杀死8名碎手军团士兵、4名碎手百夫长和4名碎手勇士。"
Inst42Quest2_Location = "战地指挥官洛姆斯(地狱火半岛 - 荣耀堡; "..YELLOW.."57,63"..WHITE..")"
Inst42Quest2_Note = "你会在斗技大厅里找到这些百夫长。"
Inst42Quest2_Prequest = "无"
Inst42Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. 扭转战局"
Inst42Quest3_Aim = "将卡加斯酋长之拳交给荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst42Quest3_Location = "远征军指挥官达纳斯·托尔贝恩(地狱火半岛 - 荣耀堡; "..YELLOW.."57,67"..WHITE..")"
Inst42Quest3_Note = "酋长卡加斯·刃拳在 "..YELLOW.."[5]"..WHITE.."。"
Inst42Quest3_Prequest = "无"
Inst42Quest3_Folgequest = "无"
--
Inst42Quest3name1 = "奈瑟库斯的痛苦魔杖"
Inst42Quest3name2 = "苏醒斗篷"
Inst42Quest3name3 = "纳利库的复仇"
Inst42Quest3name4 = "警醒卫士勋章"

--Quest 4 Alliance
Inst42Quest4 = "4. 堡垒中的囚徒"
Inst42Quest4_Aim = "在地狱火堡垒内的奥琳娜上尉被处决前救出她。"
Inst42Quest4_Location = "兰迪·维兹普罗克(破碎大厅; "..YELLOW.."英雄 [1]"..WHITE..")"
Inst42Quest4_Note = "需要英雄地下城难度。\n\n奥琳娜上尉在 "..YELLOW.."[5]"..WHITE.."。在射手事件开始时，计时器开始，持续55分钟。"
Inst42Quest4_Prequest = "无"
Inst42Quest4_Folgequest = "无"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. 纳鲁的试炼：仁慈"
Inst42Quest5_Aim = "沙塔斯城的阿达尔要求你从地狱火堡垒的破碎大厅中取回未使用的刽子手之斧。"
Inst42Quest5_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest5_Note = "需要英雄地下城难度。\n\n这个任务曾经是进入风暴要塞: 风暴要塞的必要条件，但现在已经不再需要了。"
Inst42Quest5_Prequest = "无"
Inst42Quest5_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. 大地之母的眼泪"
Inst42Quest6_Aim = "从战争使者沃姆罗格手中夺得大地之母的眼泪，将它交给韦恩的避难所的戴维·韦恩。"
Inst42Quest6_Location = "戴维·韦恩(泰罗卡森林 - 韦恩的避难所; "..YELLOW.."78,39"..WHITE..")。"
Inst42Quest6_Note = "战争使者沃姆罗格在 "..YELLOW.."[4]"..WHITE.."。\n\n这个物品在普通和英雄模式下都会掉落。"
Inst42Quest6_Prequest = "能源舰的热源("..YELLOW.."风暴要塞: 能源舰"..WHITE..") & 魔语辞典("..YELLOW.."奥金顿: 暗影迷宫"..WHITE..")"
Inst42Quest6_Folgequest = "伊利达雷的斩除者"
-- No Rewards for this quest

--Quest 7 Alliance
Inst42Quest7 = "7. 卡琳娜的要求(英雄)"
Inst42Quest7_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德。"
Inst42Quest7_Location = "卡琳娜·拉瑟德(虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst42Quest7_Note = "需要英雄地下城难度。\n\n高阶术士奈瑟库斯在 "..YELLOW.."[2]"..WHITE.."。忘却之名在塞泰克大厅掉落。"
Inst42Quest7_Prequest = "同事的帮助("..YELLOW.."卡拉赞"..WHITE..")"
Inst42Quest7_Folgequest = "夜之魇("..YELLOW.."卡拉赞"..WHITE..")"
-- No Rewards for this quest

--Quest 8 Alliance
Inst42Quest8 = "8. 悬赏：刃拳的印记"
Inst42Quest8_Aim = "商人扎雷姆要求你夺得刃拳的印记。将印记带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst42Quest8_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst42Quest8_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n酋长卡加斯·刃拳在 "..YELLOW.."[5]"..WHITE.."。"
Inst42Quest8_Prequest = "无"
Inst42Quest8_Folgequest = "无"
--
Inst42Quest8name1 = "公正徽章"

--Quest 9 Alliance
Inst42Quest9 = "9. 悬赏：碎手百夫长"
Inst42Quest9_Aim = "虚空猎手玛哈杜恩要求你杀死4名碎手百夫长。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst42Quest9_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst42Quest9_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst42Quest9_Prequest = "无"
Inst42Quest9_Folgequest = "无"
--
Inst42Quest9name1 = "复仇军监牢钥匙"

--Quest 10 Alliance
Inst42Quest10 = "10. 堡垒的钥匙"
Inst42Quest10_Aim = "将原始钥匙模具交给地狱火半岛荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst42Quest10_Location = "原始钥匙模具(掉落自​铁匠戈伦克，在影月谷 - 阿塔玛平台; "..YELLOW.."68,36"..WHITE..")"
Inst42Quest10_Note = "掉落原始钥匙模具的铁匠非常容易单刷，而且如果你有飞行坐骑的话，非常容易到达。\n\n远征军指挥官达纳斯·托尔贝恩在(地狱火半岛 - 荣耀堡; "..YELLOW.."57,67"..WHITE..")。他会指引你前往达姆菲大师进行下一部分的任务，位于(地狱火半岛 - 荣耀堡; "..YELLOW.."51,60"..WHITE..")。"
Inst42Quest10_Prequest = "无"
Inst42Quest10_Folgequest = "达姆菲大师 -> 比地狱更炎热"
--
Inst42Quest10name1 = "破碎大厅钥匙"


--Quest 1 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst42Quest1_HORDE = "1. 邪部落的荣耀"
Inst42Quest1_HORDE_Aim = "萨尔玛的暗影猎手塔金要求你杀死8名碎手军团士兵、4名碎手百夫长和4名碎手勇士。"
Inst42Quest1_HORDE_Location = "暗影猎手塔金(地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE..")"
Inst42Quest1_HORDE_Note = Inst42Quest2_Note
Inst42Quest1_HORDE_Prequest = Inst42Quest2_Prequest
Inst42Quest1_HORDE_Folgequest = Inst42Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst42Quest2_HORDE = "2. 酋长的意志"
Inst42Quest2_HORDE_Aim = "将卡加斯酋长之拳交给萨尔玛的纳兹格雷尔。"
Inst42Quest2_HORDE_Location = "纳兹格雷尔(地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE..")"
Inst42Quest2_HORDE_Note = "酋长卡加斯·刃拳位于 "..YELLOW.."[5]"..WHITE.."。"
Inst42Quest2_HORDE_Prequest = "无"
Inst42Quest2_HORDE_Folgequest = "无"
--
Inst42Quest2name1_HORDE = "恐怖暗影魔杖"
Inst42Quest2name2_HORDE = "代理牧师披风"
Inst42Quest2name3_HORDE = "胜利者指环"
Inst42Quest2name4_HORDE = "重拳的项圈"

--Quest 3 Horde
Inst42Quest3_HORDE = "3. 堡垒中的囚徒(英雄)"
Inst42Quest3_HORDE_Aim = "在地狱火堡垒内的沙塔·碎骨上尉被处决前救出他。"
Inst42Quest3_HORDE_Location = "德雷希拉(破碎大厅; "..YELLOW.."英雄 [1]"..WHITE..")"
Inst42Quest3_HORDE_Note = "需要英雄地下城难度。\n\n沙塔·碎骨上尉在 "..YELLOW.."[5]"..WHITE.."。在射手事件开始时，计时器开始，持续55分钟。"
Inst42Quest3_HORDE_Prequest = "无"
Inst42Quest3_HORDE_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst42Quest4_HORDE = "4. 纳鲁的试炼：仁慈(英雄)"
Inst42Quest4_HORDE_Aim = Inst42Quest5_Aim
Inst42Quest4_HORDE_Location = Inst42Quest5_Location
Inst42Quest4_HORDE_Note = Inst42Quest5_Note
Inst42Quest4_HORDE_Prequest = Inst42Quest5_Prequest
Inst42Quest4_HORDE_Folgequest = Inst42Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst42Quest5_HORDE = "5. 大地之母的眼泪"
Inst42Quest5_HORDE_Aim = Inst42Quest6_Aim
Inst42Quest5_HORDE_Location = Inst42Quest6_Location
Inst42Quest5_HORDE_Note = Inst42Quest6_Note
Inst42Quest5_HORDE_Prequest = Inst42Quest6_Prequest
Inst42Quest5_HORDE_Folgequest = Inst42Quest6_Folgequest
-- No Rewards for this quest

--Quest 6 Alliance  (same as Quest 7 Alliance)
Inst42Quest6_HORDE = "6. 卡琳娜的要求(英雄)"
Inst42Quest6_HORDE_Aim = Inst42Quest7_Aim
Inst42Quest6_HORDE_Location = Inst42Quest7_Location
Inst42Quest6_HORDE_Note = Inst42Quest7_Note
Inst42Quest6_HORDE_Prequest = Inst42Quest7_Prequest
Inst42Quest6_HORDE_Folgequest = Inst42Quest7_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 8 Alliance)
Inst42Quest7_HORDE = "7. 悬赏：刃拳的印记"
Inst42Quest7_HORDE_Aim = Inst42Quest8_Aim
Inst42Quest7_HORDE_Location = Inst42Quest8_Location
Inst42Quest7_HORDE_Note = Inst42Quest8_Note
Inst42Quest7_HORDE_Prequest = Inst42Quest8_Prequest
Inst42Quest7_HORDE_Folgequest = Inst42Quest8_Folgequest
--
Inst42Quest7name1_HORDE = Inst42Quest8name1

--Quest 8 Horde  (same as Quest 9 Alliance)
Inst42Quest8_HORDE = "8. 悬赏：碎手百夫长"
Inst42Quest8_HORDE_Aim = Inst42Quest9_Aim
Inst42Quest8_HORDE_Location = Inst42Quest9_Location
Inst42Quest8_HORDE_Note = Inst42Quest9_Note
Inst42Quest8_HORDE_Prequest = Inst42Quest9_Prequest
Inst42Quest8_HORDE_Folgequest = Inst42Quest9_Folgequest
--
Inst42Quest8name1_HORDE = Inst42Quest9name1

--Quest 9 Horde
Inst42Quest9_HORDE = "9. 堡垒的钥匙"
Inst42Quest9_HORDE_Aim = "将原始钥匙模具交给地狱火半岛萨尔玛的纳兹格雷尔。"
Inst42Quest9_HORDE_Location = "原始钥匙模具(掉落自​铁匠戈伦克，在影月谷 - 阿塔玛平台; "..YELLOW.."68,36"..WHITE..")"
Inst42Quest9_HORDE_Note = "掉落原始钥匙模具的铁匠非常容易单刷，而且如果你有飞行坐骑的话，非常容易到达。\n\n纳兹格雷尔在(地狱火半岛 - 萨尔玛; "..YELLOW.."55,36"..WHITE.."). 他会指引你前往罗霍克大师进行下一部分的任务，位于(地狱火半岛 - 萨尔玛; "..YELLOW.."53,38"..WHITE..")。"
Inst42Quest9_HORDE_Prequest = "无"
Inst42Quest9_HORDE_Folgequest = "罗霍克大师 -> 比地狱更炎热"
--
Inst42Quest9name1_HORDE = "破碎大厅钥匙"



--------------- INST43 - Magtheridon's Lair ---------------

Inst43Caption = "玛瑟里顿的巢穴"
Inst43QAA = "2个任务"
Inst43QAH = "2个任务"

--Quest 1 Alliance
Inst43Quest1 = "1. 纳鲁的试炼：玛瑟里顿"
Inst43Quest1_Aim = "沙塔斯城的阿达尔要求你杀死玛瑟里顿。"
Inst43Quest1_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst43Quest1_Note = "为了接这个任务，你必须完成纳鲁的试炼：仁慈、纳鲁的试炼：力量和纳鲁的试炼：坚韧，这些任务都可以从阿达尔那里获得。\n\n这个任务过去是进入风暴要塞: 风暴要塞所必需的，但现在已经不再需要了。"
Inst43Quest1_Prequest = "纳鲁的试炼：坚韧，仁慈 & 力量 任务。"
Inst43Quest1_Folgequest = "无"
--
Inst43Quest1name1 = "凤凰火焰指环"

--Quest 2 Alliance
Inst43Quest2 = "2. 玛瑟里顿之死"
Inst43Quest2_Aim = "将玛瑟里顿的徽记交给荣耀堡的远征军指挥官达纳斯·托尔贝恩。"
Inst43Quest2_Location = "玛瑟里顿的徽记(掉落自玛瑟里顿; "..YELLOW.."[1]"..WHITE..")"
Inst43Quest2_Note = "只有团队中的一个人可以赢得这个头颅来开始这个任务。远征军指挥官达纳斯·托尔贝恩在 "..YELLOW.."57,67"..WHITE.."。"
Inst43Quest2_Prequest = "无"
Inst43Quest2_Folgequest = "无"
--
Inst43Quest2name1 = "阿达尔的防御徽记"
Inst43Quest2name2 = "赤红怒火指环"
Inst43Quest2name3 = "纳鲁圣光卫士指环"
Inst43Quest2name4 = "反抗之戒"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst43Quest1_HORDE = Inst43Quest1
Inst43Quest1_HORDE_Aim = Inst43Quest1_Aim
Inst43Quest1_HORDE_Location = Inst43Quest1_Location
Inst43Quest1_HORDE_Note = Inst43Quest1_Note
Inst43Quest1_HORDE_Prequest = Inst43Quest1_Prequest
Inst43Quest1_HORDE_Folgequest = Inst43Quest1_Folgequest
--
Inst43Quest1name1_HORDE = Inst43Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst43Quest2_HORDE = Inst43Quest2
Inst43Quest2_HORDE_Aim = "将玛瑟里顿的徽记交给萨尔玛的纳兹格雷尔。"
Inst43Quest2_HORDE_Location = Inst43Quest2_Location
Inst43Quest2_HORDE_Note = "只有团队中的一个人可以赢得这个头颅来开始这个任务。纳兹格雷尔在 "..YELLOW.."55,36"..WHITE.."。"
Inst43Quest2_HORDE_Prequest = Inst43Quest2_Prequest
Inst43Quest2_HORDE_Folgequest = Inst43Quest2_Folgequest
--
Inst43Quest2name1_HORDE = Inst43Quest2name1
Inst43Quest2name2_HORDE = Inst43Quest2name2
Inst43Quest2name3_HORDE = Inst43Quest2name3
Inst43Quest2name4_HORDE = Inst43Quest2name4



--------------- INST44 - The Slave Pens ---------------

Inst44Caption = "奴隶围栏"
Inst44QAA = "7个任务"
Inst44QAH = "7个任务"

--Quest 1 Alliance
Inst44Quest1 = "1. 失踪的同伴"
Inst44Quest1_Aim = "查明缚地者雷葛、博学者拜特、除草者格林萨姆和唤风者克劳恩的下落，然后返回赞加沼泽的盘牙水库，向观察者杰哈恩复命。"
Inst44Quest1_Location = "观察者杰哈恩(盘牙水库; "..YELLOW.."52,36"..WHITE..")"
Inst44Quest1_Note = "观察者杰哈恩在水下洞穴的召唤石处。除草者格林萨姆在 "..YELLOW.."[2]"..WHITE.."以及博学者拜特在 "..YELLOW.."[5]"..WHITE.."。这个任务在幽暗沼泽中继续。前置任务是可选的。"
Inst44Quest1_Prequest = "抽水泵结构图 -> 失踪的先遣队"
Inst44Quest1_Folgequest = "无"
--
Inst44Quest1name1 = "塞纳里奥施法戒指"
Inst44Quest1name2 = "金藤护腕"
Inst44Quest1name3 = "沼泽黑暗披风"

--Quest 2 Alliance
Inst44Quest2 = "2. 悬赏：夸格米拉之心"
Inst44Quest2_Aim = "商人扎雷姆要求你取回夸格米拉之心。将心脏带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst44Quest2_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst44Quest2_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n夸格米拉在 "..YELLOW.."[6]"..WHITE.."。"
Inst44Quest2_Prequest = "无"
Inst44Quest2_Folgequest = "无"
--
Inst44Quest2name1 = "公正徽章"

--Quest 3 Alliance
Inst44Quest3 = "3. 卡达什圣杖(英雄)"
Inst44Quest3_Aim = "将土灵徽记和灿烂徽记交给盘牙水库奴隶围栏的异教徒斯卡希斯。"
Inst44Quest3_Location = "异教徒斯卡希斯(奴隶围栏; "..YELLOW.."英雄 [4]"..WHITE..")"
Inst44Quest3_Note = "土灵徽记掉落于"..YELLOW.."格鲁尔的巢穴"..WHITE.."，而灿烂徽记则掉落于"..YELLOW.."卡拉赞"..WHITE.."中的夜之魇。\n\n这个任务曾经是进入毒蛇神殿的要求，但现在不再需要。"
Inst44Quest3_Prequest = "无"
Inst44Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst44Quest4 = "4. 冰霜之王埃霍恩(季节性)"
Inst44Quest4_Aim = "前往赞加沼泽盘牙水库的奴隶围栏，与努玛·云女谈一谈。 "
Inst44Quest4_Location = "大地之环长者(位于所有主城的仲夏节篝火旁)"
Inst44Quest4_Note = "努玛·云女就在奴隶围栏的入口处。这个任务不需要完成召唤埃霍恩任务。如果您的等级是65或更高，而没有做任何相关的任务，您仍然可以召唤他。"
Inst44Quest4_Prequest = "反常的活动 -> 通知长者"
Inst44Quest4_Folgequest = "埃霍恩就在这里！"
-- No Rewards for this quest

--Quest 5 Alliance
Inst44Quest5 = "5. 埃霍恩就在这里！(季节性)"
Inst44Quest5_Aim = "前往奴隶围栏，寻找鲁玛·天母的下落。"
Inst44Quest5_Location = "努玛·云女(奴隶围栏; "..YELLOW.."入口处"..WHITE..")"
Inst44Quest5_Note = "鲁玛·天母在 "..YELLOW.."[1]"..WHITE.."附近。你不必完成任何其他季节性任务才能获得这个任务。前置任务是可选的。"
Inst44Quest5_Prequest = "冰霜之王埃霍恩(可选)"
Inst44Quest5_Folgequest = "召唤埃霍恩"
-- No Rewards for this quest

--Quest 6 Alliance
Inst44Quest6 = "6. 召唤埃霍恩(日常 - 季节性)"
Inst44Quest6_Aim = "将大地之环熔岩图腾带到寒冰之石旁边去。"
Inst44Quest6_Location = "鲁玛·天母(奴隶围栏; "..YELLOW.."[1]"..WHITE.."附近)"
Inst44Quest6_Note = "寒冰之石距离鲁玛·天母很近。完成这个任务会在 "..YELLOW.."[1]"..WHITE.."召唤埃霍恩。每个角色每天可以完成一次。"
Inst44Quest6_Prequest = "埃霍恩就在这里！"
Inst44Quest6_Folgequest = "无"
-- No Rewards for this quest

--Quest 7 Alliance
Inst44Quest7 = "7. 埃霍恩的碎片(季节性)"
Inst44Quest7_Aim = "将寒冰碎片交给鲁玛·天母。"
Inst44Quest7_Location = "埃霍恩的碎片(在杀死冰霜之王埃霍恩之后，从寒冰之柜中掉落)"
Inst44Quest7_Note = "鲁玛·天母在 (奴隶围栏; "..YELLOW.." [1]"..WHITE.."附近)。此物品每个角色每年只会掉落一次。"
Inst44Quest7_Prequest = "无"
Inst44Quest7_Folgequest = "无"
--
Inst44Quest7name1 = "夏日天空战袍"
Inst44Quest7name2 = "夏日烈焰战袍"
Inst44Quest7name3 = "燃烧之花"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst44Quest1_HORDE = Inst44Quest1
Inst44Quest1_HORDE_Aim = Inst44Quest1_Aim
Inst44Quest1_HORDE_Location = Inst44Quest1_Location
Inst44Quest1_HORDE_Note = Inst44Quest1_Note
Inst44Quest1_HORDE_Prequest = Inst44Quest1_Prequest
Inst44Quest1_HORDE_Folgequest = Inst44Quest1_Folgequest
--
Inst44Quest1name1_HORDE = Inst44Quest1name1
Inst44Quest1name2_HORDE = Inst44Quest1name2
Inst44Quest1name3_HORDE = Inst44Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst44Quest2_HORDE = Inst44Quest2
Inst44Quest2_HORDE_Aim = Inst44Quest2_Aim
Inst44Quest2_HORDE_Location = Inst44Quest2_Location
Inst44Quest2_HORDE_Note = Inst44Quest2_Note
Inst44Quest2_HORDE_Prequest = Inst44Quest2_Prequest
Inst44Quest2_HORDE_Folgequest = Inst44Quest2_Folgequest
--
Inst44Quest2name1_HORDE = Inst44Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst44Quest3_HORDE = Inst44Quest3
Inst44Quest3_HORDE_Aim = Inst44Quest3_Aim
Inst44Quest3_HORDE_Location = Inst44Quest3_Location
Inst44Quest3_HORDE_Note = Inst44Quest3_Note
Inst44Quest3_HORDE_Prequest = Inst44Quest3_Prequest
Inst44Quest3_HORDE_Folgequest = Inst44Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst44Quest4_HORDE = Inst44Quest4
Inst44Quest4_HORDE_Aim = Inst44Quest4_Aim
Inst44Quest4_HORDE_Location = Inst44Quest4_Location
Inst44Quest4_HORDE_Note = Inst44Quest4_Note
Inst44Quest4_HORDE_Prequest = Inst44Quest4_Prequest
Inst44Quest4_HORDE_Folgequest = Inst44Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst44Quest5_HORDE = Inst44Quest5
Inst44Quest5_HORDE_Aim = Inst44Quest5_Aim
Inst44Quest5_HORDE_Location = Inst44Quest5_Location
Inst44Quest5_HORDE_Note = Inst44Quest5_Note
Inst44Quest5_HORDE_Prequest = Inst44Quest5_Prequest
Inst44Quest5_HORDE_Folgequest = Inst44Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst44Quest6_HORDE = Inst44Quest6
Inst44Quest6_HORDE_Aim = Inst44Quest6_Aim
Inst44Quest6_HORDE_Location = Inst44Quest6_Location
Inst44Quest6_HORDE_Note = Inst44Quest6_Note
Inst44Quest6_HORDE_Prequest = Inst44Quest6_Prequest
Inst44Quest6_HORDE_Folgequest = Inst44Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst44Quest7_HORDE = Inst44Quest7
Inst44Quest7_HORDE_Aim = Inst44Quest7_Aim
Inst44Quest7_HORDE_Location = Inst44Quest7_Location
Inst44Quest7_HORDE_Note = Inst44Quest7_Note
Inst44Quest7_HORDE_Prequest = Inst44Quest7_Prequest
Inst44Quest7_HORDE_Folgequest = Inst44Quest7_Folgequest
--
Inst44Quest7name1_HORDE = Inst44Quest7name1
Inst44Quest7name2_HORDE = Inst44Quest7name2
Inst44Quest7name3_HORDE = Inst44Quest7name3



--------------- INST45 - The Steamvault ---------------

Inst45Caption = "蒸汽地窟"
Inst45QAA = "7个任务"
Inst45QAH = "7个任务"

--Quest 1 Alliance
Inst45Quest1 = "1. 督军的末日"
Inst45Quest1_Aim = "观察者杰哈恩要求你找到并杀死盘牙水库的督军卡利瑟里斯。"
Inst45Quest1_Location = "观察者杰哈恩(盘牙水库; "..YELLOW.."52,36"..WHITE..")"
Inst45Quest1_Note = "观察者杰哈恩在水下洞穴的召唤石处。督军卡利瑟里斯在 "..YELLOW.."[4]"..WHITE.."。确保在卡利瑟里斯使用坦克时摧毁它们。"
Inst45Quest1_Prequest = "无"
Inst45Quest1_Folgequest = "无"
--
Inst45Quest1name1 = "水术师头巾"
Inst45Quest1name2 = "利爪头盔"
Inst45Quest1name3 = "大地守卫者的兜帽"
Inst45Quest1name4 = "侍从的头饰"

--Quest 2 Alliance
Inst45Quest2 = "2. 瓦丝琪的命令"
Inst45Quest2_Aim = "将瓦丝琪女王的命令交给赞加沼泽塞纳里奥庇护所的伊谢尔·风歌。"
Inst45Quest2_Location = "瓦丝琪女王的命令(随机掉落于蒸汽地窟)"
Inst45Quest2_Note = "伊谢尔·风歌在赞加沼泽 - 塞纳里奥庇护所; ("..YELLOW.."78,62"..WHITE..")。后续的任务使您可以提交盘牙武器以获取塞纳里奥远征队的声望。 盘牙军备随机掉落于蒸汽地窖和毒蛇神殿，并且可以在完成这个任务之前收集（但不能上交）。它们不会绑定，因此可以从其他玩家那里交易或购买。"
Inst45Quest2_Prequest = "无"
Inst45Quest2_Folgequest = "战争准备"
-- No Rewards for this quest

--Quest 3 Alliance
Inst45Quest3 = "3. 纳鲁的试炼：力量(英雄)"
Inst45Quest3_Aim = "沙塔斯城的阿达尔要求你取回卡利瑟里斯的三叉戟和摩摩尔的精华。"
Inst45Quest3_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst45Quest3_Note = "需要英雄地下城难度。督军卡利瑟里斯在 "..YELLOW.."[4]"..WHITE.."。摩摩尔的精华来自暗影迷宫。\n\n这个任务过去是进入风暴要塞: 风暴要塞的必要条件，但现在不再需要了。"
Inst45Quest3_Prequest = "无"
Inst45Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst45Quest4 = "4. 地下的土壤"
Inst45Quest4_Aim = "从水术师瑟丝比娅手中夺得水下洞穴的沃土，将它交给韦恩的避难所的戴维·韦恩。"
Inst45Quest4_Location = "戴维·韦恩(泰罗卡森林 - 韦恩的避难所; "..YELLOW.."78,39"..WHITE..")"
Inst45Quest4_Note = "水术师瑟丝比娅在 "..YELLOW.."[1]"..WHITE.."。\n\n这个物品在普通和英雄模式下都会掉落。"
Inst45Quest4_Prequest = "能源舰的热源("..YELLOW.."风暴要塞: 能源舰"..WHITE..") & 魔语辞典("..YELLOW.."奥金顿: 暗影迷宫"..WHITE..")"
Inst45Quest4_Folgequest = "伊利达雷的斩除者"
-- No Rewards for this quest

--Quest 5 Alliance
Inst45Quest5 = "5. 第二块和第三块"
Inst45Quest5_Aim = "从盘牙水库内的一个奥术容器中拿到第二块钥匙碎片，从风暴要塞内的一个奥术容器中拿到第三块钥匙碎片。任务完成之后向沙塔斯城的卡德加复命。"
Inst45Quest5_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst45Quest5_Note = "这是卡拉赞进入资格任务系列的一部分。奥术容器位于 "..YELLOW.."[2]"..WHITE.."，在一片水池的底部。打开它将会召唤一个元素生物，你必须击败它才能得到碎片。第三个钥匙碎片在禁魔监狱里。"
Inst45Quest5_Prequest = "卡拉赞的钥匙("..YELLOW.."奥金顿: 暗影迷宫"..WHITE..")"
Inst45Quest5_Folgequest = "麦迪文的触摸("..YELLOW.."时光之穴: 黑色沼泽"..WHITE..")"
-- No Rewards for this quest

--Quest 6 Alliance
Inst45Quest6 = "6. 悬赏：盘牙侍从"
Inst45Quest6_Aim = "虚空猎手玛哈杜恩要求你杀死14名盘牙侍从。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst45Quest6_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst45Quest6_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst45Quest6_Prequest = "无"
Inst45Quest6_Folgequest = "无"
--
Inst45Quest6name1 = "复仇军监牢钥匙"

--Quest 7 Alliance
Inst45Quest7 = "7. 悬赏：督军的论文"
Inst45Quest7_Aim = "商人扎雷姆要求你夺得督军的论文。将论文带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst45Quest7_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst45Quest7_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n督军卡利瑟里斯在 "..YELLOW.."[4]"..WHITE.."。"
Inst45Quest7_Prequest = "无"
Inst45Quest7_Folgequest = "无"
--
Inst45Quest7name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst45Quest1_HORDE = Inst45Quest1
Inst45Quest1_HORDE_Aim = Inst45Quest1_Aim
Inst45Quest1_HORDE_Location = Inst45Quest1_Location
Inst45Quest1_HORDE_Note = Inst45Quest1_Note
Inst45Quest1_HORDE_Prequest = Inst45Quest1_Prequest
Inst45Quest1_HORDE_Folgequest = Inst45Quest1_Folgequest
--
Inst45Quest1name1_HORDE = Inst45Quest1name1
Inst45Quest1name2_HORDE = Inst45Quest1name2
Inst45Quest1name3_HORDE = Inst45Quest1name3
Inst45Quest1name4_HORDE = Inst45Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst45Quest2_HORDE = Inst45Quest2
Inst45Quest2_HORDE_Aim = Inst45Quest2_Aim
Inst45Quest2_HORDE_Location = Inst45Quest2_Location
Inst45Quest2_HORDE_Note = Inst45Quest2_Note
Inst45Quest2_HORDE_Prequest = Inst45Quest2_Prequest
Inst45Quest2_HORDE_Folgequest = Inst45Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst45Quest3_HORDE = Inst45Quest3
Inst45Quest3_HORDE_Aim = Inst45Quest3_Aim
Inst45Quest3_HORDE_Location = Inst45Quest3_Location
Inst45Quest3_HORDE_Note = Inst45Quest3_Note
Inst45Quest3_HORDE_Prequest = Inst45Quest3_Prequest
Inst45Quest3_HORDE_Folgequest = Inst45Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst45Quest4_HORDE = Inst45Quest4
Inst45Quest4_HORDE_Aim = Inst45Quest4_Aim
Inst45Quest4_HORDE_Location = Inst45Quest4_Location
Inst45Quest4_HORDE_Note = Inst45Quest4_Note
Inst45Quest4_HORDE_Prequest = Inst45Quest4_Prequest
Inst45Quest4_HORDE_Folgequest = Inst45Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst45Quest5_HORDE = Inst45Quest5
Inst45Quest5_HORDE_Aim = Inst45Quest5_Aim
Inst45Quest5_HORDE_Location = Inst45Quest5_Location
Inst45Quest5_HORDE_Note = Inst45Quest5_Note
Inst45Quest5_HORDE_Prequest = Inst45Quest5_Prequest
Inst45Quest5_HORDE_Folgequest = Inst45Quest5_Folgequest
Inst45Quest5PreQuest_HORDE = Inst45Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst45Quest6_HORDE = Inst45Quest6
Inst45Quest6_HORDE_Aim = Inst45Quest6_Aim
Inst45Quest6_HORDE_Location = Inst45Quest6_Location
Inst45Quest6_HORDE_Note = Inst45Quest6_Note
Inst45Quest6_HORDE_Prequest = Inst45Quest6_Prequest
Inst45Quest6_HORDE_Folgequest = Inst45Quest6_Folgequest
--
Inst45Quest6name1_HORDE = Inst45Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst45Quest7_HORDE = Inst45Quest7
Inst45Quest7_HORDE_Aim = Inst45Quest7_Aim
Inst45Quest7_HORDE_Location = Inst45Quest7_Location
Inst45Quest7_HORDE_Note = Inst45Quest7_Note
Inst45Quest7_HORDE_Prequest = Inst45Quest7_Prequest
Inst45Quest7_HORDE_Folgequest = Inst45Quest7_Folgequest
--
Inst45Quest7name1_HORDE = Inst45Quest7name1



--------------- INST46 - The Underbog ---------------

Inst46Caption = "幽暗沼泽"
Inst46QAA = "5个任务"
Inst46QAH = "5个任务"

--Quest 1 Alliance
Inst46Quest1 = "1. 失踪的同伴"
Inst46Quest1_Aim = "查明缚地者雷葛、博学者拜特、除草者格林萨姆和唤风者克劳恩的下落，然后返回赞加沼泽的盘牙水库，向观察者杰哈恩复命。"
Inst46Quest1_Location = "观察者杰哈恩(盘牙水库; "..YELLOW.."52,36"..WHITE..")"
Inst46Quest1_Note = "观察者杰哈恩在水下洞穴的召唤石处。缚地者雷葛在 "..YELLOW.."[3]"..WHITE.."，唤风者克劳恩在 "..YELLOW.."[4]"..WHITE.."。这个任务似乎不需要完成前置任务就可以获得。"
Inst46Quest1_Prequest = "抽水泵结构图 -> 失踪的先遣队"
Inst46Quest1_Folgequest = "无"
--
Inst46Quest1name1 = "塞纳里奥施法戒指"
Inst46Quest1name2 = "金藤护腕"
Inst46Quest1name3 = "沼泽黑暗披风"

--Quest 2 Alliance
Inst46Quest2 = "2. 孢子叶"
Inst46Quest2_Aim = "将一片幽暗孢子叶交给赞加沼泽孢子村的塔苏。"
Inst46Quest2_Location = "塔苏(赞加沼泽 - 孢子村; "..YELLOW.."19,49"..WHITE..")"
Inst46Quest2_Note = "你必须和孢子村达到中立关系才能接受这个任务。孢子叶就在霍加尔芬的背后，位于 "..YELLOW.."[1]"..WHITE.."。"
Inst46Quest2_Prequest = "无"
Inst46Quest2_Folgequest = "无"
--
Inst46Quest2name1 = "无尽幽暗孢子叶"

--Quest 3 Alliance
Inst46Quest3 = "3. 黑色阔步者"
Inst46Quest3_Aim = "将黑色阔步者的大脑交给赞加沼泽孢子村的肯尼克斯。"
Inst46Quest3_Location = "肯尼克斯(赞加沼泽 - 孢子村; "..YELLOW.."19,49"..WHITE..")"
Inst46Quest3_Note = "你必须和孢子村达到中立关系才能接受这个任务。黑色阔步者是最后的首领。"
Inst46Quest3_Prequest = "无"
Inst46Quest3_Folgequest = "无"
--
Inst46Quest3name1 = "灌注精华的蘑菇"
Inst46Quest3name2 = "灌注能量的蘑菇"

--Quest 4 Alliance
Inst46Quest4 = "4. 悬赏：黑色阔步者的卵"
Inst46Quest4_Aim = "商人扎雷姆要求你取回一枚黑色阔步者的卵。将卵带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst46Quest4_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst46Quest4_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n黑色阔步者是最后的首领。"
Inst46Quest4_Prequest = "无"
Inst46Quest4_Folgequest = "无"
--
Inst46Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst46Quest5 = "5. 我要红色木槿！"
Inst46Quest5_Aim = "将5朵红色木槿交给赞加沼泽孢子村的舒特。"
Inst46Quest5_Location = "舒特(赞加沼泽 - 孢子村; "..YELLOW.."19,50"..WHITE..")"
Inst46Quest5_Note = "你必须和孢子村达到友善关系才能接受这个任务。后续任务只是一个可重复的任务，每次提交都可以获得孢子村的声望。红色木槿散布在幽暗沼泽的植物附近，并且也会从沼泽怪物上掉落，包括那些在蒸汽地窖中的怪物。它们也是可以交易的，可以在拍卖行找到。"
Inst46Quest5_Prequest = "无"
Inst46Quest5_Folgequest = "我还要红色木槿！"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst46Quest1_HORDE = Inst46Quest1
Inst46Quest1_HORDE_Aim = Inst46Quest1_Aim
Inst46Quest1_HORDE_Location = Inst46Quest1_Location
Inst46Quest1_HORDE_Note = Inst46Quest1_Note
Inst46Quest1_HORDE_Prequest = Inst46Quest1_Prequest
Inst46Quest1_HORDE_Folgequest = Inst46Quest1_Folgequest
--
Inst46Quest1name1_HORDE = Inst46Quest1name1
Inst46Quest1name2_HORDE = Inst46Quest1name2
Inst46Quest1name3_HORDE = Inst46Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst46Quest2_HORDE = Inst46Quest2
Inst46Quest2_HORDE_Aim = Inst46Quest2_Aim
Inst46Quest2_HORDE_Location = Inst46Quest2_Location
Inst46Quest2_HORDE_Note = Inst46Quest2_Note
Inst46Quest2_HORDE_Prequest = Inst46Quest2_Prequest
Inst46Quest2_HORDE_Folgequest = Inst46Quest2_Folgequest
--
Inst46Quest2name1_HORDE = Inst46Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst46Quest3_HORDE = Inst46Quest3
Inst46Quest3_HORDE_Aim = Inst46Quest3_Aim
Inst46Quest3_HORDE_Location = Inst46Quest3_Location
Inst46Quest3_HORDE_Note = Inst46Quest3_Note
Inst46Quest3_HORDE_Prequest = Inst46Quest3_Prequest
Inst46Quest3_HORDE_Folgequest = Inst46Quest3_Folgequest
--
Inst46Quest3name1_HORDE = Inst46Quest3name1
Inst46Quest3name2_HORDE = Inst46Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst46Quest4_HORDE = Inst46Quest4
Inst46Quest4_HORDE_Aim = Inst46Quest4_Aim
Inst46Quest4_HORDE_Location = Inst46Quest4_Location
Inst46Quest4_HORDE_Note = Inst46Quest4_Note
Inst46Quest4_HORDE_Prequest = Inst46Quest4_Prequest
Inst46Quest4_HORDE_Folgequest = Inst46Quest4_Folgequest
--
Inst46Quest4name1_HORDE = Inst46Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst46Quest5_HORDE = Inst46Quest5
Inst46Quest5_HORDE_Aim = Inst46Quest5_Aim
Inst46Quest5_HORDE_Location = Inst46Quest5_Location
Inst46Quest5_HORDE_Note = Inst46Quest5_Note
Inst46Quest5_HORDE_Prequest = Inst46Quest5_Prequest
Inst46Quest5_HORDE_Folgequest = Inst46Quest5_Folgequest
-- No Rewards for this quest



--------------- INST47 - Auchenai Crypts ---------------

Inst47Caption = "奥金尼地穴"
Inst47QAA = "2个任务"
Inst47QAH = "4个任务"

--Quest 1 Alliance
Inst47Quest1 = "1. 一切都会变好的"
Inst47Quest1_Aim = "奥金顿奥金尼地穴外的奥德里姆斯宗父要你进入奥金尼地穴，消灭大主教玛拉达尔。"
Inst47Quest1_Location = "奥德里姆斯宗父(泰罗卡森林; "..YELLOW.."35,65"..WHITE..")"
Inst47Quest1_Note = "大主教玛拉达尔位于 "..YELLOW.."[2]"..WHITE.."。前置任务线从哈雷开始(泰罗卡森林 - 奥金顿; "..YELLOW.."35,65"..WHITE..")。"
Inst47Quest1_Prequest = "我看到了死德莱尼人 -> 唤魂者利维休斯"
Inst47Quest1_Folgequest = "无"
--
Inst47Quest1name1 = "奥金尼学者长袍"
Inst47Quest1name2 = "奥金尼僧侣外套"
Inst47Quest1name3 = "奥金尼猎手外套"
Inst47Quest1name4 = "主教护卫者"

--Quest 2 Alliance
Inst47Quest2 = "2. 悬赏：主教的灵魂宝钻"
Inst47Quest2_Aim = "商人扎雷姆要求你夺得主教的灵魂宝钻。将宝钻带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst47Quest2_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst47Quest2_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n大主教玛拉达尔在 "..YELLOW.."[2]"..WHITE.."。"
Inst47Quest2_Prequest = "无"
Inst47Quest2_Folgequest = "无"
--
Inst47Quest2name1 = "公正徽章"


--Quest 1 Horde
Inst47Quest1_HORDE = "1. 奥金顿......"
Inst47Quest1_HORDE_Aim = "前往泰罗卡森林白骨荒野的奥金尼地穴，杀死大主教玛拉达尔，解救德欧里的灵魂。"
Inst47Quest1_HORDE_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst47Quest1_HORDE_Note = "大主教玛拉达尔位于 "..YELLOW.."[2]"..WHITE.."。当大主教玛拉达尔被击杀后，德欧里会出现。"
Inst47Quest1_HORDE_Prequest = "拜访盖亚安祖母 -> 谜底揭晓"
Inst47Quest1_HORDE_Folgequest = "灵魂之眼"
-- No Rewards for this quest

--Quest 2 Horde
Inst47Quest2_HORDE = "2. 灵魂之眼"
Inst47Quest2_HORDE_Aim = "在奥金尼地穴中找到一面灵魂之镜，用它召唤纳格兰上古兽人先祖的黑暗之魂。消灭15个黑暗的灵魂，让兽人先祖得以安然长眠。"
Inst47Quest2_HORDE_Location = "德欧里(奥金尼地穴; "..YELLOW.."[2]"..WHITE..")。"
Inst47Quest2_HORDE_Note = "德欧里会在大主教玛拉达尔被击杀后出现。卡舒尔宗母在 (纳格兰; "..YELLOW.."26,61"..WHITE..")。在对抗古老的兽人之灵之前，请确保组成一个3人或更多人的小队。"
Inst47Quest2_HORDE_Prequest = "奥金顿......"
Inst47Quest2_HORDE_Folgequest = "返回盖亚安祖母身边"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst47Quest3_HORDE = "3. 一切都会变好的"
Inst47Quest3_HORDE_Aim = Inst47Quest1_Aim
Inst47Quest3_HORDE_Location = Inst47Quest1_Location
Inst47Quest3_HORDE_Note = Inst47Quest1_Note
Inst47Quest3_HORDE_Prequest = Inst47Quest1_Prequest
Inst47Quest3_HORDE_Folgequest = Inst47Quest1_Folgequest
--
Inst47Quest3name1_HORDE = Inst47Quest1name1
Inst47Quest3name2_HORDE = Inst47Quest1name2
Inst47Quest3name3_HORDE = Inst47Quest1name3
Inst47Quest3name4_HORDE = Inst47Quest1name4

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst47Quest4_HORDE = "4. 悬赏：主教的灵魂宝钻"
Inst47Quest4_HORDE_Aim = Inst47Quest2_Aim
Inst47Quest4_HORDE_Location = Inst47Quest2_Location
Inst47Quest4_HORDE_Note = Inst47Quest2_Note
Inst47Quest4_HORDE_Prequest = Inst47Quest2_Prequest
Inst47Quest4_HORDE_Folgequest = Inst47Quest2_Folgequest
--
Inst47Quest4name1_HORDE = Inst47Quest2name1



--------------- INST48 - Mana Tombs ---------------

Inst48Caption = "法力陵墓"
Inst48QAA = "5个任务"
Inst48QAH = "5个任务"

--Quest 1 Alliance
Inst48Quest1 = "1. 安全第一"
Inst48Quest1_Aim = "工匠莫法鲁斯要你杀死10个虚灵盗墓者、5个虚灵巫师、5个节点潜行者和5个虚灵缚法者。"
Inst48Quest1_Location = "工匠莫法鲁斯(泰罗卡森林 - 奥金顿; "..YELLOW.."39,58"..WHITE..")"
Inst48Quest1_Note = "虚灵传送器控制台位于 "..YELLOW.."[3]"..WHITE.."。"
Inst48Quest1_Prequest = "无"
Inst48Quest1_Folgequest = "Someone Else's Hard Work Pays Off"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. 别人的烂摊子"
Inst48Quest2_Aim = "护送低温工程师沙赫恩穿过法力陵墓，在他从沙法尔的灵体收集器中收集灵体能量时保护他。"
Inst48Quest2_Location = "低温工程师沙赫恩(法力陵墓; "..YELLOW.."[3]"..WHITE..")"
Inst48Quest2_Note = "要召唤低温工程师沙赫恩，点击位于 "..YELLOW.."[3]"..WHITE.."的虚灵传送器控制台。他将与其他几个友好的星界财团NPC一起出现。应该事先清理整个副本，确保没有任何怪物存活。护送任务每个副本只能尝试一次。"
Inst48Quest2_Prequest = "安全第一"
Inst48Quest2_Folgequest = "无"
--
Inst48Quest2name1 = "星界财团裹布"
Inst48Quest2name2 = "低温手套"
Inst48Quest2name3 = "星界财团相位衬肩"
Inst48Quest2name4 = "血肉兽的金属胫甲"

--Quest 3 Alliance
Inst48Quest3 = "3. 扫除竞争者"
Inst48Quest3_Aim = "法力陵墓外的节点亲王哈拉迈德要你杀死节点亲王沙法尔，并将沙法尔的护腕带交给他。"
Inst48Quest3_Location = "节点亲王哈拉迈德(泰罗卡森林 - 奥金顿; "..YELLOW.."39,58"..WHITE..")。"
Inst48Quest3_Note = "节点亲王沙法尔在 "..YELLOW.."[4]"..WHITE.."。"
Inst48Quest3_Prequest = "无"
Inst48Quest3_Folgequest = "无"
--
Inst48Quest3name1 = "哈拉迈德的三环护腿"
Inst48Quest3name2 = "星界财团板甲护腿"
Inst48Quest3name3 = "哈拉迈德的裹腿"
Inst48Quest3name4 = "哈拉迈德的链甲护腿"

--Quest 4 Alliance
Inst48Quest4 = "4. 法力陵墓的静止间(英雄)"
Inst48Quest4_Aim = "刀锋山巴什伊尔码头的指挥官阿米尔的影像要你进入奥金顿的法力陵墓，对静止间使用法力陵墓静止间钥匙。"
Inst48Quest4_Location = "指挥官阿米尔的影像(刀锋山 - 巴什伊尔码头; "..YELLOW.."52,15"..WHITE..")。"
Inst48Quest4_Note = "需要英雄地下城难度。有两个静止间。第一个就在潘德莫努斯 "..YELLOW.."[1]"..WHITE.."。第二个在节点亲王沙法尔的房间 "..YELLOW.."[4]"..WHITE.."。每个都需要一个节点之王的印记。"
Inst48Quest4_Prequest = "节点之王的印记"
Inst48Quest4_Folgequest = "无"
--
Inst48Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst48Quest5 = "5. 悬赏：沙法尔的精致饰物"
Inst48Quest5_Aim = "商人扎雷姆要求你夺得沙法尔的精致饰物。将饰物带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst48Quest5_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst48Quest5_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n节点亲王沙法尔在 "..YELLOW.."[4]"..WHITE.."。"
Inst48Quest5_Prequest = "无"
Inst48Quest5_Folgequest = "无"
--
Inst48Quest5name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst48Quest1_HORDE = Inst48Quest1
Inst48Quest1_HORDE_Aim = Inst48Quest1_Aim
Inst48Quest1_HORDE_Location = Inst48Quest1_Location
Inst48Quest1_HORDE_Note = Inst48Quest1_Note
Inst48Quest1_HORDE_Prequest = Inst48Quest1_Prequest
Inst48Quest1_HORDE_Folgequest = Inst48Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst48Quest2_HORDE = Inst48Quest2
Inst48Quest2_HORDE_Aim = Inst48Quest2_Aim
Inst48Quest2_HORDE_Location = Inst48Quest2_Location
Inst48Quest2_HORDE_Note = Inst48Quest2_Note
Inst48Quest2_HORDE_Prequest = Inst48Quest2_Prequest
Inst48Quest2_HORDE_Folgequest = Inst48Quest2_Folgequest
--
Inst48Quest2name1_HORDE = Inst48Quest2name1
Inst48Quest2name2_HORDE = Inst48Quest2name2
Inst48Quest2name3_HORDE = Inst48Quest2name3
Inst48Quest2name4_HORDE = Inst48Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst48Quest3_HORDE = Inst48Quest3
Inst48Quest3_HORDE_Aim = Inst48Quest3_Aim
Inst48Quest3_HORDE_Location = Inst48Quest3_Location
Inst48Quest3_HORDE_Note = Inst48Quest3_Note
Inst48Quest3_HORDE_Prequest = Inst48Quest3_Prequest
Inst48Quest3_HORDE_Folgequest = Inst48Quest3_Folgequest
--
Inst48Quest3name1_HORDE = Inst48Quest3name1
Inst48Quest3name2_HORDE = Inst48Quest3name2
Inst48Quest3name3_HORDE = Inst48Quest3name3
Inst48Quest3name4_HORDE = Inst48Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst48Quest4_HORDE = Inst48Quest4
Inst48Quest4_HORDE_Aim = Inst48Quest4_Aim
Inst48Quest4_HORDE_Location = Inst48Quest4_Location
Inst48Quest4_HORDE_Note = Inst48Quest4_Note
Inst48Quest4_HORDE_Prequest = Inst48Quest4_Prequest
Inst48Quest4_HORDE_Folgequest = Inst48Quest4_Folgequest
--
Inst48Quest4name1_HORDE = Inst48Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst48Quest5_HORDE = Inst48Quest5
Inst48Quest5_HORDE_Aim = Inst48Quest5_Aim
Inst48Quest5_HORDE_Location = Inst48Quest5_Location
Inst48Quest5_HORDE_Note = Inst48Quest5_Note
Inst48Quest5_HORDE_Prequest = Inst48Quest5_Prequest
Inst48Quest5_HORDE_Folgequest = Inst48Quest5_Folgequest
--
Inst48Quest5name1_HORDE = Inst48Quest5name1



--------------- INST49 - Sethekk Halls ---------------

Inst49Caption = "塞泰克大厅"
Inst49QAA = "5个任务"
Inst49QAH = "5个任务"

--Quest 1 Alliance
Inst49Quest1 = "1. 兄弟反目"
Inst49Quest1_Aim = "进入塞泰克大厅，杀死黑暗编织者塞斯，然后解救被囚禁的拉卡。完成任务后向塞泰克大厅外的伊斯法尔复命。"
Inst49Quest1_Location = "伊斯法尔(泰罗卡森林 - 奥金顿; "..YELLOW.."44,65"..WHITE..")"
Inst49Quest1_Note = "黑暗编织者塞斯在 "..YELLOW.."[1]"..WHITE.."。拉卡在同一个房间的一个笼子里。打开她的笼子不会召唤敌人。"
Inst49Quest1_Prequest = "无"
Inst49Quest1_Folgequest = "无"
--
Inst49Quest1name1 = "塞泰克先知颈环"
Inst49Quest1name2 = "塞泰克神谕项链"
Inst49Quest1name3 = "利爪领主的项圈"
Inst49Quest1name4 = "乌鸦卫士印记"

--Quest 2 Alliance
Inst49Quest2 = "2. 泰罗克的传说"
Inst49Quest2_Aim = "将泰罗克的面具、泰罗克的羽毛和泰罗克的传说交给塞泰克大厅外的伊斯法尔。"
Inst49Quest2_Location = "伊斯法尔(泰罗卡森林 - 奥金顿; "..YELLOW.."44,65"..WHITE..")"
Inst49Quest2_Note = "泰罗克的面具从位于 "..YELLOW.."[1]"..WHITE.."的黑暗编织者塞斯那里掉落, 泰罗克的传说位于 "..YELLOW.."[2]"..WHITE.."，而泰罗克的羽毛则从位于 "..YELLOW.."[3]"..WHITE.."的利爪之王艾吉斯那里掉落。"
Inst49Quest2_Prequest = "无"
Inst49Quest2_Folgequest = "无"
--
Inst49Quest2name1 = "泰罗克的传说"
Inst49Quest2name2 = "泰罗克的面具"
Inst49Quest2name3 = "泰罗克的羽毛"

--Quest 3 Alliance
Inst49Quest3 = "3. 消灭乌鸦之神(德鲁伊 - 英雄)"
Inst49Quest3_Aim = "杀死乌鸦之神，然后向塞纳里奥庇护所的莫希斯·轻翼复命。"
Inst49Quest3_Location = "莫希斯·轻翼(赞加沼泽 - 塞纳里奥庇护所; "..YELLOW.."80,65"..WHITE..")"
Inst49Quest3_Note = "需要英雄地下城难度。这是德鲁伊迅捷飞行形态任务线的最后一个任务。乌鸦神安苏是在 "..YELLOW.."[2]"..WHITE.."使用任务给予者提供的材料召唤的。"
Inst49Quest3_Prequest = "雄鹰精华 -> 寻找月亮石"
Inst49Quest3_Folgequest = "无"
--
Inst49Quest3name1 = "乌鸦之神的雕像"

--Quest 4 Alliance
Inst49Quest4 = "4. 卡琳娜的要求(英雄)"
Inst49Quest4_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德。"
Inst49Quest4_Location = "卡琳娜·拉瑟德(虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst49Quest4_Note = "需要英雄地下城难度。\n\n黑暗编织者塞斯在 "..YELLOW.."[1]"..WHITE.."。暮色魔典掉落于破碎大厅。"
Inst49Quest4_Prequest = "同事的帮助("..YELLOW.."卡拉赞"..WHITE..")"
Inst49Quest4_Folgequest = "夜之魇("..YELLOW.."卡拉赞"..WHITE..")"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. 悬赏：艾吉斯的冠羽"
Inst49Quest5_Aim = "商人扎雷姆要求你夺得艾吉斯的冠羽。将羽毛带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst49Quest5_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst49Quest5_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n利爪之王艾吉斯在 "..YELLOW.."[3]"..WHITE.."。"
Inst49Quest5_Prequest = "无"
Inst49Quest5_Folgequest = "无"
--
Inst49Quest5name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst49Quest1_HORDE = Inst49Quest1
Inst49Quest1_HORDE_Aim = Inst49Quest1_Aim
Inst49Quest1_HORDE_Location = Inst49Quest1_Location
Inst49Quest1_HORDE_Note = Inst49Quest1_Note
Inst49Quest1_HORDE_Prequest = Inst49Quest1_Prequest
Inst49Quest1_HORDE_Folgequest = Inst49Quest1_Folgequest
--
Inst49Quest1name1_HORDE = Inst49Quest1name1
Inst49Quest1name2_HORDE = Inst49Quest1name2
Inst49Quest1name3_HORDE = Inst49Quest1name3
Inst49Quest1name4_HORDE = Inst49Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst49Quest2_HORDE = Inst49Quest2
Inst49Quest2_HORDE_Aim = Inst49Quest2_Aim
Inst49Quest2_HORDE_Location = Inst49Quest2_Location
Inst49Quest2_HORDE_Note = Inst49Quest2_Note
Inst49Quest2_HORDE_Prequest = Inst49Quest2_Prequest
Inst49Quest2_HORDE_Folgequest = Inst49Quest2_Folgequest
--
Inst49Quest2name1_HORDE = Inst49Quest2name1
Inst49Quest2name2_HORDE = Inst49Quest2name2
Inst49Quest2name3_HORDE = Inst49Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst49Quest3_HORDE = Inst49Quest3
Inst49Quest3_HORDE_Aim = Inst49Quest3_Aim
Inst49Quest3_HORDE_Location = Inst49Quest3_Location
Inst49Quest3_HORDE_Note = Inst49Quest3_Note
Inst49Quest3_HORDE_Prequest = Inst49Quest3_Prequest
Inst49Quest3_HORDE_Folgequest = Inst49Quest3_Folgequest
--
Inst49Quest3name1_HORDE = Inst49Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst49Quest4_HORDE = Inst49Quest4
Inst49Quest4_HORDE_Aim = Inst49Quest4_Aim
Inst49Quest4_HORDE_Location = Inst49Quest4_Location
Inst49Quest4_HORDE_Note = Inst49Quest4_Note
Inst49Quest4_HORDE_Prequest = Inst49Quest4_Prequest
Inst49Quest4_HORDE_Folgequest = Inst49Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst49Quest5_HORDE = Inst49Quest5
Inst49Quest5_HORDE_Aim = Inst49Quest5_Aim
Inst49Quest5_HORDE_Location = Inst49Quest5_Location
Inst49Quest5_HORDE_Note = Inst49Quest5_Note
Inst49Quest5_HORDE_Prequest = Inst49Quest5_Prequest
Inst49Quest5_HORDE_Folgequest = Inst49Quest5_Folgequest
--
Inst49Quest5name1_HORDE = Inst49Quest5name1



--------------- INST50 - Shadow Labyrinth ---------------

Inst50Caption = "暗影迷宫"
Inst50QAA = "11个任务"
Inst50QAH = "11个任务"

--Quest 1 Alliance
Inst50Quest1 = "1. 寻找间谍托古恩"
Inst50Quest1_Aim = "进入奥金顿的暗影迷宫，寻找间谍托古恩的下落。"
Inst50Quest1_Location = "间谍格利克萨(泰罗卡森林 - 奥金顿; "..YELLOW.."40,72"..WHITE..")"
Inst50Quest1_Note = "托古恩在 "..YELLOW.."[1]"..WHITE.."，且会在小地图上显示。"
Inst50Quest1_Prequest = "无"
Inst50Quest1_Folgequest = "灵魂装置"
-- No Rewards for this quest

--Quest 2 Alliance
Inst50Quest2 = "2. 灵魂装置"
Inst50Quest2_Aim = "偷取5个灵魂装置，将它们交给沙塔斯城圣光广场的间谍女王梅丽萨·海克隆。"
Inst50Quest2_Location = "间谍格利克萨(暗影迷宫; "..YELLOW.."[1]"..WHITE..")"
Inst50Quest2_Note = "灵魂装置是分散在副本各处的深紫色球体。间谍女王梅丽萨·海克隆在(沙塔斯城 - 圣光广场; "..YELLOW.."51,45"..WHITE..")。"
Inst50Quest2_Prequest = "寻找间谍托古恩"
Inst50Quest2_Folgequest = "无"
--
Inst50Quest2name1 = "沙塔斯裹腕"
Inst50Quest2name2 = "间谍女王的护腕"
Inst50Quest2name3 = "奥金尼护腕"
Inst50Quest2name4 = "沙塔尔精炼臂甲"

--Quest 3 Alliance
Inst50Quest3 = "3. 恶魔名册"
Inst50Quest3_Aim = "进入奥金顿的暗影迷宫，从煽动者布莱卡特手中夺得恶魔名册。完成任务后返回纳格兰向奥图里斯复命。"
Inst50Quest3_Location = "受难者奥图里斯(纳格兰; "..YELLOW.."27,43"..WHITE..")"
Inst50Quest3_Note = "煽动者布莱卡特在 "..YELLOW.."[3]"..WHITE.."。这是一个连锁任务的最后部分，开始于影月谷的 "..YELLOW.."61,28"..WHITE.."处对于奥尔多阵营，以及 "..YELLOW.."55,58"..WHITE.."处对于占星者阵营。"
Inst50Quest3_Prequest = "伊利丹的学生"
Inst50Quest3_Folgequest = "返回沙塔尔祭坛 或 返回群星圣殿"
-- No Rewards for this quest

--Quest 4 Alliance
Inst50Quest4 = "4. 奥金顿的麻烦"
Inst50Quest4_Aim = "前往泰罗卡森林的奥金顿，向暗影迷宫入口处的战地指挥官玛弗恩报到。"
Inst50Quest4_Location = "间谍女王梅丽萨·海克隆(沙塔斯城 - 圣光广场; "..YELLOW.."51,45"..WHITE..")"
Inst50Quest4_Note = "战地指挥官玛弗恩在(泰罗卡森林 - 奥金顿; "..YELLOW.."40,72"..WHITE..")，就在暗影迷宫的入口外。"
Inst50Quest4_Prequest = "无"
Inst50Quest4_Folgequest = "鲜血法典"
-- No Rewards for this quest

--Quest 5 Alliance
Inst50Quest5 = "5. 鲜血法典"
Inst50Quest5_Aim = "阅读奥金顿暗影迷宫中的鲜血法典。"
Inst50Quest5_Location = "战地指挥官玛弗恩(泰罗卡森林 - 奥金顿; "..YELLOW.."40,72"..WHITE..")"
Inst50Quest5_Note = "鲜血法典就在沃匹尔大师的前方，位置为 "..YELLOW.."[4]"..WHITE.."。"
Inst50Quest5_Prequest = "奥金顿的麻烦"
Inst50Quest5_Folgequest = "深入迷宫"
-- No Rewards for this quest

--Quest 6 Alliance
Inst50Quest6 = "6. 深入迷宫"
Inst50Quest6_Aim = "杀死摩摩尔，然后返回沙塔斯城的圣光广场，将暗影迷宫的秘密告诉间谍女王梅丽萨·海克隆。"
Inst50Quest6_Location = "鲜血法典(暗影迷宫; "..YELLOW.."[4]"..WHITE..")"
Inst50Quest6_Note = "摩摩尔在 "..YELLOW.."[5]"..WHITE.."。间谍女王梅丽萨·海克隆在(沙塔斯城 - 圣光广场; "..YELLOW.."51,45"..WHITE..")。"
Inst50Quest6_Prequest = "鲜血法典"
Inst50Quest6_Folgequest = "无"
--
Inst50Quest6name1 = "沙塔斯软靴"
Inst50Quest6name2 = "间谍女王的长靴"
Inst50Quest6name3 = "奥金尼长靴"
Inst50Quest6name4 = "沙塔尔精炼护胫"

--Quest 7 Alliance
Inst50Quest7 = "7. 纳鲁的试炼：力量(英雄)"
Inst50Quest7_Aim = "沙塔斯城的阿达尔要求你取回卡利瑟里斯的三叉戟和摩摩尔的精华。"
Inst50Quest7_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst50Quest7_Note = "需要英雄地下城难度。摩摩尔在 "..YELLOW.."[5]"..WHITE.."。卡利瑟里斯的三叉戟来自蒸汽地窖。\n\n这个任务过去是进入风暴要塞: 风暴要塞的必要条件，但现在已经不再需要了。"
Inst50Quest7_Prequest = "无"
Inst50Quest7_Folgequest = "无"
-- No Rewards for this quest

--Quest 8 Alliance
Inst50Quest8 = "8. 卡拉赞的钥匙"
Inst50Quest8_Aim = "卡德加要求你进入奥金顿的暗影迷宫中，回收储藏在那里的一个奥术容器中的第一块钥匙碎片。"
Inst50Quest8_Location = "卡德加(沙塔斯城 - 圣光广场; "..YELLOW.."54,44"..WHITE..")"
Inst50Quest8_Note = "这是卡拉赞进入资格任务系列的一部分。奥术容器位于摩摩尔旁边，位置为 "..YELLOW.."[5]"..WHITE.."。打开它将会召唤一个元素生物，击败它才能获得碎片。"
Inst50Quest8_Prequest = "卡德加"
Inst50Quest8_Folgequest = "卡拉赞的钥匙"
-- No Rewards for this quest

--Quest 9 Alliance
Inst50Quest9 = "9. 魔语辞典"
Inst50Quest9_Aim = "从沃匹尔大师手中夺得魔语辞典，将它交给韦恩的避难所的戴维·韦恩。"
Inst50Quest9_Location = "戴维·韦恩(泰罗卡森林 - 韦恩的避难所; "..YELLOW.."78,39"..WHITE..")"
Inst50Quest9_Note = "沃匹尔大师在 "..YELLOW.."[4]"..WHITE.."。完成此任务和能源舰的热源("..YELLOW.."风暴要塞: 能源舰"..WHITE..")将从戴维·韦恩那里开启两个新任务。\n\n这个物品在英雄模式下不会掉落。"
Inst50Quest9_Prequest = "其它的材料"
Inst50Quest9_Folgequest = "无"
-- No Rewards for this quest

--Quest 10 Alliance
Inst50Quest10 = "10. 悬赏：摩摩尔的低语"
Inst50Quest10_Aim = "商人扎雷姆要求你夺得摩摩尔的低语。将这件器物带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst50Quest10_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst50Quest10_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n摩摩尔在 "..YELLOW.."[5]"..WHITE.."。"
Inst50Quest10_Prequest = "无"
Inst50Quest10_Folgequest = "无"
--
Inst50Quest10name1 = "公正徽章"

--Quest 11 Alliance
Inst50Quest11 = "11. 悬赏：恶毒导师"
Inst50Quest11_Aim = "虚空猎手玛哈杜恩要求你杀死3名恶毒导师。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst50Quest11_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst50Quest11_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst50Quest11_Prequest = "无"
Inst50Quest11_Folgequest = "无"
--
Inst50Quest11name1 = "复仇军监牢钥匙"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst50Quest1_HORDE = Inst50Quest1
Inst50Quest1_HORDE_Aim = Inst50Quest1_Aim
Inst50Quest1_HORDE_Location = Inst50Quest1_Location
Inst50Quest1_HORDE_Note = Inst50Quest1_Note
Inst50Quest1_HORDE_Prequest = Inst50Quest1_Prequest
Inst50Quest1_HORDE_Folgequest = Inst50Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst50Quest2_HORDE = Inst50Quest2
Inst50Quest2_HORDE_Aim = Inst50Quest2_Aim
Inst50Quest2_HORDE_Location = Inst50Quest2_Location
Inst50Quest2_HORDE_Note = Inst50Quest2_Note
Inst50Quest2_HORDE_Prequest = Inst50Quest2_Prequest
Inst50Quest2_HORDE_Folgequest = Inst50Quest2_Folgequest
--
Inst50Quest2name1_HORDE = Inst50Quest2name1
Inst50Quest2name2_HORDE = Inst50Quest2name2
Inst50Quest2name3_HORDE = Inst50Quest2name3
Inst50Quest2name4_HORDE = Inst50Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst50Quest3_HORDE = Inst50Quest3
Inst50Quest3_HORDE_Aim = Inst50Quest3_Aim
Inst50Quest3_HORDE_Location = Inst50Quest3_Location
Inst50Quest3_HORDE_Note = Inst50Quest3_Note
Inst50Quest3_HORDE_Prequest = Inst50Quest3_Prequest
Inst50Quest3_HORDE_Folgequest = Inst50Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst50Quest4_HORDE = Inst50Quest4
Inst50Quest4_HORDE_Aim = Inst50Quest4_Aim
Inst50Quest4_HORDE_Location = Inst50Quest4_Location
Inst50Quest4_HORDE_Note = Inst50Quest4_Note
Inst50Quest4_HORDE_Prequest = Inst50Quest4_Prequest
Inst50Quest4_HORDE_Folgequest = Inst50Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst50Quest5_HORDE = Inst50Quest5
Inst50Quest5_HORDE_Aim = Inst50Quest5_Aim
Inst50Quest5_HORDE_Location = Inst50Quest5_Location
Inst50Quest5_HORDE_Note = Inst50Quest5_Note
Inst50Quest5_HORDE_Prequest = Inst50Quest5_Prequest
Inst50Quest5_HORDE_Folgequest = Inst50Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst50Quest6_HORDE = Inst50Quest6
Inst50Quest6_HORDE_Aim = Inst50Quest6_Aim
Inst50Quest6_HORDE_Location = Inst50Quest6_Location
Inst50Quest6_HORDE_Note = Inst50Quest6_Note
Inst50Quest6_HORDE_Prequest = Inst50Quest6_Prequest
Inst50Quest6_HORDE_Folgequest = Inst50Quest6_Folgequest
--
Inst50Quest6name1_HORDE = Inst50Quest6name1
Inst50Quest6name2_HORDE = Inst50Quest6name2
Inst50Quest6name3_HORDE = Inst50Quest6name3
Inst50Quest6name4_HORDE = Inst50Quest6name4

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst50Quest7_HORDE = Inst50Quest7
Inst50Quest7_HORDE_Aim = Inst50Quest7_Aim
Inst50Quest7_HORDE_Location = Inst50Quest7_Location
Inst50Quest7_HORDE_Note = Inst50Quest7_Note
Inst50Quest7_HORDE_Prequest = Inst50Quest7_Prequest
Inst50Quest7_HORDE_Folgequest = Inst50Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst50Quest8_HORDE = Inst50Quest8
Inst50Quest8_HORDE_Aim = Inst50Quest8_Aim
Inst50Quest8_HORDE_Location = Inst50Quest8_Location
Inst50Quest8_HORDE_Note = Inst50Quest8_Note
Inst50Quest8_HORDE_Prequest = Inst50Quest8_Prequest
Inst50Quest8_HORDE_Folgequest = Inst50Quest8_Folgequest
Inst50Quest8_HORDE_Level = Inst50Quest8_Level
Inst50Quest8_HORDE_Attain = Inst50Quest8_Attain
Inst50Quest8PreQuest_HORDE = Inst50Quest8PreQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst50Quest9_HORDE = Inst50Quest9
Inst50Quest9_HORDE_Aim = Inst50Quest9_Aim
Inst50Quest9_HORDE_Location = Inst50Quest9_Location
Inst50Quest9_HORDE_Note = Inst50Quest9_Note
Inst50Quest9_HORDE_Prequest = Inst50Quest9_Prequest
Inst50Quest9_HORDE_Folgequest = Inst50Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst50Quest10_HORDE = Inst50Quest10
Inst50Quest10_HORDE_Aim = Inst50Quest10_Aim
Inst50Quest10_HORDE_Location = Inst50Quest10_Location
Inst50Quest10_HORDE_Note = Inst50Quest10_Note
Inst50Quest10_HORDE_Prequest = Inst50Quest10_Prequest
Inst50Quest10_HORDE_Folgequest = Inst50Quest10_Folgequest
--
Inst50Quest10name1_HORDE = Inst50Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst50Quest11_HORDE = Inst50Quest11
Inst50Quest11_HORDE_Aim = Inst50Quest11_Aim
Inst50Quest11_HORDE_Location = Inst50Quest11_Location
Inst50Quest11_HORDE_Note = Inst50Quest11_Note
Inst50Quest11_HORDE_Prequest = Inst50Quest11_Prequest
Inst50Quest11_HORDE_Folgequest = Inst50Quest11_Folgequest
--
Inst50Quest11name1_HORDE = Inst50Quest11name1



--------------- INST51 - Serpentshrine Cavern ---------------

Inst51Caption = "毒蛇神殿"
Inst51QAA = "2个任务"
Inst51QAH = "2个任务"

--Quest 1 Alliance
Inst51Quest1 = "1. 永恒水瓶"
Inst51Quest1_Aim = "时光之穴的索莉多米要你从盘牙水库的瓦丝琪那里取回瓦丝琪的水瓶残余，并从风暴要塞的凯尔萨斯·逐日者那里取回凯尔萨斯的水瓶残余。"
Inst51Quest1_Location = "索莉多米(塔纳利斯 - 时光之穴; "..YELLOW.."58,57"..WHITE..")。NPC在该区域四处走动。"
Inst51Quest1_Note = "这个任务是为了进入海加尔山之战的准入资格所需。瓦丝琪在 "..YELLOW.."[6]"..WHITE.."。"
Inst51Quest1_Prequest = "无"
Inst51Quest1_Folgequest = "无"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. 危险的秘密"
Inst51Quest2_Aim = "前往影月谷内的守望者牢笼，与阿卡玛谈一谈。"
Inst51Quest2_Location = "先知奥鲁姆(毒蛇神殿; "..YELLOW.."[4]"..WHITE..")"
Inst51Quest2_Note = "阿卡玛在(影月谷 - 守望者牢笼; "..YELLOW.."58,48"..WHITE..")。\n\n这是黑暗神殿进入资格任务系列的一部分，开始于学者希拉(影月谷 - 沙塔尔祭坛; "..YELLOW.."62,38"..WHITE..")对于奥尔多阵营和奥术师塞里斯(影月谷 - 群星圣殿; "..YELLOW.."56,59"..WHITE..")对于占星者阵营。"
Inst51Quest2_Prequest = "巴尔里石板 -> 阿卡玛的保证"
Inst51Quest2_Folgequest = "灰舌的计谋 ("..YELLOW.."风暴要塞: 风暴要塞"..WHITE..")"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst51Quest1_HORDE = Inst51Quest1
Inst51Quest1_HORDE_Aim = Inst51Quest1_Aim
Inst51Quest1_HORDE_Location = Inst51Quest1_Location
Inst51Quest1_HORDE_Note = Inst51Quest1_Note
Inst51Quest1_HORDE_Prequest = Inst51Quest1_Prequest
Inst51Quest1_HORDE_Folgequest = Inst51Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst51Quest2_HORDE = Inst51Quest2
Inst51Quest2_HORDE_Aim = Inst51Quest2_Aim
Inst51Quest2_HORDE_Location = Inst51Quest2_Location
Inst51Quest2_HORDE_Note = Inst51Quest2_Note
Inst51Quest2_HORDE_Prequest = Inst51Quest2_Prequest
Inst51Quest2_HORDE_Folgequest = Inst51Quest2_Folgequest
-- No Rewards for this quest



--------------- INST52 - Black Morass ---------------

Inst52Caption = "黑色沼泽"
Inst52QAA = "7个任务"
Inst52QAH = "7个任务"

--Quest 1 Alliance
Inst52Quest1 = "1. 黑色沼泽"
Inst52Quest1_Aim = "深入时光之穴，前往正在发生黑暗之门开启这一历史事件的黑色沼泽，与萨艾特谈一谈。"
Inst52Quest1_Location = "安多尔姆(塔纳利斯 - 时光之穴; "..YELLOW.."58,54"..WHITE..")"
Inst52Quest1_Note = "必须完成逃离敦霍尔德任务才能获得进入黑色沼泽的资格。萨艾特就在副本的入口处不远处。"
Inst52Quest1_Prequest = "无"
Inst52Quest1_Folgequest = "开启黑暗之门"
-- No Rewards for this quest

--Quest 2 Alliance
Inst52Quest2 = "2. 开启黑暗之门"
Inst52Quest2_Aim = "时光之穴黑色沼泽的萨艾特要求你保护麦迪文，直到他成功开启黑暗之门。"
Inst52Quest2_Location = "萨艾特(黑色沼泽; "..YELLOW.."入口"..WHITE..")"
Inst52Quest2_Note = "如果你失败了，你将不得不从头开始该事件。"
Inst52Quest2_Prequest = "黑色沼泽"
Inst52Quest2_Folgequest = "龙族的英雄"
-- No Rewards for this quest

--Quest 3 Alliance
Inst52Quest3 = "3. 龙族的英雄"
Inst52Quest3_Aim = "返回塔纳利斯沙漠的时光之穴，向幼时的安多尔姆复命。"
Inst52Quest3_Location = "萨艾特(黑色沼泽; "..YELLOW.."入口"..WHITE..")"
Inst52Quest3_Note = "安多尔姆在(塔纳利斯 - 时光之穴; "..YELLOW.."58,54"..WHITE..")。"
Inst52Quest3_Prequest = "开启黑暗之门"
Inst52Quest3_Folgequest = "无"
--
Inst52Quest3name1 = "守护者指环"
Inst52Quest3name2 = "监护者的虔诚指环"
Inst52Quest3name3 = "时间扭曲宝石"
Inst52Quest3name4 = "安多尔姆之泪"

--Quest 4 Alliance
Inst52Quest4 = "4. 麦迪文的触摸"
Inst52Quest4_Aim = "进入时光之穴，说服麦迪文让复原的学徒钥匙重新获得打开卡拉赞大门的能力。"
Inst52Quest4_Location = "卡德加(沙塔斯城 - 圣光广场; "..YELLOW.."54,44"..WHITE..")"
Inst52Quest4_Note = "这是卡拉赞进入资格任务系列的一部分。当埃欧努斯死亡时，你必须在副本内才能与麦迪文交谈。"
Inst52Quest4_Prequest = "第二块和第三块"
Inst52Quest4_Folgequest = "返回卡德加身边"
-- No Rewards for this quest

--Quest 5 Alliance
Inst52Quest5 = "5. 药剂大师(炼金术)"
Inst52Quest5_Aim = "进入时光之穴的黑色沼泽，从裂隙领主和裂隙守卫者身上获取10份永恒精华。将这些与5瓶特效防御药剂、5瓶掌控药剂和5瓶特效敏捷药剂一起交给沙塔斯城贫民窟中的罗罗基姆。"
Inst52Quest5_Location = "罗罗基姆(沙塔斯城 - 贫民窟; "..YELLOW.."46,23"..WHITE..")"
Inst52Quest5_Note = "炼金术任务。罗罗基姆在列出的坐标中漫游。"
Inst52Quest5_Prequest = "药剂大师"
Inst52Quest5_Folgequest = "无"
-- No Rewards for this quest

--Quest 6 Alliance
Inst52Quest6 = "6. 悬赏：埃欧努斯的沙漏"
Inst52Quest6_Aim = "商人扎雷姆要求你夺得埃欧努斯的沙漏。将沙漏带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst52Quest6_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst52Quest6_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n埃欧努斯在最后一波中出现。"
Inst52Quest6_Prequest = "无"
Inst52Quest6_Folgequest = "无"
--
Inst52Quest6name1 = "公正徽章"

--Quest 7 Alliance
Inst52Quest7 = "7. 悬赏：裂隙领主"
Inst52Quest7_Aim = "虚空猎手玛哈杜恩要求你杀死4名裂隙领主。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst52Quest7_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst52Quest7_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst52Quest7_Prequest = "无"
Inst52Quest7_Folgequest = "无"
--
Inst52Quest7name1 = "复仇军监牢钥匙"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst52Quest1_HORDE = Inst52Quest1
Inst52Quest1_HORDE_Aim = Inst52Quest1_Aim
Inst52Quest1_HORDE_Location = Inst52Quest1_Location
Inst52Quest1_HORDE_Note = Inst52Quest1_Note
Inst52Quest1_HORDE_Prequest = Inst52Quest1_Prequest
Inst52Quest1_HORDE_Folgequest = Inst52Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst52Quest2_HORDE = Inst52Quest2
Inst52Quest2_HORDE_Aim = Inst52Quest2_Aim
Inst52Quest2_HORDE_Location = Inst52Quest2_Location
Inst52Quest2_HORDE_Note = Inst52Quest2_Note
Inst52Quest2_HORDE_Prequest = Inst52Quest2_Prequest
Inst52Quest2_HORDE_Folgequest = Inst52Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst52Quest3_HORDE = Inst52Quest3
Inst52Quest3_HORDE_Aim = Inst52Quest3_Aim
Inst52Quest3_HORDE_Location = Inst52Quest3_Location
Inst52Quest3_HORDE_Note = Inst52Quest3_Note
Inst52Quest3_HORDE_Prequest = Inst52Quest3_Prequest
Inst52Quest3_HORDE_Folgequest = Inst52Quest3_Folgequest
--
Inst52Quest3name1_HORDE = Inst52Quest3name1
Inst52Quest3name2_HORDE = Inst52Quest3name2
Inst52Quest3name3_HORDE = Inst52Quest3name3
Inst52Quest3name4_HORDE = Inst52Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst52Quest4_HORDE = Inst52Quest4
Inst52Quest4_HORDE_Aim = Inst52Quest4_Aim
Inst52Quest4_HORDE_Location = Inst52Quest4_Location
Inst52Quest4_HORDE_Note = Inst52Quest4_Note
Inst52Quest4_HORDE_Prequest = Inst52Quest4_Prequest
Inst52Quest4_HORDE_Folgequest = Inst52Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst52Quest5_HORDE = Inst52Quest5
Inst52Quest5_HORDE_Aim = Inst52Quest5_Aim
Inst52Quest5_HORDE_Location = Inst52Quest5_Location
Inst52Quest5_HORDE_Note = Inst52Quest5_Note
Inst52Quest5_HORDE_Prequest = Inst52Quest5_Prequest
Inst52Quest5_HORDE_Folgequest = Inst52Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst52Quest6_HORDE = Inst52Quest6
Inst52Quest6_HORDE_Aim = Inst52Quest6_Aim
Inst52Quest6_HORDE_Location = Inst52Quest6_Location
Inst52Quest6_HORDE_Note = Inst52Quest6_Note
Inst52Quest6_HORDE_Prequest = Inst52Quest6_Prequest
Inst52Quest6_HORDE_Folgequest = Inst52Quest6_Folgequest
--
Inst52Quest6name1_HORDE = Inst52Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst52Quest7_HORDE = Inst52Quest7
Inst52Quest7_HORDE_Aim = Inst52Quest7_Aim
Inst52Quest7_HORDE_Location = Inst52Quest7_Location
Inst52Quest7_HORDE_Note = Inst52Quest7_Note
Inst52Quest7_HORDE_Prequest = Inst52Quest7_Prequest
Inst52Quest7_HORDE_Folgequest = Inst52Quest7_Folgequest
--
Inst52Quest7name1_HORDE = Inst52Quest7name1



--------------- INST53 - Battle of Mount Hyjal ---------------

Inst53Caption = "海加尔山之战"
Inst53QAA = "1个任务"
Inst53QAH = "1个任务"

--Quest 1 Alliance
Inst53Quest1 = "1. 往日的神器"
Inst53Quest1_Aim = "前往塔纳利斯的时空之穴，进入海加尔山战役之后击败雷基-冬寒，将他的时光护符匣交给影月谷的阿卡玛。"
Inst53Quest1_Location = "阿卡玛(影月谷 - 守望者牢笼; "..YELLOW.."58,48"..WHITE..")"
Inst53Quest1_Note = "这是黑暗神殿进入资格任务系列的一部分。雷基-冬寒在 "..YELLOW.."[1]"..WHITE.."。"
Inst53Quest1_Prequest = "灰舌的计谋("..YELLOW.."风暴要塞: 风暴要塞"..WHITE..")"
Inst53Quest1_Folgequest = "灵魂之囚"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst53Quest1_HORDE = Inst53Quest1
Inst53Quest1_HORDE_Aim = Inst53Quest1_Aim
Inst53Quest1_HORDE_Location = Inst53Quest1_Location
Inst53Quest1_HORDE_Note = Inst53Quest1_Note
Inst53Quest1_HORDE_Prequest = Inst53Quest1_Prequest
Inst53Quest1_HORDE_Folgequest = Inst53Quest1_Folgequest
-- No Rewards for this quest



--------------- INST54 - Old Hillsbrad ---------------

Inst54Caption = "旧希尔斯布莱德丘陵"
Inst54QAA = "6个任务"
Inst54QAH = "6个任务"

--Quest 1 Alliance
Inst54Quest1 = "1. 往日的希尔斯布莱德"
Inst54Quest1_Aim = "时光之穴的安多尔姆要求你进入旧希尔斯布莱德丘陵，与伊洛希恩谈一谈。"
Inst54Quest1_Location = "安多尔姆(塔纳利斯 - 时光之穴; "..YELLOW.."58,54"..WHITE..")"
Inst54Quest1_Note = "必须完成从时间之穴入口的龙开始的进入资格任务。"
Inst54Quest1_Prequest = "时光之穴"
Inst54Quest1_Folgequest = "塔蕾莎的计谋"
-- No Rewards for this quest

--Quest 2 Alliance
Inst54Quest2 = "2. 塔蕾莎的计谋"
Inst54Quest2_Aim = "进入敦霍尔德城堡，将伊洛希恩交给你的燃烧弹包分别放入5间收容所内的木桶，并启动定时装置。引爆燃烧弹后，与被关押在敦霍尔德城堡地牢中的萨尔谈一谈。"
Inst54Quest2_Location = "伊洛希恩(旧希尔斯布莱德丘陵; "..YELLOW.."入口"..WHITE..")"
Inst54Quest2_Note = "萨尔在 "..YELLOW.."[2]"..WHITE.."。前往南海镇听取灰烬使者的故事，并见到一些熟悉的名字，如克尔苏加德和赫洛德。"
Inst54Quest2_Prequest = "往日的希尔斯布莱德"
Inst54Quest2_Folgequest = "逃离敦霍尔德"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3. 逃离敦霍尔德"
Inst54Quest3_Aim = "准备就绪后告知萨尔。保护萨尔逃离敦霍尔德城堡，并与他一起搭救塔蕾莎。任务完成后与旧希尔斯布莱德丘陵的伊洛希恩谈一谈。"
Inst54Quest3_Location = "萨尔(旧希尔斯布莱德丘陵; "..YELLOW.."[2]"..WHITE..")"
Inst54Quest3_Note = "和萨尔对话前确保所有人都接受了任务。不过据报道，这个任务可以被分享并成功完成。你有20次尝试拯救萨尔的机会，之后你必须重置副本，而且如果没有他，你不能击败最后的首领，因为萨尔必须进行最后的打击。"
Inst54Quest3_Prequest = "塔蕾莎的计谋"
Inst54Quest3_Folgequest = "返回安多尔姆身边"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. 返回安多尔姆身边"
Inst54Quest4_Aim = "返回塔纳利斯沙漠的时光之穴，向幼时的安多尔姆复命。"
Inst54Quest4_Location = "伊洛希恩(旧希尔斯布莱德丘陵; "..YELLOW.."入口"..WHITE..")"
Inst54Quest4_Note = "安多尔姆在(塔纳利斯 - 时光之穴; "..YELLOW.."58,54"..WHITE..")。完成这个任务后，你将可以进入黑色沼泽。"
Inst54Quest4_Prequest = "逃离敦霍尔德"
Inst54Quest4_Folgequest = "无"
--
Inst54Quest4name1 = "风暴之触"
Inst54Quest4name2 = "南海镇软鞋"
Inst54Quest4name3 = "塔伦米尔防御者腰带"
Inst54Quest4name4 = "酋长的衬肩"

--Quest 5 Alliance
Inst54Quest5 = "5. 悬赏：时空猎手的徽记"
Inst54Quest5_Aim = "商人扎雷姆要求你取回时空猎手的徽记。将徽记带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst54Quest5_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst54Quest5_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n时空猎手在 "..YELLOW.."[5]"..WHITE.."。"
Inst54Quest5_Prequest = "无"
Inst54Quest5_Folgequest = "无"
--
Inst54Quest5name1 = "公正徽章"

--Quest 6 Alliance
Inst54Quest6 = "6. 好帽子......"
Inst54Quest6_Aim = "卡洛斯要你进入旧希尔斯布莱德，击败年轻时候的卡洛斯。然后将他的帽子交给塔纳利斯的卡洛斯。"
Inst54Quest6_Location = "卡洛斯(塔纳利斯; "..YELLOW.."54,29"..WHITE..")"
Inst54Quest6_Note = "卡洛斯在 "..YELLOW.."[4]"..WHITE.."附近的道路上巡逻。"
Inst54Quest6_Prequest = "无"
Inst54Quest6_Folgequest = "无"
--
Inst54Quest6name1 = "流浪乐队宽边帽"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst54Quest1_HORDE = Inst54Quest1
Inst54Quest1_HORDE_Aim = Inst54Quest1_Aim
Inst54Quest1_HORDE_Location = Inst54Quest1_Location
Inst54Quest1_HORDE_Note = Inst54Quest1_Note
Inst54Quest1_HORDE_Prequest = Inst54Quest1_Prequest
Inst54Quest1_HORDE_Folgequest = Inst54Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst54Quest2_HORDE = Inst54Quest2
Inst54Quest2_HORDE_Aim = Inst54Quest2_Aim
Inst54Quest2_HORDE_Location = Inst54Quest2_Location
Inst54Quest2_HORDE_Note = Inst54Quest2_Note
Inst54Quest2_HORDE_Prequest = Inst54Quest2_Prequest
Inst54Quest2_HORDE_Folgequest = Inst54Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst54Quest3_HORDE = Inst54Quest3
Inst54Quest3_HORDE_Aim = Inst54Quest3_Aim
Inst54Quest3_HORDE_Location = Inst54Quest3_Location
Inst54Quest3_HORDE_Note = Inst54Quest3_Note
Inst54Quest3_HORDE_Prequest = Inst54Quest3_Prequest
Inst54Quest3_HORDE_Folgequest = Inst54Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst54Quest4_HORDE = Inst54Quest4
Inst54Quest4_HORDE_Aim = Inst54Quest4_Aim
Inst54Quest4_HORDE_Location = Inst54Quest4_Location
Inst54Quest4_HORDE_Note = Inst54Quest4_Note
Inst54Quest4_HORDE_Prequest = Inst54Quest4_Prequest
Inst54Quest4_HORDE_Folgequest = Inst54Quest4_Folgequest
--
Inst54Quest4name1_HORDE = Inst54Quest4name1
Inst54Quest4name2_HORDE = Inst54Quest4name2
Inst54Quest4name3_HORDE = Inst54Quest4name3
Inst54Quest4name4_HORDE = Inst54Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst54Quest5_HORDE = Inst54Quest5
Inst54Quest5_HORDE_Aim = Inst54Quest5_Aim
Inst54Quest5_HORDE_Location = Inst54Quest5_Location
Inst54Quest5_HORDE_Note = Inst54Quest5_Note
Inst54Quest5_HORDE_Prequest = Inst54Quest5_Prequest
Inst54Quest5_HORDE_Folgequest = Inst54Quest5_Folgequest
--
Inst54Quest5name1_HORDE = Inst54Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst54Quest6_HORDE = Inst54Quest6
Inst54Quest6_HORDE_Aim = Inst54Quest6_Aim
Inst54Quest6_HORDE_Location = Inst54Quest6_Location
Inst54Quest6_HORDE_Note = Inst54Quest6_Note
Inst54Quest6_HORDE_Prequest = Inst54Quest6_Prequest
Inst54Quest6_HORDE_Folgequest = Inst54Quest6_Folgequest
--
Inst54Quest6name1_HORDE = Inst54Quest6name1



--------------- INST55 - Gruul's Lair ---------------

Inst55Caption = "格鲁尔的巢穴"
Inst55QAA = "1个任务"
Inst55QAH = "1个任务"

--Quest 1 Alliance
Inst55Quest1 = "1. 卡达什圣杖"
Inst55Quest1_Aim = "将土灵徽记和灿烂徽记交给盘牙水库奴隶围栏的异教徒斯卡希斯。"
Inst55Quest1_Location = "异教徒斯卡希斯(奴隶围栏; "..YELLOW.."英雄[3]"..WHITE..")"
Inst55Quest1_Note = "土灵徽记掉落于"..YELLOW.."格鲁尔的巢穴"..WHITE.."，而灿烂徽记则掉落于"..YELLOW.."卡拉赞"..WHITE.."中的夜之魇。\n\n这个任务曾经是进入毒蛇神殿的要求，但现在不再需要。"
Inst55Quest1_Prequest = "无"
Inst55Quest1_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst55Quest1_HORDE = Inst55Quest1
Inst55Quest1_HORDE_Aim = Inst55Quest1_Aim
Inst55Quest1_HORDE_Location = Inst55Quest1_Location
Inst55Quest1_HORDE_Note = Inst55Quest1_Note
Inst55Quest1_HORDE_Prequest = Inst55Quest1_Prequest
Inst55Quest1_HORDE_Folgequest = Inst55Quest1_Folgequest
-- No Rewards for this quest



--------------- INST56 - Karazhan ---------------

Inst56Caption = "卡拉赞"
Inst56QAA = "15个任务"
Inst56QAH = "15个任务"

--Quest 1 Alliance
Inst56Quest1 = "1. 评估事态"
Inst56Quest1_Aim = "进入卡拉赞寻找库雷恩。"
Inst56Quest1_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest1_Note = "库雷恩位于卡拉赞内部，在 "..YELLOW.."[6]"..WHITE.."附近，刚过猎手阿图门。"
Inst56Quest1_Prequest = "奥术扰动 -> 紫罗兰之眼"
Inst56Quest1_Folgequest = "金娜的日记"
-- No Rewards for this quest

--Quest 2 Alliance
Inst56Quest2 = "2. 金娜的日记"
Inst56Quest2_Aim = "在卡拉赞的会客间搜寻金娜的日记，然后将它交给卡拉赞外的大法师奥图鲁斯。"
Inst56Quest2_Location = "库雷恩(卡拉赞; "..YELLOW.."[6]"..WHITE..")"
Inst56Quest2_Note = "日记位于通往贞节圣女处走廊的第二个房间，在 "..YELLOW.."[10]"..WHITE.."的一张桌子上。大法师奥图鲁斯位于(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")。"
Inst56Quest2_Prequest = "评估事态"
Inst56Quest2_Folgequest = "恶魔的气息"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. 恶魔的气息"
Inst56Quest3_Aim = "大法师奥图鲁斯要求你消灭出现在卡拉赞顶部的恶魔。"
Inst56Quest3_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest3_Note = "玛克扎尔王子在 "..YELLOW.."[26]"..WHITE.."。"
Inst56Quest3_Prequest = "金娜的日记"
Inst56Quest3_Folgequest = "新的指示"
-- No Rewards for this quest

--Quest 4 Alliance
Inst56Quest4 = "4. 新的指示"
Inst56Quest4_Aim = "与达拉然巨坑外的大法师塞德瑞克谈一谈。"
Inst56Quest4_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest4_Note = "法师塞德瑞克在(奥特兰克山脉 - 达拉然; "..YELLOW.."15,54"..WHITE..")。"
Inst56Quest4_Prequest = "恶魔的气息"
Inst56Quest4_Folgequest = "无"
--
Inst56Quest4name1 = "紫罗兰徽章"

--Quest 5 Alliance
Inst56Quest5 = "5. 麦迪文的日记"
Inst56Quest5_Aim = "逆风小径的大法师奥图鲁斯要你进入卡拉赞，与拉维恩谈一谈。"
Inst56Quest5_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest5_Note = "需要与紫罗兰之眼达到尊敬声望。拉维恩位于馆长之后的守护者的图书馆，位置为 "..YELLOW.."[17]"..WHITE.."。"
Inst56Quest5_Prequest = "无"
Inst56Quest5_Folgequest = "书呆子"
-- No Rewards for this quest

--Quest 6 Alliance
Inst56Quest6 = "6. 书呆子"
Inst56Quest6_Aim = "与卡拉赞守护者的图书馆中的格拉达夫谈一谈。"
Inst56Quest6_Location = "拉维恩(卡拉赞; "..YELLOW.."[17]"..WHITE..")"
Inst56Quest6_Note = "格拉达夫位于与拉维恩同一房间，位置为 "..YELLOW.."[18]"..WHITE.."。"
Inst56Quest6_Prequest = "麦迪文的日记"
Inst56Quest6_Folgequest = "卡姆希丝"
-- No Rewards for this quest

--Quest 7 Alliance
Inst56Quest7 = "7. 卡姆希丝"
Inst56Quest7_Aim = "与卡拉赞守护者的图书馆中的卡姆希丝谈一谈。"
Inst56Quest7_Location = "格拉达夫(卡拉赞; "..YELLOW.."[18]"..WHITE..")"
Inst56Quest7_Note = "卡姆希丝位于与格拉达夫同一房间，位置为 "..YELLOW.."[19]"..WHITE.."。"
Inst56Quest7_Prequest = "书呆子"
Inst56Quest7_Folgequest = "埃兰之影"
-- No Rewards for this quest

--Quest 8 Alliance
Inst56Quest8 = "8. 埃兰之影"
Inst56Quest8_Aim = "将麦迪文的日记交给卡拉赞守护者的图书馆中的卡姆希丝。"
Inst56Quest8_Location = "卡姆希丝(卡拉赞; "..YELLOW.."[19]"..WHITE..")"
Inst56Quest8_Note = "埃兰之影在 "..YELLOW.."[21]"..WHITE.."掉落日记。"
Inst56Quest8_Prequest = "卡姆希丝"
Inst56Quest8_Folgequest = "主宰的露台"
-- No Rewards for this quest

--Quest 9 Alliance
Inst56Quest9 = "9. 主宰的露台"
Inst56Quest9_Aim = "进入卡拉赞的主宰的露台，阅读麦迪文的日记。完成任务后将麦迪文的日记交给大法师奥图鲁斯。"
Inst56Quest9_Location = "卡姆希丝(卡拉赞; "..YELLOW.."[19]"..WHITE..")"
Inst56Quest9_Note = "大法师奥图鲁斯在(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")。不涉及战斗。尽情欣赏表演。"
Inst56Quest9_Prequest = "埃兰之影"
Inst56Quest9_Folgequest = "挖掘历史"
-- No Rewards for this quest

--Quest 10 Alliance
Inst56Quest10 = "10. 挖掘历史"
Inst56Quest10_Aim = "大法师奥图鲁斯要求你前往逆风小径，从卡拉赞以南的山脉中取回一块焦骨碎块。"
Inst56Quest10_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest10_Note = "焦骨碎块位于逆风小径的 "..YELLOW.."44,78"..WHITE.."。"
Inst56Quest10_Prequest = "主宰的露台"
Inst56Quest10_Folgequest = "同事的帮助"
-- No Rewards for this quest

--Quest 11 Alliance
Inst56Quest11 = "11. 同事的帮助"
Inst56Quest11_Aim = "将焦骨碎块交给虚空风暴52区的卡琳娜·拉瑟德。"
Inst56Quest11_Location = "大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")"
Inst56Quest11_Note = "卡琳娜·拉瑟德在(虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")。"
Inst56Quest11_Prequest = "挖掘历史"
Inst56Quest11_Folgequest = "Kalynna's Request"
-- No Rewards for this quest

--Quest 12 Alliance
Inst56Quest12 = "12. 卡琳娜的要求"
Inst56Quest12_Aim = "从地狱火堡垒破碎大厅的高阶术士奈瑟库斯手中夺得暮色魔典，从奥金顿塞泰克大厅的黑暗编织者塞斯手中夺得忘却之名，将它们交给卡琳娜·拉瑟德。"
Inst56Quest12_Location = "卡琳娜·拉瑟德(虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst56Quest12_Note = "这个任务要求你进入英雄难度的破碎大厅和英雄难度的塞泰克大厅。"
Inst56Quest12_Prequest = "同事的帮助"
Inst56Quest12_Folgequest = "夜之魇"
-- No Rewards for this quest

--Quest 13 Alliance
Inst56Quest13 = "13. 夜之魇"
Inst56Quest13_Aim = "进入卡拉赞的主宰的露台，碰触黑色骨灰，召唤夜之魇并杀死它，然后从夜之魇的尸体上取得暗淡的奥术精华，并将它交给大法师奥图鲁斯。"
Inst56Quest13_Location = "卡琳娜·拉瑟德(虚空风暴 - 52区; "..YELLOW.."32,63"..WHITE..")"
Inst56Quest13_Note = "夜之魇在 "..YELLOW.."[15]"..WHITE.."处被召唤。完成后返回到大法师奥图鲁斯(逆风小径 - 卡拉赞; "..YELLOW.."47,75"..WHITE..")处交任务。"
Inst56Quest13_Prequest = "卡琳娜的要求"
Inst56Quest13_Folgequest = "无"
--
Inst56Quest13name1 = "脉动紫水晶"
Inst56Quest13name2 = "抚慰紫水晶"
Inst56Quest13name3 = "充能紫水晶"

--Quest 14 Alliance
Inst56Quest14 = "14. 卡达什圣杖"
Inst56Quest14_Aim = "将土灵徽记和灿烂徽记交给盘牙水库奴隶围栏的异教徒斯卡希斯。"
Inst56Quest14_Location = "异教徒斯卡希斯(奴隶围栏; "..YELLOW.."英雄 [3]"..WHITE..")"
Inst56Quest14_Note = "土灵徽记掉落于"..YELLOW.."格鲁尔的巢穴"..WHITE.."，而灿烂徽记则掉落于"..YELLOW.."卡拉赞"..WHITE.."中的夜之魇。\n\n这个任务曾经是进入毒蛇神殿的要求，但现在不再需要。"
Inst56Quest14_Prequest = "无"
Inst56Quest14_Folgequest = "无"
-- No Rewards for this quest

--Quest 15 Alliance
Inst56Quest15 = "15. 卡拉赞的密室"
Inst56Quest15_Aim = "银色特使要你进入卡拉赞的仆役宿舍，在特里斯·黯血王子的房间中寻找线索。"
Inst56Quest15_Location = "银色特使(主城和东瘟疫之地 - 圣光之愿礼拜堂)"
Inst56Quest15_Note = "这个任务只在2008年10月底和11月初的天灾入侵事件期间可用。\n\n为了完成这个任务，使用位于仆役宿舍中特里斯·黯血王子后面的卷轴，该房间位于猎手阿图门上方("..YELLOW.."[5]"..WHITE..")。与打开一个箱子一样，如果另一个玩家正在使用卷轴，您的任务可能不会完成。重试直到完成。"
Inst56Quest15_Prequest = "无"
Inst56Quest15_Folgequest = "无"
--
Inst56Quest15name1 = "要你命3000"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst56Quest1_HORDE = Inst56Quest1
Inst56Quest1_HORDE_Aim = Inst56Quest1_Aim
Inst56Quest1_HORDE_Location = Inst56Quest1_Location
Inst56Quest1_HORDE_Note = Inst56Quest1_Note
Inst56Quest1_HORDE_Prequest = Inst56Quest1_Prequest
Inst56Quest1_HORDE_Folgequest = Inst56Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst56Quest2_HORDE = Inst56Quest2
Inst56Quest2_HORDE_Aim = Inst56Quest2_Aim
Inst56Quest2_HORDE_Location = Inst56Quest2_Location
Inst56Quest2_HORDE_Note = Inst56Quest2_Note
Inst56Quest2_HORDE_Prequest = Inst56Quest2_Prequest
Inst56Quest2_HORDE_Folgequest = Inst56Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst56Quest3_HORDE = Inst56Quest3
Inst56Quest3_HORDE_Aim = Inst56Quest3_Aim
Inst56Quest3_HORDE_Location = Inst56Quest3_Location
Inst56Quest3_HORDE_Note = Inst56Quest3_Note
Inst56Quest3_HORDE_Prequest = Inst56Quest3_Prequest
Inst56Quest3_HORDE_Folgequest = Inst56Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst56Quest4_HORDE = Inst56Quest4
Inst56Quest4_HORDE_Aim = Inst56Quest4_Aim
Inst56Quest4_HORDE_Location = Inst56Quest4_Location
Inst56Quest4_HORDE_Note = Inst56Quest4_Note
Inst56Quest4_HORDE_Prequest = Inst56Quest4_Prequest
Inst56Quest4_HORDE_Folgequest = Inst56Quest4_Folgequest
--
Inst56Quest4name1_HORDE = Inst56Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst56Quest5_HORDE = Inst56Quest5
Inst56Quest5_HORDE_Aim = Inst56Quest5_Aim
Inst56Quest5_HORDE_Location = Inst56Quest5_Location
Inst56Quest5_HORDE_Note = Inst56Quest5_Note
Inst56Quest5_HORDE_Prequest = Inst56Quest5_Prequest
Inst56Quest5_HORDE_Folgequest = Inst56Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst56Quest6_HORDE = Inst56Quest6
Inst56Quest6_HORDE_Aim = Inst56Quest6_Aim
Inst56Quest6_HORDE_Location = Inst56Quest6_Location
Inst56Quest6_HORDE_Note = Inst56Quest6_Note
Inst56Quest6_HORDE_Prequest = Inst56Quest6_Prequest
Inst56Quest6_HORDE_Folgequest = Inst56Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst56Quest7_HORDE = Inst56Quest7
Inst56Quest7_HORDE_Aim = Inst56Quest7_Aim
Inst56Quest7_HORDE_Location = Inst56Quest7_Location
Inst56Quest7_HORDE_Note = Inst56Quest7_Note
Inst56Quest7_HORDE_Prequest = Inst56Quest7_Prequest
Inst56Quest7_HORDE_Folgequest = Inst56Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst56Quest8_HORDE = Inst56Quest8
Inst56Quest8_HORDE_Aim = Inst56Quest8_Aim
Inst56Quest8_HORDE_Location = Inst56Quest8_Location
Inst56Quest8_HORDE_Note = Inst56Quest8_Note
Inst56Quest8_HORDE_Prequest = Inst56Quest8_Prequest
Inst56Quest8_HORDE_Folgequest = Inst56Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst56Quest9_HORDE = Inst56Quest9
Inst56Quest9_HORDE_Aim = Inst56Quest9_Aim
Inst56Quest9_HORDE_Location = Inst56Quest9_Location
Inst56Quest9_HORDE_Note = Inst56Quest9_Note
Inst56Quest9_HORDE_Prequest = Inst56Quest9_Prequest
Inst56Quest9_HORDE_Folgequest = Inst56Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst56Quest10_HORDE = Inst56Quest10
Inst56Quest10_HORDE_Aim = Inst56Quest10_Aim
Inst56Quest10_HORDE_Location = Inst56Quest10_Location
Inst56Quest10_HORDE_Note = Inst56Quest10_Note
Inst56Quest10_HORDE_Prequest = Inst56Quest10_Prequest
Inst56Quest10_HORDE_Folgequest = Inst56Quest10_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst56Quest11_HORDE = Inst56Quest11
Inst56Quest11_HORDE_Aim = Inst56Quest11_Aim
Inst56Quest11_HORDE_Location = Inst56Quest11_Location
Inst56Quest11_HORDE_Note = Inst56Quest11_Note
Inst56Quest11_HORDE_Prequest = Inst56Quest11_Prequest
Inst56Quest11_HORDE_Folgequest = Inst56Quest11_Folgequest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst56Quest12_HORDE = Inst56Quest12
Inst56Quest12_HORDE_Aim = Inst56Quest12_Aim
Inst56Quest12_HORDE_Location = Inst56Quest12_Location
Inst56Quest12_HORDE_Note = Inst56Quest12_Note
Inst56Quest12_HORDE_Prequest = Inst56Quest12_Prequest
Inst56Quest12_HORDE_Folgequest = Inst56Quest12_Folgequest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst56Quest13_HORDE = Inst56Quest13
Inst56Quest13_HORDE_Aim = Inst56Quest13_Aim
Inst56Quest13_HORDE_Location = Inst56Quest13_Location
Inst56Quest13_HORDE_Note = Inst56Quest13_Note
Inst56Quest13_HORDE_Prequest = Inst56Quest13_Prequest
Inst56Quest13_HORDE_Folgequest = Inst56Quest13_Folgequest
--
Inst56Quest13name1_HORDE = Inst56Quest13name1
Inst56Quest13name2_HORDE = Inst56Quest13name2
Inst56Quest13name3_HORDE = Inst56Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst56Quest14_HORDE = Inst56Quest14
Inst56Quest14_HORDE_Aim = Inst56Quest14_Aim
Inst56Quest14_HORDE_Location = Inst56Quest14_Location
Inst56Quest14_HORDE_Note = Inst56Quest14_Note
Inst56Quest14_HORDE_Prequest = Inst56Quest14_Prequest
Inst56Quest14_HORDE_Folgequest = Inst56Quest14_Folgequest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst56Quest15_HORDE = Inst56Quest15
Inst56Quest15_HORDE_Aim = Inst56Quest15_Aim
Inst56Quest15_HORDE_Location = Inst56Quest15_Location
Inst56Quest15_HORDE_Note = Inst56Quest15_Note
Inst56Quest15_HORDE_Prequest = Inst56Quest15_Prequest
Inst56Quest15_HORDE_Folgequest = Inst56Quest15_Folgequest
--
Inst56Quest15name1_HORDE = Inst58Quest13name1



--------------- INST57 - The Arcatraz ---------------

Inst57Caption = "禁魔监狱"
Inst57QAA = "6个任务"
Inst57QAH = "6个任务"

--Quest 1 Alliance
Inst57Quest1 = "1. 末日的预言者"
Inst57Quest1_Aim = "进入风暴要塞的禁魔监狱，杀死预言者斯克瑞斯。完成任务后返回沙塔斯城的圣光广场，向阿达尔复命。"
Inst57Quest1_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst57Quest1_Note = "前置任务为一个连锁任务，开始于虚空风暴，由位于(虚空风暴 - 52区; "..YELLOW.."32,64"..WHITE..")的虚空猎手卡尔伊发起。"
Inst57Quest1_Prequest = "星界强盗奈萨德 -> 如何杀入禁魔监狱"
Inst57Quest1_Folgequest = "无"
--
Inst57Quest1name1 = "沙塔尔强能坠饰"
Inst57Quest1name2 = "阿达尔的恢复项链"
Inst57Quest1name3 = "沙塔斯能量项链"

--Quest 2 Alliance
Inst57Quest2 = "2. 先知乌达鲁"
Inst57Quest2_Aim = "前往风暴要塞的禁魔监狱，寻找乌达鲁。"
Inst57Quest2_Location = "阿卡玛(影月谷 - 守望者牢笼; "..YELLOW.."58,48"..WHITE..")"
Inst57Quest2_Note = "乌达鲁在 "..YELLOW.."[5]"..WHITE.."，就在最后一个首领的房间之前。\n\n这是黑暗神殿进入资格任务系列的一部分，开始于学者希拉(影月谷 - 沙塔尔祭坛; "..YELLOW.."62,38"..WHITE..")对于奥尔多阵营和奥术师塞里斯(影月谷 - 群星圣殿; "..YELLOW.."56,59"..WHITE..")对于占星者阵营。"
Inst57Quest2_Prequest = "巴尔里石板 -> 阿卡玛"
Inst57Quest2_Folgequest = "神秘的征兆"
-- No Rewards for this quest

--Quest 3 Alliance
Inst57Quest3 = "3. 纳鲁的试炼：坚韧(英雄)"
Inst57Quest3_Aim = "沙塔斯城的阿达尔要求你从风暴要塞的禁魔监狱中救出米尔豪斯·法力风暴。"
Inst57Quest3_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst57Quest3_Note = "需要英雄地下城难度。米尔豪斯·法力风暴位于与监护者梅里卡尔同一房间的 "..YELLOW.."[6]"..WHITE.."。\n\n这个任务过去是进入风暴要塞: 风暴要塞的必要条件，但现在已经不再需要了。"
Inst57Quest3_Prequest = "无"
Inst57Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst57Quest4 = "4. 第二块和第三块"
Inst57Quest4_Aim = "从盘牙水库内的一个奥术容器中拿到第二块钥匙碎片，从风暴要塞内的一个奥术容器中拿到第三块钥匙碎片。任务完成之后向沙塔斯城的卡德加复命。"
Inst57Quest4_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst57Quest4_Note = "这是卡拉赞进入资格任务系列的一部分。奥术容器位于 "..YELLOW.."[2]"..WHITE.."。打开它将会召唤一个元素生物，你必须击败它才能得到碎片。第二个钥匙碎片在蒸汽地窟里。"
Inst57Quest4_Prequest = "卡拉赞的钥匙("..YELLOW.."奥金顿: 暗影迷宫"..WHITE..")"
Inst57Quest4_Folgequest = "麦迪文的触摸("..YELLOW.."时光之穴: 黑色沼泽"..WHITE..")"
-- No Rewards for this quest

--Quest 5 Alliance
Inst57Quest5 = "5. 悬赏：斯克瑞斯的卷轴"
Inst57Quest5_Aim = "商人扎雷姆要求你夺得斯克瑞斯的卷轴。将卷轴带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst57Quest5_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst57Quest5_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n预言者斯克瑞斯在 "..YELLOW.."[6]"..WHITE.."。"
Inst57Quest5_Prequest = "无"
Inst57Quest5_Folgequest = "无"
--
Inst57Quest5name1 = "公正徽章"

--Quest 6 Alliance
Inst57Quest6 = "6. 悬赏：禁魔监狱斥候"
Inst57Quest6_Aim = "虚空猎手玛哈杜恩要求你杀死5名禁魔监狱斥候。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst57Quest6_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst57Quest6_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst57Quest6_Prequest = "无"
Inst57Quest6_Folgequest = "无"
--
Inst57Quest6name1 = "复仇军监牢钥匙"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst57Quest1_HORDE = Inst57Quest1
Inst57Quest1_HORDE_Aim = Inst57Quest1_Aim
Inst57Quest1_HORDE_Location = Inst57Quest1_Location
Inst57Quest1_HORDE_Note = Inst57Quest1_Note
Inst57Quest1_HORDE_Prequest = Inst57Quest1_Prequest
Inst57Quest1_HORDE_Folgequest = Inst57Quest1_Folgequest
--
Inst57Quest1name1_HORDE = Inst57Quest1name1
Inst57Quest1name2_HORDE = Inst57Quest1name2
Inst57Quest1name3_HORDE = Inst57Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst57Quest2_HORDE = Inst57Quest2
Inst57Quest2_HORDE_Aim = Inst57Quest2_Aim
Inst57Quest2_HORDE_Location = Inst57Quest2_Location
Inst57Quest2_HORDE_Note = Inst57Quest2_Note
Inst57Quest2_HORDE_Prequest = Inst57Quest2_Prequest
Inst57Quest2_HORDE_Folgequest = Inst57Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst57Quest3_HORDE = Inst57Quest3
Inst57Quest3_HORDE_Aim = Inst57Quest3_Aim
Inst57Quest3_HORDE_Location = Inst57Quest3_Location
Inst57Quest3_HORDE_Note = Inst57Quest3_Note
Inst57Quest3_HORDE_Prequest = Inst57Quest3_Prequest
Inst57Quest3_HORDE_Folgequest = Inst57Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst57Quest4_HORDE = Inst57Quest4
Inst57Quest4_HORDE_Aim = Inst57Quest4_Aim
Inst57Quest4_HORDE_Location = Inst57Quest4_Location
Inst57Quest4_HORDE_Note = Inst57Quest4_Note
Inst57Quest4_HORDE_Prequest = Inst57Quest4_Prequest
Inst57Quest4_HORDE_Folgequest = Inst57Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst57Quest5_HORDE = Inst57Quest5
Inst57Quest5_HORDE_Aim = Inst57Quest5_Aim
Inst57Quest5_HORDE_Location = Inst57Quest5_Location
Inst57Quest5_HORDE_Note = Inst57Quest5_Note
Inst57Quest5_HORDE_Prequest = Inst57Quest5_Prequest
Inst57Quest5_HORDE_Folgequest = Inst57Quest5_Folgequest
--
Inst57Quest5name1_HORDE = Inst57Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst57Quest6_HORDE = Inst57Quest6
Inst57Quest6_HORDE_Aim = Inst57Quest6_Aim
Inst57Quest6_HORDE_Location = Inst57Quest6_Location
Inst57Quest6_HORDE_Note = Inst57Quest6_Note
Inst57Quest6_HORDE_Prequest = Inst57Quest6_Prequest
Inst57Quest6_HORDE_Folgequest = Inst57Quest6_Folgequest
--
Inst57Quest6name1_HORDE = Inst57Quest6name1



--------------- INST58 - Botanica ---------------

Inst58Caption = "生态船"
Inst58QAA = "5个任务"
Inst58QAH = "5个任务"

--Quest 1 Alliance
Inst58Quest1 = "1. 如何杀入禁魔监狱"
Inst58Quest1_Aim = "阿达尔要你取回禁魔监狱钥匙的上半块和下半块，他会将这两块碎片组合成禁魔监狱钥匙。"
Inst58Quest1_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst58Quest1_Note = "下半块从位于 "..YELLOW.."[5]"..WHITE.."迁跃扭木那里掉落。上半块在能源舰中掉落。"
Inst58Quest1_Prequest = "星界强盗奈萨德 -> 送往沙塔斯的特殊货物"
Inst58Quest1_Folgequest = "末日的预言者("..YELLOW.."风暴要塞: 禁魔监狱"..WHITE..")"
--
Inst58Quest1name1 = "沙塔尔学者披风"
Inst58Quest1name2 = "阿达尔的礼物"
Inst58Quest1name3 = "纳鲁精准腰带"
Inst58Quest1name4 = "沙塔斯勇士腰带"
Inst58Quest1name5 = "沙塔尔守备官腰带"
Inst58Quest1name6 = "禁魔监狱钥匙"

--Quest 2 Alliance
Inst58Quest2 = "2. 夺回钥石"
Inst58Quest2_Aim = "进入风暴要塞的生态船，从指挥官萨拉妮丝手中夺得钥石，将它交给紫罗兰之塔的大法师瓦格斯。"
Inst58Quest2_Location = "大法师瓦格斯(虚空风暴 - 肯瑞瓦村; "..YELLOW.."58,86"..WHITE..")"
Inst58Quest2_Note = "指挥官萨拉妮丝在"..YELLOW.."[1]"..WHITE.."。钥石在普通和英雄难度下都会掉落。"
Inst58Quest2_Prequest = "钥匙的主人"
Inst58Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst58Quest3 = "3. 药水大师(炼金术)"
Inst58Quest3_Aim = "劳兰娜·萨维尔要你前往风暴要塞的生态船，从高级植物学家弗雷温手中夺得植物学家的指南。此外，将5瓶超级治疗药水、5瓶超级法力药水和5瓶特效无梦睡眠药水一并交给她。"
Inst58Quest3_Location = "劳兰娜·萨维尔(赞加沼泽 - 塞纳里奥庇护所; "..YELLOW.."80,64"..WHITE..")"
Inst58Quest3_Note = "炼金师任务。高级植物学家弗雷温在 "..YELLOW.."[2]"..WHITE.."。"
Inst58Quest3_Prequest = "药水大师"
Inst58Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst58Quest4 = "4. 悬赏：扭木碎片"
Inst58Quest4_Aim = "商人扎雷姆要求你夺得一份扭木碎片。将碎片带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst58Quest4_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst58Quest4_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n迁跃扭木在 "..YELLOW.."[5]"..WHITE.."。"
Inst58Quest4_Prequest = "无"
Inst58Quest4_Folgequest = "无"
--
Inst58Quest4name1 = "公正徽章"

--Quest 5 Alliance
Inst58Quest5 = "5. 悬赏：寻日者导魔者"
Inst58Quest5_Aim = "虚空猎手玛哈杜恩要求你杀死6名寻日者导魔者。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst58Quest5_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst58Quest5_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst58Quest5_Prequest = "无"
Inst58Quest5_Folgequest = "无"
--
Inst58Quest5name1 = "复仇军监牢钥匙"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst58Quest1_HORDE = Inst58Quest1
Inst58Quest1_HORDE_Aim = Inst58Quest1_Aim
Inst58Quest1_HORDE_Location = Inst58Quest1_Location
Inst58Quest1_HORDE_Note = Inst58Quest1_Note
Inst58Quest1_HORDE_Prequest = Inst58Quest1_Prequest
Inst58Quest1_HORDE_Folgequest = Inst58Quest1_Folgequest
--
Inst58Quest1name1_HORDE = Inst58Quest1name1
Inst58Quest1name2_HORDE = Inst58Quest1name2
Inst58Quest1name3_HORDE = Inst58Quest1name3
Inst58Quest1name4_HORDE = Inst58Quest1name4
Inst58Quest1name5_HORDE = Inst58Quest1name5
Inst58Quest1name6_HORDE = Inst58Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst58Quest2_HORDE = Inst58Quest2
Inst58Quest2_HORDE_Aim = Inst58Quest2_Aim
Inst58Quest2_HORDE_Location = Inst58Quest2_Location
Inst58Quest2_HORDE_Note = Inst58Quest2_Note
Inst58Quest2_HORDE_Prequest = Inst58Quest2_Prequest
Inst58Quest2_HORDE_Folgequest = Inst58Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst58Quest3_HORDE = Inst58Quest3
Inst58Quest3_HORDE_Aim = Inst58Quest3_Aim
Inst58Quest3_HORDE_Location = Inst58Quest3_Location
Inst58Quest3_HORDE_Note = Inst58Quest3_Note
Inst58Quest3_HORDE_Prequest = Inst58Quest3_Prequest
Inst58Quest3_HORDE_Folgequest = Inst58Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst58Quest4_HORDE = Inst58Quest4
Inst58Quest4_HORDE_Aim = Inst58Quest4_Aim
Inst58Quest4_HORDE_Location = Inst58Quest4_Location
Inst58Quest4_HORDE_Note = Inst58Quest4_Note
Inst58Quest4_HORDE_Prequest = Inst58Quest4_Prequest
Inst58Quest4_HORDE_Folgequest = Inst58Quest4_Folgequest
--
Inst58Quest4name1_HORDE = Inst58Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst58Quest5_HORDE = Inst58Quest5
Inst58Quest5_HORDE_Aim = Inst58Quest5_Aim
Inst58Quest5_HORDE_Location = Inst58Quest5_Location
Inst58Quest5_HORDE_Note = Inst58Quest5_Note
Inst58Quest5_HORDE_Prequest = Inst58Quest5_Prequest
Inst58Quest5_HORDE_Folgequest = Inst58Quest5_Folgequest
--
Inst58Quest5name1_HORDE = Inst58Quest5name1



--------------- INST59 - The Mechanar ---------------

Inst59Caption = "能源舰"
Inst59QAA = "4个任务"
Inst59QAH = "4个任务"

--Quest 1 Alliance
Inst59Quest1 = "1. 如何杀入禁魔监狱"
Inst59Quest1_Aim = "阿达尔要你取回禁魔监狱钥匙的上半块和下半块，他会将这两块碎片组合成禁魔监狱钥匙。"
Inst59Quest1_Location = "阿达尔(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")"
Inst59Quest1_Note = "上半块掉落自位于 "..YELLOW.."[5]"..WHITE.."的计算者帕萨雷恩。下半块在生态船掉落。"
Inst59Quest1_Prequest = "星界强盗奈萨德 -> 送往沙塔斯的特殊货物"
Inst59Quest1_Folgequest = "末日的预言者("..YELLOW.."风暴要塞: 禁魔监狱"..WHITE..")"
--
Inst59Quest1name1 = "沙塔尔学者披风"
Inst59Quest1name2 = "阿达尔的礼物"
Inst59Quest1name3 = "纳鲁精准腰带"
Inst59Quest1name4 = "沙塔斯勇士腰带"
Inst59Quest1name5 = "沙塔尔守备官腰带"
Inst59Quest1name6 = "禁魔监狱钥匙"

--Quest 2 Alliance
Inst59Quest2 = "2. 能源舰的热源"
Inst59Quest2_Aim = "将超载的魔法晶格交给韦恩的避难所的戴维·韦恩。"
Inst59Quest2_Location = "戴维·韦恩(泰罗卡森林 - 韦恩的避难所; "..YELLOW.."78,39"..WHITE..")"
Inst59Quest2_Note = "晶格在机械领主卡帕西图斯前面，位于 "..YELLOW.."[3]"..WHITE.."，靠近墙壁的一个箱子旁。\n\n完成此任务和魔语辞典("..YELLOW.."奥金顿: 暗影迷宫"..WHITE..")将从戴维·韦恩那里开启两个新任务。\n\n这个任务在普通和英雄模式下都可以完成。"
Inst59Quest2_Prequest = "其它的材料"
Inst59Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst59Quest3 = "3. 悬赏：帕萨雷恩的投影仪"
Inst59Quest3_Aim = "商人扎雷姆要求你夺得帕萨雷恩的投影仪。将投影仪带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst59Quest3_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst59Quest3_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n计算者帕萨雷恩在 "..YELLOW.."[5]"..WHITE.."。"
Inst59Quest3_Prequest = "无"
Inst59Quest3_Folgequest = "无"
--
Inst59Quest3name1 = "公正徽章"

--Quest 4 Alliance
Inst59Quest4 = "4. 悬赏：风暴锻铸摧毁者"
Inst59Quest4_Aim = "虚空猎手玛哈杜恩要求你杀死5名风暴锻铸摧毁者。完成任务后返回沙塔斯城的贫民窟，找他领取奖赏。"
Inst59Quest4_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst59Quest4_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst59Quest4_Prequest = "无"
Inst59Quest4_Folgequest = "无"
--
Inst59Quest4name1 = "复仇军监牢钥匙"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst59Quest1_HORDE = Inst59Quest1
Inst59Quest1_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest1_HORDE_Location = Inst59Quest1_Location
Inst59Quest1_HORDE_Note = Inst59Quest1_Note
Inst59Quest1_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest1_HORDE_Folgequest = Inst59Quest1_Folgequest
--
Inst59Quest1name1_HORDE = Inst59Quest1name1
Inst59Quest1name2_HORDE = Inst59Quest1name2
Inst59Quest1name3_HORDE = Inst59Quest1name3
Inst59Quest1name4_HORDE = Inst59Quest1name4
Inst59Quest1name5_HORDE = Inst59Quest1name5
Inst59Quest1name6_HORDE = Inst59Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst59Quest2_HORDE = Inst59Quest2
Inst59Quest2_HORDE_Aim = Inst59Quest2_Aim
Inst59Quest2_HORDE_Location = Inst59Quest2_Location
Inst59Quest2_HORDE_Note = Inst59Quest2_Note
Inst59Quest2_HORDE_Prequest = Inst59Quest2_Prequest
Inst59Quest2_HORDE_Folgequest = Inst59Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst59Quest3_HORDE = Inst59Quest3
Inst59Quest3_HORDE_Aim = Inst59Quest3_Aim
Inst59Quest3_HORDE_Location = Inst59Quest3_Location
Inst59Quest3_HORDE_Note = Inst59Quest3_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest3_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest3_Folgequest
--
Inst59Quest3name1_HORDE = Inst59Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst59Quest4_HORDE = Inst59Quest4
Inst59Quest4_HORDE_Aim = Inst59Quest4_Aim
Inst59Quest4_HORDE_Location = Inst59Quest4_Location
Inst59Quest4_HORDE_Note = Inst59Quest4_Note
Inst59Quest4_HORDE_Prequest = Inst59Quest4_Prequest
Inst59Quest4_HORDE_Folgequest = Inst59Quest4_Folgequest
--
Inst59Quest4name1_HORDE = Inst59Quest4name1



--------------- INST61 - The Eye ---------------

Inst61Caption = "风暴要塞"
Inst61QAA = "3个任务"
Inst61QAH = "3个任务"

--Quest 1 Alliance
Inst61Quest1 = "1. 灰舌的计谋"
Inst61Quest1_Aim = "前往风暴要塞，在穿着灰舌兜帽的情况下杀死奥。完成任务之后回到影月谷，向阿卡玛复命。"
Inst61Quest1_Location = "阿卡玛(影月谷 - 守望者牢笼; "..YELLOW.."58,48"..WHITE..")"
Inst61Quest1_Note = "这是黑暗神殿进入资格任务系列的一部分。"
Inst61Quest1_Prequest = "危险的秘密("..YELLOW.."毒蛇神殿"..WHITE..")"
Inst61Quest1_Folgequest = "往日的神器("..YELLOW.."海加尔山之战"..WHITE..")"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. 凯尔萨斯和翠绿的魔珠"
Inst61Quest2_Aim = "将翠绿的魔珠交给沙塔斯城的阿达尔。"
Inst61Quest2_Location = "翠绿的魔珠(掉落自位于 "..YELLOW.."[4]"..WHITE.."的凯尔萨斯·逐日者)"
Inst61Quest2_Note = "阿达尔在(沙塔斯城 - 圣光广场; "..YELLOW.."53,43"..WHITE..")。"
Inst61Quest2_Prequest = "无"
Inst61Quest2_Folgequest = "无"
--
Inst61Quest2name1 = "亵渎者萨拉德雷之握"
Inst61Quest2name2 = "太阳之王的符咒"
Inst61Quest2name3 = "塔隆尼库斯的伤害坠饰"
Inst61Quest2name4 = "萨古纳尔男爵的索求"

--Quest 3 Alliance
Inst61Quest3 = "3. 永恒水瓶"
Inst61Quest3_Aim = "时光之穴的索莉多米要你从盘牙水库的瓦丝琪那里取回瓦丝琪的水瓶残余，并从风暴要塞的凯尔萨斯·逐日者那里取回凯尔萨斯的水瓶残余。"
Inst61Quest3_Location = "索莉多米(塔纳利斯 - 时光之穴; "..YELLOW.."58,57"..WHITE..")。NPC在该区域四处走动。"
Inst61Quest3_Note = "这个任务是为了进入海加尔山之战的准入资格所需。凯尔萨斯·逐日者在 "..YELLOW.."[4]"..WHITE.."。"
Inst61Quest3_Prequest = "无"
Inst61Quest3_Folgequest = "无"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst61Quest1_HORDE = Inst61Quest1
Inst61Quest1_HORDE_Aim = Inst61Quest1_Aim
Inst61Quest1_HORDE_Location = Inst61Quest1_Location
Inst61Quest1_HORDE_Note = Inst61Quest1_Note
Inst61Quest1_HORDE_Prequest = Inst61Quest1_Prequest
Inst61Quest1_HORDE_Folgequest = Inst61Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst61Quest2_HORDE = Inst61Quest2
Inst61Quest2_HORDE_Aim = Inst61Quest2_Aim
Inst61Quest2_HORDE_Location = Inst61Quest2_Location
Inst61Quest2_HORDE_Note = Inst61Quest2_Note
Inst61Quest2_HORDE_Prequest = Inst61Quest2_Prequest
Inst61Quest2_HORDE_Folgequest = Inst61Quest2_Folgequest
--
Inst61Quest2name1_HORDE = Inst61Quest2name1
Inst61Quest2name2_HORDE = Inst61Quest2name2
Inst61Quest2name3_HORDE = Inst61Quest2name3
Inst61Quest2name4_HORDE = Inst61Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst61Quest3_HORDE = Inst61Quest3
Inst61Quest3_HORDE_Aim = Inst61Quest3_Aim
Inst61Quest3_HORDE_Location = Inst61Quest3_Location
Inst61Quest3_HORDE_Note = Inst61Quest3_Note
Inst61Quest3_HORDE_Prequest = Inst61Quest3_Prequest
Inst61Quest3_HORDE_Folgequest = Inst61Quest3_Folgequest
-- No Rewards for this quest



--------------- INST62 - Black Temple ---------------

Inst62Caption = "黑暗神殿"
Inst62QAA = "3个任务"
Inst62QAH = "3个任务"

--Quest 1 Alliance
Inst62Quest1 = "1. 寻找灰舌"
Inst62Quest1_Aim = "在黑暗神殿内找到阿卡玛的死誓者。"
Inst62Quest1_Location = "克希利(影月谷; "..YELLOW.."65,44"..WHITE..")"
Inst62Quest1_Note = "奥鲁姆之魂位于你进入黑暗神殿后的左边，在 "..YELLOW.."[1]"..WHITE.."。当你击败高阶督军纳因图斯在 "..YELLOW.."[2]"..WHITE.."和苏普雷姆斯在 "..YELLOW.."[3]"..WHITE.."后，他会将你传送到先知坎奈那里。"
Inst62Quest1_Prequest = "危险的秘密 -> 帮助阿卡玛"
Inst62Quest1_Folgequest = "灰舌的救赎"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. 灰舌的救赎"
Inst62Quest2_Aim = "击败黑暗神殿内的阿卡玛之影，帮助阿卡玛夺回灵魂的控制权。完成任务之后向先知坎奈复命。"
Inst62Quest2_Location = "先知坎奈(黑暗神殿; "..YELLOW.."[5]"..WHITE..")"
Inst62Quest2_Note = "阿卡玛之影在 "..YELLOW.."[4]"..WHITE.."。"
Inst62Quest2_Prequest = "寻找灰舌"
Inst62Quest2_Folgequest = "背叛者之死"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. 背叛者之死"
Inst62Quest3_Aim = "先知坎奈要求你击败黑暗神殿内的伊利丹。"
Inst62Quest3_Location = "先知坎奈(黑暗神殿; "..YELLOW.."[5]"..WHITE..")"
Inst62Quest3_Note = "伊利丹·怒风在 "..YELLOW.."[11]"..WHITE.."。"
Inst62Quest3_Prequest = "灰舌的救赎"
Inst62Quest3_Folgequest = "无"
--
Inst62Quest3name1 = "卡拉波神圣勋章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst62Quest1_HORDE = Inst62Quest1
Inst62Quest1_HORDE_Aim = Inst62Quest1_Aim
Inst62Quest1_HORDE_Location = Inst62Quest1_Location
Inst62Quest1_HORDE_Note = Inst62Quest1_Note
Inst62Quest1_HORDE_Prequest = Inst62Quest1_Prequest
Inst62Quest1_HORDE_Folgequest = Inst62Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst62Quest2_HORDE = Inst62Quest2
Inst62Quest2_HORDE_Aim = Inst62Quest2_Aim
Inst62Quest2_HORDE_Location = Inst62Quest2_Location
Inst62Quest2_HORDE_Note = Inst62Quest2_Note
Inst62Quest2_HORDE_Prequest = Inst62Quest2_Prequest
Inst62Quest2_HORDE_Folgequest = Inst62Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst62Quest3_HORDE = Inst62Quest3
Inst62Quest3_HORDE_Aim = Inst62Quest3_Aim
Inst62Quest3_HORDE_Location = Inst62Quest3_Location
Inst62Quest3_HORDE_Note = Inst62Quest3_Note
Inst62Quest3_HORDE_Prequest = Inst62Quest3_Prequest
Inst62Quest3_HORDE_Folgequest = Inst62Quest3_Folgequest
--
Inst62Quest3name1_HORDE = Inst62Quest3name1



--------------- INST63 - Zul'Aman ---------------

Inst63Caption = "祖阿曼"
Inst63QAA = "8个任务"
Inst63QAH = "8个任务"

--Quest 1 Alliance
Inst63Quest1 = "1. 诱人的保证"
Inst63Quest1_Aim = "战斧岭的巴德·奈德雷克要你前往祖阿曼的高阶祭司纳洛拉克所在的平台，找回他的地图。"
Inst63Quest1_Location = "巴德·奈德雷克(幽魂之地 - 战斧岭; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest1_Note = "位于高阶祭司纳洛拉克附近的右侧坡道上 "..YELLOW.."[2]"..WHITE.."。前置任务是可选的，起始于位于(沙塔斯城 - 贫民窟; "..YELLOW.."65,69"..WHITE..")的格里伏塔。"
Inst63Quest1_Prequest = "闪亮闪亮的东西！"
Inst63Quest1_Folgequest = "X标记......你的末日！"
--
Inst63Quest1name1 = "破烂的巫术布袋"

--Quest 2 Alliance
Inst63Quest2 = "2. X标记......你的末日！"
Inst63Quest2_Aim = "进入祖阿曼并调查哈尔拉兹的大厅、加亚莱的平台和埃基尔松的平台。将这些地方的细节报告给巴德，他的营地就在幽魂之地。"
Inst63Quest2_Location = "巴德·奈德雷克(幽魂之地 - 战斧岭; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest2_Note = "哈尔拉兹的大厅位于 "..YELLOW.."[4]"..WHITE.."，加亚莱的平台位于 "..YELLOW.."[3]"..WHITE.."，而埃基尔松的平台位于 "..YELLOW.."[1]"..WHITE.."。 \n\n据报道，为了完成任务并不需要与这些首领战斗。只需要靠近他们但不要触发仇恨。" 
Inst63Quest2_Prequest = "诱人的保证"
Inst63Quest2_Folgequest = "妖术领主？哈！"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. 妖术领主？哈！"
Inst63Quest3_Aim = "战斧岭的巴德·奈德雷克要你前往祖阿曼，杀死妖术领主玛拉卡斯。"
Inst63Quest3_Location = "巴德·奈德雷克(幽魂之地 - 战斧岭; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest3_Note = "妖术领主玛拉卡斯在 "..YELLOW.."[6]"..WHITE.."。"
Inst63Quest3_Prequest = "X标记......你的末日！"
Inst63Quest3_Folgequest = "无"
--
Inst63Quest3name1 = "公正徽章"

--Quest 4 Alliance
Inst63Quest4 = "4. 夺牙奇兵"
Inst63Quest4_Aim = "普雷蒙要你从祖阿曼的巨魔身上收集10根森林巨魔獠牙，把它们带回巴德的营地交给他。"
Inst63Quest4_Location = "普雷蒙(幽魂之地 - 战斧岭; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest4_Note = "森林巨魔獠牙从祖阿曼内的阿曼尼怪物那里掉落。"
Inst63Quest4_Prequest = "无"
Inst63Quest4_Folgequest = "失踪的巨魔"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. 失踪的巨魔"
Inst63Quest5_Aim = "普雷蒙希望你深入祖阿曼，找到并帮助他的表兄苏加姆。"
Inst63Quest5_Location = "普雷蒙(幽魂之地 - 战斧岭; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest5_Note = "苏加姆位于 "..YELLOW.."[1']"..WHITE.."的一个小屋里。释放他后，他会给你后续任务。"
Inst63Quest5_Prequest = "夺牙奇兵"
Inst63Quest5_Folgequest = "破烂的巫毒人偶"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. 破烂的巫毒人偶"
Inst63Quest6_Aim = "将破烂的巫毒人偶交给沙塔斯城的格里伏塔。"
Inst63Quest6_Location = "苏加姆(祖阿曼; "..YELLOW.."[1']"..WHITE..")"
Inst63Quest6_Note = "格里伏塔在(沙塔斯城 - 贫民窟; "..YELLOW.."65,69"..WHITE..")。"
Inst63Quest6_Prequest = "失踪的巨魔"
Inst63Quest6_Folgequest = "无"
--
Inst63Quest6name1 = "魔法阿曼尼珠宝"

--Quest 7 Alliance
Inst63Quest7 = "7. 督军之血"
Inst63Quest7_Aim = "把祖尔金之血交给祖阿曼外面幽魂之地的巴德。"
Inst63Quest7_Location = "祖尔金之血(掉落自祖尔金; "..YELLOW.."[6]"..WHITE..")"
Inst63Quest7_Note = "团队中只有一人可以拾取这个物品，且这个任务只能做一次。"
Inst63Quest7_Prequest = "无"
Inst63Quest7_Folgequest = "对不起，我是卧底"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. 对不起，我是卧底"
Inst63Quest8_Aim = "向多娜·布拉斯库报告你的英雄事迹，并领取你的奖励。多娜现在驻扎在祖阿曼外面的幽魂之地。"
Inst63Quest8_Location = "多娜·布拉斯库(幽魂之地 - 战斧岭; "..YELLOW.."70,68"..WHITE..")"
Inst63Quest8_Note = ""
Inst63Quest8_Prequest = "督军之血"
Inst63Quest8_Folgequest = "无"
--
Inst63Quest8name1 = "公正徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst63Quest1_HORDE = Inst63Quest1
Inst63Quest1_HORDE_Aim = Inst63Quest1_Aim
Inst63Quest1_HORDE_Location = Inst63Quest1_Location
Inst63Quest1_HORDE_Note = Inst63Quest1_Note
Inst63Quest1_HORDE_Prequest = Inst63Quest1_Prequest
Inst63Quest1_HORDE_Folgequest = Inst63Quest1_Folgequest
--
Inst63Quest1name1_HORDE = Inst63Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst63Quest2_HORDE = Inst63Quest2
Inst63Quest2_HORDE_Aim = Inst63Quest2_Aim
Inst63Quest2_HORDE_Location = Inst63Quest2_Location
Inst63Quest2_HORDE_Note = Inst63Quest2_Note
Inst63Quest2_HORDE_Prequest = Inst63Quest2_Prequest
Inst63Quest2_HORDE_Folgequest = Inst63Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst63Quest3_HORDE = Inst63Quest3
Inst63Quest3_HORDE_Aim = Inst63Quest3_Aim
Inst63Quest3_HORDE_Location = Inst63Quest3_Location
Inst63Quest3_HORDE_Note = Inst63Quest3_Note
Inst63Quest3_HORDE_Prequest = Inst63Quest3_Prequest
Inst63Quest3_HORDE_Folgequest = Inst63Quest3_Folgequest
--
Inst63Quest3name1_HORDE = Inst63Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst63Quest4_HORDE = Inst63Quest4
Inst63Quest4_HORDE_Aim = Inst63Quest4_Aim
Inst63Quest4_HORDE_Location = Inst63Quest4_Location
Inst63Quest4_HORDE_Note = Inst63Quest4_Note
Inst63Quest4_HORDE_Prequest = Inst63Quest4_Prequest
Inst63Quest4_HORDE_Folgequest = Inst63Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst63Quest5_HORDE = Inst63Quest5
Inst63Quest5_HORDE_Aim = Inst63Quest5_Aim
Inst63Quest5_HORDE_Location = Inst63Quest5_Location
Inst63Quest5_HORDE_Note = Inst63Quest5_Note
Inst63Quest5_HORDE_Prequest = Inst63Quest5_Prequest
Inst63Quest5_HORDE_Folgequest = Inst63Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst63Quest6_HORDE = Inst63Quest6
Inst63Quest6_HORDE_Aim = Inst63Quest6_Aim
Inst63Quest6_HORDE_Location = Inst63Quest6_Location
Inst63Quest6_HORDE_Note = Inst63Quest6_Note
Inst63Quest6_HORDE_Prequest = Inst63Quest6_Prequest
Inst63Quest6_HORDE_Folgequest = Inst63Quest6_Folgequest
--
Inst63Quest6name1_HORDE = Inst63Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst63Quest7_HORDE = Inst63Quest7
Inst63Quest7_HORDE_Aim = Inst63Quest7_Aim
Inst63Quest7_HORDE_Location = Inst63Quest7_Location
Inst63Quest7_HORDE_Note = Inst63Quest7_Note
Inst63Quest7_HORDE_Prequest = Inst63Quest7_Prequest
Inst63Quest7_HORDE_Folgequest = Inst63Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst63Quest8_HORDE = Inst63Quest8
Inst63Quest8_HORDE_Aim = Inst63Quest8_Aim
Inst63Quest8_HORDE_Location = Inst63Quest8_Location
Inst63Quest8_HORDE_Note = Inst63Quest8_Note
Inst63Quest8_HORDE_Prequest = Inst63Quest8_Prequest
Inst63Quest8_HORDE_Folgequest = Inst63Quest8_Folgequest
--
Inst63Quest8name1_HORDE = Inst63Quest8name1



--------------- INST67 - Magisters' Terrace ---------------

Inst67Caption = "魔导师平台"
Inst67QAA = "5个任务"
Inst67QAH = "5个任务"

--Quest 1 Alliance
Inst67Quest1 = "1. 悬赏：痛苦妖女"
Inst67Quest1_Aim = "虚空猎手玛哈杜恩要求你杀死4名痛苦妖女。完成任务后返回沙塔斯城的贫民窟，向他领取奖赏。"
Inst67Quest1_Location = "虚空猎手玛哈杜恩(沙塔斯城 - 贫民窟; "..YELLOW.."75.2, 37.6"..WHITE..")"
Inst67Quest1_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。它可以在任何难度下完成。"
Inst67Quest1_Prequest = "无"
Inst67Quest1_Folgequest = "无"
--
Inst67Quest1name1 = "复仇军监牢钥匙"

--Quest 2 Alliance
Inst67Quest2 = "2. 悬赏：凯尔萨斯王子的徽记之戒"
Inst67Quest2_Aim = "商人扎雷姆要求你夺得凯尔萨斯王子的徽记之戒。将戒指带回沙塔斯城的贫民窟交给他，就能领取奖赏。"
Inst67Quest2_Location = "商人扎雷姆(沙塔斯城 - 贫民窟; "..YELLOW.."75.0, 36.8"..WHITE..")"
Inst67Quest2_Note = "这是从这个NPC那里每天可获得的众多日常任务之一。需要英雄难度。\n\n凯尔萨斯王子在 "..YELLOW.."[6]"..WHITE.."。"
Inst67Quest2_Prequest = "无"
Inst67Quest2_Folgequest = "无"
--
Inst67Quest2name1 = "公正徽章"

--Quest 3 Alliance
Inst67Quest3 = "3. 魔导师平台"
Inst67Quest3_Aim = "破碎残阳基地的主教拉雷索尔要求你前往魔导师平台，寻找血精灵间谍塔雷斯的踪迹。"
Inst67Quest3_Location = "主教拉雷索尔(奎尔丹纳斯岛 - 破碎残阳基地; "..YELLOW.."47,31"..WHITE..")"
Inst67Quest3_Note = "塔雷斯位于副本内的 "..YELLOW.."[2]"..WHITE.."。这个任务线解锁英雄模式。\n\n前置任务可以从圣光护卫者阿德因(沙塔斯城 - 奥尔多高地; "..YELLOW.."35,36"..WHITE..")或达斯雷·射日者(沙塔斯城 - 占星者之台; "..YELLOW.."55,80"..WHITE..")那里获得。"
Inst67Quest3_Prequest = "太阳之井的危机 或 使命的召唤"
Inst67Quest3_Folgequest = "占星球"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. 占星球"
Inst67Quest4_Aim = "塔雷斯要求你使用魔导师平台内的阳台上的宝珠。"
Inst67Quest4_Location = "塔雷斯(魔导师平台; "..YELLOW.."[2]"..WHITE..")"
Inst67Quest4_Note = "占卜宝珠位于 "..YELLOW.."[4]"..WHITE.."。在电影片段之后，卡雷苟斯会出现并开始下一个任务。"
Inst67Quest4_Prequest = "魔导师平台"
Inst67Quest4_Folgequest = "大难不死"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. 大难不死"
Inst67Quest5_Aim = "卡雷苟斯要求你击败魔导师平台内的凯尔萨斯。取下凯尔萨斯的徽记之后，立刻向破碎残阳基地的主教拉雷索尔复命。"
Inst67Quest5_Location = "卡雷苟斯(魔导师平台; "..YELLOW.."[4]"..WHITE..")"
Inst67Quest5_Note = "凯尔萨斯·逐日者在 "..YELLOW.."[6]"..WHITE.."。完成此任务还使您能够在英雄模式下进行魔导师平台的战斗。\n\n拉雷索尔在(奎尔丹纳斯岛 - 破碎残阳基地; "..YELLOW.."47,31"..WHITE..")。"
Inst67Quest5_Prequest = "占星球"
Inst67Quest5_Folgequest = "无"
--
Inst67Quest5name1 = "精致赤尖石"
Inst67Quest5name2 = "闪耀赤尖石"
Inst67Quest5name3 = "闪耀赤尖石"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst67Quest1_HORDE = Inst67Quest1
Inst67Quest1_HORDE_Aim = Inst67Quest1_Aim
Inst67Quest1_HORDE_Location = Inst67Quest1_Location
Inst67Quest1_HORDE_Note = Inst67Quest1_Note
Inst67Quest1_HORDE_Prequest = Inst67Quest1_Prequest
Inst67Quest1_HORDE_Folgequest = Inst67Quest1_Folgequest
--
Inst67Quest1name1_HORDE = Inst67Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst67Quest2_HORDE = Inst67Quest2
Inst67Quest2_HORDE_Aim = Inst67Quest2_Aim
Inst67Quest2_HORDE_Location = Inst67Quest2_Location
Inst67Quest2_HORDE_Note = Inst67Quest2_Note
Inst67Quest2_HORDE_Prequest = Inst67Quest2_Prequest
Inst67Quest2_HORDE_Folgequest = Inst67Quest2_Folgequest
--
Inst67Quest2name1_HORDE = Inst67Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst67Quest3_HORDE = Inst67Quest3
Inst67Quest3_HORDE_Aim = Inst67Quest3_Aim
Inst67Quest3_HORDE_Location = Inst67Quest3_Location
Inst67Quest3_HORDE_Note = Inst67Quest3_Note
Inst67Quest3_HORDE_Prequest = Inst67Quest3_Prequest
Inst67Quest3_HORDE_Folgequest = Inst67Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst67Quest4_HORDE = Inst67Quest4
Inst67Quest4_HORDE_Aim = Inst67Quest4_Aim
Inst67Quest4_HORDE_Location = Inst67Quest4_Location
Inst67Quest4_HORDE_Note = Inst67Quest4_Note
Inst67Quest4_HORDE_Prequest = Inst67Quest4_Prequest
Inst67Quest4_HORDE_Folgequest = Inst67Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst67Quest5_HORDE = Inst67Quest5
Inst67Quest5_HORDE_Aim = Inst67Quest5_Aim
Inst67Quest5_HORDE_Location = Inst67Quest5_Location
Inst67Quest5_HORDE_Note = Inst67Quest5_Note
Inst67Quest5_HORDE_Prequest = Inst67Quest5_Prequest
Inst67Quest5_HORDE_Folgequest = Inst67Quest5_Folgequest
--
Inst67Quest5name1_HORDE = Inst67Quest5name1
Inst67Quest5name2_HORDE = Inst67Quest5name2
Inst67Quest5name3_HORDE = Inst67Quest5name3



--------------- INST68 - Sunwell Plateau ---------------

Inst68Caption = "太阳之井高地"
Inst68QAA = "没有任务"
Inst68QAH = "没有任务"



--------------- INST60 - Eye of the Storm ---------------

Inst60Caption = "Eye of the Storm"
Inst60QAA = "1 Quest"
Inst60QAH = "1 Quest"

--Quest 1 Alliance
Inst60Quest1 = "1. Call to Arms: Eye of the Storm"
Inst60Quest1_Aim = "Win an Eye of the Storm battleground match and return to an Alliance Brigadier General at any Alliance capital city or Shattrath."
Inst60Quest1_Location = "Alliance Brigadier General:\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."79.4, 18.0"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.8, 90.0"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.8, 34.6"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst60Quest1_Note = "This quest can be done once a day after reaching level 61. It yields varying amounts of experience and gold based on your level."
Inst60Quest1_Prequest = "None"
Inst60Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. Call to Arms: Eye of the Storm"
Inst60Quest1_HORDE_Aim = "Win an Eye of the Storm battleground match and return to a Horde Warbringer at any Horde capital city or Shattrath."
Inst60Quest1_HORDE_Location = "Horde Warbringer:\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst60Quest1_HORDE_Note = "This quest can be done once a day after reaching level 61. It yields varying amounts of experience and gold based on your level."
Inst60Quest1_HORDE_Prequest = "None"
Inst60Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest





--------------- INST65 - Skettis ---------------

Inst65Caption = "斯克提斯"
Inst65QAA = "13个任务"
Inst65QAH = "13个任务"

--Quest 1 Alliance
Inst65Quest1 = "1. 前往斯克提斯！"
Inst65Quest1_Aim = "前往位于斯克提斯外的黑风码头，将炸药包交给空军上尉杜尔因。"
Inst65Quest1_Location = "尤拉(沙塔斯城; "..YELLOW.."65,42"..WHITE..")"
Inst65Quest1_Note = "前置任务也是从同一个NPC处获得的。黑风码头位于 "..YELLOW.."[1]"..WHITE.."。"
Inst65Quest1_Prequest = "空中的威胁"
Inst65Quest1_Folgequest = "轰炸斯克提斯"
-- No Rewards for this quest

--Quest 2 Alliance
Inst65Quest2 = "2. 轰炸斯克提斯"
Inst65Quest2_Aim = "找到斯克提斯巢穴上面的巨大的卡利鸟蛋，利用天空卫队的炸弹毁掉它们。完成任务之后回去向空军上尉杜尔因复命。"
Inst65Quest2_Location = "空军上尉杜尔因(泰罗卡森林 - 黑风码头; "..YELLOW.."65,66"..WHITE..")"
Inst65Quest2_Note = "日常任务。你可以在空中骑着飞行坐骑轰炸这些蛋。但要小心周围飞翔的巨大的卡利鸟，因为如果它们对你产生敌意，它们会让你掉下坐骑。这个任务可以组队完成。"
Inst65Quest2_Prequest = "前往斯克提斯!"
Inst65Quest2_Folgequest = "无"
-- No Rewards for this quest

--Quest 3 Alliance
Inst65Quest3 = "3. 逃离斯克提斯"
Inst65Quest3_Aim = "护送天空卫队囚犯前往安全的地方，然后向空军上尉杜尔因复命。"
Inst65Quest3_Location = "天空卫队囚犯(泰罗卡森林 - 斯克提斯; "..YELLOW.."[4]"..WHITE..")"
Inst65Quest3_Note = "日常任务。完成“前往斯克提斯！”之后，此任务将会开放。\n天空卫队囚犯会在标记为 "..YELLOW.."[4]"..WHITE.."的三个位置中的一个随机刷新。这个任务可以组队完成。"
Inst65Quest3_Prequest = "无"
Inst65Quest3_Folgequest = "无"
-- No Rewards for this quest

--Quest 4 Alliance
Inst65Quest4 = "4. 饥饿的虚空鳐"
Inst65Quest4_Aim = "在黑风码头南边的森林内使用虚空鳐的笼子，并在饥饿的虚空鳐旁杀死黑风追迹者。完成任务之后回去向天空卫队训练师德萨克复命。"
Inst65Quest4_Location = "天空卫队训练师德萨克(泰罗卡森林 - 黑风码头; "..YELLOW.."63,66"..WHITE..")"
Inst65Quest4_Note = "黑风追迹者(确保你击杀的是黑风追迹者，而不是迁跃捕猎者）可以在斯克提斯的南部边缘找到。当黑风追迹者被击杀时，饥饿的虚空鳐必须靠近它。在获得任务进度之前，不要离开尸体，通常需要几秒钟。"
Inst65Quest4_Prequest = "无"
Inst65Quest4_Folgequest = "无"
--
Inst65Quest4name1 = "特效敏捷药剂"
Inst65Quest4name2 = "法能药剂"

--Quest 5 Alliance
Inst65Quest5 = "5. 阴影世界"
Inst65Quest5_Aim = "瑟维里要你进入斯克提斯，从居住在那里的鸦人身上找到6份暗影之尘。"
Inst65Quest5_Location = "瑟维里(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest5_Note = "可重复任务。任何鸦人都有可能掉落暗影之尘。"
Inst65Quest5_Prequest = "无"
Inst65Quest5_Folgequest = "无"
--
Inst65Quest5name1 = "暗影药剂"

--Quest 6 Alliance
Inst65Quest6 = "6. 鸦爪祭司的秘密"
Inst65Quest6_Aim = "从瑟维里那儿获取暗影药剂。前往斯克提斯，利用暗影药剂找到并杀死伊沙尔、斯卡基克和塞尔利克三位鸦爪祭司。完成任务后向空军指挥官阿达利斯复命。"
Inst65Quest6_Location = "空军指挥官阿达利斯(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest6_Note = "在做这个任务之前，你必须完成阴影世界任务以获得暗影药剂。鸦爪祭司伊沙尔位于"..YELLOW.."[5]"..WHITE.."，鸦爪祭司斯卡基克位于 "..YELLOW.."[6]"..WHITE.."，而鸦爪祭司塞尔利克位于 "..YELLOW.."[7]"..WHITE.."。"
Inst65Quest6_Prequest = "阴影世界"
Inst65Quest6_Folgequest = "无"
-- No Rewards for this quest

--Quest 7 Alliance
Inst65Quest7 = "7. 伊沙尔的历书"
Inst65Quest7_Aim = "将伊沙尔的历书交给斯克提斯北面的空军指挥官阿达利斯。"
Inst65Quest7_Location = "伊沙尔的历书(掉落自鸦爪祭司伊沙尔; "..YELLOW.."[5]"..WHITE..")"
Inst65Quest7_Note = "空军指挥官阿达利斯在泰罗卡森林 - 黑风码头 ("..YELLOW.."64,66"..WHITE..")。"
Inst65Quest7_Prequest = "无"
Inst65Quest7_Folgequest = "贫民窟的盟友"
-- No Rewards for this quest

--Quest 8 Alliance
Inst65Quest8 = "8. 贫民窟的盟友"
Inst65Quest8_Aim = "将伊沙尔的历书交给沙塔斯城贫民窟中的救赎者瑞拉克。"
Inst65Quest8_Location = "空军指挥官阿达利斯(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest8_Note = "救赎者瑞拉克在 沙塔斯城 - 贫民窟 ("..YELLOW.."52,20"..WHITE..")。"
Inst65Quest8_Prequest = "伊沙尔的历书"
Inst65Quest8_Folgequest = "末日将至"
-- No Rewards for this quest

--Quest 9 Alliance
Inst65Quest9 = "9. 末日将至"
Inst65Quest9_Aim = "向在黑风码头的空军指挥官阿达利斯汇报泰罗克归来一事。"
Inst65Quest9_Location = "救赎者瑞拉克(沙塔斯城 - 贫民窟; "..YELLOW.."52,20"..WHITE..")"
Inst65Quest9_Note = "空军指挥官阿达利斯在泰罗卡森林 - 黑风码头("..YELLOW.."64,66"..WHITE..")。附近的哈吉克会给你后续的任务。"
Inst65Quest9_Prequest = "贫民窟的盟友"
Inst65Quest9_Folgequest = "哈吉克的协议"
-- No Rewards for this quest

--Quest 10 Alliance
Inst65Quest10 = "10. 哈吉克的协议"
Inst65Quest10_Aim = "进入斯克提斯的东部区域，在哈吉克的住处中找到哈吉克的包裹，然后把包裹带回去给他。"
Inst65Quest10_Location = "哈吉克(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest10_Note = "哈吉克的包裹位于 "..YELLOW.."[8]"..WHITE.."的一个小屋中。"
Inst65Quest10_Prequest = "末日将至"
Inst65Quest10_Folgequest = "粗糙的伪装"
-- No Rewards for this quest

--Quest 11 Alliance
Inst65Quest11 = "11. 粗糙的伪装"
Inst65Quest11_Aim = "穿上粗糙的鸦人伪装服，从萨哈克那儿取得《仇敌的血脉》，然后向哈吉克复命。"
Inst65Quest11_Location = "哈吉克(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest11_Note = "萨哈克在 "..YELLOW.."[3]"..WHITE.."。如果除了萨哈克以外的任何鸦人看到你伪装的模样，他们会攻击你。"
Inst65Quest11_Prequest = "哈吉克的协议"
Inst65Quest11_Folgequest = "仇敌的血脉"
-- No Rewards for this quest

--Quest 12 Alliance
Inst65Quest12 = "12. 仇敌的血脉"
Inst65Quest12_Aim = "在斯克提斯寻找召唤法阵中的徽记堆，用10张迷失卷轴召唤出一个泰罗克仇敌的后裔，并击败总共四个泰罗克仇敌的后裔。完成任务之后回去向黑风码头的哈吉克复命。"
Inst65Quest12_Location = "哈吉克(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest12_Note = "徽记堆位于 "..GREEN.."[1']"..WHITE.."。每次击杀只掉落一个任务物品。因此，每个需要该任务的组成员都需要10个卷轴来召唤后裔获得他们的物品。这个任务物品是绿色品质的，所以如果组队物品拾取开启的话，需要投骰子来决定谁获得。这个任务可以重复完成。"
Inst65Quest12_Prequest = "粗糙的伪装"
Inst65Quest12_Folgequest = "无"
--
Inst65Quest12name1 = "失落的祭品"

--Quest 13 Alliance
Inst65Quest13 = "13. 泰罗克的毁灭"
Inst65Quest13_Aim = "将哈吉克准备好的失落的祭品带到斯克提斯中央的徽记堆，召唤出泰罗克并击败它。完成这个任务之后回去向空军指挥官阿达利斯复命。"
Inst65Quest13_Location = "空军指挥官阿达利斯(泰罗卡森林 - 黑风码头; "..YELLOW.."64,66"..WHITE..")"
Inst65Quest13_Note = "泰罗克在 "..YELLOW.."[2]"..WHITE.."处被召唤。来自Wowhead的fissi0nx的提示：当泰罗克的血量降到20%时，他会对所有攻击变得免疫，不久之后你会看到一个蓝色的闪光，在那里会掉下一颗炸弹。把泰罗克拖到火焰中来打破他的盾牌。他会变得暴怒，但你将能够击败他。"
Inst65Quest13_Prequest = "仇敌的血脉"
Inst65Quest13_Folgequest = "无"
--
Inst65Quest13name1 = "珠宝魔杖"
Inst65Quest13name2 = "斥候的飞刀"
Inst65Quest13name3 = "瑟维里的藤条"
Inst65Quest13name4 = "突击者的长枪"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst65Quest1_HORDE = Inst65Quest1
Inst65Quest1_HORDE_Aim = Inst65Quest1_Aim
Inst65Quest1_HORDE_Location = Inst65Quest1_Location
Inst65Quest1_HORDE_Note = Inst65Quest1_Note
Inst65Quest1_HORDE_Prequest = Inst65Quest1_Prequest
Inst65Quest1_HORDE_Folgequest = Inst65Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst65Quest2_HORDE = Inst65Quest2
Inst65Quest2_HORDE_Aim = Inst65Quest2_Aim
Inst65Quest2_HORDE_Location = Inst65Quest2_Location
Inst65Quest2_HORDE_Note = Inst65Quest2_Note
Inst65Quest2_HORDE_Prequest = Inst65Quest2_Prequest
Inst65Quest2_HORDE_Folgequest = Inst65Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst65Quest3_HORDE = Inst65Quest3
Inst65Quest3_HORDE_Aim = Inst65Quest3_Aim
Inst65Quest3_HORDE_Location = Inst65Quest3_Location
Inst65Quest3_HORDE_Note = Inst65Quest3_Note
Inst65Quest3_HORDE_Prequest = Inst65Quest3_Prequest
Inst65Quest3_HORDE_Folgequest = Inst65Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst65Quest4_HORDE = Inst65Quest4
Inst65Quest4_HORDE_Aim = Inst65Quest4_Aim
Inst65Quest4_HORDE_Location = Inst65Quest4_Location
Inst65Quest4_HORDE_Note = Inst65Quest4_Note
Inst65Quest4_HORDE_Prequest = Inst65Quest4_Prequest
Inst65Quest4_HORDE_Folgequest = Inst65Quest4_Folgequest
--
Inst65Quest4name1_HORDE = Inst65Quest4name1
Inst65Quest4name2_HORDE = Inst65Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst65Quest5_HORDE = Inst65Quest5
Inst65Quest5_HORDE_Aim = Inst65Quest5_Aim
Inst65Quest5_HORDE_Location = Inst65Quest5_Location
Inst65Quest5_HORDE_Note = Inst65Quest5_Note
Inst65Quest5_HORDE_Prequest = Inst65Quest5_Prequest
Inst65Quest5_HORDE_Folgequest = Inst65Quest5_Folgequest
--
Inst65Quest5name1_HORDE = Inst65Quest5name1
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst65Quest6_HORDE = Inst65Quest6
Inst65Quest6_HORDE_Aim = Inst65Quest6_Aim
Inst65Quest6_HORDE_Location = Inst65Quest6_Location
Inst65Quest6_HORDE_Note = Inst65Quest6_Note
Inst65Quest6_HORDE_Prequest = Inst65Quest6_Prequest
Inst65Quest6_HORDE_Folgequest = Inst65Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst65Quest7_HORDE = Inst65Quest7
Inst65Quest7_HORDE_Aim = Inst65Quest7_Aim
Inst65Quest7_HORDE_Location = Inst65Quest7_Location
Inst65Quest7_HORDE_Note = Inst65Quest7_Note
Inst65Quest7_HORDE_Prequest = Inst65Quest7_Prequest
Inst65Quest7_HORDE_Folgequest = Inst65Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst65Quest8_HORDE = Inst65Quest8
Inst65Quest8_HORDE_Aim = Inst65Quest8_Aim
Inst65Quest8_HORDE_Location = Inst65Quest8_Location
Inst65Quest8_HORDE_Note = Inst65Quest8_Note
Inst65Quest8_HORDE_Prequest = Inst65Quest8_Prequest
Inst65Quest8_HORDE_Folgequest = Inst65Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst65Quest9_HORDE = Inst65Quest9
Inst65Quest9_HORDE_Aim = Inst65Quest9_Aim
Inst65Quest9_HORDE_Location = Inst65Quest9_Location
Inst65Quest9_HORDE_Note = Inst65Quest9_Note
Inst65Quest9_HORDE_Prequest = Inst65Quest9_Prequest
Inst65Quest9_HORDE_Folgequest = Inst65Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst65Quest10_HORDE = Inst65Quest10
Inst65Quest10_HORDE_Aim = Inst65Quest10_Aim
Inst65Quest10_HORDE_Location = Inst65Quest10_Location
Inst65Quest10_HORDE_Note = Inst65Quest10_Note
Inst65Quest10_HORDE_Prequest = Inst65Quest10_Prequest
Inst65Quest10_HORDE_Folgequest = Inst65Quest10_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst65Quest11_HORDE = Inst65Quest11
Inst65Quest11_HORDE_Aim = Inst65Quest11_Aim
Inst65Quest11_HORDE_Location = Inst65Quest11_Location
Inst65Quest11_HORDE_Note = Inst65Quest11_Note
Inst65Quest11_HORDE_Prequest = Inst65Quest11_Prequest
Inst65Quest11_HORDE_Folgequest = Inst65Quest11_Folgequest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst65Quest12_HORDE = Inst65Quest12
Inst65Quest12_HORDE_Aim = Inst65Quest12_Aim
Inst65Quest12_HORDE_Location = Inst65Quest12_Location
Inst65Quest12_HORDE_Note = Inst65Quest12_Note
Inst65Quest12_HORDE_Prequest = Inst65Quest12_Prequest
Inst65Quest12_HORDE_Folgequest = Inst65Quest12_Folgequest
--
Inst65Quest12name1_HORDE = Inst65Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst65Quest13_HORDE = Inst65Quest13
Inst65Quest13_HORDE_Aim = Inst65Quest13_Aim
Inst65Quest13_HORDE_Location = Inst65Quest13_Location
Inst65Quest13_HORDE_Note = Inst65Quest13_Note
Inst65Quest13_HORDE_Prequest = Inst65Quest13_Prequest
Inst65Quest13_HORDE_Folgequest = Inst65Quest13_Folgequest
--
Inst65Quest13name1_HORDE = Inst65Quest13name1
Inst65Quest13name2_HORDE = Inst65Quest13name2
Inst65Quest13name3_HORDE = Inst65Quest13name3
Inst65Quest13name4_HORDE = Inst65Quest13name4




end
-- End of File
