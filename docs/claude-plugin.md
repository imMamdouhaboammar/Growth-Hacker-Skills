# Claude Code Plugin

Growth Hacker Skills is distributed as a Claude Code plugin and marketplace maintained by Mamdouh Aboammar.

The plugin root contains the complete connected network:

- Specialist skills under `skills/`
- Main Claude router at `skills/growth-hacker-skills/SKILL.md`
- Canonical agent-agnostic router at `SKILL.md`
- Neural graph at `skill-graph.json`
- Shared context template at `templates/growth-context.md`
- Reference libraries, assets, scripts, and documentation

Because the marketplace plugin source is the repository root, Claude Code copies the complete package into its plugin cache. The router can therefore read the graph and shared files without depending on paths outside the plugin.

## Requirements

- A current Claude Code installation with plugin support
- Git access to the repository
- A trusted installation environment

Check the installed Claude Code version:

```bash
claude --version
```

## One-command installer

From a cloned copy of the repository:

```bash
bash scripts/install-claude-plugin.sh install
```

The installer:

1. Checks that the `claude` command is available
2. Validates `user`, `project`, or `local` scope
3. Adds the `growth-hacker-skills` marketplace when missing
4. Refreshes the marketplace when it already exists
5. Installs `growth-hacker-skills@growth-hacker-skills`
6. Preserves the configured scope

The default scope is `user`.

Use project scope:

```bash
CLAUDE_PLUGIN_SCOPE=project bash scripts/install-claude-plugin.sh install
```

Use local scope:

```bash
CLAUDE_PLUGIN_SCOPE=local bash scripts/install-claude-plugin.sh install
```

## Manual installation

Add the marketplace:

```bash
claude plugin marketplace add imMamdouhaboammar/Growth-Hacker-Skills --scope user
```

Install the plugin:

```bash
claude plugin install growth-hacker-skills@growth-hacker-skills --scope user
```

In an active Claude Code session:

```text
/reload-plugins
```

## Main router

The connected entry point is:

```text
/growth-hacker-skills:growth-hacker-skills
```

It reads the Neural Link graph and routes the request to the smallest useful chain of specialist skills.

Direct specialist examples:

```text
/growth-hacker-skills:voice-builder
/growth-hacker-skills:content-matrix
/growth-hacker-skills:post-writer
/growth-hacker-skills:editorial-visual-engine
/growth-hacker-skills:graphic-designer
/growth-hacker-skills:post-scorer
```

The skills remain model-invoked, so Claude can select them automatically from their descriptions when the user does not invoke a slash command.

## Update

```bash
bash scripts/install-claude-plugin.sh update
```

The script refreshes the marketplace and applies the current plugin version.

Manual equivalent:

```bash
claude plugin marketplace update growth-hacker-skills
claude plugin install growth-hacker-skills@growth-hacker-skills --scope user
```

Run `/reload-plugins` after updating an active session.

The plugin uses explicit semantic versioning. Future releases must update the version in:

- `.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json`
- `skill-graph.json`
- `CHANGELOG.md`

Claude Code uses the resolved version for update detection.

## Migrate from the previous plugin name

The repository previously used the `social-media-skills` marketplace and plugin identity.

The marketplace now includes a rename map, and the installer also provides an explicit migration action:

```bash
bash scripts/install-claude-plugin.sh migrate
```

Migration installs the new plugin first, then removes legacy user, project, or local entries only when they exist.

The active namespace becomes:

```text
growth-hacker-skills
```

## Validate

Run the complete validation set:

```bash
bash scripts/install-claude-plugin.sh validate
```

This executes:

```bash
claude plugin validate .
bash validate-skills.sh
bash skills/editorial-visual-engine/scripts/validate-package.sh
python3 scripts/validate-skill-graph.py
bash scripts/validate-distribution.sh
```

## Local development

Load the repository directly:

```bash
claude --plugin-dir .
```

After changing skills or manifests:

```text
/reload-plugins
```

A local `--plugin-dir` copy takes precedence over an installed marketplace copy with the same plugin name for that session.

## Uninstall

```bash
bash scripts/install-claude-plugin.sh uninstall
```

Manual equivalent:

```bash
claude plugin uninstall growth-hacker-skills@growth-hacker-skills --scope user
```

The script leaves the marketplace configured for future installation.

Remove the marketplace separately when it is no longer needed:

```bash
claude plugin marketplace remove growth-hacker-skills --scope user
```

Removing the last marketplace declaration may also remove plugins installed from it.

## Package structure

```text
.claude-plugin/
  plugin.json
  marketplace.json
skills/
  growth-hacker-skills/
    SKILL.md
  editorial-visual-engine/
    SKILL.md
  ...
SKILL.md
skill-graph.json
templates/growth-context.md
scripts/install-claude-plugin.sh
```

## Security

Claude Code plugins are trusted components. Review the repository before installation, especially scripts, hooks, MCP configuration, executables, and external service requirements.

Growth Hacker Skills primarily distributes instruction skills, references, prompt templates, and validation scripts. Some specialist skills can use services configured by the user, including Apify or Google AI.
