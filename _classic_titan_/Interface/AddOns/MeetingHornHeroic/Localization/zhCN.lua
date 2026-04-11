-- zhCN.lua
-- 简体中文本地化

local L = LibStub('AceLocale-3.0'):NewLocale('MeetingHornHeroic', 'zhCN', true)
if not L then return end

-- 界面文本
L['Create Heroic Raid'] = '创建团本'
L['Join Activity'] = '加入活动'
L['Leave Activity'] = '离开活动'
L['Close Activity'] = '解散活动'
L['Broadcast Activity'] = '广播活动'
L['Refresh List'] = '刷新列表'
L['Filter Activities'] = '筛选活动'

-- 团本名称
L['Molten Core'] = '熔火之心'
L['Serpentshrine Cavern'] = '毒蛇神殿'
L['The Eye'] = '风暴要塞'

-- 职业与角色
L['Tank'] = '坦克'
L['Healer'] = '治疗'
L['DPS'] = 'DPS'
L['Damage Dealer'] = '伤害输出'

L['Warrior'] = '战士'
L['Paladin'] = '圣骑士'
L['Hunter'] = '猎人'
L['Rogue'] = '潜行者'
L['Priest'] = '牧师'
L['Shaman'] = '萨满祭司'
L['Mage'] = '法师'
L['Warlock'] = '术士'
L['Druid'] = '德鲁伊'
L['Death Knight'] = '死亡骑士'

-- 活动模式
L['Gold Run'] = '金团'
L['DKP'] = 'DKP'
L['Roll'] = 'Roll点'
L['Guild Run'] = '工会团'
L['Fixed Team'] = '固定团'

-- 界面标签
L['Raid Type'] = '团本类型'
L['Activity Mode'] = '活动模式'
L['Comment'] = '活动说明'
L['Needed Roles'] = '需要职业'
L['Member Count'] = '成员数量'
L['Leader'] = '团长'
L['Created Time'] = '创建时间'
L['Status'] = '状态'

-- 筛选选项
L['All Raids'] = '所有团本'
L['All Modes'] = '所有模式'
L['All Roles'] = '所有职位'
L['Need Tank'] = '需要坦克'
L['Need Healer'] = '需要治疗'
L['Need DPS'] = '需要DPS'

-- 排序选项  
L['Sort by Time'] = '按时间排序'
L['Sort by Raid'] = '按团本排序'
L['Sort by Mode'] = '按模式排序'
L['Sort by Leader'] = '按队长排序'

-- 状态信息
L['Recruiting'] = '招募中'
L['Full'] = '已满员'
L['Started'] = '已开始'
L['Finished'] = '已结束'

-- 系统消息
L['Activity created successfully'] = '活动创建成功'
L['Activity updated successfully'] = '活动更新成功'
L['Activity closed successfully'] = '活动关闭成功'
L['Joined activity successfully'] = '成功加入活动'
L['Left activity successfully'] = '成功离开活动'
L['Activity broadcast sent'] = '活动广播已发送'

L['You are not the leader'] = '你不是团长'
L['No activity found'] = '未找到活动'
L['Player already in group'] = '玩家已在队伍中'
L['Group is full'] = '队伍已满员'
L['Player not in group'] = '玩家不在队伍中'
L['Cannot broadcast yet'] = '广播间隔未到'
L['Broadcast limit reached'] = '广播次数已达上限'

-- 错误信息
L['Invalid raid type'] = '无效的团本类型'
L['Invalid activity mode'] = '无效的活动模式'
L['Comment cannot be empty'] = '活动说明不能为空'
L['Invalid role configuration'] = '无效的职业配置'

-- 帮助信息
L['Help Title'] = '集结号团本招募使用帮助'
L['Help Create'] = '创建活动：选择团本、模式，填写说明'
L['Help Join'] = '加入活动：点击活动列表中的活动'
L['Help Filter'] = '筛选活动：使用筛选选项查找合适的活动'
L['Help Broadcast'] = '广播活动：将你的活动信息发送到频道'

-- 配置选项
L['25 Man Heroic'] = '25人英雄'
L['Minimum Level'] = '最低等级'
L['Item Level Requirement'] = '装等要求'
L['Resistance Requirement'] = '抗性要求'

-- 聊天记录相关
L['Chat Records'] = '聊天记录'
L['No chat records'] = '暂无聊天记录'
L['Clear Records'] = '清空记录'
L['Refresh'] = '刷新'
L['Export Records'] = '导出记录'
L['Chat Records Export'] = '聊天记录导出'
L['Export Complete'] = '导出完成'
L['Exported %d records'] = '导出了 %d 条记录'
L['No records to export'] = '没有可导出的记录'
L['Confirm clear all chat records?'] = '确认清空所有聊天记录吗？'
L['Confirm'] = '确认'
L['Cancel'] = '取消'
L['Whisper Player'] = '密语玩家'
L['Invite Player'] = '邀请玩家'
L['Add Friend'] = '添加好友'

-- 工具提示
L['Click to join activity'] = '点击加入活动'
L['Right click for more options'] = '右键查看更多选项'
L['Boss Image'] = 'BOSS头像'
L['Final Boss'] = '最终BOSS'
L['Loot Level'] = '掉落等级'
