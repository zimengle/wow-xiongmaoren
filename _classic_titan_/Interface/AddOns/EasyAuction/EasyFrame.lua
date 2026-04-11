local addonName, ns = ...
local AuctionBar = CreateFrame("Frame", "AuctionBarFrame", UIParent)

-- 声明局部变量，将在 ADDON_LOADED 事件后指向当前服务器-阵营的数据库
local EasyAuctionDB

local function EA_GetAddonMetadata(name, field)
    if type(GetAddOnMetadata) == "function" then
        return GetAddOnMetadata(name, field)
    end
    if C_AddOns and type(C_AddOns.GetAddOnMetadata) == "function" then
        return C_AddOns.GetAddOnMetadata(name, field)
    end
end

local function NormalizePositiveInt(value, fallback)
    value = math.floor(tonumber(value) or fallback or 1)
    if value < 1 then
        value = fallback or 1
    end
    return value
end

local function ApplyFrameDBDefaults()
    if not EasyAuctionDB then return end

    -- 设置默认值
    if EasyAuctionDB.bidDiscount == nil then EasyAuctionDB.bidDiscount = 0.99 end -- 起拍折扣比例，默认0.99
    if EasyAuctionDB.undercut == nil then EasyAuctionDB.undercut = 1 end           -- 压价金额，铜
    if EasyAuctionDB.stackCount == nil then EasyAuctionDB.stackCount = 20 end      -- 默认堆叠数
    if EasyAuctionDB.defaultNumStacks == nil then EasyAuctionDB.defaultNumStacks = 1 end -- 默认组数
    if EasyAuctionDB.auctionDuration == nil then EasyAuctionDB.auctionDuration = 1 end -- 默认12小时
    if EasyAuctionDB.showSections == nil then
        EasyAuctionDB.showSections = { items = true, price = true, myauct = true }
    end
    if EasyAuctionDB.buyRiskLimit == nil then EasyAuctionDB.buyRiskLimit = 500 end -- 购买风控价格500金
    if EasyAuctionDB.uiScale == nil then EasyAuctionDB.uiScale = 1.0 end
    if EasyAuctionDB.locked == nil then
        EasyAuctionDB.locked = true
    end
    EasyAuctionDB.customPos = EasyAuctionDB.customPos or nil
    if EasyAuctionDB.autoFillLastAuction == nil then EasyAuctionDB.autoFillLastAuction = false end
    if EasyAuctionDB.OperationHistory == nil then EasyAuctionDB.OperationHistory = {} end
    if EasyAuctionDB.LastActiveTab == nil then EasyAuctionDB.LastActiveTab = 1 end
    EasyAuctionDB.scanKeepPerItem = NormalizePositiveInt(EasyAuctionDB.scanKeepPerItem or 120, 120)
    EasyAuctionDB.dailyKeepDays = NormalizePositiveInt(
        EasyAuctionDB.dailyKeepDays or EasyAuctionDB.historyKeepDays or 30,
        NormalizePositiveInt(EasyAuctionDB.historyKeepDays or 30, 30)
    )
    EasyAuctionDB.hourlyKeepHours = math.min(
        24,
        NormalizePositiveInt(EasyAuctionDB.hourlyKeepHours or 24, 24)
    )
    if EasyAuctionDB.SellPanel == nil then
        EasyAuctionDB.SellPanel = true
    end
end

-- 延迟初始化函数，在 ADDON_LOADED 事件中调用
local function InitFrameDB()
    -- 从全局获取当前服务器-阵营的数据库引用
    EasyAuctionDB = _G.EasyAuctionDB
    if not EasyAuctionDB then return end

    ApplyFrameDBDefaults()
end

function EasyAuction_RebindFrameDB()
    EasyAuctionDB = _G.EasyAuctionDB
    ApplyFrameDBDefaults()
    return EasyAuctionDB
end

EasyAuction_SessionBuyStats = {}
EasyAuction_NeedAutoFillFromRecent = false
local EA_pendingAutoNumStacks = 0
local LastAuctionSold = {
    name = nil,
    itemID = nil,
    unitPrice = nil,
    Progress = false,
}

local LastBuyItemID, LastBuyName, LastBuyCount, LastBuyUnitPrice = nil, nil, nil, nil

-- 当前选择的拍卖时长
local selectedDuration = 1

-- 延迟获取 selectedDuration，在初始化后
local function GetSelectedDuration()
    return EasyAuctionDB and EasyAuctionDB.auctionDuration or selectedDuration or 1
end

-- 设置拍卖时长
local function SetSelectedDuration(val)
    selectedDuration = val
    if EasyAuctionDB then
        EasyAuctionDB.auctionDuration = val
    end
end
local function GetCopper(g, s, c) return (g or 0) * 10000 + (s or 0) * 100 + (c or 0) end
local function SplitCopper(c)
    return math.floor(c / 10000), math.floor((c % 10000) / 100), c % 100
end

local function GetAutoFillFlashSellCounts(availableStackCount, availableTotalCount)
    local stackCount = NormalizePositiveInt(EasyAuctionDB and EasyAuctionDB.stackCount or 20, 20)
    local numStacks = NormalizePositiveInt(EasyAuctionDB and EasyAuctionDB.defaultNumStacks or 1, 1)
    if availableStackCount and availableStackCount > 0 and stackCount > availableStackCount then
        stackCount = availableStackCount
    end
    if availableTotalCount and availableTotalCount > 0 and stackCount > availableTotalCount then
        stackCount = availableTotalCount
    end
    if stackCount < 1 then
        stackCount = 1
    end
    if availableTotalCount and availableTotalCount > 0 then
        local maxGroups = math.floor(availableTotalCount / stackCount)
        if maxGroups < 1 then
            maxGroups = 1
        end
        if numStacks > maxGroups then
            numStacks = maxGroups
        end
    end
    return stackCount, numStacks
end

local version = EA_GetAddonMetadata(addonName, "Version") or "?"

local ITEM_QUALITY_COLORS = {
    [0] = { r = 0.62, g = 0.62, b = 0.62 },
    [1] = { r = 1, g = 1, b = 1 },
    [2] = { r = 0.12, g = 1, b = 0 },
    [3] = { r = 0.1, g = 0.44, b = 1 },
    [4] = { r = 0.64, g = 0.21, b = 0.93 },
    [5] = { r = 1, g = 0.5, b = 0 },
    [6] = { r = 0.9, g = 0.8, b = 0.5 },
}
local CLASS_MAP = {
    [0] = "消耗品",
    [1] = "容器",
    [2] = "武器",
    [3] = "宝石",
    [4] = "护甲",
    [5] = "材料",
    [6] = "弹药",
    [7] = "商品",
    [9] = "配方",
    [15] = "杂项",
}
local CLASS_ORDER = { "消耗品", "商品", "材料", "武器", "护甲", "容器", "宝石", "配方", "杂项", "其他" }

local function tIndexOf(t, val)
    for i, v in ipairs(t) do if v == val then return i end end
end

local function CategorizeItems(items)
    local groups, order = {}, {}
    for _, item in ipairs(items) do
        local cname = CLASS_MAP[item.classID] or "其他"
        if not groups[cname] then
            groups[cname] = {}
            table.insert(order, cname)
        end
        table.insert(groups[cname], item)
    end
    table.sort(order, function(a, b)
        local ia, ib = tIndexOf(CLASS_ORDER, a), tIndexOf(CLASS_ORDER, b)
        return (ia or 99) < (ib or 99)
    end)
    return groups, order
end

local function FixItemButtonIconSize(btn, size)
    size = size or 40
    local icon = _G[btn:GetName() .. "IconTexture"]
    if icon then
        icon:SetSize(size, size)
        icon:ClearAllPoints()
        icon:SetPoint("CENTER", btn, "CENTER")
    end
end

local function ApplyEasyAuctionUIScale()
    local scale = EasyAuctionDB.uiScale or 1.0
    if AuctionBar and AuctionBar.AuctionFrame then
        AuctionBar.AuctionFrame:SetScale(scale)
    end
    if EasyAuction_HelpFrame then
        EasyAuction_HelpFrame:SetScale(scale)
    end
    if EasyAuctionConfigFrame then
        EasyAuctionConfigFrame:SetScale(scale)
    end
    if EasyAuctionDBFrame then
        EasyAuctionDBFrame:SetScale(scale)
    end
end

local function CreateBaseFrame(name, parent, width, height)
    local f = CreateFrame("Frame", name or nil, parent or UIParent, "BackdropTemplate")
    f:SetSize(width or 305, height or 350)
    f:SetClampedToScreen(true)
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    f:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    f:SetMovable(true)
    f:SetToplevel(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self)
        if not EasyAuctionDB.locked then
            self:StartMoving()
        end
    end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if not EasyAuctionDB.locked then
            local point, relativeTo, relativePoint, x, y = self:GetPoint()
            EasyAuctionDB.customPos = {
                point = point,
                relativeTo = relativeTo and relativeTo:GetName() or "UIParent",
                relativePoint = relativePoint,
                x = x,
                y = y
            }
        end
    end)
    return f
end

local function CreateNumericBox(parent, width)
    local edit = CreateFrame("EditBox", nil, parent)
    edit:SetAutoFocus(false)
    edit:SetNumeric(true)
    edit:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    edit:SetSize(width or 40, 20)

    edit.bg = edit:CreateTexture(nil, "BACKGROUND")
    edit.bg:SetAllPoints()
    edit.bg:SetColorTexture(0, 0, 0, 0.8)

    edit.border = edit:CreateTexture(nil, "BORDER")
    edit.border:SetAllPoints()
    edit.border:SetColorTexture(1, 1, 1, 0.2)
    edit.border:SetDrawLayer("BORDER", 1)

    edit:SetTextInsets(4, 4, 0, 0)
    edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    edit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    edit:SetScript("OnEditFocusGained", function(self)
        self:HighlightText()
        if not self.__BlurFrame then
            self.__BlurFrame = CreateFrame("Frame", nil, UIParent)
            self.__BlurFrame:SetAllPoints(UIParent)
            self.__BlurFrame:SetFrameStrata("FULLSCREEN_DIALOG")
            self.__BlurFrame:EnableMouse(true)
            self.__BlurFrame:SetScript("OnMouseDown", function(frame)
                if self:HasFocus() then self:ClearFocus() end
                frame:Hide()
            end)
        end
        self.__BlurFrame:Show()
        self.__BlurFrame:SetFrameLevel((self:GetFrameLevel() or 10) + 10)
    end)
    edit:SetScript("OnEditFocusLost", function(self)
        self:HighlightText(0, 0)
        if self.__BlurFrame then self.__BlurFrame:Hide() end
    end)
    return edit
end


local function SetMoneyEdit(targetGold, targetSilver, targetCopper, value)
    local gold = math.floor(value / 10000)
    local silver = math.floor((value % 10000) / 100)
    local copper = value % 100
    targetGold:SetNumber(gold)
    targetSilver:SetNumber(silver)
    targetCopper:SetNumber(copper)
end

local function UpdateStackPrice(frame)
    if not frame then
        return
    end
    local name = GetAuctionSellItemInfo and GetAuctionSellItemInfo()
    if not name or name == "" then
        SetMoneyEdit(frame.UnitGold, frame.UnitSilver, frame.UnitCopper, 0)
        SetMoneyEdit(frame.StackGold, frame.StackSilver, frame.StackCopper, 0)
        SetMoneyEdit(frame.BidGold, frame.BidSilver, frame.BidCopper, 0)
        frame.StackCount:SetNumber(0)
        frame.NumStacks:SetNumber(0)
        return
    end

    local unitGold           = frame.UnitGold:GetNumber()
    local unitSilver         = frame.UnitSilver:GetNumber()
    local unitCopper         = frame.UnitCopper:GetNumber()
    local count              = frame.StackCount:GetNumber()
    local unit               = (unitGold * 10000 + unitSilver * 100 + unitCopper)
    local stackTotal         = unit * count
    local undercut           = EasyAuctionDB.undercut or 1
    local undercutMode       = EasyAuctionDB.undercutMode or "total"
    local enableUndercut     = EasyAuctionDB.enableUndercut ~= false

    local undercutStackTotal = stackTotal
    if enableUndercut then
        if undercutMode == "total" then
            undercutStackTotal = math.max(stackTotal - undercut, 1)
        else
            local newUnit = math.max(unit - undercut, 1)
            undercutStackTotal = newUnit * count
        end
    end
    SetMoneyEdit(frame.StackGold, frame.StackSilver, frame.StackCopper, undercutStackTotal)

    local bidDiscount = EasyAuctionDB.bidDiscount or 0.99
    local bidTotal = math.floor(undercutStackTotal * bidDiscount)
    SetMoneyEdit(frame.BidGold, frame.BidSilver, frame.BidCopper, bidTotal)
end

function ScanBagAuctionableItems()
    local itemsByID = {}
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and info.stackCount and info.stackCount > 0 then
                local location = ItemLocation:CreateFromBagAndSlot(bag, slot)
                local itemName, _, quality, _, _, _, _, _, _, _, _, classID = C_Item.GetItemInfo(info.hyperlink)
                local auctionable = false
                if C_AuctionHouse then
                    auctionable = C_AuctionHouse.IsSellItemValid(location, false)
                else
                    auctionable = not C_Item.IsBound(location)
                end
                if auctionable then
                    if not itemsByID[info.itemID] then
                        itemsByID[info.itemID] = {
                            bag = bag,
                            slot = slot,
                            itemID = info.itemID,
                            icon = info.iconFileID,
                            count = info.stackCount,
                            quality = quality,
                            classID = classID,
                            itemName = itemName,
                            itemLink = info.hyperlink,
                        }
                    else
                        itemsByID[info.itemID].count = itemsByID[info.itemID].count + info.stackCount
                    end
                end
            end
        end
    end
    local items = {}
    for _, v in pairs(itemsByID) do
        table.insert(items, v)
    end
    return items
end

local function ShowBorder(frame, color)
    local t = frame:CreateTexture(nil, "BACKGROUND")
    t:SetAllPoints()
    t:SetColorTexture(unpack(color or { 0, 0, 0, 0.8 }))
end

local function SetupAutoBlurForEditBox(editBox, onSave)
    editBox:SetAutoFocus(false)
    editBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        if onSave then onSave(self) end
    end)
    editBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        if onSave then onSave(self) end
    end)
    editBox:SetScript("OnEditFocusGained", function(self)
        self:HighlightText()

        if not self.__BlurFrame then
            self.__BlurFrame = CreateFrame("Frame", nil, UIParent)
            self.__BlurFrame:SetAllPoints(UIParent)
            self.__BlurFrame:SetFrameStrata("FULLSCREEN_DIALOG")
            self.__BlurFrame:EnableMouse(true)
            self.__BlurFrame:SetPropagateKeyboardInput(true)
            self.__BlurFrame:SetScript("OnMouseDown", function(frame, btn)
                if not editBox:HasFocus() then return end
                editBox:ClearFocus()
                if onSave then onSave(editBox) end
                frame:Hide()
            end)
        end
        self.__BlurFrame:Show()
        self.__BlurFrame:SetFrameLevel((self:GetFrameLevel() or 10) + 10)
    end)
    editBox:SetScript("OnEditFocusLost", function(self)
        self:HighlightText(0, 0)
        if self.__BlurFrame then self.__BlurFrame:Hide() end
        if onSave then onSave(self) end
    end)
end

function CreateEasyAuctionConfigFrame(parent)
    EasyAuctionDB = EasyAuction_RebindFrameDB() or EasyAuctionDB
    if EasyAuctionConfigFrame then return end
    local width, height = 340, 400
    local frame = CreateFrame("Frame", "EasyAuctionConfigFrame", UIParent, "BackdropTemplate")
    frame:SetSize(width, height)
    if AuctionHelper and AuctionHelper:IsShown() then
        frame:SetPoint("TOPLEFT", AuctionHelper, "TOPRIGHT", 2, 0)
    else
        frame:SetPoint("CENTER", UIParent, "CENTER", -400, 0)
    end
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetToplevel(true)
    frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    frame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    frame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    frame:SetScript("OnMouseDown", function(self, btn)
        if btn == "LeftButton" then self:StartMoving() end
    end)
    frame:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("|cffffd200EasyAuction 设置|r")

    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)

    local categoryFrame = CreateFrame("Frame", nil, frame)
    categoryFrame:SetSize(90, height - 40)
    categoryFrame:SetPoint("TOPLEFT", 12, -36)
    local categories = {
        { key = "addon", text = "插件设置" },
        { key = "auction", text = "拍卖设置" },
    }
    local catButtons = {}
    local curCat = "auction"

    local function ShowCat(cat)
        for k, btn in pairs(catButtons) do
            if btn.key == cat then
                btn.bg:SetColorTexture(0.1, 0.7, 1, 0.15)
            else
                btn.bg:SetColorTexture(0, 0, 0, 0)
            end
        end
        for _, page in pairs(frame.pages) do page:Hide() end
        frame.pages[cat]:Show()
        curCat = cat
    end

    for i, info in ipairs(categories) do
        local btn = CreateFrame("Button", nil, categoryFrame)
        btn:SetSize(categoryFrame:GetWidth() - 2, 32)
        btn:SetPoint("TOPLEFT", 0, -((i - 1) * 34))
        btn.key = info.key
        btn.bg = btn:CreateTexture(nil, "BACKGROUND")
        btn.bg:SetAllPoints()
        btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        btn.text:SetPoint("LEFT", 10, 0)
        btn.text:SetText(info.text)
        btn:SetScript("OnClick", function() ShowCat(info.key) end)
        catButtons[info.key] = btn
    end

    frame.pages = {}

    local pageAuction = CreateFrame("Frame", nil, frame)
    pageAuction:SetSize(width - 80, height - 54)
    pageAuction:SetPoint("TOPLEFT", categoryFrame, "TOPRIGHT", 2, 0)
    frame.pages["auction"] = pageAuction

    local labelWidth = 90
    local inputStartX = 90
    local rowHeight = 28
    local startY = -18

    local function AddCfgLabel(text, row)
        local l = pageAuction:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        l:SetFont(l:GetFont(), 14, "")
        l:SetPoint("TOPRIGHT", pageAuction, "TOPLEFT", labelWidth - 25, startY - (row - 1.5) * rowHeight)
        l:SetJustifyH("RIGHT")
        l:SetWidth(labelWidth)
        l:SetText(text)
        return l
    end

    local function AddCfgEditBox(width, row, dx)
        local box = CreateNumericBox(pageAuction, width)
        box:SetPoint("TOPLEFT", inputStartX + (dx or 0) - 20, startY - (row - 1.5) * rowHeight + 1)
        box:SetJustifyH("RIGHT")
        return box
    end

    local labelHistoryDays = AddCfgLabel("保留天数：", 9)
    labelHistoryDays:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("价格历史保留天数", 1, 1, 1)
        GameTooltip:AddLine("只保留最近N天的价格记录，过期数据会自动清理。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelHistoryDays:SetScript("OnLeave", GameTooltip_Hide)

    local boxHistoryDays = AddCfgEditBox(52, 9)
    boxHistoryDays:SetNumber(EasyAuctionDB.historyKeepDays or 30)
    SetupAutoBlurForEditBox(boxHistoryDays, function(self)
        local v = tonumber(self:GetText()) or 30
        if v < 1 then v = 1 elseif v > 999 then v = 999 end
        EasyAuctionDB.historyKeepDays = v
        self:SetNumber(v)
    end)
    boxHistoryDays:SetScript("OnEnter", labelHistoryDays:GetScript("OnEnter"))
    boxHistoryDays:SetScript("OnLeave", GameTooltip_Hide)

    local labelHistoryMax = AddCfgLabel("保留条数：", 10)
    labelHistoryMax:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("每物品保留条数", 1, 1, 1)
        GameTooltip:AddLine("每种物品最多保留多少条历史，0为不限制。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelHistoryMax:SetScript("OnLeave", GameTooltip_Hide)

    local boxHistoryMax = AddCfgEditBox(52, 10)
    boxHistoryMax:SetNumber(EasyAuctionDB.historyMaxEntry or 0)
    SetupAutoBlurForEditBox(boxHistoryMax, function(self)
        local v = tonumber(self:GetText()) or 0
        if v < 0 then v = 0 elseif v > 9999 then v = 9999 end
        EasyAuctionDB.historyMaxEntry = v
        self:SetNumber(v)
    end)
    boxHistoryMax:SetScript("OnEnter", labelHistoryMax:GetScript("OnEnter"))
    boxHistoryMax:SetScript("OnLeave", GameTooltip_Hide)


    local labelDiscount = AddCfgLabel("起拍折扣：", 1)
    labelDiscount:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("起拍折扣", 1, 1, 1)
        GameTooltip:AddLine("设置起拍总价为一口价总价的百分比。\n如99即起拍价=一口价×0.99", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelDiscount:SetScript("OnLeave", GameTooltip_Hide)
    local boxDiscount = AddCfgEditBox(40, 1)
    boxDiscount:SetNumber((EasyAuctionDB.bidDiscount or 0.99) * 100)
    boxDiscount:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("起拍折扣", 1, 1, 1)
        GameTooltip:AddLine("设置起拍价为一口价的百分比。\n如99即起拍价=一口价×0.99", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    boxDiscount:SetScript("OnLeave", GameTooltip_Hide)
    SetupAutoBlurForEditBox(boxDiscount, function(self)
        local v = tonumber(self:GetText()) or 99
        if v < 1 then v = 1 elseif v > 100 then v = 100 end
        EasyAuctionDB.bidDiscount = v / 100
        self:SetNumber(v)
        UpdateStackPrice(AuctionBar.AuctionFrame)
    end)

    local labelUndercut = AddCfgLabel("压价金额：", 2)
    labelUndercut:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("自动压价", 1, 1, 1)
        GameTooltip:AddLine("自动比市场最低价低指定金额上架。\n如1银，则自动一口价-1银。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelUndercut:SetScript("OnLeave", GameTooltip_Hide)
    local boxGold = AddCfgEditBox(40, 2)
    boxGold:SetNumber(math.floor((EasyAuctionDB.undercut or 1) / 10000))
    local iconGold = pageAuction:CreateTexture(nil, "ARTWORK")
    iconGold:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
    iconGold:SetSize(12, 12)
    iconGold:SetPoint("LEFT", boxGold, "RIGHT", 1, 0)

    local boxSilver = AddCfgEditBox(35, 2, 52)
    boxSilver:SetNumber(math.floor(((EasyAuctionDB.undercut or 1) % 10000) / 100))
    local iconSilver = pageAuction:CreateTexture(nil, "ARTWORK")
    iconSilver:SetTexture("Interface\\MoneyFrame\\UI-SilverIcon")
    iconSilver:SetSize(12, 12)
    iconSilver:SetPoint("LEFT", boxSilver, "RIGHT", 1, 0)

    local boxCopper = AddCfgEditBox(35, 2, 100)
    boxCopper:SetNumber((EasyAuctionDB.undercut or 1) % 100)
    local iconCopper = pageAuction:CreateTexture(nil, "ARTWORK")
    iconCopper:SetTexture("Interface\\MoneyFrame\\UI-CopperIcon")
    iconCopper:SetSize(12, 12)
    iconCopper:SetPoint("LEFT", boxCopper, "RIGHT", 1, 0)

    local function SaveUndercut()
        EasyAuctionDB.undercut = GetCopper(boxGold:GetNumber(), boxSilver:GetNumber(), boxCopper:GetNumber())
        if AuctionHelper and AuctionHelper:IsShown() then
            UpdateStackPrice(AuctionBar.AuctionFrame)
        end
    end
    SetupAutoBlurForEditBox(boxGold, SaveUndercut)
    SetupAutoBlurForEditBox(boxSilver, SaveUndercut)
    SetupAutoBlurForEditBox(boxCopper, SaveUndercut)
    boxGold:SetScript("OnTextChanged", SaveUndercut)
    boxSilver:SetScript("OnTextChanged", SaveUndercut)
    boxCopper:SetScript("OnTextChanged", SaveUndercut)

    boxGold:SetScript("OnLeave", GameTooltip_Hide)
    boxSilver:SetScript("OnEnter", boxGold:GetScript("OnEnter"))
    boxSilver:SetScript("OnLeave", GameTooltip_Hide)
    boxCopper:SetScript("OnEnter", boxGold:GetScript("OnEnter"))
    boxCopper:SetScript("OnLeave", GameTooltip_Hide)

    local labelStack = AddCfgLabel("默认堆叠：", 3)
    labelStack:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("默认堆叠数", 1, 1, 1)
        GameTooltip:AddLine("每次上架默认每组的物品数量。\n如20表示每组20个。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelStack:SetScript("OnLeave", GameTooltip_Hide)
    local boxStack = AddCfgEditBox(32, 3)
    boxStack:SetNumber(EasyAuctionDB.stackCount or 20)
    SetupAutoBlurForEditBox(boxStack, function(self)
        local v = tonumber(self:GetText()) or 1
        if v < 1 then v = 1 elseif v > 999 then v = 999 end
        EasyAuctionDB.stackCount = v
        self:SetNumber(v)
        UpdateStackPrice(AuctionBar.AuctionFrame)
    end)

    local labelDefaultNumStacks = AddCfgLabel("默认组数：", 4)
    labelDefaultNumStacks:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("闪卖默认组数", 1, 1, 1)
        GameTooltip:AddLine("闪卖页放入物品时默认填入的组数。若超过当前物品实际可上架组数，将自动按实际可上架组数填入。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelDefaultNumStacks:SetScript("OnLeave", GameTooltip_Hide)

    local boxDefaultNumStacks = AddCfgEditBox(32, 4)
    boxDefaultNumStacks:SetNumber(EasyAuctionDB.defaultNumStacks or 1)
    SetupAutoBlurForEditBox(boxDefaultNumStacks, function(self)
        local v = tonumber(self:GetText()) or 1
        if v < 1 then v = 1 elseif v > 999 then v = 999 end
        EasyAuctionDB.defaultNumStacks = v
        self:SetNumber(v)
    end)
    boxDefaultNumStacks:SetScript("OnEnter", labelDefaultNumStacks:GetScript("OnEnter"))
    boxDefaultNumStacks:SetScript("OnLeave", GameTooltip_Hide)

    local labelDuration = AddCfgLabel("默认时长：", 5)
    labelDuration:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("默认时长", 1, 1, 1)
        GameTooltip:AddLine("每次上架拍卖的默认持续时间。\n可选12/24/48小时。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelDuration:SetScript("OnLeave", GameTooltip_Hide)
    local durationBox = CreateFrame("Frame", nil, pageAuction, "UIDropDownMenuTemplate")
    durationBox:SetPoint("TOPLEFT", inputStartX - 30, startY - (5 - 1.5) * rowHeight + 4)
    UIDropDownMenu_SetWidth(durationBox, 80)
    local durations = { { text = "12小时", value = 1 }, { text = "24小时", value = 2 }, { text = "48小时", value = 3 } }
    UIDropDownMenu_Initialize(durationBox, function(self, level)
        for _, v in ipairs(durations) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = v.text
            info.value = v.value
            info.func = function()
                EasyAuctionDB.auctionDuration = v.value
                UIDropDownMenu_SetSelectedValue(durationBox, v.value)
                if AuctionBar and AuctionBar.AuctionFrame and _G["EasyAuctionDurationDropdown"] then
                    UIDropDownMenu_SetSelectedValue(_G["EasyAuctionDurationDropdown"], v.value)
                end
                UpdateStackPrice(AuctionBar.AuctionFrame)
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetSelectedValue(durationBox, EasyAuctionDB.auctionDuration or 1)

    local labelUndercutMode = AddCfgLabel("压价方式：", 6)
    labelUndercutMode:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("压价方式", 1, 1, 1)
        GameTooltip:AddLine("只能选一种压价方式。", 1, .82, 0, 1)
        GameTooltip:AddLine("压总价：按总价整体压价\n压单价：每个单价都压价", .75, .75, .75, 1)
        GameTooltip:Show()
    end)
    labelUndercutMode:SetScript("OnLeave", GameTooltip_Hide)

    local cbUndercutTotal = CreateFrame("CheckButton", nil, pageAuction, "ChatConfigCheckButtonTemplate")
    cbUndercutTotal:SetPoint("TOPLEFT", inputStartX - 20, startY - (6 - 1.5) * rowHeight + 4)
    cbUndercutTotal.Text:SetText("压总价")
    cbUndercutTotal.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    cbUndercutTotal:SetChecked(EasyAuctionDB.undercutMode ~= "unit")
    cbUndercutTotal:SetHitRectInsets(0, -(cbUndercutTotal.Text:GetStringWidth() + 8), 0, 0)
    local cbUndercutUnit = CreateFrame("CheckButton", nil, pageAuction, "ChatConfigCheckButtonTemplate")
    cbUndercutUnit:SetPoint("TOPLEFT", cbUndercutTotal, "BOTTOMLEFT", 0, -2)
    cbUndercutUnit.Text:SetText("压单价")
    cbUndercutUnit.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    cbUndercutUnit:SetChecked(EasyAuctionDB.undercutMode == "unit")
    cbUndercutUnit:SetHitRectInsets(0, -(cbUndercutUnit.Text:GetStringWidth() + 8), 0, 0)
    cbUndercutTotal:SetScript("OnClick", function(self)
        cbUndercutTotal:SetChecked(true)
        cbUndercutUnit:SetChecked(false)
        EasyAuctionDB.undercutMode = "total"
        UpdateStackPrice(AuctionBar.AuctionFrame)
    end)
    cbUndercutUnit:SetScript("OnClick", function(self)
        cbUndercutTotal:SetChecked(false)
        cbUndercutUnit:SetChecked(true)
        EasyAuctionDB.undercutMode = "unit"
        UpdateStackPrice(AuctionBar.AuctionFrame)
    end)

    local labelScanPerFrame = AddCfgLabel("扫描帧速：", 8)
    labelScanPerFrame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("全局扫描每帧条数", 1, 1, 1)
        GameTooltip:AddLine("全局扫描时每帧处理多少条拍卖数据。\n数值越大扫描越快，但可能导致卡顿。\n建议100~300之间。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelScanPerFrame:SetScript("OnLeave", GameTooltip_Hide)

    local boxScanPerFrame = AddCfgEditBox(50, 8)
    boxScanPerFrame:SetNumber(EasyAuctionDB.scanPerFrame or 200)
    SetupAutoBlurForEditBox(boxScanPerFrame, function(self)
        local v = tonumber(self:GetText()) or 200
        if v < 50 then v = 50 elseif v >= 500 then v = 200 end
        EasyAuctionDB.scanPerFrame = v
        self:SetNumber(v)
    end)
    boxScanPerFrame:SetScript("OnEnter", labelScanPerFrame:GetScript("OnEnter"))
    boxScanPerFrame:SetScript("OnLeave", GameTooltip_Hide)

    local pageAddon = CreateFrame("Frame", nil, frame)
    pageAddon:SetSize(width - 110, height - 54)
    pageAddon:SetPoint("TOPLEFT", categoryFrame, "TOPRIGHT", 5, 0)
    frame.pages["addon"] = pageAddon

    local function AddOptionCheck(y, label, key, tooltip)
        local cb = CreateFrame("CheckButton", nil, pageAddon, "ChatConfigCheckButtonTemplate")
        if key == "enablePrice" or key == "enableDisenchant" or key == "showUnitPrice" or key == "enableProspect" or key == "enableMill" or key == "enableDisenchantProb" then
            cb:SetPoint("TOPLEFT", 30, y)
        elseif key == "enableVendor" or key == "ShowMinPrice" then
            cb:SetPoint("TOPLEFT", 50, y)
        else
            cb:SetPoint("TOPLEFT", 10, y)
        end
        cb.Text:SetText(label)
        cb.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
        cb.Text:SetJustifyH("LEFT")
        cb.Text:SetWidth(150)
        cb.tooltip = tooltip
        cb:SetChecked(EasyAuctionDB[key] ~= false)
        cb:SetScript("OnClick", function(self)
            EasyAuctionDB[key] = self:GetChecked() and true or false
            if key == "enableUndercut" then
                UpdateStackPrice(AuctionBar.AuctionFrame)
            end
        end)
    end
    AddOptionCheck(-6, "隐藏原生卖店价", "hideSellPrice", "是否显示系统卖价信息")
    AddOptionCheck(-28, "EA鼠标提示", "ShowPrice", "EasyAuction鼠标提示总开关")
    AddOptionCheck(-50, "EA价格", "enablePrice", "是否显示卖店价及拍卖价格信息")
    AddOptionCheck(-72, "EA卖店价", "enableVendor", "是否显示卖店价价格")
    AddOptionCheck(-94, "EA历史最低", "ShowMinPrice", "是否显示物品历史最低价格")
    AddOptionCheck(-118, "EA分解收益", "enableDisenchant", "是否显示物品分解价值")
    AddOptionCheck(-140, "EA分解概率", "enableDisenchantProb", "是否显示物品分解概率")
    AddOptionCheck(-162, "EA选矿收益", "enableProspect", "是否显示物品选矿价值")
    AddOptionCheck(-184, "EA研磨收益", "enableMill", "是否显示物品研磨价值")
    AddOptionCheck(-206, "总价/单价显示优先", "showUnitPrice", "关闭后：\n鼠标提示优先显示总价，按Shift显示单价\n开启则优先显示单价，按Shift显示总价")
    AddOptionCheck(-228, "启用自动压价", "enableUndercut", "开启后，总价/起拍价会自动减去配置的压价金额")
    AddOptionCheck(-250, "连续上架相同物品自动同价", "autoFillLastAuction", "开启后，连续上架相同物品时，会自动填充上一次拍卖的价格\n（开启后，自动压价不生效！）")
    AddOptionCheck(-272, "在售列表左键复制", "enableAuctionListCopy", "开启后，可在在售列表中左键点击物品名称进行复制")

    local buyRiskLabel = pageAddon:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    buyRiskLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    buyRiskLabel:SetPoint("TOPLEFT", -80, -294)
    buyRiskLabel:SetJustifyH("RIGHT")
    buyRiskLabel:SetWidth(150)
    buyRiskLabel:SetText("购买风控：")

    local buyRiskEdit = CreateNumericBox(pageAddon, 50)
    buyRiskEdit:SetPoint("LEFT", buyRiskLabel, "RIGHT", 10, 0)
    buyRiskEdit:SetJustifyH("CENTER")
    buyRiskEdit:SetNumber(EasyAuctionDB.buyRiskLimit or 0)

    local buyRiskGoldIcon = pageAddon:CreateTexture(nil, "ARTWORK")
    buyRiskGoldIcon:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
    buyRiskGoldIcon:SetSize(12, 12)
    buyRiskGoldIcon:SetPoint("LEFT", buyRiskEdit, "RIGHT", 2, 0)

    buyRiskEdit:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("单次购买风控", 1, 1, 1)
        GameTooltip:AddLine("单次购买超过此金额（单位：金）时将弹窗提示。0为不限制。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    buyRiskEdit:SetScript("OnLeave", GameTooltip_Hide)

    SetupAutoBlurForEditBox(buyRiskEdit, function(self)
        local v = tonumber(self:GetText()) or EasyAuctionDB.buyRiskLimit or 500
        if v < 0 then v = 0 end
        EasyAuctionDB.buyRiskLimit = v
        self:SetNumber(v)
    end)

    local scaleLabel = pageAddon:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    scaleLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    scaleLabel:SetPoint("TOPLEFT", -80, -316)
    scaleLabel:SetJustifyH("RIGHT")
    scaleLabel:SetWidth(150)
    scaleLabel:SetText("界面缩放：")

    local scaleMinus = CreateFrame("Button", nil, pageAddon, "UIPanelButtonTemplate")
    scaleMinus:SetSize(22, 22)
    scaleMinus:SetText("-")
    scaleMinus:SetPoint("LEFT", scaleLabel, "RIGHT", 0, 0)
    scaleMinus:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("减少缩放(步长1%)", 1, 1, 1)
        GameTooltip:AddLine("最小值：50%", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    scaleMinus:SetScript("OnLeave", GameTooltip_Hide)

    local scaleEdit = CreateNumericBox(pageAddon, 38)
    scaleEdit:SetPoint("LEFT", scaleMinus, "RIGHT", 4, 0)
    scaleEdit:SetJustifyH("CENTER")
    scaleEdit:SetNumber(math.floor((EasyAuctionDB.uiScale or 1.0) * 100 + 0.5))

    local scalePlus = CreateFrame("Button", nil, pageAddon, "UIPanelButtonTemplate")
    scalePlus:SetSize(22, 22)
    scalePlus:SetText("+")
    scalePlus:SetPoint("LEFT", scaleEdit, "RIGHT", 4, 0)
    scalePlus:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("增加缩放(步长1%)", 1, 1, 1)
        GameTooltip:AddLine("最大值：200%", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    scalePlus:SetScript("OnLeave", GameTooltip_Hide)

    local scalePercentLabel = pageAddon:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    scalePercentLabel:SetPoint("LEFT", scalePlus, "RIGHT", 2, 0)
    scalePercentLabel:SetText("%")

    local function UpdateScaleInput(val)
        val = math.floor(val + 0.5)
        if val < 50 then val = 50 elseif val > 200 then val = 200 end
        if tonumber(scaleEdit:GetText()) ~= val then
            scaleEdit:SetNumber(val)
        end
        EasyAuctionDB.uiScale = val / 100
        ApplyEasyAuctionUIScale()
    end

    scaleMinus:SetScript("OnClick", function()
        local val = tonumber(scaleEdit:GetText()) or 100
        UpdateScaleInput(val - 1)
    end)

    scalePlus:SetScript("OnClick", function()
        local val = tonumber(scaleEdit:GetText()) or 100
        UpdateScaleInput(val + 1)
    end)

    SetupAutoBlurForEditBox(scaleEdit, function(self)
        local v = tonumber(self:GetText()) or 100
        UpdateScaleInput(v)
    end)

    scaleEdit:SetScript("OnTextChanged", function(self)
        local v = tonumber(self:GetText()) or 100
    end)

    scaleEdit:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("手动输入缩放百分比", 1, 1, 1)
        GameTooltip:AddLine("支持50~200，单位为百分比。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    scaleEdit:SetScript("OnLeave", GameTooltip_Hide)

    local resetBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetBtn:SetSize(80, 24)
    resetBtn:SetText("重置插件")
    resetBtn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 14, 14)

    resetBtn:SetScript("OnClick", function()
        StaticPopupDialogs["EASYAUCTION_RESET_DB"] = {
            text = "确定要清空所有拍卖历史记录和设置吗？\n此操作不可恢复！",
            button1 = "确定",
            button2 = "取消",
            OnAccept = function()
                if type(EasyAuction_ResetSavedVariables) == "function" then
                    EasyAuctionDB = EasyAuction_ResetSavedVariables(true)
                else
                    EasyAuctionDB = {
                        bidDiscount = 0.99,
                        undercut = 1,
                        stackCount = 20,
                        defaultNumStacks = 1,
                        auctionDuration = 1,
                        showSections = { items = true, price = true, myauct = true },
                        buyRiskLimit = 500,
                        scanPerFrame = 200,
                        scanKeepPerItem = 120,
                        historyKeepDays = 30,
                        historyMaxEntry = 0,
                        dailyKeepDays = 30,
                        hourlyKeepHours = 24,
                        PriceHistory = {},
                        DailyMinPrice = {},
                        HourlyMinPrice = {},
                        CurrentTodayMin = {},
                        FavoriteItems = {},
                        RecentSearch = {},
                        scanQuickLimit = 100,
                    }
                    _G.EasyAuctionDB = EasyAuctionDB
                    _G.EasyAuctionDB2 = _G.EasyAuctionDB2 or {}
                end

                if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() then
                    RefreshDBFrame()
                end
                if AuctionBar and AuctionBar.AuctionFrame then
                    AuctionBar.AuctionFrame:RefreshBagItemFrame()
                    AuctionBar.AuctionFrame:RefreshMyAuctionList()
                end
                if type(RefreshRecentSearchRows) == "function" then RefreshRecentSearchRows() end
                if type(RefreshFavoriteRows) == "function" then RefreshFavoriteRows() end
                if type(RefreshMinPriceLines) == "function" then RefreshMinPriceLines() end
                if type(EasyAuction_UpdateInlineDistribution) == "function" then
                    EasyAuction_UpdateInlineDistribution(
                        nil, nil)
                end
                if type(UpdateTrendFrame) == "function" then UpdateTrendFrame(nil) end
                print("|cff00ff00EasyAuction|r：所有设置与历史数据已重置。")
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show("EASYAUCTION_RESET_DB")
    end)

    local changelogBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    changelogBtn:SetSize(80, 24)
    changelogBtn:SetPoint("BOTTOM", resetBtn, "TOP", 0, 10)
    changelogBtn:SetText("更新日志")
    changelogBtn:SetScript("OnClick", function()
        ShowUpdateNotesPopup()
    end)

    local relatedBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    relatedBtn:SetSize(80, 24)
    relatedBtn:SetPoint("BOTTOM", changelogBtn, "TOP", 0, 10)
    relatedBtn:SetText("周边插件")
    relatedBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("支持调用EasyAuction数据库的插件", 1, 1, 1, 1, true)
        GameTooltip:Show()
    end)
    relatedBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    relatedBtn:SetScript("OnClick", function()
        ShowRelatedAddonsPopup()
    end)
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)
    closeBtn:SetSize(26, 26)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)
    ShowCat("auction")
end

local function PickupAndPutToAuction(bag, slot)
    C_Container.PickupContainerItem(bag, slot)
    C_Timer.After(0.01, function()
        ClickAuctionSellItemButton()
        C_Timer.After(0.01, function()
            ClearCursor()
            local f = AuctionBar and AuctionBar.AuctionFrame
            local ItemButton = _G["EasyAuctionItemButton"]
            if f and ItemButton and ItemButton.itemID then
                local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
                if name and itemID then
                    RefreshMinPriceLines(name, itemID)
                end
            end
        end)
    end)
end

function UpdateDepositMoney()
    local HookAuctionFrame = AuctionBar.AuctionFrame
    if not HookAuctionFrame then return end

    local StackSize = HookAuctionFrame.StackCount:GetNumber()
    local NumStacks = HookAuctionFrame.NumStacks:GetNumber()
    local duration = GetSelectedDuration()
    local perDepositMoney = GetAuctionDeposit(1, 1, 1, StackSize, 1)
    local TolDepositMoney
    if duration == 3 then
        TolDepositMoney = perDepositMoney * 4 * NumStacks
    else
        TolDepositMoney = perDepositMoney * duration * NumStacks
    end
    if HookAuctionFrame and HookAuctionFrame.totalDepositMoneyLabel then
        HookAuctionFrame.totalDepositMoneyLabel:SetText(format("|cffffff00总保管费：|r|cffffffff%s|r",
            GetMoneyString(TolDepositMoney or 0)))
    end
    if HookAuctionFrame and HookAuctionFrame.totalProfitLabel then
        local stackGold = HookAuctionFrame.StackGold:GetNumber()
        local stackSilver = HookAuctionFrame.StackSilver:GetNumber()
        local stackCopper = HookAuctionFrame.StackCopper:GetNumber()
        local perBuyout = stackGold * 10000 + stackSilver * 100 + stackCopper
        local totalBuyout = perBuyout * NumStacks
        local totalProfit = math.floor(totalBuyout * 0.99 + 0.5) - TolDepositMoney
        HookAuctionFrame.totalProfitLabel:SetText(format("|cff00ff00预计利润：|r|cffffffff%s|r",
            GetMoneyString(totalProfit or 0)))
    end
end

function CreateAuctionSide()
    EasyAuctionDB = EasyAuctionDB or {}
    EasyAuctionDB.showSections = EasyAuctionDB.showSections or { items = true, price = true, myauct = true }
    if type(EasyAuctionDB.bidDiscount) ~= "number" or EasyAuctionDB.bidDiscount <= 0 or EasyAuctionDB.bidDiscount > 1 then
        EasyAuctionDB.bidDiscount = 0.99
    end
    if type(EasyAuctionDB.undercut) ~= "number" then
        EasyAuctionDB.undercut = 1
    end
    if type(EasyAuctionDB.stackCount) ~= "number" or EasyAuctionDB.stackCount <= 0 then
        EasyAuctionDB.stackCount = 20
    end
    EasyAuctionDB.defaultNumStacks = NormalizePositiveInt(EasyAuctionDB.defaultNumStacks, 1)
    if type(EasyAuctionDB.auctionDuration) ~= "number" then
        EasyAuctionDB.auctionDuration = 1
    end
    if AuctionBar.AuctionFrame then return end

    local totalWidth, totalHeight = 620, 450
    local midX = 320
    local midY = 200

    local f = CreateBaseFrame("AuctionHelper", AuctionFrame, 320, 440)
    f:SetPoint("TOPLEFT", AuctionFrame, "TOPRIGHT", 0, -10)
    local tab1 = CreateFrame("Button", f:GetName() .. "Tab1", f, nil)
    tab1:SetSize(60, 24)
    tab1:SetID(1)
    tab1:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 24)
    tab1.icon = tab1:CreateTexture(nil, "ARTWORK")
    tab1.icon:SetTexture("Interface\\Icons\\inv_misc_bag_10_green")
    tab1.icon:SetSize(18, 18)
    tab1.icon:SetPoint("LEFT", tab1, "LEFT", 4, 0)
    tab1.text = tab1:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    tab1.text:SetPoint("LEFT", tab1.icon, "RIGHT", 2, 0)
    tab1.text:SetText("闪购")
    tab1.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")


    local tab2 = CreateFrame("Button", f:GetName() .. "Tab2", f, nil)
    tab2:SetSize(60, 24)
    tab2:SetID(2)
    tab2:SetPoint("LEFT", tab1, "RIGHT", 0, 0)
    tab2.icon = tab2:CreateTexture(nil, "ARTWORK")
    tab2.icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
    tab2.icon:SetSize(18, 18)
    tab2.icon:SetPoint("LEFT", tab2, "LEFT", 4, 0)
    tab2.text = tab2:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    tab2.text:SetPoint("LEFT", tab2.icon, "RIGHT", 2, 0)
    tab2.text:SetText("闪卖")
    tab2.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")



    local tab3 = CreateFrame("Button", f:GetName() .. "Tab3", f, nil)
    tab3:SetSize(120, 24)
    tab3:SetID(3)
    tab3:SetText("|cff00ffffEasyAuction|r")
    tab3:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 24)
    tab3:SetScript("OnClick", function()
        if EasyAuction_HelpFrame and EasyAuction_HelpFrame:IsShown() then
            EasyAuction_HelpFrame:Hide()
            return
        end
        if not EasyAuction_HelpFrame then
            local f = CreateFrame("Frame", "EasyAuction_HelpFrame", UIParent, "BackdropTemplate")
            f:SetSize(500, 430)
            f:SetPoint("CENTER")
            f:SetFrameStrata("DIALOG")
            f:SetMovable(true)
            f:EnableMouse(true)
            f:SetToplevel(true)
            f:RegisterForDrag("LeftButton")
            f:SetScript("OnDragStart", f.StartMoving)
            f:SetScript("OnDragStop", f.StopMovingOrSizing)
            f:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 18,
                insets = { left = 6, right = 6, top = 6, bottom = 6 }
            })
            f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
            f:SetBackdropBorderColor(0.7, 0.6, 1, 1)

            local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
            title:SetPoint("TOP", 0, -22)
            title:SetText("|TInterface/Icons/INV_Misc_Coin_01:12:12:0:0|t  EasyAuction V" .. version .. " 使用说明")
            title:SetFont(title:GetFont(), 22, "OUTLINE")

            local underline = f:CreateTexture(nil, "OVERLAY")
            underline:SetColorTexture(0.7, 0.6, 1, 0.36)
            underline:SetHeight(2)
            underline:SetPoint("TOPLEFT", 20, -48)
            underline:SetPoint("TOPRIGHT", -20, -48)

            local contentBG = CreateFrame("Frame", nil, f, "BackdropTemplate")
            contentBG:SetPoint("TOPLEFT", 24, -62)
            contentBG:SetPoint("BOTTOMRIGHT", -24, 24)
            contentBG:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 }
            })
            contentBG:SetBackdropColor(0.15, 0.14, 0.2, 0.93)
            contentBG:SetBackdropBorderColor(0.4, 0.32, 0.7, 0.8)

            local scroll = CreateFrame("ScrollFrame", nil, contentBG, "UIPanelScrollFrameTemplate")
            scroll:SetPoint("TOPLEFT", 8, -8)
            scroll:SetPoint("BOTTOMRIGHT", -28, 8)
            local scrollChild = CreateFrame("EditBox", nil, scroll)
            scrollChild:SetMultiLine(true)
            scrollChild:SetFontObject("GameFontHighlight")
            scrollChild:SetWidth(400)
            scrollChild:SetAutoFocus(false)
            scrollChild:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
            scroll:SetScrollChild(scrollChild)

            scrollChild:SetText(EASYAUCTION_HELP_TEXT)
            f.scroll = scroll
            f.text = scrollChild

            local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
            closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
            closeBtn:SetSize(26, 26)
            closeBtn:SetScript("OnClick", function() f:Hide() end)

            tinsert(UISpecialFrames, "EasyAuction_HelpFrame")
        else
            EasyAuction_HelpFrame.text:SetText(EASYAUCTION_HELP_TEXT)
        end
        EasyAuction_HelpFrame:Show()
    end)
    tab3:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("点击查看 EasyAuction V" .. version .. " 使用说明", 1, 1, 1)
        GameTooltip:AddLine("如遇问题请优先查阅帮助文档", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    tab3:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    for _, tab in ipairs({ tab1, tab2, tab3 }) do
        local bg = tab:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0.12, 0.10, 0.08, 0.92)
        tab._bg = bg
        local fs = tab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        fs:SetPoint("CENTER")
        fs:SetText(tab:GetText())
        fs:SetTextColor(1, 0.82, 0)
        tab:SetText("")
        tab._fs = fs
        tab:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
        tab:GetHighlightTexture():SetAlpha(0.18)
        tab:GetHighlightTexture():SetAllPoints()
    end

    local tabFlashSellPage = CreateFrame("Frame", nil, f)
    tabFlashSellPage:SetAllPoints(f)
    tabFlashSellPage:SetPoint("TOPLEFT", 0, 0)
    tabFlashSellPage:Show()
    ns.tabFlashSellPage = tabFlashSellPage
    local recentCommonPanel = CreateFrame("Frame", nil, tabFlashSellPage, "BackdropTemplate")
    recentCommonPanel:SetPoint("BOTTOMLEFT", tabFlashSellPage, "BOTTOMLEFT", 0, 0)
    recentCommonPanel:SetPoint("BOTTOMRIGHT", tabFlashSellPage, "BOTTOMRIGHT", 0, 0)
    recentCommonPanel:SetHeight(240)
    recentCommonPanel:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    recentCommonPanel:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    recentCommonPanel:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    local minPriceCurLabel, minPriceCurValue
    local minPriceTodayLabel, minPriceTodayValue
    local minPriceHistLabel, minPriceHistValue
    local INFO_WIDTH = recentCommonPanel:GetWidth() or 300

    minPriceCurLabel = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceCurLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceCurLabel:SetPoint("BOTTOMLEFT", recentCommonPanel, "TOPLEFT", 10, 90)
    minPriceCurLabel:SetJustifyH("LEFT")
    minPriceCurLabel:SetWidth(INFO_WIDTH - 100)

    minPriceCurValue = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceCurValue:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceCurValue:SetPoint("BOTTOMRIGHT", recentCommonPanel, "TOPRIGHT", -80, 90)
    minPriceCurValue:SetJustifyH("RIGHT")
    minPriceCurValue:SetWidth(100)

    minPriceTodayLabel = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceTodayLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceTodayLabel:SetPoint("TOPLEFT", minPriceCurLabel, "BOTTOMLEFT", 0, -15)
    minPriceTodayLabel:SetJustifyH("LEFT")
    minPriceTodayLabel:SetWidth(INFO_WIDTH - 100)

    minPriceTodayValue = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceTodayValue:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceTodayValue:SetPoint("TOPRIGHT", minPriceCurValue, "BOTTOMRIGHT", 0, -15)
    minPriceTodayValue:SetJustifyH("RIGHT")
    minPriceTodayValue:SetWidth(100)

    minPriceHistLabel = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceHistLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceHistLabel:SetPoint("TOPLEFT", minPriceTodayLabel, "BOTTOMLEFT", 0, -15)
    minPriceHistLabel:SetJustifyH("LEFT")
    minPriceHistLabel:SetWidth(INFO_WIDTH - 100)

    minPriceHistValue = tabFlashSellPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minPriceHistValue:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    minPriceHistValue:SetPoint("TOPRIGHT", minPriceTodayValue, "BOTTOMRIGHT", 0, -15)
    minPriceHistValue:SetJustifyH("RIGHT")
    minPriceHistValue:SetWidth(100)

    function RefreshMinPriceLines(name, itemID)
        if not name or name == "" then
            if minPriceCurLabel and minPriceCurValue and minPriceCurLabel.avgBuyLabel then
                minPriceCurLabel.avgBuyLabel:SetText("本次购买：--")
                minPriceCurLabel.avgBuyValue:SetText("")
                minPriceCurLabel.avgBuyLabel:Show()
                minPriceCurLabel.avgBuyValue:Show()
            end
            minPriceCurLabel:SetText("当前最低价：")
            minPriceCurValue:SetText("|cffff8888无数据|r")
            if minPriceTodayLabel then minPriceTodayLabel:SetText("今日最低价：") end
            if minPriceTodayValue then minPriceTodayValue:SetText("|cffff8888无数据|r") end
            if minPriceHistLabel then minPriceHistLabel:SetText("历史最低价：") end
            if minPriceHistValue then minPriceHistValue:SetText("|cffff8888无数据|r") end
            return
        end

        local key = nil
        local actualItemID = itemID
        if type(name) == "string" and name:find(":") then
            key = name
            local parsedName, parsedID = string.match(name, "^(.+):(%d+)$")
            if parsedID then
                actualItemID = tonumber(parsedID)
            end
        else
            if not actualItemID then
                local _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, id = GetItemInfo(name)
                actualItemID = id
            end
            key = name .. ":" .. (actualItemID or "0")
        end

        local curPrice, todayMin, histMin
        local curUnit
        local today = date("%Y-%m-%d")
        local dailyArray = EasyAuctionDB.DailyMinPrice[key] or {}
        local daily = nil
        for _, v in ipairs(dailyArray) do
            if v[1] == today then
                daily = v
                break
            end
        end

        if daily and daily[2] then
            curPrice = daily[2] -- unit
            curUnit  = daily[2]
        else
            local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
            if history and #history > 0 then
                curPrice = nil
                for _, v in ipairs(history) do
                    if v.unit and (not curPrice or v.unit < curPrice) then
                        curPrice = v.unit
                    end
                end
                if history[1] and history[1].unit then
                    curUnit = history[1].unit
                end
            end
        end

        todayMin = daily and daily[4] or nil -- min字段
        histMin = nil
        local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
        if history and history.minUnit then
            histMin = history.minUnit
        end

        if (not curPrice or not histMin) and actualItemID then
            for k, v in pairs(EasyAuctionDB.PriceHistory or {}) do
                if k:match(":(%d+)$") == tostring(actualItemID) then
                    if not curPrice and type(v) == "table" and #v > 0 then
                        for _, vv in ipairs(v) do
                            if vv.unit and (not curPrice or vv.unit < curPrice) then
                                curPrice = vv.unit
                            end
                        end
                        if v[1] and v[1].unit then
                            curUnit = v[1].unit
                        end
                    end
                    if not histMin and v.minUnit then
                        histMin = v.minUnit
                    end
                    -- 查找该key在DailyMinPrice中的min
                    if not todayMin then
                        local dArr = EasyAuctionDB.DailyMinPrice and EasyAuctionDB.DailyMinPrice[k]
                        if dArr then
                            for _, rec in ipairs(dArr) do
                                if rec[1] == today and rec[4] then
                                    todayMin = rec[4]
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end

        if minPriceCurLabel and minPriceCurValue then
            if not minPriceCurLabel.avgBuyLabel then
                minPriceCurLabel.avgBuyLabel = minPriceCurLabel:GetParent():CreateFontString(nil, "OVERLAY",
                    "GameFontHighlight")
                minPriceCurLabel.avgBuyLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                minPriceCurLabel.avgBuyLabel:SetPoint("BOTTOMLEFT", minPriceCurLabel, "TOPLEFT", 0, 5)
                minPriceCurLabel.avgBuyLabel:SetJustifyH("LEFT")
                minPriceCurLabel.avgBuyLabel:SetWidth(INFO_WIDTH - 100)
                minPriceCurLabel.avgBuyValue = minPriceCurLabel:GetParent():CreateFontString(nil, "OVERLAY",
                    "GameFontHighlight")
                minPriceCurLabel.avgBuyValue:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                minPriceCurLabel.avgBuyValue:SetPoint("BOTTOMRIGHT", minPriceCurValue, "TOPRIGHT", 0, 5)
                minPriceCurLabel.avgBuyValue:SetJustifyH("RIGHT")
                minPriceCurLabel.avgBuyValue:SetWidth(100)
            end
            local stat = actualItemID and EasyAuction_SessionBuyStats[actualItemID]
            local showText
            if stat and stat.num and stat.num > 0 then
                local avg = math.floor(stat.sum / stat.num + 0.5)
                showText = string.format("本次购买：%d个，\n合计：%s\n平均：%s",
                    stat.num,
                    GetMoneyString(stat.sum, true),
                    GetMoneyString(avg, true)
                )
            else
                showText = "本次购买：--"
            end
            minPriceCurLabel.avgBuyLabel:SetText(showText)
            minPriceCurLabel.avgBuyValue:SetText("")
            minPriceCurLabel.avgBuyLabel:Show()
            minPriceCurLabel.avgBuyValue:Show()
        end

        minPriceCurLabel:SetText("当前最低价：")
        minPriceCurValue:SetText(curPrice and FormatGoldIcon(curPrice) or "|cffff8888无数据|r")

        if todayMin and curUnit and todayMin > 0 then
            local diff = curUnit - todayMin
            local percent = diff / todayMin * 100
            local percentColor = percent >= 0 and "|cffffcc00" or "|cff00ff00"
            minPriceTodayLabel:SetText(string.format("今日最低价：%s%+.1f%%%s", percentColor, percent, "|r"))
            minPriceTodayValue:SetText(FormatGoldIcon(todayMin))
        else
            minPriceTodayLabel:SetText("今日最低价：")
            minPriceTodayValue:SetText("|cffff8888无数据|r")
        end

        if histMin and curUnit and histMin > 0 then
            local diff = curUnit - histMin
            local percent = diff / histMin * 100
            local percentColor = percent >= 0 and "|cffff6600" or "|cff00ff00"
            minPriceHistLabel:SetText(string.format("历史最低价：%s%+.1f%%%s", percentColor, percent, "|r"))
            minPriceHistValue:SetText(FormatGoldIcon(histMin))
        else
            minPriceHistLabel:SetText("历史最低价：")
            minPriceHistValue:SetText("|cffff8888无数据|r")
        end
    end

    local rcTab1 = CreateFrame("Button", nil, recentCommonPanel)
    rcTab1:SetSize(80, 24)
    rcTab1:SetPoint("TOPLEFT", recentCommonPanel, 10, -2)
    rcTab1.icon = rcTab1:CreateTexture(nil, "ARTWORK")
    rcTab1.icon:SetTexture("Interface\\Common\\UI-Searchbox-Icon")
    rcTab1.icon:SetSize(16, 16)
    rcTab1.icon:SetPoint("LEFT", rcTab1, "LEFT", 6, 0)
    rcTab1.text = rcTab1:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    rcTab1.text:SetPoint("LEFT", rcTab1.icon, "RIGHT", 4, 0)
    rcTab1.text:SetText("最近搜索")
    rcTab1.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    rcTab1:SetNormalFontObject(GameFontNormal)
    rcTab1:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
    rcTab1.bgHighlight = rcTab1:CreateTexture(nil, "BACKGROUND")
    rcTab1.bgHighlight:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
    rcTab1.bgHighlight:SetAllPoints()
    rcTab1.bgHighlight:SetBlendMode("ADD")
    rcTab1.bgHighlight:Hide()

    local rcTab2 = CreateFrame("Button", nil, recentCommonPanel)
    rcTab2:SetSize(80, 24)
    rcTab2:SetPoint("LEFT", rcTab1, "RIGHT", 6, 0)
    rcTab2.icon = rcTab2:CreateTexture(nil, "ARTWORK")
    rcTab2.icon:SetTexture("Interface\\Icons\\inv_misc_gift_01")
    rcTab2.icon:SetSize(16, 16)
    rcTab2.icon:SetPoint("LEFT", rcTab2, "LEFT", 6, 0)

    rcTab2.text = rcTab2:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    rcTab2.text:SetPoint("LEFT", rcTab2.icon, "RIGHT", 4, 0)
    rcTab2.text:SetText("常用物品")
    rcTab2.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
    rcTab2:SetNormalFontObject(GameFontNormal)
    rcTab2:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")

    rcTab2.bgHighlight = rcTab2:CreateTexture(nil, "BACKGROUND")
    rcTab2.bgHighlight:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
    rcTab2.bgHighlight:SetAllPoints()
    rcTab2.bgHighlight:SetBlendMode("ADD")
    rcTab2.bgHighlight:Hide()

    local favoriteImportExportBtn = CreateFrame("Button", nil, recentCommonPanel, "UIPanelButtonTemplate")
    favoriteImportExportBtn:SetSize(80, 20)
    favoriteImportExportBtn:SetText("编辑清单")
    favoriteImportExportBtn:SetPoint("LEFT", rcTab2, "RIGHT", 54, 0)
    favoriteImportExportBtn:Hide()

    local function ShowFavoriteImportExportFrame()
        if EasyAuctionFavoriteImportExportFrame and EasyAuctionFavoriteImportExportFrame:IsShown() then
            EasyAuctionFavoriteImportExportFrame:Hide()
            return
        end

        if not EasyAuctionFavoriteImportExportFrame then
            local f = CreateFrame("Frame", "EasyAuctionFavoriteImportExportFrame", UIParent, "BackdropTemplate")
            f:SetSize(340, 390)
            f:SetPoint("CENTER")
            f:SetFrameStrata("FULLSCREEN_DIALOG")
            f:SetMovable(true)
            f:EnableMouse(true)
            f:RegisterForDrag("LeftButton")
            f:SetScript("OnDragStart", f.StartMoving)
            f:SetScript("OnDragStop", f.StopMovingOrSizing)
            f:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 18,
                insets = { left = 6, right = 6, top = 6, bottom = 6 }
            })
            f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
            f:SetBackdropBorderColor(0.7, 0.6, 1, 1)

            local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
            title:SetPoint("TOP", 0, -22)
            title:SetText("常用物品清单")
            title:SetFont(title:GetFont(), 22, "OUTLINE")

            local warnBar = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            warnBar:SetPoint("TOP", 0, -42)
            warnBar:SetSize(300, 22)
            warnBar:SetJustifyH("CENTER")
            warnBar:SetText("")
            warnBar:Hide()
            f.warnBar = warnBar

            local contentBG = CreateFrame("Frame", nil, f, "BackdropTemplate")
            contentBG:SetPoint("TOPLEFT", 24, -62)
            contentBG:SetPoint("BOTTOMRIGHT", -24, 60)
            contentBG:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 }
            })
            contentBG:SetBackdropColor(0.15, 0.14, 0.2, 0.93)
            contentBG:SetBackdropBorderColor(0.4, 0.32, 0.7, 0.8)

            local scrollFrame = CreateFrame("ScrollFrame", nil, contentBG, "UIPanelScrollFrameTemplate")
            scrollFrame:SetPoint("TOPLEFT", 8, -8)
            scrollFrame:SetPoint("BOTTOMRIGHT", -28, 8)

            local editBox = CreateFrame("EditBox", nil, scrollFrame)
            editBox:SetMultiLine(true)
            editBox:SetFontObject("ChatFontNormal")
            editBox:SetMaxLetters(8000)
            editBox:SetWidth(220)
            editBox:SetHeight(260)
            editBox:SetAutoFocus(false)
            scrollFrame:SetScrollChild(editBox)
            f.editBox = editBox

            local tip = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            tip:SetPoint("TOPLEFT", contentBG, "BOTTOMLEFT", 2, 0)
            tip:SetPoint("RIGHT", f, -18, 0)
            tip:SetJustifyH("LEFT")
            tip:SetSpacing(4)
            tip:SetText(
                "每行格式：物品ID,物品名\n" ..
                "可全选复制到别的号，也可手动编辑。\n" ..
                "|cff00ff00要清空全部常用物品，请清空内容后保存。|r"
            )

            local saveBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            saveBtn:SetSize(60, 32)
            saveBtn:SetText("保存")
            saveBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -18, 18)

            local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
            closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -6, -6)
            closeBtn:SetScript("OnClick", function()
                f:Hide()
            end)

            f.origText = ""

            saveBtn:SetScript("OnClick", function()
                local text = editBox:GetText() or ""
                text = text:gsub("，", ",")
                local newTbl = {}
                local lineCount = 0
                local errorLine
                for line in text:gmatch("[^\r\n]+") do
                    local id, name = line:match("^%s*(%d+)%s*,%s*(.+)%s*$")
                    if not id or not name then
                        if line:find("，") then
                            errorLine = line
                            break
                        end
                    else
                        local currentTime = currentTime or time()
                        newTbl[tonumber(id)] = { name = name, time = currentTime - lineCount }
                        lineCount = lineCount + 1
                    end
                end
                if errorLine then
                    f.warnBar:SetText("|cffff4040保存失败，第一个格式错误（或含中文逗号）的行：|r" .. errorLine)
                    f.warnBar:Show()
                    return
                end
                EasyAuctionDB.FavoriteItems = newTbl
                f.origText = text
                f.warnBar:Hide()
                if lineCount == 0 then
                    print("|cff00ff00常用物品清单已清空。|r")
                else
                    print("|cff00ff00常用物品清单已保存，共|r|cffffff00" .. lineCount .. "|r|cff00ff00项。|r")
                end
                if RefreshFavoriteRows then RefreshFavoriteRows() end
                f:Hide()
            end)
            editBox:SetScript("OnEscapePressed", function(self)
                self:ClearFocus()
            end)
            editBox:SetScript("OnEditFocusLost", function(self)
                self:HighlightText(0, 0)
                local orig = f.origText or ""
                if self:GetText() ~= orig then
                    f.warnBar:SetText("|cffffff00内容已更改，记得点击保存。|r")
                    f.warnBar:Show()
                end
            end)



            f:SetPropagateKeyboardInput(true)
            f:EnableKeyboard(true)
            f:SetScript("OnKeyDown", function(self, key)
                if key == "ESCAPE" then
                    if not editBox:HasFocus() then
                        self:Hide()
                    end
                end
            end)
            f:SetScript("OnShow", function(self)
                self:SetPropagateKeyboardInput(true)
                self:EnableKeyboard(true)
            end)
            f:SetScript("OnHide", function(self)
                self:EnableKeyboard(false)
            end)

            EasyAuctionFavoriteImportExportFrame = f
        end

        local function RefreshFavoriteListContent(editBox)
            local tbl = EasyAuctionDB.FavoriteItems or {}
            local arr = {}
            for k, v in pairs(tbl) do
                table.insert(arr, { id = k, name = v.name or "", time = v.time or 0 })
            end
            table.sort(arr, function(a, b) return (a.time or 0) > (b.time or 0) end)
            local lines = {}
            for _, v in ipairs(arr) do
                table.insert(lines, string.format("%s,%s", tostring(v.id), v.name))
            end
            local text = table.concat(lines, "\n")
            editBox:SetText(text)
            editBox:HighlightText(0, -1)
            local frame = EasyAuctionFavoriteImportExportFrame
            if frame then
                frame.origText = text
                if frame.warnBar then
                    frame.warnBar:SetText("")
                    frame.warnBar:Hide()
                end
            end
        end

        EasyAuctionFavoriteImportExportFrame:Show()
        RefreshFavoriteListContent(EasyAuctionFavoriteImportExportFrame.editBox)
        EasyAuctionFavoriteImportExportFrame.editBox:SetFocus()
    end

    favoriteImportExportBtn:SetScript("OnClick", ShowFavoriteImportExportFrame)
    favoriteImportExportBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("导入/导出常用物品清单", 1, 1, 1)
        GameTooltip:AddLine("可用于多角色/多账号同步", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    favoriteImportExportBtn:SetScript("OnLeave", GameTooltip_Hide)

    local rcScroll1 = CreateFrame("ScrollFrame", "EasyAuctionRecentSearchScroll", recentCommonPanel,
        "UIPanelScrollFrameTemplate")
    rcScroll1:SetPoint("TOPLEFT", 10, -26)
    rcScroll1:SetPoint("BOTTOMRIGHT", -20, 10)
    local rcScrollChild1 = CreateFrame("Frame", nil, rcScroll1)
    rcScrollChild1:SetWidth(recentCommonPanel:GetWidth() - 24)
    rcScroll1:SetScrollChild(rcScrollChild1)
    rcScroll1:Hide()
    local scrollBar = _G["EasyAuctionRecentSearchScrollScrollBar"]
    if scrollBar then
        scrollBar:ClearAllPoints()
        scrollBar:SetPoint("TOPRIGHT", rcScroll1, "TOPRIGHT", 12, -18)
        scrollBar:SetPoint("BOTTOMRIGHT", rcScroll1, "BOTTOMRIGHT", 12, 18)
        scrollBar:SetWidth(12)
    end

    local rcScroll2 = CreateFrame("ScrollFrame", "EasyAuctionFavoriteScroll", recentCommonPanel,
        "UIPanelScrollFrameTemplate")
    rcScroll2:SetPoint("TOPLEFT", 10, -26)
    rcScroll2:SetPoint("BOTTOMRIGHT", -20, 10)
    local rcScrollChild2 = CreateFrame("Frame", nil, rcScroll2)
    rcScrollChild2:SetWidth(recentCommonPanel:GetWidth() - 24)
    rcScroll2:SetScrollChild(rcScrollChild2)
    rcScroll2:Hide()
    local favScrollBar = _G["EasyAuctionFavoriteScrollScrollBar"]
    if favScrollBar then
        favScrollBar:ClearAllPoints()
        favScrollBar:SetPoint("TOPRIGHT", rcScroll2, "TOPRIGHT", 12, -18)
        favScrollBar:SetPoint("BOTTOMRIGHT", rcScroll2, "BOTTOMRIGHT", 12, 18)
        favScrollBar:SetWidth(12)
    end

    local function ShowRCTab(idx)
        if idx == 1 then
            rcScroll1:Show()
            rcScroll2:Hide()
            rcTab1.text:SetText("|cffffff00最近搜索|r")
            rcTab2.text:SetText("常用物品")
            rcTab1.bgHighlight:Show()
            rcTab2.bgHighlight:Hide()
            favoriteImportExportBtn:Hide()
        else
            rcScroll1:Hide()
            rcScroll2:Show()
            rcTab1.text:SetText("最近搜索")
            rcTab2.text:SetText("|cffffff00常用物品|r")
            rcTab1.bgHighlight:Hide()
            rcTab2.bgHighlight:Show()
            favoriteImportExportBtn:Show()
        end
    end
    rcTab1:SetScript("OnClick", function()
        ShowRCTab(1); RefreshRecentSearchRows()
    end)
    rcTab2:SetScript("OnClick", function()
        ShowRCTab(2); RefreshFavoriteRows()
    end)

    local function FormatTimeAgo(ts)
        local d = time() - (ts or 0)
        if d < 60 then
            return string.format("|cff00ff00(%d秒前)|r", d)
        elseif d < 3600 then
            return string.format("|cff00ff00(%d分钟前)|r", math.floor(d / 60))
        elseif d < 86400 then
            return string.format("|cff00ff00(%d小时前)|r", math.floor(d / 3600))
        else
            return string.format("|cff00ff00(%d天前)|r", math.floor(d / 86400))
        end
    end

    local RECENT_ROW_HEIGHT = 38
    local ICON_SIZE = 32
    local recentRows = {}
    function RefreshRecentSearchRows(autoFillFirstItem)
        if type(EasyAuctionDB.RecentSearch) ~= "table" then
            EasyAuctionDB.RecentSearch = {}
        end
        for _, row in ipairs(recentRows) do row:Hide() end
        local RECENT_MAX_SHOW = 10
        local total = math.min(#EasyAuctionDB.RecentSearch, RECENT_MAX_SHOW)
        for i = 1, total do
            local info = EasyAuctionDB.RecentSearch[i]
            local row = recentRows[i]
            if not row then
                row = CreateFrame("Button", nil, rcScrollChild1)
                row:SetSize(rcScrollChild1:GetWidth(), RECENT_ROW_HEIGHT)
                row.bg = row:CreateTexture(nil, "BACKGROUND")
                row.bg:SetAllPoints()
                if i % 2 == 1 then
                    row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
                else
                    row.bg:SetColorTexture(1, 1, 1, 0.1)
                end
                row.highlight = row:CreateTexture(nil, "HIGHLIGHT")
                row.highlight:SetAllPoints()
                row.highlight:SetColorTexture(1, 1, 1, 0.09)
                row.icon = row:CreateTexture(nil, "ARTWORK")
                row.icon:SetSize(ICON_SIZE, ICON_SIZE)
                row.icon:SetPoint("LEFT", 6, 0)
                row.iconBorder = row:CreateTexture(nil, "OVERLAY")
                row.iconBorder:SetPoint("CENTER", row.icon, "CENTER")
                row.iconBorder:SetSize(ICON_SIZE + 4, ICON_SIZE + 4)
                row.name = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                row.name:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                row.name:SetPoint("LEFT", row.icon, "RIGHT", 5, 0)
                row.name:SetJustifyH("LEFT")
                row.name:SetWidth(130)
                row.price = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                row.price:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                row.price:SetPoint("LEFT", row.name, "RIGHT", -5, 8)
                row.price:SetWidth(120)
                row.price:SetJustifyH("RIGHT")
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetText("走势")
                row.trendBtn:SetNormalFontObject(GameFontNormalSmall)
                row.trendBtn:SetHighlightFontObject(GameFontHighlightSmall)
                row.time = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                row.time:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                row.time:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -5, 5)
                recentRows[i] = row
            end


            local name, _, quality, _, _, _, _, maxStack, _, icon = GetItemInfo(info.itemID)
            local price = nil
            local key = name and info.itemID and (name .. ":" .. info.itemID) or name
            if key and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key] then
                local history = EasyAuctionDB.PriceHistory[key]
                if #history > 0 and history[1].unit then
                    price = history[1].unit
                end
            end

            local color = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
            row.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
            row.name:SetText(name or info.name)
            row.name:SetTextColor(color.r, color.g, color.b)
            if price and price > 0 then
                row.price:SetText(GetCoinTextureString(price))
            else
                row.price:SetText("|cff888888无在售|r")
            end
            row.time:SetText(FormatTimeAgo(info.time))
            row.iconBorder:SetTexture("Interface\\AddOns\\EasyAuction\\border.blp")
            row.iconBorder:SetVertexColor(color.r, color.g, color.b, 0.9)
            row.trendBtn:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -65, 1)
            row.trendBtn:SetScript("OnClick", function()
                local itemKey = (name or info.name) .. ":" .. info.itemID
                EasyAuction_ShowChart(itemKey)
            end)
            row:SetPoint("TOPLEFT", rcScrollChild1, "TOPLEFT", -5, -((i - 1) * RECENT_ROW_HEIGHT))
            row:Show()
            row:SetScript("OnEnter", function(self)
                if self.bg then self.bg:SetColorTexture(0.68, 0.83, 1, 0.2) end
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:ClearLines()
                GameTooltip:SetItemByID(info.itemID)
                GameTooltip:AddLine("左键点击：复制名称", 1, 1, 1)
                GameTooltip:AddLine("右键点击：|cff00ff00添加至常用|r", 0, 1, 0)
                GameTooltip:Show()
            end)
            row:SetScript("OnLeave", function(self)
                if self.bg then
                    if i % 2 == 1 then
                        self.bg:SetColorTexture(0.96, 0.98, 1, 0.2)
                    else
                        self.bg:SetColorTexture(1, 1, 1, 0.1)
                    end
                end
                GameTooltip:Hide()
            end)
            row:SetScript("OnMouseUp", function(self, btn)
                if btn == "RightButton" then
                    AddFavoriteItem(info.itemID, name or info.name, info.price, info.time)
                    RefreshFavoriteRows()
                    print("|cff00ff00已添加到常用物品|r")
                elseif btn == "LeftButton" then
                    EasyAuction_ShowCopyBox("\"" .. (name or info.name) .. "\"")
                end
            end)
        end
        rcScrollChild1:SetHeight(total * RECENT_ROW_HEIGHT)

        if total > 0 and autoFillFirstItem then
            local f = AuctionBar and AuctionBar.AuctionFrame
            local ItemButton = _G["EasyAuctionItemButton"]
            if f and ItemButton then
                if not ItemButton.itemID or ItemButton.isVirtual then
                    local first = EasyAuctionDB.RecentSearch[1]
                    if first and first.itemID and first.name then
                        ItemButton.itemID = first.itemID
                        ItemButton.isVirtual = true
                        local icon = GetItemIcon(first.itemID)
                        if icon then
                            SetItemButtonTexture(ItemButton, icon)
                            FixItemButtonIconSize(ItemButton, 40)
                        end
                        if f.ItemName then
                            f.ItemName:SetText(first.name)
                        end
                        if RefreshMinPriceLines then RefreshMinPriceLines(first.name, first.itemID) end
                    end
                else
                    local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
                    if name and itemID then
                        RefreshMinPriceLines(name, itemID)
                    end
                end
            end
        else
            -- 只在拍卖框已有物品时才刷新价格线，不自动填充物品
            local f = AuctionBar and AuctionBar.AuctionFrame
            local ItemButton = _G["EasyAuctionItemButton"]
            if f and ItemButton then
                if ItemButton.itemID and not ItemButton.isVirtual then
                    local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
                    if name and itemID then
                        RefreshMinPriceLines(name, itemID)
                    end
                end
            end
        end
    end

    rcScroll1:EnableMouseWheel(true)
    rcScroll1:SetScript("OnMouseWheel", function(self, delta)
        local bar = self.ScrollBar
        if bar then
            bar:SetValue(bar:GetValue() - delta * RECENT_ROW_HEIGHT * 2)
        end
    end)

    local FAVORITE_ROW_HEIGHT = 38
    local favoriteRows = {}
    function RefreshFavoriteRows()
        if type(EasyAuctionDB.FavoriteItems) ~= "table" then
            EasyAuctionDB.FavoriteItems = {}
        end
        for _, row in ipairs(favoriteRows) do row:Hide() end
        local items = {}
        for itemID, info in pairs(EasyAuctionDB.FavoriteItems) do
            table.insert(items, { itemID = itemID, info = info })
        end
        table.sort(items, function(a, b) return (a.info.time or 0) > (b.info.time or 0) end)
        local total = #items
        for i = 1, total do
            local entry = items[i]
            local info = entry.info
            local itemID = entry.itemID
            local row = favoriteRows[i]
            if not row then
                row = CreateFrame("Button", nil, rcScrollChild2)
                row:SetSize(rcScrollChild2:GetWidth(), FAVORITE_ROW_HEIGHT)
                row.bg = row:CreateTexture(nil, "BACKGROUND")
                row.bg:SetAllPoints()
                if i % 2 == 1 then
                    row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
                else
                    row.bg:SetColorTexture(1, 1, 1, 0.1)
                end
                row.highlight = row:CreateTexture(nil, "HIGHLIGHT")
                row.highlight:SetAllPoints()
                row.highlight:SetColorTexture(1, 1, 1, 0.09)
                row.icon = row:CreateTexture(nil, "ARTWORK")
                row.icon:SetSize(ICON_SIZE, ICON_SIZE)
                row.icon:SetPoint("LEFT", 6, 0)
                row.iconBorder = row:CreateTexture(nil, "OVERLAY")
                row.iconBorder:SetPoint("CENTER", row.icon, "CENTER")
                row.iconBorder:SetSize(ICON_SIZE + 4, ICON_SIZE + 4)
                row.name = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                row.name:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                row.name:SetPoint("LEFT", row.icon, "RIGHT", 5, 0)
                row.name:SetJustifyH("LEFT")
                row.name:SetWidth(130)
                row.price = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                row.price:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                row.price:SetPoint("LEFT", row.name, "RIGHT", -5, 8)
                row.price:SetWidth(120)
                row.price:SetJustifyH("RIGHT")
                row.time = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                row.time:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                row.time:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -5, 5)
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetText("走势")
                row.trendBtn:SetNormalFontObject(GameFontNormalSmall)
                row.trendBtn:SetHighlightFontObject(GameFontHighlightSmall)
                favoriteRows[i] = row
            end
            local name, _, quality, _, _, _, _, maxStack, _, icon = GetItemInfo(itemID)
            local price = nil
            local key = name and itemID and (name .. ":" .. itemID) or name
            if key and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key] then
                local history = EasyAuctionDB.PriceHistory[key]
                if #history > 0 and history[1].unit then
                    price = history[1].unit
                end
            end
            local color = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
            row.icon:SetTexture(icon or "Interface\\Icons\\INV_Misc_QuestionMark")
            row.name:SetText(name or info.name)
            row.name:SetTextColor(color.r, color.g, color.b)
            row.price:SetText(GetCoinTextureString(price or 0))
            row.time:SetText(FormatTimeAgo(info.time))
            row.iconBorder:SetTexture("Interface\\AddOns\\EasyAuction\\border.blp")
            row.iconBorder:SetVertexColor(color.r, color.g, color.b, 0.9)
            row.trendBtn:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -65, 1)
            row.trendBtn:SetScript("OnClick", function()
                local itemKey = (name or info.name) .. ":" .. itemID
                EasyAuction_ShowChart(itemKey)
            end)
            row:SetPoint("TOPLEFT", rcScrollChild2, "TOPLEFT", -5, -((i - 1) * FAVORITE_ROW_HEIGHT))
            row:Show()
            row:SetScript("OnEnter", function(self)
                if self.bg then self.bg:SetColorTexture(0.68, 0.83, 1, 0.2) end
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:ClearLines()
                GameTooltip:SetItemByID(itemID)
                GameTooltip:AddLine("左键点击：复制名称", 1, 1, 1)
                GameTooltip:AddLine("右键点击：|cffff5555移除|r", 1, 0.3, 0.3)
                GameTooltip:Show()
            end)
            row:SetScript("OnLeave", function(self)
                if self.bg then
                    if i % 2 == 1 then
                        self.bg:SetColorTexture(0.96, 0.98, 1, 0.2)
                    else
                        self.bg:SetColorTexture(1, 1, 1, 0.1)
                    end
                end
                GameTooltip:Hide()
            end)
            row:SetScript("OnMouseUp", function(self, btn)
                if btn == "RightButton" then
                    EasyAuctionDB.FavoriteItems[itemID] = nil
                    RefreshFavoriteRows()
                    print("|cffff2020已从常用物品移除|r")
                elseif btn == "LeftButton" then
                    EasyAuction_ShowCopyBox("\"" .. (name or info.name) .. "\"")
                end
            end)
        end
        rcScrollChild2:SetHeight(total * FAVORITE_ROW_HEIGHT)
    end

    rcScroll2:EnableMouseWheel(true)
    rcScroll2:SetScript("OnMouseWheel", function(self, delta)
        local bar = self.ScrollBar
        if bar then
            bar:SetValue(bar:GetValue() - delta * RECENT_ROW_HEIGHT * 2)
        end
    end)

    ShowRCTab(1)
    RefreshRecentSearchRows()
    RefreshFavoriteRows()

    local tabOtherPage = CreateFrame("Frame", nil, f)
    tabOtherPage:SetAllPoints(f)
    tabOtherPage:SetPoint("TOPLEFT", 0, 0)
    tabOtherPage:Hide()
    local function ClearAuctionVirtualItem()
        local f = AuctionBar and AuctionBar.AuctionFrame
        local ItemButton = _G["EasyAuctionItemButton"]
        if not f or not ItemButton then return end
        if ItemButton.isVirtual then
            ItemButton.itemID = nil
            ItemButton.isVirtual = nil
            SetItemButtonTexture(ItemButton, "")
            SetItemButtonCount(ItemButton, 0)
            SetItemButtonQuality(ItemButton, nil)
            RefreshMinPriceLines()
            if f.ItemName then f.ItemName:SetText("") end
        end
    end

    local function SetTabSelected(idx)
        EasyAuctionDB.LastActiveTab = idx
        for i, tab in ipairs({ tab1, tab2 }) do
            if i == idx then
                tab._bg:SetColorTexture(0.25, 0.25, 0.27, 1)
                tab._fs:SetTextColor(1, 1, 1)
                tabFlashSellPage:Hide()
                tabOtherPage:Show()
                if tab2 and i == 2 then
                    ClearAuctionVirtualItem()
                end
            else
                tab._bg:SetColorTexture(0.12, 0.10, 0.08, 0.92)
                tab._fs:SetTextColor(1, 0.82, 0)
                tabFlashSellPage:Show()
                tabOtherPage:Hide()
                if i == 1 then
                    local ItemButton = _G["EasyAuctionItemButton"]
                    if (not ItemButton) or (not ItemButton.itemID) then
                        if type(EasyAuction_UpdateInlineDistribution) == "function" then
                            EasyAuction_UpdateInlineDistribution(nil, nil)
                            UpdateTrendFrame(nil)
                        end
                    end
                end
            end
        end
    end

    tab1:SetScript("OnClick", function() SetTabSelected(1) end)
    tab2:SetScript("OnClick", function() SetTabSelected(2) end)
    SetTabSelected(EasyAuctionDB.LastActiveTab or 1)

    local fastFrame = CreateFrame("Frame", nil, tabOtherPage)
    fastFrame:SetSize(midX, midY)
    fastFrame:SetPoint("TOPLEFT", 0, 0)

    local openCfgBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    openCfgBtn:SetSize(70, 22)
    openCfgBtn:SetText("设  置")
    openCfgBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -10, -8)
    local ofontString = openCfgBtn:GetFontString()
    if ofontString then
        ofontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    end
    openCfgBtn:SetScript("OnClick", function()
        if EasyAuctionConfigFrame and EasyAuctionConfigFrame:IsShown() then
            EasyAuctionConfigFrame:Hide()
            return
        end
        if not EasyAuctionConfigFrame then
            CreateEasyAuctionConfigFrame(tabOtherPage)
        end
        EasyAuctionConfigFrame:Show()
    end)

    local lockBtn = CreateFrame("Button", nil, f)
    lockBtn:SetSize(30, 30)
    lockBtn:SetPoint("RIGHT", openCfgBtn, "LEFT", -4, 0)
    lockBtn.icon = lockBtn:CreateTexture(nil, "ARTWORK")
    lockBtn.icon:SetAllPoints()
    lockBtn:EnableMouse(true)
    lockBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if EasyAuctionDB.locked then
            GameTooltip:SetText("已锁定：固定在拍卖行右侧\n点击解锁后可拖动")
        else
            GameTooltip:SetText("已解锁：可自由拖动\n再次点击锁定并复位")
        end
        GameTooltip:Show()
    end)
    lockBtn:SetScript("OnLeave", GameTooltip_Hide)
    lockBtn:SetScript("OnClick", function()
        EasyAuctionDB.locked = not EasyAuctionDB.locked
        UpdateLockState()
    end)


    local historyBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    historyBtn:SetSize(70, 22)
    historyBtn:SetText("价格库")
    local historyBtnfont = historyBtn:GetFontString()
    if historyBtnfont then
        historyBtnfont:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    end
    historyBtn:SetPoint("TOPRIGHT", openCfgBtn, "BOTTOMRIGHT", 0, -4)
    historyBtn:SetScript("OnClick", function()
        if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() then
            EasyAuctionDBFrame:Hide()
            return
        end
        if EasyAuctionDBFrame then
            EasyAuction_OpenDBFrame()
        end
    end)
    historyBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("打开拍卖价格数据库", 1, 1, 1)
        GameTooltip:Show()
    end)
    historyBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local scanBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    scanBtn:SetSize(70, 22)
    scanBtnfont = scanBtn:GetFontString()
    if scanBtnfont then
        scanBtnfont:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    end
    scanBtn:SetPoint("TOPRIGHT", historyBtn, "BOTTOMRIGHT", 0, -4)
    scanBtn:SetScript("OnClick", function()
        StaticPopup_Show("EASYAUCTION_SCANALL_CONFIRM")
        UpdateScanBtnState()
        UpdateAuctionQueryStatusText()
    end)
    scanBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("扫描全服拍卖价格", 1, 1, 1)
        GameTooltip:Show()
    end)
    scanBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local function UpdateLockBtnVisual()
        if EasyAuctionDB.locked then
            lockBtn.icon:SetTexture("Interface\\BUTTONS\\LockButton-Locked-Up.blp")
        else
            lockBtn.icon:SetTexture("Interface\\BUTTONS\\LockButton-Unlocked-Up.blp")
        end
    end

    local function SaveCustomPosition()
        if not f then return end
        local point, relativeTo, relativePoint, x, y = f:GetPoint()
        EasyAuctionDB.customPos = {
            point = point,
            relativeTo = relativeTo and relativeTo:GetName() or "UIParent",
            relativePoint =
                relativePoint,
            x = x,
            y = y
        }
    end

    local function RestoreCustomPosition()
        if not f then return end
        local pos = EasyAuctionDB.customPos
        if pos and not EasyAuctionDB.locked then
            f:ClearAllPoints()
            f:SetPoint(pos.point or "TOPLEFT", pos.relativeTo or "UIParent", pos.relativePoint or "TOPLEFT", pos.x or 0,
                pos.y or 0)
        end
    end

    function UpdateLockState()
        UpdateLockBtnVisual()
        if EasyAuctionDB.locked then
            f:SetMovable(false)
            f:EnableMouse(false)
            f:ClearAllPoints()
            f:SetPoint("TOPLEFT", AuctionFrame, "TOPRIGHT", 0, -10)
        else
            f:SetMovable(true)
            f:EnableMouse(true)
            RestoreCustomPosition()
        end
    end

    function UpdateScanBtnState()
        if not scanBtn then return end
        if IsScanningAll then
            scanBtn:SetText("扫描中...")
            scanBtn:SetEnabled(false)
            return
        end
        local canQuery, canQueryAll = CanSendAuctionQuery()
        scanBtn:SetText("全量扫描")
        scanBtn:SetEnabled(canQueryAll)
    end

    UpdateScanBtnState()
    scanBtn:HookScript("OnEnter", function(self)
        if not self:IsEnabled() then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine("全局扫描需返回角色大厅", 1, 0.82, 0)
            GameTooltip:AddLine("当前不可用，请到主城或大厅再试。", 1, 1, 1)
            GameTooltip:Show()
        end
    end)
    scanBtn:HookScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local scanBtnTicker
    if scanBtnTicker then
        scanBtnTicker:Cancel()
    end
    scanBtnTicker = C_Timer.NewTicker(0.5, function()
        UpdateScanBtnState()
        UpdateAuctionQueryStatusText()
    end)

    local inventoryBtn = CreateFrame("Button", nil, tabFlashSellPage, "UIPanelButtonTemplate")
    inventoryBtn:SetSize(70, 22)
    inventoryBtn:SetText("待售库存")
    inventoryBtn:SetPoint("TOPRIGHT", scanBtn, "BOTTOMRIGHT", 0, -4)
    local ifontString = inventoryBtn:GetFontString()
    if ifontString then
        ifontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    end
    inventoryBtn:SetScript("OnClick", function()
        if itemsFrame then
            local show = not itemsFrame:IsShown()
            itemsFrame:SetShown(show)
            EasyAuctionDB.showSections.items = show
            if show and type(itemsFrame.RefreshBagItemFrame) == "function" then
                itemsFrame:RefreshBagItemFrame()
            end
        end
    end)
    inventoryBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("查看待售库存", 1, 1, 1)
        GameTooltip:AddLine("显示背包中可拍卖物品", 0.9, 0.9, 0.9)
        GameTooltip:Show()
    end)
    inventoryBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local minimalToggleBtn = CreateFrame("Button", nil, tabFlashSellPage, "UIPanelButtonTemplate")
    minimalToggleBtn:SetSize(70, 22)
    minimalToggleBtn:SetPoint("TOPRIGHT", inventoryBtn, "BOTTOMRIGHT", 0, -4)
    local fontString = minimalToggleBtn:GetFontString()
    if fontString then
        fontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    end

    local function IsMinimalAddonMode()
        for i = 1, C_AddOns.GetNumAddOns() do
            local name = C_AddOns.GetAddOnInfo(i)
            if name and name ~= "EasyAuction" and not name:find("^Blizzard_") then
                if C_AddOns.GetAddOnEnableState(UnitName("player"), name) > 0 then
                    return false
                end
            end
        end
        return true
    end

    function RefreshMinimalToggleBtn()
        if IsMinimalAddonMode() then
            minimalToggleBtn:SetText("恢复配置")
            minimalToggleBtn:SetEnabled(true)
            minimalToggleBtn:SetAlpha(1.0)
            minimalToggleBtn.tooltipText =
                "恢复插件加载时的所有插件启用状态。\n\n" ..
                "如遇拍卖行报错，可先用极简配置排查插件冲突。"
        else
            minimalToggleBtn:SetText("极简模式")
            minimalToggleBtn:SetEnabled(true)
            minimalToggleBtn:SetAlpha(1.0)
            minimalToggleBtn.tooltipText =
                "禁用除EasyAuction以外的所有插件。\n\n" ..
                "用于排查拍卖行界面出错或卡顿（常因其他插件冲突导致）。\n\n" ..
                "|cff00ff00使用极简模式后，可随时点击“恢复配置”恢复原有插件状态。|r\n\n" ..
                "如恢复配置后仍有报错，可联系作者反馈。"
        end
    end

    minimalToggleBtn:SetScript("OnClick", function()
        if IsMinimalAddonMode() then
            StaticPopupDialogs["EASYAUCTION_RESTORE_CONFIRM"] = {
                text = "将恢复插件加载时的所有插件状态，确定继续？",
                button1 = "确定",
                button2 = "取消",
                OnAccept = function()
                    EasyAuction_RestoreAddon()
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            StaticPopup_Show("EASYAUCTION_RESTORE_CONFIRM")
        else
            StaticPopupDialogs["EASYAUCTION_MINIMAL_CONFIRM"] = {
                text = "将禁用除EasyAuction以外的所有插件，确定继续？",
                button1 = "确定",
                button2 = "取消",
                OnAccept = function()
                    EasyAuction_SetMinimalAddon()
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            StaticPopup_Show("EASYAUCTION_MINIMAL_CONFIRM")
        end
    end)
    minimalToggleBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(self.tooltipText or "")
        GameTooltip:Show()
    end)
    minimalToggleBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local opHistoryBtn = CreateFrame("Button", nil, tabFlashSellPage, "UIPanelButtonTemplate")
    opHistoryBtn:SetSize(70, 22)
    opHistoryBtn:SetText("交易记录")
    opHistoryBtn:SetPoint("TOPRIGHT", minimalToggleBtn, "BOTTOMRIGHT", 0, -4)
    opHistoryBtn:SetScript("OnClick", function()
        EasyAuction_ShowOperationHistory()
    end)
    opHistoryBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("查看每次购买/拍卖记录", 1, 1, 1)
        GameTooltip:Show()
    end)
    opHistoryBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    RefreshMinimalToggleBtn()

    local auctionQueryStatusFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    auctionQueryStatusFS:SetPoint("RIGHT", f, "RIGHT", 45, 50)
    auctionQueryStatusFS:SetWidth(180)
    auctionQueryStatusFS:SetJustifyH("CENTER")
    auctionQueryStatusFS:SetText("搜索状态：")

    function UpdateAuctionQueryStatusText()
        local canQuery, canQueryAll = CanSendAuctionQuery()
        local g = canQueryAll and "|cff00ff00可用|r" or "|cffff2020不可用|r"
        local s = canQuery and "|cff00ff00可用|r" or "|cffff2020不可用|r"
        auctionQueryStatusFS:SetText(
            "\n全局：" .. g .. "\n单体：" .. s
        )
    end

    local ItemButton = CreateFrame("Button", "EasyAuctionItemButton", f, "ItemButtonTemplate")
    ItemButton:SetSize(40, 40)
    ItemButton:SetPoint("TOPLEFT", 10, -10)
    SetItemButtonTexture(ItemButton, "")
    SetItemButtonCount(ItemButton, 0)
    SetItemButtonQuality(ItemButton, nil)

    ItemButton:SetScript("OnEnter", function(self)
        if self.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetItemByID(self.itemID)
            GameTooltip:Show()
        end
    end)
    ItemButton:SetScript("OnLeave", GameTooltip_Hide)
    ItemButton:SetScript("OnReceiveDrag", function(self)
        if CursorHasItem() then
            ClickAuctionSellItemButton()
            ClearCursor()
            FixItemButtonIconSize(self, 40)
        end
    end)
    ItemButton:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" and CursorHasItem() then
            ClickAuctionSellItemButton()
            ClearCursor()
            FixItemButtonIconSize(self, 40)
        elseif button == "RightButton" then
            self.itemID = nil
            SetItemButtonTexture(self, "")
            SetItemButtonCount(self, 0)
            SetItemButtonQuality(self, nil)
            FixItemButtonIconSize(self, 40)
            if f.ItemName then f.ItemName:SetText("") end
            f.UnitGold:SetNumber(0)
            f.UnitSilver:SetNumber(0)
            f.UnitCopper:SetNumber(0)
            f.StackGold:SetNumber(0)
            f.StackSilver:SetNumber(0)
            f.StackCopper:SetNumber(0)
            f.StackCount:SetNumber(1)
            f.NumStacks:SetNumber(1)
            if EasyAuction_UpdateInlineDistribution then
                EasyAuction_UpdateInlineDistribution(nil, nil)
                UpdateTrendFrame(nil)
            end
            RefreshMinPriceLines()
            -- 取消所有按钮高亮
            if _G.EA_ItemButtons and type(_G.EA_ItemButtons) == "table" then
                for _, b in ipairs(_G.EA_ItemButtons) do
                    if b.selectedBorder then b.selectedBorder:Hide() end
                end
            end
            AuctionBar._EA_SelectedItemID = nil
        end
    end)

    local itemNameBtn = CreateFrame("Button", nil, f)
    itemNameBtn:SetPoint("LEFT", ItemButton, "RIGHT", 10, 0)
    itemNameBtn:SetWidth(150)
    itemNameBtn:SetHeight(20)
    itemNameBtn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    f.ItemNameBtn = itemNameBtn

    local itemName = itemNameBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemName:SetPoint("LEFT")
    itemName:SetJustifyH("LEFT")
    itemName:SetAllPoints(itemNameBtn)
    itemNameBtn:SetFontString(itemName)
    itemName:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 16, "")
    f.ItemName = itemName

    itemNameBtn:SetScript("OnClick", function()
        local name = itemName:GetText() or ""
        if name ~= "" then
            if not (name:sub(1, 1) == "\"" and name:sub(-1) == "\"") then
                name = "\"" .. name .. "\""
            end
            EasyAuction_ShowCopyBox(name, itemNameBtn)
        end
    end)

    itemNameBtn:SetScript("OnEnter", function(self)
        if (itemName:GetText() or "") ~= "" then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("点击复制物品名称", 1, 1, 1)
            GameTooltip:AddLine("弹窗可Ctrl+C复制", 0.9, 0.9, 0.9)
            GameTooltip:Show()
        end
    end)
    itemNameBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    f.SetItemNameForCopy = function(self, text)
        itemName:SetText(text or "")
        if text and text ~= "" then
            itemNameBtn:Show()
        else
            itemNameBtn:Hide()
        end
    end

    local function AddMoneyEdit(parent, anchor, label, y, prefix)
        local labelFS = fastFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        labelFS:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, y)
        labelFS:SetText(label)
        labelFS:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 16, "")

        local editGold = CreateNumericBox(fastFrame, 50)
        editGold:SetPoint("LEFT", labelFS, "RIGHT", 4, 0)
        editGold:SetJustifyH("RIGHT")
        local iconGold = fastFrame:CreateTexture(nil, "ARTWORK")
        iconGold:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
        iconGold:SetSize(12, 12)
        iconGold:SetPoint("LEFT", editGold, "RIGHT", 2, 0)

        local editSilver = CreateNumericBox(fastFrame, 35)
        editSilver:SetPoint("LEFT", iconGold, "RIGHT", 2, 0)
        editSilver:SetJustifyH("RIGHT")
        local iconSilver = fastFrame:CreateTexture(nil, "ARTWORK")
        iconSilver:SetTexture("Interface\\MoneyFrame\\UI-SilverIcon")
        iconSilver:SetSize(12, 12)
        iconSilver:SetPoint("LEFT", editSilver, "RIGHT", 2, 0)

        local editCopper = CreateNumericBox(fastFrame, 35)
        editCopper:SetPoint("LEFT", iconSilver, "RIGHT", 2, 0)
        editCopper:SetJustifyH("RIGHT")
        local iconCopper = fastFrame:CreateTexture(nil, "ARTWORK")
        iconCopper:SetTexture("Interface\\MoneyFrame\\UI-CopperIcon")
        iconCopper:SetSize(12, 12)
        iconCopper:SetPoint("LEFT", editCopper, "RIGHT", 2, 0)

        f[prefix .. "Gold"] = editGold
        f[prefix .. "Silver"] = editSilver
        f[prefix .. "Copper"] = editCopper

        return labelFS, editGold, editSilver, editCopper
    end


    local unitLabel, unitGold, unitSilver, unitCopper = AddMoneyEdit(fastFrame, ItemButton, "一口(单)：", -5, "Unit")

    local bidLabel, bidGold, bidSilver, bidCopper = AddMoneyEdit(fastFrame, unitLabel, "起拍(总)：", -8, "Bid")
    f.BidGold:SetEnabled(false)
    f.BidSilver:SetEnabled(false)
    f.BidCopper:SetEnabled(false)
    local stackLabel, stackGold, stackSilver, stackCopper = AddMoneyEdit(fastFrame, unitLabel, "一口(总)：", -31, "Stack")

    local stackCountLabel = fastFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    stackCountLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 16, "")
    stackCountLabel:SetPoint("TOPLEFT", stackLabel, "BOTTOMLEFT", 0, -8)
    stackCountLabel:SetText("堆叠：")
    f.StackCount = CreateNumericBox(fastFrame, 35)
    f.StackCount:SetPoint("LEFT", stackCountLabel, "RIGHT", 4, 0)
    f.StackCount:SetJustifyH("RIGHT")

    local MaxStackCountBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
    MaxStackCountBtn.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    MaxStackCountBtn:SetSize(38, 20)
    MaxStackCountBtn:SetText("最大")
    MaxStackCountBtn:SetPoint("LEFT", f.StackCount, "RIGHT", 6, 0)
    MaxStackCountBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("|cffffd700最大|r")
        GameTooltip:AddLine("自动设置为单组能堆叠的最大数量", 1, 1, 1)
        GameTooltip:AddLine("比如最大堆叠是20，你背包有50个，会填20个一组，2组", 0.9, 0.9, 0.9)
        GameTooltip:Show()
    end)
    MaxStackCountBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local numStacksLabel = fastFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    numStacksLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 16, "")
    numStacksLabel:SetPoint("TOPLEFT", stackCountLabel, "BOTTOMLEFT", 0, -8)
    numStacksLabel:SetText("组数：")
    f.NumStacks = CreateNumericBox(fastFrame, 35)
    f.NumStacks:SetPoint("LEFT", numStacksLabel, "RIGHT", 4, 0)
    f.NumStacks:SetJustifyH("RIGHT")
    f.NumStacks:SetScript("OnTextChanged", function(self)
        if self:GetNumber() < 1 then
            self:SetNumber(1)
        end
        UpdateDepositMoney()
    end)

    local MaxNumStacksBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
    MaxNumStacksBtn.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    MaxNumStacksBtn:SetSize(38, 20)
    MaxNumStacksBtn:SetText("最多")
    MaxNumStacksBtn:SetPoint("LEFT", f.NumStacks, "RIGHT", 6, 0)
    MaxNumStacksBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("|cffffd700最多|r")
        GameTooltip:AddLine("根据当前的堆叠数，自动算出最多能分成多少组", 1, 1, 1)
        GameTooltip:AddLine("比如你填2个一组，背包有18个，会自动填9组", 0.9, 0.9, 0.9)
        GameTooltip:Show()
    end)
    MaxNumStacksBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local label = fastFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
    label:SetPoint("TOPLEFT", numStacksLabel, "BOTTOMLEFT", 0, -5)
    label:SetText("|cffffff00总保管费：|r")
    f.totalDepositMoneyLabel = label

    local profitLabel = fastFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    profitLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
    profitLabel:SetPoint("TOPLEFT", f.totalDepositMoneyLabel, "BOTTOMLEFT", 0, -5)
    profitLabel:SetText("|cff00ff00预计利润：|r")
    f.totalProfitLabel = profitLabel

    local startBtn = CreateFrame("Button", "EasyAuctionStartBtn", fastFrame, "UIPanelButtonTemplate")
    startBtn:SetPoint("LEFT", MaxNumStacksBtn, "RIGHT", 10, 0)
    startBtn:SetSize(95, 28)
    startBtn:SetText("开始拍卖")
    startBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("|cff00ff00左键：拍卖当前物品|r", 0.7, 1, 0.7)
        GameTooltip:AddLine("右键：复制拍卖宏命令", 1, 0.9, 0.2)
        GameTooltip:Show()
    end)
    startBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    local AuctionDurations = {
        { text = "12", value = 1 },
        { text = "24", value = 2 },
        { text = "48", value = 3 },
    }
    local durationBtns = {}
    local function SetAuctionDuration(val)
        SetSelectedDuration(val)
        for i, btn in ipairs(durationBtns) do
            btn:SetChecked(btn.value == val)
            UpdateDepositMoney()
        end
    end

    local prev = MaxStackCountBtn
    for i, v in ipairs(AuctionDurations) do
        local btn = CreateFrame("CheckButton", nil, fastFrame, "ChatConfigCheckButtonTemplate")
        btn:SetSize(22, 22)
        if i == 1 then
            btn:SetPoint("LEFT", prev, "RIGHT", 8, 2)
        else
            btn:SetPoint("LEFT", durationBtns[i - 1], "RIGHT", 14, 0)
        end
        btn.value = v.value
        btn.Text:SetText(v.text)
        btn.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
        btn:SetHitRectInsets(0, -(btn.Text:GetStringWidth() + 8), 0, 0)
        btn:SetChecked(EasyAuctionDB.auctionDuration == v.value)
        btn:SetScript("OnClick", function(self)
            SetAuctionDuration(self.value)
        end)
        table.insert(durationBtns, btn)
    end
    SetAuctionDuration(EasyAuctionDB.auctionDuration or 1)


    f.UnitGold:SetScript("OnTextChanged", function() UpdateStackPrice(f) end)
    f.UnitSilver:SetScript("OnTextChanged", function() UpdateStackPrice(f) end)
    f.UnitCopper:SetScript("OnTextChanged", function() UpdateStackPrice(f) end)

    f.StackCount:SetScript("OnTextChanged", function(self)
        local input = self:GetNumber()
        local name, _, _, _, _, _, _, maxStack, totalCount = GetAuctionSellItemInfo()
        local currentStack = select(8, GetAuctionSellItemInfo())
        if name and maxStack and totalCount then
            local limit = math.min(maxStack, totalCount, currentStack or maxStack)
            if input > limit then
                self:SetNumber(limit)
            elseif input < 1 then
                self:SetNumber(1)
            end
        else
            if input < 1 then
                self:SetNumber(1)
            end
        end
        UpdateStackPrice(f)
        UpdateDepositMoney()
        SetItemButtonCount(ItemButton, self:GetNumber() or 1)
    end)
    MaxStackCountBtn:SetScript("OnClick", function()
        local name, _, _, _, _, _, _, maxStack, totalCount = GetAuctionSellItemInfo()
        if name and maxStack and totalCount then
            local limit = math.min(maxStack, totalCount)
            f.StackCount:SetNumber(limit)
            local groups = math.floor(totalCount / limit)
            if groups < 1 then groups = 1 end
            f.NumStacks:SetNumber(groups)
        end
    end)
    MaxNumStacksBtn:SetScript("OnClick", function()
        local name, _, _, _, _, _, _, stackCount, totalCount = GetAuctionSellItemInfo()
        if name then
            local stackNum = f.StackCount:GetNumber()
            if stackNum < 1 then stackNum = 1 end
            local maxGroups = math.floor(totalCount / stackNum)
            if maxGroups < 1 then maxGroups = 1 end
            f.NumStacks:SetNumber(maxGroups)
        end
    end)

    function AutoSelectLeftoverItem(itemID)
        for bag = 0, NUM_BAG_SLOTS do
            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                local info = C_Container.GetContainerItemInfo(bag, slot)
                if info and info.itemID == itemID and info.stackCount and info.stackCount > 0 then
                    PickupAndPutToAuction(bag, slot)
                    -- 自动填充上次拍卖价格
                    if LastAuctionSold and LastAuctionSold.itemID == itemID and LastAuctionSold.unitPrice then
                        C_Timer.After(0.15, function()
                            local f = AuctionBar and AuctionBar.AuctionFrame
                            if f then
                                local price = LastAuctionSold.unitPrice
                                local ug = math.floor(price / 10000)
                                local us = math.floor((price % 10000) / 100)
                                local uc = price % 100
                                f.UnitGold:SetNumber(ug)
                                f.UnitSilver:SetNumber(us)
                                f.UnitCopper:SetNumber(uc)
                                UpdateStackPrice(f)
                            end
                        end)
                    end
                    return
                end
            end
        end
    end

    startBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    startBtn:SetScript("OnClick", function(self, btn)
        if btn == "RightButton" then
            -- 弹出复制框
            EasyAuction_ShowCopyBox("/click EasyAuctionStartBtn", self)
        else
            local name, _, _, _, _, _, _, stackCount, totalCount, itemID = GetAuctionSellItemInfo()
            if not name then
                print("|cffFF2020未放入拍卖物品！|r")
                return
            end
            local stackSize = f.StackCount:GetNumber()
            local numStacks = f.NumStacks:GetNumber()
            local unitPrice = (f.UnitGold:GetNumber() * 10000 + f.UnitSilver:GetNumber() * 100 + f.UnitCopper:GetNumber())
            local buyout = f.StackGold:GetNumber() * 10000 + f.StackSilver:GetNumber() * 100 + f.StackCopper:GetNumber()
            local minBid = f.BidGold:GetNumber() * 10000 + f.BidSilver:GetNumber() * 100 + f.BidCopper:GetNumber()
            local vendorPrice = select(11, GetItemInfo(itemID)) or 0

            local function ResetAuctionUI()
                if f.ItemName then f.ItemName:SetText("") end
                if ItemButton then
                    ItemButton.itemID = nil
                    SetItemButtonTexture(ItemButton, "")
                    SetItemButtonCount(ItemButton, 0)
                    SetItemButtonQuality(ItemButton, nil)
                end
                f.UnitGold:SetNumber(0)
                f.UnitSilver:SetNumber(0)
                f.UnitCopper:SetNumber(0)
                f.StackGold:SetNumber(0)
                f.StackSilver:SetNumber(0)
                f.StackCopper:SetNumber(0)
                f.StackCount:SetNumber(1)
                f.NumStacks:SetNumber(1)
                f.BidGold:SetNumber(0)
                f.BidSilver:SetNumber(0)
                f.BidCopper:SetNumber(0)
            end
            f.ResetAuctionUI = ResetAuctionUI

            if vendorPrice > 0 and (unitPrice - vendorPrice) < 0 then
                StaticPopupDialogs["EASYFRAME_LOW_PRICE"] = {
                    text = "警告：你的单价低于卖店价，确定要这样上架吗？",
                    button1 = "继续上架",
                    button2 = "取消",
                    OnAccept = function()
                        LastAuctionSold.name = name
                        LastAuctionSold.itemID = itemID
                        LastAuctionSold.unitPrice = unitPrice
                        PostAuction(minBid, buyout, GetSelectedDuration(), stackSize, numStacks, false)
                        print("|cff00ff00已发布拍卖：|r" .. name .. " x" .. numStacks)
                        table.insert(EasyAuctionDB.OperationHistory, {
                            time = time(),
                            op = "拍卖",
                            name = name,
                            price = buyout,
                            count = stackSize * numStacks,
                            itemID = itemID,
                        })
                        EA_pendingAutoNumStacks = numStacks - 1
                    end,
                    timeout = 0,
                    whileDead = true,
                    hideOnEscape = true,
                    preferredIndex = 3,
                }
                StaticPopup_Show("EASYFRAME_LOW_PRICE")
                return
            end
            local expireHours = 3
            local expireSeconds = expireHours * 3600

            local latestTime = 0
            local key = (name and itemID) and (name .. ":" .. itemID) or nil
            for _, v in ipairs(EasyAuctionDB.PriceHistory[key] or {}) do
                if v.t and v.t > latestTime then
                    latestTime = v.t
                end
            end
            local now = time()
            if latestTime > 0 and now - latestTime > expireSeconds then
                StaticPopupDialogs["EASYAUCTION_PRICE_EXPIRED"] = {
                    text = string.format(
                        "|cffff2020该物品的价格数据已超过|r|cffffd200%d小时|r|cffff2020未更新！|r\n\n请|cffffd200【搜索】|r获取最新价格。",
                        expireHours
                    ),
                    button1 = "继续上架",
                    button2 = "取消",
                    timeout = 0,
                    OnAccept = function()
                        LastAuctionSold.name = name
                        LastAuctionSold.itemID = itemID
                        LastAuctionSold.unitPrice = unitPrice
                        PostAuction(minBid, buyout, GetSelectedDuration(), stackSize, numStacks, false)
                        table.insert(EasyAuctionDB.OperationHistory, {
                            time = time(),
                            op = "拍卖",
                            name = name,
                            price = buyout,
                            count = stackSize * numStacks,
                            itemID = itemID,
                        })
                        print("|cff00ff00已发布拍卖：|r" .. name .. " x" .. numStacks)
                        EA_pendingAutoNumStacks = numStacks - 1
                    end,
                    whileDead = true,
                    hideOnEscape = true,
                    preferredIndex = 3,
                    OnShow = function(self)
                        self:ClearAllPoints()
                        if AuctionBar and AuctionBar.AuctionFrame then
                            self:SetPoint("CENTER", AuctionBar.AuctionFrame, "CENTER", 0, -80)
                        else
                            self:SetPoint("CENTER", UIParent, "CENTER", 0, -100)
                        end
                    end,
                }
                StaticPopup_Show("EASYAUCTION_PRICE_EXPIRED")
                return
            end
            LastAuctionSold.name = name
            LastAuctionSold.itemID = itemID
            LastAuctionSold.unitPrice = unitPrice
            LastAuctionSold.Progress = false
            PostAuction(minBid, buyout, GetSelectedDuration(), stackSize, numStacks, false)
            table.insert(EasyAuctionDB.OperationHistory, {
                time = time(),
                op = "拍卖",
                name = name,
                price = buyout,
                count = stackSize * numStacks,
                itemID = itemID,
            })
            print("|cff00ff00已发布拍卖：|r" .. name .. " x" .. numStacks)
            EA_pendingAutoNumStacks = numStacks
        end
    end)

    itemsFrame = CreateFrame("Frame", nil, f, "BackdropTemplate")
    itemsFrame:SetPoint("TOPLEFT", f, "TOPRIGHT", 0, 0)
    itemsFrame:SetWidth(320)
    itemsFrame:SetHeight(206)
    itemsFrame:SetShown(EasyAuctionDB.showSections.items ~= false)
    itemsFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    itemsFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    itemsFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    local itemsTitle = itemsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    itemsTitle:SetPoint("TOPLEFT", 10, -10)
    itemsTitle:SetText("待售库存")
    itemsTitle:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")

    local itemsScroll = CreateFrame("ScrollFrame", nil, itemsFrame, "UIPanelScrollFrameTemplate")
    itemsScroll:SetPoint("TOPLEFT", itemsFrame, "TOPLEFT", 0, -30)
    itemsScroll:SetPoint("BOTTOMRIGHT", itemsFrame, "BOTTOMRIGHT", -34, 10)

    local itemsScrollChild = CreateFrame("Frame", nil, itemsScroll)
    itemsScrollChild:SetWidth(itemsFrame:GetWidth() - 30)
    itemsScroll:SetScrollChild(itemsScrollChild)
    local ICON_SIZE, ICON_PADDING, ICONS_PER_ROW = 32, 7, 6
    local CATEGORY_LABEL_WIDTH = 35
    local CATEGORY_LABEL_PADDING = 10
    _G.EA_ItemButtons = _G.EA_ItemButtons or {}
    local itemButtons = _G.EA_ItemButtons
    local categoryHeaders = {}

    local function RefreshBagItemIcons()
        for _, btn in ipairs(itemButtons) do btn:Hide() end
        for _, hdr in pairs(categoryHeaders) do hdr:Hide() end

        local items = ScanBagAuctionableItems()
        local groups, order = CategorizeItems(items)
        local idx = 1
        local y = 0

        for _, cname in ipairs(order) do
            local groupItems = groups[cname]
            if #groupItems > 0 then
                local rows = math.ceil(#groupItems / ICONS_PER_ROW)
                local hdr = categoryHeaders[cname]
                if not hdr then
                    hdr = itemsScrollChild:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                    categoryHeaders[cname] = hdr
                end
                local showName = cname == "消耗品" and "消耗" or cname
                hdr:SetText("|cffffd200" .. showName .. "|r")
                hdr:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                hdr:ClearAllPoints()
                hdr:SetPoint("TOPLEFT", itemsScrollChild, "TOPLEFT", CATEGORY_LABEL_PADDING, -y - 6)
                hdr:Show()
                for i, item in ipairs(groupItems) do
                    local col = (i - 1) % ICONS_PER_ROW
                    local row = math.floor((i - 1) / ICONS_PER_ROW)
                    local btn = itemButtons[idx]
                    if not btn then
                        btn = CreateFrame("Button", nil, itemsScrollChild, "ItemButtonTemplate")
                        btn:SetSize(ICON_SIZE, ICON_SIZE)
                        itemButtons[idx] = btn
                    else
                        btn:SetParent(itemsScrollChild)
                    end
                    if not btn.selectedBorder then
                        btn.selectedBorder = btn:CreateTexture(nil, "OVERLAY")
                        btn.selectedBorder:SetPoint("TOPLEFT", btn, "TOPLEFT", -12, 12)
                        btn.selectedBorder:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 12, -12)
                        btn.selectedBorder:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
                        btn.selectedBorder:SetBlendMode("ADD")
                        btn.selectedBorder:SetVertexColor(0, 1, 0, 0.9)
                        btn.selectedBorder:Hide()
                    end
                    local iconX = CATEGORY_LABEL_WIDTH + CATEGORY_LABEL_PADDING + col * (ICON_SIZE + ICON_PADDING)
                    local iconY = -y - row * (ICON_SIZE + ICON_PADDING)
                    btn:SetPoint("TOPLEFT", itemsScrollChild, "TOPLEFT", iconX, iconY)
                    SetItemButtonTexture(btn, item.icon)
                    SetItemButtonCount(btn, item.count)
                    if item.quality and ITEM_QUALITY_COLORS[item.quality] then
                        SetItemButtonQuality(btn, item.quality, item.itemID)
                    end
                    btn.itemID = item.itemID
                    btn.bag = item.bag
                    btn.slot = item.slot
                    btn:Show()
                    btn:SetScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:ClearLines()
                        GameTooltip:SetBagItem(self.bag, self.slot)
                        GameTooltip:AddLine(" ")
                        GameTooltip:AddDoubleLine("|cffffff00左键|r", "复制物品名称")
                        GameTooltip:AddDoubleLine("|cffffff00右键|r", "放入拍卖栏（上架）")
                        GameTooltip:Show()
                    end)
                    btn:SetScript("OnLeave", GameTooltip_Hide)
                    btn:SetScript("OnLeave", GameTooltip_Hide)
                    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                    btn:SetScript("OnClick", function(self, button)
                        if button == "LeftButton" and EasyAuctionDB.enableAuctionListCopy then
                            local name = item.itemName or ""
                            EasyAuction_ShowCopyBox("\"" .. name .. "\"")
                        elseif button == "RightButton" then
                            -- 清空旧的虚拟填充
                            if ItemButton and ItemButton.isVirtual then
                                ItemButton.itemID = nil
                                ItemButton.isVirtual = nil
                                if ItemButton.SetNormalTexture then
                                    SetItemButtonTexture(ItemButton, "")
                                end
                                SetItemButtonCount(ItemButton, 0)
                                SetItemButtonQuality(ItemButton, nil)
                                if AuctionBar and AuctionBar.AuctionFrame and AuctionBar.AuctionFrame.ItemName then
                                    AuctionBar.AuctionFrame.ItemName:SetText("")
                                end
                            end
                            if ItemButton.itemID == self.itemID then return end
                            PickupAndPutToAuction(self.bag, self.slot)
                            RefreshMinPriceLines(item.itemName, item.itemID)

                            for _, b in ipairs(itemButtons) do
                                if b.selectedBorder then b.selectedBorder:Hide() end
                            end
                            if self.selectedBorder then self.selectedBorder:Show() end
                            AuctionBar._EA_SelectedItemID = self.itemID
                        end
                    end)
                    idx = idx + 1
                end
                y = y + rows * (ICON_SIZE + ICON_PADDING) + 6
            end
        end
        local curID = AuctionBar._EA_SelectedItemID
        for _, b in ipairs(itemButtons) do
            if curID and b.itemID == curID then
                if b.selectedBorder then b.selectedBorder:Show() end
            else
                if b.selectedBorder then b.selectedBorder:Hide() end
            end
        end
        itemsScrollChild:SetHeight(y + 10)
    end
    f.RefreshBagItemFrame = RefreshBagItemIcons

    local priceFrame = CreateFrame("Frame", "EasyFrame_PriceDistFrame", tabOtherPage, "BackdropTemplate")
    priceFrame:SetSize(320, 240)
    priceFrame:SetPoint("TOPLEFT", fastFrame, "BOTTOMLEFT", 0, -2)
    priceFrame:SetShown(EasyAuctionDB.showSections.price ~= false)
    priceFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    priceFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    priceFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    if not priceFrame.scroll then
        local scroll = CreateFrame("ScrollFrame", nil, priceFrame, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", priceFrame, "TOPLEFT", 5, -32)
        scroll:SetPoint("BOTTOMRIGHT", priceFrame, "BOTTOMRIGHT", -28, priceFrame:GetHeight() * 0.42)
        priceFrame.scroll = scroll

        local content = CreateFrame("Frame", nil, scroll)
        content:SetWidth(priceFrame:GetWidth() - 24)
        scroll:SetScrollChild(content)
        priceFrame.content = content
    end

    local trendFrame = CreateFrame("Frame", nil, priceFrame, BackdropTemplateMixin and "BackdropTemplate")
    trendFrame:SetPoint("TOPLEFT", priceFrame, "TOPLEFT", 0, -priceFrame:GetHeight() * 0.58)
    trendFrame:SetPoint("BOTTOMRIGHT", priceFrame, "BOTTOMRIGHT", 0, 0)
    priceFrame.trend = trendFrame
    if not trendFrame.scroll then
        local scroll = CreateFrame("ScrollFrame", nil, trendFrame, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", trendFrame, "TOPLEFT", 5, -32)
        scroll:SetPoint("BOTTOMRIGHT", trendFrame, "BOTTOMRIGHT", -28, 8)
        trendFrame.scroll = scroll

        local content = CreateFrame("Frame", nil, scroll)
        content:SetWidth(trendFrame:GetWidth() - 24)
        scroll:SetScrollChild(content)
        trendFrame.content = content
    else
        local scroll = trendFrame.scroll
        scroll:ClearAllPoints()
        scroll:SetPoint("TOPLEFT", trendFrame, "TOPLEFT", 5, -32)
        scroll:SetPoint("BOTTOMRIGHT", trendFrame, "BOTTOMRIGHT", -28, 8)
        local content = scroll:GetScrollChild()
        if content then
            content:SetWidth(trendFrame:GetWidth() - 24)
        end
    end

    local trendTitle = trendFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    trendTitle:SetPoint("TOPLEFT", trendFrame, "TOPLEFT", 10, -8)
    trendTitle:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
    trendFrame.title = trendTitle

    local function FormatDateText(d)
        local today = date("%Y-%m-%d")
        if d == today then
            return "今日"
        elseif d == "" then
            return "--"
        elseif d:find("^%d%d%d%d%-%d%d%-%d%d$") then
            local m, day = d:sub(6, 7), d:sub(9, 10)
            return string.format("%d月%d日", tonumber(m), tonumber(day))
        else
            return d
        end
    end

    function UpdateTrendFrame(itemName)
        local f = priceFrame.trend
        local scroll = f.scroll
        local content = f.content
        if not content.rows then content.rows = {} end
        for _, row in ipairs(content.rows) do for j = 1, 3 do if row[j] then row[j]:Hide() end end end
        if not itemName or not EasyAuctionDB.DailyMinPrice then
            if content.rows then
                for _, row in ipairs(content.rows) do
                    for j = 1, 3 do if row[j] then row[j]:Hide() end end
                end
            end
            if not f.nodataFS then
                f.nodataFS = content:CreateFontString(nil, "OVERLAY", "GameFontDisableLarge")
                f.nodataFS:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                f.nodataFS:SetPoint("TOPLEFT", content, "TOPLEFT", 24, 0)
                f.nodataFS:SetWidth(260)
                f.nodataFS:SetJustifyH("LEFT")
            end
            f.nodataFS:SetPoint("TOP", content, "TOP", 0, 0)
            f.nodataFS:SetJustifyH("CENTER")
            f.nodataFS:SetText("无数据")
            f.nodataFS:Show()
            return
        else
            if f.nodataFS then f.nodataFS:Hide() end
        end
        if not f.header then
            f.header = {}
            local headers = { "涨跌", "单价", "可购买", "日期" }
            for i = 1, 4 do
                local fs = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                fs:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                fs:SetText(headers[i])
                if i == 1 then
                    fs:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -8)
                    fs:SetWidth(40)
                    fs:SetJustifyH("RIGHT")
                elseif i == 2 then
                    fs:SetPoint("LEFT", f.header[1], "RIGHT", 5, 0)
                    fs:SetWidth(80)
                    fs:SetJustifyH("RIGHT")
                elseif i == 3 then
                    fs:SetPoint("LEFT", f.header[2], "RIGHT", 35, 0)
                    fs:SetWidth(48)
                    fs:SetJustifyH("CENTER")
                else
                    fs:SetPoint("LEFT", f.header[3], "RIGHT", 35, 0)
                    fs:SetWidth(120)
                    fs:SetJustifyH("LEFT")
                end
                f.header[i] = fs
            end
        end
        for i = 1, 4 do f.header[i]:Show() end
        EasyAuctionDB = EasyAuctionDB or {}
        EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}

        local itemid = nil
        do
            local id = tostring(itemName):match(":(%d+)$")
            if id then
                itemid = id
            else
                for key in pairs(EasyAuctionDB.DailyMinPrice) do
                    local name, id2 = tostring(key):match("^(.*):(%d+)$")
                    if name and id2 and tostring(name):gsub("%[", ""):gsub("%]", "") == itemName:gsub("%[", ""):gsub("%]", "") then
                        itemid = id2
                        break
                    end
                end
            end
        end

        local dailyArray = {}
        if itemid then
            for key, arr in pairs(EasyAuctionDB.DailyMinPrice) do
                local _, id = tostring(key):match("^(.*):(%d+)$")
                if id and id == tostring(itemid) then
                    for _, v in ipairs(arr) do
                        table.insert(dailyArray, v)
                    end
                end
            end
        else
            dailyArray = EasyAuctionDB.DailyMinPrice[itemName] or {}
        end

        local dayList = {}
        for _, v in ipairs(dailyArray) do
            if v[1] and v[2] and v[2] > 0 then
                dayList[v[1]] = true
            end
        end
        local dayArr = {}
        for d in pairs(dayList) do table.insert(dayArr, d) end
        table.sort(dayArr, function(a, b) return a > b end)
        local today = date("%Y-%m-%d")
        local sortedDays = {}

        local function findRecordByDay(day)
            local found
            for _, v in ipairs(dailyArray) do
                if v[1] == day then
                    if not found or (v[2] and v[2] < found[2]) then
                        found = v
                    end
                end
            end
            return found
        end

        if findRecordByDay(today) then
            table.insert(sortedDays, today)
        end

        for _, d in ipairs(dayArr) do
            if #sortedDays >= 7 then break end
            local exists = false
            for _, d2 in ipairs(sortedDays) do
                if d2 == d then exists = true end
            end
            if not exists then table.insert(sortedDays, d) end
        end
        while #sortedDays < 7 do table.insert(sortedDays, "") end

        local rowHeight = 20
        for i = 1, 7 do
            local d = sortedDays[i]
            local row = content.rows[i]
            if not row then
                row = {}
                row.bg = content:CreateTexture(nil, "BACKGROUND")
                row.bg:SetPoint("TOPLEFT", content, "TOPLEFT", 10, -(i - 1) * rowHeight)
                row.bg:SetPoint("BOTTOMRIGHT", content, "TOPRIGHT", 0, -i * rowHeight)
                if i % 2 == 1 then
                    row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
                else
                    row.bg:SetColorTexture(1, 1, 1, 0.1)
                end
                for j = 1, 4 do
                    row[j] = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                    row[j]:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                end
                row[1]:SetPoint("TOPLEFT", content, "TOPLEFT", 2, -(i - 1) * rowHeight)
                row[1]:SetWidth(50)
                row[1]:SetJustifyH("RIGHT")
                row[2]:SetPoint("LEFT", row[1], "RIGHT", 2, 0)
                row[2]:SetWidth(120)
                row[2]:SetJustifyH("RIGHT")
                row[3]:SetPoint("LEFT", row[2], "RIGHT", 2, 0)
                row[3]:SetWidth(50)
                row[3]:SetJustifyH("CENTER")
                row[4]:SetPoint("LEFT", row[3], "RIGHT", 2, 0)
                row[4]:SetWidth(80)
                row[4]:SetJustifyH("CENTER")
                content.rows[i] = row
            else
                if not row.bg then
                    row.bg = content:CreateTexture(nil, "BACKGROUND")
                end
                row.bg:SetPoint("TOPLEFT", content, "TOPLEFT", 10, -(i - 1) * rowHeight)
                row.bg:SetPoint("BOTTOMRIGHT", content, "TOPRIGHT", 0, -i * rowHeight)
                if i % 2 == 1 then
                    row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
                else
                    row.bg:SetColorTexture(1, 1, 1, 0.1)
                end
                row.bg:Show()
            end

            local priceStr, countStr, dateStr, percentStr = "--", "--", "--", "--"
            local curPrice = nil
            if d and d ~= "" then
                local v = findRecordByDay(d)
                if v then
                    -- v: {date, unit, count, min, max, totalCount}
                    local price = v[2] or 0
                    local qty   = v[3] or 0
                    priceStr    = price > 0 and GetMoneyString(price, true) or "--"
                    countStr    = qty > 0 and tostring(qty) or "--"
                    dateStr     = FormatDateText(d)
                    curPrice    = price
                end
            end

            local todayPrice = 0
            do
                local v = findRecordByDay(today)
                if v then
                    todayPrice = v[2] or 0
                end
            end

            if d == today then
                percentStr = "|cffffff00-|r"
            elseif curPrice and todayPrice and curPrice > 0 then
                local diff = todayPrice - curPrice
                local percent = diff / curPrice * 100
                if math.abs(percent) < 0.05 then
                    percentStr = "|cffffff00±0.0%|r"
                elseif percent > 0 then
                    percentStr = string.format("|cff00ff00+%.1f%%|r", percent)
                else
                    percentStr = string.format("|cffff5050%.1f%%|r", percent)
                end
            else
                percentStr = "--"
            end

            row[1]:SetText(percentStr)
            row[2]:SetText(priceStr)
            row[3]:SetText(countStr)
            row[4]:SetText(dateStr)
            for j = 1, 4 do row[j]:Show() end
        end
        content:SetHeight(7 * rowHeight + 10)
    end

    function EasyAuction_UpdateInlineDistribution(itemName, filteredData, highlightUnit)
        --print("DEBUG[分布] itemName=", itemName)
        local f = priceFrame
        local content = priceFrame.content
        f:Show()
        if content and not content:IsShown() then content:Show() end
        if not f.title then
            f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            f.title:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -10)
            f.title:Show()
        end
        if not f.trendBtn then
            f.trendBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            f.trendBtn:SetText("走势")
            f.trendBtn:SetSize(60, 22)
            f.trendBtn:SetPoint("LEFT", f.title, "RIGHT", 10, 0)
            f.trendBtn:Show()
        end
        if not f.summary then
            f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            f.summary:SetPoint("TOPRIGHT", f, "TOPRIGHT", -10, -10)
            f.summary:SetJustifyH("RIGHT")
            f.summary:SetWidth(f:GetWidth() - 20)
            f.summary:Show()
        end
        if not content.emptyTip then
            content.emptyTip = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            content.emptyTip:SetPoint("CENTER", content, "CENTER", 10, -30)
            content.emptyTip:SetTextColor(1, 0.85, 0.2, 1)
            content.emptyTip:SetJustifyH("CENTER")
            content.emptyTip:SetWidth(content:GetWidth() - 20)
            content.emptyTip:Show()
        end


        local stats, maxCount = {}, 0
        for _, v in ipairs(filteredData or {}) do
            if type(v) == "table" and tonumber(v.unit) then
                local unit = tonumber(v.unit)
                stats[unit] = (stats[unit] or 0) + (v.count or 1)
                if stats[unit] > maxCount then maxCount = stats[unit] end
            end
        end
        local statArr = {}
        for unit, count in pairs(stats) do
            table.insert(statArr, { unit = unit, count = count })
        end
        table.sort(statArr, function(a, b) return a.unit < b.unit end)

        -- -- ========== 调试输出 ==========
        -- print("DEBUG[分布] statArr size=", #statArr)
        -- for i, v in ipairs(statArr) do print("DEBUG[分布] statArr[",i,"]=", v.unit, v.count) end
        -- -- =================================

        if not itemName or #statArr == 0 then
            f.title:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
            f.title:SetText("|cffffffff价格分布|r")
            if content.rows then for i = 1, #content.rows do content.rows[i]:Hide() end end
            f.summary:Hide()
            if not content.emptyTip then
                content.emptyTip = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                content.emptyTip:SetPoint("CENTER", content, "CENTER", 10, -30)
                content.emptyTip:SetTextColor(1, 0.85, 0.2, 1)
                content.emptyTip:SetJustifyH("CENTER")
                content.emptyTip:SetWidth(content:GetWidth() - 20)
            end
            content.emptyTip:Show()
            content.emptyTip:SetText("|cffffee00无价格数据，点击|r|cffffd200【搜索】|r|cffffee00更新数据。|r")
            content:SetHeight(80)
            return
        else
            if content.emptyTip then content.emptyTip:Hide() end
        end

        f.title:SetText("|cffffffff本次价格分布|r")
        f.trendBtn:SetScript("OnClick", function()
            EasyAuction_ShowChart(itemName)
        end)
        local AMOUNT_AREA_WIDTH, ROW_HEIGHT = 120, 18
        local LEFT_PADDING, RIGHT_PADDING, GAP1, GAP2, BAR_HEIGHT = 4, 8, 6, 1, 13

        local rowFont, rowFontSize, rowFontFlags = GameFontHighlightSmall:GetFont()
        local maxCountWidth = 0
        for _, v in ipairs(statArr) do
            local tempFS = content.tempFS or content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            content.tempFS = tempFS
            tempFS:SetFont(rowFont, rowFontSize, rowFontFlags)
            tempFS:SetText("|cffffde00" .. v.count .. "|r")
            local w = tempFS:GetStringWidth()
            if w > maxCountWidth then maxCountWidth = w end
        end
        maxCountWidth = maxCountWidth + GAP2

        local totalWidth = content:GetWidth()
        local barMaxWidth = totalWidth - LEFT_PADDING - RIGHT_PADDING - AMOUNT_AREA_WIDTH - GAP1 - maxCountWidth
        if barMaxWidth < 16 then barMaxWidth = 16 end

        content.rows = content.rows or {}
        if not content.lastHighlightRow then
            content.lastHighlightRow = nil
        end
        if not content._lastItemName then
            content._lastItemName = nil
        end
        if content._lastItemName ~= itemName then
            if content.lastHighlightRow and content.lastHighlightRow.highlight then
                content.lastHighlightRow.highlight:Hide()
            end
            content.lastHighlightRow = nil
            content._lastItemName = itemName
        end
        for idx, v in ipairs(statArr) do
            local row = content.rows[idx]
            if not row then
                row = CreateFrame("Button", nil, content)
                row:SetSize(totalWidth, ROW_HEIGHT)
                -- icon
                local font, size, flags = GameFontHighlightSmall:GetFont()
                row.icon = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                row.icon:SetFont(font, 12, flags)
                row.icon:SetJustifyH("RIGHT")
                row.icon:SetWidth(AMOUNT_AREA_WIDTH)
                row.icon:SetPoint("LEFT", row, "LEFT", LEFT_PADDING, 0)
                row.icon:SetPoint("TOP", row, "TOP", 0, 0)
                -- bar
                row.bar = row:CreateTexture(nil, "ARTWORK")
                row.bar:SetHeight(BAR_HEIGHT)
                -- count
                row.count = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                row.count:SetFont(font, 12, flags)
                row.count:SetJustifyH("LEFT")
                -- 背景
                row.bg = content:CreateTexture(nil, "BACKGROUND")
                -- 高亮
                row.highlight = row:CreateTexture(nil, "ARTWORK")
                row.highlight:SetAllPoints()
                row.highlight:SetColorTexture(0.1, 0.8, 1, 0.3)
                row.highlight:Hide()
                content.rows[idx] = row
            end

            row.bg:SetPoint("TOPLEFT", content, "TOPLEFT", 10, -(idx - 1) * ROW_HEIGHT)
            row.bg:SetPoint("BOTTOMRIGHT", content, "TOPRIGHT", 0, -idx * ROW_HEIGHT)
            if idx % 2 == 1 then
                row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
            else
                row.bg:SetColorTexture(1, 1, 1, 0.1)
            end
            row.bg:Show()

            row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -(idx - 1) * ROW_HEIGHT)
            row.icon:SetText(FormatGoldIcon(v.unit, 12))
            row.icon:SetWidth(AMOUNT_AREA_WIDTH)
            row.icon:SetJustifyH("RIGHT")
            row.icon:SetPoint("LEFT", row, "LEFT", LEFT_PADDING, 0)
            row.icon:SetPoint("TOP", row, "TOP", 0, 0)

            local barLen = 1
            if maxCount > 0 then
                if maxCount == 1 then
                    barLen = math.floor(barMaxWidth * 0.5 + 0.5)
                else
                    barLen = math.floor(v.count / maxCount * barMaxWidth + 0.5)
                    if barLen < 8 then barLen = 8 end
                end
            end
            row.bar:SetPoint("LEFT", row.icon, "RIGHT", GAP1, 0)
            row.bar:SetWidth(barLen)
            row.bar:SetColorTexture(0, 0.8, 0, 1)
            row.bar:Show()

            row.count:SetText("|cffffde00" .. v.count .. "|r")
            row.count:SetWidth(maxCountWidth)
            row.count:SetPoint("LEFT", row.bar, "RIGHT", GAP2, 0)
            row.count:SetJustifyH("LEFT")
            row.count:Show()

            row:EnableMouse(true)
            row:SetScript("OnClick", function(self)
                local price = v.unit
                local ug, us, uc = SplitCopper(price)
                local mainFrame = AuctionBar and AuctionBar.AuctionFrame
                if mainFrame then
                    mainFrame.UnitGold:SetNumber(ug)
                    mainFrame.UnitSilver:SetNumber(us)
                    mainFrame.UnitCopper:SetNumber(uc)
                    UpdateStackPrice(mainFrame)
                    MyAH_AutoFillPrice()
                end
                if content.lastHighlightRow and content.lastHighlightRow ~= self then
                    if content.lastHighlightRow.highlight then content.lastHighlightRow.highlight:Hide() end
                end
                if self.highlight then self.highlight:Show() end
                content.lastHighlightRow = self
            end)

            row:SetScript("OnEnter", function(self)
                local price = v.unit
                local gold, silver, copper = SplitCopper(price)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:ClearLines()
                local priceStr = ""
                if gold > 0 then
                    priceStr = priceStr .. gold .. "|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t"
                end
                if silver > 0 or gold > 0 then
                    priceStr = priceStr .. silver .. "|TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0|t"
                end
                priceStr = priceStr .. copper .. "|TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0|t"
                GameTooltip:AddLine("价格：" .. priceStr, 1, 1, 1)
                GameTooltip:AddLine("|cff00ff00点击：使用此价填入一口价(单)|r", 0.2, 1, 0.2)
                GameTooltip:Show()
            end)
            row:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
            local id = tostring(itemName):match(":(%d+)$")
            local lastID = tostring(LastAuctionSold.itemID)
            if highlightUnit and v.unit == highlightUnit then
                if row.highlight then row.highlight:Show() end
                content.lastHighlightRow = row
            else
                if row.highlight then row.highlight:Hide() end
            end

            row:Show()
        end
        for i = #statArr + 1, #(content.rows or {}) do if content.rows[i] then content.rows[i]:Hide() end end

        local totalHeight = #statArr * ROW_HEIGHT + 8
        content:SetHeight(math.max(totalHeight, priceFrame:GetHeight() - 60))
        local totalCount = 0
        for _, v in ipairs(statArr) do totalCount = totalCount + v.count end
        table.sort(statArr, function(a, b) return a.count > b.count end)
        local top3 = {}
        for i = 1, math.min(3, #statArr) do
            local v = statArr[i]
            local percent = totalCount > 0 and v.count / totalCount * 100 or 0
            table.insert(top3, string.format("%s (%.1f%%)", FormatGoldIcon(v.unit, 10), percent))
        end
        f.summary:SetText(string.format("|cffffee00统计数：%d|r", totalCount))
        f.summary:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
        f.summary:Show()
        if priceFrame and priceFrame.trend then
            UpdateTrendFrame(itemName)
        end
    end

    if not f.MyAuctionListFrame then
        local myAuctionFrame = CreateFrame("Frame", nil, tabOtherPage, "BackdropTemplate")
        myAuctionFrame:SetSize(320, 240)
        myAuctionFrame:SetPoint("TOPLEFT", priceFrame, "TOPRIGHT", 0, 0)
        myAuctionFrame:EnableMouse(true)
        myAuctionFrame:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 18,
            insets = { left = 6, right = 6, top = 6, bottom = 6 }
        })
        myAuctionFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
        myAuctionFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
        myAuctionFrame:Show()
        f.MyAuctionListFrame = myAuctionFrame
        if f.MyAuctionListFrame then
            f.MyAuctionListFrame:SetShown(EasyAuctionDB.showSections.myauct ~= false)
        end
        local title = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        title:SetPoint("TOPLEFT", 10, -10)
        title:SetText("在售列表")
        title:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
        title:EnableMouse(true)
        title:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("在下方拍卖列表中，右键点击可取消该拍卖", 1, 1, 1)
            GameTooltip:Show()
        end)
        title:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)

        local totalLabel = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        totalLabel:SetPoint("TOPRIGHT", myAuctionFrame, "TOPRIGHT", -22, -10)
        totalLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
        totalLabel:SetJustifyH("RIGHT")
        totalLabel:SetWidth(220)
        myAuctionFrame.totalLabel = totalLabel

        local statusLabel = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        statusLabel:SetPoint("TOPRIGHT", totalLabel, "BOTTOMRIGHT", 0, -3)
        statusLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
        statusLabel:SetJustifyH("RIGHT")
        statusLabel:SetWidth(300)
        myAuctionFrame.statusLabel = statusLabel

        local scroll = CreateFrame("ScrollFrame", nil, myAuctionFrame, "FauxScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", myAuctionFrame, "TOPLEFT", 0, -20)
        scroll:SetPoint("BOTTOMRIGHT", myAuctionFrame, "BOTTOMRIGHT", -25, 0)
        myAuctionFrame.scroll = scroll
        scroll:SetScript("OnVerticalScroll", function(self, offset)
            FauxScrollFrame_OnVerticalScroll(self, offset, 18, function() f:RefreshMyAuctionList() end)
        end)
        local maxRows = 10
        myAuctionFrame.rows = {}
        for i = 1, maxRows do
            local row = CreateFrame("Button", nil, myAuctionFrame)
            row:SetSize(myAuctionFrame:GetWidth() - 20, 18)
            row:SetPoint("TOPLEFT", 4, -40 - (i - 1) * 19)
            row.nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.nameText:SetFont(row.nameText:GetFont(), 12, "")
            row.nameText:SetPoint("LEFT", 4, 0)
            row.nameText:SetWidth(130)
            row.nameText:SetJustifyH("LEFT")
            row.nameText:SetWordWrap(false)
            row.priceText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.priceText:SetFont(row.priceText:GetFont(), 12, "")
            row.priceText:SetPoint("LEFT", row.nameText, "RIGHT", 8, 0)
            row.priceText:SetWidth(120)
            row.priceText:SetJustifyH("RIGHT")
            row.durationText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.durationText:SetFont(row.durationText:GetFont(), 12, "")
            row.durationText:SetPoint("LEFT", row.priceText, "RIGHT", 8, 0)
            row.durationText:SetWidth(60)
            row.durationText:SetJustifyH("CENTER")
            row.bg = row:CreateTexture(nil, "BACKGROUND")
            row.bg:SetAllPoints()
            row.bg:SetColorTexture(1, 1, 1, (i % 2 == 0) and 0.05 or 0.10)
            row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
            row:SetScript("OnMouseUp", function(self, btn)
                if btn == "RightButton" and self.auctionIndex then
                    CancelAuction(self.auctionIndex)
                    f:RefreshMyAuctionList()
                end
            end)
            row:SetScript("OnEnter", function(self)
                self.bg:SetColorTexture(0.3, 0.6, 1, 0.18)
                if self.link then
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetHyperlink(self.link)
                    GameTooltip:AddLine("右键取消该拍卖", 1, 0.6, 0.2)
                    GameTooltip:Show()
                end
            end)
            row:SetScript("OnLeave", function(self)
                row.bg:SetColorTexture(1, 1, 1, (i % 2 == 0) and 0.05 or 0.10)
                GameTooltip:Hide()
            end)
            myAuctionFrame.rows[i] = row
        end
    end

    local sectionBtnSize, sectionBtnGap = 70, 4
    local sectionBtnHeight = 22
    local firstBtnTopOffset = -30
    local sectionNames = {
        { key = "items", label = "待售库存" },
        { key = "myauct", label = "在售列表" },
        { key = "price", label = "价格分布" },
    }
    local sectionBtns = {}
    EasyAuctionDB.showSections = EasyAuctionDB.showSections or {}
    local defaultSections = { items = true, price = true, myauct = true }
    for k, v in pairs(defaultSections) do
        if EasyAuctionDB.showSections[k] == nil then
            if k == "price" then
                EasyAuctionDB.showSections[k] = true
            else
                EasyAuctionDB.showSections[k] = v
            end
        end
    end
    local HIGHLIGHT_TEXTURE = "Interface\\Buttons\\UI-Panel-Button-Highlight"

    for i, data in ipairs(sectionNames) do
        local btn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
        btn:SetSize(sectionBtnSize, sectionBtnHeight)
        btn:SetText(data.label)
        local fontString = btn:GetFontString()
        if fontString then
            fontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 14, "")
        end

        btn:SetPoint("TOPRIGHT", scanBtn, "BOTTOMRIGHT", 0, firstBtnTopOffset - (i - 2) *
            (sectionBtnGap + sectionBtnHeight))

        if not btn.grayMask then
            btn.grayMask = btn:CreateTexture(nil, "OVERLAY")
            btn.grayMask:SetAllPoints(btn)
            btn.grayMask:SetColorTexture(0.15, 0.15, 0.15, 0.7)
            btn.grayMask:Hide()
        end

        local function UpdateBtnVisual()
            if EasyAuctionDB.showSections[data.key] then
                btn:SetHighlightTexture(HIGHLIGHT_TEXTURE)
                if fontString then fontString:SetTextColor(1, 0.82, 0, 1) end
                btn.grayMask:Hide()
            else
                btn:SetHighlightTexture(HIGHLIGHT_TEXTURE)
                if fontString then fontString:SetTextColor(0.5, 0.5, 0.5, 1) end
                btn.grayMask:Show()
            end
        end

        btn:SetScript("OnClick", function(self)
            local val = not EasyAuctionDB.showSections[data.key]
            EasyAuctionDB.showSections[data.key] = val
            if data.key == "items" then
                itemsFrame:SetShown(val)
            elseif data.key == "price" then
                priceFrame:SetShown(val)
            elseif data.key == "myauct" then
                if f.MyAuctionListFrame then f.MyAuctionListFrame:SetShown(val) end
            end
            UpdateBtnVisual()
        end)
        UpdateBtnVisual()
    end

    local function utf8sub(str, startChar, numChars)
        local startIndex = 1
        while startChar > 1 do
            local char = string.byte(str, startIndex)
            if char >= 240 then
                startIndex = startIndex + 4
            elseif char >= 224 then
                startIndex = startIndex + 3
            elseif char >= 192 then
                startIndex = startIndex + 2
            else
                startIndex = startIndex + 1
            end
            startChar = startChar - 1
        end
        local currentIndex = startIndex
        while numChars > 0 and currentIndex <= #str do
            local char = string.byte(str, currentIndex)
            if char >= 240 then
                currentIndex = currentIndex + 4
            elseif char >= 224 then
                currentIndex = currentIndex + 3
            elseif char >= 192 then
                currentIndex = currentIndex + 2
            else
                currentIndex = currentIndex + 1
            end
            numChars = numChars - 1
        end
        return str:sub(1, currentIndex - 1)
    end

    local function TruncateNameAndKeepCount(fs, name, count, maxWidth)
        local qtyStr = " x" .. count
        fs:SetText(name .. qtyStr)
        if fs:GetStringWidth() <= maxWidth then
            return name .. qtyStr
        end
        local len = strlenutf8(name)
        for i = len, 1, -1 do
            local truncName = utf8sub(name, 1, i)
            local newText = truncName .. "…" .. qtyStr
            fs:SetText(newText)
            if fs:GetStringWidth() <= maxWidth then
                return newText
            end
        end
        return "…" .. qtyStr
    end

    local function GetShortMoneyString(money, maxWidth)
        local s = GetMoneyString(money, true)
        local temp = UIParent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        temp:SetText(s)
        if temp:GetStringWidth() <= maxWidth then
            temp:Hide()
            return s
        end

        local gold = floor(money / (COPPER_PER_GOLD))
        local silver = floor((money - gold * COPPER_PER_GOLD) / COPPER_PER_SILVER)
        local s2 = ""
        if gold > 0 then
            s2 = s2 .. ("%s|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t"):format(gold)
        end
        if silver > 0 or gold > 0 then
            s2 = s2 .. ("%s|TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0|t"):format(silver)
        end
        temp:SetText(s2)
        if temp:GetStringWidth() <= maxWidth then
            temp:Hide()
            return s2
        end

        s2 = ("%s|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t"):format(gold)
        temp:SetText(s2)
        temp:Hide()
        return s2
    end

    function f:RefreshMyAuctionList()
        local myAuctionFrame = self.MyAuctionListFrame
        if not myAuctionFrame then return end
        local num = GetNumAuctionItems("owner")
        local maxRows = #myAuctionFrame.rows
        local scroll = myAuctionFrame.scroll
        local offset = FauxScrollFrame_GetOffset(scroll)
        FauxScrollFrame_Update(scroll, num, maxRows, 18)

        local totalBuyout = 0
        local soldBuyout = 0
        for idx = 1, num do
            local _, _, count, _, _, _, _, _, _, buyoutPrice, _, _, _, _, _, saleStatus = GetAuctionItemInfo("owner", idx)

            if buyoutPrice and buyoutPrice > 0 then
                if saleStatus == 1 then
                    soldBuyout = soldBuyout + buyoutPrice
                else
                    totalBuyout = totalBuyout + buyoutPrice
                end
            end
        end
        local sum = totalBuyout + soldBuyout

        for i = 1, maxRows do
            local idx = offset + i
            local row = myAuctionFrame.rows[i]
            if idx <= num then
                local res = { GetAuctionItemInfo("owner", idx) }
                local name = res[1]
                local count = tonumber(res[3]) or 0
                local buyout = tonumber(res[10]) or 0
                local buyer = res[12] or ""
                if count == 0 and buyer ~= "" then
                    local displayCount      = tonumber(res[4]) or 1
                    local nameCountStr      = TruncateNameAndKeepCount(row.nameText, name or "?", displayCount, 200)
                    local grayColor         = "|cffbbbbbb"
                    local qtyColor          = "|cffffff00"
                    local soldIcon          = "|TInterface\\Icons\\classic_temp:16:16:0:-2|t"
                    local itemName, itemQty = string.match(nameCountStr, "^(.-)( x%d+)$")
                    if not itemName then
                        itemName = nameCountStr; itemQty = ""
                    end
                    local nameShow = string.format("%s%s|r%s%s|r %s|cffff8800已售出|r", grayColor, itemName, qtyColor,
                        itemQty, soldIcon)
                    row.nameText:SetWidth(200)
                    row.nameText:SetText(nameShow)
                    row.priceText:SetText("")
                    row.durationText:SetText("")
                    row.link = GetAuctionItemLink("owner", idx)
                    row.auctionIndex = nil
                    row:Show()
                elseif count > 0 and buyout > 0 then
                    row.nameText:SetWidth(90)
                    local nameColor         = "|cffffffff"
                    local qtyColor          = "|cffffff00"
                    local nameCountStr      = TruncateNameAndKeepCount(row.nameText, name or "?", count, 90)
                    local itemName, itemQty = string.match(nameCountStr, "^(.-)( x%d+)$")
                    if not itemName then
                        itemName = nameCountStr; itemQty = ""
                    end
                    local nameShow = string.format("%s%s|r%s%s|r", nameColor, itemName, qtyColor, itemQty)
                    row.nameText:SetText(nameShow)
                    local price = buyout / count
                    local priceStr = GetShortMoneyString(price, 110)
                    local timeLeft = GetAuctionItemTimeLeft("owner", idx)
                    local durationStr = ""
                    if timeLeft == 1 then
                        durationStr = "|cffff8800<30分钟|r"
                    elseif timeLeft == 2 then
                        durationStr = "|cff00ff002小时|r"
                    elseif timeLeft == 3 then
                        durationStr = "|cff00bfff12小时|r"
                    elseif timeLeft == 4 then
                        durationStr = "|cffffff0048小时|r"
                    end
                    row.priceText:SetText(priceStr)
                    row.durationText:SetText(durationStr)
                    row.link = GetAuctionItemLink("owner", idx)
                    row.auctionIndex = idx
                    row:Show()
                else
                    row:Hide()
                end
            else
                row:Hide()
                row.link = nil
                row.auctionIndex = nil
            end
        end

        if myAuctionFrame.totalLabel then
            myAuctionFrame.totalLabel:SetText("|cffffd100总额：|r" .. GetCoinTextureString(sum))
        end
        if myAuctionFrame.statusLabel then
            myAuctionFrame.statusLabel:SetText("|cffff5050未售：|r" ..
                GetCoinTextureString(totalBuyout) .. "   |cff00ff00已售：|r" .. GetCoinTextureString(soldBuyout))
        end
    end

    -- 公用：分析一个 itemID 的历史价格，返回分析表
    local function AnalyzeAuctionHistory(itemID)
        -- 取出该物品所有价格历史记录（合并所有 key:xxx:itemID 相关的v）
        local history = {}
        if EasyAuctionDB and EasyAuctionDB.PriceHistory then
            for k, v in pairs(EasyAuctionDB.PriceHistory) do
                if k:match(":%d+$") == ":" .. tostring(itemID) then
                    if type(v) == "table" then
                        for _, vv in ipairs(v) do
                            if type(vv) == "table" then
                                table.insert(history, vv)
                            end
                        end
                    end
                end
            end
        end

        -- 过滤出最近120秒内的记录
        local maxTimestamp = 0
        for _, v in ipairs(history) do
            if v.t and v.t > maxTimestamp then
                maxTimestamp = v.t
            end
        end
        local timeThreshold = maxTimestamp - 120
        local filtered = {}
        for _, v in ipairs(history) do
            if v.unit and v.t and v.t >= timeThreshold then
                table.insert(filtered, v)
            end
        end
        -- fallback：如没有则退一步查近60秒
        if #filtered == 0 and #history > 0 then
            local fallbackThreshold = maxTimestamp - 60
            for _, v in ipairs(history) do
                if v.unit and v.t and v.t >= fallbackThreshold then
                    table.insert(filtered, v)
                end
            end
        end

        -- 统计分布和最小单价
        local stats, minUnit = {}, nil
        for _, v in ipairs(filtered) do
            local unit = tonumber(v.unit)
            if unit then
                stats[unit] = (stats[unit] or 0) + (v.count or 1)
                if not minUnit or unit < minUnit then
                    minUnit = unit
                end
            end
        end

        return {
            filtered = filtered, -- 过滤后的表
            stats = stats,       -- 单价分布
            minUnit = minUnit,   -- 最低价
            maxTimestamp = maxTimestamp,
        }
    end

    local function AutoFillPrice()
        local name, _, _, _, _, _, _, stackCount, totalCount, itemID = GetAuctionSellItemInfo()
        if not name or not itemID then return end

        local _, _, quality = GetItemInfo(itemID)
        local r, g, b = 1, 1, 1
        if quality then
            r, g, b = GetItemQualityColor(quality)
        end
        local historyInfo = {}
        local stats = {}
        local histUnit = nil
        local classID = select(12, GetItemInfo(itemID))
        if classID == 2 or classID == 4 then
            historyInfo = AnalyzeAuctionHistory(itemID)
            stats = historyInfo.stats
            histUnit = historyInfo.minUnit
        else
            local key = name .. ":" .. (itemID or "0")
            local hist = EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
            if hist and #hist > 0 then
                histUnit = hist[1].unit
                for _, v in ipairs(hist) do
                    if v.unit < histUnit then histUnit = v.unit end
                end
            end
            historyInfo.filtered = {}
            if not hist or type(hist) ~= "table" or #hist == 0 then
                local actualItemID = nil
                if type(itemName) == "string" and itemName:find(":") then
                    local _, parsedID = string.match(itemName, "^(.+):(%d+)$")
                    if parsedID then
                        actualItemID = tonumber(parsedID)
                        --print("DEBUG[分布] fallback actualItemID=", actualItemID)
                    end
                end
                if actualItemID then
                    for k, v in pairs(EasyAuctionDB.PriceHistory or {}) do
                        if k:match(":(%d+)$") == tostring(actualItemID) and type(v) == "table" and #v > 0 then
                            hist = v
                            --print("DEBUG[分布] fallback matched key:", k, "size:", #v)
                            break
                        end
                    end
                end
            end

            if type(hist) == "table" and (#hist > 0 or hist[1]) then
                historyInfo.filtered = hist
            elseif type(hist) == "table" then
                for _, v in pairs(hist) do
                    if type(v) == "table" and v.unit then
                        table.insert(historyInfo.filtered, v)
                    end
                end
            end
        end


        local vendorPrice = select(11, GetItemInfo(itemID)) or 0
        local useStack, useNumStacks = GetAutoFillFlashSellCounts(stackCount, totalCount)
        f.StackCount:SetNumber(useStack)
        f.NumStacks:SetNumber(useNumStacks)

        local unitPrice
        if EasyAuctionDB.autoFillLastAuction
            and LastAuctionSold.name == name
            and LastAuctionSold.itemID == itemID
            and LastAuctionSold.unitPrice then
            unitPrice = LastAuctionSold.unitPrice
        elseif histUnit then
            unitPrice = histUnit
        else
            unitPrice = math.max(vendorPrice * 5, 1)
        end

        local ug, us, uc = SplitCopper(unitPrice)
        f.UnitGold:SetNumber(ug)
        f.UnitSilver:SetNumber(us)
        f.UnitCopper:SetNumber(uc)

        if f.ItemName then
            local colorStr = ("|cff%02x%02x%02x%s|r"):format(r * 255, g * 255, b * 255, name)
            f.ItemName:SetText(colorStr)
        end
        if ItemButton and ItemButton.SetNormalTexture then
            local icon = GetItemIcon(itemID)
            if icon then
                SetItemButtonTexture(ItemButton, icon)
                FixItemButtonIconSize(ItemButton, 40)
            end
            ItemButton.itemID = itemID
            SetItemButtonCount(ItemButton, f.StackCount:GetNumber() or 1)
        end
        UpdateStackPrice(f)
        UpdateDepositMoney()
        MyAH_AutoFillPrice()
        if EasyAuction_UpdateInlineDistribution then
            local key = (name and itemID) and (name .. ":" .. itemID) or nil
            if key then
                if EasyAuctionDB.autoFillLastAuction and LastAuctionSold.unitPrice then
                    EasyAuction_UpdateInlineDistribution(key, historyInfo.filtered, LastAuctionSold.unitPrice)
                else
                    EasyAuction_UpdateInlineDistribution(key, historyInfo.filtered, histUnit)
                end
                UpdateTrendFrame(key)
            else
                EasyAuction_UpdateInlineDistribution(nil, nil, nil)
                UpdateTrendFrame(nil)
            end
        end
    end
    ns.AutoFillPrice = AutoFillPrice

    f:RegisterEvent("BAG_UPDATE")
    f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    f:RegisterEvent("NEW_AUCTION_UPDATE")
    f:RegisterEvent("AUCTION_HOUSE_SHOW")
    f:RegisterEvent("AUCTION_OWNED_LIST_UPDATE")
    f:SetScript("OnEvent", function(self, event)
        if event == "AUCTION_ITEM_LIST_UPDATE" or event == "NEW_AUCTION_UPDATE" or event == "AUCTION_HOUSE_SHOW" then
            if IsScanningAll then return end
            self:RefreshBagItemFrame()
            self:RefreshMyAuctionList()
            UpdateScanBtnState()
            AutoFillPrice()
            SetAuctionDuration(EasyAuctionDB.auctionDuration or 1)
        elseif event == "BAG_UPDATE" then
            self:RefreshBagItemFrame()
        elseif event == "AUCTION_OWNED_LIST_UPDATE" then
            self:RefreshBagItemFrame()
            self:RefreshMyAuctionList()
        end
    end)
    if f.MyAuctionListFrame then
        f.MyAuctionListFrame:SetScript("OnShow", function() f:RefreshMyAuctionList() end)
    end
    itemsFrame:SetScript("OnShow", function() f:RefreshBagItemFrame() end)
    f:HookScript("OnShow", function()
        f:RefreshBagItemFrame()
        f:RefreshMyAuctionList()
        ApplyEasyAuctionUIScale()
    end)
    AuctionBar.AuctionFrame = f
    UpdateLockState()
    ApplyEasyAuctionUIScale()
end

function EasyAuction_CreateSellPanelButton()
    local btn = CreateFrame("Button", "EasyAuctionSellPanelButton", AuctionFrame, "UIPanelButtonTemplate")
    btn:SetSize(120, 22)
    local BuyoutCheckButton = _G["EasyAuctionBuyoutCheckButton"]
    if BuyoutCheckButton then
        btn:SetPoint("BOTTOMLEFT", BuyoutCheckButton, "TOPLEFT", -80, 4)
    else
        btn:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 0, -32)
    end
    btn:SetText("EasyAuction")
    btn:SetNormalFontObject(GameFontHighlightSmall)
    btn:SetHighlightFontObject(GameFontHighlightSmall)

    if not btn.icon then
        btn.icon = btn:CreateTexture(nil, "OVERLAY")
        btn.icon:SetSize(14, 14)
        btn.icon:SetPoint("LEFT", btn, "LEFT", 6, 0)
        btn.icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
    end

    local fontString = btn:GetFontString()
    if fontString then
        fontString:ClearAllPoints()
        fontString:SetPoint("LEFT", btn.icon, "RIGHT", 4, 0)
    end

    btn:SetScript("OnClick", function(self)
        if AuctionBar and AuctionBar.AuctionFrame then
            if AuctionBar.AuctionFrame:IsShown() then
                AuctionBar.AuctionFrame:Hide()
                EasyAuctionDB.SellPanel = false
            else
                AuctionBar.AuctionFrame:Show()
                EasyAuctionDB.SellPanel = true
            end
        end
    end)
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if AuctionBar and AuctionBar.AuctionFrame and AuctionBar.AuctionFrame:IsShown() then
            GameTooltip:SetText("点击关闭闪卖面板", 0, 1, 0)
        else
            GameTooltip:SetText("点击打开闪卖面板", 1, 1, 1)
        end
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("AUCTION_HOUSE_SHOW")
eventFrame:SetScript("OnEvent", function(_, event)
    if event == "AUCTION_HOUSE_SHOW" then
        CreateAuctionSide()
        RefreshMinimalToggleBtn()
        EasyAuction_SessionBuyStats = {}
        RefreshMinPriceLines()
        RefreshRecentSearchRows()
        RefreshFavoriteRows()
        if AuctionBar.AuctionFrame then
            if EasyAuctionDB.SellPanel then
                AuctionBar.AuctionFrame:Show()
            else
                AuctionBar.AuctionFrame:Hide()
            end
        end
        if AuctionFrame and AuctionFrame.selectedTab == 3 then
            for i = 1, NUM_AUCTIONS_TO_DISPLAY do
                local btn = _G["AuctionsButton" .. i]
                if btn and not btn.__EasyAuction_RightClickRegistered then
                    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                    btn:HookScript("OnClick", function(self, button)
                        if button == "RightButton" then
                            local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame)
                            local index = offset + i
                            local saleStatus = select(16, GetAuctionItemInfo("owner", index))
                            if saleStatus ~= 1 then
                                CancelAuction(index)
                            end
                        end
                    end)
                    btn:HookScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:AddLine("右键取消该拍卖", 1, 0.6, 0.2)
                        GameTooltip:Show()
                    end)
                    btn:HookScript("OnLeave", function(self)
                        GameTooltip:Hide()
                    end)
                    btn.__EasyAuction_RightClickRegistered = true
                end
            end
        end
    end
end)

hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", function(self, button)
    if button == "LeftButton" and IsShiftKeyDown() and AuctionFrame and AuctionFrame:IsShown() then
        local bag, slot = self:GetParent():GetID(), self:GetID()
        PickupAndPutToAuction(bag, slot)
    end
end)

function EasyAuction_ClearSellPanelCache()
    if not (AuctionBar and AuctionBar.AuctionFrame) then return end
    local f = AuctionBar.AuctionFrame
    EasyAuction_SessionBuyStats = {}
    if f.ItemName then f.ItemName:SetText("") end
    if f.UnitGold then f.UnitGold:SetNumber(0) end
    if f.UnitSilver then f.UnitSilver:SetNumber(0) end
    if f.UnitCopper then f.UnitCopper:SetNumber(0) end
    if f.StackGold then f.StackGold:SetNumber(0) end
    if f.StackSilver then f.StackSilver:SetNumber(0) end
    if f.StackCopper then f.StackCopper:SetNumber(0) end
    if f.StackCount then f.StackCount:SetNumber(1) end
    if f.NumStacks then f.NumStacks:SetNumber(1) end
    if f.BidGold then f.BidGold:SetNumber(0) end
    if f.BidSilver then f.BidSilver:SetNumber(0) end
    if f.BidCopper then f.BidCopper:SetNumber(0) end

    local ItemButton = _G["EasyAuctionItemButton"]
    if ItemButton then
        ItemButton.itemID = nil
        ItemButton.isVirtual = nil
        if ItemButton.SetNormalTexture then
            SetItemButtonTexture(ItemButton, "")
        end
        SetItemButtonCount(ItemButton, 0)
        SetItemButtonQuality(ItemButton, nil)
    end

    if EasyAuction_UpdateInlineDistribution then
        EasyAuction_UpdateInlineDistribution(nil, nil)
        UpdateTrendFrame(nil)
    end
    RefreshMinPriceLines()
end

C_Timer.After(0.5, function()
    if AuctionBar and AuctionBar.AuctionFrame and not AuctionBar.AuctionFrame.__EasyAuction_HideHooked then
        AuctionBar.AuctionFrame:HookScript("OnHide", function(self)
            EasyAuction_ClearSellPanelCache()
        end)
        AuctionBar.AuctionFrame.__EasyAuction_HideHooked = true
    end
end)

local totalMultisell = 0
local doneMultisell = 0
local multiSellFrame = CreateFrame("Frame")
multiSellFrame:RegisterEvent("AUCTION_MULTISELL_UPDATE")
multiSellFrame:RegisterEvent("AUCTION_MULTISELL_START")
multiSellFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
multiSellFrame:RegisterEvent("NEW_AUCTION_UPDATE")
multiSellFrame:SetScript("OnEvent", function(self, event, current, total)
    local f = AuctionBar.AuctionFrame
    if event == "AUCTION_MULTISELL_START" then
        LastAuctionSold.Progress = true
    elseif event == "AUCTION_MULTISELL_UPDATE" then
        totalMultisell = total or 0
        doneMultisell = current or 0

        if totalMultisell > 0 and doneMultisell == totalMultisell then
            -- 拍卖结束时，自动处理剩余上架
            C_Timer.After(0.5, function()
                if LastAuctionSold.itemID and EA_pendingAutoNumStacks > 0 then
                    if f and f.ResetAuctionUI then f.ResetAuctionUI() end
                    EasyAuction_ClearSellPanelCache()
                    if f and f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
                    -- 检查背包是否还有物品
                    local found = false
                    for bag = 0, NUM_BAG_SLOTS do
                        for slot = 1, C_Container.GetContainerNumSlots(bag) do
                            local info = C_Container.GetContainerItemInfo(bag, slot)
                            if info and info.itemID == LastAuctionSold.itemID and info.stackCount and info.stackCount > 0 then
                                found = true
                                PickupAndPutToAuction(bag, slot)
                                print("|cff00ff00已填充上次物品：|r", LastAuctionSold.name, "x" .. info.stackCount)
                                
                                if LastAuctionSold and LastAuctionSold.itemID == LastAuctionSold.itemID and LastAuctionSold.unitPrice and EasyAuctionDB.autoFillLastAuction then
                                    print("|cff00ff00已填充上次价格：|r", FormatGoldIcon(LastAuctionSold.unitPrice))
                                    C_Timer.After(0.15, function()
                                        local f = AuctionBar and AuctionBar.AuctionFrame
                                        if f then
                                            local price = LastAuctionSold.unitPrice
                                            local ug = math.floor(price / 10000)
                                            local us = math.floor((price % 10000) / 100)
                                            local uc = price % 100
                                            f.UnitGold:SetNumber(ug)
                                            f.UnitSilver:SetNumber(us)
                                            f.UnitCopper:SetNumber(uc)
                                            local useStack, useNumStacks = GetAutoFillFlashSellCounts(
                                                info.stackCount,
                                                info.stackCount
                                            )
                                            f.StackCount:SetNumber(useStack)
                                            f.NumStacks:SetNumber(useNumStacks)
                                            UpdateStackPrice(f)
                                        end
                                    end)
                                end
                                break
                            end
                        end
                        if found then break end
                    end
                    if found then
                        -- 只减少一次
                        EA_pendingAutoNumStacks = EA_pendingAutoNumStacks - 1
                        --AutoSelectLeftoverItem(LastAuctionSold.itemID)
                        LastAuctionSold.Progress = true
                    else
                        if f and f.ResetAuctionUI then f.ResetAuctionUI() end
                        EasyAuction_ClearSellPanelCache()
                        if f and f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
                        EA_pendingAutoNumStacks = 0
                        LastAuctionSold.Progress = false
                    end
                end
            end)
        end
    elseif event == "NEW_AUCTION_UPDATE" then
        if not LastAuctionSold.Progress then
            if (totalMultisell == 0 or doneMultisell == 0) and f and f.ResetAuctionUI then
                C_Timer.After(0.5, function()
                    if LastAuctionSold.itemID and EA_pendingAutoNumStacks > 0 then
                        local found = false
                        for bag = 0, NUM_BAG_SLOTS do
                            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                                local info = C_Container.GetContainerItemInfo(bag, slot)
                                if info and info.itemID == LastAuctionSold.itemID and info.stackCount and info.stackCount > 0 then
                                    found = true
                                    PickupAndPutToAuction(bag, slot)
                                    print("|cff00ff00已填充上次物品：|r", LastAuctionSold.name, "x" .. info.stackCount)
                                    -- 自动填充上次拍卖价格
                                    if LastAuctionSold and LastAuctionSold.itemID == LastAuctionSold.itemID and LastAuctionSold.unitPrice and EasyAuctionDB.autoFillLastAuction then
                                        print("|cff00ff00已填充上次价格：|r", FormatGoldIcon(LastAuctionSold.unitPrice))
                                        C_Timer.After(0.15, function()
                                            local f = AuctionBar and AuctionBar.AuctionFrame
                                            if f then
                                                local price = LastAuctionSold.unitPrice
                                                local ug = math.floor(price / 10000)
                                                local us = math.floor((price % 10000) / 100)
                                                local uc = price % 100
                                                f.UnitGold:SetNumber(ug)
                                                f.UnitSilver:SetNumber(us)
                                                f.UnitCopper:SetNumber(uc)
                                                UpdateStackPrice(f)
                                            end
                                        end)
                                    end
                                    break
                                end
                            end
                            if found then break end
                        end
                        if found then
                            EA_pendingAutoNumStacks = EA_pendingAutoNumStacks - 1
                            LastAuctionSold.Progress = true
                        else
                            if f and f.ResetAuctionUI then f.ResetAuctionUI() end
                            EasyAuction_ClearSellPanelCache()
                            if f and f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
                            EA_pendingAutoNumStacks = 0
                            LastAuctionSold.Progress = false
                        end
                    end
                end)
            end
        end
        totalMultisell = 0
        doneMultisell = 0
    elseif event == "AUCTION_HOUSE_CLOSED" then
        totalMultisell = 0
        doneMultisell = 0
        EasyAuction_ClearSellPanelCache()
        if EasyAuctionCopyBox and EasyAuctionCopyBox:IsShown() then
            EasyAuctionCopyBox:Hide()
        end
    end
end)

if not AuctionBar.__EasyAuctionSellItemButtonHooked then
    local isInHook = false
    hooksecurefunc("ClickAuctionSellItemButton", function()
        if isInHook then return end
        isInHook = true
        C_Timer.After(0.05, function()
            local f = AuctionBar.AuctionFrame
            if f then
                if f.AutoFillPrice then f:AutoFillPrice() end
                if f.RefreshBagItemFrame then f:RefreshBagItemFrame() end
                if f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
                UpdateDepositMoney()
            end
            isInHook = false
        end)
        local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
        if name and itemID then
            RefreshMinPriceLines(name, itemID)
        end
    end)
    AuctionBar.__EasyAuctionSellItemButtonHooked = true
end

hooksecurefunc("PlaceAuctionBid", function(type, index, price)
    local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo(type, index)
    if itemID and count and price then
        LastBuyItemID = itemID
        LastBuyName = name
        LastBuyCount = count
        LastBuyUnitPrice = math.floor(price / count + 0.5)
    end
    if itemID and count and price then
        EasyAuctionDB.OperationHistory = EasyAuctionDB.OperationHistory or {}
        table.insert(EasyAuctionDB.OperationHistory, {
            time = time(),
            op = "购买",
            name = name,
            price = price,
            count = count,
            itemID = itemID,
        })
    end
end)

local patterns = {
    gsub(ERR_AUCTION_WON_S or "你赢得了对%s的竞标", "%%s", "(.+)"),
    gsub(ERR_AUCTION_WON_S or "你赢得了拍卖物品：%s。", "%%s", "(.+)"),
    "你赢得了对(.+)的竞标",
    "你赢得了拍卖物品：(.+)",
}

local buyEventFrame = CreateFrame("Frame")
buyEventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
buyEventFrame:SetScript("OnEvent", function(self, event, msg)
    if not msg then return end
    local wonName
    for _, pat in ipairs(patterns) do
        wonName = msg:match(pat)
        if wonName then break end
    end
    if wonName and LastBuyItemID and LastBuyName then
        local function stripColor(str)
            if not str then return "" end
            return str:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("%s+", "")
        end
        local s1, s2 = stripColor(LastBuyName), stripColor(wonName)
        if s1 == s2 or s1:find(s2, 1, true) or s2:find(s1, 1, true) then
            local stat = EasyAuction_SessionBuyStats[LastBuyItemID] or { sum = 0, num = 0 }
            stat.sum = stat.sum + (LastBuyUnitPrice or 0) * (LastBuyCount or 1)
            stat.num = stat.num + (LastBuyCount or 0)
            EasyAuction_SessionBuyStats[LastBuyItemID] = stat
            LastBuyItemID, LastBuyName, LastBuyCount, LastBuyUnitPrice = nil, nil, nil, nil
        end
    end
end)

local function EasyAuction_GetCopyBox()
    if not EasyAuctionCopyOverlay then
        EasyAuctionCopyOverlay = CreateFrame("Frame", "EasyAuctionCopyOverlay", UIParent)
        EasyAuctionCopyOverlay:SetAllPoints(UIParent)
        EasyAuctionCopyOverlay:SetFrameStrata("FULLSCREEN_DIALOG")
        EasyAuctionCopyOverlay:EnableMouse(true)
        EasyAuctionCopyOverlay:Hide()
        EasyAuctionCopyOverlay:SetScript("OnMouseDown", function(self)
            self:Hide()
            if EasyAuctionCopyBox then
                EasyAuctionCopyBox:Hide()
            end
        end)
    end

    if not EasyAuctionCopyBox then
        EasyAuctionCopyBox = CreateFrame("EditBox", "EasyAuctionCopyBox", UIParent, "InputBoxTemplate")
        EasyAuctionCopyBox:SetAutoFocus(true)
        EasyAuctionCopyBox:SetFontObject("GameFontHighlightSmall")
        EasyAuctionCopyBox:SetSize(160, 28)
        EasyAuctionCopyBox:SetFrameStrata("FULLSCREEN_DIALOG")
        EasyAuctionCopyBox:SetJustifyH("LEFT")
        EasyAuctionCopyBox:SetScript("OnEscapePressed", function(self)
            self:Hide()
            if EasyAuctionCopyOverlay then
                EasyAuctionCopyOverlay:Hide()
            end
        end)
        EasyAuctionCopyBox:SetScript("OnShow", function(self)
            self:HighlightText(0, -1)
            self:SetFocus()
        end)
        EasyAuctionCopyBox:SetScript("OnHide", function(self)
            if EasyAuctionCopyOverlay then
                EasyAuctionCopyOverlay:Hide()
            end
        end)
    end
    return EasyAuctionCopyBox
end

function EasyAuction_ShowCopyBox(text, anchor, x, y)
    local box = EasyAuction_GetCopyBox()
    if EasyAuctionCopyOverlay then
        EasyAuctionCopyOverlay:Show()
        box:SetFrameLevel(EasyAuctionCopyOverlay:GetFrameLevel() + 1)
    end
    box:ClearAllPoints()
    x = x or 0
    y = y or 0
    if anchor then
        box:SetPoint("CENTER", anchor, "CENTER", x, y)
    else
        local mx, my = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        box:SetPoint("CENTER", UIParent, "BOTTOMLEFT", mx / scale, my / scale)
    end
    box:SetText(text or "")
    box:Show()
    box:SetFocus()
    box:HighlightText(0, -1)
end

if not _G.EasyAuction_Favorite_GlobalFocusHooked then
    _G.EasyAuction_Favorite_GlobalFocusHooked = true
    WorldFrame:HookScript("OnMouseDown", function(_, btn)
        local f = _G.EasyAuctionFavoriteImportExportFrame
        if f and f:IsShown() and f.editBox and f.editBox:HasFocus() then
            local x, y = GetCursorPosition()
            local scale = f:GetEffectiveScale()
            x = x / scale
            y = y / scale
            local left = f:GetLeft()
            local right = f:GetRight()
            local bottom = f:GetBottom()
            local top = f:GetTop()
            if not (x >= left and x <= right and y >= bottom and y <= top) then
                f.editBox:ClearFocus()
            end
        end
    end)
end

function EasyAuction_ShowOperationHistory()
    if EasyAuction_OpHistoryFrame then
        EasyAuction_OpHistoryFrame:Show()
        if EasyAuction_OpHistoryFrame.Refresh then
            EasyAuction_OpHistoryFrame:Refresh()
        end
        return
    end

    local FRAME_WIDTH, FRAME_HEIGHT = 680, 420
    local ROW_HEIGHT = 24
    local HEADER_HEIGHT = 28
    local MAX_ROWS = 100

    local f = CreateFrame("Frame", "EasyAuction_OpHistoryFrame", UIParent, "BackdropTemplate")
    f:SetSize(FRAME_WIDTH, FRAME_HEIGHT)
    f:SetPoint("CENTER")
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    f:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    f:SetBackdropBorderColor(0.7, 0.6, 1, 1)
    tinsert(UISpecialFrames, "EasyAuction_OpHistoryFrame")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
    closeBtn:SetSize(26, 26)
    closeBtn:SetScript("OnClick", function() f:Hide() end)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 20, -16)
    title:SetText("|cffffd700历史操作记录|r")

    -- 累计金额显示
    local sumBuyFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sumBuyFS:SetPoint("TOPRIGHT", f, "TOPRIGHT", -40, -12)
    sumBuyFS:SetJustifyH("RIGHT")
    sumBuyFS:SetWidth(300)
    local sumSellFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    sumSellFS:SetPoint("TOPRIGHT", sumBuyFS, "BOTTOMRIGHT", 0, -2)
    sumSellFS:SetJustifyH("RIGHT")
    sumSellFS:SetWidth(300)

    -- 删除按钮
    local delBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    delBtn:SetSize(90, 24)
    delBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -15, 10)
    delBtn:SetText("删除所有记录")
    delBtn:SetScript("OnClick", function()
        StaticPopupDialogs["EASYAUCTION_CLEAR_OPHISTORY"] = {
            text = "确定要删除所有操作历史记录吗？\n此操作不可恢复！",
            button1 = "确定",
            button2 = "取消",
            OnAccept = function()
                EasyAuctionDB.OperationHistory = {}
                if f.Refresh then f:Refresh() end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show("EASYAUCTION_CLEAR_OPHISTORY")
    end)

    -- 字段头
    local headers     = { "时间", "操作", "物品名", "总价格", "数量" }
    local widths      = { 120, 60, 220, 100, 60 }
    local headerFrame = CreateFrame("Frame", nil, f)
    headerFrame:SetPoint("TOPLEFT", f, "TOPLEFT", 16, -48)
    headerFrame:SetSize(FRAME_WIDTH - 48, HEADER_HEIGHT)
    headerFrame.cells = {}
    local headx = 0
    for i = 1, #headers do
        local fs = headerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", headerFrame, "TOPLEFT", headx, -2)
        fs:SetWidth(widths[i])
        fs:SetText("|cffffd700" .. headers[i] .. "|r")
        headerFrame.cells[i] = fs
        headx = headx + widths[i] + 12
    end

    -- 滚动区域
    local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", f, "TOPLEFT", 16, -48 - HEADER_HEIGHT)
    scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -32, 48)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetWidth(FRAME_WIDTH - 60)
    scroll:SetScrollChild(content)
    f.scroll = scroll
    f.content = content

    -- 记录行
    content.rows = {}
    for i = 1, MAX_ROWS do
        local row = content.rows[i] or CreateFrame("Button", nil, content)
        row:SetSize(content:GetWidth(), ROW_HEIGHT)
        if i == 1 then
            row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, 0)
        else
            row:SetPoint("TOPLEFT", content.rows[i - 1], "BOTTOMLEFT", 0, 0)
        end
        -- 间隔背景
        if not row.bg then
            row.bg = row:CreateTexture(nil, "BACKGROUND")
            row.bg:SetDrawLayer("BACKGROUND", 0)
            row.bg:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
            row.bg:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", 0, 0)
        end
        if i % 2 == 1 then
            row.bg:SetColorTexture(0.94, 0.97, 1, 0.16)
        else
            row.bg:SetColorTexture(1, 1, 1, 0.07)
        end
        row.fs = row.fs or {}
        local xx = 0
        for j = 1, #headers do
            row.fs[j] = row.fs[j] or row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            row.fs[j]:SetPoint("LEFT", row, "LEFT", xx, 0)
            row.fs[j]:SetWidth(widths[j])
            if j == 1 or j == 3 then
                row.fs[j]:SetJustifyH("LEFT")
            elseif j == 4 then
                row.fs[j]:SetJustifyH("RIGHT")
            else
                row.fs[j]:SetJustifyH("CENTER")
            end
            xx = xx + widths[j] + 12
        end
        content.rows[i] = row
    end

    function f:Refresh()
        local ops = EasyAuctionDB.OperationHistory or {}
        table.sort(ops, function(a, b) return (a.time or 0) > (b.time or 0) end)
        local totalBuy, totalSell = 0, 0
        for i = 1, #content.rows do
            local row = content.rows[i]
            local info = ops[i]
            if info then
                row:Show()
                if i % 2 == 1 then
                    row.bg:SetColorTexture(0.94, 0.97, 1, 0.16)
                else
                    row.bg:SetColorTexture(1, 1, 1, 0.07)
                end
                local tstr = date("%Y-%m-%d %H:%M", info.time or 0)
                row.fs[1]:SetText("|cff888888" .. tstr .. "|r")
                row.fs[2]:SetText(info.op == "购买" and "|cff00bfff购买|r" or "|cffffd700拍卖|r")
                local itemName = info.name or ""
                if info.itemID then
                    local icon = GetItemIcon(info.itemID)
                    if icon then
                        itemName = "|T" .. icon .. ":16:16:0:0|t " .. itemName
                    end
                end
                row.fs[3]:SetText(itemName)
                row.fs[4]:SetText(GetCoinTextureString(info.price or 0))
                row.fs[5]:SetText(tostring(info.count or 1))
                if info.op == "购买" then
                    totalBuy = totalBuy + (info.price or 0)
                elseif info.op == "拍卖" then
                    totalSell = totalSell + (info.price or 0)
                end

                -- 鼠标悬停高亮
                row:SetScript("OnEnter", function(self)
                    self.bg:SetColorTexture(0.68, 0.83, 1, 0.16)
                    if info.itemID then
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetItemByID(info.itemID)
                        GameTooltip:Show()
                    end
                end)
                row:SetScript("OnLeave", function(self)
                    if i % 2 == 1 then
                        self.bg:SetColorTexture(0.94, 0.97, 1, 0.16)
                    else
                        self.bg:SetColorTexture(1, 1, 1, 0.07)
                    end
                    GameTooltip:Hide()
                end)
            else
                row:Hide()
            end
        end
        content:SetHeight(math.max(#ops, 5) * ROW_HEIGHT)
        sumBuyFS:SetText(string.format("|cffffd700累计购买：|r%s", GetCoinTextureString(totalBuy)))
        sumSellFS:SetText(string.format("|cff00ff00累计拍卖：|r%s", GetCoinTextureString(totalSell)))
    end

    f:Refresh()
    EasyAuction_OpHistoryFrame = f
end

-- 注册 ADDON_LOADED 事件，在插件加载完成后初始化数据库引用
local eaFrameInit = CreateFrame("Frame")
eaFrameInit:RegisterEvent("ADDON_LOADED")
eaFrameInit:SetScript("OnEvent", function(self, event, addon)
    if addon == "EasyAuction" then
        InitFrameDB()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)
