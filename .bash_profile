# determine what OS is accessing this file
unamestr=$(uname)

# determine where the guest home is located
guest_home=$(test -d $HOME/Dropbox && echo $HOME/Dropbox/Development || echo $HOME/Development )

# check if we are in the host or in a container
is_host=$(if [ "$unamestr" == "Darwin" ] || [ $(cat /proc/1/cgroup | grep -cim1 'docker\|lxc') -eq 0 ]; then echo true; else echo false; fi)

# set the home directory location of dev and dot files
home=$(test "$is_host" = true && echo $guest_home || echo $HOME)

# check to see we are in a linux distro
is_distro=$(test -f /etc/os-release && echo true || echo false)

# if distro get the distro name
distro=$(test "$is_distro" = true && cat /etc/os-release | grep '^ID=' | awk -F\= '{print $2}' || echo false)

# check if container is alpine bash
is_alpine_bash=$(if [ "$is_host" = false ] && [[ "$distro" == "alpine" ]]; then echo true; else echo false; fi)

# source necessary files if they exist
test -f $home/.bashrc && . $home/.bashrc || echo $home/.bashrc not found.
test -f $home/.git-completion.sh && . $home/.git-completion.sh || echo $home/.git-completion not found.
test -f $home/.tmux-completion.sh && . $home/.tmux-completion.sh || echo $home/.tmux-completion not found.

if is_interactive_shell; then
  test -f $home/.inputrc && bind -f $home/.inputrc || echo $home/.inputrc not found.
fi


# add development bin directory
add_path $home/.local/bin

if [ ! -z $(which ruby) ]; then
  add_path $HOME/.gem/ruby/$(ruby -v | awk -F ' ' '{print $2}' | cut -d '.' -f 1,2).0/bin
fi

# find and source bash completion if possible
if [ "$unamestr" == "Darwin" ] && [ ! -z $(which brew) ]; then
  . $(brew --prefix)/etc/bash_completion &> /dev/null || echo $(brew --prefix)/etc/bash_completion not found.
else
  . /usr/share/bash-completion/bash_completion &> /dev/null || echo /usr/share/bash-completion/bash_completion not found.
fi

# add host files if they do not exist
if [ "$is_host" = true ]; then

  if [ ! -f "$HOME/.gitconfig" ]; then
tee -a $HOME/.gitconfig << END > /dev/null
[include]
    path = $home/.gitconfig
END
    echo created and updated $HOME/.gitconfig file.
  fi

  if [ ! -f "$HOME/.ssh/config" ]; then
    mkdir $HOME/.ssh
    chmod 700 $HOME/.ssh
    echo "Include $home/.ssh/config" >> $HOME/.ssh/config
    chmod 600 $HOME/.ssh/config
    chown $USER $HOME/.ssh/config
    echo created and updated $HOME/.ssh/config file.
  fi

  if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    mkdir -p $HOME/.config/nvim
    echo "source $home/.config/nvim/init.vim" >> $HOME/.config/nvim/init.vim
    echo created and updated $HOME/.config/nvim/init.vim file.
  fi

  if [ ! -f "$HOME/.tmux.conf" ]; then
    echo "source-file $home/.tmux.conf" >> $HOME/.tmux.conf
    echo created and updated $HOME/.tmux.conf file.
  fi

  if [ "$unamestr" = "Darwin" ] && [ ! -f "$HOME/.mackup.cfg" ]; then
tee -a $HOME/.mackup.cfg << END > /dev/null
[storage]
engine = file_system
path = Dropbox
directory = OS/macos/mackup

[configuration_files]
.config/nvim/init.vim
END
    echo created and updated $HOME/.mackup.cfg file.
  fi
fi
# if [ "is_alpine_bash" = true ]; then

# fi
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--height 40% --border --inline-info'

# Set colors
export LSCOLORS=GxDxcxdxbxegedabagacFx
export CLICOLOR=true

# export TERM=xterm-256color
if [[ $TMUX = "" ]]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# if [[ ! -z $(which tmux) ]] && [[ $SHLVL != "2" ]]; then
  # tmux new -A -s $USER
# fi

if [ "$is_alpine_bash" = true ]; then

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

  export EDITOR='nvr'

  # Change the ruby gem install path
  export GEM_HOME=$HOME/.gem/ruby/2.4.0

  export LD_LIBRARY_PATH=$RUBY_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NODE_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PHP_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHON2_LOCAL_DIR/../lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHON3_LOCAL_DIR/../lib

  if [ -e /var/run/docker.sock ]; then

    sudo chown `whoami`:`whoami` /var/run/docker.sock;

  fi
fi

