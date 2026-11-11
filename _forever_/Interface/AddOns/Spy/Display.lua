-- Spy for Forever: the look of the Spy window.
--
-- Same window as the original Spy, with a few things Forever players asked for:
-- * a class icon at the start of each row;
-- * markers on the rows: a skull for a Kill On Sight player, a tabard for a member of
--   a watched guild;
-- * the level coloured by difficulty, like the game colours quest levels;
-- * the window scale and width as settings.
-- The window rows and the options preview are laid out by the same Spy:LayoutRow, so
-- the preview matches the window.

local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale("Spy")
local Guard = Spy.ForeverGuard

local CLASS_TEXTURE = "Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"
local UNKNOWN_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"
local KOS_MARKER = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"
local GUILD_MARKER = "Interface\\Icons\\INV_Misc_TabardPVP_01"
local MIN_WIDTH, MAX_WIDTH = 90, 300   -- the bounds Spy gives the window
local MIN_SCALE, MAX_SCALE = 0.5, 2

local function profile()
	return Spy.db and Spy.db.profile or {}
end

-- Display settings are on unless turned off (nil = default).
function Spy:DisplayOn(key)
	return profile()[key] ~= false
end

function Spy:WindowScale()
	local scale = tonumber(profile().MainWindow and profile().MainWindow.Scale) or 1
	return math.max(MIN_SCALE, math.min(MAX_SCALE, scale))
end

-- Level colour --------------------------------------------------------------------

local function difficultyColor(level)
	if GetQuestDifficultyColor then
		local ok, color = pcall(GetQuestDifficultyColor, level)
		if ok and type(color) == "table" and color.r then
			return color.r, color.g, color.b
		end
	end
	local diff = level - (tonumber(Spy:Readable(UnitLevel("player"))) or level)
	if diff >= 5 then return 1, 0.1, 0.1 end
	if diff >= 3 then return 1, 0.5, 0.25 end
	if diff >= -2 then return 1, 0.82, 0 end
	return 0.25, 0.75, 0.25
end

-- "30 Priest" -> the level part coloured, the rest unchanged. "??" and "30+" (a guess)
-- keep their text; a guess is coloured like its number.
function Spy:ColorLevel(desc, alpha)
	if type(desc) ~= "string" or not Spy:DisplayOn("LevelColors") then
		return desc
	end
	local level, rest = desc:match("^(%d+%+?)(.*)$")
	local number = level and tonumber(level:match("%d+"))
	if not number then
		return desc
	end
	local r, g, b = difficultyColor(number)
	local a = math.floor(math.max(0, math.min(1, alpha or 1)) * 255 + 0.5)
	return ("|c%02x%02x%02x%02x%s|r%s"):format(a, r * 255, g * 255, b * 255, level, rest)
end

-- Rows -------------------------------------------------------------------------

-- Adds the icon and marker textures to a row built by Spy:SetupBar.
function Spy:SetupRowExtras(row)
	if row.ClassIcon then
		return
	end
	row.ClassIcon = row.StatusBar:CreateTexture(nil, "OVERLAY")
	row.Marker = row.StatusBar:CreateTexture(nil, "OVERLAY")
	row.ClassIcon:Hide()
	row.Marker:Hide()
end

-- The retail UI draws class icons from the "classicon-<class>" atlas (GetClassAtlas);
-- the old texture with CLASS_ICON_TCOORDS is the fallback.
local function setClassIcon(texture, class)
	if type(class) == "string" and GetClassAtlas and C_Texture and C_Texture.GetAtlasInfo then
		local atlas = GetClassAtlas(class:lower())
		local ok, info = pcall(C_Texture.GetAtlasInfo, atlas)
		if ok and info then
			texture:SetTexCoord(0, 1, 0, 1)
			texture:SetAtlas(atlas)
			return
		end
	end
	local coords = CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[class]
	if coords then
		texture:SetTexture(CLASS_TEXTURE)
		texture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
	else
		texture:SetTexture(UNKNOWN_ICON)
		texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	end
end

-- What marker a player gets: "kos", "guild" or nil.
function Spy:RowMarker(player)
	if type(player) ~= "string" or not Spy:DisplayOn("RowMarkers") then
		return nil
	end
	if SpyPerCharDB and SpyPerCharDB.KOSData and SpyPerCharDB.KOSData[player] then
		return "kos"
	end
	local playerData = SpyPerCharDB and SpyPerCharDB.PlayerData and SpyPerCharDB.PlayerData[player]
	if playerData and playerData.guild and Spy.WatchedGuild and Spy:WatchedGuild(playerData.guild) then
		return "guild"
	end
	return nil
end

-- Places the icon, the marker and the name. size: the row height.
function Spy:LayoutRow(row, class, marker, alpha)
	Spy:SetupRowExtras(row)
	local size = math.max(6, (row:GetHeight() or 14) - 2)
	local x = 2
	if Spy:DisplayOn("ClassIcons") then
		setClassIcon(row.ClassIcon, class)
		row.ClassIcon:ClearAllPoints()
		row.ClassIcon:SetPoint("LEFT", row.StatusBar, "LEFT", x, 0)
		row.ClassIcon:SetSize(size, size)
		row.ClassIcon:SetAlpha(alpha or 1)
		row.ClassIcon:Show()
		x = x + size + 3
	else
		row.ClassIcon:Hide()
	end
	if marker then
		row.Marker:SetTexture(marker == "kos" and KOS_MARKER or GUILD_MARKER)
		if marker == "kos" then
			row.Marker:SetTexCoord(0, 1, 0, 1)
		else
			row.Marker:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		end
		row.Marker:ClearAllPoints()
		row.Marker:SetPoint("LEFT", row.StatusBar, "LEFT", x, 0)
		row.Marker:SetSize(size, size)
		row.Marker:SetAlpha(alpha or 1)
		row.Marker:Show()
		x = x + size + 2
	else
		row.Marker:Hide()
	end
	row.LeftText:ClearAllPoints()
	row.LeftText:SetPoint("LEFT", row.StatusBar, "LEFT", x, 0)
	local width = (row:GetWidth() or 0) - (row.RightText:GetStringWidth() or 0) - x - 4
	row.LeftText:SetWidth(math.max(10, width))
end

local baseSetupBar = Spy.SetupBar
function Spy:SetupBar(row, ...)
	baseSetupBar(self, row, ...)
	Spy:SetupRowExtras(row)
end

local baseSetBar = Spy.SetBar
function Spy:SetBar(num, name, desc, value, colorgroup, colorclass, tooltipData, opacity, ...)
	baseSetBar(self, num, name, desc, value, colorgroup, colorclass, tooltipData, opacity, ...)
	local row = Spy.MainWindow and Spy.MainWindow.Rows[num]
	if not row then
		return
	end
	local ok, err = pcall(function()
		row.RightText:SetText(Spy:ColorLevel(desc, opacity or 1))
		Spy:LayoutRow(row, colorclass, Spy:RowMarker(name), opacity or 1)
	end)
	if not ok then
		Spy.ForeverLastError = "PaintRow: " .. tostring(err)
	end
end

-- Scale and width -------------------------------------------------------------------

-- Keeps the window where it is on screen when its scale changes: positions are kept in
-- the window's own units, which grow and shrink with the scale.
function Spy:SetWindowScale(scale)
	scale = math.max(MIN_SCALE, math.min(MAX_SCALE, tonumber(scale) or 1))
	local window = Spy.MainWindow
	Spy.db.profile.MainWindow.Scale = scale
	if not window or InCombatLockdown() then
		Spy.PendingWindowLook = true
		return
	end
	local old = window:GetScale() or 1
	local left, anchorY = window:GetLeft(), Spy.db.profile.InvertSpy and window:GetBottom() or window:GetTop()
	window:SetScale(scale)
	if left and anchorY and old > 0 then
		local position = Spy.db.profile.MainWindow.Position
		position.x, position.y = left * old / scale, anchorY * old / scale
		Spy:RestoreMainWindowPosition(position.x, position.y, window:GetWidth(), window:GetHeight())
	end
	Spy:RefreshPreview()
end

function Spy:SetWindowWidth(width)
	width = math.floor(math.max(MIN_WIDTH, math.min(MAX_WIDTH, tonumber(width) or 160)) + 0.5)
	local window = Spy.MainWindow
	Spy.db.profile.MainWindow.Position.w = width
	if not window or InCombatLockdown() then
		Spy.PendingWindowLook = true
		return
	end
	local anchorY = Spy.db.profile.InvertSpy and window:GetBottom() or window:GetTop()
	Spy:RestoreMainWindowPosition(window:GetLeft(), anchorY, width, window:GetHeight())
	Spy:ResizeMainWindow()
	Spy:RefreshCurrentList()
	Spy:RefreshPreview()
end

function Spy:ApplyWindowLook()
	Spy.PendingWindowLook = nil
	local window = Spy.MainWindow
	if window and not InCombatLockdown() and window:GetScale() ~= Spy:WindowScale() then
		window:SetScale(Spy:WindowScale())
		local position = Spy.db.profile.MainWindow.Position
		Spy:RestoreMainWindowPosition(position.x, position.y, position.w or window:GetWidth(), window:GetHeight())
	end
end

local baseCreateMainWindow = Spy.CreateMainWindow
function Spy:CreateMainWindow(...)
	baseCreateMainWindow(self, ...)
	Spy:ApplyWindowLook()
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:SetScript("OnEvent", Guard("WindowLook", function()
	if Spy.PendingWindowLook and Spy.db then
		Spy:ApplyWindowLook()
		local window = Spy.MainWindow
		if window and window:GetWidth() ~= Spy.db.profile.MainWindow.Position.w then
			Spy:SetWindowWidth(Spy.db.profile.MainWindow.Position.w)
		end
	end
end))

function Spy:RefreshPreview()
	if Spy.OptionsPreview and Spy.OptionsPreview:IsShown() then
		Spy:DrawPreview(Spy.OptionsPreview)
	end
end

-- Preview -------------------------------------------------------------------------
-- A copy of the window with four sample players, drawn with the same code.

local SAMPLES = {
	{ key = "Vexmira-Dawnsong", class = "ROGUE", offset = 2, kos = true },
	{ key = "Brannoc-Ironhide", class = "WARRIOR", offset = 0, guild = true },
	{ key = "Ilsaveth-Moonveil", class = "MAGE", offset = -1 },
	{ key = "Dorwick-Ashford", class = "PALADIN", offset = -6, inactive = true },
}

function Spy:CreatePreview(parent)
	local preview = CreateFrame("Frame", nil, parent, "BackdropTemplate")
	preview:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 8,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12,
		insets = { left = 2, right = 2, top = 2, bottom = 2 },
	})
	preview:SetBackdropColor(0, 0, 0, 0.85)
	preview.Title = preview:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	preview.Title:SetPoint("TOPLEFT", preview, "TOPLEFT", 8, -7)
	preview.Title:SetText(L["Nearby"])
	preview.Rows = {}
	for i = 1, #SAMPLES do
		local row = CreateFrame("Frame", nil, preview)
		baseSetupBar(Spy, row)
		Spy:SetupRowExtras(row)
		preview.Rows[i] = row
	end
	Spy.OptionsPreview = preview
	preview:SetScript("OnShow", function(self) Spy:DrawPreview(self) end)
	return preview
end

local function sampleLevel(sample)
	local level = math.max(1, (tonumber(Spy:Readable(UnitLevel("player"))) or 60) + sample.offset)
	return level
end

function Spy:DrawPreview(preview)
	local window = profile().MainWindow or {}
	local width = tonumber(window.Position and window.Position.w) or 160
	local rowHeight = tonumber(window.RowHeight) or 14
	local spacing = tonumber(window.RowSpacing) or 0
	local scale = Spy:WindowScale()
	preview:SetScale(scale)
	preview:SetSize(width, 26 + #SAMPLES * (rowHeight + spacing) + 4)
	preview:SetAlpha(tonumber(profile().MainWindow and profile().MainWindow.Alpha) or 1)
	local texture = profile().BarTexture
	local media = LibStub("LibSharedMedia-3.0", true)
	for i, sample in ipairs(SAMPLES) do
		local row = preview.Rows[i]
		row:ClearAllPoints()
		row:SetPoint("TOPLEFT", preview, "TOPLEFT", 2, -24 - (rowHeight + spacing) * (i - 1))
		row:SetSize(width - 4, rowHeight)
		if media and texture then
			row.StatusBar:SetStatusBarTexture(media:Fetch("statusbar", texture))
		end
		local color = profile().Colors and profile().Colors.Class and profile().Colors.Class[sample.class]
		local opacity = sample.inactive and 0.5 or 1
		if color then
			row.StatusBar:SetStatusBarColor(color.r, color.g, color.b, (color.a or 1) * opacity)
		end
		local level = sampleLevel(sample)
		local desc = level .. " " .. (L[sample.class] or sample.class)
		row.RightText:SetText(Spy:ColorLevel(desc, opacity))
		row.LeftText:SetText((sample.key:gsub("%-", " ")))
		local text = profile().Colors and profile().Colors.Bar and profile().Colors.Bar["Bar Text"] or { r = 1, g = 1, b = 1 }
		row.LeftText:SetTextColor(text.r, text.g, text.b, opacity)
		row.RightText:SetTextColor(text.r, text.g, text.b, opacity)
		local marker
		if Spy:DisplayOn("RowMarkers") then
			marker = (sample.kos and "kos") or (sample.guild and "guild") or nil
		end
		Spy:LayoutRow(row, sample.class, marker, opacity)
	end
end

-- Options -------------------------------------------------------------------------

local function toggle(key, order)
	return {
		name = L[key],
		desc = L[key .. "Description"],
		type = "toggle",
		order = order,
		width = "full",
		get = function() return Spy:DisplayOn(key) end,
		set = function(_, value)
			Spy.db.profile[key] = value
			Spy:RefreshCurrentList()
			Spy:RefreshPreview()
		end,
	}
end

Spy.options.args.DisplayOptions.args.Look = {
	name = L["WindowLook"],
	type = "group",
	inline = true,
	order = 1.5,
	args = {
		ClassIcons = toggle("ClassIcons", 1),
		RowMarkers = toggle("RowMarkers", 2),
		LevelColors = toggle("LevelColors", 3),
		WindowScale = {
			name = L["WindowScale"],
			desc = L["WindowScaleDescription"],
			type = "range",
			order = 4,
			min = MIN_SCALE, max = MAX_SCALE, step = 0.05, isPercent = true,
			get = function() return Spy:WindowScale() end,
			set = function(_, value) Spy:SetWindowScale(value) end,
		},
		WindowWidth = {
			name = L["WindowWidth"],
			desc = L["WindowWidthDescription"],
			type = "range",
			order = 5,
			min = MIN_WIDTH, max = MAX_WIDTH, step = 1,
			get = function() return tonumber(Spy.db.profile.MainWindow.Position.w) or 160 end,
			set = function(_, value) Spy:SetWindowWidth(value) end,
		},
	},
}
