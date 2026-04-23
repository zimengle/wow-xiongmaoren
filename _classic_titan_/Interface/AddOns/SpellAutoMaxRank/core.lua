local NUM_ACTIONBAR_BUTTONS = NUM_ACTIONBAR_BUTTONS or 12
local NUM_ACTIONBAR_PAGES = NUM_ACTIONBAR_PAGES or 6
local BOOKTYPE_SPELL = BOOKTYPE_SPELL or (Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player) or "spell"
local SPELLBOOK_BANK_PLAYER = Enum and Enum.SpellBookSpellBank and Enum.SpellBookSpellBank.Player or BOOKTYPE_SPELL

local GetSpellInfo = GetSpellInfo or function(spellID)
    if not spellID or not C_Spell or not C_Spell.GetSpellInfo then
        return nil
    end
    local info = C_Spell.GetSpellInfo(spellID)
    if info then
        return info.name, nil, info.iconID, info.castTime, info.minRange, info.maxRange, info.spellID, info.originalIconID
    end
end

local GetNumSpellTabs = GetNumSpellTabs or function()
    if C_SpellBook and C_SpellBook.GetNumSpellBookSkillLines then
        return C_SpellBook.GetNumSpellBookSkillLines()
    end
    return 0
end

local GetSpellTabInfo = GetSpellTabInfo or function(tabIndex)
    if not C_SpellBook or not C_SpellBook.GetSpellBookSkillLineInfo then
        return nil
    end
    local info = C_SpellBook.GetSpellBookSkillLineInfo(tabIndex)
    if info then
        return info.name, info.iconID, info.itemIndexOffset, info.numSpellBookItems, info.isGuild, info.offSpecID
    end
end

local GetSpellBookItemName = GetSpellBookItemName or function(index, spellBank)
    if C_SpellBook and C_SpellBook.GetSpellBookItemName then
        return C_SpellBook.GetSpellBookItemName(index, spellBank)
    end
end

local GetSpellBookItemInfo = GetSpellBookItemInfo or function(index, spellBank)
    if C_SpellBook and C_SpellBook.GetSpellBookItemInfo then
        local info = C_SpellBook.GetSpellBookItemInfo(index, spellBank)
        if info then
            return info.itemType, info.spellID
        end
    end
end

local GetSpellBookItemLink = GetSpellLink or function(index, spellBank)
    if C_SpellBook and C_SpellBook.GetSpellBookItemLink then
        return C_SpellBook.GetSpellBookItemLink(index, spellBank)
    end
end

local PickupSpellBookItem = PickupSpellBookItem or function(index, spellBank)
    if C_SpellBook and C_SpellBook.PickupSpellBookItem then
        return C_SpellBook.PickupSpellBookItem(index, spellBank)
    end
end

local IS_DEBUG = false

local function Msg(msg)
    -- 静默运行：不向聊天框打印任何信息（包含普通提示与调试信息）
end

local function DebugMsg(msg)
    -- 静默运行：即使开启调试也不打印
end

local function GetSpellIDFromIndex(index)
    local _, spellID = GetSpellBookItemInfo(index, SPELLBOOK_BANK_PLAYER)
    if spellID then
        return spellID
    end

    local link = GetSpellBookItemLink(index, SPELLBOOK_BANK_PLAYER)
    if not link then
        return nil
    end

    local id = link:match("spell:(%d+)")
    return tonumber(id)
end

local function GetMaxRankInfo(targetName)
    local bestIndex, bestID = nil, nil
    for tabIndex = 1, GetNumSpellTabs() do
        local _, _, offset, numSpells = GetSpellTabInfo(tabIndex)
        offset = offset or 0
        numSpells = numSpells or 0

        for spellIndex = 1, numSpells do
            local spellBookIndex = spellIndex + offset
            local name = GetSpellBookItemName(spellBookIndex, SPELLBOOK_BANK_PLAYER)
            if name == targetName then
                local id = GetSpellIDFromIndex(spellBookIndex)
                if id then
                    bestIndex = spellBookIndex
                    bestID = id
                end
            end
        end
    end
    return bestIndex, bestID
end

local function UpdateActionSlot(bar, slot, bookIndex)
    local globalSlot = slot + (NUM_ACTIONBAR_BUTTONS * (bar - 1))
    ClearCursor()
    PickupSpellBookItem(bookIndex, SPELLBOOK_BANK_PLAYER)
    if GetCursorInfo() == "spell" then
        PlaceAction(globalSlot)
        ClearCursor()
        return true
    end
    ClearCursor()
    return false
end

local function CheckActionBarSpellsAll(isAuto)
    local updateList = {}

    DebugMsg("正在扫描动作条...")

    for bar = 1, NUM_ACTIONBAR_PAGES do
        for slot = 1, NUM_ACTIONBAR_BUTTONS do
            local globalSlot = slot + (NUM_ACTIONBAR_BUTTONS * (bar - 1))
            local actionType, currentActionID = GetActionInfo(globalSlot)

            if actionType == "spell" and currentActionID then
                local spellName = GetSpellInfo(currentActionID)
                if spellName then
                    local maxIndex, maxID = GetMaxRankInfo(spellName)
                    if maxID and maxID ~= currentActionID and maxIndex then
                        if UpdateActionSlot(bar, slot, maxIndex) then
                            local _, subName = GetSpellBookItemName(maxIndex, SPELLBOOK_BANK_PLAYER)
                            local rankText = ""
                            local hasRank = false

                            if subName and subName ~= "" then
                                rankText = "(" .. subName .. ")"
                                hasRank = true
                            end

                            local fullDestName = spellName .. rankText

                            table.insert(updateList, {
                                name = spellName,
                                full = fullDestName,
                                hasRank = hasRank,
                            })
                        end
                    end
                end
            end
        end
    end

    local count = #updateList

    if count > 0 then
        for _, info in ipairs(updateList) do
            if isAuto then
                if info.hasRank then
                    Msg("学习新法术 " .. info.full .. " 后，已将动作条上的 " .. info.name .. " 更新为 " .. info.full)
                else
                    Msg("学习新法术 " .. info.name .. " 后，已将动作条上的同名法术更新为当前最高等级")
                end
            else
                if info.hasRank then
                    DebugMsg("成功更新法术：" .. info.name .. " -> " .. info.full)
                else
                    DebugMsg("成功更新法术：已将 " .. info.name .. " 替换为当前最高等级")
                end
            end
        end

        Msg("本次共更新了 " .. count .. " 个法术。")
    else
        DebugMsg("扫描完成，动作条上的法术已经是当前最高等级。")
    end
end

local function SkinButton(btn)
    if btn.isSkinned then
        return
    end

    if _G.NDui then
        local B = unpack(_G.NDui)
        if B and B.ReskinButton then
            B.ReskinButton(btn)
            btn.isSkinned = true
            return
        elseif B and B.Reskin then
            B.Reskin(btn)
            btn.isSkinned = true
            return
        end
    end

    if _G.ElvUI then
        local E = _G.ElvUI[1]
        if E and E.Skins and E.Skins.HandleButton then
            E.Skins:HandleButton(btn)
            btn.isSkinned = true
            return
        end
    end
end

local function CreateOrUpdateMenuButton()
    if not SpellBookFrame then
        return
    end

    local btn = _G["SpellAutoMaxRankButton"]

    if not btn then
        btn = CreateFrame("Button", "SpellAutoMaxRankButton", SpellBookFrame, "UIPanelButtonTemplate")
        btn:SetText("更新最高等级")
        btn:SetWidth(100)
        btn:SetHeight(22)
        btn:SetScript("OnClick", function()
            if InCombatLockdown() then
                Msg("战斗中无法更新。")
            else
                CheckActionBarSpellsAll(false)
            end
        end)
    end

    SkinButton(btn)

    btn:SetFrameStrata("DIALOG")
    btn:SetFrameLevel(9999)
    btn:ClearAllPoints()

    if _G.ElvUI then
        btn:SetPoint("TOPRIGHT", SpellBookFrame, "TOPRIGHT", -63, -18)
    else
        btn:SetPoint("TOPRIGHT", SpellBookFrame, "TOPRIGHT", -40, -40)
    end

    btn:Show()
end

local function Initialize()
    SLASH_MRANK1 = "/mrank"
    SlashCmdList["MRANK"] = function(msg)
        if msg == "debug" then
            IS_DEBUG = not IS_DEBUG
            if IS_DEBUG then
                Msg("调试模式已开启。")
            else
                Msg("调试模式已关闭。")
            end
        else
            CreateOrUpdateMenuButton()
            CheckActionBarSpellsAll(false)
        end
    end

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("SPELLS_CHANGED")
    eventFrame:SetScript("OnEvent", function()
        if not InCombatLockdown() then
            C_Timer.After(0.5, function()
                CheckActionBarSpellsAll(true)
            end)
        end
    end)

    if SpellBookFrame then
        SpellBookFrame:HookScript("OnShow", CreateOrUpdateMenuButton)
    else
        local loader = CreateFrame("Frame")
        loader:RegisterEvent("ADDON_LOADED")
        loader:SetScript("OnEvent", function(self, _, arg1)
            if arg1 == "Blizzard_SpellBook" and SpellBookFrame then
                SpellBookFrame:HookScript("OnShow", CreateOrUpdateMenuButton)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

    DebugMsg("插件已成功加载。")
end

Initialize()
