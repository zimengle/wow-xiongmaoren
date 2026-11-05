-- 文件职责：按EUI能力适配国服符文候选；第三方列表、声音和受限Aura访问仅在此层。
-- 生命周期：运行时模块拥有Hook订阅；停用恢复仍由本实例持有的包装与文字。
local _, ns = ...
if not ns.Build.IsFamily("retail") then return end
if not ns.Build.SupportsIntegration("ellesmereui") then return end

local Adapter = {}
Adapter.__index = Adapter
local ADDON = "EllesmereUIAuraBuffReminders"
local RUNE_KEY = "consumable:rune"
local BUFF_IDS = { 1295329, 1264426, 453250, 1234969, 1242347, 393438, 347901 }
local ITEMS = { 259085, 274797 }
local ICONS = { 4549099, 3528444 }
local LABELS = { "符文", "符文" }
local RESTRICTIONS = { "Combat", "Encounter", "ChallengeMode", "PvPMatch" }
Adapter.addonName = ADDON

function Adapter:IsSupported()
    -- Support follows the APIs below, not the client patch number.
    return C_AddOns ~= nil and type(C_AddOns.IsAddOnLoaded) == "function"
end

function Adapter:GetProvider()
    if not self:IsSupported() then return nil, "当前客户端或EllesmereUI版本暂未适配。" end
    if not C_AddOns.IsAddOnLoaded(ADDON) then return nil, "需要启用EllesmereUI增益提醒模块。" end
    local eui = _G.EllesmereUI
    local provider = eui and eui.Lite and type(eui.Lite.GetAddon) == "function"
        and eui.Lite.GetAddon(ADDON, true)
    if not (provider and type(provider.HandleAppearSounds) == "function"
        and type(provider.ResolveReminderSound) == "function"
        and type(provider.ConsumablePresenceUnverifiable) == "function"
        and type(provider.ConsumableShows) == "function"
        and type(_G._EABR_RequestRefresh) == "function" and _G._EABR_AceDB
        and type(issecretvalue) == "function"
        and C_RestrictedActions and C_RestrictedActions.GetAddOnRestrictionState
        and Enum and Enum.AddOnRestrictionType and Enum.AddOnRestrictionState
        and C_Secrets and C_Secrets.ShouldSpellAuraBeSecret
        and C_UnitAuras and C_UnitAuras.GetPlayerAuraBySpellID
        and C_Item and C_Item.GetItemCount and C_Item.GetItemIconByID) then
        return nil, "等待EllesmereUI初始化或所需接口就绪。"
    end
    return provider
end

function Adapter:New()
    return setmetatable({ active = true, generation = 0 }, self)
end

function Adapter:CanReadAuras()
    if InCombatLockdown() then return false end
    for _, name in ipairs(RESTRICTIONS) do
        local kind = Enum.AddOnRestrictionType[name]
        if kind == nil then return false end
        local ok, state = pcall(C_RestrictedActions.GetAddOnRestrictionState, kind)
        if not ok or issecretvalue(state) or state ~= Enum.AddOnRestrictionState.Inactive then return false end
    end
    local ok, blocked = pcall(self.provider.ConsumablePresenceUnverifiable)
    return ok and not issecretvalue(blocked) and blocked == false
end

function Adapter:HasRune()
    local unknown = false
    for _, id in ipairs(BUFF_IDS) do
        local ok, secret = pcall(C_Secrets.ShouldSpellAuraBeSecret, id)
        if not ok or issecretvalue(secret) or secret ~= false then
            unknown = true
        else
            local readOK, aura = pcall(C_UnitAuras.GetPlayerAuraBySpellID, id)
            if not readOK or issecretvalue(aura) then unknown = true
            elseif aura ~= nil then
                if type(aura) == "table" then return true end
                unknown = true
            end
        end
    end
    if unknown then return nil end
    return false
end

local function RemoveRunes(missing)
    local insertAt = #missing + 1
    for index = #missing, 1, -1 do
        if missing[index].dismissKey == RUNE_KEY then insertAt = index; table.remove(missing, index) end
    end
    return insertAt
end
function Adapter:ProcessMissing(missing)
    local owner = self.owner
    if not (owner and owner.IsRuneCompatEnabled and owner:IsRuneCompatEnabled()) then return end
    local profile = _G._EABR_AceDB and _G._EABR_AceDB.profile
    local consumables = profile and profile.consumables
    if not (profile and profile.display and profile.display.remindersEnabled ~= false
        and consumables and consumables.enabled and consumables.enabled.augment_rune) then return end
    local inInstance, kind = IsInInstance()
    if kind == "pvp" or kind == "arena" then return end
    if C_Garrison and C_Garrison.IsOnGarrisonMap and C_Garrison.IsOnGarrisonMap() then inInstance = false end
    if not self.provider.ConsumableShows(consumables, "augment_rune", inInstance) or not self:CanReadAuras() then return end
    local hasRune = self:HasRune()
    if hasRune == nil then return end
    if hasRune then RemoveRunes(missing); return end
    local candidates = {}
    for index, itemID in ipairs(ITEMS) do
        local ok, count = pcall(C_Item.GetItemCount, itemID, false, false, false, false)
        if not ok or issecretvalue(count) or type(count) ~= "number" then return end
        if count > 0 or (itemID ~= 274797 and consumables.showWithoutItem ~= false) then
            local iconOK, icon = pcall(C_Item.GetItemIconByID, itemID)
            if not iconOK or issecretvalue(icon) then return end
            local entry = self.entries[index]
            entry.itemID, entry.label = itemID, LABELS[index]
            entry.texture, entry.bagCount, entry.desaturated = icon or ICONS[index], count, count == 0
            candidates[#candidates + 1] = entry
        end
    end
    local insertAt = RemoveRunes(missing)
    for _, entry in ipairs(candidates) do table.insert(missing, insertAt, entry); insertAt = insertAt + 1 end
end

function Adapter:RequestRefresh()
    if self.provider and type(_G._EABR_RequestRefresh) == "function" then _G._EABR_RequestRefresh() end
end

function Adapter:InstallBeaconLabels(provider)
    local owner = self.owner
    if not owner or type(provider.ApplyIconBorder) ~= "function" then return end
    if self.beaconProvider == provider then return end
    self.beaconLabels = self.beaconLabels or setmetatable({}, {__mode = "k"})
    local function Attach(frame)
        if not self.active then return end
        local id = frame._spellID
        if issecretvalue(id) or (id ~= 53563 and id ~= 156910) then return end
        -- EUI applies the border BEFORE creating _text. Observe first show
        -- even when the label does not exist yet; no polling is needed.
        owner:HookFrameScript(frame, "OnShow", function(_, shown) Attach(shown) end, "EUI beacon show")
        local label = frame._text
        if not label then return end
        self.beaconLabels[label] = true
        local function Update(_, text, value)
            if self.active and not issecretvalue(value) and value == "Beacon" then text:SetText("道标") end
        end
        owner:HookSecureFunction(label, "SetText", Update, "EUI beacon label")
        Update(owner, label, label:GetText())
    end
    owner:HookSecureFunction(provider, "ApplyIconBorder", function(_, frame) Attach(frame) end, "EUI beacon border")
    self.beaconProvider = provider
    -- Icons may already exist before our deferred startup. Replay EUI's own
    -- bounded border pass once per enable to discover those existing icons.
    if type(provider.ApplyAllIconBorders) == "function" then provider.ApplyAllIconBorders() end
end

function Adapter:Install()
    if not self.active or InCombatLockdown() then return false end
    local provider = self:GetProvider()
    if not provider then return false end
    self.provider = provider
    self:InstallBeaconLabels(provider)
    if provider.HandleAppearSounds ~= self.wrapper or provider.ResolveReminderSound ~= self.soundWrapper then
        self.generation = self.generation + 1
        local generation, original, originalSound = self.generation, provider.HandleAppearSounds, provider.ResolveReminderSound
        self.original, self.originalSound = original, originalSound
        self.entries = {
            { mode = "item", cat = "consumable", dismissKey = RUNE_KEY },
            { mode = "item", cat = "consumable", dismissKey = RUNE_KEY },
        }
        self.soundWrapper = function(key, ...)
            if self.active and generation == self.generation and self.soundPass and key == RUNE_KEY then
                if self.soundRuneSeen then return nil end
                self.soundRuneSeen = true
            end
            return originalSound(key, ...)
        end
        self.wrapper = function(missing, ...)
            if not self.active or generation ~= self.generation then return original(missing, ...) end
            self:ProcessMissing(missing)
            local previousPass, previousSeen = self.soundPass, self.soundRuneSeen
            self.soundPass, self.soundRuneSeen = true, false
            local ok, result = pcall(original, missing, ...)
            self.soundPass, self.soundRuneSeen = previousPass, previousSeen
            if not ok then error(result, 0) end
            return result
        end
        provider.ResolveReminderSound, provider.HandleAppearSounds = self.soundWrapper, self.wrapper
    end
    self:RequestRefresh()
    return true
end

function Adapter:Stop()
    self.active = false
    self.beaconProvider = nil
    for label in pairs(self.beaconLabels or {}) do
        local value = label:GetText()
        if not issecretvalue(value) and value == "道标" then label:SetText("Beacon") end
    end
    self.generation = self.generation + 1
    local provider = self.provider
    if provider and provider.HandleAppearSounds == self.wrapper then provider.HandleAppearSounds = self.original end
    if provider and provider.ResolveReminderSound == self.soundWrapper then provider.ResolveReminderSound = self.originalSound end
    self.entries, self.wrapper, self.soundWrapper = nil, nil, nil
    self.original, self.originalSound = nil, nil
    self:RequestRefresh()
    self.provider = nil
end

ns.EUICNRuneAdapter = Adapter
