-- The codex window: a search box, Recent and Unread, and the four categories on the left with how
-- much of each you've found; the chosen category in the middle (Locations folded by continent and
-- zone, the others as one list, undiscovered entries as locked placeholders); the entry you picked
-- on the right, with the parts you haven't read yet marked and the entries it relates to.

local LC = LoreCodex

local WIDTH, HEIGHT = 840, 560
local NAV_W, LIST_W = 170, 290
local NAV_ROW, ENTRY_ROW, HEADER_ROW = 22, 22, 22
local RECENT_LIMIT = 30

local GOLD = { 1, 0.82, 0 }
local GREY = { 0.55, 0.55, 0.55 }
local LIGHT_TEXT = { 0.92, 0.87, 0.75 }
local TEXT_SIZES = { 12, 14, 16 }

-- What the middle list shows: a category, "recent", "unread" or "search"; the entry being read; and
-- a zone or entry to scroll to once the list is drawn.
local view = { mode = "category", cat = "locations", entry = nil, query = "", focusZone = nil, focusEntry = nil }

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

local navPane = inset(18, NAV_W)
local entryPane = inset(18 + NAV_W + 6, LIST_W)
local readPane = inset(18 + NAV_W + 6 + LIST_W + 6)

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
	-- A progress bar behind a category's or a zone's name.
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

local navRows = pool(navPane, NAV_ROW)
local entryRows = pool(entryScroll.content, ENTRY_ROW)
local folderRows = pool(entryScroll.content, HEADER_ROW)

local function header(parent, list, i, text, y, x)
	local fs = list[i]
	if not fs then
		fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		fs:SetJustifyH("LEFT")
		list[i] = fs
	end
	fs:ClearAllPoints()
	fs:SetPoint("TOPLEFT", parent, "TOPLEFT", x or 4, -y - 4)
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

local function playerZone()
	return LC.ZoneByName(GetRealZoneText())
end

-- Where an entry is, for the right side of a list row: its zone, or its category when it has none.
local function whereText(e)
	if e.zone and e.zone ~= 0 then return LC.ZoneName(e.zone) end
	return LC.CategoryOf(e.kind).name
end

-----------------------------------------
-- left: search, Recent and Unread, the categories

local search = CreateFrame("EditBox", "LoreCodexSearch", navPane, "InputBoxTemplate")
search:SetHeight(20)
search:SetPoint("TOPLEFT", navPane, "TOPLEFT", 14, -7)
search:SetPoint("TOPRIGHT", navPane, "TOPRIGHT", -10, -7)
search:SetAutoFocus(false)
search:SetMaxLetters(40)

local searchHint = search:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
searchHint:SetPoint("LEFT", search, "LEFT", 2, 0)
searchHint:SetText("Search")

local function navRow(y, width)
	local b = navRows:Get()
	b:ClearAllPoints()
	b:SetPoint("TOPLEFT", navPane, "TOPLEFT", 6, -y)
	return b
end

local function refreshNav()
	navRows:Reset()
	local width = NAV_W - 12
	local y = 36

	local b = navRow(y, width)
	layoutRow(b, width, false, 6)
	b.text:SetText("Recent discoveries")
	b.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	b.right:SetText("")
	setShown(b.selected, view.mode == "recent")
	b:SetScript("OnClick", function () LC.ShowMode("recent") end)
	y = y + NAV_ROW

	local unread = LC.UnreadCount()
	b = navRow(y, width)
	layoutRow(b, width, false, 6)
	b.text:SetText("Unread")
	b.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	b.right:SetText(unread > 0 and unread or "")
	b.right:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
	setShown(b.selected, view.mode == "unread")
	b:SetScript("OnClick", function () LC.ShowMode("unread") end)
	y = y + NAV_ROW + 10

	for _, c in ipairs(LC.CATEGORIES) do
		local known, count = LC.Progress(nil, c.key)
		-- A category with nothing in it yet is left out, Locations excepted.
		if count > 0 or c.key == "locations" then
			b = navRow(y, width)
			layoutRow(b, width, true)
			b.icon:SetTexture(LC.KIND_ICON[c.icon])
			b.icon:SetVertexColor(1, 1, 1)
			b.text:SetText(c.name)
			b.text:SetTextColor(1, 1, 1)
			b.right:SetText(known .. "/" .. count)
			if count > 0 and known == count then b.right:SetTextColor(0.3, 1, 0.3) end
			setBar(b, known, count)
			setShown(b.selected, view.mode == "category" and view.cat == c.key)
			b.cat = c.key
			b:SetScript("OnClick", function (self) LC.ShowCategory(self.cat) end)
			y = y + NAV_ROW + 2
		end
	end

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

local function entryRow(e, y, width, right, indent)
	indent = indent or 0
	local b = entryRows:Get()
	b:ClearAllPoints()
	b:SetPoint("TOPLEFT", entryScroll.content, "TOPLEFT", indent, -y)
	layoutRow(b, width - indent, true)
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

-- Whether a list shows this entry: out of reach is never shown, locked only when not hidden.
local function listed(e)
	return LC.IsVisible(e.id) and not (LC.GetOption("hideLocked") and not LC.IsKnown(e.id))
end

-- Locations: continents, then their zones and their dungeons and raids, by name. Only zones with a
-- location entry for this character are listed.
local function sortedZones()
	local byMap = {}
	for _, zone in pairs(LC.index.zones) do
		if select(2, LC.Progress(zone.id, "locations")) > 0 then
			local group = byMap[zone.map] or { map = zone.map, zones = {}, instances = {} }
			byMap[zone.map] = group
			table.insert((zone.instance or 0) > 0 and group.instances or group.zones, zone)
		end
	end
	local out, seen = {}, {}
	local byName = function (a, b) return a.name < b.name end
	local function add(map)
		local group = byMap[map]
		if not group then return end
		table.sort(group.zones, byName)
		table.sort(group.instances, byName)
		table.insert(out, group)
		seen[map] = true
	end
	for _, map in ipairs(LC.CONTINENT_ORDER) do add(map) end
	for map in pairs(byMap) do if not seen[map] then add(map) end end
	return out
end

-- Folds are closed by default, except the continent, the dungeon group and the zone you are in (the
-- first time they are shown). A fold's key is its continent, "i" and the continent for its dungeons
-- and raids, or "z" and the zone.
local function isCollapsed(key)
	local c = LoreCodexDB.collapsed[key]
	if c ~= nil then return c end
	local here = playerZone()
	local z = here and LC.index.zones[here]
	if not z then return true end
	if type(key) == "number" then return z.map ~= key end
	if key:sub(1, 1) == "z" then return tonumber(key:sub(2)) ~= here end
	return not ((z.instance or 0) > 0 and "i" .. z.map == key)
end

-- Opens every fold on the way to a zone.
local function openTo(zoneId)
	local z = zoneId and LC.index.zones[zoneId]
	if not z then return end
	LoreCodexDB.collapsed[z.map] = false
	if (z.instance or 0) > 0 then LoreCodexDB.collapsed["i" .. z.map] = false end
	LoreCodexDB.collapsed["z" .. zoneId] = false
end

local function drawLocations(width)
	local y, focusY = 0, nil
	local here = playerZone()
	local kinds = LC.CATEGORY.locations.kinds

	local function folder(key, label, known, count, indent, isHere)
		local collapsed = isCollapsed(key)
		local c = folderRows:Get()
		c:ClearAllPoints()
		c:SetPoint("TOPLEFT", entryScroll.content, "TOPLEFT", indent, -y)
		layoutRow(c, width - indent, true)
		c.icon:SetTexture(collapsed and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up")
		c.icon:SetVertexColor(1, 1, 1)
		c.text:SetText(isHere and (label .. " |cff999999(here)|r") or label)
		c.text:SetTextColor(GOLD[1], GOLD[2], GOLD[3])
		c.right:SetText(known .. "/" .. count)
		if count > 0 and known == count then c.right:SetTextColor(0.3, 1, 0.3) end
		c.selected:Hide()
		c.key = key
		c:SetScript("OnClick", function (self)
			LoreCodexDB.collapsed[self.key] = not isCollapsed(self.key)
			refreshEntries()
		end)
		y = y + HEADER_ROW
		return collapsed
	end

	local function zoneFold(zone, indent)
		if view.focusZone == zone.id then focusY = y end
		local known, count = LC.Progress(zone.id, "locations")
		local label = zone.instance == 2 and (zone.name .. " |cff999999(raid)|r") or zone.name
		if not folder("z" .. zone.id, label, known, count, indent, zone.id == here) then
			for _, e in ipairs(zone.entries) do
				if kinds[e.kind] and listed(e) then
					if view.focusEntry == e.id then focusY = y end
					y = entryRow(e, y, width, nil, indent + 12)
				end
			end
		end
	end

	for _, group in ipairs(sortedZones()) do
		local ck, ct = 0, 0
		for _, zone in ipairs(group.zones) do
			local k, t = LC.Progress(zone.id, "locations")
			ck, ct = ck + k, ct + t
		end
		for _, zone in ipairs(group.instances) do
			local k, t = LC.Progress(zone.id, "locations")
			ck, ct = ck + k, ct + t
		end
		if not folder(group.map, LC.CONTINENTS[group.map] or "Elsewhere", ck, ct, 0) then
			for _, zone in ipairs(group.zones) do zoneFold(zone, 10) end
			if #group.instances > 0 then
				local ik, it = 0, 0
				for _, zone in ipairs(group.instances) do
					local k, t = LC.Progress(zone.id, "locations")
					ik, it = ik + k, it + t
				end
				if not folder("i" .. group.map, "Dungeons and Raids", ik, it, 10) then
					for _, zone in ipairs(group.instances) do zoneFold(zone, 20) end
				end
			end
		end
		y = y + 2
	end
	return y, focusY
end

-- Every other category is one list. People and Peoples and Factions are alphabetical, the ones still
-- locked after the rest; History is in the order of time, locked ones in their place; Stories are
-- grouped by their zone.
local function drawList(cat, width)
	local y, h, focusY = 0, 0, nil
	local kinds = LC.CATEGORY[cat].kinds
	local known, locked = {}, {}
	for id, e in pairs(LC.index.entries) do
		if kinds[e.kind] and listed(e) then
			table.insert(LC.IsKnown(id) and known or locked, e)
		end
	end
	local function row(e, right)
		if view.focusEntry == e.id then focusY = y end
		y = entryRow(e, y, width, right)
	end
	local byTime = function (a, b)
		if a.sort ~= b.sort then return a.sort < b.sort end
		return a.id < b.id
	end

	if cat == "history" then
		local all = {}
		for _, e in ipairs(known) do table.insert(all, e) end
		for _, e in ipairs(locked) do table.insert(all, e) end
		table.sort(all, byTime)
		for _, e in ipairs(all) do row(e) end
	elseif cat == "stories" then
		local all = {}
		for _, e in ipairs(known) do table.insert(all, e) end
		for _, e in ipairs(locked) do table.insert(all, e) end
		table.sort(all, function (a, b)
			local za, zb = LC.ZoneName(a.zone), LC.ZoneName(b.zone)
			if za ~= zb then return za < zb end
			return byTime(a, b)
		end)
		local lastZone
		for _, e in ipairs(all) do
			if e.zone ~= lastZone then
				if lastZone then y = y + 4 end
				h = h + 1
				header(entryScroll.content, entryHeaders, h, LC.ZoneName(e.zone), y):SetFontObject("GameFontNormal")
				y = y + HEADER_ROW
				lastZone = e.zone
			end
			row(e)
		end
	else
		table.sort(known, function (a, b)
			-- A title not fetched yet sorts last until it comes.
			local ta, tb = LC.Title(a.id) or "~", LC.Title(b.id) or "~"
			if ta ~= tb then return ta < tb end
			return a.id < b.id
		end)
		table.sort(locked, byTime)
		for _, e in ipairs(known) do row(e, cat == "people" and e.zone ~= 0 and LC.ZoneName(e.zone) or nil) end
		if #locked > 0 then
			if #known > 0 then y = y + 4 end
			h = h + 1
			header(entryScroll.content, entryHeaders, h, "Undiscovered", y):SetFontObject("GameFontNormal")
			y = y + HEADER_ROW
			for _, e in ipairs(locked) do row(e) end
		end
	end
	if y == 0 then y = emptyNote("Nothing here yet.") end
	return y, focusY
end

-- The list Unread shows is taken when you open it, so entries don't vanish as you read them.
local unreadSnapshot = {}

local searchedTitles = false

local function searchResults(query)
	local q = query:lower()
	local zones, entries = {}, {}
	for _, zone in pairs(LC.index.zones) do
		if select(2, LC.Progress(zone.id, "locations")) > 0 and zone.name:lower():find(q, 1, true) then table.insert(zones, zone) end
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
	folderRows:Reset()
	hideAll(entryHeaders)
	local width = entryScroll:GetWidth()
	local y, h, focusY = 0, 0, nil
	hideLocked:SetChecked(LC.GetOption("hideLocked") and true or false)
	setShown(hideLocked, view.mode == "category")

	if view.mode == "recent" then
		listTitle:SetText("Recent discoveries")
		local list = LC.KnownByTime(false, RECENT_LIMIT)
		if #list == 0 then y = emptyNote("Entries you discover while you play are listed here, newest first.") end
		for _, e in ipairs(list) do y = entryRow(e, y, width, LC.WhenText(LC.found[e.id])) end
	elseif view.mode == "unread" then
		listTitle:SetText("Unread")
		if #unreadSnapshot == 0 then y = emptyNote("You have read everything you have discovered.") end
		for _, e in ipairs(unreadSnapshot) do y = entryRow(e, y, width, whereText(e)) end
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
				local known, count = LC.Progress(zone.id, "locations")
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
			for _, e in ipairs(entries) do y = entryRow(e, y, width, whereText(e)) end
		end
	else
		listTitle:SetText(LC.CATEGORY[view.cat].name)
		if view.cat == "locations" then
			y, focusY = drawLocations(width)
		else
			y, focusY = drawList(view.cat, width)
		end
	end
	entryScroll.content:SetHeight(math.max(y, 10))

	-- Scrolls to the zone or entry the codex was opened at, once.
	if view.focusZone or view.focusEntry then
		view.focusZone, view.focusEntry = nil, nil
		if focusY then
			entryScroll:UpdateScrollChildRect()
			local range = entryScroll:GetVerticalScrollRange() or 0
			entryScroll:SetVerticalScroll(math.max(0, math.min(focusY - 2 * ENTRY_ROW, range)))
		end
	end
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

-- The entries a page relates to, under its text.
local relatedLabel = readScroll.content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
relatedLabel:SetJustifyH("LEFT")
relatedLabel:SetText("Related")
relatedLabel:Hide()
local relatedRows = pool(readScroll.content, ENTRY_ROW)

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

-- What a locked entry says when it has no hint of its own.
local HINTS = {
	[0] = "Travel to %s to learn of this land.",
	[1] = "Explore %s to discover this place.",
	[2] = "Meet the people of %s to learn more.",
	[3] = "Take part in the events of %s to uncover this story.",
}
local HINT_ANYWHERE = "Keep exploring the world to learn more."

local function hintFor(e)
	if e.hint and e.hint ~= "" then return e.hint end
	local zoneName = LC.ZoneName(e.zone)
	if zoneName == "" or not HINTS[e.kind] then return HINT_ANYWHERE end
	return string.format(HINTS[e.kind], zoneName)
end

-- The line under a page's title.
local function subtitle(e)
	local zoneName = LC.ZoneName(e.zone)
	if e.kind == LC.KIND.ZONE then return LC.ZoneLabel(e.zone) end
	if e.kind == LC.KIND.PLACE then return "Location in " .. zoneName end
	if e.kind == LC.KIND.PERSON then return zoneName ~= "" and ("Person in " .. zoneName) or "Person" end
	if e.kind == LC.KIND.STORY then return "Story in " .. zoneName end
	return LC.KIND_NAME[e.kind] or ""
end

-- Under an entry the character could still add to.
local MORE = "There is more to learn."

local function setBody(text, color)
	readBody:SetWidth(readScroll:GetWidth() - 4)
	readBody:SetText(text)
	readBody:SetTextColor(color[1], color[2], color[3])
	relatedLabel:Hide()
	relatedRows:Reset()
	readScroll.content:SetHeight(readBody:GetStringHeight() + 12)
	readScroll:SetVerticalScroll(0)
end

-- Links to the related entries this character knows, under the text.
local function showRelated(ids)
	local width = readScroll:GetWidth() - 4
	local y = readBody:GetStringHeight() + 18
	local any = false
	for _, id in ipairs(ids or {}) do
		local e = LC.index.entries[id]
		if e and LC.IsKnown(id) and LC.IsVisible(id) then
			if not any then
				relatedLabel:ClearAllPoints()
				relatedLabel:SetPoint("TOPLEFT", readScroll.content, "TOPLEFT", 0, -y)
				relatedLabel:Show()
				y = y + HEADER_ROW
				any = true
			end
			local b = relatedRows:Get()
			b:ClearAllPoints()
			b:SetPoint("TOPLEFT", readScroll.content, "TOPLEFT", 0, -y)
			layoutRow(b, width, true)
			b.icon:SetTexture(LC.KIND_ICON[e.kind])
			b.icon:SetVertexColor(1, 1, 1)
			b.text:SetText(LC.Title(id) or "...")
			b.text:SetTextColor(1, 1, 1)
			b.right:SetText(LC.CategoryOf(e.kind).name)
			b.selected:Hide()
			b.entry = id
			b:SetScript("OnClick", function (self) LC.ShowEntry(self.entry, true) end)
			wantTitle(id)
			y = y + ENTRY_ROW
		end
	end
	if any then readScroll.content:SetHeight(y + 6) end
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
		local c = view.mode == "category" and LC.CATEGORY[view.cat]
		readIcon:SetTexture(LC.KIND_ICON[c and c.icon or 0])
		readTitle:SetText(c and c.name or "Lore Codex")
		readTitle:SetTextColor(style.title[1], style.title[2], style.title[3])
		readSub:SetText("")
		setBody("Pick an entry to read it. Entries unlock as you travel, meet the people of the world and "
			.. "take part in its events.", style.faint)
		return
	end
	readSub:SetText(subtitle(e))
	if not LC.IsKnown(e.id) then
		readIcon:SetTexture(LOCK)
		readTitle:SetText("Undiscovered")
		readTitle:SetTextColor(style.faint[1], style.faint[2], style.faint[3])
		setBody(hintFor(e), style.faint)
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
		showRelated(t.related)
		LC.MarkPartsRead(id, t.shown)
		if not LC.IsRead(id) then
			LC.MarkRead(id)
			refreshEntries()
			refreshNav()
		end
	end)
end

-----------------------------------------
-- navigation

local function redraw()
	if not frame:IsShown() or not LC.index then return end
	refreshNav()
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

function LC.ShowCategory(cat)
	view.mode = "category"
	view.cat = LC.CATEGORY[cat] and cat or "locations"
	view.entry = nil
	clearSearch()
	entryScroll:SetVerticalScroll(0)
	redraw()
end

-- Locations, with the folds open down to a zone and the list scrolled to it.
function LC.ShowZone(zone)
	view.mode = "category"
	view.cat = "locations"
	view.entry = nil
	openTo(zone)
	view.focusZone = zone
	clearSearch()
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

-- Reading an entry keeps the list you picked it from; from anywhere else it opens its category, with
-- the folds open down to it.
function LC.ShowEntry(id, fromOutside)
	view.entry = id
	local e = LC.index and LC.index.entries[id]
	if e and fromOutside then
		view.mode = "category"
		view.cat = LC.CategoryOf(e.kind).key
		if view.cat == "locations" then openTo(e.zone) end
		view.focusEntry = id
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
			redraw()
		end
	end)
end

-- Opens the codex at a zone's locations (a codex zone id), or wherever you are.
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
		view.mode = "category"
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
