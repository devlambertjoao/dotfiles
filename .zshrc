# Path to your oh-my-zsh installation.
export ZSH="/home/lambert/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jaischeema"

# Settings
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby dotnet history compleat zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Alias
alias nv="nvim ."
alias devc="tmux split-window -c $PWD -l 10"
alias tks="tmux kill-server"
alias py="python3"
alias rnl="yarn run react-native log-android"
alias rnd="$HOME/Programs/Android/Sdk/emulator/emulator -avd RN-Device"
alias ga="git add ."
alias gs="git status"
alias gc="git commit"
alias rsb="mvn spring-boot:run"

# Java Home
export JAVA_HOME=/usr/lib/jvm/jdk-11.0.11
export PATH=$PATH:$JAVA_HOME

# Android development
export ANDROID_HOME=$HOME/Programs/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# GUI Apps on WSL
# export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0"
