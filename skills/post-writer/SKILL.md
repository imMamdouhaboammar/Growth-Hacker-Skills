---
name: post-writer
description: >
  Write LinkedIn posts that match the user's voice system in about-me.md and voice.md. Use when the user says "write a post", "draft a post", "LinkedIn post", "post about", "content idea", or wants notes turned into a post. When the user wants one source link analysed into a visual prompt, motion prompt, and LinkedIn or X captions together, use editorial-visual-engine as the orchestrator and apply this skill at its caption stage.
---

# Post Writer

## CRITICAL: Auto-start on load

The moment this skill triggers, go straight to Step 1. Do not summarise the skill. Do not explain what it does. Jump to input gathering.

## Step 1. Gather inputs

If the user supplied a repository, article, tool, product, release, document, screenshots, or source link and asked for a complete visual and caption pack, route to `editorial-visual-engine`. That skill will call these writing rules at the caption stage.

Otherwise, check the project for about-me.md and voice.md. Read both. If either is missing, tell the user to run the Voice Builder skill first by saying "build my voice", then stop.

Use a native structured question tool when available. Ask in one batch:

1. Topic source
   - Paste a context dump
   - I have a topic in mind
   - Suggest topics for me
   - Use a source already analysed by editorial-visual-engine

2. Reference structure
   - No references
   - I will paste examples
   - Use my training posts

If the user asks for suggestions, read about-me.md and voice.md, suggest five specific topics with one angle each, and let them select one.

## Step 2. Research and plan

When this skill is used independently, research the topic when tools and user instructions allow it. Look for:

- Supporting data
- Contrarian or surprising facts
- Real examples
- Misconceptions

When this skill is called from `editorial-visual-engine` in source-only mode, use only the Source Analysis and Source Integrity Block. Do not add external facts.

Present three source-specific or topic-specific angles. Then ask for:

- Angle
- Framework: PAS, how-to list, story to lesson, or contrarian take

Do not use placeholder angle names.

## Step 3. Write the draft

- Read voice.md for tone, rhythm, hooks, CTA style, and absence patterns.
- Read about-me.md for audience and topic context.
- Match sentence length and paragraph rhythm.
- Avoid every banned pattern in voice.md.
- Use the selected hook and structure.
- Keep every source fact consistent with the Source Integrity Block when supplied.
- Attribute source claims instead of stating them as independent facts.

Output the post inside a plain code block.

After the code block, add 2 to 3 sentences explaining the hook and structure, unless this skill is running inside the Full Pack output. In the Full Pack, return only the publish-ready caption to the orchestrator.

## Step 4. Iterate and hand off

Ask:

> How does this feel? Tell me what to change, or say "ship it" and I will save the final version.

Maximum three revision rounds.

When approved, save the post when file tools exist and the user asked for a file.

Then offer the relevant next route:

- `graphic-designer` for a visual based on the finished post
- `editorial-visual-engine` for a source-backed editorial pack from a link
- `post-scorer` for performance feedback

## Rules

- Always read about-me.md and voice.md before independent voice-led writing.
- Use only source evidence when called from editorial-visual-engine in source-only mode.
- Always output publish-ready posts in a plain code block.
- Never use em dashes.
- Use British English unless voice.md specifies otherwise.
- Do not add hashtags unless requested or supported by voice.md.
- Do not add engagement bait unless it appears in voice.md or the user requests it.
- Keep independent posts between 150 and 300 words unless the user requests otherwise.
- Plan before writing.
