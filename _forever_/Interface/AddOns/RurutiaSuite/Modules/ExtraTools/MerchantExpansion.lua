-- Independent merchant grid. Never replace merchant APIs, native page state or bindings.
local _, ns = ...
local adapter = ns.ExtraToolsAdapter
if adapter and not (adapter.features and adapter.features.merchantExpansion) then return end
local Widget = {}
ns.ExtraToolsMerchantExpansion = Widget
local PAGE_SIZE, COLUMNS = 20, 4
local TILE_PREFIX = "RurutiaMerchantTile"
local SEARCH_WIDTH, SEARCH_HEIGHT = 190, 20
local SEARCH_RIGHT, SEARCH_Y, SEARCH_GAP = 20, -34, 8
local OVERVIEW_TEXT = "商品总览"
local function IsFrame(v) return type(v) == "table" or type(v) == "userdata" end
local function Shown(f) return f and type(f.IsShown) == "function" and f:IsShown() end
local function Combat() return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() end
local function SetShown(f, on) if on then f:Show() else f:Hide() end end

function Widget:LayoutOwned()
    local r = ns.ExtraToolsProviderRegistry
    return r and type(r.OwnsMerchantLayout) == "function" and r:OwnsMerchantLayout() == true
end
function Widget:Wanted()
    local m = self.module
    if not (m and m.runtimeActive and m.adapter and m.adapter.features.merchantExpansion and _G.MerchantFrame) then return false end
    local db = m:GetBlizzardUIDB()
    return db and (db.merchantExpansion == true or db.merchantSearch == true)
end
function Widget:ExpandedWidth() return 678 end

-- Park native controls without changing their shown/enabled state. Blizzard keeps
-- updating them normally, so returning to buyback needs no insecure native refresh.
function Widget:Park(park)
    if not self.holder then return end
    self.parents = self.parents or {}
    local function move(f)
        if not f then return end
        if park then
            if f:GetParent() ~= self.holder then self.parents[f] = f:GetParent(); f:SetParent(self.holder) end
        elseif self.parents[f] then
            if f:GetParent() == self.holder then f:SetParent(self.parents[f]) end
            self.parents[f] = nil
        end
    end
    if not park then
        for f in pairs(self.parents) do move(f) end
        return
    end
    for i = 1, 12 do move(_G["MerchantItem" .. i]) end
    for _, name in ipairs({"MerchantPageText", "MerchantPrevPageButton", "MerchantNextPageButton",
        "MerchantPageTurnIndicatorLeft", "MerchantPageTurnIndicatorRight"}) do move(_G[name]) end
end

-- Native merchant context reads addon-owned count while rebuilding secure bindings.
-- Keep data on the display ItemButton; only context-free controls accept input.
function Widget:SelectItem(item)
    self.selectedItem = item
    if self.bulk then self.bulk:SetEnabled(item ~= nil) end
    if self.inspect then self.inspect:SetEnabled(item ~= nil) end
end
function Widget:ShowItemTooltip(item)
    self:SelectItem(item)
    local tip = _G.GameTooltip
    if tip then
        tip:SetOwner(item, "ANCHOR_RIGHT")
        tip:SetMerchantItem(item:GetID())
        if _G.GameTooltip_ShowCompareItem then _G.GameTooltip_ShowCompareItem(tip) end
    end
end
function Widget:CreateInput(tile, slot)
    local item, m = tile.ItemButton, self.module
    item:EnableMouse(false)
    -- OnLoad cached MerchantItemButton_OnEnter in UpdateTooltip separately.
    -- GameTooltip invokes that alias on later updates, even after SetScript replaces
    -- OnEnter. Both entry points must avoid MerchantFrame.footer:Refresh().
    local showTooltip = function() self:ShowItemTooltip(item) end
    item.UpdateTooltip = showTooltip
    item:SetScript("OnEnter", showTooltip)
    item:SetScript("OnLeave", function() if _G.GameTooltip then _G.GameTooltip:Hide() end end)
    local input = m:CreateFrame("Button", tile:GetName() .. "Input", tile, nil,
        function(v) v:Hide() end, "merchant-input-" .. slot)
    input:SetAllPoints(item)
    input:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    input:RegisterForDrag("LeftButton")
    input:SetScript("OnEnter", function() self:ShowItemTooltip(item) end)
    input:SetScript("OnLeave", function() if _G.GameTooltip then _G.GameTooltip:Hide() end end)
    input:SetScript("OnClick", function(_, button)
        if Combat() or not item.hasItem then return end
        if _G.IsModifiedClick and _G.IsModifiedClick() then
            _G.MerchantItemButton_OnModifiedClick(item, button)
        else
            _G.MerchantItemButton_OnClick(item, button)
        end
    end)
    input:SetScript("OnDragStart", function()
        if not Combat() and item.hasItem then _G.MerchantItemButton_OnClick(item, "LeftButton") end
    end)
    input.OnSmartNavClick = function()
        if not Combat() and item.hasItem then _G.MerchantItemButton_OnClick(item, "RightButton") end
    end
    -- No buttonContext/count/hasItem on input: native footer must use standard Select.
    tile.input = input
end
function Widget:EnsureSlots()
    if self.tiles then return end
    local m, f = self.module, _G.MerchantFrame
    self.tiles, self.buttons = {}, self.buttons or {}
    self.holder = m:CreateFrame("Frame", nil, f, nil, function(v) v:Hide() end, "merchant-native-holder")
    self.holder:Hide()
    for i = 1, PAGE_SIZE do
        local tile = m:CreateFrame("Frame", TILE_PREFIX .. i, f, "MerchantItemTemplate", function(v) v:Hide() end, "merchant-tile-" .. i)
        tile:ClearAllPoints()
        tile:SetPoint("TOPLEFT", f, "TOPLEFT", 11 + ((i - 1) % COLUMNS) * 165, -69 - math.floor((i - 1) / COLUMNS) * 52)
        self.tiles[i] = tile
        self.buttons[tile.ItemButton] = true
        self:CreateInput(tile, i)
    end
    local function arrow(name, delta, x)
        local b = m:CreateFrame("Button", nil, f, "UIPanelButtonTemplate", function(v) v:Hide() end, name)
        b:SetSize(64, 22); b:SetPoint("BOTTOM", f, "BOTTOM", x, 86)
        b:SetText(delta < 0 and "上一页" or "下一页")
        b:SetScript("OnClick", function() self:StepPage(delta) end)
        return b
    end
    self.prev, self.next = arrow("merchant-prev", -1, -90), arrow("merchant-next", 1, 90)
    self.pageText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.pageText:SetPoint("BOTTOM", f, "BOTTOM", 0, 91)
    local function action(label, x, fn)
        local b = m:CreateFrame("Button", nil, f, "UIPanelButtonTemplate", function(v) v:Hide() end, label)
        b:SetSize(80, 22); b:SetPoint("BOTTOM", f, "BOTTOM", x, 60); b:SetText(label)
        b:SetScript("OnClick", function()
            local item = self.selectedItem
            if not Combat() and self.applied and item and Shown(item) and item.hasItem then fn(item) end
        end)
        return b
    end
    self.bulk = action("批量购买", -46, function(item) _G.MerchantItemButton_BuyMultipleStacks(item) end)
    self.inspect = action("试穿", 46, function(item) _G.DressUpLink(_G.GetMerchantItemLink(item:GetID())) end)
    self:SelectItem(nil)
end

-- A quantity dialog must never keep an index after a search/page/stock change.
function Widget:CloseSplit()
    local split = _G.StackSplitFrame
    if split and self.buttons and self.buttons[split.owner] and Shown(split) then split:Hide() end
end
function Widget:StepPage(delta)
    if not self.applied or Combat() then return end
    self:CloseSplit()
    self.page = math.max(1, math.min((self.page or 1) + delta, self.pages or 1))
    self:OnMerchantUpdate()
end
function Widget:ItemName(index)
    if _G.C_MerchantFrame and type(_G.C_MerchantFrame.GetItemInfo) == "function" then
        local info = _G.C_MerchantFrame.GetItemInfo(index)
        return info and info.name
    end
    if type(_G.GetMerchantItemInfo) == "function" then return _G.GetMerchantItemInfo(index) end
end
function Widget:BuildList(query)
    local list, id = {}, tonumber(query)
    local count = type(_G.GetMerchantNumItems) == "function" and _G.GetMerchantNumItems() or 0
    for i = 1, count do
        local name = self:ItemName(i)
        local hit = query == "" or (type(name) == "string" and name:lower():find(query, 1, true))
        if not hit and id and _G.GetMerchantItemLink then
            local link = _G.GetMerchantItemLink(i)
            hit = type(link) == "string" and tonumber(link:match("item:(%d+)")) == id
        end
        if hit then list[#list + 1] = i end
    end
    return list
end
function Widget:OnSearchChanged(edit)
    local text = edit:GetText() or ""
    if self.clear then SetShown(self.clear, text ~= "") end
    if self.placeholder then SetShown(self.placeholder, text == "" and not edit:HasFocus()) end
    local query = text:lower():gsub("^%s+", ""):gsub("%s+$", "")
    if query == (self.query or "") then return end
    self:CloseSplit()
    self.query, self.page, self.resultPage = query, 1, 1
    if not self.busy then self:OnMerchantUpdate() end
end

-- Currency rendering addresses our own template children, never MerchantItemN.
function Widget:FillCurrency(tileName, index, canAfford)
    local base, used, width = tileName .. "AltCurrencyFrame", 0, 0
    for i = 1, (_G.MAX_ITEM_COST or 3) do
        local texture, amount, link = _G.GetMerchantItemCostItem(index, i)
        if texture then
            used = used + 1
            local b = _G[base .. "Item" .. used]
            b.index, b.item, b.itemLink = index, i, link
            _G.AltCurrencyFrame_Update(base .. "Item" .. used, texture, amount, canAfford)
            width = width + b:GetWidth() + (used > 1 and 4 or 0)
            b:Show()
        end
    end
    for i = used + 1, (_G.MAX_ITEM_COST or 3) do _G[base .. "Item" .. i]:Hide() end
    return width
end
function Widget:FillTile(slot, index, resultTile)
    local tile = resultTile or self.tiles[slot]
    local base = tile:GetName()
    local b = tile.ItemButton
    local info = index and _G.C_MerchantFrame.GetItemInfo(index)
    if not info then
        b.hasItem, b.price, b.name, b.link, b.extendedCost = nil, nil, nil, nil, nil
        b:SetID(0); b:Hide(); tile.input:Hide(); tile:Hide()
        return
    end
    local name, texture, stock = info.name, info.texture, info.numAvailable
    if info.currencyID and _G.CurrencyContainerUtil then
        name, texture, stock = _G.CurrencyContainerUtil.GetCurrencyContainerInfo(info.currencyID, stock, name, texture, nil)
    end
    local link = _G.GetMerchantItemLink(index)
    local canAfford = _G.CanAffordMerchantItem(index)
    tile.Name:SetText(name)
    _G.SetItemButtonCount(b, info.stackCount)
    _G.SetItemButtonStock(b, stock)
    _G.SetItemButtonTexture(b, texture)
    b.name, b.link, b.texture, b.hasItem = name, link, texture, true
    b.showNonrefundablePrompt = not _G.C_MerchantFrame.IsMerchantItemRefundable(index)
    b.extendedCost = info.hasExtendedCost or nil
    b.price = (not info.hasExtendedCost or info.price > 0) and info.price or nil
    b:SetID(index); tile:SetID(index)
    local money, alt = _G[base .. "MoneyFrame"], _G[base .. "AltCurrencyFrame"]
    local width = info.hasExtendedCost and self:FillCurrency(base, index, canAfford) or 0
    if b.price then
        _G.MoneyFrame_SetMaxDisplayWidth(money, math.max(1, 120 - width))
        _G.MoneyFrame_Update(money:GetName(), b.price)
        _G.SetMoneyFrameColor(money:GetName(), canAfford == false and "gray" or nil)
    end
    alt:ClearAllPoints()
    if b.price then alt:SetPoint("LEFT", money, "RIGHT", -14, 0)
    else alt:SetPoint("BOTTOMLEFT", base .. "NameFrame", "BOTTOMLEFT", 0, 31) end
    SetShown(money, b.price ~= nil); SetShown(alt, info.hasExtendedCost)
    if info.isQuestStartItem then b.IconQuestTexture:SetTexture(_G.TEXTURE_ITEM_QUEST_BANG) end
    SetShown(b.IconQuestTexture, info.isQuestStartItem)
    _G.MerchantFrameItem_UpdateQuality(tile, link)
    local itemID = _G.GetMerchantItemID(index)
    local heirloom = itemID and _G.C_Heirloom and _G.C_Heirloom.IsItemHeirloom(itemID)
    local known = heirloom and _G.C_Heirloom.PlayerHasHeirloom(itemID)
    _G.SetItemButtonDesaturated(b, known)
    local red = not info.isPurchasable or (not info.isUsable and not heirloom)
    local dim = stock == 0 or known
    local r, g, blue = 1, 1, 1
    if dim then r, g, blue = 0.5, red and 0 or 0.5, red and 0 or 0.5
    elseif red then r, g, blue = 0.9, 0, 0 end
    _G.SetItemButtonNameFrameVertexColor(tile, dim and 0.5 or (red and 1 or 0.5), red and 0 or 0.5, red and 0 or 0.5)
    _G.SetItemButtonSlotVertexColor(tile, dim and 0.5 or 1, red and 0 or (dim and 0.5 or 1), red and 0 or (dim and 0.5 or 1))
    _G.SetItemButtonTextureVertexColor(b, r, g, blue)
    _G.SetItemButtonNormalTextureVertexColor(b, r, g, blue)
    local recipe = ns.ExtraToolsKnownRecipe
    if recipe and recipe.active and recipe:IsKnown(link) then
        _G.SetItemButtonNameFrameVertexColor(tile, 0, 1, 0)
        _G.SetItemButtonSlotVertexColor(tile, 0, 1, 0)
        _G.SetItemButtonTextureVertexColor(b, 0, 0.9, 0)
        _G.SetItemButtonNormalTextureVertexColor(b, 0, 0.9, 0)
    end
    b:Show(); tile.input:Show(); tile:Show()
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

function Widget:SyncSearchBox(list, enabled)
    local frame = _G.MerchantFrame
    local show = enabled and IsFrame(frame) and not self.searchFailed and frame.selectedTab ~= 2
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

-- A bounded dropdown attached to the search field. Only actual queries allocate
-- result rows. The vendor's own tiles, paging and purchase IDs stay untouched.
local RESULT_ROWS = 4
function Widget:EnsureResults()
    if self.results then return end
    local m, box = self.module, self.searchBox
    local panel = m:CreateFrame("Frame", nil, box, nil, function(v) v:Hide() end, "merchant-search-results")
    panel:SetPoint("TOPRIGHT", box, "BOTTOMRIGHT", 0, -2)
    panel:SetFrameStrata("DIALOG")
    panel:EnableMouse(true)
    local bg = panel:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(panel)
    bg:SetColorTexture(0.06, 0.06, 0.06, 1)
    self.results, self.resultTiles = panel, {}
    self.buttons = self.buttons or {}
    for i = 1, RESULT_ROWS do
        local tile = m:CreateFrame("Frame", "RurutiaMerchantResult" .. i, panel, "MerchantItemTemplate",
            function(v) v:Hide() end, "merchant-result-" .. i)
        tile:ClearAllPoints()
        tile:SetPoint("TOPLEFT", panel, "TOPLEFT", 6, -4 - (i - 1) * 48)
        self.resultTiles[i] = tile
        self.buttons[tile.ItemButton] = true
        self:CreateInput(tile, "result-" .. i)
        if _G.SmartNavigation_MarkFrameIgnored then _G.SmartNavigation_MarkFrameIgnored(tile.ItemButton) end
    end
    local function pager(label, offset, delta)
        local b = m:CreateFrame("Button", nil, panel, "UIPanelButtonTemplate", function(v) v:Hide() end, label)
        b:SetSize(64, 20)
        b:SetPoint("BOTTOM", panel, "BOTTOM", offset, 3)
        b:SetText(label)
        b:SetScript("OnClick", function()
            if Combat() then return end
            self.resultPage = self.resultPage + delta
            self:OnMerchantUpdate()
        end)
        return b
    end
    self.resultPrev = pager("上一页", -38, -1)
    self.resultNext = pager("下一页", 38, 1)
end

function Widget:UpdateOwnedSearch()
    local query = self.query or ""
    local list = query ~= "" and self:BuildList(query) or nil
    self:SyncSearchBox(list, true)
    if not list or #list == 0 then
        if self.results then self.results:Hide() end
        return
    end
    self:EnsureResults()
    local pages = math.ceil(#list / RESULT_ROWS)
    self.resultPage = math.max(1, math.min(self.resultPage or 1, pages))
    local offset = (self.resultPage - 1) * RESULT_ROWS
    for i, tile in ipairs(self.resultTiles) do self:FillTile(i, list[offset + i], tile) end
    self.results:SetSize(SEARCH_WIDTH, 8 + math.min(RESULT_ROWS, #list - offset) * 48 + (pages > 1 and 24 or 0))
    SetShown(self.resultPrev, pages > 1)
    SetShown(self.resultNext, pages > 1)
    self.resultPrev:SetEnabled(self.resultPage > 1)
    self.resultNext:SetEnabled(self.resultPage < pages)
    self.results:Show()
end

function Widget:ResetSearch()
    self.query = ""
    self.searchFailed = nil
    local box = self.searchBox
    if box and type(box.GetText) == "function" and box:GetText() ~= "" then box:SetText("") end
    if self.counter then self.counter:SetText("") end
end

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
    local holder = _G[TILE_PREFIX .. slot]
    if not IsFrame(holder) then return end
    self.skinned = self.skinned or {}
    if self.skinned[holder] ~= skin then skin.Panel(holder); self.skinned[holder] = skin end
    local name = _G[TILE_PREFIX .. slot .. "Name"]
    if IsFrame(name) then
        if type(name.SetWordWrap) == "function" then name:SetWordWrap(true) end
        if type(name.SetMaxLines) == "function" then name:SetMaxLines(2) end
    end
    local button = _G[TILE_PREFIX .. slot .. "ItemButton"]
    if IsFrame(button) then
        local normal = type(button.GetNormalTexture) == "function" and button:GetNormalTexture() or nil
        if normal and type(normal.SetAlpha) == "function" then normal:SetAlpha(0) end
        local base = TILE_PREFIX .. slot .. "ItemButton"
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
    self:LiftCurrency(_G[TILE_PREFIX .. slot .. "MoneyFrame"])
    self:LiftCurrency(_G[TILE_PREFIX .. slot .. "AltCurrencyFrame"])
end

function Widget:SkinExtraSlots()
    if not self:EllesActive() then return end
    for slot = 1, self.pageSize or PAGE_SIZE do
        pcall(self.SkinSlot, self, self.skin, slot)
    end
end


-- Ignore the display buttons through the supported secure navigation API.
-- Only context-free input buttons participate in navigation and footer selection.
function Widget:SyncNavigation(count)
    local jump, dirs = _G.SmartNavigation_AddJumpNavigationOverride, _G.SMART_NAV_INPUT_DIRECTION
    if type(jump) ~= "function" or not dirs or not _G.SmartNavigationSecureHelper then return end
    for _, tile in ipairs(self.tiles) do
        if _G.SmartNavigation_MarkFrameIgnored then _G.SmartNavigation_MarkFrameIgnored(tile.ItemButton) end
    end
    local function button(i) return self.tiles[math.max(1, math.min(count, i))].input end
    local n = math.min(PAGE_SIZE, count)
    if n == 0 then return end
    local search = Shown(self.searchBox) and self.searchBox
    for i = 1, n do
        local b = button(i)
        jump(b, dirs.LEFT, (i - 1) % COLUMNS > 0 and button(i - 1) or (self.page > 1 and self.prev or b))
        jump(b, dirs.RIGHT, i % COLUMNS ~= 0 and i < n and button(i + 1) or (self.page < self.pages and self.next or b))
        jump(b, dirs.UP, i > COLUMNS and button(i - COLUMNS) or search or b)
        jump(b, dirs.DOWN, i + COLUMNS <= n and button(i + COLUMNS) or self.bulk)
    end
    if search then jump(search, dirs.DOWN, button(1)) end
    jump(self.prev, dirs.UP, button(n))
    jump(self.next, dirs.UP, button(n))
    jump(self.prev, dirs.RIGHT, self.next)
    jump(self.next, dirs.LEFT, self.prev)
    jump(self.bulk, dirs.UP, button(n))
    jump(self.inspect, dirs.UP, button(n))
    jump(self.bulk, dirs.RIGHT, self.inspect)
    jump(self.inspect, dirs.LEFT, self.bulk)
    jump(self.bulk, dirs.DOWN, self.pages > 1 and self.prev or search or button(1))
    jump(self.inspect, dirs.DOWN, self.pages > 1 and self.next or search or button(1))
end

function Widget:Restore()
    self:CloseSplit()
    self:SelectItem(nil)
    if self.tiles then for _, tile in ipairs(self.tiles) do tile:Hide() end end
    for _, control in ipairs({self.prev, self.next, self.pageText, self.bulk, self.inspect}) do control:Hide() end
    if self.searchBox then self.searchBox:Hide() end
    if self.results then self.results:Hide() end
    self:Park(false)
    local f = _G.MerchantFrame
    if self.applied and f then
        if f:GetWidth() == self:ExpandedWidth() and self.stockWidth then f:SetWidth(self.stockWidth) end
        if self.buybackPoint and _G.MerchantBuyBackItem then
            _G.MerchantBuyBackItem:ClearAllPoints()
            _G.MerchantBuyBackItem:SetPoint(unpack(self.buybackPoint))
        end
    end
    self.applied, self.buybackPoint = false, nil
end
function Widget:OnMerchantUpdate()
    if self.busy then return end
    local f = _G.MerchantFrame
    if not self:Wanted() or not Shown(f) or f.selectedTab == 2 then
        self:Restore()
        return
    end
    if Combat() then return end
    self.busy = true
    local ok, err = pcall(function()
        self:CloseSplit()
        local db = self.module:GetBlizzardUIDB()
        if not db.merchantSearch and self.query ~= "" then
            self:ResetSearch()
            self.page, self.resultPage = 1, 1
        end
        if not db.merchantExpansion or self:LayoutOwned() then
            if self.applied or not db.merchantSearch then self:Restore() end
            if db.merchantSearch then self:UpdateOwnedSearch() end
            return
        end
        if Shown(self.results) then
            self.results:Hide()
            self:SelectItem(nil)
        end
        self:EnsureSlots()
        if not self.applied then
            self.stockWidth = f:GetWidth()
            local bb = _G.MerchantBuyBackItem
            if bb and bb:GetNumPoints() > 0 then self.buybackPoint = {bb:GetPoint(1)} end
        end
        self.applied = true
        if f:GetWidth() ~= self:ExpandedWidth() then f:SetWidth(self:ExpandedWidth()) end
        -- Recent buyback is normally anchored to native tile 10, which is parked.
        local bb = _G.MerchantBuyBackItem
        if bb then bb:ClearAllPoints(); bb:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -8, 33) end
        self:Park(true)
        local list = self:BuildList(self.query or "")
        self.pages = math.max(1, math.ceil(#list / PAGE_SIZE))
        self.page = math.max(1, math.min(self.page or 1, self.pages))
        local selected = self.selectedItem
        local selectedID = selected and selected:GetID()
        for i = 1, PAGE_SIZE do self:FillTile(i, list[(self.page - 1) * PAGE_SIZE + i]) end
        if not (selected and selected.hasItem and selected:GetID() == selectedID) then self:SelectItem(nil) end
        self.bulk:Show(); self.inspect:Show()
        self.prev:SetEnabled(self.page > 1); self.next:SetEnabled(self.page < self.pages)
        SetShown(self.prev, self.pages > 1); SetShown(self.next, self.pages > 1)
        self.pageText:SetText(self.page .. " / " .. self.pages); SetShown(self.pageText, self.pages > 1)
        self:SkinExtraSlots()
        self:SyncSearchBox((self.query or "") ~= "" and list or nil, db.merchantSearch)
        self:SyncNavigation(#list - (self.page - 1) * PAGE_SIZE)
    end)
    self.busy = false
    if not ok then self:Restore(); error(err) end
end
function Widget:OnShow()
    self.busy = true
    self:ResetSearch(); self.page = 1
    self.busy = false
    self:OnMerchantUpdate()
end
function Widget:Install(module)
    if self.hooks then return end
    self.hooks = {}
    self:RegisterElles()
    for _, name in ipairs({"MerchantFrame_Update", "MerchantFrame_UpdateItemQualityBorders"}) do
        if type(_G[name]) == "function" then
            self.hooks[#self.hooks + 1] = module:HookSecureFunction(name, function() self:OnMerchantUpdate() end, "rs-grid-" .. name)
        end
    end
    local f = _G.MerchantFrame
    self.hooks[#self.hooks + 1] = module:HookFrameScript(f, "OnShow", function() self:OnShow() end, "rs-grid-show")
    self.hooks[#self.hooks + 1] = module:HookFrameScript(f, "OnHide", function()
        self:Restore(); self:ResetSearch(); self.page = 1
    end, "rs-grid-hide")
    self.hooks[#self.hooks + 1] = module:HookFrameScript(f, "OnMouseWheel", function(_, _, delta)
        self:StepPage(delta > 0 and -1 or 1)
    end, "rs-grid-wheel")
end
function Widget:Shutdown()
    self:Restore(); self:ResetSearch()
    if self.hooks and self.module then for _, token in ipairs(self.hooks) do self.module:RemoveHook(token) end end
    self.hooks = nil
end
function Widget:Sync(module)
    self.module = module
    if not self:Wanted() then self:Shutdown(); return false end
    self:Install(module)
    if Shown(_G.MerchantFrame) then self:OnMerchantUpdate() end
    return true
end
