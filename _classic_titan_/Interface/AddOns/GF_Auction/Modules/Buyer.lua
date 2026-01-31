--[[
    GF_Auction Buyer Module
    Handles quick buying of auction items
]]

local L = GF_Auction_L
local Utils = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Utils")

-- Create Buyer module
local Buyer = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("Buyer", Buyer)
end

local pendingTransactions = {}
local followPref = nil
local pendingConfirm = nil

local function Now()
    return (_G.GetTime and _G.GetTime()) or 0
end

local function DispatchPurchaseResult(result)
    if not result then return end
    Buyer._purchaseListeners = Buyer._purchaseListeners or {}
    for _, fn in ipairs(Buyer._purchaseListeners) do
        if type(fn) == "function" then
            pcall(fn, result)
        end
    end
end

function Buyer:RegisterPurchaseListener(fn)
    if type(fn) ~= "function" then return false end
    self._purchaseListeners = self._purchaseListeners or {}
    table.insert(self._purchaseListeners, fn)
    return true
end

function Buyer:GetFollowPreferredStackSize(itemID)
    itemID = tonumber(itemID) or 0
    if itemID <= 0 then return nil end
    local now = Now()
    if followPref and followPref.untilTime and now > followPref.untilTime then
        followPref = nil
    end
    if followPref and followPref.itemID == itemID and followPref.stackSize and followPref.stackSize > 0 then
        return tonumber(followPref.stackSize)
    end
    return nil
end

function Buyer:Initialize()
    local f = CreateFrame("Frame")
    f:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    f:RegisterEvent("UI_ERROR_MESSAGE")
    f:SetScript("OnEvent", function(_, event, ...)
        local now = Now()
        if event == "AUCTION_ITEM_LIST_UPDATE" then
            pendingTransactions = {}
            if followPref and followPref.untilTime and now > followPref.untilTime then
                followPref = nil
            end
            return
        end

        if event == "UI_ERROR_MESSAGE" then
            if not pendingConfirm or pendingConfirm.done then return end
            if pendingConfirm.startedAt and (now - pendingConfirm.startedAt) > 2.0 then
                return
            end
            pendingConfirm.failed = true
            pendingConfirm.failReason = tostring((select(2, ...)) or "")
        end
    end)

    return true
end

function Buyer:GetAvailableAuctions(itemID)
    itemID = tonumber(itemID)
    if not itemID or not _G.GetNumAuctionItems or not _G.GetAuctionItemInfo then
        return {}
    end

    local numBatch = 0
    local ok = pcall(function()
        local a = _G.GetNumAuctionItems("list")
        numBatch = tonumber(a) or 0
    end)
    if not ok or numBatch <= 0 then
        return {}
    end

    local auctions = {}
    for i = 1, numBatch do
        if not pendingTransactions[i] then
            local ok2, buyoutPrice, count, rowItemID = pcall(function()
                local _, _, c, _, _, _, _,
                    _, _, bo, _, _, _,
                    _, _, _, id = _G.GetAuctionItemInfo("list", i)
                return bo, c, id
            end)
    
            if ok2 then
                local rid = tonumber(rowItemID)
                if not rid then
                    local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", i)
                    if link then
                        rid = Utils and Utils.ParseItemID and Utils:ParseItemID(link)
                    end
                end
    
                if rid == itemID then
                    local bo = tonumber(buyoutPrice) or 0
                    local qty = tonumber(count) or 1
                    if bo > 0 and qty > 0 then
                        local unit = math.floor(bo / qty)
                        table.insert(auctions, {
                            index = i,
                            buyoutPrice = bo,
                            quantity = qty,
                            unitPrice = unit
                        })
                    end
                end
            end
        end
    end

    table.sort(auctions, function(a, b)
        return a.unitPrice < b.unitPrice
    end)

    return auctions
end

function Buyer:GetAvailableAuctionsFollowStack(itemID, stackSize)
    itemID = tonumber(itemID)
    stackSize = tonumber(stackSize)
    if not itemID or not stackSize or stackSize <= 0 or not _G.GetNumAuctionItems or not _G.GetAuctionItemInfo then
        return {}
    end

    local numBatch = 0
    local ok = pcall(function()
        local a = _G.GetNumAuctionItems("list")
        numBatch = tonumber(a) or 0
    end)
    if not ok or numBatch <= 0 then
        return {}
    end

    local auctions = {}
    for i = 1, numBatch do
        if not pendingTransactions[i] then
            local ok2, buyoutPrice, count, rowItemID = pcall(function()
                local _, _, c, _, _, _, _,
                    _, _, bo, _, _, _,
                    _, _, _, id = _G.GetAuctionItemInfo("list", i)
                return bo, c, id
            end)

            if ok2 then
                local rid = tonumber(rowItemID)
                if not rid then
                    local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", i)
                    if link then
                        rid = Utils and Utils.ParseItemID and Utils:ParseItemID(link)
                    end
                end

                if rid == itemID then
                    local bo = tonumber(buyoutPrice) or 0
                    local qty = tonumber(count) or 1
                    if bo > 0 and qty == stackSize then
                        local unit = math.floor(bo / qty)
                        table.insert(auctions, {
                            index = i,
                            buyoutPrice = bo,
                            quantity = qty,
                            unitPrice = unit
                        })
                    end
                end
            end
        end
    end

    table.sort(auctions, function(a, b)
        if a.buyoutPrice ~= b.buyoutPrice then
            return a.buyoutPrice < b.buyoutPrice
        end
        return a.unitPrice < b.unitPrice
    end)

    return auctions
end

function Buyer:BuyItem(itemID, itemLink)
    itemID = tonumber(itemID)
    
    if not itemID or itemID == 0 then return false, "Invalid item", 0, false end

    if pendingConfirm and not pendingConfirm.done and (Now() - (pendingConfirm.startedAt or 0)) < 2.0 then
        return false, L("UI_BUY_PENDING") or "Pending", 0, false
    end
    
    local targetAuction = nil
    local selectedIndex = _G.GetSelectedAuctionItem and _G.GetSelectedAuctionItem("list")
    local now = Now()
    if followPref and ((followPref.untilTime and now > followPref.untilTime) or (followPref.itemID and followPref.itemID ~= itemID)) then
        followPref = nil
    end
    
    if selectedIndex and selectedIndex > 0 then
        local okSel, _, _, count, _, _, _, _, _, _, buyoutPrice, _, _, _, _, _, _, rowItemID = pcall(function()
             return _G.GetAuctionItemInfo("list", selectedIndex)
        end)
        
        if okSel then
             local rid = tonumber(rowItemID)
             if not rid then
                 local link = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", selectedIndex)
                 if link then
                     rid = Utils and Utils.ParseItemID and Utils:ParseItemID(link)
                 end
             end
             
             if rid == itemID then
                 local bo = tonumber(buyoutPrice) or 0
                 local qty = tonumber(count) or 1
                 if bo > 0 then
                     targetAuction = {
                         index = selectedIndex,
                         buyoutPrice = bo,
                         quantity = qty,
                         unitPrice = bo / qty
                     }
                 end
             end
        end
    end

    if not targetAuction then
        if followPref and followPref.itemID == itemID and followPref.stackSize and (not selectedIndex or selectedIndex == 0) then
            local auctions2 = self:GetAvailableAuctionsFollowStack(itemID, followPref.stackSize)
            if #auctions2 > 0 then
                targetAuction = auctions2[1]
            else
                followPref = nil
            end
        end
    end

    if not targetAuction then
        local auctions = self:GetAvailableAuctions(itemID)
        if #auctions == 0 then return false, L("UI_BUY_NO_AUCTIONS"), 0, false end
        targetAuction = auctions[1]
    end

    local price = targetAuction.buyoutPrice
    if not price or price <= 0 then price = targetAuction.minBid end

    if GetMoney() < price then
        return false, L("UI_BUY_INSUFFICIENT_FUNDS"), 0, false
    end

    local moneyBefore = _G.GetMoney and _G.GetMoney() or 0
    local success, err = pcall(function()
        _G.PlaceAuctionBid("list", targetAuction.index, price)
    end)

    local itemName = itemLink or "item"
    if itemLink then
        local name = GetItemInfo(itemLink)
        if name and name ~= "" then itemName = name end
    end

    if success then
        pendingTransactions[targetAuction.index] = true

        local maxStack2 = nil
        local okInfo2, stack2 = pcall(function()
            return select(8, GetItemInfo(itemLink or itemID))
        end)
        if okInfo2 then
            maxStack2 = tonumber(stack2)
        end
        local isFullStack = (maxStack2 and maxStack2 > 0 and targetAuction.quantity == maxStack2) or false

        local token = (self._confirmToken or 0) + 1
        self._confirmToken = token
        pendingConfirm = {
            token = token,
            startedAt = Now(),
            moneyBefore = tonumber(moneyBefore) or 0,
            expectedCost = tonumber(price) or 0,
            itemID = itemID,
            itemLink = itemLink,
            qty = tonumber(targetAuction.quantity) or 0,
            isFullStack = isFullStack,
            maxStack = tonumber(maxStack2) or 0,
            selectedIndex = tonumber(selectedIndex) or 0,
            auctionIndex = tonumber(targetAuction.index) or 0,
        }

        if _G.C_Timer and _G.C_Timer.After then
            local maxWait = 2.0
            local interval = 0.2
            local function check()
                if not pendingConfirm or pendingConfirm.done then return end
                if pendingConfirm.token ~= token then return end

                local now2 = Now()
                local elapsed = now2 - (pendingConfirm.startedAt or now2)

                local moneyAfter = _G.GetMoney and _G.GetMoney() or 0
                local delta = (tonumber(pendingConfirm.moneyBefore) or 0) - (tonumber(moneyAfter) or 0)
                local cost = tonumber(pendingConfirm.expectedCost) or 0
                local okPaid = cost > 0 and delta >= cost
                local failed = pendingConfirm.failed == true

                if okPaid or failed or elapsed >= maxWait then
                    pendingConfirm.done = true

                    if okPaid and not failed then
                        if pendingConfirm.selectedIndex and pendingConfirm.selectedIndex > 0 and pendingConfirm.isFullStack then
                            followPref = {
                                itemID = pendingConfirm.itemID,
                                stackSize = pendingConfirm.maxStack,
                                untilTime = Now() + 30
                            }
                        else
                            followPref = nil
                        end

                        DispatchPurchaseResult({
                            success = true,
                            itemID = pendingConfirm.itemID,
                            qty = pendingConfirm.qty,
                            isFullStack = pendingConfirm.isFullStack,
                            maxStack = pendingConfirm.maxStack,
                            spentCopper = cost,
                        })
                    else
                        DispatchPurchaseResult({
                            success = false,
                            itemID = pendingConfirm.itemID,
                            qty = pendingConfirm.qty,
                            isFullStack = pendingConfirm.isFullStack,
                            maxStack = pendingConfirm.maxStack,
                            spentCopper = 0,
                            reason = pendingConfirm.failReason or "",
                        })
                    end

                    if pendingConfirm.auctionIndex and pendingConfirm.auctionIndex > 0 then
                        pendingTransactions[pendingConfirm.auctionIndex] = nil
                    end
                    return
                end

                _G.C_Timer.After(interval, check)
            end

            _G.C_Timer.After(interval, check)
        end

        return true, "", targetAuction.quantity, false, isFullStack, (maxStack2 or 0), 0
    else
        local selectSuccess = pcall(function()
            local browseButton = _G["BrowseButton" .. targetAuction.index]
            if browseButton and browseButton:IsVisible() then
                browseButton:Click()
            elseif _G.AuctionFrameBrowse_SelectAuction then
                _G.AuctionFrameBrowse_SelectAuction("list", targetAuction.index)
            end
        end)
        
        if selectSuccess then
             pcall(function()
                local buyoutButton = _G.BrowseBuyoutButton or 
                                     _G.AuctionFrameBrowse_BuyButton or
                                     _G.BrowseBuyoutButton
                if buyoutButton and buyoutButton:IsEnabled() and buyoutButton:IsVisible() then
                    buyoutButton:Click()
                end
            end)
        end
        return true, "Please confirm", targetAuction.quantity, false, false, 0, 0
    end
end

function Buyer:QuickBuy(itemID, itemLink)
    local success, msg, _, purchased = self:BuyItem(itemID, itemLink)
    return success, msg, purchased
end
