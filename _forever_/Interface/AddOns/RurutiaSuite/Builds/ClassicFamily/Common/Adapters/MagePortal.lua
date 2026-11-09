local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Source = ns.MagePortalDataSource
if type(Source) ~= "table" then error("MagePortal Data must load before its adapter", 2) end

local BUILD_KEYS = {
    ["classic-era"] = "era",
    ["classic-infinite"] = "era",
    ["classic-anniversary"] = "tbc",
    ["classic-wrath-legacy"] = "wrath",
    ["classic-titan"] = "wrath",
    ["classic-cata-legacy"] = "cata",
    ["classic-mists"] = "mists",
}

local Adapter = {
    family = "classic",
    dataKey = BUILD_KEYS[ns.Build.GetID()],
    fallbackIcon = "Interface\\Icons\\INV_Misc_QuestionMark",
    layout = {
        anchor = "TOPRIGHT",
        x = -150,
        y = -218,
        direction = "DOWN",
        buttonSize = 34,
        padding = 1,
        maxButtons = 12,
        frameStrata = "MEDIUM",
        frameLevel = 100,
        topFontSize = 12,
        bottomFontSize = 15,
    },
}

if ns.Build.GetID() == "classic-infinite" then
    Adapter.layout.x = -75.7999267578125
    Adapter.layout.y = -207.1998901367188
end

function Adapter:GetPlayerClass()
    if type(_G.UnitClass) ~= "function" then return nil end
    local _, class = _G.UnitClass("player")
    return class
end

local LEGACY_FIELDS = { "spellBarEnabled", "position", "direction", "buttonSize", "padding", "maxButtons" }
local DIRECTIONS = { DOWN = true, UP = true, LEFT = true, RIGHT = true, VERTICAL = true, HORIZONTAL = true }
local function IsValidChoice(key, value)
    if key == "spellBarEnabled" then return type(value) == "boolean" end
    if key == "direction" then return type(value) == "string" and DIRECTIONS[value] == true end
    if key == "position" then
        return type(value) == "table" and type(rawget(value, 1)) == "string"
            and tonumber(rawget(value, 4)) ~= nil and tonumber(rawget(value, 5)) ~= nil
    end
    local number = tonumber(value)
    return number ~= nil and number == number and number ~= math.huge and number ~= -math.huge
        and (key == "padding" and number >= 0 or number > 0)
end

function Adapter:MigrateLegacyProfile(database)
    local target = database and database.profile
    if type(target) ~= "table" or rawget(target, "migratedFromConsumables") then return false end
    -- Defaults are lazy; inspect saved choices before the module sanitizes them.
    for _, key in ipairs(LEGACY_FIELDS) do
        if IsValidChoice(key, rawget(target, key)) then
            -- Persist the decision even when saved defaults compact to an empty profile.
            target.migratedFromConsumables = true
            return false
        end
    end
    local root = database.root
    local namespaces = root and root.namespaces
    local storage = namespaces and namespaces.Consumables
    local profiles = type(storage) == "table" and storage.profiles
    local legacy = type(profiles) == "table" and profiles[database.profileName]
    if type(legacy) ~= "table" then return false end
    local migrated = false
    for _, key in ipairs(LEGACY_FIELDS) do
        local value = rawget(legacy, key)
        if IsValidChoice(key, value) then
            if key == "position" then value = { value[1], nil, value[3], value[4], value[5] } end
            target[key] = value
            migrated = true
        end
    end
    if migrated then target.migratedFromConsumables = true end
    return migrated
end

function Adapter:GetFaction()
    return type(_G.UnitFactionGroup) == "function" and _G.UnitFactionGroup("player") or nil
end

function Adapter:GetSpellIcon(spellID)
    local spellAPI = _G.C_Spell
    if spellAPI and type(spellAPI.GetSpellTexture) == "function" then
        local icon = spellAPI.GetSpellTexture(spellID)
        if icon then return icon end
    end
    if type(_G.GetSpellInfo) == "function" then
        local _, _, icon = _G.GetSpellInfo(spellID)
        return icon
    end
    return nil
end

function Adapter:GetData()
    if not Source:GetRawGroups(self.dataKey) then return nil end
    local faction = self:GetFaction()
    if faction ~= "Horde" and faction ~= "Alliance" then return nil end
    if self.data ~= nil and self.dataFaction == faction then return self.data end
    self.dataFaction = faction
    self.data = Source:Build(self.dataKey, faction, function(spellID)
        return Adapter:GetSpellIcon(spellID)
    end)
    ns.SpellBarData = self.data
    return self.data
end

function Adapter:IsAvailable()
    return type(Source:GetRawGroups(self.dataKey)) == "table"
end

function Adapter:IsReagentFree()
    return Source:IsReagentFree(self.dataKey)
end

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsSpellKnown(spellID)
    if not spellID then return false end
    if type(_G.IsSpellKnown) == "function" then return _G.IsSpellKnown(spellID) and true or false end
    local spellBook = _G.C_SpellBook
    return spellBook and type(spellBook.IsSpellKnown) == "function"
        and spellBook.IsSpellKnown(spellID) and true or false
end

function Adapter:GetItemCount(itemID)
    local getCount = _G.C_Item and _G.C_Item.GetItemCount or _G.GetItemCount
    return type(getCount) == "function" and (getCount(itemID, false) or 0) or 0
end

function Adapter:IsMouseOver(frame)
    return type(_G.MouseIsOver) == "function" and _G.MouseIsOver(frame) and true or false
end

function Adapter:GetRootFrame()
    return _G.UIParent
end

function Adapter:GetTooltip()
    return _G.GameTooltip
end

function Adapter:GetFontPath()
    if ns.Font and type(ns.Font.GetMagePortalFontPath) == "function" then
        return ns.Font:GetMagePortalFontPath()
    end
    if ns.Font and type(ns.Font.GetDefaultFontPath) == "function" then
        return ns.Font:GetDefaultFontPath()
    end
    return "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
end

function Adapter:RegisterSecureClicks(button)
    return ns.Compat and type(ns.Compat.RegisterThreeButtonSecureClicks) == "function"
        and ns.Compat.RegisterThreeButtonSecureClicks(button) or false
end

function Adapter:IsSecureClickRegistrationAvailable()
    return ns.Compat and type(ns.Compat.RegisterThreeButtonSecureClicks) == "function" or false
end

function Adapter:ComputePosition(frame, desiredAnchor)
    local root = self:GetRootFrame()
    if not root then return nil end
    local screenW = type(root.GetWidth) == "function" and root:GetWidth() or nil
    local screenH = type(root.GetHeight) == "function" and root:GetHeight() or nil
    local left = type(frame.GetLeft) == "function" and frame:GetLeft() or nil
    local right = type(frame.GetRight) == "function" and frame:GetRight() or nil
    local top = type(frame.GetTop) == "function" and frame:GetTop() or nil
    local bottom = type(frame.GetBottom) == "function" and frame:GetBottom() or nil
    if not screenW or not screenH or not left or not right or not top or not bottom then return nil end
    local frameScale = type(frame.GetEffectiveScale) == "function" and frame:GetEffectiveScale() or 1
    local rootScale = type(root.GetEffectiveScale) == "function" and root:GetEffectiveScale() or 1
    local ratio = frameScale / rootScale
    left, right, top, bottom = left * ratio, right * ratio, top * ratio, bottom * ratio
    local anchor = desiredAnchor or self.layout.anchor
    if anchor == "TOPLEFT" then return anchor, left, top - screenH end
    if anchor == "TOPRIGHT" then return anchor, right - screenW, top - screenH end
    if anchor == "TOP" then return anchor, (left + right) / 2 - screenW / 2, top - screenH end
    if anchor == "CENTER" then
        return anchor, (left + right) / 2 - screenW / 2, (top + bottom) / 2 - screenH / 2
    end
    return "TOPLEFT", left, top - screenH
end

ns.MagePortalAdapter = Adapter
ns.IsPortalReagentFree = Adapter:IsReagentFree()
