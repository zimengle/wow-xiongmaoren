local _, ns = ...

local Definition = ns.ChatBarDefinition
if type(Definition) ~= "table" then
    ns.ChatBarRegistrationError = ns.ChatBarUnavailableReason or "ChatBar Definition is unavailable"
    return
end
if type(ns.ChatBarView) ~= "table" or type(ns.ChatBarEmoji) ~= "table"
    or not ns.ChatBarPopupMenu or type(ns.ChatBarTooltip) ~= "table"
    or type(ns.ChatBarSettings) ~= "table" then
    error("ChatBar View, Emoji, PopupMenu, Tooltip, and Settings must load before Core.lua", 2)
end

local module, reason = ns.RegisterModule("ChatBar", Definition)
if module then
    ns.ChatBar = module
else
    ns.ChatBarRegistrationError = reason
end
