local _, ns = ...
if not (ns.Build and ns.Build.HasModule("EllesmereCompat")) then return end

-- Chat input styling is shared; nameplate hooks remain Retail-only.
local retailNameplates = ns.Build.Is("retail") and ns.Build.GetInterfaceVersion() >= 120000

local chatInputBackgrounds = {}
local friendlyOutlineWriteGuard = false
local FOLLOWER_FRIENDLY_VISIBILITY_COMPAT_ENABLED = false

local function IsAddOnLoaded(name)
    return ns.Compat.IsAddOnLoaded(name)
end

local function GetNameplateProfile()
    local provider = _G.EllesmereNameplates_NS
    local database = provider and provider.db
    return provider, database and database.profile
end

local function IsFriendlyNameOnly()
    local _, profile = GetNameplateProfile()
    return profile ~= nil
        and profile.showFriendlyPlayers ~= false
        and profile.friendlyNameOnly ~= false
end

local function IsInFollowerDungeon()
    local lfg = _G.C_LFGInfo
    if lfg and type(lfg.IsInLFGFollowerDungeon) == "function"
        and lfg.IsInLFGFollowerDungeon() then
        return true
    end
    if type(_G.GetInstanceInfo) == "function" then
        local _, _, difficultyID = _G.GetInstanceInfo()
        return difficultyID == 208
    end
    return false
end

local function SetupChatInputBackground(module)
    if not IsAddOnLoaded("EllesmereUIChat") then return end
    local registry = _G.EventRegistry
    if not registry or type(registry.RegisterCallback) ~= "function"
        or type(registry.UnregisterCallback) ~= "function" then return end
    local function Sync(_, editBox)
        if not editBox or type(editBox.CreateTexture) ~= "function" then return end
        local background = chatInputBackgrounds[editBox]
        if not background then
            background = editBox:CreateTexture(nil, "BACKGROUND", nil, -8)
            background:SetAllPoints(editBox)
            background:SetColorTexture(0, 0, 0, 0.65)
            chatInputBackgrounds[editBox] = background
        end
        if editBox:IsShown() and editBox:HasFocus() then background:Show()
        else background:Hide() end
    end
    local function Hide(_, editBox)
        local background = chatInputBackgrounds[editBox]
        if background then background:Hide() end
    end
    local callbacks = {
        ["ChatFrame.OnEditBoxFocusGained"] = Sync,
        ["ChatFrame.OnEditBoxShow"] = Sync,
        ["ChatFrame.OnEditBoxFocusLost"] = Hide,
        ["ChatFrame.OnEditBoxHide"] = Hide,
    }
    -- EventRegistry dispatch isolates native chat execution; no EditBox script hooks.
    -- OwnQueue supplies lifecycle cleanup only, with no scheduled work.
    module:OwnQueue("chat-input-background", function()
        for event in pairs(callbacks) do registry:UnregisterCallback(event, module) end
    end, function() return 0 end, "chat input callbacks")
    for event, callback in pairs(callbacks) do registry:RegisterCallback(event, callback, module) end
    local chat = _G.ChatFrameUtil
    local active = chat and chat.GetActiveWindow and chat.GetActiveWindow()
    Sync(module, active or _G.ChatFrame1EditBox)
end

local function ApplyFriendlyNameOutline(fontObject)
    if friendlyOutlineWriteGuard or fontObject == nil or not IsFriendlyNameOnly() then
        return
    end
    local provider = GetNameplateProfile()
    local desiredFlags
    if provider and type(provider.GetNPOutline) == "function" then
        desiredFlags = provider.GetNPOutline()
    end
    if desiredFlags == nil then
        local ellesmere = _G.EllesmereUI
        if ellesmere and type(ellesmere.GetFontOutlineFlag) == "function" then
            desiredFlags = ellesmere.GetFontOutlineFlag("nameplates")
        end
    end
    if type(desiredFlags) ~= "string" or desiredFlags == "" then
        return
    end
    local fontFile, fontHeight, currentFlags = fontObject:GetFont()
    if not fontFile or not fontHeight or currentFlags == desiredFlags then
        return
    end
    friendlyOutlineWriteGuard = true
    fontObject:SetFont(fontFile, fontHeight, desiredFlags)
    friendlyOutlineWriteGuard = false
end

local function EnsureFollowerFriendlyVisibility()
    if not IsInFollowerDungeon() or not IsFriendlyNameOnly() then
        return
    end
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return
    end
    local provider = GetNameplateProfile()
    if provider and type(provider.ForceFriendlyPlayerCVarsOn) == "function" then
        provider.ForceFriendlyPlayerCVarsOn()
    end
end

local Definition = {}

function Definition:SetupFriendlyNameOutline()
    if not IsAddOnLoaded("EllesmereUINameplates") then
        return
    end
    local fontObjects = {
        _G.SystemFont_NamePlate,
        _G.SystemFont_NamePlate_Outlined,
    }
    local index
    for index = 1, #fontObjects do
        local fontObject = fontObjects[index]
        if fontObject and type(fontObject.GetFont) == "function" and type(fontObject.SetFont) == "function" then
            self:HookSecureFunction(fontObject, "SetFont", function(_, changedFont)
                ApplyFriendlyNameOutline(changedFont)
            end, "EllesmereNameplateFont")
            ApplyFriendlyNameOutline(fontObject)
        end
    end
    local provider = GetNameplateProfile()
    if provider and type(provider.RefreshFriendlyNameSize) == "function" then
        self:HookSecureFunction(provider, "RefreshFriendlyNameSize", function()
            ApplyFriendlyNameOutline(_G.SystemFont_NamePlate)
            ApplyFriendlyNameOutline(_G.SystemFont_NamePlate_Outlined)
        end, "EllesmereFriendlyNameSize")
    end
end

function Definition:SetupFollowerFriendlyVisibility()
    local provider = GetNameplateProfile()
    if provider and type(provider.UpdateFriendlyNameplateSystem) == "function" then
        self:HookSecureFunction(provider, "UpdateFriendlyNameplateSystem", EnsureFollowerFriendlyVisibility,
            "EllesmereFriendlySystem")
    end
    EnsureFollowerFriendlyVisibility()
end

function Definition:Enable()
    SetupChatInputBackground(self)
    if not retailNameplates then return end
    self:SetupFriendlyNameOutline()
    if FOLLOWER_FRIENDLY_VISIBILITY_COMPAT_ENABLED then
        self:SetupFollowerFriendlyVisibility()
    end
end

function Definition:Disable()
    for _, background in pairs(chatInputBackgrounds) do background:Hide() end
end

local Adapter = {
    IsAvailable = function()
        return IsAddOnLoaded("EllesmereUIChat") or IsAddOnLoaded("EllesmereUINameplates")
    end,
}

if retailNameplates then
    ns.Integrations:Register("ellesmereui", { build = "retail" }, Adapter)
end
ns.RegisterModule("EllesmereCompat", Definition)
