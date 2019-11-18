# determine what OS is accessing this file
unamestr=$(uname)

# determine where the guest home is located
guest_home=$(test -d $HOME/Cloud && echo $HOME/Cloud/Development || echo ${HOME}/Development )

# check if we are in the host or in a container
is_host=$(if [ "$unamestr" == "Darwin" ] || [ $(cat /proc/1/cgroup | grep -cim1 'docker\|lxc') -eq 0 ]; then echo true; else echo false; fi)

# set the home directory location of dev and dot files
home=$(test "$is_host" = true && echo "$guest_home" || echo $HOME)

# check to see we are in a linux distro
is_distro=$(test -f /etc/os-release && echo true || echo false)

# if distro get the distro name
distro=$(test "$is_distro" = true && cat /etc/os-release | grep '^ID=' | awk -F\= '{print $2}' || echo false)

# check if container is alpine bash
is_alpine_bash=$(if [ "$is_host" = false ] && [[ "$distro" == "alpine" ]]; then echo true; else echo false; fi)

# source necessary files if they exist
test -f "$home/.bashrc" && . "$home/.bashrc" || echo $home/.bashrc not found.
test -f "$home/.git-completion.sh" && . "$home/.git-completion.sh" || echo $home/.git-completion not found.
test -f "$home/.tmux-completion.sh" && . "$home/.tmux-completion.sh" || echo $home/.tmux-completion not found.

test -f "$home/.trueline.sh" && . "$home/.trueline.sh" || echo $home/.trueline.sh not found.

if [[ ! -z "$PS1" ]]; then
  test -f "$home/.inputrc" && bind -f "$home/.inputrc" || echo $home/.inputrc not found.
fi

PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# add development bin directory
add_path $HOME/.local/bin
add_path $home/.local/bin
add_path $HOME/Library/Python/2.7/bin
add_path $HOME/Library/Python/3.7/bin

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
[core]
    excludesfile = $home/.globalgitignore
END
    echo created and updated $HOME/.gitconfig file.
  fi

  if [ ! -f "$HOME/.bash_profile" ]; then
    echo ". $home/.bash_profile" >> $HOME/.bash_profile
    echo created and updated $HOME/.bash_profile file.
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

# check for gitconfig name, username, and email and set if not set
if [ ! -z "$(git --version 2> /dev/null)" ]; then
  if [ -z "$(git config user.name)" ]; then
    echo "Your name could not be found in your gitconfig. What would you like your name to be set to?"
    read name
    git config --global user.name "$name"
    test ! -z "$(git config user.name)" && echo "Thanks, your git usename has been set to "$name
  fi

  if [ -z "$(git config user.username)" ]; then
    echo "Your username could not be found in your gitconfig. What would you like your username to be set to?"
    read username
    git config --global user.username $username
    test ! -z "$(git config user.name)" && echo "Thanks, your git usename has been set to "$username
  fi

  if [ -z "$(git config user.email)" ]; then
    echo "An email could not be found in your gitconfig. What would you like your git email to be?"
    read email
    git config --global user.email $email
    test ! -z "$(git config user.email)" && echo "Thanks, your git usename has been set to "$email
  fi
fi

export PIP_DISABLE_PIP_VERSION_CHECK=1

# Set FZF envs
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

export FZF_DEFAULT_OPTS='
--height 40% --border --inline-info
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
# Set colors
export LSCOLORS=ExFxBxDxCxegedabagacad
export CLICOLOR=true

# export TERM=xterm-256color
if [[ $TMUX = "" ]]; then
  export TERM=xterm-256color-italic
else
  export TERM=screen-256color-italic
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
  add_path $HOME/.gem/ruby/$(ruby -v | awk -F ' ' '{print $2}' | cut -d '.' -f 1,2).0
  add_path $HOME/.npm/bin
  add_path $HOME/.local/bin
  add_path $HOME/.nodenv/bin
  add_path $HOME/.composer/vendor/bin

  export EDITOR='nvr'

  # Change the ruby gem install path
  export GEM_HOME=$HOME/.gem/ruby/$(ruby -v | awk -F ' ' '{print $2}' | cut -d '.' -f 1,2).0

  if [ -e /var/run/docker.sock ]; then

    sudo chown `whoami`:`whoami` /var/run/docker.sock;

  fi
fi

# if [ ! -z "$(pip --disable-pip-version-check show powerline-status 2> /dev/null)" ]; then
 # powerline-daemon -q
 # POWERLINE_BASH_CONTINUATION=1
 # POWERLINE_BASH_SELECT=1
 # . $(pip --disable-pip-version-check show powerline-status | grep Location | awk -F' ' '{print $2}')/powerline/bindings/bash/powerline.sh
# elif [ ! -z "$(pip3 --disable-pip-version-check show powerline-status 2> /dev/null)" ]; then
 # ln -s $home/.config/powerline $HOME/.config/
 # powerline-daemon -q
 # POWERLINE_BASH_CONTINUATION=1
 # POWERLINE_BASH_SELECT=1
 # . $(pip3 --disable-pip-version-check show powerline-status | grep Location | awk -F' ' '{print $2}')/powerline/bindings/bash/powerline.sh
# fi



if [ ! -z $(which ruby) ]; then
  add_path $HOME/.gem/ruby/$(ruby -v | awk -F ' ' '{print $2}' | cut -d '.' -f 1,2).0/bin
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "$unamestr" == "Darwin" ] && [ ! -z $(which nodenv) ]; then
  eval "$(nodenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

