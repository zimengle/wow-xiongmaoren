-- 文件职责：ExtraTools 私有快速拾取服务。只提前发起游戏已经允许的自动拾取，
-- 不接管拾取窗口、不确认绑定、不改动任何 CVar，也不修改第三方插件状态。
local _, ns = ...

local adapter = ns.ExtraToolsAdapter
-- Retain this service only on clients whose adapter exposes the capability.
-- Isolated service hosts may supply the adapter later; production TOCs load it first.
if adapter and not (adapter.features and adapter.features.fastLoot) then return end

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local FastLoot = {}
ns.ExtraToolsFastLoot = FastLoot

-- 原生证据：wow-ui-source forever 1.60.1 (70ef1b2fd78061a73f886c4a1e79dc5b5cff6d5e)
-- LootDocumentation.lua:229-234 声明 LOOT_READY(autoloot) 与 LOOT_OPENED(autoLoot, isFromItem)
-- 均为同步事件；LootFrame.lua:235-236 以 GetNumLootItems/GetLootSlotInfo 构建拾取列表。
local AUTO_LOOT_CVAR_DEFAULT = "autoLootDefault"
local AUTO_LOOT_TOGGLE_KEY = "AUTOLOOTTOGGLE"

-- 第三方快速拾取所有权只在 Integrations 判定；本服务只消费判定结果，
-- 不读也不写第三方的 SavedVariables，也不 hook 对方函数。
-- Leatrix Plus 的运行配置是 local，SavedVariables 不能代表当下是否在跑，
-- 因此 Integrations 采用“插件已加载即保守暂停”，并如实给出需要重载的提示。
local DEFAULT_CONFLICT_ACTION = "关闭该插件的快速拾取功能后重载界面，再核对这里的状态。"

local session = { id = 0 }

local function GetAdapter()
    return ns.ExtraToolsAdapter
end

local function GetProfile()
    local module = FastLoot.module
    return module and module:GetProfile() or nil
end

local function IsFeatureEnabled()
    local adapter = GetAdapter()
    return adapter ~= nil and adapter.features ~= nil and adapter.features.fastLoot == true
end

local function IsLootApiSupported()
    local adapter = GetAdapter()
    return adapter ~= nil and type(adapter.IsLootApiSupported) == "function"
        and adapter:IsLootApiSupported() == true
end

local function GetConflict()
    if not IsFeatureEnabled() then return nil end
    local adapter = GetAdapter()
    if type(adapter.GetFastLootConflict) ~= "function" then return nil end
    local conflict = adapter:GetFastLootConflict()
    if type(conflict) ~= "table" then return nil end
    local label = conflict.label or conflict.addon or conflict.id or "第三方插件"
    return {
        id = conflict.id,
        addon = conflict.addon or label,
        label = label,
        action = conflict.action or DEFAULT_CONFLICT_ACTION,
    }
end

local function IsUserEnabled()
    local profile = GetProfile()
    return profile ~= nil and profile.fastLoot == true
end

-- 模块停用、profile 切换或功能关闭时必须释放会话状态，
-- 否则残留的 lootOpen 会让之后的拾取批次被当成同一批。
local function ClearSession()
    session.id = session.id + 1
    session.lootOpen = false
end

function FastLoot:GetConflictInfo()
    local conflict = GetConflict()
    if not conflict then return nil end
    return { id = conflict.id, addon = conflict.addon, label = conflict.label, action = conflict.action }
end

function FastLoot:GetStatus()
    local profile = GetProfile()
    local status = {
        supported = IsFeatureEnabled() and IsLootApiSupported(),
        enabled = profile ~= nil and profile.fastLoot == true,
        active = false,
        reason = "ok",
        addon = nil,
        label = nil,
        message = nil,
    }
    if not IsFeatureEnabled() then
        status.reason = "unsupported"
        status.message = "当前客户端不支持快速拾取。"
        return status
    end
    if not IsLootApiSupported() then
        status.reason = "unsupported"
        status.message = "当前客户端缺少拾取接口，快速拾取不可用。"
        return status
    end
    if not status.enabled then
        status.reason = "disabled"
        return status
    end
    local conflict = GetConflict()
    if conflict then
        status.reason = "conflict"
        status.id = conflict.id
        status.addon = conflict.addon
        status.label = conflict.label
        status.message = "检测到" .. conflict.label .. "，快速拾取已暂停；" .. conflict.action
        return status
    end
    status.active = true
    return status
end

function FastLoot:ShouldHandleLoot()
    if not (FastLoot.module ~= nil and FastLoot.module.runtimeActive == true) then return false end
    return IsFeatureEnabled() and IsLootApiSupported() and IsUserEnabled() and GetConflict() == nil
end

function FastLoot:Bind(module)
    FastLoot.module = module
    ClearSession()
    self:Sync()
    return true
end

function FastLoot:Sync()
    if not self:ShouldHandleLoot() then ClearSession() end
    return true
end

-- profile 切换必须丢弃旧 profile 认领的批次：开关在两个 profile 里都为 true 时，
-- Sync 不会清理，残留的 handledSession 会挡住新 profile 的拾取窗口。
function FastLoot:OnProfileChanged()
    ClearSession()
    return self:Sync()
end

function FastLoot:Reset()
    local profile = GetProfile()
    if profile then profile.fastLoot = true end
    ClearSession()
    self:Sync()
    return true
end

function FastLoot:Detach()
    FastLoot.module = nil
    ClearSession()
    return true
end

function FastLoot:IsAutoLootActive(flag)
    if type(flag) == "boolean" then return flag end
    local adapter = GetAdapter()
    local store = adapter and adapter.GetAutoLootState
    local defaultOn = nil
    if type(store) == "function" then
        local ok, value = pcall(store, adapter)
        if ok and type(value) == "boolean" then defaultOn = value end
    end
    if defaultOn == nil then
        local getCVar = _G.GetCVarBool
        if type(getCVar) == "function" then
            local ok, value = pcall(getCVar, AUTO_LOOT_CVAR_DEFAULT)
            if ok and type(value) == "boolean" then defaultOn = value end
        end
    end
    if defaultOn == nil then return false end
    local modifierClick = _G.IsModifiedClick
    local toggled = false
    if type(modifierClick) == "function" then
        local ok, value = pcall(modifierClick, AUTO_LOOT_TOGGLE_KEY)
        toggled = ok and value == true
    end
    -- 与原生一致：CVar 与实际修饰键状态异或；修饰键按用户当前绑定判断，不硬编码 Shift。
    return (defaultOn ~= toggled) and true or false
end

function FastLoot:IsLootSessionValid(token)
    local module = FastLoot.module
    if not (module and module.runtimeActive) then return false end
    if session.id ~= token then return false end
    if not self:ShouldHandleLoot() then return false end
    if not session.lootOpen then return false end
    return true
end

function FastLoot:OnLootReady(flag)
    local module = FastLoot.module
    if not (module and module.runtimeActive) then return end
    if not self:ShouldHandleLoot() then return end

    -- 同一窗口内可能连发多次 LOOT_READY，其中既可能有同批重复事件，也可能是服务器
    -- 分批下发的下一批。两者在客户端观测到的信号完全一致（标志位相同、数量相同、
    -- 槽位序号相同），无法可靠区分；而服务器确认拾取后会对同一槽位 no-op，重复提交
    -- 无害，漏拾则不可逆。因此按参考实现（LTP/PIG 同样不做跨事件去重）每次只取当前
    -- 可见的掉落，用“数量为 0 就返回”保证不会凭空空转。
    local autoLoot = self:IsAutoLootActive(flag)

    local adapter = GetAdapter()
    local okCount, count = pcall(adapter.GetNumLootItems, adapter)
    if not okCount or type(count) ~= "number" or count <= 0 then return end

    session.id = session.id + 1
    session.lootOpen = true

    -- 原生事件已给出可靠的 autoLoot 布尔，优先采用；缺失时才回落到 CVar 与修饰键异或。
    if not autoLoot then
        -- 本轮不是自动拾取，保留原生手选窗口，也不认领这一批。
        session.lootOpen = false
        return
    end

    self:LootBatch(adapter, count)
end

function FastLoot:OnLootOpened(flag, isFromItem)
    local module = FastLoot.module
    if not (module and module.runtimeActive) then return end
    if not self:ShouldHandleLoot() then return end
    -- 打开容器类物品有原生窗口流程，不参与自动拾取加速。
    if isFromItem == true then return end
    if not self:IsAutoLootActive(flag) then return end

    local adapter = GetAdapter()
    local okCount, count = pcall(adapter.GetNumLootItems, adapter)
    if not okCount or type(count) ~= "number" or count <= 0 then return end

    -- 与 LOOT_READY 同理：不能按数量判断“有没有新增”。服务器分批下发时前一批确认后
    -- 槽位会归零，下一批的可见数量并不比上次多，按数量比较会把新一批漏掉。既然二者
    -- 不可区分，就与 READY 保持一致：每次只取当前可见的掉落，重复提交由服务器 no-op。
    session.id = session.id + 1
    session.lootOpen = true
    self:LootBatch(adapter, count)
end

function FastLoot:OnLootClosed()
    session.lootOpen = false
end

-- 每次只处理“当前可见”的这一批：从数量快照倒序遍历到最后一件。
-- 不做跨事件去重（见 OnLootReady 的说明），也不按槽位序号判断新旧。
function FastLoot:LootBatch(adapter, count)
    -- 同 LTP：分解按钮处于可点但未就绪的状态时不动这一批，也不认领批次，
    -- 让原生的 LOOT_OPENED 有机会在按钮恢复后再处理。
    if type(adapter.IsDestroyButtonBlocked) == "function"
        and adapter:IsDestroyButtonBlocked() == true then
        return
    end

    local token = session.id

    -- 倒序遍历：槽位在拾取后由原生向上重排，倒序不会跳过后续槽位。
    local index
    for index = count, 1, -1 do
        if not self:IsLootSessionValid(token) then return end
        local okInfo, _, _, _, _, _, locked = pcall(adapter.GetLootSlotInfo, adapter, index)
        -- 锁定或已分配给其他玩家的槽位交给原生窗口和分配流程处理。
        if okInfo and locked ~= true then
            -- LootSlot 为受保护调用，失败或空槽只跳过，不重试、不关闭窗口。
            pcall(adapter.LootSlot, adapter, index)
        end
    end
end
