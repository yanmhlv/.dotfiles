eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:$(go env GOPATH)/bin
eval "$(starship init zsh)"

# eval "$(atuin init zsh)"

export LS_COLORS="$(vivid generate molokai)"

export VISUAL_EDITOR=code

source ~/.tokens
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_OPTS="
#   --walker-skip .git,node_modules
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

alias l='eza --grid'
alias la='eza --grid --all'
alias ll='eza -al --group-directories-first'
alias tree='eza --tree'

alias c='clear'

alias k='kubectl'
alias h='helm'

[[ $commands[kubectl] ]] && eval $(kubectl completion zsh)

# export HISTFILESIZE=
# export HISTSIZE=
export HISTFILE=~/.zsh_history

# https://github.com/Wilfred/difftastic
export GIT_EXTERNAL_DIFF=difft

setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.


# Added by Toolbox App
export PATH="$PATH:/Users/myan/Library/Application Support/JetBrains/Toolbox/scripts"
