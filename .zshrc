# Path to your oh-my-zsh installation.
export ZSH="/home/lambert/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="flazz"

# Settings
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails ruby dotnet history compleat zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Alias
alias nv="nvim ."
alias devc="tmux split-window -c $PWD -l 5"
alias tks="tmux kill-server"
alias sds="sudo service docker start"

# Asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
