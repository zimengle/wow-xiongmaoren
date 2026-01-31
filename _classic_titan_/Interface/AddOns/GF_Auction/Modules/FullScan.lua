--[[
    GF_Auction FullScan Module
    Handles full auction house scanning and database updating
]]

local FullScan = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("FullScan", FullScan)
end

local L = GF_Auction_L
local STATE_IDLE = "IDLE"
local STATE_WAITING = "WAITING"
local STATE_PROCESSING = "PROCESSING"
local STATE_SAVING = "SAVING"
local BATCH_SIZE = 200
local PROCESS_INTERVAL = 0.05

if _G.ITEM_QUALITY_COLORS and not _G.ITEM_QUALITY_COLORS[-1] then
    _G.ITEM_QUALITY_COLORS[-1] = {r=0, b=0, g=0}
end

FullScan.state = STATE_IDLE
FullScan.scanBtn = nil
FullScan.totalItems = 0
FullScan.processedCount = 0
FullScan.scanData = {}
FullScan.saveList = {}
FullScan.startTime = 0
FullScan.suspendedFrames = {}
FullScan.retryCount = 0

FullScan.eventFrame = CreateFrame("Frame")
FullScan.eventFrame:Hide()

FullScan.updateFrame = CreateFrame("Frame")
FullScan.updateFrame:Hide()

FullScan.eventFrame:SetScript("OnEvent", function(self, event, ...)
   if event == "AUCTION_ITEM_LIST_UPDATE" then
       FullScan:OnAuctionUpdate()
   elseif event == "AUCTION_HOUSE_CLOSED" then
       FullScan:OnAuctionHouseClosed()
   end
end)

FullScan.updateFrame:SetScript("OnUpdate", function(self, elapsed)
   FullScan:OnUpdateProcess()
end)

function FullScan:CanScan()
   local canQuery, canGetAll = _G.CanSendAuctionQuery()
   return canQuery and canGetAll
end

function FullScan:GetCooldownText()
   local canQuery, canGetAll = _G.CanSendAuctionQuery()
   if not canQuery or not canGetAll then
       return "CD"
   end
   return nil
end

function FullScan:UpdateButton(text)
   if self.scanBtn then
       self.scanBtn:SetText(text)
   end
end

function FullScan:ResetButton()
   if self.scanBtn then
       self.scanBtn:SetText(L("UI_FULL_SCAN"))
       self.scanBtn:Enable()
   end
end

function FullScan:StartScan(btn)
    if self.state ~= STATE_IDLE then
        return
    end

    local canQuery, canGetAll = _G.CanSendAuctionQuery()
    
    if not canGetAll then
        return
    end

    self.scanBtn = btn
    self.state = STATE_WAITING
    self.scanData = {}
    self.saveList = {}
    self.processedCount = 0
    self.totalItems = 0
    self.startTime = GetTime()

    if self.scanBtn then
        self.scanBtn:Disable()
        self.scanBtn:SetText("...")
    end
    
    self:RegisterEvent()
    self.eventFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
    
    _G.QueryAuctionItems("", nil, nil, 0, nil, nil, true, false, nil)
end

function FullScan:RegisterEvent()
    self.suspendedFrames = {}
    local frames = { _G.GetFramesRegisteredForEvent("AUCTION_ITEM_LIST_UPDATE") }
    for _, f in ipairs(frames) do
        if f ~= self.eventFrame and f.UnregisterEvent then
            f:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE")
            table.insert(self.suspendedFrames, f)
        end
    end

    self.eventFrame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
end

function FullScan:UnregisterEvent()
    self.eventFrame:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE")
end

function FullScan:RestoreEvents()
    for _, f in ipairs(self.suspendedFrames) do
        if f and f.RegisterEvent then
            pcall(f.RegisterEvent, f, "AUCTION_ITEM_LIST_UPDATE")
        end
    end
    self.suspendedFrames = {}
end

function FullScan:OnAuctionUpdate()
    if self.state ~= STATE_WAITING then
        return
    end

    self:UnregisterEvent()
    self.state = STATE_PROCESSING
    
    local numItems, totalItems = _G.GetNumAuctionItems("list")
    self.totalItems = numItems
    self.currentProcessIndex = 1
    self.retryCount = 0
    self.updateFrame:Show()
end

function FullScan:OnUpdateProcess()
    if self.state == STATE_PROCESSING then
        self:ProcessScanBatch()
    elseif self.state == STATE_SAVING then
        self:ProcessSaveBatch()
    else
        self.updateFrame:Hide()
    end
end

function FullScan:ProcessScanBatch()
    local startTime = debugprofilestop()
    local timeLimit = 15
    local numItems = self.totalItems
    local i = self.currentProcessIndex
    
    while i <= numItems do
        if (i % 100 == 0) and (debugprofilestop() - startTime > timeLimit) then
            self.currentProcessIndex = i
            self:UpdateProgress(i, numItems, "")
            return
        end

        local info = { _G.GetAuctionItemInfo("list", i) }
        local buyoutPrice = info[10]
        local itemId = info[17]
        
        if not itemId then
            local link = _G.GetAuctionItemLink("list", i)
            if link then
                itemId = tonumber(link:match("item:(%d+)"))
            end
        end

        if itemId and itemId > 0 and buyoutPrice and buyoutPrice > 0 then
            local count = info[3] or 1
            local unitPrice = buyoutPrice / math.max(1, count)
            
            if not self.scanData[itemId] or unitPrice < self.scanData[itemId] then
                self.scanData[itemId] = unitPrice
            end
        end
        
        i = i + 1
    end

    self.currentProcessIndex = i
    
    self.state = STATE_SAVING
    self.saveList = {}
    for id, price in pairs(self.scanData) do
        table.insert(self.saveList, { id = id, price = price })
    end
    self.totalSaveCount = #self.saveList
    self.currentSaveIndex = 1
end

function FullScan:ProcessSaveBatch()
    local startTime = debugprofilestop()
    local timeLimit = 15
    local Database = GF_Auction:GetModule("Database")
    local list = self.saveList
    local total = self.totalSaveCount
    local i = self.currentSaveIndex
    
    if not Database or total == 0 then
        self:FinishScan()
        return
    end

    while i <= total do
        if (i % 50 == 0) and (debugprofilestop() - startTime > timeLimit) then
            self.currentSaveIndex = i
            self:UpdateProgress(i, total, "Saving ")
            return
        end

            local item = list[i]
            if item then
                Database:SavePriceHistory(item.id, nil, item.price, item.price, 1, "", item.price, 0)
                
                local stats = {
                    minUnit = item.price,
                    minStackTotal = item.price,
                    time = time()
                }
                Database:SavePriceStats(item.id, stats, true)
            end
        
        i = i + 1
    end
    
    self:FinishScan()
end

function FullScan:UpdateProgress(current, total, prefix)
   local progress = math.floor((current / math.max(1, total)) * 100)
   prefix = prefix or ""
   self:UpdateButton(prefix .. progress .. "%")
end

function FullScan:FinishScan()
    self.state = STATE_IDLE
    self.updateFrame:Hide()
    self:ResetButton()
    
    local count = self.totalSaveCount or 0
    print(string.format("|cff00ff00%s:|r %s %d", L("ADDON_NAME"), L("UI_FULL_SCAN"), count))
    
    self.scanData = {}
    self.saveList = {}
    
    if _G.C_Timer then
        _G.C_Timer.After(3, function()
            _G.StaticPopupDialogs["GF_AUCTION_FULLSCAN_RELOAD"] = {
                text = L("UI_FULL_SCAN_RELOAD_TEXT") or "Scan complete. Reload UI to restore performance?",
                button1 = L("UI_RELOAD") or "Reload",
                button2 = L("UI_CANCEL") or "Cancel",
                OnAccept = function()
                    _G.ReloadUI()
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
            }
            _G.StaticPopup_Show("GF_AUCTION_FULLSCAN_RELOAD")
        end)
    end
end

function FullScan:OnAuctionHouseClosed()
    self:RestoreEvents()
    self.eventFrame:UnregisterEvent("AUCTION_HOUSE_CLOSED")
    if self.state ~= STATE_IDLE then
        self.state = STATE_IDLE
        self.updateFrame:Hide()
        self:ResetButton()
    end
end
