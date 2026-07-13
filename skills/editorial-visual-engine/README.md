# Editorial Visual Engine

A source-led, agent-agnostic skill for turning repositories, articles, AI skills, tools, releases, product pages, documents, and screenshots into editorial social content.

## Outputs

- Source analysis
- Source Integrity Block
- 3 to 6 creative angles
- Automatic format recommendation
- Exact on-image copy
- Safe and Experimental prompts for ChatGPT Images
- Optional silent Google Flow motion prompt
- Optional LinkedIn caption
- Optional X post or thread
- Final QA notes

## Permanent reference system

The skill contains two connected reference libraries.

### Visual references

The permanent board in `assets/reference-board.svg` contains eight visual grammar families. Detailed selection and compatibility rules are in:

- `references/visual-style-library.md`
- `references/reference-catalogue.md`

### Caption references

The permanent caption corpus contains 11 complete, cleaned examples supplied for this workflow:

- Time-sensitive field guide
- Build decision and operational lesson
- Launch with hidden complexity
- Complete workflow inventory
- Save-before-you-start guide
- Advisor-board concept demo
- Blocked capability and access guide
- Conceptual stack argument
- Product demo with output proof
- Scheduled workflow list
- Collection organised as a company

Files:

- `references/caption-reference-corpus.md` stores the complete examples
- `references/caption-patterns.md` converts them into selection and drafting rules

The examples guide structure, pacing, proof placement, list rhythm, and CTA shape. They do not supply facts or personal claims for new posts.

## Repository relationships

This skill is designed to work with the other Growth Hacker Skills:

- `voice-builder` for voice context
- `content-matrix` for ideas
- `post-writer` for natural LinkedIn captions
- `post-formatter` for PAS, AIDA, BAB, STAR, and SLAY captions
- `hook-generator` for headline alternatives
- `graphic-designer` for post-first visuals
- `gemini-infographic` and `gemini-carousel` for explicit Gemini output
- `post-scorer` for caption evaluation

See `references/integration-map.md` for routing.

## Default behaviour

- English only
- Source-only analysis
- 1080 x 1350 by default
- ChatGPT Images for still prompts
- Google Flow for motion
- LinkedIn and X captions
- One batched creative decision step
- One primary caption reference selected for every requested caption
