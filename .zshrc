export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

export EDITOR="nvim"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Tmux Alias
alias tx="tmux"
alias tks="tmux kill-server"
alias tcd="tmuxifier load-session crushonu"

# Tmuxifier 
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Neovim Alias
alias nv="nvim"

# Git alias
alias gaa="git add ."
alias gs="git status"
alias gc="git commit"
alias gp="git push"

# For Mac OS
eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# For Linux
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# . /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh
