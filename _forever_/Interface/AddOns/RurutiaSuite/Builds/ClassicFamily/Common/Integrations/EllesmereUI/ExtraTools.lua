local _, ns = ...
if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.GetID
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

if ns.Build.GetID() == "classic-infinite" then
    -- The bag addon rebuilds its icon chain when options or the merchant change.
    -- Extend the computed left edge instead of anchoring to a particular icon.
    local integration = {}
    ns.ExtraToolsEllesBagKey = integration

    function integration:Layout(module, bags)
        local widget = ns.ExtraToolsBagWindowOption
        if not (module.runtimeActive and widget:HasKeyring(module) and bags._bagsBtn) then return end
        local header = bags._bagsBtn:GetParent()
        local search = bags._searchBox
        local edge = bags._hdrEdge
        local nativeStyle = header._foreverToolsY ~= nil
        if nativeStyle then
            -- In the native-style variant the search field ends at the icon group.
            edge = nil
            for i = 1, search:GetNumPoints() do
                local point, relative = search:GetPoint(i)
                if point == "RIGHT" then edge = relative; break end
            end
        end
        if not edge or edge == self.key then return end
        if not self.key then
            self.key = widget:MakeKey(module, header, true)
            -- The Elles artwork is a complete button. Its outer rim shows around
            -- the opaque key disc; reuse the installed texture without copying it.
            local rim = self.key:CreateTexture(nil, "BACKGROUND")
            rim:SetAllPoints(self.key)
            rim:SetTexture("Interface/AddOns/EllesmereUIBags/Media/clean-up.png")
        end
        self.key:ClearAllPoints()
        local gap = 6
        if edge == bags._junkBtn then
            gap = gap + (self.key:GetWidth() - edge:GetWidth()) / 2
        elseif edge == search then
            gap = 13
        end
        self.key:SetPoint("RIGHT", edge, "LEFT", -gap, 0)
        self.key:Show()
        if nativeStyle then
            search:SetPoint("RIGHT", self.key, "LEFT", -6, 0)
        else
            bags._hdrEdge = self.key
            bags:FitHeaderText()
        end
    end

    local function RefreshEmptySlots(skin)
        local host = skin:GetParent()
        local used = 0
        for _, slot in host:EnumerateValidItems() do
            if not _G.C_Container.GetContainerItemID(_G.Enum.BagIndex.Keyring, slot:GetID()) then
                used = used + 1
                local texture = skin.empty[used]
                if not texture then
                    texture = skin.slots:CreateTexture(nil, "ARTWORK")
                    texture:SetTexture("Interface/AddOns/EllesmereUIBags/Media/icon-bg.png")
                    skin.empty[used] = texture
                end
                texture:ClearAllPoints()
                texture:SetAllPoints(slot)
                texture:Show()
            end
        end
        for n = used + 1, #skin.empty do skin.empty[n]:Hide() end
    end

    function integration:RestoreSkin()
        local skin = self.skin
        if not skin or not skin.host then return end
        skin:UnregisterAllEvents()
        skin:Hide()
        for region, alpha in pairs(skin.muted) do
            region:SetAlpha(alpha)
            skin.muted[region] = nil
        end
        skin.host = nil
        self.module:RemoveHook(self.skinHide)
        self.skinHide = nil
    end

    function integration:SkinKeyring(host, bags)
        local header = bags.Header
        -- The alternative Forever style already uses Blizzard window art.
        if not (header and not header._foreverToolsY and host.CloseButton and host.TitleContainer) then return end
        if self.skin and self.skin.host == host then return end
        self:RestoreSkin()
        local skin = self.skin
        if not skin then
            skin = self.module:CreateFrame("Frame", nil, host)
            self.skin = skin
            skin.empty, skin.muted = {}, {}
            skin.slots = self.module:CreateFrame("Frame", nil, skin)
            skin.slots:EnableMouse(false)
            skin.slots:SetAllPoints()
            local pixel = _G.EllesmereUI and _G.EllesmereUI.PanelPP
            if pixel then pixel.CreateBorder(skin, 0.1, 0.1, 0.1, 1, 1, "OVERLAY", 7) end
            skin.body = skin:CreateTexture(nil, "BACKGROUND")
            skin.body:SetAllPoints()
            skin.body:SetTexture("Interface/AddOns/EllesmereUI/media/modern_blizz.png")
            local shade = skin:CreateTexture(nil, "BACKGROUND", nil, 1)
            shade:SetAllPoints()
            shade:SetColorTexture(0, 0, 0, 0.25)
            skin.strip = skin:CreateTexture(nil, "BORDER")
            skin.strip:SetPoint("TOPLEFT")
            skin.strip:SetPoint("TOPRIGHT")
            skin.strip:SetColorTexture(0, 0, 0, 0.5)
            skin.title = skin:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            skin.title:SetPoint("LEFT", skin.strip, "LEFT", 8, 0)
            skin.close = skin:CreateTexture(nil, "OVERLAY")
            skin.close:SetSize(12, 12)
            skin.close:SetTexture("Interface/AddOns/EllesmereUI/media/icons/eui-close.png")
            skin.close:SetAlpha(0.7)
            skin:SetScript("OnEvent", RefreshEmptySlots)
        end
        skin.host = host
        skin:SetParent(host)
        skin:SetAllPoints(host)
        -- Slots keep their own click targets and quality borders. Empty art
        -- must draw over their native empty icon, so keep it on a separate layer.
        skin:SetFrameLevel(0)
        skin.slots:SetFrameLevel(host:GetFrameLevel() + 12)
        skin.slots:Show()
        skin.strip:SetHeight(header:GetHeight())
        skin.title:SetText(host.TitleContainer.TitleText:GetText())
        skin.title:SetFont(header.title:GetFont())
        skin.close:ClearAllPoints()
        skin.close:SetPoint("CENTER", host.CloseButton)
        local function mute(region)
            if region then
                skin.muted[region] = region:GetAlpha()
                region:SetAlpha(0)
            end
        end
        mute(host.Bg)
        mute(host.NineSlice)
        mute(host.PortraitContainer)
        mute(host.TitleContainer.TitleText)
        mute(host.CloseButton)
        self.skinHide = self.module:HookFrameScript(host, "OnHide", function() self:RestoreSkin() end)
        skin:RegisterEvent("BAG_UPDATE_DELAYED")
        skin:Show()
        RefreshEmptySlots(skin)
    end

    function integration:AnchorKeyring()
        local host, bags = self.openKeyring, _G.EUI_Bags
        if not (host and host:IsVisible() and host:MatchesBagID(_G.Enum.BagIndex.Keyring)) then
            self.openKeyring = nil
            return
        end
        if not bags:IsVisible() then return end
        host:ClearAllPoints()
        host:SetPoint("BOTTOMLEFT", bags, "TOPLEFT", 0, 0)
    end

    -- Elles returns the open keyring from its hidden parent inside ToggleBag.
    -- Blizzard gives the flat panel background level 0, below slots and portrait.
    function integration:AfterToggle(id)
        local lookup = _G.ContainerFrameUtil_GetShownFrameForID
        local host = lookup and lookup(id)
        self.openKeyring = nil
        if not (host and host:IsVisible() and host:GetParent() == _G.ContainerFrameContainer) then return end
        self.openKeyring = host
        self:AnchorKeyring()
        self:SkinKeyring(host, _G.EUI_Bags)
        local bg = host.Bg
        if bg and bg:GetFrameLevel() ~= 0 then bg:SetFrameLevel(0) end
    end

    function integration:Attach(module)
        local bags = _G.EUI_Bags
        if self.token or not (bags and bags.SyncHeaderIcons and bags.FitHeaderText) then return end
        self.module = module
        if self.skin then
            module:OwnFrame(self.skin)
            module:OwnFrame(self.skin.slots)
        end
        if self.key then module:OwnFrame(self.key) end
        self.token = module:HookSecureFunction(bags, "SyncHeaderIcons", function()
            self:Layout(module, bags)
        end, "rs-keyring-bag-header")
        if _G.UpdateContainerFrameAnchors then
            self.anchorToken = module:HookSecureFunction("UpdateContainerFrameAnchors", function()
                if self.openKeyring then self:AnchorKeyring() end
            end, "rs-keyring-position")
        end
        if bags._bagsBtn then bags:SyncHeaderIcons() end
    end

    function integration:Detach(module)
        self:RestoreSkin()
        if self.anchorToken then module:RemoveHook(self.anchorToken); self.anchorToken = nil end
        if self.openKeyring then
            self.openKeyring = nil
            _G.UpdateContainerFrameAnchors()
        end
        if self.token then module:RemoveHook(self.token); self.token = nil end
        if self.key then
            self.key:Hide()
            _G.EUI_Bags:SyncHeaderIcons()
        end
    end
    table.insert(ns.ExtraToolsProviderRegistry.junkSaleOwners, function()
        local merchant = _G.EUI_MerchantHandler
        local db = _G.EllesmereUIDB
        return merchant and merchant.IsEventRegistered and merchant:IsEventRegistered("MERCHANT_SHOW")
            and type(db) == "table" and db.autoSellJunk ~= false
    end)
    return
end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before EllesmereUI integration", 2) end

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) and true or false
end

Registry:Register({
    id = "ellesmereui-actionbars",
    priority = 30,
    addonNames = { EllesmereUI = true, EllesmereUIActionBars = true },
    IsActionBarEnabled = function()
        if not IsLoaded("EllesmereUI") or not IsLoaded("EllesmereUIActionBars") then return false end
        -- The suite's action-bar switch enables/disables this separate addon.
        -- A disabled addon may remain loaded until reload; respect that choice.
        local addons = _G.C_AddOns
        local getState = addons and addons.GetAddOnEnableState
        if type(getState) == "function" and getState("EllesmereUIActionBars") == 0 then return false end
        local core = _G.EllesmereUI
        local lite = type(core) == "table" and core.Lite or nil
        if type(lite) == "table" and type(lite.GetAddon) == "function" then
            local actionbars = lite.GetAddon("EllesmereUIActionBars", true)
            if actionbars then return actionbars.enabledState == true end
        end
        return true
    end,
})
