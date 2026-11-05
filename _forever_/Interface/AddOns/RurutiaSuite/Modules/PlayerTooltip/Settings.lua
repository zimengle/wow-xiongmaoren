local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("PlayerTooltip") then return end

local Settings = { pageId = "player-tooltip", registered = false }
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder

local function BuildPage(context, module, data)
    local page, reason = ns.UI:CreateSettingsPage(context, { id = Settings.pageId })
    if not page then
        error("Unable to create PlayerTooltip settings page: " .. tostring(reason), 2)
    end
    context.playerTooltipSettingsPage = page
    if page:GetControl("disableWhenNDui") then
        Settings:Refresh(context, module)
        page:Refresh("reuse")
        return page
    end

    local profile = module:GetProfile()
    local coexist = page:Section("第三方界面互斥")
    local generalToggles = coexist:QuadRow()
    for _, choice in ipairs(data.compatibilityOptions) do
        local key, label = choice.key, choice.label
        generalToggles:Checkbox(key, {
            text = "与 " .. label .. " 互斥", value = profile[key],
            getValue = function() return module:GetProfile()[key] end,
            tooltip = "加载 " .. label .. " 时停用 RS 玩家资料，包括当前钥匙；" .. label .. " 自身的鼠标提示不受影响。",
            onChange = function(_, value) module:SetOption(key, value); page:Refresh("compatibility") end,
        })
    end
    local general = page:Section("基础设置")
    general:FieldRow():Dropdown("modifier", {
        text = "快捷键", options = data.modifierLabels, order = data.modifierOrder,
        value = profile.modifier,
        onChange = function(_, value) module:SetModifier(value) end,
    })

    local content = page:Section("显示内容")
    local options = {
        { "showScore", "大秘境总分", "显示玩家当前赛季的大秘境总评分。" },
        { "showRuns", "地下城最佳", "显示玩家每个大秘境地下城的最佳记录。" },
        { "showKeystone", "当前钥匙", "显示玩家当前持有的大秘境钥匙；此项无需按住资料快捷键。" },
        { "showRaids", "团本进度", "显示玩家当前赛季的团队副本进度。" },
        {
            "showLegendAchievement",
            "赛季传奇成就",
            "显示“" .. tostring(data.seasonLegendAchievement.label) .. "”成就状态。",
        },
    }
    local row
    local index
    for index = 1, #options do
        local key, label = options[index][1], options[index][2]
        if index == 1 or index == 5 then
            row = content:QuadRow()
        end
        row:Checkbox(key, {
            text = label, value = profile[key],
            tooltip = options[index][3],
            onChange = function(_, value) module:SetOption(key, value) end,
        })
    end
    content:Description("按住所选快捷键查看玩家资料。当前钥匙始终显示。")
    page:Description(function()
        local blocker = module:GetCompatibilityBlocker()
        return blocker and ("检测到 " .. tostring(blocker) .. "，RS 玩家资料已暂停。") or ""
    end, { hideWhenEmpty = true })
    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    local page = context and context.playerTooltipSettingsPage
    if not page then return false end
    local profile = module:GetProfile()
    local key
    for _, key in ipairs({ "disableWhenNDui", "disableWhenElvUI", "modifier", "showScore",
        "showRuns", "showKeystone", "showRaids", "showLegendAchievement" }) do
        local control = page:GetControl(key)
        if control then control:SetValue(profile[key], true) end
    end
    return true
end

function Settings:Register(module, data)
    if self.registered then return true end
    local definition = {
        title = "玩家资料",
        description = "配置鼠标提示中的装等、钥匙与玩家信息。",
        group = "interface",
        navigationOrder = 40,
        searchKeywords = { "玩家资料", "鼠标增强", "玩家提示", "鼠标提示", "装等", "钥匙", "大秘境", "互斥", "NDui", "ElvUI" },
        showInNavigation = true,
        navigationSwitch = {
            GetState = function(out)
                local profile = module:GetProfile()
                local blocker = module:GetCompatibilityBlocker()
                out.available = true
                out.enabled = profile ~= nil and profile.enabled == true
                out.mutable = true
                out.active = module.runtimeActive == true
                out.pending = false
                out.reason = blocker and ("当前由 " .. tostring(blocker) .. " 接管玩家提示。") or nil
                return out
            end,
            SetEnabled = function(value)
                local desired = value == true
                module:SetEnabled(desired)
                local profile = module:GetProfile()
                return profile ~= nil and profile.enabled == desired
            end,
        },
        build = function(context) return BuildPage(context, module, data) end,
        onShow = function(context) return Settings:Refresh(context, module) end,
        onRefresh = function(context) return Settings:Refresh(context, module) end,
    }
    ns.PlayerTooltipPageDefinition = definition
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end
    self.registered = system:RegisterPage(self.pageId, definition) and true or false
    if self.registered and type(system.RegisterPageAlias) == "function" then
        system:RegisterPageAlias("playerTooltip", self.pageId)
        system:RegisterPageAlias("playertooltip", self.pageId)
    end
    return self.registered
end

ns.PlayerTooltipSettings = Settings
