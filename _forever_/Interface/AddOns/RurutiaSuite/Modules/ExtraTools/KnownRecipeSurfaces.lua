-- 已学配方染色的三个界面：商人、拍卖行浏览列表、公会银行。
-- 每个界面只需回答五件事：能否挂接、挂在哪、是否可见、怎么染、怎么还原。
-- 染色对象都是窗口里数量固定的复用格子，不新建框体；染过的格子记在 tinted 里，
-- 换成别的物品或关闭功能时只还原这些格子。

local _, ns = ...
local Service = ns.ExtraToolsKnownRecipe
if not Service then return end

-- 绿色；图标与边框略暗（0.9），与暴雪自己的染色力度一致。
local function Shade(button, r, g, b)
    _G.SetItemButtonTextureVertexColor(button, r, g, b)
    local normal = button:GetNormalTexture()
    if normal then normal:SetVertexColor(r, g, b) end
end

local function Restore(tinted, shade)
    for target in pairs(tinted) do
        shade(target, 1, 1, 1)
        tinted[target] = nil
    end
end

-- 已学就染色并登记，未学且之前染过则还原；tinted 里只留当前染着色的格子。
local function Mark(tinted, target, known, shade)
    if known then
        shade(target, 0, 0.9, 0)
        tinted[target] = true
    elseif tinted[target] then
        shade(target, 1, 1, 1)
        tinted[target] = nil
    end
end

--------------------------------------------------------------------------------
-- 商人：暴雪每次刷新都会重画所有格子的颜色，所以只给已学的补色，还原交给暴雪重画。
--------------------------------------------------------------------------------
local Merchant = {}

function Merchant:Ready()
    return _G.MerchantFrame ~= nil and type(_G.MerchantFrame_UpdateMerchantInfo) == "function"
end

function Merchant:Shown()
    local frame = _G.MerchantFrame
    return frame ~= nil and frame:IsShown() and frame.selectedTab ~= 2
end

-- 不能挂 MerchantFrame_Update：商人拓展已经占用，同一模块对同一函数只保留一个回调。
function Merchant:Hook(module, paint)
    return module:HookSecureFunction("MerchantFrame_UpdateMerchantInfo", paint, "known-recipe-merchant")
end

function Merchant:Paint(service)
    local grid = ns.ExtraToolsMerchantExpansion
    if grid and (grid.applied or (grid.results and grid.results:IsShown())) then
        grid:OnMerchantUpdate()
        if grid.applied then return end
    end
    if grid and grid:LayoutOwned() then return end
    for slot = 1, tonumber(_G.MERCHANT_ITEMS_PER_PAGE) or 10 do
        local holder = _G["MerchantItem" .. slot]
        local button = _G["MerchantItem" .. slot .. "ItemButton"]
        if holder and button and button:IsShown() and service:IsKnown(button.link) then
            _G.SetItemButtonNameFrameVertexColor(holder, 0, 1, 0)
            _G.SetItemButtonSlotVertexColor(holder, 0, 1, 0)
            Shade(button, 0, 0.9, 0)
            self.dirty = true
        end
    end
end

function Merchant:Restore()
    local grid = ns.ExtraToolsMerchantExpansion
    if grid and (grid.applied or (grid.results and grid.results:IsShown())) then
        self.dirty = nil
        grid:OnMerchantUpdate()
        if grid.applied then return end
    end
    if not self.dirty then return end
    self.dirty = nil
    if self:Shown() and type(_G.MerchantFrame_Update) == "function" then _G.MerchantFrame_Update() end
end

--------------------------------------------------------------------------------
-- 拍卖行：浏览结果的每一行是滚动列表里复用的行，图标不会被暴雪重置，必须自己还原。
--------------------------------------------------------------------------------
local AuctionHouse = { tinted = {} }

local function ShadeCell(cell, r, g, b)
    cell.Icon:SetVertexColor(r, g, b)
    cell.IconBorder:SetVertexColor(r, g, b)
end

function AuctionHouse:Scroll()
    local frame = _G.AuctionHouseFrame
    local browse = frame and frame.BrowseResultsFrame
    local list = browse and browse.ItemList
    return list and list.ScrollBox
end

function AuctionHouse:Ready() return self:Scroll() ~= nil end

function AuctionHouse:Shown()
    local scroll = self:Scroll()
    return scroll ~= nil and scroll:IsShown()
end

function AuctionHouse:Hook(module, paint)
    return module:HookSecureFunction(self:Scroll(), "Update", paint, "known-recipe-auction")
end

function AuctionHouse:Paint(service)
    local rows = self:Scroll():GetFrames()
    for row = 1, #rows do
        local cells = rows[row].cells
        for index = 1, cells and #cells or 0 do
            local cell = cells[index]
            -- 物品名称列：只有它同时带图标、图标边框和本行数据。
            if cell.Icon and cell.IconBorder and cell.rowData then
                local key = cell.rowData.itemKey
                Mark(self.tinted, cell, key ~= nil and service:IsKnown(key.itemID), ShadeCell)
            end
        end
    end
end

function AuctionHouse:Restore() Restore(self.tinted, ShadeCell) end

--------------------------------------------------------------------------------
-- 公会银行：格子只换图标，不会重置颜色，必须自己还原。
--------------------------------------------------------------------------------
local GuildBank = { tinted = {} }

function GuildBank:Ready()
    local frame = _G.GuildBankFrame
    return frame ~= nil and type(frame.Update) == "function"
end

function GuildBank:Shown()
    local frame = _G.GuildBankFrame
    return frame ~= nil and frame:IsShown() and frame.mode == "bank"
end

function GuildBank:Hook(module, paint)
    return module:HookSecureFunction(_G.GuildBankFrame, "Update", paint, "known-recipe-guildbank")
end

function GuildBank:Paint(service)
    local frame = _G.GuildBankFrame
    if frame.mode ~= "bank" then return end
    local tab = _G.GetCurrentGuildBankTab()
    local group = _G.NUM_SLOTS_PER_GUILDBANK_GROUP or 14
    for slot = 1, _G.MAX_GUILDBANK_SLOTS_PER_TAB or 98 do
        local index = slot % group
        if index == 0 then index = group end
        local button = frame.Columns[math.ceil(slot / group)].Buttons[index]
        local link = _G.GetGuildBankItemLink(tab, slot)
        Mark(self.tinted, button, link ~= nil and service:IsKnown(link), Shade)
    end
end

function GuildBank:Restore() Restore(self.tinted, Shade) end

Service:RegisterSurface(Merchant)
Service:RegisterSurface(AuctionHouse)
Service:RegisterSurface(GuildBank)

if ns.EllesMerchantRecipeSurface then Service:RegisterSurface(ns.EllesMerchantRecipeSurface) end
