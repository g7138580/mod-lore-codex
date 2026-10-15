-- The minimap button: left-click opens the codex where you are, right-click opens the options,
-- drag moves it around the minimap. Its tooltip shows how much of the zone and the continent
-- you have found, and it glows while discovered entries wait to be read.

local LC = LoreCodex

local button = CreateFrame("Button", "LoreCodexMinimapButton", Minimap)
button:SetSize(31, 31)
button:SetFrameStrata("MEDIUM")
button:SetFrameLevel(8)
button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
button:RegisterForDrag("LeftButton")
button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
button:Hide()

local icon = button:CreateTexture(nil, "BACKGROUND")
icon:SetTexture("Interface\\Icons\\INV_Misc_Map_01")
icon:SetSize(20, 20)
icon:SetPoint("TOPLEFT", button, "TOPLEFT", 7, -5)
icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
local border = button:CreateTexture(nil, "OVERLAY")
border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
border:SetSize(53, 53)
border:SetPoint("TOPLEFT", button, "TOPLEFT")

-- A soft pulse while there are unread entries.
local glow = button:CreateTexture(nil, "ARTWORK")
glow:SetTexture("Interface\\Buttons\\CheckButtonHilight")
glow:SetBlendMode("ADD")
glow:SetVertexColor(1, 0.82, 0.3)
glow:SetSize(26, 26)
glow:SetPoint("CENTER", icon, "CENTER")
glow:Hide()

local pulse = CreateFrame("Frame", nil, button)
pulse:Hide()
pulse:SetScript("OnUpdate", function (self, elapsed)
	self.t = (self.t or 0) + elapsed
	glow:SetAlpha(0.35 + 0.45 * math.abs(math.sin(self.t * 2)))
end)

local function place()
	local angle = math.rad(LoreCodexDB.minimap.angle or 215)
	local radius = (Minimap:GetWidth() / 2) + 10
	button:ClearAllPoints()
	button:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * radius, math.sin(angle) * radius)
end

button:SetScript("OnDragStart", function (self)
	self:SetScript("OnUpdate", function ()
		local mx, my = Minimap:GetCenter()
		local cx, cy = GetCursorPosition()
		local scale = Minimap:GetEffectiveScale()
		LoreCodexDB.minimap.angle = math.deg(math.atan2(cy / scale - my, cx / scale - mx))
		place()
	end)
end)
button:SetScript("OnDragStop", function (self) self:SetScript("OnUpdate", nil) end)

button:SetScript("OnClick", function (self, which)
	if which == "RightButton" then
		LC.OpenOptions()
	else
		LC.Toggle()
	end
end)

local function line(label, known, total)
	local color = (total > 0 and known == total) and "|cff4cff4c" or "|cffffffff"
	GameTooltip:AddDoubleLine(label, color .. known .. "/" .. total .. "|r", 1, 0.82, 0, 1, 1, 1)
end

button:SetScript("OnEnter", function (self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetText("Lore Codex")
	if LC.index then
		local zone = LC.ZoneByName(GetRealZoneText())
		if zone then line(LC.ZoneName(zone), LC.Progress(zone)) end
		local z = zone and LC.index.zones[zone]
		if z and LC.CONTINENTS[z.map] then line(LC.CONTINENTS[z.map], LC.ContinentProgress(z.map)) end
		line("All lore", LC.Progress())
		local unread = LC.UnreadCount()
		if unread > 0 then
			GameTooltip:AddLine(unread .. (unread == 1 and " new entry" or " new entries") .. " to read", 1, 0.82, 0)
		end
	else
		GameTooltip:AddLine("Waiting for the server...", 0.6, 0.6, 0.6)
	end
	local key = LC.KeyText()
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Click to open" .. (key and (" (" .. key .. ")") or "") .. ", right-click for options, drag to move.",
		0.6, 0.6, 0.6, true)
	GameTooltip:Show()
end)
button:SetScript("OnLeave", function () GameTooltip:Hide() end)

local function refreshGlow()
	local unread = LC.index and LC.UnreadCount() or 0
	if unread > 0 and button:IsShown() then
		glow:Show()
		pulse:Show()
	else
		glow:Hide()
		pulse:Hide()
	end
end

local function update()
	if LC.GetOption("minimap") then
		button:Show()
		place()
	else
		button:Hide()
	end
	refreshGlow()
end

LC.On("LOGIN", update)
LC.On("OPTIONS", update)
LC.On("READY", refreshGlow)
LC.On("KNOWN", refreshGlow)
LC.On("READ", refreshGlow)
