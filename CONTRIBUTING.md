# Contributing

Growth Hacker Skills is maintained by Mamdouh Aboammar and developed as a connected agent skill network.

Changes should improve a specialist skill without breaking the handoffs, shared context, distribution formats, or quality gates around it.

## Quick start

1. Fork the repository
2. Create a feature branch such as `feat/new-skill-name` or `fix/skill-name-issue`
3. Make the change
4. Update the Neural Link graph when routing or artifacts change
5. Run the full validation set
6. Open a pull request with sample input and output

## Full validation

```bash
bash validate-skills.sh
bash skills/editorial-visual-engine/scripts/validate-package.sh
python3 scripts/validate-skill-graph.py
bash scripts/validate-distribution.sh
```

Claude plugin contributors should also run:

```bash
claude plugin validate .
```

SKILLS.sh contributors should verify both discovery modes:

```bash
npx skills add . --list
npx skills add . --full-depth --list
```

## Adding a specialist skill

Create:

```text
skills/my-new-skill/SKILL.md
```

The folder name and frontmatter `name` must match.

Minimum frontmatter:

```yaml
---
name: my-new-skill
description: >
  Use when the user needs a specific deliverable and describe the trigger conditions clearly.
---
```

Keep the skill focused on one capability. The main router coordinates multi-step work.

A specialist skill should define:

- Trigger conditions
- Required inputs
- Available context files
- Ordered workflow
- Exact outputs
- Handoff artifacts
- Quality checks
- Failure and fallback behaviour
- Non-negotiable rules

Keep `SKILL.md` under 500 lines. Move longer material into:

```text
skills/my-new-skill/references/
skills/my-new-skill/assets/
skills/my-new-skill/scripts/
```

## Connecting a new skill

Every new specialist skill must be added to `skill-graph.json`.

Define:

- Node ID
- Skill path
- Workflow stage
- Artifacts it consumes
- Artifacts it produces
- Incoming edges
- Outgoing edges
- Context carried by each edge

Also add the skill to:

- The routing table in `SKILL.md`
- The Claude plugin skill directory under `skills/`
- The relevant group in `skills.sh.json`
- The README skill network
- Distribution validation when the skill adds new required files

Do not create an edge that carries no context.

Do not create self-links.

Do not create a new node when an existing specialist skill already owns the stage.

## Shared context contract

Multi-skill workflows use `templates/growth-context.md`.

The context bus stores approved state:

- Objective
- Audience
- Evidence
- Verified facts
- Source claims
- Inferences
- Voice and brand constraints
- Selected angle and hook
- Platform and format
- CTA
- Completed nodes
- Next handoff
- Risks

Do not store hidden chain-of-thought.

Do not silently replace an approved decision.

## Improving an existing skill

Check whether the change affects:

- Inputs or outputs
- Trigger phrases
- File locations
- Cross-skill handoffs
- Source integrity
- Voice behaviour
- Plugin discovery
- SKILLS.sh discovery
- Validation scripts

When an artifact changes name or shape, update every graph edge and downstream skill that consumes it.

## Source integrity

Do not introduce external claims into a source-only workflow.

Keep these categories separate:

- Verified source facts
- Claims made by the source
- Inferences
- Missing or unverified information

Visual, caption, and writing skills must receive the same classification.

## Reference use

Voice files describe the user's writing style.

Reference libraries describe structure, pacing, visual grammar, and layout logic.

Do not copy a reference author's:

- Personal experience
- Identity
- Product claims
- Metrics
- Dates
- Links
- Distinctive wording

## Style rules

- Use clear English
- Prefer short sentences
- Do not use em dashes
- Avoid generic marketing filler
- Keep instructions agent-agnostic unless a skill explicitly targets one platform
- Use native structured questions when available, with a compact text fallback
- State exact output filenames when a skill writes files
- Check dependencies before calling external services

## Distribution changes

When changing Claude plugin packaging:

- Update `.claude-plugin/plugin.json`
- Update `.claude-plugin/marketplace.json`
- Keep versions aligned
- Update `CHANGELOG.md`
- Run `claude plugin validate .`

When changing SKILLS.sh packaging:

- Keep the root `SKILL.md` valid
- Keep nested skills valid
- Update `skills.sh.json`
- Verify default and `--full-depth` discovery

## Pull request format

Use a clear title:

```text
feat: add my-new-skill
fix: preserve source claims in editorial handoff
docs: update Claude plugin installation
```

The pull request body should include:

- What changed
- Why it changed
- Skills and graph edges affected
- Validation commands run
- Sample input and output when relevant
- Any migration notes

Questions and proposals can be opened as GitHub issues.
