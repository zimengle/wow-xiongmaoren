local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ellesmereui") then return end

if not (ns.Build and ns.Build.IsFamily and (ns.Build.IsFamily("retail") or (ns.Build.GetID and ns.Build.GetID() == "classic-infinite"))
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Integration = {}
local ownership

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loaded = pcall(callback, "EllesmereUIMinimap")
    if not ok then return false end
    if type(loaded) == "table" then return loaded[1] and true or false end
    return loaded and true or false
end

local function IsSameSize(left, right)
    if not (left and right and type(left.GetSize) == "function" and type(right.GetSize) == "function") then
        return false
    end
    local okLeft, leftWidth, leftHeight = pcall(left.GetSize, left)
    local okRight, rightWidth, rightHeight = pcall(right.GetSize, right)
    if not (okLeft and okRight) then return false end
    return math.abs((tonumber(leftWidth) or 0) - (tonumber(rightWidth) or 0)) < 1
        and math.abs((tonumber(leftHeight) or 0) - (tonumber(rightHeight) or 0)) < 1
end

local function FindWheelOverlay()
    local minimap = _G.Minimap
    if not minimap or type(minimap.GetChildren) ~= "function" then return nil end
    local ok, children = pcall(function() return { minimap:GetChildren() } end)
    if not ok then return nil end
    local index
    for index = 1, #children do
        local child = children[index]
        local parent = child and type(child.GetParent) == "function" and child:GetParent() or nil
        local wheel = child and type(child.GetScript) == "function" and child:GetScript("OnMouseWheel") or nil
        local mouseUp = child and type(child.GetScript) == "function" and child:GetScript("OnMouseUp") or nil
        if parent == minimap and type(wheel) == "function" and type(mouseUp) == "function"
            and type(child.SetScript) == "function" and IsSameSize(child, minimap) then
            return child
        end
    end
    return nil
end

local function IsFeatureActive(module)
    local profile = module and module.db and module.db.profile
    return module ~= nil and module.runtimeActive == true and profile ~= nil
        and profile.ellesmereMinimapVolume == true
end

local function AdjustMasterVolume(delta)
    delta = tonumber(delta) or 0
    local callback = delta > 0 and _G.Sound_MasterVolumeUp or _G.Sound_MasterVolumeDown
    if delta == 0 or type(callback) ~= "function" then return false end
    if not pcall(callback) then return false end

    local getCVar = _G.GetCVar
    local volume = type(getCVar) == "function" and tonumber(getCVar("Sound_MasterVolume")) or nil
    local errors = _G.UIErrorsFrame
    if volume and errors and type(errors.AddMessage) == "function" then
        local percent = math.floor(volume * 100 + 0.5)
        errors:AddMessage(("主音量：%d%%"):format(percent), 1, 0.82, 0)
    end
    return true
end

function Integration:ShouldRefreshForAddon(addonName)
    return addonName == "EllesmereUIMinimap"
end

function Integration:Deactivate(module)
    local state = ownership
    if not state or (module ~= nil and state.owner ~= module) then return false end
    state.active = false
    local current = type(state.frame.GetScript) == "function" and state.frame:GetScript("OnMouseWheel") or nil
    if current == state.wrapper then
        pcall(state.frame.SetScript, state.frame, "OnMouseWheel", state.original)
    end
    ownership = nil
    return true
end

function Integration:Activate(module)
    if not IsLoaded() then
        self:Deactivate(module)
        return false, false
    end

    local frame = FindWheelOverlay()
    if not frame then return false, true end
    if ownership and ownership.owner == module and ownership.frame == frame
        and frame:GetScript("OnMouseWheel") == ownership.wrapper then
        ownership.active = true
        return true, false
    end

    self:Deactivate(module)
    local original = frame:GetScript("OnMouseWheel")
    if type(original) ~= "function" then return false, true end
    local state = { owner = module, frame = frame, original = original, active = true }
    state.wrapper = function(target, delta, ...)
        local controlDown = type(_G.IsControlKeyDown) == "function" and _G.IsControlKeyDown()
        if state.active and IsFeatureActive(module) and controlDown and AdjustMasterVolume(delta) then return end
        return state.original(target, delta, ...)
    end
    local ok = pcall(frame.SetScript, frame, "OnMouseWheel", state.wrapper)
    if not ok then return false, true end
    ownership = state
    return true, false
end

ns.ExtraToolsEllesmereMinimapIntegration = Integration

-- Settings shortcut only. EUI owns the profile and the saved native direction.
-- Resolve the current profile on every interaction; never seed a second RS value.
local BagSort = {}
ns.ExtraToolsBagSortIntegration = BagSort

local function BagProfile()
    local addons = _G.C_AddOns
    local loaded = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(loaded) ~= "function" or not loaded("EllesmereUIBags") then
        return nil, "请先安装并启用 EllesmereUI 背包模块。"
    end
    local eui = _G.EllesmereUI
    if not (eui and eui._ModuleNS and eui._ModuleNS.EllesmereUIBags) then
        return nil, "EllesmereUI 背包模块尚未就绪。"
    end
    local profile = eui._bagsDB and eui._bagsDB.profile
    local container = _G.C_Container
    if type(profile) ~= "table" or type(profile.bagSortToBottom) ~= "boolean"
        or not container or type(container.GetSortBagsRightToLeft) ~= "function"
        or type(container.SetSortBagsRightToLeft) ~= "function" then
        return nil, "当前 EllesmereUI 版本或客户端不支持此设置。"
    end
    return profile
end

-- EUI 9.5.4: _recentItems is created after the takeover/stand-down branch.
-- Do not call PadUIStandDown before that point: it memoizes the login UI style.
-- Loading or disabling an addon preference is not a live install/uninstall.
function BagSort:GetOwnershipState()
    local addons = _G.C_AddOns
    local probe = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    local unknown = "无法确认 Elles 背包接管状态，请稍后重新打开设置；若刚切换插件或界面模式，请先重载。"
    if type(probe) ~= "function" then return nil, unknown end
    local ok, loaded = pcall(probe, "EllesmereUIBags")
    if not ok then return nil, unknown end
    if not loaded then return false end
    local eui, frame = _G.EllesmereUI, _G.EUI_Bags
    local bags = eui and eui._ModuleNS and eui._ModuleNS.EllesmereUIBags
    if _G.EUI_CLIENT_BLOCKED and not frame then return false end
    if not bags or not frame or type(frame._recentItems) ~= "table"
        or type(bags.PadUIStandDown) ~= "function" then return nil, unknown end
    local ready, standDown = pcall(bags.PadUIStandDown)
    if not ready or type(standDown) ~= "boolean" then return nil, unknown end
    if standDown then return false end
    return true, "当前正在使用 Elles 背包，此选项暂不可用。|n停用 Elles 背包并重载界面，恢复使用暴雪原生背包后即可调整。"
end

function BagSort:GetState()
    local p, reason = BagProfile()
    local combat = type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown()
    return p and p.bagSortToBottom == true or false, p ~= nil and not combat,
        reason or (combat and "战斗结束后可修改。" or "同步 EllesmereUI「从底部开始排列」；修改后请再整理背包。")
end

function BagSort:SetEnabled(value)
    local p, reason = BagProfile()
    if not p then return false, reason end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "战斗结束后可修改。"
    end
    value = value and true or false
    if value == p.bagSortToBottom then return true end
    local container = _G.C_Container
    local ok, before = pcall(container.GetSortBagsRightToLeft)
    if not ok or type(before) ~= "boolean" then return false, "无法读取原生整理方向，未修改。" end
    local target = p.bagSortBlizzRTLWas
    if value then target = false end
    if target ~= nil then
        if type(target) ~= "boolean" then return false, "EllesmereUI 保存的整理方向无效，未修改。" end
        local written = pcall(container.SetSortBagsRightToLeft, target)
        if not written then return false, "原生整理方向写入失败，EllesmereUI 设置未修改。" end
    end
    local previousValue, previousSaved = p.bagSortToBottom, p.bagSortBlizzRTLWas
    if value then p.bagSortBlizzRTLWas = before else p.bagSortBlizzRTLWas = nil end
    p.bagSortToBottom = value
    local eui = _G.EllesmereUI
    if type(eui.RefreshPage) == "function" then pcall(eui.RefreshPage, eui) end
    if target == nil then return true end
    local saved = p.bagSortBlizzRTLWas
    return true, nil, function()
        -- A profile switch or an external edit invalidates this transaction.
        if BagProfile() ~= p or p.bagSortToBottom ~= value or p.bagSortBlizzRTLWas ~= saved then
            return true
        end
        local readOK, after = pcall(container.GetSortBagsRightToLeft)
        if readOK and after == target then return true end
        if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
            return false, "整理方向未确认，脱战后请重新检查。"
        end
        pcall(container.SetSortBagsRightToLeft, before)
        p.bagSortToBottom, p.bagSortBlizzRTLWas = previousValue, previousSaved
        if type(eui.RefreshPage) == "function" then pcall(eui.RefreshPage, eui) end
        return false, "原生整理方向未能同步，已尝试恢复 EllesmereUI 设置。"
    end
end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) == "table" then
    local function SkinLoaded()
        local addons = _G.C_AddOns
        local probe = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
        if type(probe) ~= "function" then return false end
        local ok, loaded = pcall(probe, "EllesmereUIBlizzardSkin")
        return ok and loaded and true or false
    end
    -- Elles repaints icon vertex colors after the item-quality callback, including
    -- on its private page flips. Keep our tint on a separate, mouse-free texture.
    if ns.Build.GetID and ns.Build.GetID() == "classic-infinite" then
        local surface = { overlays = {} }
        ns.EllesMerchantRecipeSurface = surface

        function surface:Ready()
            return SkinLoaded() and type(_G.MerchantFrameItem_UpdateQuality) == "function"
        end
        function surface:Shown()
            local frame = _G.MerchantFrame
            return frame and frame:IsShown() and frame.selectedTab ~= 2
        end
        local function GridIcon(button)
            return button.Icon or button.icon or _G[button:GetName() .. "IconTexture"]
        end
        function surface:PaintRow(service, row, link, icon)
            local tint = self.overlays[row]
            if not icon or not icon:GetTexture() or not service:IsKnown(link) then
                if tint then tint:Hide() end
                return
            end
            if not tint then
                tint = row.ItemButton:CreateTexture(nil, "ARTWORK", nil, 7)
                tint:SetAllPoints(icon)
                -- Match the vendor's red channel multiplier on the green channel.
                local intensity = icon == row.SlotTexture and 1 or 0.9
                tint:SetVertexColor(0, intensity, 0, 1)
                self.overlays[row] = tint
            end
            tint:SetTexture(icon:GetTexture())
            tint:SetTexCoord(icon:GetTexCoord())
            tint:Show()
        end
        function surface:Hook(module)
            return module:HookSecureFunction("MerchantFrameItem_UpdateQuality", function(_, row, link)
                local name = row and row.GetName and row:GetName()
                if not name then return end
                local icon
                if name:match("^EUI_MerchantPage%d+$") then icon = GridIcon(row.ItemButton)
                elseif name:match("^EUI_MerchantItem%d+$") then icon = row.SlotTexture
                else return end
                self:PaintRow(ns.ExtraToolsKnownRecipe, row, self:Shown() and link, icon)
            end, "elles-known-recipe")
        end
        function surface:Paint(service)
            if not self:Shown() then return end
            local scroll = _G.MerchantFrame.wSkinScrollFrame
            if scroll and scroll:IsVisible() then
                for _, row in ipairs(scroll.rows or {}) do
                    if row:IsVisible() then self:PaintRow(service, row, row.ItemButton.link, row.SlotTexture) end
                end
            else
                local i = 1
                local row = _G["EUI_MerchantPage1"]
                while row and row:IsVisible() do
                    self:PaintRow(service, row, row.ItemButton.link, GridIcon(row.ItemButton))
                    i = i + 1
                    row = _G["EUI_MerchantPage" .. i]
                end
            end
        end
        function surface:Restore()
            for _, tint in pairs(self.overlays) do tint:Hide() end
        end
    end
    Registry:Register({
        id = "ellesmereui-merchant",
        priority = 20,
        addonNames = { EllesmereUIBlizzardSkin = true },
        OwnsMerchantLayout = function()
            if not SkinLoaded() then return false end
            local saved = _G.EllesmereUIDB
            local elles = _G.EllesmereUI
            if saved and saved.reskinMerchant == false then return false end
            if elles and elles.GetBlizzWindowStyle and elles.GetBlizzWindowStyle("merchant") == "off" then return false end
            if type(saved) == "table" and saved.merchantShowAsList == true then return true end
            if not elles or type(elles._Merchant_ExpandActive) ~= "function" then return false end
            local frame = _G.MerchantFrame
            if frame and (frame.selectedTab or 1) == 1 then return elles._Merchant_ExpandActive() == true end
            -- The settings page can open before the vendor UI or on its buyback tab.
            -- Report the configured sell layout there; Elles uses 2 x 5 as stock.
            return saved and saved.merchantExpand == true and
                (math.floor(tonumber(saved.merchantCols) or 2) > 2 or math.floor(tonumber(saved.merchantRows) or 5) > 5)
        end,
        -- EllesmereUI skins MerchantItem1-12 only; tiles added by the merchant
        -- expansion are painted through its public third-party skin API.
        RegisterMerchantSkin = function(_, callback)
            local elles = _G.EllesmereUI
            if type(elles) ~= "table" or type(elles.RegisterSkin) ~= "function" then return false end
            return pcall(elles.RegisterSkin, "RurutiaSuite", callback) and true or false
        end,
        IsMerchantSkinActive = function()
            if not SkinLoaded() then return false end
            local elles = _G.EllesmereUI
            if type(elles) ~= "table" then return false end
            if type(elles.GetBlizzWindowStyle) == "function" then
                local ok, style = pcall(elles.GetBlizzWindowStyle, "merchant")
                if ok and style == "off" then return false end
            end
            local saved = _G.EllesmereUIDB
            return not (type(saved) == "table" and saved.merchantShowAsList == true)
        end,
    })
end
