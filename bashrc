# BEGIN dannys-custom-config ########################################

alias vim='nvim'

alias v='vim'
alias g='git'
alias gs='git status'
alias gd='git diff'

# Default editors
export EDITOR='vim'
export VISUAL='vim'

# Start tmux if not already open
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Try enable bash completion for git
source /usr/share/bash-completion/completions/git

# capture the output of a command so it can be retrieved with ret
cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
ret () { cat /tmp/capture.out; }

## BEGIN Work Stuff #################################################

# Dont build squshed images
export CICD_DOCKER_BUILD_NO_SQUASH=1

alias dev='ssh gcc-dev'

## END Work Stuff ###################################################

# END dannys-custom-config ##########################################

