-- 文件职责：无限服法师增益缺失提醒的Runtime生命周期与事件合并。
-- 边界：仅无限（Forever）装配；只在脱战且非休息状态持有玩家光环事件。
local _, ns = ...
if not ns.Build.Is("classic-infinite") or not ns.Build.HasModule("ClassReminders") then return end
local Adapter, View = ns.ClassReminderAdapter, ns.ClassReminderView
if type(Adapter) ~= "table" or type(View) ~= "table" then
    error("ClassReminders infinite core requires the infinite adapter and shared view", 2)
end

local Definition = {defaultEnabled = true, defaults = {profile = {
    classEnabled = true, generalEnabled = false, intellect = true, frostArmor = true, hideResting = true,
}}}
local Rows = {
    {setting = "intellect", key = "class.intellect", order = 10,
        spellID = 1459, members = {{id = 1459, level = 1}, {id = 23028, level = 56}}, text = "智力没了"},
    {setting = "frostArmor", key = "class.frostArmor", order = 20,
        spellID = 168, members = {{id = 168, level = 1}, {id = 7302, level = 30},
            {id = 6117, level = 34}, {id = 428741, level = 1}}, text = "护甲没了"},
}

local function Cancel(module, key)
    if module[key] then module:CancelSchedule(module[key]); module[key] = nil end
end

function Definition:Initialize()
    self.adapter = Adapter
    self:MigratePageSwitches()
    self.states = nil
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
    if Adapter:IsInCombat() or self.db.profile[key] == nil then return false end
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

function Definition:IsWatching()
    return self.active == true and ns.CenterTextGroup.active == true
        and not Adapter:IsInCombat()
        and not (self.db.profile.hideResting and Adapter:IsResting())
end

function Definition:OnAura(_, unit)
    if unit == "player" then self:QueueRefresh() end
end

function Definition:QueueRefresh()
    if self.refreshTimer then return end
    self.refreshTimer = self:Schedule(0.1, function(module)
        module.refreshTimer = nil; module:Refresh()
    end, "ClassReminders aura refresh")
end

function Definition:Render()
    if not self.states then self.states = Adapter:BuildStates(Rows) end
    local preview = self.preview == true
    if not preview then Adapter:ReadAuras(self.states) end
    for index = 1, #Rows do
        local spec, state = Rows[index], self.states[index]
        local missing = self.db.profile[spec.setting] == true
            and (preview or (state.known and state.has == false))
        View:RenderRow(self, spec.key, spec.order, spec.text, missing and (state.iconID or spec.spellID) or nil)
    end
end

function Definition:Refresh()
    Cancel(self, "refreshTimer")
    local watching = self:IsWatching()
    local preview = self.preview == true and self.active == true and ns.CenterTextGroup.active == true
    local listening = watching and not preview
    if listening ~= self.listening then
        self.listening = listening
        if listening then self:RegisterEvent("UNIT_AURA", self.OnAura)
        else self:UnregisterEvent("UNIT_AURA") end
    end
    if not (watching or preview) then
        View:Hide(self, "class.intellect"); View:Hide(self, "class.frostArmor")
        return
    end
    self:Render()
end

function Definition:OnContextChanged(event)
    if event == "SPELLS_CHANGED" or event == "PLAYER_ENTERING_WORLD" then self.states = nil end
    self:Refresh()
end

function Definition:StartWork()
    if not ns.CenterTextGroup.active then return end
    self.active = self.db.profile.classEnabled ~= false and Adapter:IsMage() and (self.db.profile.intellect or self.db.profile.frostArmor)
    if not self.active then return end
    self.states = nil
    for _, event in ipairs({"PLAYER_ENTERING_WORLD", "SPELLS_CHANGED", "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED", "PLAYER_UPDATE_RESTING"}) do
        self:RegisterEvent(event, self.OnContextChanged)
    end
    self:OnContextChanged()
end

function Definition:StopWork()
    self:UnregisterAllEvents()
    Cancel(self, "refreshTimer")
    self.active, self.watching, self.listening, self.preview = false, false, false, false
    self.states = nil
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
    self.preview = self.active == true and value == true
    if self.active then self:Refresh() end
end
function Definition:RefreshCenterStyle()
    if self.active then self:Refresh() end
end

ns.ClassReminders = ns.RegisterModule("ClassReminders", Definition)
