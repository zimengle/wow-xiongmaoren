--[[
    GF_Auction MainFrame Module
    Main auxiliary window for displaying price history and suggestions
]]

local L = GF_Auction_L

-- Create MainFrame module
local MainFrame = {}

-- Register module
if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("MainFrame", MainFrame)
end

-- Frame references
local mainFrame = nil
local tabs = {}
local currentTab = nil
local contentFrame = nil
local dockFrame = nil
local dockButtons = nil

-- Browse sort (buyout) helpers
local savedBrowseSortCvars = nil
local lastBrowseSortTime = 0

local function EnsureBrowseBuyoutSort(force)
    if not _G.AuctionFrame or not _G.AuctionFrame:IsVisible() then
        return
    end
    if not _G.AuctionFrame_SetSort or not _G.GetAuctionSort or not _G.GetCVar or not _G.SetCVar then
        return
    end

    local now = _G.GetTime and _G.GetTime() or 0
    if not force and now > 0 and (now - lastBrowseSortTime) < 0.6 then
        return
    end
    lastBrowseSortTime = now

    pcall(function()
        local col, rev = _G.GetAuctionSort("list", 1)
        if col == "totalbuyout" or col == "unitbid" or col == "unitprice" then
            col = "bid"
        end

        local wantCol, wantRev = "bid", false
        local wantBuyout, wantUnit = "1", "1"

        local curBuyout = _G.GetCVar("auctionSortByBuyoutPrice")
        local curUnit = _G.GetCVar("auctionSortByUnitPrice")

        if force
            or col ~= wantCol
            or rev ~= wantRev
            or curBuyout ~= wantBuyout
            or curUnit ~= wantUnit
        then
            if not savedBrowseSortCvars then
                savedBrowseSortCvars = { buyout = curBuyout, unit = curUnit }
            end
            _G.SetCVar("auctionSortByBuyoutPrice", wantBuyout)
            _G.SetCVar("auctionSortByUnitPrice", wantUnit)
            _G.AuctionFrame_SetSort("list", wantCol, wantRev)
        end
    end)
end

local function RestoreBrowseSortCvars()
    if not savedBrowseSortCvars or not _G.SetCVar then
        return
    end
    pcall(function()
        if savedBrowseSortCvars.buyout ~= nil then
            _G.SetCVar("auctionSortByBuyoutPrice", savedBrowseSortCvars.buyout)
        end
        if savedBrowseSortCvars.unit ~= nil then
            _G.SetCVar("auctionSortByUnitPrice", savedBrowseSortCvars.unit)
        end
    end)
    savedBrowseSortCvars = nil
end

-- Default frame settings
local DEFAULT_WIDTH = 320
local DEFAULT_HEIGHT = 400
local DEFAULT_POSITION = {point = "TOPRIGHT", relativeTo = "UIParent", relativePoint = "TOPRIGHT", x = -50, y = -100}

local function GetAuctionFrameHeight()
    local auctionFrame = _G.AuctionFrame
    if auctionFrame and auctionFrame:IsVisible() then
        return auctionFrame:GetHeight()
    elseif auctionFrame then
        return auctionFrame:GetHeight()
    end
    return DEFAULT_HEIGHT
end

local function AlignWithAuctionFrame()
    if not mainFrame then
        return
    end

    local auctionFrame = _G.AuctionFrame
    if not auctionFrame or not auctionFrame:IsVisible() then
        return
    end

    local auctionHeight = auctionFrame:GetHeight()
    mainFrame:SetHeight(auctionHeight)

    local topYOffset = -10
    if _G.ElvUI then
        topYOffset = -13
    elseif _G.NDui then
        topYOffset = -11
    end

    local bottomYOffset = 7
    if _G.ElvUI then
        bottomYOffset = 11
    elseif _G.NDui then
        bottomYOffset = 11
    end

    mainFrame:ClearAllPoints()
    mainFrame:SetPoint("TOPLEFT", auctionFrame, "TOPRIGHT", 5, topYOffset)
    mainFrame:SetPoint("BOTTOMLEFT", auctionFrame, "BOTTOMRIGHT", 5, bottomYOffset)
end

local function GetAuctionTabAnchor()
    local auctionFrame = _G.AuctionFrame
    if not auctionFrame then return nil end

    local lastTab = nil
    for i = 1, 10 do
        local tab = _G["AuctionFrameTab" .. i]
        if tab and tab.IsShown and tab:IsShown() then
            lastTab = tab
        end
    end
    return lastTab
end

local function PositionDockBar()
    if not dockFrame then return end
    local anchorTab = GetAuctionTabAnchor()
    if not anchorTab then
        dockFrame:Hide()
        return
    end

    local gap = 6
    local yOffset = 3
    if _G.ElvUI then
        yOffset = 2
    elseif _G.NDui then
        yOffset = -1
    end
    dockFrame:ClearAllPoints()
    dockFrame:SetPoint("BOTTOMLEFT", anchorTab, "BOTTOMRIGHT", gap, yOffset)

    local h = anchorTab:GetHeight() or 24
    dockFrame:SetHeight(h)
end

local fullScanBtn = nil

function MainFrame:CreateFullScanButton()
    if fullScanBtn then return fullScanBtn end
    
    local browseTab = _G.AuctionFrameBrowse
    local searchBtn = _G.BrowseSearchButton
    
    if not browseTab or not searchBtn then return nil end
    
    local btn = CreateFrame("Button", "GF_Auction_FullScanButton", browseTab, "UIPanelButtonTemplate")
    btn:SetSize(80, 22)
    btn:SetText(L("UI_FULL_SCAN"))
    btn:SetPoint("RIGHT", searchBtn, "LEFT", -5, 0)
    
    btn:SetScript("OnClick", function()
        local FullScan = GF_Auction:GetModule("FullScan")
        if FullScan then
            FullScan:StartScan(btn)
        end
    end)

    btn:SetScript("OnEnter", function(self)
        if not _G.GameTooltip then return end
        _G.GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        _G.GameTooltip:AddLine(L("UI_FULL_SCAN_TOOLTIP_NORMAL"), 1.0, 0.82, 0.0, true)
        _G.GameTooltip:AddLine(L("UI_FULL_SCAN_TOOLTIP_WARN"), 1, 0, 0, true)
        _G.GameTooltip:Show()
    end)

    btn:SetScript("OnLeave", function(self)
        if _G.GameTooltip then
            _G.GameTooltip:Hide()
        end
    end)
    
    local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyFullScanButton then
        Skin:ApplyFullScanButton(btn)
    end
    
    fullScanBtn = btn
    return btn
end

-- Initialize module
function MainFrame:Initialize()
    if mainFrame then
        return true
    end

    self:CreateFrame()
    self:CreateContentArea()
    self:RegisterEvents()

    self:ApplySkin()

    return true
end

function MainFrame:ApplySkin()
    local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyMainFrame then
        Skin:ApplyMainFrame(mainFrame, tabs)
    end
end

function MainFrame:ApplyDockSkin()
    local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyDockBar and dockButtons then
        Skin:ApplyDockBar(dockButtons)
    end
end

-- Create main frame
function MainFrame:CreateFrame()
    local template = "BackdropTemplate"
    if not _G[template] and BackdropTemplateMixin then
        template = nil
    end
    
    mainFrame = CreateFrame("Frame", "GF_Auction_MainFrame", UIParent, template)
    
    -- Apply backdrop if available
    if mainFrame.SetBackdrop then
        mainFrame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })
        mainFrame:SetBackdropColor(0, 0, 0, 0.92)
        mainFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    elseif BackdropTemplateMixin then
        if _G.Mixin then
            _G.Mixin(mainFrame, BackdropTemplateMixin)
        end
        mainFrame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })
        mainFrame:SetBackdropColor(0, 0, 0, 0.92)
        mainFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
    end
    
    -- Frame properties
    -- Use AuctionFrame height if available, otherwise use default
    local frameHeight = GetAuctionFrameHeight()
    mainFrame:SetSize(DEFAULT_WIDTH, frameHeight)
    mainFrame:SetFrameStrata("MEDIUM")
    mainFrame:SetClampedToScreen(true)
    mainFrame:SetMovable(true)
    mainFrame:EnableMouse(true)
    mainFrame:RegisterForDrag("LeftButton")
    
    local auctionFrame = _G.AuctionFrame
    if auctionFrame and auctionFrame:IsVisible() then
        AlignWithAuctionFrame()
    else
        local pos = DEFAULT_POSITION
        mainFrame:SetPoint(pos.point, pos.relativeTo, pos.relativePoint, pos.x, pos.y)
    end
    
    -- Drag handlers
    mainFrame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    
    mainFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        MainFrame:SavePosition()
    end)
    
    -- Create title bar
    self:CreateTitleBar()
    
    -- Create close button
    self:CreateCloseButton()
    
    -- Initially hidden
    mainFrame:Hide()
end

function MainFrame:CreateDockBar()
    if dockFrame then
        return
    end

    local auctionFrame = _G.AuctionFrame
    if not auctionFrame then
        return
    end

    dockFrame = CreateFrame("Frame", nil, auctionFrame)
    dockFrame:SetFrameStrata("LOW")
    dockFrame:Hide()

    dockButtons = {}

    local btnData = {
        { id = "home", text = L("DOCK_HOME") },
        { id = "favorite", text = L("DOCK_FAVORITE") },
    }

    local last = nil
    local btnW, btnH = 58, 28
    if _G.ElvUI then
        btnH = 24
    end
    for i, data in ipairs(btnData) do
        local btn = CreateFrame("Button", nil, dockFrame, "UIPanelButtonTemplate")
        btn:SetSize(btnW, btnH)
        btn:SetText(data.text)
        btn.id = data.id

        if i == 1 then
            btn:SetPoint("LEFT", dockFrame, "LEFT", 0, 0)
        else
            btn:SetPoint("LEFT", last, "RIGHT", 8, 0)
        end

        btn:SetScript("OnClick", function()
            if not mainFrame then
                MainFrame:Initialize()
            end
            if data.id == "home" then
                MainFrame:ShowPanel("PricePanel")
            elseif data.id == "favorite" then
                MainFrame:ShowPanel("FavoritePanel")
            end
        end)

        dockButtons[data.id] = btn
        last = btn
    end

    dockFrame:SetWidth((btnW * #btnData) + (8 * (#btnData - 1)))

    self:ApplyDockSkin()
    PositionDockBar()
    self:UpdateDockBar()
end

function MainFrame:UpdateDockBar()
    if not dockButtons then return end
    
    local current = self.currentPanel or "PricePanel"
    
    if dockButtons.home then
        if current == "PricePanel" then
            dockButtons.home:LockHighlight()
            dockButtons.home:SetEnabled(false)
        else
            dockButtons.home:UnlockHighlight()
            dockButtons.home:SetEnabled(true)
        end
    end
    
    if dockButtons.favorite then
        if current == "FavoritePanel" then
            dockButtons.favorite:LockHighlight()
            dockButtons.favorite:SetEnabled(false)
        else
            dockButtons.favorite:UnlockHighlight()
            dockButtons.favorite:SetEnabled(true)
        end
    end
end

function MainFrame:ShowPanel(panelName)
    if not mainFrame then return end
    
    if not mainFrame:IsVisible() then
        mainFrame:Show()
    end

    if not contentFrame then
        self:CreateContentArea()
    end
    
    local PricePanel = GF_Auction:GetModule("PricePanel")
    local FavoritePanel = GF_Auction:GetModule("FavoritePanel")
    
    if panelName == "PricePanel" then
        if PricePanel then
            if PricePanel.Create and not PricePanel.priceContentFrame and contentFrame then
                PricePanel:Create(contentFrame)
            end
            PricePanel:Show()
    end
        if FavoritePanel then 
            FavoritePanel:Hide()
            if FavoritePanel.HideImportExportDialog then
                FavoritePanel:HideImportExportDialog()
            end
        end
    elseif panelName == "FavoritePanel" then
        if PricePanel then PricePanel:Hide() end
        if FavoritePanel then
            if FavoritePanel.Create and not FavoritePanel.GetFrame and contentFrame then
                FavoritePanel:Create(contentFrame)
            end
            FavoritePanel:Show()
        end
    end
    
    self.currentPanel = panelName
end

function MainFrame:ShowDockBar()
    if not self.currentPanel then
        self:ShowPanel("PricePanel")
    end
end

function MainFrame:HideDockBar()
end

-- Create title bar
function MainFrame:CreateTitleBar()
    local titleBar = CreateFrame("Frame", nil, mainFrame)
    titleBar:SetPoint("TOPLEFT", 10, -10)
    titleBar:SetPoint("TOPRIGHT", -30, -10)
    titleBar:SetHeight(24)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    
    titleBar:SetScript("OnDragStart", function()
        mainFrame:StartMoving()
    end)
    
    titleBar:SetScript("OnDragStop", function()
        mainFrame:StopMovingOrSizing()
        MainFrame:SavePosition()
    end)
 
    -- Create icon texture
    local iconTexture = titleBar:CreateTexture(nil, "OVERLAY")
    iconTexture:SetSize(20, 20)
    iconTexture:SetPoint("LEFT", 10, 0)
    iconTexture:SetTexture("Interface\\AddOns\\GF_Auction\\Media\\icon.tga")

    mainFrame.titleIcon = iconTexture

    local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    titleText:SetPoint("LEFT", iconTexture, "RIGHT", 8, 0)
    local ver = (GF_Auction and GF_Auction.version)
    titleText:SetText(string.format("GF Auction |cff9aa3adv%s|r", tostring(ver)))
    titleText:SetTextColor(1.0, 0.82, 0.0)

    mainFrame.titleBar = titleBar
    mainFrame.titleText = titleText
end

-- Create close button
function MainFrame:CreateCloseButton()
    local closeBtn = CreateFrame("Button", nil, mainFrame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)
    closeBtn:SetScript("OnClick", function()
        self:Hide()
    end)
    
    mainFrame.closeBtn = closeBtn
end

-- Create content area
function MainFrame:CreateContentArea()
    contentFrame = CreateFrame("Frame", nil, mainFrame)
    contentFrame:SetPoint("TOPLEFT", mainFrame.titleBar, "BOTTOMLEFT", 5, -8)
    contentFrame:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -5, 5)
    
    mainFrame.contentFrame = contentFrame
end

-- Register events
function MainFrame:RegisterEvents()
    local EventManager = GF_Auction:GetModule("EventManager")
    if not EventManager then
        return
    end

    local function EnsureAuctionFrameHideHook()
        local auctionFrame = _G.AuctionFrame
        if auctionFrame and auctionFrame.HookScript and not auctionFrame.__GFA_HookedHide then
            auctionFrame:HookScript("OnHide", function()
                if MainFrame and MainFrame.Hide then
                    MainFrame:Hide()
                end
                if MainFrame and MainFrame.HideDockBar then
                    MainFrame:HideDockBar()
                end
            end)
            auctionFrame.__GFA_HookedHide = true
        end
    end

    local function EnsureAuctionTabHook()
        local browseTab = _G.AuctionFrameTab1
        if browseTab and browseTab.HookScript and not browseTab.__GFA_HookedClick then
            browseTab:HookScript("OnClick", function()
                if _G.C_Timer and _G.C_Timer.After then
                    _G.C_Timer.After(0.1, function()
                        if _G.AuctionFrame and _G.AuctionFrame.type == "list" then
                            if MainFrame and MainFrame.ShowPanel then
                                MainFrame:ShowPanel("PricePanel")
                            end
                        end
                    end)
                else
                    if _G.AuctionFrame and _G.AuctionFrame.type == "list" then
                        if MainFrame and MainFrame.ShowPanel then
                            MainFrame:ShowPanel("PricePanel")
                        end
                    end
                end
            end)
            browseTab.__GFA_HookedClick = true
        end
        
        local auctionTab = _G.AuctionFrameTab3
        if auctionTab and auctionTab.HookScript and not auctionTab.__GFA_HookedClick then
            auctionTab:HookScript("OnClick", function()
                if _G.C_Timer and _G.C_Timer.After then
                    _G.C_Timer.After(0.2, function()
                        if MainFrame and MainFrame.ShowPanel then
                            MainFrame:ShowPanel("PricePanel")
                        end
                    end)
                else
                    if MainFrame and MainFrame.ShowPanel then
                        MainFrame:ShowPanel("PricePanel")
                    end
                end
            end)
            auctionTab.__GFA_HookedClick = true
        end
    end

    EnsureAuctionFrameHideHook()
    
    EventManager:Subscribe(self, {
        "AUCTION_HOUSE_SHOW",
        "AUCTION_HOUSE_CLOSED",
        "AUCTION_ITEM_LIST_UPDATE"
    }, function(event, ...)
        if event == "AUCTION_HOUSE_SHOW" then
            EnsureAuctionFrameHideHook()
            EnsureAuctionTabHook()
            if mainFrame then
                AlignWithAuctionFrame()
            end
            EnsureBrowseBuyoutSort(true)
            self:Show()
            self:ShowDockBar()
            self:CreateFullScanButton()
            
            local InventoryPanel = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("InventoryPanel")
            if InventoryPanel and InventoryPanel.GetShowPreference then
                local shouldShow = InventoryPanel:GetShowPreference()
                if shouldShow then
                    if _G.C_Timer and _G.C_Timer.After then
                        _G.C_Timer.After(0.1, function()
                            if InventoryPanel and InventoryPanel.Show then
                                InventoryPanel:Show()
                            end
                        end)
                    else
                        if InventoryPanel and InventoryPanel.Show then
                            InventoryPanel:Show()
                        end
                    end
                end
            end
            
            if _G.AuctionFrame and _G.AuctionFrame.type == "list" then
                local selected = _G.GetSelectedAuctionItem and _G.GetSelectedAuctionItem("list")
                if selected and selected > 0 then
                    self:ShowPanel("PricePanel")
                else
                    self:ShowPanel("FavoritePanel")
                end
            end
        elseif event == "AUCTION_HOUSE_CLOSED" then
            self:Hide()
            self:HideDockBar()
            RestoreBrowseSortCvars()
        end
    end)
end

-- Show frame
function MainFrame:Show()
    if mainFrame then
        mainFrame:Show()
    end
    self:UpdateDockBar()
end

-- Hide frame
function MainFrame:Hide()
    if mainFrame then
        mainFrame:Hide()
    end
    self:UpdateDockBar()
end

-- Toggle frame
function MainFrame:Toggle()
    if mainFrame and mainFrame:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

-- Check if visible
function MainFrame:IsVisible()
    return mainFrame and mainFrame:IsShown() or false
end

-- Save position
function MainFrame:SavePosition()
    if not mainFrame then
        return
    end
    
    local point, relativeTo, relativePoint, x, y = mainFrame:GetPoint()
    DEFAULT_POSITION = {
        point = point,
        relativeTo = relativeTo and relativeTo:GetName() or "UIParent",
        relativePoint = relativePoint,
        x = x,
        y = y
    }
end

-- Get frame reference
function MainFrame:GetFrame()
    return mainFrame
end

-- Update price display (called when item is selected)
function MainFrame:UpdatePriceDisplay(itemID, itemLink)
    if not mainFrame then
        return
    end
    
    local PricePanel = GF_Auction:GetModule("PricePanel")
    if not PricePanel then
        return
    end

    if self.ShowPanel then
        self:ShowPanel("PricePanel")
    end

    if contentFrame and PricePanel.Create then
        PricePanel:Create(contentFrame)
    end

    if PricePanel.UpdateItem then
        PricePanel:UpdateItem(itemID, itemLink)
    end
end

