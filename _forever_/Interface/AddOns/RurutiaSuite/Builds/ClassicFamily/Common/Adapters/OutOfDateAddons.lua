-- 文件职责：隔离 Classic “加载过期插件”开关与重载提示。
-- 负责：通过 Compat 执行一次性修正，不持有事件、计时器或运行时资源。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Adapter = {}
local POPUP_KEY = "RURUTIASUITE_OUTDATED_ADDONS_RELOAD"

local function ColorText(text, color)
    return (color or "|cffffffff") .. tostring(text) .. "|r"
end

local function GetHighlightColor()
    local class
    if type(_G.UnitClass) == "function" then _, class = _G.UnitClass("player") end
    if class == "PRIEST" then return "|cff00ff00" end
    return type(ns.GetThemeColorCode) == "function"
        and ns:GetThemeColorCode(true) or "|cffffd700"
end

function Adapter:AllowOutOfDateAddons()
    local compat = ns.Compat
    if not (compat and type(compat.IsAddonVersionCheckEnabled) == "function"
        and type(compat.SetAddonVersionCheck) == "function") then
        return false
    end

    local readOK, enabled = pcall(compat.IsAddonVersionCheckEnabled)
    if not readOK or enabled ~= true then return false end
    local writeOK, result = pcall(compat.SetAddonVersionCheck, false)
    return writeOK and result ~= false
end

function Adapter:RegisterReloadPopup()
    local dialogs = _G.StaticPopupDialogs
    if type(dialogs) ~= "table" then return false end
    if dialogs[POPUP_KEY] then return true end

    local titleColor = type(ns.GetThemeColorCode) == "function"
        and ns:GetThemeColorCode(true) or "|cffffd700"
    local highlightColor = GetHighlightColor()
    dialogs[POPUP_KEY] = {
        text = ColorText("露露的工具箱", titleColor)
            .. "\n\n检测到你未开启「" .. ColorText("加载过期插件", highlightColor) .. "」选项"
            .. "\n这会导致大量插件不工作"
            .. "\nRS 已自动修复此问题"
            .. "\n请" .. ColorText("点击重载", titleColor) .. "按钮后生效",
        button1 = "重载界面",
        button2 = "稍后",
        OnAccept = function()
            if type(_G.ReloadUI) == "function" then _G.ReloadUI() end
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
    return true
end

function Adapter:ShowReloadPrompt()
    self:RegisterReloadPopup()
    if type(_G.StaticPopup_Show) == "function" then
        local popup = _G.StaticPopup_Show(POPUP_KEY)
        if popup and type(popup.ClearAllPoints) == "function"
            and type(popup.SetPoint) == "function" then
            popup:ClearAllPoints()
            popup:SetPoint("CENTER", _G.UIParent, "CENTER", 0, 50)
        end
        return popup ~= nil
    end
    if type(ns.Print) == "function" then
        ns.Print("已打开「加载过期插件」。如果本次登录前有插件被拦截，请重载界面。")
    end
    return true
end

ns.OutOfDateAddonsAdapter = Adapter
