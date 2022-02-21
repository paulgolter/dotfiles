if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
