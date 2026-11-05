local _, ns = ...

local Async = {
    tasks = {},
    defaultTimeBudget = 12,
}
ns.Async = Async
ns.AsyncLib = Async

local STATUS_PENDING = "PENDING"
local STATUS_RUNNING = "RUNNING"
local STATUS_COMPLETED = "COMPLETED"
local STATUS_ERROR = "ERROR"

local function Now()
    if type(_G.GetTime) == "function" then
        return _G.GetTime()
    end
    return 0
end

local function ProfileNow()
    if type(_G.debugprofilestop) == "function" then
        return _G.debugprofilestop()
    end
    return Now() * 1000
end

local function ReportError(message)
    if type(_G.geterrorhandler) == "function" then
        local handler = _G.geterrorhandler()
        if type(handler) == "function" then
            handler(message)
        end
    end
end

function Async:_EnsureDriver()
    if self.frame == nil then
        self.frame = _G.CreateFrame("Frame")
    end
    if self.running then
        return
    end
    self.frame:SetScript("OnUpdate", function(_, elapsed)
        self:OnUpdate(elapsed)
    end)
    if type(self.frame.Show) == "function" then
        self.frame:Show()
    end
    self.running = true
    self.startCount = (self.startCount or 0) + 1
end

function Async:_StopDriver()
    if not self.running then
        return
    end
    self.frame:SetScript("OnUpdate", nil)
    if type(self.frame.Hide) == "function" then
        self.frame:Hide()
    end
    self.running = false
    self.stopCount = (self.stopCount or 0) + 1
end

function Async:Run(func, onComplete, onError, config)
    if type(func) ~= "function" then
        error("Async:Run expects a function", 2)
    end
    config = config or {}
    local task = {
        co = coroutine.create(func),
        status = STATUS_PENDING,
        name = config.name or "AnonymousTask",
        budget = config.budget or self.defaultTimeBudget,
        priority = config.priority or 0,
        onComplete = onComplete,
        onError = onError,
        startTime = Now(),
        progress = 0,
    }
    self.tasks[#self.tasks + 1] = task
    self:_EnsureDriver()
    return task
end

function Async:ProcessList(list, processor, batchSize, onComplete, onProgress)
    if type(list) ~= "table" or type(processor) ~= "function" then
        error("Async:ProcessList expects a list and processor", 2)
    end
    batchSize = tonumber(batchSize) or 1
    if batchSize < 1 then batchSize = 1 end
    batchSize = math.floor(batchSize)

    local func = function()
        local total = #list
        local index
        local item
        for index, item in ipairs(list) do
            if processor(item, index) == false then
                break
            end
            if index % batchSize == 0 then
                local progress = total > 0 and index / total or 1
                coroutine.yield(progress)
                if onProgress then
                    onProgress(progress)
                end
            end
        end
        return true
    end
    return self:Run(func, onComplete, nil, { name = "ProcessList" })
end

function Async:Cancel(task)
    local index
    for index = #self.tasks, 1, -1 do
        if self.tasks[index] == task then
            table.remove(self.tasks, index)
            task.status = "CANCELLED"
            if #self.tasks == 0 then
                self:_StopDriver()
            end
            return true
        end
    end
    return false
end

function Async:OnUpdate()
    if #self.tasks == 0 then
        self:_StopDriver()
        return
    end

    local frameStart = ProfileNow()
    local budget = self.defaultTimeBudget
    while ProfileNow() - frameStart < budget and #self.tasks > 0 do
        local worked = false
        local index = #self.tasks
        while index >= 1 do
            if ProfileNow() - frameStart >= budget then
                break
            end
            local task = self.tasks[index]
            if task.status == STATUS_PENDING or task.status == STATUS_RUNNING then
                task.status = STATUS_RUNNING
                local success, result = coroutine.resume(task.co)
                worked = true
                if not success then
                    task.status = STATUS_ERROR
                    ReportError(result)
                    if task.onError then
                        task.onError(result)
                    end
                    table.remove(self.tasks, index)
                elseif coroutine.status(task.co) == "dead" then
                    task.status = STATUS_COMPLETED
                    if task.onComplete then
                        task.onComplete(result)
                    end
                    table.remove(self.tasks, index)
                elseif type(result) == "number" then
                    task.progress = result
                end
            end
            index = index - 1
        end
        if not worked then
            break
        end
    end
    if #self.tasks == 0 then
        self:_StopDriver()
    end
end

function Async:Shutdown()
    local index
    for index = #self.tasks, 1, -1 do
        self.tasks[index].status = "CANCELLED"
        self.tasks[index] = nil
    end
    self:_StopDriver()
end

function Async:GetDiagnostics()
    return {
        taskCount = #self.tasks,
        frameAllocated = self.frame ~= nil,
        running = self.running == true,
        startCount = self.startCount or 0,
        stopCount = self.stopCount or 0,
    }
end

