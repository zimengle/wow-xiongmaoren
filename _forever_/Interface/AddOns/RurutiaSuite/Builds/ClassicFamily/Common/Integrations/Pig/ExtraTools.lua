local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("pig") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers must load before !Pig integration", 2) end

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback("!Pig") and true or false
end

-- !Pig 的“加快拾取速度”开关保存在自己的配置里；RS 只读插件加载状态，
-- 不读它的 SavedVariables，也不改它的设置。
Registry:Register({
    id = "pig",
    priority = 5,
    addonNames = { ["!Pig"] = true },
    fastLootAddon = "!Pig",
    fastLootLabel = "!Pig",
    fastLootAction = "关闭它的“加快拾取速度”，重载界面后再核对",
    IsFastLootOwner = function() return IsLoaded() end,
    OnAddonLoaded = function(_, module)
        module:SyncFastLoot()
        return true
    end,
})
