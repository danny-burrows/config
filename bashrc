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

alias slurm-worker-green-1="(cd /home/dannyb/projects/core-infra && ./scripts/core-credentials-ssh.sh manager@slurm-worker-green-1.core.genomicsplc.com)"
alias crunch-wes-backend="(cd /home/dannyb/projects/core-infra && ./scripts/core-credentials-ssh.sh manager@crunch-wes-backend.core.genomicsplc.com)"
alias card-catalog-wes-backend="(cd /home/dannyb/projects/core-infra && ./scripts/core-credentials-ssh.sh manager@card-catalog-wes-backend.core.genomicsplc.com)"
alias card-catalog="(cd /home/dannyb/projects/core-infra && ./scripts/core-credentials-ssh.sh manager@card-catalog.core.genomicsplc.com)"

alias vpn="${HOME}/vpn.sh"
alias vpnkill="${HOME}/vpnkill.sh"

## END Work Stuff ###################################################

# END dannys-custom-config ##########################################

