-- Forever: "Pop up only for Kill on Sight" (CurseForge comment: keep the window out of
-- the way, show it for a Kill on Sight player nearby, then hide it again, while Spy keeps
-- tracking everyone). Off by default.
--
-- With the window closed (its X button; /spy hide turns Spy off), an enemy who is not on
-- the Kill on Sight list, or in a Kill on Sight or watched guild, no longer reopens it:
-- Spy records him, silently (in the original, alerts come from drawing the list, so a
-- closed window gives none). One who is opens it, with his alert. Once no such player is
-- in the active list, the window Spy opened that way closes again. A window you open
-- yourself stays open.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")

Spy.KoSPopupStats = { held = 0, opened = 0, closed = 0 }

local function enabled()
	return Spy.db and Spy.db.profile and Spy.db.profile.KoSOnlyPopup == true
end

-- Kill on Sight, or a member of a Kill on Sight guild or of a watched guild.
function Spy:IsPopupPlayer(player)
	if type(player) ~= "string" then
		return false
	end
	if Spy.IsQuietEnemy and Spy:IsQuietEnemy(player) then
		return false
	end
	if SpyPerCharDB.KOSData[player] then
		return true
	end
	local data = SpyPerCharDB.PlayerData[player]
	local guild = data and data.guild
	if guild and guild ~= "" then
		if Spy.KOSGuild and Spy.KOSGuild[guild] then
			return true
		end
		if Spy.WatchedGuild and Spy:WatchedGuild(guild) then
			return true
		end
	end
	return false
end

local hooked = false
local function hookWindow()
	if hooked or not Spy.MainWindow then
		return
	end
	hooked = true
	Spy.MainWindow:HookScript("OnHide", function()
		Spy.KoSPopupOpened = nil
	end)
end

local baseAdd = Spy.AddDetectedToLists
function Spy:AddDetectedToLists(player, timestamp, learnt, source, ...)
	hookWindow()
	local profile = Spy.db.profile
	if not enabled() or profile.MainWindowVis or not profile.ShowOnDetection then
		return baseAdd(self, player, timestamp, learnt, source, ...)
	end
	if Spy:IsPopupPlayer(player) then
		local result = baseAdd(self, player, timestamp, learnt, source, ...)
		if profile.MainWindowVis then
			Spy.KoSPopupOpened = true
			Spy.KoSPopupStats.opened = Spy.KoSPopupStats.opened + 1
		end
		return result
	end
	-- Not one of them: recorded in the lists, the window stays shut.
	Spy.KoSPopupStats.held = Spy.KoSPopupStats.held + 1
	profile.ShowOnDetection = false
	local ok, err = pcall(baseAdd, self, player, timestamp, learnt, source, ...)
	profile.ShowOnDetection = true
	if not ok then
		error(err, 0)
	end
end

local function popupPlayerActive()
	for player in pairs(Spy.ActiveList) do
		if Spy:IsPopupPlayer(player) then
			return true
		end
	end
	return false
end

local baseExpire = Spy.ManageExpirations
function Spy:ManageExpirations(...)
	local result = baseExpire(self, ...)
	if enabled() and Spy.KoSPopupOpened and Spy.MainWindow and Spy.MainWindow:IsShown() and not popupPlayerActive() then
		Spy.KoSPopupStats.closed = Spy.KoSPopupStats.closed + 1
		if not InCombatLockdown() then
			Spy.MainWindow:Hide()
		else
			Spy:HideSpyCombatCheck()
		end
	end
	return result
end

function Spy:KoSPopupReport()
	local s = Spy.KoSPopupStats
	return ("Pop up only for Kill on Sight: %s | window kept shut: %d | opened: %d | closed again: %d"):format(
		enabled() and "on" or "off", s.held, s.opened, s.closed)
end

Spy.options.args.General.args.KoSOnlyPopup = {
	name = L["KoSOnlyPopup"],
	desc = L["KoSOnlyPopupDescription"],
	type = "toggle",
	order = 8.5,
	width = "full",
	get = function() return enabled() end,
	set = function(_, value)
		Spy.db.profile.KoSOnlyPopup = value
	end,
}
