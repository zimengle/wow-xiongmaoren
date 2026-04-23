local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("TitanBistooltip", false)
local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
local icon_loaded = false
local icon_name = "TitanBistooltipIcon"



local sources = {
    KPTitan = "KPTitan",
}

TitanBistooltip_source_to_url = {
    ["KPTitan"] = "快跑兄弟本地数据库",
}

local db_defaults = {
    char = {
        class_index = 1,
        spec_index = 1,
        phase_index = 4, -- 默认使用P3阶段（PR=1, P1=2, P2=3, P3=4, P4=5）
        filter_class_names = false, -- 隐藏职业名字
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
            ["PR"] = true,
            ["P1"] = true,
            ["P2"] = false,
            ["P3"] = false,
            ["P4"] = false,
            ["P5"] = true,
            ["P6"] = true,
            ["P7"] = true,
            ["P8"] = true,
            ["P9"] = true,
            ["P10"] = true,
            ["P11"] = true
        },
        highlight_specs = {},
        data_source = "KPTitan",
        minimap_icon = true,
        tooltip_with_ctrl = false,
        tooltip_position = true,
        disable_tooltip_enhancement = false, -- 禁用鼠标BIS增强提示功能
        default_phase = "P3" -- 默认BIS面板打开的阶段
    }
}

local configTable = {
    type = "group",
    name = "TitanBistooltip - 快跑兄弟",
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
            name = L["Disable tooltip enhancement"],
            order = 3,
            desc = L["Disables tooltip enhancement desc"],
            type = "toggle",
            width = "full",
            set = function(info, val)
                TitanBistooltipAddon.db.char.disable_tooltip_enhancement = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.disable_tooltip_enhancement
            end
        },
        tooltip_position = {
            name = L["Smart tooltip position"],
            order = 4,
            desc = L["Smart tooltip position desc"],
            type = "toggle",
            width = "double",
            set = function(info, val)
                TitanBistooltipAddon.db.char.tooltip_position = val
            end,
            get = function(info)
                return TitanBistooltipAddon.db.char.tooltip_position
            end
        },
        default_phase = {
            name = L["Default bis panel phase"],
            order = 5,
            desc = L["Default bis panel phase desc"],
            type = "select",
            style = "dropdown",
            width = "double",
            values = function()
                local options = {}
                -- 直接使用TitanBistooltip_Titan_phases获取阶段列表
                local phases = TitanBistooltip_Titan_phases or { "PR" , "P1" , "P2" , "P3" , "P4" , "P5" , "P6" , "P7" , "P8" , "P9" , "P10" , "P11" }
                for i, phase in ipairs(phases) do
                    options[i] = phase
                end
                return options
            end,
            set = function(info, val)
                -- 将索引转换为阶段名称
                local phases = TitanBistooltip_Titan_phases or { "PR" , "P1" , "P2" , "P3" , "P4" , "P5" , "P6" , "P7" , "P8" , "P9" , "P10" , "P11" }
                local phaseName = phases[val]
                if phaseName then
                    TitanBistooltipAddon.db.char.default_phase = phaseName
                end
            end,
            get = function(info)
                -- 将阶段名称转换为索引
                local defaultPhase = TitanBistooltipAddon.db.char.default_phase or "P3"
                local phases = TitanBistooltip_Titan_phases or { "PR" , "P1" , "P2" , "P3" , "P4" , "P5" , "P6" , "P7" , "P8" , "P9" , "P10" , "P11" }
                for i, phase in ipairs(phases) do
                    if phase == defaultPhase then
                        return i
                    end
                end
                return 4 -- 默认返回P3的索引
            end
        },
        data_source = {
            name = L["Data source"],
            order = 6,
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
            name = L["Hide tooltip phase display"],
            order = 7,
            desc = L["Hide tooltip phase display desc"],
            type = "group",
            inline = true,
            args = {
                pr = {
                    name = "PR",
                    desc = L["Pre raid desc"],
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
                    desc = L["Molten core desc"],
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
                    desc = L["Serpentshrine tempest keep desc"],
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
                    desc = L["Naxxramas eye eternity obsidian desc"],
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
                },
                p4 = {
                    name = "P4",
                    desc = L["Zul gurub trial of crusader desc"],
                    type = "toggle",
                    width = "half",
                    order = 5,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P4"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P4"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P4"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P4"]
                    end
                },
                p5 = {
                    name = "P5",
                    desc = L["P5 desc"],
                    type = "toggle",
                    width = "half",
                    order = 6,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P5"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P5"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P5"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P5"]
                    end
                },
                p6 = {
                    name = "P6",
                    desc = L["P6 desc"],
                    type = "toggle",
                    width = "half",
                    order = 7,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P6"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P6"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P6"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P6"]
                    end
                },
                p7 = {
                    name = "P7",
                    desc = L["P7 desc"],
                    type = "toggle",
                    width = "half",
                    order = 8,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P7"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P7"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P7"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P7"]
                    end
                },
                p8 = {
                    name = "P8",
                    desc = L["P8 desc"],
                    type = "toggle",
                    width = "half",
                    order = 9,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P8"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P8"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P8"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P8"]
                    end
                },
                p9 = {
                    name = "P9",
                    desc = L["P9 desc"],
                    type = "toggle",
                    width = "half",
                    order = 10,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P9"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P9"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P9"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P9"]
                    end
                },
                p10 = {
                    name = "P10",
                    desc = L["P10 desc"],
                    type = "toggle",
                    width = "half",
                    order = 11,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P10"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P10"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P10"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P10"]
                    end
                },
                p11 = {
                    name = "P11",
                    desc = L["P11 desc"],
                    type = "toggle",
                    width = "half",
                    order = 12,
                    set = function(info, val)
                        TitanBistooltipAddon.db.char.filter_phases["P11"] = val
                    end,
                    get = function(info)
                        if not TitanBistooltipAddon.db.char.filter_phases then
                            TitanBistooltipAddon.db.char.filter_phases = {}
                        end
                        if TitanBistooltipAddon.db.char.filter_phases["P11"] == nil then
                            TitanBistooltipAddon.db.char.filter_phases["P11"] = false
                        end
                        return TitanBistooltipAddon.db.char.filter_phases["P11"]
                    end
                }
            }
        },
        filter_specs = {
            name = L["Hide tooltip class reminder"],
            order = 8,
            desc = L["Hide tooltip class reminder desc"],
            type = "multiselect",
            values = function()
                local options = {}
                -- 首先添加全部职业选项
                options["all"] = L["All classes"]
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
            name = L["Highlight tooltip class reminder"],
            order = 9,
            desc = L["Highlight tooltip class reminder desc"],
            type = "multiselect",
            values = function()
                local options = {}
                -- 首先添加全部职业选项
                options["all"] = L["All classes"]
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
    if TitanBistooltip_classes then
        for ci, class in ipairs(TitanBistooltip_classes) do
            if class and class.name and TitanBistooltip_classes[ci].specs then
                for si, spec in ipairs(TitanBistooltip_classes[ci].specs) do
                    if spec and TitanBistooltip_spec_icons[class.name] and TitanBistooltip_spec_icons[class.name][spec] then
                        local option_val = "|T" .. TitanBistooltip_spec_icons[class.name][spec] .. ":16|t " .. (L[class.name] or class.name) .. " " .. (L[spec] or spec)
                        local option_key = ci .. ":" .. si
                        highlight_spec_options[option_key] = option_val
                    end
                end
            end
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
    end
    if TitanBistooltipAddon.db.char["data_source"] == nil then
        TitanBistooltipAddon.db.char.data_source = sources.KPTitan
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
        -- 设置底部状态文本
        local frame = AceConfigDialog.OpenFrames[TitanBistooltipAddon.AceAddonName]
        if frame and frame.SetStatusText then
            frame:SetStatusText("快跑兄弟的泰坦BIS插件设置选项")
        end
    end
end

local function enableSpec(spec_name)
    -- 确保从数据库文件中获取最新的阶段列表
    TitanBistooltip_bislists = TitanBistooltip_Titan_bislists or {};
    TitanBistooltip_items = TitanBistooltip_Titan_items or {};
    TitanBistooltip_classes = TitanBistooltip_Titan_classes or {};
    TitanBistooltip_phases = TitanBistooltip_Titan_phases or { "PR" , "P1" , "P2" , "P3" , "P4" };
    
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
    if TitanBistooltipAddon.db and TitanBistooltipAddon.db.char and TitanBistooltipAddon.db.char.minimap_icon then
        icon_loaded = true
        local LDB = LibStub("LibDataBroker-1.1", true)
        local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
        if LDB then
            local PC_MinimapBtn = LDB:NewDataObject(icon_name, {
                type = "launcher",
                text = icon_name,
                icon = "Interface\\AddOns\\TitanBistooltip\\Icons\\my_custom_icon.tga",
                OnClick = function(_, button)
                    if button == "LeftButton" then
                        -- 使用ToggleBisListFrame函数来切换面板状态
                        if TitanBistooltipAddon.ToggleBisListFrame then
                            TitanBistooltipAddon:ToggleBisListFrame()
                        else
                            -- 备用方案：如果ToggleBisListFrame函数不存在，则使用原来的逻辑
                            if TitanBistooltipAddon.createMainFrame then
                                TitanBistooltipAddon:createMainFrame()
                            end
                        end
                    end
                    if button == "RightButton" then
                        if TitanBistooltipAddon.openConfigDialog then
                            TitanBistooltipAddon:openConfigDialog()
                        end
                    end
                end,
                OnTooltipShow = function(tt)
                    tt:AddLine(TitanBistooltipAddon.AddonNameAndVersion or "TitanBistooltip")
                    local left_click = "|cffffff00" .. (L["Left click"] or "Left click") .. "|r " .. (L["Open lists"] or "Open lists")
                    local right_click = "|cffffff00" .. (L["Right click"] or "Right click") .. "|r " .. (L["Open configuration"] or "Open configuration")
                    local command_line = "|cffffff00" .. (L["Command"] or "Command") .. "|r /BIS"
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
    if TitanBistooltipAddon.db and TitanBistooltipAddon.db.char then
        TitanBistooltipAddon.db.char.class_index = 1
        TitanBistooltipAddon.db.char.spec_index = 1
        -- 保持当前阶段设置，不强制重置
        enableSpec(spec_name or "KPTitan")
        if TitanBistooltipAddon.initBislists then
            TitanBistooltipAddon:initBislists()
        end
        if TitanBistooltipAddon.reloadData then
            TitanBistooltipAddon:reloadData()
        end
    end
end

function TitanBistooltipAddon:initConfig()
    TitanBistooltipAddon.db = LibStub("AceDB-3.0"):New("TitanBistooltipDB", db_defaults, true)
    local addonName = TitanBistooltipAddon.AceAddonName or "TitanBistooltip"
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, configTable)
    AceConfigDialog:AddToBlizOptions(addonName, addonName)
    if migrateAddonDB then
        migrateAddonDB()
    end
    TitanBistooltip_bislists = {};
    TitanBistooltip_items = {};
    if TitanBistooltipAddon.db and TitanBistooltipAddon.db.char then
        enableSpec(TitanBistooltipAddon.db.char["data_source"] or "KPTitan")
    else
        enableSpec("KPTitan")
    end
end
