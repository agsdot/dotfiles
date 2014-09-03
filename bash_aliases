# Add this to your bashrc or bash_profile
# if [ -f ~/.bash_aliases ]; then
#     source ~/.bash_aliases
# fi

alias vi='vim'
alias startx='ssh-agent startx'
alias ls='ls -a'
alias q='exit'
alias c='clear'
alias g='git'
alias rm='rm -rf'
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

#if [[ $platform == 'linux' ]]; then
   #alias ls='ls -a'
#elif [[ $platform == 'mac' ]]; then
   #alias ls='ls -a'
#fi
