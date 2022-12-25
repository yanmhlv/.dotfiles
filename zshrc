# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
# setopt HIST_IGNORE_ALL_DUPS

plugins=(
)

source $HOME/.tokens
source $HOME/.profile
