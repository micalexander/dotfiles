alias    ll='clear ; ls -la'
alias   vim='nvim'
alias    ..='cd ..'
alias   ...='cd ../..'

# Prevent paths from being added to more than once
# Usage: add_path /some/bin
add_path()
{
    if [[ "$PATH" =~ (^|:)"${1}"(:|$) ]]
    then
        return 0
    fi
    export PATH=$PATH:${1}
}
