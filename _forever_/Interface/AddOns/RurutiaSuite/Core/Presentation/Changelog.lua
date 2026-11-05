local _, RS = ...

-- The source IDs deliberately pin the two repositories used to characterize
-- this presentation.  Build assembly supplies the corresponding pure data.
local SOURCE_IDS = {
    retail = "retail:b109960e82a2b3db460e2ae597ea8870276d1479:RurutiaSuite/Changelog.md",
    classic = "classic:903bff1bbdc3e0829afe990a59b7493aa1c3104d:RurutiaSuite/Core/Changelog.lua",
}

local Changelog = {}
Changelog.__index = Changelog

local function ResolveWindowSize(desiredWidth, desiredHeight)
    local parentWidth = UIParent and UIParent.GetWidth and tonumber(UIParent:GetWidth()) or nil
    local parentHeight = UIParent and UIParent.GetHeight and tonumber(UIParent:GetHeight()) or nil
    local scale = 1
    if parentWidth and parentWidth > 60 then
        scale = math.min(scale, (parentWidth - 60) / desiredWidth)
    end
    if parentHeight and parentHeight > 60 then
        scale = math.min(scale, (parentHeight - 60) / desiredHeight)
    end
    scale = math.max(0.5, math.min(1, scale))
    return math.floor(desiredWidth * scale + 0.5), math.floor(desiredHeight * scale + 0.5)
end

local function GetBuildData(provider, family)
    if type(provider) == "function" then
        return provider(family)
    end
    if type(provider) == "table" then
        return provider[family]
    end
    return nil
end

local function GetText(entry, classColor)
    if type(entry) ~= "table" then
        return "未找到更新日志数据。"
    end
    local value = entry.content
    if type(value) == "function" then
        value = value(classColor)
    end
    value = tostring(value or "")
    return (value:gsub("%%s", classColor or "|cFFFFD700"))
end

local function GetNotice(data)
    local entry = type(data) == "table" and data.latest or nil
    local viewId = type(data) == "table" and data.viewId or nil
    local noticeKey = type(entry) == "table" and entry.noticeKey or nil
    local scoped = viewId ~= nil or noticeKey ~= nil
    if type(viewId) == "string" and viewId ~= ""
        and type(noticeKey) == "string" and noticeKey ~= "" then
        return viewId, noticeKey, true
    end
    -- An empty or unknown scoped view must not fall back to another client
    -- or to package-version notifications. Old providers remain compatible.
    return nil, nil, scoped
end

local function MarkSeen(global, currentVersion, viewId, noticeKey)
    global.lastSeenVersion = currentVersion
    if viewId and noticeKey then
        if type(global.lastSeenChangelogViews) ~= "table" then
            global.lastSeenChangelogViews = {}
        end
        -- One latest key per build-owned view; no per-version history grows.
        global.lastSeenChangelogViews[viewId] = noticeKey
    end
end

function Changelog:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.family = options.family or "retail"
    instance.dataProvider = options.dataProvider
    instance.getVersion = options.getVersion or function() return "0.0.0" end
    instance.getGlobal = options.getGlobal or function() return {} end
    instance.getClassColor = options.getClassColor or function() return "|cFFFFD700" end
    instance.showMain = options.showMain
    instance.uiSystem = options.uiSystem
    instance.runtime = options.runtime
    instance.moduleName = options.moduleName or "Changelog"
    instance.window = nil
    instance.title = nil
    instance.scroll = nil
    instance.body = nil
    instance.closeButton = nil
    instance.openMainButton = nil
    instance.timer = nil
    instance.module = nil
    instance.opens = 0
    instance.closes = 0
    return instance
end

function Changelog:GetSourceId()
    local data = GetBuildData(self.dataProvider, self.family)
    if type(data) == "table" and type(data.sourceId) == "string" and data.sourceId ~= "" then
        return data.sourceId
    end
    return SOURCE_IDS[self.family]
end

function Changelog:GetEntry()
    local data = GetBuildData(self.dataProvider, self.family)
    return data and data.latest or nil
end

function Changelog:RenderText(currentVersion)
    local data = GetBuildData(self.dataProvider, self.family)
    local entry = data and data.latest or nil
    local body = GetText(entry, self.getClassColor())
    -- The build-owned provider carries this legacy rendering difference:
    -- Classic warned when Version advanced before its text data was updated.
    if data and data.showMissingVersionWarning and entry and entry.version ~= currentVersion then
        body = string.format("%sv%s|r\n待补充。\n\n", self.getClassColor(), currentVersion) .. body
    end
    return body
end

function Changelog:_EnsureWindow()
    if self.window then
        return self.window
    end
    local components = self.uiSystem and self.uiSystem.components
    if type(components) ~= "table" then
        return nil, "RS.UI system is required"
    end

    -- Keep the changelog at the familiar legacy RS footprint.  The resolver
    -- still scales it down on unusually small screens so the close controls
    -- cannot be pushed off-screen.
    local width, height = ResolveWindowSize(600, 650)
    local contentWidth = math.max(1, width - 80)
    self.bodyWidth = contentWidth
    self.window = assert(components:Create("frame", UIParent, {
        name = "RurutiaSuiteChangelogWindow",
        width = width,
        height = height,
        point = "CENTER",
        relativeTo = UIParent,
        relativePoint = "CENTER",
        hidden = true,
        backgroundToken = "color.changelog.background",
        borderToken = "color.border.strong",
        frameStrata = "FULLSCREEN_DIALOG",
        frameLevel = 110,
        clipChildren = true,
        movable = true,
        clampedToScreen = true,
    }))
    self.title = assert(components:Create("label", self.window, {
        text = "露露的工具箱 更新日志",
        fontKey = "brand",
        width = width - 48,
        height = 36,
        labelFill = true,
        justifyH = "CENTER",
        justifyV = "MIDDLE",
    }))
    self.title.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", 24, -18)
    self.title.frame:SetPoint("TOPRIGHT", self.window.frame, "TOPRIGHT", -24, -18)

    -- UIPanelScrollFrameTemplate is not a reliable backdrop owner on every
    -- client.  Keep the readable surface on an explicit BackdropTemplate
    -- child and let the ScrollFrame handle scrolling only.
    self.contentBackdrop = assert(components:Create("frame", self.window, {
        backgroundToken = "color.changelog.contentBackground",
        borderToken = "color.border.strong",
        frameLevel = 111,
    }))
    self.contentBackdrop.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", 24, -62)
    self.contentBackdrop.frame:SetPoint("BOTTOMRIGHT", self.window.frame, "BOTTOMRIGHT", -24, 68)

    self.scroll = assert(components:Create("scroll", self.window, {
        width = width - 48,
        height = height - 130,
        contentWidth = contentWidth,
        contentHeight = 1,
        backgroundToken = "color.transparent",
        borderToken = "color.transparent",
        noBorder = true,
        frameLevel = 112,
    }))
    self.scroll.frame:SetPoint("TOPLEFT", self.window.frame, "TOPLEFT", 24, -62)
    self.scroll.frame:SetPoint("BOTTOMRIGHT", self.window.frame, "BOTTOMRIGHT", -24, 68)

    self.body = assert(components:Create("label", self.scroll:GetContent(), {
        text = "",
        fontKey = "body",
        fontFlags = "",
        width = contentWidth,
        height = 1,
        labelFill = true,
        justifyH = "LEFT",
        justifyV = "TOP",
        wordWrap = true,
        nonSpaceWrap = true,
        textInsets = { 4, 4, 4, 4 },
        autoHeight = true,
        minHeight = 1,
        heightPadding = 8,
    }))
    self.body.frame:SetPoint("TOPLEFT", self.scroll:GetContent(), "TOPLEFT", 0, 0)
    self.body.frame:SetPoint("TOPRIGHT", self.scroll:GetContent(), "TOPRIGHT", 0, 0)
    -- Use light text with a small shadow over the player's chosen backdrop.
    -- Keep this treatment local to the changelog, including its line spacing.
    if self.body.label.SetSpacing then self.body.label:SetSpacing(3) end
    if self.body.label.SetShadowColor then self.body.label:SetShadowColor(0, 0, 0, 1) end
    if self.body.label.SetShadowOffset then self.body.label:SetShadowOffset(1, -1) end

    local buttonWidth = (width - 56) / 2
    self.openMainButton = assert(components:Create("button", self.window, {
        text = "打开主界面",
        width = buttonWidth,
        height = 36,
        onAction = function()
            self:Close()
            if self.showMain then self.showMain() end
        end,
    }))
    self.openMainButton.frame:SetPoint("BOTTOMLEFT", self.window.frame, "BOTTOMLEFT", 24, 18)
    self.closeButton = assert(components:Create("button", self.window, {
        text = "关闭",
        width = buttonWidth,
        height = 36,
        onAction = function() self:Close() end,
    }))
    self.closeButton.frame:SetPoint("BOTTOMRIGHT", self.window.frame, "BOTTOMRIGHT", -24, 18)
    return self.window
end

function Changelog:Open()
    local currentVersion = self.getVersion()
    local window, reason = self:_EnsureWindow()
    if not window then return false, reason end
    if self.uiSystem and type(self.uiSystem.CloseMain) == "function" then
        self.uiSystem:CloseMain()
    end
    -- MainWindow owns the saved transparency settings.  Refresh the two
    -- changelog surfaces on every open so a reused window follows the latest
    -- main-window and container opacity without coupling presentation code to
    -- the profile shape.
    window:RefreshTheme()
    self.contentBackdrop:RefreshTheme()
    self.title:SetText(string.format("%s露露的工具箱 更新日志|r", self.getClassColor()))
    self.body:SetText(self:RenderText(currentVersion))
    local bodyHeight = self.body:FitTextHeight(1, 8) or 1
    self.scroll:SetContentSize(self.bodyWidth or 1, bodyHeight)
    window:SetVisible(true)
    self.opens = self.opens + 1
    return true
end

function Changelog:Close()
    if not self.window or not self.window:IsVisible() then return false end
    local viewId, noticeKey = GetNotice(GetBuildData(self.dataProvider, self.family))
    MarkSeen(self.getGlobal(), self.getVersion(), viewId, noticeKey)
    self.window:SetVisible(false)
    self.closes = self.closes + 1
    return true
end

function Changelog:CheckVersionUpdate(module)
    local data = GetBuildData(self.dataProvider, self.family)
    -- Unknown builds have no provider record. Do not mistake missing data
    -- for a legacy provider and schedule an empty package-version popup.
    if type(data) ~= "table" then return false end
    local global = self.getGlobal()
    local currentVersion = self.getVersion()
    local viewId, noticeKey, scoped = GetNotice(data)
    if scoped then
        if not noticeKey then return false end
        local seen = global.lastSeenChangelogViews
        if type(seen) == "table" and seen[viewId] == noticeKey then return false end
        -- The old package-version stamp cannot prove this view was read.
        -- First migration therefore offers its current visible notes once.
    elseif currentVersion == (global.lastSeenVersion or "0.0.0") then
        return false
    end
    -- Keep the legacy immediate write: /reload before the delayed show must
    -- not schedule a second popup.  The timer itself is runtime-owned.
    MarkSeen(global, currentVersion, viewId, noticeKey)
    self.timer = module:Schedule(3, function()
        self.timer = nil
        self:Open()
    end, "changelog-login-show")
    return true
end

function Changelog:Install()
    if self.module then return self.module end
    assert(self.runtime, "Changelog requires RS.Runtime")
    local owner = self
    local definition = {
        defaultEnabled = true,
        Enable = function(module) owner:CheckVersionUpdate(module) end,
        Disable = function()
            owner.timer = nil
            owner:Close()
        end,
    }
    -- Production registers through Assembly so profile refresh/shutdown keep
    -- the lifecycle coherent.  The direct Runtime fallback keeps the class
    -- independently testable without loading the whole addon bootstrap.
    if type(RS.RegisterModule) == "function" and RS.Build
        and RS.Build.HasModule and RS.Build.HasModule(self.moduleName) then
        local module, reason = RS.RegisterModule(self.moduleName, definition)
        if not module then error("Unable to register Changelog: " .. tostring(reason), 2) end
        self.module = module
    else
        self.module = self.runtime:RegisterModule(self.moduleName, definition)
    end
    return self.module
end

function Changelog:GetDiagnostics()
    return {
        sourceId = self:GetSourceId(),
        windowBuilt = self.window ~= nil,
        contentBackdropBuilt = self.contentBackdrop ~= nil,
        scrollBuilt = self.scroll ~= nil,
        bodyHeight = self.body and self.body.frame:GetHeight() or 0,
        windowOpen = self.window and self.window:IsVisible() or false,
        timerPending = self.timer ~= nil,
        opens = self.opens,
        closes = self.closes,
    }
end

RS.Presentation = RS.Presentation or {}
RS.Presentation.Changelog = Changelog
RS.Presentation.ChangelogSourceIds = SOURCE_IDS
