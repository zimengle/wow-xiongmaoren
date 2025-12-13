local NUM_ACTIONBAR_BUTTONS = NUM_ACTIONBAR_BUTTONS or 12
local NUM_ACTIONBAR_PAGES = NUM_ACTIONBAR_PAGES or 6
local BOOKTYPE_SPELL = BOOKTYPE_SPELL or "spell"

-- 默认关闭调试模式
local IS_DEBUG = false

-- 普通消息 (Public - 仅显示重要信息)
local function Msg(msg)
    print("|cff00ff00[法术等级助手]|r " .. tostring(msg))
end

-- 调试消息 (Hidden - 仅在 IS_DEBUG 为 true 时显示)
local function DebugMsg(msg)
    if IS_DEBUG then
        print("|cff00ffff[法术助手调试]|r " .. tostring(msg))
    end
end

local function GetSpellIDFromIndex(index)
    local link = GetSpellLink(index, BOOKTYPE_SPELL)
    if not link then return nil end
    local id = link:match("spell:(%d+)")
    return tonumber(id)
end

local function GetMaxRankInfo(targetName)
    local bestIndex, bestID = nil, nil
    for tabIndex = 1, GetNumSpellTabs() do
        local _, _, offset, numSpells = GetSpellTabInfo(tabIndex)
        for spellIndex = 1, numSpells do
            local spellBookIndex = spellIndex + offset
            local name = GetSpellBookItemName(spellBookIndex, BOOKTYPE_SPELL)
            if name == targetName then
                local id = GetSpellIDFromIndex(spellBookIndex)
                if id then bestIndex = spellBookIndex; bestID = id end
            end
        end
    end
    return bestIndex, bestID
end

local function UpdateActionSlot(bar, slot, bookIndex)
    local globalSlot = slot + (NUM_ACTIONBAR_BUTTONS * (bar - 1))
    ClearCursor()
    PickupSpellBookItem(bookIndex, BOOKTYPE_SPELL)
    if GetCursorInfo() == "spell" then
        PlaceAction(globalSlot)
        ClearCursor()
        return true
    end
    ClearCursor()
    return false
end

-- isAuto: true(自动触发), false(手动点击)
local function CheckActionBarSpellsAll(isAuto)
    local updateList = {} 
    
    -- [Debug] 扫描过程移入 Debug
    DebugMsg("正在扫描动作条...")
    
    for bar = 1, NUM_ACTIONBAR_PAGES do 
        for slot = 1, NUM_ACTIONBAR_BUTTONS do 
            local globalSlot = slot + (NUM_ACTIONBAR_BUTTONS * (bar - 1))
            local actionType, currentActionID = GetActionInfo(globalSlot) 
            
            if actionType == "spell" and currentActionID then
                local spellName = GetSpellInfo(currentActionID)
                if spellName then
                    local maxIndex, maxID = GetMaxRankInfo(spellName)
                    if maxID and maxID ~= currentActionID then
                        if UpdateActionSlot(bar, slot, maxIndex) then 
                            local _, subName = GetSpellBookItemName(maxIndex, BOOKTYPE_SPELL)
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
                                hasRank = hasRank
                            })
                        end
                    end
                end
            end
        end
    end
    
    local count = #updateList
    
    if count > 0 then
        -- 有更新发生时
        for _, info in ipairs(updateList) do
            if isAuto then
                -- [Public] 自动更新：保留详细播报
                if info.hasRank then
                    Msg("学习新技能 " .. info.full .. "，已更新技能 " .. info.name .. " 为 " .. info.full)
                else
                    Msg("学习新技能 " .. info.name .. "，已将技能 " .. info.name .. " 替换为当前最高级")
                end
            else
                -- [Debug] 手动更新：详细播报移入 Debug，普通模式不显示
                if info.hasRank then
                    DebugMsg("成功更新技能：" .. info.name .. " 为 " .. info.full)
                else
                    DebugMsg("成功更新技能：已将 " .. info.name .. " 替换为当前最高级")
                end
            end
        end
        
        -- [Public] 汇总信息：始终显示
        Msg("本次一共替换了 " .. count .. " 个技能。")
    else 
        -- [Debug] 没有更新发生：移入 Debug，普通模式静默
        DebugMsg("扫描完成，动作条上的技能已经是最高等级。") 
    end
end

local function SkinButton(btn)
    if btn.isSkinned then return end

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
    if not SpellBookFrame then return end

    local btn = _G["SpellAutoMaxRankButton"]
    
    if not btn then
        btn = CreateFrame("Button", "SpellAutoMaxRankButton", SpellBookFrame, "UIPanelButtonTemplate")
        btn:SetText("更新最高级")
        btn:SetWidth(100)
        btn:SetHeight(22)
        btn:SetScript("OnClick", function()
            if InCombatLockdown() then 
                Msg("战斗中无法更新。") -- [Public] 错误警告
            else 
                CheckActionBarSpellsAll(false) 
            end
        end)
    end

    SkinButton(btn)

    btn:SetFrameStrata("DIALOG") 
    btn:SetFrameLevel(9999) 
    
    btn:ClearAllPoints()
    
    -- [UI 坐标]
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
    eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
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
        loader:SetScript("OnEvent", function(self, event, arg1)
            if arg1 == "Blizzard_SpellBook" and SpellBookFrame then
                SpellBookFrame:HookScript("OnShow", CreateOrUpdateMenuButton)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
    
    -- [Debug] 载入信息移入 Debug
    DebugMsg("插件已成功载入。")
end

Initialize()