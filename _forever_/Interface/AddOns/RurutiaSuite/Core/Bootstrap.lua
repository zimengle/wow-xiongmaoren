-- 文件职责：启动宿主、保留配置来源、装配模块与扩展，并管理命令及退出保存。
local addonName, ns = ...

local Bootstrap = {}
ns.Bootstrap = Bootstrap

local function Print(message, ...)
    if select("#", ...) > 0 then
        message = string.format(message, ...)
    end
    local color = ns.GetThemeColorCode and ns:GetThemeColorCode() or "|cffff559a"
    print(color .. "[RS] 露露的工具箱|r " .. tostring(message))
end

ns.Print = Print
ns.Printf = Print

local function CommandInUse(command)
    command = string.lower(command)
    local key
    local value
    for key, value in pairs(_G) do
        if type(key) == "string" and string.match(key, "^SLASH_")
            and type(value) == "string" and string.lower(value) == command then
            return true
        end
    end
    return false
end

local function RegisterSlash(name, commands, callback)
    if type(_G.SlashCmdList) ~= "table" then
        return false
    end
    _G.SlashCmdList[name] = callback
    local count = 0
    local index
    for index = 1, #commands do
        local command = commands[index]
        if not CommandInUse(command) then
            count = count + 1
            _G["SLASH_" .. name .. count] = command
        end
    end
    return count > 0
end

local function NormalizeCommand(input)
    local value = tostring(input or "")
    value = string.match(value, "^%s*(.-)%s*$") or ""
    return string.lower(value)
end

local function PrintCommandHelp()
    local color = ns.GetThemeColorCode and ns:GetThemeColorCode(true) or "|cff00ff00"
    Print("命令列表")
    print("   " .. color .. "/rs|r        - 打开主界面")
    if type(ns.OpenGuide) == "function" then
        print("   " .. color .. "/rs guide|r  - 打开露露的小手册")
    end
    print("   " .. color .. "/rs help|r   - 显示命令列表")
    print("   " .. color .. "/rsm|r       - 解锁/锁定 RS 模块")
    print("   " .. color .. "/rsm all|r   - 解锁/锁定 RS 与外部插件")
    if ns.Build and ns.Build.GetCapability
        and ns.Build.GetCapability("autoMark", false) == true then
        print("   " .. color .. "/ram|r       - 标记坦克/治疗")
        print("   " .. color .. "/ramc|r      - 清除标记")
    end
end

function ns:OnChatCommand(input)
    local command = NormalizeCommand(input)
    if command == "" then
        return self.UISystem and self.UISystem:ToggleMain() or false
    end
    if command == "guide" or command == "faq" then
        if type(self.OpenGuide) == "function" then
            return self:OpenGuide()
        end
        Print("当前客户端没有可用的小手册。")
        return false, "guide-unavailable"
    end
    if command == "help" then
        PrintCommandHelp()
        return true
    end

    local system = self.UISystem
    if system and type(system.IsPageRegistered) == "function"
        and system:IsPageRegistered(command) then
        return system:OpenMain(command)
    end
    Print("未知命令：%s。输入 /rs help 查看命令列表。", command)
    return false, "unknown-command"
end

function Bootstrap:RegisterCommands()
    RegisterSlash("RURUTIASUITE", { "/rs" }, function(message)
        if ns.OnChatCommand then
            ns:OnChatCommand(message)
        elseif ns.UISystem then
            ns.UISystem:ToggleMain()
        end
    end)

    RegisterSlash("RURUTIASUITE_MOVE", { "/rsm" }, function(message)
        if ns.OnMoveCommand then
            ns:OnMoveCommand(message)
        end
    end)

    if type(_G.ReloadUI) == "function" then
        RegisterSlash("RURUTIASUITE_RELOAD", { "/rl", "/reload" }, function()
            _G.ReloadUI()
        end)
    end
end

function Bootstrap:OpenDatabase()
    -- 在日志模块写入新版版本号之前记录来源；RSS 以后才启用也可读取。
    local storage = _G.RurutiaSuiteDB
    local savedGlobal = type(storage) == "table" and rawget(storage, "global")
    local origin = type(savedGlobal) == "table" and rawget(savedGlobal, "setupOrigin") or nil
    if origin == nil and ns.Build.IsFamily("retail") then
        local profiles = type(storage) == "table" and rawget(storage, "profiles")
        local profile = type(profiles) == "table" and rawget(profiles, "Default")
        local setup = type(profile) == "table" and rawget(profile, "setup")
        local version = type(savedGlobal) == "table" and rawget(savedGlobal, "lastSeenVersion")
        local legacy = type(setup) == "table"
            or (type(version) == "string" and string.match(version, "^3%."))
        origin = legacy and "legacy-retail" or "current"
    end
    local defaults = ns.Defaults.Create(ns.Build.GetActive())
    local database, reason = ns.Database.Open("RurutiaSuiteDB", defaults, {
        defaultProfile = "Default",
    })
    if database == nil then
        return nil, reason
    end
    if origin ~= nil then database.global.setupOrigin = origin end

    -- 两个旧版本都强制使用 Default；保留该可观察行为。
    local selected, selectReason = database:SetProfile("Default")
    if not selected then
        return nil, selectReason
    end
    database.profile.minimap = database.profile.minimap or {}
    database.profile.minimap.hide = false
    ns.DB = database
    local function RefreshAssemblyProfile(_, _, profileName)
        ns.Assembly:RefreshProfile(profileName)
        if ns.Extensions then ns.Extensions:RefreshProfile(profileName) end
    end
    database:RegisterListener("OnProfileChanged", RefreshAssemblyProfile)
    database:RegisterListener("OnProfileCopied", RefreshAssemblyProfile)
    database:RegisterListener("OnProfileReset", RefreshAssemblyProfile)
    return database
end

function Bootstrap:Initialize()
    if self.initialized then
        return true
    end

    local database, reason = self:OpenDatabase()
    if database == nil then
        self.failedReason = reason
        return false, reason
    end

    if ns.UI and ns.UI.Initialize then
        ns.UISystem = ns.UI:Initialize({
            createFrame = _G.CreateFrame,
            mainParent = _G.UIParent,
            title = "露露的工具箱",
        })
        ns.ToggleMainFrame = function(_, pageId)
            return ns.UISystem:ToggleMain(pageId)
        end
        ns.OpenMainFrame = function(_, pageId)
            return ns.UISystem:OpenMain(pageId)
        end
    end
    if ns.Presentation then
        local presentation, presentationReason = ns.Presentation:Initialize({
            uiSystem = ns.UISystem,
        })
        if presentation == nil then
            self.failedReason = presentationReason
            return false, presentationReason
        end
    end
    if ns.OptionsPanel then
        local optionsReady, optionsReason = ns.OptionsPanel:Register()
        if not optionsReady then
            Print("系统设置入口未启用：%s", tostring(optionsReason))
        end
    end
    if ns.Launcher then
        local launcherReady, launcherReason = ns.Launcher:Initialize()
        if not launcherReady then
            Print("小地图入口未启用：%s", tostring(launcherReason))
        end
    end
    self:RegisterCommands()

    local activated, failures = ns.Assembly:Activate()
    if not activated then
        self.failedReason = failures
        return false, failures
    end
    if ns.Extensions then
        local extensionsReady, extensionFailures = ns.Extensions:Activate()
        if not extensionsReady then
            Print("部分外部扩展初始化失败：%s", tostring(extensionFailures))
        end
    end

    self.initialized = true
    Print("v%s 已载入。输入 /rs 进入设置，/rsm 解锁移动。", ns.version)
    return true
end

function Bootstrap:Shutdown()
    if ns.Async then
        ns.Async:Shutdown()
    end
    if ns.Extensions then ns.Extensions:Deactivate() end
    local deactivated, failures = ns.Assembly:Deactivate()
    if ns.DB then
        ns.Assembly:PrepareForSave()
        ns.DB:PrepareForSave()
        ns.DB:CompactStorage()
    end
    return deactivated, failures
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, loadedName)
    if event == "ADDON_LOADED" and loadedName == addonName then
        local ok, reason = Bootstrap:Initialize()
        if not ok then
            Print("初始化失败：%s", tostring(reason))
            return
        end
        self:UnregisterEvent("ADDON_LOADED")
        self:RegisterEvent("PLAYER_LOGOUT")
    elseif event == "PLAYER_LOGOUT" then
        Bootstrap:Shutdown()
    end
end)
Bootstrap.frame = frame
