-- Session-only drag for a fixed list of Blizzard windows.
-- No new frames and no saved coordinates. A dragged position stays in memory
-- across hide and show, then disappears on reload.

local _, ns = ...

local Widget = {}
ns.ExtraToolsWindowDrag = Widget

local HEADERS = {
    GameMenuFrame = "GameMenuFrame.Header",
    -- 12.1 friends window. Title only; do not enable mouse on NineSlice or hook SetWidth/SetSize.
    SocialUIFrame = "SocialUIFrame.TitleContainer",
}

local function IsObject(value)
    return type(value) == "table" or type(value) == "userdata"
end

local function Resolve(path)
    local node = _G
    for part in string.gmatch(path, "[^%.]+") do
        if not IsObject(node) then return nil end
        node = node[part]
    end
    if not IsObject(node) then return nil end
    return node
end

local function CapturePoints(frame)
    if type(frame.GetNumPoints) ~= "function" or type(frame.GetPoint) ~= "function" then
        return nil
    end
    local points = {}
    local count = frame:GetNumPoints() or 0
    for index = 1, count do
        points[index] = { frame:GetPoint(index) }
    end
    return points
end

function Widget:ApplyPoints(frame, points)
    if self.applying or not points or type(frame.SetPoint) ~= "function" then return false end
    self.applying = true
    if type(frame.ClearAllPoints) == "function" then frame:ClearAllPoints() end
    for index = 1, #points do
        frame:SetPoint(unpack(points[index]))
    end
    self.applying = false
    return true
end

function Widget:GamepadBlocks()
    local integration = ns.ExtraToolsWindowDragIntegration
    return not integration or integration:GamepadBlocks()
end

function Widget:FeatureEnabled(module)
    if not (module and module.runtimeActive and module.adapter
        and module.adapter.features and module.adapter.features.windowDrag) then
        return false
    end
    local db = module.GetBlizzardUIDB and module:GetBlizzardUIDB()
    return type(db) == "table" and db.unlockWindowDrag == true
end

function Widget:ShouldDrive(module, name)
    return self:FeatureEnabled(module) and self:CanRestore(name)
end

function Widget:CanRestore(name)
    local integration = ns.ExtraToolsWindowDragIntegration
    return integration and not integration:GamepadBlocks()
        and not integration:BlizzMoveOwns(name) and not integration:ShifterOwns(name)
end

function Widget:TargetNames(adapter)
    if not (adapter and adapter.features and adapter.features.windowDrag) then return {} end
    local names = { "GameMenuFrame" }
    local integration = ns.ExtraToolsWindowDragIntegration
    if integration and integration:IncludeFriendsFrames(adapter) then
        names[#names + 1] = "FriendsFrame"
        names[#names + 1] = "SocialUIFrame"
    end
    if Resolve("SettingsPanel") then
        names[#names + 1] = "SettingsPanel"
    elseif Resolve("InterfaceOptionsFrame") then
        names[#names + 1] = "InterfaceOptionsFrame"
    end
    return names
end

function Widget:CanMove(frame)
    if type(frame.IsProtected) == "function" and frame:IsProtected()
        and type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false
    end
    return type(frame.StartMoving) == "function" and type(frame.StopMovingOrSizing) == "function"
end

function Widget:RememberMovable(record, frame)
    if record.movableTouched or type(frame.SetMovable) ~= "function" then return end
    record.wasMovable = type(frame.IsMovable) == "function" and frame:IsMovable() == true
    frame:SetMovable(true)
    record.movableTouched = true
end

function Widget:RestoreMovable(record, frame)
    if record.movableTouched and not record.wasMovable and type(frame.SetMovable) == "function" then
        frame:SetMovable(false)
    end
    record.movableTouched = nil
    record.wasMovable = nil
    local header = record.header
    if record.headerMouseOwned and header and type(header.EnableMouse) == "function" then
        header:EnableMouse(false)
    end
    record.headerMouseOwned = nil
    record.header = nil
end

function Widget:Stop(record)
    local frame = record.frame
    if record.moving and frame and type(frame.StopMovingOrSizing) == "function" then
        frame:StopMovingOrSizing()
    end
    record.moving = nil
end

function Widget:OnMouseDown(record, button)
    if button ~= "LeftButton" or record.moving then return end
    local module, frame = record.module, record.frame
    if not self:ShouldDrive(module, record.name) or not self:CanMove(frame) then return end
    if not record.original then
        record.original = CapturePoints(frame)
        record.userPlaced = type(frame.IsUserPlaced) == "function" and frame:IsUserPlaced() == true
    end
    self:RememberMovable(record, frame)
    local placed = record.userPlaced
    frame:StartMoving()
    if type(frame.SetUserPlaced) == "function" then frame:SetUserPlaced(placed and true or false) end
    record.moving = true
end

function Widget:OnMouseUp(record, button)
    if button ~= "LeftButton" or not record.moving then return end
    local frame = record.frame
    self:Stop(record)
    if type(frame.SetUserPlaced) == "function" then
        frame:SetUserPlaced(record.userPlaced and true or false)
    end
    record.session = CapturePoints(frame)
    record.dragged = record.session ~= nil and #record.session > 0
end

function Widget:OnSetPoint(record)
    if self.applying or not record.dragged or not record.session then return end
    local frame = record.frame
    if type(frame.IsShown) == "function" and not frame:IsShown() then return end
    if not self:ShouldDrive(record.module, record.name) then
        record.dragged = nil
        record.session = nil
        return
    end
    self:ApplyPoints(frame, record.session)
end

function Widget:OnHide(record)
    local wasMoving = record.moving
    self:Stop(record)
    if not wasMoving then return end
    record.session = CapturePoints(record.frame)
    record.dragged = record.session ~= nil and #record.session > 0
end

function Widget:OnShow(record)
    if not record.dragged or not record.session then return end
    if not self:ShouldDrive(record.module, record.name) then return end
    self:ApplyPoints(record.frame, record.session)
end

local function CanHook(frame, script)
    return type(frame.HasScript) == "function" and frame:HasScript(script)
        and type(frame.HookScript) == "function"
end

function Widget:Attach(module, name, frame)
    local record = self.records[name]
    if record and record.frame == frame then
        self:AttachHeader(module, record)
        return true
    end
    if record then self:Release(record, false) end
    record = { name = name, frame = frame, module = module, tokens = {} }
    self.records[name] = record
    local widget = self
    -- Runtime passes the module before the frame-script arguments.
    if CanHook(frame, "OnMouseDown") then
        record.tokens[#record.tokens + 1] = module:HookFrameScript(frame, "OnMouseDown", function(_, _, button)
            widget:OnMouseDown(record, button)
        end, "WindowDrag:" .. name .. ":down")
    end
    if CanHook(frame, "OnMouseUp") then
        record.tokens[#record.tokens + 1] = module:HookFrameScript(frame, "OnMouseUp", function(_, _, button)
            widget:OnMouseUp(record, button)
        end, "WindowDrag:" .. name .. ":up")
    end
    if CanHook(frame, "OnHide") then
        record.tokens[#record.tokens + 1] = module:HookFrameScript(frame, "OnHide", function()
            widget:OnHide(record)
        end, "WindowDrag:" .. name .. ":hide")
    end
    if CanHook(frame, "OnShow") then
        record.tokens[#record.tokens + 1] = module:HookFrameScript(frame, "OnShow", function()
            widget:OnShow(record)
        end, "WindowDrag:" .. name .. ":show")
    end
    if type(frame.SetPoint) == "function" then
        record.tokens[#record.tokens + 1] = module:HookSecureFunction(frame, "SetPoint", function()
            widget:OnSetPoint(record)
        end, "WindowDrag:" .. name .. ":point")
    end
    self:AttachHeader(module, record)
    return true
end

function Widget:AttachHeader(module, record)
    if record.headerHooked then return end
    local headerName = HEADERS[record.name]
    local header = headerName and Resolve(headerName)
    if not header or header == record.frame or not CanHook(header, "OnMouseDown") then return end
    local widget = self
    record.header = header
    record.headerHooked = true
    if type(header.IsMouseEnabled) == "function" and not header:IsMouseEnabled()
        and type(header.EnableMouse) == "function" then
        header:EnableMouse(true)
        record.headerMouseOwned = true
    end
    record.tokens[#record.tokens + 1] = module:HookFrameScript(header, "OnMouseDown", function(_, _, button)
        widget:OnMouseDown(record, button)
    end, "WindowDrag:" .. record.name .. ":headerDown")
    if CanHook(header, "OnMouseUp") then
        record.tokens[#record.tokens + 1] = module:HookFrameScript(header, "OnMouseUp", function(_, _, button)
            widget:OnMouseUp(record, button)
        end, "WindowDrag:" .. record.name .. ":headerUp")
    end
end

function Widget:Release(record, restore)
    if not record then return end
    local frame = record.frame
    local original, placed = record.original, record.userPlaced
    record.dragged = nil
    record.session = nil
    self:Stop(record)
    if restore and original and frame then
        self:ApplyPoints(frame, original)
        if type(frame.SetUserPlaced) == "function" then frame:SetUserPlaced(placed and true or false) end
    end
    if restore and frame then
        self:RestoreMovable(record, frame)
    else
        record.movableTouched = nil
        record.headerMouseOwned = nil
        record.header = nil
    end
    local module = record.module
    if module and type(module.RemoveHook) == "function" then
        for index = 1, #record.tokens do
            module:RemoveHook(record.tokens[index])
        end
    end
    record.tokens = {}
    if self.records[record.name] == record then self.records[record.name] = nil end
end

function Widget:ReleaseAll(restore)
    local names = {}
    for name in pairs(self.records or {}) do names[#names + 1] = name end
    for index = 1, #names do
        local record = self.records[names[index]]
        if record then self:Release(record, restore and self:CanRestore(record.name)) end
    end
end

function Widget:Sync(module)
    self.records = self.records or {}
    if not self:FeatureEnabled(module) or self:GamepadBlocks() then
        self:ReleaseAll(not self:GamepadBlocks())
        return false
    end
    local wanted = {}
    local names = self:TargetNames(module.adapter)
    for index = 1, #names do
        local name = names[index]
        local frame = Resolve(name)
        if frame and self:ShouldDrive(module, name) then
            wanted[name] = true
            self:Attach(module, name, frame)
        end
    end
    local stale = {}
    for name in pairs(self.records) do
        if not wanted[name] then stale[#stale + 1] = name end
    end
    for index = 1, #stale do
        local record = self.records[stale[index]]
        if record then self:Release(record, self:CanRestore(record.name)) end
    end
    return true
end

function Widget:Shutdown()
    self:ReleaseAll(true)
end
