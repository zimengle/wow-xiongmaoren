--[[
    GF_Auction PriceHistory Module
    Automatically records auction house item prices
]]

local L = GF_Auction_L

local PriceHistory = {}

---@diagnostic disable: undefined-global

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("PriceHistory", PriceHistory)
end

local tempStackAgg = {}

-- Module state
local enabled = true
local isRecording = false
local lastRecordTime = 0
local recordThrottle = 2.0

local function BuildWantedSet(Database)
    local wanted = {}

    if Database and Database.GetFavorites then
        local favs = Database:GetFavorites()
        if type(favs) == "table" then
            for itemID, _ in pairs(favs) do
                itemID = tonumber(itemID)
                if itemID and itemID > 0 then
                    wanted[itemID] = true
                end
            end
        end
    end

    if _G.GetSelectedAuctionItem and _G.GetAuctionItemInfo then
        local okSel, idx = pcall(_G.GetSelectedAuctionItem, "list")
        idx = okSel and (tonumber(idx) or 0) or 0
        if idx > 0 then
            local okInfo, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, itemIDAny = pcall(function()
                ---@diagnostic disable-next-line: param-type-mismatch
                return _G.GetAuctionItemInfo("list", idx)
            end)
            local itemID = okInfo and (tonumber(itemIDAny) or 0) or 0
            if itemID <= 0 then itemID = 0 end
            if itemID and itemID > 0 then
                wanted[itemID] = true
            end
        end
    end

    return wanted
end

local function SaveStatsFromBest(Database, best, wanted)
    if not Database or not Database.SavePriceStats or not best then
        return
    end

    for itemID, stacks in pairs(best) do
        itemID = tonumber(itemID)
        local isWanted = true
        if wanted and next(wanted) ~= nil then
            isWanted = wanted[itemID] == true
        end

        if isWanted and itemID and itemID > 0 and type(stacks) == "table" then
            if tempStackAgg then
                wipe(tempStackAgg)
            else
                tempStackAgg = {}
            end
            local minUnit, maxUnit = nil, nil
            local maxStackSize = 0

            for stackSize, v in pairs(stacks) do
                local ss = tonumber(stackSize) or tonumber(v and v.stackSize) or 1
                if ss > 0 then
                    if ss > maxStackSize then maxStackSize = ss end
                    local minTotal = tonumber(v and (v.minPrice or v.price or v.buyoutPrice)) or 0
                    local maxTotal = tonumber(v and (v.maxPrice or v.price or v.buyoutPrice)) or minTotal
                    if minTotal > 0 then
                        local uMin = math.floor(minTotal / ss)
                        local uMax = math.floor(maxTotal / ss)
                        if not minUnit or uMin < minUnit then minUnit = uMin end
                        if not maxUnit or uMax > maxUnit then maxUnit = uMax end
                        tempStackAgg[ss] = { minTotal = minTotal, maxTotal = maxTotal }
                    end
                end
            end

            if minUnit and minUnit > 0 then
                local groupStack = nil
                if _G.GetItemInfo then
                    local _, _, _, _, _, _, _, stackCount = _G.GetItemInfo(itemID)
                    if stackCount and stackCount > 1 and tempStackAgg[stackCount] then
                        groupStack = stackCount
                    end
                end
                if not groupStack and maxStackSize > 0 and tempStackAgg[maxStackSize] then
                    groupStack = maxStackSize
                end

                local minStackTotal, maxStackTotal = nil, nil
                if groupStack and tempStackAgg[groupStack] then
                    minStackTotal = tempStackAgg[groupStack].minTotal
                    maxStackTotal = tempStackAgg[groupStack].maxTotal
                end

                Database:SavePriceStats(itemID, {
                    minUnit = minUnit,
                    maxUnit = maxUnit or minUnit,
                    minStackTotal = minStackTotal,
                    maxStackTotal = maxStackTotal or minStackTotal,
                    groupStack = groupStack,
                })
            end
        end
    end
end

local function GetClassicBrowseQueryName()
    local name = nil
    if _G.BrowseName and _G.BrowseName.GetText then
        name = _G.BrowseName:GetText()
    elseif _G.AuctionFrameBrowse and _G.AuctionFrameBrowse.GetName then
        local base = _G.AuctionFrameBrowse:GetName()
        local box = base and _G[base .. "SearchBar"] and _G[base .. "SearchBar"].SearchBox
        if box and box.GetText then
            name = box:GetText()
        end
    end
    if type(name) ~= "string" then return nil end
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    local changed = true
    while changed do
        changed = false
        if name:sub(1, 1) == "\"" or name:sub(1, 1) == "'" then
            name = name:sub(2)
            changed = true
        elseif name:sub(-1) == "\"" or name:sub(-1) == "'" then
            name = name:sub(1, -2)
            changed = true
        elseif #name >= 3 then
            local prefix = name:sub(1, 3)
            if prefix == "\226\128\156" or prefix == "\226\128\152" then
                name = name:sub(4)
                changed = true
            else
                local suffix = name:sub(-3)
                if suffix == "\226\128\157" or suffix == "\226\128\153" then
                    name = name:sub(1, -4)
                    changed = true
                end
            end
        end
    end

    if name == "" then return nil end
    return name
end

function PriceHistory:Initialize()
    local EventManager = GF_Auction:GetModule("EventManager")
    if not EventManager then
        return false
    end

    EventManager:Subscribe(self, {
        "AUCTION_HOUSE_SHOW",
        "AUCTION_HOUSE_CLOSED",
        "AUCTION_ITEM_LIST_UPDATE"
    }, function(event, ...)
        self:OnEvent(event, ...)
    end, 1.0)

    return true
end

function PriceHistory:OnEvent(event, ...)
    if not enabled then
        return
    end

    if event == "AUCTION_HOUSE_SHOW" then
        self:OnAuctionHouseShow()
    elseif event == "AUCTION_HOUSE_CLOSED" then
        self:OnAuctionHouseClosed()
    elseif event == "AUCTION_ITEM_LIST_UPDATE" then
        self:OnItemListUpdate()
    end
end

function PriceHistory:OnAuctionHouseShow()
    isRecording = true
end

function PriceHistory:OnAuctionHouseClosed()
    isRecording = false
end

function PriceHistory:OnItemListUpdate()
    if not isRecording then
        return
    end

    local currentTime = GetTime()
    if currentTime - lastRecordTime < recordThrottle then
        return
    end

    C_Timer.After(0.5, function()
        if isRecording then
            self:RecordCurrentAuctions()
        end
    end)
    lastRecordTime = currentTime
end

function PriceHistory:RecordCurrentAuctions()
    local Database = GF_Auction:GetModule("Database")
    if not Database then
        return
    end

    local settings = Database:GetSettings()
    if not settings.enablePriceHistory then
        return
    end

    if C_AuctionHouse and C_AuctionHouse.GetBrowseResults then
        self:RecordBrowseResults(Database)
        return
    end

    if GetNumAuctionItems then
        self:RecordClassicAuctions(Database)
    end
end

function PriceHistory:RecordBrowseResults(Database)
    local success, results = pcall(function()
        return C_AuctionHouse.GetBrowseResults()
    end)

    if not success or not results then
        return
    end

    local best = {}
    for _, result in ipairs(results) do
        if result and result.itemKey and result.itemKey.itemID and result.itemKey.itemID > 0 then
            local itemID = result.itemKey.itemID
            local stackSize = tonumber(result.quantity) or 1
            local price = tonumber(result.buyoutAmount or result.bidAmount or 0) or 0
            if price > 0 and stackSize > 0 then
                local unitPrice = math.floor(price / stackSize)
                best[itemID] = best[itemID] or {}
                local prev = best[itemID][stackSize]
                if (not prev) or price < prev.price then
                    local itemLink = nil
                    local _, link = GetItemInfo(itemID)
                    if link then itemLink = link end
                    best[itemID][stackSize] = {
                        price = price,
                        unitPrice = unitPrice,
                        stackSize = stackSize,
                        itemLink = itemLink,
                        seller = result.ownerName or "",
                        duration = result.timeLeftSeconds or 0,
                    }
                end
            end
        end
    end

    local wanted = {}
    SaveStatsFromBest(Database, best, wanted)
end

function PriceHistory:RecordClassicAuctions(Database)
    local function IsBrowseFirstPage()
        local p1 = (_G.AuctionFrameBrowse and _G.AuctionFrameBrowse.page ~= nil) and (tonumber(_G.AuctionFrameBrowse.page) or 0) or nil
        local p2 = (_G.BrowseCurrentPage ~= nil) and (tonumber(_G.BrowseCurrentPage) or 0) or nil
        local p3 = (_G.AuctionFrameBrowse and _G.AuctionFrameBrowse.currentPage ~= nil) and (tonumber(_G.AuctionFrameBrowse.currentPage) or 0) or nil
        local p = 0
        if p1 and p1 > p then p = p1 end
        if p2 and p2 > p then p = p2 end
        if p3 and p3 > p then p = p3 end
        if (tonumber(p) or 0) > 0 then
            return false
        end

        if _G.BrowsePrevPageButton and _G.BrowsePrevPageButton.IsEnabled then
            return not _G.BrowsePrevPageButton:IsEnabled()
        end

        return true
    end

    if not IsBrowseFirstPage() then
        return
    end

    local success, countAny = pcall(function()
        ---@diagnostic disable-next-line: param-type-mismatch
        return GetNumAuctionItems("list")
    end)
    local count = success and (tonumber(countAny) or 0) or 0

    if count <= 0 then
        return
    end

    local queryName = GetClassicBrowseQueryName()
    if not queryName then
        return
    end
    local normQuery = (_G.strlower and _G.strlower(queryName)) or string.lower(queryName)
    local MAX_MATCH_ITEMS = 30

    local best = {}
    local selected = {}
    local selectedCount = 0
    for i = 1, count do
        local itemInfo = self:GetAuctionItemInfo("list", i)
        if itemInfo and itemInfo.itemID and itemInfo.buyoutPrice and itemInfo.buyoutPrice > 0 then
            local name = itemInfo.name
            if type(name) == "string" then
                local normName = (_G.strlower and _G.strlower(name)) or string.lower(name)
                local isMatch = (normQuery ~= "" and string.find(normName, normQuery, 1, true) ~= nil) or false
                if isMatch then
                    local itemID = tonumber(itemInfo.itemID) or 0
                    if itemID > 0 then
                        local already = selected[itemID] == true
                        if (not already) and selectedCount >= MAX_MATCH_ITEMS then
                        else
                            if not already then
                                selected[itemID] = true
                                selectedCount = selectedCount + 1
                            end

                            local stackSize = tonumber(itemInfo.stackSize) or 1
                            local price = tonumber(itemInfo.buyoutPrice) or 0
                            if stackSize > 0 and price > 0 then
                                best[itemID] = best[itemID] or {}
                                local prev = best[itemID][stackSize]
                                local prevPrice = tonumber(prev and (prev.minPrice or prev.price or prev.buyoutPrice)) or 0
                                if (not prev) or prevPrice <= 0 or price < prevPrice then
                                    best[itemID][stackSize] = {
                                        minPrice = price,
                                        maxPrice = price,
                                        stackSize = stackSize,
                                    }
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local wanted = {}
    SaveStatsFromBest(Database, best, wanted)
end

function PriceHistory:GetAuctionItemInfo(type, index)
    local success, data = pcall(function()
        local link = GetAuctionItemLink(type, index)
        if not link then
            return nil
        end

        local name, texture, count, quality, canUse, level, levelColHeader,
              minBid, minIncrement, buyoutPrice, bidAmount, highBidder,
              bidderFullName, owner, ownerFullName, saleStatus, itemID, hasAllInfo = GetAuctionItemInfo(type, index)

        if not itemID or not link then
            return nil
        end

        return {
            itemID = itemID,
            itemLink = link,
            name = name,
            stackSize = count or 1,
            minBid = minBid or 0,
            buyoutPrice = buyoutPrice or 0,
            seller = owner or "",
            hasAllInfo = hasAllInfo
        }
    end)

    if success and data then
        return data
    end

    return nil
end

function PriceHistory:RecordAuctionItem(Database, result)
    if not result or not result.itemKey then
        return
    end

    local itemKey = result.itemKey
    local itemID = itemKey.itemID

    if not itemID or itemID == 0 then
        return
    end

    local itemLink = nil
    if itemKey.battlePetSpeciesID and itemKey.battlePetSpeciesID > 0 then
        return
    else
        local _, link = GetItemInfo(itemID)
        if link then itemLink = link end
    end

    if not itemLink then
        return
    end

    local price = result.buyoutAmount or result.bidAmount or 0
    local stackSize = result.quantity or 1
    local unitPrice = math.floor(price / stackSize)
    local seller = result.ownerName or ""
    local duration = result.timeLeftSeconds or 0

    self:SaveAuctionItem(Database, {
        itemID = itemID,
        itemLink = itemLink,
        price = price,
        unitPrice = unitPrice,
        stackSize = stackSize,
        seller = seller,
        buyoutPrice = price,
        duration = duration
    })
end

function PriceHistory:SaveAuctionItem(Database, itemInfo)
    if not itemInfo or not itemInfo.itemID then
        return
    end

    local itemID = tonumber(itemInfo.itemID)
    if not itemID or itemID == 0 then
        return
    end

    local price = tonumber(itemInfo.buyoutPrice) or tonumber(itemInfo.price) or 0
    local stackSize = tonumber(itemInfo.stackSize) or 1
    local unitPrice = tonumber(itemInfo.unitPrice) or (stackSize > 0 and math.floor(price / stackSize)) or 0

    if price <= 0 or unitPrice <= 0 then
        return
    end

    local realmData = Database.GetRealmData and Database:GetRealmData()
    if realmData and realmData.priceHistory then
        local list = realmData.priceHistory[itemID]
        if list and #list > 0 then
            local last = list[#list]
            if last and last.stackSize == stackSize and last.price == price and last.time and (time() - last.time) < 10 then
                return
            end
        end
    end

    Database:SavePriceHistory(
        itemID,
        itemInfo.itemLink,
        price,
        unitPrice,
        stackSize,
        itemInfo.seller or "",
        itemInfo.buyoutPrice or price,
        itemInfo.duration or ""
    )
end

function PriceHistory:GetHistory(itemID, days)
    local Database = GF_Auction:GetModule("Database")
    if not Database then
        return {}
    end

    return Database:GetPriceHistory(itemID, days)
end

function PriceHistory:GetStats(itemID, days)
    local Database = GF_Auction:GetModule("Database")
    if not Database then
        return nil
    end

    return Database:GetPriceStats(itemID, days)
end

function PriceHistory:SetEnabled(value)
    enabled = value ~= false
end

function PriceHistory:IsEnabled()
    return enabled
end

function PriceHistory:SetThrottle(seconds)
    recordThrottle = math.max(0.5, seconds or 2.0)
end

function PriceHistory:GetThrottle()
    return recordThrottle
end

function PriceHistory:Cleanup()
    local EventManager = GF_Auction:GetModule("EventManager")
    if EventManager then
        EventManager:UnsubscribeAll(self)
    end
 
    isRecording = false
    enabled = false
end

