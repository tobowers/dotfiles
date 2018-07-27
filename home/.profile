export EDITOR='subl -w'

alias delmerged="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

export JRUBY_OPTS=-J-Xmx1024m
export JAVA_HOME=$(/usr/libexec/java_home)
export GOPATH=$HOME/code/go

export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

export AWS_REGION='us-east-1'

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")" 
}

RED="\[\033[0;31m\]" 
YELLOW="\[\033[0;33m\]" 
GREEN="\[\033[0;32m\]" 

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN \$(/Users/tbowers/code/platform-infrastructure/bin/sandbox ps1)\$ "

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias gpo="git push origin $1"
gpt () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  `git push origin ${b##refs/heads/}`
}

export PATH="./bin:/usr/local/bin:/usr/local/share/npm/bin:$GOPATH/bin:$HOME/bin:$HOME/Library/Python/2.7/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH" # Add RVM to PATH for scripting

export PATH="$HOME/.cargo/bin:$PATH"
