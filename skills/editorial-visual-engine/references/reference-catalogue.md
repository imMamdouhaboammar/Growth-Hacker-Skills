# Permanent Reference Catalogue

## Reference board

Open `../assets/reference-board.svg` to inspect the permanent visual board.

The board contains eight supplied references, indexed in reading order:

1. Benchmark field guide
2. Circular multi-agent map
3. Launch pipeline poster
4. Dark GTM architecture
5. Paper step playbook
6. Advisor board synthesis
7. Minimal terminal poster
8. Dense company org chart

The semantic definitions and use rules live in `visual-style-library.md`.

## How to use references

For every final prompt, name the selected style ID and translate it into explicit layout instructions. Do not rely on a model understanding the ID alone.

Good:

- `Use EV-02 as the visual grammar: one central output card, five agent nodes on a dotted orbit, role labels in rounded purple pills, and short descriptions outside the circle.`

Bad:

- `Make it like reference 2.`

## Permanent versus run-only references

When a user supplies a new visual reference, classify it:

- `RUN-ONLY`: use for the current output and do not change this catalogue
- `PERMANENT`: add a new ID, analysis, best-use list, density level, and compatibility rules

Never overwrite an existing style ID with a new reference.

## Reference analysis fields

A permanent reference entry must include:

- ID and name
- Canvas ratio
- Background treatment
- Grid or composition
- Headline treatment
- Card or diagram grammar
- Icon or illustration grammar
- Palette
- Density
- Best uses
- Misuse risks
- Compatible styles

## Attribution and originality

The references are inspiration for editorial grammar. Do not copy:

- Creator names or portraits
- Brand marks
- Exact headlines
- Exact layouts
- Distinctive mascots
- Product screenshots that belong to another company

Replace source-specific identity with the current source's verified assets or neutral editorial elements.
