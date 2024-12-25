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
export FZF_CTRL_T_OPTS="--walker-skip .git"
export GIT_EXTERNAL_DIFF="difft"
export GIT_SEQUENCE_EDITOR="code --wait"

abbr l    'eza --grid'
abbr la   'eza --grid --all'
abbr ll   'eza -al --group-directories-first'
abbr tree 'eza --tree'

abbr c 'clear'

abbr k   'kubectl'
abbr h   'helm'

abbr s 'kitten ssh'

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

#### ozon helpers
# function warden-dev --argument service port
#   set response (curl -s "https://warden-dev.o3.ru/endpoints?service=$service:$port")
#   echo $response | jq -r -c '(sort_by(.ReleaseName).[] | {Role,ReleaseName,IsDefaultRoute,Address,InstanceName})' | fzf --reverse --multi --bind ctrl-a:select-all
# end

# function warden-stg --argument service port
#   set response (curl -s "https://warden-stg.o3.ru/endpoints?service=$service:$port")
#   echo $response | jq -r -c '(sort_by(.ReleaseName).[] | {Role,ReleaseName,IsDefaultRoute,Address,InstanceName})' | fzf --reverse --multi --bind ctrl-a:select-all
# end

# function warden-prod --argument service port
#   set response (curl -s "https://warden-prod.o3.ru/endpoints?service=$service:$port")
#   echo $response | jq -r -c '(sort_by(.ReleaseName).[] | {Role,ReleaseName,IsDefaultRoute,Address,InstanceName})' | fzf --reverse --multi --bind ctrl-a:select-all
# end

# function get-tokens --argument addr
#     set response (curl -s -XGET "http://$addr/s2s-auth")
#     echo $response | jq -c '[.tokens | .iat] | min'
# end


### kubernetes helpers
function pod_log
    set pod (kubectl get pods -o name | fzf)
    kubectl logs -f --tail 5000 $pod | fzf --tail 5000 --tac --wrap --multi
end

function pod_connect
    set pod (kubectl get pods -o name | fzf)
    kubectl exec $pod -it -- sh
end


# fzf tail
abbr ftail 'fzf --tail 5000 --tac --wrap --multi'
