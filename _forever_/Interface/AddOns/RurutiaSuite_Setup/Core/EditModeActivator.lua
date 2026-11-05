local _, ns = ...

local Activator = { status = "idle" }
ns.EditModeActivator = Activator

local function EnsureManager()
    local manager = _G.EditModeManagerFrame
    if type(manager) ~= "table" or type(manager.GetLayouts) ~= "function"
        or type(manager.layoutInfo) ~= "table" or type(manager.layoutInfo.activeLayout) ~= "number" then
        return nil, "edit-mode-manager-not-ready"
    end
    return manager
end

local function FindCanonicalLayout(manager)
    local layoutTypes = _G.Enum and _G.Enum.EditModeLayoutType
    local presetMeta = _G.Enum and _G.Enum.EditModePresetLayoutsMeta
    if type(layoutTypes) ~= "table" or type(presetMeta) ~= "table"
        or type(presetMeta.NumValues) ~= "number" then
        return nil, "edit-mode-enums-unavailable"
    end
    local ok, layouts = pcall(manager.GetLayouts, manager)
    if not ok or type(layouts) ~= "table" then return nil, "layout-state-unknown" end
    local foundIndex, foundLayout, count = nil, nil, 0
    local index, layout
    for index, layout in ipairs(layouts) do
        if type(layout) == "table" and layout.layoutName == ns.LayoutPolicy.CANONICAL_LAYOUT_NAME then
            if index <= presetMeta.NumValues or (layout.layoutType ~= layoutTypes.Account
                and layout.layoutType ~= layoutTypes.Character) then return nil, "canonical-layout-type-unsafe" end
            count = count + 1
            if not foundIndex then foundIndex, foundLayout = index, layout end
        end
    end
    if not foundIndex then return nil, "canonical-layout-missing" end
    if foundIndex <= presetMeta.NumValues or (foundLayout.layoutType ~= layoutTypes.Account
        and foundLayout.layoutType ~= layoutTypes.Character) then
        return nil, "canonical-layout-type-unsafe"
    end
    return { fullIndex = foundIndex, activeIndex = manager.layoutInfo.activeLayout, count = count }
end

local function Configured()
    local settings = ns.DB and ns.DB.global and ns.DB.global.automation
    return settings == nil or (settings.enabled ~= false and settings.editModeLayout ~= false)
end

function Activator:ActivateOnly()
    if not Configured() then self.status = "disabled" return true, self.status end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        if not self.pendingCombat then
            local token, reason = ns.EventHub and ns.EventHub:Subscribe(
                "PLAYER_REGEN_ENABLED", function()
                    ns.EventHub:Unsubscribe(self.regenToken)
                    self.regenToken = nil
                    self.pendingCombat = false
                    self:ActivateOnly()
                end)
            if not token then self.status = reason or "regen-event-registration-failed" return false, self.status end
            self.regenToken = token
            self.pendingCombat = true
        end
        self.status = "combat-pending"
        return false, self.status
    end
    local manager, managerReason = EnsureManager()
    if not manager then self.status = managerReason return false, managerReason end
    local blockReason = ns.LayoutPolicy:GetEditModeBlockReason(manager)
    if blockReason then
        self.status = blockReason
        return false, self.status
    end
    local layout, reason = FindCanonicalLayout(manager)
    if not layout then self.status = reason return false, reason end
    if layout.count > 1 then
        -- Login never deletes or chooses between duplicate layouts. An explicit
        -- one-click/single import repairs them through the importer transaction.
        self.status = "needs-reinstall"
        return true, self.status
    end
    if layout.activeIndex == layout.fullIndex then
        self.status = "already-active"
        return true, self.status
    end
    local api = _G.C_EditMode
    if type(api) ~= "table" or type(api.SetActiveLayout) ~= "function" then
        self.status = "edit-mode-api-unavailable"
        return false, self.status
    end
    local ok, setReason = pcall(api.SetActiveLayout, layout.fullIndex)
    if not ok then self.status = tostring(setReason) return false, self.status end
    local verified, verifyReason = FindCanonicalLayout(manager)
    if not verified or verified.activeIndex ~= verified.fullIndex then
        self.status = verifyReason or "layout-activation-readback-failed"
        return false, self.status
    end
    self.status = "activated"
    return true, self.status
end

function Activator:Enable(handle)
    if self.enabled then return true end
    self.handle = handle
    self.enabled = true
    local refreshed, reason = self:RefreshSubscriptions()
    if not refreshed then
        self.enabled = false
        self.handle = nil
        return false, reason
    end
    return true
end

function Activator:RefreshSubscriptions()
    if not self.enabled then return false end
    local wanted = Configured()
    if not wanted then
        if ns.EventHub then
            ns.EventHub:Unsubscribe(self.worldToken)
            ns.EventHub:Unsubscribe(self.specializationToken)
            ns.EventHub:Unsubscribe(self.regenToken)
        end
        self.worldToken = nil
        self.specializationToken = nil
        self.regenToken = nil
        self.pendingCombat = false
        self.status = "disabled"
        return true
    end
    if self.worldToken and self.specializationToken then return true end
    local world, worldReason = ns.EventHub:Subscribe("PLAYER_ENTERING_WORLD", function()
        self:ActivateOnly()
    end)
    if not world then return false, worldReason end
    local specialization, specializationReason = ns.EventHub:Subscribe(
        "PLAYER_SPECIALIZATION_CHANGED", function() self:ActivateOnly() end)
    if not specialization then
        ns.EventHub:Unsubscribe(world)
        return false, specializationReason
    end
    self.worldToken = world
    self.specializationToken = specialization
    return true
end

function Activator:Disable()
    if ns.EventHub then
        ns.EventHub:Unsubscribe(self.worldToken)
        ns.EventHub:Unsubscribe(self.specializationToken)
        ns.EventHub:Unsubscribe(self.regenToken)
    end
    self.worldToken = nil
    self.specializationToken = nil
    self.regenToken = nil
    self.handle = nil
    self.pendingCombat = false
    self.enabled = false
    self.status = "disabled"
    return true
end

function Activator:GetStatus()
    return self.status
end
