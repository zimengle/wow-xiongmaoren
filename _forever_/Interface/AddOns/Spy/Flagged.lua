-- Forever: "Only flagged enemies" (CurseForge comment: on a PvE server, only the enemies
-- flagged for PvP matter). Off by default. An enemy Spy reads as not flagged stays in
-- the list, greyed, and gets no alert, no sound and no automatic announce. If he flags
-- later while Spy still sees him, he gets the alert he missed.
--
-- The flag is read on each unit Spy scans (nameplates, target, focus, mouseover, every
-- second while in range). A flag the game keeps secret counts as flagged: nothing is hidden
-- on a guess.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")

Spy.Unflagged = {}                                  -- name -> true, read as not flagged
Spy.FlagStats = { unflagged = 0, flagged = 0, hidden = 0, late = 0, quiet = 0 }

local function enabled()
	return Spy.db and Spy.db.profile and Spy.db.profile.OnlyFlaggedEnemies == true
end

-- True when the option is on and the enemy was read as not flagged.
function Spy:IsQuietEnemy(name)
	return enabled() and type(name) == "string" and Spy.Unflagged[name] == true
end

local baseScan = Spy.ScanUnit
function Spy:ScanUnit(unit)
	local name = Spy:PlayerName(unit)
	local wasQuiet = name and Spy.Unflagged[name]
	if name and Spy:Readable(UnitIsEnemy("player", unit)) then
		local raw = UnitIsPVP(unit)
		local flagged = Spy:Readable(raw)
		if flagged == false then
			Spy.Unflagged[name] = true
			Spy.FlagStats.unflagged = Spy.FlagStats.unflagged + 1
		elseif flagged == nil and Spy:IsSecret(raw) then
			Spy.Unflagged[name] = nil
			Spy.FlagStats.hidden = Spy.FlagStats.hidden + 1
		else
			Spy.Unflagged[name] = nil
			Spy.FlagStats.flagged = Spy.FlagStats.flagged + 1
		end
	end
	local result = baseScan(self, unit)
	if name and wasQuiet and not Spy.Unflagged[name] then
		-- He just flagged: the alert he did not get, and a redraw to un-grey his row.
		if enabled() and result == name and Spy.ActiveList and Spy.ActiveList[name] then
			Spy.FlagStats.late = Spy.FlagStats.late + 1
			Spy:AlertPlayer(name)
		end
		if Spy.MainWindow and Spy.RefreshCurrentList then
			Spy:RefreshCurrentList()
		end
	elseif name and not wasQuiet and Spy.Unflagged[name] and enabled() then
		if Spy.MainWindow and Spy.RefreshCurrentList then
			Spy:RefreshCurrentList()
		end
	end
	return result
end

local function quiet(player, source)
	if (source == nil or source == Spy.CharacterName) and Spy:IsQuietEnemy(player) then
		Spy.FlagStats.quiet = Spy.FlagStats.quiet + 1
		return true
	end
	return false
end

local baseAlertPlayer = Spy.AlertPlayer
function Spy:AlertPlayer(player, source, ...)
	if quiet(player, source) then
		return
	end
	return baseAlertPlayer(self, player, source, ...)
end

local baseStealth = Spy.AlertStealthPlayer
function Spy:AlertStealthPlayer(player, ...)
	if quiet(player) then
		return
	end
	return baseStealth(self, player, ...)
end

local baseProwl = Spy.AlertProwlPlayer
function Spy:AlertProwlPlayer(player, ...)
	if quiet(player) then
		return
	end
	return baseProwl(self, player, ...)
end

-- Automatic announces only: a channel picked from the menu is the player's choice.
local baseAnnounce = Spy.AnnouncePlayer
function Spy:AnnouncePlayer(player, channel, ...)
	if channel == nil and quiet(player) then
		return
	end
	return baseAnnounce(self, player, channel, ...)
end

-- The row: name and level in grey, bar in grey.
local baseSetBar = Spy.SetBar
function Spy:SetBar(num, name, desc, value, colorgroup, colorclass, tooltipData, opacity, ...)
	baseSetBar(self, num, name, desc, value, colorgroup, colorclass, tooltipData, opacity, ...)
	local row = Spy.MainWindow and Spy.MainWindow.Rows[num]
	if not row or not Spy:IsQuietEnemy(name) then
		return
	end
	local alpha = opacity or 1
	if Spy.Colors and Spy.Colors.UnregisterItem then
		Spy.Colors:UnregisterItem(row.StatusBar)
	end
	row.StatusBar:SetStatusBarColor(0.35, 0.35, 0.35, alpha)
	row.LeftText:SetTextColor(0.6, 0.6, 0.6, alpha)
	row.RightText:SetTextColor(0.6, 0.6, 0.6, alpha)
end

function Spy:FlagReport()
	local count = 0
	for _ in pairs(Spy.Unflagged) do count = count + 1 end
	local s = Spy.FlagStats
	return ("Only flagged enemies: %s | read not flagged now: %d | reads: %d not flagged, %d flagged, %d secret | alerts held: %d, given late: %d"):format(
		enabled() and "on" or "off", count, s.unflagged, s.flagged, s.hidden, s.quiet, s.late)
end

Spy.options.args.General.args.OnlyFlaggedEnemies = {
	name = L["OnlyFlaggedEnemies"],
	desc = L["OnlyFlaggedEnemiesDescription"],
	type = "toggle",
	order = 6.5,
	width = "full",
	get = function() return enabled() end,
	set = function(_, value)
		Spy.db.profile.OnlyFlaggedEnemies = value
		if Spy.MainWindow and Spy.RefreshCurrentList then
			Spy:RefreshCurrentList()
		end
	end,
}
