if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

/opt/homebrew/bin/brew shellenv fish | source
starship init fish                   | source
fzf --fish                           | source
kubectl completion fish              | source
helm completion fish                 | source

fish_add_path (go env GOPATH)/bin

export FZF_DEFAULT_COMMAND='fd'
export GIT_EXTERNAL_DIFF="difft"

abbr l    'eza --grid'
abbr la   'eza --grid --all'
abbr ll   'eza -al --group-directories-first'
abbr tree 'eza --tree'

abbr c 'clear'

abbr k   'kubectl'
abbr kgp 'kubectl get pods'
abbr h   'helm'

function kns -d "kubens"
    kubectl get ns --no-headers -o wide | fzf --bind 'enter:become(kubectl config set-context --current --namespace={1})'
end

function kc -d "kubectx"
    kubectl config get-contexts --no-headers -o name | fzf --bind 'enter:become(kubectl config use-context {-1})'
end

set fzf_history_time_format %d-%m-%y
set fzf_git_log_format "%H %s"

bind \cr _fzf_search_history
bind -M insert \cr _fzf_search_history

fzf_configure_bindings --directory=\ct --processes=\ck --git_log=\cg
