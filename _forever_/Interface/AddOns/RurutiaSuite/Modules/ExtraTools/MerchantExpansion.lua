-- Forever merchant widening. One secure hook set, at most twenty item slots (4 x 5).
-- External list layouts keep the native window. Disabling restores size and anchors.

local _, ns = ...

local adapter = ns.ExtraToolsAdapter
-- Retain this service only on clients whose adapter exposes the capability.
-- Isolated service hosts may supply the adapter later; production TOCs load it first.
if adapter and not (adapter.features and adapter.features.merchantExpansion) then return end

local Widget = {}
ns.ExtraToolsMerchantExpansion = Widget

local COLUMNS = 4
local PAGE_SIZE = 20
local COLUMN_GAP = 12
local LEFT_PAD = 11
local RIGHT_PAD = 19
local ITEM_WIDTH_FALLBACK = 153
local ORIGIN_Y = -69
local ROW_GAP = 8
local SEARCH_WIDTH, SEARCH_HEIGHT = 190, 20
local SEARCH_RIGHT, SEARCH_Y, SEARCH_GAP = 20, -34, 8
local OVERVIEW_TEXT = "商品总览"

-- Search shows only matching goods by running the native update against a
-- remapped item list. Every index-based read used while it draws is mapped for
-- that single call and restored right after; button IDs are then pointed back
-- at the real merchant index, so tooltips, linking and buying stay native.
local MAPPED_GLOBALS = {
    "GetMerchantItemInfo", "GetMerchantItemLink", "GetMerchantItemCostInfo",
    "GetMerchantItemCostItem", "GetMerchantItemMaxStack", "GetMerchantItemID",
}
local MAPPED_API = { "GetItemInfo", "IsMerchantItemRefundable" }

local CAPTURE_NAMES = {
    "MerchantPageText", "MerchantPrevPageButton", "MerchantNextPageButton",
    "MerchantRepairAllButton", "MerchantRepairItemButton", "MerchantSellAllJunkButton",
    "MerchantGuildBankRepairButton", "MerchantBuyBackItem",
}

local function IsFrame(value)
    return type(value) == "table" or type(value) == "userdata"
end

local function CapturePoints(store, frame, key)
    if store[key] or not IsFrame(frame) or type(frame.GetPoint) ~= "function" then return end
    local points = {}
    local count = type(frame.GetNumPoints) == "function" and frame:GetNumPoints() or 0
    for index = 1, count do
        points[index] = { frame:GetPoint(index) }
    end
    store[key] = points
end

local function ApplyPoints(frame, points)
    if not IsFrame(frame) or type(points) ~= "table" or type(frame.SetPoint) ~= "function" then return end
    if type(frame.ClearAllPoints) == "function" then frame:ClearAllPoints() end
    for index = 1, #points do
        frame:SetPoint(unpack(points[index]))
    end
end

function Widget:LayoutOwned()
    local registry = ns.ExtraToolsProviderRegistry
    if type(registry) ~= "table" or type(registry.OwnsMerchantLayout) ~= "function" then
        return false
    end
    return registry:OwnsMerchantLayout() == true
end

function Widget:Wanted()
    local module = self.module
    if not (module and module.runtimeActive and module.adapter and module.adapter.features
        and module.adapter.features.merchantExpansion and _G.MerchantFrame) then
        return false
    end
    local db = type(module.GetBlizzardUIDB) == "function" and module:GetBlizzardUIDB() or nil
    return type(db) == "table" and db.merchantExpansion == true and not self:LayoutOwned()
end

function Widget:ItemWidth()
    local item = _G.MerchantItem1
    local width = IsFrame(item) and type(item.GetWidth) == "function" and tonumber(item:GetWidth()) or nil
    if not width or width < 40 then return ITEM_WIDTH_FALLBACK end
    return width
end

function Widget:ExpandedWidth()
    local itemWidth = self:ItemWidth()
    return LEFT_PAD + COLUMNS * itemWidth + (COLUMNS - 1) * COLUMN_GAP + RIGHT_PAD
end

function Widget:Capture()
    if self.captured or not _G.MerchantFrame then return end
    local frame = _G.MerchantFrame
    self.stockWidth = type(frame.GetWidth) == "function" and frame:GetWidth() or nil
    self.stockHeight = type(frame.GetHeight) == "function" and frame:GetHeight() or nil
    self.stockMerchant = tonumber(_G.MERCHANT_ITEMS_PER_PAGE) or 10
    self.stockBuyback = tonumber(_G.BUYBACK_ITEMS_PER_PAGE) or self.stockMerchant
    self.pageSize = math.max(PAGE_SIZE, self.stockMerchant, self.stockBuyback)
    self.rows = math.ceil(self.pageSize / COLUMNS)
    self.points = {}
    local names = { unpack(CAPTURE_NAMES) }
    for index = 1, PAGE_SIZE do
        names[#names + 1] = "MerchantItem" .. index
    end
    for index = 1, #names do
        CapturePoints(self.points, _G[names[index]], names[index])
    end
    self.captured = true
end

function Widget:EnsureSlots()
    local module = self.module
    local parent = _G.MerchantFrame
    if not module or not parent or type(module.CreateFrame) ~= "function" then return end
    self.created = self.created or {}
    for index = 1, PAGE_SIZE do
        local name = "MerchantItem" .. index
        if not _G[name] and not self.created[index] then
            self.created[index] = module:CreateFrame("Frame", name, parent, "MerchantItemTemplate", function(frame)
                if IsFrame(frame) and type(frame.Hide) == "function" then frame:Hide() end
            end, name)
        end
    end
end

function Widget:UseExpandedConstants()
    self:Capture()
    _G.MERCHANT_ITEMS_PER_PAGE = self.pageSize
    _G.BUYBACK_ITEMS_PER_PAGE = self.pageSize
end

function Widget:PlaceItems()
    local frame = _G.MerchantFrame
    local rows = self.rows or math.ceil(PAGE_SIZE / COLUMNS)
    for index = 1, COLUMNS * rows do
        local item = _G["MerchantItem" .. index]
        if IsFrame(item) and type(item.SetPoint) == "function" then
            if type(item.ClearAllPoints) == "function" then item:ClearAllPoints() end
            if index == 1 then
                item:SetPoint("TOPLEFT", frame, "TOPLEFT", LEFT_PAD, ORIGIN_Y)
            elseif (index - 1) % COLUMNS == 0 then
                local above = _G["MerchantItem" .. (index - COLUMNS)]
                item:SetPoint("TOPLEFT", above, "BOTTOMLEFT", 0, -ROW_GAP)
            else
                local previous = _G["MerchantItem" .. (index - 1)]
                item:SetPoint("TOPLEFT", previous, "TOPRIGHT", COLUMN_GAP, 0)
            end
        end
    end
end

function Widget:PlacePageControls(width)
    local frame = _G.MerchantFrame
    local page = _G.MerchantPageText
    if IsFrame(page) and type(page.SetPoint) == "function" then
        if type(page.ClearAllPoints) == "function" then page:ClearAllPoints() end
        page:SetPoint("BOTTOM", frame, "BOTTOMLEFT", width / 2, 86)
    end
    local prev = _G.MerchantPrevPageButton
    if IsFrame(prev) and type(prev.SetPoint) == "function" then
        if type(prev.ClearAllPoints) == "function" then prev:ClearAllPoints() end
        prev:SetPoint("CENTER", frame, "BOTTOMLEFT", 25, 96)
    end
    local nextButton = _G.MerchantNextPageButton
    if IsFrame(nextButton) and type(nextButton.SetPoint) == "function" then
        if type(nextButton.ClearAllPoints) == "function" then nextButton:ClearAllPoints() end
        nextButton:SetPoint("CENTER", frame, "BOTTOMLEFT", width - 26, 96)
    end
end

function Widget:PlaceRepair(width)
    local frame = _G.MerchantFrame
    local centerX = width / 2
    local buttonY = 34
    local function Shown(name)
        local button = _G[name]
        if not IsFrame(button) or type(button.SetPoint) ~= "function" then return nil end
        if type(button.IsShown) == "function" and not button:IsShown() then return nil end
        return button
    end
    local repairAll = Shown("MerchantRepairAllButton")
    if repairAll then
        repairAll:ClearAllPoints()
        repairAll:SetPoint("BOTTOM", frame, "BOTTOMLEFT", centerX + 10, buttonY)
    end
    local repairItem = Shown("MerchantRepairItemButton")
    if repairItem and repairAll then
        repairItem:ClearAllPoints()
        repairItem:SetPoint("RIGHT", repairAll, "LEFT", -4, 0)
    end
    local sellJunk = _G.MerchantSellAllJunkButton
    if IsFrame(sellJunk) and type(sellJunk.SetPoint) == "function" then
        sellJunk:ClearAllPoints()
        if repairAll then
            sellJunk:SetPoint("LEFT", repairAll, "RIGHT", 12, 0)
        else
            sellJunk:SetPoint("BOTTOM", frame, "BOTTOMLEFT", centerX, buttonY)
        end
    end
    local guild = Shown("MerchantGuildBankRepairButton")
    if guild and IsFrame(sellJunk) then
        guild:ClearAllPoints()
        guild:SetPoint("LEFT", sellJunk, "RIGHT", 4, 0)
    end
    local buyback = _G.MerchantBuyBackItem
    if IsFrame(buyback) and type(buyback.SetPoint) == "function" and frame.selectedTab ~= 2 then
        buyback:ClearAllPoints()
        buyback:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, 33)
    end
end

function Widget:ApplyGeometry()
    local frame = _G.MerchantFrame
    if not IsFrame(frame) then return end
    local width = self:ExpandedWidth()
    local height = self.stockHeight
    if type(frame.SetSize) == "function" and height then
        frame:SetSize(width, height)
    elseif type(frame.SetWidth) == "function" then
        frame:SetWidth(width)
    end
    self:PlaceItems()
    self:PlacePageControls(width)
    self:PlaceRepair(width)
end

function Widget:RestorePoints()
    if type(self.points) ~= "table" then return end
    for name, points in pairs(self.points) do
        ApplyPoints(_G[name], points)
    end
end

function Widget:HideSurplus()
    if type(self.created) ~= "table" then return end
    local keep = math.max(self.stockMerchant or PAGE_SIZE, self.stockBuyback or PAGE_SIZE)
    for index, frame in pairs(self.created) do
        if index > keep and IsFrame(frame) and type(frame.Hide) == "function" then frame:Hide() end
    end
end

function Widget:ItemName(index)
    local name
    if type(_G.GetMerchantItemInfo) == "function" then
        name = _G.GetMerchantItemInfo(index)
    elseif type(_G.C_MerchantFrame) == "table" and type(_G.C_MerchantFrame.GetItemInfo) == "function" then
        local info = _G.C_MerchantFrame.GetItemInfo(index)
        name = type(info) == "table" and info.name or nil
    end
    if type(name) == "string" and name ~= "" then return name end
    local link = type(_G.GetMerchantItemLink) == "function" and _G.GetMerchantItemLink(index) or nil
    return type(link) == "string" and link:match("%[(.-)%]") or nil
end

function Widget:BuildList(query)
    local count = type(_G.GetMerchantNumItems) == "function" and tonumber(_G.GetMerchantNumItems()) or 0
    local id = tonumber(query)
    local list = {}
    for index = 1, count do
        local name = self:ItemName(index)
        local hit = type(name) == "string" and name:lower():find(query, 1, true) ~= nil
        if not hit and id and type(_G.GetMerchantItemLink) == "function" then
            local link = _G.GetMerchantItemLink(index)
            hit = type(link) == "string" and tonumber(link:match("item:(%d+)")) == id
        end
        if hit then list[#list + 1] = index end
    end
    return list
end

function Widget:CurrentList()
    local frame = _G.MerchantFrame
    if self.searchFailed or (self.query or "") == "" or not IsFrame(frame) or frame.selectedTab == 2 then
        return nil
    end
    return self:BuildList(self.query)
end

-- Runs the native update with every index-based read remapped; always restores.
function Widget:RunFiltered(update, list)
    local saved, calls = {}, 0
    local function swap(owner, key, replacement)
        saved[#saved + 1] = { owner, key, owner[key] }
        owner[key] = replacement
    end
    local function mapped(fn)
        return function(index, ...)
            local real = list[index]
            if real then return fn(real, ...) end
        end
    end
    local function count() calls = calls + 1; return #list end
    if type(_G.GetMerchantNumItems) == "function" then swap(_G, "GetMerchantNumItems", count) end
    for _, key in ipairs(MAPPED_GLOBALS) do
        if type(_G[key]) == "function" then swap(_G, key, mapped(_G[key])) end
    end
    local api = _G.C_MerchantFrame
    if type(api) == "table" then
        if type(api.GetNumItems) == "function" then swap(api, "GetNumItems", count) end
        for _, key in ipairs(MAPPED_API) do
            if type(api[key]) == "function" then swap(api, key, mapped(api[key])) end
        end
    end
    local ok = pcall(update)
    for index = #saved, 1, -1 do
        local entry = saved[index]
        entry[1][entry[2]] = entry[3]
    end
    return ok, calls
end

-- Points slot IDs back at real merchant indexes; false when the native
-- drawing did not follow the remapped list, so search can back out safely.
function Widget:FixIds(list)
    local frame = _G.MerchantFrame
    local perPage = tonumber(_G.MERCHANT_ITEMS_PER_PAGE) or PAGE_SIZE
    local page = tonumber(frame.page) or 1
    local checked, matched = 0, 0
    for slot = 1, perPage do
        local real = list[(page - 1) * perPage + slot]
        local holder = _G["MerchantItem" .. slot]
        local button = _G["MerchantItem" .. slot .. "ItemButton"] or (IsFrame(holder) and holder.ItemButton)
        if real and IsFrame(button) and type(button.SetID) == "function" then
            button:SetID(real)
            if IsFrame(holder) and type(holder.SetID) == "function" then holder:SetID(real) end
            local label = _G["MerchantItem" .. slot .. "Name"]
            local shown = IsFrame(label) and type(label.GetText) == "function" and label:GetText() or nil
            local expected = self:ItemName(real)
            if type(shown) == "string" and type(expected) == "string" then
                checked = checked + 1
                if shown == expected then matched = matched + 1 end
            end
        end
    end
    return checked == 0 or matched > 0
end

function Widget:ClampPage(list)
    local frame = _G.MerchantFrame
    local perPage = tonumber(_G.MERCHANT_ITEMS_PER_PAGE) or PAGE_SIZE
    local pages = math.max(1, math.ceil(#list / perPage))
    if (tonumber(frame.page) or 1) > pages then frame.page = pages end
end

function Widget:OnSearchChanged(edit)
    local text = type(edit.GetText) == "function" and edit:GetText() or ""
    if self.clear then
        if text == "" then self.clear:Hide() else self.clear:Show() end
    end
    if self.placeholder then
        if text == "" and not (type(edit.HasFocus) == "function" and edit:HasFocus()) then
            self.placeholder:Show()
        else
            self.placeholder:Hide()
        end
    end
    local query = text:lower():gsub("^%s+", ""):gsub("%s+$", "")
    if query == (self.query or "") then return end
    self.query = query
    if _G.MerchantFrame then _G.MerchantFrame.page = 1 end
    if self:Wanted() and type(_G.MerchantFrame_Update) == "function" then _G.MerchantFrame_Update() end
end

function Widget:EnsureSearchBox()
    if self.searchBox then return self.searchBox end
    local module, parent = self.module, _G.MerchantFrame
    if not module or not IsFrame(parent) or type(module.CreateFrame) ~= "function" then return nil end
    -- No stock template: a flat dark fill with a thin black border drawn from solid textures.
    local box = module:CreateFrame("EditBox", "RurutiaMerchantSearchBox", parent, nil, function(frame)
        if IsFrame(frame) and type(frame.Hide) == "function" then frame:Hide() end
    end, "merchant-search")
    if not IsFrame(box) then return nil end
    box:SetAutoFocus(false)
    box:SetFontObject("GameFontHighlight")
    box:SetSize(SEARCH_WIDTH, SEARCH_HEIGHT)
    box:SetMaxLetters(40)
    box:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -SEARCH_RIGHT, SEARCH_Y)
    local function paint(layer, r, g, b, a)
        local tex = box:CreateTexture(nil, layer)
        if type(tex.SetColorTexture) == "function" then tex:SetColorTexture(r, g, b, a)
        else tex:SetTexture(r, g, b, a) end
        return tex
    end
    paint("BACKGROUND", 0.05, 0.05, 0.05, 0.9):SetAllPoints(box)
    local top = paint("BORDER", 0, 0, 0, 1)
    top:SetPoint("TOPLEFT", box, "TOPLEFT", 0, 0); top:SetPoint("TOPRIGHT", box, "TOPRIGHT", 0, 0); top:SetHeight(1)
    local bottom = paint("BORDER", 0, 0, 0, 1)
    bottom:SetPoint("BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0); bottom:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0); bottom:SetHeight(1)
    local left = paint("BORDER", 0, 0, 0, 1)
    left:SetPoint("TOPLEFT", box, "TOPLEFT", 0, 0); left:SetPoint("BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0); left:SetWidth(1)
    local right = paint("BORDER", 0, 0, 0, 1)
    right:SetPoint("TOPRIGHT", box, "TOPRIGHT", 0, 0); right:SetPoint("BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0); right:SetWidth(1)
    local placeholder = box:CreateFontString(nil, "ARTWORK", "GameFontDisable")
    placeholder:SetPoint("LEFT", box, "LEFT", 6, 0)
    placeholder:SetText("搜索商品")
    self.placeholder = placeholder
    local counter = box:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    counter:SetPoint("RIGHT", box, "LEFT", -SEARCH_GAP, 0)
    self.counter = counter
    box:SetTextInsets(6, 20, 0, 0)
    -- Clear button inside the right edge; only visible while there is text.
    local clear = module:CreateFrame("Button", nil, box, nil, function(frame)
        if IsFrame(frame) and type(frame.Hide) == "function" then frame:Hide() end
    end, "merchant-search-clear")
    if IsFrame(clear) then
        clear:SetSize(16, 16)
        clear:SetPoint("RIGHT", box, "RIGHT", -3, 0)
        clear:SetNormalTexture("Interface\\FriendsFrame\\ClearBroadcastIcon")
        clear:SetAlpha(0.6)
        clear:SetScript("OnEnter", function(button) button:SetAlpha(1) end)
        clear:SetScript("OnLeave", function(button) button:SetAlpha(0.6) end)
        clear:SetScript("OnClick", function()
            box:SetText("")
            box:SetFocus()
        end)
        clear:Hide()
        self.clear = clear
    end
    box:SetScript("OnTextChanged", function(edit) self:OnSearchChanged(edit) end)
    box:SetScript("OnEditFocusGained", function() placeholder:Hide() end)
    box:SetScript("OnEditFocusLost", function(edit) self:OnSearchChanged(edit) end)
    box:SetScript("OnEscapePressed", function(edit) edit:SetText(""); edit:ClearFocus() end)
    box:SetScript("OnEnterPressed", function(edit) edit:ClearFocus() end)
    self.searchBox = box
    return box
end

-- The client's own overview button sits in the same strip on some merchants;
-- keep the search box to its left instead of covering it.
function Widget:FindOverviewButton()
    if IsFrame(self.overview) then return self.overview end
    local frame = _G.MerchantFrame
    if not IsFrame(frame) or type(frame.GetChildren) ~= "function" then return nil end
    for _, child in ipairs({ frame:GetChildren() }) do
        if IsFrame(child) and child ~= self.searchBox then
            local label = type(child.GetText) == "function" and child
                or (IsFrame(child.Text) and type(child.Text.GetText) == "function" and child.Text) or nil
            if label then
                local ok, text = pcall(label.GetText, label)
                if ok and text == OVERVIEW_TEXT then
                    self.overview = child
                    return child
                end
            end
        end
    end
    return nil
end

function Widget:PlaceSearch(box)
    local frame = _G.MerchantFrame
    local overview = self:FindOverviewButton()
    local anchor = overview and type(overview.IsShown) == "function" and overview:IsShown() and overview or false
    if self.placedFor == anchor then return end
    self.placedFor = anchor
    box:ClearAllPoints()
    if anchor then
        box:SetPoint("RIGHT", anchor, "LEFT", -SEARCH_GAP, 0)
    else
        box:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -SEARCH_RIGHT, SEARCH_Y)
    end
end

function Widget:SyncSearchBox(list)
    local frame = _G.MerchantFrame
    local show = IsFrame(frame) and not self.searchFailed and frame.selectedTab ~= 2
    local box = show and self:EnsureSearchBox() or self.searchBox
    if not box then return end
    if show then
        self:PlaceSearch(box)
        box:Show()
        if self.counter then
            self.counter:SetText(list and (#list .. " 件") or "")
        end
    else
        box:Hide()
    end
end

function Widget:ResetSearch()
    self.query = ""
    self.searchFailed = nil
    local box = self.searchBox
    if box and type(box.GetText) == "function" and box:GetText() ~= "" then box:SetText("") end
    if self.counter then self.counter:SetText("") end
end

-- Stock keeps every tile of the page on screen (empty ones as dimmed slots),
-- but only slots 1-10 are ever shown on the merchant tab; 11-12 are buyback-only.
function Widget:ShowEmptySlots()
    local frame = _G.MerchantFrame
    if not IsFrame(frame) or frame.selectedTab == 2 then return end
    for slot = 1, self.pageSize or PAGE_SIZE do
        local holder = _G["MerchantItem" .. slot]
        if IsFrame(holder) and type(holder.Show) == "function"
            and not (type(holder.IsShown) == "function" and holder:IsShown()) then
            holder:Show()
        end
    end
end

-- EllesmereUI skins MerchantItem1-12 only. Slots added here are painted through
-- its public third-party skin facade so they match the other tiles.
local ELLES_SKINNED_SLOTS = 12
local CURRENCY_LIFT = 6

function Widget:RegisterElles()
    if self.ellesRegistered then return end
    local registry = ns.ExtraToolsProviderRegistry
    if type(registry) ~= "table" or type(registry.RegisterMerchantSkin) ~= "function" then return end
    self.ellesRegistered = true
    registry:RegisterMerchantSkin(function(skin)
        self.skin = skin
        if self:Wanted() and self.applied then self:SkinExtraSlots() end
    end)
end

function Widget:EllesActive()
    local registry = ns.ExtraToolsProviderRegistry
    return self.skin ~= nil and type(registry) == "table" and type(registry.IsMerchantSkinActive) == "function"
        and registry:IsMerchantSkinActive() == true
end

function Widget:LiftCurrency(frame)
    if not IsFrame(frame) or type(frame.GetNumPoints) ~= "function" or frame:GetNumPoints() < 1 then return end
    local point, relative, relativePoint, x, y = frame:GetPoint(1)
    if not point then return end
    y = y or 0
    self.lifted = self.lifted or setmetatable({}, { __mode = "k" })
    local record = self.lifted[frame]
    -- Blizzard re-anchors after every update; lift once per fresh anchor.
    if record and record.relative == relative and record.y == y then return end
    frame:SetPoint(point, relative, relativePoint, x or 0, y + CURRENCY_LIFT)
    self.lifted[frame] = { relative = relative, y = y + CURRENCY_LIFT }
end

function Widget:SkinSlot(skin, slot)
    local holder = _G["MerchantItem" .. slot]
    if not IsFrame(holder) then return end
    skin.Panel(holder)
    local name = _G["MerchantItem" .. slot .. "Name"]
    if IsFrame(name) then
        if type(name.SetWordWrap) == "function" then name:SetWordWrap(true) end
        if type(name.SetMaxLines) == "function" then name:SetMaxLines(2) end
    end
    local button = _G["MerchantItem" .. slot .. "ItemButton"]
    if IsFrame(button) then
        local normal = type(button.GetNormalTexture) == "function" and button:GetNormalTexture() or nil
        if normal and type(normal.SetAlpha) == "function" then normal:SetAlpha(0) end
        local base = "MerchantItem" .. slot .. "ItemButton"
        for _, region in ipairs({ _G[base .. "Slot"], button.IconBorder or _G[base .. "IconBorder"] }) do
            if region and type(region.SetAlpha) == "function" then region:SetAlpha(0) end
        end
        local icon = button.Icon or button.icon or _G[base .. "IconTexture"]
        if icon then skin.SquareIcon(icon, button, true) end
        self.centred = self.centred or setmetatable({}, { __mode = "k" })
        if not self.centred[button] and type(button.SetPoint) == "function" then
            self.centred[button] = true
            button:ClearAllPoints()
            button:SetPoint("LEFT", holder, "LEFT", 0, 0)
        end
    end
    self:LiftCurrency(_G["MerchantItem" .. slot .. "MoneyFrame"])
    self:LiftCurrency(_G["MerchantItem" .. slot .. "AltCurrencyFrame"])
end

function Widget:SkinExtraSlots()
    if not self:EllesActive() then return end
    for slot = ELLES_SKINNED_SLOTS + 1, self.pageSize or PAGE_SIZE do
        pcall(self.SkinSlot, self, self.skin, slot)
    end
end

function Widget:Restore()
    if self.busy or not self.applied then return end
    self:ResetSearch()
    if self.searchBox then self.searchBox:Hide() end
    self.busy = true
    if self.stockMerchant ~= nil then
        _G.MERCHANT_ITEMS_PER_PAGE = self.stockMerchant
        _G.BUYBACK_ITEMS_PER_PAGE = self.stockBuyback
    end
    local frame = _G.MerchantFrame
    if IsFrame(frame) and self.stockWidth and self.stockHeight and type(frame.SetSize) == "function" then
        frame:SetSize(self.stockWidth, self.stockHeight)
    end
    self:RestorePoints()
    self:HideSurplus()
    -- Buyback-only tiles stay hidden on the merchant tab, as in stock.
    if IsFrame(frame) and frame.selectedTab ~= 2 then
        for slot = (self.stockMerchant or 10) + 1, self.stockBuyback or 12 do
            local holder = _G["MerchantItem" .. slot]
            if IsFrame(holder) and type(holder.Hide) == "function" then holder:Hide() end
        end
    end
    local update = _G.MerchantFrame_Update
    if IsFrame(frame) and type(frame.IsShown) == "function" and frame:IsShown() and type(update) == "function" then
        update()
    end
    self:RestorePoints()
    self.busy = false
    self.applied = false
end

function Widget:OnMerchantUpdate()
    if self.busy then
        if self:Wanted() then self:ApplyGeometry() end
        return
    end
    if not self:Wanted() then
        self:Restore()
        return
    end
    self:Capture()
    self:EnsureSlots()
    self:UseExpandedConstants()
    self.busy = true
    local update = _G.MerchantFrame_Update
    local list = self:CurrentList()
    if type(update) == "function" then
        if list then
            self:ClampPage(list)
            local ok, calls = self:RunFiltered(update, list)
            if not ok or calls == 0 or not self:FixIds(list) then
                -- The client did not follow the remapped list: drop search, keep native goods.
                self.searchFailed, list = true, nil
                update()
            end
        else
            update()
        end
    end
    self.busy = false
    self:ApplyGeometry()
    self.applied = true
    self:ShowEmptySlots()
    self:SkinExtraSlots()
    self:SyncSearchBox(list)
end

function Widget:OnShow()
    self:ResetSearch()
    self:OnMerchantUpdate()
end

function Widget:OnRepair()
    if not (self:Wanted() and self.applied and _G.MerchantFrame) then return end
    local width = self:ExpandedWidth()
    self:PlaceRepair(width)
end

function Widget:Install(module)
    if self.hooks or not _G.MerchantFrame then return end
    self.hooks = {}
    self:RegisterElles()
    if type(_G.MerchantFrame_Update) == "function" then
        self.hooks.update = module:HookSecureFunction("MerchantFrame_Update", function()
            self:OnMerchantUpdate()
        end, "merchant-update")
    end
    if type(_G.MerchantFrame_UpdateRepairButtons) == "function" then
        self.hooks.repair = module:HookSecureFunction("MerchantFrame_UpdateRepairButtons", function()
            self:OnRepair()
        end, "merchant-repair")
    end
    local frame = _G.MerchantFrame
    if type(frame.HookScript) == "function" then
        self.hooks.show = module:HookFrameScript(frame, "OnShow", function()
            self:OnShow()
        end, "merchant-show")
    end
end

function Widget:Shutdown()
    if self.applied then self:Restore() end
    self:ResetSearch()
    if self.searchBox then self.searchBox:Hide() end
    local module = self.module
    local hooks = self.hooks
    self.hooks = nil
    if module and hooks and type(module.RemoveHook) == "function" then
        for _, token in pairs(hooks) do
            if token then module:RemoveHook(token) end
        end
    end
end

function Widget:Sync(module)
    self.module = module
    local available = module and module.runtimeActive and module.adapter and module.adapter.features
        and module.adapter.features.merchantExpansion and _G.MerchantFrame
    if not available then
        if self.hooks or self.applied then self:Shutdown() end
        return false
    end
    self:Install(module)
    if self:Wanted() then
        self:OnMerchantUpdate()
    elseif self.applied then
        self:Restore()
    end
    return true
end
