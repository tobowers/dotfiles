export EDITOR='subl -w'

alias be="bundle exec"
alias bersp="bundle exec rspec"
alias gff="git flow feature"
alias gffs="git flow feature start"
alias gffp="git flow feature publish"
alias gfr="git flow release"

export JRUBY_OPTS=-J-Xmx1024m

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")" 
}

RED="\[\033[0;31m\]" 
YELLOW="\[\033[0;33m\]" 
GREEN="\[\033[0;32m\]" 

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias gpo="git push origin $1"
gpt () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  `git push origin ${b##refs/heads/}`
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
###export JRUBY_HOME=/Users/topper/.rvm/rubies/jruby-1.7.2

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
