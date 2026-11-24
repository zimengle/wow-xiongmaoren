local myname, ns = ...

ns.groups["books"] = "{questname:78150:Friend of the Library}"

local ALLIANCE = ns.conditions.PlayerFaction("Alliance")
local HORDE = ns.conditions.PlayerFaction("Horde")

local BK = ns.nodeMaker{
	group="books",
	minimap=true,
}
local BOOK = BK{}
local LIBRARIAN = ns.nodeMaker{
	group="books",
	icon=133741, -- INV_Misc_Book_09
	minimap=false,
	note="Turn in library books here",
	loot={
		-- Friend of the Library
		ns.rewards.Item(277203, {quest=78150, note="10 books"}), -- Scholarly Pendant
		ns.rewards.Item(277204, {quest=78150, note="10 books"}), -- Erudite's Amulet
		-- Greater Friend of the Library
		ns.rewards.Item(281634, {quest=79536, note="20 books", requires=ns.conditions.Level(20)}), -- Field Researcher's Loop
		ns.rewards.Item(281635, {quest=79536, note="20 books", requires=ns.conditions.Level(20)}), -- Philanthropist's Ring
		ns.rewards.Item(277254, {quest=82208, note="25 books", requires=ns.conditions.Level(35)}), -- Truthseeker's Bow
		ns.rewards.Item(277258, {quest=82208, note="25 books", requires=ns.conditions.Level(35)}), -- Crest of Elucidation
		ns.rewards.Item(277260, {quest=82208, note="25 books", requires=ns.conditions.Level(35)}), -- Researcher's Night Light
		ns.rewards.Item(281637, {quest=84394, requires=ns.conditions.Level(50)}), -- Antique Bulwark
		ns.rewards.Item(281636, {quest=84394, requires=ns.conditions.Level(50)}), -- Museum Keeper's Chain
		ns.rewards.Item(277202, {quest=84394, requires=ns.conditions.Level(50)}), -- Artifact Seeker's Pendant
	},
	showallloot=true,
}

ns.RegisterPoints(ns.STORMWINDCITY, {
	[49008640] = {npc=211033, requires=ALLIANCE}, -- Garion Wendell
}, LIBRARIAN{translate={[ns.ELWYNNFOREST]=true}})
ns.RegisterPoints(1458, { -- Undercity
	[73603300] = {npc=211022, requires=HORDE}, -- Owen Thadd
}, LIBRARIAN{translate={[ns.TIRISFALGLADES]=true}})

ns.RegisterPoints(1455, { -- Ironforge
	[75701050] = {quest=79091, loot={203754}, inbag=203754, requires=ALLIANCE}, -- Archmage Antonidas: The Unabridged Autobiography
}, BK{translate={[ns.DUNMOROGH]=true}})
ns.RegisterPoints(1454, { -- Orgrimmar
	[38707840] = {quest=79094, loot={207972}, inbag=207972, requires=HORDE, note="Trace the mural"}, -- The Lessons of Ta'zo
}, BK{translate={[ns.DUROTAR]=true}})

ns.RegisterPoints(ns.ELWYNNFOREST, {
	[65407010] = {quest=79092, loot={203755}, inbag=203755}, -- Archmage Theocritus' Research Journal
}, BOOK)
ns.RegisterPoints(ns.TIRISFALGLADES, {
	[59405230] = {quest=79095, loot={208185}, inbag=208185}, -- The Apothecary's Metaphysical Primer
}, BOOK)
ns.RegisterPoints(ns.SILVERPINEFOREST, {
	[63506310] = {quest=78127, loot={209844}, inbag=209844}, -- The Dalaran Digest, Vol. 23
	[43404120] = {quest=79096, loot={210177}, inbag=210177, requires=HORDE}, -- Ataeric: On Arcane Curiosities
}, BOOK)
ns.RegisterPoints(ns.WESTFALL, {
	[52705380] = {quest=79093, loot={208860}, inbag=208860}, -- Rumi of Gnomeregan: The Collected Works
	[45407050] = {quest=78142, loot={209845}, inbag=209845}, -- Bewitchments and Glamours
}, BOOK)
ns.RegisterPoints(ns.DUSKWOOD, {
	[16602850] = {quest=78147, loot={209849}, inbag=209849}, -- Crimes Against Anatomy
}, BOOK)
ns.RegisterPoints(ns.LOCHMODAN, {
	[77401400] = {quest=78148, loot={209850}, inbag=209850}, -- Runes of the Sorcerer-Kings
}, BOOK)
ns.RegisterPoints(ns.WETLANDS, {
	[33604790] = {quest=78146, loot={209848}, inbag=209848}, -- Goaz Scrolls
}, BOOK)
ns.RegisterPoints(ns.ALTERACMOUNTAINS, {
	[48405760] = {quest=79948, loot={215815}, inbag=215815}, -- Defensive Magics 101
}, BOOK)
ns.RegisterPoints(ns.ARATHIHIGHLANDS, {
	[73606520] = {quest=79949, loot={215816}, inbag=215816}, -- A Web of Lies: Debunking Myths and Legends
}, BOOK)
ns.RegisterPoints(ns.STRANGLETHORNVALE, {
	[41405090] = {quest=79535, loot={213165}, inbag=213165}, -- Basilisks: Should Petrification be Feared?
}, BOOK)
ns.RegisterPoints(ns.BADLANDS, {
	[56603990] = {quest=79951, loot={215820}, inbag=215820}, -- Mummies: A Guide to the Unsavory Undead
}, BOOK)
ns.RegisterPoints(ns.SWAMPOFSORROWS, {
	[70305180] = {quest=81947, loot={220345}, inbag=220345}, -- Sanguine Sorcery
}, BOOK)
ns.RegisterPoints(ns.THEHINTERLANDS, {
	[36007280] = {quest=81954, loot={220350}, inbag=220350}, -- Venomous Journeys
}, BOOK)
ns.RegisterPoints(ns.SEARINGGORGE, {
	[37804930] = {quest=81955, loot={220352}, inbag=220352}, -- A Mind of Metal
}, BOOK)
ns.RegisterPoints(ns.BURNINGSTEPPES, {
	[29102890] = {quest=81953, loot={220349}, inbag=220349}, -- Stonewrought Design
}, BOOK)
ns.RegisterPoints(ns.BLASTEDLANDS, {
	[55403220] = {quest=81956, loot={220353}, inbag=220353}, -- Conjurer's Codex
}, BOOK)

ns.RegisterPoints(ns.DARKSHORE, {
	[59602220] = {quest=78124, loot={209843}, inbag=209843}, -- Nar'thalas Almanac, Vol. 74
}, BOOK)
ns.RegisterPoints(ns.THEBARRENS, {
	[62703630] = {quest=79097, loot={208800}, inbag=208800}, -- Baxtan: On Destructive Magics
	[46003650] = {quest=78143, loot={209846}, inbag=209846, note="In the caves at the Wailing Caverns entrance, on the left as you face the instance portal"}, -- Secrets of the Dreamers
	[56300880] = {quest=78145, loot={209847}, inbag=209847}, -- Arcanic Systems Manual
}, BOOK)
ns.RegisterPoints(ns.STONETALONMOUNTAINS, {
	[74408570] = {quest=78149, loot={209851}, inbag=209851}, -- Fury of the Land
}, BOOK)
ns.RegisterPoints(ns.THOUSANDNEEDLES, {
	[34404000] = {quest=79947, loot={215683}, inbag=215683}, -- Geomancy: The Stone-Cold Truth
}, BOOK)
ns.RegisterPoints(ns.DESOLACE, {
	[55102620] = {quest=79950, loot={215817}, inbag=215817}, -- Demons and You
}, BOOK)
ns.RegisterPoints(ns.DUSTWALLOWMARSH, {
	[57202080] = {quest=79952, loot={215822}, inbag=215822}, -- RwlRwlRwlRwl!
}, BOOK)
ns.RegisterPoints(ns.TANARIS, {
	[72704780] = {quest=81949, loot={220346}, inbag=220346}, -- Legends of the Tidesages
}, BOOK)
ns.RegisterPoints(ns.AZSHARA, {
	[20706200] = {quest=81952, loot={220348}, inbag=220348}, -- Everyday Etiquette
}, BOOK)
