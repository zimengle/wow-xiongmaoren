local _, ns = ...
if not (ns.Build and ns.Build.GetID) or ns.Build.GetID() ~= "classic-infinite" or not ns.Build.HasModule("ExtraTools") then return end

local Fonts = {}
ns.EllesmereStatFonts = Fonts
local lists = { "CharacterStatsPaneScrollBox", "CharacterStatsPanePetScrollBox" }
local bound = {}
local originals = setmetatable({}, { __mode = "k" })
local size, showHook

local function Resize(text, target)
    if not text then return end
    local path, current, flags = text:GetFont()
    if not path or not current or current == target then return end
    local record = originals[text]
    if text:SetFont(path, target, flags) then
        if not record or current ~= record.applied then
            record = { original = current }
            originals[text] = record
        end
        record.applied = target
    end
end

local function StyleRow(frame, data)
    if not (size and frame and data) then return end
    if data.isHeader then
        Resize(frame.Title, size + 1)
    else
        Resize(frame.Label, size)
        Resize(frame.Value, size)
    end
end

local function OnInitialized(_, frame, data)
    StyleRow(frame, data)
end

local function BindLists()
    local event = ScrollBoxListMixin.Event.OnInitializedFrame
    for _, name in ipairs(lists) do
        local pane = _G[name]
        local box = pane and pane.ScrollBox
        if box and box.ForEachFrame and not bound[box] then
            box:RegisterCallback(event, OnInitialized, Fonts)
            bound[box] = event
            box:ForEachFrame(StyleRow)
        end
    end
end

function Fonts:Detach(owner)
    if showHook then owner:RemoveHook(showHook); showHook = nil end
    for box, event in pairs(bound) do
        box:UnregisterCallback(event, self)
        bound[box] = nil
    end
    for text, record in pairs(originals) do
        local path, current, flags = text:GetFont()
        if path and current == record.applied then text:SetFont(path, record.original, flags) end
        originals[text] = nil
    end
    size = nil
end

function Fonts:GetChoice(owner)
    local choice = owner:GetProfile().ellesmereStatFont
    if choice == "follow" then return choice end
    return tostring(ns.ExtraToolsData.ClampNumber(choice, 11, 18, 14))
end

function Fonts:Sync(owner)
    local eui, db = _G.EllesmereUI, _G.EllesmereUIDB
    local choice = self:GetChoice(owner)
    local styles = db and db.blizzWindowSkinStyles
    if not owner.runtimeActive or choice == "follow" or not (eui and eui._refreshCharacterSheetColors)
        or (db and db.themedCharacterSheet == false) or (styles and styles.charsheet == "blizzard")
        or not eui.BlizzWindowSkinsKilled or eui.BlizzWindowSkinsKilled()
        or (eui.BlizzSkinPadStandDown and eui.BlizzSkinPadStandDown()) then
        self:Detach(owner)
        return
    end
    local frame = _G.CharacterFrame
    if not (frame and IsLoggedIn() and ScrollBoxListMixin and ScrollBoxListMixin.Event.OnInitializedFrame) then return end
    local target = tonumber(choice)
    if size ~= target then
        size = target
        for box in pairs(bound) do box:ForEachFrame(StyleRow) end
    end
    if not showHook then
        -- Elles finishes its skin at login or on first show. Bind after its show handler.
        showHook = owner:HookFrameScript(frame, "OnShow", BindLists, "elles-stat-font")
        if frame:IsShown() then BindLists() end
    end
end
