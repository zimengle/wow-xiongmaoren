-- 文件职责：按能力登记皮肤 provider，缓存选择并持有样式回调；支持独立 UI 装配。
local _, RS = ...
local UI = RS.UI

local SkinProvider = {}
SkinProvider.__index = SkinProvider

local NativeProvider = {}

function NativeProvider:IsAvailable()
    return true
end

function NativeProvider:Apply(kind, component, theme)
    if component and component.ApplyNativeTheme then
        return component:ApplyNativeTheme(theme, kind)
    end
    return false
end

local function SortProviders(left, right)
    if left.priority == right.priority then
        return left.name < right.name
    end
    return left.priority > right.priority
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

local function NotifySelectionListeners(self, previousName, activeName)
    local listeners = self.listeners
    local index = 1
    local count = #listeners
    while index <= count do
        local entry = listeners[index]
        local ok = pcall(entry.callback, entry.owner, self, previousName, activeName)
        if not ok then
            RecordCallbackError(self, entry.owner, "selection-listener")
        end
        index = index + 1
    end
end

local function OnThemeChanged(self, theme, changed, generation)
    local entry = self.providers[self.activeName]
    if entry and entry.provider.OnThemeChanged then
        local ok = pcall(entry.provider.OnThemeChanged, entry.provider, theme, changed, generation)
        if not ok then
            RecordCallbackError(self, entry.name, "provider-theme-change")
        end
    end
end

function SkinProvider:New(theme)
    local instance = setmetatable({}, self)
    instance.theme = theme
    instance.providers = {}
    instance.order = {}
    instance.resolutionCache = {}
    instance.listeners = {}
    instance.listenerIndex = {}
    instance.activeName = nil
    instance.generation = 0
    instance.resolveCount = 0
    instance.applyCount = 0
    instance.errorCount = 0
    instance.lastErrorOwner = nil
    instance.lastErrorStage = nil

    instance:Register("Native", NativeProvider, -1000)
    instance.activeName = instance.providers.Native and "Native" or nil
    if theme then
        theme:Subscribe(instance, OnThemeChanged)
    end
    return instance
end

function SkinProvider:Register(name, provider, priority)
    if type(name) ~= "string" or name == "" or type(provider) ~= "table" then
        return false
    end
    if type(provider.Apply) ~= "function" then
        return false
    end
    if RS.Integrations and not RS.Integrations:IsProviderAllowed(name) then return false end

    priority = tonumber(priority) or 0
    local entry = self.providers[name]
    local replacingActive = entry and self.activeName == name
    if entry then
        entry.provider = provider
        entry.priority = priority
    else
        entry = { name = name, provider = provider, priority = priority }
        self.providers[name] = entry
        self.order[#self.order + 1] = entry
    end

    table.sort(self.order, SortProviders)
    self.resolutionCache = {}
    if replacingActive then
        self.generation = self.generation + 1
        NotifySelectionListeners(self, name, name)
    end
    return true
end

function SkinProvider:Unregister(name)
    if name == "Native" or not self.providers[name] then
        return false
    end

    self.providers[name] = nil
    local order = self.order
    local index = #order
    while index >= 1 do
        if order[index].name == name then
            table.remove(order, index)
            break
        end
        index = index - 1
    end

    self.resolutionCache = {}
    if self.activeName == name then
        if self.providers.Native then
            self:Select("Native")
        else
            self.activeName = nil
            self.generation = self.generation + 1
            NotifySelectionListeners(self, name, nil)
        end
    end
    return true
end

function SkinProvider:Resolve(contextKey, context)
    contextKey = contextKey or "default"
    local cachedName = self.resolutionCache[contextKey]
    if cachedName then
        return cachedName, self.providers[cachedName].provider
    end

    context = context or {}
    local preferredName = context.providerName
    local entry

    if preferredName then
        entry = self.providers[preferredName]
        if entry and entry.provider.IsAvailable and not entry.provider:IsAvailable(context) then
            entry = nil
        end
    else
        local order = self.order
        local index = 1
        while index <= #order do
            local candidate = order[index]
            local available = true
            if candidate.provider.IsAvailable then
                available = candidate.provider:IsAvailable(context) and true or false
            end
            if available then
                entry = candidate
                break
            end
            index = index + 1
        end
    end

    if not entry then
        entry = self.providers.Native
    end
    if not entry then return nil, nil end

    self.resolutionCache[contextKey] = entry.name
    self.resolveCount = self.resolveCount + 1
    return entry.name, entry.provider
end

function SkinProvider:Invalidate(contextKey)
    if contextKey then
        self.resolutionCache[contextKey] = nil
    else
        self.resolutionCache = {}
    end
end

function SkinProvider:Select(name)
    if not self.providers[name] then
        return false
    end
    if self.activeName == name then
        return true
    end

    local previousName = self.activeName
    self.activeName = name
    self.generation = self.generation + 1
    NotifySelectionListeners(self, previousName, name)
    return true
end

function SkinProvider:SelectFor(contextKey, context)
    local name = self:Resolve(contextKey, context)
    self:Select(name)
    return name
end

function SkinProvider:GetActiveName()
    return self.activeName
end

function SkinProvider:GetActive()
    local entry = self.providers[self.activeName]
    return entry and entry.provider or nil
end

function SkinProvider:Apply(kind, component)
    local provider = self:GetActive()
    if not provider then
        return false
    end
    self.applyCount = self.applyCount + 1
    if provider:Apply(kind, component, self.theme) then
        return true
    end
    if self.activeName ~= "Native" and self.providers.Native then
        return NativeProvider:Apply(kind, component, self.theme) and true or false
    end
    return false
end

function SkinProvider:Subscribe(owner, callback)
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

function SkinProvider:Unsubscribe(owner)
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

function SkinProvider:GetRegisteredNames()
    local result = {}
    local index = 1
    while index <= #self.order do
        result[index] = self.order[index].name
        index = index + 1
    end
    return result
end

function SkinProvider:GetDiagnostics()
    local cached = 0
    for _ in pairs(self.resolutionCache) do
        cached = cached + 1
    end
    return {
        active = self.activeName,
        generation = self.generation,
        registered = #self.order,
        cachedSelections = cached,
        resolves = self.resolveCount,
        applies = self.applyCount,
        listeners = #self.listeners,
        errorCount = self.errorCount,
        lastErrorOwner = self.lastErrorOwner,
        lastErrorStage = self.lastErrorStage,
    }
end

UI.SkinProvider = SkinProvider
