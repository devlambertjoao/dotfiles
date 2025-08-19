# For arch linux only
sudo pacman -S base-devel libyaml wget git zsh 

# Installing Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Homebrew Post Install
- MacOS 
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/lambert/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
- Linux
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/lambert/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Installing asdf
brew install asdf

## asdf post install
- MacOS
echo ". /opt/homebrew/opt/asdf/libexec/asdf.sh" >> .zshrc
- Linux
echo ". /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh"a >> .zshrc

# Openssh
brew install openssh

# Config git user name and email
git config --global user.name "Name"
git config --global user.email "email"

# Generate ssh for git
ssh-keygen -o -t rsa -C "mail@example.com"

# Install wget
brew install wget

# Installing tmux
brew install tmux && \
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/main/.tmux.conf && \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier && \
cd ~/.tmuxifier/layouts && \
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/refs/heads/main/.tmuxifier/layouts/crushonu.session.sh && \
cd ~

# NodeJS Development
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
asdf install nodejs 20.16.0 && \
asdf set -u nodejs 20.16.0

mkdir ~/.npm-global && \
npm config set prefix '~/.npm-global'

# Ruby On Rails Development
brew install pkg-config && \
brew install sqlite && \
brew install postgresql && \
brew install redis

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git && \
asdf install ruby 3.3.0 && \
asdf set -u ruby 3.3.0

# Restart before install these gems
gem install rails & \
gem install solargraph & \
gem install rubocop

# Install stripe cli
brew install stripe-cli && \
stripe login

# Installing Neovim
brew install neovim && \
brew install fd && \
brew install ripgrep && \
brew install lazygit && \
brew install bat && \
brew install lua && \
brew install luarocks

cd ~/.config && \
git clone git@github.com:devlambertjoao/nvim.git && \
cd nvim && \
git checkout v5



########################################## WSL SECTION ##########################################
# Setup clipboard in WSL (For neovim and vim compatible)
curl -Lo ~/.local/bin/win32yank.exe https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
cd ~/.local/bin
unzip win32yank.exe
chmod +x win32yank.exe

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
#################################################################################################
