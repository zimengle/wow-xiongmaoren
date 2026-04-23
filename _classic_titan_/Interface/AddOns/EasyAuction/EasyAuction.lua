local addonName, ns = ...

-- 新的全局数据库，按服务器-阵营存储
EasyAuctionDB2 = EasyAuctionDB2 or {}

-- 向后兼容：保留旧的全局变量引用，但数据将从新的结构中迁移
-- EasyAuctionDB 将在 PLAYER_LOGIN 后被设置为当前服务器-阵营的数据库
_G.EasyAuctionDB = _G.EasyAuctionDB or {}

-- 声明局部变量 EasyAuctionDB，将在初始化时指向当前服务器-阵营的数据库
local EasyAuctionDB

local function EA_GetAddonMetadata(name, field)
    if type(GetAddOnMetadata) == "function" then
        return GetAddOnMetadata(name, field)
    end
    if C_AddOns and type(C_AddOns.GetAddOnMetadata) == "function" then
        return C_AddOns.GetAddOnMetadata(name, field)
    end
end

local function EA_GetAddonToggle(funcName)
    if C_AddOns and type(C_AddOns[funcName]) == "function" then
        return C_AddOns[funcName]
    end
    if type(_G[funcName]) == "function" then
        return _G[funcName]
    end
end

local function EA_GetAddonEnableState(addon, character)
    if C_AddOns and type(C_AddOns.GetAddOnEnableState) == "function" then
        return C_AddOns.GetAddOnEnableState(addon, character)
    end
    if type(GetAddOnEnableState) == "function" then
        return GetAddOnEnableState(character, addon)
    end
end

local function EA_IsAddonEnabled(addon, character)
    local state = EA_GetAddonEnableState(addon, character)
    return type(state) == "number" and state > 0
end

local function EA_IsManagedAddon(name)
    return name and name ~= addonName and not name:find("^Blizzard_")
end

EasyAuction_SearchHistoryDropDown = CreateFrame("Frame", "EasyAuction_SearchHistoryDropDown", UIParent,
    "UIDropDownMenuTemplate")

local RECENT_MAX = 20
local FAVORITE_MAX = 50
local EA_CategoryMode = nil
local EA_CategorySortKey = "titanValue"
local EA_CategorySortDesc = true
local EA_CategoryCurrentPage = 1
local EA_CategoryTotalPages = 1
local EA_ActiveCategory = nil

local function EA_ClampInt(value, defaultValue, minValue, maxValue)
    local n = math.floor(tonumber(value) or tonumber(defaultValue) or 0)
    if minValue and n < minValue then n = minValue end
    if maxValue and n > maxValue then n = maxValue end
    return n
end

local function EA_AssignIfNil(tbl, key, value)
    if tbl[key] == nil then
        tbl[key] = value
    end
end

local function EA_CompressHistoryRecords(records, keepLimit, cutoffTime)
    if type(records) ~= "table" then
        return {}, 0
    end

    local byUnit = {}
    local removed = 0
    for _, rec in ipairs(records) do
        local unit = rec and tonumber(rec.unit)
        local count = rec and tonumber(rec.count) or 1
        local t = rec and tonumber(rec.t) or nil

        if not unit or unit <= 0 then
            removed = removed + 1
        elseif cutoffTime and t and t <= cutoffTime then
            removed = removed + 1
        else
            local bucket = byUnit[unit]
            if not bucket then
                byUnit[unit] = {
                    unit = unit,
                    count = count > 0 and count or 1,
                    t = t or time(),
                }
            else
                bucket.count = (bucket.count or 0) + (count > 0 and count or 1)
                if t and ((bucket.t or 0) < t) then
                    bucket.t = t
                end
                removed = removed + 1
            end
        end
    end

    local out = {}
    for _, bucket in pairs(byUnit) do
        out[#out + 1] = bucket
    end
    table.sort(out, function(a, b) return (a.unit or 0) < (b.unit or 0) end)

    local limit = EA_ClampInt(keepLimit or 0, 0, 0, 5000)
    if limit > 0 and #out > limit then
        for i = #out, limit + 1, -1 do
            out[i] = nil
            removed = removed + 1
        end
    end

    return out, removed
end

-- 获取当前服务器-阵营的键名
local function GetRealmFactionKey()
    local realm = GetRealmName() or "Unknown"
    local _, faction = UnitFactionGroup("player")
    faction = faction or "Neutral"
    return realm .. "-" .. faction
end

-- 初始化当前服务器-阵营的数据库
local function InitEasyAuctionDB()
    local key = GetRealmFactionKey()
    
    -- 如果新数据库中不存在当前服务器-阵营的数据，则创建
    if not EasyAuctionDB2[key] then
        EasyAuctionDB2[key] = {}
    end
    
    -- 设置局部变量 EasyAuctionDB 指向当前服务器-阵营的数据
    EasyAuctionDB = EasyAuctionDB2[key]
    
    -- 向后兼容：如果旧数据库有数据且新数据库为空，则迁移数据
    local oldDB = _G.EasyAuctionDB
    if oldDB and next(oldDB) ~= nil then
        -- 检查是否已有价格历史数据
        if not EasyAuctionDB.PriceHistory or next(EasyAuctionDB.PriceHistory) == nil then
            if oldDB.PriceHistory and next(oldDB.PriceHistory) ~= nil then
                EasyAuctionDB.PriceHistory = oldDB.PriceHistory
            end
        end
        if not EasyAuctionDB.DailyMinPrice or next(EasyAuctionDB.DailyMinPrice) == nil then
            if oldDB.DailyMinPrice and next(oldDB.DailyMinPrice) ~= nil then
                EasyAuctionDB.DailyMinPrice = oldDB.DailyMinPrice
            end
        end
        if not EasyAuctionDB.FavoriteItems or next(EasyAuctionDB.FavoriteItems) == nil then
            if oldDB.FavoriteItems and next(oldDB.FavoriteItems) ~= nil then
                EasyAuctionDB.FavoriteItems = oldDB.FavoriteItems
            end
        end
        if not EasyAuctionDB.RecentSearch or #EasyAuctionDB.RecentSearch == 0 then
            if oldDB.RecentSearch and #oldDB.RecentSearch > 0 then
                EasyAuctionDB.RecentSearch = oldDB.RecentSearch
            end
        end
        -- 迁移其他设置
        EA_AssignIfNil(EasyAuctionDB, "CustomHistoryPage", oldDB.CustomHistoryPage)
        EA_AssignIfNil(EasyAuctionDB, "scanPerFrame", oldDB.scanPerFrame)
        EA_AssignIfNil(EasyAuctionDB, "undercutMode", oldDB.undercutMode)
        EA_AssignIfNil(EasyAuctionDB, "showSections", oldDB.showSections)
        EA_AssignIfNil(EasyAuctionDB, "ShowPrice", oldDB.ShowPrice)
        EA_AssignIfNil(EasyAuctionDB, "enablePrice", oldDB.enablePrice)
        EA_AssignIfNil(EasyAuctionDB, "enableDisenchant", oldDB.enableDisenchant)
        EA_AssignIfNil(EasyAuctionDB, "enableProspect", oldDB.enableProspect)
        EA_AssignIfNil(EasyAuctionDB, "enableMill", oldDB.enableMill)
        EA_AssignIfNil(EasyAuctionDB, "enableTitanValue", oldDB.enableTitanValue)
        EA_AssignIfNil(EasyAuctionDB, "showUnitPrice", oldDB.showUnitPrice)
        EA_AssignIfNil(EasyAuctionDB, "enableUndercut", oldDB.enableUndercut)
        EA_AssignIfNil(EasyAuctionDB, "hideSellPrice", oldDB.hideSellPrice)
        EA_AssignIfNil(EasyAuctionDB, "enableDisenchantProb", oldDB.enableDisenchantProb)
        EA_AssignIfNil(EasyAuctionDB, "autoFillLastAuction", oldDB.autoFillLastAuction)
        EA_AssignIfNil(EasyAuctionDB, "enableAuctionListCopy", oldDB.enableAuctionListCopy)
        EA_AssignIfNil(EasyAuctionDB, "VendorPrice", oldDB.VendorPrice)
        EA_AssignIfNil(EasyAuctionDB, "bidDiscount", oldDB.bidDiscount)
        EA_AssignIfNil(EasyAuctionDB, "undercut", oldDB.undercut)
        EA_AssignIfNil(EasyAuctionDB, "stackCount", oldDB.stackCount)
        EA_AssignIfNil(EasyAuctionDB, "defaultNumStacks", oldDB.defaultNumStacks)
        EA_AssignIfNil(EasyAuctionDB, "auctionDuration", oldDB.auctionDuration)
        EA_AssignIfNil(EasyAuctionDB, "buyRiskLimit", oldDB.buyRiskLimit)
        EA_AssignIfNil(EasyAuctionDB, "scanQuickLimit", oldDB.scanQuickLimit)
        EA_AssignIfNil(EasyAuctionDB, "historyKeepDays", oldDB.historyKeepDays)
        EA_AssignIfNil(EasyAuctionDB, "historyMaxEntry", oldDB.historyMaxEntry)
        EA_AssignIfNil(EasyAuctionDB, "scanKeepPerItem", oldDB.scanKeepPerItem)
        EA_AssignIfNil(EasyAuctionDB, "dailyKeepDays", oldDB.dailyKeepDays)
        EA_AssignIfNil(EasyAuctionDB, "hourlyKeepHours", oldDB.hourlyKeepHours)
        EA_AssignIfNil(EasyAuctionDB, "ShowMinPrice", oldDB.ShowMinPrice)
        EA_AssignIfNil(EasyAuctionDB, "enableVendor", oldDB.enableVendor)
        EA_AssignIfNil(EasyAuctionDB, "SellPanel", oldDB.SellPanel)
        EA_AssignIfNil(EasyAuctionDB, "minimap", oldDB.minimap)
        EA_AssignIfNil(EasyAuctionDB, "OperationHistory", oldDB.OperationHistory)
        EA_AssignIfNil(EasyAuctionDB, "CategoryOverrides", oldDB.CategoryOverrides)
        EA_AssignIfNil(EasyAuctionDB, "AddonBackup", oldDB.AddonBackup)
        EA_AssignIfNil(EasyAuctionDB, "MinimalModeActive", oldDB.MinimalModeActive)
    end
    
    -- 设置默认值
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
    EasyAuctionDB.HourlyMinPrice = EasyAuctionDB.HourlyMinPrice or {}
    EasyAuctionDB.CustomHistoryPage = EasyAuctionDB.CustomHistoryPage or 1
    EasyAuctionDB.scanPerFrame = EA_ClampInt(EasyAuctionDB.scanPerFrame or 200, 200, 50, 500)
    EasyAuctionDB.scanKeepPerItem = EA_ClampInt(EasyAuctionDB.scanKeepPerItem or 120, 120, 20, 500)
    EasyAuctionDB.historyKeepDays = EA_ClampInt(EasyAuctionDB.historyKeepDays or 30, 30, 1, 365)
    EasyAuctionDB.historyMaxEntry = EA_ClampInt(EasyAuctionDB.historyMaxEntry or 0, 0, 0, 2000)
    EasyAuctionDB.dailyKeepDays = EA_ClampInt(
        EasyAuctionDB.dailyKeepDays or EasyAuctionDB.historyKeepDays or 30,
        EasyAuctionDB.historyKeepDays or 30,
        1,
        365
    )
    -- HourlyMinPrice 当前结构仅按小时(0-23)聚合，最多保留 24 小时窗口。
    EasyAuctionDB.hourlyKeepHours = EA_ClampInt(EasyAuctionDB.hourlyKeepHours or 24, 24, 1, 24)
    EasyAuctionDB.LastSelectedPriceInfo = nil
    EasyAuctionDB.CurrentDistItemName = nil
    EasyAuctionDB.CurrentDistData = nil
    EasyAuctionDB.undercutMode = EasyAuctionDB.undercutMode or "total"
    EasyAuctionDB.showSections = EasyAuctionDB.showSections or { items = true, price = true, myauct = true }
    EasyAuctionDB.RecentSearch = EasyAuctionDB.RecentSearch or {}
    EasyAuctionDB.FavoriteItems = EasyAuctionDB.FavoriteItems or {}
    EasyAuctionDB.CategoryOverrides = EasyAuctionDB.CategoryOverrides or {}
    
    if EasyAuctionDB.ShowPrice == nil then EasyAuctionDB.ShowPrice = true end
    if EasyAuctionDB.enablePrice == nil then EasyAuctionDB.enablePrice = true end
    if EasyAuctionDB.enableDisenchant == nil then EasyAuctionDB.enableDisenchant = true end
    if EasyAuctionDB.enableProspect == nil then EasyAuctionDB.enableProspect = true end
    if EasyAuctionDB.enableMill == nil then EasyAuctionDB.enableMill = true end
    if EasyAuctionDB.enableTitanValue == nil then EasyAuctionDB.enableTitanValue = true end
    if EasyAuctionDB.showUnitPrice == nil then EasyAuctionDB.showUnitPrice = true end
    if EasyAuctionDB.enableUndercut == nil then EasyAuctionDB.enableUndercut = true end
    if EasyAuctionDB.undercutMode ~= "unit" then EasyAuctionDB.undercutMode = "total" end
    if EasyAuctionDB.hideSellPrice == nil then EasyAuctionDB.hideSellPrice = false end
    if EasyAuctionDB.enableDisenchantProb == nil then EasyAuctionDB.enableDisenchantProb = true end
    if EasyAuctionDB.MinimalModeActive == nil and type(EasyAuctionDB.AddonBackup) ~= "table" then
        EasyAuctionDB.MinimalModeActive = false
    end
    
    EasyAuctionDB.autoFillLastAuction = EasyAuctionDB.autoFillLastAuction == nil and false or EasyAuctionDB.autoFillLastAuction
    EasyAuctionDB.enableAuctionListCopy = EasyAuctionDB.enableAuctionListCopy == nil and true or EasyAuctionDB.enableAuctionListCopy
    EasyAuctionDB.VendorPrice = EasyAuctionDB.VendorPrice or {}
    -- 更新全局引用（用于兼容其他可能的访问）
    _G.EasyAuctionDB = EasyAuctionDB
    if type(EasyAuction_RebindFrameDB) == "function" then
        EasyAuction_RebindFrameDB()
    end
    if oldDB and oldDB ~= EasyAuctionDB then
        -- 旧结构可能是大表，尽早释放引用，降低登录后常驻压力。
        oldDB = nil
        collectgarbage("collect")
    end
    
    return EasyAuctionDB
end

IsScanningAll = false
IsScanningCategory = false
local EasyAuctionScanProgressFrame = nil
EasyAuction_ItemID_Index = {}
local function EA_UpdateItemIDIndexForKey(key, minUnit)
    if type(key) ~= "string" or key == "" then return end
    local matchID = key:match(":(%d+)$")
    local itemid = tonumber(matchID)
    if not itemid then return end

    local entries = EasyAuction_ItemID_Index[itemid]
    if not entries then
        entries = {}
        EasyAuction_ItemID_Index[itemid] = entries
    end

    for i = 1, #entries do
        local entry = entries[i]
        if entry and entry.key == key then
            entry.minUnit = minUnit
            return
        end
    end

    entries[#entries + 1] = {
        key = key,
        minUnit = minUnit,
    }
end

local function EA_RemoveItemIDIndexForKey(key)
    if type(key) ~= "string" or key == "" then return end
    local matchID = key:match(":(%d+)$")
    local itemid = tonumber(matchID)
    if not itemid then return end

    local entries = EasyAuction_ItemID_Index[itemid]
    if not entries then return end
    for i = #entries, 1, -1 do
        local entry = entries[i]
        if entry and entry.key == key then
            table.remove(entries, i)
        end
    end
    if #entries == 0 then
        EasyAuction_ItemID_Index[itemid] = nil
    end
end

local function BuildItemIDIndex()
    wipe(EasyAuction_ItemID_Index)
    for key, history in pairs(EasyAuctionDB.PriceHistory or {}) do
        local minUnit = type(history) == "table" and history.minUnit or nil
        EA_UpdateItemIDIndexForKey(key, minUnit)
    end
end

local function EasyAuction_CreateDefaultDB()
    return {
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
        scanQuickLimit = 100,
        PriceHistory = {},
        DailyMinPrice = {},
        HourlyMinPrice = {},
        CurrentTodayMin = {},
        FavoriteItems = {},
        RecentSearch = {},
        VendorPrice = {},
        OperationHistory = {},
        CategoryOverrides = {},
        minimap = {},
        autoFillLastAuction = false,
        enableAuctionListCopy = true,
        CustomHistoryPage = 1,
        MinimalModeActive = false,
    }
end

-- resetAllRealms=true 时清空 EasyAuctionDB2 下所有服务器-阵营数据。
function EasyAuction_ResetSavedVariables(resetAllRealms)
    local key = GetRealmFactionKey()
    EasyAuctionDB2 = type(EasyAuctionDB2) == "table" and EasyAuctionDB2 or {}
    if resetAllRealms then
        wipe(EasyAuctionDB2)
    end

    local newDB = EasyAuction_CreateDefaultDB()
    EasyAuctionDB2[key] = newDB
    EasyAuctionDB = newDB
    _G.EasyAuctionDB2 = EasyAuctionDB2
    _G.EasyAuctionDB = newDB

    if type(EasyAuction_RebindFrameDB) == "function" then
        EasyAuction_RebindFrameDB()
    end

    wipe(EasyAuction_ItemID_Index)
    return newDB
end

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

local EA_SCAN_CATEGORIES = { "矿石", "草药", "附魔", "珠宝", "布皮", "元素", "药剂", "鱼类", "常用" }

local function EA_TrimText(value)
    return tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
end

local function EA_SanitizeCategoryEntry(name, itemID, titan)
    local cleanName = EA_TrimText(name)
    local cleanID = tonumber(itemID)
    local cleanTitan = math.max(0, math.floor(tonumber(titan) or 0))
    if cleanName == "" or not cleanID or cleanID <= 0 then
        return nil
    end
    return { cleanName, cleanID, cleanTitan }
end

local function EA_CopyCategoryEntries(entries)
    local copied = {}
    for _, info in ipairs(entries or {}) do
        local entry = EA_SanitizeCategoryEntry(info[1], info[2], info[3])
        if entry then
            copied[#copied + 1] = entry
        end
    end
    return copied
end

local function EA_GetCategoryOverrideStore()
    if not EasyAuctionDB then
        return {}
    end
    EasyAuctionDB.CategoryOverrides = EasyAuctionDB.CategoryOverrides or {}
    return EasyAuctionDB.CategoryOverrides
end

local function EA_GetFavoriteCategoryEntries()
    local entries = {}
    for itemID, info in pairs(EasyAuctionDB and EasyAuctionDB.FavoriteItems or {}) do
        local entry = EA_SanitizeCategoryEntry(info and info.name, itemID, info and info.titan)
        if entry then
            entry._time = info and info.time or 0
            entries[#entries + 1] = entry
        end
    end
    table.sort(entries, function(a, b)
        return (a._time or 0) > (b._time or 0)
    end)
    for _, info in ipairs(entries) do
        info._time = nil
    end
    return entries
end

local function EA_GetCategoryEntries(cat)
    if cat == "常用" then
        return EA_GetFavoriteCategoryEntries()
    end
    local overrides = EA_GetCategoryOverrideStore()
    if type(overrides[cat]) == "table" then
        return overrides[cat]
    end
    return ns.EA_CATEGORY_LIST[cat] or {}
end

local function EA_SetCategoryEntries(cat, entries)
    if not EasyAuctionDB then
        return
    end
    if cat == "常用" then
        local favorites = {}
        local now = time()
        for index, info in ipairs(entries or {}) do
            favorites[info[2]] = {
                name = info[1],
                titan = tonumber(info[3]) or 0,
                time = now - index,
            }
        end
        EasyAuctionDB.FavoriteItems = favorites
        return
    end
    local overrides = EA_GetCategoryOverrideStore()
    overrides[cat] = EA_CopyCategoryEntries(entries)
end

local function EA_ResetCategoryEntries(cat)
    if not EasyAuctionDB then
        return
    end
    if cat == "常用" then
        EasyAuctionDB.FavoriteItems = {}
        return
    end
    local overrides = EA_GetCategoryOverrideStore()
    overrides[cat] = nil
end

local function EA_GetCategoryTitanMap()
    local itemID2Titan = {}
    for _, cat in ipairs(EA_SCAN_CATEGORIES) do
        if cat ~= "常用" then
            for _, info in ipairs(EA_GetCategoryEntries(cat)) do
                local itemID = tonumber(info[2])
                local titan = tonumber(info[3])
                if itemID then
                    itemID2Titan[itemID] = titan
                end
            end
        end
    end
    return itemID2Titan
end

local function EA_GetHistoryStats(key)
    local history = EasyAuctionDB and EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
    local minUnit, latestTime, historyMin, snapshotCount = nil, nil, nil, 0
    if type(history) == "table" then
        historyMin = tonumber(history.minUnit)
        for _, rec in ipairs(history) do
            local unit = tonumber(rec and rec.unit)
            local count = tonumber(rec and rec.count) or 1
            local recTime = tonumber(rec and rec.t)
            if unit and (not minUnit or unit < minUnit) then
                minUnit = unit
            end
            if unit and (not historyMin or unit < historyMin) then
                historyMin = unit
            end
            if recTime and (not latestTime or recTime > latestTime) then
                latestTime = recTime
            end
            snapshotCount = snapshotCount + math.max(1, count)
        end
        latestTime = tonumber(history.lastScanT) or latestTime
        if historyMin and history.minUnit ~= historyMin then
            history.minUnit = historyMin
        end
    end

    local dailyData = EasyAuctionDB and EasyAuctionDB.DailyMinPrice and EasyAuctionDB.DailyMinPrice[key]
    if type(dailyData) == "table" then
        local today = date("%Y-%m-%d")
        for _, record in ipairs(dailyData) do
            if record[1] == today then
                snapshotCount = tonumber(record[6]) or snapshotCount
                break
            end
        end
    end

    return {
        minUnit = minUnit,
        latestTime = latestTime,
        historyMin = historyMin,
        snapshotCount = snapshotCount,
        history = history,
    }
end

local function EA_SaveAggregatedBuckets(batchData, scanTime)
    if not EasyAuctionDB then
        return 0, 0
    end
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    EasyAuctionDB.HourlyMinPrice = EasyAuctionDB.HourlyMinPrice or {}
    EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}

    local keepPerItem = EA_ClampInt(EasyAuctionDB.scanKeepPerItem or 120, 120, 20, 500)
    local hour = tonumber(date("%H"))
    local today = date("%Y-%m-%d")
    local storedAt = tonumber(scanTime) or time()
    local newCount, updateCount = 0, 0

    for key, bucket in pairs(batchData or {}) do
        local records = {}
        for _, rec in pairs(bucket.byUnit or {}) do
            records[#records + 1] = {
                unit = rec.unit,
                count = rec.count,
                t = tonumber(rec.t) or storedAt,
            }
        end

        local compressed = EA_CompressHistoryRecords(records, keepPerItem, nil)
        if type(compressed) == "table" and #compressed > 0 then
            if EasyAuctionDB.PriceHistory[key] then
                updateCount = updateCount + 1
            else
                newCount = newCount + 1
            end

            local minUnit = tonumber(bucket.minUnit) or tonumber(compressed[1] and compressed[1].unit) or 0
            local maxUnit = tonumber(bucket.maxUnit) or minUnit
            local minCount = tonumber(bucket.minCount) or 0
            local totalCount = tonumber(bucket.totalCount) or 0

            EasyAuctionDB.PriceHistory[key] = compressed
            EasyAuctionDB.PriceHistory[key].minUnit = minUnit
            EasyAuctionDB.PriceHistory[key].lastScanT = storedAt
            EA_UpdateItemIDIndexForKey(key, minUnit)

            EasyAuctionDB.HourlyMinPrice[key] = EasyAuctionDB.HourlyMinPrice[key] or {}
            local foundHourly = false
            for _, record in ipairs(EasyAuctionDB.HourlyMinPrice[key]) do
                if record[1] == hour then
                    record[2] = minUnit
                    record[3] = minCount
                    record[4] = totalCount
                    foundHourly = true
                    break
                end
            end
            if not foundHourly then
                table.insert(EasyAuctionDB.HourlyMinPrice[key], { hour, minUnit, minCount, totalCount })
            end

            EasyAuctionDB.DailyMinPrice[key] = EasyAuctionDB.DailyMinPrice[key] or {}
            local foundDaily = false
            for _, daily in ipairs(EasyAuctionDB.DailyMinPrice[key]) do
                if daily[1] == today then
                    daily[2] = minUnit
                    daily[3] = minCount
                    daily[4] = minUnit
                    daily[5] = maxUnit
                    daily[6] = totalCount
                    foundDaily = true
                    break
                end
            end
            if not foundDaily then
                table.insert(EasyAuctionDB.DailyMinPrice[key], { today, minUnit, minCount, minUnit, maxUnit, totalCount })
            end
        end
    end

    return newCount, updateCount
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

PriceFrame:SetFrameStrata("FULLSCREEN_DIALOG")
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

local _EA_nextTooltipPriceInfo = {}

local function EasyAuction_OnTooltipItem()
    -- 闭包缓存
    local lastItemID = nil
    local lastResult = {}

    return function(tip, link, count)
        if not EasyAuctionDB.ShowPrice then return end
        if not link or not tip or not tip.AddDoubleLine then return end
        count = (count and count > 0) and count or 1

        -- 获取 itemID
        local itemID = tonumber(link:match("item:(%d+):"))
        local name, _, quality, itemLevel, _, _, _, _, _, _, sellPrice, classID = GetItemInfo(link)
        if not itemID then return end

        -- 缓存命中
        local curUnit, curTime, minUnit, minTime
        if lastItemID == itemID then
            curUnit, curTime, minUnit, minTime = lastResult.curUnit, lastResult.curTime, lastResult.minUnit,
                lastResult.minTime
        else
            curUnit, curTime, minUnit, minTime = nil, nil, nil, nil
            if EasyAuctionDB.enablePrice then
                local timeWindow = 1800 -- 30分钟
                local idHistories = EasyAuction_ItemID_Index[itemID]
                if idHistories then
                    local latestTime = nil
                    for _, entry in ipairs(idHistories) do
                        local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[entry.key]
                        if type(history) == "table" and #history > 0 then
                            for _, v in ipairs(history) do
                                if v.unit and v.t and (not latestTime or v.t > latestTime) then
                                    latestTime = v.t
                                end
                            end
                        end
                    end
                    -- 30分钟内的最低价
                    if latestTime then
                        for _, entry in ipairs(idHistories) do
                            local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[entry.key]
                            if type(history) == "table" and #history > 0 then
                                for _, v in ipairs(history) do
                                    if v.unit and v.t and v.t >= latestTime - timeWindow then
                                        if not curUnit or v.unit < curUnit then
                                            curUnit = v.unit
                                            curTime = v.t
                                            minTime = v.t
                                        end
                                    end
                                end
                            end
                            -- 聚合全局史低
                            if entry.minUnit and (not minUnit or entry.minUnit < minUnit) then
                                minUnit = entry.minUnit
                            end
                        end
                    end
                end
            end
            -- 缓存本次结果
            lastItemID = itemID
            lastResult.curUnit = curUnit
            lastResult.curTime = curTime
            lastResult.minUnit = minUnit
            lastResult.minTime = minTime
        end

        if EasyAuctionDB.enablePrice then
            -- 卖店价
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

            if EasyAuctionDB.ShowMinPrice and minUnit and minUnit ~= curUnit then
                if showUnitPrice() and count > 1 then
                    tip:AddDoubleLine(
                        "|cff80ff80史低|r",
                        FormatGoldIcon(minUnit * count) .. "（总价）",
                        0, 1, 0.5, 1, 1, 1
                    )
                else
                    tip:AddDoubleLine(
                        "|cff80ff80史低|r",
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
                        "|cff00ff99分解收益|r",
                        FormatGoldIcon(maxV, 12),
                        0, 1, 0, 1, 1, 1
                    )
                end
                if EasyAuctionDB.enableDisenchantProb then
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
        end

        if IsProspectableOre(itemID) and EasyAuctionDB.enableProspect then
            local prospectValue = GetProspectValue(itemID)
            if prospectValue and prospectValue > 0 then
                tip:AddDoubleLine(
                    "|cff00bfff选矿收益|r",
                    FormatGoldIcon(prospectValue, 12),
                    1, 0.8, 0, 1, 1, 1
                )
            else
                tip:AddDoubleLine(
                    "|cff00bfff选矿收益|r",
                    "|cff888888未知|r",
                    0.7, 0.7, 0.7, 1, 1, 1
                )
            end
        end

        if IsMillableHerb(itemID) and EasyAuctionDB.enableMill then
            local millValue = GetMillValue(itemID)

            if millValue and millValue > 0 then
                tip:AddDoubleLine(
                    "|cff00bfff研磨收益|r",
                    FormatGoldIcon(millValue, 12),
                    1, 0.8, 0, 1, 1, 1
                )
            else
                tip:AddDoubleLine(
                    "|cff00bfff研磨收益|r",
                    "|cff888888未知|r",
                    0.7, 0.7, 0.7, 1, 1, 1
                )
            end
        end

        if EasyAuctionDB.enableTitanValue then
            local titan

            for _, arr in pairs(ns.EA_CATEGORY_LIST) do
                for _, info in ipairs(arr) do
                    local _, id, t = unpack(info)
                    if tonumber(id) == itemID and t and tonumber(t) > 0 then
                        titan = tonumber(t)
                        break
                    end
                end
                if titan then break end
            end

            if titan and titan > 0 then
                tip:AddDoubleLine(
                    "|cffffaa00兑换需碎片|r",
                    tostring(titan) .. " |TInterface\\Icons\\Inv_ingot_titansteel_dark:10:10:0:0|t",
                    0.27, 0.82, 0.82, 1, 1, 1
                )
                local unitPrice = curUnit or minUnit
                if unitPrice and unitPrice > 0 then
                    local tv = math.floor(unitPrice / titan + 0.5)
                    tip:AddDoubleLine(
                        "|cffffaa00每碎片价值|r",
                        FormatGoldIcon(tv, 12),
                        0.27, 0.82, 0.82, 1, 1, 1
                    )
                else
                    tip:AddDoubleLine(
                        "|cffffaa00碎片价值|r",
                        "|cff888888未知|r",
                        0.7, 0.7, 0.7, 1, 1, 1
                    )
                end
            end
        end

        tip:Show()
    end
end

EasyAuction_OnTooltipItem = EasyAuction_OnTooltipItem()
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
            local bidDiscount = EasyAuctionDB.bidDiscount or 0.99
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

        f.scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
        f.scroll:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -110)
        f.scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 12)

        f.content = CreateFrame("Frame", nil, f.scroll)
        f.scroll:SetScrollChild(f.content)
        f.content:SetSize(FRAME_WIDTH - 42, ROW_HEIGHT * MAX_ROWS)
        f.content.rows = {}

        f:EnableMouseWheel(true)
        f:SetScript("OnMouseWheel", function(self, delta)
            local scrollbar = f.scroll:GetVerticalScrollBar()
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
        closeBtn:SetScript("OnClick", function()
            f:Hide()
            collectgarbage("collect")
        end)
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
        count = tonumber(count) or 0
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
    if IsScanningAll or IsScanningCategory then return end

    local DB = EasyAuctionDB or {}
    DB.PriceHistory = DB.PriceHistory or {}
    local n = GetNumAuctionItems("list")
    local today = date("%Y-%m-%d")
    local hour = tonumber(date("%H"))

    local keepPerItem = EA_ClampInt(DB.scanKeepPerItem or 120, 120, 20, 500)
    local nowTs = time()
    local batchData = {} -- key = name:itemID -> { byUnit = {}, minUnit/maxUnit/totalCount/... }
    local lastSearchMap = {}
    local searchItemIDs = {}

    for i = 1, n do
        local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list", i)
        local link = GetAuctionItemLink("list", i)
        if name and itemID and buyout and buyout > 0 and count and count > 0 then
            local unit = math.floor((buyout / count) + 0.5)
            local key = name .. ":" .. itemID
            batchData[key] = batchData[key] or {
                byUnit = {},
                minUnit = nil,
                minCount = 0,
                maxUnit = nil,
                maxCount = 0,
                totalCount = 0,
            }
            local bucket = batchData[key]
            local unitKey = tostring(unit)
            local unitRec = bucket.byUnit[unitKey]
            if unitRec then
                unitRec.count = (unitRec.count or 0) + count
                if nowTs > (unitRec.t or 0) then
                    unitRec.t = nowTs
                end
            else
                bucket.byUnit[unitKey] = {
                    unit = unit,
                    count = count,
                    t = nowTs,
                }
            end
            bucket.totalCount = (bucket.totalCount or 0) + count
            if not bucket.minUnit or unit < bucket.minUnit then
                bucket.minUnit = unit
                bucket.minCount = count
            elseif unit == bucket.minUnit then
                bucket.minCount = (bucket.minCount or 0) + count
            end
            if not bucket.maxUnit or unit > bucket.maxUnit then
                bucket.maxUnit = unit
                bucket.maxCount = count
            elseif unit == bucket.maxUnit then
                bucket.maxCount = (bucket.maxCount or 0) + count
            end

            AddRecentSearch(itemID, name, unit, nowTs)

            if lastSearchName and name == lastSearchName then
                if not lastSearchMap[itemID] then
                    lastSearchMap[itemID] = { searchList = {}, searchMinUnit = nil }
                    table.insert(searchItemIDs, itemID)
                end
                table.insert(lastSearchMap[itemID].searchList, {
                    count = count,
                    unit = unit,
                    t = nowTs,
                    owner = owner,
                    itemID = itemID,
                    link = link,
                })
                if not lastSearchMap[itemID].searchMinUnit or unit < lastSearchMap[itemID].searchMinUnit then
                    lastSearchMap[itemID].searchMinUnit = unit
                end
            end
        end
    end

    for key, bucket in pairs(batchData) do
        local minUnit = bucket.minUnit
        local minCount = bucket.minCount or 0
        local maxUnit = bucket.maxUnit or minUnit
        local totalCount = bucket.totalCount or 0

        local records = {}
        for _, rec in pairs(bucket.byUnit or {}) do
            records[#records + 1] = rec
        end
        local compressed = EA_CompressHistoryRecords(records, keepPerItem, nil)
        if type(compressed) == "table" and #compressed > 0 then
            DB.PriceHistory[key] = compressed
            DB.PriceHistory[key].minUnit = minUnit or compressed[1].unit or 0
            DB.PriceHistory[key].lastScanT = nowTs
            EA_UpdateItemIDIndexForKey(key, DB.PriceHistory[key].minUnit)
        else
            DB.PriceHistory[key] = nil
            EA_RemoveItemIDIndexForKey(key)
        end

        DB.HourlyMinPrice = DB.HourlyMinPrice or {}
        DB.HourlyMinPrice[key] = DB.HourlyMinPrice[key] or {}
        local foundHourly = false
        for _, record in ipairs(DB.HourlyMinPrice[key]) do
            if record[1] == hour then
                record[2] = minUnit
                record[3] = minCount
                record[4] = totalCount
                foundHourly = true
                break
            end
        end
        if not foundHourly then
            table.insert(DB.HourlyMinPrice[key], { hour, minUnit, minCount, totalCount })
        end

        DB.DailyMinPrice = DB.DailyMinPrice or {}
        DB.DailyMinPrice[key] = DB.DailyMinPrice[key] or {}
        local foundDaily = false
        for _, daily in ipairs(DB.DailyMinPrice[key]) do
            if daily[1] == today then
                -- {date, unit, count, min, max, totalCount}
                daily[2] = minUnit
                daily[3] = minCount
                daily[4] = minUnit
                daily[5] = maxUnit
                daily[6] = totalCount
                foundDaily = true
                break
            end
        end
        if not foundDaily then
            table.insert(DB.DailyMinPrice[key], { today, minUnit, minCount, minUnit, maxUnit, totalCount })
        end

        batchData[key] = nil
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
        local key = lastSearchName .. ":" .. (searchItemIDs[1] or "")
        EasyAuction_UpdateInlineDistribution(key,
            lastSearchMap[searchItemIDs[1]] and lastSearchMap[searchItemIDs[1]].searchList)
        RefreshMinPriceLines(lastSearchName, searchItemIDs[1])
    elseif lastSearchName == nil and n > 0 then
        local name, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, itemID = GetAuctionItemInfo("list", 1)
        if name and itemID then
            local key = name .. ":" .. itemID
            local history = DB.PriceHistory[key]
            EasyAuction_UpdateInlineDistribution(key, history)
            RefreshMinPriceLines(name, itemID)
        end
    elseif #searchItemIDs > 0 and not curName then
        local key = lastSearchName .. ":" .. searchItemIDs[1]
        EasyAuction_UpdateInlineDistribution(key,
            lastSearchMap[searchItemIDs[1]] and lastSearchMap[searchItemIDs[1]].searchList)
        RefreshMinPriceLines(lastSearchName, searchItemIDs[1])
    end

    RefreshRecentSearchRows(true)
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
    if IsScanningAll or IsScanningCategory then
        IsScanningAll = false
        IsScanningCategory = false
        if type(UpdateScanBtnState) == "function" then
            UpdateScanBtnState()
        end
        if type(UpdateAuctionQueryStatusText) == "function" then
            UpdateAuctionQueryStatusText()
        end
        if type(EasyAuction_HideScanProgress) == "function" then
            EasyAuction_HideScanProgress()
        end
    end
    PriceFrame:Hide()
    if EasyAuction_DistributionFrame then EasyAuction_DistributionFrame:Hide() end
    collectgarbage("collect")
end)

DBFrame = EasyAuctionDBFrame
if DBFrame.SetBackdrop then
    DBFrame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 18,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
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
resetBtn:SetPoint("BOTTOMRIGHT", DBFrame, "BOTTOMRIGHT", -20, 20)
resetBtn:SetText("|TInterface/Icons/INV_Misc_Coin_01:12:12:0:0|t 重置数据")
resetBtn:Hide()

DBFrame:HookScript("OnShow", function()
    resetBtn:Show()
end)
DBFrame:HookScript("OnHide", function()
    if resetBtn then resetBtn:Hide() end
    collectgarbage("collect")
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

local normalHeaders = {
    { name = "序", key = "idx", width = 30 },
    { name = "物品名", key = "name", width = 180 },
    { name = "在售数", key = "num", width = 70 },
    { name = "历史最低", key = "history", width = 120 },
    { name = "最新单价", key = "min", width = 120 },
    { name = "碎片数", key = "titan", width = 70 },
    { name = "每碎片价值", key = "titanValue", width = 120 },
    { name = "采集时间", key = "t", width = 80 },
    { name = "走势", key = "action", width = 80 },
}

local currentSortKey = "t"
local currentSortReverse = true

EASYAUCTION_HELP_TEXT = [[
|cffffd700EasyAuction拍卖行插件说明|r

|cff00bfff1、自动采集拍卖价格|r

|cffffd700进入拍卖行后，需先在【搜索】页面搜索你关心的物品，或使用全局扫描进行价格采集。|r

搜索或扫描后，插件会自动采集和记录市场在售最低价与历史价格，拍卖的物品价格才会准确！

|cff00bfff2、快速上架与价格参考|r
切换到【拍卖】页面，把物品拖入上架栏，会自动弹出历史价格，点击可一键填入单价。
支持自动压价、跟价、复制价格、一键上架等。

|cff00bfff3、价格数据库与走势|r
点击【价格库】可浏览所有采集过的物品历史价格、最低价、日K线走势图等。

|cff00bfff4、商机发现|r
在价格库内可通过“寻找商机”快速筛选低于市场价、套利空间大的物品，辅助倒买倒卖。

|cff00bfff5、常用与最近|r
插件自动记录最近搜索与常用物品，便于下次一键查询或上架。

|cffff8800常用命令|r
|cffffde00/epah|r —— 打开价格数据库界面
|cffffde00/epsp|r —— 开关物品鼠标提示中的价格与分解信息

|cffff8800小技巧|r
- 建议在背包中Shift+左键背包物品自动填入搜索框进行搜索
- 待售库存列表中，左键复制，右键快速上架或移除常用
- “开始拍卖”按钮支持宏调用 /click EasyAuctionStartBtn

|cffff4040注意事项|r
- 价格仅供参考，谨慎定价，避免被低价误导
- 拍卖行长时间未刷新建议点“刷新”获取新价
- 如遇界面卡顿、冲突可用“极简模式”排查插件冲突

|cff00ff00EasyAuction|r —— 专注简洁高效的拍卖体验！
]]

local ROWS_NUM = 12
local currentPage = 1
local totalPages = 1
local dbItemList = {}
local prevBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
prevBtn:SetSize(60, 22)
prevBtn:SetPoint("BOTTOMLEFT", 15, 35)
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
        btn:SetSize(870, 22)
        btn:SetPoint("TOPLEFT", 10, -65 - (i - 1) * 23)
        btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
        btn:Hide()
        btn.cols = {}

        for j, col in ipairs(normalHeaders) do
            local fs = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
            btn.cols[j] = fs
            fs:SetWidth(col.width)
            if j == 1 then
                fs:SetPoint("LEFT", btn, "LEFT", 0, 0)
            elseif j == 2 then
                fs:SetPoint("LEFT", btn, "LEFT", 4, 0)
                fs.clickBtn = CreateFrame("Button", nil, btn)
                fs.clickBtn:SetAllPoints(fs)
                fs.clickBtn:SetFrameLevel(btn:GetFrameLevel() + 5)
                fs.clickBtn:EnableMouse(true)
                fs.clickBtn:RegisterForClicks("LeftButtonUp")
                fs.clickBtn:Hide()
                fs:SetWordWrap(false)
                fs:SetNonSpaceWrap(false)
                if fs.SetEllipsizeMode then
                    fs:SetEllipsizeMode("END")
                end
            elseif j == 2 or j == 4 or j == 5 or j == 7 then
                fs:SetJustifyH("RIGHT")
                fs:SetFont(GameFontHighlightSmall:GetFont(), 12)
            else
                fs:SetPoint("LEFT", btn.cols[j - 1], "RIGHT", 4, 0)
            end
            if j == 1 then
                fs:SetJustifyH("CENTER")
            elseif j == 2 then
                fs:SetJustifyH("LEFT")
            elseif j == #normalHeaders or j == #normalHeaders - 1 then
                fs:SetJustifyH("CENTER")
            else
                fs:SetJustifyH("RIGHT")
            end
        end

        DBFrame.rows[i] = btn
    end
end

local searchEditBox = nil
CurrentSearchText = ""

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
        CurrentSearchText = txt or ""
        if EA_CategoryMode then
            EA_ShowCategory(EA_CategoryMode, 1, txt)
        else
            RefreshDBFrame()
        end
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
        searchEditBox:SetText(CurrentSearchText or "")
        searchEditBox.placeholder:SetShown((CurrentSearchText or "") == "")
    end
end)

local function BuildDBItemList()
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    dbItemList = {}
    local filter = (CurrentSearchText or ""):lower()
    local idx = 0
    local itemID2Titan = EA_GetCategoryTitanMap()
    local uniqueKeys = {}
    for name, data in pairs(EasyAuctionDB.PriceHistory) do
        if filter == "" or tostring(name):lower():find(filter, 1, true) then
            if not uniqueKeys[name] then
                uniqueKeys[name] = true
                local stats = EA_GetHistoryStats(name)
                local min = stats.minUnit
                local t = stats.latestTime
                local minHistory = stats.historyMin
                local _, itemID = tostring(name):match("^(.-):(%d+)$")
                local foundItemID = tonumber(itemID)

                if min and foundItemID then
                    idx = idx + 1
                    local snapshotCount = stats.snapshotCount or 0
                    local key = name
                    local titan, titanValue, titanValueRaw
                    titan = itemID2Titan[foundItemID]
                    if titan and tonumber(titan) > 0 and min > 0 then
                        titanValueRaw = min / titan
                        titanValue = FormatGoldIcon(math.floor(titanValueRaw + 0.5))
                    end

                    dbItemList[#dbItemList + 1] = {
                        idx = idx,
                        name = name, -- 现在就是 name:itemid 格式
                        num = snapshotCount,
                        snapshot = snapshotCount,
                        history = minHistory,
                        min = min,
                        t = t,
                        data = data,
                        link = nil, -- link 已移除
                        titan = titan or "-",
                        titanValue = titanValue or "-",
                        titanValueRaw = titanValueRaw,
                    }
                end
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
        elseif key == "num" or key == "snapshot" then
            local sa, sb = a.snapshot or 0, b.snapshot or 0
            if currentSortReverse then
                return sa > sb
            else
                return sa < sb
            end
        elseif key == "history" then
            if currentSortReverse then
                return (a.history or 0) > (b.history or 0)
            else
                return (a.history or 0) < (b.history or 0)
            end
        elseif key == "min" then
            if currentSortReverse then
                return (a.min or 0) > (b.min or 0)
            else
                return (a.min or 0) < (b.min or 0)
            end
        elseif key == "titan" then
            if currentSortReverse then
                return (tonumber(a.titan) or 0) > (tonumber(b.titan) or 0)
            else
                return (tonumber(a.titan) or 0) < (tonumber(b.titan) or 0)
            end
        elseif key == "titanValue" then
            local va = tonumber(a.titanValueRaw) or 0
            local vb = tonumber(b.titanValueRaw) or 0
            if currentSortReverse then
                return va > vb
            else
                return va < vb
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
        EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage, CurrentSearchText)
        return
    end

    if DBFrame.EA_CategoryHeaderBtns then
        for _, btn in ipairs(DBFrame.EA_CategoryHeaderBtns) do btn:Hide() end
    end

    if searchEditBox then searchEditBox:Show() end
    if resetBtn then resetBtn:Show() end
    if opportunityBtn then opportunityBtn:Show() end

    if not DBFrame.NormalHeaderBtns then DBFrame.NormalHeaderBtns = {} end
    for j, col in ipairs(normalHeaders) do
        local btn = DBFrame.NormalHeaderBtns[j]
        if not btn then
            btn = CreateFrame("Button", nil, DBFrame)
            btn:SetSize(col.width, 24)
            btn:SetFrameLevel(DBFrame:GetFrameLevel() + 10)
            if j == 1 then
                btn:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", 10, -40)
            else
                btn:SetPoint("LEFT", DBFrame.NormalHeaderBtns[j - 1], "RIGHT", 0, 0)
            end
            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetColorTexture(0.93, 0.95, 0.98, 0.2)
            btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")

            btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            btn.text:SetPoint("CENTER")
            btn.text:SetJustifyH("CENTER")
            btn.text:SetWidth(col.width)
            btn.text:Show()

            btn.sep = btn:CreateTexture(nil, "OVERLAY")
            btn.sep:SetColorTexture(0.7, 0.7, 0.7, 0.7)
            btn.sep:SetWidth(1)
            btn.sep:SetPoint("TOPRIGHT", btn, "TOPRIGHT", 0, -2)
            btn.sep:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 0, 2)
            btn.sep:Show()

            DBFrame.NormalHeaderBtns[j] = btn
        end
        if j == #normalHeaders then
            btn.sep:Hide()
        else
            btn.sep:Show()
        end

        btn:EnableMouse(true)
        btn:SetScript("OnEnter", function(self)
            self.bg:SetColorTexture(0.68, 0.83, 1, 0.3)
        end)
        btn:SetScript("OnLeave", function(self)
            self.bg:SetColorTexture(0.93, 0.95, 0.98, 0.2)
        end)
        if col.key and col.key ~= "action" then
            btn:SetScript("OnClick", function()
                if currentSortKey == col.key then
                    currentSortReverse = not currentSortReverse
                else
                    currentSortKey = col.key
                    currentSortReverse = false
                end
                RefreshDBFrame()
            end)
        else
            btn:SetScript("OnClick", nil)
        end
        local arrow = (currentSortKey == col.key and col.key ~= "action") and
            (currentSortReverse and " ▼" or " ▲") or ""
        btn.text:SetText(col.name .. arrow)
        btn.text:Show()
        btn:Show()
    end

    BuildDBItemList()
    if currentPage > totalPages then currentPage = totalPages end
    if currentPage < 1 then currentPage = 1 end
    local start = (currentPage - 1) * ROWS_NUM + 1

    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        local item = dbItemList[start + i - 1]

        if not row.bg then
            row.bg = row:CreateTexture(nil, "BACKGROUND")
            row.bg:SetAllPoints()
        end
        if i % 2 == 1 then
            row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
        else
            row.bg:SetColorTexture(1, 1, 1, 0.1)
        end

        row:EnableMouse(true)
        row:SetScript("OnEnter", function(self)
            if self.bg then self.bg:SetColorTexture(0.68, 0.83, 1, 0.2) end
            self:LockHighlight()
        end)
        row:SetScript("OnLeave", function(self)
            if self.bg then
                if i % 2 == 1 then
                    self.bg:SetColorTexture(0.96, 0.98, 1, 0.2)
                else
                    self.bg:SetColorTexture(1, 1, 1, 0.1)
                end
            end
            self:UnlockHighlight()
        end)

        for j, col in ipairs(normalHeaders) do
            local cell = row.cols[j]
            if not cell then
                cell = row:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
                row.cols[j] = cell
            end
            cell:ClearAllPoints()
            if j == 1 then
                cell:SetPoint("LEFT", row, "LEFT", 0, 0)
            else
                cell:SetPoint("LEFT", row.cols[j - 1], "RIGHT", 0, 0)
            end
            cell:SetWidth(col.width)
            if j == 1 then
                cell:SetJustifyH("CENTER")
            elseif j == 2 then
                cell:SetJustifyH("LEFT")
            elseif j == 3 or j == 4 or j == 5 or j == 6 or j == 7 then
                cell:SetJustifyH("RIGHT")
            elseif j == 8 then
                cell:SetJustifyH("CENTER")
            else
                cell:SetJustifyH("CENTER")
            end
            if not row.seps then row.seps = {} end
            if not row.seps[j] then
                local sep = row:CreateTexture(nil, "OVERLAY")
                sep:SetColorTexture(0.8, 0.8, 0.8, 0.5)
                sep:SetWidth(1)
                sep:SetPoint("TOPLEFT", cell, "TOPRIGHT", 2, 0)
                sep:SetPoint("BOTTOMLEFT", cell, "BOTTOMRIGHT", 2, 0)
                row.seps[j] = sep
            end
            if j == 1 or j == #normalHeaders then
                row.seps[j]:Hide()
            else
                row.seps[j]:Show()
            end
        end

        if item then
            row:Show()
            row.cols[1]:SetText(tostring(start + i - 1))

            -- icon和物品名：由 item.name 拆分
            local rName, itemID = tostring(item.name):match("^(.-):(%d+)$")
            itemID = tonumber(itemID)
            local icon = ""
            if itemID then
                local iconPath = GetItemIcon(itemID)
                if iconPath then
                    icon = "|T" .. iconPath .. ":16:16:0:0|t "
                end
            end
            -- 物品名显示
            row.cols[2]:SetText(icon .. ColorName(rName or "?", itemID))
            row.itemData = item

            -- 点击按钮逻辑
            if row.cols[2].clickBtn then
                row.cols[2].clickBtn:Show()
                row.cols[2].clickBtn:SetScript("OnClick", function(self, button)
                    local thisItem = row.itemData
                    if button == "LeftButton" and thisItem then
                        ShowPriceFrame(thisItem.name, thisItem.data)
                    end
                end)
                row.cols[2].clickBtn:SetScript("OnEnter", function(self)
                    row:LockHighlight()
                    local thisItem = row.itemData
                    local name = (thisItem and (thisItem.name or "")) or row.cols[2]:GetText()
                    local itemID = thisItem and
                        (thisItem.itemid or (thisItem.name and tostring(thisItem.name):match(":(%d+)$")))
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    if itemID then
                        local link = itemID and select(2, GetItemInfo(itemID)) or nil
                        if link then
                            GameTooltip:SetHyperlink(link)
                        else
                            GameTooltip:SetText(name, 1, 1, 1)
                        end
                    else
                        GameTooltip:SetText(name, 1, 1, 1)
                    end
                    if thisItem and thisItem.t then
                        GameTooltip:AddLine("采集时间：" .. date("%Y-%m-%d %H:%M", thisItem.t), 0.7, 0.7, 0.7)
                    end
                    GameTooltip:Show()
                end)
                row.cols[2].clickBtn:SetScript("OnLeave", function(self)
                    row:UnlockHighlight()
                    GameTooltip:Hide()
                end)
            end

            -- 统计数、历史最低、最新单价等
            local snapshotCount = 0
            local today = date("%Y-%m-%d")
            local key = item.name
            local dailyData = EasyAuctionDB.DailyMinPrice[key]
            local history = EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key]
            if dailyData then
                for _, record in ipairs(dailyData) do
                    if record[1] == today then
                        snapshotCount = record[6] or 0
                        break
                    end
                end
            end
            if snapshotCount == 0 and history then
                for _, v in ipairs(history) do
                    snapshotCount = snapshotCount + (v.count or 1)
                end
            end
            local minHistory = EasyAuctionDB.PriceHistory[item.name] and EasyAuctionDB.PriceHistory[item.name].minUnit
            for _, v in ipairs(EasyAuctionDB.PriceHistory[item.name] or {}) do
                if not minHistory or v.unit < minHistory then
                    minHistory = v.unit
                    EasyAuctionDB.PriceHistory[item.name].minUnit = minHistory
                end
            end
            row.cols[3]:SetText(snapshotCount > 0 and tostring(snapshotCount) or "-")
            row.cols[4]:SetText(minHistory and FormatGoldIcon(minHistory) or "-")
            row.cols[5]:SetText(FormatGoldIcon(item.min))
            row.cols[6]:SetText(item.titan or "-")
            row.cols[7]:SetText(item.titanValue or "-")
            row.cols[8]:SetText(item.t and EA_GetShortTime(item.t) or "-")
            if not row.trendBtn then
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetText("走势")
            end
            row.trendBtn:ClearAllPoints()
            row.trendBtn:SetPoint("LEFT", row.cols[8], "RIGHT", 8, 0)
            row.trendBtn:Show()
            row.trendBtn:SetEnabled(item.min and item.min > 0)
            row.trendBtn:SetScript("OnClick", function()
                EasyAuction_ShowChart(item.name)
            end)
            row.cols[9]:SetText("")
            row.cols[9]:Show()
        else
            row:Hide()
            if row.trendBtn then row.trendBtn:Hide() end
        end
    end

    prevBtn:SetShown(totalPages > 1)
    nextBtn:SetShown(totalPages > 1)
    prevBtn:SetEnabled(currentPage > 1)
    nextBtn:SetEnabled(currentPage < totalPages)
    pageText:SetText(string.format("第%d/%d页", currentPage, totalPages))
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
    EasyAuction_UpdateCategoryButtonHighlight()
end

resetBtn:SetScript("OnClick", function()
    StaticPopupDialogs["EASYAUCTION_RESET_DB"] = {
        text = "确定要清空所有拍卖历史记录和设置吗？此操作不可恢复！",
        button1 = "确定",
        button2 = "取消",
        OnAccept = function()
            EasyAuctionDB = EasyAuction_ResetSavedVariables(true)

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

local EA_CATEGORIES = { "全类", "矿石", "草药", "附魔", "珠宝", "布皮", "元素", "药剂", "鱼类", "常用" }

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
    if DBFrame.EA_CategoryManageBtn then
        local canManage = EA_CategoryMode and EA_CategoryMode ~= "全类"
        DBFrame.EA_CategoryManageBtn:SetEnabled(canManage and true or false)
        DBFrame.EA_CategoryManageBtn:SetAlpha(canManage and 1 or 0.6)
    end
    if DBFrame.EA_ExportBtn then
        DBFrame.EA_ExportBtn:SetEnabled(true)
        DBFrame.EA_ExportBtn:SetAlpha(1)
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
                btn:SetPoint("BOTTOMLEFT", DBFrame, "BOTTOMLEFT", firstBtnX, 10)
                btn:SetNormalFontObject(GameFontNormalLarge)
                btn:GetFontString():SetTextColor(1, 1, 1, 1)
            else
                btn:SetPoint("LEFT", DBFrame.EA_CategoryBtns[i - 1], "RIGHT", btnSpacing, 0)
            end
            btn:SetScript("OnClick", function()
                EA_ActiveCategory = cat
                EA_ShowCategory(cat, 1, CurrentSearchText)
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

if not DBFrame.EA_CategoryReturnBtn then
    DBFrame.EA_CategoryReturnBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
    DBFrame.EA_CategoryReturnBtn:SetSize(60, 22)
    DBFrame.EA_CategoryReturnBtn:SetPoint("BOTTOMLEFT", DBFrame, "BOTTOMLEFT", 15, 10)
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

local function EA_BuildCategoryEditorText(cat)
    local lines = {}
    for _, info in ipairs(EA_GetCategoryEntries(cat)) do
        local titan = tonumber(info[3]) or 0
        if titan > 0 then
            lines[#lines + 1] = string.format("%d,%s,%d", tonumber(info[2]) or 0, tostring(info[1] or ""), titan)
        else
            lines[#lines + 1] = string.format("%d,%s", tonumber(info[2]) or 0, tostring(info[1] or ""))
        end
    end
    return table.concat(lines, "\n")
end

local function EA_BuildCategoryEditorTextFromEntries(entries)
    local lines = {}
    for _, info in ipairs(entries or {}) do
        local titan = tonumber(info[3]) or 0
        if titan > 0 then
            lines[#lines + 1] = string.format("%d,%s,%d", tonumber(info[2]) or 0, tostring(info[1] or ""), titan)
        else
            lines[#lines + 1] = string.format("%d,%s", tonumber(info[2]) or 0, tostring(info[1] or ""))
        end
    end
    return table.concat(lines, "\n")
end

local function EA_ParseCategoryEditorText(text)
    local entries = {}
    local indexByID = {}
    local errorLine = nil
    text = tostring(text or ""):gsub("，", ",")
    for line in text:gmatch("[^\r\n]+") do
        local cleanLine = EA_TrimText(line)
        if cleanLine ~= "" then
            local itemID, itemName, titan = cleanLine:match("^(%d+)%s*,%s*([^,]+)%s*,%s*(%-?%d+)%s*$")
            if not itemID then
                itemID, itemName = cleanLine:match("^(%d+)%s*,%s*(.+)%s*$")
            end
            local entry = EA_SanitizeCategoryEntry(itemName, itemID, titan)
            if not entry then
                errorLine = cleanLine
                break
            end
            local itemKey = tonumber(entry[2])
            if indexByID[itemKey] then
                entries[indexByID[itemKey]] = entry
            else
                indexByID[itemKey] = #entries + 1
                entries[#entries + 1] = entry
            end
        end
    end
    return entries, errorLine
end

local function EA_RefreshCategoryViewsAfterEdit(cat)
    if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() then
        if cat and EA_CategoryMode == cat then
            EA_ShowCategory(cat, 1, CurrentSearchText)
        else
            RefreshDBFrame()
        end
    end
    if cat == "常用" and type(RefreshFavoriteRows) == "function" then
        RefreshFavoriteRows()
    end
end

function EasyAuction_ShowCategoryManager(cat)
    cat = cat or EA_CategoryMode
    if not cat or cat == "全类" then
        print("|cffff0000[EasyAuction]|r 请先在价格库选择一个具体分类。")
        return
    end

    if not EasyAuctionCategoryManagerFrame then
        local f = CreateFrame("Frame", "EasyAuctionCategoryManagerFrame", UIParent, "BackdropTemplate")
        f:SetSize(420, 470)
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
        tinsert(UISpecialFrames, "EasyAuctionCategoryManagerFrame")

        local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        title:SetPoint("TOP", 0, -18)
        f.title = title

        local desc = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        desc:SetPoint("TOPLEFT", 20, -46)
        desc:SetPoint("RIGHT", -20, 0)
        desc:SetJustifyH("LEFT")
        desc:SetText("每行格式：物品ID,物品名[,碎片数]。添加可用上方输入，删除可直接删掉对应行后保存。")
        f.desc = desc

        local idLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        idLabel:SetPoint("TOPLEFT", 20, -76)
        idLabel:SetText("物品ID")

        local idEdit = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
        idEdit:SetSize(70, 20)
        idEdit:SetPoint("LEFT", idLabel, "RIGHT", 6, 0)
        idEdit:SetAutoFocus(false)
        idEdit:SetNumeric(true)
        f.idEdit = idEdit

        local nameLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        nameLabel:SetPoint("LEFT", idEdit, "RIGHT", 10, 0)
        nameLabel:SetText("物品名")

        local nameEdit = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
        nameEdit:SetSize(120, 20)
        nameEdit:SetPoint("LEFT", nameLabel, "RIGHT", 6, 0)
        nameEdit:SetAutoFocus(false)
        f.nameEdit = nameEdit

        local titanLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        titanLabel:SetPoint("TOPLEFT", 20, -104)
        titanLabel:SetText("碎片数")

        local titanEdit = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
        titanEdit:SetSize(60, 20)
        titanEdit:SetPoint("LEFT", titanLabel, "RIGHT", 6, 0)
        titanEdit:SetAutoFocus(false)
        titanEdit:SetNumeric(true)
        titanEdit:SetText("0")
        f.titanEdit = titanEdit

        local addBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        addBtn:SetSize(72, 22)
        addBtn:SetPoint("LEFT", titanEdit, "RIGHT", 14, 0)
        addBtn:SetText("添加/替换")
        f.addBtn = addBtn

        local contentBG = CreateFrame("Frame", nil, f, "BackdropTemplate")
        contentBG:SetPoint("TOPLEFT", 20, -132)
        contentBG:SetPoint("BOTTOMRIGHT", -20, 62)
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
        editBox:SetAutoFocus(false)
        editBox:SetWidth(340)
        editBox:SetHeight(260)
        scrollFrame:SetScrollChild(editBox)
        f.editBox = editBox

        local warnBar = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        warnBar:SetPoint("BOTTOMLEFT", 20, 40)
        warnBar:SetPoint("RIGHT", -20, 0)
        warnBar:SetJustifyH("LEFT")
        warnBar:SetText("")
        warnBar:Hide()
        f.warnBar = warnBar

        local saveBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        saveBtn:SetSize(72, 24)
        saveBtn:SetPoint("BOTTOMRIGHT", -20, 16)
        saveBtn:SetText("保存")

        local resetBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        resetBtn:SetSize(72, 24)
        resetBtn:SetPoint("RIGHT", saveBtn, "LEFT", -8, 0)
        resetBtn:SetText("重置")

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        closeBtn:SetSize(72, 24)
        closeBtn:SetPoint("RIGHT", resetBtn, "LEFT", -8, 0)
        closeBtn:SetText("关闭")
        closeBtn:SetScript("OnClick", function()
            f:Hide()
        end)

        addBtn:SetScript("OnClick", function()
            local currentEntries, errorLine = EA_ParseCategoryEditorText(editBox:GetText())
            if errorLine then
                warnBar:SetText("|cffff4040存在格式错误行，先修正后再添加：|r" .. errorLine)
                warnBar:Show()
                return
            end
            local entry = EA_SanitizeCategoryEntry(nameEdit:GetText(), idEdit:GetText(), titanEdit:GetText())
            if not entry then
                warnBar:SetText("|cffff4040请输入有效的物品ID和物品名。|r")
                warnBar:Show()
                return
            end
            local replaced = false
            for index, info in ipairs(currentEntries) do
                if tonumber(info[2]) == tonumber(entry[2]) then
                    currentEntries[index] = entry
                    replaced = true
                    break
                end
            end
            if not replaced then
                currentEntries[#currentEntries + 1] = entry
            end
            editBox:SetText(EA_BuildCategoryEditorTextFromEntries(currentEntries))
            nameEdit:SetText("")
            idEdit:SetText("")
            titanEdit:SetText("0")
            warnBar:Hide()
        end)

        saveBtn:SetScript("OnClick", function()
            local entries, errorLine = EA_ParseCategoryEditorText(editBox:GetText())
            if errorLine then
                warnBar:SetText("|cffff4040保存失败，存在格式错误行：|r" .. errorLine)
                warnBar:Show()
                return
            end
            EA_SetCategoryEntries(f.category, entries)
            warnBar:Hide()
            EA_RefreshCategoryViewsAfterEdit(f.category)
            print(string.format("|cff00ff00[EasyAuction]|r [%s] 分类列表已保存，共 %d 项。", f.category, #entries))
            f:Hide()
        end)

        resetBtn:SetScript("OnClick", function()
            EA_ResetCategoryEntries(f.category)
            editBox:SetText(EA_BuildCategoryEditorText(f.category))
            warnBar:Hide()
            EA_RefreshCategoryViewsAfterEdit(f.category)
            if f.category == "常用" then
                print("|cff00ff00[EasyAuction]|r 常用清单已清空。")
            else
                print(string.format("|cff00ff00[EasyAuction]|r [%s] 分类已恢复默认列表。", f.category))
            end
        end)

        EasyAuctionCategoryManagerFrame = f
    end

    local frame = EasyAuctionCategoryManagerFrame
    frame.category = cat
    frame.title:SetText(string.format("%s - 分类管理", cat))
    if cat == "常用" then
        frame.desc:SetText("常用清单与闪购页共用同一份数据。每行格式：物品ID,物品名[,碎片数]。删除可直接删行后保存，重置会清空当前常用。")
    else
        frame.desc:SetText("每行格式：物品ID,物品名[,碎片数]。添加可用上方输入，删除可直接删掉对应行后保存，重置可恢复默认分类。")
    end
    frame.editBox:SetText(EA_BuildCategoryEditorText(cat))
    frame.warnBar:Hide()
    frame.idEdit:SetText("")
    frame.nameEdit:SetText("")
    frame.titanEdit:SetText("0")
    frame:Show()
end

local function EA_FormatPricePlain(copper)
    local value = tonumber(copper)
    if not value or value <= 0 then
        return ""
    end
    local gold = math.floor(value / 10000)
    local silver = math.floor((value % 10000) / 100)
    local copperOnly = value % 100
    if gold > 0 then
        return string.format("%dg%02ds%02dc", gold, silver, copperOnly)
    elseif silver > 0 then
        return string.format("%ds%02dc", silver, copperOnly)
    end
    return string.format("%dc", copperOnly)
end

local function EA_BuildExportRows(cat)
    local rows = {}
    local titanMap = EA_GetCategoryTitanMap()

    local function appendRow(name, itemID, titan)
        local key = name .. ":" .. tostring(itemID)
        local stats = EA_GetHistoryStats(key)
        local titanCount = tonumber(titan) or tonumber(titanMap[itemID]) or 0
        local titanValue = ""
        if titanCount > 0 and stats.minUnit and stats.minUnit > 0 then
            titanValue = EA_FormatPricePlain(math.floor((stats.minUnit / titanCount) + 0.5))
        end
        rows[#rows + 1] = {
            name = name,
            itemID = tonumber(itemID) or 0,
            snapshot = stats.snapshotCount or 0,
            history = stats.historyMin and EA_FormatPricePlain(stats.historyMin) or "",
            min = stats.minUnit and EA_FormatPricePlain(stats.minUnit) or "",
            titan = titanCount > 0 and tostring(titanCount) or "",
            titanValue = titanValue,
            scanTime = stats.latestTime and date("%Y-%m-%d %H:%M", stats.latestTime) or "",
        }
    end

    if not cat or cat == "全库" then
        for key in pairs(EasyAuctionDB.PriceHistory or {}) do
            local name, itemID = tostring(key):match("^(.-):(%d+)$")
            itemID = tonumber(itemID)
            if name and itemID then
                appendRow(name, itemID, titanMap[itemID])
            end
        end
    else
        for _, info in ipairs(EA_GetCategoryEntries(cat)) do
            appendRow(tostring(info[1] or ""), tonumber(info[2]) or 0, tonumber(info[3]) or 0)
        end
    end

    table.sort(rows, function(a, b)
        return (a.name or "") < (b.name or "")
    end)
    return rows
end

local function EA_GenerateExportText(cat)
    local rows = EA_BuildExportRows(cat)
    if #rows == 0 then
        return nil, 0
    end
    local lines = { "物品名\t物品ID\t在售数\t历史最低价\t最新单价\t碎片数\t每碎片价值\t采集时间" }
    for _, row in ipairs(rows) do
        lines[#lines + 1] = table.concat({
            row.name or "",
            tostring(row.itemID or 0),
            tostring(row.snapshot or 0),
            row.history or "",
            row.min or "",
            row.titan or "",
            row.titanValue or "",
            row.scanTime or "",
        }, "\t")
    end
    return table.concat(lines, "\n"), #rows
end

function EasyAuction_ShowExportFrame(cat)
    local exportText, itemCount = EA_GenerateExportText(cat)
    if not exportText then
        print("|cffff0000[EasyAuction]|r 当前导出范围没有可用数据。")
        return
    end

    if not EasyAuctionExportFrame then
        local f = CreateFrame("Frame", "EasyAuctionExportFrame", UIParent, "BackdropTemplate")
        f:SetSize(680, 500)
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
        tinsert(UISpecialFrames, "EasyAuctionExportFrame")

        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        f.title:SetPoint("TOPLEFT", 18, -16)

        local tip = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        tip:SetPoint("TOPLEFT", 18, -40)
        tip:SetText("|cffffff00Ctrl+A 全选，Ctrl+C 复制，可直接粘贴到 Excel。|r")

        local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 16, -62)
        scroll:SetPoint("BOTTOMRIGHT", -36, 44)

        local editBox = CreateFrame("EditBox", nil, scroll)
        editBox:SetMultiLine(true)
        editBox:SetFontObject(ChatFontNormal)
        editBox:SetAutoFocus(false)
        editBox:SetWidth(620)
        editBox:SetHeight(360)
        scroll:SetScrollChild(editBox)
        f.editBox = editBox

        local selectBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        selectBtn:SetSize(80, 24)
        selectBtn:SetPoint("BOTTOMLEFT", 16, 12)
        selectBtn:SetText("全选")
        selectBtn:SetScript("OnClick", function()
            editBox:SetFocus()
            editBox:HighlightText()
        end)

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        closeBtn:SetSize(80, 24)
        closeBtn:SetPoint("BOTTOMRIGHT", -16, 12)
        closeBtn:SetText("关闭")
        closeBtn:SetScript("OnClick", function()
            f:Hide()
        end)

        EasyAuctionExportFrame = f
    end

    local frame = EasyAuctionExportFrame
    frame.title:SetText(string.format("价格库数据导出 - %s（%d条）", cat or "全库", itemCount))
    frame.editBox:SetText(exportText)
    frame:Show()
end

function EasyAuction_ShowExportSelector()
    if not EasyAuctionExportSelectorFrame then
        local f = CreateFrame("Frame", "EasyAuctionExportSelectorFrame", UIParent, "BackdropTemplate")
        f:SetSize(340, 220)
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
        tinsert(UISpecialFrames, "EasyAuctionExportSelectorFrame")

        local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        title:SetPoint("TOP", 0, -18)
        title:SetText("选择导出范围")

        local allBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        allBtn:SetSize(80, 22)
        allBtn:SetPoint("TOP", 0, -50)
        allBtn:SetText("全库导出")
        allBtn:SetScript("OnClick", function()
            f:Hide()
            EasyAuction_ShowExportFrame("全库")
        end)

        local buttons = {}
        for index, cat in ipairs(EA_SCAN_CATEGORIES) do
            local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            btn:SetSize(58, 22)
            local row = math.floor((index - 1) / 4)
            local col = (index - 1) % 4
            btn:SetPoint("TOPLEFT", f, "TOPLEFT", 24 + col * 72, -92 - row * 28)
            btn:SetText(cat)
            btn:SetScript("OnClick", function()
                f:Hide()
                EasyAuction_ShowExportFrame(cat)
            end)
            buttons[#buttons + 1] = btn
        end

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        closeBtn:SetSize(72, 24)
        closeBtn:SetPoint("BOTTOM", 0, 14)
        closeBtn:SetText("关闭")
        closeBtn:SetScript("OnClick", function()
            f:Hide()
        end)

        EasyAuctionExportSelectorFrame = f
    end

    EasyAuctionExportSelectorFrame:Show()
end

if not DBFrame.EA_CategoryManageBtn then
    DBFrame.EA_CategoryManageBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
    DBFrame.EA_CategoryManageBtn:SetSize(78, 22)
    DBFrame.EA_CategoryManageBtn:SetPoint("TOPRIGHT", DBFrame, "TOPRIGHT", -20, -12)
    DBFrame.EA_CategoryManageBtn:SetText("分类管理")
    DBFrame.EA_CategoryManageBtn:SetScript("OnClick", function()
        EasyAuction_ShowCategoryManager(EA_CategoryMode)
    end)
    DBFrame.EA_CategoryManageBtn:Hide()
end

if not DBFrame.EA_ExportBtn then
    DBFrame.EA_ExportBtn = CreateFrame("Button", nil, DBFrame, "UIPanelButtonTemplate")
    DBFrame.EA_ExportBtn:SetSize(72, 22)
    DBFrame.EA_ExportBtn:SetPoint("RIGHT", DBFrame.EA_CategoryManageBtn, "LEFT", -6, 0)
    DBFrame.EA_ExportBtn:SetText("数据导出")
    DBFrame.EA_ExportBtn:SetScript("OnClick", function()
        EasyAuction_ShowExportSelector()
    end)
    DBFrame.EA_ExportBtn:Hide()
end

DBFrame:HookScript("OnShow", function()
    if DBFrame.EA_CategoryManageBtn then DBFrame.EA_CategoryManageBtn:Show() end
    if DBFrame.EA_ExportBtn then DBFrame.EA_ExportBtn:Show() end
    EasyAuction_UpdateCategoryButtonHighlight()
end)

DBFrame:HookScript("OnHide", function()
    if DBFrame.EA_CategoryManageBtn then DBFrame.EA_CategoryManageBtn:Hide() end
    if DBFrame.EA_ExportBtn then DBFrame.EA_ExportBtn:Hide() end
end)

local function EA_AppendCategoryRow(list, categoryKey, name, itemID, titan)
    local key = name .. ":" .. tostring(itemID)
    local stats = EA_GetHistoryStats(key)
    local min = stats.minUnit
    local t = stats.latestTime
    local minHistory = stats.historyMin
    local snapshotCount = stats.snapshotCount or 0
    local titanValue, titanValueRaw = nil, nil
    local titanCount = (type(titan) == "number" and titan > 0) and titan or nil
    if titanCount and min and min > 0 then
        titanValueRaw = min / titanCount
        titanValue = FormatGoldIcon(math.floor(titanValueRaw + 0.5))
    end
    local entry = {
        idx = #list + 1,
        name = name,
        itemid = tonumber(itemID),
        titan = titanCount,
        min = tonumber(min) or nil,
        t = tonumber(t) or nil,
        key = key,
        titanValue = titanValue,
        titanValueRaw = titanValueRaw,
        snapshot = snapshotCount,
        history = minHistory,
    }
    if categoryKey == "矿石" then
        entry.prospectValue = GetProspectValue and GetProspectValue(itemID)
    elseif categoryKey == "草药" then
        entry.millValue = GetMillValue and GetMillValue(itemID)
    end
    list[#list + 1] = entry
end

function EA_ShowCategory(cat, page, searchText)
    EA_CategoryMode = cat

    local list = {}
    local headers = {}
    for i, h in ipairs(normalHeaders) do
        headers[i] = {}
        for k, v in pairs(h) do
            headers[i][k] = v
        end
    end
    if cat == "矿石" then
        headers[4].name = "选矿收益"
    elseif cat == "草药" then
        headers[4].name = "研磨收益"
    end

    if cat == "全类" then
        local merged = {}
        for _, key in ipairs(EA_SCAN_CATEGORIES) do
            if key ~= "常用" then
                for _, info in ipairs(EA_GetCategoryEntries(key)) do
                    local name, itemid, titan = unpack(info)
                    local uniqueKey = tostring(name) .. ":" .. tostring(itemid)
                    if not merged[uniqueKey] then
                        merged[uniqueKey] = true
                        EA_AppendCategoryRow(list, key, name, itemid, titan)
                    end
                end
            end
        end
    else
        for _, info in ipairs(EA_GetCategoryEntries(cat)) do
            local name, itemid, titan = unpack(info)
            if cat == "常用" then
                titan = nil
            end
            EA_AppendCategoryRow(list, cat, name, itemid, titan)
        end
    end

    if searchText and searchText ~= "" then
        local keyword = strlower(searchText)
        local filtered = {}
        for _, data in ipairs(list) do
            local name = data.name and strlower(tostring(data.name)) or ""
            local itemid = data.itemid and tostring(data.itemid) or ""
            if name:find(keyword) or itemid:find(keyword) then
                tinsert(filtered, data)
            end
        end
        list = filtered
    end

    local function catSort(a, b)
        local key = EA_CategorySortKey or "t"
        local desc = EA_CategorySortDesc
        local va, vb
        if cat == "矿石" and key == "history" then
            -- 用prospectValue
            va, vb = a.prospectValue or 0, b.prospectValue or 0
        elseif cat == "草药" and key == "history" then
            -- 用millValue
            va, vb = a.millValue or 0, b.millValue or 0
        else
            -- 其余依然用key
            if key == "num" or key == "snapshot" then
                va, vb = a.snapshot or 0, b.snapshot or 0
            elseif key == "titanValue" then
                va, vb = a.titanValueRaw, b.titanValueRaw
            elseif key == "idx" then
                va, vb = a.idx, b.idx
            elseif key == "name" then
                va, vb = a.name or "", b.name or ""
            elseif key == "min" then
                va, vb = a.min, b.min
            elseif key == "titan" then
                va, vb = a.titan, b.titan
            elseif key == "history" then
                va, vb = a.history, b.history
            elseif key == "t" then
                va, vb = a.t, b.t
            else
                va, vb = a.idx, b.idx
            end
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
    table.sort(list, catSort)

    EA_CategoryTotalPages = math.max(1, math.ceil(#list / ROWS_NUM))
    if not page or type(page) ~= "number" or page < 1 then
        EA_CategoryCurrentPage = 1
    elseif page > EA_CategoryTotalPages then
        EA_CategoryCurrentPage = EA_CategoryTotalPages
    else
        EA_CategoryCurrentPage = page
    end

    if DBFrame.NormalHeaderBtns then for _, btn in ipairs(DBFrame.NormalHeaderBtns) do btn:Hide() end end
    --if searchEditBox then searchEditBox:Hide() end
    if resetBtn then resetBtn:Hide() end
    if opportunityBtn then opportunityBtn:Hide() end

    if not DBFrame.EA_CategoryHeaderBtns then DBFrame.EA_CategoryHeaderBtns = {} end
    for j, col in ipairs(headers) do
        local btn = DBFrame.EA_CategoryHeaderBtns[j]
        if not btn then
            btn = CreateFrame("Button", nil, DBFrame)
            btn:SetSize(col.width, 24)
            btn:SetFrameLevel(DBFrame:GetFrameLevel() + 10)
            if j == 1 then
                btn:SetPoint("TOPLEFT", DBFrame, "TOPLEFT", 10, -40)
            else
                btn:SetPoint("LEFT", DBFrame.EA_CategoryHeaderBtns[j - 1], "RIGHT", 0, 0)
            end
            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetColorTexture(0.93, 0.95, 0.98, 0.2)
            btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")

            btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            btn.text:SetPoint("CENTER")
            btn.text:SetJustifyH("CENTER")
            btn.text:SetWidth(col.width)
            btn.text:Show()

            btn.sep = btn:CreateTexture(nil, "OVERLAY")
            btn.sep:SetColorTexture(0.7, 0.7, 0.7, 0.7)
            btn.sep:SetWidth(1)
            btn.sep:SetPoint("TOPRIGHT", btn, "TOPRIGHT", 0, -2)
            btn.sep:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 0, 2)
            btn.sep:Show()

            DBFrame.EA_CategoryHeaderBtns[j] = btn
        end

        if j == #headers then
            btn.sep:Hide()
        else
            btn.sep:Show()
        end
        btn:EnableMouse(true)
        btn:SetScript("OnEnter", function(self)
            self.bg:SetColorTexture(0.68, 0.83, 1, 0.3)
        end)
        btn:SetScript("OnLeave", function(self)
            self.bg:SetColorTexture(0.93, 0.95, 0.98, 0.2)
        end)
        if col.key and col.key ~= "action" then
            btn:SetScript("OnClick", function()
                if EA_CategorySortKey == col.key then
                    EA_CategorySortDesc = not EA_CategorySortDesc
                else
                    EA_CategorySortKey = col.key
                    EA_CategorySortDesc = false
                end
                EA_ShowCategory(EA_CategoryMode, 1, CurrentSearchText)
            end)
        else
            btn:SetScript("OnClick", nil)
        end
        local arrow = (EA_CategorySortKey == col.key and col.key ~= "action") and
            (EA_CategorySortDesc and " ▼" or " ▲") or ""
        btn.text:SetText(col.name .. arrow)
        btn.text:Show()
        btn:Show()
    end

    local startIdx = (EA_CategoryCurrentPage - 1) * ROWS_NUM + 1
    for i = 1, ROWS_NUM do
        local row = DBFrame.rows[i]
        local data = list[startIdx + i - 1]
        if not row.bg then
            row.bg = row:CreateTexture(nil, "BACKGROUND")
            row.bg:SetAllPoints()
        end
        if i % 2 == 1 then
            row.bg:SetColorTexture(0.95, 0.95, 1, 0.2)
        else
            row.bg:SetColorTexture(1, 1, 1, 0.1)
        end

        row:EnableMouse(true)
        row:SetScript("OnEnter", function(self)
            if self.bg then self.bg:SetColorTexture(0.68, 0.83, 1, 0.2) end
            self:LockHighlight()
        end)
        row:SetScript("OnLeave", function(self)
            if self.bg then
                if i % 2 == 1 then
                    self.bg:SetColorTexture(0.96, 0.98, 1, 0.2)
                else
                    self.bg:SetColorTexture(1, 1, 1, 0.1)
                end
            end
            self:UnlockHighlight()
        end)
        for j, col in ipairs(headers) do
            local cell = row.cols[j]
            if not cell then
                cell = row:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
                row.cols[j] = cell
            end
            cell:ClearAllPoints()
            if j == 1 then
                cell:SetPoint("LEFT", row, "LEFT", 0, 0)
            else
                cell:SetPoint("LEFT", row.cols[j - 1], "RIGHT", 0, 0)
            end
            cell:SetWidth(col.width)
            if j == 1 then
                cell:SetJustifyH("CENTER")
            elseif j == 2 then
                cell:SetJustifyH("LEFT")
            elseif j == 3 or j == 4 or j == 5 or j == 6 or j == 7 then
                cell:SetJustifyH("RIGHT")
            elseif j == 8 then
                cell:SetJustifyH("CENTER")
            else
                cell:SetJustifyH("CENTER")
            end

            if not row.seps then row.seps = {} end
            if not row.seps[j] then
                local sep = row:CreateTexture(nil, "OVERLAY")
                sep:SetColorTexture(0.8, 0.8, 0.8, 0.5)
                sep:SetWidth(1)
                sep:SetPoint("TOPLEFT", cell, "TOPRIGHT", 2, 0)
                sep:SetPoint("BOTTOMLEFT", cell, "BOTTOMRIGHT", 2, 0)
                row.seps[j] = sep
            end
            if j == 1 or j == #headers then
                row.seps[j]:Hide()
            else
                row.seps[j]:Show()
            end
        end
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
            local realName
            if itemLink then
                realName = select(1, GetItemInfo(itemLink))
            end
            if not realName then
                realName = tostring(data.name):match("^(.-):%d+$") or tostring(data.name)
            end
            row.cols[2]:SetText(icon .. ColorName(realName, itemLink))
            row.itemLink = itemLink
            row.itemData = data

            if row.cols[2].clickBtn then
                row.cols[2].clickBtn:Show()
                row.cols[2].clickBtn:SetScript("OnClick", function(self, button)
                    if itemLink and HandleModifiedItemClick(itemLink) then
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
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    if link then
                        GameTooltip:SetHyperlink(link)
                    else
                        GameTooltip:SetText(name, 1, 1, 1)
                    end
                    GameTooltip:AddLine("左键点击查看价格列表", 1, 1, 0)
                    GameTooltip:Show()
                end)
                row.cols[2].clickBtn:SetScript("OnLeave", function(self)
                    row:UnlockHighlight()
                    GameTooltip:Hide()
                end)
            end

            row.cols[3]:SetText(data.snapshot or "-")
            if cat == "矿石" then
                -- 选矿收益
                local prospectValue = data.itemid and GetProspectValue and GetProspectValue(data.itemid)
                row.cols[4]:SetText(prospectValue and prospectValue > 0 and FormatGoldIcon(prospectValue) or "-")
            elseif cat == "草药" then
                -- 研磨收益
                local millValue = data.itemid and GetMillValue and GetMillValue(data.itemid)
                row.cols[4]:SetText(millValue and millValue > 0 and FormatGoldIcon(millValue) or "-")
            else
                row.cols[4]:SetText(data.history and FormatGoldIcon(data.history) or "-")
            end
            row.cols[5]:SetText(data.min and FormatGoldIcon(data.min) or "-")
            row.cols[6]:SetText(data.titan or "-")
            row.cols[7]:SetText(data.titanValue or "-")
            row.cols[8]:SetText(data.t and EA_GetShortTime(data.t) or "-")
            if not row.trendBtn then
                row.trendBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
                row.trendBtn:SetSize(50, 20)
                row.trendBtn:SetText("走势")
            end
            row.trendBtn:ClearAllPoints()
            row.trendBtn:SetPoint("LEFT", row.cols[8], "RIGHT", 8, 0)
            row.trendBtn:Show()
            row.trendBtn:SetEnabled(data.min and data.min > 0)
            row.trendBtn:SetScript("OnClick", function()
                EasyAuction_ShowChart(data.key)
            end)
            row.cols[9]:SetText("")
            row.cols[9]:Show()
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
        if EA_CategoryMode and EA_CategoryCurrentPage > 1 then
            EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage - 1, CurrentSearchText)
        end
    end)
    nextBtn:SetScript("OnClick", function()
        if EA_CategoryMode and EA_CategoryCurrentPage < EA_CategoryTotalPages then
            EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage + 1, CurrentSearchText)
        end
    end)

    EasyAuction_UpdateCategoryButtonHighlight()
end

local _old_RefreshDBFrame = RefreshDBFrame
function RefreshDBFrame()
    if EA_CategoryMode then
        EA_ShowCategory(EA_CategoryMode, EA_CategoryCurrentPage, CurrentSearchText)
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
                local afterTax = math.floor(totalBuyout * 0.99 + 0.5)
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

local function EA_AreManagedAddOnsDisabled()
    local playerName = UnitName("player")
    for i = 1, C_AddOns.GetNumAddOns() do
        local name = C_AddOns.GetAddOnInfo(i)
        if EA_IsManagedAddon(name) and EA_IsAddonEnabled(name, playerName) then
            return false
        end
    end
    return true
end

local function EasyAuction_BackupAddonList()
    if not EasyAuctionDB then return false end
    if EasyAuctionDB.MinimalModeActive == nil and type(EasyAuctionDB.AddonBackup) == "table"
        and next(EasyAuctionDB.AddonBackup) ~= nil then
        EasyAuctionDB.MinimalModeActive = EA_AreManagedAddOnsDisabled()
    end
    if EasyAuctionDB.MinimalModeActive then return false end
    local playerName = UnitName("player")
    local backup = {}
    for i = 1, C_AddOns.GetNumAddOns() do
        local name, _, _, _ = C_AddOns.GetAddOnInfo(i)
        if EA_IsManagedAddon(name) then
            backup[name] = EA_IsAddonEnabled(name, playerName)
        end
    end
    EasyAuctionDB.AddonBackup = backup
    EasyAuctionDB.MinimalModeActive = false
    return true
end

function EasyAuction_IsMinimalModeActive()
    if not EasyAuctionDB then
        return false
    end
    if EasyAuctionDB.MinimalModeActive ~= nil then
        return EasyAuctionDB.MinimalModeActive == true
    end
    if type(EasyAuctionDB.AddonBackup) ~= "table" or next(EasyAuctionDB.AddonBackup) == nil then
        return false
    end
    return EA_AreManagedAddOnsDisabled()
end

function EasyAuction_SetMinimalAddon()
    if not EasyAuctionDB then
        print("|cffff0000[EasyAuction]|r 插件数据未初始化，无法切换极简模式。")
        return
    end
    local disableAddOn = EA_GetAddonToggle("DisableAddOn")
    if not disableAddOn then
        print("|cffff0000[EasyAuction]|r 当前客户端不支持禁用插件接口。")
        return
    end
    EasyAuction_BackupAddonList()
    EasyAuctionDB.MinimalModeActive = true
    for i = 1, C_AddOns.GetNumAddOns() do
        local name = C_AddOns.GetAddOnInfo(i)
        if EA_IsManagedAddon(name) then
            disableAddOn(name)
        end
    end
    print("|cff00ff00[EasyAuction]|r 极简模式已应用，仅保留EasyAuction")
    ReloadUI()
end

function EasyAuction_RestoreAddon()
    if not EasyAuctionDB or type(EasyAuctionDB.AddonBackup) ~= "table" then
        print("|cffff0000[EasyAuction]|r 没有可恢复的插件配置。")
        return
    end
    local enableAddOn = EA_GetAddonToggle("EnableAddOn")
    local disableAddOn = EA_GetAddonToggle("DisableAddOn")
    if not enableAddOn or not disableAddOn then
        print("|cffff0000[EasyAuction]|r 当前客户端不支持插件恢复接口。")
        return
    end
    for name, state in pairs(EasyAuctionDB.AddonBackup) do
        if state then
            enableAddOn(name)
        else
            disableAddOn(name)
        end
    end
    EasyAuctionDB.MinimalModeActive = false
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
            local DB = InitEasyAuctionDB()
            DB.minimap = DB.minimap or {}
            if DB.scanPerFrame < 50 then
                DB.scanPerFrame = 50
            elseif DB.scanPerFrame >= 500 then
                DB.scanPerFrame = 200
            end

            local LDB = LibStub("LibDataBroker-1.1", true)
            local LDBIcon = LibStub("LibDBIcon-1.0", true)
            if LDB and LDBIcon then
                local dataobj = LDB:NewDataObject("EasyAuction", {
                    type = "data source",
                    text = "EasyAuction",
                    icon = "Interface\\Icons\\INV_Misc_Coin_01",
                    OnClick = function(self, button)
                        if button == "LeftButton" then
                            if EasyAuction_OpenDBFrame then
                                EasyAuction_OpenDBFrame()
                            end
                            elseif button == "RightButton" then
                            if EasyAuctionConfigFrame and EasyAuctionConfigFrame:IsShown() then
                                EasyAuctionConfigFrame:Hide()
                                return
                            end
                            if not EasyAuctionConfigFrame then
                                CreateEasyAuctionConfigFrame(UIParent)
                            end
                            EasyAuctionConfigFrame:Show()
                        end
                    end,
                    OnTooltipShow = function(tt)
                        tt:AddLine("|cff00ff00EasyAuction 拍卖助手|r")
                        tt:AddLine("|cffffff00左键|r 价格数据库")
                        tt:AddLine("|cffffff00右键|r 插件设置")
                    end,
                })
                LDBIcon:Register("EasyAuction", dataobj, DB.minimap)
            end
            print("|cff00ff00[EasyAuction]|r 拍卖行增强插件已加载，输入 |cff00ff00/epah|r 打开插件。")
            CheckShowUpdateNotes()
            BuildItemIDIndex()
            self:UnregisterEvent("ADDON_LOADED")
        end
    elseif event == "PLAYER_LOGIN" then
        EasyAuction_BackupAddonList()
        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)

local legacyShadowFrame = CreateFrame("Frame")
legacyShadowFrame:RegisterEvent("PLAYER_LOGOUT")
legacyShadowFrame:SetScript("OnEvent", function()
    local realmKey = GetRealmFactionKey()
    if type(EasyAuctionDB2) == "table" and EasyAuctionDB2[realmKey] then
        -- 避免 EasyAuctionDB 与 EasyAuctionDB2 持久化双份大表。
        _G.EasyAuctionDB = {
            legacyRedirect = true,
            realmKey = realmKey,
            ts = time(),
            version = tostring(EA_GetAddonMetadata(addonName, "Version") or "?"),
            note = "Use EasyAuctionDB2[realmKey]",
        }
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
local isUpdatingScanProgress = false

function EasyAuction_UpdateScanProgress(cur, total, elapsed)
    if isUpdatingScanProgress then return end   -- 防止递归/死循环
    isUpdatingScanProgress = true

    if not EasyAuctionScanProgressFrame then
        isUpdatingScanProgress = false
        return
    end

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

    isUpdatingScanProgress = false
end

function CleanupOldData()
    local days = EA_ClampInt(EasyAuctionDB.historyKeepDays or 30, 30, 1, 365)
    local maxEntry = EA_ClampInt(EasyAuctionDB.historyMaxEntry or 0, 0, 0, 2000)
    local keepPerItem = EA_ClampInt(EasyAuctionDB.scanKeepPerItem or 120, 120, 20, 500)
    local dailyKeepDays = EA_ClampInt(EasyAuctionDB.dailyKeepDays or days, days, 1, 365)
    local hourlyKeepHours = EA_ClampInt(EasyAuctionDB.hourlyKeepHours or 24, 24, 1, 24)
    EasyAuctionDB.historyKeepDays = days
    EasyAuctionDB.historyMaxEntry = maxEntry
    EasyAuctionDB.scanKeepPerItem = keepPerItem
    EasyAuctionDB.dailyKeepDays = dailyKeepDays
    EasyAuctionDB.hourlyKeepHours = hourlyKeepHours

    local cutoffTime = time() - (days * 86400)
    local cutoffDay = date("%Y-%m-%d", time() - (dailyKeepDays * 86400))
    local removedRecords = 0
    local removedDaily = 0
    local removedHourly = 0

    for key, data in pairs(EasyAuctionDB.PriceHistory or {}) do
        if type(data) == "table" then
            local perItemLimit = keepPerItem
            if maxEntry > 0 and maxEntry < perItemLimit then
                perItemLimit = maxEntry
            end

            local newData, removed = EA_CompressHistoryRecords(data, perItemLimit, cutoffTime)
            removedRecords = removedRecords + removed

            for k, v in pairs(data) do
                if type(k) ~= "number" and k ~= "minUnit" then
                    newData[k] = v
                end
            end

            local minUnit = nil
            for _, rec in ipairs(newData) do
                if rec.unit and (not minUnit or rec.unit < minUnit) then
                    minUnit = rec.unit
                end
            end
            newData.minUnit = minUnit or data.minUnit or 0

            if #newData == 0 and (not newData.minUnit or newData.minUnit <= 0) then
                EasyAuctionDB.PriceHistory[key] = nil
                EA_RemoveItemIDIndexForKey(key)
            else
                EasyAuctionDB.PriceHistory[key] = newData
                EA_UpdateItemIDIndexForKey(key, newData.minUnit)
            end
        end
    end

    for key, arr in pairs(EasyAuctionDB.DailyMinPrice or {}) do
        if type(arr) == "table" then
            local newArr = {}
            for _, rec in ipairs(arr) do
                local day = rec and rec[1]
                if type(day) == "string" and day >= cutoffDay then
                    newArr[#newArr + 1] = rec
                else
                    removedDaily = removedDaily + 1
                end
            end
            if #newArr > 0 then
                EasyAuctionDB.DailyMinPrice[key] = newArr
            else
                EasyAuctionDB.DailyMinPrice[key] = nil
            end
        else
            EasyAuctionDB.DailyMinPrice[key] = nil
        end
    end

    local function NormalizeHourlyList(arr)
        if type(arr) ~= "table" then return nil, 0 end
        local currentHour = tonumber(date("%H")) or 0
        local keepHourCount = math.min(24, math.max(1, math.floor(hourlyKeepHours)))
        local oldestHour = (currentHour - keepHourCount + 24) % 24
        local function IsHourInWindow(hour)
            if keepHourCount >= 24 then return true end
            if oldestHour <= currentHour then
                return hour >= oldestHour and hour <= currentHour
            end
            return hour >= oldestHour or hour <= currentHour
        end

        local removed = 0
        local byHour = {}
        for _, rec in ipairs(arr) do
            local hour = rec and tonumber(rec[1]) or nil
            if hour and hour >= 0 and hour <= 23 and IsHourInWindow(hour) then
                local old = byHour[hour]
                if not old then
                    byHour[hour] = rec
                else
                    old[4] = (old[4] or 0) + (rec[4] or rec[3] or 0)
                    if (rec[2] or math.huge) < (old[2] or math.huge) then
                        old[2] = rec[2]
                        old[3] = rec[3]
                    elseif rec[2] == old[2] then
                        old[3] = (old[3] or 0) + (rec[3] or 0)
                    end
                    removed = removed + 1
                end
            else
                removed = removed + 1
            end
        end

        local normalized = {}
        for _, rec in pairs(byHour) do
            normalized[#normalized + 1] = rec
        end
        table.sort(normalized, function(a, b)
            return (tonumber(a[1]) or 0) < (tonumber(b[1]) or 0)
        end)
        return normalized, removed
    end

    for key, arr in pairs(EasyAuctionDB.HourlyMinPrice or {}) do
        local normalized, removed = NormalizeHourlyList(arr)
        removedHourly = removedHourly + removed
        if normalized and #normalized > 0 then
            EasyAuctionDB.HourlyMinPrice[key] = normalized
        else
            EasyAuctionDB.HourlyMinPrice[key] = nil
        end
    end

    local totalRemoved = removedRecords + removedDaily + removedHourly
    if totalRemoved > 0 then
        print(string.format("|cff00ff00[EasyAuction]|r 清理完成，移除记录%d条（历史%d/日聚合%d/小时聚合%d）。",
            totalRemoved, removedRecords, removedDaily, removedHourly))
    end
    collectgarbage("collect")
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

local function EA_AccumulateScanBucket(bucket, unit, count, ts)
    if not bucket or not unit or unit <= 0 or not count or count <= 0 then
        return
    end
    local unitKey = tostring(unit)
    bucket.byUnit = bucket.byUnit or {}
    if bucket.byUnit[unitKey] then
        bucket.byUnit[unitKey].count = (bucket.byUnit[unitKey].count or 0) + count
        if ts and ts > (bucket.byUnit[unitKey].t or 0) then
            bucket.byUnit[unitKey].t = ts
        end
    else
        bucket.byUnit[unitKey] = { unit = unit, count = count, t = ts or time() }
    end
    bucket.totalCount = (bucket.totalCount or 0) + count
    if not bucket.minUnit or unit < bucket.minUnit then
        bucket.minUnit = unit
        bucket.minCount = count
    elseif unit == bucket.minUnit then
        bucket.minCount = (bucket.minCount or 0) + count
    end
    if not bucket.maxUnit or unit > bucket.maxUnit then
        bucket.maxUnit = unit
        bucket.maxCount = count
    elseif unit == bucket.maxUnit then
        bucket.maxCount = (bucket.maxCount or 0) + count
    end
end

function EasyAuction_ScanCategory(cat)
    local QUERY_RETRY_DELAY = 0.08
    local NEXT_QUERY_DELAY = 0.05
    local QUERY_TIMEOUT = 1.8

    if IsScanningAll or IsScanningCategory then
        print("|cff00ff00[EasyAuction]|r 正在扫描中，请稍候...")
        return
    end
    if not cat or cat == "全类" then
        print("|cffff0000[EasyAuction]|r 请选择一个具体分类。")
        return
    end

    local canQuery = select(1, CanSendAuctionQuery())
    if not canQuery then
        print("|cffff0000[EasyAuction]|r 当前拍卖行搜索不可用，请稍后再试。")
        return
    end

    local queue, dedupe = {}, {}
    for _, info in ipairs(EA_GetCategoryEntries(cat)) do
        local name = EA_TrimText(info[1])
        local itemID = tonumber(info[2])
        if name ~= "" and itemID and itemID > 0 and not dedupe[itemID] then
            dedupe[itemID] = true
            queue[#queue + 1] = { name = name, itemID = itemID }
        end
    end

    if #queue == 0 then
        print(string.format("|cffff0000[EasyAuction]|r [%s] 分类没有可扫描的物品。", cat))
        return
    end

    CleanupOldData()
    IsScanningCategory = true
    UpdateScanBtnState()
    UpdateAuctionQueryStatusText()
    EasyAuction_ShowScanProgress()
    EasyAuction_UpdateScanProgress(0, #queue, 0)

    local scanFrame = _G.EasyAuctionCategoryScanFrame or CreateFrame("Frame", "EasyAuctionCategoryScanFrame")
    local scanStartTime = GetTime()
    local queueIndex = 0
    local newCount, updateCount = 0, 0
    local currentItem = nil
    local currentPage = 0
    local currentBucket = nil
    local currentToken = 0
    local currentRequestID = 0
    local dispatchCurrentQuery

    local function finishScan(message)
        scanFrame:UnregisterAllEvents()
        IsScanningCategory = false
        UpdateScanBtnState()
        UpdateAuctionQueryStatusText()
        if message then
            EasyAuction_HideScanProgress()
            print(message)
            return
        end
        EasyAuction_ShowScanResult(newCount, updateCount, #queue, GetTime() - scanStartTime)
        EA_RefreshCategoryViewsAfterEdit(cat)
    end

    local function finishCurrentItem()
        if not IsScanningCategory or not currentItem then
            return
        end
        local key = currentItem.name .. ":" .. tostring(currentItem.itemID)
        local storedAt = time()
        if currentBucket and next(currentBucket.byUnit or {}) then
            local itemNew, itemUpdate = EA_SaveAggregatedBuckets({ [key] = currentBucket }, storedAt)
            newCount = newCount + itemNew
            updateCount = updateCount + itemUpdate
        elseif EasyAuctionDB.PriceHistory and EasyAuctionDB.PriceHistory[key] then
            EasyAuctionDB.PriceHistory[key].lastScanT = storedAt
        end
        currentItem = nil
        currentBucket = nil
        currentPage = 0
        EasyAuction_UpdateScanProgress(queueIndex, #queue, GetTime() - scanStartTime)
        if queueIndex >= #queue then
            finishScan(nil)
        else
            C_Timer.After(NEXT_QUERY_DELAY, function()
                if IsScanningCategory then
                    currentToken = currentToken + 1
                    queueIndex = queueIndex + 1
                    currentItem = queue[queueIndex]
                    currentBucket = { byUnit = {}, totalCount = 0 }
                    currentPage = 0
                    dispatchCurrentQuery()
                end
            end)
        end
    end

    dispatchCurrentQuery = function()
        local token = currentToken
        local function tryQuery()
            if not IsScanningCategory or token ~= currentToken or not currentItem then
                return
            end
            local searchReady = select(1, CanSendAuctionQuery())
            if searchReady then
                currentRequestID = currentRequestID + 1
                local requestID = currentRequestID
                scanFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
                -- Classic AH uses the legacy signature:
                -- QueryAuctionItems(name, minLevel, maxLevel, page, isUsable, quality, getAll, exactMatch, filters)
                QueryAuctionItems(currentItem.name, nil, nil, currentPage, nil, nil, false, true, nil)
                C_Timer.After(QUERY_TIMEOUT, function()
                    if IsScanningCategory and token == currentToken and requestID == currentRequestID and currentItem then
                        scanFrame:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE")
                        finishCurrentItem()
                    end
                end)
            else
                C_Timer.After(QUERY_RETRY_DELAY, tryQuery)
            end
        end
        tryQuery()
    end

    scanFrame:SetScript("OnEvent", function(self, event)
        if not IsScanningCategory or not currentItem then
            self:UnregisterAllEvents()
            return
        end
        self:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE")
        local n = GetNumAuctionItems("list")
        local nowTs = time()
        for i = 1, n do
            local _, _, count, _, _, _, _, _, _, buyout, _, _, _, _, _, _, itemID = GetAuctionItemInfo("list", i)
            local link = GetAuctionItemLink("list", i)
            local linkID = tonumber(link and link:match("item:(%d+)")) or tonumber(itemID)
            if linkID == currentItem.itemID and buyout and buyout > 0 and count and count > 0 then
                local unit = math.floor((buyout / count) + 0.5)
                EA_AccumulateScanBucket(currentBucket, unit, count, nowTs)
            end
        end

        if n >= 50 then
            currentPage = currentPage + 1
            C_Timer.After(NEXT_QUERY_DELAY, dispatchCurrentQuery)
        else
            finishCurrentItem()
        end
    end)

    queueIndex = 1
    currentToken = currentToken + 1
    currentItem = queue[queueIndex]
    currentBucket = { byUnit = {}, totalCount = 0 }
    currentPage = 0
    dispatchCurrentQuery()
end

function EasyAuction_ShowScanModeSelector()
    if not EasyAuctionScanModeSelectorFrame then
        local f = CreateFrame("Frame", "EasyAuctionScanModeSelectorFrame", UIParent, "BackdropTemplate")
        f:SetSize(320, 260)
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
        tinsert(UISpecialFrames, "EasyAuctionScanModeSelectorFrame")

        local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        title:SetPoint("TOP", 0, -18)
        title:SetText("选择扫描方式")

        local desc = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        desc:SetPoint("TOPLEFT", 20, -46)
        desc:SetPoint("RIGHT", -20, 0)
        desc:SetJustifyH("LEFT")
        desc:SetText("全量扫描会抓取整个拍卖行\n分类扫描只抓取指定分类中的物品\n温馨提示：分类不一定比全量快")

        local fullBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        fullBtn:SetSize(90, 22)
        fullBtn:SetPoint("TOP", 0, -95)
        fullBtn:SetText("全量扫描")
        fullBtn:SetScript("OnClick", function()
            f:Hide()
            StaticPopup_Show("EASYAUCTION_SCANALL_CONFIRM")
        end)
        f.fullBtn = fullBtn

        f.categoryBtns = {}
        for index, cat in ipairs(EA_SCAN_CATEGORIES) do
            local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            btn:SetSize(58, 22)
            local row = math.floor((index - 1) / 4)
            local col = (index - 1) % 4
            btn:SetPoint("TOPLEFT", f, "TOPLEFT", 24 + col * 72, -124 - row * 28)
            btn:SetText(cat)
            btn:SetScript("OnClick", function()
                f:Hide()
                EasyAuction_ScanCategory(cat)
            end)
            f.categoryBtns[#f.categoryBtns + 1] = btn
        end

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        closeBtn:SetSize(72, 24)
        closeBtn:SetPoint("BOTTOM", 0, 14)
        closeBtn:SetText("关闭")
        closeBtn:SetScript("OnClick", function()
            f:Hide()
        end)

        f:SetScript("OnShow", function(self)
            local canQuery, canQueryAll = CanSendAuctionQuery()
            local busy = IsScanningAll or IsScanningCategory
            self.fullBtn:SetEnabled((not busy) and canQueryAll)
            for _, btn in ipairs(self.categoryBtns or {}) do
                btn:SetEnabled((not busy) and canQuery)
            end
        end)

        EasyAuctionScanModeSelectorFrame = f
    end

    EasyAuctionScanModeSelectorFrame:Show()
end

function EasyAuction_ScanAllAuctionItems()
    EasyAuctionDB.debugPrint = false
    if IsScanningAll or IsScanningCategory then
        print("|cff00ff00[EasyAuction]|r 正在扫描中，请稍候...")
        return
    end

    --print("|cff00ff00[EasyAuction]|r ===== 扫描开始 =====")
    CleanupOldData()
    IsScanningAll = true
    UpdateScanBtnState()
    UpdateAuctionQueryStatusText()
    EasyAuction_ShowScanProgress()

    local scanStartTime = GetTime()
    local perFrame      = EA_ClampInt(EasyAuctionDB.scanPerFrame or 200, 200, 50, 500)
    local keepPerItem   = EA_ClampInt(EasyAuctionDB.scanKeepPerItem or 120, 120, 20, 500)
    if perFrame < 50 then perFrame = 50 elseif perFrame >= 500 then perFrame = 200 end
    EasyAuctionDB.scanPerFrame = perFrame
    EasyAuctionDB.scanKeepPerItem = keepPerItem
    local totalItems            = 0
    local result                = {}
    local totalKinds            = 0
    local newCount, updateCount = 0, 0
    local waitingItems          = {}
    local processedIndexes      = {}

    local RETRY_MAX             = 5   -- 最多重试5次
    local RETRY_DELAY           = 0.2 -- 每次重试间隔
    local RETRY_TIMEOUT         = 2.5 -- 超时后丢弃

    local function updatePriceData(key, unit, count)
        local nowDay = date("%Y-%m-%d")
        local hour = tonumber(date("%H"))
        EasyAuctionDB.HourlyMinPrice = EasyAuctionDB.HourlyMinPrice or {}
        EasyAuctionDB.HourlyMinPrice[key] = EasyAuctionDB.HourlyMinPrice[key] or {}
        local found = false
        for _, record in ipairs(EasyAuctionDB.HourlyMinPrice[key]) do
            if record[1] == hour then
                record[4] = (record[4] or 0) + count
                if unit < record[2] then
                    record[2] = unit
                    record[3] = count
                elseif unit == record[2] then
                    record[3] = (record[3] or 0) + count
                end
                found = true
                break
            end
        end
        if not found then
            table.insert(EasyAuctionDB.HourlyMinPrice[key], { hour, unit, count, count })
        end

        EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
        EasyAuctionDB.DailyMinPrice[key] = EasyAuctionDB.DailyMinPrice[key] or {}
        found = false
        for _, daily in ipairs(EasyAuctionDB.DailyMinPrice[key]) do
            if daily[1] == nowDay then
                if not daily[4] or unit < daily[4] then
                    daily[4] = unit
                    daily[2] = unit
                    daily[3] = count
                elseif unit == daily[4] then
                    daily[3] = (daily[3] or 0) + count
                end
                if not daily[5] or unit > daily[5] then
                    daily[5] = unit
                end
                daily[6] = (daily[6] or 0) + count
                found = true
                break
            end
        end
        if not found then
            table.insert(EasyAuctionDB.DailyMinPrice[key], { nowDay, unit, count, unit, unit, count })
        end
    end

    local function processItemData(itemInfo, index)
        if not itemInfo or not IsScanningAll then 
            print("|cffff0000[EasyAuction]|r processItemData 返回: 无效数据或扫描已停止")
            return 
        end
        --print(string.format("|cff00ff00[EasyAuction]|r processItemData: index=%d", index))
        local link = itemInfo.link
        local itemID = itemInfo.itemID
        local count = itemInfo.count
        local buyout = itemInfo.buyout
        local unit = itemInfo.unit

        if not link or not itemID or not buyout or buyout <= 0 or not count or count <= 0 then return end

        local linkID = tonumber(link:match("item:(%d+)"))
        if linkID ~= itemID then return end

        local safeName = select(1, GetItemInfo(link))
        if not safeName or safeName == "" then return end

        local key = safeName .. ":" .. linkID
        --print(string.format("|cff00ff00[EasyAuction]|r 生成key: %s", key))

        result[key] = result[key] or { byUnit = {} }
        local bucket = result[key]
        local nowTs = time()
        local unitKey = tostring(unit)
        if bucket.byUnit[unitKey] then
            bucket.byUnit[unitKey].count = (bucket.byUnit[unitKey].count or 0) + count
            if nowTs > (bucket.byUnit[unitKey].t or 0) then
                bucket.byUnit[unitKey].t = nowTs
            end
        else
            bucket.byUnit[unitKey] = {
                unit = unit,
                count = count,
                t = nowTs,
            }
        end
        totalItems = totalItems + 1

        updatePriceData(key, unit, count)
        processedIndexes[index] = true

        if EasyAuctionDB.debugPrint then
            print(string.format("入库: index=%d, name=%s, itemID=%d, linkID=%d, link=%s, 单价=%d, 数量=%d", index, safeName, itemID, linkID, link, unit, count))
        end
    end

    local function processBatch(startIndex)
        --print(string.format("|cff00ff00[EasyAuction]|r processBatch 被调用, startIndex=%s", tostring(startIndex)))
        startIndex = startIndex or 0
        local n = GetNumAuctionItems("list")
        --print(string.format("|cff00ff00[EasyAuction]|r 当前拍卖物品总数: %d, 起始索引: %d", n, startIndex))
        if startIndex >= n then
            --print("|cff00ff00[EasyAuction]|r 扫描完成，准备保存数据...")
            -- 检查是否还有等待加载的物品
            local hasWaitingItems = false
            for idx, _ in pairs(waitingItems) do
                if not processedIndexes[idx] then
                    hasWaitingItems = true
                    break
                end
            end

            if hasWaitingItems then
                --print("|cff00ff00[EasyAuction]|r 存在等待物品，延迟0.5秒重试...")
                C_Timer.After(0.5, function()
                    processBatch(startIndex)
                end)
                return
            end

            local itemKeys = {}
            for k in pairs(result) do table.insert(itemKeys, k) end
            totalKinds = #itemKeys
            --print(string.format("|cff00ff00[EasyAuction]|r 收集到 %d 种物品，准备分批保存...", totalKinds))
            -- 打印前5个key用于调试
            for i = 1, math.min(5, #itemKeys) do
                local key = itemKeys[i]
                local itemCount = 0
                if result[key] and type(result[key].byUnit) == "table" then
                    for _ in pairs(result[key].byUnit) do
                        itemCount = itemCount + 1
                    end
                elseif result[key] and type(result[key]) == "table" then
                    itemCount = #result[key]
                end
                --print(string.format("|cff00ff00[EasyAuction]|r 物品示例 %d: key=%s, 记录数=%d", i, key, itemCount))
            end
            local idx = 1
            local perSave = 50

            local function saveBatch()
                --print(string.format("|cff00ff00[EasyAuction]|r saveBatch 被调用, idx=%d, totalKinds=%d", idx, totalKinds))
                local i = 0
                local savedCount = 0
                while idx <= totalKinds and i < perSave do
                    local key = itemKeys[idx]
                    if key and key ~= "" then
                        local bucket = result[key]
                        local items = nil
                        if type(bucket) == "table" then
                            if bucket.byUnit then
                                local tmp = {}
                                for _, rec in pairs(bucket.byUnit) do
                                    tmp[#tmp + 1] = rec
                                end
                                items = tmp
                            else
                                items = bucket
                            end
                        end

                        if type(items) == "table" and #items > 0 then
                            local compressed = nil
                            compressed = EA_CompressHistoryRecords(items, keepPerItem, nil)
                            items = compressed
                            if items[1] and items[1].unit and items[1].unit > 0 then
                                local prev = EasyAuctionDB.PriceHistory[key]
                                if not prev then
                                    newCount = newCount + 1
                                else
                                    updateCount = updateCount + 1
                                end
                                local oldMin = EasyAuctionDB.PriceHistory[key] and EasyAuctionDB.PriceHistory[key].minUnit
                                local minUnit = oldMin
                                for _, v in ipairs(items) do
                                    if v.unit and (not minUnit or v.unit < minUnit) then
                                        minUnit = v.unit
                                    end
                                end
                                EasyAuctionDB.PriceHistory[key] = {}
                                for i, v in ipairs(items) do
                                    EasyAuctionDB.PriceHistory[key][i] = v
                                end
                                EasyAuctionDB.PriceHistory[key].minUnit = minUnit or 0
                                EasyAuctionDB.PriceHistory[key].lastScanT = time()
                                EA_UpdateItemIDIndexForKey(key, EasyAuctionDB.PriceHistory[key].minUnit)
                                savedCount = savedCount + 1
                                --print(string.format("|cff00ff00[EasyAuction]|r 已保存: key=%s, items=%d, minUnit=%s", key, #items, tostring(minUnit)))
                            else
                                --print(string.format("|cffff0000[EasyAuction]|r 保存失败: items[1].unit 无效, key=%s", key))
                            end
                        else
                            --print(string.format("|cffff0000[EasyAuction]|r 保存失败: items 表为空或无效, key=%s", key))
                        end
                    else
                        --print(string.format("|cffff0000[EasyAuction]|r 保存失败: key 为空"))
                    end
                    if key then
                        result[key] = nil
                    end
                    idx = idx + 1
                    i = i + 1
                end
                --print(string.format("|cff00ff00[EasyAuction]|r 本批次保存完成: savedCount=%d, idx=%d", savedCount, idx))
                if idx % 50 == 0 or idx == totalKinds then
                    EasyAuction_UpdateScanProgress(idx - 1, totalKinds, GetTime() - scanStartTime)
                end
                if idx <= totalKinds then
                    C_Timer.After(0.01, saveBatch)       -- 分批续写
                else
                    for k in pairs(result) do result[k] = nil end
                    for k in pairs(waitingItems) do waitingItems[k] = nil end
                    for k in pairs(processedIndexes) do processedIndexes[k] = nil end
                    collectgarbage("collect")
                    --print("|cff00ff00[EasyAuction]|r ===== 所有数据保存完成 =====")
                    IsScanningAll = false
                    UpdateScanBtnState()
                    UpdateAuctionQueryStatusText()
                    EasyAuction_ShowScanResult(newCount, updateCount, totalKinds, GetTime() - scanStartTime)
                    C_Timer.After(0.5, function()
                        ShowEasyAuctionScanFinishFrame() -- 延时弹完成UI
                        C_Timer.After(2.0, function()
                            --if AuctionFrame then AuctionFrame:Hide() end  -- 再延时关闭拍卖
                            C_Timer.After(2.0, function()
                                if EasyAuctionDBFrame and EasyAuctionDBFrame:IsShown() then
                                    RefreshDBFrame()
                                end
                            end)
                        end)
                    end)
                end
            end
            saveBatch()
        else
            local endIndex = math.min(startIndex + perFrame, n)
            for i = startIndex + 1, endIndex do
                if i % 50 == 0 or i == n then
                    EasyAuction_UpdateScanProgress(i, n, GetTime() - scanStartTime)
                end
                local name, _, count, _, _, _, _, _, _, buyout, _, _, _, owner, _, _, itemID = GetAuctionItemInfo("list", i)
                local link = GetAuctionItemLink("list", i)
                local unit = (buyout and count and count > 0) and math.floor(buyout / count) or nil

                if not processedIndexes[i] then
                    if link and itemID and itemID > 0 and buyout and count and count > 0 then
                        local safeName = select(1, GetItemInfo(link))
                        -- link存在，但name未缓存时，也要等待name
                        if safeName and safeName ~= "" then
                            processItemData({
                                name = safeName,
                                count = count,
                                buyout = buyout,
                                owner = owner,
                                itemID = itemID,
                                unit = unit,
                                link = link,
                                index = i
                            }, i)
                        else
                            -- name未缓存，丢到等待队列
                            if not waitingItems[i] then
                                waitingItems[i] = {
                                    name = nil,
                                    count = count,
                                    buyout = buyout,
                                    owner = owner,
                                    itemID = itemID,
                                    unit = unit,
                                    link = link,
                                    index = i,
                                    startTime = GetTime(),
                                    retry = 0,
                                }
                                local item = Item:CreateFromItemID(itemID)
                                item:ContinueOnItemLoad(function()
                                    C_Timer.After(0, function()
                                        local ref = waitingItems[i]
                                        if ref and IsScanningAll then
                                            local cachedName = select(1, GetItemInfo(link))
                                            if cachedName and cachedName ~= "" then
                                                ref.name = cachedName
                                                processItemData(ref, i)
                                                waitingItems[i] = nil
                                                processedIndexes[i] = true
                                            end
                                        end
                                    end)
                                end)
                            end
                        end
                        processedIndexes[i] = true
                    else
                        -- link未获取到，需异步等待
                        if itemID and itemID > 0 and not waitingItems[i] then
                            waitingItems[i] = {
                                name = nil,
                                count = count,
                                buyout = buyout,
                                owner = owner,
                                itemID = itemID,
                                unit = unit,
                                link = nil,
                                index = i,
                                startTime = GetTime(),
                                retry = 0,
                            }
                            local function tryLoadItemInfo(waitItem)
                                if not IsScanningAll then
                                    waitingItems[i] = nil
                                    processedIndexes[i] = true
                                    return
                                end
                                waitItem.retry = (waitItem.retry or 0) + 1
                                local loadedLink = GetAuctionItemLink("list", i)
                                local loadedName = loadedLink and select(1, GetItemInfo(loadedLink))
                                local now = GetTime()
                                if loadedLink and loadedName and loadedName ~= "" then
                                    waitItem.link = loadedLink
                                    waitItem.name = loadedName
                                    processItemData(waitItem, i)
                                    waitingItems[i] = nil
                                    processedIndexes[i] = true
                                elseif waitItem.retry * RETRY_DELAY > RETRY_TIMEOUT then
                                    -- 超时放弃，不降级写入
                                    waitingItems[i] = nil
                                    processedIndexes[i] = true
                                    if EasyAuctionDB.debugPrint then
                                        print(string.format("超时丢弃 index=%d, itemID=%s", i, tostring(itemID)))
                                    end
                                else
                                    C_Timer.After(RETRY_DELAY, function()
                                        tryLoadItemInfo(waitItem)
                                    end)
                                end
                            end
                            -- 异步加载物品
                            local item = Item:CreateFromItemID(itemID)
                            item:ContinueOnItemLoad(function()
                                tryLoadItemInfo(waitingItems[i])
                            end)
                        end
                    end
                end
            end

            --print(string.format("|cff00ff00[EasyAuction]|r 本批次处理完成，准备处理下一批: endIndex=%d", endIndex))
            C_Timer.After(0.05, function()
                if IsScanningAll then
                    processBatch(endIndex)
                else
                    --print("|cffff0000[EasyAuction]|r 扫描被中断，不再继续")
                end
            end)
        end
    end

    --print("|cff00ff00[EasyAuction]|r 注册 AUCTION_ITEM_LIST_UPDATE 事件...")
    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
    eventFrame:SetScript("OnEvent", function(self)
        --print("|cff00ff00[EasyAuction]|r AUCTION_ITEM_LIST_UPDATE 触发，开始处理数据...")
        eventFrame:UnregisterAllEvents()
        processBatch(0)
    end)

-- 必须在拍卖行界面，并且在“浏览”Tab
    if not (AuctionFrame and AuctionFrame:IsShown()) then
        --print("|cffff0000[EasyAuction]|r 拍卖行界面未打开，无法扫描！")
        BuildItemIDIndex()
        IsScanningAll = false
        return
    end

    -- 封装安全的Query方式，保证真的在浏览页
    local function TryQueryAuctionItems(retries)
        retries = retries or 0
        if not AuctionFrameBrowse:IsShown() then
            AuctionFrameTab1:Click()
            C_Timer.After(0.25, function()
                -- 最多尝试3次
                if retries < 3 then
                    TryQueryAuctionItems(retries + 1)
                else
                    if not AuctionFrameBrowse:IsShown() then
                        --print("|cffff0000[EasyAuction]|r 始终无法切换至浏览页，扫描中止")
                        IsScanningAll = false
                        return
                    end
                end
            end)
        else
            --print("|cff00ff00[EasyAuction]|r 已在浏览页，开始全服拍卖查询")
            QueryAuctionItems("", nil, nil, 0, nil, nil, true, true, nil)
        end
    end

    TryQueryAuctionItems()

    -- 兜底：5秒内仍未触发事件则强行推进
    C_Timer.After(5, function()
        if IsScanningAll and GetNumAuctionItems("list") > 0 then
            --print("|cff00ff00[EasyAuction]|r [兜底] 事件未触发，手动进入处理流程")
            processBatch(0)
        elseif IsScanningAll then
            --print("|cffff0000[EasyAuction]|r [兜底] 5秒后仍未获取到拍卖数据，扫描中止")
            IsScanningAll = false
            UpdateScanBtnState()
            UpdateAuctionQueryStatusText()
        end
    end)
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
    hasMoneyFrame = false,
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

    local function AttachEasyAuctionTooltip(frame, i)
        if not frame or frame._ea_tooltip_hooked then return end
        frame:HookScript("OnEnter", function(self)
            local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
            local index = offset + i
            local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, _, _, _, owner, _, _, itemID =
                GetAuctionItemInfo("list", index)

            if not name or not buyoutPrice or not count or count == 0 then return end
            local unitBuyout = math.floor(buyoutPrice / count + 0.5)

            local histMin = nil
            local todayMin = nil
            local today = date("%Y-%m-%d")
            local key = name .. ":" .. itemID
            local dailyArray = EasyAuctionDB.DailyMinPrice[key]
            if EasyAuctionDB.PriceHistory and name and itemID then
                if EasyAuctionDB.PriceHistory[key] then
                    histMin = EasyAuctionDB.PriceHistory[key].minUnit
                end
                if dailyArray then
                    for _, daily in ipairs(dailyArray) do
                        if daily[1] == today then
                            todayMin = daily[4]
                            break
                        end
                    end
                end
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
        frame:HookScript("OnLeave", function(self) GameTooltip:Hide() end)
        frame._ea_tooltip_hooked = true
    end

    for i = 1, NUM_BROWSE_TO_DISPLAY or 8 do
        local row = _G["BrowseButton" .. i]
        AttachEasyAuctionTooltip(row, i)
        AttachEasyAuctionTooltip(_G["BrowseButton" .. i .. "HighBidderName"], i)
        AttachEasyAuctionTooltip(_G["BrowseButton" .. i .. "BuyoutFrame"], i)
        AttachEasyAuctionTooltip(_G["BrowseButton" .. i .. "ClosingTime"], i)
        AttachEasyAuctionTooltip(_G["BrowseButton" .. i .. "Item"], i)
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

local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_HOUSE_SHOW")
f:SetScript("OnEvent", function(_, event)
    SetCVar("auctionSortByBuyoutPrice", 1)
    SetCVar("auctionSortByUnitPrice", 1)
    AuctionFrame_SetSort(sortTable or "list", "bid", false)
    C_Timer.After(0.1, EasyAuction_CreateBuyoutButton)
    C_Timer.After(0.2, EasyAuction_CreateSellPanelButton)
    C_Timer.After(0.2, EasyAuction_RegisterAuctionsButtonRightClick)
    C_Timer.After(0.5, CleanupOldData)
    C_Timer.After(0.2, EasyAuction_InitBrowseButtonHighlight)
end)

hooksecurefunc("FauxScrollFrame_Update", function(frame)
    if IsScanningAll or IsScanningCategory then return end
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

local function RemoveSellPrice(tooltip)
    if not EasyAuctionDB.hideSellPrice then return end
    -- 隐藏金币控件
    for i = 1, 3 do
        local moneyFrame = _G[tooltip:GetName() .. "MoneyFrame" .. i]
        if moneyFrame then
            moneyFrame:Hide()
        end
    end
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
                    RemoveSellPrice(self)
                    EasyAuction_AddPriceInfo(self, itemLink, itemCount)
                end
            end)
        end
    end
end

HookTooltipMethods()
