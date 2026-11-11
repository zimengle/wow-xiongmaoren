local _, ns = ...
if not (ns.Build and ns.Build.HasModule("NativeTooltip")) then return end
local Adapter, View, Settings = ns.NativeTooltipAdapter, ns.NativeTooltipView, ns.NativeTooltipSettings
local defaults = { combatVisibility = "ctrl", follow = true, direction = "top", x = 0, y = 0, fontSize = 17,
    opacity = 0.86, color = true, health = true,
    showSpellID = true, showItemID = true, showIconID = true, showNPCID = true,
    showAuraSource = true }
if Adapter and Adapter.supportsItemLevel then defaults.showItemLevel = true end
local Definition = { defaultEnabled = true, defaults = { profile = defaults } }

function Definition:GetProfile() return self.db.profile end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    -- Retired exception: all non-unit content now keeps native visibility.
    profile.showAurasInCombat = nil
    for key, value in pairs(defaults) do
        if type(profile[key]) ~= type(value) then profile[key] = value end
    end
    if profile.direction ~= "right" then profile.direction = "top" end
    if profile.combatVisibility ~= "ctrl" and profile.combatVisibility ~= "shift"
        and profile.combatVisibility ~= "show" and profile.combatVisibility ~= "hide" then
        profile.combatVisibility = "ctrl"
    end
    profile.x = math.max(-200, math.min(200, profile.x))
    profile.y = math.max(-200, math.min(200, profile.y))
    profile.fontSize = math.max(12, math.min(24, profile.fontSize))
    profile.opacity = math.max(0.4, math.min(1, profile.opacity))
end

function Definition:Initialize()
    self.hooks = {}
    self.view = View:New(self)
    self:SanitizeProfile()
    Settings:Register(self)
end

function Definition:GetStatusText()
    if self.blocker then return "检测到 " .. self.blocker .. "，鼠标提示增强已暂停。" end
    if self.runtimeActive and self.colorOnly and Adapter.supportsItemLevel then return "EllesmereUI 管理提示框；RS 可补充信息着色与物品等级。" end
    if self.runtimeActive and self.colorOnly then return "EllesmereUI 管理提示框；RS 仅补充信息着色。" end
    return self.runtimeActive and "仅在原生界面生效；关闭跟随后使用原生 HUD 位置。" or "鼠标提示增强已关闭。"
end

function Definition:OnDefaultAnchor(tooltip)
    if not self.runtimeActive or not Adapter:IsMain(tooltip) or not Adapter:IsUsable(tooltip) then return end
    self.view:Follow(tooltip)
end

function Definition:ShouldSuppress(tooltip)
    return not self.colorOnly and Adapter:IsMain(tooltip) and self.unitTooltip == true
        and not self.view:IsAura(tooltip) and Adapter:IsSuppressed(self:GetProfile())
end

function Definition:OnOwnerChanged(tooltip)
    self.unitTooltip = nil
    self.view:StopFollowing()
    self.view:ClearAura(tooltip)
    if self.runtimeActive then self:ApplyVisibility(tooltip) end
end

function Definition:ApplyVisibility(tooltip)
    self.view:SetSuppressed(tooltip, self:ShouldSuppress(tooltip))
end

function Definition:OnVisibilityChanged(event, key)
    if not self.runtimeActive then return end
    local tooltip = _G.GameTooltip
    if not Adapter:IsUsable(tooltip) or not tooltip:IsShown() then return end
    if event == "UPDATE_MOUSEOVER_UNIT" then
        -- A parked world tip may stop receiving visible-frame updates. Discard
        -- it on world hover changes rather than revealing stale unit content.
        if self.view.parked[tooltip] and Adapter:IsWorldOwner(tooltip) then
            tooltip:Hide()
            self:OnHide()
            self.view:ReleaseVisibility()
        end
        return
    end
    if event == "MODIFIER_STATE_CHANGED" then
        local mode = self:GetProfile().combatVisibility
        if not ((mode == "ctrl" and (key == "LCTRL" or key == "RCTRL"))
            or (mode == "shift" and (key == "LSHIFT" or key == "RSHIFT"))) then return end
    end
    local suppress = self:ShouldSuppress(tooltip)
    if not suppress and self.view.parked[tooltip] and not Adapter:IsCurrentHover(tooltip) then
        tooltip:Hide()
        self:OnHide()
        self.view:ReleaseVisibility()
        return
    end
    -- Comparison frames always retain native visibility.
    for _, frame in ipairs({ tooltip, _G.ShoppingTooltip1, _G.ShoppingTooltip2 }) do
        if frame and frame:IsShown() then self.view:SetSuppressed(frame, self:ShouldSuppress(frame)) end
    end
end

function Definition:OnShow(tooltip)
    if not self.runtimeActive or self.view.changingVisibility then return end
    if self.view:IsAura(tooltip) then
        -- Keep the aura context across Show; only restyle, never re-enter the
        -- unit path that would recolour the aura name as a unit header.
        self.view.processing[tooltip] = true
        local ok, reason = pcall(self.view.Style, self.view, tooltip)
        self.view.processing[tooltip] = nil
        if not ok then error(reason, 0) end
    else
        self:OnContent(tooltip, nil, "preserve")
    end
    self:ApplyVisibility(tooltip)
    if Adapter:IsMain(tooltip) then self.view:StartFollowing() end
end

function Definition:OnHide()
    if self.view.changingVisibility then return end
    self.unitTooltip = nil
    self.view:StopFollowing()
    self.view:ClearAura(_G.GameTooltip)
    local skin = self.view.skins[_G.GameTooltip]
    if skin and skin.health then skin.health:Hide() end
end

function Definition:OnFadeOut(tooltip)
    -- World mouse-off keeps the native tooltip visible during its fade. End that
    -- fade only when this module actually owns the cursor anchor.
    if self.runtimeActive and Adapter:IsMain(tooltip) and Adapter:IsUsable(tooltip)
        and (self.view.parked[tooltip] or (self.view.following and self:GetProfile().follow and not Adapter:InEditMode())) then
        tooltip:Hide()
        self:OnHide()
    end
end

function Definition:OnColorUnit(tooltip, data)
    if not self.runtimeActive or not self.colorOnly or not Adapter:IsMain(tooltip)
        or not Adapter:IsUsable(tooltip) then return end
    local unitType = _G.Enum and _G.Enum.TooltipDataType and _G.Enum.TooltipDataType.Unit
    if data and Adapter:Safe(data.type) ~= unitType then return end
    self.view:ColorUnit(tooltip, data)
end

function Definition:OnUnit(tooltip)
    if not self.runtimeActive or not Adapter:IsMain(tooltip) or not Adapter:IsUsable(tooltip) then return end
    self.view:Style(tooltip)
    self.view:ColorUnit(tooltip)
    self.view:UpdateHealth()
end

function Definition:RenderContent(tooltip, data)
    local added = self.view:AddIDs(tooltip, data)
    if Adapter:IsMain(tooltip) then self:OnUnit(tooltip)
    else self.view:Style(tooltip) end
    if added and tooltip:IsShown() then tooltip:Show() end
end

function Definition:RenderAura(tooltip, aura)
    self.view:Style(tooltip)
    if aura then self.view:AddAura(tooltip, aura) end
end

function Definition:OnUnitContent(tooltip) self:OnContent(tooltip, nil, "unit") end
function Definition:OnOtherContent(tooltip) self:OnContent(tooltip, nil, "other") end

function Definition:OnContent(tooltip, data, kind)
    if self.colorOnly then return end
    if not self.runtimeActive or not Adapter:IsUsable(tooltip) or self.view.processing[tooltip] then return end
    if not Adapter:IsTarget(tooltip) then return end
    if Adapter:IsMain(tooltip) and kind ~= "preserve" then
        self.unitTooltip = kind == "unit" or Adapter:IsUnitData(data)
    end
    if not Adapter:Accessible(data) then data = nil end
    if Adapter:IsAuraData(data) then
        -- Aura tooltips belong to the aura setter post-hook. Never run the
        -- unit/item path here: the first line is an aura name, not a unit header.
        self.view:SetAura(tooltip)
        self.view.processing[tooltip] = true
        local ok, reason = pcall(self.view.Style, self.view, tooltip)
        self.view.processing[tooltip] = nil
        if not ok then error(reason, 0) end
        self:ApplyVisibility(tooltip)
        return
    end
    self.view:ClearAura(tooltip)
    self.view.processing[tooltip] = true
    local ok, reason = pcall(self.RenderContent, self, tooltip, data)
    self.view.processing[tooltip] = nil
    if not ok then error(reason, 0) end
    self:ApplyVisibility(tooltip)
end

-- Identification is the native aura setter call itself; aura reads stay
-- best-effort so a restricted client still keeps the native tooltip in combat.
function Definition:HandleAura(tooltip, unit, index, filter, auraInstanceID)
    if not self.runtimeActive or not Adapter:IsUsable(tooltip) or not Adapter:IsMain(tooltip) then return end
    if self.view.processing[tooltip] then return end
    self.unitTooltip = nil
    self.view:SetAura(tooltip)
    local aura = Adapter:GetAuraInfo(unit, index, filter, auraInstanceID)
    if aura then
        aura.iconId = Adapter:GetSpellIcon(aura.spellId) or aura.icon
        aura.source = Adapter:GetAuraSource(aura.sourceUnit)
    end
    self.view.processing[tooltip] = true
    local ok, reason = pcall(self.RenderAura, self, tooltip, aura)
    self.view.processing[tooltip] = nil
    if not ok then error(reason, 0) end
    self:ApplyVisibility(tooltip)
    if aura and tooltip:IsShown() then tooltip:Show() end
end

function Definition:OnUnitAura(tooltip, unit, index, filter)
    self:HandleAura(tooltip, unit, index, filter, nil)
end

-- Buff/Debuff setters usually call with filter = nil; pin the aura kind so the
-- re-read cannot land on a different aura that shares the same index.
function Definition:OnUnitBuff(tooltip, unit, index, filter)
    self:HandleAura(tooltip, unit, index, Adapter:CombineAuraFilter(filter, "HELPFUL"), nil)
end

function Definition:OnUnitDebuff(tooltip, unit, index, filter)
    self:HandleAura(tooltip, unit, index, Adapter:CombineAuraFilter(filter, "HARMFUL"), nil)
end

function Definition:OnUnitAuraInstance(tooltip, unit, auraInstanceID)
    self:HandleAura(tooltip, unit, nil, nil, auraInstanceID)
end

-- Native content rebuilds invalidate both unit and aura identity. Unknown
-- content remains visible until a completed unit callback identifies it.
function Definition:OnTooltipCleared(tooltip)
    if not self.runtimeActive or not Adapter:IsUsable(tooltip) then return end
    if self.view.processing[tooltip] then return end
    if Adapter:IsMain(tooltip) then self.unitTooltip = nil end
    self.view:ClearAura(tooltip)
    self:ApplyVisibility(tooltip)
end

function Definition:OnHealthChanged()
    if self.runtimeActive then self.view:UpdateHealth() end
end

function Definition:Stop()
    self.runtimeActive = false
    self.unitTooltip = nil
    self:UnregisterEvent("PLAYER_REGEN_DISABLED")
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    self:UnregisterEvent("MODIFIER_STATE_CHANGED")
    self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
    Adapter:Unsubscribe(self)
    for i = #self.hooks, 1, -1 do self:RemoveHook(self.hooks[i]); self.hooks[i] = nil end
    self.view:Restore()
end

function Definition:Reconcile()
    local colorOnly = Adapter:IsColorOnly()
    if self.runtimeActive and self.colorOnly ~= colorOnly then self:Stop() end
    self.colorOnly = colorOnly
    self.blocker = Adapter:GetBlocker()
    if self.blocker then
        self:Stop()
        -- Loaded addons cannot unload until reload; no idle listener is needed.
        self:UnregisterAllEvents()
    elseif not self.runtimeActive and Adapter:CanAttach() then
        self.runtimeActive = true
        Adapter:InstallItemLevel()
        if self.colorOnly then
            Adapter:AttachColorOnly(self)
        else
            Adapter:Attach(self)
            self:RegisterEvent("PLAYER_REGEN_DISABLED", self.OnVisibilityChanged)
            self:RegisterEvent("PLAYER_REGEN_ENABLED", self.OnVisibilityChanged)
            self:RegisterEvent("MODIFIER_STATE_CHANGED", self.OnVisibilityChanged)
            self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", self.OnVisibilityChanged)
        end
    end
    if self.settingsPage then self.settingsPage:Refresh("status") end
end

function Definition:OnAddonLoaded(_, name)
    if name == "NDui" or name == "ElvUI" or name == "EllesmereUI" or name == "EllesmereUIBlizzardSkin" then self:Reconcile() end
end

function Definition:Enable()
    self:RegisterEvent("ADDON_LOADED", self.OnAddonLoaded)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.Reconcile)
    self:Reconcile()
end

function Definition:Disable()
    self:UnregisterAllEvents()
    self:Stop()
end

function Definition:ProfileChanged() self:SanitizeProfile() end

function Definition:SetOption(key, value)
    if defaults[key] == nil or type(value) ~= type(defaults[key]) then return false end
    self:GetProfile()[key] = value
    self:SanitizeProfile()
    self.view:Restore()
    return true
end

function Definition:ResetPosition()
    local profile = self:GetProfile()
    profile.direction, profile.x, profile.y = "top", 0, 0
    self.view:Restore()
    return true
end

function Definition:RestoreDefaults()
    for key, value in pairs(defaults) do self:GetProfile()[key] = value end
    self.view:Restore()
    return true
end

ns.NativeTooltip = ns.RegisterModule("NativeTooltip", Definition)
