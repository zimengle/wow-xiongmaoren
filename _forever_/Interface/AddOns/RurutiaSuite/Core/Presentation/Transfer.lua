local _, RS = ...

-- Standalone RS entry. RSS supplies the richer page when its extension is active.
-- Created on first open; shared dialogs own their input widgets, no event/timer.
local Transfer = {}
RS.TransferPage = Transfer

function Transfer:GetDefinition()
    return {
        title = "配置管理", description = "导入或导出RS配置字符串。",
        group = "management", navigationOrder = 10,
        searchKeywords = { "配置", "导入", "导出", "字符串" },
        visible = function()
            local system = RS.UISystem
            return not (system and system.pages and system.pages.pages
                and system.pages.pages["rss-transfer"])
        end,
        build = function(context)
            local page, reason = RS.UI:CreateSettingsPage(context, { id = "rs-transfer" })
            if not page then return false, reason end
            if page:GetControl("rsTransferExport") then return page end
            local section = page:Section("RS 设置迁移", {
                description = "导入会替换当前RS设置，请先导出备份；建议在相同客户端使用。",
            })
            local actions = section:ActionRow({ columns = 2 })
            actions:Button("rsTransferExport", { text = "导出", onAction = function()
                local payload, err = RS.ConfigTransfer:Export()
                if not payload then
                    context.transferMessage = "导出失败：" .. tostring(err)
                    page:Refresh()
                    return false
                end
                return page:ShowTextDialog({ title = "RS 设置迁移 · 导出", mode = "view",
                    value = payload, selectAll = true, maxLetters = 262144 }) ~= nil
            end })
            actions:Button("rsTransferImport", { text = "导入", onAction = function()
                return page:ShowTextDialog({ title = "RS 设置迁移 · 导入",
                    description = "替换当前RS设置；建议在相同客户端使用。",
                    maxLetters = 262144, confirmLabel = "确认导入",
                    onConfirm = function(payload)
                        local ok, err = RS.ConfigTransfer:Import(payload)
                        if not ok then return false, tostring(err) end
                        context.transferMessage = "RS设置已导入，请 /reload 让全部模块重新加载。"
                        page:Refresh()
                        return true
                    end }) ~= nil
            end })
            page:Description(function() return context.transferMessage or "" end,
                { hideWhenEmpty = true, minHeight = 20 })
            page:Finish()
            return page
        end,
    }
end
