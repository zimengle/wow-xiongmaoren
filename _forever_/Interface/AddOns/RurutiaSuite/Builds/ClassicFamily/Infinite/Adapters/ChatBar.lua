local _, ns = ...
if ns.Build.GetID() == "classic-infinite" then
    local adapter = ns.ChatBarAdapterBase.New("classic-infinite", "无限（Forever）")
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
