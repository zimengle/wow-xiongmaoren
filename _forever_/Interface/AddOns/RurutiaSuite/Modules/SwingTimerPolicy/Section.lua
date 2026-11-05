-- 嵌入 blizzard-ui 页面；不注册导航或占用公共页脚。
local _, ns = ...
if not ns.Build.HasModule("SwingTimerPolicy") then return end

local Settings = { pages = setmetatable({}, { __mode = "k" }) }
local LABELS = { auto = "自动", on = "开启", off = "关闭" }
local ORDER = { "auto", "on", "off" }
local STATUS_COLORS = { ["开启"] = "|cff00ff00", ["关闭"] = "|cffff0000" }
local STATUS_FALLBACK_COLOR = "|cffffd100"

local function StatusLine(module)
    local text = module:GetStatusText() or ""
    local separator = string.find(text, " · ", 1, true)
    if not separator then
        local color = STATUS_COLORS[text] or STATUS_FALLBACK_COLOR
        return "当前状态：" .. color .. text .. "|r"
    end
    local status = string.sub(text, 1, separator - 1)
    local tail = string.sub(text, separator + 1)
    local color = STATUS_COLORS[status] or STATUS_FALLBACK_COLOR
    return "当前状态：" .. color .. status .. "|r " .. tail
end

function Settings:BuildSection(page, module)
    if not (page and module) then return false end
    if page:GetControl("swingTimerManaged") then
        self.pages[page] = module
        return true
    end
    local section = page:Section("平砍计时")
    section:QuadRow():Checkbox("swingTimerManaged", {
        text = "自动管理",
        tooltip = "由 RS 管理原生平砍计时。关闭后保留当前游戏开关，并停止自动调整。",
        getValue = function() return module:GetSettings().managed end,
        getEnabled = function() return module:IsSupported() end,
        onChange = function(_, value) module:SetManaged(value) end,
    })
    section:FieldRow():Dropdown("swingTimerMode", {
        text = "显示方式",
        tooltip = "开启后按游戏规则显示计时条，位置与外观在编辑模式中调整。",
        options = LABELS,
        order = ORDER,
        getValue = function() return module:GetSettings().mode end,
        getEnabled = function() return module:IsSupported() and module:GetSettings().managed end,
        onChange = function(control, value)
            if not module:SetMode(value) then control:SetValue(module:GetSettings().mode, true) end
        end,
    })
    section:Description(function() return StatusLine(module) end)
    section:Description("自动模式优先避让已开启的 Elles 挥砍计时，否则按职业开关。骑士、萨满、德鲁伊需手动选择，仅对当前角色生效。")
    self.pages[page] = module
    return true
end

function Settings:Refresh(page, module)
    if page then return page:Refresh("swing-timer-policy") end
    for candidate, owner in pairs(self.pages) do
        if owner == module then candidate:Refresh("swing-timer-policy") end
    end
    return true
end

ns.SwingTimerPolicySettings = Settings
