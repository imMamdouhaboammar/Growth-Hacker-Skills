---
name: post-formatter
description: >
  Turn a topic or an editorial-visual-engine source analysis into a ready-to-publish LinkedIn post using PAS, AIDA, BAB, STAR, or SLAY. Use when the user names a framework, asks to format a post, or wants a strict framework-led caption. Use editorial-visual-engine first when the request starts from a source link and also needs visual or motion prompts.
---

# Post Formatter

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise.

## Step 1. Gather inputs

If the user supplied a source link and also wants source analysis, visual prompts, motion, or X copy, route to `editorial-visual-engine`. Apply this skill only at its caption stage.

Otherwise ask in one batch:

1. Topic input
   - I will type the topic
   - Paste a context dump
   - Use the active editorial-visual-engine Source Analysis

2. Framework
   - PAS
   - AIDA
   - BAB
   - STAR
   - SLAY
   - Pick for me

Ask one compact follow-up for facts, audience, and tone only when missing.

## Step 2. Write the post

Global rules:

- Maximum 20 lines
- Normally 200 to 250 words
- Blank line between lines or short paragraphs
- Most lines contain one sentence
- Use clear words and remove filler
- No em dashes
- No questions unless the hook is a question
- No unnecessary emojis
- Use at most two trios
- Vary sentence starts
- When a Source Integrity Block exists, keep all facts and attribution aligned with it
- In source-only mode, do not add outside evidence

## Step 3. Structure

- Hook: 50 characters or fewer when possible
- Twist or contrast: one concise line
- Core: apply the selected framework across clear stages
- Wrap: lock the lesson and use one appropriate CTA

Framework maps:

- PAS: Problem -> Agitation -> Solution
- AIDA: Attention -> Interest -> Desire -> Action
- BAB: Before -> After -> Bridge
- STAR: Situation -> Task -> Action -> Result
- SLAY: Story -> Lesson -> Actionable advice -> You

## Step 4. Output

Output the finished post inside a plain code block. When running inside `editorial-visual-engine`, return the finished caption to the Full Pack without separate meta-commentary.

## Step 5. Offer the next move

Offer one relevant route:

- `graphic-designer` for a post-first visual
- `editorial-visual-engine` for a source-led ChatGPT Images and Google Flow pack
- `post-scorer` for evaluation

## Rules

- Enforce the selected framework.
- Count line and word limits when used independently.
- Never use em dashes.
- Use British English unless voice.md specifies otherwise.
- Tune tone and rhythm to voice.md when available.
- If a trio is used, it has exactly three items.
