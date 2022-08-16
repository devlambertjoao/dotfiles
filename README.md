# Clone your github repository

- git clone --bare git@github.com:devlambertjoao/dotfiles.git $HOME/.devlambertjoao
- source .zshrc
- dotfiles checkout --force
- dotfiles config --local status.showUntrackedFiles no

# Manage dotfiles
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
