local addonName, addon = ...
if not addon.healthCheck then
	return
end
local L = addon.L
local ldbi = LibStub("LibDBIcon-1.0")

local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
addon.settingsCategory = category

-- Keep saved-variable access in addon callbacks across the Settings boundary.
local function RegisterBooleanSetting(variable, key, name, defaultValue)
	return Settings.RegisterProxySetting(
		category,
		variable,
		Settings.VarType.Boolean,
		name,
		defaultValue == true,
		function() return addon.db[key] end,
		function(value) addon.db[key] = value end
	)
end

local function InitializeSettings()
	-- Auto popup setting
	local autoPopupSetting = RegisterBooleanSetting("BUGSACK_AUTO_POPUP", "auto", L["Auto popup"])
	Settings.CreateCheckbox(category, autoPopupSetting, L.autoDesc)

	-- Chatframe output setting
	local chatFrameSetting = RegisterBooleanSetting("BUGSACK_CHATFRAME_OUTPUT", "chatframe", L["Chatframe output"])
	Settings.CreateCheckbox(category, chatFrameSetting, L.chatFrameDesc)

	-- Minimap icon setting
	local function GetMinimapValue()
		return not BugSackLDBIconDB.hide
	end

	local function SetMinimapValue(value)
		BugSackLDBIconDB.hide = not value
		if BugSackLDBIconDB.hide then
			ldbi:Hide(addonName)
		else
			ldbi:Show(addonName)
		end
	end

	local minimapSetting = Settings.RegisterProxySetting(
		category,
		"BUGSACK_MINIMAP_ICON",
		Settings.VarType.Boolean,
		L["Minimap icon"],
		Settings.Default.True,
		GetMinimapValue,
		SetMinimapValue
	)
	Settings.CreateCheckbox(category, minimapSetting, L.minimapDesc)

	-- Addon compartment setting (if available)
	if ldbi:IsButtonCompartmentAvailable() then
		local function GetCompartmentValue()
			return ldbi:IsButtonInCompartment("BugSack")
		end

		local function SetCompartmentValue(value)
			if value then
				ldbi:AddButtonToCompartment("BugSack")
			else
				ldbi:RemoveButtonFromCompartment("BugSack")
			end
		end

		local compartmentSetting = Settings.RegisterProxySetting(
			category,
			"BUGSACK_ADDON_COMPARTMENT",
			Settings.VarType.Boolean,
			L.addonCompartment,
			Settings.Default.False,
			GetCompartmentValue,
			SetCompartmentValue
		)
		Settings.CreateCheckbox(category, compartmentSetting, L.addonCompartment_desc)
	end

	-- Font size setting
	local function GetFontSizeValue()
		local fonts =
			{ "GameFontHighlightSmall", "GameFontHighlight", "GameFontHighlightMedium", "GameFontHighlightLarge" }
		for i, font in next, fonts do
			if font == addon.db.fontSize then
				return i
			end
		end
		return 2 -- Default to Medium
	end

	local function SetFontSizeValue(value)
		local fonts =
			{ "GameFontHighlightSmall", "GameFontHighlight", "GameFontHighlightMedium", "GameFontHighlightLarge" }
		addon.db.fontSize = fonts[value]
		if _G.BugSackScrollText then
			_G.BugSackScrollText:SetFontObject(_G[fonts[value]])
		end
	end

	local function GetFontSizeOptions()
		local container = Settings.CreateControlTextContainer()
		local names = { L["Small"], L["Medium"], L["Large"], L["X-Large"] }
		for i, name in next, names do
			container:Add(i, name)
		end
		return container:GetData()
	end

	local fontSizeSetting = Settings.RegisterProxySetting(
		category,
		"BUGSACK_FONT_SIZE",
		Settings.VarType.Number,
		L["Font size"],
		2,
		GetFontSizeValue,
		SetFontSizeValue
	)
	Settings.CreateDropdown(category, fontSizeSetting, GetFontSizeOptions)

	-- Alt-click wipe setting
	local altWipeSetting = RegisterBooleanSetting("BUGSACK_ALT_WIPE", "altwipe", L["Minimap icon alt-click wipe"])
	Settings.CreateCheckbox(category, altWipeSetting, L.altWipeDesc)

	local wipeButtonInitializer = CreateSettingsButtonInitializer(
		L["Wipe saved bugs"], -- name
		L["Wipe saved bugs"], -- buttonText
		function()
			addon:Reset()
		end, -- buttonClick
		L.wipeDesc, -- tooltip
		true, -- addSearchTags
		nil, -- newTagID
		nil -- gameDataFunc
	)

	local addonLayout = SettingsPanel:GetLayout(category)
	addonLayout:AddInitializer(wipeButtonInitializer)

	Settings.RegisterAddOnCategory(category)
end

addon.InitializeSettings = InitializeSettings
