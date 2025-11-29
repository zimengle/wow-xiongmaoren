local locale = GetLocale()
if locale ~= "zhCN" then return end

local _, Env = ...

if not Env.L then
    Env.L = {}
end

local L = Env.L

-- 选项菜单
L["Open Exporter Window"] = "打开导出窗口"
L["Opens the exporter window"] = "打开导出窗口"
L["Profiles"] = "配置文件"

-- 初始化消息
L["Initialized. use /wse For Window."] = "已初始化。使用 /wse 打开窗口。"
L["WARNING: Sim does not support your game version! Supported versions are:\n"] = "警告：模拟器不支持您的游戏版本！支持的版本有：\n"

-- 复制对话框
L["WSE Copy Dialog"] = "WSE 复制对话框"
L["Use CTRL+C to copy link"] = "使用 CTRL+C 复制链接"

-- 主窗口
L["WowSimsExporter V"] = "WowSimsExporter 版本 "
L["Click 'Generate Data' to generate exportable data"] = "点击\"生成数据\"以生成可导出的数据"
L["Your characters class is currently unsupported. The supported classes are currently:\n"] = "您的角色职业目前不受支持。当前支持的职业有：\n"

-- 使用说明
L["To upload your character to the simuator, click on the url below that leads to the simuator website.\n\nYou will find an Import button on the top right of the simulator named \"Import\". Click that and select the \"Addon\" tab, paste the data\ninto the provided box and click \"Import\"\n\n"] = "要将您的角色上传到模拟器，请点击下方指向模拟器网站的链接。\n\n您会在模拟器右上角找到一个名为\"导入\"的按钮。点击它并选择\"插件\"标签页，将数据\n粘贴到提供的框中，然后点击\"导入\"\n\n"

-- 按钮
L["Click to copy: "] = "点击复制："
L["Generate Data (Equipped Only)"] = "生成数据（仅已装备）"
L["Batch: Export Bag Items"] = "批量：导出背包物品"
L["Copy and paste into the websites importer!"] = "复制并粘贴到网站的导入器中！"
L["Data Generated!"] = "数据已生成！"

-- 消息
L["Exported %d items from bags."] = "已从背包导出 %d 件物品。"

