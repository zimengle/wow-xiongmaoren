local _, RS = ...

if not (RS.Build and RS.Build.HasModule and RS.Build.HasModule("Guide")) then return end

local Guide = RS.Guide
if type(Guide) ~= "table" or type(Guide.Data) ~= "table" or type(Guide.Window) ~= "table" then
    error("Guide Core requires Guide Data and Window before it", 2)
end

local Definition = {
    defaultEnabled = true,
}

function Definition:EnsureWindowService()
    if self.windowService then
        return self.windowService
    end
    local system = RS.UI and RS.UI.GetSystem and RS.UI:GetSystem()
    if not system and RS.UI and RS.UI.Initialize then
        system = RS.UI:Initialize()
    end
    if not system then
        return nil, "RS.UI is unavailable"
    end
    local module = self
    self.windowService = Guide.Window:New(system, Guide.Data, RS.Font, {
        parent = _G.UIParent,
        owner = self,
        onSelection = function(key)
            module.selectedKey = key
        end,
    })
    return self.windowService
end

function Definition:Initialize()
    self.selectedKey = Guide.Data.defaultCategory
end

function Definition:Enable()
    if not (RS.UI and RS.UI.RegisterSearchProvider) then return false end
    local module = self
    RS.UI:RegisterSearchProvider("guide", function(query)
        local results = {}
        for _, entry in ipairs(Guide:Search(query, nil, 12)) do
            local id = entry.id
            results[#results + 1] = {
                id = "guide-search:" .. id, title = entry.title,
                group = "guide-search", groupTitle = "小手册", description = entry.body,
                onAction = function()
                    local system = RS.UI:GetSystem()
                    if system and system.mainWindow then system.mainWindow:Close() end
                    return module:ShowWindow(id)
                end,
            }
        end
        return results
    end)
    return true
end

function Definition:Disable()
    if RS.UI and RS.UI.UnregisterSearchProvider then RS.UI:UnregisterSearchProvider("guide") end
    if self.windowService then
        self.windowService:Close()
    end
end

function Definition:SelectCategory(key)
    local window, reason = self:EnsureWindowService()
    if not window then return false, reason end
    local selected = window:SelectCategory(key)
    self.selectedKey = window.selectedKey
    return selected
end

function Definition:ShowWindow(categoryKey)
    local window, reason = self:EnsureWindowService()
    if not window then return false, reason end
    if window.system.mainWindow then window.system.mainWindow:Close() end
    local frame = window:Open(categoryKey)
    self.selectedKey = window.selectedKey
    return frame
end

function Definition:CloseWindow()
    if not self.windowService then return false end
    return self.windowService:Close()
end

function Definition:GetGuideDiagnostics()
    if not self.windowService then
        return {
            created = false,
            visible = false,
            selectedKey = self.selectedKey or Guide.Data.defaultCategory,
            renderCount = 0,
        }
    end
    return self.windowService:GetDiagnostics()
end

local module, reason = RS.RegisterModule("Guide", Definition)
if module then
    RS.GuideModule = module
    function RS:OpenGuide(categoryKey)
        return module:ShowWindow(categoryKey)
    end
else
    RS.GuideRegistrationError = reason
end
