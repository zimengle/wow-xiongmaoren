local addonName, ns = ...

local OptionsPanel = {}
ns.OptionsPanel = OptionsPanel

local function CloseBlizzardOptions()
    local panel = _G.SettingsPanel
    if panel and type(panel.Close) == "function" then
        local ok = pcall(panel.Close, panel, true)
        if ok then return true end
    end

    panel = panel or _G.InterfaceOptionsFrame
    if panel and type(_G.HideUIPanel) == "function" then
        local ok = pcall(_G.HideUIPanel, panel)
        if ok then return true end
    end
    if panel and type(panel.Hide) == "function" then
        return pcall(panel.Hide, panel)
    end
    return false
end

local function OpenMain()
    CloseBlizzardOptions()
    if ns.UISystem then
        ns.UISystem:OpenMain()
    end
end

local function IsMoveUnlocked()
    if ns.MoveManager then
        return ns.MoveManager.isMoveMode == true
    end
    return ns.isMoveMode == true
end

local function OpenChangelog()
    if type(ns.ShowChangelog) == "function" then
        ns:ShowChangelog()
    end
end

local function OpenVersionEditor()
    local module = ns.Runtime and ns.Runtime:GetModule("VersionDisplay") or nil
    if module and type(module.ShowEditDialog) == "function" then
        module:ShowEditDialog()
    end
end

function OptionsPanel:_RefreshMoveButton()
    if self.moveButton and type(self.moveButton.SetText) == "function" then
        self.moveButton:SetText(IsMoveUnlocked() and "锁定位置" or "解锁移动")
    end
end

function OptionsPanel:_ToggleMove()
    if type(ns.OnMoveCommand) == "function" then
        ns:OnMoveCommand("")
    end
    self:_RefreshMoveButton()
end

local PANEL_PADDING = 16
local BUTTON_WIDTH = 140
local BUTTON_HEIGHT = 40
local BUTTON_GAP = 10
local TITLE_HEIGHT = 30
local VERSION_HEIGHT = 20

local function ResetPoint(frame)
    if frame and type(frame.ClearAllPoints) == "function" then
        frame:ClearAllPoints()
    end
end

function OptionsPanel:_Layout()
    if not self.contentsCreated or self.frame == nil then
        return
    end

    local width = type(self.frame.GetWidth) == "function" and tonumber(self.frame:GetWidth()) or 0
    -- The panel can briefly report zero before Blizzard finishes sizing it.
    -- Use the normal four-column layout until OnShow/OnSizeChanged supplies the real width.
    if width <= 0 then
        width = PANEL_PADDING * 2 + BUTTON_WIDTH * 4 + BUTTON_GAP * 3
    end
    local availableWidth = math.max(0, width - PANEL_PADDING * 2)
    local columns
    if availableWidth >= BUTTON_WIDTH * 4 + BUTTON_GAP * 3 then
        columns = 4
    elseif availableWidth >= BUTTON_WIDTH * 2 + BUTTON_GAP then
        columns = 2
    else
        columns = 1
    end

    ResetPoint(self.title.frame)
    self.title.frame:SetPoint("TOPLEFT", self.frame, "TOPLEFT", PANEL_PADDING, -PANEL_PADDING)
    self.title.frame:SetSize(availableWidth, TITLE_HEIGHT)

    ResetPoint(self.version.frame)
    self.version.frame:SetPoint("TOPLEFT", self.title.frame, "BOTTOMLEFT", 0, -8)
    self.version.frame:SetSize(availableWidth, VERSION_HEIGHT)

    ResetPoint(self.divider)
    self.divider:SetPoint("TOPLEFT", self.version.frame, "BOTTOMLEFT", 0, -8)
    self.divider:SetWidth(availableWidth)

    local buttons = {
        self.openButton,
        self.moveButton,
        self.changelogButton,
        self.versionButton,
    }
    for index, button in ipairs(buttons) do
        local column = (index - 1) % columns
        local row = math.floor((index - 1) / columns)
        ResetPoint(button.frame)
        button.frame:SetPoint(
            "TOPLEFT",
            self.divider,
            "BOTTOMLEFT",
            column * (BUTTON_WIDTH + BUTTON_GAP),
            -16 - row * (BUTTON_HEIGHT + BUTTON_GAP)
        )
        button.frame:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    end

    local rowCount = math.ceil(#buttons / columns)
    local lastRowFirst = buttons[(rowCount - 1) * columns + 1]
    ResetPoint(self.description.frame)
    self.description.frame:SetPoint("TOPLEFT", lastRowFirst.frame, "BOTTOMLEFT", 0, -16)
    self.description.frame:SetWidth(availableWidth)
    if type(self.description.FitTextHeight) == "function" then
        self.description:FitTextHeight(220, 4)
    end

    self.layoutColumns = columns
end

function OptionsPanel:_EnsureContents()
    if self.contentsCreated or self.frame == nil then
        return
    end
    local system = ns.UISystem
    if system == nil then
        return
    end

    local components = system.components
    self.title = components:Create("label", self.frame, {
        text = (ns.GetColoredProjectName and ns:GetColoredProjectName() or "露露的工具箱") .. " RurutiaSuite",
        fontKey = "heading",
        height = TITLE_HEIGHT,
        labelFill = true,
        justifyH = "LEFT",
        justifyV = "MIDDLE",
    })
    local version = ns.Compat.GetAddOnMetadata(addonName, "Version") or ns.version or "Unknown"
    self.version = components:Create("label", self.frame, {
        text = "|cffFFD700版本: |r|cffFFFFFF" .. version .. "|r",
        fontKey = "body",
        height = VERSION_HEIGHT,
        labelFill = true,
        justifyH = "LEFT",
        justifyV = "MIDDLE",
    })
    if type(self.frame.CreateTexture) == "function" then
        self.divider = self.frame:CreateTexture(nil, "ARTWORK")
        if self.divider.SetColorTexture then
            self.divider:SetColorTexture(0.5, 0.5, 0.5, 0.5)
        end
        local pixelUtil = _G.PixelUtil
        if pixelUtil and type(pixelUtil.SetHeight) == "function" then
            pixelUtil.SetHeight(self.divider, 1, 1)
        elseif self.divider.SetHeight then
            self.divider:SetHeight(1)
        end
    end

    self.openButton = components:Create("button", self.frame, {
        text = "打开主界面",
        onAction = OpenMain,
    })
    self.moveButton = components:Create("button", self.frame, {
        text = IsMoveUnlocked() and "锁定位置" or "解锁移动",
        onAction = function()
            OptionsPanel:_ToggleMove()
        end,
    })
    self.changelogButton = components:Create("button", self.frame, {
        text = "更新日志",
        onAction = OpenChangelog,
    })
    self.versionButton = components:Create("button", self.frame, {
        text = "版本号",
        onAction = OpenVersionEditor,
    })
    local commandColor = ns.GetThemeColorCode and ns:GetThemeColorCode(true) or "|cff00ff00"
    local description = [[|cffFFD700插件简介：|r
RurutiaSuite (RS) 是一个轻量化、模块化的自用工具箱，提供便捷功能。

|cffFFD700核心功能：|r
• 预设安装器、配置迁移、插件管理、数据导出、移动管理、战斗提醒。
• 聊天条、标记栏、快捷按钮、快速焦点、小工具、CVar 和界面设置。

|cffFFD700常用命令：|r
• %s/rs|r - 打开主界面
• %s/rsm|r - 解锁/锁定 RS 模块
• %s/rs help|r - 查看全部命令

|cffFFD700关于作者：|r
• 作者：%s露露緹婭|r (@Bilibili)]]
    description = string.format(description, commandColor, commandColor, commandColor, commandColor)
    self.description = components:Create("label", self.frame, {
        text = description,
        fontKey = "body",
        labelFill = true,
        justifyH = "LEFT",
        justifyV = "TOP",
        autoHeight = true,
        minHeight = 220,
        heightPadding = 4,
    })
    self.contentsCreated = true
end

function OptionsPanel:Register()
    if self.registered then
        return true
    end
    if type(_G.CreateFrame) ~= "function" then
        return false, "CreateFrame is unavailable"
    end

    local frame = _G.CreateFrame("Frame", "RSOptionsPanel", _G.UIParent)
    frame.name = ns.GetColoredProjectName and ns:GetColoredProjectName() or "RurutiaSuite"
    frame:Hide()
    frame:SetScript("OnShow", function()
        OptionsPanel:_EnsureContents()
        OptionsPanel:_Layout()
        OptionsPanel:_RefreshMoveButton()
    end)
    frame:SetScript("OnSizeChanged", function()
        OptionsPanel:_Layout()
    end)
    local category = ns.Compat.InterfaceOptions_AddCategory(frame)
    self.frame = frame
    self.category = category or frame
    self.registered = true
    return true
end

function OptionsPanel:Open()
    if not self.registered then
        local ok = self:Register()
        if not ok then return false end
    end
    ns.Compat.InterfaceOptionsFrame_OpenToCategory(self.category)
    return true
end

function OptionsPanel:GetDiagnostics()
    return {
        registered = self.registered and true or false,
        contentsCreated = self.contentsCreated and true or false,
        layoutColumns = self.layoutColumns,
    }
end
