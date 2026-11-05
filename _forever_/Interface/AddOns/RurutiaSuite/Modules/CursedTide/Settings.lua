-- 文件职责：注册惰性 CursedTide 设置页，只通过 Core 窄命令修改差异状态。
-- 不负责：直读 EventScheduler/地图 API、写活动数据、注册 Runtime 资源或创建地图面板。

local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CursedTide")) then return end

local Data = ns.CursedTideData
local Settings = { pageId = "cursedTide", registered = false }

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then error("Unable to create CursedTide settings page: " .. tostring(reason), 2) end
    context.cursedTideSettingsPage = page
    if context.cursedTideSettingsBuilt then page:Refresh("reuse") return page end
    local profile = module:GetProfile()
    local general = page:Section("基础设置")
    general:ActionRow():Popover("cursedTideAppearance", {
        title = "尺寸与外观", button = { text = "样式调整" },
        rows = { { kind = "slider", key = "cursedTideScale",
            text = "尺寸缩放", min = Data.layout.minScale, max = Data.layout.maxScale, step = 0.05,
            value = profile.scale, getValue = function() return module:GetProfile().scale end,
            onChange = function(_, value) module:SetScale(value) end,
        } },
    })
    general:QuadRow()
        :Checkbox("cursedTideCollapsed", {
            text = "默认折叠", tooltip = "折叠时仅显示当前最重要的一条活动。",
            value = module:IsCollapsed(), getValue = function() return module:IsCollapsed() end,
            onChange = function(_, value) module:SetCollapsed(value) end,
        })


    page:Section("数据边界"):Description(
        "活动时间以服务器日程为准。左键活动可设置航点，再点同一活动可清除；航点沿用旧版位置，实际落点待游戏内确认。")
    local actions = page:FooterActions({ columns = 3 })
    actions:Button("cursedTidePreview", { action = "preview", onDeactivate = function() if module.previewMode then module:SetPreview(false) end end,
        text = module.previewMode and "取消预览" or "预览模式",
        getText = function() return module.previewMode and "取消预览" or "预览模式" end,
        onAction = function(control)
            module:SetPreview(not module.previewMode)
            control:SetText(module.previewMode and "取消预览" or "预览模式")
        end,
    })
    actions:Button("cursedTideResetPosition", { action = "resetPosition",
        text = "重置位置", onAction = function() module:ResetPosition() end,
    })
    actions:Button("cursedTideResetDefaults", { action = "restoreDefaults",
        text = "恢复默认", tooltip = "恢复诅咒狂潮模块的全部设置。",
        onAction = function()
            page:ClosePopovers()
            page:ShowTextDialog({
                title = "恢复诅咒狂潮默认设置", confirmLabel = "恢复默认",
                description = "此操作作用于整个诅咒狂潮模块。",
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
    context.cursedTideSettingsBuilt = true
    return page
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "诅咒狂潮", description = "显示盘卷蛇岛服务器日程倒计时。",
        group = "qol", navigationOrder = 30,
        searchKeywords = { "体验优化", "诅咒", "狂潮", "盘卷蛇岛", "CursedTide", "EventScheduler" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                out.available, out.enabled, out.mutable = true, profile and profile.enabled ~= false or false, true
                out.active, out.pending, out.reason = module.runtimeActive == true, false, module.lastStatus
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                local ok, reason = module:SetFeatureEnabled(desired)
                if not ok then return false, reason end
                return (module:GetProfile().enabled ~= false) == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) local page = context and context.cursedTideSettingsPage
            if page then page:Refresh("show") end end,
        onRefresh = function(context) local page = context and context.cursedTideSettingsPage
            if page then page:Refresh("module") end end,
    }
    ns.CursedTidePageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("cursedtide", self.pageId)
        system:RegisterPageAlias("tide", self.pageId)
    end
    return self.registered
end

ns.CursedTideSettings = Settings
