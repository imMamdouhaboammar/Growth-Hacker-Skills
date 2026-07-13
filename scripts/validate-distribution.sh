#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "$ROOT/SKILL.md"
  "$ROOT/README.md"
  "$ROOT/NOTICE.md"
  "$ROOT/LICENSE"
  "$ROOT/skill-graph.json"
  "$ROOT/skills.sh.json"
  "$ROOT/templates/growth-context.md"
  "$ROOT/docs/neural-linking.md"
  "$ROOT/docs/claude-plugin.md"
  "$ROOT/docs/skills-sh.md"
  "$ROOT/skills/growth-hacker-skills/SKILL.md"
  "$ROOT/.claude-plugin/plugin.json"
  "$ROOT/.claude-plugin/marketplace.json"
  "$ROOT/scripts/install-claude-plugin.sh"
  "$ROOT/scripts/validate-skill-graph.py"
)

for file in "${required[@]}"; do
  [[ -f "$file" ]] || { echo "Missing distribution file: $file"; exit 1; }
done

grep -q '^name: growth-hacker-skills$' "$ROOT/SKILL.md"
grep -q '^name: growth-hacker-skills$' "$ROOT/skills/growth-hacker-skills/SKILL.md"
grep -q '^description:' "$ROOT/SKILL.md"
grep -q 'skill-graph.json' "$ROOT/SKILL.md"
grep -q 'Neural Link Protocol' "$ROOT/SKILL.md"
grep -q 'skills/editorial-visual-engine/SKILL.md' "$ROOT/SKILL.md"
grep -q 'npx skills add imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"
grep -q 'claude plugin marketplace add imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"
grep -q 'skills.sh/b/imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"
grep -q 'Mamdouh Aboammar' "$ROOT/README.md"
grep -q 'Mamdouh Aboammar' "$ROOT/NOTICE.md"

python3 - "$ROOT" <<'PY'
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
plugin = json.loads((root / ".claude-plugin" / "plugin.json").read_text())
market = json.loads((root / ".claude-plugin" / "marketplace.json").read_text())
graph = json.loads((root / "skill-graph.json").read_text())
skills_page = json.loads((root / "skills.sh.json").read_text())

assert plugin["name"] == "growth-hacker-skills"
assert plugin["author"]["name"] == "Mamdouh Aboammar"
assert plugin["version"] == graph["version"]
assert graph["owner"]["name"] == "Mamdouh Aboammar"
assert graph["router"] == "growth-hacker-skills"

assert market["name"] == "growth-hacker-skills"
assert market["owner"]["name"] == "Mamdouh Aboammar"
assert len(market["plugins"]) == 1
entry = market["plugins"][0]
assert entry["name"] == "growth-hacker-skills"
assert entry["source"] == "."
assert entry["version"] == plugin["version"]

assert skills_page["$schema"] == "https://skills.sh/schemas/skills.sh.schema.json"
assert skills_page["groupings"]

grouped = {
    skill
    for group in skills_page["groupings"]
    for skill in group["skills"]
}
node_ids = {node["id"] for node in graph["nodes"]}
missing_from_page = node_ids - grouped
assert not missing_from_page, f"skills.sh.json missing nodes: {sorted(missing_from_page)}"
PY

python3 "$ROOT/scripts/validate-skill-graph.py"

if grep -R --line-number -E 'TBD|TODO|\[Insert|PLACEHOLDER' \
  "$ROOT/SKILL.md" \
  "$ROOT/skills/growth-hacker-skills/SKILL.md" \
  "$ROOT/docs/neural-linking.md" \
  "$ROOT/docs/claude-plugin.md" \
  "$ROOT/docs/skills-sh.md"; then
  echo "Found unresolved distribution placeholder"
  exit 1
fi

lines=$(wc -l < "$ROOT/SKILL.md" | tr -d ' ')
[[ "$lines" -le 500 ]] || { echo "Root SKILL.md exceeds 500 lines: $lines"; exit 1; }

plugin_lines=$(wc -l < "$ROOT/skills/growth-hacker-skills/SKILL.md" | tr -d ' ')
[[ "$plugin_lines" -le 500 ]] || { echo "Plugin router SKILL.md exceeds 500 lines: $plugin_lines"; exit 1; }

echo "distribution validation passed"
echo "owner: Mamdouh Aboammar"
echo "plugin: growth-hacker-skills"
echo "skills.sh source: imMamdouhaboammar/Growth-Hacker-Skills"
