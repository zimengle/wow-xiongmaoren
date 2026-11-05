-- 文件职责：独占 Retail 货币、满级、战斗和 WorldMap attachment API。
-- 不负责：差异 DB、Runtime 事件、显示选择或 Frame 创建。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("CurrencyBar")) then return end

local Map = ns.WorldMapAttachment
if type(Map) ~= "table" then error("CurrencyBar Adapter requires WorldMapAttachment", 2) end

local Adapter = { family = "retail", buildId = "retail", targetAddon = "Blizzard_WorldMap" }

local function Clamp(value, low, high, fallback)
    value = tonumber(value) or fallback
    if value < low then return low end
    if value > high then return high end
    return value
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() or false
end

function Adapter:IsWorldMapAvailable() return Map:IsAvailable() end
function Adapter:IsWorldMapVisible() return Map:IsVisible() end
function Adapter:ResolveAttachment() return Map:Resolve() end
function Adapter:SubscribeMapVisibility(owner, callback) return Map:Subscribe(owner, callback) end

function Adapter:IsPlayerAtMaxLevel(defaultMaxLevel)
    local level = type(_G.UnitLevel) == "function" and tonumber(_G.UnitLevel("player")) or 0
    local maximum = type(_G.GetMaxPlayerLevel) == "function" and tonumber(_G.GetMaxPlayerLevel()) or nil
    if not maximum or maximum <= 0 then maximum = tonumber(defaultMaxLevel) or 90 end
    return level >= maximum
end

function Adapter:GetCurrencyInfo(currencyID)
    local api = _G.C_CurrencyInfo
    if type(api) ~= "table" or type(api.GetCurrencyInfo) ~= "function" then return nil end
    local read, info = pcall(api.GetCurrencyInfo, currencyID)
    if not read or type(info) ~= "table" then return nil end
    local quantity = math.max(0, math.floor(tonumber(info.quantity) or 0))
    local text = tostring(quantity)
    if type(_G.BreakUpLargeNumbers) == "function" then
        local formatted, value = pcall(_G.BreakUpLargeNumbers, quantity)
        if formatted and value ~= nil then text = tostring(value) end
    end
    return {
        currencyID = currencyID,
        quantity = quantity,
        quantityText = text,
        iconFileID = info.iconFileID,
        maxQuantity = tonumber(info.maxQuantity) or 0,
        totalEarned = tonumber(info.totalEarned) or quantity,
        useTotalEarnedForMaxQty = info.useTotalEarnedForMaxQty == true,
    }
end

function Adapter:ApplyAttachment(frame, profile, data)
    if not frame then return false end
    local parent, anchor = self:ResolveAttachment()
    if not (parent and anchor) then return false end
    local alignment = profile.alignment == "LEFT" and "LEFT" or "RIGHT"
    local defaults = data.layout.defaultOffsets[alignment]
    local custom = profile.customPosition == true
    local x = custom and tonumber(profile.positionX) or defaults.x
    local y = custom and tonumber(profile.positionY) or defaults.y
    frame:SetParent(parent)
    local parentLevel = type(parent.GetFrameLevel) == "function" and parent:GetFrameLevel() or 0
    local anchorLevel = type(anchor.GetFrameLevel) == "function" and anchor:GetFrameLevel() or 0
    frame:SetFrameLevel(math.max(parentLevel, anchorLevel) + 20)
    frame:ClearAllPoints()
    frame:SetPoint("BOTTOM" .. alignment, anchor, "BOTTOM" .. alignment, x, y)
    frame:SetClampedToScreen(false)
    return true
end

function Adapter:CaptureOffset(frame, profile)
    local parent, anchor = self:ResolveAttachment()
    if not (frame and parent and anchor) then return nil, nil end
    local alignment = profile.alignment == "LEFT" and "LEFT" or "RIGHT"
    local horizontal = alignment == "RIGHT" and "GetRight" or "GetLeft"
    if type(frame[horizontal]) ~= "function" or type(anchor[horizontal]) ~= "function"
        or type(frame.GetBottom) ~= "function" or type(anchor.GetBottom) ~= "function"
        or type(frame.GetEffectiveScale) ~= "function" or type(anchor.GetEffectiveScale) ~= "function"
        or type(parent.GetEffectiveScale) ~= "function" then return nil, nil end
    local frameX, anchorX = frame[horizontal](frame), anchor[horizontal](anchor)
    local frameY, anchorY = frame:GetBottom(), anchor:GetBottom()
    local frameScale, anchorScale = frame:GetEffectiveScale(), anchor:GetEffectiveScale()
    local targetScale = parent:GetEffectiveScale() * (type(frame.GetScale) == "function" and frame:GetScale() or 1)
    if not (frameX and anchorX and frameY and anchorY and frameScale and anchorScale
        and targetScale and targetScale > 0) then return nil, nil end
    return (frameX * frameScale - anchorX * anchorScale) / targetScale,
        (frameY * frameScale - anchorY * anchorScale) / targetScale
end

function Adapter:ClampScale(value, data)
    local layout = data.layout
    return Clamp(value, layout.minScale, layout.maxScale, layout.defaultScale)
end

ns.CurrencyBarAdapter = Adapter
ns.CurrencyBarRetailAdapter = Adapter
