local _, RS = ...
if RS.Build and RS.Build.SupportsIntegration and not RS.Build.SupportsIntegration("ndui") then return end

-- Capture Classic NDui's settings callback during one bounded startup window.
-- The shared MoveManager owns all temporary resources through its Runtime lifecycle.
if not (RS.Build and RS.Build.IsFamily and RS.Build.IsFamily("classic")) then return end

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("NDui SettingsCapture requires ClassicUI before it", 2)
end

local Capture = {}
Capture.__index = Capture

local function GetOpenFunction()
    return RS._ndui_openFunc
end

function Capture:New(owner)
    return setmetatable({ owner = owner }, self)
end

function Capture:ConfigureAdapter(options)
    options.getNDuiOpenFunc = GetOpenFunction
end

function Capture:Disable()
    local handle = self.handle
    self.handle = nil
    if handle and type(handle.Cancel) == "function" then handle:Cancel() end
    if type(self.owner.UnregisterEvent) == "function" then
        self.owner:UnregisterEvent("ADDON_LOADED")
    end
    if self.hookToken then self.owner:RemoveHook(self.hookToken) end
    self.hookToken = nil
    self.target = nil
end

function Capture:TryCapture(finalAttempt)
    if finalAttempt then self.handle = nil end
    if type(GetOpenFunction()) == "function" then
        self:Disable()
        return true
    end
    if not (RS.Compat and type(RS.Compat.IsAddOnLoaded) == "function"
        and RS.Compat.IsAddOnLoaded("NDui")) then
        if finalAttempt then self:Disable() end
        return false
    end

    local gameMenu = _G.GameMenuFrame
    if type(gameMenu) ~= "table" or type(gameMenu.AddButton) ~= "function" then
        if finalAttempt then self:Disable() end
        return false
    end
    if self.target ~= gameMenu or self.hookToken == nil then
        if self.hookToken then self.owner:RemoveHook(self.hookToken) end
        self.target = gameMenu
        self.hookToken = self.owner:HookSecureFunction(
            gameMenu,
            "AddButton",
            function(_, _, label, callback)
                if type(label) == "string" and string.find(label, "NDui", 1, true)
                    and type(callback) == "function" and type(GetOpenFunction()) ~= "function" then
                    RS._ndui_openFunc = callback
                end
            end,
            "MoveManager NDui settings capture"
        )
    end
    if type(gameMenu.InitButtons) == "function" then pcall(gameMenu.InitButtons, gameMenu) end
    if type(GetOpenFunction()) == "function" then
        self:Disable()
        return true
    end
    if finalAttempt then self:Disable() end
    return false
end

function Capture:Enable()
    if type(GetOpenFunction()) == "function" then return end
    self.owner:RegisterEvent("ADDON_LOADED", function(_, _, addonName)
        if addonName == "NDui" then self:TryCapture() end
    end)
    self.handle = self.owner:Schedule(0.5,
        function() self:TryCapture(true) end,
        "MoveManager NDui settings capture")
end

ClassicUI.ExternalSettingsCapture = Capture
