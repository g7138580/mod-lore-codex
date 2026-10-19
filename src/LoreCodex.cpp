/*
 * mod-lore-codex: configuration, the addon transport, request dispatch, hooks and commands.
 *
 * Wire format, both directions: "<COMMAND>:<request id>:<field>:<field>..." after the addon
 * prefix and a tab. Rows inside a field are separated by ';' and their values by ','. List
 * answers come as "<X>R" (meta), any number of "<X>D" (rows) and "<X>E" (end).
 *
 *   HELLO:<req>:<protocol>  -> HELLO:<req>:<version>:<stamp>:<backfilled>
 *   I:<req>                 -> IR:<req>:<entries>, ID rows, IE    the index (LoreCodexData.cpp)
 *   K:<req>                 -> KR:<req>:<known>:<state>, KD rows (K known, H out of reach), KE
 *   T:<req>:<entry>         -> TR:<req>:<entry>:<kind>:<zone>:<title>:<parts earned>:<more to earn>:<state>,
 *                              TD:<req>:<piece of the text>..., TE
 *
 * <state> is the mod-individual-progression state the text was put together for.
 *
 * Pushed by the server (request id 0):
 *   NEW:0:<entry>:<kind>:<zone>:<title>:<parts>   a discovery
 *   UPD:0:<entry>:<kind>:<zone>:<title>:<parts>   a known entry earned another part
 *   STAMP:0:<stamp>                               the entries changed (.codex reload)
 *   RESET:0                                       discoveries or the progression state changed: fetch K again
 */

#include "LoreCodex.h"
#include "Chat.h"
#include "ChatCommand.h"
#include "Config.h"
#include "Creature.h"
#include "Group.h"
#include "Player.h"
#include "QuestDef.h"
#include "ScriptMgr.h"
#include "Timer.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "WorldSessionMgr.h"
#include <algorithm>
#include <charconv>
#include <mutex>
#include <unordered_map>

namespace LoreCodex
{
    namespace
    {
        Config sConfig;

        // Addon whispers are never muted by the chat flood check, so each character gets a budget.
        constexpr float REQUEST_BURST = 16.0f;
        constexpr float REQUEST_RATE = 4.0f;

        struct Bucket
        {
            float tokens = REQUEST_BURST;
            uint32 lastRefill = 0;
        };

        std::unordered_map<ObjectGuid::LowType, Bucket> sBuckets;

        constexpr uint32 IP_PROGRESSION_QUEST_BASE = 66000;
        constexpr uint8 IP_STATE_MAX = 18;

        bool TakeToken(Player* player, float cost)
        {
            Bucket& b = sBuckets[player->GetGUID().GetCounter()];
            uint32 now = getMSTime();
            if (b.lastRefill)
                b.tokens = std::min(REQUEST_BURST, b.tokens + getMSTimeDiff(b.lastRefill, now) * REQUEST_RATE / 1000.0f);
            b.lastRefill = now;
            if (b.tokens < cost)
                return false;
            b.tokens -= cost;
            return true;
        }

        std::vector<std::string_view> Split(std::string_view text, char sep)
        {
            std::vector<std::string_view> parts;
            std::size_t start = 0;
            while (true)
            {
                std::size_t pos = text.find(sep, start);
                if (pos == std::string_view::npos)
                {
                    parts.push_back(text.substr(start));
                    break;
                }
                parts.push_back(text.substr(start, pos - start));
                start = pos + 1;
            }
            return parts;
        }
    }

    Config& GetConfig()
    {
        return sConfig;
    }

    void LoadConfig()
    {
        sConfig.enabled = sConfigMgr->GetOption<bool>("LoreCodex.Enable", true);
        sConfig.backfill = sConfigMgr->GetOption<bool>("LoreCodex.Backfill", true);
        sConfig.chatFallback = sConfigMgr->GetOption<bool>("LoreCodex.ChatFallback", true);
        sConfig.progressionEnabled = sConfigMgr->GetOption<bool>("IndividualProgression.Enable", false, false);
    }

    void Send(Player* player, std::string const& payload)
    {
        if (!player || !player->GetSession())
            return;

        std::string full = std::string(PREFIX) + "\t" + payload;
        WorldPacket data;
        ChatHandler::BuildChatPacket(data, CHAT_MSG_WHISPER, LANG_ADDON, player, player, full);
        player->GetSession()->SendPacket(&data);
    }

    void SendRows(Player* player, std::string const& header, std::vector<std::string> const& rows)
    {
        std::string line;
        std::size_t const budget = MAX_PAYLOAD - header.size() - 1;
        for (std::string const& row : rows)
        {
            if (row.size() > budget)
                continue; // a cut row would corrupt the list
            if (!line.empty() && line.size() + 1 + row.size() > budget)
            {
                Send(player, header + ":" + line);
                line.clear();
            }
            if (!line.empty())
                line += ';';
            line += row;
        }
        if (!line.empty())
            Send(player, header + ":" + line);
    }

    void SendError(Player* player, std::string const& req, std::string_view what)
    {
        Send(player, "ERR:" + req + ":" + std::string(what));
    }

    bool ParseUInt(std::string_view text, uint32& out)
    {
        if (text.empty())
            return false;
        auto result = std::from_chars(text.data(), text.data() + text.size(), out, 10);
        return result.ec == std::errc{} && result.ptr == text.data() + text.size();
    }

    std::string Escape(std::string_view text)
    {
        if (text.empty())
            return "-";

        static char const* const HEX = "0123456789ABCDEF";
        std::string out;
        out.reserve(text.size());
        for (char c : text)
        {
            if (c == ',' || c == ';' || c == ':' || c == '|' || c == '%' || c == '\n' || c == '\r')
            {
                out += '%';
                out += HEX[(uint8(c) >> 4) & 0xF];
                out += HEX[uint8(c) & 0xF];
            }
            else
                out += c;
        }
        // A lone "-" would read back as empty.
        return out == "-" ? "%2D" : out;
    }

    uint8 ProgressionState(Player* player)
    {
        if (!sConfig.progressionEnabled || player->IsGameMaster())
            return IP_STATE_MAX;

        uint8 state = 0;
        for (uint8 i = 1; i <= IP_STATE_MAX; ++i)
            if (player->GetQuestStatus(IP_PROGRESSION_QUEST_BASE + i) == QUEST_STATUS_REWARDED)
                state = i;
        return state;
    }

    bool IsProgressionQuest(uint32 questId)
    {
        return questId > IP_PROGRESSION_QUEST_BASE && questId <= IP_PROGRESSION_QUEST_BASE + IP_STATE_MAX;
    }

    void Dispatch(Player* player, std::string_view message)
    {
        std::vector<std::string_view> args = Split(message, ':');
        if (args.size() < 2 || args.size() > 4)
            return;

        std::string_view command = args[0];
        std::string req(args[1].substr(0, 12));

        if (command == "HELLO")
        {
            uint32 backfilled = Data::AddonReady(player);
            Send(player, "HELLO:" + req + ":" + std::to_string(PROTOCOL_VERSION) + ":" + std::to_string(Data::Stamp())
                + ":" + std::to_string(backfilled));
            return;
        }

        if (!TakeToken(player, command == "I" ? 4.0f : 1.0f))
        {
            SendError(player, req, "busy");
            return;
        }

        if (command == "I")
            Data::HandleIndex(player, req);
        else if (command == "K")
            Data::HandleKnown(player, req);
        else if (command == "T")
            Data::HandleText(player, req, args);
        else
            SendError(player, req, "unknown");
    }
}

using namespace LoreCodex;
using namespace Acore::ChatCommands;

class LoreCodexPlayerScript : public PlayerScript
{
public:
    LoreCodexPlayerScript() : PlayerScript("LoreCodexPlayerScript",
        {
            PLAYERHOOK_CAN_PLAYER_USE_PRIVATE_CHAT,
            PLAYERHOOK_ON_LOGIN,
            PLAYERHOOK_ON_LOGOUT,
            PLAYERHOOK_ON_DELETE_FROM_DB,
            PLAYERHOOK_CAN_AREA_EXPLORE_AND_OUTDOOR,
            PLAYERHOOK_ON_CREATURE_KILL_CREDIT,
            PLAYERHOOK_ON_PLAYER_QUEST_ACCEPT,
            PLAYERHOOK_ON_PLAYER_COMPLETE_QUEST,
        }) { }

    // The addon whispers itself; swallow those messages so they never show up as chat.
    bool OnPlayerCanUseChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver) override
    {
        if (lang != LANG_ADDON || !receiver || receiver != player)
            return true;

        std::string const prefixTab = std::string(PREFIX) + "\t";
        if (msg.compare(0, prefixTab.size(), prefixTab) != 0)
            return true;

        if (!GetConfig().enabled)
        {
            Send(player, "OFF:0");
            return false;
        }

        Dispatch(player, std::string_view(msg).substr(prefixTab.size()));
        return false;
    }

    void OnPlayerLogin(Player* player) override
    {
        if (GetConfig().enabled)
            Data::OnLogin(player);
    }

    void OnPlayerLogout(Player* player) override
    {
        sBuckets.erase(player->GetGUID().GetCounter());
        Data::OnLogout(player);
    }

    void OnPlayerDeleteFromDB(CharacterDatabaseTransaction trans, uint32 guid) override
    {
        trans->Append("DELETE FROM mod_lore_codex_discovered WHERE guid = {}", guid);
        trans->Append("DELETE FROM mod_lore_codex_discovered_part WHERE guid = {}", guid);
    }

    // Runs from the game's exploration check, after its own tests: the player moved, is alive
    // and isn't on a flight path. Never stops the exploration itself.
    bool OnPlayerCanAreaExploreAndOutdoor(Player* player) override
    {
        if (GetConfig().enabled)
            Data::OnExplore(player);
        return true;
    }

    // The game names one player for a kill (the looter); everyone in their group close enough to
    // share the kill's reward was there for it too.
    void OnPlayerCreatureKillCredit(Player* player, Creature* killed) override
    {
        if (!GetConfig().enabled || !killed)
            return;
        Group* group = player->GetGroup();
        if (!group)
        {
            Data::OnTrigger(player, TRIGGER_KILL, killed->GetEntry());
            return;
        }
        for (GroupReference* ref = group->GetFirstMember(); ref; ref = ref->next())
            if (Player* member = ref->GetSource())
                if (member == player || (member->IsInMap(player) && member->IsAtGroupRewardDistance(killed)))
                    Data::OnTrigger(member, TRIGGER_KILL, killed->GetEntry());
    }

    void OnPlayerQuestAccept(Player* player, Quest const* quest) override
    {
        if (GetConfig().enabled && quest)
            Data::OnTrigger(player, TRIGGER_QUEST_ACCEPT, quest->GetQuestId());
    }

    // Fires from RewardQuest: the quest was turned in. mod-individual-progression rewards a
    // hidden quest each time a character moves on to its next state.
    void OnPlayerCompleteQuest(Player* player, Quest const* quest) override
    {
        if (!GetConfig().enabled || !quest)
            return;
        if (GetConfig().progressionEnabled && IsProgressionQuest(quest->GetQuestId()))
            Data::OnProgression(player);
        else
            Data::OnTrigger(player, TRIGGER_QUEST_DONE, quest->GetQuestId());
    }
};

// Talking to someone: right-clicking a gossip or quest giver goes through the gossip hello
// hook. Returning false leaves the conversation alone.
class LoreCodexCreatureScript : public AllCreatureScript
{
public:
    LoreCodexCreatureScript() : AllCreatureScript("LoreCodexCreatureScript") { }

    bool CanCreatureGossipHello(Player* player, Creature* creature) override
    {
        if (GetConfig().enabled && player && creature)
            Data::OnTrigger(player, TRIGGER_TALK, creature->GetEntry());
        return false;
    }
};

class LoreCodexWorldScript : public WorldScript
{
public:
    LoreCodexWorldScript() : WorldScript("LoreCodexWorldScript",
        { WORLDHOOK_ON_AFTER_CONFIG_LOAD, WORLDHOOK_ON_STARTUP }) { }

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        LoadConfig();
    }

    void OnStartup() override
    {
        Data::Load();
    }
};

class LoreCodexCommandScript : public CommandScript
{
public:
    LoreCodexCommandScript() : CommandScript("LoreCodexCommandScript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable codexTable =
        {
            { "reload",   HandleReload,   SEC_ADMINISTRATOR, Console::Yes },
            { "discover", HandleDiscover, SEC_GAMEMASTER,    Console::No },
            { "reset",    HandleReset,    SEC_GAMEMASTER,    Console::No },
            { "",         HandleInfo,     SEC_GAMEMASTER,    Console::No },
        };
        static ChatCommandTable root = { { "codex", codexTable } };
        return root;
    }

    // The selected player, else yourself.
    static Player* Target(ChatHandler* handler)
    {
        if (Player* sel = handler->getSelectedPlayer())
            return sel;
        return handler->GetPlayer();
    }

    static bool HandleInfo(ChatHandler* handler)
    {
        Player* target = Target(handler);
        handler->PSendSysMessage("LoreCodex: {} entries loaded. {} knows {}{}.", Data::EntryCount(), target->GetName(),
            Data::KnownCount(target), Data::HasAddon(target) ? " (addon running)" : " (no addon)");
        handler->SendSysMessage(".codex discover <entry [part]|all>, .codex reset, .codex reload");
        return true;
    }

    // Reads the entries again; online characters are credited for what they already did and
    // their addons fetch the new index.
    static bool HandleReload(ChatHandler* handler)
    {
        LoadConfig();
        Data::Load();
        uint32 players = 0;
        for (auto const& [id, session] : sWorldSessionMgr->GetAllSessions())
        {
            Player* player = session ? session->GetPlayer() : nullptr;
            if (!player || !player->IsInWorld())
                continue;
            Data::Backfill(player);
            if (Data::HasAddon(player))
                Send(player, "STAMP:0:" + std::to_string(Data::Stamp()));
            ++players;
        }
        handler->PSendSysMessage("LoreCodex: {} entries loaded, {} players updated.", Data::EntryCount(), players);
        return true;
    }

    // ".codex discover <entry>" gives the entry and all its parts, ".codex discover <entry> <part>"
    // one part (and the entry with it), ".codex discover all" everything.
    static bool HandleDiscover(ChatHandler* handler, std::string_view what, Optional<uint32> part)
    {
        Player* target = Target(handler);
        if (what == "all")
        {
            handler->PSendSysMessage("LoreCodex: {} entries discovered for {}.", Data::DiscoverAll(target), target->GetName());
            return true;
        }
        uint32 entry = 0;
        bool done = ParseUInt(what, entry)
            && (part ? *part <= 255 && Data::DiscoverPart(target, entry, uint8(*part)) : Data::Discover(target, entry));
        if (!done)
            handler->SendSysMessage("LoreCodex: no such entry or part, or it is already known.");
        return true;
    }

    static bool HandleReset(ChatHandler* handler)
    {
        Player* target = Target(handler);
        Data::Forget(target);
        handler->PSendSysMessage("LoreCodex: {}'s discoveries cleared.", target->GetName());
        return true;
    }
};

void AddLoreCodexScripts()
{
    new LoreCodexPlayerScript();
    new LoreCodexCreatureScript();
    new LoreCodexWorldScript();
    new LoreCodexCommandScript();
}
