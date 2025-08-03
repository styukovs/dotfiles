#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.git-prompt.sh

HISTCONTROL=ignoreboth

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

blue=$(tput setaf 4)
reset=$(tput sgr0)
PS1='\[$blue\]\w\[$reset\]$(__git_ps1 " (%s)") \$ '

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
