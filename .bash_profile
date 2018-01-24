# Determine what OS is accessing this file
unamestr=$(uname)

# Since I want to use the same bash settings for macos
# in my macos bash_profile I source this file.
# Check to see if it is being used in linux or mac and
# set the $home variable in order to include the right files
if [[ "$unamestr" == "Darwin" ]]; then

  home=$HOME/Dropbox/Development

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

elif [[ "$unamestr" == "Linux" ]]; then

  home=$HOME
  . /usr/share/bash-completion/bash_completion
fi

# Source the bashrc
. $home/.bashrc

add_path $home/.local/bin

# Set variable to be used in my bash prompt
user="\n(\e[34;m\]\u\[\e[0;m\]:\[\e[0m\]\[\e[0;33m\]$HOSTNAME\[\e[0;33m\]\[\e[0;m\]\[\e[0;m\])-"
jobs="(\[\e[34;m\]\j jobs\[\e[0;m\])-"
timedate="(\[\e[34;m\]\@ \d\[\e[0;m\])"
location="\[\e[0;m\]\n\[\016\]\[\017\](\[\[\e[32;m\]\w\[\e[0;m\])-"
files="(\[\e[32;m\]\$(/bin/ls -1 | /usr/bin/wc -l | `which sed` 's: ::g') files, \$(/bin/ls -lah | `which grep` -m 1 total | `which sed` 's/total //')b\[\e[0;m\])"

# Source git-completion if found
if [ -f $home/.git-completion.sh ]; then

  . $home/.git-completion.sh

fi

# Source git-prompt if found and set bash prompt
if [ -f $home/.git-prompt.sh ]; then

  . $home/.git-prompt.sh

  gitprompt='\n\n\[\e[0;m\]$(__git_ps1 "\[\e[0;m\](\[\e[0;33m\]"%s"\[\e[0;33m\]\[\e[0;m\])-\[\e[0;m\]")(\[\e[0;33m\]\$\[\e[0;33m\]\[\e[0;m\])-(\[\e[0m\] '

  export PS1="$user$docker$jobs$timedate$location$files$gitprompt"

else

  prompt="\[\e[0;m\]\n\n\[\e[0;m\](\[\e[0;33m\]$\[\e[0;33m\]\[\e[0;m\])-(\[\e[0m\] "

  export PS1="$user$docker$jobs$timedate$location$files$prompt"

fi

# Set colors
export LSCOLORS=GxDxcxdxbxegedabagacFx
export CLICOLOR=true
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [[ "$unamestr" == "Linux" ]]; then

  # Add locations
  # The add_path function can be found
  # in the .bashrc file
  add_path $RUBY_LOCAL_DIR
  add_path $NODE_LOCAL_DIR
  add_path $GO_LOCAL_DIR
  add_path $PHP_LOCAL_DIR
  add_path $PYTHON2_LOCAL_DIR
  add_path $PYTHON3_LOCAL_DIR
  add_path $HOME/.gem/ruby/2.4.0/bin
  add_path $HOME/.npm/bin
  add_path $HOME/.local/bin
  add_path $HOME/.composer/vendor/bin

  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_DEFAULT_OPTS='--height 40% --border --inline-info'

  export LD_LIBRARY_PATH=$RUBY_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NODE_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PHP_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHON2_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHON3_LOCAL_DIR/../lib

  export EDITOR='nvim'

  # Change the ruby gem install path
  export GEM_HOME=$HOME/.gem/ruby/2.4.0

  if [ -e /var/run/docker.sock ]; then

    sudo chown `whoami`:`whoami` /var/run/docker.sock;

  fi
fi

