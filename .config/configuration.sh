###################################################### START WSL SETUP ######################################################
# Installing WSL 2

# Open powershell as Admin
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform, Microsoft-Windows-Subsystem-Linux

# After reboot
wsl --set-default-version 2

# Download and install kernel
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# Setup users
# For WSL "Run as root first"
useradd -m -G wheel lambert
# Add in /etc/sudoers: lambert ALL=(ALL) ALL
# Setup passwords
passwd lambert
passwd

pacman-key --init && \
pacman-key --populate && \
pacman-key --refresh-keys && \
pacman -Sy archlinux-keyring && \
pacman -Syyu

# Setup your default user (WSL)
Arch.exe config --default-user lambert
###################################################### END WSL SETUP ######################################################

###################################################### START BASIC SETUP ######################################################
# Att packages
sudo pacman -Syyu

# Essentials
sudo pacman -S git wget openssh unzip

# Generate ssh
ssh-keygen -o -t rsa -C "mail@example.com"

# Git Global User Name
git config --global user.name "Name"
git config --global user.email "email"

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
mkdir ~/Programs && \
mkdir ~/Downloads && \
mkdir ~/Development && \
mkdir ~/.config
###################################################### END BASIC SETUP ######################################################

###################################################### START ZSH ######################################################
sudo pacman -S zsh && \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/main/.zshrc && \
mv .zshrc.1 .zshrc && \
source .zshrc
###################################################### END ZSH ######################################################

###################################################### START DOTFILES ######################################################
git clone --bare git@github.com:devlambertjoao/dotfiles.git $HOME/.devlambertjoao && \
alias dotfiles='/usr/bin/git --git-dir=$HOME/.devlambertjoao/ --work-tree=$HOME' && \
dotfiles checkout --force && \
dotfiles config --local status.showUntrackedFiles no
###################################################### END DOTFILES ######################################################

###################################################### START Homebrew ######################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
###################################################### END Homebrew ######################################################

###################################################### START Tmux ######################################################
brew install tmux && \
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/main/.tmux.conf && \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
###################################################### END Tmux ######################################################

###################################################### START Asdf ######################################################
brew install asdf
###################################################### END Asdf ######################################################

###################################################### Start Rust ######################################################
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git && \
asdf install rust stable && \
asdf global rust stable && \
source "$HOME/.asdf/installs/rust/stable/env"
###################################################### END Rust ######################################################

###################################################### START Node, Npm, Yarn ######################################################
# Nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
asdf install nodejs 20.9.0 && \
asdf global nodejs 20.9.0

# Yarn
brew install yarn

# Npm
mkdir ~/.npm-global && \
npm config set prefix '~/.npm-global'
###################################################### END Node, Npm, Yarn ######################################################

###################################################### START Ruby ######################################################
# If inside WSL: sudo pacman -S base-devel

brew install pkg-config && \
brew install sqlite && \
brew install postgresql && \
brew install redis

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git && \
asdf install ruby 3.3.0 && \
asdf global ruby 3.3.0

gem install rails & \
gem install solargraph & \
gem install solargraph-rails & \
gem install rubocop & \
gem install bundler & \
gem install rsense
###################################################### END RUBY ######################################################

###################################################### START Python ######################################################
sudo pacman -S python python-pip
###################################################### END Python ######################################################

###################################################### START Neovim ######################################################
# Deps for Telescope, Lazygit and Bat (file finder)
brew install neovim && \
brew install fd && \
brew install ripgrep && \
brew install lazygit && \
brew install bat

# Nvim Configuration
cd ~/.config &&
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
