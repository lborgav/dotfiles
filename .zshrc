# Exports
. ~/exports.sh

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker tmux)

. $ZSH/oh-my-zsh.sh

# z jump
. /usr/local/etc/profile.d/z.sh

# Aliases
. ~/aliases.sh

eval "$(jenv init -)"

### Added by IBM Cloud CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

. "/usr/local/opt/nvm/nvm.sh"
