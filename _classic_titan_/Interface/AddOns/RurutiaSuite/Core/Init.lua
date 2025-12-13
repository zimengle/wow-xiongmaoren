local addonName, ns = ...
local RS = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0")
ns.RS = RS
_G.RurutiaSuite = RS

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

-- UILib 会在 UILib.lua 加载时自动挂载到 RS.UILib

-- 简单的本地化支持
local L = setmetatable({}, { __index = function(t, k) return k end })

-- 默认配置
local defaults = {
    profile = {
        modules = {
            ['*'] = true,
        },
        minimap = {
            hide = false,
        },
    },
    global = {
        lastSeenVersion = "0.0.0",
    }
}

function RS:OnInitialize()
    -- 注册 Slash 命令
    self:RegisterChatCommand("rs", "OnChatCommand")

    -- 初始化数据库
    self.db = LibStub("AceDB-3.0"):New("RurutiaSuiteDB", defaults, true)
    
    -- 注册配置面板 (用于 BlizOptions)
    local options = {
        name = "RurutiaSuite",
        handler = RS,
        type = "group",
        args = {
            minimap = {
                type = "toggle",
                name = "显示小地图图标",
                get = function(info) return not RS.db.profile.minimap.hide end,
                set = function(info, value)
                    RS.db.profile.minimap.hide = not value
                    local icon = LibStub("LibDBIcon-1.0")
                    if value then
                        icon:Show(addonName)
                    else
                        icon:Hide(addonName)
                    end
                end,
                order = 1,
            },
            open_gui = {
                type = "execute",
                name = "打开主界面",
                func = function() RS:ShowMainFrame() end,
                order = 2,
            }
        },
    }
    
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options)
    self.optionsFrame = AceConfigDialog:AddToBlizOptions(addonName, "RurutiaSuite")
    
    -- 注册 LDB 图标
    local icon = LibStub("LibDBIcon-1.0")
    local broker = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
        type = "launcher",
        text = "RurutiaSuite",
        icon = "Interface\\AddOns\\RurutiaSuite\\Media\\icon",
        OnClick = function(_, button)
            RS:ShowMainFrame()
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("RurutiaSuite |cffff559a露露工具箱|r")
            tooltip:AddLine("|cffeda55f点击|r 打开主界面")
        end,
    })
    
    icon:Register(addonName, broker, self.db.profile.minimap)
    
    -- 获取版本号
    local version = GetAddOnMetadata(addonName, "Version") or "Unknown"
    self:Print(string.format("已加载 v%s", version))
end

function RS:OnEnable()
    -- 临时禁用自动弹出更新日志（调试中）
    -- 检查版本更新
    if self.CheckVersionUpdate then
        self:CheckVersionUpdate()
    end
end

function RS:OnChatCommand(input)
    if not input or input:trim() == "" then
        self:ShowMainFrame()
    elseif input:trim() == "config" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("rs", "RurutiaSuite", input)
    end
end

-- ========================================
-- 主界面构建 (完全使用 Config 配置)
-- ========================================

function RS:ShowMainFrame()
    if self.mainFrame and self.mainFrame:IsShown() then
        self.mainFrame:Hide()
        return
    end
    
    local cfg = RS_UI_SIZES.windowSize.mainFrame
    local mainCfg = RS_UI_SIZES.mainFrame
    
    -- 创建窗口
    local frame = AceGUI:Create("Frame")
    self.mainFrame = frame
    
    -- 获取职业色
    local _, class = UnitClass("player")
    local classColor = RAID_CLASS_COLORS and RAID_CLASS_COLORS[class]
    local colorCode = "|cFFFFD700" -- 默认金色
    if classColor then
        colorCode = string.format("|cFF%02x%02x%02x", classColor.r * 255, classColor.g * 255, classColor.b * 255)
    end
    
    frame:SetTitle(colorCode .. "露露的工具箱|r")
    frame:SetStatusText("")
    frame:SetLayout("Fill")
    frame:SetWidth(cfg.width)
    frame:SetHeight(cfg.height)
    
    -- 获取 frameObj（必须在使用前定义）
    local frameObj = frame.frame
    
    -- 锁定窗口尺寸（延迟执行，避免 taint）
    C_Timer.After(0.1, function()
        if frameObj.SetResizable then
            frameObj:SetResizable(false)
        end
    end)
    
    -- RSE 风格: 黑色半透明背景
    local bgAlpha = RS_UI_SIZES.background.opacity
    frameObj:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        tile = true, tileSize = 16, edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    frameObj:SetBackdropColor(0, 0, 0, bgAlpha)
    frameObj:SetBackdropBorderColor(0, 0, 0, bgAlpha)
    
    -- 应用皮肤系统（自动美化所有 AceGUI 控件）
    if RS.SkinFrame then
        RS:SkinFrame(frameObj)
    end
    
    -- 手动隐藏 AceGUI 容器的标题栏材质
    for _, region in pairs({frameObj:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            local texturePath = region:GetTexture()
            if texturePath and type(texturePath) == "string" then
                -- 隐藏所有 UI 材质
                if texturePath:find("UI%-") or texturePath:find("Dialog") then
                    region:Hide()
                    region:SetTexture(nil)
                end
            end
        end
    end
    
    -- 设置标题样式
    if frame.titletext then
        local titleCfg = RS_UI_SIZES.titleBar
        frame.titletext:SetFont("Fonts\\ARKai_T.ttf", titleCfg.fontSize, "OUTLINE")
        frame.titletext:ClearAllPoints()
        frame.titletext:SetPoint("TOP", frameObj, "TOP", 0, titleCfg.offsetY)
    end
    
    -- 创建副标题（版本号）
    local version = GetAddOnMetadata(addonName, "Version") or "Unknown"
    local subCfg = RS_UI_SIZES.subTitle
    local subtitle = frameObj:CreateFontString(nil, "OVERLAY")
    subtitle:SetFont("Fonts\\ARKai_T.ttf", subCfg.fontSize, "OUTLINE")
    subtitle:SetText("v" .. version)
    subtitle:SetTextColor(subCfg.color.r, subCfg.color.g, subCfg.color.b)
    subtitle:SetPoint("TOP", frameObj, "TOP", 0, subCfg.offsetY)
    
    -- 隐藏 AceGUI 自带的关闭按钮 (使用底部按钮代替)
    for _, child in pairs({frameObj:GetChildren()}) do
        if child:GetObjectType() == "Button" and child:GetText() == _G.CLOSE then
            child:Hide()
            break
        end
    end
    
    -- 隐藏状态栏
    if frame.statustext then
        frame.statustext:GetParent():Hide()
    end
    
    -- 创建主容器
    local mainContainer = AceGUI:Create("SimpleGroup")
    mainContainer:SetLayout("Fill")
    mainContainer:SetFullWidth(true)
    mainContainer:SetFullHeight(true)
    frame:AddChild(mainContainer)
    
    -- 创建 TabGroup 容器（预留底部按钮空间）
    local tabContainer = AceGUI:Create("SimpleGroup")
    tabContainer:SetLayout("Fill")
    tabContainer:SetFullWidth(true)
    tabContainer:SetFullHeight(true)
    mainContainer:AddChild(tabContainer)
    
    -- 应用 TabGroup 布局
    local function ApplyTabLayout()
        local tcFrame = tabContainer.frame
        tcFrame:ClearAllPoints()
        tcFrame:SetPoint("TOPLEFT", frameObj, "TOPLEFT", mainCfg.tabGroup.left, mainCfg.tabGroup.top)
        tcFrame:SetPoint("BOTTOMRIGHT", frameObj, "BOTTOMRIGHT", mainCfg.tabGroup.right, mainCfg.tabGroup.bottom)
    end
    ApplyTabLayout()
    
    -- 创建 TabGroup
    local tabGroup = AceGUI:Create("TabGroup")
    tabGroup:SetLayout("Fill")
    tabGroup:SetTabs({
        {value = "modules", text = "功能模块"},
        {value = "about", text = "关于插件"}
    })
    tabGroup:SetCallback("OnGroupSelected", function(container, event, group)
        container:ReleaseChildren()
        if group == "modules" then
            RS:DrawModulesTab(container)
        elseif group == "about" then
            RS:DrawAboutTab(container)
        end
    end)
    tabGroup:SelectTab("modules")
    
    -- 应用 RS 皮肤系统（美化 TabGroup）
    if RS.SkinTabGroup then
        RS:SkinTabGroup(tabGroup)
    end
    
    tabContainer:AddChild(tabGroup)
    
    -- 底部按钮（使用 AceGUI 按钮，完全复用 RSE 配置）
    local btnCfg = mainCfg.bottomButtons
    local btnContainer = AceGUI:Create("SimpleGroup")
    btnContainer:SetLayout("Table")
    btnContainer:SetFullWidth(true)
    btnContainer:SetHeight(RS_UI_SIZES.buttonHeight.dialog + 25) -- 按钮高度 + 上下边距
    btnContainer:SetUserData("table", {
        columns = {btnCfg.button1.width, btnCfg.button2.width},
        space = btnCfg.spacing,
        align = "LEFT"
    })
    frame:AddChild(btnContainer)
    
    -- 应用底部按钮布局
    local function ApplyBottomButtonLayout()
        local btnFrame = btnContainer.frame
        btnFrame:ClearAllPoints()
        btnFrame:SetPoint("BOTTOMLEFT", frameObj, "BOTTOMLEFT", btnCfg.container.left, btnCfg.container.bottom)
        btnFrame:SetPoint("BOTTOMRIGHT", frameObj, "BOTTOMRIGHT", btnCfg.container.right, btnCfg.container.bottom)
    end
    ApplyBottomButtonLayout()
    
    local btnChangelog = AceGUI:Create("Button")
    btnChangelog:SetText("更新日志")
    btnChangelog:SetWidth(btnCfg.button1.width)
    btnChangelog:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    btnChangelog:SetCallback("OnClick", function()
        RS:ShowChangelog()
    end)
    btnContainer:AddChild(btnChangelog)
    
    -- 应用皮肤
    if RS.SkinButton then
        RS:SkinButton(btnChangelog.frame)
    end
    
    local btnClose = AceGUI:Create("Button")
    btnClose:SetText("关闭")
    btnClose:SetWidth(btnCfg.button2.width)
    btnClose:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    btnClose:SetCallback("OnClick", function()
        frame:Hide()
    end)
    btnContainer:AddChild(btnClose)
    
    -- 应用皮肤
    if RS.SkinButton then
        RS:SkinButton(btnClose.frame)
    end
    
    -- 关闭回调
    frame:SetCallback("OnClose", function(widget)
        subtitle:Hide()
        AceGUI:Release(widget)
        self.mainFrame = nil
    end)
end

function RS:DrawModulesTab(container)
    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("List")  -- 改用 List 布局
    container:AddChild(scroll)
    
    -- 标题（改用 Label，字号更大）
    local header = AceGUI:Create("Label")
    header:SetText("\n|cffffd700已安装的模块|r")  -- 改为金色
    header:SetFontObject(GameFontNormalLarge)
    header:SetFullWidth(true)
    scroll:AddChild(header)
    
    -- 空行
    local spacer0 = AceGUI:Create("Label")
    spacer0:SetText("\n")  -- 约 10-15px 向下偏移
    spacer0:SetFullWidth(true)
    scroll:AddChild(spacer0)
    
    -- ========================================
    -- RSE 模块（不用 InlineGroup，直接排版）
    -- ========================================
    local rseGroup = AceGUI:Create("SimpleGroup")
    rseGroup:SetLayout("List")
    rseGroup:SetFullWidth(true)
    scroll:AddChild(rseGroup)
    
    -- 标题
    local rseTitle = AceGUI:Create("Label")
    rseTitle:SetText("|cffffd700[RSE] 数据导出模块|r")
    rseTitle:SetFontObject(GameFontNormalLarge)
    rseTitle:SetFullWidth(true)
    rseGroup:AddChild(rseTitle)
    
    -- 描述
    local rseDesc = AceGUI:Create("Label")
    rseDesc:SetText("批量导出法术和物品数据工具。\n提供强大的数据筛选和导出功能，支持多种格式。")
    rseDesc:SetFullWidth(true)
    rseGroup:AddChild(rseDesc)
    
    -- 按钮
    local btnLaunchRSE = AceGUI:Create("Button")
    btnLaunchRSE:SetText("打开 RSE 主界面")
    btnLaunchRSE:SetWidth(RS_UI_SIZES.buttonWidth.main)
    btnLaunchRSE:SetHeight(RS_UI_SIZES.buttonHeight.main)
    btnLaunchRSE:SetCallback("OnClick", function()
        local rse = LibStub("AceAddon-3.0"):GetAddon("RurutiaSuite_Exporter", true)
        if rse and rse.UI then
            rse.UI:ShowMainFrame()
        else
            RS:Print("RSE 模块未加载或未启用。")
        end
    end)
    rseGroup:AddChild(btnLaunchRSE)
    if RS.SkinButton then RS:SkinButton(btnLaunchRSE.frame) end
    
    -- 空行分隔
    local spacer1 = AceGUI:Create("Label")
    spacer1:SetText(" ")
    spacer1:SetFullWidth(true)
    scroll:AddChild(spacer1)
    
    -- ========================================
    -- 消耗品动作条模块（不用 InlineGroup）
    -- ========================================
    local consGroup = AceGUI:Create("SimpleGroup")
    consGroup:SetLayout("List")
    consGroup:SetFullWidth(true)
    scroll:AddChild(consGroup)
    
    -- 标题
    local consTitle = AceGUI:Create("Label")
    consTitle:SetText("|cffffd700[RS] 消耗品动作条|r")
    consTitle:SetFontObject(GameFontNormalLarge)
    consTitle:SetFullWidth(true)
    consGroup:AddChild(consTitle)
    
    -- 描述
    local consDesc = AceGUI:Create("Label")
    consDesc:SetText("自动扫描背包中的消耗品（药水、合剂、食物等）并显示在独立动作条上。\n输入：/rsm，解锁移动消耗品动作条。")
    consDesc:SetFullWidth(true)
    consGroup:AddChild(consDesc)
    
    -- 按钮
    local btnUnlock = AceGUI:Create("Button")
    btnUnlock:SetText("解锁额外动作条")
    btnUnlock:SetWidth(RS_UI_SIZES.buttonWidth.main)
    btnUnlock:SetHeight(RS_UI_SIZES.buttonHeight.main)
    btnUnlock:SetCallback("OnClick", function()
        local mod = RS:GetModule("Consumables", true)
        if mod then
            mod:ToggleAnchor()
        end
    end)
    consGroup:AddChild(btnUnlock)
    -- 应用皮肤
    if RS.SkinButton then RS:SkinButton(btnUnlock.frame) end
end

function RS:DrawAboutTab(container)
    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")
    container:AddChild(scroll)
    
    -- 不显示标题和版本号（主窗口已有）
    
    local desc = AceGUI:Create("Label")
    desc:SetText("RurutiaSuite 是一个模块化的魔兽世界插件集，旨在提供高效、便捷的游戏辅助工具。\n\n核心功能由 RurutiaSuite (RS) 提供，各功能模块（如 RSE、消耗品动作条）作为子模块运行。\n\n作者：露露緹婭@Bilibili\n反馈：Bilibili 私信或 KOOK 频道")
    desc:SetFullWidth(true)
    desc:SetFontObject(GameFontNormalLarge)
    scroll:AddChild(desc)
end
