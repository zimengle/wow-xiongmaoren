local FontStrings={}
local FontFile
local SM = LibStub:GetLibrary("LibSharedMedia-3.0")
local _

SM:Register("font", "Big Noodle Titling", [[Interface\AddOns\Spy\Fonts\BigNoodleTitling.ttf]])
SM:Register("font", "Expressway", [[Interface\AddOns\Spy\Fonts\Expressway.ttf]])
SM:Register("font", "Myriad", [[Interface\AddOns\Spy\Fonts\Myriad.ttf]])

-- Forever: CurseForge report, Russian names drawn as squares. Spy set one font file on
-- its texts, and Friz Quadrata (the default) has no Cyrillic letters outside Russian
-- clients. The game's own fonts are font families that switch file per alphabet;
-- Spy now builds the same kind of family around the font chosen in the options.
local ALPHABET_FILES = {
	{ "korean", [[Fonts\2002.TTF]] },
	{ "simplifiedchinese", [[Fonts\ARKai_T.ttf]] },
	{ "traditionalchinese", [[Fonts\BLEI00D.TTF]] },
	{ "russian", [[Fonts\FRIZQT___CYR.TTF]] },
}
local families, familyCount = {}, 0

local function fontFamily(file, height, flags)
	if not CreateFontFamily then
		return nil
	end
	height = math.floor((tonumber(height) or 12) * 100 + 0.5) / 100
	flags = flags or ""
	local key = file .. "|" .. height .. "|" .. flags
	if families[key] ~= nil then
		return families[key] or nil
	end
	local members = { { alphabet = "roman", file = file, height = height, flags = flags } }
	for _, entry in ipairs(ALPHABET_FILES) do
		members[#members + 1] = { alphabet = entry[1], file = entry[2], height = height, flags = flags }
	end
	familyCount = familyCount + 1
	local ok, font = pcall(CreateFontFamily, "SpyFontFamily" .. familyCount, members)
	families[key] = ok and font or false
	if not ok then
		Spy.FontFamilyError = tostring(font)
	end
	Spy.FontFamilies = familyCount
	return ok and font or nil
end

-- Forever: CurseForge request, "an option to outline names and levels". The texts Spy
-- registers (row names and levels, alert window, titles) get an outline when the
-- Outline text option is on (Display > Window look, off by default).
local registered = {}

local function outlineFlags()
	local profile = Spy.db and Spy.db.profile
	return profile and profile.OutlineText == true and "OUTLINE" or ""
end

-- Sets the font on a text of Spy, keeping its colour.
function Spy:ApplyFont(fontString, file, height, flags)
	if not (fontString and file) then
		return
	end
	if registered[fontString] then
		flags = outlineFlags()
	end
	local family = fontFamily(file, height, flags)
	if family then
		local r, g, b, a = fontString:GetTextColor()
		fontString:SetFontObject(family)
		if r then
			fontString:SetTextColor(r, g, b, a)
		end
		return
	end
	fontString:SetFont(file, height, flags)
end

function Spy:AddFontString(string)
	local Font, Height, Flags

	FontStrings[#FontStrings+1] = string
	registered[string] = true

	if not FontFile and Spy.db.profile.Font then
		FontFile = SM:Fetch("font", Spy.db.profile.Font)
	end

	if FontFile then
		Font, Height, Flags = string:GetFont()
		-- Forever: applied every time, the outline may differ even with the same font.
		Spy:ApplyFont(string, FontFile, Height, Flags)
	end
end

-- Forever: puts the Outline text option on every registered text.
function Spy:RefreshOutline()
	for _, fontString in ipairs(FontStrings) do
		local file, height = fontString:GetFont()
		Spy:ApplyFont(fontString, file, height)
	end
end

function Spy:SetFont(fontname)
	local Height, Flags

	Spy.db.profile.Font = fontname
	FontFile = SM:Fetch("font",fontname)

	for k, v in pairs(FontStrings) do
		k, Height, Flags = v:GetFont()
		Spy:ApplyFont(v, FontFile, Height, Flags)
	end
end