local _, ns = ...

local Data = ns.ExtraToolsData
-- 保留两套旧主界面共同使用的稳定 key；同一页只注册一次，避免别名页重复建 Frame。
local Settings = { pageId = "extratools", registered = false }
local SettingsBuilder = ns.UI and ns.UI.SettingsBuilder

local function SetRootBoolean(module, key, value)
    return module:SetBoolean(nil, key, value)
end

local function SetSectionBoolean(module, section, key, value)
    return module:SetBoolean(section, key, value)
end

local function AddModuleStatus(page, module)
    page:Section(""):Row():Label("extraToolsModuleStatus", {
        text = "本页 RS 功能已停用，重新开启后恢复原有选择。外部插件仍由自身设置控制。",
        getVisible = function() return not module:IsEnabled() end,
        wordWrap = true, labelFill = true, textToken = "color.text.muted",
    })
end

local function GetFastLootTooltip(module)
    local text = "自动拾取时提前拾取掉落物品；保留游戏原有的修饰键切换。"
        .. "背包满、锁定或需要确认的物品仍由原生界面处理。"
    local status = module:GetFastLootStatus()
    if status.reason == "unsupported" then
        return text .. "|n|cffff5555当前客户端缺少必需接口，快速拾取不可用。|r"
    end
    if status.reason == "conflict" then
        return text .. "|n|cffffaa00" .. tostring(status.message or "") .. "|r"
    end
    return text
end

local function BuildFastLootCheckbox(row, module)
    if not module:IsFastLootAvailable() then return end
    row:Checkbox("fastLoot", {
        text = "快速拾取",
        value = module:GetProfile().fastLoot,
        getValue = function() return module:GetProfile().fastLoot end,
        getEnabled = function() return module:IsFastLootAvailable() end,
        getVisible = function() return module:IsFastLootAvailable() end,
        tooltip = function() return GetFastLootTooltip(module) end,
        onChange = function(_, value) module:SetBoolean(nil, "fastLoot", value) end,
    })
end

local function BuildQuestAutomation(container, page, module)
    AddModuleStatus(container, module)
    local convenience = container:Section("便捷功能"):QuadRow()
    convenience:Checkbox("autoSellJunk", {
        text = "自动出售垃圾",
        value = module:GetProfile().autoSellJunk,
        getValue = function() return module:GetProfile().autoSellJunk end,
        getEnabled = function()
            return module.adapter:CanSellJunk()
        end,
        tooltip = "打开商人时自动出售灰色垃圾，默认开启；需要客户端支持一键出售垃圾。",
        onChange = function(_, value) module:SetBoolean(nil, "autoSellJunk", value) end,
    })
    BuildFastLootCheckbox(convenience, module)
    local quest = ns.QuestAutomation
    if quest then
        quest.settingsPage = page
        local section = container:Section("任务辅助")
        section:QuadRow():Checkbox("questAutomation", {
            text = "任务自动交接",
            value = quest:GetAutomationState().enabled,
            getValue = function() return quest:GetAutomationState().enabled end,
            getEnabled = function() return quest:GetAutomationState().mutable end,
            tooltip = "自动接取和交付任务，按住 Shift 临时跳过。原生界面默认开启；NDui 使用原有地图入口，ELLES 同步自身设置。",
            onChange = function(_, value) quest:SetAutomationEnabled(value); page:Refresh("quest-automation") end,
        })
        local actions = section:QuadRow()
        for _, option in ipairs({ { "autoTurnIn", "自动交任务" }, { "autoAccept", "自动接任务" } }) do
            local key, label = option[1], option[2]
            actions:Checkbox("questAutomation_" .. key, {
                text = label,
                value = quest:GetAutomationState()[key] == true,
                getValue = function() return quest:GetAutomationState()[key] == true end,
                getEnabled = function() return quest:GetAutomationState().owner == "native" end,
                tooltip = "总开关开启时生效；关闭总开关会保留此项选择。",
                onChange = function(_, value) quest:SetAutomationOption(key, value) end,
            })
        end
        section:GridRow(1, { height = 48 }):Label("questAutomationOwner", {
            text = quest:GetAutomationState().description,
            getText = function() return quest:GetAutomationState().description end,
            wordWrap = true, labelFill = true,
        })
        section:GridRow(1, { height = 64 }):Label("questAutomationOtherSources", {
            text = "关闭后仍自动交接？先检查 RXP（RestedXP），再核对 ELLES、NDui 及其他任务插件的设置。RS 不统一控制所有插件；RS 原生交接可按住 Shift 临时跳过。",
            wordWrap = true, labelFill = true,
        })
        local voice = section:FieldRow({ columns = 4, preserveColumns = true, responsive = false })
        voice:SoundDropdown("questCompletionSound", {
            text = "任务完成语音",
            value = quest:GetCompletionSound(),
            getValue = function() return quest:GetCompletionSound() end,
            options = ns.QuestAutomationData.soundOptions,
            order = ns.QuestAutomationData.soundOrder,
            getEnabled = function() return quest.runtimeActive == true end,
            tooltip = "任务目标完成、变为可交任务时播放，默认工作完成。选择无可关闭；交任务时不会再次播放。",
            onChange = function(_, value) quest:SetCompletionSound(value) end,
            getPreviewEnabled = function(value) return ns.QuestAutomationData.completionSounds[value] ~= nil end,
            onPreview = function(value) return quest:PlayCompletionSound(true, value) end,
            onStopPreview = function() quest:StopCompletionSound(true) end,
        })
        section:Row():Slider("questCompletionCooldown", {
            text = "播音冷却（秒）", min = 0, max = 30, step = 1,
            value = quest:GetCompletionCooldown(),
            getValue = function() return quest:GetCompletionCooldown() end,
            getEnabled = function() return quest.runtimeActive and quest:GetCompletionSound() ~= "none" end,
            tooltip = "默认 10 秒。冷却内完成的其他任务不播报，也不延长冷却；0 秒为每个任务完成都播。试听不受冷却影响。",
            onChange = function(_, value) quest:SetCompletionCooldown(value) end,
        })
        page:SetDeactivateHandler(function() quest:StopCompletionSound(true) end)
    end
end

local function BuildPluginsEllesmere(page, module)
    local profile = module:GetProfile()
    local ellesmere = page:Section("EllesmereUI")
    local ellesmereOptions = ellesmere:QuadRow()
    ellesmereOptions:Checkbox("ellesmereMinimapVolume", {
        text = "小地图音量",
        tooltip = "EllesmereUI 小地图已加载时，按住 Ctrl + 鼠标滚轮以 10% 为一档调节系统主音量；普通滚轮仍缩放小地图。",
        value = profile.ellesmereMinimapVolume,
        getValue = function() return module:GetProfile().ellesmereMinimapVolume end,
        onChange = function(_, value) SetRootBoolean(module, "ellesmereMinimapVolume", value) end,
    })

    if ns.EllesmereTimerIntegration then
        ellesmereOptions:Checkbox("ellesmereTimerCompact", {
            text = "首领计时精简",
            tooltip = "正式服 Elles 首领行采用 Warp 样式：时间差、本次耗时、首领名称，13号字右对齐；隐藏灰色历史耗时。关闭后恢复原设置。",
            getValue = function() return module:GetProfile().ellesmereTimerCompact ~= false end,
            onChange = function(_, value) SetRootBoolean(module, "ellesmereTimerCompact", value) end,
        })
    end

    local runes = ns.EUICNRuneCompat
    if runes then
        ellesmereOptions:Checkbox("euiCNRuneCompat", {
            text = "国服符文兼容",
            tooltip = "识别国服特供消耗品「潮誓强化符文」。缺少符文增益时提供虚触与潮誓选择；道标文字始终显示「道标」。",
            getValue = function() return runes.db and runes.db.profile.enabled == true end,
            getEnabled = function()
                return not InCombatLockdown() and (runes:GetProvider() ~= nil or runes.db.profile.enabled == true)
            end,
            onChange = function(_, value) runes:SetFeatureEnabled(value) end,
        })
    end

    if ns.EUIPanelCleanup then
        ellesmere:Row():Button("euiPanelCleanup", {
            text = "面板位置清理", matchToggleColumn = true,
            tooltip = "手动选择保留面板；确认后清除其他面板的位置与缩放并重载。",
            onAction = function() ns.EUIPanelCleanup:ShowSettings(page) end,
        })
    end

end

local function BuildPluginsRetail(page, module)
    AddModuleStatus(page, module)
    local profile = module:GetProfile()
    page:Section("集合石"):QuadRow():Checkbox("showFloatingWindow", {
        text = "显示悬浮窗",
        tooltip = "默认关闭。战斗或大秘境中登录时跳过自动同步；手动修改会在脱战后生效。",
        value = module:GetMeetingStoneShown(),
        getValue = function() return module:GetMeetingStoneShown() end,
        onChange = function(_, value) module:SetMeetingStoneShown(value) end,
    })

    local definitions = {
        {
            "bwHideDungeonNames",
            "隐藏副本名",
            "隐藏 BigWigs 在部分副本界面中额外显示的副本名称文字；不会隐藏计时条、首领名称或其他战斗信息。", "BigWigs",
        },
        { "detailsNumberFix", "修复数字显示", "修正 Details 的数字缩写显示。", "Details" },
        { "tinyInspectYellowSpamFix", "修复黄字报错", "抑制战场或随机团队中由 TinyInspect 引起的黄字刷屏。", "TinyInspect" },
    }
    local row
    local index
    for index = 1, #definitions do
        local entry = definitions[index]
        local key, label, tooltip = entry[1], entry[2], entry[3]
        row = page:Section(entry[4]):QuadRow()
        row:Checkbox(key, {
            text = label, value = profile[key],
            getValue = function() return module:GetProfile()[key] end,
            tooltip = tooltip,
            onChange = function(_, value) SetRootBoolean(module, key, value) end,
        })
    end

    BuildPluginsEllesmere(page, module)

end

local function BuildCelestial(page, module, tab, actions, visible)
    AddModuleStatus(tab, module)
    local profile = module:GetCelestialBarDB()
    local section = tab:Section("天神条移动")
    local toggles = section:QuadRow()
    toggles:Checkbox("celestialSimpleMode", {
        text = "使用简洁模式", value = profile.simpleMode,
        getValue = function() return module:GetCelestialBarDB().simpleMode end,
        tooltip = "使用更精简的天神能量条外观。",
        onChange = function(_, value) SetSectionBoolean(module, "celestialBar", "simpleMode", value) end,
    })
    local sliders = {
        { "celestialWidth", "宽度", "width", Data.CELESTIAL.minWidth, Data.CELESTIAL.maxWidth },
        { "celestialHeight", "高度", "height", Data.CELESTIAL.minHeight, Data.CELESTIAL.maxHeight },
        { "celestialFontSize", "字号", "fontSize", Data.CELESTIAL.minFontSize, Data.CELESTIAL.maxFontSize },
    }
    local rows = {}
    local index
    for index = 1, #sliders do
        local entry = sliders[index]
        local key, label, field = entry[1], entry[2], entry[3]
        local minimum, maximum = entry[4], entry[5]
        rows[#rows + 1] = { kind = "slider", key = key,
            text = label, value = profile[field], min = minimum, max = maximum, step = 1,
            getValue = function() return module:GetCelestialBarDB()[field] end,
            onChange = function(_, value)
                local current = module:GetCelestialBarDB()
                current[field] = Data.ClampNumber(value, minimum, maximum, current[field])
                module:RefreshCelestialBar()
            end,
        }
    end
    section:ActionRow():Popover("celestialAppearance", {
        title = "天神条外观", button = { text = "样式调整" }, rows = rows,
    })
    actions:Button("celestialPreview", { action = "preview", onDeactivate = function() if ns.CelestialBar.celestialPreviewMode then ns.CelestialBar:SetCelestialBarPreview(false) end end,
        getVisible = visible,
        text = module.celestialPreviewMode and "取消预览" or "预览模式",
        getText = function() return module.celestialPreviewMode and "取消预览" or "预览模式" end,
        onAction = function(control)
            module:SetCelestialBarPreview(not module.celestialPreviewMode)
            control:SetText(module.celestialPreviewMode and "取消预览" or "预览模式")
        end,
    })
    actions:Button("celestialResetPosition", { action = "resetPosition",
        text = "重置位置", getVisible = visible, onAction = function() module:ResetCelestialBarPosition() end,
    })
    actions:Button("celestialResetDefaults", { action = "restoreDefaults",
        text = "恢复默认", getVisible = visible,
        tooltip = "仅恢复天神条的显示、位置与外观设置。",
        onAction = function()
            page:ClosePopovers()
            page:ShowTextDialog({
                title = "恢复天神条默认设置", confirmLabel = "恢复默认",
                description = "仅作用于天神条。",
                value = "恢复该工具的显示、位置与外观；不影响本页其他工具。",
                onConfirm = function()
                    module:ResetCelestialBarDefaults()
                    page:Refresh("reset-celestial-defaults")
                    return true
                end,
            })
        end,
    })

end

local function BagSortBlocked(module)
    if not module:IsEnabled() then return "请先启用暴雪界面增强。" end
    if module._bagSortPending then return "正在等待客户端更新整理方向。" end
end

local function FinishBagSort(page, module, ok, reason, verify)
    if not ok then
        if reason then module:Notify(reason) end
    elseif verify then
        local pending = {}
        module._bagSortPending = pending
        module:Schedule(1, function()
            if module._bagSortPending ~= pending then return end
            module._bagSortPending = nil
            local verified, message = verify()
            if not verified and message then module:Notify(message) end
            page:Refresh("bag-sort-settled")
        end, "Bag sort preference readback")
    end
    page:Refresh("bag-sort-change")
end

local function BuildBags(page, module)
    local row = page:Section("背包"):QuadRow()
    local adapter = module.adapter
    local function NativeState()
        local value, mutable, reason = adapter:GetBagSortState()
        local blocked = BagSortBlocked(module)
        if blocked then return value, false, blocked end
        if not mutable then return value, false, reason end
        local provider = ns.ExtraToolsBagSortIntegration
        if provider then
            local owned, ownershipReason = provider:GetOwnershipState()
            if owned ~= false then return value, false, ownershipReason end
        end
        return value, mutable, reason
    end
    row:Checkbox("nativeBagSort", {
        text = "原生反向整理",
        getValue = function() return NativeState() end,
        getEnabled = function() local _, mutable = NativeState(); return mutable end,
        tooltip = function() local _, _, reason = NativeState(); return reason end,
        onEnter = function() page:Refresh("bag-sort-hover") end,
        onChange = function(_, value)
            local _, mutable, reason = NativeState()
            if mutable then
                FinishBagSort(page, module, adapter:SetBagSortEnabled(value))
            elseif reason then module:Notify(reason) end
        end,
    })
    -- Keep disabled controls non-clickable, but let their native OnEnter/OnLeave fire.
    local nativeFrame = page:GetControl("nativeBagSort").frame
    if nativeFrame and nativeFrame.SetMotionScriptsWhileDisabled then
        nativeFrame:SetMotionScriptsWhileDisabled(true)
    end
    local bagSort = ns.ExtraToolsBagSortIntegration
    if bagSort then
        row:Checkbox("providerBagSort", {
            text = "Elles反向整理",
            getValue = function() return bagSort:GetState() end,
            getEnabled = function() local _, mutable = bagSort:GetState(); return mutable and not BagSortBlocked(module) end,
            tooltip = function()
                local _, _, description = bagSort:GetState()
                return (BagSortBlocked(module) or description) .. "|n开启后物品靠底部、空格留在顶部，不反转物品自身顺序。"
            end,
            onEnter = function() page:Refresh("bag-sort-hover") end,
            onChange = function(_, value)
                if BagSortBlocked(module) then return end
                FinishBagSort(page, module, bagSort:SetEnabled(value))
            end,
        })
    end
end

local function BuildBlizzard(page, module, features)
    AddModuleStatus(page, module)
    if features.backpack then BuildBags(page, module) end
    if features.lootSparkles then
        page:Section("物品提示"):QuadRow():Checkbox("lootSparkles", {
            text = "拾取物闪光",
            getValue = function() return module:GetBlizzardUIDB().lootSparkles end,
            value = module:GetBlizzardUIDB().lootSparkles,
            tooltip = "开启拾取物闪光，不改动角色轮廓设置。关闭此项恢复启用前的闪光设置。旧版曾关闭的轮廓将按保存的原值恢复，保留后续手动调整。",
            onChange = function(_, value) SetSectionBoolean(module, "blizzardUI", "lootSparkles", value) end,
        })
    end
    if ns.SwingTimerPolicySettings and ns.SwingTimerPolicy then
        ns.SwingTimerPolicySettings:BuildSection(page, ns.SwingTimerPolicy)
    end
    if features.windowDrag then
        page:Section("暴雪窗口移动解锁"):QuadRow():Checkbox("unlockWindowDrag", {
            text = "解锁拖动",
            tooltip = "直接拖动窗口空白处或标题。关闭后回到原位，不保存位置。"
                .. "BlizzMove 或 Elles 窗口移位已经接管的窗口保持原方式。",
            value = module:GetBlizzardUIDB().unlockWindowDrag,
            getValue = function() return module:GetBlizzardUIDB().unlockWindowDrag end,
            onChange = function(_, value)
                SetSectionBoolean(module, "blizzardUI", "unlockWindowDrag", value)
            end,
        })
    end
    if features.merchantExpansion then
        page:Section("商人界面"):QuadRow():Checkbox("merchantExpansion", {
            text = "界面拓展",
            tooltip = "把商人窗口加宽成四列，每页多显示几件货物，顶部带搜索框，默认开启。"
                .. "界面已经改成整页列表时保持列表，不再改宽度。",
            value = module:GetBlizzardUIDB().merchantExpansion,
            getValue = function() return module:GetBlizzardUIDB().merchantExpansion end,
            onChange = function(_, value)
                SetSectionBoolean(module, "blizzardUI", "merchantExpansion", value)
            end,
        })
    end
    if features.knownRecipeTint then
        page:Section("配方提示"):QuadRow():Checkbox("knownRecipeTint", {
            text = "已学配方染色",
            tooltip = "商人、拍卖行和公会银行里，已经学会的配方染成绿色，默认开启。"
                .. "检测到你另外装了 Already Known? 时由它负责，这里不重复染色。",
            value = module:GetBlizzardUIDB().knownRecipeTint,
            getValue = function() return module:GetBlizzardUIDB().knownRecipeTint end,
            onChange = function(_, value)
                SetSectionBoolean(module, "blizzardUI", "knownRecipeTint", value)
            end,
        })
    end
    local blizzard = module:GetBlizzardUIDB()
    local blizzardUI = page:Section("隐藏暴雪界面元素")
    local options = blizzardUI:QuadRow()
    local optionCount = 0
    local function optionRow()
        if optionCount % 4 == 0 then options = blizzardUI:QuadRow() end
        optionCount = optionCount + 1
        return options
    end

    optionRow():Checkbox("hideMicroMenu", {
        text = "隐藏微型菜单",
        tooltip = module.adapter.family == "classic" and module.adapter.buildId ~= "classic-infinite"
            and "默认在已加载的 NDui、ElvUI 或 EllesmereUI 启用动作条时隐藏；手动选择优先。关闭隐藏时恢复显示原生菜单。"
            or "独立控制暴雪原生微型菜单，不与 RS 微型菜单栏联动。",
        value = blizzard.hideMicroMenu,
        getValue = function() return module:GetBlizzardUIDB().hideMicroMenu end,
        getEnabled = function() return true end,
        onChange = function(_, value) SetSectionBoolean(module, "blizzardUI", "hideMicroMenu", value) end,
    })
    if features.backpack then
        local function ExternalMenuHidden()
            return type(module.IsExternalMicroMenuAutoHidden) == "function"
                and module:IsExternalMicroMenuAutoHidden()
        end
        optionRow():Checkbox("hideBackpackButton", {
            text = "隐藏背包按钮",
            tooltip = "隐藏暴雪原生背包按钮；检测到其他组件接管时会锁定此项。",
            value = blizzard.hideBackpackButton or ExternalMenuHidden(),
            enabled = not ExternalMenuHidden(),
            getValue = function()
                return module:GetBlizzardUIDB().hideBackpackButton or ExternalMenuHidden()
            end,
            getEnabled = function() return not ExternalMenuHidden() end,
            onChange = function(_, value) SetSectionBoolean(module, "blizzardUI", "hideBackpackButton", value) end,
        })
    end
    if features.endCaps then
        optionRow():Checkbox("hideGryphons", {
            text = "隐藏狮鹫图标",
            tooltip = "隐藏主动作条左右两侧的狮鹫装饰。",
            value = blizzard.hideGryphons,
            getValue = function() return module:GetBlizzardUIDB().hideGryphons end,
            onChange = function(_, value) SetSectionBoolean(module, "blizzardUI", "hideGryphons", value) end,
        })
    end
    if features.hidePTRFeedback then
        optionRow():Checkbox("hidePTRFeedback", {
            text = "隐藏测试服窗口",
            tooltip = "隐藏暴雪内置的测试服反馈窗口和它附带的虫子按钮，默认开启；"
                .. "它们只在 beta 或测试服客户端存在。",
            value = blizzard.hidePTRFeedback,
            getValue = function() return module:GetBlizzardUIDB().hidePTRFeedback end,
            onChange = function(_, value)
                SetSectionBoolean(module, "blizzardUI", "hidePTRFeedback", value)
                module:ApplyPTRFeedbackVisibility()
            end,
        })
    end
    if features.minimapEventButton then
        -- The requested label needs a full row at small UI scales.
        blizzardUI:Row():Checkbox("hideMinimapEventButton", {
            text = "隐藏小地图活动按钮",
            tooltip = "仅国服时光服生效",
            value = blizzard.hideMinimapEventButton,
            getValue = function() return module:GetBlizzardUIDB().hideMinimapEventButton end,
            onChange = function(_, value)
                SetSectionBoolean(module, "blizzardUI", "hideMinimapEventButton", value)
            end,
        })
    end
    if features.addonCompartment then
        optionRow():Checkbox("hideAddonCompartment", {
            text = "隐藏插件收纳栏",
            tooltip = "隐藏暴雪小地图旁的插件收纳栏按钮。",
            value = module:GetProfile().hideAddonCompartment,
            getValue = function() return module:GetProfile().hideAddonCompartment end,
            onChange = function(_, value) SetRootBoolean(module, "hideAddonCompartment", value) end,
        })
    end
    if features.editMode then
        local import = page:Section("编辑模式导入辅助")
        local importOptions = import:QuadRow()
        importOptions:Checkbox("enableLeftHint", {
            text = "左侧提示文字",
            value = module:GetProfile().enableLeftHint,
            getValue = function() return module:GetProfile().enableLeftHint end,
            tooltip = "在导入界面左侧显示操作提示文字。",
            onChange = function(_, value) SetRootBoolean(module, "enableLeftHint", value) end,
        })
        importOptions:Checkbox("enableImportCopyButton", {
            text = "显示复制按钮",
            value = module:GetProfile().enableImportCopyButton,
            getValue = function() return module:GetProfile().enableImportCopyButton end,
            tooltip = "在导入界面显示用于复制内容的快捷按钮。",
            onChange = function(_, value) SetRootBoolean(module, "enableImportCopyButton", value) end,
        })
    end
end

local function BuildLFG(page, module)
    AddModuleStatus(page, module)
    local lfg = module:GetLFGToolsDB()
    local lfgTools = page:Section("随机本快捷工具")
    local checks = {
        { "showLeaveButton", "显示退队", "showLeaveButton", "显示离开副本队伍的快捷按钮。" },
        { "showTeleportButton", "显示传送", "showTeleportButton", "显示传送出或进入随机副本的快捷按钮。" },
        { "useNDuiPosition", "NDui 独立坐标", "useNDuiPosition", "使用适配 NDui 的独立按钮位置。" },
        { "useElvUIPosition", "ElvUI 独立坐标", "useElvUIPosition", "使用适配 ElvUI 的独立按钮位置。" },
    }
    local row
    local index
    for index = 1, #checks do
        local entry = checks[index]
        local key, label, field, tooltip = entry[1], entry[2], entry[3], entry[4]
        if index == 1 or index == 5 then
            row = lfgTools:QuadRow()
        end
        row:Checkbox(key, {
            text = label, value = lfg[field],
            getValue = function() return module:GetLFGToolsDB()[field] end,
            tooltip = tooltip,
            onChange = function(_, value) SetSectionBoolean(module, "lfgTools", field, value) end,
        })
    end
    lfgTools:ActionRow():Popover("lfgAppearance", {
        title = "随机本工具外观", button = { text = "样式调整" }, rows = {
            { kind = "slider", key = "lfgScale",
                text = "缩放", min = 0.5, max = 2, step = 0.05, value = lfg.scale,
                getValue = function() return module:GetLFGToolsDB().scale end,
                onChange = function(_, value)
                    module:GetLFGToolsDB().scale = tonumber(value) or 1
                    module:UpdateLFGTools()
                end,
            },
            { kind = "slider", key = "lfgAlpha",
                text = "透明度", min = 0.2, max = 1, step = 0.05, value = lfg.alpha,
                getValue = function() return module:GetLFGToolsDB().alpha end,
                onChange = function(_, value)
                    module:GetLFGToolsDB().alpha = tonumber(value) or 1
                    module:UpdateLFGTools()
                end,
            },
        },
    })
    if ns.RoleGuardSettings and ns.RoleGuard then
        ns.RoleGuardSettings:BuildSection(page, ns.RoleGuard)
    end
    local actions = page:FooterActions({ columns = 3 })
    local visible = function() return true end
    actions:Button("lfgPreview", { action = "preview", onDeactivate = function() if ns.LFGTools.lfgToolsPreviewMode then ns.LFGTools:SetLFGToolsPreview(false) end end,
        getVisible = visible,
        text = module.lfgToolsPreviewMode and "取消预览" or "预览模式",
        getText = function() return module.lfgToolsPreviewMode and "取消预览" or "预览模式" end,
        onAction = function(control)
            module:SetLFGToolsPreview(not module.lfgToolsPreviewMode)
            control:SetText(module.lfgToolsPreviewMode and "取消预览" or "预览模式")
        end,
    })
    actions:Button("lfgResetPosition", { action = "resetPosition",
        text = "重置位置", getVisible = visible, onAction = function() module:ResetLFGToolsPosition() end,
    })
    actions:Button("lfgResetDefaults", { action = "restoreDefaults",
        text = "恢复默认", getVisible = visible,
        tooltip = "仅恢复随机本工具的显示、位置与外观设置。",
        onAction = function()
            page:ClosePopovers()
            page:ShowTextDialog({
                title = "恢复随机本工具默认设置", confirmLabel = "恢复默认",
                description = "仅作用于随机本工具。",
                value = "恢复该工具的显示、位置与外观；不影响本页其他工具。",
                onConfirm = function()
                    module:ResetLFGToolsDefaults()
                    page:Refresh("reset-lfg-defaults")
                    return true
                end,
            })
        end,
    })
end

local function BuildPluginsClassic(page, module)
    AddModuleStatus(page, module)
    local blocker = module:GetUpdateBlockerDB()
    page:Section("ElvUI 更新屏蔽"):QuadRow():Checkbox("elvuiUpdateBlocker", {
        text = "屏蔽 ElvUI 更新提醒", value = blocker.enabled,
        getValue = function() return module:GetUpdateBlockerDB().enabled end,
        tooltip = "阻止 ElvUI 显示版本更新提醒。",
        onChange = function(_, value) SetSectionBoolean(module, "elvuiUpdateBlocker", "enabled", value) end,
    })
    if module.adapter.features.minimapVolume then
        BuildPluginsEllesmere(page, module)
    else
        page:Section("说明"):Description("其他第三方插件专属增强仅在正式服或无限服提供。")
    end
end

local function BuildPage(context, module, features, pageId, builder)
    local resolvedId = pageId or Settings.pageId
    local page, reason = ns.UI:CreateSettingsPage(context, { id = resolvedId })
    if not page then
        error("Unable to create ExtraTools settings page: " .. tostring(reason), 2)
    end
    context.extraToolsSettingsPage = page
    context.extraToolsSettingsPageId = resolvedId
    if context.extraToolsSettingsBuilt then
        Settings:Refresh(context, module)
        page:Refresh("reuse")
        return page
    end

    if builder then builder(page, module, features) end
    context.extraToolsSettingsBuilt = true
    page:Finish()
    return page
end

function Settings:Refresh(context, module)
    local page = context and context.extraToolsSettingsPage
    if not page then return false end
    local bagSort = ns.ExtraToolsBagSortIntegration
    local bagControl = page:GetControl("providerBagSort")
    if bagSort and bagControl then
        local enabled, mutable = bagSort:GetState()
        bagControl:SetValue(enabled, true)
        bagControl:SetEnabled(mutable and not BagSortBlocked(module))
    end
    local nativeBagControl = page:GetControl("nativeBagSort")
    if nativeBagControl then
        local value, mutable = module.adapter:GetBagSortState()
        if bagSort and bagSort:GetOwnershipState() ~= false then mutable = false end
        nativeBagControl:SetValue(value, true)
        nativeBagControl:SetEnabled(mutable and not BagSortBlocked(module))
    end
    local celestialPreview = page:GetControl("celestialPreview")
    local lfgPreview = page:GetControl("lfgPreview")
    if celestialPreview then
        celestialPreview:SetText(module.celestialPreviewMode and "取消预览" or "预览模式")
    end
    if lfgPreview then
        lfgPreview:SetText(module.lfgToolsPreviewMode and "取消预览" or "预览模式")
    end
    if ns.RoleGuardSettings and ns.RoleGuard then
        ns.RoleGuardSettings:Refresh(page, ns.RoleGuard)
    end
    if ns.SwingTimerPolicySettings and ns.SwingTimerPolicy and page:GetControl("swingTimerManaged") then
        ns.SwingTimerPolicySettings:Refresh(page, ns.SwingTimerPolicy)
    end
    return true
end

local function FeatureSwitch(module)
    return {
        GetState = function(out)
            out.available = module ~= nil
            out.enabled = module and ns.Assembly:IsModuleEnabled(module:GetName()) or false
            out.mutable = out.available and not module.adapter:IsInCombat()
            out.active = module and module.runtimeActive == true or false
            out.pending = false
            out.reason = not out.mutable and "战斗结束后可更改。" or nil
            return out
        end,
        SetEnabled = function(value) return module:SetEnabled(value) end,
    }
end

function Settings:Register(module, features)
    if self.registered then return true end
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    if not system or type(system.RegisterPage) ~= "function" then return false end

    local pageSpecs = {
        {
            id = "blizzard-ui",
            title = "暴雪界面增强",
            group = "interface",
            order = 70,
            description = "隐藏暴雪原生界面元素，并管理平砍计时与编辑模式导入辅助。",
            searchKeywords = {
                "暴雪界面增强", "暴雪窗口移动解锁", "解锁拖动", "商人界面", "界面拓展", "隐藏", "微型菜单", "背包", "狮鹫", "暴雪",
                "平砍", "Swing Timer", "插件收纳栏", "编辑模式", "导入提示", "复制按钮",
                "界面增强", "原生反向整理", "背包反序", "从底部开始排列", "Elles反向整理",
            },
            builder = function(page, module, currentFeatures)
                BuildBlizzard(page, module, currentFeatures)
            end,
            onShow = function()
                if ns.SwingTimerPolicy then ns.SwingTimerPolicy:SetSettingsVisible(true) end
            end,
            onHide = function(context)
                if ns.SwingTimerPolicy then ns.SwingTimerPolicy:SetSettingsVisible(false) end
                if ns.SwingTimerPolicySettings and context and context.extraToolsSettingsPage then
                    ns.SwingTimerPolicySettings:Refresh(context.extraToolsSettingsPage, ns.SwingTimerPolicy)
                end
            end,
        },
        {
            id = "quest",
            title = "任务与拾取",
            group = "qol",
            order = 60,
            description = "自动出售垃圾、快速拾取、任务自动交接与完成语音。",
            searchKeywords = {
                "任务与拾取", "任务", "拾取", "自动出售垃圾", "快速拾取",
                "任务自动交接", "自动接任务", "自动交任务", "任务完成语音", "播音冷却", "工作完成", "Bingo", "Shift", "体验优化",
            },
            builder = function(page, module)
                BuildQuestAutomation(page, page, module)
            end,
        },
        {
            id = "lfg-tools",
            title = "随机本工具",
            group = "qol",
            order = 70,
            description = "配置随机副本退队、传送、显示样式与进组职责保护。",
            searchKeywords = {
                "随机本工具", "随机本", "传送", "退队", "进组职责保护",
                "NDui 独立坐标", "ElvUI 独立坐标", "体验优化",
            },
            builder = function(page, module)
                BuildLFG(page, module)
            end,
            visible = function()
                return features.lfgTools == true
            end,

            onHide = function()
                if ns.LFGTools.lfgToolsPreviewMode then ns.LFGTools:SetLFGToolsPreview(false) end
            end,
        },
        {
            id = "celestial",
            title = "天神能量条",
            group = "qol",
            order = 80,
            description = "显示、移动并调整天神能量条外观。",
            searchKeywords = { "天神能量条", "天神条", "天神", "简洁模式", "体验优化" },
            builder = function(page, module)
                BuildCelestial(page, module, page, page:FooterActions({ columns = 3 }), function() return true end)
            end,
            visible = function()
                return features.celestialBar == true
            end,
            onHide = function()
                if ns.CelestialBar.celestialPreviewMode then ns.CelestialBar:SetCelestialBarPreview(false) end
            end,
        },
        {
            id = "extratools",
            title = "插件增强",
            group = "qol",
            order = 50,
            description = "配置第三方插件的专属增强。",
            searchKeywords = {
                "管理工具", "插件增强", "EllesmereUI", "ElvUI", "BigWigs",
                "Details", "TinyInspect", "集合石", "国服符文兼容",
                "小地图音量", "面板位置清理", "更新屏蔽",
            },
            builder = function(page, module)
                if module.adapter.family == "retail" then
                    BuildPluginsRetail(page, module)
                else
                    BuildPluginsClassic(page, module)
                end
            end,
            onHide = function(context)
                if ns.EUIPanelCleanup then ns.EUIPanelCleanup:HideSettings(context.extraToolsSettingsPage) end
            end,
        },
    }

    ns.ExtraToolsPageDefinitions = ns.ExtraToolsPageDefinitions or {}
    local owners = {
        ["blizzard-ui"] = ns.BlizzardEnhancements, quest = ns.LootTools,
        ["lfg-tools"] = ns.LFGTools, celestial = ns.CelestialBar, extratools = ns.PluginEnhancements,
    }
    local function MakeDefinition(spec)
        local module = assert(owners[spec.id], spec.id)
        local definition = {
            title = spec.title,
            description = spec.description,
            group = spec.group,
            navigationOrder = spec.order,
            searchKeywords = spec.searchKeywords,
            showInNavigation = true,
            build = function(context)
                return BuildPage(context, module, features, spec.id, spec.builder)
            end,
            onShow = function(context)
                Settings:Refresh(context, module)
                if spec.onShow then spec.onShow(context) end
            end,
            onHide = function(context)
                Settings:Refresh(context, module)
                if spec.onHide then spec.onHide(context) end
            end,
            onRefresh = function(context) Settings:Refresh(context, module) end,
        }
        if spec.visible then definition.visible = spec.visible end
        definition.navigationSwitch = FeatureSwitch(module)
        return definition
    end

    for _, spec in ipairs(pageSpecs) do
        local definition = MakeDefinition(spec)
        ns.ExtraToolsPageDefinitions[spec.id] = definition
        local registered = system:RegisterPage(spec.id, definition)
        if spec.id == "extratools" then
            ns.ExtraToolsPageDefinition = definition
            self.registered = registered and true or false
        end
    end
    return self.registered
end

ns.ExtraToolsSettings = Settings
