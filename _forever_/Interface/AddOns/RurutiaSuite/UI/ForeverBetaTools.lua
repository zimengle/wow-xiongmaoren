-- 文件职责：把独立插件「[露露] 无限测试服修复」（ForeverMapFix 目录）的
-- 两个修复开关接入 RS 设置导航，作为“管理工具 → 测试服工具”条件页。
--
-- 与 UI/Extensions.lua 同级放在 UI/：这是宿主侧的页面接入，既不是
-- Modules 下的产品模块，也不是 Core/Presentation 的展示页，
-- 因此不进入 docs/project/rs-new-generation-cutover/UI_DESIGN_CONTRACT.json
-- 的页面清单；该清单只登记 Modules/Core-Presentation/Core-ClassicUI/RSS 的产品页。
--
-- 边界（见 docs/project/infinite-character-panel-fix/README.md）：
--   1. 修复功能与它的启用配置属于独立插件；本文件不持有第二份开关、
--      不建第二个设置窗口、不加底栏按钮，只登记 options 页面。
--   2. 只有无限（classic-infinite）且 provider 真实可用时才注册该页。
--   3. 首次打开页面时创建控件，重复打开复用；控件状态每次都回读 provider。
--   4. RS 不在或独立插件不在时本文件不工作，独立插件照常运行。
--
-- provider 合同（由独立插件提供，见 ForeverMapFix/Core/Core.lua）：
--   _G.ForeverBetaToolsAPI = {
--     version = 1,
--     IsAdapted(module)            -> boolean
--     GetModuleState(module)       -> { enabled, active, adapted, reloadRequired, ... }
--     SetModuleEnabled(module, on) -> boolean
--     OnStateChanged(callback)     -> token
--     OffStateChanged(token)       -> boolean
--   }
-- module 取 "map" 或 "character"。
local _, ns = ...

local PAGE_ID = "testtools"
local ROUTE_PREFIX = "forevermaptools"
local ROUTE = ROUTE_PREFIX .. "-" .. PAGE_ID
local OWNER = "ForeverMapFix"
local API_VERSION = 1
local MODULE_MAP = "map"
local MODULE_CHARACTER = "character"

-- 只在无限客户端做任何事：其他客户端连命名空间都不登记，
-- 不出现不适配的设置页，也不留下可被误用的入口。
-- Build 描述符由 Core/Build.lua 在本文件之前提供。
local function IsSupportedClient()
    return type(ns.Build) == "table" and type(ns.Build.GetID) == "function"
        and ns.Build.GetID() == "classic-infinite"
end

if not IsSupportedClient() then return end

local Extension = {
    route = ROUTE,
    pageId = PAGE_ID,
    owner = OWNER,
    handle = nil,
    registered = false,
    suppressed = false,
    -- 页面是否正在显示。只有显示期间才持有 provider 订阅。
    active = false,
    listener = nil,
    context = nil,
    page = nil,
}
ns.ForeverBetaTools = Extension

local function Print(message)
    if ns.Print then ns.Print(message) end
end

-- 只在无限注册该页；其他客户端在文件顶部已整体退出。
-- provider 真实可用性：每次调用重新读全局，不缓存失败，
-- 也不把“插件出现在插件列表里”当成可用。
local function Provider()
    local api = _G.ForeverBetaToolsAPI
    if type(api) ~= "table" or api.version ~= 1 then return nil end
    if type(api.IsAdapted) ~= "function" or type(api.GetModuleState) ~= "function"
        or type(api.SetModuleEnabled) ~= "function" or type(api.OnStateChanged) ~= "function"
        or type(api.OffStateChanged) ~= "function" then
        return nil
    end
    return api
end

local function Host()
    return type(ns.Extensions) == "table" and ns.Extensions or nil
end

local function IsInstalled()
    local api = _G.C_AddOns
    if type(api) ~= "table" or type(api.IsAddOnLoaded) ~= "function" then return false end
    local invoked, loaded = pcall(api.IsAddOnLoaded, OWNER)
    return invoked and loaded == true
end

-- 该修复在当前客户端是否适配。provider 缺失时（插件未加载、旧版本）返回 false。
local function IsAdapted(module)
    local api = Provider()
    if not api then return false end
    local invoked, adapted = pcall(api.IsAdapted, module)
    return invoked and adapted == true
end

-- 只读状态快照；provider 缺失或异常时返回 nil，由调用方按"不可用"处理。
local function State(module)
    local api = Provider()
    if not api then return nil end
    local invoked, state = pcall(api.GetModuleState, module)
    if not invoked or type(state) ~= "table" then return nil end
    return state
end

local function IsTW()
    if type(GetLocale) ~= "function" then return false end
    local invoked, locale = pcall(GetLocale)
    return invoked and locale == "zhTW"
end

-- 两个开关逐字使用合同文案；简繁各自的说明都标明适配与是否需要重载。
local SWITCHES = {
    {
        key = "mapFix",
        module = MODULE_MAP,
        label = "修复测试服绿色地图",
        labelTW = "修復測試服綠色地圖",
        detail = "用英文地图图片替换世界地图底图和已探索区域；关闭后立即恢复原始地图，不需要重载。",
        detailTW = "用英文地圖圖片替換世界地圖底圖與已探索區域；關閉後立即還原原始地圖，不需要重新載入。",
    },
    {
        key = "characterPanelFix",
        module = MODULE_CHARACTER,
        label = "修复测试服人物面板报错",
        labelTW = "修復測試服角色面板報錯",
        detail = "接管人物窗口的模型与属性显示；停止后要 /reload 才会彻底移除已接管回调。",
        detailTW = "接管角色視窗的模型與屬性顯示；停用後要 /reload 才會完全移除已接管回呼。",
    },
}

local function SwitchLabel(switch)
    return IsTW() and switch.labelTW or switch.label
end

local function SwitchDetail(switch, state)
    local detail = IsTW() and switch.detailTW or switch.detail
    if not IsAdapted(switch.module) then
        return detail .. (IsTW() and "（目前客戶端不適用）" or "（当前客户端不适配）")
    end
    if state and state.reloadRequired then
        return detail .. (IsTW() and "（需重新載入介面）" or "（需重载界面）")
    end
    return detail
end

-- 状态区文案全部来自 provider 的只读状态，RS 不复制一份配置。
local function StatusLines()
    if not Provider() then
        return IsTW() and "尚未偵測到修復插件；請確認已安裝並啟用。"
            or "尚未检测到修复插件；请确认已安装并启用。"
    end
    local lines = {}
    for _, switch in ipairs(SWITCHES) do
        local switchState = State(switch.module)
        local parts = {}
        parts[#parts + 1] = IsAdapted(switch.module)
            and (IsTW() and "目前客戶端適用" or "当前客户端适配")
            or (IsTW() and "目前客戶端不適用" or "当前客户端不适配")
        if switchState then
            parts[#parts + 1] = switchState.enabled
                and (IsTW() and "已啟用" or "已启用")
                or (IsTW() and "已停用" or "已停用")
            if switchState.reloadRequired then
                parts[#parts + 1] = IsTW() and "需重新載入介面" or "需重载界面"
            end
        end
        lines[#lines + 1] = SwitchLabel(switch) .. "：" .. table.concat(parts, "，")
    end
    return table.concat(lines, "\n")
end

-- provider 状态变化只刷新"真正显示中"的那一个页面。
--   key == nil 表示独立插件的全模块收敛（含初始化通知），必须当作相关事件；
--   否则订阅者在页面打开前注册就永远拿不到初值。
local function Refresh(origin)
    if Extension.suppressed then return end
    if Provider() == nil then return end
    if not Extension.active then return end
    local page = Extension.page
    if type(page) ~= "table" or type(page.Refresh) ~= "function" then return end
    -- 关窗或切页后不再做任何渲染；重新打开时 onShow 会再读一次 provider。
    local context = Extension.context
    if type(context) == "table" and context.visible == false then return end
    if origin ~= nil and origin ~= MODULE_MAP and origin ~= MODULE_CHARACTER then return end
    pcall(page.Refresh, page, "forever-beta-tools-state")
end

-- 订阅只在页面显示期间存在：打开时订阅，关窗或切页时退订。
-- 扩展 Disable 另外做一次兜底清理。
local function Subscribe()
    if Extension.listener ~= nil then return end
    if not Extension.active then return end
    local api = Provider()
    if not api then return end
    local invoked, token = pcall(api.OnStateChanged, Refresh)
    if invoked and token ~= nil then Extension.listener = token end
end

local function Unsubscribe()
    if Extension.listener == nil then return end
    local api = Provider()
    if api then
        pcall(api.OffStateChanged, Extension.listener)
    end
    Extension.listener = nil
end

local function BuildPage(context)
    local ui = ns.UI
    if type(ui) ~= "table" or type(ui.CreateSettingsPage) ~= "function" then
        return false, "RurutiaSuite SettingsBuilder is unavailable"
    end
    local page, reason = ui:CreateSettingsPage(context, { id = ROUTE })
    if not page then return false, reason end

    local switches = page:Section(IsTW() and "修復功能" or "修复功能")
    for _, switch in ipairs(SWITCHES) do
        switches:Row():Checkbox(switch.key, {
            getText = function() return SwitchLabel(switch) end,
            -- 不适配的修复不可开关；两个开关彼此独立。
            getEnabled = function() return IsAdapted(switch.module) end,
            getValue = function()
                local switchState = State(switch.module)
                return switchState ~= nil and switchState.enabled == true
            end,
            tooltip = function() return SwitchDetail(switch, State(switch.module)) end,
            onChange = function(_, value)
                local api = Provider()
                if not api then return end
                pcall(api.SetModuleEnabled, switch.module, value == true)
                -- 点击后立刻按 provider 回读一次；origin 用被点模块的键。
                Refresh(switch.module)
            end,
        })
    end

    page:Section(IsTW() and "適用狀態" or "适配状态"):Description(StatusLines)
    page:Description(function()
        if not IsInstalled() then
            return IsTW() and "未偵測到獨立修復插件；本頁開關不會生效。"
                or "未检测到独立修复插件；本页开关不会生效。"
        end
        return IsTW() and "開關由獨立插件「[露露] 無限測試服修復」儲存；本頁不保存第二份設定。"
            or "开关由独立插件「[露露] 无限测试服修复」保存；本页不保存第二份配置。"
    end)

    page:Finish()
    return page
end

local function Attach(context)
    if type(context) == "table" then
        Extension.context = context
        Extension.page = context.foreverBetaToolsPage or Extension.page
        Extension.active = true
    end
    Subscribe()
    -- 重新打开时主动回读一次，不依赖 provider 之后还会不会再发通知。
    Refresh(nil)
end

local function Detach()
    Extension.context = nil
    Extension.page = nil
    Extension.active = false
    Unsubscribe()
end

local function Register()
    local extensions = Host()
    if type(extensions) ~= "table" or extensions.API_VERSION ~= API_VERSION
        or type(extensions.RegisterAddon) ~= "function" then
        return false, "RurutiaSuite Extensions API v1 is required"
    end

    local pageDefinition = {
        id = PAGE_ID,
        title = "测试服工具",
        description = "开启或关闭独立修复插件的测试服地图与人物面板修复。",
        group = "management",
        -- 管理工具组由设置导航会话引入。这里显式给出分组元数据，
        -- 使本页在导航重组落地前后都归入同一组，而不是多出一个同名组。
        groupTitle = "管理工具",
        groupOrder = 60,
        -- 组内顺序显式声明为 40：管理工具的现有成员占 10 / 20 / 30，
        -- 测试服工具排在它们之后，不靠加载先后决定位置。
        navigationOrder = 40,
        searchKeywords = { "测试服", "无限", "地图修复", "人物面板", "绿色地图", "ForeverMapFix" },
        -- 条件注册：provider 缺失时该页在导航中不可见，
        -- Registry 打开该页会返回 "page is not available"。
        visible = function() return Provider() ~= nil end,
        build = function(context)
            local page, reason = BuildPage(context)
            if not page then return page, reason end
            -- 页面首次打开即建好；provider 状态变化时用它做定向刷新。
            if type(context) == "table" then context.foreverBetaToolsPage = page end
            Extension.page = page
            return page
        end,
        -- 订阅只覆盖页面显示期间：关闭窗口或切到别的页都会触发 onHide。
        onShow = function(context, data, handle) Attach(context) end,
        onHide = function() Detach() end,
    }

    local definition = {
        apiVersion = API_VERSION,
        id = PAGE_ID,
        routePrefix = ROUTE_PREFIX,
        pages = { pageDefinition },
        module = {
            -- 纯登记：不注册游戏事件、不建常驻轮询、不持有修复配置。
            -- Enable 恢复被 Disable 关掉的抑制位，否则停用再激活会永久忽略通知。
            Enable = function()
                Extension.suppressed = false
            end,
            -- 兜底清理：正常情况下关窗的 onHide 已经退订。
            Disable = function()
                Extension.suppressed = true
                Detach()
            end,
        },
    }

    local handle, reason = extensions:RegisterAddon(OWNER, definition)
    if not handle then return false, reason end
    Extension.handle = handle
    Extension.registered = true
    return true
end

if not IsSupportedClient() then return end

-- 供定向测试与诊断使用；生产路径只经宿主回调。
ns.ForeverBetaToolsRegister = Register
ns.ForeverBetaToolsAttach = Attach
ns.ForeverBetaToolsDetach = Detach
ns.ForeverBetaToolsBuild = BuildPage

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, name)
    if event == "ADDON_LOADED" then
        if name ~= OWNER and name ~= "RurutiaSuite" then return end
        if not Extension.registered then
            local ok, reason = Register()
            if not ok and name == OWNER then
                -- RS 可能还没激活 Extensions；PLAYER_LOGIN 会再试一次。
                Extension.lastRegisterReason = reason
            end
        end
    elseif event == "PLAYER_LOGIN" then
        self:UnregisterEvent("PLAYER_LOGIN")
        if not Extension.registered then
            local ok, reason = Register()
            if not ok then
                Print("测试服工具页面未能注册：" .. tostring(reason))
            end
        end
    end
end)
