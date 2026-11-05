local _, ns = ...
if not ns.Build.HasModule("RangeMonitor") then return end
local Adapter = ns.RangeMonitorAdapter
local Definition = {
    defaultEnabled = true,
    defaults = { profile = { enabled = true, fontSize = 15, x = 0, y = -66 } },
}
local function Hide(frame) frame:Hide() end
local function OnFontChanged(owner, _, role)
    if role == "rangeMonitor" and owner.runtimeActive then owner:ApplyAppearance() end
end

-- RangeDisplay's effective Titan defaults, including its lower-bound red rule.
function Definition:FormatRange(low, high)
    if type(low) ~= "number" then return nil end
    if low >= 40 then return "40 +", 0.9, 0.055, 0.075 end
    local text = high and string.format("%d - %d", low, high) or string.format("%d +", low)
    if high and high <= 5 then return text, 0.9, 0.9, 0.9 end
    if high and high <= 20 then return text, 0.055, 0.875, 0.825 end
    if high and high <= 30 then return text, 0.035, 0.865, 0 end
    return text, 1, 0.82, 0
end
function Definition:GetProfile() return self.db.profile end
function Definition:Initialize()
    self.elapsed = 0
    ns.RangeMonitorSettings:Register(self)
end
function Definition:EnsureFrame()
    if self.frame then
        if not self.frameOwned then
            self:OwnFrame(self.frame, Hide, "RangeMonitor retained display")
            self.frameOwned = true
        end
        return self.frame
    end
    local frame = self:CreateFrame("Frame", nil, Adapter:GetRoot(), nil, Hide, "RangeMonitor display")
    self.frame, self.frameOwned = frame, true
    frame:SetSize(140, 30)
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(false)
    frame:SetFrameStrata("MEDIUM")
    self.text = frame:CreateFontString(nil, "OVERLAY")
    self.text:SetPoint("CENTER")
    self:ApplyAppearance()
    return frame
end
function Definition:ApplyAppearance()
    if not self.frame then return end
    local p = self:GetProfile()
    self.text:SetFont(Adapter:GetFont(), p.fontSize, "OUTLINE")
    self.frame:SetSize(math.max(140, p.fontSize * 8), p.fontSize + 14)
    self.frame:ClearAllPoints()
    self.frame:SetPoint("CENTER", Adapter:GetRoot(), "CENTER", p.x, p.y)
end
function Definition:Paint(text, r, g, b)
    if not text then if self.frame then self.frame:Hide() end return end
    self:EnsureFrame()
    if self.lastText ~= text then self.text:SetText(text) self.lastText = text end
    if self.r ~= r or self.g ~= g or self.b ~= b then
        self.text:SetTextColor(r, g, b) self.r, self.g, self.b = r, g, b
    end
    if not self.frame:IsShown() then self.frame:Show() end
end
function Definition:Refresh()
    if self.previewMode or self.isUnlocked then self:Paint(self:FormatRange(8, 28)) return end
    if not self.runtimeActive then self:Paint(nil) return end
    local low, high = Adapter:GetRange()
    self:Paint(self:FormatRange(low, high))
end
function Definition:Tick(elapsed)
    self.elapsed = self.elapsed + elapsed
    if self.elapsed < 0.2 then return end
    self.elapsed = 0
    self:Refresh()
end
function Definition:Sync()
    self:RemoveDriverConsumer("range-monitor", "target")
    self.elapsed = 0
    if self.runtimeActive and not self.previewMode and not self.isUnlocked and Adapter:HasTarget() then
        self:AddDriverConsumer("range-monitor", "target", self.Tick)
    end
    self:Refresh()
end
function Definition:Enable()
    self.runtimeActive = true
    Adapter:PrepareProbes()
    if ns.Font and ns.Font.Subscribe then ns.Font:Subscribe(self, OnFontChanged) end
    self:RegisterEvent("PLAYER_TARGET_CHANGED", self.Sync)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.Sync)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.LockForCombat)
    self:ApplyAppearance()
    self:Sync()
end
function Definition:LockForCombat()
    self.previewMode, self.isUnlocked = false, false
    if self.overlay then self.overlay:Hide() end
    self:Sync()
end
function Definition:Disable()
    self.runtimeActive = false
    if ns.Font and ns.Font.Unsubscribe then ns.Font:Unsubscribe(self) end
    self.previewMode, self.isUnlocked = false, false
    self:UnregisterAllEvents()
    self:RemoveDriverConsumer("range-monitor", "target")
    if self.overlay then self.overlay:Hide() self:ReleaseFrame(self.overlay) end
    if self.frame then self.frame:Hide() self:ReleaseFrame(self.frame) self.frameOwned = false end
end
function Definition:OpenSettings() return ns.UI:OpenMain("range-monitor") end
function Definition:SetPreview(value)
    if value and (not self:IsEnabled() or Adapter:InCombat()) then return false end
    self.previewMode = value == true
    self:Sync()
    return true
end
function Definition:SetUnlocked(value)
    if value and (not self:IsEnabled() or Adapter:InCombat()) then return false end
    self.isUnlocked = value == true
    if value then
        local frame = self:EnsureFrame()
        if not self.overlay then
            local module = self
            self.overlay = ns.MoveOverlay:Ensure(frame, {
                label = "距离监控",
                createFrame = function(parent)
                    return module:CreateFrame("Button", nil, parent, "BackdropTemplate", Hide, "RangeMonitor move overlay")
                end,
                canInteract = function() return not Adapter:InCombat() end,
                onSettings = function() return module:OpenSettings() end,
                onDragStop = function()
                    local x, y = frame:GetCenter()
                    local rootX, rootY = Adapter:GetRoot():GetCenter()
                    if x and rootX then
                        local scale = frame:GetEffectiveScale() / Adapter:GetRoot():GetEffectiveScale()
                        local p = module:GetProfile()
                        p.x, p.y = x * scale - rootX, y * scale - rootY
                        module:ApplyAppearance()
                    end
                end,
                nudgeConfig = {
                    label = "距离监控",
                    getPosition = function() local p = module:GetProfile() return p.x, p.y end,
                    setPosition = function(x, y) local p = module:GetProfile() p.x, p.y = x, y end,
                    applyPosition = function() module:ApplyAppearance() end,
                    onSettings = function() return module:OpenSettings() end,
                    onLock = function() module:SetUnlocked(false) end,
                },
            })
        end
        self:OwnFrame(self.overlay, Hide, "RangeMonitor move overlay")
        self.overlay:Show()
    elseif self.overlay then self.overlay:Hide() end
    self:Sync()
    return true
end
function Definition:ResetPosition()
    local p = self:GetProfile() p.x, p.y = 0, -66
    self:ApplyAppearance()
end
function Definition:ResetDefaults()
    if Adapter:InCombat() then return false end
    self.db:ResetProfile() self:ApplyAppearance() self:Sync() return true
end
function Definition:ProfileChanged() self:ApplyAppearance() self:Sync() end
local module = ns.RegisterModule("RangeMonitor", Definition)
ns.RangeMonitor, ns.RangeMonitorDefinition = module, Definition
