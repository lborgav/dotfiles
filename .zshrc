# Exports
. ~/.exports

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git git-auto-fetch docker tmux kubectl terraform golang aws)

. $ZSH/oh-my-zsh.sh

# z jump
. /opt/homebrew/etc/profile.d/z.sh
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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi


# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# opam configuration
[[ ! -r /Users/lborgav/.opam/opam-init/init.zsh ]] || source /Users/lborgav/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

clear
neofetch

# pnpm
export PNPM_HOME="/Users/lborgav/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
