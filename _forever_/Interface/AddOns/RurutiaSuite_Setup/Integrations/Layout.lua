local _, ns = ...

-- Third-party calls stay here; the switcher owns the profile transaction.
local Integration = {}
ns.LayoutIntegration = Integration
local RANGE_MODULE = "ExClass.RangeCheck"
local SIDES = { left = true, middle = true, right = true, unknown = true }
local KIRA_MIDDLE_SIDE = "BELOW_RIGHT"
local KIRA_SIDE = { left = "LEFT", right = "LEFT", middle = KIRA_MIDDLE_SIDE }
-- JL170522833 readback: left 2026-10-22; right/middle 07:16:45.
local KIRA_POSITIONS = {
    left = { interrupts = { x = 440, y = 137 }, partyStops = { x1 = 388, y1 = 201, x2 = 388, y2 = 166 } },
    middle = { interrupts = { x = -611, y = 152 }, partyStops = { x1 = -663, y1 = 216, x2 = -663, y2 = 180 } },
    right = { interrupts = { x = -611, y = 152 }, partyStops = { x1 = -663, y1 = 216, x2 = -663, y2 = 180 } },
}

local function InCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local function SetRange(side)
    if side == "unknown" then return nil, "unknown-layout" end
    local api = _G.ExwindTools
    if type(api) ~= "table" or type(api.GetModuleDB) ~= "function" then
        return nil, "dependency-unavailable"
    end
    local ok, db = pcall(api.GetModuleDB, api, RANGE_MODULE)
    if not ok or type(db) ~= "table" then return false, "range-read-failed" end
    local desired, previous = side ~= "middle", rawget(db, "enabled")
    if db.enabled == desired then return true end
    local ui = api.UI
    if type(ui) ~= "table" or type(ui.NotifyModuleValueChanged) ~= "function" then
        return false, "range-refresh-unavailable"
    end
    db.enabled = desired
    local refreshed, result = pcall(ui.NotifyModuleValueChanged, ui, RANGE_MODULE, "enabled", "committed")
    if not refreshed or result == false or db.enabled ~= desired then
        db.enabled = previous
        pcall(ui.NotifyModuleValueChanged, ui, RANGE_MODULE, "enabled", "committed")
        return false, "range-refresh-failed"
    end
    return true
end

local function ApplyKiraParty(side)
    local layout = ns.DB and ns.DB.global and ns.DB.global.layout
    if not layout or layout.adjustKira == false then return nil, "disabled" end
    if InCombat() then return false, "combat-lockdown" end
    local desired = KIRA_SIDE[side]
    local plugin, db = _G.KiraUIPlugin, _G.KiraUIChangesDB
    local cfg = type(db) == "table" and db.partyCDs or nil
    if not desired or type(plugin) ~= "table" or type(cfg) ~= "table" then return nil end
    -- Both Elles side layouts put debuffs on the right. Also repair the old
    -- RSS right-layout mapping while leaving other custom directions alone.
    if side ~= "middle" and cfg.side ~= KIRA_MIDDLE_SIDE and cfg.side ~= "RIGHT" and cfg.side ~= "LEFT" then return nil end
    local desiredY = side == "middle" and 0 or 17
    if cfg.side == desired and cfg.offX == 0 and cfg.offY == desiredY and cfg.attach == true then return true end
    local previous, previousX, previousY, previousAttach = cfg.side, cfg.offX, cfg.offY, cfg.attach
    cfg.side = desired
    cfg.offX, cfg.offY, cfg.attach = 0, desiredY, true
    local apply = type(plugin.__ns) == "table" and plugin.__ns.PTCApply or nil
    if type(apply) ~= "function" then
        cfg.side, cfg.offX, cfg.offY, cfg.attach = previous, previousX, previousY, previousAttach
        return false, "kira-apply-unavailable"
    end
    local ok = pcall(apply)
    if not ok or cfg.side ~= desired
        or cfg.attach ~= true or cfg.offX ~= 0 or cfg.offY ~= desiredY then
        cfg.side, cfg.offX, cfg.offY, cfg.attach = previous, previousX, previousY, previousAttach
        pcall(apply)
        return false, "kira-apply-failed"
    end
    return true
end

local function ApplyKiraPosition(side, option, key, method)
    local layout = ns.DB and ns.DB.global and ns.DB.global.layout
    if not layout or layout[option] == false then return nil, "disabled" end
    if InCombat() then return false, "combat-lockdown" end
    local preset = KIRA_POSITIONS[side]
    if not preset then return nil, "unknown-layout" end
    local plugin, db = _G.KiraUIPlugin, _G.KiraUIChangesDB
    local cfg = type(db) == "table" and db[key] or nil
    if type(plugin) ~= "table" or type(cfg) ~= "table" then return nil, "dependency-unavailable" end
    local desired, changed = preset[key], false
    for field, value in pairs(desired) do
        if cfg[field] ~= value then changed = true end
    end
    if not changed then return true end
    local apply = type(plugin.__ns) == "table" and plugin.__ns[method] or nil
    if type(apply) ~= "function" then return false, "kira-apply-unavailable" end
    local previous = {}
    for field, value in pairs(desired) do
        previous[field] = cfg[field]
        cfg[field] = value
    end
    local ok, result = pcall(apply)
    ok = ok and result ~= false
    for field, value in pairs(desired) do
        if cfg[field] ~= value then ok = false end
    end
    if not ok then
        for field in pairs(desired) do cfg[field] = previous[field] end
        pcall(apply)
        -- A failing third-party refresh may also rewrite its saved coordinates.
        for field in pairs(desired) do cfg[field] = previous[field] end
        return false, "kira-apply-failed"
    end
    return true
end

local function ApplyKira(side, result, provider)
    -- Party cooldown attachment is calibrated for Ellesmere frames only.
    if provider ~= "ndui" then result.kira, result.kiraReason = ApplyKiraParty(side) end
    result.kiraInterrupts, result.kiraInterruptsReason = ApplyKiraPosition(side, "adjustKiraInterrupts", "interrupts", "IKApply")
    result.kiraStops, result.kiraStopsReason = ApplyKiraPosition(side, "adjustKiraStops", "partyStops", "PSTApply")
    return result.kira ~= false and result.kiraInterrupts ~= false and result.kiraStops ~= false
end

function Integration:Apply(side, passive, provider)
    if not SIDES[side] then return false, "invalid-layout-side" end
    if InCombat() then return false, "combat-lockdown" end
    provider = provider or "ellesmere"
    if provider ~= "ellesmere" and provider ~= "ndui" then return false, "unsupported-layout-provider" end
    local result = {}
    if provider == "ellesmere" and not passive and side ~= "unknown" then
        local api = _G.RurutiaSA_Class
        if type(api) == "table" and type(api.ApplyExternalLayoutPreset) == "function" then
            local ok, applied = pcall(api.ApplyExternalLayoutPreset, api, "RSS", side)
            result.rsa = ok and applied ~= false
        end
    end
    -- A callback may have entered combat; never make a second external write then.
    if InCombat() then return false, "combat-lockdown" end
    if provider == "ellesmere" then result.range, result.rangeReason = SetRange(side) end
    local kiraOK = true
    if not passive then kiraOK = ApplyKira(side, result, provider) end
    result.partial = result.rsa == false or result.range == false or not kiraOK
    return true, result
end

-- Explicit one-click installation only; never queue a later login/combat write.
function Integration:ApplyKiraCurrent()
    if not self.enabled then return false, "disabled" end
    if InCombat() then return false, "combat-lockdown" end
    local ok, inspected, state = pcall(ns.ProfileSwitcher.Inspect, ns.ProfileSwitcher)
    if not ok or not inspected or type(state) ~= "table"
        or (state.provider ~= "ellesmere" and state.provider ~= "ndui") then
        return true, { skipped = true, reason = "layout-unavailable" }
    end
    local result = {}
    local ok = ApplyKira(state.side, result, state.provider)
    result.skipped = result.kira == nil and result.kiraInterrupts == nil and result.kiraStops == nil
    result.reason = result.kiraReason or result.kiraInterruptsReason or result.kiraStopsReason
    return ok, result
end

function Integration:Sync()
    if not self.enabled then return false end
    if InCombat() then
        if not self.combatToken then
            self.combatToken = ns.EventHub:Subscribe("PLAYER_REGEN_ENABLED", function()
                if self.combatToken then ns.EventHub:Unsubscribe(self.combatToken) end
                self.combatToken = nil
                self:Sync()
            end)
        end
        return false, "combat-lockdown"
    end
    local ok, inspected, state = pcall(ns.ProfileSwitcher.Inspect, ns.ProfileSwitcher)
    if not ok or not inspected or type(state) ~= "table" or state.provider ~= "ellesmere" then
        return false, "layout-unavailable"
    end
    return self:Apply(state.side, true)
end

function Integration:Enable()
    if self.enabled then return true end
    self.enabled, self.tokens = true, {}
    local callbacks = {
        PLAYER_ENTERING_WORLD = function() self:Sync() end,
        ADDON_LOADED = function(_, name)
            if name == "EllesmereUI" or name == "ExwindTools" then self:Sync() end
        end,
    }
    for event, callback in pairs(callbacks) do
        local token, reason = ns.EventHub:Subscribe(event, callback)
        if not token then self:Disable() return false, reason end
        self.tokens[#self.tokens + 1] = token
    end
    self:Sync()
    return true
end

function Integration:Disable()
    self.enabled = false
    for _, token in ipairs(self.tokens or {}) do ns.EventHub:Unsubscribe(token) end
    if self.combatToken then ns.EventHub:Unsubscribe(self.combatToken) end
    self.tokens, self.combatToken = {}, nil
    return true
end

return Integration
