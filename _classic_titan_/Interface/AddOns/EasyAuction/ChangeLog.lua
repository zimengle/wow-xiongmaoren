local ADDON_VERSION = "2.7.5"

local UPDATE_NOTES = {
            {
        version = "2.7.5",
        date = "2026-01-21",
        note = [[
- 修复自动填充上次拍卖物品和价格的问题
- 修复价格库界面，物品名错误匹配问题
- 新增分解概率显示选项， 控制是否显示物品分解概率
- 为小地图图标添加右键点击打开配置窗口功能
- 添加README文档，详细说明插件功能和使用方法
]],
    }, 
            {
        version = "2.7.1",
        date = "2026-01-20",
        note = [[
- 优化分解收益计算逻辑
- 鼠标提示中，添加选矿和研磨收益显示
- 插件设置中，添加选矿和研磨提示开关选项
- 修正自动填写价格逻辑，高亮当前选择的价格
- 价格数据库界面，矿石和草药类别显示选矿和研磨收益
]],
    },    
            {
        version = "2.6.9",
        date = "2026-01-20",
        note = [[
- 新增价格分布数据的时间过滤功能，只显示最近60秒内的数据
- 修正偶尔出现的物品名错误问题
]],
    },
{
        version = "2.6.6",
        date = "2026-01-19",
        note = [[
- 移除快速扫描模式及相关配置选项
- 增加原生卖店价显示开关配置
- 优化搜索界面鼠标提示
- 修复单体搜索模式下，物品ID匹配问题，聚合同id物品销售价格
- 补全插件运行库
]],
    },
            {
        version = "2.6.4",
        date = "2026-01-19",
        note = [[
- 修正鼠标提示
- 修正单体搜索时，同名不同ID物品的写入错误
]],
    },     
            {
        version = "2.6.1",
        date = "2026-01-18",
        note = [[
- 新增配置选项"历史价格显示"用于控制鼠标信息是否显示历史最低价
- 重构价格数据存储结构，移除冗余字段提升性能
]],
    }, 
            {
        version = "2.5.9",
        date = "2026-01-17",
        note = [[
- 新增交易历史查询功能
- 新增历史信息保存天数、保存条数修改功能，入口：插件设置-保留天数、保留条数
- 新增待售库存界面物品选中高亮
- 新增上架物品选中价格高亮显示
- 新增上架后自动选择背包同ID剩余物品功能
- 新增拍卖按钮宏命令 /click EasyAuctionStartBtn
- 保存用户上次选择的标签页，下次打开拍卖行恢复该标签
- 改进内存管理，增加垃圾回收调用
- 更新插件使用说明
- 修复拍卖框虚拟填充物品的清空问题
- 修复分类页历史价格处理逻辑
- 修复闪卖界面利润计算逻辑
]],
    },    
            {
        version = "2.5.7",
        date = "2026-01-16",
        note = [[
致谢网易DD网友 [暴躁蓝心] 修改提交

- 重构价格历史记录逻辑，优先使用每日最低价数据
- 改进拍卖行扫描功能，增加物品信息加载处理
- 修复拍卖框虚拟填充物品的清空问题，不需要手动清空虚拟填充物品
- 增加与Kiwi Farm等插件的兼容性优化
]],
    },
            {
        version = "2.5.5",
        date = "2026-01-13",
        note = [[
- 优化拍卖行界面布局和交互体验
- 优化价格库界面布局
- 优化价格走势界面布局
- 扩展外部接口，修正alatradeskill 数据获取错误
- 修复价格库数据在售数量获取错误问题
- 修复价格库价格分布界面显示错误问题
]],
    },
            {
        version = "2.5.3",
        date = "2026-01-09",
        note = [[
- 新增常用物品清单的导入导出功能，支持多角色同步
- 修复拍卖行扫描时的变量作用域问题
- 优化单体搜索时自动填写逻辑
- 在价格库列表中添加在售数列，显示当前拍卖行中该物品的数量
]],
    },
            {
        version = "2.5.1",
        date = "2026-01-09",
        note = [[
- 新增拍卖列表左键复制物品名称功能，可通过配置开关，设置入口：EasyAuctio设置--插件设置--在售列表左键复制
- 修复自动填充上次拍卖价格的逻辑，默认关闭该功能
- 调整部分UI元素位置和尺寸
]],
    },
            {
        version = "2.4.8",
        date = "2026-01-08",
        note = [[
- 新增自动填充上次拍卖价格功能，默认关闭，可在设置中开启。
  注意：该功能开启后，自动压价功能将失效。
- 移除待售列表左键点击复制功能。
]],
    },
        {
        version = "2.4.7",
        date = "2026-01-06",
        note = [[
- 添加窗口锁定/解锁功能，允许用户固定或移动拍卖行界面。
- 修复鼠标提示变量刷新问题，确保在鼠标悬停时显示准确的物品信息。
- 修复全服扫描时价格数据合并的问题。
- 调整商机发现界面UI元素的层级，确保正常显示和操作。
]],
    },
        {
        version = "2.4.6",
        date = "2026-01-06",
        note = [[
- 优化全局扫描功能，重构拍卖扫描逻辑
- 清理冗余代码
]],
    },    
    {
        version = "2.4.5",
        date = "2026-01-05",
        note = [[
- 新增UI缩放控制功能，支持50%-200%的缩放调节，
进入路径：设置--插件设置

- 添加更新日志弹窗，显示版本变更信息，
进入路径：设置--插件设置--更新日志

- 添加“周边插件”按钮，
进入路径：设置--插件设置--周边插件
]],
    },
    {
        version = "2.4.4",
        date = "2026-01-03",
        note = [[
- 优化价格走势界面，修复无数据连线错误
- 优化价格库界面，增加走势按钮
- 新增分类按钮高亮显示功能
- 添加极简模式按钮，支持快速禁用/恢复其他插件
- 优化分类页面逻辑，修复分页显示问题
- 调整宝石分类数据，增加新宝石类型
- 修复配置界面布局和文字对齐问题
- 修复拍卖行可用状态更新错误
]],
    },
}

local RELATED_ADDONS = {
    {
        name = "alaTradeSkill：时光服专业助手",
        install ="下载补丁，解压至\\World of Warcraft\\_classic_titan_\\Interface\\AddOns\\alaTradeSkill\\plugin 覆盖",
        url = "https://img.nga.178.com/attachments/mon_202601/03/axsjQkt4-hu41K1.zip"
    },
    {
        name = "Kiwi Farm：战利品收益记录",
        install ="下载插件，解压至\\World of Warcraft\\_classic_titan_\\Interface\\AddOns 覆盖",
        url = "https://img.nga.178.com/attachments/mon_202601/09/axsjQ991l-gngkK1u.zip"
    },
}

local function EnsureUpdateNotes()
    if not EasyAuctionDB.updateNotes then EasyAuctionDB.updateNotes = {} end
    local exists = {}
    for _, v in ipairs(EasyAuctionDB.updateNotes) do
        exists[v.version] = true
    end
    for _, v in ipairs(UPDATE_NOTES) do
        if not exists[v.version] then
            table.insert(EasyAuctionDB.updateNotes, v)
        end
    end

end

function ShowUpdateNotesPopup()
    if EasyAuctionUpdateNoteFrame then
        EasyAuctionUpdateNoteFrame:Show()
        return
    end

    local f = CreateFrame("Frame", "EasyAuctionUpdateNoteFrame", UIParent, "BackdropTemplate")
    f:SetSize(540, 390)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    f:SetBackdropBorderColor(0.7, 0.6, 1, 1)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    title:SetPoint("TOP", 0, -22)
    title:SetText("EasyAuction 更新日志")
    title:SetFont(title:GetFont(), 22, "OUTLINE")

    local underline = f:CreateTexture(nil, "OVERLAY")
    underline:SetColorTexture(0.7, 0.6, 1, 0.38)
    underline:SetHeight(2)
    underline:SetPoint("TOPLEFT", 20, -48)
    underline:SetPoint("TOPRIGHT", -20, -48)

    local versionDateLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    versionDateLabel:SetPoint("TOPLEFT", 30, -62)
    versionDateLabel:SetTextColor(1, 0.95, 0.7)
    versionDateLabel:SetFont(versionDateLabel:GetFont(), 16, "OUTLINE")

    local versionDropDown = CreateFrame("Frame", "EasyAuctionUpdateNoteDropDown", f, "UIDropDownMenuTemplate")
    versionDropDown:SetPoint("TOPRIGHT", -130, -56)

    local contentBG = CreateFrame("Frame", nil, f, "BackdropTemplate")
    contentBG:SetPoint("TOPLEFT", 24, -92)
    contentBG:SetPoint("BOTTOMRIGHT", -24, 60)
    contentBG:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    contentBG:SetBackdropColor(0.15, 0.14, 0.2, 0.93)
    contentBG:SetBackdropBorderColor(0.4, 0.32, 0.7, 0.8)

    local scrollFrame = CreateFrame("ScrollFrame", nil, contentBG, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 8, -8)
    scrollFrame:SetPoint("BOTTOMRIGHT", -28, 8)
    local editBox = CreateFrame("EditBox", nil, scrollFrame, "BackdropTemplate")
    editBox:SetMultiLine(true)
    editBox:SetFontObject(GameFontHighlight)
    editBox:SetWidth(380)
    editBox:SetAutoFocus(false)
    editBox:EnableMouse(true)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    editBox:SetJustifyH("LEFT")
    scrollFrame:SetScrollChild(editBox)

    local okBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate,BackdropTemplate")
    okBtn:SetSize(110, 32)
    okBtn:SetPoint("BOTTOM", 0, 14)
    okBtn:SetText("我知道了")
    okBtn:SetNormalFontObject(GameFontHighlightLarge)
    okBtn:SetScript("OnClick", function()
        f:Hide()
        EasyAuctionDB.lastSeenVersion = ADDON_VERSION
    end)
    okBtn:SetMotionScriptsWhileDisabled(true)
    okBtn:HookScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    end)
    okBtn:HookScript("OnLeave", function(self)
        self:SetBackdropBorderColor(1, 1, 1, 1)
    end)
    okBtn:SetBackdrop({
        edgeFile = "Interface\\Buttons\\UI-SilverButtonBorders",
        edgeSize = 6,
    })
    okBtn:SetBackdropBorderColor(0.5, 0.1, 0.1, 1)
    okBtn:SetNormalFontObject(GameFontNormalLarge)

    local function SelectVersion(idx)
        local note = UPDATE_NOTES[idx]
        if note then
            UIDropDownMenu_SetText(versionDropDown, note.version)
            editBox:SetText(note.note or "")
            editBox:SetCursorPosition(0)
            local y, m, d = note.date:match("(%d+)%-(%d+)%-(%d+)")
            local zhDate = y and (y.."年"..m.."月"..d.."日") or (note.date or "")
            versionDateLabel:SetText(format("版本号：|cffffe000%s|r  更新日期：|cffffe000%s|r", note.version, zhDate))
        end
    end

    UIDropDownMenu_Initialize(versionDropDown, function(self, level, menuList)
        local info = UIDropDownMenu_CreateInfo()
        for i, v in ipairs(UPDATE_NOTES) do
            info.text = v.version
            info.func = function() SelectVersion(i) end
            info.checked = (UIDropDownMenu_GetText(versionDropDown) == v.version)
            UIDropDownMenu_AddButton(info)
        end
    end)

    SelectVersion(1)
end

function CheckShowUpdateNotes()
    --EnsureUpdateNotes()
    if EasyAuctionDB.lastSeenVersion ~= ADDON_VERSION then
        ShowUpdateNotesPopup()
    end
end

function ShowRelatedAddonsPopup()
    if EasyAuctionRelatedAddonsFrame then
        EasyAuctionRelatedAddonsFrame:Show()
        return
    end

    local f = CreateFrame("Frame", "EasyAuctionRelatedAddonsFrame", UIParent, "BackdropTemplate")
    f:SetSize(540, 390)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    f:SetBackdropBorderColor(0.7, 0.6, 1, 1)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    title:SetPoint("TOP", 0, -22)
    title:SetText("周边插件")
    title:SetFont(title:GetFont(), 22, "OUTLINE")

    f:SetScript("OnLeave", function() GameTooltip:Hide() end)

    local contentBG = CreateFrame("Frame", nil, f, "BackdropTemplate")
    contentBG:SetPoint("TOPLEFT", 24, -62)
    contentBG:SetPoint("BOTTOMRIGHT", -24, 60)
    contentBG:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    contentBG:SetBackdropColor(0.15, 0.14, 0.2, 0.93)
    contentBG:SetBackdropBorderColor(0.4, 0.32, 0.7, 0.8)

    local scrollFrame = CreateFrame("ScrollFrame", nil, contentBG, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 6, -6)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 6)

    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetWidth(420)
    scrollFrame:SetScrollChild(scrollChild)
    
    local y = -4
    for i, addon in ipairs(RELATED_ADDONS) do
        local name = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        name:SetPoint("TOPLEFT", 0, y)
        name:SetText("插件名：|cff00ff80" .. addon.name .. "|r")

        local install = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        install:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -4)
        install:SetWidth(420)
        install:SetWordWrap(true)
        install:SetJustifyH("LEFT")
        install:SetText("安装方式：|cffffff00" .. (addon.install or "") .. "|r")

        local urlLabel = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        urlLabel:SetPoint("TOPLEFT", install, "BOTTOMLEFT", 0, -4)
        urlLabel:SetText("下载地址：")

        local urlBtn = CreateFrame("Button", nil, scrollChild, "UIPanelButtonTemplate")
        urlBtn:SetPoint("LEFT", urlLabel, "RIGHT", 2, 0)
        urlBtn:SetSize(60, 20)
        urlBtn:SetText("点击复制")
        urlBtn.url = addon.url

        local urlEdit = CreateFrame("EditBox", nil, scrollChild, "BackdropTemplate")
        urlEdit:SetFontObject(GameFontHighlightSmall)
        urlEdit:SetSize(250, 20)
        urlEdit:SetPoint("LEFT", urlBtn, "RIGHT", 6, 0)
        urlEdit:SetAutoFocus(true)
        urlEdit:Hide()
        urlEdit:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 }
        })
        urlEdit:SetBackdropColor(0.12,0.12,0.12,0.95)
        urlEdit:SetBackdropBorderColor(0.3,0.3,0.8,1)
        urlEdit:SetScript("OnEscapePressed", function(self) self:Hide() end)
        urlBtn:SetScript("OnClick", function()
            urlEdit:SetText(urlBtn.url)
            urlEdit:Show()
            urlEdit:SetFocus()
            urlEdit:HighlightText()
        end)
        urlEdit:SetScript("OnEditFocusLost", function(self) self:Hide() end)

        local height = name:GetStringHeight() + install:GetStringHeight() + urlLabel:GetStringHeight() + 28
        y = y - height - 10
    end

    scrollChild:SetHeight(math.abs(y)+10)
    
    local okBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    okBtn:SetSize(110, 32)
    okBtn:SetPoint("BOTTOM", 0, 14)
    okBtn:SetText("关闭")
    okBtn:SetScript("OnClick", function() f:Hide() end)
end