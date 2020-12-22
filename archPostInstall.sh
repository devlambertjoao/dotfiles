#!/bin/bash
echo "Instalando pacotes"
sudo pacman -Sy nodejs yarn npm maven the_silver_searcher zsh docker minikube kubectl adb ctags notepadqq tmux aspnet-runtime dotnet-sdk python python-pip ruby sqlite

echo "Instalando e configurando docker"
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 777 /var/run/docker.sock

echo "Configurando teclado para br"
setxkbmap br
localectl --no-convert set-x11-keymap br

echo "Vim plug e configurações do nvim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo rm ~/.vimrc && wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.vimrc

mkdir -p ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

echo "{" > ~/.vim/coc-settings.json
echo "  \"eslint.autoFixOnSave\": \"true\", " >> ~/.vim/coc-settings.json
echo "  \"java.jdt.ls.vmargs\": \"-javaagent: /home/lambert/.vim/lombok.jar\" " >> ~/.vim/coc-settings.json
echo "}" >> ~/.vim/coc-settings.json

wget https://projectlombok.org/downloads/lombok.jar -P ~/.vim/
pip3 install pynvim

echo "Instalando nerd fonts"
cd
mkdir Downloads && cd Downloads
git clone https://aur.archlinux.org/nerd-fonts-hack.git && cd nerd-fonts-hack && makepkg --syncdeps && sudo pacman -U nerd-fonts-hack-*
cd 

sudo mkdir -p /usr/lib/jvm
sudo mv ~/Downloads/jdk-12.0.2_linux-x64_bin.tar.gz /usr/lib/jvm/jdk-12.tar.gz
cd /usr/lib/jvm && sudo tar -xvzf jdk-12.tar.gz && sudo rm jdk-12.tar.gz && cd

echo "Importando environments"
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/environment && sudo mv environment /etc/environment
source /etc/environment

echo "Instalando eclipse"
cd && cd Downloads
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2020-09/R/eclipse-jee-2020-09-R-linux-gtk-x86_64.tar.gz
cd && sudo mv Downloads/eclipse-jee-*.tar.gz Programas && cd Programas 
tar -zxvf eclipse-jee-*.tar.gz  && rm eclipse-jee-*.tar.gz
cd && cd Downloads
wget https://raw.githubusercontent.com/devlambertjoao/utils/master/eclipse.desktop
sudo mv eclipse.desktop /usr/share/applications
cd

wget https://projectlombok.org/downloads/lombok.jar -P ~/Programas/eclipse/eclipse/

echo "Configurando tmux"
cd
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd

echo "Instalando ohmyzsh"
cd
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
cd

echo "Configurando ruby on rails"
gem install rails
gem install solargraph
