-- 已学配方染色：商人、拍卖行、公会银行共用的判断与生命周期。
-- 只判断配方类物品。各界面怎么染色见 KnownRecipeSurfaces.lua。
-- 关闭时：hook 与事件由 Runtime 释放，染过的格子恢复原样，缓存清空。

local _, ns = ...

local adapter = ns.ExtraToolsAdapter
-- Retain this service only on clients whose adapter exposes the capability.
-- Isolated service hosts may supply the adapter later; production TOCs load it first.
if adapter and not (adapter.features and adapter.features.knownRecipeTint) then return end

local Service = { surfaces = {}, cache = {}, size = 0 }
ns.ExtraToolsKnownRecipe = Service

local TIP_NAME = "RurutiaKnownRecipeScan"
local CACHE_LIMIT = 256
local RECIPE_CLASS = _G.Enum and _G.Enum.ItemClass and _G.Enum.ItemClass.Recipe or 9

function Service:RegisterSurface(surface)
    self.surfaces[#self.surfaces + 1] = surface
end

function Service:Wanted(module)
    local features = module and module.runtimeActive and module.adapter and module.adapter.features
    if not (features and features.knownRecipeTint) then return false end
    local db = module:GetBlizzardUIDB()
    if not (type(db) == "table" and db.knownRecipeTint == true) then return false end
    local registry = ns.ExtraToolsProviderRegistry
    return not (type(registry) == "table" and registry:OwnsKnownRecipeTint())
end

-- 悬浮提示只在第一次需要扫描时创建，之后复用；关闭功能后不再被使用。
function Service:Tip()
    local tip = _G[TIP_NAME]
    if not tip and self.module then
        tip = self.module:CreateFrame("GameTooltip", TIP_NAME, nil, "GameTooltipTemplate", nil, "known-recipe-scan")
    end
    return tip
end

-- true 已学，false 未学，nil 物品数据还没到（不缓存，下次再判断）。
function Service:Scan(itemID)
    local info = _G.C_Item and _G.C_Item.GetItemInfo or _G.GetItemInfo
    if not info(itemID) then return nil end
    local tip = self:Tip()
    if not tip then return nil end
    tip:SetOwner(_G.UIParent, "ANCHOR_NONE")
    tip:SetHyperlink("item:" .. itemID)
    local known = false
    for line = 2, tip:NumLines() do
        local text = _G[TIP_NAME .. "TextLeft" .. line]
        if text and text:GetText() == _G.ITEM_SPELL_KNOWN then
            known = true
            break
        end
    end
    tip:Hide()
    return known
end

-- item 可以是物品链接或 itemID；非配方直接返回 false，不扫描。
function Service:IsKnown(item)
    if not item then return false end
    local instant = _G.C_Item and _G.C_Item.GetItemInfoInstant or _G.GetItemInfoInstant
    local itemID, _, _, _, _, class = instant(item)
    if not itemID or class ~= RECIPE_CLASS then return false end
    local cache = self.cache
    local known = cache[itemID]
    if known == nil then
        known = self:Scan(itemID)
        if known == nil then return false end
        if self.size >= CACHE_LIMIT then
            wipe(cache)
            self.size = 0
        end
        cache[itemID] = known
        self.size = self.size + 1
    end
    return known
end

function Service:Paint(surface)
    if self.active then surface:Paint(self) end
end

-- 背包变化（买下、学会配方）后重新判断，并刷新已经打开的界面。
function Service:Invalidate()
    if self.size > 0 then
        wipe(self.cache)
        self.size = 0
    end
    for index = 1, #self.surfaces do
        local surface = self.surfaces[index]
        if surface.token and surface:Shown() then self:Paint(surface) end
    end
end

function Service:Sync(module)
    if not self:Wanted(module) then
        self:Shutdown()
        return false
    end
    self.module, self.active = module, true
    for index = 1, #self.surfaces do
        local surface = self.surfaces[index]
        if not surface.token and surface:Ready() then
            surface.token = surface:Hook(module, function() self:Paint(surface) end)
            if surface:Shown() then self:Paint(surface) end
        end
    end
    module:RegisterEvent("BAG_UPDATE_DELAYED", function() self:Invalidate() end)
    return true
end

function Service:Shutdown()
    local module = self.module
    self.active = false
    for index = 1, #self.surfaces do
        local surface = self.surfaces[index]
        if surface.token then
            if module then module:RemoveHook(surface.token) end
            surface.token = nil
            surface:Restore()
        end
    end
    if module then module:UnregisterEvent("BAG_UPDATE_DELAYED") end
    if self.size > 0 then
        wipe(self.cache)
        self.size = 0
    end
end
