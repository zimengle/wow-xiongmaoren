local addonName, ns = ...
local AuctionBar = CreateFrame("Frame", "AuctionBarFrame", UIParent)
EasyAuctionDB = EasyAuctionDB or {}
EasyAuctionDB.bidDiscount = EasyAuctionDB.bidDiscount or 0.95      -- 起拍折扣比例，默认0.95
EasyAuctionDB.undercut = EasyAuctionDB.undercut or 1               -- 压价金额，铜
EasyAuctionDB.stackCount = EasyAuctionDB.stackCount or 20          -- 默认堆叠数
EasyAuctionDB.auctionDuration = EasyAuctionDB.auctionDuration or 1 -- 默认12小时
EasyAuctionDB.showSections = EasyAuctionDB.showSections or { items = true, price = true, myauct = true }
if EasyAuctionDB.SellPanel == nil then
    EasyAuctionDB.SellPanel = true
end
local selectedDuration = EasyAuctionDB.auctionDuration or 1
local function GetCopper(g, s, c) return (g or 0) * 10000 + (s or 0) * 100 + (c or 0) end
local function SplitCopper(c)
    return math.floor(c / 10000), math.floor((c % 10000) / 100), c % 100
end


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
    local icon = _G[btn:GetName().."IconTexture"]
    if icon then
        icon:SetSize(size, size)
        icon:ClearAllPoints()
        icon:SetPoint("CENTER", btn, "CENTER")
    end
end

local function CreateBaseFrame(name, parent, width, height)
    local f = CreateFrame("Frame", name or nil, parent or UIParent, BackdropTemplateMixin and "BackdropTemplate")
    f:SetSize(width or 305, height or 350)
    f:SetClampedToScreen(true)
    f:SetFrameStrata("DIALOG")
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        --edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    f:SetBackdropColor(0, 0, 0, 0.95)
    f:SetMovable(true)
    f:SetToplevel(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    return f
end

local function CreateNumericBox(parent, width)
    local edit = CreateFrame("EditBox", nil, parent)
    edit:SetAutoFocus(false)
    edit:SetNumeric(true)
    edit:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
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
    local name = GetAuctionSellItemInfo and GetAuctionSellItemInfo()
    if not name or name == "" then
        SetMoneyEdit(frame.UnitGold, frame.UnitSilver, frame.UnitCopper, 0)
        SetMoneyEdit(frame.StackGold, frame.StackSilver, frame.StackCopper, 0)
        SetMoneyEdit(frame.BidGold, frame.BidSilver, frame.BidCopper, 0)
        frame.StackCount:SetNumber(0)
        frame.NumStacks:SetNumber(0)
        return
    end

    local unitGold   = frame.UnitGold:GetNumber()
    local unitSilver = frame.UnitSilver:GetNumber()
    local unitCopper = frame.UnitCopper:GetNumber()
    local count      = frame.StackCount:GetNumber()
    local unit       = (unitGold * 10000 + unitSilver * 100 + unitCopper)
    local stackTotal = unit * count
    local undercut = EasyAuctionDB.undercut or 1
    local undercutMode = EasyAuctionDB.undercutMode or "total"
    local enableUndercut = EasyAuctionDB.enableUndercut ~= false

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

    local bidDiscount = EasyAuctionDB.bidDiscount or 0.95
    local bidTotal = math.floor(undercutStackTotal * bidDiscount)
    SetMoneyEdit(frame.BidGold, frame.BidSilver, frame.BidCopper, bidTotal)
end

function ScanBagAuctionableItems()
    local items = {}
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
                    table.insert(items, {
                        bag = bag,
                        slot = slot,
                        itemID = info.itemID,
                        icon = info.iconFileID,
                        count = info.stackCount,
                        quality = quality,
                        classID = classID,
                        itemName = itemName,
                        itemLink = info.hyperlink,
                    })
                end
            end
        end
    end
    return items
end

local function ShowBorder(frame, color)
    local t = frame:CreateTexture(nil, "BACKGROUND")
    t:SetAllPoints()
    t:SetColorTexture(unpack(color or { 0, 0, 0, 0.1 }))
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
    if EasyAuctionConfigFrame then return end
    local width, height = 340, 320
    local frame = CreateFrame("Frame", "EasyAuctionConfigFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
    frame:SetSize(width, height)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetToplevel(true)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        --edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.95)
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
    categoryFrame:SetSize(90, height-40)
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
        btn:SetSize(categoryFrame:GetWidth()-2, 32)
        btn:SetPoint("TOPLEFT", 0, -((i-1)*34))
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
    pageAuction:SetSize(width-80, height-54)
    pageAuction:SetPoint("TOPLEFT", categoryFrame, "TOPRIGHT", 2, 0)
    frame.pages["auction"] = pageAuction

    local labelWidth = 90
    local inputStartX = 90
    local rowHeight = 38
    local startY = -18

    local function AddCfgLabel(text, row)
        local l = pageAuction:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        l:SetFont(l:GetFont(), 10, "")
        l:SetPoint("TOPRIGHT", pageAuction, "TOPLEFT", labelWidth-5, startY - (row-1)*rowHeight)
        l:SetJustifyH("RIGHT")
        l:SetWidth(labelWidth)
        l:SetText(text)
        return l
    end

    local function AddCfgEditBox(width, row, dx)
        local box = CreateNumericBox(pageAuction, width)
        box:SetPoint("TOPLEFT", inputStartX + (dx or 0), startY - (row-1)*rowHeight+1)
        box:SetJustifyH("CENTER")
        return box
    end

    local labelDiscount = AddCfgLabel("起拍折扣（％）：", 1)
    labelDiscount:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("起拍折扣", 1, 1, 1)
        GameTooltip:AddLine("设置起拍总价为一口价总价的百分比。\n如95即起拍价=一口价×0.95", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelDiscount:SetScript("OnLeave", GameTooltip_Hide)
    local boxDiscount = AddCfgEditBox(40, 1)
    boxDiscount:SetNumber((EasyAuctionDB.bidDiscount or 0.95) * 100)
    boxDiscount:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("起拍折扣", 1, 1, 1)
        GameTooltip:AddLine("设置起拍价为一口价的百分比。\n如95即起拍价=一口价×0.95", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    boxDiscount:SetScript("OnLeave", GameTooltip_Hide)    
    SetupAutoBlurForEditBox(boxDiscount, function(self)
        local v = tonumber(self:GetText()) or 95
        if v < 1 then v = 1 elseif v > 100 then v = 100 end
        EasyAuctionDB.bidDiscount = v / 100
        self:SetNumber(v)
        UpdateStackPrice(AuctionBar.AuctionFrame)
    end)

    local labelUndercut = AddCfgLabel("自动压价金额：", 2)
    labelUndercut:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("自动压价", 1, 1, 1)
        GameTooltip:AddLine("自动比市场最低价低指定金额上架。\n如1银，则自动一口价-1银。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelUndercut:SetScript("OnLeave", GameTooltip_Hide)
    local boxGold = AddCfgEditBox(32, 2)
    boxGold:SetNumber(math.floor((EasyAuctionDB.undercut or 1) / 10000))
    local iconGold = pageAuction:CreateTexture(nil, "ARTWORK")
    iconGold:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
    iconGold:SetSize(12, 12)
    iconGold:SetPoint("LEFT", boxGold, "RIGHT", 1, 0)

    local boxSilver = AddCfgEditBox(24, 2, 45)
    boxSilver:SetNumber(math.floor(((EasyAuctionDB.undercut or 1)%10000)/100))
    local iconSilver = pageAuction:CreateTexture(nil, "ARTWORK")
    iconSilver:SetTexture("Interface\\MoneyFrame\\UI-SilverIcon")
    iconSilver:SetSize(12, 12)
    iconSilver:SetPoint("LEFT", boxSilver, "RIGHT", 1, 0)

    local boxCopper = AddCfgEditBox(24, 2, 80)
    boxCopper:SetNumber((EasyAuctionDB.undercut or 1) % 100)
    local iconCopper = pageAuction:CreateTexture(nil, "ARTWORK")
    iconCopper:SetTexture("Interface\\MoneyFrame\\UI-CopperIcon")
    iconCopper:SetSize(12, 12)
    iconCopper:SetPoint("LEFT", boxCopper, "RIGHT", 1, 0)

    local function SaveUndercut()
        EasyAuctionDB.undercut = GetCopper(boxGold:GetNumber(), boxSilver:GetNumber(), boxCopper:GetNumber())
        UpdateStackPrice(AuctionBar.AuctionFrame)
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

    local labelDuration = AddCfgLabel("默认时长：", 4)
    labelDuration:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("默认时长", 1, 1, 1)
        GameTooltip:AddLine("每次上架拍卖的默认持续时间。\n可选12/24/48小时。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelDuration:SetScript("OnLeave", GameTooltip_Hide)
    local durationBox = CreateFrame("Frame", nil, pageAuction, "UIDropDownMenuTemplate")
    durationBox:SetPoint("TOPLEFT", inputStartX, startY - (4-1)*rowHeight+4)
    UIDropDownMenu_SetWidth(durationBox, 80)
    local durations = { {text="12小时", value=1},{text="24小时", value=2},{text="48小时", value=3} }
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
    cbUndercutTotal:SetPoint("TOPLEFT", inputStartX, startY - (6-1)*rowHeight+4)
    cbUndercutTotal.Text:SetText("压总价")
    cbUndercutTotal.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
    cbUndercutTotal:SetChecked(EasyAuctionDB.undercutMode ~= "unit")
    cbUndercutTotal:SetHitRectInsets(0, -(cbUndercutTotal.Text:GetStringWidth() + 8), 0, 0)
    local cbUndercutUnit = CreateFrame("CheckButton", nil, pageAuction, "ChatConfigCheckButtonTemplate")
    cbUndercutUnit:SetPoint("TOPLEFT", cbUndercutTotal, "BOTTOMLEFT", 0, -2)
    cbUndercutUnit.Text:SetText("压单价")
    cbUndercutUnit.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
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

    local labelScanPerFrame = AddCfgLabel("扫描帧速：", 5)
    labelScanPerFrame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("全局扫描每帧条数", 1, 1, 1)
        GameTooltip:AddLine("全局扫描时每帧处理多少条拍卖数据。\n数值越大扫描越快，但可能导致卡顿。\n建议300~1000之间。", 1, .82, 0, 1)
        GameTooltip:Show()
    end)
    labelScanPerFrame:SetScript("OnLeave", GameTooltip_Hide)

    local boxScanPerFrame = AddCfgEditBox(50, 5)
    boxScanPerFrame:SetNumber(EasyAuctionDB.scanPerFrame or 500)
    SetupAutoBlurForEditBox(boxScanPerFrame, function(self)
        local v = tonumber(self:GetText()) or 500
        if v < 50 then v = 50 elseif v > 5000 then v = 5000 end
        EasyAuctionDB.scanPerFrame = v
        self:SetNumber(v)
    end)
    boxScanPerFrame:SetScript("OnEnter", labelScanPerFrame:GetScript("OnEnter"))
    boxScanPerFrame:SetScript("OnLeave", GameTooltip_Hide)

    local pageAddon = CreateFrame("Frame", nil, frame)
    pageAddon:SetSize(width-110, height-54)
    pageAddon:SetPoint("TOPLEFT", categoryFrame, "TOPRIGHT", 5, 0)
    frame.pages["addon"] = pageAddon

    local function AddOptionCheck(y, label, key, tooltip)
        local cb = CreateFrame("CheckButton", nil, pageAddon, "ChatConfigCheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 10, y)
        cb.Text:SetText(label)
        cb.Text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
        cb.Text:SetJustifyH("LEFT")
        cb.Text:SetWidth(120)
        cb.tooltip = tooltip
        cb:SetChecked(EasyAuctionDB[key] ~= false)
        cb:SetScript("OnClick", function(self)
            EasyAuctionDB[key] = self:GetChecked()
            if key == "enableUndercut" then
                UpdateStackPrice(AuctionBar.AuctionFrame)
            end
        end)
    end

    AddOptionCheck(-10, "鼠标提示", "ShowPrice", "物品鼠标提示总开关")
    AddOptionCheck(-42, "价格显示", "enablePrice", "是否显示卖店及拍卖价格")
    AddOptionCheck(-74, "分解显示", "enableDisenchant", "是否显示物品分解价值")
    AddOptionCheck(-106, "总价/单价显示优先", "showUnitPrice", "开启后：\n鼠标提示优先显示总价，按Shift显示单价\n关闭则优先显示单价，按Shift显示总价")
    AddOptionCheck(-138, "启用自动压价", "enableUndercut", "开启后，总价/起拍价会自动减去配置的压价金额")
    ShowCat("auction")
end

local function PickupAndPutToAuction(bag, slot)
    C_Container.PickupContainerItem(bag, slot)
    C_Timer.After(0.01, function()
        ClickAuctionSellItemButton()
        C_Timer.After(0.01, function()
            ClearCursor()
        end)
    end)
end

local function CreateAuctionSide()
    EasyAuctionDB = EasyAuctionDB or {}
    EasyAuctionDB.showSections = EasyAuctionDB.showSections or { items = true, price = true, myauct = true }
    if type(EasyAuctionDB.bidDiscount) ~= "number" or EasyAuctionDB.bidDiscount <= 0 or EasyAuctionDB.bidDiscount > 1 then
        EasyAuctionDB.bidDiscount = 0.95
    end
    if type(EasyAuctionDB.undercut) ~= "number" then
        EasyAuctionDB.undercut = 1
    end
    if type(EasyAuctionDB.stackCount) ~= "number" or EasyAuctionDB.stackCount <= 0 then
        EasyAuctionDB.stackCount = 20
    end
    if type(EasyAuctionDB.auctionDuration) ~= "number" then
        EasyAuctionDB.auctionDuration = 1
    end
    if AuctionBar.AuctionFrame then return end

    local totalWidth, totalHeight = 620, 450
    local midX = 320
    local midY = 200

    local f = CreateBaseFrame("AuctionHelper", AuctionFrame, 320, 200)
    f:SetPoint("TOPLEFT", AuctionFrame, "TOPRIGHT", 0, -10)

    local fastFrame = CreateFrame("Frame", nil, f)
    fastFrame:SetSize(midX, midY)
    fastFrame:SetPoint("TOPLEFT", 0, 0)
    ShowBorder(fastFrame, { 0, 0, 0, 0.4 })
    local openCfgBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
    openCfgBtn:SetSize(60, 22)
    openCfgBtn:SetText("设  置")
    openCfgBtn:SetPoint("TOPRIGHT", fastFrame, "TOPRIGHT", -8, -8)
    openCfgBtn:SetScript("OnClick", function()
        if EasyAuctionConfigFrame and EasyAuctionConfigFrame:IsShown() then
            EasyAuctionConfigFrame:Hide()
            return
        end
        if not EasyAuctionConfigFrame then
            CreateEasyAuctionConfigFrame(f)
        end
        EasyAuctionConfigFrame:Show()
    end)

    local title = fastFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -5)
    title:SetText("|TInterface/Icons/INV_Misc_Coin_01:12:12:0:0|t |cff00ffffEasyAuction|r |cffffffff拍卖助手|r")

    local ItemButton = CreateFrame("Button", "EasyAuctionItemButton", fastFrame, "ItemButtonTemplate")
    ItemButton:SetSize(40, 40)
    ItemButton:SetPoint("TOPLEFT", 10, -24)
    SetItemButtonTexture(ItemButton, "")
    SetItemButtonCount(ItemButton, 0)
    SetItemButtonQuality(ItemButton, nil)

    local itemName = fastFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemName:SetPoint("LEFT", ItemButton, "RIGHT", 10, 0)
    itemName:SetWidth(150)
    itemName:SetJustifyH("LEFT")
    f.ItemName = itemName

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
            end
        end
    end)

    local function AddMoneyEdit(parent, anchor, label, y, prefix)
        local labelFS = fastFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        labelFS:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, y)
        labelFS:SetText(label)
        labelFS:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")

        local editGold = CreateNumericBox(fastFrame, 60)
        editGold:SetPoint("LEFT", labelFS, "RIGHT", 4, 0)
        editGold:SetJustifyH("CENTER")
        local iconGold = fastFrame:CreateTexture(nil, "ARTWORK")
        iconGold:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
        iconGold:SetSize(12, 12)
        iconGold:SetPoint("LEFT", editGold, "RIGHT", 2, 0)

        local editSilver = CreateNumericBox(fastFrame, 28)
        editSilver:SetPoint("LEFT", iconGold, "RIGHT", 6, 0)
        editSilver:SetJustifyH("CENTER")
        local iconSilver = fastFrame:CreateTexture(nil, "ARTWORK")
        iconSilver:SetTexture("Interface\\MoneyFrame\\UI-SilverIcon")
        iconSilver:SetSize(12, 12)
        iconSilver:SetPoint("LEFT", editSilver, "RIGHT", 2, 0)

        local editCopper = CreateNumericBox(fastFrame, 28)
        editCopper:SetPoint("LEFT", iconSilver, "RIGHT", 6, 0)
        editCopper:SetJustifyH("CENTER")
        local iconCopper = fastFrame:CreateTexture(nil, "ARTWORK")
        iconCopper:SetTexture("Interface\\MoneyFrame\\UI-CopperIcon")
        iconCopper:SetSize(12, 12)
        iconCopper:SetPoint("LEFT", editCopper, "RIGHT", 2, 0)

        f[prefix .. "Gold"] = editGold
        f[prefix .. "Silver"] = editSilver
        f[prefix .. "Copper"] = editCopper

        return labelFS, editGold, editSilver, editCopper
    end


    local unitLabel, unitGold, unitSilver, unitCopper = AddMoneyEdit(fastFrame, ItemButton, "一口价(单)：", -10, "Unit")

    local bidLabel, bidGold, bidSilver, bidCopper = AddMoneyEdit(fastFrame, unitLabel, "起拍价(总)：", -10, "Bid")
    f.BidGold:SetEnabled(false)
    f.BidSilver:SetEnabled(false)
    f.BidCopper:SetEnabled(false)
    local stackLabel, stackGold, stackSilver, stackCopper = AddMoneyEdit(fastFrame, unitLabel, "一口价(总)：", -31, "Stack")

    local stackCountLabel = fastFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    stackCountLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
    stackCountLabel:SetPoint("TOPLEFT", stackLabel, "BOTTOMLEFT", 0, -20)
    stackCountLabel:SetText("堆叠：")
    f.StackCount = CreateNumericBox(fastFrame, 32)
    f.StackCount:SetPoint("LEFT", stackCountLabel, "RIGHT", 4, 0)
    f.StackCount:SetJustifyH("CENTER")

    local MaxStackCountBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
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
    numStacksLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
    numStacksLabel:SetPoint("TOPLEFT", stackCountLabel, "BOTTOMLEFT", 0, -14)
    numStacksLabel:SetText("组数：")
    f.NumStacks = CreateNumericBox(fastFrame, 32)
    f.NumStacks:SetPoint("LEFT", numStacksLabel, "RIGHT", 4, 0)
    f.NumStacks:SetJustifyH("CENTER")

    local MaxNumStacksBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
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

    local startBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
    startBtn:SetPoint("LEFT", MaxNumStacksBtn, "RIGHT", 10, 0)
    startBtn:SetSize(120, 28)
    startBtn:SetText("开始拍卖")

    local AuctionDurations = {
        { text = "12", value = 1 },
        { text = "24", value = 2 },
        { text = "48", value = 3 },
    }
    local durationBtns = {}
    local function SetAuctionDuration(val)
        selectedDuration = val
        EasyAuctionDB.auctionDuration = val
        for i, btn in ipairs(durationBtns) do
            btn:SetChecked(btn.value == val)
        end
    end

    local prev = MaxStackCountBtn
    for i, v in ipairs(AuctionDurations) do
        local btn = CreateFrame("CheckButton", nil, fastFrame, "ChatConfigCheckButtonTemplate")
        btn:SetSize(22, 22)
        if i == 1 then
            btn:SetPoint("LEFT", prev, "RIGHT", 12, 0)
        else
            btn:SetPoint("LEFT", durationBtns[i-1], "RIGHT", 14, 0) -- 固定Y轴
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

    startBtn:SetScript("OnClick", function()
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
                    PostAuction(minBid, buyout, selectedDuration, stackSize, numStacks, false)
                    print("|cff00ff00已发布拍卖：|r" .. name)
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            StaticPopup_Show("EASYFRAME_LOW_PRICE")
            return
        end

        PostAuction(minBid, buyout, selectedDuration, stackSize, numStacks, false)
        print("|cff00ff00已发布拍卖：|r" .. name)
    end)

    local itemsFrame = CreateFrame("Frame", nil, f)
    itemsFrame:SetPoint("TOPLEFT", fastFrame, "TOPRIGHT", 1, 0)
    itemsFrame:SetPoint("BOTTOMLEFT", 0, 0)
    itemsFrame:SetWidth(320)
    itemsFrame:SetHeight(200) 
    itemsFrame:SetShown(EasyAuctionDB.showSections.items ~= false)
    
    local itemsTitle = itemsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    itemsTitle:SetPoint("TOPLEFT", 10, -10)
    itemsTitle:SetText("可售物品列表")
    itemsTitle:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")

    local itemsScroll = CreateFrame("ScrollFrame", nil, itemsFrame, "UIPanelScrollFrameTemplate")
    itemsScroll:SetPoint("TOPLEFT", itemsFrame, "TOPLEFT", 0, -30)
    itemsScroll:SetPoint("BOTTOMRIGHT", itemsFrame, "BOTTOMRIGHT", -28, 10)

    local itemsScrollChild = CreateFrame("Frame", nil, itemsScroll)
    itemsScrollChild:SetWidth(itemsFrame:GetWidth() - 30)
    itemsScroll:SetScrollChild(itemsScrollChild)
    ShowBorder(itemsFrame, { 0, 0, 0, 0.8 })
    local ICON_SIZE, ICON_PADDING, ICONS_PER_ROW = 32, 7, 6
    local CATEGORY_LABEL_WIDTH = 35  
    local CATEGORY_LABEL_PADDING = 4 
    local itemButtons = {}
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
                hdr:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
                hdr:ClearAllPoints()
                hdr:SetPoint("TOPLEFT", itemsScrollChild, "TOPLEFT", CATEGORY_LABEL_PADDING+2, -y-6)
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
                        GameTooltip:Show()
                    end)
                    btn:SetScript("OnLeave", GameTooltip_Hide)
                    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                    btn:SetScript("OnClick", function(self, button)
                        if ItemButton.itemID == self.itemID then return end
                        PickupAndPutToAuction(self.bag, self.slot)
                    end)
                    idx = idx + 1
                end
                y = y + rows * (ICON_SIZE + ICON_PADDING) + 6
            end
        end
        itemsScrollChild:SetHeight(y + 10)
    end
    f.RefreshBagItemFrame = RefreshBagItemIcons

    local priceFrame = CreateFrame("Frame", "EasyFrame_PriceDistFrame", f, BackdropTemplateMixin and "BackdropTemplate")
    priceFrame:SetSize(320, 240)
    priceFrame:SetPoint("TOPLEFT", fastFrame, "BOTTOMLEFT", 0, -2)
    priceFrame:SetShown(EasyAuctionDB.showSections.price ~= false)
    --priceFrame:SetBackdropColor(0, 0, 0, 0.82)
    ShowBorder(priceFrame, { 0, 0, 0, 0.8 }) 
    if not priceFrame.scroll then
        local scroll = CreateFrame("ScrollFrame", nil, priceFrame, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", priceFrame, "TOPLEFT", 0, -32)
        scroll:SetPoint("BOTTOMRIGHT", priceFrame, "BOTTOMRIGHT", -23, 0) 
        priceFrame.scroll = scroll

        local content = CreateFrame("Frame", nil, scroll)
        content:SetWidth(priceFrame:GetWidth() - 36) 
        scroll:SetScrollChild(content)
        priceFrame.content = content
    end
    function EasyAuction_UpdateInlineDistribution(itemName, data)
        local f = priceFrame
        local content = priceFrame.content
        local mainFrame = AuctionBar and AuctionBar.AuctionFrame
        if not mainFrame then return end
        if not f or not content then return end
        f:Show()

        if not f.title then
            f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            f.title:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -10)
        end

        if not f.summary then
            f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            f.summary:SetPoint("TOPRIGHT", f, "TOPRIGHT", -10, -10)
            f.summary:SetJustifyH("RIGHT")
            f.summary:SetWidth(f:GetWidth() - 20)
        end

        if not itemName then
            f.title:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
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
            content.emptyTip:SetText("|cffffee00请先将物品放入左侧拍卖栏|r")
            content:SetHeight(80)
            return
        end
        if not data or #data == 0 then
            f.title:SetText("|cffffffff价格分布|r")
            f.title:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
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
            content.emptyTip:SetText("|cffffee00请先搜索物品价格或进行全局扫描|r")
            content:SetHeight(80)
            return
        end

        if content.emptyTip then content.emptyTip:Hide() end
        f.title:SetText((itemName or "") .. " |cffffffff价格分布|r")

        local stats, maxCount = {}, 0
        for _, v in ipairs(data) do
            if v.unit then
                stats[v.unit] = (stats[v.unit] or 0) + (v.count or 1)
                if stats[v.unit] > maxCount then maxCount = stats[v.unit] end
            end
        end
        local statArr = {}
        for unit, count in pairs(stats) do
            table.insert(statArr, { unit = unit, count = count })
        end
        table.sort(statArr, function(a, b) return a.unit < b.unit end)
        content.rows = content.rows or {}

        local AMOUNT_AREA_WIDTH = 80
        local ROW_HEIGHT = 18
        local LEFT_PADDING = 4
        local RIGHT_PADDING = 4
        local GAP1 = 3
        local GAP2 = 3
        local BAR_HEIGHT = 13

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

        for idx, v in ipairs(statArr) do
            local row = content.rows[idx]
            if not row then
                row = CreateFrame("Frame", nil, content)
                row:SetSize(totalWidth, ROW_HEIGHT)
                local font, size, flags = GameFontHighlightSmall:GetFont()
                row.icon = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                row.icon:SetFont(font, 10, flags) 
                row.icon:SetJustifyH("RIGHT")
                row.icon:SetWidth(AMOUNT_AREA_WIDTH)
                row.bar = row:CreateTexture(nil, "ARTWORK")
                row.bar:SetHeight(BAR_HEIGHT)
                row.count = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall") 
                row.count:SetFont(font, 10, flags)
                row.count:SetJustifyH("LEFT")
                content.rows[idx] = row
            end
            row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -4 - (idx - 1) * ROW_HEIGHT)
            row.icon:SetText(FormatGoldIcon(v.unit, 12))
            row.icon:SetWidth(AMOUNT_AREA_WIDTH)
            row.icon:SetJustifyH("RIGHT")
            row.icon:SetPoint("LEFT", row, "LEFT", LEFT_PADDING, 0)
            row.icon:SetPoint("TOP", row, "TOP", 0, 0)

            local barLen = 1
            if maxCount > 0 then
                barLen = math.floor(v.count / maxCount * barMaxWidth + 0.5)
                if barLen < 8 then barLen = 8 end
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
            row.icon:EnableMouse(true)
            row.icon:SetScript("OnMouseUp", function()
                local price = v.unit
                local ug, us, uc = SplitCopper(price)
                mainFrame.UnitGold:SetNumber(ug)
                mainFrame.UnitSilver:SetNumber(us)
                mainFrame.UnitCopper:SetNumber(uc)
                UpdateStackPrice(mainFrame)
            end)
            row.icon:SetScript("OnEnter", function(self)
                local gold, silver, copper = SplitCopper(v.unit)
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
            row.icon:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
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
        f.summary:SetText(string.format(
            "|cffffee00统计数：%d|r",totalCount
        ))
        f.summary:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
        -- f.summary:SetText(string.format(
        --     "|cffffee00统计数：%d|r  占比前三：%s",
        --     totalCount, #top3>0 and table.concat(top3, "，") or "无"
        -- ))
        f.summary:Show()
    end

    if not f.MyAuctionListFrame then
        local myAuctionFrame = CreateFrame("Frame", nil, f, BackdropTemplateMixin and "BackdropTemplate")
        myAuctionFrame:SetSize(320, 240)
        myAuctionFrame:SetPoint("TOPLEFT", priceFrame, "TOPRIGHT", 2, 0)
        --myAuctionFrame:SetBackdropColor(0, 0, 0, 0.82)
        ShowBorder(myAuctionFrame, { 0, 0, 0, 0.8 }) 
        -- myAuctionFrame:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile=nil, tile=true, tileSize=16})
        myAuctionFrame:EnableMouse(true)
        myAuctionFrame:Show()
        f.MyAuctionListFrame = myAuctionFrame
        if f.MyAuctionListFrame then
            f.MyAuctionListFrame:SetShown(EasyAuctionDB.showSections.myauct ~= false)
        end

        local title = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        title:SetPoint("TOPLEFT", 10, -10)
        title:SetText("已上架拍卖（右键取消）")
        title:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")

        local totalLabel = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        totalLabel:SetPoint("TOPRIGHT", myAuctionFrame, "TOPRIGHT", -22, -10)
        totalLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 11, "")
        totalLabel:SetJustifyH("RIGHT")
        totalLabel:SetWidth(220)
        myAuctionFrame.totalLabel = totalLabel

        local statusLabel = myAuctionFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        statusLabel:SetPoint("TOPRIGHT", totalLabel, "BOTTOMRIGHT", 0, -3)
        statusLabel:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 10, "")
        statusLabel:SetJustifyH("RIGHT")
        statusLabel:SetWidth(220)
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
            row:SetPoint("TOPLEFT", 0, -40 - (i - 1) * 19)
            row.nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.nameText:SetFont(row.nameText:GetFont(), 10, "")
            row.nameText:SetPoint("LEFT", 4, 0)
            row.nameText:SetWidth(130)
            row.nameText:SetJustifyH("LEFT")
            row.nameText:SetWordWrap(false)
            row.priceText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.priceText:SetFont(row.priceText:GetFont(), 10, "")
            row.priceText:SetPoint("LEFT", row.nameText, "RIGHT", 8, 0)
            row.priceText:SetWidth(120)
            row.priceText:SetJustifyH("RIGHT")
            row.durationText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            row.durationText:SetFont(row.durationText:GetFont(), 10, "")
            row.durationText:SetPoint("LEFT", row.priceText, "RIGHT", 8, 0)
            row.durationText:SetWidth(60)
            row.durationText:SetJustifyH("LEFT")
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

    local sectionBtnSize, sectionBtnGap = 60, 6
    local sectionBtnHeight = 20
    local firstBtnTopOffset = -35 
    local sectionNames = {
        { key = "items", label = "可售列表" },
        { key = "myauct", label = "已上架" },
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
            fontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
        end

        btn:SetPoint("TOPRIGHT", openCfgBtn, "BOTTOMRIGHT", 0, firstBtnTopOffset - (i-1)*(sectionBtnGap+sectionBtnHeight))

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
                print("priceFrame:SetShown(val)", val)
                if val then
                    local name = GetAuctionSellItemInfo and GetAuctionSellItemInfo()
                    if name and EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[name] then
                        EasyAuction_UpdateInlineDistribution(name, EasyAuctionDB.PriceHistory[name])
                    else
                        EasyAuction_UpdateInlineDistribution(nil, nil)
                    end
                end
            elseif data.key == "myauct" then
                if f.MyAuctionListFrame then f.MyAuctionListFrame:SetShown(val) end
            end
            UpdateBtnVisual()
        end)

        UpdateBtnVisual()
        sectionBtns[i] = btn
    end

    local priceDetailBtn = CreateFrame("Button", nil, fastFrame, "UIPanelButtonTemplate")
    priceDetailBtn:SetSize(sectionBtnSize, sectionBtnHeight)
    priceDetailBtn:SetText("价格详情")
    local fontString = priceDetailBtn:GetFontString()
    if fontString then
        fontString:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
    end
    priceDetailBtn:SetPoint("TOPRIGHT", sectionBtns[3], "BOTTOMRIGHT", 0, -sectionBtnGap)

    priceDetailBtn:SetScript("OnClick", function()
        if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
            EasyAuctionPriceFrame:Hide()
            return
        end
        local itemName = GetAuctionSellItemInfo()
        if not itemName or itemName == "" then
            print("|cffff3300请先将物品放入拍卖栏左侧！|r")
            return
        end
        local data = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[itemName]
        if not data or #data == 0 then
            print("|cffff3300没有该物品的历史价格数据！|r")
            return
        end
        if itemName and EasyAuctionDB and EasyAuctionDB.PriceHistory[itemName] then
            ShowPriceFrame(itemName, EasyAuctionDB.PriceHistory[itemName])
        end
    end)

    priceDetailBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("点击显示当前上架物品的价格详情", 1, 1, 1)
        GameTooltip:Show()
    end)
    priceDetailBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

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
            myAuctionFrame.totalLabel:SetText("|cffffd100总额：|r"..GetCoinTextureString(sum))
        end
        if myAuctionFrame.statusLabel then
            myAuctionFrame.statusLabel:SetText("|cffff5050未售：|r"..GetCoinTextureString(totalBuyout) .. "   |cff00ff00已售：|r"..GetCoinTextureString(soldBuyout))
        end
    end

    local function AutoFillPrice()
        local name, _, _, _, _, _, _, stackCount, totalCount, itemID = GetAuctionSellItemInfo()
        if not name or not itemID then return end

        local _, _, quality = GetItemInfo(itemID)
        local r, g, b = 1, 1, 1
        if quality then
            r, g, b = GetItemQualityColor(quality)
        end

        -- 自动取得历史最低价或五倍商店价
        local hist = EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[name]
        local histUnit = nil
        if hist and #hist > 0 then
            histUnit = hist[1].unit
            for _, v in ipairs(hist) do
                if v.unit < histUnit then histUnit = v.unit end
            end
        end

        local vendorPrice = select(11, GetItemInfo(itemID)) or 0
        local defaultStack = EasyAuctionDB.stackCount or 20
        local useStack = math.min(defaultStack, totalCount or defaultStack)
        if useStack > (stackCount or 1) then useStack = stackCount or 1 end
        if totalCount < useStack then useStack = totalCount end
        f.StackCount:SetNumber(useStack)
        f.NumStacks:SetNumber(1)

        local unitPrice
        if histUnit then
            unitPrice = histUnit
        else
            unitPrice = math.max(vendorPrice * 5, 1)
        end

        local ug, us, uc = SplitCopper(unitPrice)
        f.UnitGold:SetNumber(ug)
        f.UnitSilver:SetNumber(us)
        f.UnitCopper:SetNumber(uc)

        if f.ItemName then
            local colorStr = ("|cff%02x%02x%02x%s|r"):format(r*255, g*255, b*255, name)
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
    end
    ns.AutoFillPrice = AutoFillPrice
    
    f:RegisterEvent("BAG_UPDATE")
    f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    f:RegisterEvent("NEW_AUCTION_UPDATE")
    f:RegisterEvent("AUCTION_HOUSE_SHOW")
    f:RegisterEvent("AUCTION_OWNED_LIST_UPDATE")
    f:SetScript("OnEvent", function(self, event)
        if event == "BAG_UPDATE" or event == "AUCTION_ITEM_LIST_UPDATE" or event == "NEW_AUCTION_UPDATE" or event == "AUCTION_HOUSE_SHOW" or event == "AUCTION_OWNED_LIST_UPDATE" then
            self:RefreshBagItemFrame()
            self:RefreshMyAuctionList()
            AutoFillPrice()
            SetAuctionDuration(EasyAuctionDB.auctionDuration or 1)
            local name = GetAuctionSellItemInfo and GetAuctionSellItemInfo()
            local Distributionshow = EasyAuctionDB.showSections.price ~= false
            if Distributionshow then
                if name and EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[name] then
                    EasyAuction_UpdateInlineDistribution(name, EasyAuctionDB.PriceHistory[name])
                    if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
                        ShowPriceFrame(name, EasyAuctionDB.PriceHistory[name])
                    end
                else
                    if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
                        EasyAuctionPriceFrame:Hide()
                    end
                    EasyAuction_UpdateInlineDistribution(nil, nil)
                end
            end
        end
    end)
    if f.MyAuctionListFrame then
        f.MyAuctionListFrame:SetScript("OnShow", function() f:RefreshMyAuctionList() end)
    end
    itemsFrame:SetScript("OnShow", function() f:RefreshBagItemFrame() end)
    f:HookScript("OnShow", function()
        f:RefreshBagItemFrame()
        f:RefreshMyAuctionList()
    end)
    AuctionBar.AuctionFrame = f
end

function EasyAuction_CreateSellPanelButton()
    local HelpButton = _G["EasyAuctionScanAllHelpButton"]
    local HistoryButton = _G["EasyAuctionHistoryButton"]
    local btn = CreateFrame("Button", "EasyAuctionSellPanelButton", AuctionFrameBrowse, "UIPanelButtonTemplate")
    btn:SetSize(60, 22)
    if HistoryButton then
        btn:SetPoint("LEFT", HelpButton, "RIGHT", 6, 0)
    else
        btn:SetPoint("LEFT", HistoryButton, "RIGHT", 6, 0)
    end
    btn:SetText("闪卖")
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
        if AuctionBar.AuctionFrame then
            if EasyAuctionDB.SellPanel then
                AuctionBar.AuctionFrame:Show()
            else
                AuctionBar.AuctionFrame:Hide()
            end
        end
        if AuctionFrame and AuctionFrame.selectedTab == 3 then
            for i = 1, NUM_AUCTIONS_TO_DISPLAY do
                local btn = _G["AuctionsButton"..i]
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

local function EasyAuction_ClearSellPanelCache()
    if not (AuctionBar and AuctionBar.AuctionFrame) then return end
    local f = AuctionBar.AuctionFrame

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
        if ItemButton.SetNormalTexture then
            SetItemButtonTexture(ItemButton, "")
        end
        SetItemButtonCount(ItemButton, 0)
        SetItemButtonQuality(ItemButton, nil)
    end

    if EasyAuction_UpdateInlineDistribution then
        EasyAuction_UpdateInlineDistribution(nil, nil)
    end
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
multiSellFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
multiSellFrame:RegisterEvent("NEW_AUCTION_UPDATE")
multiSellFrame:SetScript("OnEvent", function(self, event, current, total)
    local f = AuctionBar.AuctionFrame
    if event == "AUCTION_MULTISELL_UPDATE" then
        totalMultisell = total or 0
        doneMultisell = current or 0
        if totalMultisell > 0 and doneMultisell == totalMultisell then
            if f and f.ResetAuctionUI then f.ResetAuctionUI() end
            EasyAuction_ClearSellPanelCache()
            if f and f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
        end
    elseif event == "NEW_AUCTION_UPDATE" then
        if (totalMultisell == 0 or doneMultisell == 0) and f and f.ResetAuctionUI then
            f.ResetAuctionUI()
            EasyAuction_ClearSellPanelCache()
            if f.RefreshMyAuctionList then f:RefreshMyAuctionList() end
        end
        totalMultisell = 0
        doneMultisell = 0
    elseif event == "AUCTION_HOUSE_CLOSED" then
        totalMultisell = 0
        doneMultisell = 0
        EasyAuction_ClearSellPanelCache()
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
            end
            isInHook = false
        end)
    end)
    AuctionBar.__EasyAuctionSellItemButtonHooked = true
end