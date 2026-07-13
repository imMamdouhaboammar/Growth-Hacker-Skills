#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "$ROOT/SKILL.md"
  "$ROOT/README.md"
  "$ROOT/.claude-plugin/plugin.json"
  "$ROOT/.claude-plugin/marketplace.json"
  "$ROOT/scripts/install-claude-plugin.sh"
  "$ROOT/docs/claude-plugin.md"
  "$ROOT/docs/skills-sh.md"
)

for file in "${required[@]}"; do
  [[ -f "$file" ]] || { echo "Missing distribution file: $file"; exit 1; }
done

grep -q '^name: growth-hacker-skills$' "$ROOT/SKILL.md"
grep -q '^description:' "$ROOT/SKILL.md"
grep -q 'skills/editorial-visual-engine/SKILL.md' "$ROOT/SKILL.md"
grep -q 'npx skills add imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"
grep -q 'claude plugin marketplace add imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"
grep -q 'skills.sh/b/imMamdouhaboammar/Growth-Hacker-Skills' "$ROOT/README.md"

python3 - "$ROOT" <<'PY'
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
plugin = json.loads((root / ".claude-plugin" / "plugin.json").read_text())
market = json.loads((root / ".claude-plugin" / "marketplace.json").read_text())

assert plugin["name"] == "growth-hacker-skills"
assert plugin["version"]
assert market["name"] == "growth-hacker-skills"
assert len(market["plugins"]) == 1
entry = market["plugins"][0]
assert entry["name"] == "growth-hacker-skills"
assert entry["source"] == "."
assert entry["version"] == plugin["version"]
PY

if grep -R --line-number -E 'TBD|TODO|\[Insert|PLACEHOLDER' \
  "$ROOT/SKILL.md" \
  "$ROOT/docs/claude-plugin.md" \
  "$ROOT/docs/skills-sh.md"; then
  echo "Found unresolved distribution placeholder"
  exit 1
fi

lines=$(wc -l < "$ROOT/SKILL.md" | tr -d ' ')
[[ "$lines" -le 500 ]] || { echo "Root SKILL.md exceeds 500 lines: $lines"; exit 1; }

echo "distribution validation passed"
echo "plugin: growth-hacker-skills"
echo "skills.sh source: imMamdouhaboammar/Growth-Hacker-Skills"
