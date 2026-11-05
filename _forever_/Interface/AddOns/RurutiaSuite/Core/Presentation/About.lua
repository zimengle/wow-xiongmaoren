local _, RS = ...
local Presentation = RS.Presentation

local About = {}
About.__index = About

-- Shared product introduction; available modules remain defined by each Build.
local SECTIONS = {
    {
        title = "插件简介",
        lines = {
            "RurutiaSuite（RS）是适配多种主流界面的轻量化工具箱，EllesmereUI、NDui、ElvUI和暴雪原生界面都可以使用。插件采用模块化结构，各项功能独立开关，可搭配RSS预设安装器使用。",
        },
    },
    {
        title = "功能概览",
        bullet = true,
        lines = {
            "界面整理：小地图收纳、移动管理、界面样式与暴雪界面增强。",
            "日常便捷：聊天与快捷按钮、消耗品动作条、职业工具和系统设置。",
            "组队辅助：自动标记、标记栏、快速焦点与战斗提醒。",
        },
    },
    {
        title = "常用命令",
        bullet = true,
        lines = {
            "/rs - 打开工具箱",
            "/rsm - 解锁或锁定 RS 模块位置",
            "/rsm all - 解锁或锁定 RS 与支持的外部插件",
            "/rs help - 查看全部命令",
        },
    },
    {
        title = "作者与反馈",
        lines = {
            "作者：露露緹婭（B站同名），可通过私信或评论反馈。",
            "KOOK：https://kook.top/W064MD  |  网易DD频道：16888",
        },
    },
}

local function ColorByte(value)
    value = tonumber(value) or 0
    if value < 0 then value = 0 end
    if value > 1 then value = 1 end
    return math.floor(value * 255 + 0.5)
end

local function ColorCode(color)
    color = color or { 0, 1, 0, 1 }
    return string.format("|cff%02x%02x%02x", ColorByte(color[1]), ColorByte(color[2]), ColorByte(color[3]))
end

function About:New(theme, family)
    local instance = setmetatable({}, self)
    instance.theme = theme
    instance.family = family or "retail"
    instance.builds = 0
    instance.refreshes = 0
    return instance
end

function About:GetSections()
    return SECTIONS
end

function About:FormatLine(section, line)
    local accent = ColorCode(self.theme:Get("color.accent"))
    local text
    if type(line) == "table" and line.name and line.desc then
        text = accent .. line.name .. "：|r" .. line.desc
    else
        text = line
        local command, description = string.match(line, "^(/.+)%s%-%s(.+)$")
        if command and description then
            text = accent .. command .. "|r - " .. description
        else
            text = string.gsub(text, "露露緹婭", accent .. "露露緹婭|r")
            text = string.gsub(text, "https://kook.top/W064MD", accent .. "https://kook.top/W064MD|r")
            text = string.gsub(text, "16888", accent .. "16888|r")
        end
    end
    if section and section.bullet then
        return "• " .. text
    end
    return text
end

function About:FormatSection(section)
    local lines = {}
    for index, line in ipairs(section.lines) do
        lines[index] = self:FormatLine(section, line)
    end
    return table.concat(lines, "\n")
end

function About:GetOptionsDescription()
    local result = {}
    local sections = self:GetSections()
    local sectionIndex = 1
    while sectionIndex <= #sections do
        local section = sections[sectionIndex]
        result[#result + 1] = "|cffFFD700" .. section.title .. "：|r"
        local lineIndex = 1
        while lineIndex <= #section.lines do
            result[#result + 1] = self:FormatLine(section, section.lines[lineIndex])
            lineIndex = lineIndex + 1
        end
        result[#result + 1] = ""
        sectionIndex = sectionIndex + 1
    end
    return table.concat(result, "\n")
end

function About:BuildPage(context)
    local page, reason = RS.UI:CreateSettingsPage(context, { id = "about", sectionHeaderHeight = 34 })
    if not page then
        error("Unable to create About settings page: " .. tostring(reason), 2)
    end
    local rows = {}
    local sections = self:GetSections()
    local sectionIndex = 1
    while sectionIndex <= #sections do
        local section = sections[sectionIndex]
        local builderSection = assert(page:Section(section.title))

        -- One FontString owns the entire paragraph, so wrapped lines and the
        -- following bullet share native text layout instead of separate row offsets.
        local label = assert(builderSection:Description(self:FormatSection(section), {
            fontKey = "body",
            textToken = "color.text.normal",
            minHeight = 24,
            heightPadding = 8,
            gapBefore = 6,
            wordWrap = true,
            nonSpaceWrap = true,
        }))
        rows[#rows + 1] = { component = label, section = section }
        sectionIndex = sectionIndex + 1
    end

    page:Finish()
    context.aboutRows = rows
    context.aboutSettingsPage = page
    context.aboutScroll = page:GetScroll()
    self.builds = self.builds + 1
    return page:GetRoot()
end

function About:RefreshPage(context)
    local rows = context and context.aboutRows
    if not rows then
        return false
    end
    local index = 1
    while index <= #rows do
        local row = rows[index]
        row.component:SetText(self:FormatSection(row.section))
        index = index + 1
    end
    if context.aboutSettingsPage then context.aboutSettingsPage:RefreshLayout() end
    self.refreshes = self.refreshes + 1
    return true
end

function About:GetDiagnostics()
    return { family = self.family, builds = self.builds, refreshes = self.refreshes }
end

Presentation.AboutClass = About
