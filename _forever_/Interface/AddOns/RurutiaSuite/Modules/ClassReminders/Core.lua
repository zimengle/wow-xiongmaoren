-- 文件职责：职业与大餐提醒的Runtime生命周期、配置和合并调度。
-- 边界：仅Retail装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.IsFamily("retail") or not ns.Build.HasModule("ClassReminders") then return end
local Data, Adapter, View = ns.ClassReminderData, ns.ClassReminderAdapter, ns.ClassReminderView
local WEAPON_NIL_TRIES, WEAPON_NIL_WAIT = 8, 0.5
local Definition = {defaultEnabled = true, defaults = {profile = Data.defaults}}
local function Cancel(module, key)
    if module[key] then module:CancelSchedule(module[key]); module[key] = nil end
end
function Definition:Initialize()
    self.adapter = Adapter
    self:MigratePageSwitches()
    ns.CenterTextGroup:RegisterSource("class", self)
    ns.ClassReminderSettings:Register(self)
end
function Definition:MigratePageSwitches()
    local p = self.db.profile
    if p.pageSwitchesV1 then return end
    if ns.Assembly and ns.Assembly.IsModuleEnabled and not ns.Assembly:IsModuleEnabled("ClassReminders") then
        p.classEnabled, p.generalEnabled = false, false
    end
    p.pageSwitchesV1 = true
end
function Definition:ProfileChanged() self:MigratePageSwitches() end

-- Page switches preserve individual reminder choices; shared work runs only
-- while at least one page needs it.
function Definition:SetPageEnabled(key, value)
    if Adapter:IsInCombat() or (key ~= "classEnabled" and key ~= "generalEnabled") then return false end
    self.db.profile[key] = value == true
    local wanted = self.db.profile.classEnabled ~= false
        or (type(Adapter.SupportsFeast) == "function" and Adapter:SupportsFeast() and self.db.profile.generalEnabled ~= false)
    local ok, reason = ns.Assembly:SetModuleEnabled("ClassReminders", wanted)
    if ok and wanted and self:IsEnabled() then self:Restart() end
    return ok, reason
end

function Definition:SetSetting(key, value)
    if Adapter:IsInCombat() or Data.defaults[key] == nil then return false end
    self.db.profile[key] = value == true
    if self:IsEnabled() then self:Restart() end
    return true
end
function Definition:RestorePageDefaults(key)
    if Adapter:IsInCombat() or (key ~= "classEnabled" and key ~= "generalEnabled") then return false end
    for option, value in pairs(Definition.defaults.profile) do
        if option ~= "classEnabled" and option ~= "generalEnabled"
            and ((key == "generalEnabled") == (option == "feast")) then
            self.db.profile[option] = value
        end
    end
    return self:SetPageEnabled(key, Definition.defaults.profile[key])
end
function Definition:ClearFeast()
    Cancel(self, "feastTimer")
    Adapter:StopSound(self.feastSoundHandle); self.feastSoundHandle = nil
    View:Hide(self, "class.feast")
end
function Definition:OnContextChanged(event)
    local listen = self.feastSupported and ns.CenterTextGroup.active and self.db.profile.feast and not self.feastChallenge and not self.feastEncounter
        and Adapter:CanListenForFeast()
    if listen and not self.feastActive then
        self.feastActive = true
        self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", self.OnFeastMessage)
    elseif not listen then
        self.feastActive, self.feastLastMessage = false, nil
        self:UnregisterEvent("CHAT_MSG_MONSTER_EMOTE")
        self:ClearFeast()
    end
    self:QueueRefresh(event)
end
function Definition:OnEncounter(event)
    self.feastEncounter = event == "ENCOUNTER_START"
    self:OnContextChanged(event)
end
function Definition:OnRestriction(_, kind, state)
    local active = Adapter:ReadChallengeEvent(kind, state)
    if active == nil then return end
    self.feastChallenge = active
    self:OnContextChanged()
end
function Definition:OnFeastMessage(_, message, sender)
    if not ns.CenterTextGroup.active or not self.feastActive or self.feastChallenge or self.feastEncounter or Adapter:IsInCombat() then return end
    local key, text = Adapter:ReadFeast(message, sender)
    if not key then return end
    local now = Adapter:GetTime()
    if self.feastLastMessage == key and now - self.feastLastTime < 1 then return end
    self.feastLastMessage, self.feastLastTime = key, now
    self:ClearFeast()
    View:Feast(self, text)
    self.feastTimer = self:Schedule(8, function(module)
        module.feastTimer = nil; module:ClearFeast()
    end, "ClassReminders feast hide")
    self.feastSoundHandle = Adapter:PlayFeastSound()
end
function Definition:Refresh()
    local fromTimer = self.weaponNilFromTimer
    self.weaponNilFromTimer = nil
    Cancel(self, "expiryTimer")
    if not self.active then return end
    if not ns.CenterTextGroup.active then
        View:Hide(self, "class.weapon"); View:Hide(self, "class.beacon"); return
    end
    local weapon, delay, left, right, unconfirmed
    if Adapter:InReminderContext() then
        weapon, delay, unconfirmed = Adapter:ReadWeapon(self.db.profile)
        if Adapter:IsInGroup() then left, right = Adapter:ReadBeacons(self.db.profile) end
        if unconfirmed and not self.preview then
            local tries = self.weaponNilTries or 0
            if fromTimer then
                tries = tries + 1
                self.weaponNilTries = tries
            end
            if tries < WEAPON_NIL_TRIES then weapon, delay = nil, WEAPON_NIL_WAIT end
        else
            self.weaponNilTries = nil
        end
    else
        self.weaponNilTries = nil
    end
    if self.preview then
        weapon, left, right = Data.rites[1].spellID, Data.light, Data.faith
        if unconfirmed then delay = nil end
    end
    View:RenderRow(self, "class.weapon", 10, Data.weaponText, weapon)
    View:RenderRow(self, "class.beacon", 20, Data.beaconText, left, right)
    if delay then
        local probe = unconfirmed and not self.preview and (self.weaponNilTries or 0) < WEAPON_NIL_TRIES
        self.expiryTimer = self:Schedule(delay, function(module)
            module.expiryTimer = nil
            module.weaponNilFromTimer = probe and true or nil
            module:Refresh()
        end, probe and "ClassReminders enchant confirm" or "ClassReminders enchant expiry")
    end
end
function Definition:QueueRefresh(event, value)
    if not ns.CenterTextGroup.active or not self.active or self.refreshTimer or not Adapter:IsRefreshEvent(event, value) then return end
    self.refreshTimer = self:Schedule(0.1, function(module)
        module.refreshTimer = nil; module:Refresh()
    end, "ClassReminders refresh")
end
function Definition:StartWork()
    if not ns.CenterTextGroup.active then return end
    self.active = self.db.profile.classEnabled ~= false and Adapter:IsPaladin() and (self.db.profile.weapon or self.db.profile.beacon)
    self.feastSupported = false
    if self.db.profile.generalEnabled ~= false and self.db.profile.feast and Adapter:SupportsFeast() then
        -- Runtime rolls back the event resource when the client rejects its name.
        self.feastSupported = pcall(self.RegisterEvent, self, "ADDON_RESTRICTION_STATE_CHANGED", self.OnRestriction)
    end
    if not (self.active or self.feastSupported) then return end
    if self.feastSupported then
        self.feastChallenge, self.feastEncounter = Adapter:IsChallengeActive(), Adapter:IsEncounterActive()
        self:RegisterEvent("ENCOUNTER_START", self.OnEncounter)
        self:RegisterEvent("ENCOUNTER_END", self.OnEncounter)
    end
    for _, event in ipairs({"PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA", "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED"}) do
        self:RegisterEvent(event, self.OnContextChanged)
    end
    if self.active then
        for _, event in ipairs({"GROUP_ROSTER_UPDATE", "PLAYER_TALENT_UPDATE", "SPELLS_CHANGED", "PLAYER_SPECIALIZATION_CHANGED",
            "PLAYER_EQUIPMENT_CHANGED", "UNIT_INVENTORY_CHANGED", "PLAYER_DEAD", "PLAYER_ALIVE", "PLAYER_UNGHOST",
            "PLAYER_MOUNT_DISPLAY_CHANGED", "UPDATE_VEHICLE_ACTIONBAR", "SPELL_ACTIVATION_OVERLAY_GLOW_SHOW", "SPELL_ACTIVATION_OVERLAY_GLOW_HIDE"}) do
            self:RegisterEvent(event, self.QueueRefresh)
        end
        self.preview = ns.CenterTextGroup.isUnlocked and not Adapter:IsInCombat()
    end
    self:OnContextChanged()
end
function Definition:StopWork()
    self.feastSupported = false
    self.active, self.preview, self.feastActive = false, false, false
    self.feastChallenge, self.feastEncounter, self.feastLastMessage, self.feastLastTime = nil, nil, nil, nil
    self.weaponNilTries, self.weaponNilFromTimer = nil, nil
    self:UnregisterAllEvents()
    Cancel(self, "refreshTimer"); Cancel(self, "expiryTimer")
    self:ClearFeast()
    View:Release(self)
end
function Definition:Enable() self:StartWork() end
function Definition:Disable() self:StopWork() end
function Definition:Restart() self:StopWork(); self:StartWork() end
function Definition:OnCenterStateChanged(active)
    if not self:IsEnabled() then return end
    self:StopWork()
    if active then self:StartWork() end
end
function Definition:SetCenterPreview(value)
    if not ns.CenterTextGroup.active then
        Cancel(self, "refreshTimer"); Cancel(self, "expiryTimer"); self:ClearFeast()
    end
    self.preview = self.active and value == true
    if self.active then self:Refresh() end
end
function Definition:RefreshCenterStyle()
    if self.active then self:Refresh() end
    local row = self.rows and self.rows["class.feast"]
    if self.feastActive and row and row:IsShown() then View:Feast(self) end
end
ns.ClassReminders = ns.RegisterModule("ClassReminders", Definition)
