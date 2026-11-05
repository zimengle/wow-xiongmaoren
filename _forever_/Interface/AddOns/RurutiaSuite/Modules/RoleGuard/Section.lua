-- 文件职责：进组职责保护的嵌入式设置区。
-- 负责：将启用开关和目标职责嵌入 Classic 的“插件增强”页；不创建独立页面。

local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("RoleGuard") then return end

local Settings = {}
local TARGET_ROLE_LABELS = {
    DAMAGER = "伤害",
    TANK = "坦克",
}
local TARGET_ROLE_ORDER = { "DAMAGER", "TANK" }

function Settings:BuildSection(page, module)
    if not (page and module and module:IsSupported()) then return false end

    local profile = module:GetProfile()
    local section = page:Section("进组职责保护")
    section:QuadRow():Checkbox("roleGuardEnabled", {
        text = "启用",
        tooltip = "仅在刚进组的短时间内，阻止 DBM 等插件把本人职责自动切换为治疗；随机队伍和战斗中不会改职责。",
        value = profile.enabled == true,
        getValue = function() return module:GetProfile().enabled == true end,
        onChange = function(control, value)
            local ok = module:SetEnabled(value == true)
            if ok == false then control:SetValue(module:GetProfile().enabled == true, true) end
        end,
    })

    section:FieldRow():Dropdown("roleGuardTargetRole", {
        text = "被切成治疗时改回",
        tooltip = "选择进组保护窗口内的恢复目标；保护窗口结束后不干预手动职责。",
        value = module:GetTargetRole(),
        options = TARGET_ROLE_LABELS,
        order = TARGET_ROLE_ORDER,
        onChange = function(control, value)
            if not module:SetTargetRole(value) then
                control:SetValue(module:GetTargetRole(), true)
            end
        end,
    })
    section:Description("只处理单人进入普通队伍后的 10 秒窗口，不修改 DBM 文件，也不会持续对抗之后的手动职责选择。")
    return true
end

function Settings:Refresh(page, module)
    if not (page and module) then return false end
    local enabled = page:GetControl("roleGuardEnabled")
    local targetRole = page:GetControl("roleGuardTargetRole")
    if enabled then enabled:SetValue(module:GetProfile().enabled == true, true) end
    if targetRole then targetRole:SetValue(module:GetTargetRole(), true) end
    return enabled ~= nil or targetRole ~= nil
end

ns.RoleGuardSettings = Settings
