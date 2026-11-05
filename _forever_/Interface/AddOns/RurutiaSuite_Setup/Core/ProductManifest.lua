local _, ns = ...

-- RSS product boundary. Build identity comes only from the host extension facade.
-- Classic retains a preview shell; verified Classic data/adapters do not exist yet.
local Manifest = {}
ns.ProductManifest = Manifest

local PRODUCTS = {
    infinite = {
        builds = { ["classic-infinite"]=true },
        quickInstall = { "em", "blizzard", "rxp" },
        presets = { em=true, blizzard=true, rxp=true },
        capabilities = { setup=true, transfer=true, presetDetails=true, infinitePreset=true,
            layoutSwitch=true, middleLayout=true, canvasEdge=true,
            editModeActivation=true, health=true, gameMenu=true },
        health = { editMode=true, activation=true },
    },
    retail = {
        builds = { retail=true },
        quickInstall = { "em", "cd", "sensei", "at", "exwind", "exboss" },
        presets = { em=true, cd=true, sensei=true, jx=true, at=true,
            exboss=true, exwind=true, bigwigs=true },
        capabilities = { setup=true, transfer=true, presetDetails=true,
            layoutSwitch=true, middleLayout=true, canvasEdge=true, automation=true,
            editModeActivation=true, settingsMigration=true, presetData=true,
            health=true, gameMenu=true },
        health = { editMode=true, uiLayout=true, cooldown=true, sensei=true,
            automation=true, activation=true, ellesQuickSignup=true },
    },
    classic = {
        builds = { ["classic-era"]=true, ["classic-anniversary"]=true,
            ["classic-wrath-legacy"]=true, ["classic-titan"]=true,
            ["classic-cata-legacy"]=true, ["classic-mists"]=true },
        quickInstall = { "em" },
        presets = { em="not_ready" },
        capabilities = { setup=true, transfer=true, layoutSwitch="not_ready", health=true, gameMenu=true },
        health = { editMode=true, activation=true },
    },
}

local SERVICE_CAPABILITIES = {
    EventHub="setup", HealthCheckService="health", EditModeActivator="editModeActivation",
    AutomationCoordinator="automation", GameMenuService="gameMenu",
    LayoutIntegration="canvasEdge", Commands="setup",
}

-- A client Build cannot change during a game session. Cache rejected identities too;
-- health-category checks must not repeatedly allocate facade snapshots.
local resolved, resolvedProduct = false, nil
local function Product()
    if resolved then return resolvedProduct end
    resolved = true
    local host = (_G.RurutiaSuite and _G.RurutiaSuite.Extensions) or ns.Host
    if type(host) ~= "table" or type(host.GetBuildContext) ~= "function" then return nil end
    local ok, context = pcall(host.GetBuildContext, host)
    if not ok or type(context) ~= "table" or type(context.id) ~= "string"
        or context.id == "" or context.id == "unsupported" then return nil end
    local product = context.id == "classic-infinite" and PRODUCTS.infinite or PRODUCTS[context.family]
    if product and product.builds[context.id] then resolvedProduct = product end
    return resolvedProduct
end

-- Explicit invalidation for isolated Build-switch tests or host reinitialization.
function Manifest:Reset()
    resolved, resolvedProduct = false, nil
end

local function Check(value)
    if value == true then return true end
    if value == "not_ready" then return false, "not_ready" end
    return false, "unsupported-on-current-build"
end

function Manifest:CheckBuild()
    return Check(Product() ~= nil)
end

function Manifest:Has(capability)
    local product = Product()
    local value = product and product.capabilities[capability]
    return value == true or value == "not_ready"
end

function Manifest:Check(capability)
    local product = Product()
    return Check(product and product.capabilities[capability])
end

function Manifest:HasPreset(command)
    local product = Product()
    return product ~= nil and (command == "all" or product.presets[command] ~= nil)
end

function Manifest:IsKnownPreset(command)
    if command == "all" then return true end
    for _, product in pairs(PRODUCTS) do
        if product.presets[command] ~= nil then return true end
    end
    return false
end

function Manifest:CheckPreset(command)
    local product = Product()
    if not product then return Check(nil) end
    if command == "all" then
        for _, name in ipairs(product.quickInstall) do
            local ok, reason = Check(product.presets[name])
            if not ok then return false, reason end
        end
        return true
    end
    return Check(product.presets[command])
end

function Manifest:GetQuickInstallOrder()
    local product, result = Product(), {}
    for index, name in ipairs(product and product.quickInstall or {}) do result[index] = name end
    return result
end

function Manifest:HasHealthCategory(category)
    local product = Product()
    return product ~= nil and product.health[category] == true
end

function Manifest:IsServiceEnabled(name)
    return self:Check(SERVICE_CAPABILITIES[name])
end
