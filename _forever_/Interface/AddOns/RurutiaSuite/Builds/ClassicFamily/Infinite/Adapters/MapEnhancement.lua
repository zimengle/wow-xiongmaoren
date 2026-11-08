-- Infinite 1.60: retain the native UIPanel registration and maximize lifecycle.
-- This adapter owns only windowed scale/offsets and two small input surfaces.
local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" then return end

local Adapter = {}

function Adapter:Resolve() return _G.WorldMapFrame end
function Adapter:IsInCombat() return _G.InCombatLockdown and _G.InCombatLockdown() or false end
function Adapter:GetLayout(frame, key)
    -- GetUIPanelAttribute is PRIVATE to Blizzard_UIParentPanelManager in 1.60.
    -- Read effective defaults without materializing or replacing native attributes.
    if frame:GetAttribute("UIPanelLayout-defined") then
        return frame:GetAttribute("UIPanelLayout-" .. key)
    end
    local defaults = _G.UIPanelWindows and _G.UIPanelWindows[frame:GetName()]
    return defaults and defaults[key]
end
-- 会改地图贴图或整页布局的插件，窗口移动和未探索都让位。
local REVEAL_CONFLICTS = { "Leatrix_Maps", "Mapster", "NDui", "ElvUI" }
local WINDOW_CONFLICTS = REVEAL_CONFLICTS
local WINDOW_PROVIDER = { "BlizzMove" }

local function FindLoaded(names)
    local loaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded
    if not loaded then return nil end
    -- Deliberately conservative: saved switches may differ from active hooks until reload.
    for _, name in ipairs(names) do
        if loaded(name) then return name end
    end
end

function Adapter:GetConflict()
    local conflict = FindLoaded(WINDOW_CONFLICTS)
    if conflict then return conflict end
    if FindLoaded(WINDOW_PROVIDER) then
        local api = _G.BlizzMoveAPI
        if type(api) ~= "table" or type(api.IsFrameDisabled) ~= "function"
            or type(api.SetFrameDisabled) ~= "function" then return "BlizzMove" end
        local ok, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", "WorldMapFrame")
        if not ok or disabled ~= true then return "BlizzMove" end
    end
end

function Adapter:GetRevealConflict()
    return FindLoaded(REVEAL_CONFLICTS)
end

function Adapter:GetAreaLabelType()
    return _G.MAP_AREA_LABEL_TYPE and _G.MAP_AREA_LABEL_TYPE.AREA_NAME
end

function Adapter:CanShowZoneLevels(map)
    return self:GetAreaLabelType() and type(map.AddDataProvider) == "function"
        and type(map.GetMapID) == "function" and type(map.IsCanvasMouseFocus) == "function"
        and type(map.GetNormalizedCursorPosition) == "function"
        and _G.C_Map and type(_G.C_Map.GetMapInfoAtPosition) == "function"
end

function Adapter:ResolveAreaLabel(map)
    for provider in pairs(map.dataProviders or {}) do
        local label = provider.Label
        if label and label.dataProvider == provider and type(label.SetLabel) == "function"
            and type(label.GetHighestPriorityLabelInfo) == "function"
            and type(label.EvaluateLabels) == "function" then return label end
    end
end

function Adapter:GetLabelPosition(map)
    local x, y
    local input = _G.InputUtil
    if input and type(input.IsGamepadUIEnabled) == "function" and input.IsGamepadUIEnabled()
        and type(map.HasGamepadCursorInput) == "function"
        and type(map.IsCanvasMouseFocusOrPinFocus) == "function"
        and (map:HasGamepadCursorInput() or not map:IsCanvasMouseFocusOrPinFocus()) then
        if type(map.GetNormalizedGamepadCursorPosition) ~= "function" then return end
        x, y = map:GetNormalizedGamepadCursorPosition()
    else
        x, y = map:GetNormalizedCursorPosition()
    end
    if type(x) ~= "number" or type(y) ~= "number" or x ~= x or y ~= y
        or x < 0 or x > 1 or y < 0 or y > 1 then return end
    return map:GetMapID(), x, y
end

function Adapter:GetMapAtPosition(mapID, x, y)
    return _G.C_Map.GetMapInfoAtPosition(mapID, x, y)
end

function Adapter:FormatZoneLevels(name, minimum, maximum, playerLevel)
    if type(minimum) ~= "number" or type(maximum) ~= "number"
        or minimum < 1 or maximum < minimum or maximum >= math.huge
        or minimum % 1 ~= 0 or maximum % 1 ~= 0 then return end
    local color
    if type(playerLevel) == "number" and type(_G.GetQuestDifficultyColor) == "function" then
        if playerLevel < minimum then color = _G.GetQuestDifficultyColor(minimum)
        elseif playerLevel > maximum then color = _G.GetQuestDifficultyColor(maximum - 2)
        else color = _G.QuestDifficultyColors and _G.QuestDifficultyColors.difficult end
    end
    local prefix = color and string.format("|cff%02x%02x%02x",
        math.floor(color.r * 255 + 0.5), math.floor(color.g * 255 + 0.5), math.floor(color.b * 255 + 0.5)) or ""
    local range = minimum == maximum and tostring(minimum) or (minimum .. "–" .. maximum)
    return name .. " " .. prefix .. "(" .. range .. ")" .. (color and "|r" or "")
end

function Adapter:ResolveRevealTexture(fileDataID)
    if type(fileDataID) ~= "number" or fileDataID <= 0
        or fileDataID >= math.huge or fileDataID % 1 ~= 0 then return nil end
    return fileDataID
end

-- Unregistering a BlizzMove frame also disables its mouse input. Snapshot only
-- the map subtree, once per handoff, and preserve native inputs after the API
-- removes its movement/scale handlers. Bound traversal; never scan the whole UI.
local INPUTS = { { "IsMouseEnabled", "EnableMouse" }, { "IsMouseWheelEnabled", "EnableMouseWheel" } }
local function SnapshotInputs(map)
    local queue, records, seen = { map }, {}, {}
    local index = 1
    while index <= #queue do
        local frame = queue[index]
        index = index + 1
        if not seen[frame] then
            seen[frame] = true
            if index > 2049 then return nil end
            for _, methods in ipairs(INPUTS) do
                if type(frame[methods[1]]) == "function" and type(frame[methods[2]]) == "function" then
                    local enabled = frame[methods[1]](frame)
                    if type(enabled) == "boolean" then
                        records[#records + 1] = { frame, methods[2], enabled, methods[1] }
                    end
                end
            end
            if type(frame.GetChildren) == "function" then
                for _, child in ipairs({ frame:GetChildren() }) do
                    if #queue >= 2048 then return nil end
                    queue[#queue + 1] = child
                end
            end
        end
    end
    return records
end

local function RestoreInputs(records)
    for _, record in ipairs(records) do
        if record[1][record[4]](record[1]) ~= record[3] then
            record[1][record[2]](record[1], record[3])
        end
    end
end

-- Elles Shifter has no per-window disable API. Keep only the map records
-- leased in our profile across reloads; never reset the other windows.
local function EllesState(map)
    local ui, db = _G.EllesmereUI, _G.EllesmereUIDB
    if type(ui) ~= "table" or type(ui._GetFFD) ~= "function"
        or type(db) ~= "table" or not db.shifterEnabled then return end
    local ok, state = pcall(ui._GetFFD, map)
    if ok and type(state) == "table" then return state, db end
end

function Adapter:AcquireEllesWindow(profile, map)
    local state, db = EllesState(map)
    if not state then return end
    for _, field in ipairs({ "shifterPositions", "shifterScales" }) do
        local records = db[field]
        if type(records) == "table" and records.WorldMapFrame ~= nil then
            profile.ellesMapLease = profile.ellesMapLease or {}
            -- Retain the latest explicit Elles adjustment for release.
            profile.ellesMapLease[field] = records.WorldMapFrame
            records.WorldMapFrame = nil
        end
    end
    -- Without a saved target, Shifter otherwise restores its original scale
    -- once on the next OnShow, possibly after our OnShow handler.
    state._shScaled = nil
end

function Adapter:ReleaseEllesWindow(profile)
    local lease = profile and profile.ellesMapLease
    local db = _G.EllesmereUIDB
    if not lease or type(db) ~= "table" then return end
    for field, value in pairs(lease) do
        if db[field] == nil then db[field] = {} end
        if type(db[field]) == "table" and db[field].WorldMapFrame == nil then
            db[field].WorldMapFrame = value
        end
    end
    profile.ellesMapLease = nil
end

-- Use Shifter's existing recursion guards only during our synchronous writes.
-- This also bypasses its private temporary Ctrl-wheel scale/position, without
-- touching those closures or adding hooks, timers, frames or per-frame polling.
function Adapter:WithWindowControl(map, callback, ...)
    local state = EllesState(map)
    if not state then return callback(...) end
    local point, scale = state._shIgnoreSP, state._shIgnoreSS
    state._shIgnoreSP, state._shIgnoreSS = true, true
    local ok, err = pcall(callback, ...)
    state._shIgnoreSP, state._shIgnoreSS = point, scale
    if not ok then error(err, 0) end
end

function Adapter:AcquireWindow(profile, map)
    if self:IsInCombat() or FindLoaded(REVEAL_CONFLICTS) then return false end
    self:AcquireEllesWindow(profile, map)
    if not FindLoaded(WINDOW_PROVIDER) then return true end
    local api = _G.BlizzMoveAPI
    if type(api) ~= "table" or type(api.IsFrameDisabled) ~= "function"
        or type(api.SetFrameDisabled) ~= "function" then return false end
    local ok, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", "WorldMapFrame")
    if not ok then return false end
    if disabled ~= true then
        local captured, inputs = pcall(SnapshotInputs, map)
        if not captured or not inputs then return false end
        -- Persist the lease across /reload; never re-enable a pre-disabled map.
        profile.blizzMoveMapOwned = true
        local applied = pcall(api.SetFrameDisabled, api, "BlizzMove", "WorldMapFrame", true)
        RestoreInputs(inputs)
        ok, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", "WorldMapFrame")
        if not applied or not ok or disabled ~= true then
            self:ReleaseWindow(profile)
            return false
        end
    end
    return true
end

function Adapter:ReleaseWindow(profile)
    if self:IsInCombat() then return end
    self:ReleaseEllesWindow(profile)
    if not profile or not profile.blizzMoveMapOwned or self:IsInCombat() then return end
    local api = _G.BlizzMoveAPI
    if type(api) ~= "table" or type(api.SetFrameDisabled) ~= "function"
        or type(api.IsFrameDisabled) ~= "function" then return end
    local ok, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", "WorldMapFrame")
    if not ok then return end
    if disabled then
        if not pcall(api.SetFrameDisabled, api, "BlizzMove", "WorldMapFrame", false) then return end
        ok, disabled = pcall(api.IsFrameDisabled, api, "BlizzMove", "WorldMapFrame")
        if not ok or disabled then return end
    end
    profile.blizzMoveMapOwned = nil
end

ns.MapEnhancementAdapter = Adapter
