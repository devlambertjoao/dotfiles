# Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
sudo mv .zshrc.1 .zshrc

# Installing asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo ". $HOME/.asdf/asdf.sh" >> .bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
source .bashrc
source .zshrc

# Java
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-15
asdf global java openjdk-15

# Nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs 14.16.0
asdf global nodejs 14.16.0

# Yarn
sudo pacman -S yarn

# Ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
echo rails > .default-gems
echo solargraph >> .default-gems
echo bundler >> .default-gems
asdf install ruby 3.0.0
asdf global ruby 3.0.0

# JDK from oracle
sudo mv jdk-11.0.10_linux-x64_bin.tar.gz /usr/lib/jvm
cd /usr/lib/jvm 
sudo tar -zxvf jdk-11.0.10_linux-x64_bin.tar.gz

# Neovim
sudo pacman -S neovim the_silver_searcher ctags
mkdir -p .config/nvim
cd .config/nvim
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/init.vim
wget https://projectlombok.org/downloads/lombok.jar
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Para finalizar configuracao do neovim
nvim
:PlugInstall
:CocConfig
# Colar esse json e salvar.
{
	"java.jdt.ls.vmargs": "-javaagent: /home/lambert/.config/nvim/lombok.jar" ,
	"eslint.autoFixOnSave": true,
	"eslint.format.enable": true
}
