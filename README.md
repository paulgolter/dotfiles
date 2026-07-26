# dotfiles

Personal dotfiles, managed as a bare git repository checked out into `$HOME`.
Reference: https://www.atlassian.com/git/tutorials/dotfiles

## Install

1. Set up ssh-keys for GitHub.
2. Run the bootstrap script (it lives in this repo, so fetch it directly on a fresh machine):

   ```sh
   curl -fsSL https://raw.githubusercontent.com/paulgolter/dotfiles/master/.install/install_config.sh | sh
   ```

   The script clones the bare repo to `~/.cfg`, checks out all dotfiles (it exits
   if conflicting files exist — resolve them manually and re-run), and wires up
   `~/.bashrc`, `~/.bash_profile`, `~/.zshrc` and `~/.zprofile` to source the
   corresponding `_cfg` files.

3. Install packages for your OS — the scripts in [.install/](.install/) are
   annotated runbooks (keychain, neovim, fish, kitty, starship, ...):
   - Ubuntu: `.install/ubuntu.sh`
   - macOS: `.install/mac.sh`
   - Windows: `.install/windows.ps1`

4. Restart your shell.

## Daily use

After install, manage dotfiles with the `config` function (defined in `.shellrc_cfg`):

```sh
config status
config add ~/.zshrc_cfg
config commit -m "update zsh config"
config push
```

## Manual setup

Equivalent of what `install_config.sh` automates:

1. `git clone --bare git@github.com:paulgolter/dotfiles.git $HOME/.cfg`
2. `alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
3. `echo ".cfg" >> ~/.gitignore`
4. `config checkout`
5. `config config --local status.showUntrackedFiles no`
