-- The options page (Interface > AddOns > Lore Codex): toasts, their sound and position, the reading
-- text size, the minimap and world map buttons, and the key that opens the codex. Right-clicking the minimap button, the codex's
-- Options button and /codex options all open it.

local LC = LoreCodex

local panel = CreateFrame("Frame", "LoreCodexOptions", UIParent)
panel.name = "Lore Codex"
panel:Hide()

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Lore Codex")

local subtitle = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
subtitle:SetPoint("RIGHT", panel, "RIGHT", -32, 0)
subtitle:SetJustifyH("LEFT")
subtitle:SetText("Places, people and stories unlock as you travel, meet the locals and follow the events of each land.")

local checks = {}
local function checkbox(key, label, anchor)
	local name = "LoreCodexOption_" .. key
	local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
	cb:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -8)
	_G[name .. "Text"]:SetText(label)
	cb:SetScript("OnClick", function (self) LC.SetOption(key, self:GetChecked() and true or false) end)
	cb.key = key
	table.insert(checks, cb)
	return cb
end

local discovery = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
discovery:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -20)
discovery:SetText("Discoveries")
local toast = checkbox("toast", "Show a banner when you discover lore", discovery)
local sound = checkbox("sound", "Play a sound with each discovery", toast)
local moveToast = checkbox("moveToast", "Unlock the banners so you can drag them where you like", sound)

local reading = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
reading:SetPoint("TOPLEFT", moveToast, "BOTTOMLEFT", 0, -16)
reading:SetText("Reading")

local size = CreateFrame("Slider", "LoreCodexOptionTextSize", panel, "OptionsSliderTemplate")
size:SetWidth(180)
size:SetPoint("TOPLEFT", reading, "BOTTOMLEFT", 6, -24)
size:SetMinMaxValues(1, 3)
size:SetValueStep(1)
LoreCodexOptionTextSizeText:SetText("Text size")
LoreCodexOptionTextSizeLow:SetText("Small")
LoreCodexOptionTextSizeHigh:SetText("Large")
size:SetScript("OnValueChanged", function (self, value)
	value = math.floor(value + 0.5)
	if value ~= LC.GetOption("textSize") then LC.SetOption("textSize", value) end
end)

local buttons = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
buttons:SetPoint("TOPLEFT", size, "BOTTOMLEFT", -6, -22)
buttons:SetText("Buttons")
local minimap = checkbox("minimap", "Show the minimap button", buttons)
local map = checkbox("mapButton", "Show the Lore button on the world map", minimap)

local keyHeader = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
keyHeader:SetPoint("TOPLEFT", map, "BOTTOMLEFT", 0, -16)
keyHeader:SetText("Key")

local keyText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
keyText:SetPoint("TOPLEFT", keyHeader, "BOTTOMLEFT", 4, -10)

local function button(label, width, onClick)
	local b = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
	b:SetSize(width, 22)
	b:SetText(label)
	b:SetScript("OnClick", onClick)
	return b
end

local changeKey = button("Change key", 110, function ()
	-- The key binding window, scrolled to nothing in particular: the codex is listed under its
	-- own header there.
	InterfaceOptionsFrame:Hide()
	if KeyBindingFrame_LoadUI then KeyBindingFrame_LoadUI() end
	if KeyBindingFrame then ShowUIPanel(KeyBindingFrame) end
end)
changeKey:SetPoint("TOPLEFT", keyText, "BOTTOMLEFT", -4, -8)

local clearKey = button("Clear key", 90, function ()
	local key1, key2 = GetBindingKey("LORECODEX_TOGGLE")
	if key1 then SetBinding(key1) end
	if key2 then SetBinding(key2) end
	SaveBindings(GetCurrentBindingSet())
	panel.refresh()
end)
clearKey:SetPoint("LEFT", changeKey, "RIGHT", 6, 0)

local defaultKey = button("Use " .. GetBindingText(LC.DEFAULT_KEY, "KEY_"), 120, function ()
	local action = GetBindingAction(LC.DEFAULT_KEY)
	if action and action ~= "" and action ~= "LORECODEX_TOGGLE" then
		LC.Print(GetBindingText(LC.DEFAULT_KEY, "KEY_") .. " is already used by something else; pick another with Change key.")
		return
	end
	SetBinding(LC.DEFAULT_KEY, "LORECODEX_TOGGLE")
	SaveBindings(GetCurrentBindingSet())
	panel.refresh()
end)
defaultKey:SetPoint("LEFT", clearKey, "RIGHT", 6, 0)

local window = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
window:SetPoint("TOPLEFT", changeKey, "BOTTOMLEFT", 0, -20)
window:SetText("Window")

local open = button("Open the codex", 130, function ()
	InterfaceOptionsFrame:Hide()
	LC.Open()
end)
open:SetPoint("TOPLEFT", window, "BOTTOMLEFT", 0, -8)

local reset = button("Reset position", 120, function ()
	LC.Fire("RESET_POSITION")
	LC.Print("window and banner positions reset.")
end)
reset:SetPoint("LEFT", open, "RIGHT", 6, 0)

function panel.refresh()
	for _, cb in ipairs(checks) do cb:SetChecked(LC.GetOption(cb.key) and true or false) end
	size:SetValue(LC.GetOption("textSize") or 2)
	local key = LC.KeyText()
	keyText:SetText("Open the codex with: " .. (key and ("|cffffd200" .. key .. "|r") or "|cff999999not bound|r"))
end

panel:SetScript("OnShow", panel.refresh)
LC.On("OPTIONS", function () if panel:IsShown() then panel.refresh() end end)

InterfaceOptions_AddCategory(panel)

function LC.OpenOptions()
	-- 3.3.5 often opens the AddOns list on the first call instead of the page; the second lands.
	InterfaceOptionsFrame_OpenToCategory(panel)
	InterfaceOptionsFrame_OpenToCategory(panel)
end
