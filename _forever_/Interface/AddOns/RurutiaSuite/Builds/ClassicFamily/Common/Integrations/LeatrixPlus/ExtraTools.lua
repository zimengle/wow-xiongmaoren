local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("leatrix") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before Leatrix integration", 2) end

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback("Leatrix_Plus") and true or false
end

-- Leatrix Plus 把 FasterLooting 的当前值保存在 local 运行配置里，并只在重载时从
-- SavedVariables 重新取值，外部无法读到“此刻是否在跑”。既然无法证明运行态，就按
-- 插件已加载保守暂停。取消勾选单项后只要插件仍加载，本判定依旧命中，所以提示必须
-- 如实要求停用 Leatrix Plus 并重载，不能承诺只改那一项设置就能恢复。
Registry:Register({
    id = "leatrix-plus",
    priority = 5,
    addonNames = { Leatrix_Plus = true },
    fastLootAddon = "Leatrix_Plus",
    fastLootLabel = "Leatrix Plus",
    fastLootAction = "RS 无法探测它的实时运行状态，只要 Leatrix Plus 还在加载就会保持暂停；"
        .. "需要停用 Leatrix Plus（或它的快速拾取功能所在的整个插件）后重载界面，RS 才会接管",
    IsFastLootOwner = function() return IsLoaded() end,
    OnAddonLoaded = function(_, module)
        module:SyncFastLoot()
        return true
    end,
})
