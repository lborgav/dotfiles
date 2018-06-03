# Exports
. ~/.exports

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker tmux)

. $ZSH/oh-my-zsh.sh

# z jump
. /usr/local/etc/profile.d/z.sh

# Aliases
. ~/.aliases

eval "$(jenv init -)"

# Node version manager
. "/usr/local/opt/nvm/nvm.sh"

# Only fot iterm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

