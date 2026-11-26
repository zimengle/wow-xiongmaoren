-- Spy for Forever: the combat map.
--
-- Every fight against an enemy player is kept with where and when it happened, and
-- shown as a skull on the world map (green: a win, red: a loss, yellow: a probable
-- win). Idea from VanasKoS (a CurseForge comment), written from scratch.
--
-- What counts, with the combat log closed to addons:
-- * a win: our killing blow or our pet's ("kill"), or a group member's ("group"),
--   from PARTY_KILL;
-- * a loss: the killer found for the loss count (death recap, or the one enemy who
--   had us targeted);
-- * a probable win, off by default: an enemy player dies (UNIT_DIED) while we are in
--   combat and he was our target or had us targeted, and nobody in the group got the
--   kill. Somebody outside the group may have killed him without our help.
--
-- The skull sits where we stood: the client does not give addons other players'
-- positions, and both players are a few yards apart in a fight.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")
local HBDP = LibStub("HereBeDragons-Pins-2.0")
local Guard = Spy.ForeverGuard

-- Below the other addons' map icons (HereBeDragons puts them at AREA_POI by default, as
-- Questie does) and below the game's quests (CurseForge comment: skulls hid Questie's
-- turn-in marks). DIG_SITE is a level the world map registers under AREA_POI.
Spy.EncounterPinLevel = "PIN_FRAME_LEVEL_DIG_SITE"

Spy.EncounterLimit = 5000         -- fights kept per character, the oldest go first (was 500)
local PROBABLE_WINDOW = 10        -- seconds he must have been our target or targeting us
local PROBABLE_DELAY = 1          -- wait for a PARTY_KILL before calling a death probable
local SKULL = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"
local PERIODS = { day = 86400, week = 7 * 86400, month = 30 * 86400 }

-- The mark of a fight (CurseForge comment: the skull looks like the rare-spawn icons of
-- other addons). Each is drawn grey and tinted with the win/loss colour. An atlas the
-- client does not know falls back to the skull.
local MARKS = {
	skull = { texture = SKULL },
	swords = { atlas = "pvptalents-warmode-swords" },
	dot = { atlas = "WhiteCircle-RaidBlips" },
	cross = { texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7" },
	star = { texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1" },
	diamond = { texture = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3" },
}
Spy.EncounterMarks = MARKS

local function markOf(key)
	local mark = MARKS[key] or MARKS.skull
	if mark.atlas then
		local info = C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(mark.atlas)
		if not info then
			return MARKS.skull
		end
	end
	return mark
end

local function paint(texture, key)
	local mark = markOf(key)
	if texture.markKey == key then
		return
	end
	texture.markKey = key
	if mark.atlas then
		texture:SetAtlas(mark.atlas)
	else
		texture:SetTexture(mark.texture)
		texture:SetTexCoord(0, 1, 0, 1)
	end
	texture:SetDesaturated(true)
end

local COLORS = {
	W = { 0.25, 1, 0.25 },
	L = { 1, 0.25, 0.25 },
	P = { 1, 0.85, 0.2 },
}

Spy.EncounterRef = {}
Spy.EncounterIcons = {}
Spy.RecentTargets = {}
Spy.RecentKills = {}

local function settings()
	return Spy.db and Spy.db.profile or {}
end

function Spy:Encounters()
	if type(SpyPerCharDB) ~= "table" then
		return {}
	end
	if type(SpyPerCharDB.Encounters) ~= "table" then
		SpyPerCharDB.Encounters = {}
	end
	return SpyPerCharDB.Encounters
end

-- Our map and position, or nil in an instance or when the client hides them.
function Spy:PlayerPosition()
	local mapID = Spy:Readable(C_Map.GetBestMapForUnit("player"))
	if type(mapID) ~= "number" then
		return nil
	end
	local ok, position = pcall(C_Map.GetPlayerMapPosition, mapID, "player")
	if not ok or type(position) ~= "table" or not position.GetXY then
		return nil
	end
	local x, y = position:GetXY()
	x, y = Spy:Readable(x), Spy:Readable(y)
	if type(x) ~= "number" or type(y) ~= "number" or x <= 0 or y <= 0 or x >= 1 or y >= 1 then
		return nil
	end
	return { mapID = mapID, x = math.floor(x * 10000 + 0.5) / 10000, y = math.floor(y * 10000 + 0.5) / 10000 }
end

-- result: "W" win, "L" loss, "P" probable win. how: kill, group, probable, recap,
-- targeting. where / when default to now and here.
function Spy:RecordEncounter(name, result, how, where, when)
	local playerData = SpyPerCharDB and SpyPerCharDB.PlayerData and SpyPerCharDB.PlayerData[name]
	if not playerData or playerData.isEnemy == false then
		return
	end
	where = where or Spy:PlayerPosition()
	local entry = {
		t = when or time(), n = name, r = result, k = how,
		c = playerData.class, l = playerData.isGuess == false and playerData.level or nil, g = playerData.guild,
	}
	if where then
		entry.m, entry.x, entry.y = where.mapID, where.x, where.y
	end
	if result == "W" then
		Spy.RecentKills[name] = GetTime()
	end
	local list = Spy:Encounters()
	list[#list + 1] = entry
	while #list > Spy.EncounterLimit do
		table.remove(list, 1)
	end
	Spy:RefreshEncounterMap()
	return entry
end

-- Which fights the map shows, from the options.
function Spy:EncounterShown(entry, now)
	local profile = settings()
	if profile.ShowEncounters == false or not entry.m then
		return false
	end
	if entry.r == "L" and profile.EncounterShowLosses == false then
		return false
	end
	if entry.r ~= "L" and profile.EncounterShowWins == false then
		return false
	end
	local period = PERIODS[profile.EncounterPeriod or "all"]
	if period and (now or time()) - (entry.t or 0) > period then
		return false
	end
	return true
end

local function showTooltip(icon)
	local entry = icon.entry
	if not entry then
		return
	end
	GameTooltip:SetOwner(icon, "ANCHOR_RIGHT")
	local label = entry.r == "L" and L["EncounterLoss"] or (entry.r == "P" and L["EncounterProbableWin"] or L["EncounterWin"])
	local color = COLORS[entry.r] or COLORS.W
	GameTooltip:AddLine(label .. " - " .. entry.n, color[1], color[2], color[3])
	local details = {}
	if entry.l then details[#details + 1] = L["Level"] .. " " .. entry.l end
	if entry.c and L[entry.c] then details[#details + 1] = L[entry.c] end
	if #details > 0 then
		GameTooltip:AddLine(table.concat(details, " "), 1, 1, 1)
	end
	if entry.g and entry.g ~= "" then
		GameTooltip:AddLine("<" .. entry.g .. ">", 1, 1, 1)
	end
	GameTooltip:AddLine(date("%Y-%m-%d %H:%M", entry.t), 0.8, 0.8, 0.8)
	-- rawget: an unknown kind of fight shows nothing instead of an AceLocale warning.
	local how = rawget(L, "EncounterHow_" .. tostring(entry.k))
	if how then
		GameTooltip:AddLine(how, 0.6, 0.6, 0.6, true)
	end
	GameTooltip:Show()
end

local function iconFor(index)
	local icon = Spy.EncounterIcons[index]
	if icon then
		return icon
	end
	-- Not on the world map itself (PetKills.lua): HereBeDragons puts it there while shown.
	icon = CreateFrame("Button", nil, Spy.MapIconHolder and Spy:MapIconHolder() or WorldMapFrame)
	if Spy.IgnoreForGamepad then
		Spy:IgnoreForGamepad(icon)
	end
	icon:SetSize(14, 14)
	icon.texture = icon:CreateTexture(nil, "OVERLAY")
	icon.texture:SetAllPoints(icon)
	icon:SetScript("OnEnter", showTooltip)
	icon:SetScript("OnLeave", function() GameTooltip:Hide() end)
	Spy.EncounterIcons[index] = icon
	return icon
end

-- Puts back every skull the options allow. Cheap enough to redo from scratch.
-- A skull shows on its zone map and on the map just above it (HBD "show parent").
local parents = {}
local function parentOf(mapID)
	if parents[mapID] == nil then
		local info = C_Map and C_Map.GetMapInfo and C_Map.GetMapInfo(mapID)
		parents[mapID] = info and info.parentMapID or false
	end
	return parents[mapID]
end

function Spy:EncounterOnMap(entry, mapID)
	if not mapID then
		return true
	end
	return entry.m == mapID or parentOf(entry.m) == mapID
end

function Spy:RefreshEncounterMap()
	if not WorldMapFrame then
		return
	end
	HBDP:RemoveAllWorldMapIcons(Spy.EncounterRef)
	for _, icon in ipairs(Spy.EncounterIcons) do
		icon.entry = nil
		icon:Hide()
	end
	-- Newest first, and at most Spy.MapSkullLimit skulls (PetKills.lua says why).
	-- CurseForge comment: "the skulls disappear after a bit, the win/loss data is still
	-- there". The limit counted every fight of every zone, so after 100 fights anywhere
	-- the older skulls left the map. It now counts the fights of the map on display only.
	local now, shown, list = time(), 0, Spy:Encounters()
	-- Adjustable (CurseForge: "still some missing in zones where I had 100s").
	local limit = tonumber(settings().EncounterMapLimit) or Spy.MapSkullLimit or 100
	local markKey = settings().EncounterMark or "skull"
	local ok, mapID = pcall(WorldMapFrame.GetMapID, WorldMapFrame)
	mapID = ok and type(mapID) == "number" and mapID or nil
	Spy.EncounterMapID = mapID
	for index = #list, 1, -1 do
		local entry = list[index]
		if shown >= limit then
			break
		end
		if Spy:EncounterShown(entry, now) and Spy:EncounterOnMap(entry, mapID) then
			shown = shown + 1
			local icon = iconFor(shown)
			icon.entry = entry
			paint(icon.texture, markKey)
			local color = COLORS[entry.r] or COLORS.W
			icon.texture:SetVertexColor(color[1], color[2], color[3])
			HBDP:AddWorldMapIconMap(Spy.EncounterRef, icon, entry.m, entry.x, entry.y, HBD_PINS_WORLDMAP_SHOW_PARENT, Spy.EncounterPinLevel)
		end
	end
	Spy.EncountersShown = shown
end

function Spy:EncounterCounts()
	local wins, losses, probable = 0, 0, 0
	for _, entry in ipairs(Spy:Encounters()) do
		if entry.r == "L" then
			losses = losses + 1
		elseif entry.r == "P" then
			probable = probable + 1
		else
			wins = wins + 1
		end
	end
	return wins, losses, probable
end

-- Probable wins --------------------------------------------------------------------

local function wasFighting(name)
	local now = GetTime()
	local targeted = Spy.RecentTargets[name]
	local targetingMe = Spy.TargetingMe and Spy.TargetingMe[name]
	return (targeted and now - targeted <= PROBABLE_WINDOW) or (targetingMe and now - targetingMe <= PROBABLE_WINDOW)
		or Spy:EnemyPlayerName("target") == name
end

Spy.UnitDiedEvent = Guard("UnitDiedEvent", function(guid)
	if not Spy.EnabledInZone or not settings().EncounterProbable then
		return
	end
	local name = Spy:PlayerNameFromGUID(guid)
	local playerData = name and SpyPerCharDB.PlayerData[name]
	if not playerData or playerData.isEnemy == false then
		return
	end
	if not Spy:Readable(UnitAffectingCombat("player")) or not wasFighting(name) then
		return
	end
	local where, when, died = Spy:PlayerPosition(), time(), GetTime()
	Spy:ScheduleTimer(function()
		local kill = Spy.RecentKills[name]
		if kill and math.abs(kill - died) <= PROBABLE_DELAY + 2 then
			return
		end
		Spy:RecordEncounter(name, "P", "probable", where, when)
	end, PROBABLE_DELAY)
end)

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("PLAYER_TARGET_CHANGED")
pcall(events.RegisterEvent, events, "UNIT_DIED")
events:SetScript("OnEvent", Guard("EncounterEvents", function(_, event, ...)
	if event == "PLAYER_TARGET_CHANGED" then
		local name = Spy.db and Spy:EnemyPlayerName("target")
		if name then
			Spy.RecentTargets[name] = GetTime()
		end
	elseif event == "UNIT_DIED" then
		Spy.UnitDiedEvent(...)
	elseif event == "PLAYER_ENTERING_WORLD" and Spy.db and not Spy.EncounterMapReady then
		Spy.EncounterMapReady = true
		Spy:RefreshEncounterMap()
		-- The skulls depend on the map on display: redrawn when it changes.
		local function mapChanged()
			if Spy.EncounterMapReady and WorldMapFrame:GetMapID() ~= Spy.EncounterMapID then
				Spy:RefreshEncounterMap()
			end
		end
		if WorldMapFrame and WorldMapFrame.OnMapChanged then
			hooksecurefunc(WorldMapFrame, "OnMapChanged", Guard("EncounterMapChanged", mapChanged))
		end
		if WorldMapFrame and WorldMapFrame.HookScript then
			WorldMapFrame:HookScript("OnShow", Guard("EncounterMapShown", mapChanged))
		end
	end
end))

-- Options and slash command -----------------------------------------------------------

local function option(key, order, default)
	return {
		name = L[key],
		desc = L[key .. "Description"],
		type = "toggle",
		order = order,
		width = "full",
		get = function()
			local value = settings()[key]
			if value == nil then return default end
			return value
		end,
		set = function(_, value)
			Spy.db.profile[key] = value
			Spy:RefreshEncounterMap()
		end,
	}
end

Spy.options.args.MapOptions.args.CombatMap = {
	name = L["CombatMap"],
	type = "group",
	order = 8,
	inline = true,
	args = {
		intro = { name = L["CombatMapDescription"], type = "description", order = 1, fontSize = "medium" },
		ShowEncounters = option("ShowEncounters", 2, true),
		EncounterShowWins = option("EncounterShowWins", 3, true),
		EncounterShowLosses = option("EncounterShowLosses", 4, true),
		EncounterPeriod = {
			name = L["EncounterPeriod"],
			desc = L["EncounterPeriodDescription"],
			type = "select",
			order = 5,
			values = { day = L["EncounterPeriodDay"], week = L["EncounterPeriodWeek"],
				month = L["EncounterPeriodMonth"], all = L["EncounterPeriodAll"] },
			sorting = { "day", "week", "month", "all" },
			get = function() return settings().EncounterPeriod or "all" end,
			set = function(_, value)
				Spy.db.profile.EncounterPeriod = value
				Spy:RefreshEncounterMap()
			end,
		},
		EncounterProbable = option("EncounterProbable", 6, false),
		EncounterMark = {
			name = L["EncounterMark"],
			desc = L["EncounterMarkDescription"],
			type = "select",
			order = 6.2,
			values = { skull = L["EncounterMarkSkull"], swords = L["EncounterMarkSwords"],
				dot = L["EncounterMarkDot"], cross = L["EncounterMarkCross"],
				star = L["EncounterMarkStar"], diamond = L["EncounterMarkDiamond"] },
			sorting = { "skull", "swords", "dot", "cross", "star", "diamond" },
			get = function() return settings().EncounterMark or "skull" end,
			set = function(_, value)
				Spy.db.profile.EncounterMark = value
				Spy:RefreshEncounterMap()
			end,
		},
		EncounterMapLimit = {
			name = L["EncounterMapLimit"],
			desc = L["EncounterMapLimitDescription"],
			type = "range",
			order = 6.5,
			min = 5, -- Forever: down to the last 5 fights (CurseForge comment)
			max = 1000,
			step = 5,
			get = function() return tonumber(settings().EncounterMapLimit) or Spy.MapSkullLimit end,
			set = function(_, value)
				Spy.db.profile.EncounterMapLimit = value
				Spy:RefreshEncounterMap()
			end,
		},
		EncounterClear = {
			name = L["EncounterClear"],
			desc = L["EncounterClearDescription"],
			type = "execute",
			order = 7,
			confirm = true,
			confirmText = L["EncounterClearConfirm"],
			func = function()
				SpyPerCharDB.Encounters = {}
				Spy:RefreshEncounterMap()
			end,
		},
	},
}

Spy.optionsSlash.args.fights = {
	name = L["FightsSlash"],
	desc = L["FightsSlashDescription"],
	type = "execute",
	order = 12,
	func = function()
		local shown = settings().ShowEncounters == false
		Spy.db.profile.ShowEncounters = shown
		Spy:RefreshEncounterMap()
		local wins, losses, probable = Spy:EncounterCounts()
		DEFAULT_CHAT_FRAME:AddMessage(L["SpySignatureColored"] .. (shown and L["FightsShown"] or L["FightsHidden"])
			:format(wins, losses, probable))
	end,
	dialogHidden = true,
}
