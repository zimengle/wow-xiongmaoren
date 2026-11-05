local _, RS = ...
local Presentation = RS.Presentation

local Appearance = {}
Appearance.__index = Appearance

local FALLBACK_MESSAGES = {
    interface = "所选字体已失效，界面字体已回退到系统默认字体。",
    chatBar = "所选字体已失效，聊天条字体已回退到系统默认字体。",
    tooltip = "所选字体已失效，鼠标提示字体已回退到默认字体。",
    combatTimer = "所选字体已失效，战斗时间字体已回退到 RS Rurutia。",
    experienceBar = "所选字体已失效，经验条字体已回退到 RS Rurutia。",
    consumableBar = "所选字体已失效，消耗品字体已回退到 RS Rurutia。",
    time = "所选字体已失效，时间字体已回退到 RS Rurutia。",
    celestialBar = "所选字体已失效，天神条字体已回退到 RS Rurutia。",
    magePortal = "所选字体已失效，法师动作条字体已回退到 RS Rurutia。",
}

local function GetAppearanceProfile()
    local profile = RS.DB and RS.DB.profile
    if not profile then return nil end
    profile.appearance = type(profile.appearance) == "table" and profile.appearance or {}
    return profile.appearance
end

local function GetMainWindowOpacity()
    local appearance = GetAppearanceProfile()
    local value = appearance and tonumber(appearance.mainWindowOpacity) or nil
    if not value then value = 95 end
    return math.max(20, math.min(100, value))
end

local function GetContainerOpacity()
    local appearance = GetAppearanceProfile()
    local value = appearance and tonumber(appearance.containerOpacity) or nil
    if value == nil then value = 0 end
    return math.max(0, math.min(100, value))
end

local function GetBorderAlpha(owner)
    if owner and type(owner.getBorderAlpha) == "function" then
        return owner.getBorderAlpha()
    end
    return 100
end

local function OnFontSelected(component, value)
    local owner = component.appearanceOwner
    if not owner then return end
    local accepted = owner.font:Set(component.fontRole, value)
    component:SetValue(owner.font:GetName(component.fontRole), true)
    if not accepted and owner.print then
        owner.print(FALLBACK_MESSAGES[component.fontRole] or "所选字体已失效，已恢复默认字体。")
    end
end

local function OnMainWindowOpacityChanged(component, value)
    value = math.max(20, math.min(100, tonumber(value) or 95))
    local appearance = GetAppearanceProfile()
    if appearance then appearance.mainWindowOpacity = value end
    local owner = component.appearanceOwner
    local mainWindow = owner and owner.ui and owner.ui.mainWindow
    if mainWindow and type(mainWindow.SetBackgroundOpacity) == "function" then
        mainWindow:SetBackgroundOpacity(value)
    end
end

local function OnContainerOpacityChanged(component, value)
    value = math.max(0, math.min(100, tonumber(value) or 0))
    local appearance = GetAppearanceProfile()
    if appearance then appearance.containerOpacity = value end
    local owner = component.appearanceOwner
    local mainWindow = owner and owner.ui and owner.ui.mainWindow
    if mainWindow and type(mainWindow.SetContainerOpacity) == "function" then
        mainWindow:SetContainerOpacity(value)
    end
end

local function OnBorderAlphaChanged(component, value)
    local owner = component.appearanceOwner
    if not owner or type(owner.setBorderAlpha) ~= "function" then return end
    component:SetValue(owner.setBorderAlpha(value), true)
end

function Appearance:New(font, options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.font = font
    instance.ui = options.uiSystem or (RS.UI and RS.UI:GetSystem())
    instance.print = options.print
    instance.getBorderAlpha = options.getBorderAlpha
    instance.setBorderAlpha = options.setBorderAlpha
    instance.builds = 0
    instance.refreshes = 0
    if instance.ui and instance.ui.mainWindow then
        instance.ui.mainWindow:SetBackgroundOpacity(GetMainWindowOpacity())
        instance.ui.mainWindow:SetContainerOpacity(GetContainerOpacity())
    end
    return instance
end

function Appearance:BuildPage(context)
    local page, reason = RS.UI:CreateSettingsPage(context, { id = "appearance" })
    if not page then
        error("Unable to create Appearance settings page: " .. tostring(reason), 2)
    end

    local windowSection = assert(page:Section("主界面"))
    local windowRow = assert(windowSection:DualRow({ preserveColumns = true }))
    local _, opacity = windowRow:Slider("mainWindowOpacity", {
        text = "主界面透明度",
        min = 20,
        max = 100,
        step = 5,
        value = GetMainWindowOpacity(),
        valueSuffix = "%",
        onChange = OnMainWindowOpacityChanged,
    })
    opacity.appearanceOwner = self
    local _, containerOpacity = windowRow:Slider("containerOpacity", {
        text = "容器背景透明度",
        min = 0,
        max = 100,
        step = 5,
        value = GetContainerOpacity(),
        valueSuffix = "%",
        onChange = OnContainerOpacityChanged,
    })
    containerOpacity.appearanceOwner = self
    local borderRow = assert(windowSection:DualRow({ preserveColumns = true }))
    local _, borderAlpha = borderRow:Slider("borderAlpha", {
        text = "黑色边框透明度",
        min = 0,
        max = 100,
        step = 5,
        value = GetBorderAlpha(self),
        valueSuffix = "%",
        onChange = OnBorderAlphaChanged,
    })
    borderAlpha.appearanceOwner = self
    if self.ui and self.ui.mainWindow then
        self.ui.mainWindow:SetBackgroundOpacity(GetMainWindowOpacity())
        self.ui.mainWindow:SetContainerOpacity(GetContainerOpacity())
    end

    local section = assert(page:Section("字体设置"))
    local choices, order = self.font:GetFontChoices()
    local roles = self.font:GetAppearanceRoleDefinitions()
    local index = 1
    local row = assert(section:FieldRow())
    while index <= #roles do
        local definition = roles[index]
        if index == 4 or index == 8 then
            row = assert(section:FieldRow())
        end
        local _, dropdown = row:Dropdown(definition.role, {
            text = definition.label,
            value = self.font:GetName(definition.role),
            fontKey = "body",
            options = choices,
            order = order,
            onChange = OnFontSelected,
        })
        if not dropdown then
            error("Unable to create Appearance font control " .. definition.role, 2)
        end
        dropdown.appearanceOwner = self
        dropdown.fontRole = definition.role
        dropdown.choices = choices
        dropdown.choiceOrder = order
        index = index + 1
    end

    local actions = page:FooterActions({ columns = 3 })
    actions:Button("restoreDefaults", { action = "restoreDefaults", text = "恢复默认",
        onAction = function()
            page:ShowTextDialog({
                title = "恢复界面样式默认设置", confirmLabel = "恢复默认",
                description = "仅恢复本页的透明度、边框和字体，不影响模块开关、位置或其他配置。",
                value = "主界面透明度、容器背景、黑色边框及本页字体将恢复默认。",
                onConfirm = function()
                    local appearance = GetAppearanceProfile()
                    if appearance then
                        appearance.mainWindowOpacity = nil
                        appearance.containerOpacity = nil
                        appearance.borderAlpha = nil
                    end
                    for _, definition in ipairs(self.font:GetAppearanceRoleDefinitions()) do
                        self.font:Set(definition.role, nil)
                    end
                    if self.setBorderAlpha then self.setBorderAlpha(0) end
                    if self.ui and self.ui.mainWindow then
                        self.ui.mainWindow:SetBackgroundOpacity(GetMainWindowOpacity())
                        self.ui.mainWindow:SetContainerOpacity(GetContainerOpacity())
                    end
                    self:RefreshPage(context)
                    return true
                end,
            })
            if page.textDialog then page.textDialog.close:SetText("取消") end
        end,
    })
    page:Finish()
    context.appearanceSettingsPage = page
    context.appearanceControls = page.controls
    context.appearanceScroll = page:GetScroll()
    self.builds = self.builds + 1
    return page:GetRoot()
end

function Appearance:RefreshPage(context)
    local controls = context and context.appearanceControls
    if not controls then return false end

    local choices, order = self.font:GetFontChoices()
    for role, component in pairs(controls) do
        if role == "mainWindowOpacity" then
            component:SetValue(GetMainWindowOpacity(), true)
        elseif role == "containerOpacity" then
            component:SetValue(GetContainerOpacity(), true)
        elseif role == "borderAlpha" then
            component:SetValue(GetBorderAlpha(self), true)
        elseif component.fontRole then
            component.choices = choices
            component.choiceOrder = order
            component.options.options = choices
            component.options.order = order
            component:SetValue(self.font:GetName(role), true)
        end
    end
    if context.appearanceSettingsPage then context.appearanceSettingsPage:RefreshLayout() end
    self.refreshes = self.refreshes + 1
    return true
end

function Appearance:GetDiagnostics()
    return { builds = self.builds, refreshes = self.refreshes }
end

Presentation.AppearanceClass = Appearance
