local _, RS = ...

if not RS.Build.IsFamily("classic") then return end

local providers = {
    {
        id = "ndui", addon = "NDui", name = "NDui", buttonLabel = "NDui",
        macro = "/mm", directKey = "NDUI_MOVER", openLabel = "打开NDui",
        canMove = true, settingsKind = "ndui", lockKind = "ndui",
    },
    {
        id = "elvui", addon = "ElvUI", name = "ElvUI", buttonLabel = "ElvUI",
        macro = "/emove", directKey = "ACECONSOLE_EMOVE", openLabel = "打开ElvUI",
        canMove = true, settingsKind = "elvui",
    },
    {
        id = "cell", addon = "Cell", name = "Cell", openLabel = "打开Cell",
        canMove = false, settingsKind = "cell",
    },
}

local index = 1
while index <= #providers do
    RS:RegisterExternalMoveProvider(providers[index])
    index = index + 1
end
