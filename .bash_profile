# ~/.bash_profile — Bash login shell configuration
#
# On Linux, login shells do NOT source ~/.bashrc automatically.
# This file bridges that gap and handles login-only setup.

# ──────────────────────────────────────────────────────
# Source .bashrc for interactive configuration
# ──────────────────────────────────────────────────────

[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# ──────────────────────────────────────────────────────
# macOS: Homebrew (only when running on macOS)
# ──────────────────────────────────────────────────────

if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ──────────────────────────────────────────────────────
# Pyenv — login-shell PATH setup
# (ensures pyenv shims are on PATH before .bashrc runs)
# ──────────────────────────────────────────────────────

export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
