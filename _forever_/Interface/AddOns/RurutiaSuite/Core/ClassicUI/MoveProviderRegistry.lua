local _, RS = ...

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("MoveProviderRegistry requires ClassicUI TabRegistry before it", 2)
end

local Registry = {}
Registry.__index = Registry

local function DefaultGetPlayerClass()
    if type(_G.UnitClass) ~= "function" then return nil end
    local _, class = _G.UnitClass("player")
    return class
end

function Registry:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.getModule = options.getModule
    instance.getPlayerClass = options.getPlayerClass or DefaultGetPlayerClass
    instance.providers = {}
    instance.order = {}
    instance.resolveCount = 0
    instance.operationCount = 0
    return instance
end

function Registry:Register(definition)
    if type(definition) ~= "table" or type(definition.name) ~= "string"
        or definition.name == "" or self.providers[definition.name] then
        return false
    end
    self.providers[definition.name] = definition
    self.order[#self.order + 1] = definition.name
    return true
end

function Registry:Resolve(name)
    local provider = self.providers[name]
    if provider and type(provider.getModule) == "function" then
        self.resolveCount = self.resolveCount + 1
        local ok, module = pcall(provider.getModule)
        return provider, ok and module or nil
    end
    if not provider or type(self.getModule) ~= "function" then
        return provider, nil
    end
    self.resolveCount = self.resolveCount + 1
    return provider, self.getModule(name)
end

function Registry:Unregister(name)
    if not self.providers[name] then return true end
    self.providers[name] = nil
    for index = #self.order, 1, -1 do
        if self.order[index] == name then table.remove(self.order, index) end
    end
    return true
end

function Registry:ForEach(callback)
    if type(callback) ~= "function" then return false end
    local index = 1
    while index <= #self.order do
        local provider, module = self:Resolve(self.order[index])
        if module then callback(provider, module) end
        index = index + 1
    end
    return true
end

function Registry:GetMovableModules(reusableResult)
    local result = reusableResult or {}
    local count = 0
    self:ForEach(function(provider, module)
        local movable = provider.isMovable == nil or provider.isMovable(module, self)
        if movable and type(module.SetUnlocked) == "function" then
            count = count + 1
            module.__rsMoveProviderName = provider.name
            result[count] = module
        end
    end)
    local index = #result
    while index > count do
        result[index] = nil
        index = index - 1
    end
    return result
end

function Registry:RefreshClamp()
    local count = 0
    self:ForEach(function(provider, module)
        local method = provider.refreshClamp and module[provider.refreshClamp]
        if type(method) == "function" then
            method(module)
            count = count + 1
        end
    end)
    self.operationCount = self.operationCount + count
    return count
end

function Registry:ResetAll()
    local count = 0
    self:ForEach(function(provider, module)
        local reset = provider.resetFunc
        if type(reset) == "function" then
            if reset(module) ~= false then count = count + 1 end
        else
            local method = provider.reset and module[provider.reset]
            if type(method) == "function" then
                method(module)
                count = count + 1
            end
        end
    end)
    self.operationCount = self.operationCount + count
    return count
end

function Registry:GetDiagnostics()
    return {
        registered = #self.order,
        resolves = self.resolveCount,
        operations = self.operationCount,
    }
end

ClassicUI.MoveProviderRegistry = Registry
RS.MoveProviderAPI = 1 -- RegisterMoveProvider supports a lazy getModule resolver.
