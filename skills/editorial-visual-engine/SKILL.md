---
name: editorial-visual-engine
description: >
  Use when a user provides a repository, article, AI skill, tool, product page, release note, document, screenshot, or source link and wants an editorial social visual, infographic, system map, carousel, launch graphic, ChatGPT Images prompt, Google Flow motion prompt, LinkedIn caption, or X post based on that source.
---

# Editorial Visual Engine

## Overview

Turn one source into a source-faithful editorial content pack for LinkedIn and X. The visual direction is selected from a permanent reference library, the image prompt is written for ChatGPT Images, and the optional motion prompt is written for Google Flow.

This is the source-led visual orchestrator for this repository. It complements the voice, writing, formatting, graphic, carousel, hook, matrix, and scoring skills rather than replacing them.

## Non-negotiable defaults

- Source-only analysis. Do not add outside research unless the user explicitly changes this rule.
- English content only.
- English fonts only.
- ChatGPT Images for still-image prompts.
- Google Flow for silent motion prompts.
- LinkedIn and X for optional captions.
- 1080 x 1350, 4:5, is the default social size.
- Ask all missing creative choices in one batch.
- Distinguish verified source facts, source claims, inferences, and omissions.
- Never invent features, metrics, screenshots, testimonials, dates, pricing, or integrations.

## Required references

Read these files before producing the final pack:

1. `references/source-access.md`
2. `references/source-integrity.md`
3. `references/angle-library.md`
4. `references/visual-style-library.md`
5. `references/typography-library.md`
6. `references/caption-patterns.md` when captions are requested
7. `references/motion-patterns.md` when motion is requested
8. `references/integration-map.md`
9. `references/reference-catalogue.md`

Use the templates in `assets/` for the final output shape.

## Step 1. Identify the input

Accept any of these:

- Public URL
- GitHub repository, folder, file, release, issue, or pull request
- Article, newsletter, documentation page, product page, AI tool, or AI skill
- Uploaded document
- Pasted text
- Screenshot or group of screenshots
- Existing post produced by another skill in this repository

If the user sends only a source link, ask one compact opening question:

> Do you want the full editorial pack from this source, or only the visual prompt?

If the user already asked for a full pack, do not ask this question.

## Step 2. Access the source with capability-adaptive retries

Use the strongest source-reading method available in the current agent environment. Follow the retry sequence in `references/source-access.md`.

For a GitHub repository, do not stop at the README when repository tools are available. Read the README, documentation, release notes, package metadata, examples, and the smallest set of core files needed to understand what the project actually does.

Attempt up to five materially different access methods. Do not repeat the same failed method with cosmetic changes.

If access still fails, present all fallback options in one message:

- Paste the source text
- Upload the page or document
- Upload screenshots
- Provide a raw file URL

Resume at Step 3 after receiving any usable fallback.

## Step 3. Build the source analysis

Extract only what the source supports:

- Source title and content type
- Primary subject
- Intended audience
- Core promise or central idea
- Key facts and capabilities
- Named products, models, frameworks, or components
- Steps, workflows, comparisons, metrics, dates, or limits
- Strong quotable ideas, paraphrased unless exact wording is required
- Visual objects available from the source, such as interface panels, code blocks, diagrams, logos, screenshots, or architecture
- Missing information that affects the creative direction

Then create a Source Integrity Block using `references/source-integrity.md`.

## Step 4. Generate creative angles

Create 3 to 6 source-specific angles. Include the strongest options from `references/angle-library.md`, not every preset.

Each angle must contain:

- Angle name
- One-sentence premise
- Target reader
- Suggested hook
- Best visual format
- Why the source supports it
- Risk or limitation

Mark one angle as `RECOMMENDED`.

Do not write generic angle labels without adapting them to the source. `Educational` is too vague. `Five workflows hidden inside the repository` is specific.

## Step 5. Recommend the format

Choose the format that makes the content easiest to understand on a mobile feed:

- Single editorial poster
- Field guide
- System map
- Workflow diagram
- Org chart
- Comparison board
- Tool stack
- Educational checklist
- Timeline
- Before and after
- Feature breakdown
- Announcement poster
- Data board
- Quote-led editorial
- Carousel, 6 to 10 slides

Use one primary reference style. A second style may be mixed only when the two are compatible under `references/visual-style-library.md`.

Explain the recommendation in two sentences or fewer.

## Step 6. Ask all creative choices in one batch

Use a native structured question or form tool if one exists. Otherwise ask one compact message. Never split these into separate conversational turns unless the user answers only part of the batch.

Ask only what is still unknown:

1. **Angle**
   - Recommended angle
   - Other generated angles
   - Custom angle
   - Decide for me

2. **Format**
   - Recommended format
   - Single graphic
   - Carousel
   - Another listed format
   - Decide for me

3. **Typography**
   - Recommended pairing
   - Helvetica Neue + Inter
   - IBM Plex Sans + IBM Plex Mono
   - Neue Montreal + Inter
   - Custom English font

4. **Caption**
   - LinkedIn and X
   - LinkedIn only
   - X only
   - No caption

5. **Motion**
   - Google Flow prompt
   - No motion

6. **Reference handling** when a custom reference was supplied
   - Current run only
   - Add to the permanent reference library

7. **Footer**
   - Author or handle
   - Source domain
   - No footer

If the user says `decide for me`, apply all recommended choices and continue.

## Step 7. Lock the on-image copy

Write the exact English copy that must appear in the design.

For a single graphic:

- Headline: 4 to 10 words
- Optional deck: 8 to 18 words
- 3 to 7 content units
- Each content unit: one short label plus one concise support line
- Optional source or author footer
- Keep the total visible copy within the density limit for the chosen style

For a carousel:

- Cover hook: 4 to 10 words
- One main idea per body slide
- Body copy: normally 8 to 25 words per slide
- Final slide: synthesis or useful next step, not forced engagement bait

Use 3 headline options and mark one as `RECOMMENDED` before locking the final copy.

## Step 8. Build the still-image prompts

Use `assets/chatgpt-images-prompt-template.md`.

Produce two prompts:

1. **Safe direction**
   - Closest to the chosen reference grammar
   - Clear hierarchy
   - Conservative density
   - High text reliability

2. **Experimental direction**
   - Same factual content and copy
   - More distinctive composition, visual metaphor, crop, rhythm, or layout
   - Still readable and source-faithful

Every prompt must include:

- Exact canvas size and aspect ratio
- Exact text content in quotation marks
- Visual hierarchy
- Grid and spatial proportions
- Font names and roles
- Palette
- Illustration, diagram, interface, or icon treatment
- Reference style IDs
- Footer treatment
- Negative constraints
- Text fidelity instruction
- Source fidelity instruction

The prompt must be self-contained. Do not leave placeholders in the final prompt.

## Step 9. Build the motion prompt when requested

Use `assets/google-flow-motion-template.md` and `references/motion-patterns.md`.

Select one motion mode:

- Seamless loop
- Motion poster
- Parallax editorial motion

Default duration: 6 seconds.

The prompt must require:

- Silent output with no audio
- Stable spelling and unchanged copy
- No new objects, logos, labels, or text
- No layout redesign
- No camera movement that harms legibility
- A clean final frame suitable for looping or GIF conversion

## Step 10. Write captions when requested

First check for `about-me.md` and `voice.md` in the project.

- If both exist, treat them as the primary voice source.
- If they do not exist, use `references/caption-patterns.md` for structure and state that the caption is not voice-trained.
- If the user requests a named framework such as PAS, AIDA, BAB, STAR, or SLAY, apply the `post-formatter` skill rules.
- If the user requests natural voice-led writing, apply the `post-writer` skill rules.
- If stronger hooks are needed, use the `hook-generator` skill.

LinkedIn output:

- Choose length based on the source, normally 150 to 300 words
- Preserve source accuracy
- Add useful detail not already visible in the graphic
- End with the most natural CTA for the angle
- Add hashtags only when requested

X output:

- Use one post when the idea fits clearly
- Use a thread when compression would remove useful context
- Do not duplicate the LinkedIn caption line for line

## Step 11. Run the final quality gate

Check every item:

- Factual consistency
- Source fidelity
- No invented features or claims
- Spelling and text lock
- English-only copy
- English-only font choices
- Mobile readability
- Text density
- Visual hierarchy
- Reference compatibility
- Caption and visual alignment
- Source claim attribution
- Motion safety
- No fake logos or fictional UI
- No duplicate ideas
- No external facts in source-only mode

Fix failures before output.

## Step 12. Output the Full Pack

Use `assets/full-pack-output-template.md` in this order:

1. Source analysis
2. Source Integrity Block
3. Creative direction
4. Headline options
5. Locked on-image copy
6. Safe ChatGPT Images prompt
7. Experimental ChatGPT Images prompt
8. Google Flow motion prompt, when requested
9. LinkedIn caption, when requested
10. X post or thread, when requested
11. QA notes
12. Optional machine-readable JSON, only when requested

When file tools exist and the user asked to save the result, write:

- `editorial-pack-YYYY-MM-DD.md`
- `editorial-pack-YYYY-MM-DD.json` only when JSON was requested

## Integration with the repository

Follow `references/integration-map.md`.

Primary routes:

- `voice-builder` creates the voice foundation used by captions.
- `content-matrix` can supply an idea, while this skill supplies a source-backed visual pack.
- `post-writer` writes natural LinkedIn captions in the user's voice.
- `post-formatter` applies named copy frameworks.
- `hook-generator` strengthens hook options.
- `graphic-designer` remains the post-first graphic skill. This skill is the link-first and source-first visual skill.
- `gemini-infographic` and `gemini-carousel` remain for explicit Gemini output. This skill owns ChatGPT Images output.
- `post-scorer` evaluates the final LinkedIn caption before publishing.

## Rules

- Always analyse the source before choosing a visual.
- Always keep verified facts separate from source claims and inferences.
- Always ask missing creative choices in one batch.
- Always include exact on-image copy inside the ChatGPT Images prompt.
- Always use English content and English fonts.
- Always use ChatGPT Images for the still prompt unless the user explicitly requests another generator.
- Always use Google Flow for the optional motion prompt.
- Never add outside research in source-only mode.
- Never infer a feature from a logo, screenshot, directory name, or marketing phrase alone.
- Never copy a reference composition pixel for pixel.
- Never mix more than two visual styles.
- Never use fake product UI to imply a feature the source does not show.
- Never expose internal chain-of-thought. Provide concise rationale and evidence instead.
- Never use em dashes in outputs.
