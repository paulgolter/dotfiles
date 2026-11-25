# Windows dev setup
# Run as a normal (non-admin) user:
#   powershell -ExecutionPolicy Bypass -File .\windows-setup.ps1
# Elevated steps are batched at the end behind a single UAC prompt.

function Update-SessionPath {
  $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
              [Environment]::GetEnvironmentVariable('Path', 'User')
}

# ----------------------------------
# Packages (winget)
# Git for Windows also gives Claude Code its Bash tool (Git Bash)
# Machine-wide installers (Git, 7-Zip, ...) raise their own UAC prompt
# ----------------------------------
$pkgs = @(
  # Shell / terminal
  'Microsoft.PowerShell'
  'Microsoft.WindowsTerminal'

  # CLI toolbelt
  'Git.Git'
  'BurntSushi.ripgrep.MSVC'
  'sharkdp.fd'
  'jqlang.jq'
  'MikeFarah.yq'
  'GitHub.cli'
  '7zip.7zip'
  'ezwinports.make'
  'Gyan.FFmpeg'

  # Languages
  'astral-sh.uv'
  'CoreyButler.NVMforWindows'

  # Editors / apps
  'Microsoft.VisualStudioCode'
  'Neovim.Neovim'
  'BlenderFoundation.Blender'
)
foreach ($p in $pkgs) {
  winget install --id $p --exact --source winget --accept-package-agreements --accept-source-agreements
}
Update-SessionPath

# ----------------------------------
# Python (uv manages interpreters and tools)
# ----------------------------------
# uv python install 3.11
# uv tool install <tool>

# ----------------------------------
# Node (nvm-windows)
# ----------------------------------
nvm install lts

# ----------------------------------
# PowerShell 7 modules
# Run through pwsh so the module lands in the PowerShell 7 module path
# ----------------------------------
# Git autocomplete: https://github.com/dahlbyk/posh-git
pwsh -NoProfile -Command "Install-Module posh-git -Scope CurrentUser -Force -AllowClobber"

# Setup PowerShell profile: copy .config/windows/Microsoft.PowerShell_profile.ps1 to $profile

# ----------------------------------
# Elevated steps (one UAC prompt)
# - nvm use: nvm-windows creates a symlink, needs admin
# - wsl --install: needs a reboot afterwards, so it runs last
# ----------------------------------
Start-Process powershell -Verb RunAs -Wait -ArgumentList @(
  '-NoProfile', '-Command',
  'nvm use newest; wsl --install; Read-Host "Done. Reboot to finish WSL setup. Press Enter to close"'
)

# ----------------------------------
# Manual steps
# ----------------------------------
# SSH keys
# ssh-agent: https://www.notion.so/SSH-454e27eec5ee4a2e987bf306b7965b61
# gitconfig
# GitHub CLI login: gh auth login
#
# Path Copy: https://github.com/clechasseur/pathcopycopy/releases
#
# Maxon App
# Autodesk Access
# SideFX Launcher
# Adobe Creative Cloud
#
# Themes
# Windows Terminal catppuccin: https://github.com/catppuccin/windows-terminal
