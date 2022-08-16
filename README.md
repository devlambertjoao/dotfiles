# Clone your github repository

> git clone --bare  $HOME/.devlambertjoao
> source .zshrc
> dotfiles checkout
> dotfiles config --local status.showUntrackedFiles no

# Manage dotfiles
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
