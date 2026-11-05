local _, ns = ...
if ns.Build.GetID() == "classic-titan" then
    ns.ChatBarAdapter = ns.ChatBarAdapterBase.New("classic-titan", "Titan", {
        preferAtlasLootMY = true,
    })
end
