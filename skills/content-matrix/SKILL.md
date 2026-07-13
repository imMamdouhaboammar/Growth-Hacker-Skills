---
name: content-matrix
description: >
  Generate 32 or more LinkedIn post ideas by pairing content pillars with eight proven formats. Use when the user asks for post ideas, a content matrix, monthly ideation, or topic mapping. A selected cell can be combined with a repository, article, tool, product, document, or release and handed to editorial-visual-engine for a source-backed visual, motion, and caption pack.
---

# Content Matrix

## CRITICAL: Auto-start on load

When this skill triggers, go straight to Step 1. Do not summarise.

## Step 1. Gather inputs

Check for about-me.md. If it exists, read it and pre-fill the user context.

If it is missing, ask for two short paragraphs describing who the user is, what they do, and what they discuss.

Then ask for content pillars in one batch:

- I will type 3 to 5 pillars
- Pull from voice.md
- Suggest four pillars from about-me.md

Confirm suggested pillars before building the matrix.

## Step 2. Build the matrix

Use these eight columns in order:

1. Actionable
2. Motivational
3. Analytical
4. Contrarian
5. Observation
6. X vs Y
7. Present vs Future
8. Listicle

Use the user's 3 to 5 pillars as rows.

Every cell contains one specific headline, not a broad theme. Each idea must fit both the pillar and the format.

Definitions:

- Actionable: teaches one concrete action
- Motivational: a relevant story with a lesson
- Analytical: explains why something works
- Contrarian: challenges common advice with a clear basis
- Observation: surfaces an underdiscussed pattern
- X vs Y: compares two specific options
- Present vs Future: contrasts the current state with a reasoned prediction
- Listicle: resources, mistakes, lessons, steps, or examples

## Step 3. Output by surface

- Chat surface with interactive table support: render an interactive matrix.
- File-system surface: save `content-matrix-YYYY-MM-DD.md` and show a readable inline table.
- Fallback: show a plain markdown table.

Name the strongest idea and explain why in one sentence.

## Step 4. Route the selected idea

Ask the user to select a cell by pillar and format.

Then offer:

- `post-writer` for a natural voice-led post
- `post-formatter` for a named framework
- `editorial-visual-engine` when the user has a supporting source link and wants source analysis, ChatGPT Images prompts, Google Flow motion, LinkedIn caption, or X output

The source-backed route is:

`selected matrix idea + source -> editorial-visual-engine`

## Rules

- Minimum 3 pillars, maximum 5.
- Do not reuse the same idea across pillars.
- Tune language to voice.md when available.
- Use British English unless voice.md specifies otherwise.
- Never use em dashes.
