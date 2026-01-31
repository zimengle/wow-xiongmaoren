--[[
    GF_Auction Utils Module
    Small, shared helpers (formatting, parsing, safe calls).
]]

local L = GF_Auction_L

local Utils = {}

if GF_Auction and GF_Auction.RegisterModule then
    GF_Auction:RegisterModule("Utils", Utils)
end

local function GetL()
    return L or GF_Auction_L
end

function Utils:SafeCall(fn, ...)
    if type(fn) ~= "function" then
        return false
    end
    return pcall(fn, ...)
end

function Utils:ParseItemID(linkOrID)
    if not linkOrID then return nil end
    if type(linkOrID) == "number" then return linkOrID end
    if type(linkOrID) ~= "string" then return nil end

    local id = string.match(linkOrID, "item:(%d+)")
    if id then return tonumber(id) end
    return tonumber(linkOrID)
end

function Utils:TimeAgo(ts, LFn)
    if not ts then return nil end
    local lf = LFn or GetL()
    local ageSec = time() - ts
    if ageSec < 0 then ageSec = 0 end

    if ageSec < 60 then
        return {
            ageSec = ageSec,
            isJustNow = true,
            unit = "now",
            value = 0,
            text = lf("UI_TIME_JUST_NOW"),
        }
    elseif ageSec < 3600 then
        local v = math.floor(ageSec / 60)
        return {
            ageSec = ageSec,
            isJustNow = false,
            unit = "minute",
            value = v,
            text = string.format(lf("UI_TIME_MINUTES_AGO"), v),
        }
    elseif ageSec < 86400 then
        local v = math.floor(ageSec / 3600)
        return {
            ageSec = ageSec,
            isJustNow = false,
            unit = "hour",
            value = v,
            text = string.format(lf("UI_TIME_HOURS_AGO"), v),
        }
    else
        local v = math.floor(ageSec / 86400)
        return {
            ageSec = ageSec,
            isJustNow = false,
            unit = "day",
            value = v,
            text = string.format(lf("UI_TIME_DAYS_AGO"), v),
        }
    end
end

function Utils:TimeColor(ageSec)
    ageSec = tonumber(ageSec) or 0
    if ageSec < 0 then ageSec = 0 end

    if ageSec < 300 then
        return 0.2, 1.0, 0.2
    end
    if ageSec < 3600 then
        return 0.4, 0.95, 0.4
    end

    if ageSec < 6 * 3600 then
        return 1.0, 0.9, 0.3
    end
    if ageSec < 24 * 3600 then
        return 1.0, 0.6, 0.2
    end

    return 1.0, 0.25, 0.25
end

function Utils:FormatTimeAgo(ts, LFn)
    local info = self:TimeAgo(ts, LFn)
    return info and info.text or nil
end

function Utils:FormatMoneyText(copper, LFn)
    local lf = LFn or GetL()
    local v = tonumber(copper or 0) or 0
    if v < 0 then v = 0 end
    local g = math.floor(v / 10000)
    local s = math.floor((v % 10000) / 100)
    local c = v % 100
    return string.format(
        "|cffffffff%d|r|cffffd700%s|r |cffffffff%02d|r|cffc7c7cf %s|r |cffffffff%02d|r|cffeda55f %s|r",
        g, lf("UI_MONEY_GOLD"), s, lf("UI_MONEY_SILVER"), c, lf("UI_MONEY_COPPER")
    )
end


