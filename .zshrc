# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='nvim'

# Alias
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"

alias nn="nvim ~/Documents/notes.md"

alias tx="tmux"
alias tks="tmux kill-server"

alias gaa="git add ."
alias gs="git status"
alias gc="git commit"
alias gp="git push"

########## For Mac OS
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

########## For Linux
# Homebrew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# asdf
# . /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

# Path
export PATH="$HOME/.local/bin:$PATH"
