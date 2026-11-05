-- Supplements native area labels; never replaces the map's OnUpdate or providers.
local _, ns = ...
if not ns.Build.HasModule("MapEnhancement") then return end

local Adapter = ns.MapEnhancementAdapter
local Levels = {}
local HOOK_KEYS = { "showHook", "hideHook", "providerHook" }

function Levels:Bind(owner) self.owner = owner end

function Levels:ApplyOutline(label)
    local text = label.Name
    if not text or type(text.GetFont) ~= "function" or type(text.SetFont) ~= "function" then return end
    local face, size, flags = text:GetFont()
    if face and size and flags ~= "OUTLINE" and text:SetFont(face, size, "OUTLINE") ~= false then
        self.fontState = { text = text, face = face, size = size, flags = flags }
    end
end

function Levels:RestoreOutline()
    local state = self.fontState
    self.fontState = nil
    if not state then return end
    local face, size, flags = state.text:GetFont()
    -- Restore only our own style; another addon may have changed the font meanwhile.
    if face == state.face and size == state.size and flags == "OUTLINE" then
        state.text:SetFont(state.face, state.size, state.flags or "")
    end
end

function Levels:Restore()
    local label = self.label
    local entry = label and label.labelInfoByType and label.labelInfoByType[Adapter:GetAreaLabelType()]
    if self.applied and entry and entry.name == self.applied then
        self.writing = true
        label:SetLabel(Adapter:GetAreaLabelType(), self.original, entry.description,
            entry.nameColor, entry.descriptionColor, entry.textureInfo)
        self.writing = false
        label:EvaluateLabels()
    end
    self.original, self.applied = nil, nil
end

function Levels:DetachLabel()
    if self.labelHook then self.owner:RemoveMapObserver(self.labelHook) end
    self.labelHook = nil
    self:Restore()
    self:RestoreOutline()
    self.label, self.cache = nil, nil
end

function Levels:OnLabel(label, kind, name, description, nameColor, descriptionColor, textureInfo)
    if self.writing or kind ~= Adapter:GetAreaLabelType() or type(name) ~= "string" or name == "" then return end
    if not self.owner.runtimeActive or not self.owner:GetProfile().showZoneLevels then return end
    local map = self.map
    if not map or not map:IsShown() or not map:IsCanvasMouseFocus() then return end
    local mapID, x, y = Adapter:GetLabelPosition(map)
    if not mapID then return end
    local playerLevel = UnitLevel("player")
    local cache = self.cache
    if not cache or cache.mapID ~= mapID or cache.x ~= x or cache.y ~= y
        or cache.name ~= name or cache.playerLevel ~= playerLevel then
        local info = Adapter:GetMapAtPosition(mapID, x, y)
        local range = info and info.mapID ~= mapID and info.name == name
            and ns.MapZoneLevels[info.mapID]
        -- Matching the undecorated native name also avoids doubling native/other labels.
        local text
        if range then
            if cache and cache.name == name and cache.playerLevel == playerLevel
                and cache.minimum == range[1] and cache.maximum == range[2] then
                text = cache.text
            else
                text = Adapter:FormatZoneLevels(name, range[1], range[2], playerLevel)
            end
        end
        cache = cache or {}
        cache.minimum, cache.maximum = range and range[1], range and range[2]
        cache.mapID, cache.x, cache.y = mapID, x, y
        cache.name, cache.playerLevel, cache.text = name, playerLevel, text
        self.cache = cache -- one entry; no per-zone or time-based growth
    end
    self.original, self.applied = nil, nil
    if not cache.text then return end
    self.original, self.applied = name, cache.text
    self.writing = true
    label:SetLabel(kind, cache.text, description, nameColor, descriptionColor, textureInfo)
    self.writing = false
end

function Levels:AttachLabel()
    local label = self.map and self.map:IsShown() and Adapter:ResolveAreaLabel(self.map)
    if label == self.label then return end
    self:DetachLabel()
    if not label then return end
    self.label = label
    self:ApplyOutline(label)
    self.labelHook = self.owner:ObserveMapFunction(label, "SetLabel", function(_, ...)
        self:OnLabel(...)
    end, "MapEnhancement.ZoneLevels")
end

function Levels:Detach()
    self:DetachLabel()
    for _, key in ipairs(HOOK_KEYS) do
        if self[key] then self.owner:RemoveMapObserver(self[key]); self[key] = nil end
    end
    self.map = nil
end

function Levels:Sync()
    local owner = self.owner
    local map = owner and owner.runtimeActive and owner:GetProfile().showZoneLevels
        and not Adapter:GetRevealConflict() and Adapter:Resolve()
    if not map or not Adapter:CanShowZoneLevels(map) then self:Detach(); return end
    if map ~= self.map then
        self:Detach()
        self.map = map
        self.showHook = owner:ObserveMapScript(map, "OnShow", function() self:AttachLabel() end)
        self.hideHook = owner:ObserveMapScript(map, "OnHide", function() self:DetachLabel() end)
        self.providerHook = owner:ObserveMapFunction(map, "AddDataProvider", function() self:AttachLabel() end)
    end
    self:AttachLabel()
end

ns.MapEnhancementZoneLevels = Levels
