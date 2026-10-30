-- Voiceover for the codex entries. A clip is audio/<entry>.mp3 for the opening and
-- audio/<entry>_<part>.mp3 for each part, so only what the character has earned is read.
--
-- 3.3.5 can't stop a sound played with PlaySoundFile, so the clips go through the music channel:
-- PlayMusic, then a short silent file to cut it off (music would loop otherwise), and the music
-- settings are put back afterwards. The voice goes on when the codex is closed or another entry is
-- opened; it stops when it ends, on Stop, when another entry is played, or on logout.

local LC = LoreCodex

local DIR = "Interface\\AddOns\\LoreCodex\\audio\\"
local SILENCE = DIR .. "silence.wav"

local audio = {}
LC.Audio = audio

local manifest = LoreCodexAudio or {}

-- What is playing: the clip names still to play, the one playing and when it ends, the entry.
local queue, entry, current, endsAt = nil, nil, nil, nil
local savedEnable, savedVolume

-- The clip for an entry's opening (no part) or one of its parts.
function audio.Clip(id, part)
	return part and (id .. "_" .. part) or tostring(id)
end

function audio.Has(clip)
	return manifest[clip] ~= nil
end

-- The entry being read aloud, and the clip of it that is playing now.
function audio.Entry()
	return entry
end

function audio.Current()
	return current
end

local frame = CreateFrame("Frame")

local function restoreMusic()
	if savedEnable == nil then return end
	SetCVar("Sound_EnableMusic", savedEnable)
	SetCVar("Sound_MusicVolume", savedVolume)
	savedEnable, savedVolume = nil, nil
end

local function finish()
	local was = entry
	queue, entry, current, endsAt = nil, nil, nil, nil
	frame:SetScript("OnUpdate", nil)
	PlayMusic(SILENCE)
	StopMusic()
	restoreMusic()
	if was then LC.Fire("AUDIO", was) end
end

local function playNext()
	local name = table.remove(queue, 1)
	if not name then finish() return end
	PlayMusic(DIR .. name .. ".mp3")
	current = name
	-- The music channel starts a clip over when it ends, so the timer must not run past the length in
	-- the manifest: any extra time replays the beginning of the clip.
	endsAt = GetTime() + manifest[name]
	LC.Fire("AUDIO", entry)
end

local function tick()
	if endsAt and GetTime() >= endsAt then playNext() end
end

frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function () if entry then finish() end end) -- the settings are saved on logout

function audio.Stop()
	if entry then finish() end
end

-- Reads the clips of an entry one after the other.
function audio.Play(id, clips)
	audio.Stop()
	if #clips == 0 then return end
	queue = {}
	for i, clip in ipairs(clips) do queue[i] = clip end
	-- The music channel only plays with music on and audible.
	savedEnable, savedVolume = GetCVar("Sound_EnableMusic"), GetCVar("Sound_MusicVolume")
	SetCVar("Sound_EnableMusic", 0) -- cuts the background music
	SetCVar("Sound_EnableMusic", 1)
	SetCVar("Sound_MusicVolume", 1) -- the voice is as loud as the music slider allows, whatever it was set to
	entry = id
	frame:SetScript("OnUpdate", tick)
	playNext()
end
