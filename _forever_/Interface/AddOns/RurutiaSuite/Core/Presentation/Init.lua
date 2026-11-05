local _, RS = ...
local Presentation = RS.Presentation

local FONT_THEME_KEYS = {
    "font.body",
    "font.description",
    "font.heading",
    "font.brand",
    "font.title",
    "font.navigation",
}

local BORDER_THEME_KEYS = {
    "color.border",
    "color.border.strong",
    "color.section.border",
    "color.row.border",
}

local function ResolveFamily(options)
    if options.family then
        return options.family
    end
    if RS.Build and RS.Build.GetFamily then
        return RS.Build.GetFamily()
    end
    return "retail"
end

local function BuildAppearancePage(context)
    return Presentation.appearance:BuildPage(context)
end

local function RefreshAppearancePage(context)
    return Presentation.appearance:RefreshPage(context)
end

local function BuildAboutPage(context)
    return Presentation.about:BuildPage(context)
end

local function RefreshAboutPage(context)
    return Presentation.about:RefreshPage(context)
end

local function OnFontChanged(self, _, role)
    if role == "interface" then
        self:_ApplyInterfaceTheme()
    end
    if self.ui then
        self.ui.pages:Refresh("appearance", "font:" .. tostring(role))
    end
end

local function OnDatabaseChanged()
    Presentation:RefreshProfile()
end

local function ClampBorderAlpha(value)
    value = tonumber(value)
    if value == nil then return 0 end
    if value >= 0 and value <= 1 then value = value * 100 end
    value = math.floor(value / 5 + 0.5) * 5
    if value < 0 then return 0 end
    if value > 100 then return 100 end
    return value
end

function Presentation:GetBorderAlpha()
    local profile = self.getProfile and self.getProfile() or (RS.DB and RS.DB.profile)
    local appearance = profile and profile.appearance
    return ClampBorderAlpha(appearance and rawget(appearance, "borderAlpha"))
end

function Presentation:_ApplyBorderTheme()
    local theme = self.ui and self.ui.theme
    if not theme then return false end
    local percent = self:GetBorderAlpha()
    if percent == 100 then
        local changed = false
        local index = 1
        while index <= #BORDER_THEME_KEYS do
            changed = theme:ResetToken(BORDER_THEME_KEYS[index]) or changed
            index = index + 1
        end
        return changed
    end
    local changes = {}
    local index = 1
    while index <= #BORDER_THEME_KEYS do
        changes[BORDER_THEME_KEYS[index]] = { 0, 0, 0, percent / 100 }
        index = index + 1
    end
    return theme:UpdateTokens(changes)
end

function Presentation:SetBorderAlpha(value)
    local profile = self.getProfile and self.getProfile() or (RS.DB and RS.DB.profile)
    local percent = ClampBorderAlpha(value)
    if profile then
        profile.appearance = type(profile.appearance) == "table" and profile.appearance or {}
        if percent == 0 then
            rawset(profile.appearance, "borderAlpha", nil)
        else
            rawset(profile.appearance, "borderAlpha", percent)
        end
    end
    self:_ApplyBorderTheme()
    return percent
end

local function GetAddonVersion()
    local compat = RS.Compat
    local getter = compat and compat.GetAddOnMetadata
    if type(getter) == "function" then
        return getter(RS.addonName or "RurutiaSuite", "Version") or RS.version or "0.0.0"
    end
    return RS.version or "0.0.0"
end

function Presentation:InitializeChangelog()
    if self.changelog then return self.changelog end
    if type(self.Changelog) ~= "table" or type(self.ChangelogData) ~= "table" then
        return nil, "Changelog class or data is unavailable"
    end
    local owner = self
    self.changelog = self.Changelog:New({
        family = self.family,
        dataProvider = self.ChangelogData,
        getVersion = GetAddonVersion,
        getGlobal = function() return RS.DB and RS.DB.global or {} end,
        getClassColor = function()
            return type(RS.GetThemeColorCode) == "function"
                and RS:GetThemeColorCode(true) or "|cFFFFD700"
        end,
        showMain = function(pageId)
            return owner.ui and owner.ui:OpenMain(pageId) or false
        end,
        uiSystem = self.ui,
        runtime = RS.Runtime,
    })
    self.changelogModule = self.changelog:Install()
    RS.Changelog = self.changelog
    function RS:ShowChangelog()
        return Presentation.changelog:Open()
    end
    RS.ShowChangelogWindow = RS.ShowChangelog
    return self.changelog
end

function Presentation:_ApplyInterfaceTheme()
    local theme = self.ui and self.ui.theme
    if not theme then
        return false
    end
    local path = self.font:GetInterfaceFontPath()
    local changes = {}
    local index = 1
    while index <= #FONT_THEME_KEYS do
        local key = FONT_THEME_KEYS[index]
        local current = theme:Get(key) or {}
        changes[key] = {
            path = key == "font.brand" and self.font:GetDefaultFontPath() or path,
            size = current.size,
            flags = current.flags,
        }
        index = index + 1
    end
    return theme:UpdateTokens(changes)
end

function Presentation:RegisterPages(uiSystem)
    if self.pagesRegistered then
        return true
    end
    uiSystem = uiSystem or self.ui
    if not uiSystem then
        return false, "UI system is unavailable"
    end

    if RS.TransferPage then
        uiSystem:RegisterPage("rs-transfer", RS.TransferPage:GetDefinition())
    end
    local appearanceRegistered = uiSystem:RegisterPage("appearance", {
        title = "界面样式",
        description = "配置主界面的背景、透明度与视觉表现。",
        group = "management",
        navigationOrder = 20,
        searchKeywords = { "界面", "外观", "透明度", "边框", "字体" },
        themeKeys = {
            "font.*",
            "color.text.*",
            "color.panel.background",
            "color.control.*",
            "color.border",
            "color.border.strong",
            "color.section.border",
            "color.row.border",
        },
        build = BuildAppearancePage,
        onShow = RefreshAppearancePage,
        onRefresh = RefreshAppearancePage,
    })
    local aboutRegistered = uiSystem:RegisterPage("about", {
        title = "关于",
        description = "查看插件简介、版本信息和更新日志。",
        group = "management",
        navigationOrder = 60,
        searchKeywords = { "关于", "管理工具", "版本", "更新日志", "作者" },
        themeKeys = {
            "font.body",
            "font.heading",
            "color.accent",
            "color.text.*",
            "color.panel.background",
        },
        build = BuildAboutPage,
        onShow = RefreshAboutPage,
        onThemeChanged = RefreshAboutPage,
    })
    if not appearanceRegistered or not aboutRegistered then
        return false, "Presentation page id is already registered"
    end
    self.pagesRegistered = true
    return true
end

function Presentation:Initialize(options)
    if self.initialized then
        return self
    end
    options = options or {}
    local uiSystem = options.uiSystem
    if not uiSystem and RS.UI then
        uiSystem = RS.UI:GetSystem() or RS.UI:Initialize(options.uiOptions)
    end
    if not uiSystem then
        return nil, "RurutiaSuite UI must initialize before Presentation"
    end

    local family = ResolveFamily(options)
    self.ui = uiSystem
    self.family = family
    self.getProfile = options.getProfile
    self.media = self.MediaClass:New({
        provider = options.sharedMediaProvider,
        providerResolver = options.sharedMediaResolver,
        createFrame = options.createFrame or uiSystem.components.createFrame,
        parent = options.parent,
    })
    self.font = self.FontClass:New(self.media, {
        family = family,
        getProfile = options.getProfile,
        systemFontResolver = options.systemFontResolver,
    })
    self.about = self.AboutClass:New(uiSystem.theme, family)
    self.appearance = self.AppearanceClass:New(self.font, {
        print = options.print or RS.Print,
        uiSystem = uiSystem,
        getBorderAlpha = function() return Presentation:GetBorderAlpha() end,
        setBorderAlpha = function(value) return Presentation:SetBorderAlpha(value) end,
    })
    self.font:Subscribe(self, OnFontChanged)

    RS.Media = self.media
    RS.Font = self.font

    self.font:MigrateAppearance()
    self:_ApplyInterfaceTheme()
    self:_ApplyBorderTheme()
    local registered, reason = self:RegisterPages(uiSystem)
    if not registered then
        return nil, reason
    end
    -- Presentation can still be embedded as a standalone UI library in tests;
    -- the packaged addon loads both Changelog files and Runtime before Init.
    if self.Changelog ~= nil or self.ChangelogData ~= nil then
        local changelog, changelogReason = self:InitializeChangelog()
        if not changelog then
            return nil, changelogReason
        end
    end

    if RS.DB and RS.DB.RegisterListener then
        RS.DB:RegisterListener("OnProfileChanged", OnDatabaseChanged)
        RS.DB:RegisterListener("OnProfileCopied", OnDatabaseChanged)
        RS.DB:RegisterListener("OnProfileReset", OnDatabaseChanged)
    end
    self.initialized = true
    return self
end

function Presentation:RefreshProfile()
    if not self.initialized then
        return false
    end
    self.font:Invalidate()
    self.font:MigrateAppearance()
    self:_ApplyInterfaceTheme()
    self:_ApplyBorderTheme()
    self.ui.pages:Refresh("appearance", "profile")
    self.ui:RefreshNavigationSwitches()
    return true
end

function Presentation:RefreshMediaProvider(provider)
    if not self.initialized then
        return false
    end
    self.media:RefreshProvider(provider)
    self.font:Invalidate()
    self.font:MigrateAppearance()
    self:_ApplyInterfaceTheme()
    self.ui.pages:Refresh("appearance", "media")
    return true
end

function Presentation:GetDiagnostics()
    return {
        initialized = self.initialized and true or false,
        family = self.family,
        pagesRegistered = self.pagesRegistered and true or false,
        media = self.media and self.media:GetDiagnostics() or nil,
        font = self.font and self.font:GetDiagnostics() or nil,
        appearance = self.appearance and self.appearance:GetDiagnostics() or nil,
        about = self.about and self.about:GetDiagnostics() or nil,
        changelog = self.changelog and self.changelog:GetDiagnostics() or nil,
    }
end
