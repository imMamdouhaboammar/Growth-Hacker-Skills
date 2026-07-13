---
name: post-writer
description: >
  Write LinkedIn posts that match the user's voice system (about-me.md and voice.md). Use this skill whenever the user says "write a post", "draft a post", "LinkedIn post", "post about [topic]", "content idea", or wants help writing any LinkedIn content. Also trigger when the user pastes a context dump (notes, transcripts, bullet points) and wants it turned into a post. Always references the voice files in the project before writing. Always outputs the final post in a code block. When the user wants one source link analysed into a visual prompt, motion prompt, and LinkedIn or X captions together, use editorial-visual-engine as the orchestrator and apply this skill at its caption stage.
---

# Post Writer

## CRITICAL: Auto-start on load

The moment this skill triggers, go straight to Step 1. Do not summarise the skill. Do not explain what it does. Do not list the files it references. Jump to input gathering immediately.

## Routing boundary

If the user supplied a repository, article, tool, product, release, document, screenshots, or source link and asked for a complete visual and caption pack, route to `editorial-visual-engine`. That skill applies these writing rules at the caption stage.

## Step 1. Gather inputs

Check the project for about-me.md and voice.md. Read both. If either is missing, tell the user to run the Voice Builder skill first ("say build my voice"), then stop.

If both files exist, call AskUserQuestion with this exact JSON:

```json
[
  {
    "question": "What topic do you want to post about?",
    "header": "Topic",
    "multiSelect": false,
    "options": [
      {"label": "Paste a context dump", "description": "I have notes, transcripts, or raw ideas to turn into a post"},
      {"label": "I have a topic in mind", "description": "I will type the topic after this"},
      {"label": "Suggest topics for me", "description": "Based on my voice system, suggest 5 topics I should post about"}
    ]
  },
  {
    "question": "Do you have any reference posts you want me to use as structural inspiration?",
    "header": "References",
    "multiSelect": false,
    "options": [
      {"label": "No references", "description": "Write from scratch using my voice files only"},
      {"label": "I will paste examples", "description": "I have posts from other creators I want you to study first"},
      {"label": "Use my training posts", "description": "Reference the posts I used in the Voice Builder"}
    ]
  }
]
```

Based on the answers:

- "Paste a context dump": wait for the user to paste, extract the core idea, then proceed to Step 2
- "I have a topic in mind": wait for the user to type it, then proceed to Step 2
- "Suggest topics for me": read about-me.md topic pillars and voice.md, suggest 5 specific topics with a one-line angle for each, then use AskUserQuestion to let them pick one
- "I will paste examples": wait for reference posts, note the structural patterns, then proceed
- "Use my training posts": reference whatever posts are already in the project

## Step 2. Research and plan

Before writing, research the topic. Look for:

- Data points or statistics that support the angle
- Contrarian takes or surprising facts
- Real examples or case studies
- Common misconceptions to challenge

When this skill is called from `editorial-visual-engine` in source-only mode, use only the Source Analysis and Source Integrity Block. Do not add external facts.

Then present a post plan. Call AskUserQuestion:

```json
[
  {
    "question": "Which angle works best for this post?",
    "header": "Angle",
    "multiSelect": false,
    "options": [
      {"label": "[Angle 1 name]", "description": "[One sentence describing the angle and hook]"},
      {"label": "[Angle 2 name]", "description": "[One sentence describing the angle and hook]"},
      {"label": "[Angle 3 name]", "description": "[One sentence describing the angle and hook]"}
    ]
  },
  {
    "question": "Which framework do you want?",
    "header": "Framework",
    "multiSelect": false,
    "options": [
      {"label": "PAS", "description": "Problem, Agitate, Solution"},
      {"label": "How-to list", "description": "Numbered steps or tips"},
      {"label": "Story to lesson", "description": "Personal story with a takeaway"},
      {"label": "Contrarian take", "description": "Challenge a common belief"}
    ]
  }
]
```

Fill in the actual angle options based on the topic research. Do not use placeholder text for the angle descriptions.

## Step 3. Write the draft

Write the post following these rules:

- Read voice.md for tone, rhythm, hook style, CTA style, and the absence patterns section (what the voice never does)
- Read about-me.md for audience and topic context
- Match the sentence length and paragraph rhythm from voice.md
- Avoid every banned word, structure, and pattern listed in voice.md's absence section
- Use the hook pattern that fits the chosen angle
- End with the CTA style from voice.md
- Keep every source fact consistent with the Source Integrity Block when supplied
- Attribute source claims instead of stating them as independent facts

Output the post inside a plain code block:

```text
[The full post goes here with all line breaks and formatting exactly as it should appear on LinkedIn]
```

After the code block, add 2 to 3 sentences on why you chose this hook and structure, referencing specific patterns from voice.md. When running inside the editorial-visual-engine Full Pack, return only the publish-ready caption to the orchestrator.

## Step 4. Iterate

Ask the user:

> How does this feel? Tell me what to change, or say "ship it" and I will save the final version.

If the user gives feedback, revise and output a new code block. Maximum 3 revision rounds.

If the user says "ship it" or equivalent, save the final post as a markdown file in the project.

Then say:

> Post saved. Say "design a graphic" to create a post-first visual, use `editorial-visual-engine` for a source-backed visual pack from a link, or say "score my post" for feedback before publishing.

## Rules

- Always read about-me.md and voice.md before writing.
- When called from editorial-visual-engine in source-only mode, use only the active source analysis.
- Always output posts in a plain code block.
- Never use em dashes in any post.
- British English unless voice.md says otherwise.
- Do not add hashtags unless voice.md explicitly uses them.
- Do not add engagement bait CTAs unless they appear in voice.md.
- Keep posts between 150 and 300 words unless the user requests otherwise.
- Plan before writing. Never skip Step 2.
