# ~/.bashrc — Bash interactive shell configuration
# Ported from fish shell config (.config/fish/config.fish + .fishrc)

# Only run for interactive shells
[[ $- != *i* ]] && return

# ──────────────────────────────────────────────────────
# PATH
# ──────────────────────────────────────────────────────

[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

# ──────────────────────────────────────────────────────
# SSH AGENT
# Ported from .fishrc: keychain manages ssh-agent reuse
# across sessions for github.com and gitlab.com keys.
# ──────────────────────────────────────────────────────

eval "$(keychain --eval --agents ssh github.com gitlab.com)"

# ──────────────────────────────────────────────────────
# ALIASES
# ──────────────────────────────────────────────────────

# alias ls="exa"
# alias ll="exa -alh"
# alias tree="exa --tree"
# alias cat="bat -p"
alias vim="nvim"

# ──────────────────────────────────────────────────────
# READLINE
# ──────────────────────────────────────────────────────

# Ctrl+F: accept the next character of the current suggestion (like fish)
bind '"\C-f": forward-char'

# ──────────────────────────────────────────────────────
# FUNCTIONS
# ──────────────────────────────────────────────────────

# Config alias for dotfiles bare git repository
# Reference: https://www.atlassian.com/git/tutorials/dotfiles
if [[ -d "$HOME/.cfg" ]]; then
    config() {
        git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
    }
fi

# Bootstrap dotfiles repo on a new machine
cloneconfig() {
    if [[ -d "$HOME/.cfg" ]]; then
        echo "Dotfiles repo already exists at $HOME/.cfg"
    else
        echo "Cloning dotfiles repo..."
        git clone --bare git@github.com:paulgolter/dotfiles.git "$HOME/.cfg"
        echo "Dotfiles repo cloned."

        config() {
            git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
        }

        config config --local status.showUntrackedFiles no
        echo "'config' command is now available."
    fi
}

# Clipboard shortcuts (requires xclip)
toclip() {
    xclip -selection c "$@"
}

fromclip() {
    xclip -selection c -o "$@"
}

# ──────────────────────────────────────────────────────
# TOOL INITIALISATION
# ──────────────────────────────────────────────────────

# Pyenv
if command -v pyenv &>/dev/null; then
    eval "$(pyenv init - bash)"
fi

# Starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# ──────────────────────────────────────────────────────
# STARTUP
# ──────────────────────────────────────────────────────

command -v neofetch &>/dev/null && neofetch
