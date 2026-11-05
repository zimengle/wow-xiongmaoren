local _, ns = ...
if ns.Build.GetID() == "classic-era" then
    ns.ConsumableBarAdapter = ns.ConsumableBarAdapterBase.New("era", "经典旧世（Era）")
end

