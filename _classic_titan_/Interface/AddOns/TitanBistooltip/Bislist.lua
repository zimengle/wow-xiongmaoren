local AceGUI = LibStub("AceGUI-3.0")

-- 装备信息缓存
local itemInfoCache = {}
local L = LibStub("AceLocale-3.0"):GetLocale("TitanBistooltip", false)



local class = nil
local spec = nil
local phase = nil
local class_index = nil
local spec_index = nil
local phase_index = nil

local class_options = {}
local class_options_to_class = {}

local spec_options = {}
local spec_options_to_spec = {}
local spec_frame = nil
local items = {}
local spells = {}
local main_frame = nil

local controlRefs = {
    dropDownGroup = nil,
    classDropdown = nil,
    specDropdown = nil,
    phaseDropdown = nil,
    scrollFrame = nil
}

local checkmarks = {}

-- 防抖功能
local tooltip_timer = nil
local function debounceTooltip(callback, delay)  
    if tooltip_timer then
        tooltip_timer:Cancel()
    end
    tooltip_timer = C_Timer.NewTimer(delay, callback)
end
local boemarks = {}

local isHorde = UnitFactionGroup("player") == "Horde"

local itemCache = {}
local factionItemCache = {}
local equipmentCache = {}

local function clearCaches()
    itemCache = {}
    factionItemCache = {}
    equipmentCache = {}
    itemInfoCache = {}
end

local function createItemFrame(item_id, size, with_checkmark)
    if item_id < 0 then
        local f = AceGUI:Create("Label")
        return f
    end
    local item_frame = AceGUI:Create("Icon")
    item_frame:SetImageSize(size, size)
    items[item_id] = Item:CreateFromItemID(item_id);

    if (items[item_id]:GetItemID()) then
        items[item_id]:ContinueOnItemLoad(function()
            local ilink = items[item_id]:GetItemLink()
            item_frame:SetImage(items[item_id]:GetItemIcon())
            -- 存储ilink到userdata，避免闭包问题
            item_frame:SetUserData("ilink", ilink)
            item_frame:SetUserData("item_id", item_id)
            
            -- 只有当with_checkmark为true时才检查装备是否存在并显示绿色勾
            if with_checkmark == true then
                -- 检查玩家是否拥有该装备
                local hasEquipment = false
                local cacheKey = tostring(item_id)
                if equipmentCache[cacheKey] == nil then
                    -- 首先检查物品是否可装备（有装备槽位）
                    local equipLoc = select(9, GetItemInfo(item_id))
                    if equipLoc and equipLoc ~= "" then
                        equipmentCache[cacheKey] = TitanBistooltip_char_equipment[item_id] ~= nil
                        -- 同时检查玩家装备栏
                        if not equipmentCache[cacheKey] then
                            for j = 1, 19 do -- 19个装备栏位
                                local equippedItem = GetInventoryItemID("player", j)
                                if equippedItem and equippedItem == item_id then
                                    equipmentCache[cacheKey] = true
                                    break
                                end
                            end
                        end
                    else
                        equipmentCache[cacheKey] = false
                    end
                end
                hasEquipment = equipmentCache[cacheKey]
                
                if hasEquipment then
                    local checkMark = item_frame.frame:CreateTexture(nil, "OVERLAY")
                    checkMark:SetWidth(32)
                    checkMark:SetHeight(32)
                    checkMark:SetPoint("CENTER", 6, -8)
                    checkMark:SetTexture("Interface\\AddOns\\TitanBistooltip\\checkmark-16.tga")
                    table.insert(checkmarks, checkMark)
                end
            end

            -- 从缓存获取装备信息
            local cachedInfo = itemInfoCache[item_id]
            local bindType
            if cachedInfo then
                bindType = cachedInfo.bindType
            else
                local _, _, _, _, _, _, _, _, _, _, _, _, _, bindTypeVal = GetItemInfo(item_id)
                bindType = bindTypeVal
                -- 缓存装备信息
                itemInfoCache[item_id] = { bindType = bindType }
            end
            -- 只有当bindType有效且为装备后绑定类型时才显示图标
            if bindType and (bindType == LE_ITEM_BIND_ON_EQUIP or bindType == 2) then
                local boeMark = item_frame.frame:CreateTexture(nil, "OVERLAY")
                boeMark:SetWidth(12)
                boeMark:SetHeight(12)
                boeMark:SetPoint("TOPLEFT",2,-5)
                boeMark:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
                table.insert(boemarks, boeMark)
            end

            -- 直接在按钮上绑定右键点击事件
            item_frame.frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            item_frame.frame:SetScript("OnMouseUp", function(self, button)
                if button == "RightButton" then
                    -- 复制物品名称
                    -- 从缓存获取装备名称
                    local cachedInfo = itemInfoCache[item_id]
                    local itemName, _, itemRarity
                    if cachedInfo and cachedInfo.name then
                        itemName = cachedInfo.name
                    else
                        itemName, _, itemRarity = GetItemInfo(item_id)
                        -- 缓存装备信息
                        if not itemInfoCache[item_id] then
                            itemInfoCache[item_id] = {}
                        end
                        itemInfoCache[item_id].name = itemName
                        itemInfoCache[item_id].rarity = itemRarity
                    end
                    if itemName then
                        -- 尝试复制到剪贴板
                        local success = TitanBistooltipAddon:CopyTextToClipboard(itemName)
                    else
                        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000无法获取物品名称|r")
                    end
                end
            end)
            
            -- 保持左键点击功能
            item_frame:SetCallback("OnClick", function(widget, event, button)
                local ilink = widget:GetUserData("ilink")
                if button == "LeftButton" and ilink and type(ilink) == "string" and #ilink > 0 then
                    SetItemRef(ilink, ilink, "LeftButton")
                end
            end)
            item_frame:SetCallback("OnEnter", function(widget)
                debounceTooltip(function()
                    local ilink = widget:GetUserData("ilink")
                    local itemId = widget:GetUserData("item_id")
                    if ilink and type(ilink) == "string" and #ilink > 0 then
                        GameTooltip:SetOwner(widget.frame)
                        local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                        if position == "right" then
                            GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                        else
                            GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                        end
                        GameTooltip:SetHyperlink(ilink)
                    else
                        -- 物品信息无法获取，显示错误提示
                        GameTooltip:SetOwner(widget.frame)
                        local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                        if position == "right" then
                            GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                        else
                            GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                        end
                        local errorMsg = "|cffff0000无效的物品信息|r"
                        if itemId then
                            errorMsg = "|cffff0000无效的物品信息 (ID: " .. itemId .. ")|r"
                        end
                        GameTooltip:SetText(errorMsg)
                        GameTooltip:Show()
                    end
                end, 0.05) -- 50ms延迟
            end)
            item_frame:SetCallback("OnLeave", function(widget)
                if tooltip_timer then
                    tooltip_timer:Cancel()
                    tooltip_timer = nil
                end
                GameTooltip:Hide()
            end)
        end)
    else
        -- 物品ID无效时的处理
        item_frame:SetCallback("OnEnter", function(widget)
            debounceTooltip(function()
                GameTooltip:SetOwner(item_frame.frame)
                local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                if position == "right" then
                    GameTooltip:SetPoint("TOPRIGHT", item_frame.frame, "TOPRIGHT", 220, -13);
                else
                    GameTooltip:SetPoint("BOTTOMLEFT", item_frame.frame, "TOPRIGHT", 10, -13);
                end
                GameTooltip:SetText("|cffff0000无效的物品信息 (ID: " .. item_id .. ")|r")
                GameTooltip:Show()
            end, 0.05) -- 50ms延迟
        end)
        item_frame:SetCallback("OnLeave", function(widget)
            if tooltip_timer then
                tooltip_timer:Cancel()
                tooltip_timer = nil
            end
            GameTooltip:Hide()
        end)
    end
    return item_frame
end

local function createSpellFrame(spell_id, size)
    if not spell_id or spell_id < 0 then
        local f = AceGUI:Create("Label")
        return f
    end
    local spell_frame = AceGUI:Create("Icon")
    spell_frame:SetImageSize(size, size)
    
    -- 检查Spell是否可用
    if not Spell then
        -- Spell API不可用，设置错误提示
        spell_frame:SetCallback("OnEnter", function(widget)
            debounceTooltip(function()
                GameTooltip:SetOwner(widget.frame, "ANCHOR_NONE")
                local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                if position == "right" then
                    GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                else
                    GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                end
                GameTooltip:SetText("|cffff0000Spell API不可用|r")
                GameTooltip:Show()
            end, 0.05) -- 50ms延迟
        end)
        spell_frame:SetCallback("OnLeave", function(widget)
            if tooltip_timer then
                tooltip_timer:Cancel()
                tooltip_timer = nil
            end
            GameTooltip:Hide()
        end)
        return spell_frame
    end
    
    spells[spell_id] = Spell:CreateFromSpellID(spell_id);

    if (spells[spell_id] and spells[spell_id]:GetSpellID()) then
        spells[spell_id]:ContinueOnSpellLoad(function()
            local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(spell_id)
            if not name then
                -- 法术信息无法获取，设置错误提示回调
                spell_frame:SetCallback("OnEnter", function(widget)
                    debounceTooltip(function()
                        GameTooltip:SetOwner(widget.frame, "ANCHOR_NONE")
                        local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                        if position == "right" then
                            GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                        else
                            GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                        end
                        GameTooltip:SetText("|cffff0000无效的法术信息 (ID: " .. spell_id .. ")|r")
                        GameTooltip:Show()
                    end, 0.05) -- 50ms延迟
                end)
                spell_frame:SetCallback("OnLeave", function(widget)
                    if tooltip_timer then
                        tooltip_timer:Cancel()
                        tooltip_timer = nil
                    end
                    GameTooltip:Hide()
                end)
                return
            end
            spell_frame:SetImage(icon)
            local link = GetSpellLink(spell_id)
            if link == nil then
                link = "\124cffffd000\124Hspell:" .. spell_id .. "\124h[" .. name .. "]\124h\124r"
            end
            -- 存储link和spellId到userdata，避免闭包问题
            spell_frame:SetUserData("link", link)
            spell_frame:SetUserData("name", name)
            spell_frame:SetUserData("spellId", spell_id)
            -- 直接在按钮上绑定右键点击事件
            spell_frame.frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            spell_frame.frame:SetScript("OnMouseUp", function(self, button)
                if button == "RightButton" then
                    -- 复制法术/附魔名称
                    local spellName = spell_frame:GetUserData("name")
                    if spellName then
                        -- 尝试复制到剪贴板
                        local success = TitanBistooltipAddon:CopyTextToClipboard(spellName)
                    else
                        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000无法获取法术/附魔名称|r")
                    end
                end
            end)
            
            -- 保持左键点击功能
            spell_frame:SetCallback("OnClick", function(widget, event, button)
                local link = widget:GetUserData("link")
                if button == "LeftButton" and link and type(link) == "string" and #link > 0 then
                    SetItemRef(link, link, "LeftButton")
                end
            end)
            spell_frame:SetCallback("OnEnter", function(widget)
                debounceTooltip(function()
                    local link = widget:GetUserData("link")
                    local spellId = widget:GetUserData("spellId")
                    if link and type(link) == "string" and #link > 0 then
                        GameTooltip:SetOwner(widget.frame, "ANCHOR_NONE")
                        local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                        if position == "right" then
                            GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                        else
                            GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                        end
                        GameTooltip:SetHyperlink(link)
                    else
                        -- 法术信息无法获取，显示错误提示
                        GameTooltip:SetOwner(widget.frame, "ANCHOR_NONE")
                        local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                        if position == "right" then
                            GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                        else
                            GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                        end
                        local errorMsg = "|cffff0000无效的法术信息|r"
                        if spellId then
                            errorMsg = "|cffff0000无效的法术信息 (ID: " .. spellId .. ")|r"
                        end
                        GameTooltip:SetText(errorMsg)
                        GameTooltip:Show()
                    end
                end, 0.05) -- 50ms延迟
            end)
            spell_frame:SetCallback("OnLeave", function(widget)
                if tooltip_timer then
                    tooltip_timer:Cancel()
                    tooltip_timer = nil
                end
                GameTooltip:Hide()
            end)
        end)
    else
        -- 法术ID无效，设置错误提示
        spell_frame:SetCallback("OnEnter", function(widget)
            debounceTooltip(function()
                GameTooltip:SetOwner(widget.frame, "ANCHOR_NONE")
                local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                if position == "right" then
                    GameTooltip:SetPoint("TOPRIGHT", widget.frame, "TOPRIGHT", 220, -13);
                else
                    GameTooltip:SetPoint("BOTTOMLEFT", widget.frame, "TOPRIGHT", 10, -13);
                end
                GameTooltip:SetText("|cffff0000无效的法术ID: " .. spell_id .. "|r")
                GameTooltip:Show()
            end, 0.05) -- 50ms延迟
        end)
        spell_frame:SetCallback("OnLeave", function(widget)
            if tooltip_timer then
                tooltip_timer:Cancel()
                tooltip_timer = nil
            end
            GameTooltip:Hide()
        end)
    end
    return spell_frame
end

local function createEnhancementsFrame(enhancements, phase, slot_name)
    local frame = AceGUI:Create("SimpleGroup")
    frame:SetLayout("Table")
    frame:SetFullWidth(true)
    frame:SetHeight(50) -- 增加高度以容纳3个宝石的垂直排列
    frame:SetAutoAdjustHeight(false)
    frame:SetUserData("table", {
        columns = {
            { width = 20 }, -- 第一列：附魔
            { width = 20 }  -- 第二列：宝石
        },
        spaceV = 2,
        spaceH = -2, -- 列间距为-2，平衡显示
        align = "TOP"
    })
    
    -- 创建附魔容器
    local enchantContainer = AceGUI:Create("SimpleGroup")
    enchantContainer:SetLayout("Table")
    enchantContainer:SetFullWidth(true)
    enchantContainer:SetHeight(50) -- 与宝石容器高度一致
    enchantContainer:SetUserData("table", {
        columns = {
            { width = 20 }
        },
        spaceV = 2,
        align = "TOP" -- 上部对齐
    })
    
    -- 创建宝石容器（垂直排列）
    local gemsContainer = AceGUI:Create("SimpleGroup")
    gemsContainer:SetLayout("Table")
    gemsContainer:SetFullWidth(true)
    gemsContainer:SetHeight(50)
    gemsContainer:SetUserData("table", {
        columns = {
            { width = 20 }
        },
        spaceV = 2,
        align = "TOP"
    })
    
    -- 根据阶段决定宝石的最大显示数量
    local maxGems = 3 -- 默认最多显示3个宝石
    if phase == "PR" or phase == "P1" or phase == "P2" or phase == "P3" then
        maxGems = 2 -- PR/P1/P2/P3阶段最多显示2个宝石
    end
    
    local gemCount = 0
    
    for i, enhancement in ipairs(enhancements) do
        local size = 16

        -- 头部、肩部、胸部、手部、腰部、腿部、脚部、披风、主手武器、副手、盾牌和护腕的第一个增强归类到附魔列
        local isEnchantSlot = false
        if (slot_name == "Head" or slot_name == "Shoulder" or slot_name == "Chest" or slot_name == "Hands" or slot_name == "Waist" or slot_name == "Legs" or slot_name == "Feet" or slot_name == "Back" or slot_name == "Weapon" or slot_name == "Off hand" or slot_name == "Ranged" or slot_name == "Wrist") and i == 1 then
            isEnchantSlot = true
        end

        if enhancement and (enhancement.type == "spell" or (isEnchantSlot and enhancement.type == "item")) then -- 附魔（spell类型）或特殊槽位的item类型
            local enchantFrame
            if enhancement.type == "spell" then
                enchantFrame = createSpellFrame(enhancement.id, size)
            else
                enchantFrame = createItemFrame(enhancement.id, size)
            end
            enchantFrame:SetUserData("enchantId", enhancement.id)
            enchantFrame:SetHeight(size)
            enchantFrame:SetWidth(size)
            enchantContainer:AddChild(enchantFrame)
        end
        
        if enhancement and enhancement.type == "item" and not isEnchantSlot and gemCount < maxGems then -- 宝石，排除特殊槽位的item，最多显示maxGems个
            local gemFrame = createItemFrame(enhancement.id, size)
            gemFrame:SetUserData("gemId", enhancement.id)
            gemFrame:SetHeight(size)
            gemFrame:SetWidth(size)
            gemsContainer:AddChild(gemFrame)
            gemCount = gemCount + 1
        end
    end
    
    -- 添加附魔列
    frame:AddChild(enchantContainer)
    -- 添加宝石列
    frame:AddChild(gemsContainer)
    
    return frame
end

local function drawItemSlot(slot, phase)
    if not slot then return end
    
    local f = AceGUI:Create("Label")
    -- f:SetText(slot.slot_name)
    -- f:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    f:SetText(L[slot.slot_name] or slot.slot_name or "Unknown Slot")
    spec_frame:AddChild(f)
    spec_frame:AddChild(createEnhancementsFrame(slot.enhs or {}, phase, slot.slot_name or "Unknown"))
    for i, item_id in ipairs(slot) do
        -- 使用缓存来避免重复计算部落/联盟物品映射
        local cacheKey = item_id
        if isHorde then
            if factionItemCache[cacheKey] == nil then
                factionItemCache[cacheKey] = TitanBistooltip_horde_to_ali[item_id] or item_id
            end
            item_id = factionItemCache[cacheKey]
        end
        
        -- 使用缓存来避免重复检查玩家装备状态
        local hasEquipment = false
        if item_id ~= nil then
            local cacheKeyStr = tostring(item_id)
            if equipmentCache[cacheKeyStr] == nil then
                -- 首先检查物品是否可装备（有装备槽位）
                local equipLoc = select(9, GetItemInfo(item_id))
                if equipLoc and equipLoc ~= "" then
                    equipmentCache[cacheKeyStr] = TitanBistooltip_char_equipment[item_id] ~= nil
                    -- 同时检查玩家装备栏
                    if not equipmentCache[cacheKeyStr] then
                        for j = 1, 19 do -- 19个装备栏位
                            local equippedItem = GetInventoryItemID("player", j)
                            if equippedItem and equippedItem == item_id then
                                equipmentCache[cacheKeyStr] = true
                                break
                            end
                        end
                    end
                else
                    equipmentCache[cacheKeyStr] = false
                end
            end
            hasEquipment = equipmentCache[tostring(item_id)]
        end
        if hasEquipment then
            spec_frame:AddChild(createItemFrame(item_id, 40, true))
        else
            spec_frame:AddChild(createItemFrame(item_id, 40))
        end
    end
end

local function drawTableHeader(frame)
    local f = AceGUI:Create("Label")
    -- f:SetText("Slot")
    -- f:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    f:SetText(L["slot"])
    local color = 0.6
    f:SetColor(color, color, color)
    frame:AddChild(f)
    frame:AddChild(AceGUI:Create("Label"))
    for i = 1, 6 do
        f = AceGUI:Create("Label")
        f:SetText("Top " .. i)
        f:SetColor(color, color, color)
        frame:AddChild(f)
    end
end

local function saveData()
    TitanBistooltipAddon.db.char.class_index = class_index
    TitanBistooltipAddon.db.char.spec_index = spec_index
    TitanBistooltipAddon.db.char.phase_index = phase_index
end

local function clearCheckMarks()
    for key, value in ipairs(checkmarks) do
        value:SetTexture(nil)
    end
    checkmarks = {}
end

local function clearBoeMarks()
    for key, value in ipairs(boemarks) do
        value:SetTexture(nil)
    end
    boemarks = {}
end

local function drawSpecData()
    clearCheckMarks()
    clearBoeMarks()
    saveData()
    items = {}
    spells = {}
    
    -- 确保spec_frame存在
    if not spec_frame then
        spec_frame = controlRefs.scrollFrame
    end
    
    if spec_frame then
        spec_frame:ReleaseChildren()
        drawTableHeader(spec_frame)
        if not spec or not phase or not class then
            return
        end
        
        local slots = TitanBistooltip_bislists[class][spec][phase]
        
        if main_frame and main_frame.frame and main_frame.frame.SetResizeBounds then
            main_frame.frame:SetResizeBounds(435, 300, 435, 880)
        end
        
        if slots then
            -- 使用分批处理来避免脚本执行时间过长
            local currentSlot = 1
            local batchSize = 7 -- 每批处理7个槽位
            
            local function processBatch()
                local endSlot = math.min(currentSlot + batchSize - 1, #slots)
                
                for i = currentSlot, endSlot do
                    drawItemSlot(slots[i], phase)
                end
                
                currentSlot = endSlot + 1
                
                if currentSlot <= #slots then
                    -- 继续处理下一批
                    C_Timer.After(0.1, processBatch)
                end
            end
            
            -- 开始分批处理
            processBatch()
        end
    end
end

local function buildClassDict()
    class_options = {}
    for ci, class in ipairs(TitanBistooltip_classes) do
        -- local option_name = "|T" .. TitanBistooltip_spec_icons[class.name].classIcon .. ":14|t " .. class.name
        local option_name = "|T" .. TitanBistooltip_spec_icons[class.name].classIcon .. ":14|t " .. L[class.name]
        table.insert(class_options, option_name)
        class_options_to_class[option_name] = { name = class.name, i = ci }
    end
end

local function buildSpecsDict(class_i)
    spec_options = {}
    spec_options_to_spec = {}
    for si, spec in ipairs(TitanBistooltip_classes[class_i].specs) do
        -- local option_name = "|T" .. TitanBistooltip_spec_icons[class][spec] .. ":14|t " .. spec
        local option_name = "|T" .. TitanBistooltip_spec_icons[class][spec] .. ":14|t " .. L[spec]
        table.insert(spec_options, option_name)
        spec_options_to_spec[option_name] = spec
    end
end

local function loadData()
    class_index = TitanBistooltipAddon.db.char.class_index
    spec_index = TitanBistooltipAddon.db.char.spec_index
    -- 从设置中读取默认阶段
    local defaultPhase = TitanBistooltipAddon.db.char.default_phase
    -- 找到默认阶段在TitanBistooltip_phases中的索引
    phase_index = 1
    if TitanBistooltip_phases then
        for i, phase in ipairs(TitanBistooltip_phases) do
            if phase == defaultPhase then
                phase_index = i
                break
            end
        end
    end
    TitanBistooltipAddon.db.char.phase_index = phase_index4
    if class_index then
        class = class_options_to_class[class_options[class_index]].name
        buildSpecsDict(class_index)
    end
    if spec_index then
        spec = spec_options_to_spec[spec_options[spec_index]]
    end
    if phase_index then
        phase = TitanBistooltip_phases[phase_index]
    end
end

local function drawDropdowns()
    -- 复用或创建下拉菜单组
    if not controlRefs.dropDownGroup then
        controlRefs.dropDownGroup = AceGUI:Create("SimpleGroup")
        controlRefs.dropDownGroup:SetLayout("Table")
        controlRefs.dropDownGroup:SetUserData("table", {
            columns = {
                130, 160, 80 },
            space = 3,
            align = "BOTTOMLEFT"
        })
        controlRefs.dropDownGroup:SetFullWidth(true)
        controlRefs.dropDownGroup:SetHeight(40) -- 设置固定高度，方便计算可用高度
        main_frame:AddChild(controlRefs.dropDownGroup)
        
        -- 存储下拉菜单组的引用，用于后续计算高度
        main_frame.dropDownGroup = controlRefs.dropDownGroup
    else
        controlRefs.dropDownGroup:ReleaseChildren()
    end

    -- 复用或创建职业下拉菜单
    if not controlRefs.classDropdown then
        controlRefs.classDropdown = AceGUI:Create("Dropdown")
        controlRefs.classDropdown:SetCallback("OnValueChanged", function(_, _, key)
            class_index = key
            class = class_options_to_class[class_options[key]].name
            
            -- 清除缓存，确保数据正确性
            clearCaches()

            controlRefs.specDropdown:SetDisabled(false)
            buildSpecsDict(key)
            controlRefs.specDropdown:SetList(spec_options)
            controlRefs.specDropdown:SetValue(1)
            spec_index = 1
            spec = spec_options_to_spec[spec_options[1]]
            drawSpecData()
        end)
    end

    -- 复用或创建专精下拉菜单
    if not controlRefs.specDropdown then
        controlRefs.specDropdown = AceGUI:Create("Dropdown")
        controlRefs.specDropdown:SetCallback("OnValueChanged", function(_, _, key)
            spec_index = key
            spec = spec_options_to_spec[spec_options[key]]
            drawSpecData()
        end)
    end

    -- 复用或创建阶段下拉菜单
    if not controlRefs.phaseDropdown then
        controlRefs.phaseDropdown = AceGUI:Create("Dropdown")
        controlRefs.phaseDropdown:SetCallback("OnValueChanged", function(_, _, key)
            phase_index = key
            phase = TitanBistooltip_phases[key]
            drawSpecData()
        end)
    end

    controlRefs.specDropdown:SetDisabled(true)

    controlRefs.classDropdown:SetList(class_options)
    controlRefs.phaseDropdown:SetList(TitanBistooltip_phases)

    controlRefs.dropDownGroup:AddChild(controlRefs.classDropdown)
    controlRefs.dropDownGroup:AddChild(controlRefs.specDropdown)
    controlRefs.dropDownGroup:AddChild(controlRefs.phaseDropdown)

    -- 移除不必要的空白填充
    -- local fillerFrame = AceGUI:Create("Label")
    -- fillerFrame:SetText(" ")
    -- main_frame:AddChild(fillerFrame)

    controlRefs.classDropdown:SetValue(class_index)
    if (class_index) then
        buildSpecsDict(class_index)
        controlRefs.specDropdown:SetList(spec_options)
        controlRefs.specDropdown:SetDisabled(false)
    end
    controlRefs.specDropdown:SetValue(spec_index)
    controlRefs.phaseDropdown:SetValue(phase_index)
end

local function createSpecFrame()
    -- 复用或创建滚动框架
    if not controlRefs.scrollFrame then
        controlRefs.scrollFrame = AceGUI:Create("ScrollFrame")
        controlRefs.scrollFrame:SetLayout("Table")
        controlRefs.scrollFrame:SetUserData("table", {
            columns = {
                { width = 50 },
                { width = 30 },
                { width = 48 },
                { width = 48 },
                { width = 48 },
                { width = 48 },
                { width = 48 },
                { width = 48 } },
            space = 1,
            align = "middle"
        })
        controlRefs.scrollFrame:SetFullWidth(true)
        controlRefs.scrollFrame:SetFullHeight(false)
        controlRefs.scrollFrame:SetAutoAdjustHeight(false)
        main_frame:AddChild(controlRefs.scrollFrame)
    end
    spec_frame = controlRefs.scrollFrame
    
    -- 添加面板大小变化回调，动态调整滚动框架高度
    local function updateScrollFrameHeight()
        if main_frame and main_frame.frame and main_frame.dropDownGroup and controlRefs.scrollFrame then
            local frameHeight = main_frame.frame:GetHeight()
            local titleBarHeight = 24 -- 标题栏高度
            local dropDownHeight = 40 -- 下拉菜单组高度
            local statusBarHeight = 24 -- 状态栏高度
            local padding = 10 -- 额外 padding
            
            local availableHeight = frameHeight - titleBarHeight - dropDownHeight - statusBarHeight - padding
            availableHeight = math.max(200, availableHeight) -- 确保最小高度
            
            controlRefs.scrollFrame:SetHeight(availableHeight)
        end
    end
    
    -- 初始计算一次滚动框架高度
    updateScrollFrameHeight()
    
    -- 添加OnSizeChanged回调
    main_frame.frame:SetScript("OnSizeChanged", updateScrollFrameHeight)
    
    -- 确保主面板的拉伸功能正常工作
    if main_frame and main_frame.frame and main_frame.frame.SetResizeBounds then
        main_frame.frame:SetResizeBounds(435, 300, 435, 800)
    end
end

function TitanBistooltipAddon:reloadData()
    buildClassDict()
    class_index = TitanBistooltipAddon.db.char.class_index
    spec_index = TitanBistooltipAddon.db.char.spec_index
    phase_index = TitanBistooltipAddon.db.char.phase_index

    class = class_options_to_class[class_options[class_index]].name
    buildSpecsDict(class_index)
    spec = spec_options_to_spec[spec_options[spec_index]]
    phase = TitanBistooltip_phases[phase_index]
    
    -- 确保主面板的拉伸功能正常工作
    if main_frame and main_frame.frame and main_frame.frame.SetResizeBounds then
        main_frame.frame:SetResizeBounds(435, 300, 435, 800)
    end

    if main_frame then
        controlRefs.phaseDropdown:SetList(TitanBistooltip_phases)
        controlRefs.classDropdown:SetList(class_options)
        controlRefs.specDropdown:SetList(spec_options)

        controlRefs.classDropdown:SetValue(class_index)
        controlRefs.specDropdown:SetValue(spec_index)
        controlRefs.phaseDropdown:SetValue(phase_index)

        drawSpecData()
        main_frame:SetStatusText(TitanBistooltip_source_to_url[TitanBistooltipAddon.db.char["data_source"]])
        
        -- 确保状态栏长度保持一致
        if main_frame.statustext and main_frame.statustext:GetParent() then
            local statusbg = main_frame.statustext:GetParent()
            statusbg:SetPoint("BOTTOMRIGHT", -250, 15)
        end
        
        -- 确保content区域的锚点设置保持一致
        if main_frame.content then
            main_frame.content:SetPoint("BOTTOMRIGHT", -17, 40)
        end
        
        -- 更新毕业装备框体
        if TitanBistooltipAddon.updateMaxedFrame then
            TitanBistooltipAddon:updateMaxedFrame()
        end
    end
end

function TitanBistooltipAddon:createMainFrame()
    if main_frame then
        -- 如果框架已经存在，显示它并重新设置拉伸功能
        main_frame.frame:Show()
        -- 重新设置拉伸功能，避免偶尔失效
        if main_frame.frame and main_frame.frame.SetResizeBounds then
            main_frame.frame:SetResizeBounds(435, 300, 435, 800)
        end
        return
    end
    
    -- 确保全局变量与配置文件同步
    loadData()
    
    main_frame = AceGUI:Create("Frame")
    main_frame:SetWidth(435)
    main_frame:SetHeight(500)
    main_frame.frame:SetResizeBounds(435, 300, 435, 880)
    
    -- 设置main_frame引用到Core.lua
    if TitanBistooltipAddon and TitanBistooltipAddon.setMainFrameRef then
        TitanBistooltipAddon:setMainFrameRef(main_frame)
    end
    
    -- 设置主面板默认位置：屏幕右边的中间位置
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    local frameWidth = 450
    local frameHeight = 500
    local rightHalfCenterX = screenWidth * 3/4
    local centerY = screenHeight / 2
    main_frame.frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", rightHalfCenterX, centerY)

    --main_frame.frame:SetScript("OnKeyDown", function(self, key)
    --    if key == "ESCAPE" then
    --        TitanBistooltipAddon:closeMainFrame()
    --    end
    --end)
    --main_frame.frame:SetPropagateKeyboardInput(false)

    main_frame:SetCallback("OnClose", function(widget)
        -- 当框架关闭时，只隐藏它，不销毁它
        widget.frame:Hide()
    end)
    main_frame:SetLayout("List")
    main_frame:SetTitle(TitanBistooltipAddon.AddonNameAndVersion)
    main_frame:SetStatusText(TitanBistooltip_source_to_url[TitanBistooltipAddon.db.char["data_source"]])
    
    -- 修改状态栏长度，缩短1/3
    if main_frame.statustext and main_frame.statustext:GetParent() then
        local statusbg = main_frame.statustext:GetParent()
        statusbg:SetPoint("BOTTOMRIGHT", -250, 15)
    end
    
    -- 恢复content区域的默认锚点设置
    if main_frame.content then
        main_frame.content:SetPoint("BOTTOMRIGHT", -17, 40)
    end
    
    -- 添加阶段毕业装备按钮
        if main_frame.frame then
            -- 查找关闭按钮
            local closeButton = nil
            for _, child in ipairs({main_frame.frame:GetChildren()}) do
                if child:GetObjectType() == "Button" and child:GetText() == CLOSE then
                    closeButton = child
                    -- 修改关闭按钮宽度
                    closeButton:SetWidth(80)
                    break
                end
            end
            
            -- 创建阶段毕业装备按钮
            if closeButton then
                -- 创建毕业装备按钮
                local bisButton = CreateFrame("Button", nil, main_frame.frame, "UIPanelButtonTemplate")
                bisButton:SetPoint("RIGHT", closeButton, "LEFT", -15, 0)
                bisButton:SetHeight(20)
                bisButton:SetWidth(70)
                bisButton:SetText("毕业配装")
                bisButton:SetScript("OnClick", function()
                    TitanBistooltipAddon:showMaxedFrame()
                end)
                -- 设置按钮透明度
                if bisButton:GetNormalTexture() then
                    bisButton:GetNormalTexture():SetAlpha(0.5)
                end
                if bisButton:GetPushedTexture() then
                    bisButton:GetPushedTexture():SetAlpha(0.5)
                end
                if bisButton:GetHighlightTexture() then
                    bisButton:GetHighlightTexture():SetAlpha(0.5)
                end
                main_frame.bisButton = bisButton
                
                -- 创建设置按钮
                local gearButton = CreateFrame("Button", nil, main_frame.frame, "UIPanelButtonTemplate")
                gearButton:SetSize(50, 20)
                gearButton:SetPoint("RIGHT", bisButton, "LEFT", -10, 0)
                gearButton:SetText("设置")
                gearButton:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetText("点击进入设置界面")
                    GameTooltip:Show()
                end)
                gearButton:SetScript("OnLeave", function(self)
                    GameTooltip:Hide()
                end)
                gearButton:SetScript("OnClick", function(self)
                    -- 点击进入设置界面
                    TitanBistooltipAddon:openConfigDialog()
                end)
                -- 设置按钮透明度
                if gearButton:GetNormalTexture() then
                    gearButton:GetNormalTexture():SetAlpha(0.5)
                end
                if gearButton:GetPushedTexture() then
                    gearButton:GetPushedTexture():SetAlpha(0.5)
                end
                if gearButton:GetHighlightTexture() then
                    gearButton:GetHighlightTexture():SetAlpha(0.5)
                end
                main_frame.gearButton = gearButton
                
                -- 设置关闭按钮透明度
                if closeButton:GetNormalTexture() then
                    closeButton:GetNormalTexture():SetAlpha(0.5)
                end
                if closeButton:GetPushedTexture() then
                    closeButton:GetPushedTexture():SetAlpha(0.5)
                end
                if closeButton:GetHighlightTexture() then
                    closeButton:GetHighlightTexture():SetAlpha(0.5)
                end
            end
            
            local xButton = CreateFrame("Button", nil, main_frame.frame, "UIPanelCloseButton")
            xButton:SetPoint("TOPRIGHT", main_frame.frame, "TOPRIGHT", -2, -2)
            xButton:SetFrameLevel(main_frame.frame:GetFrameLevel() + 2)
            xButton:SetHitRectInsets(0, 0, 0, 0)
            xButton:SetScript("OnClick", function(self)
                main_frame.frame:Hide()
            end)
            main_frame.xButton = xButton
        end
    
    drawDropdowns()
    createSpecFrame()
    drawSpecData()
end

function TitanBistooltipAddon:closeMainFrame()
    if main_frame then
        main_frame.frame:Hide()
        return
    end
end

function TitanBistooltipAddon:ToggleBisListFrame()
    if main_frame and main_frame.frame:IsVisible() then
        main_frame.frame:Hide()
    else
        TitanBistooltipAddon:createMainFrame()
        -- 确保拉伸功能正常工作
        if main_frame and main_frame.frame and main_frame.frame.SetResizeBounds then
            main_frame.frame:SetResizeBounds(435, 300, 435, 800)
        end
    end
end

function TitanBistooltipAddon:showPhaseBISFrame()
    -- 检查是否已经存在阶段毕业装备框体
    if TitanBistooltipAddon.phaseBISFrame then
        TitanBistooltipAddon.phaseBISFrame.frame:Show()
        return
    end
    
    -- 创建阶段毕业装备框体
    local frame = AceGUI:Create("Frame")
    frame:SetWidth(500)
    frame:SetHeight(400)
    frame:SetTitle("阶段毕业装备 - " .. class .. " " .. spec .. " " .. phase)
    frame:SetLayout("List")
    frame:SetCallback("OnClose", function(widget)
        widget.frame:Hide()
    end)
    
    -- 创建滚动框架
    local scrollFrame = AceGUI:Create("ScrollFrame")
    scrollFrame:SetLayout("Table")
    scrollFrame:SetUserData("table", {
        columns = {
            { width = 80 },
            { width = 50 },
            { width = 50 },
            { width = 50 },
            { width = 50 },
            { width = 50 },
            { width = 50 }
        },
        space = 1,
        align = "middle"
    })
    scrollFrame:SetFullWidth(true)
    scrollFrame:SetFullHeight(true)
    frame:AddChild(scrollFrame)
    
    -- 添加表头
    local headerLabel = AceGUI:Create("Label")
    headerLabel:SetText("部位")
    headerLabel:SetColor(1, 1, 0)
    scrollFrame:AddChild(headerLabel)
    
    for i = 1, 6 do
        local headerLabel = AceGUI:Create("Label")
        headerLabel:SetText("Top " .. i)
        headerLabel:SetColor(1, 1, 0)
        scrollFrame:AddChild(headerLabel)
    end
    
    -- 添加每个部位的BIS装备
    if TitanBistooltip_bislists[class] and TitanBistooltip_bislists[class][spec] and TitanBistooltip_bislists[class][spec][phase] then
        local slots = TitanBistooltip_bislists[class][spec][phase]
        
        for _, slot in ipairs(slots) do
            -- 添加部位名称
            local slotLabel = AceGUI:Create("Label")
            slotLabel:SetText(L[slot.slot_name])
            scrollFrame:AddChild(slotLabel)
            
            -- 添加每个位置的装备
            for i = 1, 6 do
                local itemId = slot[i]
                if itemId and itemId > 0 then
                    local itemFrame = createItemFrame(itemId, 40)
                    scrollFrame:AddChild(itemFrame)
                else
                    local emptyLabel = AceGUI:Create("Label")
                    scrollFrame:AddChild(emptyLabel)
                end
            end
        end
    end
    
    -- 保存框体引用
    TitanBistooltipAddon.phaseBISFrame = frame
end

function TitanBistooltipAddon:initBislists()
    buildClassDict()
    loadData()
    LibStub("AceConsole-3.0"):RegisterChatCommand("titanbistooltip", function()
        TitanBistooltipAddon:createMainFrame()
    end)
    LibStub("AceConsole-3.0"):RegisterChatCommand("bis", function()
        TitanBistooltipAddon:createMainFrame()
    end)
end