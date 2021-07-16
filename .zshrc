# Path to your oh-my-zsh installation.
export ZSH="/home/lambert/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# better themes i've found: jaischeema bira duellj gnzh xiong-chiamiov-plus fino fino-time
ZSH_THEME="jonathan"

# Settings
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby dotnet history compleat zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="nvim"

# Alias
# Nvim
alias nv="nvim"
alias nvcn="nvim ~/.config/nvim/init.vim"
alias nvcz="nvim ~/.zshrc"
alias nvci3="nvim ~/.config/i3/config"
alias nvci3s="nvim ~/.config/i3status/config"
# For Tmux
alias devc="tmux split-window -c $PWD -l 10"
alias tks="tmux kill-server"
# Python
alias py="python3"
# React native
alias rnl="yarn run react-native log-android"
# Device Emulator
alias ard="$HOME/Programs/Android/Sdk/emulator/emulator -avd RN-Device"
alias acd="adb reverse tcp:9090 tcp:9090"
# Git
alias ga="git add"
alias gaa="git add ."
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gf="git fetch"
alias gb="git branch"
alias gl="git log --oneline --decorate --graph"
# Spring boot
alias rsb="mvn spring-boot:run"
alias mvnc="mvn clean install -U -DskipTests=true"
# Rails and Rake
alias rc="rails console"
alias rdc="rake db:create"
alias rdd="rake db:drop"
alias rdm="rake db:migrate"
alias rds="rake db:seed"
alias rgen="rails generate"
alias rgm="rails generate migration"
alias rr="rake routes"
alias rrg="rake routes | grep"
alias rs="rails server"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
