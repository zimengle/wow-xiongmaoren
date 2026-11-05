local _, RS = ...

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("ExternalAdapters requires ClassicUI before it", 2)
end

local ExternalMoveAdapter = {}
ExternalMoveAdapter.__index = ExternalMoveAdapter

local function DefaultIsAddonLoaded(name)
    if RS.Compat and type(RS.Compat.IsAddOnLoaded) == "function" then
        return RS.Compat.IsAddOnLoaded(name)
    end
    local callback = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) or false
end

local function DefaultPrint(message)
    if type(RS.Print) == "function" then RS.Print(message) end
end

function ExternalMoveAdapter:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.globals = options.globals or _G
    instance.slashCommands = options.slashCommands or instance.globals.SlashCmdList or {}
    instance.isAddonLoaded = options.isAddonLoaded or DefaultIsAddonLoaded
    instance.print = options.print or DefaultPrint
    instance.getNDuiOpenFunc = options.getNDuiOpenFunc
    instance.entries = {}
    instance.order = {}
    instance.callCount = 0
    return instance
end

function ExternalMoveAdapter:Register(entry)
    if type(entry) ~= "table" or type(entry.id) ~= "string" or entry.id == ""
        or self.entries[entry.id] then
        return false
    end
    self.entries[entry.id] = entry
    self.order[#self.order + 1] = entry.id
    return true
end

function ExternalMoveAdapter:GetEntry(id)
    return self.entries[id]
end

function ExternalMoveAdapter:GetEntries(reusableResult)
    local result = reusableResult or {}
    local index = 1
    while index <= #self.order do
        result[index] = self.entries[self.order[index]]
        index = index + 1
    end
    index = #result
    while index > #self.order do
        result[index] = nil
        index = index - 1
    end
    return result
end

function ExternalMoveAdapter:IsLoaded(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    return entry and type(entry.addon) == "string"
        and self.isAddonLoaded(entry.addon) and true or false
end

function ExternalMoveAdapter:IsAvailable(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    if not entry then return false end
    if type(entry.check) == "function" then
        local ok, available = pcall(entry.check, self, entry)
        return ok and available and true or false
    end
    if type(entry.addon) == "string" then return self:IsLoaded(entry) end
    return true
end

function ExternalMoveAdapter:CallSlash(fullCommand, pluginName, directKey)
    local slash, rest = string.match(fullCommand or "", "^(/[^ ]+)(.*)")
    if not slash then return false end
    local args = rest and string.match(rest, "^ *(.-)%s*$") or ""
    local keys = {}
    if directKey then keys[#keys + 1] = directKey end
    local automatic = string.sub(string.upper(slash), 2)
    if automatic ~= directKey then keys[#keys + 1] = automatic end

    local index = 1
    while index <= #keys do
        local handler = self.slashCommands[keys[index]]
        if type(handler) == "function" then
            local ok, reason = pcall(handler, args)
            if not ok then
                self.print((pluginName or slash) .. " 命令执行失败: " .. tostring(reason))
                return false
            end
            self.callCount = self.callCount + 1
            return true
        end
        index = index + 1
    end

    return false
end

function ExternalMoveAdapter:LockNDui()
    local namespace = self.globals.NDui
    local base = namespace and namespace[1]
    if not base then return false end
    local mover = base.Modules and base.Modules.Mover
    if not mover and type(base.GetModule) == "function" then
        local ok, result = pcall(base.GetModule, base, "Mover")
        if ok then mover = result end
    end
    if not (mover and type(mover.LockElements) == "function") then return false end
    local ok, reason = pcall(mover.LockElements, mover)
    if not ok then
        self.print("NDui 锁定失败: " .. tostring(reason))
        return false
    end
    self.callCount = self.callCount + 1
    return true
end

function ExternalMoveAdapter:Unlock(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    if not (entry and entry.canMove and self:IsAvailable(entry)) then return false end
    if type(entry.unlock) == "function" then
        return entry.unlock(self, entry) and true or false
    end
    return entry.macro and self:CallSlash(entry.macro, entry.name, entry.directKey) or false
end

function ExternalMoveAdapter:Lock(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    if not (entry and entry.canMove and self:IsAvailable(entry)) then return false end
    if type(entry.lock) == "function" then
        return entry.lock(self, entry) and true or false
    end
    if entry.lockKind == "ndui" then return self:LockNDui() end
    return entry.macro and self:CallSlash(entry.macro, entry.name, entry.directKey) or false
end

function ExternalMoveAdapter:OpenSettings(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    if not (entry and self:IsAvailable(entry)) then return false end
    if type(entry.openSettings) == "function" then
        return entry.openSettings(self, entry) and true or false
    end

    if entry.settingsKind == "ndui" then
        local callback = self.getNDuiOpenFunc and self.getNDuiOpenFunc()
        if type(callback) == "function" then callback(); self.callCount = self.callCount + 1; return true end
        local frame = self.globals.NDuiGUI
        if frame and type(frame.Show) == "function" then frame:Show(); self.callCount = self.callCount + 1; return true end
        self.print("未能打开 NDui 设置面板，请先手动打开一次 ESC 菜单后重试。")
        return false
    elseif entry.settingsKind == "elvui" then
        local engine = self.globals.ElvUI and self.globals.ElvUI[1]
        if engine and type(engine.ToggleOptions) == "function" then
            engine:ToggleOptions()
            self.callCount = self.callCount + 1
            return true
        end
        return self:CallSlash("/ec", "ElvUI", "ELVUI")
    elseif entry.settingsKind == "cell" then
        local cell = self.globals.Cell
        if cell and cell.funcs and type(cell.funcs.ShowOptionsFrame) == "function" then
            local ok, reason = pcall(cell.funcs.ShowOptionsFrame)
            if ok then self.callCount = self.callCount + 1; return true end
            self.print("Cell 设置打开失败: " .. tostring(reason))
        end
        return self:CallSlash("/cell opt", "Cell", "CELL")
    end
    return false
end

function ExternalMoveAdapter:InvokeAction(entryOrID)
    local entry = type(entryOrID) == "table" and entryOrID or self.entries[entryOrID]
    if not (entry and self:IsAvailable(entry) and type(entry.action) == "function") then
        return false
    end
    local ok, result = pcall(entry.action, self, entry)
    if not ok then
        self.print((entry.name or entry.id) .. " 操作失败: " .. tostring(result))
        return false
    end
    if result == false then return false end
    self.callCount = self.callCount + 1
    return true
end

function ExternalMoveAdapter:GetDiagnostics()
    return { registered = #self.order, calls = self.callCount }
end

ClassicUI.ExternalMoveAdapter = ExternalMoveAdapter
