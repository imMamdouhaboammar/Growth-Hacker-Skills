# Source Integrity

## Required block

Every run includes this compact block before creative work:

```text
SOURCE INTEGRITY
Source: [URL, filename, or pasted content label]
Content type: [repository, article, tool page, skill, release, document, screenshots]
Access status: [FULL, PARTIAL, FALLBACK, BLOCKED]
Accessed: [YYYY-MM-DD]

Verified from source:
- [Directly supported fact]

Claims made by the source:
- [Claim attributed to the source]

Reasonable inferences:
- [Inference and its basis]

Unavailable or unclear:
- [Missing information]

Do not state as fact:
- [Unsupported or ambiguous claim]
```

## Classification rules

### Verified from source

Use when the information is directly visible in source code, documentation, product UI, release notes, metadata, or explicit source text.

### Claims made by the source

Use for marketing claims, performance claims, audience numbers, speed statements, revenue claims, benchmark claims, and customer outcomes that the source states but the workflow did not independently verify.

Write captions as:

- `The project says...`
- `According to the release notes...`
- `The author reports...`

Do not silently promote these to independent facts.

### Reasonable inferences

An inference must name its basis. Example:

- `The repository appears aimed at growth teams because its examples focus on acquisition, enrichment, and outbound workflows.`

Do not infer:

- Product availability from a logo
- Integration support from a screenshot alone
- Performance from interface polish
- Security from popularity
- Production readiness from a demo

### Unavailable or unclear

Record missing pricing, dates, version status, licensing, setup requirements, or proof when they affect the creative.

## Design implications

- A verified fact may appear as a direct statement.
- A source claim may appear only with attribution or softer wording.
- An inference should normally stay in the analysis or caption, not become a large visual headline.
- Unavailable information must not be filled with plausible details.
