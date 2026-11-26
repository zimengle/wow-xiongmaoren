-- Forever: "Show the title bar on mouseover" (CurseForge request: a cleaner window, with
-- the enemy names still fully visible). Off by default. The title bar, its text, buttons
-- and counter are drawn invisible and come back while the mouse is over them, so the
-- window can still be dragged and its buttons used.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")

local PARTS = { "TitleBar", "Title", "CloseButton", "LeftButton", "RightButton",
	"ClearButton", "StatsButton", "CountFrame", "CountButton" }

local function enabled()
	return Spy.db and Spy.db.profile and Spy.db.profile.HideHeader == true
end

local function parts(window)
	local list = {}
	for _, key in ipairs(PARTS) do
		local part = rawget(window, key)
		if part then
			list[#list + 1] = part
		end
	end
	return list
end

-- The mouse is over the header when it is over any of its parts (the bar itself covers
-- the text and the buttons; a few pixels of margin make it easier to find).
function Spy:HeaderHovered(window)
	window = window or Spy.MainWindow
	if not window then
		return false
	end
	if window.isMoving or window.isResizing then
		return true
	end
	for _, part in ipairs(parts(window)) do
		local ok, over = pcall(part.IsMouseOver, part, 4, -4, -4, 4)
		if ok and over then
			return true
		end
	end
	return false
end

Spy.HeaderShown = true

function Spy:UpdateHeader()
	local window = Spy.MainWindow
	if not window then
		return
	end
	local show = not enabled() or Spy:HeaderHovered(window)
	if show == Spy.HeaderShown then
		return
	end
	Spy.HeaderShown = show
	for _, part in ipairs(parts(window)) do
		part:SetAlpha(show and 1 or 0)
	end
end

local watcher = CreateFrame("Frame")
local elapsedSince = 0
watcher:SetScript("OnUpdate", function(_, elapsed)
	elapsedSince = elapsedSince + (elapsed or 0)
	if elapsedSince < 0.1 then
		return
	end
	elapsedSince = 0
	if enabled() or not Spy.HeaderShown then
		Spy:UpdateHeader()
	end
end)

Spy.options.args.DisplayOptions.args.Look.args.HideHeader = {
	name = L["HideHeader"],
	desc = L["HideHeaderDescription"],
	type = "toggle",
	order = 3.6,
	width = "full",
	get = function() return enabled() end,
	set = function(_, value)
		Spy.db.profile.HideHeader = value and true or false
		Spy:UpdateHeader()
	end,
}
