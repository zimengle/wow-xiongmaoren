--[[
    GF_Auction PricePanel Module
    Displays detailed price history and statistics
]]

local L = GF_Auction_L
local Utils = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Utils")

local PricePanel = {}

local currentItemID = nil
local currentItemLink = nil
local priceContentFrame = nil
local currentItemName = nil
local tab3AutoFillHooked = false
local auctionDurationDefaultHooked = false
local auctionDurationTouched = false
local auctionDurationApplied = false
local auctionDurationSetting = false
local ApplyNativeAuctionDuration12hOnce
local SHOW_COMPARE_SECTION = false
local buyPreviewHooked = false

local MONEY_GOLD = {1.00, 0.82, 0.00}
local MONEY_SILVER = {0.78, 0.78, 0.82}
local MONEY_COPPER = {0.93, 0.64, 0.36}

local MONEY_TOTAL_WIDTH = 170
local MONEY_RIGHT_INSET = -20
local MONEY_RIGHT_INSET_STATS = MONEY_RIGHT_INSET

local DOUBLE_CLICK_WINDOW = 0.5
local DOUBLE_CLICK_MOVE_PX = 12

local tempRows = {}
local tempStackAgg = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("PricePanel", PricePanel)
end

local function EnsureNativeAuctionDurationDefaultHook()
    if auctionDurationDefaultHooked then return end
    auctionDurationDefaultHooked = true

    if _G.hooksecurefunc and _G.AuctionsRadioButton_OnClick then
        _G.hooksecurefunc("AuctionsRadioButton_OnClick", function()
            if auctionDurationSetting then return end
            auctionDurationTouched = true
        end)
    end

    local af = _G.AuctionFrame
    if af and af.HookScript then
        af:HookScript("OnShow", function()
            auctionDurationTouched = false
            auctionDurationApplied = false
            if _G.C_Timer and _G.C_Timer.After then
                _G.C_Timer.After(0, function()
                    local auctionsTab = _G.AuctionFrameAuctions
                    if auctionsTab and auctionsTab.IsShown and auctionsTab:IsShown() then
                        ApplyNativeAuctionDuration12hOnce()
                    end
                end)
            else
                local auctionsTab = _G.AuctionFrameAuctions
                if auctionsTab and auctionsTab.IsShown and auctionsTab:IsShown() then
                    ApplyNativeAuctionDuration12hOnce()
                end
            end
        end)
        af:HookScript("OnHide", function()
            auctionDurationTouched = false
            auctionDurationApplied = false
        end)
    end
end

ApplyNativeAuctionDuration12hOnce = function()
    EnsureNativeAuctionDurationDefaultHook()
    if auctionDurationApplied then return end
    if auctionDurationTouched then return end

    local auctionsTab = _G.AuctionFrameAuctions
    if not auctionsTab then return end
    if auctionsTab.duration == 1 then
        auctionDurationApplied = true
        return
    end

    if not _G.AuctionsRadioButton_OnClick then return end
    auctionDurationSetting = true
    pcall(_G.AuctionsRadioButton_OnClick, 1)
    auctionDurationSetting = false
    auctionDurationApplied = true
end

local function GetSellSlotItemLinkAndID()
    local link = (_G.GetAuctionSellItemLink and _G.GetAuctionSellItemLink()) or nil
    if (not link or link == "") and _G.GetAuctionSellItemInfo then
        local name = select(1, _G.GetAuctionSellItemInfo())
        if name and name ~= "" and _G.GetItemInfo then
            local _, itemLink = _G.GetItemInfo(name)
            link = itemLink
        end
    end
    if (not link or link == "") and currentItemLink then
        link = currentItemLink
    end
    local itemID = 0
    if link and link ~= "" then
        itemID = (Utils and Utils.ParseItemID and Utils:ParseItemID(link)) or tonumber((link:match("item:(%d+)")) or "") or 0
    end
    return link, itemID
end

local function GetTotalItemCountInBags(itemID)
    itemID = tonumber(itemID or 0) or 0
    if itemID <= 0 then return 0 end

    local totalCount = 0
    local maxBag = _G.NUM_BAG_SLOTS or 4
    for bag = 0, maxBag do
        local numSlots = (_G.GetContainerNumSlots and _G.GetContainerNumSlots(bag)) or
                         (_G.C_Container and _G.C_Container.GetContainerNumSlots and _G.C_Container.GetContainerNumSlots(bag)) or 0
        if numSlots and numSlots > 0 then
            for slot = 1, numSlots do
                local slotItemID = nil
                if _G.C_Container and _G.C_Container.GetContainerItemID then
                    slotItemID = _G.C_Container.GetContainerItemID(bag, slot)
                else
                    local link = nil
                    if _G.C_Container and _G.C_Container.GetContainerItemLink then
                        link = _G.C_Container.GetContainerItemLink(bag, slot)
                    elseif _G.GetContainerItemLink then
                        link = _G.GetContainerItemLink(bag, slot)
                    end
                    if link then
                        slotItemID = (Utils and Utils.ParseItemID and Utils:ParseItemID(link)) or tonumber((link:match("item:(%d+)")) or "")
                    end
                end
                if slotItemID == itemID then
                    local slotCount = 1
                    if _G.C_Container and _G.C_Container.GetContainerItemInfo then
                        local info = _G.C_Container.GetContainerItemInfo(bag, slot)
                        if info and info.stackCount then
                            slotCount = tonumber(info.stackCount) or 1
                        end
                    elseif _G.GetContainerItemInfo then
                        local _, c = _G.GetContainerItemInfo(bag, slot)
                        slotCount = tonumber(c) or 1
                    end
                    totalCount = totalCount + slotCount
                end
            end
        end
    end
    return tonumber(totalCount) or 0
end

local function TryPlaceItemFromBag(itemID)
    if not itemID or itemID <= 0 then return false end
    if not (_G.AuctionFrame and _G.AuctionFrame:IsVisible()) then return false end
    
    local maxBag = _G.NUM_BAG_SLOTS or 4
    for bag = 0, maxBag do
        local numSlots = (_G.GetContainerNumSlots and _G.GetContainerNumSlots(bag)) or
                         (_G.C_Container and _G.C_Container.GetContainerNumSlots and _G.C_Container.GetContainerNumSlots(bag)) or 0
        if numSlots and numSlots > 0 then
            for slot = 1, numSlots do
                local link = nil
                if _G.C_Container and _G.C_Container.GetContainerItemLink then
                    link = _G.C_Container.GetContainerItemLink(bag, slot)
                elseif _G.GetContainerItemLink then
                    link = _G.GetContainerItemLink(bag, slot)
                end
                if link then
                    local slotItemID = (Utils and Utils.ParseItemID and Utils:ParseItemID(link)) or tonumber((link:match("item:(%d+)")) or "")
                    if slotItemID == itemID then
                        local pickedUp = false
                        if _G.PickupContainerItem then
                            _G.PickupContainerItem(bag, slot)
                            pickedUp = true
                        elseif _G.C_Container and _G.C_Container.PickupContainerItem then
                            _G.C_Container.PickupContainerItem(bag, slot)
                            pickedUp = true
                        end
                        
                        if pickedUp and _G.CursorHasItem and _G.CursorHasItem() then
                            local placed = false
                            if _G.ClickAuctionSellItemButton then
                                local ok = pcall(_G.ClickAuctionSellItemButton)
                                placed = ok
                            elseif _G.AuctionsItemButton and _G.AuctionsItemButton.Click then
                                local ok = pcall(_G.AuctionsItemButton.Click, _G.AuctionsItemButton)
                                placed = ok
                            end
                            
                            if placed then
                                return true
                            else
                                _G.ClearCursor()
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

local function MakeClickHandler(opts)
    local window = opts.window or DOUBLE_CLICK_WINDOW
    local movePx = opts.movePx or DOUBLE_CLICK_MOVE_PX

    local state = {
        t = 0,
        x = 0,
        y = 0,
        button = nil,
        token = 0,
    }

    local function getCursorXY()
        local x, y = (GetCursorPosition and GetCursorPosition()) or 0, 0
        local scale = (UIParent and UIParent.GetEffectiveScale and UIParent:GetEffectiveScale()) or 1
        return x / scale, y / scale
    end

    return function(self, button)
        if button == "RightButton" then
            if opts.onRight then opts.onRight(self) end
            return
        end

        local now = (GetTime and GetTime()) or 0
        local x, y = getCursorXY()

        local isDouble =
            state.button == button
            and state.t > 0
            and (now - state.t) <= window
            and math.abs(x - state.x) <= movePx
            and math.abs(y - state.y) <= movePx

        state.token = state.token + 1
        local myToken = state.token

        if isDouble then
            state.t = 0
            if opts.onDouble then opts.onDouble(self, button) end
            return
        end

        state.t = now
        state.x, state.y = x, y
        state.button = button

        if C_Timer and C_Timer.After and opts.onSingle then
            C_Timer.After(window, function()
                if not self or (self.IsShown and not self:IsShown()) then return end
                if state.token ~= myToken then return end
                opts.onSingle(self, button)
            end)
        end
    end
end

local function GetGFAuctionMainFrame()
    local MainFrame = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("MainFrame")
    if not MainFrame then return nil end
    if MainFrame.GetFrame then return MainFrame:GetFrame() end
    return MainFrame.frame
end

local function GetCurrentMarketStats(itemID)
    itemID = tonumber(itemID)
    if not itemID or not _G.GetNumAuctionItems or not _G.GetAuctionItemInfo then return nil end

    local numBatch = 0
    local ok = pcall(function()
        local a, _ = _G.GetNumAuctionItems("list")
        numBatch = tonumber(a) or 0
    end)
    if not ok or numBatch <= 0 then return nil end

    wipe(tempRows)
    wipe(tempStackAgg)
    
    local totalQty = 0
    local minUnitFound = nil
    local minStackTotalFound = nil
    local groupStack = nil
    local listingsCount = 0
    
    if _G.GetItemInfo then
        local _, _, _, _, _, _, _, stackCount = _G.GetItemInfo(itemID)
        if stackCount and stackCount > 1 then
            groupStack = stackCount
        end
    end
    
    for i = 1, numBatch do
        local ok2, buyoutPrice, count, rowItemID = pcall(function()
            local _, _, c, _, _, _, _, _, _, bo, _, _, _, _, _, _, id = _G.GetAuctionItemInfo("list", i)
            return bo, c, id
        end)

        if ok2 then
            local rid = tonumber(rowItemID)
            if not rid then
                local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", i)
                if link and Utils and Utils.ParseItemID then rid = Utils:ParseItemID(link) end
            end

            if rid == itemID then
                local bo = tonumber(buyoutPrice) or 0
                local qty = tonumber(count) or 1
                if bo > 0 and qty > 0 then
                    local unit = math.floor(bo / qty)
                    listingsCount = listingsCount + 1
                    
                    if not minUnitFound then
                        minUnitFound = unit
                    end
                    
                    if not minStackTotalFound and groupStack and qty == groupStack then
                        minStackTotalFound = bo
                    end
                    
                    totalQty = totalQty + qty

                    if not minStackTotalFound then
                        local a = tempStackAgg[qty]
                    if not a then
                            tempStackAgg[qty] = { stackSize = qty, count = 1, minTotal = bo, maxTotal = bo }
                    else
                        a.count = (a.count or 0) + 1
                        if bo < a.minTotal then a.minTotal = bo end
                        if bo > a.maxTotal then a.maxTotal = bo end
                    end
                end
            end
        end
    end
    end

    if not minUnitFound then return nil end
    
    local minUnit = minUnitFound
    local minStackTotal = minStackTotalFound
    
    if not minStackTotal then
    local maxStackSize = 0
        for ss, _ in pairs(tempStackAgg) do
            if ss > maxStackSize then maxStackSize = ss end
        end
        
        if not groupStack and maxStackSize > 0 and tempStackAgg[maxStackSize] then
        groupStack = maxStackSize
    end

        if groupStack and tempStackAgg[groupStack] then
            minStackTotal = tempStackAgg[groupStack].minTotal
        end
    end
    
    local maxUnit = minUnit

    return {
        listings = listingsCount,
        totalQty = totalQty,
        minUnit = minUnit,
        maxUnit = maxUnit,
        minStackTotal = minStackTotal,
        maxStackTotal = minStackTotal,
        groupStack = groupStack,
    }
end

local function GetBrowsePageIndex()
    local p = 0
    local p1 = (_G.AuctionFrameBrowse and _G.AuctionFrameBrowse.page ~= nil) and (tonumber(_G.AuctionFrameBrowse.page) or 0) or nil
    local p2 = (_G.BrowseCurrentPage ~= nil) and (tonumber(_G.BrowseCurrentPage) or 0) or nil
    local p3 = (_G.AuctionFrameBrowse and _G.AuctionFrameBrowse.currentPage ~= nil) and (tonumber(_G.AuctionFrameBrowse.currentPage) or 0) or nil

    if p1 and p1 > p then p = p1 end
    if p2 and p2 > p then p = p2 end
    if p3 and p3 > p then p = p3 end

    if p < 0 then p = 0 end
    return p
end

local function CreateMoneyColumns(parent, totalWidth, fontObject)
    local f = CreateFrame("Frame", nil, parent)
    f:SetSize(totalWidth or MONEY_TOTAL_WIDTH, 20)
    local gap = 4
    local wGold, wSilver, wCopper = 70, 42, 42

    local copperFrame = CreateFrame("Frame", nil, f)
    copperFrame:SetSize(wCopper, 20)
    copperFrame:SetPoint("RIGHT", f, "RIGHT", 0, 0)

    local silverFrame = CreateFrame("Frame", nil, f)
    silverFrame:SetSize(wSilver, 20)
    silverFrame:SetPoint("RIGHT", copperFrame, "LEFT", -gap, 0)

    local goldFrame = CreateFrame("Frame", nil, f)
    goldFrame:SetSize(wGold, 20)
    goldFrame:SetPoint("RIGHT", silverFrame, "LEFT", -gap, 0)

    local gold = goldFrame:CreateFontString(nil, "OVERLAY", fontObject or "GameFontNormal")
    local gFont, gHeight, gFlags = gold:GetFont()
    gold:SetFont(gFont, gHeight * 0.95, gFlags)
    gold:SetPoint("RIGHT", goldFrame, "RIGHT", 0, 0)
    gold:SetJustifyH("RIGHT")
    gold:SetTextColor(1, 1, 1)

    local silver = silverFrame:CreateFontString(nil, "OVERLAY", fontObject or "GameFontNormal")
    local sFont, sHeight, sFlags = silver:GetFont()
    silver:SetFont(sFont, sHeight * 0.95, sFlags)
    silver:SetPoint("RIGHT", silverFrame, "RIGHT", 0, 0)
    silver:SetJustifyH("RIGHT")
    silver:SetTextColor(1, 1, 1)

    local copper = copperFrame:CreateFontString(nil, "OVERLAY", fontObject or "GameFontNormal")
    local cFont, cHeight, cFlags = copper:GetFont()
    copper:SetFont(cFont, cHeight * 0.95, cFlags)
    copper:SetPoint("RIGHT", copperFrame, "RIGHT", 0, 0)
    copper:SetJustifyH("RIGHT")
    copper:SetTextColor(1, 1, 1)

    f.goldText = gold
    f.silverText = silver
    f.copperText = copper

    function f:SetMoney(copperValue)
        local v = tonumber(copperValue or 0) or 0
        if v < 0 then v = 0 end
        local g = math.floor(v / 10000)
        local s = math.floor((v % 10000) / 100)
        local c = v % 100
        gold:SetFormattedText("%d|cffffd700" .. L("UI_MONEY_GOLD") .. "|r", g)
        silver:SetFormattedText("%02d|cffc7c7cf " .. L("UI_MONEY_SILVER") .. "|r", s)
        copper:SetFormattedText("%02d|cffeda55f " .. L("UI_MONEY_COPPER") .. "|r", c)
    end
    function f:SetEmpty()
        gold:SetText("-")
        silver:SetText("")
        copper:SetText("")
    end
    return f
end

function PricePanel:Initialize()
    return true
end

function PricePanel:Create(parent)
    if priceContentFrame and priceContentFrame:GetParent() ~= parent then
        priceContentFrame:Hide()
        priceContentFrame:SetParent(nil)
        priceContentFrame = nil
    end

    if priceContentFrame then
        priceContentFrame:Show()
        return priceContentFrame
    end

    priceContentFrame = CreateFrame("Frame", nil, parent)
    priceContentFrame:SetAllPoints(parent)

    self:CreateItemInfoSection(priceContentFrame)
    self:CreateStatisticsSection(priceContentFrame)
    self:CreateHistorySection(priceContentFrame)
    self:CreateCompareSection(priceContentFrame)
    self:CreateBuyInfoSection(priceContentFrame)
    self:CreateAuctionWorkbenchSection(priceContentFrame)
    self:ShowNoData()

    local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyPricePanel then
        Skin:ApplyPricePanel(priceContentFrame)
    end

    self:EnsureTab3AutoFillHook()
    self:EnsureBuyPreviewHook()

    return priceContentFrame
end

function PricePanel:EnsureBuyPreviewHook()
    if buyPreviewHooked then return end
    buyPreviewHooked = true
    if not (_G.hooksecurefunc and _G.AuctionFrameBrowse_Update) then return end

    _G.hooksecurefunc("AuctionFrameBrowse_Update", function()
        if not priceContentFrame or not priceContentFrame.itemFrame then return end
        if not priceContentFrame.buyInfoFrame then return end
        if not priceContentFrame:IsShown() then return end
        if not currentItemID or currentItemID <= 0 then return end
        if PricePanel and PricePanel.UpdateBuyInfoPreview then
            PricePanel:UpdateBuyInfoPreview()
        end
    end)
end

function PricePanel:EnsureTab3AutoFillHook()
    if tab3AutoFillHooked then return end
    local tab3 = _G.AuctionFrameTab3
    if not tab3 or not tab3.HookScript then return end

    tab3AutoFillHooked = true
    tab3:HookScript("OnClick", function()
        ApplyNativeAuctionDuration12hOnce()
        if not priceContentFrame or not priceContentFrame.auctionWorkFrame then return end
        local w = priceContentFrame.auctionWorkFrame
        if w and w.TryAutoPlaceAndFill then
            w:TryAutoPlaceAndFill()
        end
    end)
end

function PricePanel:CreateAuctionWorkbenchSection(parent)
    local work = CreateFrame("Frame", nil, parent)
    work:Hide()
    
    local LOW_PRICE_WARN_MAX_UNDERCUT = 1

    local itemFrame = priceContentFrame and priceContentFrame.itemFrame
    local statsFrame = priceContentFrame and priceContentFrame.statsFrame

    if itemFrame then
        work:SetPoint("TOPLEFT", itemFrame, "BOTTOMLEFT", 0, 12)
        work:SetPoint("TOPRIGHT", itemFrame, "BOTTOMRIGHT", 0, 12)
    else
        work:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, -105)
        work:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -2, -105)
    end

    if statsFrame then
        work:SetPoint("BOTTOMLEFT", statsFrame, "TOPLEFT", 0, 10)
        work:SetPoint("BOTTOMRIGHT", statsFrame, "TOPRIGHT", 0, 10)
    else
        work:SetHeight(110)
    end

    local function SplitCopper(copper)
        local v = tonumber(copper or 0) or 0
        if v < 0 then v = 0 end
        local g = math.floor(v / 10000)
        local s = math.floor((v % 10000) / 100)
        local c = v % 100
        return g, s, c
    end

    local function GetCopperFromBoxes(goldBox, silverBox, copperBox)
        local function n(box)
            if not box or not box.GetText then return 0 end
            local t = box:GetText()
            if not t or t == "" then return 0 end
            return tonumber(t) or 0
        end
        return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
    end

    local function SetMoneyBoxes(goldBox, silverBox, copperBox, copperValue)
        if not (goldBox and silverBox and copperBox) then return end
        work._settingPriceBoxes = true
        local g, s, c = SplitCopper(copperValue)
        if goldBox.SetText then goldBox:SetText(tostring(g)) end
        if silverBox.SetText then silverBox:SetText(string.format("%02d", s)) end
        if copperBox.SetText then copperBox:SetText(string.format("%02d", c)) end
        work._settingPriceBoxes = false
    end

    local unitMode = "stack"
    work.unitMode = unitMode
    work.autoPricing = false
    work._autoPriceToken = 0
    work._settingPriceBoxes = false

    local unitModeBtn = CreateFrame("Button", nil, work, "UIPanelButtonTemplate")
    unitModeBtn:SetSize(150, 22)
    work.unitModeBtn = unitModeBtn

    local function SetUnitMode(mode)
        local oldMode = unitMode
        unitMode = mode == "stack" and "stack" or "unit"
        work.unitMode = unitMode
        
        if oldMode ~= unitMode and work.bidRow and work.buyoutRow then
            local currentBid = GetCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
            local currentBuy = GetCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
            
            if currentBid > 0 or currentBuy > 0 then
                local ss = 1
                if priceContentFrame and priceContentFrame.itemFrame and priceContentFrame.itemFrame.stackSizeInput then
                    ss = tonumber(priceContentFrame.itemFrame.stackSizeInput:GetNumber()) or 1
                end
                if ss <= 0 then ss = 1 end
                
                if oldMode == "stack" and unitMode == "unit" then
                    local perBid = math.floor(currentBid / ss)
                    local perBuy = math.floor(currentBuy / ss)
                    SetMoneyBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, perBid)
                    SetMoneyBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, perBuy)
                elseif oldMode == "unit" and unitMode == "stack" then
                    local totalBid = currentBid * ss
                    local totalBuy = currentBuy * ss
                    SetMoneyBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, totalBid)
                    SetMoneyBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, totalBuy)
                end
            end
        end
        
        if work.unitModeBtn and work.unitModeBtn.SetText then
            work.unitModeBtn:SetText(unitMode == "unit" and L("UI_UNIT_MODE_UNIT") or L("UI_UNIT_MODE_STACK"))
        end
        if work.UpdateNativeFromInputs then
            work:UpdateNativeFromInputs()
        end
        if priceContentFrame and priceContentFrame.itemFrame and priceContentFrame.itemFrame.UpdateNativePrices then
            priceContentFrame.itemFrame.UpdateNativePrices()
        end
    end

    function work:ResetUnitModeDefault()
        SetUnitMode("stack")
    end

    unitModeBtn:SetScript("OnClick", function()
        SetUnitMode(unitMode == "unit" and "stack" or "unit")
    end)
    
    unitModeBtn:SetScript("OnEnter", function()
        if not GameTooltip then return end
        GameTooltip:SetOwner(unitModeBtn, "ANCHOR_RIGHT")
        if unitMode == "unit" then
            GameTooltip:SetText(L("UI_UNIT_MODE_TT_UNIT_1"), 1, 0.82, 0, true)
            GameTooltip:AddLine(L("UI_UNIT_MODE_TT_UNIT_2"), 1, 1, 1, true)
            GameTooltip:AddLine(L("UI_UNIT_MODE_TT_UNIT_3"), 1, 0.2, 0.2, true)
        else
            GameTooltip:SetText(L("UI_UNIT_MODE_TT_STACK_1"), 1, 0.82, 0, true)
            GameTooltip:AddLine(L("UI_UNIT_MODE_TT_STACK_2"), 1, 1, 1, true)
        end
        
        GameTooltip:Show()
    end)
    
    unitModeBtn:SetScript("OnLeave", function()
        if GameTooltip then GameTooltip:Hide() end
    end)
    
    work:ResetUnitModeDefault()

    local function CreateMoneyRow(anchor, labelText)
        local row = CreateFrame("Frame", nil, work)
        row:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -6)
        row:SetPoint("TOPRIGHT", work, "TOPRIGHT", 0, 0)
        row:SetHeight(24)

        local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        label:SetPoint("LEFT", 0, 0)
        label:SetText(labelText .. ":")
        label:SetTextColor(0.8, 0.8, 0.8)
        label:SetJustifyH("LEFT")
        label:SetWordWrap(false)
        row.label = label

        local GOLD_W, SC_W = 72, 28
        local GAP_UNIT, GAP_BOX = 8, 3

        local function mkBox(w)
            local eb = CreateFrame("EditBox", nil, row, "InputBoxTemplate")
            eb:SetSize(w, 22)
            eb:SetAutoFocus(false)
            eb:SetNumeric(true)
            eb:SetMaxLetters(6)
            return eb
        end

        local copperTxt = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        copperTxt:SetPoint("RIGHT", row, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
        copperTxt:SetText(L("UI_MONEY_COPPER"))
        copperTxt:SetTextColor(0.93, 0.64, 0.36)

        local copper = mkBox(SC_W)
        copper:SetPoint("RIGHT", copperTxt, "LEFT", -GAP_BOX, 0)

        local silverTxt = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        silverTxt:SetPoint("RIGHT", copper, "LEFT", -GAP_UNIT, 0)
        silverTxt:SetText(L("UI_MONEY_SILVER"))
        silverTxt:SetTextColor(0.78, 0.78, 0.82)

        local silver = mkBox(SC_W)
        silver:SetPoint("RIGHT", silverTxt, "LEFT", -GAP_BOX, 0)

        local goldTxt = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        goldTxt:SetPoint("RIGHT", silver, "LEFT", -GAP_UNIT, 0)
        goldTxt:SetText(L("UI_MONEY_GOLD"))
        goldTxt:SetTextColor(1.0, 0.82, 0.0)

        local gold = mkBox(GOLD_W)
        gold:SetPoint("RIGHT", goldTxt, "LEFT", -GAP_BOX, 0)

        label:SetPoint("RIGHT", gold, "LEFT", -10, 0)

        row.gold, row.silver, row.copper = gold, silver, copper
        return row
    end

    local bidRow = CreateMoneyRow(work, L("UI_BID_PRICE"))
    bidRow:ClearAllPoints()
    bidRow:SetPoint("TOPLEFT", 0, 2)
    bidRow:SetPoint("TOPRIGHT", work, "TOPRIGHT", 0, 2)
    local buyoutRow = CreateMoneyRow(bidRow, L("UI_BUYOUT_PRICE"))
    buyoutRow:ClearAllPoints()
    buyoutRow:SetPoint("TOPLEFT", bidRow, "BOTTOMLEFT", 0, -2)
    buyoutRow:SetPoint("TOPRIGHT", bidRow, "BOTTOMRIGHT", 0, -2)
    work.bidRow = bidRow
    work.buyoutRow = buyoutRow

    local actionRow = CreateFrame("Frame", nil, work)
    actionRow:SetPoint("TOPLEFT", buyoutRow, "BOTTOMLEFT", 0, -2)
    actionRow:SetPoint("TOPRIGHT", buyoutRow, "BOTTOMRIGHT", 0, -2)
    actionRow:SetHeight(24)
    work.actionRow = actionRow

    unitModeBtn:ClearAllPoints()
    unitModeBtn:SetSize(100, 22)
    unitModeBtn:SetPoint("LEFT", actionRow, "LEFT", 0, 0)

    local ACTION_GAP = 6

    local undercutBtn = CreateFrame("Button", nil, actionRow, "UIPanelButtonTemplate")
    undercutBtn:SetSize(50, 22)
    undercutBtn:SetPoint("LEFT", unitModeBtn, "RIGHT", ACTION_GAP, 0)
    undercutBtn:SetText(L("UI_RECOMMEND"))
    work.undercutBtn = undercutBtn

    local startBtn = CreateFrame("Button", nil, actionRow, "UIPanelButtonTemplate,SecureActionButtonTemplate")
    work.startBtn = startBtn
    startBtn:SetHeight(22)
    startBtn:SetWidth(100)
    startBtn:ClearAllPoints()
    startBtn:SetPoint("LEFT", undercutBtn, "RIGHT", ACTION_GAP, 0)
    startBtn:SetPoint("RIGHT", actionRow, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
    startBtn:SetText(L("UI_START_AUCTION"))
    work.startBtn = startBtn

    work.summary = nil
    work.lastReason = nil

    local function GetStackSize()
        if not priceContentFrame or not priceContentFrame.itemFrame then return 1 end
        local ss = priceContentFrame.itemFrame.stackSizeInput and priceContentFrame.itemFrame.stackSizeInput.GetNumber and priceContentFrame.itemFrame.stackSizeInput:GetNumber() or 1
        if ss <= 0 then ss = 1 end
        return ss
    end
    local function GetNumStacks()
        if not priceContentFrame or not priceContentFrame.itemFrame then return 0 end
        local ns = priceContentFrame.itemFrame.numStacksInput and priceContentFrame.itemFrame.numStacksInput.GetNumber and priceContentFrame.itemFrame.numStacksInput:GetNumber() or 0
        return ns
    end

    local function SetNativeStackInputs(stackSize, numStacks)
        stackSize = tonumber(stackSize) or 1
        numStacks = tonumber(numStacks) or 1
        if stackSize < 1 then stackSize = 1 end
        if numStacks < 1 then numStacks = 1 end

        if _G.AuctionsStackSizeEntry and _G.AuctionsStackSizeEntry.SetNumber then
            _G.AuctionsStackSizeEntry:SetNumber(stackSize)
            local onChange = _G.AuctionsStackSizeEntry:GetScript("OnTextChanged")
            if onChange then pcall(onChange, _G.AuctionsStackSizeEntry, true) end
        end
        if _G.AuctionsNumStacksEntry and _G.AuctionsNumStacksEntry.SetNumber then
            _G.AuctionsNumStacksEntry:SetNumber(numStacks)
            local onChange = _G.AuctionsNumStacksEntry:GetScript("OnTextChanged")
            if onChange then pcall(onChange, _G.AuctionsNumStacksEntry, true) end
        end
    end

    function work:AutoFillStackAndNumStacks()
        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() or false
        if not isAuction then return end

        local _, sellItemID = GetSellSlotItemLinkAndID()
        local itemID = (sellItemID and sellItemID > 0) and sellItemID or (tonumber(currentItemID) or 0)
        if itemID <= 0 then return end

        local itemFrame = priceContentFrame and priceContentFrame.itemFrame
        if not itemFrame then return end
        local ssBox = itemFrame.stackSizeInput
        local nsBox = itemFrame.numStacksInput
        if not (ssBox and ssBox.GetNumber and ssBox.SetNumber and nsBox and nsBox.GetNumber and nsBox.SetNumber) then return end

        local curSS = tonumber(ssBox:GetNumber()) or 0
        local curNS = tonumber(nsBox:GetNumber()) or 0
        -- Don't override user's manual inputs.
        if curSS > 0 and curNS > 0 then return end

        local totalCount = GetTotalItemCountInBags(itemID)
        if totalCount <= 0 then
            if curSS <= 0 then ssBox:SetNumber(1) end
            if curNS <= 0 then nsBox:SetNumber(1) end
            SetNativeStackInputs(ssBox:GetNumber(), nsBox:GetNumber())
            return
        end

        local stackLimit = 1
        if _G.GetItemInfo then
            local _, _, _, _, _, _, _, stackCount = _G.GetItemInfo(itemID)
            stackLimit = tonumber(stackCount) or 1
        end
        if stackLimit < 1 then stackLimit = 1 end

        local defaultSS = math.min(stackLimit, totalCount)
        if defaultSS < 1 then defaultSS = 1 end
        local defaultNS = 1

        if curSS <= 0 then ssBox:SetNumber(defaultSS) end
        if curNS <= 0 then nsBox:SetNumber(defaultNS) end
        SetNativeStackInputs(ssBox:GetNumber(), nsBox:GetNumber())
    end

    function work:TryAutoPlaceAndFill()
        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() or false
        if not isAuction then return end

        local sellSlotName = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
        if (not sellSlotName or sellSlotName == "") and currentItemID and tonumber(currentItemID) and tonumber(currentItemID) > 0 then
            pcall(TryPlaceItemFromBag, tonumber(currentItemID))
        end

        self:AutoFillStackAndNumStacks()
        self:UpdateNativeFromInputs()
    end

    local function FormatMoney(copperValue)
        return (Utils and Utils.FormatMoneyText) and Utils:FormatMoneyText(copperValue, L) or tostring(copperValue or 0)
    end

    function work:GetRawBidCopper()
        return GetCopperFromBoxes(bidRow.gold, bidRow.silver, bidRow.copper)
    end
    function work:GetRawBuyoutCopper()
        return GetCopperFromBoxes(buyoutRow.gold, buyoutRow.silver, buyoutRow.copper)
    end

    function work:GetTotals()
        local ss = GetStackSize()
        local ns = GetNumStacks()
        local rawBid = self:GetRawBidCopper()
        local rawBuy = self:GetRawBuyoutCopper()
        if ss <= 0 then ss = 1 end
        if ns <= 0 then ns = 1 end
        local perStackBid = rawBid
        local perStackBuy = rawBuy
        if self.unitMode == "unit" then
            perStackBid = rawBid * ss
            perStackBuy = rawBuy * ss
        end
        return perStackBid * ns, perStackBuy * ns
    end

    function work:UpdateUnitPriceText()
        local itemFrame = priceContentFrame and priceContentFrame.itemFrame
        local labelFS = itemFrame and itemFrame.unitPriceLabel
        local valueFS = itemFrame and itemFrame.unitPriceValue
        if not labelFS or not valueFS then return end

        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() or false
        if not isAuction or not currentItemID or not currentItemName then
            labelFS:Hide()
            valueFS:Hide()
            return
        end

        local ss = GetStackSize()
        if ss <= 0 then ss = 1 end

        local rawBuy = tonumber(self:GetRawBuyoutCopper() or 0) or 0
        local unitCopper = 0
        if self.unitMode == "unit" then
            unitCopper = rawBuy
        else
            unitCopper = math.floor((rawBuy + ss - 1) / ss)
        end

        labelFS:SetText(L("UI_SELL_UNIT_PRICE_LABEL"))
        if unitCopper and unitCopper > 0 then
            valueFS:SetText(string.format(L("UI_SELL_UNIT_PRICE_VALUE"), FormatMoney(unitCopper)))
        else
            valueFS:SetText("-")
        end
        labelFS:Show()
        valueFS:Show()
    end

    function work:UpdateSummary(reasonText)
        self.lastReason = reasonText
    end

    local function Validate()
        if not currentItemID or not currentItemName then
            return false, L("UI_REASON_SELECT_ITEM")
        end

        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() or false
        if isAuction then
            local sellSlotName = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
            if (not sellSlotName or sellSlotName == "") then
                local totalCount = GetTotalItemCountInBags(tonumber(currentItemID) or 0)
                if not totalCount or totalCount <= 0 then
                    return false, L("UI_REASON_NO_ITEM_IN_BAGS")
                end
            end
        end

        local ss = GetStackSize()
        local ns = GetNumStacks()
        if ss <= 0 or ns <= 0 then
            return false, L("UI_REASON_INVALID_QTY")
        end
        local bidTotal, buyTotal = work:GetTotals()
        if not bidTotal or bidTotal <= 0 then
            return false, L("UI_REASON_BID_EMPTY")
        end
        if buyTotal and buyTotal > 0 and buyTotal < bidTotal then
            return false, L("UI_REASON_BUYOUT_LT_BID")
        end
        return true, nil
    end

    function work:UpdateNativeFromInputs()
        local ok, reason = Validate()
        if self.startBtn then
            self.startBtn:SetEnabled(ok)
        end

        self:UpdateSummary(reason)
        if self.UpdateUnitPriceText then
            self:UpdateUnitPriceText()
        end

        if not ok then
            return
        end

        local rawBid = self:GetRawBidCopper()
        local rawBuy = self:GetRawBuyoutCopper()

        local ss = GetStackSize()
        if ss <= 0 then ss = 1 end
        local nativeBid = rawBid
        local nativeBuy = rawBuy
        if self.unitMode == "unit" then
            nativeBid = rawBid * ss
            nativeBuy = rawBuy * ss
        end
        
        if _G.MoneyInputFrame_SetCopper and _G.StartPrice and _G.BuyoutPrice then
            self.isUpdatingFromPlugin = true
            pcall(_G.MoneyInputFrame_SetCopper, _G.StartPrice, nativeBid)
            pcall(_G.MoneyInputFrame_SetCopper, _G.BuyoutPrice, nativeBuy)
            if C_Timer and C_Timer.After then
                C_Timer.After(0.1, function()
                    self.isUpdatingFromPlugin = false
                end)
            else
                self.isUpdatingFromPlugin = false
            end
        end
    end

    function work:ApplyRecommend()
        if not priceContentFrame then
            self:UpdateNativeFromInputs()
            return
        end

        local fallback = nil
        if (not priceContentFrame.recommendedUnitPrice or priceContentFrame.recommendedUnitPrice <= 0) and currentItemID then
            local Database = GF_Auction:GetModule("Database")
            if Database and Database.GetPriceStats then
                fallback = Database:GetPriceStats(currentItemID)
            end
        end
        local recommendedUnitPrice = (priceContentFrame.recommendedUnitPrice and priceContentFrame.recommendedUnitPrice > 0) and priceContentFrame.recommendedUnitPrice
            or (fallback and tonumber(fallback.minUnit))
            or 0
        local groupStack = priceContentFrame.groupStack or (fallback and tonumber(fallback.groupStack))
        local minStackTotal = priceContentFrame.minStackTotal or (fallback and tonumber(fallback.minStackTotal))
        local hasStackRef = (tonumber(groupStack) or 0) > 0 and (tonumber(minStackTotal) or 0) > 0
        if (recommendedUnitPrice <= 0) and (not hasStackRef) then
            self:UpdateNativeFromInputs()
            return
        end

        local ss = GetStackSize()
        if ss <= 0 then ss = 1 end
        local ns = GetNumStacks()
        if ns <= 0 then ns = 1 end
        local totalQty = ss * ns

        local totalBuyout = 0
        local totalBid = 0

        if self.unitMode == "unit" then
            if recommendedUnitPrice > 0 then
                local perUnit = recommendedUnitPrice - 1
                if perUnit < 1 then perUnit = 1 end
                SetMoneyBoxes(bidRow.gold, bidRow.silver, bidRow.copper, perUnit)
                SetMoneyBoxes(buyoutRow.gold, buyoutRow.silver, buyoutRow.copper, perUnit)
                self._autoLastBid = perUnit
                self._autoLastBuy = perUnit

                totalBuyout = (perUnit * ss) * ns
                totalBid = totalBuyout
            else
                self:UpdateNativeFromInputs()
                return
            end
        else
            local perStackPrice = 0
            if hasStackRef then
                local gs = tonumber(groupStack) or 1
                local mst = tonumber(minStackTotal) or 0
                local scaled = math.floor((mst * ss + gs - 1) / gs)
                perStackPrice = scaled - 1
            elseif recommendedUnitPrice > 0 then
                perStackPrice = recommendedUnitPrice * ss - 1
            else
                self:UpdateNativeFromInputs()
                return
            end
            
            if perStackPrice < 1 then perStackPrice = 1 end
            SetMoneyBoxes(bidRow.gold, bidRow.silver, bidRow.copper, perStackPrice)
            SetMoneyBoxes(buyoutRow.gold, buyoutRow.silver, buyoutRow.copper, perStackPrice)
            self._autoLastBid = perStackPrice
            self._autoLastBuy = perStackPrice
            
            totalBuyout = perStackPrice * ns
            totalBid = totalBuyout
        end

        self.autoPricing = true
        self:UpdateNativeFromInputs()
    end

    local function FindCreateAuctionButton()
        if _G.AuctionsCreateAuctionButton then return _G.AuctionsCreateAuctionButton end
        if _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.CreateAuctionButton then return _G.AuctionFrameAuctions.CreateAuctionButton end
        if _G.StartAuctionButton then return _G.StartAuctionButton end
        return nil
    end
    
    local DoStartAuction = nil

    local lastHookedNativeStartBtn = nil
    local function HookNativeStartAuctionButton()
        local btn = FindCreateAuctionButton()
        if not btn or not btn.HookScript then return end
        if btn == lastHookedNativeStartBtn then return end
        lastHookedNativeStartBtn = btn
        if btn.__GFA_HookedStartPreClick then return end
        btn.__GFA_HookedStartPreClick = true

        pcall(function()
            btn:HookScript("PreClick", function()
                local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() or false
                if not isAuction then return end
                if not (priceContentFrame and priceContentFrame.itemFrame) then return end

                SetNativeStackInputs(GetStackSize(), GetNumStacks())

                if work and work.UpdateNativeFromInputs then
                    work:UpdateNativeFromInputs()
                end
            end)
        end)
    end
    
    local function EnsureLowPricePopup()
        local popupKey = "GFA_LOW_PRICE_CONFIRM"
        if not _G.StaticPopupDialogs then
            return nil
        end
        if not _G.StaticPopupDialogs[popupKey] then
            _G.StaticPopupDialogs[popupKey] = {
                text = "",
                button1 = L("UI_LOW_PRICE_WARN_CONTINUE"),
                button2 = L("UI_LOW_PRICE_WARN_CANCEL"),
                showAlert = true,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                OnAccept = function(self, data)
                    if type(data) == "table" and data and data.onAccept then
                        pcall(data.onAccept)
                    end
                end,
            }
        end
        return popupKey
    end

    local function PositionLowPricePopup(popupKey)
        if not popupKey then return end
        if not _G.StaticPopup_Show then return end

        for i = 1, 4 do
            local f = _G["StaticPopup" .. i]
            if f and f.IsShown and f:IsShown() and f.which == popupKey then
                f:ClearAllPoints()

                local centerAnchor = priceContentFrame and priceContentFrame.GetParent and priceContentFrame:GetParent() or priceContentFrame
                local yOff = 63
                if centerAnchor and centerAnchor.IsShown and centerAnchor:IsShown() then
                    f:SetPoint("CENTER", centerAnchor, "CENTER", 0, yOff)
                elseif _G.AuctionFrame and _G.AuctionFrame.IsShown and _G.AuctionFrame:IsShown() then
                    f:SetPoint("CENTER", _G.AuctionFrame, "CENTER", 0, yOff)
                else
                    f:SetPoint("CENTER", _G.UIParent, "CENTER", 0, yOff)
                end

                if f.SetClampedToScreen then
                    f:SetClampedToScreen(true)
                end
                if f.SetFrameStrata then
                    f:SetFrameStrata("HIGH")
                end

                if not f.__GFA_Draggable then
                    f.__GFA_Draggable = true
                    pcall(function()
                        if f.SetMovable then f:SetMovable(true) end
                        if f.EnableMouse then f:EnableMouse(true) end
                        if f.RegisterForDrag then f:RegisterForDrag("LeftButton") end
                    end)
                    f:HookScript("OnDragStart", function(self)
                        if self.StartMoving then pcall(self.StartMoving, self) end
                    end)
                    f:HookScript("OnDragStop", function(self)
                        if self.StopMovingOrSizing then pcall(self.StopMovingOrSizing, self) end
                    end)
                end
                break
            end
        end
    end

    local function ShowLowPricePopup(popupKey, text, acceptKey, reclickMsgKey)
        if not (popupKey and _G.StaticPopup_Show) then
            return false
        end
        _G.StaticPopupDialogs[popupKey].text = text
        _G.StaticPopupDialogs[popupKey].button1 = L("UI_LOW_PRICE_WARN_CONTINUE")
        _G.StaticPopupDialogs[popupKey].button2 = L("UI_LOW_PRICE_WARN_CANCEL")
        _G.StaticPopupDialogs[popupKey].showAlert = true

        _G.StaticPopup_Show(popupKey, L("UI_LOW_PRICE_WARN_TITLE"), nil, {
            onAccept = function()
                if acceptKey and acceptKey ~= "" then
                    work._lowPriceAcceptedKey = acceptKey
                end
                if GF_Auction and GF_Auction.Print then
                    GF_Auction.Print(L(reclickMsgKey or "UI_LOW_PRICE_WARN_RECLICK"), 1, 0.82, 0)
                end
            end,
        })
        PositionLowPricePopup(popupKey)
        return true
    end
    
    local function FormatCoin(copper)
        if type(FormatMoney) == "function" then
            return FormatMoney(copper)
        end
        local v = tonumber(copper or 0) or 0
        if v < 0 then v = 0 end
        local g = math.floor(v / 10000)
        local s = math.floor((v % 10000) / 100)
        local c = v % 100
        return string.format("%dg %02ds %02dc", g, s, c)
    end
    
    local function ComputeReferenceBuyoutPerStack(stackSize)
        stackSize = tonumber(stackSize) or 1
        if stackSize <= 0 then stackSize = 1 end
        
        local refUnit = priceContentFrame and tonumber(priceContentFrame.recommendedUnitPrice) or 0
        local groupStack = priceContentFrame and tonumber(priceContentFrame.groupStack) or nil
        local minStackTotal = priceContentFrame and tonumber(priceContentFrame.minStackTotal) or 0

        if (not refUnit or refUnit <= 0) or (not groupStack and (not minStackTotal or minStackTotal <= 0)) then
            local itemID = tonumber(currentItemID) or 0
            if itemID > 0 then
                local Database = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Database")
                if Database and Database.GetPriceStats then
                    local hist = Database:GetPriceStats(itemID)
                    if hist then
                        if (not refUnit or refUnit <= 0) then
                            refUnit = tonumber(hist.minUnit) or refUnit or 0
                        end
                        if not groupStack then
                            groupStack = tonumber(hist.groupStack) or groupStack
                        end
                        if (not minStackTotal or minStackTotal <= 0) then
                            minStackTotal = tonumber(hist.minStackTotal) or minStackTotal or 0
                        end
                    end
                end
            end
        end
        
        if groupStack and minStackTotal and minStackTotal > 0 and stackSize == groupStack then
            return minStackTotal
        end
        if refUnit and refUnit > 0 then
            return refUnit * stackSize
        end
        return 0
    end

    local function GetEnteredBuyoutPerStack(stackSize)
        stackSize = tonumber(stackSize) or 1
        if stackSize <= 0 then stackSize = 1 end
        local rawBuy = work.GetRawBuyoutCopper and work:GetRawBuyoutCopper() or 0
        rawBuy = tonumber(rawBuy) or 0
        if rawBuy <= 0 then return 0 end
        if work.unitMode == "unit" then
            return rawBuy * stackSize
        end
        return rawBuy
    end
    
    local function ShouldWarnLowPrice(itemID, enteredBuyoutPerStack, stackSize)
        itemID = tonumber(itemID) or 0
        enteredBuyoutPerStack = tonumber(enteredBuyoutPerStack) or 0
        stackSize = tonumber(stackSize) or 1
        if itemID <= 0 or enteredBuyoutPerStack <= 0 then return false end
        
        local ref = ComputeReferenceBuyoutPerStack(stackSize)
        if not ref or ref <= 0 then return false end
        
        local diff = ref - enteredBuyoutPerStack
        local undercutTooMuch = diff > (tonumber(LOW_PRICE_WARN_MAX_UNDERCUT) or 0)
        if not undercutTooMuch then
            return false
        end
        
        local key = tostring(itemID) .. ":" .. tostring(enteredBuyoutPerStack) .. ":" .. tostring(stackSize)
        -- Only skip warning if user has explicitly confirmed listing for this exact key.
        if work._lowPriceAcceptedKey == key then
            return false
        end

        return true, ref, diff, key
    end
    
    local function UpdateSecurePostProxy(enable)
        if not startBtn or not startBtn.SetAttribute then return end
        if not enable then
            startBtn:SetAttribute("type", nil)
            startBtn:SetAttribute("clickbutton", nil)
            return
        end
        local btn = FindCreateAuctionButton()
        if btn then
            startBtn:SetAttribute("type", "click")
            startBtn:SetAttribute("clickbutton", btn)
        else
            startBtn:SetAttribute("type", nil)
            startBtn:SetAttribute("clickbutton", nil)
        end
    end
    UpdateSecurePostProxy(true)

    startBtn:SetScript("PreClick", function()
        UpdateSecurePostProxy(false)

        local sellSlotName = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
        if (not sellSlotName or sellSlotName == "") and currentItemID and currentItemID > 0 then
            local totalCount = GetTotalItemCountInBags(currentItemID)
            if totalCount > 0 then
                if TryPlaceItemFromBag(currentItemID) then
                    local placedName = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
                    if not placedName or placedName == "" then
                        return
                    end
                end
            end
        end
        
        SetNativeStackInputs(GetStackSize(), GetNumStacks())
        
        local ok, reason = Validate()
        if not ok then
            work:UpdateSummary(reason)
            return
        end
        
        local ss = GetStackSize()
        local enteredPerStack = GetEnteredBuyoutPerStack(ss)

        local refForWarn = ComputeReferenceBuyoutPerStack(ss)
        if enteredPerStack > 0 and (not refForWarn or refForWarn <= 0) then
            local acceptKey = "noref:" .. tostring(currentItemID or 0) .. ":" .. tostring(enteredPerStack) .. ":" .. tostring(ss)
            if work._lowPriceAcceptedKey ~= acceptKey then
                local popupKey = EnsureLowPricePopup()
                if popupKey and _G.StaticPopup_Show then
                    local enteredText = FormatCoin(enteredPerStack)
                    local text = string.format(L("UI_NO_REF_PRICE_WARN_TEXT"), enteredText)
                    if ShowLowPricePopup(popupKey, text, acceptKey, "UI_NO_REF_PRICE_WARN_RECLICK") then return end
                end
            end
        end

        local needWarn, ref, diff, warnKey = ShouldWarnLowPrice(currentItemID, enteredPerStack, ss)
        if needWarn then
            local popupKey = EnsureLowPricePopup()
            if popupKey and _G.StaticPopup_Show then
                local enteredText = FormatCoin(enteredPerStack)
                local refText = FormatCoin(ref)
                local diffText = FormatCoin(math.max(0, tonumber(diff) or 0))
                local text = string.format(L("UI_LOW_PRICE_WARN_TEXT"), enteredText, refText, diffText)
                if ShowLowPricePopup(popupKey, text, warnKey, "UI_LOW_PRICE_WARN_RECLICK") then return end
            end
        end
        work:UpdateNativeFromInputs()
        UpdateSecurePostProxy(true)
    end)

    startBtn:SetScript("OnEnter", function()
        if not GameTooltip then return end
        GameTooltip:SetOwner(startBtn, "ANCHOR_RIGHT")
        
        if work and work.lastReason and work.lastReason ~= "" then
            GameTooltip:SetText(work.lastReason, 1, 0.5, 0.5, true)
        else
            GameTooltip:SetText(L("UI_START_AUCTION"), 1, 0.82, 0, true)
        end
        
        if work then
            local rawBid = work.GetRawBidCopper and work:GetRawBidCopper() or 0
            local rawBuy = work.GetRawBuyoutCopper and work:GetRawBuyoutCopper() or 0
            
            if rawBid > 0 then
                GameTooltip:AddLine(" ")
                local bidText = FormatMoney(rawBid)
                GameTooltip:AddLine(L("UI_BID_PRICE") .. ": " .. bidText, 1, 0.82, 0, true)
                
                if rawBuy > 0 then
                    local buyText = FormatMoney(rawBuy)
                    GameTooltip:AddLine(L("UI_BUYOUT_PRICE") .. ": " .. buyText, 1, 0.82, 0, true)
                end
                
                if work.GetTotals then
                    local ok, bidTotal, buyTotal = pcall(function()
                        return work:GetTotals()
                    end)
                    if ok and bidTotal and bidTotal > 0 then
                        local profitTotal = (buyTotal and buyTotal > 0) and buyTotal or bidTotal
                        local profitText = FormatMoney(profitTotal)
                        GameTooltip:AddLine(L("UI_EXPECTED_PROFIT") .. ": " .. profitText, 1, 0.82, 0, true)
                    end
                end
            end
        end
        
        GameTooltip:Show()
    end)
    startBtn:SetScript("OnLeave", function()
        if GameTooltip then GameTooltip:Hide() end
    end)

    local function hookBox(box)
        if not box then return end
        box:SetScript("OnTextChanged", function()
            if work and work._settingPriceBoxes then return end
            if work then
                work.autoPricing = false
            end
            work:UpdateNativeFromInputs()
        end)
    end
    hookBox(bidRow.gold); hookBox(bidRow.silver); hookBox(bidRow.copper)
    hookBox(buyoutRow.gold); hookBox(buyoutRow.silver); hookBox(buyoutRow.copper)
    
    local function SyncFromNativePrices()
        if not work or not work.bidRow or not work.buyoutRow then return end
        if not _G.StartPrice or not _G.BuyoutPrice then return end
        if work.isUpdatingFromPlugin then return end
        
        local bidCopper = 0
        local buyoutCopper = 0
        
        if _G.MoneyInputFrame_GetCopper then
            bidCopper = _G.MoneyInputFrame_GetCopper(_G.StartPrice) or 0
            buyoutCopper = _G.MoneyInputFrame_GetCopper(_G.BuyoutPrice) or 0
        else
            if _G.StartPriceGold and _G.StartPriceGold.GetNumber then
                local g = tonumber(_G.StartPriceGold:GetNumber()) or 0
                local s = tonumber(_G.StartPriceSilver and _G.StartPriceSilver:GetNumber() or 0) or 0
                local c = tonumber(_G.StartPriceCopper and _G.StartPriceCopper:GetNumber() or 0) or 0
                bidCopper = (g * 10000) + (s * 100) + c
            end
            if _G.BuyoutPriceGold and _G.BuyoutPriceGold.GetNumber then
                local g = tonumber(_G.BuyoutPriceGold:GetNumber()) or 0
                local s = tonumber(_G.BuyoutPriceSilver and _G.BuyoutPriceSilver:GetNumber() or 0) or 0
                local c = tonumber(_G.BuyoutPriceCopper and _G.BuyoutPriceCopper:GetNumber() or 0) or 0
                buyoutCopper = (g * 10000) + (s * 100) + c
            end
        end
        
        if bidCopper <= 0 and buyoutCopper <= 0 then
            return
        end
        
        if bidCopper > 0 and bidCopper < 1000 and buyoutCopper > 0 and buyoutCopper < 1000 then
            return
        end
        
        if work.unitMode == "unit" then
            local function ReadCopperFromBoxes(goldBox, silverBox, copperBox)
                local function n(box)
                    if not box or not box.GetText then return 0 end
                    local t = box:GetText()
                    if not t or t == "" then return 0 end
                    return tonumber(t) or 0
                end
                return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
            end
            
            local currentBid = ReadCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
            local currentBuy = ReadCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
            
            if currentBid > 0 or currentBuy > 0 then
                return
            end
            
            local stackSize = 0
            if _G.AuctionsStackSizeEntry then
                stackSize = tonumber(_G.AuctionsStackSizeEntry:GetNumber()) or 0
            end
            if stackSize <= 0 and priceContentFrame and priceContentFrame.itemFrame then
                stackSize = tonumber(priceContentFrame.itemFrame.stackSizeInput:GetNumber()) or 0
            end
            if stackSize <= 0 and _G.GetAuctionSellItemInfo then
                local name, texture, count = _G.GetAuctionSellItemInfo()
                if count and count > 0 then
                    stackSize = tonumber(count) or 1
                end
            end
            if stackSize <= 0 then stackSize = 1 end
            
            local numStacks = 0
            if _G.AuctionsNumStacksEntry then
                numStacks = tonumber(_G.AuctionsNumStacksEntry:GetNumber()) or 0
            end
            if numStacks <= 0 and priceContentFrame and priceContentFrame.itemFrame then
                numStacks = tonumber(priceContentFrame.itemFrame.numStacksInput:GetNumber()) or 0
            end
            if numStacks <= 0 then numStacks = 1 end
            
            local perStackBid = math.floor(bidCopper / numStacks)
            local perStackBuy = math.floor(buyoutCopper / numStacks)
            
            if perStackBid > 0 and perStackBid < 100 and perStackBuy > 0 and perStackBuy < 100 then
                return
            end

            local perUnitBid = math.floor((perStackBid + stackSize - 1) / stackSize)
            local perUnitBuy = math.floor((perStackBuy + stackSize - 1) / stackSize)
            SetMoneyBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, perUnitBid)
            SetMoneyBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, perUnitBuy)
        else
            local function ReadCopperFromBoxes(goldBox, silverBox, copperBox)
                local function n(box)
                    if not box or not box.GetText then return 0 end
                    local t = box:GetText()
                    if not t or t == "" then return 0 end
                    return tonumber(t) or 0
                end
                return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
            end
            
            local currentBid = ReadCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
            local currentBuy = ReadCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
            
            if currentBid > 0 or currentBuy > 0 then
                return
            end
            
            local numStacks = 0
            if _G.AuctionsNumStacksEntry then
                numStacks = tonumber(_G.AuctionsNumStacksEntry:GetNumber()) or 0
            end
            if numStacks <= 0 and priceContentFrame and priceContentFrame.itemFrame then
                numStacks = tonumber(priceContentFrame.itemFrame.numStacksInput:GetNumber()) or 0
            end
            if numStacks <= 0 then numStacks = 1 end
            
            local perStackBid = math.floor(bidCopper / numStacks)
            local perStackBuy = math.floor(buyoutCopper / numStacks)
            
            SetMoneyBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, perStackBid)
            SetMoneyBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, perStackBuy)
        end
    end
    
    local nativePriceInputsHooked = false
    work.isUpdatingFromPlugin = false
    
    local function HookNativePriceInputs()
        if nativePriceInputsHooked then return end
        if not _G.StartPrice or not _G.BuyoutPrice then return end
        
        if _G.StartPriceGold then
            _G.StartPriceGold:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        if _G.StartPriceSilver then
            _G.StartPriceSilver:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        if _G.StartPriceCopper then
            _G.StartPriceCopper:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        
        if _G.BuyoutPriceGold then
            _G.BuyoutPriceGold:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        if _G.BuyoutPriceSilver then
            _G.BuyoutPriceSilver:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        if _G.BuyoutPriceCopper then
            _G.BuyoutPriceCopper:HookScript("OnTextChanged", function()
                if not work.isUpdatingFromPlugin then
                    SyncFromNativePrices()
                end
            end)
        end
        
        nativePriceInputsHooked = true
    end
    
    HookNativePriceInputs()
    
    if undercutBtn then
        undercutBtn:SetScript("OnClick", function()
            work:ApplyRecommend()
        end)
        undercutBtn:SetScript("OnEnter", function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("UI_RECOMMEND"), 1, 1, 1)
                GameTooltip:AddLine(L("UI_RECOMMEND_TOOLTIP"), nil, nil, nil, true)
                GameTooltip:Show()
            end
        end)
        undercutBtn:SetScript("OnLeave", function(self)
            if GameTooltip then GameTooltip:Hide() end
        end)
    end

    work:SetScript("OnShow", function()
        HookNativePriceInputs()
        HookNativeStartAuctionButton()
        if work.ResetUnitModeDefault then
            work:ResetUnitModeDefault()
        end
        local function GetCopperFromBoxes(goldBox, silverBox, copperBox)
            local function n(box)
                if not box or not box.GetText then return 0 end
                local t = box:GetText()
                if not t or t == "" then return 0 end
                return tonumber(t) or 0
            end
            return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
        end
        
        local currentBid = GetCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
        local currentBuy = GetCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
        
        if currentBid <= 0 and currentBuy <= 0 then
            SyncFromNativePrices()
        end

        if work.AutoFillStackAndNumStacks then
            work:AutoFillStackAndNumStacks()
        end

        work:UpdateNativeFromInputs()
    end)

    HookNativeStartAuctionButton()

    priceContentFrame.auctionWorkFrame = work
end

function PricePanel:CreateCompareSection(parent)
    local compareFrame = CreateFrame("Frame", nil, parent)
    local itemFrame = priceContentFrame and priceContentFrame.itemFrame
    local statsFrame = priceContentFrame and priceContentFrame.statsFrame

    if itemFrame then
        compareFrame:SetPoint("TOPLEFT", itemFrame, "BOTTOMLEFT", 0, -45)
        compareFrame:SetPoint("TOPRIGHT", itemFrame, "BOTTOMRIGHT", 0, -45)
    else
        compareFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, -135)
        compareFrame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -2, -135)
    end

    if statsFrame then
        compareFrame:SetPoint("BOTTOMLEFT", statsFrame, "TOPLEFT", 0, 10)
        compareFrame:SetPoint("BOTTOMRIGHT", statsFrame, "TOPRIGHT", 0, 10)
    else
        compareFrame:SetHeight(60)
    end

    local title = compareFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText(L("UI_COMPARE"))
    title:SetTextColor(1, 0.5, 0.25)
    compareFrame.title = title

    local function CreateCompareRow(anchor, labelKey)
        local row = CreateFrame("Frame", nil, compareFrame)
        row:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -5)
        row:SetPoint("TOPRIGHT", compareFrame, "TOPRIGHT", 0, 0)
        row:SetHeight(20)

        local value = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        local vFont, vHeight, vFlags = value:GetFont()
        value:SetFont(vFont, vHeight * 0.95, vFlags)
        value:SetPoint("RIGHT", row, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
        value:SetJustifyH("RIGHT")
        value:SetText("-")
        value:SetTextColor(0.8, 0.8, 0.8)

        local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        local lFont, lHeight, lFlags = label:GetFont()
        label:SetFont(lFont, lHeight * 0.95, lFlags)
        label:SetPoint("LEFT", 0, 0)
        label:SetPoint("RIGHT", value, "LEFT", -8, 0)
        label:SetJustifyH("LEFT")
        label:SetWordWrap(false)
        label:SetText(L(labelKey) .. ":")
        label:SetTextColor(0.8, 0.8, 0.8)

        return row, value
    end

    local rowUnit, valUnit = CreateCompareRow(title, "UI_COMPARE_UNIT")
    local rowStack, valStack = CreateCompareRow(rowUnit, "UI_COMPARE_STACK")

    rowUnit:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -5)

    compareFrame.valUnit = valUnit
    compareFrame.valStack = valStack
    compareFrame.lastRow = rowStack

    priceContentFrame.compareFrame = compareFrame
    compareFrame:Hide()
end

function PricePanel:CreateBuyInfoSection(parent)
    local buyInfoFrame = CreateFrame("Frame", nil, parent)
    local itemFrame = priceContentFrame and priceContentFrame.itemFrame
    local statsFrame = priceContentFrame and priceContentFrame.statsFrame

    if itemFrame then
        buyInfoFrame:SetPoint("TOPLEFT", itemFrame, "BOTTOMLEFT", 0, -35)
        buyInfoFrame:SetPoint("TOPRIGHT", itemFrame, "BOTTOMRIGHT", 0, -35)
    else
        buyInfoFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, -125)
        buyInfoFrame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -2, -125)
    end

    if statsFrame then
        buyInfoFrame:SetPoint("BOTTOMLEFT", statsFrame, "TOPLEFT", 0, 10)
        buyInfoFrame:SetPoint("BOTTOMRIGHT", statsFrame, "TOPRIGHT", 0, 10)
    else
        buyInfoFrame:SetHeight(60)
    end

    local line1 = buyInfoFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line1:SetPoint("TOPLEFT", 0, 0)
    line1:SetPoint("TOPRIGHT", buyInfoFrame, "TOPRIGHT", MONEY_RIGHT_INSET_STATS, 0)
    line1:SetJustifyH("LEFT")
    line1:SetText("-")

    local line2 = buyInfoFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line2:SetPoint("TOPLEFT", line1, "BOTTOMLEFT", 0, -6)
    line2:SetPoint("TOPRIGHT", line1, "BOTTOMRIGHT", 0, -6)
    line2:SetJustifyH("LEFT")
    line2:SetText("-")

    local line3 = buyInfoFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    line3:SetPoint("TOPLEFT", line2, "BOTTOMLEFT", 0, -6)
    line3:SetPoint("TOPRIGHT", line2, "BOTTOMRIGHT", 0, -6)
    line3:SetJustifyH("LEFT")
    line3:SetText("-")

    buyInfoFrame.linePay = line1
    buyInfoFrame.lineSessionQty = line2
    buyInfoFrame.lineSessionSpent = line3

    buyInfoFrame:Hide()
    priceContentFrame.buyInfoFrame = buyInfoFrame
end

function PricePanel:UpdateCompare(currentStats, lastStats)
    if not priceContentFrame or not priceContentFrame.compareFrame then return end
    local cf = priceContentFrame.compareFrame

    local function fmtDelta(cur, old)
        cur = tonumber(cur)
        old = tonumber(old)
        if not cur or not old or old <= 0 then
            return nil
        end
        local delta = cur - old
        local abs = math.abs(delta)
        local pct = (old > 0) and (delta / old * 100) or 0

        local money = (Utils and Utils.FormatMoneyText) and Utils:FormatMoneyText(abs, L) or tostring(abs)
        local sign = delta >= 0 and "+" or "-"
        local color = delta >= 0 and "|cffff4040" or "|cff40ff40"
        local pctText = string.format("%.1f%%", math.abs(pct))
        local pctColor = delta >= 0 and "|cff40ff40" or "|cffff4040"
        return string.format("%s%s%s|r  %s(%s%s)|r", color, sign, money, pctColor, sign, pctText)
    end

    local curUnit = currentStats and currentStats.minUnit
    local oldUnit = lastStats and lastStats.minUnit
    local curStack = currentStats and currentStats.minStackTotal
    local oldStack = lastStats and lastStats.minStackTotal

    local unitText = fmtDelta(curUnit, oldUnit)
    local stackText = fmtDelta(curStack, oldStack)

    if cf.valUnit then cf.valUnit:SetText(unitText or "-") end
    if cf.valStack then cf.valStack:SetText(stackText or "-") end
end

function PricePanel:UpdateBuyInfoPreview()
    if not priceContentFrame or not priceContentFrame.itemFrame then return end
    local itemFrame = priceContentFrame.itemFrame
    local qtyText = itemFrame.boughtText
    local buyInfo = priceContentFrame.buyInfoFrame
    if not qtyText or not buyInfo then return end

    local qty = nil
    local pay = nil

    local selectedIndex = _G.GetSelectedAuctionItem and _G.GetSelectedAuctionItem("list")
    if selectedIndex and selectedIndex > 0 and currentItemID then
        local okSel, _, _, count, _, _, _, _, _, _, buyoutPrice, _, _, _, _, _, _, rowItemID = pcall(function()
            return _G.GetAuctionItemInfo("list", selectedIndex)
        end)
        if okSel then
            local rid = tonumber(rowItemID)
            if not rid then
                local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", selectedIndex)
                if link and Utils and Utils.ParseItemID then rid = Utils:ParseItemID(link) end
            end
            if rid == currentItemID then
                qty = tonumber(count) or 0
                pay = tonumber(buyoutPrice) or 0
            end
        end
    end

    if (not qty or qty <= 0) and currentItemID and currentItemID > 0 then
        local Buyer = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Buyer")
        if Buyer and Buyer.GetAvailableAuctions then
            local followStack = Buyer.GetFollowPreferredStackSize and Buyer:GetFollowPreferredStackSize(currentItemID) or nil
            local auctions = nil
            if followStack and Buyer.GetAvailableAuctionsFollowStack then
                auctions = Buyer:GetAvailableAuctionsFollowStack(currentItemID, followStack)
            end
            if (not auctions) or #auctions == 0 then
                auctions = Buyer:GetAvailableAuctions(currentItemID)
            end
            if auctions and #auctions > 0 then
                qty = tonumber(auctions[1].quantity) or 0
                pay = tonumber(auctions[1].buyoutPrice) or 0
            end
        end
    end

    local unitCount = (L and L("UI_UNIT_COUNT")) or ""
    if qty and qty > 0 then
        qtyText:SetText(string.format("%s %d%s", L("UI_BUYINFO_WILL_BUY"), qty, unitCount))
    else
        qtyText:SetText(string.format("%s -", L("UI_BUYINFO_WILL_BUY")))
    end
    qtyText:Show()

    if buyInfo.linePay then
        if pay and pay > 0 then
            local money = (_G.GetCoinTextureString and _G.GetCoinTextureString(pay)) or tostring(pay)
            buyInfo.linePay:SetText(string.format("%s %s", L("UI_BUYINFO_WILL_PAY"), money))
        elseif qty and qty > 0 then
            buyInfo.linePay:SetText(string.format("%s %s", L("UI_BUYINFO_WILL_PAY"), L("UI_BUYINFO_NO_BUYOUT")))
        else
            buyInfo.linePay:SetText(string.format("%s -", L("UI_BUYINFO_WILL_PAY")))
        end
    end
end

function PricePanel:UpdateBuyInfoSession()
    if not priceContentFrame or not priceContentFrame.itemFrame then return end
    local itemFrame = priceContentFrame.itemFrame
    local buyInfo = priceContentFrame.buyInfoFrame
    if not buyInfo then return end

    local totalQty = tonumber(itemFrame._buySumQty) or 0
    local totalSpent = tonumber(itemFrame._buySumSpent) or 0
    local unitCount = (L and L("UI_UNIT_COUNT")) or ""
    if buyInfo.lineSessionQty then
        buyInfo.lineSessionQty:SetText(string.format("%s %d%s", L("UI_BUYINFO_SESSION_QTY"), totalQty, unitCount))
    end
    if buyInfo.lineSessionSpent then
        local money = (_G.GetCoinTextureString and _G.GetCoinTextureString(totalSpent)) or tostring(totalSpent)
        buyInfo.lineSessionSpent:SetText(string.format("%s %s", L("UI_BUYINFO_SESSION_SPENT"), money))
    end
end

function PricePanel:CreateItemInfoSection(parent)
    local itemFrame = CreateFrame("Frame", nil, parent)
    itemFrame:SetPoint("TOPLEFT", 5, 15)
    itemFrame:SetPoint("TOPRIGHT", -2, 15)
    itemFrame:SetHeight(90)

    local icon = itemFrame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(48, 48)
    icon:SetPoint("LEFT", 1, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    itemFrame.icon = icon

    local boughtText = itemFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    boughtText:ClearAllPoints()
    boughtText:SetPoint("TOPLEFT", icon, "BOTTOMLEFT", -1, -12)
    boughtText:SetPoint("RIGHT", itemFrame, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
    boughtText:SetTextColor(1, 1, 1)
    boughtText:SetJustifyH("LEFT")
    boughtText:SetText(string.format("%s -", L("UI_BUYINFO_WILL_BUY")))
    boughtText:Show()
    itemFrame.boughtText = boughtText
    itemFrame._boughtToken = 0
    itemFrame._boughtCount = 0
    itemFrame._boughtMode = nil
    itemFrame._buySumToken = 0
    itemFrame._buySumBuys = 0
    itemFrame._buySumQty = 0
    itemFrame._buySumSpent = 0
    itemFrame._buySumAllFull = true
    itemFrame._buySumMaxStack = 0
    itemFrame._buySumItemID = 0

    function itemFrame:ShowBoughtToast(mode, amount)
        if not self.boughtText then return end
        if mode ~= "stack" and mode ~= "count" then return end
        amount = tonumber(amount) or 0
        if amount <= 0 then return end

        if self._boughtMode ~= mode then
            self._boughtMode = mode
            self._boughtCount = 0
        end
        self._boughtCount = (tonumber(self._boughtCount) or 0) + amount

        local key = (mode == "stack") and "UI_BUY_TOAST_STACK" or "UI_BUY_TOAST_COUNT"
        self.boughtText:SetText(string.format(L(key), self._boughtCount))
        self.boughtText:Show()
    end

    function itemFrame:ResetBuySummary(itemID)
        self._buySumToken = (self._buySumToken or 0) + 1
        self._buySumBuys = 0
        self._buySumQty = 0
        self._buySumSpent = 0
        self._buySumAllFull = true
        self._buySumMaxStack = 0
        self._buySumItemID = tonumber(itemID) or 0
    end

    function itemFrame:AccumulateBuySummary(itemID, qty, spentCopper, isFullStack, maxStack)
        itemID = tonumber(itemID) or 0
        qty = tonumber(qty) or 0
        spentCopper = tonumber(spentCopper) or 0
        maxStack = tonumber(maxStack) or 0

        if itemID <= 0 or qty <= 0 or spentCopper <= 0 then return end

        if (tonumber(self._buySumItemID) or 0) ~= itemID then
            self:ResetBuySummary(itemID)
        end

        self._buySumBuys = (tonumber(self._buySumBuys) or 0) + 1
        self._buySumQty = (tonumber(self._buySumQty) or 0) + qty
        self._buySumSpent = (tonumber(self._buySumSpent) or 0) + spentCopper

        if not isFullStack then
            self._buySumAllFull = false
        end
        if self._buySumAllFull then
            if maxStack > 0 then
                if (tonumber(self._buySumMaxStack) or 0) == 0 then
                    self._buySumMaxStack = maxStack
                elseif self._buySumMaxStack ~= maxStack then
                    self._buySumAllFull = false
                end
            else
                self._buySumAllFull = false
            end
        end

        self._buySumToken = (tonumber(self._buySumToken) or 0) + 1
        local myToken = self._buySumToken
        if _G.C_Timer and _G.C_Timer.After then
            _G.C_Timer.After(3.0, function()
                if not priceContentFrame or not priceContentFrame.itemFrame or priceContentFrame.itemFrame ~= self then return end
                if (tonumber(self._buySumToken) or 0) ~= myToken then return end
                if (tonumber(self._buySumItemID) or 0) ~= itemID then return end

                local buys = tonumber(self._buySumBuys) or 0
                local totalQty = tonumber(self._buySumQty) or 0
                local totalSpent = tonumber(self._buySumSpent) or 0
                if buys <= 0 or totalQty <= 0 or totalSpent <= 0 then return end

                local money = (_G.GetCoinTextureString and _G.GetCoinTextureString(totalSpent)) or tostring(totalSpent)
                local itemName = nil
                if currentItemLink and _G.GetItemInfo then
                    itemName = _G.GetItemInfo(currentItemLink)
                end
                if not itemName or itemName == "" then
                    itemName = tostring(currentItemName or "")
                end

                if self._buySumAllFull and (tonumber(self._buySumMaxStack) or 0) > 0 and (totalQty % self._buySumMaxStack == 0) then
                    local stacks = math.floor(totalQty / self._buySumMaxStack)
                    GF_Auction.Print(string.format(L("UI_BUY_SUMMARY_QTY_STACK"), itemName, stacks), 1, 0.82, 0)
                else
                    GF_Auction.Print(string.format(L("UI_BUY_SUMMARY_QTY_COUNT"), itemName, totalQty), 1, 0.82, 0)
                end
                GF_Auction.Print(string.format(L("UI_BUY_SUMMARY_SPENT"), money), 1, 0.82, 0)

                self:ResetBuySummary(itemID)
            end)
        end
    end

    local sellSearchPanel = nil
    local function EnsureSellSearchPanel()
        if sellSearchPanel then return sellSearchPanel end

        local auctionsTab = _G.AuctionFrameAuctions
        local scroll = _G.AuctionsScrollFrame or (auctionsTab and auctionsTab.AuctionsScrollFrame) or (auctionsTab and auctionsTab.ScrollFrame)
        local header = _G.AuctionsQualitySort or _G.AuctionsDurationSort or scroll
        local scrollBar = _G.AuctionsScrollFrameScrollBar or (scroll and scroll.ScrollBar) or nil

        local anchorTL = header or scroll or auctionsTab
        local anchorBR = scrollBar or scroll or auctionsTab

        if not (auctionsTab and anchorTL and anchorBR) then
            return nil
        end

        local f = CreateFrame("Frame", "GF_Auction_SellSearchPanel", auctionsTab)
        f:EnableMouse(false)
        if header and anchorTL == header and header ~= scroll then
            f:SetPoint("TOPLEFT", anchorTL, "BOTTOMLEFT", -2, -96)
        else
            f:SetPoint("TOPLEFT", anchorTL, "TOPLEFT", -2, 0)
        end
        f:SetPoint("BOTTOMRIGHT", anchorBR, "BOTTOMRIGHT", 3, -13)

        local bg = f:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0, 0, 0, 0.85)
        f.bg = bg

        local lvl = ((scroll and scroll.GetFrameLevel) and scroll:GetFrameLevel())
            or ((anchorTL and anchorTL.GetFrameLevel) and anchorTL:GetFrameLevel())
            or 1
        if f.SetFrameLevel then f:SetFrameLevel(math.max(0, lvl + 1)) end

        f:Hide()
        sellSearchPanel = f
        if priceContentFrame then
            priceContentFrame.sellSearchPanel = f
        end
        return f
    end

    local iconBtn = CreateFrame("Button", nil, itemFrame)
    iconBtn:SetSize(48, 48)
    iconBtn:SetPoint("CENTER", icon, "CENTER", 0, 0)
    iconBtn:SetFrameLevel(itemFrame:GetFrameLevel() + 10)
    iconBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    iconBtn:RegisterForDrag("LeftButton")

    local function UpdateFromSellSlot()
        if not priceContentFrame or not priceContentFrame.itemFrame then return end

        local name = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
        if not name or name == "" then
            return
        end

        local link = (_G.GetAuctionSellItemLink and _G.GetAuctionSellItemLink()) or nil
        if (not link or link == "") and _G.GetItemInfo then
            local _, itemLink = _G.GetItemInfo(name)
            link = itemLink
        end
        if not link or link == "" then
            return
        end
        if link == currentItemLink then
            return
        end

        local itemID = (Utils and Utils.ParseItemID) and Utils:ParseItemID(link) or tonumber((link and link:match("item:(%d+)")) or "")
        if itemID and PricePanel and PricePanel.UpdateItem then
            PricePanel:UpdateItem(itemID, link)
        end
    end

    local function TryPlaceCursorItem()
        if not (_G.CursorHasItem and _G.CursorHasItem()) then
            return
        end
        local cursorItemID, cursorItemLink = nil, nil
        if _G.GetCursorInfo then
            local cType, cID, cLink = _G.GetCursorInfo()
            if cType == "item" then
                cursorItemID = tonumber(cID)
                cursorItemLink = cLink
            end
        end
        if _G.ClickAuctionSellItemButton then
            pcall(_G.ClickAuctionSellItemButton)
            if _G.C_Timer and _G.C_Timer.After then
                _G.C_Timer.After(0, function()
                    if cursorItemID and cursorItemLink and PricePanel and PricePanel.UpdateItem then
                        PricePanel:UpdateItem(cursorItemID, cursorItemLink)
                    else
                        UpdateFromSellSlot()
                    end
                    if PricePanel and PricePanel.UpdateControlsVisibility then
                        PricePanel:UpdateControlsVisibility()
                    end
                end)
            else
                if cursorItemID and cursorItemLink and PricePanel and PricePanel.UpdateItem then
                    PricePanel:UpdateItem(cursorItemID, cursorItemLink)
                else
                    UpdateFromSellSlot()
                end
                if PricePanel and PricePanel.UpdateControlsVisibility then
                    PricePanel:UpdateControlsVisibility()
                end
            end
            return
        end
        if _G.AuctionsItemButton and _G.AuctionsItemButton.Click then
            pcall(_G.AuctionsItemButton.Click, _G.AuctionsItemButton)
            if _G.C_Timer and _G.C_Timer.After then
                _G.C_Timer.After(0, function()
                    if cursorItemID and cursorItemLink and PricePanel and PricePanel.UpdateItem then
                        PricePanel:UpdateItem(cursorItemID, cursorItemLink)
                    else
                        UpdateFromSellSlot()
                    end
                    if PricePanel and PricePanel.UpdateControlsVisibility then
                        PricePanel:UpdateControlsVisibility()
                    end
                end)
            else
                if cursorItemID and cursorItemLink and PricePanel and PricePanel.UpdateItem then
                    PricePanel:UpdateItem(cursorItemID, cursorItemLink)
                else
                    UpdateFromSellSlot()
                end
                if PricePanel and PricePanel.UpdateControlsVisibility then
                    PricePanel:UpdateControlsVisibility()
                end
            end
        end
    end

    iconBtn:SetScript("OnReceiveDrag", function()
        TryPlaceCursorItem()
    end)
    iconBtn:SetScript("OnMouseUp", function(_, button)
        if button == "LeftButton" then
            TryPlaceCursorItem()
        end
    end)
    iconBtn:SetScript("OnEnter", function(self)
        if not currentItemLink then return end
        if not GameTooltip then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink(currentItemLink)
        GameTooltip:Show()
    end)
    iconBtn:SetScript("OnLeave", function()
        if GameTooltip then GameTooltip:Hide() end
    end)
    itemFrame.iconBtn = iconBtn
    
    local iconBorder = itemFrame:CreateTexture(nil, "BACKGROUND")
    iconBorder:SetSize(50, 50)
    iconBorder:SetPoint("CENTER", icon, "CENTER", 0, 0)
    iconBorder:SetColorTexture(0, 0, 0, 0)
    itemFrame.iconBorder = iconBorder

    local favBtn = CreateFrame("Button", nil, itemFrame)
    favBtn:SetSize(15, 15)
    favBtn:SetFrameLevel(itemFrame:GetFrameLevel() + 20)
    favBtn:EnableMouse(true)
    favBtn:RegisterForClicks("LeftButtonUp")
    if favBtn.SetHitRectInsets then
        favBtn:SetHitRectInsets(-4, -4, -4, -4)
    end
    
    local favShadow = favBtn:CreateTexture(nil, "BACKGROUND")
    favShadow:SetSize(18, 18)
    favShadow:SetPoint("CENTER", 0, 0)
    favShadow:SetTexture("Interface\\AddOns\\GF_Auction\\Media\\fav.tga")
    favShadow:SetVertexColor(0, 0, 0, 1)
    favBtn.shadow = favShadow
    
    local favTex = favBtn:CreateTexture(nil, "OVERLAY")
    favTex:SetAllPoints()
    favTex:SetTexture("Interface\\AddOns\\GF_Auction\\Media\\fav.tga")
    favTex:SetVertexColor(1, 1, 1, 1)
    favBtn.tex = favTex
    
    favBtn:SetScript("OnEnter", function(self)
        if not currentItemID then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        local Database = GF_Auction:GetModule("Database")
        if not Database then return end
        local favs = Database:GetFavorites()
        local isFav = favs and favs[currentItemID]
        GameTooltip:SetText(isFav and L("UI_FAV_REMOVE") or L("UI_FAV_ADD"))
        GameTooltip:Show()
    end)
    
    favBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    favBtn:SetScript("OnClick", function(self)
        local Database = GF_Auction:GetModule("Database")
        if not Database then return end

        local itemID = currentItemID
        local itemLink = currentItemLink
        if (not itemID or not itemLink) and _G.GetAuctionSellItemLink then
            local sellLink = GetSellSlotItemLinkAndID and select(1, GetSellSlotItemLinkAndID()) or _G.GetAuctionSellItemLink()
            local sellID = GetSellSlotItemLinkAndID and select(2, GetSellSlotItemLinkAndID()) or nil
            itemID = itemID or sellID
            itemLink = itemLink or sellLink
        end

        if itemID and (not itemLink or itemLink == "") then
            local _, link2 = _G.GetItemInfo(itemID)
            itemLink = link2 or ("item:" .. tostring(itemID))
        end

        if not itemID then return end

        local favs = Database:GetFavorites()
        local isFav = favs and favs[itemID]

        if isFav then
            Database:RemoveFavorite(itemID)
            favTex:SetVertexColor(1, 1, 1, 1)
        else
            Database:AddFavorite(itemID, itemLink)
            favTex:SetVertexColor(1, 0.82, 0, 1)
        end

        if GameTooltip and GameTooltip:GetOwner() == self then
            local onEnter = self:GetScript("OnEnter")
            if onEnter then onEnter(self) end
        end

        local FavoritePanel = GF_Auction:GetModule("FavoritePanel")
        if FavoritePanel then
            if FavoritePanel.RequestUpdateList then
                FavoritePanel:RequestUpdateList()
            elseif FavoritePanel.UpdateList then
                FavoritePanel:UpdateList()
            end
        end
    end)
    favBtn:Hide()
    itemFrame.favBtn = favBtn

    local listBtn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
    listBtn:SetHeight(24)
    listBtn:SetText(L("UI_LIST"))
    listBtn:Hide()
    
    listBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L("UI_LIST"), 1, 1, 1)
        GameTooltip:AddLine(L("UI_LIST_TOOLTIP"), nil, nil, nil, true)
        GameTooltip:Show()
    end)
    listBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    listBtn:SetScript("OnClick", function()
        local ItemSelector = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("ItemSelector")
        if ItemSelector and ItemSelector.PinSelection then ItemSelector:PinSelection(2.0) end
        if ItemSelector and ItemSelector.CacheBrowsePricing then ItemSelector:CacheBrowsePricing(currentItemID, 5.0) end
        local tab = _G.AuctionFrameTab3
        if tab and _G.AuctionFrameTab_OnClick then pcall(_G.AuctionFrameTab_OnClick, tab)
        elseif tab and tab.Click then pcall(tab.Click, tab) end
        if ItemSelector and ItemSelector.TryAutoPlaceSelectedItem then ItemSelector:TryAutoPlaceSelectedItem(currentItemID) end

        if PricePanel and PricePanel.EnsureTab3AutoFillHook then
            PricePanel:EnsureTab3AutoFillHook()
        end
        if priceContentFrame and priceContentFrame.auctionWorkFrame and priceContentFrame.auctionWorkFrame.TryAutoPlaceAndFill then
            priceContentFrame.auctionWorkFrame:TryAutoPlaceAndFill()
        end
        
        if PricePanel.UpdateControlsVisibility then
            C_Timer.After(0.1, function() PricePanel:UpdateControlsVisibility() end)
        end

        if _G.C_Timer and _G.C_Timer.After then
            _G.C_Timer.After(0.2, function()
                if priceContentFrame and priceContentFrame.auctionWorkFrame and priceContentFrame.auctionWorkFrame.ApplyRecommend then
                    priceContentFrame.auctionWorkFrame:ApplyRecommend()
                end
            end)
        end
    end)
    itemFrame.listBtn = listBtn

    local buyBtn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
    buyBtn:SetHeight(24)
    buyBtn:SetText(L("UI_BUY"))
    buyBtn:Hide()
    
    local maxWidth = 60
    listBtn:SetWidth(maxWidth)
    buyBtn:SetWidth(maxWidth)

    buyBtn:SetPoint("RIGHT", itemFrame, "RIGHT", MONEY_RIGHT_INSET_STATS, -14)
    listBtn:SetPoint("RIGHT", buyBtn, "LEFT", -6, 0)

    buyBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L("UI_BUY"), 1, 1, 1)
        
        local showSelected = false
        local selectedIndex = _G.GetSelectedAuctionItem and _G.GetSelectedAuctionItem("list")
        
        if selectedIndex and selectedIndex > 0 and currentItemID then
             local okSel, _, _, count, _, _, _, _, _, _, buyoutPrice, _, _, _, _, _, _, rowItemID = pcall(function()
                 return _G.GetAuctionItemInfo("list", selectedIndex)
            end)
            
            if okSel then
                local rid = tonumber(rowItemID)
                 if not rid then
                     local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", selectedIndex)
                    if link and Utils and Utils.ParseItemID then rid = Utils:ParseItemID(link) end
                 end
                 
                 if rid == currentItemID then
                     local bo = tonumber(buyoutPrice) or 0
                     local qty = tonumber(count) or 1
                     
                     GameTooltip:AddLine(L("UI_BUY_TT_SELECTED_1"), 1, 0.82, 0, true)
                     local payLabel = L("UI_BUY_TT_SELECTED_PAY")
                     local payMoney = GetCoinTextureString(bo)
                     GameTooltip:AddLine("|cff00ff00" .. payLabel .. "|r |cffffffff" .. payMoney .. "|r", 1, 1, 1, true)
                     showSelected = true
                 end
            end
        end
        
        if not showSelected then
            GameTooltip:AddLine(L("UI_BUY_TT_DEFAULT_1"), 0.7, 0.7, 0.7, true)
            GameTooltip:AddLine(L("UI_BUY_TT_DEFAULT_2"), 1, 0.82, 0, true)
        end
        GameTooltip:Show()
    end)
    
    buyBtn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    buyBtn:SetScript("OnClick", function(self, button)
        if not currentItemID or not currentItemLink then return end
        
        local Buyer = GF_Auction:GetModule("Buyer")
        if Buyer then
             if not Buyer.__GFA_PurchaseListenerRegistered and Buyer.RegisterPurchaseListener then
                 Buyer.__GFA_PurchaseListenerRegistered = true
                 Buyer:RegisterPurchaseListener(function(result)
                     if not result or result.success ~= true then
                         return
                     end

                     if priceContentFrame and priceContentFrame.itemFrame and priceContentFrame.itemFrame.AccumulateBuySummary then
                         priceContentFrame.itemFrame:AccumulateBuySummary(tonumber(result.itemID) or 0, tonumber(result.qty) or 0, tonumber(result.spentCopper) or 0, result.isFullStack == true, tonumber(result.maxStack) or 0)
                     end

                     if PricePanel and PricePanel.UpdateBuyInfoSession then
                         PricePanel:UpdateBuyInfoSession()
                     end
                 end)
             end

             Buyer:BuyItem(currentItemID, currentItemLink)
             if PricePanel and PricePanel.UpdateBuyInfoPreview then
                 PricePanel:UpdateBuyInfoPreview()
             end
        end
    end)
    itemFrame.buyBtn = buyBtn

    local inventoryBtn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
    inventoryBtn:SetHeight(24)
    inventoryBtn:SetText(L("UI_INVENTORY"))
    inventoryBtn:SetWidth(maxWidth)
    inventoryBtn:SetPoint("TOP", listBtn, "BOTTOM", 0, -4)
    inventoryBtn:SetScript("OnClick", function()
        local InventoryPanel = GF_Auction:GetModule("InventoryPanel")
        if InventoryPanel then
            InventoryPanel:Toggle()
        end
    end)
    inventoryBtn:SetScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L("UI_INVENTORY"), 1, 1, 1)
            GameTooltip:AddLine(L("UI_INVENTORY_TOOLTIP"), nil, nil, nil, true)
            GameTooltip:Show()
        end
    end)
    inventoryBtn:SetScript("OnLeave", function(self)
        if GameTooltip then GameTooltip:Hide() end
    end)
    itemFrame.inventoryBtn = inventoryBtn

    local browseBtn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
    browseBtn:SetHeight(24)
    browseBtn:SetText("GFA")
    browseBtn:SetWidth(maxWidth)
    browseBtn:SetPoint("TOP", inventoryBtn, "BOTTOM", 0, -4)
    browseBtn:SetScript("OnClick", function()
        if _G.AuctionFrameTab1 and _G.AuctionFrameTab1.Click then
            _G.AuctionFrameTab1:Click()
        elseif _G.AuctionFrameTab_OnClick and _G.AuctionFrameTab1 then
            _G.AuctionFrameTab_OnClick(_G.AuctionFrameTab1)
        end
        
        local MainFrame = GF_Auction:GetModule("MainFrame")
        if MainFrame and MainFrame.ShowPanel then
            MainFrame:ShowPanel("PricePanel")
        end
    end)
    browseBtn:SetScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("GFA", 1, 1, 1)
            GameTooltip:AddLine(L("UI_BACK_TO_PRICE_TOOLTIP"), nil, nil, nil, true)
            GameTooltip:Show()
        end
    end)
    browseBtn:SetScript("OnLeave", function(self)
        if GameTooltip then GameTooltip:Hide() end
    end)
    itemFrame.browseBtn = browseBtn
    browseBtn:Hide()

    local switchBtn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
    switchBtn:SetHeight(24)
    switchBtn:SetText(L("UI_SHOW_FAVORITES"))
    switchBtn:SetWidth(maxWidth)
    switchBtn:SetPoint("TOP", buyBtn, "BOTTOM", 0, -4)
    switchBtn:SetScript("OnClick", function()
        local MainFrame = GF_Auction:GetModule("MainFrame")
        if MainFrame then
            MainFrame:ShowPanel("FavoritePanel")
        end
    end)
    switchBtn:SetScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L("UI_SHOW_FAVORITES"), 1, 1, 1)
            GameTooltip:AddLine(L("UI_SHOW_FAVORITES_TOOLTIP"), nil, nil, nil, true)
            GameTooltip:Show()
        end
    end)
    switchBtn:SetScript("OnLeave", function(self)
        if GameTooltip then GameTooltip:Hide() end
    end)
    itemFrame.switchBtn = switchBtn

    local unitPriceLabel = itemFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    unitPriceLabel:SetText("")
    unitPriceLabel:SetTextColor(1, 0.82, 0)
    unitPriceLabel:SetJustifyH("LEFT")
    unitPriceLabel:SetWordWrap(false)
    unitPriceLabel:Hide()
    itemFrame.unitPriceLabel = unitPriceLabel

    local unitPriceValue = itemFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    unitPriceValue:SetText("")
    unitPriceValue:SetTextColor(0.9, 0.9, 0.9)
    unitPriceValue:SetJustifyH("RIGHT")
    unitPriceValue:SetWordWrap(false)
    unitPriceValue:Hide()
    itemFrame.unitPriceValue = unitPriceValue


    local stackSizeInput = CreateFrame("EditBox", nil, itemFrame, "InputBoxTemplate")
    stackSizeInput:SetSize(60, 24)
    stackSizeInput:SetAutoFocus(false)
    stackSizeInput:SetNumeric(true)
    stackSizeInput:SetMaxLetters(4)
    stackSizeInput:Hide()

    local function CreateMaxButton(yOff, onClick)
        local btn = CreateFrame("Button", nil, itemFrame, "UIPanelButtonTemplate")
        btn:SetHeight(24)
        btn:SetText(L("UI_MAX"))
        if btn.SetTextInsets then
            btn:SetTextInsets(0, 0, 0, 0)
        end
        local fs = btn.GetFontString and btn:GetFontString()
        local w = fs and fs.GetStringWidth and fs:GetStringWidth() or 24
        btn:SetWidth(math.ceil(w) + 2)
        btn:SetPoint("RIGHT", itemFrame, "RIGHT", MONEY_RIGHT_INSET_STATS, yOff)
        if onClick then
            btn:SetScript("OnClick", onClick)
        end
        btn:Hide()
        return btn
    end

    local function AttachUnitText(box, unitKey)
        if not box or not box.CreateFontString then return end
        local unit = box:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        unit:SetPoint("RIGHT", box, "RIGHT", -2, 0)
        unit:SetJustifyH("RIGHT")
        unit:SetWordWrap(false)
        unit:SetText(L(unitKey))
        unit:SetTextColor(0.8, 0.8, 0.8)
        box.__unitText = unit

        if box.SetTextInsets and unit.GetStringWidth then
            local w = unit:GetStringWidth() or 0
            box:SetTextInsets(0, math.ceil(w) + 4, 0, 0)
        end
    end


    local numStacksInput = CreateFrame("EditBox", nil, itemFrame, "InputBoxTemplate")
    numStacksInput:SetSize(60, 24)
    numStacksInput:SetAutoFocus(false)
    numStacksInput:SetNumeric(true)
    numStacksInput:SetMaxLetters(4)
    numStacksInput:Hide()

    local AUCTION_INPUT_ROW_YOFF = -14

    local numStacksMaxBtn = CreateMaxButton(AUCTION_INPUT_ROW_YOFF, function()
        local _, itemID = GetSellSlotItemLinkAndID()
        if itemID <= 0 then return end

        local totalCount = GetTotalItemCountInBags(itemID)
        if totalCount <= 0 then return end

        local ss = tonumber(stackSizeInput:GetNumber()) or 0
        if ss <= 0 then ss = 1 end
        local maxStacks = math.floor(totalCount / ss)
        if maxStacks < 1 then maxStacks = 1 end
        
        numStacksInput:SetNumber(maxStacks)
        
        if _G.AuctionsNumStacksEntry then
            local val = tonumber(_G.AuctionsNumStacksEntry:GetNumber()) or 0
            if val ~= maxStacks then
                _G.AuctionsNumStacksEntry:SetNumber(maxStacks)
                local onChange = _G.AuctionsNumStacksEntry:GetScript("OnTextChanged")
                if onChange then
                    pcall(onChange, _G.AuctionsNumStacksEntry, true)
                end
            end
        end
    end)

    numStacksInput:ClearAllPoints()
    numStacksInput:SetPoint("RIGHT", numStacksMaxBtn, "LEFT", -2, 0)

    AttachUnitText(numStacksInput, "UI_UNIT_STACK")

    local stackSizeMaxBtn = CreateMaxButton(AUCTION_INPUT_ROW_YOFF, function()
        local _, itemID = GetSellSlotItemLinkAndID()
        if itemID <= 0 then return end

        local totalCount = GetTotalItemCountInBags(itemID)
        if totalCount <= 0 then return end

        local stackLimit = 1
        if _G.GetItemInfo then
            local _, _, _, _, _, _, _, stackCount = _G.GetItemInfo(itemID)
            stackLimit = tonumber(stackCount) or 1
        end
        if stackLimit < 1 then stackLimit = 1 end

        local maxStackSize = math.min(stackLimit, totalCount)
        if maxStackSize < 1 then maxStackSize = 1 end

        stackSizeInput:SetNumber(maxStackSize)
        
        if _G.AuctionsStackSizeEntry then
            local val = tonumber(_G.AuctionsStackSizeEntry:GetNumber()) or 0
            if val ~= maxStackSize then
                _G.AuctionsStackSizeEntry:SetNumber(maxStackSize)
                local onChange = _G.AuctionsStackSizeEntry:GetScript("OnTextChanged")
                if onChange then
                    pcall(onChange, _G.AuctionsStackSizeEntry, true)
                end
            end
        end
    end)

    stackSizeMaxBtn:ClearAllPoints()
    stackSizeMaxBtn:SetPoint("RIGHT", numStacksInput, "LEFT", -6, 0)

    stackSizeInput:ClearAllPoints()
    stackSizeInput:SetPoint("RIGHT", stackSizeMaxBtn, "LEFT", -2, 0)

    AttachUnitText(stackSizeInput, "UI_UNIT_COUNT")

    local function UpdateMaxButtonsEnabled()
        local _, itemID = GetSellSlotItemLinkAndID()
        local enable = itemID and itemID > 0
        if stackSizeMaxBtn and stackSizeMaxBtn.SetEnabled then stackSizeMaxBtn:SetEnabled(enable) end
        if numStacksMaxBtn and numStacksMaxBtn.SetEnabled then numStacksMaxBtn:SetEnabled(enable) end
    end
    
    local function SetupMaxButtonTooltip(btn)
        if not btn then return end
        btn:SetScript("OnEnter", function(self)
            if not GameTooltip then return end
            local link, itemID = GetSellSlotItemLinkAndID()
            if itemID and itemID > 0 then
                local totalCount = GetTotalItemCountInBags(itemID)
                if totalCount > 0 then
                    local itemName = currentItemName
                    if not itemName and link and _G.GetItemInfo then
                        local name = _G.GetItemInfo(link)
                        itemName = name
                    end
                    if not itemName then
                        itemName = L("UI_MAX")
                    end
                    
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetText(itemName, 1, 0.82, 0, true)
                    local labelText = "|cFFFFD100" .. L("UI_TOTAL_IN_BAGS") .. ":|r"
                    local countText = "|cFFFFFFFF" .. tostring(totalCount) .. "|r"
                    GameTooltip:AddLine(labelText .. " " .. countText, 1, 1, 1, true)
                    GameTooltip:Show()
                end
            end
        end)
        btn:SetScript("OnLeave", function()
            if GameTooltip then GameTooltip:Hide() end
        end)
    end
    
    SetupMaxButtonTooltip(stackSizeMaxBtn)
    SetupMaxButtonTooltip(numStacksMaxBtn)

    AttachUnitText(numStacksInput, "UI_UNIT_STACK")
    
    itemFrame.stackSizeInput = stackSizeInput
    itemFrame.numStacksInput = numStacksInput
    itemFrame.stackSizeMaxBtn = stackSizeMaxBtn
    itemFrame.numStacksMaxBtn = numStacksMaxBtn

    local function UpdateNativePrices()
        if not priceContentFrame then return end
        
        
        local work = priceContentFrame.auctionWorkFrame
        if not work or not work.bidRow or not work.buyoutRow then return end
        
        local unitMode = (work and work.unitMode) or "unit"
        
        local stackSize = 0
        local numStacks = 0
        
        if _G.AuctionsStackSizeEntry then
            stackSize = tonumber(_G.AuctionsStackSizeEntry:GetNumber()) or 0
        end
        if stackSize <= 0 then
            stackSize = tonumber(stackSizeInput:GetNumber()) or 0
        end
        if stackSize <= 0 and _G.GetAuctionSellItemInfo then
            local name, texture, count = _G.GetAuctionSellItemInfo()
            if count and count > 0 then
                stackSize = tonumber(count) or 1
            end
        end
        
        if _G.AuctionsNumStacksEntry then
            numStacks = tonumber(_G.AuctionsNumStacksEntry:GetNumber()) or 0
        end
        if numStacks <= 0 then
            numStacks = tonumber(numStacksInput:GetNumber()) or 0
        end
        
        if stackSize <= 0 then stackSize = 1 end
        if numStacks <= 0 then numStacks = 1 end
        
        local totalQty = stackSize * numStacks
        
        local recommendedUnitPrice = priceContentFrame.recommendedUnitPrice or 0
        local groupStack = priceContentFrame.groupStack
        local minStackTotal = priceContentFrame.minStackTotal or 0

        if (not recommendedUnitPrice or recommendedUnitPrice <= 0) and currentItemID then
            local Database = GF_Auction:GetModule("Database")
            if Database and Database.GetPriceStats then
                local lastStats = Database:GetPriceStats(currentItemID)
                if lastStats then
                    recommendedUnitPrice = tonumber(lastStats.minUnit) or recommendedUnitPrice
                    if not groupStack then groupStack = tonumber(lastStats.groupStack) end
                    if (not minStackTotal or minStackTotal <= 0) then
                        minStackTotal = tonumber(lastStats.minStackTotal) or minStackTotal
                    end
                end
            end
        end
        
        local totalBuyout = 0
        local totalStart = 0
        
        local function SplitCopperLocal(copper)
            local v = tonumber(copper or 0) or 0
            if v < 0 then v = 0 end
            local g = math.floor(v / 10000)
            local s = math.floor((v % 10000) / 100)
            local c = v % 100
            return g, s, c
        end
        
        local function SetMoneyBoxesLocal(goldBox, silverBox, copperBox, copperValue)
            if not (goldBox and silverBox and copperBox) then return end
            if work then work._settingPriceBoxes = true end
            local g, s, c = SplitCopperLocal(copperValue)
            if goldBox.SetText then goldBox:SetText(tostring(g)) end
            if silverBox.SetText then silverBox:SetText(string.format("%02d", s)) end
            if copperBox.SetText then copperBox:SetText(string.format("%02d", c)) end
            if work then work._settingPriceBoxes = false end
        end
        
        if unitMode == "unit" then
            local function ReadCopperFromBoxes(goldBox, silverBox, copperBox)
                local function n(box)
                    if not box or not box.GetText then return 0 end
                    local t = box:GetText()
                    if not t or t == "" then return 0 end
                    return tonumber(t) or 0
                end
                return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
            end
            
            local currentBid = ReadCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
            local currentBuy = ReadCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
            
            if currentBid <= 0 and currentBuy <= 0 and recommendedUnitPrice > 0 then
                local perUnit = recommendedUnitPrice - 1
                if perUnit < 1 then perUnit = 1 end
                SetMoneyBoxesLocal(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, perUnit)
                SetMoneyBoxesLocal(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, perUnit)
                currentBid = perUnit
                currentBuy = perUnit
                if work then work.autoPricing = true end
                if work then
                    work._autoLastBid = perUnit
                    work._autoLastBuy = perUnit
                end
            end
            
            if currentBid > 0 or currentBuy > 0 then
                if currentBid <= 0 then currentBid = currentBuy end
                if currentBuy <= 0 then currentBuy = currentBid end
                totalStart = currentBid * stackSize
                totalBuyout = currentBuy * stackSize
            else
                return
            end
        else
            local function ReadCopperFromBoxes(goldBox, silverBox, copperBox)
                local function n(box)
                    if not box or not box.GetText then return 0 end
                    local t = box:GetText()
                    if not t or t == "" then return 0 end
                    return tonumber(t) or 0
                end
                return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
            end
            
            local currentBid = ReadCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
            local currentBuy = ReadCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
            
            if currentBid > 0 or currentBuy > 0 then
                if currentBid <= 0 then currentBid = currentBuy end
                if currentBuy <= 0 then currentBuy = currentBid end
                totalStart = currentBid
                totalBuyout = currentBuy
            else
                local perStackPrice = 0
                if groupStack and minStackTotal and (tonumber(groupStack) or 0) > 0 and (tonumber(minStackTotal) or 0) > 0 then
                    local gs = tonumber(groupStack) or 1
                    local mst = tonumber(minStackTotal) or 0
                    local scaled = math.floor((mst * stackSize + gs - 1) / gs)
                    perStackPrice = scaled - 1
                elseif recommendedUnitPrice > 0 then
                    perStackPrice = recommendedUnitPrice * stackSize - 1
                else
                    return
                end
                
                if perStackPrice < 1 then perStackPrice = 1 end
                SetMoneyBoxesLocal(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper, perStackPrice)
                SetMoneyBoxesLocal(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper, perStackPrice)
                
                totalStart = perStackPrice
                totalBuyout = perStackPrice
                if work then work.autoPricing = true end
                if work then
                    work._autoLastBid = perStackPrice
                    work._autoLastBuy = perStackPrice
                end
            end
        end
        
        if _G.StartPriceGold and _G.MoneyInputFrame_SetCopper then
            local work = priceContentFrame.auctionWorkFrame
            if work then
                work.isUpdatingFromPlugin = true
                _G.MoneyInputFrame_SetCopper(_G.StartPrice, totalStart)
                _G.MoneyInputFrame_SetCopper(_G.BuyoutPrice, totalBuyout)
                if C_Timer and C_Timer.After then
                    C_Timer.After(0.1, function()
                        if work then
                            work.isUpdatingFromPlugin = false
                        end
                    end)
                else
                    work.isUpdatingFromPlugin = false
                end
            end
        end
    end

    itemFrame.UpdateNativePrices = UpdateNativePrices

    local function SyncToNative(nativeEntry, val)
        if not nativeEntry then return end
        
        if not GetAuctionSellItemInfo() then return end

        val = tonumber(val) or 0
        local cur = tonumber(nativeEntry:GetNumber()) or 0
        
        if val ~= cur then
            nativeEntry:SetNumber(val)
            
            local onChange = nativeEntry:GetScript("OnTextChanged")
            if onChange then
                pcall(onChange, nativeEntry, true)
            end
        end
        
        if nativeEntry == _G.AuctionsStackSizeEntry then
            local countText = _G.AuctionsItemButtonCount
            if countText then
                countText:SetText(val)
                if val > 1 then
                    countText:Show()
                else
                    countText:Hide()
                end
            end
        end
        
        UpdateNativePrices()
    end

    local function RequestAutoReprice()
        local w = priceContentFrame and priceContentFrame.auctionWorkFrame
        if not (w and w.ApplyRecommend) then return end
        if w._settingPriceBoxes then return end
        if not (stackSizeInput and stackSizeInput.IsVisible and stackSizeInput:IsVisible()) then return end

        local curBid = (w.GetRawBidCopper and w:GetRawBidCopper()) or 0
        local curBuy = (w.GetRawBuyoutCopper and w:GetRawBuyoutCopper()) or 0
        local matchesSnapshot =
            (w._autoLastBid and w._autoLastBuy)
            and (curBid == (w._autoLastBid or 0))
            and (curBuy == (w._autoLastBuy or 0))
        local zeroPrices = (curBid <= 0 and curBuy <= 0)
        if not (w.autoPricing or matchesSnapshot or zeroPrices) then
            return
        end
        w.autoPricing = true

        w._autoPriceToken = (w._autoPriceToken or 0) + 1
        local token = w._autoPriceToken

        local function run()
            local w2 = priceContentFrame and priceContentFrame.auctionWorkFrame
            if not (w2 and w2.ApplyRecommend) then return end
            if w2._settingPriceBoxes then return end
            if token ~= (w2._autoPriceToken or 0) then return end
            local curBid2 = (w2.GetRawBidCopper and w2:GetRawBidCopper()) or 0
            local curBuy2 = (w2.GetRawBuyoutCopper and w2:GetRawBuyoutCopper()) or 0
            local matchesSnapshot2 =
                (w2._autoLastBid and w2._autoLastBuy)
                and (curBid2 == (w2._autoLastBid or 0))
                and (curBuy2 == (w2._autoLastBuy or 0))
            local zeroPrices2 = (curBid2 <= 0 and curBuy2 <= 0)
            if not (w2.autoPricing or matchesSnapshot2 or zeroPrices2) then
                return
            end
            w2.autoPricing = true
            w2.isUpdatingFromPlugin = true
            w2:ApplyRecommend()
            if C_Timer and C_Timer.After then
                C_Timer.After(0.15, function()
                    if w2 then w2.isUpdatingFromPlugin = false end
                end)
            else
                w2.isUpdatingFromPlugin = false
            end
        end

        if C_Timer and C_Timer.After then
            C_Timer.After(0.15, run)
        else
            run()
        end
    end

    stackSizeInput:SetScript("OnTextChanged", function(self)
        SyncToNative(_G.AuctionsStackSizeEntry, self:GetNumber())
        RequestAutoReprice()
        local work = priceContentFrame and priceContentFrame.auctionWorkFrame
        if work and work.UpdateUnitPriceText then work:UpdateUnitPriceText() end
    end)
    numStacksInput:SetScript("OnTextChanged", function(self)
        SyncToNative(_G.AuctionsNumStacksEntry, self:GetNumber())
        RequestAutoReprice()
        local work = priceContentFrame and priceContentFrame.auctionWorkFrame
        if work and work.UpdateUnitPriceText then work:UpdateUnitPriceText() end
    end)

    local function ForceShowBrowseControls()
        stackSizeInput:Hide()
        numStacksInput:Hide()
        if stackSizeMaxBtn then stackSizeMaxBtn:Hide() end
        if numStacksMaxBtn then numStacksMaxBtn:Hide() end
        local hasItem = currentItemName ~= nil
        if hasItem then
            priceContentFrame.itemFrame.listBtn:Show()
            priceContentFrame.itemFrame.buyBtn:Show()
        else
            priceContentFrame.itemFrame.listBtn:Hide()
            priceContentFrame.itemFrame.buyBtn:Hide()
        end
    end

    local function ForceShowAuctionControls()
        priceContentFrame.itemFrame.listBtn:Hide()
        priceContentFrame.itemFrame.buyBtn:Hide()
        stackSizeInput:Show()
        numStacksInput:Show()
        if stackSizeMaxBtn then stackSizeMaxBtn:Show() end
        if numStacksMaxBtn then numStacksMaxBtn:Show() end
        
        if _G.AuctionsStackSizeEntry then
            local nativeVal = _G.AuctionsStackSizeEntry:GetNumber()
            local pluginVal = stackSizeInput:GetNumber()
            if nativeVal and (not pluginVal or pluginVal <= 0) then
                stackSizeInput:SetNumber(nativeVal)
            end
        end
        if _G.AuctionsNumStacksEntry then
            local nativeVal = _G.AuctionsNumStacksEntry:GetNumber()
            local pluginVal = numStacksInput:GetNumber()
            if nativeVal and (not pluginVal or pluginVal <= 0) then
                numStacksInput:SetNumber(nativeVal)
            end
        end
    end

    local function SetAuctionMode(isAuction)
        if not priceContentFrame or not priceContentFrame.itemFrame then return end

        local function EnsureNativeListGuide()
            if not _G.AuctionFrameAuctions then return nil end
            if _G.AuctionFrameAuctions.__GFA_NativeListGuide then
                return _G.AuctionFrameAuctions.__GFA_NativeListGuide
            end

            local fs = _G.AuctionFrameAuctions:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            fs:SetTextColor(1, 0.2, 0.2)
            fs:SetJustifyH("LEFT")
            fs:SetJustifyV("TOP")
            fs:SetWordWrap(true)
            fs:SetText(L("UI_NATIVE_LIST_GUIDE"))

            fs:ClearAllPoints()
            local anchorBtn = _G.StartAuctionButton or _G.AuctionsCreateAuctionButton or (_G.AuctionFrameAuctions and _G.AuctionFrameAuctions.CreateAuctionButton)
            if anchorBtn and anchorBtn.GetTop then
                local yOff = 24
                fs:SetPoint("BOTTOMLEFT", anchorBtn, "TOPLEFT", 8, yOff)
                fs:SetPoint("BOTTOMRIGHT", anchorBtn, "TOPRIGHT", 8, yOff)
            else
                fs:SetPoint("BOTTOMLEFT", _G.AuctionFrameAuctions, "BOTTOMLEFT", 20, 84)
                fs:SetPoint("BOTTOMRIGHT", _G.AuctionFrameAuctions, "BOTTOMLEFT", 300, 84)
            end

            _G.AuctionFrameAuctions.__GFA_NativeListGuide = fs
            return fs
        end

        local function UpdateNativeListGuide(show)
            local fs = EnsureNativeListGuide()
            if not fs then return end
            if show then
                fs:SetText(L("UI_NATIVE_LIST_GUIDE"))
                fs:Show()
            else
                fs:Hide()
            end
        end
        
        if isAuction then
            priceContentFrame.itemFrame.listBtn:Hide()
            priceContentFrame.itemFrame.buyBtn:Hide()
            if priceContentFrame.itemFrame.boughtText then
                priceContentFrame.itemFrame.boughtText:Hide()
            end
            stackSizeInput:Show()
            numStacksInput:Show()
            if stackSizeMaxBtn then stackSizeMaxBtn:Show() end
            if numStacksMaxBtn then numStacksMaxBtn:Show() end
            if UpdateMaxButtonsEnabled then UpdateMaxButtonsEnabled() end
            local panel = EnsureSellSearchPanel()

            local nt = priceContentFrame.itemFrame.nameText
            if nt and icon then
                nt:ClearAllPoints()
                nt:SetPoint("TOPLEFT", icon, "TOPRIGHT", 5, -1)
                local frameWidth = priceContentFrame.itemFrame:GetWidth() or 300
                local leftPos = 5 + (icon:GetWidth() or 37) + 5
                local rightPadding = (MONEY_RIGHT_INSET_STATS or 0) + 20
                local maxWidth = frameWidth - leftPos - rightPadding
                
                nt:SetWidth(maxWidth)
                nt:SetJustifyH("LEFT")
                
                if nt.SetWordWrap then nt:SetWordWrap(false) end
                if nt.SetMaxLines then nt:SetMaxLines(1) end
                if nt.SetHeight then nt:SetHeight(14) end
                
                local stringWidth = nt:GetStringWidth() or maxWidth
                if stringWidth < maxWidth then
                    nt:SetWidth(stringWidth + 5)
                end
            end
            if priceContentFrame.itemFrame and priceContentFrame.itemFrame.copyBtn then
                local itf = priceContentFrame.itemFrame
                local inlineCopyShown = itf.copyBox and itf.copyBox.IsShown and itf.copyBox:IsShown() or false
                if inlineCopyShown then
                    itf.copyBtn:Hide()
                else
                    itf.copyBtn:SetShown(currentItemName ~= nil)
                end
            end
            local swBtn = priceContentFrame.itemFrame.switchBtn
            local invBtn = priceContentFrame.itemFrame.inventoryBtn
            local brBtn = priceContentFrame.itemFrame.browseBtn
            local upLabel = priceContentFrame.itemFrame.unitPriceLabel
            local upValue = priceContentFrame.itemFrame.unitPriceValue
            local hasItem = currentItemName ~= nil
            
            if swBtn then swBtn:SetShown(hasItem) end
            if invBtn then invBtn:SetShown(hasItem) end
            if brBtn then brBtn:SetShown(hasItem) end

            if upLabel and upValue then
                if hasItem and invBtn and brBtn then
                    upLabel:ClearAllPoints()
                    upValue:ClearAllPoints()
                    upLabel:SetPoint("TOPLEFT", invBtn, "BOTTOMLEFT", 0, -6)
                    upValue:SetPoint("TOPRIGHT", brBtn, "BOTTOMRIGHT", 0, -6)
                    local work = priceContentFrame.auctionWorkFrame
                    if work and work.UpdateUnitPriceText then
                        work:UpdateUnitPriceText()
                    else
                        upLabel:Show()
                        upValue:Show()
                    end
                else
                    upLabel:Hide()
                    upValue:Hide()
                end
            end
            
            if hasItem and swBtn and invBtn and brBtn then
                swBtn:ClearAllPoints()
                invBtn:ClearAllPoints()
                brBtn:ClearAllPoints()
                
                local work = priceContentFrame.auctionWorkFrame
                local uBtn = work and work.unitModeBtn
                local sBtn = work and work.startBtn
                
                if uBtn and sBtn then
                     local btnHeight = sBtn:GetHeight() or 22
                     swBtn:SetHeight(btnHeight)
                     invBtn:SetHeight(btnHeight)
                     brBtn:SetHeight(btnHeight)
                     
                     if C_Timer and C_Timer.After then
                         C_Timer.After(0.01, function()
                              if not uBtn:GetLeft() or not sBtn:GetRight() then return end
                              local l = uBtn:GetLeft()
                              local r = sBtn:GetRight()
                              local w = r - l
                              local gap = 6
                              local btnW = (w - 2 * gap) / 3
                              
                              swBtn:SetWidth(btnW)
                              invBtn:SetWidth(btnW)
                              brBtn:SetWidth(btnW)
                              
                              swBtn:ClearAllPoints()
                              invBtn:ClearAllPoints()
                              brBtn:ClearAllPoints()
                              
                              invBtn:SetPoint("TOPLEFT", uBtn, "BOTTOMLEFT", 0, -4)
                              swBtn:SetPoint("LEFT", invBtn, "RIGHT", gap, 0)
                              brBtn:SetPoint("LEFT", swBtn, "RIGHT", gap, 0)
                         end)
                     end
                end
            end

            if priceContentFrame.compareFrame then
                priceContentFrame.compareFrame:Hide()
            end
            if priceContentFrame.buyInfoFrame then
                priceContentFrame.buyInfoFrame:Hide()
            end
            if priceContentFrame.auctionWorkFrame then
                priceContentFrame.auctionWorkFrame:Show()
            end

            UpdateNativeListGuide(true)
            
            if _G.AuctionsStackSizeEntry then
                local nativeVal = _G.AuctionsStackSizeEntry:GetNumber()
                local pluginVal = stackSizeInput:GetNumber()
                if nativeVal and (not pluginVal or pluginVal <= 0) then
                    stackSizeInput:SetNumber(nativeVal)
                end
            end
            if _G.AuctionsNumStacksEntry then
                local nativeVal = _G.AuctionsNumStacksEntry:GetNumber()
                local pluginVal = numStacksInput:GetNumber()
                if nativeVal and (not pluginVal or pluginVal <= 0) then
                    numStacksInput:SetNumber(nativeVal)
                end
            end
        else
            stackSizeInput:Hide()
            numStacksInput:Hide()
            if stackSizeMaxBtn then stackSizeMaxBtn:Hide() end
            if numStacksMaxBtn then numStacksMaxBtn:Hide() end
            if UpdateMaxButtonsEnabled then UpdateMaxButtonsEnabled() end
            local panel = EnsureSellSearchPanel()
            if panel then panel:Hide() end

            local nt = priceContentFrame.itemFrame.nameText
            if nt and icon then
                nt:ClearAllPoints()
                nt:SetPoint("TOPLEFT", icon, "TOPRIGHT", 5, -1)
                nt:SetJustifyH("LEFT")
                nt:SetWidth(0)
                if nt.SetWordWrap then nt:SetWordWrap(false) end
                if nt.SetMaxLines then nt:SetMaxLines(1) end
                if nt.SetHeight then nt:SetHeight(14) end
            end
            if priceContentFrame.itemFrame and priceContentFrame.itemFrame.copyBtn then
                local itf = priceContentFrame.itemFrame
                local inlineCopyShown = itf.copyBox and itf.copyBox.IsShown and itf.copyBox:IsShown() or false
                if inlineCopyShown then
                    itf.copyBtn:Hide()
                else
                    itf.copyBtn:SetShown(currentItemName ~= nil)
                end
            end

            if priceContentFrame.compareFrame then
                if SHOW_COMPARE_SECTION then priceContentFrame.compareFrame:Show() else priceContentFrame.compareFrame:Hide() end
            end
            if priceContentFrame.buyInfoFrame then
                priceContentFrame.buyInfoFrame:Show()
            end
            if priceContentFrame.itemFrame and priceContentFrame.itemFrame.boughtText then
                priceContentFrame.itemFrame.boughtText:Show()
            end
            if priceContentFrame.auctionWorkFrame then
                priceContentFrame.auctionWorkFrame:Hide()
            end

            UpdateNativeListGuide(false)
            if priceContentFrame.itemFrame then
                if priceContentFrame.itemFrame.unitPriceLabel then priceContentFrame.itemFrame.unitPriceLabel:Hide() end
                if priceContentFrame.itemFrame.unitPriceValue then priceContentFrame.itemFrame.unitPriceValue:Hide() end
            end
            
            local hasItem = currentItemName ~= nil
            if hasItem then
                priceContentFrame.itemFrame.listBtn:Show()
                priceContentFrame.itemFrame.buyBtn:Show()
            else
                priceContentFrame.itemFrame.listBtn:Hide()
                priceContentFrame.itemFrame.buyBtn:Hide()
            end
            local swBtn = priceContentFrame.itemFrame.switchBtn
            local invBtn = priceContentFrame.itemFrame.inventoryBtn
            local brBtn = priceContentFrame.itemFrame.browseBtn
            local listBtn = priceContentFrame.itemFrame.listBtn
            local buyBtn = priceContentFrame.itemFrame.buyBtn
            
            if brBtn then brBtn:Hide() end
            if swBtn then 
                swBtn:SetShown(hasItem) 
                swBtn:ClearAllPoints()
                swBtn:SetWidth(60)
                swBtn:SetHeight(24)
                if buyBtn then swBtn:SetPoint("TOP", buyBtn, "BOTTOM", 0, -4) end
            end
            if invBtn then 
                invBtn:SetShown(hasItem) 
                invBtn:ClearAllPoints()
                invBtn:SetWidth(60)
                invBtn:SetHeight(24)
                if listBtn then invBtn:SetPoint("TOP", listBtn, "BOTTOM", 0, -4) end
            end
        end

        if not currentItemName and PricePanel and PricePanel.ShowNoData then
            PricePanel:ShowNoData()
        end
    end

    function PricePanel:UpdateControlsVisibility()
        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions:IsVisible()
        SetAuctionMode(isAuction)
    end

    local monitor = CreateFrame("Frame")
    local lastState = nil
    monitor:SetScript("OnUpdate", function(self, elapsed)
        self.timer = (self.timer or 0) + elapsed
        if self.timer < 0.1 then return end
        self.timer = 0
        
        if not priceContentFrame or not priceContentFrame.itemFrame then return end
        
        local isAuction = _G.AuctionFrameAuctions and _G.AuctionFrameAuctions:IsVisible()
        
        if isAuction ~= lastState then
            lastState = isAuction
            SetAuctionMode(isAuction)
        end
    end)

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("NEW_AUCTION_UPDATE")
    eventFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
    eventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    local lastAutoRecommendItemID = nil
    local lastAutoRecommendAt = 0
    eventFrame:SetScript("OnEvent", function(self, event)
        if event == "AUCTION_HOUSE_CLOSED" then
            if _G.CursorHasItem and _G.CursorHasItem() then
                _G.ClearCursor()
            end
            if priceContentFrame and priceContentFrame.itemFrame and priceContentFrame.itemFrame.ResetBuySummary then
                priceContentFrame.itemFrame:ResetBuySummary(currentItemID)
            end
            if PricePanel and PricePanel.UpdateBuyInfoSession then
                PricePanel:UpdateBuyInfoSession()
            end
            if PricePanel and PricePanel.UpdateBuyInfoPreview then
                PricePanel:UpdateBuyInfoPreview()
            end
            return
        end
        if event == "AUCTION_ITEM_LIST_UPDATE" then
            if PricePanel and PricePanel.UpdateBuyInfoPreview then
                PricePanel:UpdateBuyInfoPreview()
            end
            return
        end
        if UpdateMaxButtonsEnabled then
            UpdateMaxButtonsEnabled()
            if _G.C_Timer and _G.C_Timer.After then
                _G.C_Timer.After(0, function()
                    if UpdateMaxButtonsEnabled then UpdateMaxButtonsEnabled() end
                end)
            end
        end
        
        local sellSlotName = _G.GetAuctionSellItemInfo and select(1, _G.GetAuctionSellItemInfo())
        if (not sellSlotName or sellSlotName == "") and currentItemID and currentItemID > 0 then
            local totalCount = GetTotalItemCountInBags(currentItemID)
            if totalCount > 0 then
                if TryPlaceItemFromBag(currentItemID) then
                    if C_Timer and C_Timer.After then
                        C_Timer.After(0.3, function()
                            UpdateFromSellSlot()
                            if priceContentFrame and priceContentFrame.itemFrame then
                                local ss = priceContentFrame.itemFrame.stackSizeInput and priceContentFrame.itemFrame.stackSizeInput.GetNumber and priceContentFrame.itemFrame.stackSizeInput:GetNumber() or 1
                                local ns = priceContentFrame.itemFrame.numStacksInput and priceContentFrame.itemFrame.numStacksInput.GetNumber and priceContentFrame.itemFrame.numStacksInput:GetNumber() or 1
                                if ss > 0 and ns > 0 then
                                    if _G.AuctionsStackSizeEntry then
                                        _G.AuctionsStackSizeEntry:SetNumber(ss)
                                        local onChange = _G.AuctionsStackSizeEntry:GetScript("OnTextChanged")
                                        if onChange then
                                            pcall(onChange, _G.AuctionsStackSizeEntry, true)
                                        end
                                    end
                                    if _G.AuctionsNumStacksEntry then
                                        _G.AuctionsNumStacksEntry:SetNumber(ns)
                                        local onChange = _G.AuctionsNumStacksEntry:GetScript("OnTextChanged")
                                        if onChange then
                                            pcall(onChange, _G.AuctionsNumStacksEntry, true)
                                        end
                                    end
                                    local work = priceContentFrame and priceContentFrame.auctionWorkFrame
                                    if work and work.UpdateNativeFromInputs then
                                        work:UpdateNativeFromInputs()
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        else
            UpdateFromSellSlot()
        end
        
        if stackSizeInput:IsVisible() then PricePanel:UpdateControlsVisibility() end

        if _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsVisible and _G.AuctionFrameAuctions:IsVisible() then
            local work = priceContentFrame and priceContentFrame.auctionWorkFrame
            if work and work.ApplyRecommend and currentItemID then
                local function ReadCopperFromBoxes(goldBox, silverBox, copperBox)
                    local function n(box)
                        if not box or not box.GetText then return 0 end
                        local t = box:GetText()
                        if not t or t == "" then return 0 end
                        return tonumber(t) or 0
                    end
                    return (n(goldBox) * 10000) + (n(silverBox) * 100) + n(copperBox)
                end
                
                local currentBid = ReadCopperFromBoxes(work.bidRow.gold, work.bidRow.silver, work.bidRow.copper)
                local currentBuy = ReadCopperFromBoxes(work.buyoutRow.gold, work.buyoutRow.silver, work.buyoutRow.copper)
                
                local shouldAutoApply = (currentBid <= 0 and currentBuy <= 0)
                
                if shouldAutoApply then
                    local now = _G.GetTime and _G.GetTime() or 0
                    local notSpam = (lastAutoRecommendItemID ~= currentItemID) or ((now - (lastAutoRecommendAt or 0)) > 0.5)
                    if notSpam then
                        lastAutoRecommendItemID = currentItemID
                        lastAutoRecommendAt = now
                        work.isUpdatingFromPlugin = true
                        work:ApplyRecommend()
                        if C_Timer and C_Timer.After then
                            C_Timer.After(0.2, function()
                                if work then
                                    work.isUpdatingFromPlugin = false
                                end
                            end)
                        else
                            work.isUpdatingFromPlugin = false
                        end
                    end
                end
            end
        end
    end)

    local nameText = itemFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    local nFontName, nFontHeight, nFontFlags = nameText:GetFont()
    nameText:SetFont(nFontName, nFontHeight * 0.95, nFontFlags)
    nameText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 5, 0)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(L("UI_SELECT_ITEM"))
    nameText:SetTextColor(0.7, 0.7, 0.7)
    itemFrame.nameText = nameText

    local copyBtn = CreateFrame("Button", nil, itemFrame)
    copyBtn:SetSize(16, 16)
    copyBtn:SetPoint("LEFT", nameText, "RIGHT", 2, 1)
    copyBtn:SetFrameLevel(itemFrame:GetFrameLevel() + 5)
    
    local copyIcon = copyBtn:CreateTexture(nil, "OVERLAY")
    copyIcon:SetSize(12, 12)
    copyIcon:SetPoint("CENTER", 0, 0)
    copyIcon:SetTexture("Interface\\Buttons\\UI-GuildButton-PublicNote-Up")
    copyIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    copyIcon:SetVertexColor(0.8, 0.8, 0.8)
    copyBtn.icon = copyIcon

    local copyBox = CreateFrame("EditBox", nil, itemFrame, "InputBoxTemplate")
    copyBox:SetAutoFocus(false)
    copyBox:SetHeight(22)
    copyBox:SetWidth(220)
    copyBox:SetFrameLevel(itemFrame:GetFrameLevel() + 10)
    copyBox:Hide()
    itemFrame.copyBox = copyBox

    local function HideInlineCopy()
        if not itemFrame then return end
        if itemFrame.copyBox then
            itemFrame.copyBox:Hide()
            itemFrame.copyBox:ClearFocus()
        end
        if itemFrame.nameText then itemFrame.nameText:Show() end
        if itemFrame.copyBtn then itemFrame.copyBtn:Show() end
    end

    local function ShowInlineCopy(text)
        if not itemFrame or not itemFrame.copyBox or not itemFrame.nameText then return end

        itemFrame.nameText:Hide()
        if itemFrame.copyBtn then itemFrame.copyBtn:Hide() end
        itemFrame.copyBox:ClearAllPoints()
        itemFrame.copyBox:SetPoint("LEFT", itemFrame.nameText, "LEFT", 0, 0)

        itemFrame.copyBox:Show()
        itemFrame.copyBox:SetText(text or "")
        itemFrame.copyBox:SetFocus()
        if itemFrame.copyBox.HighlightText then
            itemFrame.copyBox:HighlightText(0, -1)
        end
    end

    itemFrame.__GFA_HideInlineCopy = HideInlineCopy
    itemFrame.__GFA_ShowInlineCopy = ShowInlineCopy

    copyBox:SetScript("OnEscapePressed", function()
        HideInlineCopy()
    end)
    copyBox:SetScript("OnEnterPressed", function(selfBox)
        selfBox:HighlightText()
    end)
    copyBox:SetScript("OnEditFocusLost", function()
        HideInlineCopy()
    end)
    
    copyBtn:SetScript("OnEnter", function(self)
        self.icon:SetVertexColor(1, 1, 1)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L("UI_COPY_NAME"), 1, 1, 1)
        GameTooltip:Show()
    end)
    
    copyBtn:SetScript("OnLeave", function(self)
        self.icon:SetVertexColor(0.8, 0.8, 0.8)
        GameTooltip:Hide()
    end)
    
    local function JumpToBrowseTabIfOnAuctions()
        local isAuctions = false
        if _G.AuctionFrame and _G.AuctionFrame.selectedTab ~= nil then
            isAuctions = tonumber(_G.AuctionFrame.selectedTab) == 3
        elseif _G.AuctionFrameTab3 and _G.AuctionFrameTab3.GetChecked then
            isAuctions = _G.AuctionFrameTab3:GetChecked() and true or false
        end
        if not isAuctions then return end

        if _G.AuctionFrameTab1 and _G.AuctionFrameTab1.Click then
            pcall(_G.AuctionFrameTab1.Click, _G.AuctionFrameTab1)
        elseif _G.AuctionFrameTab_OnClick and _G.AuctionFrameTab1 then
            pcall(_G.AuctionFrameTab_OnClick, _G.AuctionFrameTab1)
        end
    end

    copyBtn:SetScript("OnClick", function(self)
        if not currentItemName or currentItemName == "" then return end
        local copyText = "\"" .. currentItemName .. "\""

        JumpToBrowseTabIfOnAuctions()
        
        if _G.C_ChatInfo and _G.C_ChatInfo.CopyChatLine then
            _G.C_ChatInfo:CopyChatLine(copyText)
            return
        end

        if itemFrame.copyBox and itemFrame.copyBox:IsShown() then
            HideInlineCopy()
        else
            ShowInlineCopy(copyText)
        end
        
    end)
    copyBtn:Hide()
    itemFrame.copyBtn = copyBtn

    local nameBtn = CreateFrame("Button", nil, itemFrame)
    nameBtn:SetPoint("TOPLEFT", nameText, "TOPLEFT", 0, 0)
    nameBtn:SetPoint("BOTTOMRIGHT", nameText, "BOTTOMRIGHT", 0, 0)
    nameBtn:SetFrameLevel(itemFrame:GetFrameLevel() + 5)
    nameBtn:EnableMouse(true)
    nameBtn:SetScript("OnClick", function(btn, button)
        if button == "LeftButton" then
            if currentItemName and currentItemName ~= "" then
                local copyText = "\"" .. currentItemName .. "\""
                JumpToBrowseTabIfOnAuctions()
                ShowInlineCopy(copyText)
            end
        end
    end)
    itemFrame.nameBtn = nameBtn

    local idText = itemFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idText:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", 0, -15)
    idText:SetText("")
    idText:SetTextColor(0.6, 0.6, 0.6)
    idText:Hide()
    itemFrame.idText = idText
    
    favBtn:SetPoint("TOPLEFT", nameText, "BOTTOMLEFT", -21, -17)

    priceContentFrame.itemFrame = itemFrame
end

function PricePanel:OnFavoritesChanged(itemID)
    if not itemID or not currentItemID or itemID ~= currentItemID then
        return
    end

    if not priceContentFrame or not priceContentFrame.itemFrame or not priceContentFrame.itemFrame.favBtn then
        return
    end

    local Database = GF_Auction:GetModule("Database")
    if not Database then return end

    local favs = Database:GetFavorites()
    local isFav = favs and favs[currentItemID]

    local favBtn = priceContentFrame.itemFrame.favBtn
    local favTex = favBtn and favBtn.tex
    if not favTex then return end

    favBtn:Show()
    if isFav then
        favTex:SetVertexColor(1, 0.82, 0, 1)
    else
        favTex:SetVertexColor(1, 1, 1, 1)
    end

    if GameTooltip and GameTooltip:GetOwner() == favBtn then
        local onEnter = favBtn:GetScript("OnEnter")
        if onEnter then onEnter(favBtn) end
    end
end

function PricePanel:CreateStatisticsSection(parent)
    local statsFrame = CreateFrame("Frame", nil, parent)
    statsFrame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 5, 108)
    statsFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -2, 108)
    statsFrame:SetHeight(78)

    local title = statsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", -2, 0)
    title:SetText(L("UI_CURRENT_PRICE"))
    title:SetTextColor(1, 0.5, 0.25)
    statsFrame.title = title

    local rowAnchor = CreateFrame("Frame", nil, statsFrame)
    local titleH = (title.GetStringHeight and title:GetStringHeight()) or 14
    rowAnchor:SetPoint("TOPLEFT", statsFrame, "TOPLEFT", 0, -(titleH + 5))
    rowAnchor:SetPoint("TOPRIGHT", statsFrame, "TOPRIGHT", 0, -(titleH + 5))
    rowAnchor:SetHeight(1)

    local function CreateSummaryRow(anchor, labelKey)
        local row = CreateFrame("Frame", nil, statsFrame)
        row:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, 0)
        row:SetPoint("TOPRIGHT", statsFrame, "TOPRIGHT", 0, 0)
        row:SetHeight(20)

        local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        local lFont, lHeight, lFlags = label:GetFont()
        label:SetFont(lFont, lHeight * 0.95, lFlags)
        label:SetPoint("LEFT", 0, 0)
        label:SetText(L(labelKey) .. ":")
        label:SetTextColor(0.8, 0.8, 0.8)

        local value = CreateMoneyColumns(row, MONEY_TOTAL_WIDTH, "GameFontNormalSmall")
        value:SetPoint("RIGHT", row, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
        value:SetEmpty()
        return row, value
    end

    local rowLowUnit, valLowUnit = CreateSummaryRow(rowAnchor, "UI_HIST_LOW_UNIT")
    rowLowUnit:ClearAllPoints()
    rowLowUnit:SetPoint("TOPLEFT", rowAnchor, "TOPLEFT", 0, 0)
    rowLowUnit:SetPoint("TOPRIGHT", statsFrame, "TOPRIGHT", 0, 0)
    local rowLowStack, valLowStack = CreateSummaryRow(rowLowUnit, "UI_HIST_LOW_STACK")
    rowLowStack:ClearAllPoints()
    rowLowStack:SetPoint("TOPLEFT", rowLowUnit, "BOTTOMLEFT", 0, -5)
    rowLowStack:SetPoint("TOPRIGHT", statsFrame, "TOPRIGHT", 0, 0)

    statsFrame.valLowUnit = valLowUnit
    statsFrame.valLowStack = valLowStack

    local countText = statsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("TOPLEFT", rowLowStack, "BOTTOMLEFT", 0, -5)
    countText:SetText("")
    countText:SetTextColor(0.6, 0.6, 0.6)
    statsFrame.countText = countText
    countText:Hide()

    priceContentFrame.statsFrame = statsFrame
    priceContentFrame.stats = { lowUnit = valLowUnit, lowStack = valLowStack }
end

function PricePanel:CreateHistorySection(parent)
    local historyFrame = CreateFrame("Frame", nil, parent)
    local statsFrame = priceContentFrame and priceContentFrame.statsFrame
    historyFrame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 5, 12)
    historyFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -2, 12)
    historyFrame:SetHeight(90)

    if statsFrame then
        statsFrame:ClearAllPoints()
        statsFrame:SetPoint("BOTTOMLEFT", historyFrame, "TOPLEFT", 0, 0)
        statsFrame:SetPoint("BOTTOMRIGHT", historyFrame, "TOPRIGHT", 0, 0)
    end

    local title = historyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText(L("UI_HISTORY_PRICE"))
    title:SetTextColor(1, 0.5, 0.25)
    historyFrame.title = title

    local rowAnchor = CreateFrame("Frame", nil, historyFrame)
    local titleH = (title.GetStringHeight and title:GetStringHeight()) or 14
    rowAnchor:SetPoint("TOPLEFT", historyFrame, "TOPLEFT", 0, -(titleH + 5))
    rowAnchor:SetPoint("TOPRIGHT", historyFrame, "TOPRIGHT", 0, -(titleH + 5))
    rowAnchor:SetHeight(1)

    local function CreateSummaryRow(anchor, labelKey)
        local row = CreateFrame("Frame", nil, historyFrame)
        row:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, 0)
        row:SetPoint("TOPRIGHT", historyFrame, "TOPRIGHT", 0, 0)
        row:SetHeight(20)
        local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        local lFont, lHeight, lFlags = label:GetFont()
        label:SetFont(lFont, lHeight * 0.95, lFlags)
        label:SetPoint("LEFT", 0, 0)
        label:SetText(L(labelKey) .. ":")
        label:SetTextColor(0.8, 0.8, 0.8)
        local value = CreateMoneyColumns(row, MONEY_TOTAL_WIDTH, "GameFontNormalSmall")
        value:SetPoint("RIGHT", row, "RIGHT", MONEY_RIGHT_INSET_STATS, 0)
        value:SetEmpty()
        return row, value
    end

    local rowLowUnit, valLowUnit = CreateSummaryRow(rowAnchor, "UI_HIST_LOW_UNIT")
    rowLowUnit:ClearAllPoints()
    rowLowUnit:SetPoint("TOPLEFT", rowAnchor, "TOPLEFT", 0, 0)
    rowLowUnit:SetPoint("TOPRIGHT", historyFrame, "TOPRIGHT", 0, 0)
    local rowLowStack, valLowStack = CreateSummaryRow(rowLowUnit, "UI_HIST_LOW_STACK")
    rowLowStack:ClearAllPoints()
    rowLowStack:SetPoint("TOPLEFT", rowLowUnit, "BOTTOMLEFT", 0, -5)
    rowLowStack:SetPoint("TOPRIGHT", historyFrame, "TOPRIGHT", 0, 0)

    historyFrame.valLowUnit = valLowUnit
    historyFrame.valLowStack = valLowStack

    local countText = historyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("TOPLEFT", rowLowStack, "BOTTOMLEFT", 0, -5)
    countText:SetText("")
    countText:SetTextColor(0.6, 0.6, 0.6)
    historyFrame.countText = countText

    priceContentFrame.historyFrame = historyFrame
end

function PricePanel:ShowNoData()
    if not priceContentFrame then return end
    if not priceContentFrame.noDataIcon then
        local t = priceContentFrame:CreateTexture(nil, "ARTWORK")
        t:SetTexture("Interface\\AddOns\\GF_Auction\\Media\\icon.tga")
        t:SetSize(96, 96)
        t:SetPoint("CENTER", priceContentFrame, "CENTER", 0, 48)
        t:SetAlpha(0.7)
        priceContentFrame.noDataIcon = t
    end
    if priceContentFrame.noDataIcon then
        priceContentFrame.noDataIcon:Show()
    end
    if not priceContentFrame.noDataText1 then
        local fs1 = priceContentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs1:SetPoint("TOP", priceContentFrame.noDataIcon, "BOTTOM", 0, -24)
        fs1:SetTextColor(1, 0.82, 0)
        fs1:SetJustifyH("CENTER")
        priceContentFrame.noDataText1 = fs1
    end
    if not priceContentFrame.noDataText2 then
        local fs2 = priceContentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs2:SetPoint("TOP", priceContentFrame.noDataText1, "BOTTOM", 0, -14)
        fs2:SetTextColor(0.7, 0.7, 0.7)
        fs2:SetJustifyH("CENTER")
        priceContentFrame.noDataText2 = fs2
    end
    if priceContentFrame.noDataText1 then
        priceContentFrame.noDataText1:SetText(L("UI_NO_SEARCH_YET"))
        priceContentFrame.noDataText1:Show()
    end
    if priceContentFrame.noDataText2 then
        priceContentFrame.noDataText2:SetText(L("UI_NO_SEARCH_YET_2"))
        priceContentFrame.noDataText2:Show()
    end

    if not priceContentFrame.noDataFavBtn then
        local btn = CreateFrame("Button", nil, priceContentFrame, "UIPanelButtonTemplate")
        btn:SetSize(120, 24)
        btn:SetText(L("UI_NO_DATA_FAV_BTN"))
        btn:SetPoint("TOP", priceContentFrame.noDataText2, "BOTTOM", 0, -18)
        btn:SetScript("OnClick", function()
            local MainFrame = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("MainFrame")
            if MainFrame and MainFrame.ShowPanel then
                MainFrame:ShowPanel("FavoritePanel")
            end
        end)
        btn:SetScript("OnEnter", function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("UI_NO_DATA_FAV_BTN"), 1, 1, 1)
                GameTooltip:AddLine(L("UI_NO_DATA_FAV_TT"), nil, nil, nil, true)
                GameTooltip:Show()
            end
        end)
        btn:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
        priceContentFrame.noDataFavBtn = btn
    end
    if priceContentFrame.noDataFavBtn then
        priceContentFrame.noDataFavBtn:Show()
        local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
        if Skin and Skin.ApplyPricePanel then
            Skin:ApplyPricePanel(priceContentFrame)
        end
    end
    if priceContentFrame.itemFrame then
        priceContentFrame.itemFrame:Hide()
        if priceContentFrame.itemFrame.__GFA_HideInlineCopy then
            priceContentFrame.itemFrame.__GFA_HideInlineCopy()
        elseif priceContentFrame.itemFrame.copyBox then
            priceContentFrame.itemFrame.copyBox:Hide()
            priceContentFrame.itemFrame.copyBox:ClearFocus()
        end
        local itemFrame = priceContentFrame.itemFrame
        itemFrame.nameText:SetText(L("UI_SELECT_ITEM"))
        itemFrame.nameText:SetTextColor(0.7, 0.7, 0.7)
        itemFrame.nameText:ClearAllPoints()
        if itemFrame.icon then
            itemFrame.nameText:SetPoint("TOPLEFT", itemFrame.icon, "TOPRIGHT", 5, 0)
        else
            itemFrame.nameText:SetPoint("TOPLEFT", itemFrame, "TOPLEFT", 8, -8)
        end
        itemFrame.nameText:SetJustifyH("LEFT")
        if itemFrame.stackSizeInput and itemFrame.stackSizeInput.IsShown and itemFrame.stackSizeInput:IsShown() then
            itemFrame.nameText:SetPoint("RIGHT", itemFrame.stackSizeInput, "LEFT", -8, 0)
        else
            itemFrame.nameText:SetPoint("RIGHT", itemFrame, "RIGHT", -10, 0)
        end
        priceContentFrame.itemFrame.idText:SetText("")
        priceContentFrame.itemFrame.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        if priceContentFrame.itemFrame.boughtText then
            priceContentFrame.itemFrame.boughtText:Hide()
            priceContentFrame.itemFrame._boughtCount = 0
            priceContentFrame.itemFrame._boughtMode = nil
            priceContentFrame.itemFrame._boughtToken = (tonumber(priceContentFrame.itemFrame._boughtToken) or 0) + 1
        end
        if priceContentFrame.itemFrame.iconBorder then priceContentFrame.itemFrame.iconBorder:SetColorTexture(0, 0, 0, 0) end
        if priceContentFrame.itemFrame.favBtn then priceContentFrame.itemFrame.favBtn:Hide() end
        if priceContentFrame.itemFrame.copyBtn then priceContentFrame.itemFrame.copyBtn:Hide() end
        if priceContentFrame.itemFrame.listBtn then priceContentFrame.itemFrame.listBtn:Hide() end
        if priceContentFrame.itemFrame.buyBtn then priceContentFrame.itemFrame.buyBtn:Hide() end
        if priceContentFrame.itemFrame.switchBtn then priceContentFrame.itemFrame.switchBtn:Hide() end
        if priceContentFrame.itemFrame.inventoryBtn then priceContentFrame.itemFrame.inventoryBtn:Hide() end
    end
    if priceContentFrame.statsFrame then
        for key, value in pairs(priceContentFrame.stats) do
            if value and value.SetEmpty then value:SetEmpty() end
        end
        priceContentFrame.statsFrame.countText:SetText("")
        priceContentFrame.statsFrame:Hide()
    end
    if priceContentFrame.historyFrame then
        if priceContentFrame.historyFrame.countText then priceContentFrame.historyFrame.countText:SetText("") end
        local hf = priceContentFrame.historyFrame
        if hf.valLowUnit then hf.valLowUnit:SetEmpty() end
        if hf.valLowStack then hf.valLowStack:SetEmpty() end
        priceContentFrame.historyFrame:Hide()
    end

    if priceContentFrame.compareFrame then
        if priceContentFrame.compareFrame.valUnit then priceContentFrame.compareFrame.valUnit:SetText("-") end
        if priceContentFrame.compareFrame.valStack then priceContentFrame.compareFrame.valStack:SetText("-") end
        priceContentFrame.compareFrame:Hide()
    end
    if priceContentFrame.buyInfoFrame then
        if priceContentFrame.buyInfoFrame.linePay then priceContentFrame.buyInfoFrame.linePay:SetText("-") end
        if priceContentFrame.buyInfoFrame.lineSessionQty then priceContentFrame.buyInfoFrame.lineSessionQty:SetText("-") end
        if priceContentFrame.buyInfoFrame.lineSessionSpent then priceContentFrame.buyInfoFrame.lineSessionSpent:SetText("-") end
        priceContentFrame.buyInfoFrame:Hide()
    end

    if priceContentFrame.auctionWorkFrame then
        priceContentFrame.auctionWorkFrame:Hide()
        if priceContentFrame.auctionWorkFrame.summary then
            priceContentFrame.auctionWorkFrame.summary:SetText("")
        end
    end
end

function PricePanel:UpdateItem(itemID, itemLink)
    if not priceContentFrame then return end
    
    local itemChanged = (currentItemID ~= itemID)

    currentItemID = itemID
    currentItemLink = itemLink
    currentItemName = nil

    if itemChanged then
        priceContentFrame._gfaFirstPageMarketStats = nil
        priceContentFrame._gfaHistoryStatsSnapshot = nil

        if priceContentFrame.itemFrame.stackSizeInput then
            priceContentFrame.itemFrame.stackSizeInput:SetText("")
        end
        if priceContentFrame.itemFrame.numStacksInput then
            priceContentFrame.itemFrame.numStacksInput:SetText("")
        end
        if priceContentFrame.itemFrame.boughtText then
            priceContentFrame.itemFrame._boughtCount = 0
            priceContentFrame.itemFrame._boughtMode = nil
            priceContentFrame.itemFrame._boughtToken = (tonumber(priceContentFrame.itemFrame._boughtToken) or 0) + 1
        end
        if priceContentFrame.itemFrame.ResetBuySummary then
            priceContentFrame.itemFrame:ResetBuySummary(itemID)
        end
        
        if priceContentFrame.auctionWorkFrame then
            local w = priceContentFrame.auctionWorkFrame
            if w.bidRow then
                if w.bidRow.gold then w.bidRow.gold:SetText("") end
                if w.bidRow.silver then w.bidRow.silver:SetText("") end
                if w.bidRow.copper then w.bidRow.copper:SetText("") end
            end
            if w.buyoutRow then
                if w.buyoutRow.gold then w.buyoutRow.gold:SetText("") end
                if w.buyoutRow.silver then w.buyoutRow.silver:SetText("") end
                if w.buyoutRow.copper then w.buyoutRow.copper:SetText("") end
            end
        end
    end

    if not itemID or not itemLink then
        self:ShowNoData()
        return
    end

    if priceContentFrame.noDataIcon then
        priceContentFrame.noDataIcon:Hide()
    end
    if priceContentFrame.noDataText1 then
        priceContentFrame.noDataText1:Hide()
    end
    if priceContentFrame.noDataText2 then
        priceContentFrame.noDataText2:Hide()
    end
    if priceContentFrame.noDataFavBtn then
        priceContentFrame.noDataFavBtn:Hide()
    end
    if priceContentFrame.itemFrame then
        priceContentFrame.itemFrame:Show()
    end
    if priceContentFrame.statsFrame then
        priceContentFrame.statsFrame:Show()
    end
    if priceContentFrame.historyFrame then
        priceContentFrame.historyFrame:Show()
    end
    if priceContentFrame.compareFrame then
        if SHOW_COMPARE_SECTION then priceContentFrame.compareFrame:Show() else priceContentFrame.compareFrame:Hide() end
    end
    if priceContentFrame.buyInfoFrame then
        priceContentFrame.buyInfoFrame:Show()
    end

    if PricePanel and PricePanel.UpdateBuyInfoSession then
        PricePanel:UpdateBuyInfoSession()
    end
    if PricePanel and PricePanel.UpdateBuyInfoPreview then
        PricePanel:UpdateBuyInfoPreview()
    end

    local Database = GF_Auction:GetModule("Database")
    if not Database then self:ShowNoData() return end

    local name, link, quality, _, _, itemType, itemSubType, _, _, texture = GetItemInfo(itemLink)
    if name then
        local itemFrame = priceContentFrame.itemFrame
        local inlineCopyShown = itemFrame and itemFrame.copyBox and itemFrame.copyBox.IsShown and itemFrame.copyBox:IsShown() or false
        if (not inlineCopyShown) and itemFrame and itemFrame.__GFA_HideInlineCopy then
            itemFrame.__GFA_HideInlineCopy()
        end
        currentItemName = name
        if itemFrame and itemFrame.nameText then
            itemFrame.nameText:SetText(name)
            itemFrame.nameText:ClearAllPoints()
            itemFrame.nameText:SetPoint("TOPLEFT", itemFrame.icon, "TOPRIGHT", 5, 0)
            itemFrame.nameText:SetJustifyH("LEFT")
            if itemFrame.nameText.SetWordWrap then itemFrame.nameText:SetWordWrap(false) end
            if itemFrame.nameText.SetMaxLines then itemFrame.nameText:SetMaxLines(1) end
        end
        if inlineCopyShown and itemFrame and itemFrame.copyBox and itemFrame.copyBox.SetText then
            itemFrame.copyBox:SetText("\"" .. name .. "\"")
            if itemFrame.copyBox.HighlightText then
                itemFrame.copyBox:HighlightText(0, -1)
            end
        end
        
        if itemFrame and itemFrame.copyBtn then
            if inlineCopyShown then
                itemFrame.copyBtn:Hide()
            else
                itemFrame.copyBtn:Show()
            end
        end
        
        
        local r, g, b = GetItemQualityColor(quality or 0)
        if itemFrame and itemFrame.nameText then
            itemFrame.nameText:SetTextColor(r, g, b)
        end
        
        if itemFrame and itemFrame.iconBorder then
            itemFrame.iconBorder:SetColorTexture(r, g, b, 1)
        end
        
        if texture and itemFrame and itemFrame.icon then itemFrame.icon:SetTexture(texture) end
        
        local favs = Database:GetFavorites()
        local isFav = favs and favs[itemID]
        local favTex = itemFrame and itemFrame.favBtn and itemFrame.favBtn.tex
        if favTex then
            if itemFrame and itemFrame.favBtn then itemFrame.favBtn:Show() end
            if isFav then
                favTex:SetVertexColor(1, 0.82, 0, 1)
            else
                favTex:SetVertexColor(1, 1, 1, 1)
            end
        end
    end

    if PricePanel.UpdateControlsVisibility then
        PricePanel:UpdateControlsVisibility()
    else
        if priceContentFrame.itemFrame.listBtn then priceContentFrame.itemFrame.listBtn:SetShown(currentItemName ~= nil) end
        if priceContentFrame.itemFrame.buyBtn then priceContentFrame.itemFrame.buyBtn:SetShown(currentItemName ~= nil) end
    end

    local browsePage = GetBrowsePageIndex()
    local currentStats = GetCurrentMarketStats(itemID)
    local cache = priceContentFrame._gfaFirstPageMarketStats
    local effectiveStats = currentStats

    if browsePage == 0 then
    if currentStats then
            priceContentFrame._gfaFirstPageMarketStats = { itemID = itemID, stats = currentStats }
            cache = priceContentFrame._gfaFirstPageMarketStats
        elseif cache and cache.itemID == itemID and cache.stats then
            effectiveStats = cache.stats
        end
    elseif browsePage > 0 then
        if cache and cache.itemID == itemID and cache.stats then
            effectiveStats = cache.stats
        end
    end

    if effectiveStats then
        priceContentFrame.recommendedUnitPrice = effectiveStats.minUnit
        priceContentFrame.groupStack = effectiveStats.groupStack
        priceContentFrame.minStackTotal = effectiveStats.minStackTotal

        if priceContentFrame.stats.lowUnit then priceContentFrame.stats.lowUnit:SetMoney(effectiveStats.minUnit) end
        if priceContentFrame.stats.lowStack then priceContentFrame.stats.lowStack:SetMoney(effectiveStats.minStackTotal or 0) end

        if priceContentFrame.statsFrame.countText then
            local src = currentStats or effectiveStats
            local listings = (src and src.listings) or 0
            local totalQty = (src and src.totalQty) or 0
            priceContentFrame.statsFrame.countText:SetText(string.format(L("UI_BASED_ON_CURRENT"), "|cffffffff" .. listings .. "|r", "|cffffffff" .. totalQty .. "|r"))
        end

        if priceContentFrame.itemFrame and priceContentFrame.itemFrame.UpdateNativePrices then
            priceContentFrame.itemFrame.UpdateNativePrices()
        end
    else
        priceContentFrame.recommendedUnitPrice = nil
        priceContentFrame.groupStack = nil
        priceContentFrame.minStackTotal = nil

        if priceContentFrame.stats then
            for _, value in pairs(priceContentFrame.stats) do
                if value and value.SetEmpty then value:SetEmpty() end
            end
        end
        if priceContentFrame.statsFrame and priceContentFrame.statsFrame.countText then
            priceContentFrame.statsFrame.countText:SetText(string.format(L("UI_BASED_ON_CURRENT"), "|cffffffff0|r", "|cffffffff0|r"))
        end
    end

    local freezeHistory = (browsePage and browsePage > 0) or false
    local lastStats = self:UpdateHistoryList(itemID, freezeHistory)
    self:UpdateCompare(effectiveStats, lastStats)

    end

function PricePanel:UpdateHistoryList(itemID, freeze)
    if not priceContentFrame or not priceContentFrame.historyFrame then return end
    itemID = tonumber(itemID)
    if not itemID then return end

    local Database = GF_Auction:GetModule("Database")
    if not Database then return end
    local lastStats = nil

    local snap = priceContentFrame._gfaHistoryStatsSnapshot
    if freeze and snap and snap.itemID == itemID then
        lastStats = snap.stats
    else
        lastStats = Database:GetPriceStats(itemID)
        priceContentFrame._gfaHistoryStatsSnapshot = { itemID = itemID, stats = lastStats }
    end
    local hf = priceContentFrame.historyFrame

    if lastStats then
        if hf.valLowUnit then hf.valLowUnit:SetMoney(lastStats.minUnit or 0) end
        if hf.valLowStack then hf.valLowStack:SetMoney(lastStats.minStackTotal or 0) end
        if hf.countText then
            local tInfo = (lastStats.time and Utils and Utils.TimeAgo) and Utils:TimeAgo(lastStats.time, L) or nil
            local timeText = (tInfo and tInfo.text) or ""

            local ageSec = (tInfo and tInfo.ageSec) or 0
            local color = {0.6, 0.6, 0.6}
            if ageSec < 3600 then
                color = {0, 1, 0}
            elseif ageSec >= 86400 then
                color = {1, 0.2, 0.2}
            end

            hf.countText:SetText(L("UI_DATA_UPDATED") .. timeText)
            hf.countText:SetTextColor(unpack(color))
        end
    else
        if hf.valLowUnit then hf.valLowUnit:SetEmpty() end
        if hf.valLowStack then hf.valLowStack:SetEmpty() end
        if hf.countText then hf.countText:SetText(L("UI_NO_HISTORY")) end
        end

    return lastStats
end

function PricePanel:ClearHistoryList()
end

function PricePanel:Show()
    if priceContentFrame then
        priceContentFrame:Show()
        -- When switching back to this panel, force listing default mode to "stack"
        local w = priceContentFrame.auctionWorkFrame
        if w and w.ResetUnitModeDefault then
            w:ResetUnitModeDefault()
        end
    end
end

function PricePanel:Hide()
    if priceContentFrame then
        priceContentFrame:Hide()
end
end
