-- LibTextLayout-1.0.lua
-- 文本度量与气泡排版库
-- 参考 https://github.com/chenglou/pretext 的设计思路：
--   prepare()  → MeasureWidth()  : 一次性测量并缓存，避免重复 GetStringWidth()
--   layout()   → CalcBubbleSize(): 纯计算热路径，基于缓存宽度得出气泡尺寸

local MAJOR, MINOR = "LibTextLayout-1.0", 1
local LibTextLayout, oldMinor = LibStub:NewLibrary(MAJOR, MINOR)

-- 已有更高版本则跳过初始化
if not LibTextLayout then return end

-- ========== 默认常量 ==========
LibTextLayout.DEFAULT_MIN_WIDTH   = 30    -- 气泡最小宽度（px），紧贴文字仅防畸形
LibTextLayout.DEFAULT_LINE_HEIGHT = 14    -- 行高估算值（px）
LibTextLayout.DEFAULT_BG_PADDING_H = 16  -- 背景框水平内边距（左右各 8），与项目原始值对齐
LibTextLayout.CACHE_MAX_SIZE      = 500   -- 缓存上限，超出后清空重建

-- ========== 内部缓存 ==========
-- 仅在首次注册时初始化，升级时保留已有缓存
if not LibTextLayout._widthCache then
    LibTextLayout._widthCache = {}
    LibTextLayout._cacheCount = 0
end

-- ========== 工具函数 ==========

--- 清空宽度测量缓存
-- 字体缩放设置变更时由外部调用
function LibTextLayout:ClearCache()
    self._widthCache = {}
    self._cacheCount = 0
end

--- 测量文本的单行自然宽度，并缓存结果
-- @param fontString  WoW FontString 对象（必须已挂载到可见帧层级）
-- @param text        要测量的字符串
-- @return            自然宽度（像素），FontString 未就绪时返回 0
function LibTextLayout:MeasureWidth(fontString, text)
    if not fontString or not text or text == "" then return 0 end

    -- 构造缓存 key：字体名称 + NUL + 文本内容
    local fontName = fontString:GetName() or tostring(fontString)
    local cacheKey = fontName .. "\0" .. text

    -- 命中缓存直接返回
    local cached = self._widthCache[cacheKey]
    if cached then
        --[[@debug@
        -- print("[LibTextLayout] cache HIT key=", cacheKey, "w=", cached)
        --@end-debug@]]
        return cached
    end

    -- 保存 FontString 当前状态
    local prevText  = fontString:GetText() or ""
    local prevWidth = fontString:GetWidth()

    -- 设置为无换行模式测量自然宽度
    fontString:SetWidth(0)
    fontString:SetText(text)
    local naturalW = fontString:GetStringWidth()

    -- 恢复原始状态
    fontString:SetText(prevText)
    fontString:SetWidth(prevWidth)

    -- FontString 未挂载时 GetStringWidth() 返回 0，不写缓存
    if naturalW <= 0 then
        --[[@debug@
        -- print("[LibTextLayout] MeasureWidth returned 0, FontString may not be attached")
        --@end-debug@]]
        return 0
    end

    local result = math.ceil(naturalW) + 2

    -- 缓存超上限时清空重建
    if self._cacheCount >= self.CACHE_MAX_SIZE then
        --[[@debug@
        -- print("[LibTextLayout] cache full, clearing")
        --@end-debug@]]
        self._widthCache = {}
        self._cacheCount = 0
    end

    self._widthCache[cacheKey] = result
    self._cacheCount = self._cacheCount + 1

    --[[@debug@
    -- print("[LibTextLayout] cache MISS key=", cacheKey, "w=", result)
    --@end-debug@]]

    return result
end

--- 计算聊天气泡的内容宽度与背景高度
-- @param opts 参数表：
--   opts.fontString  (FontString) 用于度量的消息行 FontString
--   opts.text        (string)     消息文本
--   opts.maxWidth    (number)     气泡最大宽度
--   opts.minWidth    (number?)    气泡最小宽度，默认 DEFAULT_MIN_WIDTH
--   opts.lineHeight  (number?)    行高估算，默认 DEFAULT_LINE_HEIGHT
--   opts.bgPaddingH  (number?)    背景框水平内边距，默认 DEFAULT_BG_PADDING_H
-- @return { width = bubbleW, height = bubbleH }
function LibTextLayout:CalcBubbleSize(opts)
    local minWidth   = opts.minWidth   or self.DEFAULT_MIN_WIDTH
    local lineHeight = opts.lineHeight or self.DEFAULT_LINE_HEIGHT
    local bgPaddingH = opts.bgPaddingH or self.DEFAULT_BG_PADDING_H
    local maxWidth   = opts.maxWidth   or minWidth

    -- FontString 不可用时返回最小尺寸兜底
    if not opts.fontString then
        return { width = minWidth, height = lineHeight }
    end

    -- 1. 测量文本自然宽度（缓存）
    local naturalW = self:MeasureWidth(opts.fontString, opts.text or "")

    -- 2. 气泡内容宽度 = clamp(naturalW, minWidth, maxWidth)
    local bubbleW = math.max(minWidth, math.min(maxWidth, naturalW))

    -- 3. 估算气泡高度：将 FontString 设为 bubbleW 后读取实际高度
    --    GetHeight() 在多行 FontString 下会返回实际渲染高度（行数 × 行高）
    local prevWidth = opts.fontString:GetWidth()
    local prevText  = opts.fontString:GetText() or ""

    opts.fontString:SetWidth(bubbleW)
    opts.fontString:SetText(opts.text or "")
    local measuredH = opts.fontString:GetHeight()

    opts.fontString:SetText(prevText)
    opts.fontString:SetWidth(prevWidth)

    -- 若 GetHeight() 返回 0（帧未就绪），fallback 到单行行高
    local bubbleH = (measuredH and measuredH > 0) and math.ceil(measuredH) or lineHeight

    --[[@debug@
    -- print(string.format("[LibTextLayout] CalcBubbleSize: naturalW=%.1f bubbleW=%.1f bubbleH=%.1f",
    --     naturalW, bubbleW, bubbleH))
    --@end-debug@]]

    return { width = bubbleW, height = bubbleH }
end
