local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Adapter = ns.HunterAspectsAdapter
local ACTIVE_COLOR = {139 / 255, 215 / 255, 116 / 255, 1}
local DEFAULTS = {x = 0, y = -300, iconWidth = 30, iconHeight = 30, spacing = 1,
    alignment = "CENTER", direction = "RIGHT"}
local ALIGNMENTS = {LEFT = true, CENTER = true, RIGHT = true, TOP = true, BOTTOM = true}
local DIRECTIONS = {LEFT = true, RIGHT = true, UP = true, DOWN = true}
local Definition = {defaultEnabled = true, defaults = {profile = DEFAULTS}}
local function Hide(frame) frame:Hide() end
function Definition:Initialize()
    self.buttons = {}
    self.previewButtons = {}
    if self.db.profile.x == 0 and (self.db.profile.y == -220 or self.db.profile.y == -270) then self.db.profile.y = -300 end
    ns.HunterAspectsSettings:Register(self)
    ns:RegisterMoveProvider({name = "HunterAspects", reset = "ResetPosition",
        isMovable = function(module) return Adapter:IsHunter() and module:IsEnabled() end})
end
function Definition:OpenSettings() return ns.UI:OpenMain("hunter-aspects") end
function Definition:SetEnabled(enabled)
    if Adapter:InCombat() then return false, "请脱离战斗后修改。" end
    return ns.Assembly:SetModuleEnabled("HunterAspects", enabled == true)
end
function Definition:ApplyPosition()
    if Adapter:InCombat() then return false end
    for _, frame in ipairs({self.bar, self.moveTarget, self.previewBar}) do
        frame:ClearAllPoints()
        frame:SetPoint(self.db.profile.alignment, UIParent, "CENTER", self.db.profile.x, self.db.profile.y)
    end
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
    if self:IsEnabled() and Adapter:IsHunter() then self:Refresh() end
    return true
end
function Definition:EnsureFrames()
    if self.bar then
        self:OwnFrame(self.bar, Hide)
        self:OwnFrame(self.moveTarget, Hide)
        if self.overlay then self:OwnFrame(self.overlay, Hide) end
        for _, button in ipairs(self.buttons) do self:OwnFrame(button, Hide) end
        return
    end
    self.bar = self:CreateFrame("Frame", "RSHunterAspects", UIParent, nil, Hide)
    -- The movement target has no protected children or anchors to secure frames.
    self.moveTarget = self:CreateFrame("Frame", nil, UIParent, nil, Hide)
    self.moveTarget:SetMovable(true)
    self.moveTarget:SetClampedToScreen(true)
    self.moveTarget:Hide()
end
function Definition:Refresh()
    if Adapter:InCombat() then self.pending = true; return end
    self.pending = false
    self:EnsureFrames()
    self.rows = Adapter:Learned()
    local p = self.db.profile
    local vertical = p.direction == "UP" or p.direction == "DOWN"
    local start = p.direction == "LEFT" and "RIGHT" or p.direction == "UP" and "BOTTOM"
        or p.direction == "DOWN" and "TOP" or "LEFT"
    for index, row in ipairs(self.rows) do
        local button = self.buttons[index]
        if not button then
            button = self:CreateFrame("Button", nil, self.bar, "SecureActionButtonTemplate", Hide)
            self.buttons[index] = button
            button.icon = button:CreateTexture(nil, "ARTWORK")
            button.icon:SetAllPoints(button)
            button.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            button.border = ns.UI.PixelBorder:Ensure(button)
            button:SetScript("OnEnter", function(b) Adapter:Tooltip(b, b.row) end)
            button:SetScript("OnLeave", function() Adapter:HideTooltip() end)
        end
        button.row = row
        button.visualState = nil
        button:SetSize(p.iconWidth, p.iconHeight)
        button:ClearAllPoints()
        local step = (index - 1) * ((vertical and p.iconHeight or p.iconWidth) + p.spacing)
        button:SetPoint(start, self.bar, start,
            vertical and 0 or (p.direction == "LEFT" and -step or step),
            vertical and (p.direction == "DOWN" and -step or step) or 0)
        button.icon:SetTexture(row.icon)
        Adapter:Configure(button, row.name)
        button:Show()
    end
    for i = #self.rows + 1, #self.buttons do
        self.buttons[i]:Hide()
        self.buttons[i]:SetAttribute("type1", nil)
        self.buttons[i]:SetAttribute("spell1", nil)
    end
    -- Three empty slots give unlearned hunters a useful layout preview, without secure spells.
    local count = #self.rows > 0 and #self.rows or 3
    local width = vertical and p.iconWidth or (count * (p.iconWidth + p.spacing) - p.spacing)
    local height = vertical and (count * (p.iconHeight + p.spacing) - p.spacing) or p.iconHeight
    self.bar:SetSize(width, height)
    self.moveTarget:SetSize(width, height)
    self:ApplyPosition()
    if #self.rows > 0 then self.bar:Show() else self.bar:Hide() end
    self:RefreshPreview()
    if self.unlocked then self:SetUnlocked(true) end
    self:RefreshAuras()
end
function Definition:RefreshAuras()
    for i, row in ipairs(self.rows or {}) do
        local active = Adapter:Active(row.name)
        local state = active == true and "active" or active == false and "inactive" or "unknown"
        -- Only textures change in combat, never the secure button's geometry.
        local button = self.buttons[i]
        if button.visualState ~= state then
            button.icon:SetAlpha(active == false and 0.4 or 1)
            ns.UI.PixelBorder:Update(button.border, ACTIVE_COLOR, active == true)
            button.visualState = state
        end
    end
end
function Definition:OnAura(_, unit) if unit == "player" then self:RefreshAuras() end end
function Definition:OnCombat()
    self.unlocked, self.preview = false, false
    if self.previewBar then self.previewBar:Hide() end
    if self.moveTarget then self.moveTarget:Hide() end
    Adapter:HideTooltip()
end
function Definition:OnRegen() if self.pending then self:Refresh() end end
function Definition:Enable()
    if not Adapter:IsHunter() then return end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.Refresh)
    self:RegisterEvent("SPELLS_CHANGED", self.Refresh)
    self:RegisterEvent("UNIT_AURA", self.OnAura)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnCombat)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.OnRegen)
    self:Refresh()
end
function Definition:Disable()
    self.unlocked, self.pending, self.rows, self.preview = false, false, nil, false
    Adapter:HideTooltip()
    self:UnregisterAllEvents()
end
-- Cosmetic preview is separate from protected live buttons and movement overlay.
function Definition:SetPreview(value)
    if Adapter:InCombat() or not self:IsEnabled() or not self.bar then return false end
    Adapter:HideTooltip()
    self.preview = value == true
    if self.preview then self.unlocked = false; self.moveTarget:Hide() end
    self:Refresh()
    return true
end
function Definition:RefreshPreview()
    local show = self.preview or (self.unlocked and #self.rows == 0)
    if not show then
        if self.previewBar then self.previewBar:Hide() end
        return
    end
    if not self.previewBar then
        self.previewBar = self:CreateFrame("Frame", nil, UIParent, nil, Hide)
    else self:OwnFrame(self.previewBar, Hide) end
    local rows, p = Adapter:Preview(), self.db.profile
    local vertical = p.direction == "UP" or p.direction == "DOWN"
    local start = p.direction == "LEFT" and "RIGHT" or p.direction == "UP" and "BOTTOM"
        or p.direction == "DOWN" and "TOP" or "LEFT"
    for i, row in ipairs(rows) do
        local b = self.previewButtons[i]
        if not b then
            b = self:CreateFrame("Button", nil, self.previewBar, nil, Hide)
            self.previewButtons[i] = b
            b.icon = b:CreateTexture(nil, "ARTWORK"); b.icon:SetAllPoints(b)
            b.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            b.border = ns.UI.PixelBorder:Ensure(b)
            b:SetScript("OnEnter", function(button) Adapter:Tooltip(button, button.row, true) end)
            b:SetScript("OnLeave", function() Adapter:HideTooltip() end)
        else self:OwnFrame(b, Hide) end
        b.row = row
        b:SetSize(p.iconWidth, p.iconHeight); b:ClearAllPoints()
        local step = (i - 1) * ((vertical and p.iconHeight or p.iconWidth) + p.spacing)
        b:SetPoint(start, self.previewBar, start, vertical and 0 or (p.direction == "LEFT" and -step or step),
            vertical and (p.direction == "DOWN" and -step or step) or 0)
        b.icon:SetTexture(row.icon); b.icon:SetAlpha(i == 1 and 1 or 0.4)
        ns.UI.PixelBorder:Update(b.border, ACTIVE_COLOR, i == 1)
        b:Show()
    end
    local count = math.max(1, #rows)
    local w = vertical and p.iconWidth or count * (p.iconWidth + p.spacing) - p.spacing
    local h = vertical and count * (p.iconHeight + p.spacing) - p.spacing or p.iconHeight
    self.previewBar:SetSize(w, h)
    if self.unlocked then self.moveTarget:SetSize(w, h) end
    self:ApplyPosition()
    self.previewBar:Show()
    -- Keep secure live buttons available for combat; preview occupies the same position.
    self.previewBar:SetFrameLevel(self.bar:GetFrameLevel() + 10)
end
function Definition:SetUnlocked(value)
    if Adapter:InCombat() or not self:IsEnabled() or not self.bar then return false end
    self.unlocked = value == true
    if self.unlocked then self.preview = false; if #self.rows > 0 then self.bar:Show() end end
    self:RefreshPreview()
    if not self.unlocked then self.moveTarget:Hide(); return true end
    local module = self
    self.overlay = ns.MoveOverlay:Ensure(self.moveTarget, {
        label = "猎人守护条",
        createFrame = function(parent) return module:CreateFrame("Button", nil, parent, "BackdropTemplate", Hide) end,
        canInteract = function() return not Adapter:InCombat() end,
        onDragStop = function()
            if Adapter:InCombat() then return end
            local x, y = module.moveTarget:GetCenter()
            local cx, cy = UIParent:GetCenter()
            local alignment = module.db.profile.alignment
            if alignment == "LEFT" then x = x - module.moveTarget:GetWidth() / 2
            elseif alignment == "RIGHT" then x = x + module.moveTarget:GetWidth() / 2
            elseif alignment == "TOP" then y = y + module.moveTarget:GetHeight() / 2
            elseif alignment == "BOTTOM" then y = y - module.moveTarget:GetHeight() / 2 end
            module.db.profile.x, module.db.profile.y = x - cx, y - cy
            module:ApplyPosition()
        end,
        onSettings = function() module:OpenSettings() end,
        nudgeConfig = {
            label = "猎人守护条",
            getPosition = function() return module.db.profile.x, module.db.profile.y end,
            setPosition = function(x, y)
                if not Adapter:InCombat() then module.db.profile.x, module.db.profile.y = x, y end
            end,
            applyPosition = function() return module:ApplyPosition() end,
            onSettings = function() module:OpenSettings() end,
            onLock = function() module:SetUnlocked(false) end,
        },
    })
    self.moveTarget:Show()
    self.overlay:Show()
    return true
end
function Definition:ResetPosition()
    if Adapter:InCombat() then return false end
    self.db.profile.x, self.db.profile.y = 0, -300
    if self.bar then self:ApplyPosition() end
    return true
end
ns.HunterAspects = ns.RegisterModule("HunterAspects", Definition)
