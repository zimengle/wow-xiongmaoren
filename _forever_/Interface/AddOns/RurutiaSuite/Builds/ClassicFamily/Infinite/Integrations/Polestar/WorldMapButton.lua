local _, ns = ...
if ns.Build.GetID() ~= "classic-infinite" or not ns.Build.HasModule("MapEnhancement") then return end

local Button = {}
ns.PolestarWorldMapButton = Button

local SETTING = "nav.worldPins"
local SLOT, X = 32, 3
local SORT_REFRESH = "polestar-world-map-sort"
local ICON = "Interface\\AddOns\\RurutiaSuite\\Media\\Textures\\quest-guide.tga"
local EVENTS = { Polestar = true, Questie = true, DungeonsForever = true, Blizzard_WorldMap = true }

local function Guide()
    local isLoaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if not isLoaded then return end
    local loadingOrLoaded, loaded = isLoaded("Polestar")
    if loaded == nil then loaded = loadingOrLoaded end
    if not loaded then return end
    local guide = _G.Polestar
    if type(guide) == "table" and type(guide.Get) == "function" and type(guide.Set) == "function"
        and type(guide.Get(SETTING)) == "boolean" then return guide end
end

local function MapButtonLibrary()
    local libStub = _G.LibStub
    return libStub and libStub.GetLibrary and libStub:GetLibrary("Krowi_WorldMapButtons-1.4", true)
end

local function WaitingForHandbook()
    if not ns.Compat.IsAddOnLoaded("DungeonsForever") then return false end
    local db = _G.DungeonsForeverDB
    if not db then return true end
    return (not db.ui or db.ui.mapEntry ~= false) and (not db.dungeon or db.dungeon.mapOnWorld ~= false)
end

-- Follow the visible left-hand stack without joining either addon's ordering list.
local function DropFromCanvas(frame, canvas, left, top)
    if not frame or not frame.IsShown or not frame.GetPoint or not frame:IsShown() then return end
    local point, relative, relativePoint, x, y = frame:GetPoint(1)
    if point == "TOPLEFT" and relative == canvas and relativePoint == "TOPLEFT" then
        if x and x >= -6 and x <= 10 and y and y >= -240 and y <= 8 then return -y end
        return
    end
    -- Some clients anchor the native map pin to the map rather than the canvas.
    local frameLeft, frameTop = frame:GetLeft(), frame:GetTop()
    if not (left and top and frameLeft and frameTop) then return end
    local dx, drop = frameLeft - left, top - frameTop
    if dx >= -6 and dx <= 10 and drop >= -8 and drop <= 240 then return drop end
end

function Button:Paint()
    local frame = self.frame
    if not (self.guide and frame and frame:IsShown()) then return end
    local visible = self.guide.Get(SETTING) == true
    if frame.rsPinsVisible == visible then return end
    frame.rsPinsVisible = visible
    frame.icon:SetDesaturated(not visible)
    frame.icon:SetAlpha(visible and 1 or 0.5)
end

function Button:ShowTip(frame)
    local tip = _G.GameTooltip
    if not (tip and self.guide) then return end
    tip:SetOwner(frame, "ANCHOR_RIGHT")
    tip:ClearLines()
    tip:AddLine("北极星", 1, 0.82, 0)
    tip:AddLine(self.guide.Get(SETTING) and "左键：隐藏大地图指南标记" or "左键：显示大地图指南标记", 1, 1, 1)
    tip:Show()
end

local function HideTip(frame)
    local tip = _G.GameTooltip
    if tip and tip:IsOwned(frame) then tip:Hide() end
end

function Button:EnsureFrame()
    if self.frame then
        if not self.owned then self.owner:OwnFrame(self.frame, nil, "Polestar world map button") end
    else
        local frame = self.owner:CreateFrame("Button", nil, self.map, nil, nil, "Polestar world map button")
        self.frame = frame
        frame:SetSize(SLOT, SLOT)
        frame:SetFrameStrata("HIGH")
        local bg = frame:CreateTexture(nil, "BACKGROUND")
        bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
        bg:SetSize(25, 25)
        bg:SetPoint("TOPLEFT", 2, -4)
        local icon = frame:CreateTexture(nil, "ARTWORK")
        icon:SetTexture(ICON)
        icon:SetSize(22, 22)
        icon:SetPoint("TOPLEFT", 6, -5)
        frame.icon = icon
        local ring = frame:CreateTexture(nil, "OVERLAY")
        ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        ring:SetSize(54, 54)
        ring:SetPoint("TOPLEFT")
        frame:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
        frame:RegisterForClicks("LeftButtonUp")
        frame:SetScript("OnEnter", function(target) self:ShowTip(target) end)
        frame:SetScript("OnLeave", HideTip)
        frame:SetScript("OnClick", function(target)
            local guide = self.guide
            if not (self.owner.runtimeActive and guide) then return end
            guide.Set(SETTING, not guide.Get(SETTING))
            self:Paint()
            local tip = _G.GameTooltip
            if tip and tip:IsOwned(target) then self:ShowTip(target) end
        end)
    end
    self.owned = true
    return self.frame
end

function Button:WatchVisibility(key, target)
    if not target or self[key] then return end
    self[key] = true
    for _, script in ipairs({ "OnShow", "OnHide" }) do
        self.hooks[#self.hooks + 1] = self.owner:ObserveMapScript(target, script, function() self:Place() end,
            "Polestar world map neighbours")
    end
end

function Button:Place(allowDelayedSort)
    local map, owner = self.map, self.owner
    if not (map and owner.runtimeActive and map:IsShown() and self.guide) or ns.MapEnhancementAdapter:IsInCombat() then return end
    local canvas = map:GetCanvasContainer()
    if not canvas then return end

    local questie = _G.Questie
    local questieButton = questie and questie.WorldMap and questie.WorldMap.Button
    local handbook = _G.DungeonsForeverMapPinLogo
    self:WatchVisibility("watchQuestie", questieButton)
    if handbook and not self.watchHandbook then
        self:WatchVisibility("watchHandbook", handbook)
        self.hooks[#self.hooks + 1] = owner:ObserveMapFunction(handbook, "SetPoint", function() self:Place() end,
            "Polestar handbook position")
    end
    local lib = MapButtonLibrary()
    if lib and type(lib.SetPoints) == "function" and not self.watchLibrary then
        self.watchLibrary = true
        self.hooks[#self.hooks + 1] = owner:ObserveMapFunction(lib, "SetPoints", function() self:Place() end,
            "Polestar world map stack")
    end

    local left, top = canvas:GetLeft(), canvas:GetTop()
    local anchor, deepest = canvas, -1
    local function Consider(candidate)
        local drop = DropFromCanvas(candidate, canvas, left, top)
        if drop and drop >= deepest then anchor, deepest = candidate, drop end
    end
    for _, candidate in ipairs(map.overlayFrames or {}) do Consider(candidate) end
    if lib and lib.Buttons then for _, candidate in ipairs(lib.Buttons) do Consider(candidate) end end
    Consider(questieButton)
    Consider(handbook)

    local waiting = not handbook and WaitingForHandbook()
    local reserved = waiting or (handbook and handbook:IsShown() and anchor ~= handbook)
    local drop = reserved and SLOT * 2 or SLOT
    if waiting and allowDelayedSort then
        -- The handbook creates its button on its first 0.2 s map update.
        owner:RequestRefresh(SORT_REFRESH, function() self:Place() end, 0.25)
    end

    local frame = self:EnsureFrame()
    if frame:GetParent() ~= map then frame:SetParent(map) end
    local level = canvas:GetFrameLevel() + 20
    if frame:GetFrameLevel() ~= level then frame:SetFrameLevel(level) end
    if self.anchor ~= anchor or self.drop ~= drop then
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", anchor, "TOPLEFT", anchor == canvas and X or 0, -drop)
        self.anchor, self.drop = anchor, drop
    end
    if not frame:IsShown() then frame:Show() end
    self:Paint()
end

function Button:Detach()
    if not self.map then return end
    self.owner:CancelRefresh(SORT_REFRESH)
    if self.listener then self.guide.Off(self.listener) end
    for _, hook in ipairs(self.hooks) do self.owner:RemoveMapObserver(hook) end
    if self.owned then self.owner:ReleaseFrame(self.frame); HideTip(self.frame) end
    self.map, self.guide, self.listener, self.hooks, self.owned = nil, nil, nil, nil, nil
    self.anchor, self.drop, self.watchQuestie, self.watchHandbook, self.watchLibrary = nil, nil, nil, nil, nil
end

function Button:Sync(owner, event, name)
    if event == "ADDON_LOADED" and not EVENTS[name] then return end
    if not owner.runtimeActive then return end
    local map, guide = ns.MapEnhancementAdapter:Resolve(), Guide()
    if self.map ~= map or self.guide ~= guide then self:Detach() end
    if not (map and map.GetCanvasContainer and guide) then return end
    if not self.map then
        self.owner, self.map, self.guide = owner, map, guide
        self.hooks = {
            owner:ObserveMapScript(map, "OnShow", function() self:Place(true) end, "Polestar map show"),
            owner:ObserveMapScript(map, "OnHide", function()
                owner:CancelRefresh(SORT_REFRESH)
                if self.frame then HideTip(self.frame) end
            end, "Polestar map hide"),
        }
        if type(map.OnMapChanged) == "function" then
            self.hooks[#self.hooks + 1] = owner:ObserveMapFunction(map, "OnMapChanged", function() self:Place() end,
                "Polestar map change")
        end
        if type(guide.On) == "function" and type(guide.Off) == "function" then
            self.listener = guide.On("SETTING_CHANGED", function(path)
                if map:IsShown() and (path == SETTING or path == "nav" or path == "") then self:Paint() end
            end)
        end
    end
    self:Place(true)
end
