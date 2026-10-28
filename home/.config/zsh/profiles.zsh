# Work vs. personal profiles
#
# Anything under one of these paths is "work"; everything else is "personal".
# Sourced by .zshrc and ~/.local/bin/dev so there is one source of truth.

work_path_prefixes=(
  "$HOME/src/github.com/bluebottlecoffee/"
  "$HOME/Documents/Blue Bottle/"
)

# Claude config dir for the personal account; work uses the default ~/.claude
personal_claude_config_dir="$HOME/.claude-personal"

# Prints "work" or "personal" for the given path (defaults to $PWD)
profile_for_path() {
  local target_path="${1:-$PWD}/"
  local work_prefix
  for work_prefix in "${work_path_prefixes[@]}"; do
    if [[ "$target_path" == "$work_prefix"* ]]; then
      echo "work"
      return
    fi
  done
  echo "personal"
}

# Picks the Claude account based on the current directory, unless
# CLAUDE_CONFIG_DIR is already set explicitly.
claude() {
  if [[ -z "${CLAUDE_CONFIG_DIR:-}" && "$(profile_for_path)" == "personal" ]]; then
    CLAUDE_CONFIG_DIR="$personal_claude_config_dir" command claude "$@"
  else
    command claude "$@"
  fi
}
