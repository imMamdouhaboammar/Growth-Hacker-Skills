# Neural Linking Architecture

Growth Hacker Skills is not a loose folder of prompts. It is a routed network of specialist skills connected by shared state, explicit handoff contracts, and quality gates.

The network is defined in `skill-graph.json` and coordinated by the repository-level `SKILL.md`.

## Why this layer exists

A normal skill collection often loses context between steps:

- Research produces facts that writing does not reuse
- Writing changes the angle without updating the visual
- The visual repeats claims that were never verified
- Captions ignore the user's voice profile
- Performance feedback never reaches the next content plan

The Neural Link Protocol prevents those breaks by treating every skill as a node in one content workflow.

## The five layers

### 1. Intent Router

`growth-hacker-skills` identifies the final deliverable and chooses the smallest useful path through the network.

It selects one primary node and adds supporting nodes only when they produce a required artifact.

### 2. Context Bus

For multi-skill workflows, approved state is carried through a shared context object.

When file tools are available, the runtime location is:

```text
.growth-hacker/context.md
```

The template is:

```text
templates/growth-context.md
```

The context bus stores decisions, not hidden reasoning. It carries approved objectives, verified facts, voice rules, brand rules, selected angles, copy, visual directions, and unresolved risks.

### 3. Specialist Nodes

Each folder under `skills/` owns one capability.

A node must:

1. Read the inputs declared in `skill-graph.json`
2. Follow its own `SKILL.md`
3. Produce the declared outputs
4. Update the context bus only with approved or clearly labelled state
5. Hand off to the next node without making it repeat completed work

### 4. Quality Gates

Quality nodes and stage checks protect the workflow:

- Source integrity before visual claims
- Voice checks before publishing copy
- Approval before locking creative direction
- Text fidelity before image generation
- `post-scorer` only after LinkedIn copy is publishable
- Final alignment between caption, visual, source, and CTA

### 5. Feedback Loop

Performance findings can return to ideation without rewriting the entire workflow.

Example:

```text
analytics-dashboard
-> content-matrix
-> hook-generator
-> post-writer
-> post-scorer
```

The feedback loop carries proven patterns and revision priorities. It does not copy past posts mechanically.

## Core artifact contracts

| Artifact | Created by | Consumed by |
|---|---|---|
| `about-me.md` | voice-builder | profile-optimizer, content-matrix, post-writer, editorial-visual-engine |
| `voice.md` | voice-builder | newsletter-voice, post-writer, post-formatter, editorial-visual-engine, reels-scripting |
| Research notes | niche-research | content-matrix, post-writer, editorial-visual-engine |
| Selected idea | content-matrix | hook-generator, post-writer, post-formatter, editorial-visual-engine |
| Selected hook | hook-generator | post-writer, post-formatter, editorial-visual-engine |
| Source analysis | editorial-visual-engine | post-writer, post-formatter, image and motion prompt stages |
| Publishable LinkedIn copy | post-writer, post-formatter, editorial-visual-engine | post-scorer |
| Performance report | analytics-dashboard | content-matrix, hook-generator |

## Routing patterns

### Source to complete editorial asset

```text
source
-> editorial-visual-engine
-> post-writer or post-formatter when caption support is needed
-> post-scorer
```

### Idea to post and graphic

```text
content-matrix
-> hook-generator
-> post-writer
-> graphic-designer
-> post-scorer
```

### Research to campaign content

```text
niche-research
-> content-matrix
-> selected idea + source
-> editorial-visual-engine
```

### Voice to positioning and publishing

```text
voice-builder
-> profile-optimizer
-> content-matrix
-> post-writer
```

### Performance to next content cycle

```text
analytics-dashboard
-> content-matrix
-> hook-generator
-> post-writer
```

## Handoff packet

Every edge carries a compact packet containing the fields that matter to the next node:

```text
objective
audience
source and evidence
selected angle
voice constraints
brand constraints
approved hook or headline
platform and format
CTA decision
open risks
completed stages
```

The receiving node must use this packet before asking new questions.

## Anti-loop rules

The network must not become an endless chain.

- Maximum specialist hops per workflow: 5
- A node may repeat only after user revision or a failed quality gate
- Approved facts are carried forward, not researched again
- Approved copy is not silently replaced by a later node
- One node owns each stage
- A visual tool cannot rewrite the source claim set
- A scoring tool cannot become the main writer

## Source integrity boundary

The source-led workflow distinguishes:

- Verified facts visible in the source
- Claims made by the source
- Reasonable inferences
- Missing or unverified information

Every downstream node receives the same distinction. This prevents a visual or caption from converting an inference into a fact.

## Voice and reference boundary

Voice files describe how the user writes.

Reference libraries describe structure, rhythm, visual grammar, and layout logic.

A reference never supplies personal experience, claims, identity, dates, metrics, links, or product capabilities for a new output.

## Agent-agnostic behaviour

The graph describes capabilities, not vendor APIs.

Agents should use the strongest available tools for:

- Public web access
- Repository reading
- File reading and writing
- Structured questions
- Image generation
- Data analysis

When a named tool is unavailable, the agent preserves the node contract and uses the closest supported method.

## Validation

Run:

```bash
python3 scripts/validate-skill-graph.py
```

The validator checks:

- Unique node IDs
- Existing skill paths
- Valid edge endpoints
- No self-links
- Router reachability
- Context template existence
- Root and Claude plugin router parity

The graph is also checked by the distribution CI workflow.
