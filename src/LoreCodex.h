/*
 * mod-lore-codex
 *
 * A codex of Azeroth's lore that fills in as a character travels: walking into a zone or a
 * place, talking to someone, killing someone or taking and finishing quests unlocks entries.
 * Places unlock the way the game's own exploration works: on foot or on your own mount, never
 * from a flight path or while dead. The LoreCodex addon shows a toast for each discovery and
 * the codex window; without the addon a discovery is a line in chat.
 *
 * Entries live in the world database (mod_lore_codex_entry, mod_lore_codex_part and
 * mod_lore_codex_trigger), so lore can be added or corrected with SQL and ".codex reload". An
 * entry's body is what a character first reads; its parts add to it, each unlocked by its own
 * triggers (the codex "updates") or shown only in some mod-individual-progression states.
 * Discoveries are kept per character in the characters database (mod_lore_codex_discovered and
 * mod_lore_codex_discovered_part).
 */

#ifndef MOD_LORE_CODEX_H
#define MOD_LORE_CODEX_H

#include "Define.h"
#include <string>
#include <string_view>
#include <vector>

class Player;

namespace LoreCodex
{
    // Addon message prefix; the client sends "LCX\t<command>" as a whisper to itself.
    constexpr char const* PREFIX = "LCX";

    // Bumped when a message changes shape. The addon refuses the server on a mismatch.
    constexpr uint32 PROTOCOL_VERSION = 4;

    // Leaves room for the prefix and tab inside the client's 255-byte chat message limit.
    constexpr std::size_t MAX_PAYLOAD = 240;

    enum Kind : uint8
    {
        KIND_ZONE   = 0,
        KIND_PLACE  = 1,
        KIND_PERSON = 2,
        KIND_STORY  = 3,
        KIND_MAX
    };

    // mod_lore_codex_trigger.Type: what unlocks an entry, and what Value means.
    enum TriggerType : uint8
    {
        TRIGGER_AREA         = 1, // AreaTable id: walking into the area or anywhere inside it
        TRIGGER_TALK         = 2, // creature entry: talking to it (gossip or quest dialog)
        TRIGGER_KILL         = 3, // creature entry: the kill credit for it
        TRIGGER_QUEST_ACCEPT = 4, // quest id: accepting it
        TRIGGER_QUEST_DONE   = 5, // quest id: turning it in
        TRIGGER_MAX
    };

    // mod_lore_codex_entry.Faction
    enum Faction : uint8
    {
        FACTION_ANY      = 0,
        FACTION_ALLIANCE = 1,
        FACTION_HORDE    = 2,
    };

    struct Config
    {
        bool enabled = true;
        bool backfill = true;         // credit what a character did before the codex knew it
        bool chatFallback = true;     // announce discoveries in chat when the addon isn't running
        bool progressionEnabled = false;
    };

    Config& GetConfig();
    void LoadConfig();

    // ---- LoreCodex.cpp: transport ----------------------------------------------------------------

    void Send(Player* player, std::string const& payload);

    // Sends "<header>:<row>;<row>;..." in as many messages as it takes, never splitting a row.
    void SendRows(Player* player, std::string const& header, std::vector<std::string> const& rows);

    void SendError(Player* player, std::string const& req, std::string_view what);

    bool ParseUInt(std::string_view text, uint32& out);

    // ',', ';', ':', '|', '%' and line breaks become %XX, and an empty string becomes "-".
    std::string Escape(std::string_view text);

    // mod-individual-progression's state (0-18), or 18 when it isn't running or for game masters.
    uint8 ProgressionState(Player* player);

    // Whether a quest is one of mod-individual-progression's hidden progress markers.
    bool IsProgressionQuest(uint32 questId);

    // Answers an addon message (everything after "LCX\t").
    void Dispatch(Player* player, std::string_view message);

    // ---- LoreCodexData.cpp: entries, triggers and discoveries ------------------------------------

    namespace Data
    {
        // Reads the entries and triggers. Safe to call again while players are online.
        void Load();

        // Changes whenever the entries do, so the addon knows when its cache is stale.
        uint32 Stamp();

        std::size_t EntryCount();

        void OnLogin(Player* player);
        void OnLogout(Player* player);

        // The game checked the player's area for exploration: they moved, on foot or their own
        // mount, alive and not on a flight path.
        void OnExplore(Player* player);

        void OnTrigger(Player* player, TriggerType type, uint32 value);

        // Credits entries whose triggers the character already met: areas it explored, quests
        // it has taken or turned in. Silent; returns how many were added.
        uint32 Backfill(Player* player);

        // mod-individual-progression moved the character on: credit what it now allows and let the
        // addon fetch the texts again.
        void OnProgression(Player* player);

        // Game master tools. Discover(entry) gives the entry and all its parts; part 0 is the entry.
        bool Discover(Player* player, uint32 entryId);
        bool DiscoverPart(Player* player, uint32 entryId, uint8 part);
        uint32 DiscoverAll(Player* player);
        void Forget(Player* player);
        uint32 KnownCount(Player* player);

        // The addon said hello: discoveries go to it from now on instead of to chat. Returns
        // how many entries the last backfill added, once.
        uint32 AddonReady(Player* player);
        bool HasAddon(Player* player);

        void HandleIndex(Player* player, std::string const& req);
        void HandleKnown(Player* player, std::string const& req);
        void HandleText(Player* player, std::string const& req, std::vector<std::string_view> const& args);
    }
}

#endif
