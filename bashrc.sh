# dannys-custom-config

set -o vi

alias vim='nvim'

alias v='vim'
alias g='git'
alias gs='git status'

# Start tmux if not already open
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux         ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Work Stuff

# Dont build squshed images
export CICD_DOCKER_BUILD_NO_SQUASH=1

alias dev='ssh gcc-dev'

