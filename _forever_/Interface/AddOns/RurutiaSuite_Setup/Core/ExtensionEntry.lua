local _, ns = ...

local function RegisterExtension()
    local RS = _G.RurutiaSuite
    local extensions = RS and RS.Extensions
    if type(extensions) ~= "table" or extensions.API_VERSION ~= ns.EXTENSION_API_VERSION
        or type(extensions.RegisterAddon) ~= "function" then
        ns.failedReason = type(RS) == "table" and extensions == nil
            and "当前 RurutiaSuite 不支持新版安装器，请成对安装新版 RS 与 RSS"
            or "RurutiaSuite Extensions API v1 is required"
        if type(_G.print) == "function" then
            _G.print("[RSS] " .. ns.failedReason)
        end
        return false
    end

    local supported, buildReason = ns.ProductManifest:CheckBuild()
    if not supported then
        ns.failedReason = buildReason
        if type(_G.print) == "function" then _G.print("[RSS] " .. buildReason) end
        return false
    end
    -- Pinned global entry order is owned by the host: setup first, configuration
    -- management second, appearance third. Unsupported clients get a read-only
    -- transfer page instead of silently omitting the second global entry.
    local pages = {
        ns.SettingsPage:GetDefinition(),
        ns.TransferPage:GetDefinition(),
    }
    local definition = {
        apiVersion = ns.EXTENSION_API_VERSION,
        id = "setup",
        routePrefix = "rss",
        module = ns.Runtime,
        pages = pages,
    }
    ns.ExtensionDefinition = definition

    local handle, reason = extensions:RegisterAddon(ns.addonName, definition)
    if not handle then
        ns.failedReason = tostring(reason or "unable to register RurutiaSuite_Setup")
        if type(RS.Print) == "function" then
            RS.Print("RSS 初始化失败：" .. ns.failedReason)
        end
        return false
    end

    ns.Host = handle
    return true
end

-- RSS 作为晚加载扩展时，宿主可能已经激活。必须等自己的 ADDON_LOADED，
-- 确保客户端先把 RurutiaSuiteSetupDB 挂到 _G，再让宿主打开数据库。
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, loadedName)
    if event ~= "ADDON_LOADED" or loadedName ~= ns.addonName then return end
    self:UnregisterEvent("ADDON_LOADED")
    RegisterExtension()
end)
ns.ExtensionLoadFrame = frame
