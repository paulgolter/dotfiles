https://www.atlassian.com/git/tutorials/dotfiles


1. Setup ssh-keys
2. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`
3. `echo ".cfg" >> .gitignore`
4. `git clone --bare git@github.com:paulgolter/dotfiles.git $HOME/.cfg`
5. `config checkout`
6. `config config --local status.showUntrackedFiles no`
