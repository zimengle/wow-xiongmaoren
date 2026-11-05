local _, ns = ...

-- Retail 12.1 会在每次 GameMenu OnShow 中重建内部按钮池，随后才触发
-- GameMenuFrame.Shown。RSS 只在菜单外侧附着一个普通子按钮：不调用
-- GameMenuFrame:AddButton，不修改菜单高度、内部按钮锚点或安装 Hook。
local GameMenu = {}
ns.GameMenuService = GameMenu

local EVENT = "GameMenuFrame.Shown"
local BUTTON_NAME = "RS_RSS_GameMenuButton"
local BORDER_SIZE = 1
local BUTTON_FONT_SIZE = 18
local BUTTON_COLORS = {
    normal = { 0.12, 0.12, 0.12, 0.8 },
    hover = { 0.18, 0.18, 0.18, 0.9 },
    pushed = { 0.10, 0.10, 0.10, 0.9 },
    border = { 0, 0, 0, 1 },
}

local function ApplyColor(region, method, color)
    if region and type(region[method]) == "function" and type(color) == "table" then
        region[method](region, color[1] or 0, color[2] or 0, color[3] or 0, color[4] or 1)
    end
end

local function HideNativeButtonTextures(button)
    if button._rssNativeTexturesHidden then return end
    button._rssNativeTexturesHidden = true
    local _, getter
    for _, getter in ipairs({ "GetNormalTexture", "GetPushedTexture", "GetHighlightTexture", "GetDisabledTexture" }) do
        if type(button[getter]) == "function" then
            local texture = button[getter](button)
            if texture and texture.SetTexture then texture:SetTexture(nil) end
            if texture and texture.Hide then texture:Hide() end
        end
    end
    if type(button.GetRegions) == "function" then
        local regions = { button:GetRegions() }
        local _, region
        for _, region in ipairs(regions) do
            if region and type(region.GetObjectType) == "function" and region:GetObjectType() == "Texture" then
                if region.SetTexture then region:SetTexture(nil) end
                if region.Hide then region:Hide() end
            end
        end
    end
end

local function CreateColorTexture(button, layer)
    if type(button.CreateTexture) ~= "function" then return nil end
    local texture = button:CreateTexture(nil, layer)
    if texture and texture.SetColorTexture then texture:SetColorTexture(1, 1, 1, 1) end
    return texture
end

local function SetBorderThickness(texture, dimension)
    if not texture then return end
    local pixelUtil = _G.PixelUtil
    local pixelSetter = pixelUtil and pixelUtil[dimension == "height" and "SetHeight" or "SetWidth"]
    if type(pixelSetter) == "function" then
        pixelSetter(texture, BORDER_SIZE, BORDER_SIZE)
        return
    end
    local setter = texture[dimension == "height" and "SetHeight" or "SetWidth"]
    if type(setter) == "function" then setter(texture, BORDER_SIZE) end
end

local function GetClassBorderColor()
    local class
    if type(_G.UnitClass) == "function" then
        local _
        _, class = _G.UnitClass("player")
    end
    local colors = _G.RAID_CLASS_COLORS
    local color = type(colors) == "table" and class and colors[class] or nil
    if color then return { color.r or 1, color.g or 1, color.b or 1, 1 } end
    return { 1, 1, 1, 1 }
end

local function EnsureNativeAppearance(target)
    local button = target.frame
    if not button then return false end
    HideNativeButtonTextures(button)
    if target.background then return true end

    target.background = CreateColorTexture(button, "BACKGROUND")
    if not target.background then return false end
    if target.background.SetAllPoints then target.background:SetAllPoints(button) end

    target.borders = {}
    local top = CreateColorTexture(button, "BORDER")
    local bottom = CreateColorTexture(button, "BORDER")
    local left = CreateColorTexture(button, "BORDER")
    local right = CreateColorTexture(button, "BORDER")
    target.borders[1], target.borders[2], target.borders[3], target.borders[4] = top, bottom, left, right
    if top and top.SetPoint then
        top:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
        top:SetPoint("TOPRIGHT", button, "TOPRIGHT", 0, 0)
        SetBorderThickness(top, "height")
    end
    if bottom and bottom.SetPoint then
        bottom:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
        bottom:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
        SetBorderThickness(bottom, "height")
    end
    if left and left.SetPoint then
        left:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
        left:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
        SetBorderThickness(left, "width")
    end
    if right and right.SetPoint then
        right:SetPoint("TOPRIGHT", button, "TOPRIGHT", 0, 0)
        right:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
        SetBorderThickness(right, "width")
    end
    return true
end

local function RefreshNativeAppearance(target)
    local theme, button = target.theme, target.frame
    if not theme or not button or not EnsureNativeAppearance(target) then return false end
    local enabled = type(button.IsEnabled) ~= "function" or button:IsEnabled()
    local backgroundColor = target.pressed and BUTTON_COLORS.pushed
        or (enabled and target.hovered) and BUTTON_COLORS.hover
        or BUTTON_COLORS.normal
    ApplyColor(target.background, "SetVertexColor", backgroundColor)
    local borderColor = enabled and target.hovered and GetClassBorderColor() or BUTTON_COLORS.border
    local _, border
    for _, border in ipairs(target.borders or {}) do
        ApplyColor(border, "SetVertexColor", borderColor)
    end
    local label = type(button.GetFontString) == "function" and button:GetFontString() or button.Text
    if label then
        local path, size, flags = theme:ResolveFont("body")
        if label.SetFont and path then label:SetFont(path, BUTTON_FONT_SIZE, flags) end
        ApplyColor(label, "SetTextColor", theme:Get(enabled and "color.text.normal" or "color.text.muted"))
    end
    return true
end

local function HookNativeAppearance(target)
    local button = target.frame
    if target.hooked or not button or type(button.HookScript) ~= "function" then return end
    target.hooked = true
    button:HookScript("OnEnter", function() target.hovered = true RefreshNativeAppearance(target) end)
    button:HookScript("OnLeave", function() target.hovered = nil target.pressed = nil RefreshNativeAppearance(target) end)
    button:HookScript("OnMouseDown", function() target.pressed = true RefreshNativeAppearance(target) end)
    button:HookScript("OnMouseUp", function() target.pressed = nil RefreshNativeAppearance(target) end)
    button:HookScript("OnEnable", function() RefreshNativeAppearance(target) end)
    button:HookScript("OnDisable", function() RefreshNativeAppearance(target) end)
end

local function GetSkinTarget(button)
    local target = button._rssNativeSkinTarget
    if target then return target end
    target = { frame = button }
    function target:ApplyNativeTheme(theme, kind)
        if kind ~= "external-button" or type(theme) ~= "table"
            or type(theme.Get) ~= "function" or type(theme.ResolveFont) ~= "function" then
            return false
        end
        self.theme = theme
        HookNativeAppearance(self)
        return RefreshNativeAppearance(self)
    end
    button._rssNativeSkinTarget = target
    return target
end

local function Enabled()
    local settings = ns.DB and ns.DB.global and ns.DB.global.gameMenu
    return settings and settings.enabled == true
end

local function OpenSetup()
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then return end
    if _G.HideUIPanel and _G.GameMenuFrame then _G.HideUIPanel(_G.GameMenuFrame) end
    if ns.Host then ns.Host:OpenPage("setup") end
end

function GameMenu:EnsureButton()
    local frame = _G.GameMenuFrame
    if type(frame) ~= "table" or type(_G.CreateFrame) ~= "function" then
        return nil, "game-menu-unavailable"
    end
    local button = self.button or _G[BUTTON_NAME]
    if not button then
        local ok, created = pcall(_G.CreateFrame, "Button", BUTTON_NAME, frame,
            "GameMenuButtonTemplate")
        if not ok or not created then return nil, tostring(created or "button-create-failed") end
        button = created
    end
    self.button = button
    if button.SetParent then button:SetParent(frame) end
    if button.SetText then button:SetText("露露的工具箱") end
    if button.SetScript then button:SetScript("OnClick", OpenSetup) end
    if button.SetSize then button:SetSize(190, 35) end
    if button.ClearAllPoints and button.SetPoint then
        button:ClearAllPoints()
        button:SetPoint("BOTTOM", frame, "TOP", 0, 8)
    end
    if button.SetFrameLevel and frame.GetFrameLevel then
        button:SetFrameLevel(frame:GetFrameLevel() + 2)
    end
    if ns.Host and type(ns.Host.ApplySkin) == "function" then
        ns.Host:ApplySkin("external-button", GetSkinTarget(button), {
            surface = "game-menu",
            providerName = "Native",
        })
    end
    return button
end


function GameMenu:Show()
    if not self.enabled or not Enabled() then return self:Hide() end
    local button, reason = self:EnsureButton()
    if not button then return false, reason end
    if button.Show then button:Show() end
    return true
end

function GameMenu:Hide()
    if self.button and self.button.Hide then self.button:Hide() end
    return true
end

function GameMenu:Refresh()
    if not Enabled() then return self:Hide() end
    local frame = _G.GameMenuFrame
    if frame and frame.IsShown and frame:IsShown() then return self:Show() end
    return true
end

function GameMenu:Enable()
    if self.enabled then return true end
    local registry = _G.EventRegistry
    if type(registry) ~= "table" or type(registry.RegisterCallback) ~= "function"
        or type(registry.UnregisterCallback) ~= "function" then
        return false, "GameMenuFrame event registry is unavailable"
    end
    self.enabled = true
    local ok, reason = pcall(registry.RegisterCallback, registry, EVENT,
        function() self:Show() end, self)
    if not ok then
        self.enabled = false
        return false, tostring(reason)
    end
    self.registered = true
    return true
end

function GameMenu:Disable()
    local registry = _G.EventRegistry
    if self.registered and type(registry) == "table"
        and type(registry.UnregisterCallback) == "function" then
        pcall(registry.UnregisterCallback, registry, EVENT, self)
    end
    self.registered, self.enabled = nil, false
    self:Hide()
    if self.button and self.button.SetScript then self.button:SetScript("OnClick", nil) end
    return true
end

return GameMenu
