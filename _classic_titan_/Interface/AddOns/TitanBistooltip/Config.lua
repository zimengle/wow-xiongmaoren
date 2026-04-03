local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("TitanBistooltip", false)
local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
local icon_loaded = false
local icon_name = "TitanBistooltipIcon"



local sources = {
    TitanP1P2 = "TitanP1P2",
}

TitanBistooltip_source_to_url = {
    ["TitanP1P2"] = "快跑兄弟本地数据库",
}

local db_defaults = {
    char = {
        class_index = 1,
        spec_index = 1,
        phase_index = 4, -- 默认使用P3阶段
        filter_specs = {
            ["Death knight"] = {
                ["Blood tank"] = false,
                ["Blood dps"] = false,
                ["Frost"] = false,
                ["Unholy"] = false
            },
            ["Druid"] = {
                ["Balance"] = false,
                ["Feral tank"] = false,
                ["Feral dps"] = false,
                ["Restoration"] = false
            },
            ["Hunter"] = {
                ["Beast mastery"] = false,
                ["Marksmanship"] = false,
                ["Survival"] = false
            },
            ["Mage"] = {
                ["Arcane"] = false,
                ["Fire"] = false,
                ["Fire FFB"] = false,
                ["Frost"] = false
            },
            ["Paladin"] = {
                ["Holy"] = false,
                ["Protection"] = false,
                ["Retribution"] = false
            },
            ["Priest"] = {
                ["Discipline"] = false,
                ["Holy"] = false,
                ["Shadow"] = false
            },
            ["Rogue"] = {
                ["Assassination"] = false,
                ["Combat"] = false,
                ["Subtlety"] = false
            },
            ["Shaman"] = {
                ["Elemental"] = false,
                ["Enhancement"] = false,
                ["Restoration"] = false
            },
            ["Warrior"] = {
                ["Arms"] = false,
                ["Fury"] = false,
                ["Protection"] = false
            },
            ["Warlock"] = {
                ["Affliction"] = false,
                ["Demonology"] = false,
                ["Destruction"] = false,
                ["Destruction fire"] = false
            }
        },
        filter_phases = {
            ["PR"] = false,
            ["P1"] = false,
            ["P2"] = false,
            ["P3"] = false
        },
        highlight_specs = {},
        data_source = "TitanP1P2",
        minimap_icon = true,
        tooltip_with_ctrl = false,
        tooltip_position = "bottom",
        disable_tooltip_enhancement = false, -- 禁用鼠标BIS增强提示功能
        default_phase = "P3" -- 默认BIS面板打开的阶段
    }
}

local configTable = {
    type = "group",
    args = {

        minimap_icon = {
            name = L["Show minimap icon"],
            order = 0,
            desc = L["Shows hides"],
            type = "toggle",
            width = "full",
            set = function(info, val)
                TitanBistooltipAddon.db.char.minimap_icon = val
                if val == true then
                    if icon_loaded == true then
                        LDBIcon:Show(icon_name)
                    else
                        TitanBistooltipAddon:addMapIcon()
                    end
                else
                    LDBIcon:Hide(icon_name)
                end
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.minimap_icon
            end
        },
        filter_class_names = {
            name = L["Hide class names"],
            order = 1,
            desc = L["Removes class from tooltips"],
            type = "toggle",
            set = function(info, val)
                TitanBistooltipAddon.db.char.filter_class_names = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.filter_class_names
            end
        },
        tooltip_with_ctrl = {
            name = L["Show with Ctrl"],
            order = 2,
            desc = L["Show holding Ctrl"],
            type = "toggle",
            width = "double",
            set = function(info, val)
                TitanBistooltipAddon.db.char.tooltip_with_ctrl = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.tooltip_with_ctrl
            end
        },
        disable_tooltip_enhancement = {
            name = "禁用鼠标BIS增强提示,勾选或者取消都需要重载插件才能使得更改生效",
            order = 3,
            desc = "勾选后完全禁用装备提示框中的BIS排名显示，适合配置较低的电脑。注意：更改此设置后需要使用 /RL 命令重新加载插件才能生效。",
            type = "toggle",
            width = "full",
            set = function(info, val)
                TitanBistooltipAddon.db.char.disable_tooltip_enhancement = val
                -- 提示用户需要重新加载插件
                print("|cffffd700[TitanBistooltip]|r 鼠标BIS增强提示设置已更改，请使用 /RL 命令重新加载插件或重新登录游戏以使更改生效。")
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.disable_tooltip_enhancement
            end
        },
        default_phase = {
            name = "默认BIS面板打开阶段",
            order = 4,
            desc = "设置BIS面板打开后默认显示的阶段",
            type = "select",
            style = "dropdown",
            width = "double",
            values = function()
                local options = {}
                -- 从数据库中获取阶段列表
                if TitanBistooltip_phases then
                    for _, phase in ipairs(TitanBistooltip_phases) do
                        options[phase] = phase
                    end
                else
                    -- 默认为PR, P1, P2, P3
                    options["PR"] = "PR"
                    options["P1"] = "P1"
                    options["P2"] = "P2"
                    options["P3"] = "P3"
                end
                return options
            end,
            set = function(info, val)
                TitanBistooltipAddon.db.char.default_phase = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.default_phase or "P3"
            end
        },
        tooltip_position = {
            name = "鼠标BIS增强框位置设置",
            order = 4,
            desc = "自定义BIS面板鼠标提示框的位置。\n备注：当装备提示框在屏幕左侧时，无论用户如何设置，BIS 提示框都会显示在装备提示框的下方，以避免覆盖某些装备对比插件的比较信息",
            type = "select",
            style = "dropdown",
            width = "double",
            values = {
                right = "装备提示框右侧",
                bottom = "装备提示框下侧"
            },
            set = function(info, val)
                TitanBistooltipAddon.db.char.tooltip_position = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.tooltip_position
            end
        },
        data_source = {
            name = L["Data source"],
            order = 5,
            desc = L["Changes source"],
            type = "select",
            style = "dropdown",
            width = "double",
            values = TitanBistooltip_source_to_url,
            set = function(info, key, val)
                TitanBistooltipAddon.db.char.data_source = key
                TitanBistooltipAddon:changeSpec(key)
            end,
            get = function(info, key)
                return TitanBistooltipAddon.db.char.data_source
            end
        },
        filter_phases = {
            name = "隐藏鼠标BIS增强提示阶段显示",
            order = 6,
            desc = "隐藏装备提示框中的阶段显示",
            type = "group",
            inline = true,
            args = {
                pr = {
                    name = "PR",
                    desc = "P1团本前阶段",
                    type = "toggle",
                    width = "half",
                    order = 1,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["PR"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["PR"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["PR"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["PR"]
                    end
                },
                p1 = {
                    name = "P1",
                    desc = "熔火之心团本阶段",
                    type = "toggle",
                    width = "half",
                    order = 2,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P1"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P1"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P1"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P1"]
                    end
                },
                p2 = {
                    name = "P2",
                    desc = "毒蛇神殿风暴要塞阶段",
                    type = "toggle",
                    width = "half",
                    order = 3,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P2"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P2"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P2"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P2"]
                    end
                },
                p3 = {
                    name = "P3",
                    desc = "纳克萨玛斯阶段",
                    type = "toggle",
                    width = "half",
                    order = 4,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P3"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P3"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P3"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P3"]
                    end
                }
            }
        },
        filter_specs = {
            name = "隐藏鼠标BIS增强提示职业提醒",
            order = 7,
            desc = "隐藏装备提示框中的职业专精显示",
            type = "multiselect",
            values = function()
                local options = {}
                -- 首先添加全部职业选项
                options["all"] = "全部职业"
                -- 然后添加其他职业选项
                for ci, class in ipairs(TitanBistooltip_classes) do
                    for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
                        local option_val = "|T" .. TitanBistooltip_spec_icons[class.name][spec] .. ":16|t " .. L[class.name] .. " " .. L[spec]
                        local option_key = ci .. ":" .. si
                        options[option_key] = option_val
                    end
                end
                return options
            end,
            set = function(info, key, val)
                if key == "all" then
                    -- 全部职业选项
                    for ci, class in ipairs(TitanBistooltip_classes) do
                        for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
                            local class_name = TitanBistooltip_classes[ci].name
                            local spec_name = TitanBistooltip_classes[ci].specs[si]
                            TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] = val
                        end
                    end
                else
                    -- 单个职业选项
                    local ci, si = strsplit(":", key)
                    ci = tonumber(ci)
                    si = tonumber(si)
                    local class_name = TitanBistooltip_classes[ci].name
                    local spec_name = TitanBistooltip_classes[ci].specs[si]
                    TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] = val
                end
            end,
            get = function(info, key)
                if key == "all" then
                    -- 检查是否所有职业都被勾选
                    for ci, class in ipairs(TitanBistooltip_classes) do
                        for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
                            local class_name = TitanBistooltip_classes[ci].name
                            local spec_name = TitanBistooltip_classes[ci].specs[si]
                            if (not TitanBistooltipAddon.db.char.filter_specs[class_name]) or 
                               (TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] == false) then
                                return false
                            end
                        end
                    end
                    return true
                else
                    -- 单个职业选项
                    local ci, si = strsplit(":", key)
                    ci = tonumber(ci)
                    si = tonumber(si)
                    local class_name = TitanBistooltip_classes[ci].name
                    local spec_name = TitanBistooltip_classes[ci].specs[si]
                    if (not TitanBistooltipAddon.db.char.filter_specs[class_name]) then
                        TitanBistooltipAddon.db.char.filter_specs[class_name] = {}
                    end
                    if (TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] == nil) then
                        TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] = false
                    end
                    return TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name]
                end
            end
        },
        highlight_spec = {
            name = "高亮鼠标BIS增强提示职业提醒",
            order = 8,
            desc = "高亮显示装备提示框中的特定职业专精",
            type = "multiselect",
            values = function()
                local options = {}
                -- 首先添加全部职业选项
                options["all"] = "全部职业"
                -- 然后添加其他职业选项
                for ci, class in ipairs(TitanBistooltip_classes) do
                    for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
                        local option_val = "|T" .. TitanBistooltip_spec_icons[class.name][spec] .. ":16|t " .. L[class.name] .. " " .. L[spec]
                        local option_key = ci .. ":" .. si
                        options[option_key] = option_val
                    end
                end
                return options
            end,
            set = function(info, key, val)
                if val then
                    -- 勾选职业时，添加到高亮列表
                    TitanBistooltipAddon.db.char.highlight_specs[key] = true
                else
                    -- 取消勾选时，从高亮列表中移除
                    TitanBistooltipAddon.db.char.highlight_specs[key] = nil
                end
            end,
            get = function(info, key)
                -- 检查职业是否在高亮列表中
                return TitanBistooltipAddon.db.char.highlight_specs[key] == true
            end
        }
    }
}

local function buildFilterSpecOptions()
    -- 构建高亮选项
    local highlight_spec_options = {}
    for ci, class in ipairs(TitanBistooltip_classes) do
        for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
            local option_val = "|T" .. TitanBistooltip_spec_icons[class.name][spec] .. ":16|t " .. L[class.name] .. " " .. L[spec]
            local option_key = ci .. ":" .. si
            highlight_spec_options[option_key] = option_val
        end
    end
    configTable.args.highlight_spec.values = highlight_spec_options
end

local function openSourceSelectDialog()
    local frame = AceGUI:Create("Window")
    frame:SetWidth(300)
    frame:SetHeight(150)
    frame:EnableResize(false)
    frame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
        frame = nil
    end)
    frame:SetLayout("List")
    frame:SetTitle(TitanBistooltipAddon.AddonNameAndVersion)

    local labelEmpty = AceGUI:Create("Label")
    labelEmpty:SetText(" ")
    frame:AddChild(labelEmpty)

    local label = AceGUI:Create("Label")
    label:SetText(L["Please select"])
    label:SetRelativeWidth(1)
    frame:AddChild(label)

    local labelEmpty2 = AceGUI:Create("Label")
    labelEmpty2:SetText(" ")
    frame:AddChild(labelEmpty2)

    local sourceDropdown = AceGUI:Create("Dropdown")
    sourceDropdown:SetCallback("OnValueChanged", function(_, _, key)
        TitanBistooltipAddon.db.char.data_source = key
        TitanBistooltipAddon:changeSpec(key)
    end)
    sourceDropdown:SetRelativeWidth(1)
    sourceDropdown:SetList(TitanBistooltip_source_to_url)
    sourceDropdown:SetValue(TitanBistooltipAddon.db.char["data_source"])
    frame:AddChild(sourceDropdown)
end

local function migrateAddonDB()
    if not TitanBistooltipAddon.db.char["version"] then
        TitanBistooltipAddon.db.char.version = 6.1
        TitanBistooltipAddon.db.char.highlight_specs = {}
        TitanBistooltipAddon.db.char.filter_specs = {}
        TitanBistooltipAddon.db.char.class_index = 1
        TitanBistooltipAddon.db.char.spec_index = 1
        TitanBistooltipAddon.db.char.phase_index = 4 -- 默认使用P3阶段
    end
    if TitanBistooltipAddon.db.char["data_source"] == nil then
        TitanBistooltipAddon.db.char.data_source = sources.TitanP1P2
        openSourceSelectDialog()
    end
    if TitanBistooltipAddon.db.char.version == 6.1 then
        TitanBistooltipAddon.db.char.version = 6.2
        if TitanBistooltipAddon.db.char.filter_specs["Death knight"] and TitanBistooltipAddon.db.char.filter_specs["Death knight"]["Blood dps"] == nil then
            TitanBistooltipAddon.db.char.filter_specs["Death knight"]["Blood dps"] = false
        end
    end
    
    -- 确保highlight_specs字段存在
    if TitanBistooltipAddon.db.char.highlight_specs == nil then
        TitanBistooltipAddon.db.char.highlight_specs = {}
    end
    
    -- 确保所有职业和专精都有正确的默认值
    for class_name, specs in pairs(db_defaults.char.filter_specs) do
        if not TitanBistooltipAddon.db.char.filter_specs[class_name] then
            TitanBistooltipAddon.db.char.filter_specs[class_name] = {}
        end
        for spec_name, default_value in pairs(specs) do
            if TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] == nil then
                TitanBistooltipAddon.db.char.filter_specs[class_name][spec_name] = default_value
            end
        end
    end
    
    -- 确保所有阶段都有正确的默认值
    if not TitanBistooltipAddon.db.char.filter_phases then
        TitanBistooltipAddon.db.char.filter_phases = {}
    end
    for phase_name, default_value in pairs(db_defaults.char.filter_phases) do
        if TitanBistooltipAddon.db.char.filter_phases[phase_name] == nil then
            TitanBistooltipAddon.db.char.filter_phases[phase_name] = default_value
        end
    end
end

function TitanBistooltipAddon:openConfigDialog()
    if InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(TitanBistooltipAddon.AceAddonName)
    else
        AceConfigDialog:Open(TitanBistooltipAddon.AceAddonName)
    end
end

local function enableSpec(spec_name)
    -- 确保从数据库文件中获取最新的阶段列表
    TitanBistooltip_bislists = TitanBistooltip_Titan_bislists;
    TitanBistooltip_items = TitanBistooltip_Titan_items;
    TitanBistooltip_classes = TitanBistooltip_Titan_classes;
    TitanBistooltip_phases = TitanBistooltip_Titan_phases;
    
    -- 重新构建阶段字符串，根据配置过滤掉需要隐藏的阶段
    TitanBistooltip_phases_string = ""
    local visible_phases = {}
    for _, phase in ipairs(TitanBistooltip_phases) do
        if not (TitanBistooltipAddon.db and TitanBistooltipAddon.db.char and TitanBistooltipAddon.db.char.filter_phases and TitanBistooltipAddon.db.char.filter_phases[phase]) then
            table.insert(visible_phases, phase)
        end
    end
    for i, phase in ipairs(visible_phases) do
        if i ~= 1 then
            TitanBistooltip_phases_string = TitanBistooltip_phases_string .. "/"
        end
        TitanBistooltip_phases_string = TitanBistooltip_phases_string .. phase
    end
    buildFilterSpecOptions()
end

function TitanBistooltipAddon:addMapIcon()
    if TitanBistooltipAddon.db.char.minimap_icon then
        icon_loaded = true
        local LDB = LibStub("LibDataBroker-1.1", true)
        local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
        if LDB then
            local PC_MinimapBtn = LDB:NewDataObject(icon_name, {
                type = "launcher",
                text = icon_name,
                icon = "Interface\\AddOns\\TitanBistooltip\\Icons\\my_custom_icon.tga",
                OnClick = function(_, button)
                    local now = GetTime()
                    local lastClickTime = TitanBistooltipAddon.lastMinimapClickTime or 0
                    TitanBistooltipAddon.lastMinimapClickTime = now
                    
                    -- 检测双击（间隔小于0.3秒）
                    if button == "LeftButton" and (now - lastClickTime) < 0.3 then
                        TitanBistooltipAddon:closeAllPanels()
                        return
                    end
                    
                    if button == "LeftButton" then
                        TitanBistooltipAddon:createMainFrame()
                    end
                    if button == "RightButton" then
                        TitanBistooltipAddon:openConfigDialog()
                    end
                end,
                OnTooltipShow = function(tt)
                    tt:AddLine(TitanBistooltipAddon.AddonNameAndVersion)
                    local left_click = "|cffffff00" .. L["Left click"] .. "|r " .. L["Open lists"]
                    local right_click = "|cffffff00" .. L["Right click"] .. "|r " .. L["Open configuration"]
                    local command_line = "|cffffff00" .. L["Command"] .. "|r /BIS"
                    tt:AddLine(left_click)
                    tt:AddLine(right_click)
                    tt:AddLine(command_line)
                end,
            })
            if LDBIcon then
                LDBIcon:Register(icon_name, PC_MinimapBtn, TitanBistooltipAddon.db.char)
            end
        end
    end
end

function TitanBistooltipAddon:changeSpec(spec_name)
    TitanBistooltipAddon.db.char.class_index = 1
    TitanBistooltipAddon.db.char.spec_index = 1
    -- 保持当前阶段设置，不强制重置
    enableSpec(spec_name)
    TitanBistooltipAddon:initBislists()
    TitanBistooltipAddon:reloadData()
end

function TitanBistooltipAddon:initConfig()
    TitanBistooltipAddon.db = LibStub("AceDB-3.0"):New("TitanBistooltipDB", db_defaults, true)
    LibStub("AceConfig-3.0"):RegisterOptionsTable(TitanBistooltipAddon.AceAddonName, configTable)
    AceConfigDialog:AddToBlizOptions(TitanBistooltipAddon.AceAddonName, TitanBistooltipAddon.AceAddonName)
    migrateAddonDB()
    TitanBistooltip_bislists = {};
    TitanBistooltip_items = {};
    enableSpec(TitanBistooltipAddon.db.char["data_source"])
end
