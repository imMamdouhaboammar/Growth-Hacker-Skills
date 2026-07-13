#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
SKILL="$ROOT/skills/editorial-visual-engine"

required=(
  "$SKILL/SKILL.md"
  "$SKILL/README.md"
  "$SKILL/references/source-access.md"
  "$SKILL/references/source-integrity.md"
  "$SKILL/references/angle-library.md"
  "$SKILL/references/visual-style-library.md"
  "$SKILL/references/typography-library.md"
  "$SKILL/references/caption-patterns.md"
  "$SKILL/references/motion-patterns.md"
  "$SKILL/references/integration-map.md"
  "$SKILL/references/reference-catalogue.md"
  "$SKILL/assets/chatgpt-images-prompt-template.md"
  "$SKILL/assets/google-flow-motion-template.md"
  "$SKILL/assets/full-pack-output-template.md"
  "$SKILL/assets/reference-board.svg"
)

for file in "${required[@]}"; do
  [[ -f "$file" ]] || { echo "Missing: $file"; exit 1; }
done

grep -q '^name: editorial-visual-engine$' "$SKILL/SKILL.md"
grep -q 'Source Integrity Block' "$SKILL/SKILL.md"
grep -q 'ChatGPT Images' "$SKILL/SKILL.md"
grep -q 'Google Flow' "$SKILL/SKILL.md"
grep -q 'English content only' "$SKILL/SKILL.md"
grep -q 'post-writer' "$SKILL/references/integration-map.md"
grep -q 'graphic-designer' "$SKILL/references/integration-map.md"
grep -q 'editorial-visual-engine' "$ROOT/skills/graphic-designer/SKILL.md"
grep -q 'editorial-visual-engine' "$ROOT/skills/post-writer/SKILL.md"
grep -q 'editorial-visual-engine' "$ROOT/README.md"

if grep -R --line-number 'TBD\|TODO\|\[Insert' "$SKILL/SKILL.md" "$SKILL/references"; then
  echo "Found unresolved placeholder in core skill or references"
  exit 1
fi

lines=$(wc -l < "$SKILL/SKILL.md" | tr -d ' ')
[[ "$lines" -le 500 ]] || { echo "SKILL.md exceeds 500 lines: $lines"; exit 1; }

echo "editorial-visual-engine package validation passed"
