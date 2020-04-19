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
  alias ll='clear; colorls -la'
  alias ls='colorls'
else
  alias ll='clear ; ls -la --color=auto'
fi

alias     vim='dmux vim'
alias    vifm='dmux vifm'
alias      bp='vim ~/Cloud/Development/.bash_profile'
alias     brc='vim ~/Cloud/Development/.bashrc'
alias     vrc='vim ~/Cloud/Development/.config/nvim/init.vim'
alias      tc='vim ~/Cloud/Development/.tmux.conf'
alias     cat='bat --theme="OneHalfDark" --style=numbers,changes --color always'
alias     sbp='. ~/Cloud/Development/.bash_profile'
alias     web='cd /Cloud/Development/projects/web'
alias     cli='cd /Cloud/Development/projects/cli'
alias     dot='git --git-dir=$HOME/Cloud/Development/dotfiles --work-tree=$HOME/Cloud/Development/'
alias  cowsay='cowsay -f tux'


vcd () {
  tmux send-keys -t 1 :cd "$(pwd | sed 's/ /\\ /g')" Enter \; \
    select-pane -t 1
}

cdv () {
  tmux send-keys -t 1 'yd' \; && sleep 2 && cd "$(pbpaste)"
}


export CDPATH=.:$HOME/Cloud/Development/projects/cli:$HOME/Cloud/Development/projects/web:$HOME/Cloud/Development:$HOME/Cloud

export ANSIBLE_NOCOWS=1
export EDITOR=vim
export VISUAL=vim
export DMUX_PROJECTS=$HOME/Cloud/Development/projects
export DMUX_LAYOUT='32f3,191x73,0,0{35x73,0,0,0,155x73,36,0[155x54,36,0,1,155x18,36,55,2]}'
export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/curl/include"

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

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
     tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
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


