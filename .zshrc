# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="pmcgee"
# ZSH_THEME="daveverwer"
# ZSH_THEME="candy"
# ZSH_THEME="mgutz"

# Settings
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git history compleat)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="nvim"

# Alias
# My Dotfiles
alias dotfiles='git --git-dir=$HOME/.devlambertjoao/ --work-tree=$HOME'
alias dotfiles-push='dotfiles add ~/.zshrc ~/.tmux.conf ~/.config/configuration.sh ~/.config/alacritty/ ~/.rubocop.yml ~/.config/solargraph/config.yml && \
    dotfiles commit -m Updating && dotfiles push
  '
alias dotfiles-pull='dotfiles fetch origin && dotfiles reset --hard HEAD && dotfiles pull'

# Utils
alias fa="cat ~/.zshrc | grep alias | less"
alias fag="cat ~/.zshrc | grep"

# Update Pacman
case `uname` in
  Linux)

    alias update-arch="sudo pacman-key --refresh-keys && \
      sudo pacman -Sy archlinux-keyring && \
      sudo pacman -Syu
    "
    alias update-pacman="
        sudo rm -R /etc/pacman.d/gnupg/ && \
        sudo rm -R /root/.gnupg/ && \
        sudo gpg --refresh-keys && \
        sudo pacman-key --init && \
        sudo pacman-key --populate archlinux && \
        sudo pacman -S archlinux-keyring && \
        sudo pacman -Syu
      "
  ;;
esac

# Nvim
alias nv="nvim"
alias nvcn="cd ~/.config/nvim && nvim && cd"
alias nvcz="nvim ~/.zshrc"
alias nvct="nvim ~/.tmux.conf"
alias nvca="nvim ~/.config/alacritty/alacritty.yml"

# Source
alias soz="source ~/.zshrc"
alias sot="source ~/.tmux.conf"

# Tmux
alias tx="tmux"
alias devc="tmux split-window -c $PWD -l 10"
alias tks="tmux kill-server"

# Python
alias py="python3"
alias python="python3"
alias pip="python3 -m pip"

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

# Clean temp files with git
alias cleanv="git clean -ndx" # print files to clean
alias cleanc="git clean -dfx" # confirm files to clean

# Npm
# mkdir ~/.npm-global
# npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Asdf
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

