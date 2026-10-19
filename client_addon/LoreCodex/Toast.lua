-- The discovery toasts: small banners near the top of the screen for each new entry, or for a known
-- entry that just grew. Up to three show at once, stacked; anything beyond that waits, and when a
-- banner frees up several waiting discoveries are folded into one ("5 more entries discovered").
-- Click a banner to read the entry (the summary opens Recent discoveries), right-click to dismiss.
-- The banners can be moved: the options page unlocks a placeholder to drag.

local LC = LoreCodex

local HOLD = 6
local FADE = 1
local SLOTS = 3
local W, H, GAP = 340, 68, 6

local waiting = {}
local toasts = {}

-- Where the first banner sits; the others stack below it.
local anchor = CreateFrame("Frame", "LoreCodexToastAnchor", UIParent)
anchor:SetSize(W, H)
anchor:SetFrameStrata("HIGH")
anchor:SetMovable(true)
anchor:SetClampedToScreen(true)
anchor:RegisterForDrag("LeftButton")
anchor:SetBackdrop({
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 16, edgeSize = 14,
	insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
anchor:SetBackdropColor(0.1, 0.3, 0.1, 0.7)
anchor:SetBackdropBorderColor(0.4, 1, 0.4, 1)
anchor:Hide()
local anchorText = anchor:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
anchorText:SetPoint("CENTER")
anchorText:SetText("Lore Codex banners\nDrag to move")

local function placeAnchor()
	anchor:ClearAllPoints()
	local p = LoreCodexDB.toastPos
	if p then
		anchor:SetPoint(p.point, UIParent, p.point, p.x, p.y)
	else
		anchor:SetPoint("TOP", UIParent, "TOP", 0, -190)
	end
end

anchor:SetScript("OnDragStart", anchor.StartMoving)
anchor:SetScript("OnDragStop", function (self)
	self:StopMovingOrSizing()
	local point, _, _, x, y = self:GetPoint(1)
	LoreCodexDB.toastPos = { point = point, x = x, y = y }
	placeAnchor()
end)

local function slotPoint(i)
	return -(i - 1) * (H + GAP)
end

local function build(i)
	local toast = CreateFrame("Button", "LoreCodexToast" .. i, UIParent)
	toast:SetSize(W, H)
	toast:SetPoint("TOP", anchor, "TOP", 0, slotPoint(i))
	toast:SetFrameStrata("HIGH")
	toast:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 32, edgeSize = 14,
		insets = { left = 4, right = 4, top = 4, bottom = 4 },
	})
	toast:SetBackdropBorderColor(0.85, 0.7, 0.35, 1)
	toast:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	toast:Hide()

	toast.icon = toast:CreateTexture(nil, "ARTWORK")
	toast.icon:SetSize(40, 40)
	toast.icon:SetPoint("LEFT", toast, "LEFT", 12, 0)

	toast.label = toast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	toast.label:SetPoint("TOPLEFT", toast.icon, "TOPRIGHT", 10, 0)

	toast.title = toast:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
	toast.title:SetPoint("TOPLEFT", toast.label, "BOTTOMLEFT", 0, -2)
	toast.title:SetPoint("RIGHT", toast, "RIGHT", -10, 0)
	toast.title:SetJustifyH("LEFT")

	toast.sub = toast:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
	toast.sub:SetPoint("TOPLEFT", toast.title, "BOTTOMLEFT", 0, -2)
	toast.sub:SetPoint("RIGHT", toast, "RIGHT", -10, 0)
	toast.sub:SetJustifyH("LEFT")

	local hl = toast:CreateTexture(nil, "HIGHLIGHT")
	hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
	hl:SetBlendMode("ADD")
	hl:SetVertexColor(1, 0.82, 0, 0.25)
	hl:SetPoint("TOPLEFT", toast, "TOPLEFT", 4, -4)
	hl:SetPoint("BOTTOMRIGHT", toast, "BOTTOMRIGHT", -4, 4)

	toast:SetScript("OnClick", function (self, button)
		local id, summary = self.entry, self.summary
		self:Hide()
		if button == "LeftButton" then
			if summary then LC.OpenRecent() elseif id then LC.Open(id) end
		end
	end)
	toast:SetScript("OnHide", function () LC.After(0.3, LC.NextToast) end)
	toast:SetScript("OnUpdate", function (self, elapsed)
		if self:IsMouseOver() then
			self.t = 0
			self:SetAlpha(1)
			return
		end
		self.t = self.t + elapsed
		if self.t >= HOLD + FADE then
			self:Hide()
		elseif self.t > HOLD then
			self:SetAlpha(1 - (self.t - HOLD) / FADE)
		end
	end)
	return toast
end

local function freeSlot()
	for i = 1, SLOTS do
		toasts[i] = toasts[i] or build(i)
		if not toasts[i]:IsShown() then return toasts[i] end
	end
end

local function show(toast, item)
	toast.entry = item.id
	toast.summary = item.summary
	if item.summary then
		toast.label:SetText("Lore Discovered")
		toast.icon:SetTexture(LC.KIND_ICON[3])
		toast.title:SetText(item.summary .. " more entries")
		toast.sub:SetText("Click to see your recent discoveries")
	else
		toast.label:SetText(item.updated and "Lore Updated" or "Lore Discovered")
		toast.icon:SetTexture(LC.KIND_ICON[item.kind] or LC.KIND_ICON[1])
		toast.title:SetText(item.title or "")
		local zone = LC.ZoneName(item.zone)
		local kind = LC.KIND_NAME[item.kind] or ""
		toast.sub:SetText(item.kind == LC.KIND.ZONE and "A new land" or (zone ~= "" and (kind .. " in " .. zone) or kind))
	end
	toast.t = 0
	toast:SetAlpha(1)
	toast:Show()
end

-- Shows what is waiting while there is room: one discovery as itself, several as a summary.
function LC.NextToast()
	while #waiting > 0 do
		local toast = freeSlot()
		if not toast then return end
		if #waiting == 1 then
			show(toast, table.remove(waiting, 1))
		else
			show(toast, { summary = #waiting })
			waiting = {}
		end
	end
end

-- item = { id, kind, zone, title, updated }
function LC.ShowToast(item)
	local toast = freeSlot()
	if toast and #waiting == 0 then
		show(toast, item)
	else
		table.insert(waiting, item)
		LC.NextToast()
	end
	if LoreCodexDB.options.sound then PlaySound("WriteQuest") end
end

LC.On("DISCOVERED", function (id, kind, zone, title, updated)
	if LoreCodexDB.options.toast then
		LC.ShowToast({ id = id, kind = kind, zone = zone, title = title, updated = updated })
	else
		LC.Print((updated and "learned more about |cffffd200" or "discovered |cffffd200") .. (title or "") .. "|r.")
	end
end)

local function update()
	placeAnchor()
	if LC.GetOption("moveToast") then anchor:Show() anchor:EnableMouse(true) else anchor:Hide() end
end

LC.On("LOGIN", update)
LC.On("OPTIONS", update)
LC.On("RESET_POSITION", function ()
	LoreCodexDB.toastPos = nil
	placeAnchor()
end)
