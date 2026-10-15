-- A Lore button in the corner of the world map: shown on zones the codex covers, it opens the
-- codex at the zone being looked at.

local LC = LoreCodex

local button = CreateFrame("Button", "LoreCodexMapButton", WorldMapFrame)
button:SetSize(30, 30)
button:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPRIGHT", -6, -6)
button:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 10)
button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
button:Hide()

local icon = button:CreateTexture(nil, "ARTWORK")
icon:SetTexture("Interface\\Icons\\INV_Misc_Map_01")
icon:SetAllPoints(button)
icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

local frameBorder = button:CreateTexture(nil, "OVERLAY")
frameBorder:SetTexture("Interface\\Buttons\\UI-Quickslot2")
frameBorder:SetSize(52, 52)
frameBorder:SetPoint("CENTER", button, "CENTER")

local counts = button:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
counts:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -1, 2)

-- The codex zone the map is showing, if the codex covers it.
local function shownZone()
	local zoneIndex = GetCurrentMapZone()
	if not zoneIndex or zoneIndex == 0 then return nil end
	local names = { GetMapZones(GetCurrentMapContinent()) }
	return LC.ZoneByName(names[zoneIndex])
end

local function update()
	local zone = LC.GetOption("mapButton") and WorldMapFrame:IsShown() and shownZone()
	button.zone = zone
	if not zone then
		button:Hide()
		return
	end
	local known, total = LC.Progress(zone)
	counts:SetText(known .. "/" .. total)
	button:Show()
end

button:SetScript("OnClick", function (self)
	local zone = self.zone
	-- The codex sits below a full-screen map.
	HideUIPanel(WorldMapFrame)
	LC.OpenZone(zone)
end)

button:SetScript("OnEnter", function (self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetText("Lore Codex")
	if self.zone then
		local known, total = LC.Progress(self.zone)
		GameTooltip:AddDoubleLine(LC.ZoneName(self.zone), known .. "/" .. total, 1, 0.82, 0, 1, 1, 1)
	end
	GameTooltip:AddLine("Click to read about this land.", 0.6, 0.6, 0.6)
	GameTooltip:Show()
end)
button:SetScript("OnLeave", function () GameTooltip:Hide() end)

local events = CreateFrame("Frame")
events:RegisterEvent("WORLD_MAP_UPDATE")
events:SetScript("OnEvent", update)
WorldMapFrame:HookScript("OnShow", update)

LC.On("OPTIONS", update)
LC.On("KNOWN", update)
LC.On("READY", update)
