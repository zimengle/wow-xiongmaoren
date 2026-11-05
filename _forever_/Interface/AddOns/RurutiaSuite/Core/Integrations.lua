-- 文件职责：第三方适配器按 Build 解析，并为功能窄 registry 提供 UI 能力注册门禁。
local _, ns = ...

local Build = ns.Build
local Integrations = {}
ns.Integrations = Integrations

local registry = {}
local order = {}
local resolutionCount = 0

-- These are the UI provider capabilities declared by Build descriptors. Other
-- feature providers retain their own contracts; absence here does not ban them.
local uiProviders = { native = true, ndui = true, elvui = true, ellesmereui = true }

function Integrations:IsProviderAllowed(provider)
    local key = type(provider) == "string" and string.lower(provider)
    if not uiProviders[key] then return true end
    return Build.SupportsIntegration(key)
end

local function ValidateScope(scope)
    if type(scope) ~= "table" then
        return false
    end
    local selectors = 0
    if scope.build ~= nil then selectors = selectors + 1 end
    if scope.family ~= nil then selectors = selectors + 1 end
    if scope.all == true then selectors = selectors + 1 end
    return selectors == 1
end

function Integrations:Register(provider, scope, adapter)
    if type(provider) ~= "string" or provider == "" then
        error("Integration provider must be a non-empty string", 2)
    end
    if not ValidateScope(scope) then
        error("Integration scope requires exactly one of build, family or all", 2)
    end
    if type(adapter) ~= "table" then
        error("Integration adapter must be a table", 2)
    end

    local bucket = registry[provider]
    if bucket == nil then
        bucket = {}
        registry[provider] = bucket
        order[#order + 1] = provider
    end

    local index
    for index = 1, #bucket do
        local current = bucket[index].scope
        if current.build == scope.build and current.family == scope.family and current.all == scope.all then
            error("Duplicate integration adapter for provider " .. provider, 2)
        end
    end

    bucket[#bucket + 1] = {
        scope = {
            build = scope.build,
            family = scope.family,
            all = scope.all == true,
        },
        adapter = adapter,
    }
    return adapter
end

local function ResolveFromBucket(bucket, build)
    local familyMatch
    local allMatch
    local index
    for index = 1, #bucket do
        local record = bucket[index]
        if record.scope.build == build.id then
            return record.adapter
        end
        if record.scope.family == build.family then
            familyMatch = record.adapter
        elseif record.scope.all then
            allMatch = record.adapter
        end
    end
    return familyMatch or allMatch
end

function Integrations:Resolve(provider, build)
    build = build or Build.GetActive()
    resolutionCount = resolutionCount + 1
    if build.integrations[provider] ~= true then
        return nil, "integration is not supported by build " .. build.id
    end

    local bucket = registry[provider]
    if bucket == nil then
        return nil, "integration adapter is not registered"
    end
    local adapter = ResolveFromBucket(bucket, build)
    if adapter == nil then
        return nil, "integration adapter is not registered for build " .. build.id
    end
    return adapter
end

function Integrations:IsAvailable(provider, context, build)
    local adapter = self:Resolve(provider, build)
    if adapter == nil then
        return false
    end
    if adapter.IsAvailable == nil then
        return true
    end
    local ok, available = pcall(adapter.IsAvailable, adapter, context)
    return ok and available == true
end

function Integrations:GetAvailable(context, result, build)
    result = result or {}
    local index
    for index = #result, 1, -1 do
        result[index] = nil
    end
    build = build or Build.GetActive()
    for index = 1, #order do
        local provider = order[index]
        if build.integrations[provider] and self:IsAvailable(provider, context, build) then
            result[#result + 1] = provider
        end
    end
    return result
end

function Integrations:GetDiagnostics()
    local providerCount = 0
    local adapterCount = 0
    local _, bucket
    for _, bucket in pairs(registry) do
        providerCount = providerCount + 1
        adapterCount = adapterCount + #bucket
    end
    return {
        providers = providerCount,
        adapters = adapterCount,
        resolutions = resolutionCount,
    }
end
