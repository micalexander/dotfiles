# Determine what OS is accessing this file
unamestr=$(uname)

# Since I want to use the same bash settings for macos
# in my macos bash_profile I source this file.
# Check to see if it is being used in linux or mac and
# set the $home variable in order to include the right files
if [[ "$unamestr" == "Darwin" ]]; then

  home=$HOME/Dropbox/Development
elif [[ "$unamestr" == "Linux" ]]; then

  home=$HOME
fi

# Source the bashrc
. $home/.bashrc

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

if [[ "$unamestr" == "Linux" ]]; then

  # Add locations
  # The add_path function can be found
  # in the .bashrc file
  add_path $RUBY_LOCAL_DIR
  add_path $NODE_LOCAL_DIR
  add_path $PHP_LOCAL_DIR
  add_path $HOME/.gem/ruby/2.4.0/bin
  add_path $HOME/.npm/bin

  # Change the ruby gem install path
  export GEM_HOME=$HOME/.gem/ruby/2.4.0
  export FZF_DEFAULT_COMMAND='find find * -type f""'
fi
