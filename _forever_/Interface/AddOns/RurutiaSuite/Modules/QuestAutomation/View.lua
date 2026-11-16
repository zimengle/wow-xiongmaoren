local _, ns = ...
if not ns.Build.HasModule("QuestAutomation") then return end
local View = {}
ns.QuestAutomationView = View

local forever = ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
local TRACKERS = { "CampaignQuestObjectiveTracker", "QuestObjectiveTracker" }

local function SetForeverTooltip(tooltip)
    local color = ns:GetThemeColorCode(false)
    tooltip:SetText("|cffffffff左：|r" .. color .. "任务自动交接|r\n"
        .. "|cffffffff右：|r" .. color .. "设置|r")
end

local function RefreshTrackerVisibility(module)
    View:RefreshTracker(module, module:GetAutomationState())
end

local function BindToggleClicks(button, module)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetScript("OnClick", function(frame, mouseButton)
        if not module.runtimeActive then return end
        if mouseButton == "RightButton" then
            frame:SetChecked(module:GetAutomationState().enabled == true)
            module:OpenSettings()
        else
            module:SetAutomationEnabled(frame:GetChecked() == true)
        end
    end)
end

local EllesHeader = { buttonText = "交接", textHitWidth = 32 }

function EllesHeader:Place(button, header)
    button:SetPoint("LEFT", header.text, "RIGHT", 6, 0)
end

local function FindEllesTitle(...)
    for index = 1, select("#", ...) do
        local child = select(index, ...)
        if child.text and child.count and child.toggle and child:IsObjectType("Button") then
            return child
        end
    end
end

local function CustomEllesTitle(module, frame)
    if not frame then return end
    module:HookFrameScript(frame, "OnShow", RefreshTrackerVisibility)
    module:HookFrameScript(frame, "OnHide", RefreshTrackerVisibility)
    if EllesHeader.frame ~= frame or not EllesHeader.title then
        EllesHeader.frame = frame
        EllesHeader.title = FindEllesTitle(frame:GetChildren())
    end
    local title = EllesHeader.title
    if title then
        module:HookFrameScript(title, "OnShow", RefreshTrackerVisibility)
        module:HookFrameScript(title, "OnHide", RefreshTrackerVisibility)
        if title:IsVisible() then return title end
    end
end

local function VisibleHeader(module)
    local integration = ns.QuestAutomationTrackerIntegration
    local external = integration and integration:GetHeader(module)
    local custom = _G.EUI_CustomQuestTracker
    local elles = CustomEllesTitle(module, custom)
    -- Bind both trackers even while Questie owns the button: native OnShow may
    -- arrive after Questie's OnHide, with no further addon/update event.
    local selected
    for _, name in ipairs(TRACKERS) do
        local tracker = _G[name]
        local header = tracker and tracker.Header
        if header then
            -- Blizzard shows campaign and ordinary quests independently. Keep
            -- one control on the first shown header; no quest scans or polling.
            module:HookFrameScript(tracker, "OnShow", RefreshTrackerVisibility)
            module:HookFrameScript(tracker, "OnHide", RefreshTrackerVisibility)
            module:HookFrameScript(header, "OnShow", RefreshTrackerVisibility)
            module:HookFrameScript(header, "OnHide", RefreshTrackerVisibility)
            if not selected and tracker:IsVisible() and header:IsVisible() then selected = header end
        end
    end
    if external then return external, integration end
    if elles then return elles, EllesHeader end
    -- In custom mode Elles keeps the original tracker alive at alpha zero.
    if not custom then return selected end
end

function View:Hide()
    if self.button then self.button:Hide() end
    if self.trackerButton then self.trackerButton:Hide() end
end

function View:RefreshTracker(module, state)
    local supported = module.runtimeActive and (state.owner == "native" or state.owner == "eui")
    local header, integration
    if supported then header, integration = VisibleHeader(module) end
    if not header then
        if self.trackerButton then self.trackerButton:Hide() end
        return
    end
    local button = self.trackerButton
    if not button then
        button = module:CreateFrame("CheckButton", nil, header, "OptionsBaseCheckButtonTemplate",
            function(frame) frame:Hide() end, "Quest automation tracker control")
        button:SetSize(22, 22)
        button:SetHitRectInsets(0, -64, 0, 0)
        button:SetFrameLevel(header:GetFrameLevel() + 2)
        button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        button.text:SetPoint("LEFT", button, "RIGHT", 1, 0)
        button.text:SetText("交接")
        button.mixed = button:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        button.mixed:SetPoint("CENTER", button, "CENTER", 0, 1)
        button.mixed:SetText("—")
        BindToggleClicks(button, module)
        button:SetScript("OnEnter", function(frame)
            local tooltip = _G.GameTooltip
            if not tooltip then return end
            tooltip:SetOwner(frame, "ANCHOR_LEFT")
            if forever then
                SetForeverTooltip(tooltip)
            else
                tooltip:SetText("自动交接")
                tooltip:AddLine(module:GetAutomationState().description, 1, 1, 1, true)
                tooltip:AddLine("左键：切换自动交接。右键：打开任务与拾取设置。", 1, 1, 1, true)
            end
            tooltip:Show()
        end)
        button:SetScript("OnLeave", function() if _G.GameTooltip then _G.GameTooltip:Hide() end end)
        self.trackerButton = button
    else
        module:OwnFrame(button, function(frame) frame:Hide() end, "Quest automation tracker control")
    end
    if self.trackerHeader ~= header then
        button:SetParent(header)
        button:ClearAllPoints()
        button.text:SetText(integration and integration.buttonText or "交接")
        local hitWidth = integration and integration.textHitWidth or 64
        -- Reserve the rightmost area for the native collapse button.
        if integration then integration:Place(button, header)
        else button:SetPoint("RIGHT", header, "RIGHT", -96, 0) end
        local collapse = header.MinimizeButton
        local level = header:GetFrameLevel()
        if collapse and collapse.GetFrameLevel then level = math.max(level, collapse:GetFrameLevel()) end
        button:SetFrameLevel(level + 2)
        button:SetHitRectInsets(0, -hitWidth, 0, 0)
        self.trackerHeader = header
    end
    button:SetChecked(state.enabled == true)
    button:SetEnabled(state.mutable == true)
    if state.mixed then button.mixed:Show() else button.mixed:Hide() end
    button:Show()
end

local function PlaceForeverMapControl()
    local button, map, log = View.button, _G.WorldMapFrame, _G.QuestMapFrame
    if not button or not map then return end
    local sidebar = log and log:IsVisible() and not (map.IsMaximized and map:IsMaximized())
    local anchor = sidebar and log or (map.BorderFrame or map)
    if View.mapAnchor == anchor and View.mapSidebar == sidebar then return end
    button:ClearAllPoints()
    if sidebar then
        button:SetPoint("TOPLEFT", log, "TOPLEFT", 0, 25)
    else
        button:SetPoint("TOPLEFT", anchor, "TOPRIGHT", -250, 0)
    end
    View.mapAnchor, View.mapSidebar = anchor, sidebar
end

function View:Refresh(module, state)
    self:RefreshTracker(module, state)
    if not (module.runtimeActive and _G.WorldMapFrame and (forever or _G.QuestMapFrame)) then
        if self.button then self.button:Hide() end
        return
    end
    -- Refresh ownership whenever the map opens; NDui owns its own map control.
    module:HookFrameScript(_G.WorldMapFrame, "OnShow", function(owner) owner:Refresh() end,
        "QuestAutomation:WorldMap")
    if state.owner ~= "native" and state.owner ~= "eui" then self:Hide(); return end
    local button = self.button
    if not button then
        button = module:CreateFrame("CheckButton", nil, forever and _G.WorldMapFrame or _G.QuestMapFrame,
            "OptionsBaseCheckButtonTemplate", function(frame) frame:Hide() end,
            "Quest automation map control")
        if not forever then button:SetPoint("TOPLEFT", _G.QuestMapFrame, "TOPLEFT", 0, 25) end
        button:SetSize(26, 26)
        button:SetHitRectInsets(-5, -115, -5, -5)
        button:SetFrameLevel(999)
        button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.text:SetPoint("LEFT", button, "LEFT", 25, 0)
        button.text:SetText("任务自动交接")
        button.mixed = button:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        button.mixed:SetPoint("CENTER", button, "CENTER", 0, 1)
        button.mixed:SetText("—")
        if forever then
            BindToggleClicks(button, module)
        else
            button:SetScript("OnClick", function(frame)
                if module.runtimeActive then module:SetAutomationEnabled(frame:GetChecked() == true) end
            end)
        end
        button:SetScript("OnEnter", function(frame)
            local tooltip = _G.GameTooltip
            if not tooltip then return end
            tooltip:SetOwner(frame, "ANCHOR_BOTTOMLEFT")
            if forever then
                SetForeverTooltip(tooltip)
            else
                tooltip:SetText("任务自动交接")
                tooltip:AddLine(module:GetAutomationState().description, 1, 1, 1, true)
                tooltip:AddLine("设置入口：/rs → 任务与拾取。", 0.8, 0.8, 0.8, true)
            end
            tooltip:Show()
        end)
        button:SetScript("OnLeave", function() if _G.GameTooltip then _G.GameTooltip:Hide() end end)
        self.button = button
        if ns.SkinQuestAutomationControl then ns.SkinQuestAutomationControl(button) end
    else
        module:OwnFrame(button, function(frame) frame:Hide() end, "Quest automation map control")
    end
    if forever then
        module:HookFrameScript(_G.WorldMapFrame, "OnSizeChanged", PlaceForeverMapControl, "QuestAutomation:MapSize")
        if _G.QuestMapFrame then
            module:HookFrameScript(_G.QuestMapFrame, "OnShow", PlaceForeverMapControl, "QuestAutomation:LogShow")
            module:HookFrameScript(_G.QuestMapFrame, "OnHide", PlaceForeverMapControl, "QuestAutomation:LogHide")
        end
        PlaceForeverMapControl()
    end
    button:SetChecked(state.enabled == true)
    button:SetEnabled(state.mutable == true)
    if state.mixed then button.mixed:Show() else button.mixed:Hide() end
    button:Show()
end
