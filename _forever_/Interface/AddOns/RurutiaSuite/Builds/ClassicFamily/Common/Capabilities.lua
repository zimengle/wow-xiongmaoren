local _, ns = ...

local Common = {}
ns.ClassicBuildCommon = Common

Common.Modules = {
    AutoMark = true,
    ChatBar = true,
    EllesmereCompat = true,
    Changelog = true,
    ConsumableBar = true,
    CVarSettings = true,
    ExperienceBar = true,
    ExtraTools = true,
    MinimapCollector = true,
        BlizzardEnhancements = true,
        PluginEnhancements = true,
        LootTools = true,
        LFGTools = true,
        CelestialBar = true,
    Guide = true,
    MagePortal = true,
    MoveManager = true,
    NativeTooltip = true,
    OutOfDateAddonsGuard = true,
    RaidMarker = true,
    TopBar = true,
    VersionDisplay = true,
}

Common.Integrations = {
    native = true,
    elvui = true,
    ndui = true,
    -- 快速拾取避让只按插件加载判定，不依赖这两个插件的 UI 能力。
    leatrix = true,
    pig = true,
}

local function Merge(base, overrides)
    local result = {}
    for key, value in pairs(base or {}) do
        result[key] = value
    end
    for key, value in pairs(overrides or {}) do
        result[key] = value
    end
    return result
end

function Common.Register(data)
    ns.Build.Register({
        id = data.id,
        family = "classic",
        label = data.label,
        minInterface = data.minInterface,
        maxInterface = data.maxInterface,
        primary = data.primary,
        modules = Merge(Common.Modules, data.modules),
        integrations = Merge(Common.Integrations, data.integrations),
        capabilities = Merge({
            modernSettings = false,
            secureClickMode = "modern",
            worldMarkers = false,
            autoMark = false,
            macroTargetMarkerClear = false,
            moveAllCommandMode = "toggle",
            barModules = false,
        }, data.capabilities),
    })
end
