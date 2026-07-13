---
name: gemini-carousel
description: >
  Generate a branded slide-by-slide LinkedIn carousel using Gemini. Use when the user explicitly asks for Gemini carousel prompts from supplied content. When a source link must be analysed and the user also wants source integrity, ChatGPT Images prompts, Google Flow motion, or LinkedIn and X captions, use editorial-visual-engine instead.
---

# Gemini Carousel

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise.

## Routing boundary

Use `editorial-visual-engine` instead when the request begins with a repository, article, AI skill, tool, product, release, document, or screenshots and needs a source-led Full Pack or ChatGPT Images output.

Continue here only when Gemini carousel output is explicitly requested.

## Step 1. Gather inputs

Ask for the source content, then ask in one batch:

1. Brand style
   - Pull from brand-kit.md
   - I will type colours and fonts
   - Suggest for me

2. Number of slides
   - 6 slides
   - 8 slides
   - 10 slides

## Step 2. Build the design brief

Create a slide-by-slide brief:

- Slide 1: cover hook and visual direction
- Slides 2 to N-1: one idea per slide
- Slide N: synthesis or CTA

For each slide include:

- Slide number
- Headline, maximum 8 words
- Body, normally maximum 15 words
- Visual suggestion

Ask for approval before generating prompts.

## Step 3. Output per-slide Gemini prompts

Produce one prompt per slide. Every prompt includes:

- 1080 x 1350 pixels, 4:5
- Identical palette and typography across the set
- Exact headline and body text
- Visual element
- Layout positions
- Background treatment
- No added text
- No watermarks or unsupported logos

## Step 4. Offer one-shot alternative

Offer one combined prompt only after the per-slide prompts. Explain that separate generation gives better consistency control.

## Rules

- Use this skill only for explicit Gemini carousel output.
- Route source-led ChatGPT Images and motion requests to editorial-visual-engine.
- Wait for brief approval.
- Use 1080 x 1350 pixels.
- Keep the brand style consistent.
- Make the cover and final slide distinct from body slides.
- Never use em dashes.
- Use British English unless voice.md specifies otherwise.
