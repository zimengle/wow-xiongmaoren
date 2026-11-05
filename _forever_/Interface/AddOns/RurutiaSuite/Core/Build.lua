local _, ns = ...

local Build = {}
ns.Build = Build

local descriptors = {}
local descriptorByID = {}
local active

local function CopySet(source)
    local result = {}
    if source then
        for key, value in pairs(source) do
            if value then
                result[key] = true
            end
        end
    end
    return result
end

local function CopyValues(source)
    local result = {}
    if source then
        for key, value in pairs(source) do
            result[key] = value
        end
    end
    return result
end

function Build.Register(descriptor)
    if type(descriptor) ~= "table" then
        error("RurutiaSuite Build descriptor must be a table", 2)
    end

    local id = descriptor.id
    if type(id) ~= "string" or id == "" then
        error("RurutiaSuite Build descriptor requires an id", 2)
    end
    if descriptorByID[id] then
        error("Duplicate RurutiaSuite Build descriptor: " .. id, 2)
    end

    local minInterface = tonumber(descriptor.minInterface)
    local maxInterface = tonumber(descriptor.maxInterface)
    if not minInterface or not maxInterface or minInterface > maxInterface then
        error("Invalid interface range for RurutiaSuite Build: " .. id, 2)
    end

    local normalized = {
        id = id,
        family = descriptor.family or id,
        label = descriptor.label or id,
        minInterface = minInterface,
        maxInterface = maxInterface,
        primary = descriptor.primary ~= false,
        modules = CopySet(descriptor.modules),
        integrations = CopySet(descriptor.integrations),
        capabilities = CopyValues(descriptor.capabilities),
    }

    descriptors[#descriptors + 1] = normalized
    descriptorByID[id] = normalized
    active = nil
    return normalized
end

local function GetInterfaceVersion()
    local getBuildInfo = _G.GetBuildInfo
    if type(getBuildInfo) ~= "function" then
        return 0
    end
    -- Parentheses collapse GetBuildInfo's remaining return values so tonumber
    -- receives only the interface number, never the following build string as
    -- its optional base argument.
    return tonumber((select(4, getBuildInfo()))) or 0
end

function Build.Resolve(interfaceVersion)
    local toc = tonumber(interfaceVersion) or GetInterfaceVersion()
    for index = 1, #descriptors do
        local descriptor = descriptors[index]
        if toc >= descriptor.minInterface and toc <= descriptor.maxInterface then
            return descriptor, toc
        end
    end

    return {
        id = "unsupported",
        family = "unsupported",
        label = "Unsupported client",
        minInterface = 0,
        maxInterface = 0,
        primary = false,
        modules = {},
        integrations = {},
        capabilities = {},
    }, toc
end

function Build.GetActive()
    if not active then
        active = Build.Resolve()
    end
    return active
end

function Build.GetID()
    return Build.GetActive().id
end

function Build.GetFamily()
    return Build.GetActive().family
end

function Build.Is(id)
    return Build.GetID() == id
end

function Build.IsFamily(family)
    return Build.GetFamily() == family
end

function Build.HasModule(moduleName)
    return Build.GetActive().modules[moduleName] == true
end

function Build.SupportsIntegration(provider)
    return Build.GetActive().integrations[provider] == true
end

function Build.GetCapability(name, fallback)
    local value = Build.GetActive().capabilities[name]
    if value == nil then
        return fallback
    end
    return value
end

function Build.GetInterfaceVersion()
    local _, toc = Build.Resolve()
    return toc
end

function Build.GetDescriptor(id)
    return descriptorByID[id]
end

function Build.GetDescriptors()
    return descriptors
end

-- 测试和显式重载使用；正常运行只会解析一次。
function Build.ResetActive()
    active = nil
end
