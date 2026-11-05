local _, ns = ...

-- RSS canvas routing is evaluated only when an explicit caller asks for it.
-- Registered canvases stay generated in EditModePreset.lua; this module owns
-- only the live display/window fallback policy.
local Router = {}
ns.CanvasRouter = Router

local ROUTES = {
    ["standard-16x9"] = {
        physicalSizes = {{1920, 1080}, {2560, 1440}},
        windowReferenceSizes = {{1920, 1080}, {2560, 1440}},
        aspectRatio = {16, 9},
    },
    ["4k-16x9"] = {
        physicalSizes = {{3840, 2160}},
        windowReferenceSizes = {{3840, 2160}},
    },
    ["ultrawide-21x9"] = {
        physicalSizes = {{2560, 1080}, {3440, 1440}, {3840, 1600}, {5120, 2160}},
        windowReferenceSizes = {{2560, 1080}, {3440, 1440}, {3840, 1600}, {5120, 2160}},
    },
    ["2k-16x10"] = {
        physicalSizes = {{1680, 1050}, {1920, 1200}, {2560, 1600}},
        windowReferenceSizes = {{1680, 1050}, {1920, 1200}, {2560, 1600}},
        aspectRatio = {16, 10},
    },
}

local FALLBACK = {
    minWidthRatio = 0.90,
    minHeightRatio = 0.85,
    defaultCanvasId = "standard-16x9",
}

local function Round(value)
    value = tonumber(value)
    return value and math.floor(value + 0.5) or nil
end

local function RoundTo(value, digits)
    value = tonumber(value)
    if not value then return nil end
    local scale = 10 ^ (digits or 0)
    return math.floor(value * scale + 0.5) / scale
end

local function ParseResolution(value)
    if type(value) ~= "string" then return nil, nil end
    local width, height = string.match(value, "^(%d+)%s*[xX]%s*(%d+)")
    return Round(width), Round(height)
end

local function Catalog()
    local catalog = ns.EditModePresets
    return type(catalog) == "table" and catalog.canvases or nil
end

local function RouteFor(canvas)
    return type(canvas) == "table" and ROUTES[canvas.id] or nil
end

local function MatchesSizes(sizes, width, height)
    if type(sizes) ~= "table" then return false end
    local index
    for index = 1, #sizes do
        local size = sizes[index]
        if type(size) == "table" and size[1] == width and size[2] == height then return true end
    end
    return false
end

local function MatchesPhysicalSize(canvas, width, height)
    return MatchesSizes(canvas and canvas.physicalSizes, width, height)
        or MatchesSizes(RouteFor(canvas) and RouteFor(canvas).physicalSizes, width, height)
end

local function MatchesAspectRatio(canvas, width, height)
    local route = RouteFor(canvas)
    local ratio = route and route.aspectRatio
    return type(ratio) == "table" and type(ratio[1]) == "number"
        and type(ratio[2]) == "number" and width * ratio[2] == height * ratio[1]
end

local function FindCanvas(width, height)
    if type(width) ~= "number" or type(height) ~= "number" or width <= 0 or height <= 0 then
        return nil
    end
    local canvases = Catalog()
    if type(canvases) ~= "table" then return nil end
    local index
    for index = 1, #canvases do
        if MatchesPhysicalSize(canvases[index], width, height) then return canvases[index] end
    end
    for index = 1, #canvases do
        if MatchesAspectRatio(canvases[index], width, height) then return canvases[index] end
    end
end

local function FindCanvasById(id)
    local canvases = Catalog()
    if type(canvases) ~= "table" then return nil end
    local index
    for index = 1, #canvases do
        if canvases[index].id == id then return canvases[index] end
    end
end

local function IsAddOnLoaded(name)
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, name)
    return ok and loaded == true
end

-- NDui shares one retail layout at every resolution, including fallback.
-- Explicit canvas choices bypass this. Ellesmere still wins only when NDui is absent.
local function ResolveLoadedUI(canvas)
    if not canvas then return canvas end
    if IsAddOnLoaded("NDui") then
        local ndui = FindCanvasById("standard-16x9-ndui")
        if ndui then return ndui end
    end
    local ellesmere = FindCanvasById(canvas.id .. "-ellesmere")
    if ellesmere and IsAddOnLoaded("EllesmereUI") then return ellesmere end
    return canvas
end

local function FindWindowFallback(width, height)
    local canvases = Catalog()
    if type(canvases) ~= "table" then return nil end
    local bestCanvas, bestScore
    local index, referenceIndex
    for index = 1, #canvases do
        local route = RouteFor(canvases[index])
        local references = route and route.windowReferenceSizes
        for referenceIndex = 1, #(references or {}) do
            local size = references[referenceIndex]
            local referenceWidth = type(size) == "table" and tonumber(size[1]) or nil
            local referenceHeight = type(size) == "table" and tonumber(size[2]) or nil
            if referenceWidth and referenceHeight and width <= referenceWidth and height <= referenceHeight then
                local widthRatio, heightRatio = width / referenceWidth, height / referenceHeight
                if widthRatio >= FALLBACK.minWidthRatio and heightRatio >= FALLBACK.minHeightRatio then
                    local score = (1 - widthRatio) + (1 - heightRatio)
                    if not bestScore or score < bestScore then
                        bestCanvas, bestScore = canvases[index], score
                    end
                end
            end
        end
    end
    return bestCanvas
end

local function ResolveFallback(snapshot)
    local width, height = snapshot.physicalWidth, snapshot.physicalHeight
    local displayWidth, displayHeight = snapshot.fullscreenWidth, snapshot.fullscreenHeight
    if type(displayWidth) == "number" and type(displayHeight) == "number"
        and width <= displayWidth and height <= displayHeight then
        local displayCanvas = FindCanvas(displayWidth, displayHeight)
        if displayCanvas then return displayCanvas, "display_fallback" end
    end
    local windowCanvas = FindWindowFallback(width, height)
    if windowCanvas then return windowCanvas, "window_fallback" end
    local defaultCanvas = FindCanvasById(FALLBACK.defaultCanvasId)
    if defaultCanvas then return defaultCanvas, "default_fallback" end
    return nil, "canvas-unsupported"
end

function Router:GetSnapshot()
    local physicalWidth, physicalHeight
    if type(_G.GetPhysicalScreenSize) == "function" then
        local ok, width, height = pcall(_G.GetPhysicalScreenSize)
        if ok then physicalWidth, physicalHeight = Round(width), Round(height) end
    end

    local logicalWidth, logicalHeight, effectiveScale
    local parent = _G.UIParent
    if parent then
        if type(parent.GetWidth) == "function" then
            local ok, value = pcall(parent.GetWidth, parent)
            if ok then logicalWidth = RoundTo(value, 2) end
        end
        if type(parent.GetHeight) == "function" then
            local ok, value = pcall(parent.GetHeight, parent)
            if ok then logicalHeight = RoundTo(value, 2) end
        end
        if type(parent.GetEffectiveScale) == "function" then
            local ok, value = pcall(parent.GetEffectiveScale, parent)
            if ok then effectiveScale = tonumber(value) end
        end
    end

    local useUiScale
    if type(_G.GetCVarBool) == "function" then
        local ok, value = pcall(_G.GetCVarBool, "useUiScale")
        if ok then useUiScale = value and true or false end
    end
    local uiScale
    if type(_G.GetCVar) == "function" then
        local ok, value = pcall(_G.GetCVar, "uiScale")
        if ok then uiScale = tonumber(value) end
    end

    local fullscreenWidth, fullscreenHeight, windowedWidth, windowedHeight
    if type(_G.GetCVar) == "function" then
        local ok, value = pcall(_G.GetCVar, "gxFullscreenResolution")
        if ok then fullscreenWidth, fullscreenHeight = ParseResolution(value) end
        ok, value = pcall(_G.GetCVar, "gxWindowedResolution")
        if ok then windowedWidth, windowedHeight = ParseResolution(value) end
    end

    return {
        physicalWidth = physicalWidth,
        physicalHeight = physicalHeight,
        logicalWidth = logicalWidth,
        logicalHeight = logicalHeight,
        effectiveScale = effectiveScale,
        useUiScale = useUiScale,
        uiScale = uiScale,
        fullscreenWidth = fullscreenWidth,
        fullscreenHeight = fullscreenHeight,
        windowedWidth = windowedWidth,
        windowedHeight = windowedHeight,
    }
end

function Router:IsAspectRatioFallback(canvas, snapshot)
    if type(canvas) ~= "table" then return false end
    snapshot = snapshot or self:GetSnapshot()
    local width, height = snapshot.physicalWidth, snapshot.physicalHeight
    if not width or not height then return false end
    return not MatchesPhysicalSize(canvas, width, height) and MatchesAspectRatio(canvas, width, height)
end

function Router:Resolve(snapshot, canvasId)
    snapshot = snapshot or self:GetSnapshot()
    if type(Catalog()) ~= "table" then return nil, "canvas-catalog-unavailable", snapshot end
    if canvasId ~= nil then
        local canvas = FindCanvasById(canvasId)
        if canvas then return canvas, nil, snapshot end
        return nil, "canvas-unsupported", snapshot
    end
    local width, height = snapshot.physicalWidth, snapshot.physicalHeight
    if not width or not height or width <= 0 or height <= 0 then
        local canvas = FindCanvasById(FALLBACK.defaultCanvasId)
        return ResolveLoadedUI(canvas), canvas and "default_fallback" or "canvas-catalog-unavailable", snapshot
    end
    if type(Catalog()) ~= "table" then return nil, "canvas-catalog-unavailable", snapshot end
    local canvas = FindCanvas(width, height)
    if canvas then return ResolveLoadedUI(canvas), nil, snapshot end
    local fallback, reason = ResolveFallback(snapshot)
    return ResolveLoadedUI(fallback), reason, snapshot
end

function Router:Describe(canvas, reason, snapshot)
    snapshot = snapshot or self:GetSnapshot()
    local size = tostring(snapshot.physicalWidth or "?") .. " × " .. tostring(snapshot.physicalHeight or "?")
    if canvas then
        local label = tostring(canvas.label or canvas.id)
        if reason == "display_fallback" then return size .. "（显示器兼容：使用" .. label .. "母版）" end
        if reason == "window_fallback" then return size .. "（窗口兼容：使用" .. label .. "母版）" end
        if reason == "default_fallback" then return size .. "（通用兜底：使用" .. label .. "母版）" end
        return size .. "（" .. label .. "）"
    end
    if reason == "canvas-unavailable" then return "无法读取当前分辨率" end
    return size .. "（暂未登记）"
end

return Router
