-- Spy for Forever: Local Defense announcements.
--
-- CurseForge comment: "I haven't been able to announce in Local Defense since launch".
-- Two causes:
-- * Forever does not let an addon post in a public channel (Local Defense, General,
--   Trade) at all: seen in game, even right after a click the client answered
--   ADDON_ACTION_BLOCKED. The player has to send it: Spy shows the detection in its
--   alert window, a click on it puts "/<channel> <message>" in the chat box, and the
--   player presses Enter.
-- * Spy found the channel by its full name, "LocalDefense - <zone>". When the zone
--   text did not match the channel name it found nothing and posted nothing. It now
--   looks through the channels you are in for the one whose name starts with
--   Local Defense (in the client's language or in English).
-- Written from scratch.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")
local Guard = Spy.ForeverGuard

local ICON = "Interface\\Icons\\Ability_Warrior_BattleShout"
local PENDING_TIME = 8   -- seconds a detection can still be posted by clicking the alert
local CLICK_SLOP = 5     -- pixels the cursor may move for a press to count as a click

local function readable(v)
	return Spy:Readable(v)
end

local function record(result)
	Spy.LastAnnounce = { result = result, when = time() }
end

-- The Local Defense channel you are in: its number and name, or nil.
function Spy:LocalDefenseChannel()
	local prefixes = {}
	for _, prefix in ipairs({ rawget(L, "LocalDefenseChannelName"), "LocalDefense" }) do
		if type(prefix) == "string" and prefix ~= "" then
			prefixes[#prefixes + 1] = prefix:lower()
		end
	end
	local list = GetChannelList and { GetChannelList() } or {}
	for i = 1, #list, 3 do -- id, name, disabled
		local id, name, disabled = readable(list[i]), readable(list[i + 1]), list[i + 2]
		if type(id) == "number" and type(name) == "string" and disabled ~= true then
			local lower = name:lower()
			for _, prefix in ipairs(prefixes) do
				if lower:sub(1, #prefix) == prefix then
					return id, name
				end
			end
		end
	end
	-- The original lookup, kept as a last try.
	local zone = readable(GetZoneText())
	if type(zone) == "string" and zone ~= "" then
		local name = (rawget(L, "LocalDefenseChannelName") or "LocalDefense") .. " - " .. zone
		local id = readable(GetChannelName(name))
		if type(id) == "number" and id > 0 then
			return id, name
		end
	end
	return nil
end

-- The message goes in the chat box, ready: the player's Enter sends it.
local function send(msg, id)
	local open = (ChatFrameUtil and ChatFrameUtil.OpenChat) or ChatFrame_OpenChat
	if not open then
		return false, "no chat box"
	end
	return pcall(open, "/" .. id .. " " .. msg)
end

-- Puts the message in the chat box when the player just clicked (fromClick),
-- otherwise waits for a click on the alert window.
function Spy:SendLocalDefense(msg, fromClick)
	if not fromClick then
		Spy.PendingAnnounce = { msg = msg, when = GetTime(), player = Spy.AnnouncingPlayer }
		record("waiting for a click on the alert")
		Spy:ShowAnnounceAlert()
		return
	end
	local id, name = Spy:LocalDefenseChannel()
	if not id then
		record("no Local Defense channel joined")
		DEFAULT_CHAT_FRAME:AddMessage(L["SpySignatureColored"] .. L["LocalDefenseMissing"])
		return
	end
	local ok, err = send(msg, id)
	record(ok and ("put in the chat box for " .. id .. ". " .. name .. ", Enter sends it") or ("chat box refused: " .. tostring(err)))
	Spy.LastAnnounce.msg = msg
end

-- Which player Spy is announcing, for the alert.
local baseAnnouncePlayer = Spy.AnnouncePlayer
function Spy:AnnouncePlayer(player, channel, ...)
	Spy.AnnouncingPlayer = player
	local ok, err = pcall(baseAnnouncePlayer, self, player, channel, ...)
	Spy.AnnouncingPlayer = nil
	if not ok then
		error(err, 0)
	end
end

-- The alert shows a moment after it is asked for, and hides when it is done: its
-- OnHide ends the wait (see hookWindow), the time limit covers the rest.
local function pendingValid()
	local pending = Spy.PendingAnnounce
	return pending and Spy.AlertWindow and GetTime() - pending.when <= PENDING_TIME
end

local function hint(window)
	if not window.AnnounceHint then
		window.AnnounceHint = window:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		window.AnnounceHint:SetPoint("TOP", window, "BOTTOM", 0, -3)
		window.AnnounceHint:SetText(L["AnnounceClickHint"])
	end
	return window.AnnounceHint
end

-- Clicks reach the alert only while there is something to post (or when it is
-- movable, as before): otherwise it lets them through to the world.
local function updateMouse()
	local window = Spy.AlertWindow
	if not window then
		return
	end
	local waiting = pendingValid() and true or false
	hint(window):SetShown(waiting)
	window:EnableMouse(waiting or Spy.db.profile.DisplayWarnings == "Moveable")
end

function Spy:AnnouncePending()
	if not pendingValid() then
		Spy.PendingAnnounce = nil
		updateMouse()
		return false
	end
	local pending = Spy.PendingAnnounce
	Spy.PendingAnnounce = nil
	Spy:SendLocalDefense(pending.msg, true)
	updateMouse()
	return true
end

local function hookWindow(window)
	if window.ForeverAnnounceHooked then
		return
	end
	window.ForeverAnnounceHooked = true
	window:HookScript("OnMouseDown", function(self, button)
		self.AnnounceDownAt = { GetCursorPosition() }
	end)
	window:HookScript("OnMouseUp", Guard("AnnounceClick", function(self, button)
		local down = self.AnnounceDownAt
		self.AnnounceDownAt = nil
		if button ~= "LeftButton" or not down then
			return
		end
		local x, y = GetCursorPosition()
		if math.abs((x or 0) - (down[1] or 0)) > CLICK_SLOP or math.abs((y or 0) - (down[2] or 0)) > CLICK_SLOP then
			return -- dragged, not clicked
		end
		Spy:AnnouncePending()
	end))
	window:HookScript("OnHide", function()
		if Spy.RestartingAlert then
			return -- our own flash restarting, the wait goes on
		end
		Spy.PendingAnnounce = nil
		updateMouse()
	end)
end

-- The detection in the alert window, unless a bigger alert (Kill On Sight, stealth)
-- is showing: that one gets the hint, its click posts the same detection.
function Spy:ShowAnnounceAlert()
	local window = Spy.AlertWindow
	if not window then
		return
	end
	hookWindow(window)
	local busy = SpyFrameIsFading(window) and Spy.AlertType and Spy.AlertType ~= "announce"
	if not busy then
		Spy.Colors:RegisterBorder("Alert", "Away Border", window)
		window.Icon:SetBackdrop({ bgFile = ICON })
		Spy.Colors:RegisterBorder("Alert", "Background", window.Icon)
		Spy.Colors:RegisterBackground("Alert", "Icon", window.Icon)
		Spy.Colors:RegisterFont("Alert", "Away Text", window.Title)
		window.Title:SetText(L["AlertAnnounceTitle"])
		Spy.Colors:RegisterFont("Alert", "Name Text", window.Name)
		window.Name:SetText(Spy.AnnouncingPlayer or "")
		window.Location:SetText("")
		local width = math.max(window.Title:GetStringWidth(), window.Name:GetStringWidth())
		window:SetWidth(width + 52)
		window.Name:SetWidth(width)
		window.Location:SetWidth(width)
		Spy.RestartingAlert = true
		local ok, err = pcall(function()
			Spy.FrameFlashStop(window)
			Spy.FrameFlash(window, 0, 1, 6, false, 5, 0)
		end)
		Spy.RestartingAlert = nil
		if not ok then
			error(err, 0)
		end
		Spy.AlertType = "announce"
	end
	updateMouse()
end

-- An alert window flashing away ends the wait.
local watcher = CreateFrame("Frame")
local elapsedSince = 0
watcher:SetScript("OnUpdate", function(_, elapsed)
	elapsedSince = elapsedSince + elapsed
	if elapsedSince < 0.5 then
		return
	end
	elapsedSince = 0
	if Spy.PendingAnnounce and not pendingValid() then
		Spy.PendingAnnounce = nil
	end
	if Spy.AlertWindow and Spy.db then
		updateMouse()
	end
end)

function Spy:AnnounceReport()
	local id, name = Spy:LocalDefenseChannel()
	local last = Spy.LastAnnounce
	return ("Local Defense channel: %s | last announce: %s"):format(
		id and (id .. ". " .. tostring(name)) or "not joined",
		last and ("%s, %ss ago%s"):format(last.result, time() - last.when, last.msg and (" | text: " .. last.msg) or "") or "none")
end
