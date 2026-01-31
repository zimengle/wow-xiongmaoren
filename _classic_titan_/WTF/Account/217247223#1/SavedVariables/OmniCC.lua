OmniCCDB = {
["global"] = {
["dbVersion"] = 6,
["addonVersion"] = "11.2.8",
},
["profileKeys"] = {
["元英老祖 - 时光IV"] = "默认",["化神老祖 - 时光IV"] = "默认",["真仙老祖 - 时光IV"] = "默认",["阿里董事长 - 时光IV"] = "默认",["飞升老祖 - 时光IV"] = "默认",
["露露緹婭 - 时光III"] = "默认",
["露露缇娅 - 时光III"] = "默认",
},
["profiles"] = {
["默认"] = {
["rules"] = {
{
["enabled"] = false,
["patterns"] = {
"Aura",
"Buff",
"Debuff",
},
["name"] = "光环",
["id"] = "auras",
},
{
["enabled"] = false,
["patterns"] = {
"Plate",
},
["name"] = "单位姓名板",
["id"] = "plates",
},
{
["enabled"] = false,
["patterns"] = {
"ActionButton",
},
["name"] = "动作条",
["id"] = "actions",
},
{
["patterns"] = {
"PlaterMainAuraIcon",
"PlaterSecondaryAuraIcon",
"ExtraIconRowIcon",
},
["id"] = "Plater Nameplates Rule",
["priority"] = 4,
["theme"] = "Plater Nameplates Theme",
},
},
["themes"] = {
["Plater Nameplates Theme"] = {
["textStyles"] = {
["minutes"] = {
},
["soon"] = {
["scale"] = 1,
},
["seconds"] = {
},
},
["mmSSDuration"] = 3,
["enableText"] = false,
["effect"] = "none",
},
["Default"] = {
["textStyles"] = {
["minutes"] = {
},
["soon"] = {
},
["seconds"] = {
},
},
["effect"] = "none",
},
["默认"] = {
["textStyles"] = {
["seconds"] = {
},
["minutes"] = {
["scale"] = 0.9,
},
["soon"] = {
["scale"] = 1,
},
["hours"] = {
["b"] = 1,
["scale"] = 1,
["g"] = 1,
["r"] = 1,
},
["charging"] = {
["scale"] = 1,
},
["controlled"] = {
["scale"] = 1,
},
},
["fontFace"] = "Interface\\Addons\\MikScrollingBattleText\\Fonts\\Rurutia.ttf",
["tenthsDuration"] = 3,
["minSize"] = 0.43,
["mmSSDuration"] = 180,
["effect"] = "none",
["minEffectDuration"] = 10,
["fontSize"] = 16,
},
},
},
},
}
OmniCC4Config = nil