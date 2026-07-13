<p align="center">
  <img src="assets/banner.svg" alt="Growth Hacker Skills for AI Agents" width="100%"/>
</p>

# Growth Hacker Skills for AI Agents

A connected library of agent skills for research, positioning, content, editorial visuals, social publishing, video, community, and performance review.

This repository extends the original Social Media Skills system by connecting source analysis, voice, writing, visual direction, motion, and caption workflows into one usable content chain.

## How the skills work together

```text
voice-builder
  -> about-me.md + voice.md
  -> post-writer / post-formatter
  -> graphic-designer
  -> post-scorer

content-matrix + repository/article/tool/document
  -> editorial-visual-engine
  -> ChatGPT Images prompts
  -> Google Flow motion prompt
  -> LinkedIn caption / X output
  -> post-scorer

explicit Gemini request
  -> gemini-infographic or gemini-carousel
```

### Routing rule

- Start with `graphic-designer` when you already have a finished post.
- Start with `editorial-visual-engine` when you have a source link, repository, article, tool, release, document, or screenshots and want source analysis plus an editorial visual pack.
- Use `gemini-infographic` or `gemini-carousel` only when Gemini output is explicitly requested.

## Available skills

<!-- SKILLS:START -->
| Skill | Description |
|---|---|
| [voice-builder](skills/voice-builder/) | Build `about-me.md` and `voice.md` from an interview plus writing samples. |
| [newsletter-voice](skills/newsletter-voice/) | Add newsletter-specific writing instructions to the voice foundation. |
| [profile-optimizer](skills/profile-optimizer/) | Rebuild a LinkedIn profile for clearer positioning and conversion. |
| [post-writer](skills/post-writer/) | Draft LinkedIn posts in the user's voice. |
| [post-formatter](skills/post-formatter/) | Apply PAS, AIDA, BAB, STAR, or SLAY to a LinkedIn post. |
| [hook-generator](skills/hook-generator/) | Generate multiple two-line hook options. |
| [content-matrix](skills/content-matrix/) | Pair content pillars with eight formats to produce 32 or more ideas. |
| [editorial-visual-engine](skills/editorial-visual-engine/) | Turn repositories, articles, tools, releases, documents, and screenshots into source-faithful editorial visuals, ChatGPT Images prompts, Google Flow motion prompts, and optional LinkedIn and X captions. |
| [graphic-designer](skills/graphic-designer/) | Create a matching graphic from an existing post. |
| [gemini-infographic](skills/gemini-infographic/) | Create an explicit Gemini whiteboard infographic prompt. |
| [gemini-carousel](skills/gemini-carousel/) | Create explicit Gemini carousel prompts with an approval gate. |
| [post-scorer](skills/post-scorer/) | Score a draft against the user's post history. |
| [reels-scripting](skills/reels-scripting/) | Reverse-engineer an outlier Reel and write a new script. |
| [youtube-thumbnail](skills/youtube-thumbnail/) | Turn a video title into a branded thumbnail prompt. |
| [pinned-comment](skills/pinned-comment/) | Write a pinned comment with a matching image prompt. |
| [niche-research](skills/niche-research/) | Find recent, date-verified stories in a niche. |
| [quote-post](skills/quote-post/) | Write a quote and generate a matching image workflow. |
| [analytics-dashboard](skills/analytics-dashboard/) | Turn a LinkedIn Analytics export into a dashboard and recommendations. |
<!-- SKILLS:END -->

## Editorial Visual Engine

The `editorial-visual-engine` skill adds the source-led workflow missing from post-first graphic tools.

It includes:

- Up to five source access methods before fallback
- Source-only analysis by default
- Source Integrity Block
- 3 to 6 source-specific creative angles
- Automatic format selection
- Permanent editorial reference library
- English-only typography choices
- Safe and Experimental ChatGPT Images prompts
- Optional silent Google Flow motion prompt
- Optional LinkedIn caption and X post or thread
- Links to voice-builder, content-matrix, post-writer, post-formatter, hook-generator, graphic-designer, Gemini skills, and post-scorer

Its permanent visual reference board is stored at:

`skills/editorial-visual-engine/assets/reference-board.svg`

## Installation

### Clone the repository

```bash
git clone https://github.com/imMamdouhaboammar/Growth-Hacker-Skills.git
```

Copy the skill folders into the skills directory used by your agent, or reference the repository from your agent project.

The skill files are agent-agnostic. Use the environment's native browser, web, repository, file, and structured-question tools when available.

## Usage examples

```text
"Build my voice"
  -> voice-builder

"Write a LinkedIn post about AI agents"
  -> post-writer

"Turn this finished post into a graphic"
  -> graphic-designer

"Analyse this repository and create the full editorial pack"
  -> editorial-visual-engine

"Turn this tool page into a ChatGPT Images prompt and a Google Flow loop"
  -> editorial-visual-engine

"Build a Gemini whiteboard infographic from this text"
  -> gemini-infographic

"Score this caption against my history"
  -> post-scorer
```

## Validation

Validate every skill:

```bash
./validate-skills.sh
```

Validate the new connected package:

```bash
./skills/editorial-visual-engine/scripts/validate-package.sh
```

## Prerequisites

Some skills require external services:

| Variable | Used by |
|---|---|
| `APIFY_API_TOKEN` | post-scorer, reels-scripting |
| `GOOGLE_AI_API_KEY` | reels-scripting video analysis |

The `editorial-visual-engine` produces prompts rather than calling image or video APIs directly. Run its still prompts in ChatGPT Images and its optional motion prompt in Google Flow.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Keep each skill's folder name aligned with its frontmatter `name`, keep `SKILL.md` under 500 lines where possible, and place large references in `references/` or `assets/`.

## Licence

[MIT](LICENSE).

The repository includes and extends ideas from Charlie Hills' open-source Social Media Skills project. Original source: `charlie947/social-media-skills`.
