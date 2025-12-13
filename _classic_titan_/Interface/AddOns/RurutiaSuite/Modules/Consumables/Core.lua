-- ============================================================
-- Modules\Consumables\Core.lua
-- [v2.4.3] 坐标初始化逻辑修正版
-- 1. 修复 OnInitialize 硬编码导致 Config 默认坐标失效的问题
-- ============================================================
local addonName, ns = ...
local RS = LibStub("AceAddon-3.0"):GetAddon("RurutiaSuite")
local Module = RS:NewModule("Consumables", "AceEvent-3.0", "AceBucket-3.0", "AceConsole-3.0")

-- 引用配置和数据
local CFG_ROOT = _G.RURUTIA_SUITE_CONFIG
local THEME = CFG_ROOT.theme 
local DataItems = ns.ConsumableData
local DataSpells = ns.SpellBarData

local PRIORITY = { "Test", "Health", "Mana", "Burst", "Utility", "Food" }

-- API 兼容
local GetContainerNumSlots = _G.GetContainerNumSlots or C_Container.GetContainerNumSlots
local GetContainerItemID = _G.GetContainerItemID or C_Container.GetContainerItemID
local GetContainerItemCooldown = _G.GetContainerItemCooldown or C_Container.GetContainerItemCooldown
local GetSpellCooldown = _G.GetSpellCooldown
local GetSpellTexture = _G.GetSpellTexture
local GetSpellInfo = _G.GetSpellInfo
local IsSpellKnown = _G.IsSpellKnown
local UnitFactionGroup = _G.UnitFactionGroup

function Module:OnInitialize()
    -- [关键修正]
    -- 注册数据库时，直接读取 Config.lua 中的 defaultPosition
    -- 这样当 WTF 为空时，生成的初始数据就是 Config 里的设置

    local cBar = CFG_ROOT.consumableBar
    local sBar = CFG_ROOT.spellBar

    local def1 = cBar.defaultPosition or {x=0, y=0}
    local def2 = sBar.defaultPosition or {x=0, y=0}

    self.db = RS.db:RegisterNamespace("Consumables", {
        profile = {
            bar1 = { point = cBar.anchor or "CENTER",   x = def1.x, y = def1.y },
            bar2 = { point = sBar.anchor or "TOPRIGHT", x = def2.x, y = def2.y },
        }
    })

    self.bars = {}

    -- [开关控制] 检查 bar1 是否启用
    if cBar.enabled then
        self:CreateSingleBar(1, CFG_ROOT.consumableBar)
    end

    -- [职业限制 + 开关控制] 检查 bar2 是否启用 + 职业是否匹配
    if sBar.enabled then
        local _, playerClass = UnitClass("player")
        local classRestriction = sBar.classRestriction

        -- 如果没有职业限制，或者玩家职业匹配，则创建 bar2
        if not classRestriction or playerClass == classRestriction then
            self:CreateSingleBar(2, CFG_ROOT.spellBar)
        else
            -- 非法师职业，不创建 bar2
            RS:Print("法术动作条仅限法师职业使用")
        end
    end

    self:RegisterChatCommand("rsm", "HandleSlashCommand")
end

function Module:OnEnable()
    self:RegisterBucketEvent("BAG_UPDATE_DELAYED", 0.5, "UpdateAllBars")
    self:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdateAllBars")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllBars")
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", "UpdateAllCooldowns")
    self:RegisterEvent("SPELL_UPDATE_COOLDOWN", "UpdateAllCooldowns")
    self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN", "UpdateAllCooldowns")
    
    self:UpdateAllBars()
end

function Module:HandleSlashCommand(msg)
    if msg and msg:lower() == "test" then self:TestAnimation() else self:ToggleAnchor() end
end

-- ============================================================
-- 辅助函数
-- ============================================================
function Module:FindItemInBag(targetID)
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        for slot = 1, slots do
            if GetContainerItemID(bag, slot) == targetID then return bag, slot end
        end
    end
    return nil, nil
end

-- ============================================================
-- 创建动作条
-- ============================================================
function Module:CreateSingleBar(id, cfg)
    local f = CreateFrame("Frame", "RS_Bar_"..id, UIParent, "BackdropTemplate")
    f:SetSize(cfg.buttonWidth, cfg.buttonHeight)
    f:SetMovable(true)
    f:SetClampedToScreen(true)

    -- [层级设置] 从 Config 读取层级配置
    if cfg.frameStrata then
        f:SetFrameStrata(cfg.frameStrata)
    end
    if cfg.frameLevel then
        f:SetFrameLevel(cfg.frameLevel)
    end

    -- 1. 获取用户存档 (SavedVariables)
    local savedPos = self.db.profile["bar"..id]

    -- 2. 获取当前 Config 配置的锚点
    local targetAnchor = cfg.anchor or "TOPLEFT"

    -- 3. 获取 Config 配置的默认坐标
    local defX = (cfg.defaultPosition and cfg.defaultPosition.x) or 0
    local defY = (cfg.defaultPosition and cfg.defaultPosition.y) or 0

    -- [逻辑判断]
    -- 如果是全新安装，OnInitialize 已经把 Config 的值写入 savedPos 了，这里会直接匹配成功
    -- 如果用户修改了 Config 的 Anchor 类型（例如从 TOPLEFT 改为 CENTER），这里会不匹配，从而触发 else 重置位置
    if savedPos and savedPos.point == targetAnchor then
        f:SetPoint(targetAnchor, UIParent, targetAnchor, savedPos.x, savedPos.y)
    else
        f:SetPoint(targetAnchor, UIParent, targetAnchor, defX, defY)
        -- 更新存档以匹配新的 Anchor 类型
        self.db.profile["bar"..id] = { point = targetAnchor, x = defX, y = defY }
    end

    f.id = id
    f.cfg = cfg
    f.buttons = {}
    
    for i = 1, cfg.maxButtons do
        f.buttons[i] = self:CreateButton(f, i, cfg)
    end
    
    self.bars[id] = f
end

function Module:CreateButton(parentBar, index, cfg)
    local name = "RS_Btn_"..parentBar.id.."_"..index
    local btn = CreateFrame("Button", name, parentBar, "SecureActionButtonTemplate, BackdropTemplate")
    
    -- 注册点击事件 (左键/右键)
    btn:RegisterForClicks("AnyUp")
    
    btn:SetSize(cfg.buttonWidth, cfg.buttonHeight)
    btn:Hide()
    
    btn:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", insets = { left = 0, right = 0, top = 0, bottom = 0 } })
    local bg = THEME.background
    btn:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    btn.icon = btn:CreateTexture(nil, "ARTWORK")
    btn.icon:SetAllPoints(btn) 
    local c = THEME.iconCoords
    btn.icon:SetTexCoord(c[1], c[2], c[3], c[4])
    
    local border = CreateFrame("Frame", nil, btn, "BackdropTemplate")
    border:SetAllPoints(btn)
    border:SetFrameLevel(btn:GetFrameLevel() + 2)
    border:SetBackdrop({ edgeFile = THEME.border.edgeFile, edgeSize = THEME.border.edgeSize, bgFile = nil })
    local bd = THEME.border.color
    border:SetBackdropBorderColor(bd.r, bd.g, bd.b, bd.a)
    btn.borderFrame = border
    
    local pushed = btn:CreateTexture(nil, "OVERLAY")
    pushed:SetAllPoints()
    pushed:SetColorTexture(0, 0, 0, 0.3)
    btn:SetPushedTexture(pushed)
    
    local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints()
    highlight:SetColorTexture(1, 1, 1, 0.15)
    btn:SetHighlightTexture(highlight)
    
    btn.count = btn:CreateFontString(nil, "OVERLAY")
    btn.count:SetFont(CFG_ROOT.font.path, 12, "OUTLINE") 
    btn.count:SetTextColor(1, 1, 1)
    btn.count:SetPoint("BOTTOMRIGHT", -2, 2)
    
    if cfg.texts and cfg.texts.top then
        local t = cfg.texts.top
        btn.textTop = btn:CreateFontString(nil, "OVERLAY")
        btn.textTop:SetFont(t.font, t.size, t.flags)
        btn.textTop:SetPoint(t.point, t.x, t.y)
        btn.textTop:SetTextColor(t.color.r, t.color.g, t.color.b)
    end

    if cfg.texts and cfg.texts.bottom then
        local t = cfg.texts.bottom
        btn.textBottom = btn:CreateFontString(nil, "OVERLAY")
        btn.textBottom:SetFont(t.font, t.size, t.flags)
        btn.textBottom:SetPoint(t.point, t.x, t.y)
        btn.textBottom:SetTextColor(t.color.r, t.color.g, t.color.b)
    end
    
    btn.cooldown = CreateFrame("Cooldown", "$parentCooldown", btn, "CooldownFrameTemplate")
    btn.cooldown:SetAllPoints(btn)
    btn.cooldown:SetFrameLevel(btn:GetFrameLevel() + 3)
    btn.cooldown:SetDrawEdge(true)
    if btn.cooldown.SetHideCountdownNumbers then btn.cooldown:SetHideCountdownNumbers(false) end
    
    return btn
end

-- ============================================================
-- 弹出式菜单逻辑
-- ============================================================
function Module:ExpandFlyout(bar)
    if not bar or bar.id ~= 2 then return end
    if bar.hideTimer then bar.hideTimer:Cancel() end
    for i = 2, #bar.buttons do
        local btn = bar.buttons[i]
        if btn.isActive then btn:Show() end
    end
    if bar.expandedHeight then bar:SetHeight(bar.expandedHeight) end
end

function Module:CollapseFlyout(bar)
    if not bar or bar.id ~= 2 then return end
    if bar.hideTimer then bar.hideTimer:Cancel() end
    bar.hideTimer = C_Timer.NewTimer(0.2, function()
        if MouseIsOver(bar) then return end
        for i = 2, #bar.buttons do bar.buttons[i]:Hide() end
        bar:SetHeight(bar.cfg.buttonHeight)
    end)
end

-- ============================================================
-- 更新与布局
-- ============================================================
function Module:UpdateAllBars()
    if InCombatLockdown() then self:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdateAllBars") return end

    -- [安全检查] 只更新已创建的 bar
    if self.bars[1] then
        self:UpdateItemBar(self.bars[1])
    end

    if self.bars[2] then
        self:UpdateSpellBar(self.bars[2])
    end

    self:UpdateAllCooldowns()
end

function Module:UpdateItemBar(bar)
    if not bar then return end
    local foundItems = {}
    local seen = {}
    for _, cat in ipairs(PRIORITY) do
        if DataItems[cat] then
            for _, itemInfo in ipairs(DataItems[cat]) do
                local id = itemInfo.id
                if GetItemCount(id) > 0 and not seen[id] then
                    local bag, slot = self:FindItemInBag(id)
                    if bag and slot then
                        table.insert(foundItems, { type="item", id=id, bag=bag, slot=slot })
                        seen[id] = true
                    end
                end
            end
        end
    end
    self:LayoutButtons(bar, foundItems)
end

function Module:UpdateSpellBar(bar)
    if not bar then return end
    local myFaction = UnitFactionGroup("player")
    local filteredSpells = {}
    for _, info in ipairs(DataSpells) do
        if not info.requiredFaction or info.requiredFaction == myFaction then
            table.insert(filteredSpells, info)
        end
    end
    self:LayoutButtons(bar, filteredSpells)
end

function Module:LayoutButtons(bar, dataList)
    local cfg = bar.cfg
    local numActive = 0
    local spacing = cfg.spacing or 5
    local layout = cfg.layout or "HORIZONTAL"
    
    local pos = self.db.profile["bar"..bar.id]
    local anchor = cfg.anchor or "TOPLEFT"
    
    bar:ClearAllPoints()
    
    -- 应用坐标
    if pos then
        bar:SetPoint(anchor, UIParent, anchor, pos.x, pos.y)
    else
        local defX = (cfg.defaultPosition and cfg.defaultPosition.x) or 0
        local defY = (cfg.defaultPosition and cfg.defaultPosition.y) or 0
        bar:SetPoint(anchor, UIParent, anchor, defX, defY)
    end
    
    for i, btn in ipairs(bar.buttons) do
        local info = dataList[i]
        
        btn:ClearAllPoints()
        
        if i == 1 then 
            btn:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0)
        else 
            if layout == "VERTICAL" then
                btn:SetPoint("TOP", bar.buttons[i-1], "BOTTOM", 0, -spacing)
            else
                btn:SetPoint("LEFT", bar.buttons[i-1], "RIGHT", spacing, 0) 
            end
        end
        
        if btn.textTop then btn.textTop:SetText("") end
        if btn.textBottom then btn.textBottom:SetText("") end
        
        if info then
            btn.isActive = true
            
            if bar.id == 2 then
                btn:HookScript("OnEnter", function() Module:ExpandFlyout(bar) end)
                btn:HookScript("OnLeave", function() Module:CollapseFlyout(bar) end)
            end
            
            local isKnown = true
            btn.dataType = nil
            btn.bag = nil
            btn.slot = nil
            btn.spellID = nil
            btn.customInfo = nil
            
            btn:SetAttribute("type", nil)
            btn:SetAttribute("type1", nil)
            btn:SetAttribute("type2", nil)
            btn:SetAttribute("item", nil)
            btn:SetAttribute("spell", nil)
            btn:SetAttribute("spell1", nil)
            btn:SetAttribute("spell2", nil)

            if info.type == "custom_portal" then
                -- 左键传送门，右键传送
                btn:SetAttribute("type1", "spell")
                btn:SetAttribute("spell1", info.spellLeft)
                
                btn:SetAttribute("type2", "spell")
                btn:SetAttribute("spell2", info.spellRight)
                
                btn.icon:SetTexture(info.icon)
                
                -- 仅达拉然显示施法材料
                if btn.textTop then
                    if info.name == "达拉然" then
                        btn.textTop:SetText(GetItemCount(info.itemTeleport))
                    else
                        btn.textTop:SetText("") 
                    end
                end
                
                if btn.textBottom and info.overlayText then btn.textBottom:SetText(info.overlayText) end
                
                btn.dataType = "spell"
                btn.spellID = info.cdSpellID
                btn.customInfo = info
                if info.cdSpellID then isKnown = IsSpellKnown(info.cdSpellID) end
                
            elseif info.type == "spell" then
                local spellName = GetSpellInfo(info.id)
                btn:SetAttribute("type", "spell")
                btn:SetAttribute("spell", spellName or info.id)
                btn.icon:SetTexture(GetSpellTexture(info.id))
                btn.dataType = "spell"
                btn.spellID = info.id
                isKnown = IsSpellKnown(info.id)

            else
                btn:SetAttribute("type", "item")
                btn:SetAttribute("item", "item:"..info.id)
                btn.icon:SetTexture(GetItemIcon(info.id))
                local count = GetItemCount(info.id)
                btn.count:SetText(count > 1 and count or "")
                btn.dataType = "item"
                btn.bag = info.bag
                btn.slot = info.slot
                btn.itemID = info.id
                isKnown = true 
            end
            
            btn.icon:SetDesaturated(false)
            if isKnown then btn.icon:SetVertexColor(1, 1, 1)     
            else btn.icon:SetVertexColor(0.4, 0.4, 0.4) end
            
            if bar.id == 2 and i > 1 and not Module.isUnlocked then btn:Hide()
            else btn:Show() end
            
            btn:SetScript("OnEnter", function(self)
                if bar.id == 2 then Module:ExpandFlyout(bar) end
                
                if not Module.isUnlocked then
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    if self.customInfo then
                        local d = self.customInfo
                        local line1 = "|cffffffff左键：|r|cff00ff00"..d.spellLeft.." ("..GetItemCount(d.itemPortal)..")|r"
                        local line2 = "|cffffffff右键：|r|cff00ff00"..d.spellRight.." ("..GetItemCount(d.itemTeleport)..")|r"
                        GameTooltip:SetText(line1 .. "\n" .. line2)
                        if not isKnown then GameTooltip:AddLine(" "); GameTooltip:AddLine("|cffff0000(未学会)|r") end
                        GameTooltip:Show()
                    elseif self.dataType == "spell" then
                        GameTooltip:SetSpellByID(self.spellID)
                        if not isKnown then GameTooltip:AddLine(" "); GameTooltip:AddLine("|cffff0000(未学会)|r") end
                        GameTooltip:Show()
                    elseif self.bag and self.slot then
                        GameTooltip:SetBagItem(self.bag, self.slot)
                        GameTooltip:Show()
                    end
                end
            end)
            
            btn:SetScript("OnLeave", function() 
                GameTooltip:Hide() 
                if bar.id == 2 then Module:CollapseFlyout(bar) end
            end)
            
            numActive = numActive + 1
        else
            btn.isActive = false
            btn:Hide()
        end
    end
    
    if numActive > 0 then
        if layout == "VERTICAL" then
            bar.expandedHeight = numActive * cfg.buttonHeight + (numActive - 1) * spacing
            if bar.id == 2 and not Module.isUnlocked then
                bar:SetSize(cfg.buttonWidth, cfg.buttonHeight)
            else
                bar:SetSize(cfg.buttonWidth, bar.expandedHeight)
            end
        else
            local w = numActive * cfg.buttonWidth + (numActive - 1) * spacing
            bar:SetSize(w, cfg.buttonHeight)
        end
        bar:Show()
    else
        if Module.isUnlocked then 
            if layout == "VERTICAL" then bar:SetSize(cfg.buttonWidth, cfg.buttonHeight * 3)
            else bar:SetSize(cfg.buttonWidth * 3, cfg.buttonHeight) end
            bar:Show() 
        else 
            bar:Hide() 
        end
    end
end

function Module:UpdateAllCooldowns()
    for _, bar in pairs(self.bars) do
        for _, btn in ipairs(bar.buttons) do
            if btn:IsShown() then
                local start, duration, enable
                if btn.dataType == "spell" and btn.spellID then
                    start, duration, enable = GetSpellCooldown(btn.spellID)
                elseif btn.dataType == "item" and btn.bag and btn.slot then
                    start, duration, enable = GetContainerItemCooldown(btn.bag, btn.slot)
                end
                
                if start and duration and (enable == 1 or enable == true) then
                    CooldownFrame_Set(btn.cooldown, start, duration, enable)
                else
                    CooldownFrame_Set(btn.cooldown, 0, 0, 0)
                end
            end
        end
    end
end

function Module:TestAnimation()
    -- [安全检查] 如果没有任何 bar 被创建，提示用户
    if not next(self.bars) then
        RS:Print("没有可用的动作条（请检查 Config.lua 中的 enabled 开关和职业限制）")
        return
    end

    RS:Print("测试动画...")
    for _, bar in pairs(self.bars) do
        for _, btn in ipairs(bar.buttons) do
            if btn:IsShown() then CooldownFrame_Set(btn.cooldown, GetTime(), 10, 1) end
        end
    end
end

function Module:ToggleAnchor()
    if InCombatLockdown() then RS:Print("战斗中无法解锁") return end

    -- [安全检查] 如果没有任何 bar 被创建，提示用户
    if not next(self.bars) then
        RS:Print("没有可用的动作条（请检查 Config.lua 中的 enabled 开关和职业限制）")
        return
    end

    if self.isUnlocked then self:LockBars() else self:UnlockBars() end
end

-- ============================================================
-- 拖拽逻辑：支持 CENTER 计算
-- ============================================================
function Module:UnlockBars()
    self.isUnlocked = true
    for id, bar in pairs(self.bars) do
        if not bar.dragOverlay then
            local ov = CreateFrame("Frame", nil, bar, "BackdropTemplate")
            ov:SetAllPoints()
            ov:SetPoint("TOPLEFT", -5, 5)
            ov:SetPoint("BOTTOMRIGHT", 5, -5)
            ov:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8"})
            ov:SetBackdropColor(0, 1, 0, 0.5)
            ov:SetFrameLevel(bar:GetFrameLevel() + 50)
            ov:EnableMouse(true)
            ov:RegisterForDrag("LeftButton")
            
            ov:SetScript("OnDragStart", function() bar:StartMoving() end)
            
            ov:SetScript("OnDragStop", function()
                bar:StopMovingOrSizing()
                
                local anchor = bar.cfg.anchor or "TOPLEFT"
                
                local left = bar:GetLeft()
                local top = bar:GetTop()
                local screenW = UIParent:GetWidth()
                local screenH = UIParent:GetHeight()
                
                if not left or not top then return end
                
                local x, y
                
                if anchor == "TOPLEFT" then
                    x = left
                    y = top - screenH
                elseif anchor == "TOPRIGHT" then
                    x = bar:GetRight() - screenW
                    y = top - screenH
                elseif anchor == "TOP" then
                    local centerX = (bar:GetLeft() + bar:GetRight()) / 2
                    x = centerX - screenW / 2
                    y = top - screenH
                elseif anchor == "CENTER" then
                    local centerX = (bar:GetLeft() + bar:GetRight()) / 2
                    local centerY = (bar:GetTop() + bar:GetBottom()) / 2
                    x = centerX - screenW / 2
                    y = centerY - screenH / 2
                else
                    x = left
                    y = top - screenH
                    anchor = "TOPLEFT"
                end
                
                bar:ClearAllPoints()
                bar:SetPoint(anchor, UIParent, anchor, x, y)
                self.db.profile["bar"..id] = { point = anchor, x = x, y = y }
            end)
            bar.dragOverlay = ov
        end
        bar.dragOverlay:Show()
        
        for i, btn in ipairs(bar.buttons) do if btn.isActive then btn:Show() end end
        if bar.expandedHeight and bar.cfg.layout == "VERTICAL" then bar:SetHeight(bar.expandedHeight) end
        
        bar:Show()
    end
    self:UpdateAllBars()
    RS:Print("动作条: |cffff0000已解锁|r")
end

function Module:LockBars()
    self.isUnlocked = false
    for _, bar in pairs(self.bars) do
        if bar.dragOverlay then bar.dragOverlay:Hide() end
        for _, btn in ipairs(bar.buttons) do btn:EnableMouse(true) end
        
        if bar.id == 2 then
            for i = 2, #bar.buttons do bar.buttons[i]:Hide() end
            bar:SetHeight(bar.cfg.buttonHeight)
        end
    end
    self:UpdateAllBars()
    RS:Print("动作条: |cff00ff00已锁定|r")
end

function Module:CreateUnlockUI() end