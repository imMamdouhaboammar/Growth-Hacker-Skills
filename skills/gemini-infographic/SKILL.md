---
name: gemini-infographic
description: >
  Generate a hand-drawn whiteboard infographic prompt for Gemini from supplied content. Use when the user explicitly asks for a Gemini whiteboard, hand-drawn graphic, or notebook infographic. When the input is a source link and the user wants source integrity, creative angles, ChatGPT Images prompts, Google Flow motion, or LinkedIn and X captions together, use editorial-visual-engine instead.
---

# Gemini Infographic

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise.

## Routing boundary

Use `editorial-visual-engine` instead when the request includes a repository, article, AI skill, tool, product, release, document, screenshot set, or source link plus any of these:

- Source analysis
- Source Integrity Block
- Multiple creative angles
- ChatGPT Images output
- Google Flow motion
- LinkedIn and X captions in the same run

Continue here only when Gemini whiteboard output is explicitly requested.

## Step 1. Get the source content

Ask:

> Paste the content you want to turn into a hand-drawn Gemini infographic. A post, newsletter section, article extract, research note, or bullet list works.

Wait for the content.

## Step 2. Build the brief

Analyse the content and produce:

- Title: 6 words or fewer
- Optional subtitle
- Core structure: steps, framework, comparison, stats, or list
- 3 to 7 key points, each 10 words or fewer
- Specific visual suggestions
- Footer CTA approved by the user

Tell the user:

> Here is the brief. Tell me what to change, or say "generate" when it is ready.

Wait for approval.

## Step 3. Output the Gemini prompt

```text
Generate one image of a physical, hand-drawn infographic on a large whiteboard or notebook page.

Medium: Make the image look like a photograph of a real whiteboard or paper notepad.
Texture: Use coloured marker pens and highlighters. Lines are slightly imperfect and show ink texture.
No digital fonts: All text appears handwritten or hand-printed in marker pen.
Canvas: 1080 x 1350 pixels.

[Insert the approved title, subtitle, structure, exact key points, and visual placement]

Keep text large and legible. Do not add text. Include the exact approved footer.
```

## Step 4. Offer iteration

Offer to adjust title size, colour count, layout direction, or density after the first generation.

## Rules

- Use this skill only for explicit Gemini whiteboard output.
- Route source-led Full Pack requests to editorial-visual-engine.
- Use 1080 x 1350 pixels.
- Keep bullets under 10 words.
- Wait for brief approval before the final prompt.
- Never use em dashes.
- Use British English unless voice.md specifies otherwise.
