# Installing Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/lambert/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"

# Installing asdf
brew install asdf
echo “. /opt/homebrew/opt/asdf/libexec/asdf.sh” >> .zshrc

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
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# NodeJS Development
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
asdf install nodejs 20.16.0 && \
asdf global nodejs 20.16.0

mkdir ~/.npm-global && \
npm config set prefix '~/.npm-global'

# Ruby On Rails Development
brew install pkg-config && \
brew install sqlite && \
brew install postgresql && \
brew install redis

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git && \
asdf install ruby 3.3.4 && \
asdf global ruby 3.3.4

gem install rails & \
gem install solargraph & \
gem install solargraph-rails & \
gem install rubocop & \
gem install bundler & \
gem install rsense
