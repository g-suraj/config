export ZSH="$HOME/.oh-my-zsh"
PATH="/opt/homebrew/opt/findutils/libexec/gnubin:/usr/local/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

ZSH_THEME="suraj"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
HISTSIZE=10000000
SAVEHIST=10000000

# Base16 shell bits
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
base16_ocean

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias \ls="eza"
alias vimrc="vim ~/.config/nvim/init.lua"

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
