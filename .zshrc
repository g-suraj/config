export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="suraj"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Base16 shell bits
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
base16_ocean

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'