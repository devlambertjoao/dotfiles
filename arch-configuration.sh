# For WSL "Run as root first"
useradd -m -G wheel lambert
# Adicionar em /etc/sudoers: lambert ALL=(ALL) ALL
passwd lambert

pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
pacman -Syyu 

# Zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
sudo mv .zshrc.1 .zshrc

# Asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo ". $HOME/.asdf/asdf.sh" >> .bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> .bashrc
source .bashrc
source .zshrc

# Java
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-15
asdf global java openjdk-15

# Maven
sudo pacman -S maven

# JDK from oracle
sudo mv jdk-11.0.10_linux-x64_bin.tar.gz /usr/lib/jvm
cd /usr/lib/jvm 
sudo tar -zxvf jdk-11.0.10_linux-x64_bin.tar.gz

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

# Python
sudo pacman -S python python-pip

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
	"java.jdt.ls.vmargs": "-javaagent:/home/lambert/.config/nvim/lombok.jar -Xbootclasspath/a:/home/lambert/.config/nvim/lombok.jar",
	"eslint.autoFixOnSave": true,
	"eslint.format.enable": true
}
# Abrir algum arquivo js e permitir o eslint e prettier
:CocCommand eslint.showOutputChannel

# STS
mkdir Programs
cd Programs
wget https://download.springsource.com/release/STS4/4.9.0.RELEASE/dist/e4.18/spring-tool-suite-4-4.9.0.RELEASE-e4.18.0-linux.gtk.x86_64.tar.gz
tar -zxvf spring-tool-suite-4-4.9.0.RELEASE-e4.18.0-linux.gtk.x86_64.tar.gz
cd sts-4.9.0.RELEASE
wget https://projectlombok.org/downloads/lombok.jar
cd /usr/share/applications
sudo wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/sts.desktop

# Android Studio
cd Downloads
git clone https://aur.archlinux.org/android-studio.git
cd android-studio
makepkg --syncdeps
sudo pacman -U android-studio-*.pkg.tar.zst

# VS Code
cd Downloads
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg --syncdeps
sudo pacman -U visual-studio-code-bin-*.pkg.tar.zst

# Docker
sudo pacman -S docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker lambert

# Dbeaver
sudo pacman -S dbeaver
