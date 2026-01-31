--[[
    GF_Auction FavoritePanel Module
    Displays list of favorite items
]]

local L = GF_Auction_L
local Utils = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Utils")

local FavoritePanel = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("FavoritePanel", FavoritePanel)
end

local favoriteContentFrame = nil
local scrollFrame = nil
local content = nil
local rows = {}
local ROW_HEIGHT = 44

local DOUBLE_CLICK_WINDOW = 0.5
local DOUBLE_CLICK_MOVE_PX = 12
local COPY_HINT_FADE = 0.6

local pendingRefresh = false

-- Localize commonly used globals
local C_Timer = _G.C_Timer
local UIFrameFadeOut = _G.UIFrameFadeOut
local GameTooltip = _G.GameTooltip
local GetTime = _G.GetTime
local GetCursorPosition = _G.GetCursorPosition
local UIParent = _G.UIParent
local GetItemInfo = _G.GetItemInfo
local IsShiftKeyDown = _G.IsShiftKeyDown

local function SetupSmoothScroll(sf, opts)
    if not sf or sf.__GFA_SmoothScroll then
        return
    end

    opts = opts or {}
    local step = opts.step or (ROW_HEIGHT * 0.9)
    local rate = opts.rate or 18

    local smooth = {
        active = false,
        target = 0,
        deferRefresh = false,
    }
    sf.__GFA_SmoothScroll = smooth

    local function getRange()
        local r = (sf.GetVerticalScrollRange and sf:GetVerticalScrollRange()) or 0
        if not r or r < 0 then r = 0 end
        return r
    end

    local function clamp(v)
        if not v then v = 0 end
        local maxV = getRange()
        if v < 0 then return 0 end
        if v > maxV then return maxV end
        return v
    end

    local function getCur()
        return (sf.GetVerticalScroll and sf:GetVerticalScroll()) or 0
    end

    local function setCur(v)
        if sf.SetVerticalScroll then
            sf:SetVerticalScroll(v)
        end
    end

    local function stopIfCloseEnough(cur, tgt)
        if math.abs(tgt - cur) < 0.5 then
            setCur(tgt)
            smooth.active = false
            sf:SetScript("OnUpdate", nil)

            if smooth.deferRefresh then
                smooth.deferRefresh = false
                if FavoritePanel and FavoritePanel.RequestUpdateList then
                    FavoritePanel:RequestUpdateList()
                end
            end
            return true
        end
        return false
    end

    local function start()
        if smooth.active then return end
        smooth.active = true
        sf:SetScript("OnUpdate", function(_, elapsed)
            local cur = getCur()
            local tgt = clamp(smooth.target)
            if stopIfCloseEnough(cur, tgt) then
                return
            end

            local a = 1 - math.exp(-rate * (elapsed or 0))
            setCur(cur + (tgt - cur) * a)
        end)
    end

    sf:EnableMouseWheel(true)
    sf:SetScript("OnMouseWheel", function(_, delta)
        local cur = getCur()
        local s = step
        if IsShiftKeyDown and IsShiftKeyDown() then
            s = s * 3
        end
        smooth.target = clamp(cur - delta * s)
        start()
    end)

    local sb = sf.ScrollBar
    if sb and sb.HookScript then
        sb:HookScript("OnValueChanged", function(_, value)
            if not smooth.active then
                smooth.target = clamp(value or 0)
            end
        end)
    end
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
                if myToken ~= state.token then return end
                opts.onSingle(self, button)
            end)
        elseif opts.onSingle then
            opts.onSingle(self, button)
        end
    end
end

function FavoritePanel:RequestUpdateList()
    if pendingRefresh then return end
    pendingRefresh = true
    if C_Timer and C_Timer.After then
        C_Timer.After(0.15, function()
            pendingRefresh = false
            if favoriteContentFrame and favoriteContentFrame:IsShown() then
                if scrollFrame and scrollFrame.__GFA_SmoothScroll and scrollFrame.__GFA_SmoothScroll.active then
                    scrollFrame.__GFA_SmoothScroll.deferRefresh = true
                    return
                end
                FavoritePanel:UpdateList()
            end
        end)
    else
        pendingRefresh = false
        if favoriteContentFrame and favoriteContentFrame:IsShown() then
            FavoritePanel:UpdateList()
        end
    end
end


function FavoritePanel:Initialize()
    return true
end

function FavoritePanel:Create(parent)
    if favoriteContentFrame then return favoriteContentFrame end
    
    favoriteContentFrame = CreateFrame("Frame", nil, parent)
    favoriteContentFrame:SetAllPoints(parent)
    favoriteContentFrame:Hide()
    
    local bottomFrame = CreateFrame("Frame", nil, favoriteContentFrame)
    bottomFrame:SetPoint("BOTTOMLEFT", favoriteContentFrame, "BOTTOMLEFT", 5, 8)
    bottomFrame:SetPoint("BOTTOMRIGHT", favoriteContentFrame, "BOTTOMRIGHT", -2, 8)
    bottomFrame:SetHeight(90)
    favoriteContentFrame.bottomFrame = bottomFrame
    
    local title = bottomFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText(" ")
    title:SetTextColor(1, 0.5, 0.25)
    
    local function CreatePlaceholderRow(anchor)
        local row = CreateFrame("Frame", nil, bottomFrame)
        row:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -5)
        row:SetPoint("TOPRIGHT", bottomFrame, "TOPRIGHT", 0, 0)
        row:SetHeight(20)
        return row
    end
    
    local rowLowUnit = CreatePlaceholderRow(title)
    local rowLowStack = CreatePlaceholderRow(rowLowUnit)
    
    local countText = bottomFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countText:SetPoint("TOPLEFT", rowLowStack, "BOTTOMLEFT", 0, -5)
    countText:SetText("")
    countText:SetTextColor(0.6, 0.6, 0.6)
    bottomFrame.countText = countText

    local inventoryBtn = CreateFrame("Button", nil, favoriteContentFrame, "UIPanelButtonTemplate")
    inventoryBtn:SetHeight(22)
    inventoryBtn:SetText(L("UI_INVENTORY"))
    inventoryBtn:SetPoint("TOPLEFT", favoriteContentFrame, "TOPLEFT", 3, 1)
    inventoryBtn:SetScript("OnClick", function()
        FavoritePanel:HideImportExportDialog()
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
    inventoryBtn:SetScript("OnLeave", function() if GameTooltip then GameTooltip:Hide() end end)
    favoriteContentFrame.inventoryBtn = inventoryBtn

    local browseBtn = CreateFrame("Button", nil, favoriteContentFrame, "UIPanelButtonTemplate")
    browseBtn:SetHeight(22)
    browseBtn:SetText("GFA")
    browseBtn:SetScript("OnClick", function()
        FavoritePanel:HideImportExportDialog()
        local MainFrame = GF_Auction:GetModule("MainFrame")
        if MainFrame then MainFrame:ShowPanel("PricePanel") end
        if _G.AuctionFrameTab1 then 
            if _G.AuctionFrameTab_OnClick then
                 _G.AuctionFrameTab_OnClick(_G.AuctionFrameTab1)
            elseif _G.AuctionFrameTab1.Click then
                 _G.AuctionFrameTab1:Click()
            end
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
    favoriteContentFrame.browseBtn = browseBtn

    local listBtn = CreateFrame("Button", nil, favoriteContentFrame, "UIPanelButtonTemplate")
    listBtn:SetHeight(22)
    listBtn:SetText(L("UI_LIST"))
    listBtn:SetPoint("TOPRIGHT", favoriteContentFrame, "TOPRIGHT", -22, 1)
    listBtn:SetScript("OnClick", function()
        FavoritePanel:HideImportExportDialog()
        local MainFrame = GF_Auction:GetModule("MainFrame")
        if MainFrame then MainFrame:ShowPanel("PricePanel") end
        if _G.AuctionFrameTab3 then 
            if _G.AuctionFrameTab_OnClick then
                 _G.AuctionFrameTab_OnClick(_G.AuctionFrameTab3)
            elseif _G.AuctionFrameTab3.Click then
                 _G.AuctionFrameTab3:Click()
            end
        end
    end)
    listBtn:SetScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L("UI_LIST"), 1, 1, 1)
            GameTooltip:AddLine(L("UI_LIST_TOOLTIP"), nil, nil, nil, true)
            GameTooltip:Show()
        end
    end)
    listBtn:SetScript("OnLeave", function(self)
        if GameTooltip then GameTooltip:Hide() end
    end)
    favoriteContentFrame.listBtn = listBtn
    
    local function UpdateButtonLayout()
        local w = favoriteContentFrame:GetWidth()
        if not w or w < 100 then return end
        local gap = 6
        local marginLeft = 3
        local marginRight = 22
        local btnW = (w - marginLeft - marginRight - (2 * gap)) / 3
        if btnW < 10 then btnW = 10 end
        if inventoryBtn then inventoryBtn:SetWidth(btnW) end
        if browseBtn then browseBtn:SetWidth(btnW) end
        if listBtn then listBtn:SetWidth(btnW) end
        if browseBtn and inventoryBtn then browseBtn:SetPoint("LEFT", inventoryBtn, "RIGHT", gap, 0) end
        if listBtn and browseBtn then listBtn:SetPoint("LEFT", browseBtn, "RIGHT", gap, 0) end
    end
    favoriteContentFrame:SetScript("OnSizeChanged", UpdateButtonLayout)
    if C_Timer and C_Timer.After then C_Timer.After(0.01, UpdateButtonLayout) end

    scrollFrame = CreateFrame("ScrollFrame", nil, favoriteContentFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 4, -28)
    local rightPad = -30
    if _G.NDui then
        rightPad = -23
    end
    scrollFrame:SetPoint("BOTTOMRIGHT", rightPad, 36)
    favoriteContentFrame.scrollFrame = scrollFrame
    
    content = CreateFrame("Frame", nil, scrollFrame)
    content:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
    content:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 0, 0)
    content:SetHeight(400)
    scrollFrame:SetScrollChild(content)
    SetupSmoothScroll(scrollFrame)
    
    local emptyText = favoriteContentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    emptyText:SetPoint("CENTER", 0, 0)
    emptyText:SetText(L("UI_FAV_EMPTY"))
    emptyText:SetTextColor(0.5, 0.5, 0.5)
    emptyText:Hide()
    favoriteContentFrame.emptyText = emptyText
    
    local importExportBtn = CreateFrame("Button", nil, bottomFrame)
    importExportBtn:SetSize(16, 16)
    local btnX, btnY = -6, 3
    if _G.NDui then
        btnX, btnY = 0, 3
    end
    importExportBtn:SetPoint("BOTTOMRIGHT", bottomFrame, "BOTTOMRIGHT", btnX, btnY)
    importExportBtn.icon = importExportBtn:CreateTexture(nil, "OVERLAY")
    importExportBtn.icon:SetAllPoints()
    importExportBtn.icon:SetTexture("Interface\\AddOns\\GF_Auction\\Media\\importexport.tga")
    importExportBtn:SetScript("OnEnter", function(self)
        if GameTooltip then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L("UI_FAV_IMPORT_EXPORT"), 1, 1, 1)
            GameTooltip:AddLine(L("UI_FAV_IMPORT_EXPORT_TOOLTIP"), nil, nil, nil, true)
            GameTooltip:Show()
        end
    end)
    importExportBtn:SetScript("OnLeave", function()
        if GameTooltip then GameTooltip:Hide() end
    end)
    importExportBtn:SetScript("OnClick", function()
        FavoritePanel:ToggleImportExportDialog()
    end)
    favoriteContentFrame.importExportBtn = importExportBtn
    
    local hintText = favoriteContentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    local hFontName, hFontHeight, hFontFlags = hintText:GetFont()
    hintText:SetFont(hFontName, hFontHeight, hFontFlags)
    hintText:SetPoint("BOTTOMLEFT", bottomFrame, "BOTTOMLEFT", 0, 0)
    hintText:SetPoint("RIGHT", importExportBtn, "LEFT", -5, 0)
    hintText:SetHeight(22)
    hintText:SetJustifyH("LEFT")
    hintText:SetJustifyV("MIDDLE")
    hintText:SetText(L("UI_FAV_COPY_HINT"))
    hintText:SetTextColor(1, 0.82, 0)
    favoriteContentFrame.hintText = hintText
    
    local Skin = GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyFavoritePanel then
        C_Timer.After(0.1, function()
            if Skin and Skin.ApplyFavoritePanel then
                Skin:ApplyFavoritePanel(favoriteContentFrame)
            end
        end)
    end
    
    favoriteContentFrame:SetScript("OnShow", function()
        FavoritePanel:RequestUpdateList()
    end)
    
    favoriteContentFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    favoriteContentFrame:SetScript("OnEvent", function(self, event)
        if event == "GET_ITEM_INFO_RECEIVED" and self:IsVisible() then
             FavoritePanel:RequestUpdateList()
        end
    end)
    
    return favoriteContentFrame
end

function FavoritePanel:Show()
    if not favoriteContentFrame then
        local MainFrame = GF_Auction:GetModule("MainFrame")
        if MainFrame then
            local parent = MainFrame:GetFrame()
            self:Create(parent)
        end
    end
    if favoriteContentFrame then
        favoriteContentFrame:Show()
        self:RequestUpdateList()
        
        local Skin = GF_Auction:GetModule("Skin")
        if Skin and Skin.ApplyFavoritePanel then
            Skin:ApplyFavoritePanel(favoriteContentFrame)
            if _G.NDui and _G.C_Timer and _G.C_Timer.After then
                _G.C_Timer.After(0.1, function()
                    if favoriteContentFrame and favoriteContentFrame:IsShown() and Skin and Skin.ApplyFavoritePanel then
                        Skin:ApplyFavoritePanel(favoriteContentFrame)
                    end
                end)
            end
        end
    end
end

function FavoritePanel:Hide()
    if favoriteContentFrame then
        favoriteContentFrame:Hide()
    end
    FavoritePanel:HideImportExportDialog()
end

function FavoritePanel:UpdateList()
    if not content then return end

    local w = content:GetWidth() or 0
    if (not w or w <= 1) and scrollFrame and scrollFrame.GetWidth then
        w = scrollFrame:GetWidth() or 0
        if w and w > 1 and content.SetWidth then
            content:SetWidth(w)
        end
    end
    if not w or w <= 1 then
        if C_Timer and C_Timer.After and favoriteContentFrame and favoriteContentFrame:IsShown() then
            C_Timer.After(0, function()
                if FavoritePanel and FavoritePanel.RequestUpdateList and favoriteContentFrame and favoriteContentFrame:IsShown() then
                    FavoritePanel:RequestUpdateList()
                end
            end)
        end
        return
    end
    
    local Database = GF_Auction:GetModule("Database")
    if not Database then return end
    
    local favorites = Database:GetFavorites()
    local list = {}
    for itemID, info in pairs(favorites) do
        table.insert(list, { 
            id = itemID, 
            link = info.itemLink,
            addedTime = info.addedTime or 0
        })
    end
    
    table.sort(list, function(a, b) 
        if a.addedTime ~= b.addedTime then
            return a.addedTime < b.addedTime
        end
        return a.id < b.id
    end)
    
    if #list == 0 then
        if favoriteContentFrame.emptyText then favoriteContentFrame.emptyText:Show() end
        content:Hide()
        return
    else
        if favoriteContentFrame.emptyText then favoriteContentFrame.emptyText:Hide() end
        content:Show()
    end
    
    
    for i, item in ipairs(list) do
        local row = rows[i]
        if not row then
            row = CreateFrame("Button", nil, content)
            row:SetSize(w, ROW_HEIGHT)
            row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
            
            -- Background
            row.bg = row:CreateTexture(nil, "BACKGROUND")
            row.bg:SetAllPoints()
            row.bg:SetColorTexture(1, 1, 1, 0.05)
            
            -- Icon
            row.icon = row:CreateTexture(nil, "ARTWORK")
            row.icon:SetSize(36, 36)
            row.icon:SetPoint("LEFT", 1, 0)
            row.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
            row.iconBorder = row:CreateTexture(nil, "BACKGROUND")
            row.iconBorder:SetSize(38, 38)
            row.iconBorder:SetPoint("CENTER", row.icon, "CENTER", 0, 0)
            row.iconBorder:SetColorTexture(0, 0, 0, 0)
            
            -- Name
            row.name = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            local nFontName, nFontHeight, nFontFlags = row.name:GetFont()
            row.name:SetFont(nFontName, nFontHeight * 0.95, nFontFlags)
            row.name:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 10, 0)
            row.name:SetJustifyH("LEFT")
            row.nameBtn = CreateFrame("Button", nil, row)
            row.nameBtn:SetPoint("TOPLEFT", row.name, "TOPLEFT", 0, 0)
            row.nameBtn:SetPoint("BOTTOMRIGHT", row.name, "BOTTOMRIGHT", 0, 0)
            row.nameBtn:SetFrameLevel(row:GetFrameLevel() + 5)
            row.nameBtn:EnableMouse(true)
            row.nameBtn:SetScript("OnClick", function(btn, button)
                if button == "LeftButton" then
                    local parentRow = btn:GetParent()
                    if parentRow and parentRow._ShowCopyUI then
                        parentRow:_ShowCopyUI()
                    end
                end
            end)

            -- Copy button
            row.copyBtn = CreateFrame("Button", nil, row)
            row.copyBtn:SetSize(16, 16)
            row.copyBtn:SetPoint("TOPRIGHT", row, "TOPRIGHT", -6, -4)
            row.copyBtn:SetFrameLevel(row:GetFrameLevel() + 10)
            row.copyBtn.icon = row.copyBtn:CreateTexture(nil, "OVERLAY")
            row.copyBtn.icon:SetSize(12, 12)
            row.copyBtn.icon:SetPoint("CENTER", 0, 0)
            row.copyBtn.icon:SetTexture("Interface\\Buttons\\UI-GuildButton-PublicNote-Up")
            row.copyBtn.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
            row.copyBtn.icon:SetVertexColor(0.85, 0.85, 0.85)
            row.copyBtn:SetScript("OnEnter", function(btn)
                if btn.icon then btn.icon:SetVertexColor(1, 1, 1) end
                GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("UI_COPY_NAME"), 1, 1, 1)
                GameTooltip:Show()
            end)
            row.copyBtn:SetScript("OnLeave", function(btn)
                if btn.icon then btn.icon:SetVertexColor(0.85, 0.85, 0.85) end
                GameTooltip:Hide()
            end)

            -- Inline copy editbox
            row.copyBox = CreateFrame("EditBox", nil, row, "InputBoxTemplate")
            row.copyBox:SetAutoFocus(false)
            row.copyBox:SetHeight(22)
            row.copyBox:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 6, 2)
            row.copyBox:SetPoint("RIGHT", row.copyBtn, "LEFT", -6, 0)
            row.copyBox:SetFrameLevel(row:GetFrameLevel() + 10)
            row.copyBox:Hide()

            local function HideCopyUI(ownerRow)
                if not ownerRow then return end
                if ownerRow.copyBox then
                    ownerRow.copyBox:Hide()
                    if ownerRow.copyBox.ClearFocus then ownerRow.copyBox:ClearFocus() end
                end
                if ownerRow.name then ownerRow.name:Show() end
                if ownerRow.price then ownerRow.price:Show() end
                if ownerRow.timeText and ownerRow.timeText.GetText and ownerRow.timeText:GetText() ~= "" then
                    ownerRow.timeText:Show()
                end
            end

            row._HideCopyUI = HideCopyUI

            row.copyBox:SetScript("OnEscapePressed", function(selfBox)
                local ownerRow = selfBox.ownerRow
                selfBox:ClearFocus()
                HideCopyUI(ownerRow)
            end)
            row.copyBox:SetScript("OnEnterPressed", function(selfBox)
                local ownerRow = selfBox.ownerRow
                selfBox:ClearFocus()
                HideCopyUI(ownerRow)
            end)
            row.copyBox:SetScript("OnEditFocusLost", function(selfBox)
                HideCopyUI(selfBox.ownerRow)
            end)
            row.copyBox.ownerRow = row

            local function ShowCopyUI(targetRow)
                if not targetRow then return end

                local itemName = (targetRow.itemLink and GetItemInfo and GetItemInfo(targetRow.itemLink)) or (targetRow.itemID and GetItemInfo and GetItemInfo(targetRow.itemID))
                if not itemName or itemName == "" then
                    itemName = targetRow.name and targetRow.name.GetText and targetRow.name:GetText() or ""
                end

                local copyText = tostring(itemName or "")
                if copyText ~= "" then
                    local first = string.sub(copyText, 1, 1)
                    local last = string.sub(copyText, -1)
                    if not (first == "\"" and last == "\"") then
                        copyText = "\"" .. copyText .. "\""
                    end
                end

                if targetRow.name then targetRow.name:Hide() end
                if targetRow.price then targetRow.price:Hide() end
                if targetRow.timeText then targetRow.timeText:Hide() end
                if targetRow.copyBox then
                    targetRow.copyBox:Show()
                    targetRow.copyBox:SetText(copyText)
                    targetRow.copyBox:SetFocus()
                    if targetRow.copyBox.HighlightText then
                        targetRow.copyBox:HighlightText(0, -1)
                    end
                end
            end

            row._ShowCopyUI = ShowCopyUI

            row.copyBtn:SetScript("OnClick", function(btn)
                local ownerRow = btn:GetParent()
                if not ownerRow then return end

                pcall(function()
                    if not _G.AuctionFrame or not _G.AuctionFrame.IsShown or not _G.AuctionFrame:IsShown() then
                        return
                    end
                    local tab = _G.AuctionFrameTab1
                    if tab and _G.AuctionFrameTab_OnClick then
                        _G.AuctionFrameTab_OnClick(tab)
                    elseif tab and tab.Click then
                        tab:Click()
                    end
                end)

                if ownerRow.copyBox and ownerRow.copyBox.IsShown and ownerRow.copyBox:IsShown() then
                    if ownerRow._HideCopyUI then ownerRow:_HideCopyUI() end
                else
                    if ownerRow._ShowCopyUI then ownerRow:_ShowCopyUI() end
                end
            end)
            
            -- Price
            row.price = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            local fontName, fontHeight, fontFlags = row.price:GetFont()
            row.price:SetFont(fontName, fontHeight * 0.80, fontFlags)
            row.price:SetPoint("BOTTOMLEFT", row.icon, "BOTTOMRIGHT", 10, 0)
            row.price:SetJustifyH("LEFT")
            row.price:SetTextColor(0.8, 0.8, 0.8)

            -- Update time
            row.timeText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            local tFontName, tFontHeight, tFontFlags = row.timeText:GetFont()
            row.timeText:SetFont(tFontName, tFontHeight * 0.80, tFontFlags)
            row.timeText:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -6, 5)
            row.timeText:SetJustifyH("RIGHT")
            row.timeText:SetTextColor(0.55, 0.55, 0.55)
            row.timeText:SetText("")
            
            row:SetScript("OnClick", function(btn, button)
                if button == "RightButton" then
                    Database:RemoveFavorite(btn.itemID)
                elseif button == "LeftButton" then
                    if btn._ShowCopyUI then
                        btn:_ShowCopyUI()
                    end
                end
            end)
            
            -- Tooltip
            row:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                if self.itemID then GameTooltip:SetHyperlink("item:"..self.itemID) end
                GameTooltip:AddLine(" ")

                GameTooltip:AddLine("|cffffd700"..L("UI_LEFT_CLICK").."|r |cffffffff"..L("UI_COPY_NAME").."|r")
                GameTooltip:AddLine("|cffff6060"..L("UI_RIGHT_CLICK").."|r |cffff6060"..L("UI_FAV_REMOVE").."|r")
                GameTooltip:Show()
            end)
            row:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
            
            row:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            rows[i] = row
        end

        -- Keep row width in sync (first frame can start at 0 and resolve shortly after)
        if row.SetWidth then
            row:SetWidth(w)
        end
        
        row:Show()
        row.itemID = item.id
        row.itemLink = item.link
        
        -- Zebra striping
        if i % 2 == 0 then row.bg:Show() else row.bg:Hide() end
        
        local name, link, quality, _, _, _, _, _, _, texture = GetItemInfo(item.id)
        if not name and item.link then
             name, link, quality, _, _, _, _, _, _, texture = GetItemInfo(item.link)
        end
        
        if name then
            row.name:SetText(name)
            local r, g, b = GetItemQualityColor(quality or 1)
            row.name:SetTextColor(r, g, b)
            row.icon:SetTexture(texture)
            row.iconBorder:SetColorTexture(r, g, b, 1)
        else
            row.name:SetText("Loading... ("..item.id..")")
            row.name:SetTextColor(0.5, 0.5, 0.5)
            row.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
            row.iconBorder:SetColorTexture(0, 0, 0, 0)
        end
        
        local stats = Database:GetPriceStats(item.id)
        if stats and stats.minUnit then
            local priceStr = GetCoinTextureString(stats.minUnit)
            if Utils and Utils.TimeAgo and stats.time then
                local tInfo = Utils:TimeAgo(stats.time, L)
                if tInfo and tInfo.text and tInfo.text ~= "" then
                    if row.timeText then
                        row.timeText:SetText("(" .. tInfo.text .. ")")
                        if Utils.TimeColor then
                            local r, g, b = Utils:TimeColor(tInfo.ageSec)
                            row.timeText:SetTextColor(r, g, b)
                        else
                            row.timeText:SetTextColor(0.55, 0.55, 0.55)
                        end
                        row.timeText:Show()
                    end
                else
                    if row.timeText then row.timeText:SetText(""); row.timeText:Hide() end
                end
            else
                if row.timeText then row.timeText:SetText(""); row.timeText:Hide() end
            end
            row.price:SetText(priceStr)
        else
            row.price:SetText(L("UI_NO_HISTORY"))
            if row.timeText then row.timeText:SetText(""); row.timeText:Hide() end
        end
        
        row:SetPoint("LEFT", 0, 0)
        row:SetPoint("RIGHT", 0, 0)
        if i == 1 then
            row:SetPoint("TOP", 0, -5)
        else
            row:SetPoint("TOP", rows[i-1], "BOTTOM", 0, -2)
        end
    end

    for i = #list + 1, #rows do
        if rows[i] then rows[i]:Hide() end
    end
    
    content:SetHeight(#list * (ROW_HEIGHT + 2) + 10)

    local Skin = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Skin")
    if Skin and Skin.ApplyFavoritePanel and favoriteContentFrame and favoriteContentFrame:IsShown() then
        Skin:ApplyFavoritePanel(favoriteContentFrame)
    end
end

local importExportDialog = nil
local invWasShownBeforeIE = false
local suppressNextRestore = false

local function HideInventoryForImportExport()
    local InventoryPanel = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("InventoryPanel")
    if not InventoryPanel then return end

    local isShown = (InventoryPanel.IsShown and InventoryPanel:IsShown()) or false
    if not isShown then
        invWasShownBeforeIE = false
        return
    end

    invWasShownBeforeIE = true
    if InventoryPanel.Hide then
        InventoryPanel:Hide()
    else
        local f = InventoryPanel.GetFrame and InventoryPanel:GetFrame()
        if f and f.Hide then f:Hide() end
    end
end

local function RestoreInventoryAfterImportExport()
    if suppressNextRestore then
        suppressNextRestore = false
        invWasShownBeforeIE = false
        return
    end

    if not invWasShownBeforeIE then return end
    invWasShownBeforeIE = false

    local InventoryPanel = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("InventoryPanel")
    if not InventoryPanel then return end
    if InventoryPanel.Show then
        InventoryPanel:Show()
    else
        local f = InventoryPanel.GetFrame and InventoryPanel:GetFrame()
        if f and f.Show then f:Show() end
    end
end

function FavoritePanel:HideImportExportDialog(suppressRestore)
    if importExportDialog and importExportDialog:IsShown() then
        if suppressRestore then
            suppressNextRestore = true
        end
        importExportDialog:Hide()
        return
    end
end

function FavoritePanel:ToggleImportExportDialog()
    if importExportDialog and importExportDialog:IsShown() then
        importExportDialog:Hide()
        return
    end
    
    FavoritePanel:ShowImportExportDialog()
end

function FavoritePanel:ShowImportExportDialog()
    suppressNextRestore = false

    if not importExportDialog then
        local template = "BackdropTemplate"
        local useTemplate = _G[template] or BackdropTemplateMixin
        if not useTemplate then
            template = nil
        end
        
        importExportDialog = CreateFrame("Frame", nil, UIParent, template)
        local MainFrame = GF_Auction:GetModule("MainFrame")
        local mainFrame = MainFrame and MainFrame:GetFrame()
        local dialogHeight = (mainFrame and mainFrame:GetHeight()) or 400
        importExportDialog:SetSize(190, dialogHeight)
        importExportDialog:SetFrameStrata("MEDIUM")
        if mainFrame and mainFrame.GetFrameLevel and importExportDialog.SetFrameLevel then
            importExportDialog:SetFrameLevel((mainFrame:GetFrameLevel() or 1) + 20)
        end
        importExportDialog:SetClampedToScreen(true)
        importExportDialog:EnableMouse(true)
        importExportDialog:SetMovable(true)
        importExportDialog:RegisterForDrag("LeftButton")
        importExportDialog:Hide()
        
        importExportDialog:SetScript("OnHide", function()
            RestoreInventoryAfterImportExport()
        end)
        
        if importExportDialog.SetBackdrop then
            importExportDialog:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 32,
                insets = { left = 11, right = 12, top = 12, bottom = 11 }
            })
            importExportDialog:SetBackdropColor(0, 0, 0, 0.92)
            importExportDialog:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        elseif BackdropTemplateMixin then
            if _G.Mixin then
                _G.Mixin(importExportDialog, BackdropTemplateMixin)
            end
            importExportDialog:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 32,
                insets = { left = 11, right = 12, top = 12, bottom = 11 }
            })
            importExportDialog:SetBackdropColor(0, 0, 0, 0.92)
            importExportDialog:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        end
        
        importExportDialog:SetScript("OnDragStart", function(self)
            self:StartMoving()
        end)
        
        importExportDialog:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)
        
        local titleBar = CreateFrame("Frame", nil, importExportDialog)
        titleBar:SetPoint("TOPLEFT", 10, -10)
        titleBar:SetPoint("TOPRIGHT", -30, -10)
        titleBar:SetHeight(24)
        titleBar:EnableMouse(true)
        titleBar:RegisterForDrag("LeftButton")
        titleBar:SetScript("OnDragStart", function()
            importExportDialog:StartMoving()
        end)
        titleBar:SetScript("OnDragStop", function()
            importExportDialog:StopMovingOrSizing()
        end)
        
        local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        titleText:SetPoint("LEFT", 0, 0)
        titleText:SetText(L("UI_FAV_IMPORT_EXPORT_TITLE"))
        titleText:SetTextColor(1.0, 0.82, 0.0)
        
        local closeBtn = CreateFrame("Button", nil, importExportDialog, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", -5, -5)
        closeBtn:SetScript("OnClick", function()
            importExportDialog:Hide()
        end)
        
        local importBtn = CreateFrame("Button", nil, importExportDialog, "UIPanelButtonTemplate")
        importBtn:SetHeight(22)
        importBtn:SetPoint("TOPLEFT", importExportDialog, "TOPLEFT", 8, -27)
        importBtn:SetText(L("UI_FAV_IMPORT_BTN"))
        importBtn:SetScript("OnClick", function()
            FavoritePanel:StartImportFlow()
        end)
        importBtn:SetScript("OnEnter", function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("UI_FAV_IMPORT_BTN"), 1, 1, 1)
                GameTooltip:AddLine(L("UI_FAV_IMPORT_TOOLTIP"), nil, nil, nil, true)
                GameTooltip:Show()
            end
        end)
        importBtn:SetScript("OnLeave", function()
            if GameTooltip then GameTooltip:Hide() end
        end)
        importExportDialog.importBtn = importBtn
        
        local exportBtn = CreateFrame("Button", nil, importExportDialog, "UIPanelButtonTemplate")
        exportBtn:SetHeight(22)
        exportBtn:SetPoint("TOPRIGHT", importExportDialog, "TOPRIGHT", -8, -27)
        exportBtn:SetText(L("UI_FAV_EXPORT_BTN"))
        exportBtn:SetScript("OnClick", function()
            FavoritePanel:ExportFavorites()
        end)
        exportBtn:SetScript("OnEnter", function(self)
            if GameTooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L("UI_FAV_EXPORT_BTN"), 1, 1, 1)
                GameTooltip:AddLine(L("UI_FAV_EXPORT_TOOLTIP"), nil, nil, nil, true)
                GameTooltip:Show()
            end
        end)
        exportBtn:SetScript("OnLeave", function()
            if GameTooltip then GameTooltip:Hide() end
        end)
        importExportDialog.exportBtn = exportBtn

        local ioBox = CreateFrame("Frame", nil, importExportDialog, template)
        ioBox:SetPoint("TOPLEFT", importBtn, "BOTTOMLEFT", 0, -10)
        ioBox:SetPoint("TOPRIGHT", exportBtn, "BOTTOMRIGHT", 0, -10)
        ioBox:SetPoint("BOTTOM", importExportDialog, "BOTTOM", 0, 12)
        if ioBox.SetBackdrop then
            ioBox:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 }
            })
            ioBox:SetBackdropColor(0, 0, 0, 0.35)
            ioBox:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        elseif BackdropTemplateMixin then
            if _G.Mixin then
                _G.Mixin(ioBox, BackdropTemplateMixin)
            end
            ioBox:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 }
            })
            ioBox:SetBackdropColor(0, 0, 0, 0.35)
            ioBox:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        end
        importExportDialog.ioBox = ioBox

        local ioClip = CreateFrame("Frame", nil, ioBox)
        ioClip:SetPoint("TOPLEFT", ioBox, "TOPLEFT", 1, 0)
        ioClip:SetPoint("BOTTOMRIGHT", ioBox, "BOTTOMRIGHT", 0, 0)
        if ioClip.SetClipsChildren then
            ioClip:SetClipsChildren(true)
        end
        importExportDialog.ioClip = ioClip

        local ioEditBox = CreateFrame("EditBox", nil, ioClip)
        ioEditBox:SetAutoFocus(false)
        ioEditBox:SetMultiLine(true)
        ioEditBox:SetFontObject("GameFontHighlightSmall")
        ioEditBox:SetTextInsets(6, 6, 6, 6)
        ioEditBox:EnableMouse(true)
        ioEditBox:SetPoint("TOPLEFT", ioClip, "TOPLEFT", 0, 0)
        ioEditBox:SetPoint("BOTTOMRIGHT", ioClip, "BOTTOMRIGHT", 0, 0)
        ioEditBox:SetScript("OnMouseDown", function(self)
            if self.SetFocus then self:SetFocus() end
        end)
        ioEditBox:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
        end)
        ioEditBox:SetScript("OnTextChanged", function(self, userInput)
            if not importExportDialog then return end
            if not importExportDialog._importPending then return end
            if userInput == false then return end
            if importExportDialog._ignoreProgrammatic then return end

            local txt = self.GetText and self:GetText() or ""
            if not txt or txt == "" then return end

            importExportDialog._importPendingToken = (importExportDialog._importPendingToken or 0) + 1
            local token = importExportDialog._importPendingToken
            if C_Timer and C_Timer.After then
                C_Timer.After(0.12, function()
                    if not importExportDialog or not importExportDialog:IsShown() then return end
                    if not importExportDialog._importPending then return end
                    if importExportDialog._importPendingToken ~= token then return end
                    local t = importExportDialog.editBox and importExportDialog.editBox.GetText and importExportDialog.editBox:GetText() or ""
                    if not t or t == "" then return end
                    importExportDialog._importPending = false
                    FavoritePanel:PromptImportFavorites()
                end)
            else
                importExportDialog._importPending = false
                FavoritePanel:PromptImportFavorites()
            end
        end)
        importExportDialog.editBox = ioEditBox
        
        local function UpdateDialogButtonLayout()
            local w = importExportDialog:GetWidth()
            if not w or w < 100 then return end
            local gap = 6
            local margin = 12
            local topOffset = -41
            local btnW = (w - margin * 2 - gap) / 2
            if btnW < 10 then btnW = 10 end
            if importBtn then
                importBtn:SetWidth(btnW)
                importBtn:ClearAllPoints()
                importBtn:SetPoint("TOPLEFT", importExportDialog, "TOPLEFT", margin, topOffset)
            end
            if exportBtn then
                exportBtn:SetWidth(btnW)
                exportBtn:ClearAllPoints()
                exportBtn:SetPoint("TOPRIGHT", importExportDialog, "TOPRIGHT", -margin, topOffset)
            end
        end
        importExportDialog:SetScript("OnSizeChanged", UpdateDialogButtonLayout)
        if C_Timer and C_Timer.After then C_Timer.After(0.01, UpdateDialogButtonLayout) end
        
        
        importExportDialog.closeBtn = closeBtn
        
        local Skin = GF_Auction:GetModule("Skin")
        if Skin and Skin.ApplyImportExportDialog then
            Skin:ApplyImportExportDialog(importExportDialog)
        end
    end
    
    local MainFrame = GF_Auction:GetModule("MainFrame")
    local mainFrame = MainFrame and MainFrame:GetFrame()
    if mainFrame and mainFrame:IsVisible() then
        local dialogHeight = mainFrame:GetHeight()
        importExportDialog:SetHeight(dialogHeight)
        importExportDialog:ClearAllPoints()
        importExportDialog:SetPoint("BOTTOMLEFT", mainFrame, "BOTTOMRIGHT", 5, 0)
    else
        importExportDialog:ClearAllPoints()
        importExportDialog:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    end
    
    HideInventoryForImportExport()
    importExportDialog:Show()
end

function FavoritePanel:ExportFavorites()
    local Database = GF_Auction:GetModule("Database")
    if not Database then return end

    if importExportDialog then
        importExportDialog._importPending = false
        importExportDialog._importPendingToken = nil
    end

    local favorites = Database:GetFavorites()
    if not favorites or next(favorites) == nil then
        if GF_Auction and GF_Auction.Print then
            GF_Auction.Print(L("UI_FAV_EMPTY"))
        end
        if importExportDialog and importExportDialog.editBox then
            importExportDialog.editBox:SetText("")
        end
        return
    end

    local list = {}
    for itemID, info in pairs(favorites) do
        table.insert(list, {
            id = itemID,
            addedTime = (type(info) == "table" and info.addedTime) or 0
        })
    end

    table.sort(list, function(a, b)
        if a.addedTime ~= b.addedTime then
            return a.addedTime < b.addedTime
        end
        return a.id < b.id
    end)

    local itemIDs = {}
    for _, v in ipairs(list) do
        local id = tonumber(v.id) or v.id
        if id then
            table.insert(itemIDs, tostring(id))
        end
    end

    local exportText = table.concat(itemIDs, ",")

    if importExportDialog and importExportDialog.editBox then
        local eb = importExportDialog.editBox
        eb:SetText(exportText)
        eb:SetFocus()
        if eb.HighlightText then
            eb:HighlightText(0, -1)
        end
    end

    if _G.C_ChatInfo and _G.C_ChatInfo.CopyChatLine then
        _G.C_ChatInfo:CopyChatLine(exportText)
    end
end

local function ParseFavoriteImportText(text)
    if not text or text == "" then
        return {}
    end

    local ids = {}
    local seen = {}

    for idStr in tostring(text):gmatch("|Hitem:(%d+):") do
        local id = tonumber(idStr)
        if id and id > 0 and not seen[id] then
            seen[id] = true
            table.insert(ids, id)
        end
    end

    if #ids == 0 then
        for token in tostring(text):gmatch("[^,%s]+") do
            if token:match("^%d+$") then
                local id = tonumber(token)
                if id and id > 0 and not seen[id] then
                    seen[id] = true
                    table.insert(ids, id)
                end
            end
        end
    end

    return ids
end

function FavoritePanel:PromptImportFavorites()
    local eb = importExportDialog and importExportDialog.editBox
    local text = eb and eb.GetText and eb:GetText() or ""
    if not text or text == "" then
        if GF_Auction and GF_Auction.Print then
            GF_Auction.Print(L("UI_FAV_IMPORT_EMPTY"))
        end
        if eb and eb.SetFocus then
            eb:SetFocus()
        end
        return
    end

    local popupKey = "GFA_IMPORT_FAVORITES_MODE"
    if not _G.StaticPopupDialogs then
        return
    end

    if not _G.StaticPopupDialogs[popupKey] then
        _G.StaticPopupDialogs[popupKey] = {
            text = L("UI_FAV_IMPORT_CHOOSE_MODE"),
            button1 = L("UI_FAV_IMPORT_OVERWRITE"),
            button2 = L("UI_FAV_IMPORT_APPEND"),
            showAlert = false,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function(self, data)
                if FavoritePanel and FavoritePanel.ImportFavoritesFromBox then
                    FavoritePanel:ImportFavoritesFromBox("overwrite")
                end
            end,
            OnCancel = function(self, data, reason)
                if reason == "clicked" then
                    if FavoritePanel and FavoritePanel.ImportFavoritesFromBox then
                        FavoritePanel:ImportFavoritesFromBox("append")
                    end
                end
            end,
        }
    end

    if _G.StaticPopup_Show then
        _G.StaticPopup_Show(popupKey)

        for i = 1, 4 do
            local f = _G["StaticPopup" .. i]
            if f and f:IsShown() and f.which == popupKey then
                if importExportDialog and importExportDialog:IsShown() then
                    f:ClearAllPoints()
                    f:SetPoint("CENTER", importExportDialog, "CENTER", 0, 0)
                end

                if not f.__GFA_Draggable then
                    f:EnableMouse(true)
                    f:SetMovable(true)
                    f:RegisterForDrag("LeftButton")
                    f:SetScript("OnDragStart", function(selfFrame)
                        if selfFrame.IsMovable and selfFrame:IsMovable() then
                            selfFrame:StartMoving()
                        end
                    end)
                    f:SetScript("OnDragStop", function(selfFrame)
                        selfFrame:StopMovingOrSizing()
                    end)
                    f.__GFA_Draggable = true
                end

                if not f.__GFA_CloseBtn then
                    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
                    closeBtn:SetPoint("TOPRIGHT", -4, -4)
                    closeBtn:SetScript("OnClick", function()
                        if _G.StaticPopup_Hide then
                            _G.StaticPopup_Hide(popupKey)
                        else
                            f:Hide()
                        end
                    end)
                    local Skin = GF_Auction:GetModule("Skin")
                    if Skin and Skin.ApplyStaticPopupCloseButton then
                        Skin:ApplyStaticPopupCloseButton(closeBtn, f)
                    end
                    f.__GFA_CloseBtn = closeBtn
                end
                break
            end
        end
    end
end

function FavoritePanel:StartImportFlow()
    if not importExportDialog or not importExportDialog.editBox then
        return
    end

    importExportDialog._importPending = true
    importExportDialog._importPendingToken = 0

    local eb = importExportDialog.editBox
    importExportDialog._ignoreProgrammatic = true
    eb:SetText("")
    importExportDialog._ignoreProgrammatic = false
    if eb.SetFocus then
        eb:SetFocus()
    end
    if eb.HighlightText then
        eb:HighlightText(0, -1)
    end
end

function FavoritePanel:ImportFavoritesFromBox(mode)
    local Database = GF_Auction:GetModule("Database")
    if not Database then return end

    local eb = importExportDialog and importExportDialog.editBox
    local text = eb and eb.GetText and eb:GetText() or ""
    local ids = ParseFavoriteImportText(text)
    if #ids == 0 then
        if GF_Auction and GF_Auction.Print then
            GF_Auction.Print(L("UI_FAV_IMPORT_EMPTY"))
        end
        return
    end

    local favs = Database.GetFavorites and Database:GetFavorites()
    if not favs then return end

    local imported = 0
    local skipped = 0

    local maxAdded = 0
    for _, info in pairs(favs) do
        if type(info) == "table" then
            local t = tonumber(info.addedTime) or 0
            if t > maxAdded then maxAdded = t end
        end
    end

    if mode == "overwrite" then
        if Database and Database.ClearFavorites then
            Database:ClearFavorites()
        else
            for k in pairs(favs) do
                favs[k] = nil
            end
        end
        maxAdded = time()
    end

    local baseTime = math.max(time(), maxAdded)
    local offset = 0
    for _, id in ipairs(ids) do
        if not favs[id] then
            offset = offset + 1
            local link = select(2, GetItemInfo(id))
            favs[id] = {
                itemLink = link or ("item:" .. tostring(id)),
                addedTime = baseTime + offset
            }
            imported = imported + 1
            if GF_Auction and GF_Auction.NotifyFavoritesChanged then
                pcall(GF_Auction.NotifyFavoritesChanged, GF_Auction, id)
            end
        else
            skipped = skipped + 1
        end
    end
    if Database and Database.SyncFavoritesMirror then
        Database:SyncFavoritesMirror()
    end

    if FavoritePanel and FavoritePanel.RequestUpdateList then
        FavoritePanel:RequestUpdateList()
    elseif FavoritePanel and FavoritePanel.UpdateList then
        FavoritePanel:UpdateList()
    end

    if GF_Auction and GF_Auction.Print then
        GF_Auction.Print(string.format(L("UI_FAV_IMPORT_DONE"), imported, skipped))
    end

    if eb and eb.SetText then
        if importExportDialog then
            importExportDialog._ignoreProgrammatic = true
        end
        eb:SetText("")
        if importExportDialog then
            importExportDialog._ignoreProgrammatic = false
        end
        if eb.ClearFocus then
            eb:ClearFocus()
        end
    end
end
