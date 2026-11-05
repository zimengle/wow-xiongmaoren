-- 文件职责：消耗品启停、刷新和资源所有权；禁用释放运行索引与字体订阅。
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ConsumableBar")) then return end

local Definition = ns.ConsumableBarDefinition
if type(Definition) ~= "table" or not ns.ConsumableBarButtons
    or not ns.ConsumableBarCooldown or not ns.ConsumableBarBuff then
    error("ConsumableBar Definition, Buttons, Cooldown, and Buff must load before Core.lua", 2)
end

local Adapter = Definition.ADAPTER
local Data = Definition.DATA

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) == "function" then return callback(target, ...) end
    return nil
end

local function HideFrame(frame)
    Call(frame, "Hide")
end

-- Settings can inspect items with the runtime module disabled. This one UI
-- frame therefore outlives runtime resource bags, like the settings controls.
-- It avoids hooks on public GameTooltip; arbitrary hooks on all tooltips are
-- outside this boundary. Keep native rendering for full item information.
local itemTooltip
local TOOLTIP_BACKGROUND = { bgFile = "Interface\\Buttons\\WHITE8X8" }
local TOOLTIP_BORDER = { 0, 0, 0, 1 }

local function StyleItemTooltip(tooltip)
    -- GameTooltipTemplate does not guarantee the standalone frame's strata.
    -- Explicitly stay above unit frames, including third-party player frames.
    Call(tooltip, "SetFrameStrata", "TOOLTIP")
    -- Read presentation only; never run public tooltip hooks or change its data.
    Call(tooltip, "SetScale", Call(_G.GameTooltip, "GetScale") or 1)
    Call(tooltip.NineSlice, "Hide")
    Call(tooltip, "SetBackdrop", TOOLTIP_BACKGROUND)
    Call(tooltip, "SetBackdropColor", 0, 0, 0, 0.95)
    local border = ns.UI and ns.UI.PixelBorder
    if border then
        tooltip.rsPixelBorder = tooltip.rsPixelBorder or border:Ensure(tooltip)
        border:Update(tooltip.rsPixelBorder, TOOLTIP_BORDER, true)
    end
    local bodyFont, bodySize, bodyFlags = Call(_G.GameTooltipText, "GetFont")
    local titleFont, titleSize, titleFlags = Call(_G.GameTooltipHeaderText, "GetFont")
    local customFont = ns.Font and ns.Font.GetName and ns.Font:GetName("tooltip") ~= "默认"
        and ns.Font:GetPath("tooltip") or nil
    bodyFont = customFont or bodyFont or Adapter:GetSystemFontPath()
    titleFont = customFont or titleFont or bodyFont
    local name = Call(tooltip, "GetName") or "RSConsumableBarTooltip"
    for index = 1, Call(tooltip, "NumLines") or 0 do
        local title = index == 1
        local size = title and (titleSize or 18) or (bodySize or 16)
        local flags = (title and titleFlags or bodyFlags) or ""
        local left, right = _G[name .. "TextLeft" .. index], _G[name .. "TextRight" .. index]
        Call(left, "SetFont", index == 1 and titleFont or bodyFont, size, flags)
        Call(right, "SetFont", bodyFont, size, flags)
    end
end

local function TooltipShown(tooltip)
    StyleItemTooltip(tooltip)
    tooltip:RegisterEvent("PLAYER_REGEN_DISABLED")
end

local function TooltipHidden(tooltip)
    tooltip:UnregisterEvent("PLAYER_REGEN_DISABLED")
end

local function TooltipEvent(tooltip, event)
    if event == "PLAYER_REGEN_DISABLED" then tooltip:Hide() end
end

local function GetItemTooltip(create)
    if not itemTooltip and create then
        itemTooltip = _G.CreateFrame("GameTooltip", "RSConsumableBarTooltip", Adapter:GetRootFrame(), "GameTooltipTemplate,BackdropTemplate")
        itemTooltip:HookScript("OnShow", TooltipShown)
        -- Preserve the native template's OnHide cleanup.
        itemTooltip:HookScript("OnHide", TooltipHidden)
        itemTooltip:HookScript("OnEvent", TooltipEvent)
    end
    return itemTooltip
end
Adapter.tooltipProvider = GetItemTooltip
Adapter.tooltipStyleProvider = StyleItemTooltip

local function SetTextIfChanged(region, value)
    if not region or region._rsText == value then return end
    region._rsText = value
    Call(region, "SetText", value)
end

local function SetFontIfChanged(region, path, size, flags)
    if not region then return end
    local signature = tostring(path) .. ":" .. tostring(size) .. ":" .. tostring(flags)
    if region._rsFont == signature then return end
    region._rsFont = signature
    Call(region, "SetFont", path, size, flags)
end

local function OnSecureRefresh(module)
    module.secureRefreshHandle = nil
    module:UpdateBar()
end

local function OnVisualRefresh(module)
    module.visualRefreshHandle = nil
    module:RefreshVisuals()
end

local function OnCombatStart(module)
    module:PLAYER_REGEN_DISABLED()
end

local function OnPlayerRegen(module)
    module:PLAYER_REGEN_ENABLED()
end

local function OnEnteringWorld(module)
    module:RefreshFoodBuffState()
end

local function OnUnitAura(module, _, unit)
    module:UNIT_AURA(nil, unit)
end

local function OnSecureEvent(module)
    module:QueueSecureRefresh()
end

local function OnVisualEvent(module)
    module:QueueVisualRefresh()
end

local function SyncRootSwitch(module, unavailable)
    if not ns.Assembly then return end
    if unavailable then return end
    if type(ns.Assembly.SyncModuleConfigured) == "function" then
        ns.Assembly:SyncModuleConfigured("ConsumableBar", module.db.profile.enabled ~= false)
    end
end

local function OnFontChanged(module, _, role)
    if role == "tooltip" then
        if itemTooltip and Call(itemTooltip, "IsShown") then StyleItemTooltip(itemTooltip) end
        return
    end
    if role ~= "consumableBar" or module:GetState() ~= "enabled" then return end
    module:ApplyFonts()
    module:ApplySharedFont()
    module:RefreshSettings()
end

function Definition:Initialize()
    self.available = Adapter:IsAvailable()
    self.previewMode = false
    self.isUnlocked = false
    self.needsSecureRefresh = false
    self.secureRefreshHandle = nil
    self.visualRefreshHandle = nil
    self.visualDriverOwned = false
    self.visualDriverRemaining = nil
    self.nextCooldownRefresh = nil
    self.nextBuffTextRefresh = nil
    self.groupFrames = {}
    self.groupsOwned = false
    self.visibleByGroup = {}
    self.positionRetryHandles = {}
    self.positionRetryCallbacks = {}
    self.foodBuffExpirations = {}
    self.itemIconCache = {}
    self.itemLevelCache = {}
    self.itemIDScratch = {}
    self.sharedCooldownCache = {}
    self.cooldownCacheGeneration = 0
    self.emptyItems = {}
    self:MigrateProfile()
    SyncRootSwitch(self, not self.available)
    if ns.ConsumableBarSettings and type(ns.ConsumableBarSettings.Register) == "function" then
        ns.ConsumableBarSettings:Register(self)
    end
end

function Definition:ProfileChanged()
    self:MigrateProfile()
    SyncRootSwitch(self, not self.available)
    if self.settingsVisible then
        self:EnsureData(true)
        self:ApplySharedFont()
    end
end

local function RootEnabled()
    return not ns.Assembly or not ns.Assembly.IsModuleEnabled
        or ns.Assembly:IsModuleEnabled("ConsumableBar")
end

function Definition:ShouldRunLive()
    local root, enabled = RootEnabled(), self:GetProfile().enabled == true
    if not root or not enabled then return false end
    local session = self.previewSession
    if not session then return true end
    if session.intent ~= nil or root ~= session.root or enabled ~= session.enabled then
        return session.intent ~= false
    end
    return session.wasEnabled
end

function Definition:CanRun()
    -- Saved intent is not runtime ownership (the assembly switch may be off).
    local state = self:GetState()
    if state ~= "enabled" and state ~= "enabling" then return false end
    local profile = self:GetProfile()
    return self.available and (self.previewMode or self.isUnlocked or profile and profile.enabled)
end

function Definition:RegisterRuntimeEvents()
    self:RegisterEvent("PLAYER_REGEN_ENABLED", OnPlayerRegen)
    if self.previewMode then self:RegisterEvent("PLAYER_REGEN_DISABLED", OnCombatStart) end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", OnEnteringWorld)
    self:RegisterEvent("UNIT_AURA", OnUnitAura)
    self:RegisterEvent("BAG_UPDATE_DELAYED", OnSecureEvent)
    if self.DATA.hasBandages then self:RegisterEvent("SKILL_LINES_CHANGED", OnSecureEvent) end
    self:RegisterEvent("SPELLS_CHANGED", OnSecureEvent)
    self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN", OnVisualEvent)
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", OnVisualEvent)
    self:RegisterEvent("SPELL_UPDATE_COOLDOWN", OnVisualEvent)
    self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED", OnSecureEvent)
end

local function StartRuntime(self)
    if not self:EnsureData() then error("ConsumableBar data is unavailable", 2) end
    if ns.Font and type(ns.Font.Subscribe) == "function" then
        self.fontSubscription = ns.Font
        ns.Font:Subscribe(self, OnFontChanged)
    end
    self:RegisterRuntimeEvents()
    self:CreateGroups()
    self:QueuePositionRetry()
    self:RefreshFoodBuffState()
    self:UpdateBar()
    self:ApplySharedFont()
    self:ApplyFonts()
end

function Definition:Enable()
    if not self:CanRun() then return end
    local ok, reason = pcall(StartRuntime, self)
    if not ok then
        -- 外部 Font 订阅不在 Runtime 资源袋中，失败也必须成对退订。
        Definition.Disable(self)
        error(reason, 0)
    end
end

function Definition:Disable()
    self:PruneSavedDefaults()
    Adapter:HideTooltip()
    self.previewMode = false
    self.previewSession = nil
    self.groupsOwned = false
    local font = self.fontSubscription
    self.fontSubscription = nil
    if font and type(font.Unsubscribe) == "function" then font:Unsubscribe(self) end
    self.needsSecureRefresh = false
    self.secureRefreshHandle = nil
    self.visualRefreshHandle = nil
    self.visualDriverOwned = false
    self.visualDriverRemaining = nil
    self.nextCooldownRefresh = nil
    self.nextBuffTextRefresh = nil
    self.isUnlocked = false
    local _, frame
    for _, frame in pairs(self.groupFrames or {}) do HideFrame(frame); HideFrame(frame.preview) end
    self:ReleaseIndexes()
end

function Definition:PLAYER_REGEN_DISABLED()
    Adapter:HideTooltip()
    if not self.previewMode then return end
    -- Only the independent, unprotected view is touched during combat.
    -- Keep preview intent so regen can restore it without changing saved switches.
    for _, frame in pairs(self.groupFrames or {}) do
        if frame.preview then
            HideFrame(frame.preview)
            HideFrame(frame.preview.dragOverlay)
            for _, entry in pairs(frame.preview.flyouts or {}) do HideFrame(entry.menu) end
        end
        HideFrame(frame.dragOverlay)
    end
    Adapter:HideTooltip()
    self.needsSecureRefresh = true
end

function Definition:PLAYER_REGEN_ENABLED()
    if self.needsSecureRefresh then
        self.needsSecureRefresh = false
        self:QueueSecureRefresh()
    else
        self:QueueVisualRefresh()
    end
end

function Definition:UNIT_AURA(_, unit)
    if unit == "player" then self:RefreshFoodBuffState() end
end

function Definition:QueueSecureRefresh()
    if not self:CanRun() then return false end
    if Adapter:IsInCombat() then
        self.needsSecureRefresh = true
        return false
    end
    if self.secureRefreshHandle then return self.secureRefreshHandle end
    self.secureRefreshHandle = self:RequestRefresh(
        "consumable-bar-secure",
        OnSecureRefresh,
        0.05
    )
    return self.secureRefreshHandle
end

function Definition:QueueVisualRefresh()
    if not self:CanRun() then return false end
    if self.visualRefreshHandle then return self.visualRefreshHandle end
    self.visualRefreshHandle = self:RequestRefresh(
        "consumable-bar-visual",
        OnVisualRefresh,
        0.05
    )
    return self.visualRefreshHandle
end

function Definition:ToggleEnabled(value)
    if not self.available then return false end
    value = value and true or false
    self:GetProfile().enabled = value
    if self.previewSession then self.previewSession.intent = value end
    if type(ns.Assembly) == "table" and type(ns.Assembly.SetModuleEnabled) == "function" then
        ns.Assembly:SetModuleEnabled("ConsumableBar", value)
    end
    return value
end

function Definition:ToggleOwnedOnly(value)
    self:GetProfile().ownedOnly = value and true or false
    self:QueueSecureRefresh()
end

function Definition:ToggleCooldownDesaturate(value)
    self:GetProfile().cooldownDesaturate = value and true or false
    self:QueueVisualRefresh()
end

function Definition:SetPreviewMode(enabled, button)
    if not self.available or Adapter:IsInCombat() then return false end
    if enabled and not self.previewMode then
        self.previewSession = {
            wasEnabled = self:GetState() == "enabled",
            root = RootEnabled(), enabled = self:GetProfile().enabled == true,
        }
    end
    local restoreLive = self:ShouldRunLive()
    Adapter:HideTooltip()
    self.categoryPreviewTransition = true
    self.previewMode = enabled and true or false
    if button and type(button.SetText) == "function" then
        button:SetText(self.previewMode and "取消预览" or "预览模式")
    end
    if self.previewMode then
        if self:GetState() ~= "enabled" then
            local ok = ns.Runtime:EnableModule(self)
            if not ok then
                self.previewMode = false
                self.previewSession = nil
                self.categoryPreviewTransition = nil
                return false
            end
        else
            self:RegisterEvent("PLAYER_REGEN_DISABLED", OnCombatStart)
            self:CreateGroups()
            self:UpdateBar()
        end
    elseif not restoreLive and not self.isUnlocked then
        ns.Runtime:DisableModule(self)
    else
        self:UnregisterEvent("PLAYER_REGEN_DISABLED")
        self:UpdateBar()
        if not self.isUnlocked then self.previewSession = nil end
    end
    return self.previewMode
end

function Definition:RetryGroupPosition(groupKey)
    if Adapter:IsInCombat() then self.needsSecureRefresh = true; return end
    for _, group in ipairs(Data.groups or {}) do
        if group.key == groupKey then
            local frame = self.groupFrames[group.key]
            local profile = self:GetProfile()
            if frame and not (profile.positions and profile.positions[group.key]) then
                if self.previewMode then
                    if frame.preview then self:ApplyGroupPosition(frame.preview, group) end
                else
                    self:ApplyGroupPosition(frame, group)
                end
            end
            return
        end
    end
end

function Definition:RetryAllGroupPositions()
    local groupIndex
    for groupIndex = 1, #(Data.groups or {}) do
        self:RetryGroupPosition(Data.groups[groupIndex].key)
    end
end

function Definition:QueuePositionRetry()
    local callbacks = self.positionRetryCallbacks
    local delays = { 0.2, 1, 3 }
    local handles = self.positionRetryHandles
    local index
    for index = 1, #delays do
        if not callbacks[index] then
            callbacks[index] = function(module) module:RetryAllGroupPositions() end
        end
        handles[index] = self:Schedule(
            delays[index],
            callbacks[index],
            "ConsumableBar shared position retry"
        )
    end
end

function Definition:UpdateBar()
    self.secureRefreshHandle = nil
    if not self:CanRun() then
        local _, frame
        for _, frame in pairs(self.groupFrames or {}) do HideFrame(frame) end
        self:StopVisualDriver()
        return false
    end
    if Adapter:IsInCombat() then
        self.needsSecureRefresh = true
        return false
    end
    self.needsSecureRefresh = false
    self:CreateGroups()
    local liveEnabled = self:ShouldRunLive() or (self.isUnlocked and not self.previewMode)
    for _, group in ipairs(Data.groups or {}) do
        local frame = self.groupFrames[group.key]
        if frame then
            if self.previewMode then
                -- Overlay only: keep live protected geometry, visibility, bindings and menus intact.
                self:LayoutPreviewGroup(frame, group, self:GetVisibleItems(group, true))
                HideFrame(frame.dragOverlay)
            else
                local items = self.emptyItems
                if liveEnabled and (self:IsGroupEnabled(group) or self.isUnlocked) then
                    items = self:GetVisibleItems(group, false)
                end
                self:LayoutGroup(frame, group, items)
                self:ApplyGroupPosition(frame, group)
                if #items > 0 then Call(frame, "Show") else HideFrame(frame) end
                if frame.preview then
                    HideFrame(frame.preview)
                    HideFrame(frame.preview.dragOverlay)
                    for _, entry in pairs(frame.preview.flyouts or {}) do HideFrame(entry.menu) end
                end
            end
        end
    end
    self.categoryPreviewTransition = nil
    self:RefreshVisuals()
    if self.isUnlocked then
        for _, group in ipairs(Data.groups or {}) do
            local frame = self.groupFrames[group.key]
            local target = self.previewMode and frame.preview or frame
            if target then Call(self:CreateMoveOverlay(target, group), "Show") end
        end
    end
    self:UpdateDragOverlay()
    return true
end

function Definition:RefreshVisuals()
    self.visualRefreshHandle = nil
    if not self:CanRun() then return false end
    if self.previewMode and not self:ShouldRunLive() then self:StopVisualDriver(); return false end
    self.cooldownCacheGeneration = self.cooldownCacheGeneration + 1
    local generation = self.cooldownCacheGeneration
    local hasActiveCooldown = false
    local font = self:ResolveFontPath()
    local _, frame
    for _, frame in pairs(self.groupFrames or {}) do
        local index
        for index, button in self:IterateDisplayButtons(frame) do
            local info = button.customInfo
            if info then
                local icon = self:GetInfoIcon(info)
                if button._rsIcon ~= icon then
                    button._rsIcon = icon
                    Call(button.icon, "SetTexture", icon)
                end
                SetTextIfChanged(button.slotText, info.slot and (info.name or "") or "")
                local buffTime = self:GetBuffTimeText(info)
                SetTextIfChanged(button.buffText, buffTime)
                Call(button.buffText, "SetShown", buffTime ~= "")
                SetFontIfChanged(button.countText, font, info.kind == "food" and 12 or 11, "OUTLINE")
                local count = self:GetDisplayItemID(info)
                count = count and Adapter:GetItemCount(count, false) or 0
                SetTextIfChanged(button.countText, not info.slot and info.kind ~= "categoryMenu"
                    and count > 0 and tostring(count) or "")

                local owned = self:HasOwnedItem(info)
                local visualOwned = info.kind == "categoryMenu" or (self.isUnlocked and not self.previewMode) or owned
                local start, duration, _, cooldownActive =
                    self:GetSharedCooldown(info, self.sharedCooldownCache, generation)
                if cooldownActive then
                    hasActiveCooldown = true
                    if button._rsCooldownStart ~= start or button._rsCooldownDuration ~= duration then
                        button._rsCooldownStart = start
                        button._rsCooldownDuration = duration
                        Call(button.cooldown, "SetCooldown", start, duration)
                    end
                    self:ScheduleCooldownRefresh(start, duration)
                else
                    if button._rsCooldownStart ~= nil then
                        self:ClearCooldown(button.cooldown)
                        button._rsCooldownStart = nil
                        button._rsCooldownDuration = nil
                    end
                end
                local slotShown = not info.slot or not cooldownActive
                if button._rsSlotShown ~= slotShown then
                    button._rsSlotShown = slotShown
                    Call(button.slotText, "SetShown", slotShown)
                end
                local cooldownFade = cooldownActive and self:GetProfile().cooldownDesaturate
                local visualState = not visualOwned and "missing"
                    or cooldownFade and "cooldown" or "ready"
                if button._rsVisualState ~= visualState then
                    button._rsVisualState = visualState
                    Call(button.icon, "SetDesaturated", visualState ~= "ready")
                    if visualState == "missing" then
                        Call(button.icon, "SetVertexColor", 0.45, 0.45, 0.45)
                    elseif visualState == "cooldown" then
                        Call(button.icon, "SetVertexColor", 0.65, 0.65, 0.65)
                    else
                        Call(button.icon, "SetVertexColor", 1, 1, 1)
                    end
                end
            end
        end
    end
    if not hasActiveCooldown then self.nextCooldownRefresh = nil end
    local hasActiveBuff = self:HasActiveFoodBuff()
    if hasActiveBuff then self:ScheduleNextFoodBuffTextRefresh() end
    local needsDriver = hasActiveCooldown or hasActiveBuff
    if needsDriver then self:EnsureVisualDriver() else self:StopVisualDriver() end
    return needsDriver
end

function Definition:OpenSettings()
    return ns.UI and type(ns.UI.OpenMain) == "function" and ns.UI:OpenMain("consumableBar") or false
end

function Definition:ShowTooltip(button, previewContent)
    local info = button and button.customInfo
    if not info then return false end
    if button.isPreview and not previewContent then
        local left, right = info.clicks and info.clicks.left, info.clicks and info.clicks.right
        if left and right and left.type == "item" and right.type == "item" and left.id ~= right.id then
            local shown = self:ShowTooltip(button, true)
            if shown then
                local tooltip = Adapter:GetTooltip()
                Call(tooltip, "AddLine", "仅预览，不可使用", 0.6, 0.8, 1)
                Adapter:PresentTooltip(tooltip)
            end
            return shown
        end
        local shown, tooltip
        if info.kind ~= "categoryMenu" then
            shown, tooltip = Adapter:ShowItemTooltip(button, info, self:GetDisplayItemID(info))
        end
        if shown then
            if info.poisonFamily then Call(tooltip, "AddLine", "实际使用：左键主手，右键副手", 0.6, 0.8, 1) end
            Call(tooltip, "AddLine", "仅预览，不可使用", 0.6, 0.8, 1)
            Adapter:PresentTooltip(tooltip)
            return true
        end
        local name = info.name or self:GetClickFallbackName(info, "left") or "消耗品"
        return Adapter:ShowTooltip(button, "|cff" .. Adapter:GetClassColorHex() .. name .. (info.kind == "categoryMenu" and "类" or "") .. "|r"
            .. "\n仅预览，不可使用")
    end
    if info.kind == "categoryMenu" then
        return Adapter:ShowTooltip(button, "|cff" .. Adapter:GetClassColorHex() .. info.name .. "类|r")
    elseif info.poisonFamily then
        return Adapter:ShowTooltip(button, (info.name or "毒药")
            .. "\n左：主手\n右：副手", self:GetDisplayItemID(info))
    end
    local left, right = info.clicks and info.clicks.left, info.clicks and info.clicks.right
    if button.isCategoryItem or (not info.conjureSpellID and left and left.type == "item"
        and (not right or (right.type == "item" and right.id == left.id))) then
        return (Adapter:ShowItemTooltip(button, info, self:GetDisplayItemID(info)))
    end
    local text = ""
    if info.kind == "equipment" then
        return Adapter:ShowTooltip(button, "|cff" .. Adapter:GetClassColorHex() .. (info.name or "") .. "|r",
            Adapter:GetInventoryItemID(info.slot))
    end
    local leftName = self:GetClickName(
        info.clicks and info.clicks.left,
        self:GetClickFallbackName(info, "left")
    )
    local rightName = self:GetClickName(
        info.clicks and info.clicks.right,
        self:GetClickFallbackName(info, "right")
    )
    if info.conjureSpellID then rightName = "制造" .. info.name end
    local leftColor = info.clickColors and info.clickColors.left or info.color or "04f192"
    local rightColor = info.clickColors and info.clickColors.right or info.color or "04f192"
    if leftName then text = "|cffffffff左键 · |r|cff" .. leftColor .. leftName .. "|r" end
    if rightName and (rightName ~= leftName or (left and right and left.id ~= right.id)) then
        text = text .. (text ~= "" and "\n" or "") .. "|cffffffff右键 · |r|cff" .. rightColor .. rightName .. "|r"
    end
    local itemIDs = {}
    if left and left.type == "item" then itemIDs[#itemIDs + 1] = left.id end
    if right and right.type == "item" and not info.conjureSpellID then itemIDs[#itemIDs + 1] = right.id end
    return Adapter:ShowTooltip(button, text, itemIDs)
end

ns.RegisterModule("ConsumableBar", Definition)
