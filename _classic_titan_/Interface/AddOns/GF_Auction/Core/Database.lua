--[[
    GF_Auction Database Module
    Handles all data storage and retrieval operations
]]

local L = GF_Auction_L

-- Create Database module
local Database = {}

-- Register module
if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("Database", Database)
end

local RETENTION_DAYS = 30
local DEFAULT_MAX_HISTORY_PER_ITEM = 1
local DEFAULT_STATS_RETENTION_DAYS = 7
local DEFAULT_MAX_STATS_NONFAV = 200000
local DB_VERSION = 1
local CHAR_DB_VERSION = 1

-- Default database structure
local function GetDefaultDB()
    return {
        version = DB_VERSION,
        realm = {},
        settings = {
            enablePriceHistory = true,
            enableSuggestions = true,
            showTooltip = true,
            autoFillPrice = false,
            retentionDays = RETENTION_DAYS,
            maxHistoryPerItem = DEFAULT_MAX_HISTORY_PER_ITEM,
            statsRetentionDays = DEFAULT_STATS_RETENTION_DAYS,
            maxStatsNonFav = DEFAULT_MAX_STATS_NONFAV,
            showInventoryPanel = true,
        }
    }
end

local function GetDefaultCharDB()
    return {
        version = CHAR_DB_VERSION,
        favorites = {}
    }
end

local function IsEmptyTable(t)
    if type(t) ~= "table" then return true end
    for _ in pairs(t) do
        return false
    end
    return true
end

local function CopyFavorites(src, dst)
    if type(src) ~= "table" or type(dst) ~= "table" then return end
    for id, info in pairs(src) do
        local tid = tonumber(id)
        if tid and tid > 0 and type(info) == "table" then
            if not dst[tid] then
                dst[tid] = {
                    itemLink = info.itemLink,
                    addedTime = info.addedTime
                }
            else
                local cur = dst[tid]
                if type(cur) ~= "table" then
                    dst[tid] = {
                        itemLink = info.itemLink,
                        addedTime = info.addedTime
                    }
                else
                    if (not cur.itemLink or cur.itemLink == "") and info.itemLink then
                        cur.itemLink = info.itemLink
                    end
                    local a = tonumber(cur.addedTime) or 0
                    local b = tonumber(info.addedTime) or 0
                    if b > a then
                        cur.addedTime = b
                    elseif a == 0 and b > 0 then
                        cur.addedTime = b
                    end
                end
            end
        end
    end
end

function Database:_EnsureCharDB()
    if not GF_AuctionCharDB then
        GF_AuctionCharDB = GetDefaultCharDB()
    end
    if type(GF_AuctionCharDB) ~= "table" then
        GF_AuctionCharDB = GetDefaultCharDB()
    end
    if not GF_AuctionCharDB.favorites or type(GF_AuctionCharDB.favorites) ~= "table" then
        GF_AuctionCharDB.favorites = {}
    end
    local v = tonumber(GF_AuctionCharDB.version) or 0
    if v < CHAR_DB_VERSION then
        GF_AuctionCharDB.version = CHAR_DB_VERSION
    end
    self.charDB = GF_AuctionCharDB
end

function Database:ClearFavorites(all)
    self:_EnsureCharDB()
    if not self.charDB then return false end
    if type(self.charDB.favorites) ~= "table" then
        self.charDB.favorites = {}
    else
        for k in pairs(self.charDB.favorites) do
            self.charDB.favorites[k] = nil
        end
    end
    return true
end

function Database:SyncFavoritesMirror()
    self:_EnsureCharDB()
    if not self.realmData then return end
    local realmFav = self.realmData.favorites
    local charFav = self.charDB and self.charDB.favorites
    if type(realmFav) ~= "table" then return end
    if type(charFav) ~= "table" then
        self.charDB.favorites = {}
        charFav = self.charDB.favorites
    end

    local legacy = realmFav
    if IsEmptyTable(legacy) then return end

    local charName = (_G.UnitName and _G.UnitName("player")) or nil
    if not charName or charName == "" then return end

    self.realmData._favClaimChar = self.realmData._favClaimChar or charName

    if self.realmData._favClaimChar == charName and not self.realmData._favMigratedToCharDB then
        CopyFavorites(legacy, charFav)
        self.realmData._legacyFavorites = legacy
        self.realmData.favorites = {}
        self.realmData._favMigratedToCharDB = true
    end
end

-- Initialize database
function Database:Initialize()
    if not GF_AuctionDB then
        GF_AuctionDB = GetDefaultDB()
    end
    
    local dbVersion = tonumber(GF_AuctionDB.version) or 0
    if dbVersion < DB_VERSION then
        if dbVersion == 0 then
            if not GF_AuctionDB.settings then
                GF_AuctionDB.settings = GetDefaultDB().settings
            end
        end
        GF_AuctionDB.version = DB_VERSION
    end
    
    if not GF_AuctionDB.settings then
        GF_AuctionDB.settings = GetDefaultDB().settings
    end
    if GF_AuctionDB.settings.maxHistoryPerItem == nil then
        GF_AuctionDB.settings.maxHistoryPerItem = DEFAULT_MAX_HISTORY_PER_ITEM
    end
    if GF_AuctionDB.settings.statsRetentionDays == nil then
        GF_AuctionDB.settings.statsRetentionDays = DEFAULT_STATS_RETENTION_DAYS
    end
    if GF_AuctionDB.settings.maxStatsNonFav == nil then
        GF_AuctionDB.settings.maxStatsNonFav = DEFAULT_MAX_STATS_NONFAV
    end
    if GF_AuctionDB.settings.showInventoryPanel == nil then
        GF_AuctionDB.settings.showInventoryPanel = true
    end
    
    -- Initialize realm data
    local realmName = GetRealmName()
    if not GF_AuctionDB.realm[realmName] then
        GF_AuctionDB.realm[realmName] = {
            priceHistory = {},
            priceStats = {},
            dailyStats = {},
            favorites = {},
            searchHistory = {}
        }
    end
    
    self.db = GF_AuctionDB
    self.realmData = self.db.realm[realmName]

    self:_EnsureCharDB()
    self:SyncFavoritesMirror()
    
    -- Clean old data
    self:CleanOldData()
    
    return true
end

-- Get realm-specific data
function Database:GetRealmData()
    return self.realmData
end

-- Get settings
function Database:GetSettings()
    return self.db.settings
end

-- Save price history entry
function Database:SavePriceHistory(itemID, itemLink, price, unitPrice, stackSize, seller, buyoutPrice, duration)
    if not self.realmData then
        return false
    end
    
    itemID = tonumber(itemID)
    if not itemID then
        return false
    end
    
    if not self.realmData.priceHistory[itemID] then
        self.realmData.priceHistory[itemID] = {}
    end
    
    local p = tonumber(price) or 0
    local u = tonumber(unitPrice) or 0
    local ss = tonumber(stackSize) or 1
    if ss <= 0 then ss = 1 end
    local b = tonumber(buyoutPrice) or p
    local entry = {
        price = p,
        unitPrice = u > 0 and u or math.floor(p / ss),
        stackSize = ss,
        buyoutPrice = b,
        time = time(),
    }
    
    table.insert(self.realmData.priceHistory[itemID], entry)
    
    local maxKeep = (self.db and self.db.settings and self.db.settings.maxHistoryPerItem) or DEFAULT_MAX_HISTORY_PER_ITEM
    maxKeep = tonumber(maxKeep) or DEFAULT_MAX_HISTORY_PER_ITEM
    if maxKeep < 0 then maxKeep = 0 end
    if maxKeep == 0 then
        self.realmData.priceHistory[itemID] = nil
        return true
    end
    if #self.realmData.priceHistory[itemID] > maxKeep then
        table.remove(self.realmData.priceHistory[itemID], 1)
    end
    
    return true
end

-- Get price history for item
function Database:GetPriceHistory(itemID, days)
    if not self.realmData then
        return {}
    end
    
    itemID = tonumber(itemID)
    if not itemID or not self.realmData.priceHistory[itemID] then
        return {}
    end
    
    local history = self.realmData.priceHistory[itemID]
    local cutoffTime = time() - (days or RETENTION_DAYS) * 86400
    local filtered = {}
    
    for _, entry in ipairs(history) do
        if entry.time >= cutoffTime then
            table.insert(filtered, entry)
        end
    end
    
    return filtered
end

-- Save price statistics
function Database:SavePriceStats(itemID, stats, skipCleanup)
    if not self.realmData then
        return false
    end

    itemID = tonumber(itemID)
    if not itemID or not stats then
        return false
    end

    if not self.realmData.priceStats then
        self.realmData.priceStats = {}
    end

    self.realmData.priceStats[itemID] = {
        minUnit = stats.minUnit,
        maxUnit = stats.maxUnit,
        minStackTotal = stats.minStackTotal,
        maxStackTotal = stats.maxStackTotal,
        groupStack = stats.groupStack,
        time = time()
    }

    local favs = self:GetFavorites()
    if favs and favs[itemID] and GF_Auction and GF_Auction.GetModule then
        local FavoritePanel = GF_Auction:GetModule("FavoritePanel")
        if FavoritePanel and FavoritePanel.RequestUpdateList then
            pcall(FavoritePanel.RequestUpdateList, FavoritePanel)
        elseif FavoritePanel and FavoritePanel.UpdateList then
            pcall(FavoritePanel.UpdateList, FavoritePanel)
        end
    end

    if not skipCleanup then
        if not self._saveCount then self._saveCount = 0 end
        self._saveCount = self._saveCount + 1
        if self._saveCount >= 50 then
            self._saveCount = 0
            self:CleanOldData()
        end
    end

    return true
end

-- Get price statistics
function Database:GetPriceStats(itemID)
    if not self.realmData or not self.realmData.priceStats then
        return nil
    end

    itemID = tonumber(itemID)
    if not itemID or not self.realmData.priceStats[itemID] then
        return nil
    end

    return self.realmData.priceStats[itemID]
end

-- Calculate price statistics
function Database:GetPriceStatsOld(itemID, days)
    local history = self:GetPriceHistory(itemID, days)
    if #history == 0 then
        return nil
    end

    local prices = {}
    local unitPrices = {}

    for _, entry in ipairs(history) do
        if entry.price then
            table.insert(prices, entry.price)
        end
        if entry.unitPrice then
            table.insert(unitPrices, entry.unitPrice)
        end
    end

    if #prices == 0 then
        return nil
    end

    -- Sort prices
    table.sort(prices)
    table.sort(unitPrices)

    local stats = {
        count = #history,
        minPrice = prices[1],
        maxPrice = prices[#prices],
        minUnitPrice = unitPrices[1] or prices[1],
        maxUnitPrice = unitPrices[#unitPrices] or prices[#prices],
    }

    -- Calculate average
    local sum = 0
    local unitSum = 0
    for _, price in ipairs(prices) do
        sum = sum + price
    end
    for _, price in ipairs(unitPrices) do
        unitSum = unitSum + price
    end

    stats.avgPrice = math.floor(sum / #prices)
    stats.avgUnitPrice = #unitPrices > 0 and math.floor(unitSum / #unitPrices) or stats.avgPrice

    -- Calculate median
    local mid = math.floor(#prices / 2)
    if #prices % 2 == 0 then
        stats.medianPrice = math.floor((prices[mid] + prices[mid + 1]) / 2)
    else
        stats.medianPrice = prices[mid + 1]
    end

    -- Recommended price (90% of average)
    stats.recommendPrice = math.floor(stats.avgPrice * 0.9)
    stats.recommendUnitPrice = math.floor(stats.avgUnitPrice * 0.9)

    return stats
end

-- Add favorite item
function Database:AddFavorite(itemID, itemLink)
    if not self.realmData then
        return false
    end

    self:_EnsureCharDB()
    local favs = self.charDB and self.charDB.favorites
    if type(favs) ~= "table" then
        self.charDB.favorites = {}
        favs = self.charDB.favorites
    end

    if not favs[itemID] then
        favs[itemID] = {
            itemLink = itemLink,
            addedTime = time()
        }
        if GF_Auction and GF_Auction.NotifyFavoritesChanged then
            pcall(GF_Auction.NotifyFavoritesChanged, GF_Auction, itemID)
        end
        return true
    end
    return false
end

-- Remove favorite item
function Database:RemoveFavorite(itemID)
    if not self.realmData then
        return false
    end
 
    self:_EnsureCharDB()
    local favs = self.charDB and self.charDB.favorites
    if type(favs) ~= "table" then
        self.charDB.favorites = {}
        favs = self.charDB.favorites
    end

    if favs[itemID] then
        favs[itemID] = nil
        if GF_Auction and GF_Auction.NotifyFavoritesChanged then
            pcall(GF_Auction.NotifyFavoritesChanged, GF_Auction, itemID)
        end
        return true
    end
    return false
end

-- Get favorites
function Database:GetFavorites()
    self:_EnsureCharDB()
    if not self.charDB or type(self.charDB.favorites) ~= "table" then
        return {}
    end
    return self.charDB.favorites
end

-- Add search history
function Database:AddSearchHistory(searchText)
    if not self.realmData then
        return false
    end

    -- Remove duplicates
    for i, text in ipairs(self.realmData.searchHistory) do
        if text == searchText then
            table.remove(self.realmData.searchHistory, i)
            break
        end
    end

    table.insert(self.realmData.searchHistory, 1, searchText)

    if #self.realmData.searchHistory > 50 then
        table.remove(self.realmData.searchHistory)
    end
 
    return true
end

-- Get search history
function Database:GetSearchHistory(limit)
    if not self.realmData then
        return {}
    end

    limit = limit or 10
    local result = {}
    for i = 1, math.min(limit, #self.realmData.searchHistory) do
        table.insert(result, self.realmData.searchHistory[i])
    end
    return result
end

-- Clean old data
function Database:CleanOldData()
    if not self.realmData then
        return
    end
    if not self.realmData.priceHistory then
        return
    end

    local cutoffTime = time() - (self.db.settings.retentionDays or RETENTION_DAYS) * 86400
    local maxKeep = (self.db and self.db.settings and self.db.settings.maxHistoryPerItem) or DEFAULT_MAX_HISTORY_PER_ITEM
    maxKeep = tonumber(maxKeep) or DEFAULT_MAX_HISTORY_PER_ITEM
    if maxKeep < 0 then maxKeep = 0 end

    for itemID, history in pairs(self.realmData.priceHistory) do
        if type(history) ~= "table" then
            self.realmData.priceHistory[itemID] = nil
        else
        local filtered = {}
        for _, entry in ipairs(history) do
                if type(entry) == "table" then
                    local ts = tonumber(entry.time) or 0
                    if ts >= cutoffTime then
                        local ss = tonumber(entry.stackSize) or 1
                        if ss <= 0 then ss = 1 end
                        local p = tonumber(entry.price) or tonumber(entry.buyoutPrice) or 0
                        local b = tonumber(entry.buyoutPrice) or p
                        local u = tonumber(entry.unitPrice) or (p > 0 and math.floor(p / ss)) or 0
                        if p > 0 and u > 0 then
                            table.insert(filtered, {
                                price = p,
                                unitPrice = u,
                                stackSize = ss,
                                buyoutPrice = b,
                                time = ts,
                            })
                        end
                    end
            end
        end

            if maxKeep == 0 or #filtered == 0 then
            self.realmData.priceHistory[itemID] = nil
        else
                if #filtered > maxKeep then
                    local keep = {}
                    for i = #filtered - maxKeep + 1, #filtered do
                        table.insert(keep, filtered[i])
                    end
                    filtered = keep
                end
            self.realmData.priceHistory[itemID] = filtered
            end
        end
    end

    if self.realmData.priceStats and type(self.realmData.priceStats) == "table" then
        local favs = self:GetFavorites()
        local statsDays = (self.db and self.db.settings and self.db.settings.statsRetentionDays) or DEFAULT_STATS_RETENTION_DAYS
        statsDays = tonumber(statsDays) or DEFAULT_STATS_RETENTION_DAYS
        if statsDays < 0 then statsDays = 0 end
        local cutoffStats = time() - statsDays * 86400
        local maxNonFav = (self.db and self.db.settings and self.db.settings.maxStatsNonFav) or DEFAULT_MAX_STATS_NONFAV
        maxNonFav = tonumber(maxNonFav) or DEFAULT_MAX_STATS_NONFAV
        if maxNonFav < 0 then maxNonFav = 0 end

        local nonFavList = {}
        for itemID, stats in pairs(self.realmData.priceStats) do
            local id = tonumber(itemID)
            if not id or type(stats) ~= "table" then
                self.realmData.priceStats[itemID] = nil
            else
                local ts = tonumber(stats.time) or 0
                local isFav = favs and favs[id] ~= nil
                if not isFav then
                    if statsDays == 0 then
                        self.realmData.priceStats[itemID] = nil
                    elseif ts > 0 and ts < cutoffStats then
                        self.realmData.priceStats[itemID] = nil
                    else
                        table.insert(nonFavList, { id = id, ts = ts })
                    end
                end
            end
        end

        if maxNonFav == 0 then
            for _, v in ipairs(nonFavList) do
                self.realmData.priceStats[v.id] = nil
            end
        elseif #nonFavList > maxNonFav then
            table.sort(nonFavList, function(a, b) return (a.ts or 0) > (b.ts or 0) end)
            for i = maxNonFav + 1, #nonFavList do
                self.realmData.priceStats[nonFavList[i].id] = nil
            end
        end
    end
end

-- Clear all data for current realm
function Database:ClearRealmData()
    if not self.realmData then
        return false
    end

    local realmName = GetRealmName()
    self.db.realm[realmName] = {
        priceHistory = {},
        dailyStats = {},
        favorites = {},
        searchHistory = {}
    }
    self.realmData = self.db.realm[realmName]

    return true
end

-- Format copper to gold/silver/copper
function Database:FormatMoney(copper)
    local COLOR_GOLD = "|cffffd700"
    local COLOR_SILVER = "|cffc7c7cf"
    local COLOR_COPPER = "|cffeda55f"
    local COLOR_RESET = "|r"

    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local copper = copper % 100

    if gold > 0 then
        return string.format("%s%dg%s %s%ds%s %s%dc%s", 
            COLOR_GOLD, gold, COLOR_RESET,
            COLOR_SILVER, silver, COLOR_RESET,
            COLOR_COPPER, copper, COLOR_RESET)
    elseif silver > 0 then
        return string.format("%s%ds%s %s%dc%s", 
            COLOR_SILVER, silver, COLOR_RESET,
            COLOR_COPPER, copper, COLOR_RESET)
    else
        return string.format("%s%dc%s", COLOR_COPPER, copper, COLOR_RESET)
    end
end

