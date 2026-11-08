-- Owns settings and lifecycle. Native window geometry lives in the Infinite adapter.
local _, ns = ...
if not ns.Build.HasModule("MapEnhancement") then return end

local Adapter = ns.MapEnhancementAdapter
local Definition = {
    databaseName = "MapEnhancement", defaultEnabled = true,
    defaults = { profile = { enabled = true, allowMove = true, allowScale = true, centerHorizontal = true,
        scale = 1.3, showZoneLevels = true, showUnexplored = true, unexploredColor = { r = 0, g = 0, b = 0 }, unexploredOpacity = 0.35 } },
}

-- Runtime owns one subscription per module/target/signal. Map features share
-- that subscription here, with independent removable observers and no timers.
local function CompactObservers(owner, bucket)
    if bucket.depth > 0 then return end
    local write = 1
    for read = 1, #bucket.entries do
        local entry = bucket.entries[read]
        if entry.active then bucket.entries[write] = entry; write = write + 1 end
    end
    for i = #bucket.entries, write, -1 do bucket.entries[i] = nil end
    bucket.dirty = false
    if write == 1 then
        owner:RemoveHook(bucket.hook)
        owner.mapObservers[bucket] = nil
    end
end

local function ObserveMap(owner, kind, target, signal, callback, label)
    owner.mapObservers = owner.mapObservers or {}
    local bucket
    for candidate in pairs(owner.mapObservers) do
        if candidate.kind == kind and candidate.target == target and candidate.signal == signal then
            bucket = candidate; break
        end
    end
    if not bucket then
        bucket = { kind = kind, target = target, signal = signal, entries = {}, depth = 0 }
        owner.mapObservers[bucket] = true
        local function Dispatch(_, ...)
            bucket.depth = bucket.depth + 1
            local firstError
            for i = 1, #bucket.entries do
                local entry = bucket.entries[i]
                if entry.active then
                    local ok, err = pcall(entry.callback, owner, ...)
                    if not ok and not firstError then firstError = err end
                end
            end
            bucket.depth = bucket.depth - 1
            if bucket.dirty then CompactObservers(owner, bucket) end
            if firstError then error(firstError, 0) end
        end
        if kind == "script" then bucket.hook = owner:HookFrameScript(target, signal, Dispatch, label)
        elseif kind == "global" then bucket.hook = owner:HookSecureFunction(target, Dispatch, label)
        else bucket.hook = owner:HookSecureFunction(target, signal, Dispatch, label) end
    end
    local token = { active = true, callback = callback, bucket = bucket }
    bucket.entries[#bucket.entries + 1] = token
    return token
end

function Definition:ObserveMapScript(target, signal, callback, label)
    return ObserveMap(self, "script", target, signal, callback, label)
end

function Definition:ObserveMapFunction(target, signal, callback, label)
    if type(target) == "string" then
        return ObserveMap(self, "global", target, nil, signal, callback)
    end
    return ObserveMap(self, "method", target, signal, callback, label)
end

function Definition:RemoveMapObserver(token)
    if not token or not token.active then return end
    token.active, token.callback = false, nil
    token.bucket.dirty = true
    CompactObservers(self, token.bucket)
end

local function Finite(value)
    return type(value) == "number" and value == value and value > -math.huge and value < math.huge
end

local function Clamp(value, low, high)
    return math.max(low, math.min(math.max(low, high), value))
end

function Definition:GetProfile() return self.db.profile end

function Definition:Normalize()
    local p = self:GetProfile()
    p.enabled = p.enabled ~= false
    p.allowMove = p.allowMove ~= false
    p.allowScale = p.allowScale ~= false
    p.centerHorizontal = p.centerHorizontal ~= false
    p.scale = Finite(p.scale) and math.max(0.5, math.min(2, p.scale)) or 1.3
    -- GetScale returns float32 noise; snap only the known default, not custom scales.
    if math.abs(p.scale - 1.3) < 0.000001 then p.scale = 1.3 end
    -- Default on; only an explicit false keeps it off.
    p.showUnexplored = p.showUnexplored ~= false
    p.showZoneLevels = p.showZoneLevels ~= false
    local color = p.unexploredColor
    if type(color) ~= "table" then color = {} p.unexploredColor = color end
    color.r = Finite(color.r) and Clamp(color.r, 0, 1) or 0
    color.g = Finite(color.g) and Clamp(color.g, 0, 1) or 0
    color.b = Finite(color.b) and Clamp(color.b, 0, 1) or 0
    p.unexploredOpacity = Finite(p.unexploredOpacity) and Clamp(p.unexploredOpacity, 0, 1) or 0.35
    if not Finite(p.x) or not Finite(p.y) then p.x, p.y = nil, nil end
end

function Definition:Initialize()
    -- Versioned built-in preset also handles beta clients that cannot save WTF.
    local p = self:GetProfile()
    if p.presetVersion ~= 2 then
        p.enabled, p.allowMove, p.allowScale = true, true, true
        p.centerHorizontal, p.scale, p.x, p.y, p.presetVersion = true, 1.3, nil, nil, 2
    end
    -- One-time follow-up: the unreleased first build materialized the reveal
    -- switch as false, which is indistinguishable from a deliberate opt-out.
    -- Turn it on exactly once instead of forcing it on every login.
    if p.revealDefaultVersion ~= 1 then
        p.showUnexplored, p.revealDefaultVersion = true, 1
    end
    self:Normalize()
    if not p.enabled then Adapter:ReleaseWindow(p) end
    self.controller = ns.MapEnhancementView:New(self)
    ns.MapEnhancementReveal:Bind(self)
    ns.MapEnhancementZoneLevels:Bind(self)
    ns.Assembly:SyncModuleConfigured("MapEnhancement", self:GetProfile().enabled)
    ns.MapEnhancementSettings:Register(self)
end

function Definition:RefreshSettings()
    if self.settingsPage then self.settingsPage:Refresh("map-enhancement") end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if system and system.RefreshNavigationSwitch then system:RefreshNavigationSwitch("mapenhancement") end
end

function Definition:GetStatusText()
    if self.controller and self.controller.pendingRestore then return "等待脱战后恢复原生地图。" end
    if not self:GetProfile().enabled then return "地图增强已关闭。" end
    local revealConflict = Adapter:GetRevealConflict()
    if revealConflict then return "检测到 " .. revealConflict .. "，RS 暂停接管。请停用其地图功能或插件并重载界面。" end
    if Adapter:IsInCombat() then return "战斗中暂停调整，脱战后应用设置。" end
    local windowConflict = Adapter:GetConflict()
    local text = windowConflict
        and ("检测到 " .. windowConflict .. "，地图窗口移动已交给它。")
        or "拖动标题栏移动，拖动右下角调整大小，松手自动保存；最大化保持原生布局。"
    if self:GetProfile().showUnexplored then
        local reveal = ns.MapEnhancementReveal:GetStatusText()
        if reveal then text = text .. "\n" .. reveal end
    end
    return text
end

function Definition:OnWorldEvent(event, name)
    if event == "ADDON_LOADED" and name ~= "Blizzard_WorldMap"
        and name ~= "Mapster" and name ~= "BlizzMove" and name ~= "Leatrix_Maps"
        and name ~= "NDui" and name ~= "ElvUI" and name ~= "EllesmereUIQoL" then return end
    if event == "PLAYER_REGEN_DISABLED" then self.controller:StopGesture(true) end
    self.controller:Refresh()
    ns.MapEnhancementReveal:Sync()
    ns.MapEnhancementZoneLevels:Sync()
    self:RefreshSettings()
end

function Definition:Enable()
    self.runtimeActive = true
    self:GetProfile().enabled = true
    for _, event in ipairs({ "ADDON_LOADED", "PLAYER_ENTERING_WORLD", "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED", "DISPLAY_SIZE_CHANGED", "UI_SCALE_CHANGED" }) do
        self:RegisterEvent(event, self.OnWorldEvent)
    end
    self.controller:Refresh()
    ns.MapEnhancementReveal:Sync()
    ns.MapEnhancementZoneLevels:Sync()
end

function Definition:Disable()
    self.runtimeActive = false
    ns.MapEnhancementZoneLevels:Detach()
    self:TogglePreview(false)
    self.controller:Detach()
    self:Normalize()
    ns.MapEnhancementReveal:Sync()
end

function Definition:ProfileChanged()
    -- Never write an unfinished gesture from the old profile into the new one.
    self.controller:StopGesture(false)
    self.controller:Detach()
    self:Normalize()
    self.controller:Refresh()
    ns.MapEnhancementReveal:Sync()
    ns.MapEnhancementZoneLevels:Sync()
    self:RefreshSettings()
end

function Definition:SetEnabled(value)
    if Adapter:IsInCombat() then return false, "战斗中不能切换地图增强。" end
    self:GetProfile().enabled = value == true
    local ok, reason = ns.Assembly:SetModuleEnabled("MapEnhancement", value == true)
    self:RefreshSettings()
    return ok, reason
end

function Definition:SetOption(key, value)
    if Adapter:IsInCombat() then return false, "战斗中不能调整地图。" end
    if key == "scale" then
        if not Finite(value) then return false end
        value = math.max(0.5, math.min(2, value))
    elseif key == "allowMove" or key == "allowScale" or key == "centerHorizontal"
        or key == "showUnexplored" or key == "showZoneLevels" then value = value == true
    elseif key == "unexploredOpacity" then
        if not Finite(value) then return false end
        value = Clamp(value, 0, 1)
    elseif key == "unexploredColor" then
        local color = type(value) == "table" and value or nil
        local r, g, b = color and color.r, color and color.g, color and color.b
        if not (Finite(r) and Finite(g) and Finite(b)) then return false end
        value = { r = Clamp(r, 0, 1), g = Clamp(g, 0, 1), b = Clamp(b, 0, 1) }
    elseif key == "x" or key == "y" then
        return self:SetPosition(key, value)
    else return false end
    self.controller:StopGesture(true)
    if key == "scale" then self.controller:SavePosition() end
    self:GetProfile()[key] = value
    if key == "showZoneLevels" then
        ns.MapEnhancementZoneLevels:Sync()
        self:RefreshSettings()
        return true
    end
    if key == "centerHorizontal" and not value then self.controller:SavePosition() end
    self.controller:Refresh()
    ns.MapEnhancementReveal:Sync()
    self:RefreshSettings()
    return true
end

-- Bounded window-position write for the coordinate sliders. The untouched axis
-- is seeded from the effective layout so a single-axis change keeps both axes.
function Definition:SetPosition(axis, value)
    if axis ~= "x" and axis ~= "y" then return false end
    if Adapter:IsInCombat() then return false, "战斗中不能调整地图位置。" end
    if not Finite(value) then return false end
    self.controller:StopGesture(true)
    local ok, applied = self.controller:SetWindowedAxis(axis, value)
    if not ok then return false end
    self:RefreshSettings()
    return true, applied
end

function Definition:GetPosition(axis)
    local position = self.controller:WindowedPosition()
    return axis == "y" and position.y or position.x
end

function Definition:GetPositionLimits()
    local box = self.controller:WindowedPosition().box
    if not box then return nil end
    local scale = Clamp(self:GetProfile().scale or 1.3, 0.5, box.maximum)
    return math.max(0, box.width - box.w * scale), math.max(0, box.height - box.h * scale)
end

function Definition:ResetPosition()
    if Adapter:IsInCombat() then return false end
    self.controller:StopGesture(false)
    local p = self:GetProfile()
    p.x, p.y = nil, nil
    self.controller:ResetPosition()
    self:RefreshSettings()
    return true
end

function Definition:RestoreDefaults()
    if Adapter:IsInCombat() then return false end
    self.controller:StopGesture(false)
    local p = self:GetProfile()
    p.allowMove, p.allowScale, p.scale, p.x, p.y = true, true, 1.3, nil, nil
    p.centerHorizontal = true
    p.showUnexplored = true
    p.showZoneLevels = true
    p.unexploredColor = { r = 0, g = 0, b = 0 }
    p.unexploredOpacity = 0.35
    self:SetEnabled(true)
    ns.MapEnhancementReveal:Sync()
    ns.MapEnhancementZoneLevels:Sync()
    self:RefreshSettings()
    return true
end

function Definition:CancelPreviewOwnership()
    self.previewOpened, self.previewEnabled, self.previewClosePending = false, false, false
    self.controller:ClearPreviewWatch()
    self:RefreshSettings()
end

function Definition:TogglePreview(enabled)
    if enabled then
        if self.previewEnabled then return true end
        if Adapter:IsInCombat() then return false end
        local frame = Adapter:Resolve()
        local wasShown = frame and frame:IsShown()
        if not wasShown then
            if type(_G.ToggleWorldMap) ~= "function" then return false end
            _G.ToggleWorldMap()
        end
        frame = Adapter:Resolve()
        if not frame or not frame:IsShown() then return false end
        self.previewOpened = self.previewOpened or not wasShown
        self.previewEnabled = true
        self.previewClosePending = false
        self.controller:ClearPreviewWatch()
        self.controller:WatchPreview(frame)
    else
        local frame = Adapter:Resolve()
        local close = self.previewOpened and frame and frame:IsShown()
        if close and Adapter:IsInCombat() then
            self.previewEnabled, self.previewClosePending = false, true
            self.controller:QueuePreviewClose()
            self:RefreshSettings()
            return true
        end
        self:CancelPreviewOwnership()
        if close then
            if _G.HideUIPanel then _G.HideUIPanel(frame) else frame:Hide() end
        end
    end
    self:RefreshSettings()
    return true
end

ns.MapEnhancement = ns.RegisterModule("MapEnhancement", Definition)
