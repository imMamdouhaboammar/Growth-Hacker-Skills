# Repository Integration Map

## Role of this skill

`editorial-visual-engine` is the link-first and source-first orchestrator. It begins with a repository, article, tool, product, document, release, screenshot, or pasted source.

`graphic-designer` remains the post-first visual skill. It begins with an existing post and decides how to visualise it.

## Skill routes

### Voice foundation

`voice-builder`

- Produces `about-me.md` and `voice.md`
- Required for voice-trained captions
- Optional for visual-only output

Route:

`voice-builder -> editorial-visual-engine caption stage`

### Idea discovery

`content-matrix`

- Produces content ideas across pillars and formats
- A selected idea can be paired with a source URL and handed to this skill

Route:

`content-matrix idea + source -> editorial-visual-engine`

### Natural caption writing

`post-writer`

- Applies `about-me.md` and `voice.md`
- Use when the caption should sound like the user without a rigid named framework

Route:

`editorial source analysis -> post-writer rules -> LinkedIn caption`

### Framework-led caption writing

`post-formatter`

- Applies PAS, AIDA, BAB, STAR, or SLAY
- Use only when the user names or selects a framework

Route:

`editorial source analysis -> post-formatter rules -> LinkedIn caption`

### Hook improvement

`hook-generator`

- Generates alternative hooks
- Use after source extraction and before locking on-image copy

Route:

`source facts -> angle -> hook-generator -> headline shortlist`

### Post-first graphics

`graphic-designer`

- Use when the input is an existing post and the user wants a matching visual
- Route to this skill when the input is a source link and the user wants analysis, source integrity, ChatGPT Images prompts, motion, or captions

### Gemini-specific output

`gemini-infographic` and `gemini-carousel`

- Keep these for users who explicitly request Gemini
- This skill owns ChatGPT Images prompts and the source-led Full Pack

### Quality scoring

`post-scorer`

- Use after the LinkedIn caption is drafted
- Score the caption, not the image prompt

Route:

`editorial-visual-engine caption -> post-scorer -> revision`

## End-to-end routes

### Link to complete campaign asset

`source -> editorial-visual-engine -> post-writer or post-formatter -> post-scorer`

### Existing post to graphic

`post-writer or post-formatter -> graphic-designer -> post-scorer`

### Idea to source-backed visual

`content-matrix -> selected idea + source -> editorial-visual-engine`

### Explicit Gemini carousel

`source content -> gemini-carousel`

### Explicit ChatGPT Images carousel plus motion

`source -> editorial-visual-engine -> ChatGPT Images prompts -> Google Flow prompt`

## Routing decision

Use `editorial-visual-engine` when any two are true:

- A source link or repository is supplied
- Source analysis is required
- Source integrity matters
- The user wants creative angle options
- The user wants ChatGPT Images prompts
- The user wants Google Flow motion
- The user wants LinkedIn and X captions in the same workflow
