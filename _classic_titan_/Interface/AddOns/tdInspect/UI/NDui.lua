-- NDui.lua
-- @Author : Dencer (tdaddon@163.com)
--
if not _G.NDui then
    return
end

---@type ns
local ns = select(2, ...)

do
    local orig = ns.Addon.GetInspectGearFrame

    function ns.Addon:GetInspectGearFrame()
        local f = orig(self)
        f:ClearAllPoints()
        f:SetPoint('TOPLEFT', InspectPaperDollFrame, 'TOPRIGHT', 0, 0)
        ns.Addon.GetInspectGearFrame = orig
        return f
    end
end

if ns.Addon.OpenInspectGearFrame then
    hooksecurefunc(ns.Addon, 'OpenInspectGearFrame', function(self)
        if self.InspectGearFrame then
            C_Timer.After(0, function()
                if self.InspectGearFrame and self.InspectGearFrame:IsShown() then
                    self.InspectGearFrame:ClearAllPoints()
                    self.InspectGearFrame:SetPoint('TOPLEFT', InspectPaperDollFrame, 'TOPRIGHT', 1, -1)
                end
            end)
        end
    end)
end

