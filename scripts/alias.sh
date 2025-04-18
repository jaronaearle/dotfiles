alias plz='sudo'

# Tools
alias g="git"
alias b="brew"
alias n="npm"
alias y="yarn"
alias pn='pnpm'
alias ts='ts-node'
alias nv='nvim'
alias cg='cargo'
alias t='tmux'
alias tx='tmuxifier'
alias cat='bat'
alias cd='z'
alias ls='eza -l'
alias ip='ipconfig getifaddr en0'
# Tool Specific

# - Git
# alias gcup=function() {
#   git branch | grep -Ev "main|master" | xargs git branch -D
# }
#
# alias sup=function() {
#   local brah="$(git branch --show-current)" && g sup $brah
# }

# - Npm
alias nrn='npm run'
alias ni='npm i'
alias nleg='npm install --legacy-peer-deps'
alias npk='npx npkill'

# Pnpm
alias prn='pnpm run'
alias pi='pnpm i'

# Scripts
# alias ls='~/.config/scripts/ls-tree.sh'
alias gcup='~/.config/scripts/gcup.sh'

# Utilities
alias sz='source ~/.zshrc && echo sourced zshrc!'
alias st='tmux source ~/.config/tmux/tmux.conf && echo sourced tmux config!'

# Tmux
alias ta='tmux attach'

# Navigation
alias xdg="cd $XDG_CONFIG_HOME"
