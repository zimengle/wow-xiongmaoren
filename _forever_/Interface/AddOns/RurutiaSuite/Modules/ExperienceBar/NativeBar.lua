local _, ns = ...

local NativeBar = {}
NativeBar.__index = NativeBar

local function ReadFrameState(frame)
    return {
        alpha = type(frame.GetAlpha) == "function" and frame:GetAlpha() or 1,
        mouseEnabled = type(frame.IsMouseEnabled) == "function" and frame:IsMouseEnabled() or false,
    }
end

local function OnNativeFrameShown(module, frame)
    local controller = module.adapter and module.adapter.nativeBar
    if controller and controller.hidden then
        controller:_HideFrame(frame)
    end
end

local function OnManagerUpdated(module)
    local controller = module.adapter and module.adapter.nativeBar
    if controller and controller.hidden then
        controller:_ApplyModernFrames(module)
    end
end

local function OnContainerUpdated(module, container)
    local controller = module.adapter and module.adapter.nativeBar
    if controller and controller.hidden then
        controller:_ApplyContainerDecorations(container)
    end
end

function NativeBar.New()
    return setmetatable({
        hidden = false,
        frameStates = setmetatable({}, { __mode = "k" }),
        hookTokens = {},
        hookOwner = nil,
    }, NativeBar)
end

function NativeBar:_RememberHook(module, token)
    if token ~= nil then
        self.hookOwner = module
        self.hookTokens[token] = true
    end
    return token
end

function NativeBar:_HideFrame(frame)
    if frame == nil then
        return false
    end
    if self.frameStates[frame] == nil then
        self.frameStates[frame] = ReadFrameState(frame)
    end
    if type(frame.SetAlpha) == "function" then
        frame:SetAlpha(0)
    end
    if type(frame.EnableMouse) == "function" then
        frame:EnableMouse(false)
    end
    return true
end

function NativeBar:_TrackModernFrame(module, frame)
    if not self:_HideFrame(frame) then
        return false
    end
    if module and type(module.HookFrameScript) == "function" then
        self:_RememberHook(
            module,
            module:HookFrameScript(frame, "OnShow", OnNativeFrameShown, "ExperienceBar.Native.OnShow")
        )
    end
    return true
end

function NativeBar:_RestoreFrame(frame)
    local state = frame and self.frameStates[frame]
    if not state then return end
    if type(frame.SetAlpha) == "function" then frame:SetAlpha(state.alpha) end
    if type(frame.EnableMouse) == "function" then frame:EnableMouse(state.mouseEnabled) end
    self.frameStates[frame] = nil
end

function NativeBar:_ApplyContainerDecorations(container)
    local info = _G.StatusTrackingBarInfo
    local experienceIndex = info and info.BarsEnum and info.BarsEnum.Experience
    local hide = experienceIndex ~= nil and container.shownBarIndex == experienceIndex
    -- The frame and dividers belong to the shared container, not the XP child.
    -- Leave its fade animations and reputation/honor assignments untouched.
    local apply = hide and self._HideFrame or self._RestoreFrame
    apply(self, container.BarFrameTexture)
    local pool = container.HorizontalDividersPool
    if pool and type(pool.EnumerateActive) == "function" then
        for divider in pool:EnumerateActive() do apply(self, divider) end
    end
end

function NativeBar:_ApplyModernFrames(module)
    local manager = _G.StatusTrackingBarManager
    local info = _G.StatusTrackingBarInfo
    local experienceIndex = info and info.BarsEnum and info.BarsEnum.Experience
    if not (manager and experienceIndex and type(manager.barContainers) == "table") then
        return false
    end

    local found = false
    local index
    for index = 1, #manager.barContainers do
        local container = manager.barContainers[index]
        local frame = container and container.bars and container.bars[experienceIndex]
        if frame then
            found = self:_TrackModernFrame(module, frame) or found
            self:_ApplyContainerDecorations(container)
            if module and type(module.HookSecureFunction) == "function" then
                -- Assignment may finish after UpdateBarsShown's fade-out; divider
                -- frames may also be recycled by a layout/gamepad change.
                for _, method in ipairs({ "ApplyPendingBarToShow", "UpdateDividers" }) do
                    if type(container[method]) == "function" then
                        self:_RememberHook(module, module:HookSecureFunction(
                            container, method, OnContainerUpdated, "ExperienceBar.Native." .. method
                        ))
                    end
                end
            end
        end
    end
    return found
end

function NativeBar:SetHidden(module, hidden)
    hidden = hidden and true or false
    if not hidden then
        return self:Restore()
    end

    -- Repeat discovery on ordinary XP/world refreshes: native UI may load later.
    self.hidden = true
    local manager = _G.StatusTrackingBarManager
    if manager and type(manager.UpdateBarsShown) == "function"
        and module and type(module.HookSecureFunction) == "function" then
        self:_RememberHook(
            module,
            module:HookSecureFunction(
                manager,
                "UpdateBarsShown",
                OnManagerUpdated,
                "StatusTrackingBarManager.UpdateBarsShown"
            )
        )
    end

    self:_ApplyModernFrames(module)
    self:_TrackModernFrame(module, _G.MainMenuExpBar)
    self:_TrackModernFrame(module, _G.MainMenuBarMaxLevelBar)
    self:_TrackModernFrame(module, _G.ExhaustionTick)
    return true
end

function NativeBar:Restore(module)
    self.hidden = false
    module = module or self.hookOwner
    if module and type(module.RemoveHook) == "function" then
        local token = next(self.hookTokens)
        while token ~= nil do
            module:RemoveHook(token)
            self.hookTokens[token] = nil
            token = next(self.hookTokens)
        end
    end
    self.hookOwner = nil
    local frame
    for frame in pairs(self.frameStates) do
        self:_RestoreFrame(frame)
    end
    return true
end

ns.ExperienceBarNativeBar = NativeBar
