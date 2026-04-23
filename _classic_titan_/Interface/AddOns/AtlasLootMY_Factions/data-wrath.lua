-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...
local AtlasLoot = _G.AtlasLootMY
if AtlasLoot:GameVersion_LT(AtlasLoot.WRATH_VERSION_NUM) then return end
local data = AtlasLoot.ItemDB:Add(addonname, 1, AtlasLoot.WRATH_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", 1, nil, true)
local ALLIANCE_DIFF
local HORDE_DIFF
local LOAD_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	LOAD_DIFF = HORDE_DIFF
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	LOAD_DIFF = ALLIANCE_DIFF
end

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")

local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local SET_EXTRA_ITTYPE = data:AddExtraItemTableType("Set")

local FACTIONS_CONTENT = data:AddContentType(AL["Factions"], ATLASLOOT_FACTION_COLOR)
local FACTIONS2_CONTENT = data:AddContentType(AL["Secondary factions"], {0.1, 0.3, 0.1, 1})

local FACTIONS_HORDE_CONTENT, FACTIONS_ALLI_CONTENT
if UnitFactionGroup("player") == "Horde" then
    FACTIONS_HORDE_CONTENT = data:AddContentType(FACTION_HORDE, ATLASLOOT_HORDE_COLOR)
    FACTIONS_ALLI_CONTENT = data:AddContentType(FACTION_ALLIANCE, ATLASLOOT_ALLIANCE_COLOR)
else
    FACTIONS_ALLI_CONTENT = data:AddContentType(FACTION_ALLIANCE, ATLASLOOT_ALLIANCE_COLOR)
    FACTIONS_HORDE_CONTENT = data:AddContentType(FACTION_HORDE, ATLASLOOT_HORDE_COLOR)
end
local P4_CONTENT =data:AddContentType('P4',ATLASLOOT_FACTION_COLOR)
--[[
0 - Unknown
1 - Hated
2 - Hostile
3 - Unfriendly
4 - Neutral
5 - Friendly
6 - Honored
7 - Revered
8 - Exalted
]]--

--[[
data["DUMMY"] = {
	FactionID = 932,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f932rep8" },

			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f932rep7" },

			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f932rep6" },

			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f932rep5" },

			},
		},
	},
}
]]
data["AllianceVanguard"] = {
	FactionID = 1037,
	ContentType = FACTIONS_ALLI_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1037rep8" },
				{ 2, 44503 },	-- Schematic: Mekgineer's Chopper (p5 450)
				{ 3, 44937 },	-- Plans: Titanium Plating (p2 450)
				{ 17, 50372 },	-- Arcanum of the Savage Gladiator
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1037rep7" },
				{ 2, 38459 },	-- Orb of the Eastern Kingdoms
				{ 3, 38465 },	-- Vanguard Soldier's Dagger
				{ 4, 38455 },	-- Hammer of the Alliance Vanguard
				{ 5, 38463 },	-- Lordaeron's Resolve
				{ 6, 38453 },	-- Shield of the Lion-Hearted
				{ 7, 38457 },	-- Sawed-Off Hand Cannon
				{ 8, 38464 },	-- Gnomish Magician's Quill
			},
		},
	},
}

data["ArgentCrusade"] = {
	FactionID = 1106,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1106rep8" },
				{ 2, 44297 },	-- Boots of the Neverending Path
				{ 3, 44295 },	-- Polished Regimental Hauberk
				{ 4, 44296 },	-- Helm of Purified Thoughts
				{ 5, 44283 },	-- Signet of Hopeful Light
				{ 17, 42187 },	-- Pattern: Brilliant Spellthread (p8 430)
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1106rep7" },
				{ 2, 44248 },	-- Battle Mender's Helm
				{ 3, 44247 },	-- Fang-Deflecting Faceguard
				{ 4, 44244 },	-- Argent Skeleton Crusher
				{ 5, 44245 },	-- Zombie Sweeper Shotgun
				{ 6, 44214 },	-- Purifying Torch
				{ 17, 50369 },	-- Arcanum of the Stalwart Protector
				{ 19, 41726 },	-- Design: Guardian's Twilight Opal (p12 390)
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f91106rep6" },
				{ 2, 44216 },	-- Cloak of Holy Extermination
				{ 3, 44240 },	-- Special Issue Legplates
				{ 4, 44239 },	-- Standard Issue Legguards
				{ 17, 44139 },	-- Arcanum of the Fleeing Shadow
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1106rep5" },
				{ 2, 43154 },	-- Tabard of the Argent Crusade
			},
		},
	},
}

data["FrenzyheartTribe"] = {
	FactionID = 1104,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1104rep8" },
				{ 2, 44073 },	-- Frenzyheart Insignia of Fury
				{ 3, 44719 },	-- Frenzyheart Brew
				{ 5, 44718 },	-- Ripe Disgusting Jar
				{ 6, 39671 },	-- Resurgent Healing Potion
				{ 7, 40067 },	-- Icy Mana Potion
				{ 8, 40087 },	-- Powerful Rejuvenation Potion
				{ 9, 44716 },	-- Mysterious Fermented Liquid
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1104rep7" },
				{ 2, 44116 },	-- Muddied Crimson Gloves
				{ 3, 44117 },	-- Azure Strappy Pants
				{ 4, 44122 },	-- Scavenged Feathery Leggings
				{ 5, 44120 },	-- Giant-Sized Gauntlets
				{ 6, 44121 },	-- Sparkly Shiny Gloves
				{ 7, 44123 },	-- Discarded Titanium Legplates
				{ 9, 44717 },	-- Disgusting Jar
				{ 17, 41723 },	-- Design: Jagged Forest Emerald (p12 350)
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1104rep5" },
				{ 2, 44064 },	-- Nepeta Leaf
				{ 3, 44072, [ATLASLOOT_IT_AMOUNT1] = 5 },	-- Roasted Mystery Beast
				{ 17, 41561 },	-- Design: Reckless Huge Citrine (p12 350)
			},
		},
	},
}

data["HordeExpedition"] = {
	FactionID = 1052,
	ContentType = FACTIONS_HORDE_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1052rep8" },
				{ 2, 44502 },	-- Schematic: Mechano-Hog (p5 450)
				{ 3, 44938 },	-- Plans: Titanium Plating (p2 450)
				{ 17, 50373 },	-- Arcanum of the Savage Gladiator
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1052rep7" },
				{ 2, 38458 },	-- Darkspear Orb
				{ 3, 38461 },	-- Warsong Shanker
				{ 4, 38454 },	-- Warsong Punisher
				{ 5, 38452 },	-- Bulwark of the Warchief
				{ 6, 38462 },	-- Warsong Stormshield
				{ 7, 38456 },	-- Sin'dorei Recurve Bow
				{ 8, 38460 },	-- Charged Wand of the Cleft
			},
		},
	},
}

data["KirinTor"] = {
	FactionID = 1090,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1090rep8" },
				{ 2, 44180 },	-- Robes of Crackling Flame
				{ 3, 44181 },	-- Ghostflicker Waistband
				{ 4, 44182 },	-- Boots of Twinkling Stars
				{ 5, 44183 },	-- Fireproven Gauntlets
				{ 17, 41718 },	-- Design: Brilliant Scarlet Ruby (p12 390)
				{ 18, 42188 },	-- Pattern: Sapphire Spellthread (p8 430)
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1090rep7" },
				{ 2, 44179 },	-- Mind-Expanding Leggings
				{ 3, 44176 },	-- Girdle of the Warrior Magi
				{ 4, 44173 },	-- Flameheart Spell Scalpel
				{ 5, 44174 },	-- Stave of Shrouded Mysteries
				{ 17, 50368 },	-- Arcanum of Burning Mysteries
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1090rep6" },
				{ 2, 44167 },	-- Shroud of Dedicated Research
				{ 3, 44170 },	-- Helm of the Majestic Stag
				{ 4, 44171 },	-- Spaulders of Grounded Lightning
				{ 5, 44166 },	-- Lightblade Rivener
				{ 17, 44141 },	-- Arcanum of the Flame's Soul
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1090rep5" },
				{ 2, 43157 },	-- Tabard of the Kirin Tor
			},
		},
	},
}

data["KnightsoftheEbonBlade"] = {
	FactionID = 1098,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1098rep8" },
				{ 2, 44302 },	-- Belt of Dark Mending
				{ 3, 44303 },	-- Darkheart Chestguard
				{ 4, 44305 },	-- Kilt of Dark Mercy
				{ 5, 44306 },	-- Death-Inured Sabatons
				{ 17, 41725 },	-- Design: Timeless Twilight Opal (p12 390)
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1098rep7" },
				{ 2, 44256 },	-- Sterile Flesh-Handling Gloves
				{ 3, 44258 },	-- Wound-Binder's Wristguards
				{ 4, 44257 },	-- Spaulders of the Black Arrow
				{ 5, 44250 },	-- Reaper of Dark Souls
				{ 6, 44249 },	-- Runeblade of Demonstrable Power
				{ 17, 50367 },	-- Arcanum of Torment
				{ 19, 41721 },	-- Design: Deadly Monarch Topaz (p12 390)
				{ 20, 42183 },	-- Pattern: Abyssal Bag (p8 435)
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1098rep6" },
				{ 2, 44242 },	-- Dark Soldier Cape
				{ 3, 44243 },	-- Toxin-Tempered Sabatons
				{ 4, 44241 },	-- Unholy Persuader
				{ 17, 44512 },	-- Pattern: Nerubian Reinforced Quiver
				{ 18, 44138 },	-- Arkanum des Giftzauberschutzes
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1098rep5" },
				{ 2, 43155 },	-- Tabard of the Ebon Blade
				{ 17, 41562 },	-- Design: Deadly Huge Citrine (p12 350)
			},
		},
	},
}
data["TheVioletEye80"] = {
	FactionID = 967,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	Phase=7,
	items = {
		{ -- Exalted
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f967rep8" },
                { 2, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Assassin"], nil },
                { 3, 29283 }, -- Violet Signet of the Master Assassin
                { 5, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Mage"], nil },
                { 6, 29287 }, -- Violet Signet of the Archmage
                { 17, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Restorer"], nil },
                { 18, 29290 }, -- Violet Signet of the Grand Restorer
                { 20, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Protector"], nil },
                { 21, 29279 }, -- Violet Signet of the Great Protector
                { 23, 33124 }, -- Pattern: Cloak of Darkness
                { 25, 33165 }, -- Formula: Enchant Weapon - Greater Agility
			},
		},
		{ -- Revered
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f967rep7" },
                { 2, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Assassin"], nil },
                { 3, 29282 }, -- Violet Signet
                { 5, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Mage"], nil },
                { 6, 29286 }, -- Violet Signet
                { 17, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Restorer"], nil },
                { 18, 29291 }, -- Violet Signet
                { 20, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Protector"], nil },
                { 21, 29278 }, -- Violet Signet
                { 8, 34581 }, -- Mysterious Arrow
                { 9, 34582 }, -- Mysterious Shell
                { 23, 31394 }, -- Plans: Iceguard Leggings
                { 24, 33205 }, -- Pattern: Shadowprowler's Chestguard
			},
		},
		{ -- Honored
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f967rep6" },
                { 2, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Assassin"], nil },
                { 3, 29281 }, -- Violet Signet
                { 5, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Mage"], nil },
                { 6, 29285 }, -- Violet Signet
                { 17, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Restorer"], nil },
                { 18, 29289 }, -- Violet Signet
                { 20, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Protector"], nil },
                { 21, 29277 }, -- Violet Signet
                { 8, 31113 }, -- Violet Badge
                { 9, 29187 }, -- Inscription of Endurance
                { 23, 31395 }, -- Plans: Iceguard Helm
                { 24, 31393 }, -- Plans: Iceguard Breastplate
                { 25, 31401 }, -- Design: The Frozen Eye
                { 26, 33209 }, -- Recipe: Flask of Chromatic Wonder
			},
		},
		{ -- Friendly
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f967rep5" },
                { 2, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Assassin"], nil },
                { 3, 29280 }, -- Violet Signet
                { 5, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Mage"], nil },
                { 6, 29284 }, -- Violet Signet
                { 17, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Restorer"], nil },
                { 18, 29288 }, -- Violet Signet
                { 20, "INV_Jewelry_Ring_62", nil, AL["Path of the Violet Protector"], nil },
                { 21, 29276 }, -- Violet Signet
			},
		},
	},
}
data["TheAshenVerdict"] = {
	FactionID = 1156,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	Phase=10,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1156rep8" },
				{ 2, 50404 },	-- Ashen Band of Endless Courage
				{ 3, 50398 },	-- Ashen Band of Endless Destruction
				{ 4, 52572 },	-- Ashen Band of Endless Might
				{ 5, 50402 },	-- Ashen Band of Endless Vengeance
				{ 6, 50400 },	-- Ashen Band of Endless Wisdom
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1156rep7" },
				{ 2, 50403 },	-- Ashen Band of Unmatched Courage
				{ 3, 50397 },	-- Ashen Band of Unmatched Destruction
				{ 4, 52571 },	-- Ashen Band of Unmatched Might
				{ 5, 50401 },	-- Ashen Band of Unmatched Vengeance
				{ 6, 50399 },	-- Ashen Band of Unmatched Wisdom
				{ 17, 49971 },	-- Plans: Legplates of Painful Death (p2 450)
				{ 18, 49973 },	-- Plans: Pillars of Might (p2 450)
				{ 19, 49969 },	-- Plans: Puresteel Legplates (p2 450)
				{ 21, 49959 },	-- Pattern: Bladeborn Leggings (p7 450)
				{ 22, 49965 },	-- Pattern: Draconic Bonesplinter Legguards (p7 450)
				{ 23, 49957 },	-- Pattern: Legwraps of Unleashed Nature (p7 450)
				{ 25, 49962 },	-- Pattern: Lightning-Infused Leggings (p7 450)
				{ 26, 49953 },	-- Pattern: Leggings of Woven Death (p8 450)
				{ 27, 49955 },	-- Pattern: Lightweave Leggings (p8 450)
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1156rep6" },
				{ 2, 50388 },	-- Ashen Band of Greater Courage
				{ 3, 50384 },	-- Ashen Band of Greater Destruction
				{ 4, 52570 },	-- Ashen Band of Greater Might
				{ 5, 50387 },	-- Ashen Band of Greater Vengeance
				{ 6, 50386 },	-- Ashen Band of Greater Wisdom
				{ 17, 49974 },	-- Plans: Boots of Kingly Upheaval (p2 450)
				{ 18, 49972 },	-- Plans: Hellfrozen Bonegrinders (p2 450)
				{ 19, 49970 },	-- Plans: Protectors of Life (p2 450)
				{ 21, 49958 },	-- Pattern: Blessed Cenarion Boots (p7 450)
				{ 22, 49963 },	-- Pattern: Earthsoul Boots (p7 450)
				{ 23, 49961 },	-- Pattern: Footpads of Impending Death (p7 450)
				{ 24, 49966 },	-- Pattern: Rock-Steady Treads (p7 450)
				{ 26, 49954 },	-- Pattern: Deathfrost Boots (p8 450)
				{ 27, 49956 },	-- Pattern: Sandals of Consecration (p8 450)
				{ 29, 52022 },	-- Plans: Shatter Rounds (p4 450)
				{ 30, 52023 },	-- Plans: Iceblade Arrow (p4 450)
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1156rep5" },
				{ 2, 50375 },	-- Ashen Band of Courage
				{ 3, 50377 },	-- Ashen Band of Destruction
				{ 4, 52569 },	-- Ashen Band of Might
				{ 5, 50376 },	-- Ashen Band of Vengeance
				{ 6, 50378 },	-- Ashen Band of Wisdom
			},
		},
	},
}
data["TheScaleOfTheSands80"] = {
	FactionID = 990,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	Phase=11,
	items = {
        { -- Exalted
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f990rep8" },
                { 2, 29301 }, -- Band of the Eternal Champion
                { 3, 29297 }, -- Band of the Eternal Defender
                { 17, 29305 }, -- Band of the Eternal Sage
                { 18, 29309 }, -- Band of the Eternal Restorer
			},
		},
		{ -- Revered
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f990rep7" },
                { 2, 29300 }, -- Band of Eternity
                { 3, 29296 }, -- Band of Eternity
                { 17, 29304 }, -- Band of Eternity
                { 18, 29308 }, -- Band of Eternity
                { 5, 32292 }, -- Design: Rigid Lionseye
                { 6, 32308 }, -- Design: Wicked Pyrestone
                { 7, 32309 }, -- Design: Enduring Seaspray Emerald
                { 8, 32302 }, -- Design: Royal Shadowsong Amethyst
			},
		},
		{ -- Honored
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f990rep6" },
                { 2, 29299 }, -- Band of Eternity
                { 3, 29295 }, -- Band of Eternity
                { 17, 29303 }, -- Band of Eternity
                { 18, 29306 }, -- Band of Eternity
                { 5, 31737 }, -- Timeless Arrow
		        { 20, 31735 }, -- Timeless Shell
                { 7, 35763 }, -- Design: Quick Lionseye
                { 8, 32306 }, -- Design: Glinting Pyrestone
                { 9, 32305 }, -- Design: Luminous Pyrestone
                { 10, 32304 }, -- Design: Potent Pyrestone
                { 11, 35762 }, -- Design: Reckless Pyrestone
                { 12, 32299 }, -- Design: Balanced Shadowsong Amethyst
                { 13, 32301 }, -- Design: Glowing Shadowsong Amethyst
                { 22, 32300 }, -- Design: Infused Shadowsong Amethyst
                { 23, 32311 }, -- Design: Dazzling Seaspray Emerald
                { 24, 35765 }, -- Design: Forceful Seaspray Emerald
                { 25, 32312 }, -- Design: Jagged Seaspray Emerald
                { 26, 32310 }, -- Design: Radiant Seaspray Emerald
                { 27, 35764 }, -- Design: Steady Seaspray Emerald
			},
		},
	},
}
data["AshtongueDeathsworn80"] = {
	FactionID = 1012,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	Phase=11,
	items = {
		{ -- Exalted
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1012rep8" },
                { 2, 32486 }, -- Ashtongue Talisman of Equilibrium
                { 3, 32487 }, -- Ashtongue Talisman of Swiftness
                { 4, 32488 }, -- Ashtongue Talisman of Insight
                { 5, 32489 }, -- Ashtongue Talisman of Zeal
                { 6, 32490 }, -- Ashtongue Talisman of Acumen
                { 7, 32492 }, -- Ashtongue Talisman of Lethality
                { 8, 32491 }, -- Ashtongue Talisman of Vision
                { 9, 32493 }, -- Ashtongue Talisman of Shadows
                { 10, 32485 }, -- Ashtongue Talisman of Valor
			},
		},
		{ -- Revered
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1012rep7" },
                -- empty but keep in, looks better
			},
		},
		{ -- Honored
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1012rep6" },
                { 17, 32443 }, -- Plans: Shadesteel Greaves
                { 18, 32441 }, -- Plans: Shadesteel Sabots
                { 20, 32433 }, -- Pattern: Redeemed Soul Moccasins
                { 21, 32434 }, -- Pattern: Redeemed Soul Wristguards
                { 22, 32431 }, -- Pattern: Greaves of Shackled Souls
                { 23, 32432 }, -- Pattern: Waistguard of Shackled Souls
                { 24, 32447 }, -- Pattern: Night's End
                { 25, 32439 }, -- Pattern: Soulguard Leggings
                { 26, 32437 }, -- Pattern: Soulguard Slippers
			},
		},
		{ -- Friendly
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1012rep5" },
                { 17, 32444 }, -- Plans: Shadesteel Girdle
                { 18, 32442 }, -- Plans: Shadesteel Bracers
                { 20, 32436 }, -- Pattern: Redeemed Soul Cinch
                { 21, 32435 }, -- Pattern: Redeemed Soul Legguards
                { 22, 32430 }, -- Pattern: Bracers of Shackled Souls
                { 23, 32429 }, -- Pattern: Boots of Shackled Souls
                { 24, 32440 }, -- Pattern: Soulguard Girdle
                { 25, 32438 }, -- Pattern: Soulguard Bracers
			},
		},
	},
}
data["TheKaluak"] = {
	FactionID = 1073,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1073rep8" },
				{ 2, 44050 },	-- Mastercraft Kalu'ak Fishing Pole
				{ 4, 44723 },	-- Nurtured Penguin Egg
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1073rep7" },
				{ 2, 44051 },	-- Traditional Flensing Knife
				{ 3, 44052 },	-- Totemic Purification Rod
				{ 4, 44053 },	-- Whale-Stick Harpoon
				{ 17, 44509 },	-- Pattern: Trapper's Traveling Pack (p7 415)
				{ 18, 45774 },	-- Pattern: Emerald Bag (p8 435)
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1073rep6" },
				{ 2, 44061 },	-- Pigment-Stained Robes
				{ 3, 44062 },	-- Turtle-Minders Robe
				{ 4, 44054 },	-- Whale-Skin Breastplate
				{ 5, 44055 },	-- Whale-Skin Vest
				{ 6, 44059 },	-- Cuttlefish Scale Breastplate
				{ 7, 44060 },	-- Cuttlefish Tooth Ringmail
				{ 8, 44057 },	-- Ivory-Reinforced Chestguard
				{ 9, 44058 },	-- Whalebone Carapace
				{ 17, 44511 },	-- Pattern: Dragonscale Ammo Pouch
				{ 18, 41574 },	-- Design: Defender's Shadow Crystal (p12 350)
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1073rep5" },
				{ 2, 44049, [ATLASLOOT_IT_AMOUNT1] = 5 },	-- Freshly-Speared Emperor
				{ 17, 41568 },	-- Design: Purified Shadow Crystal (p12 350)
			},
		},
	},
}

data["TheOracles"] = {
	FactionID = 1105,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1105rep8" },
				{ 2, 44074 },	-- Oracle Talisman of Ablution
				{ 4, 44707 },	-- Reins of the Green Proto-Drake
				{ 6, 39898 },	-- Cobra Hatchling
				{ 7, 44721 },	-- Proto-Drake Whelp
				{ 8, 39896 },	-- Tickbird Hatchling
				{ 9, 39899 },	-- White Tickbird Hatchling
				{ 11, 44722 },	-- Aged Yolk
				{ 13, 39883 },	-- Cracked Egg
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1105rep7" },
				{ 2, 44104 },	-- Fishy Cinch
				{ 3, 44106 },	-- Glitterscale Wrap
				{ 4, 44110 },	-- Sharkjaw Cap
				{ 5, 44109 },	-- Toothslice Helm
				{ 6, 44112 },	-- Glimmershell Shoulder Protectors
				{ 7, 44111 },	-- Gold Star Spaulders
				{ 8, 44108 },	-- Shinygem Rod
				{ 10, 39878 },	-- Mysterious Egg
				{ 17, 41724 },	-- Design: Misty Forest Emerald (p12 350)
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1105rep6" },
				{ 2, 44071, [ATLASLOOT_IT_AMOUNT1] = 5 },	-- Slow-Roasted Eel
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1105rep5" },
				{ 2, 44065 },	-- Oracle Secret Solution
				{ 17, 41567 },	-- Design: Nimble Dark Jade (p12 350)
			},
		},
	},
}

data["TheSilverCovenant"] = {
	FactionID = 1094,
	ContentType = FACTIONS_ALLI_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1094rep8" },
				{ 2, 46813 },	-- Silver Covenant Hippogryph
				{ 3, 46815 },	-- Quel'dorei Steed
				{ 4, 46820 },	-- Shimmering Wyrmling
				{ 5, 46817 },	-- Silver Covenant Tabard
			},
		},
	},
}

data["TheSunreavers"] = {
	FactionID = 1124,
	ContentType = FACTIONS_HORDE_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1124rep8" },
				{ 2, 46814 },	-- Sunreaver Dragonhawk
				{ 3, 46816 },	-- Sunreaver Hawkstrider
				{ 4, 46821 },	-- Shimmering Wyrmling
				{ 5, 46818 },	-- Sunreaver Tabard
			},
		},
	},
}

data["TheSonsofHodir"] = {
	FactionID = 1119,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1119rep8" },
				{ 2, [ATLASLOOT_IT_ALLIANCE] = 43961, [ATLASLOOT_IT_HORDE] = 44086 },	-- Reins of the Grand Ice Mammoth
				{ 4, 44133 },	-- Greater Inscription of the Axe
				{ 5, 44134 },	-- Greater Inscription of the Crag
				{ 6, 44136 },	-- Greater Inscription of the Pinnacle
				{ 7, 44135 },	-- Greater Inscription of the Storm
				{ 17, 41720 },	-- Design: Smooth Autumn's Glow (p12 390)
				{ 18, 42184 },	-- Pattern: Glacial Bag (p8 445)
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1119rep7" },
				{ 2, [ATLASLOOT_IT_ALLIANCE] = 43958, [ATLASLOOT_IT_HORDE] = 44080 },	-- Reins of the Ice Mammoth
				{ 4, 44194 },	-- Giant-Friend Kilt
				{ 5, 44195 },	-- Spaulders of the Giant Lords
				{ 6, 44193 },	-- Broken Stalactite
				{ 7, 44192 },	-- Stalactite Chopper
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1119rep6" },
				{ 2, 44190 },	-- Spaulders of Frozen Knives
				{ 3, 44189 },	-- Sash of the Wizened Wyrm
				{ 5, 44131 },	-- Lesser Inscription of the Axe
				{ 6, 44130 },	-- Lesser Inscription of the Crag
				{ 7, 44132 },	-- Lesser Inscription of the Pinnacle
				{ 8, 44129 },	-- Lesser Inscription of the Storm
				{ 17, 44510 },	-- Pattern: Mammoth Mining Bag (p7 415)
				{ 18, 44137 },	-- Arcanum of the Frosty Soul
			},
		},
	},
}

data["TheWyrmrestAccord"] = {
	FactionID = 1091,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1091rep8" },
				{ 2, 43955 },	-- Reins of the Red Drake
				{ 4, 44202 },	-- Sandals of Crimson Fury
				{ 5, 44203 },	-- Dragonfriend Bracers
				{ 6, 44204 },	-- Grips of Fierce Pronouncements
				{ 7, 44205 },	-- Legplates of Bloody Reprisal
				{ 17, 41722 },	-- Design: Stalwart Monarch Topaz (p12 390)
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1091rep7" },
				{ 2, 44200 },	-- Ancestral Sinew Wristguards
				{ 3, 44198 },	-- Breastplate of the Solemn Council
				{ 4, 44201 },	-- Sabatons of Draconic Vigor
				{ 5, 44199 },	-- Gavel of the Brewing Storm
				{ 17, 44152 },	-- Arcanum of Blissful Mending
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1091rep6" },
				{ 2, 44188 },	-- Cloak of Peaceful Resolutions
				{ 3, 44196 },	-- Sash of the Wizened Wyrm
				{ 4, 44197 },	-- Bracers of Accorded Courtesy
				{ 5, 44187 },	-- Fang of Truth
				{ 17, 44140 },	-- Arcanum of the Eclipsed Moon
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1091rep5" },
				{ 2, 43156 },	-- Tabard of the Wyrmrest Accord
			},
		},
	},
}

data["ZandalarTribeP3"] = {
	FactionID = 270,
	ContentType = P4_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f270rep8" },
				{ 2,  20013 }, -- Recipe: Living Action Potion
				{ 3,  20077 }, -- Zandalar Signet of Might
				{ 4,  20076 }, -- Zandalar Signet of Mojo
				{ 5,  20078 }, -- Zandalar Signet of Serenity
			},
		},
		{ -- Revered
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f270rep7" },
				{ 2,  19764 }, -- Pattern: Bloodvine Vest
				{ 3,  19769 }, -- Pattern: Primal Batskin Jerkin
				{ 4,  19772 }, -- Pattern: Blood Tiger Breastplate
				{ 5,  19776 }, -- Plans: Bloodsoul Breastplate
				{ 6,  19779 }, -- Plans: Darksoul Breastplate
				{ 7,  20011 }, -- Recipe: Mageblood Potion
				{ 17,  20080 }, -- Sheen of Zanza
				{ 18,  20079 }, -- Spirit of Zanza
				{ 19,  20081 }, -- Swiftness of Zanza
				{ 20, 268553}
			},
		},
		{ -- Honored
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f270rep6" },
				{ 2,  19765 }, -- Pattern: Bloodvine Leggings
				{ 3,  20000 }, -- Schematic: Bloodvine Goggles
				{ 4,  19770 }, -- Pattern: Primal Batskin Gloves
				{ 5,  19773 }, -- Pattern: Blood Tiger Shoulders
				{ 6,  19777 }, -- Plans: Bloodsoul Shoulders
				{ 7,  19780 }, -- Plans: Darksoul Leggings
				{ 8,  20014 }, -- Recipe: Major Troll's Blood Potion
				{ 9,  20756 }, -- Formula: Brilliant Wizard Oil
				{ 10,  20031 }, -- Essence Mango
			},
		},
		{ -- Friendly
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f270rep5" },
				{ 2,  19766 }, -- Pattern: Bloodvine Boots
				{ 3,  19771 }, -- Pattern: Primal Batskin Bracers
				{ 4,  20001 }, -- Schematic: Bloodvine Lens
				{ 5,  19778 }, -- Plans: Bloodsoul Gauntlets
				{ 6,  19781 }, -- Plans: Darksoul Shoulders
				{ 7,  20012 }, -- Recipe: Greater Dreamless Sleep
				{ 8,  20757 }, -- Formula: Brilliant Mana Oil
			},
		},
	},
}