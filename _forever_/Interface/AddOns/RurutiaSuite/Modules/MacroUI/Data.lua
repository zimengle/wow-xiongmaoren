-- 文件职责：定义 Retail 暴雪宏窗口扩展的固定布局、冲突策略与默认值。
-- 不负责：读取 Blizzard 全局、修改 Frame、注册事件或创建设置控件。

local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("MacroUI") then return end

ns.MacroUIData = {
    targetAddon = "Blizzard_MacroUI",
    epsilon = 0.5,
    defaults = {
        enabled = true,
        avoidNDui = true,
        avoidElvUI = true,
        avoidPig = true,
    },
    conflictPolicies = {
        avoidNDui = { addon = "NDui", reason = "NDui" },
        avoidElvUI = { addon = "ElvUI", reason = "ElvUI" },
        avoidPig = { addon = "!Pig", reason = "PIG" },
    },
    layout = {
        stockFrameWidth = 338,
        stockFrameHeight = 424,
        frameWidth = 535,
        frameHeight = 568,
        selectorWidth = 516,
        selectorHeight = 242,
        horizontalBarWidth = 452,
        horizontalBarHeight = 16,
        horizontalBarPoint = { "TOPLEFT", 2, -308 },
        selectedBackgroundPoint = { "TOPLEFT", 5, -316 },
        editorWidth = 484,
        editorHeight = 130,
        editorBackgroundWidth = 520,
        editorBackgroundHeight = 140,
        editorBackgroundPoint = { "TOPLEFT", 6, -387 },
    },
}
