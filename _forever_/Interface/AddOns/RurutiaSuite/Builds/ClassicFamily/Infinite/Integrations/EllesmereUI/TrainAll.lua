local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
    and ns.Build.HasModule("ExtraTools")) then return end

local TrainAll = {}
ns.EllesmereTrainAll = TrainAll
local popup = "RURUTIASUITE_CONFIRM_ELLES_TRAIN_ALL"
local button, originalClick, originalText, label, hideHook, applyHook
local pendingCost
local locale = GetLocale()
local zhCN, zhTW = locale == "zhCN", locale == "zhTW"

local function ClosePrompt()
    pendingCost = nil
    StaticPopup_Hide(popup)
end

-- Match Elles' descending purchase order, including the remaining money and profession slots.
local function TrainingCost()
    local wallet = GetMoney()
    local slots = 2
    if GetProfessions then
        local first, second = GetProfessions()
        slots = slots - (first and 1 or 0) - (second and 1 or 0)
    end
    local total = 0
    for index = GetNumTrainerServices(), 1, -1 do
        local _, status = GetTrainerServiceInfo(index)
        if status == "available" then
            local cost, needsSlot = GetTrainerServiceCost(index)
            cost = cost or 0
            if cost <= wallet - total and (not needsSlot or slots > 0) then
                total = total + cost
                if needsSlot then slots = slots - 1 end
            end
        end
    end
    return total
end

local function Confirm()
    if button and button:IsVisible() and button:IsEnabled() and button:GetScript("OnClick") == Confirm then
        local cost = TrainingCost()
        local amount = C_CurrencyInfo.GetCoinTextureString(cost)
        pendingCost = StaticPopup_Show(popup, amount) and cost or nil
    end
end

local function SyncButtonSkin()
    -- This is an Elles trainer control. Use the trainer window's own engine;
    -- third-party skin registration can stay queued without delivering a facade.
    local eui = _G.EllesmereUI
    local modules = eui and eui._ModuleNS
    local blizzardSkin = modules and modules.EllesmereUIBlizzardSkin
    local skin = blizzardSkin and blizzardSkin.WSkin
    if not (skin and skin.Button and skin.StateButtonLabel and eui.GetBlizzWindowStyle) then return end
    local style = eui.GetBlizzWindowStyle("trainer")
    if style == "eui" or style == "modern" then
        skin.Button(button)
        skin.StateButtonLabel(button)
    end
end

local function Bind(owner)
    local target = _G.EUI_TrainAllButton
    if not target or not target:GetScript("OnClick") then return end
    if button then SyncButtonSkin(); return end
    button = target
    originalClick = button:GetScript("OnClick")
    originalText = button:GetText()
    label = zhCN and "全部学习" or zhTW and "全部學習" or nil
    if label then button:SetText(label) end
    StaticPopupDialogs[popup] = {
        text = zhCN and "需要学习全部可学技能吗？即将花费\n%s"
            or zhTW and "需要學習全部可學技能嗎？即將花費\n%s"
            or "Learn all available skills? Total cost\n%s",
        button1 = ACCEPT, button2 = CANCEL, timeout = 0, hideOnEscape = true,
        OnCancel = function() pendingCost = nil end,
        OnAccept = function()
            local quotedCost = pendingCost
            if quotedCost == nil then return end
            pendingCost = nil
            if button and button:IsVisible() and button:IsEnabled() and button:GetScript("OnClick") == Confirm then
                if TrainingCost() == quotedCost then originalClick(button, "LeftButton") end
            end
        end,
    }
    hideHook = owner:HookFrameScript(button, "OnHide", ClosePrompt, "elles-train-all-hide")
    button:SetScript("OnClick", Confirm)
    SyncButtonSkin()
end

function TrainAll:Sync(owner)
    -- The trainer UI loads on demand. The options toggle can also create the button mid-visit.
    local eui = _G.EllesmereUI
    if not applyHook and eui and eui._applyTrainAllButton then
        applyHook = owner:HookSecureFunction(eui, "_applyTrainAllButton", Bind, "elles-train-all-toggle")
    end
    Bind(owner)
end

function TrainAll:Detach(owner)
    if applyHook then owner:RemoveHook(applyHook); applyHook = nil end
    if not button then return end
    ClosePrompt()
    owner:RemoveHook(hideHook)
    if button:GetScript("OnClick") == Confirm then button:SetScript("OnClick", originalClick) end
    if label and button:GetText() == label then button:SetText(originalText) end
    StaticPopupDialogs[popup] = nil
    button, originalClick, originalText, hideHook = nil, nil, nil, nil
end
