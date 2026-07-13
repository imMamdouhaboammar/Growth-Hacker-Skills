<p align="center">
  <img src="assets/banner.svg" alt="Growth Hacker Skills by Mamdouh Aboammar" width="100%"/>
</p>

<p align="center">
  <a href="https://skills.sh/imMamdouhaboammar/Growth-Hacker-Skills"><img src="https://skills.sh/b/imMamdouhaboammar/Growth-Hacker-Skills" alt="skills.sh installs"/></a>
  <a href="https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-F3C969" alt="MIT License"/></a>
  <a href="https://github.com/imMamdouhaboammar/Growth-Hacker-Skills/blob/main/.claude-plugin/plugin.json"><img src="https://img.shields.io/badge/Claude_Plugin-2.0.0-D7FF4B" alt="Claude Plugin 2.0.0"/></a>
  <a href="https://github.com/imMamdouhaboammar"><img src="https://img.shields.io/badge/by-Mamdouh_Aboammar-FF8A68" alt="By Mamdouh Aboammar"/></a>
</p>

# Growth Hacker Skills

A connected agent skill network for research, positioning, content, editorial visuals, motion, community, and performance review.

Created and maintained by **[Mamdouh Aboammar](https://github.com/imMamdouhaboammar)**.

This repository is designed around one idea: a marketing workflow should not lose context every time it moves from research to writing, design, publishing, or analysis.

Instead of isolated prompts, the repository uses a **Neural Link Protocol** that connects specialist skills through a main router, a machine-readable skill graph, a shared context bus, and explicit handoff contracts.

## Install

### SKILLS.sh

Install the connected main skill:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills
```

Install the full specialist library:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills \
  --full-depth \
  --skill '*' \
  -a claude-code
```

List all discoverable skills:

```bash
npx skills add imMamdouhaboammar/Growth-Hacker-Skills --full-depth --list
```

Full guide: [docs/skills-sh.md](docs/skills-sh.md)

### Claude Code Plugin

```bash
claude plugin marketplace add imMamdouhaboammar/Growth-Hacker-Skills
claude plugin install growth-hacker-skills@growth-hacker-skills
```

Or use the installer from a cloned copy:

```bash
git clone https://github.com/imMamdouhaboammar/Growth-Hacker-Skills.git
cd Growth-Hacker-Skills
bash scripts/install-claude-plugin.sh install
```

Full guide: [docs/claude-plugin.md](docs/claude-plugin.md)

### Clone or reference directly

```bash
git clone https://github.com/imMamdouhaboammar/Growth-Hacker-Skills.git
```

The repository follows the Agent Skills `SKILL.md` structure and can be used by agents that read skill folders directly.

## What makes this repository different

Most skill collections stop at discovery. You pick one skill, run it, then manually move the result into another skill.

Growth Hacker Skills adds a connected layer:

```text
intent
-> main router
-> specialist node
-> approved context packet
-> next specialist node
-> quality gate
-> final deliverable
```

The router does not run every skill. It chooses the smallest useful path and carries the approved state forward.

## Neural Link Protocol

The network is defined by four files:

| File | Role |
|---|---|
| [`SKILL.md`](SKILL.md) | Main agent-agnostic router |
| [`skill-graph.json`](skill-graph.json) | Nodes, edges, inputs, outputs, and routing guards |
| [`docs/neural-linking.md`](docs/neural-linking.md) | Human-readable architecture and handoff rules |
| [`templates/growth-context.md`](templates/growth-context.md) | Shared state template for multi-skill workflows |

When file tools are available, multi-skill workflows can keep approved state in:

```text
.growth-hacker/context.md
```

The context bus stores decisions and evidence, not hidden reasoning.

It carries:

- Objective and target reader
- Source access state
- Verified facts, source claims, and inferences
- Voice and brand constraints
- Selected idea, angle, hook, and format
- Approved copy and CTA
- Completed nodes and next handoff
- Open risks and quality notes

## Connected workflow examples

### Source to editorial content pack

```text
repository, article, AI skill, tool, release, document, or screenshots
-> editorial-visual-engine
-> source integrity block
-> angle selection
-> ChatGPT Images prompts
-> Google Flow motion prompt
-> LinkedIn and X captions
-> post-scorer
```

### Idea to LinkedIn post and graphic

```text
content-matrix
-> hook-generator
-> post-writer
-> graphic-designer
-> post-scorer
```

### Research to publishable content

```text
niche-research
-> content-matrix
-> selected idea + verified source
-> editorial-visual-engine
```

### Performance to the next content cycle

```text
analytics-dashboard
-> content-matrix
-> hook-generator
-> post-writer
```

### Voice to positioning

```text
voice-builder
-> profile-optimizer
-> content-matrix
-> post-writer
```

## Skill network

### Core Network

| Skill | Purpose |
|---|---|
| [`growth-hacker-skills`](skills/growth-hacker-skills/) | Claude plugin router for connected workflows |
| [`voice-builder`](skills/voice-builder/) | Creates `about-me.md` and `voice.md` from an interview and writing samples |
| [`newsletter-voice`](skills/newsletter-voice/) | Adds newsletter-specific writing rules to the voice foundation |

### Research and Intelligence

| Skill | Purpose |
|---|---|
| [`niche-research`](skills/niche-research/) | Finds recent stories and verifies dates |
| [`analytics-dashboard`](skills/analytics-dashboard/) | Turns LinkedIn exports into a readable performance report and recommendations |
| [`content-matrix`](skills/content-matrix/) | Pairs content pillars with eight formats to generate specific ideas |

### Writing and Positioning

| Skill | Purpose |
|---|---|
| [`profile-optimizer`](skills/profile-optimizer/) | Rebuilds LinkedIn positioning and profile copy |
| [`hook-generator`](skills/hook-generator/) | Creates alternative hook directions for a topic or source |
| [`post-writer`](skills/post-writer/) | Writes LinkedIn posts using the user's voice files |
| [`post-formatter`](skills/post-formatter/) | Applies PAS, AIDA, BAB, STAR, or SLAY |

### Editorial Visuals

| Skill | Purpose |
|---|---|
| [`editorial-visual-engine`](skills/editorial-visual-engine/) | Turns links and sources into editorial visuals, captions, and motion prompts |
| [`graphic-designer`](skills/graphic-designer/) | Creates a visual direction for an already-finished post |
| [`gemini-infographic`](skills/gemini-infographic/) | Creates an explicit Gemini whiteboard infographic prompt |
| [`gemini-carousel`](skills/gemini-carousel/) | Creates explicit Gemini carousel prompts with an approval gate |
| [`quote-post`](skills/quote-post/) | Creates a quote-led post and matching visual workflow |
| [`youtube-thumbnail`](skills/youtube-thumbnail/) | Converts a video title into a thumbnail prompt |

### Video and Community

| Skill | Purpose |
|---|---|
| [`reels-scripting`](skills/reels-scripting/) | Reverse-engineers an outlier Reel and writes a new script |
| [`pinned-comment`](skills/pinned-comment/) | Writes a pinned comment and matching visual prompt |

### Quality and Performance

| Skill | Purpose |
|---|---|
| [`post-scorer`](skills/post-scorer/) | Scores publishable LinkedIn copy against the user's history |

## Editorial Visual Engine

The source-led visual workflow is the largest connected component in the repository.

It accepts:

- GitHub repositories, files, releases, issues, and pull requests
- Articles and documentation
- AI tools and AI skills
- Product and launch pages
- Uploaded documents
- Screenshots
- Existing posts

It produces:

- Source analysis
- Source Integrity Block
- 3 to 6 source-specific content angles
- Format recommendation
- English typography recommendation
- Exact on-image copy
- Safe and Experimental ChatGPT Images prompts
- Optional silent Google Flow motion prompt
- Optional LinkedIn caption
- Optional X post or thread
- QA notes

### Permanent visual references

The visual reference system includes eight editorial grammar families:

- Benchmark field guide
- Circular multi-agent map
- Launch pipeline poster
- Dark GTM architecture
- Paper step playbook
- Advisor board synthesis
- Minimal terminal poster
- Dense company org chart

Reference board:

[`skills/editorial-visual-engine/assets/reference-board.svg`](skills/editorial-visual-engine/assets/reference-board.svg)

### Permanent caption references

The skill includes 11 full caption references covering:

- Time-sensitive guides
- Operational build stories
- Tool and skill launches
- GTM workflows
- Setup walkthroughs
- Multi-agent concepts
- API access guides
- Strategic stack arguments
- Product demos
- Scheduled workflow lists
- Large skill collections

Caption corpus:

[`skills/editorial-visual-engine/references/caption-reference-corpus.md`](skills/editorial-visual-engine/references/caption-reference-corpus.md)

The corpus is used for structure, pacing, proof placement, list rhythm, and CTA shape. Facts and claims must still come from the current source.

## Routing boundaries

Use `editorial-visual-engine` when the request starts with a source and requires analysis, angle selection, source integrity, ChatGPT Images, Google Flow, or captions.

Use `graphic-designer` when a finished post already exists and only needs a matching graphic.

Use `gemini-infographic` or `gemini-carousel` only when Gemini output is explicitly requested.

Use `post-writer` for natural voice-led writing.

Use `post-formatter` when a named copy framework is required.

Use `post-scorer` only after LinkedIn copy is ready to publish.

## Distribution files

```text
SKILL.md
skill-graph.json
skills.sh.json
.claude-plugin/plugin.json
.claude-plugin/marketplace.json
scripts/install-claude-plugin.sh
scripts/validate-distribution.sh
scripts/validate-skill-graph.py
```

## Documentation

- [Neural linking architecture](docs/neural-linking.md)
- [Claude Code Plugin](docs/claude-plugin.md)
- [SKILLS.sh distribution](docs/skills-sh.md)
- [Editorial Visual Engine](skills/editorial-visual-engine/README.md)
- [Contribution guide](CONTRIBUTING.md)

## Validation

Run the complete local check:

```bash
bash validate-skills.sh
bash skills/editorial-visual-engine/scripts/validate-package.sh
python3 scripts/validate-skill-graph.py
bash scripts/validate-distribution.sh
```

GitHub Actions runs the same structural checks for pushes and pull requests.

## Author and maintenance

**Mamdouh Aboammar**

- GitHub: [@imMamdouhaboammar](https://github.com/imMamdouhaboammar)
- LinkedIn: [mamdouh-aboammar](https://www.linkedin.com/in/mamdouh-aboammar/)
- Website: [mamdouhaboammar.com](https://mamdouhaboammar.com)

Mamdouh leads the current architecture, source-led editorial workflow, Neural Link Protocol, cross-skill routing, distribution, documentation, and ongoing development of this repository.

## Attribution

This repository began from the MIT-licensed Social Media Skills project by Charlie Hills and has since been reworked and extended into Growth Hacker Skills by Mamdouh Aboammar.

See [NOTICE.md](NOTICE.md) for attribution details.

## License

MIT. See [LICENSE](LICENSE).
