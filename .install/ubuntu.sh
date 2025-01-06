# Setup git bare repository
# https://www.atlassian.com/git/tutorials/dotfiles
# echo ".cfg" >> .gitignore
# git clone --bare git@github.com:paulgolter/dotfiles.git $HOME/.cfg
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config checkout
# config config --local status.showUntrackedFiles no


# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

# Open neovim and run
# :PlugInstall

# Install language servers.
sudo apt install clang
sudo apt install clangd

# Python language server for vim.
sudo snap install pylsp

# Fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y
# chsh -s $(which fish)

# Terminal Emulator
sudo apt install kitty
# sudo update-alternatives --config x-terminal-emulator

# Terminal prompt starship
# https://github.com/starship/starship#-installation
# curl -sS https://starship.rs/install.sh | sh

sudo apt install neofetch -y

# Exa (Rust version of ls)
sudo apt install exa -y

# Bat (Nicer version of cat)
sudo apt install bat -y
# Might be necesaary on some distros:
# mkdir -p ~/.local/bin
# ln -s /usr/bin/batcat ~/.local/bin/bat

# Nice command line performance monitor
sudo apt install btop -y

# Command line tool for fuzzy searching files
sudo apt install fzf -y

# Midnight commander
sudo apt install mc -y

# Ripgrep, faster then grep more features
sudo apt install ripgrep -y

# diff-so-fancy
# sudo apt install diff-so-fancy -y
sudo snap install diff-so-fancy -y

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

# Docker
# https://docs.docker.com/engine/install/ubuntu
# For vscode docker wsl integration:
# https://docs.docker.com/engine/install/linux-postinstall

# Ffmpeg
sudo apt install ffmpeg

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
# --> JetBrainsMono

# Gnome tweak
# sudo apt install gnome-tweaks

# Dracula
# https://draculatheme.com/gtk
# Download GTK dracula theme: https://github.com/dracula/gtk/tags move to:  sudo mv Downloads/dracula-theme /usr/share/themes/
# Download Wallpaper: https://draculatheme.com/wallpaper

# Catppuccin
# https://github.com/catppuccin/gtk
