# Add this to your bashrc or bash_profile
# if [ -f ~/.bash_aliases ]; then
#     source ~/.bash_aliases
# fi

alias ..="cd .."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias c='clear'
alias g='git'
alias p='pwd -P'
alias q='exit'
alias vi='vim'
export EDITOR="vim"

## use emacs key bindings like ctrl-r to search backwards in history
# https://github.com/nsanch/env/blob/master/bash_profile
set -o emacs
#alias ls='ls -a --color=auto -F'

#https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

if [[ $platform == 'linux' ]]; then
  alias ls='ls -aF'
  alias emacs="emacs -nw" # to make sure that emacs would load in terminal and not gui app
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias open="xdg-open"
  alias startx='ssh-agent startx' # something to do with setup of a WM on Archlinux
elif [[ $platform == 'mac' ]]; then
  alias ls='ls -aFG'
fi

# source local bash alias mods custom to the individual computer
if [ -f ~/.bash_aliases_local ]; then
  source ~/.bash_aliases_local
fi
