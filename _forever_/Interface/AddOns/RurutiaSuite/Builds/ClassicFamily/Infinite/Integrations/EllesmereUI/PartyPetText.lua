local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
    and ns.Build.HasModule("ExtraTools")) then return end

local Style = { minOffset = -30, maxOffset = 30 }
ns.EllesmerePartyPetText = Style

-- Only Elles' pet text data is tracked. The shared header may later serve the raid.
local styled = setmetatable({}, { __mode = "k" })
local raid, pets, buttons
local textHook, headerHook, headerContext
local x, y

local function ApplyText(data)
    local plan, pool = data._txL, data._tx
    if not (plan and pool) then return end
    for _, entry in ipairs(plan.all) do
        local text = pool[entry.i]
        if text and entry.kind == "name" then
            raid.AnchorRFText(text, data._txHost, "center", x, y)
            styled[data] = true
        elseif text and (entry.kind == "hp" or (entry.kind == "custom" and entry.reads
            and entry.reads.hp and next(entry.reads) == "hp" and not next(entry.reads, "hp"))) then
            if text:IsShown() then text:Hide() end
            styled[data] = true
        end
    end
end

local function OnTextLayout(_, data, source)
    if not data._txFB then return end
    styled[data] = nil -- The native layout just restored its own anchors and visibility.
    if source ~= raid._scaledPartyProxy or not data._txHost then return end
    local provider = buttons.src[data._txHost:GetParent()]
    if provider == pets.PartySource or provider == pets.PvStyle
        or (provider == pets.StyleSource and pets.styleCtx == "party") then
        ApplyText(data)
    end
end

local function SyncHeader()
    local context = pets.styleCtx
    if context == headerContext then return end
    headerContext = context
    for _, frame in ipairs(pets.buttons) do
        local data = buttons.txs[frame]
        if data then
            if context == "party" then
                if not styled[data] then ApplyText(data) end
            elseif styled[data] then
                -- A context switch can leave the same native text plan in place.
                raid.RF_TextLayout(data, pets.StyleSource())
            end
        end
    end
end

function Style:GetOffset(owner, key)
    return ns.ExtraToolsData.ClampNumber(owner:GetProfile()[key], self.minOffset, self.maxOffset, 0)
end

function Style:Detach(owner)
    if not textHook then return end
    owner:RemoveHook(textHook)
    owner:RemoveHook(headerHook)
    for data in pairs(styled) do
        raid.RF_TextLayout(data, data._txS)
        styled[data] = nil
    end
    raid, pets, buttons, textHook, headerHook, headerContext = nil, nil, nil, nil, nil, nil
end

function Style:Sync(owner)
    if not owner.runtimeActive or owner:GetProfile().ellesmerePartyPetText == false then
        self:Detach(owner)
        return
    end

    local newX = self:GetOffset(owner, "ellesmerePartyPetNameX")
    local newY = self:GetOffset(owner, "ellesmerePartyPetNameY")
    if textHook then
        if x == newX and y == newY then return end
        x, y = newX, newY
        for data in pairs(styled) do ApplyText(data) end
        return
    end

    local eui = _G.EllesmereUI
    local provider = eui and eui._ModuleNS and eui._ModuleNS.EllesmereUIRaidFrames
    local pf, fb = provider and provider._PF, provider and provider._FB
    if not (pf and fb and type(provider.RF_TextLayout) == "function" and type(provider.AnchorRFText) == "function"
        and type(pf.Layout) == "function" and type(pf.StyleSource) == "function" and type(pf.PartySource) == "function"
        and type(pf.PvStyle) == "function" and pf.buttons and pf.ownerButtons and pf.pv and fb.src and fb.txs) then return end

    raid, pets, buttons, x, y = provider, pf, fb, newX, newY
    textHook = owner:HookSecureFunction(raid, "RF_TextLayout", OnTextLayout, "Elles party pet text")
    headerHook = owner:HookSecureFunction(pets, "Layout", SyncHeader, "Elles pet header context")
    SyncHeader()
    for _, frame in ipairs(pets.ownerButtons) do
        local data = buttons.txs[frame]
        if data then ApplyText(data) end
    end
    for _, frame in ipairs(pets.pv) do
        local data = buttons.txs[frame]
        if data and data._txS == raid._scaledPartyProxy then ApplyText(data) end
    end
end
