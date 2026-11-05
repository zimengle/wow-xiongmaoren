local _, RS = ...

local Presentation = RS.Presentation or {}
RS.Presentation = Presentation

local Media = {}
Media.__index = Media

local RURUTIA_FONT_KEY = "RS Rurutia"
local RURUTIA_FONT_PATH = "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
local ALL_LOCALES_MASK = 255

local function ResolveDefaultProvider()
    local libStub = _G.LibStub
    if libStub == nil then
        return nil
    end
    local ok, provider = pcall(function()
        return libStub("LibSharedMedia-3.0", true)
    end)
    if ok and type(provider) == "table" then
        return provider
    end
    return nil
end

local function ClearTable(target)
    for key in pairs(target) do
        target[key] = nil
    end
end

function Media:New(options)
    options = options or {}
    local instance = setmetatable({}, self)
    instance.providerResolver = options.providerResolver or ResolveDefaultProvider
    instance.createFrame = options.createFrame
    instance.parent = options.parent
    instance.provider = nil
    instance.fontCache = {}
    instance.fontNames = {}
    instance.fontNamesReady = false
    instance.fetches = 0
    instance.listScans = 0
    instance.providerGeneration = 0
    instance.warmFrame = nil
    instance.warmText = nil
    instance.warmCalls = 0
    instance:RefreshProvider(options.provider)
    return instance
end

function Media:RefreshProvider(provider)
    if provider == nil and self.providerResolver then
        provider = self.providerResolver()
    elseif provider == false then
        provider = nil
    end
    if provider ~= nil and type(provider) ~= "table" then
        provider = nil
    end

    self.provider = provider
    self.providerGeneration = self.providerGeneration + 1
    ClearTable(self.fontCache)
    ClearTable(self.fontNames)
    self.fontNamesReady = false

    if provider and type(provider.Register) == "function" then
        pcall(provider.Register, provider, "font", RURUTIA_FONT_KEY, RURUTIA_FONT_PATH, ALL_LOCALES_MASK)
    end
    return provider ~= nil
end

function Media:GetProvider()
    return self.provider
end

function Media:GetRurutiaFontName()
    return RURUTIA_FONT_KEY
end

function Media:GetRurutiaFontPath()
    return self:FetchFont(RURUTIA_FONT_KEY) or RURUTIA_FONT_PATH
end

function Media:FetchFont(name)
    if type(name) ~= "string" or name == "" then
        return nil
    end

    local cached = self.fontCache[name]
    if cached ~= nil then
        return cached or nil
    end

    local path
    local provider = self.provider
    if provider and type(provider.Fetch) == "function" then
        local ok, result = pcall(provider.Fetch, provider, "font", name, true)
        if ok and type(result) == "string" and result ~= "" then
            path = result
        end
    end
    self.fetches = self.fetches + 1
    self.fontCache[name] = path or false
    return path
end

function Media:GetFontNames(reusableResult)
    if not self.fontNamesReady then
        ClearTable(self.fontNames)
        local provider = self.provider
        if provider and type(provider.HashTable) == "function" then
            local ok, registered = pcall(provider.HashTable, provider, "font")
            if ok and type(registered) == "table" then
                for name, path in pairs(registered) do
                    if type(name) == "string" and type(path) == "string" and path ~= "" then
                        self.fontNames[#self.fontNames + 1] = name
                    end
                end
                table.sort(self.fontNames)
            end
        end
        self.fontNamesReady = true
        self.listScans = self.listScans + 1
    end

    local result = reusableResult or {}
    local index = 1
    while index <= #self.fontNames do
        result[index] = self.fontNames[index]
        index = index + 1
    end
    index = #result
    while index > #self.fontNames do
        result[index] = nil
        index = index - 1
    end
    return result
end

function Media:WarmFont(fontPath, size, flags, text)
    local createFrame = self.createFrame or _G.CreateFrame
    local parent = self.parent or _G.UIParent
    if type(createFrame) ~= "function" or parent == nil then
        return false
    end

    fontPath = fontPath or self:GetRurutiaFontPath()
    local resolvedSize = tonumber(size) or 20
    if resolvedSize ~= resolvedSize or resolvedSize <= 0 or resolvedSize > 200 then
        resolvedSize = 20
    end
    local resolvedFlags = type(flags) == "string" and flags or ""
    local sampleText = type(text) == "string" and text or "00:00"

    if not self.warmFrame then
        self.warmFrame = createFrame("Frame", nil, parent)
        self.warmFrame:SetSize(128, 32)
        self.warmFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
        if self.warmFrame.SetAlpha then
            self.warmFrame:SetAlpha(0.01)
        end
        self.warmText = self.warmFrame:CreateFontString(nil, "BACKGROUND")
        if self.warmText.SetAllPoints then
            self.warmText:SetAllPoints()
        end
        if self.warmText.SetTextColor then
            self.warmText:SetTextColor(1, 1, 1, 0.01)
        end
    end

    local ok, applied = pcall(self.warmText.SetFont, self.warmText, fontPath, resolvedSize, resolvedFlags)
    if not ok or applied == false then
        return false
    end
    self.warmText:SetText(sampleText)
    if self.warmText.GetStringWidth then
        self.warmText:GetStringWidth()
    end
    if self.warmText.GetStringHeight then
        self.warmText:GetStringHeight()
    end
    self.warmCalls = self.warmCalls + 1
    return true
end

function Media:GetDiagnostics()
    local cachedFonts = 0
    for _ in pairs(self.fontCache) do
        cachedFonts = cachedFonts + 1
    end
    return {
        provider = self.provider ~= nil,
        providerGeneration = self.providerGeneration,
        fetches = self.fetches,
        cachedFonts = cachedFonts,
        listScans = self.listScans,
        warmFrame = self.warmFrame ~= nil,
        warmCalls = self.warmCalls,
    }
end

Presentation.MediaClass = Media
