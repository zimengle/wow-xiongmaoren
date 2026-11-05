local _, ns = ...
if ns.Build.GetID() == "classic-anniversary" then
    ns.ChatBarAdapter = ns.ChatBarAdapterBase.New("classic-anniversary", "周年服/TBC")
end
