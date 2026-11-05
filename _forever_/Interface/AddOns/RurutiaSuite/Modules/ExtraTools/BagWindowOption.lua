-- ExtraTools: temporary "show bags" option inside the native combined bag window.
-- Left click flips a session-only override (never written to the profile DB);
-- right click opens the matching RS settings page so the persistent option can
-- be changed there.

local _, ns = ...

local Widget = {}
ns.ExtraToolsBagWindowOption = Widget

local HOST_FRAME = "ContainerFrameCombinedBags"
local CAPTION = "显示背包"

local BOX_SIZE = 22
local COLOR_TEXT = { 1, 0.82, 0, 1 }
local COLOR_TEXT_COMBAT = { 0.62, 0.60, 0.63, 1 }

local COMBAT_MESSAGE = "战斗中无法修改系统背包的显示状态。"

local function GetModule()
    return ns.BlizzardEnhancements
end

local function IsSupported()
    local module = GetModule()
    local adapter = module and module.adapter
    return module ~= nil and adapter ~= nil and adapter.features ~= nil
        and adapter.features.backpack == true
end

function Widget:IsInCombat()
    local module = GetModule()
    local adapter = module and module.adapter
    if adapter and type(adapter.IsInCombat) == "function" then
        return adapter:IsInCombat() == true
    end
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Widget:LayoutTitle(active)
    if active and not self.titleLayout then
        local host = _G[HOST_FRAME]
        local title = host and host.TitleContainer and host.TitleContainer.TitleText
        if not (title and title.GetNumPoints and self.sortButton) then return end
        local saved = { title = title, points = {}, height = title:GetHeight(), justify = title:GetJustifyH() }
        for i = 1, title:GetNumPoints() do saved.points[i] = { title:GetPoint(i) } end
        self.titleLayout = saved
        title:ClearAllPoints()
        title:SetHeight(saved.height)
        -- Center the native caption in the free space between the two labels.
        -- Both margins follow the actual text bounds, including UI scaling.
        title:SetPoint("LEFT", self.button.label, "RIGHT", 12, 0)
        title:SetPoint("RIGHT", self.sortButton.label, "LEFT", -12, 0)
        title:SetJustifyH("CENTER")
    elseif not active and self.titleLayout then
        local saved = self.titleLayout
        saved.title:ClearAllPoints()
        saved.title:SetHeight(saved.height)
        for _, point in ipairs(saved.points) do saved.title:SetPoint(unpack(point)) end
        saved.title:SetJustifyH(saved.justify)
        self.titleLayout = nil
    end
end

function Widget:Refresh()
    local button = self.button
    if not button then return false end
    local module = GetModule()
    if not (module and module.runtimeActive and IsSupported()) then
        button:Hide()
        if self.sortButton then self.sortButton:Hide() end
        self:LayoutTitle(false)
        return false
    end

    local shown = module:IsBlizzardBackpackBarShown() == true
    local combat = self:IsInCombat()
    button:SetChecked(shown)
    local text = combat and COLOR_TEXT_COMBAT or COLOR_TEXT
    button.label:SetTextColor(text[1], text[2], text[3], text[4])
    button:Show()
    if self.sortButton then
        local available = _G.C_Container and type(_G.C_Container.SortBags) == "function"
        self.sortButton:SetShown(available and true or false)
        self:LayoutTitle(available and true or false)
        self.sortButton.label:SetTextColor(text[1], text[2], text[3], text[4])
    end
    return true
end

local function OnEnter(self)
    self.hovered = true
    Widget:Refresh()
    local tooltip = _G.GameTooltip
    if not tooltip then return end
    tooltip:SetOwner(self, "ANCHOR_RIGHT")
    tooltip:SetText(CAPTION, 1, 0.82, 0)
    tooltip:AddLine("左键：临时显示或隐藏系统背包栏，方便更换背包容器。", 1, 1, 1, true)
    tooltip:AddLine("右键：打开 RS 设置里的“隐藏背包按钮”，改完以设置为准。", 1, 1, 1, true)
    if Widget:IsInCombat() then
        tooltip:AddLine("战斗中无法修改。", 1, 0.4, 0.4, true)
    end
    tooltip:Show()
end

local function OnLeave(self)
    self.hovered = false
    Widget:Refresh()
    local tooltip = _G.GameTooltip
    if tooltip and tooltip:IsOwned(self) then tooltip:Hide() end
end

local function OnClick(self, mouseButton)
    local module = GetModule()
    if not module then return end
    if mouseButton == "RightButton" then
        -- Drop the temporary override first so the settings page and the in-game
        -- state agree once the persistent option changes.
        module:SetBackpackTemporaryShown(nil)
        local ok, reason = module:OpenBackpackOptionSettings()
        if ok == false and reason then module:Notify(reason) end
        Widget:Refresh()
        return
    end
    if Widget:IsInCombat() then
        module:Notify(COMBAT_MESSAGE)
        self:SetChecked(module:IsBlizzardBackpackBarShown() == true)
        return
    end
    module:SetBackpackTemporaryShown(not module:IsBlizzardBackpackBarShown())
end

local function CreateWidget(host)
    local button = _G.CreateFrame("CheckButton", "RurutiaSuiteBagWindowOption", host, "OptionsBaseCheckButtonTemplate")
    button:SetSize(BOX_SIZE, BOX_SIZE)
    button:SetHitRectInsets(0, -64, 0, 0)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:Hide()

    button._rsRegisterCombatEvents = function(self)
        self:RegisterEvent("PLAYER_REGEN_DISABLED")
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
    end

    local titleContainer = host.TitleContainer
    if titleContainer and titleContainer.SetPoint then
        button:SetPoint("LEFT", titleContainer, "LEFT", 20, 0)
    else
        button:SetPoint("TOPLEFT", host, "TOPLEFT", 55, -1)
    end
    local hostLevel = titleContainer and titleContainer.GetFrameLevel
        and titleContainer:GetFrameLevel() or host:GetFrameLevel()
    if button.SetFrameLevel then button:SetFrameLevel((hostLevel or 1) + 2) end

    button.label = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    button.label:SetPoint("LEFT", button, "RIGHT", 1, 0)
    button.label:SetText(CAPTION)
    button.label:SetTextColor(COLOR_TEXT[1], COLOR_TEXT[2], COLOR_TEXT[3], COLOR_TEXT[4])

    button:SetScript("OnEnter", OnEnter)
    button:SetScript("OnLeave", OnLeave)
    button:SetScript("OnClick", OnClick)
    button:_rsRegisterCombatEvents()
    button:SetScript("OnEvent", function() Widget:Refresh() end)
    return button
end

local function HideSortButton(button)
    button:Hide()
    Widget:LayoutTitle(false)
    local tooltip = _G.GameTooltip
    if tooltip and tooltip:IsOwned(button) then tooltip:Hide() end
end

local function CreateSortButton(module, host)
    -- One reused child, driven by the existing combat refresh; no extra events/timers.
    -- PortraitFrame puts its border/title hundreds of levels above the bag body.
    -- Inherit the title layer so the button stays above that border when raised.
    local parent = host.TitleContainer or host
    local button = module:CreateFrame("Button", "RurutiaSuiteBagSortButton", parent, nil, HideSortButton)
    button:SetSize(64, 22)
    button:SetPoint("TOPRIGHT", host, "TOPRIGHT", -36, -1)
    button:SetFrameLevel((parent:GetFrameLevel() or 1) + 2)
    button:RegisterForClicks("LeftButtonUp")
    button.label = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    button.label:SetPoint("CENTER", button, "CENTER", 0, 0)
    button.label:SetText("整理背包")
    button:SetScript("OnClick", function()
        if not module.runtimeActive or not IsSupported() then return end
        if Widget:IsInCombat() then
            module:Notify("战斗中无法整理背包。")
            return
        end
        local container = _G.C_Container
        if container and type(container.SortBags) == "function" then
            container.SortBags()
        else
            module:Notify("当前客户端的原生背包整理不可用。")
        end
    end)
    button:SetScript("OnEnter", function(self)
        local tooltip = _G.GameTooltip
        if not tooltip then return end
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
        tooltip:SetText("整理背包", 1, 0.82, 0)
        tooltip:AddLine("按游戏当前整理规则与方向整理背包。", 1, 1, 1, true)
        if Widget:IsInCombat() then tooltip:AddLine("战斗中无法整理。", 1, 0.4, 0.4, true) end
        tooltip:Show()
    end)
    button:SetScript("OnLeave", function(self)
        local tooltip = _G.GameTooltip
        if tooltip and tooltip:IsOwned(self) then tooltip:Hide() end
    end)
    return button
end

function Widget:Ensure(module)
    if not IsSupported() then return false end
    if self.button then return true end
    module = module or GetModule()
    if not (module and module.runtimeActive) then return false end
    local host = _G[HOST_FRAME]
    if not host then return false end
    self.button = CreateWidget(host)
    self.sortButton = CreateSortButton(module, host)
    return self:Refresh()
end

function Widget:Attach(module)
    self:Ensure(module)
    if self.sortButton then
        (module or GetModule()):OwnFrame(self.sortButton, HideSortButton, "RurutiaSuiteBagSortButton")
    end
    local button = self.button
    if button and button._rsRegisterCombatEvents then
        button:_rsRegisterCombatEvents()
    end
    return self:Refresh()
end

function Widget:Detach()
    local button = self.button
    if not button then return false end
    if button.UnregisterEvent then
        button:UnregisterEvent("PLAYER_REGEN_DISABLED")
        button:UnregisterEvent("PLAYER_REGEN_ENABLED")
    end
    button.hovered = false
    if button.Hide then button:Hide() end
    if self.sortButton then HideSortButton(self.sortButton) end
    local tooltip = _G.GameTooltip
    if tooltip and tooltip:IsOwned(button) then tooltip:Hide() end
    return true
end
