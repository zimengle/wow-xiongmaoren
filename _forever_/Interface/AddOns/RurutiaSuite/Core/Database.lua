-- 共享稀疏配置数据库：管理 profile/namespace、默认值绑定与保存清理。
local _, ns = ...

local Database = {}
ns.Database = Database

local function WipeTable(target)
    for key in pairs(target) do
        target[key] = nil
    end
end

local function DeepCopy(source, seen)
    if type(source) ~= "table" then
        return source
    end

    seen = seen or {}
    if seen[source] then
        return seen[source]
    end

    local copy = {}
    seen[source] = copy
    for key, value in pairs(source) do
        copy[DeepCopy(key, seen)] = DeepCopy(value, seen)
    end
    return copy
end

local function IsDenseArray(values)
    local count = 0
    local maximum = 0
    local key
    for key in pairs(values) do
        if type(key) ~= "number" or key < 1 or key % 1 ~= 0 then
            return false
        end
        count = count + 1
        if key > maximum then maximum = key end
    end
    return count > 0 and count == maximum
end

local function CopyDefaultValue(value)
    if type(value) ~= "table" then
        return value
    end
    local copy = {}
    local key
    local child
    for key, child in pairs(value) do
        copy[CopyDefaultValue(key)] = CopyDefaultValue(child)
    end
    return copy
end

local DEFAULT_BINDING = {}

local function ApplyDefaults(target, defaults, visited)
    if type(target) ~= "table" or type(defaults) ~= "table" then
        return target
    end

    visited = visited or {}
    if visited[target] then return target end
    visited[target] = true

    -- Lua 5.1 的长度运算和 ipairs 不读取 __index，数组默认值必须实体化。
    -- 普通配置树则保持稀疏：标量只从 __index 读取，嵌套表首次访问才创建。
    if IsDenseArray(defaults) then
        local index
        for index = 1, #defaults do
            if rawget(target, index) == nil then
                rawset(target, index, CopyDefaultValue(defaults[index]))
            end
            if type(rawget(target, index)) == "table" then
                ApplyDefaults(rawget(target, index), defaults[index], visited)
            end
        end
        return target
    end

    local currentMeta = getmetatable(target)
    local binding = currentMeta and rawget(currentMeta, DEFAULT_BINDING)
    if binding and currentMeta.__index == binding.index then
        binding.defaults = defaults
    else
        -- 不串联我们自己的旧 __index，也不修改调用方可能共享的元表。
        binding = { defaults = defaults, inheritedIndex = currentMeta and currentMeta.__index }
        local meta = {}
        for key, value in pairs(currentMeta or {}) do meta[key] = value end
        binding.index = function(currentTarget, key)
            local defaultValue = binding.defaults[key]
            if defaultValue == nil then
                defaultValue = binding.defaults["*"]
            end
            if type(defaultValue) == "table" then
                local child = {}
                rawset(currentTarget, key, child)
                ApplyDefaults(child, defaultValue)
                return child
            end
            if defaultValue ~= nil then
                return defaultValue
            end
            if type(binding.inheritedIndex) == "function" then
                return binding.inheritedIndex(currentTarget, key)
            end
            if type(binding.inheritedIndex) == "table" then
                return binding.inheritedIndex[key]
            end
            return nil
        end
        meta.__index = binding.index
        meta[DEFAULT_BINDING] = binding
        setmetatable(target, meta)
    end

    -- 已保存的子表不会触发 __index，必须在绑定时补上它们的默认值。
    -- 只遍历已有内容，不为尚未访问的配置树分配子表。
    for key, value in pairs(target) do
        if type(value) == "table" then
            local childDefaults = defaults[key]
            if childDefaults == nil then childDefaults = defaults["*"] end
            ApplyDefaults(value, childDefaults, visited)
        end
    end
    return target
end

local function IsEmpty(target)
    return next(target) == nil
end

local function StripDefaults(target, defaults)
    if type(target) ~= "table" or type(defaults) ~= "table" then
        return
    end

    for key, defaultValue in pairs(defaults) do
        local current = rawget(target, key)
        if type(current) == "table" and type(defaultValue) == "table" then
            StripDefaults(current, defaultValue)
            if IsEmpty(current) then
                rawset(target, key, nil)
            end
        elseif current == defaultValue then
            rawset(target, key, nil)
        end
    end
end

local function GetCharacterKey(options)
    if options and type(options.characterKey) == "string" and options.characterKey ~= "" then
        return options.characterKey
    end

    local name
    local realm
    if type(_G.UnitFullName) == "function" then
        name, realm = _G.UnitFullName("player")
    end
    if not name and type(_G.UnitName) == "function" then
        name = _G.UnitName("player")
    end
    if (not realm or realm == "") and type(_G.GetRealmName) == "function" then
        realm = _G.GetRealmName()
    end

    name = name or "Unknown"
    realm = realm or "Unknown"
    return name .. " - " .. realm
end

local function ValidateRoot(root)
    if type(root) ~= "table" then
        return false, "SavedVariables root is not a table"
    end
    if root.profileKeys ~= nil and type(root.profileKeys) ~= "table" then
        return false, "SavedVariables profileKeys is not a table"
    end
    if root.profiles ~= nil and type(root.profiles) ~= "table" then
        return false, "SavedVariables profiles is not a table"
    end
    if root.namespaces ~= nil and type(root.namespaces) ~= "table" then
        return false, "SavedVariables namespaces is not a table"
    end
    if root.global ~= nil and type(root.global) ~= "table" then
        return false, "SavedVariables global is not a table"
    end
    if root.char ~= nil and type(root.char) ~= "table" then
        return false, "SavedVariables char is not a table"
    end
    return true
end

local DBMethods = {}
DBMethods.__index = DBMethods

local function EnsureScope(container, scope, key)
    container[scope] = container[scope] or {}
    if key == nil then
        return container[scope]
    end
    container[scope][key] = container[scope][key] or {}
    return container[scope][key]
end

local function BindScopes(db)
    local defaults = db.defaults
    db.profile = EnsureScope(db.storage, "profiles", db.profileName)
    db.global = EnsureScope(db.storage, "global")
    db.char = EnsureScope(db.storage, "char", db.characterKey)

    ApplyDefaults(db.profile, defaults.profile)
    ApplyDefaults(db.global, defaults.global)
    ApplyDefaults(db.char, defaults.char)

    if db.children then
        for _, child in pairs(db.children) do
            child.profileName = db.profileName
            BindScopes(child)
        end
    end
end

local function StripDBDefaults(db)
    StripDefaults(db.profile, db.defaults.profile)
    StripDefaults(db.global, db.defaults.global)
    StripDefaults(db.char, db.defaults.char)
    if db.children then
        for _, child in pairs(db.children) do
            StripDBDefaults(child)
        end
    end
end

local function RemoveEmptyEntries(container)
    if type(container) ~= "table" then return end
    local key, value
    for key, value in pairs(container) do
        if type(value) == "table" and IsEmpty(value) then
            rawset(container, key, nil)
        end
    end
end

local function RemoveEmptyCurrentScopes(db, allEntries)
    local storage = db.storage
    local profiles = rawget(storage, "profiles")
    if type(profiles) == "table" then
        if allEntries then RemoveEmptyEntries(profiles) end
        local current = rawget(profiles, db.profileName)
        if type(current) == "table" and IsEmpty(current) then
            rawset(profiles, db.profileName, nil)
        end
        if IsEmpty(profiles) then rawset(storage, "profiles", nil) end
    end

    local global = rawget(storage, "global")
    if type(global) == "table" and IsEmpty(global) then rawset(storage, "global", nil) end

    local chars = rawget(storage, "char")
    if type(chars) == "table" then
        if allEntries then RemoveEmptyEntries(chars) end
        local current = rawget(chars, db.characterKey)
        if type(current) == "table" and IsEmpty(current) then
            rawset(chars, db.characterKey, nil)
        end
        if IsEmpty(chars) then rawset(storage, "char", nil) end
    end
end

local function Fire(db, eventName, ...)
    local listeners = db.listeners[eventName]
    if not listeners then
        return
    end
    for index = 1, #listeners do
        listeners[index](db, eventName, ...)
    end
end

function DBMethods:RegisterListener(eventName, callback)
    if type(eventName) ~= "string" or type(callback) ~= "function" then
        return false
    end
    local listeners = self.listeners[eventName]
    if not listeners then
        listeners = {}
        self.listeners[eventName] = listeners
    end
    listeners[#listeners + 1] = callback
    return true
end

function DBMethods:GetCurrentProfile()
    return self.profileName
end

function DBMethods:GetProfiles(result)
    result = result or {}
    WipeTable(result)
    for profileName in pairs(self.root.profiles) do
        result[#result + 1] = profileName
    end
    table.sort(result)
    return result
end

function DBMethods:SetProfile(profileName)
    if self.parent then
        return false, "Namespaces cannot select a profile independently"
    end
    if type(profileName) ~= "string" or profileName == "" then
        return false, "Profile name must be a non-empty string"
    end
    if profileName == self.profileName then
        return true
    end

    StripDBDefaults(self)
    self.root.profiles[profileName] = self.root.profiles[profileName] or {}
    self.root.profileKeys[self.characterKey] = profileName
    self.profileName = profileName
    BindScopes(self)
    Fire(self, "OnProfileChanged", profileName)
    return true
end

function DBMethods:CopyProfile(sourceName)
    if self.parent then
        return false, "Namespaces cannot copy a profile independently"
    end
    if sourceName == self.profileName then
        return false, "Cannot copy the active profile onto itself"
    end
    local source = self.root.profiles[sourceName]
    if type(source) ~= "table" then
        return false, "Source profile does not exist"
    end

    StripDBDefaults(self)
    WipeTable(self.root.profiles[self.profileName])
    local copy = DeepCopy(source)
    for key, value in pairs(copy) do
        self.root.profiles[self.profileName][key] = value
    end

    if self.children then
        for name, child in pairs(self.children) do
            local namespace = self.root.namespaces[name]
            local sourceProfiles = namespace and namespace.profiles
            local childSource = sourceProfiles and sourceProfiles[sourceName]
            namespace.profiles = namespace.profiles or {}
            namespace.profiles[self.profileName] = DeepCopy(childSource or {})
            child.storage = namespace
        end
    end

    BindScopes(self)
    Fire(self, "OnProfileCopied", sourceName)
    return true
end

function DBMethods:ResetProfile()
    StripDBDefaults(self)
    WipeTable(self.profile)
    if self.children then
        for _, child in pairs(self.children) do
            WipeTable(child.profile)
        end
    end
    BindScopes(self)
    Fire(self, "OnProfileReset", self.profileName)
    return true
end

function DBMethods:DeleteProfile(profileName)
    if self.parent then
        return false, "Namespaces cannot delete a profile independently"
    end
    if profileName == self.profileName then
        return false, "Cannot delete the active profile"
    end
    if self.root.profiles[profileName] == nil then
        return false, "Profile does not exist"
    end

    self.root.profiles[profileName] = nil
    for characterKey, selectedProfile in pairs(self.root.profileKeys) do
        if selectedProfile == profileName then
            self.root.profileKeys[characterKey] = self.defaultProfile
        end
    end
    if self.root.namespaces then
        for _, namespace in pairs(self.root.namespaces) do
            if type(namespace) == "table" and type(namespace.profiles) == "table" then
                namespace.profiles[profileName] = nil
            end
        end
    end
    Fire(self, "OnProfileDeleted", profileName)
    return true
end

function DBMethods:RegisterNamespace(name, defaults)
    if self.parent then
        return nil, "Nested namespaces are not supported"
    end
    if type(name) ~= "string" or name == "" then
        return nil, "Namespace name must be a non-empty string"
    end
    if self.children[name] then
        return self.children[name]
    end

    self.root.namespaces = self.root.namespaces or {}
    local storage = self.root.namespaces[name]
    if storage ~= nil and type(storage) ~= "table" then
        return nil, "Namespace storage is not a table"
    end
    storage = storage or {}
    self.root.namespaces[name] = storage

    local child = setmetatable({
        name = name,
        root = self.root,
        storage = storage,
        defaults = defaults or {},
        characterKey = self.characterKey,
        profileName = self.profileName,
        defaultProfile = self.defaultProfile,
        parent = self,
        children = {},
        listeners = {},
    }, DBMethods)
    self.children[name] = child
    BindScopes(child)
    return child
end

function DBMethods:GetNamespace(name)
    return self.children[name]
end

function DBMethods:PrepareForSave()
    StripDBDefaults(self)
    return true
end

function DBMethods:CompactStorage()
    -- 只用于模块全部停止后的终止保存；清理后当前 scope 引用会脱离存储树。
    if self.parent then return false, "Only the root database can compact storage" end
    local name, child
    for name, child in pairs(self.children or {}) do
        RemoveEmptyCurrentScopes(child, true)
        if IsEmpty(child.storage) then rawset(self.root.namespaces, name, nil) end
    end
    RemoveEmptyCurrentScopes(self)
    if type(self.root.namespaces) == "table" and IsEmpty(self.root.namespaces) then
        self.root.namespaces = nil
    end
    return true
end

function DBMethods:ReapplyDefaults()
    BindScopes(self)
    return true
end

function Database.Open(savedVariableName, defaults, options)
    if type(savedVariableName) ~= "string" or savedVariableName == "" then
        return nil, "SavedVariables name must be a non-empty string"
    end
    if defaults ~= nil and type(defaults) ~= "table" then
        return nil, "Defaults must be a table"
    end

    local root = _G[savedVariableName]
    if root == nil then
        root = {}
        _G[savedVariableName] = root
    end
    local valid, reason = ValidateRoot(root)
    if not valid then
        return nil, reason
    end

    root.profileKeys = root.profileKeys or {}
    root.profiles = root.profiles or {}
    root.namespaces = root.namespaces or {}

    local characterKey = GetCharacterKey(options)
    local defaultProfile = options and options.defaultProfile or "Default"
    local profileName = root.profileKeys[characterKey] or defaultProfile
    root.profileKeys[characterKey] = profileName
    root.profiles[profileName] = root.profiles[profileName] or {}

    local db = setmetatable({
        name = savedVariableName,
        -- Capture before Changelog updates the persisted version during initialization.
        sourceVersion = type(root.global) == "table" and rawget(root.global, "lastSeenVersion") or nil,
        root = root,
        storage = root,
        defaults = defaults or {},
        characterKey = characterKey,
        profileName = profileName,
        defaultProfile = defaultProfile,
        children = {},
        listeners = {},
    }, DBMethods)
    BindScopes(db)
    return db
end

Database.ApplyDefaults = ApplyDefaults
Database.StripDefaults = StripDefaults
Database.DeepCopy = DeepCopy
