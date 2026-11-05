local _, RS = ...
local UI = RS.UI

local Theme = {}
Theme.__index = Theme

local DEFAULT_TOKENS = {
    ["color.window.background"] = { 0.035, 0.032, 0.043, 0.98 },
    ["color.panel.background"] = { 0.05, 0.046, 0.06, 0.97 },
    ["color.changelog.background"] = { 0.035, 0.032, 0.043, 0.50 },
    ["color.changelog.contentBackground"] = { 0.05, 0.046, 0.06, 0 },
    ["color.popover.background"] = { 0.075, 0.07, 0.085, 0.995 },
    ["color.sidebar.background"] = { 0.028, 0.026, 0.034, 0 },
    ["color.workspace.background"] = { 0.047, 0.043, 0.055, 0 },
    ["color.section.background"] = { 0.085, 0.077, 0.095, 0 },
    ["color.row.background"] = { 0.055, 0.051, 0.064, 0 },
    ["color.row.hover"] = { 0.085, 0.077, 0.095, 0.94 },
    ["color.control.background"] = { 0.075, 0.068, 0.083, 1 },
    ["color.control.hover"] = { 0.13, 0.115, 0.14, 1 },
    ["color.dropdown.selectedText"] = { 0.5, 0.8, 1, 1 },
    ["color.control.disabled"] = { 0.08, 0.08, 0.09, 0.65 },
    ["color.button.background"] = { 0.30, 0.30, 0.30, 0.35 },
    ["color.button.hover"] = { 0.40, 0.40, 0.40, 0.40 },
    ["color.button.pressed"] = { 0.20, 0.20, 0.20, 0.50 },
    ["color.button.disabled"] = { 0.20, 0.20, 0.20, 0.20 },
    ["color.button.border"] = { 0, 0, 0, 1 },
    ["color.input.background"] = { 0.30, 0.30, 0.30, 0.35 },
    ["color.input.hover"] = { 0.40, 0.40, 0.40, 0.40 },
    ["color.input.border"] = { 0, 0, 0, 1 },
    ["color.navigation.background"] = { 0.02, 0.018, 0.026, 0 },
    ["color.navigation.hover"] = { 0.14, 0.125, 0.15, 0.5 },
    ["color.navigation.selected"] = { 0, 1, 0, 0.78 },
    ["color.tab.background"] = { 0, 0, 0, 0 },
    ["color.tab.hover"] = { 0.14, 0.125, 0.15, 0.18 },
    ["color.tab.selected"] = { 0.14, 0.125, 0.15, 0.10 },
    ["color.border"] = { 0, 0, 0, 1 },
    ["color.border.strong"] = { 0, 0, 0, 1 },
    ["color.popover.border"] = { 0.30, 0.29, 0.33, 0.95 },
    ["color.section.border"] = { 0, 0, 0, 1 },
    ["color.row.border"] = { 0, 0, 0, 1 },
    ["color.transparent"] = { 0, 0, 0, 0 },
    ["color.accent"] = { 0, 1, 0, 1 },
    ["color.accent.control"] = { 0, 1, 0, 0.75 },
    ["color.accent.soft"] = { 0, 1, 0, 0.30 },
    ["color.moduleSwitch.pending"] = { 0.95, 0.72, 0.29, 1 },
    ["color.switch.knob"] = { 1, 1, 1, 1 },
    ["color.switch.knobOff"] = { 1, 1, 1, 0.5 },
    ["color.switch.off"] = { 0.267, 0.267, 0.267, 0.65 },
    ["color.slider.track"] = { 0.34, 0.36, 0.34, 0.95 },
    ["color.scroll.track"] = { 0.16, 0.14, 0.17, 0.42 },
    ["color.scroll.thumb"] = { 0.42, 0.37, 0.43, 0.95 },
    ["color.text.disabled"] = { 0.45, 0.45, 0.45, 1 },
    ["color.dialog.background"] = { 0.055, 0.045, 0.065, 0.98 },
    ["color.text.normal"] = { 0.97, 0.956, 0.965, 1 },
    ["color.text.success"] = { 0, 1, 0, 1 },
    ["color.text.muted"] = { 0.67, 0.64, 0.68, 1 },
    ["color.text.faint"] = { 0.46, 0.43, 0.47, 1 },
    ["layout.padding"] = 8,
    ["layout.spacing"] = 6,
    ["layout.rowHeight"] = 32,
    ["layout.toggleHeight"] = 28,
    ["layout.rowGap"] = 6,
    ["layout.sectionGap"] = 14,
    ["layout.toolbarGap"] = 12,
    ["layout.settingsButtonHeight"] = 32,
    ["layout.settingsButtonWidth"] = 150,
    ["layout.settingsIconSize"] = 18,
    ["layout.shellButtonWidth"] = 89,
    ["layout.shellButtonHeight"] = 31,
    ["font.body"] = { size = 17, flags = "OUTLINE" },
    ["font.description"] = { size = 17, flags = "OUTLINE" },
    ["font.pageDescription"] = { size = 15, flags = "OUTLINE" },
    ["font.heading"] = { size = 19, flags = "OUTLINE" },
    ["font.brand"] = { size = 22, flags = "OUTLINE" },
    ["font.title"] = { size = 28, flags = "OUTLINE" },
    ["font.navigation"] = { size = 17, flags = "OUTLINE" },
}

local function ResolveClassColor()
    local class
    if type(_G.UnitClass) == "function" then _, class = _G.UnitClass("player") end
    local colors = _G.CUSTOM_CLASS_COLORS or _G.RAID_CLASS_COLORS
    local color = colors and class and colors[class]
    if color then
        local r, g, b = color.r or 0, color.g or 1, color.b or 0
        return r, g, b
    end
    return 0, 1, 0
end

local function CountKeys(source)
    local count = 0
    for _ in pairs(source) do
        count = count + 1
    end
    return count
end

local function SafeOwnerLabel(owner)
    local ownerType = type(owner)
    if ownerType == "table" then
        local candidate = rawget(owner, "diagnosticName")
            or rawget(owner, "name") or rawget(owner, "id")
        if type(candidate) == "string" then owner = candidate else return ownerType end
    elseif ownerType ~= "string" then
        return ownerType
    end
    local label = string.gsub(owner, "[^%w%._:%-]", "_")
    if label == "" then label = "string" end
    return string.sub(label, 1, 64)
end

local function RecordCallbackError(self, owner, stage)
    self.errorCount = self.errorCount + 1
    self.lastErrorOwner = SafeOwnerLabel(owner)
    self.lastErrorStage = stage
end

local function DefaultFontResolver(_, token)
    local path = token and token.path
    if not path then
        path = STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
    end
    return path, (token and token.size) or 12, (token and token.flags) or ""
end

local function NotifyListeners(self, changed, stage)
    local listeners = self.listeners
    local count = #listeners
    local index = 1
    while index <= count do
        local entry = listeners[index]
        local ok = pcall(entry.callback, entry.owner, self, changed, self.generation)
        if not ok then
            RecordCallbackError(self, entry.owner, stage)
        end
        index = index + 1
    end
end

function Theme:New(options)
    options = options or {}

    local instance = setmetatable({}, self)
    instance.defaults = DEFAULT_TOKENS
    instance.baseTokens = options.defaults
    instance.overrides = {}
    instance.tokenCache = {}
    instance.fontCache = {}
    instance.fontResolver = options.fontResolver or DefaultFontResolver
    instance.listeners = {}
    instance.listenerIndex = {}
    instance.generation = 1
    instance.resolveCount = 0
    instance.fontResolveCount = 0
    instance.errorCount = 0
    instance.lastErrorOwner = nil
    instance.lastErrorStage = nil
    local r, g, b = ResolveClassColor()
    instance.classAccent = { r, g, b, 1 }
    instance.classControlAccent = { r, g, b, 0.75 }
    instance.classAccentSoft = { r, g, b, 0.30 }
    instance.classNavigation = { r, g, b, 0.22 }
    instance.classNavigationHover = { r, g, b, 0.34 }
    instance.classTabSelected = { r, g, b, 0.10 }
    instance.classTabHover = { r, g, b, 0.18 }
    return instance
end

function Theme:Get(key)
    local cached = self.tokenCache[key]
    if cached ~= nil then
        return cached
    end

    local value = self.overrides[key]
    if value == nil and self.baseTokens then
        value = self.baseTokens[key]
    end
    if value == nil and key == "color.accent" then
        value = self.classAccent
    elseif value == nil and key == "color.accent.control" then
        value = self.classControlAccent
    elseif value == nil and key == "color.accent.soft" then
        value = self.classAccentSoft
    elseif value == nil and key == "color.dropdown.hover" then
        value = self.classAccentSoft
    elseif value == nil and key == "color.dropdown.hoverText" then
        value = self.classAccent
    elseif value == nil and key == "color.navigation.selected" then
        value = self.classNavigation
    elseif value == nil and key == "color.navigation.hover" then
        value = self.classNavigationHover
    elseif value == nil and key == "color.tab.selected" then
        value = self.classTabSelected
    elseif value == nil and key == "color.tab.hover" then
        value = self.classTabHover
    end
    if value == nil then
        value = self.defaults[key]
    end

    if value ~= nil then
        self.tokenCache[key] = value
    end
    self.resolveCount = self.resolveCount + 1
    return value
end

function Theme:GetGeneration()
    return self.generation
end

function Theme:UpdateTokens(changes)
    if type(changes) ~= "table" then
        return false
    end

    local changed = {}
    local hasChanges = false
    for key, value in pairs(changes) do
        if type(key) == "string" and self:Get(key) ~= value then
            self.overrides[key] = value
            self.tokenCache[key] = nil
            changed[key] = true
            hasChanges = true

            local fontKey = string.match(key, "^font%.(.+)$")
            if fontKey then
                self.fontCache[fontKey] = nil
            end
        end
    end

    if not hasChanges then
        return false
    end

    self.generation = self.generation + 1
    NotifyListeners(self, changed, "update-tokens")
    return true
end

function Theme:ResetToken(key)
    if self.overrides[key] == nil then
        return false
    end

    self.overrides[key] = nil
    self.tokenCache[key] = nil
    local fontKey = string.match(key, "^font%.(.+)$")
    if fontKey then
        self.fontCache[fontKey] = nil
    end

    self.generation = self.generation + 1
    NotifyListeners(self, { [key] = true }, "reset-token")
    return true
end

function Theme:SetFontResolver(resolver)
    if type(resolver) ~= "function" then
        return false
    end
    if self.fontResolver == resolver then
        return true
    end

    self.fontResolver = resolver
    self.fontCache = {}
    self.generation = self.generation + 1
    NotifyListeners(self, { ["font.*"] = true }, "font-resolver")
    return true
end

function Theme:ResolveFont(fontKey)
    local cached = self.fontCache[fontKey]
    if cached then
        return cached[1], cached[2], cached[3]
    end

    local token = self:Get("font." .. fontKey)
    local path, size, flags = self.fontResolver(fontKey, token)
    cached = { path, size, flags }
    self.fontCache[fontKey] = cached
    self.fontResolveCount = self.fontResolveCount + 1
    return path, size, flags
end

function Theme:Subscribe(owner, callback)
    if owner == nil or type(callback) ~= "function" then
        return false
    end

    local existing = self.listenerIndex[owner]
    if existing then
        self.listeners[existing].callback = callback
        return true
    end

    local index = #self.listeners + 1
    self.listeners[index] = { owner = owner, callback = callback }
    self.listenerIndex[owner] = index
    return true
end

function Theme:Unsubscribe(owner)
    local index = self.listenerIndex[owner]
    if not index then
        return false
    end

    local listeners = self.listeners
    local lastIndex = #listeners
    local last = listeners[lastIndex]
    listeners[index] = last
    listeners[lastIndex] = nil
    self.listenerIndex[owner] = nil
    if index ~= lastIndex then
        self.listenerIndex[last.owner] = index
    end
    return true
end

function Theme:GetDiagnostics()
    return {
        generation = self.generation,
        tokenResolves = self.resolveCount,
        fontResolves = self.fontResolveCount,
        cachedTokens = CountKeys(self.tokenCache),
        cachedFonts = CountKeys(self.fontCache),
        listeners = #self.listeners,
        errorCount = self.errorCount,
        lastErrorOwner = self.lastErrorOwner,
        lastErrorStage = self.lastErrorStage,
    }
end

UI.Theme = Theme
