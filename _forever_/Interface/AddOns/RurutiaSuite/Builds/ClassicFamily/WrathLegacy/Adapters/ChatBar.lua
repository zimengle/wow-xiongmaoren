local _, ns = ...
if ns.Build.GetID() == "classic-wrath-legacy" then
    ns.ChatBarAdapter = ns.ChatBarAdapterBase.New("classic-wrath-legacy", "巫妖王怀旧", {
        preferAtlasLootMY = true,
    })
end
