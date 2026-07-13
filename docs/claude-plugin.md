# Claude Code Plugin

Growth Hacker Skills can be installed as a Claude Code plugin from its own marketplace.

The plugin exposes every folder under `skills/` through the `growth-hacker-skills` namespace. The repository-level `SKILL.md` remains the main router for agent-agnostic installation through SKILLS.sh.

## Requirements

- A current Claude Code installation with plugin support
- Git access to the repository
- A trusted installation environment

Check the installed version:

```bash
claude --version
```

## One-command installer

From a cloned copy of the repository:

```bash
bash scripts/install-claude-plugin.sh install
```

The script:

1. Checks that the `claude` command is available
2. Validates the installation scope
3. Adds the `growth-hacker-skills` marketplace when missing
4. Refreshes the marketplace when it already exists
5. Installs `growth-hacker-skills@growth-hacker-skills`

The default scope is `user`.

Set another scope when required:

```bash
CLAUDE_PLUGIN_SCOPE=project bash scripts/install-claude-plugin.sh install
```

Allowed scopes are `user`, `project`, and `local`.

## Manual installation

Add the marketplace:

```bash
claude plugin marketplace add imMamdouhaboammar/Growth-Hacker-Skills --scope user
```

Install the plugin:

```bash
claude plugin install growth-hacker-skills@growth-hacker-skills --scope user
```

In an active Claude Code session, load the installed components:

```text
/reload-plugins
```

## Update

Use the repository script:

```bash
bash scripts/install-claude-plugin.sh update
```

Or update the marketplace manually, then install the current plugin version:

```bash
claude plugin marketplace update growth-hacker-skills
claude plugin install growth-hacker-skills@growth-hacker-skills --scope user
```

Run `/reload-plugins` after updating an active session.

## Validate

Validate the marketplace and plugin package from the repository root:

```bash
claude plugin validate .
```

The helper script runs the same local validation:

```bash
bash scripts/install-claude-plugin.sh validate
```

Run the repository checks as well:

```bash
bash validate-skills.sh
bash skills/editorial-visual-engine/scripts/validate-package.sh
bash scripts/validate-distribution.sh
```

## Local development

Load the repository directly without installing it:

```bash
claude --plugin-dir .
```

After modifying a skill, use:

```text
/reload-plugins
```

Plugin skills are namespaced. Examples include:

```text
/growth-hacker-skills:voice-builder
/growth-hacker-skills:post-writer
/growth-hacker-skills:editorial-visual-engine
/growth-hacker-skills:post-scorer
```

## Uninstall

```bash
bash scripts/install-claude-plugin.sh uninstall
```

Or:

```bash
claude plugin uninstall growth-hacker-skills@growth-hacker-skills --scope user
```

The installer leaves the marketplace configured. Remove it separately only when the catalog is no longer needed:

```bash
claude plugin marketplace remove growth-hacker-skills --scope user
```

## Package files

```text
.claude-plugin/plugin.json
.claude-plugin/marketplace.json
skills/*/SKILL.md
scripts/install-claude-plugin.sh
```

The plugin and marketplace versions must match. `scripts/validate-distribution.sh` checks this contract.

## Security note

Claude Code plugins are trusted components. Review the repository before installation, especially scripts, hooks, MCP configuration, executables, and external service requirements. This plugin currently distributes instruction skills and helper scripts. Some individual skills may call services configured by the user, such as Apify or Google AI.
