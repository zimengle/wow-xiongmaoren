local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "retail") then return end
if not ns.Build.SupportsIntegration("ndui") then return end

-- Resolve the native menu action only on an explicit click. No hook, timer or cache.
function ns.OpenRetailNDuiSettings(globals, notify)
    globals = globals or _G
    notify = notify or ns.Print
    local function Fail(message)
        if type(notify) == "function" then notify(message) end
        return false
    end
    if type(globals.InCombatLockdown) == "function" and globals.InCombatLockdown() then
        return Fail("战斗中无法打开 NDui 设置，请脱战后重试。")
    end
    local loaded = globals.C_AddOns and globals.C_AddOns.IsAddOnLoaded or globals.IsAddOnLoaded
    if type(loaded) ~= "function" or not loaded("NDui") then
        return Fail("NDui 尚未加载，请先启用插件并重载。")
    end
    local frame = globals.NDuiGUI
    if frame and type(frame.Show) == "function" then
        if pcall(frame.Show, frame) then return true end
        return Fail("NDui 设置打开失败，请检查插件报错。")
    end
    local menu = globals.GameMenuFrame
    if not (menu and type(menu.InitButtons) == "function") then
        return Fail("未找到 NDui 设置入口，请从 ESC 菜单打开 NDui 设置。")
    end
    local ok, opened = pcall(function()
        menu:InitButtons()
        local pool = menu.buttonPool
        if not (pool and type(pool.EnumerateActive) == "function") then return false end
        for button in pool:EnumerateActive() do
            local label = type(button.GetText) == "function" and button:GetText()
            if type(label) == "string" then
                label = label:gsub("|T.-|t", ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
                label = label:match("^%s*(.-)%s*$")
                if label == "NDui" then
                    if type(button.IsEnabled) == "function" and not button:IsEnabled() then return false end
                    local callback = type(button.GetScript) == "function" and button:GetScript("OnClick")
                    if type(callback) ~= "function" then return false end
                    callback(button, "LeftButton")
                    local created = globals.NDuiGUI
                    return created ~= nil and (type(created.IsShown) ~= "function" or created:IsShown())
                end
            end
        end
        return false
    end)
    if ok and opened then return true end
    return Fail("未能打开 NDui 设置，请从 ESC 菜单点击 NDui 并检查插件报错。")
end
