local _, ns = ...
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "classic-infinite"
    and ns.Build.HasModule("ExtraTools")) then return end

-- MailLogger 2.1.5 keeps the active Config private. Its settings label is
-- anchored to its exact checkbox; the native click handler sets only EnableWhisper.
local labels = {
    ["Enable |cFF00CD00Whisper|r"] = true,
    ["启用|cFF00CD00交易密语|r"] = true,
    ["啟用|cFF00CD00交易密語|r"] = true,
    ["Включить |cFF00CD00шепот о торговле|r"] = true,
}

local function FindWhisper(panel, ...)
    local titled, box = false, nil
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region:IsObjectType("FontString") then
            local text = region:GetText()
            if text and text:match("^|cFFFF6633MailLogger|r v") then titled = true end
            if labels[text] then
                local _, target = region:GetPoint()
                if target and target:IsObjectType("CheckButton") and target:GetParent() == panel then box = target end
            end
        end
    end
    if titled then return box end
end

function ns.EnableMailLoggerWhisper()
    if not MailLoggerFrame or not MailLoggerDB then return end
    -- Only inspect direct children once at login. The settings frame is
    -- unnamed; never depend on creation order or a checkbox's child index.
    local siblings = { UIParent:GetChildren() }
    for i = #siblings, 1, -1 do
        local panel = siblings[i]
        if not panel:IsForbidden() and panel.texture and not panel:GetName() and panel:IsObjectType("Frame") then
            local box = FindWhisper(panel, panel:GetRegions())
            if box then
                local sync, set = box:GetScript("OnShow"), box:GetScript("OnClick")
                if sync and set then
                    sync(box)
                    if not box:GetChecked() then
                        box:SetChecked(true)
                        set(box)
                    end
                end
                return
            end
        end
    end
end
