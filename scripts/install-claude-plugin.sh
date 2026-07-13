#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-install}"
SCOPE="${CLAUDE_PLUGIN_SCOPE:-user}"
SOURCE="${CLAUDE_PLUGIN_SOURCE:-imMamdouhaboammar/Growth-Hacker-Skills}"
MARKETPLACE="growth-hacker-skills"
PLUGIN="growth-hacker-skills@${MARKETPLACE}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/install-claude-plugin.sh [install|update|validate|uninstall]

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

marketplace_exists() {
  claude plugin marketplace list --json 2>/dev/null \
    | grep -Eq '"name"[[:space:]]*:[[:space:]]*"growth-hacker-skills"'
}

validate_local_package() {
  if [[ -f "$ROOT/.claude-plugin/marketplace.json" ]]; then
    claude plugin validate "$ROOT"
  else
    echo "Local marketplace manifest not found at $ROOT/.claude-plugin/marketplace.json" >&2
    exit 1
  fi
}

install_plugin() {
  if marketplace_exists; then
    echo "Refreshing marketplace: $MARKETPLACE"
    claude plugin marketplace update "$MARKETPLACE"
  else
    echo "Adding marketplace from: $SOURCE"
    claude plugin marketplace add "$SOURCE" --scope "$SCOPE"
  fi

  echo "Installing plugin: $PLUGIN"
  claude plugin install "$PLUGIN" --scope "$SCOPE"
  echo "Installed $PLUGIN at $SCOPE scope."
  echo "Run /reload-plugins in an active Claude Code session."
}

update_plugin() {
  if ! marketplace_exists; then
    echo "Marketplace is not configured yet. Running installation first."
    install_plugin
    return
  fi

  claude plugin marketplace update "$MARKETPLACE"
  claude plugin install "$PLUGIN" --scope "$SCOPE"
  echo "Updated $PLUGIN."
  echo "Run /reload-plugins in an active Claude Code session."
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
