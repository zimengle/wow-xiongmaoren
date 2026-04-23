local Env = select(2, ...)

---Create glyphs table.
---@return table
function Env.CreateGlyphEntry()
    local glyphs = {
        major = {},
        minor = {},
    }

    if Env.IS_CLASSIC_WRATH then
        pcall(function()
            if not Env.IsAddOnLoaded("Blizzard_TalentUI") then
                Env.LoadAddOn("Blizzard_TalentUI")
            end
        end)
    end

    local getInfo = GetGlyphSocketInfo
    if type(getInfo) ~= "function" then
        return glyphs
    end

    local numSlots = NUM_GLYPH_SLOTS or 6
    for t = 1, numSlots do
        local enabled, glyphType, glyphTooltipIndex, glyphSpellID = getInfo(t)
        glyphSpellID = glyphSpellID or glyphTooltipIndex
        if enabled and glyphSpellID then
            local glyphtable = glyphType == 1 and glyphs.major or glyphs.minor
            table.insert(glyphtable, { spellID = glyphSpellID })
        end
    end

    return glyphs
end

---Create professions table.
function Env.CreateProfessionEntry()
    local professionNames = Env.professionNames
    local professions = {}

    for i = 1, GetNumSkillLines() do
        local name, _, _, skillLevel = GetSkillLineInfo(i)
        if professionNames[name] then
            table.insert(professions, {
                name = professionNames[name].engName,
                level = skillLevel,
            })
        end
    end

    return professions
end

---Create a string in the format "000..000-000..000-000..000".
---@return string
function Env.CreateTalentString()
    local GetTalentRank = Env.GetTalentRankOrdered
    local tabs = {}
    for tab = 1, GetNumTalentTabs() do
        local talents = {}
        for i = 1, GetNumTalents(tab) do
            local currRank = GetTalentRank(tab, i)
            table.insert(talents, tostring(currRank))
        end
        table.insert(tabs, table.concat(talents))
    end
    return table.concat(tabs, "-")
end
