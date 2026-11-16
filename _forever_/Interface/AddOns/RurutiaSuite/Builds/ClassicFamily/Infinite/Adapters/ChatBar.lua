local _, ns = ...
if ns.Build.GetID() == "classic-infinite" then
    local adapter = ns.ChatBarAdapterBase.New("classic-infinite", "无限（Forever）")
    function adapter:IsChatMessagingLocked()
        local locked = _G.C_ChatInfo and _G.C_ChatInfo.InChatMessagingLockdown
        if type(locked) ~= "function" then return false end
        local ok, value = pcall(locked)
        return not ok or value ~= false
    end
    ns.ChatBarInput.Install(adapter)
    local OpenAtlasLoot = adapter.OpenAtlasLoot
    adapter.lootLabel = "无限副本手册"

    function adapter:OpenAtlasLoot()
        if self:LoadOptionalAddon("DungeonsForever") then
            local journal = _G.DF_NS
            if type(journal) == "table" and type(journal.Open) == "function" then
                journal.Open()
                return true
            end
            if self:RunSlash("DUNGEONSFOREVER", nil, false) then return true end
        end
        return OpenAtlasLoot(self)
    end

    ns.ChatBarAdapter = adapter
end
