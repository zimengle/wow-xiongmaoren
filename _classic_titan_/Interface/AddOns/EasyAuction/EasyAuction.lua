local addonName, ns = ...
EasyAuctionDB = EasyAuctionDB or {}
EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
EasyAuctionDB.LastSelectedPriceInfo = nil
if EasyAuctionDB.ShowPrice == nil then
    EasyAuctionDB.ShowPrice = true
end
local EasyAuction_TipHooks = {}

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
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
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
    MoneyInputFrame_SetCopper(StartPrice, totalPrice-1)
    MoneyInputFrame_SetCopper(BuyoutPrice, totalPrice-1)
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
local function FormatGoldIcon(copper, size)
    size = size or ICON_SIZE
    copper = copper or 0
    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local copperOnly = copper % 100
    local iconStr = ":"..size..":"..size..":2:0"
    local str = ""
    if gold > 0 then
        str = str .. gold .. "|TInterface\\MoneyFrame\\UI-GoldIcon" .. iconStr .. "|t"
    end
    if silver > 0 or gold > 0 then
        str = str .. silver .. "|TInterface\\MoneyFrame\\UI-SilverIcon" .. iconStr .. "|t"
    end
    str = str .. copperOnly .. "|TInterface\\MoneyFrame\\UI-CopperIcon" .. iconStr .. "|t"
    return str
end

local function FormatTimeAgo(ts)
    if not ts then return "" end
    local diff = time() - ts
    if diff < 60 then
        return string.format("(%d秒前)", diff)
    elseif diff < 3600 then
        return string.format("(%d分钟前)", math.floor(diff/60))
    elseif diff < 86400 then
        return string.format("(%d小时%d分前)", math.floor(diff/3600), math.floor((diff%3600)/60))
    else
        return string.format("(%d天前)", math.floor(diff/86400))
    end
end

local _EA_nextTooltipPriceInfo = {}

local function EasyAuction_OnTooltipItem(tip, link, count)
    if not EasyAuctionDB.ShowPrice then return end
    if not link or not tip or not tip.AddDoubleLine then return end
    count = (count and count > 0) and count or 1
    local showTotal = IsShiftKeyDown()
    local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(link)
    if sellPrice and sellPrice > 0 then
        if showTotal and count > 1 then
            tip:AddDoubleLine(
                "|cffffd100卖店|r",
                FormatGoldIcon(sellPrice * count) .. "（总价）",
                1, 0.82, 0, 1, 1, 1
            )
        else
            tip:AddDoubleLine(
                "|cffffd100卖店|r",
                FormatGoldIcon(sellPrice) .. "（单价）",
                1, 0.82, 0, 1, 1, 1
            )
        end
    end
    local name = GetItemInfo(link)
    local minUnit, minTime
    if EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[name] then
        for _, v in ipairs(EasyAuctionDB.PriceHistory[name]) do
            if v.unit and (not minUnit or v.unit < minUnit) then
                minUnit = v.unit
                minTime = v.t
            end
        end
    end
    if minUnit then
        local ago = minTime and FormatTimeAgo(minTime) or ""
        if showTotal and count > 1 then
            tip:AddDoubleLine(
                ("|cff00c0ff拍卖|r %s"):format(ago),
                FormatGoldIcon(minUnit * count) .. "（总价）",
                0, 1, 1, 1, 1, 1
            )
        else
            tip:AddDoubleLine(
                ("|cff00c0ff拍卖|r %s"):format(ago),
                FormatGoldIcon(minUnit) .. "（单价）",
                0, 1, 1, 1, 1, 1
            )
        end
    end

    tip:Show()
end

function EasyAuction_TipHooks:SetBagItem(bag, slot)
    local info = GetContainerItemInfo(bag, slot)
    local link = GetContainerItemLink(bag, slot)
    local count
    if type(info) == "table" then
        count = info.stackCount or 1
    else
        local _, c = GetContainerItemInfo(bag, slot)
        count = c or 1
    end
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetInventoryItem(unit, slot)
    local link = GetInventoryItemLink(unit, slot)
    local count = GetInventoryItemCount(unit, slot) or 1
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetMerchantItem(index)
    local link = GetMerchantItemLink(index)
    local _, _, _, count = GetMerchantItemInfo(index)
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetAuctionItem(type, index)
    local link = GetAuctionItemLink(type, index)
    local _, _, count = GetAuctionItemInfo(type, index)
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetAuctionSellItem()
    local name, _, count, _, _, _, _, _, _, itemID = GetAuctionSellItemInfo()
    local link = itemID and select(2, GetItemInfo(itemID)) or nil
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetQuestItem(type, idx)
    local link = GetQuestItemLink(type, idx)
    local _, _, _, count = GetQuestItemInfo(type, idx)
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetQuestLogItem(type, idx)
    local link = GetQuestLogItemLink(type, idx)
    local fn = (type == 'choice') and GetQuestLogChoiceInfo or GetQuestLogRewardInfo
    local _, _, _, count = fn(idx)
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetTradePlayerItem(idx)
    local link = GetTradePlayerItemLink(idx)
    local _, _, count = GetTradePlayerItemInfo(idx)
        if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetTradeTargetItem(idx)
    local link = GetTradeTargetItemLink(idx)
    local _, _, count = GetTradeTargetItemInfo(idx)
        if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetHyperlink(link, num)
    link = link or select(2, self:GetItem())
    if link then
        EasyAuction_OnTooltipItem(self, link, num or 1)
    end
end

function EasyAuction_TipHooks:SetInboxItem(index, attachmentIndex)
    local link
    if attachmentIndex then
        link = GetInboxItemLink(index, attachmentIndex)
    else
        link = GetInboxItemLink(index)
    end
    local count
    if attachmentIndex then
        local _, _, _, _, _, _, count2 = GetInboxItem(index, attachmentIndex)
        count = count2 or 1
    else
        local _, _, _, _, _, _, count2 = GetInboxItem(index)
        count = count2 or 1
    end
    if link then
        EasyAuction_OnTooltipItem(self, link, count)
    end
end

function EasyAuction_TipHooks:SetSendMailItem(attachmentIndex)
    local link = GetSendMailItemLink(attachmentIndex)
    local _, _, _, count = GetSendMailItem(attachmentIndex)
    if link then
        EasyAuction_OnTooltipItem(self, link, count or 1)
    end
end

function EasyAuction_TipHooks:SetGuildBankItem(tab, slot)
    local link = GetGuildBankItemLink(tab, slot)
    local _, count = GetGuildBankItemInfo(tab, slot)
    if link then
        EasyAuction_OnTooltipItem(self, link, count or 1)
    end
end

local function EasyAuction_HookTip(tip)
    for k, v in pairs(EasyAuction_TipHooks) do
        if tip[k] then
            hooksecurefunc(tip, k, v)
        end
    end
end

EasyAuction_HookTip(GameTooltip)
if ItemRefTooltip then EasyAuction_HookTip(ItemRefTooltip) end
if ShoppingTooltip1 then EasyAuction_HookTip(ShoppingTooltip1) end
if ShoppingTooltip2 then EasyAuction_HookTip(ShoppingTooltip2) end
if ShoppingTooltip3 then EasyAuction_HookTip(ShoppingTooltip3) end

local itemInfoWaitFrame = CreateFrame("Frame")
itemInfoWaitFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
itemInfoWaitFrame:SetScript("OnEvent", function(_, _, itemID, success)
    if GameTooltip and GameTooltip:IsShown() and GameTooltip.__EA_RefreshWaiting then
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
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    local lastDay
    for k, v in pairs(daily) do
        if v > 0 then
            if not lastDay or k > lastDay then lastDay = k end
        end
    end
    if not lastDay then
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    local y, m, d = lastDay:match("(%d+)-(%d+)-(%d+)")
    local axisRight = time({year=tonumber(y), month=tonumber(m), day=tonumber(d)})

    local days, points = {}, {}
    for i = 29, 0, -1 do
        local t = date("%Y-%m-%d", axisRight - i*86400)
        table.insert(days, t)
        table.insert(points, daily[t] or 0)
    end

    local chartLeft, chartBottom = 60, 130
    local chartWidth, chartHeight = 400, 120

    if not EasyAuction_ChartFrame then
        local f = CreateFrame("Frame", "EasyAuction_ChartFrame", UIParent, "BasicFrameTemplateWithInset")
        f:SetSize(580, 400)
        f:SetPoint("CENTER")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetMovable(true)
        f:EnableMouse(true)
        f:EnableKeyboard(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.title:SetPoint("TOP", 0, -4)
        f.yLabels, f.yLines = {}, {}
        f.xLabels = {}
        f.dots = {}
        f.dotFrames = {}
        f.lines = {}
        tinsert(UISpecialFrames, "EasyAuction_ChartFrame")
    end

    local f = EasyAuction_ChartFrame
    f.title:SetText(itemName .. " 近30天价格走势")
    local sum3, count3 = 0, 0
    for i = 28, 30 do
        if points[i] > 0 then sum3 = sum3 + points[i]; count3 = count3 + 1 end
    end
    local ma3 = (count3 > 0) and math.floor(sum3 / count3 + 0.5) or 0

    local sum7, count7 = 0, 0
    for i = 24, 30 do
        if points[i] > 0 then sum7 = sum7 + points[i]; count7 = count7 + 1 end
    end
    local ma7 = (count7 > 0) and math.floor(sum7 / count7 + 0.5) or 0

    local sum30, count30 = 0, 0
    for i = 1, 30 do
        if points[i] > 0 then sum30 = sum30 + points[i]; count30 = count30 + 1 end
    end
    local ma30 = (count30 > 0) and math.floor(sum30 / count30 + 0.5) or 0

    local hist_max, hist_min, latestVal, latestDay = nil, nil, nil, nil
    if EasyAuctionDB.DailyMinPrice and EasyAuctionDB.DailyMinPrice[itemName] then
        for day, v in pairs(EasyAuctionDB.DailyMinPrice[itemName]) do
            if v and v > 0 then
                if not hist_min or v < hist_min then hist_min = v end
                if not hist_max or v > hist_max then hist_max = v end
                if not latestDay or day > latestDay then latestDay, latestVal = day, v end
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
            f.yLines[i]:SetColorTexture(1,1,1,0.10)
            f.yLines[i]:SetHeight(1)
        end
        f.yLines[i]:SetPoint("LEFT", f, "BOTTOMLEFT", chartLeft, y)
        f.yLines[i]:SetPoint("RIGHT", f, "BOTTOMLEFT", chartLeft+chartWidth, y)
        f.yLines[i]:Show()
    end

    for i = 1, 30 do
        if not f.xLabels[i] then
            f.xLabels[i] = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            f.xLabels[i]:SetWidth(40)
            f.xLabels[i]:SetJustifyH("CENTER")
            local x = chartLeft + (i-1)*chartWidth/29
            f.xLabels[i]:SetPoint("BOTTOM", f, "BOTTOMLEFT", x, chartBottom-18)
        end
        local d = days[i]:gsub("^%d%d%d%d%-", ""):gsub("^0", "")
        if i == 1 or i == 8 or i == 15 or i == 22 or i == 30 then
            f.xLabels[i]:SetText(d)
        else
            f.xLabels[i]:SetText("")
        end
    end

    for i = 1, 29 do
        if not f.lines[i] then
            f.lines[i] = f:CreateTexture()
            f.lines[i]:SetColorTexture(0, 0.7, 1, 1)
            f.lines[i]:SetDrawLayer("ARTWORK", 2)
        end
        local x1 = chartLeft + (i-1)*chartWidth/29
        local y1 = chartBottom + (points[i]/max)*chartHeight
        local x2 = chartLeft + i*chartWidth/29
        local y2 = chartBottom + (points[i+1]/max)*chartHeight

        if points[i]>0 and points[i+1]>0 then
            local dx, dy = x2-x1, y2-y1
            local len = math.sqrt(dx*dx + dy*dy)
            local angle = math.atan2(dy, dx)

            f.lines[i]:ClearAllPoints()
            f.lines[i]:SetPoint("CENTER", f, "BOTTOMLEFT", x1 + dx/2, y1 + dy/2)
            f.lines[i]:SetSize(len, 2)
            f.lines[i]:SetRotation(angle)
            f.lines[i]:Show()
        else
            f.lines[i]:Hide()
        end
    end
    for i = 30, #f.lines do
        if f.lines[i] then f.lines[i]:Hide() end
    end
    local dotSize = 20
    for i = 1, 30 do
        if not f.dotFrames[i] then
            local frame = CreateFrame("Frame", nil, f)
            frame:SetSize(dotSize*1.2, dotSize*1.2)
            frame:SetFrameStrata("FULLSCREEN_DIALOG")
            frame:SetScript("OnEnter", function(self)
                local idx = self.idx
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(date("%m-%d", axisRight-(30-idx)*86400) .. " 价格")
                if points[idx]>0 then
                    GameTooltip:AddLine("最低价："..FormatGoldIcon(points[idx], 18))
                else
                    GameTooltip:AddLine("无数据")
                end
                GameTooltip:Show()
            end)
            frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
            f.dotFrames[i] = frame
        end
        local x = chartLeft + (i-1)*chartWidth/29
        local y = chartBottom + (points[i]/max)*chartHeight
        f.dotFrames[i]:SetPoint("CENTER", f, "BOTTOMLEFT", x, y)
        f.dotFrames[i].idx = i
        if points[i]>0 then
            f.dotFrames[i]:Show()
        else
            f.dotFrames[i]:Hide()
        end

        if not f.dots[i] then
            f.dots[i] = f.dotFrames[i]:CreateTexture()
            f.dots[i]:SetDrawLayer("ARTWORK", 3)
        end
        f.dots[i]:SetPoint("CENTER")
        if points[i]>0 then
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
            local volatility = (maxV - minV)/first
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
            if points[i] > 0 then sum = sum + points[i]; count = count + 1 end
        end
        local ma7 = (count > 0) and (sum / count) or nil

        local ma3 = {}
        for i = 7, 30 do
            local s, c = 0, 0
            for j = i-2, i do
                if j >= 1 and points[j] > 0 then s = s + points[j]; c = c + 1 end
            end
            ma3[i] = (c > 0) and (s / c) or nil
        end
        if ma7 and points[30] then
            if points[30] > ma7 * 1.10 then
                table.insert(advices, "|cff00ff00多头排列，强势上攻，短线有资金推动迹象。|r")
            elseif points[30] < ma7 * 0.90 then
                table.insert(advices, "|cffff2020空头陷阱格局，短线仍需防范下行风险。|r")
            elseif math.abs(points[30] - ma7) < ma7*0.03 then
                table.insert(advices, "|cffffff00均线粘合，行情或将变盘，静待方向选择。|r")
            end
        end
        local up_count, down_count = 0, 0
        for i = 2, 30 do
            if points[i]>0 and points[i-1]>0 then
                if points[i] > points[i-1] then
                    up_count = up_count + 1
                    down_count = 0
                elseif points[i] < points[i-1] then
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
            for i=21,30 do
                if points[i]>0 then
                    if points[i]>last10max then last10max=points[i] end
                    if points[i]<last10min then last10min=points[i] end
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

local function ShowPriceFrame(itemName, data, page)
    if not data or #data == 0 then PriceFrame:Hide() return end

    priceDataCache = data
    priceTotalPages = math.max(1, math.ceil(#data / PRICE_ROWS_PER_PAGE))
    if not page then priceCurrentPage = 1 else priceCurrentPage = page end
    if priceCurrentPage < 1 then priceCurrentPage = 1 end
    if priceCurrentPage > priceTotalPages then priceCurrentPage = priceTotalPages end

    table.sort(data, function(a, b) return a.unit < b.unit end)

    local startIdx = (priceCurrentPage - 1) * PRICE_ROWS_PER_PAGE + 1
    local endIdx = math.min(startIdx + PRICE_ROWS_PER_PAGE - 1, #data)

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
            end)
        else
            for k = 1, 4 do
                if btn.cols[k] then btn.cols[k]:SetText(""); btn.cols[k]:Hide() end
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
        ItemNameFS:SetText("["..(itemName or "").."]")
    end
    local TimeFS = _G["EasyAuctionPriceFrameTime"]
    local timeStr = ""
    if data[1] and data[1].t then
        timeStr = date("%Y-%m-%d %H:%M", data[1].t)
    end
    if TimeFS then
        TimeFS:ClearAllPoints()
        TimeFS:SetPoint("BOTTOMLEFT", PriceFrame, "BOTTOMLEFT", 15, 42)
        TimeFS:SetText("采集时间："..timeStr)
    end

    if not PriceFrame._itemInfoEventRegistered then
        local f = CreateFrame("Frame")
        f:RegisterEvent("GET_ITEM_INFO_RECEIVED")
        f:SetScript("OnEvent", function(_, _, _, success)
            if success and PriceFrame:IsShown() then
                ShowPriceFrame(_G["EasyAuctionPriceFrameItemName"]:GetText():gsub("[%[%]]", ""), priceDataCache, priceCurrentPage)
            end
        end)
        PriceFrame._itemInfoEventRegistered = true
    end
    if data and #data > 0 then
        C_Timer.After(0.05, function()
            local name = GetAuctionSellItemInfo()
            local priceList = EasyAuctionDB.PriceHistory[name]
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
                end
            end
        end)
        AuctionsStackSizeEntry.EasyAuction_PriceAutoFillHooked = true
    end

    local VendorPriceFS = _G["EasyAuctionPriceFrameVendorPrice"]
    local vendorPrice
    if itemName then
        local name2, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemName)
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
            local name = GetAuctionSellItemInfo()
            local minHistory = name and EasyAuctionDB.PriceHistory[name] and EasyAuctionDB.PriceHistory[name].minUnit
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

    PriceFrame:Show()
end
pricePrevBtn:SetScript("OnClick", function()
    if priceCurrentPage > 1 then
        ShowPriceFrame(_G["EasyAuctionPriceFrameItemName"]:GetText():gsub("[%[%]]", ""), priceDataCache, priceCurrentPage - 1)
    end
end)

priceNextBtn:SetScript("OnClick", function()
    if priceCurrentPage < priceTotalPages then
        ShowPriceFrame(_G["EasyAuctionPriceFrameItemName"]:GetText():gsub("[%[%]]", ""), priceDataCache, priceCurrentPage + 1)
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
    if not lastSearchName then return end

    EasyAuctionDB = EasyAuctionDB or {}
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
    
    local n = GetNumAuctionItems("list")
    local list = {}
    local minUnitThisScan

    for i = 1, n do
        local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner = GetAuctionItemInfo("list", i)
        local link = GetAuctionItemLink("list", i)
        if name == lastSearchName and buyout and buyout > 0 then
            local unit = math.floor(buyout / count)
            table.insert(list, {count = count, unit = unit, t = time(), link = link, owner = owner})
            if not minUnitThisScan or unit < minUnitThisScan then
                minUnitThisScan = unit
            end
        end
    end

    local prev = EasyAuctionDB.PriceHistory[lastSearchName]
    local minUnitHistory = prev and prev.minUnit or nil
    if not minUnitHistory then
        if prev and type(prev) == "table" then
            for _, info in ipairs(prev) do
                if info.unit and (not minUnitHistory or info.unit < minUnitHistory) then
                    minUnitHistory = info.unit
                end
            end
        end
    end

    local finalMin = minUnitHistory
    if minUnitThisScan then
        if not minUnitHistory or minUnitThisScan < minUnitHistory then
            finalMin = minUnitThisScan
        end
    end
    if minUnitThisScan then
        local daily = EasyAuctionDB.DailyMinPrice[lastSearchName] or {}
        local today = date("%Y-%m-%d")
        daily[today] = minUnitThisScan
        EasyAuctionDB.DailyMinPrice[lastSearchName] = daily
    end
    EasyAuctionDB.PriceHistory[lastSearchName] = list
    if finalMin then
        EasyAuctionDB.PriceHistory[lastSearchName].minUnit = finalMin
    end

    if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() then
        if type(RefreshDBFrame) == "function" then
            RefreshDBFrame()
        end
    end

    if EasyAuctionPriceFrame and EasyAuctionPriceFrame:IsShown() then
        local nameFS = _G["EasyAuctionPriceFrameItemName"]
        local showName = nameFS and nameFS.GetText and nameFS:GetText()
        showName = showName and showName:gsub("[%[%]]", "") or nil
        if showName == lastSearchName then
            ShowPriceFrame(showName, EasyAuctionDB.PriceHistory[showName])
        end
    end

    if EasyAuction_ChartFrame and EasyAuction_ChartFrame:IsShown() then
        local chartTitleFS = EasyAuction_ChartFrame.title
        if chartTitleFS and chartTitleFS.GetText then
            local title = chartTitleFS:GetText() or ""
            local chartItem = title:match("^(.+) 近%d+天价格走势")
            if chartItem == lastSearchName then
                EasyAuction_ShowChart(chartItem)
            end
        end
    end
end)

local sellEvent = CreateFrame("Frame")
sellEvent:RegisterEvent("NEW_AUCTION_UPDATE")
sellEvent:SetScript("OnEvent", function()
	AuctionsMediumAuctionButton:SetChecked(nil);
	AuctionsLongAuctionButton:SetChecked(nil);
    AuctionsShortAuctionButton:SetChecked(1);
    AuctionFrameAuctions.duration = 1;
    local name = GetAuctionSellItemInfo()
    if name and EasyAuctionDB.PriceHistory[name] then
        ShowPriceFrame(name, EasyAuctionDB.PriceHistory[name])
    else
        PriceFrame:Hide()
    end
end)

local closeEvent = CreateFrame("Frame")
closeEvent:RegisterEvent("AUCTION_HOUSE_CLOSED")
closeEvent:SetScript("OnEvent", function()
    PriceFrame:Hide()
end)

local DBFrame = EasyAuctionDBFrame
if DBFrame.SetBackdrop then
    DBFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
end

local DBFrame_CloseBtn = _G["EasyAuctionDBFrameClose"]
DBFrame_CloseBtn:SetScript("OnClick", function(self)
    self:GetParent():Hide()
end)

local resetBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
resetBtn:SetSize(80, 22)
resetBtn:SetPoint("BOTTOMRIGHT", DBFrame, "BOTTOMRIGHT", -20, 15)
resetBtn:SetText("|TInterface/Icons/INV_Misc_Coin_01:16:16:0:0|t 重置数据")
resetBtn:Hide()

DBFrame:HookScript("OnShow", function()
    resetBtn:Show()
end)
DBFrame:HookScript("OnHide", function()
    resetBtn:Hide()
end)

local headerNames = {
    "序",
    "物品名",
    "历史最低价",
    "最低单价",
    "采集时间",
}
local headerSortKeys = {
    nil, "name", "history", "min", "t"
}
local headerButtons = {}

local headerPositions = {
    {x=18, width=50},   
    {x=60, width=180},  
    {x=240, width=120}, 
    {x=360, width=120}, 
    {x=480, width=130}, 
}

for i=2,#headerNames do
    local btn = CreateFrame("Button", "EasyAuctionDBHeaderBtn"..i, DBFrame)
    btn:SetFrameLevel(DBFrame:GetFrameLevel()+2)
    btn:SetSize(headerPositions[i].width, 22)
    btn:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", headerPositions[i].x, -40)
    btn:SetAlpha(0)
    btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    headerButtons[i] = btn
end

local currentSortKey = "t"      
local currentSortReverse = true

for i=2,#headerButtons do
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

local helpBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
helpBtn:SetSize(80, 22)
helpBtn:SetPoint("RIGHT", DBFrame_CloseBtn, "LEFT", -5, 0)
helpBtn:SetText("使用说明")

local EASYAUCTION_HELP_TEXT = [[
1. 在拍卖行的|cff00ff00“浏览”|r页面，输入你要查的|cffffff00物品名称|r，然后点击|cff00ff00“搜索”|r。

2. 点击|cff00ff00“一口价（每单位）”|r这个表头来排序，确保右边有个|cffffd700向下的箭头|r，这样插件才能采集到|cff00ff00准确的价格数据|r。

3. 切换到|cff00ff00“拍卖”|r页面，把你要卖的|cffffff00物品|r拖进去，插件会自动弹出|cff00ff00历史价格列表|r。你可以直接|cffff8000点击里面的价格|r，插件会帮你自动填写|cff00ff00起拍价|r和|cff00ff00一口价|r（会根据|cffa335ee堆叠数量|r自动算总价）。

4. |cffff2020注意|r：如果你|cffff8000先把物品放进上架栏|r，再去拍卖行搜价格，弹出的价格|cffff2020可能不是最新的|r。遇到这种情况，请|cff00ff00把物品移出来再放一次|r，这样插件就会弹出|cff00ff00最新的价格|r啦。

|cff00ff00小贴士：|r你也可以随时输入 |cffffff00/epah|r 打开价格记录页面！

|cffff0000拍卖有风险，入市需谨慎！|r
]]

helpBtn:SetScript("OnClick", function()
    if not EasyAuction_HelpFrame then
        local f = CreateFrame("Frame", "EasyAuction_HelpFrame", UIParent, "BasicFrameTemplateWithInset")
        f:SetSize(480, 350)
        f:SetPoint("CENTER")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetMovable(true)
        f:EnableMouse(true)
        f:EnableKeyboard(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)

        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.title:SetPoint("TOP", 0, -20)
        local version = GetAddOnMetadata(addonName, "Version") or "?"
        f.title:SetText("|TInterface/Icons/INV_Misc_Coin_01:18:18:0:0|t EasyAuction V" .. version .. " 使用说明")

        f.scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
        f.scroll:SetPoint("TOPLEFT", 16, -50)
        f.scroll:SetPoint("BOTTOMRIGHT", -30, 16)

        f.text = CreateFrame("EditBox", nil, f)
        f.text:SetMultiLine(true)
        f.text:SetFontObject("GameFontHighlight")
        f.text:SetWidth(420)
        f.text:SetAllPoints()
        f.text:SetText(EASYAUCTION_HELP_TEXT)
        f.text:SetAutoFocus(false)
        f.text:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
        f.scroll:SetScrollChild(f.text)
        tinsert(UISpecialFrames, "EasyAuction_HelpFrame")
    else
        EasyAuction_HelpFrame.text:SetText(EASYAUCTION_HELP_TEXT)
    end
    EasyAuction_HelpFrame:Show()
end)

local ROWS_NUM = 12
local currentPage = 1
local totalPages = 1
local dbItemList = {}
local prevBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
prevBtn:SetSize(60, 22)
prevBtn:SetPoint("BOTTOMLEFT", 15, 15)
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
        btn.cols[5] = btn:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
        btn.cols[5]:SetPoint("LEFT", btn.cols[4], "RIGHT", 8, 0)
        btn.cols[5]:SetWidth(130)
        btn.cols[5]:SetJustifyH("LEFT")
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
            row.cols[2]:SetText(icon .. ColorName(item.name, item.link))

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
            row.cols[3]:SetText(minHistory and FormatGoldIcon(minHistory) or "-")
            row.cols[4]:SetText(FormatGoldIcon(item.min))
            row.cols[5]:SetText(item.t and date("%Y-%m-%d %H:%M", item.t) or "")
            row:Show()
            for j = 1, 5 do row.cols[j]:Show() end
        else
            row:Hide()
            for j = 1, 5 do if row.cols[j] then row.cols[j]:Hide() end end
        end
    end
    local headerFS = _G["EasyAuctionDBFrameHeader"]
    if headerFS then
        local text = "序       物品名                                          历史最低价                  最低单价                     采集时间"
        local arrows = {["name"]="", ["history"]="", ["min"]="", ["t"]=""}
        local arrow = currentSortReverse and "▼" or "▲"
        if currentSortKey == "name" then
            arrows["name"] = "|cff00ff00"..arrow.."|r"
        elseif currentSortKey == "history" then
            arrows["history"] = "|cff00ff00"..arrow.."|r"
        elseif currentSortKey == "min" then
            arrows["min"] = "|cff00ff00"..arrow.."|r"
        elseif currentSortKey == "t" then
            arrows["t"] = "|cff00ff00"..arrow.."|r"
        end
        text = string.format("序       物品名%s                                          历史最低价%s                  最低单价%s                     采集时间%s",
            arrows["name"], arrows["history"], arrows["min"], arrows["t"])
        headerFS:SetText(text)
    end
    prevBtn:SetShown(totalPages > 1)
    nextBtn:SetShown(totalPages > 1)
    prevBtn:SetEnabled(currentPage > 1)
    nextBtn:SetEnabled(currentPage < totalPages)
    pageText:SetText(string.format("第%d/%d页", currentPage, totalPages))
end

resetBtn:SetScript("OnClick", function()
    StaticPopupDialogs["EASYAUCTION_RESET_DB"] = {
        text = "确定要清空所有拍卖历史记录吗？此操作不可恢复！",
        button1 = "确定",
        button2 = "取消",
        OnAccept = function()
            for k in pairs(EasyAuctionDB.PriceHistory) do
                if not k or k == "" then
                    EasyAuctionDB.PriceHistory[k] = nil
                end
            end
            if EasyAuctionDB.DailyMinPrice then
                for k in pairs(EasyAuctionDB.DailyMinPrice) do
                    EasyAuctionDB.DailyMinPrice[k] = nil
                end
            end
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
    RefreshDBFrame()
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
            if AuctionsStackSizeEntry.SetEnabled then AuctionsStackSizeEntry:SetEnabled(true)
            elseif AuctionsStackSizeEntry.Enable then AuctionsStackSizeEntry:Enable() end
        end
        if AuctionsNumStacksEntry then
            AuctionsNumStacksEntry:SetNumber(numStacks)
            AuctionsNumStacksEntry:Show()
        end
        if AuctionsStackSizeMaxButton then
            AuctionsStackSizeMaxButton:Show()
            AuctionsStackSizeMaxButton:SetScript("OnClick", function()
                local _, _, _, _, _, _,_,sCount, _, iID = GetAuctionSellItemInfo()
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

local function MyAH_AutoFillPrice()
    local name = GetAuctionSellItemInfo()
    if name and EasyAuctionDB and EasyAuctionDB.PriceHistory[name] and #EasyAuctionDB.PriceHistory[name] > 0 then
        local min = math.huge
        for _, v in ipairs(EasyAuctionDB.PriceHistory[name]) do
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
    local name = GetAuctionSellItemInfo()
    if name and EasyAuctionDB and EasyAuctionDB.PriceHistory[name] then
        ShowPriceFrame(name, EasyAuctionDB.PriceHistory[name])
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

local function CreateEasyAuctionHistoryButton()
    if not AuctionFrame or not AuctionFrame:IsShown() then
        C_Timer.After(0.5, CreateEasyAuctionHistoryButton)
        return
    end

    if _G["EasyAuctionHistoryButton"] then return end

    local btn = CreateFrame("Button", "EasyAuctionHistoryButton", AuctionFrame, "UIPanelButtonTemplate")
    btn:SetSize(80, 24)
    btn:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 15, -15)
    btn:SetText("历史价格")
    btn:SetScript("OnClick", function()
        if EasyAuctionDBFrame then
            EasyAuction_OpenDBFrame()
        end
    end)
    btn:Show()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
    if addon == "Blizzard_AuctionUI" then
        CreateEasyAuctionHistoryButton()
    end
end)

local loadedNoticeFrame = CreateFrame("Frame")
loadedNoticeFrame:RegisterEvent("ADDON_LOADED")
loadedNoticeFrame:SetScript("OnEvent", function(self, event, addon)
    if addon == "EasyAuction" then
        print("|cff00ff00[EasyAuction]|r 拍卖行增强插件已加载，输入 |cff00ff00/epah|r 打开插件。")
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

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
local function EasyAuction_RegisterEvent(event, handler)
    if not EasyAuction_EventFrame then
        EasyAuction_EventFrame = CreateFrame("Frame")
        EasyAuction_EventFrame.handlers = {}
        EasyAuction_EventFrame:SetScript("OnEvent", function(self, event, ...)
            if self.handlers[event] then
                for _, func in ipairs(self.handlers[event]) do
                    func(...)
                end
            end
        end)
    end
    if not EasyAuction_EventFrame.handlers[event] then
        EasyAuction_EventFrame.handlers[event] = {}
        EasyAuction_EventFrame:RegisterEvent(event)
    end
    table.insert(EasyAuction_EventFrame.handlers[event], handler)
end

local function EasyAuction_CreateBuyoutButton()
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
    txt:SetText("|cffff0000一键购买|r")
    txt:EnableMouse(true)
    txt:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("一键购买：\n点击拍卖物品直接无确认购买。", 1, 1, 1, true)
        GameTooltip:AddLine("大于100金会弹出确认窗口。", 1, 0.5, 0.5, true)
        GameTooltip:Show()
    end)
    txt:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    if not EasyAuction_BuyoutHooked then
        hooksecurefunc("BrowseButton_OnClick", function(button)
            if EasyAuctionBuyoutCheckButton and EasyAuctionBuyoutCheckButton:GetChecked() then
                local index = GetSelectedAuctionItem and AuctionFrame and AuctionFrame.type and GetSelectedAuctionItem(AuctionFrame.type)
                local buyout = AuctionFrame and AuctionFrame.buyoutPrice
                if index and buyout and buyout > 0 then
                    if buyout > 1000000 then
                        StaticPopup_Show("BUYOUT_AUCTION")
                    else
                        PlaceAuctionBid(AuctionFrame.type, index, buyout)
                    end
                end
            end
        end)
        EasyAuction_BuyoutHooked = true
    end
end

if type(EASYAUCTION_HELP_TEXT) == "string" then
    EASYAUCTION_HELP_TEXT = EASYAUCTION_HELP_TEXT .. [[

5. |cffff0000一键购买功能：|r
    - 在拍卖行“浏览”页面右上角可勾选|cffff0000“一键购买”|r复选框。
    - 勾选后，点击浏览列表中的物品会直接以一口价买下（请谨慎操作！）。
    - 若物品价格高于|cffffff00100金|r，会弹出确认窗口，否则直接购买。
    - 关闭复选框可恢复为普通点击行为。
]]
end

local function EasyAuction_CreateMinimapButton()
    if _G["EasyAuctionMinimapButton"] then return end

    local button = CreateFrame("Button", "EasyAuctionMinimapButton", Minimap)
    button:SetSize(24, 24)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetMovable(true)
    button:RegisterForDrag("LeftButton")
    button:SetClampedToScreen(true)

    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetTexture("Interface\\AddOns\\EasyAuction\\icon.tga")
    button.icon:SetAllPoints(button)
    if not button.icon:GetTexture() then
        button.icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
    end

    local angle = 45
    local radius = 80
    button:SetPoint("CENTER", Minimap, "CENTER", radius * math.cos(math.rad(angle)), radius * math.sin(math.rad(angle)))
    button:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    button:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    button:SetScript("OnClick", function(self, btn)
        EasyAuction_OpenDBFrame()
    end)
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("EasyAuction 拍卖行历史价格", 1, 1, 1)
        GameTooltip:AddLine("点击打开价格记录", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" and addon == "Blizzard_AuctionUI" then
        InitEasyAuctionUI()
    elseif event == "PLAYER_LOGIN" then
        EasyAuction_CreateMinimapButton()
    end
end)

local isScanningAll = false

local EasyAuctionScanProgressFrame = nil

function EasyAuction_ShowScanProgress()
    if EasyAuctionScanProgressFrame then
        EasyAuctionScanProgressFrame:Show()
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
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    f:SetAlpha(0.97)

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
    f.ProgressBar.Bg:SetColorTexture(0.1,0.1,0.1,0.4)

    f.ProgressBar.Percent = f.ProgressBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.ProgressBar.Percent:SetPoint("CENTER", f.ProgressBar, "CENTER")
    f.ProgressBar.Percent:SetText("0%")

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

    function f:UpdateStatus(msg)
        self.Status:SetText(msg or "")
    end

    function f:UpdateProgress(cur, total)
        cur = cur or 0
        total = total or 1
        self.ProgressBar:SetMinMaxValues(0, total)
        self.ProgressBar:SetValue(cur)
        local percent = (total > 0) and (cur / total * 100) or 100
        self.ProgressBar.Percent:SetText(string.format("%.1f%%", percent))
        self.ProgressBar.Detail:SetText(string.format("%d / %d", cur, total))
    end

    function f:ShowResult(text)
        self.Result:SetText(text or "")
        self.Result:Show()
        self.CloseBtn:Show()
        self.Desc:Hide()
    end

    function f:Reset()
        self.Result:Hide()
        self.CloseBtn:Hide()
        self.Desc:Show()
        self.Status:SetText("正在准备...")
        self.ProgressBar:SetMinMaxValues(0, 1)
        self.ProgressBar:SetValue(0)
        self.ProgressBar.Percent:SetText("0%")
        self.ProgressBar.Detail:SetText("0 / 0")
    end

    tinsert(UISpecialFrames, "EasyAuctionScanProgressFrame")
    EasyAuctionScanProgressFrame = f
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
    if elapsed then
        f.Status:SetText(string.format("已采集：%d / %d  用时：%.1fs", cur, total, elapsed))
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

function EasyAuction_ScanAllAuctionItems()
    if isScanningAll then
        print("|cff00ff00[EasyAuction]|r 正在扫描中，请稍候...")
        return
    end
    isScanningAll = true
    EasyAuction_ShowScanProgress()
    C_Timer.After(300, function()
        if isScanningAll then
            print("|cff00ff00[EasyAuction]|r 警告：全局扫描超时，自动解锁。")
            isScanningAll = false
        end
    end)

    local totalAuctions = 0
    local scanStartTime = GetTime()
    local result = {}
    local totalItems = 0
    local totalKinds = 0
    local newCount, updateCount = 0, 0
    local itemNames = nil
    local pageProcessing = false
    local perFrame = 500
    local perSave  = 50
    local allSaved = false
    local scanEventFrame = CreateFrame("Frame")

    local function clearScanFrame()
        if scanEventFrame then
            scanEventFrame:UnregisterAllEvents()
            scanEventFrame:SetScript("OnEvent", nil)
            scanEventFrame:Hide()
            scanEventFrame = nil
        end
        isScanningAll = false
    end

    local function processCurrentPage(startIndex)
        local n, total = GetNumAuctionItems("list")
        if totalAuctions == 0 and total and total > 0 then
            totalAuctions = total
        end
        local processed = 0
        local t0 = debugprofilestop()
        while startIndex <= n and processed < perFrame and (debugprofilestop() - t0) < 16 do
            local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner = GetAuctionItemInfo("list", startIndex)
            local link = GetAuctionItemLink("list", startIndex)
            if name and name ~= "" and buyout and count and count > 0 and buyout > 0 then
                result[name] = result[name] or {}
                table.insert(result[name], {
                    unit = math.floor(buyout / count),
                    count = count,
                    t = time(),
                    link = link,
                    owner = owner,
                })
                totalItems = totalItems + 1
            end
            processed = processed + 1
            startIndex = startIndex + 1
        end
        EasyAuction_UpdateScanProgress(totalItems, totalAuctions, GetTime() - scanStartTime)
        if startIndex <= n then
            C_Timer.After(0.01, function() processCurrentPage(startIndex) end)
        else
            C_Timer.After(0.05, function()
                if BrowseNextPageButton and BrowseNextPageButton:IsEnabled() then
                    BrowseNextPageButton:Click()
                    pageProcessing = false
                else
                    itemNames = {}
                    for k in pairs(result) do table.insert(itemNames, k) end
                    totalKinds = #itemNames
                    local idx = 1
                    local function saveBatch()
                        local i = 0
                        while idx <= totalKinds and i < perSave do
                            local name = itemNames[idx]
                            if name and name ~= "" then
                                local items = result[name]
                                table.sort(items, function(a, b) return a.unit < b.unit end)
                                local prev = EasyAuctionDB.PriceHistory[name]
                                if not prev then
                                    newCount = newCount + 1
                                else
                                    updateCount = updateCount + 1
                                end
                                EasyAuctionDB.PriceHistory[name] = items
                                EasyAuctionDB.PriceHistory[name].minUnit = items[1].unit
                            end
                            idx = idx + 1
                            i = i + 1
                        end
                        EasyAuction_UpdateScanProgress(idx - 1, totalKinds, GetTime() - scanStartTime)
                        if idx <= totalKinds then
                            C_Timer.After(0.01, saveBatch)
                        else
                            EasyAuction_ShowScanResult(newCount, updateCount, totalKinds, GetTime() - scanStartTime)
                            print(string.format("|cff00ff00[EasyAuction]|r 全服拍卖价格已采集，种类%d，新增%d，更新%d，耗时%.2fs。", totalKinds, newCount, updateCount, GetTime() - scanStartTime))
                            allSaved = true
                            clearScanFrame()
                        end
                    end
                    saveBatch()
                end
            end)
        end
    end

    scanEventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    scanEventFrame:SetScript("OnEvent", function()
        if not pageProcessing and not allSaved then
            pageProcessing = true
            processCurrentPage(1)
        end
    end)

    if BrowsePrevPageButton and BrowsePrevPageButton:IsEnabled() then
        BrowsePrevPageButton:Click()
        C_Timer.After(0.5, function()
            QueryAuctionItems("", nil, nil, 0, nil, nil, true, true, nil)
        end)
    else
        if not (AuctionFrame and AuctionFrame:IsShown()) then
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
end

StaticPopupDialogs["EASYAUCTION_SCANALL_CONFIRM"] = {
    text = "|cffff2020|TInterface\\DialogFrame\\UI-Dialog-Icon-AlertNew:24:24:0:0|t 警告！|r\n\n|cffff0000本操作将自动扫描所有拍卖物品！\n过程中请勿操作鼠标和键盘，否则数据可能异常！\n\n此操作可能耗时较长，请确认你已准备好。|r",
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

local function EasyAuction_CreateScanAllButton()
    if _G["EasyAuctionScanAllButton"] or not AuctionFrameBrowse then return end
    local btn = CreateFrame("Button", "EasyAuctionScanAllButton", AuctionFrameBrowse, "UIPanelButtonTemplate")
    btn:SetSize(80, 24)
    btn:SetPoint("TOPLEFT", AuctionFrameBrowse, "TOPLEFT", 100, -15)
    btn:SetText("全局扫描")
    btn:SetScript("OnClick", function()
        StaticPopup_Show("EASYAUCTION_SCANALL_CONFIRM")
    end)
    btn:Show()
end

EasyAuction_RegisterEvent("AUCTION_HOUSE_SHOW", function()
    C_Timer.After(0.1, EasyAuction_CreateBuyoutButton)
    C_Timer.After(0.1, EasyAuction_CreateScanAllButton)
end)