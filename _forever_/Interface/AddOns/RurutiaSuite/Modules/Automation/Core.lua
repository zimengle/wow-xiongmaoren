-- 文件职责：集中托管登录后的一次性自动化设置；服务只注册窄 Apply，不自行监听登录或重试。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("Automation")) then return end

local Coordinator = {
    entries = {},
    entryByName = {},
    lastResults = {},
    pendingAddons = {},
    runCount = 0,
}
ns.Automation = Coordinator

function Coordinator:Register(name, apply, options)
    if type(name) ~= "string" or name == "" then
        error("Automation:Register expects a non-empty service name", 2)
    end
    if type(apply) ~= "function" then
        error("Automation:Register expects an apply function", 2)
    end
    if self.entryByName[name] ~= nil then
        error("Automation service already registered: " .. name, 2)
    end
    options = type(options) == "table" and options or {}
    local addonName = options.addonName
    if addonName ~= nil and (type(addonName) ~= "string" or addonName == "") then
        error("Automation service addonName must be a non-empty string", 2)
    end
    local entry = { name = name, apply = apply, addonName = addonName }
    self.entries[#self.entries + 1] = entry
    self.entryByName[name] = entry
    return entry
end

local function CountEntries(entries)
    local count = 0
    for _ in pairs(entries) do count = count + 1 end
    return count
end

function Coordinator:_ApplyEntry(entry, source, allowPending)
    local called, applied, reason = pcall(entry.apply, source)
    if not called then
        applied = false
        reason = "service_error"
    end
    applied = applied == true
    reason = applied and tostring(reason or "applied") or tostring(reason or "not_applied")
    self.lastResults[entry.name] = { applied = applied, reason = reason }
    if allowPending and not applied and reason == "addon_not_loaded" and entry.addonName then
        self.pendingAddons[entry.name] = entry
    else
        self.pendingAddons[entry.name] = nil
    end
    return applied
end

function Coordinator:_SyncAddonEvent()
    local module = self.module
    if not module then return false end
    if next(self.pendingAddons) then
        module:RegisterEvent("ADDON_LOADED", module.ADDON_LOADED)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
    return true
end

function Coordinator:Run(source)
    source = type(source) == "string" and source or "unknown"
    self.lastResults = {}
    self.pendingAddons = {}
    local allApplied = true
    for index = 1, #self.entries do
        if not self:_ApplyEntry(self.entries[index], source, true) then allApplied = false end
    end
    self:_SyncAddonEvent()
    self.lastSource = source
    self.runCount = self.runCount + 1
    return allApplied, self.lastResults
end

function Coordinator:OnAddonLoaded(addonName)
    if not self.loginComplete or type(addonName) ~= "string" then return false end
    local matched = false
    for name, entry in pairs(self.pendingAddons) do
        if entry.addonName == addonName then
            self.pendingAddons[name] = nil
            self:_ApplyEntry(entry, "ADDON_LOADED:" .. addonName, false)
            matched = true
        end
    end
    self:_SyncAddonEvent()
    return matched
end

function Coordinator:GetDiagnostics()
    return {
        serviceCount = #self.entries,
        runCount = self.runCount,
        pendingAddonCount = CountEntries(self.pendingAddons),
        lastSource = self.lastSource,
        lastResults = self.lastResults,
    }
end

local Definition = {}

function Definition:Enable()
    self:RegisterEvent("PLAYER_LOGIN", self.PLAYER_LOGIN)
    return true
end

function Definition:PLAYER_LOGIN()
    self:UnregisterEvent("PLAYER_LOGIN")
    Coordinator.loginComplete = true
    return Coordinator:Run("PLAYER_LOGIN")
end

function Definition:ADDON_LOADED(_, addonName)
    return Coordinator:OnAddonLoaded(addonName)
end

function Definition:Disable()
    self:UnregisterAllEvents()
    Coordinator.loginComplete = false
    Coordinator.pendingAddons = {}
    return true
end

ns.AutomationDefinition = Definition
local module, reason = ns.RegisterModule("Automation", Definition)
if not module then error(reason, 0) end
Coordinator.module = module
