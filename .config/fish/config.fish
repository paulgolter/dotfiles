if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q neofetch
        neofetch
    end
end

# ALIASES
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias cat="bat -p"
alias vim="nvim"

# Autocomplete shortcut
bind \cf forward-char

# Overwrite default greeting.
set fish_greeting

# Blender shortcuts.
function bdir
	cd ~/dev/projects/blender-git/blender
end

function bconfig
	cd ~/.config/blender
end

function bscripts
	cd ~/.config/blender/3.2/scripts
end

function baddons
	cd ~/.config/blender/3.2/scripts/addons
end

# Config alias which lets us access dotfiles git repo
# Reference: https://www.atlassian.com/git/tutorials/dotfiles
function config
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
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
if command -v starship
    starship init fish | source
end

# Call .fishrc if exists in $HOME dir
if test -e ~/.fishrc
    source ~/.fishrc
end
