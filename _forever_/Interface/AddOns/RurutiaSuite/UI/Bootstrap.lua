local addonName, RS = ...

if type(RS) ~= "table" then
    error((addonName or "RurutiaSuite") .. ": UI requires the shared addon namespace")
end

local UI = RS.UI
if type(UI) ~= "table" then
    UI = {}
    RS.UI = UI
end

UI.VERSION = 1
