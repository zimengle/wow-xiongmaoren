local addonName, ns = ...

ns = ns or {}
ns.addonName = addonName or "RurutiaSuite"
local getMetadata = _G.C_AddOns and _G.C_AddOns.GetAddOnMetadata or _G.GetAddOnMetadata
local ok, version
if type(getMetadata) == "function" then
    ok, version = pcall(getMetadata, ns.addonName, "Version")
end
ns.version = ok and type(version) == "string" and version ~= "" and version
    or ns.version or "0.0.0"
ns.RS = ns

-- 唯一公开命名空间。内部服务继续挂在 ns 下，不创建第二个插件。
_G.RurutiaSuite = ns
