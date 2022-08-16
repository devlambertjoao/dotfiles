# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

# Settings
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby dotnet history compleat zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="nvim"

# Alias
# My Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.devlambertjoao/ --work-tree=$HOME'
# Utils
alias fa="cat ~/.zshrc | grep alias | less"
alias fag="cat ~/.zshrc | grep"
# Nvim
alias nv="nvim"
alias nvcn="nvim ~/.config/nvim/init.vim"
alias nvcz="nvim ~/.zshrc"
alias nvct="nvim ~/.tmux.conf"
# For Tmux
alias devc="tmux split-window -c $PWD -l 10"
alias tks="tmux kill-server"
# Python
alias py="python3"
alias python="python3"
alias pip="python3 -m pip"
# React native
alias rnl="yarn run react-native log-android"
# Device Emulator
alias asd="$HOME/Programs/Android/Sdk/emulator/emulator -avd RN-Device"
alias acd="adb reverse tcp:9090 tcp:9090"
# Git
alias ga="git add"
alias gaa="git add ."
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gpsum="git push --set-upstream origin main"
alias gpl="git pull"
alias gf="git fetch"
alias gb="git branch"
alias gl="git log --oneline --decorate --graph"
alias grc="git rebase --continue"
# Spring boot
alias rsb="mvn spring-boot:run"
alias rst="mvn test"
alias mvnc="mvn clean install -U -DskipTests=true"
# Rails and Rake
alias rc="rails console"
alias rcp="rubocop"
alias rcpa="rubocop -A"
alias rgen="rails generate"
alias rgmig="rails generate migration"
alias rgs="rails generate scaffold"
alias rgc="rails generate controller"
alias rgmod="rails generate model"
alias rs="rails server"
alias rt="rails test"
alias rr="rake routes"
alias rdc="rake db:create"
alias rdd="rake db:drop"
alias rdm="rake db:migrate"
alias rds="rake db:seed"
alias rrg="rake routes | grep"
# Dotnet
alias dnwa="dotnet new webapi"
alias dncl="dotnet new classlibrary"
alias dnsl="dotnet new solution"
alias dnsla="dotnet sln add"
alias dngi="dotnet new gitignore"
alias dnar="dotnet add reference"
alias dnr="dotnet run"
alias dnb="dotnet build"
alias dnnr="dotnet nuget restore"
alias dnc="dotnet clean"
# Google Chrome Disabling web security
alias gcdws="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome http://localhost:4200 --disable-web-security --user-data-dir=/tmp/google-chrome-temp"

# Java Home
export JAVA_HOME=$HOME/Programs/jdk-17.jdk/Contents/Home
# Linux
# export JAVA_HOME=$HOME/Programs/jdk-17.0.4
export PATH=$PATH:$JAVA_HOME

# JDTLS
export JDTLS_HOME=$HOME/Programs/jdtls/
export JDTLS_JVM_ARGS="-javaagent:$HOME/.config/nvim/lombok.jar -Xbootclasspath/a:$HOME/.config/nvim/lombok.jar"

# Maven
export M2_HOME=$HOME/Programs/apache-maven-3.8.2
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

# Android development
export ANDROID_HOME=$HOME/Programs/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export FLUTTER_PATH_HOME=$HOME/Programs/flutter
export PATH=$PATH:$FLUTTER_PATH_HOME/bin

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Npm
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# C#
export PATH="$PATH:$HOME/.dotnet/tools"

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

alias lvim=$HOME/.local/bin/lvim

# Load Angular CLI autocompletion.
source <(ng completion script)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
