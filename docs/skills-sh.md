# SKILLS.sh Distribution

Growth Hacker Skills is compatible with the open Agent Skills ecosystem and can be installed with the `skills` CLI.

Repository source:

```text
imMamdouhaboammar/Growth-Hacker-Skills
```

## Install the connected main skill

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills
```

Standard discovery finds the repository-level `SKILL.md` and installs `growth-hacker-skills`, the main router that connects the specialist skills through `skill-graph.json`.

Install it for Claude Code:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills -a claude-code
```

Install it globally:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills -g
```

Install without confirmation prompts:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills -g -a claude-code -y
```

## Inspect the repository

List the skills discovered by the default route:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills --list
```

Because the repository has a root `SKILL.md`, normal discovery returns the connected main skill first.

List the root router and every nested specialist skill:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills --full-depth --list
```

## Install every specialist skill

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills \
  --full-depth \
  --skill '*' \
  -a claude-code
```

Install all discovered skills to all supported agents:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills \
  --full-depth \
  --all
```

## Install selected specialist skills

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills \
  --full-depth \
  --skill editorial-visual-engine \
  --skill post-writer \
  --skill content-matrix \
  -a claude-code
```

## Install one specialist skill by direct path

Editorial Visual Engine:

```bash
npx skills add https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/tree/main/skills/editorial-visual-engine
```

Post Writer:

```bash
npx skills add https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/tree/main/skills/post-writer
```

Content Matrix:

```bash
npx skills add https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/tree/main/skills/content-matrix
```

Voice Builder:

```bash
npx skills add https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/tree/main/skills/voice-builder
```

Any folder following `skills/<skill-name>/SKILL.md` can use the same direct-path pattern.

## Use without installing

Generate the main skill prompt:

```bash
npx skills use imMamdouhaboammar/Growth-Hacker-Skills
```

Start Claude Code with the main skill prompt:

```bash
npx skills use imMamdouhaboammar/Growth-Hacker-Skills --agent claude-code
```

Use a specific specialist skill:

```bash
npx skills use \
  https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/tree/main/skills/editorial-visual-engine \
  --agent claude-code
```

## Supported agent examples

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills \
  -a claude-code \
  -a codex \
  -a cursor \
  -a gemini-cli
```

The CLI also supports other registered agents and universal agent directories.

## Update

Update the connected main skill:

```bash
npx skills update growth-hacker-skills
```

Update all installed skills:

```bash
npx skills update -y
```

## Remove

```bash
npx skills remove growth-hacker-skills
```

## Repository page configuration

The root `skills.sh.json` groups the specialist skills into:

- Core Network
- Research and Intelligence
- Writing and Positioning
- Editorial Visuals
- Video and Community
- Quality and Performance

This controls how the repository page is organised on skills.sh. It does not change installation behaviour.

## Badge

```markdown
[![skills.sh](https://skills.sh/b/imMamdouhaboammar/Growth-Hacker-Skills)](https://skills.sh/imMamdouhaboammar/Growth-Hacker-Skills)
```

The repository page can appear after the source has been installed through the `skills` CLI and the skills.sh cache refreshes.

## Validate before publishing

```bash
bash validate-skills.sh
python3 scripts/validate-skill-graph.py
bash scripts/validate-distribution.sh
```

The root skill, nested skills, graph, Claude plugin metadata, and skills.sh page configuration are checked together in CI.
