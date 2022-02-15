export LC_ALL=en_US.UTF-8

export BAT_CONFIG_PATH="$HOME/.config/bat.conf"

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

# better version of ls; https://github.com/ogham/exa
TREE_IGNORE="cache|log|logs|node_modules|vendor"

# https://github.com/starship/starship
eval $(starship init zsh)
eval $(starship completions zsh)

# kubectl
source <(kubectl completion zsh)
compdef __start_kubectl k

# helm
eval "$(helm completion zsh)" #
alias h=helm
compdef _helm h

# https://github.com/gsamokovarov/jump
eval "$(jump shell zsh)" # j Docum<tab>

eval "$(gh completion -s zsh)" # github cli completion

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
# alias cat="bat --theme=base16"
alias l="exa --color-scale --long --grid"
alias ll="exa --long --color-scale"

# fd; https://github.com/sharkdp/fd
# alias find=fd

# ripgrep; https://github.com/BurntSushi/ripgrep
# alias grep=rg

alias gti=git # just for typo :D

alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias ssh="kitty +kitten ssh"

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
