local _, RS = ...

-- Assemble the shared move service and invoke Build-injected integration lifecycles.
local ClassicUI = RS.ClassicUI
-- Historical directory name only: MoveManager is one build-neutral Core service.
-- Retail/Classic module and third-party differences are injected by Build providers.
RS.MoveManagerCore = ClassicUI
if type(ClassicUI) ~= "table" or type(ClassicUI.TabRegistry) ~= "table"
    or type(ClassicUI.MoveProviderRegistry) ~= "table"
    or type(ClassicUI.ExternalMoveAdapter) ~= "table"
    or type(ClassicUI.MoveNudge) ~= "table"
    or type(ClassicUI.MoveOverlay) ~= "table"
    or type(ClassicUI.MoveManager) ~= "table"
    or type(ClassicUI.MoveManagerPage) ~= "table" then
    error("ClassicUI Core requires all ClassicUI services before it", 2)
end

ClassicUI.pendingMoveProviders = ClassicUI.pendingMoveProviders or {}
ClassicUI.pendingExternalProviders = ClassicUI.pendingExternalProviders or {}

local Definition = {
    defaultEnabled = true,
}

local function GetProfile()
    return RS.DB and RS.DB.profile or nil
end

local function GetModule(name)
    return RS.Runtime and RS.Runtime:GetModule(name) or nil
end

local function GetPlayerClass()
    if type(_G.UnitClass) ~= "function" then return nil end
    local _, class = _G.UnitClass("player")
    return class
end

local function Print(message)
    if type(RS.Print) == "function" then RS.Print(message) end
end

local function IsAutoMarkSupported()
    return RS.Compat and type(RS.Compat.IsAutoMarkSupported) == "function"
        and RS.Compat.IsAutoMarkSupported() or false
end

function Definition:Initialize()
    local system = RS.UISystem or (RS.UI and RS.UI.GetSystem and RS.UI:GetSystem())
    if not system then
        error("MoveManager requires RS.UI initialization before Assembly activation", 2)
    end
    self.system = system
    local module = self

    self.providerRegistry = ClassicUI.MoveProviderRegistry:New({
        getModule = GetModule,
        getPlayerClass = GetPlayerClass,
    })
    local index = 1
    while index <= #ClassicUI.pendingMoveProviders do
        self.providerRegistry:Register(ClassicUI.pendingMoveProviders[index])
        index = index + 1
    end

    local externalOptions = { print = Print }
    if ClassicUI.ExternalSettingsCapture then
        self.externalSettingsCapture = ClassicUI.ExternalSettingsCapture:New(self)
        self.externalSettingsCapture:ConfigureAdapter(externalOptions)
    end
    self.externalAdapter = ClassicUI.ExternalMoveAdapter:New(externalOptions)
    index = 1
    while index <= #ClassicUI.pendingExternalProviders do
        self.externalAdapter:Register(ClassicUI.pendingExternalProviders[index])
        index = index + 1
    end

    self.nudge = ClassicUI.MoveNudge:New(system, {
        parent = _G.UIParent,
        print = Print,
        getMainFrame = function()
            local mainWindow = system.mainWindow
            return mainWindow and mainWindow:GetFrame() or nil
        end,
        onDefaultSettings = function()
            system:OpenMain("movemanager")
        end,
        onDefaultLock = function()
            if module.manager then module.manager:SetRsMoveMode(false) end
        end,
    })
    self.manager = ClassicUI.MoveManager:New({
        providers = self.providerRegistry,
        external = self.externalAdapter,
        nudge = self.nudge,
        system = system,
        getProfile = GetProfile,
        print = Print,
        inCombat = _G.InCombatLockdown,
        onCombatDeferred = function()
            if type(module.RegisterEvent) == "function" then
                module:RegisterEvent("PLAYER_REGEN_ENABLED", module.PLAYER_REGEN_ENABLED)
            end
        end,
        allCommandMode = RS.Build.GetCapability("moveAllCommandMode", "toggle"),
        onStateChanged = function(moveMode, externalState)
            RS.isMoveMode = moveMode
            RS._extUnlockState = externalState
            if RS.OptionsPanel and type(RS.OptionsPanel._RefreshMoveButton) == "function" then
                RS.OptionsPanel:_RefreshMoveButton()
            end
        end,
    })

    local movePageRegistered = ClassicUI.MoveManagerPage:Register(system, self.manager)
    if not movePageRegistered then
        error("MoveManager page id is already registered", 2)
    end

    self.tabRegistry = ClassicUI.TabRegistry:New({
        openPage = function(pageId, container)
            return system:OpenPage(pageId, container)
        end,
        autoMarkSupported = IsAutoMarkSupported,
    })
    local valid, reason = self.tabRegistry:InstallDefaults()
    if not valid then error(reason, 2) end

    RS.TabRegistry = self.tabRegistry
    RS.MoveProviders = self.providerRegistry
    RS.ExternalMoveAdapter = self.externalAdapter
    RS.MoveNudge = self.nudge
    RS.MoveManager = self.manager
    RS.isMoveMode = false
    RS._extUnlockState = self.manager.externalState
end

function Definition:Enable()
    if self.externalSettingsCapture then self.externalSettingsCapture:Enable() end
end

function Definition:Disable()
    if self.externalSettingsCapture then self.externalSettingsCapture:Disable() end
    if type(self.UnregisterEvent) == "function" then self:UnregisterEvent("PLAYER_REGEN_ENABLED") end
    if self.manager then
        self.manager.pendingRsMoveMode = nil
        self.manager.pendingAllMove = nil
    end
    if self.nudge then self.nudge:Hide() end
    if self.manager and self.manager.isMoveMode then
        local modules = self.manager:GetRsMoveModules()
        local index = 1
        while index <= #modules do
            modules[index]:SetUnlocked(false)
            index = index + 1
        end
        self.manager.isMoveMode = false
        self.manager:NotifyStateChanged()
    end
    if self.manager then self.manager:LockExternalModules() end
end

function Definition:PLAYER_REGEN_ENABLED()
    if not self.manager then return false end
    local hadPending = self.manager.pendingRsMoveMode ~= nil or self.manager.pendingAllMove ~= nil
    local applied = self.manager:FlushPendingRsMoveMode()
    if self.manager.pendingRsMoveMode == nil and type(self.UnregisterEvent) == "function" then
        self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
    return hadPending and applied or false
end

function Definition:IsOffscreenDragEnabled()
    return self.manager and self.manager:IsOffscreenDragEnabled() or false
end

function Definition:SetAllowOffscreenDrag(enabled)
    if self.manager then self.manager:SetAllowOffscreenDrag(enabled) end
end

function Definition:ResetAllRsPositions()
    if self.manager then self.manager:ResetAllRsPositions() end
end

function Definition:GetRsMoveModules(result)
    return self.manager and self.manager:GetRsMoveModules(result) or {}
end

function Definition:SetRsMoveMode(unlocked)
    return self.manager and self.manager:SetRsMoveMode(unlocked) or false
end

function Definition:ToggleMarkerAnchors()
    return self.manager and self.manager:ToggleMarkerAnchors() or false
end

function Definition:OnMoveCommand(input)
    if self.manager then self.manager:OnMoveCommand(input) end
end

function Definition:OnMoveCommandAll()
    if self.manager then self.manager:OnMoveCommandAll() end
end

function Definition:TriggerExternalMoveCommands()
    return self.manager and self.manager:TriggerExternalMoveCommands() or 0
end

function Definition:OpenExternalSettings(id)
    return self.manager and self.manager:OpenExternalSettings(id) or false
end

function Definition:ToggleExternalMove(id)
    return self.manager and self.manager:ToggleExternal(id) or false
end

function Definition:SyncMoveModeButtons()
    if self.manager then self.manager:RefreshPage("sync-buttons") end
end

function Definition:DrawMoveManagerTab(container)
    return self.system and self.system:OpenPage("movemanager", container) or nil
end

function Definition:ShowMoveNudgeFrame(target, config)
    return self.nudge and self.nudge:Show(target, config) or nil
end

function Definition:HideMoveNudgeFrame()
    return self.nudge and self.nudge:Hide() or false
end

function Definition:RefreshMoveNudgeFrame(target)
    return self.nudge and self.nudge:Refresh(target) or false
end

function Definition:RegisterMoveProvider(provider)
    return self.providerRegistry and self.providerRegistry:Register(provider) or false
end

function Definition:RegisterExternalMoveProvider(provider)
    return self.externalAdapter and self.externalAdapter:Register(provider) or false
end

function Definition:GetClassicUIDiagnostics()
    return {
        manager = self.manager and self.manager:GetDiagnostics() or nil,
        providers = self.providerRegistry and self.providerRegistry:GetDiagnostics() or nil,
        external = self.externalAdapter and self.externalAdapter:GetDiagnostics() or nil,
        nudge = self.nudge and self.nudge:GetDiagnostics() or nil,
        tabs = self.tabRegistry and self.tabRegistry:GetDiagnostics() or nil,
    }
end

local module, reason = RS.RegisterModule("MoveManager", Definition)
if module then
    RS.MoveManagerModule = module

    function RS:IsOffscreenDragEnabled() return module:IsOffscreenDragEnabled() end
    function RS:SetAllowOffscreenDrag(enabled) return module:SetAllowOffscreenDrag(enabled) end
    function RS:ResetAllRsPositions() return module:ResetAllRsPositions() end
    function RS:GetRsMoveModules(result) return module:GetRsMoveModules(result) end
    function RS:SetRsMoveMode(unlocked) return module:SetRsMoveMode(unlocked) end
    function RS:ToggleMarkerAnchors() return module:ToggleMarkerAnchors() end
    function RS:OnMoveCommand(input) return module:OnMoveCommand(input) end
    function RS:OnMoveCommandAll() return module:OnMoveCommandAll() end
    function RS:TriggerExternalMoveCommands() return module:TriggerExternalMoveCommands() end
    function RS:SyncMoveModeButtons() return module:SyncMoveModeButtons() end
    function RS:OpenNDuiSettings() return module:OpenExternalSettings("ndui") end
    function RS:OpenCellSettings() return module:OpenExternalSettings("cell") end
    function RS:DrawMoveManagerTab(container) module:DrawMoveManagerTab(container) end
    function RS:RegisterMoveProvider(provider)
        if module.providerRegistry then return module:RegisterMoveProvider(provider) end
        ClassicUI.pendingMoveProviders[#ClassicUI.pendingMoveProviders + 1] = provider
        return true
    end
    function RS:RegisterExternalMoveProvider(provider)
        if module.externalAdapter then return module:RegisterExternalMoveProvider(provider) end
        ClassicUI.pendingExternalProviders[#ClassicUI.pendingExternalProviders + 1] = provider
        return true
    end
    function RS:UnregisterMoveProvider(name)
        if module.providerRegistry then return module.providerRegistry:Unregister(name) end
        for index = #ClassicUI.pendingMoveProviders, 1, -1 do
            if ClassicUI.pendingMoveProviders[index].name == name then table.remove(ClassicUI.pendingMoveProviders, index) end
        end
        return true
    end
    function RS:ShowMoveNudgeFrame(target, config) return module:ShowMoveNudgeFrame(target, config) end
    function RS:HideMoveNudgeFrame() module:HideMoveNudgeFrame() end
    function RS:RefreshMoveNudgeFrame(target) module:RefreshMoveNudgeFrame(target) end

    if RS.UI then
        function RS.UI:ShowMoveNudgeFrame(target, config) return module:ShowMoveNudgeFrame(target, config) end
        function RS.UI:HideMoveNudgeFrame() module:HideMoveNudgeFrame() end
        function RS.UI:RefreshMoveNudgeFrame(target) module:RefreshMoveNudgeFrame(target) end
    end
else
    RS.MoveManagerRegistrationError = reason
end
