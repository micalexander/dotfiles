alias    ll='clear ; ls -la'
alias   vim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
alias   www='cd /sites'
alias    ..='cd ..'
alias   ...='cd ../..'

if [[ "$VIM" = "/usr/share/nvim" ]]
then
  alias   vim='nvr -l'
fi

function _update_ps1() {
    PS1="$(~/go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# function tmux() {
#    env TERM=screen-256color tmux $@
# }
# Prevent paths from being added to more than once
# Usage: add_path /some/bin
add_path() {
  if [[ "$PATH" =~ (^|:)"${1}"(:|$) ]]
  then
      return 0
  fi
  export PATH=$PATH:${1}
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

#! /bin/bash

function vscp() {
    if [[ -z $1 ]]
    then
        echo "usage: vscp [[user@]host1:]file1 ... [[user@]host2:]file2"
        return
    fi
    declare -a targs=()
    for iarg in $@
    do
        targ="scp://$(echo $iarg | sed -e 's@:/@//@' | sed -e 's@:@/@')"
        targs=("${targs[@]}" $targ)
    done
    nvim ${targs[@]}
}

