-- The discovery toast: a small banner near the top of the screen for each new entry, or for a
-- known entry that just grew. Click it to read the entry, right-click to dismiss. Several at once
-- queue up.

local LC = LoreCodex

local HOLD = 6
local FADE = 1

local queue = {}
local toast

local function build()
	toast = CreateFrame("Button", "LoreCodexToast", UIParent)
	toast:SetSize(340, 68)
	toast:SetPoint("TOP", UIParent, "TOP", 0, -190)
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
	toast.label:SetText("Lore Discovered")

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
		local id = self.entry
		self:Hide()
		if button == "LeftButton" and id then LC.Open(id) end
	end)
	toast:SetScript("OnHide", function ()
		if #queue > 0 then LC.After(0.3, function () LC.ShowToast(table.remove(queue, 1)) end) end
	end)
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
end

-- item = { id, kind, zone, title, updated }
function LC.ShowToast(item)
	if not toast then build() end
	if toast:IsShown() then
		table.insert(queue, item)
		return
	end
	toast.entry = item.id
	toast.label:SetText(item.updated and "Lore Updated" or "Lore Discovered")
	toast.icon:SetTexture(LC.KIND_ICON[item.kind] or LC.KIND_ICON[1])
	toast.title:SetText(item.title or "")
	local zone = LC.ZoneName(item.zone)
	local kind = LC.KIND_NAME[item.kind] or ""
	toast.sub:SetText(item.kind == LC.KIND.ZONE and "A new land" or (zone ~= "" and (kind .. " in " .. zone) or kind))
	toast.t = 0
	toast:SetAlpha(1)
	toast:Show()
	if LoreCodexDB.options.sound then PlaySound("WriteQuest") end
end

LC.On("DISCOVERED", function (id, kind, zone, title, updated)
	if LoreCodexDB.options.toast then
		LC.ShowToast({ id = id, kind = kind, zone = zone, title = title, updated = updated })
	else
		LC.Print((updated and "learned more about |cffffd200" or "discovered |cffffd200") .. (title or "") .. "|r.")
	end
end)
