local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("elvui") then return end

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before ElvUI integration", 2) end

local ownership = setmetatable({}, { __mode = "k" })

local function IsLoaded()
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback("ElvUI") and true or false
end

local function GetCore()
    return type(_G.ElvUI) == "table" and _G.ElvUI[1] or nil
end

local function MatchesUpdateNotice(text)
    if type(text) ~= "string" or not string.find(text, "ElvUI") then return false end
    return string.find(text, "out of date") ~= nil or string.find(text, "tukui%.org") ~= nil
        or string.find(text, "tukui.org", 1, true) ~= nil
        or string.find(text, "Download the latest version", 1, true) ~= nil
        or string.find(text, "New ElvUI version", 1, true) ~= nil
        or string.find(text, "已过期", 1, true) ~= nil or string.find(text, "已過期", 1, true) ~= nil
        or string.find(text, "新版本", 1, true) ~= nil or string.find(text, "更新", 1, true) ~= nil
end

local Provider = {
    id = "elvui",
    priority = 20,
    addonNames = { ElvUI = true },
    fastLootAddon = "ElvUI",
    fastLootLabel = "ElvUI",
    fastLootAction = "关闭它的自动拾取加速选项，重载界面后再核对",
}

function Provider:IsActionBarEnabled()
    if not IsLoaded() then return false end
    local core = GetCore()
    local actionbar = core and core.private and core.private.actionbar
    return actionbar ~= nil and actionbar.enable == true
end

function Provider:IsPreferredLFGProvider(profile)
    return profile and profile.useElvUIPosition == true and IsLoaded()
end
function Provider:GetLFGPosition(profile) return profile.elvuiX, profile.elvuiY end
function Provider:SetLFGPosition(profile, x, y) profile.elvuiX, profile.elvuiY = x, y end
function Provider:ResetLFGPosition(profile, defaults)
    profile.elvuiX, profile.elvuiY = defaults.elvuiX, defaults.elvuiY
end
function Provider:HasAltPowerOwner()
    return _G.ElvUI_AltPowerBar ~= nil or IsLoaded()
end
-- ElvUI 自身带有自动拾取加速，运行配置不对外暴露；按插件加载保守暂停 RS 快速拾取。
function Provider:IsFastLootOwner() return IsLoaded() end
function Provider:MatchesUpdateNotice(text) return MatchesUpdateNotice(text) end
function Provider:ShouldBlockUpdatePopup(which, text)
    return which == "ELVUI_UPDATE_AVAILABLE" or which == "ELVUI_OUTDATED" or MatchesUpdateNotice(text)
end
function Provider:ApplyUpdateBlocker(module)
    local profile = module:GetUpdateBlockerDB()
    if not (profile and profile.enabled) then
        self:RestoreUpdateBlocker(module)
        return false
    end
    if ownership[module] ~= nil then return true end
    local core = GetCore()
    if not core then return false end
    local originalPopup, originalPrint = core.StaticPopup_Show, core.Print
    local originalReceived = core.recievedOutOfDateMessage
    local changedReceived = originalReceived ~= true
    if type(originalPopup) ~= "function" and type(originalPrint) ~= "function" then return false end
    local record = { core = core, originalPopup = originalPopup, originalPrint = originalPrint,
        originalReceived = originalReceived, changedReceived = changedReceived }
    if type(originalPopup) == "function" then
        record.popupWrapper = function(owner, which, text, ...)
            local current = module:GetUpdateBlockerDB()
            if current.enabled and current.blockPopup and Provider:ShouldBlockUpdatePopup(which, text) then return nil end
            return originalPopup(owner, which, text, ...)
        end
        core.StaticPopup_Show = record.popupWrapper
    end
    if type(originalPrint) == "function" then
        record.printWrapper = function(owner, message, ...)
            local current = module:GetUpdateBlockerDB()
            if current.enabled and current.blockChat and MatchesUpdateNotice(message) then return nil end
            return originalPrint(owner, message, ...)
        end
        core.Print = record.printWrapper
    end
    if changedReceived then core.recievedOutOfDateMessage = true end
    ownership[module] = record
    return true
end
function Provider:RestoreUpdateBlocker(module)
    local record = ownership[module]
    if not record then return false end
    local core = record.core
    if record.popupWrapper and core.StaticPopup_Show == record.popupWrapper then
        core.StaticPopup_Show = record.originalPopup
    end
    if record.printWrapper and core.Print == record.printWrapper then core.Print = record.originalPrint end
    if record.changedReceived and core.recievedOutOfDateMessage == true then
        core.recievedOutOfDateMessage = record.originalReceived
    end
    ownership[module] = nil
    return true
end
function Provider:OnAddonLoaded(module)
    module:ApplyExternalUpdateBlockers()
    return true
end

Registry:Register(Provider)
