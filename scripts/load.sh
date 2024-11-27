# config path
export XDG_CONFIG_HOME="$HOME/.config"

source "$XDG_CONFIG_HOME/theme/doom-jar.zsh-theme"

export JAR_SCRIPTS="$XDG_CONFIG_HOME/scripts"
export JAR_HOOKS="$JAR_SCRIPTS/hooks"

# default editor
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="vim"

# path
export PATH=$PATH:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=$PATH:$HOME/Code/flutter/flutter/bin
export PATH=$PATH:$XDG_CONFIG_HOME/tmux/plugins/tmuxifier/bin

# export box
if [ -f "$JAR_SCRIPTS/box.sh" ]; then
  source "$JAR_SCRIPTS/box.sh"
fi

# secrets
if [ -f "$JAR_SCRIPTS/secrets.sh" ]; then
  source "$JAR_SCRIPTS/secrets.sh"
fi

# <- init ->

# Box specific
if [[ $BOX == "personal" ]]; then
  . "/Users/jaronearle/.deno/env"
elif [[ $BOX == "mini" ]]; then
  echo "mini"
elif [[ $BOX == "work" ]]; then
  echo "work"
fi

#thefuck
eval "$(thefuck --alias)"

# tmuxifier
eval "$(tmuxifier init -)"

# colorls
# source "$(dirname $(gem which colorls))/tab_complete.sh"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)
