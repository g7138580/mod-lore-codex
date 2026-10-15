/*
 * mod-lore-codex: the entries, what unlocks them and what each character has discovered.
 *
 * The entries are read into an immutable snapshot that ".codex reload" swaps for a new one, so
 * map threads (exploration, kills, quests) can read it while the world thread reloads. Each
 * online character's discoveries are kept in memory beside the area it was last seen exploring;
 * new discoveries are written to the characters database as they happen.
 *
 * Index rows (ID): Z,<zone>,<map>,<zone name> once per zone with entries, then
 * E,<entry>,<kind>,<zone>,<sort>,<faction> per entry. Titles and texts are only sent for
 * entries the character knows (T), so the codex can't be read ahead.
 *
 * Known rows (KD): K,<entry> for each entry the character knows, H,<entry> for each entry it can
 * never unlock: the other faction's, and those whose every trigger is out of its reach (a quest
 * its race or class can't take, someone it can't talk to or can't attack). The addon hides those.
 */

#include "LoreCodex.h"
#include "Chat.h"
#include "DBCStores.h"
#include "DatabaseEnv.h"
#include "GameTime.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "QueryResult.h"
#include "QuestDef.h"
#include "World.h"
#include <map>
#include <memory>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

namespace LoreCodex::Data
{
    namespace
    {
        struct Entry
        {
            uint32 id = 0;
            uint8 kind = KIND_PLACE;
            uint32 zone = 0;
            uint16 sort = 0;
            uint8 faction = FACTION_ANY;
            uint8 requiredState = 0;
            std::string title;
            std::string body;
        };

        using TriggerKey = std::pair<uint8, uint32>; // type, value

        // Who can meet a trigger: quests carry their race and class limits, creatures their
        // faction template; areas are open to everyone.
        struct Need
        {
            uint8 type = TRIGGER_AREA;
            uint32 races = 0;           // quest AllowableRaces, 0 = any
            uint32 classes = 0;         // quest AllowableClasses, 0 = any
            uint32 creatureFaction = 0; // TALK and KILL targets
            bool deathKnightsOnly = false; // an area on the Ebon Hold's map, where only death knights go
        };

        struct Content
        {
            std::map<uint32, Entry> entries;
            std::map<TriggerKey, std::vector<uint32>> byTrigger;
            std::map<uint32, std::vector<TriggerKey>> triggersOf;
            std::map<uint32, std::vector<Need>> needsOf;
            // An area trigger and every area inside it, for crediting explored areas.
            std::unordered_map<uint32, std::vector<uint32>> areaCovers;
            uint32 stamp = 0;
        };

        std::shared_ptr<Content const> sContent = std::make_shared<Content>();
        std::mutex sContentLock;

        std::shared_ptr<Content const> Snapshot()
        {
            std::lock_guard<std::mutex> guard(sContentLock);
            return sContent;
        }

        struct PlayerState
        {
            uint32 lastArea = 0;
            bool addon = false;
            uint32 backfilled = 0;
            std::unordered_set<uint32> known;
        };

        std::unordered_map<ObjectGuid::LowType, PlayerState> sPlayers;
        std::mutex sPlayersLock;

        char const* const KIND_NAMES[KIND_MAX] = { "Zone", "Place", "Person", "Story" };

        // Areas nest at most a couple of levels below their zone.
        constexpr uint32 MAX_AREA_DEPTH = 4;

        uint32 Fnv(uint32 h, uint32 v)
        {
            for (int i = 0; i < 4; ++i)
            {
                h ^= (v >> (i * 8)) & 0xFF;
                h *= 16777619u;
            }
            return h;
        }

        uint32 Fnv(uint32 h, std::string const& s)
        {
            for (unsigned char c : s)
            {
                h ^= c;
                h *= 16777619u;
            }
            return Fnv(h, uint32(s.size()));
        }

        bool FactionAllows(Player* player, Entry const& e)
        {
            if (e.faction == FACTION_ALLIANCE)
                return player->GetTeamId() == TEAM_ALLIANCE;
            if (e.faction == FACTION_HORDE)
                return player->GetTeamId() == TEAM_HORDE;
            return true;
        }

        bool Explored(Player* player, uint32 areaId)
        {
            AreaTableEntry const* area = sAreaTableStore.LookupEntry(areaId);
            if (!area)
                return false;
            uint32 offset = area->exploreFlag / 32;
            if (offset >= PLAYER_EXPLORED_ZONES_SIZE)
                return false;
            return (player->GetUInt32Value(PLAYER_EXPLORED_ZONES_1 + offset) & (1u << (area->exploreFlag % 32))) != 0;
        }

        // Whether the character could ever unlock the entry: its faction allows it and at least
        // one trigger is within its reach.
        bool Eligible(Player* player, Content const& content, Entry const& e)
        {
            if (!FactionAllows(player, e))
                return false;
            // The Scarlet Enclave is on the Ebon Hold's own map: only death knights ever go there.
            if (AreaTableEntry const* zone = sAreaTableStore.LookupEntry(e.zone))
                if (zone->mapid == MAP_EBON_HOLD && player->getClass() != CLASS_DEATH_KNIGHT)
                    return false;
            auto needs = content.needsOf.find(e.id);
            if (needs == content.needsOf.end())
                return false;
            FactionTemplateEntry const* mine = sFactionTemplateStore.LookupEntry(player->GetFaction());
            for (Need const& need : needs->second)
            {
                switch (need.type)
                {
                    case TRIGGER_AREA:
                        if (!need.deathKnightsOnly || player->getClass() == CLASS_DEATH_KNIGHT)
                            return true;
                        break;
                    case TRIGGER_QUEST_ACCEPT:
                    case TRIGGER_QUEST_DONE:
                        if ((!need.races || (need.races & player->getRaceMask()))
                            && (!need.classes || (need.classes & player->getClassMask())))
                            return true;
                        break;
                    case TRIGGER_TALK:
                    case TRIGGER_KILL:
                    {
                        FactionTemplateEntry const* theirs = sFactionTemplateStore.LookupEntry(need.creatureFaction);
                        if (!theirs || !mine)
                            return true;
                        // Nobody talks to someone who attacks them, or attacks a friend.
                        if (need.type == TRIGGER_TALK ? !theirs->IsHostileTo(*mine) : !theirs->IsFriendlyTo(*mine))
                            return true;
                        break;
                    }
                    default:
                        break;
                }
            }
            return false;
        }

        void Announce(Player* player, Entry const& e, bool addon)
        {
            if (addon)
            {
                Send(player, "NEW:0:" + std::to_string(e.id) + ":" + std::to_string(e.kind) + ":" + std::to_string(e.zone)
                    + ":" + Escape(e.title));
                return;
            }
            if (GetConfig().chatFallback)
                ChatHandler(player->GetSession()).PSendSysMessage("|cffe6cc80Lore discovered:|r {} ({})", e.title,
                    KIND_NAMES[e.kind]);
        }

        // Records the entry for the player; false when it doesn't apply or is already known.
        bool TryDiscover(Player* player, Content const& content, uint32 id, bool announce, bool force)
        {
            auto itr = content.entries.find(id);
            if (itr == content.entries.end())
                return false;
            Entry const& e = itr->second;
            if (!force)
            {
                if (!FactionAllows(player, e))
                    return false;
                if (e.requiredState && ProgressionState(player) < e.requiredState)
                    return false;
            }

            ObjectGuid::LowType guid = player->GetGUID().GetCounter();
            bool addon = false;
            {
                std::lock_guard<std::mutex> guard(sPlayersLock);
                auto st = sPlayers.find(guid);
                if (st == sPlayers.end() || !st->second.known.insert(id).second)
                    return false;
                addon = st->second.addon;
            }

            uint32 when = announce ? uint32(GameTime::GetGameTime().count()) : 0;
            CharacterDatabase.Execute("INSERT IGNORE INTO mod_lore_codex_discovered (guid, entry, time) VALUES ({}, {}, {})",
                guid, id, when);
            if (announce)
                Announce(player, e, addon);
            return true;
        }

        void Fire(Player* player, Content const& content, TriggerType type, uint32 value)
        {
            auto itr = content.byTrigger.find({ uint8(type), value });
            if (itr == content.byTrigger.end())
                return;
            for (uint32 id : itr->second)
                TryDiscover(player, content, id, true, false);
        }
    }

    void Load()
    {
        auto content = std::make_shared<Content>();

        if (QueryResult result = WorldDatabase.Query("SELECT ID, Kind, Zone, SortOrder, Faction, RequiredState, Title, Body "
            "FROM mod_lore_codex_entry"))
        {
            do
            {
                Field* f = result->Fetch();
                Entry e;
                e.id = f[0].Get<uint32>();
                e.kind = f[1].Get<uint8>();
                e.zone = f[2].Get<uint32>();
                e.sort = f[3].Get<uint16>();
                e.faction = f[4].Get<uint8>();
                e.requiredState = f[5].Get<uint8>();
                e.title = f[6].Get<std::string>();
                e.body = f[7].Get<std::string>();
                if (e.kind >= KIND_MAX || e.faction > FACTION_HORDE)
                {
                    LOG_ERROR("module", "LoreCodex: entry {} has an unknown kind or faction, skipped.", e.id);
                    continue;
                }
                content->entries.emplace(e.id, std::move(e));
            } while (result->NextRow());
        }

        uint32 triggers = 0;
        std::unordered_set<uint32> areaTriggers;
        if (QueryResult result = WorldDatabase.Query("SELECT Entry, Type, Value FROM mod_lore_codex_trigger"))
        {
            do
            {
                Field* f = result->Fetch();
                uint32 entry = f[0].Get<uint32>();
                uint8 type = f[1].Get<uint8>();
                uint32 value = f[2].Get<uint32>();

                bool valid = content->entries.count(entry) != 0;
                Need need;
                need.type = type;
                switch (type)
                {
                    case TRIGGER_AREA:
                        if (AreaTableEntry const* area = sAreaTableStore.LookupEntry(value))
                            need.deathKnightsOnly = area->mapid == MAP_EBON_HOLD;
                        else
                            valid = false;
                        break;
                    case TRIGGER_TALK:
                    case TRIGGER_KILL:
                        if (CreatureTemplate const* creature = sObjectMgr->GetCreatureTemplate(value))
                            need.creatureFaction = creature->faction;
                        else
                            valid = false;
                        break;
                    case TRIGGER_QUEST_ACCEPT:
                    case TRIGGER_QUEST_DONE:
                        if (Quest const* quest = sObjectMgr->GetQuestTemplate(value))
                        {
                            need.races = quest->GetAllowableRaces();
                            need.classes = quest->GetRequiredClasses();
                        }
                        else
                            valid = false;
                        break;
                    default:
                        valid = false;
                        break;
                }
                if (!valid)
                {
                    LOG_ERROR("module", "LoreCodex: trigger (entry {}, type {}, value {}) points at nothing, skipped.", entry, type, value);
                    continue;
                }

                content->byTrigger[{ type, value }].push_back(entry);
                content->triggersOf[entry].push_back({ type, value });
                content->needsOf[entry].push_back(need);
                if (type == TRIGGER_AREA)
                    areaTriggers.insert(value);
                ++triggers;
            } while (result->NextRow());
        }

        for (auto const& [id, e] : content->entries)
            if (!content->triggersOf.count(id))
                LOG_WARN("module", "LoreCodex: entry {} ({}) has no triggers; only .codex discover can unlock it.", id, e.title);

        for (uint32 i = 0; i < sAreaTableStore.GetNumRows(); ++i)
        {
            AreaTableEntry const* area = sAreaTableStore.LookupEntry(i);
            if (!area)
                continue;
            uint32 id = area->ID;
            for (uint32 depth = 0; id && depth < MAX_AREA_DEPTH; ++depth)
            {
                if (areaTriggers.count(id))
                    content->areaCovers[id].push_back(area->ID);
                AreaTableEntry const* parent = sAreaTableStore.LookupEntry(id);
                id = parent ? parent->zone : 0;
            }
        }

        uint32 h = 2166136261u;
        for (auto const& [id, e] : content->entries)
            h = Fnv(Fnv(Fnv(Fnv(Fnv(Fnv(Fnv(h, id), e.kind), e.zone), e.sort), e.faction), e.title), e.body);
        content->stamp = h;

        LOG_INFO("module", ">> LoreCodex: loaded {} entries and {} triggers.", content->entries.size(), triggers);

        std::lock_guard<std::mutex> guard(sContentLock);
        sContent = std::move(content);
    }

    uint32 Stamp()
    {
        return Snapshot()->stamp;
    }

    std::size_t EntryCount()
    {
        return Snapshot()->entries.size();
    }

    void OnLogin(Player* player)
    {
        PlayerState state;
        if (QueryResult result = CharacterDatabase.Query("SELECT entry FROM mod_lore_codex_discovered WHERE guid = {}",
            player->GetGUID().GetCounter()))
        {
            do
                state.known.insert(result->Fetch()[0].Get<uint32>());
            while (result->NextRow());
        }

        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            sPlayers[player->GetGUID().GetCounter()] = std::move(state);
        }
        Backfill(player);
    }

    void OnLogout(Player* player)
    {
        std::lock_guard<std::mutex> guard(sPlayersLock);
        sPlayers.erase(player->GetGUID().GetCounter());
    }

    void OnExplore(Player* player)
    {
        uint32 area = player->GetAreaId();
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            if (st == sPlayers.end() || st->second.lastArea == area)
                return;
            st->second.lastArea = area;
        }

        // The area itself and every area it lies in, up to the zone.
        std::shared_ptr<Content const> content = Snapshot();
        for (uint32 depth = 0; area && depth < MAX_AREA_DEPTH; ++depth)
        {
            Fire(player, *content, TRIGGER_AREA, area);
            AreaTableEntry const* entry = sAreaTableStore.LookupEntry(area);
            area = entry ? entry->zone : 0;
        }
    }

    void OnTrigger(Player* player, TriggerType type, uint32 value)
    {
        Fire(player, *Snapshot(), type, value);
    }

    uint32 Backfill(Player* player)
    {
        if (!GetConfig().backfill)
            return 0;

        std::shared_ptr<Content const> content = Snapshot();
        uint32 added = 0;
        for (auto const& [id, triggers] : content->triggersOf)
        {
            bool met = false;
            for (auto const& [type, value] : triggers)
            {
                if (type == TRIGGER_AREA)
                {
                    auto covers = content->areaCovers.find(value);
                    if (covers != content->areaCovers.end())
                        for (uint32 area : covers->second)
                            if (Explored(player, area))
                            {
                                met = true;
                                break;
                            }
                }
                else if (type == TRIGGER_QUEST_ACCEPT)
                    met = player->GetQuestStatus(value) != QUEST_STATUS_NONE || player->GetQuestRewardStatus(value);
                else if (type == TRIGGER_QUEST_DONE)
                    met = player->GetQuestRewardStatus(value);
                if (met)
                    break;
            }
            if (met && TryDiscover(player, *content, id, false, false))
                ++added;
        }

        if (added)
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            if (st != sPlayers.end())
                st->second.backfilled += added;
        }
        return added;
    }

    bool Discover(Player* player, uint32 entryId)
    {
        return TryDiscover(player, *Snapshot(), entryId, true, true);
    }

    uint32 DiscoverAll(Player* player)
    {
        std::shared_ptr<Content const> content = Snapshot();
        uint32 added = 0;
        for (auto const& [id, e] : content->entries)
            if (TryDiscover(player, *content, id, false, true))
                ++added;
        if (HasAddon(player))
            Send(player, "RESET:0");
        return added;
    }

    void Forget(Player* player)
    {
        ObjectGuid::LowType guid = player->GetGUID().GetCounter();
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(guid);
            if (st != sPlayers.end())
            {
                st->second.known.clear();
                st->second.lastArea = 0;
            }
        }
        CharacterDatabase.Execute("DELETE FROM mod_lore_codex_discovered WHERE guid = {}", guid);
        if (HasAddon(player))
            Send(player, "RESET:0");
    }

    uint32 KnownCount(Player* player)
    {
        std::lock_guard<std::mutex> guard(sPlayersLock);
        auto st = sPlayers.find(player->GetGUID().GetCounter());
        return st != sPlayers.end() ? uint32(st->second.known.size()) : 0;
    }

    uint32 AddonReady(Player* player)
    {
        std::lock_guard<std::mutex> guard(sPlayersLock);
        auto st = sPlayers.find(player->GetGUID().GetCounter());
        if (st == sPlayers.end())
            return 0;
        st->second.addon = true;
        uint32 backfilled = st->second.backfilled;
        st->second.backfilled = 0;
        return backfilled;
    }

    bool HasAddon(Player* player)
    {
        std::lock_guard<std::mutex> guard(sPlayersLock);
        auto st = sPlayers.find(player->GetGUID().GetCounter());
        return st != sPlayers.end() && st->second.addon;
    }

    void HandleIndex(Player* player, std::string const& req)
    {
        std::shared_ptr<Content const> content = Snapshot();
        LocaleConstant locale = sWorld->GetDefaultDbcLocale();

        std::vector<std::string> rows;
        std::unordered_set<uint32> zones;
        for (auto const& [id, e] : content->entries)
        {
            if (!zones.insert(e.zone).second)
                continue;
            AreaTableEntry const* area = sAreaTableStore.LookupEntry(e.zone);
            rows.push_back("Z," + std::to_string(e.zone) + "," + std::to_string(area ? area->mapid : 0) + ","
                + Escape(area ? area->area_name[locale] : ""));
        }
        for (auto const& [id, e] : content->entries)
            rows.push_back("E," + std::to_string(id) + "," + std::to_string(e.kind) + "," + std::to_string(e.zone) + ","
                + std::to_string(e.sort) + "," + std::to_string(e.faction));

        Send(player, "IR:" + req + ":" + std::to_string(content->entries.size()));
        SendRows(player, "ID:" + req, rows);
        Send(player, "IE:" + req);
    }

    void HandleKnown(Player* player, std::string const& req)
    {
        std::unordered_set<uint32> known;
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            if (st != sPlayers.end())
                known = st->second.known;
        }

        std::shared_ptr<Content const> content = Snapshot();
        std::vector<std::string> rows;
        for (uint32 id : known)
            rows.push_back("K," + std::to_string(id));
        for (auto const& [id, e] : content->entries)
            if (!known.count(id) && !Eligible(player, *content, e))
                rows.push_back("H," + std::to_string(id));

        Send(player, "KR:" + req + ":" + std::to_string(known.size()));
        SendRows(player, "KD:" + req, rows);
        Send(player, "KE:" + req);
    }

    void HandleText(Player* player, std::string const& req, std::vector<std::string_view> const& args)
    {
        uint32 id = 0;
        if (args.size() < 3 || !ParseUInt(args[2], id))
        {
            SendError(player, req, "bad");
            return;
        }

        std::shared_ptr<Content const> content = Snapshot();
        auto itr = content->entries.find(id);
        bool known = false;
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            known = st != sPlayers.end() && st->second.known.count(id);
        }
        if (itr == content->entries.end() || !known)
        {
            SendError(player, req, "none");
            return;
        }
        Entry const& e = itr->second;

        Send(player, "TR:" + req + ":" + std::to_string(id) + ":" + std::to_string(e.kind) + ":" + std::to_string(e.zone)
            + ":" + Escape(e.title));

        // The body in pieces, never cutting an escape or a UTF-8 character in two.
        std::string body = Escape(e.body);
        std::string const header = "TD:" + req + ":";
        std::size_t const budget = MAX_PAYLOAD - header.size();
        std::size_t pos = 0;
        while (pos < body.size())
        {
            std::size_t end = std::min(pos + budget, body.size());
            if (end < body.size())
            {
                if (body[end - 1] == '%')
                    end -= 1;
                else if (body[end - 2] == '%')
                    end -= 2;
                while (end > pos && (uint8(body[end]) & 0xC0) == 0x80)
                    --end;
            }
            Send(player, header + body.substr(pos, end - pos));
            pos = end;
        }
        Send(player, "TE:" + req);
    }
}
