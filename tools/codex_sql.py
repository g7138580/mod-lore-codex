# Turns a zone's lore JSON (data/lore/<zone>.json) into the module's content SQL. Idempotent: deletes the zone's id range first.
# Usage: python tools/codex_sql.py data/lore/westfall.json 40 Westfall data/sql/db-world/<date>_lore_codex_westfall.sql
import json, sys
src, zone, name, out = sys.argv[1], int(sys.argv[2]), sys.argv[3], sys.argv[4]
entries = json.load(open(src, encoding="utf8"))
lo, hi = zone * 100, zone * 100 + 99
def q(s): return "'" + str(s).replace("\\", "\\\\").replace("'", "''") + "'"
bad = []
for e in entries:
    if not lo <= e["id"] <= hi: bad.append(f"id {e['id']} outside {lo}-{hi}")
    for k in ("title", "body"):
        t = e[k]
        if any(c in t for c in "\u2014\u2013|\\"): bad.append(f"{e['id']} {k} has a dash, pipe or backslash")
    if len(e["title"]) > 80: bad.append(f"{e['id']} title too long")
    if not e.get("triggers"): bad.append(f"{e['id']} has no triggers")
if bad: sys.exit("problems:\n" + "\n".join(bad))
lines = [f"-- mod-lore-codex (acore_world): {name}.", "",
         f"DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN {lo} AND {hi};",
         f"DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN {lo} AND {hi};", "",
         "INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Sources`) VALUES"]
rows = []
for e in sorted(entries, key=lambda e: e["id"]):
    rows.append(f"({e['id']}, {e['kind']}, {e.get('zone', zone)}, {e.get('sort', 0)}, {e.get('faction', 0)}, {e.get('requiredState', 0)}, "
                f"{q(e['title'])}, {q(e['body'])}, {q('; '.join(e.get('sources', [])))})")
lines.append(",\n".join(rows) + ";")
lines += ["", "INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`) VALUES"]
trows = list(dict.fromkeys([f"({e['id']}, {t[0]}, {t[1]})" for e in sorted(entries, key=lambda e: e["id"]) for t in e["triggers"]]))
lines.append(",\n".join(trows) + ";")
open(out, "w", encoding="utf8", newline="\n").write("\n".join(lines) + "\n")
print(f"wrote {len(rows)} entries, {len(trows)} triggers to {out}")
