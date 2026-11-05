-- Owns TopBar drag overlays and nudge coordinates; saved positions stay in TopBar.
local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("TopBar")) then return end

local Movement = {}
Movement.__index = Movement

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) ~= "function" then return nil end
    local ok, a, b, c, d, e = pcall(callback, target, ...)
    if not ok then return nil end
    return a, b, c, d, e
end

local function Cleanup(frame)
    Call(frame, "Hide")
    Call(frame, "SetScript", "OnClick", nil)
    Call(frame, "SetScript", "OnDragStart", nil)
    Call(frame, "SetScript", "OnDragStop", nil)
end

local LABELS = {
    meetingstone = "集合石按钮",
    handbook = "手册按钮",
    hearthstone = "炉石与职责标记",
    automark = "自动标记按钮",
    addonprofile = "自插件管理",
    micromenu = "微型菜单",
}

function Movement:New(module)
    return setmetatable({ module = module, overlays = {}, owned = {}, nudgeConfigs = {}, unlocked = false }, self)
end

function Movement:GetNudgeConfig(key, target)
    local config = self.nudgeConfigs[key]
    if config then return config end
    local owner = self
    config = {
        label = LABELS[key] or "顶部快捷按钮",
        getPosition = function()
            local _, _, _, x, y = Call(target, "GetPoint", 1)
            return tonumber(x) or 0, tonumber(y) or 0
        end,
        setPosition = function(x, y)
            local point, relativeTo, relativePoint = Call(target, "GetPoint", 1)
            Call(target, "ClearAllPoints")
            Call(target, "SetPoint", point or "CENTER", relativeTo or owner.module.adapter:GetRootFrame(),
                relativePoint or point or "CENTER", tonumber(x) or 0, tonumber(y) or 0)
        end,
        savePosition = function() return owner.module:SaveButtonPosition(key) end,
        onSettings = function() return owner.module:OpenSettings(key) end,
        onLock = function()
            if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
            return owner:SetUnlocked(false)
        end,
    }
    self.nudgeConfigs[key] = config
    return config
end

function Movement:Ensure(key, target, frames)
    local moveOverlay = ns.MoveOverlay
    if type(moveOverlay) ~= "table" then return nil end
    local overlay = self.overlays[key]
    if overlay and not self.owned[overlay] then
        self.module:OwnFrame(overlay, Cleanup, "TopBar retained move overlay")
        self.owned[overlay] = true
    end
    overlay = moveOverlay:Ensure(target, {
        label = LABELS[key] or "顶部快捷按钮",
        parent = self.module.adapter:GetRootFrame(),
        createFrame = function(parent)
            return self.module:CreateFrame("Button", nil, parent, "BackdropTemplate", Cleanup,
                "TopBar move overlay " .. key)
        end,
        layout = key == "hearthstone" and function(owner)
            local role = frames and frames.rolemarker
            Call(owner, "ClearAllPoints")
            Call(owner, "SetPoint", "TOPLEFT", target, "TOPLEFT", 0, 0)
            if role then
                Call(owner, "SetPoint", "BOTTOMRIGHT", role, "BOTTOMRIGHT", 0, 0)
            else
                Call(owner, "SetPoint", "BOTTOMRIGHT", target, "BOTTOMRIGHT", 0, 0)
            end
        end or nil,
        canInteract = function() return not self.module.adapter:IsInCombat() end,
        onBlocked = function() self.module:WarnCombatLocked() end,
        onDragStop = function() self.module:SaveButtonPosition(key) end,
        onSettings = function() return self.module:OpenSettings(key) end,
        nudgeConfig = function() return self:GetNudgeConfig(key, target) end,
    })
    if overlay then
        self.overlays[key] = overlay
        self.owned[overlay] = true
    end
    return overlay
end

function Movement:SetUnlocked(unlocked)
    unlocked = unlocked and true or false
    if self.module.adapter:IsInCombat() then self.module:WarnCombatLocked() return false end
    self.unlocked = unlocked
    local frames = self.module.view:GetMovableFrames()
    local key
    local frame
    for key, frame in pairs(frames) do
        if key ~= "rolemarker" then
        local overlay = self:Ensure(key, frame, frames)
        if unlocked then Call(overlay, "Show") else Call(overlay, "Hide") end
        end
    end
    if not unlocked then self:ReleaseOwnership() end
    return true
end

function Movement:ReleaseOwnership()
    local frame
    for frame in pairs(self.owned) do self.module:ReleaseFrame(frame) end
    self.owned = {}
    self.unlocked = false
end

function Movement:GetDiagnostics()
    local count = 0
    for _ in pairs(self.overlays) do count = count + 1 end
    return { unlocked = self.unlocked, retained = count }
end

ns.TopBarMovementClass = Movement
