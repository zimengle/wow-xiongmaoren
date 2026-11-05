-- Owns TopBar settings and runtime lifecycle; views retain their reusable frames.
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Adapter = ns.TopBarAdapter
local Data = ns.TopBarData
local MicroMenu = ns.TopBarMicroMenuClass
local View = ns.TopBarViewClass
local Movement = ns.TopBarMovementClass
local FastFocusHub = ns.TopBarFastFocusHubClass
local Settings = ns.TopBarSettings
local Providers = ns.TopBarProviderRegistry
if type(Adapter) ~= "table" or type(Data) ~= "table" or type(MicroMenu) ~= "table"
    or type(View) ~= "table" or type(Movement) ~= "table" or type(Settings) ~= "table"
    or type(Providers) ~= "table" or type(FastFocusHub) ~= "table" then
    error("TopBar requires Data, active Build adapter, Providers, MicroMenu, View, Movement, FastFocusHub, and Settings before Core.lua", 2)
end

local DEFAULTS = Data:GetDefaults(Adapter.family)
local DEFAULT_PROFILE = DEFAULTS.profile
local QUICK_KEYS = Adapter.family == "retail"
    and { "meetingstone", "hearthstone" }
    or { "meetingstone", "handbook", "hearthstone", "automark" }

local Definition = {
    defaults = DEFAULTS,
    defaultEnabled = Adapter:IsAvailable(),
}

local FALLBACK_NAMES = {
    [6948] = "炉石", [253629] = "奥术秘社的私人钥匙",
    [140192] = "达拉然炉石", [110560] = "要塞炉石",
}

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d, e = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d, e
end

local function Clamp(value, minimum, maximum, fallback)
    value = tonumber(value)
    if not value then return fallback end
    return math.max(minimum, math.min(maximum, value))
end

local function ResolveClickConfig(click, key, defaultId)
    local config = type(click) == "table" and click[key] or nil
    local defaults = DEFAULT_PROFILE.hearthstone and DEFAULT_PROFILE.hearthstone.click
    if type(config) ~= "table" and type(defaults) == "table" then
        config = defaults[key]
    end
    if type(config) ~= "table" then
        config = { random = false, itemId = defaultId }
    end
    return config
end

function Definition:GetProfile() return self.db and self.db.profile end
function Definition:IsAvailable() return self.available == true end
function Definition:IsInPetBattle() return self.petBattleActive or Adapter:IsPetBattleActive() end
function Definition:Print(message)
    if type(ns.Print) == "function" then return ns.Print(message) end
    if ns.RS and type(ns.RS.Print) == "function" then return ns.RS:Print(message) end
    return false
end

function Definition:SyncAssemblySwitch(enabled)
    if not ns.Assembly or type(ns.Assembly.SetModuleConfigured) ~= "function" then return false end
    return ns.Assembly:SetModuleConfigured("TopBar", enabled and true or false)
end

function Definition:MigrateProfile()
    local profile = self:GetProfile()
    if not profile then return false end
    if profile.enabled == nil then profile.enabled = true end
    if not profile.independentMenuV1 then
        if profile.enabled == false then profile.micromenu.enabled = false end
        profile.independentMenuV1 = true
    end
    if profile.hideInPetBattle == nil then profile.hideInPetBattle = true end
    if Adapter.family == "retail" and profile.disableWhenSimilarAddon == nil then
        profile.disableWhenSimilarAddon = false
    end
    local key
    for key, default in pairs(DEFAULT_PROFILE) do
        if type(default) == "table" and type(profile[key]) == "table" and default.position then
            profile[key].position = Data:CopyPosition(profile[key].position, default.position)
        end
    end
    if Adapter.family == "retail" then
        profile.hearthstone = type(profile.hearthstone) == "table"
            and profile.hearthstone or {}
        if profile.hearthstone.enabled == nil then
            profile.hearthstone.enabled = DEFAULT_PROFILE.hearthstone.enabled
        end
        profile.hearthstone.fontSize = nil
        profile.hearthstone.click = type(profile.hearthstone.click) == "table"
            and profile.hearthstone.click or {}
        local clickDefaults = DEFAULT_PROFILE.hearthstone.click
        local clickIndex
        for clickIndex = 1, #Data.clickKeys do
            local clickKey = Data.clickKeys[clickIndex].key
            local current = profile.hearthstone.click[clickKey]
            local fallback = clickDefaults[clickKey]
            if type(current) ~= "table" then
                current = {}
                profile.hearthstone.click[clickKey] = current
            end
            if current.random == nil then current.random = fallback.random end
            if current.itemId == nil then current.itemId = fallback.itemId end
        end
    end
    local version = tonumber(profile.buttonLayoutVersion)
    if version ~= DEFAULT_PROFILE.buttonLayoutVersion then
        for _, keyName in ipairs(QUICK_KEYS) do
            local current = profile[keyName]
            local default = DEFAULT_PROFILE[keyName]
            if current and default then
                local enabled = current.enabled
                for field, value in pairs(default) do
                    if field ~= "enabled" and field ~= "click" then current[field] = type(value) == "table" and Data:CopyPosition(value, value) or value end
                end
                current.enabled = enabled == nil and default.enabled or enabled
            end
        end
        profile.buttonLayoutVersion = DEFAULT_PROFILE.buttonLayoutVersion
    end
    local menu = profile.micromenu
    local menuDefault = DEFAULT_PROFILE.micromenu
    if menu and tonumber(menu.layoutVersion) ~= menuDefault.layoutVersion then
        menu.layoutVersion = menuDefault.layoutVersion
        if menu.useClassColor == nil then menu.useClassColor = true end
        menu.size = menuDefault.size
        menu.spacing = menuDefault.spacing
        menu.rowSpacing = nil
        menu.position = Data:CopyPosition(menuDefault.position, menuDefault.position)
    end
    return true
end

function Definition:Initialize()
    self.adapter = Adapter
    self.topBarData = Data
    self.available = Adapter:IsAvailable()
    self.runtimeActive = false
    self.worldEntered = false
    self.petBattleActive = false
    self.isUnlocked = false
    self.secureDirty = false
    self.combatDeferred = false
    self.availableHearthstones = {}
    self.pendingItems = {}
    self.requestedItems = {}
    self.lastRandomByKey = {}
    self.lastRandomId = nil
    self.sharedCooldownItemId = nil
    self.detectRetries = 0
    self.microMenu = MicroMenu:New(self, Adapter, Data)
    self.fastFocusHub = FastFocusHub:New(self, Adapter, Data)
    self.view = View:New(self, Adapter, Data, self.microMenu)
    self.movement = Movement:New(self)
    self:MigrateProfile()
    Settings:Register(self)
    self:SyncAssemblySwitch(self:ShouldRun())
end

function Definition:ProfileChanged()
    self:MigrateProfile()
    return self:ReconcileRuntime()
end

function Definition:ShouldRun()
    local profile = self:GetProfile()
    return self.available and profile and (profile.enabled == true or profile.micromenu.enabled == true)
        and not self:HasWholeFeatureConflict()
end

function Definition:RegisterRuntimeEvents()
    self:RegisterEvent("ADDON_LOADED", self.ADDON_LOADED)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
    self:RegisterEvent("LOADING_SCREEN_DISABLED", self.LOADING_SCREEN_DISABLED)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.PLAYER_REGEN_DISABLED)
    self:RegisterEvent("PET_BATTLE_OPENING_START", self.PET_BATTLE_OPENING_START)
    self:RegisterEvent("PET_BATTLE_CLOSE", self.PET_BATTLE_CLOSE)
    if Adapter.family == "retail" and self:GetProfile().enabled then
        self:RegisterEvent("ITEM_DATA_LOAD_RESULT", self.ITEM_DATA_LOAD_RESULT)
        self:RegisterEvent("TOYS_UPDATED", self.TOYS_UPDATED)
        self:RegisterEvent("BAG_UPDATE_COOLDOWN", self.BAG_UPDATE_COOLDOWN)
        self:RegisterEvent("GROUP_ROSTER_UPDATE", self.GROUP_ROSTER_UPDATE)
        self:RegisterEvent("ZONE_CHANGED_NEW_AREA", self.GROUP_ROSTER_UPDATE)
        self:RegisterEvent("ACTIVE_PLAYER_SPECIALIZATION_CHANGED", self.GROUP_ROSTER_UPDATE)
    elseif Adapter.family == "retail" then
        -- Quick buttons were switched off while the module stays alive for the
        -- micro menu: drop their events without tearing down any frame.
        self:UnregisterEvent("ITEM_DATA_LOAD_RESULT")
        self:UnregisterEvent("TOYS_UPDATED")
        self:UnregisterEvent("BAG_UPDATE_COOLDOWN")
        self:UnregisterEvent("GROUP_ROSTER_UPDATE")
        self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
        self:UnregisterEvent("ACTIVE_PLAYER_SPECIALIZATION_CHANGED")
    end
end

function Definition:InstallRuntimeHooks()
    return Providers:InstallRuntimeHooks(self)
end

function Definition:ActivateRuntime()
    if self.runtimeActive or not self:ShouldRun() then return false end
    self.worldEntered = self.worldEntered or Adapter:IsLoggedIn()
    self.runtimeActive = true
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self.combatDeferred = true
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
        return true
    end
    self:RegisterRuntimeEvents()
    self:InstallRuntimeHooks()
    -- An error thrown here would make Runtime release every frame while the
    -- view still believes it owns them (scripts stripped, nothing rebinds).
    -- Keep the module alive and retry instead of failing the whole Enable.
    local ok, err = pcall(self.RefreshState, self)
    if not ok then
        self.secureDirty = true
        self._runtime:_ReportError(self, "Enable:RefreshState", err)
        self:RequestStateRefresh(1)
    end
    return true
end

-- Runtime only enters Enable after it released every resource this module
-- owned, so any ownership the view/hub/movement still remember is stale (for
-- example after an interrupted Disable). Forget it so frames rebind their
-- scripts instead of being treated as already active.
function Definition:ResetStaleOwnership()
    self.runtimeActive = false
    self.movement:ReleaseOwnership()
    self.fastFocusHub:ReleaseOwnership()
    self.view:ReleaseOwnership()
    return true
end

function Definition:Enable()
    if not self:ShouldRun() then return false end
    self:ResetStaleOwnership()
    return self:ActivateRuntime()
end

function Definition:SuspendRuntime()
    self.runtimeActive = false
    self.worldEntered = false
    self.secureDirty = false
    self.combatDeferred = false
    self.isUnlocked = false
    self:StopTimeDrivers()
    self:CancelRefresh("topbar-state")
    self:CancelRefresh("topbar-detect")
    self:CancelRefresh("topbar-detect-retry")
    self.requestedItems = {}
    self:CancelRefresh("topbar-role")
    self:CancelRefresh("topbar-cooldown-0.2")
    self:CancelRefresh("topbar-cooldown-1")
    self.movement:ReleaseOwnership()
    self.fastFocusHub:ReleaseOwnership()
    self.view:HideAll()
    self.view:ReleaseOwnership()
    Adapter:RefreshBlizzardMenuTakeover()
    return true
end

function Definition:Disable() return self:SuspendRuntime() end

function Definition:ShouldHideForPetBattle()
    local profile = self:GetProfile()
    return not self.isUnlocked and profile and profile.hideInPetBattle and self:IsInPetBattle() or false
end

function Definition:HasWholeFeatureConflict()
    -- Compatibility method: UI conflicts no longer suspend independent quick buttons.
    return false
end

function Definition:HasMicroMenuConflict()
    local profile = self:GetProfile()
    return profile and Providers:ShouldHideMicroMenu(profile, self) or false
end

function Definition:ReconcileRuntime()
    if self:ShouldRun() then
        if self:IsEnabled() then
            if not self.runtimeActive then
                if Adapter:IsLoggedIn() then self.worldEntered = true end
                return self:ActivateRuntime()
            end
            return self:RequestStateRefresh(0)
        end
        if Adapter:IsLoggedIn() then self.worldEntered = true end
        return self:Enable()
    end
    if not self.runtimeActive then return true end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self.combatDeferred = true
        return false
    end
    if self:IsEnabled() then return self:Disable() end
    return true
end

function Definition:IsComponentVisible(key)
    local profile = self:GetProfile()
    if not self.runtimeActive or not profile or self:HasWholeFeatureConflict() then return false end
    if self:ShouldHideForPetBattle() then return false end
    if key == "micromenu" then
        return (self.isUnlocked or profile.micromenu.enabled)
            and not self:HasMicroMenuConflict()
    end
    if not profile.enabled then return false end
    if key == "automark" and not Adapter:SupportsAutoMark() then return false end
    local component = profile[key]
    return self.isUnlocked or component and component.enabled == true or false
end

function Definition:IsRoleMarkerVisible()
    if not ns.Build.HasModule("FastFocus") and not ns.Build.HasModule("RoleMarker") then return false end
    local profile = self:GetProfile()
    if not self.runtimeActive or not profile or not profile.enabled or self:HasWholeFeatureConflict() then return false end
    if self:ShouldHideForPetBattle() then return false end
    local roleMarker = type(profile.rolemarker) == "table" and profile.rolemarker or nil
    local roleMarkerEnabled = not roleMarker or roleMarker.enabled ~= false
    return self.isUnlocked or roleMarkerEnabled and self.fastFocusHub:IsButtonVisible()
end

-- Ownership requires the live replacement, not merely a saved enable flag.
function Definition:IsMicroMenuTakeoverActive()
    local profile = self:GetProfile()
    local menu = self.microMenu
    local frame = menu and menu.frame
    return self.runtimeActive == true and profile ~= nil
        and profile.micromenu.enabled == true
        and not self:HasWholeFeatureConflict() and not self:ShouldHideForPetBattle()
        and not self:HasMicroMenuConflict()
        and menu.active == true and frame ~= nil and type(frame.IsShown) == "function" and frame:IsShown() == true
end

local function IsSecretValue(value)
    return type(Adapter.IsSecretValue) == "function" and Adapter:IsSecretValue(value) or false
end

local function GetCurrentTime()
    if type(Adapter.GetTime) == "function" then return Adapter:GetTime() end
    return type(_G.GetTime) == "function" and (tonumber(_G.GetTime()) or 0) or 0
end

function Definition:GetAddonProfileViewData()
    if not self.runtimeActive or not self:GetProfile().enabled then return { visible = false } end
    local module = Adapter.family == "retail" and Adapter:GetAddonProfileModule() or nil
    local profile = module and type(module.GetProfileDB) == "function" and module:GetProfileDB()
        or module and module.db and module.db.profile
    if not profile or profile.enabled == false or profile.showSwitchButton == false then return { visible = false } end
    local currentId = profile.currentId
    local label = type(module.GetProfileDisplayName) == "function" and module:GetProfileDisplayName(currentId) or nil
    -- Keep the fixed 90px button readable; the settings page shows the target name.
    if module.reloadPending then label = "待重载" end
    return { visible = true, label = label or "自定义", position = self:GetProfile().addonprofile.position }
end

function Definition:GetAddonProfileMenuItems()
    local module = Adapter.family == "retail" and Adapter:GetAddonProfileModule() or nil
    if not module or type(module.ListProfiles) ~= "function" then return nil end
    local result = {}
    local _, profile
    for _, profile in ipairs(module:ListProfiles()) do
        result[#result + 1] = {
            id = profile.id,
            label = profile.displayName or profile.name or profile.id,
        }
    end
    result[#result + 1] = { id = "__manage", label = "管理预设" }
    return result
end

function Definition:ApplyAddonProfile(id, anchor)
    local module = Adapter:GetAddonProfileModule()
    if not module then return false end
    if id == "__manage" then
        return ns.UI and type(ns.UI.OpenMain) == "function" and ns.UI:OpenMain("addonprofile") or false
    end
    local apply = module.RequestApply or module.Apply
    if type(apply) ~= "function" then return false end
    local ok, result = pcall(apply, module, id, anchor)
    if ok and result ~= false then self:RequestRefresh("topbar-addonprofile-label", self.RefreshAddonProfileLabel, 0.1) end
    return ok and result ~= false
end

function Definition:RefreshAddonProfileLabel()
    local record = self.view and self.view.records.addonprofile
    if not (record and record.text) then return false end
    local data = self:GetAddonProfileViewData()
    Call(record.text, "SetText", data.label or "自定义")
    return true
end

-- Existing AddonProfile login detection and v3 callers use the old method
-- name. Keep one narrow alias while the canonical implementation stays here.
function Definition:RefreshAddonProfileButton()
    return self:RefreshAddonProfileLabel()
end

-- Only existing frames are touched; no driver or resource is added. Protected
-- geometry waits for the existing PLAYER_REGEN_ENABLED refresh during combat.
function Definition:RefreshClamp()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then self.secureDirty = true return false end
    local clamped = Adapter:ShouldClampToScreen()
    for _, record in pairs(self.view.records) do
        if record.active then Call(record.frame, "SetClampedToScreen", clamped) end
    end
    if self.microMenu.active then Call(self.microMenu.frame, "SetClampedToScreen", clamped) end
    return true
end

function Definition:RefreshState()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then self.secureDirty = true self.combatDeferred = true return false end
    if self:HasWholeFeatureConflict() then return self:ReconcileRuntime() end
    self.secureDirty = false
    self.combatDeferred = false
    local profile = self:GetProfile()
    local index
    for index = 1, #QUICK_KEYS do
        local key = QUICK_KEYS[index]
        self.view:ShowComponent(key, self:IsComponentVisible(key), profile[key], DEFAULT_PROFILE[key])
    end
    self.view:ShowComponent("micromenu", self:IsComponentVisible("micromenu"), profile.micromenu, DEFAULT_PROFILE.micromenu)
    if ns.Build.HasModule("FastFocus") or ns.Build.HasModule("RoleMarker") then
        self.view:ShowComponent("rolemarker", self:IsRoleMarkerVisible())
    end
    if Adapter.family == "retail" then
        local addonProfile = self:GetAddonProfileViewData()
        self.view:ShowComponent("addonprofile", addonProfile.visible == true)
    end
    if self:IsComponentVisible("hearthstone") then
        self:ConfigureHearthstone()
        self:UpdateHearthstoneCooldown()
    end
    if self.worldEntered and self:IsComponentVisible("micromenu") then self:StartTimeDrivers() else self:StopTimeDrivers() end
    self:RefreshClamp()
    if self.isUnlocked then self.movement:SetUnlocked(true) end
    Adapter:RefreshBlizzardMenuTakeover()
    self:RecordRefresh()
    return true
end

function Definition:RequestStateRefresh(delay)
    if not self.runtimeActive then return false end
    self:RequestRefresh("topbar-state", self.RefreshState, delay or 0.05)
    return true
end

function Definition:OnExternalBarRefresh() return self:RequestStateRefresh(0.05) end
function Definition:PLAYER_ENTERING_WORLD()
    -- A loading screen can outlast font warmup. Re-arm it after entering the
    -- world instead of leaving a blank clock until the next 30-second tick.
    self:StopTimeDrivers()
    self.worldEntered = true
    self:RequestStateRefresh(0)
    if Adapter.family == "retail" and self:GetProfile().enabled then self:RequestRefresh("topbar-detect", self.DetectHearthstones, 2) end
end
function Definition:LOADING_SCREEN_DISABLED()
    -- Font metrics may be available before the loading screen has finished.
    -- Refresh only the clock here; avoid relayout and secure button writes.
    if not (self.runtimeActive and self.worldEntered and self:IsComponentVisible("micromenu")) then return end
    self:StopTimeDrivers()
    self:StartTimeDrivers()
end
function Definition:ADDON_LOADED(_, name)
    if Providers:ShouldRefreshForAddon(name) then
        if self:HasWholeFeatureConflict() then return self:ReconcileRuntime() end
        self:InstallRuntimeHooks()
        self:RequestStateRefresh(0.05)
    end
end
function Definition:BAG_UPDATE_COOLDOWN() return self:RequestCooldownRefresh(0.05) end
function Definition:ITEM_DATA_LOAD_RESULT(_, itemID, success)
    if not self.runtimeActive or not self:GetProfile().enabled or not success
        or self.pendingItems[itemID] == nil then return false end
    return self:RequestRefresh("topbar-detect-retry", self.RetryHearthstoneInfo, 0)
end
function Definition:TOYS_UPDATED()
    if not self.runtimeActive or not self:GetProfile().enabled then return false end
    return self:RequestRefresh("topbar-detect", self.DetectHearthstones, 0.05)
end
function Definition:GROUP_ROSTER_UPDATE()
    self:RequestRefresh("topbar-role", self.RefreshRoleMarker, 0.05)
end
function Definition:PET_BATTLE_OPENING_START()
    self.petBattleActive = true
    return self:RequestStateRefresh(0)
end
function Definition:PET_BATTLE_CLOSE()
    self.petBattleActive = false
    return self:RequestStateRefresh(0)
end
function Definition:PLAYER_REGEN_DISABLED()
    self.secureDirty = true
    self.fastFocusHub:HideMenu("combat")
    return true
end
-- A queued PLAYER_REGEN_ENABLED can be delivered after the next pull already
-- started (chained pulls in Mythic+). Protected buttons cannot be hidden or
-- rebuilt in combat, so touching them then leaves them visible without their
-- scripts. Keep everything as it is and wait for the real exit from combat.
function Definition:RetryAfterCombat()
    if Adapter:IsInCombat() then return false end
    return self:PLAYER_REGEN_ENABLED()
end

function Definition:PLAYER_REGEN_ENABLED()
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self.combatDeferred = true
        -- One bounded retry for a stale lockdown flag; never re-armed.
        self:RequestRefresh("topbar-post-combat", self.RetryAfterCombat, 0.25)
        return false
    end
    self:CancelRefresh("topbar-post-combat")
    local wasDeferred = self.combatDeferred
    self.combatDeferred = false
    self._combatWarned = false
    local ok, reason
    if not self:ShouldRun() then
        self:SyncAssemblySwitch(false)
        ok, reason = ns.Assembly and ns.Assembly:SetModuleEnabled("TopBar", false) or self:Disable()
    elseif self:HasWholeFeatureConflict() then
        ok, reason = self:ReconcileRuntime()
    elseif not self.runtimeActive then
        ok, reason = self:ActivateRuntime()
    else
        -- Re-apply deferred switches in place. A full Disable/Enable here used
        -- to strip and rebuild every button after each pull.
        if wasDeferred then
            self:RegisterRuntimeEvents()
            self:InstallRuntimeHooks()
        end
        ok, reason = self:RefreshState()
    end
    if ns.UI and type(ns.UI.RefreshNavigationSwitch) == "function" then
        ns.UI:RefreshNavigationSwitch("topBar")
    end
    return ok, reason
end

function Definition:WarnCombatLocked(message)
    if self._combatWarned then return false end
    self._combatWarned = true
    self:Print(message or "战斗中不可修改顶部快捷按钮，请脱战后再试。")
    return true
end

function Definition:SetEnabled(enabled)
    enabled = enabled and true or false
    local profile = self:GetProfile()
    if not profile then return false end
    profile.enabled = enabled
    if not self.available then self:SyncAssemblySwitch(false) return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self.combatDeferred = true
        self:WarnCombatLocked()
        if enabled and not self:IsEnabled() then
            self:SyncAssemblySwitch(true)
            return ns.Assembly and ns.Assembly:SetModuleEnabled("TopBar", true) or false
        end
        return true
    end
    local wanted = self:ShouldRun()
    if self:IsEnabled() then ns.Runtime:DisableModule(self) end
    self:SyncAssemblySwitch(wanted)
    if ns.Assembly and type(ns.Assembly.SetModuleEnabled) == "function" then
        local ok, reason = ns.Assembly:SetModuleEnabled("TopBar", wanted)
        if not ok then return ok, reason end
    end
    if wanted and self:IsEnabled() then
        if not self.runtimeActive then self:ActivateRuntime() end
        return self:RequestStateRefresh(0)
    end
    return true
end

function Definition:SetComponentEnabled(key, enabled)
    local profile = self:GetProfile()
    local component = profile and profile[key]
    if not component then return false end
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    component.enabled = enabled and true or false
    if key == "micromenu" then
        local wanted = self:ShouldRun()
        if self:IsEnabled() then ns.Runtime:DisableModule(self) end
        self:SyncAssemblySwitch(wanted)
        local ok, reason = ns.Assembly:SetModuleEnabled("TopBar", wanted)
        if not ok then return false, reason end
    end
    self:RequestStateRefresh(0)
    Adapter:RefreshBlizzardMenuTakeover()
    return true
end

function Definition:SetSetting(key, value)
    local profile = self:GetProfile()
    if not profile then return false end
    if key == "enabled" then return self:SetEnabled(value) end
    if key == "hideInPetBattle" then
        profile[key] = value and true or false
        return self:RequestStateRefresh(0)
    end
    if key == "disableWhenSimilarAddon" then
        if Adapter:IsInCombat() then
            self.secureDirty, self.combatDeferred = true, true
            return false
        end
        profile[key] = value and true or false
        return self:ReconcileRuntime()
    end
    return false
end

function Definition:SetComponentSetting(componentKey, settingKey, value)
    local component = self:GetProfile()[componentKey]
    if not component then return false end
    if componentKey == "hearthstone" and settingKey == "fontSize" then return false end
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    if settingKey == "size" then value = Clamp(value, 24, 56, DEFAULT_PROFILE.micromenu.size)
    elseif settingKey == "spacing" then value = Clamp(value, -20, 20, DEFAULT_PROFILE.micromenu.spacing)
    elseif settingKey == "width" then value = Clamp(value, 19, 150, DEFAULT_PROFILE[componentKey].width)
    elseif settingKey == "height" then value = Clamp(value, 19, 60, DEFAULT_PROFILE[componentKey].height)
    elseif settingKey == "fontSize" then value = Clamp(value, 10, 30, DEFAULT_PROFILE[componentKey].fontSize or 18)
    elseif settingKey == "useClassColor" or settingKey == "disableWhenNDuiMenu"
        or settingKey == "disableWhenWindToolsGameBar" or settingKey == "showGroupFinder" or settingKey == "showStore" then
        value = value and true or false
    end
    component[settingKey] = value
    self:RequestStateRefresh(0)
    return true
end

function Definition:GetHearthstoneClickValue(key)
    local click = self:GetProfile().hearthstone.click
    for _, row in ipairs(Data.clickKeys) do
        if row.key == key then
            local config = ResolveClickConfig(click, key, row.defaultId)
            return config.random and "random" or tostring(config.itemId or row.defaultId)
        end
    end
end

function Definition:GetHearthstoneClickOptions()
    local options, order = Data:BuildDropdown(self.availableHearthstones)
    options.random = "随机炉石"
    table.insert(order, 1, "random")
    -- Keep saved/default selections readable while item information is pending.
    for _, row in ipairs(Data.clickKeys) do
        local config = ResolveClickConfig(self:GetProfile().hearthstone.click, row.key, row.defaultId)
        local id = tonumber(config.itemId) or row.defaultId
        local key = tostring(id)
        if not options[key] then
            local name = Adapter:GetItemInfo(id)
            options[key] = name or FALLBACK_NAMES[id] or "炉石名称加载中"
            order[#order + 1] = key
        end
    end
    return options, order
end

function Definition:SetHearthstoneClick(key, value)
    if Adapter.family ~= "retail" then return false end
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    local row
    for _, candidate in ipairs(Data.clickKeys) do
        if candidate.key == key then row = candidate break end
    end
    if not row then return false end
    local options = self:GetHearthstoneClickOptions()
    if not options[value] then return false end
    self:MigrateProfile()
    local config = self:GetProfile().hearthstone.click[key]
    config.random = value == "random"
    if not config.random then config.itemId = tonumber(value) end
    self:RequestStateRefresh(0)
    return true
end

function Definition:BuildMacroText(config, defaultId, clickKey)
    config = type(config) == "table" and config or { random = false, itemId = defaultId }
    if config.random and Adapter.family == "retail" then
        local previous = clickKey and self.lastRandomByKey[clickKey] or self.lastRandomId
        local id = tonumber(Data:ChooseRandom(self.availableHearthstones, previous))
            or tonumber(config.itemId) or tonumber(defaultId)
            or tonumber(Data.constants.hearthstoneId) or 6948
        self.lastRandomId = id
        if clickKey then self.lastRandomByKey[clickKey] = id end
        local argument = clickKey and string.format("%q", clickKey) or ""
        return "/use item:" .. id .. "\n/run RS_RefreshHearthstone(" .. argument .. ")"
    end
    return "/use item:" .. (tonumber(config.itemId) or defaultId)
end

function Definition:ConfigureHearthstone(randomOnly, clickKey)
    if Adapter:IsInCombat() then self.secureDirty = true return false end
    local record = self.view.records.hearthstone
    if not record then return false end
    self:MigrateProfile()
    local profile = self:GetProfile()
    local click = profile and profile.hearthstone and profile.hearthstone.click or {}
    local index
    if Adapter.family == "classic" then
        Call(record.frame, "SetAttribute", "type1", "macro")
        Call(record.frame, "SetAttribute", "macrotext1", "/use item:" .. Data.constants.hearthstoneId .. "\n/run RS_RefreshHearthstone()")
        return true
    end
    for index = 1, #Data.clickKeys do
        local row = Data.clickKeys[index]
        local config = ResolveClickConfig(click, row.key, row.defaultId)
        if (not clickKey or clickKey == row.key) and (not randomOnly or config.random) then
            Call(record.frame, "SetAttribute", "type" .. row.attribute, "macro")
            Call(record.frame, "SetAttribute", "macrotext" .. row.attribute, self:BuildMacroText(config, row.defaultId, row.key))
        end
    end
    return true
end

function Definition:RefreshRandomHearthstone(clickKey)
    if not self:IsEnabled() or not self.runtimeActive then return false end
    if Adapter:IsInCombat() then self.secureDirty = true return false end
    return self:ConfigureHearthstone(true, clickKey)
end

function Definition:RequestHearthstoneInfo(id)
    if self.requestedItems[id] then return end
    self.requestedItems[id] = true
    if Adapter.RequestItemInfo then Adapter:RequestItemInfo(id) end
end

function Definition:DetectHearthstones()
    if Adapter.family ~= "retail" or not self.runtimeActive or not self:GetProfile().enabled then return false end
    local available = self.availableHearthstones
    local pending = self.pendingItems
    self.sharedCooldownItemId = nil
    for id in pairs(available) do available[id] = nil end
    for id in pairs(pending) do pending[id] = nil end
    local index
    for index = 1, #Data.hearthstoneIds do
        local id = Data.hearthstoneIds[index]
        local toy = Adapter:PlayerHasToy(id)
        local owned = Adapter:GetItemCount(id) >= 1 or toy
        local usable = not toy or Adapter:IsToyUsable(id)
        if owned then
            if usable and not self.sharedCooldownItemId and not Data.randomExcluded[id] then
                self.sharedCooldownItemId = id
            end
            local name, icon = Adapter:GetItemInfo(id)
            available[id] = { name = name or FALLBACK_NAMES[id] or "炉石名称加载中", icon = icon, usable = usable }
            if not name then
                pending[id] = 0
                self:RequestHearthstoneInfo(id)
            end
        end
    end
    if not available[6948] then
        local name, icon = Adapter:GetItemInfo(6948)
        available[6948] = { name = name or "炉石", icon = icon or 135101 }
        if not name then pending[6948] = 0 self:RequestHearthstoneInfo(6948) end
    end
    self.sharedCooldownItemId = self.sharedCooldownItemId or Data.constants.hearthstoneId
    if next(pending) then self:RequestRefresh("topbar-detect-retry", self.RetryHearthstoneInfo, 1) end
    self:ConfigureHearthstone()
    return true
end

function Definition:RetryHearthstoneInfo()
    if not self.runtimeActive or not self:GetProfile().enabled then return false end
    local stillPending = {}
    local retry = false
    local id
    local retries
    for id, retries in pairs(self.pendingItems) do
        local name, icon = Adapter:GetItemInfo(id)
        if name then
            local info = self.availableHearthstones[id] or {}
            info.name, info.icon = name, icon
            self.availableHearthstones[id] = info
        else
            stillPending[id] = math.min(retries + 1, 5)
            if retries < 5 then retry = true end
        end
    end
    self.pendingItems = stillPending
    if retry then self:RequestRefresh("topbar-detect-retry", self.RetryHearthstoneInfo, 1) end
    self:ConfigureHearthstone()
    return true
end

function Definition:GetSharedCooldown()
    local itemId = tonumber(self.sharedCooldownItemId) or Data.constants.hearthstoneId
    local start, duration = Adapter:GetItemCooldown(itemId)
    return start, duration, itemId
end

-- Compatibility alias for the previous runtime API. Random hearthstone
-- appearances share one cooldown; comparing every item is both unnecessary
-- and unsafe when the client returns secret values.
function Definition:GetShortestCooldown()
    return self:GetSharedCooldown()
end

function Definition:UpdateHearthstoneCooldown(cooldownOnly)
    if not self:IsComponentVisible("hearthstone") then return false end
    local profile = self:GetProfile() or {}
    local hearthstone = type(profile.hearthstone) == "table" and profile.hearthstone or {}
    local left = ResolveClickConfig(hearthstone.click, "left", 6948)
    local itemId = Adapter.family == "retail" and (tonumber(left.itemId) or 6948) or 6948
    local start, duration, icon
    if Adapter.family == "retail" and left.random then
        start, duration = self:GetSharedCooldown()
    else
        start, duration = Adapter:GetItemCooldown(itemId)
    end
    if IsSecretValue(start) or IsSecretValue(duration) then return false end
    -- Cooldown events do not change the selected item's icon. Keep only the
    -- successfully resolved current ID; missing item data is retried as before.
    local resolvedIcon
    if not cooldownOnly or self.cooldownIconItemId ~= itemId then
        resolvedIcon = Adapter.family == "classic" and Data.constants.hearthstoneTexture
            or Adapter:GetItemIcon(itemId)
        icon = resolvedIcon
        if not icon then
            local info = self.availableHearthstones[itemId]
            icon = info and info.icon or Data.constants.hearthstoneTexture
        end
    end
    local updated = self.view:UpdateCooldown(start, duration, icon)
    if updated and icon then self.cooldownIconItemId = resolvedIcon and itemId or nil end
    return updated
end

local function RefreshCooldownOnly(module)
    return module:UpdateHearthstoneCooldown(true)
end

function Definition:RequestCooldownRefresh(delay)
    if not self:IsComponentVisible("hearthstone") then return false end
    local key = delay and delay >= 0.9 and "topbar-cooldown-1" or "topbar-cooldown-0.2"
    self:RequestRefresh(key, RefreshCooldownOnly, delay or 0)
    return true
end

local function FormatCooldownRemaining(seconds)
    local total = math.max(0, math.ceil(tonumber(seconds) or 0))
    local hours = math.floor(total / 3600)
    local minutes = math.floor((total % 3600) / 60)
    local secs = total % 60
    if hours > 0 then return string.format("%d小时%02d分", hours, minutes) end
    if minutes > 0 then return string.format("%d分%02d秒", minutes, secs) end
    return string.format("%d秒", secs)
end

function Definition:ColorPlayerClassText(text)
    local r, g, b = Adapter:GetPlayerClassColor()
    local function Byte(value)
        return math.max(0, math.min(255, math.floor((tonumber(value) or 1) * 255 + 0.5)))
    end
    return string.format("|cff%02x%02x%02x%s|r", Byte(r), Byte(g), Byte(b), tostring(text))
end

function Definition:BuildHearthstoneTooltip()
    if Adapter.family == "classic" then return "|cffffffff左键：|r" .. self:ColorPlayerClassText("炉石") end
    local profile = self:GetProfile() or {}
    local hearthstone = type(profile.hearthstone) == "table" and profile.hearthstone or {}
    local click = type(hearthstone.click) == "table" and hearthstone.click or {}
    local function Describe(config, defaultId)
        config = type(config) == "table" and config or { random = false, itemId = defaultId }
        if config.random then return "随机炉石" end
        local id = tonumber(config.itemId) or defaultId
        local info = self.availableHearthstones[id]
        return info and info.name or FALLBACK_NAMES[id] or ("物品 #" .. id)
    end
    local record = self.view and self.view.records.hearthstone
    local remaining = record and ((tonumber(record.cooldownStart) or 0)
        + (tonumber(record.cooldownDuration) or 0) - GetCurrentTime()) or 0
    local cooldown = remaining > 0 and FormatCooldownRemaining(remaining) or "就绪"
    return "|cffffffff左：|r" .. self:ColorPlayerClassText(Describe(ResolveClickConfig(click, "left", 6948), 6948))
        .. "\n|cffffffff右：|r" .. self:ColorPlayerClassText(Describe(ResolveClickConfig(click, "right", 140192), 140192))
        .. "\n|cffffffff中：|r" .. self:ColorPlayerClassText(Describe(ResolveClickConfig(click, "middle", 253629), 253629))
        .. "\n\n|cffffffff炉石：|r" .. self:ColorPlayerClassText(cooldown)
end

function Definition:OpenRoleMarkerSettings()
    return Adapter:OpenRoleMarkerSettings()
end

function Definition:ConfigureRoleMarker()
    return self.fastFocusHub:Refresh()
end

function Definition:RefreshRoleMarker()
    if not self.runtimeActive then return false end
    if Adapter:IsInCombat() then
        self.secureDirty = true
        self.fastFocusHub:HideMenu("combat")
        return false
    end
    return self.view:ShowComponent("rolemarker", self:IsRoleMarkerVisible())
end

function Definition:RequestRoleMarkerButtonUpdate()
    return self:RefreshRoleMarker()
end

function Definition:UpdateRoleMarkerButton()
    return self:RefreshRoleMarker()
end

function Definition:StartTimeDrivers()
    if self.timeTicker then return true end
    if not self.timeTicker then self.timeTicker = self:ScheduleRepeating(30, self.UpdateMicroMenuTime, "TopBar clock") end
    self:RequestRefresh("topbar-time-now", self.UpdateMicroMenuTime, 0)
    self:RequestRefresh("topbar-time-half", self.UpdateMicroMenuTime, 0.5)
    self:RequestRefresh("topbar-time-two", self.UpdateMicroMenuTime, 2)
    if not self.fontWarmupTicker then
        self.fontWarmupStarted = type(_G.GetTime) == "function" and _G.GetTime() or 0
        self.fontWarmupTicker = self:ScheduleRepeating(0.2, self.WarmTimeFont, "TopBar time font warmup")
    end
    return true
end

function Definition:StopTimeDrivers()
    if self.timeTicker then self:CancelSchedule(self.timeTicker) self.timeTicker = nil end
    if self.fontWarmupTicker then self:CancelSchedule(self.fontWarmupTicker) self.fontWarmupTicker = nil end
    self:CancelRefresh("topbar-time-now")
    self:CancelRefresh("topbar-time-half")
    self:CancelRefresh("topbar-time-two")
end

function Definition:UpdateMicroMenuTime() return self.microMenu:UpdateTime() end
function Definition:WarmTimeFont()
    self.microMenu:UpdateTime()
    local record = self.microMenu.records.time
    local width = record and record.text and Call(record.text, "GetStringWidth") or 0
    local now = type(_G.GetTime) == "function" and _G.GetTime() or 8
    if (tonumber(width) or 0) > 0 or now - (self.fontWarmupStarted or 0) >= 8 then
        if self.fontWarmupTicker then self:CancelSchedule(self.fontWarmupTicker) self.fontWarmupTicker = nil end
    end
end

function Definition:SetUnlocked(unlocked)
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    self.isUnlocked = unlocked and true or false
    self:RefreshState()
    return self.movement:SetUnlocked(self.isUnlocked)
end
function Definition:ToggleAnchor() return self:SetUnlocked(not self.isUnlocked) end
function Definition:OpenSettings(key)
    return ns.UI and type(ns.UI.OpenMain) == "function"
        and ns.UI:OpenMain(key == "micromenu" and "micro-menu" or "topBar") or false
end

function Definition:SaveButtonPosition(key)
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    local frame = self.view:GetMovableFrames()[key]
    local component = self:GetProfile()[key]
    if key == "micromenu" then component = self:GetProfile().micromenu end
    if not (frame and component) then return false end
    local point, _, relativePoint, x, y = Call(frame, "GetPoint", 1)
    component.position = { point = point or "CENTER", relativePoint = relativePoint or "CENTER", x = x or 0, y = y or 0 }
    return true
end

function Definition:ResetPositions(scope)
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    local profile = self:GetProfile()
    local key
    for key, default in pairs(DEFAULT_PROFILE) do
        if (not scope or (scope == "micromenu") == (key == "micromenu"))
            and type(default) == "table" and default.position and profile[key] then
            rawset(profile[key], "position", nil)
        end
    end
    local refreshed = self:RequestStateRefresh(0)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return refreshed
end

function Definition:ResetDefaults(scope)
    if Adapter:IsInCombat() then self:WarnCombatLocked() return false end
    local fresh = Data:GetDefaults(Adapter.family).profile
    local profile = self:GetProfile()
    local key
    for key in pairs(profile) do
        if not scope or (scope == "micromenu") == (key == "micromenu") then profile[key] = nil end
    end
    for key, value in pairs(fresh) do
        if not scope or (scope == "micromenu") == (key == "micromenu") then profile[key] = value end
    end
    local refreshed = self:RequestStateRefresh(0)
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return refreshed
end

function Definition:GetDiagnostics()
    local pending = 0
    for _ in pairs(self.pendingItems) do pending = pending + 1 end
    return {
        available = self.available,
        family = Adapter.family,
        buildId = Adapter.buildId,
        runtimeActive = self.runtimeActive,
        unlocked = self.isUnlocked,
        secureDirty = self.secureDirty,
        combatDeferred = self.combatDeferred,
        pendingItems = pending,
        availableHearthstones = (function() local count = 0 for _ in pairs(self.availableHearthstones) do count = count + 1 end return count end)(),
        view = self.view:GetDiagnostics(),
        movement = self.movement:GetDiagnostics(),
    }
end

-- Explicit snapshot only: no event history, polling, frame creation or secure writes.
function Definition:CaptureInteractionSnapshot()
    local snapshot = self:GetDiagnostics()
    snapshot.enabled = self:IsEnabled()
    snapshot.combat = Adapter:IsInCombat()
    snapshot.petBattle = self:IsInPetBattle()
    snapshot.frames = {}
    local function capture(key, frame, active)
        if not frame then return end
        local parent = Call(frame, "GetParent")
        local row = {
            active = active == true,
            shown = Call(frame, "IsShown"), visible = Call(frame, "IsVisible"),
            mouse = Call(frame, "IsMouseEnabled"),
            parentShown = Call(parent, "IsShown"),
            strata = Call(frame, "GetFrameStrata"), level = Call(frame, "GetFrameLevel"),
            click = type(Call(frame, "GetScript", "OnClick")) == "function",
            enter = type(Call(frame, "GetScript", "OnEnter")) == "function",
            postClick = type(Call(frame, "GetScript", "PostClick")) == "function",
        }
        snapshot.frames[key] = row
    end
    for key, record in pairs(self.view.records) do capture(key, record.frame, record.active) end
    local menu = self.view.microMenu
    capture("micromenu", menu.frame, menu.active)
    for key, record in pairs(menu.records) do capture("menu." .. tostring(key), record.frame, menu.active) end
    for key, overlay in pairs(self.movement.overlays) do capture("overlay." .. key, overlay, self.isUnlocked) end
    return snapshot
end

local module, reason = ns.RegisterModule("TopBar", Definition)
if module then
    ns.TopBar = module
    ns.TopBarDefinition = Definition
    _G.RS_TopBarSnapshot = function()
        local snapshot = module:CaptureInteractionSnapshot()
        module:Print("TopBar enabled=" .. tostring(snapshot.enabled) .. " runtime=" .. tostring(snapshot.runtimeActive)
            .. " combat=" .. tostring(snapshot.combat) .. " deferred=" .. tostring(snapshot.combatDeferred)
            .. " unlocked=" .. tostring(snapshot.unlocked) .. " toys=" .. tostring(snapshot.availableHearthstones))
        for key, row in pairs(snapshot.frames) do
            module:Print(key .. " active=" .. tostring(row.active) .. " shown=" .. tostring(row.shown)
                .. " visible=" .. tostring(row.visible) .. " mouse=" .. tostring(row.mouse)
                .. " parent=" .. tostring(row.parentShown) .. " click=" .. tostring(row.click)
                .. " enter=" .. tostring(row.enter) .. " post=" .. tostring(row.postClick)
                .. " strata=" .. tostring(row.strata) .. " level=" .. tostring(row.level))
        end
        return snapshot
    end
    _G.RS_RefreshHearthstone = function(clickKey)
        if module:IsEnabled() then return module:RefreshRandomHearthstone(clickKey) end
        return false
    end
else
    ns.TopBarRegistrationError = reason
end
