local _, ns = ...
if not ns.Build.Is("classic-infinite") then return end
local Adapter = {}
-- issecretvalue is documented SecretArguments=AllowedWhenUntainted, so addon
-- code may be refused when it is handed a secret. Run it protected: an error
-- means "cannot tell", which is handled as hidden (shown unread, white).
local function Plain(value)
    local probe = _G.issecretvalue
    if type(probe) ~= "function" then return true end
    local ok, secret = pcall(probe, value)
    if not ok then return false end
    return not secret
end
function Adapter:GetRoot() return _G.UIParent end
function Adapter:InCombat() return _G.InCombatLockdown() end
function Adapter:GetFont()
    return ns.Font and ns.Font:GetPath("nameplateTarget") or _G.STANDARD_TEXT_FONT
end
function Adapter:GetPlates()
    return _G.C_NamePlate.GetNamePlates()
end
-- Restricted instances may hide even plain-looking booleans. Each check is
-- tri-state: only a readable `false` rejects; a hidden answer counts as "yes"
-- so the label is never lost to a guard that cannot be read.
local function Readable(value)
    if Plain(value) then return value end
    return nil
end
local function Call(fn, ...)
    local ok, a, b = pcall(fn, ...)
    if ok then return a, b end
    return nil
end
local function Token(value)
    if Plain(value) and type(value) == "string" and value ~= "" then return value end
end
function Adapter:GetUnit(plate)
    -- Forever keeps the token in unitToken; Retail-style clients in namePlateUnitToken.
    return Token(plate.unitToken) or Token(plate.namePlateUnitToken)
        or Token(plate.UnitFrame and plate.UnitFrame.unit)
end
local function CanAttack(unit)
    return Readable(Call(_G.UnitCanAttack, "player", unit)) ~= false
end
function Adapter:GetAnchor(unit)
    if not CanAttack(unit) then return nil end
    local plate = _G.C_NamePlate.GetNamePlateForUnit(unit)
    if not plate or (plate.IsForbidden and plate:IsForbidden()) then return nil end
    if ns.NameplateTargetIntegration then
        local anchor = ns.NameplateTargetIntegration:GetAnchor(unit, plate)
        if anchor then return anchor, false end
    end
    local frame = plate.UnitFrame
    local bar = frame and (frame.healthBar or frame.HealthBar)
    -- Second value: the native bar is in use (label is nudged up and enlarged).
    if bar then return bar, true end
end
-- Returns found, name, r, g, b, nameSecret, colorSecret. `found` is a plain boolean so callers
-- never boolean-test a secret name. In restricted instances a hostile plate's
-- compound token (nameplateNtarget) yields a secret name: it is not readable
-- but FontString:SetText accepts it (SecretArguments=AllowedWhenTainted), so
-- hand it straight to SetText and never compare, concatenate or index with it.
function Adapter:GetTarget(unit)
    if Readable(Call(_G.UnitExists, unit)) == false or not CanAttack(unit) then return false end
    local target = unit .. "target"
    if Readable(Call(_G.UnitExists, target)) == false then return false end
    local name = Call(_G.UnitName, target)
    local nameSecret = not Plain(name)
    if not nameSecret and (type(name) ~= "string" or name == "") then return false end
    local r, g, b, colorSecret = 1, 1, 1, false
    if Readable(Call(_G.UnitIsPlayer, target)) == true then
        local _, class = Call(_G.UnitClass, target)
        if Plain(class) then
            local c = type(class) == "string" and _G.RAID_CLASS_COLORS[class]
            if c then r, g, b = c.r, c.g, c.b end
        elseif type(class) == "string" and _G.C_ClassColor then
            -- Platynator (Forever branch) hands the hidden class straight to
            -- GetClassColor and feeds the result to SetTextColor. The channels
            -- may come back hidden: pass them on unread, and fall back to white.
            local ok, cr, cg, cb = pcall(function()
                local c = _G.C_ClassColor.GetClassColor(class)
                if type(c) == "table" then return c.r, c.g, c.b end
            end)
            if ok and type(cr) == "number" and type(cg) == "number" and type(cb) == "number" then
                r, g, b = cr, cg, cb
                colorSecret = not (Plain(cr) and Plain(cg) and Plain(cb))
            end
        end
    end
    return true, name, r, g, b, nameSecret, colorSecret
end
ns.NameplateTargetAdapter = Adapter
