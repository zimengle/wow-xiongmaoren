local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MagePortal")) then return end

local Settings = { pageId = "portal", registered = false }
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder
local DIRECTIONS = { DOWN = "向下", UP = "向上", RIGHT = "向右", LEFT = "向左" }
local DIRECTION_ORDER = { "DOWN", "UP", "RIGHT", "LEFT" }

local function BuildPage(context, module)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then
        error("Unable to create MagePortal settings page: " .. tostring(reason), 2)
    end
    context.magePortalSettingsPage = page
    if page:GetControl("preview") then
        Settings:Refresh(context, module)
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    local section = page:Section("基础设置")
    section:FieldRow():Dropdown("direction", {
        text = "生长方向",
        value = profile.direction,
        options = DIRECTIONS,
        order = DIRECTION_ORDER,
        onChange = function(_, value) module:SetDirection(value) end,
    })
    page:FooterActions({ columns = 1 }):Button("preview", { action = "preview", onDeactivate = function() if module.previewEnabled then module:TogglePreview(false) end end,
        text = "预览模式",
        getText = function() return module.previewEnabled and "取消预览" or "预览模式" end,
        tooltip = "临时显示界面用于调试布局；不会验证已学法术、施法、冷却或消耗。",
        onAction = function(control)
            module:TogglePreview(not module.previewEnabled)
            control:SetText(module.previewEnabled and "取消预览" or "预览模式")
        end,
    })
    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    local page = context and context.magePortalSettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    page:GetControl("preview"):SetText(module.previewEnabled and "取消预览" or "预览模式")
    page:GetControl("direction"):SetValue(profile.direction, true)
    return true
end

function Settings:Register(module)
    if self.registered then return true end
    local definition = {
        title = "法师动作条",
        description = "配置法师传送门与传送法术快捷条。",
        group = "class",
        navigationOrder = 20,
        searchKeywords = { "职业工具箱", "怀旧服", "法师", "传送门", "传送" },
        showInNavigation = true,
        visible = function() return module:IsAvailable() end,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local available = module:IsAvailable()
                out.available = available
                out.enabled = profile ~= nil and profile.spellBarEnabled == true
                out.mutable = available
                out.active = module.runtimeActive == true
                out.pending = module.pendingFeatureEnabled ~= nil
                    or module.combatDeferred == true
                out.reason = out.pending and "等待脱战后应用法师动作条状态。" or nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                if not desired and module.previewEnabled then
                    module:TogglePreview(false)
                end
                local ok, reason = module:ToggleSpellBar(desired)
                if ok == false then return false, reason end
                if module.pendingFeatureEnabled ~= nil or module.combatDeferred then
                    return true, "queued"
                end
                local profile = module:GetProfile()
                return profile ~= nil and profile.spellBarEnabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module) end,
        onShow = function(context) return Settings:Refresh(context, module) end,
        onRefresh = function(context) return Settings:Refresh(context, module) end,
    }
    ns.MagePortalPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    return self.registered
end

ns.MagePortalSettings = Settings
