# config path
export XDG_CONFIG_HOME="$HOME/.config"

source "$XDG_CONFIG_HOME/theme/doom-jar.zsh-theme"

# <- env vars ->
#
# TODO: Add env var for comp type + only load vars for type;
# Ex: export JAR_WORK="work" - script for JAR_WORK loads.

export JAR_SCRIPTS="$XDG_CONFIG_HOME/scripts"
export JAR_HOOKS="$JAR_SCRIPTS/hooks"

# default editor
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="vim"

# nvim
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# path
export PATH=$PATH:/Users/jaronearle/go
export PATH=$PATH:/Users/jaronearle/go/bin
export PATH=$PATH:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH=$PATH:$HOME/Code/flutter/flutter/bin
export PATH=$PATH:$XDG_CONFIG_HOME/tmux/plugins/tmuxifier/bin

#android
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH

# pager
# export PAGER="most"

# secrets
if [ -f "$JAR_SCRIPTS/secrets.sh" ]; then
	source "$JAR_SCRIPTS/secrets.sh"
fi

# <- init ->

#thefuck
eval "$(thefuck --alias)"

# tmuxifier
eval "$(tmuxifier init -)"

# rbenv
# eval "$(rbenv init - zsh)"

# colorls
source "$(dirname $(gem which colorls))/tab_complete.sh"

# zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

# load hooks
source "$JAR_HOOKS/nvm.sh"
