local _, ns = ...
if ns.Build.GetID() == "classic-infinite" then
    ns.ConsumableBarAdapter = ns.ConsumableBarAdapterBase.New("forever", "无限（Forever）")
end
