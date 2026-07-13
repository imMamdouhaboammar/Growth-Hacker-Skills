---
name: graphic-designer
description: >
  Create LinkedIn post graphics from an existing post. Use when the user says "design a graphic", "create a visual", "make an image", "graphic for my post", "LinkedIn image", or wants visual content to pair with a completed post. When the input is a repository, article, tool, product, release, document, screenshot, or source link and the user wants source analysis, ChatGPT Images prompts, motion, or captions, use editorial-visual-engine instead.
---

# Graphic Designer

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise. Do not explain options. Start immediately.

## Step 1. Route the input

If the input is a repository, article, AI skill, tool, product page, release note, document, screenshot set, or source link and the user wants any of these:

- Source analysis
- Creative angle options
- Source Integrity Block
- ChatGPT Images prompt
- Google Flow motion prompt
- LinkedIn and X captions in one workflow

Use `editorial-visual-engine` instead and continue there. Do not duplicate its source-led workflow inside this skill.

Otherwise, check the project for the most recent post file. If found, read it. If not, say:

> Paste the post you want a graphic for.

Wait for the post, then use a native structured question tool when available. Ask:

- HTML/CSS graphic
- Whiteboard infographic
- Branded infographic
- You decide
- Full source-led editorial pack, which routes to `editorial-visual-engine`

If "You decide": analyse the post. If it contains numbered steps, frameworks, comparisons, or data tables, go Path A. If it recaps a workflow, shares tips, teaches a concept, or tells a story, go Path B and pick whichever style fits better.

## Path A: HTML/CSS structured graphic

Design constraints:

- 1200 x 1400 pixels
- Dark background or the user's brand colour with high contrast text
- Clean sans-serif font such as Inter or system-ui
- White or light text on dark background
- One accent colour for highlights and dividers
- 40px minimum padding on all sides
- No stock photo backgrounds
- Let the post content dictate the number of sections
- Keep every element readable on a mobile screen

Create one self-contained HTML file with inline CSS and a viewport meta tag.

Extract the core framework or steps from the post. Do not copy the full post. Distil into:

- A short headline of 5 to 8 words
- Key points as visual blocks
- Footer with author name from about-me.md if available

Save the HTML file and tell the user:

> Open the HTML in your browser and screenshot it.

## Path B: Image generation prompt

The graphic must recap the post content visually. It is not an abstract illustration or stock photo.

First extract:

- A headline of 5 to 10 words
- 3 to 6 key points, steps, or takeaways
- Numbers, stats, or data worth highlighting
- A footer line when appropriate

### Style 1: Whiteboard infographic

Use this prompt structure:

```text
Generate one image of a physical, hand-drawn infographic on a large whiteboard or notebook page.

Medium: Make it look like a photograph of a real whiteboard or large paper notepad.
Texture: All elements look created by hand using coloured marker pens and highlighters. Lines are slightly imperfect and have visible ink texture.
No digital fonts: All text appears handwritten or hand-printed in marker pen.
Canvas: 1080 x 1350 pixels.

Title:
[Exact headline]

Content:
[Exact 3 to 6 key points with drawn bullets, numbers, or small icons]

[Display important numbers large with a circle or box]

Keep text large and legible. Include the exact footer approved by the user.
```

### Style 2: Branded infographic

Ask for brand colours if they are not known. Check about-me.md or brand-kit.md first.

```text
Generate a professional infographic at 1080 x 1350 pixels.

Style: Clean, modern, editorial, flat, and highly readable. No generic 3D effects, stock photos, or visual clutter.

Colour palette:
- Background: [colour]
- Text: [high-contrast colour]
- Accent: [colour]

Headline:
[Exact headline]

Body:
[Exact 3 to 6 points with numbered circles, checkmarks, or simple icons]

Footer:
[Exact footer]

Keep the copy scannable and do not add any text.
```

Output the complete prompt in a code block.

## After either path

Say:

> Graphic ready. Use editorial-visual-engine when you want to start from a link, add source integrity, create ChatGPT Images directions, or add Google Flow motion. Say "score my post" when you want caption feedback.

## Rules

- Always read the post before designing.
- Always route source-led Full Pack requests to `editorial-visual-engine`.
- Structured graphics must be a single HTML file with inline CSS.
- Image prompts must be self-contained.
- Extract and distil the post content. Do not copy the full post.
- Never use em dashes.
- Use British English unless voice.md specifies otherwise.
