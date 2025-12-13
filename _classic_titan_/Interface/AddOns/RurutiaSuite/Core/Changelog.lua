-- ========================================
-- Core/Changelog.lua
-- 更新日志弹窗模块
-- ========================================
-- 职责：
-- 1. 检测版本更新
-- 2. 显示更新日志弹窗
-- 3. 记录用户已查看的版本
-- ========================================

local addonName, ns = ...
local RS = ns.RS
local AceGUI = LibStub("AceGUI-3.0", true)
if not AceGUI then return end

-- 获取职业色
local function GetClassColor()
    local _, class = UnitClass("player")
    if class and RAID_CLASS_COLORS and RAID_CLASS_COLORS[class] then
        local color = RAID_CLASS_COLORS[class]
        return string.format("|cFF%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
    end
    -- 默认金色
    return "|cFFFFD700"
end

-- ========================================
-- 更新日志内容
-- ========================================

local CHANGELOG = {
    ["2.4.2"] = {
        title = "v2.4.2 - 动作条开关与层级优化",
        date = "2025-12-03",
        content = function()
            local classColor = GetClassColor()
            return string.format([[
%s[动作条开关控制]|r
• 新增 enabled 开关：可在 Config.lua 中独立控制 bar1（消耗品条）和 bar2（法术条）的启用/禁用
• 职业限制：bar2（法术条）现在仅限法师职业使用，非法师职业会收到友好提示
• 安全检查：所有相关函数添加了安全检查，避免访问不存在的动作条

%s[层级配置优化]|r
• 新增 frameStrata 配置：可设置框体层级（BACKGROUND/LOW/MEDIUM/HIGH/DIALOG）
• 新增 frameLevel 配置：可设置相对层级（数值越大越靠前）
• 默认层级提升：消耗品条和法术条默认层级提升至 HIGH + 100，避免被其他UI遮挡

%s[配置示例]|r
• 禁用消耗品条：consumableBar.enabled = false
• 移除职业限制：spellBar.classRestriction = nil
• 调整层级：frameStrata = "DIALOG", frameLevel = 200
            ]], classColor, classColor, classColor)
        end,
    },
    ["2.4.0"] = {
        title = "v2.4.0 - 动作条系统重构与传送门合集",
        date = "2025-12-01",
        content = function()
            local classColor = GetClassColor()
            return string.format([[
%s[动作条系统重构]|r
• 新增多动作条支持：独立的消耗品条和法术条
• 智能锚点系统：支持 TOPLEFT/TOPRIGHT/CENTER 等多种对齐方式
• 自适应布局：支持水平(HORIZONTAL)和垂直(VERTICAL)排列
• 分辨率适配：修复了改变游戏分辨率导致位置错乱的问题

%s[法术动作条：传送门合集]|r
• 新增法术动作条，默认收纳常用法术（火球术、奥术洪流等）
• 智能传送门按钮：整合所有主城传送门（达拉然、沙塔斯、部落/联盟主城）
• 阵营自适应：自动过滤敌对阵营的传送门
• 交互增强：左键传送门，右键传送，鼠标划过自动展开列表（Flyout）
• 状态监控：未学会的传送门自动变暗，Tooltip 显示"未学会"提示

%s[视觉体验升级]|r
• 扁平化风格：去除暴雪原生圆角边框，采用 1px 极细黑色描边
• 黄金比例切边：图标裁剪 8%% 边缘，去除白边且保持不变形
• 字体优化：自动检测并调用 MSBT 字体（如果存在），否则使用备选字体
• 修复了图标层级导致的变暗模糊问题

%s[技术细节]|r
• 移除了 ActionButtonTemplate，重写了按钮点击和高亮逻辑
• 优化了 GetContainerItemCooldown 调用，确保物品 CD 显示准确
• Config.lua 集中管理所有视觉参数（字体、间距、尺寸、锚点）
            ]], classColor, classColor, classColor, classColor)
        end,
    },
    ["2.3.1"] = {
        title = "v2.3.1 - 标题字号优化+更新Rules",
        date = "2025-11-23",
        content = function()
            return "标题改用Label+GameFontNormalLarge，禁用InlineGroup"
        end,
    },
}

-- ========================================
-- 检查版本更新
-- ========================================

function RS:CheckVersionUpdate()
    -- 获取当前版本号
    local currentVersion = GetAddOnMetadata(addonName, "Version") or "0.0.0"
    local lastSeenVersion = self.db.global.lastSeenVersion or "0.0.0"

    -- 比较完整版本号（包括修订号）
    -- 任何版本号变化都会弹窗
    if currentVersion ~= lastSeenVersion then
        -- 延迟3秒显示，避免登录时弹窗过多
        C_Timer.After(3, function()
            self:ShowChangelogWindow(currentVersion)
        end)
    end
end

-- ========================================
-- 显示更新日志弹窗
-- ========================================

-- 获取所有版本号列表（按版本号降序排列）
local function GetVersionList()
    local versions = {}
    for v in pairs(CHANGELOG) do
        table.insert(versions, v)
    end
    -- 按版本号降序排列
    table.sort(versions, function(a, b)
        local aMajor, aMinor, aPatch = a:match("^(%d+)%.(%d+)%.(%d+)$")
        local bMajor, bMinor, bPatch = b:match("^(%d+)%.(%d+)%.(%d+)$")
        
        -- 简单的版本号比较逻辑
        if not aMajor then return false end
        if not bMajor then return true end
        
        if aMajor ~= bMajor then
            return tonumber(aMajor) > tonumber(bMajor)
        elseif aMinor ~= bMinor then
            return tonumber(aMinor) > tonumber(bMinor)
        else
            return tonumber(aPatch) > tonumber(bPatch)
        end
    end)
    return versions
end

-- 获取上一个版本号
local function GetPreviousVersion(currentVersion)
    local versions = GetVersionList()
    for i, v in ipairs(versions) do
        if v == currentVersion and i < #versions then
            return versions[i + 1]
        end
    end
    return nil
end

-- 获取下一个版本号
local function GetNextVersion(currentVersion)
    local versions = GetVersionList()
    for i, v in ipairs(versions) do
        if v == currentVersion and i > 1 then
            return versions[i - 1]
        end
    end
    return nil
end

function RS:ShowChangelogWindow(version)
    local changelog = CHANGELOG[version]
    if not changelog then
        -- 如果没有该版本的更新日志，只记录版本号
        self:Print("没有找到版本 %s 的更新日志", version)
        self.db.global.lastSeenVersion = version
        return
    end

    -- 使用 Config 配置
    local cfg = RS_UI_SIZES.changelogWindow
    local titleCfg = cfg.title
    
    -- 获取标题颜色
    local titleColor
    if titleCfg.useClassColor then
        titleColor = GetClassColor()
    else
        local c = titleCfg.fallbackColor
        titleColor = string.format("|cFF%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255)
    end
    local title = string.format("%s%s%s|r", titleColor, version, titleCfg.suffix)

    -- 创建弹窗
    local frame = AceGUI:Create("Frame")
    frame:SetTitle(title)
    frame:SetStatusText("更新日期: " .. changelog.date)
    frame:SetLayout("Fill")
    
    -- 使用 Config 配置窗口尺寸
    local winCfg = RS_UI_SIZES.windowSize.changelogWindow
    frame:SetWidth(winCfg.width)
    frame:SetHeight(winCfg.height)

    frame:SetCallback("OnClose", function(widget)
        -- 只有当查看的是当前版本时，才更新 lastSeenVersion
        local currentVersion = GetAddOnMetadata(addonName, "Version") or "0.0.0"
        if version == currentVersion then
            self.db.global.lastSeenVersion = version
        end
        widget:Release()
    end)

    -- 获取内层原生Frame
    local frameObj = frame.frame

    -- 禁用窗口尺寸调整（延迟执行，避免 taint）
    if not winCfg.resizable then
        C_Timer.After(0.1, function()
            if frameObj.SetResizable then
                frameObj:SetResizable(false)
            end
            if frameObj.sizer_se then frameObj.sizer_se:Hide() end
            if frameObj.sizer_s then frameObj.sizer_s:Hide() end
            if frameObj.sizer_e then frameObj.sizer_e:Hide() end
        end)
    end

    -- 设置半透明黑色背景 (RSE 风格)
    local bgAlpha = RS_UI_SIZES.background.opacity
    frameObj:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        tile = true, tileSize = 16, edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    frameObj:SetBackdropColor(0, 0, 0, bgAlpha)
    frameObj:SetBackdropBorderColor(0, 0, 0, bgAlpha)
    
    -- 应用皮肤系统
    if RS.SkinFrame then
        RS:SkinFrame(frameObj)
    end
    
    -- 手动隐藏 AceGUI 容器的标题栏材质
    for _, region in pairs({frameObj:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            local texturePath = region:GetTexture()
            if texturePath and type(texturePath) == "string" then
                if texturePath:find("UI%-") or texturePath:find("Dialog") then
                    region:Hide()
                    region:SetTexture(nil)
                end
            end
        end
    end

    -- 设置标题样式
    if frame.titletext then
        local titleBarCfg = RS_UI_SIZES.titleBar
        frame.titletext:SetFont("Fonts\\ARKai_T.ttf", titleBarCfg.fontSize, "OUTLINE")
        frame.titletext:ClearAllPoints()
        frame.titletext:SetPoint("TOP", frameObj, "TOP", 0, titleBarCfg.offsetY)
    end

    -- 隐藏AceGUI自带的关闭按钮
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

    -- 创建滚动文本框容器
    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetLayout("Fill")
    scrollContainer:SetFullWidth(true)
    scrollContainer:SetFullHeight(true)
    mainContainer:AddChild(scrollContainer)

    -- 定义滚动框布局函数
    local scrollCfg = cfg.scrollBox
    local function ApplyScrollLayout()
        local scrollFrame = scrollContainer.frame
        scrollFrame:ClearAllPoints()
        scrollFrame:SetPoint("TOPLEFT", frameObj, "TOPLEFT", scrollCfg.left, scrollCfg.top)
        scrollFrame:SetPoint("BOTTOMRIGHT", frameObj, "BOTTOMRIGHT", scrollCfg.right, scrollCfg.bottom)
    end

    -- 创建滚动文本框
    local scrollFrame = AceGUI:Create("ScrollFrame")
    scrollFrame:SetLayout("Flow")
    scrollFrame:SetFullWidth(true)
    scrollFrame:SetFullHeight(true)
    scrollContainer:AddChild(scrollFrame)

    -- 添加顶部间距
    local topSpacer = AceGUI:Create("Label")
    topSpacer:SetFullWidth(true)
    topSpacer:SetHeight(cfg.topSpacer)
    topSpacer:SetText("")
    scrollFrame:AddChild(topSpacer)

    -- 创建文本标签
    local contentCfg = cfg.content
    local label = AceGUI:Create("Label")
    local content = type(changelog.content) == "function" and changelog.content() or changelog.content
    label:SetText(content)
    label.label:SetFont("Fonts\\ARKai_T.ttf", contentCfg.fontSize, "OUTLINE")
    label:SetFullWidth(true)
    scrollFrame:AddChild(label)

    -- 创建按钮组容器
    local btnCfg = cfg.buttons
    local btnContainer = AceGUI:Create("SimpleGroup")
    btnContainer:SetLayout("Table")
    btnContainer:SetFullWidth(true)
    btnContainer:SetHeight(btnCfg.height)
    btnContainer:SetUserData("table", {
        columns = {btnCfg.width, btnCfg.width, btnCfg.width, btnCfg.width}, -- 4个按钮
        space = btnCfg.spacing,
        align = "LEFT"
    })
    frame:AddChild(btnContainer)

    -- 定义按钮组布局函数
    local function ApplyButtonLayout()
        local btnFrame = btnContainer.frame
        btnFrame:ClearAllPoints()
        btnFrame:SetPoint("BOTTOMLEFT", frameObj, "BOTTOMLEFT", btnCfg.left, btnCfg.bottom)
        btnFrame:SetPoint("BOTTOMRIGHT", frameObj, "BOTTOMRIGHT", btnCfg.right, btnCfg.bottom)
    end

    -- 打开主界面按钮 (新增)
    local btnOpen = AceGUI:Create("Button")
    btnOpen:SetText("打开主界面")
    btnOpen:SetWidth(btnCfg.width)
    btnOpen:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    btnOpen:SetCallback("OnClick", function()
        RS:ShowMainFrame()
        -- 不关闭更新日志窗口，让用户自己决定
    end)
    btnContainer:AddChild(btnOpen)
    -- 应用皮肤
    if RS.SkinButton then RS:SkinButton(btnOpen.frame) end

    -- <按钮（往新版本翻页）
    local btnNewer = AceGUI:Create("Button")
    btnNewer:SetText("<")
    btnNewer:SetWidth(btnCfg.width)
    btnNewer:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    local newerVersion = GetNextVersion(version)
    if newerVersion then
        btnNewer:SetCallback("OnClick", function()
            frame:Release()
            RS:ShowChangelogWindow(newerVersion)
        end)
    else
        btnNewer:SetDisabled(true)
    end
    btnContainer:AddChild(btnNewer)
    -- 应用皮肤
    if RS.SkinButton then RS:SkinButton(btnNewer.frame) end

    -- >按钮（往旧版本翻页）
    local btnOlder = AceGUI:Create("Button")
    btnOlder:SetText(">")
    btnOlder:SetWidth(btnCfg.width)
    btnOlder:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    local olderVersion = GetPreviousVersion(version)
    if olderVersion then
        btnOlder:SetCallback("OnClick", function()
            frame:Release()
            RS:ShowChangelogWindow(olderVersion)
        end)
    else
        btnOlder:SetDisabled(true)
    end
    btnContainer:AddChild(btnOlder)
    -- 应用皮肤
    if RS.SkinButton then RS:SkinButton(btnOlder.frame) end

    -- 关闭按钮
    local btnClose = AceGUI:Create("Button")
    btnClose:SetText("关闭")
    btnClose:SetWidth(btnCfg.width)
    btnClose:SetHeight(RS_UI_SIZES.buttonHeight.dialog)
    btnClose:SetCallback("OnClick", function()
        self.db.global.lastSeenVersion = version
        frame:Release()
    end)
    btnContainer:AddChild(btnClose)
    -- 应用皮肤
    if RS.SkinButton then RS:SkinButton(btnClose.frame) end

    -- 应用布局
    ApplyScrollLayout()
    ApplyButtonLayout()
end

-- ========================================
-- 手动显示更新日志
-- ========================================

function RS:ShowChangelog(version)
    version = version or GetAddOnMetadata(addonName, "Version")
    self:ShowChangelogWindow(version)
end
