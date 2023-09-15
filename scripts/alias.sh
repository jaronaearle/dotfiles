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
alias cl='z && ls'

# Tool Specific

# - Git
alias clnMain='git branch | grep -v "main" | xargs git branch -D'
alias clnMast='git branch | grep -v "master" | xargs git branch -D'
alias sup='local br=$(git branch --show-current) && g sup $br'

# - Npm
alias snup="npm run test -- -u"
alias nrn='npm run'
alias ni='npm i'
alias nleg='npm install --legacy-peer-deps'
alias nout='npm outdated'
alias nup='npm upgrade'

# Pnpm
alias prn='pnpm run'
alias spup="pnpm run test -u"
alias pi='pnpm i'

# Scripts
alias ls='~/.config/scripts/ls-tree.sh'

# Utilities
alias sya='cp ~/Code/shell/shell-fish-allergy/alias/jar-zsh.sh ~/.oh-my-zsh/custom/alias.zsh && echo "successfully synced alias files"'
alias sz='source ~/.zshrc && echo "successfully sourced ~/.zshrc"'
alias st='tmux source ~/.config/tmux/tmux.conf && echo "successfully sourced ~/.config/tmux/tmux.conf"'
alias nzc='nvim ~/.zshrc'

alias slp="pmset sleepnow"
alias nmodsfind='find . -name "node_modules" -type d -prune | xargs du -chs'

# Navigation
alias nav-code='cd && cd Code/'

echo "alias.sh loaded..."
