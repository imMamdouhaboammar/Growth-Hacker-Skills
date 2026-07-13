# Source Access and Retry Policy

## Principle

Use the strongest source-reading capability available in the current agent environment. The skill is agent-agnostic, so tool names differ. Judge methods by what they can retrieve, not by brand.

## Retry sequence

Attempt up to five materially different methods:

1. **Direct document access**
   - Open the supplied URL or uploaded file.
   - Extract readable text, headings, tables, metadata, and visible media descriptions.

2. **Rendered page access**
   - Use a browser, page renderer, or screenshot-capable tool when the direct response is incomplete, script-heavy, or visually structured.

3. **Source-specific connector**
   - For GitHub, use repository, file, release, issue, and pull request tools.
   - For document platforms, use the matching connector when available.

4. **Alternate representation**
   - Try a raw file, print view, reader view, source view, documentation path, release page, or a directly linked file from the same source.

5. **Internal source traversal**
   - Follow only the source's own relevant links, files, documentation, examples, releases, or package metadata.
   - This remains source-only analysis because the material belongs to the submitted source.

Do not repeat the same failed request with a renamed tool or cosmetic URL change.

## GitHub depth rules

When repository tools are available, inspect the smallest useful set:

- README and repository description
- Documentation index or `docs/`
- Package metadata such as `package.json`, `pyproject.toml`, `Cargo.toml`, or manifest files
- Main entry points
- Examples or demos
- Releases or changelog
- Skill definitions when the repository contains AI skills
- Tests only when they clarify actual behaviour or supported inputs

Do not claim the whole repository was analysed when only the README was available.

## Access result labels

Use one label:

- `FULL`: primary content and necessary supporting files were read
- `PARTIAL`: enough content was read to proceed, but some source areas were unavailable
- `FALLBACK`: analysis relies on pasted text, uploaded files, or screenshots
- `BLOCKED`: no usable source content was obtained

## Fallback message

When blocked, offer all options at once:

> I could not obtain usable content after several different access attempts. Send any one of these: pasted text, an uploaded file, screenshots, or a raw file URL. I will continue from the same workflow.

## Source-only boundary

Allowed:

- Files and pages inside the submitted repository or site
- Documentation, examples, releases, and changelogs belonging to the source
- User-supplied screenshots, files, or pasted text

Not allowed unless the user changes mode:

- Search-engine results about the source
- Third-party reviews
- Competitor research
- Independent fact checking
- Social posts that are not part of the submitted source
