-- LoreCodex core: saved settings, the server protocol, the entry index and texts, slash commands.
-- The entries come from the mod-lore-codex server module; titles and texts are only sent for
-- entries this character has discovered, and are kept across sessions until the server's data
-- stamp changes. An entry can grow: each part a character earns adds to its text, so a cached
-- text is only good for the number of parts and the progression state it was fetched with.

LoreCodex = LoreCodex or {}
local LC = LoreCodex

LC.PREFIX = "LCX"
LC.PROTOCOL = 3

LC.KIND = { ZONE = 0, PLACE = 1, PERSON = 2, STORY = 3 }
LC.KIND_NAME = { [0] = "Zone", [1] = "Place", [2] = "Person", [3] = "Story" }
LC.KIND_SECTION = { [0] = "The Land", [1] = "Places", [2] = "People", [3] = "Stories" }
LC.KIND_ICON = {
	[0] = "Interface\\Icons\\INV_Misc_Map_01",
	[1] = "Interface\\Icons\\INV_Misc_Spyglass_03",
	[2] = "Interface\\Icons\\Achievement_Character_Human_Male",
	[3] = "Interface\\Icons\\INV_Misc_Book_09",
}
LC.CONTINENTS = { [0] = "Eastern Kingdoms", [1] = "Kalimdor", [530] = "Outland", [571] = "Northrend" }
LC.CONTINENT_ORDER = { 0, 1, 530, 571 }
-- Zones whose map isn't their continent's: the blood elf and draenei lands are on Outland's map,
-- the death knights' Scarlet Enclave has one of its own.
LC.ZONE_CONTINENT = {
	[3430] = 0, [3433] = 0, [3487] = 0, [4080] = 0, [4298] = 0, -- Eversong, Ghostlands, Silvermoon, Quel'Danas, Scarlet Enclave
	[3524] = 1, [3525] = 1, [3557] = 1,                         -- Azuremyst, Bloodmyst, the Exodar
}

-----------------------------------------
-- tiny event bus and timers (3.3.5a has no C_Timer)

local listeners = {}
function LC.On(event, fn)
	listeners[event] = listeners[event] or {}
	table.insert(listeners[event], fn)
end

function LC.Fire(event, ...)
	local list = listeners[event]
	if not list then return end
	for i = 1, #list do list[i](...) end
end

local timerFrame = CreateFrame("Frame")
local timers = {}
function LC.After(delay, fn)
	table.insert(timers, { at = GetTime() + delay, fn = fn })
	timerFrame:Show()
end
timerFrame:SetScript("OnUpdate", function (self)
	local now, i = GetTime(), 1
	while i <= #timers do
		if timers[i].at <= now then
			table.remove(timers, i).fn()
		else
			i = i + 1
		end
	end
	if #timers == 0 then self:Hide() end
end)

function LC.Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cffe6cc80Lore Codex:|r " .. msg)
end

-----------------------------------------
-- server protocol: "<command>:<request id>:<field>..." whispered to yourself under the LCX prefix

LC.serverReady = false

local nextReq = 0
local pending = {}
-- list answers: R (meta), D (rows), E (end)
local LISTS = { I = true, K = true, T = true }

-- The server lets each character make a burst of 16 requests and then 4 a second (the index costs
-- 4, the hello nothing), and refuses the rest as busy. Requests are paced a little under that here,
-- so a zone full of titles to fetch goes out steadily instead of being refused and retried.
local BURST, RATE = 14, 3.5
local tokens, lastRefill = BURST, nil
local outbox = {}

local function costOf(msg)
	local cmd = msg:match("^([^:]+)")
	if cmd == "HELLO" then return 0 end
	return cmd == "I" and 4 or 1
end

local function pump()
	local now = GetTime()
	if lastRefill then tokens = math.min(BURST, tokens + (now - lastRefill) * RATE) end
	lastRefill = now
	while outbox[1] do
		local item = outbox[1]
		local cost = costOf(item.msg)
		if tokens < cost then return false end
		tokens = tokens - cost
		table.remove(outbox, 1)
		-- A request waiting its turn hasn't been asked yet: its timeout starts now.
		if item.p then item.p.at = now end
		SendAddonMessage(LC.PREFIX, item.msg, "WHISPER", UnitName("player"))
	end
	return true
end

local pacer = CreateFrame("Frame")
pacer:Hide()
pacer:SetScript("OnUpdate", function (self)
	if pump() then self:Hide() end
end)

local function send(msg, p)
	table.insert(outbox, { msg = msg, p = p })
	if not pump() then pacer:Show() end
end

-- handler(result, err): result is { rows = {...}, meta = {...}, raw = {...} } for list answers and
-- the array of fields for single ones; err is set when the server refused ("busy", "bad", "none").
function LC.Request(cmd, fields, handler)
	nextReq = nextReq + 1
	local req = tostring(nextReq)
	local msg = cmd .. ":" .. req
	if fields and #fields > 0 then msg = msg .. ":" .. table.concat(fields, ":") end
	local p = { req = req, cmd = cmd, handler = handler, rows = {}, raw = {}, msg = msg, tries = 0, at = GetTime() }
	pending[req] = p
	send(msg, p)
	return req
end

local function splitFields(text)
	local out = {}
	if text == nil or text == "" then return out end
	for field in (text .. ":"):gmatch("([^:]*):") do table.insert(out, field) end
	return out
end

-- The server escapes ',', ';', ':', '|', '%' and line breaks as %XX.
function LC.Unescape(text)
	if type(text) ~= "string" then return text end
	if text == "-" then return "" end
	return (text:gsub("%%(%x%x)", function (h) return string.char(tonumber(h, 16)) end))
end

local function parseRows(text, into)
	for row in text:gmatch("[^;]+") do
		local values = {}
		for value in row:gmatch("[^,]+") do table.insert(values, tonumber(value) or value) end
		table.insert(into, values)
	end
end

local function finish(req, result, err)
	local p = pending[req]
	if not p then return end
	pending[req] = nil
	if p.handler then p.handler(result, err) end
end

local onHello, onDiscovered

local function onAddonMessage(message)
	local code, req, rest = message:match("^([^:]+):([^:]*):?(.*)$")
	if not code then return end

	-- A whisper to yourself is echoed back. The module swallows ours; on a realm without it the
	-- echo comes back, and must not pass for the answer.
	local p = pending[req]
	if p and p.msg == message then return end

	if code == "HELLO" then
		local fields = splitFields(rest)
		if #fields < 3 then return end
		onHello(fields)
		finish(req, fields)
		return
	elseif code == "NEW" or code == "UPD" then
		onDiscovered(splitFields(rest), code == "UPD")
		return
	elseif code == "STAMP" then
		LC.stamp = rest
		LC.CheckCache()
		LC.Refresh()
		return
	elseif code == "RESET" then
		LC.RefreshKnown()
		return
	elseif code == "OFF" then
		LC.serverReady = false
		LC.Fire("NO_SERVER")
		return
	elseif code == "ERR" then
		if rest == "busy" and p and p.tries < 6 then
			p.tries = p.tries + 1
			LC.After(0.25 * p.tries, function () if pending[req] == p then send(p.msg, p) end end)
			return
		end
		finish(req, nil, rest)
		return
	end

	local kind, part = code:sub(1, 1), code:sub(2)
	if #code == 2 and LISTS[kind] and p and (part == "R" or part == "D" or part == "E") then
		if part == "R" then
			p.meta = splitFields(rest)
		elseif part == "D" then
			table.insert(p.raw, rest)
			if kind ~= "T" then parseRows(rest, p.rows) end
		else
			finish(req, { rows = p.rows, meta = p.meta or {}, raw = p.raw })
		end
	end
end

local helloSerial = 0
function LC.SayHello()
	helloSerial = helloSerial + 1
	local mine = helloSerial
	LC.Request("HELLO", { tostring(LC.PROTOCOL) })
	LC.After(6, function ()
		if mine == helloSerial and not LC.serverReady then LC.Fire("NO_SERVER") end
	end)
end

-- Requests the server never answered are dropped after a while so their handlers don't wait forever.
local sweep = CreateFrame("Frame")
local sweepElapsed = 0
sweep:SetScript("OnUpdate", function (self, elapsed)
	sweepElapsed = sweepElapsed + elapsed
	if sweepElapsed < 2 then return end
	sweepElapsed = 0
	local now, expired = GetTime(), {}
	for req, p in pairs(pending) do
		if now - p.at > 30 then table.insert(expired, req) end
	end
	for _, req in ipairs(expired) do finish(req, nil, "timeout") end
end)

-----------------------------------------
-- the cache: the index and the texts, kept until the server's data stamp changes

function LC.CheckCache()
	local db = LoreCodexDB
	local key = tostring(LC.stamp) .. ":" .. GetLocale()
	if db.cacheKey ~= key then
		db.cacheKey = key
		db.cache = { index = nil, text = {} }
		LC.index = nil
	end
end

local function cache()
	return LoreCodexDB.cache
end

-----------------------------------------
-- the index: zones and entries (without their titles)

-- LC.index = { entries = { [id] = entry }, zones = { [zoneId] = zone } }; an entry is
-- { id, kind, zone, sort, faction }, a zone { id, map, name, entries = { entry, ... } }.
local function buildIndex(rows)
	local index = { entries = {}, zones = {} }
	local faction = UnitFactionGroup("player")
	for _, r in ipairs(rows) do
		if r[1] == "Z" then
			index.zones[r[2]] = { id = r[2], map = LC.ZONE_CONTINENT[r[2]] or r[3], name = LC.Unescape(tostring(r[4] or "-")),
				entries = {} }
		end
	end
	for _, r in ipairs(rows) do
		if r[1] == "E" then
			local e = { id = r[2], kind = r[3], zone = r[4], sort = r[5], faction = r[6] }
			local hidden = (e.faction == 1 and faction ~= "Alliance") or (e.faction == 2 and faction ~= "Horde")
			local zone = index.zones[e.zone]
			if zone and not hidden then
				index.entries[e.id] = e
				table.insert(zone.entries, e)
			end
		end
	end
	for _, zone in pairs(index.zones) do
		table.sort(zone.entries, function (a, b)
			if a.kind ~= b.kind then return a.kind < b.kind end
			if a.sort ~= b.sort then return a.sort < b.sort end
			return a.id < b.id
		end)
	end
	return index
end

function LC.LoadIndex(done)
	if LC.index then done(LC.index) return end
	if cache().index then
		LC.index = buildIndex(cache().index)
		done(LC.index)
		return
	end
	if not LC.serverReady then done(nil) return end
	LC.Request("I", nil, function (result)
		if not result then done(nil) return end
		cache().index = result.rows
		LC.index = buildIndex(result.rows)
		done(LC.index)
	end)
end

-----------------------------------------
-- what this character knows, and what it can never unlock (asked fresh every session)

LC.known = {}
LC.hidden = {}
LC.parts = {}  -- [entry] = parts earned
LC.state = 0   -- the server's mod-individual-progression state for this character

function LC.RefreshKnown(done)
	if not LC.serverReady then if done then done() end return end
	LC.Request("K", nil, function (result)
		if result then
			LC.known, LC.hidden, LC.parts = {}, {}, {}
			LC.state = tonumber(result.meta[2]) or 0
			for _, r in ipairs(result.rows) do
				if r[1] == "K" then
					LC.known[r[2]] = true
					LC.parts[r[2]] = tonumber(r[3]) or 0
				elseif r[1] == "H" then
					LC.hidden[r[2]] = true
				end
			end
			LC.Fire("KNOWN")
		end
		if done then done() end
	end)
end

function LC.Refresh()
	LC.LoadIndex(function () LC.RefreshKnown() end)
end

function LC.IsKnown(id)
	return LC.known[id] == true
end

-- Entries out of this character's reach (the other faction's, a race or class it isn't) stay
-- out of the codex unless it somehow learned them anyway.
function LC.IsVisible(id)
	return LC.known[id] == true or not LC.hidden[id]
end

-- What was read is kept as the number of parts the entry had then (true from older versions
-- means none), so an entry that earned a part since shows as updated.
local function partsRead(id)
	local r = LoreCodexCharDB.read[id]
	if r == true then return 0 end
	return r
end

function LC.IsRead(id)
	local r = partsRead(id)
	return r ~= nil and r >= (LC.parts[id] or 0)
end

-- Read before, but it has grown since.
function LC.IsUpdated(id)
	local r = partsRead(id)
	return r ~= nil and r < (LC.parts[id] or 0)
end

function LC.MarkRead(id)
	if not LC.IsRead(id) then
		LoreCodexCharDB.read[id] = LC.parts[id] or 0
		LC.Fire("READ", id)
	end
end

-- Discovered and visible to this character, out of all visible, for a zone (or every zone).
function LC.Progress(zone)
	local known, total = 0, 0
	if not LC.index then return 0, 0 end
	for id, e in pairs(LC.index.entries) do
		if (not zone or e.zone == zone) and LC.IsVisible(id) then
			total = total + 1
			if LC.known[id] then known = known + 1 end
		end
	end
	return known, total
end

-----------------------------------------
-- titles and texts of known entries

function LC.Title(id)
	local t = cache().text[id]
	return t and t.title
end

-- done(entry) with entry = { title, body, parts, more, state }, or nil when the server wouldn't
-- say. more is true when the character could still earn another part.
-- Texts on their way: [entry] = the callbacks waiting for it. The codex list asks again for every
-- missing title each time it redraws, so a text already asked for is not asked for twice.
local loading = {}

function LC.LoadText(id, done)
	local t = cache().text[id]
	if t and t.body and t.parts == (LC.parts[id] or 0) and t.state == LC.state then done(t) return end
	if not LC.serverReady then done(nil) return end
	if loading[id] then table.insert(loading[id], done) return end
	loading[id] = { done }
	LC.Request("T", { tostring(id) }, function (result)
		local waiting = loading[id] or {}
		loading[id] = nil
		if result then
			local meta = result.meta
			t = { title = LC.Unescape(meta[4] or "-"), body = LC.Unescape(table.concat(result.raw)),
				parts = tonumber(meta[5]) or 0, more = meta[6] == "1", state = tonumber(meta[7]) or 0 }
			cache().text[id] = t
		else
			t = nil
		end
		for _, fn in ipairs(waiting) do fn(t) end
	end)
end

-----------------------------------------
-- hello and discoveries

onHello = function (fields)
	local version = tonumber(fields[1])
	if version ~= LC.PROTOCOL then
		LC.Print("the server speaks a different version of the codex (" .. tostring(version) .. ", this addon "
			.. LC.PROTOCOL .. "). Update the LoreCodex addon.")
		LC.Fire("NO_SERVER")
		return
	end
	LC.serverReady = true
	LC.stamp = fields[2] or "0"
	LC.CheckCache()
	local backfilled = tonumber(fields[3]) or 0
	LC.LoadIndex(function ()
		LC.RefreshKnown(function ()
			if backfilled > 0 then
				LC.Print(backfilled .. (backfilled == 1 and " entry was" or " entries were")
					.. " added from your past travels. Type |cffffd200/codex|r to read them.")
			end
			LC.Fire("READY")
		end)
	end)
end

-- NEW:0:<entry>:<kind>:<zone>:<title>:<parts> and UPD (a known entry earned a part)
onDiscovered = function (fields, updated)
	local id, kind, zone = tonumber(fields[1]), tonumber(fields[2]), tonumber(fields[3])
	if not id then return end
	LC.known[id] = true
	LC.hidden[id] = nil
	LC.parts[id] = tonumber(fields[5]) or 0
	local t = cache().text[id] or {}
	t.title = LC.Unescape(fields[4] or "-")
	t.body = nil
	cache().text[id] = t
	-- An entry the index doesn't have yet: the index is from before a reload.
	if LC.index and not LC.index.entries[id] then
		LC.index = nil
		cache().index = nil
		LC.LoadIndex(function () LC.Fire("KNOWN") end)
	end
	LC.Fire("DISCOVERED", id, kind, zone, t.title, updated)
	LC.Fire("KNOWN")
end

function LC.ZoneName(zone)
	local z = LC.index and LC.index.zones[zone]
	return z and z.name or ""
end

-----------------------------------------

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("CHAT_MSG_ADDON")

events:SetScript("OnEvent", function (self, event, ...)
	if event == "ADDON_LOADED" then
		if ... == "LoreCodex" then
			LoreCodexDB = LoreCodexDB or {}
			LoreCodexDB.cache = LoreCodexDB.cache or { text = {} }
			LoreCodexDB.cache.text = LoreCodexDB.cache.text or {}
			LoreCodexDB.options = LoreCodexDB.options or {}
			if LoreCodexDB.options.toast == nil then LoreCodexDB.options.toast = true end
			if LoreCodexDB.options.sound == nil then LoreCodexDB.options.sound = true end
			if LoreCodexDB.options.mapButton == nil then LoreCodexDB.options.mapButton = true end
			LoreCodexDB.minimap = LoreCodexDB.minimap or { angle = 215 }
			LoreCodexCharDB = LoreCodexCharDB or {}
			LoreCodexCharDB.read = LoreCodexCharDB.read or {}
		end
	elseif event == "PLAYER_LOGIN" then
		LC.Fire("LOGIN")
		LC.After(1, LC.SayHello)
		-- Shift-L opens the codex, the first time only and only when nothing else has the key.
		if not LoreCodexDB.boundKey then
			LoreCodexDB.boundKey = true
			local action = GetBindingAction(LC.DEFAULT_KEY)
			if not action or action == "" then
				SetBinding(LC.DEFAULT_KEY, "LORECODEX_TOGGLE")
				SaveBindings(GetCurrentBindingSet())
			end
		end
	elseif event == "CHAT_MSG_ADDON" then
		local prefix, message, _, sender = ...
		if prefix == LC.PREFIX and sender == UnitName("player") then onAddonMessage(message) end
	end
end)

-----------------------------------------
-- settings and the numbers the buttons show

LC.DEFAULT_KEY = "SHIFT-L"

-- Changes a setting and lets the buttons and the options page catch up.
function LC.SetOption(key, value)
	if key == "minimap" then
		LoreCodexDB.minimap.hide = not value or nil
	else
		LoreCodexDB.options[key] = value
	end
	LC.Fire("OPTIONS")
end

function LC.GetOption(key)
	if key == "minimap" then return not LoreCodexDB.minimap.hide end
	return LoreCodexDB.options[key]
end

-- The key that opens the codex, as the client shows it ("SHIFT-L"), or nil.
function LC.KeyText()
	local key = GetBindingKey("LORECODEX_TOGGLE")
	return key and GetBindingText(key, "KEY_") or nil
end

-- The codex zone with this name that has entries for this character.
function LC.ZoneByName(name)
	if not LC.index or not name then return nil end
	for id, zone in pairs(LC.index.zones) do
		if zone.name == name and select(2, LC.Progress(id)) > 0 then return id end
	end
end

-- Discovered and visible, out of all visible, for every zone on a continent.
function LC.ContinentProgress(map)
	local known, total = 0, 0
	if not LC.index then return 0, 0 end
	for id, zone in pairs(LC.index.zones) do
		if zone.map == map then
			local k, t = LC.Progress(id)
			known, total = known + k, total + t
		end
	end
	return known, total
end

-- Entries discovered but not read yet.
function LC.UnreadCount()
	local n = 0
	for id in pairs(LC.known) do
		if not LC.IsRead(id) and LC.IsVisible(id) then n = n + 1 end
	end
	return n
end

BINDING_HEADER_LORECODEX = "Lore Codex"
BINDING_NAME_LORECODEX_TOGGLE = "Toggle the Lore Codex"

SLASH_LORECODEX1 = "/codex"
SLASH_LORECODEX2 = "/lore"
SlashCmdList.LORECODEX = function (msg)
	msg = (msg or ""):lower():match("^%s*(.-)%s*$")
	if msg == "toast" then
		LC.SetOption("toast", not LC.GetOption("toast"))
		LC.Print("discovery toasts " .. (LoreCodexDB.options.toast and "on." or "off."))
	elseif msg == "sound" then
		LC.SetOption("sound", not LC.GetOption("sound"))
		LC.Print("discovery sound " .. (LoreCodexDB.options.sound and "on." or "off."))
	elseif msg == "minimap" then
		LC.SetOption("minimap", not LC.GetOption("minimap"))
		LC.Print("minimap button " .. (LC.GetOption("minimap") and "shown." or "hidden."))
	elseif msg == "map" or msg == "mapbutton" then
		LC.SetOption("mapButton", not LC.GetOption("mapButton"))
		LC.Print("world map button " .. (LC.GetOption("mapButton") and "shown." or "hidden."))
	elseif msg == "options" or msg == "config" then
		LC.OpenOptions()
	elseif msg == "reset" then
		LC.Fire("RESET_POSITION")
		LC.Print("window position reset.")
	elseif msg == "refresh" then
		LoreCodexDB.cacheKey = nil
		LC.CheckCache()
		LC.SayHello()
		LC.Print("codex data will be fetched again.")
	elseif msg == "help" then
		LC.Print("|cffffd200/codex|r opens the codex" .. (LC.KeyText() and (" (or " .. LC.KeyText() .. ")") or "") .. ". "
			.. "|cffffd200/codex options|r opens the settings. |cffffd200/codex toast|r, |cffffd200/codex sound|r, "
			.. "|cffffd200/codex minimap|r and |cffffd200/codex map|r turn the toasts, their sound, the minimap button "
			.. "and the world map button on or off. |cffffd200/codex reset|r moves the window back. "
			.. "|cffffd200/codex refresh|r fetches the data again.")
	else
		LC.Toggle()
	end
end
