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
    adapter.lootMiddleLabel = "地图待办"

    function adapter:OpenAtlasLoot()
        if self:LoadOptionalAddon("DungeonsForever") then
            local journal = _G.DF_NS
            if type(journal) == "table" and type(journal.Toggle) == "function" then
                journal.Toggle()
                return true
            end
            if type(journal) == "table" and type(journal.Open) == "function" then
                journal.Open()
                return true
            end
            if self:RunSlash("DUNGEONSFOREVER", nil, false) then return true end
        end
        return OpenAtlasLoot(self)
    end

    function adapter:ToggleLootMiddle()
        if not self:LoadOptionalAddon("DungeonsForever") then
            self:Notify("未安装或无法加载无限副本手册。")
            return false
        end
        local journal = _G.DF_NS
        local hint = type(journal) == "table" and journal.ZoneHint
        local cfg = type(hint) == "table" and type(hint.CFG) == "function" and hint.CFG()
        if type(cfg) ~= "table" then
            self:Notify("无限副本手册的地图待办模块未启用。")
            return false
        end
        local enabled = cfg.on == false
        cfg.on = enabled
        if type(journal.SyncZoneHintCard) == "function" then
            pcall(journal.SyncZoneHintCard)
        elseif type(journal.MainFrame) == "table" and type(journal.MainFrame.SyncZoneHintCard) == "function" then
            pcall(journal.MainFrame.SyncZoneHintCard)
        end
        if enabled then
            if type(hint.Refresh) == "function" then
                hint.Refresh()
            elseif type(journal.ZoneOrb) == "table" and type(journal.ZoneOrb.Refresh) == "function" then
                journal.ZoneOrb.Refresh()
            end
        elseif type(journal.ZoneOrb) == "table" and type(journal.ZoneOrb.Hide) == "function" then
            journal.ZoneOrb.Hide()
        elseif type(hint.CheckNow) == "function" then
            hint.CheckNow("manual")
        end
        self:Notify(enabled and "地图待办已开启。" or "地图待办已关闭。")
        return true
    end

    ns.ChatBarAdapter = adapter
end
