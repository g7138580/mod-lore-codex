# Turns a zone's lore JSON (data/lore/<zone>.json) into the module's content SQL. Idempotent: deletes the zone's id range first.
# Usage: python tools/codex_sql.py data/lore/westfall.json 40 Westfall data/sql/db-world/<date>_lore_codex_westfall.sql
#
# An entry may carry "parts": [{"part": 1, "body": "...", "triggers": [[5, 123]], "minState": 0, "maxState": 255, "sources": []}].
# A part with triggers is earned on its own; a part without triggers always shows with its entry.
# Output that has parts or part numbers needs the parts schema (2026_10_17_63_lore_codex_parts.sql), so give it a later
# sequence number than that file.
import json, sys
src, zone, name, out = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4]
entries = json.load(open(src, encoding="utf8"))
lo, hi = zone * 100, zone * 100 + 99
def q(s): return "'" + str(s).replace("\\", "\\\\").replace("'", "''") + "'"
def clean(t): return not any(c in t for c in (chr(0x2014), chr(0x2013), "|", chr(92)))
bad = []
for e in entries:
    if not lo <= e["id"] <= hi: bad.append(f"id {e['id']} outside {lo}-{hi}")
    for k in ("title", "body"):
        if not clean(e[k]): bad.append(f"{e['id']} {k} has a dash, pipe or backslash")
    if len(e["title"]) > 80: bad.append(f"{e['id']} title too long")
    parts = e.get("parts", [])
    if [p["part"] for p in parts] != list(range(1, len(parts) + 1)): bad.append(f"{e['id']} parts are not numbered 1, 2, ...")
    for p in parts:
        if not clean(p["body"]): bad.append(f"{e['id']} part {p['part']} has a dash, pipe or backslash")
        if not 0 <= p.get("minState", 0) <= p.get("maxState", 255) <= 255: bad.append(f"{e['id']} part {p['part']} has a bad state range")
    if not e.get("triggers") and not any(p.get("triggers") for p in parts): bad.append(f"{e['id']} has no triggers")
if bad: sys.exit("problems:\n" + "\n".join(bad))
ordered = sorted(entries, key=lambda e: e["id"])
lines = [f"-- mod-lore-codex (acore_world): {name}.", "",
         f"DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN {lo} AND {hi};",
         f"DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN {lo} AND {hi};",
         f"DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN {lo} AND {hi};", "",
         "INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Sources`) VALUES"]
rows = []
for e in ordered:
    rows.append(f"({e['id']}, {e['kind']}, {e.get('zone', zone)}, {e.get('sort', 0)}, {e.get('faction', 0)}, {e.get('requiredState', 0)}, "
                f"{q(e['title'])}, {q(e['body'])}, {q('; '.join(e.get('sources', [])))})")
lines.append(",\n".join(rows) + ";")
prows = [f"({e['id']}, {p['part']}, {p.get('minState', 0)}, {p.get('maxState', 255)}, {q(p['body'])}, {q('; '.join(p.get('sources', [])))})"
         for e in ordered for p in e.get("parts", [])]
if prows:
    lines += ["", "INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES",
              ",\n".join(prows) + ";"]
trows = list(dict.fromkeys([f"({e['id']}, {t[0]}, {t[1]}, 0)" for e in ordered for t in e.get("triggers", [])]
                           + [f"({e['id']}, {t[0]}, {t[1]}, {p['part']})" for e in ordered for p in e.get("parts", []) for t in p.get("triggers", [])]))
lines += ["", "INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES", ",\n".join(trows) + ";"]
open(out, "w", encoding="utf8", newline="\n").write("\n".join(lines) + "\n")
print(f"wrote {len(rows)} entries, {len(prows)} parts, {len(trows)} triggers to {out}")
