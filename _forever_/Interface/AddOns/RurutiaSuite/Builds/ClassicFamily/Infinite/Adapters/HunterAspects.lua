local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end
local Adapter = {}
-- Original owner WA order; presence in this catalogue never means learned.
local IDS = {61847, 13165, 34074, 20043, 13163, 5118, 13159, 13161}
local TRACKING_IDS = {1494, 19883, 19884, 19885, 19880, 19878, 19882, 19879}
local TRACKING_BY_ID = {}
for _, id in ipairs(TRACKING_IDS) do TRACKING_BY_ID[id] = true end
Adapter.TRACKING_IDS = TRACKING_IDS
local TRACKING_TOOLTIP_ANCHORS = {RIGHT = "ANCHOR_LEFT", LEFT = "ANCHOR_RIGHT",
    UP = "ANCHOR_BOTTOMRIGHT", DOWN = "ANCHOR_TOPRIGHT"}
local function Readable(v) return not (issecretvalue and issecretvalue(v)) end
local function Name(id)
    local query = C_Spell and C_Spell.GetSpellName or GetSpellInfo
    if not query then return end
    local ok, name = pcall(query, id)
    if ok and Readable(name) and type(name) == "string" and name ~= "" then return name end
end
local function Known(id)
    for _, query in ipairs({IsPlayerSpell or false, IsSpellKnown or false}) do
        if type(query) == "function" then
            local ok, value = pcall(query, id)
            if ok and Readable(value) and value == true then return true end
        end
    end
    return false
end
local function Level(id)
    local query = C_Spell and C_Spell.GetSpellLevelLearned
    if query then
        local ok, value = pcall(query, id)
        if ok and Readable(value) and type(value) == "number" then return value end
    end
    return 0
end
function Adapter:IsHunter() local _, class = UnitClass("player"); return class == "HUNTER" end
function Adapter:InCombat()
    if InCombatLockdown() then return true end
    if type(UnitAffectingCombat) == "function" then
        local ok, combat = pcall(UnitAffectingCombat, "player")
        if ok and Readable(combat) and combat == true then return true end
    end
    return false
end
function Adapter:IsReadable(v) return Readable(v) end
function Adapter:SpellName(id)
    if not Readable(id) or type(id) ~= "number" then return end
    return Name(id)
end
function Adapter:AurasRestricted(spellID)
    local secrets = C_Secrets
    if not secrets then return false end
    if type(secrets.ShouldAurasBeSecret) == "function" then
        local ok, secret = pcall(secrets.ShouldAurasBeSecret)
        if not ok or not Readable(secret) or secret ~= false then return true end
    end
    if spellID and type(secrets.ShouldSpellAuraBeSecret) == "function" then
        local ok, secret = pcall(secrets.ShouldSpellAuraBeSecret, spellID)
        if not ok or not Readable(secret) or secret ~= false then return true end
    end
    return false
end
function Adapter:Learned()
    local candidates, byName = {}, {}
    for _, id in ipairs(IDS) do
        local name = Name(id)
        if name then
            local row = {id = id, name = name}
            candidates[#candidates + 1], byName[name] = row, row
            row.known, row.level = Known(id), Level(id)
        end
    end
    -- Name matching finds learned higher ranks even when the base rank is replaced.
    local book, bank = C_SpellBook, Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player
    if book and bank and book.GetNumSpellBookSkillLines and book.GetSpellBookSkillLineInfo
        and book.GetSpellBookItemInfo then
        for line = 1, book.GetNumSpellBookSkillLines() do
            local info = book.GetSpellBookSkillLineInfo(line)
            if info and Readable(info) and Readable(info.shouldHide) and not info.shouldHide
                and Readable(info.itemIndexOffset) and type(info.itemIndexOffset) == "number"
                and Readable(info.numSpellBookItems) and type(info.numSpellBookItems) == "number" then
                for slot = info.itemIndexOffset + 1, info.itemIndexOffset + info.numSpellBookItems do
                    local spell = book.GetSpellBookItemInfo(slot, bank)
                    local future = Enum.SpellBookItemType and Enum.SpellBookItemType.FutureSpell
                    if spell and Readable(spell) and Readable(spell.name) and Readable(spell.spellID)
                        and type(spell.spellID) == "number" and Readable(spell.isOffSpec)
                        and Readable(spell.future) and Readable(spell.itemType)
                        and not spell.isOffSpec and not spell.future and (not future or spell.itemType ~= future) then
                        local row = byName[spell.name]
                        if row then
                            local level = Level(spell.spellID)
                            if not row.known or level > row.level or (level == row.level and spell.spellID > row.id) then
                                row.id, row.level = spell.spellID, level
                            end
                            row.known = true
                        end
                    end
                end
            end
        end
    end
    local result = {}
    for _, row in ipairs(candidates) do
        if row.known then
            row.icon = C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(row.id)
            result[#result + 1] = row
        end
    end
    return result
end
function Adapter:Active(name, spellID)
    if self:AurasRestricted(spellID) then return nil end
    local query = C_UnitAuras and C_UnitAuras.GetAuraDataBySpellName
    if not query then return nil end
    local ok, aura = pcall(query, "player", name, "HELPFUL|PLAYER")
    if not ok or not Readable(aura) then return nil end
    return aura ~= nil
end
function Adapter:Configure(button, name)
    ns.Compat.RegisterPrimarySecureClicks(button)
    button:SetAttribute("type1", "spell")
    -- Localized name lets the client choose the learned rank; no insecure cast.
    button:SetAttribute("spell1", name)
end
function Adapter:TrackingCatalog()
    local rows = {}
    local texture = C_Spell and C_Spell.GetSpellTexture
    for i, id in ipairs(TRACKING_IDS) do
        local name, icon = Name(id), texture and texture(id)
        rows[i] = {id = id, name = name, icon = Readable(icon) and icon or nil, known = Known(id)}
    end
    return rows
end
local function ReadTrackingInfo(query, index)
    local name, _, active, _, _, spellID = query(index)
    if Readable(name) and type(name) == "table" then
        return name.name, name.active, name.spellID
    end
    return name, active, spellID
end
function Adapter:ReadActiveTracking()
    local minimap = C_Minimap
    if not minimap or not minimap.GetNumTrackingTypes or not minimap.GetTrackingInfo then
        return nil, "unknown"
    end
    local ok, count = pcall(minimap.GetNumTrackingTypes)
    if not ok or not Readable(count) or type(count) ~= "number" or count < 0 or count % 1 ~= 0 then
        return nil, "unknown"
    end
    local activeByID, activeByName
    for i = 1, count do
        local read, name, active, spellID = pcall(ReadTrackingInfo, minimap.GetTrackingInfo, i)
        if not read or not Readable(name) or not Readable(active) or not Readable(spellID)
            or (name ~= nil and type(name) ~= "string")
            or (active ~= true and active ~= false and active ~= 1 and active ~= 0)
            or (spellID ~= nil and (type(spellID) ~= "number" or spellID % 1 ~= 0))
            or (name == nil and spellID == nil) then
            return nil, "unknown"
        end
        if active == true or active == 1 then
            if spellID ~= nil then
                if TRACKING_BY_ID[spellID] then activeByID = activeByID or spellID end
            elseif name and not activeByName then
                for _, id in ipairs(TRACKING_IDS) do
                    if Name(id) == name then activeByName = id; break end
                end
            end
        end
    end
    return activeByID or activeByName, "known"
end
function Adapter:CancelHunterTracking()
    local minimap = C_Minimap
    if not minimap or not minimap.GetNumTrackingTypes or not minimap.GetTrackingInfo or not minimap.SetTracking then
        return false
    end
    local ok, count = pcall(minimap.GetNumTrackingTypes)
    if not ok or not Readable(count) or type(count) ~= "number" or count < 0 or count % 1 ~= 0 then
        return false
    end
    local cancelled = false
    for i = 1, count do
        local read, name, active, spellID = pcall(ReadTrackingInfo, minimap.GetTrackingInfo, i)
        if read and Readable(name) and Readable(active) and Readable(spellID)
            and (active == true or active == 1) then
            local matched = spellID ~= nil and TRACKING_BY_ID[spellID]
            if not matched and type(name) == "string" then
                for _, id in ipairs(TRACKING_IDS) do
                    if Name(id) == name then matched = true; break end
                end
            end
            if matched then
                local setOK = pcall(minimap.SetTracking, i, false)
                if setOK then cancelled = true end
            end
        end
    end
    return cancelled
end
function Adapter:SetSecureFrameRef(frame, name, ref)
    if type(SecureHandlerSetFrameRef) == "function" then return SecureHandlerSetFrameRef(frame, name, ref) end
    if type(frame.SetFrameRef) == "function" then return frame:SetFrameRef(name, ref) end
    frame.__rsSecureFrameRefs = frame.__rsSecureFrameRefs or {}
    frame.__rsSecureFrameRefs[name] = ref
end
function Adapter:WrapSecureScript(frame, script, preBody, postBody, header)
    header = header or frame
    if type(SecureHandlerWrapScript) == "function" then
        return SecureHandlerWrapScript(frame, script, header, preBody, postBody)
    end
    if type(header.WrapScript) == "function" then return header:WrapScript(frame, script, preBody, postBody) end
    frame.__rsSecureWrappers = frame.__rsSecureWrappers or {}
    frame.__rsSecureWrappers[script] = {header = header, preBody = preBody, postBody = postBody}
end
function Adapter:Preview()
    local rows = {}
    -- Eagle first for the visual sample; keep the live learned order unchanged.
    for _, id in ipairs({13165, 61847, 34074, 20043, 13163, 5118, 13159, 13161}) do
        local name = Name(id)
        if name then rows[#rows + 1] = {id = id, name = name,
            icon = C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(id)} end
    end
    return rows
end
function Adapter:Tooltip(button, row, preview)
    if not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetSpellByID(row.id)
    GameTooltip:AddLine(preview and "预览技能，不施放" or "左键切换守护", 1, 1, 1)
    GameTooltip:Show()
end
function Adapter:TrackingTooltip(button, row, preview, isMain, statusText)
    if not GameTooltip or not row then return end
    local anchor = isMain and TRACKING_TOOLTIP_ANCHORS[button.trackingMenuDirection]
    GameTooltip:SetOwner(button, anchor or "ANCHOR_RIGHT")
    if isMain or row.cancel then GameTooltip:SetText(row.name or "猎人追踪")
    else GameTooltip:SetSpellByID(row.id) end
    if statusText then GameTooltip:AddLine(statusText, 1, 1, 1) end
    local hint
    if row.cancel then
        hint = preview and "预览取消追踪" or "左键关闭当前猎人追踪"
    else
        hint = preview and "预览追踪" or (isMain and "划过或点击展开追踪" or "左键切换追踪")
    end
    GameTooltip:AddLine(hint, 1, 1, 1)
    GameTooltip:Show()
end
function Adapter:HideTooltip() if GameTooltip then GameTooltip:Hide() end end
ns.HunterAspectsAdapter = Adapter
