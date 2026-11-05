-- 文件职责：中央文字共享排布、配置和移动；无常驻轮询，所有资源交给Runtime。
-- 边界：按客户端能力装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.HasModule("CenterTextGroup") then return end
local Definition = {defaultEnabled = true, defaults = {profile = {
    position = {x = 0, y = 190}, fontSize = 20, rowGap = 8,
}}}
local function Hide(frame) frame:Hide(); frame:StopMovingOrSizing() end
local function Number(value, fallback, low, high)
    value = tonumber(value)
    if not value or value ~= value then return fallback end
    return math.max(low, math.min(high, value))
end
function Definition:Normalize()
    local p = self.db.profile
    local savedPosition = rawget(p, "position")
    if type(p.position) ~= "table" then p.position = {} end
    -- Existing shared position wins even when its migration marker was omitted by a share.
    if not p.positionMigrated then
        local own = savedPosition
        if type(own) ~= "table" or (rawget(own, "x") == nil and rawget(own, "y") == nil) then
            local root = ns.DB.root.namespaces.RSFastFocus
            local old = root and root.profiles and root.profiles[ns.DB:GetCurrentProfile()]
            local pos = old and rawget(old, "reminderPosition")
            if type(pos) == "table" then
                p.position.x = Number(pos.x, 0, -10000, 10000)
                p.position.y = Number(pos.y, 190, -10000, 10000)
            end
        end
        p.positionMigrated = true
    end
    if type(p.position) ~= "table" then p.position = {} end
    p.position.x = Number(p.position.x, 0, -10000, 10000)
    p.position.y = Number(p.position.y, 190, -10000, 10000)
    p.fontSize = Number(p.fontSize, 20, 12, 60)
    p.rowGap = Number(p.rowGap, 8, 0, 40)
end
function Definition:Initialize()
    self.entries, self.sources = {}, {}
    self:Normalize()
    if ns.RegisterMoveProvider then
        ns:RegisterMoveProvider({name = "CenterTextGroup", reset = "ResetPosition",
            isMovable = function(module) return module.active == true end})
    end
end
function Definition:ProfileChanged() self:Normalize() end
function Definition:RegisterSource(key, source) self.sources[key] = source end
function Definition:Register(key, frame, order)
    local entry = self.entries[key]
    if not entry then self.entries[key] = {frame = frame, order = order, key = key} end
end
function Definition:Unregister(key) self.entries[key] = nil; self:QueueLayout() end
function Definition:Enable()
    self.active = true
    for _, source in pairs(self.sources) do
        if source.OnCenterStateChanged then source:OnCenterStateChanged(true) end
    end
    self:RefreshStyle()
    -- Subscribe only while there is visible text or an active movement preview.
end
function Definition:GetPosition() return self.db.profile.position.x, self.db.profile.position.y end
function Definition:SetPosition(x, y)
    if InCombatLockdown() then return false end
    self.db.profile.position.x = math.floor(Number(x, 0, -10000, 10000) + .5)
    self.db.profile.position.y = math.floor(Number(y, 190, -10000, 10000) + .5)
    self:ApplyPosition(); return true
end
function Definition:ApplyPosition()
    if not self.frame then return end
    self.frame:ClearAllPoints()
    self.frame:SetPoint("CENTER", UIParent, "CENTER", self:GetPosition())
end
function Definition:SavePosition()
    if InCombatLockdown() or not self.frame then return false end
    local x, y = self.frame:GetCenter()
    local px, py = UIParent:GetCenter()
    local scale, rootScale = self.frame:GetEffectiveScale(), UIParent:GetEffectiveScale()
    if not x or not y or not px or not py or not scale or not rootScale or rootScale <= 0 then return false end
    local targetScale = rootScale * self.frame:GetScale()
    if targetScale <= 0 then return false end
    return self:SetPosition((x * scale - px * rootScale) / targetScale, (y * scale - py * rootScale) / targetScale)
end
function Definition:ResetPosition()
    if InCombatLockdown() then return false end
    self.db.profile.position = {x = 0, y = 190}
    self.db.profile.positionMigrated = true
    self:ApplyPosition(); return true
end
function Definition:ApplyTextStyle(text, size)
    local font = ns.Font
    if font then font:ApplyFontString(text, font:GetPath("interface"), size or self.db.profile.fontSize, "OUTLINE") end
    text:SetTextColor(1, 1, 1, 1); text:SetShadowOffset(0, 0); text:SetShadowColor(0, 0, 0, 0)
end
function Definition:EnsureFrame()
    if not self.frame then
        self.frame = self:CreateFrame("Frame", "RSCenterTextGroup", UIParent, nil, Hide, "Central text")
        self.frame:SetFrameStrata("DIALOG"); self.frame:SetMovable(true)
        self.frame:SetClampedToScreen(true); self.frame:EnableMouse(false)
        self.frame:Hide()
    else self:OwnFrame(self.frame, Hide, "Central text") end
    self:ApplyPosition(); return self.frame
end
function Definition:QueueLayout()
    if not self.active or self.layoutTimer then return end
    if next(self.entries) == nil and not self.isUnlocked then self:Layout(); return end
    self.layoutTimer = self:Schedule(0, function(module)
        module.layoutTimer = nil; module:Layout()
    end, "Central text layout")
end
function Definition:Layout()
    if self.dragging then return end
    local visible, height, width = {}, 0, 300
    for _, entry in pairs(self.entries) do
        if entry.frame:IsShown() then visible[#visible + 1] = entry end
    end
    if #visible == 0 and not self.isUnlocked then
        if self.frame then self:ReleaseFrame(self.frame) end
        if ns.Font and self.fontSubscribed then ns.Font:Unsubscribe(self) end
        self.fontSubscribed = false
        return
    end
    if ns.Font and not self.fontSubscribed then
        ns.Font:Subscribe(self, function(owner) owner:RefreshStyle() end); self.fontSubscribed = true
    end
    table.sort(visible, function(a,b) return a.order < b.order or (a.order == b.order and a.key < b.key) end)
    for _, entry in ipairs(visible) do
        height = height + entry.frame:GetHeight(); width = math.max(width, entry.frame:GetWidth())
    end
    height = height + math.max(0, #visible - 1) * self.db.profile.rowGap
    local frame = self:EnsureFrame()
    frame:SetSize(width + 20, math.max(36, height + 20))
    local offset = 10
    for _, entry in ipairs(visible) do
        entry.frame:ClearAllPoints(); entry.frame:SetPoint("TOP", frame, "TOP", 0, -offset)
        offset = offset + entry.frame:GetHeight() + self.db.profile.rowGap
    end
    frame:Show()
end
function Definition:RefreshStyle()
    for _, source in pairs(self.sources) do source:RefreshCenterStyle() end
    self:QueueLayout()
end
function Definition:SetStyle(key, value)
    if InCombatLockdown() or (key ~= "fontSize" and key ~= "rowGap") then return false end
    self.db.profile[key] = value; self:Normalize(); self:RefreshStyle(); return true
end
function Definition:EnsureOverlay()
    if not ns.MoveOverlay then return end
    local function OpenSettings() return ns.UI:OpenMain("classreminders") end
    if not self.moveConfig then
        self.moveConfig = {
            label = "中心文字提醒", exactBounds = true,
            createFrame = function(parent)
                return self:CreateFrame("Button", nil, parent, "BackdropTemplate", function(frame)
                    Hide(frame); frame:SetScript("OnDragStart", nil); frame:SetScript("OnDragStop", nil); frame:SetScript("OnClick", nil)
                end, "Central text movement")
            end,
            canInteract = function() return self.active and self.isUnlocked and not InCombatLockdown() end,
            onDragStart = function() self.dragging = true; self.frame:StartMoving() end,
            onDragStop = function() self.dragging = false; self:SavePosition(); self:QueueLayout() end,
            onSettings = OpenSettings,
            nudgeConfig = {
                label = "中心文字提醒",
                getPosition = function() return self:GetPosition() end,
                setPosition = function(x,y) return self:SetPosition(x,y) end,
                savePosition = function() return self:SavePosition() end,
                applyPosition = function() self:ApplyPosition() end,
                onSettings = OpenSettings,
                onLock = function() return self:SetUnlocked(false) end,
            },
        }
    end
    self.overlay = ns.MoveOverlay:Ensure(self:EnsureFrame(), self.moveConfig)
    self:OwnFrame(self.overlay, function(frame)
        Hide(frame); frame:SetScript("OnDragStart", nil); frame:SetScript("OnDragStop", nil); frame:SetScript("OnClick", nil)
    end, "Central text movement")
    return self.overlay
end
function Definition:SetUnlocked(value)
    value = value == true
    -- Ownership belongs to whatever turns the mode on or off last. A global
    -- entry point (for example the move manager) calls this directly, so it
    -- revokes any page claim and that page may no longer close the movement.
    local claim = self.moveClaim
    self.moveClaim = nil
    if claim and claim.claimant.onCenterMoveReleased then
        claim.claimant:onCenterMoveReleased()
    end
    if value and (not self.active or InCombatLockdown()) then return false end
    if not value and self.frame then
        self.frame:StopMovingOrSizing()
        if self.dragging and not InCombatLockdown() then self:SavePosition() end
        self.dragging = false
    end
    self.isUnlocked = value
    if value then
        local overlay = self:EnsureOverlay(); if overlay then overlay:Show() end
        self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnCombat)
    else
        if self.overlay then self:ReleaseFrame(self.overlay) end
        if ns.MoveNudge and ns.MoveNudge.target == self.frame then ns.MoveNudge:Hide() end
        self:UnregisterEvent("PLAYER_REGEN_DISABLED")
    end
    for _, source in pairs(self.sources) do source:SetCenterPreview(value) end
    self:QueueLayout(); return true
end
-- Shared movement is global, but a page may only clean up the movement it started.
-- The claimant records which settings entry unlocked the group so that leaving that
-- page locks it again without closing movement another entry point still owns.
function Definition:IsControlledBy(claimant)
    return self.moveClaim ~= nil and self.moveClaim.claimant == claimant
end

function Definition:TryAcquireControl(claimant)
    if not self.active or InCombatLockdown() then return false end
    -- SetUnlocked revokes the previous claim, so the new claim is recorded
    -- after the mode is on; an entry point that only calls SetUnlocked keeps
    -- ownership itself and leaves no page claim behind.
    if not self.isUnlocked and not self:SetUnlocked(true) then return false end
    self.moveClaim = { claimant = claimant }
    return self.isUnlocked == true
end

function Definition:ReleaseControl(claimant)
    local claim = self.moveClaim
    if not claim or claim.claimant ~= claimant then
        -- Another entry point owns the global move: leave the claim and the
        -- movement completely unchanged so that owner can still release it.
        return false
    end
    self.moveClaim = nil
    if self.isUnlocked then self:SetUnlocked(false) end
    if claimant.onCenterMoveReleased then claimant:onCenterMoveReleased() end
    return true
end

function Definition:OnCombat() self:SetUnlocked(false) end
function Definition:Disable()
    self.active = false
    for _, source in pairs(self.sources) do
        if source.OnCenterStateChanged then source:OnCenterStateChanged(false) end
    end
    self:SetUnlocked(false)
    self:UnregisterAllEvents()
    if self.layoutTimer then self:CancelSchedule(self.layoutTimer); self.layoutTimer = nil end
    for _, entry in pairs(self.entries) do entry.frame:Hide() end
    if self.frame then self:ReleaseFrame(self.frame) end
    if ns.Font and self.fontSubscribed then ns.Font:Unsubscribe(self) end
    self.fontSubscribed = false
end
ns.CenterTextGroup = ns.RegisterModule("CenterTextGroup", Definition)


local function BuildSharedCenterDisplay(page, adapter, options)
    options = options or {}
    local group = ns.CenterTextGroup
    if not group then return false end
    -- FastFocus passes a tab; claims and cleanup always belong to the page itself.
    local owner = page.page or page
    local function CanEditShared()
        return group.active == true and not adapter:IsInCombat()
    end
    -- The page is the movement claimant: it may only lock the shared movement it
    -- started, never one owned by another settings entry point.
    local build = {}
    -- Page leave (page switch, window close, tab switch) releases only the
    -- movement this entry point started.
    if type(owner.SetDeactivateHandler) == "function" then
        owner:SetDeactivateHandler(function() build.ReleaseMove() end)
    else
        owner.deactivateHandler = function() build.ReleaseMove() end
    end
    -- Clear the local claim flag unconditionally: a caller may pass a tab proxy
    -- whose lifecycle lives on the owner, so owner state is the only reliable gate.
    owner.onCenterMoveReleased = function()
        if owner.discarded or owner.lifecycle == nil then return end
        build.moveClaimed = false
    end
    local section = page:Section("共享显示设置")
    section:QuadRow():Popover("centerStyle", {
        title = "文字样式",
        button = { text = "样式调整", getEnabled = CanEditShared,
            tooltip = "共用于职业提醒、通用文字提醒和快速焦点的文字提醒。战斗中不可编辑。" },
        rows = {
            { kind = "slider", key = "fontSize", text = "字号", min = 12, max = 60, step = 1,
                getValue = function() return group.db.profile.fontSize end,
                getEnabled = CanEditShared,
                onChange = function(control, value)
                    local ok = group:SetStyle("fontSize", value)
                    if not ok then control:SetValue(group.db.profile.fontSize, true) end
                    return ok
                end },
            { kind = "slider", key = "rowGap", text = "行间距", min = 0, max = 40, step = 1,
                getValue = function() return group.db.profile.rowGap end,
                getEnabled = CanEditShared,
                onChange = function(control, value)
                    local ok = group:SetStyle("rowGap", value)
                    if not ok then control:SetValue(group.db.profile.rowGap, true) end
                    return ok
                end },
        },
    })
    page:Section(""):Row():Label("centerTextServiceStatus", {
        text = "中心文字组服务已停用，以下样式与位置设置暂不生效。",
        getText = function()
            if group.active == true then return "" end
            return "中心文字组服务已停用，以下样式与位置设置暂不生效。"
        end,
        getVisible = function() return group.active ~= true end,
        labelFill = true,
        wordWrap = true,
        textToken = "color.text.muted",
    })
    -- 本页发起移动时由本页持有 claim；离开页面时只收口自己发起的移动。
    function build.ClaimMove()
        if not group:TryAcquireControl(owner) then return false end
        build.moveClaimed = true
        return true
    end
    -- 页面离开（切页、关窗、tab 切换）时收口本页发起的移动与预览。
    function build.ReleaseMove()
        if build == nil then return false end
        if build.moveClaimed or group:IsControlledBy(owner) then group:ReleaseControl(owner) end
        build.moveClaimed = false
    end
    function build.ToggleMove()
        if build.moveClaimed or group:IsControlledBy(owner) then return build.ReleaseMove() end
        return build.ClaimMove()
    end
    -- 统一底栏持有共享位置重置；页面只登记语义动作，不再重复页内按钮。
    build.RegisterResetPosition = function(footerOptions)
        local footer = page:FooterActions(footerOptions or { columns = 1 })
        if not footer then return false end
        footer:Button("resetSharedCenter", {
            action = "resetPosition",
            text = "重置位置",
            getEnabled = CanEditShared,
            tooltip = "重置所有使用中心文字组的提醒位置，影响职业提醒、通用文字提醒和快速焦点的文字提醒。",
            onAction = function() return group:ResetPosition() end,
        })
        return true
    end
    return build
end

ns.CenterTextSettings = { Build = BuildSharedCenterDisplay }
