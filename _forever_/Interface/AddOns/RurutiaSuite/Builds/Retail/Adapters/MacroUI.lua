-- 文件职责：独占 Retail Blizzard_MacroUI 全局解析、能力预检、布局快照、原子应用与失败回滚。
-- 不负责：Runtime 事件、DB 状态、设置页或宏内容。
-- 布局数值与变换思路基于 NDui_Plus ExtMacroUI 改编（MIT）；完整声明见 THIRD_PARTY_NOTICES.md。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Build.HasModule and ns.Build.HasModule("MacroUI")) then return end

local Data = ns.MacroUIData
if type(Data) ~= "table" then error("MacroUI Retail Adapter requires MacroUIData", 2) end

local Adapter = { family = "retail", buildId = "retail" }

local function IsObject(value)
    local kind = type(value)
    return kind == "table" or kind == "userdata"
end

local function HasMethods(target, methods)
    if not IsObject(target) then return false end
    local index
    for index = 1, #methods do
        if type(target[methods[index]]) ~= "function" then return false end
    end
    return true
end

local function NearlyEqual(left, right)
    if type(left) ~= "number" or type(right) ~= "number" then return left == right end
    return math.abs(left - right) <= Data.epsilon
end

local function CaptureSize(frame)
    local width, height = frame:GetSize()
    if type(width) ~= "number" or type(height) ~= "number" then
        error("MacroUI frame returned an invalid size", 2)
    end
    return { width, height }
end

local function CapturePoints(frame)
    local count = frame:GetNumPoints()
    if type(count) ~= "number" or count < 0 then
        error("MacroUI frame returned an invalid point count", 2)
    end
    local points = {}
    local index
    for index = 1, count do
        local point, relativeTo, relativePoint, offsetX, offsetY = frame:GetPoint(index)
        if type(point) ~= "string" then error("MacroUI frame returned an invalid point", 2) end
        points[index] = { point, relativeTo, relativePoint, offsetX or 0, offsetY or 0 }
    end
    return points
end

local function RestorePoints(frame, points)
    frame:ClearAllPoints()
    local index
    for index = 1, #points do
        local point = points[index]
        frame:SetPoint(point[1], point[2], point[3], point[4], point[5])
    end
end

local function SetSinglePoint(frame, relativeTo, pointInfo)
    frame:ClearAllPoints()
    frame:SetPoint(pointInfo[1], relativeTo, pointInfo[1], pointInfo[2], pointInfo[3])
end

local function SetSelectorStride(selector, stride)
    selector:SetCustomStride(stride)
    if not selector.initialized then return end
    local scrollBox = selector.ScrollBox
    local view = scrollBox and type(scrollBox.GetView) == "function" and scrollBox:GetView() or nil
    if view and type(view.SetStride) == "function" then
        if type(selector.GetStride) ~= "function" or type(selector.UpdateSelections) ~= "function" then
            error("initialized MacroSelector does not provide stride refresh methods", 2)
        end
        view:SetStride(selector:GetStride())
        selector:UpdateSelections()
    end
end

local function GetPanelWidth(frame)
    if type(_G.GetUIPanelAttribute) == "function" then
        return _G.GetUIPanelAttribute(frame, "width")
    end
    local name = frame:GetName()
    local panel = type(_G.UIPanelWindows) == "table" and _G.UIPanelWindows[name] or nil
    return panel and panel.width or nil
end

local function SetPanelWidth(frame, width)
    if type(width) ~= "number" then error("MacroUI panel width is unavailable", 2) end
    if type(_G.SetUIPanelAttribute) == "function" then
        _G.SetUIPanelAttribute(frame, "width", width)
        return
    end
    local name = frame:GetName()
    local panel = type(_G.UIPanelWindows) == "table" and _G.UIPanelWindows[name] or nil
    if type(panel) ~= "table" then error("MacroUI panel registry is unavailable", 2) end
    panel.width = width
end

function Adapter:IsAddOnLoaded(addonName)
    local compat = ns.Compat
    return compat and type(compat.IsAddOnLoaded) == "function"
        and compat.IsAddOnLoaded(addonName) and true or false
end

function Adapter:IsTargetLoaded()
    return self:IsAddOnLoaded(Data.targetAddon)
end

function Adapter:ResolveFrames()
    local frame = _G.MacroFrame
    local frames = {
        frame = frame,
        selector = frame and frame.MacroSelector,
        horizontalBar = _G.MacroHorizontalBarLeft,
        selectedBackground = _G.MacroFrameSelectedMacroBackground,
        scrollFrame = _G.MacroFrameScrollFrame,
        text = _G.MacroFrameText,
        textButton = _G.MacroFrameTextButton,
        textBackground = _G.MacroFrameTextBackground,
    }
    local sizeMethods = { "GetSize", "SetSize" }
    local pointMethods = { "GetNumPoints", "GetPoint", "ClearAllPoints", "SetPoint" }
    if not HasMethods(frames.frame, { "GetSize", "SetSize", "GetName" })
        or not HasMethods(frames.selector, { "GetSize", "SetSize", "SetCustomStride" })
        or not HasMethods(frames.horizontalBar, sizeMethods)
        or not HasMethods(frames.horizontalBar, pointMethods)
        or not HasMethods(frames.selectedBackground, pointMethods)
        or not HasMethods(frames.scrollFrame, sizeMethods)
        or not HasMethods(frames.text, sizeMethods)
        or not HasMethods(frames.textButton, sizeMethods)
        or not HasMethods(frames.textBackground, sizeMethods)
        or not HasMethods(frames.textBackground, pointMethods) then
        return nil, "missing_frames"
    end
    if type(_G.SetUIPanelAttribute) ~= "function" then
        local name = frames.frame:GetName()
        if type(_G.UIPanelWindows) ~= "table" or type(_G.UIPanelWindows[name]) ~= "table" then
            return nil, "missing_panel_registry"
        end
    end
    return frames
end

function Adapter:GetConflictReason(profile)
    local option
    local policy
    for option, policy in pairs(Data.conflictPolicies) do
        if profile[option] and self:IsAddOnLoaded(policy.addon) then return policy.reason end
    end
    return nil
end

function Adapter:IsStockLayout(frames)
    local width, height = frames.frame:GetSize()
    return NearlyEqual(width, Data.layout.stockFrameWidth)
        and NearlyEqual(height, Data.layout.stockFrameHeight)
end

function Adapter:CaptureLayout(frames)
    local panelWidth = GetPanelWidth(frames.frame)
    if type(panelWidth) ~= "number" then
        error("MacroUI panel width is unavailable", 2)
    end
    return {
        frameSize = CaptureSize(frames.frame),
        selectorSize = CaptureSize(frames.selector),
        selectorStride = frames.selector.customStride,
        horizontalBarSize = CaptureSize(frames.horizontalBar),
        horizontalBarPoints = CapturePoints(frames.horizontalBar),
        selectedBackgroundPoints = CapturePoints(frames.selectedBackground),
        scrollFrameSize = CaptureSize(frames.scrollFrame),
        textSize = CaptureSize(frames.text),
        textButtonSize = CaptureSize(frames.textButton),
        textBackgroundSize = CaptureSize(frames.textBackground),
        textBackgroundPoints = CapturePoints(frames.textBackground),
        panelWidth = panelWidth,
    }
end

function Adapter:RestoreLayout(frames, snapshot)
    frames.frame:SetSize(snapshot.frameSize[1], snapshot.frameSize[2])
    frames.selector:SetSize(snapshot.selectorSize[1], snapshot.selectorSize[2])
    SetSelectorStride(frames.selector, snapshot.selectorStride)
    frames.horizontalBar:SetSize(snapshot.horizontalBarSize[1], snapshot.horizontalBarSize[2])
    RestorePoints(frames.horizontalBar, snapshot.horizontalBarPoints)
    RestorePoints(frames.selectedBackground, snapshot.selectedBackgroundPoints)
    frames.scrollFrame:SetSize(snapshot.scrollFrameSize[1], snapshot.scrollFrameSize[2])
    frames.text:SetSize(snapshot.textSize[1], snapshot.textSize[2])
    frames.textButton:SetSize(snapshot.textButtonSize[1], snapshot.textButtonSize[2])
    frames.textBackground:SetSize(snapshot.textBackgroundSize[1], snapshot.textBackgroundSize[2])
    RestorePoints(frames.textBackground, snapshot.textBackgroundPoints)
    SetPanelWidth(frames.frame, snapshot.panelWidth)
end

function Adapter:ApplyLayout(frames)
    local layout = Data.layout
    frames.frame:SetSize(layout.frameWidth, layout.frameHeight)
    SetPanelWidth(frames.frame, layout.frameWidth)
    frames.selector:SetSize(layout.selectorWidth, layout.selectorHeight)
    SetSelectorStride(frames.selector, nil)
    frames.horizontalBar:SetSize(layout.horizontalBarWidth, layout.horizontalBarHeight)
    SetSinglePoint(frames.horizontalBar, frames.frame, layout.horizontalBarPoint)
    SetSinglePoint(frames.selectedBackground, frames.frame, layout.selectedBackgroundPoint)
    frames.scrollFrame:SetSize(layout.editorWidth, layout.editorHeight)
    frames.text:SetSize(layout.editorWidth, layout.editorHeight)
    frames.textButton:SetSize(layout.editorWidth, layout.editorHeight)
    frames.textBackground:SetSize(layout.editorBackgroundWidth, layout.editorBackgroundHeight)
    SetSinglePoint(frames.textBackground, frames.frame, layout.editorBackgroundPoint)
end

function Adapter:TryApply(profile)
    local frames, resolveReason = self:ResolveFrames()
    if not frames then return false, resolveReason, true end
    local conflict = self:GetConflictReason(profile)
    if conflict then return false, "conflict:" .. conflict, true end

    local stockOK, isStock = pcall(self.IsStockLayout, self, frames)
    if not stockOK then return false, "stock_probe_failed", true end
    if not isStock then return false, "external_layout", true end

    local captureOK, snapshot = pcall(self.CaptureLayout, self, frames)
    if not captureOK then return false, "capture_failed", true end
    local applyOK = pcall(self.ApplyLayout, self, frames)
    if applyOK then return true, "applied", true end

    local rollbackOK = pcall(self.RestoreLayout, self, frames, snapshot)
    if not rollbackOK then return false, "rollback_failed", true end
    return false, "apply_failed", true
end

ns.MacroUIAdapter = Adapter
ns.MacroUIRetailAdapter = Adapter
