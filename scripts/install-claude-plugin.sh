#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-install}"
SCOPE="${CLAUDE_PLUGIN_SCOPE:-user}"
SOURCE="${CLAUDE_PLUGIN_SOURCE:-imMamdouhaboammar/Growth-Hacker-Skills}"
MARKETPLACE="growth-hacker-skills"
PLUGIN="growth-hacker-skills@${MARKETPLACE}"
LEGACY_MARKETPLACE="social-media-skills"
LEGACY_PLUGIN="social-media-skills@${LEGACY_MARKETPLACE}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install-claude-plugin.sh install
  bash scripts/install-claude-plugin.sh update
  bash scripts/install-claude-plugin.sh migrate
  bash scripts/install-claude-plugin.sh validate
  bash scripts/install-claude-plugin.sh uninstall

Environment variables:
  CLAUDE_PLUGIN_SCOPE   user, project, or local. Default: user
  CLAUDE_PLUGIN_SOURCE  GitHub owner/repo, git URL, or local path.
                        Default: imMamdouhaboammar/Growth-Hacker-Skills
EOF
}

require_claude() {
  if ! command -v claude >/dev/null 2>&1; then
    echo "Claude Code is not installed or is not available in PATH." >&2
    echo "Install or update Claude Code, then run this script again." >&2
    exit 1
  fi
}

validate_scope() {
  case "$SCOPE" in
    user|project|local) ;;
    *)
      echo "Invalid CLAUDE_PLUGIN_SCOPE: $SCOPE" >&2
      echo "Allowed values: user, project, local" >&2
      exit 1
      ;;
  esac
}

marketplace_json() {
  claude plugin marketplace list --json 2>/dev/null || printf '[]\n'
}

marketplace_exists() {
  local name="$1"
  marketplace_json | grep -Eq '"name"[[:space:]]*:[[:space:]]*"'"$name"'"'
}

add_or_refresh_marketplace() {
  if marketplace_exists "$MARKETPLACE"; then
    echo "Refreshing marketplace: $MARKETPLACE"
    claude plugin marketplace update "$MARKETPLACE"
  else
    echo "Adding marketplace from: $SOURCE"
    claude plugin marketplace add "$SOURCE" --scope "$SCOPE"
  fi
}

install_plugin() {
  add_or_refresh_marketplace

  echo "Installing plugin: $PLUGIN"
  claude plugin install "$PLUGIN" --scope "$SCOPE"
  echo "Installed $PLUGIN at $SCOPE scope."
  echo "Run /reload-plugins in an active Claude Code session."
}

update_plugin() {
  add_or_refresh_marketplace

  echo "Applying the current plugin version: $PLUGIN"
  claude plugin install "$PLUGIN" --scope "$SCOPE"
  echo "Updated $PLUGIN."
  echo "Run /reload-plugins in an active Claude Code session."
}

migrate_plugin() {
  echo "Installing the Growth Hacker Skills plugin before removing legacy entries."
  install_plugin

  if marketplace_exists "$LEGACY_MARKETPLACE"; then
    echo "Removing the legacy plugin when present: $LEGACY_PLUGIN"
    claude plugin uninstall "$LEGACY_PLUGIN" --scope "$SCOPE" 2>/dev/null || true

    echo "Removing legacy marketplace declaration: $LEGACY_MARKETPLACE"
    claude plugin marketplace remove "$LEGACY_MARKETPLACE" --scope "$SCOPE" 2>/dev/null || true
  else
    echo "No legacy marketplace declaration found."
  fi

  echo "Migration complete. The active namespace is growth-hacker-skills."
  echo "Run /reload-plugins in an active Claude Code session."
}

validate_local_package() {
  echo "Validating Claude plugin and marketplace manifests."
  claude plugin validate "$ROOT"

  echo "Validating specialist skill frontmatter and structure."
  bash "$ROOT/validate-skills.sh"

  echo "Validating Editorial Visual Engine package."
  bash "$ROOT/skills/editorial-visual-engine/scripts/validate-package.sh"

  echo "Validating Neural Link graph."
  python3 "$ROOT/scripts/validate-skill-graph.py"

  echo "Validating distribution files."
  bash "$ROOT/scripts/validate-distribution.sh"
}

uninstall_plugin() {
  claude plugin uninstall "$PLUGIN" --scope "$SCOPE"
  echo "Uninstalled $PLUGIN from $SCOPE scope."
  echo "The marketplace remains configured for future installs."
}

require_claude
validate_scope

case "$ACTION" in
  install)
    install_plugin
    ;;
  update)
    update_plugin
    ;;
  migrate)
    migrate_plugin
    ;;
  validate)
    validate_local_package
    ;;
  uninstall)
    uninstall_plugin
    ;;
  help|-h|--help)
    usage
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
