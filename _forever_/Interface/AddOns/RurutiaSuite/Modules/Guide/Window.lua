local _, RS = ...
if not (RS.Build and RS.Build.HasModule and RS.Build.HasModule("Guide")) then return end
local Guide = RS.Guide
if not (Guide and Guide.Data) then error("Guide Window requires Guide Data before it", 2) end
local Window = {}
Window.__index = Window

local function Normalize(value)
    return string.lower((tostring(value or ""):match("^%s*(.-)%s*$")))
end

local DOCUMENT_ORDER = {retail=1, ["classic-infinite"]=2, ["classic-titan"]=3,
    ["classic-mists"]=4, ["classic-anniversary"]=5, ["classic-era"]=6}
local function PrioritizeDocument(entry)
    local current = DOCUMENT_ORDER[RS.Build.GetID()]
    if entry.id ~= "updates" or not current or current == 1 then return end
    local blocks = {}
    for block in (entry.displayBody .. "\n\n"):gmatch("(.-)\n\n") do
        if block ~= "" then blocks[#blocks+1] = block end
    end
    if not blocks[current] then return end
    table.insert(blocks, 1, table.remove(blocks,current))
    for index,block in ipairs(blocks) do blocks[index]=block:gsub("^%d+，",tostring(index).."，") end
    entry.displayBody=table.concat(blocks,"\n\n")
    entry.body=entry.displayBody:gsub("|c%x%x%x%x%x%x%x%x",""):gsub("|r","")
end

-- Both entry points use this bounded catalogue; no UI is created for searching.
function Guide:GetIndex()
    if self.index then return self.index end
    self.index, self.byId = {}, {}
    for _, category in ipairs(self.Data.categories) do
        for _, entry in ipairs(category.entries) do
            PrioritizeDocument(entry)
            entry.group, entry.groupTitle = category.key, category.title
            entry.searchText = Normalize(entry.title .. " " .. entry.body .. " " .. entry.code .. " " .. category.title .. " 小手册")
            self.index[#self.index + 1] = entry
            self.byId[entry.id] = entry
        end
    end
    return self.index
end

function Guide:Find(id)
    self:GetIndex()
    return self.byId[id]
end

function Guide:Search(query, group, limit)
    query = Normalize(query)
    local result = {}
    for _, entry in ipairs(self:GetIndex()) do
        local matches = not group or entry.group == group
        for token in query:gmatch("%S+") do
            if not entry.searchText:find(token, 1, true) then matches = false; break end
        end
        if matches then result[#result + 1] = entry end
    end
    -- Exact/title matches precede body-only matches. Stable IDs break ties.
    if query ~= "" then
        local function Rank(entry)
            local title = Normalize(entry.title)
            return title == query and 0 or (title:find(query, 1, true) and 1 or 2)
        end
        table.sort(result, function(a, b)
            local ra, rb = Rank(a), Rank(b)
            return ra == rb and a.id < b.id or ra < rb
        end)
    end
    if limit then while #result > limit do result[#result] = nil end end
    return result
end

function Window:New(system, data, font, options)
    return setmetatable({system=system, components=system.components, theme=system.theme,
        data=data, font=font, parent=options and options.parent or UIParent,
        owner=options and options.owner, onSelection=options and options.onSelection, selectedKey=data.defaultCategory,
        query="", group=data.defaultCategory, navButtons={}, resultButtons={},
        controls={}, created=false, renderCount=0}, self)
end

function Window:Create(kind, parent, options)
    local component = assert(self.components:Create(kind, parent, options))
    self.controls[#self.controls + 1] = component
    return component
end

function Window:EnsureCreated()
    if self.created then return self.root end
    local sw = self.parent.GetWidth and self.parent:GetWidth() or 1100
    local sh = self.parent.GetHeight and self.parent:GetHeight() or 760
    local width, height = math.min(1000, math.max(640, sw - 40)), math.min(680, math.max(420, sh - 190))
    local root = self:Create("frame", self.parent, {name="RurutiaGuideWindow", width=width, height=height,
        point="TOP", relativeTo=self.parent, relativePoint="TOP", y=-150, hidden=true, frameStrata="DIALOG",
        backgroundToken="color.window.background", borderToken="color.border"})
    self.root = root
    root.frame:SetClampedToScreen(true)
    root.frame:SetMovable(true); root.frame:EnableMouse(true); root.frame:RegisterForDrag("LeftButton")
    root.frame:SetScript("OnDragStart", function(frame) frame:StartMoving() end)
    root.frame:SetScript("OnDragStop", function(frame) frame:StopMovingOrSizing() end)
    root.frame:SetScript("OnHide", function()
        if self.searchBox then self.searchBox:ClearFocus() end
        root.frame:StopMovingOrSizing()
    end)
    _G.UISpecialFrames = _G.UISpecialFrames or {}
    table.insert(_G.UISpecialFrames, "RurutiaGuideWindow")
    local sidebar = self:Create("group", root, {width=230,height=height-32,
        point="TOPLEFT",relativeTo=root,relativePoint="TOPLEFT",x=16,y=-16,
        backgroundToken="color.panel.background"})
    self.title = self:Create("label", sidebar, {text=self.data.title,fontKey="heading",textToken="color.accent",
        width=214,height=30,point="TOPLEFT",relativeTo=sidebar,relativePoint="TOPLEFT",x=8,y=-6,justifyH="LEFT"})
    self.searchBox = self:Create("editbox", sidebar, {width=214,height=30,autoFocus=false,clearable=true,textInsets={12,30,0,0},justifyH="LEFT",
        point="TOPLEFT",relativeTo=sidebar,relativePoint="TOPLEFT",x=8,y=-44,
        onChange=function(_, value) self:SetSearchQuery(value) end,
        onFocusGained=function() self.searchHint:SetVisible(false) end,
        onFocusLost=function() self.searchHint:SetVisible(self.query == "") end})
    self.searchHint = self:Create("label", sidebar, {text="搜索小手册…",fontKey="description",textToken="color.text.faint",labelFill=true,
        width=194,height=30,point="TOPLEFT",relativeTo=self.searchBox,relativePoint="TOPLEFT",x=12,y=0,justifyH="LEFT"})
    for i, category in ipairs(self.data.categories) do
        local key = category.key
        self.navButtons[key] = self:Create("button", sidebar, {text=category.title,width=68,height=28,
            point="TOPLEFT",relativeTo=sidebar,relativePoint="TOPLEFT",x=8+(i-1)*73,y=-84,
            onAction=function() self:SelectCategory(key) end})
    end
    self.resultsScroll = self:Create("scroll", sidebar, {width=214,height=height-214,contentWidth=194,
        point="TOPLEFT",relativeTo=sidebar,relativePoint="TOPLEFT",x=8,y=-122})
    self.contentTitle = self:Create("label", root, {text="",fontKey="heading",textToken="color.accent",
        labelFill=true,width=width-292,height=34,point="TOPLEFT",relativeTo=root,relativePoint="TOPLEFT",x=266,y=-24,justifyH="LEFT"})
    self.scroll = self:Create("scroll", root, {width=width-288,height=height-130,contentWidth=width-314,
        point="TOPLEFT",relativeTo=root,relativePoint="TOPLEFT",x=266,y=-66})
    self.body = self:Create("label", self.scroll.content, {text="",fontKey="body",width=width-324,height=50,
        minHeight=24,autoHeight=true,labelFill=true,wordWrap=true,nonSpaceWrap=true,justifyH="LEFT",justifyV="TOP",
        point="TOPLEFT",relativeTo=self.scroll.content,relativePoint="TOPLEFT",x=4,y=-4})
    self.copyButton = self:Create("button", root, {text="复制",width=110,height=30,
        point="BOTTOMLEFT",relativeTo=root,relativePoint="BOTTOMLEFT",x=266,y=18,
        onAction=function() self:CopyEntry() end})
    self.returnButton = self:Create("button", sidebar, {text="返回工具箱",width=110,height=30,
        point="BOTTOMLEFT",relativeTo=root,relativePoint="BOTTOMLEFT",x=24,y=18,
        onAction=function()
            local opened=self.system:OpenMain()
            if opened then self:Close() end
        end})
    self.closeButton = self:Create("button", root, {text="关闭",width=100,height=30,
        point="BOTTOMRIGHT",relativeTo=root,relativePoint="BOTTOMRIGHT",x=-22,y=18,
        onAction=function() self:Close() end})
    self.created = true
    if self.theme and self.theme.Subscribe then self.theme:Subscribe(self, function(owner)
        if owner:IsOpen() then owner:RefreshTheme() else owner.themeDirty=true end
    end) end
    if self.font and self.font.Subscribe then self.font:Subscribe(self, function(owner, _, role)
        if role == "interface" then
            if owner:IsOpen() then owner:RefreshTheme() else owner.themeDirty=true end
        end
    end) end
    return root
end

function Window:UpdateResults()
    self.results = Guide:Search(self.query, self.query == "" and self.group or nil)
    for i, entry in ipairs(self.results) do
        local button = self.resultButtons[i]
        if not button then
            button = self:Create("button", self.resultsScroll.content, {text="",width=192,height=34,variant="navigation",
                onAction=function(component) self:SelectEntry(component.entryId) end})
            self.resultButtons[i] = button
        end
        button.entryId = entry.id
        button:SetText(entry.title)
        button.frame:ClearAllPoints(); button.frame:SetPoint("TOPLEFT",self.resultsScroll.content,"TOPLEFT",0,-(i-1)*38)
        button:SetVisible(true); button:SetSelected(entry.id == self.selectedEntryId)
    end
    for i=#self.results+1,#self.resultButtons do
        self.resultButtons[i].entryId=nil; self.resultButtons[i]:SetVisible(false)
    end
    self.resultsScroll:SetContentSize(194,math.max(1,#self.results*38))
    for key, button in pairs(self.navButtons) do button:SetSelected(self.query == "" and key == self.group) end
    self.searchHint:SetVisible(self.query == "" and not (self.searchBox.frame.HasFocus and self.searchBox.frame:HasFocus()))
end

function Window:SetSearchQuery(value)
    local query=Normalize(value)
    if self.query == query then return end
    self.query=query
    if self.created then
        self:UpdateResults()
        self:SelectEntry(self.results[1] and self.results[1].id)
        self.resultsScroll.frame:SetVerticalScroll(0)
    end
end

function Window:SelectCategory(key)
    local aliases={recent="faq",video="faq",commands="macro",damage="macro",changelog="faq"}
    self.group=aliases[key] or key or "macro"
    if self.group ~= "macro" and self.group ~= "faq" and self.group ~= "feedback" then self.group="macro" end
    self.selectedKey=self.group; self.query=""
    if self.created then
        self.searchBox:SetValue("",true)
        self:UpdateResults()
        self:SelectEntry(self.results[1] and self.results[1].id)
        self.resultsScroll.frame:SetVerticalScroll(0)
    end
    return true
end

function Window:SelectEntry(id)
    if self.copyDialog then self.copyDialog:Hide() end
    local entry=Guide:Find(id)
    self.selectedEntryId=entry and entry.id or nil
    self.selectedKey=entry and entry.group or self.group
    if self.onSelection then self.onSelection(self.selectedKey) end
    self.contentTitle:SetText(entry and entry.title or "没有匹配结果")
    local body=entry and (entry.displayBody or entry.body) or ""
    local accent=self.theme:Get("color.accent")
    local color=string.format("|cff%02x%02x%02x",math.floor(accent[1]*255+0.5),math.floor(accent[2]*255+0.5),math.floor(accent[3]*255+0.5))
    body=body:gsub("|cnRS_GUIDE_HEADING:",color)
    self.body:SetText(body .. (entry and entry.code ~= "" and ((body ~= "" and "\n\n" or "") .. entry.code) or ""))
    local height=self.body:FitTextHeight(24,12)
    self.scroll:SetContentSize(self.body.frame:GetWidth()+8,height+12)
    self.scroll.frame:SetVerticalScroll(0)
    self.copyButton:SetEnabled(entry ~= nil)
    for _,button in ipairs(self.resultButtons) do button:SetSelected(entry ~= nil and button.entryId == entry.id) end
    self.renderCount=self.renderCount+1
    return true
end

function Window:CopyEntry()
    local entry=Guide:Find(self.selectedEntryId)
    if not entry then return false end
    if not self.copyDialog then
        if not RS.UI.CreateNativeCopyDialog then return false end
        self.copyDialog=RS.UI:CreateNativeCopyDialog(self.owner,{name="RurutiaGuideCopyDialog",parent=self.parent,
            onHide=function()
                if self.returnFromCopy then
                    self.returnFromCopy=false
                    self:Open()
                end
            end})
    end
    self.returnFromCopy=true
    self.root:SetVisible(false)
    self.copyDialog:Show(entry.body .. (entry.code ~= "" and ((entry.body ~= "" and "\n\n" or "") .. entry.code) or ""),
        "选中内容后按 Ctrl+C 复制，按 Esc 关闭。",entry.title,720,420)
    return true
end

function Window:RefreshTheme()
    for _,control in ipairs(self.controls) do control:RefreshTheme() end
    if self.copyDialog then self.copyDialog:Hide() end
    if self.selectedEntryId then self:SelectEntry(self.selectedEntryId) end
    self.themeDirty=false
    return true
end
Window.RefreshFonts=Window.RefreshTheme

function Window:Open(key)
    self:EnsureCreated()
    self.returnFromCopy=false
    if self.copyDialog then self.copyDialog:Hide() end
    if self.themeDirty then self:RefreshTheme() end
    local aliases={recent="resources",video="resources",damage="damage-1",commands="commands-2",changelog="updates"}
    local entry=Guide:Find(aliases[key] or key)
    if entry then
        self:SelectCategory(entry.group); self:SelectEntry(entry.id)
    elseif key or not self.selectedEntryId then self:SelectCategory(key or self.group)
    end
    self.root:SetVisible(true)
    return self.root.frame
end

function Window:Close()
    if not self.created then return false end
    self.returnFromCopy=false
    if self.copyDialog then self.copyDialog:Hide() end
    self.searchBox:ClearFocus(); self.root:SetVisible(false)
    return true
end
function Window:IsOpen() return self.created and self.root:IsVisible() or false end
function Window:GetDiagnostics()
    return {created=self.created,visible=self:IsOpen(),selectedKey=self.selectedKey,entry=self.selectedEntryId,renderCount=self.renderCount}
end
Guide.Window=Window
