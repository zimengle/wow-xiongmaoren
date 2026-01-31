--[[
    GF_Auction Tooltip Module
    Shows latest cached price in GameTooltip / ItemRefTooltip.
]]

local L = GF_Auction_L
local Utils = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Utils")

local Tooltip = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("Tooltip", Tooltip)
end

local function AddCachedPriceLine(tooltipFrame)
    if not tooltipFrame then return end
    if not tooltipFrame.GetItem then return end

    local _, link = tooltipFrame:GetItem()
    if not link then return end

    local itemID = (Utils and Utils.ParseItemID and Utils:ParseItemID(link)) or nil
    if not itemID then return end

    if tooltipFrame.__GFA_LastItemID ~= itemID then
        tooltipFrame.__GFA_LastItemID = itemID
        tooltipFrame.__GFA_LatestPriceAdded = nil
    end

    if tooltipFrame.__GFA_LatestPriceAdded then return end

    local Database = GF_Auction and GF_Auction.GetModule and GF_Auction:GetModule("Database")
    if not Database then return end

    local settings = Database.GetSettings and Database:GetSettings()
    if settings and settings.showTooltip == false then
        return
    end

    local unitPrice = nil
    local ts = nil
    local stats = Database:GetPriceStats(itemID)
    if stats and stats.minUnit and stats.minUnit > 0 then
        unitPrice = stats.minUnit
        ts = stats.time
    else
        local realmData = Database.GetRealmData and Database:GetRealmData()
        local list = realmData and realmData.priceHistory and realmData.priceHistory[itemID]
        local last = list and list[#list]
        if last then
            local ss = tonumber(last.stackSize) or 1
            if ss <= 0 then ss = 1 end
            unitPrice = tonumber(last.unitPrice) or math.floor((tonumber(last.price) or 0) / ss)
            ts = last.time
        end
    end

    if not unitPrice or unitPrice <= 0 then return end

    local priceText = (Utils and Utils.FormatMoneyText and Utils:FormatMoneyText(unitPrice, L)) or tostring(unitPrice or 0)
    local tInfo = (Utils and Utils.TimeAgo and ts and Utils:TimeAgo(ts, L)) or nil
    local iconTag = "|TInterface\\AddOns\\GF_Auction\\Media\\icon.tga:12:12:0:0|t "

    local leftText = iconTag.."|cff00ff00"..L("UI_LATEST_PRICE").."|r"
    local rightText = priceText
    if tInfo and not tInfo.isJustNow and tInfo.text and tInfo.text ~= "" then
        rightText = rightText.."  |cff808080("..tInfo.text..")|r"
    end

    tooltipFrame:AddDoubleLine(leftText, rightText)

    tooltipFrame.__GFA_LatestPriceAdded = true
end

local function ClearFlag(tooltipFrame)
    if tooltipFrame then
        tooltipFrame.__GFA_LatestPriceAdded = nil
        tooltipFrame.__GFA_LastItemID = nil
    end
end

function Tooltip:Initialize()
    local function hookOne(tt)
        if not tt or tt.__GFA_Hooked then return end
        tt:HookScript("OnTooltipSetItem", function(self)
            AddCachedPriceLine(self)
        end)
        tt:HookScript("OnTooltipCleared", function(self)
            ClearFlag(self)
        end)
        tt.__GFA_Hooked = true
    end

    if _G.GameTooltip then hookOne(_G.GameTooltip) end
    if _G.ItemRefTooltip then hookOne(_G.ItemRefTooltip) end

    return true
end


