Merfin = Merfin or {}
Merfin.Localizations = Merfin.Localizations or {}

-- Add or override keys for a specific locale
function Merfin:AddLocaleLang(locale, data)
    local dst = self.Localizations[locale] or {}
    for k, v in pairs(data) do
        dst[k] = v
    end
    self.Localizations[locale] = dst
end

-- Set fallback to enUS for any missing keys
function Merfin:FinalizeLocales(defaultLocale)
    local baseLocale = defaultLocale or 'enUS'
    local base = self.Localizations[baseLocale] or {}
    for locale, tbl in pairs(self.Localizations) do
        if locale ~= baseLocale then
            setmetatable(tbl, { __index = base })
        end
    end
end

function Merfin:L(key, vars, localeOverride)
    local locs   = self.Localizations or {}
    local locale = localeOverride or (GetLocale and GetLocale()) or 'enUS'
    local cur    = locs[locale] or {}
    local base   = locs.enUS or {}

    -- pick value with fallback to enUS, then to key itself
    local s = (cur[key] ~= nil and cur[key]) or base[key] or key
    if not vars then return s end

    -- named tokens: %{name}
    if type(vars) == 'table' then
        s = s:gsub("%%{(%w+)}", function(k)
            local v = vars[k]
            return v ~= nil and tostring(v) or ""
        end)
        -- positional tokens via array part: %s, %d, etc.
        if vars[1] ~= nil then
            s = string.format(s, unpack(vars))
        end
    end
    return s
end