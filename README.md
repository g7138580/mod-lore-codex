# mod-lore-codex

An AzerothCore (WotLK 3.3.5a) module that adds a codex of Azeroth's lore which fills in as you play. Walking into a zone or a notable place, talking to someone, defeating someone, or taking and finishing quests unlocks entries. The included `LoreCodex` addon shows a toast for each discovery and a codex window to read them.

> **Work in progress.** The Eastern Kingdoms, Kalimdor and Outland are covered (62 zones, about 1,900 entries). Northrend is still to come.

## Features

- **Zones, places, people and stories.** Each zone has an overview entry, its notable places, the people who matter there and the storylines that run through it.
- **Discovery like exploration.** Places unlock the way the game's own exploration does: on foot or on your own mount, never from a flight path or while dead.
- **Locked entries.** Undiscovered entries show as locked placeholders with a hint, and each zone shows how much of it you have found.
- **Only what you can reach.** Each character sees the entries it can actually unlock: the other faction's, other races' and classes' quests, and the death knight starting zone are left out.
- **Past travels count.** At login, entries for areas a character already explored and quests it already did are credited quietly.
- **Lore in the database.** Entries and their triggers live in the world database and reload with `.codex reload`.

## Compatibility

Not compatible with mod-individual-progression. The lore follows the 3.3.5 timeline, so it doesn't match the earlier eras that module takes characters through.

## Installation

1. Place this folder in `azerothcore-wotlk/modules/`.
2. Re-run CMake and rebuild the server.
3. Copy `conf/mod_lore_codex.conf.dist` to `mod_lore_codex.conf` in your server's `configs/modules` folder.
4. Start the worldserver. The tables are created automatically when `Updates.EnableDatabases` is enabled.
5. Copy `client_addon/LoreCodex` into your client's `Interface/AddOns` folder.

## Usage

Open the codex with the minimap button, the Lore button on the world map, **Shift-L** (claimed only if the key is free) or `/codex`. Click a discovery banner to jump to its entry. The minimap button glows while new entries wait to be read, and its tooltip shows how much of your zone and continent you have found.

Everything can be changed under **Interface > AddOns > Lore Codex** (also from the codex's Options button or by right-clicking the minimap button): the banner, its sound, both buttons and the key.

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
| `.codex discover <entry\|all>` | GM: discovers an entry, or all of them |
| `.codex reset` | GM: clears the selected player's discoveries |
| `.codex reload` | Admin: reloads entries and triggers |

## Adding lore

`mod_lore_codex_entry` holds the entries: `Kind` is 0 zone, 1 place, 2 person, 3 story, and `Zone` is the AreaTable zone it is filed under. `mod_lore_codex_trigger` says what unlocks each one:

| Type | Value |
|---|---|
| 1 | AreaTable id: entering the area or anything inside it |
| 2 | Creature entry: talking to it |
| 3 | Creature entry: defeating it |
| 4 | Quest id: accepting it |
| 5 | Quest id: turning it in |

## Sources

The lore is written from the game's own 3.3.5 text (quest descriptions, NPC dialogue and in-game books in the AzerothCore world database) and the [Warcraft Wiki](https://warcraft.wiki.gg) for wider history, using only material from before Cataclysm. Entries are original writing, not copied text; each one lists the quests, NPCs and wiki pages behind it in `data/lore/*.json`.
