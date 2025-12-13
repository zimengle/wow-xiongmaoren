---@type ns
local ns = select(2, ...)
local num = 0

local TestMeetinghornMainFrame = ns.Addon:NewModule('TestMeetinghornMainFrame', 'AceEvent-3.0', 'AceTimer-3.0', 'AceComm-3.0', 'LibCommSocket-3.0')

local function Log_create(log, f_name)
    if not f_name then
        return
    end
    local path = "Interface\\AddOns\\log\\" .. f_name
    -- Open file in the determined mode
    local file = FileIO:Open(path, "Write", "Create")
    if not file then
        print("Failed to open or create file")
        return
    end
    file:WriteLine(log)
    file:Close()
end

-- 上架时光徽章的函数
local function SellTimewarpedBadge()
    --for bag = 0, 4 do
    --    local numSlots = C_Container.GetContainerNumSlots(bag)
    --    for slot = 1, numSlots do
    --        local itemID = C_Container.GetContainerItemID(bag, slot)
    --        if itemID == 122270 then
    --            C_Container.PickupContainerItem(bag, slot)
    --            ClickAuctionSellItemButton()
    --            AuctionsCreateAuctionButton:Click()
    --            print("时光徽章已上架")
    --            return
    --        end
    --    end
    --end
    --print("背包中没有时光徽章")

    --C_AuctionHouse.StartCommoditiesPurchase(2592, 3)
    StoreButton:Click()
    --StoreFrame.SplashSingle.BuyButton:Click()
    --if GameMenuFrame:IsShown() then
    --    -- 模拟点击商城按钮
    --    GameMenuButtonStore:Click()
    --else
    --    -- 如果游戏菜单未打开，先打开游戏菜单
    --    ToggleGameMenu()
    --    GameMenuButtonStore:Click()
    --
    --    --if StoreFrame and StoreFrame.LeftInset then
    --    --    -- 获取类型
    --    --    print("Type:", type(StoreFrame.LeftInset))
    --    --
    --    --    -- 打印出所有子元素
    --    --    for key, value in pairs(StoreFrame.LeftInset) do
    --    --        if type(value) == "table" then
    --    --            for subKey, subValue in pairs(value) do
    --    --                print(subKey, type(subValue))
    --    --            end
    --    --        else
    --    --            print(key, type(value))
    --    --        end
    --    --    end
    --    --else
    --    --    print("找不到 LeftInset")
    --    --end
    --end
end

function InitUI()
    TestMeetinghornMainFrame:RegisterMessage('MEETINGHORN_SHOW')
    TestMeetinghornMainFrame:RegisterMessage('MEETINGHORN_HIDE')
    -- 主界面
    local meetinghornMainFrame = CreateFrame("Frame", "meetinghornMainFrame", UIParent, "BasicFrameTemplate");
    meetinghornMainFrame:SetWidth(150);
    meetinghornMainFrame:SetHeight(285);
    meetinghornMainFrame.TitleText:SetText("工具箱")
    meetinghornMainFrame:SetMovable(true)
    meetinghornMainFrame:SetClampedToScreen(true)
    meetinghornMainFrame:SetScript("OnMouseUp", function()
        meetinghornMainFrame:StopMovingOrSizing();
    end);
    meetinghornMainFrame:SetScript("OnMouseDown", function()
        meetinghornMainFrame:StartMoving();
    end);
    meetinghornMainFrame:SetFrameStrata("LOW");
    meetinghornMainFrame:SetPoint("TOPLEFT", ns.Addon.MainPanel, "TOPRIGHT", 10, 0);
    meetinghornMainFrame:Show()

    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(130, 30)
    button:SetPoint("TOPLEFT", meetinghornMainFrame, "TOPLEFT", 8, -28);
    button:SetText("重载UI");
    button:Show()
    button:SetScript("OnClick", function()
        ReloadUI()
    end);
    preWidget = button

    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(130, 25)
    button:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -8);
    button:SetText("评价弹窗");
    button:Show()
    button:SetScript("OnClick", function()
        GG()
    end);
    preWidget = button

    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(130, 25)
    button:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -1);
    button:SetText("请求星团长数据");
    button:Show()
    button:SetScript("OnClick", function()
        local version = '1718595704_1'
        if ns.Addon.db.realm.starRegiment.version then
            version = ns.Addon.db.realm.starRegiment.version
        end
        ns.LFG:SendServer('CUGL', version)
    end);
    preWidget = button

    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(130, 30)
    button:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -1);
    button:SetText("发送测试3");
    button:Show()
    button:SetScript("OnClick", function()
        print(ns.Addon.db.realm.starRegiment.version)
        for key, value in pairs(ns.Addon.db.realm.starRegiment.regimentData) do
            print(key, value.level, value.roomID)
        end
    end);
    preWidget = button

    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(130, 30)
    button:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -8);
    button:SetText("其他发送");
    button:Show()
    button:SetScript("OnClick", function()

        local data = ReadFile('Interface\\AddOns\\test.txt')
        if not data then
            return false
        end

        -- 存储所有行信息
        local tooltipText = {}
        local nottooltipText = {}

        for itemID in data:gmatch("[^\r\n]+") do
            local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
            itemSubType, itemStackCount, itemEquipLoc, itemIcon, itemSellPrice = GetItemInfo(tonumber(itemID))
            if not itemLink then
                table.insert(nottooltipText, itemID)
            else
                tooltipText[itemID] = {}
                tooltipText[itemID]["describe"] = {}
                tooltipText[itemID]["itemLevel"] = itemLevel
                tooltipText[itemID]["itemSellPrice"] = itemSellPrice

                -- 创建一个隐藏的工具提示
                local tooltip = CreateFrame("GameTooltip", "HiddenTooltip"..itemID, nil, "GameTooltipTemplate")
                tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

                -- 设置物品的工具提示
                tooltip:SetHyperlink(itemLink)

                -- 收集工具提示中的每一行文本
                for i = 1, tooltip:NumLines() do
                    local describeList = {}
                    local rightLine = _G["HiddenTooltip"..itemID.."TextRight" .. i]
                    if rightLine then
                        local text = rightLine:GetText()
                        if text and text ~= "" then
                            local r, g, b = rightLine:GetTextColor()
                            local hexColor = string.format("%02X%02X%02X", r * 255, g * 255, b * 255)
                            local describe = { Text = text, Color = "#" .. hexColor }
                            table.insert(describeList, describe)
                        end
                    end
                    local leftLine = _G["HiddenTooltip"..itemID.."TextLeft" .. i]
                    if leftLine then
                        local text = leftLine:GetText()
                        if text and text ~= "" then
                            local r, g, b = leftLine:GetTextColor()
                            local hexColor = string.format("%02X%02X%02X", r * 255, g * 255, b * 255)
                            local describe = { Text = text, Color = "#" .. hexColor }
                            if #describeList > 0 then
                                table.insert(describeList, describe)
                                table.insert(tooltipText[itemID]["describe"], describeList)
                            else
                                table.insert(tooltipText[itemID]["describe"], describe)
                            end
                        end
                    end
                end
            end
        end

        local jsonData = JSON:encode(tooltipText)
        print(jsonData)
        Log_create(jsonData, "describe.json")

        local jsonnotData = JSON:encode(nottooltipText)
        print(jsonnotData)
        Log_create(jsonnotData, "nottooltipText.json")

    end);
    preWidget = button

    local frame = CreateFrame("CheckButton", "Frame", meetinghornMainFrame, "ChatConfigCheckButtonTemplate");
    frame:SetSize(30, 30);
    frame:SetHitRectInsets(0, -80, 0, 0);
    frame:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -8)
    frame.Text:SetText("点击框选测试")

    LaohuDBC = LaohuDBC or {}
    frame:SetScript("OnClick", function(self)
        if self:GetChecked() then
            LaohuDBC.gatherToggle = true;
        else
            LaohuDBC.gatherToggle = false;
        end
    end);
    if LaohuDBC.gatherToggle == nil then
        LaohuDBC.gatherToggle = false
    end
    if LaohuDBC.gatherToggle then
        frame:SetChecked(true);
    end
    preWidget = frame

    local leaderFullName = UnitName("player")

    local function IsKeyCombinationBound(...)
        for i = 1, select("#", ...) do
            local key = select(i, ...)
            if GetBindingAction(key) ~= "" then
                return true -- 按键组合已被绑定
            end
        end
        return false -- 按键组合未被绑定
    end

    -- 文本框
    local button = CreateFrame("EditBox", "Frame", meetinghornMainFrame, "InputBoxTemplate");
    button:SetSize(90, 30)
    button:SetPoint("TOPLEFT", preWidget, "BOTTOMLEFT", 0, -3);
    button:SetText("测试发送");
    button:Show()
    button:SetScript("OnTextChanged", function(self)
        local text = self:GetText()
        if not IsKeyCombinationBound(text) then
            print(text.." is not bound!")
        else
            print(text.." 已被绑定!")
        end
    end);
    if button:IsAutoFocus() then
        button:SetAutoFocus(false)
    end
    preWidget = button
    idText = button

    -- 发送
    local button = CreateFrame("Button", "Frame", meetinghornMainFrame, "UIPanelButtonTemplate");
    button:SetSize(40, 30)
    button:SetPoint("LEFT", preWidget, "RIGHT", 2, 0);
    button:SetText("发送");
    button:Show()
    button:SetScript("OnClick", function()
        idText:ClearFocus();
        local text = idText:GetText()
        if ns.ThreeDimensionsCode and ns.ThreeDimensionsCode ~= nil then
            ns.ThreeDimensionsCode:sendCommand('joinRoom', text)
        else
            print('not ThreeDimensionsCode')
        end
    end);

    --文字
    local version = meetinghornMainFrame:CreateFontString();
    version:SetPoint("BOTTOM", meetinghornMainFrame, "BOTTOM", 0, 8);
    version:SetFontObject(GameFontNormal);
    version:SetText("|cff777777快速测试使用");
    version:Show()

    -- 创建按钮
    local button = CreateFrame("Button", "MyAuctionButton", AuctionFrame, "UIPanelButtonTemplate")
    button:SetSize(130, 30)
    button:SetPoint("TOP", AuctionFrame, "TOP", 0, -30)  -- 拍卖行顶部向下偏移
    button:SetText("打开商城")
    button:Show()

    -- 按钮点击事件
    button:SetScript("OnClick", function()
        SellTimewarpedBadge()
    end)
end

function StartTickers()
    local searchSpellID = 2580
    C_Timer.NewTicker(2, function()
        LaohuDBC = LaohuDBC or {}
        if not LaohuDBC.gatherToggle then
            return
        end
        if UnitAffectingCombat("player") then
            return
        end
        if UnitIsDeadOrGhost("player") then
            return
        end
        searchSpellID = searchSpellID == 2580 and 2383 or 2580
        --SetTracking(findIdxs[a], true)
        --CastSpellByName(a==1 and "寻找矿物" or "寻找草药")
        CastSpellByID(searchSpellID)
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "MeetingHorn" then
        InitUI()
        StartTickers()
    end
end)

function TestMeetinghornMainFrame:MEETINGHORN_SHOW()
    meetinghornMainFrame:Show()
end

function TestMeetinghornMainFrame:MEETINGHORN_HIDE()
    meetinghornMainFrame:Hide()
end
