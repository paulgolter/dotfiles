#!/bin/bash
set -euo pipefail

# ── Step 0: Bootstrap dotfiles ────────────────────────────────────────────────
# Run this before anything else to deploy your shell configs (see README.md):
#
#   sudo apt install git
#   curl -fsSL https://raw.githubusercontent.com/paulgolter/dotfiles/master/.install/install_config.sh | sh
#
# install_config.sh clones the bare repo, checks out all dotfiles (exits if
# there are conflicting files, resolve them manually), and wires up
# ~/.bashrc / ~/.bash_profile / ~/.zshrc / ~/.zprofile to source the _cfg files.
# ─────────────────────────────────────────────────────────────────────────────

# Keychain
sudo apt install keychain

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

# Open neovim and run :MasonInstallAll
# https://nvchad.com/docs/quickstart/install


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

sudo apt install fastfetch -y

# Eza (actively maintained fork of archived exa)
sudo apt install eza -y

# Bat (Nicer version of cat)
sudo apt install bat -y
# Might be necessary on some distros:
# mkdir -p ~/.local/bin
# ln -s /usr/bin/batcat ~/.local/bin/bat

# Nice command line performance monitor
sudo apt install btop -y

# Command line tool for fuzzy searching files
sudo apt install fzf -y

# Midnight commander
sudo apt install mc -y

# Ripgrep, faster than grep with more features
sudo apt install ripgrep -y

# diff-so-fancy
# sudo apt install diff-so-fancy -y
sudo snap install diff-so-fancy

# To replace the git-diff command:
# https://github.com/so-fancy/diff-so-fancy#with-git

# Window manager (gap support built into i3 since v4.22)
sudo apt install i3

sudo apt install rofi
sudo apt install dmenu

# Window compositor
sudo apt install picom

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

# pyenv
# https://github.com/pyenv/pyenv
sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl -fsSL https://pyenv.run | bash
# After install, restart your shell or source ~/.bash_profile to activate pyenv.

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
