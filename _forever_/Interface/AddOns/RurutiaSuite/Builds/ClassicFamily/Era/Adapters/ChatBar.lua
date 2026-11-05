local _, ns = ...
if ns.Build.GetID() == "classic-era" then
    ns.ChatBarAdapter = ns.ChatBarAdapterBase.New("classic-era", "经典旧世（Era）")
end
