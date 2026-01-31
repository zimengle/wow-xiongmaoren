--[[
    GF_Auction Locale
    Multi-language support for enUS, zhCN, zhTW
]]

local locale = GetLocale()

local L = {}

-- English (enUS) - Default
L.enUS = {
    -- General
    ADDON_NAME = "GF_Auction",
    ADDON_DESC = "Auction House Enhancement Addon for Titan Reforged",
    
    -- Database
    DB_LOADED = "Database loaded",
    DB_SAVED = "Database saved",
    DB_CLEARED = "Database cleared",
    
    -- Price History
    PRICE_HISTORY = "Price History",
    
    -- Quick Actions
    QUICK_FILL = "Fill Price",
    UI_FULL_SCAN = "Full Scan",
    UI_FULL_SCAN_TOOLTIP_NORMAL = "Scan all item prices in the auction house.",
    UI_FULL_SCAN_TOOLTIP_WARN = "Please reload UI after scan is complete.",
    UI_FULL_SCAN_RELOAD_TEXT = "Scan complete. Reload UI to restore performance?",
    UI_RELOAD = "Reload",
    UI_CANCEL = "Cancel",
    UI_SEARCH = "Search Item",
    UI_VIEW = "View",
    UI_LEFT_CLICK = "Left Click:",
    UI_RIGHT_CLICK = "Right Click:",
    UI_COPY_NAME = "Copy name",
    UI_LATEST_PRICE = "Latest price:",
    
    -- UI
    UI_SELECT_ITEM = "Select an item in the auction house to view price history",
    UI_NO_SEARCH_YET = "You haven't searched yet!",
    UI_NO_SEARCH_YET_2 = "Please search in the auction house first",
    UI_COMING_SOON = "Coming soon",
    UI_NO_HISTORY = "No recent history",
    UI_ITEM_ID = "Item ID: %d",
    UI_MODULE_NOT_LOADED = "Price panel module not loaded",
    UI_CURRENT_PRICE = "Current Price",
    UI_HISTORY_PRICE = "History Price",
    UI_BASED_ON_CURRENT = "Current listings: %s (%s items)",
    UI_HIST_LOW_UNIT = "Low (per unit)",
    UI_HIST_LOW_STACK = "Low (per stack)",

    -- Compare
    UI_COMPARE = "Compare",
    UI_COMPARE_UNIT = "Unit",
    UI_COMPARE_STACK = "Stack",

    -- Auction
    UI_UNIT_MODE_UNIT = "Per unit/ea",
    UI_UNIT_MODE_STACK = "Per stack/stack",
    UI_UNIT_MODE_TT_UNIT_1 = "Current mode: Per item",
    UI_UNIT_MODE_TT_UNIT_2 = "Price = Stack size × Lowest (per item)",
    UI_UNIT_MODE_TT_UNIT_3 = "Note: prices may be manipulated by bot undercuts",
    UI_UNIT_MODE_TT_STACK_1 = "Current mode: Per stack price",
    UI_UNIT_MODE_TT_STACK_2 = "Price = #stacks × Lowest (per stack)",
    UI_MAX = "Max",
    UI_TOTAL_IN_BAGS = "Owned",
    UI_SELL_UNIT_PRICE_LABEL = "Unit:",
    UI_SELL_UNIT_PRICE_VALUE = "%s/ea",
    UI_BID_PRICE = "Bid",
    UI_BUYOUT_PRICE = "Buyout",
    UI_EXPECTED_PROFIT = "Expected Revenue",
    UI_RECOMMEND = "Undercut",
    UI_RECOMMEND_TOOLTIP = "Undercut by 1 copper",
    UI_START_AUCTION = "Start Auction",
    UI_NATIVE_LIST_GUIDE = "Native listing has no low-price protection.\nPlease list via [GF Auction].",
    UI_LOW_PRICE_WARN_TITLE = "Confirm listing",
    UI_LOW_PRICE_WARN_TEXT = "Much lower than reference price; may cause a loss.\n\nEntered: %s\nReference: %s\nDifference: %s",
    UI_LOW_PRICE_WARN_CONTINUE = "List anyway",
    UI_LOW_PRICE_WARN_CANCEL = "Cancel",
    UI_LOW_PRICE_WARN_RECLICK = "Confirmed. Click [Start Auction] again to post.",
    UI_NO_REF_PRICE_WARN_TEXT = "No reference price available; low-price protection is unavailable.\n\nEntered: %s",
    UI_NO_REF_PRICE_WARN_RECLICK = "Confirmed. Click [Start Auction] again to post.",
    UI_REASON_SELECT_ITEM = "Select an item first",
    UI_REASON_NO_ITEM_IN_BAGS = "No items in bags",
    UI_REASON_BID_EMPTY = "Bid must be > 0",
    UI_REASON_BUYOUT_LT_BID = "Buyout cannot be lower than bid",
    UI_REASON_INVALID_QTY = "Invalid quantity",

    -- Time Formats
    UI_DATA_UPDATED = "Data Updated: ",
    UI_TIME_JUST_NOW = "Just now",
    UI_TIME_MINUTES_AGO = "%d mins ago",
    UI_TIME_HOURS_AGO = "%d hours ago",
    UI_TIME_DAYS_AGO = "%d days ago",

    -- Buttons
    UI_LIST = "List",
    UI_LIST_TOOLTIP = "Switch to auction page",
    UI_BUY = "Buy",
    UI_UNIT_COUNT = "pcs",
    UI_UNIT_STACK = "stks",
    UI_BUY_NO_AUCTIONS = "No auctions available",
    UI_BUY_INSUFFICIENT_FUNDS = "Insufficient funds",
    UI_BUY_PENDING = "Waiting for purchase confirmation...",
    UI_BUYINFO_WILL_BUY = "Will buy:",
    UI_BUYINFO_WILL_PAY = "Will pay:",
    UI_BUYINFO_NO_BUYOUT = "No buyout",
    UI_BUYINFO_SESSION_QTY = "Bought (session):",
    UI_BUYINFO_SESSION_SPENT = "Spent (session):",
    UI_BUY_TT_DEFAULT_1 = "Selected item: prefer buying the selected item",
    UI_BUY_TT_DEFAULT_2 = "No selection: prefer buying the lowest buyout",
    UI_BUY_TT_SELECTED_1 = "Buy selected item",
    UI_BUY_TT_SELECTED_PAY = "Pay:",
    UI_BUY_TOAST_COUNT = "Bought: %d pcs",
    UI_BUY_TOAST_STACK = "Bought: %d stacks",
    UI_BUY_SUMMARY_QTY_COUNT = "%s: total bought %d pcs",
    UI_BUY_SUMMARY_QTY_STACK = "%s: total bought %d stacks",
    UI_BUY_SUMMARY_SPENT = "Total spent: %s",
    UI_FAV_ADD = "Add to Favorites",
    UI_FAV_REMOVE = "Remove from Favorites",
    UI_FAV_EMPTY = "No favorites yet.\nClick the star icon in Price Panel to add items.",
    UI_FAV_ADDED = "Added to favorites: %s",
    UI_FAV_EXISTS = "Already in favorites: %s",
    UI_FAV_COPY_HINT = "Click item or use copy button to copy",
    UI_FAV_IMPORT_EXPORT = "Import/Export",
    UI_FAV_IMPORT_EXPORT_TOOLTIP = "Click to import/export favorites",
    UI_FAV_IMPORT_EXPORT_TITLE = "Favorites",
    UI_FAV_EXPORT_BTN = "Export",
    UI_FAV_IMPORT_BTN = "Import",
    UI_FAV_CLOSE_BTN = "Close",
    UI_FAV_IMPORT_TOOLTIP = "Import favorites from clipboard",
    UI_FAV_EXPORT_TOOLTIP = "Export favorites to clipboard",
    UI_FAV_IMPORT_CHOOSE_MODE = "Choose import mode",
    UI_FAV_IMPORT_OVERWRITE = "Overwrite",
    UI_FAV_IMPORT_APPEND = "Append",
    UI_FAV_IMPORT_CANCEL = "Cancel",
    UI_FAV_IMPORT_EMPTY = "Please paste item IDs into the box first.",
    UI_FAV_IMPORT_DONE = "Imported: %d, Skipped: %d",
    
    -- Panel Switch
    UI_SHOW_FAVORITES = "Fav",
    UI_SHOW_FAVORITES_TOOLTIP = "Switch to favorites list",
    UI_NO_DATA_FAV_BTN = "Favorites",
    UI_NO_DATA_FAV_TT = "Open favorites",
    UI_BACK_TO_PRICE = "Back",
    UI_BACK_TO_PRICE_TOOLTIP = "Return to GFA main page",
    UI_INVENTORY = "Inventory",
    UI_INVENTORY_TOOLTIP = "View auctionable items in bags",
    UI_INVENTORY_CATEGORY_COMMON = "Common",
    UI_INVENTORY_CATEGORY_OTHER = "Other",

    -- Money
    UI_MONEY_GOLD = "g",
    UI_MONEY_SILVER = "s",
    UI_MONEY_COPPER = "c",
    
}

-- Simplified Chinese (zhCN)
L.zhCN = {
    -- General
    ADDON_NAME = "GF_Auction",
    ADDON_DESC = "泰坦重铸时光服拍卖行增强插件",
    
    -- Database
    DB_LOADED = "数据库已加载",
    DB_SAVED = "数据库已保存",
    DB_CLEARED = "数据库已清空",
    
    -- Price History
    PRICE_HISTORY = "价格历史",
    
    -- Quick Actions
    QUICK_FILL = "填充价格",
    UI_FULL_SCAN = "完整扫描",
    UI_FULL_SCAN_TOOLTIP_NORMAL = "扫描拍卖行所有物品价格",
    UI_FULL_SCAN_TOOLTIP_WARN = "扫描完成后请重新加载界面",
    UI_FULL_SCAN_RELOAD_TEXT = "扫描完成。重新加载界面以恢复性能？",
    UI_RELOAD = "重新加载",
    UI_CANCEL = "取消",
    UI_SEARCH = "搜索物品",
    UI_VIEW = "查看",
    UI_LEFT_CLICK = "左键点击:",
    UI_RIGHT_CLICK = "右键点击:",
    UI_COPY_NAME = "复制名称",
    UI_LATEST_PRICE = "最新单价：",
    
    -- UI
    UI_SELECT_ITEM = "在拍卖行中选择物品以查看价格信息",
    UI_NO_SEARCH_YET = "您还没有进行搜索哦！",
    UI_NO_SEARCH_YET_2 = "请先在拍卖行搜索一次",
    UI_COMING_SOON = "即将推出",
    UI_NO_HISTORY = "无最近历史",
    UI_ITEM_ID = "物品ID: %d",
    UI_MODULE_NOT_LOADED = "价格面板模块未加载",
    UI_CURRENT_PRICE = "当前价格",
    UI_HISTORY_PRICE = "历史价格",
    UI_BASED_ON_CURRENT = "当前在售 %s 条（共 %s 个）",
    UI_HIST_LOW_UNIT = "最低（每个）",
    UI_HIST_LOW_STACK = "最低（每组）",

    -- Compare
    UI_COMPARE = "对比",
    UI_COMPARE_UNIT = "每个",
    UI_COMPARE_STACK = "每组",

    -- Auction
    UI_UNIT_MODE_UNIT = "按单价/个",
    UI_UNIT_MODE_STACK = "按整组/组",
    UI_UNIT_MODE_TT_UNIT_1 = "当前模式：按每个物品",
    UI_UNIT_MODE_TT_UNIT_2 = "价格 = 个数 × 最低（每个）",
    UI_UNIT_MODE_TT_UNIT_3 = "注意：可能会被机器人恶意压价",
    UI_UNIT_MODE_TT_STACK_1 = "当前模式：按每组价格",
    UI_UNIT_MODE_TT_STACK_2 = "价格 = 组数 × 最低（每组）",
    UI_MAX = "最大",
    UI_TOTAL_IN_BAGS = "拥有",
    UI_SELL_UNIT_PRICE_LABEL = "单价：",
    UI_SELL_UNIT_PRICE_VALUE = "%s/个",
    UI_BID_PRICE = "竞拍价",
    UI_BUYOUT_PRICE = "一口价",
    UI_EXPECTED_PROFIT = "预计收益",
    UI_RECOMMEND = "压价",
    UI_RECOMMEND_TOOLTIP = "压价1铜",
    UI_START_AUCTION = "开始拍卖",
    UI_NATIVE_LIST_GUIDE = "原生上架不含低价保护\n请在GF Auction上架",
    UI_LOW_PRICE_WARN_TITLE = "确认上架",
    UI_LOW_PRICE_WARN_TEXT = "低于参考价较多，可能导致亏钱\n\n当前输入：%s\n参考价格：%s\n比参考低：%s",
    UI_LOW_PRICE_WARN_CONTINUE = "仍然上架",
    UI_LOW_PRICE_WARN_CANCEL = "取消",
    UI_LOW_PRICE_WARN_RECLICK = "已确认价格异常，请再次点击【开始拍卖】上架。",
    UI_NO_REF_PRICE_WARN_TEXT = "无法获取参考价，低价保护暂不可用。\n\n当前输入：%s",
    UI_NO_REF_PRICE_WARN_RECLICK = "已确认无参考价，请再次点击【开始拍卖】上架。",
    UI_REASON_SELECT_ITEM = "请先选择物品",
    UI_REASON_NO_ITEM_IN_BAGS = "背包内没有该物品",
    UI_REASON_BID_EMPTY = "起拍价不能为空",
    UI_REASON_BUYOUT_LT_BID = "一口价不能低于起拍价",
    UI_REASON_INVALID_QTY = "个/组数量无效",

    -- Time Formats
    UI_DATA_UPDATED = "数据更新：",
    UI_TIME_JUST_NOW = "刚刚",
    UI_TIME_MINUTES_AGO = "%d分钟前",
    UI_TIME_HOURS_AGO = "%d小时前",
    UI_TIME_DAYS_AGO = "%d天前",

    -- Buttons
    UI_LIST = "上架",
    UI_LIST_TOOLTIP = "切换到上架页",
    UI_BUY = "购买",
    UI_UNIT_COUNT = "个",
    UI_UNIT_STACK = "组",
    UI_BUY_NO_AUCTIONS = "没有可购买的拍卖",
    UI_BUY_INSUFFICIENT_FUNDS = "金币不足",
    UI_BUY_PENDING = "正在确认购买结果…",
    UI_BUYINFO_WILL_BUY = "即将购买：",
    UI_BUYINFO_WILL_PAY = "即将花费：",
    UI_BUYINFO_NO_BUYOUT = "无一口价",
    UI_BUYINFO_SESSION_QTY = "本次已买：",
    UI_BUYINFO_SESSION_SPENT = "本次已花：",
    UI_BUY_TT_DEFAULT_1 = "选中物品：优先购买选中的物品",
    UI_BUY_TT_DEFAULT_2 = "未选中物品：优先购买最低一口价",
    UI_BUY_TT_SELECTED_1 = "购买选中项",
    UI_BUY_TT_SELECTED_PAY = "支付：",
    UI_BUY_TOAST_COUNT = "已购买：%d个",
    UI_BUY_TOAST_STACK = "已购买：%d组",
    UI_BUY_SUMMARY_QTY_COUNT = "%s：本次共购买 %d 个",
    UI_BUY_SUMMARY_QTY_STACK = "%s：本次共购买 %d 组",
    UI_BUY_SUMMARY_SPENT = "本次购买总花费：%s",
    UI_FAV_ADD = "收藏该物品",
    UI_FAV_REMOVE = "取消收藏",
    UI_FAV_EMPTY = "暂无收藏物品\n请在价格面板点击星星图标添加收藏",
    UI_FAV_ADDED = "已添加到收藏：%s",
    UI_FAV_EXISTS = "已在收藏中：%s",
    UI_FAV_COPY_HINT = "单击条目或点击复制按钮复制名称",
    UI_FAV_IMPORT_EXPORT = "导入/导出",
    UI_FAV_IMPORT_EXPORT_TOOLTIP = "点击导入/导出收藏列表",
    UI_FAV_IMPORT_EXPORT_TITLE = "收藏列表",
    UI_FAV_EXPORT_BTN = "导出",
    UI_FAV_IMPORT_BTN = "导入",
    UI_FAV_CLOSE_BTN = "关闭",
    UI_FAV_IMPORT_TOOLTIP = "从剪贴板导入收藏列表",
    UI_FAV_EXPORT_TOOLTIP = "导出收藏列表到剪贴板",
    UI_FAV_IMPORT_CHOOSE_MODE = "选择导入方式",
    UI_FAV_IMPORT_OVERWRITE = "覆盖",
    UI_FAV_IMPORT_APPEND = "追加",
    UI_FAV_IMPORT_CANCEL = "取消",
    UI_FAV_IMPORT_EMPTY = "请先把内容粘贴到输入框",
    UI_FAV_IMPORT_DONE = "导入：%d，跳过：%d",
    
    -- Panel Switch
    UI_SHOW_FAVORITES = "收藏",
    UI_SHOW_FAVORITES_TOOLTIP = "切换到收藏列表",
    UI_NO_DATA_FAV_BTN = "收藏",
    UI_NO_DATA_FAV_TT = "打开收藏列表",
    UI_BACK_TO_PRICE = "返回",
    UI_BACK_TO_PRICE_TOOLTIP = "返回GFA主页",
    UI_INVENTORY = "库存",
    UI_INVENTORY_TOOLTIP = "查看背包内可拍卖的物品",
    UI_INVENTORY_CATEGORY_COMMON = "常用",
    UI_INVENTORY_CATEGORY_OTHER = "其它",

    -- Money
    UI_MONEY_GOLD = "金",
    UI_MONEY_SILVER = "银",
    UI_MONEY_COPPER = "铜",
    
}

-- Traditional Chinese (zhTW)
L.zhTW = {
    -- General
    ADDON_NAME = "GF_Auction",
    ADDON_DESC = "泰坦重鑄時光服拍賣行增強插件",
    
    -- Database
    DB_LOADED = "資料庫已載入",
    DB_SAVED = "資料庫已儲存",
    DB_CLEARED = "資料庫已清空",
    
    -- Price History
    PRICE_HISTORY = "價格歷史",
    
    -- Quick Actions
    QUICK_FILL = "填入價格",
    UI_FULL_SCAN = "完整掃描",
    UI_FULL_SCAN_TOOLTIP_NORMAL = "掃描拍賣行所有物品價格",
    UI_FULL_SCAN_TOOLTIP_WARN = "掃描完成後請重新載入介面",
    UI_FULL_SCAN_RELOAD_TEXT = "掃描完成。重新載入介面以恢復效能？",
    UI_RELOAD = "重新載入",
    UI_CANCEL = "取消",
    UI_SEARCH = "搜尋物品",
    UI_VIEW = "查看",
    UI_LEFT_CLICK = "左鍵點擊:",
    UI_RIGHT_CLICK = "右鍵點擊:",
    UI_COPY_NAME = "複製名稱",
    UI_LATEST_PRICE = "最新單價：",
    
    -- UI
    UI_SELECT_ITEM = "在拍賣行中選擇物品以查看價格資訊",
    UI_NO_SEARCH_YET = "您還沒有進行搜尋哦！",
    UI_NO_SEARCH_YET_2 = "請先在拍賣行搜尋一次",
    UI_COMING_SOON = "即將推出",
    UI_NO_HISTORY = "無最近歷史",
    UI_ITEM_ID = "物品ID: %d",
    UI_MODULE_NOT_LOADED = "價格面板模組未載入",
    UI_CURRENT_PRICE = "當前價格",
    UI_HISTORY_PRICE = "歷史價格",
    UI_BASED_ON_CURRENT = "當前在售 %s 條（共 %s 個）",
    UI_HIST_LOW_UNIT = "最低（每個）",
    UI_HIST_LOW_STACK = "最低（每組）",

    -- Compare
    UI_COMPARE = "對比",
    UI_COMPARE_UNIT = "每個",
    UI_COMPARE_STACK = "每組",

    -- Auction
    UI_UNIT_MODE_UNIT = "按單價/個",
    UI_UNIT_MODE_STACK = "按整組/組",
    UI_UNIT_MODE_TT_UNIT_1 = "當前模式：按每個物品",
    UI_UNIT_MODE_TT_UNIT_2 = "價格 = 個數 × 最低（每個）",
    UI_UNIT_MODE_TT_UNIT_3 = "注意：可能會被機器人惡意壓價",
    UI_UNIT_MODE_TT_STACK_1 = "當前模式：按每組價格",
    UI_UNIT_MODE_TT_STACK_2 = "價格 = 組數 × 最低（每組）",
    UI_MAX = "最大",
    UI_TOTAL_IN_BAGS = "擁有",
    UI_SELL_UNIT_PRICE_LABEL = "單價：",
    UI_SELL_UNIT_PRICE_VALUE = "%s/個",
    UI_BID_PRICE = "競拍價",
    UI_BUYOUT_PRICE = "一口價",
    UI_EXPECTED_PROFIT = "預計收益",
    UI_RECOMMEND = "壓價",
    UI_RECOMMEND_TOOLTIP = "壓價1銅",
    UI_START_AUCTION = "開始拍賣",
    UI_NATIVE_LIST_GUIDE = "原生上架不含低價保護\n請在GF Auction上架",
    UI_LOW_PRICE_WARN_TITLE = "確認上架",
    UI_LOW_PRICE_WARN_TEXT = "低於參考價較多，可能導致虧錢\n\n當前輸入：%s\n參考價格：%s\n比參考低：%s",
    UI_LOW_PRICE_WARN_CONTINUE = "仍然上架",
    UI_LOW_PRICE_WARN_CANCEL = "取消",
    UI_LOW_PRICE_WARN_RECLICK = "已確認價格異常，請再次點擊【開始拍賣】上架。",
    UI_NO_REF_PRICE_WARN_TEXT = "無法取得參考價，低價保護暫不可用。\n\n當前輸入：%s",
    UI_NO_REF_PRICE_WARN_RECLICK = "已確認無參考價，請再次點擊【開始拍賣】上架。",
    UI_REASON_SELECT_ITEM = "請先選擇物品",
    UI_REASON_NO_ITEM_IN_BAGS = "背包內沒有該物品",
    UI_REASON_BID_EMPTY = "起拍價不能為空",
    UI_REASON_BUYOUT_LT_BID = "一口價不能低於起拍價",
    UI_REASON_INVALID_QTY = "個/組數量無效",

    -- Time Formats
    UI_DATA_UPDATED = "資料更新：",
    UI_TIME_JUST_NOW = "剛剛",
    UI_TIME_MINUTES_AGO = "%d分鐘前",
    UI_TIME_HOURS_AGO = "%d小時前",
    UI_TIME_DAYS_AGO = "%d天前",

    -- Buttons
    UI_LIST = "上架",
    UI_LIST_TOOLTIP = "切換到上架頁",
    UI_BUY = "購買",
    UI_UNIT_COUNT = "個",
    UI_UNIT_STACK = "組",
    UI_BUY_NO_AUCTIONS = "沒有可購買的拍賣",
    UI_BUY_INSUFFICIENT_FUNDS = "金幣不足",
    UI_BUY_PENDING = "正在確認購買結果…",
    UI_BUYINFO_WILL_BUY = "即將購買：",
    UI_BUYINFO_WILL_PAY = "即將花費：",
    UI_BUYINFO_NO_BUYOUT = "無一口價",
    UI_BUYINFO_SESSION_QTY = "本次已買：",
    UI_BUYINFO_SESSION_SPENT = "本次已花：",
    UI_BUY_TT_DEFAULT_1 = "選中物品：優先購買選中的物品",
    UI_BUY_TT_DEFAULT_2 = "未選中物品：優先購買最低一口價",
    UI_BUY_TT_SELECTED_1 = "購買選中項",
    UI_BUY_TT_SELECTED_PAY = "支付：",
    UI_BUY_TOAST_COUNT = "已購買：%d個",
    UI_BUY_TOAST_STACK = "已購買：%d組",
    UI_BUY_SUMMARY_QTY_COUNT = "%s：本次共購買 %d 個",
    UI_BUY_SUMMARY_QTY_STACK = "%s：本次共購買 %d 組",
    UI_BUY_SUMMARY_SPENT = "本次購買總花費：%s",
    UI_FAV_ADD = "收藏該物品",
    UI_FAV_REMOVE = "取消收藏",
    UI_FAV_EMPTY = "暫無收藏物品\n請在價格面板點擊星星圖示新增收藏",
    UI_FAV_ADDED = "已新增到收藏：%s",
    UI_FAV_EXISTS = "已在收藏中：%s",
    UI_FAV_COPY_HINT = "單擊條目或點擊複製按鈕複製名稱",
    UI_FAV_IMPORT_EXPORT = "匯入/匯出",
    UI_FAV_IMPORT_EXPORT_TOOLTIP = "點擊匯入/匯出收藏列表",
    UI_FAV_IMPORT_EXPORT_TITLE = "收藏列表",
    UI_FAV_EXPORT_BTN = "匯出",
    UI_FAV_IMPORT_BTN = "匯入",
    UI_FAV_CLOSE_BTN = "關閉",
    UI_FAV_IMPORT_TOOLTIP = "從剪貼板匯入收藏列表",
    UI_FAV_EXPORT_TOOLTIP = "匯出收藏列表到剪貼板",
    UI_FAV_IMPORT_CHOOSE_MODE = "選擇匯入方式",
    UI_FAV_IMPORT_OVERWRITE = "覆蓋",
    UI_FAV_IMPORT_APPEND = "追加",
    UI_FAV_IMPORT_CANCEL = "取消",
    UI_FAV_IMPORT_EMPTY = "請先把內容貼到輸入框",
    UI_FAV_IMPORT_DONE = "匯入：%d，跳過：%d",
    
    -- Panel Switch
    UI_SHOW_FAVORITES = "收藏",
    UI_SHOW_FAVORITES_TOOLTIP = "切換到收藏列表",
    UI_NO_DATA_FAV_BTN = "收藏",
    UI_NO_DATA_FAV_TT = "打開收藏列表",
    UI_BACK_TO_PRICE = "返回",
    UI_BACK_TO_PRICE_TOOLTIP = "返回GFA主頁",
    UI_INVENTORY = "库存",
    UI_INVENTORY_TOOLTIP = "檢視背包內可拍賣的物品",
    UI_INVENTORY_CATEGORY_COMMON = "常用",
    UI_INVENTORY_CATEGORY_OTHER = "其它",

    -- Money
    UI_MONEY_GOLD = "金",
    UI_MONEY_SILVER = "銀",
    UI_MONEY_COPPER = "銅",
    
}

-- Get current locale table
local function GetLocaleTable()
    if locale == "zhCN" then
        return L.zhCN
    elseif locale == "zhTW" then
        return L.zhTW
    else
        return L.enUS
    end
end

-- Localization function
local currentLocale = GetLocaleTable()
local function GetText(key, ...)
    local text = currentLocale[key] or L.enUS[key] or key
    if select("#", ...) > 0 then
        return string.format(text, ...)
    end
    return text
end

-- Export
GF_Auction_L = GetText