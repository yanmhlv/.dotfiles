export LC_ALL=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_PATH=$(brew --prefix)
# homebrew's binaries
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"
# use postgresql 12 binaries as default
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
# ruby's binaries
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# local elixir's binaries
export PATH="$HOME/.mix/escripts:$PATH"

# sqlite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# go's binaries
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_COMPLETION_OPTS='--border --info=inline'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_COMPLETION_TRIGGER='**' # change ** to whatever you like
# export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --preview 'cat {}' --border --margin=1 --padding=1"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

TREE_IGNORE="cache|log|logs|node_modules|vendor"

# https://github.com/starship/starship
eval $(starship init zsh)
eval $(starship completions zsh)

# kubectl
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k

# helm
eval "$(helm completion zsh)" #
alias h=helm
compdef _helm h

# github cli completion
eval "$(gh completion -s zsh)"

# https://github.com/junegunn/fzf
# $(brew --prefix)/opt/fzf/install # run once
# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export STARSHIP_CONFIG=~/.config/starship.toml

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    # autoload -Uz compinit
    # compinit
fi

export PSQL_EDITOR="code --wait"

export VISUAL="code --wait"
export EDITOR=$VISUAL

# use bat instead of cat; with light theme; https://github.com/sharkdp/bat
export BAT_CONFIG_PATH="$HOME/.config/bat.conf"
# alias cat="bat --theme=base16"

# fd; https://github.com/sharkdp/fd
# alias find=fd

# ripgrep; https://github.com/BurntSushi/ripgrep
# alias grep=rg

alias gti=git # just for typo :D

# alias icat="kitty +kitten icat"

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin
# alias s="kitty +kitten ssh"

# better version of ls; https://github.com/ogham/eza
alias ls='eza'
alias l="eza --long --color-scale --grid --octal-permissions"
alias ll='eza --long --all --group-directories-first --git --color-scale --octal-permissions'
alias l='eza --long --all --group-directories-first --git'
alias lt='eza -T --git-ignore --level=2 --group-directories-first'
alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
alias lT='eza -T --git-ignore --level=4 --group-directories-first'
alias tree="eza --tree --classify"

alias s="kitten ssh"

source /Users/ian.mikhailov/.docker/init-bash.sh || true # Added by Docker Desktop
