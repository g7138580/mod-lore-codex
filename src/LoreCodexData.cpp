/*
 * mod-lore-codex: the entries, what unlocks them and what each character has discovered.
 *
 * The entries are read into an immutable snapshot that ".codex reload" swaps for a new one, so
 * map threads (exploration, kills, quests) can read it while the world thread reloads. Each
 * online character's discoveries are kept in memory beside the area it was last seen exploring;
 * new discoveries are written to the characters database as they happen.
 *
 * An entry is its opening body plus any number of parts. A part with triggers is earned like an
 * entry is (earning one first also unlocks the entry); a part without triggers always shows with
 * its entry. Either kind can be limited to a range of mod-individual-progression states, which
 * only matters for what is shown, never for what is recorded.
 *
 * Index rows (ID): Z,<zone>,<map>,<zone name> once per zone with entries, then
 * E,<entry>,<kind>,<zone>,<sort>,<faction> per entry. Titles and texts are only sent for
 * entries the character knows (T), so the codex can't be read ahead.
 *
 * Known rows (KD): K,<entry>,<parts earned> for each entry the character knows, H,<entry> for
 * each entry it can never unlock: the other faction's, and those whose every trigger is out of
 * its reach (a quest its race or class can't take, someone it can't talk to or can't attack).
 * The addon hides those.
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
        struct Part
        {
            uint8 part = 0;
            uint8 minState = 0;
            uint8 maxState = 255;
            bool earned = false; // has triggers of its own; otherwise it always shows with the entry
            std::string body;
        };

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
            std::vector<Part> parts; // in reading order
        };

        using TriggerKey = std::pair<uint8, uint32>; // type, value
        using Target = std::pair<uint32, uint8>;     // entry, part (0 = the entry itself)

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
            std::map<TriggerKey, std::vector<Target>> byTrigger;
            std::map<Target, std::vector<TriggerKey>> triggersOf;
            std::map<Target, std::vector<Need>> needsOf;
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

        uint64 PartKey(uint32 entry, uint8 part)
        {
            return (uint64(entry) << 8) | part;
        }

        struct PlayerState
        {
            uint32 lastArea = 0;
            bool addon = false;
            uint32 backfilled = 0;
            std::unordered_set<uint32> known;
            std::unordered_set<uint64> knownParts;
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

        Part const* FindPart(Entry const& e, uint8 part)
        {
            for (Part const& p : e.parts)
                if (p.part == part)
                    return &p;
            return nullptr;
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

        // Whether at least one of these triggers is within the character's reach.
        bool Reachable(Player* player, std::vector<Need> const& needs)
        {
            FactionTemplateEntry const* mine = sFactionTemplateStore.LookupEntry(player->GetFaction());
            for (Need const& need : needs)
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

        bool TargetReachable(Player* player, Content const& content, Target const& target)
        {
            auto needs = content.needsOf.find(target);
            return needs != content.needsOf.end() && Reachable(player, needs->second);
        }

        // Whether the character could ever unlock the entry: its faction allows it and at least
        // one trigger of the entry or of one of its parts is within its reach.
        bool Eligible(Player* player, Content const& content, Entry const& e)
        {
            if (!FactionAllows(player, e))
                return false;
            // The Scarlet Enclave is on the Ebon Hold's own map: only death knights ever go there.
            if (AreaTableEntry const* zone = sAreaTableStore.LookupEntry(e.zone))
                if (zone->mapid == MAP_EBON_HOLD && player->getClass() != CLASS_DEATH_KNIGHT)
                    return false;
            if (TargetReachable(player, content, { e.id, 0 }))
                return true;
            for (Part const& p : e.parts)
                if (p.earned && TargetReachable(player, content, { e.id, p.part }))
                    return true;
            return false;
        }

        uint32 PartsEarned(PlayerState const& st, Entry const& e)
        {
            uint32 n = 0;
            for (Part const& p : e.parts)
                if (p.earned && st.knownParts.count(PartKey(e.id, p.part)))
                    ++n;
            return n;
        }

        void Announce(Player* player, Entry const& e, bool addon, bool isNew, uint32 parts)
        {
            if (addon)
            {
                Send(player, std::string(isNew ? "NEW" : "UPD") + ":0:" + std::to_string(e.id) + ":" + std::to_string(e.kind)
                    + ":" + std::to_string(e.zone) + ":" + Escape(e.title) + ":" + std::to_string(parts));
                return;
            }
            if (GetConfig().chatFallback)
                ChatHandler(player->GetSession()).PSendSysMessage(isNew ? "|cffe6cc80Lore discovered:|r {} ({})"
                    : "|cffe6cc80Lore updated:|r {} ({})", e.title, KIND_NAMES[e.kind]);
        }

        // Records the entry, or one of its parts (and the entry with it), for the player; false
        // when it doesn't apply or is already known.
        bool TryDiscover(Player* player, Content const& content, uint32 id, uint8 part, bool announce, bool force)
        {
            auto itr = content.entries.find(id);
            if (itr == content.entries.end())
                return false;
            Entry const& e = itr->second;
            if (part)
            {
                Part const* p = FindPart(e, part);
                if (!p || !p->earned)
                    return false;
            }
            if (!force)
            {
                if (!FactionAllows(player, e))
                    return false;
                if (e.requiredState && ProgressionState(player) < e.requiredState)
                    return false;
            }

            ObjectGuid::LowType guid = player->GetGUID().GetCounter();
            bool addon = false, newEntry = false, newPart = false;
            uint32 parts = 0;
            {
                std::lock_guard<std::mutex> guard(sPlayersLock);
                auto st = sPlayers.find(guid);
                if (st == sPlayers.end())
                    return false;
                newEntry = st->second.known.insert(id).second;
                newPart = part && st->second.knownParts.insert(PartKey(id, part)).second;
                if (!newEntry && !newPart)
                    return false;
                addon = st->second.addon;
                parts = PartsEarned(st->second, e);
            }

            uint32 when = announce ? uint32(GameTime::GetGameTime().count()) : 0;
            if (newEntry)
                CharacterDatabase.Execute("INSERT IGNORE INTO mod_lore_codex_discovered (guid, entry, time) VALUES ({}, {}, {})",
                    guid, id, when);
            if (newPart)
                CharacterDatabase.Execute("INSERT IGNORE INTO mod_lore_codex_discovered_part (guid, entry, part, time) "
                    "VALUES ({}, {}, {}, {})", guid, id, part, when);
            if (announce)
                Announce(player, e, addon, newEntry, parts);
            return true;
        }

        void Fire(Player* player, Content const& content, TriggerType type, uint32 value)
        {
            auto itr = content.byTrigger.find({ uint8(type), value });
            if (itr == content.byTrigger.end())
                return;
            for (auto const& [id, part] : itr->second)
                TryDiscover(player, content, id, part, true, false);
        }

        // The entry for a known character: its body, each part it has earned and every part that
        // needs no earning, those limited to other progression states left out. Also says how many
        // parts were earned and whether more could be.
        std::string Compose(Player* player, Content const& content, Entry const& e, PlayerState const& st,
            uint32& earned, bool& more)
        {
            uint8 state = ProgressionState(player);
            std::string text = e.body;
            earned = 0;
            more = false;
            for (Part const& p : e.parts)
            {
                bool has = !p.earned || st.knownParts.count(PartKey(e.id, p.part));
                if (p.earned && has)
                    ++earned;
                if (p.earned && !has && TargetReachable(player, content, { e.id, p.part }))
                    more = true;
                if (has && state >= p.minState && state <= p.maxState)
                    text += "\n\n" + p.body;
            }
            return text;
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

        uint32 parts = 0;
        if (QueryResult result = WorldDatabase.Query("SELECT Entry, Part, MinState, MaxState, Body FROM mod_lore_codex_part "
            "ORDER BY Entry, Part"))
        {
            do
            {
                Field* f = result->Fetch();
                uint32 entry = f[0].Get<uint32>();
                Part p;
                p.part = f[1].Get<uint8>();
                p.minState = f[2].Get<uint8>();
                p.maxState = f[3].Get<uint8>();
                p.body = f[4].Get<std::string>();
                auto itr = content->entries.find(entry);
                if (itr == content->entries.end() || !p.part)
                {
                    LOG_ERROR("module", "LoreCodex: part {} of entry {} has no entry or is numbered 0, skipped.", p.part, entry);
                    continue;
                }
                itr->second.parts.push_back(std::move(p));
                ++parts;
            } while (result->NextRow());
        }

        uint32 triggers = 0;
        std::unordered_set<uint32> areaTriggers;
        if (QueryResult result = WorldDatabase.Query("SELECT Entry, Type, Value, Part FROM mod_lore_codex_trigger"))
        {
            do
            {
                Field* f = result->Fetch();
                uint32 entry = f[0].Get<uint32>();
                uint8 type = f[1].Get<uint8>();
                uint32 value = f[2].Get<uint32>();
                uint8 part = f[3].Get<uint8>();

                auto owner = content->entries.find(entry);
                bool valid = owner != content->entries.end();
                if (valid && part)
                {
                    Part* p = nullptr;
                    for (Part& candidate : owner->second.parts)
                        if (candidate.part == part)
                            p = &candidate;
                    if (p)
                        p->earned = true;
                    else
                        valid = false;
                }
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
                    LOG_ERROR("module", "LoreCodex: trigger (entry {}, part {}, type {}, value {}) points at nothing, skipped.",
                        entry, part, type, value);
                    continue;
                }

                Target target{ entry, part };
                content->byTrigger[{ type, value }].push_back(target);
                content->triggersOf[target].push_back({ type, value });
                content->needsOf[target].push_back(need);
                if (type == TRIGGER_AREA)
                    areaTriggers.insert(value);
                ++triggers;
            } while (result->NextRow());
        }

        for (auto const& [id, e] : content->entries)
        {
            bool any = content->triggersOf.count({ id, 0 }) != 0;
            for (Part const& p : e.parts)
                any = any || p.earned;
            if (!any)
                LOG_WARN("module", "LoreCodex: entry {} ({}) has no triggers; only .codex discover can unlock it.", id, e.title);
        }

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
        {
            h = Fnv(Fnv(Fnv(Fnv(Fnv(Fnv(Fnv(h, id), e.kind), e.zone), e.sort), e.faction), e.title), e.body);
            for (Part const& p : e.parts)
                h = Fnv(Fnv(Fnv(Fnv(Fnv(h, p.part), p.minState), p.maxState), uint32(p.earned)), p.body);
        }
        content->stamp = h;

        LOG_INFO("module", ">> LoreCodex: loaded {} entries, {} parts and {} triggers.", content->entries.size(), parts, triggers);

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
        ObjectGuid::LowType guid = player->GetGUID().GetCounter();
        if (QueryResult result = CharacterDatabase.Query("SELECT entry FROM mod_lore_codex_discovered WHERE guid = {}", guid))
        {
            do
                state.known.insert(result->Fetch()[0].Get<uint32>());
            while (result->NextRow());
        }
        if (QueryResult result = CharacterDatabase.Query("SELECT entry, part FROM mod_lore_codex_discovered_part WHERE guid = {}", guid))
        {
            do
            {
                Field* f = result->Fetch();
                state.knownParts.insert(PartKey(f[0].Get<uint32>(), f[1].Get<uint8>()));
            } while (result->NextRow());
        }

        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            sPlayers[guid] = std::move(state);
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
        for (auto const& [target, triggers] : content->triggersOf)
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
            if (met && TryDiscover(player, *content, target.first, target.second, false, false))
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

    void OnProgression(Player* player)
    {
        Backfill(player);
        if (HasAddon(player))
            Send(player, "RESET:0");
    }

    bool Discover(Player* player, uint32 entryId)
    {
        std::shared_ptr<Content const> content = Snapshot();
        auto itr = content->entries.find(entryId);
        if (itr == content->entries.end())
            return false;
        bool any = TryDiscover(player, *content, entryId, 0, true, true);
        for (Part const& p : itr->second.parts)
            if (p.earned)
                any = TryDiscover(player, *content, entryId, p.part, !any, true) || any;
        return any;
    }

    bool DiscoverPart(Player* player, uint32 entryId, uint8 part)
    {
        return TryDiscover(player, *Snapshot(), entryId, part, true, true);
    }

    uint32 DiscoverAll(Player* player)
    {
        std::shared_ptr<Content const> content = Snapshot();
        uint32 added = 0;
        for (auto const& [id, e] : content->entries)
        {
            if (TryDiscover(player, *content, id, 0, false, true))
                ++added;
            for (Part const& p : e.parts)
                if (p.earned)
                    TryDiscover(player, *content, id, p.part, false, true);
        }
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
                st->second.knownParts.clear();
                st->second.lastArea = 0;
            }
        }
        CharacterDatabase.Execute("DELETE FROM mod_lore_codex_discovered WHERE guid = {}", guid);
        CharacterDatabase.Execute("DELETE FROM mod_lore_codex_discovered_part WHERE guid = {}", guid);
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
        std::shared_ptr<Content const> content = Snapshot();
        std::vector<std::string> rows;
        std::size_t count = 0;
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            if (st != sPlayers.end())
            {
                count = st->second.known.size();
                for (uint32 id : st->second.known)
                {
                    auto itr = content->entries.find(id);
                    uint32 parts = itr != content->entries.end() ? PartsEarned(st->second, itr->second) : 0;
                    rows.push_back("K," + std::to_string(id) + "," + std::to_string(parts));
                }
                for (auto const& [id, e] : content->entries)
                    if (!st->second.known.count(id) && !Eligible(player, *content, e))
                        rows.push_back("H," + std::to_string(id));
            }
        }

        Send(player, "KR:" + req + ":" + std::to_string(count) + ":" + std::to_string(ProgressionState(player)));
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
        if (itr == content->entries.end())
        {
            SendError(player, req, "none");
            return;
        }
        Entry const& e = itr->second;

        std::string text;
        uint32 earned = 0;
        bool more = false;
        {
            std::lock_guard<std::mutex> guard(sPlayersLock);
            auto st = sPlayers.find(player->GetGUID().GetCounter());
            if (st == sPlayers.end() || !st->second.known.count(id))
            {
                SendError(player, req, "none");
                return;
            }
            text = Compose(player, *content, e, st->second, earned, more);
        }

        Send(player, "TR:" + req + ":" + std::to_string(id) + ":" + std::to_string(e.kind) + ":" + std::to_string(e.zone)
            + ":" + Escape(e.title) + ":" + std::to_string(earned) + ":" + (more ? "1" : "0") + ":"
            + std::to_string(ProgressionState(player)));

        // The text in pieces, never cutting an escape or a UTF-8 character in two.
        std::string body = Escape(text);
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
