-- 本地化加载器
-- 根据客户端语言自动加载对应的本地化文件

local addonName = select(1, ...)

-- 创建本地化表
local L = {}
_G[addonName .. "_L"] = L

-- 获取当前语言
local locale = GetLocale()

-- 简体中文本地化
if locale == "zhCN" then
    -- 通用
    L["Addon Name"] = "WowSims导出器"
    L["Initialized"] = "已初始化"
    L["Commands"] = "命令"
    L["Open Window"] = "打开窗口"
    L["Export Character"] = "导出角色"
    L["Auto-save"] = "自动保存"
    L["ENABLED"] = "已启用"
    L["DISABLED"] = "已禁用"
    L["Credits"] = "鸣谢"
    L["WARNING"] = "警告"
    L["Sim does not support your game version!"] = "模拟器不支持您的游戏版本！"
    L["Supported versions are:"] = "支持的版本："

    -- UI 文本
    L["WowSimsExporter"] = "WowSims导出器"
    L["Click 'Generate Data' to generate exportable data"] = "点击'生成数据'以生成可导出的数据"
    L["WSE Copy Dialog"] = "WSE 复制对话框"
    L["Use CTRL+C to copy link"] = "使用 CTRL+C 复制链接"
    L["Main"] = "主要"
    L["Saved Data"] = "已保存的数据"

    -- 主标签页
    L["Your characters class is currently unsupported. The supported classes are currently:"] = "您角色的职业目前不受支持。当前支持的职业："
    L["To upload your character to the simuator, click on the url below that leads to the simuator website.\n\nYou will find an Import button on the top right of the simulator named \"Import\". Click that and select the \"Addon\" tab, paste the data\ninto the provided box and click \"Import\"\n"] = "要将您的角色上传到模拟器，请点击下方指向模拟器网站的链接。\n\n您会在模拟器右上角找到一个名为\"导入\"的按钮。点击它并选择\"插件\"选项卡，将数据\n粘贴到提供的框中，然后点击\"导入\"\n"
    L["Click to copy:"] = "点击复制："
    L["Generate Data (Equipped Only)"] = "生成数据（仅装备）"
    L["Batch: Export Bag Items"] = "批量：导出背包物品"
    L["Copy and paste into the websites importer!"] = "复制并粘贴到网站导入器！"
    L["Data Generated!"] = "数据已生成！"

    -- 已保存数据标签页
    L["Saved Character Data Management"] = "已保存角色数据管理"
    L["Auto-Save Settings"] = "自动保存设置"
    L["Enable Auto-Save"] = "启用自动保存"
    L["Show Auto-Save Messages"] = "显示自动保存消息"
    L["enabled"] = "已启用"
    L["disabled"] = "已禁用"
    L["Saved Characters"] = "已保存的角色"
    L["No saved characters found."] = "未找到已保存的角色。"
    L["Saved:"] = "保存时间："
    L["Export"] = "导出"
    L["Delete"] = "删除"

    -- 命令行消息
    L["Open window"] = "打开窗口"
    L["Export character (auto-saves)"] = "导出角色（自动保存）"
    L["Exported %d items from bags."] = "从背包导出了 %d 件物品。"
    L["Updated saved character data for %s"] = "已更新 %s 的保存角色数据"
    L["Character data saved for %s"] = "已保存 %s 的角色数据"
    L["Deleted saved character: %s"] = "已删除保存的角色：%s"
    L["Saved Characters:"] = "已保存的角色："
    L["Usage: /wsedelete <number> - Use /wselist to see available characters"] = "用法：/wsedelete <数字> - 使用 /wselist 查看可用角色"
    L["No saved character found at index %d"] = "在索引 %d 处未找到已保存的角色"
    L["Auto-save enabled. Character will be saved automatically on equipment, talent, level, and other changes."] = "自动保存已启用。角色将在装备、天赋、等级和其他变化时自动保存。"
    L["Auto-save disabled. Use /wse export to manually save character data."] = "自动保存已禁用。使用 /wse export 手动保存角色数据。"
    L["Auto-save messages"] = "自动保存消息"
    L["Usage: /wseautosave [on|off|messages]"] = "用法：/wseautosave [on|off|messages]"
    L["Character auto-saved due to %s"] = "角色因 %s 而自动保存"

    -- 选项
    L["Open Exporter Window"] = "打开导出器窗口"
    L["Opens the exporter window"] = "打开导出器窗口"
end

-- 非简体中文时，使用英文原文作为默认值
-- 这确保即使没有对应语言的翻译，代码也能正常工作
local function Localize(key, default)
    return L[key] or default or key
end

-- 将 L 表导出到 Env，以便其他文件使用
if select(2, ...) then
    local Env = select(2, ...)
    Env.L = L
    Env.Localize = Localize
end

return L

