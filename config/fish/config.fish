if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

/opt/homebrew/bin/brew shellenv | source
starship init fish | source
fzf --fish | source

fish_add_path (go env GOPATH)/bin

export FZF_DEFAULT_COMMAND='fd'
export GIT_EXTERNAL_DIFF="difft"

abbr l 'eza --grid'
abbr la 'eza --grid --all'
abbr ll 'eza -al --group-directories-first'
abbr tree 'eza --tree'

abbr c 'clear'

abbr k 'kubectl'
abbr kgp 'kubectl get pods'
abbr h 'helm'

set fzf_history_time_format %d-%m-%y
set fzf_git_log_format "%H %s"

bind \cr _fzf_search_history
bind -M insert \cr _fzf_search_history

fzf_configure_bindings --directory=\ct --processes=\ck --git_log=\cg
