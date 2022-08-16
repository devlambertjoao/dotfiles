# Clone your github repository

> git clone --bare https://github.com/devlambertjoao/dotfiles.git $HOME/.devlambertjoao

# Manage dotfiles
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
