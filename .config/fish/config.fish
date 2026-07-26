# ~/.config/fish/config.fish — Fish shell configuration
# Fish cannot source POSIX scripts, so this mirrors what
# .shellrc_cfg / .zprofile_cfg provide for bash and zsh.

# ──────────────────────────────────────────────────────
# macOS: Homebrew (only when running on macOS)
# Must come first so brew-installed tools (starship,
# keychain, ...) are found below.
# ──────────────────────────────────────────────────────

if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end

# ──────────────────────────────────────────────────────
# PATH
# ──────────────────────────────────────────────────────

if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end

# ──────────────────────────────────────────────────────
# ALIASES
# ──────────────────────────────────────────────────────

# alias ls="eza"
# alias ll="eza -alh"
# alias tree="eza --tree"
# alias cat="bat -p"
alias vim="nvim"

# ──────────────────────────────────────────────────────
# KEY BINDINGS
# ──────────────────────────────────────────────────────

# Ctrl+F: accept the next character of the current suggestion
bind \cf forward-char

# ──────────────────────────────────────────────────────
# FUNCTIONS
# ──────────────────────────────────────────────────────

# Config alias for dotfiles bare git repository
# Reference: https://www.atlassian.com/git/tutorials/dotfiles
if test -d $HOME/.cfg
    function config
        git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
    end
end

# Bootstrap dotfiles repo on a new machine
# Full logic lives in .install/install_config.sh
function cloneconfig
    sh $HOME/.install/install_config.sh
end

# Clipboard shortcuts (xclip on Linux, pbcopy/pbpaste on macOS)
if type -q pbcopy
    function toclip -d "Copy to Clipboard"
        pbcopy $argv
    end

    function fromclip -d "Paste from Clipboard"
        pbpaste $argv
    end
else
    function toclip -d "Copy to Clipboard"
        xclip -selection c $argv
    end

    function fromclip -d "Paste from Clipboard"
        xclip -selection c -o $argv
    end
end

# ──────────────────────────────────────────────────────
# SSH AGENT
# keychain manages ssh-agent reuse across sessions.
# ──────────────────────────────────────────────────────

if status is-interactive; and type -q keychain
    eval (keychain --eval --agents ssh github.com gitlab.com)
end

# ──────────────────────────────────────────────────────
# TOOL INITIALISATION
# ──────────────────────────────────────────────────────

# Pyenv — bootstrap PATH first (Linux installs to ~/.pyenv/bin),
# then init shims.
set -gx PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT/bin
    fish_add_path $PYENV_ROOT/bin
end
if command -q pyenv
    pyenv init - fish | source
end

# fnm (Node version manager)
if type -q fnm
    fnm env | source
end

# Starship prompt
if type -q starship
    starship init fish | source
end

# ──────────────────────────────────────────────────────
# STARTUP
# ──────────────────────────────────────────────────────

# Overwrite default greeting.
set fish_greeting

if status is-interactive
    if type -q fastfetch
        fastfetch
    end
end
