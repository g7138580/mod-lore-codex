-- The codex window: a search box, Recent and Unread, and the zones by continent on the left with
-- how much of each you've found; the list for what you picked in the middle (undiscovered entries
-- as locked placeholders); the entry you picked on the right, with the parts you haven't read yet
-- marked.

local LC = LoreCodex

local WIDTH, HEIGHT = 840, 560
local ZONE_W, ENTRY_W = 220, 240
local ZONE_ROW, ENTRY_ROW, HEADER_ROW = 20, 22, 22
local RECENT_LIMIT = 30

local GOLD = { 1, 0.82, 0 }
local GREY = { 0.55, 0.55, 0.55 }
local LIGHT_TEXT = { 0.92, 0.87, 0.75 }
local TEXT_SIZES = { 12, 14, 16 }

-- What the middle list shows: a zone, "recent", "unread" or "search"; and the entry being read.
local view = { mode = "zone", zone = nil, entry = nil, query = "" }

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
local function scrollArea(parent, name, top)
	local s = CreateFrame("ScrollFrame", name, parent, "UIPanelScrollFrameTemplate")
	s:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, -(top or 6))
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

local zoneScroll = scrollArea(zonePane, "LoreCodexZoneScroll", 34)
local entryScroll = scrollArea(entryPane, "LoreCodexEntryScroll", 30)
local readScroll = scrollArea(readPane, "LoreCodexReadScroll", 70)
readScroll:SetPoint("TOPLEFT", readPane, "TOPLEFT", 12, -70)

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
	-- A progress bar behind a zone's name.
	b.barBg = b:CreateTexture(nil, "BORDER")
	b.barBg:SetTexture(1, 1, 1, 0.06)
	b.barBg:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
	b.barBg:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
	b.bar = b:CreateTexture(nil, "BORDER")
	b.bar:SetPoint("TOPLEFT", b.barBg, "TOPLEFT")
	b.bar:SetPoint("BOTTOMLEFT", b.barBg, "BOTTOMLEFT")
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

-- Puts a row's text after its icon (or at an indent when it has none).
local function layoutRow(b, width, withIcon, indent)
	b:SetWidth(width)
	b.text:ClearAllPoints()
	if withIcon then
		b.icon:Show()
		b.text:SetPoint("LEFT", b.icon, "RIGHT", 6, 0)
	else
		b.icon:Hide()
		b.text:SetPoint("LEFT", b, "LEFT", indent or 12, 0)
	end
	b.text:SetPoint("RIGHT", b.right, "LEFT", -4, 0)
	b.barBg:Hide()
	b.bar:Hide()
	b.right:SetTextColor(GREY[1], GREY[2], GREY[3])
end

-----------------------------------------
-- left: search, Recent and Unread, the zones by continent

local search = CreateFrame("EditBox", "LoreCodexSearch", zonePane, "InputBoxTemplate")
search:SetHeight(20)
search:SetPoint("TOPLEFT", zonePane, "TOPLEFT", 14, -7)
search:SetPoint("TOPRIGHT", zonePane, "TOPRIGHT", -10, -7)
search:SetAutoFocus(false)
search:SetMaxLetters(40)

local searchHint = search:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
searchHint:SetPoint("LEFT", search, "LEFT", 2, 0)
searchHint:SetText("Search")

local zoneHeaders = {}
local continentRows = pool(zoneScroll.content, HEADER_ROW)

local function playerZone()
	return LC.ZoneByName(GetRealZoneText())
end

local function sortedZones()
	local byMap = {}
	for _, zone in pairs(LC.index.zones) do
		if select(2, LC.Progress(zone.id)) > 0 then
			byMap[zone.map] = byMap[zone.map] or {}
			table.insert(byMap[zone.map], zone)
		end
	end
	local out, seen = {}, {}
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

-- Continents are folded by default, except the one you are on (the first time it is shown).
local function isCollapsed(map)
	local c = LoreCodexDB.collapsed[map]
	if c == nil then
		local here = playerZone()
		local z = here and LC.index.zones[here]
		return not (z and z.map == map)
	end
	return c
end

local function setBar(b, known, count)
	b.barBg:Show()
	if count > 0 and known > 0 then
		b.bar:SetWidth(math.max(1, (b:GetWidth() - 4) * known / count))
		if known == count then b.bar:SetTexture(0.3, 0.8, 0.3, 0.3) else b.bar:SetTexture(1, 0.82, 0, 0.22) end
		b.bar:Show()
	else
		b.bar:Hide()
	end
end

local function specialRow(b, y, width, label, mode)
	b:ClearAllPoints()
	b:SetPoint("TOPLEFT", zoneScroll.content, "TOPLEFT", 0, -y)
	layoutRow(b, width, false, 6)
	b.text:SetText(label)
	b.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	b.right:SetText("")
	setShown(b.selected, view.mode == mode)
	b.zone = nil
	b:SetScript("OnClick", function () LC.ShowMode(mode) end)
end

local function refreshZones()
	zoneRows:Reset()
	continentRows:Reset()
	hideAll(zoneHeaders)
	local width = zoneScroll:GetWidth()
	local here = playerZone()
	local y = 0

	local unread = LC.UnreadCount()
	specialRow(zoneRows:Get(), y, width, "Recent discoveries", "recent")
	y = y + ZONE_ROW
	local b = zoneRows:Get()
	specialRow(b, y, width, "Unread", "unread")
	b.right:SetText(unread > 0 and unread or "")
	b.right:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	y = y + ZONE_ROW + 6

	for _, group in ipairs(sortedZones()) do
		local collapsed = isCollapsed(group.map)
		local c = continentRows:Get()
		c:ClearAllPoints()
		c:SetPoint("TOPLEFT", zoneScroll.content, "TOPLEFT", 0, -y)
		layoutRow(c, width, true)
		c.icon:SetTexture(collapsed and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up")
		c.icon:SetVertexColor(1, 1, 1)
		c.text:SetText(LC.CONTINENTS[group.map] or "Elsewhere")
		c.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
		local ck, ct = LC.ContinentProgress(group.map)
		c.right:SetText(ck .. "/" .. ct)
		c.selected:Hide()
		c.map = group.map
		c:SetScript("OnClick", function (self)
			LoreCodexDB.collapsed[self.map] = not isCollapsed(self.map)
			refreshZones()
		end)
		y = y + HEADER_ROW
		if not collapsed then
			for _, zone in ipairs(group.zones) do
				local r = zoneRows:Get()
				r:ClearAllPoints()
				r:SetPoint("TOPLEFT", zoneScroll.content, "TOPLEFT", 0, -y)
				layoutRow(r, width, zone.id == here, 12)
				if zone.id == here then
					-- You are here.
					r.icon:SetTexture("Interface\\Minimap\\MinimapArrow")
					r.icon:SetVertexColor(1, 1, 1)
				end
				r.text:SetText(zone.name)
				local known, count = LC.Progress(zone.id)
				r.right:SetText(known .. "/" .. count)
				if known == count then r.right:SetTextColor(0.3, 1, 0.3) end
				if known == 0 then r.text:SetTextColor(GREY[1], GREY[2], GREY[3]) else r.text:SetTextColor(1, 1, 1) end
				setBar(r, known, count)
				setShown(r.selected, view.mode == "zone" and zone.id == view.zone)
				r.zone = zone.id
				r:SetScript("OnClick", function (self) LC.ShowZone(self.zone) end)
				y = y + ZONE_ROW
			end
		end
		y = y + 2
	end
	zoneScroll.content:SetHeight(math.max(y, 10))
	local known, count = LC.Progress()
	total:SetText(known .. " of " .. count .. " discovered")
end

-----------------------------------------
-- middle: the list

local listTitle = entryPane:CreateFontString(nil, "OVERLAY", "GameFontNormal")
listTitle:SetPoint("TOPLEFT", entryPane, "TOPLEFT", 10, -9)
listTitle:SetPoint("RIGHT", entryPane, "RIGHT", -96, 0)
listTitle:SetJustifyH("LEFT")

local hideLocked = CreateFrame("CheckButton", "LoreCodexHideLocked", entryPane, "UICheckButtonTemplate")
hideLocked:SetSize(20, 20)
hideLocked:SetPoint("TOPRIGHT", entryPane, "TOPRIGHT", -62, -4)
LoreCodexHideLockedText:SetFontObject("GameFontHighlightSmall")
LoreCodexHideLockedText:SetText("Hide locked")
hideLocked:SetScript("OnClick", function (self)
	LC.SetOption("hideLocked", self:GetChecked() and true or false)
end)

local entryHeaders = {}
local LOCK = "Interface\\LFGFrame\\UI-LFG-ICON-LOCK"

local titleRedrawQueued = false
local refreshEntries

-- Asks for a known entry's missing title (discovered on another computer, or before a reload) and
-- redraws when it comes; a title already on its way isn't asked for again, and the redraws are
-- folded into one per frame.
local function wantTitle(id)
	if LC.Title(id) or LC.IsLoadingText(id) then return end
	LC.LoadText(id, function (t)
		if not t or titleRedrawQueued then return end
		titleRedrawQueued = true
		LC.After(0, function ()
			titleRedrawQueued = false
			if frame:IsShown() then refreshEntries() end
		end)
	end)
end

local function entryRow(e, y, width, right)
	local b = entryRows:Get()
	b:ClearAllPoints()
	b:SetPoint("TOPLEFT", entryScroll.content, "TOPLEFT", 0, -y)
	layoutRow(b, width, true)
	local known = LC.IsKnown(e.id)
	if known then
		b.icon:SetTexture(LC.KIND_ICON[e.kind])
		b.icon:SetVertexColor(1, 1, 1)
		b.text:SetText(LC.Title(e.id) or "...")
		b.text:SetTextColor(1, 1, 1)
		if LC.IsRead(e.id) then
			b.right:SetText(right or "")
		else
			b.right:SetText(LC.IsUpdated(e.id) and "Updated" or "New")
			b.right:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
		end
		wantTitle(e.id)
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
	return y + ENTRY_ROW
end

local function emptyNote(text)
	local fs = header(entryScroll.content, entryHeaders, 1, text, 0)
	fs:SetFontObject("GameFontDisableSmall")
	fs:SetWidth(entryScroll:GetWidth() - 8)
	return 40
end

-- The list Unread shows is taken when you open it, so entries don't vanish as you read them.
local unreadSnapshot = {}

local searchedTitles = false

local function searchResults(query)
	local q = query:lower()
	local zones, entries = {}, {}
	for _, zone in pairs(LC.index.zones) do
		if select(2, LC.Progress(zone.id)) > 0 and zone.name:lower():find(q, 1, true) then table.insert(zones, zone) end
	end
	table.sort(zones, function (a, b) return a.name < b.name end)
	for id in pairs(LC.known) do
		local e = LC.index.entries[id]
		local t = LC.Title(id)
		if e and LC.IsVisible(id) and t and t:lower():find(q, 1, true) then table.insert(entries, e) end
	end
	table.sort(entries, function (a, b) return (LC.Title(a.id) or "") < (LC.Title(b.id) or "") end)
	-- The first search fetches the titles this computer doesn't have yet; results fill in as they come.
	if not searchedTitles then
		searchedTitles = true
		for id in pairs(LC.known) do if LC.index.entries[id] then wantTitle(id) end end
	end
	return zones, entries
end

refreshEntries = function ()
	entryRows:Reset()
	hideAll(entryHeaders)
	local width = entryScroll:GetWidth()
	local y, h = 0, 0
	hideLocked:SetChecked(LC.GetOption("hideLocked") and true or false)
	setShown(hideLocked, view.mode == "zone")

	if view.mode == "recent" then
		listTitle:SetText("Recent discoveries")
		local list = LC.KnownByTime(false, RECENT_LIMIT)
		if #list == 0 then y = emptyNote("Entries you discover while you play are listed here, newest first.") end
		for _, e in ipairs(list) do y = entryRow(e, y, width, LC.WhenText(LC.found[e.id])) end
	elseif view.mode == "unread" then
		listTitle:SetText("Unread")
		if #unreadSnapshot == 0 then y = emptyNote("You have read everything you have discovered.") end
		for _, e in ipairs(unreadSnapshot) do y = entryRow(e, y, width, LC.ZoneName(e.zone)) end
	elseif view.mode == "search" then
		listTitle:SetText("Search: " .. view.query)
		local zones, entries = searchResults(view.query)
		if #zones == 0 and #entries == 0 then y = emptyNote("Nothing you have discovered matches.") end
		if #zones > 0 then
			h = h + 1
			header(entryScroll.content, entryHeaders, h, "Lands", y):SetFontObject("GameFontNormal")
			y = y + HEADER_ROW
			for _, zone in ipairs(zones) do
				local b = entryRows:Get()
				b:ClearAllPoints()
				b:SetPoint("TOPLEFT", entryScroll.content, "TOPLEFT", 0, -y)
				layoutRow(b, width, true)
				b.icon:SetTexture(LC.KIND_ICON[0])
				b.icon:SetVertexColor(1, 1, 1)
				b.text:SetText(zone.name)
				b.text:SetTextColor(1, 1, 1)
				local known, count = LC.Progress(zone.id)
				b.right:SetText(known .. "/" .. count)
				b.selected:Hide()
				b.entry = nil
				b.zone = zone.id
				b:SetScript("OnClick", function (self) LC.ShowZone(self.zone) end)
				y = y + ENTRY_ROW
			end
			y = y + 4
		end
		if #entries > 0 then
			h = h + 1
			header(entryScroll.content, entryHeaders, h, "Entries", y):SetFontObject("GameFontNormal")
			y = y + HEADER_ROW
			for _, e in ipairs(entries) do y = entryRow(e, y, width, LC.ZoneName(e.zone)) end
		end
	else
		local zone = view.zone and LC.index.zones[view.zone]
		listTitle:SetText(zone and zone.name or "")
		if not zone then
			entryScroll.content:SetHeight(10)
			return
		end
		local hide = LC.GetOption("hideLocked")
		local lastKind
		for _, e in ipairs(zone.entries) do
			-- Entries out of this character's reach are left out altogether.
			if LC.IsVisible(e.id) and not (hide and not LC.IsKnown(e.id)) then
				if e.kind ~= lastKind then
					if lastKind then y = y + 4 end
					h = h + 1
					header(entryScroll.content, entryHeaders, h, LC.KIND_SECTION[e.kind] or "", y):SetFontObject("GameFontNormal")
					y = y + HEADER_ROW
					lastKind = e.kind
				end
				y = entryRow(e, y, width)
			end
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

local rule = readPane:CreateTexture(nil, "ARTWORK")
rule:SetHeight(1)
rule:SetPoint("TOPLEFT", readPane, "TOPLEFT", 12, -62)
rule:SetPoint("TOPRIGHT", readPane, "TOPRIGHT", -12, -62)

local bodyFont = CreateFont("LoreCodexBodyFont")
bodyFont:SetFontObject(GameFontHighlight)
local readBody = readScroll.content:CreateFontString(nil, "OVERLAY")
readBody:SetFontObject(bodyFont)
readBody:SetPoint("TOPLEFT", readScroll.content, "TOPLEFT", 0, -4)
readBody:SetJustifyH("LEFT")
readBody:SetJustifyV("TOP")
readBody:SetSpacing(3)

-- The page's colors: { text, title, faint, new part }.
local style = { text = LIGHT_TEXT, title = GOLD, faint = GREY, new = "|cffffe7a0", newLabel = "|cffffd200" }
rule:SetTexture(1, 0.82, 0, 0.35)
readSub:SetTextColor(GREY[1], GREY[2], GREY[3])

-- The reading text at the chosen size.
local function applyStyle()
	local size = TEXT_SIZES[LC.GetOption("textSize") or 2] or 14
	local file, _, flags = GameFontHighlight:GetFont()
	bodyFont:SetFont(file, size, flags)
	bodyFont:SetShadowOffset(1, -1)
end

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

-- The text with the parts this character hasn't read yet marked. The body is the opening and then
-- one paragraph per shown part; an entry never opened before is new as a whole, so nothing in it
-- is marked.
local function markNew(id, t)
	local paragraphs = {}
	for p in (t.body .. "\n\n"):gmatch("(.-)\n\n") do table.insert(paragraphs, p) end
	local readParts = LC.ReadParts(id)
	local marking = LC.WasOpened(id) and readParts ~= nil
	local out, labelled = {}, false
	for i, p in ipairs(paragraphs) do
		local part = t.shown[i - 1]
		if marking and part and not readParts[part] then
			if not labelled then
				table.insert(out, style.newLabel .. "New since you last read:|r")
				labelled = true
			end
			table.insert(out, style.new .. p .. "|r")
		else
			table.insert(out, p)
		end
	end
	return table.concat(out, "\n\n")
end

local function refreshReader()
	local e = view.entry and LC.index.entries[view.entry]
	if not e then
		local zone = view.mode == "zone" and view.zone and LC.index.zones[view.zone]
		readIcon:SetTexture(LC.KIND_ICON[0])
		readTitle:SetText(zone and zone.name or "Lore Codex")
		readTitle:SetTextColor(style.title[1], style.title[2], style.title[3])
		readSub:SetText("")
		setBody("Pick an entry to read it. Places, people and stories unlock as you travel, meet the locals and "
			.. "follow the events of each land.", style.faint)
		return
	end
	local zoneName = LC.ZoneName(e.zone)
	readSub:SetText(e.kind == LC.KIND.ZONE and LC.CONTINENTS[(LC.index.zones[e.zone] or {}).map] or
		((LC.KIND_NAME[e.kind] or "") .. " in " .. zoneName))
	if not LC.IsKnown(e.id) then
		readIcon:SetTexture(LOCK)
		readTitle:SetText("Undiscovered")
		readTitle:SetTextColor(style.faint[1], style.faint[2], style.faint[3])
		setBody(string.format(HINTS[e.kind] or HINTS[1], zoneName), style.faint)
		return
	end
	readIcon:SetTexture(LC.KIND_ICON[e.kind])
	readTitle:SetText(LC.Title(e.id) or "")
	readTitle:SetTextColor(style.title[1], style.title[2], style.title[3])
	setBody("Loading...", style.faint)
	local id = e.id
	LC.LoadText(id, function (t)
		if view.entry ~= id then return end
		if not t then
			setBody("The codex couldn't fetch this entry. Try again in a moment.", style.faint)
			return
		end
		readTitle:SetText(t.title)
		local text = markNew(id, t)
		local faint = string.format("|cff%02x%02x%02x", math.floor(style.faint[1] * 255),
			math.floor(style.faint[2] * 255), math.floor(style.faint[3] * 255))
		setBody(t.more and (text .. "\n\n" .. faint .. MORE .. "|r") or text, style.text)
		LC.MarkPartsRead(id, t.shown)
		if not LC.IsRead(id) then
			LC.MarkRead(id)
			refreshEntries()
			refreshZones()
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

local function clearSearch()
	search:SetText("")
	search:ClearFocus()
end

function LC.ShowZone(zone)
	view.mode = "zone"
	view.zone = zone
	view.entry = nil
	clearSearch()
	entryScroll:SetVerticalScroll(0)
	redraw()
end

-- Recent, Unread or search results in the middle list.
function LC.ShowMode(mode)
	view.mode = mode
	view.entry = nil
	if mode == "unread" then unreadSnapshot = LC.KnownByTime(true) end
	if mode ~= "search" then clearSearch() end
	entryScroll:SetVerticalScroll(0)
	redraw()
end

-- Reading an entry keeps the list you picked it from; from anywhere else it opens its zone.
function LC.ShowEntry(id, fromOutside)
	view.entry = id
	local e = LC.index and LC.index.entries[id]
	if e and (fromOutside or view.mode == "zone") then
		view.mode = "zone"
		view.zone = e.zone
		clearSearch()
	end
	redraw()
end

function LC.Open(id)
	frame:Show()
	withIndex(function ()
		if id and LC.index.entries[id] then
			LC.ShowEntry(id, true)
		else
			if view.mode == "zone" and (not view.zone or not LC.index.zones[view.zone]) then
				view.zone = playerZone()
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
			LC.ShowZone(playerZone())
		end
	end)
end

-- Opens the codex at Recent discoveries.
function LC.OpenRecent()
	frame:Show()
	withIndex(function () LC.ShowMode("recent") end)
end

function LC.Toggle()
	if frame:IsShown() then frame:Hide() else LC.Open() end
end

search:SetScript("OnTextChanged", function (self)
	local q = self:GetText():match("^%s*(.-)%s*$")
	setShown(searchHint, self:GetText() == "" and not self:HasFocus())
	if #q >= 2 then
		view.mode = "search"
		view.query = q
		view.entry = nil
		entryScroll:SetVerticalScroll(0)
		redraw()
	elseif view.mode == "search" then
		view.mode = "zone"
		redraw()
	end
end)
search:SetScript("OnEditFocusGained", function () searchHint:Hide() end)
search:SetScript("OnEditFocusLost", function (self) setShown(searchHint, self:GetText() == "") end)
search:SetScript("OnEscapePressed", function (self) self:ClearFocus() end)
search:SetScript("OnEnterPressed", function (self) self:ClearFocus() end)

frame:SetScript("OnShow", function ()
	PlaySound("igCharacterInfoOpen")
	applyStyle()
end)
frame:SetScript("OnHide", function () PlaySound("igCharacterInfoClose") end)

LC.On("KNOWN", redraw)
LC.On("READY", redraw)
LC.On("OPTIONS", function ()
	applyStyle()
	redraw()
end)
