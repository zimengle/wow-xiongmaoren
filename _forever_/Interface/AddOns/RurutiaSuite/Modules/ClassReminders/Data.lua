-- 文件职责：职业提醒的默认开关和技能映射；不包含UI或客户端查询。
-- 边界：仅Retail装配；配置沿用旧namespace，运行资源由新版Runtime管理。
local _, ns = ...
if not ns.Build.HasModule("ClassReminders") then return end
ns.ClassReminderData = {
    defaults = { classEnabled = true, generalEnabled = true, weapon = true, beacon = true, feast = true },
    feastSound = [[Interface\AddOns\RurutiaSuite\Media\Sounds\【露露】吃大餐咯~.ogg]],
    -- 独立查自暴雪CN/zhCN DB2 12.1.0.69587：ItemSparse -> ItemXItemEffect -> ItemEffect。
    -- ExpansionID=11、食物饮料、主动使用，Spell描述含“供所有玩家享用”；仅12.0–12.1摆放食物。
    feastNames = {
        ["盛放筵席"]=true, -- ItemID 242273 / SpellID 1259656
        ["奎尔多雷拼盘"]=true, -- 242272 / 1259657
        ["哈籁恩达尔庆典大餐"]=true, -- 255846 / 1259658
        ["银月城浮华大餐"]=true, -- 255845 / 1259659
        ["丰盛银月城浮华大餐"]=true, -- 266985 / 1278895
        ["丰盛的盛放筵席"]=true, -- 242745 / 1278909
        ["丰盛奎尔多雷拼盘"]=true, -- 242744 / 1278915
        ["丰盛哈籁恩达尔庆典大餐"]=true, -- 266996 / 1278929
        ["阿曼尼丰饶角"]=true, -- 275264 / 1296432
        ["神灵聚会"]=true, -- 275265 / 1296433
        ["知识盛宴"]=true, -- 275266 / 1296434
        ["丰盛的阿曼尼丰饶角"]=true, -- 275267 / 1303407
        ["丰盛的神灵聚会"]=true, -- 275268 / 1303408
        ["丰盛的知识盛宴"]=true, -- 275269 / 1303409
    },
    weaponText = "主手附魔没了", beaconText = "道标没挂",
    rites = {
        { spellID = 433583, enchantID = 7144 },
        { spellID = 433568, enchantID = 7143 },
    },
    light = 53563, faith = 156910, virtue = 200025,
}
