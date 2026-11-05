local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then return end

-- The sole Retail boundary for AddonProfile.  Core intentionally knows no
-- C_AddOns, player identity, clock, timer, or serialization implementation.
local C_AddOns = _G.C_AddOns
local GetAddOnInfo = (C_AddOns and C_AddOns.GetAddOnInfo) or _G.GetAddOnInfo
local GetNumAddOns = (C_AddOns and C_AddOns.GetNumAddOns) or _G.GetNumAddOns
local GetAddOnEnableState = (C_AddOns and C_AddOns.GetAddOnEnableState) or _G.GetAddOnEnableState
local EnableAddOn = (C_AddOns and C_AddOns.EnableAddOn) or _G.EnableAddOn
local DisableAddOn = (C_AddOns and C_AddOns.DisableAddOn) or _G.DisableAddOn
local IsAddOnLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded

local Adapter = { family = "retail" }

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsLoggedIn()
    return type(_G.IsLoggedIn) == "function" and _G.IsLoggedIn() and true or false
end

function Adapter:GetAddonCharacter()
    if type(_G.UnitName) == "function" then
        local name = _G.UnitName("player")
        if type(name) == "string" and name ~= "" then return name end
    end
    return "0"
end

function Adapter:GetNumAddOns()
    return type(GetNumAddOns) == "function" and (GetNumAddOns() or 0) or 0
end

function Adapter:GetAddOnName(index)
    if type(GetAddOnInfo) ~= "function" then return nil end
    return GetAddOnInfo(index)
end

function Adapter:GetAddOnEnableState(name, guid)
    if type(GetAddOnEnableState) ~= "function" then return 0 end
    return GetAddOnEnableState(name, guid) or 0
end

function Adapter:EnableAddOn(name, guid)
    return type(EnableAddOn) == "function" and EnableAddOn(name, guid) or false
end

function Adapter:DisableAddOn(name, guid)
    return type(DisableAddOn) == "function" and DisableAddOn(name, guid) or false
end

function Adapter:IsAddonLoaded(name)
    return type(IsAddOnLoaded) == "function" and IsAddOnLoaded(name) and true or false
end

function Adapter:IsAddonInstalled(name)
    local index
    for index = 1, self:GetNumAddOns() do
        if self:GetAddOnName(index) == name then return true end
    end
    return false
end

function Adapter:GetLegacyAddonProfileDB()
    local setup = _G.RurutiaSuiteSetupDB
    return type(setup) == "table" and setup.addonProfile or nil
end

function Adapter:Now()
    return type(_G.time) == "function" and _G.time() or 0
end

function Adapter:Random(minimum, maximum)
    return math.random(minimum, maximum)
end

-- AddonProfile owns its copy/paste format. This compact length-prefixed codec
-- only accepts the primitive values used by profile data and never executes
-- imported text.
function Adapter:EncodePayload(data, prefix)
    return ns.ShareCodec:EncodePayload(data, prefix)
end

function Adapter:DecodePayload(text, prefix)
    return ns.ShareCodec:DecodePayload(text, prefix)
end

function Adapter:PromptReload(anchorFrame)
    if self:IsInCombat() then return false end
    if type(_G.StaticPopupDialogs) ~= "table" or type(_G.StaticPopup_Show) ~= "function" then return false end
    local key = "RURUTIASUITE_ADDON_PROFILE_RELOAD"
    if not _G.StaticPopupDialogs[key] then
        _G.StaticPopupDialogs[key] = {
            text = "插件方案已应用，重载界面后生效。\n\n是否立即重载？",
            button1 = "立即重载", button2 = "稍后",
            OnAccept = function()
                if Adapter:IsInCombat() then return end
                local reload = _G.C_UI and _G.C_UI.Reload or _G.ReloadUI
                if type(reload) == "function" then reload() end
            end,
            OnShow = function(frame, data)
                local anchor = data or frame.data
                frame:SetFrameStrata("TOOLTIP")
                frame:ClearAllPoints()
                if anchor and anchor.IsShown and anchor:IsShown() then
                    frame:SetPoint("TOP", anchor, "BOTTOM", 0, -12)
                else
                    frame:SetPoint("CENTER", _G.UIParent, "CENTER", 0, 50)
                end
            end,
            timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
        }
    end
    return _G.StaticPopup_Show(key, nil, nil, anchorFrame) ~= nil
end

ns.AddonProfileAdapter = Adapter
ns.AddonProfileRetailAdapter = Adapter
