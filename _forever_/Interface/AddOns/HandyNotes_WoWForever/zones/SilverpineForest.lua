local myname, ns = ...

ns.RegisterPoints(ns.SILVERPINEFOREST, {
	[63006360] = { -- Dalaran Spellscribe
		-- [62206400, 62706250, 63006220, 63006360, 63006540, 63606540]
		quest=nil,
		npc=1920,
		loot={
			4436, -- Jewel-Encrusted Sash
			4437, -- Channeler's Staff
			{8491,pet=42,}, -- Cat Carrier (Black Tabby)
		},
	},
	[50401880] = { -- Gorefang
		quest=nil,
		npc=12431,
		loot={
			283361, -- Gorefang's Runners
		},
	},
	[34701010] = { -- Krethis Shadowspinner
		-- [34300970, 34601080, 34701010, 35200800, 35400900]
		quest=nil,
		npc=12433,
	},
	[54206040] = { -- Old Vicejaw
		quest=nil,
		npc=12432,
		loot={
			283259, -- Bearhide Vicegrips
		},
	},
	[57407080] = { -- Ravenclaw Regent
		-- [57406980, 57407080, 57606980, 57607140, 57807160]
		quest=nil,
		npc=2283,
		loot={
			5969, -- Regent's Cloak
			6628, -- Raven's Claws
		},
	},
	[66902460] = { -- Rot Hide Bruiser
		-- [64802280, 65702500, 65702730, 65702760, 65802580, 66902460, 67002440, 68202480, 68202560]
		quest=nil,
		npc=1944,
		loot={
			4439, -- Bruiser Club
			5975, -- Ruffian Belt
		},
	},
	[65602370] = { -- Snarlmane
		-- [65202500, 65602370, 65802320, 66202490]
		quest=nil,
		npc=1948,
		loot={
			4445, -- Flesh Carver
		},
	},
})
