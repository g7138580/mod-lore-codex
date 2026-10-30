# mod-lore-codex

An AzerothCore (WotLK 3.3.5a) module that adds a codex of Azeroth's lore which fills in as you play. Walking into a zone or a notable place, talking to someone, defeating someone, or taking and finishing quests unlocks entries. The included `LoreCodex` addon shows a toast for each discovery and a codex window to read them.

Covers all four continents, the Eastern Kingdoms, Kalimdor, Outland and Northrend, and every dungeon and raid: 970 entries.

## Features

- **Four ways in.** Locations (zones, their notable places, dungeons and raids, folded by continent), People, Peoples and Factions, and History, from the titans to the Lich King. Entries give the context the game does not show rather than retelling its quests.
- **Discovery like exploration.** Places unlock the way the game's own exploration does: on foot or on your own mount, never from a flight path or while dead.
- **No spoilers.** An entry tells only what you have earned. It opens with the situation as you find it, and later parts are added as you get there, usually when you finish the quest that reveals them or defeat a foe. A banner says the entry was updated, and an entry that can still grow says so.
- **Locked entries.** Undiscovered entries show as locked placeholders with a hint, and each zone shows how much of it you have found.
- **Finding your way.** Search what you have discovered, see your recent discoveries and everything still unread, fold continents away and hide locked entries. When an entry you have read grows, the new part is marked.
- **Only what you can reach.** Each character sees the entries it can actually unlock: the other faction's, other races' and classes' quests, and the death knight starting zone are left out.
- **Past travels count.** At login, entries for areas a character already explored and quests it already did are credited quietly.
- **Group kills count.** Defeating a foe credits everyone in the group who was close enough to share the kill, not only the one who tagged it.
- **Voiceover (optional).** Every entry and every part can be read aloud. The codex window has a **Play all** button and a speaker button beside each section, so a part you have just earned can be played on its own. It keeps playing when the window is closed. The audio is a separate download, and without it the buttons simply don't appear.
- **Lore in the database.** Entries, their parts and their triggers live in the world database and reload with `.codex reload`.

## Compatibility

Works with or without [mod-individual-progression](https://github.com/ZhengPeiRu21/mod-individual-progression). When that module is running, the codex follows each character's progression: lore from a later era (the Burning Crusade, the Isle of Quel'Danas, Wrath of the Lich King, and later in Wrath the Argent Tournament and the Frozen Halls) stays hidden until the character reaches it, events tied to one stage (the Ahn'Qiraj war, the Scourge invasion) show only during that stage, and lines that stop being true drop away. When a character moves on to a new stage, entries and parts it has already earned the triggers for are added quietly. Without the module, every character counts as having reached the end, so all eras show.

Every zone follows the module's own gating where it has one. Where the module changes the world the same way in every stage (renaming an NPC, removing a spawn), the text is written to be true either way. Its phased areas are not matched exactly in every case, so a few lines may describe something a character at an early stage can already see, or not yet see.

The server module and the addon must be the same version: after updating one, update the other.

## Installation

1. Place this folder in `azerothcore-wotlk/modules/`.
2. Re-run CMake and rebuild the server.
3. Copy `conf/mod_lore_codex.conf.dist` to `mod_lore_codex.conf` in your server's `configs/modules` folder.
4. Start the worldserver. The tables are created automatically when `Updates.EnableDatabases` is enabled.
5. Copy `client_addon/LoreCodex` into your client's `Interface/AddOns` folder.
6. Optional, for the voiceover: see [Voiceover audio](#voiceover-audio).

### Voiceover audio

The voiceover is AI-generated speech, one clip per entry and per part. It is not stored in this repository because of its size (about 300 MB), so download it separately:

1. Download the zip file frome [here](https://drive.google.com/file/d/1GcnrnIdrrw06QH-dHX75W13cGPPhGcVE/view?usp=sharing).
2. Extract the contents of the zip into the addon's `audio` folder (`LoreCodex/audio`, which comes with the addon and starts out empty). The zip holds only the audio files (and `silence.wav`, which the addon uses to stop a clip), with no folder of its own, so the files should end up directly in `Interface/AddOns/LoreCodex/audio`, not in a subfolder.
3. Log in, or type `/reload` if you are already in the game.

Entries that have a clip now show a **Play all** button, and each section a speaker button. Clips play on the game's music channel, so the addon briefly turns music off while the voiceover is playing and back on afterwards. If you don't see the buttons, check that the audio files are not inside an extra folder and that `silence.wav` is among them.

## Usage

Open the codex with the minimap button, the Lore button on the world map, **Shift-L** (claimed only if the key is free) or `/codex`. Click a discovery banner to jump to its entry; up to three show at once, and a larger burst is folded into one. The minimap button glows while new entries wait to be read, and its tooltip shows how much of your zone and continent you have found.

Everything can be changed under **Interface > AddOns > Lore Codex** (also from the codex's Options button or by right-clicking the minimap button): the banners, their sound and position, the text size, both buttons and the key.

| Command | Does |
|---|---|
| `/codex options` | Opens the settings |
| `/codex toast` | Turns discovery banners on or off |
| `/codex sound` | Turns the discovery sound on or off |
| `/codex minimap` | Shows or hides the minimap button |
| `/codex map` | Shows or hides the world map button |
| `/codex reset` | Moves the window back to the middle |
| `/codex refresh` | Fetches the codex data again |
| `.codex` | GM: entry count and what the selected player knows |
| `.codex discover <entry\|all>` | GM: discovers an entry and its parts, or everything |
| `.codex discover <entry> <part>` | GM: discovers one part of an entry |
| `.codex reset` | GM: clears the selected player's discoveries |
| `.codex reload` | Admin: reloads entries and triggers |

## Adding lore

`mod_lore_codex_entry` holds the entries: `Kind` is 0 zone, 1 place, 2 person, 4 people or faction, 5 history, and `Zone` is the AreaTable zone it is filed under (0 for entries with no home zone, where a history entry's `SortOrder` is its place in time). `Hint` is shown while an entry is locked, and `mod_lore_codex_related` links entries once both are known. `mod_lore_codex_trigger` says what unlocks each one:

| Type | Value |
|---|---|
| 1 | AreaTable id: entering the area or anything inside it |
| 2 | Creature entry: talking to it |
| 3 | Creature entry: defeating it |
| 4 | Quest id: accepting it |
| 5 | Quest id: turning it in |

A trigger's `Part` says what it unlocks: 0 the entry, or a part from `mod_lore_codex_part`, whose text is added after the entry's own (earning a part also unlocks the entry). A part without triggers always shows with its entry. `MinState` and `MaxState` limit a part to some mod-individual-progression states, and an entry's `RequiredState` keeps the whole entry hidden until a character reaches that state. An entry with `RequiredState` should have at least one area or quest trigger, because those are the triggers credited again when a character's state rises.

## Sources

The lore is written from the game's own 3.3.5 text (quest descriptions, NPC dialogue and in-game books in the AzerothCore world database) and the [Warcraft Wiki](https://warcraft.wiki.gg) for wider history, using only material from before Cataclysm. Entries are original writing, not copied text; each one lists the quests, NPCs and wiki pages behind it in `data/lore/*.json`.
