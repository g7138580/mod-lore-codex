-- The codex window: zones by continent on the left with how much of each you've found, the
-- zone's entries in the middle (undiscovered ones as locked placeholders) and the entry you
-- picked on the right.

local LC = LoreCodex

local WIDTH, HEIGHT = 820, 520
local ZONE_W, ENTRY_W = 210, 240
local ZONE_ROW, ENTRY_ROW, HEADER_ROW = 20, 22, 22

local GOLD = { 1, 0.82, 0 }
local GREY = { 0.55, 0.55, 0.55 }
local PARCHMENT = { 0.92, 0.87, 0.75 }

local view = { zone = nil, entry = nil }

local function setShown(region, shown)
	if shown then region:Show() else region:Hide() end
end

-----------------------------------------
-- frame

local frame = CreateFrame("Frame", "LoreCodexFrame", UIParent)
frame:SetSize(WIDTH, HEIGHT)
frame:SetPoint("CENTER")
frame:SetFrameStrata("HIGH")
frame:SetToplevel(true)
frame:SetMovable(true)
frame:SetClampedToScreen(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true, tileSize = 32, edgeSize = 32,
	insets = { left = 11, right = 12, top = 12, bottom = 11 },
})
frame:Hide()
tinsert(UISpecialFrames, "LoreCodexFrame")

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP", frame, "TOP", 0, -18)
title:SetText("Lore Codex")

local total = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
total:SetPoint("TOPLEFT", frame, "TOPLEFT", 22, -22)
total:SetTextColor(GREY[1], GREY[2], GREY[3])

local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)

local options = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
options:SetSize(72, 20)
options:SetPoint("RIGHT", close, "LEFT", -2, 0)
options:SetText("Options")
options:SetScript("OnClick", function () LC.OpenOptions() end)

LC.On("RESET_POSITION", function ()
	frame:ClearAllPoints()
	frame:SetPoint("CENTER")
end)

local function inset(x, width)
	local f = CreateFrame("Frame", nil, frame)
	f:SetPoint("TOPLEFT", frame, "TOPLEFT", x, -46)
	if width then
		f:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", x, 18)
		f:SetWidth(width)
	else
		f:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -18, 18)
	end
	f:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 12,
		insets = { left = 3, right = 3, top = 3, bottom = 3 },
	})
	f:SetBackdropColor(0, 0, 0, 0.45)
	f:SetBackdropBorderColor(0.6, 0.5, 0.3, 1)
	return f
end

-- A scroll area inside an inset; 3.3.5's template wants a named frame for its scroll bar.
local function scrollArea(parent, name)
	local s = CreateFrame("ScrollFrame", name, parent, "UIPanelScrollFrameTemplate")
	s:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, -6)
	s:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -27, 6)
	local content = CreateFrame("Frame", nil, s)
	content:SetSize(10, 10)
	s:SetScrollChild(content)
	s.content = content
	s:SetScript("OnSizeChanged", function (self, w) content:SetWidth(w) end)
	return s
end

local zonePane = inset(18, ZONE_W)
local entryPane = inset(18 + ZONE_W + 6, ENTRY_W)
local readPane = inset(18 + ZONE_W + 6 + ENTRY_W + 6)

local zoneScroll = scrollArea(zonePane, "LoreCodexZoneScroll")
local entryScroll = scrollArea(entryPane, "LoreCodexEntryScroll")
local readScroll = scrollArea(readPane, "LoreCodexReadScroll")
readScroll:SetPoint("TOPLEFT", readPane, "TOPLEFT", 10, -70)

-----------------------------------------
-- rows

local function makeRow(parent, height)
	local b = CreateFrame("Button", nil, parent)
	b:SetHeight(height)
	b.selected = b:CreateTexture(nil, "BACKGROUND")
	b.selected:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
	b.selected:SetBlendMode("ADD")
	b.selected:SetVertexColor(1, 0.82, 0, 0.7)
	b.selected:SetAllPoints(b)
	local hl = b:CreateTexture(nil, "HIGHLIGHT")
	hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
	hl:SetBlendMode("ADD")
	hl:SetVertexColor(1, 1, 1, 0.3)
	hl:SetAllPoints(b)
	b.text = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	b.text:SetJustifyH("LEFT")
	b.right = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	b.right:SetPoint("RIGHT", b, "RIGHT", -4, 0)
	b.icon = b:CreateTexture(nil, "ARTWORK")
	b.icon:SetSize(height - 4, height - 4)
	b.icon:SetPoint("LEFT", b, "LEFT", 4, 0)
	return b
end

local function pool(parent, height)
	local p = { items = {}, used = 0 }
	function p:Get()
		self.used = self.used + 1
		local b = self.items[self.used]
		if not b then
			b = makeRow(parent, height)
			self.items[self.used] = b
		end
		b:Show()
		return b
	end
	function p:Reset()
		for _, b in ipairs(self.items) do b:Hide() end
		self.used = 0
	end
	return p
end

local zoneRows = pool(zoneScroll.content, ZONE_ROW)
local entryRows = pool(entryScroll.content, ENTRY_ROW)

local headers = {}
local function header(parent, list, i, text, y)
	local fs = list[i]
	if not fs then
		fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		fs:SetJustifyH("LEFT")
		list[i] = fs
	end
	fs:ClearAllPoints()
	fs:SetPoint("TOPLEFT", parent, "TOPLEFT", 4, -y - 4)
	fs:SetText(text)
	fs:Show()
	return fs
end

local function hideAll(list)
	for _, fs in ipairs(list) do fs:Hide() end
end

-----------------------------------------
-- left: zones

local zoneHeaders = {}

local function sortedZones()
	local byMap = {}
	for _, zone in pairs(LC.index.zones) do
		if select(2, LC.Progress(zone.id)) > 0 then
			byMap[zone.map] = byMap[zone.map] or {}
			table.insert(byMap[zone.map], zone)
		end
	end
	local out = {}
	local seen = {}
	local function add(map)
		local list = byMap[map]
		if not list then return end
		table.sort(list, function (a, b) return a.name < b.name end)
		table.insert(out, { map = map, zones = list })
		seen[map] = true
	end
	for _, map in ipairs(LC.CONTINENT_ORDER) do add(map) end
	for map in pairs(byMap) do if not seen[map] then add(map) end end
	return out
end

local function refreshZones()
	zoneRows:Reset()
	hideAll(zoneHeaders)
	local width = zoneScroll:GetWidth()
	local y, h = 0, 0
	for _, group in ipairs(sortedZones()) do
		h = h + 1
		header(zoneScroll.content, zoneHeaders, h, LC.CONTINENTS[group.map] or "Elsewhere", y)
		y = y + HEADER_ROW
		for _, zone in ipairs(group.zones) do
			local b = zoneRows:Get()
			b:ClearAllPoints()
			b:SetPoint("TOPLEFT", zoneScroll.content, "TOPLEFT", 0, -y)
			b:SetWidth(width)
			b.icon:Hide()
			b.text:ClearAllPoints()
			b.text:SetPoint("LEFT", b, "LEFT", 12, 0)
			b.text:SetPoint("RIGHT", b.right, "LEFT", -4, 0)
			b.text:SetText(zone.name)
			local known, count = LC.Progress(zone.id)
			b.right:SetText(known .. "/" .. count)
			if known == count then b.right:SetTextColor(0.3, 1, 0.3) else b.right:SetTextColor(GREY[1], GREY[2], GREY[3]) end
			if known == 0 then b.text:SetTextColor(GREY[1], GREY[2], GREY[3]) else b.text:SetTextColor(1, 1, 1) end
			setShown(b.selected, zone.id == view.zone)
			b.zone = zone.id
			b:SetScript("OnClick", function (self) LC.ShowZone(self.zone) end)
			y = y + ZONE_ROW
		end
		y = y + 4
	end
	zoneScroll.content:SetHeight(math.max(y, 10))
	local known, count = LC.Progress()
	total:SetText(known .. " of " .. count .. " discovered")
end

-----------------------------------------
-- middle: the zone's entries

local entryHeaders = {}
local LOCK = "Interface\\LFGFrame\\UI-LFG-ICON-LOCK"

local titleRedrawQueued = false

local function refreshEntries()
	entryRows:Reset()
	hideAll(entryHeaders)
	local zone = view.zone and LC.index.zones[view.zone]
	if not zone then
		entryScroll.content:SetHeight(10)
		return
	end
	local width = entryScroll:GetWidth()
	-- Entries out of this character's reach are left out altogether.
	local shown = {}
	for _, e in ipairs(zone.entries) do
		if LC.IsVisible(e.id) then table.insert(shown, e) end
	end
	local y, h, lastKind = 0, 0, nil
	for _, e in ipairs(shown) do
		if e.kind ~= lastKind then
			if lastKind then y = y + 4 end
			h = h + 1
			header(entryScroll.content, entryHeaders, h, LC.KIND_SECTION[e.kind] or "", y)
			y = y + HEADER_ROW
			lastKind = e.kind
		end
		local b = entryRows:Get()
		b:ClearAllPoints()
		b:SetPoint("TOPLEFT", entryScroll.content, "TOPLEFT", 0, -y)
		b:SetWidth(width)
		b.icon:Show()
		b.text:ClearAllPoints()
		b.text:SetPoint("LEFT", b.icon, "RIGHT", 6, 0)
		b.text:SetPoint("RIGHT", b.right, "LEFT", -4, 0)
		local known = LC.IsKnown(e.id)
		if known then
			b.icon:SetTexture(LC.KIND_ICON[e.kind])
			b.icon:SetVertexColor(1, 1, 1)
			b.text:SetText(LC.Title(e.id) or "...")
			b.text:SetTextColor(1, 1, 1)
			b.right:SetText(LC.IsRead(e.id) and "" or (LC.IsUpdated(e.id) and "Updated" or "New"))
			b.right:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
		else
			b.icon:SetTexture(LOCK)
			b.icon:SetVertexColor(0.8, 0.8, 0.8)
			b.text:SetText("???")
			b.text:SetTextColor(GREY[1], GREY[2], GREY[3])
			b.right:SetText("")
		end
		setShown(b.selected, e.id == view.entry)
		b.entry = e.id
		b:SetScript("OnClick", function (self) LC.ShowEntry(self.entry) end)
		y = y + ENTRY_ROW
		-- A known entry whose title isn't cached yet (discovered on another computer, or before a
		-- reload): fetch it and redraw.
		-- A title already on its way isn't asked for again, and the redraws its arrival asks for are
		-- folded into one per frame.
		if known and not LC.Title(e.id) and not LC.IsLoadingText(e.id) then
			LC.LoadText(e.id, function (t)
				if not t or titleRedrawQueued then return end
				titleRedrawQueued = true
				LC.After(0, function ()
					titleRedrawQueued = false
					if frame:IsShown() then refreshEntries() end
				end)
			end)
		end
	end
	entryScroll.content:SetHeight(math.max(y, 10))
end

-----------------------------------------
-- right: the entry

local readIcon = readPane:CreateTexture(nil, "ARTWORK")
readIcon:SetSize(40, 40)
readIcon:SetPoint("TOPLEFT", readPane, "TOPLEFT", 12, -12)

local readTitle = readPane:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
readTitle:SetPoint("TOPLEFT", readIcon, "TOPRIGHT", 10, -2)
readTitle:SetPoint("RIGHT", readPane, "RIGHT", -12, 0)
readTitle:SetJustifyH("LEFT")

local readSub = readPane:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
readSub:SetPoint("TOPLEFT", readTitle, "BOTTOMLEFT", 0, -4)
readSub:SetTextColor(GREY[1], GREY[2], GREY[3])

local rule = readPane:CreateTexture(nil, "ARTWORK")
rule:SetTexture(1, 0.82, 0, 0.35)
rule:SetHeight(1)
rule:SetPoint("TOPLEFT", readPane, "TOPLEFT", 12, -62)
rule:SetPoint("TOPRIGHT", readPane, "TOPRIGHT", -12, -62)

local readBody = readScroll.content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
readBody:SetPoint("TOPLEFT", readScroll.content, "TOPLEFT", 0, -4)
readBody:SetJustifyH("LEFT")
readBody:SetJustifyV("TOP")
readBody:SetSpacing(3)

local HINTS = {
	[0] = "Travel to %s to learn of this land.",
	[1] = "Explore %s to discover this place.",
	[2] = "Meet the people of %s to learn more.",
	[3] = "Take part in the events of %s to uncover this story.",
}

-- Under an entry the character could still add to.
local MORE = "There is more to learn."

local function setBody(text, color)
	readBody:SetWidth(readScroll:GetWidth() - 4)
	readBody:SetText(text)
	readBody:SetTextColor(color[1], color[2], color[3])
	readScroll.content:SetHeight(readBody:GetStringHeight() + 12)
	readScroll:SetVerticalScroll(0)
end

local function refreshReader()
	local e = view.entry and LC.index.entries[view.entry]
	if not e then
		local zone = view.zone and LC.index.zones[view.zone]
		readIcon:SetTexture(LC.KIND_ICON[0])
		readTitle:SetText(zone and zone.name or "Lore Codex")
		readTitle:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
		readSub:SetText("")
		setBody("Pick an entry to read it. Places, people and stories unlock as you travel, meet the locals and "
			.. "follow the events of each land.", GREY)
		return
	end
	local zoneName = LC.ZoneName(e.zone)
	readSub:SetText(e.kind == LC.KIND.ZONE and LC.CONTINENTS[(LC.index.zones[e.zone] or {}).map] or
		((LC.KIND_NAME[e.kind] or "") .. " in " .. zoneName))
	if not LC.IsKnown(e.id) then
		readIcon:SetTexture(LOCK)
		readTitle:SetText("Undiscovered")
		readTitle:SetTextColor(GREY[1], GREY[2], GREY[3])
		setBody(string.format(HINTS[e.kind] or HINTS[1], zoneName), GREY)
		return
	end
	readIcon:SetTexture(LC.KIND_ICON[e.kind])
	readTitle:SetText(LC.Title(e.id) or "")
	readTitle:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	setBody("Loading...", GREY)
	local id = e.id
	LC.LoadText(id, function (t)
		if view.entry ~= id then return end
		if not t then
			setBody("The codex couldn't fetch this entry. Try again in a moment.", GREY)
			return
		end
		readTitle:SetText(t.title)
		setBody(t.more and (t.body .. "\n\n|cff8c8c8c" .. MORE .. "|r") or t.body, PARCHMENT)
		if not LC.IsRead(id) then
			LC.MarkRead(id)
			refreshEntries()
		end
	end)
end

-----------------------------------------
-- navigation

local function redraw()
	if not frame:IsShown() or not LC.index then return end
	refreshZones()
	refreshEntries()
	refreshReader()
end

local function zoneOfPlayer()
	return LC.ZoneByName(GetRealZoneText())
end

local function withIndex(fn)
	LC.LoadIndex(function (index)
		if not index then
			LC.Print("the codex isn't available on this realm (no mod-lore-codex server module answered).")
			frame:Hide()
			return
		end
		fn()
	end)
end

function LC.ShowZone(zone)
	view.zone = zone
	view.entry = nil
	entryScroll:SetVerticalScroll(0)
	redraw()
end

function LC.ShowEntry(id)
	view.entry = id
	local e = LC.index and LC.index.entries[id]
	if e then view.zone = e.zone end
	redraw()
end

function LC.Open(id)
	frame:Show()
	withIndex(function ()
		if id and LC.index.entries[id] then
			LC.ShowEntry(id)
		else
			if not view.zone or not LC.index.zones[view.zone] then
				view.zone = zoneOfPlayer()
				view.entry = nil
			end
			redraw()
		end
	end)
end

-- Opens the codex at a zone (a codex zone id), or wherever you are.
function LC.OpenZone(zone)
	frame:Show()
	withIndex(function ()
		if zone and LC.index.zones[zone] then
			LC.ShowZone(zone)
		else
			view.zone = zoneOfPlayer()
			view.entry = nil
			redraw()
		end
	end)
end

function LC.Toggle()
	if frame:IsShown() then frame:Hide() else LC.Open() end
end

frame:SetScript("OnShow", function () PlaySound("igCharacterInfoOpen") end)
frame:SetScript("OnHide", function () PlaySound("igCharacterInfoClose") end)

LC.On("KNOWN", redraw)
LC.On("READY", redraw)
