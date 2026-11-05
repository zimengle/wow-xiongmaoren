-- 文件职责：Classic 过期插件开关的一次性启动守卫。
-- 负责：登录启动后延迟 2 秒检查与修正；无轮询、无常驻定时器。

local _, ns = ...

local Adapter = ns.OutOfDateAddonsAdapter
if ns.Build and ns.Build.HasModule and ns.Build.HasModule("OutOfDateAddonsGuard")
    and type(Adapter) ~= "table" then
    error("OutOfDateAddonsGuard requires the Classic adapter before Core.lua", 2)
end

local Definition = {
    defaultEnabled = true,
}

function Definition:RunGuard()
    self._guardHandle = nil
    self._guardComplete = true
    if self._promptShown or not Adapter:AllowOutOfDateAddons() then return false end
    self._promptShown = true
    Adapter:ShowReloadPrompt()
    return true
end

function Definition:Enable()
    if self._guardComplete or self._guardHandle then return end
    self._guardHandle = self:Schedule(2, function(module) module:RunGuard() end,
        "Classic allow out-of-date addons")
end

function Definition:Disable()
    self._guardHandle = nil
end

local module, reason = ns.RegisterModule("OutOfDateAddonsGuard", Definition)
if module then
    ns.OutOfDateAddonsGuard = module
else
    ns.OutOfDateAddonsGuardRegistrationError = reason
end
