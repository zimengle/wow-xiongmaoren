local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("TitanBistooltip", false)

-- 复制文本到剪贴板的统一函数
local function copyTextToClipboard(text)
    if text and text ~= "" then
        -- 使用全局永久 EditBox 进行复制
        if not _G.TitanBistooltipCopyEditBox then
            _G.TitanBistooltipCopyEditBox = CreateFrame("EditBox", "TitanBistooltipCopyEditBox", UIParent, "InputBoxTemplate")
            _G.TitanBistooltipCopyEditBox:SetSize(200, 20)
            _G.TitanBistooltipCopyEditBox:SetMultiLine(false)
            _G.TitanBistooltipCopyEditBox:SetAutoFocus(false)
            _G.TitanBistooltipCopyEditBox:ClearAllPoints()
            _G.TitanBistooltipCopyEditBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -1000, -1000) -- 放到屏幕外
            _G.TitanBistooltipCopyEditBox:Hide()
        end
        
        local editBox = _G.TitanBistooltipCopyEditBox
        
        -- 执行复制操作
        local success, err = pcall(function()
            editBox:Show()
            editBox:SetText(text)
            editBox:HighlightText(0, -1) -- 高亮整个文本
            
            -- 检查是否有 CopyText 方法
            if editBox.CopyText then
                editBox:CopyText()
            else
                -- WLK 版本不支持 CopyText，尝试使用替代方法
                -- 首先尝试直接向聊天框输入
                local chatFrame = ChatEdit_GetActiveWindow()
                if chatFrame then
                    chatFrame:Insert(text)
                    success = true
                else
                    -- 没有聊天框激活，显示提示
                    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00请打开聊天窗口后再右键点击复制|r")
                    success = false
                end
            end
            
            editBox:Hide()
        end)
        
        if not success and err then
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000复制到剪贴板失败: " .. tostring(err) .. "|r")
        end
        
        return success
    end
    
    return false
end

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

local classDropdown = nil
local specDropdown = nil
local phaseDropDown = nil

local checkmarks = {}
local boemarks = {}

local isHorde = UnitFactionGroup("player") == "Horde"

-- 添加缓存机制，避免重复计算
local itemCache = {}
local factionItemCache = {}
local equipmentCache = {}

-- 清除缓存
local function clearCaches()
    itemCache = {}
    factionItemCache = {}
    equipmentCache = {}
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
            if with_checkmark == true then
                local checkMark = item_frame.frame:CreateTexture(nil, "OVERLAY")
                checkMark:SetWidth(32)
                checkMark:SetHeight(32)
                checkMark:SetPoint("CENTER", 6, -8)
                checkMark:SetTexture("Interface\\AddOns\\TitanBistooltip\\checkmark-16.tga")
                table.insert(checkmarks, checkMark)
            end

            local _, _, _, _, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(item_id)
            if bindType == (LE_ITEM_BIND_ON_EQUIP or 2) then
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
                    local itemName = GetItemInfo(item_id)
                    if itemName then
                        -- 尝试复制到剪贴板
                        local success = copyTextToClipboard(itemName)
                    else
                        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000无法获取物品名称|r")
                    end
                end
            end)
            
            -- 保持左键点击功能
            item_frame:SetCallback("OnClick", function(widget, event, button)
                if button == "LeftButton" then
                    SetItemRef(ilink, ilink, "LeftButton")
                end
            end)
            item_frame:SetCallback("OnEnter", function(widget)
                GameTooltip:SetOwner(item_frame.frame, "ANCHOR_NONE")
                local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                if position == "right" then
                    GameTooltip:SetPoint("TOPRIGHT", item_frame.frame, "TOPRIGHT", 220, -13);
                else
                    GameTooltip:SetPoint("BOTTOMLEFT", item_frame.frame, "TOPRIGHT", 10, -13);
                end
                GameTooltip:SetHyperlink(ilink)
            end)
            item_frame:SetCallback("OnLeave", function(widget)
                GameTooltip:Hide()
            end)
        end)
    end
    return item_frame
end

local function createSpellFrame(spell_id, size)
    if spell_id < 0 then
        local f = AceGUI:Create("Label")
        return f
    end
    local spell_frame = AceGUI:Create("Icon")
    spell_frame:SetImageSize(size, size)
    spells[spell_id] = Spell:CreateFromSpellID(spell_id);

    if (spells[spell_id]:GetSpellID()) then
        spells[spell_id]:ContinueOnSpellLoad(function()
            local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(spell_id)
            spell_frame:SetImage(icon)
            local link = GetSpellLink(spell_id)
            if link == nil then
                link = "\124cffffd000\124Hspell:" .. spell_id .. "\124h[" .. name .. "]\124h\124r"
            end
            -- 直接在按钮上绑定右键点击事件
            spell_frame.frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            spell_frame.frame:SetScript("OnMouseUp", function(self, button)
                if button == "RightButton" then
                    -- 复制法术/附魔名称
                    local spellName = name
                    if spellName then
                        -- 尝试复制到剪贴板
                        local success = copyTextToClipboard(spellName)
                    else
                        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000无法获取法术/附魔名称|r")
                    end
                end
            end)
            
            -- 保持左键点击功能
            spell_frame:SetCallback("OnClick", function(widget, event, button)
                if button == "LeftButton" then
                    SetItemRef(link, link, "LeftButton")
                end
            end)
            spell_frame:SetCallback("OnEnter", function(widget)
                GameTooltip:SetOwner(spell_frame.frame, "ANCHOR_NONE")
                local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
                if position == "right" then
                    GameTooltip:SetPoint("TOPRIGHT", spell_frame.frame, "TOPRIGHT", 220, -13);
                else
                    GameTooltip:SetPoint("BOTTOMLEFT", spell_frame.frame, "TOPRIGHT", 10, -13);
                end
                GameTooltip:SetHyperlink(link)
            end)
            spell_frame:SetCallback("OnLeave", function(widget)
                GameTooltip:Hide()
            end)
        end)
    else
        -- 法术ID无效时的处理
        spell_frame:SetCallback("OnEnter", function(widget)
            GameTooltip:SetOwner(spell_frame.frame, "ANCHOR_NONE")
            local position = TitanBistooltipAddon.db.char.tooltip_position or "bottom"
            if position == "right" then
                GameTooltip:SetPoint("TOPRIGHT", spell_frame.frame, "TOPRIGHT", 220, -13);
            else
                GameTooltip:SetPoint("BOTTOMLEFT", spell_frame.frame, "TOPRIGHT", 10, -13);
            end
            GameTooltip:SetText("|cffff0000无效的法术ID|r")
            GameTooltip:Show()
        end)
        spell_frame:SetCallback("OnLeave", function(widget)
            GameTooltip:Hide()
        end)
    end
    return spell_frame
end

local function createEnhancementsFrame(enhancements)
    local frame = AceGUI:Create("SimpleGroup")
    frame:SetLayout("Table")
    frame:SetWidth(40)
    frame:SetHeight(40)
    frame:SetUserData("table", {
        columns = {
            { weight = 14 },
            { width = 14 } },
        spaceV = -10,
        spaceH = 0,
        align = "BOTTOMRIGHT"
    })
    frame:SetFullWidth(true)
    frame:SetFullHeight(true)
    frame:SetHeight(0)
    frame:SetAutoAdjustHeight(false)
    for i, enhancement in ipairs(enhancements) do
        local size = 16

        if enhancement.type == "none" then
            frame:AddChild(createItemFrame(-1, size))
        end
        if enhancement.type == "item" then
            frame:AddChild(createItemFrame(enhancement.id, size))
        end
        if enhancement.type == "spell" then
            frame:AddChild(createSpellFrame(enhancement.id, size))
        end
    end
    return frame
end

local function drawItemSlot(slot)
    local f = AceGUI:Create("Label")
    -- f:SetText(slot.slot_name)
    -- f:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    f:SetText(L[slot.slot_name])
    spec_frame:AddChild(f)
    spec_frame:AddChild(createEnhancementsFrame(slot.enhs))
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
            if equipmentCache[cacheKey] == nil then
                equipmentCache[cacheKey] = TitanBistooltip_char_equipment[item_id] ~= nil
            end
            hasEquipment = equipmentCache[cacheKey]
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
    spec_frame:ReleaseChildren()
    drawTableHeader(spec_frame)
    if not spec or not phase then
        return
    end
    local slots = TitanBistooltip_bislists[class][spec][phase]
    
    -- 使用延迟加载机制，避免一次性创建大量 UI 元素导致卡顿
    local currentIndex = 1
    local function loadNextSlot()
        if currentIndex <= #slots then
            drawItemSlot(slots[currentIndex])
            currentIndex = currentIndex + 1
            -- 每次加载一个槽位，延迟 0.01 秒，避免卡顿
            C_Timer.After(0.01, loadNextSlot)
        end
    end
    
    -- 开始延迟加载
    loadNextSlot()
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
    phase_index = TitanBistooltipAddon.db.char.phase_index
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
    local dropDownGroup = AceGUI:Create("SimpleGroup")

    dropDownGroup:SetLayout("Table")
    dropDownGroup:SetUserData("table", {
        columns = {
            130, 160, 80 },
        space = 3,
        align = "BOTTOMRIGHT"
    })
    main_frame:AddChild(dropDownGroup)

    classDropdown = AceGUI:Create("Dropdown")
    specDropdown = AceGUI:Create("Dropdown")
    phaseDropDown = AceGUI:Create("Dropdown")
    specDropdown:SetDisabled(true)

    phaseDropDown:SetCallback("OnValueChanged", function(_, _, key)
        phase_index = key
        phase = TitanBistooltip_phases[key]
        drawSpecData()
    end)

    specDropdown:SetCallback("OnValueChanged", function(_, _, key)
        spec_index = key
        spec = spec_options_to_spec[spec_options[key]]
        drawSpecData()
    end)

    classDropdown:SetCallback("OnValueChanged", function(_, _, key)
        class_index = key
        class = class_options_to_class[class_options[key]].name
        
        -- 清除缓存，确保数据正确性
        clearCaches()

        specDropdown:SetDisabled(false)
        buildSpecsDict(key)
        specDropdown:SetList(spec_options)
        specDropdown:SetValue(1)
        spec_index = 1
        spec = spec_options_to_spec[spec_options[1]]
        drawSpecData()
    end)

    classDropdown:SetList(class_options)
    phaseDropDown:SetList(TitanBistooltip_phases)

    dropDownGroup:AddChild(classDropdown)
    dropDownGroup:AddChild(specDropdown)
    dropDownGroup:AddChild(phaseDropDown)

    local fillerFrame = AceGUI:Create("Label")
    fillerFrame:SetText(" ")
    main_frame:AddChild(fillerFrame)

    classDropdown:SetValue(class_index)
    if (class_index) then
        buildSpecsDict(class_index)
        specDropdown:SetList(spec_options)
        specDropdown:SetDisabled(false)
    end
    specDropdown:SetValue(spec_index)
    phaseDropDown:SetValue(phase_index)
end

local function createSpecFrame()
    local frame = AceGUI:Create("ScrollFrame")
    frame:SetLayout("Table")
    frame:SetUserData("table", {
        columns = {
            { width = 60 },
            { width = 40 },
            { width = 44 },
            { width = 44 },
            { width = 44 },
            { width = 44 },
            { width = 44 },
            { width = 44 } },
        space = 1,
        align = "middle"
    })
    frame:SetFullWidth(true)
    frame:SetHeight(0)
    frame:SetAutoAdjustHeight(false)
    main_frame:AddChild(frame)
    spec_frame = frame
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

    if main_frame then
        phaseDropDown:SetList(TitanBistooltip_phases)
        classDropdown:SetList(class_options)
        specDropdown:SetList(spec_options)

        classDropdown:SetValue(class_index)
        specDropdown:SetValue(spec_index)
        phaseDropDown:SetValue(phase_index)

        drawSpecData()
        main_frame:SetStatusText(TitanBistooltip_source_to_url[TitanBistooltipAddon.db.char["data_source"]])
    end
end

function TitanBistooltipAddon:createMainFrame()
    if main_frame then
        -- 如果框架已经存在，只需要显示它，不需要销毁并重新创建
        main_frame.frame:Show()
        return
    end
    
    -- 确保全局变量与配置文件同步
    loadData()
    
    main_frame = AceGUI:Create("Frame")
    main_frame:SetWidth(450)
    main_frame.frame:SetResizeBounds(450, 300, 450, nil)

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
    end
end

function TitanBistooltipAddon:initBislists()
    buildClassDict()
    loadData()
    LibStub("AceConsole-3.0"):RegisterChatCommand("titanbistooltip", function()
        TitanBistooltipAddon:createMainFrame()
    end, persist)
    LibStub("AceConsole-3.0"):RegisterChatCommand("bis", function()
        TitanBistooltipAddon:createMainFrame()
    end, persist)
end