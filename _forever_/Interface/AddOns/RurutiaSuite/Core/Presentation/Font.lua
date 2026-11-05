local _, RS = ...
local Presentation = RS.Presentation

local Font = {}
Font.__index = Font

local SYSTEM_FONT_NAME = "默认"
local RS_FONT_NAME = "RS Rurutia"
local LEGACY_SYSTEM_FONT_NAME = "系统默认字体"
local LEGACY_RS_FONT_NAME = "RS 默认字体"
local SYSTEM_FONT_FALLBACK = "Fonts\\ARKai_T.ttf"

local ROLE_SPECS = {
    interface = { key = "interfaceFont", default = SYSTEM_FONT_NAME },
    chatBar = { key = "chatBarFont", default = SYSTEM_FONT_NAME },
    tooltip = { key = "tooltipFont", default = SYSTEM_FONT_NAME },
    time = { key = "timeFont", default = RS_FONT_NAME },
    combatTimer = { key = "combatTimerFont", default = RS_FONT_NAME },
    experienceBar = { key = "experienceBarFont", default = RS_FONT_NAME },
    consumableBar = { key = "consumableBarFont", default = RS_FONT_NAME },
    celestialBar = { key = "celestialBarFont", default = RS_FONT_NAME },
    magePortal = { key = "magePortalFont", default = RS_FONT_NAME },
    rangeMonitor = { key = "rangeMonitorFont", default = RS_FONT_NAME },
    nameplateTarget = { key = "nameplateTargetFont", default = SYSTEM_FONT_NAME },
}

local RETAIL_APPEARANCE_ROLES = {
    { role = "interface", label = "界面字体" },
    { role = "chatBar", label = "聊天条字体" },
    { role = "tooltip", label = "鼠标提示字体" },
    { role = "combatTimer", label = "战斗时间字体" },
    { role = "experienceBar", label = "经验条字体" },
    { role = "time", label = "微型菜单时间字体" },
}

local CLASSIC_APPEARANCE_ROLES = {
    { role = "interface", label = "界面字体" },
    { role = "chatBar", label = "聊天条字体" },
    { role = "tooltip", label = "鼠标提示字体" },
    { role = "time", label = "时间字体" },
    { role = "experienceBar", label = "经验条字体" },
    { role = "consumableBar", label = "消耗品字体" },
    { role = "celestialBar", label = "天神条字体" },
    { role = "magePortal", label = "法师动作条字体" },
}

local function ClearTable(target)
    for key in pairs(target) do
        target[key] = nil
    end
end

local function DefaultProfileResolver()
    return RS.DB and RS.DB.profile or nil
end

local function DefaultSystemFontResolver()
    local gameFont = _G.GameFontNormal
    if gameFont and type(gameFont.GetFont) == "function" then
        local path = gameFont:GetFont()
        if type(path) == "string" and path ~= "" then
            return path
        end
    end
    return SYSTEM_FONT_FALLBACK
end

local function Notify(self, role, name, path)
    local listeners = self.listeners
    local index = 1
    while index <= #listeners do
        local entry = listeners[index]
        entry.callback(entry.owner, self, role, name, path)
        index = index + 1
    end
end

function Font:New(media, options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.media = media
    instance.family = options.family or "retail"
    instance.getProfile = options.getProfile or DefaultProfileResolver
    instance.systemFontResolver = options.systemFontResolver or DefaultSystemFontResolver
    instance.nameCache = {}
    instance.pathCache = {}
    instance.systemPath = nil
    instance.choices = nil
    instance.choiceOrder = nil
    instance.migratedProfile = nil
    instance.listeners = {}
    instance.listenerIndex = {}
    instance.resolveCount = 0
    instance.migrationCount = 0
    return instance
end

function Font:GetAppearance()
    local profile = self.getProfile()
    if type(profile) ~= "table" then
        return nil
    end
    if type(profile.appearance) ~= "table" then
        profile.appearance = {}
    end
    return profile.appearance, profile
end

local function NormalizeLegacyName(name)
    if name == LEGACY_SYSTEM_FONT_NAME then
        return SYSTEM_FONT_NAME
    end
    if name == LEGACY_RS_FONT_NAME then
        return RS_FONT_NAME
    end
    return name
end

function Font:MigrateAppearance()
    local appearance, profile = self:GetAppearance()
    if not appearance or self.migratedProfile == profile then
        return appearance
    end

    local legacyFont = appearance.font
    if legacyFont ~= nil then
        if appearance.interfaceFont == nil then
            appearance.interfaceFont = legacyFont
        end
        if self.family == "classic" and appearance.timeFont == nil then
            appearance.timeFont = legacyFont
        end
        appearance.font = nil
    end

    for _, spec in pairs(ROLE_SPECS) do
        if appearance[spec.key] ~= nil then
            appearance[spec.key] = NormalizeLegacyName(appearance[spec.key])
        end
    end
    self.migratedProfile = profile
    self.migrationCount = self.migrationCount + 1
    return appearance
end

function Font:IsAvailable(name)
    if name == SYSTEM_FONT_NAME or name == RS_FONT_NAME then
        return true
    end
    return self.media:FetchFont(name) ~= nil
end

function Font:GetName(role)
    local spec = ROLE_SPECS[role]
    if not spec then
        return nil
    end
    local cached = self.nameCache[role]
    if cached then
        return cached
    end

    local appearance = self:MigrateAppearance()
    local savedName = appearance and appearance[spec.key]
    local name = savedName or spec.default
    if not self:IsAvailable(name) then
        if appearance then
            appearance[spec.key] = nil
        end
        name = spec.default
    end
    self.nameCache[role] = name
    return name
end

function Font:GetSystemFontPath()
    if self.systemPath then
        return self.systemPath
    end
    local path = self.media:FetchFont(SYSTEM_FONT_NAME) or self.systemFontResolver()
    if type(path) ~= "string" or path == "" then
        path = SYSTEM_FONT_FALLBACK
    end
    self.systemPath = path
    return self.systemPath
end

function Font:ResolvePath(name)
    if name == SYSTEM_FONT_NAME then
        return self:GetSystemFontPath()
    end
    if name == RS_FONT_NAME then
        return self.media:GetRurutiaFontPath()
    end
    return self.media:FetchFont(name)
end

function Font:GetPath(role)
    local cached = self.pathCache[role]
    if cached then
        return cached
    end
    local spec = ROLE_SPECS[role]
    if not spec then
        return nil
    end

    local name = self:GetName(role)
    local path = self:ResolvePath(name)
    if not path then
        path = spec.default == SYSTEM_FONT_NAME and self:GetSystemFontPath() or self.media:GetRurutiaFontPath()
    end
    self.pathCache[role] = path
    self.resolveCount = self.resolveCount + 1
    return path
end

function Font:Set(role, name)
    local spec = ROLE_SPECS[role]
    local appearance = self:MigrateAppearance()
    if not spec or not appearance then
        return false
    end

    local previousName = self:GetName(role)
    local accepted = true
    name = NormalizeLegacyName(name)
    if name == nil or name == spec.default then
        appearance[spec.key] = nil
    elseif self:IsAvailable(name) then
        appearance[spec.key] = name
    else
        appearance[spec.key] = nil
        accepted = false
    end

    self.nameCache[role] = nil
    self.pathCache[role] = nil
    local currentName = self:GetName(role)
    local currentPath = self:GetPath(role)
    if previousName ~= currentName or not accepted then
        Notify(self, role, currentName, currentPath)
    end
    return accepted
end

function Font:GetFontChoices()
    if self.choices then
        return self.choices, self.choiceOrder
    end

    local choices = {
        [SYSTEM_FONT_NAME] = SYSTEM_FONT_NAME,
        [RS_FONT_NAME] = RS_FONT_NAME,
    }
    local order = { SYSTEM_FONT_NAME, RS_FONT_NAME }
    local names = self.media:GetFontNames()
    local index = 1
    while index <= #names do
        local name = names[index]
        if name ~= SYSTEM_FONT_NAME and name ~= RS_FONT_NAME then
            choices[name] = name
            order[#order + 1] = name
        end
        index = index + 1
    end
    self.choices = choices
    self.choiceOrder = order
    return choices, order
end

function Font:GetAppearanceRoleDefinitions()
    if self.family == "classic" then
        if RS.Build and RS.Build.HasModule and RS.Build.HasModule("RangeMonitor") then
            if not self.targetDisplayRoles then
                local roles = {}
                for i, entry in ipairs(CLASSIC_APPEARANCE_ROLES) do roles[i] = entry end
                roles[#roles + 1] = { role = "rangeMonitor", label = "距离监控字体" }
                roles[#roles + 1] = { role = "nameplateTarget", label = "姓名板目标字体" }
                self.targetDisplayRoles = roles
            end
            return self.targetDisplayRoles
        end
        return CLASSIC_APPEARANCE_ROLES
    end
    return RETAIL_APPEARANCE_ROLES
end

function Font:Invalidate()
    ClearTable(self.nameCache)
    ClearTable(self.pathCache)
    self.systemPath = nil
    self.choices = nil
    self.choiceOrder = nil
    self.migratedProfile = nil
end

function Font:Subscribe(owner, callback)
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

function Font:Unsubscribe(owner)
    local index = self.listenerIndex[owner]
    if not index then
        return false
    end
    local lastIndex = #self.listeners
    local last = self.listeners[lastIndex]
    self.listeners[index] = last
    self.listeners[lastIndex] = nil
    self.listenerIndex[owner] = nil
    if index ~= lastIndex then
        self.listenerIndex[last.owner] = index
    end
    return true
end

function Font:ApplyFontString(fontString, fontPath, fontSize, fontFlags, fallbackPath)
    if not (fontString and fontString.GetFont and fontString.SetFont) then
        return false
    end
    local _, currentSize, currentFlags = fontString:GetFont()
    local size = tonumber(fontSize) or tonumber(currentSize)
    local flags = fontFlags or currentFlags or ""
    if not size then
        return false
    end

    local path = fontPath or fallbackPath or self:GetSystemFontPath()
    local ok, applied = pcall(fontString.SetFont, fontString, path, size, flags)
    if ok and applied ~= false then
        return true
    end
    pcall(fontString.SetFont, fontString, fallbackPath or self:GetSystemFontPath(), size, flags)
    return false
end

function Font:ApplyFontToFrame(frame)
    if not frame then
        return false
    end
    local path = self:GetPath("interface")
    local fallback = self:GetSystemFontPath()
    local visited = {}

    local function Apply(widget)
        if not widget or visited[widget] then
            return
        end
        visited[widget] = true
        if widget.IsObjectType and widget:IsObjectType("FontString") then
            self:ApplyFontString(widget, path, nil, nil, fallback)
            return
        end
        if widget.GetFontString then
            self:ApplyFontString(widget:GetFontString(), path, nil, nil, fallback)
        end
        if widget.GetRegions then
            local regions = { widget:GetRegions() }
            local index = 1
            while index <= #regions do
                Apply(regions[index])
                index = index + 1
            end
        end
        if widget.GetChildren then
            local children = { widget:GetChildren() }
            local index = 1
            while index <= #children do
                Apply(children[index])
                index = index + 1
            end
        end
    end
    Apply(frame)
    return true
end

function Font:GetInterfaceFontName() return self:GetName("interface") end
function Font:GetInterfaceFontPath() return self:GetPath("interface") end
function Font:SetInterfaceFont(name) return self:Set("interface", name) end
function Font:GetChatBarFontName() return self:GetName("chatBar") end
function Font:GetChatBarFontPath() return self:GetPath("chatBar") end
function Font:SetChatBarFont(name) return self:Set("chatBar", name) end
function Font:GetTimeFontName() return self:GetName("time") end
function Font:GetTimeFontPath() return self:GetPath("time") end
function Font:SetTimeFont(name) return self:Set("time", name) end
function Font:GetCombatTimerFontName() return self:GetName("combatTimer") end
function Font:GetCombatTimerFontPath() return self:GetPath("combatTimer") end
function Font:SetCombatTimerFont(name) return self:Set("combatTimer", name) end
function Font:GetExperienceBarFontName() return self:GetName("experienceBar") end
function Font:GetExperienceBarFontPath() return self:GetPath("experienceBar") end
function Font:SetExperienceBarFont(name) return self:Set("experienceBar", name) end
function Font:GetConsumableBarFontName() return self:GetName("consumableBar") end
function Font:GetConsumableBarFontPath() return self:GetPath("consumableBar") end
function Font:SetConsumableBarFont(name) return self:Set("consumableBar", name) end
function Font:GetCelestialBarFontName() return self:GetName("celestialBar") end
function Font:GetCelestialBarFontPath() return self:GetPath("celestialBar") end
function Font:SetCelestialBarFont(name) return self:Set("celestialBar", name) end
function Font:GetMagePortalFontName() return self:GetName("magePortal") end
function Font:GetMagePortalFontPath() return self:GetPath("magePortal") end
function Font:SetMagePortalFont(name) return self:Set("magePortal", name) end
function Font:GetFontPath() return self:GetPath("interface") end
function Font:GetDefaultFontName() return RS_FONT_NAME end
function Font:GetDefaultFontPath() return self.media:GetRurutiaFontPath() end

function Font:GetDiagnostics()
    local names = 0
    local paths = 0
    for _ in pairs(self.nameCache) do names = names + 1 end
    for _ in pairs(self.pathCache) do paths = paths + 1 end
    return {
        family = self.family,
        cachedNames = names,
        cachedPaths = paths,
        resolves = self.resolveCount,
        migrations = self.migrationCount,
        listeners = #self.listeners,
    }
end

Presentation.FontClass = Font
