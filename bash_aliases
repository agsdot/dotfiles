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
# https://superuser.com/questions/515565/how-to-create-alias-for-minus-sign
alias -- -="cd -" # make it easier to go to the previous directory

alias c='clear'
alias g='git'
alias gbr="git br"
alias gst="git st"
alias p='pwd -P'
alias q='exit'
alias vi='vim'
export EDITOR="vim"

# http://stackoverflow.com/questions/831681/how-to-display-line-numbers-in-less-gnu
export LESS='-RS#3NM~g'

## use emacs key bindings like ctrl-r to search backwards in history
# https://github.com/nsanch/env/blob/master/bash_profile
set -o emacs

#https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

if [[ $platform == 'linux' ]]; then
  alias ls='ls -aF --auto'
  alias emacs="emacs -nw" # to make sure that emacs would load in terminal and not gui app
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
  alias open="xdg-open"
  # alias startx='ssh-agent startx' # something to do with setup of a WM on Archlinux
elif [[ $platform == 'mac' ]]; then
  alias ls='ls -aFG'
fi

# https://unix.stackexchange.com/questions/10689/how-can-i-tell-if-im-in-a-tmux-session-from-a-bash-script
if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  # http://askubuntu.com/questions/125526/vim-in-tmux-display-wrong-colors
  alias vim="TERM=screen-256color vim"
fi

# source local bash alias mods custom to the individual computer
if [ -f ~/.bash_aliases_local ]; then
  source ~/.bash_aliases_local
fi
