function EasyAuction_ShowChart(itemName)
    -- 使用全局数据库引用
    local EasyAuctionDB = _G.EasyAuctionDB
    if not EasyAuctionDB then
        print("|cff00ff00[EasyAuction]|r 数据库未初始化。")
        return
    end
    EasyAuctionDB.DailyMinPrice = EasyAuctionDB.DailyMinPrice or {}
    EasyAuctionDB.PriceHistory = EasyAuctionDB.PriceHistory or {}
    EasyAuctionDB.HourlyMinPrice = EasyAuctionDB.HourlyMinPrice or {}

    local itemID = tostring(itemName):match(":(%d+)$") or ""
    itemID = tonumber(itemID) or ""
    local dailyArray = EasyAuctionDB.DailyMinPrice[itemName]
    if not dailyArray or #dailyArray == 0 then
        if EasyAuction_ChartFrame and EasyAuction_ChartFrame:IsShown() then
            EasyAuction_ChartFrame:Hide()
        end
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    -- 辅助函数：查找某天的数据
    local function findDailyByDate(date)
        for _, v in ipairs(dailyArray) do
            if v[1] == date then return v end
        end
        return nil
    end

    -- 找到最后一个有数据的日期
    local lastDay
    for _, v in ipairs(dailyArray) do
        if v[1] and v[2] and v[2] > 0 then
            if not lastDay or v[1] > lastDay then lastDay = v[1] end
        end
    end
    if not lastDay then
        print("|cff00ff00[EasyAuction]|r 暂无此物品每日价格数据。")
        return
    end

    local y, m, d = lastDay:match("(%d+)-(%d+)-(%d+)")
    local axisRight = time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })

    local points, countPoints, totalCountPoints, days = {}, {}, {}, {}
    for i = 29, 0, -1 do
        local t = date("%Y-%m-%d", axisRight - i * 86400)
        table.insert(days, t)
        local v = findDailyByDate(t)
        if v then
            table.insert(points, v[2] or 0)          -- unit
            table.insert(countPoints, v[3] or 0)     -- count
            table.insert(totalCountPoints, v[6] or 0)-- totalCount
        else
            table.insert(points, 0)
            table.insert(countPoints, 0)
            table.insert(totalCountPoints, 0)
        end
    end

    local chartFrame = EasyAuction_ChartFrame
    if not chartFrame then
        chartFrame = CreateFrame("Frame", "EasyAuction_ChartFrame", UIParent, "BackdropTemplate")
        chartFrame:SetSize(580, 420)
        chartFrame:SetPoint("CENTER")
        chartFrame:SetFrameStrata("FULLSCREEN_DIALOG")
        chartFrame:SetMovable(true)
        chartFrame:EnableMouse(true)
        chartFrame:EnableKeyboard(true)
        chartFrame:RegisterForDrag("LeftButton")
        chartFrame:SetScript("OnDragStart", chartFrame.StartMoving)
        chartFrame:SetScript("OnDragStop", chartFrame.StopMovingOrSizing)
        chartFrame:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32,
            edgeSize = 18,
            insets = { left = 6, right = 6, top = 6, bottom = 6 }
        })
        chartFrame:SetBackdropColor(0.10, 0.10, 0.13, 0.97)
        chartFrame:SetBackdropBorderColor(0.7, 0.6, 1, 1)
        local closeBtn = CreateFrame("Button", nil, chartFrame, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", chartFrame, "TOPRIGHT", -8, -8)
        closeBtn:SetSize(26, 26)
        closeBtn:SetScript("OnClick", function() chartFrame:Hide() end)
        tinsert(UISpecialFrames, "EasyAuction_ChartFrame")

        chartFrame.headerLine1 = chartFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        chartFrame.headerLine1:SetPoint("TOPLEFT", 18, -14)
        chartFrame.headerLine1:SetJustifyH("LEFT")

        chartFrame.headerLine2 = chartFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        chartFrame.headerLine2:SetPoint("TOPLEFT", chartFrame.headerLine1, "BOTTOMLEFT", 0, -8)
        chartFrame.headerLine2:SetJustifyH("LEFT")

        local underline = chartFrame:CreateTexture(nil, "OVERLAY")
        underline:SetColorTexture(0.7, 0.6, 1, 0.38)
        underline:SetHeight(2)
        underline:SetPoint("TOPLEFT", 20, -64)
        underline:SetPoint("TOPRIGHT", -20, -64)

        chartFrame.headerRow1 = CreateFrame("Frame", nil, chartFrame)
        chartFrame.headerRow1:SetPoint("TOPLEFT", chartFrame.headerLine2, "BOTTOMLEFT", -15, -8)
        chartFrame.headerRow1:SetPoint("TOPRIGHT", chartFrame, "TOPRIGHT", -18, 0)
        chartFrame.headerRow1:SetHeight(20)

        chartFrame.headerRow2 = CreateFrame("Frame", nil, chartFrame)
        chartFrame.headerRow2:SetPoint("TOPLEFT", chartFrame.headerRow1, "BOTTOMLEFT", 0, -8)
        chartFrame.headerRow2:SetPoint("TOPRIGHT", chartFrame, "TOPRIGHT", -18, 0)
        chartFrame.headerRow2:SetHeight(20)

        local colWidths = {60, 100, 60, 100, 60, 100}
        local rowFrames = {chartFrame.headerRow1, chartFrame.headerRow2}
        for rowIndex, rowFrame in ipairs(rowFrames) do
            rowFrame.cols = {}
            for colIndex = 1, 6 do
                local col = CreateFrame("Frame", nil, rowFrame)
                if colIndex == 1 then
                    col:SetPoint("TOPLEFT", rowFrame, "TOPLEFT", 0, 0)
                else
                    col:SetPoint("TOPLEFT", rowFrame.cols[colIndex-1], "TOPRIGHT", 5, 0)
                end
                col:SetWidth(colWidths[colIndex])
                col:SetHeight(rowFrame:GetHeight())
                col.text = col:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                col.text:SetAllPoints(col)
                col.text:SetJustifyH("RIGHT")
                rowFrame.cols[colIndex] = col
            end
        end

        chartFrame.pages = {}
        for i = 1, 2 do
            local page = CreateFrame("Frame", nil, chartFrame)
            page:SetPoint("TOPLEFT", chartFrame, "TOPLEFT", 5, -115)
            page:SetPoint("BOTTOMRIGHT", chartFrame, "BOTTOMRIGHT", -5, 8)
            page:Hide()
            chartFrame.pages[i] = page
        end

        chartFrame.tabs = {}
        local tabNames = {"日K线", "月K线"}
        local tabIcons = {
            "Interface\\Common\\UI-Searchbox-Icon",
            "Interface\\Common\\Calendar"
        }
        for i, name in ipairs(tabNames) do
            if not chartFrame.tabs[i] then
                local tab = CreateFrame("Button", nil, chartFrame)
                tab:SetID(i)
                tab:SetSize(80, 24)
                if i == 1 then
                    tab:SetPoint("TOPLEFT", chartFrame, "TOPLEFT", 10, -240)
                else
                    tab:SetPoint("LEFT", chartFrame.tabs[i-1], "RIGHT", 0, 0)
                end
                tab.icon = tab:CreateTexture(nil, "ARTWORK")
                tab.icon:SetTexture(tabIcons[i] or "Interface\\Common\\UI-Searchbox-Icon")
                tab.icon:SetSize(16, 16)
                tab.icon:SetPoint("LEFT", tab, "LEFT", 6, 0)
                tab.text = tab:CreateFontString(nil, "ARTWORK", "GameFontNormal")
                tab.text:SetPoint("LEFT", tab.icon, "RIGHT", 4, 0)
                tab.text:SetText(name)
                tab.text:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 13, "")
                tab:SetNormalFontObject(GameFontNormal)
                tab:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
                tab.bgHighlight = tab:CreateTexture(nil, "BACKGROUND")
                tab.bgHighlight:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
                tab.bgHighlight:SetAllPoints()
                tab.bgHighlight:SetBlendMode("ADD")
                tab.bgHighlight:Hide()
                tab:SetScript("OnClick", function(self)
                    for j, t in ipairs(chartFrame.tabs) do
                        if j == i then
                            t:Disable()
                            t.bgHighlight:Show()
                            chartFrame.pages[j]:Show()
                            local chartType = (j == 1) and "daily" or "monthly"
                            chartFrame.currentChartType = chartType
                            if chartFrame.UpdateTrendAnalysis then
                                chartFrame.UpdateTrendAnalysis(chartType)
                            end
                        else
                            t:Enable()
                            t.bgHighlight:Hide()
                            chartFrame.pages[j]:Hide()
                        end
                    end
                end)
                chartFrame.tabs[i] = tab
            end
            chartFrame.tabs[i].text:SetText(name)
        end
        chartFrame.tabs[1]:Disable()
        chartFrame.tabs[1].bgHighlight:Show()
        chartFrame.pages[1]:Show()
        for i = 2, #chartFrame.tabs do
            chartFrame.tabs[i]:Enable()
            chartFrame.tabs[i].bgHighlight:Hide()
            chartFrame.pages[i]:Hide()
        end
    end
    local f = chartFrame

    local latestPrice = points[30] or 0
    local today = days[30]

    local openPrice = 0
    if EasyAuctionDB.HourlyMinPrice and EasyAuctionDB.HourlyMinPrice[itemName] then
        for _, v in ipairs(EasyAuctionDB.HourlyMinPrice[itemName]) do
            local hourNum = tonumber(v[1])
            local price = v[2]
            local count = v[3]
            if hourNum and hourNum >= 0 and hourNum <= 23 and price and price > 0 and count and count > 0 then
                if v.t and date("%Y-%m-%d", v.t) == today then
                    openPrice = price
                    break
                elseif not v.t then
                    openPrice = price
                    break
                end
            end
        end
    end
    if openPrice == 0 then
        openPrice = points[29] or points[30] or 0
    end
    local todayDaily = findDailyByDate(today)
    local todayHigh = todayDaily and (todayDaily[5] or todayDaily[2] or 0) or 0
    local todayLow = todayDaily and (todayDaily[4] or todayDaily[2] or 0) or 0
    local todayTotalValue = todayDaily and ((todayDaily[6] or 0) * (todayDaily[2] or 0)) or 0

    local hist_max, hist_min = 0, nil
    for _, v in ipairs(dailyArray) do
        local current_max = v[5] or v[2]
        local current_min = v[4] or v[2]
        if current_max and current_max > 0 then
            if not hist_max or current_max > hist_max then hist_max = current_max end
        end
        if current_min and current_min > 0 then
            if not hist_min or current_min < hist_min then hist_min = current_min end
        end
    end
    local realName = tostring(itemName):match("^(.-):%d+$") or itemName

    local changePercent = 0
    if openPrice > 0 then
        changePercent = ((latestPrice - openPrice) / openPrice) * 100
    end

    local colorCode = "|cffff4040"
    if changePercent > 0 then
        colorCode = "|cff00ff00"
    end

    local percentText
    if changePercent >= 0 then
        percentText = string.format("+%.2f%%", changePercent)
    else
        percentText = string.format("%.2f%%", changePercent)
    end

    f.headerLine1:SetText(string.format("|cffffd700%s|r |cff888888(ID:%s)|r",realName, itemID))
    f.headerLine2:SetText(string.format("|cffff4040%s|r", FormatGold(latestPrice, 12)))
    f.headerLine2:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 24, "")

    if not f.percentText then
        f.percentText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        f.percentText:SetPoint("LEFT", f.headerLine2, "RIGHT", 10, 0)
        f.percentText:SetJustifyH("LEFT")
    end
    f.percentText:SetText(string.format("%s%s|r", colorCode, percentText))
    f.percentText:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 16, "")
    f.percentText:Show()

    f.headerRow1.cols[1].text:SetText("今开价：")
    f.headerRow1.cols[2].text:SetText(string.format("|cffa0a0a0%s|r", FormatGold(openPrice, 12)))
    f.headerRow1.cols[3].text:SetText("今最高价：")
    f.headerRow1.cols[4].text:SetText(string.format("|cff00c000%s|r", FormatGold(todayHigh, 12)))
    f.headerRow1.cols[5].text:SetText("历史最高：")
    f.headerRow1.cols[6].text:SetText(string.format("|cff00ff00%s|r", FormatGold(hist_max or 0, 12)))

    f.headerRow2.cols[1].text:SetText("总市值：")
    f.headerRow2.cols[2].text:SetText(string.format("|cff00c0ff%s|r", FormatGold(todayTotalValue, 12)))
    f.headerRow2.cols[3].text:SetText("今最低价：")
    f.headerRow2.cols[4].text:SetText(string.format("|cffff4040%s|r", FormatGold(todayLow, 12)))
    f.headerRow2.cols[5].text:SetText("历史最低：")
    f.headerRow2.cols[6].text:SetText(string.format("|cffff2020%s|r", FormatGold(hist_min or 0, 12)))

    f.headerLine1:Show()
    f.headerLine2:Show()

    local underline2 = chartFrame:CreateTexture(nil, "OVERLAY")
    underline2:SetColorTexture(0.7, 0.6, 1, 0.38)
    underline2:SetHeight(2)
    underline2:SetPoint("TOPLEFT", 20, -122)
    underline2:SetPoint("TOPRIGHT", -20, -122)

    -- 小时图
    local hourPoints, hourCounts = {}, {}
    local nowDay = days[30]
    local tmpPrice = {}
    local tmpCount = {}
    for i = 0, 23 do
        tmpPrice[i] = 0
        tmpCount[i] = 0
    end

    local hasHourlyData = false
    if EasyAuctionDB.HourlyMinPrice and EasyAuctionDB.HourlyMinPrice[itemName] then
        for _, v in ipairs(EasyAuctionDB.HourlyMinPrice[itemName]) do
            local hourNum = tonumber(v[1])
            if hourNum and hourNum >= 0 and hourNum <= 23 and v[2] and v[2] > 0 then
                tmpPrice[hourNum] = tmpPrice[hourNum] or 0
                tmpCount[hourNum] = tmpCount[hourNum] or 0

                if tmpPrice[hourNum] == 0 or v[2] < tmpPrice[hourNum] then
                    tmpPrice[hourNum] = v[2]
                end
                tmpCount[hourNum] = tmpCount[hourNum] + (v[4] or v[3] or 1)
                hasHourlyData = true
            end
        end
    end

    if not hasHourlyData and EasyAuctionDB.PriceHistory[itemName] then
        for _, v in ipairs(EasyAuctionDB.PriceHistory[itemName]) do
            if v.t and date("%Y-%m-%d", v.t) == nowDay then
                local h = date("%H", v.t)
                local hourNum = tonumber(h)
                if hourNum and hourNum >=0 and hourNum <=23 and v.unit and v.unit >0 then
                    if tmpPrice[hourNum] ==0 or v.unit < tmpPrice[hourNum] then
                        tmpPrice[hourNum] = v.unit
                    end
                    tmpCount[hourNum] = tmpCount[hourNum] + (v.count or 1)
                end
            end
        end
    end

    for hourNum = 0, 23 do
        hourPoints[hourNum+1] = tmpPrice[hourNum] or 0
        hourCounts[hourNum+1] = tmpCount[hourNum] or 0
    end

    if not f.trendText then
        f.trendText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        f.trendText:SetPoint("BOTTOM", chartFrame.headerRow2, "BOTTOM", -15, -90)
        f.trendText:SetWidth(500)
        f.trendText:SetJustifyH("LEFT")
    end

    local function UpdateTrendAnalysis(chartType)
        local dataPoints, trendStr, advices
        if chartType == "daily" then
            dataPoints = hourPoints or {}
        else
            dataPoints = points or {}
        end

        if not dataPoints or type(dataPoints) ~= "table" then
            dataPoints = {}
        end

        local validCount = 0
        local validPoints = {}
        for i = 1, #dataPoints do
            if dataPoints[i] > 0 then
                validCount = validCount + 1
                table.insert(validPoints, dataPoints[i])
            end
        end

        trendStr = ""
        advices = {}

        if validCount < 3 then
            trendStr = "暂无足够数据分析走势。"
            advices = {}
        else
            local first = validPoints[1]
            local last = validPoints[#validPoints]

            if first and last then
                local pct = (last - first) / first
                local upThreshold = (chartType == "daily") and 0.05 or 0.10
                local downThreshold = (chartType == "daily") and -0.05 or -0.10

                if pct > upThreshold then
                    trendStr = "|cff00ff00近期价格呈上涨趋势|r，"
                elseif pct < downThreshold then
                    trendStr = "|cffff2020近期价格呈下降趋势|r，"
                else
                    trendStr = "|cffffff00近期价格整体平稳|r，"
                end

                local minV, maxV = first, first
                for _, p in ipairs(validPoints) do
                    if p < minV then minV = p end
                    if p > maxV then maxV = p end
                end
                local volatility = (maxV - minV) / ((maxV + minV) / 2)
                if chartType == "daily" then
                    if volatility > 0.3 then
                        trendStr = trendStr .. "日内价格波动剧烈，需密切关注市场变化。"
                    elseif volatility > 0.15 then
                        trendStr = trendStr .. "日内价格波动较大，操作需谨慎。"
                    elseif volatility < 0.05 then
                        trendStr = trendStr .. "日内价格波澜不惊，市场交易清淡。"
                    else
                        trendStr = trendStr .. "日内价格波动适中。"
                    end
                else
                    if volatility > 0.5 then
                        trendStr = trendStr .. "区间极大，行情如过山车，需关注极端波动风险。"
                    elseif volatility > 0.25 then
                        trendStr = trendStr .. "价格波动较大，操作需谨慎。"
                    elseif volatility < 0.08 then
                        trendStr = trendStr .. "波澜不惊，主力可能蓄势待发。"
                    else
                        trendStr = trendStr .. "波动适中。"
                    end
                end
            else
                trendStr = "暂无足够数据分析走势。"
            end

            local ma_short, ma_long
            if chartType == "daily" then
                if #validPoints >= 4 then
                    local sum = 0
                    for i = math.max(1, #validPoints - 3), #validPoints do
                        sum = sum + validPoints[i]
                    end
                    ma_long = sum / 4
                end
                if #validPoints >= 2 then
                    local sum = 0
                    for i = #validPoints - 1, #validPoints do
                        sum = sum + validPoints[i]
                    end
                    ma_short = sum / 2
                end
            else
                if #validPoints >= 7 then
                    local sum = 0
                    for i = math.max(1, #validPoints - 6), #validPoints do
                        sum = sum + validPoints[i]
                    end
                    ma_long = sum / 7
                end
                if #validPoints >= 3 then
                    local sum = 0
                    for i = #validPoints - 2, #validPoints do
                        sum = sum + validPoints[i]
                    end
                    ma_short = sum / 3
                end
            end

            if ma_long and last then
                if chartType == "daily" then
                    if last > ma_long * 1.05 then
                        table.insert(advices, "|cff00ff00多头走强，日内短线有上涨动能，可关注买入机会。|r")
                    elseif last < ma_long * 0.95 then
                        table.insert(advices, "|cffff2020空头占优，日内短线或有下跌风险，需谨慎操作。|r")
                    elseif math.abs(last - ma_long) < ma_long * 0.02 then
                        table.insert(advices, "|cffffff00价格贴近均线，日内行情或面临方向选择。|r")
                    end
                else
                    if last > ma_long * 1.10 then
                        table.insert(advices, "|cff00ff00多头排列，强势上攻，短线有资金推动迹象。|r")
                    elseif last < ma_long * 0.90 then
                        table.insert(advices, "|cffff2020空头陷阱格局，短线仍需防范下行风险。|r")
                    elseif math.abs(last - ma_long) < ma_long * 0.03 then
                        table.insert(advices, "|cffffff00均线粘合，行情或将变盘，静待方向选择。|r")
                    end
                end
            end

            local up_count, down_count = 0, 0
            for i = 2, #validPoints do
                if validPoints[i] > validPoints[i - 1] then
                    up_count = up_count + 1
                    down_count = 0
                elseif validPoints[i] < validPoints[i - 1] then
                    down_count = down_count + 1
                    up_count = 0
                else
                    up_count = 0
                    down_count = 0
                end
            end

            if chartType == "daily" then
                if up_count >= 2 then
                    table.insert(advices, "连续数小时上涨，短线或有获利回吐，谨防追高。")
                elseif down_count >= 2 then
                    table.insert(advices, "连续数小时下跌，或有短期反弹机会，可关注抄底。")
                end
            else
                if up_count >= 3 then
                    table.insert(advices, "连续多日上涨，短线或有获利回吐压力，谨防追高。")
                elseif down_count >= 3 then
                    table.insert(advices, "连续下跌，疑似主力吸筹，短线可关注反弹机遇。")
                end
            end

            if last and #validPoints >= 5 then
                local minV, maxV
                minV, maxV = validPoints[1], validPoints[1]
                for _, p in ipairs(validPoints) do
                    if p < minV then minV = p end
                    if p > maxV then maxV = p end
                end
                if last == maxV and maxV > minV * (chartType == "daily" and 1.15 or 1.30) then
                    table.insert(advices, "|cffffd700刚突破近期新高，上涨动能增强，可适当关注。|r")
                elseif last == minV and maxV > minV * (chartType == "daily" and 1.15 or 1.30) then
                    table.insert(advices, "|cffff2020跌至新低，或有抄底资金介入，注意风险控制。|r")
                end
            end

            if #validPoints >= 5 then
                local recent_period = (chartType == "daily") and 4 or 9
                local recent_max, recent_min = 0, 1e10
                for i = math.max(1, #validPoints - recent_period), #validPoints do
                    local p = validPoints[i]
                    if p > recent_max then recent_max = p end
                    if p < recent_min then recent_min = p end
                end
                local btop = (last >= recent_max and recent_max > 0)
                local blow = (last <= recent_min and recent_min < 1e10)
                if chartType == "daily" then
                    if btop then table.insert(advices, "|cff00ff00价格突破近期小时高点，多头动能增强，关注短期表现。|r") end
                    if blow then table.insert(advices, "|cffff2020价格跌破近期小时低点，弱势明显，注意风险控制。|r") end
                else
                    if btop then table.insert(advices, "|cff00ff00价格突破近期高点，多头动能增强，关注强势表现。|r") end
                    if blow then table.insert(advices, "|cffff2020价格跌破近期低点，弱势明显，注意风险控制。|r") end
                end
            end

            if #advices == 0 then
                if chartType == "daily" then
                    table.insert(advices, "日内暂无明显趋势，建议观望为主。")
                else
                    table.insert(advices, "暂无明显主力信号，建议观望为主。")
                end
            end
        end

        local typeText = (chartType == "daily") and "|cffffff00日K线走势分析：\n|r" or "|cffffff00月K线走势分析：|r"
        f.trendText:SetText(typeText .. trendStr .. (#advices > 0 and "\n" .. table.concat(advices, "\n") or ""))
        f.trendText:Show()
    end

    f.UpdateTrendAnalysis = UpdateTrendAnalysis
    f.currentChartType = "daily"
    f.UpdateTrendAnalysis(f.currentChartType)

    -- 日K线
    local chartLeft, chartBottom = 60, 25
    local chartWidth, chartHeight = 480, 110
    local tab1 = f.pages[1]
    if not tab1.inited then
        tab1.yLabels, tab1.yLines, tab1.xLabels = {}, {}, {}
        tab1.lines, tab1.dots, tab1.dotFrames, tab1.barRects = {}, {}, {}, {}
        tab1.inited = true
    end
    local yMax = 1
    for i = 1, 24 do if hourPoints[i] > yMax then yMax = hourPoints[i] end end
    if yMax == 0 then yMax = 1 end
    for i = 0, 4 do
        local y = chartBottom + i * chartHeight / 4
        if not tab1.yLabels[i] then
            tab1.yLabels[i] = tab1:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            tab1.yLabels[i]:SetJustifyH("RIGHT")
            tab1.yLabels[i]:SetWidth(50)
        end
        tab1.yLabels[i]:SetPoint("RIGHT", tab1, "BOTTOMLEFT", chartLeft - 4, y)
        local goldValue = (yMax * i / 4) / 10000
        tab1.yLabels[i]:SetText(string.format("%.2f", goldValue))
        if not tab1.yLines[i] then
            tab1.yLines[i] = tab1:CreateTexture()
            tab1.yLines[i]:SetColorTexture(1, 1, 1, 0.10)
            tab1.yLines[i]:SetHeight(1)
        end
        tab1.yLines[i]:SetPoint("LEFT", tab1, "BOTTOMLEFT", chartLeft, y)
        tab1.yLines[i]:SetPoint("RIGHT", tab1, "BOTTOMLEFT", chartLeft + chartWidth, y)
        tab1.yLines[i]:Show()
    end

    for i = 1, 24 do
        if not tab1.xLabels[i] then
            tab1.xLabels[i] = tab1:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            tab1.xLabels[i]:SetWidth(23)
            tab1.xLabels[i]:SetJustifyH("CENTER")
            local x = chartLeft + (i - 1) * chartWidth / 23
            tab1.xLabels[i]:SetPoint("BOTTOM", tab1, "BOTTOMLEFT", x, chartBottom - 18)
        end
        tab1.xLabels[i]:SetText(i)
    end

    local dotSize = 18
    for i = 1, 24 do
        if not tab1.dotFrames[i] then
            local frame = CreateFrame("Frame", nil, tab1)
            frame:SetSize(dotSize * 1.2, dotSize * 1.2)
            frame:SetFrameStrata("FULLSCREEN_DIALOG")
            frame:SetScript("OnEnter", function(self)
                local idx = self.idx
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(self.nowDay .. " " .. (idx-1) .. ":00 价格")
                local price = self.hourPoints[idx]
                if price and price > 0 then
                    GameTooltip:AddLine("|cffffd700最新价：|r" .. FormatGold(price))
                else
                    GameTooltip:AddLine("无数据")
                end
                GameTooltip:Show()
            end)
            frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
            tab1.dotFrames[i] = frame
        end

        local x = chartLeft + (i - 1) * chartWidth / 23
        local y = chartBottom + (hourPoints[i] / yMax) * chartHeight
        tab1.dotFrames[i]:SetPoint("CENTER", tab1, "BOTTOMLEFT", x, y)
        tab1.dotFrames[i].idx = i
        tab1.dotFrames[i].hourPoints = hourPoints
        tab1.dotFrames[i].nowDay = nowDay

        if not tab1.dots[i] then
            tab1.dots[i] = tab1.dotFrames[i]:CreateTexture()
            tab1.dots[i]:SetDrawLayer("ARTWORK", 3)
        end

        tab1.dots[i]:SetPoint("CENTER")
        if hourPoints[i] > 0 then
            local isLastValid = true
            for j = i + 1, 24 do
                if hourPoints[j] > 0 then
                    isLastValid = false
                    break
                end
            end
            if isLastValid then
                tab1.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Green")
            else
                tab1.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Yellow")
            end
            tab1.dots[i]:SetSize(dotSize, dotSize)
            tab1.dots[i]:Show()
            tab1.dotFrames[i]:Show()
        else
            tab1.dots[i]:Hide()
            tab1.dotFrames[i]:Hide()
        end
    end

    for i = 25, #tab1.dots do if tab1.dots[i] then tab1.dots[i]:Hide() end end
    for i = 25, #tab1.dotFrames do if tab1.dotFrames[i] then tab1.dotFrames[i]:Hide() end end

    local validIndices = {}
    for i = 1, 24 do if hourPoints[i] > 0 then table.insert(validIndices, i) end end
    local lineIdx = 1
    for k = 1, #validIndices - 1 do
        local i = validIndices[k]
        local j = validIndices[k + 1]
        local x1 = chartLeft + (i - 1) * chartWidth / 23
        local y1 = chartBottom + (hourPoints[i] / yMax) * chartHeight
        local x2 = chartLeft + (j - 1) * chartWidth / 23
        local y2 = chartBottom + (hourPoints[j] / yMax) * chartHeight

        if not tab1.lines[lineIdx] then
            tab1.lines[lineIdx] = tab1:CreateTexture()
            tab1.lines[lineIdx]:SetColorTexture(0, 0.7, 1, 1)
            tab1.lines[lineIdx]:SetDrawLayer("ARTWORK", 2)
        end

        local dx, dy = x2 - x1, y2 - y1
        local len = math.sqrt(dx * dx + dy * dy)
        local angle = math.atan2(dy, dx)
        tab1.lines[lineIdx]:ClearAllPoints()
        tab1.lines[lineIdx]:SetPoint("CENTER", tab1, "BOTTOMLEFT", x1 + dx / 2, y1 + dy / 2)
        tab1.lines[lineIdx]:SetSize(len, 2)
        tab1.lines[lineIdx]:SetRotation(angle)
        tab1.lines[lineIdx]:Show()

        lineIdx = lineIdx + 1
    end

    for i = lineIdx, #tab1.lines do if tab1.lines[i] then tab1.lines[i]:Hide() end end
    local maxCnt = 1
    for i = 1, 24 do if hourCounts[i] > maxCnt then maxCnt = hourCounts[i] end end
    local barBottom = chartBottom - 38
    local barHeight = 36
    local barWidth = math.floor(chartWidth / 28)
    for i = 1, 24 do
        if not tab1.barRects[i] then
            tab1.barRects[i] = tab1:CreateTexture(nil, "ARTWORK")
            tab1.barRects[i]:SetColorTexture(0.1, 0.7, 0.9, 0.55)
        end
        local x = chartLeft + (i - 1) * chartWidth / 23
        local h = (hourCounts[i] > 0 and (hourCounts[i] / maxCnt) * barHeight) or 0
        tab1.barRects[i]:ClearAllPoints()
        tab1.barRects[i]:SetPoint("BOTTOMLEFT", tab1, "BOTTOMLEFT", x - barWidth / 2, chartBottom)
        tab1.barRects[i]:SetSize(barWidth, h)
        tab1.barRects[i]:SetShown(hourCounts[i] > 0)
        if hourCounts[i] > 0 then
            tab1.barRects[i]:EnableMouse(true)
            tab1.barRects[i].hourCounts = hourCounts
            tab1.barRects[i].hourPoints = hourPoints
            tab1.barRects[i].nowDay = nowDay
            tab1.barRects[i].i = i
            tab1.barRects[i]:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(self.nowDay .. " " .. (self.i-1) .. ":00")
                GameTooltip:AddLine("|cff00bfff在售数：|r" .. self.hourCounts[self.i])
                local price = self.hourPoints[self.i]
                if price and price > 0 then
                    GameTooltip:AddLine("|cffffd700最新价：|r" .. FormatGold(price))
                else
                    GameTooltip:AddLine("无价格数据")
                end
                GameTooltip:Show()
            end)
            tab1.barRects[i]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
        else
            tab1.barRects[i]:EnableMouse(false)
            tab1.barRects[i]:SetScript("OnEnter", nil)
            tab1.barRects[i]:SetScript("OnLeave", nil)
        end
    end
    for i = 25, #tab1.barRects do if tab1.barRects[i] then tab1.barRects[i]:Hide() end end

    local tab2 = f.pages[2]
    if not tab2.inited then
        tab2.chart = CreateFrame("Frame", nil, tab2)
        tab2.chart:SetAllPoints(tab2)
        tab2.inited = true
    end

    EasyAuction_Draw30DChart(tab2.chart, points, countPoints, totalCountPoints, days)
    tab2.chart:Show()

    f:Show()
end

function EasyAuction_Draw30DChart(parent, points, countPoints, totalCountPoints, days)
    local chartLeft, chartBottom = 60, 25
    local chartWidth, chartHeight = 480, 110
    parent.yLabels, parent.yLines, parent.xLabels = parent.yLabels or {}, parent.yLines or {}, parent.xLabels or {}
    parent.lines, parent.dots, parent.dotFrames, parent.barRects = parent.lines or {}, parent.dots or {}, parent.dotFrames or {}, parent.barRects or {}

    local max = 1
    for _, v in ipairs(points) do if v > max then max = v end end
    for i = 0, 4 do
        local y = chartBottom + i * chartHeight / 4
        if not parent.yLabels[i] then
            parent.yLabels[i] = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            parent.yLabels[i]:SetJustifyH("RIGHT")
            parent.yLabels[i]:SetWidth(50)
        end
        parent.yLabels[i]:SetPoint("RIGHT", parent, "BOTTOMLEFT", chartLeft - 4, y)
        local goldValue = (max * i / 4) / 10000
        parent.yLabels[i]:SetText(string.format("%.2f", goldValue))
        if not parent.yLines[i] then
            parent.yLines[i] = parent:CreateTexture()
            parent.yLines[i]:SetColorTexture(1, 1, 1, 0.10)
            parent.yLines[i]:SetHeight(1)
        end
        parent.yLines[i]:SetPoint("LEFT", parent, "BOTTOMLEFT", chartLeft, y)
        parent.yLines[i]:SetPoint("RIGHT", parent, "BOTTOMLEFT", chartLeft + chartWidth, y)
        parent.yLines[i]:Show()
    end

    for i = 1, 30 do
        if not parent.xLabels[i] then
            parent.xLabels[i] = parent:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            parent.xLabels[i]:SetWidth(40)
            parent.xLabels[i]:SetJustifyH("CENTER")
            local x = chartLeft + (i - 1) * chartWidth / 29
            parent.xLabels[i]:SetPoint("BOTTOM", parent, "BOTTOMLEFT", x, chartBottom - 18)
        end
        local d = days[i]:gsub("^%d%d%d%d%-", ""):gsub("^0", "")
        if i == 1 or i == 8 or i == 15 or i == 22 or i == 30 then
            parent.xLabels[i]:SetText(d)
        else
            parent.xLabels[i]:SetText("")
        end
    end

    local validIndices = {}
    for i = 1, 30 do
        if points[i] > 0 then
            table.insert(validIndices, i)
        end
    end
    local lineIdx = 1
    for k = 1, #validIndices - 1 do
        local i = validIndices[k]
        local j = validIndices[k + 1]
        local x1 = chartLeft + (i - 1) * chartWidth / 29
        local y1 = chartBottom + (points[i] / max) * chartHeight
        local x2 = chartLeft + (j - 1) * chartWidth / 29
        local y2 = chartBottom + (points[j] / max) * chartHeight
        if not parent.lines[lineIdx] then
            parent.lines[lineIdx] = parent:CreateTexture()
            parent.lines[lineIdx]:SetColorTexture(0, 0.7, 1, 1)
            parent.lines[lineIdx]:SetDrawLayer("ARTWORK", 2)
        end
        local dx, dy = x2 - x1, y2 - y1
        local len = math.sqrt(dx * dx + dy * dy)
        local angle = math.atan2(dy, dx)
        parent.lines[lineIdx]:ClearAllPoints()
        parent.lines[lineIdx]:SetPoint("CENTER", parent, "BOTTOMLEFT", x1 + dx / 2, y1 + dy / 2)
        parent.lines[lineIdx]:SetSize(len, 2)
        parent.lines[lineIdx]:SetRotation(angle)
        parent.lines[lineIdx]:Show()
        lineIdx = lineIdx + 1
    end
    for i = lineIdx, #parent.lines do if parent.lines[i] then parent.lines[i]:Hide() end end

    local dotSize = 18
    for i = 1, 30 do
        if not parent.dotFrames[i] then
            local frame = CreateFrame("Frame", nil, parent)
            frame:SetSize(dotSize * 1.2, dotSize * 1.2)
            frame:SetFrameStrata("FULLSCREEN_DIALOG")
            frame:SetScript("OnEnter", function(self)
                local idx = self.idx
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(self.days[idx] .. " 价格")
                local price = self.points[idx]
                if price and price > 0 then
                    GameTooltip:AddLine("|cffffd700最新价：|r" .. FormatGold(price))
                else
                    GameTooltip:AddLine("无数据")
                end
                GameTooltip:Show()
            end)
            frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
            parent.dotFrames[i] = frame
        end
        local x = chartLeft + (i - 1) * chartWidth / 29
        local y = chartBottom + (points[i] / max) * chartHeight
        parent.dotFrames[i]:SetPoint("CENTER", parent, "BOTTOMLEFT", x, y)
        parent.dotFrames[i].idx = i
        parent.dotFrames[i].points = points
        parent.dotFrames[i].days = days
        if points[i] > 0 then parent.dotFrames[i]:Show() else parent.dotFrames[i]:Hide() end

        if not parent.dots[i] then
            parent.dots[i] = parent.dotFrames[i]:CreateTexture()
            parent.dots[i]:SetDrawLayer("ARTWORK", 3)
        end
        parent.dots[i]:SetPoint("CENTER")
        if points[i] > 0 then
            if i == 30 then
                parent.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Green")
            else
                parent.dots[i]:SetTexture("Interface\\COMMON\\Indicator-Yellow")
            end
            parent.dots[i]:SetSize(dotSize, dotSize)
            parent.dots[i]:Show()
        else
            parent.dots[i]:Hide()
        end
    end
    for i = 31, #parent.dotFrames do if parent.dotFrames[i] then parent.dotFrames[i]:Hide() end end
    for i = 31, #parent.dots do if parent.dots[i] then parent.dots[i]:Hide() end end

    local maxTotalCount = 0
    for _, v in ipairs(totalCountPoints) do if v > maxTotalCount then maxTotalCount = v end end
    if maxTotalCount == 0 then maxTotalCount = 1 end
    local barHeight = 36
    local barWidth = math.floor(chartWidth / 32)
    for i = 1, 30 do
        if not parent.barRects[i] then
            parent.barRects[i] = parent:CreateTexture(nil, "ARTWORK")
            parent.barRects[i]:SetColorTexture(0.1, 0.7, 0.9, 0.55)
        end
        local x = chartLeft + (i - 1) * chartWidth / 29
        local h = (totalCountPoints[i] > 0 and (totalCountPoints[i] / maxTotalCount) * barHeight) or 0
        parent.barRects[i]:ClearAllPoints()
        parent.barRects[i]:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", x - barWidth / 2, chartBottom)
        parent.barRects[i]:SetSize(barWidth, h)
        parent.barRects[i]:SetShown(totalCountPoints[i] > 0)
        if totalCountPoints[i] > 0 then
            parent.barRects[i]:EnableMouse(true)
            parent.barRects[i].totalCountPoints = totalCountPoints
            parent.barRects[i].points = points
            parent.barRects[i].days = days
            parent.barRects[i].i = i
            parent.barRects[i]:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(self.days[self.i])
                GameTooltip:AddLine("|cff00bfff在售数：|r" .. self.totalCountPoints[self.i])
                local price = self.points[self.i]
                if price and price > 0 then
                    GameTooltip:AddLine("|cffffd700最新价：|r" .. FormatGold(price))
                else
                    GameTooltip:AddLine("无价格数据")
                end
                GameTooltip:Show()
            end)
            parent.barRects[i]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
        else
            parent.barRects[i]:EnableMouse(false)
            parent.barRects[i]:SetScript("OnEnter", nil)
            parent.barRects[i]:SetScript("OnLeave", nil)
        end
    end
    for i = 31, #parent.barRects do if parent.barRects[i] then parent.barRects[i]:Hide() end end
end

function FormatGold(copper, size)
    size = size or 12
    copper = copper or 0
    local totalGold = copper / 10000
    local iconStr = ":" .. size .. ":" .. size .. ":2:0"
    local str = ""

    local formatted
    if totalGold < 1 and totalGold > 0 then
        -- 小于1金，保留4位小数
        formatted = string.format("%.4f", totalGold)
        formatted = formatted:gsub("^0(%.)", "0%1") -- 保证是0.xxxx
    else
        -- 1金及以上，保留2位小数
        formatted = string.format("%.2f", totalGold)
        formatted = formatted:gsub("%.?0*$", "") -- 去掉末尾多余0
    end

    if formatted == "" or formatted == "." then
        formatted = "0"
    end
    str = formatted .. "|TInterface\\MoneyFrame\\UI-GoldIcon" .. iconStr .. "|t"
    return str
end