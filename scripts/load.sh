# config path
export XDG_CONFIG_HOME="$HOME/.config"

source "$XDG_CONFIG_HOME/theme/doom-jar.zsh-theme"

export JAR_SCRIPTS="$XDG_CONFIG_HOME/scripts"
export JAR_HOOKS="$JAR_SCRIPTS/hooks"
export ASDF_DATA_DIR="$XDG_CONFIG_HOME/asdf"

# asdf
. "/opt/homebrew/opt/asdf/libexec/asdf.sh"
fpath=(${ASDF_DATA_DIR}/completions $fpath)

# default editor
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="vim"

# path
export PATH=$PATH:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=$PATH:$XDG_CONFIG_HOME/tmux/plugins/tmuxifier/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

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
fi

#thefuck
eval "$(thefuck --alias)"

# tmuxifier
eval "$(tmuxifier init -)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)
