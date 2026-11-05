-- 文件职责：快速焦点提醒的时机与配额；共享文字组负责位置、样式和移动。
-- 生命周期：框体与隐藏计时归FastFocus，关闭时注销共享行并取消所有回调。
local _, ns = ...
if not ns.Build.HasModule("FastFocus") then return end
local Reminder = {}
local function Group() return ns.CenterTextGroup end
local function Hide(frame) frame:Hide() end
local function CancelHandle(module, key)
    if module[key] then module:CancelSchedule(module[key]); module[key] = nil end
end
function Reminder:HideCenter(module)
    CancelHandle(module, "centerReminderHideHandle")
    if module.centerReminderFrame and not module.isUnlocked then
        module.centerReminderFrame:Hide(); Group():QueueLayout()
    end
end
function Reminder:Cancel(module)
    module.reminderGeneration = (module.reminderGeneration or 0) + 1
    CancelHandle(module, "mythicReminderHandle"); self:HideCenter(module)
end
function Reminder:Release(module)
    module.isUnlocked = false; self:Cancel(module)
    Group():Unregister("fastfocus")
    if module.centerReminderFrame then module:ReleaseFrame(module.centerReminderFrame) end
end
function Reminder:GetPosition() return Group():GetPosition() end
function Reminder:ApplyPosition() Group():QueueLayout(); return true end
function Reminder:CommitPosition() return Group():SavePosition() end
function Reminder:ResetPosition() return Group():ResetPosition() end
function Reminder:Refresh(module)
    local frame = module.centerReminderFrame
    if not frame then return end
    local size = Group().db.profile.fontSize
    Group():ApplyTextStyle(frame.title, size)
    Group():ApplyTextStyle(frame.subtitle, math.max(16, size - 4))
    frame.subtitle:SetText(string.format("点击顶部 |TInterface\\TargetingFrame\\UI-RaidTargetingIcon_%d:22:22|t 图标设置", module:GetSelectedMarker()))
    frame:SetSize(math.max(frame.title:GetStringWidth(), frame.subtitle:GetStringWidth()) + 16,
        frame.title:GetStringHeight() + frame.subtitle:GetStringHeight() + 16)
    Group():QueueLayout()
end
function Reminder:EnsureCenterFrame(module)
    if not module.centerReminderFrame then
        local frame = module:CreateFrame("Frame", "RSFastFocusCenterReminder", UIParent, nil, Hide, "FastFocus center reminder")
        frame:SetFrameStrata("DIALOG"); frame:EnableMouse(false)
        local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
        title:SetPoint("TOP", frame, "TOP", 0, -4); title:SetText("尚未开启焦点标记")
        local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        subtitle:SetPoint("TOP", title, "BOTTOM", 0, -8)
        frame.title, frame.subtitle = title, subtitle
        frame:Hide(); module.centerReminderFrame = frame
    else module:OwnFrame(module.centerReminderFrame, Hide, "FastFocus center reminder") end
    Group():Register("fastfocus", module.centerReminderFrame, 30)
    self:Refresh(module); return module.centerReminderFrame
end
function Reminder:SetUnlocked(module, value) return Group():SetUnlocked(value) end
function Reminder:ShowCenter(module, generation)
    if not Group().active then return false end
    local frame = self:EnsureCenterFrame(module); frame:Show(); Group():QueueLayout()
    CancelHandle(module, "centerReminderHideHandle")
    module.centerReminderHideHandle = module:Schedule(3, function()
        module.centerReminderHideHandle = nil
        if generation == module.reminderGeneration and not module.isUnlocked then
            frame:Hide(); Group():QueueLayout()
        end
    end, "FastFocus center reminder hide")
    return true
end
function Reminder:Preview(module)
    if not (module.runtimeActive and module:GetProfile().enabled) then
        if ns.Print then ns.Print("请先启用快速焦点。") end
        return false
    end
    self:Cancel(module); return self:ShowCenter(module, module.reminderGeneration)
end
function Reminder:Show(module, generation)
    if not Group().active then return false end
    local today = module.adapter:GetTodayKey()
    local last = module.db.global.lastMythicReminderDay
    if type(last) == "string" then last = tonumber((last:gsub("%-", ""))) end
    if not today or last == today then return false end
    module.db.global.lastMythicReminderDay = today
    return self:ShowCenter(module, generation)
end
function Reminder:Schedule(module)
    self:Cancel(module, "reschedule")
    local generation = module.reminderGeneration
    module.mythicReminderHandle = module:Schedule(3, function()
        module.mythicReminderHandle = nil
        local profile = module:GetProfile()
        if generation ~= module.reminderGeneration or not module.runtimeActive
            or not profile or not profile.enabled or profile.markEnabled == true
            or profile.disableCenterReminder ~= false
            or (profile.disableHealerReminder ~= false and module.adapter:IsPlayerHealerExceptRestoShaman())
            or module.adapter:IsInCombat() or not module.adapter:IsPlainMythicDungeon() then return end
        Reminder:Show(module, generation)
    end, "FastFocus plain mythic reminder")
end

function Reminder:OnPlayerEnteringWorld(module, isInitialLogin, isReloadingUi)
    local eligible = module.adapter:IsPlainMythicDungeon()
    local wasInside = module.insideMythicDungeon == true
    module.insideMythicDungeon = eligible
    if not eligible or wasInside then
        self:Cancel(module, "entering-world-sync")
        return false
    end
    self:Schedule(module)
    return true
end

function Reminder:OnChallengeModeStart(module)
    module.insideMythicDungeon = true
    self:Cancel(module, "challenge-start")
end

ns.FastFocusReminder = Reminder
