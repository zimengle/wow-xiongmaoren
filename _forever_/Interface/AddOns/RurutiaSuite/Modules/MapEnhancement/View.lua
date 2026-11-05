-- Owns windowed geometry and transient input surfaces; native UIPanel remains registered.
local _, ns = ...
if not ns.Build.HasModule("MapEnhancement") then return end
local Adapter = ns.MapEnhancementAdapter
local Controller = {}
Controller.__index = Controller
local FIELDS = { "xoffset", "yoffset", "bottomClampOverride", "minYOffset", "checkFit" }
function Controller:New(owner) return setmetatable({ owner = owner }, self) end

local function Layout(key) return _G.GetUIPanelLayoutAttribute(key) or 0 end
local function Clamp(value, low, high) return math.max(low, math.min(math.max(low, high), value)) end
local function Cursor()
    local x, y = _G.GetCursorPosition()
    local scale = _G.UIParent:GetEffectiveScale()
    return x / scale, _G.UIParent:GetHeight() - y / scale
end

-- Shared placement math: UIParent extent, logical window size and scale limit.
local function PlacementBox(map)
    local parent = _G.UIParent
    if not map or not parent or type(parent.GetWidth) ~= "function" then return nil end
    local width, height = parent:GetWidth(), parent:GetHeight()
    local parentRatio = map:GetEffectiveScale() / map:GetScale() / parent:GetEffectiveScale()
    local w, h = map:GetWidth() * parentRatio, map:GetHeight() * parentRatio
    if w <= 0 or h <= 0 or width <= 0 or height <= 0 then return nil end
    return {
        width = width, height = height, w = w, h = h,
        parentRatio = parentRatio,
        maximum = math.max(0.5, math.min(2, width / w, height / h)),
    }
end

function Controller:CanAdjust()
    return self.attached and self.owner.runtimeActive and not self.pendingRestore
        and not Adapter:IsInCombat() and self.map:IsShown() and not self.map:IsMaximized()
end

function Controller:Geometry()
    local ratio = self.map:GetEffectiveScale() / _G.UIParent:GetEffectiveScale()
    return self.map:GetLeft() * ratio, _G.UIParent:GetHeight() - self.map:GetTop() * ratio
end

function Controller:SetAttribute(key, value)
    if Adapter:GetLayout(self.map, key) ~= value then _G.SetUIPanelAttribute(self.map, key, value) end
    self.applied[key] = value
end

function Controller:RestoreNative()
    if not self.original then return end
    for _, key in ipairs(FIELDS) do
        local applied = self.applied[key]
        if applied ~= nil and Adapter:GetLayout(self.map, key) == applied then
            _G.SetUIPanelAttribute(self.map, key, self.original[key])
        end
    end
    if self.lastScale and self.map:GetScale() == self.lastScale then
        self.map:SetScale(self.original.scale)
    end
    self.applied, self.lastScale = {}, nil
end

function Controller:Place(x, y, scale, centered)
    local map = self.map
    -- Account for a non-default parent scale as well as UI scale.
    local box = PlacementBox(map)
    if not box then return end
    local width, height, w, h = box.width, box.height, box.w, box.h
    local parentRatio = box.parentRatio
    scale = Clamp(scale, 0.5, box.maximum)
    if centered then x = (width - w * scale) / 2 end
    x, y = Clamp(x, 0, width - w * scale), Clamp(y, 0, height - h * scale)
    self.lastScale = scale
    map:SetScale(scale)
    self:SetAttribute("checkFit", 0)
    self:SetAttribute("bottomClampOverride", 0)
    self:SetAttribute("minYOffset", 0)
    self:SetAttribute("xoffset", x - Layout("LEFT_OFFSET"))
    self:SetAttribute("yoffset", -y - Layout("TOP_OFFSET"))
    -- Only the map is repositioned per mouse sample; no panel-manager sweep.
    map:ClearAllPoints()
    map:SetPoint("TOPLEFT", _G.UIParent, "TOPLEFT", x / (scale * parentRatio), -y / (scale * parentRatio))
end

-- Saved or effective windowed position in UIParent logical pixels (top-left
-- origin). The settings sliders and the bounded x/y writes share this so they
-- follow the same clamp rules as Place.
function Controller:WindowedPosition()
    local p = self.owner:GetProfile()
    local box = PlacementBox(self.map) or PlacementBox(Adapter:Resolve())
    if self:CanAdjust() then
        local x, y = self:Geometry()
        return { x = x, y = y, box = box }
    end
    local x = p.x or (Layout("LEFT_OFFSET") + ((self.original and self.original.xoffset) or 0))
    local y = p.y or (10 - Layout("TOP_OFFSET") - ((self.original and self.original.yoffset) or 0))
    if box then
        local scale = Clamp(p.scale or 1.3, 0.5, box.maximum)
        if p.centerHorizontal then x = (box.width - box.w * scale) / 2 end
        x = Clamp(x, 0, math.max(0, box.width - box.w * scale))
        y = Clamp(y, 0, math.max(0, box.height - box.h * scale))
    end
    return { x = x, y = y, box = box }
end

-- One bounded axis write. Both axes are stored so a later Normalize never
-- clears the axis the slider did not touch.
function Controller:SetWindowedAxis(axis, value)
    if axis ~= "x" and axis ~= "y" then return false end
    local position = self:WindowedPosition()
    local x, y, box = position.x, position.y, position.box
    if axis == "x" then x = value else y = value end
    if box then
        local scale = Clamp(self.owner:GetProfile().scale or 1.3, 0.5, box.maximum)
        x = Clamp(x, 0, math.max(0, box.width - box.w * scale))
        y = Clamp(y, 0, math.max(0, box.height - box.h * scale))
    end
    local p = self.owner:GetProfile()
    p.x, p.y = x, y
    self:Apply()
    local applied = self:WindowedPosition()
    return true, (axis == "x" and applied.x or applied.y)
end

function Controller:Apply()
    if self.applying or not self.attached then return end
    self.applying = true
    if Adapter:IsInCombat() then
        self:StopGesture(true)
        if self.map:IsMaximized() then self.pendingMaximizedSync = true end
        self.title:Hide(); self.grip:Hide()
    elseif self.map:IsMaximized() then
        self:StopGesture(true)
        self.title:Hide(); self.grip:Hide()
        local needsSync = self.pendingMaximizedSync or next(self.applied) ~= nil or self.lastScale ~= nil
        self.pendingMaximizedSync = nil
        self:RestoreNative()
        if needsSync then
            self.map:UpdateMaximizedSize()
        end
    elseif self.map:IsShown() then
        self.pendingMaximizedSync = nil
        local p = self.owner:GetProfile()
        local g = self.gesture
        local x = g and g.lastX or p.x or (Layout("LEFT_OFFSET") + (self.original.xoffset or 0))
        local y = g and g.lastY or p.y or (10 - Layout("TOP_OFFSET") - (self.original.yoffset or 0))
        self:Place(x, y, g and g.lastScale or p.scale, not g and p.centerHorizontal)
        if g then
            g.lastX, g.lastY = self:Geometry()
            g.lastScale = self.map:GetScale()
        elseif p.scale ~= self.map:GetScale() then
            p.scale = self.map:GetScale()
            self.owner:RefreshSettings()
        end
        self.title:SetShown(p.allowMove)
        self.grip:SetShown(p.allowScale)
    end
    self.applying = false
end

function Controller:SyncPanels()
    if self:CanAdjust() and not self.applying then _G.UpdateUIPanelPositions(self.map) end
end

function Controller:SavePosition()
    if not self.attached or not self.map:IsShown() or self.map:IsMaximized() then return end
    local p = self.owner:GetProfile()
    p.x, p.y = self:Geometry()
end

function Controller:StopGesture(save)
    local gesture = self.gesture
    if not gesture then return end
    self.gesture = nil
    self.owner:ClearOnUpdate(self.tracker)
    self.tracker:Hide()
    if save then
        -- Use the last windowed sample, even if native maximize already changed size.
        local p = self.owner:GetProfile()
        p.x, p.y = gesture.lastX, gesture.lastY
        if gesture.kind == "scale" then p.scale = gesture.lastScale end
    end
    if save then self:SyncPanels() end
    self.owner:RefreshSettings()
end

function Controller:BeginGesture(kind, button)
    if button ~= "LeftButton" or not self:CanAdjust() then return end
    local p = self.owner:GetProfile()
    if (kind == "move" and not p.allowMove) or (kind == "scale" and not p.allowScale) then return end
    self:StopGesture(true)
    -- Direct dragging switches to a freely positioned window.
    if kind == "move" then p.centerHorizontal = false end
    local x, y = self:Geometry()
    local cx, cy = Cursor()
    local ratio = self.map:GetEffectiveScale() / self.map:GetScale() / _G.UIParent:GetEffectiveScale()
    self.gesture = { kind = kind, x = x, y = y, cursorX = cx, cursorY = cy,
        width = self.map:GetWidth() * ratio, height = self.map:GetHeight() * ratio,
        scale = self.map:GetScale(), lastX = x, lastY = y, lastScale = self.map:GetScale() }
    self.tracker:Show()
    self.owner:SetOnUpdate(self.tracker, function() self:UpdateGesture() end, "MapEnhancement:drag")
end

function Controller:UpdateGesture()
    local g = self.gesture
    if not g then return end
    if not self:CanAdjust() or not _G.IsMouseButtonDown("LeftButton") then
        self:StopGesture(true); return
    end
    local cx, cy = Cursor()
    local x, y, scale = g.x, g.y, g.scale
    if g.kind == "move" then x, y = x + cx - g.cursorX, y + cy - g.cursorY
    else
        -- Project the cursor delta on the window diagonal; retain aspect and origin.
        local delta = ((cx - g.cursorX) * g.width + (cy - g.cursorY) * g.height)
            / (g.width * g.width + g.height * g.height)
        scale = Clamp(g.scale + delta, 0.5, 2)
        local width, height = _G.UIParent:GetWidth(), _G.UIParent:GetHeight()
        scale = math.min(scale, math.max(0.5, math.min((width - x) / g.width, (height - y) / g.height)))
    end
    self:Place(x, y, scale)
    g.lastX, g.lastY = self:Geometry()
    g.lastScale = self.map:GetScale()
end

function Controller:CreateControls()
    if not self.title then
        local map = self.map
        self.title = self.owner:CreateFrame("Frame", nil, map, nil, nil, "MapEnhancement:title")
        self.title:SetPoint("TOPLEFT", map, "TOPLEFT", 35, -3)
        self.title:SetPoint("TOPRIGHT", map, "TOPRIGHT", -100, -3)
        self.title:SetHeight(20)
        self.title:EnableMouse(true)
        self.title:SetFrameLevel(map:GetFrameLevel() + 20)
        self.title:RegisterForDrag("LeftButton")
        self.title:SetScript("OnDragStart", function() self:BeginGesture("move", "LeftButton") end)
        self.title:SetScript("OnDragStop", function() self:StopGesture(true) end)
        self.grip = self.owner:CreateFrame("Button", nil, map, nil, nil, "MapEnhancement:grip")
        self.grip:SetSize(32, 32)
        -- Center the hit target on the visible corner, including its outer edge.
        self.grip:SetPoint("CENTER", map, "BOTTOMRIGHT", 0, 0)
        self.grip:SetFrameLevel(map:GetFrameLevel() + 50)
        self.grip:EnableMouse(true)
        -- Native solid lines, no third-party artwork.
        for i = 1, 3 do
            local line = self.grip:CreateTexture(nil, "OVERLAY")
            line:SetColorTexture(0.85, 0.72, 0.38, 0.9)
            line:SetSize(3 * i, 2)
            line:SetPoint("BOTTOMRIGHT", self.grip, "CENTER", 3, 3 * i - 5)
        end
        local highlight = self.grip:CreateTexture(nil, "BACKGROUND")
        highlight:SetAllPoints(self.grip)
        highlight:SetColorTexture(0.85, 0.72, 0.38, 0.22)
        highlight:Hide()
        self.grip:SetScript("OnEnter", function() highlight:Show() end)
        self.grip:SetScript("OnLeave", function() highlight:Hide() end)
        self.grip:SetScript("OnHide", function() highlight:Hide() end)
        self.grip:SetScript("OnMouseDown", function(_, button) self:BeginGesture("scale", button) end)
        self.grip:SetScript("OnMouseUp", function() self:StopGesture(true) end)
        self.tracker = self.owner:CreateFrame("Frame", nil, _G.UIParent, nil, nil, "MapEnhancement:tracker")
        self.tracker:EnableMouse(false)
    else
        for _, frame in ipairs({ self.title, self.grip, self.tracker }) do self.owner:OwnFrame(frame) end
    end
    self.title:Hide(); self.grip:Hide(); self.tracker:Hide()
end

function Controller:Attach(map)
    self.map = map
    self.original, self.applied = { scale = map:GetScale() }, {}
    for _, key in ipairs(FIELDS) do self.original[key] = Adapter:GetLayout(map, key) end
    self:CreateControls()
    self.attached = true
    local owner = self.owner
    self.tokens = {
        owner:ObserveMapScript(map, "OnShow", function()
            self:Apply()
            ns.MapEnhancementReveal:Sync()
        end, "MapEnhancement:show"),
        owner:ObserveMapScript(map, "OnHide", function()
            self:StopGesture(true)
            ns.MapEnhancementReveal:Sync()
        end, "MapEnhancement:hide"),
        owner:ObserveMapFunction(map, "Minimize", function() self:Apply() end, "MapEnhancement:minimize"),
        owner:ObserveMapFunction(map, "Maximize", function()
            self:StopGesture(true)
            self:Apply()
        end, "MapEnhancement:maximize"),
        owner:ObserveMapFunction("UpdateUIPanelPositions", function() self:Apply() end, "MapEnhancement:layout"),
    }
end

function Controller:Refresh()
    if not self.owner.runtimeActive then return end
    if Adapter:GetRevealConflict() then self:Detach(); return end
    if Adapter:IsInCombat() then
        if Adapter:GetConflict() then self:Detach()
        elseif self.attached then self:Apply() end
        return
    end
    if self.pendingRestore then self:FinishDetach() end
    local map = Adapter:Resolve()
    if not map or not map.Minimize or not map.Maximize or not map.UpdateMaximizedSize
        or not _G.SetUIPanelAttribute or not map.GetAttribute
        or not _G.GetUIPanelLayoutAttribute or not _G.UpdateUIPanelPositions then return end
    local profile = self.owner:GetProfile()
    if not Adapter:AcquireWindow(profile, map) then self:Detach(); return end
    self.windowProfile = profile
    if Adapter:GetConflict() then self:Detach(); return end
    if not self.attached then self:Attach(map) end
    self:Apply()
    self:SyncPanels()
end

function Controller:ResetPosition()
    if self.attached and not Adapter:IsInCombat() then self:Apply(); self:SyncPanels() end
end

function Controller:WatchPreview(map)
    -- A transient child observes parent hiding without installing permanent hooks.
    -- Preview can be used while the runtime module is disabled.
    -- Intentionally bypass Runtime ownership: preview may run while the module
    -- is disabled, and this frame is a short-lived child of the Blizzard map.
    if not self.previewWatch then self.previewWatch = _G.CreateFrame("Frame", nil, map) end
    self.previewWatch:SetScript("OnHide", function() self.owner:CancelPreviewOwnership() end)
    self.previewWatch:Show()
end

function Controller:QueuePreviewClose()
    if not self.previewWatch then return end
    self.previewWatch:RegisterEvent("PLAYER_REGEN_ENABLED")
    self.previewWatch:SetScript("OnEvent", function() self.owner:TogglePreview(false) end)
end

function Controller:ClearPreviewWatch()
    if not self.previewWatch then return end
    self.previewWatch:UnregisterAllEvents()
    self.previewWatch:SetScript("OnEvent", nil)
    self.previewWatch:SetScript("OnHide", nil)
    self.previewWatch:Hide()
end

function Controller:FinishDetach()
    if Adapter:IsInCombat() then return end
    self.pendingRestore = false
    self.pendingMaximizedSync = nil
    if self.cleanupFrame then self.cleanupFrame:UnregisterAllEvents(); self.cleanupFrame:SetScript("OnEvent", nil) end
    if self.original then
        self:RestoreNative()
        if self.map:IsShown() then
            if self.map:IsMaximized() then self.map:UpdateMaximizedSize()
            else _G.UpdateUIPanelPositions(self.map) end
        end
    end
    self.original = nil
    Adapter:ReleaseWindow(self.windowProfile or self.owner:GetProfile())
    self.windowProfile = nil
end

function Controller:Detach()
    self:StopGesture(false)
    if not self.attached then
        if not Adapter:IsInCombat() then self:FinishDetach() end
        return
    end
    self.attached = false
    self.title:Hide(); self.grip:Hide(); self.tracker:Hide()
    for _, token in ipairs(self.tokens or {}) do self.owner:RemoveMapObserver(token) end
    self.tokens = nil
    if Adapter:IsInCombat() then
        self.pendingRestore = true
        -- One-shot restoration must survive Runtime disabling and releasing its events.
        -- Intentionally bypass Runtime ownership: this frame may be created
        -- during detach/Disable when the module can no longer own resources.
        if not self.cleanupFrame then self.cleanupFrame = _G.CreateFrame("Frame") end
        self.cleanupFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        self.cleanupFrame:SetScript("OnEvent", function() self:FinishDetach() end)
    else self:FinishDetach() end
end

ns.MapEnhancementView = Controller
