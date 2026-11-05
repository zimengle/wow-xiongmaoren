local _, ns = ...
if ns.Build.GetID() == "classic-mists" then
    ns.ChatBarAdapter = ns.ChatBarAdapterBase.New("classic-mists", "熊猫人之谜（MOP）")
end
