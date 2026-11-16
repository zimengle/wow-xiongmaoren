local _, ns = ...
local Data = ns.ChatBarData
local Adapter = {}

local canaccessvalue = _G.canaccessvalue

local function CanAccessValue(value)
    if type(value) == "nil" then return true end
    return not canaccessvalue or canaccessvalue(value)
end

local function AddTabCandidate(candidates, seen, chatType, channelTarget, recipient)
    local key = chatType
    if chatType == "CHANNEL" then
        if not CanAccessValue(channelTarget) then return end
        channelTarget = tonumber(channelTarget)
        if not channelTarget or channelTarget <= 0 then return end
        key = chatType .. ":" .. tostring(channelTarget)
    end
    if seen[key] then return end
    seen[key] = true
    candidates[#candidates + 1] = {
        chatType = chatType,
        channelTarget = channelTarget,
        recipient = recipient,
    }
end

function Adapter:SupportsTabChannelSwitch() return true end

function Adapter:IsNativeTabContext(chatType, text)
    if chatType == "COMMUNITIES_CHANNEL" then return true end
    if type(text) ~= "string" then return true end
    local textOK, first = pcall(string.sub, text, 1, 1)
    return not textOK or first == "/"
end

-- Blizzard returns one (number, name, disabled) triple per joined channel.
local function PublicKey(module, name)
    for _, key in ipairs(Data.tabChannelKeys) do
        if module.channels and module.channels[key] == name then return key end
    end
    return "channel:" .. name
end

function Adapter:GetInputChannels(module, tab)
    local choices = {}
    local function add(key, id, name, recipient)
        choices[#choices + 1] = {key = key, id = id, name = name, recipient = recipient}
    end
    add("SAY")
    add("YELL")
    add("EMOTE")
    if tab then
        local util = _G.ChatFrameUtil
        local seen = {}
        local function addRecipient(getter)
            if type(getter) ~= "function" then return end
            local ok, name, kind = pcall(getter)
            if ok and CanAccessValue(name) and CanAccessValue(kind) and type(name) == "string" and name ~= ""
                and (kind == "WHISPER" or kind == "BN_WHISPER") and not seen[kind] then
                seen[kind] = true
                add(kind, nil, nil, name)
            end
        end
        if util and not self:IsChatMessagingLocked() then
            addRecipient(util.GetLastToldTarget)
            addRecipient(util.GetLastTellTarget)
        end
    else
        add("WHISPER")
        add("BN_WHISPER")
    end
    local isInGroup = _G.IsInGroup
    local homeCategory = _G.LE_PARTY_CATEGORY_HOME
    local instanceCategory = _G.LE_PARTY_CATEGORY_INSTANCE
    local inHomeGroup = type(isInGroup) == "function" and homeCategory ~= nil
        and isInGroup(homeCategory) == true
    if type(isInGroup) == "function" and instanceCategory ~= nil
        and isInGroup(instanceCategory) == true then
        add("INSTANCE_CHAT")
    end
    if inHomeGroup then
        add("PARTY")
        if type(_G.IsInRaid) == "function" and _G.IsInRaid(homeCategory) == true then
            add("RAID")
            if (_G.UnitIsGroupLeader and _G.UnitIsGroupLeader("player")) or
                (_G.UnitIsGroupAssistant and _G.UnitIsGroupAssistant("player")) then add("RAID_WARNING") end
        end
    end

    if type(_G.IsInGuild) == "function" and _G.IsInGuild() == true then
        add("GUILD")
        add("OFFICER")
    end

    if type(_G.GetChannelList) == "function" then
        local list = {_G.GetChannelList()}
        for i = 1, #list, 3 do
            local id, name, disabled = list[i], list[i + 1], list[i + 2]
            if type(id) == "number" and id > 0 and type(name) == "string" and name ~= "" and not disabled then
                local key = PublicKey(module, name)
                add(key, id, name)
            end
        end
    else
        for _, key in ipairs(Data.tabChannelKeys) do
            local name = module.channels and module.channels[key]
            local id = name and self:GetChannel(name)
            if id and id > 0 then add(key, id, name) end
        end
    end
    return choices
end

function Adapter:BuildTabChannelCandidates(module)
    local candidates, seen = {}, {}
    local profile = module:GetProfile()
    for _, choice in ipairs(self:GetInputChannels(module, true)) do
        if Data.ChannelSelected(profile, "tabChannels", choice.key, true) then
            AddTabCandidate(candidates, seen, choice.id and "CHANNEL" or choice.key, choice.id, choice.recipient)
        end
    end
    return candidates
end

function Adapter:HandleTabChannelPressed(module, editBox)
    -- During Blizzard chat messaging lockdown, do not inspect the edit box:
    -- chat type, text, and targets can all be Secret values in this state.
    if self:IsChatMessagingLocked() then return false end
    if not editBox or type(editBox.GetChatType) ~= "function"
        or type(editBox.SetChatType) ~= "function"
        or type(editBox.GetText) ~= "function"
        or type(editBox.UpdateHeader) ~= "function" then
        return false
    end

    local chatTypeOK, chatType = pcall(editBox.GetChatType, editBox)
    if not chatTypeOK or not CanAccessValue(chatType) or chatType == "COMMUNITIES_CHANNEL" then return false end
    local textOK, text = pcall(editBox.GetText, editBox)
    if not textOK or not CanAccessValue(text) or self:IsNativeTabContext(chatType, text) then return false end
    local candidates = self:BuildTabChannelCandidates(module)
    if #candidates == 0 then return false end

    local currentTarget
    if chatType == "CHANNEL" and type(editBox.GetChannelTarget) == "function" then
        local targetOK, target = pcall(editBox.GetChannelTarget, editBox)
        if not targetOK or not CanAccessValue(target) then return false end
        currentTarget = tonumber(target)
    end

    local currentIndex
    local index
    for index = 1, #candidates do
        local candidate = candidates[index]
        if candidate.chatType == chatType
            and (chatType ~= "CHANNEL" or candidate.channelTarget == currentTarget) then
            currentIndex = index
            break
        end
    end

    local reverse = type(_G.IsShiftKeyDown) == "function" and _G.IsShiftKeyDown() == true
    local direction = reverse and -1 or 1
    local nextIndex
    if currentIndex then
        nextIndex = ((currentIndex - 1 + direction) % #candidates) + 1
    else
        nextIndex = reverse and #candidates or 1
    end
    local nextChannel = candidates[nextIndex]
    if nextChannel.chatType == "CHANNEL" and type(editBox.SetChannelTarget) ~= "function" then
        return false
    end

    if nextChannel.recipient and type(editBox.SetTellTarget) ~= "function" then return false end
    local applied = pcall(function()
        if nextChannel.recipient then editBox:SetTellTarget(nextChannel.recipient) end
        editBox:SetChatType(nextChannel.chatType)
        if nextChannel.chatType == "CHANNEL" then
            editBox:SetChannelTarget(nextChannel.channelTarget)
        end
        editBox:UpdateHeader()
    end)
    if applied then return true end

    pcall(function()
        editBox:SetChatType(chatType)
        if chatType == "CHANNEL" and currentTarget
            and type(editBox.SetChannelTarget) == "function" then
            editBox:SetChannelTarget(currentTarget)
        end
        editBox:UpdateHeader()
    end)
    return false
end

function Adapter:EnsureTabChannelHook(module)
    if module.tabChannelHookToken ~= nil then return true end
    if type(module.HookSecureFunction) ~= "function"
        or type(_G.ChatEdit_CustomTabPressed) ~= "function" then
        return false
    end
    local ok, token = pcall(
        module.HookSecureFunction,
        module,
        "ChatEdit_CustomTabPressed",
        function(_, editBox) pcall(module.HandleTabChannelPressed, module, editBox) end,
        "chatbar-tab-channel"
    )
    if not ok or token == nil then return false end
    module.tabChannelHookToken = token
    return true
end

local function NumberedKey(adapter, module, target)
    if type(_G.GetChannelList) == "function" then
        local _, name = adapter:GetChannel(target)
        if type(name) == "string" and name ~= "" then return PublicKey(module, name) end
    end
    local id = tonumber(target)
    for _, key in ipairs(Data.tabChannelKeys) do
        local name = module.channels and module.channels[key]
        if name and (name == target or (id and adapter:GetChannel(name) == id)) then return key end
    end
    return "CHANNEL"
end

local function NativeSticky(module, key)
    local saved = module.stickyOverrides and module.stickyOverrides[key]
    local info = _G.ChatTypeInfo and _G.ChatTypeInfo[key]
    local flag = info and info.sticky
    if saved then flag = saved.original end
    return flag == 1 or flag == true
end

local function SyncWhisperHistory(adapter, module, enabled)
    local hooks = module.whisperHistory
    if not enabled then
        if hooks then
            for _, token in pairs(hooks) do module:RemoveHook(token) end
            module.whisperHistory = nil
        end
        return
    end

    hooks = hooks or {}
    module.whisperHistory = hooks
    for i = 1, (_G.NUM_CHAT_WINDOWS or 0) do
        local frame = _G["ChatFrame" .. i]
        local box = frame and frame.editBox
        if box and not frame.isTemporary and not hooks[box] and box.AddHistory
            and box.GetChatType and box.SetStickyType then
            local lastType, lastTarget, lastOption
            hooks[box] = module:HookSecureFunction(box, "AddHistory", function(_, input)
                if frame.isTemporary or adapter:IsChatMessagingLocked() then return end
                local key = input:GetChatType()
                if not CanAccessValue(key) or type(key) ~= "string" then return end
                local profile = module:GetProfile()
                if key ~= "CHANNEL" and not (module.stickyOverrides and module.stickyOverrides[key])
                    and not Data.StickyAllowed(profile, key) then
                    lastType, lastTarget, lastOption = nil, nil, nil
                    return
                end
                local target, option = nil, key
                if key == "CHANNEL" then
                    target = input.GetChannelTarget and input:GetChannelTarget()
                    if not CanAccessValue(target) or not target or not input.SetChannelTarget then return end
                    option = NumberedKey(adapter, module, target)
                end
                if lastType and input.GetStickyType then
                    local remembered = input:GetStickyType()
                    if not CanAccessValue(remembered) then return end
                    if remembered ~= lastType then lastType, lastTarget, lastOption = nil, nil, nil end
                end
                if Data.StickyAllowed(profile, option) and NativeSticky(module, key) then
                    if key == "CHANNEL" then input:SetStickyType(key) end
                    if key == "WHISPER" or key == "BN_WHISPER" then
                        target = input.GetTellTarget and input:GetTellTarget()
                        if not CanAccessValue(target) or not target or not input.SetTellTarget then return end
                    end
                    lastType, lastTarget, lastOption = key, target, option
                elseif lastOption and Data.StickyAllowed(profile, lastOption) and NativeSticky(module, lastType)
                    and (lastType ~= "CHANNEL" or NumberedKey(adapter, module, lastTarget) == lastOption) then
                    if lastType == "CHANNEL" then input:SetChannelTarget(lastTarget) end
                    if lastType == "WHISPER" or lastType == "BN_WHISPER" then input:SetTellTarget(lastTarget) end
                    input:SetStickyType(lastType)
                elseif key == "CHANNEL" and input.GetStickyType then
                    local previous = input:GetStickyType()
                    if CanAccessValue(previous) and previous == "CHANNEL" then input:SetStickyType("SAY") end
                end
            end, "chatbar-whisper-history")
        end
    end
end

function Adapter:ApplyStickyModes(module, mode)
    local profile = module:GetProfile()
    local custom, numbered = false, false
    if mode == "native" and type(profile.stickyChannels) == "table" then
        for key, allowed in pairs(profile.stickyChannels) do
            if allowed == false and type(key) == "string" then
                custom = true
                if key:sub(1, 8) == "channel:" or key == "CHANNEL" then numbered = true end
            end
        end
        for _, key in ipairs(Data.tabChannelKeys) do
            if not Data.StickyAllowed(profile, key) then numbered = true end
        end
    end
    SyncWhisperHistory(self, module, custom)
    local info = _G.ChatTypeInfo
    if type(info) ~= "table" then return end
    local overrides = module.stickyOverrides
    for _, channel in ipairs(Data.inputChannels) do
        local key = channel[1]
        local entry = info[key]
        local saved = overrides and overrides[key]
        -- Numbered channels share one flag. AddHistory applies their individual choices.
        local suppress = (mode == "off" and (key == "WHISPER" or key == "BN_WHISPER"))
            or (mode == "native" and ((key == "CHANNEL" and numbered) or not Data.StickyAllowed(profile, key)))
        if entry and suppress then
            if not saved then
                overrides = overrides or {}
                module.stickyOverrides = overrides
                saved = { original = entry.sticky }
                overrides[key] = saved
            elseif entry.sticky ~= 0 then
                saved.original = entry.sticky
            end
            entry.sticky = 0
        elseif saved then
            if entry and entry.sticky == 0 then entry.sticky = saved.original end
            overrides[key] = nil
        end
    end
    if not mode or self:IsChatMessagingLocked() then return end
    for i = 1, (_G.NUM_CHAT_WINDOWS or 0) do
        local frame = _G["ChatFrame" .. i]
        local box = frame and frame.editBox
        if box and not frame.isTemporary and box.GetStickyType and box.SetStickyType then
            local key = box:GetStickyType()
            if CanAccessValue(key) and key and overrides and overrides[key] then
                local clear = true
                if mode == "native" and key == "CHANNEL" and box.GetChannelTarget then
                    local target = box:GetChannelTarget()
                    clear = CanAccessValue(target) and (not target or not NativeSticky(module, key)
                        or not Data.StickyAllowed(profile, NumberedKey(self, module, target)))
                end
                if clear then box:SetStickyType("SAY") end
            end
        end
    end
end

ns.ChatBarInput = {}
function ns.ChatBarInput.Install(target)
    for name, method in pairs(Adapter) do target[name] = method end
end
