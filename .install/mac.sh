#!/bin/bash
set -euo pipefail

# ── Step 0: Bootstrap dotfiles ────────────────────────────────────────────────
# Run this before anything else to deploy your shell configs.
#
#   xcode-select --install        # ensures git is available
#   git clone --bare git@github.com:paulgolter/dotfiles.git ~/.cfg
#   sh ~/.install/clone_config.sh
#
# clone_config.sh checks out all dotfiles, backs up any conflicts, and
# wires up ~/.bashrc / ~/.bash_profile / ~/.zprofile to source the _cfg files.
# ─────────────────────────────────────────────────────────────────────────────

# CLI packages refer to ubuntu.sh


# Swish https://highlyopinionated.co/swish/

# Brew cask packages
brew install --cask \
    anydesk docker karabiner-elements obs visual-studio-code \
    blender docker-desktop middleclick slack warp discord google-chrome nordvpn spotify
