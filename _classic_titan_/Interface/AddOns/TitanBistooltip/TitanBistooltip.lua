local LibExtraTip = LibStub:GetLibrary("LibExtraTip-1");
local eventFrame = CreateFrame("Frame", nil, UIParent)
local L = LibStub("AceLocale-3.0"):GetLocale("TitanBistooltip", false)
TitanBistooltip_phases_string = ""

-- 快捷键绑定定义
BINDING_HEADER_TITANBISTOOLTIP = "TitanBistooltip"
BINDING_NAME_TOGGLE_BISLIST = L["打开/关闭 BIS面板"] or "Toggle BIS Panel"

local function specHighlighted(class_name, spec_name)
    -- 遍历所有职业，检查当前职业是否在高亮列表中
    for key, value in pairs(TitanBistooltipAddon.db.char.highlight_specs) do
        if value then
            local ci, si = strsplit(":", key)
            ci = tonumber(ci)
            si = tonumber(si)
            if ci and si and TitanBistooltip_classes[ci] then
                local highlight_class_name = TitanBistooltip_classes[ci].name
                local highlight_spec_name = TitanBistooltip_classes[ci].specs[si]
                if highlight_class_name == class_name and highlight_spec_name == spec_name then
                    return true
                end
            end
        end
    end
    return false
end

local function specFiltered(class_name, spec_name)
    if specHighlighted(class_name, spec_name) then
        return false
    end
    if IsAltKeyDown() then
        return false
    end
    
    -- 处理术士的Destruction fire映射到Destruction
    local actual_spec_name = spec_name
    if class_name == "Warlock" and spec_name == "Destruction fire" then
        actual_spec_name = "Destruction"
    end
    
    -- 确保过滤配置存在且默认值为false
    if not TitanBistooltipAddon.db.char.filter_specs[class_name] then
        TitanBistooltipAddon.db.char.filter_specs[class_name] = {}
    end
    if TitanBistooltipAddon.db.char.filter_specs[class_name][actual_spec_name] == nil then
        TitanBistooltipAddon.db.char.filter_specs[class_name][actual_spec_name] = false
    end
    
    return TitanBistooltipAddon.db.char.filter_specs[class_name][actual_spec_name]
end

local function classNamesFiltered()
    if TitanBistooltipAddon.db.char.filter_class_names then
        return true
    end
end

local function getFilteredItem(item)
    local filtered_item = {}

    for ki, spec in ipairs(item) do
        local class_name = spec.class_name
        local spec_name = spec.spec_name
        
        if (not specFiltered(class_name, spec_name)) then
            table.insert(filtered_item, spec)
        end
    end
    
    return filtered_item
end

local function getDynamicRank(itemId, class_name, spec_name, slot_name)
    -- 根据 TitanBistooltip_bislists 中的数据动态计算排名
    local phases = TitanBistooltip_phases
    local dynamic_ranks = {}
    
    for phase_index, phase_name in ipairs(phases) do
        local phase_rank = "-"
        
        -- 检查该阶段是否有数据
        if TitanBistooltip_bislists[class_name] and 
           TitanBistooltip_bislists[class_name][spec_name] and 
           TitanBistooltip_bislists[class_name][spec_name][phase_name] then
            
            -- 遍历该阶段的装备槽
            local slots = TitanBistooltip_bislists[class_name][spec_name][phase_name]
            for _, slot in ipairs(slots) do
                if slot.slot_name == slot_name then
                    -- 查找该装备在当前阶段的排名
                    for rank = 1, 6 do
                        if slot[rank] == itemId and slot[rank] ~= -1 then
                            phase_rank = tostring(rank)
                            break
                        end
                    end
                    break
                end
            end
        end
        
        table.insert(dynamic_ranks, phase_rank)
    end
    
    -- 返回排名表，而不是拼接后的字符串，以便后续处理对齐
    return dynamic_ranks
end

local function getFormattedRanks(ranks)
    -- 确保排名部分右对齐，使用固定宽度
    local max_width = 12
    local current_width = string.len(ranks)
    if current_width < max_width then
        local padding = string.rep(" ", max_width - current_width)
        return padding .. ranks
    end
    return ranks
end

local currentItemId = nil

local function printSpecLine(tooltip, slot, class_name, spec_name)
    local slot_name = slot.name
    local prefix = "   "
    if TitanBistooltipAddon.db.char.filter_class_names then
        prefix = ""
    end
    local left_text = prefix .. "|T" .. TitanBistooltip_spec_icons[class_name][spec_name] .. ":14|t " .. L[spec_name]
    if (slot_name == "Off hand" or slot_name == "Weapon" or slot_name == "Weapon 1h" or slot_name == "Weapon 2h") then
        left_text = left_text .. " (" .. L[slot_name] .. ")"
    end
    local color_r = 1
    local color_g = 0.8
    local color_b = 0
    if specHighlighted(class_name, spec_name) then
        color_r = 0.074
        color_g = 0.964
        color_b = 0.129
    end
    
    -- 动态计算排名
    local slot_ranks = getDynamicRank(currentItemId, class_name, spec_name, slot_name)
    
    -- 格式化排名，确保竖状对齐
    -- 为每个阶段的排名添加适当的空格，确保与表头对齐
    local formatted_ranks = ""
    local phases = TitanBistooltip_phases
    
    -- 检查slot_ranks是否是表
    if type(slot_ranks) == "table" then
        -- 为每个阶段的排名添加适当的空格，确保与表头对齐
        for i, rank in ipairs(slot_ranks) do
            if i == 1 then
                -- PR阶段，添加空格使其与表头PR对齐
                formatted_ranks = formatted_ranks .. "   " .. rank -- 3个空格
            elseif i == 2 then
                -- P1阶段，添加空格使其与表头P1对齐
                formatted_ranks = formatted_ranks .. "/  " .. rank -- 2个空格
            elseif i == 3 then
                -- P2阶段，添加空格使其与表头P2对齐
                formatted_ranks = formatted_ranks .. "/  " .. rank -- 2个空格
            end
        end
    else
        -- 如果slot_ranks不是表，直接使用
        formatted_ranks = slot_ranks
    end
    
    LibExtraTip:AddDoubleLine(
            tooltip, left_text, formatted_ranks,
            color_r, color_g, color_b,
            color_r, color_g, color_b,
            false) -- 设置为false，使用默认对齐方式
end

local function printClassName(tooltip, class_name)
    LibExtraTip:AddLine(tooltip, L[class_name], 1, 0.8, 0, false)
end

local function OnGameTooltipSetItem(tooltip)
    if TitanBistooltipAddon.db.char.tooltip_with_ctrl and not IsControlKeyDown() then
        return
    end
    local _, link = tooltip:GetItem();

    if link == nil then
        return ;
    end

    local _, itemId, _, _, _, _, _, _, _, _, _, _, _, _ = strsplit(":", link)

    itemId = tonumber(itemId);
    currentItemId = itemId; -- 保存到全局变量
    
    -- 强制从TitanBistooltip_bislists中动态获取装备信息，避免缓存问题
    -- 这样可以确保不同ID但同名的装备都能正确显示
    local dynamic_item_data = {}
    local found = false
    
    -- 只有在不在战斗中的时候才处理
    if not InCombatLockdown() then
        -- 从TitanBistooltip_bislists中动态获取装备的职业、专精和槽位信息
        local temp_item_data = {}
        
        for class_name, class_data in pairs(TitanBistooltip_bislists) do
            for spec_name, spec_data in pairs(class_data) do
                for phase_name, phase_data in pairs(spec_data) do
                    for _, slot_data in ipairs(phase_data) do
                        for i = 1, 6 do
                            if slot_data[i] == itemId then
                                -- 找到装备在BIS列表中的位置
                                local slot_name = slot_data.slot_name
                                
                                -- 检查是否已经添加过相同的职业-专精-槽位组合
                                local already_exists = false
                                for _, entry in ipairs(temp_item_data) do
                                    if entry.class_name == class_name and entry.spec_name == spec_name and entry.slot_name == slot_name then
                                        already_exists = true
                                        break
                                    end
                                end
                                
                                if not already_exists then
                                    -- 添加到动态装备数据中
                                    table.insert(temp_item_data, {
                                        class_name = class_name,
                                        spec_name = spec_name,
                                        slot_name = slot_name
                                    })
                                    found = true
                                end
                            end
                        end
                    end
                end
            end
        end
        
        -- 如果找到装备信息，更新dynamic_item_data
        if found then
            dynamic_item_data = temp_item_data
            
            -- 同时更新TitanBistooltip_Titan_items缓存
            TitanBistooltip_Titan_items[itemId] = {}
            
            -- 添加缓存时间戳
            TitanBistooltip_Titan_items[itemId]._cache_time = GetTime()
            
            -- 按职业分组，同一职业的所有专精都放在一起
            local class_map = {}
            for _, entry in ipairs(temp_item_data) do
                local class_name = entry.class_name
                local spec_name = entry.spec_name
                local slot_name = entry.slot_name
                
                -- 检查职业是否已经存在
                if not class_map[class_name] then
                    class_map[class_name] = {}
                end
                
                -- 检查专精是否已经存在
                if not class_map[class_name][spec_name] then
                    class_map[class_name][spec_name] = {
                        class_name = class_name,
                        spec_name = spec_name,
                        slots = {}
                    }
                end
                
                -- 检查槽位是否已经存在
                local slot_exists = false
                for _, existing_slot in ipairs(class_map[class_name][spec_name].slots) do
                    if existing_slot.name == slot_name then
                        slot_exists = true
                        break
                    end
                end
                
                if not slot_exists then
                    -- 添加槽位
                    table.insert(class_map[class_name][spec_name].slots, {
                        name = slot_name,
                        ranks = "- / - / -" -- 占位符，实际排名会动态计算
                    })
                end
            end
            
            -- 转换为TitanBistooltip_Titan_items的格式
            for _, specs in pairs(class_map) do
                for _, item_info in pairs(specs) do
                    table.insert(TitanBistooltip_Titan_items[itemId], item_info)
                end
            end
        end
    else
        -- 如果在战斗中，尝试从缓存中获取数据
        if TitanBistooltip_Titan_items[itemId] then
            for _, item_info in pairs(TitanBistooltip_Titan_items[itemId]) do
                -- 跳过缓存时间字段
                if type(item_info) == "table" and item_info.class_name then
                    local class_name = item_info.class_name
                    local spec_name = item_info.spec_name
                    for _, slot_info in pairs(item_info.slots) do
                        local slot_name = slot_info.name
                        table.insert(dynamic_item_data, {
                            class_name = class_name,
                            spec_name = spec_name,
                            slot_name = slot_name
                        })
                    end
                end
            end
            found = #dynamic_item_data > 0
        end
    end
    
    -- 如果没有找到装备信息，直接返回
    if not found then
        return
    end
    
    -- 应用过滤，根据用户设置显示相关专精
    local filtered_item_data = getFilteredItem(dynamic_item_data)
    if (#filtered_item_data > 0) then
        LibExtraTip:AddDoubleLine(tooltip, L["Spec name"], TitanBistooltip_phases_string, 1, 1, 0, 1, 1, 0, false)
    else
        return
    end
    
    -- 按职业排序，确保同一职业的所有专精都连续出现
    table.sort(filtered_item_data, function(a, b)
        return a.class_name < b.class_name
    end)
    
    local previous_class = nil
    for ki, spec in ipairs(filtered_item_data) do
        local class_name = spec.class_name
        local spec_name = spec.spec_name
        local slot_name = spec.slot_name
        
        if (not classNamesFiltered()) then
            if not (previous_class == class_name) then
                printClassName(tooltip, class_name)
                previous_class = class_name
            end
        end
        
        -- 创建临时slot对象用于printSpecLine函数
        local temp_slot = {
            name = slot_name
        }
        
        printSpecLine(tooltip, temp_slot, class_name, spec_name)
    end
    if #filtered_item_data > 0 and TitanBistooltip_char_equipment[itemId] ~= nil then
        LibExtraTip:AddLine(tooltip, " ", 1, 1, 0, false)
        if TitanBistooltip_char_equipment[itemId] == 2 then
            LibExtraTip:AddLine(tooltip, L["You have this item equipped"], 0.074, 0.964, 0.129, false)
        else
            LibExtraTip:AddLine(tooltip, L["You have this item"], 0.074, 0.964, 0.129, false)
        end
    end
    if #filtered_item_data < #dynamic_item_data then
        if #filtered_item_data > 0 then
            LibExtraTip:AddLine(tooltip, " ", 1, 1, 0, false)
        end
        LibExtraTip:AddLine(tooltip, L["Hold ALT to disable spec filtering"], 0.6, 0.6, 0.6, false)
    end
end

function TitanBistooltipAddon:initBisTooltip()
    -- 检测 TipTac 及其相关插件是否存在
    local hasTipTac = IsAddOnLoaded("TipTac") or IsAddOnLoaded("TipTacItemRef") or IsAddOnLoaded("TipTacTalents")
    TitanBistooltipAddon.hasTipTac = hasTipTac
    
    -- 无论是否存在 TipTac，都使用相同的回调设置
    -- 确保 OnGameTooltipSetItem 函数能够被正确调用
    LibExtraTip:AddCallback({ type = "item", callback = OnGameTooltipSetItem, allevents = true })
    
    LibExtraTip:RegisterTooltip(GameTooltip);
    LibExtraTip:RegisterTooltip(ItemRefTooltip);
    
    eventFrame:RegisterEvent("MODIFIER_STATE_CHANGED");
    eventFrame:SetScript("OnEvent", function(_, _, e_key, _, _)
        -- 如果 TipTac 存在，减少事件处理频率
        if hasTipTac then
            return
        end
        
        if (GameTooltip:GetOwner()) then
            if (GameTooltip:GetOwner().hasItem) then
                return
            end

            if (e_key == "RALT" or e_key == "LALT") then
                local _, link = GameTooltip:GetItem()
                if link then
                    GameTooltip:SetHyperlink("|cff9d9d9d|Hitem:3299::::::::20:257::::::|h[Fractured Canine]|h|r")
                    GameTooltip:SetHyperlink(link)
                end
            end
        end
    end)
end