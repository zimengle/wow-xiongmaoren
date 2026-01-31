--[[
    GF_Auction ItemSelector Module
    Monitors auction house item selection and updates price display
]]

local L = GF_Auction_L
local Utils = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Utils")

-- Create ItemSelector module
local ItemSelector = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("ItemSelector", ItemSelector)
end

---@diagnostic disable: undefined-global

-- Current selected item
local selectedItemID = nil
local selectedItemLink = nil
local checkTimer = nil

local hooksReady = false
local manualOverride = false
local autoFollowFirst = true
local pinUntil = 0

local function Now()
    return (_G.GetTime and _G.GetTime()) or 0
end

local function GetActiveAuctionType()
    if _G.AuctionFrame and _G.AuctionFrame.type then
        if _G.AuctionFrame.type == "auction" then
            return "owner"
        end
        return _G.AuctionFrame.type
    end
    if _G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsShown and _G.AuctionFrameAuctions:IsShown() then
        return "owner"
    end
    if _G.AuctionFrameBid and _G.AuctionFrameBid.IsShown and _G.AuctionFrameBid:IsShown() then
        return "bid"
    end
    return "list"
end

-- Initialize module
function ItemSelector:Initialize()
    local EventManager = GF_Auction:GetModule("EventManager")
    if not EventManager then
        return false
    end

    EventManager:Subscribe(self, {
        "AUCTION_HOUSE_SHOW",
        "AUCTION_HOUSE_CLOSED",
        "AUCTION_ITEM_LIST_UPDATE",
        "NEW_AUCTION_UPDATE"
    }, function(event, ...)
        self:OnEvent(event, ...)
    end, 0.5)
 
    self:StartMonitoring()

    return true
end

-- Event handler
function ItemSelector:OnEvent(event, ...)
    if event == "AUCTION_HOUSE_SHOW" then
        manualOverride = false
        autoFollowFirst = true
        self:SetupHooks()
        self:StartMonitoring()
    elseif event == "AUCTION_HOUSE_CLOSED" then
        self:StopMonitoring()
        self:ClearSelection()
    elseif event == "AUCTION_ITEM_LIST_UPDATE" then
        local activeType = GetActiveAuctionType()
        if activeType == "list" then
            local success, index = pcall(function()
                return GetSelectedAuctionItem(activeType)
            end)
            if success then
                if not index or index == 0 then
                    manualOverride = false
                    autoFollowFirst = true
                else
                    local itemLink = GetAuctionItemLink(activeType, index)
                    if not itemLink then
                        manualOverride = false
                        autoFollowFirst = true
                    else
                        local ok, itemID = pcall(function()
                            local _, _, _, _, _, _, _,
                                  _, _, _, _, _,
                                  _, _, _, _, id = GetAuctionItemInfo(activeType, index)
                            return id
                        end)
                        if not ok or not itemID or itemID == 0 then
                            manualOverride = false
                            autoFollowFirst = true
                        end
                    end
                end
            else
                manualOverride = false
                autoFollowFirst = true
            end
        end
        C_Timer.After(0.2, function()
            self:CheckSelection(true)
        end)
    elseif event == "NEW_AUCTION_UPDATE" then
        C_Timer.After(0.1, function()
            self:TryAutoFillSellPrices()
        end)
    end
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
    local g = n(goldBox)
    local s = n(silverBox)
    local c = n(copperBox)
    return (g * 10000) + (s * 100) + c
end

local function IsEmptyMoneyBoxes(goldBox, silverBox, copperBox)
    return GetCopperFromBoxes(goldBox, silverBox, copperBox) == 0
end

local function SetMoneyBoxes(goldBox, silverBox, copperBox, copperValue)
    if not (goldBox and silverBox and copperBox) then return end
    local g, s, c = SplitCopper(copperValue)
    if goldBox.SetText then goldBox:SetText(tostring(g)) end
    if silverBox.SetText then silverBox:SetText(string.format("%02d", s)) end
    if copperBox.SetText then copperBox:SetText(string.format("%02d", c)) end
end

local cachedBrowsePricing = {}
local MAX_BROWSE_CACHE = 25
local tempPruneList = {}

local function PruneBrowseCache()
    local now = Now()
    local n = 0
    for itemID, v in pairs(cachedBrowsePricing) do
        n = n + 1
        if type(v) ~= "table" or (v.expires and v.expires <= now) then
            cachedBrowsePricing[itemID] = nil
            n = n - 1
        end
    end

    if n <= MAX_BROWSE_CACHE then return end

    wipe(tempPruneList)
    for itemID, v in pairs(cachedBrowsePricing) do
        if type(v) == "table" then
            table.insert(tempPruneList, { id = itemID, last = tonumber(v.lastAccess) or 0 })
        end
    end
    table.sort(tempPruneList, function(a, b) return a.last < b.last end)
    for i = 1, math.max(0, #tempPruneList - MAX_BROWSE_CACHE) do
        cachedBrowsePricing[tempPruneList[i].id] = nil
    end
end

local function CacheBrowsePricingForItem(itemID, seconds)
    itemID = tonumber(itemID)
    seconds = tonumber(seconds or 0) or 0
    if not itemID or seconds <= 0 then
        return
    end
    if not _G.GetNumAuctionItems or not _G.GetAuctionItemInfo then
        return
    end

    local numBatch = 0
    local ok = pcall(function()
        local a = _G.GetNumAuctionItems("list")
        numBatch = tonumber(a) or 0
    end)
    if not ok or numBatch <= 0 then
        return
    end

    local stacks = {}

    for i = 1, numBatch do
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
                local qty = tonumber(count) or 0
                if bo > 0 and qty > 0 then
                    if (not stacks[qty]) or bo < stacks[qty] then
                        stacks[qty] = bo
                    end
                end
            end
        end
    end

    cachedBrowsePricing[itemID] = {
        expires = Now() + seconds,
        lastAccess = Now(),
        stacks = stacks,
    }
    PruneBrowseCache()
end

function ItemSelector:CacheBrowsePricing(itemID, seconds)
    CacheBrowsePricingForItem(itemID, seconds)
end

function ItemSelector:TryAutoFillSellPrices()
    if not _G.AuctionFrame or not _G.AuctionFrame:IsVisible() then
        return false
    end
    if not (_G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsShown and _G.AuctionFrameAuctions:IsShown()) then
        if not (_G.AuctionFrame and _G.AuctionFrame.type == "auction") then
            return false
        end
    end

    if not _G.GetAuctionSellItemInfo then
        return false
    end

    local name, _, count, _, _, _, _, stackCount, _, sellItemID = _G.GetAuctionSellItemInfo()
    sellItemID = tonumber(sellItemID)
    if not name or not sellItemID or sellItemID == 0 then
        return false
    end

    local stackSize = tonumber(count) or 1
    if stackSize <= 0 then stackSize = 1 end

    PruneBrowseCache()
    local cache = cachedBrowsePricing[sellItemID]
    local stacks = {}
    
    if cache and cache.expires and cache.expires > Now() then
        cache.lastAccess = Now()
        stacks = cache.stacks or {}
    else
        CacheBrowsePricingForItem(sellItemID, 5.0)
        cache = cachedBrowsePricing[sellItemID]
        if cache and cache.stacks then
            cache.lastAccess = Now()
            stacks = cache.stacks
        end
    end
    
    local cachedTotal = stacks[stackSize]
    if not cachedTotal or cachedTotal <= 0 then
        local Database = GF_Auction:GetModule("Database")
        if Database then
            local lastStats = Database:GetPriceStats(sellItemID)
            if lastStats and lastStats.minStackTotal and lastStats.groupStack == stackSize then
                cachedTotal = lastStats.minStackTotal
            elseif lastStats and lastStats.minUnit and stackSize > 0 then
                cachedTotal = lastStats.minUnit * stackSize
            end
        end
    end
    
    if not cachedTotal or cachedTotal <= 0 then
        return false
    end

    local buyoutTotal = math.max(1, math.floor(cachedTotal - 1))

    local startTotal = buyoutTotal

    if _G.BuyoutPriceGold and _G.BuyoutPriceSilver and _G.BuyoutPriceCopper then
        SetMoneyBoxes(_G.BuyoutPriceGold, _G.BuyoutPriceSilver, _G.BuyoutPriceCopper, buyoutTotal)
    end

    if _G.StartPriceGold and _G.StartPriceSilver and _G.StartPriceCopper then
        SetMoneyBoxes(_G.StartPriceGold, _G.StartPriceSilver, _G.StartPriceCopper, startTotal)
    end

    return true
end

function ItemSelector:SetupHooks()
    if hooksReady then
        return
    end

    if _G.AuctionFrameBrowse_Search and hooksecurefunc then
        hooksecurefunc("AuctionFrameBrowse_Search", function()
            manualOverride = false
            autoFollowFirst = true
        end)
    end

    if _G.AuctionFrameBrowse and _G.NUM_BROWSE_TO_DISPLAY then
        for i = 1, _G.NUM_BROWSE_TO_DISPLAY do
            local btn = _G["BrowseButton" .. i]
            if btn and btn.HookScript then
                if btn.RegisterForClicks then
                    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                end

                btn:HookScript("OnClick", function(selfBtn, mouseButton)
                    if mouseButton == "RightButton" then
                        local id = selfBtn and selfBtn.GetID and selfBtn:GetID()
                        id = tonumber(id)
                        if not id then return end

                        local offset = 0
                        if _G.FauxScrollFrame_GetOffset and _G.BrowseScrollFrame then
                            offset = tonumber(_G.FauxScrollFrame_GetOffset(_G.BrowseScrollFrame)) or 0
                        end
                        local listIndex = id + offset

                        local itemLink = _G.GetAuctionItemLink and _G.GetAuctionItemLink("list", listIndex)
                        if not itemLink then return end

                        local itemID = nil
                        if _G.GetAuctionItemInfo then
                            local ok, rid = pcall(function()
                                local _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, rid2 = _G.GetAuctionItemInfo("list", listIndex)
                                return rid2
                            end)
                            if ok and rid then itemID = tonumber(rid) end
                        end
                        if not itemID then
                            itemID = Utils and Utils.ParseItemID and Utils:ParseItemID(itemLink)
                        end
                        if not itemID then return end

                        local Database = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Database")
                        if not Database then return end

                        local favs = Database.GetFavorites and Database:GetFavorites()
                        if favs and favs[itemID] then
                            if GF_Auction and GF_Auction.Print and L then
                                local name = GetItemInfo(itemLink) or itemLink
                                GF_Auction.Print(string.format(L("UI_FAV_EXISTS"), name), 1, 1, 0)
                            end
                            return
                        end

                        Database:AddFavorite(itemID, itemLink)
                        if GF_Auction and GF_Auction.Print and L then
                            local name = GetItemInfo(itemLink) or itemLink
                            GF_Auction.Print(string.format(L("UI_FAV_ADDED"), name), 0, 1, 0)
                        end

                        return
                    end

                    manualOverride = true
                end)
            end
        end
    end

    hooksReady = true
end

-- Start monitoring item selection
function ItemSelector:StartMonitoring()
    if checkTimer then
        return
    end

    checkTimer = C_Timer.NewTicker(0.5, function()
        self:CheckSelection()
    end)
end

-- Stop monitoring
function ItemSelector:StopMonitoring()
    if checkTimer then
        checkTimer:Cancel()
        checkTimer = nil
    end
end

-- Check current selection
function ItemSelector:CheckSelection(forceRefresh)
    local itemID, itemLink = self:GetSelectedItem()

    if (not itemID or not itemLink) and selectedItemID and pinUntil > Now() then
        return
    end

    if (not itemID or not itemLink) and _G.AuctionFrameBrowse and _G.AuctionFrameBrowse.IsShown and _G.AuctionFrameBrowse:IsShown() then
        if selectedItemID then
            manualOverride = false
            autoFollowFirst = true
            itemID, itemLink = self:GetSelectedItem()
        end
    end

    if itemID ~= selectedItemID then
        selectedItemID = itemID
        selectedItemLink = itemLink

        if itemID and itemLink then
            self:UpdatePriceDisplay(itemID, itemLink)
        end
    elseif forceRefresh and itemID and itemLink then
        self:UpdatePriceDisplay(itemID, itemLink)
    end
end

function ItemSelector:PinSelection(seconds)
    local s = tonumber(seconds or 0) or 0
    if s < 0 then s = 0 end
    pinUntil = Now() + s
end

local function GetContainerLink(bag, slot)
    if _G.C_Container and _G.C_Container.GetContainerItemLink then
        return _G.C_Container.GetContainerItemLink(bag, slot)
    end
    if _G.GetContainerItemLink then
        return _G.GetContainerItemLink(bag, slot)
    end
    return nil
end

local function PickupContainer(bag, slot)
    if _G.C_Container and _G.C_Container.PickupContainerItem then
        return _G.C_Container.PickupContainerItem(bag, slot)
    end
    if _G.PickupContainerItem then
        return _G.PickupContainerItem(bag, slot)
    end
end

function ItemSelector:TryAutoPlaceSelectedItem(itemID)
    local targetItemID = tonumber(itemID) or selectedItemID
    if not targetItemID then
        return false
    end
    if not _G.AuctionFrame or not _G.AuctionFrame:IsVisible() then
        return false
    end

    if not (_G.AuctionFrameAuctions and _G.AuctionFrameAuctions.IsShown and _G.AuctionFrameAuctions:IsShown()) then
        if not (_G.AuctionFrame and _G.AuctionFrame.type == "auction") then
            return false
        end
    end

    if _G.GetAuctionSellItemInfo then
        local _, _, _, _, _, _, _, _, _, placedItemID = _G.GetAuctionSellItemInfo()
        placedItemID = tonumber(placedItemID)
        if placedItemID and placedItemID ~= 0 then
            if placedItemID == targetItemID then
                return true
            end
            pcall(function()
                if _G.ClearCursor then _G.ClearCursor() end
                if _G.ClickAuctionSellItemButton then
                    _G.ClickAuctionSellItemButton() -- pick up from slot
                elseif _G.AuctionsItemButton and _G.AuctionsItemButton.Click then
                    _G.AuctionsItemButton:Click()
                end
                if _G.ClearCursor then _G.ClearCursor() end
            end)
        end
    end

    local maxBag = _G.NUM_BAG_SLOTS or 4
    for bag = 0, maxBag do
        local numSlots = _G.GetContainerNumSlots and _G.GetContainerNumSlots(bag) or (_G.C_Container and _G.C_Container.GetContainerNumSlots and _G.C_Container.GetContainerNumSlots(bag))
        if numSlots and numSlots > 0 then
            for slot = 1, numSlots do
                local link = GetContainerLink(bag, slot)
                if link then
                    local id = Utils and Utils.ParseItemID and Utils:ParseItemID(link)
                    if id == targetItemID then
                        pcall(function()
                            if _G.ClearCursor then _G.ClearCursor() end
                            PickupContainer(bag, slot)
                            if _G.ClickAuctionSellItemButton then
                                _G.ClickAuctionSellItemButton()
                            elseif _G.AuctionsItemButton and _G.AuctionsItemButton.Click then
                                _G.AuctionsItemButton:Click()
                            end
                        end)
                        return true
                    end
                end
            end
        end
    end

    return false
end

-- Get selected item from auction house
function ItemSelector:GetSelectedItem()
    if C_AuctionHouse and C_AuctionHouse.GetBrowseResults then
        return self:GetSelectedItemNewAPI()
    end

    if GetSelectedAuctionItem then
        return self:GetSelectedItemClassicAPI()
    end

    return nil, nil
end

-- Get selected item using new API
function ItemSelector:GetSelectedItemNewAPI()
    local success, results = pcall(function()
        return C_AuctionHouse.GetBrowseResults()
    end)

    if not success or not results then
        return nil, nil
    end

    return nil, nil
end

-- Get selected item using classic API
function ItemSelector:GetSelectedItemClassicAPI()
    local activeType = GetActiveAuctionType()
    local success, index = pcall(function()
        return GetSelectedAuctionItem(activeType)
    end)

    if not success or not index then
        return nil, nil
    end

    if index == 0 then
        if selectedItemID and selectedItemLink and not (_G.AuctionFrameBrowse and _G.AuctionFrameBrowse.IsShown and _G.AuctionFrameBrowse:IsShown()) then
            return selectedItemID, selectedItemLink
        end
        if autoFollowFirst and not manualOverride and _G.AuctionFrameBrowse and _G.AuctionFrameBrowse.IsShown and _G.AuctionFrameBrowse:IsShown() then
            return self:GetFirstBrowseItem()
        end
        return nil, nil
    end

    local itemLink = GetAuctionItemLink(activeType, index)
    if not itemLink then
        if _G.AuctionFrameBrowse and _G.AuctionFrameBrowse.IsShown and _G.AuctionFrameBrowse:IsShown() and autoFollowFirst then
            manualOverride = false
            return self:GetFirstBrowseItem()
        end
        return nil, nil
    end

    local itemID = nil
    local success2, data = pcall(function()
        local name, texture, count, quality, canUse, level, levelColHeader,
              minBid, minIncrement, buyoutPrice, bidAmount, highBidder,
              bidderFullName, owner, ownerFullName, saleStatus, id, hasAllInfo = GetAuctionItemInfo(activeType, index)
        return id
    end)

    if success2 and data then
        itemID = data
    else
        itemID = Utils and Utils.ParseItemID and Utils:ParseItemID(itemLink)
    end

    if not itemID or itemID == 0 then
        if _G.AuctionFrameBrowse and _G.AuctionFrameBrowse.IsShown and _G.AuctionFrameBrowse:IsShown() and autoFollowFirst then
            manualOverride = false
            return self:GetFirstBrowseItem()
        end
        return nil, nil
    end

    return itemID, itemLink
end

function ItemSelector:GetFirstBrowseItem()
    local ok, num = pcall(function()
        return GetNumAuctionItems("list")
    end)
    if not ok or not num or num <= 0 then
        return nil, nil
    end

    local itemLink = GetAuctionItemLink("list", 1)
    if not itemLink then
        return nil, nil
    end

    local itemID = nil
    local ok2, data = pcall(function()
        local _, _, _, _, _, _, _,
              _, _, _, _, _,
              _, _, _, _, id = GetAuctionItemInfo("list", 1)
        return id
    end)
    if ok2 and data then
        itemID = data
    else
        itemID = Utils and Utils.ParseItemID and Utils:ParseItemID(itemLink)
    end

    autoFollowFirst = true
    return itemID, itemLink
end

-- Update price display
function ItemSelector:UpdatePriceDisplay(itemID, itemLink)
    local MainFrame = GF_Auction:GetModule("MainFrame")
    if MainFrame then
        MainFrame:UpdatePriceDisplay(itemID, itemLink)
    end
end

-- Clear selection
function ItemSelector:ClearSelection()
    selectedItemID = nil
    selectedItemLink = nil
    self:UpdatePriceDisplay(nil, nil)
end

-- Get current selection
function ItemSelector:GetSelection()
    return selectedItemID, selectedItemLink
end

-- Cleanup
function ItemSelector:Cleanup()
    self:StopMonitoring()
    self:ClearSelection()

    local EventManager = GF_Auction:GetModule("EventManager")
    if EventManager then
        EventManager:UnsubscribeAll(self)
    end
end

