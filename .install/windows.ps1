# Install latest power shell
winget install --id Microsoft.Powershell --source winget

# Install 'Windows Terminal' from store 
# https://apps.microsoft.com/detail/9n0dx20hk701?rtc=1&hl=de-de&gl=DE

# Install pyenv
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

# Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Scoop
# If scoop installed as admin refer: https://github.com/ScoopInstaller/Install?tab=readme-ov-file#for-admin
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
# Non admin:
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Pipx
scoop install pipx
pipx ensurepath

# Poetry 
pipx install poetry
pipx ensurepath

# Vscode 
winget install -e --id Microsoft.VisualStudioCode

# Git 
winget install -e --id Git.Git

# Neovim
winget install Neovim.Neovim

# WSL 
# Open a admin power shell and run
wsl --install
# --> needs reboot

# Blender
winget install -e --id BlenderFoundation.Blender

# Git autcomplete for powershell 
# https://github.com/dahlbyk/posh-git
Install-Module posh-git -Scope CurrentUser -Force -AllowClobber -AllowPrerelease

# Setup powershell profle, copy from .config/windows

# Setup ssh-keys
# Setup ssh-agent: https://www.notion.so/SSH-454e27eec5ee4a2e987bf306b7965b61
# Setup gitconfig

# Path Copy
# https://github.com/clechasseur/pathcopycopy/releases

# Maxon App
# Autodesk Access
# SideFX Launcher
# Adobe Creative Cloud

# Themes
# ----------------------------------

# Terminal catppuccin theme
# https://github.com/catppuccin/windows-terminal