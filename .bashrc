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
  if [ "$HOSTNAME" == "alpine-bash" ] || [ $(uname) == "Darwin" ]; then
    if [ -f "$HOME/go/bin/powerline-go" ]; then
      PS1="$($HOME/go/bin/powerline-go -error $?)"
    elif [ -f "$HOME/Dropbox/Development/go/bin/powerline-go" ]; then
      PS1="$($HOME/Dropbox/Development/go/bin/powerline-go -error $?)"
    fi
  elif [ -f "$HOME/hostgo/bin/powerline-go" ]; then
    PS1="$($HOME/hostgo/bin/powerline-go -error $?)"
  else
    PS1="$PS1"
  fi
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Usage: add_path /some/bin
add_path() {
  if [[ "$PATH" =~ (^|:)"${1}"(:|$) ]]
  then
      return 0
  fi
  export PATH=$PATH:${1}
}

append_line() {
  set -e

  local line file pat lno

  file="$1"
  pat="${2:-}"
  line="$3"

  echo "Update $file:"
  echo "  - $line"

  [ -f "$file" ] || touch "$file"
  if [ $# -lt 3 ]; then
    lno=$(\grep -nF "$line" "$file" | sed 's/:.*//' | tr '\n' ' ')
  else
    lno=$(\grep -nF "$pat" "$file" | sed 's/:.*//' | tr '\n' ' ')
  fi
  if [ -n "$lno" ]; then
    echo "    - Already exists: line #$lno"
  else
    echo "$line" >> "$file"
    echo "    + Added"
  fi

  echo
  set +e
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

