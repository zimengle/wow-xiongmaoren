-- Original bag art and search/sort stay with Blizzard. Only the backpack and
-- combined bag receive a title overlay; numbered bags may reuse other frames.
local _, ns = ...
local Widget = { hosts = {}, headers = {} }
ns.ExtraToolsBagWindowOption = Widget

local function HideTooltip(button)
    local tip = _G.GameTooltip
    if tip and tip:IsOwned(button) then tip:Hide() end
end

function Widget:HasKeyring(module)
    return module.adapter.features.bagKeyring and _G.Enum and _G.Enum.BagIndex and _G.Enum.BagIndex.Keyring ~= nil
        and type(_G.ToggleBag) == "function" and _G.C_ActionBar and _G.C_ActionBar.ShouldShowKeyring and _G.C_ActionBar.ShouldShowKeyring()
end

function Widget:MakeKey(module, parent)
    local button = module:CreateFrame("Button", nil, parent)
    button:SetSize(20, 20)
    local icon = "bag-key"
    button:SetNormalTexture("Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\" .. icon)
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    button:SetScript("OnEnter", function(self)
        _G.GameTooltip:SetOwner(self, "ANCHOR_TOP")
        _G.GameTooltip:SetText("钥匙扣")
        _G.GameTooltip:Show()
    end)
    button:SetScript("OnLeave", HideTooltip)
    button:SetScript("OnClick", function()
        if not module.runtimeActive or not Widget:HasKeyring(module) then return end
        if not _G.GetCVarBool("showKeyring") then
            module:Notify("获得钥匙后可打开钥匙扣。")
            return
        end
        local id = _G.Enum.BagIndex.Keyring
        _G.ToggleBag(id)
    end)
    return button
end

local function UpdateCount(bar)
    local host = bar.host
    local total, free = 0, 0
    local last = host == _G.ContainerFrameCombinedBags and _G.NUM_TOTAL_BAG_FRAMES or 0
    for id = 0, last do
        if host:MatchesBagID(id) then
            total = total + _G.C_Container.GetContainerNumSlots(id)
            free = free + _G.C_Container.GetContainerNumFreeSlots(id)
        end
    end
    local name = host == _G.ContainerFrame1 and _G.C_Container.GetBagName(0) or _G.COMBINED_BAG_TITLE
    bar.caption:SetText(name or bar.title:GetText())
    bar.count:SetText(("%d/%d"):format(total - free, total))
    -- Preserve the numbers at narrow widths, allowing only the name to truncate.
    local room = bar:GetWidth() - (bar.key and 48 or 20) - bar.count:GetStringWidth() - 7
    bar.caption:SetWidth(math.max(1, math.min(bar.caption:GetUnboundedStringWidth() + 1, room)))
end

local function BuildHeader(module, host)
    local title = host.TitleContainer.TitleText
    local bar = module:CreateFrame("Frame", nil, host.TitleContainer)
    bar:Hide()
    bar.host, bar.title = host, title
    bar:SetPoint("TOPLEFT", host, "TOPLEFT", 38, -2)
    bar:SetPoint("TOPRIGHT", host, "TOPRIGHT", -40, -2)
    bar:SetHeight(20)
    bar:SetFrameLevel(host.TitleContainer:GetFrameLevel() + 2)
    local bag = module:CreateFrame("Button", nil, bar)
    bar.bag = bag
    bag:SetSize(20, 20)
    bag:SetPoint("RIGHT")
    bag:SetNormalAtlas("bag-main")
    bag:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    bag:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    bag:SetScript("OnClick", function(_, mouse)
        if not module.runtimeActive then return end
        if mouse == "RightButton" then
            module:SetBackpackTemporaryShown(nil)
            local ok, why = module:OpenBackpackOptionSettings()
            if ok == false and why then module:Notify(why) end
        elseif module.adapter:IsInCombat() then
            module:Notify("战斗中无法修改系统背包的显示状态。")
        else
            module:SetBackpackTemporaryShown(not module:IsBlizzardBackpackBarShown())
        end
    end)
    bag:SetScript("OnEnter", function(self)
        local tip = _G.GameTooltip
        tip:SetOwner(self, "ANCHOR_TOP")
        tip:SetText("左：打开背包")
        tip:AddLine("右：设置", 1, 1, 1)
        tip:Show()
    end)
    bag:SetScript("OnLeave", HideTooltip)
    if Widget:HasKeyring(module) then
        bar.key = Widget:MakeKey(module, bar)
        bar.key:SetPoint("RIGHT", bag, "LEFT", -8, 0)
    end
    local caption = bar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    bar.caption = caption
    caption:SetPoint("LEFT")
    caption:SetJustifyH("LEFT")
    caption:SetWordWrap(false)
    local count = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bar.count = count
    count:SetPoint("LEFT", caption, "RIGHT", 4, 0)
    count:SetTextColor(0.76, 0.76, 0.76)
    bar:SetScript("OnSizeChanged", function(self)
        if self:IsVisible() then UpdateCount(self) end
    end)
    bar:SetScript("OnShow", function(self)
        self.titleAlpha = self.title:GetAlpha()
        self.title:SetAlpha(0)
        self:RegisterEvent("BAG_UPDATE_DELAYED")
        UpdateCount(self)
    end)
    bar:SetScript("OnHide", function(self)
        self:UnregisterAllEvents()
        self.title:SetAlpha(self.titleAlpha or 1)
        HideTooltip(self.bag)
        if self.key then HideTooltip(self.key) end
    end)
    bar:SetScript("OnEvent", UpdateCount)
    return bar
end

local function ShowHeader(module, host)
    if not module.runtimeActive then return end
    local bar = Widget.headers[host]
    if not bar then
        bar = BuildHeader(module, host)
        Widget.headers[host] = bar
    end
    bar.bag:Show()
    if bar.key then bar.key:Show() end
    bar:Show()
end

local function WatchHost(module, host)
    if not (host and host.TitleContainer and host.TitleContainer.TitleText) or Widget.hosts[host] then return end
    local existing = Widget.headers[host]
    if existing then
        module:OwnFrame(existing)
        module:OwnFrame(existing.bag)
        if existing.key then module:OwnFrame(existing.key) end
    end
    Widget.hosts[host] = module:HookFrameScript(host, "OnShow", function() ShowHeader(module, host) end)
    if host:IsVisible() then ShowHeader(module, host) end
end

function Widget:Refresh()
    for _, bar in pairs(self.headers) do
        if bar:IsVisible() then UpdateCount(bar) end
    end
end

function Widget:Ensure(module)
    if not (module.runtimeActive and module.adapter.features.backpack) then return false end
    WatchHost(module, _G.ContainerFrame1)
    WatchHost(module, _G.ContainerFrameCombinedBags)
    return next(self.hosts) ~= nil
end

Widget.Attach = Widget.Ensure

function Widget:Detach()
    local module = ns.BlizzardEnhancements
    for host, token in pairs(self.hosts) do
        module:RemoveHook(token)
        self.hosts[host] = nil
        local bar = self.headers[host]
        if bar then bar:Hide() end
    end
end
