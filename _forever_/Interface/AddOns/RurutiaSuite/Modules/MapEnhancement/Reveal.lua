-- Paints unexplored regions with client map tiles through an RS-private texture pool.
-- Difference-set approach: native keeps explored overlays, RS only fills the gaps.
-- No native pool borrowing, no resetter replacement, no exploration-state writes.
--
-- Native map tiles are available in the fixed beta client. Keep the private
-- pool, exploration difference set, tint and bounded texture-load verification.
local _, ns = ...
if not ns.Build.HasModule("MapEnhancement") then return end

local Adapter = ns.MapEnhancementAdapter
local ceil = math.ceil
local LOAD_ATTEMPTS, LOAD_INTERVAL = 4, 0.25
local DEFAULT_MASK_R, DEFAULT_MASK_G, DEFAULT_MASK_B = 0, 0, 0
local DEFAULT_MASK_OPACITY = 0.35

local function ClampUnit(value, fallback)
    if type(value) ~= "number" or value ~= value then return fallback end
    return math.max(0, math.min(1, value))
end

-- Compute the tint directly; no per-repaint style table.
local function MaskTint(owner)
    local profile = owner and owner:GetProfile()
    local color = profile and profile.unexploredColor
    if type(color) ~= "table" then color = nil end
    local amount = ClampUnit(profile and profile.unexploredOpacity, DEFAULT_MASK_OPACITY)
    return 1 - amount * (1 - ClampUnit(color and color.r, DEFAULT_MASK_R)),
        1 - amount * (1 - ClampUnit(color and color.g, DEFAULT_MASK_G)),
        1 - amount * (1 - ClampUnit(color and color.b, DEFAULT_MASK_B))
end

local Reveal = { pins = {}, free = {}, used = {}, state = "off", failed = 0,
    shown = 0, replaced = 0, pending = 0, source = nil }

local function OverlayKey(width, height, x, y)
    return width .. ":" .. height .. ":" .. x .. ":" .. y
end

-- Pure geometry: mirrors the native RefreshOverlays slicing contract
-- (wow-ui-source forever 1.60.1 MapExplorationDataProvider.lua lines 97-185).
-- Returns a tile list in row-major order, or nil plus a machine-readable reason.
function Reveal.ComputeTiles(width, height, x, y, fileDataIDs, tileWidth, tileHeight, scratch)
    if type(width) ~= "number" or type(height) ~= "number" or width <= 0 or height <= 0
        or type(x) ~= "number" or type(y) ~= "number"
        or type(tileWidth) ~= "number" or type(tileHeight) ~= "number"
        or tileWidth <= 0 or tileHeight <= 0 then
        return nil, "invalid-geometry"
    end
    if type(fileDataIDs) ~= "table" then
        return nil, "invalid-tiles"
    end
    local nx, ny = ceil(width / tileWidth), ceil(height / tileHeight)
    if #fileDataIDs ~= nx * ny then
        return nil, "tile-count-mismatch"
    end
    local result, count = scratch or {}, 0
    for j = 1, ny do
        local pixelHeight, fileHeight
        if j < ny then
            pixelHeight, fileHeight = tileHeight, tileHeight
        else
            pixelHeight = height % tileHeight
            if pixelHeight == 0 then pixelHeight = tileHeight end
            fileHeight = 16
            while fileHeight < pixelHeight do fileHeight = fileHeight * 2 end
        end
        for k = 1, nx do
            local pixelWidth, fileWidth
            if k < nx then
                pixelWidth, fileWidth = tileWidth, tileWidth
            else
                pixelWidth = width % tileWidth
                if pixelWidth == 0 then pixelWidth = tileWidth end
                fileWidth = 16
                while fileWidth < pixelWidth do fileWidth = fileWidth * 2 end
            end
            count = count + 1
            local tile = result[count]
            if not tile then tile = {}; result[count] = tile end
            tile.width, tile.height = pixelWidth, pixelHeight
            tile.u, tile.v = pixelWidth / fileWidth, pixelHeight / fileHeight
            tile.x, tile.y = x + tileWidth * (k - 1), -(y + tileHeight * (j - 1))
            tile.fileDataID = fileDataIDs[(j - 1) * nx + k]
        end
    end
    return result, nil, count
end

function Reveal:Bind(owner)
    self.owner = owner
end

function Reveal:IsActive()
    local owner = self.owner
    return owner ~= nil and owner.runtimeActive == true
        and owner:GetProfile().showUnexplored == true
        and Adapter:GetRevealConflict() == nil
end

function Reveal:Acquire(pin, drawLayer, subLevel)
    local record = table.remove(self.free)
    if not record then
        record = { terrain = pin:CreateTexture(nil, drawLayer, nil, subLevel) }
    end
    if record.drawLayer ~= drawLayer or record.subLevel ~= subLevel then
        record.terrain:SetDrawLayer(drawLayer, subLevel)
        record.drawLayer, record.subLevel = drawLayer, subLevel
    end
    self.used[#self.used + 1] = record
    return record
end

function Reveal:CancelLoadWatch()
    self.loadGeneration = (self.loadGeneration or 0) + 1
    if self.loadTimer and type(self.loadTimer.Cancel) == "function" then
        self.loadTimer:Cancel()
    end
    self.loadTimer, self.loadPending, self.loadAttempts, self.loadStats = nil, nil, 0, nil
end

function Reveal:IsLoaded(texture)
    -- Missing or broken load-state reporting must never expose placeholders.
    if type(texture.IsObjectLoaded) ~= "function" then return false end
    local ok, loaded = pcall(texture.IsObjectLoaded, texture)
    if not ok then return false end
    return loaded == true
end

function Reveal:ReleaseAll()
    -- Stale load callbacks must never restore a released tile.
    self:CancelLoadWatch()
    -- Reverse release keeps each physical texture in the same draw slot on reuse.
    for i = #self.used, 1, -1 do
        local record = self.used[i]
        -- The canvas mask registration stays attached, matching native pool reuse;
        -- removing it would break AddMaskableTexture's early-return on re-acquire.
        local terrain = record.terrain
        terrain:Hide()
        -- Private, hidden textures keep their applied geometry/tint for reuse.
        self.free[#self.free + 1] = record
    end
    for i = #self.used, 1, -1 do self.used[i] = nil end
    self.shown, self.replaced, self.pending, self.source = 0, 0, 0, nil
end

function Reveal:FindPins(map)
    for i = #self.pins, 1, -1 do self.pins[i] = nil end
    if type(map.EnumeratePinsByTemplate) ~= "function" then return self.pins end
    for pin in map:EnumeratePinsByTemplate("MapExplorationPinTemplate") do
        self.pins[#self.pins + 1] = pin
    end
    return self.pins
end

function Reveal:EnsureHooks(map)
    -- Map lifecycle observers are shared by Core; this observes overlay refresh only.
    for _, pin in ipairs(self.pins) do
        if not self.pinHooks then self.pinHooks = {} end
        if not self.pinHooks[pin] then
            self.pinHooks[pin] = self.owner:ObserveMapFunction(pin, "RefreshOverlays",
                function() self:Paint() end, "MapEnhancement:reveal-refresh")
        end
    end
end

function Reveal:Unhook()
    for pin, token in pairs(self.pinHooks or {}) do
        self.owner:RemoveMapObserver(token)
        self.pinHooks[pin] = nil
    end
end

function Reveal:SetState(state, failed)
    failed = failed or 0
    if self.state == state and self.failed == failed then return end
    self.state, self.failed = state, failed
    if self.owner and self.owner.RefreshSettings then self.owner:RefreshSettings() end
end

local function ReadExploration(map, mapID)
    local container = map.GetCanvasContainer and map:GetCanvasContainer()
    return _G.C_Map.GetMapArtID(mapID),
        _G.C_MapExplorationInfo.GetExploredMapTextures(mapID),
        _G.C_Map.GetMapArtLayers(mapID), container,
        container and container:GetCurrentLayerIndex()
end

function Reveal:DrawPin(pin, stats)
    local data = ns.MapRevealData
    local map = pin.GetMap and pin:GetMap()
    if not data or not map or type(map.GetMapID) ~= "function" then return "unsupported" end
    if type(_G.C_Map) ~= "table" or type(_G.C_Map.GetMapArtID) ~= "function"
        or type(_G.C_Map.GetMapArtLayers) ~= "function"
        or type(_G.C_MapExplorationInfo) ~= "table"
        or type(_G.C_MapExplorationInfo.GetExploredMapTextures) ~= "function" then
        return "unsupported"
    end
    local mapID = map:GetMapID()
    -- Distinguish a missing/broken native API from a normal nil (nothing explored).
    local ok, artID, explored, layers, container, layerIndex = pcall(ReadExploration, map, mapID)
    if not ok then return "unavailable" end
    local bucket = artID and data.arts[artID]
    local failed = 0
    for _, gap in ipairs(data.missing or {}) do
        if gap.artID == artID and gap.mapID == mapID
            and (gap.reason == "no-tile-records" or gap.reason == "zero-size-records") then
            failed = failed + 1
            stats.failed = stats.failed + 1
        end
    end
    if not bucket then return failed > 0 and "partial" or "no-data", failed end
    if type(layers) ~= "table" or type(layerIndex) ~= "number" then return "unavailable" end
    local layerInfo = layers[layerIndex]
    if type(layerInfo) ~= "table" or type(layerInfo.tileWidth) ~= "number"
        or type(layerInfo.tileHeight) ~= "number"
        or layerInfo.tileWidth <= 0 or layerInfo.tileHeight <= 0 then
        return "unavailable"
    end
    local exploredSet = self.exploredSet or {}
    self.exploredSet = exploredSet
    for key in pairs(exploredSet) do exploredSet[key] = nil end
    -- One reusable overlay workspace, never a cache per map or per repaint.
    self.tileScratch = self.tileScratch or {}
    if type(explored) == "table" then
        for _, info in ipairs(explored) do
            exploredSet[OverlayKey(info.textureWidth, info.textureHeight,
                info.offsetX, info.offsetY)] = true
        end
    end
    local drawLayer, subLevel = "ARTWORK", 0
    if pin.dataProvider and type(pin.dataProvider.GetDrawLayer) == "function" then
        drawLayer, subLevel = pin.dataProvider:GetDrawLayer()
    end
    -- Reveal tiles stay one sublevel below native explored overlays.
    local terrainLevel = (subLevel or 0) - 1
    local tintR, tintG, tintB = MaskTint(self.owner)
    local maskable = type(map.AddMaskableTexture) == "function"
    for _, overlay in ipairs(bucket.overlays) do
        local id, width, height, x, y, fileDataIDs = overlay[1], overlay[2], overlay[3],
            overlay[4], overlay[5], overlay[7]
        if not exploredSet[OverlayKey(width, height, x, y)] then
            local tiles, reason, tileCount = Reveal.ComputeTiles(width, height, x, y,
                fileDataIDs, layerInfo.tileWidth, layerInfo.tileHeight, self.tileScratch)
            if not tiles then
                failed = failed + 1
                stats.failed = stats.failed + 1
            else
                for tileIndex = 1, tileCount do
                    local tile = tiles[tileIndex]
                    local record = self:Acquire(pin, drawLayer, terrainLevel)
                    local terrain = record.terrain
                    if maskable then map:AddMaskableTexture(terrain) end
                    if record.width ~= tile.width then terrain:SetWidth(tile.width); record.width = tile.width end
                    if record.height ~= tile.height then terrain:SetHeight(tile.height); record.height = tile.height end
                    if record.u ~= tile.u or record.v ~= tile.v then
                        terrain:SetTexCoord(0, tile.u, 0, tile.v)
                        record.u, record.v = tile.u, tile.v
                    end
                    if record.x ~= tile.x or record.y ~= tile.y then
                        terrain:ClearAllPoints()
                        terrain:SetPoint("TOPLEFT", tile.x, tile.y)
                        record.x, record.y = tile.x, tile.y
                    end
                    local asset = Adapter:ResolveRevealTexture(tile.fileDataID)
                    local applied = false
                    if asset then applied = terrain:SetTexture(asset, nil, nil, "TRILINEAR") end
                    if applied == false then
                        -- Never surface a placeholder block for a missing asset.
                        terrain:Hide()
                        failed = failed + 1
                        stats.failed = stats.failed + 1
                    else
                        if record.r ~= tintR or record.g ~= tintG or record.b ~= tintB then
                            terrain:SetVertexColor(tintR, tintG, tintB, 1)
                            terrain:SetAlpha(1)
                            record.r, record.g, record.b = tintR, tintG, tintB
                        end
                        -- Never show an unloaded tile: the client would draw its
                        -- placeholder (the green block) until the art arrives.
                        -- The native pin does the same by keeping its overlays
                        -- transparent until textureLoadGroup:IsFullyLoaded().
                        if self:IsLoaded(terrain) then
                            terrain:Show()
                            stats.shown = stats.shown + 1
                        else
                            terrain:Hide()
                            stats.pending = stats.pending + 1
                            stats.pendingRecords[#stats.pendingRecords + 1] = record
                        end
                    end
                end
            end
        end
    end
    return failed > 0 and "partial" or "ok", failed
end

local function StateFor(stats)
    if stats.shown == 0 and stats.failed > 0 then return "missing" end
    if stats.failed > 0 then return "partial" end
    return "ok"
end

function Reveal:ApplyPaintState(stats, structural)
    -- Per-pin "ok"/"partial" only describes that pin; the aggregate matters.
    local state = StateFor(stats)
    if structural and structural ~= "ok" and structural ~= "partial" then state = structural end
    if stats.pending > 0 then state = "loading" end
    self.shown, self.replaced, self.pending = stats.shown, stats.replaced, stats.pending
    self.source = stats.shown > 0 and "native" or nil
    self:SetState(state, stats.failed)
end

function Reveal:WatchLoad(records, stats)
    -- Bounded verification only: a few deferred checks, no per-frame polling.
    -- Returns false when this client cannot report load state.
    if #records == 0 then return false end
    local timer = _G.C_Timer
    if type(timer) ~= "table" or type(timer.NewTimer) ~= "function" then return false end
    self:CancelLoadWatch()
    self.loadGeneration = (self.loadGeneration or 0) + 1
    local generation = self.loadGeneration
    self.loadPending, self.loadStats, self.loadAttempts = records, stats, 0
    local function Check()
        if generation ~= self.loadGeneration or self.loadStats ~= stats then return end
        self.loadAttempts = (self.loadAttempts or 0) + 1
        local remaining, lost, shown = {}, 0, 0
        for _, record in ipairs(self.loadPending or {}) do
            if self:IsLoaded(record.terrain) then
                -- Loaded in time: it may be shown now.
                record.terrain:Show()
                shown = shown + 1
            elseif self.loadAttempts >= LOAD_ATTEMPTS then
                record.terrain:Hide()
                lost = lost + 1
            else
                remaining[#remaining + 1] = record
            end
        end
        stats.pending = #remaining
        stats.shown = stats.shown + shown
        stats.failed = stats.failed + lost
        self.loadPending = remaining
        if #remaining > 0 then
            self.loadTimer = timer.NewTimer(LOAD_INTERVAL, Check)
        else
            self.loadTimer, self.loadStats = nil, nil
            self:ApplyPaintState(stats)
        end
    end
    self.loadTimer = timer.NewTimer(LOAD_INTERVAL, Check)
    return true
end

function Reveal:Paint()
    self:ReleaseAll()
    if not self:IsActive() then
        self:SetState("off")
        return
    end
    local map = Adapter:Resolve()
    if not map or not map:IsVisible() then
        self:SetState("waiting-map")
        return
    end
    if #self.pins == 0 then
        self:SetState("waiting-map")
        return
    end
    local stats = { shown = 0, failed = 0, replaced = 0, pending = 0, pendingRecords = {} }
    local worst = nil
    for _, pin in ipairs(self.pins) do
        local state = self:DrawPin(pin, stats)
        if state ~= "ok" and worst == nil then worst = state end
    end
    if stats.pending > 0 and not self:WatchLoad(stats.pendingRecords, stats) then
        stats.pending = 0
    end
    self:ApplyPaintState(stats, worst)
end

function Reveal:DropMapWatch()
    for _, token in ipairs(self.mapWatch or {}) do
        if self.owner then self.owner:RemoveMapObserver(token) end
    end
    self.mapWatch = nil
end

-- 窗口移动交给 BlizzMove 时，控制器不会挂地图开关。未探索自己听显示和隐藏。
function Reveal:EnsureMapWatch()
    local yieldWindow = Adapter:GetConflict() ~= nil and Adapter:GetRevealConflict() == nil
    if not yieldWindow then
        self:DropMapWatch()
        return
    end
    if self.mapWatch or not self.owner then return end
    local map = Adapter:Resolve()
    if not map then return end
    self.mapWatch = {
        self.owner:ObserveMapScript(map, "OnShow", function() self:Sync() end, "MapEnhancement:reveal-show"),
        self.owner:ObserveMapScript(map, "OnHide", function() self:Sync() end, "MapEnhancement:reveal-hide"),
    }
end

function Reveal:Sync()
    if not self:IsActive() then
        self:DropMapWatch()
        self:Unhook()
        self:ReleaseAll()
        self.tileScratch, self.exploredSet = nil, nil
        self:SetState("off")
        return
    end
    self:EnsureMapWatch()
    local map = Adapter:Resolve()
    if not map or not map:IsVisible() then
        self:Unhook()
        self:ReleaseAll()
        self:SetState("waiting-map")
        return
    end
    self:FindPins(map)
    if #self.pins == 0 then
        self:ReleaseAll()
        self:SetState("waiting-map")
        return
    end
    self:EnsureHooks(map)
    self:Paint()
end

local STATUS = {
    ok = "未探索区域已按遮罩显示。",
    partial = "当前地图部分区域缺少数据或原生贴图，已跳过，不影响其他区域。",
    missing = "当前地图的未探索素材不可用，已跳过；已探索区域不受影响。",
    loading = "未探索区域素材加载中…",
    ["waiting-map"] = "打开世界地图后显示未探索区域。",
    ["no-data"] = "当前地图没有可揭示的未探索区域数据。",
    unsupported = "当前环境不支持未探索区域显示。",
    unavailable = "原生探索数据暂不可用，未探索显示已暂停。",
}

function Reveal:GetStatusText()
    if self.state == "off" then return nil end
    local text = STATUS[self.state]
    return text
end

ns.MapEnhancementReveal = Reveal
