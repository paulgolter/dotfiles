#!/bin/sh
# Bootstrap the dotfiles bare git repository and wire up shell config files.
# Reference: https://www.atlassian.com/git/tutorials/dotfiles
#
# Usage:
#   sh ~/.install/install_config.sh
#
# What this script does:
#   1. Clones the bare dotfiles repo to ~/.cfg (skips if already present)
#   2. Checks out dotfiles; exits with a clear message if there are conflicts
#   3. Creates ~/.bashrc, ~/.bash_profile and ~/.zprofile if missing, then
#      appends a source line for the respective _cfg file to each (idempotent)

set -eu

REPO="git@github.com:paulgolter/dotfiles.git"
CFG_DIR="$HOME/.cfg"

cfg() {
    git --git-dir="$CFG_DIR" --work-tree="$HOME" "$@"
}

# Append LINE to FILE if not already present; creates FILE if it does not exist.
append_if_missing() {
    _file="$1"
    _line="$2"
    if ! grep -qF "$_line" "$_file" 2>/dev/null; then
        printf '\n%s\n' "$_line" >> "$_file"
        echo "  added to $_file"
    else
        echo "  already present in $_file — skipped"
    fi
}

# ── 1. Clone ──────────────────────────────────────────────────────────────────

if [ -d "$CFG_DIR" ]; then
    echo "Dotfiles repo already exists at $CFG_DIR — skipping clone."
else
    echo "Cloning dotfiles repo..."
    git clone --bare "$REPO" "$CFG_DIR"
    echo "Cloned."
fi

# ── 2. Checkout ───────────────────────────────────────────────────────────────

echo "Checking out dotfiles..."

if ! cfg checkout; then
    echo ""
    echo "Checkout failed due to conflicting files (listed above)."
    echo "Resolve them manually, then re-run this script."
    exit 1
fi

cfg config --local status.showUntrackedFiles no
echo "Checkout complete."

# ── 3. Wire up shell config files ─────────────────────────────────────────────

echo ""
echo "Wiring up shell config files..."

# Bash — interactive shell
append_if_missing "$HOME/.bashrc" \
    '[ -f ~/.bashrc_cfg ] && . ~/.bashrc_cfg'

# Bash — login shell
append_if_missing "$HOME/.bash_profile" \
    '[ -f ~/.bash_profile_cfg ] && . ~/.bash_profile_cfg'

# Zsh — interactive shell
append_if_missing "$HOME/.zshrc" \
    '[ -f ~/.zshrc_cfg ] && . ~/.zshrc_cfg'

# Zsh — login shell (macOS)
append_if_missing "$HOME/.zprofile" \
    '[ -f ~/.zprofile_cfg ] && . ~/.zprofile_cfg'

echo ""
echo "Done! Restart your shell or run: . ~/.bashrc  (bash) / . ~/.zshrc  (zsh)"
