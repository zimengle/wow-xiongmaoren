local addonName, ns = ...
local Adapter = ns.MinimapCollectorAdapter
local defaults = { excluded = {}, direction = "left", offsetX = 0, offsetY = 0,
    columns = 0, buttonSize = 32, spacing = 0, hideDelay = 0, padding = 5, minWidth = 0, minHeight = 0,
    backgroundColor = { 0.04, 0.04, 0.04 }, opacity = 0.96, autoAvoid = true, collectExpansion = false }
local Definition = { defaultEnabled = true, defaults = { profile = defaults } }
local ranges = { offsetX = {-500, 500}, offsetY = {-500, 500}, columns = {0, 12},
    buttonSize = {16, 64}, spacing = {0, 32}, padding = {0, 64}, minWidth = {0, 1000},
    minHeight = {0, 1000}, hideDelay = {0, 30}, opacity = {0, 1} }
local directions = {left = true, right = true, up = true, down = true, auto = true,
    leftUp = true, rightUp = true, leftDown = true, rightDown = true}
function Definition:GetOption(key)
    local value = self.db.profile[key]
    if ranges[key] then
        local range = ranges[key]
        value = tonumber(value)
        if not value or value ~= value then value = defaults[key] end
        value = math.max(range[1], math.min(range[2], value))
        return key == "opacity" and value or math.floor(value)
    end
    if key == "direction" then return directions[value] and value or defaults.direction end
    if key == "autoAvoid" then return value ~= false end
    if key == "collectExpansion" then return value == true end
    if key == "backgroundColor" then
        local color = {}
        for i = 1, 3 do
            local v = type(value) == "table" and tonumber(value[i]) or defaults.backgroundColor[i]
            color[i] = v and v == v and math.max(0, math.min(1, v)) or defaults.backgroundColor[i]
        end
        return color
    end
    return value == nil and defaults[key] or value
end
function Definition:SetOption(key, value)
    if defaults[key] == nil or key == "excluded" or key == "autoAvoid" then return end
    self.db.profile[key] = value
    self.db.profile[key] = self:GetOption(key)
    self:Refresh()
end
function Definition:GetConflict() return Adapter:GetBlocker() end
function Definition:SetAutoAvoid(value, confirmedReason)
    local current = self:GetConflict()
    if not value and current and current ~= confirmedReason then return false end
    self.db.profile.autoAvoid = value == true
    self.confirmedBlocker = not value and current or nil
    self:Refresh()
    return true
end
function Definition:ResetPosition()
    self.db.profile.direction, self.db.profile.offsetX, self.db.profile.offsetY = defaults.direction, 0, 0
    self:Refresh()
end
function Definition:ResetOptions()
    for key in pairs(defaults) do self.db.profile[key] = nil end
    self.db.profile.excluded = {}
    self.confirmedBlocker = nil
    self:Refresh()
end
function Definition:SetPreview(value)
    if Adapter:InCombat() then
        if not value then
            self.previewMode = false
            if self.panel and Adapter:IsSafe(self.panel, true) then self.panel:Hide() end
        end
        return
    end
    self.previewMode = false
    if value then self:Refresh() end
    if self.panel and not Adapter:InCombat() then
        self.previewMode = value and self.active and not self.blocker and not self.pending and (self.count or 0) > 0 or false
        self.panel:SetShown(self.previewMode)
        self:StartDismiss()
    end
end
local function HidePanel(panel)
    if Adapter:IsSafe(panel, true) then panel:Hide() end
end

local function Refresh(module) module:Refresh() end
local function Queue(module)
    if module.active and not module.mutating then module:RequestRefresh("icons", Refresh) end
end

function Definition:Initialize()
    self.owned = {}
    if type(self.db.profile.excluded) ~= "table" then self.db.profile.excluded = {} end
    ns.MinimapCollectorSettings:Register(self)
end

-- Dismissal resources exist only while the ordinary popup is visible.
function Definition:StopDismiss()
    self:UnregisterEvent("GLOBAL_MOUSE_DOWN")
    if self.hideTimer then self:CancelSchedule(self.hideTimer); self.hideTimer = nil end
    for _, saved in pairs(self.owned) do
        if saved.clickHook then self:RemoveHook(saved.clickHook); saved.clickHook = nil end
    end
end

local function IconClicked(module, button)
    if module.panel and module.panel:IsShown() and module.owned[button]
        and button:GetParent() == module.panel then
        HidePanel(module.panel)
    end
end

local function OutsideClicked(module, _, button)
    if button ~= "LeftButton" or not module.active or module.previewMode
        or not module.panel or not module.panel:IsShown() then return end
    if module.panel:IsMouseOver() then return end
    -- Let the launcher's own click toggle the popup; do not close then reopen it.
    if module.launcher and module.launcher:IsMouseOver() then return end
    HidePanel(module.panel)
end

function Definition:StartDismiss()
    self:StopDismiss()
    if not self.active or self.previewMode or not self.panel or not self.panel:IsShown() then return end
    self:RegisterEvent("GLOBAL_MOUSE_DOWN", OutsideClicked)
    for button, saved in pairs(self.owned) do
        if button:GetParent() == self.panel and Adapter:IsSafe(button) then
            local script = button:HasScript("OnClick") and "OnClick" or "OnMouseUp"
            saved.clickHook = self:HookFrameScript(button, script, IconClicked, "collector dismiss")
        end
    end
    local delay = self:GetOption("hideDelay")
    if delay == 0 then return end
    self.hideTimer = self:Schedule(delay, function(module)
        module.hideTimer = nil
        HidePanel(module.panel)
    end, "collector auto hide")
end

function Definition:EnsurePanel()
    if self.panel then self:OwnFrame(self.panel, HidePanel); return self.panel end
    local panel = self:CreateFrame("Frame", "RurutiaSuiteMinimapCollector", _G.UIParent, nil, HidePanel)
    panel:SetFrameStrata("DIALOG")
    panel:SetClampedToScreen(true)
    panel:EnableMouse(true)
    panel:Hide()
    local bg = panel:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.04, 0.04, 0.04, 0.96)
    panel:SetScript("OnMouseUp", function(_, button) if button == "RightButton" then HidePanel(panel) end end)
    _G.UISpecialFrames = _G.UISpecialFrames or {}
    table.insert(_G.UISpecialFrames, "RurutiaSuiteMinimapCollector")
    self.background = bg
    self.panel = panel
    panel:SetScript("OnShow", function() self:StartDismiss() end)
    panel:SetScript("OnHide", function() self.previewMode = false; self:StopDismiss() end)
    return panel
end

-- LibDBIcon fixes strata/level. Preserve those flags and every visual child;
-- changing only the button can leave its art below the popup background.
local function CaptureVisuals(button, saved)
    saved.visuals = saved.visuals or {}
    saved.visualOrder = saved.visualOrder or {}
    local function Visit(frame, depth)
        if depth > 8 or not Adapter:IsSafe(frame) then return end
        if not saved.visuals[frame] then
            saved.visualOrder[#saved.visualOrder + 1] = frame
            saved.visuals[frame] = {
                parent = frame:GetParent(), strata = frame:GetFrameStrata(), level = frame:GetFrameLevel(),
                fixedStrata = frame.HasFixedFrameStrata and frame:HasFixedFrameStrata(),
                fixedLevel = frame.HasFixedFrameLevel and frame:HasFixedFrameLevel(),
                alpha = frame.GetAlpha and frame:GetAlpha(), depth = depth,
            }
        end
        if frame.GetChildren then
            for _, child in ipairs({ frame:GetChildren() }) do Visit(child, depth + 1) end
        end
    end
    Visit(button, 0)
end

local function ApplyVisuals(button, saved, panel, restoring)
    for _, frame in ipairs(saved.visualOrder or {}) do
        local state = saved.visuals[frame]
        -- Do not touch children moved away by their original owner.
        local current, belongs = frame, frame == button
        for _ = 1, 8 do
            if belongs or not current.GetParent then break end
            current = current:GetParent()
            if not current then break end
            belongs = current == button
        end
        if belongs and Adapter:IsSafe(frame, restoring) then
            if frame.SetFixedFrameStrata then frame:SetFixedFrameStrata(false) end
            if frame.SetFixedFrameLevel then frame:SetFixedFrameLevel(false) end
            frame:SetFrameStrata(restoring and state.strata or panel:GetFrameStrata())
            frame:SetFrameLevel(restoring and state.level or panel:GetFrameLevel() + 5 + state.depth)
            if frame == button and frame.SetAlpha then frame:SetAlpha(restoring and state.alpha or 1) end
            if frame.SetFixedFrameStrata then frame:SetFixedFrameStrata(restoring and state.fixedStrata == true or not restoring) end
            if frame.SetFixedFrameLevel then frame:SetFixedFrameLevel(restoring and state.fixedLevel == true or not restoring) end
        end
    end
end

-- Only known minimap decorations are hidden; unknown overlays may carry state.
local decorationIDs = { [136430] = true, [136467] = true, [136477] = true }
local function IsDecoration(texture)
    if not texture or not texture.GetTexture then return false end
    local value = texture:GetTexture()
    if decorationIDs[value] then return true end
    if type(value) ~= "string" then return false end
    value = value:lower():gsub("/", "\\"):gsub("%.blp$", "")
    return value == "interface\\minimap\\minimap-trackingborder"
        or value == "interface\\minimap\\ui-minimap-background"
        or value == "interface\\minimap\\ui-minimap-zoombutton-highlight"
end

local function FindIcon(button)
    local icon = button.icon or button.Icon
    if (type(icon) == "table" or type(icon) == "userdata") and icon.GetTexture
        and icon:GetParent() == button and not IsDecoration(icon) then return icon end
    -- Multiple unknown regions are ambiguous: keep their original artwork.
    local candidate
    if button.GetRegions then
        for _, region in ipairs({ button:GetRegions() }) do
            if region.GetTexture and region:GetTexture() and not IsDecoration(region)
                and region:IsShown() and region:GetAlpha() > 0
                and region ~= (button.GetHighlightTexture and button:GetHighlightTexture())
                and region ~= (button.GetPushedTexture and button:GetPushedTexture()) then
                if candidate then return nil end
                candidate = region
            end
        end
    end
    return candidate
end

local function HideCell(cell) cell:Hide() end

function Definition:ApplySkin(button, saved)
    local skin = saved.skin
    if not skin then
        local icon = FindIcon(button)
        if not icon or not icon.GetTexCoord or not icon.GetNumPoints then return end
        skin = { icon = icon, points = {}, coords = { icon:GetTexCoord() },
            width = icon:GetWidth(), height = icon:GetHeight(), decorations = {}, masks = {} }
        for i = 1, icon:GetNumPoints() do skin.points[i] = { icon:GetPoint(i) } end
        if icon.GetNumMaskTextures and icon.GetMaskTexture and icon.RemoveMaskTexture then
            for i = 1, icon:GetNumMaskTextures() do skin.masks[i] = icon:GetMaskTexture(i) end
        end
        saved.skin = skin
    end
    -- Capture late decorations once, without taking another baseline of our own changes.
    if button.GetRegions then
        for _, region in ipairs({ button:GetRegions() }) do
            if region ~= skin.icon and IsDecoration(region) and not skin.decorations[region] then
                skin.decorations[region] = { alpha = region:GetAlpha(), shown = region:IsShown() }
            end
        end
    end
    for region in pairs(skin.decorations) do region:SetAlpha(0); region:Hide() end
    local icon = skin.icon
    if not skin.masksRemoved then
        for _, mask in ipairs(skin.masks) do icon:RemoveMaskTexture(mask) end
        skin.masksRemoved = true
    end
    local inset = math.min(button:GetWidth(), button:GetHeight()) * 0.07
    icon:ClearAllPoints()
    icon:SetPoint("TOPLEFT", button, "TOPLEFT", inset, -inset)
    icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -inset, inset)
    -- Preserve atlas/custom/rotated coordinates. Crop only an ordinary full texture.
    local c = skin.coords
    local full = (#c == 4 and c[1] == 0 and c[2] == 1 and c[3] == 0 and c[4] == 1)
        or (#c == 8 and c[1] == 0 and c[2] == 0 and c[3] == 0 and c[4] == 1
            and c[5] == 1 and c[6] == 0 and c[7] == 1 and c[8] == 1)
    if full and not (icon.GetAtlas and icon:GetAtlas()) then icon:SetTexCoord(0.05, 0.95, 0.05, 0.95) end
    self.skinCells = self.skinCells or {}
    local cell = self.skinCells[button]
    if not cell then
        cell = self:CreateFrame("Frame", nil, self.panel, "BackdropTemplate", HideCell, "minimap icon cell")
        cell:EnableMouse(false)
        cell:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
        cell:SetBackdropColor(0.025, 0.025, 0.025, 0.95)
        cell:SetBackdropBorderColor(0, 0, 0, 1)
        self.skinCells[button] = cell
    else
        self:OwnFrame(cell, HideCell, "minimap icon cell")
    end
    cell:SetFrameStrata(self.panel:GetFrameStrata())
    cell:SetFrameLevel(self.panel:GetFrameLevel() + 1)
    cell:ClearAllPoints()
    cell:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    cell:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
    cell:Show()
end

function Definition:RestoreSkin(button, saved, restore)
    local cell = self.skinCells and self.skinCells[button]
    if cell then cell:Hide() end
    local skin = saved.skin
    if not skin or not restore then return end
    local icon = skin.icon
    icon:ClearAllPoints()
    icon:SetSize(skin.width, skin.height)
    for _, point in ipairs(skin.points) do icon:SetPoint(unpack(point)) end
    icon:SetTexCoord(unpack(skin.coords))
    for _, mask in ipairs(skin.masks) do icon:AddMaskTexture(mask) end
    for region, state in pairs(skin.decorations) do
        region:SetAlpha(state.alpha)
        region:SetShown(state.shown)
    end
end

function Definition:Restore(button, saved)
    if saved.clickHook then self:RemoveHook(saved.clickHook); saved.clickHook = nil end
    if not Adapter:IsSafe(button, true) or not Adapter:IsSafe(saved.parent, true) then return false end
    -- Another collector may already own it. Do not overwrite that collector's work.
    local ours = button:GetParent() == self.panel
    self:RestoreSkin(button, saved, ours)
    if ours then
        button:SetParent(saved.parent)
        button:SetSize(saved.width, saved.height)
        if saved.scale and button.SetScale then button:SetScale(saved.scale) end
        button:ClearAllPoints()
        for _, point in ipairs(saved.points) do button:SetPoint(unpack(point)) end
        ApplyVisuals(button, saved, self.panel, true)
        if button:GetScript("OnDragStart") == nil then button:SetScript("OnDragStart", saved.dragStart) end
        if button:GetScript("OnDragStop") == nil then button:SetScript("OnDragStop", saved.dragStop) end
    end
    self.owned[button] = nil
    return true
end

function Definition:RestoreAll()
    self.mutating = true
    for button, saved in pairs(self.owned) do self:Restore(button, saved) end
    self.mutating = false
    if self.panel then HidePanel(self.panel) end
end

function Definition:GetNames()
    local entries = Adapter:Candidates(self.panel, self:GetOption("collectExpansion"))
    local names = {}
    for name in pairs(entries) do names[#names + 1] = name end
    table.sort(names)
    return names, entries
end

function Definition:Refresh()
    if not self.active then return end
    -- Freeze collection/layout in combat, but keep the prepared popup usable.
    if Adapter:InCombat() then self.pending = true; return end
    if self.recovery and self.recovery:IsEnabled() then
        self:RestoreAll()
        if next(self.owned) then self.pending = true; return end
        ns.Runtime:DisableModule(self.recovery)
    end
    Adapter:Observe(self, Queue)
    self.pending = false
    self.conflict = self:GetConflict()
    if self.confirmedBlocker ~= self.conflict then self.confirmedBlocker = nil end
    self.blocker = self.conflict and (self:GetOption("autoAvoid") or self.confirmedBlocker ~= self.conflict) and self.conflict or nil
    if self.blocker then self:RestoreAll(); return end
    local lib = Adapter:Library()
    if not _G.Minimap then self.blocker = "小地图尚未就绪。"; return end
    local panel = self:EnsurePanel()
    local names, entries = self:GetNames()
    local size, spacing, padding = self:GetOption("buttonSize"), self:GetOption("spacing"), self:GetOption("padding")
    local wanted, count, cell = {}, 0, size + spacing
    local configuredColumns = self:GetOption("columns")
    local columns = configuredColumns == 0 and 4 or configuredColumns
    self.mutating = true
    for i = 1, #names do
        local name = names[i]
        local button = entries[name]
        if name ~= addonName and not self.db.profile.excluded[name]
            and Adapter:CanCollect(button, panel, self:GetOption("collectExpansion")) and button:IsShown() then
            wanted[button] = true
            count = count + 1
            if not self.owned[button] then
                local points = {}
                for n = 1, button:GetNumPoints() do points[n] = { button:GetPoint(n) } end
                self.owned[button] = { name = name, parent = button:GetParent(), points = points,
                    width = button:GetWidth(), height = button:GetHeight(),
                    scale = button.GetScale and button:GetScale(),
                    strata = button:GetFrameStrata(), level = button:GetFrameLevel(), dragStart = button:GetScript("OnDragStart"),
                    dragStop = button:GetScript("OnDragStop") }
                -- Parent changes by a late collector trigger a bounded reconciliation.
                self.providerHooks = self.providerHooks or {}
                local key = "parent:" .. tostring(button)
                if not self.providerHooks[key] then
                    self.providerHooks[key] = self:HookSecureFunction(button, "SetParent", Queue)
                end
            end
            CaptureVisuals(button, self.owned[button])
            button:SetParent(panel)
            if button:GetParent() == panel then
                local scale = button.GetEffectiveScale and panel.GetEffectiveScale
                    and button:GetEffectiveScale() / panel:GetEffectiveScale() or 1
                local saved = self.owned[button]
                if saved.scale and button.SetScale then
                    -- Scale the original art as well as its hit rectangle; many icons have fixed-size textures.
                    local extent = math.max(button:GetWidth(), button:GetHeight())
                    button:SetScale(button:GetScale() * size / math.max(extent * scale, 0.01))
                else
                    button:SetSize(size / math.max(scale, 0.01), size / math.max(scale, 0.01))
                end
                scale = button.GetEffectiveScale and panel.GetEffectiveScale
                    and button:GetEffectiveScale() / panel:GetEffectiveScale() or 1
                button:ClearAllPoints()
                button:SetPoint("CENTER", panel, "TOPLEFT", (padding + size / 2 + ((count - 1) % columns) * cell) / scale,
                    (-padding - size / 2 - math.floor((count - 1) / columns) * cell) / scale)
                local point, relative = button:GetPoint(1)
                if point == "CENTER" and relative == panel then
                    button:SetScript("OnDragStart", nil)
                    button:SetScript("OnDragStop", nil)
                    ApplyVisuals(button, self.owned[button], panel, false)
                    self:ApplySkin(button, self.owned[button])
                    if button:GetFrameStrata() ~= panel:GetFrameStrata()
                        or button:GetFrameLevel() <= panel:GetFrameLevel() then
                        self:Restore(button, self.owned[button])
                        wanted[button], count = nil, count - 1
                    end
                else
                    self:Restore(button, self.owned[button])
                    wanted[button], count = nil, count - 1
                end
            else
                -- A replaced/no-op method or a synchronous third-party hook
                -- rejected parenting. Do not continue mutating this button.
                self.owned[button], wanted[button], count = nil, nil, count - 1
            end
        end
    end
    for button, saved in pairs(self.owned) do
        if not wanted[button] then self:Restore(button, saved) end
    end
    -- Resolve automatic rows from successfully collected icons, not excluded/foreign entries.
    if configuredColumns == 0 and count > 16 then
        columns = 8
        local index = 0
        for _, name in ipairs(names) do
            local button = entries[name]
            if wanted[button] then
                local scale = button.GetEffectiveScale and panel.GetEffectiveScale
                    and button:GetEffectiveScale() / panel:GetEffectiveScale() or 1
                button:ClearAllPoints()
                button:SetPoint("CENTER", panel, "TOPLEFT", (padding + size / 2 + (index % columns) * cell) / scale,
                    (-padding - size / 2 - math.floor(index / columns) * cell) / scale)
                index = index + 1
            end
        end
    end
    self.mutating = false
    self.count = count
    local width = math.max(1, math.min(count, columns)) * cell - spacing + padding * 2
    local height = math.max(1, math.ceil(count / columns)) * cell - spacing + padding * 2
    panel:SetSize(math.max(width, self:GetOption("minWidth")), math.max(height, self:GetOption("minHeight")))
    local color = self:GetOption("backgroundColor")
    self.background:SetColorTexture(color[1], color[2], color[3], self:GetOption("opacity"))
    panel:ClearAllPoints()
    local launcher = lib and lib.GetMinimapButton and lib:GetMinimapButton(addonName) or _G.Minimap
    self.launcher = launcher
    local direction = self:GetOption("direction")
    if direction == "auto" then
        local x = launcher.GetCenter and launcher:GetCenter()
        direction = x and x < _G.UIParent:GetWidth() / 2 and "right" or "left"
    end
    local anchors = {left = {"RIGHT", "LEFT", -6, 0}, right = {"LEFT", "RIGHT", 6, 0},
        up = {"BOTTOM", "TOP", 0, 6}, down = {"TOP", "BOTTOM", 0, -6},
        leftUp = {"BOTTOMRIGHT", "BOTTOMLEFT", -6, 0}, rightUp = {"BOTTOMLEFT", "BOTTOMRIGHT", 6, 0},
        leftDown = {"TOPRIGHT", "TOPLEFT", -6, 0}, rightDown = {"TOPLEFT", "TOPRIGHT", 6, 0}}
    local anchor = anchors[direction]
    panel:SetPoint(anchor[1], launcher, anchor[2], anchor[3] + self:GetOption("offsetX"), anchor[4] + self:GetOption("offsetY"))
    if count == 0 then panel:Hide(); self.previewMode = false end
    if panel:IsShown() then self:StartDismiss() end
end

function Definition:GetStatusText()
    if self.recovery and self.recovery:IsEnabled() then return "等待脱战恢复原按钮；受保护目标暂不改动。" end
    if not self.active then return "已关闭。启用后左键 RS 图标展开或收起，右键打开设置。" end
    if self.panel and not Adapter:IsSafe(self.panel, true) then return "收纳框受保护，暂不能展开或收起。" end
    if self.blocker then return "RS 已自动避让：" .. self.blocker end
    if self.pending and (not self.panel or (self.count or 0) == 0) then return "等待脱战准备收纳图标。" end
    if self.pending then return "图标变更等待脱战同步；已收纳图标可正常展开或收起。" end
    if self.conflict then return "已强制开启，可能冲突：" .. self.conflict .. " 已收纳 " .. tostring(self.count or 0) .. " 个图标。" end
    return "已收纳 " .. tostring(self.count or 0) .. " 个图标。收纳插件图标；隐藏、受保护及其他收纳器占用的按钮保留原位。"
end

function Definition:Toggle()
    if not self.active then return false end
    if not Adapter:InCombat() then self:Refresh() end
    if self.blocker or (self.recovery and self.recovery:IsEnabled())
        or not self.panel or (self.count or 0) == 0 or not Adapter:IsSafe(self.panel, true) then
        if ns.Print then ns.Print(self:GetStatusText()) end
        return true
    end
    self.panel:SetShown(not self.panel:IsShown())
    return true
end

function Definition:SetExcluded(name, value)
    if type(name) ~= "string" or #name > 200 then return end
    self.db.profile.excluded[name] = value and true or nil
    self:Refresh()
end

function Definition:Enable()
    self.active = true
    self.providerHooks = {}
    self:RegisterEvent("ADDON_LOADED", Queue)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", Queue)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", Refresh)
    self:RegisterEvent("PLAYER_REGEN_DISABLED", function(module)
        module.pending = true
    end)
    local lib = Adapter:Library()
    if lib and lib.RegisterCallback then
        lib.RegisterCallback(self, "LibDBIcon_IconCreated", function() Queue(self) end)
        self.callbackLibrary = lib
    end
    self:Refresh()
end

function Definition:Disable()
    self:StopDismiss()
    self.confirmedBlocker, self.previewMode = nil, false
    self.active = false
    self.pending = false
    if self.callbackLibrary then
        self.callbackLibrary.UnregisterCallback(self, "LibDBIcon_IconCreated")
        self.callbackLibrary = nil
    end
    self:RestoreAll()
    self.providerHooks = nil
    -- Rare safety case: an acquired button became protected after acquisition.
    -- A separate, temporary Runtime owner survives this module's cleanup.
    if next(self.owned) then
        if not self.recovery then
            local owner = self
            self.recovery = ns.Runtime:RegisterModule("MinimapCollectorRecovery", {
                Enable = function(recovery)
                    recovery:RegisterEvent("PLAYER_REGEN_ENABLED", function()
                        -- Out of combat protected frames can safely be restored.
                        owner:RestoreAll()
                        if not next(owner.owned) then ns.Runtime:DisableModule(recovery) end
                    end)
                end,
            })
        end
        ns.Runtime:EnableModule(self.recovery)
    end
end

function Definition:ProfileChanged()
    self.confirmedBlocker, self.previewMode = nil, false
    if type(self.db.profile.excluded) ~= "table" then self.db.profile.excluded = {} end
    self:Refresh()
end
ns.MinimapCollector = ns.RegisterModule("MinimapCollector", Definition)
