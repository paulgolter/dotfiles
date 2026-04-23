if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q fastfetch
        fastfetch
    end
end

# ALIASES
# alias ls="eza"
# alias ll="eza -alh"
# alias tree="eza --tree"
# alias cat="bat -p"
alias vim="nvim"

# Autocomplete shortcut
bind \cf forward-char

# Overwrite default greeting.
set fish_greeting

# Config alias which lets us access dotfiles git repo
# Reference: https://www.atlassian.com/git/tutorials/dotfiles
# Define the config function (if .cfg exists)
if test -d $HOME/.cfg
    function config
        git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
    end
end


# Configurate packages.
if type -q starship
    starship init fish | source
end

# Xlip Copy to clipboard shorcuts.
function toclip -d "Copy to Clipboard"
    xclip -selection c $argv
end

function fromclip -d "Paste from Clipboard"
    xclip -selection c -o $argv
end

# Environment Variables
#Poetry
if test -d ~/.local/bin
    contains ~/.local/bin $fish_user_paths; or set -Ua fish_user_paths ~/.local/bin
end

# Starship terminal prompt
# (kept here; duplicate block below was removed)

# Pyenv
if command -v pyenv
    pyenv init - fish | source
end

# Call .fishrc_cfg if exists in $HOME dir
if test -e ~/.fishrc_cfg
    source ~/.fishrc_cfg
end

