local addonName, ns = ...
EasyAuctionDB = EasyAuctionDB or {}
EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
EasyAuctionDB.CustomHistoryPage = EasyAuctionDB.CustomHistoryPage or 1
EasyAuctionDB.scanPerFrame = EasyAuctionDB.scanPerFrame or 500
EasyAuction_SearchHistoryDropDown = CreateFrame("Frame", "EasyAuction_SearchHistoryDropDown", UIParent,
    "UIDropDownMenuTemplate")
EasyAuctionDB.LastSelectedPriceInfo = nil
EasyAuctionDB.CurrentDistItemName = nil
EasyAuctionDB.CurrentDistData = nil
EasyAuctionDB.CurrentTodayMin = EasyAuctionDB.CurrentTodayMin or {}
EasyAuctionDB.undercutMode = EasyAuctionDB.undercutMode or "total" -- "total"：压总价，"unit"：压单价
EasyAuctionDB.showSections = EasyAuctionDB.showSections or { items = true, price = true, myauct = true }
EasyAuctionDB.RecentSearch = EasyAuctionDB.RecentSearch or {}
EasyAuctionDB.FavoriteItems = EasyAuctionDB.FavoriteItems or {}
local RECENT_MAX = 20
local FAVORITE_MAX = 50
local EA_CategoryMode = nil
local EA_CategorySortKey = "titanValue"
local EA_CategorySortDesc = true
local EA_CategoryCurrentPage = 1
local EA_CategoryTotalPages = 1
local EA_ActiveCategory = nil

if EasyAuctionDB.ShowPrice == nil then
    EasyAuctionDB.ShowPrice = true
end
if EasyAuctionDB.enablePrice == nil then
    EasyAuctionDB.enablePrice = true
end
if EasyAuctionDB.enableDisenchant == nil then
    EasyAuctionDB.enableDisenchant = true
end
if EasyAuctionDB.showUnitPrice == nil then
    EasyAuctionDB.showUnitPrice = true
end
if EasyAuctionDB.enableUndercut == nil then
    EasyAuctionDB.enableUndercut = true
end
if EasyAuctionDB.undercutMode ~= "unit" then
    EasyAuctionDB.undercutMode = "total"
end
EasyAuctionDB.autoFillLastAuction = EasyAuctionDB.autoFillLastAuction == nil and false or
EasyAuctionDB.autoFillLastAuction
EasyAuctionDB.enableAuctionListCopy = EasyAuctionDB.enableAuctionListCopy == nil and true or
EasyAuctionDB.enableAuctionListCopy

EasyAuctionDB.VendorPrice = EasyAuctionDB.VendorPrice or {}

IsScanningAll = false
local EasyAuctionScanProgressFrame = nil
local EasyAuction_TipHooks = {}
function AddRecentSearch(itemID, name, price, t)
    if not itemID or not name then return end
    for i = #EasyAuctionDB.RecentSearch, 1, -1 do
        if EasyAuctionDB.RecentSearch[i].itemID == itemID then
            table.remove(EasyAuctionDB.RecentSearch, i)
        end
    end
    table.insert(EasyAuctionDB.RecentSearch, 1, { itemID = itemID, name = name, price = price, time = t or time() })
    while #EasyAuctionDB.RecentSearch > RECENT_MAX do table.remove(EasyAuctionDB.RecentSearch) end
end

function AddFavoriteItem(itemID, name, price, t)
    if not itemID or not name then return end
    EasyAuctionDB.FavoriteItems[itemID] = { name = name, price = price, time = t or time() }
    local count = 0
    for _ in pairs(EasyAuctionDB.FavoriteItems) do count = count + 1 end
    if count > FAVORITE_MAX then
        local oldestID, oldestTime
        for id, info in pairs(EasyAuctionDB.FavoriteItems) do
            if not oldestTime or (info.time or 0) < oldestTime then
                oldestID, oldestTime = id, info.time or 0
            end
        end
        if oldestID then EasyAuctionDB.FavoriteItems[oldestID] = nil end
    end
end

function EasyAuction_ShowDropdownMenu(menuTable, anchor, x, y)
    local function initialize(frame, level)
        level = level or 1
        local menu = menuTable
        if level > 1 and UIDROPDOWNMENU_MENU_VALUE then
            for _, item in ipairs(menuTable) do
                if item.menuList and item.text == UIDROPDOWNMENU_MENU_VALUE then
                    menu = item.menuList
                    break
                end
            end
        end
        for _, item in ipairs(menu or {}) do
            local info = UIDropDownMenu_CreateInfo()
            for k, v in pairs(item) do
                info[k] = v
            end
            if item.menuList then
                info.hasArrow = true
                info.notCheckable = true
                info.menuList = item.menuList
                info.value = item.text
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end
    UIDropDownMenu_Initialize(EasyAuction_SearchHistoryDropDown, initialize, "MENU")
    ToggleDropDownMenu(1, nil, EasyAuction_SearchHistoryDropDown, anchor, x, y)
end

local PRICE_NUM = 20
local PRICE_ROWS_PER_PAGE = 15
local priceCurrentPage = 1
local priceTotalPages = 1
local priceDataCache = {}
local PriceFrame = EasyAuctionPriceFrame
local GetContainerNumSlots = GetContainerNumSlots or (C_Container and C_Container.GetContainerNumSlots)
local GetContainerItemLink = GetContainerItemLink or (C_Container and C_Container.GetContainerItemLink)
local GetContainerItemInfo = GetContainerItemInfo or (C_Container and C_Container.GetContainerItemInfo)

if PriceFrame.SetBackdrop then
    PriceFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    PriceFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    PriceFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
end

PriceFrame:SetFrameStrata("DIALOG")
PriceFrame:SetMovable(true)
PriceFrame:EnableMouse(true)
PriceFrame:RegisterForDrag("LeftButton")
PriceFrame:SetScript("OnDragStart", PriceFrame.StartMoving)
PriceFrame:SetScript("OnDragStop", PriceFrame.StopMovingOrSizing)
PriceFrame:Hide()

PriceFrame:SetScript("OnHide", function(self)
    EasyAuctionDB.LastSelectedPriceInfo = nil
end)

local CloseBtn = _G["EasyAuctionPriceFrameClose"]
CloseBtn:SetScript("OnClick", function(self)
    self:GetParent():Hide()
end)
local ITEM_QUALITY_COLORS = {
    [1] = "|cffffffff",
    [2] = "|cff1eff00",
    [3] = "|cff0070dd",
    [4] = "|cffa335ee",
    [5] = "|cffff8000",
    [6] = "|cffe6cc80",
}
local function ColorName(name, link)
    if link then
        local quality = select(3, GetItemInfo(link))
        quality = tonumber(quality)
        if quality and ITEM_QUALITY_COLORS[quality] then
            return ITEM_QUALITY_COLORS[quality] .. name .. "|r"
        end
    end
    return "|cffffffff" .. (name or "") .. "|r"
end
local function GetCurrentStackSize()
    if AuctionsStackSizeEntry and AuctionsStackSizeEntry.GetNumber then
        local n = AuctionsStackSizeEntry:GetNumber()
        if n and n > 0 then return n end
    end
    return 1
end
local function FillAuctionPrice(unitPrice)
    local stackSize = GetCurrentStackSize()
    local totalPrice = unitPrice * stackSize
    MoneyInputFrame_SetCopper(StartPrice, totalPrice - 1)
    MoneyInputFrame_SetCopper(BuyoutPrice, totalPrice - 1)

    if AuctionBar and AuctionBar.HookAuctionFrame then
        local f = AuctionBar.HookAuctionFrame
        local displayUnit = math.max(unitPrice - 1, 0)
        if f.UnitGoldPrice and f.UnitSilverPrice and f.UnitCopperPrice then
            f.UnitGoldPrice:SetNumber(math.floor(displayUnit / 10000))
            f.UnitSilverPrice:SetNumber(math.floor((displayUnit % 10000) / 100))
            f.UnitCopperPrice:SetNumber(displayUnit % 100)
        end

        local sideStackSize = (f.StackCount and f.StackCount:GetNumber() or 1)
        local sideTotal = displayUnit * (sideStackSize > 0 and sideStackSize or 1)
        if f.StackGoldPrice and f.StackSilverPrice and f.StackCopperPrice then
            f.StackGoldPrice:SetNumber(math.floor(sideTotal / 10000))
            f.StackSilverPrice:SetNumber(math.floor((sideTotal % 10000) / 100))
            f.StackCopperPrice:SetNumber(sideTotal % 100)
        end
    end
end

PriceFrame.rows = {}
for i = 1, PRICE_NUM do
    local btn = CreateFrame("Button", nil, PriceFrame)
    btn:SetSize(300, 15)
    btn:SetPoint("TOPLEFT", 13, -92 - (i - 1) * 16)
    btn:SetNormalFontObject("GameFontHighlightSmall")
    btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    btn:Hide()
    btn.cols = btn.cols or {}
    btn.cols[1] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    btn.cols[1]:SetPoint("LEFT", btn, "LEFT", 0, 0)
    btn.cols[1]:SetWidth(22)
    btn.cols[1]:SetJustifyH("LEFT")
    btn.cols[2] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    btn.cols[2]:SetPoint("LEFT", btn.cols[1], "RIGHT", 4, 0)
    btn.cols[2]:SetWidth(38)
    btn.cols[2]:SetJustifyH("LEFT")
    btn.cols[3] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    btn.cols[3]:SetPoint("LEFT", btn.cols[2], "RIGHT", 4, 0)
    btn.cols[3]:SetWidth(140)
    btn.cols[3]:SetJustifyH("RIGHT")
    btn.cols[4] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    btn.cols[4]:SetPoint("LEFT", btn.cols[3], "RIGHT", 4, 0)
    btn.cols[4]:SetWidth(100)
    btn.cols[4]:SetJustifyH("RIGHT")
    PriceFrame.rows[i] = btn
end
local pricePrevBtn = CreateFrame("Button", nil, PriceFrame, "UIPanelButtonTemplate")
pricePrevBtn:SetSize(60, 20)
pricePrevBtn:SetPoint("BOTTOMLEFT", 15, 15)
pricePrevBtn:SetText("上一页")
pricePrevBtn:Hide()

local priceNextBtn = CreateFrame("Button", nil, PriceFrame, "UIPanelButtonTemplate")
priceNextBtn:SetSize(60, 20)
priceNextBtn:SetPoint("LEFT", pricePrevBtn, "RIGHT", 10, 0)
priceNextBtn:SetText("下一页")
priceNextBtn:Hide()

local pricePageText = PriceFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
pricePageText:SetPoint("LEFT", priceNextBtn, "RIGHT", 10, 0)
pricePageText:SetText("")

local ICON_SIZE = 12
function FormatGoldIcon(copper, size)
    size = size or ICON_SIZE or 12
    copper = copper or 0
    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local copperOnly = copper % 100
    local iconStr = ":" .. size .. ":" .. size .. ":2:0"
    local str = ""

    if gold > 0 then
        str = str .. gold .. "|TInterface\\MoneyFrame\\UI-GoldIcon" .. iconStr .. "|t"
        str = str .. string.format("%02d", silver) .. "|TInterface\\MoneyFrame\\UI-SilverIcon" .. iconStr .. "|t"
        str = str .. string.format("%02d", copperOnly) .. "|TInterface\\MoneyFrame\\UI-CopperIcon" .. iconStr .. "|t"
    elseif silver > 0 then
        str = str .. silver .. "|TInterface\\MoneyFrame\\UI-SilverIcon" .. iconStr .. "|t"
        str = str .. string.format("%02d", copperOnly) .. "|TInterface\\MoneyFrame\\UI-CopperIcon" .. iconStr .. "|t"
    else
        str = str .. copperOnly .. "|TInterface\\MoneyFrame\\UI-CopperIcon" .. iconStr .. "|t"
    end

    return str
end

local function FormatTimeAgo(ts)
    local diff = time() - (ts or 0)
    if diff < 3600 then
        return string.format("（%d分钟前）", math.floor(diff / 60))
    elseif diff < 86400 then
        return string.format("（%d小时前）", math.floor(diff / 3600))
    else
        return string.format("（%d天前）", math.floor(diff / 86400))
    end
end

local function showUnitPrice()
    if EasyAuctionDB.showUnitPrice then
        return IsShiftKeyDown()
    else
        return not IsShiftKeyDown()
    end
end

local function EasyAuction_RemoveOldKeys()
    local DB = EasyAuctionDB or {}
    local function removeOldKeys(tbl)
        if type(tbl) ~= "table" then return end
        for key in pairs(tbl) do
            if type(key) == "string" and not key:find(":") then
                tbl[key] = nil
            end
        end
    end

    removeOldKeys(DB.PriceHistory)
    removeOldKeys(DB.DailyMinPrice)
    removeOldKeys(DB.CurrentTodayMin)
end


local _EA_nextTooltipPriceInfo = {}

local function EasyAuction_OnTooltipItem(tip, link, count)
    if not EasyAuctionDB.ShowPrice then return end
    if not link or not tip or not tip.AddDoubleLine then return end
    count = (count and count > 0) and count or 1
    local name, _, quality, itemLevel, _, _, _, _, _, _, sellPrice, classID = GetItemInfo(link)
    local itemID = tonumber(link:match("item:(%d+):"))
    if not itemID then return end

    if EasyAuctionDB.enablePrice then
        if EasyAuctionDB.enableVendor and sellPrice and sellPrice > 0 then
            if showUnitPrice() and count > 1 then
                tip:AddDoubleLine(
                    "|cff00ff00卖店|r",
                    FormatGoldIcon(sellPrice * count) .. "（总价）",
                    1, 0.82, 0, 1, 1, 1
                )
            else
                tip:AddDoubleLine(
                    "|cff00ff00卖店|r",
                    FormatGoldIcon(sellPrice) .. "（单价）",
                    1, 0.82, 0, 1, 1, 1
                )
            end
        end

        local key = name and itemID and (name .. ":" .. itemID) or nil
        local curUnit, curTime, minUnit, minTime

        if key and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key] then
            local history = EasyAuctionDB.PriceHistory[key]
            if type(history) == "table" and #history > 0 then
                local last = history[1]
                curUnit = last.unit
                curTime = last.t
                minUnit, minTime = last.unit, last.t
                for _, v in ipairs(history) do
                    if v.unit and (not minUnit or v.unit < minUnit) then
                        minUnit = v.unit
                        minTime = v.t
                    end
                end
            end
        else
            for k, v in pairs(EasyAuctionDB.PriceHistory or {}) do
                if k:match(":(%d+)$") == tostring(itemID) then
                    if type(v) == "table" and #v > 0 then
                        local last = v[1]
                        curUnit = last.unit
                        curTime = last.t
                        minUnit, minTime = last.unit, last.t
                        for _, vv in ipairs(v) do
                            if vv.unit and (not minUnit or vv.unit < minUnit) then
                                minUnit = vv.unit
                                minTime = vv.t
                            end
                        end
                    end
                    break
                end
            end
        end

        if curUnit then
            local ago = curTime and FormatTimeAgo(curTime) or ""
            if showUnitPrice() and count > 1 then
                tip:AddDoubleLine(
                    ("|cff00c0ff拍卖|r %s"):format(ago),
                    FormatGoldIcon(curUnit * count) .. "（总价）",
                    0, 1, 1, 1, 1, 1
                )
            else
                tip:AddDoubleLine(
                    ("|cff00c0ff拍卖|r %s"):format(ago),
                    FormatGoldIcon(curUnit) .. "（单价）",
                    0, 1, 1, 1, 1, 1
                )
            end
        end

        if minUnit and minUnit ~= curUnit then
            local ago = minTime and FormatTimeAgo(minTime) or ""
            if showUnitPrice() and count > 1 then
                tip:AddDoubleLine(
                    ("|cff80ff80史低|r %s"):format(ago),
                    FormatGoldIcon(minUnit * count) .. "（总价）",
                    0, 1, 0.5, 1, 1, 1
                )
            else
                tip:AddDoubleLine(
                    ("|cff80ff80史低|r %s"):format(ago),
                    FormatGoldIcon(minUnit) .. "（单价）",
                    0, 1, 0.5, 1, 1, 1
                )
            end
        end
    end

    if IsDisenchantable(classID, quality) and EasyAuctionDB.enableDisenchant then
        local maxV = GetDisenchantValue(classID, quality, itemLevel)
        local breakdown = GetDisenchantBreakdown(classID, quality, itemLevel)
        if breakdown and #breakdown > 0 then
            if maxV and maxV > 0 then
                tip:AddDoubleLine(
                    "|cff00ff99分解预期|r",
                    FormatGoldIcon(maxV, 12),
                    0, 1, 0, 1, 1, 1
                )
            end
            tip:AddLine("|cff00ff99分解概率：|r")
            for _, mat in ipairs(breakdown) do
                local matName = FormatItemLinkWithColor and FormatItemLinkWithColor(mat.itemid)
                    or (ns.DE_Mats and ns.DE_Mats[mat.itemid] or ("物品" .. tostring(mat.itemid)))
                tip:AddDoubleLine(
                    string.format("   %s", matName),
                    string.format("%dx (%.1f%%)", mat.count, mat.rate * 100),
                    0.5, 1, 0.5, 1, 1, 1
                )
            end
        end
    end

    tip:Show()
end

-- local tip = GameTooltip
-- local origs = {}
-- for k, v in pairs(getmetatable(tip).__index) do
--     if type(v) == "function" and not k:find("SetScript") then
--         origs[k] = v
--         hooksecurefunc(tip, k, function(self, ...)
--             print("GameTooltip方法调用:", k, ...)
--         end)
--     end
-- end
if GameTooltip.SetTradeSkillItem then
    hooksecurefunc(GameTooltip, "SetTradeSkillItem", function(self, arg1, arg2)
        local itemLink
        if arg2 then
            itemLink = GetTradeSkillReagentItemLink(arg1, arg2)
        else
            itemLink = GetTradeSkillItemLink(arg1)
        end
        if itemLink then
            EasyAuction_OnTooltipItem(self, itemLink, 1)
        end
    end)
end

local function FillUnitPriceOnly(unitPrice)
    AuctionBar = _G["AuctionBarFrame"]
    if AuctionBar and AuctionBar.AuctionFrame then
        local f = AuctionBar.AuctionFrame
        local ug = math.floor(unitPrice / 10000)
        local us = math.floor((unitPrice % 10000) / 100)
        local uc = unitPrice % 100
        f.UnitGold:SetNumber(ug)
        f.UnitSilver:SetNumber(us)
        f.UnitCopper:SetNumber(uc)
        if f.StackCount and f.StackCount:GetNumber() then
            local count = f.StackCount:GetNumber()
            local stackTotal = unitPrice * count
            local sg = math.floor(stackTotal / 10000)
            local ss = math.floor((stackTotal % 10000) / 100)
            local sc = stackTotal % 100
            f.StackGold:SetNumber(sg)
            f.StackSilver:SetNumber(ss)
            f.StackCopper:SetNumber(sc)
            local bidDiscount = EasyAuctionDB.bidDiscount or 0.95
            local bidTotal = math.floor(stackTotal * bidDiscount)
            local bg = math.floor(bidTotal / 10000)
            local bs = math.floor((bidTotal % 10000) / 100)
            local bc = bidTotal % 100
            f.BidGold:SetNumber(bg)
            f.BidSilver:SetNumber(bs)
            f.BidCopper:SetNumber(bc)
        end
    end
end

local itemInfoWaitFrame = CreateFrame("Frame")
itemInfoWaitFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
itemInfoWaitFrame:SetScript("OnEvent", function(_, _, itemID, success)
    if GameTooltip and GameTooltip:IsShown() and (GameTooltip.__EA_RefreshWaiting or IsShiftKeyDown()) then
        local tipInfo = _EA_nextTooltipPriceInfo[GameTooltip]
        if tipInfo and tipInfo.itemID == itemID then
            local link = select(2, GetItemInfo(itemID))
            if link then
                tipInfo.link = link
                EasyAuction_OnTooltipItem(GameTooltip, link, tipInfo.count)
                GameTooltip.__EA_RefreshWaiting = nil
            end
        end
    end
end)

function EasyAuction_ShowChart(itemName)
    EasyAuctionDB = EasyAuctionDB or {}
    EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
    local daily = EasyAuctionDB.DailyMinPrice[itemName]
    if not daily then
        if EasyAuction_ChartFrame and EasyAuction_ChartFrame:IsShown() then
            EasyAuction_ChartFrame:Hide()
        end
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    local lastDay
    for k, v in pairs(daily) do
        local vunit = type(v) == "table" and v.unit or v
        if vunit and vunit > 0 then
            if not lastDay or k > lastDay then lastDay = k end
        end
    end
    if not lastDay then
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    local y, m, d = lastDay:match("(%d+)-(%d+)-(%d+)")
    local axisRight = time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })

    local days, points = {}, {}
    for i = 29, 0, -1 do
        local t = date("%Y-%m-%d", axisRight - i * 86400)
        table.insert(days, t)
        local v = daily[t]
        if type(v) == "table" then
            table.insert(points, v.unit or 0)
        else
            table.insert(points, v or 0)
        end
    end

    local chartLeft, chartBottom = 60, 130
    local chartWidth, chartHeight = 400, 120

    if not EasyAuction_ChartFrame then
        local f = CreateFrame("Frame", "EasyAuction_ChartFrame", UIParent, "BackdropTemplate")
        f:SetSize(580, 400)
        f:SetPoint("CENTER")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetMovable(true)
        f:EnableMouse(true)
        f:EnableKeyboard(true)
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
        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.title:SetPoint("TOP", 0, -4)
        f.yLabels, f.yLines = {}, {}
        f.xLabels = {}
        f.dots = {}
        f.dotFrames = {}
        f.lines = {}
        local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
        closeBtn:SetSize(26, 26)
        closeBtn:SetScript("OnClick", function() f:Hide() end)
        tinsert(UISpecialFrames, "EasyAuction_ChartFrame")
    end

    local f = EasyAuction_ChartFrame
    f.title:SetText(itemName .. " 近30天价格走势")
    local sum3, count3 = 0, 0
    for i = 28, 30 do
        if points[i] > 0 then
            sum3 = sum3 + points[i]; count3 = count3 + 1
        end
    end
    local ma3 = (count3 > 0) and math.floor(sum3 / count3 + 0.5) or 0

    local sum7, count7 = 0, 0
    for i = 24, 30 do
        if points[i] > 0 then
            sum7 = sum7 + points[i]; count7 = count7 + 1
        end
    end
    local ma7 = (count7 > 0) and math.floor(sum7 / count7 + 0.5) or 0

    local sum30, count30 = 0, 0
    for i = 1, 30 do
        if points[i] > 0 then
            sum30 = sum30 + points[i]; count30 = count30 + 1
        end
    end
    local ma30 = (count30 > 0) and math.floor(sum30 / count30 + 0.5) or 0

    local hist_max, hist_min, latestVal, latestDay = nil, nil, nil, nil
    if EasyAuctionDB.DailyMinPrice and EasyAuctionDB.DailyMinPrice[itemName] then
        for day, v in pairs(EasyAuctionDB.DailyMinPrice[itemName]) do
            local vunit = type(v) == "table" and v.unit or v
            if vunit and vunit > 0 then
                if not hist_min or vunit < hist_min then hist_min = vunit end
                if not hist_max or vunit > hist_max then hist_max = vunit end
                if not latestDay or day > latestDay then latestDay, latestVal = day, vunit end
            end
        end
    end

    local yest = (points[29] and points[29] > 0) and points[29] or nil
    local last = latestVal

    local priceLines = {
        ("|cff00ff00历史最高：|r%s"):format(FormatGoldIcon(hist_max or 0, 14)),
        ("|cffff2020历史最低：|r%s"):format(FormatGoldIcon(hist_min or 0, 14)),
        ("|cff00c0ff30日均价：|r%s"):format(FormatGoldIcon(ma30, 14)),
        ("|cff00c0ff7日均价：|r%s"):format(FormatGoldIcon(ma7, 14)),
        ("|cff00c0ff3日均价：|r%s"):format(FormatGoldIcon(ma3, 14)),
        ("|cffffff00昨     日：|r%s"):format(yest and FormatGoldIcon(yest, 14) or "--"),
        ("|cffffff00最     新：|r%s"):format(last and FormatGoldIcon(last, 14) or "--"),
    }
    local priceInfo = table.concat(priceLines, "\n")
    if not f.priceInfo then
        f.priceInfo = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        f.priceInfo:SetPoint("TOP", f, "TOP", 20, -30)
        f.priceInfo:SetJustifyH("LEFT")
        f.priceInfo:SetWidth(600)
    end
    f.priceInfo:SetText(priceInfo)
    f.priceInfo:Show()

    local max = 0
    for _, v in ipairs(points) do if v > max then max = v end end
    if max == 0 then max = 1 end

    for i = 0, 4 do
        local y = chartBottom + i * chartHeight / 4
        if not f.yLabels[i] then
            f.yLabels[i] = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            f.yLabels[i]:SetJustifyH("RIGHT")
            f.yLabels[i]:SetWidth(50)
        end
        f.yLabels[i]:SetPoint("RIGHT", f, "BOTTOMLEFT", chartLeft - 4, y)
        if not f.yLines[i] then
            f.yLines[i] = f:CreateTexture()
            f.yLines[i]:SetColorTexture(1, 1, 1, 0.10)
            f.yLines[i]:SetHeight(1)
        end
        f.yLines[i]:SetPoint("LEFT", f, "BOTTOMLEFT", chartLeft, y)
        f.yLines[i]:SetPoint("RIGHT", f, "BOTTOMLEFT", chartLeft + chartWidth, y)
        f.yLines[i]:Show()
    end

    for i = 1, 30 do
        if not f.xLabels[i] then
            f.xLabels[i] = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            f.xLabels[i]:SetWidth(40)
            f.xLabels[i]:SetJustifyH("CENTER")
            local x = chartLeft + (i - 1) * chartWidth / 29
            f.xLabels[i]:SetPoint("BOTTOM", f, "BOTTOMLEFT", x, chartBottom - 18)
        end
        local d = days[i]:gsub("^%d%d%d%d%-", ""):gsub("^0", "")
        if i == 1 or i == 8 or i == 15 or i == 22 or i == 30 then
            f.xLabels[i]:SetText(d)
        else
            f.xLabels[i]:SetText("")
        end
    end

    local validIndices = {}
    for i = 1, 30 do
        if points[i] > 0 then
            table.insert(validIndices, i)
        end
    end

    local lineIdx = 1
    for k = 1, #validIndices - 1 do
        local i = validIndices[k]
        local j = validIndices[k + 1]
        local x1 = chartLeft + (i - 1) * chartWidth / 29
        local y1 = chartBottom + (points[i] / max) * chartHeight
        local x2 = chartLeft + (j - 1) * chartWidth / 29
        local y2 = chartBottom + (points[j] / max) * chartHeight

        if not f.lines[lineIdx] then
            f.lines[lineIdx] = f:CreateTexture()
            f.lines[lineIdx]:SetColorTexture(0, 0.7, 1, 1)
            f.lines[lineIdx]:SetDrawLayer("ARTWORK", 2)
        end

        local dx, dy = x2 - x1, y2 - y1
        local len = math.sqrt(dx * dx + dy * dy)
        local angle = math.atan2(dy, dx)
        f.lines[lineIdx]:ClearAllPoints()
        f.lines[lineIdx]:SetPoint("CENTER", f, "BOTTOMLEFT", x1 + dx / 2, y1 + dy / 2)
        f.lines[lineIdx]:SetSize(len, 2)
        f.lines[lineIdx]:SetRotation(angle)
        f.lines[lineIdx]:Show()
        lineIdx = lineIdx + 1
    end

    for i = lineIdx, #f.lines do
        if f.lines[i] then f.lines[i]:Hide() end
    end
    local dotSize = 20
    for i = 1, 30 do
        if not f.dotFrames[i] then
            local frame = CreateFrame("Frame", nil, f)
            frame:SetSize(dotSize * 1.2, dotSize * 1.2)
            frame:SetFrameStrata("FULLSCREEN_DIALOG")
            frame:SetScript("OnEnter", function(self)
                local idx = self.idx
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(date("%m-%d", axisRight - (30 - idx) * 86400) .. " 价格")
                if points[idx] > 0 then
                    GameTooltip:AddLine("最低价：" .. FormatGoldIcon(points[idx], 18))
                else
                    GameTooltip:AddLine("无数据")
                end
                GameTooltip:Show()
            end)
            frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
            f.dotFrames[i] = frame
        end
        local x = chartLeft + (i - 1) * chartWidth / 29
        local y = chartBottom + (points[i] / max) * chartHeight
        f.dotFrames[i]:SetPoint("CENTER", f, "BOTTOMLEFT", x, y)
        f.dotFrames[i].idx = i
        if points[i] > 0 then
            f.dotFrames[i]:Show()
        else
            f.dotFrames[i]:Hide()
        end

        if not f.dots[i] then
            f.dots[i] = f.dotFrames[i]:CreateTexture()
            f.dots[i]:SetDrawLayer("ARTWORK", 3)
        end
        f.dots[i]:SetPoint("CENTER")
        if points[i] > 0 then
            if i == 30 then
                f.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Green")
            else
                f.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Yellow")
            end
            f.dots[i]:SetSize(dotSize, dotSize)
            f.dots[i]:Show()
        else
            f.dots[i]:Hide()
        end
    end
    for i = 31, #f.dotFrames do
        if f.dotFrames[i] then f.dotFrames[i]:Hide() end
    end
    for i = 31, #f.dots do
        if f.dots[i] then f.dots[i]:Hide() end
    end
    if not f.trendText then
        f.trendText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        f.trendText:SetPoint("BOTTOM", f, "BOTTOM", 0, 25)
        f.trendText:SetWidth(500)
        f.trendText:SetJustifyH("LEFT")
    end
    local validCount = 0
    for i = 1, 30 do
        if points[i] > 0 then validCount = validCount + 1 end
    end

    local trendStr = ""
    local advices = {}

    if validCount < 2 then
        trendStr = "暂无足够数据分析走势。"
        advices = {}
    else
        local first, last
        for i = 1, 30 do
            if points[i] > 0 then
                if not first then first = points[i] end
                last = points[i]
            end
        end
        if first and last then
            local pct = (last - first) / first
            if pct > 0.10 then
                trendStr = "|cff00ff00近期价格呈上涨趋势|r，"
            elseif pct < -0.10 then
                trendStr = "|cffff2020近期价格呈下降趋势|r，"
            else
                trendStr = "|cffffff00近期价格整体平稳|r，"
            end

            local minV, maxV = first, first
            for i = 1, 30 do
                if points[i] > 0 then
                    if points[i] < minV then minV = points[i] end
                    if points[i] > maxV then maxV = points[i] end
                end
            end
            local volatility = (maxV - minV) / first
            if volatility > 0.5 then
                trendStr = trendStr .. "区间极大，行情如过山车，需关注极端波动风险。"
            elseif volatility > 0.25 then
                trendStr = trendStr .. "价格波动较大，操作需谨慎。"
            elseif volatility < 0.08 then
                trendStr = trendStr .. "波澜不惊，主力可能蓄势待发。"
            else
                trendStr = trendStr .. "波动适中。"
            end
        else
            trendStr = "暂无足够数据分析走势。"
        end
        local sum, count = 0, 0
        for i = 24, 30 do
            if points[i] > 0 then
                sum = sum + points[i]; count = count + 1
            end
        end
        local ma7 = (count > 0) and (sum / count) or nil

        local ma3 = {}
        for i = 7, 30 do
            local s, c = 0, 0
            for j = i - 2, i do
                if j >= 1 and points[j] > 0 then
                    s = s + points[j]; c = c + 1
                end
            end
            ma3[i] = (c > 0) and (s / c) or nil
        end
        if ma7 and points[30] then
            if points[30] > ma7 * 1.10 then
                table.insert(advices, "|cff00ff00多头排列，强势上攻，短线有资金推动迹象。|r")
            elseif points[30] < ma7 * 0.90 then
                table.insert(advices, "|cffff2020空头陷阱格局，短线仍需防范下行风险。|r")
            elseif math.abs(points[30] - ma7) < ma7 * 0.03 then
                table.insert(advices, "|cffffff00均线粘合，行情或将变盘，静待方向选择。|r")
            end
        end
        local up_count, down_count = 0, 0
        for i = 2, 30 do
            if points[i] > 0 and points[i - 1] > 0 then
                if points[i] > points[i - 1] then
                    up_count = up_count + 1
                    down_count = 0
                elseif points[i] < points[i - 1] then
                    down_count = down_count + 1
                    up_count = 0
                end
            end
        end
        if up_count >= 3 then
            table.insert(advices, "连续多日上涨，短线或有获利回吐压力，谨防追高。")
        elseif down_count >= 3 then
            table.insert(advices, "连续下跌，疑似主力吸筹，短线可关注反弹机遇。")
        end
        if last and first then
            local minV, maxV
            minV, maxV = first, first
            for i = 1, 30 do
                if points[i] > 0 then
                    if points[i] < minV then minV = points[i] end
                    if points[i] > maxV then maxV = points[i] end
                end
            end
            if last == maxV and maxV > minV * 1.30 then
                table.insert(advices, "|cffffd700刚突破近期新高，主力拉升迹象明显。|r")
            elseif last == minV and maxV > minV * 1.30 then
                table.insert(advices, "|cffff2020跌至新低，或有抄底资金介入。|r")
            end
        end
        local btop, blow = nil, nil
        if #points >= 10 then
            local last10max, last10min = 0, 1e10
            for i = 21, 30 do
                if points[i] > 0 then
                    if points[i] > last10max then last10max = points[i] end
                    if points[i] < last10min then last10min = points[i] end
                end
            end
            if points[30] >= last10max and last10max > 0 then btop = true end
            if points[30] <= last10min and last10min < 1e10 then blow = true end
        end
        if btop then table.insert(advices, "|cff00ff00价格突破近期高点，多头动能增强，关注强势表现。|r") end
        if blow then table.insert(advices, "|cffff2020价格跌破近期低点，弱势明显，注意风险控制。|r") end

        if #advices == 0 then
            table.insert(advices, "暂无明显主力信号，建议观望为主。")
        end
    end

    f.trendText:SetText("|cffffff00走势分析：|r" .. trendStr .. (#advices > 0 and "\n" .. table.concat(advices, "\n") or ""))
    f.trendText:Show()
    f:Show()
end

function ShowPriceFrame(itemName, data, page)
    -- if AuctionHelper and AuctionHelper:IsShown() then
    --     PriceFrame:Hide()
    --     return
    -- end
    if (not data) or (#data == 0) then
        if EasyAuction_DistributionFrame and EasyAuction_DistributionFrame:IsShown() then
            EasyAuction_DistributionFrame:Hide()
        end
        PriceFrame:Hide()
        if itemName and itemName ~= "" then
            StaticPopupDialogs["EASYAUCTION_NO_HISTORY"] = {
                text = "没有该物品的历史价格，\n请先在拍卖行搜索获取价格数据。",
                button1 = "确定",
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            StaticPopup_Show("EASYAUCTION_NO_HISTORY")
        end
        return
    end

    priceDataCache = data
    priceTotalPages = math.max(1, math.ceil(#data / PRICE_ROWS_PER_PAGE))
    if not page then priceCurrentPage = 1 else priceCurrentPage = page end
    if priceCurrentPage < 1 then priceCurrentPage = 1 end
    if priceCurrentPage > priceTotalPages then priceCurrentPage = priceTotalPages end

    table.sort(data, function(a, b) return a.unit < b.unit end)

    local startIdx = (priceCurrentPage - 1) * PRICE_ROWS_PER_PAGE + 1

    for i, btn in ipairs(PriceFrame.rows) do
        local idx = startIdx + i - 1
        local info = data[idx]
        if i <= PRICE_ROWS_PER_PAGE and info then
            btn:Show()
            btn.cols[1]:SetText(string.format("%2d", idx))
            btn.cols[1]:Show()
            btn.cols[2]:SetText(string.format("%4d", info.count or 0))
            btn.cols[2]:Show()
            btn.cols[3]:SetText(FormatGoldIcon(info.unit))
            btn.cols[3]:Show()
            btn.cols[4]:SetText(info.owner or "-")
            btn.cols[4]:Show()
            btn:SetScript("OnClick", function()
                EasyAuctionDB.LastSelectedPriceInfo = info
                FillAuctionPrice(info.unit)
                FillUnitPriceOnly(info.unit)
            end)
        else
            for k = 1, 4 do
                if btn.cols[k] then
                    btn.cols[k]:SetText(""); btn.cols[k]:Hide()
                end
            end
            btn:Hide()
        end
    end

    pricePrevBtn:SetShown(priceTotalPages > 1)
    priceNextBtn:SetShown(priceTotalPages > 1)
    pricePrevBtn:SetEnabled(priceCurrentPage > 1)
    priceNextBtn:SetEnabled(priceCurrentPage < priceTotalPages)
    pricePageText:SetText(string.format("第%d/%d页", priceCurrentPage, priceTotalPages))

    local ItemNameFS = _G["EasyAuctionPriceFrameItemName"]
    if ItemNameFS then
        ItemNameFS:SetText("[" .. (itemName or "") .. "]")
    end
    local TimeFS = _G["EasyAuctionPriceFrameTime"]
    local timeStr = ""
    if data[1] and data[1].t then
        timeStr = date("%Y-%m-%d %H:%M", data[1].t)
    end
    if TimeFS then
        TimeFS:ClearAllPoints()
        TimeFS:SetPoint("BOTTOMLEFT", PriceFrame, "BOTTOMLEFT", 15, 42)
        TimeFS:SetText("采集时间：" .. timeStr)
    end

    if not PriceFrame._itemInfoEventRegistered then
        local f = CreateFrame("Frame")
        f:RegisterEvent("GET_ITEM_INFO_RECEIVED")
        f:SetScript("OnEvent", function(_, _, _, success)
            if success and PriceFrame:IsShown() then
                if PriceFrame.__ea_in_update then return end
                PriceFrame.__ea_in_update = true
                local itemNameFS = _G["EasyAuctionPriceFrameItemName"]
                local itemName = itemNameFS and itemNameFS:GetText():gsub("[%[%]]", "")
                if itemName and itemName ~= "" then
                    ShowPriceFrame(itemName, priceDataCache, priceCurrentPage)
                end
                PriceFrame.__ea_in_update = nil
            end
        end)
        PriceFrame._itemInfoEventRegistered = true
    end
    if data and #data > 0 then
        C_Timer.After(0.05, function()
            local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
            local priceList
            if name and itemID then
                local key = name .. ":" .. itemID
                priceList = EasyAuctionDB.PriceHistory[key]
            end
            if priceList and #priceList > 0 then
                local minUnit = priceList[1].unit
                for _, v in ipairs(priceList) do
                    if v.unit < minUnit then minUnit = v.unit end
                end
                EasyAuctionDB.LastSelectedPriceInfo = nil
                FillAuctionPrice(minUnit)
                --print("|cff00ff00[EasyAuction]|r 自动填价，物品："..(name or "?").."，最低单价："..FormatGoldIcon(minUnit))
            else
                --print("|cffff0000[EasyAuction]|r 没有历史价格数据："..(name or "?"))
            end
        end)
    end
    if AuctionsStackSizeEntry and not AuctionsStackSizeEntry.EasyAuction_PriceAutoFillHooked then
        AuctionsStackSizeEntry:HookScript("OnTextChanged", function(self)
            if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
                local info = EasyAuctionDB.LastSelectedPriceInfo
                if not info and priceDataCache and #priceDataCache > 0 then
                    info = priceDataCache[1]
                    for _, v in ipairs(priceDataCache) do
                        if v.unit < info.unit then info = v end
                    end
                    EasyAuctionDB.LastSelectedPriceInfo = info
                end
                if info then
                    FillAuctionPrice(info.unit)
                    RefreshMinPriceLines(itemName)
                end
            end
        end)
        AuctionsStackSizeEntry.EasyAuction_PriceAutoFillHooked = true
    end

    local VendorPriceFS = _G["EasyAuctionPriceFrameVendorPrice"]
    local vendorPrice
    if itemName then
        local itemID = tonumber(itemName:match(":(%d+)$"))
        local name2, _, _, _, _, _, _, _, _, _, sellPrice
        if itemID then
            name2, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemID)
        else
            name2, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemName)
        end
        if sellPrice and sellPrice > 0 then
            vendorPrice = sellPrice
        end
    end
    if VendorPriceFS then
        if vendorPrice then
            VendorPriceFS:SetText("|cff00ff00卖店价：|r" .. FormatGoldIcon(vendorPrice))
        else
            VendorPriceFS:SetText("|cff00ff00卖店价：|r无")
        end
    end

    local MinPriceFS = _G["EasyAuctionPriceFrameMinPrice"]
    if MinPriceFS and not MinPriceFS.EasyAuctionClickable then
        MinPriceFS:EnableMouse(true)
        MinPriceFS:SetScript("OnMouseUp", function(self, button)
            local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
            local key = name and itemID and (name .. ":" .. itemID) or name
            local minHistory = key and EasyAuctionDB.PriceHistory[key] and EasyAuctionDB.PriceHistory[key].minUnit
            if minHistory then
                FillAuctionPrice(minHistory)
                print("|cff00ff00[EasyAuction]|r 已使用历史最低价。")
            else
                print("|cffff0000[EasyAuction]|r 无历史最低价数据，请先搜索获得历史价格！")
            end
        end)
        MinPriceFS:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("点击以历史最低价销售", 1, 1, 1)
            GameTooltip:Show()
        end)
        MinPriceFS:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)
        MinPriceFS.EasyAuctionClickable = true
    end

    local minHistory = EasyAuctionDB.PriceHistory[itemName] and EasyAuctionDB.PriceHistory[itemName].minUnit
    if data and #data > 0 then
        for _, v in ipairs(data) do
            if not minHistory or v.unit < minHistory then minHistory = v.unit end
        end
    end

    if MinPriceFS then
        if minHistory then
            MinPriceFS:SetText("|cff00c0ff历史最低价：|r" .. FormatGoldIcon(minHistory))
        else
            MinPriceFS:SetText("|cff00c0ff历史最低价：|r无")
        end
    end

    if not PriceFrame.EasyAuction_DistributionButton then
        local btn = CreateFrame("Button", nil, PriceFrame, "UIPanelButtonTemplate")
        btn:SetText("价格分布")
        btn:SetSize(90, 22)
        btn:SetPoint("BOTTOMRIGHT", PriceFrame, "BOTTOMRIGHT", -15, 41)
        btn:Show()
        PriceFrame.EasyAuction_DistributionButton = btn
    end
    PriceFrame.EasyAuction_DistributionButton:SetScript("OnClick", function()
        ShowDistributionFrame(itemName, priceDataCache)
    end)

    if not PriceFrame.EasyAuction_ChartButton then
        local btn = CreateFrame("Button", nil, PriceFrame, "UIPanelButtonTemplate")
        btn:SetText("价格走势图")
        btn:SetSize(90, 22)
        btn:SetPoint("BOTTOMRIGHT", PriceFrame, "BOTTOMRIGHT", -15, 15)
        btn:Show()
        PriceFrame.EasyAuction_ChartButton = btn
    end

    PriceFrame.EasyAuction_ChartButton:SetScript("OnClick", function()
        EasyAuction_ShowChart(itemName)
    end)
    EasyAuctionDB.CurrentDistItemName = itemName
    EasyAuctionDB.CurrentDistData = data

    if (not data) or (#data == 0) then
        if EasyAuction_DistributionFrame and EasyAuction_DistributionFrame:IsShown() then
            EasyAuction_DistributionFrame:Hide()
        end
    else
        if EasyAuction_DistributionFrame and EasyAuction_DistributionFrame:IsShown() then
            ShowDistributionFrame(itemName, data)
        end
    end
    if PriceFrame and PriceFrame.DistributionArea then
        EasyAuction_UpdateInlineDistribution(itemName, data)
    end
    PriceFrame:Show()
end

function ShowDistributionFrame(itemName, data)
    if not data or #data == 0 then
        if EasyAuction_DistributionFrame then
            EasyAuction_DistributionFrame:Hide()
        end
        return
    end

    local FRAME_WIDTH = 480
    local FRAME_HEIGHT = 340
    local ROW_HEIGHT = 18
    local MAX_ROWS = 12

    if not EasyAuction_DistributionFrame then
        local f = CreateFrame("Frame", "EasyAuction_DistributionFrame", UIParent, "BackdropTemplate")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetSize(FRAME_WIDTH, FRAME_HEIGHT)
        if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
            f:SetPoint("LEFT", EasyAuctionPriceFrame, "RIGHT", 10, 0)
        else
            f:SetPoint("CENTER")
        end
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", function(self) self:StartMoving() end)
        f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
        f:SetClampedToScreen(true)
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

        f:EnableKeyboard(true)
        f:SetPropagateKeyboardInput(true)

        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.title:SetPoint("TOP", 0, -12)
        f.title:SetText("价格分布统计")

        f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        f.summary:SetPoint("TOP", f.title, "BOTTOM", 0, -4)
        f.summary:SetJustifyH("LEFT")
        f.summary:SetWidth(FRAME_WIDTH - 40)

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -6, -6)
        f.closeBtn = closeBtn

        f.scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
        f.scroll:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -110)
        f.scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 12)

        f.content = CreateFrame("Frame", nil, f.scroll)
        f.scroll:SetScrollChild(f.content)
        f.content:SetSize(FRAME_WIDTH - 42, ROW_HEIGHT * MAX_ROWS)
        f.content.rows = {}

        f:EnableMouseWheel(true)
        f:SetScript("OnMouseWheel", function(self, delta)
            local scrollbar = _G[f.scroll:GetName() .. "ScrollBar"]
            if scrollbar and scrollbar:IsShown() then
                local min, max = scrollbar:GetMinMaxValues()
                local value = scrollbar:GetValue()
                if delta < 0 then
                    scrollbar:SetValue(math.min(value + ROW_HEIGHT * 2, max))
                else
                    scrollbar:SetValue(math.max(value - ROW_HEIGHT * 2, min))
                end
            end
        end)
        local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
        closeBtn:SetSize(26, 26)
        closeBtn:SetScript("OnClick", function() f:Hide() end)
        tinsert(UISpecialFrames, "EasyAuction_DistributionFrame")
        EasyAuction_DistributionFrame = f
    end

    local f = EasyAuction_DistributionFrame
    f:Show()

    if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
        f:ClearAllPoints()
        f:SetPoint("LEFT", EasyAuctionPriceFrame, "RIGHT", 10, 0)
    end
    f.title:SetText("|cffffd200" .. (itemName or "") .. "|r 价格分布统计")


    local stats, maxCount = {}, 0
    for _, v in ipairs(data or {}) do
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

    local totalRows = #statArr
    f.content:SetHeight(ROW_HEIGHT * totalRows)

    local MAX_BAR = 22
    for idx, v in ipairs(statArr) do
        local row = f.content.rows[idx]
        if not row then
            row = CreateFrame("Frame", nil, f.content)
            row:SetSize(FRAME_WIDTH - 42, ROW_HEIGHT)
            row.icon = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            row.icon:SetPoint("LEFT", row, "LEFT", 4, 0)
            row.bar = row:CreateTexture(nil, "ARTWORK")
            row.bar:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
            row.bar:SetHeight(14)
            row.count = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            row.count:SetPoint("LEFT", row.bar, "RIGHT", 12, 0)
            row:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText("点击此价格自动填入拍卖栏", 0, 1, 0)
                GameTooltip:Show()
            end)
            row:SetScript("OnLeave", function() GameTooltip:Hide() end)
            f.content.rows[idx] = row
        end
        row:SetPoint("TOPLEFT", f.content, "TOPLEFT", 0, -ROW_HEIGHT * (idx - 1) - 4)
        row.icon:SetText(FormatGoldIcon(v.unit, 14))
        local barLen = maxCount > 0 and math.max(1, math.floor(v.count / maxCount * MAX_BAR + 0.5)) or 1
        row.bar:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
        row.bar:SetVertexColor(0, 1, 0, 1)
        row.bar:SetWidth(barLen * 8)
        row.bar:Show()
        row.count:SetText("|cffffde00" .. v.count .. "|r")
        row:Show()
        row.icon:EnableMouse(true)
        row.icon:SetScript("OnMouseUp", function()
            FillAuctionPrice(v.unit)
            print("|cff00ff00[EasyAuction]|r 已自动填入单价：" .. FormatGoldIcon(v.unit, 14))
        end)
        row.icon:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("点击自动填入拍卖栏单价", 1, 1, 0)
            GameTooltip:Show()
        end)
        row.icon:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end

    local totalCount = 0
    for _, v in ipairs(statArr) do totalCount = totalCount + v.count end

    table.sort(statArr, function(a, b) return a.count > b.count end)
    local top3 = {}
    for i = 1, math.min(3, #statArr) do
        local v = statArr[i]
        local percent = totalCount > 0 and v.count / totalCount * 100 or 0
        table.insert(top3, string.format("%s (%.1f%%)", FormatGoldIcon(v.unit, 12), percent))
    end
    local top3text = #top3 > 0 and table.concat(top3, "\n") or "无"
    f.summary:SetText(string.format(
        "|cffffee00样本数：%d|r\n占比前三：\n%s",
        totalCount, top3text
    ))
    f.summary:Show()
    for i = #statArr + 1, #f.content.rows do
        if f.content.rows[i] then f.content.rows[i]:Hide() end
    end
end

pricePrevBtn:SetScript("OnClick", function()
    if priceCurrentPage > 1 then
        ShowPriceFrame(_G["EasyAuctionPriceFrameItemName"]:GetText():gsub("[%[%]]", ""), priceDataCache,
            priceCurrentPage - 1)
    end
end)

priceNextBtn:SetScript("OnClick", function()
    if priceCurrentPage < priceTotalPages then
        ShowPriceFrame(_G["EasyAuctionPriceFrameItemName"]:GetText():gsub("[%[%]]", ""), priceDataCache,
            priceCurrentPage + 1)
    end
end)

local lastSearchName
hooksecurefunc("QueryAuctionItems", function(name, ...)
    if name and name ~= "" then
        lastSearchName = name
    else
        lastSearchName = nil
    end
end)

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
eventFrame:SetScript("OnEvent", function()
    if IsScanningAll then return end

    local DB = EasyAuctionDB or {}
    local n = GetNumAuctionItems("list")
    local today = date("%Y-%m-%d")
    local searchList, searchMinUnit, searchItemID = {}, nil, nil

    for i = 1, n do
        local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list", i)
        local link = GetAuctionItemLink("list", i)
        if name and itemID and buyout and buyout > 0 and count and count > 0 then
            local unit = math.floor((buyout / count) + 0.5)
            local key = name .. ":" .. itemID
            AddRecentSearch(itemID, name, unit, time())
            DB.PriceHistory[key] = DB.PriceHistory[key] or {}
            table.insert(DB.PriceHistory[key],
                { count = count, unit = unit, t = time(), link = link, owner = owner, itemID = itemID })
            DB.CurrentTodayMin[key] = (not DB.CurrentTodayMin[key] or DB.CurrentTodayMin[key] == 0 or unit < DB.CurrentTodayMin[key]) and
                unit or DB.CurrentTodayMin[key]
            DB.DailyMinPrice[key] = DB.DailyMinPrice[key] or {}
            if not DB.DailyMinPrice[key][today] or (DB.DailyMinPrice[key][today].unit or 0) == 0 or unit < DB.DailyMinPrice[key][today].unit then
                DB.DailyMinPrice[key][today] = { unit = unit, count = count }
            elseif unit == DB.DailyMinPrice[key][today].unit then
                DB.DailyMinPrice[key][today].count = DB.DailyMinPrice[key][today].count + count
            end
        end
    end

    if lastSearchName then
        for i = 1, n do
            local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list", i)
            local link = GetAuctionItemLink("list", i)
            if name == lastSearchName and buyout and buyout > 0 and count and count > 0 then
                local unit = math.floor((buyout / count) + 0.5)
                table.insert(searchList,
                    { count = count, unit = unit, t = time(), owner = owner, itemID = itemID, link = link, })
                searchMinUnit = not searchMinUnit and unit or math.min(searchMinUnit, unit)
                searchItemID = itemID
                ns.searchItemID = searchItemID
            end
        end
        if searchMinUnit and searchList[1] and searchItemID then
            local key = lastSearchName .. ":" .. searchItemID
            local minCount = 0
            for _, v in ipairs(searchList) do if v.unit == searchMinUnit then minCount = minCount + (v.count or 1) end end
            DB.DailyMinPrice[key] = DB.DailyMinPrice[key] or {}
            DB.DailyMinPrice[key][today] = { unit = math.floor(searchMinUnit + 0.5), count = minCount }
            DB.CurrentTodayMin[key] = (not DB.CurrentTodayMin[key] or DB.CurrentTodayMin[key] == 0 or searchMinUnit < DB.CurrentTodayMin[key]) and
                searchMinUnit or DB.CurrentTodayMin[key]
            DB.PriceHistory[key] = searchList
            DB.LastScanMinPrice = DB.LastScanMinPrice or {}
            DB.LastScanMinPrice[key] = searchMinUnit
        end
    end

    for key, todayMin in pairs(DB.CurrentTodayMin) do
        if todayMin and todayMin > 0 then
            local history = DB.PriceHistory[key]
            local minUnit = nil
            if type(history) == "table" then
                for _, v in ipairs(history) do
                    if v.unit and (not minUnit or v.unit < minUnit) then minUnit = v.unit end
                end
            end
            local finalMin = minUnit and todayMin and math.min(todayMin, minUnit) or (todayMin or minUnit)
            if history then history.minUnit = finalMin end
        end
    end

    if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() and type(RefreshDBFrame) == "function" then RefreshDBFrame() end
    if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
        local showName = (_G["EasyAuctionPriceFrameItemName"] and _G["EasyAuctionPriceFrameItemName"]:GetText() or "")
            :gsub("[%[%]]", "")
        local showItemID = n > 0 and select(17, GetAuctionItemInfo("list", 1)) or nil
        local key = (showName and showItemID) and (showName .. ":" .. showItemID) or showName
        local key2 = (lastSearchName and ns.searchItemID) and (lastSearchName .. ":" .. ns.searchItemID) or
            lastSearchName
        if lastSearchName and ns.searchItemID then
            ShowPriceFrame(key2, DB.PriceHistory[key2])
        elseif DB.PriceHistory[showName] then
            ShowPriceFrame(key, DB.PriceHistory[key])
        end
    end
    if EasyAuction_DistributionFrame and EasyAuction_DistributionFrame:IsShown() then
        ShowDistributionFrame(DB.CurrentDistItemName, DB.CurrentDistData)
    end
    local curName, _, _, _, _, _, _, _, _, curItemID = GetAuctionSellItemInfo()
    if curName and curItemID and (not lastSearchName or curName == lastSearchName) then
        local key = curName .. ":" .. curItemID
        if DB.PriceHistory[key] and #DB.PriceHistory[key] > 0 then
            if EasyAuctionPriceFrame and not EasyAuctionPriceFrame:IsShown() and not AuctionHelper:IsShown() then
                ShowPriceFrame(key, DB.PriceHistory[key])
            end
        end
    end
    if EasyAuction_ChartFrame and EasyAuction_ChartFrame:IsShown() and n > 0 then
        local chartItem = (_G["EasyAuction_ChartFrame"] and EasyAuction_ChartFrame.title and EasyAuction_ChartFrame.title:GetText() or "")
            :match("^(.+) 近%d+天价格走势")
        if chartItem then
            local showItemID = select(17, GetAuctionItemInfo("list", 1))
            if showItemID then
                local key = chartItem .. ":" .. showItemID
                EasyAuction_ShowChart(key)
            end
        end
    end
    if AuctionBar and AuctionBar.AuctionFrame and EasyAuction_UpdateInlineDistribution then
        local sellName, _, _, _, _, _, _, _, _, sellItemID = GetAuctionSellItemInfo()
        if sellName and sellItemID then
            local key = sellName .. ":" .. sellItemID
            EasyAuction_UpdateInlineDistribution(key, DB.PriceHistory[key])
        end
    end

    if curName and lastSearchName == curName then
        local key = lastSearchName .. ":" .. (searchList and searchList[1] and searchList[1].itemID or "")
        EasyAuction_UpdateInlineDistribution(key, searchList)
        RefreshMinPriceLines(lastSearchName, searchList and searchList[1] and searchList[1].itemID)
    elseif lastSearchName == nil and n > 0 then
        local name, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, itemID = GetAuctionItemInfo("list", 1)
        if name and itemID then
            local key = name .. ":" .. itemID
            local history = DB.PriceHistory[key]
            EasyAuction_UpdateInlineDistribution(key, history)
            RefreshMinPriceLines(name, itemID)
        end
    elseif searchList and searchList[1] and searchList[1].itemID and not curName then
        local key = lastSearchName .. ":" .. searchList[1].itemID
        EasyAuction_UpdateInlineDistribution(key, searchList)
        RefreshMinPriceLines(lastSearchName, searchList[1].itemID)
    end
    RefreshRecentSearchRows()
    RefreshFavoriteRows()
    if AuctionBar and AuctionBar.AuctionFrame and AuctionBar.AuctionFrame:IsShown() then
        local f = AuctionBar.AuctionFrame
        local name, _, _, _, _, _, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
        if name and itemID then
            if type(RefreshMinPriceLines) == "function" then RefreshMinPriceLines(name, itemID) end
            if type(MyAH_AutoFillPrice) == "function" then MyAH_AutoFillPrice() end
            local key = name .. ":" .. itemID
            if type(EasyAuction_UpdateInlineDistribution) == "function" and DB.PriceHistory[key] then
                EasyAuction_UpdateInlineDistribution(key, DB.PriceHistory[key])
            end
            if type(UpdateTrendFrame) == "function" then
                UpdateTrendFrame(key)
            end
        end
    end
end)
local closeEvent = CreateFrame("Frame")
closeEvent:RegisterEvent("AUCTION_HOUSE_CLOSED")
closeEvent:SetScript("OnEvent", function()
    PriceFrame:Hide()
    if EasyAuction_DistributionFrame then EasyAuction_DistributionFrame:Hide() end
end)

DBFrame = EasyAuctionDBFrame
if DBFrame.SetBackdrop then
    DBFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 6, right = 6, top = 6, bottom = 6 }
    })
    DBFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
    DBFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
end

local DBFrame_CloseBtn = _G["EasyAuctionDBFrameClose"]
DBFrame_CloseBtn:SetScript("OnClick", function(self)
    self:GetParent():Hide()
end)

local resetBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
resetBtn:SetSize(80, 22)
resetBtn:SetPoint("BOTTOMRIGHT", DBFrame, "BOTTOMRIGHT", -20, 40)
resetBtn:SetText("|TInterface/Icons/INV_Misc_Coin_01:12:12:0:0|t 重置数据")
resetBtn:Hide()

DBFrame:HookScript("OnShow", function()
    resetBtn:Show()
end)
DBFrame:HookScript("OnHide", function()
    resetBtn:Hide()
end)

local opportunityBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
opportunityBtn:SetSize(80, 22)
opportunityBtn:SetPoint("RIGHT", resetBtn, "LEFT", -5, 0)
opportunityBtn:SetText("寻找商机")
opportunityBtn:SetScript("OnClick", function()
    EasyAuction_ChanceFrame()
end)
opportunityBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:AddLine("自动筛选价格库中的低价/套利商机", 1, 1, 1)
    GameTooltip:AddLine("快速发现低于均价、昨日或卖店价的好买卖", 0.85, 0.85, 0.85)
    GameTooltip:Show()
end)
opportunityBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

local headerNames = {
    "物品名",
    "在售数",
    "历史最低价",
    "最新单价",
    "采集时间",
    "碎片数",
    "每碎片价值",
}
local headerSortKeys = {
    nil, "name", "num", "history", "min", "t", "titan", "titanval"
}
local headerButtons = {}

local headerPositions = {
    { x = 18,  width = 50 },
    { x = 60,  width = 220 },
    { x = 240, width = 120 },
    { x = 360, width = 120 },
    { x = 480, width = 130 },
    { x = 570, width = 75 },
    { x = 650, width = 120 },
}

for i = 2, #headerNames do
    local btn = CreateFrame("Button", "EasyAuctionDBHeaderBtn" .. i, DBFrame)
    btn:SetFrameLevel(DBFrame:GetFrameLevel() + 2)
    btn:SetSize(headerPositions[i].width, 22)
    btn:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", headerPositions[i].x, -40)
    btn:SetAlpha(0)
    btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    headerButtons[i] = btn
end

local currentSortKey = "t"
local currentSortReverse = true

for i = 2, #headerButtons do
    local btn = headerButtons[i]
    btn:SetScript("OnClick", function()
        local sortKey = headerSortKeys[i]
        if currentSortKey == sortKey then
            currentSortReverse = not currentSortReverse
        else
            currentSortKey = sortKey
            currentSortReverse = false
        end
        RefreshDBFrame()
    end)
end

EASYAUCTION_HELP_TEXT = [[
|cffff8800插件使用指引|r
|cff00bfff1、|r进入拍卖行后，请先切换至|cffffff00【搜索】|r页面。
|cff00bfff2、|r建议用Shift+左键点击物品，将其自动填入搜索栏，节省手动输入的时间。
|cff00bfff3、|r点击|cffffde00“排序”|r，便于快速找到价格最低的拍卖。
|cff00bfff4、|r按下|cffffde00“搜索”|r按钮，查看同类商品的市场最低价。
|cff00bfff5、|r切换到|cffffde00【拍卖】|r页面，将物品拖入上架区域准备出售。
|cff00bfff6、|r插件会自动弹出可用价格列表，直接点击心仪价格即可自动填写售价。
|cff00bfff7、|r请仔细检查单价、堆叠数量和拍卖组数，最后点击|cffffde00“开始拍卖”|r完成上架。

|cffff8800特别说明|r
|cff00bfff1、|r如同时启用其他拍卖插件，建议临时关闭以避免功能冲突。
|cff00bfff2、|r价格列表仅供参考，若发现异常低价，请多核查几页，避免被“钓鱼价”误导。
|cff00bfff3、|r全局搜索后，耐心等待拍卖行刷新，勿频繁点击以防卡顿。
|cff00bfff4、|r遇到界面卡死或搜索失败，建议检查插件兼容性或尝试/reload 重载界面。

|cffff8800插件命令速览|r
|cffffde00/epah|r —— 打开价格数据库界面。
|cffffde00/epsp|r —— 开启或关闭鼠标提示中的价格、分解信息。

|cffffde00友情提示：请理性定价，谨防低价货被恶意抢购！|r
]]

local ROWS_NUM = 12
local currentPage = 1
local totalPages = 1
local dbItemList = {}
local prevBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
prevBtn:SetSize(60, 22)
prevBtn:SetPoint("BOTTOMLEFT", 15, 40)
prevBtn:SetText("上一页")
prevBtn:Hide()

local nextBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
nextBtn:SetSize(60, 22)
nextBtn:SetPoint("BOTTOMLEFT", prevBtn, "BOTTOMRIGHT", 10, 0)
nextBtn:SetText("下一页")
nextBtn:Hide()

local pageText = DBFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
pageText:SetPoint("LEFT", nextBtn, "RIGHT", 10, 0)
pageText:SetText("")

DBFrame.rows = DBFrame.rows or {}
for i = 1, ROWS_NUM do
    if not DBFrame.rows[i] then
        local btn = CreateFrame("Button", nil, DBFrame)
        btn:SetSize(450, 22)
        btn:SetPoint("TOPLEFT", 10, -60 - (i - 1) * 23)
        btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
        btn:Hide()

        btn.cols = {}
        btn.cols[1] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[1]:SetPoint("LEFT", btn, "LEFT", 4, 0)
        btn.cols[1]:SetWidth(28)
        btn.cols[1]:SetJustifyH("LEFT")
        btn.cols[2] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[2]:SetPoint("LEFT", btn.cols[1], "RIGHT", 4, 0)
        btn.cols[2]:SetWidth(200)
        btn.cols[2]:SetJustifyH("LEFT")
        btn.cols[2].clickBtn = CreateFrame("Button", nil, btn)
        btn.cols[2].clickBtn:SetAllPoints(btn.cols[2])
        btn.cols[2].clickBtn:SetFrameLevel(btn:GetFrameLevel() + 5)
        btn.cols[2].clickBtn:EnableMouse(true)
        btn.cols[2].clickBtn:RegisterForClicks("LeftButtonUp")
        btn.cols[2].clickBtn:Hide()
        btn.cols[2]:SetNonSpaceWrap(false)
        btn.cols[2]:SetWordWrap(false)
        if btn.cols[2].SetEllipsizeMode then
            btn.cols[2]:SetEllipsizeMode("END")
        end
        btn.cols[2]:EnableMouse(true)
        btn.cols[2]:SetScript("OnEnter", function(self)
            local name = self:GetText()
            local row = self:GetParent()
            local link = row.itemLink
            local data = row.itemData
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            if link then
                GameTooltip:SetHyperlink(link)
            else
                GameTooltip:SetText(name, 1, 1, 1)
            end
            GameTooltip:Show()
        end)
        btn.cols[2]:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)
        btn.cols[3] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[3]:SetPoint("LEFT", btn.cols[2], "RIGHT", 8, 0)
        btn.cols[3]:SetWidth(120)
        btn.cols[3]:SetJustifyH("RIGHT")
        btn.cols[4] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[4]:SetPoint("LEFT", btn.cols[3], "RIGHT", 8, 0)
        btn.cols[4]:SetWidth(120)
        btn.cols[4]:SetJustifyH("RIGHT")
        btn.cols[5] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[5]:SetPoint("LEFT", btn.cols[4], "RIGHT", 8, 0)
        btn.cols[5]:SetWidth(130)
        btn.cols[5]:SetJustifyH("CENTER")
        btn.cols[6] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[6]:SetPoint("LEFT", btn.cols[5], "RIGHT", 8, 0)
        btn.cols[6]:SetWidth(60)
        btn.cols[6]:SetJustifyH("CENTER")
        btn.cols[7] = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        btn.cols[7]:SetPoint("LEFT", btn.cols[5], "RIGHT", 8, 0)
        btn.cols[7]:SetWidth(120)
        btn.cols[7]:SetJustifyH("RIGHT")
        DBFrame.rows[i] = btn
    end
end

local searchEditBox = nil
local currentSearchText = ""

local function EasyAuction_UpdateDBSearchFilter(text)
    currentSearchText = text or ""
    RefreshDBFrame()
end

local function EasyAuction_CreateDBSearchBox()
    if not DBFrame or searchEditBox then return end

    searchEditBox = CreateFrame("EditBox", "EasyAuctionDBSearchBox", DBFrame, "InputBoxTemplate")
    searchEditBox:SetSize(180, 24)
    searchEditBox:SetAutoFocus(false)
    searchEditBox:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", 280, -12)
    searchEditBox:SetFontObject(ChatFontNormal)
    searchEditBox:SetTextInsets(8, 8, 0, 0)
    searchEditBox:SetMaxLetters(60)
    searchEditBox:SetText("")
    searchEditBox:Show()
    searchEditBox.placeholder = searchEditBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    searchEditBox.placeholder:SetPoint("LEFT", searchEditBox, "LEFT", 10, 0)
    searchEditBox.placeholder:SetText("输入物品名快速查找")
    searchEditBox.placeholder:SetTextColor(0.6, 0.6, 0.6, 0.8)

    searchEditBox:SetScript("OnTextChanged", function(self)
        local txt = self:GetText() or ""
        if txt == "" then
            searchEditBox.placeholder:Show()
        else
            searchEditBox.placeholder:Hide()
        end
        EasyAuction_UpdateDBSearchFilter(txt)
    end)
    searchEditBox:SetScript("OnEditFocusGained", function(self)
        if self:GetText() == "" then
            searchEditBox.placeholder:Show()
        end
    end)
    searchEditBox:SetScript("OnEditFocusLost", function(self)
        if self:GetText() == "" then
            searchEditBox.placeholder:Show()
        end
    end)
end

DBFrame:HookScript("OnShow", function()
    EasyAuction_CreateDBSearchBox()
    if searchEditBox then
        searchEditBox:SetText(currentSearchText or "")
        searchEditBox.placeholder:SetShown((currentSearchText or "") == "")
    end
end)

local function BuildDBItemList()
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    dbItemList = {}
    local filter = (currentSearchText or ""):lower()
    for name, data in pairs(EasyAuctionDB.PriceHistory) do
        if filter == "" or tostring(name):lower():find(filter, 1, true) then
            local min, t, link
            for _, info in ipairs(data) do
                if (not min) or info.unit < min then
                    min = info.unit
                    t = info.t
                    link = info.link
                end
            end
            if min then
                table.insert(dbItemList, {
                    name = name,
                    min = min,
                    t = t,
                    data = data,
                    link = link,
                })
            end
        end
    end
    table.sort(dbItemList, function(a, b)
        local key = currentSortKey
        if key == "name" then
            if currentSortReverse then
                return (a.name or "") > (b.name or "")
            else
                return (a.name or "") < (b.name or "")
            end
        elseif key == "num" then
            local sa = #(EasyAuctionDB.PriceHistory[a.name] or {})
            local sb = #(EasyAuctionDB.PriceHistory[b.name] or {})
            if currentSortReverse then
                return sa > sb
            else
                return sa < sb
            end
        elseif key == "history" then
            if currentSortReverse then
                return (a.min or 0) > (b.min or 0)
            else
                return (a.min or 0) < (b.min or 0)
            end
        elseif key == "min" then
            if currentSortReverse then
                return (a.min or 0) > (b.min or 0)
            else
                return (a.min or 0) < (b.min or 0)
            end
        elseif key == "t" then
            if currentSortReverse then
                return (a.t or 0) > (b.t or 0)
            else
                return (a.t or 0) < (b.t or 0)
            end
        else
            return (a.t or 0) > (b.t or 0)
        end
    end)
    totalPages = math.max(1, math.ceil(#dbItemList / ROWS_NUM))
end

function RefreshDBFrame()
    if EA_CategoryMode then
        EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage)
        return
    end
    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        if row and row.trendBtn then
            row.trendBtn:Hide()
        end
    end

    if DBFrame.EA_CategoryHeaderFS then DBFrame.EA_CategoryHeaderFS:Hide() end
    if DBFrame.EA_CategoryHeaderCols then
        for _, v in ipairs(DBFrame.EA_CategoryHeaderCols) do v:Hide() end
    end

    local headerFS = _G["EasyAuctionDBFrameHeader"] or DBFrame.headerFS
    if headerFS then
        headerFS:Show()
        local text =
        "序       物品名                                                  在售数                  历史最低价                  最新单价                 采集时间"
        local arrows = { ["name"] = "", ["snapshot"] = "", ["history"] = "", ["min"] = "", ["t"] = "" }
        local arrow = currentSortReverse and "▼" or "▲"
        if currentSortKey == "name" then
            arrows["name"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "snapshot" then
            arrows["snapshot"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "history" then
            arrows["history"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "min" then
            arrows["min"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "t" then
            arrows["t"] = "|cff00ff00" .. arrow .. "|r"
        end
        text = string.format(
            "序       物品名%s                                                  在售数%s                  历史最低价%s                  最新单价%s                 采集时间%s",
            arrows["name"], arrows["snapshot"], arrows["history"], arrows["min"], arrows["t"])
        headerFS:SetText(text)
    end

    local normalColWidths = { 28, 200, 80, 120, 120, 80 }
    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        if row and row.cols then
            local x = 4
            for j = 1, 5 do
                local col = row.cols[j]
                if col then
                    col:ClearAllPoints()
                    if j == 1 then
                        col:SetPoint("LEFT", row, "LEFT", x, 0)
                    else
                        col:SetPoint("LEFT", row.cols[j - 1], "RIGHT", 4, 0)
                    end
                    col:SetWidth(normalColWidths[j])
                    if j == 1 then
                        col:SetJustifyH("LEFT")
                    elseif j == 2 then
                        col:SetJustifyH("LEFT")
                    elseif j == 6 then
                        col:SetJustifyH("CENTER")
                    else
                        col:SetJustifyH("RIGHT")
                    end
                end
            end
        end
    end
    BuildDBItemList()
    if currentPage > totalPages then currentPage = totalPages end
    if currentPage < 1 then currentPage = 1 end

    local start = (currentPage - 1) * ROWS_NUM + 1
    local endi = math.min(start + ROWS_NUM - 1, #dbItemList)

    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        local item = dbItemList[start + i - 1]
        if item then
            local minHistory = nil
            for _, v in ipairs(EasyAuctionDB.PriceHistory[item.name] or {}) do
                if not minHistory or v.unit < minHistory then minHistory = v.unit end
            end
            row.cols[1]:SetText(tostring(start + i - 1))
            local icon = ""
            if item.link then
                local itemID = tonumber(item.link:match("item:(%d+)"))
                if itemID then
                    local iconPath = GetItemIcon(itemID)
                    if iconPath then
                        icon = "|T" .. iconPath .. ":16:16:0:0|t "
                    end
                end
            end
            row.cols[2]:SetText(icon .. ColorName(
                (function()
                    local realName
                    if item.link then
                        realName = select(1, GetItemInfo(item.link))
                    end
                    if not realName then
                        realName = tostring(item.name):match("^(.-):%d+$") or tostring(item.name)
                    end
                    return realName
                end)(),
                item.link
            ))

            if row.cols[2].clickBtn then
                row.cols[2].clickBtn:Show()
                row.cols[2].clickBtn:SetScript("OnClick", function(self, button)
                    if item.link and HandleModifiedItemClick(item.link) then
                        return
                    end
                    if button == "LeftButton" then
                        ShowPriceFrame(item.name, item.data)
                    end
                end)
                row.cols[2].clickBtn:SetScript("OnEnter", function(self)
                    row:LockHighlight()
                    local name = row.cols[2]:GetText()
                    local link = row.itemLink
                    local data = row.itemData
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    if link then
                        GameTooltip:SetHyperlink(link)
                    else
                        GameTooltip:SetText(name, 1, 1, 1)
                    end
                    if data and data.t then
                        GameTooltip:AddLine("采集时间：" .. date("%Y-%m-%d %H:%M", data.t), 0.7, 0.7, 0.7)
                    end
                    GameTooltip:Show()
                end)
                row.cols[2].clickBtn:SetScript("OnLeave", function(self)
                    row:UnlockHighlight()
                    GameTooltip:Hide()
                end)
            end
            row:SetScript("OnEnter", function(self)
                self:LockHighlight()
            end)
            row:SetScript("OnLeave", function(self)
                self:UnlockHighlight()
            end)
            row.itemLink = item.link
            row.itemData = item
            local snapshotCount = #(EasyAuctionDB.PriceHistory[item.name] or {})
            row.cols[3]:SetText(snapshotCount > 0 and tostring(snapshotCount) or "-")
            row.cols[4]:SetText(minHistory and FormatGoldIcon(minHistory) or "-")
            row.cols[5]:SetText(FormatGoldIcon(item.min))
            row.cols[6]:SetText(item.t and EA_GetShortTime(item.t) or "")
            row:Show()
            for j = 1, 6 do row.cols[j]:Show() end
            if not row.trendBtn then
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetText("走势")
            end
            row.trendBtn:ClearAllPoints()
            row.trendBtn:SetPoint("LEFT", row.cols[6], "RIGHT", 15, 0)
            row.trendBtn:Show()
            row.trendBtn:SetEnabled(item.min and item.min > 0)
            row.trendBtn:SetScript("OnClick", function()
                EasyAuction_ShowChart(item.name)
            end)
            for j = 7, 8 do
                if row.cols[j] then
                    row.cols[j]:SetText("")
                    row.cols[j]:Hide()
                end
            end
        else
            row:Hide()
            if row.trendBtn then row.trendBtn:Hide() end
            for j = 1, 6 do if row.cols[j] then row.cols[j]:Hide() end end
            for j = 7, 8 do
                if row.cols[j] then
                    row.cols[j]:SetText("")
                    row.cols[j]:Hide()
                end
            end
        end
    end
    local headerFS = _G["EasyAuctionDBFrameHeader"]
    if headerFS then
        local text =
        "序       物品名                                                     在售数            历史最低价                  最新单价                 采集时间"
        local arrows = { ["name"] = "", ["snapshot"] = "", ["history"] = "", ["min"] = "", ["t"] = "" }
        local arrow = currentSortReverse and "▼" or "▲"
        if currentSortKey == "name" then
            arrows["name"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "snapshot" then
            arrows["snapshot"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "history" then
            arrows["history"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "min" then
            arrows["min"] = "|cff00ff00" .. arrow .. "|r"
        elseif currentSortKey == "t" then
            arrows["t"] = "|cff00ff00" .. arrow .. "|r"
        end
        text = string.format(
            "序       物品名%s                                                     在售数%s            历史最低价%s                  最新单价%s                 采集时间%s",
            arrows["name"], arrows["snapshot"], arrows["history"], arrows["min"], arrows["t"])
        headerFS:SetText(text)
    end
    prevBtn:SetShown(totalPages > 1)
    nextBtn:SetShown(totalPages > 1)
    prevBtn:SetEnabled(currentPage > 1)
    nextBtn:SetEnabled(currentPage < totalPages)
    pageText:SetText(string.format("第%d/%d页", currentPage, totalPages))
    EasyAuction_UpdateCategoryButtonHighlight()
end

resetBtn:SetScript("OnClick", function()
    StaticPopupDialogs["EASYAUCTION_RESET_DB"] = {
        text = "确定要清空所有拍卖历史记录和设置吗？此操作不可恢复！",
        button1 = "确定",
        button2 = "取消",
        OnAccept = function()
            EasyAuctionDB = {
                bidDiscount      = 0.95,
                undercut         = 1,
                stackCount       = 20,
                auctionDuration  = 1,
                showSections     = { items = true, price = true, myauct = true },
                buyRiskLimit     = 500,
                scanPerFrame     = 500,
                scanQuickMode    = true,
                PriceHistory     = {},
                DailyMinPrice    = {},
                CurrentTodayMin  = {},
                LastScanMinPrice = {},
                FavoriteItems    = {},
                RecentSearch     = {},
                scanQuickLimit   = 100,
            }
            _G.EasyAuctionDB = EasyAuctionDB

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
                EasyAuction_UpdateInlineDistribution(nil,
                    nil)
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

prevBtn:SetScript("OnClick", function()
    if currentPage > 1 then
        currentPage = currentPage - 1
        RefreshDBFrame()
    end
end)

nextBtn:SetScript("OnClick", function()
    if currentPage < totalPages then
        currentPage = currentPage + 1
        RefreshDBFrame()
    end
end)

DBFrame:EnableMouseWheel(true)
DBFrame:SetScript("OnMouseWheel", function(self, delta)
    if delta < 0 and currentPage < totalPages then
        currentPage = currentPage + 1
        RefreshDBFrame()
    elseif delta > 0 and currentPage > 1 then
        currentPage = currentPage - 1
        RefreshDBFrame()
    end
end)

function EasyAuction_OpenDBFrame()
    currentPage = 1
    EA_ActiveCategory = nil
    RefreshDBFrame()
    EasyAuction_UpdateCategoryButtonHighlight()
    DBFrame:Show()
end

local itemInfoFrame = CreateFrame("Frame")
itemInfoFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
itemInfoFrame:SetScript("OnEvent", function(_, _, itemID, success)
    if success and DBFrame and DBFrame:IsShown() then
        RefreshDBFrame()
    end
end)

SLASH_EasyAuctionDB1 = "/epah"
SlashCmdList["EasyAuctionDB"] = function()
    EasyAuction_OpenDBFrame()
end

SLASH_EasyAuctionShowPrice1 = "/epsp"
SlashCmdList["EasyAuctionShowPrice"] = function()
    EasyAuctionDB.ShowPrice = not EasyAuctionDB.ShowPrice
    print("|cff00ff00[EasyAuction]|r 鼠标提示价格显示已" .. (EasyAuctionDB.ShowPrice and "开启" or "关闭"))
end

local EA_CATEGORY_LIST = {
    ["草药"] = {
        { "噩梦藤", 22792, 14 }, { "野葡萄藤", 8153, 8 }, { "石南草", 2450, 2 }, { "魔皇草", 785, 2 },
        { "雨燕草", 2452, 2 }, { "梦叶草", 13463, 10 }, { "黑莲花", 13468, 14 }, { "冰盖草", 13467, 10 },
        { "金棘草", 3821, 6 }, { "紫莲花", 8831, 8 }, { "野钢花", 3355, 4 }, { "火焰花", 4625, 8 },
        { "山鼠草", 13465, 10 }, { "天灾花", 13466, 10 }, { "黄金参", 13464, 10 }, { "皇血草", 3356, 4 },
        { "墓地苔", 3369, 4 }, { "荆棘藻", 3820, 4 }, { "跌打草", 2453, 4 }, { "太阳草", 8838, 8 },
        { "阿尔萨斯之泪", 8836, 8 }, { "卡德加的胡须", 3358, 6 }, { "枯叶草", 3818, 6 }, { "幽灵菇", 8845, 8 },
        { "活根草", 3357, 6 }, { "蛇信草", 36903, 20 }, { "格罗姆之血", 8846, 10 }, { "雪莲花", 36908, 50 },
        { "邪雾草", 22787, 12 }, { "塔兰德拉的玫瑰", 36907, 20 }, { "死亡荨麻", 37921, 20 }, { "虚空花", 22791, 14 },
        { "魔草", 22785, 12 }, { "地根草", 2449, 2 }, { "巫妖花", 36905, 20 }, { "冰棘草", 36906, 20 },
        { "金苜蓿", 36901, 20 }, { "卷丹", 36904, 20 }, { "法力蓟", 22793, 16 }, { "远古苔", 22790, 12 },
        { "宁神花", 2447, 2 }, { "银叶草", 765, 2 }, { "梦露花", 22786, 12 }, { "盲目草", 8839, 8 },
        { "泰罗果", 22789, 12 }, { "冬刺草", 3819, 6 }
    },
    ["矿石"] = {
        { "银矿石", 2775, 4 },
        { "金矿石", 2776, 6 },
        { "铁矿石", 2772, 8 },
        { "锡矿石", 2771, 4 },
        { "真银矿石", 7911, 14 },
        { "铜矿石", 2770, 2 },
        { "秘银矿石", 3858, 10 },
        { "精金矿石", 23425, 18 },
        { "魔铁矿石", 23424, 16 },
        { "沉重的石头", 2838, 6 },
        { "泰坦神铁矿石", 36910, 100 },
        { "坚固的石头", 7912, 8 },
        { "瑟银矿石", 10620, 12 },
        { "粗糙的石头", 2836, 4 },
        { "钴矿石", 36909, 30 },
        { "萨隆邪铁矿石", 36912, 40 },
        { "氪金矿石", 23426, 24 },
        { "恒金矿石", 23427, 30 },
        { "黑铁矿石", 11370, 10 },
        { "厚重的石头", 12365, 10 },
        { "劣质的石头", 2835, 2 },
    },
    ["附魔"] = {
        { "深渊水晶", 34057, 300 },
        { "次级虚空精华", 11174, 8 },
        { "次级不灭精华", 16202, 10 },
        { "幻影之尘", 16204, 12 },
        { "次级位面精华", 22447, 14 },
        { "小块魔光碎片", 14343, 16 },
        { "奥法之尘", 22445, 14 },
        { "次级秘法精华", 11134, 6 },
        { "幻象之尘", 11137, 8 },
        { "大块强光碎片", 11178, 36 },
        { "次级宇宙精华", 34056, 30 },
        { "虚空水晶", 22450, 80 },
        { "无限之尘", 34054, 30 },
        { "次级魔法精华", 10938, 2 },
        { "奇异之尘", 10940, 2 },
        { "梦境碎片", 34052, 198 },
        { "小块梦境碎片", 34053, 66 },
        { "灵魂之尘", 11083, 6 },
        { "大块棱光碎片", 22449, 72 },
        { "梦境之尘", 11176, 10 },
        { "次级星界精华", 10998, 4 },
        { "小块微光碎片", 10978, 4 },
        { "连结水晶", 20725, 52 },
        { "小块棱光碎片", 22448, 24 },
        { "大块微光碎片", 11084, 12 },
        { "大块闪光碎片", 11139, 24 },
        { "小块闪光碎片", 11138, 8 },
        { "强效魔法精华", 10939, 6 },
        { "强效星界精华", 11082, 12 },
        { "强效秘法精华", 11135, 18 },
        { "强效虚空精华", 11175, 24 },
        { "强效不灭精华", 16203, 30 },
        --{ "小块辉光碎片", 11138, 12 },
        --{ "大块辉光碎片", 111245, 48 },
        { "强效位面精华", 22446, 42 },
        { "强效宇宙精华", 34055, 90 },
    },
    ["珠宝"] = {
        { "彩色珍珠", 5500, 4 },
        { "翡翠", 1529, 6 },
        { "虎眼石", 818, 2 },
        { "裂纹的珍珠", 24478, 8 },
        { "暗影珍珠", 24479, 8 },
        { "孔雀石", 774, 2 },
        { "暗影石", 1210, 4 },
        { "绿玛瑙", 1206, 4 },
        { "大猫眼石", 12799, 10 },
        { "火榴石", 21929, 20 },
        { "德拉诺金钻", 23112, 20 },
        { "德拉诺影钻", 23107, 20 },
        { "翠榄石", 23079, 20 },
        { "黑珍珠", 7971, 8 },
        { "红宝石", 7910, 10 },
        { "血榴石", 23077, 20 },
        { "艾泽拉斯钻石", 12800, 12 },
        { "碧月石", 23117, 20 },
        { "蓝宝石", 12361, 10 },
        { "天蓝石", 36924, 200 },
        { "天蓝宝石", 32228, 40 },
        { "巨型绿宝石", 12364, 12 },
        { "奥术水晶", 12363, 12 },
        { "太阳水晶", 36920, 50 },
        { "玉髓石", 36923, 50 },
        { "红曜石", 23436, 32 },
        { "血石", 36917, 50 },
        { "黎明石", 23440, 32 },
        { "夜目石", 23441, 32 },
        { "暗影水晶", 36926, 50 },
        { "艾露恩之星", 23438, 32 },
        { "赤尖石", 32227, 40 },
        { "焚石", 32231, 40 },
        { "黄水晶", 3864, 8 },
        { "狮眼石", 32229, 40 },
        { "有光泽的小珍珠", 5498, 2 },
        { "影歌紫玉", 32230, 40 },
        { "黑玉", 36932, 50 },
        { "海浪翡翠", 32249, 40 },
        { "次级月亮石", 1705, 6 },
        { "水玉", 23437, 32 },
        { "黄晶玉", 23439, 32 },
        { "青绿石", 7909, 8 },
        { "茶晶石", 36929, 50 },
        { "帝黄晶", 36930, 200 },
        { "森林翡翠", 36933, 200 },
        { "血玉石", 36918, 200 },
        { "秋色石", 36921, 200 },
        { "曙光猫眼石", 36927, 200 },
    },
    ["布皮"] = {
        -- 布
        { "毛料", 2592, 4 },
        { "魔纹布", 4338, 8 },
        { "丝绸", 4306, 6 },
        { "恶魔布", 14256, 10 },
        { "霜纹布", 33470, 20 },
        { "亚麻布", 2589, 2 },
        { "灵纹布", 21877, 16 },
        { "符文布", 14047, 12 },
        -- 染料
        --{ "粉红染料", 10290, 25 },
        -- 皮革与皮
        { "重结缔皮", 23793, 50 },
        { "重毛皮", 4235, 18 },
        { "眼镜蛇鳞片", 29539, 30 },
        { "厚北地皮", 38425, 40 },
        { "极地毛皮", 44128, 200 },
        { "硬甲皮", 8170, 10 },
        { "北地皮", 33568, 8 },
        { "北地皮碎片", 33567, 2 },
        { "风鳞", 29547, 30 },
        { "魔鳞", 25700, 30 },
        { "冰虫鳞片", 38561, 40 },
        { "结缔皮碎片", 25649, 2 },
        { "冰冷的龙鳞", 38557, 40 },
        { "重皮", 4234, 6 },
        { "厚皮", 4304, 8 },
        { "结缔皮", 21887, 10 },
        { "中皮", 2319, 4 },
        { "轻皮", 2318, 2 },
        { "中毛皮", 4232, 12 },
        { "轻毛皮", 783, 6 },
        { "虚空龙鳞", 29548, 30 },
        { "硬甲毛皮", 8171, 30 },
        { "厚裂蹄牛皮", 25708, 30 },
        { "魔皮", 25707, 50 },
        { "厚毛皮", 8169, 24 },
        { "水晶能量皮革", 25699, 30 },
        { "蛛魔几丁质", 38558, 40 },
    },
    ["元素"] = {
        { "水之精华", 7080, 10 },
        { "元素空气", 7069, 6 },
        { "死灵精华", 12808, 10 },
        { "元素之水", 7070, 6 },
        { "源生暗影", 22456, 20 },
        { "火焰之心", 7077, 8 },
        { "源生火焰", 21884, 20 },
        { "元素之土", 7067, 6 },
        { "源生之水", 21885, 20 },
        { "源生空气", 22451, 20 },
        { "源生之土", 22452, 20 },
        { "火焰精华", 7078, 10 },
        { "水之微粒", 22578, 4 },
        { "火焰微粒", 22574, 4 },
        { "源生法力", 22457, 20 },
        { "土之微粒", 22573, 4 },
        { "永恒火焰", 36860, 200 },
        { "永恒生命", 35625, 200 },
        { "生命结晶", 37704, 20 },
        { "火焰结晶", 37702, 20 },
        { "空气精华", 7082, 10 },
        { "空气微粒", 22572, 4 },
        { "暗影结晶", 37703, 20 },
        { "永恒暗影", 35627, 200 },
        { "永恒空气", 35623, 200 },
        { "法力微粒", 22576, 4 },
        { "源生生命", 21886, 20 },
        { "空气结晶", 37700, 20 },
        { "大地精华", 7076, 10 },
        { "生命微粒", 22575, 4 },
        { "土之结晶", 37701, 20 },
        { "永恒之土", 35624, 200 },
        { "亡灵腐液", 7972, 8 },
        { "大地之核", 7075, 8 },
        { "暗影微粒", 22577, 4 },
        { "永恒之水", 35622, 200 },
        { "水之结晶", 37705, 20 },
        { "野性之心", 10286, 8 },
        { "生命精华", 12803, 10 },
        { "纯水之球", 7079, 8 },
    },
    ["药剂"] = {
        { "无尽怒气合剂", 46377, 0 },
        { "符文法力药水", 33448, 0 },
        { "符文治疗药水", 33447, 0 },
        { "速度药水", 40211, 0 },
        { "狂野魔法药水", 40212, 0 },
        { "极效力量药剂", 40073, 0 },
        { "石血合剂", 46379, 0 },
        { "纯净魔精合剂", 46378, 0 },
        { "强固合剂", 22851, 0 },
        { "次级强韧合剂", 40079, 0 },
        { "遗忘王者战鼓", 49633, 0 },
        { "狂野战鼓", 49634, 0 },
        { "不灭药水", 40093, 0 },
        { "极效火焰防护药水", 40214, 0 },
        { "自由行动药水", 5634, 0 },
    },
    ["鱼类"] = {
        { "小型亚口鱼", 40199, 0 },
        { "深海巨腹鱼", 41800, 0 },
        { "月光墨鱼", 41801, 0 },
        { "帝王鳐", 41802, 0 },
        { "石鳞鲶鱼", 41803, 0 },
        { "北风水母", 41805, 0 },
        { "蚌背鱼", 41806, 0 },
        { "龙鳞天使鱼", 41807, 0 },
        { "骨鳞钳鱼", 41808, 0 },
        { "冰河鲑鱼", 41809, 0 },
        { "利齿青鱼", 41810, 0 },
        { "圆头虾虎鱼", 41812, 0 },
        { "水母", 41813, 0 },
        { "晶鳞鱼", 41814, 0 },
        { "光滑的鳗鱼", 43652, 0 },
        { "巨型深水蚌", 45909, 0 },
        { "多汁的蚌肉", 36782, 0 },
        { "新鲜的斑点黄尾鱼", 4603, 0 },
        { "新鲜的长嘴泥鳅", 6289, 0 },
        { "新鲜的刺须鲶鱼", 6308, 0 },
        { "新鲜的美味小鱼", 6291, 0 },
        -- { "新鲜的洛克湖狂鱼", 6317, 0 },
        { "新鲜的彩鳍鱼", 6361, 0 },
        { "黑口鱼", 6358, 0 },
        { "新鲜的滑皮鲭鱼", 6303, 0 },
        { "变异鱼", 6522, 0 },
        { "火鳞鳝鱼", 6359, 0 },
        { "新鲜的银头鲑鱼", 8365, 0 },
        { "新鲜的石鳞鳕鱼", 6362, 0 },
        { "美味的蚌肉", 7974, 0 },
        { "巨型蚌壳", 7973, 0 },
        { "新鲜的大鱼", 13893, 0 },
        { "板鳞鱼", 13890, 0 },
        { "黑海岸石斑鱼", 12238, 0 },
        { "新鲜的红腮鱼", 13758, 0 },
        { "新鲜的阳鳞鲑鱼", 13760, 0 },
        { "新鲜的光滑大鱼", 13754, 0 },
        { "冬鱿鱼", 13755, 0 },
        { "黑爪龙虾", 13888, 0 },
        { "新鲜的夜鳞鲷鱼", 13759, 0 },
        { "新鲜的白鳞鲑鱼", 13889, 0 },
        { "新鲜的夏日鲈鱼", 13756, 0 },
        { "新鲜的鼠尾鱼", 21071, 0 },
        { "新鲜的大鼠尾鱼", 21153, 0 },
        { "赞加孢子鱼", 27429, 0 },
        { "斑点魔尾鱼", 27425, 0 },
        { "菲格鲁泥鱼", 27435, 0 },
        { "巨刺鲑鱼", 27516, 0 },
        { "粗斑魔尾鱼", 27515, 0 },
        { "冰鳞蓝鱼", 27437, 0 },
        { "狂暴龙虾", 27439, 0 },
        { "刺鳃鲑鱼", 27422, 0 },
        { "金镖鱼", 27438, 0 },
        { "水之微粒", 22578, 0 },
        { "裂纹的蚌壳", 24476, 0 },
        { "血鳞鲶鱼", 33823, 0 },
        { "弯尾骨鱼", 33824, 0 },
        { "巨型太阳鱼", 35285, 0 },
        { "水之结晶", 37705, 0 },
        { "深水蚌", 36781, 0 },

        { "鱼肉筵席", 43015, 0 },
        { "爆炒鲑鱼", 34767, 0 },
        { "龙鳞鱼片", 43000, 0 },
        { "大型筵席", 34753, 0 },
        { "腌制利齿青鱼", 34765, 0 },
        { "闹鬼的青鱼", 43492, 0 },
        { "烤鳐鱼", 42942, 0 },
        { "香辣蓝色水母", 34768, 0 },
        { "小型筵席", 43480, 0 },
        { "水煮北地蚌背鱼", 34766, 0 },
        { "香辣油炸青鱼", 42993, 0 },
        { "钳鱼大餐", 42996, 0 },
        { "帝王鳐鱼片", 34769, 0 },
        { "墨鱼片", 42998, 0 },
        { "煮水母", 34764, 0 },
        { "烤蚌背鱼", 34762, 0 },
        { "达拉然蚌肉杂烩", 43268, 0 },
        { "丰盛筵席", 43478, 0 },
        { "熏烤龙鳞鱼", 42999, 0 },
        { "美味风蛇", 6657, 0 },
        { "风暴牛排", 33866, 0 },
        { "龙息红椒", 12217, 0 },
        { "拉姆瑟船长的特酿啤酒", 34832, 0 },
        { "美味巧克力蛋糕", 33924, 0 },
    }
}
local EA_CATEGORIES = { "全类", "矿石", "草药", "附魔", "珠宝", "布皮", "元素", "药剂", "鱼类", "常用" }

local EA_CategoryHeaders = {
    { name = "序", key = "idx", width = 30 },
    { name = "物品名", key = "name", width = 140 },
    { name = "    在售数", key = "num", width = 70 }, -- 新增
    { name = "最低单价", key = "min", width = 120 },
    { name = "    需碎片数", key = "titan", width = 68 },
    { name = "    每碎片价值", key = "titanValue", width = 120 },
    { name = "         采集时间", key = "t", width = 90 },
    { name = "操作", key = "", width = 68 }
}
local EA_CategoryHeaderBtns = {}

function EA_GetShortTime(ts)
    local diff = time() - (ts or 0)
    if diff < 3600 then
        return string.format("%d分钟前", math.floor(diff / 60))
    elseif diff < 86400 then
        return string.format("%d小时前", math.floor(diff / 3600))
    else
        return string.format("%d天前", math.floor(diff / 86400))
    end
end

function EasyAuction_UpdateCategoryButtonHighlight()
    local activeR, activeG, activeB = 0.2, 0.8, 1
    for cat, btn in pairs(DBFrame.EA_CategoryBtnsByCat or {}) do
        if EA_ActiveCategory == cat then
            btn:SetNormalFontObject(GameFontHighlightLarge)
            btn:GetFontString():SetTextColor(activeR, activeG, activeB, 1)
        else
            btn:SetNormalFontObject(GameFontNormalLarge)
            btn:GetFontString():SetTextColor(1, 1, 1, 1)
        end
    end
    if DBFrame.EA_CategoryReturnBtn then
        if EA_ActiveCategory == nil then
            DBFrame.EA_CategoryReturnBtn:SetNormalFontObject(GameFontHighlightLarge)
            DBFrame.EA_CategoryReturnBtn:GetFontString():SetTextColor(activeR, activeG, activeB, 1)
        else
            DBFrame.EA_CategoryReturnBtn:SetNormalFontObject(GameFontNormalLarge)
            DBFrame.EA_CategoryReturnBtn:GetFontString():SetTextColor(1, 1, 1, 1)
        end
    end
end

DBFrame:HookScript("OnShow", function()
    if not DBFrame.EA_CategoryBtns then
        DBFrame.EA_CategoryBtns = {}
        DBFrame.EA_CategoryBtnsByCat = {}
        local btnWidth, btnHeight = 50, 22
        local firstBtnX = 80
        local btnSpacing = 6
        for i, cat in ipairs(EA_CATEGORIES) do
            local btn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
            btn:SetSize(btnWidth, btnHeight)
            btn:SetText(cat)
            if i == 1 then
                btn:SetPoint("BOTTOMLEFT", DBFrame, "BOTTOMLEFT", firstBtnX, 15)
                btn:SetNormalFontObject(GameFontNormalLarge)
                btn:GetFontString():SetTextColor(1, 1, 1, 1)
            else
                btn:SetPoint("LEFT", DBFrame.EA_CategoryBtns[i - 1], "RIGHT", btnSpacing, 0)
            end
            btn:SetScript("OnClick", function()
                EA_ActiveCategory = cat
                EA_ShowCategory(cat, 1)
                EasyAuction_UpdateCategoryButtonHighlight()
            end)
            DBFrame.EA_CategoryBtns[i] = btn
            DBFrame.EA_CategoryBtnsByCat[cat] = btn
        end
    end
    for _, btn in ipairs(DBFrame.EA_CategoryBtns) do btn:Show() end
end)
DBFrame:HookScript("OnHide", function()
    if DBFrame.EA_CategoryBtns then for _, btn in ipairs(DBFrame.EA_CategoryBtns) do btn:Hide() end end
    if EA_CategoryHeaderBtns then for _, btn in ipairs(EA_CategoryHeaderBtns) do btn:Hide() end end
end)

local function EA_CategorySort(a, b)
    local key = EA_CategorySortKey
    local desc = EA_CategorySortDesc

    local va, vb
    if key == "num" then
        va = #(EasyAuctionDB.PriceHistory[a.key] or {})
        vb = #(EasyAuctionDB.PriceHistory[b.key] or {})
    elseif key == "titanValue" then
        va = a.titanValueRaw
        vb = b.titanValueRaw
    elseif key == "idx" then
        va, vb = a.idx, b.idx
    elseif key == "name" then
        va, vb = a.name or "", b.name or ""
    elseif key == "min" then
        va, vb = a.min, b.min
    elseif key == "titan" then
        va, vb = a.titan, b.titan
    elseif key == "t" then
        va, vb = a.t, b.t
    else
        va, vb = a.idx, b.idx
    end

    if va == nil and vb == nil then return (a.idx or 0) < (b.idx or 0) end
    if va == nil then return false end
    if vb == nil then return true end

    if va == vb then return (a.idx or 0) < (b.idx or 0) end
    if desc then
        return va > vb
    else
        return va < vb
    end
end

if not DBFrame.EA_CategoryReturnBtn then
    DBFrame.EA_CategoryReturnBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
    DBFrame.EA_CategoryReturnBtn:SetSize(60, 22)
    DBFrame.EA_CategoryReturnBtn:SetPoint("BOTTOMLEFT", DBFrame, "BOTTOMLEFT", 15, 15)
    DBFrame.EA_CategoryReturnBtn:SetText("首页")
    DBFrame.EA_CategoryReturnBtn:SetScript("OnClick", function()
        EA_CategoryMode = nil
        EA_ActiveCategory = nil
        if DBFrame.EA_CategoryHeaderFS then DBFrame.EA_CategoryHeaderFS:Hide() end
        if EA_CategoryHeaderBtns then for _, btn in ipairs(EA_CategoryHeaderBtns) do btn:Hide() end end
        RefreshDBFrame()
        EasyAuction_UpdateCategoryButtonHighlight()
    end)
end
DBFrame.EA_CategoryReturnBtn:Show()

function EA_ShowCategory(cat, page)
    EA_CategoryMode = cat
    local list = {}
    if cat == "全类" then
        local mergeKeys = { "矿石", "草药", "附魔", "珠宝", "布皮", "元素" }
        for _, key in ipairs(mergeKeys) do
            for _, info in ipairs(EA_CATEGORY_LIST[key] or {}) do
                local name, itemid, titan = unpack(info)
                local keystr = name .. ":" .. tostring(itemid)
                local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[keystr]
                local min, t
                if history and #history > 0 then
                    min, t = history[1].unit, history[1].t
                    for _, v in ipairs(history) do
                        if v.unit < min then min, t = v.unit, v.t end
                    end
                end
                local titanValue, titanValueRaw = nil, nil
                if titan and titan > 0 and min and min > 0 then
                    titanValueRaw = min / titan
                    local roundedValue = math.floor(titanValueRaw + 0.5)
                    titanValue = FormatGoldIcon(roundedValue)
                end
                table.insert(list, {
                    idx = #list + 1,
                    name = name,
                    itemid = itemid,
                    titan = (type(titan) == "number" and titan > 0) and titan or nil,
                    min = tonumber(min) or nil,
                    t = tonumber(t) or nil,
                    key = keystr,
                    titanValue = titanValue,
                    titanValueRaw = titanValueRaw
                })
            end
        end
    elseif cat == "常用" then
        for itemID, v in pairs(EasyAuctionDB.FavoriteItems or {}) do
            local name = v.name or ""
            local key = name .. ":" .. tostring(itemID)
            local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
            local min, t
            if history and #history > 0 then
                min, t = history[1].unit, history[1].t
                for _, info in ipairs(history) do
                    if info.unit < min then min, t = info.unit, info.t end
                end
            end
            table.insert(list, {
                idx = #list + 1,
                name = name,
                itemid = tonumber(itemID),
                titan = nil,
                min = tonumber(min) or nil,
                t = tonumber(t) or nil,
                key = key,
                titanValue = nil,
                titanValueRaw = nil
            })
        end
    else
        for _, info in ipairs(EA_CATEGORY_LIST[cat] or {}) do
            local name, itemid, titan = unpack(info)
            local key = name .. ":" .. tostring(itemid)
            local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
            local min, t
            if history and #history > 0 then
                min, t = history[1].unit, history[1].t
                for _, v in ipairs(history) do
                    if v.unit < min then min, t = v.unit, v.t end
                end
            end
            local titanValue, titanValueRaw = nil, nil
            if titan and titan > 0 and min and min > 0 then
                titanValueRaw = min / titan
                local roundedValue = math.floor(titanValueRaw + 0.5)
                titanValue = FormatGoldIcon(roundedValue)
            end
            table.insert(list, {
                idx = #list + 1,
                name = name,
                itemid = itemid,
                titan = (type(titan) == "number" and titan > 0) and titan or nil,
                min = tonumber(min) or nil,
                t = tonumber(t) or nil,
                key = key,
                titanValue = titanValue,
                titanValueRaw = titanValueRaw
            })
        end
    end

    -- 调试：排序前预览
    -- print("-------[EA DEBUG] 分类排序前数据，key=", EA_CategorySortKey, "desc=", EA_CategorySortDesc, "总数:", #list)
    -- for i = 1, math.min(10, #list) do
    --     local d = list[i]
    --     print(string.format("[EA DEBUG-BEFORE] %2d %s min=%s titan=%s titanValueRaw=%s t=%s",
    --         i, d.name or "?", tostring(d.min), tostring(d.titan), tostring(d.titanValueRaw), tostring(d.t)))
    -- end

    table.sort(list, EA_CategorySort)

    -- print("-------[EA DEBUG] 分类排序后前10名：")
    -- for i = 1, math.min(10, #list) do
    --     local d = list[i]
    --     print(string.format("[EA DEBUG-AFTER] %2d %s min=%s titan=%s titanValueRaw=%s t=%s",
    --         i, d.name or "?", tostring(d.min), tostring(d.titan), tostring(d.titanValueRaw), tostring(d.t)))
    -- end

    EA_CategoryTotalPages = math.max(1, math.ceil(#list / ROWS_NUM))
    if not page or type(page) ~= "number" or page < 1 then
        EA_CategoryCurrentPage = 1
    elseif page > EA_CategoryTotalPages then
        EA_CategoryCurrentPage = EA_CategoryTotalPages
    else
        EA_CategoryCurrentPage = page
    end
    local headerFS = _G["EasyAuctionDBFrameHeader"]
    if headerFS then headerFS:Hide() end
    if searchEditBox then searchEditBox:Hide() end
    if resetBtn then resetBtn:Hide() end
    if opportunityBtn then opportunityBtn:Hide() end

    if not DBFrame.EA_CategoryHeaderFS then
        DBFrame.EA_CategoryHeaderFS = DBFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        DBFrame.EA_CategoryHeaderFS:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", 8, -40)
        DBFrame.EA_CategoryHeaderFS:SetHeight(20)
        DBFrame.EA_CategoryHeaderFS:SetWidth(700)
        DBFrame.EA_CategoryHeaderFS:SetJustifyH("LEFT")
    end
    if not EA_CategoryHeaderBtns[1] then
        local x = 15
        for i, head in ipairs(EA_CategoryHeaders) do
            local btn = CreateFrame("Button", nil, DBFrame)
            btn:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", x, -40)
            btn:SetSize(head.width, 24)
            btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
            btn.sortKey = head.key
            local fs = DBFrame.EA_CategoryHeaderCols and DBFrame.EA_CategoryHeaderCols[i]
            if fs then
                btn:SetFrameLevel(fs:GetFrameLevel() + 5)
            else
                btn:SetFrameLevel(DBFrame:GetFrameLevel() + 5)
            end
            btn:SetScript("OnClick", function()
                if head.key and head.key ~= "" then
                    if EA_CategorySortKey == head.key then
                        EA_CategorySortDesc = not EA_CategorySortDesc
                    else
                        EA_CategorySortKey = head.key
                        EA_CategorySortDesc = false
                    end
                    EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage)
                end
            end)
            EA_CategoryHeaderBtns[i] = btn
            x = x + head.width
        end
    end
    for i, btn in ipairs(EA_CategoryHeaderBtns) do
        local head = EA_CategoryHeaders[i]
        local arrow = ""
        if EA_CategorySortKey == head.key and head.key ~= "" then
            arrow = EA_CategorySortDesc and " ▼" or " ▲"
        end
        btn:SetText(head.name .. arrow)
        btn:Show()
    end

    local function showArrow(key)
        if EA_CategorySortKey == key then
            return EA_CategorySortDesc and " ▼" or " ▲"
        else
            return ""
        end
    end
    local headerText = ""
    for i, head in ipairs(EA_CategoryHeaders) do
        headerText = headerText .. string.format("%s%s", head.name, showArrow(head.key))
        if i < #EA_CategoryHeaders then headerText = headerText .. "   " end
    end
    do
        if not DBFrame.EA_CategoryHeaderCols then
            DBFrame.EA_CategoryHeaderCols = {}
            for j, head in ipairs(EA_CategoryHeaders) do
                local hdr = DBFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                hdr:SetTextColor(1, 0.82, 0)
                DBFrame.EA_CategoryHeaderCols[j] = hdr
            end
        end
        local x = 8
        for j, head in ipairs(EA_CategoryHeaders) do
            local hdr = DBFrame.EA_CategoryHeaderCols[j]
            hdr:ClearAllPoints()
            if j == 1 then
                hdr:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", x, -40)
            else
                hdr:SetPoint("LEFT", DBFrame.EA_CategoryHeaderCols[j - 1], "RIGHT", 0, 0)
            end
            hdr:SetWidth(head.width)
            hdr:SetJustifyH("CENTER")
            local arrow = ""
            if EA_CategorySortKey == head.key and head.key ~= "" then
                arrow = EA_CategorySortDesc and " ▼" or " ▲"
            end
            hdr:SetText(head.name .. arrow)
            hdr:Show()
            x = x + head.width
        end

        for i = 1, ROWS_NUM do
            local row = DBFrame.rows[i]
            if not row.cols then row.cols = {} end
            local x = 8
            for j, head in ipairs(EA_CategoryHeaders) do
                local col = row.cols[j]
                if not col then
                    col = row:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
                    row.cols[j] = col
                end
                col:ClearAllPoints()
                if j == 1 then
                    col:SetPoint("LEFT", row, "LEFT", x, 0)
                else
                    col:SetPoint("LEFT", row.cols[j - 1], "RIGHT", 0, 0)
                end
                col:SetWidth(head.width)
                if j == 1 then
                    col:SetJustifyH("CENTER")
                elseif j == 2 then
                    col:SetJustifyH("LEFT")
                elseif j == 5 or j == 7 then
                    col:SetJustifyH("CENTER")
                else
                    col:SetJustifyH("RIGHT")
                end
                x = x + head.width
            end
            if row.trendBtn then
                row.trendBtn:ClearAllPoints()
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetPoint("CENTER", row.cols[8], "CENTER", 0, 0)
            end
        end
    end

    local startIdx = (EA_CategoryCurrentPage - 1) * ROWS_NUM + 1
    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        local data = list[startIdx + i - 1]
        if data then
            row:Show()
            row.cols[1]:SetText(tostring(startIdx + i - 1))
            local icon = ""
            if data.itemid then
                local iconPath = GetItemIcon(data.itemid)
                if iconPath then icon = "|T" .. iconPath .. ":16:16:0:0|t " end
            end
            local itemID = tonumber(data.key and data.key:match(":(%d+)$"))
            local itemLink = itemID and select(2, GetItemInfo(itemID)) or nil
            row.cols[2]:SetText(icon .. ColorName(
                (function()
                    local realName
                    if itemLink then
                        realName = select(1, GetItemInfo(itemLink))
                    end
                    if not realName then
                        realName = tostring(data.name):match("^(.-):%d+$") or tostring(data.name)
                    end
                    return realName
                end)(),
                itemLink
            ))
            row.itemLink = itemLink
            row.itemData = data
            local key = data.key
            local snapshotCount = #(EasyAuctionDB.PriceHistory[key] or {})
            row.cols[3]:SetText(snapshotCount > 0 and tostring(snapshotCount) or "-")
            row.cols[4]:SetText(data.min and FormatGoldIcon(data.min) or "-")
            row.cols[5]:SetText(data.titan or "-")
            row.cols[6]:SetText(data.titanValue or "-")
            row.cols[7]:Show()
            row.cols[7]:SetText(data.t and EA_GetShortTime(data.t) or "-")
            if not row.trendBtn then
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetPoint("LEFT", row.cols[7], "RIGHT", 15, 0)
                row.trendBtn:SetText("走势")
            end
            row.trendBtn:Show()
            row.trendBtn:SetEnabled(data.min and data.min > 0)
            row.trendBtn:SetScript("OnClick", function()
                EasyAuction_ShowChart(data.key)
            end)
            row:SetScript("OnClick", function()
                ShowPriceFrame(data.key, EasyAuctionDB.PriceHistory[data.key])
            end)
            if row.cols[2].clickBtn then
                row.cols[2].clickBtn:Show()
                row.cols[2].clickBtn:SetScript("OnClick", function(self, button)
                    if row.itemLink and HandleModifiedItemClick(row.itemLink) then
                        return
                    end
                    if button == "LeftButton" then
                        ShowPriceFrame(data.key, EasyAuctionDB.PriceHistory[data.key])
                    end
                end)
                row.cols[2].clickBtn:SetScript("OnEnter", function(self)
                    row:LockHighlight()
                    local name = row.cols[2]:GetText()
                    local link = row.itemLink
                    local data = row.itemData
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    if link then
                        GameTooltip:SetHyperlink(link)
                    else
                        GameTooltip:SetText(name, 1, 1, 1)
                    end
                    if data and data.titan then
                        GameTooltip:AddLine("碎片数：" .. tostring(data.titan), 1, 1, 1)
                    end
                    if data and data.titanValue then
                        GameTooltip:AddLine("换算每个泰坦碎片：" .. tostring(data.titanValue), 1, 1, 1)
                    end
                    GameTooltip:AddLine("左键点击查看价格列表", 1, 1, 0)
                    GameTooltip:Show()
                end)
                row.cols[2].clickBtn:SetScript("OnLeave", function(self)
                    row:UnlockHighlight()
                    GameTooltip:Hide()
                end)
            end
        else
            row:Hide()
            if row.trendBtn then row.trendBtn:Hide() end
        end
    end

    prevBtn:SetShown(EA_CategoryTotalPages > 1)
    nextBtn:SetShown(EA_CategoryTotalPages > 1)
    prevBtn:SetEnabled(EA_CategoryCurrentPage > 1)
    nextBtn:SetEnabled(EA_CategoryCurrentPage < EA_CategoryTotalPages)
    pageText:SetText(string.format("第%d/%d页", EA_CategoryCurrentPage, EA_CategoryTotalPages))
    prevBtn:SetScript("OnClick", function()
        if EA_CategoryMode then
            if EA_CategoryCurrentPage > 1 then
                EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage - 1)
            end
        else
            if currentPage > 1 then
                currentPage = currentPage - 1
                RefreshDBFrame()
            end
        end
    end)

    nextBtn:SetScript("OnClick", function()
        if EA_CategoryMode then
            if EA_CategoryCurrentPage < EA_CategoryTotalPages then
                local nextPage = EA_CategoryCurrentPage + 1
                EA_ShowCategory(EA_CategoryMode, nextPage)
            end
        else
            if currentPage < totalPages then
                currentPage = currentPage + 1
                RefreshDBFrame()
            end
        end
    end)
end

local _old_RefreshDBFrame = RefreshDBFrame
function RefreshDBFrame()
    if EA_CategoryMode then
        EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage)
        return
    end
    if DBFrame.EA_CategoryHeaderFS then DBFrame.EA_CategoryHeaderFS:Hide() end
    if EA_CategoryHeaderBtns then for _, btn in ipairs(EA_CategoryHeaderBtns) do btn:Hide() end end

    local headerFS = _G["EasyAuctionDBFrameHeader"]
    if headerFS then headerFS:Show() end
    if searchEditBox then searchEditBox:Show() end
    if resetBtn then resetBtn:Show() end
    if opportunityBtn then opportunityBtn:Show() end
    if _old_RefreshDBFrame then _old_RefreshDBFrame() end
end

local function MyAH_AutoFillStackAndCount()
    local name, _, count, _, _, _, _, sCount, _, itemID = GetAuctionSellItemInfo()
    if not name or not itemID then
        if AuctionsStackSizeEntry then AuctionsStackSizeEntry:Hide() end
        if AuctionsNumStacksEntry then AuctionsNumStacksEntry:Hide() end
        if AuctionsStackSizeMaxButton then AuctionsStackSizeMaxButton:Hide() end
        if AuctionsNumStacksMaxButton then AuctionsNumStacksMaxButton:Hide() end
        return
    end

    local total = 0
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and tonumber(link:match("item:(%d+)")) == itemID then
                local _, bagCount = GetContainerItemInfo(bag, slot)
                total = total + (bagCount or 0)
            end
        end
    end
    if total < 1 then total = 1 end

    if sCount and sCount > 1 then
        local stackSize = (count and count > 0) and count or math.min(sCount, total)
        if stackSize <= 0 then stackSize = sCount end
        local numStacks
        if total >= stackSize and stackSize > 0 then
            numStacks = math.floor(total / stackSize)
        elseif total > 0 and stackSize > 0 then
            numStacks = 1
        else
            numStacks = 1
        end
        if AuctionsStackSizeEntry then
            AuctionsStackSizeEntry:SetNumber(stackSize)
            AuctionsStackSizeEntry:Show()
            if AuctionsStackSizeEntry.SetEnabled then
                AuctionsStackSizeEntry:SetEnabled(true)
            elseif AuctionsStackSizeEntry.Enable then
                AuctionsStackSizeEntry:Enable()
            end
        end
        if AuctionsNumStacksEntry then
            AuctionsNumStacksEntry:SetNumber(numStacks)
            AuctionsNumStacksEntry:Show()
        end
        if AuctionsStackSizeMaxButton then
            AuctionsStackSizeMaxButton:Show()
            AuctionsStackSizeMaxButton:SetScript("OnClick", function()
                local _, _, _, _, _, _, _, sCount, _, iID = GetAuctionSellItemInfo()
                local bagTotal = 0
                for bag = 0, NUM_BAG_SLOTS do
                    for slot = 1, GetContainerNumSlots(bag) do
                        local link = GetContainerItemLink(bag, slot)
                        if link and tonumber(link:match("item:(%d+)")) == iID then
                            local _, n = GetContainerItemInfo(bag, slot)
                            bagTotal = bagTotal + (n or 0)
                        end
                    end
                end
                local fill = math.min(bagTotal, sCount or 1)
                if fill <= 0 then fill = sCount or 1 end
                AuctionsStackSizeEntry:SetNumber(fill)
            end)
        end
        if AuctionsNumStacksMaxButton then AuctionsNumStacksMaxButton:Show() end
    else
        if AuctionsStackSizeEntry then
            AuctionsStackSizeEntry:SetNumber(1)
            AuctionsStackSizeEntry:Show()
            if AuctionsStackSizeEntry.SetEnabled then
                AuctionsStackSizeEntry:SetEnabled(false)
            elseif AuctionsStackSizeEntry.Disable then
                AuctionsStackSizeEntry:Disable()
            end
        end
        if AuctionsNumStacksEntry then
            AuctionsNumStacksEntry:SetNumber(total)
            AuctionsNumStacksEntry:Show()
        end
        if AuctionsStackSizeMaxButton then
            AuctionsStackSizeMaxButton:Show()
            AuctionsStackSizeMaxButton:SetScript("OnClick", function()
                if AuctionsStackSizeEntry then AuctionsStackSizeEntry:SetNumber(1) end
            end)
        end
        if AuctionsNumStacksMaxButton then AuctionsNumStacksMaxButton:Show() end
    end
end
local autoFillFrame = CreateFrame("Frame")
autoFillFrame:RegisterEvent("NEW_AUCTION_UPDATE")
autoFillFrame:SetScript("OnEvent", function()
    C_Timer.After(0.1, MyAH_AutoFillStackAndCount)
end)

function MyAH_AutoFillPrice()
    local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
    local key = name and itemID and (name .. ":" .. itemID) or name
    if key and EasyAuctionDB and EasyAuctionDB.PriceHistory[key] and #EasyAuctionDB.PriceHistory[key] > 0 then
        local min = math.huge
        for _, v in ipairs(EasyAuctionDB.PriceHistory[key]) do
            if v.unit < min then min = v.unit end
        end
        if min < math.huge then
            FillAuctionPrice(min)
        end
    end
end

local priceFillFrame = CreateFrame("Frame")
priceFillFrame:RegisterEvent("NEW_AUCTION_UPDATE")
priceFillFrame:SetScript("OnEvent", function()
    MyAH_AutoFillPrice()
    local name, _, _, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
    local key = name and itemID and (name .. ":" .. itemID) or name
    if _G["AuctionHelper"] and _G["AuctionHelper"]:IsShown() then
        return
    elseif key and EasyAuctionDB and EasyAuctionDB.PriceHistory[key] then
        ShowPriceFrame(key, EasyAuctionDB.PriceHistory[key])
    end
end)

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
    if addon == "Blizzard_AuctionUI" then
        if AuctionsStackSizeEntry then
            AuctionsStackSizeEntry:ClearAllPoints()
            AuctionsStackSizeEntry:SetPoint("TOPLEFT", AuctionFrameAuctions, "TOPLEFT", 120, -220)
            AuctionsStackSizeEntry:SetWidth(40)
            AuctionsStackSizeEntry:SetHeight(22)
        end

        if AuctionsNumStacksEntry then
            AuctionsNumStacksEntry:ClearAllPoints()
            AuctionsNumStacksEntry:SetPoint("LEFT", AuctionsStackSizeEntry, "RIGHT", -40, -45)
            AuctionsNumStacksEntry:SetWidth(40)
            AuctionsNumStacksEntry:SetHeight(22)
        end

        if AuctionsStackSizeMaxButton then
            AuctionsStackSizeMaxButton:ClearAllPoints()
            AuctionsStackSizeMaxButton:SetPoint("LEFT", AuctionsStackSizeEntry, "RIGHT", 5, 0)
            AuctionsStackSizeMaxButton:SetWidth(32)
            AuctionsStackSizeMaxButton:SetHeight(22)
        end

        if AuctionsNumStacksMaxButton then
            AuctionsNumStacksMaxButton:ClearAllPoints()
            AuctionsNumStacksMaxButton:SetPoint("LEFT", AuctionsNumStacksEntry, "RIGHT", 5, 0)
            AuctionsNumStacksMaxButton:SetWidth(32)
            AuctionsNumStacksMaxButton:SetHeight(22)
        end
        if AuctionsCreateAuctionButton and not AuctionsCreateAuctionButton.EasyAuctionHooked then
            AuctionsCreateAuctionButton.__EasyAuction_OldOnClick = AuctionsCreateAuctionButton:GetScript("OnClick")
            AuctionsCreateAuctionButton:SetScript("OnClick", function(self)
                local name, _, count, _, _, _, _, sCount, _, itemID = GetAuctionSellItemInfo()
                if not name or not itemID then
                    if self.__EasyAuction_OldOnClick then self.__EasyAuction_OldOnClick(self) end
                    return
                end
                local buyout = MoneyInputFrame_GetCopper(BuyoutPrice)
                local stackSize = AuctionsStackSizeEntry and AuctionsStackSizeEntry:GetNumber() or 1
                if stackSize < 1 then stackSize = 1 end
                local _, _, _, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(itemID)
                if not vendorPrice or vendorPrice <= 0 then
                    if self.__EasyAuction_OldOnClick then self.__EasyAuction_OldOnClick(self) end
                    return
                end
                local totalVendor = vendorPrice * stackSize
                local totalBuyout = buyout
                local afterTax = math.floor(totalBuyout * 0.95 + 0.5)
                if totalBuyout > 0 and afterTax < totalVendor then
                    StaticPopupDialogs["EASYAUCTION_LOW_PROFIT"] = {
                        text = string.format("拍卖后到手%s，低于直接卖店%s！\n确定要这样上架吗？",
                            FormatGoldIcon(afterTax, 12), FormatGoldIcon(totalVendor, 12)),
                        button1 = "继续上架",
                        button2 = "取消",
                        OnAccept = function()
                            if AuctionsCreateAuctionButton.__EasyAuction_OldOnClick then
                                AuctionsCreateAuctionButton.__EasyAuction_OldOnClick(AuctionsCreateAuctionButton)
                            end
                        end,
                        timeout = 0,
                        whileDead = true,
                        hideOnEscape = true,
                        preferredIndex = 3,
                    }
                    StaticPopup_Show("EASYAUCTION_LOW_PROFIT")
                    return
                end
                if self.__EasyAuction_OldOnClick then self.__EasyAuction_OldOnClick(self) end
            end)
            AuctionsCreateAuctionButton.EasyAuctionHooked = true
        end
    end
end)

local function EasyAuction_BackupAddonList()
    if not EasyAuctionDB or EasyAuctionDB.AddonBackup then return end
    EasyAuctionDB.AddonBackup = {}
    for i = 1, GetNumAddOns() do
        local name, _, _, _ = GetAddOnInfo(i)
        if name and not name:find("^Blizzard_") then
            EasyAuctionDB.AddonBackup[name] = (GetAddOnEnableState(UnitName("player"), name) > 0)
        end
    end
    print("|cff00ff00[EasyAuction]|r 已保存当前插件启用状态。")
end

function EasyAuction_SetMinimalAddon()
    for i = 1, GetNumAddOns() do
        local name = GetAddOnInfo(i)
        if name and name ~= "EasyAuction" and not name:find("^Blizzard_") then
            DisableAddOn(name)
        end
    end
    print("|cff00ff00[EasyAuction]|r 极简模式已应用，仅保留EasyAuction")
    ReloadUI()
end

function EasyAuction_RestoreAddon()
    if not EasyAuctionDB or not EasyAuctionDB.AddonBackup then
        print("|cffff0000[EasyAuction]|r 没有可恢复的插件配置。")
        return
    end
    for name, state in pairs(EasyAuctionDB.AddonBackup) do
        if state then
            EnableAddOn(name)
        else
            DisableAddOn(name)
        end
    end
    print("|cff00ff00[EasyAuction]|r 插件配置已恢复。")
    ReloadUI()
end

local function InitEasyAuctionUI()
    if not AuctionFrameBrowse or not BrowseName or not BrowseBidButton then
        C_Timer.After(0.5, InitEasyAuctionUI)
        return
    end
end
local specialFrames = {
    "EasyAuctionPriceFrame",
    "EasyAuctionDBFrame",
}
for _, name in ipairs(specialFrames) do
    if _G[name] then
        tinsert(UISpecialFrames, name)
    end
end

local minimapLDBInitFrame = CreateFrame("Frame")
minimapLDBInitFrame:RegisterEvent("ADDON_LOADED")
minimapLDBInitFrame:RegisterEvent("PLAYER_LOGIN")
minimapLDBInitFrame:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" then
        if addon == "Blizzard_AuctionUI" then
            InitEasyAuctionUI()
        elseif addon == "EasyAuction" then
            local LDB = LibStub("LibDataBroker-1.1", true)
            local LDBIcon = LibStub("LibDBIcon-1.0", true)
            if LDB and LDBIcon then
                EasyAuctionDB = EasyAuctionDB or {}
                local DB = EasyAuctionDB or {}
                DB.minimap = DB.minimap or {}
                DB.PriceHistory = DB.PriceHistory or {}
                DB.DailyMinPrice = DB.DailyMinPrice or {}
                DB.CurrentTodayMin = DB.CurrentTodayMin or {}
                DB.FavoriteItems = DB.FavoriteItems or {}
                DB.RecentSearch = DB.RecentSearch or {}
                DB.ShowPrice = DB.ShowPrice == nil and true or DB.ShowPrice
                DB.enablePrice = DB.enablePrice == nil and true or DB.enablePrice
                DB.enableVendor = DB.enableVendor == nil and true or DB.enableVendor
                DB.enableDisenchant = DB.enableDisenchant == nil and true or DB.enableDisenchant
                DB.SellPanel = DB.SellPanel == nil and true or DB.SellPanel
                DB.showUnitPrice = DB.showUnitPrice == nil and true or DB.showUnitPrice
                DB.enableUndercut = DB.enableUndercut == nil and true or DB.enableUndercut
                DB.undercutMode = DB.undercutMode == "unit" and "unit" or "total"
                DB.showSections = DB.showSections or { items = true, price = true, myauct = true }
                DB.scanPerFrame = DB.scanPerFrame or 500
                DB.buyRiskLimit = DB.buyRiskLimit or 500
                DB.scanQuickMode = DB.scanQuickMode == nil and true or DB.scanQuickMode
                DB.scanQuickLimit = DB.scanQuickLimit or 100
                DB.autoFillLastAuction = DB.autoFillLastAuction == nil and false or DB.autoFillLastAuction
                DB.enableAuctionListCopy = DB.enableAuctionListCopy == nil and true or DB.enableAuctionListCopy
                local dataobj = LDB:NewDataObject("EasyAuction", {
                    type = "data source",
                    text = "EasyAuction",
                    icon = "Interface\\Icons\\INV_Misc_Coin_01",
                    OnClick = function(self, button)
                        if button == "LeftButton" then
                            if EasyAuction_OpenDBFrame then
                                EasyAuction_OpenDBFrame()
                            end
                            -- elseif button == "RightButton" then
                            --     print("|cff00ff00EasyAuction|r 预留功能")
                        end
                    end,
                    OnTooltipShow = function(tt)
                        tt:AddLine("|cff00ff00EasyAuction 拍卖行价格库|r")
                        tt:AddLine("|cffffff00左键|r 打开价格数据库")
                        --tt:AddLine("|cffffff00右键|r 预留功能")
                    end,
                })
                LDBIcon:Register("EasyAuction", dataobj, DB.minimap)
                print("|cff00ff00[EasyAuction]|r 拍卖行增强插件已加载，输入 |cff00ff00/epah|r 打开插件。")
                EasyAuction_BackupAddonList()
                CheckShowUpdateNotes()
                self:UnregisterEvent("ADDON_LOADED")
            end
        end
    end
end)
function EasyAuction_ShowScanProgress()
    if EasyAuctionScanProgressFrame then
        EasyAuctionScanProgressFrame:Show()
        if EasyAuctionScanProgressFrame._EA_PrepareTicker then
            EasyAuctionScanProgressFrame._EA_PrepareTicker:Cancel()
        end
        EasyAuctionScanProgressFrame._EA_PrepareTime = GetTime()
        EasyAuctionScanProgressFrame._EA_PrepareTicker = C_Timer.NewTicker(0.1, function()
            if not EasyAuctionScanProgressFrame:IsVisible() then
                if EasyAuctionScanProgressFrame._EA_PrepareTicker then
                    EasyAuctionScanProgressFrame._EA_PrepareTicker:Cancel()
                end
                return
            end
            local t = GetTime() - (EasyAuctionScanProgressFrame._EA_PrepareTime or GetTime())
            EasyAuctionScanProgressFrame.Status:SetText(string.format("正在准备...(%.1f秒)", t))
        end)
        return
    end

    local f = CreateFrame("Frame", "EasyAuctionScanProgressFrame", UIParent, "BackdropTemplate")
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetSize(420, 180)
    f:SetPoint("CENTER")
    f:SetMovable(false)
    f:EnableMouse(false)
    f:SetFrameLevel(120)
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

    f.Title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    f.Title:SetPoint("TOP", 0, -22)
    f.Title:SetText("正在搜索拍卖行价格")

    f.Status = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.Status:SetPoint("TOP", f.Title, "BOTTOM", 0, -8)
    f.Status:SetText("正在准备...")

    f.ProgressBar = CreateFrame("StatusBar", nil, f, "TextStatusBar")
    f.ProgressBar:SetPoint("TOP", f.Status, "BOTTOM", 0, -14)
    f.ProgressBar:SetSize(340, 28)
    f.ProgressBar:SetMinMaxValues(0, 1)
    f.ProgressBar:SetValue(0)
    f.ProgressBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    f.ProgressBar:SetStatusBarColor(0.2, 0.7, 1)
    f.ProgressBar.Bg = f.ProgressBar:CreateTexture(nil, "BACKGROUND")
    f.ProgressBar.Bg:SetAllPoints()
    f.ProgressBar.Bg:SetColorTexture(0.1, 0.1, 0.1, 0.4)

    f.ProgressBar.Percent = f.ProgressBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.ProgressBar.Percent:SetPoint("CENTER", f.ProgressBar, "CENTER")
    f.ProgressBar.Percent:SetText("0%")

    f.ProgressBar.Detail = f.ProgressBar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    f.ProgressBar.Detail:SetPoint("RIGHT", f.ProgressBar, "RIGHT", -6, 0)

    f.Desc = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    f.Desc:SetPoint("TOP", f.ProgressBar, "BOTTOM", 0, -8)
    f.Desc:SetText("|cffffff00请勿操作鼠标和键盘...|r")

    f.Result = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.Result:SetPoint("BOTTOM", 0, 48)
    f.Result:SetText("")
    f.Result:Hide()

    f.CloseBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.CloseBtn:SetText("关闭")
    f.CloseBtn:SetSize(80, 28)
    f.CloseBtn:SetPoint("BOTTOM", 0, 8)
    f.CloseBtn:Hide()
    f.CloseBtn:SetScript("OnClick", function()
        f:Hide()
        if EasyAuctionDBFrame then
            EasyAuction_OpenDBFrame()
        end
    end)

    f._EA_PrepareTicker = nil
    f._EA_PrepareTime = nil

    function f:StartPrepareTimer()
        if self._EA_PrepareTicker then
            self._EA_PrepareTicker:Cancel()
        end
        self._EA_PrepareTime = GetTime()
        self._EA_PrepareTicker = C_Timer.NewTicker(0.1, function()
            if not self:IsVisible() then
                if self._EA_PrepareTicker then
                    self._EA_PrepareTicker:Cancel()
                end
                return
            end
            local t = GetTime() - (self._EA_PrepareTime or GetTime())
            self.Status:SetText(string.format("正在准备...(%.1f秒)", t))
        end)
    end

    function f:StopPrepareTimer()
        if self._EA_PrepareTicker then
            self._EA_PrepareTicker:Cancel()
            self._EA_PrepareTicker = nil
        end
    end

    function f:UpdateStatus(msg)
        self:StopPrepareTimer()
        self.Status:SetText(msg or "")
    end

    function f:UpdateProgress(cur, total)
        cur = cur or 0
        total = total or 1
        self.ProgressBar:SetMinMaxValues(0, total)
        self.ProgressBar:SetValue(cur)
        local percent = (total > 0) and (cur / total * 100) or 100
        if self.ProgressBar.Percent then
            self.ProgressBar.Percent:SetText(string.format("%.1f%%", percent))
        end
        if self.ProgressBar.Detail then
            self.ProgressBar.Detail:SetText(string.format("%d / %d", cur, total))
        end
        self:StopPrepareTimer()
    end

    function f:ShowResult(text)
        self:StopPrepareTimer()
        self.Result:SetText(text or "")
        self.Result:Show()
        self.CloseBtn:Show()
        self.Desc:Hide()
    end

    function f:Reset()
        self:StopPrepareTimer()
        self.Result:Hide()
        self.CloseBtn:Hide()
        self.Desc:Show()
        self.Status:SetText("正在准备...")
        self.ProgressBar:SetMinMaxValues(0, 1)
        self.ProgressBar:SetValue(0)
        self.ProgressBar.Percent:SetText("0%")
        self.ProgressBar.Detail:SetText("0 / 0")
        self:StartPrepareTimer()
    end

    tinsert(UISpecialFrames, "EasyAuctionScanProgressFrame")
    EasyAuctionScanProgressFrame = f

    f:StartPrepareTimer()
end

function EasyAuction_UpdateScanProgress(cur, total, elapsed)
    if not EasyAuctionScanProgressFrame then return end
    local f = EasyAuctionScanProgressFrame
    f.ProgressBar:SetMinMaxValues(0, total > 0 and total or 1)
    f.ProgressBar:SetValue(cur)
    local percent = (total > 0) and (cur / total * 100) or 100
    if f.ProgressBar.Percent then
        f.ProgressBar.Percent:SetText(string.format("%.1f%%", percent))
    end

    if f._EA_PrepareTicker then
        f._EA_PrepareTicker:Cancel()
        f._EA_PrepareTicker = nil
    end
    if elapsed then
        f.Status:SetText(string.format("已采集：%d / %d  用时：%.1fs", cur, total, elapsed))
    end
end

local function cleanupOldData()
    local cutoffTime = time() - (30 * 86400)
    local cleanedCount = 0

    for name, data in pairs(EasyAuctionDB.PriceHistory) do
        if type(data) == "table" and not data.minUnit then
            local newData = {}
            for _, record in ipairs(data) do
                if record.t and record.t > cutoffTime then
                    table.insert(newData, record)
                end
            end
            if #newData > 0 then
                EasyAuctionDB.PriceHistory[name] = newData
                table.sort(newData, function(a, b) return a.unit < b.unit end)
                EasyAuctionDB.PriceHistory[name].minUnit = newData[1].unit
            else
                EasyAuctionDB.PriceHistory[name] = nil
            end

            cleanedCount = cleanedCount + 1
        end
    end

    if cleanedCount > 0 then
        print(string.format("|cff00ff00[EasyAuction]|r 已清理 %d 个物品的过期数据。", cleanedCount))
    end
end

function EasyAuction_ShowScanResult(new, update, totalKinds, elapsed)
    if not EasyAuctionScanProgressFrame then return end
    local f = EasyAuctionScanProgressFrame
    f.Result:Show()
    f.Result:SetText(
        string.format("总种类:%d 新增:%d 更新:%d", totalKinds, new, update)
    )
    f.CloseBtn:Show()
    f.Desc:Hide()
end

function EasyAuction_HideScanProgress()
    if EasyAuctionScanProgressFrame then
        EasyAuctionScanProgressFrame:Hide()
    end
end

local function EA_DebugPrint(...)
    if EasyAuctionDB and EasyAuctionDB.debugPrint then
        print("|cff00ff80[EA-DEBUG]|r", ...)
    end
end

if EasyAuctionScanFinishFrame then
    EasyAuctionScanFinishFrame:Hide()
    EasyAuctionScanFinishFrame = nil
end

local function ShowEasyAuctionScanFinishFrame()
    if EasyAuctionScanFinishFrame then
        EasyAuctionScanFinishFrame:Show()
        return
    end

    local f = CreateFrame("Frame", "EasyAuctionScanFinishFrame", UIParent, "BackdropTemplate")
    f:SetSize(380, 150)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 280)
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 24,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    f:SetBackdropColor(0, 0, 0, 0.95)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText("全服拍卖扫描完成")

    local statusFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    statusFS:SetPoint("TOPLEFT", 24, -45)
    statusFS:SetWidth(340)
    statusFS:SetJustifyH("LEFT")
    statusFS:SetJustifyV("TOP")
    f.statusFS = statusFS

    local reloadBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    reloadBtn:SetSize(100, 24)
    reloadBtn:SetText("现在重载")
    reloadBtn:SetPoint("BOTTOM", f, "BOTTOM", -55, 14)
    reloadBtn:SetScript("OnClick", function()
        f:Hide()
        ReloadUI()
    end)

    local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    closeBtn:SetSize(80, 24)
    closeBtn:SetText("关闭")
    closeBtn:SetPoint("LEFT", reloadBtn, "RIGHT", 20, 0)
    closeBtn:SetScript("OnClick", function()
        f:Hide()
    end)

    local function UpdateText()
        local canQuery, canQueryAll = CanSendAuctionQuery()
        local g = canQueryAll and "|cff00ff00可用|r" or "|cffff2020不可用|r"
        local s = canQuery and "|cff00ff00可用|r" or "|cffff2020不可用|r"
        local info = "请及时 |cff00ff00/reload|r 保存数据。\n全局扫描需要返回角色大厅才可重新启用\n\n搜索状态：\n全局：" .. g .. "\n单体：" .. s
        f.statusFS:SetText(info)
    end

    f.ticker = C_Timer.NewTicker(0.5, UpdateText)
    f:SetScript("OnHide", function(self)
        if self.ticker then
            self.ticker:Cancel()
            self.ticker = nil
        end
    end)

    UpdateText()
    f:Show()
    EasyAuctionScanFinishFrame = f
end

function EasyAuction_ScanAllAuctionItems()
    EasyAuctionDB.debugPrint = false
    if IsScanningAll then
        EA_DebugPrint("正在扫描中，阻止二次进入。")
        print("|cff00ff00[EasyAuction]|r 正在扫描中，请稍候...")
        return
    end

    cleanupOldData()
    IsScanningAll = true
    UpdateScanBtnState()
    UpdateAuctionQueryStatusText()
    EasyAuction_ShowScanProgress()

    local scanStartTime         = GetTime()

    local perFrame              = EasyAuctionDB.scanPerFrame or 500
    local quickMode             = EasyAuctionDB.scanQuickMode
    local QUICK_LIMIT           = EasyAuctionDB.scanQuickLimit or 100

    local totalItems            = 0
    local result                = {}
    local totalKinds            = 0
    local newCount, updateCount = 0, 0
    local itemScanCount         = {}

    local missingInfo           = {}
    local itemID2Key            = {}

    local function tempfunc(startIndex)
        startIndex = startIndex or 0
        local n, total = GetNumAuctionItems("list")
        if startIndex >= n then
            local itemKeys = {}
            for k in pairs(result) do table.insert(itemKeys, k) end
            totalKinds = #itemKeys
            local idx = 1
            local perSave = 50
            local function saveBatch()
                local i = 0
                while idx <= totalKinds and i < perSave do
                    local key = itemKeys[idx]
                    if key and key ~= "" then
                        local items = result[key]
                        if type(items) == "table" and #items > 0 then
                            table.sort(items, function(a, b) return a.unit < b.unit end)
                            if items[1] and items[1].unit and items[1].unit > 0 then
                                local prev = EasyAuctionDB.PriceHistory[key]
                                if not prev then
                                    newCount = newCount + 1
                                else
                                    updateCount = updateCount + 1
                                end
                                EasyAuctionDB.PriceHistory[key] = items
                                EasyAuctionDB.PriceHistory[key].minUnit = items[1].unit

                                local today = date("%Y-%m-%d")
                                local minUnit = items[1].unit
                                local minCount = 0
                                for _, v in ipairs(items) do
                                    if v.unit == minUnit then minCount = minCount + (v.count or 1) end
                                end
                                EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
                                EasyAuctionDB.DailyMinPrice[key] = EasyAuctionDB.DailyMinPrice[key] or {}
                                EasyAuctionDB.DailyMinPrice[key][today] = { unit = minUnit, count = minCount }
                                EasyAuctionDB.CurrentTodayMin = EasyAuctionDB.CurrentTodayMin or {}
                                if EasyAuctionDB.CurrentTodayMin[key] then
                                    EasyAuctionDB.CurrentTodayMin[key] = math.min(EasyAuctionDB.CurrentTodayMin[key],
                                        minUnit)
                                else
                                    EasyAuctionDB.CurrentTodayMin[key] = minUnit
                                end

                                EasyAuctionDB.LastScanMinPrice = EasyAuctionDB.LastScanMinPrice or {}
                                EasyAuctionDB.LastScanMinPrice[key] = minUnit
                            end
                            if i == 0 then
                                EA_DebugPrint("保存首个key:", key, "数量:", #items)
                            end
                        end
                    end
                    idx = idx + 1
                    i = i + 1
                end
                EasyAuction_UpdateScanProgress(idx - 1, totalKinds, GetTime() - scanStartTime)
                if idx <= totalKinds then
                    C_Timer.After(0.01, saveBatch)
                else
                    EasyAuction_ShowScanResult(newCount, updateCount, totalKinds, GetTime() - scanStartTime)
                    print(string.format("|cff00ff00[EasyAuction]|r 全服拍卖价格已采集，种类%d，新增%d，更新%d，耗时%.2fs。", totalKinds,
                        newCount, updateCount, GetTime() - scanStartTime))
                    IsScanningAll = false
                    UpdateScanBtnState()
                    UpdateAuctionQueryStatusText()
                    AuctionFrame:Hide()
                    ShowEasyAuctionScanFinishFrame()
                    C_Timer.After(2, function()
                        for k in pairs(result) do result[k] = nil end
                    end)
                end
            end

            local function TryCompleteMissingItems()
                local anyMissing = false
                for itemID in pairs(missingInfo) do
                    local name, link = GetItemInfo(itemID)
                    if name and link then
                        local key = itemID2Key[itemID] or tostring(itemID)
                        local targetKey = name .. ":" .. tostring(itemID)
                        if result[key] and key ~= targetKey then
                            result[targetKey] = result[targetKey] or {}
                            for _, entry in ipairs(result[key]) do
                                local isDup = false
                                for _, exist in ipairs(result[targetKey]) do
                                    if exist.unit == entry.unit and exist.count == entry.count and exist.t == entry.t then
                                        isDup = true
                                        break
                                    end
                                end
                                if not isDup then
                                    table.insert(result[targetKey], entry)
                                end
                            end
                            result[key] = nil
                        elseif result[key] then
                        end
                        if result[targetKey] then
                            for _, entry in ipairs(result[targetKey]) do
                                if not entry.name then entry.name = name end
                                if not entry.link then entry.link = link end
                            end
                        end
                        missingInfo[itemID] = nil
                    else
                        if not EasyAuction_Tooltip then
                            EasyAuction_Tooltip = CreateFrame("GameTooltip", "EasyAuction_Tooltip", nil,
                                "GameTooltipTemplate")
                            EasyAuction_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
                        end
                        EasyAuction_Tooltip:SetHyperlink("item:" .. itemID)
                        anyMissing = true
                    end
                end
                if anyMissing then
                    C_Timer.After(0.5, TryCompleteMissingItems)
                else
                    print("|cff00ff00[EasyAuction]|r 缺失物品信息已自动补全。")
                    saveBatch()
                end
            end

            if next(missingInfo) then
                print("|cffffff00[EasyAuction]|r 存在待补全的物品信息，自动补全中...")
                TryCompleteMissingItems()
            else
                saveBatch()
            end
        else
            local endIndex = math.min(startIndex + perFrame, n)
            for i = startIndex + 1, endIndex do
                EasyAuction_UpdateScanProgress(i, n, GetTime() - scanStartTime)
                local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list",
                    i)
                local link = GetAuctionItemLink("list", i)
                local unit = (buyout and count and count > 0) and math.floor(buyout / count) or nil
                local key
                if name and itemID then
                    key = name .. ":" .. itemID
                elseif itemID then
                    key = tostring(itemID)
                end

                if key and buyout and buyout > 0 and count and count > 0 then
                    if not quickMode or (itemScanCount[key] or 0) < QUICK_LIMIT then
                        result[key] = result[key] or {}
                        table.insert(result[key],
                            { unit = unit, count = count, t = time(), link = link, owner = owner, itemID = itemID, name =
                            name })
                        itemScanCount[key] = (itemScanCount[key] or 0) + 1
                        totalItems = totalItems + 1
                        if itemID and (not name or not link) then
                            missingInfo[itemID] = true
                            itemID2Key[itemID] = key
                        end
                    end
                end
            end
            C_Timer.After(0.01, function() tempfunc(endIndex) end)
        end
    end

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    eventFrame:SetScript("OnEvent", function(self)
        eventFrame:UnregisterAllEvents()
        tempfunc(0)
    end)

    if not (AuctionFrame and AuctionFrame:IsShown()) then
        EA_DebugPrint("AuctionFrame未显示，终止扫描。")
        IsScanningAll = false
        return
    end
    if AuctionFrame and AuctionFrameBrowse and not AuctionFrameBrowse:IsShown() then
        AuctionFrameTab1:Click()
        C_Timer.After(0.2, function()
            QueryAuctionItems("", nil, nil, 0, nil, nil, true, true, nil)
        end)
    else
        QueryAuctionItems("", nil, nil, 0, nil, nil, true, true, nil)
    end
end

StaticPopupDialogs["EASYAUCTION_SCANALL_CONFIRM"] = {
    text =
    "|cffff2020|TInterface\\DialogFrame\\UI-Dialog-Icon-AlertNew:24:24:0:0|t 警告！|r\n\n|cffff0000本操作将自动扫描所有拍卖物品！\n过程中请勿操作鼠标和键盘，否则数据可能异常！\n\n此操作可能耗时较长，请确认你已准备好。|r",
    button1 = "我已知晓风险，继续",
    button2 = "取消",
    OnAccept = function()
        EasyAuction_ScanAllAuctionItems()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}
StaticPopupDialogs["BUYOUT_AUCTION"] = {
    text = "|cffff2020警告！当前物品一口价已超风控金额|r\n\n你确定要以一口价购买该物品吗？\n\n请仔细核对价格，防止误操作。",
    button1 = "确定",
    button2 = "取消",
    OnAccept = function(self, data)
        if data and data.func then
            data.func()
        end
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}


local function SetFlashBuyButtonsVisible(visible)
    for i = 1, NUM_BROWSE_TO_DISPLAY do
        local row = _G["BrowseButton" .. i]
        if row and row.EasyAuctionFlashBuy then
            if visible then
                row.EasyAuctionFlashBuy:Show()
            else
                row.EasyAuctionFlashBuy:Hide()
            end
        end
    end
end

function EasyAuction_CreateBuyoutButton()
    if _G["EasyAuctionBuyoutCheckButton"] or not AuctionFrameBrowse then return end
    local btn = CreateFrame("CheckButton", "EasyAuctionBuyoutCheckButton", AuctionFrameBrowse, "UICheckButtonTemplate")
    if _G["EasyAuctionAllowOverBuyCheck"] then
        btn:SetPoint("LEFT", EasyAuctionAllowOverBuyCheck, "RIGHT", 30, 0)
    else
        btn:SetPoint("LEFT", AuctionFrameBrowse, "TOPLEFT", 530, -52)
    end
    btn:SetSize(26, 26)
    local txt = _G["EasyAuctionBuyoutCheckButtonText"]
    txt:SetFontObject(GameFontHighlightSmall)
    txt:SetText(
        "|cffff4040闪|r" ..
        "|cffffa840购|r" ..
        "|cffffed40模|r" ..
        "|cff90ee90式|r"
    )
    txt:EnableMouse(true)
    txt:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("闪购模式", 1, 1, 1, true)
        GameTooltip:AddLine("开启后：", 1, 1, 0.8, true)
        GameTooltip:AddLine("1. 点击拍卖记录的任意位置，将自动直接购买，无需确认。", 1, 1, 1, true)
        GameTooltip:AddLine("2. 原有的‘买’按钮将被隐藏。", 1, 0.9, 0.2, true)
        GameTooltip:AddLine("（大于100金会弹出系统确认窗口）", 1, 0.5, 0.5, true)
        GameTooltip:AddLine("|cffff0000请谨慎操作，防止误买！|r", 1, 0.4, 0.4, true)
        GameTooltip:Show()
    end)
    txt:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", function(self)
        if self:GetChecked() then
            SetFlashBuyButtonsVisible(false)
        else
            SetFlashBuyButtonsVisible(true)
        end
    end)

    C_Timer.After(0.1, function()
        SetFlashBuyButtonsVisible(not btn:GetChecked())
    end)

    if not EasyAuction_BuyoutHooked then
        hooksecurefunc("BrowseButton_OnClick", function(button)
            if EasyAuctionBuyoutCheckButton and EasyAuctionBuyoutCheckButton:GetChecked() then
                local index = GetSelectedAuctionItem and AuctionFrame and AuctionFrame.type and
                    GetSelectedAuctionItem(AuctionFrame.type)
                local buyout = AuctionFrame and AuctionFrame.buyoutPrice
                if index and buyout and buyout > 0 then
                    local buyRiskLimit = EasyAuctionDB.buyRiskLimit or 500
                    if buyRiskLimit > 0 and buyout > buyRiskLimit * 10000 then
                        local gold = math.floor(buyout / 10000)
                        local silver = math.floor((buyout % 10000) / 100)
                        local copper = buyout % 100
                        local priceText = string.format("%d金%02d银%02d铜", gold, silver, copper)
                        StaticPopup_Show("BUYOUT_AUCTION", priceText, nil, {
                            func = function()
                                PlaceAuctionBid(AuctionFrame.type, index, buyout)
                            end
                        })
                    else
                        PlaceAuctionBid(AuctionFrame.type, index, buyout)
                    end
                end
            end
        end)
        EasyAuction_BuyoutHooked = true
    end
end

function EasyAuction_EnsureFlashBuyButtons()
    for i = 1, NUM_BROWSE_TO_DISPLAY do
        local row = _G["BrowseButton" .. i]
        if row and not row.EasyAuctionFlashBuy then
            local btn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            btn:SetSize(28, 28)
            btn:SetText("买")
            btn:SetPoint("RIGHT", row, "RIGHT", -160, 2)
            btn:Hide()
            btn:SetFrameLevel(row:GetFrameLevel() + 10)
            btn:SetFrameStrata(row:GetFrameStrata() or "HIGH")
            row.EasyAuctionFlashBuy = btn
        end
    end

    for i = 1, NUM_BROWSE_TO_DISPLAY or 8 do
        local btn = _G["BrowseButton" .. i]
        if btn and not btn._ea_tooltip_hooked then
            btn:HookScript("OnEnter", function(self)
                local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
                local index = offset + i
                local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, _, _, _, owner, _, _, itemID =
                    GetAuctionItemInfo("list", index)

                if not name or not buyoutPrice or not count or count == 0 then return end
                local unitBuyout = math.floor(buyoutPrice / count + 0.5)

                local histMin = nil
                local todayMin = nil
                if EasyAuctionDB.PriceHistory and name and itemID then
                    local key = name .. ":" .. itemID
                    if EasyAuctionDB.PriceHistory[key] then
                        histMin = EasyAuctionDB.PriceHistory[key].minUnit
                    end
                    todayMin = EasyAuctionDB.CurrentTodayMin and EasyAuctionDB.CurrentTodayMin[key]
                end
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetAuctionItem("list", index)
                GameTooltip:AddDoubleLine("本行单价", FormatGoldIcon(unitBuyout), 1, 1, 1, 1, 1, 1)
                if histMin and histMin > 0 then
                    local diff = unitBuyout - histMin
                    diff = (diff >= 0) and math.floor(diff + 0.5) or math.ceil(diff - 0.5)
                    local percent = diff / histMin * 100
                    local percentColor = percent >= 0 and "|cffff6600" or "|cff00ff00"
                    local diffColor = percent >= 0 and "|cffff6600" or "|cff00ff00"
                    local leftText = format("比历史最低：%s%+.1f%%%s", percentColor, percent, "|r")
                    local rightText = diffColor .. (diff >= 0 and "+" or "") .. FormatGoldIcon(diff) .. "|r"
                    GameTooltip:AddDoubleLine(leftText, rightText, 1, 1, 1, 1, 1, 1)
                elseif histMin == nil then
                    GameTooltip:AddDoubleLine("比历史最低：", "|cffff8888无数据|r", 1, 1, 1, 1, 1, 1)
                end

                if todayMin and todayMin > 0 then
                    local diff = unitBuyout - todayMin
                    diff = (diff >= 0) and math.floor(diff + 0.5) or math.ceil(diff - 0.5)
                    local percent = diff / todayMin * 100
                    local percentColor = percent >= 0 and "|cffffcc00" or "|cff00ff00"
                    local diffColor = percent >= 0 and "|cffffcc00" or "|cff00ff00"
                    local leftText = format("比今日最低：%s%+.1f%%%s", percentColor, percent, "|r")
                    local rightText = diffColor .. (diff >= 0 and "+" or "") .. FormatGoldIcon(diff) .. "|r"
                    GameTooltip:AddDoubleLine(leftText, rightText, 1, 1, 1, 1, 1, 1)
                elseif todayMin == nil then
                    GameTooltip:AddDoubleLine("比今日最低：", "|cffff8888无数据|r", 1, 1, 1, 1, 1, 1)
                end

                GameTooltip:Show()
            end)
            btn._ea_tooltip_hooked = true
        end
    end
end

function EasyAuction_RefreshFlashBuyButtons()
    if EasyAuctionBuyoutCheckButton and EasyAuctionBuyoutCheckButton:GetChecked() then
        for i = 1, NUM_BROWSE_TO_DISPLAY do
            local row = _G["BrowseButton" .. i]
            local btn = row and row.EasyAuctionFlashBuy
            if btn then btn:Hide() end
        end
        return
    end

    local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame) or 0
    local myName = UnitName("player")
    for i = 1, NUM_BROWSE_TO_DISPLAY do
        local row = _G["BrowseButton" .. i]
        local btn = row and row.EasyAuctionFlashBuy
        if btn then
            btn:ClearAllPoints()
            btn:SetPoint("RIGHT", row, "RIGHT", -160, 2)
            local idx = offset + i
            local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list", idx)
            local isMine = owner and myName and (owner == myName or owner:find("^" .. myName .. "-"))
            if buyout and buyout > 0 and not isMine then
                btn:Show()
                btn:SetEnabled(true)
                btn:SetScript("OnClick", function(self)
                    local buyRiskLimit = EasyAuctionDB.buyRiskLimit or 500
                    if buyRiskLimit > 0 and buyout > buyRiskLimit * 10000 then
                        local gold = math.floor(buyout / 10000)
                        local silver = math.floor((buyout % 10000) / 100)
                        local copper = buyout % 100
                        local priceText = string.format("%d金%02d银%02d铜", gold, silver, copper)
                        StaticPopup_Show("BUYOUT_AUCTION", priceText, nil, {
                            func = function()
                                PlaceAuctionBid("list", idx, buyout)
                            end
                        })
                    else
                        PlaceAuctionBid("list", idx, buyout)
                    end
                end)
            else
                btn:Hide()
                btn:SetEnabled(false)
                btn:SetScript("OnClick", nil)
            end
        end
    end
end

local function EasyAuction_RegisterAuctionsButtonRightClick()
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

local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_HOUSE_SHOW")
f:SetScript("OnEvent", function(_, event)
    SetCVar("auctionSortByBuyoutPrice", 1)
    SetCVar("auctionSortByUnitPrice", 1)
    AuctionFrame_SetSort(sortTable or "list", "bid", false)
    EasyAuction_RemoveOldKeys()
    C_Timer.After(0.1, EasyAuction_CreateBuyoutButton)
    C_Timer.After(0.2, EasyAuction_CreateSellPanelButton)
    C_Timer.After(0.2, EasyAuction_RegisterAuctionsButtonRightClick)
end)

local function EasyAuction_InitBrowseButtonHighlight()
    for i = 1, NUM_BROWSE_TO_DISPLAY do
        local btn = _G["BrowseButton" .. i]
        if btn and not btn.ownerTextur then
            local tex = btn:CreateTexture(nil, "BACKGROUND")
            tex:SetAllPoints()
            tex:SetTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight")
            tex:SetVertexColor(0.5, 0.7, 1.0, 0.9)
            tex:Hide()
            btn.ownerTextur = tex
        end
    end
end

local fa = CreateFrame("Frame")
fa:RegisterEvent("AUCTION_HOUSE_SHOW")
fa:SetScript("OnEvent", function()
    if EasyAuctionDB.PriceHistory then
        for key in pairs(EasyAuctionDB.PriceHistory) do
            if not key:find(":%d+$") then
                EasyAuctionDB.PriceHistory[key] = nil
            end
        end
    end

    if EasyAuctionDB.DailyMinPrice then
        for key in pairs(EasyAuctionDB.DailyMinPrice) do
            if not key:find(":%d+$") then
                EasyAuctionDB.DailyMinPrice[key] = nil
            end
        end
    end
    C_Timer.After(0.2, EasyAuction_InitBrowseButtonHighlight)
end)

hooksecurefunc("FauxScrollFrame_Update", function(frame)
    if frame == _G["BrowseScrollFrame"] then
        EasyAuction_EnsureFlashBuyButtons()
        EasyAuction_RefreshFlashBuyButtons()
        local myName = UnitName("player")
        for i = 1, NUM_BROWSE_TO_DISPLAY do
            local btn = _G["BrowseButton" .. i]
            if btn and btn.itemIndex and btn.ownerTextur then
                local index = btn.itemIndex
                index = (index % 50 == 0) and 50 or (index % 50)
                local owner = select(14, GetAuctionItemInfo("list", index))
                if owner and myName and (owner == myName or owner:find("^" .. myName .. "%-")) then
                    btn.ownerTextur:Show()
                else
                    btn.ownerTextur:Hide()
                end
            elseif btn and btn.ownerTextur then
                btn.ownerTextur:Hide()
            end
        end
    end
end)

local function EasyAuction_AddPriceInfo(tip, itemLink, itemCount)
    EasyAuction_OnTooltipItem(tip, itemLink, itemCount or 1)
end

local function HookTooltipMethods()
    local methods = {
        "SetBagItem", "SetInventoryItem", "SetMerchantItem", "SetBuybackItem",
        "SetGuildBankItem", "SetLootItem", "SetLootRollItem", "SetQuestItem",
        "SetQuestLogItem", "SetSendMailItem", "SetInboxItem",
        "SetTradePlayerItem", "SetTradeTargetItem", "SetAuctionItem",
        "SetItemByID", "SetHyperlink",
    }
    for _, method in ipairs(methods) do
        if GameTooltip[method] then
            hooksecurefunc(GameTooltip, method, function(self, ...)
                local itemLink
                local itemCount = 1
                if method == "SetBagItem" then
                    local bag, slot = ...
                    itemLink = GetContainerItemLink(bag, slot)
                    local info = GetContainerItemInfo(bag, slot)
                    if type(info) == "table" then
                        itemCount = info.stackCount or 1
                    else
                        local _, count = GetContainerItemInfo(bag, slot)
                        itemCount = count or 1
                    end
                elseif method == "SetInventoryItem" then
                    local unit, slot = ...
                    itemLink = GetInventoryItemLink(unit, slot)
                    itemCount = GetInventoryItemCount(unit, slot) or 1
                elseif method == "SetMerchantItem" then
                    local index = ...
                    itemLink = GetMerchantItemLink(index)
                    local _, _, _, count = GetMerchantItemInfo(index)
                    itemCount = count
                elseif method == "SetBuybackItem" then
                    local slot = ...
                    itemLink = GetBuybackItemLink(slot)
                    local _, _, _, count = GetBuybackItemInfo(slot)
                    itemCount = count
                elseif method == "SetGuildBankItem" then
                    local tab, slot = ...
                    itemLink = GetGuildBankItemLink(tab, slot)
                    local _, count = GetGuildBankItemInfo(tab, slot)
                    itemCount = count
                elseif method == "SetLootItem" then
                    local slot = ...
                    itemLink = GetLootSlotLink(slot)
                    local _, _, count = GetLootSlotInfo(slot)
                    itemCount = count or 1
                elseif method == "SetLootRollItem" then
                    local slot = ...
                    itemLink = GetLootRollItemLink(slot)
                    local _, _, count = GetLootRollItemInfo(slot)
                    itemCount = count
                elseif method == "SetQuestItem" then
                    local type, index = ...
                    itemLink = GetQuestItemLink(type, index)
                    local _, _, count = GetQuestItemInfo(type, index)
                    itemCount = count
                elseif method == "SetQuestLogItem" then
                    local type, index = ...
                    itemLink = GetQuestLogItemLink(type, index)
                    if type == "choice" then
                        _, _, itemCount = GetQuestLogChoiceInfo(index)
                    else
                        _, _, itemCount = GetQuestLogRewardInfo(index)
                    end
                elseif method == "SetSendMailItem" then
                    local id = ...
                    itemLink = GetSendMailItemLink(id)
                    local _, _, _, count = GetSendMailItem(id)
                    itemCount = count
                elseif method == "SetInboxItem" then
                    local index, attachIndex = ...
                    if index and attachIndex then
                        itemLink = GetInboxItemLink(index, attachIndex)
                        local _, _, _, count = GetInboxItem(index, attachIndex)
                        itemCount = count
                    end
                elseif method == "SetTradePlayerItem" then
                    local id = ...
                    itemLink = GetTradePlayerItemLink(id)
                    local _, _, count = GetTradePlayerItemInfo(id)
                    itemCount = count
                elseif method == "SetTradeTargetItem" then
                    local id = ...
                    itemLink = GetTradeTargetItemLink(id)
                    local _, _, count = GetTradeTargetItemInfo(id)
                    itemCount = count
                elseif method == "SetAuctionItem" then
                    local viewType, index = ...
                    itemLink = GetAuctionItemLink(viewType, index)
                    local _, _, count = GetAuctionItemInfo(viewType, index)
                    itemCount = count
                elseif method == "SetItemByID" then
                    local itemID = ...
                    itemLink = select(2, GetItemInfo(itemID))
                elseif method == "SetHyperlink" then
                    itemLink = ...
                end
                if itemLink then
                    EasyAuction_AddPriceInfo(self, itemLink, itemCount)
                end
            end)
        end
    end
end

HookTooltipMethods()
