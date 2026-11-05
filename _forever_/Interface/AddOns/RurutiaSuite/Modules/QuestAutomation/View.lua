local _, ns = ...
if not ns.Build.HasModule("QuestAutomation") then return end
local View = {}
ns.QuestAutomationView = View

local TRACKERS = { "CampaignQuestObjectiveTracker", "QuestObjectiveTracker" }

local function RefreshTrackerVisibility(module)
    View:RefreshTracker(module, module:GetAutomationState())
end

local function VisibleHeader(module)
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
            if not selected and tracker:IsShown() and header:IsShown() then selected = header end
        end
    end
    return selected
end

function View:Hide()
    if self.button then self.button:Hide() end
    if self.trackerButton then self.trackerButton:Hide() end
end

function View:RefreshTracker(module, state)
    local supported = module.runtimeActive and (state.owner == "native" or state.owner == "eui")
    local header = supported and VisibleHeader(module)
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
        button.text:SetText("自动交接")
        button.mixed = button:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        button.mixed:SetPoint("CENTER", button, "CENTER", 0, 1)
        button.mixed:SetText("—")
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
        button:SetScript("OnEnter", function(frame)
            local tooltip = _G.GameTooltip
            if not tooltip then return end
            tooltip:SetOwner(frame, "ANCHOR_LEFT")
            tooltip:SetText("自动交接")
            tooltip:AddLine(module:GetAutomationState().description, 1, 1, 1, true)
            tooltip:AddLine("左键：切换自动交接。右键：打开任务与拾取设置。", 1, 1, 1, true)
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
        -- Reserve the rightmost area for the native collapse button.
        button:SetPoint("RIGHT", header, "RIGHT", -96, 0)
        button:SetFrameLevel(header:GetFrameLevel() + 2)
        self.trackerHeader = header
    end
    button:SetChecked(state.enabled == true)
    button:SetEnabled(state.mutable == true)
    if state.mixed then button.mixed:Show() else button.mixed:Hide() end
    button:Show()
end

function View:Refresh(module, state)
    self:RefreshTracker(module, state)
    if not (module.runtimeActive and _G.WorldMapFrame and _G.QuestMapFrame) then
        if self.button then self.button:Hide() end
        return
    end
    -- Refresh ownership whenever the map opens; NDui owns its own map control.
    module:HookFrameScript(_G.WorldMapFrame, "OnShow", function(owner) owner:Refresh() end,
        "QuestAutomation:WorldMap")
    if state.owner ~= "native" and state.owner ~= "eui" then self:Hide(); return end
    local button = self.button
    if not button then
        button = module:CreateFrame("CheckButton", nil, _G.QuestMapFrame,
            "OptionsBaseCheckButtonTemplate", function(frame) frame:Hide() end,
            "Quest automation map control")
        button:SetPoint("TOPLEFT", _G.QuestMapFrame, "TOPLEFT", 0, 25)
        button:SetSize(26, 26)
        button:SetHitRectInsets(-5, -115, -5, -5)
        button:SetFrameLevel(999)
        button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.text:SetPoint("LEFT", button, "LEFT", 25, 0)
        button.text:SetText("任务自动交接")
        button.mixed = button:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        button.mixed:SetPoint("CENTER", button, "CENTER", 0, 1)
        button.mixed:SetText("—")
        button:SetScript("OnClick", function(frame)
            if module.runtimeActive then module:SetAutomationEnabled(frame:GetChecked() == true) end
        end)
        button:SetScript("OnEnter", function(frame)
            local tooltip = _G.GameTooltip
            if not tooltip then return end
            tooltip:SetOwner(frame, "ANCHOR_BOTTOMLEFT")
            tooltip:SetText("任务自动交接")
            tooltip:AddLine(module:GetAutomationState().description, 1, 1, 1, true)
            tooltip:AddLine("设置入口：/rs → 任务与拾取。", 0.8, 0.8, 0.8, true)
            tooltip:Show()
        end)
        button:SetScript("OnLeave", function() if _G.GameTooltip then _G.GameTooltip:Hide() end end)
        self.button = button
    else
        module:OwnFrame(button, function(frame) frame:Hide() end, "Quest automation map control")
    end
    button:SetChecked(state.enabled == true)
    button:SetEnabled(state.mutable == true)
    if state.mixed then button.mixed:Show() else button.mixed:Hide() end
    button:Show()
end
