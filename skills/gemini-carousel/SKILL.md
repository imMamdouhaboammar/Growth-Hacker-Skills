---
name: gemini-carousel
description: >
  Generate a branded slide-by-slide LinkedIn carousel using Gemini. Takes source content, builds a design brief, waits for approval, then outputs per-slide image generation prompts. 1080x1350 vertical format. Use this skill whenever the user says "carousel", "build a carousel", "turn this into a carousel", "gemini carousel", or wants multi-slide LinkedIn content. Always includes an approval gate between brief and image generation. When a source link needs source integrity, ChatGPT Images, Google Flow motion, or LinkedIn and X captions, use editorial-visual-engine instead.
---

# Gemini Carousel

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise.

## Routing boundary

Use `editorial-visual-engine` instead when the request begins with a repository, article, AI skill, tool, product, release, document, or screenshots and needs a source-led Full Pack, ChatGPT Images output, Google Flow motion, or LinkedIn and X captions.

Continue here when Gemini carousel output is explicitly requested.

## Step 1. Gather inputs

Ask:

> Paste the content you want in the carousel. A post, section of a newsletter, research notes, or a framework all work.

Wait for the content, then call AskUserQuestion:

```json
[
  {
    "question": "Brand style?",
    "header": "Style",
    "multiSelect": false,
    "options": [
      {"label": "Pull from brand-kit.md", "description": "Use the colours and typography in my project brand file"},
      {"label": "I will type brand colours", "description": "I will paste hex codes and font preferences"},
      {"label": "Suggest for me", "description": "Pick a palette and typography based on the content"}
    ]
  },
  {
    "question": "Number of slides?",
    "header": "Slides",
    "multiSelect": false,
    "options": [
      {"label": "6 slides", "description": "Concise, fast read"},
      {"label": "8 slides", "description": "Standard carousel length"},
      {"label": "10 slides", "description": "Deep-dive carousel"}
    ]
  }
]
```

## Step 2. Build the design brief

Analyse the content and produce a slide-by-slide brief with:

- **Slide 1 (Cover)**: hook, large bold text, visual direction
- **Slides 2 to N-1 (Body)**: one idea per slide, max 15 words per slide, visual suggestion
- **Slide N (CTA)**: repost ask, name, link or offer

For each slide include:

- Slide number
- Headline (max 8 words)
- Body text (max 15 words)
- Visual suggestion (icon, colour block, illustration, diagram)

Tell the user:

> Here is the design brief. Tell me what to change, or say "generate" when you are happy.

Wait for approval. Do not proceed until the user explicitly approves.

## Step 3. Output per-slide prompts

Once approved, output one Gemini image generation prompt per slide, each in its own code block, numbered clearly.

Every prompt follows this structure:

```text
Act as an expert graphic designer. Create a LinkedIn carousel slide at 1080x1350 pixels (4:5 aspect ratio).

Brand style:
- Primary colour: [HEX]
- Secondary colour: [HEX]
- Accent colour: [HEX]
- Typography: [bold industrial headline font, clean geometric body font]
- Aesthetic: modern, authoritative, high contrast

Slide [N of M]: [slide purpose]

Content:
- Headline: "[headline text]"
- Body: "[body text]"
- Visual element: [specific visual suggestion]

Layout instructions:
- [Headline placement and size]
- [Body placement and size]
- [Visual placement]
- [Background treatment]

Constraints:
- Vertical 4:5 aspect ratio at exactly 1080x1350 pixels
- No watermarks, no logos unless specified above
- Maintain visual consistency with the other slides in the set
```

Tell the user:

> Paste each prompt into a new Gemini chat with Create Image enabled and Nano Banana selected. Generate slides one at a time for maximum control over consistency.

## Step 4. Offer one-shot alternative

After the per-slide prompts, offer:

> Want a single combined prompt that generates the full carousel in one shot? Faster but less visual consistency. Say "combine" and I will rewrite.

## Rules

- Use this skill for explicit Gemini carousel output.
- Route source-led ChatGPT Images and motion requests to editorial-visual-engine.
- Always gate on user approval of the brief before outputting image prompts.
- 1080x1350 pixels per slide. No other aspect ratio.
- Maximum 15 words of body text per slide.
- Keep the brand style identical across every slide prompt.
- Cover slide and CTA slide must be visually distinct from body slides.
- Never use em dashes.
- British English unless voice.md specifies otherwise.
- If brand-kit.md exists in the project, read it and use its exact hex codes and typography choices.
