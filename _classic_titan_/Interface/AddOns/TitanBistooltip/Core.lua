TitanBistooltipAddon = LibStub("AceAddon-3.0"):NewAddon("TitanBistooltip")

-- 全局函数用于按键绑定
function TitanBistooltipToggle()
    if TitanBistooltipAddon and TitanBistooltipAddon.ToggleBisListFrame then
        TitanBistooltipAddon:ToggleBisListFrame()
    end
end
--local AceAddon =

TitanBistooltip_char_equipment = {}

-- 阶段间装备继承功能：当当前阶段装备有空缺时，自动从前一阶段填充
local function inheritEquipmentFromPreviousPhase()
    local phases = TitanBistooltip_phases
    for class_name, class_data in pairs(TitanBistooltip_bislists) do
        for spec_name, spec_data in pairs(class_data) do
            -- 按阶段顺序处理（PR → P1 → P2）
            for phase_index = 2, #phases do
                local current_phase = phases[phase_index]
                local previous_phase = phases[phase_index - 1]
                
                -- 检查前一阶段是否存在该职业专精的数据
                if spec_data[previous_phase] and spec_data[current_phase] then
                    for slot_index, current_slot in ipairs(spec_data[current_phase]) do
                        local previous_slot = nil
                        -- 找到前一阶段相同部位的slot
                        for _, prev_s in ipairs(spec_data[previous_phase]) do
                            if prev_s.slot_name == current_slot.slot_name then
                                previous_slot = prev_s
                                break
                            end
                        end
                        
                        if previous_slot then
                            -- 填充当前阶段的-1空缺位置
                            local fill_index = 1
                            for i = 1, 6 do
                                if current_slot[i] == -1 or current_slot[i] == nil then
                                    -- 从前一阶段找可用的装备
                                    while fill_index <= 6 do
                                        local prev_item = previous_slot[fill_index]
                                        if prev_item and prev_item ~= -1 then
                                            -- 检查当前阶段是否已包含该装备（避免重复）
                                            local already_exists = false
                                            for j = 1, 6 do
                                                if current_slot[j] == prev_item then
                                                    already_exists = true
                                                    break
                                                end
                                            end
                                            if not already_exists then
                                                current_slot[i] = prev_item
                                                fill_index = fill_index + 1
                                                break
                                            end
                                        end
                                        fill_index = fill_index + 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function createEquipmentWatcher()
    local frame = CreateFrame("Frame")
    frame:Hide()

    frame:SetScript("OnEvent", frame.Show)
    frame:RegisterEvent("BAG_UPDATE")

    local flag = false

    frame:SetScript("OnUpdate", function(self)
        self:Hide()
        if flag == false then
            flag = true
            local collection = {}
            for bag = 0, NUM_BAG_SLOTS do
                for slot = 1, C_Container.GetContainerNumSlots(bag) do
                    local itemID = C_Container.GetContainerItemID(bag, slot)
                    if itemID ~= nil then
                        collection[itemID] = 1
                    end
                end
            end
            for i=0,18 do
                local itemID = GetInventoryItemID("player", i)
                if itemID ~= nil then
                    collection[itemID] = 2
                end
            end
            TitanBistooltip_char_equipment = collection
            flag = false
        end
    end)
end

local function getPlayerClassAndSpec()
    local _, englishClass, classIndex = UnitClass("player")
    local specIndex = nil
    local specName = nil
    local specID = nil
    
    -- 检查GetSpecialization函数是否存在
    if GetSpecialization then
        specIndex = GetSpecialization()
        if specIndex and GetSpecializationInfo then
            specID, specName = GetSpecializationInfo(specIndex)
        end
    end
    
    -- 映射职业名称到插件内部使用的格式
    local classMap = {
        ["DEATHKNIGHT"] = "Death knight",
        ["DRUID"] = "Druid",
        ["HUNTER"] = "Hunter",
        ["MAGE"] = "Mage",
        ["PALADIN"] = "Paladin",
        ["PRIEST"] = "Priest",
        ["ROGUE"] = "Rogue",
        ["SHAMAN"] = "Shaman",
        ["WARLOCK"] = "Warlock",
        ["WARRIOR"] = "Warrior"
    }
    
    local mappedClassName = classMap[englishClass]
    
    -- 映射天赋名称到插件内部使用的格式
    local specMap = {
        ["Death knight"] = {
            ["Blood"] = "Blood tank",
            ["Frost"] = "Frost",
            ["Unholy"] = "Unholy"
        },
        ["Druid"] = {
            ["Balance"] = "Balance",
            ["Feral Combat"] = "Feral dps",
            ["Guardian"] = "Feral tank",
            ["Restoration"] = "Restoration"
        },
        ["Hunter"] = {
            ["Beast Mastery"] = "Beast mastery",
            ["Marksmanship"] = "Marksmanship",
            ["Survival"] = "Survival"
        },
        ["Mage"] = {
            ["Arcane"] = "Arcane",
            ["Fire"] = "Fire",
            ["Frost"] = "Frost"
        },
        ["Paladin"] = {
            ["Holy"] = "Holy",
            ["Protection"] = "Protection",
            ["Retribution"] = "Retribution"
        },
        ["Priest"] = {
            ["Discipline"] = "Discipline",
            ["Holy"] = "Holy",
            ["Shadow"] = "Shadow"
        },
        ["Rogue"] = {
            ["Assassination"] = "Assassination",
            ["Combat"] = "Combat",
            ["Subtlety"] = "Subtlety"
        },
        ["Shaman"] = {
            ["Elemental"] = "Elemental",
            ["Enhancement"] = "Enhancement",
            ["Restoration"] = "Restoration"
        },
        ["Warlock"] = {
            ["Affliction"] = "Affliction",
            ["Demonology"] = "Demonology",
            ["Destruction"] = "Destruction"
        },
        ["Warrior"] = {
            ["Arms"] = "Arms",
            ["Fury"] = "Fury",
            ["Protection"] = "Protection"
        }
    }
    
    local mappedSpecName = specMap[mappedClassName] and specMap[mappedClassName][specName]
    
    return mappedClassName, mappedSpecName
end

local function autoDetectClassAndSpec()
    local className, mappedSpecName = getPlayerClassAndSpec()
    
    if className then
        -- 更新配置中的高亮天赋
        if mappedSpecName then
            -- 找到当前职业和天赋对应的key
            local highlight_key = nil
            for ci, class in ipairs(TitanBistooltip_classes) do
                if class.name == className then
                    for si, spec in ipairs(class.specs) do
                        if spec == mappedSpecName then
                            highlight_key = ci .. ":" .. si
                            break
                        end
                    end
                    break
                end
            end
            
            -- 确保highlight_specs表存在
            if not TitanBistooltipAddon.db.char.highlight_specs then
                TitanBistooltipAddon.db.char.highlight_specs = {}
            end
            
            -- 不自动高亮当前天赋，让用户手动选择
            -- if highlight_key then
            --     TitanBistooltipAddon.db.char.highlight_specs[highlight_key] = true
            -- end
            
            -- 确保过滤器配置正确
            if not TitanBistooltipAddon.db.char.filter_specs[className] then
                TitanBistooltipAddon.db.char.filter_specs[className] = {}
            end
            
            -- 确保当前天赋的过滤器为false（显示）
            if TitanBistooltipAddon.db.char.filter_specs[className][mappedSpecName] == nil then
                TitanBistooltipAddon.db.char.filter_specs[className][mappedSpecName] = false
            end
        end
        
        -- 更新配置中的职业、天赋和阶段索引，用于BIS装备面板
        local classIndex = TitanBistooltip_classes_indexes[className]
        if classIndex then
            TitanBistooltipAddon.db.char.class_index = classIndex
            
            -- 查找对应的天赋索引
            if mappedSpecName and TitanBistooltip_classes and TitanBistooltip_classes[classIndex] then
                for specIndex, spec in ipairs(TitanBistooltip_classes[classIndex].specs) do
                    if spec == mappedSpecName then
                        TitanBistooltipAddon.db.char.spec_index = specIndex
                        break
                    end
                end
            end
        end
        
        -- 默认使用最新阶段
        local phaseIndex = 1
        if TitanBistooltip_phases and #TitanBistooltip_phases > 0 then
            phaseIndex = #TitanBistooltip_phases
            TitanBistooltipAddon.db.char.phase_index = phaseIndex
        end
        
        -- 重新加载数据，确保全局变量和界面更新
        if TitanBistooltipAddon.reloadData then
            TitanBistooltipAddon:reloadData()
        end
    end
end

function TitanBistooltipAddon:OnInitialize()
    createEquipmentWatcher()
    TitanBistooltipAddon.AceAddonName = "TitanBistooltip"
    TitanBistooltipAddon.AddonNameAndVersion = "|cFF00BFFF[快跑兄弟]|r TitanBistooltip v1.44"
    
    TitanBistooltipAddon:initConfig()
    TitanBistooltipAddon:addMapIcon()
    TitanBistooltipAddon:initBislists()
    
    -- 预处理阶段间装备继承
    inheritEquipmentFromPreviousPhase()
    
    -- 更新TitanBistooltip_Titan_items缓存
    local function updateItemsCache()
        -- 创建一个临时表，用于存储所有装备的信息
        local temp_items = {}
        
        -- 遍历所有职业、专精、阶段和槽位
        for class_name, class_data in pairs(TitanBistooltip_bislists) do
            for spec_name, spec_data in pairs(class_data) do
                for phase_name, phase_data in pairs(spec_data) do
                    for _, slot_data in ipairs(phase_data) do
                        for i = 1, 6 do
                            local itemId = slot_data[i]
                            if itemId and itemId ~= -1 then
                                -- 检查装备是否已经添加过
                                if not temp_items[itemId] then
                                    temp_items[itemId] = {}
                                end
                                
                                -- 检查是否已经添加过相同的职业-专精-槽位组合
                                local slot_name = slot_data.slot_name
                                local already_exists = false
                                for _, entry in ipairs(temp_items[itemId]) do
                                    if entry.class_name == class_name and entry.spec_name == spec_name and entry.slot_name == slot_name then
                                        already_exists = true
                                        break
                                    end
                                end
                                
                                if not already_exists then
                                    -- 添加到临时表中
                                    table.insert(temp_items[itemId], {
                                        class_name = class_name,
                                        spec_name = spec_name,
                                        slot_name = slot_name
                                    })
                                end
                            end
                        end
                    end
                end
            end
        end
        
        -- 转换为TitanBistooltip_Titan_items的格式
        for itemId, item_data in pairs(temp_items) do
            -- 按职业分组，同一职业的所有专精都放在一起
            local class_map = {}
            for _, entry in ipairs(item_data) do
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
            
            -- 更新TitanBistooltip_Titan_items
            TitanBistooltip_Titan_items[itemId] = {}
            
            -- 添加缓存时间戳
            TitanBistooltip_Titan_items[itemId]._cache_time = GetTime()
            
            -- 转换为TitanBistooltip_Titan_items的格式
            for _, specs in pairs(class_map) do
                for _, item_info in pairs(specs) do
                    table.insert(TitanBistooltip_Titan_items[itemId], item_info)
                end
            end
        end
        
        -- 更新缓存时间和版本信息
        TitanBistooltipAddon.db.char.last_cache_update = GetServerTime()
        TitanBistooltipAddon.db.char.last_cache_version = TitanBistooltipAddon.AddonNameAndVersion
    end
    
    -- 检查是否需要更新缓存
    local function shouldUpdateCache()
        local current_time = GetServerTime()
        local last_update = TitanBistooltipAddon.db.char.last_cache_update or 0
        local last_version = TitanBistooltipAddon.db.char.last_cache_version or ""
        local current_version = TitanBistooltipAddon.AddonNameAndVersion
        
        -- 检查是否24小时内没有更新过
        local time_diff = current_time - last_update
        local need_time_update = time_diff >= 86400 -- 24小时
        
        -- 检查是否版本有更新
        local need_version_update = last_version ~= current_version
        
        return need_time_update or need_version_update
    end
    
    -- 延迟执行，确保所有数据都已加载
    C_Timer.After(0.5, function()
        -- 检查是否需要更新缓存
        if shouldUpdateCache() then
            -- 更新装备缓存
            updateItemsCache()
        end
        
        -- 自动识别当前角色职业和天赋
        autoDetectClassAndSpec()
    end)
    
    TitanBistooltipAddon:initBisTooltip()
    
    -- 注册事件以在天赋变化时重新识别
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", function(self, event)
        -- 延迟执行，确保所有数据都已加载
        C_Timer.After(0.1, function()
            -- 确保数据已经加载
            if not TitanBistooltip_classes or not TitanBistooltip_phases then
                TitanBistooltipAddon:initConfig()
                TitanBistooltipAddon:initBislists()
            end
            autoDetectClassAndSpec()
        end)
    end)
end