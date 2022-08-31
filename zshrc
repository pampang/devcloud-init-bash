export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias pr="pm2 restart"
log() { pm2 log $1 --raw }
prl() { pm2 restart $1 & log $1 --raw }
