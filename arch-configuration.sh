# For WSL "Run as root first"
# useradd -m -G wheel lambert
# Adicionar em /etc/sudoers: lambert ALL=(ALL) ALL
# passwd lambert
# pacman-key --init
# pacman-key --populate
# pacman-key --refresh-keys
# pacman -Sy archlinux-keyring
# pacman -Syyu

# Att packages
sudo pacman -Syyu

# Base Devel
sudo pacman -S base-devel

# Zsh
# sudo apt install zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.zshrc
sudo mv .zshrc.1 .zshrc

# Alacritty
sudo pacman -S alacritty
mkdir -p ~/.config/alacritty
cd ~/.config/alacritty
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/alacritty.yml
cd

# Tmux
sudo pacman -S tmux
wget https://raw.githubusercontent.com/devlambertjoao/dotfiles/master/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
# sudo apt install maven
sudo pacman -S maven

# JDK from oracle
sudo mv ~/Downloads/jdk-11.0.11_linux-x64_bin.tar.gz /usr/lib/jvm/jdk-11.0.11_linux-x64_bin.tar.gz
cd /usr/lib/jvm
sudo tar -zxvf jdk-11.0.11_linux-x64_bin.tar.gz
cd ~

# Nodejs
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs 14.17.0
asdf global nodejs 14.17.0

# Yarn
sudo pacman -S yarn 
# or
# npm install -g yarn

# Ruby
# If inside WSL: sudo pacman -S base-devel
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
echo rails > .default-gems
echo solargraph >> .default-gems
echo bundler >> .default-gems
asdf install ruby 3.0.0
asdf global ruby 3.0.0

# Python
sudo pacman -S python python-pip

# .NET 
sudo pacman -S dotnet-sdk aspnet-runtime

# Neovim
# sudo apt install neovim silversearcher-ag ctags
sudo pacman -S neovim the_silver_searcher ctags
mkdir -p ~/.config/nvim
cd ~/.config/nvim
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
	"java.home": "/usr/lib/jvm/jdk-11.0.11",
	"java.jdt.ls.vmargs": "-javaagent:/home/lambert/.config/nvim/lombok.jar -Xbootclasspath/a:/home/lambert/.config/nvim/lombok.jar",
	"eslint.autoFixOnSave": true,
	"eslint.format.enable": true
}
# Abrir algum arquivo js e permitir o eslint e prettier
:CocCommand eslint.showOutputChannel

# Neovide
sudo pacman -S rust llvm-libs
cd ~/Downloads
git clone https://aur.archlinux.org/neovide-git.git
cd neovide-git
makepkg --syncdeps
sudo pacman -U neovide-git-*-x86_64.pkg.tar.zst

# STS
mkdir ~/Programs
cd ~/Programs
wget https://download.springsource.com/release/STS4/4.11.0.RELEASE/dist/e4.20/spring-tool-suite-4-4.11.0.RELEASE-e4.20.0-linux.gtk.x86_64.tar.gz
tar -zxvf spring-tool-suite-4-*.x86_64.tar.gz
cd sts-*.RELEASE
wget https://projectlombok.org/downloads/lombok.jar
sudo echo "~/Programs/sts-4.11.0.RELEASE/SpringToolSuite4" > sts
sudo chmod +x sts
sudo mv sts /usr/bin/sts

# Eclipse
cd ~/Programs
wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2021-06/R/eclipse-jee-2021-06-R-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-jee-*-x86_64.tar.gz
cd eclipse
wget https://projectlombok.org/downloads/lombok.jar
sudo echo "~/Programs/eclipse/eclipse" > eclipse
sudo chmod +x eclipse
sudo mv eclipse /usr/bin/eclipse

# Android Studio
cd ~/Downloads
git clone https://aur.archlinux.org/android-studio.git
cd android-studio
makepkg --syncdeps
sudo pacman -U android-studio-*.pkg.tar.zst

# Accept Android Studio licenses
sudo pacman -S jdk8-openjdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk 
$ANDROID_HOME/tools/bin/sdkmanager --licenses 
source ~/.zshrc

# Device for React Native Development (need to create manually on Android Studio with API 28 and name of RN-Device)
echo "~/Programs/Android/Sdk/emulator/emulator -avd RN-Device" > rndevice
sudo chmod +x rndevice
sudo mv rndevice /usr/bin/rndevice

# VS Code
cd ~/Downloads
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg --syncdeps
sudo pacman -U visual-studio-code-bin-*.pkg.tar.zst

# Docker
sudo pacman -S docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker lambert

# Run SQL on docker for local development:
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=password@1" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2019-latest

# Dbeaver
sudo pacman -S dbeaver

# MongoDB Compass
cd ~/Downloads
git clone https://aur.archlinux.org/mongodb-compass.git
cd mongodb-compass
makepkg --syncdeps
sudo pacman -U mongodb-compass-*-x86_64.pkg.tar.zst

# Spotify
cd ~/Downloads
git clone https://aur.archlinux.org/spotify.git
cd spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
makepkg --syncdeps
sudo pacman -U spotify-*-x86_64.pkg.tar.zst
