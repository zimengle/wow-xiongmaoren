local _, ns = ...
local adapter = ns.ExtraToolsAdapter
if not (adapter and adapter.features.guildInviteMenu) then return end

local menus = { "PLAYER", "TARGET", "FOCUS", "PARTY", "RAID_PLAYER", "RAID", "FRIEND" }
local handles = {}
local copyDialog
local function Secret(value)
    return issecretvalue and issecretvalue(value)
end

local function Available(owner)
    if not owner.runtimeActive then return false end
    local profile = owner:GetProfile()
    return profile and (not profile.blizzardUI or profile.blizzardUI.guildInviteMenu ~= false)
        and not adapter:IsAddOnLoaded("NDui")
end

local function InviteTarget(data)
    if not data or not CanGuildInvite or not CanGuildInvite() then return end
    local unit = data.unit
    if Secret(unit) or Secret(data.name) or Secret(data.server) or Secret(data.surname)
        or type(data.name) ~= "string" or data.name == "" then return end
    local guid
    if unit then
        local player, self = UnitIsPlayer(unit), UnitIsUnit(unit, "player")
        if Secret(player) or Secret(self) or not player or self then return end
        guid = UnitGUID(unit)
        if Secret(guid) or not guid then return end
    else
        guid = data.guid
        if Secret(guid) then return end
        if guid then
            if type(guid) ~= "string" or not guid:match("^Player%-") then return end
            local selfGUID = UnitGUID("player")
            if Secret(selfGUID) or not selfGUID or guid == selfGUID then return end
        elseif data.which ~= "FRIEND" then
            -- Only character menus accept a hyperlink name without a unit or GUID.
            return
        end
    end
    -- The client resolves Retail realms and Forever regional surnames differently.
    local ok, name = pcall(UnitPopupSharedUtil.GetFullPlayerName, data)
    if ok and not Secret(name) and type(name) == "string" and name ~= "" and not name:find("[%c]") then
        if not guid then
            local selfName = GetUnitName("player", true)
            if Secret(selfName) or name == selfName then return end
        end
        return name, guid
    end
end

local function Notify(text)
    local color = ChatTypeInfo.SYSTEM
    DEFAULT_CHAT_FRAME:AddMessage(text, color.r, color.g, color.b)
end

function ns.SyncGuildInviteMenu(owner)
    if not Available(owner) then
        if copyDialog and copyDialog.visible then copyDialog:Hide() end
        for i = #handles, 1, -1 do
            handles[i]:Unregister()
            handles[i] = nil
        end
        return
    end
    if handles[1] or not (Menu and Menu.ModifyMenu and UnitPopupSharedUtil
        and UnitPopupSharedUtil.GetFullPlayerName) then return end

    local registering = true
    local function Populate(_, root, data)
        if registering or InCombatLockdown() or not Available(owner) then return end
        local name, guid = InviteTarget(data)
        if not name then return end
        local _, class = UnitClass("player")
        local color = class == "PRIEST" and "|cff99ccff" or ns:GetThemeColorCode(true)
        root:CreateButton(color .. "邀请加入公会|r", function()
            if InCombatLockdown() or not Available(owner) then return end
            local currentName, currentGUID = InviteTarget(data)
            if currentName ~= name or currentGUID ~= guid then
                Notify("邀请目标已变化或不可邀请，本次未发送。")
                return
            end
            if not copyDialog then
                copyDialog = ns.UI:CreateNativeCopyDialog(owner, {
                    name = "RurutiaGuildInviteCopyDialog", title = "复制公会邀请命令",
                })
            end
            copyDialog:Show("/guildinvite " .. name,
                "Ctrl+C 复制，Esc 关闭。在聊天框粘贴后按回车发送。", nil, 540, 220)
            copyDialog.input:HighlightText()
            Notify("请复制命令，邀请" .. name .. "加入公会")
        end)
    end
    for i, menu in ipairs(menus) do
        handles[i] = Menu.ModifyMenu("MENU_UNIT_" .. menu, Populate)
    end
    registering = false
end
