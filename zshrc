# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    gh
    git
    kubectl
    git-auto-fetch
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.tokens
source $HOME/.profile
