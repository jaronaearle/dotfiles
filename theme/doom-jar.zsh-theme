# Based on bira theme / gnzh theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# colors
local DULL_RED='#af5f5f'
local DULL_GREEN='#5f875f'
local DULL_ORANGE='#d75f00'
local DULL_PURPLE='#875f87'
local DULL_GREY='#b2b2b2'

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER="%F{$DULL_RED}%n%f"
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST="%F{$DULL_GREEN}%M%f" # no SSH
fi


local return_code="%(?..%F{$DULL_ORANGE}%? ↵%f)"

local user_host="${PR_USER}%F{$DULL_GREY} ‹${PR_HOST}%F{$DULL_GREY}›"
local current_dir="%B%F{$DULL_PURPLE}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="╭─${user_host} ${current_dir} \$(ruby_prompt_info) ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}

echo 'DOOM JAR'
