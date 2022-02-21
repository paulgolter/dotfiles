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

starship init fish | source
