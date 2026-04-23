local addonName, ST = ...

ST.CastEngine = {
    actionBySlot = {},
}

local function calculateAction(button)
    if not button then
        return nil
    end
    if ActionButton_CalculateAction then
        local ok, action = pcall(ActionButton_CalculateAction, button)
        if ok and action then
            return action
        end
    end
    if button.action then
        return button.action
    end
    if button.GetAttribute then
        return button:GetAttribute("action")
    end
    if button.GetID then
        return button:GetID()
    end
    return nil
end

function ST.CastEngine:InitActionMap()
    if not _G.MultiCastActionButton1 then
        return false
    end
    wipe(self.actionBySlot)
    for buttonIndex = 1, 4 do
        local slot = (SHAMAN_TOTEM_PRIORITIES and SHAMAN_TOTEM_PRIORITIES[buttonIndex]) or buttonIndex
        self.actionBySlot[slot] = {
            [ST.Config.CallSpellIDs.Elements] = calculateAction(_G["MultiCastActionButton" .. buttonIndex]),
            [ST.Config.CallSpellIDs.Ancestors] = calculateAction(_G["MultiCastActionButton" .. (buttonIndex + 4)]),
            [ST.Config.CallSpellIDs.Spirits] = calculateAction(_G["MultiCastActionButton" .. (buttonIndex + 8)]),
        }
    end
    return true
end

function ST.CastEngine:Init()
    self:InitActionMap()
end

local function writeMulticastSpell(action, spellID, usePickup)
    if not action then
        return
    end
    local spellToWrite = spellID or 0
    SetMultiCastSpell(action, spellToWrite)
    if spellToWrite ~= 0 and usePickup and PickupSpell and PlaceAction and ClearCursor then
        PickupSpell(spellID)
        PlaceAction(action)
        ClearCursor()
    end
end

function ST.CastEngine:ApplyPresetToCall(presetIndex, callSpellID, usePickup)
    if ST.IsRestricted and ST:IsRestricted() then
        return false
    end
    if not self:InitActionMap() then
        ST:Print("未找到 MultiCastActionButton，无法写入预设。")
        return false
    end

    if not ST.Presets:GetPreset(presetIndex) then
        return false
    end

    for _, slot in ipairs(ST.Config.ElementOrder) do
        local spellID = ST.Presets:GetSpell(presetIndex, slot) or 0
        local action = self.actionBySlot[slot] and self.actionBySlot[slot][callSpellID]
        if action then
            writeMulticastSpell(action, spellID, usePickup ~= false)
        end
    end
    return true
end

function ST.CastEngine:ApplyPreset(presetIndex, usePickup)
    local callSpellID = ST.Config.CallSpellByPreset[presetIndex]
    return self:ApplyPresetToCall(presetIndex, callSpellID, usePickup ~= false)
end

function ST.CastEngine:ApplyAllPresets(usePickup)
    local okAll = true
    for preset = 1, 3 do
        local ok = self:ApplyPreset(preset, usePickup ~= false)
        if not ok then
            okAll = false
        end
    end
    if okAll and MultiCastActionBarFrame and MultiCastActionBarFrame_OnEvent then
        MultiCastActionBarFrame_OnEvent(MultiCastActionBarFrame, "UPDATE_MULTI_CAST_ACTIONBAR")
    end
    return okAll
end
