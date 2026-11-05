local addonName, ns = ...

local Launcher = {}
ns.Launcher = Launcher

local function GetLibrary(name)
    local libStub = _G.LibStub
    if type(libStub) ~= "table" and type(libStub) ~= "function" then
        return nil
    end
    return libStub(name, true)
end

local function AddTooltipLines(tooltip)
    if tooltip == nil or type(tooltip.AddLine) ~= "function" then
        return
    end
    tooltip:AddLine("RurutiaSuite |cffff559a露露的工具箱|r")
    if ns.MinimapCollector and ns.MinimapCollector.active then
        if ns.MinimapCollector.blocker then
            tooltip:AddLine("|cffeda55f左键|r 打开主界面；|cffeda55f右键|r 打开收纳设置")
        else
            tooltip:AddLine("|cffeda55f左键|r 展开或收起图标；|cffeda55f右键|r 打开设置")
        end
        tooltip:AddLine(ns.MinimapCollector:GetStatusText(), 1, 1, 1, true)
    else
        tooltip:AddLine("|cffeda55f点击|r 打开主界面")
    end
end

-- Restyle only our native minimap entry once; collectors keep ownership of their skin.
local function StyleMinimapButton(library)
    local button = library.GetMinimapButton and library:GetMinimapButton(addonName)
    if not button or button:GetParent() ~= _G.Minimap or not button.icon then return end
    for _, region in ipairs({button:GetRegions()}) do
        if region.GetTexture then
            local texture = region:GetTexture()
            if texture == 136430 or texture == "Interface\\Minimap\\MiniMap-TrackingBorder" then
                region:SetAlpha(0)
            elseif texture == 136467 or texture == "Interface\\Minimap\\UI-Minimap-Background" then
                region:SetTexture("Interface\\AddOns\\RurutiaSuite\\Media\\LauncherCircleShadow")
                region:ClearAllPoints()
                region:SetSize(26, 26)
                region:SetPoint("CENTER", button, "CENTER", 0.75, -0.75)
            end
        end
    end
    button.icon:ClearAllPoints()
    button.icon:SetSize(24, 24)
    button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)
    -- One mask for this persistent launcher, created only during initialization.
    local mask = button:CreateMaskTexture()
    mask:SetTexture("Interface\\AddOns\\RurutiaSuite\\Media\\LauncherCircleMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
    mask:SetAllPoints(button.icon)
    button.icon:AddMaskTexture(mask)
    button.rsPortraitMask = mask
    local highlight = button:GetHighlightTexture()
    if highlight then
        highlight:ClearAllPoints()
        highlight:SetSize(24, 24)
        highlight:SetPoint("CENTER", button, "CENTER", 0, 0)
        highlight:SetAlpha(0.25)
    end
end

function Launcher:Initialize()
    if self.initialized then
        return true
    end
    if ns.DB == nil then
        return false, "database is not ready"
    end

    local icon = GetLibrary("LibDBIcon-1.0")
    local brokerLibrary = GetLibrary("LibDataBroker-1.1")
    if icon == nil or brokerLibrary == nil then
        return false, "launcher libraries are unavailable"
    end

    local broker = brokerLibrary:NewDataObject(addonName, {
        type = "launcher",
        text = "RurutiaSuite",
        icon = "Interface\\AddOns\\RurutiaSuite\\Media\\icon",
        OnClick = function(_, button)
            local collector = ns.MinimapCollector
            if collector and collector.active then
                if button == "LeftButton" and not collector.blocker then collector:Toggle(); return end
                if button == "RightButton" and ns.UISystem then
                    ns.UISystem:OpenMain("minimap-collector")
                    return
                end
            end
            if ns.UISystem then
                ns.UISystem:ToggleMain()
            end
        end,
        OnTooltipShow = AddTooltipLines,
    })

    local minimap = ns.DB.profile.minimap
    if type(icon.IsRegistered) == "function" and icon:IsRegistered(addonName) then
        icon:Refresh(addonName, minimap)
    else
        icon:Register(addonName, broker, minimap)
    end
    if type(icon.Show) == "function" then
        icon:Show(addonName)
    end

    StyleMinimapButton(icon)

    self.icon = icon
    self.broker = broker
    self.initialized = true
    return true
end

