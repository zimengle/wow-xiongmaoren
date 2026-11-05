local _, ns = ...

local Defaults = {}
ns.Defaults = Defaults

function Defaults.Create(build)
    build = build or ns.Build.GetActive()

    local profile = {
        modules = {},
        minimap = {
            hide = false,
        },
        appearance = {
            mainWindowOpacity = 95,
            containerOpacity = 0,
            borderAlpha = 0,
        },
    }

    if build.family == "classic" then
        profile.moveSettings = {
            allowOffscreenDrag = false,
        }
    end

    return {
        profile = profile,
        global = {
            lastSeenVersion = "0.0.0",
        },
    }
end
