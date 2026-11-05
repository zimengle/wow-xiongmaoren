local _, ns = ...

local Coordinator = {
    tokens = {},
    pendingCombat = false,
}
ns.AutomationCoordinator = Coordinator

local function Settings()
    return ns.DB and ns.DB.global and ns.DB.global.automation or nil
end

local function AddonAvailable(name)
    local addons = _G.C_AddOns
    local loaded = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(loaded) == "function" then
        local ok, loadedOrLoading, fullyLoaded = pcall(loaded, name)
        if ok and (fullyLoaded == true or loadedOrLoading == true) then return true end
    end
    return false
end

local function SenseiAvailable()
    return AddonAvailable("SenseiClassResourceBar")
end

local function EXBossAvailable()
    return AddonAvailable("EXBoss") and AddonAvailable("EXBOSS-RURUTIA")
end

local function DandersAvailable()
    return AddonAvailable("DandersFrames")
end

local function Cancel(self, key)
    local token = self.schedules and self.schedules[key]
    if token and self.handle then self.handle:CancelSchedule(token) end
    if self.schedules then self.schedules[key] = nil end
end

function Coordinator:RequestCombatRetry(service)
    self.pendingServices = self.pendingServices or {}
    self.pendingServices[service] = true
    if self.pendingCombat or not ns.EventHub then return end
    local token = ns.EventHub:Subscribe("PLAYER_REGEN_ENABLED", function()
        ns.EventHub:Unsubscribe(self.regenToken)
        self.regenToken = nil
        self.pendingCombat = false
        local pending = self.pendingServices
        self.pendingServices = {}
        for business in pairs(pending) do self:Apply(business, "combat-ended") end
    end)
    if token then
        self.regenToken = token
        self.pendingCombat = true
    end
end

function Coordinator:Apply(service, source)
    local settings = Settings()
    if settings and settings.enabled == false then return true, "disabled" end
    if type(service) ~= "table" or type(service.Apply) ~= "function" then return true end
    local called, ok, reason = pcall(service.Apply, service, source)
    if not called then return false, "SERVICE_ERROR" end
    if not ok and reason == "combat-pending" then self:RequestCombatRetry(service)
    elseif self.pendingServices then self.pendingServices[service] = nil end
    return ok, reason
end

function Coordinator:ClearPending(service)
    if self.pendingServices and service then self.pendingServices[service] = nil end
    if self.regenToken and not next(self.pendingServices or {}) then
        ns.EventHub:Unsubscribe(self.regenToken)
        self.regenToken = nil
        self.pendingCombat = false
    end
end

-- UI 在持久化值与刷新订阅后调用；false 也必须处理，不能用值作为分发条件。
function Coordinator:ApplySetting(key)
    local settings = Settings()
    if not settings then return false, "settings-unavailable" end
    local service, enabled, available
    if key == "senseiNotify" then return true, "notification-only"
    elseif key == "senseiBrewmaster" then
        service, enabled, available = ns.SenseiAutomation, settings.senseiBrewmaster, SenseiAvailable()
        Cancel(self, "sensei-world")
        Cancel(self, "sensei-spec")
        if settings.enabled == false or enabled ~= true then Cancel(self, "sensei-calibration") end
    elseif key == "exbossVoice" then
        service, enabled, available = ns.EXBossAutomation, settings.exbossVoice, EXBossAvailable()
        Cancel(self, "exboss-world")
    elseif key == "dandersProfile" or key == "dandersMythicOnly" then
        service, enabled, available = ns.DandersAutomation, settings.dandersProfile, DandersAvailable()
    else return false, "unknown-setting" end
    self:ClearPending(service)
    if settings.enabled == false or enabled ~= true then return true, "disabled" end
    if type(service) ~= "table" or type(service.Apply) ~= "function" then
        return false, "SERVICE_UNAVAILABLE"
    end
    if not available then return false, "ADDON_NOT_LOADED" end
    local ok, reason = self:Apply(service, "setting:" .. key)
    if not ok and reason == "combat-pending" then return true, { pending = true } end
    return ok, reason
end

function Coordinator:Schedule(key, delay, service, source)
    Cancel(self, key)
    local token = self.handle:Schedule(delay, function()
        self.schedules[key] = nil
        self:Apply(service, source)
    end, "RSS:" .. key)
    self.schedules[key] = token
    return token ~= nil
end

function Coordinator:ApplyAll(source)
    local settings = Settings()
    if not settings or settings.enabled == false then return true, "disabled" end
    local failures = {}
    local function Apply(name, service)
        local ok, reason = self:Apply(service, source)
        if not ok then failures[name] = tostring(reason or "UNKNOWN_FAILURE") end
    end
    if settings.senseiBrewmaster == true and SenseiAvailable() then
        Apply("sensei", ns.SenseiAutomation)
    end
    if settings.exbossVoice == true and EXBossAvailable() then
        Apply("exboss", ns.EXBossAutomation)
    end
    if settings.dandersProfile == true and DandersAvailable() then
        Apply("danders", ns.DandersAutomation)
    end
    if next(failures) then return false, { source = source, failures = failures } end
    return true, { source = source, failures = failures }
end

function Coordinator:OnWorld(_, isInitialLogin, isReloadingUi)
    local settings = Settings()
    if not settings or settings.enabled == false then return end
    if settings.senseiBrewmaster == true and SenseiAvailable()
        and (isInitialLogin or isReloadingUi) and not self.senseiLoginScheduled then
        self.senseiLoginScheduled = true
        self:Schedule("sensei-world", 1, ns.SenseiAutomation, "world")
        self:Schedule("sensei-calibration", 5, ns.SenseiAutomation, "world-calibration")
    end
    if settings.exbossVoice == true and EXBossAvailable()
        and (isInitialLogin or isReloadingUi) then
        self:Schedule("exboss-world", 2, ns.EXBossAutomation, "world")
    end
    if settings.dandersProfile == true and DandersAvailable() then
        self:Apply(ns.DandersAutomation, "world")
    end
end

function Coordinator:OnSpecialization(_, unit)
    if unit ~= nil and unit ~= "player" then return end
    local settings = Settings()
    if not settings or settings.enabled == false then return end
    if settings.senseiBrewmaster == true and SenseiAvailable() then
        self:Schedule("sensei-spec", 0.2, ns.SenseiAutomation, "specialization")
    end
    if settings.dandersProfile == true and DandersAvailable() then
        self:Apply(ns.DandersAutomation, "specialization")
    end
end

function Coordinator:RefreshSubscriptions()
    if not self.enabled then return false end
    local settings = Settings()
    if not settings then return false end
    local senseiEnabled = settings.enabled ~= false and settings.senseiBrewmaster == true and SenseiAvailable()
    local exbossEnabled = settings.enabled ~= false and settings.exbossVoice == true and EXBossAvailable()
    local dandersEnabled = settings.enabled ~= false and settings.dandersProfile == true and DandersAvailable()
    local wantsWorld = senseiEnabled or exbossEnabled or dandersEnabled
    local wantsSpec = senseiEnabled or dandersEnabled
    local wantsZone = dandersEnabled

    local failure
    local function Sync(key, event, wanted, callback)
        if wanted and not self.tokens[key] then
            local token, reason = ns.EventHub:Subscribe(event, callback)
            if not token then failure = failure or reason or (event .. " subscription failed")
            else self.tokens[key] = token end
        elseif not wanted and self.tokens[key] then
            ns.EventHub:Unsubscribe(self.tokens[key])
            self.tokens[key] = nil
        end
    end
    Sync("world", "PLAYER_ENTERING_WORLD", wantsWorld,
        function(event, ...) self:OnWorld(event, ...) end)
    Sync("spec", "PLAYER_SPECIALIZATION_CHANGED", wantsSpec,
        function(event, ...) self:OnSpecialization(event, ...) end)
    Sync("zone", "ZONE_CHANGED_NEW_AREA", wantsZone,
        function() self:Apply(ns.DandersAutomation, "zone") end)
    Sync("logout", "PLAYER_LOGOUT", senseiEnabled,
        function() ns.SenseiAutomation:SaveCurrent() end)
    if failure then return false, failure end

    if not senseiEnabled then
        Cancel(self, "sensei-world")
        Cancel(self, "sensei-spec")
        Cancel(self, "sensei-calibration")
        ns.SenseiAutomation:ResetSession()
        self:ClearPending(ns.SenseiAutomation)
    end
    if not exbossEnabled then
        Cancel(self, "exboss-world")
        self:ClearPending(ns.EXBossAutomation)
    end
    if not dandersEnabled then
        Cancel(self, "danders-world")
        self:ClearPending(ns.DandersAutomation)
    end
    if not wantsWorld and not wantsSpec and not wantsZone and self.regenToken then
        ns.EventHub:Unsubscribe(self.regenToken)
        self.regenToken = nil
        self.pendingCombat = false
    end
    return true
end

function Coordinator:Enable(handle)
    if self.enabled then return true end
    self.handle = handle
    self.schedules = {}
    self.tokens = {}
    self.pendingServices = {}
    self.senseiLoginScheduled = nil
    self.enabled = true
    local refreshed, reason = self:RefreshSubscriptions()
    if not refreshed then
        self:Disable()
        return false, reason
    end
    return true
end

function Coordinator:Disable()
    for _, token in pairs(self.tokens or {}) do ns.EventHub:Unsubscribe(token) end
    if self.regenToken then ns.EventHub:Unsubscribe(self.regenToken) end
    for key in pairs(self.schedules or {}) do Cancel(self, key) end
    ns.SenseiAutomation:ResetSession()
    self.tokens = {}
    self.schedules = {}
    self.regenToken = nil
    self.pendingCombat = false
    self.pendingServices = {}
    self.handle = nil
    self.enabled = false
    return true
end

return Coordinator
