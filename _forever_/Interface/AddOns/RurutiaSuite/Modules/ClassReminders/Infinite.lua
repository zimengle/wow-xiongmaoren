-- 文件职责：无限服职业增益缺失提醒的Runtime生命周期与事件合并。
-- 边界：仅无限（Forever）装配；只在脱战且非休息状态持有玩家光环事件。
local _, ns = ...
if not ns.Build.Is("classic-infinite") or not ns.Build.HasModule("ClassReminders") then return end
local Adapter, View = ns.ClassReminderAdapter, ns.ClassReminderView
if type(Adapter) ~= "table" or type(View) ~= "table" then
    error("ClassReminders infinite core requires the infinite adapter and shared view", 2)
end

local Definition = {defaultEnabled = true, defaults = {profile = {
    classEnabled = true, generalEnabled = false, intellect = true, frostArmor = true, hideResting = true, arcaneBlast = true,
    fortitude = true, wild = true,
}}}
local ClassRows = {
    MAGE = {
        {setting = "intellect", label = "奥术智慧", key = "class.intellect", order = 10,
            spellID = 1459, members = {{id = 1459, level = 1}, {id = 23028, level = 56}}, text = "智力没了"},
        {setting = "frostArmor", label = "护甲提醒", key = "class.frostArmor", order = 20,
            spellID = 168, members = {{id = 168, level = 1}, {id = 7302, level = 30},
                {id = 6117, level = 34}, {id = 428741, level = 1}}, text = "护甲没了"},
    },
    PRIEST = {
        {setting = "fortitude", label = "耐力提醒", key = "class.fortitude", order = 10,
            spellID = 1243, members = {{id = 1243, level = 1}, {id = 21562, level = 48}}, text = "耐力没了"},
    },
    DRUID = {
        {setting = "wild", label = "爪子提醒", key = "class.wild", order = 10,
            spellID = 1126, members = {{id = 1126, level = 1}, {id = 21849, level = 50}}, text = "爪子没了"},
    },
}

local function Cancel(module, key)
    if module[key] then module:CancelSchedule(module[key]); module[key] = nil end
end

local blastSpells = { [400574] = true, [1239696] = true, [1239697] = true, [1239699] = true, [1239700] = true }
local blastDuration = 18
local blastKey = "class.arcaneBlast"

local function BlastPosition(module)
    local p = module.db.profile
    if tonumber(p.blastX) and tonumber(p.blastY) then return p.blastX, p.blastY end
    -- Player-frame left edge aligned: icon center (1516, 752) in the 2560 x 1440 reference viewport.
    return UIParent:GetWidth() * (236 / 2560), -UIParent:GetHeight() * (32 / 1440)
end

function Definition:ApplyBlastPosition()
    if self.blastIcon then
        self.blastIcon:ClearAllPoints()
        self.blastIcon:SetPoint("CENTER", UIParent, "CENTER", BlastPosition(self))
    end
end

function Definition:ResetBlastPosition()
    if Adapter:IsInCombat() then return false end
    self.db.profile.blastX, self.db.profile.blastY = nil, nil
    self:ApplyBlastPosition()
    return true
end

function Definition:SetUnlocked(value)
    if value and (not self.active or not self.isMage or not self.db.profile.arcaneBlast or Adapter:IsInCombat()) then return false end
    self.blastUnlocked = value == true
    if not value then
        if self.blastOverlay then
            self.blastIcon:StopMovingOrSizing()
            self.blastOverlay:Hide()
            if ns.MoveNudge and ns.MoveNudge.target == self.blastIcon then ns.MoveNudge:Hide() end
        end
        self:RenderBlast()
        return true
    end
    self:RenderBlast()
    self:ApplyBlastPosition()
    local function SetPosition(x, y)
        if Adapter:IsInCombat() then return false end
        self.db.profile.blastX, self.db.profile.blastY = math.floor(x + 0.5), math.floor(y + 0.5)
        self:ApplyBlastPosition()
        return true
    end
    local function OpenSettings() return ns.UI:OpenMain("classreminders") end
    self.blastOverlay = ns.MoveOverlay:Ensure(self.blastIcon, {
        label = "奥冲",
        createFrame = function(parent) return self:CreateFrame("Button", nil, parent, "BackdropTemplate") end,
        canInteract = function() return self.blastUnlocked and not Adapter:IsInCombat() end,
        onDragStop = function(icon)
            local x, y = icon:GetCenter()
            local cx, cy = UIParent:GetCenter()
            if x and y and cx and cy then SetPosition(x - cx, y - cy) end
        end,
        onSettings = OpenSettings,
        nudgeConfig = {
            label = "奥冲", getPosition = function() return BlastPosition(self) end,
            setPosition = SetPosition, applyPosition = function() self:ApplyBlastPosition() end,
            onSettings = OpenSettings, onLock = function() self:SetUnlocked(false) end,
        },
    })
    if not self.blastOverlay then self:SetUnlocked(false); return false end
    self:OwnFrame(self.blastOverlay, nil, "Arcane Blast movement")
    self.blastOverlay:Show()
    return true
end

function Definition:RenderBlast()
    local icon = self.blastIcon
    if not (self.blastStacks or self.blastUnlocked) then
        if icon and icon:IsShown() then icon:Hide() end
        return
    end
    if not icon then
        icon = self:CreateFrame("Frame", nil, UIParent, nil, nil, blastKey)
        self.blastIcon = icon
        icon:SetSize(40, 40)
        icon:SetMovable(true)
        icon:SetClampedToScreen(true)
        self:ApplyBlastPosition()
        icon:EnableMouse(false)
        local border = icon:CreateTexture(nil, "BACKGROUND")
        border:SetAllPoints()
        border:SetColorTexture(0, 0, 0, 1)
        local art = icon:CreateTexture(nil, "ARTWORK")
        art:SetPoint("TOPLEFT", 1, -1)
        art:SetPoint("BOTTOMRIGHT", -1, 1)
        art:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        art:SetTexture(Adapter:GetTexture(400573))
        local cooldown = self:CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate", nil, "Arcane Blast sweep")
        icon.cooldown = cooldown
        cooldown:SetAllPoints(icon)
        cooldown:EnableMouse(false)
        cooldown:SetReverse(true)
        cooldown:SetDrawEdge(false)
        cooldown:SetDrawBling(false)
        cooldown.noCooldownCount = true
        cooldown:SetHideCountdownNumbers(true)
        local labels = self:CreateFrame("Frame", nil, icon, nil, nil, "Arcane Blast stacks")
        icon.labels = labels
        labels:SetAllPoints(icon)
        labels:SetFrameLevel(cooldown:GetFrameLevel() + 1)
        icon.secondsText = labels:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        icon.secondsText:SetPoint("CENTER", icon, "CENTER")
        ns.Font:ApplyFontString(icon.secondsText, ns.Font:GetDefaultFontPath(), 16, "OUTLINE")
        icon.stackText = labels:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        icon.stackText:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 1, -1)
        ns.Font:ApplyFontString(icon.stackText, ns.Font:GetDefaultFontPath(), 14, "OUTLINE")
    elseif not self.blastOwned then
        self:OwnFrame(icon, nil, blastKey)
        self:OwnFrame(icon.cooldown, nil, "Arcane Blast sweep")
        self:OwnFrame(icon.labels, nil, "Arcane Blast stacks")
    end
    self.blastOwned = true
    icon.labels:Show()
    icon.stackText:SetText(self.blastStacks or 2)
    if self.blastStart then
        icon.cooldown:SetCooldown(self.blastStart, blastDuration)
        icon.cooldown:Show()
        icon.secondsText:SetText(math.max(1, math.ceil(self.blastStart + blastDuration - GetTime())))
    else
        icon.cooldown:Hide()
        icon.secondsText:SetText("")
    end
    icon:Show()
end

function Definition:ClearBlast()
    Cancel(self, "blastTimer")
    self.blastStacks, self.blastStart = nil, nil
    self:RenderBlast()
end

function Definition:UpdateBlastSeconds()
    local remaining = math.ceil(self.blastStart + blastDuration - GetTime())
    if remaining <= 0 then
        self:ClearBlast()
    else
        self.blastIcon.secondsText:SetText(remaining)
    end
end

function Definition:OnBlastCast(event, unit, castGUID, spellID)
    if (issecretvalue and (issecretvalue(unit) or issecretvalue(spellID)))
        or unit ~= "player" or not blastSpells[spellID] then return end
    local now = GetTime()
    if not self.blastStart or now >= self.blastStart + blastDuration then
        Cancel(self, "blastTimer")
        self.blastStart, self.blastStacks = now, 1
        self.blastTimer = self:ScheduleRepeating(1, self.UpdateBlastSeconds, "Arcane Blast seconds")
        self:RenderBlast()
    elseif self.blastStacks < 4 then
        self.blastStacks = self.blastStacks + 1
        self.blastIcon.stackText:SetText(self.blastStacks)
    end
end

function Definition:Initialize()
    self.adapter = Adapter
    local class = Adapter:PlayerClass()
    self.buffRows = ClassRows[class] or {}
    self.isMage = class == "MAGE"
    local options = {}
    for _, spec in ipairs(self.buffRows) do options[#options + 1] = {spec.setting, spec.label} end
    if #options > 0 then options[#options + 1] = {"hideResting", "休息时不提醒"} end
    if self.isMage then options[#options + 1] = {"arcaneBlast", "奥冲层数"} end
    Adapter.settingOptions = options
    self:MigratePageSwitches()
    self.states = nil
    if #self.buffRows > 0 then ns.CenterTextGroup:RegisterSource("class", self) end
    ns.ClassReminderSettings:Register(self)
    if self.isMage and ns.RegisterMoveProvider then
        ns:RegisterMoveProvider({name = "ClassReminders", reset = "ResetBlastPosition",
            isMovable = function(module) return module.active and module.db.profile.arcaneBlast end})
    end
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
    if not self.states then self.states = Adapter:BuildStates(self.buffRows) end
    local preview = self.preview == true
    if not preview then Adapter:ReadAuras(self.states) end
    for index = 1, #self.buffRows do
        local spec, state = self.buffRows[index], self.states[index]
        local missing = self.db.profile[spec.setting] == true
            and (preview or (state.known and state.has == false))
        View:RenderRow(self, spec.key, spec.order, spec.text, missing and (state.iconID or spec.spellID) or nil)
    end
end

function Definition:Refresh()
    Cancel(self, "refreshTimer")
    local watching = self:IsWatching() and self.watchBuffs
    local preview = self.preview == true and self.active == true and ns.CenterTextGroup.active == true
    local listening = watching and not preview
    if listening ~= self.listening then
        self.listening = listening
        if listening then self:RegisterEvent("UNIT_AURA", self.OnAura)
        else self:UnregisterEvent("UNIT_AURA") end
    end
    if not (watching or preview) then
        for _, spec in ipairs(self.buffRows) do View:Hide(self, spec.key) end
        return
    end
    self:Render()
end

function Definition:OnContextChanged(event)
    if self.blastUnlocked and event == "PLAYER_REGEN_DISABLED" then self:SetUnlocked(false) end
    if event == "SPELLS_CHANGED" or event == "PLAYER_ENTERING_WORLD" then self.states = nil end
    self:Refresh()
end

function Definition:StartWork()
    self:ApplyBlastPosition()
    self.watchBuffs = false
    for _, spec in ipairs(self.buffRows) do
        if self.db.profile[spec.setting] then self.watchBuffs = true; break end
    end
    local watchBlast = self.isMage and self.db.profile.arcaneBlast
    self.active = self.db.profile.classEnabled ~= false and (self.watchBuffs or watchBlast)
    if not self.active then return end
    if watchBlast then
        self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", self.OnBlastCast)
        self:RegisterEvent("PLAYER_DEAD", self.ClearBlast)
    end
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
    self:SetUnlocked(false)
    self:ClearBlast()
    if self.blastOverlay then self:ReleaseFrame(self.blastOverlay) end
    if self.blastOwned then
        self:ReleaseFrame(self.blastIcon.cooldown)
        self:ReleaseFrame(self.blastIcon.labels)
        self:ReleaseFrame(self.blastIcon)
        self.blastOwned = false
    end
    View:Release(self)
end

function Definition:Enable() self:StartWork() end
function Definition:Disable() self:StopWork() end
function Definition:Restart() self:StopWork(); self:StartWork() end
function Definition:OnCenterStateChanged(active)
    if not self:IsEnabled() then return end
    self.preview = false
    self:Refresh()
    if not active then View:Release(self) end
end
function Definition:SetCenterPreview(value)
    self.preview = self.active == true and value == true
    if self.active then self:Refresh() end
end
function Definition:RefreshCenterStyle()
    if self.active then self:Refresh() end
end

ns.ClassReminders = ns.RegisterModule("ClassReminders", Definition)
