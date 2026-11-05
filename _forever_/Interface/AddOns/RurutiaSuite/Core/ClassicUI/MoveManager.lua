local _, RS = ...

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("MoveManager requires ClassicUI before it", 2)
end

local MoveManager = {}
MoveManager.__index = MoveManager

local function TrimLower(value)
    value = type(value) == "string" and value or ""
    value = string.gsub(value, "^%s+", "")
    value = string.gsub(value, "%s+$", "")
    return string.lower(value)
end

function MoveManager:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.providers = options.providers
    instance.external = options.external
    instance.nudge = options.nudge
    instance.system = options.system
    instance.getProfile = options.getProfile
    instance.print = options.print or RS.Print
    instance.onStateChanged = options.onStateChanged
    instance.inCombat = options.inCombat or _G.InCombatLockdown
    instance.onCombatDeferred = options.onCombatDeferred
    instance.allCommandMode = options.allCommandMode or "toggle"
    instance.isMoveMode = false
    instance.externalState = {}
    instance.moveModules = {}
    instance.commandCount = 0
    instance.stateChanges = 0
    instance.pendingRsMoveMode = nil
    instance.pendingAllMove = nil
    return instance
end

function MoveManager:Print(message)
    if type(self.print) == "function" then self.print(message) end
end

function MoveManager:GetProfile()
    return type(self.getProfile) == "function" and self.getProfile() or nil
end

function MoveManager:IsOffscreenDragEnabled()
    local profile = self:GetProfile()
    return profile and profile.moveSettings
        and profile.moveSettings.allowOffscreenDrag == true or false
end

function MoveManager:SetAllowOffscreenDrag(enabled)
    local profile = self:GetProfile()
    if not profile then return false end
    profile.moveSettings = profile.moveSettings or {}
    profile.moveSettings.allowOffscreenDrag = enabled and true or false
    self.providers:RefreshClamp()
    self:RefreshPage("offscreen")
end

function MoveManager:ResetAllRsPositions()
    self.providers:ResetAll()
    self:RefreshPage("reset")
end

function MoveManager:GetRsMoveModules(reusableResult)
    return self.providers:GetMovableModules(reusableResult or self.moveModules)
end

function MoveManager:NotifyStateChanged()
    self.stateChanges = self.stateChanges + 1
    if type(self.onStateChanged) == "function" then
        self.onStateChanged(self.isMoveMode, self.externalState)
    end
    self:RefreshPage("move-state")
end

function MoveManager:SetRsMoveMode(unlocked)
    unlocked = unlocked and true or false
    if type(self.inCombat) == "function" and self.inCombat() then
        self.pendingAllMove = nil
        self.pendingRsMoveMode = unlocked
        if type(self.onCombatDeferred) == "function" then self.onCombatDeferred(unlocked) end
        self:Print("战斗中暂不切换移动状态，脱战后会自动执行。")
        return false
    end
    self.pendingRsMoveMode = nil
    local modules = self:GetRsMoveModules()
    if #modules == 0 then
        self:Print("没有可解锁的动作条或标记模块。")
        self.isMoveMode = false
        self:NotifyStateChanged()
        return false
    end

    local succeeded = {}
    local failures = {}
    local index = 1
    while index <= #modules do
        local module = modules[index]
        local ok, result = pcall(module.SetUnlocked, module, unlocked)
        if ok and result ~= false then
            succeeded[#succeeded + 1] = module
        else
            local name = module.__rsMoveProviderName or module.name or ("模块 #" .. index)
            local reason = ok and "返回失败" or tostring(result)
            if unlocked then
                -- SetUnlocked may mutate preview state before a later overlay
                -- step throws. Best-effort cleanup prevents half-built frames
                -- from becoming permanently stuck on screen.
                pcall(module.SetUnlocked, module, false)
            end
            failures[#failures + 1] = tostring(name) .. "（" .. reason .. "）"
        end
        index = index + 1
    end
    if unlocked then
        self.isMoveMode = #succeeded > 0
    elseif #failures == 0 then
        self.isMoveMode = false
    end
    if not self.isMoveMode and self.nudge then self.nudge:Hide() end
    self:NotifyStateChanged()
    if #failures > 0 then
        self:Print("以下 RS 模块切换失败，其他模块已继续：" .. table.concat(failures, "、"))
    end
    if #succeeded == 0 then return false end
    self:Print(self.isMoveMode and "已解锁 RS 工具箱模块。" or "已锁定 RS 工具箱模块。")
    return true
end

function MoveManager:FlushPendingRsMoveMode()
    if type(self.inCombat) == "function" and self.inCombat() then return false end
    local pendingAll = self.pendingAllMove
    if pendingAll ~= nil then
        self.pendingAllMove = nil
        if pendingAll == "toggle" then
            return self:ToggleAllMove() ~= false
        end
        self:UnlockAllMove()
        return true
    end
    local pending = self.pendingRsMoveMode
    if pending == nil then return false end
    self.pendingRsMoveMode = nil
    return self:SetRsMoveMode(pending)
end

function MoveManager:ToggleMarkerAnchors()
    return self:SetRsMoveMode(not self.isMoveMode)
end

function MoveManager:GetExternalStateKey(entry)
    return entry.stateKey or entry.addon or entry.id
end

function MoveManager:IsExternalUnlocked(entry)
    if type(entry.getState) == "function" then
        local ok, state = pcall(entry.getState, self.external, entry)
        return ok and state == true
    end
    return self.externalState[self:GetExternalStateKey(entry)] == true
end

function MoveManager:ToggleExternal(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.external:GetEntry(entryOrID)
    if not (entry and entry.canMove and self.external:IsAvailable(entry)) then return false end
    local key = self:GetExternalStateKey(entry)
    local wasUnlocked = self:IsExternalUnlocked(entry)
    local succeeded
    if wasUnlocked then
        succeeded = self.external:Lock(entry)
        if succeeded then self.externalState[key] = false end
    else
        succeeded = self.external:Unlock(entry)
        if succeeded then self.externalState[key] = true end
    end
    if not succeeded then
        self:Print(entry.name .. (wasUnlocked and " 锁定失败，请手动操作。" or " 解锁失败，请手动操作。"))
    end
    self:NotifyStateChanged()
    return succeeded
end

function MoveManager:TriggerExternalMoveCommands()
    local entries = self.external:GetEntries()
    local count = 0
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        local key = self:GetExternalStateKey(entry)
        if entry.canMove and entry.includeInAll ~= false and self.external:IsAvailable(entry)
            and not self:IsExternalUnlocked(entry) and self.external:Unlock(entry) then
            self.externalState[key] = true
            count = count + 1
        end
        index = index + 1
    end
    self:NotifyStateChanged()
    return count
end

function MoveManager:IsAllUnlocked()
    if not self.isMoveMode then return false end
    local entries = self.external:GetEntries()
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        if entry.canMove and entry.includeInAll ~= false and self.external:IsAvailable(entry)
            and not self:IsExternalUnlocked(entry) then
            return false
        end
        index = index + 1
    end
    return true
end

function MoveManager:ToggleAllMove()
    if type(self.inCombat) == "function" and self.inCombat() then
        self.pendingRsMoveMode = nil
        self.pendingAllMove = "toggle"
        if type(self.onCombatDeferred) == "function" then self.onCombatDeferred(true) end
        self:Print("战斗中暂不切换全部移动状态，脱战后会自动执行。")
        return false
    end
    if self:IsAllUnlocked() then
        self:SetRsMoveMode(false)
        local entries = self.external:GetEntries()
        local index = 1
        while index <= #entries do
            local entry = entries[index]
            local key = self:GetExternalStateKey(entry)
            if entry.canMove and entry.includeInAll ~= false and self.external:IsAvailable(entry)
                and self:IsExternalUnlocked(entry)
                and self.external:Lock(entry) then
                self.externalState[key] = false
            end
            index = index + 1
        end
        self:NotifyStateChanged()
        self:Print("已锁定 RS 与外部插件。")
        return true
    end

    self:SetRsMoveMode(true)
    local count = self:TriggerExternalMoveCommands()
    self:Print(string.format("已解锁 RS 与 %d 个外部插件。", count))
    return true
end

function MoveManager:UnlockAllMove()
    if type(self.inCombat) == "function" and self.inCombat() then
        self.pendingRsMoveMode = nil
        self.pendingAllMove = "unlock"
        if type(self.onCombatDeferred) == "function" then self.onCombatDeferred(true) end
        self:Print("战斗中暂不解锁全部移动模块，脱战后会自动执行。")
        return 0
    end
    if not self.isMoveMode then self:SetRsMoveMode(true) end
    local count = self:TriggerExternalMoveCommands()
    if count > 0 then
        self:Print(string.format(
            "已解锁 %d 个外部插件。提示：/rsm 仅切换 RS 模块，/rsm all 全部解锁。",
            count
        ))
    end
    return count
end

function MoveManager:OnMoveCommandAll()
    if self.allCommandMode == "unlock-only" then
        return self:UnlockAllMove()
    end
    return self:ToggleAllMove()
end

function MoveManager:OnMoveCommand(input)
    self.commandCount = self.commandCount + 1
    if TrimLower(input) == "all" then
        self:OnMoveCommandAll()
        return
    end
    self:ToggleMarkerAnchors()
end

function MoveManager:OpenExternalSettings(entryOrID)
    return self.external:OpenSettings(entryOrID)
end

function MoveManager:InvokeExternalAction(entryOrID)
    return self.external:InvokeAction(entryOrID)
end

function MoveManager:LockExternalModules()
    local entries = self.external:GetEntries()
    local locked = 0
    local index = 1
    while index <= #entries do
        local entry = entries[index]
        local key = self:GetExternalStateKey(entry)
        if entry.canMove and self.external:IsAvailable(entry) and self:IsExternalUnlocked(entry)
            and self.external:Lock(entry) then
            self.externalState[key] = false
            locked = locked + 1
        end
        index = index + 1
    end
    if locked > 0 then self:NotifyStateChanged() end
    return locked
end

function MoveManager:RefreshPage(reason)
    local pages = self.system and self.system.pages
    if pages and type(pages.Refresh) == "function" then
        return pages:Refresh("movemanager", reason)
    end
    return false
end

function MoveManager:GetDiagnostics()
    local unlocked = 0
    for _, entry in ipairs(self.external:GetEntries()) do
        if entry.canMove and self.external:IsAvailable(entry) and self:IsExternalUnlocked(entry) then
            unlocked = unlocked + 1
        end
    end
    return {
        moveMode = self.isMoveMode,
        externalUnlocked = unlocked,
        commands = self.commandCount,
        stateChanges = self.stateChanges,
        pendingRsMoveMode = self.pendingRsMoveMode,
        pendingAllMove = self.pendingAllMove,
    }
end

ClassicUI.MoveManager = MoveManager
