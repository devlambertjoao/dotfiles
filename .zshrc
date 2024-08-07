export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Tmux Alias
alias tx="tmux"
alias tks="tmux kill-server"

# Neovim Alias
alias nv="nvim"

# Git alias
alias gaa="git add ."
alias gs="git status"

eval "$(/opt/homebrew/bin/brew shellenv)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
