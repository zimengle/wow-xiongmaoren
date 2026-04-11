-- TabLib.lua
-- 通用下划线高亮 Tab 组件库
-- 用法：
--   local tab = MHTabLib.CreateTab(parent, "标签文字", width, height)
--   MHTabLib.SetTabSelected(tab, true/false)

local _, ns = ...
ns.MHTabLib = ns.MHTabLib or {}
local MHTabLib = ns.MHTabLib

-- 颜色常量
local COLOR_SELECTED_BG    = { 1,    0.85, 0.1,  0.08 }
local COLOR_SELECTED_TEXT  = { 1,    0.88, 0.1,  1    }
local COLOR_SELECTED_LINE  = { 1,    0.82, 0.1,  1    }
local COLOR_NORMAL_BG      = { 0.08, 0.08, 0.10, 0.0  }
local COLOR_NORMAL_TEXT    = { 0.55, 0.55, 0.58, 1    }
local COLOR_NORMAL_LINE    = { 1,    0.82, 0.1,  0    }  -- alpha=0 即隐藏

--- 创建一个样式化 Tab 按钮
-- @param parent   父 Frame
-- @param labelText 标签文字
-- @param width    宽度（默认 120）
-- @param height   高度（默认 30）
-- @return tab Button 对象，附带 _label / _underline / _bg 字段
function MHTabLib.CreateTab(parent, labelText, width, height)
    width  = width  or 120
    height = height or 30

    local tab = CreateFrame("Button", nil, parent)
    tab:SetSize(width, height)

    -- 背景色层（选中时微金，默认透明）
    local bg = tab:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(unpack(COLOR_NORMAL_BG))
    tab._bg = bg

    -- 底部金色指示线
    local underline = tab:CreateTexture(nil, "BORDER")
    underline:SetHeight(2)
    underline:SetPoint("BOTTOMLEFT",  4, 1)
    underline:SetPoint("BOTTOMRIGHT", -4, 1)
    underline:SetColorTexture(unpack(COLOR_NORMAL_LINE))
    tab._underline = underline

    -- Hover 高亮层
    local hl = tab:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetColorTexture(1, 1, 1, 0.06)

    -- 文字标签（居中）
    local label = tab:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("CENTER", 0, 1)
    label:SetText(labelText)
    label:SetTextColor(unpack(COLOR_NORMAL_TEXT))
    tab._label = label

    return tab
end

--- 切换 Tab 选中 / 未选中外观
-- @param tab        MHTabLib.CreateTab 返回的对象
-- @param isSelected boolean
function MHTabLib.SetTabSelected(tab, isSelected)
    if isSelected then
        tab._bg:SetColorTexture(unpack(COLOR_SELECTED_BG))
        tab._label:SetTextColor(unpack(COLOR_SELECTED_TEXT))
        tab._label:SetFontObject("GameFontHighlight")
        tab._underline:SetColorTexture(unpack(COLOR_SELECTED_LINE))
    else
        tab._bg:SetColorTexture(unpack(COLOR_NORMAL_BG))
        tab._label:SetTextColor(unpack(COLOR_NORMAL_TEXT))
        tab._label:SetFontObject("GameFontNormal")
        tab._underline:SetColorTexture(unpack(COLOR_NORMAL_LINE))
    end
end
