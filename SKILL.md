---
name: growth-hacker-skills
description: >
  Use when a user needs a connected growth marketing workflow covering research, positioning, content ideas, LinkedIn writing, editorial visuals, source-led infographics, carousels, short-form video, community content, or performance review, especially when several specialist skills must work together rather than produce isolated outputs.
---

# Growth Hacker Skills

## Overview

This is the main router for the Growth Hacker Skills repository.

Use it to identify the correct specialist skill, preserve shared context between skills, and run multi-step workflows without duplicating work. The specialist skill owns its detailed rules. This router owns sequencing, handoffs, and output consistency.

## Core principle

Do not treat marketing tasks as isolated prompt requests.

Route the work through the smallest useful chain of specialist skills, pass forward the approved outputs, and keep research, voice, claims, visuals, captions, and performance review aligned.

## Auto-start

When this skill triggers:

1. Identify the user's final deliverable.
2. Inspect the available source material and project context.
3. Select one primary specialist skill.
4. Add supporting skills only when they materially improve the result.
5. Start the first required step immediately.

Do not explain the entire repository before beginning the task.

## Shared project context

Before drafting content, check for these files when the environment provides file access:

- `about-me.md`
- `voice.md`
- `newsletter-voice.md`
- `brand-kit.md`
- `colours.md`
- The most recent approved post, brief, research note, or source analysis

Use existing approved context instead of asking the user to repeat it.

When `about-me.md` or `voice.md` is missing and voice accuracy matters, route to `skills/voice-builder/SKILL.md` first.

## Primary routing table

| User need | Primary skill |
|---|---|
| Build a reusable personal writing voice | `skills/voice-builder/SKILL.md` |
| Add newsletter-specific voice rules | `skills/newsletter-voice/SKILL.md` |
| Rebuild a LinkedIn profile | `skills/profile-optimizer/SKILL.md` |
| Write a natural LinkedIn post in the user's voice | `skills/post-writer/SKILL.md` |
| Apply PAS, AIDA, BAB, STAR, or SLAY | `skills/post-formatter/SKILL.md` |
| Generate stronger hook options | `skills/hook-generator/SKILL.md` |
| Generate a pillar-by-format content matrix | `skills/content-matrix/SKILL.md` |
| Analyse a link or repository and create an editorial visual pack | `skills/editorial-visual-engine/SKILL.md` |
| Design a graphic for an already-finished post | `skills/graphic-designer/SKILL.md` |
| Create an explicit Gemini whiteboard infographic | `skills/gemini-infographic/SKILL.md` |
| Create an explicit Gemini carousel | `skills/gemini-carousel/SKILL.md` |
| Score a LinkedIn draft against post history | `skills/post-scorer/SKILL.md` |
| Reverse-engineer an outlier Reel and write a script | `skills/reels-scripting/SKILL.md` |
| Create a YouTube thumbnail prompt | `skills/youtube-thumbnail/SKILL.md` |
| Write a pinned comment with a matching visual | `skills/pinned-comment/SKILL.md` |
| Find recent stories in a niche | `skills/niche-research/SKILL.md` |
| Build a quote-led post and visual | `skills/quote-post/SKILL.md` |
| Analyse LinkedIn performance data | `skills/analytics-dashboard/SKILL.md` |

## Source-first route

Use `skills/editorial-visual-engine/SKILL.md` when the user provides any of these:

- GitHub repository, issue, release, pull request, or file
- Article, newsletter, research note, or documentation page
- AI skill, tool, product page, or launch page
- Uploaded document or screenshots
- A source link that must be summarised into an editorial design

The source-first chain is:

```text
source
-> source access and integrity check
-> 3 to 6 source-specific angles
-> format and typography choice
-> locked on-image copy
-> ChatGPT Images prompts
-> optional Google Flow motion prompt
-> optional LinkedIn and X captions
-> optional post scoring
```

Do not route source-led work to `graphic-designer` unless a finished post already exists and the user only needs a matching visual.

## Post-first route

Use this chain when the user starts with an idea, notes, or a draft rather than a source link:

```text
voice-builder when needed
-> content-matrix or hook-generator when needed
-> post-writer or post-formatter
-> graphic-designer
-> post-scorer
```

`post-writer` is for natural voice-led writing.

`post-formatter` is for a named structural framework.

Do not run both unless the user explicitly wants a framework-led rewrite after a natural draft.

## Editorial visual route

For source-led editorial visuals:

1. Read `skills/editorial-visual-engine/SKILL.md`.
2. Follow its source-only default unless the user explicitly requests external verification.
3. Preserve the Source Integrity Block.
4. Ask all unresolved creative decisions in one batch.
5. Use the permanent visual reference library.
6. Use the permanent caption corpus structurally, never as copied voice.
7. Produce ChatGPT Images prompts with exact English on-image copy and named English fonts.
8. Produce a silent Google Flow motion prompt only when requested.

The editorial visual engine owns:

- Field guides
- System maps
- Workflow diagrams
- Org charts
- Comparison boards
- Tool stacks
- Timelines
- Announcement posters
- Educational checklists
- Feature breakdowns
- Source-led carousels

## Gemini boundary

Use `gemini-infographic` or `gemini-carousel` only when the user explicitly requests Gemini output.

If the user requests ChatGPT Images, Google Flow, source integrity, angle selection, and captions in one workflow, use `editorial-visual-engine` instead.

## Caption handoff

When captions are requested from a source-led visual workflow:

- Use `voice.md` and `about-me.md` as the primary voice source when available.
- Use `editorial-visual-engine/references/caption-patterns.md` and `caption-reference-corpus.md` for structure.
- Use `post-writer` rules for natural LinkedIn writing.
- Use `post-formatter` rules only when a named framework is requested.
- Use `hook-generator` before locking the final hook when stronger options are needed.
- Use facts from the current source only unless the user requested broader research.

## Content idea handoff

A content matrix cell can become a complete source-backed asset:

```text
content-matrix idea + source
-> editorial-visual-engine
-> LinkedIn and X captions
-> post-scorer
```

A content matrix cell without a source routes to `post-writer` or `post-formatter`.

## Performance handoff

Use `post-scorer` after the caption or LinkedIn post is stable enough to evaluate.

Do not score:

- Raw notes
- Image prompts
- Motion prompts
- Unapproved outlines

Score the publishable LinkedIn copy, then revise only the areas supported by the score evidence.

## Capability-adaptive behaviour

Use the strongest tools available in the current agent environment.

Examples:

- Browser or web tools for public pages
- GitHub tools for repositories and releases
- File tools for documents and project context
- Structured question tools for batched choices
- Image tools only when the user requests direct generation

When a specialist skill names a platform-specific tool that is unavailable, preserve the workflow and use the closest equivalent interaction. Do not stop merely because one named interface is absent.

## Handoff contract

Every handoff must carry forward:

- Approved objective
- Target reader
- Selected angle
- Verified facts and source claims
- Voice and brand constraints
- Approved hook or headline
- Platform and format
- CTA decision
- Any unresolved risks

Do not make the next skill rediscover information already approved.

## Output discipline

For a single-skill request, return that skill's normal output.

For a multi-skill request, organise the result in the order the user will use it:

1. Strategy or source analysis
2. Approved angle and content structure
3. Final written copy
4. Visual prompt or asset brief
5. Motion prompt when requested
6. QA and publishing notes

Do not expose internal reasoning. Provide concise rationale, evidence, and decisions.

## Rules

- Always route to the most specific specialist skill available.
- Always preserve approved context between skills.
- Always distinguish source facts, source claims, and inferences when source integrity matters.
- Always use one primary skill and only the supporting skills required for the deliverable.
- Never duplicate the same planning stage in two skills.
- Never invent metrics, dates, integrations, testimonials, pricing, or product capabilities.
- Never copy a reference creator's distinctive wording or personal claims.
- Never replace a specialist skill's detailed rules with generic marketing advice.
- Never use an em dash in generated copy.
