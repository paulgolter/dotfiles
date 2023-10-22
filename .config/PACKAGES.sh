# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt install neovim

# Install language servers.
sudo apt install clang
sudo apt install clangd
# Python language server for vim.
sudo snap install pylsp

# Fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt install fish

# Terminal Emulator
sudo apt install kitty
# sudo update-alternatives --config x-terminal-emulator

# Terminal prompt starship
# https://github.com/starship/starship#-installation
# curl -sS https://starship.rs/install.sh | sh

sudo apt install neofetch

# Exa (Rust version of ls)
sudo apt install exa

# Bat (Nicer version of cat)
sudo apt install bat

# diff-so-fancy
sudo apt install diff-so-fancy

# To replace the git-diff command:
# https://github.com/so-fancy/diff-so-fancy#with-git

# Window manager
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps

sudo apt install rofi
sudo apt install demenu

# Window compositor
sudo apt install compton

# Bars
sudo apt install polybar

# THEMES AND FONTS
# --------------------------

# Papirus icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Papirus change folder color
sudo apt-get install papirus-folders
papirus-folders -C palebrown

# Download Nerd Fonts.
# git clone https://github.com/ryanoasis/nerd-fonts.git ~/dev/build/nerd-fonts
# --> FiraCode Nerd Font Mono Regular

# Gnome tweak
# sudo apt install gnome-tweaks

# Dracula
# https://draculatheme.com/gtk
# Download GTK dracula theme: https://github.com/dracula/gtk/tags move to:  sudo mv Downloads/dracula-theme /usr/share/themes/
# Download Wallpaper: https://draculatheme.com/wallpaper

# Catppuccin
# https://github.com/catppuccin/gtk
