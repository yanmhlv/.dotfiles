export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    gh
    git
    kubectl
    kubectx
    git-auto-fetch
  # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.tokens
source $HOME/.profile

# https://github.com/junegunn/fzf
# $(brew --prefix)/opt/fzf/install # run once
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
