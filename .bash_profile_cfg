# ~/.bash_profile — Bash login shell configuration
#
# On Linux, login shells do NOT source ~/.bashrc automatically.
# This file bridges that gap and handles login-only setup.

# ──────────────────────────────────────────────────────
# Pyenv — login-shell PATH setup
# Must come before sourcing .bashrc so pyenv shims are
# on PATH when .bashrc runs `pyenv init`.
# ──────────────────────────────────────────────────────

export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

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
