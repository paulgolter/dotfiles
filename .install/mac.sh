#!/bin/bash
set -euo pipefail

# ── Step 0: Bootstrap dotfiles ────────────────────────────────────────────────
# Run this before anything else to deploy your shell configs.
#
#   xcode-select --install        # ensures git is available
#   sh ~/.install/install_config.sh
#
# install_config.sh clones the bare repo, checks out all dotfiles (exits if
# there are conflicting files, resolve them manually), and wires up
# ~/.bashrc / ~/.bash_profile / ~/.zshrc / ~/.zprofile to source the _cfg files.
# ─────────────────────────────────────────────────────────────────────────────

# CLI packages refer to ubuntu.sh


# Swish https://highlyopinionated.co/swish/

# Brew cask packages
brew install --cask \
    anydesk docker karabiner-elements obs visual-studio-code \
    blender docker-desktop middleclick slack warp discord google-chrome nordvpn spotify
