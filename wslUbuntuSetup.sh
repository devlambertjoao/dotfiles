sudo apt-get update
sudo apt-get upgrade

# Installing git, curl and wget
sudo apt install curl wget git

# Installing asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo ". $HOME/.asdf/asdf.sh" >> .bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
source .bashrc

# Java
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-15
asdf global java openjdk-15

# Nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs 15.3.0
asdf global nodejs 15.3.0

# Ruby, some gems, and sqlite3 for rails
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev \
 zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

echo rails > .default-gems
echo solargraph >> .default-gems
echo bundler >> .default-gems

sudo apt-get install -y sqlite3 libsqlite3-dev

asdf install ruby 2.7.2
asdf global ruby 2.7.2

# Dotnet
wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install -y dotnet-sdk-5.0 aspnetcore-runtime-5.0

# Python
sudo apt-get install python3 python3-pip

# Neovim
sudo apt-get install neovim silversearcher-ag ctags
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.vimrc
mkdir -p ~/.config/nvim

echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

echo "{" > ~/.vim/coc-settings.json
echo "  \"java.jdt.ls.vmargs\": \"-javaagent: /home/lambert/.vim/lombok.jar\" " >> ~/.vim/coc-settings.json
echo "}" >> ~/.vim/coc-settings.json

wget https://projectlombok.org/downloads/lombok.jar -P ~/.vim/
pip3 install pynvim

# Tmux
sudo apt-get install -y tmux
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.tmux.conf

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo service docker start 
sudo chmod 777 /var/run/docker.sock

# Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

