export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export BAT_CONFIG_PATH="$HOME/.config/bat.conf"

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_PATH=$(brew --prefix)
# homebrew's binaries
export PATH="/opt/homebrew/opt/openssl/bin:$PATH"
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

# # guile
# export GUILE_LOAD_PATH="/opt/homebrew/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/opt/homebrew/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/opt/homebrew/lib/guile/3.0/extensions"

# better version of ls; https://github.com/ogham/exa
TREE_IGNORE="cache|log|logs|node_modules|vendor"

# https://github.com/starship/starship
eval "$(starship init zsh)"

# https://github.com/gsamokovarov/jump
eval "$(jump shell zsh)" # j phara<tab

eval "$(gh completion -s zsh)" #

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

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# use bat instead of cat; with light theme; https://github.com/sharkdp/bat
# alias cat="bat --theme=base16"
alias ls="exa --color-scale"
alias ll="exa --long --color-scale --grid"
# fd; https://github.com/sharkdp/fd
# alias find=fd
# ripgrep; https://github.com/BurntSushi/ripgrep
# alias grep=rg
alias gti=git # just for typo :D
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
alias ssh="kitty +kitten ssh"
alias k="kubectl"
