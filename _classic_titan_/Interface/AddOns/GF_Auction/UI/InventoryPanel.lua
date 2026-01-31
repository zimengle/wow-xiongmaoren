--[[
    GF_Auction InventoryPanel Module
    Displays auctionable items in bags
]]

local L = GF_Auction_L
local InventoryPanel = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("InventoryPanel", InventoryPanel)
end

local inventoryFrame = nil
local scrollFrame = nil
local content = nil
local updateTimer = nil

local CATEGORY_FONT_HEIGHT = 14
local ICON_SIZE = 32
local ICON_GAP = 5
local ROW_GAP = 6
local PADDING_LEFT = 3
local PADDING_TOP = 40
local ICONS_PER_ROW = 4

local itemButtons = {}
local categoryLabels = {}

local function QuoteName(name)
    name = tostring(name or "")
    if name == "" then return "" end
    return "\"" .. name .. "\""
end

local scanTip = nil
local function GetScanTooltip()
    if scanTip then return scanTip end
    if not _G.CreateFrame or not _G.UIParent then return nil end
    scanTip = _G.CreateFrame("GameTooltip", "GF_Auction_InvScanTooltip", _G.UIParent, "GameTooltipTemplate")
    scanTip:SetOwner(_G.UIParent, "ANCHOR_NONE")
    return scanTip
end

local function TooltipHasExactLine(link, exactLine)
    if not link or link == "" or not exactLine or exactLine == "" then return false end
    local tip = GetScanTooltip()
    if not tip then return false end

    tip:ClearLines()
    pcall(function()
        tip:SetHyperlink(link)
    end)

    local n = tip:NumLines() or 0
    for i = 2, n do
        local fs = _G["GF_Auction_InvScanTooltipTextLeft" .. i]
        local t = fs and fs.GetText and fs:GetText() or nil
        if t == exactLine then
            return true
        end
    end
    return false
end

local function GetClassIDs(itemID)
    local classID, subclassID = nil, nil
    if _G.GetItemInfoInstant then
        local _, _, _, _, _, cID, scID = _G.GetItemInfoInstant(itemID)
        classID, subclassID = cID, scID
    end
    if (not classID or not subclassID) and _G.GetItemInfo then
        local _, _, _, _, _, _, _, _, _, _, _, cID2, scID2 = _G.GetItemInfo(itemID)
        classID = classID or cID2
        subclassID = subclassID or scID2
    end
    return classID, subclassID
end

local function IsAuctionableBagItem(info, itemID, link)
    if not itemID then return false end

    if info and info.isBound == true then
        return false
    end

    local classID, _, bindType = nil, nil, nil
    if _G.GetItemInfo then
        local _, _, _, _, _, _, _, _, _, _, _, cID, _, bType = _G.GetItemInfo(itemID)
        classID = cID
        bindType = bType
    end
    if (not classID) and _G.GetItemInfoInstant then
        local _, _, _, _, _, cID2 = _G.GetItemInfoInstant(itemID)
        classID = cID2
    end

    if classID == 12 then
        return false
    end

    if bindType == 1 or bindType == 4 then
        return false
    end

    if link then
        if _G.ITEM_SOULBOUND and TooltipHasExactLine(link, _G.ITEM_SOULBOUND) then
            return false
        end
        if _G.ITEM_BIND_ON_PICKUP and TooltipHasExactLine(link, _G.ITEM_BIND_ON_PICKUP) then
            return false
        end
        if _G.ITEM_BIND_QUEST and TooltipHasExactLine(link, _G.ITEM_BIND_QUEST) then
            return false
        end
    end

    return true
end

local function GetContainerItemInfo(bag, slot)
    if _G.C_Container and _G.C_Container.GetContainerItemInfo then
        return _G.C_Container.GetContainerItemInfo(bag, slot)
    else
        local texture, count, locked, quality, readable, lootable, link, isFiltered, noValue, itemID = _G.GetContainerItemInfo(bag, slot)
        if texture then
            return {
                iconFileID = texture,
                stackCount = count,
                isLocked = locked,
                quality = quality,
                isReadable = readable,
                hasNoValue = noValue,
                itemID = itemID,
                hyperlink = link
            }
        end
    end
    return nil
end

local function GetContainerNumSlots(bag)
    if _G.C_Container and _G.C_Container.GetContainerNumSlots then
        return _G.C_Container.GetContainerNumSlots(bag)
    else
        return _G.GetContainerNumSlots(bag)
    end
end

function InventoryPanel:Initialize()
    return true
end

function InventoryPanel:Create()
    if inventoryFrame then return inventoryFrame end
    
    local MainFrame = GF_Auction:GetModule("MainFrame")
    local mainFrame = MainFrame and MainFrame:GetFrame()
    if not mainFrame then return nil end
    
    inventoryFrame = CreateFrame("Frame", "GF_Auction_InventoryFrame", mainFrame)
    inventoryFrame:SetWidth(190)
    inventoryFrame:SetPoint("TOPLEFT", mainFrame, "TOPRIGHT", 5, 0)
    inventoryFrame:SetPoint("BOTTOMLEFT", mainFrame, "BOTTOMRIGHT", 5, 0)
    inventoryFrame:SetFrameStrata("MEDIUM")
    if mainFrame and mainFrame.GetFrameLevel and inventoryFrame.SetFrameLevel then
        inventoryFrame:SetFrameLevel((mainFrame:GetFrameLevel() or 1) + 20)
    end

    local shouldShow = InventoryPanel:GetShowPreference()
    if shouldShow then
        inventoryFrame:Show()
    else
        inventoryFrame:Hide()
    end
    
    local backdrop = {
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    }
    
    if inventoryFrame.SetBackdrop then
        inventoryFrame:SetBackdrop(backdrop)
        inventoryFrame:SetBackdropColor(0, 0, 0, 0.92)
        inventoryFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    elseif _G.BackdropTemplateMixin then
        _G.Mixin(inventoryFrame, _G.BackdropTemplateMixin)
        inventoryFrame:SetBackdrop(backdrop)
        inventoryFrame:SetBackdropColor(0, 0, 0, 0.92)
        inventoryFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    end
    
    local title = inventoryFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -15)
    title:SetText(L("UI_INVENTORY"))
    title:SetTextColor(1, 0.82, 0)
    inventoryFrame.title = title
    
    local closeBtn = CreateFrame("Button", nil, inventoryFrame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    closeBtn:SetScript("OnClick", function()
        inventoryFrame:Hide()
        InventoryPanel:SaveShowPreference(false)
    end)
    inventoryFrame.closeBtn = closeBtn
    
    scrollFrame = CreateFrame("ScrollFrame", nil, inventoryFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 12, -40)
    
    local rightPad = -32
    if _G.NDui then
        rightPad = -28
    end
    scrollFrame:SetPoint("BOTTOMRIGHT", rightPad, 12)
    
    content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(scrollFrame:GetWidth(), 400)
    scrollFrame:SetScrollChild(content)
    inventoryFrame.scrollFrame = scrollFrame

    local copyBox = CreateFrame("EditBox", nil, inventoryFrame, "InputBoxTemplate")
    copyBox:SetAutoFocus(false)
    copyBox:SetHeight(22)
    local gridWidth = (ICONS_PER_ROW * ICON_SIZE) + ((ICONS_PER_ROW - 1) * ICON_GAP)
    copyBox:ClearAllPoints()
    copyBox:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", PADDING_LEFT, 4)
    copyBox:SetPoint("TOPRIGHT", scrollFrame, "TOPLEFT", PADDING_LEFT + gridWidth, 4)
    copyBox:SetFrameLevel(inventoryFrame:GetFrameLevel() + 10)
    copyBox:Hide()
    inventoryFrame.copyBox = copyBox

    local function HideInlineCopy()
        if not inventoryFrame or not inventoryFrame.copyBox then return end
        inventoryFrame.copyBox:Hide()
        inventoryFrame.copyBox:ClearFocus()
    end

    local function ShowInlineCopy(text)
        if not inventoryFrame or not inventoryFrame.copyBox then return end
        inventoryFrame.copyBox:Show()
        inventoryFrame.copyBox:SetText(text or "")
        inventoryFrame.copyBox:SetFocus()
        if inventoryFrame.copyBox.HighlightText then
            inventoryFrame.copyBox:HighlightText(0, -1)
        end
    end

    copyBox:SetScript("OnEscapePressed", function() HideInlineCopy() end)
    copyBox:SetScript("OnEditFocusLost", function() HideInlineCopy() end)
    inventoryFrame.__GFA_ShowInlineCopy = ShowInlineCopy
    inventoryFrame.__GFA_HideInlineCopy = HideInlineCopy
    
    -- Event Handling
    inventoryFrame:SetScript("OnShow", function()
        InventoryPanel:UpdateInventory()
        inventoryFrame:RegisterEvent("BAG_UPDATE_DELAYED")
    end)
    
    inventoryFrame:SetScript("OnHide", function()
        inventoryFrame:UnregisterEvent("BAG_UPDATE_DELAYED")
    end)
    
    inventoryFrame:SetScript("OnEvent", function(self, event)
        if event == "BAG_UPDATE_DELAYED" and self:IsVisible() then
            InventoryPanel:UpdateInventory()
        end
    end)

    -- Skinning
    local Skin = GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyInventoryFrame then
        Skin:ApplyInventoryFrame(inventoryFrame)
    end
    
    return inventoryFrame
end

local function GetCategoryLabel(index)
    if not categoryLabels[index] then
        local label = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetJustifyH("LEFT")
        label:SetTextColor(1, 0.82, 0)
        categoryLabels[index] = label
    end
    return categoryLabels[index]
end

local function GetItemButton(index)
    if not itemButtons[index] then
        local btn = CreateFrame("Button", nil, content)
        btn:SetSize(ICON_SIZE, ICON_SIZE)
        
        btn.icon = btn:CreateTexture(nil, "ARTWORK")
        btn.icon:SetAllPoints()
        btn.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        
        btn.iconBorder = btn:CreateTexture(nil, "BACKGROUND")
        btn.iconBorder:SetSize(ICON_SIZE + 2, ICON_SIZE + 2)
        btn.iconBorder:SetPoint("CENTER", btn.icon, "CENTER", 0, 0)
        btn.iconBorder:SetColorTexture(0, 0, 0, 0)
        
        btn.count = btn:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        btn.count:SetPoint("BOTTOMRIGHT", -2, 2)
        btn.count:SetJustifyH("RIGHT")
        
        btn:SetScript("OnEnter", function(self)
            if self.itemLink then
                local tip = _G.GameTooltip
                if not tip then return end
                tip:SetOwner(self, "ANCHOR_RIGHT")
                tip:SetHyperlink(self.itemLink)
                tip:AddLine(" ")
                tip:AddLine("|cffffd700" .. L("UI_LEFT_CLICK") .. "|r " .. L("UI_COPY_NAME"), 0, 1, 0)
                tip:AddLine("|cffffd700" .. L("UI_RIGHT_CLICK") .. "|r " .. L("UI_LIST_TOOLTIP"), 0, 1, 0)
                tip:Show()
            end
        end)
        
        btn:SetScript("OnLeave", function()
            local tip = _G.GameTooltip
            if tip then tip:Hide() end
        end)
        
        btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        
        btn:SetScript("OnClick", function(self, button)
            if button == "LeftButton" then
                local name = nil
                if self.itemLink and _G.GetItemInfo then
                    name = _G.GetItemInfo(self.itemLink)
                end
                if (not name or name == "") and self.itemID and _G.GetItemInfo then
                    name = _G.GetItemInfo(self.itemID)
                end
                local text = QuoteName(name)
                if text == "" then return end

                if _G.C_ChatInfo and _G.C_ChatInfo.CopyChatLine then
                    _G.C_ChatInfo:CopyChatLine(text)
                    return
                end
                if inventoryFrame and inventoryFrame.__GFA_ShowInlineCopy then
                    inventoryFrame.__GFA_ShowInlineCopy(text)
                end
                return
            end

            if button ~= "RightButton" then return end
            if not self.itemID then return end
            local MainFrame = GF_Auction:GetModule("MainFrame")
            if MainFrame then MainFrame:ShowPanel("PricePanel") end
            
            if _G.AuctionFrameTab3 then
                if _G.AuctionFrameTab_OnClick then
                    _G.AuctionFrameTab_OnClick(_G.AuctionFrameTab3)
                elseif _G.AuctionFrameTab3.Click then
                    _G.AuctionFrameTab3:Click()
                end
            end
            
            local PricePanel = GF_Auction:GetModule("PricePanel")
            if PricePanel and PricePanel.SetAuctionMode then
                PricePanel:SetAuctionMode(true, self.itemID)
            end
            
            local ItemSelector = GF_Auction:GetModule("ItemSelector")
            if ItemSelector and ItemSelector.TryAutoPlaceSelectedItem then
                ItemSelector:TryAutoPlaceSelectedItem(self.itemID)
            end
        end)
        
        itemButtons[index] = btn
    end
    return itemButtons[index]
end

local function GetCategoryGroup(classID, subclassID)
    if not classID then
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    if classID == 0 then
        if subclassID == 0 or subclassID == 1 or subclassID == 2 or subclassID == 3 or subclassID == 4 or subclassID == 5 then
            return L("UI_INVENTORY_CATEGORY_COMMON")
        end
        if subclassID == 7 then
            return L("UI_INVENTORY_CATEGORY_OTHER")
        end
        return L("UI_INVENTORY_CATEGORY_COMMON")
    end
    
    if classID == 7 then
        if subclassID == 16 then
            return L("UI_INVENTORY_CATEGORY_COMMON")
        end
        return L("UI_INVENTORY_CATEGORY_COMMON")
    end
    
    if classID == 16 then
        return L("UI_INVENTORY_CATEGORY_COMMON")
    end
    
    if classID == 3 then
        if subclassID == 1 or subclassID == 2 then
            return L("UI_INVENTORY_CATEGORY_COMMON")
        end
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    if classID == 4 then
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    if classID == 5 then
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    if classID == 11 then
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    if classID == 12 then
        return L("UI_INVENTORY_CATEGORY_OTHER")
    end
    
    return L("UI_INVENTORY_CATEGORY_OTHER")
end

function InventoryPanel:ScanBags()
    local items = {}
    local categories = {}
    local categoryMap = {}
    
    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local info = GetContainerItemInfo(bag, slot)
            if info and info.itemID then
                local itemID = info.itemID
                local link = info.hyperlink
                if IsAuctionableBagItem(info, itemID, link) then
                    local classID, subclassID = GetClassIDs(itemID)
                    local catName = GetCategoryGroup(classID, subclassID)
                    if not categoryMap[catName] then
                        categoryMap[catName] = {}
                        local exists = false
                        for _, cat in ipairs(categories) do
                            if cat == catName then
                                exists = true
                                break
                            end
                        end
                        if not exists then
                            table.insert(categories, catName)
                        end
                    end
                    
                    local found = false
                    for _, v in ipairs(categoryMap[catName]) do
                        if v.itemID == itemID then
                            v.count = v.count + info.stackCount
                            found = true
                            break
                        end
                    end
                    
                    if not found then
                        local icon = info.iconFileID
                        if not icon and _G.GetItemInfoInstant then
                            local _, _, _, _, icon2 = _G.GetItemInfoInstant(itemID)
                            icon = icon2
                        end
                        table.insert(categoryMap[catName], {
                            itemID = itemID,
                            link = link,
                            icon = icon,
                            quality = info.quality or 1,
                            count = info.stackCount
                        })
                    end
                end
            end
        end
    end
    
    table.sort(categories, function(a, b)
        local commonCat = L("UI_INVENTORY_CATEGORY_COMMON")
        if a == commonCat then return true end
        if b == commonCat then return false end
        return a < b
    end)
    
    return categories, categoryMap
end

function InventoryPanel:UpdateInventory()
    if not inventoryFrame or not inventoryFrame:IsShown() then return end
    
    for _, btn in pairs(itemButtons) do btn:Hide() end
    for _, lbl in pairs(categoryLabels) do lbl:Hide() end
    
    local categories, catMap = self:ScanBags()
    local yOffset = 0
    local btnIdx = 1
    local lblIdx = 1
    
    for _, catName in ipairs(categories) do
        local list = catMap[catName]
        if #list > 0 then
            table.sort(list, function(a, b)
                if a.quality == b.quality then
                    return (a.itemID or 0) < (b.itemID or 0)
                end
                return a.quality > b.quality
            end)
            
            local lbl = GetCategoryLabel(lblIdx)
            lbl:SetText(catName)
            lbl:SetPoint("TOPLEFT", PADDING_LEFT, -yOffset)
            lbl:SetPoint("TOPRIGHT", 0, -yOffset)
            lbl:Show()
            lblIdx = lblIdx + 1
            yOffset = yOffset + CATEGORY_FONT_HEIGHT + 8
            
            local col = 0
            for _, item in ipairs(list) do
                local btn = GetItemButton(btnIdx)
                btn:SetPoint("TOPLEFT", PADDING_LEFT + col * (ICON_SIZE + ICON_GAP), -yOffset)
                btn.icon:SetTexture(item.icon)
                btn.count:SetText(item.count > 1 and item.count or "")
                
                if item.quality and item.quality >= 1 then
                    local r, g, b = GetItemQualityColor(item.quality)
                    btn.iconBorder:SetColorTexture(r, g, b, 1)
                else
                    btn.iconBorder:SetColorTexture(0, 0, 0, 0)
                end
                
                btn.itemID = item.itemID
                btn.itemLink = item.link
                btn:Show()
                
                btnIdx = btnIdx + 1
                col = col + 1
                if col >= ICONS_PER_ROW then
                    col = 0
                    yOffset = yOffset + ICON_SIZE + ICON_GAP
                end
            end
            
            if col > 0 then
                yOffset = yOffset + ICON_SIZE + ICON_GAP
            end
            yOffset = yOffset + ROW_GAP
        end
    end
    
    content:SetHeight(yOffset + 20)
end

function InventoryPanel:Toggle()
    local FavoritePanel = GF_Auction:GetModule("FavoritePanel")
    if FavoritePanel and FavoritePanel.HideImportExportDialog then
        FavoritePanel:HideImportExportDialog(true)
    end
    
    if not inventoryFrame then
        self:Create()
    end
    
    if inventoryFrame then
        if inventoryFrame:IsShown() then
            inventoryFrame:Hide()
            self:SaveShowPreference(false)
        else
            inventoryFrame:Show()
            self:SaveShowPreference(true)
            local Skin = GF_Auction:GetModule("Skin")
            if Skin and Skin.ApplyInventoryFrame then
                Skin:ApplyInventoryFrame(inventoryFrame)
            end
        end
    end
end

function InventoryPanel:GetFrame()
    return inventoryFrame
end

function InventoryPanel:IsShown()
    return inventoryFrame and inventoryFrame:IsShown() or false
end

function InventoryPanel:Show()
    if not inventoryFrame then
        self:Create()
    end
    if inventoryFrame then
        inventoryFrame:Show()
        self:SaveShowPreference(true)
        local Skin = GF_Auction:GetModule("Skin")
        if Skin and Skin.ApplyInventoryFrame then
            Skin:ApplyInventoryFrame(inventoryFrame)
        end
    end
end

function InventoryPanel:Hide()
    if inventoryFrame then
        inventoryFrame:Hide()
        self:SaveShowPreference(false)
    end
end

function InventoryPanel:GetShowPreference()
    local Database = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Database")
    if Database then
        local settings = Database:GetSettings()
        if settings and settings.showInventoryPanel ~= nil then
            return settings.showInventoryPanel
        end
    end
    return true
end

function InventoryPanel:SaveShowPreference(show)
    local Database = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Database")
    if Database then
        local settings = Database:GetSettings()
        if settings then
            settings.showInventoryPanel = show == true
        end
    end
end
