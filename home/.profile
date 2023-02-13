export EDITOR='code -w'

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

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN \$ "
export SIMPLE_PS1="$GREEN \$ "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

alias gpo="git push origin $1"
gpt () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  `git push origin ${b##refs/heads/}`
}

export PATH="./bin:/usr/local/sbin:/usr/local/bin:$GOPATH/bin:$HOME/bin:/usr/local/opt/ruby/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/usr/local/share/npm/bin:./node_modules/.bin:$PATH" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/lib/ruby/gems/2.6.0/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Users/tobowers/Library/Python/3.7/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/Users/tobowers/.local/share/solana/install/active_release/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
