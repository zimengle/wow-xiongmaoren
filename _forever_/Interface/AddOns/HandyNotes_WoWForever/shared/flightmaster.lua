local myname, ns = ...

local faction = UnitFactionGroup("player")
local FM = ns.nodeMaker{
	label=MINIMAP_TRACKING_FLIGHTMASTER, -- Flight Master
	group=TUTORIAL_TITLE35, -- Travel
	atlas="FlightMaster",
	minimap=false,
}
local FLIGHTMASTER = FM{}
if faction == "Alliance" then
	ns.RegisterPoints(1453, { -- Stormwind City
		[71297222] = {note="{npc:352}"}, -- Dungar Longdrink
	}, FM{translate={[1429]=true}})
	ns.RegisterPoints(1427, { -- Searing Gorge
		[37803040] = {note="{npc:2941}"}, -- Lanie Reed
	}, FLIGHTMASTER)
	ns.RegisterPoints(1434, { -- Stranglethorn Vale
		[38200400] = {note="{npc:24366}"}, -- Nizzle
		[27407780] = {note="{npc:2859}"}, -- Gyll
	}, FLIGHTMASTER)
	ns.RegisterPoints(1451, { -- Silithus
		[50603440] = {note="{npc:15177}"}, -- Cloud Skydancer
	}, FLIGHTMASTER)
	ns.RegisterPoints(1440, { -- Ashenvale
		[34404800] = {note="{npc:4267}"}, -- Daelyshia
		[85004340] = {note="{npc:22935}"}, -- Suralais Farwind
	}, FLIGHTMASTER)
	ns.RegisterPoints(1424, { -- Hillsbrad Foothills
		[49405220] = {note="{npc:2432}"}, -- Darla Harris
	}, FLIGHTMASTER)
	ns.RegisterPoints(1455, { -- Ironforge
		[55404740] = {note="{npc:1573}"}, -- Gryth Thurden
	}, FM{translate={[1426]=true}})
	ns.RegisterPoints(1422, { -- Western Plaguelands
		[42808500] = {note="{npc:12596}"}, -- Bibilfaz Featherwhistle
	}, FLIGHTMASTER)
	ns.RegisterPoints(1437, { -- Wetlands
		[9405940] = {note="{npc:1571}"}, -- Shellei Brondir
	}, FLIGHTMASTER)
	ns.RegisterPoints(1436, { -- Westfall
		[56405240] = {note="{npc:523}"}, -- Thor
	}, FLIGHTMASTER)
	ns.RegisterPoints(1446, { -- Tanaris
		[51002920] = {note="{npc:7823}"}, -- Bera Stonehammer
	}, FLIGHTMASTER)
	ns.RegisterPoints(1439, { -- Darkshore
		[36404540] = {note="{npc:3841}"}, -- Caylais Moonfeather
	}, FLIGHTMASTER)
	ns.RegisterPoints(1417, { -- Arathi Highlands
		[45604600] = {note="{npc:2835}"}, -- Cedrik Prose
	}, FLIGHTMASTER)
	ns.RegisterPoints(1444, { -- Feralas
		[30204320] = {note="{npc:8019}"}, -- Fyldren Moonfeather
		[89404580] = {note="{npc:4319}"}, -- Thyssiana
	}, FLIGHTMASTER)
	ns.RegisterPoints(1447, { -- Azshara
		[11807740] = {note="{npc:12577}"}, -- Jarrodenus
	}, FLIGHTMASTER)
	ns.RegisterPoints(1431, { -- Duskwood
		[77404440] = {note="{npc:2409}"}, -- Felicia Maline
	}, FLIGHTMASTER)
	ns.RegisterPoints(1442, { -- Stonetalon Mountains
		[36400720] = {note="{npc:4407}"}, -- Teloren
	}, FLIGHTMASTER)
	ns.RegisterPoints(1432, { -- Loch Modan
		[33805040] = {note="{npc:1572}"}, -- Thorgrum Borrelson
	}, FLIGHTMASTER)
	ns.RegisterPoints(1438, { -- Teldrassil
		[58409400] = {note="{npc:3838}"}, -- Vesprystus
	}, FLIGHTMASTER)
	ns.RegisterPoints(1445, { -- Dustwallow Marsh
		[67405120] = {note="{npc:4321}"}, -- Baldruc
		[42807240] = {note="{npc:23612}"}, -- Dyslix Silvergrub
	}, FLIGHTMASTER)
	ns.RegisterPoints(1443, { -- Desolace
		[64601040] = {note="{npc:6706}"}, -- Baritanas Skyriver
	}, FLIGHTMASTER)
	ns.RegisterPoints(1448, { -- Felwood
		[51408220] = {note="{npc:22931}"}, -- Gorrim
		[62402420] = {note="{npc:12578}"}, -- Mishellena
	}, FLIGHTMASTER)
	ns.RegisterPoints(1419, { -- Blasted Lands
		[65402440] = {note="{npc:8609}"}, -- Alexandra Constantine
	}, FLIGHTMASTER)
	ns.RegisterPoints(1450, { -- Moonglade
		[48006720] = {note="{npc:10897}"}, -- Sindrayl
	}, FLIGHTMASTER)
	ns.RegisterPoints(1449, { -- Un'Goro Crater
		[45200580] = {note="{npc:10583}"}, -- Gryfe
	}, FLIGHTMASTER)
	ns.RegisterPoints(1425, { -- The Hinterlands
		[11004600] = {note="{npc:8018}"}, -- Guthrum Thunderfist
	}, FLIGHTMASTER)
	ns.RegisterPoints(1428, { -- Burning Steppes
		[84406820] = {note="{npc:2299}"}, -- Borgus Stoutarm
	}, FLIGHTMASTER)
	ns.RegisterPoints(1413, { -- The Barrens
		[63003720] = {note="{npc:16227}"}, -- Bragok
	}, FLIGHTMASTER)
	ns.RegisterPoints(1423, { -- Eastern Plaguelands
		[81405920] = {note="{npc:12617}"}, -- Khaelyn Steelwing
	}, FLIGHTMASTER)
	ns.RegisterPoints(1452, { -- Winterspring
		[62203640] = {note="{npc:11138}"}, -- Maethrya
	}, FLIGHTMASTER)
	ns.RegisterPoints(1433, { -- Redridge Mountains
		[30405920] = {note="{npc:931}"}, -- Ariena Stormfeather
	}, FLIGHTMASTER)
elseif faction == "Horde" then
	ns.RegisterPoints(1434, { -- Stranglethorn Vale
		[32402920] = {note="{npc:1387}"}, -- Thysta
		[26807700] = {note="{npc:2858}"}, -- Gringer
	}, FLIGHTMASTER)
	ns.RegisterPoints(1413, { -- The Barrens
		[51403020] = {note="{npc:3615}"}, -- Devrak
		[44405900] = {note="{npc:10378}"}, -- Omusa Thunderhorn
		[63003720] = {note="{npc:16227}"}, -- Bragok
	}, FLIGHTMASTER)
	ns.RegisterPoints(1450, { -- Moonglade
		[32206640] = {note="{npc:12740}"}, -- Faustron
	}, FLIGHTMASTER)
	ns.RegisterPoints(1448, { -- Felwood
		[34405380] = {note="{npc:11900}"}, -- Brakkar
		[51408220] = {note="{npc:22931}"}, -- Gorrim
	}, FLIGHTMASTER)
	ns.RegisterPoints(1458, { -- Undercity
		[62804720] = {note="{npc:4551}"}, -- Michael Garrett
	}, FM{translate={[1420]=true}})
	ns.RegisterPoints(1451, { -- Silithus
		[48603640] = {note="{npc:15178}"}, -- Runk Windtamer
	}, FLIGHTMASTER)
	ns.RegisterPoints(1421, { -- Silverpine Forest
		[45404240] = {note="{npc:2226}"}, -- Karos Razok
	}, FLIGHTMASTER)
	ns.RegisterPoints(1441, { -- Thousand Needles
		[45004920] = {note="{npc:4317}"}, -- Nyse
	}, FLIGHTMASTER)
	ns.RegisterPoints(1445, { -- Dustwallow Marsh
		[35403180] = {note="{npc:11899}"}, -- Shardi
		[42807240] = {note="{npc:23612}"}, -- Dyslix Silvergrub
	}, FLIGHTMASTER)
	ns.RegisterPoints(1456, { -- Thunder Bluff
		[46804940] = {note="{npc:2995}"}, -- Tal
	}, FM{translate={[1412]=true}})
	ns.RegisterPoints(1428, { -- Burning Steppes
		[65402400] = {note="{npc:13177}"}, -- Vahgruk
	}, FLIGHTMASTER)
	ns.RegisterPoints(1447, { -- Azshara
		[22004960] = {note="{npc:8610}"}, -- Kroum
	}, FLIGHTMASTER)
	ns.RegisterPoints(1424, { -- Hillsbrad Foothills
		[60201840] = {note="{npc:2389}"}, -- Zarise
	}, FLIGHTMASTER)
	ns.RegisterPoints(1435, { -- Swamp of Sorrows
		[46005440] = {note="{npc:6026}"}, -- Breyk
	}, FLIGHTMASTER)
	ns.RegisterPoints(1423, { -- Eastern Plaguelands
		[80205700] = {note="{npc:12636}"}, -- Georgia
	}, FLIGHTMASTER)
	ns.RegisterPoints(1449, { -- Un'Goro Crater
		[45200580] = {note="{npc:10583}"}, -- Gryfe
	}, FLIGHTMASTER)
	ns.RegisterPoints(1417, { -- Arathi Highlands
		[73003260] = {note="{npc:2851}"}, -- Urda
	}, FLIGHTMASTER)
	ns.RegisterPoints(1440, { -- Ashenvale
		[12203380] = {note="{npc:11901}"}, -- Andruk
		[73206140] = {note="{npc:12616}"}, -- Vhulgra
	}, FLIGHTMASTER)
	ns.RegisterPoints(1454, { -- Orgrimmar
		[45206380] = {note="{npc:3310}"}, -- Doras
	}, FM{translate={[1411]=true}})
	ns.RegisterPoints(1444, { -- Feralas
		[75404420] = {note="{npc:8020}"}, -- Shyn
	}, FLIGHTMASTER)
	ns.RegisterPoints(1443, { -- Desolace
		[21407400] = {note="{npc:6726}"}, -- Thalon
	}, FLIGHTMASTER)
	ns.RegisterPoints(1442, { -- Stonetalon Mountains
		[45205980] = {note="{npc:4312}"}, -- Tharm
	}, FLIGHTMASTER)
	ns.RegisterPoints(1446, { -- Tanaris
		[51602540] = {note="{npc:7824}"}, -- Bulkrek Ragefist
	}, FLIGHTMASTER)
	ns.RegisterPoints(1425, { -- The Hinterlands
		[81608180] = {note="{npc:4314}"}, -- Gorkas
	}, FLIGHTMASTER)
	ns.RegisterPoints(1418, { -- Badlands
		[4004480] = {note="{npc:2861}"}, -- Gorrik
	}, FLIGHTMASTER)
	ns.RegisterPoints(1427, { -- Searing Gorge
		[34803020] = {note="{npc:3305}"}, -- Grisha
	}, FLIGHTMASTER)
	ns.RegisterPoints(1452, { -- Winterspring
		[60403640] = {note="{npc:11139}"}, -- Yugrek
	}, FLIGHTMASTER)
end
