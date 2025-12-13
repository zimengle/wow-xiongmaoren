-- ========================================
-- Core/UILib.lua
-- RurutiaSuite UI 组件库（学习 Pig 插件）
-- ========================================
-- 职责：
-- 1. 提供统一的黑色半透明扁平风格 UI 组件
-- 2. 封装 CreateFrame、CreateButton 等常用方法
-- 3. 集中管理所有 UI 样式配置
-- 4. 不依赖 AceGUI，使用原生 CreateFrame
-- ========================================

local addonName, ns = ...
local UILib = {}
ns.UILib = UILib

-- 引用全局配置 (确保 Config.lua 已加载)
local CFG = _G.RURUTIA_SUITE_CONFIG

-- ========================================
-- 全局配置
-- ========================================

-- Backdrop 材质配置
UILib.bgFile = "Interface\\Tooltips\\UI-Tooltip-Background"
UILib.edgeFile = "Interface\\Tooltips\\UI-Tooltip-Background"
UILib.Backdropinfo = {
    bgFile = UILib.bgFile,
    edgeFile = UILib.edgeFile,
    tile = true, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
}

-- 框体配置
UILib.FrameBGColor = {0, 0, 0, 0.8}
UILib.FrameBorderColor = {0, 0, 0, 0.3}

-- 按钮配置
UILib.ButtonBGColor = {0.1, 0.1, 0.1, 0.8}
UILib.ButtonBorderColor = {0, 0, 0, 1}
UILib.ButtonBorderColor_OnEnter = {0, 0.8, 1, 0.9}
UILib.ButtonBGColor_OnEnter = {0.2, 0.2, 0.2, 0.9}

-- 文字配置
UILib.TextColor = {1, 0.843, 0, 1}
UILib.TextColor_Disabled = {0.5, 0.5, 0.5, 1}

-- [修改] 字体配置：从全局 Config 读取
UILib.FontPath = CFG.font.path or "Fonts\\ARKai_T.ttf" -- 如果 Config 未加载则保底
UILib.FontSize = 14

-- ========================================
-- 辅助函数：获取职业色
-- ========================================
local function GetClassColor()
    local _, class = UnitClass("player")
    local classColor = RAID_CLASS_COLORS and RAID_CLASS_COLORS[class]
    if classColor then
        return string.format("|cFF%02x%02x%02x", classColor.r * 255, classColor.g * 255, classColor.b * 255)
    end
    return "|cFFFFD700"
end
UILib.GetClassColor = GetClassColor

-- ========================================
-- 核心函数：创建框体
-- ========================================
function UILib:CreateFrame(parent, point, size, name)
    local frame = CreateFrame("Frame", name, parent, "BackdropTemplate")
    
    if size then frame:SetSize(size[1], size[2]) end
    
    if point then
        if type(point[1]) == "table" then
            for _, p in ipairs(point) do
                frame:SetPoint(p[1], p[2] or parent, p[3] or p[1], p[4] or 0, p[5] or 0)
            end
        else
            frame:SetPoint(point[1], point[2] or parent, point[3] or point[1], point[4] or 0, point[5] or 0)
        end
    end
    
    frame:SetBackdrop(UILib.Backdropinfo)
    frame:SetBackdropColor(unpack(UILib.FrameBGColor))
    frame:SetBackdropBorderColor(unpack(UILib.FrameBorderColor))
    
    function frame:SetBGAlpha(alpha)
        self:SetBackdropColor(UILib.FrameBGColor[1], UILib.FrameBGColor[2], UILib.FrameBGColor[3], alpha)
    end
    
    function frame:SetBorderAlpha(alpha)
        self:SetBackdropBorderColor(UILib.FrameBorderColor[1], UILib.FrameBorderColor[2], UILib.FrameBorderColor[3], alpha)
    end
    
    return frame
end

-- ========================================
-- 核心函数：创建按钮
-- ========================================
function UILib:CreateButton(parent, point, size, text, name)
    local button = CreateFrame("Button", name, parent, "BackdropTemplate")
    
    if size then button:SetSize(size[1], size[2]) end
    
    if point then
        if type(point[1]) == "table" then
            for _, p in ipairs(point) do
                button:SetPoint(p[1], p[2] or parent, p[3] or p[1], p[4] or 0, p[5] or 0)
            end
        else
            button:SetPoint(point[1], point[2] or parent, point[3] or point[1], point[4] or 0, point[5] or 0)
        end
    end
    
    button:SetBackdrop(UILib.Backdropinfo)
    button:SetBackdropColor(unpack(UILib.ButtonBGColor))
    button:SetBackdropBorderColor(unpack(UILib.ButtonBorderColor))
    
    button.Text = button:CreateFontString(nil, "OVERLAY")
    button.Text:SetPoint("CENTER", 0, 0)
    button.Text:SetFont(UILib.FontPath, UILib.FontSize, "OUTLINE")
    button.Text:SetTextColor(unpack(UILib.TextColor))
    button.Text:SetText(text or "")
    
    button:SetScript("OnEnter", function(self)
        if self:IsEnabled() then
            self:SetBackdropColor(unpack(UILib.ButtonBGColor_OnEnter))
            self:SetBackdropBorderColor(unpack(UILib.ButtonBorderColor_OnEnter))
        end
    end)
    
    button:SetScript("OnLeave", function(self)
        if self:IsEnabled() then
            self:SetBackdropColor(unpack(UILib.ButtonBGColor))
            self:SetBackdropBorderColor(unpack(UILib.ButtonBorderColor))
        end
    end)
    
    button:SetScript("OnMouseDown", function(self)
        if self:IsEnabled() then
            local point, relativeTo, relativePoint, offsetX, offsetY = self.Text:GetPoint()
            self.Text:SetPoint(point, relativeTo, relativePoint, offsetX + 1.5, offsetY - 1.5)
        end
    end)
    
    button:SetScript("OnMouseUp", function(self)
        local point, relativeTo, relativePoint, offsetX, offsetY = self.Text:GetPoint()
        self.Text:SetPoint(point, relativeTo, relativePoint, offsetX - 1.5, offsetY + 1.5)
    end)
    
    function button:SetText(newText) self.Text:SetText(newText) end
    function button:GetText() return self.Text:GetText() end
    
    button._originalEnable = button.Enable
    function button:Enable()
        self:_originalEnable()
        self.Text:SetTextColor(unpack(UILib.TextColor))
    end
    
    button._originalDisable = button.Disable
    function button:Disable()
        self:_originalDisable()
        self.Text:SetTextColor(unpack(UILib.TextColor_Disabled))
    end
    
    return button
end

-- ========================================
-- 核心函数：创建字体字符串
-- ========================================
function UILib:CreateFontString(parent, point, text, fontSize, outline)
    local fontString = parent:CreateFontString(nil, "OVERLAY")
    
    if point then
        if type(point[1]) == "table" then
            for _, p in ipairs(point) do
                fontString:SetPoint(p[1], p[2] or parent, p[3] or p[1], p[4] or 0, p[5] or 0)
            end
        else
            fontString:SetPoint(point[1], point[2] or parent, point[3] or point[1], point[4] or 0, point[5] or 0)
        end
    end
    
    local fontSize = fontSize or UILib.FontSize
    local outline = outline and "OUTLINE" or nil
    -- [修改] 确保使用全局配置的字体
    fontString:SetFont(UILib.FontPath, fontSize, outline)
    fontString:SetTextColor(unpack(UILib.TextColor))
    fontString:SetText(text or "")
    
    return fontString
end

-- 挂载
if ns.RS then ns.RS.UILib = UILib end