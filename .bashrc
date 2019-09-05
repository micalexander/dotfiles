#!/usr/bin/env bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ $(uname) == "Darwin" ]; then
  alias ll='clear; ls -laO'
else
  alias ll='clear ; ls -la --color=auto'
fi

alias     vim='dmux vim'
alias      bp='dmux vim ~/Cloud/Development/.bash_profile'
alias     sbp='. ~/Cloud/Development/.bash_profile'
alias     www='cd /Cloud/Development/www'
alias     dot='git --git-dir=$HOME/Cloud/Development/dotfiles --work-tree=$HOME/Cloud/Development/'
alias      ..='cd ..'
alias     ...='cd ../..'
alias  cowsay='cowsay -f tux'


vcd () {
  tmux send-keys -t 1 :cd "$(pwd | sed 's/ /\\ /g')" Enter \; \
    select-pane -t 1
}

cdv () {
  tmux send-keys -t 1 'yd' \; && sleep 2 && cd "$(pbpaste)"
}


export CDPATH=.:$HOME/Cloud/Development/binaries:$HOME/Cloud/Development/www:$HOME/Cloud/Development:$HOME/Cloud

export ANSIBLE_NOCOWS=1
export EDITOR=dvim
export VISUAL=dvim


function is_interactive_shell() {
  # https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html
  [[ "$-" =~ "i" ]]
}

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


if [ -d ~/.ssh ] && [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
  ssh-add -l > /dev/null || ssh-add
fi

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

TRUELINE_SHOW_VIMODE=true

declare -A TRUELINE_SYMBOLS=(
  [vimode_cmd]='NORMAL'
  [vimode_ins]='INSERT'
)

declare -a TRUELINE_SEGMENTS=(
  'user,grey,special_grey'
  'working_dir,mono,cursor_grey'
  'git,grey,special_grey'
  )


