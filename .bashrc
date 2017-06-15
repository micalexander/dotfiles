alias    ll='clear ; ls -la'
alias   vim='nvim'
alias    ..='cd ..'
alias   ...='cd ../..'


user="\n(\e[34;m\]\u\[\e[0;m\]:\[\e[0m\]\[\e[0;33m\]$HOSTNAME\[\e[0;33m\]\[\e[0;m\]\[\e[0;m\])-"
jobs="(\[\e[34;m\]\j jobs\[\e[0;m\])-"
timedate="(\[\e[34;m\]\@ \d\[\e[0;m\])"
location="\[\e[0;m\]\n\[\016\]\[\017\](\[\[\e[32;m\]\w\[\e[0;m\])-"
files="(\[\e[32;m\]\$(/bin/ls -1 | /usr/bin/wc -l | `which sed` 's: ::g') files, \$(/bin/ls -lah | `which grep` -m 1 total | `which sed` 's/total //')b\[\e[0;m\])"


source $HOME/.git-completion.sh

if [ -f $HOME/.git-prompt.sh ]; then

  source $HOME/.git-prompt.sh

  gitprompt='\n\n\[\e[0;m\]$(__git_ps1 "\[\e[0;m\](\[\e[0;33m\]"%s"\[\e[0;33m\]\[\e[0;m\])-\[\e[0;m\]")(\[\e[0;33m\]\$\[\e[0;33m\]\[\e[0;m\])-(\[\e[0m\] '
  
  export PS1="$user$docker$jobs$timedate$location$files$gitprompt"

else

  prompt="\[\e[0;m\]\n\n\[\e[0;m\](\[\e[0;33m\]$\[\e[0;33m\]\[\e[0;m\])-(\[\e[0m\] "
  
  export PS1="$user$docker$jobs$timedate$location$files$prompt"
  
fi

export LSCOLORS=GxDxcxdxbxegedabagacFx
export CLICOLOR=true
export PATH=$RUBY_LOCAL_DIR:$PATH
export PATH=$NODE_LOCAL_DIR:$PATH
export PATH=$PHP_LOCAL_DIR:$PATH
export PATH=$HOME/node_modules/.bin:$PATH
