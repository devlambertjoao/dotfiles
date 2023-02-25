###################################################### START WSL SETUP ######################################################
# For WSL "Run as root first"
useradd -m -G wheel lambert
# Add in /etc/sudoers: lambert ALL=(ALL) ALL
passwd lambert
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
pacman -Syyu
###################################################### END WSL SETUP ######################################################

###################################################### START BASIC SETUP ######################################################
# Att packages
sudo pacman -Syyu

# Essentials
sudo pacman -S git wget openssh

# Generate ssh
ssh-keygen -o -t rsa -C "mail@example.com"

# Git Global User Name
git config --global user.name "Name"

# Comment FakerRoot on IgnorePkg and update pacman
sudo nano /etc/pacman.conf 
sudo pacman -Syu

# Base Devel
sudo pacman -S base-devel

# Setup WSL GUI
pacman -S xorg xorg-server
pacman -S xfce4
# Need to download and configure VcxSrv on Windows:
# https://sourceforge.net/projects/vcxsrv/

# Create basic folders
mkdir ~/Programs
mkdir ~/Downloads
mkdir ~/Development
mkdir ~/.config
###################################################### END BASIC SETUP ######################################################

###################################################### START ZSH ######################################################
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/main/.zshrc
mv .zshrc.1 .zshrc
###################################################### END ZSH ######################################################

###################################################### START Homebrew ######################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
###################################################### END Homebrew ######################################################

###################################################### START Tmux ######################################################
sudo pacman -S tmux
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/main/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
###################################################### END Tmux ######################################################

###################################################### START Asdf ######################################################
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo ". $HOME/.asdf/asdf.sh" >> .bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
source .bashrc
source .zshrc
###################################################### END Asdf ######################################################

###################################################### Start Rust ######################################################
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust stable
asdf global rust stable
source "$HOME/.asdf/installs/rust/stable/env"
###################################################### END Rust ######################################################

###################################################### START Java, Maven ######################################################
# JDK from oracle
cd Downloads
wget https://download.oracle.com/java/17/archive/jdk-17.0.4_linux-x64_bin.tar.gz
mv ~/Downloads/jdk-17.0.4_linux-x64_bin.tar.gz ~/Programs/jdk-17.0.4_linux-x64_bin.tar.gz
cd ~/Programs
tar -zxvf jdk-17.0.4_linux-x64_bin.tar.gz
rm jdk-17.0.4_linux-x64_bin.tar.gz
cd 

# Maven
# sudo apt install maven
sudo pacman -S maven
###################################################### END Java, Maven ######################################################

###################################################### START Node, Npm, Yarn ######################################################
# Nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.12.1
asdf global nodejs 18.12.1

# Yarn
sudo pacman -S yarn

# Npm
sudo pacman -S npm
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
###################################################### END Node, Npm, Yarn ######################################################

###################################################### START Ruby ######################################################
# If inside WSL: sudo pacman -S base-devel
sudo pacman -S libyaml
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

# Openssl dep
cd /tmp
curl -LO https://www.openssl.org/source/openssl-1.1.1.tar.gz
tar -xvfz openssl-1.1.1.tar.gz
cd openssl-1.1.1
./config --prefix=/opt/openssl/1.1.1
make
sudo make install

sudo ln -s /opt/openssl/1.1.1/lib/libssl.so.1.1 /usr/lib/
sudo ln -s /opt/openssl/1.1.1/lib/libcrypto.so.1.1 /usr/lib/

PKG_CONFIG_PATH=/opt/openssl/1.1.1/lib/pkgconfig \ 
RUBY_EXTRA_CONFIGURE_OPTIONS="--with-openssl-dir=/opt/openssl/1.1.1" \
asdf install ruby 3.2.1

asdf global ruby 3.2.1

gem install rails
gem install solargraph
gem install solargraph-rails
gem install bundler
gem install rsense

mkdir ~/.config/solargraph
echo "
plugins:
  - solargraph-rails
" > ~/.config/solargraph/config.yml

###################################################### END RUBY ######################################################

###################################################### START Python ######################################################
sudo pacman -S python python-pip
###################################################### END Python ######################################################

###################################################### START .NET ######################################################
sudo pacman -S dotnet-sdk aspnet-runtime
dotnet tool install --global csharp-ls
###################################################### END .NET ######################################################

###################################################### START Neovim ######################################################
sudo pacman -S neovim

brew install fd # Telescope
brew install ripgrep # Telescope
brew install lazygit # Lazygit

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Nvim Configuration
cd ~/.config
git clone git@github.com:devlambertjoao/nvim.git
###################################################### END Neovim ######################################################

###################################################### START Docker ######################################################
sudo pacman -S docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker lambert

# Run SQL on docker for local development:
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=password@1" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2019-latest

# For mac
# docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=password@1' --name sql -p 1433:1433 --restart always -d mcr.microsoft.com/azure-sql-edge:latest

###################################################### END Docker ######################################################

