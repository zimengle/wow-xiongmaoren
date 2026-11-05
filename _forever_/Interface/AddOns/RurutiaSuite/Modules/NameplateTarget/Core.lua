local _, ns = ...
if not ns.Build.HasModule("NameplateTarget") then return end
local Adapter = ns.NameplateTargetAdapter
local Definition = {
    defaultEnabled = true,
    defaults = { profile = { fontSize = 13, x = 2, y = 2, classColor = true } },
}
local MAX_LABELS = 60
local NATIVE_Y_BONUS, NATIVE_SIZE_BONUS = 5, 2
local function Hide(frame) frame:Hide() end
-- Watcher frames keep their unit-scoped registration only while owned.
local function Unwatch(frame)
    frame:UnregisterAllEvents()
    frame:SetScript("OnEvent", nil)
end
local function OnFontChanged(owner, _, role)
    if role == "nameplateTarget" and owner.runtimeActive then owner:RefreshAll() end
end
function Definition:GetProfile() return self.db.profile end
function Definition:Initialize()
    self.active, self.pool, self.watchers, self.watchPool = {}, {}, {}, {}
    self.watchCount = 0
    -- Move only the former default; preserve manually adjusted offsets.
    local p = self:GetProfile()
    if p.x == -14 and p.y == 19 then p.x, p.y = 2, 2 end
    ns.NameplateTargetSettings:Register(self)
end
function Definition:ReleaseUnit(unit)
    local entry = self.active[unit]
    if not entry then return end
    entry.frame:Hide()
    entry.frame:ClearAllPoints()
    entry.frame:SetParent(Adapter:GetRoot())
    entry.unit, entry.anchor, entry.name = nil, nil, nil
    self.active[unit] = nil
end
function Definition:Acquire(unit)
    if self.active[unit] then return self.active[unit] end
    local entry
    for i = 1, #self.pool do if not self.pool[i].unit then entry = self.pool[i] break end end
    if not entry then
        if #self.pool >= MAX_LABELS then return nil end
        local frame = self:CreateFrame("Frame", nil, Adapter:GetRoot(), nil, Hide, "NameplateTarget label")
        frame:EnableMouse(false)
        frame:SetSize(180, 30)
        local text = frame:CreateFontString(nil, "OVERLAY")
        text:SetPoint("BOTTOMLEFT")
        entry = { frame = frame, text = text }
        self.pool[#self.pool + 1] = entry
    end
    self:OwnFrame(entry.frame, Hide, "NameplateTarget retained label")
    entry.unit = unit
    self.active[unit] = entry
    return entry
end
-- The client only delivers UNIT_TARGET for nameplate tokens to frames that
-- register that exact token with RegisterUnitEvent; a plain RegisterEvent on
-- the module frame misses most plates. One tiny frame per token (at most
-- nameplate1..40, reused across enable cycles) owns that registration.
function Definition:Watch(unit)
    if self.watchers[unit] or not unit:match("^nameplate%d+$") then return end
    local frame = self.watchPool[unit]
    if frame then
        self:OwnFrame(frame, Unwatch, "NameplateTarget watcher")
    else
        if self.watchCount >= MAX_LABELS then return end
        frame = self:CreateFrame("Frame", nil, Adapter:GetRoot(), nil, Unwatch, "NameplateTarget watcher")
        self.watchPool[unit], self.watchCount = frame, self.watchCount + 1
    end
    frame:SetScript("OnEvent", function(_, event)
        if not self.runtimeActive then return end
        -- Repair events only matter while the plate shows nothing: a mob that
        -- already targeted us before its plate appeared sends no UNIT_TARGET,
        -- but its first threat / cast event arrives right after.
        if event == "UNIT_TARGET" or event == "UNIT_NAME_UPDATE" or not self.active[unit] then
            self:RefreshUnit(unit)
        end
    end)
    frame:RegisterUnitEvent("UNIT_TARGET", unit)
    frame:RegisterUnitEvent("UNIT_NAME_UPDATE", unit)
    frame:RegisterUnitEvent("UNIT_THREAT_LIST_UPDATE", unit)
    frame:RegisterUnitEvent("UNIT_SPELLCAST_START", unit)
    frame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", unit)
    self.watchers[unit] = frame
end
function Definition:RefreshUnit(unit)
    if not self.runtimeActive or type(unit) ~= "string" then return end
    self:Watch(unit)
    local anchor, native = Adapter:GetAnchor(unit)
    local found, name, r, g, b, secret, colorSecret = Adapter:GetTarget(unit)
    if not anchor or not found then self:ReleaseUnit(unit) return end
    local entry = self:Acquire(unit)
    if not entry then return end
    local p = self:GetProfile()
    if not p.classColor then r, g, b, colorSecret = 1, 1, 1, false end
    -- The native bar is partly covered by its own side elements: raise the
    -- label 5 and enlarge the font 2 over the user's values. Custom (EUI) bars keep them as set.
    local y = native and (p.y + NATIVE_Y_BONUS) or p.y
    local size = native and (p.fontSize + NATIVE_SIZE_BONUS) or p.fontSize
    if entry.anchor ~= anchor or entry.x ~= p.x or entry.y ~= y then
        entry.frame:SetParent(anchor)
        entry.frame:ClearAllPoints()
        entry.frame:SetPoint("BOTTOMLEFT", anchor, "TOPRIGHT", p.x, y)
        entry.frame:SetFrameLevel(anchor:GetFrameLevel() + 5)
        entry.anchor, entry.x, entry.y = anchor, p.x, y
    end
    local font = Adapter:GetFont()
    if entry.size ~= size or entry.font ~= font then
        entry.text:SetFont(font, size, "OUTLINE") entry.size, entry.font = size, font
    end
    if secret then
        -- A secret cannot be compared or cached; SetText accepts it as-is.
        entry.text:SetText(name) entry.name = nil
    elseif entry.name ~= name then
        entry.text:SetText(name) entry.name = name
    end
    if colorSecret then
        -- Hidden channels: no compare, no cache. If the client refuses them, stay white.
        if not pcall(entry.text.SetTextColor, entry.text, r, g, b) then entry.text:SetTextColor(1, 1, 1) end
        entry.r, entry.g, entry.b = nil, nil, nil
    elseif entry.r ~= r or entry.g ~= g or entry.b ~= b then
        entry.text:SetTextColor(r, g, b) entry.r, entry.g, entry.b = r, g, b
    end
    if not entry.frame:IsShown() then entry.frame:Show() end
end
function Definition:RefreshAll()
    -- Enumeration only at enable/world/config boundaries, never per frame.
    local plates = Adapter:GetPlates()
    for i = 1, #plates do self:RefreshUnit(Adapter:GetUnit(plates[i])) end
end
function Definition:QueueSync()
    -- One merged next-frame sweep re-reads every plate. It repairs plates whose
    -- target appeared while no unit event reached us.
    self:RequestRefresh("plate-added", self.RefreshAll)
end
function Definition:OnAdded(_, unit)
    self:RefreshUnit(unit)
    -- The next-frame sweep also lets other NAME_PLATE_UNIT_ADDED handlers
    -- install their visible bar. No retry loop or permanent hook.
    self:QueueSync()
end
function Definition:OnRemoved(_, unit) self:ReleaseUnit(unit) end
function Definition:OnSync() self:QueueSync() end
function Definition:Enable()
    self.runtimeActive = true
    -- A failed Disable may leave stale rows; Runtime already released the frames.
    for unit in pairs(self.watchers) do self.watchers[unit] = nil end
    if ns.Font and ns.Font.Subscribe then ns.Font:Subscribe(self, OnFontChanged) end
    self:RegisterEvent("NAME_PLATE_UNIT_ADDED", self.OnAdded)
    self:RegisterEvent("NAME_PLATE_UNIT_REMOVED", self.OnRemoved)
    self:RegisterEvent("PLAYER_TARGET_CHANGED", self.OnSync)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnSync)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.OnSync)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.RefreshAll)
    self:RefreshAll()
end
function Definition:Disable()
    self.runtimeActive = false
    if ns.Font and ns.Font.Unsubscribe then ns.Font:Unsubscribe(self) end
    self:UnregisterAllEvents()
    self:CancelRefresh("plate-added")
    for unit in pairs(self.active) do self:ReleaseUnit(unit) end
    for i = 1, #self.pool do self:ReleaseFrame(self.pool[i].frame) end
    for unit, frame in pairs(self.watchers) do self:ReleaseFrame(frame) self.watchers[unit] = nil end
end
function Definition:ResetPosition()
    local p = self:GetProfile() p.x, p.y = 2, 2 self:RefreshAll()
end
function Definition:ResetDefaults()
    if Adapter:InCombat() then return false end
    self.db:ResetProfile() self:RefreshAll() return true
end
function Definition:ProfileChanged() if self:IsEnabled() then self:RefreshAll() end end
local module = ns.RegisterModule("NameplateTarget", Definition)
ns.NameplateTarget, ns.NameplateTargetDefinition = module, Definition
