-- 文件职责：注册按需构建的货币条设置页，只通过 Core 窄命令修改差异状态。
-- 不负责：直接读写 WoW API、WorldMap Frame、Runtime 事件或物化默认值。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CurrencyBar")) then return end

local Data = ns.CurrencyBarData
local Settings = { pageId = "currencyBar", registered = false }

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then error("Unable to create CurrencyBar settings page: " .. tostring(reason), 2) end
    context.currencyBarSettingsPage = page
    if context.currencyBarSettingsBuilt then page:Refresh("reuse") return page end

    local profile = module:GetProfile()
    local general = page:Section("基础设置")
    general:ActionRow():Popover("currencyBarAppearance", {
        title = "尺寸与外观", button = { text = "样式调整" },
        rows = { { kind = "slider", key = "currencyBarScale",
            text = "尺寸缩放",
            min = Data.layout.minScale, max = Data.layout.maxScale, step = 0.05,
            value = profile.scale,
            getValue = function() return module:GetProfile().scale end,
            onChange = function(_, value) module:SetScale(value) end,
        } },
    })
    general:QuadRow()
        :Checkbox("currencyBarLeft", {
            text = "左对齐",
            tooltip = "改为大地图左下对齐；切换时会回到对应一侧的默认位置。",
            value = profile.alignment == "LEFT",
            getValue = function() return module:GetProfile().alignment == "LEFT" end,
            onChange = function(_, value) module:SetAlignment(value and "LEFT" or "RIGHT") end,
        })


    local currencies = page:Section("显示纹章")
    local row = currencies:QuadRow()
    local index
    for index = 1, #Data.currencies do
        local definition = Data.currencies[index]
        if index == 5 then row = currencies:QuadRow() end
        local currencyID = definition.currencyID
        row:Checkbox("currency" .. tostring(currencyID), {
            text = definition.label,
            tooltip = "在货币条中显示" .. definition.label .. "迷雾纹章。",
            value = module:IsCurrencyEnabled(currencyID),
            getValue = function() return module:IsCurrencyEnabled(currencyID) end,
            onChange = function(_, value) module:SetCurrencyEnabled(currencyID, value) end,
        })
    end

    local actions = page:FooterActions({ columns = 3 })
    actions:Button("currencyBarPreview", { action = "preview", onDeactivate = function() if module.previewMode then module:SetPreview(false) end end,
        text = module.previewMode and "取消预览" or "预览模式",
        getText = function() return module.previewMode and "取消预览" or "预览模式" end,
        onAction = function(control)
            module:SetPreview(not module.previewMode)
            control:SetText(module.previewMode and "取消预览" or "预览模式")
        end,
    })
    actions:Button("currencyBarResetPosition", { action = "resetPosition",
        text = "重置位置", onAction = function() module:ResetPosition() end,
    })
    actions:Button("currencyBarResetDefaults", { action = "restoreDefaults",
        text = "恢复默认", tooltip = "恢复货币条模块的全部设置。",
        onAction = function()
            page:ClosePopovers()
            page:ShowTextDialog({
                title = "恢复货币条默认设置", confirmLabel = "恢复默认",
                description = "此操作作用于整个货币条模块。",
                value = "恢复本模块的位置、外观及显示设置；不影响其他模块。",
                onConfirm = function()
                    if module:ResetDefaults() == false then return false end
                    page:Refresh("reset-defaults")
                    return true
                end,
            })
        end,
    })
    page:Finish()
    context.currencyBarSettingsBuilt = true
    return page
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "货币条",
        description = "配置大地图底部的当前赛季升级纹章。",
        group = "interface",
        navigationOrder = 20,
        searchKeywords = { "界面增强", "货币", "纹章", "大地图", "Currency", "WorldMap" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                out.available = true
                out.enabled = profile and profile.enabled ~= false or false
                out.mutable = true
                out.active = module.runtimeActive == true
                out.pending = false
                out.reason = module.lastStatus
                return out
            end,
            SetEnabled = function(value)
                module:SetFeatureEnabled(value == true)
                return module:GetProfile().enabled ~= false == (value == true)
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context)
            local page = context and context.currencyBarSettingsPage
            if page then page:Refresh("show") end
        end,
        onRefresh = function(context)
            local page = context and context.currencyBarSettingsPage
            if page then page:Refresh("module") end
        end,
    }
    ns.CurrencyBarPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("currencybar", self.pageId)
        system:RegisterPageAlias("currency", self.pageId)
    end
    return self.registered
end

ns.CurrencyBarSettings = Settings
