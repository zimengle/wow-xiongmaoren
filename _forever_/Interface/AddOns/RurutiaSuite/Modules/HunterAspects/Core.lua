local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Adapter = ns.HunterAspectsAdapter
local Tracking = ns.HunterAspectsTracking
local SetSize, Place = Tracking.SetFrameSize, Tracking.PlaceFrame
local ACTIVE_COLOR = {139 / 255, 215 / 255, 116 / 255, 1}
local DEFAULTS = {x = 0, y = -300, iconWidth = 30, iconHeight = 30, spacing = 1,
    alignment = "CENTER", direction = "RIGHT"}
local ALIGNMENTS = {LEFT = true, CENTER = true, RIGHT = true, TOP = true, BOTTOM = true}
local DIRECTIONS = {LEFT = true, RIGHT = true, UP = true, DOWN = true}
local Definition = {defaultEnabled = true, defaults = {profile = DEFAULTS}}
local function Hide(frame) frame:Hide() end
local function HideSecure(frame)
    if not Adapter:InCombat() then frame:Hide() end
end
local function ClearAspectButton(button)
    if Adapter:InCombat() then return end
    button:SetAttribute("type1", nil)
    button:SetAttribute("spell1", nil)
    button:Hide()
    button.row = nil
end
local function AspectTooltip(button) Adapter:Tooltip(button, button.row, button.aspectPreview) end
local function HideTooltip() Adapter:HideTooltip() end
local function HideMoveTarget(target, overlay)
    if not target then return end
    if overlay then
        local record = overlay.__rsMoveOverlayRecord
        if record.dragActive then target:StopMovingOrSizing() end
        record.dragActive, record.dragged = false, false
        overlay:Hide()
    end
    target:Hide()
    if ns.MoveNudge and ns.MoveNudge.target == target then ns:HideMoveNudgeFrame() end
end

function Definition:ApplyButtonVisual(button, active)
    local state = active == true and "active" or active == false and "inactive" or "unknown"
    -- Only textures change in combat, never the secure button's geometry.
    if button.visualState ~= state then
        button.icon:SetAlpha(active == false and 0.4 or 1)
        ns.UI.PixelBorder:Update(button.border, ACTIVE_COLOR, active == true)
        button.visualState = state
    end
end
function Definition:CreateIconButton(parent, template, cleanup, onEnter, onLeave)
    local button = self:CreateFrame("Button", nil, parent, template, cleanup)
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetAllPoints(button)
    button.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    button.border = ns.UI.PixelBorder:Ensure(button)
    button:SetScript("OnEnter", onEnter)
    button:SetScript("OnLeave", onLeave)
    return button
end
function Definition:CreateMoveTarget()
    local frame = self:CreateFrame("Frame", nil, UIParent, nil, Hide)
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:Hide()
    return frame
end
local function BarGeometry(p, count)
    local vertical = p.direction == "UP" or p.direction == "DOWN"
    local start = p.direction == "LEFT" and "RIGHT" or p.direction == "UP" and "BOTTOM"
        or p.direction == "DOWN" and "TOP" or "LEFT"
    local width = vertical and p.iconWidth or (count * (p.iconWidth + p.spacing) - p.spacing)
    local height = vertical and (count * (p.iconHeight + p.spacing) - p.spacing) or p.iconHeight
    return start, width, height
end
local function PlaceButton(button, bar, p, start, index)
    local vertical = start == "TOP" or start == "BOTTOM"
    local step = (index - 1) * ((vertical and p.iconHeight or p.iconWidth) + p.spacing)
    SetSize(button, p.iconWidth, p.iconHeight)
    Place(button, start, bar, start, vertical and 0 or (start == "RIGHT" and -step or step),
        vertical and (start == "TOP" and -step or step) or 0)
end
function Definition:Initialize()
    self.buttons = {}
    self.previewButtons = {}
    self.trackingButtons, self.trackingPreviewButtons, self.trackingRows = {}, {}, {}
    self.trackingEvent = false
    if self.db.profile.x == 0 and (self.db.profile.y == -220 or self.db.profile.y == -270) then self.db.profile.y = -300 end
    Tracking.Normalize(self.db.profile)
    ns.HunterAspectsSettings:Register(self)
    ns:RegisterMoveProvider({name = "HunterAspects", reset = "ResetPosition",
        isMovable = function(module) return Adapter:IsHunter() and module:IsEnabled() end})
end
function Definition:ProfileChanged() Tracking.Normalize(self.db.profile) end
function Definition:OpenSettings() return ns.UI:OpenMain("hunter-aspects") end
function Definition:RefreshSettings(reason)
    ns.UI:GetSystem().pages:Refresh("hunter-aspects", reason)
end
function Definition:SetEnabled(enabled)
    if Adapter:InCombat() then return false, "请脱离战斗后修改。" end
    local ok, reason = ns.Assembly:SetModuleEnabled("HunterAspects", enabled == true)
    if ok then self:RefreshSettings("module") end
    return ok, reason
end
function Definition:ApplyPosition()
    if Adapter:InCombat() then return false end
    local p = self.db.profile
    for _, frame in ipairs({self.bar, self.moveTarget, self.previewBar}) do
        Place(frame, p.alignment, UIParent, "CENTER", p.x, p.y)
    end
    Tracking.ApplyPosition(self)
    return true
end
function Definition:SetLayout(key, value)
    if Adapter:InCombat() then return false end
    if key == "alignment" then
        if not ALIGNMENTS[value] then return false end
    elseif key == "direction" then
        if not DIRECTIONS[value] then return false end
    elseif key == "iconWidth" or key == "iconHeight" or key == "spacing" then
        value = tonumber(value)
        if not value or value ~= value then return false end
        local low, high = key == "spacing" and 0 or 16, key == "spacing" and 20 or 80
        value = math.max(low, math.min(high, math.floor(value + 0.5)))
    else return false end
    self.db.profile[key] = value
    if self:IsEnabled() and Adapter:IsHunter() then self:Refresh() end
    return true
end
function Definition:RestoreDefaults()
    if Adapter:InCombat() then return false end
    for key, value in pairs(DEFAULTS) do self.db.profile[key] = value end
    Tracking.RestoreDefaults(self.db.profile)
    if self:IsEnabled() and Adapter:IsHunter() then self:Refresh() end
    return true
end
function Definition:EnsureFrames()
    if self.bar then
        self:OwnFrame(self.bar, HideSecure)
        self:OwnFrame(self.moveTarget, Hide)
        for _, button in ipairs(self.buttons) do self:OwnFrame(button, ClearAspectButton) end
        return
    end
    self.bar = self:CreateFrame("Frame", "RSHunterAspects", UIParent, nil, HideSecure)
    -- The movement target has no protected children or anchors to secure frames.
    self.moveTarget = self:CreateMoveTarget()
end
function Definition:Refresh()
    if Adapter:InCombat() then self.pending = true; return end
    self.pending = false
    self:EnsureFrames()
    self.rows = Adapter:Learned()
    local rowsByName = self.rowsByName or {}
    for key in pairs(rowsByName) do rowsByName[key] = nil end
    for _, row in ipairs(self.rows) do rowsByName[row.name] = row end
    self.rowsByName = rowsByName
    if self.activeAspect and not rowsByName[self.activeAspect] then self.activeAspect = nil end
    local p = self.db.profile
    local merged = Tracking.Rebuild(self)
    local count = #self.rows + (merged and 1 or 0)
    local first = merged and p.tracking.slot == "FIRST"
    local start, width, height = BarGeometry(p, count > 0 and count or 3)
    if merged then PlaceButton(self.trackingMain, self.bar, p, start, first and 1 or count) end
    for index, row in ipairs(self.rows) do
        local button = self.buttons[index]
        if not button then
            button = self:CreateIconButton(self.bar, "SecureActionButtonTemplate", ClearAspectButton, AspectTooltip, HideTooltip)
            self.buttons[index] = button
        end
        if not button.row or button.row.name ~= row.name then Adapter:Configure(button, row.name) end
        if not button.row or button.row.icon ~= row.icon then button.icon:SetTexture(row.icon) end
        button.row = row
        PlaceButton(button, self.bar, p, start, index + (first and 1 or 0))
        button:Show()
    end
    for i = #self.rows + 1, #self.buttons do
        if self.buttons[i].row then ClearAspectButton(self.buttons[i]) end
    end
    -- Three empty slots give unlearned hunters a useful layout preview, without secure spells.
    SetSize(self.bar, width, height)
    SetSize(self.moveTarget, width, height)
    if count > 0 then self.bar:Show() else self.bar:Hide() end
    self:RefreshPreview(count)
    self:ApplyPosition()
    self:RefreshMovement()
    self:RefreshAuras()
    Tracking.RefreshState(self)
    return true
end
function Definition:AreRowAurasRestricted()
    if Adapter:AurasRestricted() then return true end
    for _, row in ipairs(self.rows or {}) do
        if Adapter:AurasRestricted(row.id) then return true end
    end
    return false
end
function Definition:ApplyKnownAspect()
    for i, row in ipairs(self.rows or {}) do
        self:ApplyButtonVisual(self.buttons[i], self.activeAspect == row.name)
    end
end
function Definition:RefreshAuras()
    local rows = self.rows
    if not rows then return end
    if self:AreRowAurasRestricted() then
        if self.auraKnown then
            self:ApplyKnownAspect()
        else
            for i = 1, #rows do self:ApplyButtonVisual(self.buttons[i], nil) end
        end
        return
    end
    local foundActive, anyUnknown = nil, false
    for i, row in ipairs(rows) do
        local active = Adapter:Active(row.name, row.id)
        if active == true then foundActive = row.name
        elseif active == nil then anyUnknown = true end
        self:ApplyButtonVisual(self.buttons[i], active)
    end
    if foundActive then
        self.activeAspect, self.auraKnown = foundActive, true
    elseif not anyUnknown then
        self.activeAspect, self.auraKnown = nil, true
    else
        self.activeAspect, self.auraKnown = nil, false
    end
end
function Definition:OnAura(_, unit)
    if Adapter:IsReadable(unit) and unit == "player" then self:RefreshAuras() end
end
function Definition:OnSpellCastSucceeded(_, unit, castGUID, spellID)
    if not Adapter:IsReadable(unit) or not Adapter:IsReadable(castGUID) or not Adapter:IsReadable(spellID)
        or unit ~= "player" or type(spellID) ~= "number" then return end
    if Tracking.OnCast(self, spellID) then return end
    local rowsByName = self.rowsByName
    if not rowsByName then return end
    local name = Adapter:SpellName(spellID)
    local row = name and rowsByName[name]
    if not row then return end
    self.activeAspect, self.auraKnown = name, true
    if Adapter:AurasRestricted(row.id) then
        self:ApplyKnownAspect()
    else
        self:RefreshAuras()
    end
end
function Definition:OnRestrictionChanged()
    if not self:AreRowAurasRestricted() then self:RefreshAuras() end
end
function Definition:OnCombat()
    if self.unlocked or self.preview then self.pending = true end
    self.unlocked, self.preview = false, false
    if self.previewBar then self.previewBar:Hide() end
    HideMoveTarget(self.moveTarget, self.overlay)
    HideMoveTarget(self.trackingMoveTarget, self.trackingOverlay)
    Tracking.HidePreview(self)
    Adapter:HideTooltip()
end
function Definition:OnRegen()
    if self.pending then
        self:Refresh()
        self:RefreshSettings("spells")
    else
        self:RefreshAuras()
        Tracking.RefreshState(self)
    end
end
function Definition:OnSpellsChanged()
    self:Refresh()
    self:RefreshSettings("spells")
end
function Definition:Enable()
    if not Adapter:IsHunter() then return end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.OnSpellsChanged)
    self:RegisterEvent("SPELLS_CHANGED", self.OnSpellsChanged)
    self:RegisterEvent("UNIT_AURA", self.OnAura)
    self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", self.OnSpellCastSucceeded)
    self:RegisterEvent("ADDON_RESTRICTION_STATE_CHANGED", self.OnRestrictionChanged)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnCombat)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.OnRegen)
    self:Refresh()
end
function Definition:Disable()
    self.unlocked, self.pending, self.rows, self.preview = false, false, nil, false
    self.activeAspect, self.auraKnown, self.rowsByName = nil, false, nil
    HideMoveTarget(self.moveTarget, self.overlay)
    HideMoveTarget(self.trackingMoveTarget, self.trackingOverlay)
    Tracking.Disable(self)
    Adapter:HideTooltip()
    self:UnregisterAllEvents()
end
-- Cosmetic preview is separate from protected live buttons and movement overlay.
function Definition:SetPreview(value)
    if Adapter:InCombat() or not self:IsEnabled() or not self.bar then return false end
    Adapter:HideTooltip()
    self.preview = value == true
    if self.preview then self.unlocked = false end
    return self:Refresh()
end
function Definition:RefreshPreview(liveCount)
    local show = self.preview or (self.unlocked and liveCount == 0)
    if not show then
        if self.previewBar then self.previewBar:Hide() end
        Tracking.HidePreview(self)
        return
    end
    if not self.previewBar then
        self.previewBar = self:CreateFrame("Frame", nil, UIParent, nil, Hide)
    else self:OwnFrame(self.previewBar, Hide) end
    local rows, p = Adapter:Preview(), self.db.profile
    local merged = Tracking.RefreshPreview(self)
    local count = #rows + (merged and 1 or 0)
    local first = merged and p.tracking.slot == "FIRST"
    local start, width, height = BarGeometry(p, math.max(1, count))
    if merged then
        PlaceButton(self.trackingPreviewMain, self.previewBar, p, start, first and 1 or count)
    end
    for i, row in ipairs(rows) do
        local b = self.previewButtons[i]
        if not b then
            b = self:CreateIconButton(self.previewBar, nil, Hide, AspectTooltip, HideTooltip)
            self.previewButtons[i] = b
            b.aspectPreview = true
        else self:OwnFrame(b, Hide) end
        if not b.row or b.row.icon ~= row.icon then b.icon:SetTexture(row.icon) end
        b.row = row
        PlaceButton(b, self.previewBar, p, start, i + (first and 1 or 0))
        self:ApplyButtonVisual(b, i == 1)
        b:Show()
    end
    for i = #rows + 1, #self.previewButtons do self.previewButtons[i]:Hide() end
    SetSize(self.previewBar, width, height)
    if self.unlocked then SetSize(self.moveTarget, width, height) end
    -- Keep secure live buttons available for combat; preview occupies the same position.
    self.previewBar:SetFrameLevel(self.bar:GetFrameLevel() + 10)
    self.previewBar:Show()
end
function Definition:SetUnlocked(value)
    if Adapter:InCombat() or not self:IsEnabled() or not self.bar then return false end
    self.unlocked = value == true
    if self.unlocked then self.preview = false end
    Adapter:HideTooltip()
    return self:Refresh()
end
local function ShowMoveOverlay(module, target, overlay, label, getProfile)
    if overlay then
        module:OwnFrame(target, Hide)
        module:OwnFrame(overlay, Hide)
        target:Show()
        overlay:Show()
        return overlay
    end
    overlay = ns.MoveOverlay:Ensure(target, {
        label = label,
        createFrame = function(parent) return module:CreateFrame("Button", nil, parent, "BackdropTemplate", Hide) end,
        canInteract = function() return not Adapter:InCombat() end,
        onDragStop = function()
            if Adapter:InCombat() then return end
            local x, y = target:GetCenter()
            local cx, cy = UIParent:GetCenter()
            local profile = getProfile(module)
            local alignment = profile.alignment
            if alignment == "LEFT" then x = x - target:GetWidth() / 2
            elseif alignment == "RIGHT" then x = x + target:GetWidth() / 2
            elseif alignment == "TOP" then y = y + target:GetHeight() / 2
            elseif alignment == "BOTTOM" then y = y - target:GetHeight() / 2 end
            profile.x, profile.y = x - cx, y - cy
            module:ApplyPosition()
        end,
        onSettings = function() module:OpenSettings() end,
        nudgeConfig = {
            label = label,
            getPosition = function()
                local p = getProfile(module)
                return p.x, p.y
            end,
            setPosition = function(x, y)
                if not Adapter:InCombat() then
                    local p = getProfile(module)
                    p.x, p.y = x, y
                end
            end,
            applyPosition = function() return module:ApplyPosition() end,
            onSettings = function() module:OpenSettings() end,
            onLock = function() module:SetUnlocked(false) end,
        },
    })
    target:Show()
    overlay:Show()
    return overlay
end
local function GetAspectProfile(module) return module.db.profile end
local function GetTrackingProfile(module) return module.db.profile.tracking end
function Definition:RefreshMovement()
    local tracking = self.db.profile.tracking
    if self.unlocked then
        self.overlay = ShowMoveOverlay(self, self.moveTarget, self.overlay, "猎人守护条", GetAspectProfile)
    else HideMoveTarget(self.moveTarget, self.overlay) end
    if self.unlocked and tracking.enabled and tracking.detached then
        self.trackingOverlay = ShowMoveOverlay(self, self.trackingMoveTarget,
            self.trackingOverlay, "猎人追踪条", GetTrackingProfile)
    else HideMoveTarget(self.trackingMoveTarget, self.trackingOverlay) end
end
function Definition:ResetPosition()
    if Adapter:InCombat() then return false end
    self.db.profile.x, self.db.profile.y = 0, -300
    Tracking.ResetPosition(self.db.profile)
    if self.bar then self:ApplyPosition() end
    if ns.MoveNudge and ns.MoveNudge:IsShown() then
        if self.moveTarget then ns:RefreshMoveNudgeFrame(self.moveTarget) end
        if self.trackingMoveTarget then ns:RefreshMoveNudgeFrame(self.trackingMoveTarget) end
    end
    return true
end
ns.HunterAspects = ns.RegisterModule("HunterAspects", Definition)
