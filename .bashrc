alias    ll='clear ; ls -la'
alias   vim='nvim'
alias    ..='cd ..'
alias   ...='cd ../..'


user="\n\[\e[30;m\](\[\e[34;m\]\u\[\e[30;m\]:\[\e[0m\]\[\e[0;33m\]$HOSTNAME\[\e[0;33m\]\[\e[30;m\]\[\e[30;m\])-"
jobs="(\[\e[34;m\]\j jobs\[\e[30;m\])-"
timedate="(\[\e[34;m\]\@ \d\[\e[30;m\])"
location="\[\e[30;m\]\n\[\016\]\[\017\](\[\[\e[32;m\]\w\[\e[30;m\])-"
files="(\[\e[32;m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /usr/bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;m\])"


source $HOME/.git-completion.sh

if [ -f $HOME/.git-prompt.sh ]; then

  source $HOME/.git-prompt.sh

  gitprompt='\n\n\[\e[30;m\]$(__git_ps1 "\[\e[30;m\](\[\e[0;33m\]"%s"\[\e[0;33m\]\[\e[30;m\])-\[\e[30;m\]")(\[\e[0;33m\]\$\[\e[0;33m\]\[\e[30;m\])-(\[\e[0m\] '
  
  export PS1="$user$docker$jobs$timedate$location$files$gitprompt"

else

  prompt="\[\e[30;m\]\n\n\[\e[30;m\](\[\e[0;33m\]$\[\e[0;33m\]\[\e[30;m\])-(\[\e[0m\] "
  
  export PS1="$user$docker$jobs$timedate$location$files$prompt"
  
fi

export LSCOLORS=GxDxcxdxbxegedabagacFx
export CLICOLOR=true
export PATH=$RUBY_LOCAL_DIR:$PATH
export PATH=$NODE_LOCAL_DIR:$PATH
