# Exports
. ~/.exports

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git git-auto-fetch docker tmux kubectl terraform golang)

. $ZSH/oh-my-zsh.sh

# z jump
. /usr/local/etc/profile.d/z.sh

# Aliases
. ~/.aliases

eval "$(jenv init -)"

# Only fot iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Functions
. ~/.functions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
